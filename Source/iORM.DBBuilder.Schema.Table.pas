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
unit iORM.DBBuilder.Schema.Table;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Schema.Base, iORM.Context.Table.Interfaces, iORM.Context.Map.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.Attributes, iORM.CommonTypes;

type

  /// <summary>
  ///  A table node of either branch of the schema diff. One class, one shape, two constructors:
  ///  CreateMapped populates it from the ORM map at schema-build time, CreatePhysical from the DB
  ///  catalog at introspect time. Name/SqlName/ContextClassName are frozen to plain values at
  ///  construction (not lazy getters onto a live IioTable) so nothing outside this unit ever reaches
  ///  into the ORM object - SqlGenerator and PlanBuilder only ever see values. The ORM-only members
  ///  (AddForeignKey/AddIndex with map-shaped args, key-generation family, IsTrueClass) are only ever
  ///  exercised on a Mapped-built instance: the Introspector populates ForeignKeys/Indexes directly via
  ///  their collections and never calls them, so no guard against calling them on a Physical-built
  ///  instance is needed - nothing in the codebase does.
  /// </summary>
  TioDBBuilderSchemaTable = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaTable)
  private
    FContextClassName: String;
    FContextTable: IioTable;
    FFields: TioDBBuilderSchemaFields;
    FForeignKeys: TioDBBuilderSchemaForeignKeys;
    FIndexes: TioDBBuilderSchemaIndexes;
    FIsTrueClass: Boolean;
    FKeyGenerationStrategy: TioKeyGenerationStrategyType;
    FName: String;
    FPrimaryKeyField: IioDBBuilderSchemaField;
    FSqlName: String;
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    procedure CascadeFieldDropStatus(const AFieldName: String);
    procedure CascadeTableDropStatus;
    procedure EscalateFieldStatus(const AField: IioDBBuilderSchemaField; const AStatus: TioDBBuilderStatus);
    procedure EscalateForeignKeyStatus(const AFK: IioDBBuilderSchemaFK; const AStatus: TioDBBuilderStatus);
    procedure EscalateIndexStatus(const AIndex: IioDBBuilderSchemaIndex; const AStatus: TioDBBuilderStatus);
    function FieldExists(const AFieldName: String): boolean;
    function FindField(const AFieldName: String): IioDBBuilderSchemaField;
    procedure ForceCreateStatus;
    procedure ForceFieldsCreateStatus;
    procedure ForceForeignKeysCreateStatus;
    procedure ForceIndexesCreateStatus;
    function GetContextClassName: String;
    function GetFields: TioDBBuilderSchemaFields;
    function GetForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetIndexes: TioDBBuilderSchemaIndexes;
    function GetIsTrueClass: Boolean;
    function GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetName: String;
    function GetPrimaryKeyField: IioDBBuilderSchemaField;
    function GetRequestedKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetSequenceName: String;
    function GetSqlName: String;
    function HasFieldChanges: Boolean;
    function IsKeyGenerationStrategyFallback: Boolean;
    procedure SetIsTrueClass(const AValue: Boolean);
    function UsesIdentityForKeyGeneration: Boolean;
    function UsesSequenceForKeyGeneration: Boolean;
  protected
  public
    // Mapped branch: built from the ORM map at schema-build time. Name/SqlName/ContextClassName are
    // frozen from AContextTable here; ForeignKeys/Indexes are populated afterwards via AddForeignKey/
    // AddIndex (map-shaped args), Fields via AddField.
    constructor CreateMapped(const AContextTable: IioTable; const AKeyGenerationStrategy: TioKeyGenerationStrategyType);
    // Physical branch: built from the DB catalog at introspect time. No ORM class behind it - the
    // ORM-only members (ContextClassName, key-generation family, IsTrueClass) stay at their type
    // default (empty/False/Low). Fields/ForeignKeys/Indexes are populated afterwards by the
    // Introspector, straight into the exposed collections for ForeignKeys/Indexes and via AddField
    // for Fields (also used by the Mapped branch, and it tracks the primary-key field).
    constructor CreatePhysical(const AConnectionDefName, AName: String);
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils, iORM.DBBuilder.Factory, iORM.Exceptions, iORM.DB.Factory;

{ TioDBBuilderSchemaTable }

procedure TioDBBuilderSchemaTable.AddField(ASchemaField: IioDBBuilderSchemaField);
begin
  // Add field only if not already exists; keep the primary-key pointer bound to a
  // field that is actually in FFields (a discarded duplicate must not hijack it)
  if not FieldExists(ASchemaField.FieldName) then
  begin
    FFields.Add(ASchemaField);
    if ASchemaField.PrimaryKey then
      FPrimaryKeyField := ASchemaField;
  end;
end;

constructor TioDBBuilderSchemaTable.CreateMapped(const AContextTable: IioTable;
  const AKeyGenerationStrategy: TioKeyGenerationStrategyType);
begin
  inherited Create;
  FContextTable := AContextTable;
  FContextClassName := AContextTable.GetClassName;
  FIsTrueClass := AContextTable.IsTrueClass;
  FKeyGenerationStrategy := AKeyGenerationStrategy;
  FName := AContextTable.TableName;  // Case normalized, no delimiters
  FSqlName := AContextTable.GetSql;  // Case normalized + delimiters
  FFields := TioDBBuilderSchemaFields.Create;
  FForeignKeys := TioDBBuilderSchemaForeignKeys.Create;
  FIndexes := TioDBBuilderSchemaIndexes.Create;
end;

constructor TioDBBuilderSchemaTable.CreatePhysical(const AConnectionDefName, AName: String);
begin
  inherited Create;
  FName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AName, False);
  FSqlName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AName, True);
  FFields := TioDBBuilderSchemaFields.Create;
  FForeignKeys := TioDBBuilderSchemaForeignKeys.Create;
  FIndexes := TioDBBuilderSchemaIndexes.Create;
end;

destructor TioDBBuilderSchemaTable.Destroy;
begin
  FFields.Free;
  FForeignKeys.Free;
  FIndexes.Free;
  inherited;
end;

function TioDBBuilderSchemaTable.FieldExists(const AFieldName: String): boolean;
begin
  Result := FindField(AFieldName) <> nil;
end;

// Case-insensitive: field names are normalized identifiers.
function TioDBBuilderSchemaTable.FindField(const AFieldName: String): IioDBBuilderSchemaField;
var
  LField: IioDBBuilderSchemaField;
begin
  Result := nil;
  for LField in FFields do
    if SameText(LField.FieldName, AFieldName) then
      Exit(LField);
end;

function TioDBBuilderSchemaTable.HasFieldChanges: Boolean;
var
  LField: IioDBBuilderSchemaField;
begin
  // Field Status is the single source of truth for "does this table need an ALTER for its fields":
  // any field marked stCreate/stUpdate (by the analyzer or by a Force* path) counts.
  for LField in FFields do
    if LField.Status > stClean then
      Exit(True);
  Result := False;
end;

function TioDBBuilderSchemaTable.GetFields: TioDBBuilderSchemaFields;
begin
  Result := FFields;
end;

procedure TioDBBuilderSchemaTable.AddIndex(const AIndexAttr: ioIndex);
var
  LKey: String;
begin
  // The dictionary key must uniquely identify the index. For explicitly named indexes the name is
  // the identity. Auto-named indexes (ioIndex overloads without a name) all have an empty Name, so
  // keying by name would collapse every auto-named index of the table onto the '' key and silently
  // drop all but the first: fall back to the index signature (fields + orientation + unique) in that
  // case, so distinct auto-named indexes are all kept.
  if AIndexAttr.Name.IsEmpty then
    LKey := Format('%s|%d|%d', [AIndexAttr.CommaSepFieldList, Ord(AIndexAttr.Orientation), Ord(AIndexAttr.Unique)])
  else
    LKey := AIndexAttr.Name;
  // Add index if not already present
  if not FIndexes.ContainsKey(LKey) then
    FIndexes.Add(LKey, TioDBBuilderFactory.NewSchemaIndex(AIndexAttr, FContextTable.GetTableConnectionName));
end;

procedure TioDBBuilderSchemaTable.AddForeignKey(const AReferenceMap, ADependentMap: IioMap;
  const ADependentProperty: IioProperty; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  // Add tne FK if not already exists
  LForeignKey := TioDBBuilderFactory.NewSchemaFK_Mapped(AReferenceMap, ADependentMap, ADependentProperty, AOnDeleteAction, AOnUpdateAction);
  if not FForeignKeys.ContainsKey(LForeignKey.Name) then
    FForeignKeys.Add(LForeignKey.Name, LForeignKey);
end;

function TioDBBuilderSchemaTable.GetForeignKeys: TioDBBuilderSchemaForeignKeys;
begin
  Result := FForeignKeys;
end;

function TioDBBuilderSchemaTable.GetIndexes: TioDBBuilderSchemaIndexes;
begin
  Result := FIndexes;
end;

procedure TioDBBuilderSchemaTable.ForceFieldsCreateStatus;
var
  LField: IioDBBuilderSchemaField;
begin
  for LField in FFields do
    LField.Status := stCreate;
end;

procedure TioDBBuilderSchemaTable.ForceIndexesCreateStatus;
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LIndex in FIndexes.Values do
    LIndex.Status := stCreate;
end;

procedure TioDBBuilderSchemaTable.ForceForeignKeysCreateStatus;
var
  LFK: IioDBBuilderSchemaFK;
begin
  for LFK in FForeignKeys.Values do
    LFK.Status := stCreate;
end;

// Forces this table, its fields, its indexes and its foreign keys to stCreate, overriding whatever
// the entity-map-vs-DB comparison would have produced. Delegates each part instead of duplicating
// the collection loops, so the single-collection logic stays in one place.
procedure TioDBBuilderSchemaTable.ForceCreateStatus;
begin
  Status := stCreate;
  ForceFieldsCreateStatus;
  ForceIndexesCreateStatus;
  ForceForeignKeysCreateStatus;
end;

// Propagates stDrop to this table and its own fields, indexes and foreign keys (the FKs where this
// table is the dependent/owning side), keeping the informational Status tree consistent when the
// PlanBuilder finds this table orphaned (present in the DB, absent from the ORM maps). Does NOT reach
// foreign keys owned by OTHER tables that merely reference this one - that is a cross-table concern
// (a graph edge, not a possession relationship) the PlanBuilder does not resolve yet.
procedure TioDBBuilderSchemaTable.CascadeTableDropStatus;
var
  LField: IioDBBuilderSchemaField;
  LIndex: IioDBBuilderSchemaIndex;
  LFK: IioDBBuilderSchemaFK;
begin
  Status := stDrop;
  for LField in FFields do
    LField.Status := stDrop;
  for LIndex in FIndexes.Values do
    LIndex.Status := stDrop;
  for LFK in FForeignKeys.Values do
    LFK.Status := stDrop;
end;

// Propagates stDrop to this table's own indexes and foreign keys that reference AFieldName by name
// (index CommaSepFieldList, FK DependentFieldName), keeping the informational Status tree consistent
// when the PlanBuilder finds AFieldName orphaned. Does not set AFieldName's own field Status - the
// caller already holds that field and sets it directly. Same cross-table limitation as
// CascadeTableDropStatus: a foreign key of another table that references AFieldName as its
// ReferenceFieldName is not reached from here.
procedure TioDBBuilderSchemaTable.CascadeFieldDropStatus(const AFieldName: String);
var
  LIndex: IioDBBuilderSchemaIndex;
  LIndexField: String;
  LFK: IioDBBuilderSchemaFK;
begin
  for LIndex in FIndexes.Values do
    for LIndexField in LIndex.CommaSepFieldList.Split([',']) do
      if SameText(LIndexField.Trim, AFieldName) then
      begin
        LIndex.Status := stDrop;
        Break;
      end;
  for LFK in FForeignKeys.Values do
    if SameText(LFK.DependentFieldName, AFieldName) then
      LFK.Status := stDrop;
end;

// Reverse direction of CascadeFieldDropStatus/CascadeTableDropStatus (parent-to-children): a child's
// own change escalates this table's Status. Status is monotonic (TioDBBuilderSchemaBaseObject), so
// escalating an already stCreate table (brand-new) to stUpdate here is a harmless no-op.
procedure TioDBBuilderSchemaTable.EscalateFieldStatus(const AField: IioDBBuilderSchemaField; const AStatus: TioDBBuilderStatus);
begin
  AField.Status := AStatus;
  Status := stUpdate;
end;

procedure TioDBBuilderSchemaTable.EscalateForeignKeyStatus(const AFK: IioDBBuilderSchemaFK; const AStatus: TioDBBuilderStatus);
begin
  AFK.Status := AStatus;
  Status := stUpdate;
end;

procedure TioDBBuilderSchemaTable.EscalateIndexStatus(const AIndex: IioDBBuilderSchemaIndex; const AStatus: TioDBBuilderStatus);
begin
  AIndex.Status := AStatus;
  Status := stUpdate;
end;

function TioDBBuilderSchemaTable.GetPrimaryKeyField: IioDBBuilderSchemaField;
begin
  Result := FPrimaryKeyField;
end;

function TioDBBuilderSchemaTable.GetName: String;
begin
  Result := FName;
end;

function TioDBBuilderSchemaTable.GetSqlName: String;
begin
  Result := FSqlName;
end;

function TioDBBuilderSchemaTable.GetContextClassName: String;
begin
  Result := FContextClassName;
end;

function TioDBBuilderSchemaTable.GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
begin
  Result := FKeyGenerationStrategy;
end;

function TioDBBuilderSchemaTable.GetIsTrueClass: Boolean;
begin
  Result := FIsTrueClass;
end;

function TioDBBuilderSchemaTable.GetSequenceName: String;
begin
  if not UsesSequenceForKeyGeneration then
    raise EioDBBuilderException.Create(ClassName, 'GetSequenceName',
      Format('Table "%s" uses Identity for key generation, not Sequence.', [GetName]));
  Result := FContextTable.GetKeyGenerator;
end;

// --- Key generation strategy query methods ---
// These methods query the *resolved* strategy (FKeyGenerationStrategy) which was determined
// by Resolve_KeyGenerationStrategy at schema build time. The resolution applies fallback logic:
// if the entity requests a strategy unsupported by this DBMS, the DBMS default is used instead.
// Therefore UsesSequenceForKeyGeneration/UsesIdentityForKeyGeneration always reflect what will
// actually be generated in the DDL, not necessarily what the entity attribute originally requested.
function TioDBBuilderSchemaTable.UsesSequenceForKeyGeneration: Boolean;
begin
  Result := GetKeyGenerationStrategy = kgsSequence;
end;

function TioDBBuilderSchemaTable.UsesIdentityForKeyGeneration: Boolean;
begin
  Result := GetKeyGenerationStrategy = kgsIdentity;
end;

// The strategy the entity originally requested, before Resolve_KeyGenerationStrategy applied
// any DBMS-specific fallback. Notification/diagnostic code must read THIS (not the resolved
// GetKeyGenerationStrategy) to reason about what the developer asked for, otherwise it looks at
// a value the resolver may have already overwritten.
function TioDBBuilderSchemaTable.GetRequestedKeyGenerationStrategy: TioKeyGenerationStrategyType;
begin
  Result := FContextTable.GetKeyGenerationStrategy;
end;

// Returns True if the entity explicitly requested a specific strategy (not kgsAuto) but the
// resolved strategy differs (i.e., fallback was applied). Used by
// SqlGenerator.Hint_KeyGenerationCompatibility to emit an informative hint to the user.
function TioDBBuilderSchemaTable.IsKeyGenerationStrategyFallback: Boolean;
begin
  Result := (GetRequestedKeyGenerationStrategy <> kgsAuto) and
            (GetRequestedKeyGenerationStrategy <> FKeyGenerationStrategy);
end;

procedure TioDBBuilderSchemaTable.SetIsTrueClass(const AValue: Boolean);
begin
  // Una volta a true rimane sempre a true
  FIsTrueClass := AValue or FIsTrueClass;
end;

end.
