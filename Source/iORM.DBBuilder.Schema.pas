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
unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Schema.Base;

type

  /// <summary>
  ///  The root of a schema branch (Mapped or Physical): a pure data structure that owns its tables and
  ///  sequences and the invariants on them (no duplicates - every Add* raises on one - and the case policy
  ///  documented on FindTable). It
  ///  never builds a node itself - the Mapped nodes are built by the SchemaBuilder (ORM-aware), the
  ///  Physical ones by the Introspector (catalog-aware) - so it depends on neither the ORM nor the DB.
  /// </summary>
  TioDBBuilderSchema = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchema)
  private
    FSequences: TioDBBuilderSchemaSequences;
    FTables: TioDBBuilderSchemaTables;

    procedure AddSequence(const ASequence: IioDBBuilderSchemaSequence);
    procedure AddTable(const ATable: IioDBBuilderSchemaTable);
    function FindSequence(const ASequenceName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaSequence;
    function FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
    procedure ForceCreateStatus;
    function GetSequences: TioDBBuilderSchemaSequences;
    function GetTables: TioDBBuilderSchemaTables;
  protected
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils;

{ TioDBBuilderSchema }

// Inserts an already-built sequence node, keyed by its already-case-normalized Name (case-sensitive like
// FTables, see FindTable). Raises on a duplicate, like AddTable: the SchemaBuilder looks a shared sequence
// up before adding it, and on the Physical branch a duplicate can only mean two catalog generators that
// normalize to the same Name (e.g. a quoted lower-case one next to an unquoted one) - surfaced, not hidden.
procedure TioDBBuilderSchema.AddSequence(const ASequence: IioDBBuilderSchemaSequence);
begin
  if FSequences.ContainsKey(ASequence.Name) then
    raise EioDBBuilderException.Create(ClassName, 'AddSequence', Format('SchemaSequence "%s" already exists.', [ASequence.Name]));
  FSequences.Add(ASequence.Name, ASequence);
end;

// Inserts an already-built table node into the schema, keyed by its Name, taken as-is. Raises if a table
// with the same name is already present: the catalog never lists duplicates, and the SchemaBuilder only
// adds after its own FindTable miss.
procedure TioDBBuilderSchema.AddTable(const ATable: IioDBBuilderSchemaTable);
begin
  if FTables.ContainsKey(ATable.Name) then
    raise EioDBBuilderException.Create(ClassName, 'AddTable', Format('SchemaTable "%s" already exists.', [ATable.Name]));
  FTables.Add(ATable.Name, ATable);
end;

constructor TioDBBuilderSchema.Create;
begin
  inherited Create;
  FSequences := TioDBBuilderSchemaSequences.Create;
  FTables := TioDBBuilderSchemaTables.Create;
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FTables.Free;
  FSequences.Free;
  inherited;
end;

// Exact-match O(1) registry lookup: the dictionary is keyed by the table's already-case-normalized Name,
// so a direct hit is authoritative. Two deliberate NON-choices, kept together on purpose (2026-08-29):
//  (1) No dedicated boolean "TableExists" API - the existence-check idiom is FindTable(AName, False) <> nil.
//  (2) This stays case-SENSITIVE. The case-insensitive reconciliation safety net deliberately lives on the
//      PlanBuilder side (the private Find_TableByName behind Match_PhysicalTable/Match_MappedTable), where
//      a physical DB name can have drifted in case (hand-written DDL, another tool, an older app
//      version). Making this lookup or the dictionary case-insensitive
//      would be wrong on SQLite, whose table names ARE case-sensitive (names differing only in case are
//      legal and distinct -> a CI dictionary would collide and trip AddTable's duplicate guard).
function TioDBBuilderSchema.FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
begin
  if FTables.ContainsKey(ATableName) then
    Result := FTables.Items[ATableName]
  else
  begin
    if ARaiseIfNotFound then
      raise EioDBBuilderException.Create(ClassName, 'FindTable', Format('SchemaTable not found "%s".', [ATableName]))
    else
      Result := nil;
  end;
end;

// Same contract and case policy as FindTable (exact match on the already-case-normalized Name): both
// branches build their sequence nodes through the same normalization, so no case-insensitive safety net
// is needed here.
function TioDBBuilderSchema.FindSequence(const ASequenceName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaSequence;
begin
  if FSequences.ContainsKey(ASequenceName) then
    Result := FSequences.Items[ASequenceName]
  else
  begin
    if ARaiseIfNotFound then
      raise EioDBBuilderException.Create(ClassName, 'FindSequence', Format('SchemaSequence not found "%s".', [ASequenceName]))
    else
      Result := nil;
  end;
end;

// The create-from-scratch path (as when the target database does not exist): forces the whole schema tree to
// stCreate so GenerateScript emits a coherent full "create from scratch" script regardless of the
// actual database state. For documentation/baseline only. Delegates the per-table cascade (fields,
// indexes, FKs) to each SchemaTable instead of reaching into its internal composition from here.
// Sequences are leaf nodes owned by the schema itself, so they are stamped directly.
procedure TioDBBuilderSchema.ForceCreateStatus;
var
  LSequence: IioDBBuilderSchemaSequence;
  LTable: IioDBBuilderSchemaTable;
begin
  Status := stCreate;
  for LSequence in FSequences.Values do
    LSequence.Status := stCreate;
  for LTable in FTables.Values do
    LTable.ForceCreateStatus;
end;

function TioDBBuilderSchema.GetSequences: TioDBBuilderSchemaSequences;
begin
  Result := FSequences;
end;

function TioDBBuilderSchema.GetTables: TioDBBuilderSchemaTables;
begin
  Result := FTables;
end;

end.
