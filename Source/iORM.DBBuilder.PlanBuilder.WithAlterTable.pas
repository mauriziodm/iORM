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
unit iORM.DBBuilder.PlanBuilder.WithAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.PlanBuilder.Base;

type

  /// <summary>
  ///  PlanBuilder shape for DBMS that can ALTER a table in place (Supports_AlterTable = True: Firebird,
  ///  MS SQL Server). Emits fine-grained ops in a create-safe order (strict drops -> tables+fields ->
  ///  indexes -> foreign keys -> orphan drops) so referenced tables exist before their FKs and physical
  ///  indexes/FKs are cleared before the recreations. Strict mode (ifmEnabledStrict): for every modified
  ///  table, drop ALL its physical indexes/foreign keys (orphans and manually-added ones included) and
  ///  recreate all the mapped ones - the schema becomes authoritative.
  ///  The fresh whole-DB create (schema stCreate + CREATE DATABASE, via MappedSchema.ForceCreateStatus) is
  ///  decided upstream (the DBBuilder, when the database does not exist) - not here; with a nil
  ///  PhysicalSchema everything is simply "new".
  /// </summary>
  TioDBBuilderPlanBuilderWithAlterTable = class(TioDBBuilderPlanBuilderBase)
  private
    // Whether an existing table has any mapped-side difference (a field/index/FK added or modified). Used
    // by strict mode to decide which tables to clear, BEFORE the create phases emit their ops. Checks
    // fields/indexes/FKs unconditionally (strict implies index/FK management is enabled).
    function Check_TableModified(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): Boolean;
    // Diff phases (each iterates every mapped table so the resulting order is create-safe).
    procedure Plan_ForeignKeys(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema; const AStrict: Boolean);
    procedure Plan_Indexes(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema; const AStrict: Boolean);
    procedure Plan_OrphanFields(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_OrphanTables(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_StrictDropForeignKeys(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_StrictDropIndexes(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_TablesAndFields(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
  protected
    function Build: IioDBBuilderPlan; override;
  public
  end;

implementation

uses
  System.SysUtils, iORM.Attributes;

{ TioDBBuilderPlanBuilderWithAlterTable }

function TioDBBuilderPlanBuilderWithAlterTable.Build: IioDBBuilderPlan;
var
  LMappedSchema, LPhysicalSchema: IioDBBuilderSchema;
  LPlan: IioDBBuilderPlan;
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LStrictIndexes, LStrictForeignKeys: Boolean;
begin
  LMappedSchema := Context.Reconciliation.MappedSchema;
  // May be nil when the Introspector has not run (e.g. a non-existent DB): treated as "nothing exists yet".
  LPhysicalSchema := Context.Reconciliation.PhysicalSchema;
  LPlan := Context.Reconciliation.Plan;
  LPlan.Clear;

  LStrictIndexes := LMappedSchema.IndexesMode = ifmEnabledStrict;
  LStrictForeignKeys := LMappedSchema.ForeignKeysMode = ifmEnabledStrict;

  // Strict pre-pass: mark the existing modified tables stUpdate NOW, so the strict "drop all physical
  // indexes/FKs" ops can be emitted ahead of the recreations (drops-before-creates) and the create phases
  // know which tables to fully recreate. SetStatus is monotonic; the create phases stamp the same later.
  if LStrictIndexes or LStrictForeignKeys then
    for LMappedTable in LMappedSchema.Tables.Values do
    begin
      LPhysicalTable := Find_TableByName(LPhysicalSchema, LMappedTable.Name);
      if (LPhysicalTable <> nil) and Check_TableModified(LMappedTable, LPhysicalTable) then
        LMappedTable.Status := stUpdate;
    end;

  if LStrictIndexes then
    Plan_StrictDropIndexes(LPlan, LMappedSchema, LPhysicalSchema);
  if LStrictForeignKeys then
    Plan_StrictDropForeignKeys(LPlan, LMappedSchema, LPhysicalSchema);

  // Create-safe order: tables/fields first, then indexes, then FKs (referenced tables already exist),
  // then the orphan field/table drops. Indexes/FKs honour their configured mode.
  Plan_TablesAndFields(LPlan, LMappedSchema, LPhysicalSchema);
  if LMappedSchema.IndexesMode >= ifmEnabled then
    Plan_Indexes(LPlan, LMappedSchema, LPhysicalSchema, LStrictIndexes);
  if LMappedSchema.ForeignKeysMode >= ifmEnabled then
    Plan_ForeignKeys(LPlan, LMappedSchema, LPhysicalSchema, LStrictForeignKeys);
  Plan_OrphanFields(LPlan, LMappedSchema, LPhysicalSchema);
  Plan_OrphanTables(LPlan, LMappedSchema, LPhysicalSchema);

  // Coarse (table-level) view of the diff: the schema needs work if any mapped table does. SetStatus is
  // monotonic, so this never downgrades a schema already forced to stCreate (the fresh-DB case handled
  // upstream).
  for LMappedTable in LMappedSchema.Tables.Values do
    if LMappedTable.Status > stClean then
    begin
      LMappedSchema.Status := stUpdate;
      Break;
    end;

  Result := LPlan;
end;

function TioDBBuilderPlanBuilderWithAlterTable.Check_TableModified(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): Boolean;
var
  LField: IioDBBuilderSchemaField;
  LIndex: IioDBBuilderSchemaIndex;
  LFK: IioDBBuilderSchemaFK;
  LPhysicalField: IioDBBuilderSchemaField;
  LPhysicalIndex: IioDBBuilderSchemaIndex;
  LPhysicalFK: IioDBBuilderSchemaFK;
begin
  Result := True;  // exit True on the first difference found
  for LField in AMappedTable.Fields do
  begin
    LPhysicalField := APhysicalTable.FindField(LField.FieldName);
    if (LPhysicalField = nil) or (Context.SqlGenerator.Compare_Field(LField, LPhysicalField) <> []) then
      Exit;
  end;
  for LIndex in AMappedTable.Indexes.Values do
  begin
    LPhysicalIndex := Match_PhysicalIndex(AMappedTable, LIndex, APhysicalTable);
    if (LPhysicalIndex = nil) or (Context.SqlGenerator.Compare_Index(LIndex, LPhysicalIndex) <> []) then
      Exit;
  end;
  for LFK in AMappedTable.ForeignKeys.Values do
  begin
    LPhysicalFK := Match_PhysicalForeignKey(LFK, APhysicalTable);
    if (LPhysicalFK = nil) or Check_ForeignKeyModified(LFK, LPhysicalFK) then
      Exit;
  end;
  Result := False;
end;

procedure TioDBBuilderPlanBuilderWithAlterTable.Plan_StrictDropIndexes(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LPhysicalIndex: IioDBBuilderSchemaIndex;
begin
  // Strict: for every modified table, drop EVERY physical index (orphans and manual ones included) so the
  // schema-driven recreation starts from a clean slate. The modified tables were marked stUpdate in the
  // strict pre-pass.
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    if LMappedTable.Status <> stUpdate then
      Continue;
    LPhysicalTable := Find_TableByName(APhysicalSchema, LMappedTable.Name);
    if LPhysicalTable = nil then
      Continue;
    for LPhysicalIndex in LPhysicalTable.Indexes.Values do
    begin
      LPhysicalIndex.Status := stDrop;
      APlan.AddDropIndex(LMappedTable, LPhysicalIndex);
    end;
  end;
end;

procedure TioDBBuilderPlanBuilderWithAlterTable.Plan_StrictDropForeignKeys(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LPhysicalFK: IioDBBuilderSchemaFK;
begin
  // Strict: for every modified table, drop EVERY physical foreign key (see Plan_StrictDropIndexes).
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    if LMappedTable.Status <> stUpdate then
      Continue;
    LPhysicalTable := Find_TableByName(APhysicalSchema, LMappedTable.Name);
    if LPhysicalTable = nil then
      Continue;
    for LPhysicalFK in LPhysicalTable.ForeignKeys.Values do
    begin
      LPhysicalFK.Status := stDrop;
      APlan.AddDropForeignKey(LMappedTable, LPhysicalFK);
    end;
  end;
end;

procedure TioDBBuilderPlanBuilderWithAlterTable.Plan_TablesAndFields(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LField, LPhysicalField: IioDBBuilderSchemaField;
  LChanges: TioDBBuilderFieldChanges;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := Find_TableByName(APhysicalSchema, LMappedTable.Name);
    if LPhysicalTable = nil then
    begin
      // New table: the CreateTable translator emits the fields (and PK) inline, so no per-field ops here.
      // The sequence, if any, is created first so it exists before the table that uses it.
      LMappedTable.Status := stCreate;
      for LField in LMappedTable.Fields do
        LField.Status := stCreate;
      if LMappedTable.UsesSequenceForKeyGeneration then
        APlan.AddCreateSequence(LMappedTable.GetSequenceName);
      APlan.AddCreateTable(LMappedTable);
    end
    else
      // Existing table: add missing fields and alter modified ones. SetStatus is monotonic, so marking the
      // table stUpdate never downgrades a new table's stCreate.
      for LField in LMappedTable.Fields do
      begin
        LPhysicalField := LPhysicalTable.FindField(LField.FieldName);
        if LPhysicalField = nil then
        begin
          LField.Status := stCreate;
          LMappedTable.Status := stUpdate;
          APlan.AddCreateField(LMappedTable, LField);
        end
        else
        begin
          LChanges := Context.SqlGenerator.Compare_Field(LField, LPhysicalField);
          if LChanges <> [] then
          begin
            LField.Status := stUpdate;
            LMappedTable.Status := stUpdate;
            APlan.AddAlterField(LMappedTable, LField, LPhysicalField, LChanges);
          end;
        end;
      end;
  end;
end;

procedure TioDBBuilderPlanBuilderWithAlterTable.Plan_Indexes(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema; const AStrict: Boolean);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LIndex, LPhysicalIndex: IioDBBuilderSchemaIndex;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := Find_TableByName(APhysicalSchema, LMappedTable.Name);
    for LIndex in LMappedTable.Indexes.Values do
    begin
      if AStrict and (LMappedTable.Status = stUpdate) then
      begin
        // Strict + modified table: every physical index was already dropped, so recreate all mapped ones.
        LIndex.Status := stCreate;
        APlan.AddCreateIndex(LMappedTable, LIndex);
        Continue;
      end;
      if LPhysicalTable = nil then
        LPhysicalIndex := nil
      else
        LPhysicalIndex := Match_PhysicalIndex(LMappedTable, LIndex, LPhysicalTable);
      if LPhysicalIndex = nil then
      begin
        LIndex.Status := stCreate;
        LMappedTable.Status := stUpdate;  // monotonic: harmless on a brand-new (stCreate) table
        APlan.AddCreateIndex(LMappedTable, LIndex);
      end
      else if Context.SqlGenerator.Compare_Index(LIndex, LPhysicalIndex) <> [] then
      begin
        // Modified index: drop the physical one, recreate the mapped one.
        LPhysicalIndex.Status := stDrop;
        LIndex.Status := stUpdate;
        LMappedTable.Status := stUpdate;
        APlan.AddDropIndex(LMappedTable, LPhysicalIndex);
        APlan.AddCreateIndex(LMappedTable, LIndex);
      end;
    end;
  end;
end;

procedure TioDBBuilderPlanBuilderWithAlterTable.Plan_ForeignKeys(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema; const AStrict: Boolean);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LFK, LPhysicalFK: IioDBBuilderSchemaFK;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := Find_TableByName(APhysicalSchema, LMappedTable.Name);
    for LFK in LMappedTable.ForeignKeys.Values do
    begin
      if AStrict and (LMappedTable.Status = stUpdate) then
      begin
        // Strict + modified table: every physical FK was already dropped, so recreate all mapped ones.
        LFK.Status := stCreate;
        APlan.AddCreateForeignKey(LMappedTable, LFK);
        Continue;
      end;
      if LPhysicalTable = nil then
        LPhysicalFK := nil
      else
        LPhysicalFK := Match_PhysicalForeignKey(LFK, LPhysicalTable);
      if LPhysicalFK = nil then
      begin
        LFK.Status := stCreate;
        LMappedTable.Status := stUpdate;  // monotonic: harmless on a brand-new (stCreate) table
        APlan.AddCreateForeignKey(LMappedTable, LFK);
      end
      else if Check_ForeignKeyModified(LFK, LPhysicalFK) then
      begin
        // Modified FK: drop the physical one, recreate the mapped one.
        LPhysicalFK.Status := stDrop;
        LFK.Status := stUpdate;
        LMappedTable.Status := stUpdate;
        APlan.AddDropForeignKey(LMappedTable, LPhysicalFK);
        APlan.AddCreateForeignKey(LMappedTable, LFK);
      end;
    end;
  end;
end;

procedure TioDBBuilderPlanBuilderWithAlterTable.Plan_OrphanFields(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LPhysicalField: IioDBBuilderSchemaField;
begin
  if APhysicalSchema = nil then
    Exit;
  // A field present in the DB but absent from the ORM map of an otherwise-mapped table: mark it for
  // drop. The translation (Strategy) renders it as a commented-out, non-executed statement plus a
  // warning - iORM never silently drops a field (mirrors Plan_OrphanTables).
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := Find_TableByName(APhysicalSchema, LMappedTable.Name);
    if LPhysicalTable = nil then
      Continue;
    for LPhysicalField in LPhysicalTable.Fields do
      if LMappedTable.FindField(LPhysicalField.FieldName) = nil then
      begin
        LPhysicalField.Status := stDrop;
        APlan.AddDropField(LMappedTable, LPhysicalField);
      end;
  end;
end;

procedure TioDBBuilderPlanBuilderWithAlterTable.Plan_OrphanTables(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LPhysicalTable: IioDBBuilderSchemaTable;
begin
  if APhysicalSchema = nil then
    Exit;
  // A table present in the DB but absent from the ORM maps: mark it for drop. The translation (C4) renders
  // it as a commented-out, non-executed statement plus a warning - iORM never silently drops a table.
  for LPhysicalTable in APhysicalSchema.Tables.Values do
    if Find_TableByName(AMappedSchema, LPhysicalTable.Name) = nil then
    begin
      LPhysicalTable.Status := stDrop;
      APlan.AddDropTable(LPhysicalTable);
    end;
end;

end.
