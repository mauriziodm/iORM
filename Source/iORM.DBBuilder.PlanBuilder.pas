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
  ///  orphan drops) so referenced tables always exist before their FKs. Sole writer of the nodes' Status.
  ///  Handles the INCREMENTAL case (an existing DB): it plans create-of-missing, alter/drop+recreate of
  ///  modified objects, and orphan-table drops, and marks the mapped schema/tables stUpdate accordingly.
  ///  The fresh whole-DB create (schema stCreate + CREATE DATABASE, via MappedSchema.ForceCreateStatus)
  ///  is the Engine's job when the database does not exist - it is not decided here, keeping this class
  ///  free of any "does the DB exist?" knowledge. Strict mode (drop ALL physical indexes/FKs of modified
  ///  tables) lands in a later phase.
  /// </summary>
  TioDBBuilderPlanBuilder = class(TInterfacedObject, IioDBBuilderPlanBuilder)
  protected
    FContext: IioDBBuilderContext;
    // Cross-branch lookups. Matching is case-insensitive (SameText): the two branches key their tables
    // differently (Mapped by the raw ORM table name, Physical by the normalized catalog name), exactly
    // as the current code compares via UPPER(...) in SQL. Each returns the physical node, or nil = absent.
    function FindPhysicalFK(const AMappedFK: IioDBBuilderSchemaFK; const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK;
    function FindPhysicalField(const APhysicalTable: IioDBBuilderSchemaTable; const AFieldName: String): IioDBBuilderSchemaField;
    function FindPhysicalIndex(const AMappedTable: IioDBBuilderSchemaTable; const AMappedIndex: IioDBBuilderSchemaIndex;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaIndex;
    function FindTableByName(const ASchema: IioDBBuilderSchema; const AName: String): IioDBBuilderSchemaTable;
    // Once matched, whether a foreign key differs. The match key (dependent field + reference table) is
    // already equal, so this compares the rest: reference field + on-delete/on-update actions. Generic
    // across dialects (both branches carry the structural fields).
    function ForeignKeyModified(const AMappedFK, APhysicalFK: IioDBBuilderSchemaFK): Boolean;
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
  System.SysUtils, iORM.Attributes;

{ TioDBBuilderPlanBuilder }

constructor TioDBBuilderPlanBuilder.Create(const AContext: IioDBBuilderContext);
begin
  FContext := AContext;
end;

function TioDBBuilderPlanBuilder.Build: IioDBBuilderPlan;
var
  LMappedSchema, LPhysicalSchema: IioDBBuilderSchema;
  LPlan: IioDBBuilderPlan;
  LTable: IioDBBuilderSchemaTable;
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

  // Coarse (table-level) view of the diff: the schema needs work if any mapped table does. This is what
  // the WithoutAlterTable strategy reads in C4 to drive its table rebuild. SetStatus is monotonic, so this
  // never downgrades a schema already forced to stCreate (the fresh-DB case handled upstream).
  for LTable in LMappedSchema.Tables.Values do
    if LTable.Status > stClean then
    begin
      LMappedSchema.Status := stUpdate;
      Break;
    end;

  Result := LPlan;
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

function TioDBBuilderPlanBuilder.FindPhysicalField(const APhysicalTable: IioDBBuilderSchemaTable;
  const AFieldName: String): IioDBBuilderSchemaField;
var
  LField: IioDBBuilderSchemaField;
begin
  Result := nil;
  for LField in APhysicalTable.Fields do
    if SameText(LField.FieldName, AFieldName) then
      Exit(LField);
end;

function TioDBBuilderPlanBuilder.FindPhysicalIndex(const AMappedTable: IioDBBuilderSchemaTable;
  const AMappedIndex: IioDBBuilderSchemaIndex; const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaIndex;
var
  LMappedIndexName: String;
  LPhysicalIndex: IioDBBuilderSchemaIndex;
begin
  Result := nil;
  // The mapped index has no catalog name of its own: compute the name it WOULD have (dialect rule) and
  // look for it among the physical indexes.
  LMappedIndexName := FContext.SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(AMappedTable, AMappedIndex);
  for LPhysicalIndex in APhysicalTable.Indexes.Values do
    if SameText(LPhysicalIndex.Name, LMappedIndexName) then
      Exit(LPhysicalIndex);
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

function TioDBBuilderPlanBuilder.ForeignKeyModified(const AMappedFK, APhysicalFK: IioDBBuilderSchemaFK): Boolean;
begin
  Result := (not SameText(AMappedFK.ReferenceFieldName, APhysicalFK.ReferenceFieldName))
    or (AMappedFK.OnDeleteAction <> APhysicalFK.OnDeleteAction)
    or (AMappedFK.OnUpdateAction <> APhysicalFK.OnUpdateAction);
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
      // Existing table: add missing fields and alter modified ones. SetStatus is monotonic, so marking the
      // table stUpdate never downgrades a new table's stCreate.
      for LField in LMappedTable.Fields do
      begin
        LPhysicalField := FindPhysicalField(LPhysicalTable, LField.FieldName);
        if LPhysicalField = nil then
        begin
          LField.Status := stCreate;
          LMappedTable.Status := stUpdate;
          APlan.AddCreateField(LMappedTable, LField);
        end
        else
        begin
          LChanges := FContext.SqlGenerator.Compare_Field(LField, LPhysicalField);
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
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LIndex, LPhysicalIndex: IioDBBuilderSchemaIndex;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := FindTableByName(APhysicalSchema, LMappedTable.Name);
    for LIndex in LMappedTable.Indexes.Values do
    begin
      if LPhysicalTable = nil then
        LPhysicalIndex := nil
      else
        LPhysicalIndex := FindPhysicalIndex(LMappedTable, LIndex, LPhysicalTable);
      if LPhysicalIndex = nil then
      begin
        LIndex.Status := stCreate;
        LMappedTable.Status := stUpdate;  // monotonic: harmless on a brand-new (stCreate) table
        APlan.AddCreateIndex(LMappedTable, LIndex);
      end
      else if FContext.SqlGenerator.Compare_Index(LIndex, LPhysicalIndex) <> [] then
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
  const AMappedSchema, APhysicalSchema: IioDBBuilderSchema);
var
  LMappedTable, LPhysicalTable: IioDBBuilderSchemaTable;
  LFK, LPhysicalFK: IioDBBuilderSchemaFK;
begin
  for LMappedTable in AMappedSchema.Tables.Values do
  begin
    LPhysicalTable := FindTableByName(APhysicalSchema, LMappedTable.Name);
    for LFK in LMappedTable.ForeignKeys.Values do
    begin
      if LPhysicalTable = nil then
        LPhysicalFK := nil
      else
        LPhysicalFK := FindPhysicalFK(LFK, LPhysicalTable);
      if LPhysicalFK = nil then
      begin
        LFK.Status := stCreate;
        LMappedTable.Status := stUpdate;  // monotonic: harmless on a brand-new (stCreate) table
        APlan.AddCreateForeignKey(LMappedTable, LFK);
      end
      else if ForeignKeyModified(LFK, LPhysicalFK) then
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
    if FindTableByName(AMappedSchema, LPhysicalTable.Name) = nil then
    begin
      LPhysicalTable.Status := stDrop;
      APlan.AddDropTable(LPhysicalTable);
    end;
end;

end.
