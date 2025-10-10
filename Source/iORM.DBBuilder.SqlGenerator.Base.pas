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
unit iORM.DBBuilder.SqlGenerator.Base;

interface

uses
  System.Classes,
  System.Rtti,

  iORM.DBBuilder.Interfaces,
  iORM.DB.Interfaces,
  iORM.Attributes,
  iORM.DB.Consts,
  iORM.CommonTypes,
  iORM.TextBuilder.Interfaces

  ;

type

  TioDBBuilderSqlGenBase = class(TInterfacedObject, IioDBBuilderSqlGenerator)
  private
  protected
    function TValueToSql(const AValue: TValue): string; virtual; abstract;
    function ExtractFieldDefaultValue(const AField: IioDBBuilderSchemaField): string;
    function NewTextBuilder: IioTextBuilder; overload;
    function NewTextBuilder(const AIndentation: TioIndentation): IioTextBuilder; overload;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean = true): String; virtual; abstract;
    function TranslateFKAction(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;
    function BuildCommentSql(const AText: string): string; virtual;
    function BuildWarningSql(const AText: string): string; virtual;
    // Indexes related methods
    function BuildIndexNameSql(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): String; virtual;
    function BuildIndexUnique(const AIndex: ioIndex): String; virtual;
    function BuildIndexOrientation(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex; const AIndexName: String): String; virtual;
    function BuildIndexFieldList(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex; const AIndexName: String;
      const AWithIndexOrientation: Boolean): String; virtual;
    // Tables related methods
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string; virtual; abstract;
    function BuildTableExistsSql(const ATableName: string): string; virtual; abstract;
    // Fields related methods
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildCreateFieldsSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string; virtual;
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildAlterFieldSql(const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    // PrimaryKey & other indexes
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): string; virtual; abstract;
    function BuildListAllIndexesSql: string; virtual; abstract;
    function BuildDropIndexSql(const AIndexName: string): string; virtual; abstract;
    // Foreign keys
    function BuildAddForeignKeySql(const AForeignKey: IioDBBuilderSchemaFK): string; virtual; abstract;
    function BuildListAllForeignKeysSql: string; virtual; abstract;
    function BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string; virtual; abstract;
    // Sequences
    function BuildAddSequenceSql(const ASequenceName: String; const ACreatingNewDatabase: Boolean): string; virtual; abstract;
    function BuildSequenceExistsSql(const ASequenceName: string): string; virtual; abstract;
  public
    constructor Create; virtual;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.DB.Factory,
  iORM.DB.ConnectionContainer,
  iORM.SqlTranslator,
  iORM.Exceptions,
  iORM.TextBuilder

  ;

{ TioDBBuilderSqlGenBase }

function TioDBBuilderSqlGenBase.TranslateFKAction(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;
begin
  Result := EmptyStr;

  case AFKAction of
    fkNoAction:
      Exit('NO ACTION');
    fkSetNull:
      Exit('SET NULL');
    fkSetDefault:
      Exit('SET DEFAULT');
    fkCascade:
      Exit('CASCADE');
  end;
end;

function TioDBBuilderSqlGenBase.BuildCommentSql(const AText: string): string;
begin
  Result := Format('-- %S', [AText]);
end;

function TioDBBuilderSqlGenBase.BuildCreateFieldsSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string;
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
  LTextBuilder: IioTextBuilder;
begin
  LTextBuilder := NewTextBuilder(AIndentation);
  LComma := '  ';

  for LField in ATable.Fields do
  begin
    LTextBuilder.AddLine(LComma + BuildCreateFieldSql(LField));
    LComma := ', ';
  end;

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenBase.BuildIndexFieldList(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex;
  const AIndexName: String; const AWithIndexOrientation: Boolean): String;
var
  LFieldList: TStrings;
  LField: String;
  LComma: String;
  LIndexOrientation: String;
begin
  if AWithIndexOrientation then
    LIndexOrientation := BuildIndexOrientation(ATable, AIndex, AIndexName)
  else
    LIndexOrientation := '';

  LFieldList := TStringList.Create;

  try
    LComma := '';
    LFieldList.Delimiter := ',';
    LFieldList.DelimitedText := AIndex.CommaSepFieldList;

    for LField in LFieldList do
    begin
      Result := Format('%s%s %s %s', [Result, LComma, LField, LIndexOrientation]).Trim;
      LComma := ', ';
    end;
  finally
    LFieldList.Free;
  end;
end;

function TioDBBuilderSqlGenBase.BuildIndexNameSql(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): String;
var
  LFieldList: TStrings;
  LField: String;
begin
  // If the index name is already specified then use it and exit
  if not AIndex.IndexName.IsEmpty then
    Exit(TioSqlTranslator.Translate(AIndex.IndexName, ATable.GetContextTable.GetClassName, False));

  // Build the indexname
  Result := 'IDX_' + ATable.TableName;
  // Field list
  LFieldList := TStringList.Create;

  try
    LFieldList.Delimiter := ',';
    LFieldList.DelimitedText := AIndex.CommaSepFieldList;

    for LField in LFieldList do
      Result := Result + '_' + LField;
  finally
    LFieldList.Free;
  end;

  // Index orientation
  case AIndex.IndexOrientation of
    ioAscending:
      Result := Result + '_A';
    ioDescending:
      Result := Result + '_D';
  end;

  // Unique
  if AIndex.Unique then
    Result := Result + '_U';

  // Translate
  Result := TioSqlTranslator.Translate(Result, ATable.GetContextTable.GetClassName, False);
end;

function TioDBBuilderSqlGenBase.BuildIndexOrientation(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex;
  const AIndexName: String): String;
begin
  Result := EmptyStr;

  case AIndex.IndexOrientation of
    ioAscending:
      Exit('ASC');
    ioDescending:
      Exit('DESC');
// Move to calling method
//  else
//    Script.AddWarning(Format('Table ''%s'' index ''%s'' --> Invalid index orientation', [ATable.TableName, AIndexName]));
  end;
end;

function TioDBBuilderSqlGenBase.BuildIndexUnique(const AIndex: ioIndex): String;
begin
  if AIndex.Unique then
    Exit('UNIQUE')
  else
    Exit('');
end;

function TioDBBuilderSqlGenBase.BuildWarningSql(const AText: string): string;
begin
  Result := BuildCommentSql(Format('WARNING: %s', [AText]));
end;

//procedure TioDBBuilderSqlGenBase.WarningNewValueLessThanTheOldOne(const AValueName: String; const AOldValue, ANewValue: Integer;
//  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
//begin
//  if ANewValue < AOldValue then
//    Script.AddWarning(Format('Table ''%s'' field ''%s'' --> The new %s cannot be less than the old one (old = %d, new = %d)',
//      [ATable.TableName, AField.FieldName, AValueName, AOldValue, ANewValue]));
//end;
//
//procedure TioDBBuilderSqlGenBase.WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
//  const ATable: IioDBBuilderSchemaTable);
//begin
//  if AField.FieldNotNull <> AOldFieldNotNull then
//    Script.AddWarning(Format('Table ''%s'' field ''%s'' --> The not null setting cannot be changed automatically',
//      [ATable.TableName, AField.FieldName]));
//end;
//
//procedure TioDBBuilderSqlGenBase.WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
//  const ATable: IioDBBuilderSchemaTable);
//begin
//  if AField.FieldNotNull and (not AOldFieldNotNull) and (not AField.FieldDefaultExists) then
//    Script.AddWarning
//      (Format('Table ''%s'' field ''%s'' --> The not null setting is changed from false to true and a default value has not been specified',
//      [ATable.TableName, AField.FieldName]));
//end;
//
//procedure TioDBBuilderSqlGenBase.WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField;
//  const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string);
//var
//  LRequiredConversion: String;
//begin
//  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
//  if ContainsText(AInvalidTypeConversions, LRequiredConversion) then
//    Script.AddWarning(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''', [ATable.TableName, AField.FieldName,
//      AOldFieldType, ANewFieldType]));
//end;
//
//procedure TioDBBuilderSqlGenBase.WarningValueChanged(const AValueName, AOldValue, ANewValue: String;
//  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
//begin
//  if ANewValue <> AOldValue then
//    Script.AddWarning(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
//      [ATable.TableName, AField.FieldName, AValueName, AOldValue, ANewValue]));
//end;

constructor TioDBBuilderSqlGenBase.Create;
begin
  inherited Create;

end;

function TioDBBuilderSqlGenBase.ExtractFieldDefaultValue(const AField: IioDBBuilderSchemaField): string;
var
  LFieldDefaultValue: TValue;
begin
  LFieldDefaultValue := AField.FieldDefault;

  if LFieldDefaultValue.IsEmpty then
    Result := ''
  else
    Result := 'DEFAULT ' + TValueToSql(LFieldDefaultValue);
end;

function TioDBBuilderSqlGenBase.NewTextBuilder(const AIndentation: TioIndentation): IioTextBuilder;
begin
  Result := TioTextBuilder.Create(AIndentation);
end;

function TioDBBuilderSqlGenBase.NewTextBuilder: IioTextBuilder;
begin
  Result := TioTextBuilder.Create(SCRIPT_INDENTATION_WIDTH);
end;

//function TioDBBuilderSqlGenBase.IsBlobSubTypeChanged(const AOldBlobSubType, ANewBlobSubType: String;
//  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean;
//begin
//  Result := AOldBlobSubType <> ANewBlobSubType;
//
//  if Result then
//  begin
//    AField.AddAltered(alFieldType);
//    if not AIsPermitted then
//      WarningValueChanged('blob sub-type', AOldBlobSubType, ANewBlobSubType, AField, ATable);
//  end;
//end;
//
//function TioDBBuilderSqlGenBase.IsFieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint;
//  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
//begin
//  Result := AOldFieldDecimals <> ANewFieldDecimals;
//  if Result then
//  begin
//    AField.AddAltered(alFieldType);
//    WarningNewValueLessThanTheOldOne('field decimals', AOldFieldDecimals, ANewFieldDecimals, AField, ATable);
//  end;
//end;
//
//function TioDBBuilderSqlGenBase.IsFieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint;
//  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
//begin
//  Result := ANewFieldLength <> AOldFieldLength;
//  if Result then
//  begin
//    AField.AddAltered(alFieldType);
//    WarningNewValueLessThanTheOldOne('field length', AOldFieldLength, ANewFieldLength, AField, ATable);
//  end;
//end;
//
//function TioDBBuilderSqlGenBase.IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean;
//  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean;
//begin
//  Result := AOldFieldNotNull <> ANewFieldNotNull;
//  if Result then
//  begin
//    AField.AddAltered(alFieldNotNull);
//    if AIsPermitted then
//      WarningNullBecomesNotNull(AOldFieldNotNull, AField, ATable)
//    else
//      WarningNotNullCannotBeChanged(AOldFieldNotNull, AField, ATable);
//  end;
//end;
//
//function TioDBBuilderSqlGenBase.IsFieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint;
//  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
//begin
//  Result := AOldFieldPrecision <> ANewFieldPrecision;
//  if Result then
//  begin
//    AField.AddAltered(alFieldType);
//    WarningNewValueLessThanTheOldOne('field precision', AOldFieldPrecision, ANewFieldPrecision, AField, ATable);
//  end;
//end;
//
//function TioDBBuilderSqlGenBase.IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField;
//  const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string): Boolean;
//begin
//  Result := not SameText(AOldFieldType, ANewFieldType);
//  if Result then
//  begin
//    AField.AddAltered(alFieldType);
//    WarningTypeAffinity(AOldFieldType, ANewFieldType, AField, ATable, AInvalidTypeConversions);
//  end;
//end;

end.
