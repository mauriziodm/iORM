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
    FConnectionDefName: string;
  protected
    property ConnectionDefName: string read FConnectionDefName;

    // Database operations (execute directly, don't return SQL)
    procedure CreateDatabase; virtual; abstract;
    function DatabaseExists: Boolean; virtual; abstract;

    function ExtractFieldDefaultValue(const AField: IioDBBuilderSchemaField): string;
    function GetMaxSqlIdentifierLength: integer; virtual;
    function GetMinSqlIdentifierLength: integer; virtual;
    function NewTempObjectName(const AMaxLength: integer): string;
    function NewTextBuilder: IioTextBuilder; overload;
    function NewTextBuilder(const AIndentation: TioIndentation): IioTextBuilder; overload;
    function ShortenIdentifierName(const AIdentifierName: string; const AMaxLength: integer): string;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean = true): String; virtual; abstract;
    function TranslateFKAction(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;
    function TValueToSql(const AValue: TValue): string; virtual; abstract;

    // Tables
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string; virtual; abstract;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildTableExistsSql(const ATableName: string): string; virtual; abstract;
    // Fields
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildAlterFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildCreateFieldsSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string; virtual;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildRecreateFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    // PrimaryKeys
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    // Index related methods
    function BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual; abstract;
    function BuildIndexFieldList(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex; const AIndexName: String; const AWithIndexOrientation: Boolean): String; virtual;
    function BuildDropIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; overload; virtual;
    function BuildDropIndexSql(const AIndexName: string): string; overload; virtual; abstract;
    function BuildIndexExistsSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; overload; virtual; abstract;
    function BuildIndexExistsSql(const AIndexName: string): string; overload; virtual; abstract;
    function BuildIndexModifiedSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual; abstract;
    function BuildIndexNameSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex; const UpperCase: boolean = True): String; virtual;
    function BuildIndexOrientation(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex; const AIndexName: String): String; virtual;
    function BuildIndexUnique(const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    function BuildListAllIndexesSql: string; virtual; abstract;
    function BuildListTableIndexesSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function GetIndexOrientationSuffix(const AOrientation: TioIndexOrientation): string; virtual;
    function GetIndexUniqueSuffix(const Unique: boolean): string; virtual;
    // Foreign keys
    function BuildAddForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual; abstract;
    function BuildDropForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; overload; virtual;
    function BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string; overload; virtual; abstract;
    function BuildForeignKeyExistsSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual; abstract;
    function BuildForeignKeyModifiedSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual; abstract;
    function BuildForeignKeyNameSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK; const UpperCase: boolean = True): string; virtual;
    function BuildListAllForeignKeysSql: string; virtual; abstract;
    function BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    // Comments
    function BuildCommentSql(const AText: string): string; virtual;
    // Warnings
    function BuildWarningSql(const AText: string): string; virtual;

    function SqlIdentifierExeedMaxLength(const AIdentifierName: string): boolean; virtual;
    function SqlIdentifierBehindMinLength(const AIdentifierName: string): boolean; virtual;

    property MaxSqlIdentifierLength: integer read GetMaxSqlIdentifierLength;
    property MinSqlIdentifierLength: integer read GetMinSqlIdentifierLength;
  public
    constructor Create(const AConnectionDefName: string); virtual;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Character,
  System.Hash,

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

function TioDBBuilderSqlGenBase.BuildDropIndexSql(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): string;
var
  LIndexName: string;
begin
  LIndexName := BuildIndexNameSql(ATable, AIndex);

  Result := BuildDropIndexSql(LIndexName);
end;

function TioDBBuilderSqlGenBase.BuildForeignKeyNameSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK;
  const UpperCase: boolean): string;
var
  LFieldList: TStrings;
  LFKName,
  LField: String;
  LShorten: boolean;
begin
  LShorten := False;

  repeat
    LFKName := EmptyStr;

    // Format('%s_%s_%s_%s', [DependentTableName, DependentFieldName, ReferenceTableName, ReferenceFieldName])

    if not LShorten then
      LFKName := 'FK_' + AForeignKey.Name
    else
      // Max length is reduced by the length of 'FK_' prefix
      LFKName := 'FK_' +
        ShortenIdentifierName(Format('%s_%s_%s_%s', [AForeignKey.DependentTableName, AForeignKey.DependentFieldName,
          AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]),
          MaxSqlIdentifierLength - 3
      );

    // Translate
    LFKName := TioSqlTranslator.Translate(LFKName, ATable.GetContextTable.GetClassName, False);

    LShorten := SqlIdentifierExeedMaxLength(LFKName);
  until not LShorten;

  if UpperCase then
    Result := LFKName.ToUpper
  else
    Result := LFKName;
end;

function TioDBBuilderSqlGenBase.BuildIndexFieldList(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex; const AIndexName: String;
  const AWithIndexOrientation: Boolean): String;
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
      Result := Format('%s%s %s %s', [Result, LComma, LField.Trim, LIndexOrientation]).Trim;
      LComma := ',';
    end;
  finally
    LFieldList.Free;
  end;
end;

function TioDBBuilderSqlGenBase.BuildIndexNameSql(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex; const UpperCase: boolean): String;
var
  LFieldList: TArray<string>;
  LShorten: boolean;
  LTmpIndexName,
  LField,
  LIndexName: string;
begin
  if AIndex.ExplicitName then
    LIndexName := TioSqlTranslator.Translate(AIndex.Name, ATable.GetContextTable.GetClassName, False)
  else
  begin
    LShorten := False;

    repeat
      LIndexName := EmptyStr;

      // Build the indexname
      if not LShorten then
        LIndexName := 'IDX_' + ATable.Name + '_' + AIndex.Name
      else  // Carlo Marona (2025-10-24): If the length exeed max length the name will be recalculated using a shortening algorithm.
      begin
        LTmpIndexName := EmptyStr;
        LFieldList := AIndex.CommaSepFieldList.Split([',']);
        LTmpIndexName := ATable.Name + '_';

        for LField in LFieldList do
          LTmpIndexName := LTmpIndexName + '_' + LField.Trim;

        // Max length is reduced by the length of unique and orientation suffixes (if presents) and the legth of 'IDX_' prefix
        LIndexName := 'IDX_' + ShortenIdentifierName(LTmpIndexName,
          MaxSqlIdentifierLength - GetIndexOrientationSuffix(AIndex.IndexOrientation).Length -
          GetIndexUniqueSuffix(AIndex.Unique).Length - 4);
      end;

      // Index orientation
      LIndexName := LIndexName + GetIndexOrientationSuffix(AIndex.IndexOrientation);

      // Unique
      LIndexName := LIndexName + GetIndexUniqueSuffix(AIndex.Unique);

      // Translate
      LIndexName := TioSqlTranslator.Translate(LIndexName, ATable.GetContextTable.GetClassName, False);

      LShorten := SqlIdentifierExeedMaxLength(LIndexName);
    until not LShorten;
  end;

  if UpperCase then
    Result := LIndexName.ToUpper
  else
    Result := LIndexName;
end;

function TioDBBuilderSqlGenBase.BuildIndexOrientation(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex; const AIndexName: String): String;
begin
  Result := EmptyStr;

  case AIndex.IndexOrientation of
    ioAscending:
      Exit('ASC');
    ioDescending:
      Exit('DESC');
  end;
end;

function TioDBBuilderSqlGenBase.BuildIndexUnique(const AIndex: IioDBBuilderSchemaIndex): String;
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

constructor TioDBBuilderSqlGenBase.Create(const AConnectionDefName: string);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
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

function TioDBBuilderSqlGenBase.GetIndexOrientationSuffix(const AOrientation: TioIndexOrientation): string;
begin
  case AOrientation of
    ioAscending:
      Result := '_A';
    ioDescending:
      Result := '_D';
  end;
end;

function TioDBBuilderSqlGenBase.GetIndexUniqueSuffix(const Unique: boolean): string;
begin
  if Unique then
    Result := '_U'
  else
    Result := '';
end;

function TioDBBuilderSqlGenBase.GetMaxSqlIdentifierLength: integer;
begin
  Result := 0;
end;

function TioDBBuilderSqlGenBase.GetMinSqlIdentifierLength: integer;
begin
  Result := 0;
end;

function TioDBBuilderSqlGenBase.NewTempObjectName(const AMaxLength: integer): string;
begin
  Result := TGUID.NewGuid.ToString.Replace('{', '').Replace('}', '').Replace('-', '').Substring(1, AMaxLength);
end;

function TioDBBuilderSqlGenBase.NewTextBuilder(const AIndentation: TioIndentation): IioTextBuilder;
begin
  Result := TioTextBuilder.Create(AIndentation);
end;

function TioDBBuilderSqlGenBase.ShortenIdentifierName(const AIdentifierName: string; const AMaxLength: integer): string;
begin
  Result := EmptyStr;

  if Length(AIdentifierName) <= AMaxLength then
    Exit(AIdentifierName);

  // Changed shortening algorithm because there are some cases where different input names comes to the same shortened
  // name (collitions).
  // Now I used SHA2 hash algorithm to produce a unique identifier calculated on the original identifier in all its
  // length and keeping only the first AMaxLength chars. This should avoid identifier names collitions.
  Result := THashSHA2.GetHashString(AIdentifierName).Substring(1, AMaxLength);
end;

function TioDBBuilderSqlGenBase.SqlIdentifierBehindMinLength(const AIdentifierName: string): boolean;
begin
  Result := Length(AIdentifierName) < MinSqlIdentifierLength;
end;

function TioDBBuilderSqlGenBase.SqlIdentifierExeedMaxLength(const AIdentifierName: string): boolean;
begin
  // If MaxSqlIdentifierLength is 0 there's no limit to the identifier length
  Result := (MaxSqlIdentifierLength > 0) and (Length(AIdentifierName) > MaxSqlIdentifierLength);
end;

function TioDBBuilderSqlGenBase.NewTextBuilder: IioTextBuilder;
begin
  Result := TioTextBuilder.Create(SCRIPT_INDENTATION_WIDTH);
end;

function TioDBBuilderSqlGenBase.BuildDropForeignKeySql(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName: string;
begin
  LFKName := BuildForeignKeyNameSql(ATable, AForeignKey);

  Result := BuildDropForeignKeySql(ATable.Name, LFKName);
end;

end.
