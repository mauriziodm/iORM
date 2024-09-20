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
  System.SysUtils, iORM.LiveBindings.BSPersistence,
  iORM.DependencyInjection.Types;

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
    // Remember the 'Execute' at the end
    procedure Execute;
    // ---------- CONSTRUCTOR PARAMS ----------
    function ConstructorParams(var AParams: TioConstructorParams): TioDIRegister; overload;
    function ConstructorParams<T1>(AArg1: T1): TioDIRegister; overload;
    function ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDIRegister; overload;
    function ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIRegister; overload;
    function ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIRegister; overload;
    function ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIRegister; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIRegister; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIRegister; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8): TioDIRegister; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8; AArg9: T9): TioDIRegister; overload;
    // ---------- CONSTRUCTOR PARAMS ----------
    // ---------- FACTORY METHOD ----------
    function FactoryMethod(const AFactoryMethod: TioFactoryMethod): TioDIRegister; overload;
    function FactoryMethod<T1>(const AFactoryMethod: TioFactoryMethod<T1>): TioDIRegister; overload;
    function FactoryMethod<T1, T2>(const AFactoryMethod: TioFactoryMethod<T1, T2>): TioDIRegister; overload;
    function FactoryMethod<T1, T2, T3>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3>): TioDIRegister; overload;
    function FactoryMethod<T1, T2, T3, T4>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4>): TioDIRegister; overload;
    function FactoryMethod<T1, T2, T3, T4, T5>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5>): TioDIRegister; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6>): TioDIRegister; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7>): TioDIRegister; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>): TioDIRegister; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>): TioDIRegister; overload;
    // ---------- FACTORY METHOD ----------
    // ---------- PROPERTY/FIELD INJECTION ----------
    function InjectField(const AFieldName: String; AValue: TValue): TioDIRegister; overload;
    function InjectField<T>(const AFieldName: String; const AValue: T): TioDIRegister; overload;
    function InjectProperty(const APropertyName: String; AValue: TValue): TioDIRegister; overload;
    function InjectProperty<T>(const APropertyName: String; const AValue: T): TioDIRegister; overload;
    // ---------- PROPERTY/FIELD INJECTION ----------
  end;
  // ===========================================================================

  // ===========================================================================
  // CLASS LOCATOR
  // ---------------------------------------------------------------------------
  TioDIResolver = class(TioDIBase)
  strict private
    FImplementersItem: TioDIContainerImplementersItem;
    FInterfaceName: String;
    FAlias: String;
    FConstructorParams: TioConstructorParams;
    FPresenterSettings: TArray<TioDIPresenterSettingItem>;
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
    // ---------- FACTORY METHOD ----------
    // Se è stato impostato un FactoryMethod allora l'istanza viene creata alla chiamata del metodo
    //  "FactoryMethod<T1, T2, TX>" quindi prima della chiamata finale ai metodi Get/Show/ShowCurrent/ShowEach;
    //  in questo caso l'istanza viene parcheggiata nel campo privato "FAlreadyCreatedInstance" del locator
    //  e infine utilizzato dal metodo "_InternalGet", se però il FactoryMethod è senza parametri allora
    //  la creazione avviene alla chiamata sempre del metodo "_InternalGet" perchè non dovendo passare
    //  parametro non ci sarà nessuna chiamata al metodo "FactoryMethod" che senza parametri infatti
    //  non esiste perchè sarebbe inutile.
    FAlreadyCreatedInstance: TObject;
    // ---------- FACTORY METHOD ----------
    procedure ClearPresenterSettings;
    function PresenterSettingsExists: Boolean;
    function ViewModelExist: Boolean;
    function ExtractVMFromView(const AView: TComponent): IioViewModelInternal;
  strict protected
    procedure _GetImplementersItemIfNotAlreadyExists; inline;
    function _ShowCurrent: TComponent;
    function _InternalGet: TObject;
    property _ImplementersItem: TioDIContainerImplementersItem read FImplementersItem;
  public
    constructor Create(const AInterfaceName: String; const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean); virtual;
    function Exist: Boolean;
    function Get: TObject; virtual;
    function GetAs<TResult>: TResult;
    // TODO: 31/07/2024 - Verificare se serve ancora e se va messo anche qui un try-finally
    function GetImplementersItem: TioDIContainerImplementersItem;
    function Show: TComponent; virtual;
    function SingletonKey(const ASingletonKey: String): TioDIResolver; virtual;
    // ---------- CONSTRUCTOR PARAMS ----------
    function ConstructorParams(var AParams: TioConstructorParams): TioDIResolver; overload;
    function ConstructorParams<T1>(AArg1: T1): TioDIResolver; overload;
    function ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver; overload;
    function ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver; overload;
    function ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver; overload;
    function ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIResolver; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIResolver; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8): TioDIResolver; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8; AArg9: T9): TioDIResolver; overload;
    // ---------- CONSTRUCTOR PARAMS ----------
    // ---------- FACTORY METHOD ----------
    function FactoryMethod: TioDIResolver; overload;
    function FactoryMethod<T1>(AArg1: T1): TioDIResolver; overload;
    function FactoryMethod<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver; overload;
    function FactoryMethod<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver; overload;
    function FactoryMethod<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver; overload;
    function FactoryMethod<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIResolver; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIResolver; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8): TioDIResolver; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8; AArg9: T9): TioDIResolver; overload;
    // ---------- FACTORY METHOD ----------
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    function ShowCurrent: TComponent;
    procedure ShowEach;
    procedure _SetForEachModelPresenter(const AModelPresenter: IioBindSource; const ALocateViewModel: Boolean);
    procedure _DuplicateLocatorForShowEachPurposeFrom(const ASourceLocator: TioDIResolver);
    function _GetAlias: String;
    function _GetLocatorConstructorParamsPointer: PioConstructorParams;
    function _GetImplementersItemOrLocatorConstructorParamsPointer: PioConstructorParams;
    function _GetVCProvider: TioViewContextProvider;
    function _GetViewContext: TComponent;
    function _GetParentCloseQueryAction: IioBSCloseQueryAction;
    // ---------- FOR SHOW EACH FUNCTIONALITY ----------
    // ---------- VIEWMODEL METHODS ----------
    function SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDIResolver;
    // ---------- VIEWMODEL METHODS ----------
    // ---------- SETBINDSOURCE METHODS ----------
    // SetBindSource (passing the name of the destination presenter)
    function SetBindSource(const ABSName: String; const ADataObject: TObject): TioDIResolver; overload;
    function SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDIResolver; overload;
    function SetBindSource(const ABSName: String; const AMasterBindSource: IioBindSource; const AMasterPropertyName: String = ''): TioDIResolver; overload;
    function SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDIResolver; overload;
    function SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource): TioDIResolver; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String; const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver; overload;
    function SetBindSourceAsETMfor(const AEtmBSName: String; const AEtmTargetBS: IioMasterBindSource): TioDIResolver; overload;
    // SetBindSource (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject: TObject): TioDIResolver; overload;
    function SetBindSource(const AInterfacedObj: IInterface): TioDIResolver; overload;
    function SetBindSource(const AMasterBindSource: IioBindSource; const AMasterPropertyName: String = ''): TioDIResolver; overload;
    function SetBindSource(const AWhere: IioWhere): TioDIResolver; overload;
    function SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDIResolver; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver; overload;
    function SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDIResolver; overload;
    // ---------- SETBINDSOURCE METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider: TioViewContextProvider): TioDIResolver;
    function SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc = nil): TioDIResolver;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
    function SetParentCloseQueryAction(const AParentCLoseQueryAction: IioBSCloseQueryAction): TioDIResolver;
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
  end;

  // Generic version of the Service Locator Class
  TioDIResolver<TI> = class(TioDIResolver)
  public
    function Get: TI; reintroduce; overload;
    function SingletonKey(const ASingletonKey: String): TioDIResolver<TI>; reintroduce; overload;
    // ---------- CONSTRUCTOR PARAMS ----------
    function ConstructorParams(var AParams: TioConstructorParams): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1>(AArg1: T1): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8): TioDIResolver<TI>; reintroduce; overload;
    function ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8; AArg9: T9): TioDIResolver<TI>; reintroduce; overload;

    // ---------- CONSTRUCTOR PARAMS ----------
    // ---------- FACTORY METHOD ----------
    function FactoryMethod: TioDIResolver<TI>; overload;
    function FactoryMethod<T1>(AArg1: T1): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8): TioDIResolver<TI>; overload;
    function FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8; AArg9: T9): TioDIResolver<TI>; overload;
    // ---------- FACTORY METHOD ----------
    // ---------- VIEWMODEL METHODS ----------
    function SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDIResolver<TI>;
    // ---------- VIEWMODEL METHODS ----------
    // ---------- SETBINDSOURCE METHODS ----------
    // SetPresenter (passing the name of the destination presenter)
    function SetBindSource(const ABSName: String; const ADataObject: TObject): TioDIResolver<TI>; overload;
    function SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDIResolver<TI>; overload;
    function SetBindSource(const ABSName: String; const AMasterPresenter: IioBindSource; const AMasterPropertyName: String = ''): TioDIResolver<TI>; overload;
    function SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDIResolver<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource): TioDIResolver<TI>; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String; const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver<TI>; overload;
    function SetBindSourceAsETMfor(const AEtmBSName: String; const AEtmTargetBS: IioMasterBindSource): TioDIResolver<TI>; overload;
    // SetPresenter (WITHOUT passing the name of the destination presenter)
    function SetBindSource(const ADataObject: TObject): TioDIResolver<TI>; overload;
    function SetBindSource(const AInterfacedObj: IInterface): TioDIResolver<TI>; overload;
    function SetBindSource(const AMasterPresenter: IioBindSource; const AMasterPropertyName: String = ''): TioDIResolver<TI>; overload;
    function SetBindSource(const AWhere: IioWhere): TioDIResolver<TI>; overload;
    function SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDIResolver<TI>; overload;
    function SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver<TI>; overload;
    function SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDIResolver<TI>; overload;
    // ---------- VIEW MODEL METHODS ----------
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider: TioViewContextProvider): TioDIResolver<TI>;
    function SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc = nil): TioDIResolver<TI>;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    // ---------- CLOSE QUERY ACTION FUNCTIONALITY ----------
    function SetParentCloseQueryAction(const AParentCloseQueryAction: IioBSCloseQueryAction): TioDIResolver<TI>;
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
    class function _LocateForEachVVM_1stPhase_Browse(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias: String = ''): TioDIResolver; overload;
    class function _LocateForEachVVM_2ndPhase_Create(const ASourceMP: IioBindSource; const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias: String = ''; const AViewModelMarker: String = ''): TioDIResolver; overload;
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
    class function Resolve(const AInterfaceName: String; const AAlias: String = ''): TioDIResolver; overload;
    class function Resolve<T>(const AAlias: String = ''): TioDIResolver<T>; overload;
    // Locate SimpleView
    class function ResolveSimpleView(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver; overload;
    class function ResolveSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver<T>; overload;
    class function ResolveSimpleViewFor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver; overload;
    class function ResolveSimpleViewFor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver; overload;
    class function ResolveSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver; overload;
    class function ResolveSimpleViewFor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver; overload;
    class function ResolveSimpleViewFor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver; overload;
    class function ResolveSimpleViewFor(const ATargetMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = ''): TioDIResolver; overload;
    // Locate View
    class function ResolveView(const AInterfaceName: String; const AVAlias: String = ''): TioDIResolver; overload;
    class function ResolveView<T: IInterface>(const AVAlias: String = ''): TioDIResolver<T>; overload;
    class function ResolveViewFor(const ATargetTypeName: String; const AVAlias: String = ''): TioDIResolver; overload;
    class function ResolveViewFor(const AClassRef: TioClassRef; const AVAlias: String = ''): TioDIResolver; overload;
    class function ResolveViewFor<T>(const AVAlias: String = ''): TioDIResolver; overload;
    class function ResolveViewFor(const ATargetObj: TObject; const AVAlias: String = ''): TioDIResolver; overload;
    class function ResolveViewFor(const ATargetIntf: IInterface; const AVAlias: String = ''): TioDIResolver; overload;
    class function ResolveViewFor(const ATargetMP: IioBindSource; const AVAlias: String = ''): TioDIResolver; overload;
    // Locate ViewModel
    class function ResolveVM(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDIResolver; overload;
    class function ResolveVM<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDIResolver<T>; overload;
    class function ResolveVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDIResolver; overload;
    class function ResolveVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDIResolver; overload;
    class function ResolveVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDIResolver; overload;
    class function ResolveVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDIResolver; overload;
    class function ResolveVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''): TioDIResolver; overload;
    // Locate View & ViewModel
    class function ResolveViewVM(const AViewInterfaceName, AVMInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDIResolver; overload;
    class function ResolveViewVM<TView: IInterface; TViewModel: IioViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDIResolver<TView>; overload;
    class function ResolveViewVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDIResolver; overload;
    class function ResolveViewVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDIResolver; overload;
    class function ResolveViewVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AViewModelMarker: String = ''): TioDIResolver; overload;
    class function ResolveViewVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''): TioDIResolver; overload;
    class function ResolveViewVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''): TioDIResolver; overload;
    class function ResolveViewVMfor(const ASourceMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''): TioDIResolver; overload;
    // ========== LOCATE ==========
  end;

  // Dependency Injection Factory
  TioDIFactory = class abstract(TioDIBase)
  strict private
    // class procedure _CheckModelPresenter(const ATargetMP:TioModelPresenter); NB: Hint prevention "symbol declared but never used" (codice resente sotto)
  public
    class function GetResolver(const AInterfaceName: String; const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDIResolver; static;
    class function GetResolverFor<TI>(const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDIResolver<TI>; static;
    class function GetSimpleViewResolverFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver; static;
    class function GetViewResolverFor(const ATargetBS: IioBindSource; const AVAlias: String): TioDIResolver; static;
    class function GetViewVMResolverFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const ACreateViewModel: Boolean): TioDIResolver; static;
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

class function TioDependencyInjection.Resolve(const AInterfaceName, AAlias: String): TioDIResolver;
begin
  Result := TioDIFactory.GetResolver(AInterfaceName, AAlias, False, False, dotRegular);
end;

class function TioDependencyInjection.Resolve<T>(const AAlias: String): TioDIResolver<T>;
begin
  Result := TioDIFactory.GetResolverFor<T>(AAlias, False, False, dotRegular);
end;

class function TioDependencyInjection.ResolveSimpleView(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  Result := TioDIFactory.GetResolver(AInterfaceName, ASVAlias, True, True, dotSimpleView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.ResolveSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver<T>;
begin
  Result := TioDIFactory.GetResolverFor<T>(ASVAlias, True, True, dotSimpleView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.ResolveSimpleViewFor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  Result := ResolveSimpleViewFor(AClassRef.ClassName, AParentCloseQueryAction, ASVAlias);
end;

class function TioDependencyInjection.ResolveSimpleViewFor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  Result := ResolveSimpleViewFor(ATargetObj.ClassName, AParentCloseQueryAction, ASVAlias).SetBindSource(ATargetObj);
end;

class function TioDependencyInjection.ResolveSimpleViewFor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  Result := ResolveSimpleViewFor((ATargetIntf as TObject).ClassName, AParentCloseQueryAction, ASVAlias).SetBindSource(ATargetIntf);
end;

class function TioDependencyInjection.ResolveSimpleViewFor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetResolver(ATargetTypeName, ASVAlias, True, True, dotSimpleView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.ResolveView(const AInterfaceName, AVAlias: String): TioDIResolver;
begin
  Result := TioDIFactory.GetResolver(AInterfaceName, AVAlias, True, True, dotView);
end;

class function TioDependencyInjection.ResolveViewVM(const AViewInterfaceName, AVMInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVVMAlias, AViewModelMarker: String): TioDIResolver;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetResolver(AViewInterfaceName, AVVMAlias, True, True, dotView);
  // Get the ViewModel instance
  LViewModel := io.di.ResolveVM(AVMInterfaceName, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.ResolveViewVM<TView, TViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String)
  : TioDIResolver<TView>;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetResolverFor<TView>(AVVMAlias, True, True, dotView);
  // Get the ViewModel instance
  LViewModel := io.di.ResolveVM<TViewModel>(AParentCloseQueryAction, AVVMAlias).Get;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.ResolveViewVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String): TioDIResolver;
begin
  Result := ResolveViewVMfor(AClassRef.ClassName, AParentCloseQueryAction, AVVMAlias, AViewModelMarker);
end;

class function TioDependencyInjection.ResolveViewVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String): TioDIResolver;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := ResolveViewFor(ATargetObj.ClassName, AVVMAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.ResolveVMfor(ATargetObj, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel);
end;

class function TioDependencyInjection.ResolveViewVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String): TioDIResolver;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := ResolveViewFor(ATargetIntf, AVVMAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.ResolveVMfor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel);
end;

class function TioDependencyInjection.ResolveViewVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String): TioDIResolver;
begin
  Result := ResolveViewVMfor(TioUtilities.GenericToString<T>, AParentCloseQueryAction, AVVMAlias, AViewModelMarker);
end;

class function TioDependencyInjection.ResolveView<T>(const AVAlias: String): TioDIResolver<T>;
begin
  Result := TioDIFactory.GetResolverFor<T>(AVAlias, True, True, dotView);
end;

class function TioDependencyInjection.ResolveViewFor(const AClassRef: TioClassRef; const AVAlias: String): TioDIResolver;
begin
  Result := ResolveViewFor(AClassRef.ClassName, AVAlias);
end;

class function TioDependencyInjection.ResolveViewFor(const ATargetObj: TObject; const AVAlias: String): TioDIResolver;
begin
  Result := ResolveViewFor(ATargetObj.ClassName, AVAlias);
end;

class function TioDependencyInjection.ResolveViewFor<T>(const AVAlias: String): TioDIResolver;
begin
  Result := ResolveViewFor(TioUtilities.GenericToString<T>, AVAlias);
end;

class function TioDependencyInjection.ResolveViewFor(const ATargetMP: IioBindSource; const AVAlias: String): TioDIResolver;
begin
  // Get & set the locator
  Result := TioDIFactory.GetViewResolverFor(ATargetMP, AVAlias);
end;

class function TioDependencyInjection.ResolveViewFor(const ATargetTypeName, AVAlias: String): TioDIResolver;
begin
  // Get the ViewLocator
  Result := TioDIFactory.GetResolver(ATargetTypeName, AVAlias, True, True, dotView);
end;

class function TioDependencyInjection.ResolveVM(const AInterfaceName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDIResolver;
begin
  Result := TioDIFactory.GetResolver(AInterfaceName, AVMAlias, True, False, dotViewModel).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.ResolveVM<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDIResolver<T>;
begin
  Result := TioDIFactory.GetResolverFor<T>(AVMAlias, True, False, dotViewModel).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.ResolveVMfor(const AClassRef: TioClassRef; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDIResolver;
begin
  Result := ResolveVMfor(AClassRef.ClassName, AParentCloseQueryAction, AVMAlias);
end;

class function TioDependencyInjection.ResolveVMfor(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDIResolver;
begin
  Result := ResolveVMfor(ATargetObj.ClassName, AParentCloseQueryAction, AVMAlias).SetBindSource(ATargetObj);
end;

class function TioDependencyInjection.ResolveVMfor(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDIResolver;
begin
  Result := ResolveVMfor((ATargetIntf as TObject).ClassName, AParentCloseQueryAction, AVMAlias).SetBindSource(ATargetIntf);
end;

class function TioDependencyInjection.ResolveVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDIResolver;
begin
  Result := TioDIFactory.GetResolver(ATargetTypeName, AVMAlias, True, False, dotViewModel).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection.ResolveVMfor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String): TioDIResolver;
begin
  Result := ResolveVMfor(TioUtilities.GenericToString<T>, AParentCloseQueryAction, AVMAlias);
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

class function TioDependencyInjection.ResolveViewFor(const ATargetIntf: IInterface; const AVAlias: String): TioDIResolver;
begin
  Result := ResolveViewFor((ATargetIntf as TObject).ClassName, AVAlias);
end;

class function TioDependencyInjection.ResolveViewVMfor(const ASourceMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String): TioDIResolver;
begin
  // Get & set the locator
  Result := TioDIFactory.GetViewVMResolverFor(ASourceMP, AParentCloseQueryAction, AVVMAlias, False);
end;

class function TioDependencyInjection._LocateForEachVVM_1stPhase_Browse(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias: String): TioDIResolver;
begin
  // NB: This method create the locator instance only (never create a VM like LocateViewVM methods)
  // Get the ViewLocator
  Result := TioDIFactory.GetResolver(ATargetTypeName, AAlias, True, True, dotView).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

class function TioDependencyInjection._LocateForEachVVM_2ndPhase_Create(const ASourceMP: IioBindSource; const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AAlias, AViewModelMarker: String): TioDIResolver;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := ResolveViewFor(ATargetTypeName, AAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.ResolveVMfor(ATargetTypeName, AParentCloseQueryAction, AAlias).SetBindSource(ASourceMP).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection._RegisterClassAsInheritedFrom(const AClassRttiType: TRttiInstanceType; const AAncestorClassName: String): TioDIRegister;
begin
  Result := TioDIRegister.CreateByTargetTypeName(AClassRttiType, AAncestorClassName, String.Empty, dotRegular);
end;

class function TioDependencyInjection.ResolveViewVMfor(const ATargetTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias, AViewModelMarker: String): TioDIResolver;
var
  LViewModel: IioViewModel;
begin
  // Get the ViewLocator
  Result := ResolveViewFor(ATargetTypeName, AVVMAlias);
  // Get & set the ViewModel instance into the ViewLocator
  LViewModel := io.di.ResolveVMfor(ATargetTypeName, AParentCloseQueryAction, AVVMAlias).GetAs<IioViewModel>;
  Result.SetViewModel(LViewModel, AViewModelMarker);
end;

class function TioDependencyInjection.ResolveSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  // Get & set the locator
  Result := ResolveSimpleViewFor(TioUtilities.GenericToString<T>, AParentCloseQueryAction, ASVAlias);
end;

class function TioDependencyInjection.ResolveSimpleViewFor(const ATargetMP: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  // Get & set the locator
  Result := TioDIFactory.GetSimpleViewResolverFor(ATargetMP, AParentCloseQueryAction, ASVAlias);
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

function TioDIRegister.ConstructorParams(var AParams: TioConstructorParams): TioDIRegister;
var
  I: Integer;
begin
  // Solo così sembra andare bene
  SetLength(FImpementersItem.ConstructorParamsPointer^, Length(AParams));
  for I := Low(AParams) to High(AParams) do
    FImpementersItem.ConstructorParamsPointer^[I] := AParams[I];
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7;
  AArg8: T8; AArg9: T9): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 9);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  TValue.Make(@AArg3, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[2]);
  TValue.Make(@AArg4, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[3]);
  TValue.Make(@AArg5, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[4]);
  TValue.Make(@AArg6, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[5]);
  TValue.Make(@AArg7, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[6]);
  TValue.Make(@AArg8, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[7]);
  TValue.Make(@AArg9, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[8]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7;
  AArg8: T8): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 8);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  TValue.Make(@AArg3, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[2]);
  TValue.Make(@AArg4, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[3]);
  TValue.Make(@AArg5, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[4]);
  TValue.Make(@AArg6, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[5]);
  TValue.Make(@AArg7, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[6]);
  TValue.Make(@AArg8, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[7]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6;
  AArg7: T7): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 7);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  TValue.Make(@AArg3, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[2]);
  TValue.Make(@AArg4, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[3]);
  TValue.Make(@AArg5, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[4]);
  TValue.Make(@AArg6, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[5]);
  TValue.Make(@AArg7, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[6]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 6);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  TValue.Make(@AArg3, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[2]);
  TValue.Make(@AArg4, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[3]);
  TValue.Make(@AArg5, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[4]);
  TValue.Make(@AArg6, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[5]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 5);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  TValue.Make(@AArg3, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[2]);
  TValue.Make(@AArg4, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[3]);
  TValue.Make(@AArg5, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[4]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 4);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  TValue.Make(@AArg3, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[2]);
  TValue.Make(@AArg4, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[3]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 3);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  TValue.Make(@AArg3, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[2]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 2);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
  TValue.Make(@AArg2, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[1]);
  Result := Self;
end;

function TioDIRegister.ConstructorParams<T1>(AArg1: T1): TioDIRegister;
begin
  SetLength(FImpementersItem.ConstructorParamsPointer^, 1);
  TValue.Make(@AArg1, TypeInfo(T1), FImpementersItem.ConstructorParamsPointer^[0]);
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

procedure TioDIRegister.Execute;
begin
  Free;
end;

function TioDIRegister.FactoryMethod(const AFactoryMethod: TioFactoryMethod): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2, T3, T4, T5, T6, T7>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2, T3, T4, T5, T6>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5, T6>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2, T3, T4, T5, T6>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2, T3, T4, T5>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4, T5>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2, T3, T4, T5>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2, T3, T4>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3, T4>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2, T3, T4>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2, T3>(const AFactoryMethod: TioFactoryMethod<T1, T2, T3>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2, T3>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1, T2>(const AFactoryMethod: TioFactoryMethod<T1, T2>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1, T2>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.FactoryMethod<T1>(const AFactoryMethod: TioFactoryMethod<T1>): TioDIRegister;
begin
  TValue.Make(@AFactoryMethod, TypeInfo(TioFactoryMethod<T1>), FImpementersItem.FactoryMethodPointer^);
  Result := Self;
end;

function TioDIRegister.InjectField(const AFieldName: String; AValue: TValue): TioDIRegister;
var
  LIndex: Integer;
begin
  LIndex := Length(FImpementersItem.FieldInjectionsPointer^);
  SetLength(FImpementersItem.FieldInjectionsPointer^, LIndex + 1);
  with FImpementersItem.FieldInjectionsPointer^[LIndex] do
  begin
    Name := AFieldName;
    Value := AValue;
  end;
  Result := Self;
end;

function TioDIRegister.InjectField<T>(const AFieldName: String; const AValue: T): TioDIRegister;
var
  LValue: TValue;
begin
  TValue.Make(@AValue, TypeInfo(T), LValue);
  Result := InjectField(AFieldName, LValue);
end;

function TioDIRegister.InjectProperty(const APropertyName: String; AValue: TValue): TioDIRegister;
var
  LIndex: Integer;
begin
  LIndex := Length(FImpementersItem.PropertyInjectionsPointer^);
  SetLength(FImpementersItem.PropertyInjectionsPointer^, LIndex + 1);
  with FImpementersItem.PropertyInjectionsPointer^[LIndex] do
  begin
    Name := APropertyName;
    Value := AValue;
  end;
  Result := Self;
end;

function TioDIRegister.InjectProperty<T>(const APropertyName: String; const AValue: T): TioDIRegister;
var
  LValue: TValue;
begin
  TValue.Make(@AValue, TypeInfo(T), LValue);
  Result := InjectProperty(APropertyName, LValue);
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
          #13#13'Perhaps you forgot to register it, to do so you can decorate the ViewModel class with the attribute "[diViewModelFor(%s)]" or you can write some code like: "io.di.RegisterViewModel<TMyViewModel, %s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A ViewModel for "%s" (alias "%s") is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the ViewModel class with the attribute "[diViewModelFor(%s,"%s")]" or you can write some code like: "io.di.RegisterViewModel<TMyViewModel, %s>("%s").Execute".' +
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
          #13#13'Perhaps you forgot to register it, to do so you can decorate the View class with the attribute "[diViewFor(%s)]" or you can write some code like: "io.di.RegisterView<TMyView, %s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A View for "%s" (alias "%s") is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the View class with the attribute "[diViewFor(%s,"%s")]" or you can write some code like: "io.di.RegisterView<TMyView, %s>("%s").Execute".' +
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
          #13#13'Perhaps you forgot to register it, to do so you can decorate the SimpleView class with the attribute "[diSimpleViewFor(%s)]" or you can write some code like: "io.di.RegisterSimpleView<TMySimpleView, %s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'A SimpleView for "%s" (alias "%s") is required but I cannot find any registered.' +
          #13#13'Perhaps you forgot to register it, to do so you can decorate the SimpleView class with the attribute "[diSimpleViewFor(%s,"%s")]" or you can write some code like: "io.di.RegisterSimpleView<TMySimpleView, %s>("%s").Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, ASubKey, AKey, ASubKey, AKey, ASubKey]));
    end
    // Normal interface implementer
    else
    begin
      if ASubKey.IsEmpty then
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'Services of the "%s" interface are required but I cannot find any registered class that implements it.' +
          #13#13'Maybe you forgot to register the class, to do so you can decorate it with the "[diImplements(%s)]" attribute or you can write some code like: "io.di.RegisterClass<TMyClass, %s>.Execute".' +
          #13#13'If you decide to use the attribute, make sure you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit.' +
          #13#13'This will work.', [AKey, AKey, AKey]))
      else
        raise EioGenericException.Create(ClassName, 'Get', Format('Hi, I''m the iORM Dependency Injection Container.' +
          #13#13'Services of the "%s" interface (alias "%s") are required but I cannot find any registered class that implements it.' +
          #13#13'Maybe you forgot to register the class, to do so you can decorate it with the "[diImplements(%s, ''%s'')]" attribute or you can write some code like: "io.di.RegisterClass<TMyClass, %s>(''%s'').Execute".' +
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
      #13#13'I remind you that you can register a class as an implementer of an interface by decorating it with the attribute "[diImplements (%s)]" or you can write some code like: "io.di.RegisterClass<TMyClass, %s>.Execute".' +
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

procedure TioDIResolver.ClearPresenterSettings;
begin
  SetLength(FPresenterSettings, 0);
end;

function TioDIResolver.ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7;
  AArg8: T8; AArg9: T9): TioDIResolver;
begin
  SetLength(FConstructorParams, 9);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  TValue.Make(@AArg5, TypeInfo(T5), FConstructorParams[4]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[5]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[6]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[7]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[8]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7;
  AArg8: T8): TioDIResolver;
begin
  SetLength(FConstructorParams, 8);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  TValue.Make(@AArg5, TypeInfo(T5), FConstructorParams[4]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[5]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[6]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[7]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIResolver;
begin
  SetLength(FConstructorParams, 7);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  TValue.Make(@AArg5, TypeInfo(T5), FConstructorParams[4]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[5]);
  TValue.Make(@AArg6, TypeInfo(T6), FConstructorParams[6]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver;
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

function TioDIResolver.ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4;
  AArg5: T5): TioDIResolver;
begin
  SetLength(FConstructorParams, 5);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  TValue.Make(@AArg5, TypeInfo(T5), FConstructorParams[4]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver;
begin
  SetLength(FConstructorParams, 4);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  TValue.Make(@AArg4, TypeInfo(T4), FConstructorParams[3]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver;
begin
  SetLength(FConstructorParams, 3);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  TValue.Make(@AArg3, TypeInfo(T3), FConstructorParams[2]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver;
begin
  SetLength(FConstructorParams, 2);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  TValue.Make(@AArg2, TypeInfo(T2), FConstructorParams[1]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams<T1>(AArg1: T1): TioDIResolver;
begin
  SetLength(FConstructorParams, 1);
  TValue.Make(@AArg1, TypeInfo(T1), FConstructorParams[0]);
  Result := Self;
end;

function TioDIResolver.ConstructorParams(var AParams: TioConstructorParams): TioDIResolver;
var
  I: Integer;
begin
  // Solo così sembra andare bene
  SetLength(FConstructorParams, Length(AParams));
  for i := 0 to High(AParams) do
    FConstructorParams[i] := AParams[i];
  Result := Self;
end;

constructor TioDIResolver.Create(const AInterfaceName, AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean);
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
  FAlreadyCreatedInstance := nil;
end;

function TioDIResolver.Exist: Boolean;
begin
  try
    Result := Container.Exists(FInterfaceName, FAlias);
  finally
    Free;
  end;
end;

function TioDIResolver.ExtractVMFromView(const AView: TComponent): IioViewModelInternal;
var
  LVMBridge: TioViewModelBridge;
begin
  Result := nil;
  LVMBridge := TioViewModelBridge.ExtractVMBridge(AView);
  if Assigned(LVMBridge) and LVMBridge.ViewModelIsAssigned then
    Result := LVMBridge.ViewModel as IioViewModelInternal;
end;

function TioDIResolver.FactoryMethod: TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod>
    .AsType<TioFactoryMethod>()();
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8;
  AArg9: T9): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>>
    .AsType<TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>>()(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7, AArg8, AArg9);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7;
  AArg8: T8): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>>
    .AsType<TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>>()(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7, AArg8);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7>>
    .AsType<TioFactoryMethod<T1, T2, T3, T4, T5, T6, T7>>()(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2, T3, T4, T5, T6>>
    .AsType<TioFactoryMethod<T1, T2, T3, T4, T5, T6>>()(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2, T3, T4, T5>>
    .AsType<TioFactoryMethod<T1, T2, T3, T4, T5>>()(AArg1, AArg2, AArg3, AArg4, AArg5);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2, T3, T4>>
    .AsType<TioFactoryMethod<T1, T2, T3, T4>>()(AArg1, AArg2, AArg3, AArg4);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2, T3>>
    .AsType<TioFactoryMethod<T1, T2, T3>>()(AArg1, AArg2, AArg3);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1, T2>>
    .AsType<TioFactoryMethod<T1, T2>>()(AArg1, AArg2);
  Result := Self;
end;

function TioDIResolver.FactoryMethod<T1>(AArg1: T1): TioDIResolver;
begin
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
  FAlreadyCreatedInstance := FImplementersItem.FactoryMethodPointer^
    .Cast<TioFactoryMethod<T1>>
    .AsType<TioFactoryMethod<T1>>()(AArg1);
  Result := Self;
end;

function TioDIResolver.Get: TObject;
begin
  try
    Result := _InternalGet;
  finally
    Free;
  end;
end;

function TioDIResolver.GetAs<TResult>: TResult;
var
  LObj: TObject;
begin
  try
    LObj := _InternalGet;
    Result := TioUtilities.CastObjectToGeneric<TResult>(LObj);
  finally
    Free;
  end;
end;

function TioDIResolver.GetImplementersItem: TioDIContainerImplementersItem;
begin
  try
    // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
    //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
    //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
    //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
    //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
    //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
    //      perchè faceva subito il get della item sul container (che appunto non c'era)
    _GetImplementersItemIfNotAlreadyExists;
    Result := FImplementersItem;
  finally
    Free;
  end;
end;

function TioDIResolver.PresenterSettingsExists: Boolean;
begin
  Result := (Length(FPresenterSettings) > 0);
end;

function TioDIResolver.SingletonKey(const ASingletonKey: String): TioDIResolver;
begin
  FSingletonKey := ASingletonKey;
  Result := Self;
end;

function TioDIResolver.SetBindSource(const ABSName: String; const ADataObject: TObject): TioDIResolver;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingType.pstDataObject;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].Obj := ADataObject;
  Result := Self;
end;

function TioDIResolver.SetBindSource(const ABSName: String; const AMasterBindSource: IioBindSource; const AMasterPropertyName: String)
  : TioDIResolver;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingType.pstMasterModelPresenter;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].Obj := (AMasterBindSource as TObject);
  FPresenterSettings[i].StringParameter := AMasterPropertyName;
  Result := Self;
end;

function TioDIResolver.SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDIResolver;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingType.pstWhere;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].InterfacedObj := AWhere;
  Result := Self;
end;

// function TioDependencyInjectionLocator.SetBindSource(
// const ABindSourceAdapter: IioActiveBindSourceAdapter): IioDependencyInjectionLocator;
// begin
// Result := SetBindSource('', ABindSourceAdapter);
// end;

function TioDIResolver.SetBindSource(const ADataObject: TObject): TioDIResolver;
begin
  Result := SetBindSource('', ADataObject);
end;

function TioDIResolver.SetBindSource(const AMasterBindSource: IioBindSource; const AMasterPropertyName: String)
  : TioDIResolver;
begin
  Result := SetBindSource('', AMasterBindSource, AMasterPropertyName);
end;

function TioDIResolver.SetBindSource(const AInterfacedObj: IInterface): TioDIResolver;
begin
  Result := SetBindSource('', AInterfacedObj);
end;

function TioDIResolver.SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDIResolver;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingType.pstInterfacedObj;
  FPresenterSettings[i].Name := ABSName;
  FPresenterSettings[i].InterfacedObj := AInterfacedObj;
  Result := Self;
end;

function TioDIResolver.SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource)
  : TioDIResolver;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingType.pstSelectorFor;
  FPresenterSettings[i].Name := ASelectorBSName;
  FPresenterSettings[i].Obj := (ASelectionTargetBS as TObject);
  Result := Self;
end;

function TioDIResolver.SetBindSourceAsETMfor(const AEtmBSName: String; const AEtmTargetBS: IioMasterBindSource): TioDIResolver;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingType.pstETMfor;
  FPresenterSettings[i].Name := AEtmBSName;
  FPresenterSettings[i].Obj := (AEtmTargetBS as TObject);
  Result := Self;
end;

function TioDIResolver.SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDIResolver;
begin
  Result := SetBindSourceAsETMfor(String.Empty, AEtmTargetBS);
end;

function TioDIResolver.SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDIResolver;
begin
  Result := SetBindSourceAsSelectorFor(String.Empty, ASelectionTargetBS);
end;

function TioDIResolver.SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String;
  const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver;
var
  i: Integer;
begin
  i := Length(FPresenterSettings);
  SetLength(FPresenterSettings, i + 1);
  FPresenterSettings[i].SettingsType := TioDIPresenterSettingType.pstWhereBuilderFor;
  FPresenterSettings[i].Name := AWhereBuilderBSName;
  FPresenterSettings[i].Obj := (AWhereBuilderTargetBS as TObject);
  Result := Self;
end;

function TioDIResolver.SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver;
begin
  Result := SetBindSourceAsWhereBuilderFor(String.Empty, AWhereBuilderTargetBS);
end;

function TioDIResolver.SetParentCloseQueryAction(const AParentCLoseQueryAction: IioBSCloseQueryAction): TioDIResolver;
begin
  FActionParentCloseQuery := AParentCLoseQueryAction;
  Result := Self;
end;

function TioDIResolver.SetBindSource(const AWhere: IioWhere): TioDIResolver;
begin
  Result := SetBindSource('', AWhere);
end;

function TioDIResolver.SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc): TioDIResolver;
begin
  Result := Self;
  FViewContext := AViewContext;
  FViewContextFreeMethod := AViewContextFreeMethod;
end;

function TioDIResolver.SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDIResolver;
begin
  FViewModelMarker := AMarker;
  FViewModel := AViewModel as IioViewModelInternal;
  Result := Self;
end;

function TioDIResolver.Show: TComponent;
begin
  try
    Result := _InternalGet as TComponent;
  finally
    Free;
  end;
end;

function TioDIResolver.ShowCurrent: TComponent;
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

procedure TioDIResolver.ShowEach;
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

procedure TioDIResolver._DuplicateLocatorForShowEachPurposeFrom(const ASourceLocator: TioDIResolver);
begin
  FAlias := ASourceLocator._GetAlias;
  FConstructorParams := ASourceLocator._GetLocatorConstructorParamsPointer^;
  FVCProvider := ASourceLocator._GetVCProvider;
  FViewContext := ASourceLocator._GetViewContext;
  FActionParentCloseQuery := ASourceLocator._GetParentCloseQueryAction;
end;

function TioDIResolver._InternalGet: TObject;
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
  // NB: Carica l'ImplementersItem se questa non è già stata caricata, questo perchè
  //      da quando c'è il "FactoryMethod" l'ImplementersItem potrebbe essere necessaria
  //      prima del Get/GetAs<T>/Show/GetItem finale (serve proprio nei metodi "FactoryMethod")
  //      mentre prima invece serviva solo alla fine, quindi ho creato questo meccanismo.
  //      Ho provato a crearla anche subito nel costruttore ma poi dava problemi in alcuni casi
  //      (es: con l'Exists se poi non esistava alcuna ImplementersItem sollevava sempre una eccezione
  //      perchè faceva subito il get della item sul container (che appunto non c'era)
  _GetImplementersItemIfNotAlreadyExists;
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
      if FVCProviderEnabled and (not Assigned(FViewContext)) and FImplementersItem.RttiType.MetaclassType.InheritsFrom(TComponent) then
      begin
        if not Assigned(FVCProvider) then
          FVCProvider := TioGlobalVCProviderRegister.GetInstance.DefaultVCProvider;
        if Assigned(FVCProvider) then
          FViewContext := FVCProvider.NewViewContext;
      end;
//      if Assigned(FViewContext) and AContainerItem.RttiType.MetaclassType.InheritsFrom(TComponent) and not FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
      if Assigned(FViewContext) and FImplementersItem.RttiType.MetaclassType.InheritsFrom(TComponent) then
        TValue.Make(@FViewContext, FViewContext.ClassInfo, LValue)
      else
        LValue := TValue.Empty;
      FConstructorParams := [LValue];
    end;
    // If it is a singleton then get the Instance (if exists)...
    if FImplementersItem.IsSingleton and TioSingletonsContainer.TryGet(FSingletonKey, FInterfaceName, FAlias, Result) then
      // Nothing
      // ... else create the object (and add it to the ContainerItem.ObjInstance if
      // it is a new instance of a singleton)
    else
    begin
      // Object creation
      // OLD CODE: Result := TioObjectMaker.CreateObjectByClassRefEx(AContainerItem.ClassRef, FConstructorParams, FConstructorMarker, FConstructorMethod, AContainerItem);
      case FImplementersItem.CreationMode of
        // Instanza creata dall'ObjectForge
        cmByObjectForge:
          Result := TioObjectMaker.CreateObjectByRttiTypeEx(FImplementersItem.RttiType, _GetImplementersItemOrLocatorConstructorParamsPointer^);
        // Istanza creata dal FactoryMethod
        cmByFactoryMethod:
          // Se è stato impostato un FactoryMethod allora l'istanza viene creata alla chiamata del metodo
          //  "FactoryMethod<T1, T2, TX>" quindi prima della chiamata finale ai metodi Get/Show/ShowCurrent/ShowEach;
          //  in questo caso l'istanza viene parcheggiata nel campo privato "FAlreadyCreatedInstance" del locator
          //  e infine utilizzato dal metodo "_InternalGet", se però il FactoryMethod è senza parametri allora
          //  la creazione avviene alla chiamata sempre del metodo "_InternalGet" perchè non dovendo passare
          //  parametro non ci sarà nessuna chiamata al metodo "FactoryMethod" che senza parametri infatti
          //  non esiste perchè sarebbe inutile.
          Result := FImplementersItem.CreateInstanceByFactoryMethodIfNotAlreadyDone(FAlreadyCreatedInstance);
      end;
      // Properties/Fields injection
      FImplementersItem.InjectPropField(Result);
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
      if FImplementersItem.IsSingleton then
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

function TioDIResolver._GetAlias: String;
begin
  Result := FAlias;
end;

function TioDIResolver._GetLocatorConstructorParamsPointer: PioConstructorParams;
begin
  Result := @FConstructorParams;
end;

procedure TioDIResolver._GetImplementersItemIfNotAlreadyExists;
begin
  if not Assigned(FImplementersItem) then
    FImplementersItem := Container.Get(FInterfaceName, FAlias);
end;

function TioDIResolver._GetImplementersItemOrLocatorConstructorParamsPointer: PioConstructorParams;
begin
  // Se sono specificati parametri per il costruttore nel locator restituisce questi perchè
  //  hanno la precedenza, altrimenti restituisce quelli dell'ImplementersItem (RegisterClass)
  if Length(FConstructorParams) > 0 then
    Result := @FConstructorParams
  else
    Result := FImplementersItem.ConstructorParamsPointer;
end;

function TioDIResolver._GetParentCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := FActionParentCloseQuery;
end;

function TioDIResolver._GetVCProvider: TioViewContextProvider;
begin
  Result := FVCProvider;
end;

function TioDIResolver._GetViewContext: TComponent;
begin
  Result := FViewContext;
end;

procedure TioDIResolver._SetForEachModelPresenter(const AModelPresenter: IioBindSource; const ALocateViewModel: Boolean);
begin
  FForEachModelPresenter := AModelPresenter;
  FForEachLocateViewModel := ALocateViewModel;
end;

function TioDIResolver._ShowCurrent: TComponent;
var
  LLocator: TioDIResolver;
begin
  // Check if FForEachModelPresenter is assigned
  if not Assigned(FForEachModelPresenter) then
    raise EioGenericException.Create(Self.ClassName, 'ShowCurrent',
      '"FForEachModelPresenter" private field not assigned...'#13#13'ShowCurrent must be used with "io.ShowCurrent(AModelPrenter)" or "io.di.LocateViewVMFor(AModelPresenter)..." or other equivalent with ModelPresenter as parameter.');
  // Retrieve the correct locator
  if FInterfaceName.StartsWith(DI_SIMPLEVIEW_KEY_PREFIX) then
    LLocator := TioDIFactory.GetSimpleViewResolverFor(FForEachModelPresenter, FActionParentCloseQuery, FAlias) as TioDIResolver
  else
  if FForEachLocateViewModel then
    LLocator := TioDIFactory.GetViewVMResolverFor(FForEachModelPresenter, FActionParentCloseQuery, FAlias, True) as TioDIResolver
  else
    LLocator := TioDIFactory.GetViewResolverFor(FForEachModelPresenter, FAlias) as TioDIResolver;
  // Set the locator
  LLocator._DuplicateLocatorForShowEachPurposeFrom(Self);
  Result := LLocator.Show;
end;

function TioDIResolver.VCProvider(const AVCProvider: TioViewContextProvider): TioDIResolver;
begin
  Result := Self;
  FVCProvider := AVCProvider;
end;

function TioDIResolver.ViewModelExist: Boolean;
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

class function TioDIFactory.GetResolver(const AInterfaceName, AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDIResolver;
var
  LDIContainerKey: String;
begin
  LDIContainerKey := BuildContainerKey(AInterfaceName, ADICObjType);
  Result := TioDIResolver.Create(LDIContainerKey, AAlias, AOwnerRequested, AVCProviderEnabled);
end;

class function TioDIFactory.GetViewResolverFor(const ATargetBS: IioBindSource; const AVAlias: String): TioDIResolver;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBS, True, True);
  // Try to retrieve a locator for MP.Current instance
  Result := io.di.ResolveViewFor(ATargetBS.Current.ClassName, AVAlias);
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

class function TioDIFactory.GetViewVMResolverFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const ACreateViewModel: Boolean): TioDIResolver;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBS, True, True);
  // Try to retrieve a SimpleView locator for MP.Current instance
  if io.di.ResolveSimpleViewFor(ATargetBS.Current, AParentCloseQueryAction, AVVMAlias).Exist then
    Result := GetSimpleViewResolverFor(ATargetBS, AParentCloseQueryAction, AVVMAlias)
  else
  // Try to retrieve a View + ViewModel locator for MP.Current instance
  if io.di.ResolveViewFor(ATargetBS.Current, AVVMAlias).Exist and io.di.ResolveVMfor(ATargetBS.Current, AParentCloseQueryAction, AVVMAlias).Exist then
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

class function TioDIFactory.GetResolverFor<TI>(const AAlias: String; const AOwnerRequested, AVCProviderEnabled: Boolean; const ADICObjType: TioDICObjType): TioDIResolver<TI>;
var
  LDIContainerKey: String;
begin
  LDIContainerKey := BuildContainerKey(TioUtilities.GenericToString<TI>, ADICObjType);
  Result := TioDIResolver<TI>.Create(LDIContainerKey, AAlias, AOwnerRequested, AVCProviderEnabled);
end;

class function TioDIFactory.GetSimpleViewResolverFor(const ATargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String): TioDIResolver;
begin
  // Check for ModelPresenter validity
  TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBS, True, True);
  // Try to retrieve a locator for MP.Current instance
  Result := io.di.ResolveSimpleViewFor(ATargetBS.Current.ClassName, AParentCloseQueryAction, ASVAlias).SetBindSource(ATargetBS);
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

function TioDIResolver<TI>.ConstructorParams(var AParams: TioConstructorParams): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams(AParams);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7;
  AArg8: T8; AArg9: T9): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7, AArg8, AArg9);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7;
  AArg8: T8): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7, AArg8);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6;
  AArg7: T7): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2, T3, T4, T5, T6, T7>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2, T3, T4, T5, T6>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2, T3, T4, T5>(AArg1, AArg2, AArg3, AArg4, AArg5);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2, T3, T4>(AArg1, AArg2, AArg3, AArg4);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2, T3>(AArg1, AArg2, AArg3);
end;

function TioDIResolver<TI>.ConstructorParams<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1, T2>(AArg1, AArg2);
end;

function TioDIResolver<TI>.ConstructorParams<T1>(AArg1: T1): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).ConstructorParams<T1>(AArg1);
end;

function TioDIResolver<TI>.FactoryMethod: TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod;
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8; AArg9: T9): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8, T9>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7, AArg8, AArg9);
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7; AArg8: T8): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2, T3, T4, T5, T6, T7, T8>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7, AArg8);
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2, T3, T4, T5, T6, T7>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6; AArg7: T7): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2, T3, T4, T5, T6, T7>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6, AArg7);
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2, T3, T4, T5, T6>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5; AArg6: T6): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2, T3, T4, T5, T6>(AArg1, AArg2, AArg3, AArg4, AArg5, AArg6);
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2, T3, T4, T5>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4; AArg5: T5): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2, T3, T4, T5>(AArg1, AArg2, AArg3, AArg4, AArg5);
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2, T3, T4>(AArg1: T1; AArg2: T2; AArg3: T3; AArg4: T4): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2, T3, T4>(AArg1, AArg2, AArg3, AArg4);
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2, T3>(AArg1: T1; AArg2: T2; AArg3: T3): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2, T3>(AArg1, AArg2, AArg3);
end;

function TioDIResolver<TI>.FactoryMethod<T1, T2>(AArg1: T1; AArg2: T2): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1, T2>(AArg1, AArg2);
end;

function TioDIResolver<TI>.FactoryMethod<T1>(AArg1: T1): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).FactoryMethod<T1>(AArg1);
end;

function TioDIResolver<TI>.Get: TI;
begin
  try
    Result := TioUtilities.CastObjectToGeneric<TI>(_InternalGet, _ImplementersItem.InterfaceGUID);
  finally
    Free;
  end;
end;

function TioDIResolver<TI>.SingletonKey(const ASingletonKey: String): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SingletonKey(ASingletonKey);
end;

function TioDIResolver<TI>.SetBindSource(const ABSName: String; const ADataObject: TObject): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(ABSName, ADataObject);
end;

function TioDIResolver<TI>.SetBindSource(const ABSName: String; const AMasterPresenter: IioBindSource;
  const AMasterPropertyName: String): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(ABSName, AMasterPresenter, AMasterPropertyName);
end;

function TioDIResolver<TI>.SetBindSource(const ABSName: String; const AWhere: IioWhere): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(ABSName, AWhere);
end;

function TioDIResolver<TI>.VCProvider(const AVCProvider: TioViewContextProvider): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).VCProvider(AVCProvider);
end;

function TioDIResolver<TI>.SetViewContext(const AViewContext: TComponent; const AViewContextFreeMethod: TProc)
  : TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetViewContext(AViewContext, AViewContextFreeMethod);
end;

function TioDIResolver<TI>.SetViewModel(const AViewModel: IioViewModel; const AMarker: String = ''): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetViewModel(AViewModel, AMarker);
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

function TioDIResolver<TI>.SetBindSource(const ADataObject: TObject): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(ADataObject);
end;

function TioDIResolver<TI>.SetBindSource(const AMasterPresenter: IioBindSource; const AMasterPropertyName: String)
  : TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(AMasterPresenter, AMasterPropertyName);
end;

function TioDIResolver<TI>.SetBindSource(const AInterfacedObj: IInterface): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(AInterfacedObj);
end;

function TioDIResolver<TI>.SetBindSource(const ABSName: String; const AInterfacedObj: IInterface): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(ABSName, AInterfacedObj);
end;

function TioDIResolver<TI>.SetBindSourceAsSelectorFor(const ASelectorBSName: String; const ASelectionTargetBS: IioBindSource)
  : TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSourceAsSelectorFor(ASelectorBSName, ASelectionTargetBS);
end;

function TioDIResolver<TI>.SetBindSourceAsETMfor(const AEtmBSName: String;
  const AEtmTargetBS: IioMasterBindSource): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSourceAsETMfor(AEtmBSName, AEtmTargetBS);
end;

function TioDIResolver<TI>.SetBindSourceAsETMfor(const AEtmTargetBS: IioMasterBindSource): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSourceAsETMfor(AEtmTargetBS);
end;

function TioDIResolver<TI>.SetBindSourceAsSelectorFor(const ASelectionTargetBS: IioBindSource): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSourceAsSelectorFor(ASelectionTargetBS);
end;

function TioDIResolver<TI>.SetBindSourceAsWhereBuilderFor(const AWhereBuilderBSName: String;
  const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSourceAsWhereBuilderFor(AWhereBuilderBSName, AWhereBuilderTargetBS);
end;

function TioDIResolver<TI>.SetBindSourceAsWhereBuilderFor(const AWhereBuilderTargetBS: IioMasterBindSource): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSourceAsWhereBuilderFor(AWhereBuilderTargetBS);
end;

function TioDIResolver<TI>.SetParentCloseQueryAction(const AParentCloseQueryAction: IioBSCloseQueryAction): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetParentCloseQueryAction(AParentCloseQueryAction);
end;

function TioDIResolver<TI>.SetBindSource(const AWhere: IioWhere): TioDIResolver<TI>;
begin
  Result := Self;
  TioDIResolver(Self).SetBindSource(AWhere);
end;

initialization

// NB: Spostato sulla initialize della unit iORM
// TioDependencyInjectionContainer.Build;
// TioViewModelShuttle.Build;

finalization

TioDIContainer.CleanUp;

end.
