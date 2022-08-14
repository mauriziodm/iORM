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

const
  //  Note: TCVM stands for  "True Class Virtual Map"
  TRUECLASSVIRTUALMAP_NAME_PREFIX = '<TCVM>';

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
    class function IsAnEntity(const AType: TRttiInstanceType): Boolean;
    class procedure DIC_AutoregisterClassesByAttributes;
    // // NB: IsValidEntity_diAutoRegister attualmente effettua anche la registrazione delle classi al DIC (magari meglio separare le cose?)
    // class function IsValidEntity_diAutoRegister(const AType:TRttiInstanceType): Boolean;
    class procedure Init;
    class procedure FillTrueClassVirtualMapProperties;
  public
    class procedure Build;
    class procedure CleanUp;
    class procedure AddClassRef(const AClassRef: TioClassRef);
    /// This function create and add (to the MapContainer and only if not already present) the TrueTypeVirtualMap for the base class map received as parameter
    ///  and return its name
    class function AddTrueTypeVirtualMapIfNotExists(const AMap: IioMap): String;
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

// // NB: IsValidEntity_diAutoRegister attualmente effettua anche la registrazione delle classi al DIC (magari meglio separare le cose?)
// class function IsValidEntity_diAutoRegister(const AType:TRttiInstanceType): Boolean;
class function TioMapContainer.AddTrueTypeVirtualMapIfNotExists(const AMap: IioMap): String;
begin
  // Compose the TrueTypeVirtualMap name
  //  Note: TCVM stands for  "True Class Virtual Map"
  Result := TRUECLASSVIRTUALMAP_NAME_PREFIX + AMap.GetClassName;
  // If the virtual map is non already present then create and register it
  if not Exist(Result) then
    FInternalContainer.Add(Result, TioMapSlot.CreateByMap(AMap.DuplicateToTrueClassMap));
end;

class procedure TioMapContainer.Build;
begin
  FInternalContainer := TioMapContainerInstance.Create([doOwnsValues]);
  TioMapContainer.Init;
end;

class procedure TioMapContainer.CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioMapContainer.Exist(const AClassName: String): Boolean;
begin
  Result := FInternalContainer.ContainsKey(AClassName);
end;

class procedure TioMapContainer.FillTrueClassVirtualMapProperties;
var
  LClassName: String;
  LCurrentMap: IioMap;
  LTrueClassVirtualMap: IioMap;
begin
  // Loop for all maps skipping TrueClassVirtualMaps
  for LClassName in FInternalContainer.Keys do
  begin
    if not LClassName.StartsWith(TRUECLASSVIRTUALMAP_NAME_PREFIX) then
    begin
//      LCurrentMap := GetMap(LClassName);
//      LCurrentMap
    end;
  end;
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
    raise EioException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class procedure TioMapContainer.Init;
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
begin
  // Create the temporary collection of autodetected hasmany relation virtual properties
  FAutodetectedHasManyRelationCollection := TList<IioProperty>.Create;
  try
    // Autoregister classes (even not entities) into the Dependency Injection Container by attributes
    DIC_AutoregisterClassesByAttributes;

    // Init ContextContainer loading all ClassRef relative to the entities (classes)
    // in the application

// *******************************************
// NB: PROBABILMENTE QUESTO CICLO QUI SOTTO POTREBBE ESSERE ELIMINATO E INGLOBATO NELLA PROCEDURE "DIC_AutoregisterClassesByAttributes"
//      PERCHE TANTO ANCHE QUELLA CICLA PER TUTTE LE CLASSI E GIA ADESSO CONTROLLA ANCHE SE UNA CLASSE HA L'ATTRIBUTO "ioEntity/ioTable"
//      PERTANTO PUUO FARE TUTTO QUELLA OTTIMIZZANDO IL TUTTO, ALMENO CREDO
// *******************************************
    LRttiContext := TioRttiFactory.GetRttiContext;
    for LRttiType in LRttiContext.GetTypes do
    begin
      // Only instance type
      // Only classes with explicit ioTable attribute
      if LRttiType.IsInstance and IsAnEntity(LRttiType.AsInstance) then
        // Load the current class (entity) into the ContextContainer
        AddClassRef(LRttiType.AsInstance.MetaclassType);
    end;

    // Generate childs virtual properties related to autodetected HasMany relations
    TioContextFactory.GenerateAutodetectedHasManyRelationVirtualPropertyOnDetails;

    // NB: Mauri 30/07/2022: Nel metodo "TioDependencyInjectionContainer.FillAncestorClassNameImplementingTheSameInterfaceSameTableAndConnection"
    //    registro automaticamente come entità anche la classe più possibile in alto nella gararchia
    //   (più vicina a TObject) della classe che sto registrando che implementa la stessa interfaccia perchè altrimenti, nel caso
    //   che quella classe base non avesse l'attributo ioEntity (quindi se non venisse registrata) poi mi darebbe un errore
    //   perchè quando rivolve l'interfaccia ai fini del persisting ritornerebbe quella classe base che non essendo registrata
    //   come entity (nel Map/ContextContainer) darebbe un errore.
    TioDependencyInjectionContainer.FillAncestorClassNameImplementingTheSameInterfaceSameTableAndConnection;

    // A questo punto copie nelle "TrueClassVirtualMap" tutte le proprietà delle classi che sono ad esse relative
    // FillTrueClassVirtualMapProperties;
  finally
    FreeAndNil(FAutodetectedHasManyRelationCollection);
  end;
end;

class function TioMapContainer.IsAnEntity(const AType: TRttiInstanceType): Boolean;
var
  LAttr: TCustomAttribute;
begin
  Result := False;
  for LAttr in AType.GetAttributes do
  begin
    // ioEntity attribute (it means it is an entity class)
    if LAttr is ioTable then
      Result := True;
  end;
end;

class procedure TioMapContainer.DIC_AutoregisterClassesByAttributes;
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
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  procedure _DIC_AutoregisterClass(const AType: TRttiInstanceType);
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
    LFarAncestorClassRefImplementingInterface: TRttiInstanceType;
  begin
    // Init
    LIsAnEntity := False;
    LdiRegister := False;
    LdiRegisterAsInterfacedEntity := True;
    LdiAsSingleton := False;
    SetLength(LdiImplements, 0);
    // Loop for attributes
    for LAttr in AType.GetAttributes do
    begin
      // ioEntity attribute (it means it is an entity class)
      if LAttr is ioTable then
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
    // Dependency Injection Container - Auto register the class for the resolver (persistance only) to use for load, persist, delete only
    if LIsAnEntity and LdiRegisterAsInterfacedEntity then
    begin
      LdiImplementedInterfaces := AType.GetImplementedInterfaces;
      for Index := Low(LdiImplementedInterfaces) to High(LdiImplementedInterfaces) do
        if (LdiImplementedInterfaces[Index].GUID <> IInterface) then // NB: Controllare per IInvokable ho visto che non serve perchè non ha un suo GUID
        begin
          LFarAncestorClassRefImplementingInterface := TioUtilities.GetTheFarAncestorClassRefImplementingInterface(AType, LdiImplementedInterfaces[Index].GUID);
          io.di.RegisterClass(AType).Implements(LdiImplementedInterfaces[Index].GUID, AType.Name)._SetFarAncestorClassNameImplementingTheSameInterface
            (LFarAncestorClassRefImplementingInterface.Name).AsEntity.Execute;
        end;
    end;
    // Dependency Injection Container - Register the class as is without any interface
    if LdiRegister then
      io.di.RegisterClass(AType).AsSingleton(LdiAsSingleton).Execute;
    // Dependency Injection Container - Register the class as implenter of the interfaces
    if Length(LdiImplements) > 0 then
      for Index := Low(LdiImplements) to High(LdiImplements) do
        io.di.RegisterClass(AType).Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
    // Dependency Injection Container - Register the class as View or ViewModel for som other classes
    if Length(LdiVVMforItems) > 0 then
      for Index := Low(LdiVVMforItems) to High(LdiVVMforItems) do
      begin
        case LdiVVMforItems[Index].ItemType of
          vvmitView:
            io.di.RegisterClass(AType).AsViewFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
          vvmitViewModel:
            io.di.RegisterClass(AType).AsViewModelFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias).AsSingleton(LdiAsSingleton).Execute;
        end;
      end;
  end;

begin
  // Loop for all classes detecting attributes to register the current class into the DIC
  LRttiContext := TioRttiFactory.GetRttiContext;
  for LRttiType in LRttiContext.GetTypes do
    if LRttiType.IsInstance then
      _DIC_AutoregisterClass(LRttiType.AsInstance);
end;

// NB: IsValidEntity_diAutoRegister attualmente effettua anche la registrazione delle classi al DIC (magari meglio separare le cose?)
// class function TioMapContainer.IsValidEntity_diAutoRegister(const AType: TRttiInstanceType): Boolean;
// type
// TdiImplementsItem = record
// IID: TGUID;
// Alias: String;
// end;
// TdiVVMforItemType = (vvmitView, vvmitViewModel);
// TdiVVMforItem = record
// ItemType: TdiVVMforItemType;
// Target: String;
// Alias: String;
// end;
// var
// LAttr: TCustomAttribute;
// LdiRegister: Boolean;
// LdiRegisterAsInterfacedEntity: Boolean;
// LdiAsSingleton: Boolean;
// LdiImplements: array of TdiImplementsItem;
// LdiVVMforItems: array of TdiVVMforItem;
// LdiImplementedInterfaces: TArray<TRttiInterfaceType>;
// Index: Integer;
// begin
// // Init
// Result := False;
/// /  Index := 0;
// LdiRegister := False;
// LdiRegisterAsInterfacedEntity := True;
// LdiAsSingleton := False;
// SetLength(LdiImplements, 0);
// // Loop for attributes
// for LAttr in AType.GetAttributes do
// begin
// // ioEntity attribute (it means it is an entity class)
// if LAttr is ioTable then
// Result := True;
// // DIC - diRegister
// if LAttr is diRegister then
// LdiRegister := True;
// // DIC - diDoNotRegisterAsInterfacedEntity
// if LAttr is diDoNotRegisterAsInterfacedEntity then
// LdiRegisterAsInterfacedEntity := False;
// // DIC - diIsSingleton
// if LAttr is diAsSingleton then
// LdiAsSingleton := True;
// // DIC - diRegister
// if LAttr is diImplements then
// begin
// Index := Length(LdiImplements);
// SetLength(LdiImplements, Index+1);
// LdiImplements[Index].IID := diImplements(LAttr).IID;
// LdiImplements[Index].Alias := diImplements(LAttr).Alias;
// end;
// // DIC - diViewFor
// if LAttr is diViewFor then
// begin
// Index := Length(LdiVVMforItems);
// SetLength(LdiVVMforItems, Index+1);
// LdiVVMforItems[Index].ItemType := vvmitView;
// LdiVVMforItems[Index].Target := diViewFor(LAttr).TargetTypeName;
// LdiVVMforItems[Index].Alias := diViewFor(LAttr).TargetTypeAlias;
// end;
// // DIC - diViewModelFor
// if LAttr is diViewModelFor then
// begin
// Index := Length(LdiVVMforItems);
// SetLength(LdiVVMforItems, Index+1);
// LdiVVMforItems[Index].ItemType := vvmitViewModel;
// LdiVVMforItems[Index].Target := diViewModelFor(LAttr).TargetTypeName;
// LdiVVMforItems[Index].Alias := diViewModelFor(LAttr).TargetTypeAlias;
// end;
// end;
// // Dependency Injection Container - Auto register the class for the resolver (persistance only) to use for load, persist, delete only
// if Result and LdiRegisterAsInterfacedEntity then
// begin
// LdiImplementedInterfaces := AType.GetImplementedInterfaces;
// for Index := Low(LdiImplementedInterfaces) to High(LdiImplementedInterfaces) do
// if (LdiImplementedInterfaces[Index].GUID <> IInterface) then  // NB: Controllare per IInvokable ho visto che non serve perchè non ha un suo GUID
// io.di.RegisterClass(AType).Implements(LdiImplementedInterfaces[Index].GUID, AType.Name).AsEntity.Execute;
// end;
// // Dependency Injection Container - Register the class as is without any interface
// if LdiRegister then
// io.di.RegisterClass(AType).AsSingleton(LdiAsSingleton).Execute;
// // Dependency Injection Container - Register the class as implenter of the interfaces
// if Length(LdiImplements) > 0 then
// for Index := Low(LdiImplements) to High(LdiImplements) do
// io.di
// .RegisterClass(AType)
// .Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias)
// .AsSingleton(LdiAsSingleton)
// .Execute;
// // Dependency Injection Container - Register the class as View or ViewModel for som other classes
// if Length(LdiVVMforItems) > 0 then
// for Index := Low(LdiVVMforItems) to High(LdiVVMforItems) do
// begin
// case LdiVVMforItems[Index].ItemType of
// vvmitView:
// io.di
// .RegisterClass(AType)
// .AsViewFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias)
// .AsSingleton(LdiAsSingleton)
// .Execute;
// vvmitViewModel:
// io.di
// .RegisterClass(AType)
// .AsViewModelFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias)
// .AsSingleton(LdiAsSingleton)
// .Execute;
// end;
// end;
// end;

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
