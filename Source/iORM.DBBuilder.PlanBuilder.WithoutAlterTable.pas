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
  ///  create indexes -> copy data. Foreign keys are inline in CREATE TABLE for these dialects, so no FK ops
  ///  are emitted. Because the rebuild recreates everything from scratch, ifmEnabled and ifmEnabledStrict
  ///  are equivalent here; only ifmDisabled prevents index recreation. A table present in the DB but absent
  ///  from the ORM maps is left untouched by the rebuild ops (nothing to recreate) but still flagged as an
  ///  orphan, same as WithAlterTable's Plan_OrphanTables.
  ///  The fresh whole-DB create (schema stCreate + CREATE DATABASE, via MappedSchema.ForceCreateStatus) is
  ///  decided upstream (the DBBuilder, when the database does not exist) - not here; with a nil
  ///  PhysicalSchema everything is simply "new".
  /// </summary>
  TioDBBuilderPlanBuilderWithoutAlterTable = class(TioDBBuilderPlanBuilderBase)
  private
    // Whether an existing table must be fully rebuilt. Like the incremental Check_TableModified but
    // MODE-AWARE: index/FK differences count only when their axis is managed (IndexesMode/ForeignKeysMode
    // >= ifmEnabled), so a disabled axis never triggers a rebuild - mirroring the incremental Plan_Indexes/
    // Plan_ForeignKeys guards. A field add/change always forces a rebuild.
    function Check_TableNeedsRebuild(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): Boolean;
  protected
    function Build: IioDBBuilderPlan; override;
  public
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderPlanBuilderWithoutAlterTable }

function TioDBBuilderPlanBuilderWithoutAlterTable.Build: IioDBBuilderPlan;
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
    else if Check_TableNeedsRebuild(LMappedTable, LPhysicalTable) then
    begin
      LMappedTable.Status := stUpdate;
      // Mark the fields absent from the physical table stCreate so the data-copy op skips them: they have
      // no source column in the "_old" shadow table (every other field is copied across).
      for LField in LMappedTable.Fields do
        if LPhysicalTable.FindField(LField.FieldName) = nil then
          LField.Status := stCreate;
      // Orphan physical fields (in the DB, not mapped) have no dedicated op here - unlike WithAlterTable's
      // opDropField, the rebuild simply never copies them into the recreated table, so their data is lost
      // silently unless we warn about it now, at plan time.
      for LField in LPhysicalTable.Fields do
        if LMappedTable.FindField(LField.FieldName) = nil then
        begin
          Context.Script.Warnings.AddLine(Format('Field ''%s'' on table ''%s'' exists in the database but is not mapped by any entity: ' +
            'it will be PERMANENTLY LOST when the table is rebuilt (this dialect cannot ALTER a table in place).',
            [LField.FieldName, LMappedTable.Name]));
          Warn_DanglingForeignKeys(LMappedSchema, LMappedTable.Name, LField.FieldName);
        end;
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

  // 3. Orphan tables: present in the DB but absent from the ORM maps. Nothing to rebuild for a table
  //    iORM doesn't manage, but flagged the same way WithAlterTable's Plan_OrphanTables does: cascade
  //    stDrop to keep the informational Status tree consistent, warn about any live FK that would
  //    dangle, and emit a DROP TABLE the Strategy renders as a comment (never auto-executed).
  if LPhysicalSchema <> nil then
    for LPhysicalTable in LPhysicalSchema.Tables.Values do
      if Find_TableByName(LMappedSchema, LPhysicalTable.Name) = nil then
      begin
        LPhysicalTable.CascadeTableDropStatus;
        Warn_DanglingForeignKeys(LMappedSchema, LPhysicalTable.Name, '');
        LPlan.AddDropTable(LPhysicalTable);
      end;

  // Coarse (schema-level) view: the schema needs work if any table does (monotonic: never downgrades a
  // schema already forced to stCreate by the fresh-DB path).
  for LMappedTable in LMappedSchema.Tables.Values do
    if LMappedTable.Status > stClean then
    begin
      LMappedSchema.Status := stUpdate;
      Break;
    end;

  Result := LPlan;
end;

function TioDBBuilderPlanBuilderWithoutAlterTable.Check_TableNeedsRebuild(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): Boolean;
var
  LField, LPhysicalField: IioDBBuilderSchemaField;
  LIndex, LPhysicalIndex: IioDBBuilderSchemaIndex;
  LFK, LPhysicalFK: IioDBBuilderSchemaFK;
begin
  Result := True;  // exit True on the first difference found
  // Fields: always compared - a field add/change always forces a whole-table rebuild.
  for LField in AMappedTable.Fields do
  begin
    LPhysicalField := APhysicalTable.FindField(LField.FieldName);
    if (LPhysicalField = nil) or (Context.SqlGenerator.Compare_Field(LField, LPhysicalField) <> []) then
      Exit;
  end;
  // Indexes: only when index management is enabled (mirrors the incremental Plan_Indexes guard, so a
  // disabled index axis never triggers a rebuild).
  if Context.Reconciliation.IndexesMode >= ifmEnabled then
    for LIndex in AMappedTable.Indexes.Values do
    begin
      LPhysicalIndex := Match_PhysicalIndex(AMappedTable, LIndex, APhysicalTable);
      if (LPhysicalIndex = nil) or (Context.SqlGenerator.Compare_Index(LIndex, LPhysicalIndex) <> []) then
        Exit;
    end;
  // Foreign keys: only when FK management is enabled (mirrors the incremental Plan_ForeignKeys guard).
  if Context.Reconciliation.ForeignKeysMode >= ifmEnabled then
    for LFK in AMappedTable.ForeignKeys.Values do
    begin
      LPhysicalFK := Match_PhysicalForeignKey(LFK, APhysicalTable);
      if (LPhysicalFK = nil) or Check_ForeignKeyModified(LFK, LPhysicalFK) then
        Exit;
    end;
  Result := False;
end;

end.
