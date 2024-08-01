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
unit iORM.Context.Factory;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  iORM.Context.Table.Interfaces, System.Rtti,
  iORM.Attributes, System.Generics.Collections,
  iORM.Context.Map.Interfaces, iORM.Where.Interfaces,
  iORM.LiveBindings.BSPersistence;

type

  // Properties builder
  TioContextFactory = class
  private
    class function GetMetadata_FieldTypeByTypeKind(const ATypeKind: TTypeKind; const AQualifiedName: string): TioMetadataFieldType;
    class function Table(const Typ: TRttiInstanceType): IioTable;
    class function Properties(const Typ: TRttiInstanceType; const ATable: IioTable): IioProperties;
    class function HasManyChildVirtualProperty(const ATable: IioTable): IioProperty;
    class function TrueClass(const ATrueClassMode: TioTrueClassMode; const ASqlFieldName: String): IioTrueClass;
    class function Joins: IioJoins;
    class function JoinItem(const AJoinAttribute: ioJoin): IioJoinItem;
    class function GroupBy(const ASqlText: String): IioGroupBy;
    class function HasBelongsToRelation(const AMasterPropertyType: TRttiType): Boolean;
    class function GetProperty(const ATable: IioTable; const AMember: TRttiMember; const ATypeAlias, ASqlFieldName, ALoadSql, AFieldType: String;
      const ATransient, AIsID: Boolean; const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType;
      const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
      const AMetadata_FKOnDeleteAction: TioFKAction; const AMetadata_FKOnUpdateAction: TioFKAction): IioProperty;
  public
    class function Map(const AClassRef: TioClassRef): IioMap;
    class function Context(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere; const ADataObject: TObject;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte): IioContext;
    class function TrueClassVirtualContextIfEnabled(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere;
      const ABlindLevel: Byte): IioContext;
    class procedure GenerateAutodetectedHasManyRelationVirtualPropertyOnDetails;
  end;

implementation

uses
  iORM.Context, iORM.Context.Properties,
  System.SysUtils, iORM.Context.Table,
  iORM.RttiContext.Factory, iORM.Context.Container, iORM.Context.Map,
  System.StrUtils, iORM.Exceptions, System.TypInfo, iORM.Utilities,
  iORM.DuckTyped.Factory, iORM.Resolver.Interfaces, iORM.Resolver.Factory,
  iORM.ETM.Engine, iORM.ConflictStrategy.Interfaces;

{ TioBuilderProperties }

class function TioContextFactory.TrueClass(const ATrueClassMode: TioTrueClassMode; const ASqlFieldName: String): IioTrueClass;
begin
  // Create
  Result := TioTrueClass.Create(ATrueClassMode, ASqlFieldName);
end;

class function TioContextFactory.HasBelongsToRelation(const AMasterPropertyType: TRttiType): Boolean;
var
  AResolvedTypeList: IioResolvedTypeList;
begin
  // If the MasterProperty is of a class type (not an interface) then check if it has the "ioEntity" attribute
  if AMasterPropertyType.IsInstance then
    Result := TioUtilities.isEntityType(AMasterPropertyType)
  else
    // else if it isn't a class (so it is an interface) then use die DIC to verify if there are some
    // class (entity) registered on it
    if AMasterPropertyType is TRttiInterfaceType then
    begin
      // Resolve the type and alias (if the RelationChildTypeName is relative to a class then the resolver return the class itself)
      AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AMasterPropertyType.Name, '', rmAll, False);
      // Returns True if there is at least one resolved type that is an entity
      Result := AResolvedTypeList.Count > 0;
    end
    // else return False (not a class nor interface master property type)
    else
      Result := False;
end;

class function TioContextFactory.HasManyChildVirtualProperty(const ATable: IioTable): IioProperty;
begin
  Result := TioHasManyChildVirtualProperty.Create(ATable);
end;

class function TioContextFactory.Context(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere; const ADataObject: TObject;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte): IioContext;
begin
  // Get the Context
  Result := TioContext.Create(AIntent, TioMapContainer.GetMap(AClassName), AWhere, ADataObject, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath,
    ABlindLevel);
end;

class function TioContextFactory.TrueClassVirtualContextIfEnabled(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere;
  const ABlindLevel: Byte): IioContext;
var
  LMap: IioMap;
begin
  // Retrieve the map from the MapContainer and if it is in some TrueClass mode then return
  // the TrueClassVirtualMap passing the original resolved tur class virtual map also
  LMap := TioMapContainer.GetMap(AClassName);
  if LMap.GetTable.IsTrueClass then
  begin
    Result := TioContext.Create(AIntent, LMap.GetTrueClassVirtualMap, AWhere, nil, nil, '', '', ABlindLevel);
    Result.OriginalNonTrueClassMap := LMap;
  end
  else
    Result := TioContext.Create(AIntent, LMap, AWhere, nil, nil, '', '', ABlindLevel);
end;

class procedure TioContextFactory.GenerateAutodetectedHasManyRelationVirtualPropertyOnDetails;
var
  LMasterProperty: IioProperty;
  LDetailVirtualProperty: IioProperty;
  LDetailMap: IioMap;
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
begin
  // Loop for all (hypothetical) autodetected HasMany relationship
  for LMasterProperty in TioMapContainer.GetAutodetectedHasManyRelationCollection do
  begin
    // Resolve the type and alias (if the RelationChildTypeName is relative to a class then the resolver return the class itself)
    AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(LMasterProperty.GetRelationChildTypeName, '', rmAll);
    // NB: rmAll (qua deve rimanere questo)
    // The resolver return as a result ONLY entity classes so if the AResolvedTypeList is empty then the (hypothetical) relationship
    // is not to be considered as an HasMany (so clear the HasMany informations for this property).
    if AResolvedTypeList.Count = 0 then
    begin
      LMasterProperty.ClearRelationData;
      Continue;
    end;
    // Loop for all classes in the resolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // If the ChildTypeName is directly on indirectly (through an interface) relative to an entity then
      // add the virtual child property in the Map (if not already exists)
      LDetailMap := TioMapContainer.GetMap(AResolvedTypeName);
      if LDetailMap.GetProperties.PropertyExists(IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME) then
        Continue;
      LDetailVirtualProperty := HasManyChildVirtualProperty(LDetailMap.GetTable);
      LDetailMap.GetProperties.Add(LDetailVirtualProperty);
    end;
  end;
end;

class function TioContextFactory.GetMetadata_FieldTypeByTypeKind(const ATypeKind: TTypeKind; const AQualifiedName: string): TioMetadataFieldType;
begin
  Result := ioMdInteger;
  case ATypeKind of
    tkEnumeration:
      if AQualifiedName = 'System.Boolean' then
        Exit(ioMdBoolean)
      else
        Exit(ioMdInteger);
    tkInteger, tkInt64:
      Exit(ioMdInteger);
    tkFloat:
      if AQualifiedName = 'System.TDate' then
        Exit(ioMdDate)
      else if (AQualifiedName = 'System.TDateTime') or (AQualifiedName = 'iORM.CommonTypes.TioObjCreated') or (AQualifiedName = 'iORM.CommonTypes.TioObjUpdated')
      then
        Exit(ioMdDateTime)
      else if AQualifiedName = 'System.TTime' then
        Exit(ioMdTime)
      else if (AQualifiedName = 'System.Real') or (AQualifiedName = 'System.Double') or (AQualifiedName = 'System.Single') or
        (AQualifiedName = 'System.Currency') then // Luca Mandello 22/02/2021: altrimenti iORM con SQLite converte i float in numeric
        Exit(ioMdFloat) // Luca Mandello 22/02/2021: altrimenti iORM con SQLite converte i float in numeric
      else
        Exit(ioMdDecimal);
    tkString, tkLString, tkWString, tkUString:
      Exit(ioMdVarchar);
    tkRecord:
      if AQualifiedName = 'System.SysUtils.TTimeStamp' then
        Exit(ioMdDateTime);
    tkClass, tkInterface:
      Exit(ioMdBinary);
  end;
end;

class function TioContextFactory.GetProperty(const ATable: IioTable; const AMember: TRttiMember; const ATypeAlias, ASqlFieldName, ALoadSql, AFieldType: String;
  const ATransient, AIsID: Boolean; const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType;
  const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean;
  const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
  const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean;
  const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
  const AMetadata_FKOnDeleteAction: TioFKAction; const AMetadata_FKOnUpdateAction: TioFKAction): IioProperty;
begin
  if AMember is TRttiField then
  begin
    Result := TioField.Create(AMember as TRttiField, ATable, ATypeAlias, ASqlFieldName, ALoadSql, AFieldType, ATransient, AIsID, AReadWrite, ARelationType,
      ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLazyLoad, ANotHasMany, AMetadata_FieldType, AMetadata_FieldLength,
      AMetadata_FieldPrecision, AMetadata_FieldScale, AMetadata_FieldNotNull, AMetadata_Default, AMetadata_FieldUnicode, AMetadata_CustomFieldType,
      AMetadata_FieldSubType, AMetadata_FKCreate, AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
  end
  else if AMember is TRttiProperty then
  begin
    Result := TioProperty.Create(AMember as TRttiProperty, ATable, ATypeAlias, ASqlFieldName, ALoadSql, AFieldType, ATransient, AIsID, AReadWrite,
      ARelationType, ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLazyLoad, ANotHasMany, AMetadata_FieldType,
      AMetadata_FieldLength, AMetadata_FieldPrecision, AMetadata_FieldScale, AMetadata_FieldNotNull, AMetadata_Default, AMetadata_FieldUnicode,
      AMetadata_CustomFieldType, AMetadata_FieldSubType, AMetadata_FKCreate, AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
  end
  else
    raise EioGenericException.Create(Self.ClassName, 'GetProperty', 'Invalid member type');
end;

class function TioContextFactory.GroupBy(const ASqlText: String): IioGroupBy;
begin
  Result := TioGroupBy.Create(ASqlText);
end;

class function TioContextFactory.JoinItem(const AJoinAttribute: ioJoin): IioJoinItem;
begin
  Result := TioJoinItem.Create(AJoinAttribute.JoinType, AJoinAttribute.JoinClassRef, AJoinAttribute.JoinCondition);
end;

class function TioContextFactory.Joins: IioJoins;
begin
  Result := TioJoins.Create;
end;

class function TioContextFactory.Map(const AClassRef: TioClassRef): IioMap;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiInstanceType;
  LTable: IioTable;
begin
  // Init
  LRttiContext := TioRttiFactory.GetRttiContext;
  LRttiType := LRttiContext.GetType(AClassRef).AsInstance;
  // Get the table
  LTable := Self.Table(LRttiType);
  // Create the map
  Result := TioMap.Create(AClassRef, LRttiContext, LRttiType, LTable, Properties(LRttiType, LTable));
  // If an EtmTimeSlotClass is detected then register the class into the ETMEngine
  if Assigned(Result.GetTable.EtmTimeSlotClass) then
    TioEtmEngine.TraceByMap(Result, Result.GetTable.EtmTimeSlotClass, Result.GetTable.EtmTraceOnlyOnConnectionName);
end;

class function TioContextFactory.Properties(const Typ: TRttiInstanceType; const ATable: IioTable): IioProperties;
var
  LMembers: TArray<System.Rtti.TRttiMember>;
  procedure ExtractMembersInfo(const ATransientAsDefault: Boolean);
  var
    LMember: System.Rtti.TRttiMember;
    LRttiProperty: TRttiProperty;
    LRttiField: TRttiField;
    LAttribute: TCustomAttribute;
    LNewProperty: IioProperty;
    LForeignKeyAttributeExists: Boolean;
    // DB field metadata (DBBuilder)
    LDB_FieldType: TioMetadataFieldType;
    LDB_FieldSubType: string;
    LDB_FieldLength: Integer;
    LDB_FieldPrecision: Integer;
    LDB_FieldScale: Integer;
    LDB_FieldNotNull: Boolean;
    LDB_FieldUnicode: Boolean;
    LDB_CustomFieldType: string;
    LDB_Default: TValue;
    LDB_FKAutoCreate: TioFKCreate;
    LDB_FKOnDeleteAction: TioFKAction;
    LDB_FKOnUpdateAction: TioFKAction;
    // Smart where
    LWhereCompareOp: TioCompareOp;
    LWhereGroupLogicOp: TioLogicOp;
    LWhereGroupName: String;
    LWhereLogicOp: TioLogicOp;
    LWhereMasterGroupName: String;
    LWhereNullValue: TValue;
    LWhereSkip: Boolean;
    LWhereTargetPropName: String;
    // Map metadata
    LMember_Name: String;
    LMember_IsID: Boolean;
    LMember_TypeAlias: String;
    LMember_FieldName: String;
    LMember_FieldType: String;
    LMember_FieldValueType: System.Rtti.TRttiType;
    LMember_LoadSql: String;
    LMember_Transient: Boolean;
    LMember_LoadPersist: TioLoadPersist;
    LMember_RelationType: TioRelationType;
    LMember_RelationChildTypeName: String;
    LMember_RelationChildTypeAlias: String;
    LMember_RelationChildPropertyName: String;
    LMember_RelationChildLazyLoad: Boolean;
    LMember_RelationAutodetectEnabled: Boolean;
  begin
    // Loop all properties
    for LMember in LMembers do
    begin
      // Some initialization depending from the member type (class property or  class field)
      if LMember is TRttiField then
      begin
        LRttiField := LMember as TRttiField;
        LMember_FieldValueType := LRttiField.FieldType;
        LDB_FieldType := GetMetadata_FieldTypeByTypeKind(LRttiField.FieldType.TypeKind, LRttiField.FieldType.QualifiedName);
        LMember_Name := TioField.Remove_F_FromName(LMember.Name);
        LMember_FieldName := LMember_Name;
      end
      else if LMember is TRttiProperty then
      begin
        LRttiProperty := LMember as TRttiProperty;
        LMember_FieldValueType := LRttiProperty.PropertyType;
        LDB_FieldType := GetMetadata_FieldTypeByTypeKind(LRttiProperty.PropertyType.TypeKind, LRttiProperty.PropertyType.QualifiedName);
        LMember_Name := LMember.Name;
        LMember_FieldName := LMember_Name;
      end
      else
        raise EioGenericException.Create(Self.ClassName, 'Properties', 'Invalid property/field type.');
      // Skip if this member is the RefCount or Disposed property (TInterfacedObject) or it's an already exist member
      if (LMember_FieldName = 'RefCount') or (LMember_FieldName = 'Disposed') or Result.PropertyExists(LMember_FieldName) then
        Continue;
      // DB metadata initialization
      LForeignKeyAttributeExists := False;
      LDB_FieldLength := IO_DEFAULT_FIELD_LENGTH;
      LDB_FieldPrecision := IO_DEFAULT_FIELD_PRECISION;
      LDB_FieldScale := IO_DEFAULT_FIELD_SCALE;
      LDB_FieldNotNull := False;
      LDB_Default := nil;
      LDB_FieldUnicode := True;
      LDB_CustomFieldType := '';
      LDB_FieldSubType := '';
      LDB_FKAutoCreate := fkCreate;
      LDB_FKOnDeleteAction := fkUnspecified;
      LDB_FKOnUpdateAction := fkUnspecified;
      // Smart where initialization
      LWhereCompareOp := TioCompareOp.coEquals;
      LWhereGroupLogicOp := TioLogicOp.loAnd;
      LWhereGroupName := String.Empty;
      LWhereLogicOp := TioLogicOp.loAnd;
      LWhereMasterGroupName := String.Empty;
      LWhereNullValue := TValue.Empty;
      LWhereSkip := False;
      LWhereTargetPropName := LMember_FieldName; // Default where target property name equals the property name itself
      // Map members (props and/or fields) initialization
      LMember_IsID := (Uppercase(LMember_FieldName) = 'ID');
      LMember_TypeAlias := '';
      LMember_FieldType := '';
      LMember_LoadSql := '';
      LMember_Transient := ATransientAsDefault;
      LMember_LoadPersist := lpLoadAndPersist;
      LMember_RelationType := rtNone;
      LMember_RelationChildTypeName := '';
      LMember_RelationChildTypeAlias := '';
      LMember_RelationChildPropertyName := '';
      LMember_RelationChildLazyLoad := False;
      LMember_RelationAutodetectEnabled := True;
      // ObjStatus property detection by type "TioObjStatus"
      if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjStatus)) then
      begin
        Result.ObjStatusProperty := Self.GetProperty(ATable, LMember, '', '', '', '', True, False, lpLoadOnly, rtNone, '', '', '', False, True, LDB_FieldType,
          LDB_FieldLength, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil, LDB_FieldUnicode, LDB_CustomFieldType, LDB_FieldSubType, LDB_FKAutoCreate,
          LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
        Continue;
      end
      else
        // ObjVersion property detection by type "TioObjVersion"
        if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjVersion)) then
        begin
          if TioUtilities.TryGetMemberAttribute<ioField>(LMember, LAttribute) then
            LMember_FieldName := ioField(LAttribute).Value;
          Result.ObjVersionProperty := Self.GetProperty(ATable, LMember, '', LMember_FieldName, '', '', False, False, lpLoadAndPersist, rtNone, '', '', '',
            False, True, LDB_FieldType, LDB_FieldLength, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil, LDB_FieldUnicode, LDB_CustomFieldType,
            LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
          Result.Add(Result.ObjVersionProperty);
          Continue;
        end
        else
          // ObjCreated property detection by type "TioObjCreated"
          if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjCreated)) then
          begin
            if TioUtilities.TryGetMemberAttribute<ioField>(LMember, LAttribute) then
              LMember_FieldName := ioField(LAttribute).Value;
            Result.ObjCreatedProperty := Self.GetProperty(ATable, LMember, '', LMember_FieldName, '', '', False, False, lpLoadAndPersist, rtNone, '', '', '',
              False, True, LDB_FieldType, LDB_FieldLength, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil, LDB_FieldUnicode, LDB_CustomFieldType,
              LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
            Result.Add(Result.ObjCreatedProperty);
            Continue;
          end
          else
            // ObjCreatedUserID property detection by type "TioObjCreatedUserID"
            if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjCreatedUserID)) then
            begin
              if TioUtilities.TryGetMemberAttribute<ioField>(LMember, LAttribute) then
                LMember_FieldName := ioField(LAttribute).Value;
              Result.ObjCreatedUserIDProperty := Self.GetProperty(ATable, LMember, '', LMember_FieldName, '', '', False, False, lpLoadAndPersist, rtNone, '',
                '', '', False, True, LDB_FieldType, LDB_FieldLength, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil, LDB_FieldUnicode,
                LDB_CustomFieldType, LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
              Result.Add(Result.ObjCreatedUserIDProperty);
              Continue;
            end
            else
              // ObjCreatedUserName property detection by type "TioObjCreatedUserName"
              if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjCreatedUserName)) then
              begin
                if TioUtilities.TryGetMemberAttribute<ioField>(LMember, LAttribute) then
                  LMember_FieldName := ioField(LAttribute).Value;
                Result.ObjCreatedUserNameProperty := Self.GetProperty(ATable, LMember, '', LMember_FieldName, '', '', False, False, lpLoadAndPersist, rtNone,
                  '', '', '', False, True, LDB_FieldType, IO_USERNAME_LENGTH, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil, LDB_FieldUnicode,
                  LDB_CustomFieldType, LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
                Result.Add(Result.ObjCreatedUserNameProperty);
                Continue;
              end
              else
                // ObjUpdated property detection by type "TioObjUpdated"
                if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjUpdated)) then
                begin
                  if TioUtilities.TryGetMemberAttribute<ioField>(LMember, LAttribute) then
                    LMember_FieldName := ioField(LAttribute).Value;
                  Result.ObjUpdatedProperty := Self.GetProperty(ATable, LMember, '', LMember_FieldName, '', '', False, False, lpLoadAndPersist, rtNone, '', '',
                    '', False, True, LDB_FieldType, LDB_FieldLength, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil, LDB_FieldUnicode,
                    LDB_CustomFieldType, LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
                  Result.Add(Result.ObjUpdatedProperty);
                  Continue;
                end
                else
                  // ObjUpdatedUserID property detection by type "TioObjUpdatedUserID"
                  if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjUpdatedUserID)) then
                  begin
                    if TioUtilities.TryGetMemberAttribute<ioField>(LMember, LAttribute) then
                      LMember_FieldName := ioField(LAttribute).Value;
                    Result.ObjUpdatedUserIDProperty := Self.GetProperty(ATable, LMember, '', LMember_FieldName, '', '', False, False, lpLoadAndPersist, rtNone,
                      '', '', '', False, True, LDB_FieldType, LDB_FieldLength, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil, LDB_FieldUnicode,
                      LDB_CustomFieldType, LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
                    Result.Add(Result.ObjUpdatedUserIDProperty);
                    Continue;
                  end
                  else
                    // ObjUpdatedUserName property detection by type "TioObjUpdatedUserName"
                    if LMember_FieldValueType.Name = GetTypeName(TypeInfo(TioObjUpdatedUserName)) then
                    begin
                      if TioUtilities.TryGetMemberAttribute<ioField>(LMember, LAttribute) then
                        LMember_FieldName := ioField(LAttribute).Value;
                      Result.ObjUpdatedUserNameProperty := Self.GetProperty(ATable, LMember, '', LMember_FieldName, '', '', False, False, lpLoadAndPersist,
                        rtNone, '', '', '', False, True, LDB_FieldType, IO_USERNAME_LENGTH, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull, nil,
                        LDB_FieldUnicode, LDB_CustomFieldType, LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnUpdateAction, LDB_FKOnDeleteAction);
                      Result.Add(Result.ObjUpdatedUserNameProperty);
                      Continue;
                    end;
      // Loop for all attributes
      for LAttribute in LMember.GetAttributes do
      begin
        if LAttribute is ioOID then
          LMember_IsID := True

        else if LAttribute is ioField then
        begin
          if not ioField(LAttribute).Value.IsEmpty then
            LMember_FieldName := ioField(LAttribute).Value;
          LMember_Transient := False;
        end

        else if (LAttribute is ioSkip) and (ssMap in ioSkip(LAttribute).Scopes) then // Leave after ioField attribute detection
          LMember_Transient := True

        else if LAttribute is ioTypeAlias then
          LMember_TypeAlias := ioTypeAlias(LAttribute).Value

        else if LAttribute is ioFieldType then
          LMember_FieldType := ioFieldType(LAttribute).Value

        else if LAttribute is ioLoadSql then
          LMember_LoadSql := ioLoadSql(LAttribute).Value

        else if LAttribute is ioLoadOnly then
          LMember_LoadPersist := lpLoadOnly

        else if LAttribute is ioPersistOnly then
          LMember_LoadPersist := lpPersistOnly

        else if LAttribute is ioEmbeddedHasMany then
        begin
          LMember_RelationType := rtEmbeddedHasMany;
          LMember_RelationChildTypeName := ioEmbeddedHasMany(LAttribute).ChildTypeName;
          LMember_RelationChildTypeAlias := ioEmbeddedHasMany(LAttribute).ChildTypeAlias;
        end

        else if LAttribute is ioEmbeddedHasOne then
        begin
          LMember_RelationType := rtEmbeddedHasOne;
          LMember_RelationChildTypeName := ioEmbeddedHasOne(LAttribute).ChildTypeName;
          LMember_RelationChildTypeAlias := ioEmbeddedHasOne(LAttribute).ChildTypeAlias;
        end

        else if LAttribute is ioBelongsTo then
        begin
          LMember_RelationType := rtBelongsTo;
          LMember_RelationChildTypeName := ioBelongsTo(LAttribute).ChildTypeName;
          LMember_RelationChildTypeAlias := ioBelongsTo(LAttribute).ChildTypeAlias;
          LDB_FieldType := ioMdInteger; // If is a BelongsTo relation then the field type on DB in integer
        end

        else if LAttribute is ioHasOne then
        begin
          LMember_RelationType := rtHasOne;
          LMember_RelationChildTypeName := ioHasOne(LAttribute).ChildTypeName;
          LMember_RelationChildTypeAlias := ioHasOne(LAttribute).ChildTypeAlias;
          LMember_RelationChildPropertyName := ioHasOne(LAttribute).ChildPropertyName;
        end

        else if LAttribute is ioHasMany then
        begin
          LMember_RelationType := rtHasMany;
          LMember_RelationChildTypeName := ioHasMany(LAttribute).ChildTypeName;
          LMember_RelationChildTypeAlias := ioHasMany(LAttribute).ChildTypeAlias;
          LMember_RelationChildPropertyName := ioHasMany(LAttribute).ChildPropertyName;
        end

        else if LAttribute is ioLazyLoad then
          LMember_RelationChildLazyLoad := True

        else if LAttribute is ioDisableRelationAutodetect then
          LMember_RelationAutodetectEnabled := False

        else if LAttribute is ioIndex then
        begin
          if ioIndex(LAttribute).CommaSepFieldList.IsEmpty then // If the "ACommaSepFieldList" is empty then set the current property field name
            ioIndex(LAttribute).CommaSepFieldList := LMember_FieldName;
          ATable.GetIndexList(True).Add(ioIndex(LAttribute)); // Add the current index attribute
        end
        else

          if LAttribute is etmPropertyAttribute then
        begin
          etmPropertyAttribute(LAttribute).SetMemberName(LMember_Name); // Add the current member name if necessary
          ATable.GetEtmPropToPropList(True).Add(etmPropertyAttribute(LAttribute)); // Add the current etmProperty attribute
        end
        else

          if LAttribute is ioWhereAttribute then
        begin
          LWhereCompareOp := ioWhereAttribute(LAttribute).CompareOp;
          LWhereLogicOp := ioWhereAttribute(LAttribute).LogicOp;
          if not ioWhereAttribute(LAttribute).TargetPropName.IsEmpty then
            LWhereTargetPropName := ioWhereAttribute(LAttribute).TargetPropName;
        end

        else if LAttribute is ioWhereGroupAttribute then
        begin
          LWhereGroupName := ioWhereGroupAttribute(LAttribute).GroupName;
          LWhereGroupLogicOp := ioWhereGroupAttribute(LAttribute).GroupLogicOp;
          LWhereMasterGroupName := ioWhereGroupAttribute(LAttribute).MasterGroupName;
        end

        else if LAttribute is ioWhereNullValueAttribute then
          LWhereNullValue := ioWhereNullValueAttribute(LAttribute).Value

        else if LAttribute is ioWhereSkipAttribute then
          LWhereSkip := True

        else
          // Metadata Used by DBBuilder (M.M. 01/08/18)
          if LAttribute is ioNotNull then
            LDB_FieldNotNull := True
          else if LAttribute is ioVarchar then

          begin
            LDB_FieldType := ioMdVarchar;
            LDB_FieldLength := ioVarchar(LAttribute).Length;
            LDB_FieldUnicode := ioVarchar(LAttribute).IsUnicode;
          end

          else if LAttribute is ioChar then
          begin
            LDB_FieldType := ioMdChar;
            LDB_FieldLength := ioChar(LAttribute).Length;
            LDB_FieldUnicode := ioChar(LAttribute).IsUnicode;
          end

          else if LAttribute is ioInteger then
          begin
            LDB_FieldType := ioMdInteger;
            LDB_FieldPrecision := ioInteger(LAttribute).Precision;
          end

          else if LAttribute is ioFloat then
            LDB_FieldType := ioMdFloat

          else if LAttribute is ioDate then
            LDB_FieldType := ioMdDate

          else if LAttribute is ioTime then
            LDB_FieldType := ioMdTime

          else if LAttribute is ioDateTime then
            LDB_FieldType := ioMdDateTime

          else if LAttribute is ioDecimal then
          begin
            LDB_FieldType := ioMdDecimal;
            LDB_FieldPrecision := ioDecimal(LAttribute).Precision;
            LDB_FieldScale := ioDecimal(LAttribute).Scale;
          end

          else if LAttribute is ioNumeric then
          begin
            LDB_FieldType := ioMdNumeric;
            LDB_FieldPrecision := ioNumeric(LAttribute).Precision;
            LDB_FieldScale := ioNumeric(LAttribute).Scale;
          end

          else if LAttribute is ioBoolean then
            LDB_FieldType := ioMdBoolean

          else if LAttribute is ioBinary then
          begin
            LDB_FieldType := ioMdBinary;
            LDB_FieldSubType := ioBinary(LAttribute).BinarySubType
          end

          else if LAttribute is ioFTCustom then
          begin
            LDB_FieldType := ioMdCustomFieldType;
            LDB_CustomFieldType := ioFTCustom(LAttribute).Value;
          end

          else if LAttribute is ioDefault then
            LDB_Default := ioDefault(LAttribute).Value

          else if LAttribute is ioForeignKey then
          begin
            LForeignKeyAttributeExists := True;
            LDB_FKAutoCreate := ioForeignKey(LAttribute).AutoCreate;
            LDB_FKOnDeleteAction := ioForeignKey(LAttribute).OnDeleteAction;
            LDB_FKOnUpdateAction := ioForeignKey(LAttribute).OnUpdateAction;
          end;
      end;

      // Automatic relation detection (only for class or interface member type)
      if (not ATransientAsDefault) and (not LMember_Transient) and LMember_RelationAutodetectEnabled and (LMember_RelationType = rtNone) and
        (LMember_FieldValueType.IsInstance or (LMember_FieldValueType is TRttiInterfaceType)) then
      begin
        // HasMany relation autodetect
        LMember_RelationChildTypeName := TioDuckTypedFactory.TryGetHasManyRelationChildTypeName(LMember_FieldValueType);
        if not LMember_RelationChildTypeName.IsEmpty then
        begin
          LMember_RelationType := rtHasMany;
          LMember_RelationChildPropertyName := IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
        end
        else
          // BelongsTo relation autodetect
          if HasBelongsToRelation(LMember_FieldValueType) then
          begin
            LMember_RelationType := rtBelongsTo;
            LMember_RelationChildTypeName := LMember_FieldValueType.Name;
            LDB_FieldType := ioMdInteger; // If is a BelongsTo relation then the field type on DB in integer
          end;
      end;

      // If the current member has an HasMany relation and an "ioForeignKey" attribute has not been explicitly specified,
      // then set by default the "CASCADE" value for both the update and the delete
      if (LMember_RelationType = rtHasMany) and not LForeignKeyAttributeExists then
      begin
        LDB_FKOnDeleteAction := fkCascade;
        LDB_FKOnUpdateAction := fkCascade;
      end;

      // If the current member is a ReadOnly TRttiProperty then force it as PersistOnly
      if (LMember is TRttiProperty) and not TRttiProperty(LMember).IsWritable then
        LMember_LoadPersist := lpPersistOnly;
      // Create and add property into the map
      LNewProperty := GetProperty(ATable, LMember, LMember_TypeAlias, LMember_FieldName, LMember_LoadSql, LMember_FieldType, LMember_Transient, LMember_IsID,
        LMember_LoadPersist, LMember_RelationType, LMember_RelationChildTypeName, LMember_RelationChildTypeAlias, LMember_RelationChildPropertyName,
        LMember_RelationChildLazyLoad, LMember_RelationAutodetectEnabled, LDB_FieldType, LDB_FieldLength, LDB_FieldPrecision, LDB_FieldScale, LDB_FieldNotNull,
        LDB_Default, LDB_FieldUnicode, LDB_CustomFieldType, LDB_FieldSubType, LDB_FKAutoCreate, LDB_FKOnDeleteAction, LDB_FKOnUpdateAction);
      LNewProperty.WhereCompareOp := LWhereCompareOp;
      LNewProperty.WhereGroupLogicOp := LWhereGroupLogicOp;
      LNewProperty.WhereGroupName := LWhereGroupName;
      LNewProperty.WhereLogicOp := LWhereLogicOp;
      LNewProperty.WhereMasterGroupName := LWhereMasterGroupName;
      LNewProperty.WhereNullValue := LWhereNullValue;
      LNewProperty.WhereSkip := LWhereSkip;
      LNewProperty.WhereTargetPropName := LWhereTargetPropName;
      Result.Add(LNewProperty);
      // Set "ContainsHasManyOrHasOneProperties" to True if there is some property with HasMany or HasOne relation
      if (LNewProperty.GetRelationType = rtHasMany) or (LNewProperty.GetRelationType = rtHasOne) then
        Result.ContainsHasManyOrHasOneProperties := True;
      // If the current property is a virtual property (autodetected has many relation) then
      // add it to the AutodetectedHasManyRelationVirtualProperties of the ContextContainer
      if LNewProperty.HasAutodetectedHasManyRelation then
        TioMapContainer.GetAutodetectedHasManyRelationCollection.Add(LNewProperty);
    end;
  end;

begin
  // Create result Properties object
  Result := TioProperties.Create;
  // Loop for all fields and/or properties
  if (ATable.GetMapMode = mmHybrid) or (ATable.GetMapMode = mmFields) then
  begin
    LMembers := TArray<System.Rtti.TRttiMember>(TObject(Typ.AsInstance.GetFields));
    ExtractMembersInfo(False);
  end;
  if (ATable.GetMapMode = mmHybrid) or (ATable.GetMapMode = mmProperties) then
  begin
    LMembers := TArray<System.Rtti.TRttiMember>(TObject(Typ.AsInstance.GetProperties));
    ExtractMembersInfo(ATable.GetMapMode = mmHybrid);
  end;
end;

class function TioContextFactory.Table(const Typ: TRttiInstanceType): IioTable;
var
  LAttr: TCustomAttribute;
  LTableName, LConnectionName, LKeyGenerator: String;
  LTrueClass: IioTrueClass;
  LJoins: IioJoins;
  LGroupBy: IioGroupBy;
  LMapMode: TioMapModeType;
  LIndexList: TioIndexList;
  LEtmTimeSlotClass: TioEtmTimeSlotRef;
  LEtmTraceOnlyOnConnectionName: String;
  LEtmPropToPropList: TEtmPropToPropList;
  LDeleteConflictStrategy, LInsertConflictStrategy, LUpdateConflictStrategy: TClass;
  LDeleteConflictStrategy_OnConflictSetStateAs, LInsertConflictStrategy_OnConflictSetStateAs, LUpdateConflictStrategy_OnConflictSetStateAs
    : TioPersistenceConflictState;
begin
  try
    // Prop Init
    LTableName := Typ.MetaclassType.ClassName.Substring(1);
    LConnectionName := ''; // Elimina il primo carattere (di solito la T)
    LKeyGenerator := '';
    LJoins := Self.Joins;
    LTrueClass := Self.TrueClass(DEFAULT_TRUE_CLASS_MODE, IO_TRUECLASS_FIELDNAME);
    LGroupBy := nil;
    LMapMode := DEFAULT_MAP_MODE;
    LIndexList := nil;
    LEtmTimeSlotClass := nil;
    LEtmTraceOnlyOnConnectionName := '';
    LEtmPropToPropList := nil;
    LDeleteConflictStrategy := nil;
    LInsertConflictStrategy := nil;
    LUpdateConflictStrategy := nil;
    LDeleteConflictStrategy_OnConflictSetStateAs := csUndefined;
    LInsertConflictStrategy_OnConflictSetStateAs := csUndefined;
    LUpdateConflictStrategy_OnConflictSetStateAs := csUndefined;
    // Check attributes
    for LAttr in Typ.GetAttributes do
    begin
      if (LAttr is ioEntity) then
      begin
        LTableName := ioEntity(LAttr).TableName;
        LMapMode := ioEntity(LAttr).MapMode;
      end

      else if (LAttr is ioNotPersistedEntity) then
      begin
        LTableName := ioNotPersistedEntity(LAttr).TableName;
        LMapMode := ioNotPersistedEntity(LAttr).MapMode;
      end

      else if LAttr is ioKeyGenerator then
        LKeyGenerator := ioKeyGenerator(LAttr).Value

      else if LAttr is ioConnection then
        LConnectionName := ioConnection(LAttr).ConnectionName

      else if LAttr is ioJoin then
        LJoins.Add(Self.JoinItem(ioJoin(LAttr)))

      else if (LAttr is ioGroupBy) and (not Assigned(LGroupBy)) then
        LGroupBy := Self.GroupBy(ioGroupBy(LAttr).Value)

      else if LAttr is ioTrueClass then
        LTrueClass.Mode := ioTrueClass(LAttr).TrueClassMode

      else if LAttr is ioIndex then // ioIndex (NB: costruisce la lista di indici solo se serve e cos� anche nella mappa)
      begin
        if not Assigned(LIndexList) then
          LIndexList := TioIndexList.Create;
        LIndexList.Add(ioIndex(LAttr));
      end

      else if LAttr is ioDeleteConflictStrategyAttribute then
      begin
        LDeleteConflictStrategy := ioDeleteConflictStrategyAttribute(LAttr).Strategy;
        LDeleteConflictStrategy_OnConflictSetStateAs := ioDeleteConflictStrategyAttribute(LAttr).OnConflictSetStateAs;
      end

      else if LAttr is ioInsertConflictStrategyAttribute then
      begin
        LInsertConflictStrategy := ioInsertConflictStrategyAttribute(LAttr).Strategy;
        LInsertConflictStrategy_OnConflictSetStateAs := ioInsertConflictStrategyAttribute(LAttr).OnConflictSetStateAs;
      end

      else if LAttr is ioUpdateConflictStrategyAttribute then
      begin
        LUpdateConflictStrategy := ioUpdateConflictStrategyAttribute(LAttr).Strategy;
        LUpdateConflictStrategy_OnConflictSetStateAs := ioUpdateConflictStrategyAttribute(LAttr).OnConflictSetStateAs;
      end

      else if LAttr is ioConflictStrategyAttribute then // NB: Lasciare dopo gli altri attributi relativi alle conflict strategies
      begin
        LDeleteConflictStrategy := ioConflictStrategyAttribute(LAttr).Strategy;
        LDeleteConflictStrategy_OnConflictSetStateAs := ioConflictStrategyAttribute(LAttr).OnDeleteConflictSetStateAs;
        LInsertConflictStrategy := ioConflictStrategyAttribute(LAttr).Strategy;
        LInsertConflictStrategy_OnConflictSetStateAs := ioConflictStrategyAttribute(LAttr).OnInsertConflictSetStateAs;
        LUpdateConflictStrategy := ioConflictStrategyAttribute(LAttr).Strategy;
        LUpdateConflictStrategy_OnConflictSetStateAs := ioConflictStrategyAttribute(LAttr).OnUpdateConflictSetStateAs;
      end

      else if (LAttr is etmTrace) then
      begin
        LEtmTimeSlotClass := etmTrace(LAttr).TimeSlotClass;
        LEtmTraceOnlyOnConnectionName := etmTrace(LAttr).TraceOnlyOnConnectionName;
      end

      else if LAttr is etmPropertyAttribute then // etmProperty (NB: costruisce la lista solo se serve e cos� anche nella mappa)
      begin
        if not Assigned(LEtmPropToPropList) then
          LEtmPropToPropList := TEtmPropToPropList.Create;
        LEtmPropToPropList.Add(etmPropertyAttribute(LAttr));
      end;
    end;

    // Create result Properties object
    Result := TioTable.Create(LTableName, LKeyGenerator, LTrueClass, LJoins, LGroupBy, LConnectionName, LMapMode, Typ);

    // Set conflict strategies
    if Assigned(LDeleteConflictStrategy) then
    begin
      Result.DeleteConflictStrategy := LDeleteConflictStrategy;
      Result.DeleteConflictStrategy_OnConflictSetStateAs := LDeleteConflictStrategy_OnConflictSetStateAs;
    end;
    if Assigned(LInsertConflictStrategy) then
    begin
      Result.InsertConflictStrategy := LInsertConflictStrategy;
      Result.InsertConflictStrategy_OnConflictSetStateAs := LInsertConflictStrategy_OnConflictSetStateAs;
    end;
    if Assigned(LUpdateConflictStrategy) then
    begin
      Result.UpdateConflictStrategy := LUpdateConflictStrategy;
      Result.UpdateConflictStrategy_OnConflictSetStateAs := LUpdateConflictStrategy_OnConflictSetStateAs;
    end;
    // Set ETM
    if Assigned(LEtmTimeSlotClass) then
    begin
      Result.EtmTimeSlotClass := LEtmTimeSlotClass;
      Result.EtmTraceOnlyOnConnectionName := LEtmTraceOnlyOnConnectionName;
    end;
    // If the EtmPropToPropList is assigned then assign it to the ioTable
    if Assigned(LEtmPropToPropList) then
      Result.SetEtmPropToPropList(LEtmPropToPropList);
    // If the IndexList is assigned then assign it to the ioTable
    if Assigned(LIndexList) then
      Result.SetIndexList(LIndexList);
  finally
    // Free the EtmPropToPropList if necessary
    if Assigned(LEtmPropToPropList) and (LEtmPropToPropList.Count = 0) then
      FreeAndNil(LEtmPropToPropList);
    // Free the IndexList if necessary
    if Assigned(LIndexList) and (LIndexList.Count = 0) then
      FreeAndNil(LIndexList);
  end;
end;

end.
