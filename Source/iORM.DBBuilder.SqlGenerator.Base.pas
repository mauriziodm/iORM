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
    FDataConverter: TioSqlDataConverterRef;
  protected
    function ExtractFieldDefaultValue(const AField: IioDBBuilderSchemaField): string;
    function GetMaxSqlIdentifierLength: integer; virtual;
    function GetMinSqlIdentifierLength: integer; virtual;
    function NewTempObjectName(const AMaxLength: integer): string;
    function NewTextBuilder: IioTextBuilder; overload;
    function NewTextBuilder(const AIndentation: TioIndentation): IioTextBuilder; overload;
    function ShortenIdentifierName(const AIdentifierName: string; const AMaxLength: integer): string;
    function TranslateFKAction(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;

    // Database
    procedure CreateDatabase; virtual; abstract;
    function DatabaseExists: Boolean; virtual; abstract;
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
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const AExcludeTypeAttributes: boolean): String; virtual; abstract;
    // PrimaryKeys
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;





    // Index related methods
    // ------------------------------------------
    function BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual; abstract;
    function BuildSQL_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual;
    function BuildSQL_DropIndexByName(const AIndexName: string): string; virtual; abstract;
    function BuildSQL_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string; virtual; abstract;
    // Returns list of indexes with basic info (name, unique, orientation)
    // If ATableName is empty, returns all indexes from DB
    // If ATableName is specified, returns indexes for that table only
    function BuildSQL_IndexList(const ATableName: string = ''): string; virtual; abstract;
    // Returns detailed info about an index (list of fields with position/order)
    function BuildSQL_IndexDetails(const AIndexName: string): string; virtual; abstract;

    function Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    function Translate_SchemaIndex_To_Orientation(const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    function Translate_SchemaIndex_To_Unique(const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    function Translate_SchemaTableAndIndex_To_IndexName(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    function Translate_Unique_To_UniqueSuffixForIndexName(const Unique: boolean): string; virtual;
    function Translate_Orientation_To_OrientationSuffixForIndexName(const AOrientation: TioIndexOrientation): string; virtual;
    // ------------------------------------------






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

    property ConnectionDefName: string read FConnectionDefName;
    property DataConverter: TioSqlDataConverterRef read FDataConverter;
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
    fkUnspecified, fkNoAction:
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

function TioDBBuilderSqlGenBase.BuildSQL_DropIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): string;
var
  LIndexName: string;
begin
  LIndexName := Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);
  Result := BuildSQL_DropIndexByName(LIndexName);
end;

function TioDBBuilderSqlGenBase.BuildForeignKeyNameSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK;
  const UpperCase: boolean): string;
var
  LFKName: String;
begin
  // Build FK name
  LFKName := 'FK_' + AForeignKey.Name;
  LFKName := TioSqlTranslator.Translate(LFKName, ATable.GetContextTable.GetClassName, False);

  // If name exceeds max length, recalculate using shortening algorithm
  if SqlIdentifierExeedMaxLength(LFKName) then
  begin
    // Max length is reduced by the length of 'FK_' prefix
    LFKName := 'FK_' + ShortenIdentifierName(
      Format('%s_%s_%s_%s', [AForeignKey.DependentTableName, AForeignKey.DependentFieldName,
        AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]),
      MaxSqlIdentifierLength - 3);
    LFKName := TioSqlTranslator.Translate(LFKName, ATable.GetContextTable.GetClassName, False);
  end;

  if UpperCase then
    Result := LFKName.ToUpper
  else
    Result := LFKName;
end;

function TioDBBuilderSqlGenBase.BuildSQL_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
begin
  Result := BuildSQL_IndexExistsByName(Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex));
end;

function TioDBBuilderSqlGenBase.Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String;
var
  LField, LOrientation, LComma: String;
begin
  Result := '';
  LComma := '';
  LOrientation := Translate_SchemaIndex_To_Orientation(AIndex);
  for LField in AIndex.CommaSepFieldList.Split([',']) do
  begin
    Result := Result + LComma + LField.Trim + ' ' + LOrientation;
    LComma := ', ';
  end;
end;

function TioDBBuilderSqlGenBase.Translate_SchemaTableAndIndex_To_IndexName(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): String;
var
  LFieldNameArray: TArray<string>;
  LField,
  LCoreIndexName,
  LFullIndexName: string;
begin
  if AIndex.HasExplicitName then
    LFullIndexName := TioSqlTranslator.Translate(AIndex.Name, ATable.GetContextTable.GetClassName, False)
  else
  begin
    // Build fields part (table + fields without spaces)
    LCoreIndexName := ATable.Name;
    LFieldNameArray := AIndex.CommaSepFieldList.Split([',']);
    for LField in LFieldNameArray do
      LCoreIndexName := LCoreIndexName + '_' + LField.Trim;

    // Build full index name with prefix and suffixes
    LFullIndexName := 'IDX_'
      + LCoreIndexName
      + Translate_Orientation_To_OrientationSuffixForIndexName(AIndex.Orientation)
      + Translate_Unique_To_UniqueSuffixForIndexName(AIndex.Unique);

    // If name exceeds max length, use hash of fields part only (without suffixes)
    if SqlIdentifierExeedMaxLength(LFullIndexName) then
      // Hash only the fields part, then add only the prefix (no suffixes needed with hash)
      LFullIndexName := 'IDX_' + ShortenIdentifierName(LCoreIndexName, MaxSqlIdentifierLength - 4);
  end;

  Result := LFullIndexName.ToUpper;
end;

function TioDBBuilderSqlGenBase.Translate_SchemaIndex_To_Orientation(const AIndex: IioDBBuilderSchemaIndex): String;
begin
  Result := EmptyStr;

  case AIndex.Orientation of
    ioAscending:
      Exit('ASC');
    ioDescending:
      Exit('DESC');
  end;
end;

function TioDBBuilderSqlGenBase.Translate_SchemaIndex_To_Unique(const AIndex: IioDBBuilderSchemaIndex): String;
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
  FDataConverter := TioDbFactory.SqlDataConverter(AConnectionDefName);
end;

function TioDBBuilderSqlGenBase.ExtractFieldDefaultValue(const AField: IioDBBuilderSchemaField): string;
var
  LFieldDefaultValue: TValue;
begin
  LFieldDefaultValue := AField.FieldDefault;

  if LFieldDefaultValue.IsEmpty then
    Result := ''
  else
    Result := 'DEFAULT ' + DataConverter.TValueToSql(LFieldDefaultValue);
end;

function TioDBBuilderSqlGenBase.Translate_Orientation_To_OrientationSuffixForIndexName(const AOrientation: TioIndexOrientation): string;
begin
  case AOrientation of
    ioAscending:
      Result := '_A';
    ioDescending:
      Result := '_D';
  end;
end;

function TioDBBuilderSqlGenBase.Translate_Unique_To_UniqueSuffixForIndexName(const Unique: boolean): string;
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
  Result := String.Empty;

  if Length(AIdentifierName) <= AMaxLength then
    Exit(AIdentifierName);

  // Changed shortening algorithm because there are some cases where different input names comes to the same shortened
  // name (collision).
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
