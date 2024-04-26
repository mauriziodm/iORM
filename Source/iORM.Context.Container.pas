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
unit iORM.Context.Container;

interface

uses
  System.Rtti,
  iORM.CommonTypes,
  iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces,
  System.Classes, System.TypInfo, System.Generics.Collections, iORM.Utilities;

type

  // Class representing a slot for a Context (ioContexts) (lazy)
  TioMapSlot = class
  strict private
    FClassRef: TioClassRef;
    FMap: IioMap;
  public
    constructor CreateByClassRef(const AClassRef: TioClassRef);
    constructor CreateByMap(const AMap: IioMap);
    function GetClassRef: TioClassRef;
    function GetMap: IioMap;
  end;

  // Real ContextContainer instance
  TioMapContainerInstance = TObjectDictionary<String, TioMapSlot>;

  // Class for external access to the ContextContainer
  // The ContextContainer contain all the Entities of the application
  // for efficient ClassRef reference and is initializated at the start
  // of the application itself
  TioMapContainer = class
  strict private
    class var FInternalContainer: TioMapContainerInstance;
    class var FAutodetectedHasManyRelationCollection: TList<IioProperty>;
    /// This method is the starting point from where iORM, at the start of the application,
    ///  begins to detect and register the classes (both the entities but not only the classes
    ///  that must only be registered in the Dependency Injection Container) to be able to perform its functions
    class procedure Init;
    /// This method map all entities in the MapContainer
    ///  NB: Register enumeration type decorated with [ioEnumerated] also.
    class procedure RegisterClassesInMapContainer;
    /// This method registers the classes in the MapContainer (entities only) and also
    ///  in the Dependency Injection Container (also non entities) based on the attributes
    ///   with which the classes have been decorated.
    class procedure RegisterClassesInDependencyInjectionContainerByAttributes;
    /// This method build all TrueClassVirtualMaps for all entities and register
    ///  the current map as descendant of all it's ancestor entities
    class procedure BuildTrueClassVirtualMapsAndRegisterAsDescendant;
  public
    /// This method creates the internal container instance and initiates its initialization
    class procedure _Build;
    class procedure _CleanUp;
    class procedure AddClassRef(const AClassRef: TioClassRef);
    /// This function create and add (to the MapContainer) the TrueTypeVirtualMap for the base class map received as parameter
    ///  and return it as result
    class function AddTrueClassVirtualMap(const AMap: IioMap): IioMap;
    class function GetContainer: TioMapContainerInstance;
    class function Exist(const AClassName: String): Boolean;
    class function GetClassRef(const AClassName: String): TioClassRef;
    class function GetConnectionDefName(const AClassName: String): String;
    class function GetMap(const AClassName: String; const RaiseAnExceptionIfNotFound: Boolean = True): IioMap;
    class function GetAutodetectedHasManyRelationCollection: TList<IioProperty>;
  end;

  // Enumerated container
  TioEnumContainer = class
  strict private
    class var FInternalContainer: TObjectDictionary<TRttiEnumerationType, TStrings>;
    class procedure _LoadValuesByString(const ARttiEnumerationType: TRttiEnumerationType; const ACommaSepValues: String; const ATargetStrings: TStrings); static;
    class function _LoadValuesByAttribute(const ARttiEnumerationType: TRttiEnumerationType): TStrings; static;
  public
    // Internal use recommended
    class procedure _Build; static;
    class procedure _CleanUp; static;
    class procedure _AddByAttribute(const ARttiEnumerationType: TRttiEnumerationType); static;
    class procedure _AddByString(const ARttiEnumerationType: TRttiEnumerationType; const ACommaSepValues: String); static;
    class function _Contains(const ARttiEnumerationType: TRttiEnumerationType): Boolean; static;
    class procedure _FillStrings(const ARttiEnumerationType: TRttiEnumerationType; const ATargetStrings: TStrings); static;
    class function _OrdinalToString(const ARttiEnumerationType: TRttiEnumerationType; const AOrdinalValue: Byte): String; static;
    class function _OrdinalToStringAsTValue(const ARttiEnumerationType: TRttiEnumerationType; const AOrdinalValue: Byte): TValue; static;
    class procedure _Remove(const ARttiEnumerationType: TRttiEnumerationType); static;
    class function _StringToOrdinal(const ARttiEnumerationType: TRttiEnumerationType; const AStringValue: String): Byte; static;
    class function _StringToOrdinalAsTValue(const ARttiEnumerationType: TRttiEnumerationType; const AStringValue: String): TValue; static;
    class procedure _UpdateByString(const ARttiEnumerationType: TRttiEnumerationType; const ACommaSepValues: String); static;
  end;

  // Enumerated external item
  TioEnumContainerExRef = class of TioEnumContainerEx;
  TioEnumContainerEx = class
  strict private
    type TioEnumsContainerRaiseTrigger = (ecrtNone, ecrtExists, ecrtNotExists);
    class function _GetRttiEnumerationTypeByGeneric<T>(const ARaiseTrigger: TioEnumsContainerRaiseTrigger): TRttiEnumerationType; static;
    class function _GetRttiEnumerationTypeByTypeInfo(const ATypeInfo: PTypeInfo; const ARaiseTrigger: TioEnumsContainerRaiseTrigger): TRttiEnumerationType; static;
    class function _GetRttiEnumerationTypeByTypeName(const AQualifiedTypeName: String; const ARaiseTrigger: TioEnumsContainerRaiseTrigger): TRttiEnumerationType; static;
    class procedure _RaiseIfRttiEnumerationTypeAlreadyExists(const ARttiEnumerationType: TRttiEnumerationType); static;
    class procedure _RaiseIfRttiEnumerationTypeDoesNotExists(const ARttiEnumerationType: TRttiEnumerationType); static;
  public
    class procedure Add<T>(const ACommaSepValues: String); overload;
    class procedure Add(const AEnumTypeInfo: PTypeInfo; const ACommaSepValues: String); overload;
    class procedure Add(const AEnumQualifiedTypeName: String; const ACommaSepValues: String); overload;
    class procedure AddOrUpdate<T>(const ACommaSepValues: String); overload;
    class procedure AddOrUpdate(const AEnumTypeInfo: PTypeInfo; const ACommaSepValues: String); overload;
    class procedure AddOrUpdate(const AEnumQualifiedTypeName: String; const ACommaSepValues: String); overload;
    class function Contains<T>: Boolean; overload;
    class function Contains(const AEnumTypeInfo: PTypeInfo): Boolean; overload;
    class function Contains(const AEnumQualifiedTypeName: String): Boolean; overload;
    class procedure FillStrings<T>(const ATargetStrings: TStrings); overload;
    class procedure FillStrings(const AEnumTypeInfo: PTypeInfo; const ATargetStrings: TStrings); overload;
    class procedure FillStrings(const AEnumQualifiedTypeName: String; const ATargetStrings: TStrings); overload;
    class function OrdinalToString<T>(const AOrdinalValue: Byte): String; overload;
    class function OrdinalToString(const AEnumTypeInfo: PTypeInfo; const AOrdinalValue: Byte): String; overload;
    class function OrdinalToString(const AEnumQualifiedTypeName: String; const AOrdinalValue: Byte): String; overload;
    class procedure Remove<T>; overload;
    class procedure Remove(const AEnumTypeInfo: PTypeInfo); overload;
    class procedure Remove(const AEnumQualifiedTypeName: String); overload;
    class function StringToOrdinal<T>(const AStringValue: String): Byte; overload;
    class function StringToOrdinal(const AEnumTypeInfo: PTypeInfo; const AStringValue: String): Byte; overload;
    class function StringToOrdinal(const AEnumQualifiedTypeName: String; const AStringValue: String): Byte; overload;
    class procedure Update<T>(const ACommaSepValues: String); overload;
    class procedure Update(const AEnumTypeInfo: PTypeInfo; const ACommaSepValues: String); overload;
    class procedure Update(const AEnumQualifiedTypeName: String; const ACommaSepValues: String); overload;
  end;

implementation

uses
  iORM.Context.Factory, iORM.Exceptions,
  iORM.RttiContext.Factory, iORM.Attributes, iORM, System.SysUtils, iORM.DependencyInjection;

{ TioContextContainer }

class procedure TioMapContainer.AddClassRef(const AClassRef: TioClassRef);
begin
  if not Exist(AClassRef.ClassName) then
    FInternalContainer.Add(AClassRef.ClassName.ToUpper, TioMapSlot.CreateByClassRef(AClassRef));
end;

class function TioMapContainer.AddTrueClassVirtualMap(const AMap: IioMap): IioMap;
var
  LMapName: String;
begin
  Result := nil;
  // Compose the TrueTypeVirtualMap name
  //  Note: TCVM stands for  "True Class Virtual Map"
  LMapName := TRUECLASS_VIRTUALMAP_NAME_PREFIX + AMap.GetClassName;
  // If the virtual map is non already present then create and register it
  if Exist(LMapName) then
    Result := GetMap(LMapName)
  else
  begin
    Result := AMap.DuplicateToTrueClassMap;
    FInternalContainer.Add(LMapName.ToUpper, TioMapSlot.CreateByMap(Result));
  end;
end;

class procedure TioMapContainer._Build;
begin
  FInternalContainer := TioMapContainerInstance.Create([doOwnsValues]);
  TioMapContainer.Init;
end;

class procedure TioMapContainer.BuildTrueClassVirtualMapsAndRegisterAsDescendant;
var
  LKey: String;
  LKeyArray: TArray<String>;
  LMap: IioMap;
  procedure _AutoregisterAsDescendantClass;
  var
    LCurrentRttiType: TRttiInstanceType;
    LFarAncestorClass: TRttiInstanceType;
  begin
    LCurrentRttiType := LMap.RttiType.BaseType;
    while Assigned(LCurrentRttiType) do
    begin
      // If the current class is an entity then register the original map (LMap) as descendant of it
      if Exist(LCurrentRttiType.Name) then
      begin
        LFarAncestorClass := TioUtilities.GetFarAncestorEntityWithSameTableAndConnection(LMap.RttiType);
        io.di.RegisterClass(LMap.RttiType).AsDescendantClassOf(LCurrentRttiType.Name, DI_ENTITY_AUTOREGISTER_SUBKEY_PREFIX + LMap.RttiType.Name).AsEntity.
        _SetFarAncestorClassSameInterfaceAndTableAndConnection(LFarAncestorClass.Name).Execute;
      end;
      LCurrentRttiType := LCurrentRttiType.BaseType;
    end;
  end;
begin
  // Cicla per tutte le mappe (tutte le entities mappate)
  // ATT/NE: Prima estraggo l'elenco delle chiavi (array) e poi ciclo su quello, faccio così
  //          perchè se ciclavo direttamente sul dictionary (FInternalContainer) c'erano
  //          problemi perchè aggiungendo le TrueClassVirtualMap si sballava l'ordine
  //          del ciclo, passava più volte sulla stessa mappa e magari non passava per niente in altre.
  //          Facendo così invece va bene
  LKeyArray := FInternalContainer.Keys.ToArray;
  for LKey in LKeyArray do
  begin
    LMap := FInternalContainer.Items[LKey].GetMap;
    // Evita di elaborare le TrueClassVirtualMaps
    if not LMap.IsTrueClassVirtualMap then
    begin
      // Crea a registra una nuova TrueClassVirtualMap
      LMap.BuildTrueClassVirtualMap;
      // Autoregister the current LMap as descendant of all it's ancestor entities
      _AutoregisterAsDescendantClass;
    end;
  end;
end;

class procedure TioMapContainer._CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioMapContainer.Exist(const AClassName: String): Boolean;
begin
  Result := FInternalContainer.ContainsKey(AClassName.ToUpper);
end;

class function TioMapContainer.GetAutodetectedHasManyRelationCollection: TList<IioProperty>;
begin
  Result := FAutodetectedHasManyRelationCollection;
end;

class function TioMapContainer.GetClassRef(const AClassName: String): TioClassRef;
begin
  if Self.Exist(AClassName) then
    Result := FInternalContainer.Items[AClassName.ToUpper].GetClassRef
  else
    raise EioGenericException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class function TioMapContainer.GetConnectionDefName(const AClassName: String): String;
begin
  if Self.Exist(AClassName) then
    Result := FInternalContainer.Items[AClassName.ToUpper].GetMap.GetTable.GetConnectionDefName
  else
    raise EioGenericException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class function TioMapContainer.GetContainer: TioMapContainerInstance;
begin
  Result := FInternalContainer;
end;

class function TioMapContainer.GetMap(const AClassName: String; const RaiseAnExceptionIfNotFound: Boolean): IioMap;
begin
  Result := nil;
  if Exist(AClassName) then
    Result := FInternalContainer.Items[AClassName.ToUpper].GetMap
  else if RaiseAnExceptionIfNotFound then
    raise EioGenericException.Create(ClassName, 'GetMap', Format('Oops!'#13#13'Hi, I''m iORM, I''m sorry but there is a problem.' +
      #13#13'I would need the map of class "%s" but can''t find it in my collection of mapped classes/entities.' +
      #13#13'May be that you forgot to decorate the class with the "[ioEntity]" attribute on it.' +
      #13#13'Also make sure that you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit where the class is declared.' +
      #13#13'Or it could also be that you have declared a class (or an interface) but there are no direct references to it in the code (it means that you have done a good job of abstraction and decoupling).' +
      #13#13'In this case you can solve the problem by inserting the {$STRONGLINKTYPES ON} directive somewhere in the code (project file is fine) or a fake reference to the class, for this purpose iORM provides the ' +
      '"TioUtilities.StopLinkerRemoval" method in the "iORM.Utilities" unit.' +
      #13#13'Check and try again please, it will work.', [AClassName]));
end;

/// This method is the starting point from where iORM, at the start of the application,
///  begins to detect and register the classes (both the entities but not only the classes
///  that must only be registered in the Dependency Injection Container) to be able to perform its functions
class procedure TioMapContainer.Init;
begin
  // Create the temporary collection of autodetected hasmany relation virtual properties
  FAutodetectedHasManyRelationCollection := TList<IioProperty>.Create;
  try
    // This method registers the classes in the Dependency Injection Container (also non entities) based on the attributes
    //   with which the classes have been decorated.
    RegisterClassesInDependencyInjectionContainerByAttributes;
    // This method map all entities in the MapContainer
    RegisterClassesInMapContainer;
    // Generate childs virtual properties related to autodetected HasMany relations
    TioContextFactory.GenerateAutodetectedHasManyRelationVirtualPropertyOnDetails;
    // This method build all TrueClassVirtualMaps for all entities
    BuildTrueClassVirtualMapsAndRegisterAsDescendant;
  finally
    FreeAndNil(FAutodetectedHasManyRelationCollection);
  end;
end;

/// This method registers the classes in the MapContainer (entities only) and also
///  in the Dependency Injection Container (also non entities) based on the attributes
///   with which the classes have been decorated.
class procedure TioMapContainer.RegisterClassesInDependencyInjectionContainerByAttributes;
type
  TdiVVMforItemType = (vvmitRegular, vvmitSimpleView, vvmitView, vvmitViewModel);

  TdiImplementsItem = record
    ItemType: TdiVVMforItemType;
    IID: TGUID;
    Alias: String;
  end;

  TdiVVMforItem = record
    ItemType: TdiVVMforItemType;
    Target: String;
    Alias: String;
  end;
var
  LRttiType: TRttiType;
  procedure _DIC_AutoregisterClass(const ACurrentRttiInstanceType: TRttiInstanceType);
  var
    LAttr: TCustomAttribute;
    LIsAnEntity: Boolean;
    LdiRegister: Boolean;
    LdiRegisterAsInterfacedEntity: Boolean;
    LdiAsSingleton: Boolean;
    LdiImplements: array of TdiImplementsItem;
    LdiVVMforItems: array of TdiVVMforItem;
    LdiImplementedInterfaces: TArray<TRttiInterfaceType>;
    Index: Integer;
    LFarAncestorClass: TRttiInstanceType;
  begin
    // Init
    LIsAnEntity := False;
    LdiRegister := False;
    LdiRegisterAsInterfacedEntity := True;
    LdiAsSingleton := False;
    SetLength(LdiImplements, 0);
    // Loop for attributes
    for LAttr in ACurrentRttiInstanceType.GetAttributes do
    begin
      // ioEntity attribute (it means it is an entity class)
      if TioUtilities.isEntityAttribute(LAttr) then
        LIsAnEntity := True
      else
      // DIC - diRegister
      if LAttr is diRegister then
        LdiRegister := True
      else
      // DIC - diDoNotRegisterAsInterfacedEntity
      if LAttr is diDoNotRegisterAsInterfacedEntity then
        LdiRegisterAsInterfacedEntity := False
      else
      // DIC - diIsSingleton
      if LAttr is diAsSingleton then
        LdiAsSingleton := True
      else
      // DIC - diSimpleViewImplements
      if LAttr is diSimpleViewImplements then
      begin
        Index := Length(LdiImplements);
        SetLength(LdiImplements, Index + 1);
        LdiImplements[Index].ItemType := vvmitSimpleView;
        LdiImplements[Index].IID := diImplements(LAttr).IID;
        LdiImplements[Index].Alias := diImplements(LAttr).Alias;
      end
      else
      // DIC - diViewImplements
      if LAttr is diViewImplements then
      begin
        Index := Length(LdiImplements);
        SetLength(LdiImplements, Index + 1);
        LdiImplements[Index].ItemType := vvmitView;
        LdiImplements[Index].IID := diImplements(LAttr).IID;
        LdiImplements[Index].Alias := diImplements(LAttr).Alias;
      end
      else
      // DIC - diViewModelImplements
      if LAttr is diViewModelImplements then
      begin
        Index := Length(LdiImplements);
        SetLength(LdiImplements, Index + 1);
        LdiImplements[Index].ItemType := vvmitViewModel;
        LdiImplements[Index].IID := diImplements(LAttr).IID;
        LdiImplements[Index].Alias := diImplements(LAttr).Alias;
      end
      else
      // DIC - diImplements (NB: Questo deve essere dopo diSimpleViewImplements, diViewImplements, diViewModelImplements)
      if LAttr is diImplements then
      begin
        Index := Length(LdiImplements);
        SetLength(LdiImplements, Index + 1);
        LdiImplements[Index].ItemType := vvmitRegular;
        LdiImplements[Index].IID := diImplements(LAttr).IID;
        LdiImplements[Index].Alias := diImplements(LAttr).Alias;
      end
      else
      // DIC - diSimpleViewFor
      if LAttr is diSimpleViewFor then
      begin
        Index := Length(LdiVVMforItems);
        SetLength(LdiVVMforItems, Index + 1);
        LdiVVMforItems[Index].ItemType := vvmitSimpleView;
        LdiVVMforItems[Index].Target := diViewFor(LAttr).TargetTypeName;
        LdiVVMforItems[Index].Alias := diViewFor(LAttr).TargetTypeAlias;
      end
      else
      // DIC - diViewFor
      if LAttr is diViewFor then
      begin
        Index := Length(LdiVVMforItems);
        SetLength(LdiVVMforItems, Index + 1);
        LdiVVMforItems[Index].ItemType := vvmitView;
        LdiVVMforItems[Index].Target := diViewFor(LAttr).TargetTypeName;
        LdiVVMforItems[Index].Alias := diViewFor(LAttr).TargetTypeAlias;
      end
      else
      // DIC - diViewModelFor
      if LAttr is diViewModelFor then
      begin
        Index := Length(LdiVVMforItems);
        SetLength(LdiVVMforItems, Index + 1);
        LdiVVMforItems[Index].ItemType := vvmitViewModel;
        LdiVVMforItems[Index].Target := diViewModelFor(LAttr).TargetTypeName;
        LdiVVMforItems[Index].Alias := diViewModelFor(LAttr).TargetTypeAlias;
      end;
    end;
    // If it is an entity then register itself in the DIC
    if LIsAnEntity then
    begin
      LFarAncestorClass := TioUtilities.GetFarAncestorEntityWithSameTableAndConnection(ACurrentRttiInstanceType);
      io.di.RegisterClass(ACurrentRttiInstanceType)._SetFarAncestorClassSameInterfaceAndTableAndConnection(LFarAncestorClass.Name).AsEntity.Execute;
    end;
    // Dependency Injection Container - Auto register the class for the resolver (persistence only) to use for load, persist, delete only
    if LIsAnEntity and LdiRegisterAsInterfacedEntity then
    begin
      // NB: Ho provato anche con il metodo "GetDeclaredImplementedInterfaces" ma non venivano gestine bene
      //      alcune situazioni particolari e perdeva dei pezzi
      LdiImplementedInterfaces := ACurrentRttiInstanceType.GetImplementedInterfaces;
      for Index := Low(LdiImplementedInterfaces) to High(LdiImplementedInterfaces) do
        if (LdiImplementedInterfaces[Index].GUID <> IInterface) then // NB: Controllare per IInvokable ho visto che non serve perchè non ha un suo GUID
        begin
          LFarAncestorClass := TioUtilities.GetFarAncestorEntityImplementingInterfaceSameTableAndConnection(ACurrentRttiInstanceType, LdiImplementedInterfaces[Index].GUID);
          io.di.RegisterClass(ACurrentRttiInstanceType).Implements(LdiImplementedInterfaces[Index].GUID, DI_ENTITY_AUTOREGISTER_SUBKEY_PREFIX + ACurrentRttiInstanceType.Name)._SetFarAncestorClassSameInterfaceAndTableAndConnection
            (LFarAncestorClass.Name).AsEntity.Execute;
        end;
    end;
    // Dependency Injection Container - Register the class as is without any interface
    if LdiRegister then
      io.di.RegisterClass(ACurrentRttiInstanceType).AsSingleton(LdiAsSingleton).Execute;
    // Dependency Injection Container - Register the class as implenter of the interfaces
    if Length(LdiImplements) > 0 then
      for Index := Low(LdiImplements) to High(LdiImplements) do
      begin
        case LdiImplements[Index].ItemType of
          vvmitSimpleView:
            io.di.RegisterClass(ACurrentRttiInstanceType).AsSimpleView.Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
          vvmitView:
            io.di.RegisterClass(ACurrentRttiInstanceType).AsView.Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
          vvmitViewModel:
            io.di.RegisterClass(ACurrentRttiInstanceType).AsViewModel.Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
        else
          io.di.RegisterClass(ACurrentRttiInstanceType).Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
        end;
     end;
    // Dependency Injection Container - Register the class as View or ViewModel for som other classes
    if Length(LdiVVMforItems) > 0 then
      for Index := Low(LdiVVMforItems) to High(LdiVVMforItems) do
      begin
        case LdiVVMforItems[Index].ItemType of
          vvmitSimpleView:
            io.di.RegisterClass(ACurrentRttiInstanceType).AsSimpleViewFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
          vvmitView:
            io.di.RegisterClass(ACurrentRttiInstanceType).AsViewFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
          vvmitViewModel:
            io.di.RegisterClass(ACurrentRttiInstanceType).AsViewModelFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
        end;
      end;
  end;

begin
  // Loop for all classes detecting attributes to register the current class into the MapContainer and into the DIC
  for LRttiType in TioRttiFactory.GetRttiContext.GetTypes do
    if LRttiType.IsInstance then
      _DIC_AutoregisterClass(LRttiType.AsInstance);
end;

/// This method map all entities in the MapContainer
class procedure TioMapContainer.RegisterClassesInMapContainer;
var
  LRttiType: TRttiType;
begin
  // Loop for all classes detecting attributes to register the current class into the MapContainer and into the DIC
  //  NB: Register enumeration type decorated with [ioEnumerated] also.
  for LRttiType in TioRttiFactory.GetRttiContext.GetTypes do
  begin
    if LRttiType.IsInstance and TioUtilities.isEntityType(LRttiType) then
      AddClassRef(LRttiType.AsInstance.MetaclassType)
    else
    if (LRttiType is TRttiEnumerationType) and TioUtilities.HasAttribute(LRttiType, ioEnumerated) then
      TioEnumContainer._AddByAttribute(TRttiEnumerationType(LRttiType));
  end;
end;

{ TioContextSlot }

constructor TioMapSlot.CreateByClassRef(const AClassRef: TioClassRef);
begin
  inherited Create;
  FClassRef := AClassRef;
  FMap := TioContextFactory.Map(FClassRef);
end;

constructor TioMapSlot.CreateByMap(const AMap: IioMap);
begin
  inherited Create;
  FClassRef := AMap.GetClassRef;
  FMap := AMap;
end;

function TioMapSlot.GetClassRef: TioClassRef;
begin
  Result := FClassRef;
end;

function TioMapSlot.GetMap: IioMap;
begin
  Result := FMap;
end;

{ TioEnumerationContainer }

class procedure TioEnumContainer._AddByAttribute(const ARttiEnumerationType: TRttiEnumerationType);
begin
  FInternalContainer.Add(ARttiEnumerationType, _LoadValuesByAttribute(ARttiEnumerationType));
end;

class procedure TioEnumContainer._AddByString(const ARttiEnumerationType: TRttiEnumerationType; const ACommaSepValues: String);
var
  LStrings: TStrings;
begin
  LStrings := TStringList.Create;
  _LoadValuesByString(ARttiEnumerationType, ACommaSepValues, LStrings);
  FInternalContainer.Add(ARttiEnumerationType, LStrings);
end;

class procedure TioEnumContainer._Build;
begin
  FInternalContainer := TObjectDictionary<TRttiEnumerationType, TStrings>.Create([doOwnsValues]);
end;

class procedure TioEnumContainer._CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioEnumContainer._Contains(const ARttiEnumerationType: TRttiEnumerationType): Boolean;
begin
  Result := FInternalContainer.ContainsKey(ARttiEnumerationType);
end;

class function TioEnumContainer._OrdinalToString(const ARttiEnumerationType: TRttiEnumerationType; const AOrdinalValue: Byte): String;
begin
  if AOrdinalValue <= ARttiEnumerationType.MaxValue then
    Result := FInternalContainer.Items[ARttiEnumerationType][AOrdinalValue]
  else
    raise EioGenericException.Create(ClassName, 'OrdinalToString',
      Format('Ordinal value %d is out of range for %s enumerated type', [AOrdinalValue, ARttiEnumerationType.Name]));
end;

class function TioEnumContainer._OrdinalToStringAsTValue(const ARttiEnumerationType: TRttiEnumerationType; const AOrdinalValue: Byte): TValue;
begin
  Result := TValue.From<String>( _OrdinalToString(ARttiEnumerationType, AOrdinalValue) );
end;

class procedure TioEnumContainer._Remove(const ARttiEnumerationType: TRttiEnumerationType);
begin
  FInternalContainer.Remove(ARttiEnumerationType);
end;

class function TioEnumContainer._StringToOrdinal(const ARttiEnumerationType: TRttiEnumerationType; const AStringValue: String): Byte;
var
  LIndexOf: Smallint;
begin
  LIndexOf := FInternalContainer.Items[ARttiEnumerationType].IndexOf(AStringValue);
  if LIndexOf > -1 then
    Result := LIndexOf
  else
    raise EioGenericException.Create(ClassName, 'StringToOrdinal',
      Format('"%s" string value not found for %s enumerated type', [AStringValue, ARttiEnumerationType.Name]));
end;

class function TioEnumContainer._StringToOrdinalAsTValue(const ARttiEnumerationType: TRttiEnumerationType; const AStringValue: String): TValue;
begin
  Result := TValue.FromOrdinal(ARttiEnumerationType.Handle, _StringToOrdinal(ARttiEnumerationType, AStringValue));
end;

class procedure TioEnumContainer._UpdateByString(const ARttiEnumerationType: TRttiEnumerationType; const ACommaSepValues: String);
begin
  _LoadValuesByString(ARttiEnumerationType, ACommaSepValues, FInternalContainer.Items[ARttiEnumerationType]);
end;

class procedure TioEnumContainer._FillStrings(const ARttiEnumerationType: TRttiEnumerationType; const ATargetStrings: TStrings);
begin
  ATargetStrings.Text := FInternalContainer.Items[ARttiEnumerationType].Text;
end;

class function TioEnumContainer._LoadValuesByAttribute(const ARttiEnumerationType: TRttiEnumerationType): TStrings;
var
  LEnumeratedAttribute: ioEnumerated;
begin
  LEnumeratedAttribute := TioUtilities.GetAttribute(ARttiEnumerationType, ioEnumerated) as ioEnumerated;
  // Check the presence of the [ioEnumerated] attribute
  //  NB: Se arriva qui significa che dovrebbe esserci l'attributo  , se non c'è significa che c'è un errore
  //       da qualche parte, molto probabilmente  su iORM
  if not Assigned(LEnumeratedAttribute) then
    raise EioGenericException.Create(ClassName, 'LoadValues',
      Format('Attribute [ioEnumerated] not found on type "%s".',
        [ARttiEnumerationType.Name]));
  // Create and fill the StringList
  Result := TStringList.Create;
  _LoadValuesByString(ARttiEnumerationType, LEnumeratedAttribute.Value, Result);
end;

class procedure TioEnumContainer._LoadValuesByString(const ARttiEnumerationType: TRttiEnumerationType; const ACommaSepValues: String; const ATargetStrings: TStrings);
var
  I: Integer;
begin
  // Load StringValues into the Strings object
  ATargetStrings.Clear;
  // If ACommaSepValues is not empty then load values from ACommaSepValues param
  if not ACommaSepValues.Trim.IsEmpty then
  begin
    ATargetStrings.Delimiter := ',';
    ATargetStrings.QuoteChar := #0;
    ATargetStrings.StrictDelimiter := True;
    ATargetStrings.DelimitedText := ACommaSepValues;
    // Check the number of string values in the attribute
    if (ATargetStrings.Count > 0) and (ATargetStrings.Count <> ARttiEnumerationType.MaxValue+1) then
      raise EioGenericException.Create(ClassName, '_LoadValuesByString',
        Format('The number of elements specified in the comma separated string does not match the number of values allowed in the enumerated type "%s"',
          [ARttiEnumerationType.Name]));
  end
  // else load values from the enumerated type
  else
    for I := 0 to ARttiEnumerationType.MaxValue do
        ATargetStrings.Add( GetEnumName(ARttiEnumerationType.Handle, I) );
  // Trim all lines
  TioUtilities.TrimStrings(ATargetStrings);
end;

{ TioEnumsContainerEx }

class function TioEnumContainerEx._GetRttiEnumerationTypeByGeneric<T>(const ARaiseTrigger: TioEnumsContainerRaiseTrigger): TRttiEnumerationType;
var
  LRttiType: TRttiType;
begin
  LRttiType := TioRttiFactory.GetRttiTypeByTypeInfo(TypeInfo(T));
  if LRttiType is TRttiEnumerationType then
    Result := TRttiEnumerationType(LRttiType)
  else
    raise EioGenericException.Create(ClassName, '_GetRttiEnumerationTypeByGeneric', Format('"%s" (T) is not an enumerated type', [TioUtilities.GenericToString<T>]));
  case ARaiseTrigger of
    ecrtExists:
      _RaiseIfRttiEnumerationTypeAlreadyExists(Result);
    ecrtNotExists:
      _RaiseIfRttiEnumerationTypeDoesNotExists(Result);
  end;
end;

class function TioEnumContainerEx._GetRttiEnumerationTypeByTypeInfo(const ATypeInfo: PTypeInfo; const ARaiseTrigger: TioEnumsContainerRaiseTrigger): TRttiEnumerationType;
var
  LRttiType: TRttiType;
begin
  LRttiType := TioRttiFactory.GetRttiTypeByTypeInfo(ATypeInfo);
  if LRttiType is TRttiEnumerationType then
    Result := TRttiEnumerationType(LRttiType)
  else
    raise EioGenericException.Create(ClassName, '_GetRttiEnumerationTypeByTypeInfo', Format('"%s" is not an enumerated type', [TioUtilities.TypeInfoToTypeName(ATypeInfo)]));
end;

class function TioEnumContainerEx._GetRttiEnumerationTypeByTypeName(const AQualifiedTypeName: String; const ARaiseTrigger: TioEnumsContainerRaiseTrigger): TRttiEnumerationType;
var
  LRttiType: TRttiType;
begin
  LRttiType := TioRttiFactory.GetRttiTypeByTypeName(AQualifiedTypeName);
  if LRttiType is TRttiEnumerationType then
    Result := TRttiEnumerationType(LRttiType)
  else
    raise EioGenericException.Create(ClassName, '_GetRttiEnumerationTypeByTypeName', Format('"%s" is not an enumerated type', [AQualifiedTypeName]));
end;

class procedure TioEnumContainerEx._RaiseIfRttiEnumerationTypeAlreadyExists(const ARttiEnumerationType: TRttiEnumerationType);
begin
  if TioEnumContainer._Contains(ARttiEnumerationType) then
    raise EioGenericException.Create(ClassName, '_RaiseIfRttiEnumerationTypeAlreadyExists',
      Format('"%s" enumerated type already registered in the iORM EnumsCountainer', [ARttiEnumerationType.Name]));
end;

class procedure TioEnumContainerEx._RaiseIfRttiEnumerationTypeDoesNotExists(const ARttiEnumerationType: TRttiEnumerationType);
begin
  if not TioEnumContainer._Contains(ARttiEnumerationType) then
    raise EioGenericException.Create(ClassName, '_RaiseIfRttiEnumerationTypeDoesNotExists',
      Format('"%s" enumerated type does not exists in the iORM EnumsCountainer', [ARttiEnumerationType.Name]));
end;

class procedure TioEnumContainerEx.Add(const AEnumTypeInfo: PTypeInfo; const ACommaSepValues: String);
begin
  TioEnumContainer._AddByString(_GetRttiEnumerationTypeByTypeInfo(AEnumTypeInfo, ecrtExists), ACommaSepValues);
end;

class procedure TioEnumContainerEx.Add(const AEnumQualifiedTypeName, ACommaSepValues: String);
begin
  TioEnumContainer._AddByString(_GetRttiEnumerationTypeByTypeName(AEnumQualifiedTypeName, ecrtExists), ACommaSepValues);
end;

class procedure TioEnumContainerEx.Add<T>(const ACommaSepValues: String);
begin
  TioEnumContainer._AddByString(_GetRttiEnumerationTypeByGeneric<T>(ecrtExists), ACommaSepValues);
end;

class procedure TioEnumContainerEx.AddOrUpdate(const AEnumTypeInfo: PTypeInfo; const ACommaSepValues: String);
begin
  if Contains(AEnumTypeInfo) then
    Add(AEnumTypeInfo, ACommaSepValues)
  else
    Update(AEnumTypeInfo, ACommaSepValues)
end;

class procedure TioEnumContainerEx.AddOrUpdate(const AEnumQualifiedTypeName, ACommaSepValues: String);
begin
  if Contains(AEnumQualifiedTypeName) then
    Add(AEnumQualifiedTypeName, ACommaSepValues)
  else
    Update(AEnumQualifiedTypeName, ACommaSepValues)
end;

class procedure TioEnumContainerEx.AddOrUpdate<T>(const ACommaSepValues: String);
begin
  if Contains<T> then
    Add<T>(ACommaSepValues)
  else
    Update<T>(ACommaSepValues)
end;

class function TioEnumContainerEx.Contains(const AEnumTypeInfo: PTypeInfo): Boolean;
begin
  Result := TioEnumContainer._Contains(_GetRttiEnumerationTypeByTypeInfo(AEnumTypeInfo, ecrtNone));
end;

class function TioEnumContainerEx.Contains(const AEnumQualifiedTypeName: String): Boolean;
begin
  Result := TioEnumContainer._Contains(_GetRttiEnumerationTypeByTypeName(AEnumQualifiedTypeName, ecrtNone));
end;

class function TioEnumContainerEx.Contains<T>: Boolean;
begin
  Result := TioEnumContainer._Contains(_GetRttiEnumerationTypeByGeneric<T>(ecrtNone));
end;

class procedure TioEnumContainerEx.FillStrings(const AEnumTypeInfo: PTypeInfo; const ATargetStrings: TStrings);
begin
  TioEnumContainer._FillStrings(_GetRttiEnumerationTypeByTypeInfo(AEnumTypeInfo, ecrtNotExists), ATargetStrings);
end;

class procedure TioEnumContainerEx.FillStrings(const AEnumQualifiedTypeName: String; const ATargetStrings: TStrings);
begin
  TioEnumContainer._FillStrings(_GetRttiEnumerationTypeByTypeName(AEnumQualifiedTypeName, ecrtNotExists), ATargetStrings);
end;

class procedure TioEnumContainerEx.FillStrings<T>(const ATargetStrings: TStrings);
begin
  TioEnumContainer._FillStrings(_GetRttiEnumerationTypeByGeneric<T>(ecrtNotExists), ATargetStrings);
end;

class function TioEnumContainerEx.OrdinalToString(const AEnumTypeInfo: PTypeInfo; const AOrdinalValue: Byte): String;
begin
  Result := TioEnumContainer._OrdinalToString(_GetRttiEnumerationTypeByTypeInfo(AEnumTypeInfo, ecrtNotExists), AOrdinalValue);
end;

class function TioEnumContainerEx.OrdinalToString(const AEnumQualifiedTypeName: String; const AOrdinalValue: Byte): String;
begin
  Result := TioEnumContainer._OrdinalToString(_GetRttiEnumerationTypeByTypeName(AEnumQualifiedTypeName, ecrtNotExists), AOrdinalValue);
end;

class function TioEnumContainerEx.OrdinalToString<T>(const AOrdinalValue: Byte): String;
begin
  Result := TioEnumContainer._OrdinalToString(_GetRttiEnumerationTypeByGeneric<T>(ecrtNotExists), AOrdinalValue);
end;

class procedure TioEnumContainerEx.Remove(const AEnumTypeInfo: PTypeInfo);
begin
  TioEnumContainer._Remove(_GetRttiEnumerationTypeByTypeInfo(AEnumTypeInfo, ecrtNotExists));
end;

class procedure TioEnumContainerEx.Remove(const AEnumQualifiedTypeName: String);
begin
  TioEnumContainer._Remove(_GetRttiEnumerationTypeByTypeName(AEnumQualifiedTypeName, ecrtNotExists));
end;

class procedure TioEnumContainerEx.Remove<T>;
begin
  TioEnumContainer._Remove(_GetRttiEnumerationTypeByGeneric<T>(ecrtNotExists));
end;

class function TioEnumContainerEx.StringToOrdinal(const AEnumTypeInfo: PTypeInfo; const AStringValue: String): Byte;
begin
  Result := TioEnumContainer._StringToOrdinal(_GetRttiEnumerationTypeByTypeInfo(AEnumTypeInfo, ecrtNotExists), AStringValue);
end;

class function TioEnumContainerEx.StringToOrdinal(const AEnumQualifiedTypeName, AStringValue: String): Byte;
begin
  Result := TioEnumContainer._StringToOrdinal(_GetRttiEnumerationTypeByTypeName(AEnumQualifiedTypeName, ecrtNotExists), AStringValue);
end;

class function TioEnumContainerEx.StringToOrdinal<T>(const AStringValue: String): Byte;
begin
  Result := TioEnumContainer._StringToOrdinal(_GetRttiEnumerationTypeByGeneric<T>(ecrtNotExists), AStringValue);
end;

class procedure TioEnumContainerEx.Update(const AEnumTypeInfo: PTypeInfo; const ACommaSepValues: String);
begin
  TioEnumContainer._UpdateByString(_GetRttiEnumerationTypeByTypeInfo(AEnumTypeInfo, ecrtNotExists), ACommaSepValues);
end;

class procedure TioEnumContainerEx.Update(const AEnumQualifiedTypeName, ACommaSepValues: String);
begin
  TioEnumContainer._UpdateByString(_GetRttiEnumerationTypeByTypeName(AEnumQualifiedTypeName, ecrtNotExists), ACommaSepValues);
end;

class procedure TioEnumContainerEx.Update<T>(const ACommaSepValues: String);
begin
  TioEnumContainer._UpdateByString(_GetRttiEnumerationTypeByGeneric<T>(ecrtNotExists), ACommaSepValues);
end;

initialization

// NB: Spostato sulla initialize della unit iORM
// Create the ContextXontainer Instance and Init it by loading
// all entities declarated in the application
// TioEnumerationContainer.Build;
// TioMapContainer.Build;

finalization

TioMapContainer._CleanUp;
TioEnumContainer._CleanUp;

end.
