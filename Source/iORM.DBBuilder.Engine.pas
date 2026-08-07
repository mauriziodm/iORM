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
  public
    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function BuildScript_ForceCreateDB(const AConnectionDefName: String;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
    function BuildScript_SyncDBStruct(const AConnectionDefName: String;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
  end;

implementation

uses
  iORM.DBBuilder.Factory

  ;

{ TioDBBuilderEngine }

function TioDBBuilderEngine.BuildScript_ForceCreateDB(const AConnectionDefName: String;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
var
  LContext: IioDBBuilderContext;
begin
  LContext := TioDBBuilderFactory.NewContext(AConnectionDefName, AIndexesMode, AForeignKeysMode);

  // Self-contained: LContext.Schema is already fully populated from the class/entity maps (NewSchema
  // -> BuildSchema, no DB access). Force the whole tree to stCreate, mirroring what the DBAnalyzer
  // does on a non-existent DB, and flag the result so Context.Execute refuses to run it unless the
  // caller explicitly passes AForce = True: it must NOT be executed against an existing database.
  LContext.Script.Warnings.Add('ATTENTION: This script was generated in FORCE-CREATE mode, the actual state ' +
    'of the target database was NOT analyzed and is ignored. Review it carefully before running it against an ' +
    'existing database.');
  LContext.Schema.ForceCreateStatus;
  TioDBBuilderFactory.NewStrategy(LContext).GenerateScript;
  Result := LContext;
end;

function TioDBBuilderEngine.BuildScript_SyncDBStruct(const AConnectionDefName: String;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
var
  LContext: IioDBBuilderContext;
  LStrategy: IioDBBuilderStrategy;
begin
  LContext := TioDBBuilderFactory.NewContext(AConnectionDefName, AIndexesMode, AForeignKeysMode);

  // Built once and shared: the DBAnalyzer's catalog Check_* queries and the eventual script
  // generation both need the same dialect-specific Strategy for this Context.
  LStrategy := TioDBBuilderFactory.NewStrategy(LContext);
  TioDBBuilderFactory.NewDBAnalyzer(LContext, LStrategy).Analyze;
  // Status-driven: create or update, according to the status the DBAnalyzer just determined.
  LStrategy.GenerateScript;
  Result := LContext;
end;

end.
