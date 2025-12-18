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
//    function AdaptIdentifierName(const APrefix, AName: String; const MaxLength: integer = 30): String;
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
  protected
    function GetMaxSqlIdentifierLength: integer; override;
    function GetMinSqlIdentifierLength: integer; override;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean = true): String; override;
    function TValueToSql(const AValue: TValue): string; override;
  public
    // Tables related methods
    function BuildAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string; override;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildTableExistsSql(const ATableName: string): string; override;
    // Fields related methods
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAlterFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildRecreateFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    // PrimaryKey related methods
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string; override;
    // Indexes related methods
    function BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildDropIndexSql(const AIndexName: string): string; override;
    function BuildIndexExistsSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildIndexExistsSql(const AIndexName: string): string; override;
    function BuildIndexModifiedSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildListAllIndexesSql: string; override;
    function BuildListTableIndexesSql(const ATable: IioDBBuilderSchemaTable): string; override;
    // Foreign keys
    function BuildAddForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string; override;
    function BuildForeignKeyExistsSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildForeignKeyModifiedSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildListAllForeignKeysSql: string; override;
    function BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string; override;
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
  iORM.SqlTranslator,
  iORM.DB.Firebird.SqlDataConverter,
  iORM.DB.Consts,
  iORM.TextBuilder.Interfaces

  ;


const
  MAX_IDENTIFIER_NAME_LENGTH = 31;
  MIN_IDENTIFIER_NAME_LENGTH = 27;


{ TioDBBuilderSqlGenFirebird }

function TioDBBuilderSqlGenFirebird.BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('ADD %s', [InternalCreateField(AField)]);
end;

function TioDBBuilderSqlGenFirebird.BuildAddForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName,
  LFKAction,
  LSqlText: string;
  LTextBuilder: IioTextBuilder;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
//  LFKName := AdaptIdentifierName('FK_', AForeignKey.Name.ToUpper);   // Carlo Marona (2025-10-21): Made foreign key name uppercase
  LFKName := BuildForeignKeyNameSql(ATable, AForeignKey);

  LTextBuilder := NewTextBuilder;

  LTextBuilder.
    AddLine(Format('ALTER TABLE %s', [AForeignKey.DependentTableName])).
    IncIndent.
    Add(Format('ADD CONSTRAINT %s', [LFKName]), True).
    Add(Format(' FOREIGN KEY (%s)', [AForeignKey.DependentFieldName])).
    Add(Format(' REFERENCES %s (%s)', [AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]));

  if AForeignKey.OnUpdateAction > fkUnspecified then
  begin
    LFKAction := TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction);

    if not LFKAction.IsEmpty then
      LTextBuilder.Add(Format(' ON UPDATE %s', [LFKAction]))
    else
      LTextBuilder.AddLine(
        BuildWarningSql(Format('Table ''%s'' constraint ''%s'' --> Invalid foreign key action (field %s reference to %s.%s)',
          [AForeignKey.DependentTableName, AForeignKey.Name, AForeignKey.DependentFieldName, AForeignKey.ReferenceTableName,
          AForeignKey.ReferenceFieldName])));
  end;

  if AForeignKey.OnDeleteAction > fkUnspecified then
  begin
    LFKAction := TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction);

    if not LFKAction.IsEmpty then
      LTextBuilder.Add(Format(' ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]))
    else
      LTextBuilder.AddLine(
        BuildWarningSql(Format('Table ''%s'' constraint ''%s'' --> Invalid foreign key action (field %s reference to %s.%s)',
          [AForeignKey.DependentTableName, AForeignKey.Name, AForeignKey.DependentFieldName, AForeignKey.ReferenceTableName,
          AForeignKey.ReferenceFieldName])));
  end;

  LTextBuilder.
    DecIndent.
    AddLine(';');

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenFirebird.BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
var
  LSqlText, LIndexName, LFieldList, LUnique, LIndexOrientation: String;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
//  LIndexName := AdaptIdentifierName('IDX_', BuildIndexNameSql(ATable, AIndex), MIN_IDENTIFIER_NAME_LENGTH); // Carlo Marona
  LIndexName := BuildIndexNameSql(ATable, AIndex);
  LIndexOrientation := BuildIndexOrientation(ATable, AIndex, LIndexName);
  LUnique := BuildIndexUnique(AIndex);
  LFieldList := BuildIndexFieldList(ATable, AIndex, LIndexName, False);

  // Compose the create index query text
  if not LUnique.IsEmpty then
    LSqlText := Format('CREATE %s %s INDEX %s ON %s (%s);', [LUnique, LIndexOrientation, LIndexName, ATable.Name, LFieldList])
  else
    LSqlText := Format('CREATE %s INDEX %s ON %s (%s);', [LIndexOrientation, LIndexName, ATable.Name, LFieldList]);


  Result := LSqlText;
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
    [ATable.Name.ToUpper, AField.FieldName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenFirebird.BuildForeignKeyExistsSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName: string;
begin
  LFKName := BuildForeignKeyNameSql(ATable, AForeignKey);

  Result := Format(
    'select' + sLineBreak +
    '  RDB$RELATION_CONSTRAINTS.rdb$constraint_name' + sLineBreak +
    'from' + sLineBreak +
    '  RDB$RELATIONS join RDB$RELATION_CONSTRAINTS ON RDB$RELATIONS.rdb$relation_name = RDB$RELATION_CONSTRAINTS.rdb$relation_name' + sLineBreak +
    'where' + sLineBreak +
    '  (RDB$RELATIONS.rdb$system_flag = 0) and' + sLineBreak +
    '  (RDB$RELATION_CONSTRAINTS.rdb$constraint_type = ''FOREIGN KEY'') and' + sLineBreak +
    '  (UPPER(RDB$RELATIONS.Rdb$relation_name) = UPPER(''%s'')) and' + sLineBreak +
    '  (UPPER(RDB$RELATION_CONSTRAINTS.rdb$constraint_name) = (''%s''))',
    [ATable.Name, LFKName]
  );
end;

function TioDBBuilderSqlGenFirebird.BuildForeignKeyModifiedSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName: string;
begin
  LFKName := BuildForeignKeyNameSql(ATable, AForeignKey);

  Result := Format(
    'SELECT' + sLineBreak +
    '  detail_index_segments.rdb$field_name AS Field_Name,' + sLineBreak +
    '  master_relation_constraints.rdb$relation_name AS Reference_Table,' + sLineBreak +
    '  master_index_segments.rdb$field_name AS FK_Field' + sLineBreak +
    'FROM' + sLineBreak +
    '  rdb$relation_constraints detail_relation_constraints JOIN'+ sLineBreak +
    '  rdb$index_segments detail_index_segments ON detail_relation_constraints.rdb$index_name = detail_index_segments.rdb$index_name JOIN' + sLineBreak +
    '  rdb$ref_constraints ON detail_relation_constraints.rdb$constraint_name = rdb$ref_constraints.rdb$constraint_name JOIN' + sLineBreak +
    '  rdb$relation_constraints master_relation_constraints ON rdb$ref_constraints.rdb$const_name_uq = master_relation_constraints.rdb$constraint_name JOIN' + sLineBreak +
    '  rdb$index_segments master_index_segments ON master_relation_constraints.rdb$index_name = master_index_segments.rdb$index_name' + sLineBreak +
    'WHERE' + sLineBreak +
    '  detail_relation_constraints.rdb$constraint_type = ''FOREIGN KEY'' AND' + sLineBreak +
    '  UPPER(detail_relation_constraints.rdb$relation_name) = UPPER(''%s'') AND' + sLineBreak +
    '  UPPER(detail_relation_constraints.rdb$constraint_name) = UPPER(''%s'')',
    [ATable.Name, LFKName]
  );
end;

function TioDBBuilderSqlGenFirebird.BuildIndexExistsSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
begin
  Result := BuildIndexExistsSql(BuildIndexNameSql(ATable, AIndex));
end;

function TioDBBuilderSqlGenFirebird.BuildIndexExistsSql(const AIndexName: string): string;
begin
  Result := Format('select RDB$INDEX_NAME from RDB$INDICES where UPPER(RDB$INDEX_NAME) = UPPER(''%s'')', [AIndexName]);
end;

function TioDBBuilderSqlGenFirebird.BuildIndexModifiedSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
begin
  Result := Format(
    'select' + sLineBreak +
    '  rdb$indices.rdb$index_name as "IndexName",' + sLineBreak +
    '  rdb$indices.rdb$relation_name as "TableName",' + sLineBreak +
    '  rdb$indices.rdb$unique_flag as "UniqueFlag",' + sLineBreak +
    '  rdb$indices.rdb$index_type as "IndexType",' + sLineBreak +
    '  rdb$index_segments.rdb$field_name as "FieldName"' + sLineBreak +
    'from' + sLineBreak +
    '  rdb$index_segments right outer join rdb$indices on (rdb$index_segments.rdb$index_name = rdb$indices.rdb$index_name)' + sLineBreak +
    'where' + sLineBreak +
    '  (rdb$indices.rdb$system_flag = 0) and' + sLineBreak +
    '  (UPPER(rdb$indices.rdb$relation_name) = UPPER(''%s'')) and' + sLineBReak +
    '  (UPPER(rdb$indices.rdb$index_name) = UPPER(''%s''))',
    [ATable.Name, AIndex.Name]
  );
end;

function TioDBBuilderSqlGenFirebird.BuildListAllForeignKeysSql: string;
begin
  Result :=
    'select rdb$relation_name as table_name, rdb$constraint_name as constraint_name' + sLineBreak +
    'from rdb$relation_constraints' + sLineBreak +
    'where rdb$constraint_type = ''FOREIGN KEY''' + sLineBreak +
    '  and rdb$constraint_name like ''FK_%''';
end;

function TioDBBuilderSqlGenFirebird.BuildListAllIndexesSql: string;
begin
  // Carlo Marona (2025-10-15): Added condition to exclude system indices
  Result := 'select RDB$INDEX_NAME from RDB$INDICES where (RDB$INDEX_NAME like ''IDX_%'') and (RDB$SYSTEM_FLAG = 0)';
end;

function TioDBBuilderSqlGenFirebird.BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  // Carlo Marona (2025-10-16): reference https://www.firebirdnews.org/listing-the-foreign-keys-in-a-firebird-database/
  Result := Format(
    'SELECT'  + SLineBreak +
    '  rc.RDB$CONSTRAINT_NAME AS constraint_name,' + SLineBreak +
    '  i.RDB$RELATION_NAME AS table_name,' + SLineBreak +
    '  s.RDB$FIELD_NAME AS field_name,' + SLineBreak +
    '  i.RDB$DESCRIPTION AS description,' + SLineBreak +
    '  rc.RDB$DEFERRABLE AS is_deferrable,' + SLineBreak +
    '  rc.RDB$INITIALLY_DEFERRED AS is_deferred,' + SLineBreak +
    '  refc.RDB$UPDATE_RULE AS on_update,' + SLineBreak +
    '  refc.RDB$DELETE_RULE AS on_delete,' + SLineBreak +
    '  refc.RDB$MATCH_OPTION AS match_type,' + SLineBreak +
    '  i2.RDB$RELATION_NAME AS references_table,' + SLineBreak +
    '  s2.RDB$FIELD_NAME AS references_field,' + SLineBreak +
    '  (s.RDB$FIELD_POSITION + 1) AS field_position' + SLineBreak +
    'FROM RDB$INDEX_SEGMENTS s' + SLineBreak +
    '  LEFT JOIN RDB$INDICES i ON i.RDB$INDEX_NAME = s.RDB$INDEX_NAME' + SLineBreak +
    '  LEFT JOIN RDB$RELATION_CONSTRAINTS rc ON rc.RDB$INDEX_NAME = s.RDB$INDEX_NAME' + SLineBreak +
    '  LEFT JOIN RDB$REF_CONSTRAINTS refc ON rc.RDB$CONSTRAINT_NAME = refc.RDB$CONSTRAINT_NAME' + SLineBreak +
    '  LEFT JOIN RDB$RELATION_CONSTRAINTS rc2 ON rc2.RDB$CONSTRAINT_NAME = refc.RDB$CONST_NAME_UQ' + SLineBreak +
    '  LEFT JOIN RDB$INDICES i2 ON i2.RDB$INDEX_NAME = rc2.RDB$INDEX_NAME' + SLineBreak +
    '  LEFT JOIN RDB$INDEX_SEGMENTS s2 ON i2.RDB$INDEX_NAME = s2.RDB$INDEX_NAME' + SLineBreak +
    'WHERE' + SLineBreak +
    '  rc.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' AND' + SLineBreak +
    '  i.RDB$RELATION_NAME = ''%s''' + SLineBreak +
    'ORDER BY' + SLineBreak +
    '  s.RDB$FIELD_POSITION',
    [ATable.Name]
  );
end;

function TioDBBuilderSqlGenFirebird.BuildListTableIndexesSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format(
    'select' + SLineBreak +
    '  RDB$INDICES.RDB$INDEX_NAME, RDB$INDICES.RDB$RELATION_NAME, RDB$INDEX_SEGMENTS.RDB$FIELD_NAME' + sLineBreak +
    'from' + SLineBreak +
    '  rdb$index_segments right outer join rdb$indices on (rdb$index_segments.rdb$index_name = rdb$indices.rdb$index_name)' + SLineBreak +
    'where' + SLineBreak +
    '  (RDB$INDICES.RDB$SYSTEM_FLAG = 0) and' + SLineBreak +
    '  (RDB$INDIXES.RDB$RELATION_NAME like ''%%s'')'
    , [ATable.Name]
  );
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
  Result := Format('select count(*) from rdb$generators where (rdb$generator_name = ''%s'') and (RDB$SYSTEM_FLAG = 0)', [ASequenceName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.BuildTableExistsSql(const ATableName: string): string;
begin
  // Carlo Marona (2025-10-15): Added condition to exclude system relations
  Result := Format('select RDB$RELATION_NAME from RDB$RELATIONS where (RDB$RELATION_NAME = ''%s'') and (RDB$SYSTEM_FLAG = 0)',
    [ATableName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.GetMaxSqlIdentifierLength: integer;
begin
  Result := MAX_IDENTIFIER_NAME_LENGTH;
end;

function TioDBBuilderSqlGenFirebird.GetMinSqlIdentifierLength: integer;
begin
  Result := MIN_IDENTIFIER_NAME_LENGTH;
end;

//function TioDBBuilderSqlGenFirebird.AdaptIdentifierName(const APrefix, AName: String; const MaxLength: integer): String;
//var
//  LGuid: TGuid;
//  LName: string;
//begin
//  if MaxLength < MIN_IDENTIFIER_NAME_LENGTH  then
//   raise EioGenericException.Create(ClassName, 'AdaptIndexOrFKName', Format('Invalid max length: min allowed length is %d.', [MIN_IDENTIFIER_NAME_LENGTH]));
//
//  Result := APrefix.ToUpper + AName.ToUpper; // Carlo Marona (2025-10-22): Moved uppercase here
//
//  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
//  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
//  // Carlo Marona: In realtà il limite esiste per le versioni precedenti alla 4. Dalla 4 il limite è di 63 caratteri UTF8.
//  //               Bisognerebbe ristrutturare la parte di interfacciamento con il database per renderla più sofisticata
//  //               afficnhè tenga conto anche della specifica versione del database così da adattarsi alle specifiche caratteristiche
//  // Carlo Marona (2025-10-24): It's not feasible to use a random name in case of max length was exeeded, because it' not possibile
//  //                            to verify if the foreign key exists.
//  If Length(Result) > MaxLength then
//  begin
//    CreateGUID(LGuid);
//    Result := APrefix + LGuid.ToString.Replace('-', '', [rfReplaceAll]).Replace('}', '', [rfReplaceAll]).Substring(24);
//  end;
//end;

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

function TioDBBuilderSqlGenFirebird.BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string;
begin
  Result := Format('ALTER TABLE %s DROP CONSTRAINT %s;', [ATableName, AForeignKeyName]);
end;

function TioDBBuilderSqlGenFirebird.BuildDropIndexSql(const AIndexName: string): string;
begin
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

function TioDBBuilderSqlGenFirebird.TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean): String;
begin
  case AField.FieldType of
    ioMdVarchar:
    begin
      if ReturnTypeNameOnly then
        Result := 'VARCHAR'
      else
        Result := Format('VARCHAR(%d)', [AField.FieldLength]);
    end;
    ioMdChar:
    begin
      if ReturnTypeNameOnly then
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
      if ReturnTypeNameOnly then
        Result := 'DECIMAL'
      else
        Result := Format('DECIMAL(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    end;
    ioMdNumeric:
    begin
      if ReturnTypeNameOnly then
        Result := 'NUMERIC'
      else
        Result := Format('NUMERIC(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    end;
    ioMdBoolean:
      Result := 'INTEGER';
    ioMdBinary:
      if ReturnTypeNameOnly then
        Result := 'BLOB'
      else
        Result := Format('BLOB SUB_TYPE %s', [IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType)]);
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioGenericException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
  end;
end;

function TioDBBuilderSqlGenFirebird.TValueToSql(const AValue: TValue): string;
begin
  Result := TioSqlDataConverterFirebird.TValueToSql(AValue);
end;

end.
