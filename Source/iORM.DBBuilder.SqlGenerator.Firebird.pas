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
  iORM.DBBuilder.SqlGenerator.Firebird.Interfaces,
  iORM.DBBuilder.Interfaces,
  iORM.Attributes

  ;


type
  TioDBBuilderSqlGenFirebird = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGeneratorFirebird)
  private
    function _BuildSQL_CreateOrAddField(const AField: IioDBBuilderSchemaField): String;
  protected
    function GetMaxSqlIdentifierLength: integer; override;
    function GetMinSqlIdentifierLength: integer; override;
    // Database
    procedure CreateDatabase; override;
    function DatabaseExists: Boolean; override;
    // Tables
    function BuildAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildTableExistsSql(const ATableName: string): string; override;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddField(const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildSQL_CreateField(const AField: IioDBBuilderSchemaField): string; override;
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

    // Sequences
    function BuildAddSequenceSql(const ASequenceName: String; const ACreatingNewDatabase: boolean): string;
    function BuildDropSequenceSql(const ASequenceName: string): string;
    function BuildSequenceExistsSql(const ASequenceName: string): string;
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
  iORM.TextBuilder.Interfaces, System.Classes

  ;


const
  MAX_IDENTIFIER_NAME_LENGTH = 31;
  MIN_IDENTIFIER_NAME_LENGTH = 27;


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

function TioDBBuilderSqlGenFirebird.BuildSQL_AddField(const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('ADD %s', [_BuildSQL_CreateOrAddField(AField)]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LTextBuilder: IioTextBuilder;
begin
  // Generates: ALTER TABLE <table> ADD CONSTRAINT <name> FOREIGN KEY (...) REFERENCES (...) [ON UPDATE ...] [ON DELETE ...]
  LTextBuilder := NewTextBuilder;

  // Build the main FK constraint structure
  LTextBuilder.
    AddLine(Format('ALTER TABLE %s', [AForeignKey.DependentTableName])).
    IncIndent.
    Add(Format('ADD CONSTRAINT %s', [Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey)]), True).
    Add(Format(' FOREIGN KEY (%s)', [AForeignKey.DependentFieldName])).
    Add(Format(' REFERENCES %s (%s)', [AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]));

  // Add optional ON UPDATE clause if specified
  if AForeignKey.OnUpdateAction > fkUnspecified then
    LTextBuilder.Add(Format(' ON UPDATE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction)]));

  // Add optional ON DELETE clause if specified
  if AForeignKey.OnDeleteAction > fkUnspecified then
    LTextBuilder.Add(Format(' ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]));

  LTextBuilder.
    DecIndent.
    AddLine(';');

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
var
  LIndexName, LFieldList, LUnique, LOrientation: String;
begin
  // Generates: CREATE [UNIQUE] [ASC|DESC] INDEX <name> ON <table> (<fields>);
  LIndexName := Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);
  LOrientation := Translate_SchemaIndex_To_Orientation(AIndex);  // Returns ' ASC' or ' DESC' (with leading space)
  LUnique := Translate_SchemaIndex_To_Unique(AIndex);  // Returns ' UNIQUE' or '' (with leading space if present)
  LFieldList := Translate_SchemaIndex_To_CommaSepListOfFieldNames(AIndex);

  // Note: LUnique and LIndexOrientation already include leading space when present
  Result := Format('CREATE%s%s INDEX %s ON %s (%s);', [LUnique, LOrientation, LIndexName, ATable.Name, LFieldList]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AddPK(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('ALTER TABLE %s ADD CONSTRAINT PK_%s PRIMARY KEY (%s);', [ATable.Name, ATable.Name,
    ATable.PrimaryKeyField.FieldName]);
end;

function TioDBBuilderSqlGenFirebird.BuildAddSequenceSql(const ASequenceName: String; const ACreatingNewDatabase: boolean): string;
begin
  Result := Format('CREATE SEQUENCE %s;', [ASequenceName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): string;
var
  LTextBuilder: IioTextBuilder;
begin
  LTextBuilder := NewTextBuilder;

  // Type/Length/Precision
  if AField.IsFieldTypeAltered or AField.IsFieldLengthAltered or AField.IsFieldPrecisionAltered then
    LTextBuilder.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s TYPE %s;', [ATable.Name, AField.FieldName, Translate_SchemaField_To_FieldType(AField, True)]));  // True = include attributes

  // Default
  if AField.IsFieldDefaultAltered then
  begin
    if not AField.FieldDefaultExists then
      LTextBuilder.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s DROP DEFAULT;', [ATable.Name, AField.FieldName]))
    else
      LTextBuilder.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s SET DEFAULT %s;', [ATable.Name, AField.FieldName, Translate_SchemaField_To_DefaultValue(AField)]));
  end;

  // NotNull
  // Note: SET NOT NULL & DROP NOT NULL available only from firebird 3
  if AField.IsFieldNotNullAltered then
    LTextBuilder.Add(Format('ALTER TABLE %s ALTER COLUMN %s %s NOT NULL;', [ATable.Name,  AField.FieldName, IfThen(AField.FieldNotNull, 'SET', 'DROP')]));

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildAlterTAbleSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  BuildBeginAlterTableSql(ATable);
  // Build fields
  BuildEndAlterTableSql(ATable);
end;

function TioDBBuilderSqlGenFirebird.BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('ALTER TABLE %s', [ATable.Name]);
end;

function TioDBBuilderSqlGenFirebird.BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('CREATE TABLE %s (', [ATable.Name]);
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
var
  LTextBuilder: IioTextBuilder;
begin
  LTextBuilder := NewTextBuilder;

  LTextBuilder.
    AddLine('SELECT 1').
    AddLine('FROM RDB$RELATION_FIELDS').
    AddLine(Format('WHERE UPPER(RDB$RELATION_NAME) = UPPER(''%s'')', [ATable.Name])).
    AddLine(Format('  AND UPPER(RDB$FIELD_NAME) = UPPER(''%s'')', [AField.FieldName])).
    Add('  AND RDB$SYSTEM_FLAG = 0');

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string;
var
  LTextBuilder: IioTextBuilder;
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
  LTextBuilder := NewTextBuilder;
  LTextBuilder
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
    .AddLine('    WHEN f.RDB$FIELD_TYPE = 23 THEN ''INTEGER''')
    .AddLine('    ELSE ''UNKNOWN''')
    .AddLine('  END AS field_type,')
    .AddLine('  f.RDB$FIELD_SUB_TYPE AS field_subtype,')
    .AddLine('  CAST(COALESCE(rf.RDB$DEFAULT_SOURCE, f.RDB$DEFAULT_SOURCE) AS VARCHAR(255)) AS field_default')
    .AddLine('FROM RDB$RELATION_FIELDS rf')
    .AddLine('LEFT JOIN RDB$FIELDS f ON rf.RDB$FIELD_SOURCE = f.RDB$FIELD_NAME')
    .AddLine(Format('WHERE UPPER(rf.RDB$RELATION_NAME) = UPPER(''%s'')', [ATableName]));

  // Add field filter if specified
  if not AFieldName.IsEmpty then
    LTextBuilder.AddLine(Format('  AND UPPER(rf.RDB$FIELD_NAME) = UPPER(''%s'')', [AFieldName]));

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string;
var
  LTextBuilder: IioTextBuilder;
begin
  // Generates: SELECT query to list foreign keys with their properties (table_name, constraint_name, on_update, on_delete)
  // Generalized FK list query following the same pattern as BuildSQL_IndexList
  // Supports three scenarios:
  //   A. All FKs in database (ATableName = '', AFKName = '')
  //   B. All FKs for a table (ATableName specified, AFKName = '')
  //   C. Specific FK (ATableName specified, AFKName specified)
  // Always returns: table_name, constraint_name, on_update, on_delete
  LTextBuilder := NewTextBuilder;

  LTextBuilder.
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
    LTextBuilder.AddLine(Format('  AND UPPER(rc.RDB$RELATION_NAME) = UPPER(''%s'') ', [ATableName]));

  // Add FK name filter if specified (scenario C)
  if not AFKName.IsEmpty then
    LTextBuilder.AddLine(Format('  AND UPPER(rc.RDB$CONSTRAINT_NAME) = UPPER(''%s'') ', [AFKName]));

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_IndexExistsByName(const AIndexName: string): string;
begin
  // Generates: SELECT query to check if an index exists by name
  Result := Format('SELECT 1 FROM RDB$INDICES WHERE UPPER(RDB$INDEX_NAME) = UPPER(''%s'')', [AIndexName]);
end;

function TioDBBuilderSqlGenFirebird.Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String;
begin
  // Firebird does not support ASC/DESC orientation in field list
  Result := inherited;
  Result := Result.Replace(' ASC', '').Replace(' DESC', '');
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_IndexList(const ATableName: string): string;
var
  LTextBuilder: IioTextBuilder;
begin
  // Generates: SELECT query to list indexes with their properties (name, unique flag, orientation)
  // Base query: all non-system indexes with basic info (name, unique, orientation)
  LTextBuilder := NewTextBuilder;

  LTextBuilder.
    AddLine('SELECT RDB$INDEX_NAME, RDB$UNIQUE_FLAG, RDB$INDEX_TYPE ').
    AddLine('FROM RDB$INDICES ').
    AddLine('WHERE RDB$SYSTEM_FLAG = 0');

  // Add table filter if specified
  if not ATableName.IsEmpty then
    LTextBuilder.AddLine(Format(' AND UPPER(RDB$RELATION_NAME) = UPPER(''%s'')', [ATableName]));

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_IndexDetails(const AIndexName: string): string;
var
  LTextBuilder: IioTextBuilder;
begin
  // Generates: SELECT query to retrieve field details for a specific index (field names and positions)
  LTextBuilder := NewTextBuilder;

  LTextBuilder.
    AddLine('SELECT').
    AddLine('  RDB$FIELD_NAME,').
    AddLine('  RDB$FIELD_POSITION').
    AddLine('FROM RDB$INDEX_SEGMENTS').
    AddLine(Format('WHERE UPPER(RDB$INDEX_NAME) = UPPER(''%s'')', [AIndexName])).
    Add('ORDER BY RDB$FIELD_POSITION');

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildSequenceExistsSql(const ASequenceName: string): string;
begin
  // Carlo Marona (2025-10-15): Added condition to exclude system generators
  Result := Format('select count(*) from rdb$generators where (UPPER(rdb$generator_name) = UPPER(''%s'')) and (RDB$SYSTEM_FLAG = 0)', [ASequenceName]);
end;

function TioDBBuilderSqlGenFirebird.BuildTableExistsSql(const ATableName: string): string;
begin
  // Carlo Marona (2025-10-15): Added condition to exclude system relations
  Result := Format('select RDB$RELATION_NAME from RDB$RELATIONS where (UPPER(RDB$RELATION_NAME) = UPPER(''%s'')) and (RDB$SYSTEM_FLAG = 0)',
    [ATableName]);
end;

function TioDBBuilderSqlGenFirebird.GetMaxSqlIdentifierLength: integer;
begin
  Result := MAX_IDENTIFIER_NAME_LENGTH;
end;

function TioDBBuilderSqlGenFirebird.GetMinSqlIdentifierLength: integer;
begin
  Result := MIN_IDENTIFIER_NAME_LENGTH;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_CreateField(const AField: IioDBBuilderSchemaField): string;
begin
  Result := _BuildSQL_CreateOrAddField(AField);
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

function TioDBBuilderSqlGenFirebird.BuildDropSequenceSql(const ASequenceName: string): string;
begin
  Result := Format('DROP SEQUENCE %s;', [ASequenceName]);
end;

function TioDBBuilderSqlGenFirebird.BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := ';';
end;

function TioDBBuilderSqlGenFirebird.BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := ');';
end;

function TioDBBuilderSqlGenFirebird._BuildSQL_CreateOrAddField(const AField: IioDBBuilderSchemaField): String;
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
    Result := Format('%s INTEGER NOT NULL', [AField.FieldName])
  // ...else continue as regular field
  else
    Result := Format('%s %s%s%s', [AField.FieldName, Translate_SchemaField_To_FieldType(AField, True), LDefault, LNotNull]);  // True = include attributes
end;

function TioDBBuilderSqlGenFirebird.Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String;
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
        Result := Result + Format(' SUB_TYPE %s', [IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType)]);
    end;
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioDBBuilderException.Create(ClassName, 'Translate_SchemaField_To_FieldType', 'Wrong Metadata_FieldType');
  end;
end;

end.
