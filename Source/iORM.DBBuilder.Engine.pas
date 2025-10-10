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
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.SqlScript.Base

  ;

type

  TioDBBuilderEngine = class(TInterfacedObject, IioDBBuilderEngine)
  private
    FDBAnalyzer: IioDBBuilderDBAnalyzer;
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    FConnectionDefName: string;
    procedure CreateDatabase;
    function GetSchema: IioDBBuilderSchema;
    function GetStatus: TioDBBuilderEngineResult;
    function GetStatusAsString: String;
    function GetStatusDescription: String;
    function GetWarnings: TStrings;

  public
    constructor Create(const AConnectionDefName: String; const AAddIndexes, AAddForeignKeys: Boolean);

    procedure Analyze;
    procedure CreateOrAlterDB(const AForce: Boolean = False; const AScript: IioDBBuilderSqlScript = nil); overload;
    procedure BuildCreateOrAlterDBSqlScipt(const AScript: IioDBBuilderSqlScript);
    procedure BuildCreateDBSqlScript(const AScript: IioDBBuilderSqlScript);
    procedure BuildUpdateDBSqlScript(const AScript: IioDBBuilderSqlScript);

    property Schema: IioDBBuilderSchema read GetSchema;
    property Status: TioDBBuilderEngineResult read GetStatus;
    property StatusAsString: string read GetStatusAsString;
    property StatusDescription: string read GetStatusDescription;
    property Warnings: TStrings read GetWarnings;
  end;

implementation

uses
  System.SysUtils,
  System.TypInfo,

  iORM.DBBuilder.Factory,
  iORM.DBBuilder.Schema,
  iORM.Exceptions,
  iORM.DB.Factory

  ;

{ TioDBBuilderEngine }

procedure TioDBBuilderEngine.Analyze;
begin
  FDBAnalyzer.Analyze;
end;

procedure TioDBBuilderEngine.BuildCreateDBSqlScript(const AScript: IioDBBuilderSqlScript);
begin
  TioDBBuilderFactory.NewStrategy(FConnectionDefName, Schema, FSqlGenerator).GenerateCreateDatabaseScript(AScript);
end;

procedure TioDBBuilderEngine.BuildCreateOrAlterDBSqlScipt(const AScript: IioDBBuilderSqlScript);
begin
  case Status of
    dbUptodate: ;
    dbNotExists: TioDBBuilderFactory.NewStrategy(FConnectionDefName, Schema, FSqlGenerator).GenerateCreateDatabaseScript(AScript);
    dbUpdatesNeeded: TioDBBuilderFactory.NewStrategy(FConnectionDefName, Schema, FSqlGenerator).GenerateUpdateDatabaseScript(AScript);
    dbWarningExists: ;
  end;
end;

procedure TioDBBuilderEngine.BuildUpdateDBSqlScript(const AScript: IioDBBuilderSqlScript);
begin
  TioDBBuilderFactory.NewStrategy(FConnectionDefName, Schema, FSqlGenerator).GenerateUpdateDatabaseScript(AScript);
end;

constructor TioDBBuilderEngine.Create(const AConnectionDefName: String; const AAddIndexes, AAddForeignKeys: Boolean);
begin
  FConnectionDefName := AConnectionDefName;
  FSchema := TioDBBuilderFactory.NewSchema(AConnectionDefName, AAddIndexes, AAddForeignKeys);
  FSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(FConnectionDefName);
  FDBAnalyzer := TioDBBuilderFactory.NewDBAnalyzer(AConnectionDefName, FSchema, FSqlGenerator);
end;

procedure TioDBBuilderEngine.CreateDatabase;
var
  LStrategy: IioDBBuilderStrategy;
begin
  LStrategy := TioDBBuilderFactory.NewStrategy(FConnectionDefName, Schema, FSqlGenerator);
  LStrategy.CreateDatabase;
end;

procedure TioDBBuilderEngine.CreateOrAlterDB(const AForce: Boolean; const AScript: IioDBBuilderSqlScript);
var
  LScript: IioDBBuilderSqlScript;
  LBuildScript: boolean;
begin
  if (Status > dbUptodate) or AForce then
  begin
    LBuildScript := not Assigned(AScript);

    if Status = dbWarningExists then
      raise EioGenericException.Create(ClassName, 'GenerateDB',
        'Database to be updated but WARNINGS exists.' + sLineBreak +
        Schema.Warnings.Text
      );

    if not Assigned(AScript) then
      LScript := TioDBBuilderFactory.NewSqlScript
    else
      LScript := AScript;

    if Status = dbNotExists then
    begin
      // Carlo Marona: create the database fisically, on the server or as a file depending on database type used
      CreateDatabase;

      if LBuildScript then
        BuildCreateDBSqlScript(AScript);
    end
    else if Status = dbUpdatesNeeded then
    begin
      if LBuildScript then
        BuildUpdateDBSqlScript(AScript);
    end;

    TioDBFactory.Script(FConnectionDefName, LScript.SQL).Execute;
  end;
end;

function TioDBBuilderEngine.GetSchema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

function TioDBBuilderEngine.GetStatus: TioDBBuilderEngineResult;
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

function TioDBBuilderEngine.GetStatusAsString: String;
begin
  Result := GetEnumName(TypeInfo(TioDBBuilderEngineResult), Ord(Status));
end;

function TioDBBuilderEngine.GetStatusDescription: String;
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

function TioDBBuilderEngine.GetWarnings: TStrings;
begin
  Result := FSchema.Warnings;
end;

end.
