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
unit iORM.StdActions.Vcl;

interface

uses
  System.Classes, Vcl.ActnList, iORM.CommonTypes, iORM.LiveBindings.Interfaces, iORM.MVVM.Interfaces, iORM.LiveBindings.BSPersistence,
  Vcl.Forms, iORM.StdActions.Interfaces, iORM.MVVM.ViewContextProvider;

type

  // =================================================================================================
  // BEGIN: VCL MVVM STANDARD ACTIONS
  // =================================================================================================

  // Standard action for MVVM view use
  TioViewAction = class(Vcl.ActnList.TAction, IioViewAction)
  strict private
    FCaptionLinkedToVMAction: Boolean;
    FEnabledLinkedToVMAction: Boolean;
    FVisibleLinkedToVMAction: Boolean;
    FVMAction: IioVMAction;
    FVMActionName: String;
    FBeforeExecute: TNotifyEvent;
    FAfterExecute: TNotifyEvent;
    FBeforeUpdate: TNotifyEvent;
    FAfterUpdate: TNotifyEvent;
    function Get_Version: String;
  strict protected
    procedure _ExecuteEmbeddedEvendHandler(Sender: TObject);
    procedure _UpdateEmbeddedEvendHandler(Sender: TObject);
    procedure CheckVMAction(const CallingMethod: String);
    procedure DoBeforeExecute;
    procedure DoAfterExecute;
    procedure DoBeforeUpdate;
    procedure DoAfterUpdate;
    // Caption property
    procedure SetCaption(const Value: string); override;
    function GetCaption: String;
    // CaptionLinkedToAction property
    procedure SetCaptionLinkedToVMAction(Value: Boolean);
    function GetCaptionLinkedToVMAction: Boolean;
    // Enabled property
    procedure SetEnabled(Value: Boolean); override;
    function GetEnabled: Boolean;
    // EnabledLinkedToAction property
    procedure SetEnabledLinkedToVMAction(Value: Boolean);
    function GetEnabledLinkedToVMAction: Boolean;
    // Name property
    procedure SetName(const Value: TComponentName); reintroduce;
    function GetName: TComponentName;
    property Name: TComponentName read GetName write SetName stored False;
    // Visible property
    procedure SetVisible(Value: Boolean); override;
    function GetVisible: Boolean;
    // EnabledLinkedToAction property
    procedure SetVisibleLinkedToVMAction(Value: Boolean);
    function GetVisibleLinkedToVMAction: Boolean;
    // VMAction property
    procedure SetVMAction(Value: IioVMAction);
    function GetVMAction: IioVMAction;
    property VMAction: IioVMAction read GetVMAction write SetVMAction;
    // VMActionName property
    procedure SetVMActionName(Value: String);
    function GetVMActionName: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
  published
    // Properties
    property Caption: string read GetCaption write SetCaption;
    property CaptionLinkedToVMAction: Boolean read GetCaptionLinkedToVMAction write SetCaptionLinkedToVMAction default False;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    property EnabledLinkedToVMAction: Boolean read GetEnabledLinkedToVMAction write SetEnabledLinkedToVMAction default True;
    property Visible: Boolean read GetVisible write SetVisible;
    property VisibleLinkedToVMAction: Boolean read GetVisibleLinkedToVMAction write SetVisibleLinkedToVMAction default True;
    property VMActionName: String read GetVMActionName write SetVMActionName;
    property _Version: String read Get_Version;
    // Events
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property AfterUpdate: TNotifyEvent read FAfterUpdate write FAfterUpdate;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property BeforeUpdate: TNotifyEvent read FBeforeUpdate write FBeforeUpdate;
  end;

  // =================================================================================================
  // END: VCL MVVM STANDARD ACTIONS
  // =================================================================================================

  // =================================================================================================
  // BEGIN: VCL STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // Base class for all BindSource standard actions
  TioBSStdActionVcl<T: IioStdActionTargetBindSource> = class(Vcl.ActnList.TAction)
  strict private
    FExecutionMode: TioActionExecutionMode;
    FTargetBindSource: T;
    // events
    FAfterExecute: TNotifyEvent;
    FBeforeExecute: TNotifyEvent;
    FCanExecute: TioStdActionCanExecuteEvent;
    function Get_Version: String;
  strict protected
    procedure _InternalExecuteStdAction; virtual;
    procedure _InternalUpdateStdAction; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetTargetBindSource(const Value: T); virtual;
    // ExecutionMode
    function GetExecutionMode: TioActionExecutionMode;
    procedure SetExecutionMode(const Value: TioActionExecutionMode);
    property ExecutionMode: TioActionExecutionMode read GetExecutionMode write SetExecutionMode;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // Events
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property CanExecute: TioStdActionCanExecuteEvent read FCanExecute write FCanExecute;
    property TargetBindSource: T read FTargetBindSource write SetTargetBindSource;
    property _Version: String read Get_Version;
  end;

  // SelectCurrent action to make a selection for a Selector BindSource
  TioBSSelectCurrent = class(TioBSStdActionVcl<IioStdActionTargetBindSource>, IioBSSlaveAction)
  strict private
    FAction_CloseQueryAction: IioBSSlaveAction;
    FIsSlave: Boolean;
    FSelectionType: TioSelectionType;
    function _IsEnabled: Boolean;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetTargetBindSource(const Value: IioStdActionTargetBindSource); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property SelectionType: TioSelectionType read FSelectionType write FSelectionType default stAppend;
  end;

  // Paging NextPage action
  TioBSNextPage = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  end;

  // Paging PreviousPage action
  TioBSPrevPage = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  end;

  // BuildWhere
  TioBSBuildWhere = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  strict private
    FAction_PersistAction: IioBSSlaveAction;
    FAction_CloseQueryAction: IioBSSlaveAction;
    FAutoExec_Where_OnTargetBS: Boolean;
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
    procedure SetAction_PersistAction(const Value: IioBSSlaveAction);
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property Action_PersistAction: IioBSSlaveAction read FAction_PersistAction write SetAction_PersistAction;
    property AutoExec_Where_OnTargetBS: Boolean read FAutoExec_Where_OnTargetBS write FAutoExec_Where_OnTargetBS default True;
  end;

  // ClearWhere
  TioBSClearWhere = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  strict private
    FAutoExec_Where_OnTargetBS: Boolean;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AutoExec_Where_OnTargetBS: Boolean read FAutoExec_Where_OnTargetBS write FAutoExec_Where_OnTargetBS default False;
  end;

  // =================================================================================================
  // END: VCL STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // =================================================================================================
  // BEGIN: VCL STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // Base class for all BinsDourceObjState standard actions
  TioBSPersistenceStdActionVcl = class(Vcl.ActnList.TCustomAction, IioBSSlaveAction)
  strict private
    FAction_CloseQueryAction: IioBSSlaveAction;
    FAction_ReloadAction: IioBSSlaveAction;
    FAction_ShowOrSelectAction: IioBSSlaveAction;
    FClearAfterExecute: Boolean;
    FDisableIfChangesDoesNotExists: Boolean;
    FDisableIfChangesExists: Boolean;
    FDisableIfSaved: Boolean;
    FIsSlave: Boolean;
    FRaiseIfChangesDoesNotExists: Boolean;
    FRaiseIfChangesExists: Boolean;
    FRaiseIfRevertPointSaved: Boolean;
    FRaiseIfRevertPointNotSaved: Boolean;
    FTargetBindSource: IioMasterBindSource;
    function Get_Version: String;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetTargetBindSource(const Value: IioMasterBindSource);
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
    procedure SetAction_ShowOrSelectAction(const Value: IioBSSlaveAction);
  strict protected
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property Action_ReloadAction: IioBSSlaveAction read FAction_ReloadAction write FAction_ReloadAction;
    property Action_ShowOrSelectAction: IioBSSlaveAction read FAction_ShowOrSelectAction write SetAction_ShowOrSelectAction;
    function _IsEnabled: Boolean; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property ClearAfterExecute: Boolean read FClearAfterExecute write FClearAfterExecute default True;
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
    procedure UpdateTarget(Target: TObject); override;
  published
    property _Version: String read Get_Version;
    // Publishing ancestor properties
    property AutoCheck;
    property Caption;
    property Checked;
    property Enabled;
    property GroupIndex;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ImageName;
    property SecondaryShortCuts;
    property ShortCut default 0;
    property Visible;
    // Events
    // property OnExecute;
    // property OnHint;
    // property OnUpdate;
  end;

  TioBSPersistenceSaveRevertPoint = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property TargetBindSource;
    // Events
    property OnExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceClear = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property DisableIfChangesExists;
    property RaiseIfChangesExists;
    property TargetBindSource;
    // Events
    property OnExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistencePersist = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // property ClearAfterExecute; // Eliminata perchè poteva interferire con TioVMActionBSCloseQuery
    property Action_CloseQueryAction;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property TargetBindSource;
    // Events
    property OnExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceRevert = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // property ClearAfterExecute; // Eliminata perchè poteva interferire con TioVMActionBSCloseQuery
    property Action_CloseQueryAction;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property RaiseIfRevertPointNotSaved;
    property TargetBindSource;
    // Events
    property OnExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceRevertOrDelete = class(TioBSPersistenceStdActionVcl)
  private
    FAutoExec_CloseQueryAction_AfterDelete: Boolean;
    FAutoExec_CloseQueryAction_AfterRevert: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // property ClearAfterExecute; // Eliminata perchè poteva interferire con TioVMActionBSCloseQuery
    property Action_CloseQueryAction;
    property AutoExec_CloseQueryAction_AfterDelete: Boolean read FAutoExec_CloseQueryAction_AfterDelete write FAutoExec_CloseQueryAction_AfterDelete default True;
    property AutoExec_CloseQueryAction_AfterRevert: Boolean read FAutoExec_CloseQueryAction_AfterRevert write FAutoExec_CloseQueryAction_AfterRevert default False;
    property DisableIfChangesDoesNotExists;
    property RaiseIfChangesDoesNotExists;
    property RaiseIfRevertPointNotSaved;
    property TargetBindSource;
    // Events
    property OnExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceDelete = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property Action_CloseQueryAction;
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // Events
    property OnExecute;
    property OnHint;
    property OnUpdate;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TioBSPersistenceReload = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property DisableIfChangesExists;
    property DisableIfSaved;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // Events
    property OnExecute;
    property OnHint;
    property OnUpdate;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TioBSPersistenceAppend = class(TioBSPersistenceStdActionVcl)
  private
    FEntityTypeAlias: String;
    FEntityTypeName: String;
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property Action_ShowOrSelectAction;
    property DisableIfChangesExists;
    property DisableIfSaved;
    property EntityTypeAlias: String read FEntityTypeAlias write FEntityTypeAlias;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
    property OnExecute;
    property OnHint;
    property OnUpdate;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TioBSPersistenceInsert = class(TioBSPersistenceStdActionVcl)
  private
    FEntityTypeAlias: String;
    FEntityTypeName: String;
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property Action_ShowOrSelectAction;
    property DisableIfChangesExists;
    property DisableIfSaved;
    property EntityTypeAlias: String read FEntityTypeAlias write FEntityTypeAlias;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    property RaiseIfChangesExists default False;
    property RaiseIfRevertPointSaved;
    property TargetBindSource;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
    property OnExecute;
    property OnHint;
    property OnUpdate;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TioBS_ETM_RevertToObject = class(TioBSPersistenceStdActionVcl)
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
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // Properties
    property Action_CloseQueryAction;
    property Action_ShowOrSelectAction;
    property AutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnETMfor_AfterRevert write FAutoExec_OnETMfor_AfterRevert default doNothing;
    property AutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnTargetBS_AfterRevert write FAutoExec_OnTargetBS_AfterRevert default doNothing;
    property AutoExec_Persist_AfterRevert: Boolean read FAutoExec_Persist_AfterRevert write FAutoExec_Persist_AfterRevert default False;
    property OwnRevertedObj: Boolean read FOwnRevertedObj write FOwnRevertedObj default True;
    property TargetBindSource;
    // Events
    property AfterRevert: TioStdAction_ETM_AfterRevertEvent read FAfterRevertEvent write FAfterRevertEvent;
    property BeforeRevert: TioStdAction_ETM_BeforeRevertEvent read FBeforeRevertEvent write FBeforeRevertEvent;
    property OnExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBS_ETM_RevertToBindSource = class(TioBSPersistenceStdActionVcl)
  strict private
    FAutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_Persist_AfterRevert: Boolean;
    FRevertedObj: TObject;
    // Events
    FAfterRevertEvent: TioStdAction_ETM_AfterRevertEvent;
    procedure _ShowRevertedObj;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // Properties
    property Action_CloseQueryAction;
    property Action_ShowOrSelectAction;
    property AutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnETMfor_AfterRevert write FAutoExec_OnETMfor_AfterRevert default doNothing;
    property AutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnTargetBS_AfterRevert write FAutoExec_OnTargetBS_AfterRevert default doNothing;
    property AutoExec_Persist_AfterRevert: Boolean read FAutoExec_Persist_AfterRevert write FAutoExec_Persist_AfterRevert default False;
    property TargetBindSource;
    // Events
    property AfterRevert: TioStdAction_ETM_AfterRevertEvent read FAfterRevertEvent write FAfterRevertEvent;
    property OnExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSCloseQuery = class(TioBSPersistenceStdActionVcl, IioBSCloseQueryAction)
  strict private
    FExecuting, FExecutingEventHandler: Boolean;
    FInjectEventHandler: Boolean;
    FInternalExecutionMode: TioActionExecutionMode;
    FOnCloseQuery: TCloseQueryEvent;
    FOnConfirmationRequest: TioStdActionCanExecuteEvent;
    FOnEditingAction: TioBSCloseQueryOnEditingAction;
    FOnExecuteAction: TioBSCloseQueryOnExecuteAction;
    FOnUpdateScope: TioBSCloseQueryActionUpdateScope;
    [weak]
    FAction_ParentCloseQueryAction: IioBSCloseQueryAction;
    procedure _InjectEventHandler;
    function _CanClose: Boolean;
    function _IsChildOf(const ATargetQueryAction: IioBSCloseQueryAction): Boolean;
    // InternalExecutionMode
    function GetInternalExecutionMode: TioActionExecutionMode;
    procedure SetInternalExecutionMode(const Value: TioActionExecutionMode);
    // ParentCloseQueryAction
    function GetAction_ParentCloseQueryAction: IioBSCloseQueryAction;
    procedure SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
  strict protected
    procedure _DummyOnExecute(Sender: TObject);
    function _IsEnabled: Boolean; override;
    procedure Loaded; override;
    function DoOnConfirmationRequest: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
    property InternalExecutionMode: TioActionExecutionMode read GetInternalExecutionMode write SetInternalExecutionMode;
    function Execute: Boolean; override;
    function Executing: Boolean;
    property Action_ParentCloseQueryAction: IioBSCloseQueryAction read GetAction_ParentCloseQueryAction write SetAction_ParentCloseQueryAction;
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    property InjectEventHandler: Boolean read FInjectEventHandler write FInjectEventHandler default True;
    property OnEditingAction: TioBSCloseQueryOnEditingAction read FOnEditingAction write FOnEditingAction default eaDisable;
    property OnExecuteAction: TioBSCloseQueryOnExecuteAction read FOnExecuteAction write FOnExecuteAction default eaClose;
    property OnUpdateScope: TioBSCloseQueryActionUpdateScope read FOnUpdateScope write FOnUpdateScope default usLocal;
    property TargetBindSource;
    // Events
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnConfirmationRequest: TioStdActionCanExecuteEvent read FOnConfirmationRequest write FOnConfirmationRequest;
    property OnHint;
  end;

  // =================================================================================================
  // END: VCL STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // =================================================================================================
  // BEGIN: VCL STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

  // ShowCurrent action to show the current object of the BS
  TioBSShowOrSelect = class(Vcl.ActnList.TAction, IioBSSlaveAction)
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
    function Get_Version: String;
    function _IsEnabled: Boolean;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
    procedure SetAction_SelectCurrentAction(const Value: IioBSSlaveAction);
    procedure SetTargetBindSource(const Value: IioStdActionTargetBindSource);
    procedure SetViewContext(const Value: TComponent);
    procedure SetViewContextProvider(const Value: TioViewContextProvider);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
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
    property _Version: String read Get_Version;
  end;

  // =================================================================================================
  // END: VCL STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

implementation

uses
  System.SysUtils, iORM.Exceptions, iORM.Utilities, iORM, System.Rtti,
  iORM.RttiContext.Factory, iORM.StdActions.CloseQueryActionRegister,
  iORM.ETM.Engine, iORM.StdActions.CommonBehaviour;

{ TioBSObjStateStdAction }

constructor TioBSPersistenceStdActionVcl.Create(AOwner: TComponent);
begin
  inherited;
  // Copied from TAction.Create
  DisableIfNoHandler := False;
  // New fields
  FClearAfterExecute := True;
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

function TioBSPersistenceStdActionVcl.Get_Version: String;
begin
  Result := io.Version;
end;

function TioBSPersistenceStdActionVcl.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, IioMasterBindSource) and FTargetBindSource.isActive;
end;

procedure TioBSPersistenceStdActionVcl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil
  else if (Operation = opRemove) and (AComponent = (FAction_CloseQueryAction as TComponent)) then
    FAction_CloseQueryAction := nil
  else if (Operation = opRemove) and (AComponent = (FAction_ShowOrSelectAction as TComponent)) then
    FAction_ShowOrSelectAction := nil;
end;

procedure TioBSPersistenceStdActionVcl.SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
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

procedure TioBSPersistenceStdActionVcl.SetAction_ShowOrSelectAction(const Value: IioBSSlaveAction);
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

procedure TioBSPersistenceStdActionVcl.SetTargetBindSource(const Value: IioMasterBindSource);
begin
  if not(csLoading in ComponentState) and FIsSlave then
    raise EioException.Create(ClassName, 'SetTargetBindSource',
      'The "TargetBindSource" property of a "..SelectCurrent" action is read-only when the action itself is nested into a "ShowOrSelect" action');
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

procedure TioBSPersistenceStdActionVcl.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := True;
  Enabled := Enabled and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
  Enabled := Enabled and ((not Assigned(FAction_ShowOrSelectAction)) or FAction_ShowOrSelectAction._IsEnabled);
end;

function TioBSPersistenceStdActionVcl._IsEnabled: Boolean;
begin
  Result := Enabled;
end;

procedure TioBSPersistenceStdActionVcl._SetTargetBindSource(const AObj: TObject);
var
  LTargetBindSource: IioMasterBindSource;
begin
  if Assigned(AObj) and not Supports(AObj, IioMasterBindSource, LTargetBindSource) then
    raise EioException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

{ TioBSObjStateRevert }

procedure TioBSPersistenceRevert.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Revert(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists, ClearAfterExecute);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioBSPersistenceRevert.UpdateTarget(Target: TObject);
begin
  Enabled := True;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevert;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSPersistenceRevertOrDelete }

constructor TioBSPersistenceRevertOrDelete.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_CloseQueryAction_AfterDelete := True;
  FAutoExec_CloseQueryAction_AfterRevert := False;
end;

procedure TioBSPersistenceRevertOrDelete.ExecuteTarget(Target: TObject);
var
  LIsDeleting: Boolean;
begin
  LIsDeleting := TargetBindSource.Persistence.IsInserting;
  TargetBindSource.Persistence.RevertOrDelete(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists, ClearAfterExecute);
  // Execute slave actions
  if (LIsDeleting and FAutoExec_CloseQueryAction_AfterDelete) or (not LIsDeleting and FAutoExec_CloseQueryAction_AfterRevert) then
    TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioBSPersistenceRevertOrDelete.UpdateTarget(Target: TObject);
begin
  Enabled := True;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevertOrDelete;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged or TargetBindSource.Persistence.IsInserting);
end;

{ TioBSObjStatePersist }

procedure TioBSPersistencePersist.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Refresh(True); // Otherwise, in some cases, an outdated value persisted
  TargetBindSource.Persistence.Persist(RaiseIfChangesDoesNotExists, ClearAfterExecute);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioBSPersistencePersist.UpdateTarget(Target: TObject);
begin
  Enabled := True;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanPersist;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSObjStateSave }

procedure TioBSPersistenceSaveRevertPoint.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.SaveRevertPoint(True);
end;

procedure TioBSPersistenceSaveRevertPoint.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanSaveRevertPoint;
end;

{ TioBSObjStateClear }

procedure TioBSPersistenceClear.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Clear(RaiseIfChangesExists);
end;

procedure TioBSPersistenceClear.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanClear;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
end;

{ TioBSPersistenceDelete }

constructor TioBSPersistenceDelete.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceDelete.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Delete(RaiseIfRevertPointSaved, RaiseIfChangesExists);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

procedure TioBSPersistenceDelete.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanDelete;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceReload }

constructor TioBSPersistenceReload.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceReload.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Reload(RaiseIfRevertPointSaved, RaiseIfChangesExists);
end;

procedure TioBSPersistenceReload.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanReload;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceAppend }

constructor TioBSPersistenceAppend.Create(AOwner: TComponent);
begin
  inherited;
  FEntityTypeAlias := '';
  FEntityTypeName := '';
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceAppend.ExecuteTarget(Target: TObject);
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
        raise EioException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
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
        raise EioException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
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
        raise EioException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
    end;
    // New instance not provided (created by the ABSAdapter itself)
    TargetBindSource.Persistence.Append(RaiseIfRevertPointSaved, RaiseIfChangesExists);
  finally
    // Execute slave actions
    TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_ShowOrSelectAction);
  end;
end;

procedure TioBSPersistenceAppend.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceInsert }

constructor TioBSPersistenceInsert.Create(AOwner: TComponent);
begin
  inherited;
  FEntityTypeAlias := '';
  FEntityTypeName := '';
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceInsert.ExecuteTarget(Target: TObject);
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
        raise EioException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
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
        raise EioException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
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
        raise EioException.Create(Self.ClassName, 'ExecuteTarget', 'Invalid new instance (nil)');
    end;
    // New instance not provided (created by the ABSAdapter itself)
    TargetBindSource.Persistence.Insert(RaiseIfRevertPointSaved, RaiseIfChangesExists);
  finally
    // Execute slave actions
    TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_ShowOrSelectAction);
  end;
end;

procedure TioBSPersistenceInsert.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSSelectCurrent }

constructor TioBSSelectCurrent.Create(AOwner: TComponent);
begin
  inherited;
  FAction_CloseQueryAction := nil;
  FIsSlave := False;
  FSelectionType := stAppend;
end;

procedure TioBSSelectCurrent.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FAction_CloseQueryAction as TComponent)) then
    FAction_CloseQueryAction := nil;
end;

procedure TioBSSelectCurrent.SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_CloseQueryAction then
  begin
    FAction_CloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioBSSelectCurrent.SetTargetBindSource(const Value: IioStdActionTargetBindSource);
begin
  if not(csLoading in ComponentState) and FIsSlave then
    raise EioException.Create(ClassName, 'SetTargetBindSource',
      'The "TargetBindSource" property of a "..SelectCurrent" action is read-only when the action itself is nested into a "ShowOrSelect" action')
  else
    inherited;
end;

procedure TioBSSelectCurrent._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.SelectCurrent(FSelectionType);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_CloseQueryAction);
end;

procedure TioBSSelectCurrent._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.CanDoSelection and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
end;

function TioBSSelectCurrent._IsEnabled: Boolean;
begin
  Result := Enabled;
end;

procedure TioBSSelectCurrent._SetTargetBindSource(const AObj: TObject);
var
  LTargetBindSource: IioStdActionTargetBindSource;
begin
  if Assigned(AObj) and not Supports(AObj, IioStdActionTargetBindSource, LTargetBindSource) then
    raise EioException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

{ TioBSStdActionVcl<T> }

constructor TioBSStdActionVcl<T>.Create(AOwner: TComponent);
begin
  inherited;
  FExecutionMode := emActive;
  // Copied from TAction.Create
  DisableIfNoHandler := False;
  // New fields
  FTargetBindSource := nil;
end;

procedure TioBSStdActionVcl<T>.ExecuteTarget(Target: TObject);
var
  LCanExecute: Boolean;
begin
  inherited;
  // Execute the CanExecute event (ActiveMode only)
  LCanExecute := True;
  if (FExecutionMode = emActive) and Assigned(FCanExecute) then
    FCanExecute(Self, LCanExecute);
  if not LCanExecute then
    Exit;
  // Execute the BeforeExecute event
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
  // Execute the VMAction.onExecute event if assigned (or a standard action)
  _InternalExecuteStdAction;
  // Execute the AfterExecute event
  if Assigned(FAfterExecute) then
    FAfterExecute(Self);
end;

function TioBSStdActionVcl<T>.Get_Version: String;
begin
  Result := io.Version;
end;

function TioBSStdActionVcl<T>.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, TioUtilities.TypeInfoToGUID(TypeInfo(T))) and FTargetBindSource.isActive;
end;

procedure TioBSStdActionVcl<T>.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    FTargetBindSource := nil;
end;

procedure TioBSStdActionVcl<T>.SetTargetBindSource(const Value: T);
begin
  if @Value <> @FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioBSStdActionVcl<T>.UpdateTarget(Target: TObject);
begin
  inherited;
  _InternalUpdateStdAction;
end;

procedure TioBSStdActionVcl<T>._InternalExecuteStdAction;
begin
  // Nothing to do here
end;

procedure TioBSStdActionVcl<T>._InternalUpdateStdAction;
begin
  // Nothing to do here
end;

{ TioBSNextPage }

procedure TioBSNextPage._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.Paging.NextPage;
end;

procedure TioBSNextPage._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.isActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsLastPage;

end;

{ TioBSPreviousPage }

procedure TioBSPrevPage._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.Paging.PrevPage;
end;

procedure TioBSPrevPage._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.isActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsFirstPage;
end;

{ TioViewAction }

procedure TioViewAction.CheckVMAction(const CallingMethod: String);
begin
  if not Assigned(FVMAction) then
    raise EioException.Create(ClassName, Format('CheckVMAction', [CallingMethod]),
      Format('ViewAction "%s" is not linked to corresponding VMAction named "%s".'#13#13'iORM is unable to execute the requested method ("%s").',
      [Name, GetVMActionName, CallingMethod]));
end;

constructor TioViewAction.Create(AOwner: TComponent);
begin
  inherited;
  // Copied from TAction.Create
  DisableIfNoHandler := False;
  // New fields
  FCaptionLinkedToVMAction := False;
  FEnabledLinkedToVMAction := True;
  FVisibleLinkedToVMAction := True;
  FVMAction := nil;
  FVMActionName := '';
  OnExecute := _ExecuteEmbeddedEvendHandler;
  OnUpdate := _UpdateEmbeddedEvendHandler;
end;

destructor TioViewAction.Destroy;
begin
  if Assigned(FVMAction) then
    FVMAction.UnbindViewAction(Self);
  inherited;
end;

procedure TioViewAction.DoAfterExecute;
begin
  if Assigned(FAfterExecute) then
    FAfterExecute(Self);
end;

procedure TioViewAction.DoAfterUpdate;
begin
  if Assigned(FAfterUpdate) then
    FAfterUpdate(Self);
end;

procedure TioViewAction.DoBeforeExecute;
begin
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
end;

procedure TioViewAction.DoBeforeUpdate;
begin
  if Assigned(FBeforeUpdate) then
    FBeforeUpdate(Self);
end;

procedure TioViewAction._ExecuteEmbeddedEvendHandler(Sender: TObject);
begin
  CheckVMAction('Execute');
  FVMAction.Execute;
end;

procedure TioViewAction._UpdateEmbeddedEvendHandler(Sender: TObject);
begin
  CheckVMAction('Update');
  FVMAction.Update;
end;

function TioViewAction.GetCaption: String;
begin
  Result := inherited Caption;
end;

function TioViewAction.GetCaptionLinkedToVMAction: Boolean;
begin
  Result := FCaptionLinkedToVMAction;
end;

function TioViewAction.GetEnabled: Boolean;
begin
  Result := inherited Enabled;
end;

function TioViewAction.GetEnabledLinkedToVMAction: Boolean;
begin
  Result := FEnabledLinkedToVMAction;
end;

function TioViewAction.GetName: TComponentName;
begin
  Result := inherited Name;
end;

function TioViewAction.GetVisible: Boolean;
begin
  Result := inherited Visible;
end;

function TioViewAction.GetVisibleLinkedToVMAction: Boolean;
begin
  Result := FVisibleLinkedToVMAction;
end;

procedure TioViewAction.SetCaption(const Value: string);
begin
  if Value <> GetCaption then
  begin
    inherited SetCaption(Value);
    if FCaptionLinkedToVMAction and not(csDesigning in ComponentState) then
    begin
      CheckVMAction('SetCaption');
      FVMAction.Caption := Value;
    end;
  end;
end;

procedure TioViewAction.SetCaptionLinkedToVMAction(Value: Boolean);
begin
  FCaptionLinkedToVMAction := Value;
end;

procedure TioViewAction.SetEnabled(Value: Boolean);
begin
  if Value <> GetEnabled then
  begin
    inherited SetEnabled(Value);
    if FEnabledLinkedToVMAction and not(csDesigning in ComponentState) then
    begin
      CheckVMAction('SetEnabled');
      FVMAction.Enabled := Value;
    end;
  end;
end;

procedure TioViewAction.SetEnabledLinkedToVMAction(Value: Boolean);
begin
  FEnabledLinkedToVMAction := Value;
end;

procedure TioViewAction.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
end;

procedure TioViewAction.SetVisible(Value: Boolean);
begin
  if Value <> GetVisible then
  begin
    inherited SetVisible(Value);
    if FVisibleLinkedToVMAction and not(csDesigning in ComponentState) then
    begin
      CheckVMAction('SetVisible');
      FVMAction.Visible := Value;
    end;
  end;
end;

procedure TioViewAction.SetVisibleLinkedToVMAction(Value: Boolean);
begin
  FVisibleLinkedToVMAction := Value;
end;

function TioViewAction.GetVMAction: IioVMAction;
begin
  Result := FVMAction;
end;

function TioViewAction.GetVMActionName: String;
begin
  if FVMActionName.IsEmpty then
    Result := Name
  else
    Result := FVMActionName;
end;

function TioViewAction.Get_Version: String;
begin
  Result := io.Version;
end;

function TioViewAction.HandlesTarget(Target: TObject): Boolean;
begin
  CheckVMAction('HandlesTarget');
  Result := FVMAction.HandlesTarget(Target);
end;

procedure TioViewAction.SetVMAction(Value: IioVMAction);
begin
  FVMAction := Value;
end;

procedure TioViewAction.SetVMActionName(Value: String);
begin
  if UpperCase(Value.Trim) = UpperCase(Name) then
    FVMActionName := ''
  else
    FVMActionName := Value.Trim;
end;

{ TioBSCloseQuery }

constructor TioBSCloseQuery.Create(AOwner: TComponent);
begin
  inherited;
  // OnExecute := _DummyOnExecute; // Set the dummy OnExecute event handler // NB: Nella versione VCL causa problemi
  FExecuting := False;
  FExecutingEventHandler := False;
  FInternalExecutionMode := emActive;
  FInjectEventHandler := True;
  FOnEditingAction := eaDisable;
  FOnExecuteAction := eaClose;
  FOnUpdateScope := usLocal;
  TioBSCloseQueryActionRegister.RegisterAction(Self as IioBSCloseQueryAction);
end;

destructor TioBSCloseQuery.Destroy;
begin
  TioBSCloseQueryActionRegister.UnregisterAction(Self as IioBSCloseQueryAction);
  inherited;
end;

function TioBSCloseQuery.DoOnConfirmationRequest: Boolean;
begin
  Result := True;
  if Assigned(FOnConfirmationRequest) then
    FOnConfirmationRequest(Self, Result);
end;

procedure TioBSCloseQuery.Loaded;
begin
  inherited;
  _InjectEventHandler;
end;

procedure TioBSCloseQuery.SetInternalExecutionMode(const Value: TioActionExecutionMode);
begin
  FInternalExecutionMode := Value;
end;

procedure TioBSCloseQuery.SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
begin
  FAction_ParentCloseQueryAction := Value;
end;

function TioBSCloseQuery.HandlesTarget(Target: TObject): Boolean;
begin
  Result := True;
end;

procedure TioBSCloseQuery.UpdateTarget(Target: TObject);
begin
  Enabled := _CanClose;
end;

function TioBSCloseQuery.Execute: Boolean;
begin
  inherited;
  Result := False;
end;

procedure TioBSCloseQuery.ExecuteTarget(Target: TObject);
begin
  FExecuting := True;
  try
    // NB: DoOnConfirmationRequest richiede eventuale conferma all'utente ma solo se è in modalità attiva
    // cioè è la prima BSCloseQueryAction della catena di esecuzione delle CloseQueryActions. HO
    // fatto in questo modo sia perchè altrimenti ci sarebbero potute essere varie richieste di conferma
    // sia perchè altrimenti avevo un AV error.
    if _CanClose and ((FInternalExecutionMode = emPassive) or DoOnConfirmationRequest) then
    begin
      // Se è il caso fa l'Execute anche sulle ChildCQA
      // NB: Le esegue sempre a partire da quella creata più recentemente (child) e andando all'indietro
      // quindi esegue prima le ChildCQA e poi se stessa
      if FOnUpdateScope in [usGlobal] then
        TioBSCloseQueryActionRegister.Execute(Self);
      // In base a come impostata esegue l'azione
      if (FOnEditingAction = eaAutoPersist) and TargetBindSource.Persistence.CanPersist then
        TargetBindSource.Persistence.Persist;
      if (FOnEditingAction = eaAutoRevert) and TargetBindSource.Persistence.CanRevert then
        TargetBindSource.Persistence.Revert;
      if not FExecutingEventHandler then
      begin
        case FOnExecuteAction of
          eaClose:
            begin
              if Owner is TForm then
                TForm(Owner).Close
              else
              begin
                // To avoid invalid pointer error
                if Owner.ComponentIndex > -1 then
                  Owner.Owner.RemoveComponent(Owner);
                Owner.Free;
              end;
            end;
          eaTerminateApplication:
            io.TerminateApplication;
        end;
      end;
    end;
  finally
    FExecuting := False;
  end;
end;

function TioBSCloseQuery.Executing: Boolean;
begin
  Result := FExecuting;
end;

function TioBSCloseQuery.GetInternalExecutionMode: TioActionExecutionMode;
begin
  Result := FInternalExecutionMode;
end;

function TioBSCloseQuery.GetAction_ParentCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := FAction_ParentCloseQueryAction;
end;

procedure TioBSCloseQuery._InjectEventHandler;
var
  LEventHandlerToInject: TMethod;
begin
  // On runtime only and only if enabled
  if (csDesigning in ComponentState) or not FInjectEventHandler then
    Exit;
  // Set the TMethod Code and Data for the event handloer to be assigned to the View/ViewContext
  LEventHandlerToInject.Code := ClassType.MethodAddress('_OnCloseQueryEventHandler');
  LEventHandlerToInject.Data := Self;
  TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(Owner, LEventHandlerToInject, False);
end;

function TioBSCloseQuery._IsChildOf(const ATargetQueryAction: IioBSCloseQueryAction): Boolean;
begin
  Result := TioBSCloseQueryCommonBehaviour.IsChildOf(Self, ATargetQueryAction);
end;

function TioBSCloseQuery._IsEnabled: Boolean;
begin
  // Do not inherit
  Result := _CanClose;
end;

function TioBSCloseQuery._CanClose: Boolean;
begin
  Result := (TargetBindSource = nil) or TargetBindSource.Persistence.IsEmpty or TargetBindSource.Persistence.CanSaveRevertPoint or
    (FOnEditingAction <> eaDisable);
  // Se è il caso interroga anche le ChildCQA
  if FOnUpdateScope in [usGlobal, usDisableIfChilds] then
    Result := Result and TioBSCloseQueryActionRegister.CanClose(Self, FOnUpdateScope = usDisableIfChilds);
  // se c'è un event handler per l'evento OnCloseQuery lascia a lui l'ultima parola
  if Assigned(FOnCloseQuery) then
    FOnCloseQuery(Self, Result);
end;

procedure TioBSCloseQuery._DummyOnExecute(Sender: TObject);
begin
  // Nothing, this is a dummy execute event handler (altrimenti l'azione non si esegue, in realtà sembra servire solo su fmx)
end;

procedure TioBSCloseQuery._OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := _CanClose;
  if CanClose and not FExecuting then
  begin
    ExecuteTarget(Sender);
    CanClose := False;
  end;
end;

{ TioBSWhereBuild }

constructor TioBSBuildWhere.Create(AOwner: TComponent);
begin
  inherited;
  FAction_CloseQueryAction := nil;
  FAction_PersistAction := nil;
  FAutoExec_Where_OnTargetBS := True;
end;

procedure TioBSBuildWhere.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FAction_CloseQueryAction as TComponent)) then
    FAction_CloseQueryAction := nil;
  if (Operation = opRemove) and (AComponent = (FAction_PersistAction as TComponent)) then
    FAction_PersistAction := nil;
end;

procedure TioBSBuildWhere.SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_CloseQueryAction then
  begin
    FAction_CloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioBSBuildWhere.SetAction_PersistAction(const Value: IioBSSlaveAction);
begin
  if Value <> FAction_PersistAction then
  begin
    FAction_PersistAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioBSBuildWhere._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.BuildWhere(FAutoExec_Where_OnTargetBS);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_PersistAction);
  TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_CloseQueryAction);
end;

procedure TioBSBuildWhere._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.isActive;
  // Enabled := Enabled and ((not Assigned(FPersistAction)) or FPersistAction._IsEnabled); // To avoid incorrect disabling of the action
  Enabled := Enabled and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
end;

{ TioBSWhereClear }

constructor TioBSClearWhere.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_Where_OnTargetBS := False;
end;

procedure TioBSClearWhere._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.ClearWhere(FAutoExec_Where_OnTargetBS);
end;

procedure TioBSClearWhere._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.isActive;
end;

{ TioShowAction }

constructor TioBSShowOrSelect.Create(AOwner: TComponent);
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

function TioBSShowOrSelect.Get_Version: String;
begin
  Result := io.Version;
end;

function TioBSShowOrSelect.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target);
end;

procedure TioBSShowOrSelect.UpdateTarget(Target: TObject);
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
      Enabled := Assigned(FTargetBindSource) and FTargetBindSource.isActive;
    smEntityTypeName:
      Enabled := not FEntityTypeName.Trim.IsEmpty;
    smEntityTypeNameAsSelector, smEntityTypeNameAsWhereBuilder, smEntityTypeNameAsETM:
      Enabled := Assigned(FTargetBindSource) and FTargetBindSource.isActive and not FEntityTypeName.Trim.IsEmpty;
  end;
  // // ViewContextBy
  // case FViewContextBy of
  // vcByViewContextProviderName:
  // Enabled := Enabled and not FViewContextProviderName.Trim.IsEmpty;
  // vcByViewContextProvider:
  // Enabled := Enabled and Assigned(FViewContextProvider);
  // vcByViewContext:
  // Enabled := Enabled and Assigned(FViewContext);
  // end;
end;

function TioBSShowOrSelect._IsEnabled: Boolean;
begin
  Result := Enabled;
end;

procedure TioBSShowOrSelect._SetTargetBindSource(const AObj: TObject);
var
  LTargetBindSource: IioStdActionTargetBindSource;
begin
  if Assigned(AObj) and not Supports(AObj, IioStdActionTargetBindSource, LTargetBindSource) then
    raise EioException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

procedure TioBSShowOrSelect.ExecuteTarget(Target: TObject);
begin
  inherited;

  // If the TargetBindSource is a SelectorFor some other BindSource then make the selection instead
  if Assigned(TargetBindSource) and Assigned((TargetBindSource as IioBindSource).SelectorFor) then
  begin
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
        // vcNone:
        // io.ShowCurrent(FFromBS as IioBindSource, FParentCloseQueryAction, nil, FVVMTypeAlias);
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
        // vcNone:
        // io.ShowEach(FFromBS as IioBindSource, FParentCloseQueryAction, nil, FVVMTypeAlias);
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
        // vcNone:
        // io.Show(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smEntityTypeNameAsSelector
    smEntityTypeNameAsSelector:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName),
            FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsSelector(FEntityTypeName, FTargetBindSource as IioBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
        // vcNone:
        // io.ShowAsSelector(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
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
        // vcNone:
        // io.ShowAsSelector(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smEntityTypeNameAsWhereBuilder
    smEntityTypeNameAsWhereBuilder:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction,
            io.VCProviderByName(FViewContextProviderName), FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsWhereBuilder(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
        // vcNone:
        // io.ShowAsWhereBuilder(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smBSTypeNameAsWhereBuilder
    smBSTypeNameAsWhereBuilder:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName),
            FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsWhereBuilder(FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
        // vcNone:
        // io.ShowAsWhereBuilder(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
    // smEntityTypeNameAsETM
    smEntityTypeNameAsETM:
      case FViewContextBy of
        vcByDefaultViewContextProvider:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FVVMTypeAlias);
        vcByViewContextProviderName:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, io.VCProviderByName(FViewContextProviderName),
            FVVMTypeAlias);
        vcByViewContextProvider:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContextProvider, FVVMTypeAlias);
        vcByViewContext:
          io.ShowAsETM(FEntityTypeName, FTargetBindSource as IioMasterBindSource, FAction_ParentCloseQueryAction, FViewContext, FVVMTypeAlias);
        // vcNone:
        // io.ShowAsETM(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
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
        // vcNone:
        // io.ShowAsETM(FEntityTypeName, FParentCloseQueryAction, nil, FVVMTypeAlias);
      end;
  end;
end;

procedure TioBSShowOrSelect.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent = (FTargetBindSource as TComponent)) then
      FTargetBindSource := nil
    else if (AComponent = (FAction_ParentCloseQueryAction as TComponent)) then
      FAction_ParentCloseQueryAction := nil
    else if (AComponent = (FAction_SelectCurrentAction as TComponent)) then
      FAction_SelectCurrentAction := nil
    else if (AComponent = (FViewContext as TComponent)) then
      FViewContext := nil
    else if (AComponent = (FViewContextProvider as TComponent)) then
      FViewContextProvider := nil;
  end;
end;

procedure TioBSShowOrSelect.SetTargetBindSource(const Value: IioStdActionTargetBindSource);
begin
  if not(csLoading in ComponentState) and FIsSlave then
    raise EioException.Create(ClassName, 'SetTargetBindSource',
      'The "TargetBindSource" property of a "..SelectCurrent" action is read-only when the action itself is nested into a "ShowOrSelect" action');
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
    if Assigned(FAction_SelectCurrentAction) then
      FAction_SelectCurrentAction._SetTargetBindSource(Value as TObject);
  end;
end;

procedure TioBSShowOrSelect.SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
begin
  if Value <> FAction_ParentCloseQueryAction then
  begin
    FAction_ParentCloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioBSShowOrSelect.SetAction_SelectCurrentAction(const Value: IioBSSlaveAction);
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

procedure TioBSShowOrSelect.SetViewContext(const Value: TComponent);
begin
  if Value <> FViewContext then
  begin
    FViewContext := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioBSShowOrSelect.SetViewContextProvider(const Value: TioViewContextProvider);
begin
  if Value <> FViewContextProvider then
  begin
    FViewContextProvider := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;


{ TioBS_ETM_RevertToObject }

constructor TioBS_ETM_RevertToObject.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_OnETMfor_AfterRevert := doNothing;
  FAutoExec_OnTargetBS_AfterRevert := doNothing;
  FAutoExec_Persist_AfterRevert := False;
  FRevertedObj := nil;
  FOwnRevertedObj := True;
end;

procedure TioBS_ETM_RevertToObject.ExecuteTarget(Target: TObject);
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

procedure TioBS_ETM_RevertToObject.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource);
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor);
  Enabled := Enabled and Assigned(TargetBindSource.Current);
  Enabled := Enabled and TargetBindSource.ETMfor.isActive;
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor.Current);
end;

procedure TioBS_ETM_RevertToObject._ShowRevertedObj;
var
  LShowOrSelectAction: TioBSShowOrSelect;
begin
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
  begin
    // Controlla se la ShowOrSelect action è realmente una action di questo tipo
    if not (Action_ShowOrSelectAction is TioBSShowOrSelect) then
      raise EioException.Create(ClassName, '_ShowRevertedObj',
        Format('"Action_ShowOrSelectAction" property is of the wrong type "%s" insitead of "TioBSShowOrSelect".',
        [(Action_ShowOrSelectAction as TObject).ClassName]));
    // Estrae il tipo reale della ShowOrSelect action per poter poi accedere a informazioni che riguardano
    //  soprattutto come ottenere un ViewCOntext.
    //  NB: Questa azione in realtà non eseguirà la ShowOrSelect action impostata bensì farà una chiamata
    //       io.Show... usando le informazioni recuperate.
    LShowOrSelectAction := Action_ShowOrSelectAction as TioBSShowOrSelect;
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

{ TioBS_ETM_RevertToBindSource }

constructor TioBS_ETM_RevertToBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_OnETMfor_AfterRevert := doNothing;
  FAutoExec_OnTargetBS_AfterRevert := doNothing;
  FAutoExec_Persist_AfterRevert := False;
  FRevertedObj := nil;
end;

procedure TioBS_ETM_RevertToBindSource.ExecuteTarget(Target: TObject);
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

procedure TioBS_ETM_RevertToBindSource.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Enabled and Assigned(TargetBindSource);
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor);
  Enabled := Enabled and Assigned(TargetBindSource.Current);
  Enabled := Enabled and TargetBindSource.ETMfor.isActive;
  Enabled := Enabled and Assigned(TargetBindSource.ETMfor.Current);
end;

procedure TioBS_ETM_RevertToBindSource._ShowRevertedObj;
var
  LShowOrSelectAction: TioBSShowOrSelect;
begin
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
  begin
    // Controlla se la ShowOrSelect action è realmente una action di questo tipo
    if not (Action_ShowOrSelectAction is TioBSShowOrSelect) then
      raise EioException.Create(ClassName, '_ShowRevertedObj',
        Format('"Action_ShowOrSelectAction" property is of the wrong type "%s" insitead of "TioBSShowOrSelect".',
        [(Action_ShowOrSelectAction as TObject).ClassName]));
    // Estrae il tipo reale della ShowOrSelect action per poter poi accedere a informazioni che riguardano
    //  soprattutto come ottenere un ViewCOntext.
    //  NB: Questa azione in realtà non eseguirà la ShowOrSelect action impostata bensì farà una chiamata
    //       io.Show... usando le informazioni recuperate.
    LShowOrSelectAction := Action_ShowOrSelectAction as TioBSShowOrSelect;
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

end.
