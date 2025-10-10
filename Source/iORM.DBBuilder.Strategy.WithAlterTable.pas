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
unit iORM.DBBuilder.Strategy.WithAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Strategy.Base;

type

  TioDBBuilderStrategyWithAlter = class(TioDBBuilderStrategyBase)
  protected
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    procedure DropForeignKeys(const AScript: IioDBBuilderSqlScript); override;
    procedure DropIndexes(const AScript: IioDBBuilderSqlScript); override;
    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); override;
  public
  end;

implementation

uses
  System.SysUtils,

  iORM.DB.ConnectionContainer,
  iORM.DB.Interfaces,
  iORM.DBBuilder.QueryEngine

  ;


{ TioDBBuilderStrategyWithAlter }

procedure TioDBBuilderStrategyWithAlter.AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  AScript.Add(SqlGenerator.BuildBeginAlterTableSql(ATable));
  AScript.IncIndentationLevel;
  AddOrAlterFields(AScript, ATable);
  AScript.DecIndentationLevel;
  AScript.Add(SqlGenerator.BuildEndAlterTableSql(ATable));
end;

procedure TioDBBuilderStrategyWithAlter.GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean);
var
  LDropForeignKeys,
  LDropIndexes: boolean;
begin
  if Create then
  begin
    CreateTables(AScript);
    CreateSequences(AScript);

    if Schema.IndexesEnabled then
      CreateIndexes(AScript);

    if Schema.ForeignKeysEnabled then
      CreateForeignKeys(Ascript);
  end
  else
  begin
    DropForeignKeys(AScript);
    DropIndexes(AScript);
    CreateOrAlterTables(AScript);
    CreateSequences(AScript);

    if Schema.IndexesEnabled then
      CreateIndexes(AScript);

    if Schema.ForeignKeysEnabled then
      CreateForeignKeys(Ascript);
  end;

//  LDropForeignKeys := not Create;
//  LDropIndexes := not Create;
//
//  // Carlo Marona: should be avoided if no changes has to be made
//  if LDropForeignKeys then
//    DropForeignKeys(AScript);
//
//  // Carlo Marona: should be avoided if no changes has to be made
//  if LDropIndexes then
//    DropIndexes(AScript);
//
//  CreateOrAlterTables(AScript);
//  CreateSequences(AScript);
//
//  if ((Schema.Status > stClean) and Schema.IndexesEnabled) or LDropIndexes then
//    CreateIndexes(AScript);
//
//  if ((Schema.Status > stClean) and Schema.ForeignKeysEnabled) or LDropForeignKeys then
//    CreateForeignKeys(Ascript);
end;

procedure TioDBBuilderStrategyWithAlter.CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  AScript.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  Ascript.IncIndentationLevel;
  AScript.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.CurrentIndentation), False);
  AScript.DecIndentationLevel;
  AScript.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
  AScript.AddEmpty;
  AScript.Add(SqlGenerator.BuildAddPrimaryKeySql(ATable));
end;

procedure TioDBBuilderStrategyWithAlter.DropForeignKeys(const AScript: IioDBBuilderSqlScript);
var
  LQuery: IioQuery;
begin
  inherited;

  LQuery := TioDBBuilderQueryEngine.NewQuery(ConnectionDefName);
  LQuery.SQL.Text := SqlGenerator.BuildListAllForeignKeysSql;
  LQuery.Open;

  while not LQuery.Eof do
  begin
    AScript.Add(SqlGenerator.BuildDropForeignKeySql(LQuery.Fields.FieldByName('table_name').AsString,
      LQuery.Fields.FieldByName('constraint_name').AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyWithAlter.DropIndexes(const AScript: IioDBBuilderSqlScript);
var
  LQuery: IioQuery;
begin
  inherited;

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildListAllIndexesSql);

  while not LQuery.Eof do
  begin
    AScript.Add(SqlGenerator.BuildDropIndexSql(LQuery.Fields[0].AsString));
    LQuery.Next;
  end;
end;

end.
