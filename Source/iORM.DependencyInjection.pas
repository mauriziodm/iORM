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
unit iORM.DependencyInjection;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.Interfaces, System.SyncObjs, System.Rtti,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.Interfaces, iORM.Resolver.Interfaces, iORM.Context.Container,
  iORM.DependencyInjection.Singletons, iORM.DependencyInjection.Implementers, iORM.MVVM.ViewContextProvider,
  iORM.MVVM.ModelPresenter.Custom, iORM.Where.Interfaces, System.Classes, iORM.StdActions.Interfaces,
  System.SysUtils, iORM.LiveBindings.BSPersistence;

const
  DI_ENTITY_AUTOREGISTER_SUBKEY_PREFIX = '<E>';
  DI_SIMPLEVIEW_KEY_PREFIX = '<SV>';
  DI_VIEW_KEY_PREFIX = '<V>';
  DI_VIEWMODEL_KEY_PREFIX = '<VM>';

type

  // ===============================================================================================================================
  // Internal containers types
  // -------------------------------------------------------------------------------------------------------------------------------
  // Dependency Injection Container Interface IMPLEMENTERS (SubContainer)
  TioDIContainerImplementersKey = String;

  TioDIContainerImplementers = class
  strict private
    FInternalContainer: TObjectDictionary<TioDIContainerImplementersKey, TioDIContainerImplementersItem>;
    FEntityAutoRegisteredCount: Integer;
    procedure _IncCounter(const AAlias: String); inline;
    procedure _DecCounter(const AAlias: String); inline;
    function GetCount: Integer;
    function GetRegularRegisteredCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AAlias: TioDIContainerImplementersKey; const AImplementerItem: TioDIContainerImplementersItem);
    function GetItem(const AAlias: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
    function Contains(const AAlias: TioDIContainerImplementersKey): Boolean;
    function GetEnumerator: TEnumerator<TioDIContainerImplementersItem>;
    function RemoveAndCheckIfEmpty(AAlias: String): Boolean;
    function GetFirstAlias: String;
    property Count: Integer read GetCount;
    property EntityAutoRegisteredCount: Integer read FEntityAutoRegisteredCount;
    /// This property equals to Count-EntityPersistenceOnlyCount-SimpleViewCount-ViewCount-ViewModelCount
    property RegularRegisteredCount: Integer read GetRegularRegisteredCount;
  end;

  // Dependency injection container INTERFACES (MasterContainer)
  TioDIContainerKey = String;
  TioDIContainerValue = TioDIContainerImplementers;
  TioDIContainerInstance = TObjectDictionary<TioDIContainerKey, TioDIContainerValue>;
  // ===============================================================================================================================

  // Constructor params types
  TioConstructorParams = array of TValue;
  PioConstructorParams = ^TioConstructorParams;

  // ObjType (View, ViewModel, SimpleView, or normal subject)
  TioDICObjType = (dotRegular, dotAutoregisteredEntity, dotSimpleView, dotView, dotViewModel);

  // Dependency Injection Container (and relative class reference)
  TioDIContainerRef = class of TioDIContainer;

  TioDIContainer = class abstract
  strict private
    class var FContainer: TioDIContainerInstance;
    class function _SubKeyResolver(const AKey, ASubKey: String): String; static;
  public
    class procedure Build;
    class procedure CleanUp; inline;
    class procedure Add(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey; const AValue: TioDIContainerImplementersItem); static;
    class function Exists(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): Boolean; static;
    class function ImplementersExists(AKey: TioDIContainerKey): Boolean; static;
    class function Get(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): TioDIContainerImplementersItem; static;
    class function GetInterfaceImplementers(AKey: TioDIContainerKey): TioDIContainerValue; static;
    class procedure Remove(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey); static;
  end;

  // Base class for Dependency Injection Register and Locator classes
  TioDIBase = class
  strict protected
    class function Container: TioDIContainerRef; inline;
    class function BuildContainerKey(const AInterfaceName: String; const ADICObjType: TioDICObjType): String; inline;
  end;

  // ===========================================================================
  // CLASS REGISTER
  // ---------------------------------------------------------------------------
  // Register Class
  TioDIRegister = class(TioDIBase)
  strict private
    FImpementersItem: TioDIContainerImplementersItem;
  public
    constructor CreateByClass(const AClassRttiType: TRttiInstanceType; const AAlias: String; const ADICType: TioDICObjType);
    constructor CreateByIID(const AClassRttiType: TRttiInstanceType; const AImplementsIID: TGUID; const AAlias: String; const ADICType: TioDICObjType);
    constructor CreateByTargetTypeName(const AClassRttiType: TRttiInstanceType; const ATargetTypeName, AAlias: String; const ADICType: TioDICObjType);
    function _SetFarAncestorClassSameInterfaceAndTableAndConnection(const AValue: String): TioDIRegister;
    function AsEntity: TioDIRegister;
    function AsSingleton(const AIsSingleton: Boolean = True): TioDIRegister;
  end;
  // ===========================================================================

  // ===========================================================================
  // CLASS LOCATOR
  // ---------------------------------------------------------------------------
  TioDILocator = class(TioDIBase)
  strict private
    FInterfaceName: String;
    FAlias: String;
    FConstructorParams: TioConstructorParams;
    FPresenterSettings: TArray<TioDIPresenterSettings>;
    FViewModel: IioViewModelInternal;
    FViewModelMarker: String;
    FSingletonKey: String;
    FVCProvider: TioViewContextProvider;
    FVCProviderEnabled, FOwnerRequested: Boolean;
    FViewContext: TComponent; // For directly passed ViewContext (TCOmponent descendant) without the use of a ViewContextProvider
    FViewContextFreeMethod: TProc;
    FActionParentCloseQuery: IioBSCloseQueryAction;
    // For directly passed ViewContext (TCOmponent descendant) without the use of a ViewContextProvider (or in combination with it)
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    FForEachModelPresenter: IioBindSource;
    FForEachLocateViewModel: Boolean;
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    procedure ClearPresenterSettings;
    function PresenterSettingsExists: Boolean;
    function ViewModelExist: Boolean;
    function ExtractVMFromView(const AView: TComponent): IioViewModelInternal;
  strict protected
    function _ShowCurrent: TComponent;
    function _Get(const AContainerItem: TioDIContainerImplementersItem): TObject;
    property _InterfaceName: String read FInterfaceName;
    property _Alias: String read FAlias;
  public
    constructor Create(const AInterfaceName: String; const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean); virtual;
    function Exist: Boolean; virtual;
    function Get: TObject; virtual;
    function GetAs<TResult>: TResult;
    // TODO: 31/07/2024 - Verificare se serve ancora e se va messo anche qui un try-finally
    function GetItem: TioDIContainerImplementersItem;
    function Show: TComponent; virtual;
    function SingletonKey(const ASingletonKey: String): TioDILocator; virtual;
    // ---------- CONSTRUCTOR PARAMS ----------
    function ConstructorParams(const AParams: TioConstructorParams): TioDILocator; overload;
    function ConstructorParams<T1>(AArg1: T1): TioDILocator; overload;
    function ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDILocator; overload;
    function ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDILocator; overload;
    function ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDILocator; overload;
    function ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDILocator; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDILocator; overload;
    // ---------- CONSTRUCTOR PARAMS ----------
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    function ShowCurrent: TComponent;
    procedure ShowEach;
    procedure _SetForEachModelPresenter(const AModelPresenter: IioBindSource; const ALocateViewModel: Boolean);
    procedure _DuplicateLocatorForShowEachPurposeFrom(const ASourceLocator: TioDILocator);
    function _GetAlias: String;
    function _GetConstructorParams: PioConstructorParams;
    function _GetVCProvider: TioViewContextProvider;
    function _GetViewContext: TComponent;
    function _GetParentCloseQueryAction: IioBSCloseQueryAction;
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    // ---------- VIEWMODEL METHODS ----------
    function SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDILocator;
    // ---------- VIEWMODEL METHODS ----------
    // ---------- SETBINDSOURCE METHODS ----------
    // SetBindSource (passing the name of the destination presenter)
    function SetBindSource(const ABSName: String; const ADataObject: TObject): TioDILocator; overload;
    function SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDILocator; overload;
    function SetBindSource(const ABSName: String; const AMasterBindSource: IioBindSource; const AMasterPropertyName: String = ''): TioDILocator; overload;
    function SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDILocator; overload;
    function SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource): TioDILocator; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String; const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator; overload;
    function SetBindSourceAsETMfor(const AEtmBSName: String; const AEtmTargetBS: IioMasterBindSource): TioDILocator; overload;
    // SetBindSource (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject: TObject): TioDILocator; overload;
    function SetBindSource(const AInterfacedObj: IInterface): TioDILocator; overload;
    function SetBindSource(const AMasterBindSource: IioBindSource; const AMasterPropertyName: String = ''): TioDILocator; overload;
    function SetBindSource(const AWhere: IioWhere): TioDILocator; overload;
    function SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDILocator; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator; overload;
    function SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDILocator; overload;
    // ---------- SETBINDSOURCE METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider: TioViewContextProvider): TioDILocator;
    function SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc = nil): TioDILocator;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
    function SetParentCloseQueryAction(const AParentCLoseQueryAction: IioBSCloseQueryAction): TioDILocator;
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
  end;

  // Generic version of the Service Locator Class
  TioDILocator<TI> = class(TioDILocator)
  public
    function Get: TI; reintroduce; overload;
    function SingletonKey(const ASingletonKey: String): TioDILocator<TI>; reintroduce; overload;
    // ---------- CONSTRUCTOR PARAMS ----------
    function ConstructorParams(const AParams: TioConstructorParams): TioDILocator<TI>; reintroduce; overload;
    function ConstructorParams<T1>(AArg1: T1): TioDILocator<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDILocator<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDILocator<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDILocator<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDILocator<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDILocator<TI>; reintroduce; overload;
    // ---------- CONSTRUCTOR PARAMS ----------
    // ---------- VIEWMODEL METHODS ----------
    function SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDILocator<TI>;
    // ---------- VIEWMODEL METHODS ----------
    // ---------- SETBINDSOURCE METHODS ----------
    // SetPresenter (passing the name of the destination presenter)
    function SetBindSource(const ABSName: String; const ADataObject: TObject): TioDILocator<TI>; overload;
    function SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDILocator<TI>; overload;
    function SetBindSource(const ABSName: String; const AMasterPresenter: IioBindSource; const AMasterPropertyName: String = ''): TioDILocator<TI>; overload;
    function SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDILocator<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource): TioDILocator<TI>; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String; const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator<TI>; overload;
    function SetBindSourceAsETMfor(const AEtmBSName: String; const AEtmTargetBS: IioMasterBindSource): TioDILocator<TI>; overload;
    // SetPresenter (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject: TObject): TioDILocator<TI>; overload;
    function SetBindSource(const AInterfacedObj: IInterface): TioDILocator<TI>; overload;
    function SetBindSource(const AMasterPresenter: IioBindSource; const AMasterPropertyName: String = ''): TioDILocator<TI>; overload;
    function SetBindSource(const AWhere: IioWhere): TioDILocator<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDILocator<TI>; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator<TI>; overload;
    function SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDILocator<TI>; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider: TioViewContextProvider): TioDILocator<TI>;
    function SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc = nil): TioDILocator<TI>;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
    function SetParentCloseQueryAction(const AParentCloseQueryAction: IioBSCloseQueryAction): TioDILocator<TI>;
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
  end;
  // ===========================================================================

  // Class for ResolverByDependencyInjection
  // NB: FOR ENTITY PERSISTENCE PURPOSES ONLY
  TioDIResolverBase = class(TioDIBase)
  public
    // ResolveInaccurate in pratica per cercare almeno una classe che implementa l'interfaccia.
    // Se l'alias è vuoto e non c'è una classe registrata che implementa l'interfaccia senza Alias (ma
    // ne esiste almeno una registrata anche se con un alias) ritorna quella.
    class function ResolveInaccurateAsRttiType(const ATypeName: String; const AAlias: String): TRttiType; static;
    class function Resolve(const ATypeName: String; const AAlias: String; const AResolverMode: TioResolverMode; const AUseMapInfo: Boolean): IioResolvedTypeList; static;
  end;

  // Main Dependency Injection Class (and relative class reference)
  TioDependencyInjectionRef = class of TioDependencyInjection;

  TioDependencyInjection = class(TioDIBase)
  private
    class function _LocateForEachVVM_1stPhase_Browse(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias: String = ''): TioDILocator; overload;
    class function _LocateForEachVVM_2ndPhase_Create(const ASourceMP: IioBindSource; const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias: String = ''; const AViewModelMarker: String = ''): TioDILocator; overload;
  public
    class function Singletons: TioSingletonsFacadeRef;
    // ========== REGISTER ==========
    // Register class as inherited from (for internal use only)
    class function _RegisterClassAsInheritedFrom(const AClassRttiType: TRttiInstanceType; const AAncestorClassName: String): TioDIRegister; static;
    // Register class not implementing any interface
    class function RegisterClass<T: class>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterClass(const AClassRttiType: TRttiInstanceType; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register class implementing an interface
    class function RegisterClass<T: class; TImplements: IInterface>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterClass<T: class>(const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterClass(const AClassRttiType: TRttiInstanceType; const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register SimpleView not implementing any interface
    class function RegisterSimpleView<TSimpleViewClass: class>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleView(const ASimpleViewRttiType: TRttiInstanceType; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register SimpleView implementing an interface
    class function RegisterSimpleView<TSimpleViewClass: class; TImplements: IInterface>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleView<TSimpleViewClass: class>(const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleView(const ASimpleViewRttiType: TRttiInstanceType; const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register SimpleViewFor
    class function RegisterSimpleViewFor<TSimpleViewClass: class; TTargetType>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleViewFor<TSimpleViewClass: class>(const ATargetTypeName: String; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleViewFor<TSimpleViewClass: class>(const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleViewFor<TSimpleViewClass: class>(const ATargetIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleViewFor(const ASimpleViewRttiType: TRttiInstanceType; const ATargetTypeName: String; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleViewFor(const ASimpleViewRttiType: TRttiInstanceType; const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterSimpleViewFor(const ASimpleViewRttiType: TRttiInstanceType; const ATargetIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register View not implementing any interface
    class function RegisterView<TViewClass: class>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterView(const AViewRttiType: TRttiInstanceType; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register View implementing an interface
    class function RegisterView<TViewClass: class; TImplements: IInterface>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterView<TViewClass: class>(const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterView(const AViewRttiType: TRttiInstanceType; const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register ViewFor
    class function RegisterViewFor<TViewClass: class; TTargetType>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewFor<TViewClass: class>(const ATargetTypeName: String; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewFor<TViewClass: class>(const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewFor<TViewClass: class>(const ATargetIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewFor(const AViewRttiType: TRttiInstanceType; const ATargetTypeName: String; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewFor(const AViewRttiType: TRttiInstanceType; const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewFor(const AViewRttiType: TRttiInstanceType; const ATargetIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register ViewModel not implementing any interface
    class function RegisterViewModel<TViewModelClass: class>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModel(const AViewModelRttiType: TRttiInstanceType; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register ViewModel implementing an interface
    class function RegisterViewModel<TViewModelClass: class; TImplements: IInterface>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModel<TViewModelClass: class>(const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModel(const AViewModelRttiType: TRttiInstanceType; const AImplementsIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    // Register ViewModelFor
    class function RegisterViewModelFor<TViewModelClass: class; TTargetType>(const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModelFor<TViewModelClass: class>(const ATargetTypeName: String; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModelFor<TViewModelClass: class>(const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModelFor<TViewModelClass: class>(const ATargetIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModelFor(const AViewModelRttiType: TRttiInstanceType; const ATargetTypeName: String; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModelFor(const AViewModelRttiType: TRttiInstanceType; const ATargetClassRef: TioClassRef; const AAlias: String = ''): TioDIRegister; overload; static;
    class function RegisterViewModelFor(const AViewModelRttiType: TRttiInstanceType; const ATargetIID: TGUID; const AAlias: String = ''): TioDIRegister; overload; static;
    // ========== REGISTER ==========
    // ========== LOCATE ==========
    // Locate
    class function Locate(const AInterfaceName: String; const AAlias: String = ''): TioDILocator; overload;
    class function Locate<T: IInterface>(const AAlias: String = ''): TioDILocator<T>; overload;
    // Locate SimpleView
    class function LocateSimpleView(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator; overload;
    class function LocateSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator<T>; overload;
    class function LocateSimpleViewFor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator; overload;
    class function LocateSimpleViewFor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator; overload;
    class function LocateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator; overload;
    class function LocateSimpleViewFor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator; overload;
    class function LocateSimpleViewFor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator; overload;
    class function LocateSimpleViewFor(const ATargetMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDILocator; overload;
    // Locate View
    class function LocateView(const AInterfaceName: String; const AVAlias: String = ''): TioDILocator; overload;
    class function LocateView<T: IInterface>(const AVAlias: String = ''): TioDILocator<T>; overload;
    class function LocateViewFor(const ATargetTypeName: String; const AVAlias: String = ''): TioDILocator; overload;
    class function LocateViewFor(const AClassRef: TioClassRef; const AVAlias: String = ''): TioDILocator; overload;
    class function LocateViewFor<T>(const AVAlias: String = ''): TioDILocator; overload;
    class function LocateViewFor(const ATargetObj: TObject; const AVAlias: String = ''): TioDILocator; overload;
    class function LocateViewFor(const ATargetIntf: IInterface; const AVAlias: String = ''): TioDILocator; overload;
    class function LocateViewFor(const ATargetMP: IioBindSource; const AVAlias: String = ''): TioDILocator; overload;
    // Locate ViewModel
    class function LocateVM(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDILocator; overload;
    class function LocateVM<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDILocator<T>; overload;
    class function LocateVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDILocator; overload;
    class function LocateVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDILocator; overload;
    class function LocateVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDILocator; overload;
    class function LocateVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDILocator; overload;
    class function LocateVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDILocator; overload;
    // Locate View & ViewModel
    class function LocateViewVM(const AViewInterfaceName, AVMInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDILocator; overload;
    class function LocateViewVM<TView: IInterface; TViewModel: IioViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDILocator<TView>; overload;
    class function LocateViewVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDILocator; overload;
    class function LocateViewVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDILocator; overload;
    class function LocateViewVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDILocator; overload;
    class function LocateViewVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''): TioDILocator; overload;
    class function LocateViewVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''): TioDILocator; overload;
    class function LocateViewVMfor(const ASourceMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''): TioDILocator; overload;
    // ========== LOCATE ==========
  end;

  // Dependency Injection Factory
  TioDIFactory = class abstract(TioDIBase)
  strict private
    // class procedure _CheckModelPresenter(const ATargetMP:TioModelPresenter); NB: Hint prevention "symbol declared but never used" (codice resente sotto)
  public
    class function GetLocator(const AInterfaceName: String; const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDILocator; static;
    class function GetLocatorFor<TI>(const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDILocator<TI>; static;
    class function GetSimpleViewLocatorFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator; static;
    class function GetViewLocatorFor(const ATargetBS: IioBindSource; const AVAlias: String): TioDILocator; static;
    class function GetViewVMLocatorFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const ACreateViewModel: Boolean): TioDILocator; static;
  end;

implementation

uses
  iORM, iORM.Exceptions, System.TypInfo, iORM.ObjectsForge.ObjectMaker, iORM.Utilities, iORM.Resolver.Factory, iORM.RttiContext.Factory,
  iORM.Context.Map.Interfaces, iORM.DependencyInjection.ViewModelShuttleContainer, iORM.Attributes, iORM.Where.Factory,
  iORM.MVVM.ViewContextProviderContainer, iORM.ObjectsForge.Interfaces, iORM.MVVM.ViewModelBridge, iORM.Abstraction,
  iORM.LiveBindings.CommonBSBehavior, DJSON, iORM.MVVM.ViewModel;

{ TioDependencyInjectionBase }

class function TioDIBase.BuildContainerKey(const AInterfaceName: String; const ADICObjType: TioDICObjType): String;
begin
  case ADICObjType of
    dotAutoregisteredEntity: Result := DI_ENTITY_AUTOREGISTER_SUBKEY_PREFIX + AInterfaceName;
    dotSimpleView: Result := DI_SIMPLEVIEW_KEY_PREFIX + AInterfaceName;
    dotView: Result := DI_VIEW_KEY_PREFIX + AInterfaceName;
    dotViewModel: Result := DI_VIEWMODEL_KEY_PREFIX + AInterfaceName;
  else
    Result := AInterfaceName;
  end;
end;

class function TioDIBase.Container: TioDIContainerRef;
begin
  Result := TioDIContainer;
end;

{ TioDependencyInjection }

class function TioDependencyInjection.Locate(const AInterfaceName, AAlias: String): TioDILocator;
begin
  Result := TioDIFactory.GetLocator(AInterfaceName, AAlias, False, False, dotRegular);
end;

class function TioDependencyInjection.Locate<T>(const AAlias: String): TioDILocator<T>;
begin
  Result := TioDIFactory.GetLocatorFor<T>(AAlias, False, False, dotRegular);
end;

class function TioDependencyInjection.LocateSimpleView(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  Result := TioDIFactory.GetLocator(AInterfaceName, ASVAlias, True, True, dotSimpleView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.LocateSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator<T>;
begin
  Result := TioDIFactory.GetLocatorFor<T>(ASVAlias, True, True, dotSimpleView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.LocateSimpleViewFor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  Result := LocateSimpleViewFor(AClassRef.ClassName, AParentCloseQueryAction, ASVAlias);
end;

class function TioDependencyInjection.LocateSimpleViewFor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  Result := LocateSimpleViewFor(ATargetObj.ClassName, AParentCloseQueryAction, ASVAlias).SetBindSource(ATargetObj);
end;

class function TioDependencyInjection.LocateSimpleViewFor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  Result := LocateSimpleViewFor((ATargetIntf as TObject).ClassName, AParentCloseQueryAction, ASVAlias).SetBindSource(ATargetIntf);
end;

class function TioDependencyInjection.LocateSimpleViewFor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetLocator(ATargetTypeName, ASVAlias, True, True, dotSimpleView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.LocateView(const AInterfaceName, AVAlias: String): TioDILocator;
begin
  Result := TioDIFactory.GetLocator(AInterfaceName, AVAlias, True, True, dotView);
end;

class function TioDependencyInjection.LocateViewVM(const AViewInterfaceName, AVMInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVVMAlias, AViewModelMarker: String): TioDILocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetLocator(AViewInterfaceName, AVVMAlias, True, True, dotView);
  // Get the ViewModel instance
  LViewModel := io.di.LocateVM(AVMInterfaceName, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.LocateViewVM<TView, TViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String)
  : TioDILocator<TView>;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetLocatorFor<TView>(AVVMAlias, True, True, dotView);
  // Get the ViewModel instance
  LViewModel := io.di.LocateVM<TViewModel>(AParentCloseQueryAction, AVVMAlias).Get;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.LocateViewVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String): TioDILocator;
begin
  Result := LocateViewVMfor(AClassRef.ClassName, AParentCloseQueryAction, AVVMAlias, AViewModelMarker);
end;

class function TioDependencyInjection.LocateViewVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String): TioDILocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetObj.ClassName, AVVMAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetObj, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel);
end;

class function TioDependencyInjection.LocateViewVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String): TioDILocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetIntf, AVVMAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel);
end;

class function TioDependencyInjection.LocateViewVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String): TioDILocator;
begin
  Result := LocateViewVMfor(TioUtilities.GenericToString<T>, AParentCloseQueryAction, AVVMAlias, AViewModelMarker);
end;

class function TioDependencyInjection.LocateView<T>(const AVAlias: String): TioDILocator<T>;
begin
  Result := TioDIFactory.GetLocatorFor<T>(AVAlias, True, True, dotView);
end;

class function TioDependencyInjection.LocateViewFor(const AClassRef: TioClassRef; const AVAlias: String): TioDILocator;
begin
  Result := LocateViewFor(AClassRef.ClassName, AVAlias);
end;

class function TioDependencyInjection.LocateViewFor(const ATargetObj: TObject; const AVAlias: String): TioDILocator;
begin
  Result := LocateViewFor(ATargetObj.ClassName, AVAlias);
end;

class function TioDependencyInjection.LocateViewFor<T>(const AVAlias: String): TioDILocator;
begin
  Result := LocateViewFor(TioUtilities.GenericToString<T>, AVAlias);
end;

class function TioDependencyInjection.LocateViewFor(const ATargetMP: IioBindSource; const AVAlias: String): TioDILocator;
begin
  // Get & set the locator
  Result := TioDIFactory.GetViewLocatorFor(ATargetMP, AVAlias);
end;

class function TioDependencyInjection.LocateViewFor(const ATargetTypeName, AVAlias: String): TioDILocator;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetLocator(ATargetTypeName, AVAlias, True, True, dotView);
end;

class function TioDependencyInjection.LocateVM(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDILocator;
begin
  Result := TioDIFactory.GetLocator(AInterfaceName, AVMAlias, True, False, dotViewModel).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.LocateVM<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDILocator<T>;
begin
  Result := TioDIFactory.GetLocatorFor<T>(AVMAlias, True, False, dotViewModel).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.LocateVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDILocator;
begin
  Result := LocateVMfor(AClassRef.ClassName, AParentCloseQueryAction, AVMAlias);
end;

class function TioDependencyInjection.LocateVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDILocator;
begin
  Result := LocateVMfor(ATargetObj.ClassName, AParentCloseQueryAction, AVMAlias).SetBindSource(ATargetObj);
end;

class function TioDependencyInjection.LocateVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDILocator;
begin
  Result := LocateVMfor((ATargetIntf as TObject).ClassName, AParentCloseQueryAction, AVMAlias).SetBindSource(ATargetIntf);
end;

class function TioDependencyInjection.LocateVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDILocator;
begin
  Result := TioDIFactory.GetLocator(ATargetTypeName, AVMAlias, True, False, dotViewModel).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.LocateVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDILocator;
begin
  Result := LocateVMfor(TioUtilities.GenericToString<T>, AParentCloseQueryAction, AVMAlias);
end;

class function TioDependencyInjection.RegisterClass(const AClassRttiType: TRttiInstanceType; const AAlias: String = ''): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(AClassRttiType, AAlias, dotRegular);
end;

class function TioDependencyInjection.RegisterClass(const AClassRttiType: TRttiInstanceType; const AImplementsIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(AClassRttiType, AImplementsIID, AAlias, dotRegular);
end;

class function TioDependencyInjection.RegisterClass<T, TImplements>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(T), TioUtilities.TypeInfoToGUID(TypeInfo(TImplements)), AAlias, dotRegular);
end;

class function TioDependencyInjection.RegisterClass<T>(const AImplementsIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(T), AImplementsIID, AAlias, dotRegular);
end;

class function TioDependencyInjection.RegisterClass<T>(const AAlias: String = ''): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(TioUtilities.ClassRefToRttiType(T), AAlias, dotRegular);
end;

class function TioDependencyInjection.RegisterSimpleView(const ASimpleViewRttiType: TRttiInstanceType; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(ASimpleViewRttiType, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleView(const ASimpleViewRttiType: TRttiInstanceType; const AImplementsIID: TGUID;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(ASimpleViewRttiType, AImplementsIID, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleView<TSimpleViewClass, TImplements>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(TSimpleViewClass), TioUtilities.TypeInfoToGUID(TypeInfo(TImplements)), AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleView<TSimpleViewClass>(const AImplementsIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(TSimpleViewClass), AImplementsIID, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleView<TSimpleViewClass>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(TioUtilities.ClassRefToRttiType(TSimpleViewClass), AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleViewFor(const ASimpleViewRttiType: TRttiInstanceType; const ATargetTypeName, AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(ASimpleViewRttiType, ATargetTypeName, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleViewFor(const ASimpleViewRttiType: TRttiInstanceType; const ATargetIID: TGUID;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(ASimpleViewRttiType, TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleViewFor(const ASimpleViewRttiType: TRttiInstanceType; const ATargetClassRef: TioClassRef;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(ASimpleViewRttiType, ATargetClassRef.ClassName, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleViewFor<TSimpleViewClass, TTargetType>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TSimpleViewClass), TioUtilities.GenericToString<TTargetType>, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleViewFor<TSimpleViewClass>(const ATargetClassRef: TioClassRef; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TSimpleViewClass), ATargetClassRef.ClassName, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterSimpleViewFor<TSimpleViewClass>(const ATargetTypeName, AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TSimpleViewClass), ATargetTypeName, AAlias, dotSimpleView);
end;

class function TioDependencyInjection.Singletons: TioSingletonsFacadeRef;
begin
  Result := TioSingletonsFacade;
end;

class function TioDependencyInjection.LocateViewFor(const ATargetIntf: IInterface; const AVAlias: String): TioDILocator;
begin
  Result := LocateViewFor((ATargetIntf as TObject).ClassName, AVAlias);
end;

class function TioDependencyInjection.LocateViewVMfor(const ASourceMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String): TioDILocator;
begin
  // Get & set the locator
  Result := TioDIFactory.GetViewVMLocatorFor(ASourceMP, AParentCloseQueryAction, AVVMAlias, False);
end;

class function TioDependencyInjection._LocateForEachVVM_1stPhase_Browse(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias: String): TioDILocator;
begin
  // NB: This method create the locator instance only (never create a VM like LocateViewVM methods)
  // Get the ViewLocator
  Result := TioDIFactory.GetLocator(ATargetTypeName, AAlias, True, True, dotView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection._LocateForEachVVM_2ndPhase_Create(const ASourceMP: IioBindSource; const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias, AViewModelMarker: String): TioDILocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetTypeName, AAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetTypeName, AParentCloseQueryAction, AAlias).SetBindSource(ASourceMP).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection._RegisterClassAsInheritedFrom(const AClassRttiType: TRttiInstanceType; const AAncestorClassName: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AClassRttiType, AAncestorClassName, String.Empty, dotRegular);
end;

class function TioDependencyInjection.LocateViewVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String): TioDILocator;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := LocateViewFor(ATargetTypeName, AVVMAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.LocateVMfor(ATargetTypeName, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.LocateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  // Get & set the locator
  Result := LocateSimpleViewFor(TioUtilities.GenericToString<T>, AParentCloseQueryAction, ASVAlias);
end;

class function TioDependencyInjection.LocateSimpleViewFor(const ATargetMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  // Get & set the locator
  Result := TioDIFactory.GetSimpleViewLocatorFor(ATargetMP, AParentCloseQueryAction, ASVAlias);
end;

{ TioDependencyInjectionRegister }

function TioDIRegister.AsEntity: TioDIRegister;
begin
  FImpementersItem.IsEntity := True;
  Result := Self;
end;

function TioDIRegister.AsSingleton(const AIsSingleton: Boolean): TioDIRegister;
begin
  FImpementersItem.IsSingleton := AIsSingleton;
  Result := Self;
end;

constructor TioDIRegister.CreateByClass(const AClassRttiType: TRttiInstanceType; const AAlias: String; const ADICType: TioDICObjType);
var
  LDIContainerKey: String;
begin
  // Stiamo registrando una classe per se stessa, che non implementa nessuna interfaccia
  //  e che non è registrata come vista o VM per una entità; in questo caso la chiave con
  //  la quale viene registrata è il nome della classe stessa
  // ----------
  // Crea la nuova istanza della implementer item sulla quale registrare le informazioni
  //  della classe che si sta registrando poi compone la relativa chiave e infine
  //  registra il tutto nel DIC
  FImpementersItem := TioDIContainerImplementersItem.Create(AClassRttiType, TGUID.Empty);
  LDIContainerKey := BuildContainerKey(AClassRttiType.Name, ADICType);
  Container.Add(BuildContainerKey(AClassRttiType.Name, ADICType), AAlias, FImpementersItem);
end;

constructor TioDIRegister.CreateByIID(const AClassRttiType: TRttiInstanceType; const AImplementsIID: TGUID; const AAlias: String;
  const ADICType: TioDICObjType);
var
  LDIContainerKey: String;
begin
  // Stiamo registrando una classe come classe che implementa l'interfaccia  ricevuta con il parametro
  //  AImplementsIID; in questo caso la chiave con la quale viene registrata è il nome dell'interfaccia stessa
  // ----------
  // Crea la nuova istanza della implementer item sulla quale registrare le informazioni
  //  della classe che si sta registrando poi compone la relativa chiave e infine
  //  registra il tutto nel DIC
  FImpementersItem := TioDIContainerImplementersItem.Create(AClassRttiType, AImplementsIID);
  LDIContainerKey := BuildContainerKey(TioUtilities.GetImplementedInterfaceName(AClassRttiType, AImplementsIID), ADICType);
  Container.Add(LDIContainerKey, AAlias, FImpementersItem);
end;

constructor TioDIRegister.CreateByTargetTypeName(const AClassRttiType: TRttiInstanceType; const ATargetTypeName, AAlias: String; const ADICType: TioDICObjType);
var
  LDIContainerKey: String;
begin
  // Stiamo registrando una classe come SimpleView/View/ViewModel per un'altra classe (ATArgetTypeName);
  //  in questo caso la chiave con la quale viene registrata è il nome del ATArgetTypeName
  // ----------
  // Crea la nuova istanza della implementer item sulla quale registrare le informazioni
  //  della classe che si sta registrando poi compone la relativa chiave e infine
  //  registra il tutto nel DIC
  FImpementersItem := TioDIContainerImplementersItem.Create(AClassRttiType, TGUID.Empty);
  LDIContainerKey := BuildContainerKey(ATargetTypeName, ADICType);
  Container.Add(LDIContainerKey, AAlias, FImpementersItem);
end;

function TioDIRegister._SetFarAncestorClassSameInterfaceAndTableAndConnection(const AValue: String): TioDIRegister;
begin
  FImpementersItem.FarAncestorClazzSameInterfaceAndTableAndConnection := AValue;
  Result := Self;
end;

{ TioDependencyInjectionContainer }

class procedure TioDIContainer.Add(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey;
  const AValue: TioDIContainerImplementersItem);
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  // If the Key not exist then create the SubContainer and add it to the MasterContainer
  if not FContainer.ContainsKey(AKey) then
    FContainer.Add(AKey, TioDIContainerValue.Create);
  // Add the Value to the SubKey
  FContainer.Items[AKey].Add(ASubKey, AValue);
end;

class procedure TioDIContainer.Build;
begin
  FContainer := TioDIContainerInstance.Create([doOwnsValues]);
end;

class procedure TioDIContainer.CleanUp;
begin
  Self.FContainer.Free;
end;

class function TioDIContainer.Exists(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): Boolean;
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  Result := FContainer.ContainsKey(AKey) and FContainer.Items[AKey].Contains(ASubKey);
end;

class function TioDIContainer.Get(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  // Resolve the subkey if needed
  ASubKey := _SubKeyResolver(AKey, ASubKey);
  // If exists then return the implementer class else raise an exception
  if Exists(AKey, ASubKey) then
    Result := FContainer.Items[AKey].GetItem(ASubKey)
  else
  begin
    // ViewModel
    if AKey.StartsWith(DI_VIEWMODEL_KEY_PREFIX) then
    begin
      AKey := Copy(AKey, 5, 99);
      if ASubKey.IsEmpty then
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A ViewModel for "%s" is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the ViewModel class with the attribute "[diViewModelFor(%s)]" or you can write some code like: "io.di.RegisterClass<TMyViewModel>.AsViewModelFor<%s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A ViewModel for "%s" (alias "%s") is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the ViewModel class with the attribute "[diViewModelFor(%s,"%s")]" or you can write some code like: "io.di.RegisterClass<TMyViewModel>.AsViewModelFor<%s>("%s").Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, ASubKey, AKey, ASubKey, AKey, ASubKey]));
    end
    else
    // View
    if AKey.StartsWith(DI_VIEW_KEY_PREFIX) then
    begin
      AKey := Copy(AKey, 4, 99);
      if ASubKey.IsEmpty then
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A View for "%s" is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the View class with the attribute "[diViewFor(%s)]" or you can write some code like: "io.di.RegisterClass<TMyViewModel>.AsViewFor<%s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A View for "%s" (alias "%s") is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the View class with the attribute "[diViewFor(%s,"%s")]" or you can write some code like: "io.di.RegisterClass<TMyViewModel>.AsViewFor<%s>("%s").Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, ASubKey, AKey, ASubKey, AKey, ASubKey]));
    end
    else
    // SimpleView
    if AKey.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
    begin
      AKey := Copy(AKey, 5, 99);
      if ASubKey.IsEmpty then
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A SimpleView for "%s" is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the SimpleView class with the attribute "[diSimpleViewFor(%s)]" or you can write some code like: "io.di.RegisterClass<TMyViewModel>.AsSimpleViewFor<%s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A SimpleView for "%s" (alias "%s") is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the SimpleView class with the attribute "[diSimpleViewFor(%s,"%s")]" or you can write some code like: "io.di.RegisterClass<TMyViewModel>.AsSimpleViewFor<%s>("%s").Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, ASubKey, AKey, ASubKey, AKey, ASubKey]));
    end
    // Normal interface implementer
    else
    begin
      if ASubKey.IsEmpty then
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'Services of the "%s" interface are required but I cannot find any registered class that implements it.' +
          #13#13'Maybe you forgot to register the class, to do so you can decorate it with the "[diImplements(%s)]" attribute or you can write some code like: "io.di.RegisterClass<TMyClass>.Implements<%s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'Services of the "%s" interface (alias "%s") are required but I cannot find any registered class that implements it.' +
          #13#13'Maybe you forgot to register the class, to do so you can decorate it with the "[diImplements(%s, ''%s'')]" attribute or you can write some code like: "io.di.RegisterClass<TMyClass>.Implements<%s>(''%s'').Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, ASubKey, AKey, ASubKey, AKey, ASubKey]));
    end;
  end;
end;

class function TioDIContainer.GetInterfaceImplementers(AKey: TioDIContainerKey): TioDIContainerValue;
begin
  AKey := Uppercase(AKey);
  if not ImplementersExists(AKey) then
    raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
      #13#13'I was looking for a list of all registered classes implementing "%s" but couldn''t find any.' +
      #13#13'I remind you that you can register a class as an implementer of an interface by decorating it with the attribute "[diImplements (%s)]" or you can write some code like: "io.di.RegisterClass<TMyClass>.Implements<%s>.Execute".' +
      #13#13'If you decide to use the attribute, make sure you put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
      #13#13'I hope this information will be useful to you.', [AKey, AKey, AKey]));
  Result := FContainer.Items[AKey];
end;

class function TioDIContainer.ImplementersExists(AKey: TioDIContainerKey): Boolean;
begin
  AKey := Uppercase(AKey);
  Result := FContainer.ContainsKey(AKey);
end;

class procedure TioDIContainer.Remove(AKey: TioDIContainerKey; ASubKey: TioDIContainerImplementersKey);
begin
  AKey := Uppercase(AKey);
  ASubKey := Uppercase(ASubKey);
  if Exists(AKey, ASubKey) and FContainer.Items[AKey].RemoveAndCheckIfEmpty(ASubKey) then
    FContainer.Remove(AKey);
end;

class function TioDIContainer._SubKeyResolver(const AKey, ASubKey: String): String;
begin
  // 1) Verifica che almeno la chiave principale esista, se non esiste esce subito senza fare nulla
  //     e non solleva nemmeno una eccezione perchè ci pensa il codice chiamante.
  // 2) Poi controlla se lo specificoco implementer esiste esattamente come lo si sta cercando compreso l'alias
  //     (quindi nel caso la classe implementatrice fosse stata registrata eslicitamente nel DIC), se lo trova
  //     anche in questo caso lascia tutto così com'è.
  // 3) Se c'è anche solo una registrazione esplicita (RegularRegisteredCount > 0), cioè fatta con l'attributo [diImplements(...)]
  //     o anche con del codice tipo "io.RegisterClass<...>.Implements..." allora iORM presume che il programmatore voglia gestire
  //     "manualmente" la cosa per cui non tocca nulla e lascia che il codice chiamante faccia il suo lavoro.
  // 4) Se c'è più di una autoregistrazione come entità significa che ci sono più classi registrate
  //     che implementano la stessa interfaccia quindi c'è una possibile ambiguità e quindi, anche
  //     in questo caso lascia stare tutto così e lascia che il codice chiamante faccia il suo lavoro.
  if (not ImplementersExists(AKey)) or Exists(AKey, ASubKey) or (GetInterfaceImplementers(AKey).RegularRegisteredCount > 0)
    or (GetInterfaceImplementers(AKey).EntityAutoRegisteredCount > 1) then
    Result := ASubKey
  // Altrimenti se arriva qui significa che non si è trovata la classe specifica che si stava cercando
  //  (Key + SubKey) e che c'è una sola classe registrata come implementatrice (che dovrebbe essere
  //  per forza quella registrata automaticamnete come entità solo per la persistenza) ed essendo
  //  l'unica non c'è ambiguità quindi modifica la SubKey in modo che usi questa.
  else
    Result := GetInterfaceImplementers(AKey).GetFirstAlias;
end;

{ TioDependencyInjectionLocator }

procedure TioDILocator.ClearPresenterSettings;
begin
  SetLength(FPresenterSettings, 0);
end;

function TioDILocator.ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDILocator;
begin
  SetLength(FConstructorParams, 6);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  TValue.Make(@AArg5, TypeInfo(T5), FConstructorParams[4]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[5]);
  Result := Self;
end;

function TioDILocator.ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4;
  AArg5: T5): TioDILocator;
begin
  SetLength(FConstructorParams, 5);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  TValue.Make(@AArg5, TypeInfo(T5), FConstructorParams[4]);
  Result := Self;
end;

function TioDILocator.ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDILocator;
begin
  SetLength(FConstructorParams, 4);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  Result := Self;
end;

function TioDILocator.ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDILocator;
begin
  SetLength(FConstructorParams, 3);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  Result := Self;
end;

function TioDILocator.ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDILocator;
begin
  SetLength(FConstructorParams, 2);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  Result := Self;
end;

function TioDILocator.ConstructorParams<T1>(AArg1: T1): TioDILocator;
begin
  SetLength(FConstructorParams, 1);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  Result := Self;
end;

function TioDILocator.ConstructorParams(const AParams: TioConstructorParams): TioDILocator;
begin
  FConstructorParams := AParams;
  Result := Self;
// ---------- OLD CODE ----------
//  // Solo così sembra andare bene
//  SetLength(FConstructorParams, Length(AParams));
//  for i := 0 to High(AParams) do
//    FConstructorParams[i] := AParams[i];
//  Result := Self;
end;

constructor TioDILocator.Create(const AInterfaceName, AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean);
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
  FActionParentCloseQuery := nil;
end;

function TioDILocator.Exist: Boolean;
begin
  try
    Result := Container.Exists(FInterfaceName, Self.FAlias);
  finally
    Free;
  end;
end;

function TioDILocator.ExtractVMFromView(const AView: TComponent): IioViewModelInternal;
var
  LVMBridge: TioViewModelBridge;
begin
  Result := nil;
  LVMBridge := TioViewModelBridge.ExtractVMBridge(AView);
  if Assigned(LVMBridge) and LVMBridge.ViewModelIsAssigned then
    Result := LVMBridge.ViewModel as IioViewModelInternal;
end;

function TioDILocator.Get: TObject;
var
  LContainerItem: TioDIContainerImplementersItem;
begin
  try
    LContainerItem := Container.Get(_InterfaceName, _Alias);
    Result := _Get(LContainerItem);
  finally
    Free;
  end;
end;

function TioDILocator.GetAs<TResult>: TResult;
var
  LContainerItem: TioDIContainerImplementersItem;
  LObj: TObject;
begin
  try
    LContainerItem := Container.Get(_InterfaceName, _Alias);
    LObj := _Get(LContainerItem);
    Result := TioUtilities.CastObjectToGeneric<TResult>(LObj);
  finally
    Free;
  end;
end;

function TioDILocator.GetItem: TioDIContainerImplementersItem;
begin
  Result := Container.Get(FInterfaceName, FAlias);
end;

function TioDILocator.PresenterSettingsExists: Boolean;
begin
  Result := (Length(FPresenterSettings) > 0);
end;

function TioDILocator.SingletonKey(const ASingletonKey: String): TioDILocator;
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

function TioDILocator.SetBindSource(const ABSName: String; const ADataObject: TObject): TioDILocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstDataObject;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].Obj := ADataObject;
  Result := Self;
end;

function TioDILocator.SetBindSource(const ABSName: String; const AMasterBindSource: IioBindSource; const AMasterPropertyName: String)
  : TioDILocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstMasterModelPresenter;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].Obj := (AMasterBindSource as TObject);
  FPresenterSettings[i].StringParameter := AMasterPropertyName;
  Result := Self;
end;

function TioDILocator.SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDILocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstWhere;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].InterfacedObj := AWhere;
  Result := Self;
end;

// function TioDependencyInjectionLocator.SetBindSource(
// const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator;
// begin
// Result := SetBindSource('', ABindSourceAdapter);
// end;

function TioDILocator.SetBindSource(const ADataObject: TObject): TioDILocator;
begin
  Result := SetBindSource('', ADataObject);
end;

function TioDILocator.SetBindSource(const AMasterBindSource: IioBindSource; const AMasterPropertyName: String)
  : TioDILocator;
begin
  Result := SetBindSource('', AMasterBindSource, AMasterPropertyName);
end;

function TioDILocator.SetBindSource(const AInterfacedObj: IInterface): TioDILocator;
begin
  Result := SetBindSource('', AInterfacedObj);
end;

function TioDILocator.SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDILocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstInterfacedObj;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].InterfacedObj := AInterfacedObj;
  Result := Self;
end;

function TioDILocator.SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource)
  : TioDILocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstSelectorFor;
  FPresenterSettings[i].Name := ASelectorBSName;
  FPresenterSettings[i].Obj := (ASelectionTargetBS as TObject);
  Result := Self;
end;

function TioDILocator.SetBindSourceAsETMfor(const AEtmBSName: String; const AEtmTargetBS: IioMasterBindSource): TioDILocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstETMfor;
  FPresenterSettings[i].Name := AEtmBSName;
  FPresenterSettings[i].Obj := (AEtmTargetBS as TObject);
  Result := Self;
end;

function TioDILocator.SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDILocator;
begin
  Result := SetBindSourceAsETMfor(String.Empty, AEtmTargetBS);
end;

function TioDILocator.SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDILocator;
begin
  Result := SetBindSourceAsSelectorFor(String.Empty, ASelectionTargetBS);
end;

function TioDILocator.SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String;
  const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingsType.pstWhereBuilderFor;
  FPresenterSettings[i].Name := AWhereBuilderBSName;
  FPresenterSettings[i].Obj := (AWhereBuilderTargetBS as TObject);
  Result := Self;
end;

function TioDILocator.SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator;
begin
  Result := SetBindSourceAsWhereBuilderFor(String.Empty, AWhereBuilderTargetBS);
end;

function TioDILocator.SetParentCloseQueryAction(const AParentCLoseQueryAction: IioBSCloseQueryAction): TioDILocator;
begin
  FActionParentCloseQuery := AParentCLoseQueryAction;
  Result := Self;
end;

function TioDILocator.SetBindSource(const AWhere: IioWhere): TioDILocator;
begin
  Result := SetBindSource('', AWhere);
end;

function TioDILocator.SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc): TioDILocator;
begin
  Result := Self;
  FViewContext := AViewContext;
  FViewContextFreeMethod := AViewContextFreeMethod;
end;

function TioDILocator.SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDILocator;
begin
  FViewModelMarker := AMarker;
  FViewModel := AViewModel as IioViewModelInternal;
  Result := Self;
end;

function TioDILocator.Show: TComponent;
var
  LContainerItem: TioDIContainerImplementersItem;
begin
  try
    LContainerItem := Container.Get(_InterfaceName, _Alias);
    Result := _Get(LContainerItem) as TComponent;
  finally
    Free;
  end;
end;

function TioDILocator.ShowCurrent: TComponent;
begin
  Result := nil;
  try
    // Check if FForEachModelPresenter is assigned
    if not Assigned(FForEachModelPresenter) then
      raise EioGenericException.Create(ClassName, 'ShowCurrent',
        '"FForEachModelPresenter" private field not assigned...'#13#13'ShowCurrent must be used with "io.ShowCurrent(AModelPrenter)" or "io.di.LocateViewVMFor(AModelPresenter)..." or other equivalent with ModelPresenter as parameter.');
    // Check for BindSourceAdapter and not empty
    FForEachModelPresenter.CheckAdapter(True);
    if FForEachModelPresenter.ItemCount = 0 then
      Exit;
    // Show the current object
    Result := _ShowCurrent;
  finally
    Free;
  end;
end;

procedure TioDILocator.ShowEach;
var
  i: Integer;
begin
  try
    // Check if FForEachModelPresenter is assigned
    if not Assigned(FForEachModelPresenter) then
      raise EioGenericException.Create(Self.ClassName, 'ShowCurrent',
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
  finally
    Free;
  end;
end;

procedure TioDILocator._DuplicateLocatorForShowEachPurposeFrom(const ASourceLocator: TioDILocator);
begin
  FAlias := ASourceLocator._GetAlias;
  FConstructorParams := ASourceLocator._GetConstructorParams^;
  FVCProvider := ASourceLocator._GetVCProvider;
  FViewContext := ASourceLocator._GetViewContext;
  FActionParentCloseQuery := ASourceLocator._GetParentCloseQueryAction;
end;

function TioDILocator._Get(const AContainerItem: TioDIContainerImplementersItem): TObject;
var
  LValue: TValue;
  procedure NestedSetParentCloseQueryActionToViewModel;
  begin
    // Non uso l'interfaccia IioViewModel perchè mi dava dei problemi con il RefCount
    if (Result is TioViewModel) and TioViewModel(Result)._BSCloseQueryAssigned then
      TioViewModel(Result)._GetBSCloseQuery.Action_ParentCloseQueryAction := FActionParentCloseQuery;
  end;
  procedure NestedSetParentCloseQueryActionToSimpleView;
  var
    LActionCloseQuery: IioBSCloseQueryAction;
  begin
    LActionCloseQuery := TioBSCloseQueryCommonBehaviour.ExtractCloseQueryAction(Result as TComponent);
    if Assigned(LActionCloseQuery) then
      LActionCloseQuery.Action_ParentCloseQueryAction := FActionParentCloseQuery;
  end;
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
      //  then try to retrieve and set the ViewContext for the View.
      //  If a specific VCProvider is already assigned then use it else try
      //  to retrieve the global default one, if not exist then do none
      //  (no ViewContext assigned to the view, ad esempio per una Form).
      // NB: Se è stato specificato un ViewContext esplicito (SetViewContext), usa quello
      //      e considera il tutto come con AutoOwner e AutoParent = True
      // NB: Se si sta creando una SimpleView il parametro "owner" viene passato sempre a nil
      //      anche se in realtà è stato creato un ViewContext, questo perchè altrimenti poi
      //      quando si distruggerà la vista (una SimpleView si distrugge eseguendo il suo metodo
      //      Free (non distruggendo il ViewContext come nel caso di MVVM) e ci sarebbero problemi
      //      poi alla distruzione del ViewContext perchè poi cercherebbe di distruggere tutti
      //      i componenti owned e tra questi anche la vista che però è già distrutta.
      if FVCProviderEnabled and (not Assigned(FViewContext)) and AContainerItem.RttiType.MetaclassType.InheritsFrom(TComponent) then
      begin
        if not Assigned(FVCProvider) then
          FVCProvider := TioGlobalVCProviderRegister.GetInstance.DefaultVCProvider;
        if Assigned(FVCProvider) then
          FViewContext := FVCProvider.NewViewContext;
      end;
//      if Assigned(FViewContext) and AContainerItem.RttiType.MetaclassType.InheritsFrom(TComponent) and not FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
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
      // Object creation
      // Result := TioObjectMaker.CreateObjectByClassRefEx(AContainerItem.ClassRef, FConstructorParams, FConstructorMarker, FConstructorMethod, AContainerItem);
      Result := TioObjectMaker.CreateObjectByRttiTypeEx(AContainerItem.RttiType, FConstructorParams, AContainerItem);
      // Se stiamo creando un ViewModel oppure una SimpleView...
      if FInterfaceName.StartsWith(DI_VIEWMODEL_KEY_PREFIX) or FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
      begin
        // If some PresenterSettings exists and the result object is a ViewModel then
        //   apply it
        // NB: Il codice commentato a dx della riga sotto poteva causare un errore dovuto alla
        //   morte prematura del ViewModel appena creato per via del reference count, sostituito
        //   con la condizione (Result is TioViewModel) il problema si è risolto e mi va bene così
        //   perchè tanto un ViewModel deve per forza ereditare da TioViewModel.
        if PresenterSettingsExists then // Supports(Result, IioViewModel) then
          TioObjectMakerIntf.InitializeViewModelPresentersAfterCreate(Result, @FPresenterSettings);
        // NB: Estrae eventuale BSCloseQueryAction presente nel ViewModel oppure nella SimpleView e ne
        //      imposta la proprietà ParentCloseQueryAction
        if Assigned(FActionParentCloseQuery) then
        begin
          if FInterfaceName.StartsWith(DI_VIEWMODEL_KEY_PREFIX) then
            NestedSetParentCloseQueryActionToViewModel
          else
          if FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
            NestedSetParentCloseQueryActionToSimpleView;
        end;
      end;
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
      // If at this point the FViewModel is not already assigned then try to extract
      //   it from the View.VMBridge. Indeed it may have been that it was created by
      //   the VMBridge itself is its properties DI_VMInterface and DI_VMAlias are
      //   setted properly.
      if not Assigned(FViewModel) then
        FViewModel := ExtractVMFromView(TComponent(Result));
      // Register View, ViewContext and ViewContextProvider in the ViewRegister of the ViewModel or in the SimpleViewRegster
      //  if a SimpleView was required
      if FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
        TioSimpleViewRegister.AddOrUpdate(TComponent(Result), FViewContext, FVCProvider, FViewContextFreeMethod)
      else
      // NB: Mauri 04/12/2022: Oltre a registrare la nuova View (e il relativo ViewContext) qui ora le viste vengono registrare
      //      nel ViewRegister del ViewModel anche nel metodo TioViewModel.BindView (se non già registrata da qui.
      //      Ho aggiunto questo perchè per far funzionare correttamente le BSCloseQueryActions avevo bisogno
      //      che tutte le viste fossero registrate, anche quelle che non sono state create dal DIC o che cmq non venivano registrate.
      //      Normalmente le viste infatti venivano registrate solo qui, ora anche nel metodo di cui sopra se necessario.
      if Assigned(FViewModel) then
        FViewModel.ViewRegister.AddOrUpdate(TComponent(Result), FViewContext, FVCProvider, FViewContextFreeMethod);
      // if the ViewModel is present then UnLock it (MVVM)
      if Self.ViewModelExist then
        TioViewModelShuttleContainer.DeleteViewModel(FViewModelMarker);
      // Fire the onAfterRequest event handler of the ViewContextProvider component
      // NB: Questo è stato spostato alla fine perchè in caso di form modale entra in un ciclo dal quale non
      //      esce e in pratica poi non passava per righe che prima erano dopo o meglio ci passava ma solo
      //      quando poi veniva chiusa la form modale stessa.
      if Assigned(FVCProvider) then
        FVCProvider.DoOnAfterRequest(TComponent(Result), FViewContext);
      // Esce subito da qui perchè dopo lo spostamento di  cui sopra (DoOnAfterRequest + TioViewModelShuttleContainer.DeleteViewModel(...)
      //  poi altrimenti all'uscita richiamaerebbe il DeleteViewModel della sezione finally di nuovo. Ho lasciato cmq
      //  anche la chiamata a DeleteViewModel nella sezione finally nel caso non si sia usato un VCProvider (non entrerebbe in questo blocco).
      Exit;
// ----------
// Mauri 05/01/2024: Rivista la sequenza per problemi con l'uso di form modali (come ViewContext)
// su segnalazione di Carlo Marona di oggi (questo è il vecchio codice)
//      // Set the ViewContext as parent view
//      TioControl.SetParent(Result, FViewContext);
//      // Fire the onAfterRequest event handler of the ViewContextProvider component
//      if Assigned(FVCProvider) then
//        FVCProvider.DoOnAfterRequest(TComponent(Result), FViewContext);
//      // If at this point the FViewModel is not already assigned then try to extract
//      //   it from the View.VMBridge. Indeed it may have been that it was created by
//      //   the VMBridge itself is its properties DI_VMInterface and DI_VMAlias are
//      //   setted properly.
//      if not Assigned(FViewModel) then
//        FViewModel := ExtractVMFromView(TComponent(Result));
//      // Register View, ViewContext and ViewContextProvider in the ViewRegister of the ViewModel or in the SimpleViewRegster
//      //  if a SimpleView was required
//      if FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
//        TioSimpleViewRegister.AddOrUpdate(TComponent(Result), FViewContext, FVCProvider, FViewContextFreeMethod)
//      else
//      // NB: Mauri 04/12/2022: Oltre a registrare la nuova View (e il relativo ViewContext) qui ora le viste vengono registrare
//      //      nel ViewRegister del ViewModel anche nel metodo TioViewModel.BindView (se non già registrata da qui.
//      //      Ho aggiunto questo perchè per far funzionare correttamente le BSCloseQueryActions avevo bisogno
//      //      che tutte le viste fossero registrate, anche quelle che non sono state create dal DIC o che cmq non venivano registrate.
//      //      Normalmente le viste infatti venivano registrate solo qui, ora anche nel metodo di cui sopra se necessario.
//      if Assigned(FViewModel) then
//        FViewModel.ViewRegister.AddOrUpdate(TComponent(Result), FViewContext, FVCProvider, FViewContextFreeMethod);
// ----------
    end
  finally
    // if the ViewModel is present then UnLock it (MVVM)
    if Self.ViewModelExist then
      TioViewModelShuttleContainer.DeleteViewModel(FViewModelMarker);
  end;
end;

function TioDILocator._GetAlias: String;
begin
  Result := FAlias;
end;

function TioDILocator._GetConstructorParams: PioConstructorParams;
begin
  Result := @FConstructorParams;
end;

function TioDILocator._GetParentCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := FActionParentCloseQuery;
end;

function TioDILocator._GetVCProvider: TioViewContextProvider;
begin
  Result := FVCProvider;
end;

function TioDILocator._GetViewContext: TComponent;
begin
  Result := FViewContext;
end;

procedure TioDILocator._SetForEachModelPresenter(const AModelPresenter: IioBindSource; const ALocateViewModel: Boolean);
begin
  FForEachModelPresenter := AModelPresenter;
  FForEachLocateViewModel := ALocateViewModel;
end;

function TioDILocator._ShowCurrent: TComponent;
var
  LLocator: TioDILocator;
begin
  // Check if FForEachModelPresenter is assigned
  if not Assigned(FForEachModelPresenter) then
    raise EioGenericException.Create(Self.ClassName, 'ShowCurrent',
      '"FForEachModelPresenter" private field not assigned...'#13#13'ShowCurrent must be used with "io.ShowCurrent(AModelPrenter)" or "io.di.LocateViewVMFor(AModelPresenter)..." or other equivalent with ModelPresenter as parameter.');
  // Retrieve the correct locator
  if FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
    LLocator := TioDIFactory.GetSimpleViewLocatorFor(FForEachModelPresenter, FActionParentCloseQuery, FAlias) as TioDILocator
  else
  if FForEachLocateViewModel then
    LLocator := TioDIFactory.GetViewVMLocatorFor(FForEachModelPresenter, FActionParentCloseQuery, FAlias, True) as TioDILocator
  else
    LLocator := TioDIFactory.GetViewLocatorFor(FForEachModelPresenter, FAlias) as TioDILocator;
  // Set the locator
  LLocator._DuplicateLocatorForShowEachPurposeFrom(Self);
  Result := LLocator.Show;
end;

function TioDILocator.VCProvider(const AVCProvider: TioViewContextProvider): TioDILocator;
begin
  Result := Self;
  FVCProvider := AVCProvider;
end;

function TioDILocator.ViewModelExist: Boolean;
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

class function TioDIFactory.GetLocator(const AInterfaceName, AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDILocator;
var
  LDIContainerKey: String;
begin
  LDIContainerKey := BuildContainerKey(AInterfaceName, ADICObjType);
  Result := TioDILocator.Create(LDIContainerKey, AAlias, AOwnerRequested, AVCProviderEnabled);
end;

class function TioDIFactory.GetViewLocatorFor(const ATargetBS: IioBindSource; const AVAlias: String): TioDILocator;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBS, True, True);
  // Try to retrieve a locator for MP.Current instance
  Result := io.di.LocateViewFor(ATargetBS.Current.ClassName, AVAlias);
  // Set the locator
  Result._SetForEachModelPresenter(ATargetBS, True);
 // ---------- OLD CODE -----------
//  // Check for ModelPresenter validity
//  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetMP, True, True);
//  // Try to retrieve a locator for MP.Current instance
//  if io.di.LocateViewFor(ATargetMP.Current, AAlias).Exist then
//    // Result := io.di.LocateViewFor(ATargetMP.Current, AAlias) // NB: Mauri 05/03/2020 - Vecchio codice con il quale non funzionava l'AutorefreshOnNotification
//    Result := io.di.LocateViewFor(ATargetMP.Current.ClassName, AAlias)
//  else
//    // Try to retrieve a locator for MP.TypeName
//    if io.di.LocateViewFor(ATargetMP.GetTypeName, AAlias).Exist then
//      // Result := io.di.LocateViewFor(ATargetMP.TypeName, AAlias).SetPresenter(ATargetMP.Current) // NB: Mauri 05/03/2020 - Vecchio codice con il quale non funzionava l'AutorefreshOnNotification
//      Result := io.di.LocateViewFor(ATargetMP.GetTypeName, AAlias).SetBindSource(ATargetMP)
//    else
//      raise EioException.Create(Self.ClassName, 'GetViewLocatorFor', Format('There are no Views registered for "%s" or "%s" alias "%s".',
//        [ATargetMP.Current.ClassName, ATargetMP.GetTypeName, AAlias]));
//  // Set the locator
//  Result._SetForEachModelPresenter(ATargetMP, True);
// ---------- OLD CODE -----------
end;

class function TioDIFactory.GetViewVMLocatorFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const ACreateViewModel: Boolean): TioDILocator;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBS, True, True);
  // Try to retrieve a SimpleView locator for MP.Current instance
  if io.di.LocateSimpleViewFor(ATargetBS.Current, AParentCloseQueryAction, AVVMAlias).Exist then
    Result := GetSimpleViewLocatorFor(ATargetBS, AParentCloseQueryAction, AVVMAlias)
  else
  // Try to retrieve a View + ViewModel locator for MP.Current instance
  if io.di.LocateViewFor(ATargetBS.Current, AVVMAlias).Exist and io.di.LocateVMfor(ATargetBS.Current, AParentCloseQueryAction, AVVMAlias).Exist then
  begin
    if ACreateViewModel then
      Result := io.di._LocateForEachVVM_2ndPhase_Create(ATargetBS, ATargetBS.Current.ClassName, AParentCloseQueryAction, AVVMAlias)
    else
      Result := io.di._LocateForEachVVM_1stPhase_Browse(ATargetBS.Current.ClassName, AParentCloseQueryAction, AVVMAlias);
    // Set the locator
    Result._SetForEachModelPresenter(ATargetBS, True);
  end
  else
    if AVVMAlias.IsEmpty then
      raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
        #13#13'A View+ViewModel or a SimpleView for the "%s" class is required but I cannot find any registered.',
        [ATargetBS.Current.ClassName]))
    else
      raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
        #13#13'A View+ViewModel or a SimpleView for the "%s" class (alias "%s") is required but I cannot find any registered.',
        [ATargetBS.Current.ClassName, AVVMAlias]));


  // ---------- OLD CODE -----------
//  // Check for ModelPresenter validity
//  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetMP, True, True);
//  // Try to retrieve a locator for MP.Current instance
//  if io.di.LocateViewFor(ATargetMP.Current, AAlias).Exist and io.di.LocateVMfor(ATargetMP.Current, AAlias).Exist then
//  begin
//    if ACreateViewModel then
//      Result := io.di._LocateForEachVVM_2ndPhase_Create(ATargetMP, ATargetMP.Current.ClassName, AAlias)
//    else
//      Result := io.di._LocateForEachVVM_1stPhase_Browse(ATargetMP.Current.ClassName, AAlias);
//  end
//  else
//    // Try to retrieve a locator for MP.TypeName
//    if io.di.LocateViewFor(ATargetMP.GetTypeName, AAlias).Exist and io.di.LocateVMfor(ATargetMP.GetTypeName, AAlias).Exist then
//    begin
//      if ACreateViewModel then
//        Result := io.di._LocateForEachVVM_2ndPhase_Create(ATargetMP, ATargetMP.GetTypeName, AAlias)
//      else
//        Result := io.di._LocateForEachVVM_1stPhase_Browse(ATargetMP.GetTypeName, AAlias);
//    end
//    else
//      raise EioException.Create(Self.ClassName, 'GetViewVMLocatorFor', Format('There are no Views and/or ViewModels registered for "%s" or "%s" alias "%s".',
//        [ATargetMP.Current.ClassName, ATargetMP.GetTypeName, AAlias]));
//  // Set the locator
//  Result._SetForEachModelPresenter(ATargetMP, True);
  // ---------- OLD CODE -----------
end;

class function TioDIFactory.GetLocatorFor<TI>(const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDILocator<TI>;
var
  LDIContainerKey: String;
begin
  LDIContainerKey := BuildContainerKey(TioUtilities.GenericToString<TI>, ADICObjType);
  Result := TioDILocator<TI>.Create(LDIContainerKey, AAlias, AOwnerRequested, AVCProviderEnabled);
end;

class function TioDIFactory.GetSimpleViewLocatorFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDILocator;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBS, True, True);
  // Try to retrieve a locator for MP.Current instance
  Result := io.di.LocateSimpleViewFor(ATargetBS.Current.ClassName, AParentCloseQueryAction, ASVAlias).SetBindSource(ATargetBS);
  // Set the locator
  Result._SetForEachModelPresenter(ATargetBS, False);
// -------- OLD CODE --------
//  // Try to retrieve a locator for MP.Current instance
//  if io.di.LocateSimpleViewFor(ATargetMP.Current, AAlias).Exist then
//    // Result := io.di.LocateViewFor(ATargetMP.Current, AAlias) // NB: Mauri 05/03/2020 - Vecchio codice con il quale non funzionava l'AutorefreshOnNotification
//    Result := io.di.LocateSimpleViewFor(ATargetMP.Current.ClassName, AAlias)
//  else
//    // Try to retrieve a locator for MP.TypeName
//    if io.di.LocateSimpleViewFor(ATargetMP.GetTypeName, AAlias).Exist then
//      // Result := io.di.LocateViewFor(ATargetMP.TypeName, AAlias).SetPresenter(ATargetMP.Current) // NB: Mauri 05/03/2020 - Vecchio codice con il quale non funzionava l'AutorefreshOnNotification
//      Result := io.di.LocateSimpleViewFor(ATargetMP.GetTypeName, AAlias).SetBindSource(ATargetMP)
//    else
//      raise EioException.Create(Self.ClassName, 'LocateSimpleViewFor', Format('There are no SimpleViews registered for "%s" or "%s" alias "%s".',
//        [ATargetMP.Current.ClassName, ATargetMP.GetTypeName, AAlias]));
//  // Set the locator
//  Result._SetForEachModelPresenter(ATargetMP, False);
// -------- OLD CODE --------
end;

{ TioDependencyInjectionLocator<T> }

function TioDILocator<TI>.ConstructorParams(const AParams: TioConstructorParams): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).ConstructorParams(AParams);
end;

function TioDILocator<TI>.ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6);
end;

function TioDILocator<TI>.ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).ConstructorParams<T1, T2, T3, T4, T5>(AArg1, AArg2, AArg3, AArg4, AArg5);
end;

function TioDILocator<TI>.ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).ConstructorParams<T1, T2, T3, T4>(AArg1, AArg2, AArg3, AArg4);
end;

function TioDILocator<TI>.ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).ConstructorParams<T1, T2, T3>(AArg1, AArg2, AArg3);
end;

function TioDILocator<TI>.ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).ConstructorParams<T1, T2>(AArg1, AArg2);
end;

function TioDILocator<TI>.ConstructorParams<T1>(AArg1: T1): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).ConstructorParams<T1>(AArg1);
end;

function TioDILocator<TI>.Get: TI;
var
  LContainerItem: TioDIContainerImplementersItem;
begin
  try
    LContainerItem := Container.Get(_InterfaceName, _Alias);
    Result := TioUtilities.CastObjectToGeneric<TI>(_Get(LContainerItem), LContainerItem.InterfaceGUID);
  finally
    Free;
  end;
end;

function TioDILocator<TI>.SingletonKey(const ASingletonKey: String): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SingletonKey(ASingletonKey);
end;

function TioDILocator<TI>.SetBindSource(const ABSName: String; const ADataObject: TObject): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(ABSName, ADataObject);
end;

function TioDILocator<TI>.SetBindSource(const ABSName: String; const AMasterPresenter: IioBindSource;
  const AMasterPropertyName: String): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(ABSName, AMasterPresenter, AMasterPropertyName);
end;

function TioDILocator<TI>.SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(ABSName, AWhere);
end;

function TioDILocator<TI>.VCProvider(const AVCProvider: TioViewContextProvider): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).VCProvider(AVCProvider);
end;

function TioDILocator<TI>.SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc)
  : TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetViewContext(AViewContext, AViewContextFreeMethod);
end;

function TioDILocator<TI>.SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetViewModel(AViewModel, AMarker);
end;

{ TioDependencyInjectionResolverBase }

// NB: FOR ENTITY PERSISTENCE PURPOSES ONLY
class function TioDIResolverBase.Resolve(const ATypeName: String; const AAlias: String; const AResolverMode: TioResolverMode;
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
        // NB: FOR ENTITY PERSISTENCE PURPOSES ONLY
        if not LImplementer.IsEntity then
          Continue;
        // If the Use of maps info are enabled (default) then retreive ConnectionDefName and TableNamenfrom the map
        // and compose it together to avoid duplicate.
        // Else if the use of maps info are not enabled then return an empty string as ConnectionAndTable name
        // (this mode is called by iORM.ContextFactory.HasBelongsToRelation method because the mapping is
        // not completed at that time
        if AUseMapInfo then
        begin
          LMap := TioMapContainer.GetMap(LImplementer.ClazzName);
          LCurrentConnectionAndTable := LMap.GetTable.GetConnectionDefName + '.' + LMap.GetTable.TableName + '.' + LImplementer.FarAncestorClazzSameInterfaceAndTableAndConnection;
        end
        else
          LCurrentConnectionAndTable := '';
        // Add the implementer class to the result ConnectionAndTableList
        if (AResolverMode = rmAll) or (LConnectionAndTableList.IndexOf(LCurrentConnectionAndTable) = -1) then
        begin
          if TioUtilities.IsAnInterfaceTypeName(ATypeName) then
            Result.Add(LImplementer.FarAncestorClazzSameInterfaceAndTableAndConnection)
          else
            Result.Add(LImplementer.ClazzName);
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
  // If ResolverMode = rmAll and Alias is NOT specified...
  if (AResolverMode <= rmAllDistinctByConnectionAndTable) and AAlias.IsEmpty then
    _NestedResolveInterface
  else
    Result.Add(Container.Get(ATypeName, AAlias).ClazzName);
end;

// NB: FOR ENTITY PERSISTENCE PURPOSES ONLY
class function TioDIResolverBase.ResolveInaccurateAsRttiType(const ATypeName, AAlias: String): TRttiType;
var
  LResolvedTypeList: IioResolvedTypeList;
  LFirstResolvedClassName: String;
  LFirstResolvedClassMap: IioMap;
begin
  // Resolve the type and alias
  LResolvedTypeList := Resolve(ATypeName, AAlias, TioResolverMode.rmAllDistinctByConnectionAndTable, True);
  // Se non trova nemmeno una classe solleva un'eccezione
  if LResolvedTypeList.Count = 0 then
    raise EioGenericException.Create(ClassName, 'ResolveInaccurateAsRttiType', Format('No class was found that implements the interface ("%s" alias "%s").',
      [ATypeName, AAlias]));
  // Get the first resolved class name
  LFirstResolvedClassName := LResolvedTypeList[0];
  // Get the map of the first resolved class
  LFirstResolvedClassMap := TioMapContainer.GetMap(LFirstResolvedClassName);
  // Ritorna la prima classe trovata che implementa l'interfaccia desiderata
  Result := LFirstResolvedClassMap.RttiType;
end;

class function TioDependencyInjection.RegisterSimpleViewFor<TSimpleViewClass>(const ATargetIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TSimpleViewClass), TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias, dotSimpleView);
end;

class function TioDependencyInjection.RegisterView(const AViewRttiType: TRttiInstanceType; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(AViewRttiType, AAlias, dotView);
end;

class function TioDependencyInjection.RegisterView<TViewClass>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(TioUtilities.ClassRefToRttiType(TViewClass), AAlias, dotView);
end;

class function TioDependencyInjection.RegisterViewFor(const AViewRttiType: TRttiInstanceType; const ATargetIID: TGUID;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AViewRttiType, TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias, dotView);
end;

class function TioDependencyInjection.RegisterViewFor(const AViewRttiType: TRttiInstanceType; const ATargetClassRef: TioClassRef;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AViewRttiType, ATargetClassRef.ClassName, AAlias, dotView);
end;

class function TioDependencyInjection.RegisterViewFor(const AViewRttiType: TRttiInstanceType; const ATargetTypeName, AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AViewRttiType, ATargetTypeName, AAlias, dotView);
end;

class function TioDependencyInjection.RegisterViewFor<TViewClass, TTargetType>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewClass), TioUtilities.GenericToString<TTargetType>, AAlias, dotView);
end;

class function TioDependencyInjection.RegisterViewFor<TViewClass>(const ATargetIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewClass), TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias, dotView);
end;

class function TioDependencyInjection.RegisterViewModel(const AViewModelRttiType: TRttiInstanceType; const AImplementsIID: TGUID;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(AViewModelRttiType, AImplementsIID, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModel(const AViewModelRttiType: TRttiInstanceType; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(AViewModelRttiType, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModel<TViewModelClass, TImplements>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(TViewModelClass), TioUtilities.TypeInfoToGUID(TypeInfo(TImplements)), AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModel<TViewModelClass>(const AImplementsIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(TViewModelClass), AImplementsIID, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModel<TViewModelClass>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByClass(TioUtilities.ClassRefToRttiType(TViewModelClass), AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModelFor(const AViewModelRttiType: TRttiInstanceType; const ATargetTypeName, AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AViewModelRttiType, ATargetTypeName, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModelFor(const AViewModelRttiType: TRttiInstanceType; const ATargetIID: TGUID;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AViewModelRttiType, TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModelFor(const AViewModelRttiType: TRttiInstanceType; const ATargetClassRef: TioClassRef;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AViewModelRttiType, ATargetClassRef.ClassName, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModelFor<TViewModelClass, TTargetType>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewModelClass), TioUtilities.GenericToString<TTargetType>, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModelFor<TViewModelClass>(const ATargetIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewModelClass), TioUtilities.GUIDtoInterfaceName(ATargetIID), AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModelFor<TViewModelClass>(const ATargetClassRef: TioClassRef; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewModelClass), ATargetClassRef.ClassName, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewModelFor<TViewModelClass>(const ATargetTypeName, AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewModelClass), ATargetTypeName, AAlias, dotViewModel);
end;

class function TioDependencyInjection.RegisterViewFor<TViewClass>(const ATargetClassRef: TioClassRef; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewClass), ATargetClassRef.ClassName, AAlias, dotView);
end;

class function TioDependencyInjection.RegisterViewFor<TViewClass>(const ATargetTypeName, AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(TioUtilities.ClassRefToRttiType(TViewClass), ATargetTypeName, AAlias, dotView);
end;

class function TioDependencyInjection.RegisterView(const AViewRttiType: TRttiInstanceType; const AImplementsIID: TGUID;
  const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(AViewRttiType, AImplementsIID, AAlias, dotView);
end;

class function TioDependencyInjection.RegisterView<TViewClass, TImplements>(const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(TViewClass), TioUtilities.TypeInfoToGUID(TypeInfo(TImplements)), AAlias, dotView);
end;

class function TioDependencyInjection.RegisterView<TViewClass>(const AImplementsIID: TGUID; const AAlias: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByIID(TioUtilities.ClassRefToRttiType(TViewClass), AImplementsIID, AAlias, dotView);
end;

{ TioDIContainerImplementers }

procedure TioDIContainerImplementers.Add(const AAlias: String; const AImplementerItem: TioDIContainerImplementersItem);
begin
  // Increment counters only if it's a new element
  if FInternalContainer.ContainsKey(AAlias) then
    FInternalContainer.AddOrSetValue(AAlias, AImplementerItem)
  else
  begin
    FInternalContainer.Add(AAlias, AImplementerItem);
    _IncCounter(AAlias);
  end;
end;

function TioDIContainerImplementers.Contains(const AAlias: TioDIContainerImplementersKey): Boolean;
begin
  Result := FInternalContainer.ContainsKey(AAlias);
end;

constructor TioDIContainerImplementers.Create;
begin
  inherited;
  FInternalContainer := TObjectDictionary<string, TioDIContainerImplementersItem>.Create([doOwnsValues]);
  FEntityAutoRegisteredCount := 0;
end;

destructor TioDIContainerImplementers.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioDIContainerImplementers.GetCount: Integer;
begin
  Result := FInternalContainer.Count;
end;

function TioDIContainerImplementers.GetEnumerator: TEnumerator<TioDIContainerImplementersItem>;
begin
  Result := FInternalContainer.Values.GetEnumerator;
end;

function TioDIContainerImplementers.GetFirstAlias: String;
var
  LKeyEnumerator: TEnumerator<String>;
begin
  LKeyEnumerator := FInternalContainer.Keys.GetEnumerator;
  try
    if LKeyEnumerator.MoveNext then
      Result := LKeyEnumerator.Current
    else
      raise EioGenericException.Create(ClassName, 'GetFirstAlias', 'There are no implementing classes registered.');
  finally
    LKeyEnumerator.Free;
  end;
end;

function TioDIContainerImplementers.GetItem(const AAlias: TioDIContainerImplementersKey): TioDIContainerImplementersItem;
begin
  Result := FInternalContainer.Items[AAlias];
end;

function TioDIContainerImplementers.GetRegularRegisteredCount: Integer;
begin
  Result := FInternalContainer.Count - FEntityAutoRegisteredCount;
end;

function TioDIContainerImplementers.RemoveAndCheckIfEmpty(AAlias: String): Boolean;
begin
  FInternalContainer.Remove(AAlias);
  _DecCounter(AAlias);
  Result := FInternalContainer.Count = 0;
end;

procedure TioDIContainerImplementers._DecCounter(const AAlias: String);
begin
  if AAlias.StartsWith(DI_ENTITY_AUTOREGISTER_SUBKEY_PREFIX) then
    Dec(FEntityAutoRegisteredCount);
end;

procedure TioDIContainerImplementers._IncCounter(const AAlias: String);
begin
  if AAlias.StartsWith(DI_ENTITY_AUTOREGISTER_SUBKEY_PREFIX) then
    Inc(FEntityAutoRegisteredCount);
end;

function TioDILocator<TI>.SetBindSource(const ADataObject: TObject): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(ADataObject);
end;

function TioDILocator<TI>.SetBindSource(const AMasterPresenter: IioBindSource; const AMasterPropertyName: String)
  : TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(AMasterPresenter, AMasterPropertyName);
end;

function TioDILocator<TI>.SetBindSource(const AInterfacedObj: IInterface): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(AInterfacedObj);
end;

function TioDILocator<TI>.SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(ABSName, AInterfacedObj);
end;

function TioDILocator<TI>.SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource)
  : TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSourceAsSelectorFor(ASelectorBSName, ASelectionTargetBS);
end;

function TioDILocator<TI>.SetBindSourceAsETMfor(const AEtmBSName: String;
  const AEtmTargetBS: IioMasterBindSource): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSourceAsETMfor(AEtmBSName, AEtmTargetBS);
end;

function TioDILocator<TI>.SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSourceAsETMfor(AEtmTargetBS);
end;

function TioDILocator<TI>.SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSourceAsSelectorFor(ASelectionTargetBS);
end;

function TioDILocator<TI>.SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String;
  const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSourceAsWhereBuilderFor(AWhereBuilderBSName, AWhereBuilderTargetBS);
end;

function TioDILocator<TI>.SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSourceAsWhereBuilderFor(AWhereBuilderTargetBS);
end;

function TioDILocator<TI>.SetParentCloseQueryAction(const AParentCloseQueryAction: IioBSCloseQueryAction): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

function TioDILocator<TI>.SetBindSource(const AWhere: IioWhere): TioDILocator<TI>;
begin
  Result := Self;
  TioDILocator(Self).SetBindSource(AWhere);
end;

initialization

// NB: Spostato sulla initialize della unit iORM
// TioDependencyInjectionContainer.Build;
// TioViewModelShuttle.Build;

finalization

TioDIContainer.CleanUp;

end.
