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
/// <summary>
/// Base strategy class for RDBMS that do NOT support ALTER TABLE column operations.
/// These databases require the rename-create-copy pattern to modify table structure:
/// 1. Drop indexes
/// 2. Rename existing tables to "_old"
/// 3. Create new tables with the updated schema
/// 4. Recreate indexes
/// 5. Copy data from old tables to new ones
/// SQLite inherits from this class.
/// </summary>
unit iORM.DBBuilder.Strategy.WithoutAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base

  ;


type
  TioDBBuilderStrategyWithoutAlterTable = class(TioDBBuilderStrategyBase)
  protected
    // Rename-create-copy pattern helpers
    procedure RenameAllTablesToOld; virtual;
    procedure CopyDataFromOldToNewTables; virtual;
    procedure CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable); virtual;
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String; virtual;
    // Hook methods for constraint deferral (override in derived classes for DBMS-specific syntax)
    procedure BeginDeferConstraints; virtual;
    procedure EndDeferConstraints; virtual;
    // Indexes
    procedure DropIndexes; override;
    // Tables
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateOrAlterTables; override;
    // Main generation
    procedure GenerateDatabaseObjects; override;
  public

  end;


implementation

uses
  System.SysUtils,

  iORM.Exceptions,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine

  ;


{ TioDBBuilderStrategyWithoutAlterTable }

/// <summary>
/// Drops all indexes for tables that need to be rebuilt (stUpdate).
/// Unlike iterating schema indexes (which would miss indexes removed from the schema),
/// this method queries the actual database via BuildSQL_IndexList to discover all
/// existing indexes per table. This ensures that orphaned indexes (e.g. an index whose
/// [ioIndex] attribute was removed from an entity) are also dropped and don't remain
/// indefinitely in the database.
/// Tables that are unchanged (stClean) or new (stCreate) are skipped.
/// Note: tables are not dropped when absent from the schema because that would cause
/// data loss; indexes, being derived objects, can safely be dropped and recreated.
/// </summary>
procedure TioDBBuilderStrategyWithoutAlterTable.DropIndexes;
var
  LTable: IioDBBuilderSchemaTable;
  LQuery: IioQuery;
begin
  inherited;

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    // Query the database for all real indexes on this table, not the schema,
    // so that indexes no longer defined in the schema are also dropped.
    LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(LTable.Name), True);
    while not LQuery.Eof do
    begin
      DropIndexByName(LQuery.Fields[0].AsString);
      LQuery.Next;
    end;
  end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  // This method should NEVER be called for databases without ALTER TABLE support.
  // Instead, CreateOrAlterTables override always calls CreateTable for both stCreate and stUpdate.
  // If this exception is raised, it indicates a logic error in the Strategy layer.
  raise EioDBBuilderException.Create(ClassName, 'AlterTable',
    'This DBMS does not support ALTER TABLE. ' +
    'Table modifications require the rename-create-copy pattern, which is handled by CreateOrAlterTables override.');
end;

procedure TioDBBuilderStrategyWithoutAlterTable.CreateOrAlterTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Databases without ALTER TABLE support always recreate tables using the
  // rename-create-copy pattern (see GenerateDatabaseObjects for the full workflow).
  // Therefore, both stCreate and stUpdate use CreateTable.
  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status in [stCreate, stUpdate] then
      CreateTable(LTable);
  end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.GenerateDatabaseObjects;
begin
  // Check key generation strategy compatibility with DBMS
  DoCheckKeyGenerationCompatibility;

  BeginDeferConstraints;

  // When updating, drop indexes and rename existing tables to "_old" before recreating them
  if Schema.Status = stUpdate then
  begin
    DropIndexes;
    RenameAllTablesToOld;
  end;

  // Create tables (stCreate) or recreate modified tables (stUpdate)
  CreateOrAlterTables;

  if Schema.IndexesEnabled then
    CreateOrAlterIndexes;

  // When updating, copy data from renamed "_old" tables into the newly created ones
  if Schema.Status = stUpdate then
    CopyDataFromOldToNewTables;

  EndDeferConstraints;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.BeginDeferConstraints;
begin
  // Default: no-op. Override in derived classes for DBMS-specific constraint deferral.
end;

procedure TioDBBuilderStrategyWithoutAlterTable.EndDeferConstraints;
begin
  // Default: no-op. Override in derived classes for DBMS-specific constraint deferral.
end;

procedure TioDBBuilderStrategyWithoutAlterTable.RenameAllTablesToOld;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Renaming table names to "_old"');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    Script.Body.AddComment(Format('Renaming from "%s" to "%s"', [LTable.Name, Table2OldTableName(LTable)]));
    Script.Body.Add(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(LTable)]));
    Script.Body.Add(Format('ALTER TABLE %s RENAME TO %s;', [LTable.Name, Table2OldTableName(LTable)]));
    Script.Body.AddEmpty;
  end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.CopyDataFromOldToNewTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Copying data from "_old" tables.');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    CopyDataFromOldToNewTable(LTable);
  end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: string;
begin
  Script.Body.AddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.Name]));
  // Insert into
  Script.Body.Add(Format('INSERT INTO %s (', [ATable.Name]));
  Script.Body.IncIndent;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Script.Body.DecIndent;

  // Select from
  Script.Body.Add(') SELECT');
  Script.Body.IncIndent;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Script.Body.DecIndent;

  Script.Body.Add(Format('FROM %s', [Table2OldTableName(ATable)]));
  Script.Body.Add(';');
  Script.Body.AddEmpty;
end;

function TioDBBuilderStrategyWithoutAlterTable.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.Name.ToLower]);
end;

end.
