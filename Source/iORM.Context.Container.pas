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

unit iORM.Context.Container;

interface

uses
  System.Rtti,
  iORM.CommonTypes,
  iORM.Context.Map.Interfaces, System.Generics.Collections, iORM.Context.Properties.Interfaces,
  System.Classes;

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
  private
    class var FInternalContainer: TioMapContainerInstance;
    class var FAutodetectedHasManyRelationCollection: TList<IioProperty>;
    /// This method is the starting point from where iORM, at the start of the application,
    ///  begins to detect and register the classes (both the entities but not only the classes
    ///  that must only be registered in the Dependency Injection Container) to be able to perform its functions
    class procedure Init;
    /// This method map all entities in the MapContainer
    ///  NB: Register enumeration type decorated with [ioBindEnumAsString] also.
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
    class procedure Build;
    class procedure CleanUp;
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

  // Enumerated type string values container
  TioEnumInternalContainerValues = TArray<string>;
  PioEnumInternalContainerValues = ^TioEnumInternalContainerValues;
  TioEnumInternalContainer = TDictionary<TRttiEnumerationType, PioEnumInternalContainerValues>;
  TioEnumContainer = class
    private
      class var FInternalContainer: TioEnumInternalContainer;
      class procedure LoadValues(const ARttiEnumerationType: TRttiEnumerationType; const AEnumerationInternalContainerValuePointer: PioEnumInternalContainerValues);
    public
      /// This method creates the internal container instance and initiates its initialization
      class procedure Build;
      class procedure CleanUp;
      class procedure Add(const ARttiEnumerationType: TRttiEnumerationType);
      class function StringToOrdinal(const ARttiEnumerationType: TRttiEnumerationType; const AStringValue: String): Integer;
      class function OrdinalToString(const ARttiEnumerationType: TRttiEnumerationType; const AOrdinalValue: Integer): String;
      class procedure FillStrings(const ARttiEnumerationType: TRttiEnumerationType; const AToFillStrings: TStrings; const AAddBlank: Boolean);
  end;

implementation

uses
  iORM.Context.Factory, iORM.Exceptions,
  iORM.RttiContext.Factory, iORM.Attributes, iORM, System.SysUtils,
  iORM.Utilities, iORM.DependencyInjection, System.TypInfo;

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

class procedure TioMapContainer.Build;
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

class procedure TioMapContainer.CleanUp;
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
    raise EioException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class function TioMapContainer.GetConnectionDefName(const AClassName: String): String;
begin
  if Self.Exist(AClassName) then
    Result := FInternalContainer.Items[AClassName.ToUpper].GetMap.GetTable.GetConnectionDefName
  else
    raise EioException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
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
    raise EioException.Create(ClassName, 'GetMap', Format('Oops!'#13#13'Hi, I''m iORM, I''m sorry but there is a problem.' +
      #13#13'I would need the map of class "%s" but can''t find it in my collection of mapped classes/entities.' +
      #13#13'May be that you forgot to decorate the class with the "[ioEntity]" attribute on it.' +
      #13#13'Also make sure that you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit where the class is declared.' +
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
  //  NB: Register enumeration type decorated with [ioBindEnumAsString] also.
  for LRttiType in TioRttiFactory.GetRttiContext.GetTypes do
  begin
    if LRttiType.IsInstance and TioUtilities.isEntityType(LRttiType) then
      AddClassRef(LRttiType.AsInstance.MetaclassType)
    else
    if (LRttiType is TRttiEnumerationType) and LRttiType.HasAttribute(ioBindEnumAsString) then
      TioEnumContainer.Add(TRttiEnumerationType(LRttiType));
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

class procedure TioEnumContainer.Add(const ARttiEnumerationType: TRttiEnumerationType);
var
  LEnumerationInternalContainerValue: TioEnumInternalContainerValues;
begin
  // Fill the values as string then add it to the internal container
  LoadValues(ARttiEnumerationType, @LEnumerationInternalContainerValue);
  FInternalContainer.Add(ARttiEnumerationType, @LEnumerationInternalContainerValue);
end;

class procedure TioEnumContainer.Build;
begin
  FInternalContainer := TioEnumInternalContainer.Create;
end;

class procedure TioEnumContainer.CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioEnumContainer.OrdinalToString(const ARttiEnumerationType: TRttiEnumerationType; const AOrdinalValue: Integer): String;
var
  LEnumerationInternalContainerValue: TioEnumInternalContainerValues;
begin
  LEnumerationInternalContainerValue := TioEnumInternalContainerValues(FInternalContainer.Items[ARttiEnumerationType]);
  if AOrdinalValue <= ARttiEnumerationType.MaxValue then
    Result := LEnumerationInternalContainerValue[AOrdinalValue]
  else
  raise EioException.Create(ClassName, 'OrdinalToString',
    Format('Oops!!!#13#13''Ordinal value %d is out of range for %s enumerated type.', [AOrdinalValue, ARttiEnumerationType.Name]));
end;

class function TioEnumContainer.StringToOrdinal(const ARttiEnumerationType: TRttiEnumerationType; const AStringValue: String): Integer;
var
  LEnumerationInternalContainerValue: TioEnumInternalContainerValues;
  I: Integer;
begin
  LEnumerationInternalContainerValue := TioEnumInternalContainerValues(FInternalContainer.Items[ARttiEnumerationType]);
  for I := 0 to Length(LEnumerationInternalContainerValue)-1 do
    if LEnumerationInternalContainerValue[I].Equals(AStringValue) then
      Exit(I);
  raise EioException.Create(ClassName, 'StringToOrdinal',
    Format('Oops!!!#13#13''"%s" string value not found for %s enumerated type.', [AStringValue, ARttiEnumerationType.Name]));
end;

class procedure TioEnumContainer.FillStrings(const ARttiEnumerationType: TRttiEnumerationType; const AToFillStrings: TStrings; const AAddBlank: Boolean);
var
  LEnumerationInternalContainerValue: TioEnumInternalContainerValues;
  I: Integer;
begin
  LEnumerationInternalContainerValue := TioEnumInternalContainerValues(FInternalContainer.Items[ARttiEnumerationType]);
  if AAddBlank then
    AToFillStrings.Add('');
  for I := 0 to Length(LEnumerationInternalContainerValue)-1 do
    AToFillStrings.Add(LEnumerationInternalContainerValue[I]);
end;

class procedure TioEnumContainer.LoadValues(const ARttiEnumerationType: TRttiEnumerationType;
  const AEnumerationInternalContainerValuePointer: PioEnumInternalContainerValues);
var
  LBindEnumerationAsStringAttribute: ioBindEnumAsString;
  LEnumerationInternalContainerValue: TioEnumInternalContainerValues;
  I: Integer;
begin
  LEnumerationInternalContainerValue := AEnumerationInternalContainerValuePointer^;
  LBindEnumerationAsStringAttribute := ARttiEnumerationType.GetAttribute<ioBindEnumAsString>;
  // Check the number of string values in the attribute
  if (Length(LBindEnumerationAsStringAttribute.Values) > 0) and (Length(LBindEnumerationAsStringAttribute.Values) <> ARttiEnumerationType.MaxValue+1) then
    raise EioException.Create(ClassName, '_FillStringValuesByAttributeIfExists', Format('Hi, I''m iORM and there is a problem.'+
      #13#13'It appears that you have decorated the enumerated type "%s" with the attribute "[ioBindEnumerationAsString]" '+
      'but the number of elements entered into the attribute parameter does not match the number of values of the enumerated type.'+
      #13#13'Please correct and try again.', [ARttiEnumerationType.Name]));
  // Set the length of the array containing the string values
  SetLength(LEnumerationInternalContainerValue, ARttiEnumerationType.MaxValue+1);
  // Fill the values of the string arrays
  for I := 0 to ARttiEnumerationType.MaxValue do
    if Assigned(LBindEnumerationAsStringAttribute) then
      LEnumerationInternalContainerValue[I] := LBindEnumerationAsStringAttribute.Values[I]
    else
      LEnumerationInternalContainerValue[I] := GetEnumName(ARttiEnumerationType.Handle, I);
end;

initialization

// NB: Spostato sulla initialize della unit iORM
// Create the ContextXontainer Instance and Init it by loading
// all entities declarated in the application
// TioEnumerationContainer.Build;
// TioMapContainer.Build;

finalization

TioMapContainer.CleanUp;
TioEnumContainer.CleanUp;

end.
