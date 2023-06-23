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
  iORM.DBBuilder.Interfaces, iORM.COntext.Map.Interfaces;

type

  TioDBBuilderSchemaBuilder = class(TioDBBuilderSchemaBuilderIntf)
  private
    class procedure BuildIndexList(const ASchemaTable: IioDBBuilderSchemaTable; const AMap: IioMap);
    class procedure BuildSchemaFK(const ASchema: IioDBBuilderSchema; const AMap: IioMap);
    class procedure BuildSchemaTable(const ASchema: IioDBBuilderSchema; const AMap: IioMap);
  public
    class procedure BuildSchema(const ASchema: IioDBBuilderSchema); override;
  end;

implementation

uses
  iORM.COntext.Container, iORM.COntext.Properties.Interfaces, iORM.Attributes, iORM.DBBuilder.Factory, iORM.Containers.Interfaces,
  iORM.Resolver.Factory, iORM.Resolver.Interfaces, iORM.Exceptions, System.SysUtils;

{ TioDBBuilderSchemaBuilder }

class procedure TioDBBuilderSchemaBuilder.BuildSchema(const ASchema: IioDBBuilderSchema);
var
  AContextSlot: TioMapSlot;
begin
  inherited;
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
  LProperty: IioProperty;
  LDependentProperty: IioProperty;
  LResolvedChildTypeList: IioList<string>;
  LResolvedChildTypeName: String;
  LResolvedChildTypeMap: IioMap;
  LSchemaTable: IioDBBuilderSchemaTable;
begin
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
      // If FK is between two classes mapped to two different ConnectionDefNames then skip it
      // If one of the twi classes involved in the FK is a NotPersisted entity then skip it
      if AMap.GetTable.IsNotPersistedEntity or LResolvedChildTypeMap.GetTable.IsNotPersistedEntity
      or (AMap.GetTable.GetConnectionDefName <> LResolvedChildTypeMap.GetTable.GetConnectionDefName) then
        Continue;
      if LProperty.GetRelationType in [rtBelongsTo] then
      begin
// ----------------------- ALLA FINE HO DECISO DI NON METTERLO ----------------------------------
//        if LResolvedTypeList.Count > 1 then
//          raise EioException.Create(ClassName, 'BuildSchemaFK', Format('Hi, I''m iORM.' +
//            #13#13'Trying to define the DB schema I realized that in class "%s" (mapped on table "%s", connection "%s") there is property "%s" (mapped on field "%s" on the DB) on which there is a BelongsTo relationship with the type "%s".' +
//            #13#13'The problem is that this type is mapped to more than one table and it is not possible to set referential integrity constraints to multiple tables at once, it would almost never work correctly.' +
//            #13#13'You can disable the creation of the Foreign Key for this property by decorating it with the attribute "[ioForeignKey (fkDoNotCreate)]"' +
//            'or completely disable the automatic creation of ForeignKeys for the entire database by setting the property "AutoCreateDB.ForeignKeys" to False in the ConnectionDef component.' +
//            #13#13'I hope this information can be useful to you.',
//            [AMap.GetClassName, AMap.GetTable.TableName, AMap.GetTable.GetConnectionDefName, LProperty.GetName, LProperty.GetSqlFieldName(True), LProperty.GetRelationChildTypeName]));
// ----------------------- ALLA FINE HO DECISO DI NON METTERLO ----------------------------------
        LDependentProperty := LProperty;
        LSchemaTable := ASchema.FindTable(AMap.GetTable.TableName);
        if LSchemaTable <> nil then
          LSchemaTable.AddForeignKey(LResolvedChildTypeMap, AMap, LProperty, LDependentProperty.GetMetadata_FKOnDeleteAction,
            LDependentProperty.GetMetadata_FKOnUpdateAction);
      end
      else
      begin
        LDependentProperty := LResolvedChildTypeMap.GetProperties.GetPropertyByName(LProperty.GetRelationChildPropertyName);
        LSchemaTable := ASchema.FindTable(LResolvedChildTypeMap.GetTable.TableName);
        if LSchemaTable <> nil then
          LSchemaTable.AddForeignKey(AMap, LResolvedChildTypeMap, LDependentProperty, LProperty.GetMetadata_FKOnDeleteAction,
            LProperty.GetMetadata_FKOnUpdateAction);
      end;
    end;
  end;
end;

class procedure TioDBBuilderSchemaBuilder.BuildSchemaTable(const ASchema: IioDBBuilderSchema; const AMap: IioMap);
var
  LSchemaTable: IioDBBuilderSchemaTable;
  LProperty: IioProperty;
begin
  // Check if the class/table must be skipped or not
  if AMap.GetTable.IsNotPersistedEntity or not AMap.GetTable.IsForThisConnection(ASchema.ConnectionDefName) then
    Exit;
  // Build or get the SchemaTable
  LSchemaTable := ASchema.FindOrCreateTable(AMap);
  // Add fields
  for LProperty in AMap.GetProperties do
    if not (LProperty.IsTransient or (LProperty.GetRelationType = rtHasMany) or (LProperty.GetRelationType = rtHasOne)) then
      LSchemaTable.AddField(TioDBBuilderFactory.NewSchemaField(LProperty));
  // Add the ClassInfo field if necessary
  if LSchemaTable.IsTrueClass then
    LSchemaTable.AddField(TioDBBuilderFactory.NewSchemaFieldClassInfo);
  // Add indexes
  BuildIndexList(LSchemaTable, AMap);
  // Add sequence
  ASchema.SequenceAddIfNotExists(LSchemaTable.GetSequenceName);
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
