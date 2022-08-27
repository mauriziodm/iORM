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
  iORM.Context.Map.Interfaces, System.Generics.Collections, iORM.Context.Properties.Interfaces;

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
    class procedure RegisterClassesInMapContainer;
    /// This method registers the classes in the MapContainer (entities only) and also
    ///  in the Dependency Injection Container (also non entities) based on the attributes
    ///   with which the classes have been decorated.
    class procedure RegisterClassesInDependencyInjectionContainerByAttributes;
    /// This method build all TrueClassVirtualMaps for all entities
    class procedure BuildTrueClassVirtualMaps;
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

implementation

uses
  iORM.Context.Factory, iORM.Exceptions,
  iORM.RttiContext.Factory, iORM.Attributes, iORM, System.SysUtils,
  iORM.Utilities, iORM.DependencyInjection;

{ TioContextContainer }

class procedure TioMapContainer.AddClassRef(const AClassRef: TioClassRef);
begin
  if not Exist(AClassRef.ClassName) then
    FInternalContainer.Add(AClassRef.ClassName, TioMapSlot.CreateByClassRef(AClassRef));
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
    FInternalContainer.Add(LMapName, TioMapSlot.CreateByMap(Result));
  end;
end;

class procedure TioMapContainer.Build;
begin
  FInternalContainer := TioMapContainerInstance.Create([doOwnsValues]);
  TioMapContainer.Init;
end;

class procedure TioMapContainer.BuildTrueClassVirtualMaps;
var
  LKey: String;
  LKeyArray: TArray<String>;
  LMapSlot: TioMapSlot;
begin
  // ATT/NE: Prima estraggo l'elenco delle chiavi (array) e poi ciclo su quello, faccio così
  //          perchè se ciclavo direttamente sul dictionary (FInternalContainer) c'erano
  //          problemi perchè aggiungendo le TrueClassVirtualMap si sballava l'ordine
  //          del ciclo, passava più volte sulla stessa mappa e magari non passava per niente in altre.
  //          Facendo così invece va bene
  LKeyArray := FInternalContainer.Keys.ToArray;
  for LKey in LKeyArray do
  begin
    LMapSlot := FInternalContainer.Items[LKey];
    if not LMapSlot.GetMap.IsTrueClassVirtualMap then
      LMapSlot.GetMap.BuildTrueClassVirtualMap;
  end;
end;

class procedure TioMapContainer.CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioMapContainer.Exist(const AClassName: String): Boolean;
begin
  Result := FInternalContainer.ContainsKey(AClassName);
end;

class function TioMapContainer.GetAutodetectedHasManyRelationCollection: TList<IioProperty>;
begin
  Result := FAutodetectedHasManyRelationCollection;
end;

class function TioMapContainer.GetClassRef(const AClassName: String): TioClassRef;
begin
  if Self.Exist(AClassName) then
    Result := FInternalContainer.Items[AClassName].GetClassRef
  else
    raise EioException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class function TioMapContainer.GetConnectionDefName(const AClassName: String): String;
begin
  if Self.Exist(AClassName) then
    Result := FInternalContainer.Items[AClassName].GetMap.GetTable.GetConnectionDefName
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
    Result := FInternalContainer.Items[AClassName].GetMap
  else if RaiseAnExceptionIfNotFound then
    raise EioException.Create(ClassName, 'GetMap', Format('Oops!'#13#13'Hi, I''m iORM, I''m sorry but there is a problem.' +
      #13#13'I would need the map of class "%s" but can''t find it in my collection of mapped classes/entities.' +
      #13#13'May be that you forgot to decorate the class with the "[ioEntity]" attribute or that it is an abstract class/entity and you did not put the "[ioAbstractEntity]" attribute on it.' +
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
    BuildTrueClassVirtualMaps;
  finally
    FreeAndNil(FAutodetectedHasManyRelationCollection);
  end;
end;

/// This method registers the classes in the MapContainer (entities only) and also
///  in the Dependency Injection Container (also non entities) based on the attributes
///   with which the classes have been decorated.
class procedure TioMapContainer.RegisterClassesInDependencyInjectionContainerByAttributes;
type
  TdiImplementsItem = record
    IID: TGUID;
    Alias: String;
  end;

  TdiVVMforItemType = (vvmitView, vvmitViewModel);

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
    LFarAncestorClassImplementingInterface: TRttiInstanceType;
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
      if LAttr is ioEntity then
        LIsAnEntity := True;
      // DIC - diRegister
      if LAttr is diRegister then
        LdiRegister := True;
      // DIC - diDoNotRegisterAsInterfacedEntity
      if LAttr is diDoNotRegisterAsInterfacedEntity then
        LdiRegisterAsInterfacedEntity := False;
      // DIC - diIsSingleton
      if LAttr is diAsSingleton then
        LdiAsSingleton := True;
      // DIC - diRegister
      if LAttr is diImplements then
      begin
        Index := Length(LdiImplements);
        SetLength(LdiImplements, Index + 1);
        LdiImplements[Index].IID := diImplements(LAttr).IID;
        LdiImplements[Index].Alias := diImplements(LAttr).Alias;
      end;
      // DIC - diViewFor
      if LAttr is diViewFor then
      begin
        Index := Length(LdiVVMforItems);
        SetLength(LdiVVMforItems, Index + 1);
        LdiVVMforItems[Index].ItemType := vvmitView;
        LdiVVMforItems[Index].Target := diViewFor(LAttr).TargetTypeName;
        LdiVVMforItems[Index].Alias := diViewFor(LAttr).TargetTypeAlias;
      end;
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
    // Dependency Injection Container - Auto register the class for the resolver (persistence only) to use for load, persist, delete only
    if LIsAnEntity and LdiRegisterAsInterfacedEntity then
    begin
//      LdiImplementedInterfaces := ACurrentRttiInstanceType.GetDeclaredImplementedInterfaces;
      LdiImplementedInterfaces := ACurrentRttiInstanceType.GetImplementedInterfaces;
      for Index := Low(LdiImplementedInterfaces) to High(LdiImplementedInterfaces) do
        if (LdiImplementedInterfaces[Index].GUID <> IInterface) then // NB: Controllare per IInvokable ho visto che non serve perchè non ha un suo GUID
        begin
          LFarAncestorClassImplementingInterface := TioUtilities.GetFarAncestorEntityImplementingInterfaceSameTableAndConnection(ACurrentRttiInstanceType, LdiImplementedInterfaces[Index].GUID);
          io.di.RegisterClass(ACurrentRttiInstanceType).Implements(LdiImplementedInterfaces[Index].GUID, DI_ENTITY_AUTOREGISTER_SUBKEY_PREFIX + ACurrentRttiInstanceType.Name)._SetFarAncestorClassNameImplementingTheSameInterface
            (LFarAncestorClassImplementingInterface.Name).AsEntity.Execute;
        end;
    end;
    // Dependency Injection Container - Register the class as is without any interface
    if LdiRegister then
      io.di.RegisterClass(ACurrentRttiInstanceType).AsSingleton(LdiAsSingleton).Execute;
    // Dependency Injection Container - Register the class as implenter of the interfaces
    if Length(LdiImplements) > 0 then
      for Index := Low(LdiImplements) to High(LdiImplements) do
        io.di.RegisterClass(ACurrentRttiInstanceType).Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
    // Dependency Injection Container - Register the class as View or ViewModel for som other classes
    if Length(LdiVVMforItems) > 0 then
      for Index := Low(LdiVVMforItems) to High(LdiVVMforItems) do
      begin
        case LdiVVMforItems[Index].ItemType of
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
  for LRttiType in TioRttiFactory.GetRttiContext.GetTypes do
    if LRttiType.IsInstance and TioUtilities.HasAttribute<ioEntity>(LRttiType) then
      AddClassRef(LRttiType.AsInstance.MetaclassType);
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

initialization

// NB: Spostato sulla initialize della unit iORM
// Create the ContextXontainer Instance and Init it by loading
// all entities declarated in the application
// TioMapContainer.Build;

finalization

TioMapContainer.CleanUp;

end.
