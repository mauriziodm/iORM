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
unit iORM.StdActions.Fmx;

interface

uses
  Fmx.ActnList, iORM.LiveBindings.BSPersistence, System.Classes, iORM.LiveBindings.Interfaces, iORM.CommonTypes, iORM.MVVM.Interfaces,
  iORM.StdActions.Interfaces, iORM.MVVM.ViewContextProvider,
  iORM.SynchroStrategy.Interfaces, iORM.Abstraction;

type

  TioStdActionNewInstanceAsObjectEvent = procedure(const ASender: TObject; out NewInstance: TObject) of object;
  TioStdActionNewInstanceAsInterfaceEvent = procedure(const ASender: TObject; out NewInstance: IInterface) of object;

  // =================================================================================================
  // BEGIN: FMX MVVM STANDARD ACTIONS
  // =================================================================================================

  // Standard action for MVVM view use
  TioViewAction = class(Fmx.ActnList.TCustomAction, IioViewAction)
  strict private
    FCheckedLinkedToVMAction: Boolean;
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
    // Checked property
    function GetChecked: Boolean;
    procedure SetChecked(Value: Boolean); reintroduce;
    // CheckedLinkedToVMAction property
    procedure SetCheckedLinkedToVMAction(Value: Boolean);
    function GetCheckedLinkedToVMAction: Boolean;
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
  published
    // inherited properties
    property AutoCheck;
    // property Checked; // ridichiarata sotto Carlo Marona 2024/05/29
    // property Enabled; // ridichiarata sotto
    property GroupIndex;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut default 0;
    property SecondaryShortCuts;
    property Text;
    // property Visible; // ridichiarata sotto
    property UnsupportedArchitectures;
    property UnsupportedPlatforms;
    // inherited events
    property OnHint;
    // property OnUpdate; // Lasciarla non visibile, può fare casino in questa particolare action
    // Properties
    property Checked: Boolean read GetChecked write SetChecked default False;
    property CheckedLinkedToVMAction: Boolean read GetCheckedLinkedToVMAction write SetCheckedLinkedToVMAction default True;
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
  // END: FMX MVVM STANDARD ACTIONS
  // =================================================================================================

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // Base class for all BindSource standard actions
  TioBSStdActionFmx<T: IioStdActionTargetBindSource> = class(Fmx.ActnList.TCustomAction)
  strict private
    FExecutionMode: TioActionExecutionMode;
    FTargetBindSource: T;
    // events
    FAfterExecute: TNotifyEvent;
    FBeforeExecute: TNotifyEvent;
    FCanExecute: TioCanExecuteEvent;
    function Get_Version: String;
  strict protected
    procedure _InternalExecuteStdAction; virtual;
    function _InternalUpdateStdAction: Boolean; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetExecutionMode: TioActionExecutionMode;
    procedure SetExecutionMode(const Value: TioActionExecutionMode);
    procedure SetTargetBindSource(const Value: T); virtual;
    // properties
    property ExecutionMode: TioActionExecutionMode read GetExecutionMode write SetExecutionMode;
    property TargetBindSource: T read FTargetBindSource write SetTargetBindSource;
    // Events
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property CanExecute: TioCanExecuteEvent read FCanExecute write FCanExecute;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // inherited properties
    property AutoCheck;
    property Text;
    property Checked;
    property Enabled;
    property GroupIndex;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut default 0;
    property SecondaryShortCuts;
    property Visible;
    property UnsupportedArchitectures;
    property UnsupportedPlatforms;
    // properties
    property _Version: String read Get_Version;
  end;

  // SelectCurrent action to make a selection for a Selector BindSource
  TioBSSelectCurrent = class(TioBSStdActionFmx<IioStdActionTargetBindSource>, IioBSSlaveAction)
  strict private
    FAction_CloseQueryAction: IioBSSlaveAction;
    FIsSlave: Boolean;
    FSelectionType: TioSelectionType;
    function _IsEnabled: Boolean;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
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
    property OnHint;
    property OnUpdate;
    // properties
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property SelectionType: TioSelectionType read FSelectionType write FSelectionType default stAppend;
  end;

  // Paging NextPage action
  TioBSNextPage = class(TioBSStdActionFmx<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnHint;
    property OnUpdate;
  end;

  // Paging PreviousPage action
  TioBSPrevPage = class(TioBSStdActionFmx<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnHint;
    property OnUpdate;
  end;

  // BuildWhere
  TioBSBuildWhere = class(TioBSStdActionFmx<IioStdActionTargetMasterBindSource>)
  strict private
    FAction_PersistAction: IioBSSlaveAction;
    FAction_CloseQueryAction: IioBSSlaveAction;
    FAutoExec_Where_OnTargetBS: Boolean;
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
    procedure SetAction_PersistAction(const Value: IioBSSlaveAction);
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnHint;
    property OnUpdate;
    // properties
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property Action_PersistAction: IioBSSlaveAction read FAction_PersistAction write SetAction_PersistAction;
    property AutoExec_Where_OnTargetBS: Boolean read FAutoExec_Where_OnTargetBS write FAutoExec_Where_OnTargetBS default True;
  end;

  // ClearWhere
  TioBSClearWhere = class(TioBSStdActionFmx<IioStdActionTargetMasterBindSource>)
  strict private
    FAutoExec_Where_OnTargetBS: Boolean;
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnHint;
    property OnUpdate;
    // properties
    property AutoExec_Where_OnTargetBS: Boolean read FAutoExec_Where_OnTargetBS write FAutoExec_Where_OnTargetBS default False;
  end;

  // =================================================================================================
  // END: FMX STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // Base class for all BinsDourceObjState standard actions
  TioBSPersistenceStdActionFmx = class(Fmx.ActnList.TCustomAction, IioBSSlaveAction)
  strict private
    FAction_ReloadAction: IioBSSlaveAction;
    FAction_ShowOrSelectAction: IioBSSlaveAction;
    FAction_CloseQueryAction: IioBSSlaveAction;
    FDisableIfChangesDoesNotExists: Boolean;
    FDisableIfChangesExists: Boolean;
    FDisableIfSaved: Boolean;
    FExecutionMode: TioActionExecutionMode;
    FIsSlave: Boolean;
    FRaiseIfChangesDoesNotExists: Boolean;
    FRaiseIfChangesExists: Boolean;
    FRaiseIfRevertPointSaved: Boolean;
    FRaiseIfRevertPointNotSaved: Boolean;
    FTargetBindSource: IioMasterBindSource;
    // events
    FAfterExecute: TNotifyEvent;
    FBeforeExecute: TNotifyEvent;
    FCanExecute: TioCanExecuteEvent;
    function Get_Version: String;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetTargetBindSource(const Value: IioMasterBindSource);
    procedure SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
    procedure SetAction_ShowOrSelectAction(const Value: IioBSSlaveAction);
  strict protected
    procedure _InternalExecuteStdAction; virtual;
    function _InternalUpdateStdAction: Boolean; virtual;
    function _IsEnabled: Boolean; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetExecutionMode: TioActionExecutionMode;
    procedure SetExecutionMode(const Value: TioActionExecutionMode);
    // properties
    property Action_CloseQueryAction: IioBSSlaveAction read FAction_CloseQueryAction write SetAction_CloseQueryAction;
    property Action_ReloadAction: IioBSSlaveAction read FAction_ReloadAction write FAction_ReloadAction;
    property Action_ShowOrSelectAction: IioBSSlaveAction read FAction_ShowOrSelectAction write SetAction_ShowOrSelectAction;
    property DisableIfChangesExists: Boolean read FDisableIfChangesExists write FDisableIfChangesExists default False;
    property DisableIfChangesDoesNotExists: Boolean read FDisableIfChangesDoesNotExists write FDisableIfChangesDoesNotExists default False;
    property DisableIfSaved: Boolean read FDisableIfSaved write FDisableIfSaved default False;
    property ExecutionMode: TioActionExecutionMode read GetExecutionMode write SetExecutionMode;
    property RaiseIfChangesDoesNotExists: Boolean read FRaiseIfChangesDoesNotExists write FRaiseIfChangesDoesNotExists default False;
    property RaiseIfChangesExists: Boolean read FRaiseIfChangesExists write FRaiseIfChangesExists default True;
    property RaiseIfRevertPointNotSaved: Boolean read FRaiseIfRevertPointNotSaved write FRaiseIfRevertPointNotSaved default False;
    property RaiseIfRevertPointSaved: Boolean read FRaiseIfRevertPointSaved write FRaiseIfRevertPointSaved default False;
    property TargetBindSource: IioMasterBindSource read FTargetBindSource write SetTargetBindSource;
    // events
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property CanExecute: TioCanExecuteEvent read FCanExecute write FCanExecute;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // inherited properties
    property AutoCheck;
    property Text;
    property Checked;
    property Enabled;
    property GroupIndex;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut default 0;
    property SecondaryShortCuts;
    property Visible;
    property UnsupportedArchitectures;
    property UnsupportedPlatforms;
    // properties
    property _Version: String read Get_Version;
  end;

  TioBSPersistenceSaveRevertPoint = class(TioBSPersistenceStdActionFmx)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
  published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceClear = class(TioBSPersistenceStdActionFmx)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
  published
    // inherited properties
    property DisableIfChangesExists;
    property RaiseIfChangesExists;
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistencePersist = class(TioBSPersistenceStdActionFmx)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceRevert = class(TioBSPersistenceStdActionFmx)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceRevertOrDelete = class(TioBSPersistenceStdActionFmx)
  private
    FAutoExec_CloseQueryAction_AfterDelete: Boolean;
    FAutoExec_CloseQueryAction_AfterRevert: Boolean;
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
    // properties
    property AutoExec_CloseQueryAction_AfterDelete: Boolean read FAutoExec_CloseQueryAction_AfterDelete write FAutoExec_CloseQueryAction_AfterDelete
      default True;
    property AutoExec_CloseQueryAction_AfterRevert: Boolean read FAutoExec_CloseQueryAction_AfterRevert write FAutoExec_CloseQueryAction_AfterRevert
      default False;
  end;

  TioBSPersistenceDelete = class(TioBSPersistenceStdActionFmx)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceReload = class(TioBSPersistenceStdActionFmx)
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
  end;

  TioBSPersistenceAppend = class(TioBSPersistenceStdActionFmx)
  private
    FEntityTypeAlias: String;
    FEntityTypeName: String;
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
    // properties
    property EntityTypeAlias: String read FEntityTypeAlias write FEntityTypeAlias;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
  end;

  TioBSPersistenceInsert = class(TioBSPersistenceStdActionFmx)
  private
    FEntityTypeAlias: String;
    FEntityTypeName: String;
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
    // properties
    property EntityTypeAlias: String read FEntityTypeAlias write FEntityTypeAlias;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    // events
    property OnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent read FOnNewInstanceAsObject write FOnNewInstanceAsObject;
    property OnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent read FOnNewInstanceAsInterface write FOnNewInstanceAsInterface;
  end;

  TioBS_ETM_RevertToObject = class(TioBSPersistenceStdActionFmx)
  strict private
    FAutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert;
    FAutoExec_Persist_AfterRevert: Boolean;
    FRevertedObj: TObject;
    // Events
    FAfterRevertEvent: TioStdAction_ETM_AfterRevertEvent;
    FBeforeRevertEvent: TioStdAction_ETM_BeforeRevertEvent;
    procedure _ShowRevertedObj;
  strict protected
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
    // properties
    property AutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnETMfor_AfterRevert write FAutoExec_OnETMfor_AfterRevert
      default doNothing;
    property AutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnTargetBS_AfterRevert write FAutoExec_OnTargetBS_AfterRevert
      default doNothing;
    property AutoExec_Persist_AfterRevert: Boolean read FAutoExec_Persist_AfterRevert write FAutoExec_Persist_AfterRevert default False;
    // events
    property AfterRevert: TioStdAction_ETM_AfterRevertEvent read FAfterRevertEvent write FAfterRevertEvent;
    property BeforeRevert: TioStdAction_ETM_BeforeRevertEvent read FBeforeRevertEvent write FBeforeRevertEvent;
  end;

  TioBS_ETM_RevertToBindSource = class(TioBSPersistenceStdActionFmx)
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
    function _InternalUpdateStdAction: Boolean; override;
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
    property OnHint;
    property OnUpdate;
    // properties
    property AutoExec_OnETMfor_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnETMfor_AfterRevert write FAutoExec_OnETMfor_AfterRevert
      default doNothing;
    property AutoExec_OnTargetBS_AfterRevert: TioStdAction_ETM_AutoExec_AfterRevert read FAutoExec_OnTargetBS_AfterRevert write FAutoExec_OnTargetBS_AfterRevert
      default doNothing;
    property AutoExec_Persist_AfterRevert: Boolean read FAutoExec_Persist_AfterRevert write FAutoExec_Persist_AfterRevert default False;
    // events
    property AfterRevert: TioStdAction_ETM_AfterRevertEvent read FAfterRevertEvent write FAfterRevertEvent;
  end;

  TioBSCloseQuery = class(TioBSPersistenceStdActionFmx, IioBSCloseQueryAction)
  strict private
    FExecuting, FExecutingEventHandler: Boolean;
    FInjectEventHandler: Boolean;
    FInternalExecutionMode: TioActionExecutionMode;
    FOnCloseQuery: TCloseQueryEvent;
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
    procedure _InternalExecuteStdAction; override;
    function _InternalUpdateStdAction: Boolean; override;
    procedure _DummyOnExecute(Sender: TObject);
    function _IsEnabled: Boolean; override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    function Execute: Boolean; override;
    function Executing: Boolean;
    property InternalExecutionMode: TioActionExecutionMode read GetInternalExecutionMode write SetInternalExecutionMode;
    property Action_ParentCloseQueryAction: IioBSCloseQueryAction read GetAction_ParentCloseQueryAction write SetAction_ParentCloseQueryAction;
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    // inherited properties
    property TargetBindSource;
    // inherited events
    property AfterExecute;
    property BeforeExecute;
    property CanExecute;
    property OnHint;
    // OnUpdate; // Lasciarla non visibile, può fare casino in questa particolare action
    // properties
    property InjectEventHandler: Boolean read FInjectEventHandler write FInjectEventHandler default True;
    property OnEditingAction: TioBSCloseQueryOnEditingAction read FOnEditingAction write FOnEditingAction default eaDisable;
    property OnExecuteAction: TioBSCloseQueryOnExecuteAction read FOnExecuteAction write FOnExecuteAction default eaClose;
    property OnUpdateScope: TioBSCloseQueryActionUpdateScope read FOnUpdateScope write FOnUpdateScope default usLocal;
    // events
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
  end;

  // =================================================================================================
  // END: FMX STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

  // ShowCurrent action to show the current object of the BS
  TioBSShowOrSelect = class(Fmx.ActnList.TCustomAction, IioBSSlaveAction)
  strict private
    FAction_ParentCloseQueryAction: IioBSCloseQueryAction;
    FAction_SelectCurrentAction: IioBSSlaveAction;
    FEntityTypeName: String;
    FExecutionMode: TioActionExecutionMode;
    FIsSlave: Boolean;
    FShowMode: TioActionShowMode;
    FTargetBindSource: IioStdActionTargetBindSource;
    FVVMTypeAlias: String;
    FViewContext: TComponent;
    FViewContextBy: TioActionViewContextBy;
    FViewContextProvider: TioViewContextProvider;
    FViewContextProviderName: String;
    // events
    FAfterExecute: TNotifyEvent;
    FBeforeExecute: TNotifyEvent;
    FCanExecute: TioCanExecuteEvent;
    function Get_Version: String;
    function _IsEnabled: Boolean;
    procedure _SetTargetBindSource(const AObj: TObject);
    procedure SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
    procedure SetAction_SelectCurrentAction(const Value: IioBSSlaveAction);
    procedure SetTargetBindSource(const Value: IioStdActionTargetBindSource);
    procedure SetViewContext(const Value: TComponent);
    procedure SetViewContextProvider(const Value: TioViewContextProvider);
  strict protected
    procedure _InternalExecuteStdAction; virtual;
    function _InternalUpdateStdAction: Boolean; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
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
    // inherited properties
    property AutoCheck;
    property Text;
    property Checked;
    property Enabled;
    property GroupIndex;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut default 0;
    property SecondaryShortCuts;
    property Visible;
    property UnsupportedArchitectures;
    property UnsupportedPlatforms;
    // inherited events
    property OnHint;
    property OnUpdate;
    // properties
    property Action_ParentCloseQueryAction: IioBSCloseQueryAction read FAction_ParentCloseQueryAction write SetAction_ParentCloseQueryAction;
    property Action_SelectCurrentAction: IioBSSlaveAction read FAction_SelectCurrentAction write SetAction_SelectCurrentAction;
    property EntityTypeName: String read FEntityTypeName write FEntityTypeName;
    property ShowMode: TioActionShowMode read FShowMode write FShowMode;
    property TargetBindSource: IioStdActionTargetBindSource read FTargetBindSource write SetTargetBindSource;
    property ViewContext: TComponent read FViewContext write SetViewContext;
    property ViewContextBy: TioActionViewContextBy read FViewContextBy write FViewContextBy;
    property ViewContextProvider: TioViewContextProvider read FViewContextProvider write SetViewContextProvider;
    property ViewContextProviderName: String read FViewContextProviderName write FViewContextProviderName;
    property VVMTypeAlias: String read FVVMTypeAlias write FVVMTypeAlias;
    property _Version: String read Get_Version;
    // Events
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property CanExecute: TioCanExecuteEvent read FCanExecute write FCanExecute;
  end;

  // =================================================================================================
  // END: FMX STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

  // =================================================================================================
  // BEGIN: FMX STANDARD ACTIONS FOR SYNCHRONIZATION PURPOSES
  // =================================================================================================

  // DoSynchronization action
  TioDoSynchronization = class(Fmx.ActnList.TCustomAction)
  strict private
    // fields
    FAutoexec_Enabled: Boolean;
    FAutoexec_Interval: Integer;
    FAutoexec_StartDelay: Integer;
    FAutoexec_Timer: TioTimer;
    FSynchroLevel: TioSynchroLevel;
    FTargetSynchroStrategy: IioSynchroStrategy_Client;
    // events
    FAfterExecute: TNotifyEvent;
    FBeforeExecute: TNotifyEvent;
    FCanExecute: TioCanExecuteEvent;
    // methods
    procedure Autoexec_OnTimerEventHandler(Sender: TObject);
    function Get_Version: String;
    procedure SetAutoexec_Enabled(const Value: Boolean);
    procedure SetAutoexec_Interval(const ASeconds: Integer);
    procedure SetAutoexec_StartDelay(const ASeconds: Integer);
    procedure SetTargetSynchroStrategy(const Value: IioSynchroStrategy_Client);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    // inherited properties
    property AutoCheck;
    property Text;
    property Checked;
    property Enabled;
    property GroupIndex;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut default 0;
    property SecondaryShortCuts;
    property Visible;
    property UnsupportedArchitectures;
    property UnsupportedPlatforms;
    // properties
    property Autoexec_Enabled: Boolean read FAutoexec_Enabled write SetAutoexec_Enabled default False;
    property Autoexec_Interval: Integer read FAutoexec_Interval write SetAutoexec_Interval default 60;
    property Autoexec_StartDelay: Integer read FAutoexec_StartDelay write SetAutoexec_StartDelay default 3;
    property SynchroLevel: TioSynchroLevel read FSynchroLevel write FSynchroLevel default slIncremental;
    property TargetSynchroStrategy: IioSynchroStrategy_Client read FTargetSynchroStrategy write SetTargetSynchroStrategy;
    property _Version: String read Get_Version;
    // Events
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property CanExecute: TioCanExecuteEvent read FCanExecute write FCanExecute;
  end;

  // =================================================================================================
  // END: FMX STANDARD ACTIONS FOR SYNCHRONIZATION PURPOSES
  // =================================================================================================

implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Utilities, iORM,
  System.Rtti, iORM.RttiContext.Factory,
  iORM.StdActions.CloseQueryActionRegister, Fmx.Forms, iORM.ETM.Engine,
  iORM.StdActions.CommonBehaviour;

{ TioBSObjStateStdActionFmx }

constructor TioBSPersistenceStdActionFmx.Create(AOwner: TComponent);
begin
  inherited;
  // Copied from TAction.Create
  DisableIfNoHandler := False;
  // New fields
  FAction_CloseQueryAction := nil;
  FDisableIfChangesDoesNotExists := False;
  FDisableIfChangesExists := False;
  FDisableIfSaved := False;
  FExecutionMode := emActive;
  FIsSlave := False;
  FRaiseIfChangesDoesNotExists := False;
  FRaiseIfChangesExists := True;
  FRaiseIfRevertPointSaved := False;
  FRaiseIfRevertPointNotSaved := False;
  FAction_ReloadAction := nil;
  FAction_ShowOrSelectAction := nil;
end;

procedure TioBSPersistenceStdActionFmx.ExecuteTarget(Target: TObject);
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

function TioBSPersistenceStdActionFmx.GetExecutionMode: TioActionExecutionMode;
begin
  Result := FExecutionMode;
end;

function TioBSPersistenceStdActionFmx.Get_Version: String;
begin
  Result := io.Version;
end;

function TioBSPersistenceStdActionFmx.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, IioMasterBindSource) and FTargetBindSource.isActive;
end;

procedure TioBSPersistenceStdActionFmx.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil
  else if (Operation = opRemove) and (AComponent = (FAction_CloseQueryAction as TComponent)) then
    FAction_CloseQueryAction := nil
  else if (Operation = opRemove) and (AComponent = (FAction_ShowOrSelectAction as TComponent)) then
    FAction_ShowOrSelectAction := nil;
end;

procedure TioBSPersistenceStdActionFmx.SetAction_CloseQueryAction(const Value: IioBSSlaveAction);
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

procedure TioBSPersistenceStdActionFmx.SetAction_ShowOrSelectAction(const Value: IioBSSlaveAction);
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

procedure TioBSPersistenceStdActionFmx.SetExecutionMode(const Value: TioActionExecutionMode);
begin
  FExecutionMode := Value;
end;

procedure TioBSPersistenceStdActionFmx.SetTargetBindSource(const Value: IioMasterBindSource);
begin
  if not(csLoading in ComponentState) and FIsSlave then
    raise EioGenericException.Create(ClassName, 'SetTargetBindSource',
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

procedure TioBSPersistenceStdActionFmx.UpdateTarget(Target: TObject);
var
  LEnabled: Boolean;
begin
  inherited;
  // LEnabled to avoid flickering
  LEnabled := _InternalUpdateStdAction;
  if LEnabled <> Enabled then
    Enabled := LEnabled;
end;

procedure TioBSPersistenceStdActionFmx._InternalExecuteStdAction;
begin
  // Nothing to do here
end;

function TioBSPersistenceStdActionFmx._InternalUpdateStdAction: Boolean;
begin
  Result := True;
  Result := Result and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
  Result := Result and ((not Assigned(FAction_ShowOrSelectAction)) or FAction_ShowOrSelectAction._IsEnabled);
end;

function TioBSPersistenceStdActionFmx._IsEnabled: Boolean;
begin
  Result := Enabled;
end;

procedure TioBSPersistenceStdActionFmx._SetTargetBindSource(const AObj: TObject);
var
  LTargetBindSource: IioMasterBindSource;
begin
  if Assigned(AObj) and not Supports(AObj, IioMasterBindSource, LTargetBindSource) then
    raise EioGenericException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

{ TioBSObjStateSave }

procedure TioBSPersistenceSaveRevertPoint._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.SaveRevertPoint(True);
end;

function TioBSPersistenceSaveRevertPoint._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanSaveRevertPoint;
end;

{ TioBSObjStateClear }

procedure TioBSPersistenceClear._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Clear(RaiseIfChangesExists);
end;

function TioBSPersistenceClear._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanClear;
  Result := Result and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
end;

{ TioBSObjStatePersist }

procedure TioBSPersistencePersist._InternalExecuteStdAction;
begin
  TargetBindSource.Refresh(True); // Otherwise, in some cases, an outdated value persisted
  TargetBindSource.Persistence.Persist(RaiseIfChangesDoesNotExists);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

function TioBSPersistencePersist._InternalUpdateStdAction: Boolean;
begin
  Result := True;
  Result := Result and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanPersist;
  Result := Result and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSObjStateRevert }

procedure TioBSPersistenceRevert._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Revert(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

function TioBSPersistenceRevert._InternalUpdateStdAction: Boolean;
begin
  Result := True;
  Result := Result and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevert;
  Result := Result and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSPersistenceRevertOrDelete }

constructor TioBSPersistenceRevertOrDelete.Create(AOwner: TComponent);
begin
  inherited;
  FAutoExec_CloseQueryAction_AfterDelete := True;
  FAutoExec_CloseQueryAction_AfterRevert := False;
end;

procedure TioBSPersistenceRevertOrDelete._InternalExecuteStdAction;
var
  LIsDeleting: Boolean;
begin
  LIsDeleting := TargetBindSource.Persistence.IsInserting;
  TargetBindSource.Persistence.RevertOrDelete(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists);
  // Execute slave actions
  if (LIsDeleting and FAutoExec_CloseQueryAction_AfterDelete) or (not LIsDeleting and FAutoExec_CloseQueryAction_AfterRevert) then
    TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

function TioBSPersistenceRevertOrDelete._InternalUpdateStdAction: Boolean;
begin
  Result := True;
  Result := Result and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevertOrDelete;
  Result := Result and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged or TargetBindSource.Persistence.IsInserting);
end;

{ TioBSPersistenceDelete }

constructor TioBSPersistenceDelete.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceDelete._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Delete(RaiseIfRevertPointSaved, RaiseIfChangesExists);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_CloseQueryAction);
end;

function TioBSPersistenceDelete._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanDelete;
  Result := Result and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Result := Result and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceReload }

constructor TioBSPersistenceReload.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceReload._InternalExecuteStdAction;
begin
  TargetBindSource.Persistence.Reload(RaiseIfRevertPointSaved, RaiseIfChangesExists);
end;

function TioBSPersistenceReload._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanReload;
  Result := Result and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Result := Result and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceAppend }

constructor TioBSPersistenceAppend.Create(AOwner: TComponent);
begin
  inherited;
  FEntityTypeAlias := '';
  FEntityTypeName := '';
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceAppend._InternalExecuteStdAction;
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
        raise EioGenericException.Create(Self.ClassName, 'OnNewInstanceAsObject event handler', 'Invalid new instance (nil)');
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
        raise EioGenericException.Create(Self.ClassName, 'OnNewInstanceAsInterface event handler', 'Invalid new instance (nil)');
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
    // If assigned the "ShowOrExecuteAction" then execute it
  finally
    // Execute slave actions
    if Assigned(Action_ShowOrSelectAction) then
    begin
      TioStdActionCommonBehaviour.ExecuteSlaveAction(Action_ShowOrSelectAction);
      TargetBindSource.Persistence.Clear;
    end;
  end;
end;

function TioBSPersistenceAppend._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Result := Result and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Result := Result and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceInsert }

constructor TioBSPersistenceInsert.Create(AOwner: TComponent);
begin
  inherited;
  FEntityTypeAlias := '';
  FEntityTypeName := '';
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceInsert._InternalExecuteStdAction;
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
        raise EioGenericException.Create(Self.ClassName, 'OnNewInstanceAsObject event handler', 'Invalid new instance (nil)');
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
        raise EioGenericException.Create(Self.ClassName, 'OnNewInstanceAsInterface event handler', 'Invalid new instance (nil)');
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

function TioBSPersistenceInsert._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Result := Result and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Result := Result and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSSelectCurrent }

constructor TioBSSelectCurrent.Create(AOwner: TComponent);
begin
  inherited;
  FIsSlave := False;
  FAction_CloseQueryAction := nil;
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
    raise EioGenericException.Create(ClassName, 'SetTargetBindSource',
      'The "TargetBindSource" property of a "..SelectCurrent" action is read-only when the action itself is nested into a "ShowOrSelect" action')
  else
    inherited;
end;

procedure TioBSSelectCurrent._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.SelectCurrent(FSelectionType);
  // Execute slave actions
  TioStdActionCommonBehaviour.ExecuteSlaveAction(FAction_CloseQueryAction, True);
end;

function TioBSSelectCurrent._InternalUpdateStdAction: Boolean;
begin
  Result := TargetBindSource.CanDoSelection and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
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
    raise EioGenericException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
end;

{ TioBSStdActionFmx<T> }

constructor TioBSStdActionFmx<T>.Create(AOwner: TComponent);
begin
  inherited;
  FExecutionMode := emActive;
  // Copied from TAction.Create
  DisableIfNoHandler := False;
  // New fields
  FTargetBindSource := nil;
end;

procedure TioBSStdActionFmx<T>.ExecuteTarget(Target: TObject);
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

function TioBSStdActionFmx<T>.GetExecutionMode: TioActionExecutionMode;
begin
  Result := FExecutionMode;
end;

function TioBSStdActionFmx<T>.Get_Version: String;
begin
  Result := io.Version;
end;

function TioBSStdActionFmx<T>.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, TioUtilities.TypeInfoToGUID(TypeInfo(T))) and FTargetBindSource.isActive;
end;

procedure TioBSStdActionFmx<T>.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    FTargetBindSource := nil;
end;

procedure TioBSStdActionFmx<T>.SetExecutionMode(const Value: TioActionExecutionMode);
begin
  FExecutionMode := Value;
end;

procedure TioBSStdActionFmx<T>.SetTargetBindSource(const Value: T);
begin
  if @Value <> @FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioBSStdActionFmx<T>.UpdateTarget(Target: TObject);
var
  LEnabled: Boolean;
begin
  inherited;
  // LEnabled to avoid flickering
  LEnabled := _InternalUpdateStdAction;
  if LEnabled <> Enabled then
    Enabled := LEnabled;
end;

procedure TioBSStdActionFmx<T>._InternalExecuteStdAction;
begin
  // Nothing to do here
end;

function TioBSStdActionFmx<T>._InternalUpdateStdAction: Boolean;
begin
  Result := True;
end;

{ TioBSNextPage }

procedure TioBSNextPage._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.Paging.NextPage;
end;

function TioBSNextPage._InternalUpdateStdAction: Boolean;
begin
  Result := TargetBindSource.isActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsLastPage;
end;

{ TioBSPrevPage }

procedure TioBSPrevPage._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.Paging.PrevPage;
end;

function TioBSPrevPage._InternalUpdateStdAction: Boolean;
begin
  Result := TargetBindSource.isActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsFirstPage;
end;

{ TioViewAction }

procedure TioViewAction.CheckVMAction(const CallingMethod: String);
begin
  if not Assigned(FVMAction) then
    raise EioGenericException.Create(ClassName, Format('CheckVMAction', [CallingMethod]),
      Format('ViewAction "%s" is not linked to corresponding VMAction named "%s".'#13#13'iORM is unable to execute the requested method ("%s").',
      [Name, GetVMActionName, CallingMethod]));
end;

constructor TioViewAction.Create(AOwner: TComponent);
begin
  inherited;
  FCheckedLinkedToVMAction := True;
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

function TioViewAction.GetChecked: Boolean;
begin
  Result := inherited Checked;
end;

function TioViewAction.GetCheckedLinkedToVMAction: Boolean;
begin
  Result := FCheckedLinkedToVMAction;
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

procedure TioViewAction.SetChecked(Value: Boolean);
begin
  if Value <> GetChecked then
  begin
    inherited SetChecked(Value);
    if FCheckedLinkedToVMAction and not(csDesigning in ComponentState) then
    begin
      CheckVMAction('SetChecked');
      FVMAction.Checked := Value;
    end;
  end;
end;

procedure TioViewAction.SetCheckedLinkedToVMAction(Value: Boolean);
begin
  FCheckedLinkedToVMAction := Value;
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

{ TioBSCloseQuery }

constructor TioBSCloseQuery.Create(AOwner: TComponent);
begin
  inherited;
  // New fields
  OnExecute := _DummyOnExecute; // Set the dummy OnExecute event handler
  FExecuting := False;
  FExecutingEventHandler := False;
  FInjectEventHandler := True;
  FInternalExecutionMode := emActive;
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

function TioBSCloseQuery.Execute: Boolean;
begin
  inherited;
  Result := False;
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

procedure TioBSCloseQuery._InternalExecuteStdAction;
begin
  FExecuting := True;
  try
    // NB: DoOnConfirmationRequest richiede eventuale conferma all'utente ma solo se è in modalità attiva
    // cioè è la prima BSCloseQueryAction della catena di esecuzione delle CloseQueryActions. HO
    // fatto in questo modo sia perchè altrimenti ci sarebbero potute essere varie richieste di conferma
    // sia perchè altrimenti avevo un AV error.
    // NB: Mauri 23/09/2023: Non c'è più dil DoOnConfirmationRequest perchè rimosso perchè ho aggiunto l'evento
    // "CanExecute" a tutte le StdActions.
    if _CanClose then
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

function TioBSCloseQuery._InternalUpdateStdAction: Boolean;
begin
  Result := _CanClose;
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
  // Questo inizialmente era un dummy event (non serviva a nulla, sono a falìr si che ci fosse un event handler)
  // ma poi c'è stato il problema che se si eseguiva l'azione da codice (MyAction.Execute) questa non veniva
  // eseguita. Con questo codice ho risolto (Mauri 19/05/2023)
  // NB: Questo dummy event c'è solo nella versione FMX perchè in quella VCL dava dei problemi
  if not Assigned(ActionComponent) then
    ExecuteTarget(nil);
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

function TioBSBuildWhere._InternalUpdateStdAction: Boolean;
begin
  Result := TargetBindSource.isActive;
  // Enabled := Enabled and ((not Assigned(FPersistAction)) or FPersistAction._IsEnabled); // To avoid incorrect disabling of the action
  Result := Result and ((not Assigned(FAction_CloseQueryAction)) or FAction_CloseQueryAction._IsEnabled);
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

function TioBSClearWhere._InternalUpdateStdAction: Boolean;
begin
  Result := TargetBindSource.isActive;
end;

{ TioBSShowOrSelect }

constructor TioBSShowOrSelect.Create(AOwner: TComponent);
begin
  inherited;
  // Copied from TAction.Create
  DisableIfNoHandler := False;
  // New fields
  FAction_ParentCloseQueryAction := nil;
  FAction_SelectCurrentAction := nil;
  FEntityTypeName := '';
  FExecutionMode := emActive;
  FIsSlave := False;
  FShowMode := TioActionShowMode.smBSCurrent;
  FTargetBindSource := nil;
  FVVMTypeAlias := '';
  FViewContext := nil;
  FViewContextBy := TioActionViewContextBy.vcByDefaultViewContextProvider;
  FViewContextProvider := nil;
  FViewContextProviderName := '';
end;

procedure TioBSShowOrSelect.ExecuteTarget(Target: TObject);
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

function TioBSShowOrSelect.GetExecutionMode: TioActionExecutionMode;
begin
  Result := FExecutionMode;
end;

function TioBSShowOrSelect.Get_Version: String;
begin
  Result := io.Version;
end;

function TioBSShowOrSelect.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target);
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
    raise EioGenericException.Create(ClassName, 'SetTargetBindSource',
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

procedure TioBSShowOrSelect.SetExecutionMode(const Value: TioActionExecutionMode);
begin
  FExecutionMode := Value;
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

procedure TioBSShowOrSelect.UpdateTarget(Target: TObject);
begin
  inherited;
  _InternalUpdateStdAction;
end;

procedure TioBSShowOrSelect._InternalExecuteStdAction;
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
    // byBSCurrent
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

function TioBSShowOrSelect._InternalUpdateStdAction: Boolean;
begin
  // If the TargetBindSource is a SelectorFor some other BindSource then make the selection instead
  if Assigned(FAction_SelectCurrentAction) and Assigned((TargetBindSource as IioBindSource).SelectorFor) then
  begin
    Result := FAction_SelectCurrentAction._IsEnabled;
    Exit;
  end;

  // ShowBy
  case FShowMode of
    smBSCurrent, smBSEach, smBSTypeNameAsSelector, smBSTypeNameAsWhereBuilder, smBSTypeNameAsETM:
      Result := Assigned(FTargetBindSource) and FTargetBindSource.isActive;
    smEntityTypeName:
      Result := not FEntityTypeName.Trim.IsEmpty;
    smEntityTypeNameAsSelector, smEntityTypeNameAsWhereBuilder, smEntityTypeNameAsETM:
      Result := Assigned(FTargetBindSource) and FTargetBindSource.isActive and not FEntityTypeName.Trim.IsEmpty;
  end;
  // // ViewContextBy
  // case FViewContextBy of
  // vcByViewContextProviderName:
  // Result := Result and not FViewContextProviderName.Trim.IsEmpty;
  // vcByViewContextProvider:
  // Result := Result and Assigned(FViewContextProvider);
  // vcByViewContext:
  // Result := Result and Assigned(FViewContext);
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
    raise EioGenericException.Create(ClassName, '_SetTargetBindSource', 'AObj does not implements IioStdActionTargetBindSource interface');
  FIsSlave := False;
  SetTargetBindSource(LTargetBindSource);
  FIsSlave := True;
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

procedure TioBS_ETM_RevertToBindSource._InternalExecuteStdAction;
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

function TioBS_ETM_RevertToBindSource._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource);
  Result := Result and Assigned(TargetBindSource.ETMfor);
  Result := Result and Assigned(TargetBindSource.Current);
  Result := Result and TargetBindSource.ETMfor.isActive;
  Result := Result and Assigned(TargetBindSource.ETMfor.Current);
end;

procedure TioBS_ETM_RevertToBindSource._ShowRevertedObj;
var
  LShowOrSelectAction: TioBSShowOrSelect;
begin
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
  begin
    // Controlla se la ShowOrSelect action è realmente una action di questo tipo
    if not(Action_ShowOrSelectAction is TioBSShowOrSelect) then
      raise EioGenericException.Create(ClassName, '_ShowRevertedObj',
        Format('"Action_ShowOrSelectAction" property is of the wrong type "%s" insitead of "TioBSShowOrSelect".',
        [(Action_ShowOrSelectAction as TObject).ClassName]));
    // Estrae il tipo reale della ShowOrSelect action per poter poi accedere a informazioni che riguardano
    // soprattutto come ottenere un ViewCOntext.
    // NB: Questa azione in realtà non eseguirà la ShowOrSelect action impostata bensì farà una chiamata
    // io.Show... usando le informazioni recuperate.
    LShowOrSelectAction := Action_ShowOrSelectAction as TioBSShowOrSelect;
    case LShowOrSelectAction.ViewContextBy of
      vcByDefaultViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProviderName:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, io.VCProviderByName(LShowOrSelectAction.ViewContextProviderName),
          LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContextProvider, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContext:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContext, LShowOrSelectAction.VVMTypeAlias);
      // vcNone:
      // io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, nil, LShowOrSelectAction.VVMTypeAlias);
    end;
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
end;

procedure TioBS_ETM_RevertToObject._InternalExecuteStdAction;
begin
  inherited;
  // Reset
  FRevertedObj := nil;
  // Some check
  if not(TargetBindSource.Current is TioEtmCustomTimeSlot) then
    raise EioEtmException.Create(ClassName, 'ExecuteTarget', 'Current object in the TargetBindSource is not derived from "TioEtmCustomTimeSlot" base class.');
  // BeforeRevert event handler
  if Assigned(FBeforeRevertEvent) then
    FBeforeRevertEvent(Self, FRevertedObj);
  // Revert (if FRevertedObj is assigned by BeforeRevertEvent then reverto to it)
  if Assigned(FRevertedObj) then
    io.ETM.RevertToObject(FRevertedObj, TargetBindSource.Current as TioEtmCustomTimeSlot, FAutoExec_Persist_AfterRevert)
  else
    FRevertedObj := io.ETM.RevertObject(TargetBindSource.Current as TioEtmCustomTimeSlot, FAutoExec_Persist_AfterRevert);
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

function TioBS_ETM_RevertToObject._InternalUpdateStdAction: Boolean;
begin
  Result := inherited and Assigned(TargetBindSource);
  Result := Result and Assigned(TargetBindSource.ETMfor);
  Result := Result and Assigned(TargetBindSource.Current);
  Result := Result and TargetBindSource.ETMfor.isActive;
  Result := Result and Assigned(TargetBindSource.ETMfor.Current);
end;

procedure TioBS_ETM_RevertToObject._ShowRevertedObj;
var
  LShowOrSelectAction: TioBSShowOrSelect;
begin
  if Assigned(Action_ShowOrSelectAction) and Action_ShowOrSelectAction._IsEnabled then
  begin
    // Controlla se la ShowOrSelect action è realmente una action di questo tipo
    if not(Action_ShowOrSelectAction is TioBSShowOrSelect) then
      raise EioGenericException.Create(ClassName, '_ShowRevertedObj',
        Format('"Action_ShowOrSelectAction" property is of the wrong type "%s" insitead of "TioBSShowOrSelect".',
        [(Action_ShowOrSelectAction as TObject).ClassName]));
    // Estrae il tipo reale della ShowOrSelect action per poter poi accedere a informazioni che riguardano
    // soprattutto come ottenere un ViewCOntext.
    // NB: Questa azione in realtà non eseguirà la ShowOrSelect action impostata bensì farà una chiamata
    // io.Show... usando le informazioni recuperate.
    LShowOrSelectAction := Action_ShowOrSelectAction as TioBSShowOrSelect;
    case LShowOrSelectAction.ViewContextBy of
      vcByDefaultViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProviderName:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, io.VCProviderByName(LShowOrSelectAction.ViewContextProviderName),
          LShowOrSelectAction.VVMTypeAlias);
      vcByViewContextProvider:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContextProvider, LShowOrSelectAction.VVMTypeAlias);
      vcByViewContext:
        io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, LShowOrSelectAction.ViewContext, LShowOrSelectAction.VVMTypeAlias);
      // vcNone:
      // io.Show(FRevertedObj, LShowOrSelectAction.Action_ParentCloseQueryAction, nil, LShowOrSelectAction.VVMTypeAlias);
    end;
  end;
end;

{ TioDoSynchronizationAction }

procedure TioDoSynchronization.Autoexec_OnTimerEventHandler(Sender: TObject);
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

constructor TioDoSynchronization.Create(AOwner: TComponent);
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

destructor TioDoSynchronization.Destroy;
begin
  if Assigned(FAutoexec_Timer) then
    FAutoexec_Timer.Free;
  inherited;
end;

procedure TioDoSynchronization.ExecuteTarget(Target: TObject);
var
  LCanExecute: Boolean;
begin
  inherited;
  // Execute the CanExecute event (ActiveMode only)
  LCanExecute := True;
  if Assigned(FCanExecute) then
    FCanExecute(Self, LCanExecute);
  if not LCanExecute then
    Exit;
  // Execute the BeforeExecute event
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
  // Execute the action
  FTargetSynchroStrategy.DoSynchronization(FSynchroLevel);
  // Execute the AfterExecute event
  if Assigned(FAfterExecute) then
    FAfterExecute(Self);
end;

function TioDoSynchronization.Get_Version: String;
begin
  Result := io.Version;
end;

function TioDoSynchronization.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target);
//  Result := Assigned(Target) and Supports(FTargetSynchroStrategy, IioSynchroStrategy_Client) and
//    FTargetSynchroStrategy.isReady;
end;

procedure TioDoSynchronization.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetSynchroStrategy as TComponent)) then
    FTargetSynchroStrategy := nil;
end;

procedure TioDoSynchronization.SetAutoexec_Enabled(const Value: Boolean);
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

procedure TioDoSynchronization.SetAutoexec_Interval(const ASeconds: Integer);
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

procedure TioDoSynchronization.SetAutoexec_StartDelay(const ASeconds: Integer);
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

procedure TioDoSynchronization.SetTargetSynchroStrategy(const Value: IioSynchroStrategy_Client);
begin
  if @Value <> @FTargetSynchroStrategy then
  begin
    FTargetSynchroStrategy := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioDoSynchronization.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Assigned(FTargetSynchroStrategy) and FTargetSynchroStrategy.isReady;
  // Autoenable/disable the Autoexec_Timer depending on Autoexec_Enabled property value, TargetSynchroStrategy and FAutoexec_Timer both assigned
  if FAutoexec_Enabled and Assigned(FTargetSynchroStrategy) and Assigned(FAutoexec_Timer) and not FAutoexec_Timer.Enabled then
    FAutoexec_Timer.Enabled := Enabled;
end;

end.
