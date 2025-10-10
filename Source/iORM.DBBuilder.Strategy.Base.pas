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
    function SequenceExists(const ASequenceName: string): boolean;
  protected
    procedure AddOrAlterFields(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateDatabase; virtual; abstract;
    procedure CreateForeignKeys(const AScript: IioDBBuilderSqlScript); overload; virtual;
    procedure CreateForeignKeys(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure CreateIndexes(const AScript: IioDBBuilderSqlScript); overload; virtual;
    procedure CreateIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure CreateOrAlterTables(const AScript: IioDBBuilderSqlScript); virtual;
    procedure CreateSequences(const AScript: IioDBBuilderSqlScript); virtual;
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateTables(const AScript: IioDBBuilderSqlScript); virtual;
    function DatabaseExists: Boolean; virtual; abstract;
    procedure DropForeignKeys(const AScript: IioDBBuilderSqlScript); virtual;
    procedure DropIndexes(const AScript: IioDBBuilderSqlScript); virtual;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); virtual; abstract;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; virtual; abstract;

    property ConnectionDefName: string read GetConnectionDefName;
    property Schema: IioDBBuilderSchema read GetSchema;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);

    //procedure GenerateCreateOrAlterScript(const AScript: IioDBBuilderSqlScript); virtual;
    procedure GenerateCreateDatabaseScript(const AScript: IioDBBuilderSqlScript); virtual;
    procedure GenerateUpdateDatabaseScript(const AScript: IioDBBuilderSqlScript); virtual;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,

  iORM.Attributes,
  iORM.DB.ConnectionContainer,
  iORM.DBBuilder.QueryEngine

  ;

{ TioDBBuilderStrategyBase }

procedure TioDBBuilderStrategyBase.AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  AScript.AddTitle(Format('Altering table ''%s''', [ATable.TableName]));
end;

constructor TioDBBuilderStrategyBase.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
  FConnectionDefName := AConnectionDefName;
end;

procedure TioDBBuilderStrategyBase.CreateForeignKeys(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.AddTitle('Creating foreign keys');

  for LTable in Schema.Tables.Values do
    CreateForeignKeys(AScript, LTable);
end;

procedure TioDBBuilderStrategyBase.CreateForeignKeys(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  for LForeignKey in ATable.ForeignKeys.Values do
    AScript.Add(SqlGenerator.BuildAddForeignKeySql(LForeignKey));
end;

procedure TioDBBuilderStrategyBase.CreateIndexes(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.AddTitle('Creating indexes');

  AScript.IncIndentationLevel;

  for LTable in Schema.Tables.Values do
    CreateIndexes(AScript, LTable);

  AScript.DecIndentationLevel;
end;

procedure TioDBBuilderStrategyBase.CreateIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LIndex: ioIndex;
begin
  LComma := EmptyStr;

  for LIndex in ATable.Indexes do
  begin
    AScript.Add(SqlGenerator.BuildAddIndexSql(ATable, LIndex));
    LComma := ', ';
  end;
end;

procedure TioDBBuilderStrategyBase.AddOrAlterFields(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  LComma := EmptyStr;

  for LField in ATable.Fields do
  begin
    case LField.Status of
      stCreate:
        begin
          AScript.Add(LComma + SqlGenerator.BuildAddFieldSql(LField));
          LComma := ', ';
        end;
      stAlter:
        begin
          AScript.Add(LComma + SqlGenerator.BuildAlterFieldSql(LField));
          LComma := ', ';
        end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterTables(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
  begin
    case LTable.Status of
      stCreate:
        CreateTable(AScript, LTable);
      stAlter:
        AlterTable(AScript, LTable);
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateSequences(const AScript: IioDBBuilderSqlScript);
var
  LSequence: String;
begin
  if Schema.Sequences.Count = 0 then
    Exit;

  AScript.AddTitle('Creating sequences (if empty, no sequence needs to be created)');

  for LSequence in Schema.Sequences do
  begin
    // Check if sequence exists, then create it
    if (Schema.Status = stCreate) or (not SequenceExists(LSequence)) then
      AScript.Add(GetSqlGenerator.BuildAddSequenceSql(LSequence, Schema.Status = stCreate));
  end;
end;

procedure TioDBBuilderStrategyBase.CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  AScript.AddTitle(Format('Creating table ''%s''', [ATable.TableName]));
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
  if Schema.Status = stCreate then
    Exit;

  AScript.AddTitle('Dropping foreign keys');
end;

procedure TioDBBuilderStrategyBase.DropIndexes(const AScript: IioDBBuilderSqlScript);
begin
  if Schema.Status = stCreate then
    Exit;

  AScript.AddTitle('Dropping indexes');
end;

procedure TioDBBuilderStrategyBase.GenerateCreateDatabaseScript(const AScript: IioDBBuilderSqlScript);
begin
  Schema.Status := stCreate;

  AScript.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);

  if Schema.WarningExists then
    AScript.AddWarnings(Schema.Warnings);

  GenerateDatabaseObjects(AScript, True);

  AScript.ScriptEnd;
end;

//procedure TioDBBuilderStrategyBase.GenerateCreateOrAlterScript(const AScript: IioDBBuilderSqlScript);
//begin
//  AScript.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);
//
//  if Schema.WarningExists then
//    AScript.AddWarnings(Schema.Warnings);
//
//  GenerateDatabaseObjects(AScript, True);
//
//  AScript.ScriptEnd;
//end;

procedure TioDBBuilderStrategyBase.GenerateUpdateDatabaseScript(const AScript: IioDBBuilderSqlScript);
begin
  Schema.Status := stAlter;

  AScript.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);

  if Schema.WarningExists then
    AScript.AddWarnings(Schema.Warnings);

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

function TioDBBuilderStrategyBase.SequenceExists(const ASequenceName: string): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, GetSqlGenerator.BuildSequenceExistsSql(ASequenceName));
  Result := LQuery.Fields[0].AsInteger > 0;
end;

function TioDBBuilderStrategyBase.GetSqlGenerator: IioDBBuilderSqlGenerator;
begin
  Result := FSqlGenerator;
end;

end.
