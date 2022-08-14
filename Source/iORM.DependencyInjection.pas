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

unit iORM.DependencyInjection;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.Interfaces, System.SyncObjs, iORM.DependencyInjection.Interfaces, System.Rtti,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.Interfaces, iORM.Resolver.Interfaces, iORM.Context.Container,
  iORM.DependencyInjection.Singletons, iORM.DependencyInjection.Implementers, iORM.MVVM.ViewContextProvider,
  iORM.MVVM.ModelPresenter.Custom, iORM.Where.Interfaces, System.Classes,
  System.SysUtils;

type

  // ===============================================================================================================================
  // Internal containers types
  // -------------------------------------------------------------------------------------------------------------------------------
  // Dependency Injection Container Interface IMPLEMENTERS (SubContainer)
  TioDIContainerImplementersKey = String;

  TioDIContainerImplementers = class
  strict private
    FInternalContainer: TObjectDictionary<TioDIContainerImplementersKey, TioDIContainerImplementersItem>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AAlias: TioDIContainerImplementersKey; const AImplementerItem: TioDIContainerImplementersItem);
    function GetItem(const AAlias: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
    function Contains(const AAlias: TioDIContainerImplementersKey): Boolean;
    function GetEnumerator: TEnumerator<TioDIContainerImplementersItem>;
    function RemoveAndCheckIfEmpty(ASubKey: String): Boolean;
  end;

  // Dependency injection container INTERFACES (MasterContainer)
  TioDIContainerKey = String;
  TioDIContainerValue = TioDIContainerImplementers;
  TioDIContainerInstance = TObjectDictionary<TioDIContainerKey, TioDIContainerValue>;
  // ===============================================================================================================================

  // Dependency Injection Container (and relative class reference)
  TioDependencyInjectionContainerRef = class of TioDependencyInjectionContainer;

  TioDependencyInjectionContainer = class abstract
  strict private
    class var FContainer: TioDIContainerInstance;
  public
    class procedure Build;
    class procedure CleanUp;
    class procedure Add(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey; const AValue: TioDIContainerImplementersItem);
    class function Exists(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): Boolean; overload;
    class function ImplementersExists(AKey: TioDIContainerKey): Boolean; overload;
    class function Get(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
    class function GetInterfaceImplementers(AKey: TioDIContainerKey): TioDIContainerValue;
    class procedure FillAncestorClassNameImplementingTheSameInterfaceSameTableAndConnection;
    class procedure Remove(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey);
  end;

  // Base class for Dependency Injection Register and Locator classes
  TioDependencyInjectionBase = class abstract(TInterfacedObject)
  strict protected
    class function Container: TioDependencyInjectionContainerRef;
    class function ModelToSimpleViewContainerKey(const ATargetTypeName: String): String;
    class function ModelToViewContainerKey(const ATargetTypeName: String): String;
    class function ModelToViewModelContainerKey(const ATargetTypeName: String): String;
  end;

  // ===========================================================================
  // CLASS REGISTER
  // ---------------------------------------------------------------------------
  // Register Class
  TioDependencyInjectionRegister = class(TioDependencyInjectionBase)
  strict private
    FContainerValue: TioDIContainerImplementersItem;
    FInterfaceName, FInterfaceNameOriginal: String;
    FAlias: String;
    FSetMapImplementersRef: Boolean;
    procedure LoadInjectAttributes;
    procedure SetMapImplementersRef;
  public
    constructor Create(const AContainerValue: TioDIContainerImplementersItem);
    procedure Execute;
    function _SetFarAncestorClassNameImplementingTheSameInterface(const AValue: String): TioDependencyInjectionRegister;
    function Implements<T: IInterface>(const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function Implements(const IID: TGUID; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function Alias(const AAlias: String): TioDependencyInjectionRegister;
    function InjectProperty(const APropertyName: String; const AValue: TValue): TioDependencyInjectionRegister; overload;
    function InjectProperty(const APropertyName, ATypeName: String; const ATypeAlias: String = ''): TioDependencyInjectionRegister; overload;
    function InjectField(const AFieldName: String; const AValue: TValue): TioDependencyInjectionRegister; overload;
    function InjectField(const AFieldName, ATypeName: String; const ATypeAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsSingleton(const AIsSingleton: Boolean = True): TioDependencyInjectionRegister;
    function AsEntity: TioDependencyInjectionRegister;
    function DefaultConstructorMethod(const AValue: String): TioDependencyInjectionRegister;
    function DefaultConstructorMarker(const AValue: String): TioDependencyInjectionRegister;
    function DefaultConstructorParams(const AParams: array of TValue): TioDependencyInjectionRegister;
    function DisableMapImplemetersRef: TioDependencyInjectionRegister;

    function SetBindSource(const AName: String; const ADataObject: TObject): TioDependencyInjectionRegister; overload;
    // function SetBindSource(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): TioDependencyInjectionRegister; overload;
    function SetBindSource(const AName: String; const AMasterBindSource: IioNotifiableBindSource; const AMasterPropertyName: String = '')
      : TioDependencyInjectionRegister; overload;
    function SetBindSource(const AName: String; const AWhere: IioWhere): TioDependencyInjectionRegister; overload;
    function SetBindSource(const AName: String; const AOrderBy: String): TioDependencyInjectionRegister; overload;

    function SetBindSourceAsSelectorFor(const ASourcePresenterName: String; const ASelectionDest: IioNotifiableBindSource): TioDependencyInjectionRegister;

    function AsSimpleViewFor(const ATargetTypeName: String; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsSimpleViewFor(const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsSimpleViewFor(const ATargetIID: TGUID; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsSimpleViewFor<T>(const AAlias: String = ''): TioDependencyInjectionRegister; overload;

    function AsViewFor(const ATargetTypeName: String; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsViewFor(const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsViewFor(const ATargetIID: TGUID; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsViewFor<T>(const AAlias: String = ''): TioDependencyInjectionRegister; overload;

    function AsViewModelFor(const ATargetTypeName: String; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsViewModelFor(const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsViewModelFor(const ATargetIID: TGUID; const AAlias: String = ''): TioDependencyInjectionRegister; overload;
    function AsViewModelFor<T>(const AAlias: String = ''): TioDependencyInjectionRegister; overload;

    // function AsSelectorViewFor(const ATargetTypeName:String; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    // function AsSelectorViewFor(const ATargetClassRef:TioClassRef; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    // function AsSelectorViewFor(const ATargetIID:TGUID; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    // function AsSelectorViewFor<T>(const AAlias:String=''): TioDependencyInjectionRegister; overload;

    // function AsSelectorViewModelFor(const ATargetTypeName:String; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    // function AsSelectorViewModelFor(const ATargetClassRef:TioClassRef; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    // function AsSelectorViewModelFor(const ATargetIID:TGUID; const AAlias:String=''): TioDependencyInjectionRegister; overload;
    // function AsSelectorViewModelFor<T>(const AAlias:String=''): TioDependencyInjectionRegister; overload;

  end;
  // ===========================================================================

  // ===========================================================================
  // CLASS LOCATOR
  // ---------------------------------------------------------------------------
  TioDependencyInjectionLocator = class(TioDependencyInjectionBase, IioDependencyInjectionLocator)
  strict private
    FInterfaceName: String;
    FAlias: String;
    FConstructorMethod: String;
    FConstructorMarker: String;
    FConstructorParams: TioConstructorParams;
    FPresenterSettings: TArray<TioDIPresenterSettings>;
    FViewModel: IioViewModel;
    FViewModelMarker: String;
    FSingletonKey: String;
    FVCProvider: TioViewContextProvider;
    FVCProviderEnabled, FOwnerRequested: Boolean;
    FViewContext: TComponent; // For directly passed ViewContext (TCOmponent descendant) without the use of a ViewContextProvider
    FViewContextFreeMethod: TProc;
    // For directly passed ViewContext (TCOmponent descendant) without the use of a ViewContextProvider (or in combination with it)
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    FForEachModelPresenter: IioNotifiableBindSource;
    FForEachLocateViewModel: Boolean;
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    procedure ClearPresenterSettings;
    function PresenterSettingsExists: Boolean;
    function ViewModelExist: Boolean;
    function ExtractVMFromView(const AView: TComponent): IioViewModel;
    procedure CheckConstructorInfo(const AContainerItem: TioDIContainerImplementersItem);
  strict protected
    function _ShowCurrent: TComponent;
    function _Get(const AContainerItem: TioDIContainerImplementersItem): TObject;
    property _InterfaceName: String read FInterfaceName;
    property _Alias: String read FAlias;
  public
    constructor Create(const AInterfaceName: String; const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean); virtual;
    function Exist: Boolean; virtual;
    function Alias(const AAlias: String): IioDependencyInjectionLocator;
    function ConstructorParams(const AParams: TioConstructorParams): IioDependencyInjectionLocator; virtual;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator; virtual;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator; virtual;
    function SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator; virtual;
    function Get: TObject; virtual;
    function GetAsGeneric: TioDILocatorDestination;
    function GetItem: TioDIContainerImplementersItem;
    function Show: TComponent; virtual;
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    function ShowCurrent: TComponent;
    procedure ShowEach;
    procedure _SetForEachModelPresenter(const AModelPresenter: IioNotifiableBindSource; const ALocateViewModel: Boolean);
    procedure _DuplicateLocatorForShowEachPurposeFrom(const ASourceLocator: TioDependencyInjectionLocator);
    function _GetAlias: String;
    function _GetConstructorMethod: String;
    function _GetConstructorMarker: String;
    function _GetConstructorParams: PioConstructorParams;
    function _GetVCProvider: TioViewContextProvider;
    function _GetViewContext: TComponent;
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    // ---------- VIEW MODEL METHODS ----------
    function SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): IioDependencyInjectionLocator;
    // SetPresenter (passing the name of the destination presenter)
    function SetBindSource(const AName: String; const ADataObject: TObject): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName: String; const AInterfacedObj: IInterface): IioDependencyInjectionLocator; overload;
    // function SetBindSource(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName: String; const AMasterBindSource: IioNotifiableBindSource; const AMasterPropertyName: String = '')
      : IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName: String; const AWhere: IioWhere): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AName: String; const AOrderBy: String): IioDependencyInjectionLocator; overload;
    function SetBindSourceAsSelectorFor(const ASourceBSName: String; const ASelectionDest: IioNotifiableBindSource): IioDependencyInjectionLocator; overload;
    // SetPresenter (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject: TObject): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AInterfacedObj: IInterface): IioDependencyInjectionLocator; overload;
    // function SetBindSource(const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AMasterBindSource: IioNotifiableBindSource; const AMasterPropertyName: String = ''): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AWhere: IioWhere): IioDependencyInjectionLocator; overload;
    function SetBindSource(const AOrderBy: String): IioDependencyInjectionLocator; overload;
    function SetBindSourceAsSelectorFor(const ASelectionDest: IioNotifiableBindSource): IioDependencyInjectionLocator; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider: TioViewContextProvider): IioDependencyInjectionLocator; overload;
    function VCProvider(const AName: String): IioDependencyInjectionLocator; overload;
    function SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc = nil): IioDependencyInjectionLocator;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
  end;

  // Generic version of the Service Locator Class
  TioDependencyInjectionLocator<TI> = class(TioDependencyInjectionLocator, IioDependencyInjectionLocator<TI>)
  public
    function Get: TI; reintroduce; overload;
    function Alias(const AAlias: String): IioDependencyInjectionLocator<TI>;
    function ConstructorParams(const AParams: TioConstructorParams): IioDependencyInjectionLocator<TI>; reintroduce; overload;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator<TI>; reintroduce; overload;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator<TI>; reintroduce; overload;
    function SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator<TI>; reintroduce; overload;
    // ---------- VIEW MODEL METHODS ----------
    function SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): IioDependencyInjectionLocator<TI>;
    // SetPresenter (passing the name of the destination presenter)
    function SetBindSource(const AName: String; const ADataObject: TObject): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName: String; const AInterfacedObj: IInterface): IioDependencyInjectionLocator<TI>; overload;
    // function SetBindSource(const AName:String; const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName: String; const AMasterPresenter: IioNotifiableBindSource; const AMasterPropertyName: String = '')
      : IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName: String; const AWhere: IioWhere): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AName: String; const AOrderBy: String): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASourcePresenterName: String; const ASelectionDest: IioNotifiableBindSource)
      : IioDependencyInjectionLocator<TI>; overload;
    // SetPresenter (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject: TObject): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AInterfacedObj: IInterface): IioDependencyInjectionLocator<TI>; overload;
    // function SetBindSource(const ABindSourceAdapter:IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AMasterPresenter: IioNotifiableBindSource; const AMasterPropertyName: String = ''): IioDependencyInjectionLocator<TI>;
      overload;
    function SetBindSource(const AWhere: IioWhere): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSource(const AOrderBy: String): IioDependencyInjectionLocator<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASelectionDest: IioNotifiableBindSource): IioDependencyInjectionLocator<TI>; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider: TioViewContextProvider): IioDependencyInjectionLocator<TI>; overload;
    function VCProvider(const AName: String): IioDependencyInjectionLocator<TI>; overload;
    function SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc = nil): IioDependencyInjectionLocator<TI>;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
  end;
  // ===========================================================================

  // Class for ResolverByDependencyInjection
  // NB: FOR ENTITY PERSISTANCE PURPOSES ONLY
  TioDependencyInjectionResolverBase = class(TioDependencyInjectionBase)
  public
    // ResolveInaccurate in pratica per cercare almeno una classe che implementa l'interfaccia.
    // Se l'alias è vuoto e non c'è una classe registrata che implementa l'interfaccia senza Alias (ma
    // ne esiste almeno una registrata anche se con un alias) ritorna quella.
    class function ResolveInaccurateAsRttiType(const ATypeName: String; const AAlias: String): TRttiType;
    class function Resolve(const ATypeName: String; const AAlias: String; const AResolverMode: TioResolverMode; const AUseMapInfo: Boolean)
      : IioResolvedTypeList;
  end;

  // Main Dependency Injection Class (and relative class reference)
  TioDependencyInjectionRef = class of TioDependencyInjection;

  TioDependencyInjection = class(TioDependencyInjectionBase)
  private
    class function _LocateForEachVVM_1stPhase_Browse(const ATargetTypeName: String; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function _LocateForEachVVM_2ndPhase_Create(const ASourceMP: IioNotifiableBindSource; const ATargetTypeName: String; const AAlias: String = '';
      const AViewModelMarker: String = ''): IioDependencyInjectionLocator; overload;
  public
    class function Singletons: TioSingletonsFacadeRef;
    class function RegisterClass<T: class>: TioDependencyInjectionRegister; overload;
    class function RegisterClass(const ARttiType: TRttiInstanceType): TioDependencyInjectionRegister; overload;
    class function Locate(const AInterfaceName: String; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function Locate<T: IInterface>(const AAlias: String = ''): IioDependencyInjectionLocator<T>; overload;
    class function LocateView(const AInterfaceName: String; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateView<T: IInterface>(const AAlias: String = ''): IioDependencyInjectionLocator<T>; overload;
    class function LocateVM(const AInterfaceName: String; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateVM<T: IInterface>(const AAlias: String = ''): IioDependencyInjectionLocator<T>; overload;
    class function LocateViewVM<TView: IInterface; TViewModel: IioViewModel>(const AViewAlias: String = ''; const AViewModelAlias: String = '';
      const AViewModelMarker: String = ''): IioDependencyInjectionLocator<TView>; overload;
    // LocateFor View
    class function LocateViewFor(const ATargetTypeName: String; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewFor(const AClassRef: TioClassRef; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewFor<T>(const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewFor(const ATargetObj: TObject; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewFor(const ATargetIntf: IInterface; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewFor(const ATargetMP: IioNotifiableBindSource; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    // LocateFor ViewModel
    class function LocateVMfor(const ATargetTypeName: String; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateVMfor(const AClassRef: TioClassRef; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateVMfor<T>(const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateVMfor(const ATargetObj: TObject; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateVMfor(const ATargetIntf: IInterface; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    // LocateFor View & ViewModel
    class function LocateViewVMfor(const ATargetTypeName: String; const AAlias: String = ''; const AViewModelMarker: String = '')
      : IioDependencyInjectionLocator; overload;
    class function LocateViewVMfor(const AClassRef: TioClassRef; const AAlias: String = ''; const AViewModelMarker: String = '')
      : IioDependencyInjectionLocator; overload;
    class function LocateViewVMfor<T>(const AAlias: String = ''; const AViewModelMarker: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewVMfor(const ATargetObj: TObject; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewVMfor(const ATargetIntf: IInterface; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
    class function LocateViewVMfor(const ASourceMP: IioNotifiableBindSource; const AAlias: String = ''): IioDependencyInjectionLocator; overload;
  end;

  // Dependency Injection Factory
  TioDependencyInjectionFactory = class abstract(TioDependencyInjectionBase)
  strict private
    // class procedure _CheckModelPresenter(const ATargetMP:TioModelPresenter); NB: Hint prevention "symbol declared but never used" (codice resente sotto)
  public
    class function GetRegister(const AContainerValue: TioDIContainerImplementersItem): TioDependencyInjectionRegister;
    class function GetLocator(const AInterfaceName: String; const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean)
      : IioDependencyInjectionLocator; overload;
    class function GetLocator<TI>(const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean): IioDependencyInjectionLocator<TI>; overload;
    class function GetViewLocatorFor(const ATargetMP: IioNotifiableBindSource; const AAlias: String): IioDependencyInjectionLocator; overload;
    class function GetViewVMLocatorFor(const ATargetMP: IioNotifiableBindSource; const AAlias: String; const ACreateViewModel: Boolean)
      : IioDependencyInjectionLocator; overload;
    // NB: IL codice del metodo sotto commentato è anch'esso commentato
    // class function GetVMLocatorFor(const AModelPresenter:TioModelPresenter; const AAlias:String): IioDependencyInjectionLocator; overload;
  end;

implementation

uses
  iORM, iORM.Exceptions, System.TypInfo, iORM.ObjectsForge.ObjectMaker, iORM.Utilities, iORM.Resolver.Factory, iORM.RttiContext.Factory,
  iORM.Context.Map.Interfaces, iORM.DependencyInjection.ViewModelShuttleContainer, iORM.Attributes, iORM.Where.Factory,
  iORM.MVVM.ViewContextProviderContainer, iORM.ObjectsForge.Interfaces, iORM.MVVM.ViewModelBridge, iORM.Abstraction,
  iORM.MVVM.ViewModel, iORM.LiveBindings.CommonBSBehavior;

{ TioDependencyInjectionBase }

class function TioDependencyInjectionBase.Container: TioDependencyInjectionContainerRef;
begin
  Result := TioDependencyInjectionContainer;
end;

class function TioDependencyInjectionBase.ModelToSimpleViewContainerKey(const ATargetTypeName: String): String;
begin
  Result := '<SV>' + ATargetTypeName;
end;

class function TioDependencyInjectionBase.ModelToViewContainerKey(const ATargetTypeName: String): String;
begin
  Result := '<V>' + ATargetTypeName;
end;

class function TioDependencyInjectionBase.ModelToViewModelContainerKey(const ATargetTypeName: String): String;
begin
  Result := '<VM>' + ATargetTypeName;
end;

{ TioDependencyInjection }

class function TioDependencyInjection.Locate(const AInterfaceName, AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionFactory.GetLocator(AInterfaceName, AAlias, False, False);
end;

class function TioDependencyInjection.Locate<T>(const AAlias: String): IioDependencyInjectionLocator<T>;
begin
  Result := TioDependencyInjectionFactory.GetLocator<T>(AAlias, False, False);
end;

class function TioDependencyInjection.LocateView(const AInterfaceName, AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionFactory.GetLocator(AInterfaceName, AAlias, True, True);
end;

class function TioDependencyInjection.LocateViewVM<TView, TViewModel>(const AViewAlias, AViewModelAlias, AViewModelMarker: String)
  : IioDependencyInjectionLocator<TView>;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := TioDependencyInjectionFactory.GetLocator<TView>(AViewAlias, True, True);
  // Get the ViewModel instance
  LViewModel := io.di.LocateVM<TViewModel>(AViewModelAlias).Get;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.LocateViewVMfor(const AClassRef: TioClassRef; const AAlias, AViewModelMarker: String): IioDependencyInjectionLocator;
begin
  Result := LocateViewVMfor(AClassRef.ClassName, AAlias, AViewModelMarker);
end;

class function TioDependencyInjection.LocateViewVMfor(const ATargetObj: TObject; const AAlias: String): IioDependencyInjectionLocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetObj.ClassName, AAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetObj, AAlias).GetAsGeneric.OfType<IioViewModel>;
  Result.SetViewModel(LViewModel);

  // ===== OLD CODE =====
  // Result := LocateViewVMfor(ATargetObj.ClassName, AAlias);
  // ===== OLD CODE =====
end;

class function TioDependencyInjection.LocateViewVMfor(const ATargetIntf: IInterface; const AAlias: String): IioDependencyInjectionLocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetIntf, AAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetIntf, AAlias).GetAsGeneric.OfType<IioViewModel>;
  Result.SetViewModel(LViewModel);

  // ===== OLD CODE =====
  // Result := LocateViewVMfor((ATargetIntf as TObject).ClassName, AAlias);
  // ===== OLD CODE =====
end;

class function TioDependencyInjection.LocateViewVMfor<T>(const AAlias, AViewModelMarker: String): IioDependencyInjectionLocator;
begin
  Result := LocateViewVMfor(TioUtilities.GenericToString<T>, AAlias, AViewModelMarker);
end;

class function TioDependencyInjection.LocateView<T>(const AAlias: String): IioDependencyInjectionLocator<T>;
begin
  Result := TioDependencyInjectionFactory.GetLocator<T>(AAlias, True, True);
end;

class function TioDependencyInjection.LocateViewFor(const AClassRef: TioClassRef; const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateViewFor(AClassRef.ClassName, AAlias);
end;

class function TioDependencyInjection.LocateViewFor(const ATargetObj: TObject; const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateViewFor(ATargetObj.ClassName, AAlias);
end;

class function TioDependencyInjection.LocateViewFor<T>(const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateViewFor(TioUtilities.GenericToString<T>, AAlias);
end;

class function TioDependencyInjection.LocateViewFor(const ATargetMP: IioNotifiableBindSource; const AAlias: String): IioDependencyInjectionLocator;
begin
  // Get & set the locator
  Result := TioDependencyInjectionFactory.GetViewLocatorFor(ATargetMP, AAlias);
end;

class function TioDependencyInjection.LocateViewFor(const ATargetTypeName, AAlias: String): IioDependencyInjectionLocator;
var
  LDIContainerKey: String;
begin
  // Get the Dependency Injection Container Key then get the locator
  LDIContainerKey := ModelToViewContainerKey(ATargetTypeName);
  // Get the ViewLocator
  Result := TioDependencyInjectionFactory.GetLocator(LDIContainerKey, AAlias, True, True);
end;

class function TioDependencyInjection.LocateVM(const AInterfaceName, AAlias: String): IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionFactory.GetLocator(AInterfaceName, AAlias, True, False);
end;

class function TioDependencyInjection.LocateVM<T>(const AAlias: String): IioDependencyInjectionLocator<T>;
begin
  Result := TioDependencyInjectionFactory.GetLocator<T>(AAlias, True, False);
end;

class function TioDependencyInjection.LocateVMfor(const AClassRef: TioClassRef; const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateVMfor(AClassRef.ClassName, AAlias);
end;

class function TioDependencyInjection.LocateVMfor(const ATargetObj: TObject; const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateVMfor(ATargetObj.ClassName, AAlias).SetBindSource(ATargetObj);
end;

class function TioDependencyInjection.LocateVMfor(const ATargetIntf: IInterface; const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateVMfor((ATargetIntf as TObject).ClassName, AAlias).SetBindSource(ATargetIntf);
end;

class function TioDependencyInjection.LocateVMfor(const ATargetTypeName, AAlias: String): IioDependencyInjectionLocator;
var
  LDIContainerKey: String;
begin
  // Get the Dependency Injection Container Key then get the locator
  LDIContainerKey := ModelToViewModelContainerKey(ATargetTypeName);
  Result := TioDependencyInjectionFactory.GetLocator(LDIContainerKey, AAlias, True, False);
end;

class function TioDependencyInjection.LocateVMfor<T>(const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateVMfor(TioUtilities.GenericToString<T>, AAlias);
end;

class function TioDependencyInjection.RegisterClass(const ARttiType: TRttiInstanceType): TioDependencyInjectionRegister;
var
  ContainerValue: TioDIContainerImplementersItem;
begin
  ContainerValue := TioDIContainerImplementersItem.Create;
  ContainerValue.ClassRef := ARttiType.MetaclassType;
  ContainerValue.ClassName := ARttiType.MetaclassType.ClassName;
  ContainerValue.RttiType := ARttiType;
  ContainerValue.IsSingleton := False;
  ContainerValue.IsEntity := False;
  Result := TioDependencyInjectionFactory.GetRegister(ContainerValue);
end;

class function TioDependencyInjection.RegisterClass<T>: TioDependencyInjectionRegister;
begin
  Result := RegisterClass(TioUtilities.ClassRefToRttiType(T));
end;

class function TioDependencyInjection.Singletons: TioSingletonsFacadeRef;
begin
  Result := TioSingletonsFacade;
end;

class function TioDependencyInjection._LocateForEachVVM_1stPhase_Browse(const ATargetTypeName, AAlias: String): IioDependencyInjectionLocator;
var
  LDIContainerKey: String;
begin
  // NB: This method create the locator instance only (never create a VM like LocateViewVM methods)
  // ------------------------------------------------------------
  // Get the Dependency Injection Container Key then get the locator
  LDIContainerKey := ModelToViewContainerKey(ATargetTypeName);
  // Get the ViewLocator
  Result := TioDependencyInjectionFactory.GetLocator(LDIContainerKey, AAlias, True, True);
end;

class function TioDependencyInjection.LocateViewFor(const ATargetIntf: IInterface; const AAlias: String): IioDependencyInjectionLocator;
begin
  Result := LocateViewFor((ATargetIntf as TObject).ClassName, AAlias);
end;

class function TioDependencyInjection.LocateViewVMfor(const ASourceMP: IioNotifiableBindSource; const AAlias: String): IioDependencyInjectionLocator;
begin
  // Get & set the locator
  Result := TioDependencyInjectionFactory.GetViewVMLocatorFor(ASourceMP, AAlias, False);
end;

class function TioDependencyInjection._LocateForEachVVM_2ndPhase_Create(const ASourceMP: IioNotifiableBindSource;
  const ATargetTypeName, AAlias, AViewModelMarker: String): IioDependencyInjectionLocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetTypeName, AAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetTypeName, AAlias).SetBindSource(ASourceMP).GetAsGeneric.OfType<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.LocateViewVMfor(const ATargetTypeName, AAlias, AViewModelMarker: String): IioDependencyInjectionLocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetTypeName, AAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetTypeName, AAlias).GetAsGeneric.OfType<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

{ TioDependencyInjectionRegister }

function TioDependencyInjectionRegister.Alias(const AAlias: String): TioDependencyInjectionRegister;
begin
  Self.FAlias := AAlias;
  Result := Self;
end;

function TioDependencyInjectionRegister.AsEntity: TioDependencyInjectionRegister;
begin
  Self.FContainerValue.IsEntity := True;
  Result := Self;
end;

function TioDependencyInjectionRegister.AsSimpleViewFor(const ATargetTypeName, AAlias: String): TioDependencyInjectionRegister;
begin
  // Set the InterfaceName
  FInterfaceName := ModelToSimpleViewContainerKey(ATargetTypeName);
  FInterfaceNameOriginal := ATargetTypeName;
  // Set the Alias
  if not AAlias.IsEmpty then
    Self.FAlias := AAlias;
  // Return itself
  Result := Self;
end;

function TioDependencyInjectionRegister.AsSimpleViewFor(const ATargetClassRef: TioClassRef; const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsSimpleViewFor(ATargetClassRef.ClassName, AAlias);
end;

function TioDependencyInjectionRegister.AsSimpleViewFor(const ATargetIID: TGUID; const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsSimpleViewFor(TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias);
end;

function TioDependencyInjectionRegister.AsSimpleViewFor<T>(const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsSimpleViewFor(TioUtilities.GenericToString<T>, AAlias);
end;

function TioDependencyInjectionRegister.AsSingleton(const AIsSingleton: Boolean): TioDependencyInjectionRegister;
begin
  Self.FContainerValue.IsSingleton := AIsSingleton;
  Result := Self;
end;

constructor TioDependencyInjectionRegister.Create(const AContainerValue: TioDIContainerImplementersItem);
begin
  inherited Create;
  FSetMapImplementersRef := True;
  FContainerValue := AContainerValue;
  FInterfaceName := AContainerValue.ClassName; // Così si possono registrare anche direttamente le classi senza interfaccia
  FAlias := '';
end;

function TioDependencyInjectionRegister.DefaultConstructorMarker(const AValue: String): TioDependencyInjectionRegister;
begin
  Self.FContainerValue.DefaultConstructorMarker := AValue;
  Result := Self;
end;

function TioDependencyInjectionRegister.DefaultConstructorMethod(const AValue: String): TioDependencyInjectionRegister;
begin
  Self.FContainerValue.DefaultConstructorMethod := AValue;
  Result := Self;
end;

function TioDependencyInjectionRegister.DefaultConstructorParams(const AParams: array of TValue): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  // Solo così sembra andare bene
  SetLength(FContainerValue.DefaultConstructorParams, Length(AParams));
  for i := 0 to High(AParams) do
    FContainerValue.DefaultConstructorParams[i] := AParams[i];
  Result := Self;
end;

function TioDependencyInjectionRegister.DisableMapImplemetersRef: TioDependencyInjectionRegister;
begin
  Self.FSetMapImplementersRef := False;
  Result := Self;
end;

procedure TioDependencyInjectionRegister.Execute;
begin
  Self.LoadInjectAttributes;
  if FSetMapImplementersRef then
    SetMapImplementersRef;
  Self.Container.Add(FInterfaceName, FAlias, FContainerValue);
  Self.Free;
end;

function TioDependencyInjectionRegister.Implements(const IID: TGUID; const AAlias: String): TioDependencyInjectionRegister;
begin
  // Set the InterfaceName
  Self.FInterfaceName := TioUtilities.GetImplementedInterfaceName(FContainerValue.RttiType, IID);
  // Set the interface GUID
  FContainerValue.InterfaceGUID := IID;
  // Set the Alias
  if not AAlias.IsEmpty then
    Self.FAlias := AAlias;
  // Return itself
  Result := Self;
end;

function TioDependencyInjectionRegister.Implements<T>(const AAlias: String): TioDependencyInjectionRegister;
begin
  // Set the InterfaceName
  FInterfaceName := TioUtilities.GenericToString<T>;
  // Set the interface GUID
  FContainerValue.InterfaceGUID := TioUtilities.TypeInfoToGUID(TypeInfo(T));
  // Set the Alias
  if not AAlias.IsEmpty then
    FAlias := AAlias;
  // Return itself
  Result := Self;
end;

function TioDependencyInjectionRegister.InjectField(const AFieldName: String; const AValue: TValue): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, i + 1);
  FContainerValue.PropertiesOnCreate[i].PropFieldType := itField;
  FContainerValue.PropertiesOnCreate[i].PropFieldValue := ivByValue;
  FContainerValue.PropertiesOnCreate[i].Name := AFieldName;
  FContainerValue.PropertiesOnCreate[i].Value := AValue;
  Result := Self;
end;

function TioDependencyInjectionRegister.InjectProperty(const APropertyName: String; const AValue: TValue): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, i + 1);
  FContainerValue.PropertiesOnCreate[i].PropFieldType := itProperty;
  FContainerValue.PropertiesOnCreate[i].PropFieldValue := ivByValue;
  FContainerValue.PropertiesOnCreate[i].Name := APropertyName;
  FContainerValue.PropertiesOnCreate[i].Value := AValue;
  Result := Self;
end;

procedure TioDependencyInjectionRegister.LoadInjectAttributes;
var
  LAttr: TCustomAttribute;
  LProp: TRttiProperty;
  LField: TRttiField;
  LTypeName: String;
begin
  // ===========================================================================
  // LOAD PROPERTIES "ioInject" ATTRIBUTES
  // ---------------------------------------------------------------------------
  // Loop for all properties
  for LProp in FContainerValue.RttiType.GetProperties do
    // Loop for all attributes
    for LAttr in LProp.GetAttributes do
      // I'm searching ioInject attribute
      if LAttr is ioInject then
      begin
        // If the TypeName property of the ioInject attribute is specified then use it else
        // use the type of the property
        if ioInject(LAttr).TypeName.IsEmpty then
          LTypeName := LProp.PropertyType.Name
        else
          LTypeName := ioInject(LAttr).TypeName;
        // Register injection info
        Self.InjectProperty(LProp.Name, LTypeName, ioInject(LAttr).TypeAlias);
      end;
  // ===========================================================================
  // LOAD FIELDS "ioInject" ATTRIBUTES
  // ---------------------------------------------------------------------------
  // Loop for all fields
  for LField in FContainerValue.RttiType.GetFields do
    // Loop for all attributes
    for LAttr in LField.GetAttributes do
      // I'm searching ioInject attribute
      if LAttr is ioInject then
      begin
        // If the TypeName property of the ioInject attribute is specified then use it else
        // use the type of the field
        if ioInject(LAttr).TypeName.IsEmpty then
          LTypeName := LField.FieldType.Name
        else
          LTypeName := ioInject(LAttr).TypeName;
        // Regster injection info
        Self.InjectField(LField.Name, LTypeName, ioInject(LAttr).TypeAlias);
      end;
  // ===========================================================================
end;

procedure TioDependencyInjectionRegister.SetMapImplementersRef;
begin
  // Set a reference to the DIImplementersItem in the IioMap of the class
  // for Inject properties after create pourpose even when the object
  // is created by an ORM load.
  if TioMapContainer.Exist(FContainerValue.ClassName) then
    TioMapContainer.GetMap(FContainerValue.ClassName, False).SetDIContainerImplementersItem(FContainerValue);
end;

function TioDependencyInjectionRegister.SetBindSource(const AName: String; const AWhere: IioWhere): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, i + 1);
  FContainerValue.PresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstWhere;
  FContainerValue.PresenterSettings[i].Name := AName;
  FContainerValue.PresenterSettings[i].InterfacedObj := AWhere;
  Result := Self;
end;

function TioDependencyInjectionRegister.SetBindSource(const AName: String; const ADataObject: TObject): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, i + 1);
  FContainerValue.PresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstDataObject;
  FContainerValue.PresenterSettings[i].Name := AName;
  FContainerValue.PresenterSettings[i].Obj := ADataObject;
  Result := Self;
end;

// function TioDependencyInjectionRegister.SetBindSource(const AName: String;
// const ABindSourceAdapter: IioActiveBindSourceAdapter): TioDependencyInjectionRegister;
// var
// I: Integer;
// begin
// I := Length(FContainerValue.PresenterSettings);
// SetLength(FContainerValue.PresenterSettings, I+1);
// FContainerValue.PresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstBindSourceAdapter;
// FContainerValue.PresenterSettings[I].Name := AName;
// FContainerValue.PresenterSettings[I].InterfacedObj  := ABindSourceAdapter;
// Result := Self;
// end;

function TioDependencyInjectionRegister.SetBindSource(const AName: String; const AMasterBindSource: IioNotifiableBindSource; const AMasterPropertyName: String)
  : TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, i + 1);
  FContainerValue.PresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstMasterModelPresenter;
  FContainerValue.PresenterSettings[i].Name := AName;
  FContainerValue.PresenterSettings[i].Obj := (AMasterBindSource as TObject);
  FContainerValue.PresenterSettings[i].StringParameter := AMasterPropertyName;
  Result := Self;
end;

function TioDependencyInjectionRegister.InjectField(const AFieldName, ATypeName, ATypeAlias: String): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, i + 1);
  FContainerValue.PropertiesOnCreate[i].PropFieldType := itField;
  FContainerValue.PropertiesOnCreate[i].PropFieldValue := ivByDependencyInjection;
  FContainerValue.PropertiesOnCreate[i].Name := AFieldName;
  FContainerValue.PropertiesOnCreate[i].TypeName := ATypeName;
  FContainerValue.PropertiesOnCreate[i].TypeAlias := ATypeAlias;
  Result := Self;
end;

function TioDependencyInjectionRegister.InjectProperty(const APropertyName, ATypeName, ATypeAlias: String): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PropertiesOnCreate);
  SetLength(FContainerValue.PropertiesOnCreate, i + 1);
  FContainerValue.PropertiesOnCreate[i].PropFieldType := itProperty;
  FContainerValue.PropertiesOnCreate[i].PropFieldValue := ivByDependencyInjection;
  FContainerValue.PropertiesOnCreate[i].Name := APropertyName;
  FContainerValue.PropertiesOnCreate[i].TypeName := ATypeName;
  FContainerValue.PropertiesOnCreate[i].TypeAlias := ATypeAlias;
  Result := Self;
end;

function TioDependencyInjectionRegister.SetBindSource(const AName, AOrderBy: String): TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, i + 1);
  FContainerValue.PresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstOrderBy;
  FContainerValue.PresenterSettings[i].Name := AName;
  FContainerValue.PresenterSettings[i].StringParameter := AOrderBy;
  Result := Self;
end;

function TioDependencyInjectionRegister.SetBindSourceAsSelectorFor(const ASourcePresenterName: String; const ASelectionDest: IioNotifiableBindSource)
  : TioDependencyInjectionRegister;
var
  i: Integer;
begin
  i := Length(FContainerValue.PresenterSettings);
  SetLength(FContainerValue.PresenterSettings, i + 1);
  FContainerValue.PresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstSelectorFor;
  FContainerValue.PresenterSettings[i].Name := ASourcePresenterName;
  FContainerValue.PresenterSettings[i].Obj := (ASelectionDest as TObject);
  Result := Self;
end;

function TioDependencyInjectionRegister._SetFarAncestorClassNameImplementingTheSameInterface(const AValue: String): TioDependencyInjectionRegister;
begin
  FContainerValue.TrueClassVirtualMapName := AValue;
  Result := Self;
end;

function TioDependencyInjectionRegister.AsViewFor(const ATargetClassRef: TioClassRef; const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsViewFor(ATargetClassRef.ClassName, AAlias);
end;

function TioDependencyInjectionRegister.AsViewFor(const ATargetTypeName, AAlias: String): TioDependencyInjectionRegister;
begin
  // Set the InterfaceName
  FInterfaceName := ModelToViewContainerKey(ATargetTypeName);
  FInterfaceNameOriginal := ATargetTypeName;
  // Set the Alias
  if not AAlias.IsEmpty then
    Self.FAlias := AAlias;
  // Return itself
  Result := Self;
end;

function TioDependencyInjectionRegister.AsViewFor(const ATargetIID: TGUID; const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsViewFor(TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias);
end;

function TioDependencyInjectionRegister.AsViewFor<T>(const AAlias: String): TioDependencyInjectionRegister;
begin
  // Result := Self.AsViewFor(T.ClassName, AAlias);
  Result := Self.AsViewFor(TioUtilities.GenericToString<T>, AAlias);
end;

function TioDependencyInjectionRegister.AsViewModelFor(const ATargetClassRef: TioClassRef; const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsViewModelFor(ATargetClassRef.ClassName, AAlias);
end;

function TioDependencyInjectionRegister.AsViewModelFor(const ATargetTypeName, AAlias: String): TioDependencyInjectionRegister;
begin
  // Set the InterfaceName
  FInterfaceName := ModelToViewModelContainerKey(ATargetTypeName);
  FInterfaceNameOriginal := ATargetTypeName;
  // Set the Alias
  if not AAlias.IsEmpty then
    Self.FAlias := AAlias;
  // Return itself
  Result := Self;
end;

function TioDependencyInjectionRegister.AsViewModelFor(const ATargetIID: TGUID; const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsViewModelFor(TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias);
end;

function TioDependencyInjectionRegister.AsViewModelFor<T>(const AAlias: String): TioDependencyInjectionRegister;
begin
  Result := Self.AsViewModelFor(TioUtilities.GenericToString<T>, AAlias);
end;

{ TioDependencyInjectionContainer }

class procedure TioDependencyInjectionContainer.Add(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey;
  const AValue: TioDIContainerImplementersItem);
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  // If the Key not exist then create the SubContainer and add it to the MasterContainer
  if not Self.FContainer.ContainsKey(AKey) then
    Self.FContainer.Add(AKey, TioDIContainerValue.Create);
  // Add the Value to the SubKey
  Self.FContainer.Items[AKey].Add(ASubKey, AValue);
end;

class procedure TioDependencyInjectionContainer.Build;
begin
  Self.FContainer := TioDIContainerInstance.Create([doOwnsValues]);
end;

class procedure TioDependencyInjectionContainer.CleanUp;
begin
  Self.FContainer.Free;
end;

class function TioDependencyInjectionContainer.Exists(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): Boolean;
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  Result := Self.FContainer.ContainsKey(AKey) and Self.FContainer.Items[AKey].Contains(ASubKey);
end;

class procedure TioDependencyInjectionContainer.FillAncestorClassNameImplementingTheSameInterfaceSameTableAndConnection;
var
  LInterfaceName: String;
  LImplementersItem: TioDIContainerImplementersItem;
  LFarAncestorType: TRttiInstanceType;
  // Ricava la classe più in alto nella gerarchia (quello più vicina a TObject) che implementa la
  // stessa interfaccia, che è persistita sulla stessa tabella e sulla stessa connessione
  function _GetTrueClassVirtualMapName(ARttiInstanceType: TRttiInstanceType; const IID: TGUID): String;
  var
    LStartMap: IioMap;
    LCurrMap: IioMap;
    LResultMap: IioMap;
  begin
    LStartMap := TioMapContainer.GetMap(ARttiInstanceType.Name);
    LResultMap := LStartMap;
    // Cicla finchè c'è una classe antenata che implementa la stessa interfaccia
    while (ARttiInstanceType <> nil) and Supports(ARttiInstanceType.MetaclassType, IID) do
    begin
      // Se la classe attuale è mappata (quindi è una entity) allora la considera altrimenti la salta e passa alla prossima
      // (in pratica considera solo le entity quindi se c'è ad esempmio una classe astratta come antenato comune ma questa
      // giustamente non è uan entità (in quanto astratta non c'è l'attributo ioEntity) questa non viene considerata.
      if TioMapContainer.Exist(ARttiInstanceType.Name) then
      begin
        LCurrMap := TioMapContainer.GetMap(ARttiInstanceType.Name, False);
        if (LCurrMap.GetTable.TableName = LStartMap.GetTable.TableName) and (LCurrMap.GetTable.GetConnectionDefName = LStartMap.GetTable.GetConnectionDefName)
        then
          LResultMap := LCurrMap;
      end;
      ARttiInstanceType := ARttiInstanceType.BaseType;
    end;
    // Quando arriva qui Result contiene il riferimento alla classe più in alto nella gerarchia (più vicino a TObject) mappata sulla stessa
    // tabella e connessione, a questo punto crea (se non già esistente) la TrueClassVirtualMap relativa (una specie di supermappa che
    // poi conterrà tutti i campi relativi a tutte le proprietà di tutte le classi che derivano) e la registra.
    // Note: "AddTrueTypeVirtualMapIfNotExists" ritorna il nome della mappa
    Result := TioMapContainer.AddTrueTypeVirtualMapIfNotExists(LResultMap);
  end;

begin
  // Loop for all interfaces in the internal container (tenere presente che posso essere registrate anche direttamente della classi)
  for LInterfaceName in FContainer.Keys do
    // Interfaces only
    if TioUtilities.IsAnInterfaceTypeName(LInterfaceName) then
      // Loop for all implementers of the current interface
      for LImplementersItem in FContainer.Items[LInterfaceName] do
        // Enties only
        if LImplementersItem.IsEntity then
          LImplementersItem.TrueClassVirtualMapName := _GetTrueClassVirtualMapName(LImplementersItem.RttiType, LImplementersItem.InterfaceGUID);
end;

class function TioDependencyInjectionContainer.Get(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  if not Self.Exists(AKey, ASubKey) then
    raise EioException.Create(Self.ClassName, 'Get', Format('Implementer for "%s" alias "%s" not found.', [AKey, ASubKey]));
  Result := Self.FContainer.Items[AKey].GetItem(ASubKey);
end;

class function TioDependencyInjectionContainer.GetInterfaceImplementers(AKey: TioDIContainerKey): TioDIContainerValue;
begin
  AKey := Uppercase(AKey);
  if not Self.ImplementersExists(AKey) then
    raise EioException.Create(Self.ClassName + ': implementers for interface "' + AKey + '" not found.');
  Result := Self.FContainer.Items[AKey];
end;

class function TioDependencyInjectionContainer.ImplementersExists(AKey: TioDIContainerKey): Boolean;
begin
  AKey := Uppercase(AKey);
  Result := FContainer.ContainsKey(AKey);
end;

class procedure TioDependencyInjectionContainer.Remove(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey);
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  if Exists(AKey, ASubKey) and FContainer.Items[AKey].RemoveAndCheckIfEmpty(ASubKey) then
    FContainer.Remove(AKey);
end;

{ TioDependencyInjectionLocator }

function TioDependencyInjectionLocator.Alias(const AAlias: String): IioDependencyInjectionLocator;
begin
  FAlias := AAlias;
  Result := Self;
end;

procedure TioDependencyInjectionLocator.CheckConstructorInfo(const AContainerItem: TioDIContainerImplementersItem);
var
  i: Integer;
begin
  // If a constructor method name or constructor marker is specified in the locator call then use it (method, marker and params)
  // else use the default values
  if FConstructorMethod.IsEmpty and FConstructorMarker.IsEmpty and (Length(FConstructorParams) = 0) then
  begin
    FConstructorMethod := AContainerItem.DefaultConstructorMethod;
    FConstructorMarker := AContainerItem.DefaultConstructorMarker;
    // Solo così sembra andare bene
    SetLength(FConstructorParams, Length(AContainerItem.DefaultConstructorParams));
    for i := 0 to High(AContainerItem.DefaultConstructorParams) do
      FConstructorParams[i] := AContainerItem.DefaultConstructorParams[i];
  end;
end;

procedure TioDependencyInjectionLocator.ClearPresenterSettings;
begin
  SetLength(FPresenterSettings, 0);
end;

function TioDependencyInjectionLocator.ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator;
begin
  FConstructorMarker := AConstructorMarker;
  Result := Self;
end;

function TioDependencyInjectionLocator.ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator;
begin
  FConstructorMethod := AConstructorMethod;
  Result := Self;
end;

function TioDependencyInjectionLocator.ConstructorParams(const AParams: TioConstructorParams): IioDependencyInjectionLocator;
var
  i: Integer;
begin
  // Solo così sembra andare bene
  SetLength(FConstructorParams, Length(AParams));
  for i := 0 to High(AParams) do
    FConstructorParams[i] := AParams[i];
  Result := Self;
end;

constructor TioDependencyInjectionLocator.Create(const AInterfaceName, AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean);
begin
  inherited Create;
  FInterfaceName := AInterfaceName;
  FAlias := AAlias;
  FViewModel := nil;
  FViewModelMarker := '';
  FVCProvider := nil;
  FVCProviderEnabled := AVCProviderEnabled;
  FViewContext := nil;
  FViewContextFreeMethod := nil;
  FOwnerRequested := AOwnerRequested;
  FSingletonKey := '';
end;

function TioDependencyInjectionLocator.Exist: Boolean;
begin
  Result := Self.Container.Exists(Self.FInterfaceName, Self.FAlias);
end;

function TioDependencyInjectionLocator.ExtractVMFromView(const AView: TComponent): IioViewModel;
var
  LVMBridge: TioViewModelBridge;
begin
  Result := nil;
  LVMBridge := TioViewModelBridge.ExtractVMBridge(AView);
  if Assigned(LVMBridge) and LVMBridge.ViewModelIsAssigned then
    Result := LVMBridge.ViewModel;
end;

function TioDependencyInjectionLocator.Get: TObject;
var
  ContainerItem: TioDIContainerImplementersItem;
begin
  ContainerItem := Self.Container.Get(_InterfaceName, _Alias);
  Result := Self._Get(ContainerItem);
end;

function TioDependencyInjectionLocator.GetAsGeneric: TioDILocatorDestination;
begin
  Result := TioDILocatorDestination.Create(Self);
end;

function TioDependencyInjectionLocator.GetItem: TioDIContainerImplementersItem;
begin
  Result := Self.Container.Get(Self.FInterfaceName, Self.FAlias);
end;

function TioDependencyInjectionLocator.PresenterSettingsExists: Boolean;
begin
  Result := (Length(FPresenterSettings) > 0);
end;

function TioDependencyInjectionLocator.SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator;
begin
  FSingletonKey := ASingletonKey;
  Result := Self;
end;

// function TioDependencyInjectionLocator.SetBindSource(const AName: String;
// const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator;
// var
// I: Integer;
// begin
// I := Length(FPresenterSettings);
// SetLength(FPresenterSettings, I+1);
// FPresenterSettings[I].SettingsType := TioDIPresenterSettingsType.pstBindSourceAdapter;
// FPresenterSettings[I].Name := AName;
// FPresenterSettings[I].InterfacedObj  := ABindSourceAdapter;
// Result := Self;
// end;

function TioDependencyInjectionLocator.SetBindSource(const AName: String; const ADataObject: TObject): IioDependencyInjectionLocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstDataObject;
  FPresenterSettings[i].Name := AName;
  FPresenterSettings[i].Obj := ADataObject;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetBindSource(const AName: String; const AMasterBindSource: IioNotifiableBindSource; const AMasterPropertyName: String)
  : IioDependencyInjectionLocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstMasterModelPresenter;
  FPresenterSettings[i].Name := AName;
  FPresenterSettings[i].Obj := (AMasterBindSource as TObject);
  FPresenterSettings[i].StringParameter := AMasterPropertyName;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetBindSource(const AName, AOrderBy: String): IioDependencyInjectionLocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstOrderBy;
  FPresenterSettings[i].Name := AName;
  FPresenterSettings[i].StringParameter := AOrderBy;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetBindSource(const AName: String; const AWhere: IioWhere): IioDependencyInjectionLocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstWhere;
  FPresenterSettings[i].Name := AName;
  FPresenterSettings[i].InterfacedObj := AWhere;
  Result := Self;
end;

// function TioDependencyInjectionLocator.SetBindSource(
// const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator;
// begin
// Result := SetBindSource('', ABindSourceAdapter);
// end;

function TioDependencyInjectionLocator.SetBindSource(const ADataObject: TObject): IioDependencyInjectionLocator;
begin
  Result := SetBindSource('', ADataObject);
end;

function TioDependencyInjectionLocator.SetBindSource(const AMasterBindSource: IioNotifiableBindSource; const AMasterPropertyName: String)
  : IioDependencyInjectionLocator;
begin
  Result := SetBindSource('', AMasterBindSource, AMasterPropertyName);
end;

function TioDependencyInjectionLocator.SetBindSource(const AOrderBy: String): IioDependencyInjectionLocator;
begin
  Result := SetBindSource('', AOrderBy);
end;

function TioDependencyInjectionLocator.SetBindSource(const AInterfacedObj: IInterface): IioDependencyInjectionLocator;
begin
  Result := SetBindSource('', AInterfacedObj);
end;

function TioDependencyInjectionLocator.SetBindSource(const AName: String; const AInterfacedObj: IInterface): IioDependencyInjectionLocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstInterfacedObj;
  FPresenterSettings[i].Name := AName;
  FPresenterSettings[i].InterfacedObj := AInterfacedObj;
  Result := Self;
end;

function TioDependencyInjectionLocator.SetBindSourceAsSelectorFor(const ASourceBSName: String; const ASelectionDest: IioNotifiableBindSource)
  : IioDependencyInjectionLocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstSelectorFor;
  FPresenterSettings[i].Name := ASourceBSName;
  FPresenterSettings[i].Obj := (ASelectionDest as TObject);
  Result := Self;
end;

function TioDependencyInjectionLocator.SetBindSourceAsSelectorFor(const ASelectionDest: IioNotifiableBindSource): IioDependencyInjectionLocator;
begin
  Result := SetBindSourceAsSelectorFor('', ASelectionDest);
end;

function TioDependencyInjectionLocator.SetBindSource(const AWhere: IioWhere): IioDependencyInjectionLocator;
begin
  Result := SetBindSource('', AWhere);
end;

function TioDependencyInjectionLocator.SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc): IioDependencyInjectionLocator;
begin
  Result := Self;
  FViewContext := AViewContext;
  FViewContextFreeMethod := AViewContextFreeMethod;
end;

function TioDependencyInjectionLocator.SetViewModel(const AViewModel: IioViewModel; const AMarker: String): IioDependencyInjectionLocator;
begin
  FViewModelMarker := AMarker;
  FViewModel := AViewModel;
  Result := Self;
end;

function TioDependencyInjectionLocator.Show: TComponent;
begin
  Result := Self.Get as TComponent;
end;

function TioDependencyInjectionLocator.ShowCurrent: TComponent;
begin
  Result := nil;
  // Check if FForEachModelPresenter is assigned
  if not Assigned(FForEachModelPresenter) then
    raise EioException.Create(Self.ClassName, 'ShowCurrent',
      '"FForEachModelPresenter" private field not assigned...'#13#13'ShowCurrent must be used with "io.ShowCurrent(AModelPrenter)" or "io.di.LocateViewVMFor(AModelPresenter)..." or other equivalent with ModelPresenter as parameter.');
  // Check for BindSourceAdapter and not empty
  FForEachModelPresenter.CheckAdapter(True);
  if FForEachModelPresenter.ItemCount = 0 then
    Exit;
  // Show the current object
  Result := _ShowCurrent;
end;

procedure TioDependencyInjectionLocator.ShowEach;
var
  i: Integer;
begin
  // Check if FForEachModelPresenter is assigned
  if not Assigned(FForEachModelPresenter) then
    raise EioException.Create(Self.ClassName, 'ShowCurrent',
      '"FForEachModelPresenter" private field not assigned...'#13#13'ShowCurrent must be used with "io.ShowCurrent(AModelPrenter)" or "io.di.LocateViewVMFor(AModelPresenter)..." or other equivalent with ModelPresenter as parameter.');
  // Check for BindSourceAdapter and not empty
  FForEachModelPresenter.CheckAdapter(True);
  if FForEachModelPresenter.ItemCount = 0 then
    Exit;
  // Loop for all "records"
  FForEachModelPresenter.First;
  for i := 1 to FForEachModelPresenter.ItemCount do
  begin
    // Show the current object
    _ShowCurrent;
    FForEachModelPresenter.Next;
  end;
end;

procedure TioDependencyInjectionLocator._DuplicateLocatorForShowEachPurposeFrom(const ASourceLocator: TioDependencyInjectionLocator);
begin
  FAlias := ASourceLocator._GetAlias;
  FConstructorMethod := ASourceLocator._GetConstructorMethod;
  FConstructorMarker := ASourceLocator._GetConstructorMarker;
  FConstructorParams := ASourceLocator._GetConstructorParams^;
  FVCProvider := ASourceLocator._GetVCProvider;
  FViewContext := ASourceLocator._GetViewContext;
end;

function TioDependencyInjectionLocator._Get(const AContainerItem: TioDIContainerImplementersItem): TObject;
var
  LValue: TValue;
begin
  Result := nil;
  // if the ViewModel is present then Lock it (MVVM)
  // and initializa it with PresenterSettings if exists
  if Self.ViewModelExist then
  begin
    if PresenterSettingsExists then
    begin
      TioObjectMakerIntf.InitializeViewModelPresentersAfterCreate(FViewModel as TObject, @FPresenterSettings);
      ClearPresenterSettings;
    end;
    TioViewModelShuttleContainer.AddViewModel(FViewModel, FViewModelMarker);
  end;
  try
    // EmptyOwner is True then add a nil as parameter for the constructor
    // (used for Views and ViewModels and for object owned by someone)
    if FOwnerRequested and (Length(FConstructorParams) = 0) then
    begin
      // If the use of the ViewContextProvider is enabled (Locating a View)
      // then try to retrieve and set the ViewContext for the View.
      // If a specific VCProvider is already assigned then use it else try
      // to retrieve the global default one, if not exist then do none
      // (no ViewContext assigned to the view).
      // NB: Se è stato specificato un ViewContext esplicito (SetViewContext), usa quello
      // e considera il tutto come con AutoOwner e AutoParent = True
      if FVCProviderEnabled and (not Assigned(FViewContext)) and AContainerItem.RttiType.MetaclassType.InheritsFrom(TComponent) then
      // and (Result is TComponent) then
      begin
        if not Assigned(FVCProvider) then
          FVCProvider := TioViewContextProviderContainer.GetProvider;
        if Assigned(FVCProvider) then
          FViewContext := FVCProvider.NewViewContext
        else
          raise EioException.Create(Self.ClassName, '_Get', 'ViewContextProvider component not found!!!');
      end;
      if Assigned(FViewContext) and AContainerItem.RttiType.MetaclassType.InheritsFrom(TComponent) then
        TValue.Make(@FViewContext, FViewContext.ClassInfo, LValue)
      else
        LValue := TValue.Empty;
      FConstructorParams := [LValue];
    end;
    // If it is a singleton then get the Instance (if exists)...
    if AContainerItem.IsSingleton and TioSingletonsContainer.TryGet(FSingletonKey, FInterfaceName, FAlias, Result) then
      // Nothing
      // ... else create the object (and add it to the ContainerItem.ObjInstance if
      // it is a new instance of a singleton)
    else
    begin
      // If a constructor method name or constructor marker is specified in the locator call then use it (method, marker and params)
      // else use the default values
      Self.CheckConstructorInfo(AContainerItem);
      // Object creation
      // Result := TioObjectMaker.CreateObjectByClassRefEx(AContainerItem.ClassRef, FConstructorParams, FConstructorMarker, FConstructorMethod, AContainerItem);
      Result := TioObjectMaker.CreateObjectByRttiTypeEx(AContainerItem.RttiType, FConstructorParams, FConstructorMarker, FConstructorMethod, AContainerItem);
      // If some PresenterSettings exists and the result object is a ViewModel then
      // apply it
      // NB: Il codice commentato a dx della riga sotto poteva causare un errore dovuto alla
      // morte prematura del ViewModel appena creato per via del reference count, sostituito
      // con la condizione (Result is TioViewModel) il problema si è risolto e mi va bene così
      // perchè tanto un ViewModel deve per forza ereditare da TioViewModel.
      if PresenterSettingsExists and (Result is TioViewModel) then // Supports(Result, IioViewModel) then
        TioObjectMakerIntf.InitializeViewModelPresentersAfterCreate(Result, @FPresenterSettings);
      // If it is a new instance of a singleton then add it to the SingletonsContainer
      if AContainerItem.IsSingleton then
        TioSingletonsContainer.Add(FSingletonKey, FInterfaceName, FAlias, Result);
    end;
    // If the use of the ViewContextProvider is enabled (Locating a View)
    // then set the parent of the view to the ViewContext
    if FVCProviderEnabled and (Result is TComponent) and Assigned(FViewContext) then
    begin
      // Set the ViewContext as parent view
      TioControl.SetParent(Result, FViewContext);
      // Fire the onAfterRequest event handler of the ViewContextProvider component
      if Assigned(FVCProvider) then
        FVCProvider.DoOnAfterRequest(TComponent(Result), FViewContext);
      // If at this point the FViewModel is not already assigned then try to extract
      // it from the View.VMBridge. Indeed it may have been that it was created by
      // the VMBridge itself is its properties DI_VMInterface and DI_VMAlias are
      // setted properly.
      if not Assigned(FViewModel) then
        FViewModel := ExtractVMFromView(TComponent(Result));
      // Register View, ViewContext and ViewContextProvider in the ViewRegister of the ViewModel
      if Assigned(FViewModel) then
        (FViewModel as IioViewModelInternal).RegisterView(TComponent(Result), FViewContext, FVCProvider, FViewContextFreeMethod);
    end
  finally
    // if the ViewModel is present then UnLock it (MVVM)
    if Self.ViewModelExist then
      TioViewModelShuttleContainer.DeleteViewModel(FViewModelMarker);
  end;
end;

function TioDependencyInjectionLocator._GetAlias: String;
begin
  Result := FAlias;
end;

function TioDependencyInjectionLocator._GetConstructorMarker: String;
begin
  Result := FConstructorMarker;
end;

function TioDependencyInjectionLocator._GetConstructorMethod: String;
begin
  Result := FConstructorMethod;
end;

function TioDependencyInjectionLocator._GetConstructorParams: PioConstructorParams;
begin
  Result := @FConstructorParams;
end;

function TioDependencyInjectionLocator._GetVCProvider: TioViewContextProvider;
begin
  Result := FVCProvider;
end;

function TioDependencyInjectionLocator._GetViewContext: TComponent;
begin
  Result := FViewContext;
end;

procedure TioDependencyInjectionLocator._SetForEachModelPresenter(const AModelPresenter: IioNotifiableBindSource; const ALocateViewModel: Boolean);
begin
  FForEachModelPresenter := AModelPresenter;
  FForEachLocateViewModel := ALocateViewModel;
end;

function TioDependencyInjectionLocator._ShowCurrent: TComponent;
var
  LLocator: TioDependencyInjectionLocator;
begin
  // Check if FForEachModelPresenter is assigned
  if not Assigned(FForEachModelPresenter) then
    raise EioException.Create(Self.ClassName, 'ShowCurrent',
      '"FForEachModelPresenter" private field not assigned...'#13#13'ShowCurrent must be used with "io.ShowCurrent(AModelPrenter)" or "io.di.LocateViewVMFor(AModelPresenter)..." or other equivalent with ModelPresenter as parameter.');
  // Retrieve the correct locator
  if FForEachLocateViewModel then
    LLocator := TioDependencyInjectionFactory.GetViewVMLocatorFor(FForEachModelPresenter, FAlias, True) as TioDependencyInjectionLocator
  else
    LLocator := TioDependencyInjectionFactory.GetViewLocatorFor(FForEachModelPresenter, FAlias) as TioDependencyInjectionLocator;
  // Set the locator
  LLocator._DuplicateLocatorForShowEachPurposeFrom(Self);
  Result := LLocator.Show;
end;

function TioDependencyInjectionLocator.VCProvider(const AVCProvider: TioViewContextProvider): IioDependencyInjectionLocator;
begin
  Result := Self;
  FVCProvider := AVCProvider;
end;

function TioDependencyInjectionLocator.VCProvider(const AName: String): IioDependencyInjectionLocator;
begin
  Result := Self;
  FVCProvider := TioViewContextProviderContainer.GetProvider(AName);
end;

function TioDependencyInjectionLocator.ViewModelExist: Boolean;
begin
  Result := Assigned(Self.FViewModel);
end;

{ TioDependencyInjectionFactory }

// class procedure TioDependencyInjectionFactory._CheckModelPresenter(const ATargetMP: TioModelPresenter);
// begin
// // Check the ModelPresenter
// if not Assigned(ATargetMP) then
// raise EioException.Create(Self.ClassName, 'CheckModelPresenter', 'Parameter "AModelPresenter" not assigned.');
// // Check the bind source adapter
// if not ATargetMP.CheckAdapter then
// raise EioException.Create(Self.ClassName, 'CheckModelPresenter', 'ActiveBindSourceAdapter not assigned in the "AModelPresenter" parameter.');
// // Check the ModelPresenter.Current object
// if (ATargetMP.Current = nil) then
// raise EioException.Create(Self.ClassName, 'CheckModelPresenter', '"Current" object of the ModelPresenter not assigned.');
// end;

class function TioDependencyInjectionFactory.GetLocator(const AInterfaceName, AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean)
  : IioDependencyInjectionLocator;
begin
  Result := TioDependencyInjectionLocator.Create(AInterfaceName, AAlias, AOwnerRequested, AVCProviderEnabled);
end;

class function TioDependencyInjectionFactory.GetViewLocatorFor(const ATargetMP: IioNotifiableBindSource; const AAlias: String): IioDependencyInjectionLocator;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetMP, True, True);
  // Try to retrieve a locator for MP.Current instance
  if io.di.LocateViewFor(ATargetMP.Current, AAlias).Exist then
    // Result := io.di.LocateViewFor(ATargetMP.Current, AAlias) // NB: Mauri 05/03/2020 - Vecchio codice con il quale non funzionava l'AutorefreshOnNotification
    Result := io.di.LocateViewFor(ATargetMP.Current.ClassName, AAlias)
  else
    // Try to retrieve a locator for MP.TypeName
    if io.di.LocateViewFor(ATargetMP.GetTypeName, AAlias).Exist then
      // Result := io.di.LocateViewFor(ATargetMP.TypeName, AAlias).SetPresenter(ATargetMP.Current) // NB: Mauri 05/03/2020 - Vecchio codice con il quale non funzionava l'AutorefreshOnNotification
      Result := io.di.LocateViewFor(ATargetMP.GetTypeName, AAlias).SetBindSource(ATargetMP)
    else
      raise EioException.Create(Self.ClassName, 'GetViewLocatorFor', Format('There are no Views registered for "%s" or "%s" alias "%s".',
        [ATargetMP.Current.ClassName, ATargetMP.GetTypeName, AAlias]));
  // Set the locator
  Result._SetForEachModelPresenter(ATargetMP, True);

  // ---------- OLD CODE -----------
  // // Check for ModelPresenter validity
  // TioModelPresenter.IsValidForDependencyInjectionLocator(ATargetMP, True, True);
  // // Try to retrieve a locator for MP.Current instance as Interface
  // if ATargetMP.IsInterfacePresenting
  // and io.di.LocateViewFor(ATargetMP.CurrentAs<IInterface>, AAlias).Exist
  // then
  // Result := io.di.LocateViewFor(ATargetMP.CurrentAs<IInterface>, AAlias)
  // else
  // // Try to retrieve a locator for MP.Current instance as Class
  // if (not ATargetMP.IsInterfacePresenting)
  // and io.di.LocateViewFor(ATargetMP.Current, AAlias).Exist
  // then
  // Result := io.di.LocateViewFor(ATargetMP.Current, AAlias)
  // else
  // // Try to retrieve a locator for MP.TypeName
  // if io.di.LocateViewFor(ATargetMP.TypeName, AAlias).Exist
  // then
  // Result := io.di.LocateViewFor(ATargetMP.TypeName, AAlias)
  // else
  // raise EioException.Create(Self.ClassName, 'GetViewLocatorFor',
  // Format('There are no Views registered for "%s" or "%s" alias "%s".',
  // [ATargetMP.Current.ClassName, ATargetMP.TypeName, AAlias]));
  // // Set the locator
  /// /  Result.SetPresenter(ATargetMP, ''); // NB: Non credo sia più necessaria questa riga
  // Result._SetForEachModelPresenter(ATargetMP, True);
  // ---------- OLD CODE -----------
end;

class function TioDependencyInjectionFactory.GetViewVMLocatorFor(const ATargetMP: IioNotifiableBindSource; const AAlias: String;
  const ACreateViewModel: Boolean): IioDependencyInjectionLocator;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetMP, True, True);
  // Try to retrieve a locator for MP.Current instance
  if io.di.LocateViewFor(ATargetMP.Current, AAlias).Exist and io.di.LocateVMfor(ATargetMP.Current, AAlias).Exist then
  begin
    if ACreateViewModel then
      Result := io.di._LocateForEachVVM_2ndPhase_Create(ATargetMP, ATargetMP.Current.ClassName, AAlias)
    else
      Result := io.di._LocateForEachVVM_1stPhase_Browse(ATargetMP.Current.ClassName, AAlias);
  end
  else
    // Try to retrieve a locator for MP.TypeName
    if io.di.LocateViewFor(ATargetMP.GetTypeName, AAlias).Exist and io.di.LocateVMfor(ATargetMP.GetTypeName, AAlias).Exist then
    begin
      if ACreateViewModel then
        Result := io.di._LocateForEachVVM_2ndPhase_Create(ATargetMP, ATargetMP.GetTypeName, AAlias)
      else
        Result := io.di._LocateForEachVVM_1stPhase_Browse(ATargetMP.GetTypeName, AAlias);
    end
    else
      raise EioException.Create(Self.ClassName, 'GetViewVMLocatorFor', Format('There are no Views and/or ViewModels registered for "%s" or "%s" alias "%s".',
        [ATargetMP.Current.ClassName, ATargetMP.GetTypeName, AAlias]));
  // Set the locator
  Result._SetForEachModelPresenter(ATargetMP, True);

  // ---------- OLD CODE -----------
  // // Check for ModelPresenter validity
  // TioModelPresenter.IsValidForDependencyInjectionLocator(ATargetMP, True, True);
  // // Try to retrieve a locator for MP.Current instance as hInterface
  // if ATargetMP.IsInterfacePresenting
  // and io.di.LocateViewFor(ATargetMP.CurrentAs<IInterface>, AAlias).Exist
  // and io.di.LocateVMfor(ATargetMP.CurrentAs<IInterface>, AAlias).Exist
  // then
  // begin
  // if ACreateViewModel then
  // Result := io.di.LocateViewVMFor(ATargetMP.CurrentAs<IInterface>, AAlias)
  // else
  // Result := io.di._InternalLocateViewVMfor(ATargetMP.Current.ClassName, AAlias);
  // end
  // else
  // // Try to retrieve a locator for MP.Current instance as Class
  // if (not ATargetMP.IsInterfacePresenting)
  // and io.di.LocateViewFor(ATargetMP.Current, AAlias).Exist
  // and io.di.LocateVMfor(ATargetMP.Current, AAlias).Exist
  // then
  // begin
  // if ACreateViewModel then
  // Result := io.di.LocateViewVMFor(ATargetMP.Current, AAlias)
  // else
  // Result := io.di._InternalLocateViewVMfor(ATargetMP.Current.ClassName, AAlias);
  // end
  // else
  // // Try to retrieve a locator for MP.TypeName
  // if io.di.LocateViewFor(ATargetMP.TypeName, AAlias).Exist
  // and io.di.LocateVMfor(ATargetMP.TypeName, AAlias).Exist
  // then
  // begin
  // if ACreateViewModel then
  // Result := io.di.LocateViewVMFor(ATargetMP.TypeName, AAlias).SetPresenter(ATargetMP.Current)
  // else
  // Result := io.di._InternalLocateViewVMfor(ATargetMP.TypeName, AAlias);
  // end
  // else
  // raise EioException.Create(Self.ClassName, 'GetViewVMLocatorFor',
  // Format('There are no Views and ViewModels registered for "%s" or "%s" alias "%s".',
  // [ATargetMP.Current.ClassName, ATargetMP.TypeName, AAlias]));
  // // Set the locator
  // Result._SetForEachModelPresenter(ATargetMP, True);
  // ---------- OLD CODE -----------
end;

class function TioDependencyInjectionFactory.GetLocator<TI>(const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean)
  : IioDependencyInjectionLocator<TI>;
begin
  Result := TioDependencyInjectionLocator<TI>.Create(TioUtilities.GenericToString<TI>, AAlias, AOwnerRequested, AVCProviderEnabled);
end;

class function TioDependencyInjectionFactory.GetRegister(const AContainerValue: TioDIContainerImplementersItem): TioDependencyInjectionRegister;
begin
  Result := TioDependencyInjectionRegister.Create(AContainerValue);
end;

{ TioDependencyInjectionLocator<T> }

function TioDependencyInjectionLocator<TI>.Alias(const AAlias: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).Alias(AAlias);
end;

function TioDependencyInjectionLocator<TI>.ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).ConstructorMarker(AConstructorMarker);
end;

function TioDependencyInjectionLocator<TI>.ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).ConstructorMethod(AConstructorMethod);
end;

function TioDependencyInjectionLocator<TI>.ConstructorParams(const AParams: TioConstructorParams): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).ConstructorParams(AParams);
end;

function TioDependencyInjectionLocator<TI>.Get: TI;
var
  ContainerItem: TioDIContainerImplementersItem;
begin
  ContainerItem := Self.Container.Get(_InterfaceName, _Alias);
  Result := TioUtilities.CastObjectToGeneric<TI>(_Get(ContainerItem), ContainerItem.InterfaceGUID);
end;

function TioDependencyInjectionLocator<TI>.SingletonKey(const ASingletonKey: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SingletonKey(ASingletonKey);
end;

// function TioDependencyInjectionLocator<TI>.SetBindSource(const AName: String;
// const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>;
// begin
// Result := Self;
// TioDependencyInjectionLocator(Self).SetBindSource(AName, ABindSourceAdapter);
// end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AName: String; const ADataObject: TObject): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AName, ADataObject);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AName: String; const AMasterPresenter: IioNotifiableBindSource;
  const AMasterPropertyName: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AName, AMasterPresenter, AMasterPropertyName);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AName, AOrderBy: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AName, AOrderBy);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AName: String; const AWhere: IioWhere): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AName, AWhere);
end;

function TioDependencyInjectionLocator<TI>.VCProvider(const AName: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VCProvider(AName);
end;

function TioDependencyInjectionLocator<TI>.VCProvider(const AVCProvider: TioViewContextProvider): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).VCProvider(AVCProvider);
end;

function TioDependencyInjectionLocator<TI>.SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc)
  : IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetViewContext(AViewContext, AViewContextFreeMethod);
end;

function TioDependencyInjectionLocator<TI>.SetViewModel(const AViewModel: IioViewModel; const AMarker: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetViewModel(AViewModel, AMarker);
end;

{ TioDependencyInjectionResolverBase }

// NB: FOR ENTITY PERSISTANCE PURPOSES ONLY
class function TioDependencyInjectionResolverBase.Resolve(const ATypeName: String; const AAlias: String; const AResolverMode: TioResolverMode;
  const AUseMapInfo: Boolean): IioResolvedTypeList;
  procedure _NestedResolveInterface;
  var
    LImplementer: TioDIContainerImplementersItem;
    LImplementerCollection: TioDIContainerImplementers;
    LMap: IioMap;
    LCurrentConnectionAndTable: String;
    LConnectionAndTableList: TStrings;
  begin
    LConnectionAndTableList := TStringList.Create;
    try
      // Get the collection of the classes implementing the interface
      LImplementerCollection := Container.GetInterfaceImplementers(ATypeName);
      // Loop for all the implementers
      for LImplementer in LImplementerCollection do
      begin
        // NB: FOR ENTITY PERSISTANCE PURPOSES ONLY
        if not LImplementer.IsEntity then
          Continue;
        // If the Use of maps info are enabled (default) then retreive ConnectionDefName and TableNamenfrom the map
        // and compose it together to avoid duplicate.
        // Else if the use of maps info are not enabled then return an empty string as ConnectionAndTable name
        // (this mode is called by iORM.ContextFactory.HasBelongsToRelation method because the mapping is
        // not completed at that time
        if AUseMapInfo then
        begin
          LMap := TioMapContainer.GetMap(LImplementer.ClassName);
          LCurrentConnectionAndTable := LMap.GetTable.GetConnectionDefName + '.' + LMap.GetTable.TableName + '.' + LImplementer.TrueClassVirtualMapName;
        end
        else
          LCurrentConnectionAndTable := '';
        // Add the implementer class to the result ConnectionAndTableList
        if (AResolverMode = rmAll) or (LConnectionAndTableList.IndexOf(LCurrentConnectionAndTable) = -1) then
        begin
          // Result.Add(LImplementer.ClassName); // Mauri: 16/06/2022
          Result.Add(LImplementer.TrueClassVirtualMapName);
          LConnectionAndTableList.Add(LCurrentConnectionAndTable);
        end;
      end;
    finally
      LConnectionAndTableList.Free;
    end;
  end;

begin
  // Create the ResolvedTypeList
  Result := TioResolverFactory.GetResolvedTypeList;
  // If ATypeName is not an interface (is a class) then
  // return it and exit;
  if not TioUtilities.IsAnInterfaceTypeName(ATypeName) then
  begin
    Result.Add(ATypeName);
    Exit;
  end;
  // If ResolverMode = rmAll and Alias is NOT specified
  if (AResolverMode <= rmAllDistinctByConnectionAndTable) and AAlias.IsEmpty then
    _NestedResolveInterface
    // If Alias IS specified
  else
    Result.Add(Self.Container.Get(ATypeName, AAlias).ClassName);
end;

// NB: FOR ENTITY PERSISTANCE PURPOSES ONLY
class function TioDependencyInjectionResolverBase.ResolveInaccurateAsRttiType(const ATypeName, AAlias: String): TRttiType;
var
  LResolvedTypeList: IioResolvedTypeList;
  LFirstResolvedClassName: String;
  LFirstResolvedClassMap: IioMap;
begin
  // Resolve the type and alias
  LResolvedTypeList := Resolve(ATypeName, AAlias, TioResolverMode.rmAllDistinctByConnectionAndTable, True);
  // Se non trova nemmeno una classe solleva un'eccezione
  if LResolvedTypeList.Count = 0 then
    raise EioException.Create(Self.ClassName, 'ResolveInaccurateAsRttiType', Format('No class was found that implements the interface ("%s" alias "%s").',
      [ATypeName, AAlias]));
  // Get the first resolved class name
  LFirstResolvedClassName := LResolvedTypeList[0];
  // Get the map of the first resolved class
  LFirstResolvedClassMap := TioMapContainer.GetMap(LFirstResolvedClassName);
  // Ritorna la prima classe trovata che implementa l'interfaccia desiderata
  Result := LFirstResolvedClassMap.RttiType;
end;

{ TioDIContainerImplementers }

procedure TioDIContainerImplementers.Add(const AAlias: String; const AImplementerItem: TioDIContainerImplementersItem);
begin
  FInternalContainer.AddOrSetValue(AAlias, AImplementerItem);
end;

function TioDIContainerImplementers.Contains(const AAlias: TioDIContainerImplementersKey): Boolean;
begin
  Result := FInternalContainer.ContainsKey(AAlias);
end;

constructor TioDIContainerImplementers.Create;
begin
  inherited;
  FInternalContainer := TObjectDictionary<string, TioDIContainerImplementersItem>.Create([doOwnsValues]);
end;

destructor TioDIContainerImplementers.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioDIContainerImplementers.GetEnumerator: TEnumerator<TioDIContainerImplementersItem>;
begin
  Result := FInternalContainer.Values.GetEnumerator;
end;

function TioDIContainerImplementers.GetItem(const AAlias: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
begin
  Result := FInternalContainer.Items[AAlias];
end;

function TioDIContainerImplementers.RemoveAndCheckIfEmpty(ASubKey: String): Boolean;
begin
  FInternalContainer.Remove(ASubKey);
  Result := FInternalContainer.Count = 0;
end;

// function TioDependencyInjectionLocator<TI>.SetBindSource(
// const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator<TI>;
// begin
// Result := Self;
// TioDependencyInjectionLocator(Self).SetBindSource(ABindSourceAdapter);
// end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const ADataObject: TObject): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(ADataObject);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AMasterPresenter: IioNotifiableBindSource; const AMasterPropertyName: String)
  : IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AMasterPresenter, AMasterPropertyName);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AOrderBy: String): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AOrderBy);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AInterfacedObj: IInterface): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AInterfacedObj);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AName: String; const AInterfacedObj: IInterface): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AName, AInterfacedObj);
end;

function TioDependencyInjectionLocator<TI>.SetBindSourceAsSelectorFor(const ASourcePresenterName: String; const ASelectionDest: IioNotifiableBindSource)
  : IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSourceAsSelectorFor(ASourcePresenterName, ASelectionDest);
end;

function TioDependencyInjectionLocator<TI>.SetBindSourceAsSelectorFor(const ASelectionDest: IioNotifiableBindSource): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSourceAsSelectorFor(ASelectionDest);
end;

function TioDependencyInjectionLocator<TI>.SetBindSource(const AWhere: IioWhere): IioDependencyInjectionLocator<TI>;
begin
  Result := Self;
  TioDependencyInjectionLocator(Self).SetBindSource(AWhere);
end;

initialization

// NB: Spostato sulla initialize della unit iORM
// TioDependencyInjectionContainer.Build;
// TioViewModelShuttle.Build;

finalization

TioDependencyInjectionContainer.CleanUp;

end.
