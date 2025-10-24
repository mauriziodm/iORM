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
  iORM.Attributes

  ;

type
  TioDBBuilderSqlGenSQLite = class(TioDBBuilderSqlGenBase)
  private
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean = true): String; override;
  protected
    function TValueToSql(const AValue: TValue): string; override;
  public
    // Tables related methods
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildTableExistsSql(const ATableName: string): string; override;
    // Fields related methods
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAlterFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    // Indexes related methods
    function BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildIndexExistsSql(const AIndexName: string): string; override;
    function BuildListTableIndexesSql(const ATable: IioDBBuilderSchemaTable): string; override;
    // Foreign keys
    function BuildAddForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string; override;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,

  iORM.DB.Interfaces,
  iORM.Context.Properties.Interfaces,
  iORM.Exceptions,
  iORM.CommonTypes,
  iORM.SqlTranslator,
  iORM.TextBuilder.Interfaces,
  iORM.DB.SqLite.SqlDataConverter

  ;

{ TioDBBuilderSqlGenSQLite }

function TioDBBuilderSqlGenSQLite.BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
//  Result := Format('%s%s', [ACommaBefore, InternalCreateField(AField)]);
  Result := InternalCreateField(AField);
end;

function TioDBBuilderSqlGenSQLite.BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
var
  LSqlText, LIndexName, LFieldList, LUnique: String;
begin
  LIndexName := BuildIndexNameSql(ATable, AIndex);
  LUnique := BuildIndexUnique(AIndex);
  LFieldList := BuildIndexFieldList(ATable, AIndex, LIndexName, True);
  // Compose the create index query text
  LSqlText := Format('CREATE %s INDEX IF NOT EXISTS %s ON %s (%s);', [LUnique, LIndexName, ATable.TableName, LFieldList]);

  Result := LSqlText;
end;

function TioDBBuilderSqlGenSQLite.BuildAlterFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
  // Do nothing. Can be removed?
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildEndCreateTableSql(ATable);
end;

function TioDBBuilderSqlGenSQLite.BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := ');';
end;

function TioDBBuilderSqlGenSQLite.BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  // Do nothing. Can be removed?
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('pragma table_info(''%s'')', [ATable.TableName]);
end;

function TioDBBuilderSqlGenSQLite.BuildIndexExistsSql(const AIndexName: string): string;
begin
  Result := Format('SELECT * FROM sqlite_master WHERE type = ''index'' and name = ''%s''', [AIndexName]);
end;

function TioDBBuilderSqlGenSQLite.BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildListTableIndexesSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildTableExistsSql(const ATableName: string): string;
begin
  Result := Format('pragma table_info(''%s'')', [ATableName]);
end;

function TioDBBuilderSqlGenSQLite.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // If primary key...
  // Carlo Marona (2025-10-16): No need to add AUTOINCREMENT keyword because when PRIMARY KEY is used SqLite internally uses an autoincrement column
  if AField.PrimaryKey then
    Result := Format('"%s" INTEGER PRIMARY KEY NOT NULL', [AField.FieldName])
  else
  begin
    // Extract the default value if extsts
    LDefault := ExtractFieldDefaultValue(AField);
    LNotNull := IfThen(AField.FieldNotNull, 'NOT NULL', 'NULL');
    Result := Format('"%s" %s %s %s', [AField.FieldName, TranslateFieldType(AField), LNotNull, LDefault]).Trim;
  end;
end;

function TioDBBuilderSqlGenSQLite.TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean): String;
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
      Result := 'REAL'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdTime:
      Result := 'REAL'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdDateTime:
      Result := 'REAL'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdDecimal:
      Result := 'NUMERIC';
    ioMdNumeric:
      Result := 'NUMERIC';
    ioMdBoolean:
      Result := 'INTEGER'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdBinary:
      Result := 'BLOB';
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioGenericException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
  end;
end;

function TioDBBuilderSqlGenSQLite.TValueToSql(const AValue: TValue): string;
begin
  Result := TioSqlDataConverterSqLite.TValueToSql(AValue);
end;

function TioDBBuilderSqlGenSQLite.BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
  // Do nothing. Can be removed?
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildAddForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LTextBuilder: IioTextBuilder;
begin
  LTextBuilder := NewTextBuilder;

  LTextBuilder.Add(
    Format(', CONSTRAINT "%s" FOREIGN KEY ("%s") REFERENCES "%s" ("%s")', [
      AForeignKey.Name,
      AForeignKey.DependentFieldName,
      AForeignKey.ReferenceTableName,
      AForeignKey.ReferenceFieldName
    ])
  );

  if AForeignKey.OnUpdateAction > fkUnspecified then
    LTextBuilder.Add(Format(' ON UPDATE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction)]));

  if AForeignKey.OnDeleteAction > fkUnspecified then
    LTextBuilder.Add(Format(' ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]));

  LTextBuilder.
    Add(' DEFERRABLE INITIALLY DEFERRED');

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenSQLite.BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildBeginCreateTableSql(ATable);
end;

function TioDBBuilderSqlGenSQLite.BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('CREATE TABLE %s (', [ATable.TableName]);
end;

end.
