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
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
  protected
    function GetMaxSqlIdentifierLength: integer; override;
    function GetMinSqlIdentifierLength: integer; override;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const AExcludeTypeAttributes: boolean): String; override;
    // Database
    procedure CreateDatabase; override;
    function DatabaseExists: Boolean; override;
    // Tables
    function BuildAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string; override;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildTableExistsSql(const ATableName: string): string; override;
    // Fields
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAlterFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildRecreateFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    // PrimaryKeys
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string; override;
    // Indexes
    function BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildSQL_DropIndexByName(const AIndexName: string): string; override;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string; override;
    function BuildSQL_IndexList(const ATableName: string = ''): string; override;
    function BuildSQL_IndexDetails(const AIndexName: string): string; override;
    function Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String; override;
    // ForeignKeys
    function BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string; override;
    function BuildSQL_FKExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string; override;
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

function TioDBBuilderSqlGenFirebird.BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('ADD %s', [InternalCreateField(AField)]);
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

function TioDBBuilderSqlGenFirebird.BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('ALTER TABLE %s ADD CONSTRAINT PK_%s PRIMARY KEY (%s);', [ATable.Name, ATable.Name,
    ATable.PrimaryKeyField.FieldName]);
end;

function TioDBBuilderSqlGenFirebird.BuildAddSequenceSql(const ASequenceName: String; const ACreatingNewDatabase: boolean): string;
begin
  Result := Format('CREATE SEQUENCE %s;', [ASequenceName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.BuildAlterFieldSql(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): string;
var
  LDefault: string;
  LTextBuilder: IioTextBuilder;
begin
  LTextBuilder := NewTextBuilder;

  // Type
  if alFieldType in AField.Altered then
  begin
    LTextBuilder.AddLine(Format('ALTER TABLE ALTER COLUMN %s TYPE %s;', [ATable.Name, AField.FieldName, TranslateFieldType(AField, False)]));
  end;

  // Default
  if alFieldDefault in AField.Altered then
  begin
    LDefault := ExtractFieldDefaultValue(AField);

    if LDefault.IsEmpty then
      LTextBuilder.Add(Format('ALTER TABLE %s ALTER COLUMN %s DROP DEFAULT;', [ATable.Name, AField.FieldName]))
    else
      LTextBuilder.Add(Format('ALTER TABLE %s ALTER COLUMN %s SET DEFAULT %s;', [ATable.Name, AField.FieldName, LDefault]));

    LTextBuilder.DecIndent;
    LTextBuilder.AddLine(BuildEndAlterTableSql(ATable));
  end;

  // Length
  if (alFieldLengthIncreased in AField.Altered) or (alFieldLengthDecreased in AField.Altered) or
    (alFieldPrecisionIncreased in AField.Altered) or (alFieldPrecisionDecreased in AField.Altered) then
  begin
    // If length or precision was increased we can directly update the field with new settings
    if (alFieldLengthIncreased in AField.Altered) or (alFieldPrecisionIncreased in AField.Altered) then
    begin
      LTextBuilder.AddLine(Format('ALTER TABLE %s ALTER COLUMN %s TYPE %s;', [ATable.Name, AField.FieldName, TranslateFieldType(AField, False)]));
    end
    else if (alFieldLengthDecreased in AField.Altered) or (alFieldPrecisionDecreased in AField.Altered) then
    begin
      // If length or precision was decreased, we need to recreate the field.
      LTextBuilder.Add(BuildRecreateFieldSql(ATable, AField));
    end;
  end;

  // NotNull
  // Note: SET NOT NUL & DROP BOT NULL available only from firebird 3
  if alFieldNotNull in AField.Altered then
  begin
    LTextBuilder.Add(Format('ALTER TABLE %s ALTER COLUMN %s %s NOT NULL;', [ATable.Name,  AField.FieldName, IfThen(AField.FieldNotNull, 'SET', 'DROP')]));
  end;

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

function TioDBBuilderSqlGenFirebird.BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format(
    'select' +sLineBReak +
    '  RDB$FIELD_NAME' + SLineBreak +
    'from RDB$RELATION_FIELDS' + sLineBreak +
    'where' + sLineBreak +
    '  UPPER(RDB$RELATION_NAME) = UPPER(''%s'') and' + sLineBreak +
    '  UPPER(RDB$FIELD_NAME) = UPPER(''%s'') and' + sLineBreak +
    '  RDB$SYSTEM_FLAG = 0',
    [ATable.Name, AField.FieldName]);
end;

function TioDBBuilderSqlGenFirebird.BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenFirebird.BuildSQL_FKExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LTextBuilder: IioTextBuilder;
begin
  // Generates: SELECT query to check if a specific foreign key exists in the database
  LTextBuilder := NewTextBuilder;

  LTextBuilder.
    AddLine('select').
    AddLine('  RDB$RELATION_CONSTRAINTS.rdb$constraint_name').
    AddLine('from').
    AddLine('  RDB$RELATIONS join RDB$RELATION_CONSTRAINTS ON RDB$RELATIONS.rdb$relation_name = RDB$RELATION_CONSTRAINTS.rdb$relation_name').
    AddLine('where').
    AddLine('  (RDB$RELATIONS.rdb$system_flag = 0) and').
    AddLine('  (RDB$RELATION_CONSTRAINTS.rdb$constraint_type = ''FOREIGN KEY'') and').
    AddLine(Format('  (UPPER(RDB$RELATIONS.Rdb$relation_name) = UPPER(''%s'')) and', [ATable.Name])).
    Add(Format('  (UPPER(RDB$RELATION_CONSTRAINTS.rdb$constraint_name) = UPPER(''%s''))', [Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey)]));

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
    Add('SELECT RDB$INDEX_NAME, RDB$UNIQUE_FLAG, RDB$INDEX_TYPE ').
    Add('FROM RDB$INDICES ').
    Add('WHERE RDB$SYSTEM_FLAG = 0');

  // Add table filter if specified
  if not ATableName.IsEmpty then
    LTextBuilder.Add(Format(' AND UPPER(RDB$RELATION_NAME) = UPPER(''%s'')', [ATableName]));

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

function TioDBBuilderSqlGenFirebird.BuildRecreateFieldSql(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): string;
var
  LTempFieldName: string;
  LDefault: string;
  LNotNull: string;
  LTextBuilder: IioTextBuilder;
begin
  Result := EmptyStr;

  LTextBuilder := NewTextBuilder;

  // 1 - We must create a temporary field with new settings (without not null flag if needed)
  LTempFieldName := NewTempObjectName(GetMaxSqlIdentifierLength);

  // Extract the default value if exists
  LDefault := ExtractFieldDefaultValue(AField);

  LTextBuilder.Add(Format(
    'ALTER TABLE %s ADD %s %s %s;', [ATable.Name, LTempFieldName, TranslateFieldType(AField, False), LDefault]).Trim);

  // 2 - Copy data from old field to temporary field
  LTextBuilder.Add(Format(
    'UPDATE %s SET %s = ''%s'';', [ATable.Name, LTempFieldName, AField.FieldName]).Trim);

  // 3 - Remove old field (we consider the actual field name is also the old name)
  LTextBuilder.Add(Format(
    'ALTER TABLE %s DROP %s;', [ATable.Name, AField.FieldName]).Trim);

  // 4 - Rename the temporary field to actual field name
  LTextBuilder.Add(Format(
    'ALTER TABLE %s ALTER COLUMN %s TO %s;', [ATable.Name, LTempFieldName, AField.FieldName]).Trim);

  // 5 - Set the not null flag if needed
  if AField.FieldNotNull then
  begin
    LTextBuilder.Add(Format(
      'ALTER TABLE %s ALTER COLUMN %s SET NOT NULL;', [ATable.Name, AField.FieldName]).Trim);
  end;

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

function TioDBBuilderSqlGenFirebird.BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
  Result := InternalCreateField(AField);
end;

function TioDBBuilderSqlGenFirebird.BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string;
var
  LTextBuilder: IioTextBuilder;
begin
  LTextBuilder := NewTextBuilder;

  LTextBuilder.
    Add(BuildBeginCreateTableSql(ATable)).
    IncIndent.
    Add(BuildCreateFieldsSql(ATable, AIndentation)).
    DecIndent.
    Add(BuildEndCreateTableSql(ATable)).
    AddEmptyLine.
    Add(BuildAddPrimaryKeySql(ATable));

  Result := LTextBuilder.Text;
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

function TioDBBuilderSqlGenFirebird.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // Extract the default value if exists
  LDefault := ExtractFieldDefaultValue(AField);

  // If primary key...
  if AField.PrimaryKey then
    Exit(Format('%s INTEGER %s NOT NULL', [AField.FieldName, LDefault]));

  // ...then continue
  LNotNull := IfThen(AField.FieldNotNull, 'NOT NULL', '');
  Result := Format('%s %s %s %s', [AField.FieldName, TranslateFieldType(AField, False), LDefault, LNotNull]).Trim;
end;

function TioDBBuilderSqlGenFirebird.TranslateFieldType(const AField: IioDBBuilderSchemaField; const AExcludeTypeAttributes: boolean): String;
begin
  case AField.FieldType of
    ioMdVarchar:
    begin
      if AExcludeTypeAttributes then
        Result := 'VARCHAR'
      else
        Result := Format('VARCHAR(%d)', [AField.FieldLength]);
    end;
    ioMdChar:
    begin
      if AExcludeTypeAttributes then
        Result := 'CHAR'
      else
        Result := Format('CHAR(%d)', [AField.FieldLength]);
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
      if AExcludeTypeAttributes then
        Result := 'DECIMAL'
      else
        Result := Format('DECIMAL(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    end;
    ioMdNumeric:
    begin
      if AExcludeTypeAttributes then
        Result := 'NUMERIC'
      else
        Result := Format('NUMERIC(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    end;
    ioMdBoolean:
      Result := 'INTEGER';
    ioMdBinary:
      if AExcludeTypeAttributes then
        Result := 'BLOB'
      else
        Result := Format('BLOB SUB_TYPE %s', [IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType)]);
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioGenericException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
  end;
end;

end.
