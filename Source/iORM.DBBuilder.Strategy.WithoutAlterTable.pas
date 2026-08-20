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
    // ==========================================================
    // RENAME-CREATE-COPY PATTERN HELPERS
    // ----------------------------------------------------------
    procedure Process_CopyDataFromOldToNew; virtual;
    /// <summary>
    /// Drops every existing index of the tables being rebuilt, queried from the DB catalog (Force*
    /// mechanic, bypassing IndexesMode) so their names are free before the new tables/indexes are
    /// created. Runs regardless of mode - the rename-create-copy always needs a clean slate.
    /// </summary>
    procedure Process_DropIndexesFromDB; virtual;
    /// <summary>
    /// Warns (blocking, so Execute stops) that a structural rebuild will drop the existing indexes
    /// (and recreate tables without their FKs) WITHOUT recreating them, when index/FK management is
    /// disabled - only for the stUpdate tables that actually have such objects in the catalog.
    /// </summary>
    procedure Process_WarnUnmanagedRebuildLosses; virtual;
    procedure ScriptWrite_CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure ScriptWrite_RenameAllTablesToOld; virtual;
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String; virtual;

    // ==========================================================
    // CONSTRAINT DEFERRAL HOOKS
    // ----------------------------------------------------------
    // Override in derived classes for DBMS-specific syntax.
    procedure ScriptWrite_BeginDeferConstraints; virtual;
    procedure ScriptWrite_EndDeferConstraints; virtual;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure Process_Tables;

    // ==========================================================
    // MAIN GENERATION
    // ----------------------------------------------------------
    /// <summary>
    /// Generates the full database update script for RDBMS without ALTER TABLE support.
    /// Workflow when updating an existing DB:
    ///   1. Drop every index of each stUpdate table (queried from the DB, not the schema)
    ///      so that index names do not collide when the new tables are created.
    ///   2. Rename each stUpdate table to "_old".
    ///   3. Create the new tables.
    ///   4. Recreate indexes from the schema (unless ifmDisabled).
    ///   5. Copy data from the "_old" tables.
    /// Foreign keys are handled inline by the CREATE TABLE statement (see derived strategies).
    /// Note: ifmEnabled and ifmEnabledStrict behave identically here because the rename-create-copy
    /// pattern already recreates everything from scratch and the index drop always queries the DB.
    /// Only ifmDisabled prevents index recreation on the new tables.
    /// </summary>
    procedure GenerateScript_Body; override;
  public

  end;


implementation

uses
  System.SysUtils

  ;


{ TioDBBuilderStrategyWithoutAlterTable }

procedure TioDBBuilderStrategyWithoutAlterTable.Process_Tables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Databases without ALTER TABLE support always recreate tables using the
  // rename-create-copy pattern (see GenerateScript_Body for the full workflow).
  // Therefore, both stCreate and stUpdate use ScriptWrite_CreateTable.
  for LTable in Context.Reconciliation.MappedSchema.Tables.Values do
  begin
    if LTable.Status in [stCreate, stUpdate] then
      ScriptWrite_CreateTable(LTable);
  end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.Process_WarnUnmanagedRebuildLosses;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Context.Reconciliation.MappedSchema.Tables.Values do
    if LTable.Status = stUpdate then
    begin
      if Context.Reconciliation.MappedSchema.IndexesMode = ifmDisabled then
        Warning_RebuildDropsUnmanagedIndexes(LTable);
      if Context.Reconciliation.MappedSchema.ForeignKeysMode = ifmDisabled then
        Warning_RebuildDropsUnmanagedForeignKeys(LTable);
    end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.Process_DropIndexesFromDB;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Drop every existing index of each table being rebuilt, queried straight from the DB catalog
  // (Force* mechanic, bypasses IndexesMode): the rename-create-copy needs the names free before the
  // new tables/indexes are created, regardless of the configured mode.
  Context.Script.Body.AddTitle('Dropping indexes');
  for LTable in Context.Reconciliation.MappedSchema.Tables.Values do
    if LTable.Status = stUpdate then
      Force_DropTableIndexesFromDB(LTable);
end;

procedure TioDBBuilderStrategyWithoutAlterTable.GenerateScript_Body;
begin
  // Check key generation strategy compatibility with DBMS.
  // The diagnostic lives on the Context.SqlGenerator (DBMS-capability axis), not on the Strategy.
  Context.SqlGenerator.CheckKeyGenerationCompatibility(Context.Reconciliation.MappedSchema, Context.Script);

  ScriptWrite_BeginDeferConstraints;

  // When updating: warn about unmanaged losses, drop the existing indexes, and rename tables to "_old"
  // before recreating them (details in each step's method).
  if Context.Reconciliation.MappedSchema.Status = stUpdate then
  begin
    Process_WarnUnmanagedRebuildLosses;
    Process_DropIndexesFromDB;
    ScriptWrite_RenameAllTablesToOld;
  end;

  // Create tables (stCreate) or recreate modified tables (stUpdate)
  Process_Tables;

  // Indexes: ifmEnabled and ifmEnabledStrict are equivalent here because the rename-create-copy
  // pattern already starts from a clean slate. Only ifmDisabled skips recreation.
  if Context.Reconciliation.MappedSchema.IndexesMode <> ifmDisabled then
    Process_Indexes;

  // When updating, copy data from renamed "_old" tables into the newly created ones
  if Context.Reconciliation.MappedSchema.Status = stUpdate then
    Process_CopyDataFromOldToNew;

  ScriptWrite_EndDeferConstraints;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_BeginDeferConstraints;
begin
  // Default: no-op. Override in derived classes for DBMS-specific constraint deferral.
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_EndDeferConstraints;
begin
  // Default: no-op. Override in derived classes for DBMS-specific constraint deferral.
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_RenameAllTablesToOld;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Context.Script.Body.AddTitle('Renaming table names to "_old"');

  for LTable in Context.Reconciliation.MappedSchema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    Context.Script.Body.AddComment(Format('Renaming from "%s" to "%s"', [LTable.Name, Table2OldTableName(LTable)]));
    Context.Script.Body.Add(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(LTable)]));
    Context.Script.Body.Add(Format('ALTER TABLE %s RENAME TO %s;', [LTable.Name, Table2OldTableName(LTable)]));
    Context.Script.Body.AddEmpty;
  end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.Process_CopyDataFromOldToNew;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Context.Script.Body.AddTitle('Copying data from "_old" tables.');

  for LTable in Context.Reconciliation.MappedSchema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    ScriptWrite_CopyDataFromOldToNewTable(LTable);
  end;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: string;
begin
  Context.Script.Body.AddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.Name]));
  // Insert into
  Context.Script.Body.Add(Format('INSERT INTO %s (', [ATable.Name]));
  Context.Script.Body.IncIndent;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Context.Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Context.Script.Body.DecIndent;

  // Select from
  Context.Script.Body.Add(') SELECT');
  Context.Script.Body.IncIndent;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Context.Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Context.Script.Body.DecIndent;

  Context.Script.Body.Add(Format('FROM %s', [Table2OldTableName(ATable)]));
  Context.Script.Body.Add(';');
  Context.Script.Body.AddEmpty;
end;

function TioDBBuilderStrategyWithoutAlterTable.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.Name.ToLower]);
end;

end.
