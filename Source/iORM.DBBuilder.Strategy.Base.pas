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
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    FConnectionDefName: string;

    function GetSchema: IioDBBuilderSchema;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    function GetConnectionDefName: string;
  protected
    procedure AddOrAlterFields(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure AddOrAlterForeignKeys(const AScript: IioDBBuilderSqlScript); virtual;
    procedure AddOrAlterIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateDatabase; virtual; abstract;
    procedure CreateForeignKeys(const AScript: IioDBBuilderSqlScript); overload; virtual;
    procedure CreateIndexes(const AScript: IioDBBuilderSqlScript); overload; virtual;
    procedure CreateOrAlterTables(const AScript: IioDBBuilderSqlScript); virtual;
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateTableForeignKeys(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure CreateTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure CreateTables(const AScript: IioDBBuilderSqlScript); virtual;
    function DatabaseExists: Boolean; virtual; abstract;
    procedure DropForeignKeys(const AScript: IioDBBuilderSqlScript); virtual;
    procedure DropIndexes(const AScript: IioDBBuilderSqlScript); virtual;
    procedure DropTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; overload; virtual; abstract;
    function IndexExists(const AIndexName: string): boolean; overload; virtual; abstract;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; virtual; abstract;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; virtual; abstract;

    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); virtual; abstract;

    // Warning methods (common to all databases)
    procedure WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string); virtual;
    procedure WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;

    // Field change detection methods (common to all databases)
    function GetInvalidTypeConversions: string; virtual; abstract;
    function IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean; virtual;

    property ConnectionDefName: string read GetConnectionDefName;
    property Schema: IioDBBuilderSchema read GetSchema;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);

    procedure GenerateCreateDatabaseScript(const AScript: IioDBBuilderSqlScript); virtual;
    procedure GenerateUpdateDatabaseScript(const AScript: IioDBBuilderSqlScript); virtual;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,

  iORM.Exceptions,
  iORM.DB.ConnectionContainer,
  iORM.DBBuilder.QueryEngine

  ;

{ TioDBBuilderStrategyBase }

procedure TioDBBuilderStrategyBase.AddOrAlterForeignKeys(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
  LFK: IioDBBuilderSchemaFK;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'AddOrAlterForeignKeys', 'AScript is not assigned.');

  for LTable in Schema.Tables.Values do
  begin
    if taForeignKeys in LTable.Changes then
    begin
      AScript.Body.AddTitle(Format('Foreign keys for table ''%s''', [LTable.Name]));

      for LFK in LTable.ForeignKeys.Values do
      begin
        case LFK.Status of
          stCreate:
            begin
              AScript.Body.Add(SqlGenerator.BuildAddForeignKeySql(LTable, LFK));
            end;
          stUpdate:
            begin
              AScript.Body.Add(SqlGenerator.BuildDropForeignKeySql(LTable, LFK));
              AScript.Body.Add(SqlGenerator.BuildAddForeignKeySql(LTable, LFK));
            end;
        end;
      end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.AddOrAlterIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'AddOrAlterIndexes', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'AddOrAlterIndexes', 'ATable is not assigned.');

  for LIndex in ATable.Indexes.Values do
  begin
    case LIndex.Status of
      stCreate:
        begin
          AScript.Body.Add(SqlGenerator.BuildAddIndexSql(ATable, LIndex));
        end;
      stUpdate:
        begin
          AScript.Body.Add(SqlGenerator.BuildDropIndexSql(ATable, LIndex));
          AScript.Body.Add(SqlGenerator.BuildAddIndexSql(ATable, LIndex));
        end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'AlterTable', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'AlterTable', 'ATable is not assigned.');

  if (ATable.Status <> stUpdate) or (ATable.Changes = [taForeignKeys]) then
    exit;

  AScript.Body.AddTitle(Format('Altering table ''%s''', [ATable.Name]));
end;

constructor TioDBBuilderStrategyBase.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  if not Assigned(ASchema) then
    raise EioArgumentNilException.Create(ClassName, 'Create', 'ASchema is not assigned.');

  if not Assigned(ASqlGenerator) then
    raise EioArgumentNilException.Create(ClassName, 'Create', 'ASqlGenerator is not assigned.');

  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
  FConnectionDefName := AConnectionDefName;
end;

procedure TioDBBuilderStrategyBase.CreateForeignKeys(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateForeignKeys', 'AScript is not assigned.');

  AScript.Body.AddTitle('Creating foreign keys');

  for LTable in Schema.Tables.Values do
    CreateTableForeignKeys(AScript, LTable);
end;

procedure TioDBBuilderStrategyBase.CreateTableForeignKeys(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateForeignKeys', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'CreateForeignKeys', 'ATable is not assigned.');

  for LForeignKey in ATable.ForeignKeys.Values do
    AScript.Body.Add(SqlGenerator.BuildAddForeignKeySql(ATable, LForeignKey));
end;

procedure TioDBBuilderStrategyBase.CreateIndexes(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateIndexes', 'AScript is not assigned.');

  AScript.Body.AddTitle('Creating indexes');

  AScript.Body.IncIndentationLevel;

  for LTable in Schema.Tables.Values do
    CreateTableIndexes(AScript, LTable);

  AScript.Body.DecIndentationLevel;
end;

procedure TioDBBuilderStrategyBase.CreateTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateTableIndexes', 'AScript is not assigned.');

  for LIndex in ATable.Indexes.Values do
  begin
    // Carlo Marona (2025-10-16): Check if index already exists before create. If exists skip it.
    if LIndex.Status = stUpdate then
    begin
      // If the index was changed, drops the old one then recreate it with updates
      AScript.Body.Add(SqlGenerator.BuildDropIndexSql(SqlGenerator.BuildIndexNameSql(ATable, LIndex)));
    end;

    if (ATable.Status = stCreate) or (LIndex.Status in [stCreate, stUpdate]) then
      AScript.Body.Add(SqlGenerator.BuildAddIndexSql(ATable, LIndex));
  end;
end;

procedure TioDBBuilderStrategyBase.AddOrAlterFields(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'AddOrAlterFields', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'AddOrAlterFields', 'ATable is not assigned.');

  for LField in ATable.Fields do
  begin
    case LField.Status of
      stCreate:
        begin
          AScript.Body.Add(SqlGenerator.BuildBeginAlterTableSql(ATable));
          AScript.Body.IncIndentationLevel;
          AScript.Body.Add(SqlGenerator.BuildAddFieldSql(LField));
          AScript.Body.DecIndentationLevel;
          AScript.Body.Add(SqlGenerator.BuildEndAlterTableSql(ATable));
        end;
      stUpdate:
        begin
          AScript.Body.Add(SqlGenerator.BuildAlterFieldSql(ATable, LField));
        end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterTables(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateOrAlterTables', 'AScript is not assigned.');

  for LTable in Schema.Tables.Values do
  begin
    case LTable.Status of
      stCreate:
        CreateTable(AScript, LTable);
      stUpdate:
        AlterTable(AScript, LTable);
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateTable', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'CreateTable', 'ATable is not assigned.');

  AScript.Body.AddTitle(Format('Creating table ''%s''', [ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.CreateTables(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
    CreateTable(AScript, LTable);
end;

procedure TioDBBuilderStrategyBase.DropForeignKeys(const AScript: IioDBBuilderSqlScript);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'DropForeignKeys', 'AScript is not assigned.');

  if Schema.Status = stCreate then
    Exit;

  AScript.Body.AddTitle('Dropping foreign keys');
end;

procedure TioDBBuilderStrategyBase.DropIndexes(const AScript: IioDBBuilderSqlScript);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'DropIndexes', 'AScript is not assigned.');

  if Schema.Status = stCreate then
    Exit;

  AScript.Body.AddTitle('Dropping indexes');
end;

procedure TioDBBuilderStrategyBase.DropTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'DropTableIndexes', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'DropTableIndexes', 'ATable is not assigned.');

  if Schema.Status = stCreate then
    Exit;

  AScript.Body.AddTitle('Dropping indexes');
end;

procedure TioDBBuilderStrategyBase.GenerateCreateDatabaseScript(const AScript: IioDBBuilderSqlScript);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'GenerateCreateDatabaseScript', 'AScript is not assigned.');

  Schema.Status := stCreate;

  AScript.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);

  if Schema.WarningExists then
    AScript.Body.AddWarnings(Schema.Warnings);

  GenerateDatabaseObjects(AScript, True);

  AScript.ScriptEnd;
end;

procedure TioDBBuilderStrategyBase.GenerateUpdateDatabaseScript(const AScript: IioDBBuilderSqlScript);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'GenerateUpdateDatabaseScript', 'AScript is not assigned.');

  Schema.Status := stUpdate;

  AScript.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);

  if Schema.WarningExists then
    AScript.Body.AddWarnings(Schema.Warnings);

  GenerateDatabaseObjects(AScript, False);

  AScript.ScriptEnd;
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

end.
