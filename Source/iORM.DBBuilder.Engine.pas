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
  System.Classes, iORM.CommonTypes, iORM.DBBuilder.Interfaces;

type

  TioDBBuilderEngine = class(TInterfacedObject, IioDBBuilderEngine)
  private
    FDBAnalyzer: IioDBBuilderDBAnalyzer;
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
  public
    constructor Create(const AConnectionDefName: String; const AAddIndexes, AAddForeignKeys: Boolean);
    procedure Analyze;
    function Schema: IioDBBuilderSchema;
    function Script: TStrings;
    function Status: TioDBBuilderEngineResult;
    function StatusAsString: String;
    function StatusDescription: String;
    function Warnings: TStrings;
    procedure CreateOrAlterDB(const AForce: Boolean = False);
  end;

implementation

uses
  System.SysUtils, system.TypInfo, iORM.DBBuilder.Factory, iORM.DBBuilder.Schema, iORM.Exceptions, iORM.DB.Factory;

{ TioDBBuilderEngine }

procedure TioDBBuilderEngine.Analyze;
begin
  FDBAnalyzer.Analyze;
end;

constructor TioDBBuilderEngine.Create(const AConnectionDefName: String; const AAddIndexes, AAddForeignKeys: Boolean);
begin
  FSchema := TioDBBuilderFactory.NewSchema(AConnectionDefName, AAddIndexes, AAddForeignKeys);
  FSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(FSchema);
  FDBAnalyzer := TioDBBuilderFactory.NewDBAnalyzer(FSchema, FSqlGenerator);
  // Perform a first database analysis immediately
  Analyze;
end;

procedure TioDBBuilderEngine.CreateOrAlterDB(const AForce: Boolean);
begin
  if (Status > dbUptodate) or AForce then
  begin
    if Status = dbWarningExists then
      raise EioGenericException.Create(ClassName, 'GenerateDB', 'Database to be updated but WARNINGS exists');
    if Status = dbNotExists then
      FSqlGenerator.CreateDatabase;
    TioDBFactory.Script(FSchema.ConnectionDefName, Script).Execute;
  end;
end;

function TioDBBuilderEngine.Schema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

function TioDBBuilderEngine.Script: TStrings;
begin
  if FSchema.ScriptIsEmpty then
    TioDBBuilderFactory.NewStrategy(FSchema, FSqlGenerator).GenerateScript;
  Result := FSchema.Script;
end;

function TioDBBuilderEngine.Status: TioDBBuilderEngineResult;
begin
  if FSchema.WarningExists then
    Exit(dbWarningExists);
  case FSchema.Status of
    stAlter:
      Exit(dbUpdatesNeeded);
    stCreate:
      Exit(dbNotExists);
  else
    Exit(dbUptodate);
  end;
end;

function TioDBBuilderEngine.StatusAsString: String;
begin
  Result := GetEnumName(TypeInfo(TioDBBuilderEngineResult), Ord(Status));
end;

function TioDBBuilderEngine.StatusDescription: String;
begin
  case Status of
    dbUptodate:
      Exit('The database is uptodate.');
    dbNotExists:
      Exit('The database need to created.');
    dbUpdatesNeeded:
      Exit('The database need updates.');
    dbWarningExists:
      Exit('The database need updates but WARNINGS exists.');
  end;
end;

function TioDBBuilderEngine.Warnings: TStrings;
begin
  Result := FSchema.Warnings;
end;

end.
