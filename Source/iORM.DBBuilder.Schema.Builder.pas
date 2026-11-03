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
unit iORM.DBBuilder.Schema.Builder;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.Context.Map.Interfaces, iORM.CommonTypes;

type

  TioDBBuilderSchemaBuilder = class(TInterfacedObject, IioDBBuilderSchemaBuilder)
  private
    FConnectionDefName: string;
    FForeignKeysMode: TioDBBuilderMode;
    FIndexesMode: TioDBBuilderMode;
    FSchema: IioDBBuilderSchema;
    FScript: IioDBBuilderScript;
    FSqlGenerator: IioDBBuilderSqlGenerator;

    procedure AddOrCheckSchemaField(const ASchemaTable: IioDBBuilderSchemaTable; const ASchemaField: IioDBBuilderSchemaField;
      const AMap: IioMap);
    procedure BuildSchema;
    procedure BuildSchemaFK(const AMap: IioMap);
    procedure BuildSchemaIndexes(const ASchemaTable: IioDBBuilderSchemaTable; const AMap: IioMap);
    procedure BuildSchemaTable(const AMap: IioMap);
    function Describe_SchemaField(const ASchemaField: IioDBBuilderSchemaField): String;
    function Describe_SchemaFieldDifferences(const AExistingField, AIncomingField: IioDBBuilderSchemaField): String;
    procedure FindOrCreateSchemaSequence(const ASequenceName: String);
    function FindOrCreateSchemaTable(const AMap: IioMap; const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
    function GetSortedMaps: TArray<IioMap>;
    function IsSchemaEligible(const AMap: IioMap): Boolean;
    procedure Warning_SharedTableConflict(const AMap: IioMap; const AMessage: String);
    procedure Warning_SharedTableFieldConflict(const ASchemaTable: IioDBBuilderSchemaTable;
      const AExistingField, AIncomingField: IioDBBuilderSchemaField; const AMap: IioMap; const ADifferences: String);
    procedure Warning_SharedTableKeyGenerationConflict(const ASchemaTable: IioDBBuilderSchemaTable; const AMap: IioMap;
      const AKeyGenerationStrategy: TioKeyGenerationStrategyType);
    procedure Warning_SharedTablePrimaryKeyConflict(const ASchemaTable: IioDBBuilderSchemaTable;
      const AExistingField, AIncomingField: IioDBBuilderSchemaField; const AMap: IioMap);
  protected
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema;
      const ASqlGenerator: IioDBBuilderSqlGenerator; const AScript: IioDBBuilderScript;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderMode);
  end;

implementation

uses
  iORM.Context.Container, iORM.Context.Properties.Interfaces, iORM.Attributes, iORM.DBBuilder.Factory,
  iORM.Resolver.Factory, iORM.Resolver.Interfaces, iORM.Exceptions, iORM.Utilities, System.Classes, System.SysUtils,
  System.Generics.Collections, System.Generics.Defaults;

{ TioDBBuilderSchemaBuilder }

// Several classes mapped on one table (single-table inheritance, or unrelated classes sharing a table) may
// each declare the same column. A physical column has exactly one definition, so every class must declare it
// identically: any difference (primary-key role, type, custom type, blob subtype, length, precision, scale,
// NOT NULL, Unicode, default) is a conflict, reported by a blocking Warning. Nothing is merged or adjusted
// automatically (decision 2026-11-02, after an earlier merge of the "soft" differences was dropped): a merge
// would silently override a declared definition (e.g. widen a VARCHAR(50) to 250) and hide the drift
// between the classes. The attributes of unrelated classes have to be repeated anyway (Delphi has no way to
// share them outside inheritance), so a difference is a forgotten or misaligned attribute, and the Warning
// points to it. Same stance as EF Core, which rejects shared columns configured with different facets.
// On a conflict the existing node is kept and the incoming definition is discarded: the kept definition is
// the one of the first class in the GetSortedMaps order (alphabetical class name). That is deterministic and
// stable when unrelated classes are added, but arbitrary, acceptable only because Execute is blocked unless
// forced (Execute(True)). A discarded definition never moves the table's primary key.
// Identical definitions (the common case: TrueClass subclasses inheriting the same property) produce no
// diagnostic, and neither does a TrueClass virtual map (see Warning_SharedTableConflict). Called only for the
// first property of a map on each column: BuildSchemaTable skips silently a column the same map already
// contributed, so the comparison is always between different maps.
procedure TioDBBuilderSchemaBuilder.AddOrCheckSchemaField(const ASchemaTable: IioDBBuilderSchemaTable;
  const ASchemaField: IioDBBuilderSchemaField; const AMap: IioMap);
var
  LDifferences: String;
  LExistingField: IioDBBuilderSchemaField;
begin
  LExistingField := ASchemaTable.FindField(ASchemaField.FieldName);
  if LExistingField = nil then
  begin
    // A new column that is the primary key of its class, while another class sharing the table already
    // made a different column the primary key: AddField would move the table's primary-key pointer to it
    // and leave two primary-key nodes. Conflict: the incoming definition is discarded.
    if ASchemaField.PrimaryKey and (ASchemaTable.PrimaryKeyField <> nil) then
      Warning_SharedTablePrimaryKeyConflict(ASchemaTable, ASchemaTable.PrimaryKeyField, ASchemaField, AMap)
    else
      ASchemaTable.AddField(ASchemaField);
    Exit;
  end;
  // Primary-key role: a table-level identity, reported with its own message
  if LExistingField.PrimaryKey <> ASchemaField.PrimaryKey then
  begin
    Warning_SharedTablePrimaryKeyConflict(ASchemaTable, LExistingField, ASchemaField, AMap);
    Exit;
  end;
  // Any other difference in the column definition
  LDifferences := Describe_SchemaFieldDifferences(LExistingField, ASchemaField);
  if not LDifferences.IsEmpty then
    Warning_SharedTableFieldConflict(ASchemaTable, LExistingField, ASchemaField, AMap, LDifferences);
end;

// The single exit of the shared-table Warnings. A diagnostic triggered while visiting a TrueClass virtual map
// (TCVM_, see TioMap.BuildTrueClassVirtualMap) is deliberately NOT emitted, though the map is still checked
// and its definitions still take part in the build. A TCVM holds only copies: the progenitor's table
// (DuplicateToTrueClassMap) and the very IioProperty objects of the real maps sharing that table
// (CopyPropertiesToTrueClassVirtualMap, first wins by name). So a conflict found through it is always
// between two real definitions, and BuildSchema also visits the real map that owns the conflicting one,
// which compares it against the same node, whatever the visit order: the conflict is reported anyway, by
// a real map. Emitting it here too would only duplicate it, and attribute it to the progenitor
// (GetClassName of a TCVM), not to the class that declared the definition.
procedure TioDBBuilderSchemaBuilder.Warning_SharedTableConflict(const AMap: IioMap; const AMessage: String);
begin
  if not AMap.IsTrueClassVirtualMap then
    FScript.Warnings.AddLine(AMessage);
end;

procedure TioDBBuilderSchemaBuilder.BuildSchema;
var
  LMap: IioMap;
  LSortedMaps: TArray<IioMap>;
begin
  // Sorted once, used by both loops (see GetSortedMaps)
  LSortedMaps := GetSortedMaps;
  // Loop for all entities and build table list
  for LMap in LSortedMaps do
    BuildSchemaTable(LMap);
  // Loop for all entities and build FK list.
  // Skipped entirely when FK management is disabled: with ifmDisabled no FK DDL is ever generated,
  // so building the SchemaFK objects would only waste analyzer catalog queries (AnalyzeForeignKeys)
  // and could mark tables as stUpdate for FK-only differences that will never be applied.
  if FForeignKeysMode <> ifmDisabled then
    for LMap in LSortedMaps do
      BuildSchemaFK(LMap);
end;

procedure TioDBBuilderSchemaBuilder.BuildSchemaFK(const AMap: IioMap);
var
  LDependentMap: IioMap;
  LDependentProperty: IioProperty;
  LProperty: IioProperty;
  LReferenceMap: IioMap;
  LResolvedChildTypeList: IioResolvedTypeList;
  LResolvedChildTypeMap: IioMap;
  LResolvedChildTypeName: String;
  LSchemaTable: IioDBBuilderSchemaTable;
begin
  // Check if the class/table must be skipped or not (same guard as BuildSchemaTable)
  if not IsSchemaEligible(AMap) then
    Exit;
  for LProperty in AMap.GetProperties do
  begin
    if (LProperty.GetRelationType in [rtNone, rtEmbeddedHasOne, rtEmbeddedHasMany]) or (LProperty.GetMetadata_FKCreate = fkDoNotCreate) then
      Continue;
    // Resolve the type and alias for the relation child type
    LResolvedChildTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(LProperty.GetRelationChildTypeName,
      LProperty.GetRelationChildTypeAlias, rmAllDistinctByConnectionAndTable);
    // Loop for all classes in the resolved type list
    for LResolvedChildTypeName in LResolvedChildTypeList do
    begin
      // Get the map for the current ResolverTypeName (Child)
      LResolvedChildTypeMap := TioMapContainer.GetMap(LResolvedChildTypeName);
      // Skip the FK if the child class is a NotPersisted entity or is not for this connection:
      // a FK is created only when both classes involved live on the connection being built
      if not IsSchemaEligible(LResolvedChildTypeMap) then
        Continue;
      // The reference side is the master table of the relation, the dependent side is the table
      // holding the FK field: the current map itself for BelongsTo, the resolved child map for
      // HasMany/HasOne. The OnDelete/OnUpdate actions always come from the property being iterated.
      if LProperty.GetRelationType = rtBelongsTo then
      begin
        LReferenceMap := LResolvedChildTypeMap;
        LDependentMap := AMap;
        LDependentProperty := LProperty;
      end
      else
      begin
        LReferenceMap := AMap;
        LDependentMap := LResolvedChildTypeMap;
        LDependentProperty := LResolvedChildTypeMap.GetProperties.GetPropertyByName(LProperty.GetRelationChildPropertyName);
      end;
      // Safety belt: beyond the IsForThisConnection guards above, the FK is added only if its
      // dependent table actually made it into this connection's schema (BuildSchemaTable applies
      // the same connection filter), so a nil here silently discards the FK.
      LSchemaTable := FSchema.FindTable(LDependentMap.GetTable.TableName, False);
      if LSchemaTable <> nil then
        LSchemaTable.AddForeignKey(LReferenceMap, LDependentMap, LDependentProperty, LProperty.GetMetadata_FKOnDeleteAction,
          LProperty.GetMetadata_FKOnUpdateAction);
    end;
  end;
end;

procedure TioDBBuilderSchemaBuilder.BuildSchemaIndexes(const ASchemaTable: IioDBBuilderSchemaTable; const AMap: IioMap);
var
  LIndexAttr: ioIndex;
begin
  // Skipped entirely when index management is disabled (mirrors the FK handling in BuildSchema):
  // with ifmDisabled no index DDL is ever generated, so building the SchemaIndex objects would only
  // waste analyzer catalog queries (AnalyzeIndexes) and could mark tables as stUpdate for index-only
  // differences that will never be applied.
  if FIndexesMode = ifmDisabled then
    Exit;
  // If some explicit index is present then add it to the list
  if AMap.GetTable.IndexListExists then
    for LIndexAttr in AMap.GetTable.GetIndexList(False) do
      ASchemaTable.AddIndex(LIndexAttr);
end;

procedure TioDBBuilderSchemaBuilder.BuildSchemaTable(const AMap: IioMap);
var
  LAddedFieldNames: TStringList;
  LKeyGenStrategy: TioKeyGenerationStrategyType;
  LProperty: IioProperty;
  LSchemaField: IioDBBuilderSchemaField;
  LSchemaTable: IioDBBuilderSchemaTable;
begin
  // Check if the class/table must be skipped or not
  if not IsSchemaEligible(AMap) then
    Exit;
  // Resolve the key generation strategy: if the map declares kgsAuto, the SqlGenerator translates it
  // into the concrete DBMS-specific strategy (e.g. Autoincrement for SQLite, Identity/Sequence for
  // Firebird 3+, etc.). The resolved strategy is then handed to FindOrCreateSchemaTable, which stores it on a new node.
  LKeyGenStrategy := FSqlGenerator.Resolve_KeyGenerationStrategy(AMap.GetTable.GetKeyGenerationStrategy);
  // Build or get the SchemaTable
  LSchemaTable := FindOrCreateSchemaTable(AMap, LKeyGenStrategy);
  // Add fields (or check them against the definition of another class sharing the table - see
  // AddOrCheckSchemaField). A column this same map already contributed (two properties on one column,
  // e.g. a load-only/persist-only pair) is skipped silently, as AddField always did: classification and
  // diagnostics apply only between different maps.
  LAddedFieldNames := TStringList.Create;  // CaseSensitive = False, same rule as FindField
  try
    for LProperty in AMap.GetProperties do
      if not (LProperty.IsTransient or (LProperty.GetRelationType in [rtHasMany, rtHasOne])) then
      begin
        LSchemaField := TioDBBuilderFactory.NewSchemaField_Mapped(LProperty, FSqlGenerator);
        if LAddedFieldNames.IndexOf(LSchemaField.FieldName) = -1 then
        begin
          LAddedFieldNames.Add(LSchemaField.FieldName);
          AddOrCheckSchemaField(LSchemaTable, LSchemaField, AMap);
        end;
      end;
  finally
    LAddedFieldNames.Free;
  end;
  // Add the ClassInfo field if necessary
  if LSchemaTable.IsTrueClass then
    LSchemaTable.AddField(TioDBBuilderFactory.NewSchemaField_ClassInfo(FConnectionDefName, FSqlGenerator));
  // Add indexes
  BuildSchemaIndexes(LSchemaTable, AMap);
  // Add sequence only if the table uses Sequence for key generation
  if LSchemaTable.UsesSequenceForKeyGeneration then
    FindOrCreateSchemaSequence(LSchemaTable.GetSequenceName);
end;

// The sequence twin of FindOrCreateSchemaTable: several tables may share one sequence ([ioKeySequence]),
// just as several classes may share one table, and both kinds of sharing are an ORM concern resolved here
// (the schema's Add* raise on a duplicate). The node is built BEFORE the lookup on purpose: the name coming
// from the mapping is raw, and its normalization lives only in the TioDBBuilderSchemaSequence constructor -
// looking up LSequence.Name keeps that rule in one place. When the sequence is already there (shared), the
// fresh node is simply dropped: it carries nothing but the same name.
procedure TioDBBuilderSchemaBuilder.FindOrCreateSchemaSequence(const ASequenceName: String);
var
  LSequence: IioDBBuilderSchemaSequence;
begin
  LSequence := TioDBBuilderFactory.NewSchemaSequence(FConnectionDefName, ASequenceName);
  if FSchema.FindSequence(LSequence.Name, False) = nil then
    FSchema.AddSequence(LSequence);
end;

// "Find or create" (lazy registry) on the schema's tables, called once per mapped class: each class
// contributes its fields, indexes and foreign keys to the corresponding SchemaTable. When several classes
// share one physical table (e.g. single-table inheritance / TrueClass), the first call creates the node and
// the next ones retrieve and enrich it (a key generation mismatch between them is reported, see below).
// Lives here, not on the schema: it is ORM-aware construction (map, Factory, IsTrueClass), while the
// schema stays a pure data structure (FindTable + AddTable).
function TioDBBuilderSchemaBuilder.FindOrCreateSchemaTable(const AMap: IioMap;
  const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
begin
  Result := FSchema.FindTable(AMap.GetTable.TableName, False);
  if Result = nil then
  begin
    // AKeyGenerationStrategy is already resolved (BuildSchemaTable): if the map declared kgsAuto it has
    // been translated into the concrete DBMS-specific strategy (e.g. Autoincrement for SQLite,
    // Identity/Sequence for Firebird 3+, etc.).
    Result := TioDBBuilderFactory.NewSchemaTable_Mapped(AMap.GetTable, AKeyGenerationStrategy);
    FSchema.AddTable(Result);
  end
  // Shared table: the node keeps the key generation of the class that created it (it is frozen on the
  // node, and the sequence name is read from that class's map). A different resolved strategy, or two
  // different sequences, cannot both be honoured: the node is left unchanged and a blocking Warning is
  // emitted (no automatic decision on a hard conflict).
  else if (Result.KeyGenerationStrategy <> AKeyGenerationStrategy)
    or (Result.UsesSequenceForKeyGeneration and not SameText(Result.SequenceName, AMap.GetTable.GetKeyGenerator)) then
    Warning_SharedTableKeyGenerationConflict(Result, AMap, AKeyGenerationStrategy);
  // In single-table inheritance several classes share the table, but only the "true" class (the one owning
  // the discriminator field) has IsTrueClass = True. The setter is OR-like (once True it never goes back to
  // False), so the flag stays True if at least one of the mapped classes is the TrueClass.
  Result.IsTrueClass := AMap.GetTable.IsTrueClass;
end;

constructor TioDBBuilderSchemaBuilder.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema;
  const ASqlGenerator: IioDBBuilderSqlGenerator; const AScript: IioDBBuilderScript;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderMode);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FSchema := ASchema;
  FScript := AScript;
  FSqlGenerator := ASqlGenerator;
  FIndexesMode := AIndexesMode;
  FForeignKeysMode := AForeignKeysMode;
end;

// Human-readable column definition for the shared-table diagnostics (dialect type rendering with its
// attributes + nullability + default + primary key), e.g. "VARCHAR(50) NOT NULL DEFAULT 'X'". The type is
// rendered with the type attributes, NOT taken from FieldTypeRaw: that one is rendered without them, so a
// length-only difference would show identical definitions.
function TioDBBuilderSchemaBuilder.Describe_SchemaField(const ASchemaField: IioDBBuilderSchemaField): String;
begin
  Result := FSqlGenerator.Translate_SchemaField_To_FieldType(ASchemaField, True);  // True = include attributes
  if ASchemaField.FieldNotNull then
    Result := Result + ' NOT NULL'
  else
    Result := Result + ' NULL';
  if not ASchemaField.FieldDefaultRaw.IsEmpty then
    Result := Result + ' DEFAULT ' + ASchemaField.FieldDefaultRaw;
  if ASchemaField.PrimaryKey then
    Result := Result + ' PRIMARY KEY';
end;

// The list of the attributes in which two definitions of the same column differ (empty = identical), e.g.
// "length, NOT NULL". The primary-key role is not included: it is checked before, with its own Warning.
// It keeps the Warning actionable even when Describe_SchemaField renders both definitions alike (e.g. a
// Unicode-only difference on a dialect that does not show it in the type).
function TioDBBuilderSchemaBuilder.Describe_SchemaFieldDifferences(const AExistingField,
  AIncomingField: IioDBBuilderSchemaField): String;
var
  LDifferences: String;

  procedure AddDifference(const AAttribute: String);
  begin
    if LDifferences.IsEmpty then
      LDifferences := AAttribute
    else
      LDifferences := LDifferences + ', ' + AAttribute;
  end;

begin
  LDifferences := '';
  if (AExistingField.FieldType <> AIncomingField.FieldType)
    or not SameText(AExistingField.FieldCustomType, AIncomingField.FieldCustomType) then
    AddDifference('type');
  if not SameText(AExistingField.FieldSubtype, AIncomingField.FieldSubtype) then
    AddDifference('subtype');
  if AExistingField.FieldLength <> AIncomingField.FieldLength then
    AddDifference('length');
  if AExistingField.FieldPrecision <> AIncomingField.FieldPrecision then
    AddDifference('precision');
  if AExistingField.FieldScale <> AIncomingField.FieldScale then
    AddDifference('scale');
  if AExistingField.FieldNotNull <> AIncomingField.FieldNotNull then
    AddDifference('NOT NULL');
  if AExistingField.FieldUnicode <> AIncomingField.FieldUnicode then
    AddDifference('Unicode');
  if AExistingField.FieldDefaultRaw <> AIncomingField.FieldDefaultRaw then
    AddDifference('default');
  Result := LDifferences;
end;

// The maps in a fixed order: real maps by class name, then the TrueClass virtual maps (TCVM_). Whatever
// "the first class met" decides becomes deterministic: the definition kept on a shared-table conflict, the
// table node's ContextTable (ContextClassName, the key-generation fallback Hint), the FK kept when two
// relations produce the same FK name. The map container is a dictionary, so its own enumeration follows the
// key hashes: stable for a given set of classes, but adding an unrelated class can re-bucket it and flip
// those outcomes. Sorted here, not in the container: only the schema build needs an order (downstream,
// everything reads the schema, not the maps), and the container keeps its O(1) lookups untouched. The cost is
// one O(n log n) sort per build. The TCVMs go last because they hold copies picked first-wins in map
// registration order: visited first, one of them would create the table node from its copies, and the
// outcomes above would depend on that order again.
function TioDBBuilderSchemaBuilder.GetSortedMaps: TArray<IioMap>;
var
  LIndex: Integer;
  LMapSlot: TioMapSlot;
begin
  SetLength(Result, TioMapContainer.GetContainer.Count);
  LIndex := 0;
  for LMapSlot in TioMapContainer.GetContainer.Values do
  begin
    Result[LIndex] := LMapSlot.GetMap;
    Inc(LIndex);
  end;
  // The class names are unique (they are the container keys), so the unstable sort is deterministic
  TArray.Sort<IioMap>(Result, TComparer<IioMap>.Construct(
    function(const ALeft, ARight: IioMap): Integer
    begin
      Result := Ord(ALeft.IsTrueClassVirtualMap) - Ord(ARight.IsTrueClassVirtualMap);
      if Result = 0 then
        Result := CompareStr(ALeft.GetClassName, ARight.GetClassName);
    end));
end;

function TioDBBuilderSchemaBuilder.IsSchemaEligible(const AMap: IioMap): Boolean;
begin
  // A class/table takes part in the schema of this connection only if it is a persisted entity
  // and it is mapped for the connection being built. Shared guard used by BuildSchemaTable and
  // BuildSchemaFK (on both the current map and each resolved child map).
  Result := AMap.GetTable.IsForThisConnection(FConnectionDefName) and not AMap.GetTable.IsNotPersistedEntity;
end;

procedure TioDBBuilderSchemaBuilder.Warning_SharedTableFieldConflict(const ASchemaTable: IioDBBuilderSchemaTable;
  const AExistingField, AIncomingField: IioDBBuilderSchemaField; const AMap: IioMap; const ADifferences: String);
begin
  Warning_SharedTableConflict(AMap, Format('Table "%s", field "%s": class %s maps it as %s, but another class mapped on the same table ' +
    'maps it as %s (they differ in: %s). A column has only one definition, so all the classes mapped on a table must ' +
    'declare their shared fields identically: the definition %s has been kept and the one of class %s has been ' +
    'discarded. Align the field attributes of class %s with the other classes mapped on this table.',
    [ASchemaTable.Name, AExistingField.FieldName, AMap.GetTable.GetClassName, Describe_SchemaField(AIncomingField),
     Describe_SchemaField(AExistingField), ADifferences, Describe_SchemaField(AExistingField), AMap.GetTable.GetClassName,
     AMap.GetTable.GetClassName]));
end;

procedure TioDBBuilderSchemaBuilder.Warning_SharedTableKeyGenerationConflict(const ASchemaTable: IioDBBuilderSchemaTable;
  const AMap: IioMap; const AKeyGenerationStrategy: TioKeyGenerationStrategyType);

  function KeyGenerationToString(const AStrategy: TioKeyGenerationStrategyType; const ASequenceName: String): String;
  begin
    Result := TioUtilities.EnumToString<TioKeyGenerationStrategyType>(AStrategy);
    if AStrategy = kgsSequence then
      Result := Format('%s "%s"', [Result, ASequenceName]);
  end;

var
  LExistingSequenceName: String;
begin
  if ASchemaTable.UsesSequenceForKeyGeneration then
    LExistingSequenceName := ASchemaTable.SequenceName
  else
    LExistingSequenceName := '';
  Warning_SharedTableConflict(AMap, Format('Table "%s": class %s resolves its key generation to %s, but class %s, mapped on the ' +
    'same table, resolves it to %s. A table can have only one key generation: %s has been kept. Align the key ' +
    'generation (and the key sequence) of all the classes mapped on this table.',
    [ASchemaTable.Name, AMap.GetTable.GetClassName, KeyGenerationToString(AKeyGenerationStrategy, AMap.GetTable.GetKeyGenerator),
     ASchemaTable.ContextClassName, KeyGenerationToString(ASchemaTable.KeyGenerationStrategy, LExistingSequenceName),
     KeyGenerationToString(ASchemaTable.KeyGenerationStrategy, LExistingSequenceName)]));
end;

// Both primary-key cases share this message: the same column is the primary key in one class and a plain
// field in another (AExistingField is that column), or the incoming class makes a different column the
// primary key (AExistingField is the table's current primary-key field).
procedure TioDBBuilderSchemaBuilder.Warning_SharedTablePrimaryKeyConflict(const ASchemaTable: IioDBBuilderSchemaTable;
  const AExistingField, AIncomingField: IioDBBuilderSchemaField; const AMap: IioMap);
begin
  Warning_SharedTableConflict(AMap, Format('Table "%s": class %s maps field "%s" as %s, but another class mapped on the same table ' +
    'maps field "%s" as %s. The classes mapped on one table must agree on its primary key: field "%s" of class %s has ' +
    'been discarded (the other fields of the class are still processed) and the primary key of the table is unchanged. ' +
    'Align the primary key of all the classes mapped on this table.',
    [ASchemaTable.Name, AMap.GetTable.GetClassName, AIncomingField.FieldName, Describe_SchemaField(AIncomingField),
     AExistingField.FieldName, Describe_SchemaField(AExistingField), AIncomingField.FieldName, AMap.GetTable.GetClassName]));
end;

end.
