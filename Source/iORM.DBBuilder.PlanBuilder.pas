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
unit iORM.DBBuilder.PlanBuilder;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  /// <summary>
  ///  Diffs MappedSchema against PhysicalSchema and produces the Plan. It is a SINGLE, dialect-independent
  ///  class: every genuinely dialect-specific decision lives elsewhere - catalog reading in the
  ///  Introspector, type/index comparison and name computation in the SqlGenerator - so this class only
  ///  orchestrates. Phase order is create-safe (strict drops -> tables+fields -> indexes -> foreign keys ->
  ///  orphan drops) so referenced tables exist before their FKs and physical indexes/FKs are cleared
  ///  before the recreations. Sole writer of the nodes' Status. Handles the INCREMENTAL case (an existing
  ///  DB). The fresh whole-DB create (schema stCreate + CREATE DATABASE, via MappedSchema.ForceCreateStatus)
  ///  is the Engine's job when the database does not exist - it is not decided here, keeping this class
  ///  free of any "does the DB exist?" knowledge.
  ///  Strict mode (ifmEnabledStrict): for every modified table, drop ALL its physical indexes/foreign keys
  ///  (orphans and manually-added ones included) and recreate all the mapped ones - the schema is
  ///  authoritative. WithoutAlterTable dialects (SQLite) ignore these ops and rebuild the whole table off
  ///  the table Status; only WithAlterTable dialects act on them.
  /// </summary>
  TioDBBuilderPlanBuilder = class(TInterfacedObject, IioDBBuilderPlanBuilder)
  private
    FContext: IioDBBuilderContext;

    function Build: IioDBBuilderPlan;
    // Whether a matched foreign key differs. Compares the FULL structure (dependent table+field, reference
    // table+field, on-delete/on-update actions) rather than only the attributes that can still differ: it
    // keeps the method self-contained and correct even if Find_PhysicalForeignKey's match key changes. The
    // redundant checks (dependent field + reference table are already equal by the match; dependent table
    // is the same matched table) are simply always false. Generic across dialects (both branches carry the
    // structural fields). NB: a change to the DEPENDENT FIELD is not detected here anyway - Find_PhysicalForeignKey
    // would not match, so the mapped FK becomes new and the old physical one an orphan (dropped only in strict).
    function Check_ForeignKeyModified(const AMappedFK, APhysicalFK: IioDBBuilderSchemaFK): Boolean;
    // Whether an existing table has any mapped-side difference (a field/index/FK added or modified). Used
    // by strict mode to decide which tables to clear, BEFORE the create phases emit their ops.
    function Check_TableModified(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): Boolean;
    // Cross-branch lookups. Matching is case-insensitive (SameText): both branches normalize identifiers
    // via the same SqlDataConverter, so the keys already align - the case-insensitivity is just belt-and-
    // suspenders (and mirrors SQLite's native case-insensitive identifier matching). Each returns the
    // physical node, or nil = absent.
    function Find_PhysicalField(const APhysicalTable: IioDBBuilderSchemaTable; const AFieldName: String): IioDBBuilderSchemaField;
    function Find_PhysicalForeignKey(const AMappedFK: IioDBBuilderSchemaFK;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK;
    function Find_PhysicalIndex(const AMappedTable: IioDBBuilderSchemaTable; const AMappedIndex: IioDBBuilderSchemaIndex;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaIndex;
    function Find_TableByName(const ASchema: IioDBBuilderSchema; const AName: String): IioDBBuilderSchemaTable;
    function GetContext: IioDBBuilderContext;
    // Diff phases (each iterates every mapped table so the resulting order is create-safe).
    procedure Plan_StrictDropIndexes(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_StrictDropForeignKeys(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_TablesAndFields(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_Indexes(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema; const AStrict: Boolean);
    procedure Plan_ForeignKeys(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema; const AStrict: Boolean);
    procedure Plan_OrphanTables(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
  protected
    property Context: IioDBBuilderContext read GetContext;
  public
    constructor Create(const AContext: IioDBBuilderContext);
  end;

implementation

uses
  System.SysUtils, iORM.Attributes;

{ TioDBBuilderPlanBuilder }

function TioDBBuilderPlanBuilder.Build: IioDBBuilderPlan;
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
  // then the orphan table drops. Indexes/FKs honour their configured mode.
  Plan_TablesAndFields(LPlan, LMappedSchema, LPhysicalSchema);
  if LMappedSchema.IndexesMode >= ifmEnabled then
    Plan_Indexes(LPlan, LMappedSchema, LPhysicalSchema, LStrictIndexes);
  if LMappedSchema.ForeignKeysMode >= ifmEnabled then
    Plan_ForeignKeys(LPlan, LMappedSchema, LPhysicalSchema, LStrictForeignKeys);
  Plan_OrphanTables(LPlan, LMappedSchema, LPhysicalSchema);

  // Coarse (table-level) view of the diff: the schema needs work if any mapped table does. This is what
  // the WithoutAlterTable strategy reads in C4 to drive its table rebuild. SetStatus is monotonic, so this
  // never downgrades a schema already forced to stCreate (the fresh-DB case handled upstream).
  for LMappedTable in LMappedSchema.Tables.Values do
    if LMappedTable.Status > stClean then
    begin
      LMappedSchema.Status := stUpdate;
      Break;
    end;

  Result := LPlan;
end;

function TioDBBuilderPlanBuilder.Find_PhysicalForeignKey(const AMappedFK: IioDBBuilderSchemaFK;
  const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK;
var
  LPhysicalFK: IioDBBuilderSchemaFK;
begin
  Result := nil;
  for LPhysicalFK in APhysicalTable.ForeignKeys.Values do
    if SameText(LPhysicalFK.DependentFieldName, AMappedFK.DependentFieldName) and
       SameText(LPhysicalFK.ReferenceTableName, AMappedFK.ReferenceTableName) then
      Exit(LPhysicalFK);
end;

function TioDBBuilderPlanBuilder.Find_PhysicalField(const APhysicalTable: IioDBBuilderSchemaTable;
  const AFieldName: String): IioDBBuilderSchemaField;
var
  LField: IioDBBuilderSchemaField;
begin
  Result := nil;
  for LField in APhysicalTable.Fields do
    if SameText(LField.FieldName, AFieldName) then
      Exit(LField);
end;

function TioDBBuilderPlanBuilder.Find_PhysicalIndex(const AMappedTable: IioDBBuilderSchemaTable;
  const AMappedIndex: IioDBBuilderSchemaIndex; const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaIndex;
var
  LMappedIndexName: String;
  LPhysicalIndex: IioDBBuilderSchemaIndex;
begin
  Result := nil;
  // The mapped index has no catalog name of its own: compute the name it WOULD have (dialect rule) and
  // look for it among the physical indexes.
  LMappedIndexName := Context.SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(AMappedTable, AMappedIndex);
  for LPhysicalIndex in APhysicalTable.Indexes.Values do
    if SameText(LPhysicalIndex.Name, LMappedIndexName) then
      Exit(LPhysicalIndex);
end;

function TioDBBuilderPlanBuilder.Find_TableByName(const ASchema: IioDBBuilderSchema;
  const AName: String): IioDBBuilderSchemaTable;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Result := nil;
  if ASchema = nil then
    Exit;
  for LTable in ASchema.Tables.Values do
    if SameText(LTable.Name, AName) then
      Exit(LTable);
end;

constructor TioDBBuilderPlanBuilder.Create(const AContext: IioDBBuilderContext);
begin
  inherited Create;
  FContext := AContext;
end;

function TioDBBuilderPlanBuilder.GetContext: IioDBBuilderContext;
begin
  Result := FContext;
end;

function TioDBBuilderPlanBuilder.Check_ForeignKeyModified(const AMappedFK, APhysicalFK: IioDBBuilderSchemaFK): Boolean;
begin
  // Full structural comparison (see the declaration note): self-contained, no reliance on the match key.
  Result := (not SameText(AMappedFK.DependentTableName, APhysicalFK.DependentTableName))
    or (not SameText(AMappedFK.DependentFieldName, APhysicalFK.DependentFieldName))
    or (not SameText(AMappedFK.ReferenceTableName, APhysicalFK.ReferenceTableName))
    or (not SameText(AMappedFK.ReferenceFieldName, APhysicalFK.ReferenceFieldName))
    or (AMappedFK.OnDeleteAction <> APhysicalFK.OnDeleteAction)
    or (AMappedFK.OnUpdateAction <> APhysicalFK.OnUpdateAction);
end;

function TioDBBuilderPlanBuilder.Check_TableModified(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): Boolean;
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
    LPhysicalField := Find_PhysicalField(APhysicalTable, LField.FieldName);
    if (LPhysicalField = nil) or (Context.SqlGenerator.Compare_Field(LField, LPhysicalField) <> []) then
      Exit;
  end;
  for LIndex in AMappedTable.Indexes.Values do
  begin
    LPhysicalIndex := Find_PhysicalIndex(AMappedTable, LIndex, APhysicalTable);
    if (LPhysicalIndex = nil) or (Context.SqlGenerator.Compare_Index(LIndex, LPhysicalIndex) <> []) then
      Exit;
  end;
  for LFK in AMappedTable.ForeignKeys.Values do
  begin
    LPhysicalFK := Find_PhysicalForeignKey(LFK, APhysicalTable);
    if (LPhysicalFK = nil) or Check_ForeignKeyModified(LFK, LPhysicalFK) then
      Exit;
  end;
  Result := False;
end;

procedure TioDBBuilderPlanBuilder.Plan_StrictDropIndexes(const APlan: IioDBBuilderPlan;
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

procedure TioDBBuilderPlanBuilder.Plan_StrictDropForeignKeys(const APlan: IioDBBuilderPlan;
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

procedure TioDBBuilderPlanBuilder.Plan_TablesAndFields(const APlan: IioDBBuilderPlan;
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
        LPhysicalField := Find_PhysicalField(LPhysicalTable, LField.FieldName);
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

procedure TioDBBuilderPlanBuilder.Plan_Indexes(const APlan: IioDBBuilderPlan;
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
        LPhysicalIndex := Find_PhysicalIndex(LMappedTable, LIndex, LPhysicalTable);
      if LPhysicalIndex = nil then
      begin
        LIndex.Status := stCreate;
        LMappedTable.Status := stUpdate;  // monotonic: harmless on a brand-new (stCreate) table
        APlan.AddCreateIndex(LMappedTable, LIndex);
      end
      else if Context.SqlGenerator.Compare_Index(LIndex, LPhysicalIndex) <> [] then
      begin
        // Modified index: drop the physical one, recreate the mapped one (Firebird ALTER-style; SQLite
        // ignores these and rebuilds the whole table off the table Status).
        LPhysicalIndex.Status := stDrop;
        LIndex.Status := stUpdate;
        LMappedTable.Status := stUpdate;
        APlan.AddDropIndex(LMappedTable, LPhysicalIndex);
        APlan.AddCreateIndex(LMappedTable, LIndex);
      end;
    end;
  end;
end;

procedure TioDBBuilderPlanBuilder.Plan_ForeignKeys(const APlan: IioDBBuilderPlan;
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
        LPhysicalFK := Find_PhysicalForeignKey(LFK, LPhysicalTable);
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

procedure TioDBBuilderPlanBuilder.Plan_OrphanTables(const APlan: IioDBBuilderPlan;
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
