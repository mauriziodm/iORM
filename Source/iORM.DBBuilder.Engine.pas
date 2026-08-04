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
unit iORM.DBBuilder.Engine;

interface

uses
  System.Classes,

  iORM.CommonTypes,
  iORM.Context.Table.Interfaces,
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Script

  ;

type

  TioDBBuilderEngine = class(TInterfacedObject, IioDBBuilderEngine)
  private
    FConnectionDefName: string;
    FSchema: IioDBBuilderSchema;
    FScript: IioDBBuilderScript;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    procedure CreateDatabase;
    function GetSchema: IioDBBuilderSchema;
  public
    constructor Create(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function BuildScript_ForceCreateDB: IioDBBuilderScript;
    function BuildScript_SyncDBStruct: IioDBBuilderScript;
    procedure SyncDBStruct(const AForce: Boolean = False; const AScript: IioDBBuilderScript = nil);

    property Schema: IioDBBuilderSchema read GetSchema;
  end;

implementation

uses
  System.SysUtils,

  iORM.DBBuilder.Factory,
  iORM.Exceptions

  ;

{ TioDBBuilderEngine }

function TioDBBuilderEngine.BuildScript_ForceCreateDB: IioDBBuilderScript;
begin
  // Self-contained: FSchema is already fully populated from the class/entity maps (constructor
  // -> NewSchema -> BuildSchema, no DB access). GenerateScript_ForceCreate marks the whole tree
  // as stCreate. Result must NOT be executed against an existing database.
  TioDBBuilderFactory.NewStrategy(FConnectionDefName, FSchema, FSqlGenerator, FScript).GenerateScript_ForceCreate;
  Result := FScript;
end;

function TioDBBuilderEngine.BuildScript_SyncDBStruct: IioDBBuilderScript;
begin
  TioDBBuilderFactory.NewDBAnalyzer(FConnectionDefName, FSchema, FSqlGenerator, FScript).Analyze;
  // Status-driven: create or update, according to the status the DBAnalyzer just determined.
  TioDBBuilderFactory.NewStrategy(FConnectionDefName, FSchema, FSqlGenerator, FScript).GenerateScript_Sync;
  Result := FScript;
end;

constructor TioDBBuilderEngine.Create(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);
begin
  FConnectionDefName := AConnectionDefName;
  // SqlGenerator must be created BEFORE Schema so that kgsAuto can be resolved
  FSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(FConnectionDefName);
  FSchema := TioDBBuilderFactory.NewSchema(FConnectionDefName, AIndexesMode, AForeignKeysMode, FSqlGenerator);
  FScript := TioDBBuilderFactory.NewScript(FConnectionDefName);
end;

procedure TioDBBuilderEngine.CreateDatabase;
var
  LStrategy: IioDBBuilderStrategy;
begin
  LStrategy := TioDBBuilderFactory.NewStrategy(FConnectionDefName, FSchema, FSqlGenerator, FScript);
  LStrategy.ScriptWrite_CreateDatabase;
end;

function TioDBBuilderEngine.GetSchema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

procedure TioDBBuilderEngine.SyncDBStruct(const AForce: Boolean; const AScript: IioDBBuilderScript);
var
  LScript: IioDBBuilderScript;
begin
  if Assigned(AScript) then
    LScript := AScript
  else
    LScript := BuildScript_SyncDBStruct;

  if (FSchema.Status > stClean) or AForce then
  begin
    if LScript.Warnings.Lines.Count > 0 then
      raise EioDBBuilderException.Create(ClassName, 'SyncDBStruct',
        'Database must be updated but WARNINGS exists.' + sLineBreak +
        LScript.Warnings.Lines.Text
      );

    // Physically create the database (on the server or as a file, depending on database type) only
    // when the analyzed status says it does not exist yet.
    if FSchema.Status = stCreate then
      CreateDatabase;

    LScript.Execute;
  end;
end;

end.
