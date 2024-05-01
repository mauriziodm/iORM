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
unit iORM.MVVM.VMAction;

interface

uses
  System.Classes, System.Generics.Collections, iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.CommonTypes, iORM.LiveBindings.BSPersistence, iORM.StdActions.Interfaces,
  iORM.MVVM.ViewContextProvider, iORM.SynchroStrategy.Interfaces,
  iORM.Abstraction;

type

  // =================================================================================================
  // BEGIN: MVVM BASE VIEW MODEL ACTION
  // =================================================================================================

  TioVMActionCustom = class (TComponent, IioVMAction)
  strict private
    FBindedViewActionsContainer: TList<IioViewAction>;
    FEnabled: Boolean;
    FExecutionMode: TioActionExecutionMode;
    FVisible: Boolean;
    // events
    FAfterExecute: TNotifyEvent;
    FBeforeExecute: TNotifyEvent;
    FCanExecute: TioStdActionCanExecuteEvent;
    FOnUpdate: TNotifyEvent;
    function Get_Version: String;
    procedure _InternalExecute; virtual;
    procedure _InternalUpdate; virtual;
  strict protected
    procedure _InternalExecuteStdAction; virtual;
    procedure _InternalUpdateStdAction; virtual;
    procedure _UpdateOriginal;
    procedure _ExecuteOriginal;
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure UnbindViewAction(const AViewAction: IioViewAction);
    procedure UnbindAllViewActions;
    function GetEnabled: Boolean;
    function GetExecutionMode: TioActionExecutionMode;
    function GetName: TComponentName;
    function GetOwnerComponent: TComponent;
    function GetVisible: Boolean;
    procedure SetEnabled(const Value: Boolean);
    procedure SetExecutionMode(const Value: TioActionExecutionMode);
    procedure SetName(const Value: TComponentName); reintroduce;
    procedure SetVisible(const Value: Boolean);
    // properties
    property Enabled: Boolean read GetEnabled write SetEnabled default True;
    property ExecutionMode: TioActionExecutionMode read GetExecutionMode write SetExecutionMode;
    property Name: TComponentName read GetName write SetName;
    property Owner: TComponent read GetOwnerComponent;
    property Visible: Boolean read GetVisible write SetVisible default True;
    property _Version: String read Get_Version;
    // Events
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property CanExecute: TioStdActionCanExecuteEvent read FCanExecute write FCanExecute;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; virtual;
    function Execute: Boolean; virtual;
    function Update: Boolean; virtual;
  end;

  TioVMAction = class(TioVMActionCustom)
  strict private
    FOnExecute: TNotifyEvent;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    // inherited properties
    property Owner;
  published
    // inherited properties
    property Enabled;
    property Name;
    property Visible;
    property _Version;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // events
    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
  end;

  // =================================================================================================
  // END: MVVM BASE VIEW MODEL ACTION
  // =================================================================================================

  // =================================================================================================
  // BEGIN: MVVM STANDARD VMACTIONS FOR BIND SOURCES
  // =================================================================================================

  // Base class for all BindSource standard actions
  TioVMActionBSCustom<T: IioStdActionTargetBindSource> = class(TioVMActionCustom)
  strict private
    FTargetBindSource: T;
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetTargetBindSource(const Value: T); virtual;
    property TargetBindSource: T read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    function Execute: Boolean; override;
    function Update: Boolean; override;
    // inherited properties
    property Owner;
  published
    // inherited properties
    property Enabled;
    property Name;
    property Visible;
    property _Version;
  end;

  // SelectCurrent action to make a selection for a Selector BindSource
  TioVMActionBSSelectCurrent = class(TioVMActionBSCustom<IioStdActionTargetBindSource>, IioBSSlaveAction)
  strict private
    FAction_CloseQueryAction: IioBSSlaveAction;
    FIsSlave: Boolean;
    FSelectionType: TioSelectionType;
    function _IsEnabled: Boolean;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
    procedure SetTargetBindSource(const Value: IioStdActionTargetBindSource); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property SelectionType: TioSelectionType read FSelectionType write FSelectionType default stAppend;
  end;

  // Paging NextPage action
  TioVMActionBSNextPage = class(TioVMActionBSCustom<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  // Paging PreviousPage action
  TioVMActionBSPrevPage = class(TioVMActionBSCustom<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  // BuildWhere
  TioVMActionBSBuildWhere = class(TioVMActionBSCustom<IioStdActionTargetMasterBindSource>)
  strict private
    FAction_PersistAction: IioBSSlaveAction;
    FAction_CloseQueryAction: IioBSSlaveAction;
    FAutoExec_Where_OnTargetBS: Boolean;
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
    procedure SetAction_PersistAction(const Value: IioBSSlaveAction);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property Action_PersistAction: IioBSSlaveAction read FAction_PersistAction write SetAction_PersistAction;
    property AutoExec_Where_OnTargetBS: Boolean read FAutoExec_Where_OnTargetBS write FAutoExec_Where_OnTargetBS default True;
  end;

  // ClearWhere
  TioVMActionBSClearWhere = class(TioVMActionBSCustom<IioStdActionTargetMasterBindSource>)
  strict private
    FAutoExec_Where_OnTargetBS: Boolean;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property AutoExec_Where_OnTargetBS: Boolean read FAutoExec_Where_OnTargetBS write FAutoExec_Where_OnTargetBS default False;
  end;

  // =================================================================================================
  // END: MVVM STANDARD VMACTIONS FOR BIND SOURCES
  // =================================================================================================

  // =================================================================================================
  // BEGIN: MVVM STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // Base class for all BinsDourceObjState standard actions
  TioVMActionBSPersistenceCustom = class(TioVMActionCustom, IioBSSlaveAction)
  strict private
    FAction_CloseQueryAction: IioBSSlaveAction;
    FAction_ReloadAction: IioBSSlaveAction;
    FAction_ShowOrSelectAction: IioBSSlaveAction;
    FDisableIfChangesDoesNotExists: Boolean;
    FDisableIfChangesExists: Boolean;
    FDisableIfSaved: Boolean;
    FIsSlave: Boolean;
    FRaiseIfChangesDoesNotExists: Boolean;
    FRaiseIfChangesExists: Boolean;
    FRaiseIfRevertPointSaved: Boolean;
    FRaiseIfRevertPointNotSaved: Boolean;
    FTargetBindSource: IioMasterBindSource;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetTargetBindSource(const Value: IioMasterBindSource);
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
    procedure SetAction_ShowOrSelectAction(const Value: IioBSSlaveAction);
  protected
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property Action_ReloadAction: IioBSSlaveAction read FAction_ReloadAction write FAction_ReloadAction;
    property Action_ShowOrSelectAction: IioBSSlaveAction read FAction_ShowOrSelectAction write SetAction_ShowOrSelectAction;
    function _IsEnabled: Boolean; virtual;
    procedure _InternalUpdateStdAction; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    // properties
    property DisableIfChangesDoesNotExists: Boolean read FDisableIfChangesDoesNotExists write FDisableIfChangesDoesNotExists default False;
    property DisableIfChangesExists: Boolean read FDisableIfChangesExists write FDisableIfChangesExists default False;
    property DisableIfSaved: Boolean read FDisableIfSaved write FDisableIfSaved default False;
    property RaiseIfChangesDoesNotExists: Boolean read FRaiseIfChangesDoesNotExists write FRaiseIfChangesDoesNotExists default False;
    property RaiseIfChangesExists: Boolean read FRaiseIfChangesExists write FRaiseIfChangesExists default True;
    property RaiseIfRevertPointSaved: Boolean read FRaiseIfRevertPointSaved write FRaiseIfRevertPointSaved default False;
    property RaiseIfRevertPointNotSaved: Boolean read FRaiseIfRevertPointNotSaved write FRaiseIfRevertPointNotSaved default False;
    property TargetBindSource: IioMasterBindSource read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    function Update: Boolean; override;
    function Execute: Boolean; override;
    // inherited properties
    property Owner;
  published
    // inherited properties
    property Enabled;
    property Name;
    property Visible;
    property _Version;
  end;

  TioVMActionBSPersistenceSaveRevertPoint = class(TioVMActionBSPersistenceCustom)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  TioVMActionBSPersistenceClear = class(TioVMActionBSPersistenceCustom)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    // inherited properties
    property DisableIfChangesExists;
    property RaiseIfChangesExists;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  TioVMActionBSPersistencePersist = class(TioVMActionBSPersistenceCustom)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    // inherited properties
    property Action_CloseQueryAction;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  TioVMActionBSPersistenceRevert = class(TioVMActionBSPersistenceCustom)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    // inherited properties
    property Action_CloseQueryAction;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property RaiseIfRevertPointNotSaved;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  TioVMActionBSPersistenceRevertOrDelete = class(TioVMActionBSPersistenceCustom)
  private
    FAutoExec_CloseQueryAction_AfterDelete: Boolean;
    FAutoExec_CloseQueryAction_AfterRevert: Boolean;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property Action_CloseQueryAction;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property RaiseIfRevertPointNotSaved;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property AutoExec_CloseQueryAction_AfterDelete: Boolean read FAutoExec_CloseQueryAction_AfterDelete write FAutoExec_CloseQueryAction_AfterDelete default True;
    property AutoExec_CloseQueryAction_AfterRevert: Boolean read FAutoExec_CloseQueryAction_AfterRevert write FAutoExec_CloseQueryAction_AfterRevert default False;
  end;

  TioVMActionBSPersistenceDelete = class(TioVMActionBSPersistenceCustom)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property Action_CloseQueryAction;
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  TioVMActionBSPersistenceReload = class(TioVMActionBSPersistenceCustom)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  TioVMActionBSPersistenceAppend = class(TioVMActionBSPersistenceCustom)
  private
    FEntityTypeAlias: String;
    FEntityTypeName: String;
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property Action_ShowOrSelectAction;
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property EntityTypeAlias: String read FEntityTypeAlias write FEntityTypeAlias;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
  end;

  TioVMActionBSPersistenceInsert = class(TioVMActionBSPersistenceCustom)
  private
    FEntityTypeAlias: String;
    FEntityTypeName: String;
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property Action_ShowOrSelectAction;
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property EntityTypeAlias: String read FEntityTypeAlias write FEntityTypeAlias;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
  end;

  TioVMActionBS_ETM_RevertToObject = class(TioVMActionBSPersistenceCustom)
  strict private
    FAutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_Persist_AfterRevert: Boolean;
    FOwnRevertedObj: Boolean;
    FRevertedObj: TObject;
    // Events
    FAfterRevertEvent: TioStdAction_ETM_AfterRevertEvent;
    FBeforeRevertEvent: TioStdAction_ETM_BeforeRevertEvent;
    procedure _ShowRevertedObj;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property Action_CloseQueryAction;
    property Action_ShowOrSelectAction;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property AutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnETMfor_AfterRevert write FAutoExec_OnETMfor_AfterRevert default doNothing;
    property AutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnTargetBS_AfterRevert write FAutoExec_OnTargetBS_AfterRevert default doNothing;
    property AutoExec_Persist_AfterRevert: Boolean read FAutoExec_Persist_AfterRevert write FAutoExec_Persist_AfterRevert default False;
    property OwnRevertedObj: Boolean read FOwnRevertedObj write FOwnRevertedObj default True;
    // events
    property AfterRevert: TioStdAction_ETM_AfterRevertEvent read FAfterRevertEvent write FAfterRevertEvent;
    property BeforeRevert: TioStdAction_ETM_BeforeRevertEvent read FBeforeRevertEvent write FBeforeRevertEvent;
  end;

  TioVMActionBS_ETM_RevertToBindSource = class(TioVMActionBSPersistenceCustom)
  strict private
    FAutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_Persist_AfterRevert: Boolean;
    FRevertedObj: TObject;
    // Events
    FAfterRevertEvent: TioStdAction_ETM_AfterRevertEvent;
    procedure _ShowRevertedObj;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property Action_CloseQueryAction;
    property Action_ShowOrSelectAction;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
    // properties
    property AutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnETMfor_AfterRevert write FAutoExec_OnETMfor_AfterRevert default doNothing;
    property AutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnTargetBS_AfterRevert write FAutoExec_OnTargetBS_AfterRevert default doNothing;
    property AutoExec_Persist_AfterRevert: Boolean read FAutoExec_Persist_AfterRevert write FAutoExec_Persist_AfterRevert default False;
    // events
    property AfterRevert: TioStdAction_ETM_AfterRevertEvent read FAfterRevertEvent write FAfterRevertEvent;
  end;

  TioVMActionBSCloseQuery = class(TioVMActionBSPersistenceCustom, IioBSCloseQueryAction, IioBSCloseQueryVMAction)
  strict private
    [weak]
    FAction_ParentCloseQueryAction: IioBSCloseQueryAction;
    FExecuting, FExecutingEventHandler: Boolean;
    FInjectVMEventHandler: Boolean;
    FInjectViewEventHandler: Boolean;
    FOnCloseQuery: TCloseQueryEvent;
    FOnEditingAction: TioBSCloseQueryOnEditingAction;
    FOnExecuteAction: TioBSCloseQueryOnExecuteAction;
    FOnUpdateScope: TioBSCloseQueryActionUpdateScope;
    procedure _InjectEventHandlerOnViewModel(const AViewModelAsTComponent: TComponent); // TComponent to avoid circular reference
    procedure _InjectEventHandlerOnView(const AView: TComponent);
    function _CanClose: Boolean;
    function _IsChildOf(const ATargetQueryAction: IioBSCloseQueryAction): Boolean;
    // ParentCloseQueryAction
    function GetAction_ParentCloseQueryAction: IioBSCloseQueryAction;
    procedure SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
  strict protected
    function _IsEnabled: Boolean; override;
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; override;
    function Executing: Boolean;
    function Update: Boolean; override;
    property Action_ParentCloseQueryAction: IioBSCloseQueryAction read GetAction_ParentCloseQueryAction write SetAction_ParentCloseQueryAction;
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    //property OnUpdate; // Lasciarla non visibile, può fare casino in questa particolare action
    // properties
    property InjectViewEventHandler: Boolean read FInjectViewEventHandler write FInjectViewEventHandler default True;
    property InjectVMEventHandler: Boolean read FInjectVMEventHandler write FInjectVMEventHandler default True;
    property OnEditingAction: TioBSCloseQueryOnEditingAction read FOnEditingAction write FOnEditingAction default eaDisable;
    property OnExecuteAction: TioBSCloseQueryOnExecuteAction read FOnExecuteAction write FOnExecuteAction default eaClose;
    property OnUpdateScope: TioBSCloseQueryActionUpdateScope read FOnUpdateScope write FOnUpdateScope default usLocal;
    // events
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
  end;

  // =================================================================================================
  // END: MVVM STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // =================================================================================================
  // BEGIN: MVVM STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

  // ShowCurrent action to show the current object of the BS
  TioVMActionBSShowOrSelect = class(TioVMActionCustom, IioBSSlaveAction)
  strict private
    FAction_ParentCloseQueryAction: IioBSCloseQueryAction;
    FAction_SelectCurrentAction: IioBSSlaveAction;
    FEntityTypeName: String;
    FIsSlave: Boolean;
    FShowMode: TioActionShowMode;
    FTargetBindSource: IioStdActionTargetBindSource;
    FVVMTypeAlias: String;
    FViewContext: TComponent;
    FViewContextBy: TioActionViewContextBy;
    FViewContextProvider: TioViewContextProvider;
    FViewContextProviderName: String;
//    function Get_Version: String;
    function _IsEnabled: Boolean;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
    procedure SetAction_SelectCurrentAction(const Value: IioBSSlaveAction);
    procedure SetTargetBindSource(const Value: IioStdActionTargetBindSource);
    procedure SetViewContext(const Value: TComponent);
    procedure SetViewContextProvider(const Value: TioViewContextProvider);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  published
    // inherited properties
    property Enabled;
    property Name;
    property Visible;
    property _Version;
    // inherited events
    // properties
    property Action_ParentCloseQueryAction: IioBSCloseQueryAction read FAction_ParentCloseQueryAction write SetAction_ParentCloseQueryAction;
    property Action_SelectCurrentAction: IioBSSlaveAction read FAction_SelectCurrentAction write SetAction_SelectCurrentAction;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    property ShowMode: TioActionShowMode read FShowMode write FShowMode;
    property TargetBindSource: IioStdActionTargetBindSource read FTargetBindSource write SetTargetBindSource;
    property VVMTypeAlias: String read FVVMTypeAlias write FVVMTypeAlias;
    property ViewContext: TComponent read FViewContext write SetViewContext;
    property ViewContextBy: TioActionViewContextBy read FViewContextBy write FViewContextBy;
    property ViewContextProvider: TioViewContextProvider read FViewContextProvider write SetViewContextProvider;
    property ViewContextProviderName: String read FViewContextProviderName write FViewContextProviderName;
    // events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  // =================================================================================================
  // END: MVVM STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

  // =================================================================================================
  // BEGIN: MVVM STANDARD ACTIONS FOR SYNCHRONIZATION PURPOSES
  // =================================================================================================

  // DoSynchronization action
  TioVMDoSynchronization = class(TioVMActionCustom)
  strict private
    // fields
    FAutoexec_Enabled: Boolean;
    FAutoexec_Interval: Integer;
    FAutoexec_StartDelay: Integer;
    FAutoexec_Timer: TioTimer;
    FSynchroLevel: TioSynchroLevel;
    FTargetSynchroStrategy: IioSynchroStrategy_Client;
    // methods
    procedure Autoexec_OnTimerEventHandler(Sender: TObject);
    procedure SetAutoexec_Enabled(const Value: Boolean);
    procedure SetAutoexec_Interval(const ASeconds: Integer);
    procedure SetAutoexec_StartDelay(const ASeconds: Integer);
    procedure SetTargetSynchroStrategy(const Value: IioSynchroStrategy_Client);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    function Execute: Boolean; override;
    function Update: Boolean; override;
    // inherited properties
    property Owner;
  published
    // inherited properties
    property Enabled;
    property Name;
    property Visible;
    property _Version;
    // properties
    property Autoexec_Enabled: Boolean read FAutoexec_Enabled write SetAutoexec_Enabled default False;
    property Autoexec_Interval: Integer read FAutoexec_Interval write SetAutoexec_Interval default 60;
    property Autoexec_StartDelay: Integer read FAutoexec_StartDelay write SetAutoexec_StartDelay default 3;
    property SynchroLevel: TioSynchroLevel read FSynchroLevel write FSynchroLevel default slIncremental;
    property TargetSynchroStrategy: IioSynchroStrategy_Client read FTargetSynchroStrategy write SetTargetSynchroStrategy;
    // Events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnUpdate;
  end;

  // =================================================================================================
  // END: MVVM STANDARD ACTIONS FOR SYNCHRONIZATION PURPOSES
  // =================================================================================================

implementation

uses
  System.SysUtils, iORM.Utilities, iORM.Exceptions, iORM, System.Rtti,
  iORM.RttiContext.Factory, iORM.StdActions.CloseQueryActionRegister, iORM.ETM.Engine, iORM.StdActions.CommonBehaviour;

{ TioVMActionCustom }

constructor TioVMActionCustom.Create(AOwner: TComponent);
begin
  inherited;
  FExecutionMode := emActive;
  FEnabled := True;
  FVisible := True;
  FBindedViewActionsContainer := TList<IioViewAction>.Create;
  // Solleva una eccezione se non siamo su un ViewModel
  if not Supports(Owner, IioViewModel) then
    raise EioGenericException.Create(ClassName, 'Create', Format('Component "%s" can only be used on class "TioViewModel" or its descendants.', [ClassName]));
end;

destructor TioVMActionCustom.Destroy;
begin
  UnbindAllViewActions;
  FBindedViewActionsContainer.Free;
  inherited;
end;

function TioVMActionCustom.Execute: Boolean;
begin
  _ExecuteOriginal;
  Result := False;
end;

function TioVMActionCustom.Update: Boolean;
begin
  _UpdateOriginal;
  Result := False;
end;

function TioVMActionCustom.GetEnabled: Boolean;
begin
  Result := FEnabled;
end;

function TioVMActionCustom.GetExecutionMode: TioActionExecutionMode;
begin
  Result := FExecutionMode;
end;

function TioVMActionCustom.GetName: TComponentName;
begin
  Result := inherited Name;
end;

function TioVMActionCustom.GetOwnerComponent: TComponent;
begin
  Result := inherited Owner;
end;

function TioVMActionCustom.GetVisible: Boolean;
begin
  Result := FVisible;
end;

function TioVMActionCustom.Get_Version: String;
begin
  Result := io.Version;
end;

function TioVMActionCustom.HandlesTarget(Target: TObject): Boolean;
begin
  Result := False;
end;

procedure TioVMActionCustom._ExecuteOriginal;
var
  LCanExecute: Boolean;
  LViewAction: IioViewAction;
begin
  // Execute the CanExecute event (ActiveMode only)
  LCanExecute := True;
  if (FExecutionMode = emActive) and Assigned(FCanExecute) then
    FCanExecute(Self, LCanExecute);
  if not LCanExecute then
    Exit;
  // Execute the ViewAction.BeforeExecute event
  for LViewAction in FBindedViewActionsContainer do
    LViewAction.DoBeforeExecute;
  // Execute the BeforeExecute event
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
  // Execute the VMAction.onExecute event if assigned (or a standard action)
  _InternalExecute;
  // Execute the AfterExecute event
  if Assigned(FAfterExecute) then
    FAfterExecute(Self);
  // Execute the ViewAction.onAfterExecute event
  // NB: If we are on an uniGUI application then doesn't use the timers but runs the code right away
  if TioApplication.ProjectPlatform <> ppUniGUI then
    for LViewAction in FBindedViewActionsContainer do
      LViewAction.DoAfterExecute;
end;

procedure TioVMActionCustom._InternalExecute;
begin
  // NB: Mauri 23/09/2023: Ho eliminato l'evento "OnExecute" da tutte le StdActions quindi in pratica
  //      questo codice non serve più (per ora lo lascio commentato)
  // Execute the VMAction.onExecute event if assigned
//  if Assigned(FOnExecute) then
//    FOnExecute(Self)
//  else
    _InternalExecuteStdAction;
end;

procedure TioVMActionCustom._InternalExecuteStdAction;
begin
  // Nothing to do here
end;

procedure TioVMActionCustom._InternalUpdate;
begin
  // Execute the VMAction.onExecute event if assigned
  if Assigned(FOnUpdate) then
    FOnUpdate(Self)
  else
    _InternalUpdateStdAction;
end;

procedure TioVMActionCustom._InternalUpdateStdAction;
begin
  // Nothing to do here
end;

procedure TioVMActionCustom._UpdateOriginal;
var
  LViewAction: IioViewAction;
begin
  // Execute the ViewAction.onBeforeUpdate event
  for LViewAction in FBindedViewActionsContainer do
    LViewAction.DoBeforeUpdate;
  // Execute the VMAction.onUpdate event if assigned (or a standard action)
  _InternalUpdate;
  // Execute the ViewAction.onAfterUpdatee event ia assigned or standard action
  for LViewAction in FBindedViewActionsContainer do
    LViewAction.DoAfterUpdate;
end;

procedure TioVMActionCustom.BindViewAction(const AViewAction: IioViewAction);
begin
  FBindedViewActionsContainer.Add(AViewAction);
  AViewAction.VMAction := Self;
  // Propagate Enabled/Visible to the new registered ViewAction if linked
  if AViewAction.EnabledLinkedToVMAction then
    AViewAction.Enabled := FEnabled;
  if AViewAction.VisibleLinkedToVMAction then
    AViewAction.Visible := FVisible;
end;

procedure TioVMActionCustom.UnbindViewAction(const AViewAction: IioViewAction);
begin
  FBindedViewActionsContainer.Remove(AViewAction);
  AViewAction.VMAction := nil;
end;

procedure TioVMActionCustom.UnbindAllViewActions;
var
  I: Integer;
begin
  for I := FBindedViewActionsContainer.Count-1 downto 0 do
    UnbindViewAction(FBindedViewActionsContainer[I]);
end;

procedure TioVMActionCustom.SetEnabled(const Value: Boolean);
var
  LViewAction: IioViewAction;
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    for LViewAction in FBindedViewActionsContainer do
      if LViewAction.EnabledLinkedToVMAction then
        LViewAction.Enabled := Value;
  end;
end;

procedure TioVMActionCustom.SetExecutionMode(const Value: TioActionExecutionMode);
begin
  FExecutionMode := Value;
end;

procedure TioVMActionCustom.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
end;

procedure TioVMActionCustom.SetVisible(const Value: Boolean);
var
  LViewAction: IioViewAction;
begin
  if Value <> FVisible then
  begin
    FVisible := Value;
    for LViewAction in FBindedViewActionsContainer do
      if LViewAction.VisibleLinkedToVMAction then
        LViewAction.Visible := Value;
  end;
end;

{ TioBSStdVMAction<T> }

constructor TioVMActionBSCustom<T>.Create(AOwner: TComponent);
begin
  inherited;
  FTargetBindSource := nil;
end;

function TioVMActionBSCustom<T>.Execute: Boolean;
begin
  Result := False;
  if Assigned(FTargetBindSource) then
    inherited;
end;

function TioVMActionBSCustom<T>.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, TioUtilities.TypeInfoToGUID(TypeInfo(T))) and FTargetBindSource.isActive;
end;

procedure TioVMActionBSCustom<T>.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    FTargetBindSource := nil;
end;

procedure TioVMActionBSCustom<T>.SetTargetBindSource(const Value: T);
begin
  if @Value <> @FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

function TioVMActionBSCustom<T>.Update: Boolean;
begin
  Result := False;
  if Assigned(FTargetBindSource) then
    inherited
  else
    Enabled := False;
end;

{ TioBSSelectCurrentVMAction }

constructor TioVMActionBSSelectCurrent.Create(AOwner: TComponent);
begin
  inherited;
  FIsSlave := False;
  FAction_CloseQueryAction := nil;
  FSelectionType := stAppend;
end;

procedure TioVMActionBSSelectCurrent.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FAction_CloseQueryAction as TComponent)) then
    FAction_CloseQueryAction := nil;
end;

procedure TioVMActionBSSelectCurrent.SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_CloseQueryAction then
  begin
    FAction_CloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioVMActionBSSelectCurrent.SetTargetBindSource(const Value: IioStdActionTargetBindSource);
begin
  if not(csLoading in ComponentState) and FIsSlave then
    raise EioGenericException.Create(ClassName, 'SetTargetBindSource', 'The "TargetBindSource" property of a "..SelectCurrent" action is read-only when the action itself is nested into a "ShowOrSelect" action')
  else
    inherited;
end;

procedure TioVMActionBSSelectCurrent._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.SelectCurrent(FSelectionType);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_CloseQueryAction);
end;

procedure TioVMActionBSSelectCurrent._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.CanDoSelection and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
end;

function TioVMActionBSSelectCurrent._IsEnabled: Boolean;
begin
  Result := Enabled;
end;

procedure TioVMActionBSSelectCurrent._SetTargetBindSource(const AObj: TObject);
var
  LTargetBindSource: IioStdActionTargetBindSource;
begin
  if Assigned(AObj) and not Supports(AObj, IioStdActionTargetBindSource, LTargetBindSource) then
    raise EioGenericException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

{ TioBSNextPage }

procedure TioVMActionBSNextPage._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.Paging.NextPage;
end;

procedure TioVMActionBSNextPage._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.IsActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsLastPage;
end;

{ TioBSPrevPage }

procedure TioVMActionBSPrevPage._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.Paging.PrevPage;
end;

procedure TioVMActionBSPrevPage._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.IsActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsFirstPage;
end;

{ TioVMActionBSPersistenceCustom }

constructor TioVMActionBSPersistenceCustom.Create(AOwner: TComponent);
begin
  inherited;
  FAction_CloseQueryAction := nil;
  FDisableIfChangesDoesNotExists := False;
  FDisableIfChangesExists := False;
  FDisableIfSaved := False;
  FIsSlave := False;
  FRaiseIfChangesDoesNotExists := False;
  FRaiseIfChangesExists := True;
  FRaiseIfRevertPointSaved := False;
  FRaiseIfRevertPointNotSaved := False;
  FAction_ReloadAction := nil;
  FAction_ShowOrSelectAction := nil;
end;

function TioVMActionBSPersistenceCustom.Execute: Boolean;
begin
  Result := False;
  if Assigned(FTargetBindSource) then
    inherited;
end;

function TioVMActionBSPersistenceCustom.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, IioMasterBindSource) and FTargetBindSource.isActive;
end;

procedure TioVMActionBSPersistenceCustom.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil
  else
  if (Operation = opRemove) and (AComponent = (FAction_CloseQueryAction as TComponent)) then
    FAction_CloseQueryAction := nil
  else
  if (Operation = opRemove) and (AComponent = (FAction_ShowOrSelectAction as TComponent)) then
    FAction_ShowOrSelectAction := nil;
end;

procedure TioVMActionBSPersistenceCustom.SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_CloseQueryAction then
  begin
    FAction_CloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
    if Assigned(FAction_CloseQueryAction) then
      FAction_CloseQueryAction._SetTargetBindSource(FTargetBindSource as TObject);
  end;
end;

procedure TioVMActionBSPersistenceCustom.SetAction_ShowOrSelectAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_ShowOrSelectAction then
  begin
    FAction_ShowOrSelectAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
    if Assigned(FAction_ShowOrSelectAction) then
      FAction_ShowOrSelectAction._SetTargetBindSource(FTargetBindSource as TObject);
  end;
end;

procedure TioVMActionBSPersistenceCustom.SetTargetBindSource(const Value: IioMasterBindSource);
begin
  if not(csLoading in ComponentState) and FIsSlave then
    raise EioGenericException.Create(ClassName, 'SetTargetBindSource', 'The "TargetBindSource" property of a "..SelectCurrent" action is read-only when the action itself is nested into a "ShowOrSelect" action');
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
    if Assigned(FAction_CloseQueryAction) then
      FAction_CloseQueryAction._SetTargetBindSource(Value as TObject);
    if Assigned(FAction_ShowOrSelectAction) then
      FAction_ShowOrSelectAction._SetTargetBindSource(Value as TObject);
  end;
end;

function TioVMActionBSPersistenceCustom.Update: Boolean;
begin
  Result := False;
  if Assigned(FTargetBindSource) then
    inherited
  else
    Enabled := False;
end;

procedure TioVMActionBSPersistenceCustom._InternalUpdateStdAction;
begin
  inherited;
  Enabled := True;
  Enabled := Enabled and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
  Enabled := Enabled and ((not Assigned(FAction_ShowOrSelectAction)) or FAction_ShowOrSelectAction._IsEnabled);
end;

function TioVMActionBSPersistenceCustom._IsEnabled: Boolean;
begin
  Result := Enabled;
end;

procedure TioVMActionBSPersistenceCustom._SetTargetBindSource(const AObj: TObject);
var
  LTargetBindSource: IioMasterBindSource;
begin
  if Assigned(AObj) and not Supports(AObj, IioMasterBindSource, LTargetBindSource) then
    raise EioGenericException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

{ TioVMActionBSPersistenceSaveRevertPoint }

procedure TioVMActionBSPersistenceSaveRevertPoint._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.SaveRevertPoint(True);
end;

procedure TioVMActionBSPersistenceSaveRevertPoint._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanSaveRevertPoint;
end;

{ TioVMActionBSPersistenceClear }

procedure TioVMActionBSPersistenceClear._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Clear(RaiseIfChangesExists);
end;

procedure TioVMActionBSPersistenceClear._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanClear;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
end;

{ TioBSPersistencePersist }

procedure TioVMActionBSPersistencePersist._InternalExecuteStdAction;
begin
  TargetBindSource.Refresh(True); // Otherwise, in some cases, an outdated value persisted
  TargetBindSource.Persistence.Persist(RaiseIfChangesDoesNotExists);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioVMActionBSPersistencePersist._InternalUpdateStdAction;
begin
  Enabled := True;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanPersist;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioVMActionBSPersistenceRevert }

procedure TioVMActionBSPersistenceRevert._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Revert(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioVMActionBSPersistenceRevert._InternalUpdateStdAction;
begin
  Enabled := True;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevert;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioVMActionBSPersistenceRevertOrDelete }

constructor TioVMActionBSPersistenceRevertOrDelete.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_CloseQueryAction_AfterDelete := True;
  FAutoExec_CloseQueryAction_AfterRevert := False;
end;

procedure TioVMActionBSPersistenceRevertOrDelete._InternalExecuteStdAction;
var
  LIsDeleting: Boolean;
begin
  LIsDeleting := TargetBindSource.Persistence.IsInserting;
  TargetBindSource.Persistence.RevertOrDelete(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists);
  // Execute slave actions
  if (LIsDeleting and FAutoExec_CloseQueryAction_AfterDelete) or (not LIsDeleting and FAutoExec_CloseQueryAction_AfterRevert) then
    TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioVMActionBSPersistenceRevertOrDelete._InternalUpdateStdAction;
begin
  Enabled := True;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevertOrDelete;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged or TargetBindSource.Persistence.IsInserting);
end;

{ TioVMActionBSPersistenceDelete }

constructor TioVMActionBSPersistenceDelete.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioVMActionBSPersistenceDelete._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Delete(RaiseIfRevertPointSaved, RaiseIfChangesExists);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioVMActionBSPersistenceDelete._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanDelete;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioVMActionBSPersistenceReload }

constructor TioVMActionBSPersistenceReload.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioVMActionBSPersistenceReload._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Reload(RaiseIfRevertPointSaved, RaiseIfChangesExists);
end;

procedure TioVMActionBSPersistenceReload._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanReload;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioVMActionBSPersistenceAppend }

constructor TioVMActionBSPersistenceAppend.Create(AOwner: TComponent);
begin
  inherited;
  FEntityTypeAlias := '';
  FEntityTypeName := '';
  RaiseIfChangesExists := False;
end;

procedure TioVMActionBSPersistenceAppend._InternalExecuteStdAction;
var
  LNewInstanceAsObject: TObject;
  LNewInstanceAsInterface: IInterface;
begin
  inherited;
  try
    // New instance as object (OnNewInstanceAsObject event handler)
    if Assigned(FOnNewInstanceAsObject) then
    begin
      FOnNewInstanceAsObject(Self, LNewInstanceAsObject);
      if LNewInstanceAsObject <> nil then
      begin
        TargetBindSource.Persistence.Append(LNewInstanceAsObject, RaiseIfRevertPointSaved, RaiseIfChangesExists);
        Exit;
      end
      else
        raise EioGenericException.Create(Self.ClassName, '_InternalExecuteStdAction', 'Invalid new instance (nil)');
    end;
    // New instance as Interface (OnNewInstanceAsInterface event handler)
    if Assigned(FOnNewInstanceAsInterface) then
    begin
      FOnNewInstanceAsInterface(Self, LNewInstanceAsInterface);
      if LNewInstanceAsInterface <> nil then
      begin
        TargetBindSource.Persistence.Append(LNewInstanceAsInterface, RaiseIfRevertPointSaved, RaiseIfChangesExists);
        Exit;
      end
      else
        raise EioGenericException.Create(Self.ClassName, '_InternalExecuteStdAction', 'Invalid new instance (nil)');
    end;
    // New instance ny EntityType/Alias
    if not FEntityTypeName.IsEmpty and io.di.Locate(FEntityTypeName, FEntityTypeAlias).Exist then
    begin
      LNewInstanceAsObject := io.Create(FEntityTypeName, FEntityTypeAlias);
      if Assigned(LNewInstanceAsObject) then
      begin
        // ...as interface
        if TioUtilities.IsAnInterfaceTypeName(FEntityTypeName) then
        begin
          if Supports(LNewInstanceAsObject, IInterface, LNewInstanceAsInterface) then
          begin
            TargetBindSource.Persistence.Append(LNewInstanceAsInterface, RaiseIfRevertPointSaved, RaiseIfChangesExists);
            Exit;
          end;
        end
        else
        // as object
        begin
          TargetBindSource.Persistence.Append(LNewInstanceAsObject, RaiseIfRevertPointSaved, RaiseIfChangesExists);
          Exit;
        end;
      end
      else
        raise EioGenericException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
    end;
    // New instance not provided (created by the ABSAdapter itself)
    TargetBindSource.Persistence.Append(RaiseIfRevertPointSaved, RaiseIfChangesExists);
  finally
    // Execute slave actions
    if Assigned(Action_ShowOrSelectAction) then
    begin
      TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_ShowOrSelectAction);
      TargetBindSource.Persistence.Clear;
    end;
  end;
end;

procedure TioVMActionBSPersistenceAppend._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioVMActionBSPersistenceInsert }

constructor TioVMActionBSPersistenceInsert.Create(AOwner: TComponent);
begin
  inherited;
  FEntityTypeAlias := '';
  FEntityTypeName := '';
  RaiseIfChangesExists := False;
end;

procedure TioVMActionBSPersistenceInsert._InternalExecuteStdAction;
var
  LNewInstanceAsObject: TObject;
  LNewInstanceAsInterface: IInterface;
begin
  inherited;
  try
    // New instance as object (OnNewInstanceAsObject event handler)
    if Assigned(FOnNewInstanceAsObject) then
    begin
      FOnNewInstanceAsObject(Self, LNewInstanceAsObject);
      if LNewInstanceAsObject <> nil then
      begin
        TargetBindSource.Persistence.Insert(LNewInstanceAsObject, RaiseIfRevertPointSaved, RaiseIfChangesExists);
        Exit;
      end
      else
        raise EioGenericException.Create(Self.ClassName, '_InternalExecuteStdAction', 'Invalid new instance (nil)');
    end;
    // New instance as Interface (OnNewInstanceAsInterface event handler)
    if Assigned(FOnNewInstanceAsInterface) then
    begin
      FOnNewInstanceAsInterface(Self, LNewInstanceAsInterface);
      if LNewInstanceAsInterface <> nil then
      begin
        TargetBindSource.Persistence.Insert(LNewInstanceAsInterface, RaiseIfRevertPointSaved, RaiseIfChangesExists);
        Exit;
      end
      else
        raise EioGenericException.Create(Self.ClassName, '_InternalExecuteStdAction', 'Invalid new instance (nil)');
    end;
    // New instance ny EntityType/Alias
    if not FEntityTypeName.IsEmpty and io.di.Locate(FEntityTypeName, FEntityTypeAlias).Exist then
    begin
      LNewInstanceAsObject := io.Create(FEntityTypeName, FEntityTypeAlias);
      if Assigned(LNewInstanceAsObject) then
      begin
        // ...as interface
        if TioUtilities.IsAnInterfaceTypeName(FEntityTypeName) then
        begin
          if Supports(LNewInstanceAsObject, IInterface, LNewInstanceAsInterface) then
          begin
            TargetBindSource.Persistence.Insert(LNewInstanceAsInterface, RaiseIfRevertPointSaved, RaiseIfChangesExists);
            Exit;
          end;
        end
        else
        // as object
        begin
          TargetBindSource.Persistence.Insert(LNewInstanceAsObject, RaiseIfRevertPointSaved, RaiseIfChangesExists);
          Exit;
        end;
      end
      else
        raise EioGenericException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
    end;
    // New instance not provided (created by the ABSAdapter itself)
    TargetBindSource.Persistence.Insert(RaiseIfRevertPointSaved, RaiseIfChangesExists);
  finally
    // Execute slave actions
    if Assigned(Action_ShowOrSelectAction) then
    begin
      TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_ShowOrSelectAction);
      TargetBindSource.Persistence.Clear;
    end;
  end;
end;

procedure TioVMActionBSPersistenceInsert._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioVMActionBSCloseQuery }

constructor TioVMActionBSCloseQuery.Create(AOwner: TComponent);
begin
  inherited;
  FExecuting := False;
  FExecutingEventHandler := False;
  FInjectViewEventHandler := True;
  FInjectVMEventHandler := True;
  FOnEditingAction := eaDisable;
  FOnExecuteAction := eaClose;
  FOnUpdateScope := usLocal;
  TioBSCloseQueryActionRegister.RegisterAction(Self as IioBSCloseQueryAction);
end;

destructor TioVMActionBSCloseQuery.Destroy;
begin
  TioBSCloseQueryActionRegister.UnregisterAction(Self as IioBSCloseQueryAction);
  inherited;
end;

procedure TioVMActionBSCloseQuery.SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
begin
  FAction_ParentCloseQueryAction := Value;
end;

function TioVMActionBSCloseQuery.Execute: Boolean;
begin
  _ExecuteOriginal;  // Ritorna all'implementazione originale (cioè esegue la action anche se il TargetBindSource non è assegnato)
  Result := False;
end;

function TioVMActionBSCloseQuery.Executing: Boolean;
begin
  Result := FExecuting;
end;

function TioVMActionBSCloseQuery.GetAction_ParentCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := FAction_ParentCloseQueryAction;
end;

function TioVMActionBSCloseQuery._IsChildOf(const ATargetQueryAction: IioBSCloseQueryAction): Boolean;
begin
  Result := TioBSCloseQueryCommonBehaviour.IsChildOf(Self, ATargetQueryAction);
end;

function TioVMActionBSCloseQuery._IsEnabled: Boolean;
begin
  // Do not inherit
  Result := _CanClose;
end;

function TioVMActionBSCloseQuery.Update: Boolean;
begin
  _UpdateOriginal;  // Ritorna all'implementazione originale
  Result := False;
end;

procedure TioVMActionBSCloseQuery._InjectEventHandlerOnView(const AView: TComponent);
var
  LEventHandlerToInject: TMethod;
begin
  // On runtime only and only if enabled
  if (csDesigning in ComponentState) or not FInjectViewEventHandler then
    Exit;
  // Set the TMethod Code and Data for the event handloer to be assigned to the View/ViewContext
  LEventHandlerToInject.Code := ClassType.MethodAddress('_OnCloseQueryEventHandler');
  LEventHandlerToInject.Data := Self;
  TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(AView, LEventHandlerToInject, False);
end;

procedure TioVMActionBSCloseQuery._InjectEventHandlerOnViewModel(const AViewModelAsTComponent: TComponent);
var
  LEventHandlerToInject: TMethod;
begin
  // On runtime only and only if enabled
  if (csDesigning in ComponentState) or not FInjectVMEventHandler then
    Exit;
  // Set the TMethod Code and Data for the event handloer to be assigned to the View/ViewContext
  LEventHandlerToInject.Code := ClassType.MethodAddress('_OnCloseQueryEventHandler');
  LEventHandlerToInject.Data := Self;
  TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(AViewModelAsTComponent, LEventHandlerToInject, True);
end;

function TioVMActionBSCloseQuery._CanClose: Boolean;
begin
  Result := (TargetBindSource = nil) or TargetBindSource.Persistence.IsEmpty or TargetBindSource.Persistence.CanSaveRevertPoint or (FOnEditingAction <> eaDisable);
  // Se è il caso interroga anche le ChildCQA
  if FOnUpdateScope in [usGlobal, usDisableIfChilds] then
    Result := Result and TioBSCloseQueryActionRegister.CanClose(Self, FOnUpdateScope = usDisableIfChilds);
  // se c'è un event handler per l'evento OnCloseQuery lascia a lui l'ultima parola
  if Assigned(FOnCloseQuery) then
    FOnCloseQuery(Self, Result);
end;

procedure TioVMActionBSCloseQuery._InternalUpdateStdAction;
begin
  Enabled := _CanClose;
end;

procedure TioVMActionBSCloseQuery._InternalExecuteStdAction;
var
  LViewModel: IioViewModelInternal;
begin
  FExecuting := True;
  try
    // NB: DoOnConfirmationRequest richiede eventuale conferma all'utente ma solo se è in modalità attiva
    //      cioè è la prima BSCloseQueryAction della catena di esecuzione delle CloseQueryActions. HO
    //      fatto in questo modo sia perchè altrimenti ci sarebbero potute essere varie richieste di conferma
    //      sia perchè altrimenti avevo un AV error.
    // NB: Mauri 23/09/2023: Non c'è più dil DoOnConfirmationRequest perchè rimosso perchè ho aggiunto l'evento
    //      "CanExecute" a tutte le StdActions.
    if _CanClose then
    begin
      // Se è il caso fa l'Execute anche sulle ChildCQA
      // NB: Le esegue sempre a partire da quella creata più recentemente (child) e andando all'indietro
      //      quindi esegue prima le ChildCQA e poi se stessa
      if FOnUpdateScope in [usGlobal] then
        TioBSCloseQueryActionRegister.Execute(Self);
      // In base a come impostata esegue l'azione
      if (FOnEditingAction = eaAutoPersist) and TargetBindSource.Persistence.CanPersist then
        TargetBindSource.Persistence.Persist;
      if (FOnEditingAction = eaAutoRevert) and TargetBindSource.Persistence.CanRevert then
        TargetBindSource.Persistence.Revert;
      if Supports(Owner, IioViewModelInternal, LViewModel) then
      begin
        if not FExecutingEventHandler then
        begin
          case FOnExecuteAction of
            eaClose:
              LViewModel.Close;
            eaTerminateApplication:
              io.TerminateApplication;
          end;
        end;
      end
      else
        raise EioGenericException.Create(ClassName, '_InternalExecuteStdAction', 'Owner does not implement the "IioViewModelInternal" interface.');
    end;
  finally
    FExecuting := False;
  end;
end;

procedure TioVMActionBSCloseQuery._OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean);
begin
  FExecutingEventHandler := True;
  try
    CanClose := _CanClose;
    if CanClose and not FExecuting then
      _InternalExecuteStdAction;
  finally
    FExecutingEventHandler := False;
  end;
end;

{ TioVMActionWhereBuild }

constructor TioVMActionBSBuildWhere.Create(AOwner: TComponent);
begin
  inherited;
  FAction_CloseQueryAction := nil;
  FAction_PersistAction := nil;
  AutoExec_Where_OnTargetBS := True;
end;

procedure TioVMActionBSBuildWhere.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FAction_CloseQueryAction as TComponent)) then
    FAction_CloseQueryAction := nil;
  if (Operation = opRemove) and (AComponent = (FAction_PersistAction as TComponent)) then
    FAction_PersistAction := nil;
end;

procedure TioVMActionBSBuildWhere.SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_CloseQueryAction then
  begin
    FAction_CloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioVMActionBSBuildWhere.SetAction_PersistAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_PersistAction then
  begin
    FAction_PersistAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioVMActionBSBuildWhere._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.BuildWhere(AutoExec_Where_OnTargetBS);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_PersistAction);
  TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_CloseQueryAction);
end;

procedure TioVMActionBSBuildWhere._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.isActive;
//  Enabled := Enabled and ((not Assigned(FPersistAction)) or FPersistAction._IsEnabled); // To avoid incorrect disabling of the action
  Enabled := Enabled and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
end;

{ TioVMActionWhereClear }

constructor TioVMActionBSClearWhere.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_Where_OnTargetBS := False;
end;

procedure TioVMActionBSClearWhere._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.ClearWhere(FAutoExec_Where_OnTargetBS);
end;

procedure TioVMActionBSClearWhere._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.isActive;
end;

{ TioShowAction }

constructor TioVMActionBSShowOrSelect.Create(AOwner: TComponent);
begin
  inherited;
  FEntityTypeName := '';
  FIsSlave := False;
  FAction_ParentCloseQueryAction := nil;
  FAction_SelectCurrentAction := nil;
  FShowMode := TioActionShowMode.smBSCurrent;
  FTargetBindSource := nil;
  FVVMTypeAlias := '';
  FViewContext := nil;
  FViewContextBy := TioActionViewContextBy.vcByDefaultViewContextProvider;
  FViewContextProvider := nil;
  FViewContextProviderName := '';
end;

function TioVMActionBSShowOrSelect.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target);
end;

procedure TioVMActionBSShowOrSelect.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent = (FTargetBindSource as TComponent)) then
      FTargetBindSource := nil
    else
    if (AComponent = (FAction_ParentCloseQueryAction as TComponent)) then
      FAction_ParentCloseQueryAction := nil
    else
    if (AComponent = (FAction_SelectCurrentAction as TComponent)) then
      FAction_SelectCurrentAction := nil
    else
    if (AComponent = (FViewContext as TComponent)) then
      FViewContext := nil
    else
    if (AComponent = (FViewContextProvider as TComponent)) then
      FViewContextProvider:= nil;
  end;
end;

procedure TioVMActionBSShowOrSelect.SetTargetBindSource(const Value: IioStdActionTargetBindSource);
begin
  if not(csLoading in ComponentState) and FIsSlave then
    raise EioGenericException.Create(ClassName, 'SetTargetBindSource', 'The "TargetBindSource" property of a "..SelectCurrent" action is read-only when the action itself is nested into a "ShowOrSelect" action');
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
    if Assigned(FAction_SelectCurrentAction) then
      FAction_SelectCurrentAction._SetTargetBindSource(Value as TObject);
  end;
end;

procedure TioVMActionBSShowOrSelect.SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
begin
  if Value <> FAction_ParentCloseQueryAction then
  begin
    FAction_ParentCloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioVMActionBSShowOrSelect.SetAction_SelectCurrentAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_SelectCurrentAction then
  begin
    FAction_SelectCurrentAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
    if Assigned(FAction_SelectCurrentAction) then
      FAction_SelectCurrentAction._SetTargetBindSource(FTargetBindSource as TObject);
  end;
end;

procedure TioVMActionBSShowOrSelect.SetViewContext(const Value: TComponent);
begin
  if Value <> FViewContext then
  begin
    FViewContext := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioVMActionBSShowOrSelect.SetViewContextProvider(const Value: TioViewContextProvider);
begin
  if Value <> FViewContextProvider then
  begin
    FViewContextProvider := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioVMActionBSShowOrSelect._InternalExecuteStdAction;
begin
  inherited;

  // If the TargetBindSource is a SelectorFor some other BindSource then make the selection instead
  if Assigned(TargetBindSource) and Assigned((TargetBindSource as IioBindSource).SelectorFor) then
  begin
    // Execute slave actions
    TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_SelectCurrentAction);
    Exit;
  end;

  // ShowBy...
  case FShowMode of
    // smBSCurrent
    smBSCurrent:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowCurrent(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowCurrent(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowCurrent(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowCurrent(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowCurrent(FFromBS as IioBindSource, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smBSEach
    smBSEach:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowEach(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowEach(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowEach(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowEach(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowEach(FFromBS as IioBindSource, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smEntityTypeName
    smEntityTypeName:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.Show(FEntityTypeName, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.Show(FEntityTypeName, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.Show(FEntityTypeName, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.Show(FEntityTypeName, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.Show(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smEntityTypeNameAsSelector
    smEntityTypeNameAsSelector:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowAsSelector(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smBSTypeNameAsSelector
    smBSTypeNameAsSelector:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsSelector(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsSelector(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsSelector(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsSelector(FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowAsSelector(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smEntityTypeNameAsWhereBuilder
    smEntityTypeNameAsWhereBuilder:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowAsWhereBuilder(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smBSTypeNameAsWhereBuilder
    smBSTypeNameAsWhereBuilder:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowAsWhereBuilder(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smEntityTypeNameAsETM
    smEntityTypeNameAsETM:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowAsETM(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smBSTypeNameAsETM
    smBSTypeNameAsETM:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsETM(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsETM(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsETM(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsETM(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
//        vcNone:
//          io.ShowAsETM(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
  end;
end;

procedure TioVMActionBSShowOrSelect._InternalUpdateStdAction;
begin
  inherited;

  // If the TargetBindSource is a SelectorFor some other BindSource then make the selection instead
  if Assigned(FAction_SelectCurrentAction) and Assigned((TargetBindSource as IioBindSource).SelectorFor) then
  begin
    Enabled := FAction_SelectCurrentAction._IsEnabled;
    Exit;
  end;

  // ShowBy
  case FShowMode of
    smBSCurrent, smBSEach, smBSTypeNameAsSelector, smBSTypeNameAsWhereBuilder, smBSTypeNameAsETM:
      Enabled := assigned(FTargetBindSource) and FTargetBindSource.IsActive;
    smEntityTypeName:
      Enabled := not FEntityTypeName.Trim.IsEmpty;
    smEntityTypeNameAsSelector, smEntityTypeNameAsWhereBuilder, smEntityTypeNameAsETM:
      Enabled := assigned(FTargetBindSource) and FTargetBindSource.IsActive and not FEntityTypeName.Trim.IsEmpty;
  end;
//  // ViewContextBy
//  case FViewContextBy of
//    vcByViewContextProviderName:
//      Enabled := Enabled and not FViewContextProviderName.Trim.IsEmpty;
//    vcByViewContextProvider:
//      Enabled := Enabled and Assigned(FViewContextProvider);
//    vcByViewContext:
//      Enabled := Enabled and Assigned(FViewContext);
//  end;
end;

function TioVMActionBSShowOrSelect._IsEnabled: Boolean;
begin
  Result := Enabled;
end;

procedure TioVMActionBSShowOrSelect._SetTargetBindSource(const AObj: TObject);
var
  LTargetBindSource: IioStdActionTargetBindSource;
begin
  if Assigned(AObj) and not Supports(AObj, IioStdActionTargetBindSource, LTargetBindSource) then
    raise EioGenericException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

{ TioVMActionBSEtmRevert }

constructor TioVMActionBS_ETM_RevertToBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_OnETMfor_AfterRevert := doNothing;
  FAutoExec_OnTargetBS_AfterRevert := doNothing;
  FAutoExec_Persist_AfterRevert := False;
  FRevertedObj := nil;
end;

procedure TioVMActionBS_ETM_RevertToBindSource._InternalExecuteStdAction;
begin
  inherited;
  // Some check
  if not(TargetBindSource.Current is TioEtmCustomTimeSlot) then
    raise EioEtmException.Create(ClassName, 'ExecuteTarget', 'Current object in the TargetBindSource is not derived from "TioEtmCustomTimeSlot" base class.');
  // Revert
  TioEtmEngine.RevertToBindSource(TargetBindSource.Current as TioEtmCustomTimeSlot, TargetBindSource, FAutoExec_Persist_AfterRevert);
  FRevertedObj := TargetBindSource.ETMfor.Current;
  // AfterRevert event handler
  if Assigned(FAfterRevertEvent) then
    FAfterRevertEvent(Self, FRevertedObj);
  // AutoExec...
  case FAutoExec_OnTargetBS_AfterRevert of
    doRefresh:
      TargetBindSource.Refresh;
    doReload:
      TargetBindSource.Persistence.Reload;
  end;
  if Assigned(TargetBindSource.ETMfor) then
    case FAutoExec_OnETMfor_AfterRevert of
      doRefresh:
        TargetBindSource.ETMfor.Refresh;
      doReload:
        TargetBindSource.ETMfor.Persistence.Reload;
    end;
  // Execute slave actions
  if TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction) then
    Exit;
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
    _ShowRevertedObj;
end;

procedure TioVMActionBS_ETM_RevertToBindSource._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource);
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor);
  Enabled := Enabled and Assigned(TargetBindSource.Current);
  Enabled := Enabled and TargetBindSource.ETMfor.IsActive;
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor.Current);
end;

procedure TioVMActionBS_ETM_RevertToBindSource._ShowRevertedObj;
var
  LShowOrSelectAction: TioVMActionBSShowOrSelect;
begin
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
  begin
    // Controlla se la ShowOrSelect action è realmente una action di questo tipo
    if not (Action_ShowOrSelectAction is TioVMActionBSShowOrSelect) then
      raise EioGenericException.Create(ClassName, '_ShowRevertedObj',
        Format('"Action_ShowOrSelectAction" property is of the wrong type "%s" insitead of "TioBSShowOrSelect".',
        [(Action_ShowOrSelectAction as TObject).ClassName]));
    // Estrae il tipo reale della ShowOrSelect action per poter poi accedere a informazioni che riguardano
    //  soprattutto come ottenere un ViewCOntext.
    //  NB: Questa azione in realtà non eseguirà la ShowOrSelect action impostata bensì farà una chiamata
    //       io.Show... usando le informazioni recuperate.
    LShowOrSelectAction := Action_ShowOrSelectAction as TioVMActionBSShowOrSelect;
    case LShowOrSelectAction.ViewContextBy of
      vcByDefaultViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProviderName:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, io.VCProviderByName(LShowOrSelectAction.ViewContextProviderName), LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContextProvider, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContext:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContext, LShowOrSelectAction.VVMTypeAlias);
      // vcNone:
      //   io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, nil, LShowOrSelectAction.VVMTypeAlias);
    end;
  end;
end;

{ TioVMActionBS_ETM_RevertToObject }

constructor TioVMActionBS_ETM_RevertToObject.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_OnETMfor_AfterRevert := doNothing;
  FAutoExec_OnTargetBS_AfterRevert := doNothing;
  FAutoExec_Persist_AfterRevert := False;
  FRevertedObj := nil;
  FOwnRevertedObj := True;
end;

procedure TioVMActionBS_ETM_RevertToObject._InternalExecuteStdAction;
begin
  inherited;
  // Some check
  if not(TargetBindSource.Current is TioEtmCustomTimeSlot) then
    raise EioEtmException.Create(ClassName, 'ExecuteTarget', 'Current object in the TargetBindSource is not derived from "TioEtmCustomTimeSlot" base class.');
  // Free previous reverted object (if OwnRevertedObj = True)
  if FOwnRevertedObj and Assigned(FRevertedObj) then
    FreeAndNil(FRevertedObj);
  // BeforeRevert event handler
  if Assigned(FBeforeRevertEvent) then
    FBeforeRevertEvent(Self, FRevertedObj);
  // Revert
  if Assigned(FRevertedObj) then
    io.etm.RevertToObject(FRevertedObj, TargetBindSource.Current as TioEtmCustomTimeSlot, FAutoExec_Persist_AfterRevert)
  else
    FRevertedObj := io.etm.RevertObject(TargetBindSource.Current as TioEtmCustomTimeSlot, FAutoExec_Persist_AfterRevert);
  // AfterRevert event handler
  if Assigned(FAfterRevertEvent) then
    FAfterRevertEvent(Self, FRevertedObj);
  // AutoExec...
  case FAutoExec_OnTargetBS_AfterRevert of
    doRefresh:
      TargetBindSource.Refresh;
    doReload:
      TargetBindSource.Persistence.Reload;
  end;
  if Assigned(TargetBindSource.ETMfor) then
    case FAutoExec_OnETMfor_AfterRevert of
      doRefresh:
        TargetBindSource.ETMfor.Refresh;
      doReload:
        TargetBindSource.ETMfor.Persistence.Reload;
    end;
  // Execute slave actions
  if TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction) then
    Exit;
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
    _ShowRevertedObj;
end;

procedure TioVMActionBS_ETM_RevertToObject._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource);
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor);
  Enabled := Enabled and Assigned(TargetBindSource.Current);
  Enabled := Enabled and TargetBindSource.ETMfor.IsActive;
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor.Current);
end;

procedure TioVMActionBS_ETM_RevertToObject._ShowRevertedObj;
var
  LShowOrSelectAction: TioVMActionBSShowOrSelect;
begin
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
  begin
    // Controlla se la ShowOrSelect action è realmente una action di questo tipo
    if not (Action_ShowOrSelectAction is TioVMActionBSShowOrSelect) then
      raise EioGenericException.Create(ClassName, '_ShowRevertedObj',
        Format('"Action_ShowOrSelectAction" property is of the wrong type "%s" insitead of "TioBSShowOrSelect".',
        [(Action_ShowOrSelectAction as TObject).ClassName]));
    // Estrae il tipo reale della ShowOrSelect action per poter poi accedere a informazioni che riguardano
    //  soprattutto come ottenere un ViewCOntext.
    //  NB: Questa azione in realtà non eseguirà la ShowOrSelect action impostata bensì farà una chiamata
    //       io.Show... usando le informazioni recuperate.
    LShowOrSelectAction := Action_ShowOrSelectAction as TioVMActionBSShowOrSelect;
    case LShowOrSelectAction.ViewContextBy of
      vcByDefaultViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProviderName:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, io.VCProviderByName(LShowOrSelectAction.ViewContextProviderName), LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContextProvider, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContext:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContext, LShowOrSelectAction.VVMTypeAlias);
      // vcNone:
      //   io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, nil, LShowOrSelectAction.VVMTypeAlias);
    end;
  end;
end;

{ TioVMAction }

procedure TioVMAction._InternalExecuteStdAction;
begin
  inherited;
  if Assigned(FOnExecute) then
    FOnExecute(Self);
end;

procedure TioVMAction._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Assigned(FOnExecute);
end;

{ TioVMDoSynchronization }

procedure TioVMDoSynchronization.Autoexec_OnTimerEventHandler(Sender: TObject);
begin
  if FAutoexec_Enabled and Assigned(FTargetSynchroStrategy) then
  begin
    if FTargetSynchroStrategy.IsReady then
    begin
      FAutoexec_Timer.Interval := FAutoexec_Interval * 1000; // Seconds
      Self.Execute;
    end;
  end
  else
    SetAutoexec_Enabled(False);
end;

constructor TioVMDoSynchronization.Create(AOwner: TComponent);
begin
  inherited;
  FAutoexec_Enabled := False;
  FAutoexec_Interval := 60;
  FAutoexec_StartDelay := 3;
  FSynchroLevel := slIncremental;
  FTargetSynchroStrategy := nil;
  // Autoexec internal timer
  if not(csDesigning in ComponentState) then
    FAutoexec_Timer := TioTimer.CreateNewTimer
  else
    FAutoexec_Timer := nil;
end;

destructor TioVMDoSynchronization.Destroy;
begin
  if Assigned(FAutoexec_Timer) then
    FAutoexec_Timer.Free;
  inherited;
end;

function TioVMDoSynchronization.Execute: Boolean;
begin
  Result := False;
  if Assigned(FTargetSynchroStrategy) then
    inherited;
end;

function TioVMDoSynchronization.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target);
//  Result := Assigned(Target) and Supports(FTargetSynchroStrategy, IioSynchroStrategy_Client) and
//    FTargetSynchroStrategy.isReady;
end;

procedure TioVMDoSynchronization.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetSynchroStrategy as TComponent)) then
    FTargetSynchroStrategy := nil;
end;

procedure TioVMDoSynchronization.SetAutoexec_Enabled(const Value: Boolean);
begin
  if Value = FAutoexec_Enabled then
    Exit;
  if Assigned(FAutoexec_Timer) then //aka "if not at designtime"
  begin
    if Value then
    begin
      FAutoexec_Timer.Interval := FAutoexec_StartDelay * 1000; // Seconds
      FAutoexec_Timer.OnTimer := Autoexec_OnTimerEventHandler;
    end
    else
      FAutoexec_Timer.Enabled := False;
  end;
  FAutoexec_Enabled := Value;
end;

procedure TioVMDoSynchronization.SetAutoexec_Interval(const ASeconds: Integer);
begin
  if ASeconds = FAutoexec_Interval then
    Exit;
  FAutoexec_Interval := ASeconds;
  // if Autoexec_Enabled is true then disable ad re-enable it to force the load af the new value
  if FAutoexec_Enabled then
  begin
    SetAutoexec_Enabled(False);
    SetAutoexec_Enabled(True);
  end;
end;

procedure TioVMDoSynchronization.SetAutoexec_StartDelay(const ASeconds: Integer);
begin
  if ASeconds = FAutoexec_StartDelay then
    Exit;
  FAutoexec_StartDelay := ASeconds;
  // if Autoexec_Enabled is true then disable ad re-enable it to force the load af the new value
  if FAutoexec_Enabled then
  begin
    SetAutoexec_Enabled(False);
    SetAutoexec_Enabled(True);
  end;
end;

procedure TioVMDoSynchronization.SetTargetSynchroStrategy(const Value: IioSynchroStrategy_Client);
begin
  if @Value <> @FTargetSynchroStrategy then
  begin
    FTargetSynchroStrategy := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

function TioVMDoSynchronization.Update: Boolean;
begin
  Result := False;
  if Assigned(FTargetSynchroStrategy) then
    inherited
  else
    Enabled := False;
end;

procedure TioVMDoSynchronization._InternalExecuteStdAction;
begin
  inherited;
  FTargetSynchroStrategy.DoSynchronization(FSynchroLevel);
end;

procedure TioVMDoSynchronization._InternalUpdateStdAction;
begin
  inherited;
  Enabled := Assigned(FTargetSynchroStrategy) and FTargetSynchroStrategy.isReady;
  // Autoenable/disable the Autoexec_Timer depending on Autoexec_Enabled property value, TargetSynchroStrategy and FAutoexec_Timer both assigned
  if FAutoexec_Enabled and Assigned(FTargetSynchroStrategy) and Assigned(FAutoexec_Timer) and not FAutoexec_Timer.Enabled then
    FAutoexec_Timer.Enabled := Enabled;
end;

end.
