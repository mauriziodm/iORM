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
unit iORM.DBBuilder.DBAnalyzer;

interface

uses
  iORM.Attributes,
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderDBAnalyzer = class(TInterfacedObject, IioDBBuilderDBAnalyzer)
  private
    FConnectionDefName: string;
    FSchema: IioDBBuilderSchema;
    FScript: IioDBBuilderScript;
    FStrategy: IioDBBuilderStrategy;
  protected
    procedure AnalyzeFields(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure AnalyzeForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure AnalyzeIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure AnalyzeTables; virtual;
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator; const AScript: IioDBBuilderScript);

    procedure Analyze; virtual;
  end;

implementation

uses
  iORM,
  iORM.DB.Factory,
  iORM.DB.Interfaces,
  iORM.DB.ConnectionContainer,
  iORM.DBBuilder.Factory

  ;

{ TioDBBuilderDBAnalyzer }

constructor TioDBBuilderDBAnalyzer.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator; const AScript: IioDBBuilderScript);
begin
  FConnectionDefName := AConnectionDefName;
  FSchema := ASchema;
  FScript := AScript;
  FStrategy := TioDBBuilderFactory.NewStrategy(AConnectionDefName, ASchema, ASqlGenerator, AScript);
end;

procedure TioDBBuilderDBAnalyzer.Analyze;
begin
  // Analyze if the database exists and set its status
  if not FStrategy.Check_DatabaseExists then
    FSchema.Status := stCreate;

  // Start the transaction (if the DB already exists otherwise an error would occur)
  // note: Maintain the transaction because the lifecycle of the physical connection
  //        to the DB coincides with the lifecycle of the transaction, thus avoiding
  //        the continuous creation and destruction of the connection
  if FSchema.Status <> stCreate then
    io.StartTransaction(FConnectionDefName);

  try
    // Analyze all tables (virtual method implemented by descendants)
    AnalyzeTables;

    // Commit the transaction (if in transaction)
    if FSchema.Status <> stCreate then
      io.CommitTransaction(FConnectionDefName);
  except
    // Rollback the transaction (if in transaction)
    if FSchema.Status <> stCreate then
      io.RollbackTransaction(FConnectionDefName);
    raise;
  end;
end;


procedure TioDBBuilderDBAnalyzer.AnalyzeTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in FSchema.Tables.Values do
  begin
    // If the DB is new or the table doesn't exist, mark it as stCreate
    if (FSchema.Status = stCreate) or not FStrategy.Check_TableExists(LTable) then
      LTable.Status := stCreate;
    // Always called — handle stCreate tables internally without DB queries
    AnalyzeFields(LTable);
    AnalyzeIndexes(LTable);
    AnalyzeForeignKeys(LTable);

    // If the table has changes and the DB already exists, mark the schema as stUpdate
    if (LTable.Status > stClean) and (FSchema.Status <> stCreate) then
      FSchema.Status := stUpdate;
  end;
end;

procedure TioDBBuilderDBAnalyzer.AnalyzeFields(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  for LField in ATable.Fields do
  begin
    // When the table is new, all its fields must be created — no DB query needed
    if (ATable.Status = stCreate) or not FStrategy.Check_FieldExists(ATable, LField) then
      LField.Status := stCreate
    else if FStrategy.Check_FieldModified(ATable, LField) then
      LField.Status := stUpdate;

    if LField.Status > stClean then
    begin
      ATable.AddChange(taFields);
      ATable.Status := stUpdate;
    end;
  end;
end;

procedure TioDBBuilderDBAnalyzer.AnalyzeForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LFK: IioDBBuilderSchemaFK;
begin
  for LFK in ATable.ForeignKeys.Values do
  begin
    // When the table is new, all its foreign keys must be created — no DB query needed
    if (ATable.Status = stCreate) or not FStrategy.Check_ForeignKeyExists(ATable, LFK) then
      LFK.Status := stCreate
    else if FStrategy.Check_ForeignKeyModified(ATable, LFK) then
      LFK.Status := stUpdate;

    if LFK.Status > stClean then
    begin
      ATable.AddChange(taForeignKeys);
      ATable.Status := stUpdate;
    end;
  end;
end;

procedure TioDBBuilderDBAnalyzer.AnalyzeIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LIndex in ATable.Indexes.Values do
  begin
    // When the table is new, all its indexes must be created — no DB query needed
    if (ATable.Status = stCreate) or not FStrategy.Check_IndexExists(ATable, LIndex) then
      LIndex.Status := stCreate
    else if FStrategy.Check_IndexModified(ATable, LIndex) then
      LIndex.Status := stUpdate;

    if LIndex.Status > stClean then
    begin
      ATable.AddChange(taIndexes);
      ATable.Status := stUpdate;
    end;
  end;
end;

end.
