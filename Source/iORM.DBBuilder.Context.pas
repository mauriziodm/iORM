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
unit iORM.DBBuilder.Context;

interface

uses
  System.Classes,

  iORM.DBBuilder.Interfaces

  ;

type

  TioDBBuilderContext = class(TInterfacedObject, IioDBBuilderContext)
  private
    FConnectionDefName: string;
    FReconciliation: IioDBBuilderReconciliation;
    FScript: IioDBBuilderScript;
    FSqlGenerator: IioDBBuilderSqlGenerator;

    function GetConnectionDefName: string;
    function GetHasHints: Boolean;
    function GetHasWarnings: Boolean;
    function GetHints: IioDBBuilderSqlText;
    function GetLines: TStringList;
    function GetReconciliation: IioDBBuilderReconciliation;
    function GetScript: IioDBBuilderScript;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    function GetStatus: TioDBBuilderStatus;
    function GetWarnings: IioDBBuilderSqlText;
  public
    constructor Create(const AConnectionDefName: string; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);

    procedure Execute(const AForce: Boolean = False);
  end;

implementation

uses
  System.SysUtils,

  iORM.DB.Factory,
  iORM.DBBuilder.Factory,
  iORM.Exceptions

  ;

{ TioDBBuilderContext }

constructor TioDBBuilderContext.Create(const AConnectionDefName: string; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);
begin
  inherited Create;

  FConnectionDefName := AConnectionDefName;
  // SqlGenerator must be created BEFORE Schema so that kgsAuto can be resolved
  FSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(AConnectionDefName);
  FReconciliation := TioDBBuilderFactory.NewReconciliation(AConnectionDefName, AIndexesMode, AForeignKeysMode, FSqlGenerator);
  FScript := TioDBBuilderFactory.NewScript(AConnectionDefName);
end;

procedure TioDBBuilderContext.Execute(const AForce: Boolean);
begin
  // Warnings signal a change the DBAnalyzer could not resolve safely on its own (e.g. an unsafe
  // type conversion) - block execution unless the caller explicitly overrides via AForce, since by
  // this point the script may already contain destructive DDL (ALTER/DROP) based on that change.
  if GetHasWarnings and not AForce then
    raise EioDBBuilderException.Create(ClassName, 'Execute',
      'Database must be updated but WARNINGS exists.' + sLineBreak +
      FScript.Warnings.Lines.Text
    );

  // Physically create the database (on the server or as a file, depending on database type) only
  // when the analyzed status says it does not exist yet. This is NOT SQL text: for SQLite it's the
  // driver auto-creating the file on connect, for Firebird it's a temporary FireDAC OpenMode flip -
  // neither can be expressed in the script Body, so it happens here as a side effect before Execute
  // sends the rest of the script. Reuses the SqlGenerator this Context was built with instead of
  // creating a new one.
  if FReconciliation.MappedSchema.Status = stCreate then
    FSqlGenerator.Command_CreateDatabase;

  // Runs unconditionally from here, even when Status = stClean (nothing to do): Lines is then
  // empty/near-empty, so this is a harmless no-op round trip rather than a guarded early-out - kept
  // simple on purpose, since the caller already inspected Status/Warnings before deciding to call
  // Execute at all.
  TioDBFactory.Script(FConnectionDefName, FScript.Lines).Execute;
end;

function TioDBBuilderContext.GetConnectionDefName: string;
begin
  Result := FConnectionDefName;
end;

function TioDBBuilderContext.GetHasHints: Boolean;
begin
  Result := not FScript.Hints.IsEmpty;
end;

function TioDBBuilderContext.GetHasWarnings: Boolean;
begin
  Result := not FScript.Warnings.IsEmpty;
end;

function TioDBBuilderContext.GetHints: IioDBBuilderSqlText;
begin
  Result := FScript.Hints;
end;

function TioDBBuilderContext.GetLines: TStringList;
begin
  Result := FScript.Lines;
end;

function TioDBBuilderContext.GetReconciliation: IioDBBuilderReconciliation;
begin
  Result := FReconciliation;
end;

function TioDBBuilderContext.GetScript: IioDBBuilderScript;
begin
  Result := FScript;
end;

function TioDBBuilderContext.GetSqlGenerator: IioDBBuilderSqlGenerator;
begin
  Result := FSqlGenerator;
end;

function TioDBBuilderContext.GetStatus: TioDBBuilderStatus;
begin
  Result := FReconciliation.MappedSchema.Status;
end;

function TioDBBuilderContext.GetWarnings: IioDBBuilderSqlText;
begin
  Result := FScript.Warnings;
end;

end.
