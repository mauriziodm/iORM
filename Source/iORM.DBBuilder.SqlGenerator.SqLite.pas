{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.DBBuilder.SqlGenerator.SqLite;

interface

uses
  System.Rtti,

  iORM.DBBuilder.SqlGenerator.Base,
  iORM.DBBuilder.Interfaces,
  iORM.Attributes,
  iORM.CommonTypes

  ;

type
  TioDBBuilderSqlGenSQLite = class(TioDBBuilderSqlGenBase)
  protected
    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    procedure Command_CreateDatabase; override;
    function Command_DatabaseExists: Boolean; override;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildSQL_TableExists(const ATableName: string): string; override;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_FieldDefinition(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string; override;
    function GetInvalidFieldTypeConversions: string; override;
    function Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String; override;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildSQL_DropIndexByName(const AIndexName: string): string; override;
    function BuildSQL_IndexDetails(const AIndexName: string): string; override;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string; override;
    function BuildSQL_IndexList(const ATableName: string = ''): string; override;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_CreateFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string; override;

    // ==========================================================
    // KEY GENERATION RELATED METHODS
    // ----------------------------------------------------------
    function Supports_Identity: Boolean; override;

    // ==========================================================
    // SQL GENERATOR UTILITIES
    // ----------------------------------------------------------
    function LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo; override;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,

  iORM.DB.Interfaces,
  iORM.DB.Factory,
  iORM.DB.ConnectionContainer,
  iORM.DB.QueryEngine,
  iORM.Context.Properties.Interfaces,
  iORM.Exceptions,
  iORM.SqlTranslator,
  iORM.DB.SqLite.SqlDataConverter,
  iORM.DBBuilder.Factory

  ;

const
  // SQLite-specific field-type conversions that cannot be applied safely/automatically.
  INVALID_FIELDTYPE_CONVERSIONS =
    '[text->integer][text->real][text->numeric][text->blob][real->integer][real->blob]' +
    '[numeric->integer][numeric->blob][blob->real][blob->numeric][blob->integer][blob->text]';

{ TioDBBuilderSqlGenSQLite }

function TioDBBuilderSqlGenSQLite.GetInvalidFieldTypeConversions: string;
begin
  Result := INVALID_FIELDTYPE_CONVERSIONS;
end;

procedure TioDBBuilderSqlGenSQLite.Command_CreateDatabase;
begin
  // SQLite creates the database file automatically when a connection is opened
  TioDbFactory.Connection(ConnectionDefName);
end;

function TioDBBuilderSqlGenSQLite.Command_DatabaseExists: Boolean;
begin
  Result := FileExists(TioConnectionManager.GetDatabaseFileName(ConnectionDefName));
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_FieldDefinition(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
var
  LDefault: string;
  LNotNull: string;
begin
  // Default
  LDefault := IfThen(AField.FieldDefaultExists, ' DEFAULT ' + Translate_SchemaField_To_DefaultValue(AField), '');

  // Not Null
  LNotNull := IfThen(AField.FieldNotNull, ' NOT NULL', ' NULL');

  // If primary key...
  // Note: SQLite uses INTEGER PRIMARY KEY which is automatically auto-increment
  if AField.PrimaryKey then
    Result := Format('%s INTEGER PRIMARY KEY NOT NULL', [AField.SqlFieldName])
  // ...else continue as regular field
  else
    Result := Format('%s %s%s%s', [AField.SqlFieldName, Translate_SchemaField_To_FieldType(AField, False), LDefault, LNotNull]);  // False = does not include attributes
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
var
  LIndexName, LFieldList, LUnique: String;
begin
  // Generates: CREATE [UNIQUE] INDEX IF NOT EXISTS <name> ON <table> (<fields>);
  LIndexName := AIndex.SqlName;  // Already includes delimiters
  LUnique := Translate_SchemaIndex_To_Unique(AIndex);  // Returns ' UNIQUE' or '' (with leading space if present)
  LFieldList := Translate_SchemaIndex_To_CommaSepListOfFieldNames(AIndex);

  // Note: LUnique already includes leading space when present
  Result := Format('CREATE%s INDEX IF NOT EXISTS %s ON %s (%s);', [LUnique, LIndexName, ATable.SqlName, LFieldList]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := ');';
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  // SQLite limitation: PRAGMA table_info returns ALL columns for a table - cannot filter by column name
  // The AField parameter is accepted for interface consistency but IGNORED in the query
  // Strategy layer must manually filter results to find the specific field by name
  Result := Format('pragma table_info(''%s'')', [EscapeSQLStringLiteral(ATable.Name)]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string;
begin
  // Returns SQL to retrieve detailed field metadata from the database
  // ATableName is required - returns all fields for that table
  // If AFieldName is also specified, returns all fields anyway (SQLite cannot filter by field name)
  //
  // SQLite limitation: PRAGMA table_info returns ALL columns for a table - cannot filter by column name
  // Note: AFieldName parameter is IGNORED because SQLite doesn't support field name filtering
  //       PRAGMA always returns ALL fields for the table, Strategy must filter manually
  Result := Format('PRAGMA table_info(''%s'')', [EscapeSQLStringLiteral(ATableName)]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_IndexExistsByName(const AIndexName: string): string;
begin
  // Generates: SELECT query to check if an index exists by name
  Result := Format('SELECT 1 FROM sqlite_master WHERE type = ''index'' AND name = ''%s''', [EscapeSQLStringLiteral(AIndexName)]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_IndexList(const ATableName: string): string;
begin
  // Generates: SELECT query to list indexes from sqlite_master with their SQL definitions
  // Query sqlite_master for all index info including SQL definition
  // We use sqlite_master instead of PRAGMA index_list because:
  // - PRAGMA provides only the unique flag, not orientation (ASC/DESC)
  // - sqlite_master.sql contains the full CREATE INDEX statement with both UNIQUE and orientation
  // - This allows extracting all needed info in one query without type casting
  // Note: iORM applies the same orientation to all fields in an index (no mixed ASC/DESC per field)
  // Note: sql IS NOT NULL excludes auto-generated indexes for PK/UNIQUE constraints
  Result := 'SELECT name, tbl_name, sql FROM sqlite_master WHERE type = ''index'' AND sql IS NOT NULL';
  if not ATableName.IsEmpty then
    Result := Result + Format(' AND tbl_name = ''%s''', [EscapeSQLStringLiteral(ATableName)]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_IndexDetails(const AIndexName: string): string;
begin
  // Generates: PRAGMA index_info(<name>) to retrieve field details for a specific index
  // PRAGMA index_info returns columns info for the index
  Result := Format('PRAGMA index_info(''%s'')', [EscapeSQLStringLiteral(AIndexName)]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string;
begin
  // Generates: PRAGMA foreign_key_list(<table>) to list foreign keys for a table
  // SQLite limitation: PRAGMA foreign_key_list accepts ONLY table name - cannot filter by FK name
  // Note: AFKName parameter is IGNORED because SQLite doesn't support FK name filtering
  //       PRAGMA always returns ALL FKs for the table, Strategy must filter manually

  // Validate: ATableName is required for SQLite (unlike Firebird which can query all FKs)
  if ATableName.IsEmpty then
    raise EioDBBuilderException.Create(ClassName, 'BuildSQL_FKList',
      'SQLite requires a table name for PRAGMA foreign_key_list.'#13#13'Cannot list all foreign keys at once.');

  Result := Format('PRAGMA foreign_key_list(''%s'')', [EscapeSQLStringLiteral(ATableName)]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_DropIndexByName(const AIndexName: string): string;
begin
  // Generates: DROP INDEX IF EXISTS <index_name>;
  Result := Format('DROP INDEX IF EXISTS %s;', [AIndexName]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_TableExists(const ATableName: string): string;
begin
  Result := Format('pragma table_info(''%s'')', [EscapeSQLStringLiteral(ATableName)]);
end;

/// <remarks>
/// SQLite-specific implementation: This method ignores the AIncludeTypeAttributes parameter.
/// SQLite uses a type affinity system and does not require or support length, precision, or scale
/// specifications in type names. All field types return their simple base type name (e.g., "TEXT",
/// "NUMERIC", "BLOB", "INTEGER", "REAL") regardless of the AIncludeTypeAttributes parameter value.
/// </remarks>
function TioDBBuilderSqlGenSQLite.Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String;
begin
  case AField.FieldType of
    ioMdVarchar:
      Result := 'TEXT';
    ioMdChar:
      Result := 'TEXT';
    ioMdInteger:
      Result := 'INTEGER';
    ioMdFloat:
      Result := 'REAL';
    ioMdDate:
      Result := 'REAL'; // Delphi TDateTime uses Julian day numbers (floating-point)
    ioMdTime:
      Result := 'REAL'; // Delphi TDateTime uses Julian day numbers (floating-point)
    ioMdDateTime:
      Result := 'REAL'; // Delphi TDateTime uses Julian day numbers (floating-point)
    ioMdDecimal:
      Result := 'NUMERIC';
    ioMdNumeric:
      Result := 'NUMERIC';
    ioMdBoolean:
      Result := 'INTEGER'; // 0/1 values stored as integer
    ioMdBinary:
      Result := 'BLOB';
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioDBBuilderException.Create(ClassName, 'Translate_SchemaField_To_FieldType', 'Wrong Metadata_FieldType');
  end;
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_CreateFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  // Generates: , CONSTRAINT <name> FOREIGN KEY (...) REFERENCES (...) [ON UPDATE ...] [ON DELETE ...] DEFERRABLE INITIALLY DEFERRED
  // Note: SQLite FK constraints are added within CREATE TABLE, not via ALTER TABLE
  LSqlText := TioDBBuilderFactory.NewSqlText;

  // Build the main FK constraint structure using Sql* properties for SQL generation
  LSqlText.Add(
    Format(', CONSTRAINT %s FOREIGN KEY (%s) REFERENCES %s (%s)', [
      AForeignKey.SqlName,
      AForeignKey.SqlDependentFieldName,
      AForeignKey.SqlReferenceTableName,
      AForeignKey.SqlReferenceFieldName
    ])
  );

  // Add optional ON UPDATE clause if specified
  if AForeignKey.OnUpdateAction > fkUnspecified then
    LSqlText.Add(Format(' ON UPDATE %s', [Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnUpdateAction)]));

  // Add optional ON DELETE clause if specified
  if AForeignKey.OnDeleteAction > fkUnspecified then
    LSqlText.Add(Format(' ON DELETE %s', [Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnDeleteAction)]));

  // SQLite-specific: make FK constraint deferrable to avoid constraint violations during complex updates
  LSqlText.
    Add(' DEFERRABLE INITIALLY DEFERRED');

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('CREATE TABLE %s (', [ATable.SqlName]);
end;

function TioDBBuilderSqlGenSQLite.LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
var
  LQuery: IioQuery;
  LRaw, LVersion: String;
  LMajorVersion, LMinorVersion: Integer;
  LParts: TArray<string>;
begin
  // Query the database for version info
  LQuery := TioQueryEngine.GetRawQuery(
    ConnectionDefName,
    'SELECT sqlite_version() AS VERSION',
    True
  );

  if not LQuery.Eof then
    LRaw := LQuery.Fields.FieldByName('VERSION').AsString.Trim
  else
    LRaw := '';

  LVersion := LRaw;
  LMajorVersion := 0;
  LMinorVersion := 0;

  // Parse version: '3.39.4' -> Major=3, Minor=39
  LParts := LVersion.Split(['.']);
  if Length(LParts) >= 2 then
  begin
    LMajorVersion := StrToIntDef(LParts[0], 0);
    LMinorVersion := StrToIntDef(LParts[1], 0);
  end;

  Result := TioDBBuilderFactory.NewSchemaRDBMSInfo(
    'SQLite',
    LRaw,
    LVersion,
    LMajorVersion,
    LMinorVersion
  );
end;

function TioDBBuilderSqlGenSQLite.Supports_Identity: Boolean;
begin
  // SQLite uses INTEGER PRIMARY KEY which is an alias for rowid (auto-increment)
  Result := True;
end;

end.
