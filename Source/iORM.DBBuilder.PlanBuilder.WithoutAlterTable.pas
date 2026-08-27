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
unit iORM.DBBuilder.PlanBuilder.WithoutAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.PlanBuilder.Base;

type

  /// <summary>
  ///  PlanBuilder shape for DBMS that cannot ALTER a table in place (Supports_AlterTable = False: SQLite).
  ///  ANY structural difference means recreating the whole table via rename-create-copy, so this emits the
  ///  rebuild ops in a rebuild-safe order: drop indexes from DB -> rename to "_old" -> create tables ->
  ///  create indexes -> copy data. Foreign keys are inline in CREATE TABLE for these dialects, so no
  ///  opCreateForeignKey is ever emitted (an orphan opDropOrphanForeignKey still can be, see below).
  ///  Because the rebuild recreates everything from scratch, ifmEnabled and ifmEnabledStrict are
  ///  equivalent here; only ifmDisabled prevents index/FK recreation. A table, a field, an index, or an FK
  ///  on an otherwise untouched table, present in the DB but absent from the ORM maps is left alone by the
  ///  rebuild ops (nothing to recreate, and an orphan alone must never force a rebuild - that would destroy
  ///  exactly the data being flagged) but still surfaced as an orphan, same as WithAlterTable's
  ///  Plan_OrphanTables/Plan_OrphanFields/Plan_OrphanIndexes/Plan_OrphanForeignKeys.
  ///  The fresh whole-DB create (schema stCreate + CREATE DATABASE, via MappedSchema.ForceCreateStatus) is
  ///  decided upstream (the DBBuilder, when the database does not exist) - not here; with a nil
  ///  PhysicalSchema everything is simply "new".
  /// </summary>
  TioDBBuilderPlanBuilderWithoutAlterTable = class(TioDBBuilderPlanBuilderBase)
  private
  protected
    function BuildPlan: IioDBBuilderPlan; override;
  public
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderPlanBuilderWithoutAlterTable }

function TioDBBuilderPlanBuilderWithoutAlterTable.BuildPlan: IioDBBuilderPlan;
var
  LMappedSchema, LPhysicalSchema: IioDBBuilderSchema;
  LPlan: IioDBBuilderPlan;
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LMappedIndex, LPhysicalIndex: IioDBBuilderSchemaIndex;
  LField: IioDBBuilderSchemaField;
begin
  LMappedSchema := Context.Reconciliation.MappedSchema;
  // May be nil when the Introspector has not run (e.g. a non-existent DB): treated as "nothing exists yet".
  LPhysicalSchema := Context.Reconciliation.PhysicalSchema;
  LPlan := Context.Reconciliation.Plan;
  LPlan.Clear;

  // 1. Detect which tables must be (re)built and stamp their Status. A WithoutAlterTable DBMS cannot ALTER
  //    a table in place, so ANY difference means recreating the whole table via rename-create-copy:
  //    absent-in-DB -> stCreate (fresh), present-but-different -> stUpdate (rebuild), identical -> stClean.
  for LMappedTable in LMappedSchema.Tables.Values do
  begin
    LPhysicalTable := Find_TableByName(LPhysicalSchema, LMappedTable.Name);
    if LPhysicalTable = nil then
    begin
      LMappedTable.Status := stCreate;
      for LField in LMappedTable.Fields do
        LField.Status := stCreate;
    end
    else if Check_TableModified(LMappedTable, LPhysicalTable, Context.Reconciliation.IndexesMode >= ifmEnabled,
      Context.Reconciliation.ForeignKeysMode >= ifmEnabled) then
    begin
      LMappedTable.Status := stUpdate;
      // Mark the fields absent from the physical table stCreate so the data-copy op skips them: they have
      // no source column in the "_old" shadow table (every other field is copied across).
      for LField in LMappedTable.Fields do
        if LPhysicalTable.FindField(LField.FieldName) = nil then
          LField.Status := stCreate;
    end;
  end;

  // 2. Emit the rebuild ops, phase-grouped so the whole script is rebuild-safe. Insertion order IS
  //    execution order (the Strategy just translates each op in turn).

  // 2a. Drop every existing index of each rebuilt table, sourced from the introspected physical schema and
  //     dropped by its ACTUAL catalog name (opDropIndex - AIndex is the Physical node here). Runs
  //     regardless of IndexesMode: the rename-create-copy needs the index names free before the new
  //     tables/indexes are created.
  for LMappedTable in LMappedSchema.Tables.Values do
    if LMappedTable.Status = stUpdate then
    begin
      LPhysicalTable := Find_TableByName(LPhysicalSchema, LMappedTable.Name);
      if LPhysicalTable <> nil then
        for LPhysicalIndex in LPhysicalTable.Indexes.Values do
          LPlan.AddDropIndex(LMappedTable, LPhysicalIndex);
    end;

  // 2b. Rename each rebuilt table to its "_old" shadow.
  for LMappedTable in LMappedSchema.Tables.Values do
    if LMappedTable.Status = stUpdate then
      LPlan.AddRenameTableToOld(LMappedTable);

  // 2c. Create the new/rebuilt tables (fields and, for these dialects, inline FKs are emitted by the
  //     CREATE TABLE translator).
  for LMappedTable in LMappedSchema.Tables.Values do
    if LMappedTable.Status in [stCreate, stUpdate] then
      LPlan.AddCreateTable(LMappedTable);

  // 2d. Recreate the indexes (unless index management is disabled). ifmEnabled and ifmEnabledStrict are
  //     equivalent here: the rebuild already starts from a clean slate.
  if Context.Reconciliation.IndexesMode <> ifmDisabled then
    for LMappedTable in LMappedSchema.Tables.Values do
      if LMappedTable.Status in [stCreate, stUpdate] then
        for LMappedIndex in LMappedTable.Indexes.Values do
        begin
          LMappedIndex.Status := stCreate;
          LPlan.AddCreateIndex(LMappedTable, LMappedIndex);
        end;

  // 2e. Copy the rows from each "_old" shadow into its rebuilt table.
  for LMappedTable in LMappedSchema.Tables.Values do
    if LMappedTable.Status = stUpdate then
      LPlan.AddCopyData(LMappedTable);

  // 3. Orphans: present in the DB but absent from the ORM maps. Independent of the rebuild detection
  //    above - an orphan alone must never trigger a rebuild, since that would destroy exactly the data
  //    this warns about - and independent of each other, so both run directly against the two schemas.

  // 3a. Orphan fields on tables that are still mapped. Cascade stDrop to keep the informational Status
  //     tree consistent, warn about any live FK that would dangle, and add an opDropField the Strategy
  //     renders as a comment - version-gated on SQLite (Strategy.WithoutAlterTable.ScriptWrite_DropField)
  //     because dropping a single column needs the very rebuild this must not trigger. Shared with
  //     WithAlterTable (PlanBuilder.Base.Plan_OrphanFields): identical logic on both shapes.
  Plan_OrphanFields(LPlan, LMappedSchema, LPhysicalSchema);

  // 3b. Orphan tables. Same treatment: cascade, warn, add the (commented) drop. Shared with WithAlterTable
  //     (PlanBuilder.Base.Plan_OrphanTables).
  Plan_OrphanTables(LPlan, LMappedSchema, LPhysicalSchema);

  // 3c. Orphan indexes on tables that are NOT being rebuilt (Status still stClean at this point): a
  // rebuilt table (stUpdate) already had every physical index dropped for real in 2a, orphans included, so
  // reporting them again here would duplicate that. Unlike orphan fields, no version gate is needed: DROP
  // INDEX is always available (unlike DROP COLUMN, SQLite 3.35+ only), so the comment is unconditional.
  // ifmEnabled/ifmEnabledStrict are equivalent here (see Check_TableModified), so a single check
  // suffices, and AStrict = True (shared PlanBuilder.Base.Plan_OrphanIndexes) mirrors that equivalence:
  // it skips exactly the tables already cleared for real in 2a.
  if Context.Reconciliation.IndexesMode >= ifmEnabled then
    Plan_OrphanIndexes(LPlan, LMappedSchema, LPhysicalSchema, True);

  // 3d. Orphan foreign keys on tables that are NOT being rebuilt, same reasoning as 3c: a rebuilt table's
  // FKs are recreated inline from the mapped schema by its own CREATE TABLE, orphans included, so this only
  // needs to cover tables left alone (AStrict = True, shared PlanBuilder.Base.Plan_OrphanForeignKeys).
  // Unlike indexes, SQLite has no ALTER TABLE ... DROP CONSTRAINT at all (not a version gate, a hard
  // dialect limitation - the only way to remove one FK is a full table rebuild), so Strategy.WithoutAlterTable
  // overrides ScriptWrite_DropOrphanForeignKey to warn only, no SQL comment.
  if Context.Reconciliation.ForeignKeysMode >= ifmEnabled then
    Plan_OrphanForeignKeys(LPlan, LMappedSchema, LPhysicalSchema, True);

  Escalate_PendingStatuses(LMappedSchema);

  Result := LPlan;
end;

end.
