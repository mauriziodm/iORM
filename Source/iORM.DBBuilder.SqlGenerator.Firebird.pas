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
    function AdaptIndexOrFKName(const APrefix, AName: String): String;
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
  protected
    function TValueToSql(const AValue: TValue): string; override;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean = true): String; override;
  public
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string; override;
    function BuildTableExistsSql(const ATableName: string): string; override;
    // Fields related methods
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAlterFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    // PrimaryKey & other indexes
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): string; override;
    function BuildListAllIndexesSql: string; override;
    function BuildDropIndexSql(const AIndexName: string): string; override;
    // Foreign keys
    function BuildAddForeignKeySql(const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string; override;
    function BuildListAllForeignKeysSql: string; override;
    // Sequences
    function BuildAddSequenceSql(const ASequenceName: String; const ACreatingNewDatabase: boolean): string; override;
    function BuildSequenceExistsSql(const ASequenceName: string): string; override;
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

{ TioDBBuilderSqlGenFirebird }

function TioDBBuilderSqlGenFirebird.BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('ADD %s', [InternalCreateField(AField)]);
end;

function TioDBBuilderSqlGenFirebird.BuildAddForeignKeySql(const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName,
  LFKAction,
  LSqlText: string;
  LTextBuilder: IioTextBuilder;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
  LFKName := AdaptIndexOrFKName('FK_', AForeignKey.Name);

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

function TioDBBuilderSqlGenFirebird.BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): string;
var
  LSqlText, LIndexName, LFieldList, LUnique, LIndexOrientation: String;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
  LIndexName := AdaptIndexOrFKName('IDX_', BuildIndexNameSql(ATable, AIndex));
  LIndexOrientation := BuildIndexOrientation(ATable, AIndex, LIndexName);
  LUnique := BuildIndexUnique(AIndex);
  LFieldList := BuildIndexFieldList(ATable, AIndex, LIndexName, False);
  // Compose the create index query text
  LSqlText := Format('CREATE %s %s INDEX %s ON %s (%s);', [LUnique, LIndexOrientation, LIndexName, ATable.TableName, LFieldList]);
  Result := LSqlText;
end;

function TioDBBuilderSqlGenFirebird.BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('ALTER TABLE %s ADD CONSTRAINT PK_%s PRIMARY KEY (%s);', [ATable.TableName, ATable.TableName,
    ATable.PrimaryKeyField.FieldName]);
end;

function TioDBBuilderSqlGenFirebird.BuildAddSequenceSql(const ASequenceName: String; const ACreatingNewDatabase: boolean): string;
begin
  Result := Format('CREATE SEQUENCE %s;', [ASequenceName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.BuildAlterFieldSql(const AField: IioDBBuilderSchemaField): string;
var
  LDefault: string;
  LTextBuilder: IioTextBuilder;
begin
  LTextBuilder := NewTextBuilder;

  // Type
  if alFieldType in AField.Altered then
  begin
    LTextBuilder.AddLine(Format('ALTER COLUMN %s TYPE %s', [AField.FieldName, TranslateFieldType(AField)]));
  end;

  // Default
  if alFieldDefault in AField.Altered then
  begin
    LDefault := ExtractFieldDefaultValue(AField);

    if LDefault.IsEmpty then
      LTextBuilder.Add(Format('ALTER COLUMN %s DROP DEFAULT', [AField.FieldName]))
    else
      LTextBuilder.Add(Format('ALTER COLUMN %s SET DEFAULT %s', [AField.FieldName, LDefault]));
  end;

  // NotNull
  // Note: SET NOT NUL & DROP BOT NULL available only from firebird 3
  if alFieldNotNull in AField.Altered then
    LTextBuilder.Add(Format('ALTER COLUMN %s %s NOT NULL', [AField.FieldName, IfThen(AField.FieldNotNull, 'SET', 'DROP')]));

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
  Result := Format('ALTER TABLE %s', [ATable.TableName]);
end;

function TioDBBuilderSqlGenFirebird.BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('CREATE TABLE %s (', [ATable.TableName]);
end;

function TioDBBuilderSqlGenFirebird.BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('select rdb$field_name from rdb$relation_fields where rdb$relation_name=''%s'' and rdb$field_name=''%s''',
    [ATable.TableName.ToUpper, AField.FieldName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := EmptyStr;
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
  Result := 'select RDB$INDEX_NAME from rdb$indices where RDB$INDEX_NAME like ''IDX_%''';
end;

function TioDBBuilderSqlGenFirebird.BuildSequenceExistsSql(const ASequenceName: string): string;
begin
  Result := Format('select count(*) from rdb$generators where rdb$generator_name = ''%s''', [ASequenceName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.BuildTableExistsSql(const ATableName: string): string;
begin
  Result := Format('select rdb$relation_name from rdb$relations where rdb$relation_name = ''%s''',
    [ATableName.ToUpper]);
end;

function TioDBBuilderSqlGenFirebird.AdaptIndexOrFKName(const APrefix, AName: String): String;
var
  LGuid: TGuid;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
  // Carlo Marona: In realtà il limite esiste per le versioni precedenti alla 4. Dalla 4 il limite è di 63 caratteri UTF8.
  //               Bisognerebbe ristrutturare la parte di interfacciamento con il database per renderla più sofisticata
  //               afficnhè tenga conto anche della specifica versione del database così da adattarsi alle specifiche caratteristiche
  If Length(AName) <= 30 then
    Exit(AName);

  CreateGUID(LGuid);
  Result := APrefix + LGuid.ToString.Replace('-', '', [rfReplaceAll]).Replace('}', '', [rfReplaceAll]).Substring(24);
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

function TioDBBuilderSqlGenFirebird.BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string;
begin
  Result := Format('ALTER TABLE %s DROP CONSTRAINT %s;', [ATableName, AForeignKeyName]);
end;

function TioDBBuilderSqlGenFirebird.BuildDropIndexSql(const AIndexName: string): string;
begin
  Result := Format('DROP INDEX %s;', [AIndexName]);
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

//function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
//begin
//  case AField.FieldType of
//    ioMdVarchar:
//      Result := Format('VARCHAR(%d)', [AField.FieldLength]);
//    ioMdChar:
//      Result := Format('CHAR(%d)', [AField.FieldLength]);
//    ioMdInteger:
//      Result := 'INTEGER';
//    ioMdFloat:
//      Result := 'FLOAT';
//    ioMdDate:
//      Result := 'DATE';
//    ioMdTime:
//      Result := 'TIME';
//    ioMdDateTime:
//      Result := 'TIMESTAMP';
//    ioMdDecimal:
//      Result := Format('DECIMAL(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
//    ioMdNumeric:
//      Result := Format('NUMERIC(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
//    ioMdBoolean:
//      Result := 'INTEGER';
//    ioMdBinary:
//      Result := Format('BLOB SUB_TYPE %s', [IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType)]);
//    ioMdCustomFieldType:
//      Result := AField.FieldCustomType;
//  else
//    raise EioGenericException.Create(ClassName, 'TranslateFieldTypeForCreate', 'Wrong Metadata_FieldType');
//  end;
//end;

//function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
//begin
//  case AField.FieldType of
//    ioMdVarchar:
//      Result := 'VARCHAR';
//    ioMdChar:
//      Result := 'CHAR';
//    ioMdInteger:
//      Result := 'INTEGER';
//    ioMdFloat:
//      Result := 'FLOAT';
//    ioMdDate:
//      Result := 'DATE';
//    ioMdTime:
//      Result := 'TIME';
//    ioMdDateTime:
//      Result := 'TIMESTAMP';
//    ioMdDecimal:
//      Result := 'INT64'; // Firebird use subtype for NUMERIC or DECIMALS
//    ioMdNumeric:
//      Result := 'INT64'; // Firebird use subtype NUMERIC or DECIMALS
//    ioMdBoolean:
//      Result := 'INTEGER';
//    ioMdBinary:
//      Result := 'BLOB';
//    ioMdCustomFieldType:
//      Result := AField.FieldCustomType;
//  else
//    raise EioGenericException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
//  end;
//end;

function TioDBBuilderSqlGenFirebird.TValueToSql(const AValue: TValue): string;
begin
  Result := TioSqlDataConverterFirebird.TValueToSql(AValue);
end;

end.
