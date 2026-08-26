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
unit iORM.DBBuilder.PlanBuilder.Base;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  /// <summary>
  ///  Segregates the Context reference: FContext is strict private to this class alone, so none of
  ///  TioDBBuilderPlanBuilderBase's own methods (present or future) can touch the raw field - only via
  ///  the Context property. strict private (not plain private) because plain private in Delphi is
  ///  unit-scoped: if this class ever shared a unit with another class, that class would still see
  ///  FContext/GetContext directly, defeating the point of the split.
  /// </summary>
  TioDBBuilderPlanBuilderSegregation = class(TInterfacedObject)
  strict private
    FContext: IioDBBuilderContext;

    function GetContext: IioDBBuilderContext;
  strict protected
    property Context: IioDBBuilderContext read GetContext;
  public
    constructor Create(const AContext: IioDBBuilderContext);
  end;

  /// <summary>
  ///  Abstract base of the PlanBuilder family: it holds the diff PRIMITIVES shared by both build shapes
  ///  (the cross-branch Find_* lookups and the Check_ForeignKeyModified structural comparison) plus the
  ///  Context plumbing, and declares the single IioDBBuilderPlanBuilder entry point Build as abstract.
  ///  It never instantiates: the Factory picks a concrete shape by the DBMS capability
  ///  SqlGenerator.Supports_AlterTable, mirroring the WithAlterTable/WithoutAlterTable Strategy split -
  ///    * TioDBBuilderPlanBuilderWithAlterTable (True: Firebird, MS SQL Server) emits fine-grained ops;
  ///    * TioDBBuilderPlanBuilderWithoutAlterTable (False: SQLite) emits the rename-create-copy rebuild ops.
  ///  Every genuinely dialect-specific decision lives elsewhere - catalog reading in the Introspector,
  ///  type/index comparison and name computation in the SqlGenerator - so these classes only orchestrate.
  ///  They are the sole writers of the nodes' Status. They read only the two in-memory schemas plus the
  ///  SqlGenerator, never the database, so they are testable without a live connection.
  /// </summary>
  TioDBBuilderPlanBuilderBase = class(TioDBBuilderPlanBuilderSegregation, IioDBBuilderPlanBuilder)
  private
  protected
    // The single entry point (IioDBBuilderPlanBuilder), implemented by each concrete build shape.
    function Build: IioDBBuilderPlan; virtual; abstract;
    // Whether a matched foreign key differs. Compares the FULL structure (dependent table+field, reference
    // table+field, on-delete/on-update actions) rather than only the attributes that can still differ: it
    // keeps the method self-contained and correct even if Match_PhysicalForeignKey's match key changes. The
    // redundant checks (dependent field + reference table are already equal by the match; dependent table
    // is the same matched table) are simply always false. Generic across dialects (both branches carry the
    // structural fields). NB: a change to the DEPENDENT FIELD is not detected here anyway - Match_PhysicalForeignKey
    // would not match, so the mapped FK becomes new and the old physical one an orphan (dropped only in strict).
    function Check_ForeignKeyModified(const AMappedFK, APhysicalFK: IioDBBuilderSchemaFK): Boolean;
    // Cross-branch structural matchers: unlike a plain name lookup (see IioDBBuilderSchemaTable.FindField),
    // these compute the physical counterpart of a mapped FK/index from attributes OTHER than a shared name
    // key, because no such key exists (this is not "does a foreign key/index with this name exist").
    // Match_PhysicalForeignKey compares structural attributes (dependent field + reference table);
    // Match_PhysicalIndex first translates the mapped index to the catalog name it WOULD have (dialect
    // rule), then looks that up. Matching is case-insensitive (SameText): both branches
    // normalize identifiers via the same SqlDataConverter, so the keys already align - the case-insensitivity
    // is just belt-and-suspenders (and mirrors SQLite's native case-insensitive identifier matching). Each
    // returns the physical node, or nil = absent.
    function Match_PhysicalForeignKey(const AMappedFK: IioDBBuilderSchemaFK;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK;
    function Match_PhysicalIndex(const AMappedTable: IioDBBuilderSchemaTable; const AMappedIndex: IioDBBuilderSchemaIndex;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaIndex;
    function Find_TableByName(const ASchema: IioDBBuilderSchema; const AName: String): IioDBBuilderSchemaTable;
    // Warns (never drops, never blocks, never touches Status or the Plan) when a foreign key on a
    // still-mapped table references AReferenceTableName (and, if given, AReferenceFieldName) - a
    // table/field about to be orphaned. AReferenceFieldName empty means "any field of
    // AReferenceTableName" (whole-table orphan); non-empty narrows to that field (field orphan).
    // Shared by both build shapes: each already surfaces its own warning about why the table/field is
    // going away (a commented-out DROP for WithAlterTable, silent data loss on rebuild for
    // WithoutAlterTable) - this adds the cross-table consequence a same-table warning cannot see. Scans
    // only AMappedSchema, since an already-orphaned table has no need for a second warning about itself.
    procedure Warn_DanglingForeignKeys(const AMappedSchema: IioDBBuilderSchema; const AReferenceTableName, AReferenceFieldName: String);
  public
  end;

implementation

uses
  System.SysUtils, iORM.Attributes, iORM.Exceptions;

{ TioDBBuilderPlanBuilderSegregation }

constructor TioDBBuilderPlanBuilderSegregation.Create(const AContext: IioDBBuilderContext);
begin
  inherited Create;

  if not Assigned(AContext) then
    raise EioInvalidArgumentException.Create(ClassName, 'Create', 'AContext is not assigned.');

  FContext := AContext;
end;

function TioDBBuilderPlanBuilderSegregation.GetContext: IioDBBuilderContext;
begin
  Result := FContext;
end;

{ TioDBBuilderPlanBuilderBase }

function TioDBBuilderPlanBuilderBase.Check_ForeignKeyModified(const AMappedFK, APhysicalFK: IioDBBuilderSchemaFK): Boolean;
begin
  // Full structural comparison (see the declaration note): self-contained, no reliance on the match key.
  Result := (not SameText(AMappedFK.DependentTableName, APhysicalFK.DependentTableName))
    or (not SameText(AMappedFK.DependentFieldName, APhysicalFK.DependentFieldName))
    or (not SameText(AMappedFK.ReferenceTableName, APhysicalFK.ReferenceTableName))
    or (not SameText(AMappedFK.ReferenceFieldName, APhysicalFK.ReferenceFieldName))
    or (AMappedFK.OnDeleteAction <> APhysicalFK.OnDeleteAction)
    or (AMappedFK.OnUpdateAction <> APhysicalFK.OnUpdateAction);
end;

function TioDBBuilderPlanBuilderBase.Match_PhysicalForeignKey(const AMappedFK: IioDBBuilderSchemaFK;
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

function TioDBBuilderPlanBuilderBase.Match_PhysicalIndex(const AMappedTable: IioDBBuilderSchemaTable;
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

function TioDBBuilderPlanBuilderBase.Find_TableByName(const ASchema: IioDBBuilderSchema;
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

procedure TioDBBuilderPlanBuilderBase.Warn_DanglingForeignKeys(const AMappedSchema: IioDBBuilderSchema;
  const AReferenceTableName, AReferenceFieldName: String);
var
  LTable: IioDBBuilderSchemaTable;
  LFK: IioDBBuilderSchemaFK;
begin
  for LTable in AMappedSchema.Tables.Values do
    for LFK in LTable.ForeignKeys.Values do
      if SameText(LFK.ReferenceTableName, AReferenceTableName)
        and (AReferenceFieldName.IsEmpty or SameText(LFK.ReferenceFieldName, AReferenceFieldName)) then
        Context.Script.Warnings.AddLine(Format('Foreign key ''%s'' on table ''%s'' references ''%s'', which will be orphaned: ' +
          'this FK will become invalid if the drop is applied. Review the mapping.', [LFK.Name, LTable.Name, AReferenceTableName]));
end;

end.
