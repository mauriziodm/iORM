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
unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, System.Classes, iORM.Context.Map.Interfaces;

type

  TioDBBuilderSchema = class(TInterfacedObject, IioDBBuilderSchema)
  private
    FConnectionDefName: String;
    FIndexesEnabled, FForeignKeysEnabled: Boolean;
    FSequences: TioDBBuilderSchemaSequences;
    FScript: TStrings;
    FStatus: TioDBBuilderStatus;
    FTables: TioDBBuilderSchemaTables;
    FWarnings: TStrings;
    // DBExists
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
  public
    constructor Create(const AConnectionDefName: String; const AIndexesEnabled, AForeignKeysEnabled: Boolean);
    destructor Destroy; override;
    function ConnectionDefName: String;
    function DatabaseFileName: String;
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function ForeignKeysEnabled: Boolean;
    function IndexesEnabled: Boolean;
    procedure SequenceAddIfNotExists(const ASequenceName: String);
    function Sequences: TioDBBuilderSchemaSequences;
    function Script: TStrings;
    function ScriptIsEmpty: Boolean;
    function Warnings: TStrings;
    function WarningExists: Boolean;
    function Tables: TioDBBuilderSchemaTables;

    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  iORM.DBBuilder.Factory, iORM.Exceptions, System.SysUtils, iORM.DB.ConnectionContainer, iORM.DB.Factory;

{ TioDBBuilderSchema }

function TioDBBuilderSchema.ConnectionDefName: String;
begin
  Result := FConnectionDefName;
end;

constructor TioDBBuilderSchema.Create(const AConnectionDefName: String; const AIndexesEnabled, AForeignKeysEnabled: Boolean);
begin
  FScript := TStringList.Create;
  FSequences := TioDBBuilderSchemaSequences.Create;
  FIndexesEnabled := AIndexesEnabled;
  FForeignKeysEnabled := AForeignKeysEnabled;
  FStatus := stClean;
  FConnectionDefName := TioDBFActory.ConnectionManager.GetCurrentConnectionNameIfEmpty(AConnectionDefName);
  FWarnings := TStringList.Create;
  FTables := TioDBBuilderSchemaTables.Create;
end;

function TioDBBuilderSchema.DatabaseFileName: String;
begin
  Result := TioConnectionManager.GetDatabaseFileName(FConnectionDefName);
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FWarnings.Free;
  FTables.Free;
  FSequences.Free;
  FScript.Free;
  inherited;
end;

function TioDBBuilderSchema.FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
var
  LTableName: String;
begin
  LTableName := AMap.GetTable.TableName;
  if not FTables.ContainsKey(LTableName) then
    FTables.Add(LTableName, TioDBBuilderFactory.NewSchemaTable(AMap.GetTable));
  Result := FTables.Items[LTableName];
  // NB: Se anche una sola classe mappata su questa tabella è TrueClass allora IsTrueClass deve essere true
  // (vedi setter nella classe)
  Result.IsTrueClass := AMap.GetTable.IsTrueClass;
end;

function TioDBBuilderSchema.FindTable(const ATableName: String): IioDBBuilderSchemaTable;
begin
  if FTables.ContainsKey(ATableName) then
    Result := FTables.Items[ATableName]
  else
    Result := nil;
end;

function TioDBBuilderSchema.ForeignKeysEnabled: Boolean;
begin
  Result := FForeignKeysEnabled;
end;

function TioDBBuilderSchema.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchema.IndexesEnabled: Boolean;
begin
  Result := FIndexesEnabled;
end;

procedure TioDBBuilderSchema.SequenceAddIfNotExists(const ASequenceName: String);
begin
  if ASequenceName.Trim.IsEmpty then
    raise EioGenericException.Create(ClassName, 'SequenceAddIfNotExists', Format('Invalid sequence name "%s"', [ASequenceName]));
  if FSequences.IndexOf(ASequenceName) = -1 then
    FSequences.Add(ASequenceName);
end;

function TioDBBuilderSchema.Sequences: TioDBBuilderSchemaSequences;
begin
  Result := FSequences;
end;

procedure TioDBBuilderSchema.SetStatus(const AValue: TioDBBuilderStatus);
begin
  if AValue > FStatus then
    FStatus := AValue;
end;

function TioDBBuilderSchema.Script: TStrings;
begin
  Result := FScript;
end;

function TioDBBuilderSchema.ScriptIsEmpty: Boolean;
begin
  Result := FScript.Count = 0;
end;

function TioDBBuilderSchema.Tables: TioDBBuilderSchemaTables;
begin
  Result := FTables;
end;

function TioDBBuilderSchema.Warnings: TStrings;
begin
  Result := FWarnings;
end;

function TioDBBuilderSchema.WarningExists: Boolean;
begin
  Result := FWarnings.Count > 0;
end;

end.
