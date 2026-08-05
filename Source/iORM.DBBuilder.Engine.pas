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
      const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderScript;
    function BuildScript_SyncDBStruct(const AConnectionDefName: String;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderScript;
  end;

implementation

uses
  iORM.DBBuilder.Factory

  ;

{ TioDBBuilderEngine }

function TioDBBuilderEngine.BuildScript_ForceCreateDB(const AConnectionDefName: String;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderScript;
var
  LSchema: IioDBBuilderSchema;
  LScript: IioDBBuilderScript;
  LSqlGenerator: IioDBBuilderSqlGenerator;
begin
  // SqlGenerator must be created BEFORE Schema so that kgsAuto can be resolved
  LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(AConnectionDefName);
  LSchema := TioDBBuilderFactory.NewSchema(AConnectionDefName, AIndexesMode, AForeignKeysMode, LSqlGenerator);
  LScript := TioDBBuilderFactory.NewScript(AConnectionDefName, LSchema);

  // Self-contained: LSchema is already fully populated from the class/entity maps (NewSchema ->
  // BuildSchema, no DB access). GenerateScript_ForceCreate marks the whole tree as stCreate.
  // Result must NOT be executed against an existing database.
  TioDBBuilderFactory.NewStrategy(AConnectionDefName, LSchema, LSqlGenerator, LScript).GenerateScript_ForceCreate;
  Result := LScript;
end;

function TioDBBuilderEngine.BuildScript_SyncDBStruct(const AConnectionDefName: String;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderScript;
var
  LSchema: IioDBBuilderSchema;
  LScript: IioDBBuilderScript;
  LSqlGenerator: IioDBBuilderSqlGenerator;
begin
  // SqlGenerator must be created BEFORE Schema so that kgsAuto can be resolved
  LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator(AConnectionDefName);
  LSchema := TioDBBuilderFactory.NewSchema(AConnectionDefName, AIndexesMode, AForeignKeysMode, LSqlGenerator);
  LScript := TioDBBuilderFactory.NewScript(AConnectionDefName, LSchema);

  TioDBBuilderFactory.NewDBAnalyzer(AConnectionDefName, LSchema, LSqlGenerator, LScript).Analyze;
  // Status-driven: create or update, according to the status the DBAnalyzer just determined.
  TioDBBuilderFactory.NewStrategy(AConnectionDefName, LSchema, LSqlGenerator, LScript).GenerateScript_Sync;
  Result := LScript;
end;

end.
