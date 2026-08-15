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
  ///  orchestrates. Phase order mirrors GenerateScript_Body (tables+fields -> indexes -> foreign keys ->
  ///  orphan drops) so referenced tables always exist before their FKs. Sole writer of the nodes' Status
  ///  (kept purely as information). This first cut (phase C3a/C3b-1) plans only the STRUCTURAL delta:
  ///  create-from-scratch, create of missing fields/indexes/foreign keys, and orphan table drops.
  ///  Detection of *modified* objects (Alter / drop+recreate) and strict mode land in C3b - matched
  ///  objects are treated as clean here.
  /// </summary>
  TioDBBuilderPlanBuilder = class(TInterfacedObject, IioDBBuilderPlanBuilder)
  protected
    FContext: IioDBBuilderContext;
    // Cross-branch lookups. Matching is case-insensitive (SameText): the two branches key their tables
    // differently (Mapped by the raw ORM table name, Physical by the normalized catalog name), exactly
    // as the current code compares via UPPER(...) in SQL.
    function FieldExistsPhysically(const APhysicalTable: IioDBBuilderSchemaTable; const AFieldName: String): Boolean;
    function FindTableByName(const ASchema: IioDBBuilderSchema; const AName: String): IioDBBuilderSchemaTable;
    function IndexExistsPhysically(const AMappedTable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex;
      const APhysicalTable: IioDBBuilderSchemaTable): Boolean;
    // Locate the physical foreign key matching a mapped one (nil = absent). Generic structural match by
    // dependent field + reference table: both dialects now populate those (SQLite from PRAGMA, Firebird
    // via the RDB$ joins added for Direction 2), so no per-dialect matcher is needed. This is behaviourally
    // equivalent to Firebird's former by-name match (the deterministic hash name encodes the same
    // structure) and it deliberately avoids reconstructing the FK name (which depends on the ORM class,
    // absent on the Physical side - reconstructing it would reopen the F13 name-divergence bug class).
    function FindPhysicalFK(const AMappedFK: IioDBBuilderSchemaFK;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK;
    // Diff phases (each iterates every mapped table so the resulting order is create-safe).
    procedure Plan_TablesAndFields(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_Indexes(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_ForeignKeys(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
    procedure Plan_OrphanTables(const APlan: IioDBBuilderPlan; const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
  public
    constructor Create(const AContext: IioDBBuilderContext);
    function Build: IioDBBuilderPlan;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderPlanBuilder }

constructor TioDBBuilderPlanBuilder.Create(const AContext: IioDBBuilderContext);
begin
  FContext := AContext;
end;

function TioDBBuilderPlanBuilder.Build: IioDBBuilderPlan;
var
  LMappedSchema, LPhysicalSchema: IioDBBuilderSchema;
  LPlan: IioDBBuilderPlan;
begin
  LMappedSchema := FContext.Reconciliation.MappedSchema;
  // May be nil when the Introspector has not run (e.g. a non-existent DB): treated as "nothing exists yet".
  LPhysicalSchema := FContext.Reconciliation.PhysicalSchema;
  LPlan := FContext.Reconciliation.Plan;
  LPlan.Clear;

  // Phase order mirrors GenerateScript_Body: tables/fields first, then indexes, then FKs (so every
  // referenced table already exists), then the orphan drops. Indexes/FKs honour their configured mode.
  Plan_TablesAndFields(LPlan, LMappedSchema, LPhysicalSchema);
  if LMappedSchema.IndexesMode >= ifmEnabled then
    Plan_Indexes(LPlan, LMappedSchema, LPhysicalSchema);
  if LMappedSchema.ForeignKeysMode >= ifmEnabled then
    Plan_ForeignKeys(LPlan, LMappedSchema, LPhysicalSchema);
  Plan_OrphanTables(LPlan, LMappedSchema, LPhysicalSchema);

  Result := LPlan;
end;

function TioDBBuilderPlanBuilder.FieldExistsPhysically(const APhysicalTable: IioDBBuilderSchemaTable;
  const AFieldName: String): Boolean;
var
  LField: IioDBBuilderSchemaField;
begin
  Result := False;
  for LField in APhysicalTable.Fields do
    if SameText(LField.FieldName, AFieldName) then
      Exit(True);
end;

function TioDBBuilderPlanBuilder.FindPhysicalFK(const AMappedFK: IioDBBuilderSchemaFK;
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

function TioDBBuilderPlanBuilder.FindTableByName(const ASchema: IioDBBuilderSchema;
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

function TioDBBuilderPlanBuilder.IndexExistsPhysically(const AMappedTable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex; const APhysicalTable: IioDBBuilderSchemaTable): Boolean;
var
  LMappedIndexName: String;
  LPhysicalIndex: IioDBBuilderSchemaIndex;
begin
  Result := False;
  // The mapped index has no catalog name of its own: compute the name it WOULD have (dialect rule) and
  // look for it among the physical indexes.
  LMappedIndexName := FContext.SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(AMappedTable, AIndex);
  for LPhysicalIndex in APhysicalTable.Indexes.Values do
    if SameText(LPhysicalIndex.Name, LMappedIndexName) then
      Exit(True);
end;

procedure TioDBBuilderPlanBuilder.Plan_TablesAndFields(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LField: IioDBBuilderSchemaField;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := FindTableByName(APhysicalSchema, LMappedTable.Name);
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
      // Existing table: add the fields absent from the DB. Modified-field detection is deferred to C3b,
      // so matched fields are left as-is (stClean).
      for LField in LMappedTable.Fields do
        if not FieldExistsPhysically(LPhysicalTable, LField.FieldName) then
        begin
          LField.Status := stCreate;
          APlan.AddCreateField(LMappedTable, LField);
        end;
  end;
end;

procedure TioDBBuilderPlanBuilder.Plan_Indexes(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := FindTableByName(APhysicalSchema, LMappedTable.Name);
    for LIndex in LMappedTable.Indexes.Values do
      if (LPhysicalTable = nil) or not IndexExistsPhysically(LMappedTable, LIndex, LPhysicalTable) then
      begin
        LIndex.Status := stCreate;
        APlan.AddCreateIndex(LMappedTable, LIndex);
      end;
  end;
end;

procedure TioDBBuilderPlanBuilder.Plan_ForeignKeys(const APlan: IioDBBuilderPlan;
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LFK: IioDBBuilderSchemaFK;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := FindTableByName(APhysicalSchema, LMappedTable.Name);
    for LFK in LMappedTable.ForeignKeys.Values do
      if (LPhysicalTable = nil) or (FindPhysicalFK(LFK, LPhysicalTable) = nil) then
      begin
        LFK.Status := stCreate;
        APlan.AddCreateForeignKey(LMappedTable, LFK);
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
    if FindTableByName(AMappedSchema, LPhysicalTable.Name) = nil then
    begin
      LPhysicalTable.Status := stDrop;
      APlan.AddDropTable(LPhysicalTable);
    end;
end;

end.
