{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.Context.Factory;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  iORM.Context.Table.Interfaces, System.Rtti,
  iORM.Attributes, System.Generics.Collections,
  iORM.Context.Map.Interfaces, iORM.Where.Interfaces;

type

  // Properties builder
  TioContextFactory = class
  private
    class function GetMetadata_FieldTypeByTypeKind(const ATypeKind: TTypeKind; const AQualifiedName: string): TioMetadataFieldType;
  public
    // I primi due metodi di classe dovranno essere spostati come protetti o privati
    class function GetProperty(const ATable: IioContextTable; const AMember: TRttiMember; const ATypeAlias, ASqlFieldName, ALoadSql, AFieldType: String;
      const ATransient, AIsID, AIDSkipOnInsert: Boolean; const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType;
      const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLoadType: TioLoadType;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
      const AMetadata_FKOnDeleteAction: TioFKAction; const AMetadata_FKOnUpdateAction: TioFKAction): IioContextProperty;
    class function Properties(const Typ: TRttiInstanceType; const ATable: IioContextTable): IioContextProperties;
    class function TrueClass(Typ: TRttiInstanceType; const ASqlFieldName: String = IO_TRUECLASS_FIELDNAME): IioTrueClass;
    class function Joins: IioJoins;
    class function JoinItem(const AJoinAttribute: ioJoin): IioJoinItem;
    class function GroupBy(const ASqlText: String): IioGroupBy;
    class function Table(const Typ: TRttiInstanceType): IioContextTable;
    class function Map(const AClassRef: TioClassRef): IioMap;
    class function Context(const AClassName: String; const AioWhere: IioWhere = nil; const ADataObject: TObject = nil): IioContext;
    class function GetPropertyByClassRefAndName(const AClassRef: TioClassRef; const APropertyName: String): IioContextProperty;
    class function GetIDPropertyByClassRef(const AClassRef: TioClassRef): IioContextProperty;
  end;

implementation

uses
  iORM.Context, iORM.Context.Properties,
  System.SysUtils, iORM.Context.Table,
  iORM.RttiContext.Factory, iORM.Context.Container, iORM.Context.Map,
  System.StrUtils, iORM.Exceptions, System.TypInfo, iORM.Utilities;

{ TioBuilderProperties }

class function TioContextFactory.TrueClass(Typ: TRttiInstanceType; const ASqlFieldName: String): IioTrueClass;
var
  Ancestors, QualifiedClassName, ClassName: String;
begin
  // ClassName
  ClassName := Typ.MetaclassType.ClassName;
  QualifiedClassName := Typ.QualifiedName;
  // Loop for all ancestors
  repeat
  begin
    Ancestors := Ancestors + '<' + Typ.Name + '>';
    Typ := Typ.BaseType;
  end;
  until not Assigned(Typ);
  // Create
  Result := TioTrueClass.Create(ASqlFieldName);
end;

class function TioContextFactory.Context(const AClassName: String; const AioWhere: IioWhere; const ADataObject: TObject): IioContext;
begin
  // Get the Context from the ContextContainer
  Result := TioContext.Create(AClassName, TioMapContainer.GetMap(AClassName), AioWhere, ADataObject);
end;

class function TioContextFactory.GetIDPropertyByClassRef(const AClassRef: TioClassRef): IioContextProperty;
begin
  Result := Self.Map(AClassRef).GetProperties.GetIdProperty;
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
      else if (AQualifiedName = 'System.TDateTime') or (AQualifiedName = 'iORM.CommonTypes.TioObjVersion') then
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

class function TioContextFactory.GetProperty(const ATable: IioContextTable; const AMember: TRttiMember;
  const ATypeAlias, ASqlFieldName, ALoadSql, AFieldType: String; const ATransient, AIsID, AIDSkipOnInsert: Boolean; const AReadWrite: TioLoadPersist;
  const ARelationType: TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String;
  const ARelationLoadType: TioLoadType; const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer;
  const AMetadata_FieldPrecision: Integer; const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue;
  const AMetadata_FieldUnicode: Boolean; const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
  const AMetadata_FKOnDeleteAction: TioFKAction; const AMetadata_FKOnUpdateAction: TioFKAction): IioContextProperty;
begin
  if AMember is TRttiField then
  begin
    Result := TioField.Create(AMember as TRttiField, ATable, ATypeAlias, ASqlFieldName, ALoadSql, AFieldType, ATransient, AIsID, AIDSkipOnInsert, AReadWrite,
      ARelationType, ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLoadType, AMetadata_FieldType, AMetadata_FieldLength,
      AMetadata_FieldPrecision, AMetadata_FieldScale, AMetadata_FieldNotNull, AMetadata_Default, AMetadata_FieldUnicode, AMetadata_CustomFieldType,
      AMetadata_FieldSubType, AMetadata_FKCreate, AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
  end
  else if AMember is TRttiProperty then
  begin
    Result := TioProperty.Create(AMember as TRttiProperty, ATable, ATypeAlias, ASqlFieldName, ALoadSql, AFieldType, ATransient, AIsID, AIDSkipOnInsert,
      AReadWrite, ARelationType, ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLoadType, AMetadata_FieldType,
      AMetadata_FieldLength, AMetadata_FieldPrecision, AMetadata_FieldScale, AMetadata_FieldNotNull, AMetadata_Default, AMetadata_FieldUnicode,
      AMetadata_CustomFieldType, AMetadata_FieldSubType, AMetadata_FKCreate, AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
  end
  else
    raise EioException.Create(Self.ClassName, 'GetProperty', 'Invalid member type');
end;

class function TioContextFactory.GetPropertyByClassRefAndName(const AClassRef: TioClassRef; const APropertyName: String): IioContextProperty;
begin
  Result := Self.Map(AClassRef).GetProperties.GetPropertyByName(APropertyName);
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
  ARttiContext: TRttiContext;
  ARttiType: TRttiInstanceType;
  ATable: IioContextTable;
begin
  // Rtti init
  ARttiContext := TioRttiContextFactory.RttiContext;
  ARttiType := ARttiContext.GetType(AClassRef).AsInstance;
  // Get the table
  ATable := Self.Table(ARttiType);
  // Create the context
  Result := TioMap.Create(AClassRef, ARttiContext, ARttiType, ATable, Self.Properties(ARttiType, ATable));
end;

class function TioContextFactory.Properties(const Typ: TRttiInstanceType; const ATable: IioContextTable): IioContextProperties;
var
  LMembers: TArray<System.Rtti.TRttiMember>;
  procedure ExtractMembersInfo(const ATransientAsDeafult: Boolean);
  var
    LMember: System.Rtti.TRttiMember;
    LRttiProperty: TRttiProperty;
    LRttiField: TRttiField;
    LAttribute: TCustomAttribute;
    // DB field metadata (DBBuilder)
    PropMetadata_FieldType: TioMetadataFieldType;
    PropMetadata_FieldSubType: string;
    PropMetadata_FieldLength: Integer;
    PropMetadata_FieldPrecision: Integer;
    PropMetadata_FieldScale: Integer;
    PropMetadata_FieldNotNull: Boolean;
    PropMetadata_FieldUnicode: Boolean;
    PropMetadata_CustomFieldType: string;
    PropMetadata_Default: TValue;
    PropMetadata_FKAutoCreate: TioFKCreate;
    PropMetadata_FKOnDeleteAction: TioFKAction;
    PropMetadata_FKOnUpdateAction: TioFKAction;
    // Map metadata
    PropID: Boolean;
    PropIDSkipOnInsert: Boolean;
    PropTypeAlias: String;
    PropFieldName: String;
    PropFieldType: String;
    PropFieldValueType: System.Rtti.TRttiType;
    PropLoadSql: String;
    PropTransient: Boolean;
    PropLoadPersist: TioLoadPersist;
    PropRelationType: TioRelationType;
    PropRelationChildTypeName: String;
    PropRelationChildTypeAlias: String;
    PropRelationChildPropertyName: String;
    PropRelationChildLoadType: TioLoadType;
  begin
    // Loop all properties
    for LMember in LMembers do
    begin
      // Some initialization depending from the member type (class property or  class field)
      if LMember is TRttiField then
      begin
        LRttiField := LMember as TRttiField;
        PropFieldValueType := LRttiField.FieldType;
        PropMetadata_FieldType := GetMetadata_FieldTypeByTypeKind(LRttiField.FieldType.TypeKind, LRttiField.FieldType.QualifiedName);
        PropFieldName := TioField.Remove_F_FromName(LMember.Name);
      end
      else
      if LMember is TRttiProperty then
      begin
        LRttiProperty := LMember as TRttiProperty;
        PropFieldValueType := LRttiProperty.PropertyType;
        PropMetadata_FieldType := GetMetadata_FieldTypeByTypeKind(LRttiProperty.PropertyType.TypeKind, LRttiProperty.PropertyType.QualifiedName);
        PropFieldName := LMember.Name;
      end
      else
        raise EioException.Create(Self.ClassName, 'Properties', 'Invalid property/field type.');
      // Skip if this member is the RefCount or Disposed property (TInterfacedObject) or it's an already exist member
      if (PropFieldName = 'RefCount') or (PropFieldName = 'Disposed') or Result.PropertyExists(PropFieldName) then
        Continue;
      // DB metadata initialization
      PropMetadata_FieldLength := IO_DEFAULT_FIELD_LENGTH;
      PropMetadata_FieldPrecision := IO_DEFAULT_FIELD_PRECISION;
      PropMetadata_FieldScale := IO_DEFAULT_FIELD_SCALE;
      PropMetadata_FieldNotNull := False;
      PropMetadata_Default := nil;
      PropMetadata_FieldUnicode := True;
      PropMetadata_CustomFieldType := '';
      PropMetadata_FieldSubType := '';
      PropMetadata_FKAutoCreate := fkCreate;
      PropMetadata_FKOnDeleteAction := fkUnspecified;
      PropMetadata_FKOnUpdateAction := fkUnspecified;
      // Map members (props and/or fields) initialization
      PropID := (Uppercase(PropFieldName) = 'ID');
      PropIDSkipOnInsert := True;
      PropTypeAlias := '';
      PropFieldType := '';
      PropLoadSql := '';
      PropTransient := ATransientAsDeafult;
      PropLoadPersist := lpLoadAndPersist;
      PropRelationType := rtNone;
      PropRelationChildTypeName := '';
      PropRelationChildTypeAlias := '';
      PropRelationChildPropertyName := '';
      PropRelationChildLoadType := ltEagerLoad;
      // ObjStatus property detection by type "TioObjStatus"
      if PropFieldValueType.Name = GetTypeName(TypeInfo(TioObjStatus)) then
      begin
        Result.ObjStatusProperty := Self.GetProperty(ATable, LMember, '', '', '', '', True, False, False, lpLoadOnly, rtNone, '', '', '', ltEagerLoad,
          PropMetadata_FieldType, PropMetadata_FieldLength, PropMetadata_FieldPrecision, PropMetadata_FieldScale, PropMetadata_FieldNotNull, nil,
          PropMetadata_FieldUnicode, PropMetadata_CustomFieldType, PropMetadata_FieldSubType, PropMetadata_FKAutoCreate, PropMetadata_FKOnUpdateAction,
          PropMetadata_FKOnDeleteAction);
        Continue;
      end;
      // ObjVersion property detection by type "TioObjVersion"
      if PropFieldValueType.Name = GetTypeName(TypeInfo(TioObjVersion)) then
      begin
        if TioUtilities.HasAttribute<ioField>(LMember, LAttribute) then
          PropFieldName := ioField(LAttribute).Value;
        Result.ObjVersionProperty := Self.GetProperty(ATable, LMember, '', PropFieldName, '', '', False, False, False, lpLoadAndPersist, rtNone, '', '', '',
          ltEagerLoad, PropMetadata_FieldType, PropMetadata_FieldLength, PropMetadata_FieldPrecision, PropMetadata_FieldScale, PropMetadata_FieldNotNull, nil,
          PropMetadata_FieldUnicode, PropMetadata_CustomFieldType, PropMetadata_FieldSubType, PropMetadata_FKAutoCreate, PropMetadata_FKOnUpdateAction,
          PropMetadata_FKOnDeleteAction);
        Result.Add(Result.ObjVersionProperty);
        Continue;
      end;
      // Loop for all attributes
      for LAttribute in LMember.GetAttributes do
      begin
        if LAttribute is ioOID then
        begin
          PropID := True;
          PropIDSkipOnInsert := ioOID(LAttribute).SkipOnInsert;
        end;
        if LAttribute is ioField then
        begin
          if not ioField(LAttribute).Value.IsEmpty then
            PropFieldName := ioField(LAttribute).Value;
          PropTransient := False;
        end;
        if LAttribute is ioSkip then // Leave after ioField attribute detection
          PropTransient := True;
        if LAttribute is ioTypeAlias then
          PropTypeAlias := ioTypeAlias(LAttribute).Value;
        if LAttribute is ioFieldType then
          PropFieldType := ioFieldType(LAttribute).Value;
        if LAttribute is ioLoadSql then
          PropLoadSql := ioLoadSql(LAttribute).Value;
        if LAttribute is ioLoadOnly then
          PropLoadPersist := lpLoadOnly;
        if LAttribute is ioPersistOnly then
          PropLoadPersist := lpPersistOnly;
        // Relations
        if LAttribute is ioEmbeddedHasMany then
        begin
          PropRelationType := rtEmbeddedHasMany;
          PropRelationChildTypeName := ioEmbeddedHasMany(LAttribute).ChildTypeName;
          PropRelationChildTypeAlias := ioEmbeddedHasMany(LAttribute).ChildTypeAlias;
        end;
        if LAttribute is ioEmbeddedHasOne then
        begin
          PropRelationType := rtEmbeddedHasOne;
          PropRelationChildTypeName := ioEmbeddedHasOne(LAttribute).ChildTypeName;
          PropRelationChildTypeAlias := ioEmbeddedHasOne(LAttribute).ChildTypeAlias;
        end;
        if LAttribute is ioBelongsTo then
        begin
          PropRelationType := rtBelongsTo;
          PropRelationChildTypeName := ioBelongsTo(LAttribute).ChildTypeName;
          PropRelationChildTypeAlias := ioBelongsTo(LAttribute).ChildTypeAlias;
          PropMetadata_FieldType := ioMdInteger; // If is a BelongsTo relation then the field type on DB in integer
        end;
        if LAttribute is ioHasMany then
        begin
          PropRelationType := rtHasMany;
          PropRelationChildTypeName := ioHasMany(LAttribute).ChildTypeName;
          PropRelationChildTypeAlias := ioHasMany(LAttribute).ChildTypeAlias;
          PropRelationChildPropertyName := ioHasMany(LAttribute).ChildPropertyName;
          PropRelationChildLoadType := ioHasMany(LAttribute).LoadType;
        end;
        if LAttribute is ioHasOne then
        begin
          PropRelationType := rtHasOne;
          PropRelationChildTypeName := ioHasOne(LAttribute).ChildTypeName;
          PropRelationChildTypeAlias := ioHasOne(LAttribute).ChildTypeAlias;
          PropRelationChildPropertyName := ioHasOne(LAttribute).ChildPropertyName;
        end;
        // Indexes
        if LAttribute is ioIndex then
        begin
          if ioIndex(LAttribute).CommaSepFieldList.IsEmpty then // If the "ACommaSepFieldList" is empty then set the current property field name
            ioIndex(LAttribute).CommaSepFieldList := PropFieldName;
          ATable.GetIndexList(True).Add(ioIndex(LAttribute)); // Add the current index attribute
        end;
        // Metadata Used by DBBuilder (M.M. 01/08/18)
        if LAttribute is ioNotNull then
          PropMetadata_FieldNotNull := True;
        if LAttribute is ioVarchar then
        begin
          PropMetadata_FieldType := ioMdVarchar;
          PropMetadata_FieldLength := ioVarchar(LAttribute).Length;
          PropMetadata_FieldUnicode := ioVarchar(LAttribute).IsUnicode;
        end;
        if LAttribute is ioChar then
        begin
          PropMetadata_FieldType := ioMdChar;
          PropMetadata_FieldLength := ioChar(LAttribute).Length;
          PropMetadata_FieldUnicode := ioChar(LAttribute).IsUnicode;
        end;
        if LAttribute is ioInteger then
        begin
          PropMetadata_FieldType := ioMdInteger;
          PropMetadata_FieldPrecision := ioInteger(LAttribute).Precision;
        end;
        if LAttribute is ioFloat then
          PropMetadata_FieldType := ioMdFloat;
        if LAttribute is ioDate then
          PropMetadata_FieldType := ioMdDate;
        if LAttribute is ioTime then
          PropMetadata_FieldType := ioMdTime;
        if LAttribute is ioDateTime then
          PropMetadata_FieldType := ioMdDateTime;
        if LAttribute is ioDecimal then
        begin
          PropMetadata_FieldType := ioMdDecimal;
          PropMetadata_FieldPrecision := ioDecimal(LAttribute).Precision;
          PropMetadata_FieldScale := ioDecimal(LAttribute).Scale;
        end;
        if LAttribute is ioNumeric then
        begin
          PropMetadata_FieldType := ioMdNumeric;
          PropMetadata_FieldPrecision := ioNumeric(LAttribute).Precision;
          PropMetadata_FieldScale := ioNumeric(LAttribute).Scale;
        end;
        if LAttribute is ioBoolean then
          PropMetadata_FieldType := ioMdBoolean;
        if LAttribute is ioBinary then
        begin
          PropMetadata_FieldType := ioMdBinary;
          PropMetadata_FieldSubType := ioBinary(LAttribute).BinarySubType;
        end;
        if LAttribute is ioFTCustom then
        begin
          PropMetadata_FieldType := ioMdCustomFieldType;
          PropMetadata_CustomFieldType := ioFTCustom(LAttribute).Value;
        end;
        if LAttribute is ioDefault then
          PropMetadata_Default := ioDefault(LAttribute).Value;
        if LAttribute is ioForeignKey then
        begin
          PropMetadata_FKAutoCreate := ioForeignKey(LAttribute).AutoCreate;
          PropMetadata_FKOnDeleteAction := ioForeignKey(LAttribute).OnDeleteAction;
          PropMetadata_FKOnUpdateAction := ioForeignKey(LAttribute).OnUpdateAction;
        end;
      end;
      // If the current member is a ReadOnly TRttiProperty then force it as PersistOnly
      if (LMember is TRttiProperty) and not TRttiProperty(LMember).IsWritable then
        PropLoadPersist := lpPersistOnly;
      // Create and add property into the map
      Result.Add(GetProperty(ATable, LMember, PropTypeAlias, PropFieldName, PropLoadSql, PropFieldType, PropTransient, PropID, PropIDSkipOnInsert, PropLoadPersist,
        PropRelationType, PropRelationChildTypeName, PropRelationChildTypeAlias, PropRelationChildPropertyName, PropRelationChildLoadType, PropMetadata_FieldType,
        PropMetadata_FieldLength, PropMetadata_FieldPrecision, PropMetadata_FieldScale, PropMetadata_FieldNotNull, PropMetadata_Default,
        PropMetadata_FieldUnicode, PropMetadata_CustomFieldType, PropMetadata_FieldSubType, PropMetadata_FKAutoCreate, PropMetadata_FKOnDeleteAction,
        PropMetadata_FKOnUpdateAction));
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

class function TioContextFactory.Table(const Typ: TRttiInstanceType): IioContextTable;
var
  LAttr: TCustomAttribute;
  LTableName, LConnectionDefName, LKeyGenerator: String;
  LTrueClass: IioTrueClass;
  LJoins: IioJoins;
  LGroupBy: IioGroupBy;
  LMapMode: TioMapModeType;
  LIndexList: TioIndexList;
  LAutoCreateDB: Boolean;
begin
  try
    // Prop Init
    LTableName := Typ.MetaclassType.ClassName.Substring(1);
    // Elimina il primo carattere (di solito la T)
    LConnectionDefName := '';
    LKeyGenerator := '';
    LJoins := Self.Joins;
    LTrueClass := nil;
    LGroupBy := nil;
    LMapMode := mmProperties;
    LIndexList := nil;
    LAutoCreateDB := True;
    // Check attributes
    for LAttr in Typ.GetAttributes do
    begin
      if (LAttr is ioTable) then
      begin
        if not ioTable(LAttr).Value.IsEmpty then
          LTableName := ioTable(LAttr).Value;
        LMapMode := ioTable(LAttr).MapMode;
      end;
      if LAttr is ioKeyGenerator then
        LKeyGenerator := ioKeyGenerator(LAttr).Value;
      if LAttr is ioConnectionDefName then
        LConnectionDefName := ioConnectionDefName(LAttr).Value;
      if LAttr is ioTrueClass then
        LTrueClass := Self.TrueClass(Typ);
      if LAttr is ioJoin then
        LJoins.Add(Self.JoinItem(ioJoin(LAttr)));
      if (LAttr is ioGroupBy) and (not Assigned(LGroupBy)) then
        LGroupBy := Self.GroupBy(ioGroupBy(LAttr).Value);
      if LAttr is ioDisableAutoCreateOnDB then
        LAutoCreateDB := False;
      // Index attribute (NB: costruisce la lista di indici solo se serve e così anche nella mappa)
      if LAttr is ioIndex then
      begin
        if not Assigned(LIndexList) then
          LIndexList := TioIndexList.Create;
        LIndexList.Add(ioIndex(LAttr));
      end;
    end;
    // Create result Properties object
    Result := TioContextTable.Create(LTableName, LKeyGenerator, LTrueClass, LJoins, LGroupBy, LConnectionDefName, LMapMode, LAutoCreateDB, Typ);
    // If an IndexList is present then assign it to the ioTable
    if Assigned(LIndexList) and (LIndexList.Count > 0) then
      Result.SetIndexList(LIndexList);
  finally
    // Free the IndexList if necessary
    if Assigned(LIndexList) and (LIndexList.Count = 0) then
      FreeAndNil(LIndexList);
  end;
end;

end.
