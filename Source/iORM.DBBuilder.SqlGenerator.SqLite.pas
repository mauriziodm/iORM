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
  private
  protected
    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function Check_DatabaseExists: Boolean; override;
    procedure Command_CreateDatabase; override;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildSQL_TableList: string; override;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_FieldDefinition(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string; override;
    function Compare_Field(const AMappedField, APhysicalField: IioDBBuilderSchemaField): TioDBBuilderFieldChanges; override;
    function Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String; override;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildSQL_DropIndexByName(const AIndexName: string): string; override;
    function BuildSQL_IndexDetails(const AIndexName: string): string; override;
    function BuildSQL_IndexList(const ATableName: string = ''): string; override;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_CreateFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string; override;

    // ==========================================================
    // DBMS INFO METHODS
    // ----------------------------------------------------------
    function LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo; override;

    // ==========================================================
    // KEY GENERATION CAPABILITY METHODS
    // ----------------------------------------------------------
    function Supports_Identity: Boolean; override;

    // ==========================================================
    // ALTER TABLE CAPABILITY METHODS
    // ----------------------------------------------------------
    function GetInvalidFieldTypeConversions: string; override;
    function Supports_AlterTable: Boolean; override;
  public
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
  iORM.DBBuilder.Factory,
  iORM.DBBuilder.Schema.Field.Physical

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

function TioDBBuilderSqlGenSQLite.Check_DatabaseExists: Boolean;
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
  // Use the computed index name (the same source BuildSQL_DropIndex uses via
  // Translate_SchemaTableAndIndex_To_IndexName) so CREATE and DROP always agree on the name.
  // AIndex.SqlName must NOT be used here: for auto-named indexes (ioIndex without a name) it is empty,
  // whereas the drop path uses the generated IDX_<table>_<fields> name.
  LIndexName := Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);
  LUnique := Translate_SchemaIndex_To_Unique(AIndex);  // Returns ' UNIQUE' or '' (with leading space if present)
  LFieldList := Translate_SchemaIndex_To_CommaSepListOfFieldNames(AIndex);

  // Note: LUnique already includes leading space when present
  Result := Format('CREATE%s INDEX IF NOT EXISTS %s ON %s (%s);', [LUnique, LIndexName, ATable.SqlName, LFieldList]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := ');';
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

function TioDBBuilderSqlGenSQLite.BuildSQL_TableList: string;
begin
  // All user tables. Exclude SQLite's internal tables (name prefixed 'sqlite_', e.g. sqlite_sequence).
  Result := 'SELECT name FROM sqlite_master WHERE type = ''table'' AND name NOT LIKE ''sqlite_%''';
end;

function TioDBBuilderSqlGenSQLite.Compare_Field(const AMappedField, APhysicalField: IioDBBuilderSchemaField): TioDBBuilderFieldChanges;
var
  LPhysical: TioDBBuilderSchemaFieldPhysical;
begin
  // SQLite reconciles only the field type and the NOT NULL constraint: type affinity makes length/
  // precision/scale irrelevant. The raw catalog type lives on the concrete physical node (cast).
  Result := [];
  LPhysical := APhysicalField as TioDBBuilderSchemaFieldPhysical;
  if not SameText(LPhysical.FieldTypeRaw, Translate_SchemaField_To_FieldType(AMappedField, False)) then
    Include(Result, fcType);
  if APhysicalField.FieldNotNull <> AMappedField.FieldNotNull then
    Include(Result, fcNotNull);
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

  // Build the main FK constraint structure using Sql* properties for SQL generation.
  // Constraint NAME from Translate_SchemaTableAndFK_To_FKName (single source of the FK name, shared
  // with the check/drop path), not from AForeignKey.SqlName. On SQLite the FK name is cosmetic
  // (Check_ForeignKeyExists matches structurally by field+reference table, FKs are rebuilt inline),
  // but this keeps the name consistent with Firebird/WithAlterTable and with DROP-by-name.
  LSqlText.Add(
    Format(', CONSTRAINT %s FOREIGN KEY (%s) REFERENCES %s (%s)', [
      Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey),
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

function TioDBBuilderSqlGenSQLite.Supports_AlterTable: Boolean;
begin
  // SQLite cannot restructure a table in place: any structural change goes through the
  // rename-create-copy rebuild, so the PlanBuilder emits its rebuild shape for SQLite.
  Result := False;
end;

end.
