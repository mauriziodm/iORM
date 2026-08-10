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
  iORM.DBBuilder.Interfaces, iORM.Context.Map.Interfaces;

type

  TioDBBuilderSchemaBuilder = class(TInterfacedObject, IioDBBuilderSchemaBuilder)
  private
    FConnectionDefName: string;
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    procedure BuildSchemaFK(const AMap: IioMap);
    procedure BuildSchemaIndexes(const ASchemaTable: IioDBBuilderSchemaTable; const AMap: IioMap);
    procedure BuildSchemaTable(const AMap: IioMap);
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema;
      const ASqlGenerator: IioDBBuilderSqlGenerator);
    procedure BuildSchema;
  end;

implementation

uses
  iORM.Context.Container, iORM.Context.Properties.Interfaces, iORM.Attributes, iORM.DBBuilder.Factory,
  iORM.Resolver.Factory, iORM.Resolver.Interfaces, iORM.Exceptions, System.SysUtils, iORM.CommonTypes;

{ TioDBBuilderSchemaBuilder }

procedure TioDBBuilderSchemaBuilder.BuildSchema;
var
  LMapSlot: TioMapSlot;
begin
  // Loop for all entities and build table list
  for LMapSlot in TioMapContainer.GetContainer.Values do
    BuildSchemaTable(LMapSlot.GetMap);
  // Loop for all entities and build FK list.
  // Skipped entirely when FK management is disabled: with ifmDisabled no FK DDL is ever generated,
  // so building the SchemaFK objects would only waste analyzer catalog queries (AnalyzeForeignKeys)
  // and could mark tables as stUpdate for FK-only differences that will never be applied.
  if FSchema.ForeignKeysMode <> ifmDisabled then
    for LMapSlot in TioMapContainer.GetContainer.Values do
      BuildSchemaFK(LMapSlot.GetMap);
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
  if AMap.GetTable.IsNotPersistedEntity or not AMap.GetTable.IsForThisConnection(FConnectionDefName) then
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
      if LResolvedChildTypeMap.GetTable.IsNotPersistedEntity or not LResolvedChildTypeMap.GetTable.IsForThisConnection(FConnectionDefName) then
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
  if FSchema.IndexesMode = ifmDisabled then
    Exit;
  // If some explicit index is present then add it to the list
  if AMap.GetTable.IndexListExists then
    for LIndexAttr in AMap.GetTable.GetIndexList(False) do
      ASchemaTable.AddIndex(LIndexAttr);
end;

procedure TioDBBuilderSchemaBuilder.BuildSchemaTable(const AMap: IioMap);
var
  LSchemaTable: IioDBBuilderSchemaTable;
  LProperty: IioProperty;
  LKeyGenStrategy: TioKeyGenerationStrategyType;
begin
  // Check if the class/table must be skipped or not
  if AMap.GetTable.IsNotPersistedEntity or not AMap.GetTable.IsForThisConnection(FConnectionDefName) then
    Exit;
  // Resolve the key generation strategy: if the map declares kgsAuto, the SqlGenerator translates it
  // into the concrete DBMS-specific strategy (e.g. Autoincrement for SQLite, Identity/Sequence for
  // Firebird 3+, etc.). The resolved strategy is then handed to the (data-only) schema.
  LKeyGenStrategy := FSqlGenerator.Resolve_KeyGenerationStrategy(AMap.GetTable.GetKeyGenerationStrategy);
  // Build or get the SchemaTable
  LSchemaTable := FSchema.FindOrCreateTable(AMap, LKeyGenStrategy);
  // Add fields
  for LProperty in AMap.GetProperties do
    if not (LProperty.IsTransient or (LProperty.GetRelationType = rtHasMany) or (LProperty.GetRelationType = rtHasOne)) then
      LSchemaTable.AddField(TioDBBuilderFactory.NewSchemaField(LProperty));
  // Add the ClassInfo field if necessary
  if LSchemaTable.IsTrueClass then
    LSchemaTable.AddField(TioDBBuilderFactory.NewSchemaFieldClassInfo(FConnectionDefName));
  // Add indexes
  BuildSchemaIndexes(LSchemaTable, AMap);
  // Add sequence only if the table uses Sequence for key generation
  if LSchemaTable.UsesSequenceForKeyGeneration then
    FSchema.SequenceAddIfNotExists(LSchemaTable.GetSequenceName);
end;

constructor TioDBBuilderSchemaBuilder.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema;
  const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
end;

end.
