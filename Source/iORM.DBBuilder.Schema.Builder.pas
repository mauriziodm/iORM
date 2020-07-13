unit iORM.DBBuilder.Schema.Builder;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.COntext.Map.Interfaces;

type

  TioDBBuilderSchemaBuilder = class
  private
    class procedure BuildIndexList(const ASchemaTable: IioDBBuilderSchemaTable; const AMap: IioMap);
    class procedure BuildSchemaFK(const ASchema: IioDBBuilderSchema; const AMap: IioMap);
    class procedure BuildSchemaTable(const ASchema: IioDBBuilderSchema; const AMap: IioMap);
  public
    class procedure BuildSchema(const ASchema: IioDBBuilderSchema);
  end;

implementation

uses
  iORM.COntext.Container, iORM.COntext.Properties.Interfaces, iORM.Attributes, iORM.DBBuilder.Factory, iORM.Containers.Interfaces,
  iORM.Resolver.Factory, iORM.Resolver.Interfaces;

{ TioDBBuilderSchemaBuilder }

class procedure TioDBBuilderSchemaBuilder.BuildSchema(const ASchema: IioDBBuilderSchema);
var
  AContextSlot: TioMapSlot;
begin
  // Loop for all entities and build table list
  for AContextSlot in TioMapContainer.GetContainer.Values do
    BuildSchemaTable(ASchema, AContextSlot.GetMap);
  // Loop for all entities and build FK list
  for AContextSlot in TioMapContainer.GetContainer.Values do
    BuildSchemaFK(ASchema, AContextSlot.GetMap);
end;

class procedure TioDBBuilderSchemaBuilder.BuildSchemaFK(const ASchema: IioDBBuilderSchema; const AMap: IioMap);
var
  // LSchemaTable: IioDBBuilderSchemaTable;
  LProperty: IioContextProperty;
  LResolvedTypeList: IioList<string>;
  LResolvedTypeName: String;
  LResolvedTypeMap: IioMap;
begin
  for LProperty in AMap.GetProperties do
  begin
    if LProperty.GetRelationType in [ioRTNone, ioRTEmbeddedHasOne, ioRTEmbeddedHasMany] then
      Continue;
    // Resolve the type and alias for the relation child type
    LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(LProperty.GetRelationChildTypeName,
      LProperty.GetRelationChildTypeAlias, rmAll);
    // Loop for all classes in the resolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the map for the current ResolverTypeName (Child)
      LResolvedTypeMap := TioMapContainer.GetMap(LResolvedTypeName);
      // If FK is between two classes mapped to two different ConnectionDefNames then skip it
      if AMap.GetTable.GetConnectionDefName <> LResolvedTypeMap.GetTable.GetConnectionDefName then
        Continue;
      if LProperty.GetRelationType in [ioRTBelongsTo] then
        ASchema.FindTable(AMap.GetTable.TableName).AddFK(LResolvedTypeMap, AMap, LProperty)
      else
        ASchema.FindTable(LResolvedTypeMap.GetTable.TableName).AddFK(AMap, LResolvedTypeMap,
          LResolvedTypeMap.GetProperties.GetPropertyByName(LProperty.GetRelationChildPropertyName));
    end;
  end;
end;

class procedure TioDBBuilderSchemaBuilder.BuildSchemaTable(const ASchema: IioDBBuilderSchema; const AMap: IioMap);
var
  LSchemaTable: IioDBBuilderSchemaTable;
  LProperty: IioContextProperty;
begin
  if not(AMap.GetTable.GetAutoCreateDB and AMap.GetTable.IsForThisConnection(ASchema.ConnectionDefName)) then
    Exit;
  LSchemaTable := ASchema.FindOrCreateTable(AMap);
  for LProperty in AMap.GetProperties do
  begin
    if LProperty.IsSkipped or (LProperty.GetRelationType = ioRTHasMany) or (LProperty.GetRelationType = ioRTHasOne) or
      LSchemaTable.FieldExists(LProperty.GetSqlFieldName) then
      Continue;
    LSchemaTable.AddField(TioDBBuilderFactory.NewSchemaField(LProperty));
  end;
  BuildIndexList(LSchemaTable, AMap);
end;

class procedure TioDBBuilderSchemaBuilder.BuildIndexList(const ASchemaTable: IioDBBuilderSchemaTable; const AMap: IioMap);
var
  LIndexAttr: ioIndex;
begin
  // If some explicit index is present then add it to the list
  if AMap.GetTable.IndexListExists then
    for LIndexAttr in AMap.GetTable.GetIndexList(False) do
        ASchemaTable.AddIndex(LIndexAttr);
end;

end.
