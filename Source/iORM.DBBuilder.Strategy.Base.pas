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
unit iORM.DBBuilder.Strategy.Base;

interface

uses
  iORM.Attributes,
  iORM.DBBuilder.Interfaces,
  iORM.DB.Interfaces;

type

  TioDBBuilderStrategyBase = class(TInterfacedObject, IioDBBuilderStrategy)
  private
    FConnectionDefName: string;
    FSchema: IioDBBuilderSchema;
    FScript: IioDBBuilderSqlScript;
    FSqlGenerator: IioDBBuilderSqlGenerator;

    function GetConnectionDefName: string;
    function GetSchema: IioDBBuilderSchema;
    function GetScript: IioDBBuilderSqlScript;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    // Helper method for existence queries (common pattern)
    function _ExecuteExistsQuery(const ASql: string): Boolean;
  protected
    // Database
    procedure CreateDatabase; virtual;
    function DatabaseExists: Boolean; virtual;
    // Tables
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateOrAlterTables; virtual;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateTables; virtual;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    // Fields
    procedure AddOrAlterFields(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateTableIndexes(const ATable: IioDBBuilderSchemaTable); overload; virtual;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    // Field change detection methods (common to all databases)
    function GetInvalidTypeConversions: string; virtual; abstract;
    function IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean; virtual;
    // Indexes
    procedure AddOrAlterIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateIndexes; overload; virtual;
    procedure DropIndexes; virtual;
    procedure DropTableIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; overload; virtual; abstract;
    function IndexExists(const AIndexName: string): boolean; overload; virtual;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; virtual; abstract;
    // ForeignKeys
    procedure AddOrAlterForeignKeys; virtual;
    procedure CreateForeignKeys; overload; virtual;
    procedure CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure DropForeignKeys; virtual;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;
    // Warnings
    procedure WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string); virtual;
    procedure WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;

    procedure GenerateDatabaseObjects(const Create: boolean); virtual; abstract;

    property ConnectionDefName: string read GetConnectionDefName;
    property Schema: IioDBBuilderSchema read GetSchema;
    property Script: IioDBBuilderSqlScript read GetScript;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator; const AScript: IioDBBuilderSqlScript);

    procedure GenerateCreateDatabaseScript; virtual;
    procedure GenerateUpdateDatabaseScript; virtual;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,

  iORM.Exceptions,
  iORM.DB.ConnectionContainer,
  iORM.DB.QueryEngine

  ;

{ TioDBBuilderStrategyBase }

procedure TioDBBuilderStrategyBase.AddOrAlterForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
  LFK: IioDBBuilderSchemaFK;
begin
  for LTable in Schema.Tables.Values do
  begin
    if taForeignKeys in LTable.Changes then
    begin
      Script.Body.AddTitle(Format('Foreign keys for table ''%s''', [LTable.Name]));

      for LFK in LTable.ForeignKeys.Values do
      begin
        case LFK.Status of
          stCreate:
            begin
              Script.Body.Add(SqlGenerator.BuildAddForeignKeySql(LTable, LFK));
            end;
          stUpdate:
            begin
              Script.Body.Add(SqlGenerator.BuildDropForeignKeySql(LTable, LFK));
              Script.Body.Add(SqlGenerator.BuildAddForeignKeySql(LTable, LFK));
            end;
        end;
      end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.AddOrAlterIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'AddOrAlterIndexes', 'ATable is not assigned.');

  for LIndex in ATable.Indexes.Values do
  begin
    case LIndex.Status of
      stCreate:
        begin
          Script.Body.Add(SqlGenerator.BuildSQL_AddIndex(ATable, LIndex));
        end;
      stUpdate:
        begin
          Script.Body.Add(SqlGenerator.BuildSQL_DropIndex(ATable, LIndex));
          Script.Body.Add(SqlGenerator.BuildSQL_AddIndex(ATable, LIndex));
        end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'AlterTable', 'ATable is not assigned.');

  if (ATable.Status <> stUpdate) or (ATable.Changes = [taForeignKeys]) then
    exit;

  Script.Body.AddTitle(Format('Altering table ''%s''', [ATable.Name]));
end;

constructor TioDBBuilderStrategyBase.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema;
  const ASqlGenerator: IioDBBuilderSqlGenerator; const AScript: IioDBBuilderSqlScript);
begin
  if not Assigned(ASchema) then
    raise EioInvalidArgumentException.Create(ClassName, 'Create', 'ASchema is not assigned.');

  if not Assigned(ASqlGenerator) then
    raise EioInvalidArgumentException.Create(ClassName, 'Create', 'ASqlGenerator is not assigned.');

  FConnectionDefName := AConnectionDefName;
  FSchema := ASchema;
  FScript := AScript;
  FSqlGenerator := ASqlGenerator;
end;

function TioDBBuilderStrategyBase.GetScript: IioDBBuilderSqlScript;
begin
  if not Assigned(FScript) then
    raise EioInvalidArgumentException.Create(ClassName, 'GetScript',
      'Script is not assigned. This operation requires a valid Script instance.');
  Result := FScript;
end;

procedure TioDBBuilderStrategyBase.CreateDatabase;
begin
  SqlGenerator.CreateDatabase;
end;

function TioDBBuilderStrategyBase.DatabaseExists: Boolean;
begin
  Result := SqlGenerator.DatabaseExists;
end;

procedure TioDBBuilderStrategyBase.CreateForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Creating foreign keys');

  for LTable in Schema.Tables.Values do
    CreateTableForeignKeys(LTable);
end;

procedure TioDBBuilderStrategyBase.CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'CreateTableForeignKeys', 'ATable is not assigned.');

  for LForeignKey in ATable.ForeignKeys.Values do
    Script.Body.Add(SqlGenerator.BuildAddForeignKeySql(ATable, LForeignKey));
end;

procedure TioDBBuilderStrategyBase.CreateIndexes;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Creating indexes');

  Script.Body.IncIndentationLevel;

  for LTable in Schema.Tables.Values do
    CreateTableIndexes(LTable);

  Script.Body.DecIndentationLevel;
end;

procedure TioDBBuilderStrategyBase.CreateTableIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LIndex in ATable.Indexes.Values do
  begin
    // Carlo Marona (2025-10-16): Check if index already exists before create. If exists skip it.
    if LIndex.Status = stUpdate then
    begin
      // If the index was changed, drops the old one then recreate it with updates
      Script.Body.Add(SqlGenerator.BuildSQL_DropIndexByName(SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, LIndex)));
    end;

    if (ATable.Status = stCreate) or (LIndex.Status in [stCreate, stUpdate]) then
      Script.Body.Add(SqlGenerator.BuildSQL_AddIndex(ATable, LIndex));
  end;
end;

procedure TioDBBuilderStrategyBase.AddOrAlterFields(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'AddOrAlterFields', 'ATable is not assigned.');

  for LField in ATable.Fields do
  begin
    case LField.Status of
      stCreate:
        begin
          Script.Body.Add(SqlGenerator.BuildBeginAlterTableSql(ATable));
          Script.Body.IncIndentationLevel;
          Script.Body.Add(SqlGenerator.BuildAddFieldSql(LField));
          Script.Body.DecIndentationLevel;
          Script.Body.Add(SqlGenerator.BuildEndAlterTableSql(ATable));
        end;
      stUpdate:
        begin
          Script.Body.Add(SqlGenerator.BuildAlterFieldSql(ATable, LField));
        end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
  begin
    case LTable.Status of
      stCreate:
        CreateTable(LTable);
      stUpdate:
        AlterTable(LTable);
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'CreateTable', 'ATable is not assigned.');

  Script.Body.AddTitle(Format('Creating table ''%s''', [ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.CreateTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
    CreateTable(LTable);
end;

procedure TioDBBuilderStrategyBase.DropForeignKeys;
begin
  if Schema.Status = stCreate then
    Exit;

  Script.Body.AddTitle('Dropping foreign keys');
end;

procedure TioDBBuilderStrategyBase.DropIndexes;
begin
  if Schema.Status = stCreate then
    Exit;

  Script.Body.AddTitle('Dropping indexes');
end;

procedure TioDBBuilderStrategyBase.DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'DropTableIndexes', 'ATable is not assigned.');

  for LIndex in ATable.Indexes.Values do
    Script.Body.Add(SqlGenerator.BuildSQL_DropIndex(ATable, LIndex));
end;

procedure TioDBBuilderStrategyBase.GenerateCreateDatabaseScript;
begin
  Schema.Status := stCreate;

  Script.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);

  if Schema.WarningExists then
    Script.Body.AddWarnings(Schema.Warnings);

  GenerateDatabaseObjects(True);

  Script.ScriptEnd;
end;

procedure TioDBBuilderStrategyBase.GenerateUpdateDatabaseScript;
begin
  Schema.Status := stUpdate;

  Script.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);

  if Schema.WarningExists then
    Script.Body.AddWarnings(Schema.Warnings);

  GenerateDatabaseObjects(False);

  Script.ScriptEnd;
end;

function TioDBBuilderStrategyBase.GetConnectionDefName: string;
begin
  Result := FConnectionDefName;
end;

function TioDBBuilderStrategyBase.GetSchema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

function TioDBBuilderStrategyBase.GetSqlGenerator: IioDBBuilderSqlGenerator;
begin
  Result := FSqlGenerator;
end;

procedure TioDBBuilderStrategyBase.WarningTypeAffinity(const AOldFieldType, ANewFieldType: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
  if ContainsText(AInvalidTypeConversions, LRequiredConversion) then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''',
      [ATable.Name, AField.FieldName, AOldFieldType, ANewFieldType]));
end;

procedure TioDBBuilderStrategyBase.WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull <> AOldFieldNotNull then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The not null setting cannot be changed automatically',
      [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategyBase.WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull and (not AOldFieldNotNull) and (not AField.FieldDefaultExists) then
    Schema.Warnings.Add
      (Format('Table ''%s'' field ''%s'' --> The not null setting is changed from false to true and a default value has not been specified',
      [ATable.Name, AField.FieldName]));
end;

function TioDBBuilderStrategyBase.IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := not SameText(AOldFieldType, ANewFieldType);
  if Result then
  begin
    AField.AddAltered(alFieldType);
    WarningTypeAffinity(AOldFieldType, ANewFieldType, AField, ATable, GetInvalidTypeConversions);
  end;
end;

function TioDBBuilderStrategyBase.IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean;
begin
  Result := AOldFieldNotNull <> ANewFieldNotNull;
  if Result then
  begin
    AField.AddAltered(alFieldNotNull);
    if AIsPermitted then
      WarningNullBecomesNotNull(AOldFieldNotNull, AField, ATable)
    else
      WarningNotNullCannotBeChanged(AOldFieldNotNull, AField, ATable);
  end;
end;

function TioDBBuilderStrategyBase._ExecuteExistsQuery(const ASql: string): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, ASql, True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyBase.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := _ExecuteExistsQuery(SqlGenerator.BuildTableExistsSql(ATable.Name));
end;

function TioDBBuilderStrategyBase.IndexExists(const AIndexName: string): boolean;
begin
  Result := False;

  if AIndexName.IsEmpty then
    Exit;

  Result := _ExecuteExistsQuery(SqlGenerator.BuildSQL_IndexExistsByName(AIndexName));
end;

end.
