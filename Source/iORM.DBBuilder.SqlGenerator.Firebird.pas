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
unit iORM.DBBuilder.SqlGenerator.Firebird;

interface

uses
  System.Rtti,

  iORM.CommonTypes,
  iORM.DBBuilder.SqlGenerator.Base,
  iORM.DBBuilder.Interfaces,
  iORM.Attributes

  ;


type
  TioDBBuilderSqlGenFirebird = class(TioDBBuilderSqlGenBase)
  private
    function _BuildSQL_CreateOrAddField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): String;
  protected
    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    procedure CreateDatabase; override;
    function DatabaseExists: Boolean; override;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildSQL_TableExists(const ATableName: string): string; override;
    function Supports_AlterNotNull: Boolean; override;
    function Supports_AlterBlobSubtype: Boolean; override;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_CreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string; override;
    function Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String; override;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildSQL_AddPK(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildSQL_DropIndexByName(const AIndexName: string): string; override;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string; override;
    function BuildSQL_IndexList(const ATableName: string = ''): string; override;
    function BuildSQL_IndexDetails(const AIndexName: string): string; override;
    function Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String; override;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string; override;
    function BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string; override;

    // ==========================================================
    // KEY GENERATION RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddSequence(const ASequenceName: String): string; override;
    function BuildSQL_DropSequence(const ASequenceName: string): string; override;
    function BuildSQL_SequenceExists(const ASequenceName: string): string; override;
    function ResolveKeyGenerationStrategy(const ARequestedStrategy: TioKeyGenerationStrategyType): TioKeyGenerationStrategyType; override;
    function Supports_Identity: Boolean; override;
    function Supports_Sequence: Boolean; override;

    // ==========================================================
    // SQL GENERATOR UTILITIES
    // ----------------------------------------------------------
    function GetMaxSqlIdentifierLength: integer; override;
    function LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo; override;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.Context.Properties.Interfaces,
  iORM.Exceptions,
  iORM.DB.Factory,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine,
  iORM.SqlTranslator,
  iORM.DB.Firebird.SqlDataConverter,
  iORM.DB.Consts,
  iORM.DBBuilder.Factory,
  System.Classes

  ;


const
  MAX_IDENTIFIER_NAME_LENGTH = 31;


{ TioDBBuilderSqlGenFirebird }

procedure TioDBBuilderSqlGenFirebird.CreateDatabase;
begin
  // Use FireDAC OpenMode parameter to auto-create database if not exists
  TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := 'Create';
  // Open a connection just to create the database
  TioDbFactory.Connection(ConnectionDefName);
  // Remove the FireDAC parameter to auto-create database
  TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := 'Open';
end;

function TioDBBuilderSqlGenFirebird.DatabaseExists: Boolean;
var
  LOldOpenMode: string;
begin
  // NB: This code also works with ALIAS, the old one doesn't
  // Opening a query here implies opening the connection and if OpenMode param is set to OpenOrCreate or Create
  // in FireDAC component the database will be created, so we need to temporarily set it to 'Open'
  try
    // Save old OpenMode FireDAC option to restore later
    LOldOpenMode := TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'];
    try
      // Disable FireDAC database creation option in the connection (OpenMode = Open)
      TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := 'Open';
      TioQueryEngine.GetRawQuery(ConnectionDefName, 'SELECT * FROM RDB$DATABASE', True);
      Result := True;
    except
      Result := False;
    end;
  finally
    // Restore old OpenMode value
    TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := LOldOpenMode;
  end;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('ALTER TABLE %s ADD %s;', [ATable.SqlName, _BuildSQL_CreateOrAddField(ATable, AField)]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  // Generates: ALTER TABLE <table> ADD CONSTRAINT <name> FOREIGN KEY (...) REFERENCES (...) [ON UPDATE ...] [ON DELETE ...]
  LSqlText := TioDBBuilderFactory.NewSqlText;

  // Build the main FK constraint structure using Sql* properties for SQL generation
  LSqlText.
    AddLine(Format('ALTER TABLE %s', [AForeignKey.SqlDependentTableName])).
    IncIndent.
    AddLine(Format('ADD CONSTRAINT %s', [AForeignKey.SqlName])).
    AddLine(Format('FOREIGN KEY (%s)', [AForeignKey.SqlDependentFieldName])).
    AddLine(Format('REFERENCES %s (%s)', [AForeignKey.SqlReferenceTableName, AForeignKey.SqlReferenceFieldName]));

  // Add optional ON UPDATE clause if specified
  if AForeignKey.OnUpdateAction > fkUnspecified then
    LSqlText.AddLine(Format('ON UPDATE %s', [Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnUpdateAction)]));

  // Add optional ON DELETE clause if specified
  if AForeignKey.OnDeleteAction > fkUnspecified then
    LSqlText.AddLine(Format('ON DELETE %s', [Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnDeleteAction)]));

  LSqlText.
    Add(';');

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
var
  LIndexName, LFieldList, LUnique, LOrientation: String;
begin
  // Generates: CREATE [UNIQUE] [ASC|DESC] INDEX <name> ON <table> (<fields>);
  LIndexName := AIndex.SqlName;  // Already includes delimiters
  LOrientation := Translate_SchemaIndex_To_Orientation(AIndex);  // Returns ' ASC' or ' DESC' (with leading space)
  LUnique := Translate_SchemaIndex_To_Unique(AIndex);  // Returns ' UNIQUE' or '' (with leading space if present)
  LFieldList := Translate_SchemaIndex_To_CommaSepListOfFieldNames(AIndex);

  // Note: LUnique and LIndexOrientation already include leading space when present
  Result := Format('CREATE%s%s INDEX %s ON %s (%s);', [LUnique, LOrientation, LIndexName, ATable.SqlName, LFieldList]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddPK(const ATable: IioDBBuilderSchemaTable): string;
begin
  // Note: PK_%s uses raw name for constraint naming, SqlName for table reference
  Result := Format('ALTER TABLE %s ADD CONSTRAINT PK_%s PRIMARY KEY (%s);', [ATable.SqlName, ATable.Name,
    ATable.PrimaryKeyField.SqlFieldName]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddSequence(const ASequenceName: String): string;
var
  LSequenceName: string;
begin
  LSequenceName := ASequenceName.ToUpper;

  // Validate and shorten if necessary (Firebird max identifier length = 31 characters)
  if IsSqlIdentifierTooLong(LSequenceName) then
    LSequenceName := ShortenIdentifierName(LSequenceName, MaxSqlIdentifierLength);

  Result := Format('CREATE SEQUENCE %s;', [LSequenceName]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  LSqlText := TioDBBuilderFactory.NewSqlText;

  // Type/Length/Precision
  if AField.IsFieldTypeAltered or AField.IsFieldLengthAltered or AField.IsFieldPrecisionAltered then
    LSqlText.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s TYPE %s;', [ATable.SqlName, AField.SqlFieldName, Translate_SchemaField_To_FieldType(AField, True)]));  // True = include attributes

  // Default
  if AField.IsFieldDefaultAltered then
  begin
    if not AField.FieldDefaultExists then
      LSqlText.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s DROP DEFAULT;', [ATable.SqlName, AField.SqlFieldName]))
    else
      LSqlText.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s SET DEFAULT %s;', [ATable.SqlName, AField.SqlFieldName, Translate_SchemaField_To_DefaultValue(AField)]));
  end;

  // NotNull - Version-specific handling
  // Note: SET NOT NULL & DROP NOT NULL available only from Firebird 3.0+
  if AField.IsFieldNotNullAltered then
  begin
    // Check Firebird version before generating SET/DROP NOT NULL syntax
    if not DBMSInfo.IsAtLeast(3, 0) then
      raise EioDBBuilderException.Create(ClassName, 'BuildSQL_AlterField',
        Format('Firebird %s does not support SET/DROP NOT NULL for column "%s.%s". '#13#13 +
          'This feature requires Firebird 3.0 or later. To modify NOT NULL constraints on existing columns, ' +
          'you must either recreate the table manually or upgrade to Firebird 3.0+.',
          [DBMSInfo.Version, ATable.Name, AField.FieldName]));

    LSqlText.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s %s NOT NULL;', [ATable.SqlName, AField.SqlFieldName, IfThen(AField.FieldNotNull, 'SET', 'DROP')]));
  end;

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('CREATE TABLE %s (', [ATable.SqlName]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  LSqlText := TioDBBuilderFactory.NewSqlText;

  LSqlText.
    AddLine('SELECT 1').
    AddLine('FROM RDB$RELATION_FIELDS').
    AddLine(Format('WHERE UPPER(RDB$RELATION_NAME) = UPPER(''%s'')', [EscapeSQLStringLiteral(ATable.Name)])).
    AddLine(Format('  AND UPPER(RDB$FIELD_NAME) = UPPER(''%s'')', [EscapeSQLStringLiteral(AField.FieldName)])).
    Add('  AND RDB$SYSTEM_FLAG = 0');

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  // Returns SQL to retrieve detailed field metadata from the database
  // ATableName is required - returns all fields for that table
  // If AFieldName is also specified, returns details for the specific field only
  //
  // Note: Most field metadata (type, length, precision, scale) is stored in RDB$FIELDS (f),
  // not in RDB$RELATION_FIELDS (rf). Only NULL_FLAG and DEFAULT_SOURCE are in rf.
  // The scale in Firebird is stored as a negative number, so we use ABS() to normalize it.
  // For DECIMAL/NUMERIC detection: types 7, 8, 16 with scale < 0 indicate decimal types,
  // and the subtype distinguishes NUMERIC (1) from DECIMAL (2).
  // For BOOLEAN (type 23, Firebird 3.0+): we map it to INTEGER for ORM compatibility.
  LSqlText := TioDBBuilderFactory.NewSqlText;
  LSqlText
    .AddLine('SELECT rf.RDB$NULL_FLAG AS field_not_null,')
    .AddLine('  f.RDB$CHARACTER_LENGTH AS field_length,')
    .AddLine('  f.RDB$FIELD_PRECISION AS field_precision,')
    .AddLine('  ABS(f.RDB$FIELD_SCALE) AS field_scale,')
    .AddLine('  CASE')
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 261 THEN ''BLOB''')
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 37 THEN ''VARCHAR''')
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 14 THEN ''CHAR''')
    // DECIMAL/NUMERIC: types 7, 8, 16 with scale < 0, subtype 1=NUMERIC, 2=DECIMAL
    .AddLine('    WHEN f.RDB$FIELD_TYPE IN (7, 8, 16) AND COALESCE(f.RDB$FIELD_SCALE, 0) < 0 THEN')
    .AddLine('      CASE COALESCE(f.RDB$FIELD_SUB_TYPE, 0)')
    .AddLine('        WHEN 1 THEN ''NUMERIC''')
    .AddLine('        WHEN 2 THEN ''DECIMAL''')
    .AddLine('        ELSE ''DECIMAL''')
    .AddLine('      END')
    // Integer types (scale = 0)
    // Note: All integer types (SMALLINT, INTEGER, BIGINT) are mapped to 'INTEGER'
    // for ORM compatibility, since iORM uses ioMdInteger for all integer types
    .AddLine('    WHEN f.RDB$FIELD_TYPE IN (7, 8, 16) THEN ''INTEGER''')
    // Floating point types: both FLOAT (10) and DOUBLE PRECISION (27) are mapped
    // to 'FLOAT' for ORM compatibility, since iORM uses ioMdFloat for both
    .AddLine('    WHEN f.RDB$FIELD_TYPE IN (10, 27) THEN ''FLOAT''')
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 12 THEN ''DATE''')
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 13 THEN ''TIME''')
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 35 THEN ''TIMESTAMP''')
    // BOOLEAN (Firebird 3.0+): map to INTEGER for ORM compatibility
    // Note: Type 23 doesn't exist in Firebird 2.x, so this CASE clause is safely ignored
    // on older versions (the CASE will never match type 23 in FB 2.x databases)
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 23 THEN ''INTEGER''')
    .AddLine('    ELSE ''UNKNOWN''')
    .AddLine('  END AS field_type,')
    .AddLine('  f.RDB$FIELD_SUB_TYPE AS field_subtype,')
    .AddLine('  CAST(COALESCE(rf.RDB$DEFAULT_SOURCE, f.RDB$DEFAULT_SOURCE) AS VARCHAR(255)) AS field_default')
    .AddLine('FROM RDB$RELATION_FIELDS rf')
    .AddLine('LEFT JOIN RDB$FIELDS f ON rf.RDB$FIELD_SOURCE = f.RDB$FIELD_NAME')
    .AddLine(Format('WHERE UPPER(rf.RDB$RELATION_NAME) = UPPER(''%s'')', [EscapeSQLStringLiteral(ATableName)]));

  // Add field filter if specified
  if not AFieldName.IsEmpty then
    LSqlText.AddLine(Format('  AND UPPER(rf.RDB$FIELD_NAME) = UPPER(''%s'')', [EscapeSQLStringLiteral(AFieldName)]));

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  // Generates: SELECT query to list foreign keys with their properties (table_name, constraint_name, on_update, on_delete)
  // Generalized FK list query following the same pattern as BuildSQL_IndexList
  // Supports three scenarios:
  //   A. All FKs in database (ATableName = '', AFKName = '')
  //   B. All FKs for a table (ATableName specified, AFKName = '')
  //   C. Specific FK (ATableName specified, AFKName specified)
  // Always returns: table_name, constraint_name, on_update, on_delete
  LSqlText := TioDBBuilderFactory.NewSqlText;

  LSqlText.
    AddLine('SELECT ').
    AddLine('  rc.RDB$RELATION_NAME AS table_name, ').
    AddLine('  rc.RDB$CONSTRAINT_NAME AS constraint_name, ').
    AddLine('  refc.RDB$UPDATE_RULE AS on_update, ').
    AddLine('  refc.RDB$DELETE_RULE AS on_delete ').
    AddLine('FROM RDB$RELATION_CONSTRAINTS rc ').
    AddLine('LEFT JOIN RDB$REF_CONSTRAINTS refc ON rc.RDB$CONSTRAINT_NAME = refc.RDB$CONSTRAINT_NAME ').
    AddLine('WHERE rc.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' ');

  // Add table filter if specified (scenarios B/C)
  if not ATableName.IsEmpty then
    LSqlText.AddLine(Format('  AND UPPER(rc.RDB$RELATION_NAME) = UPPER(''%s'') ', [EscapeSQLStringLiteral(ATableName)]));

  // Add FK name filter if specified (scenario C)
  if not AFKName.IsEmpty then
    LSqlText.AddLine(Format('  AND UPPER(rc.RDB$CONSTRAINT_NAME) = UPPER(''%s'') ', [EscapeSQLStringLiteral(AFKName)]));

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_IndexExistsByName(const AIndexName: string): string;
begin
  // Generates: SELECT query to check if an index exists by name
  Result := Format('SELECT 1 FROM RDB$INDICES WHERE UPPER(RDB$INDEX_NAME) = UPPER(''%s'')', [EscapeSQLStringLiteral(AIndexName)]);
end;

function TioDBBuilderSqlGenFirebird.Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String;
begin
  // Firebird does not support ASC/DESC orientation in field list
  Result := inherited;
  Result := Result.Replace(' ASC', '').Replace(' DESC', '');
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_IndexList(const ATableName: string): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  // Generates: SELECT query to list indexes with their properties (name, unique flag, orientation)
  // Base query: all non-system indexes with basic info (name, unique, orientation)
  LSqlText := TioDBBuilderFactory.NewSqlText;

  LSqlText.
    AddLine('SELECT RDB$INDEX_NAME, RDB$UNIQUE_FLAG, RDB$INDEX_TYPE ').
    AddLine('FROM RDB$INDICES ').
    AddLine('WHERE RDB$SYSTEM_FLAG = 0');

  // Add table filter if specified
  if not ATableName.IsEmpty then
    LSqlText.AddLine(Format(' AND UPPER(RDB$RELATION_NAME) = UPPER(''%s'')', [EscapeSQLStringLiteral(ATableName)]));

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_IndexDetails(const AIndexName: string): string;
var
  LSqlText: IioDBBuilderSqlText;
begin
  // Generates: SELECT query to retrieve field details for a specific index (field names and positions)
  LSqlText := TioDBBuilderFactory.NewSqlText;

  LSqlText.
    AddLine('SELECT').
    AddLine('  RDB$FIELD_NAME,').
    AddLine('  RDB$FIELD_POSITION').
    AddLine('FROM RDB$INDEX_SEGMENTS').
    AddLine(Format('WHERE UPPER(RDB$INDEX_NAME) = UPPER(''%s'')', [EscapeSQLStringLiteral(AIndexName)])).
    Add('ORDER BY RDB$FIELD_POSITION');

  Result := LSqlText.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_SequenceExists(const ASequenceName: string): string;
var
  LSequenceName: string;
begin
  LSequenceName := ASequenceName.ToUpper;

  // Validate and shorten if necessary (Firebird max identifier length = 31 characters)
  if IsSqlIdentifierTooLong(LSequenceName) then
    LSequenceName := ShortenIdentifierName(LSequenceName, MaxSqlIdentifierLength);

  // Carlo Marona (2024-10-15): Added condition to exclude system generators
  Result := Format('select count(*) from rdb$generators where (UPPER(rdb$generator_name) = UPPER(''%s'')) and (RDB$SYSTEM_FLAG = 0)', [EscapeSQLStringLiteral(LSequenceName)]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_TableExists(const ATableName: string): string;
begin
  // Carlo Marona (2024-10-15): Added condition to exclude system relations
  Result := Format('select RDB$RELATION_NAME from RDB$RELATIONS where (UPPER(RDB$RELATION_NAME) = UPPER(''%s'')) and (RDB$SYSTEM_FLAG = 0)',
    [EscapeSQLStringLiteral(ATableName)]);
end;

function TioDBBuilderSqlGenFirebird.GetMaxSqlIdentifierLength: integer;
begin
  Result := MAX_IDENTIFIER_NAME_LENGTH;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_CreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := _BuildSQL_CreateOrAddField(ATable, AField);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string;
begin
  // Generates: ALTER TABLE <table> DROP CONSTRAINT <fk_name>;
  Result := Format('ALTER TABLE %s DROP CONSTRAINT %s;', [ATableName, AForeignKeyName]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_DropIndexByName(const AIndexName: string): string;
begin
  // Generates: DROP INDEX <name>;
  Result := Format('DROP INDEX %s;', [AIndexName]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_DropSequence(const ASequenceName: string): string;
var
  LSequenceName: string;
begin
  LSequenceName := ASequenceName.ToUpper;

  // Validate and shorten if necessary (Firebird max identifier length = 31 characters)
  if IsSqlIdentifierTooLong(LSequenceName) then
    LSequenceName := ShortenIdentifierName(LSequenceName, MaxSqlIdentifierLength);

  Result := Format('DROP SEQUENCE %s;', [LSequenceName]);
end;


function TioDBBuilderSqlGenFirebird.BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := ');';
end;

function TioDBBuilderSqlGenFirebird._BuildSQL_CreateOrAddField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // Default
  LDefault := IfThen(AField.FieldDefaultExists, ' DEFAULT ' + Translate_SchemaField_To_DefaultValue(AField), '');

  // Not Null
  LNotNull := IfThen(AField.FieldNotNull, ' NOT NULL', '');

  // If primary key...
  if AField.PrimaryKey then
  begin
    // Use IDENTITY syntax for Firebird 3.0+ when explicitly requested
    if ATable.UsesIdentityForKeyGeneration then
      Result := Format('%s INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL', [AField.SqlFieldName])
    else
      Result := Format('%s INTEGER NOT NULL', [AField.SqlFieldName]);
  end
  // ...else continue as regular field
  else
    Result := Format('%s %s%s%s', [AField.SqlFieldName, Translate_SchemaField_To_FieldType(AField, True), LDefault, LNotNull]);  // True = include attributes
end;

function TioDBBuilderSqlGenFirebird.Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String;
var
  LSubtype: Integer;
begin
  case AField.FieldType of
    ioMdVarchar:
    begin
      Result := 'VARCHAR';
      if AIncludeTypeAttributes then
        Result := Result + Format('(%d)', [AField.FieldLength]);
    end;
    ioMdChar:
    begin
      Result := 'CHAR';
      if AIncludeTypeAttributes then
        Result := Result + Format('(%d)', [AField.FieldLength]);
    end;
    ioMdInteger:
      Result := 'INTEGER';
    ioMdFloat:
      Result := 'FLOAT';
    ioMdDate:
      Result := 'DATE';
    ioMdTime:
      Result := 'TIME';
    ioMdDateTime:
      Result := 'TIMESTAMP';
    ioMdDecimal:
    begin
      Result := 'DECIMAL';
      if AIncludeTypeAttributes then
        Result := Result + Format('(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    end;
    ioMdNumeric:
    begin
      Result := 'NUMERIC';
      if AIncludeTypeAttributes then
        Result := Result + Format('(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    end;
    ioMdBoolean:
      Result := 'INTEGER';
    ioMdBinary:
    begin
      Result := 'BLOB';
      if AIncludeTypeAttributes then
      begin
        // Validate Subtype if specified
        if not AField.FieldSubtype.IsEmpty then
        begin
          LSubtype := StrToIntDef(AField.FieldSubtype, -1);
          if (LSubtype < 0) or (LSubtype > 32767) then
            raise EioDBBuilderException.Create(ClassName, 'Translate_SchemaField_To_FieldType',
              Format('Invalid BLOB SUB_TYPE "%s" for field "%s". Valid range: 0-32767 (0=binary, 1=text, 2+=user-defined)',
                [AField.FieldSubtype, AField.FieldName]));
        end;
        Result := Result + Format(' SUB_TYPE %s', [IfThen(AField.FieldSubtype.IsEmpty, '0', AField.FieldSubtype)]);
      end;
    end;
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioDBBuilderException.Create(ClassName, 'Translate_SchemaField_To_FieldType', 'Wrong Metadata_FieldType');
  end;
end;

function TioDBBuilderSqlGenFirebird.LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
var
  LQuery: IioQuery;
  LRaw, LVersion: String;
  LParts: TArray<string>;
  LMajorVersion, LMinorVersion: Integer;
begin
  // Default values (conservative: assume Firebird 2.0 if detection fails)
  LVersion := '2.0.0';
  LMajorVersion := 2;
  LMinorVersion := 0;

  // The try-except block is necessary because RDB$GET_CONTEXT is not supported in Firebird 2.0
  // and earlier versions. When running on older Firebird versions, the query will raise an exception
  // which we catch and handle gracefully by falling back to the default values set above.
  try
    // Query the database for version info using RDB$GET_CONTEXT (Firebird 2.1+)
    LQuery := TioQueryEngine.GetRawQuery(
      ConnectionDefName,
      'SELECT RDB$GET_CONTEXT(''SYSTEM'', ''ENGINE_VERSION'') AS VERSION FROM RDB$DATABASE',
      True
    );

    if not LQuery.Eof then
    begin
      LRaw := LQuery.Fields.FieldByName('VERSION').AsString.Trim;
      LVersion := LRaw;

      // Parse version: '3.0.10' -> Major=3, Minor=0
      LParts := LVersion.Split(['.']);
      if Length(LParts) >= 2 then
      begin
        LMajorVersion := StrToIntDef(LParts[0], 2);
        LMinorVersion := StrToIntDef(LParts[1], 0);
      end;
    end
    else
      LRaw := '';
  except
    // Firebird 2.0 doesn't support RDB$GET_CONTEXT
    LRaw := '';
  end;

  Result := TioDBBuilderFactory.NewSchemaRDBMSInfo(
    'Firebird',
    LRaw,
    LVersion,
    LMajorVersion,
    LMinorVersion
  );
end;

function TioDBBuilderSqlGenFirebird.Supports_Identity: Boolean;
begin
  // Firebird supports IDENTITY columns from version 3.0+
  Result := DBMSInfo.IsAtLeast(3, 0);
end;

function TioDBBuilderSqlGenFirebird.Supports_Sequence: Boolean;
begin
  // Firebird has always supported sequences (called generators)
  Result := True;
end;

function TioDBBuilderSqlGenFirebird.ResolveKeyGenerationStrategy(const ARequestedStrategy: TioKeyGenerationStrategyType): TioKeyGenerationStrategyType;
begin
  // Resolves kgsAuto to the DBMS-specific default strategy.
  // Firebird default is kgsSequence (generators) for backward compatibility,
  // even though Firebird 3.0+ also supports Identity columns.
  // If a specific strategy is requested, it is returned unchanged.
  if ARequestedStrategy = kgsAuto then
    Result := kgsSequence
  else
    Result := ARequestedStrategy;
end;

function TioDBBuilderSqlGenFirebird.Supports_AlterNotNull: Boolean;
begin
  // Firebird: SET NOT NULL / DROP NOT NULL is only supported from Firebird 3.0+
  Result := DBMSInfo.IsAtLeast(3, 0);
end;

function TioDBBuilderSqlGenFirebird.Supports_AlterBlobSubtype: Boolean;
begin
  // Firebird: BLOB subtype changes are NOT permitted
  Result := False;
end;

end.
