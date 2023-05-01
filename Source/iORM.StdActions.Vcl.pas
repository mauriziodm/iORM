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
    FOnBeforeExecute: TNotifyEvent;
    FOnAfterExecute: TNotifyEvent;
    FOnBeforeUpdate: TNotifyEvent;
    FOnAfterUpdate: TNotifyEvent;
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
    property OnAfterExecute: TNotifyEvent read FOnAfterExecute write FOnAfterExecute;
    property OnAfterUpdate: TNotifyEvent read FOnAfterUpdate write FOnAfterUpdate;
    property OnBeforeExecute: TNotifyEvent read FOnBeforeExecute write FOnBeforeExecute;
    property OnBeforeUpdate: TNotifyEvent read FOnBeforeUpdate write FOnBeforeUpdate;
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
    FTargetBindSource: T;
    function Get_Version: String;
    procedure SetTargetBindSource(const Value: T);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property TargetBindSource: T read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  published
    property _Version: String read Get_Version;
  end;

  // SelectCurrent action to make a selection for a Selector BindSource
  TioBSSelectCurrent = class(TioBSStdActionVcl<IioStdActionTargetBindSource>)
  strict private
    FSelectionType: TioSelectionType;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property SelectionType: TioSelectionType read FSelectionType write FSelectionType default stAppend;
    property TargetBindSource;
  end;

  // Paging NextPage action
  TioBSNextPage = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;

  // Paging PreviousPage action
  TioBSPrevPage = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property TargetBindSource;
  end;

  // WhereBuild
  TioBSWhereBuild = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  strict private
    FWhereAutoExecuteOnTargetBS: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property WhereAutoExecuteOnTargetBS: Boolean read FWhereAutoExecuteOnTargetBS write FWhereAutoExecuteOnTargetBS default True;
    property TargetBindSource;
  end;

  // WhereClear
  TioBSWhereClear = class(TioBSStdActionVcl<IioStdActionTargetMasterBindSource>)
  strict private
    FWhereAutoExecuteOnTargetBS: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  published
    property WhereAutoExecuteOnTargetBS: Boolean read FWhereAutoExecuteOnTargetBS write FWhereAutoExecuteOnTargetBS default False;
    property TargetBindSource;
  end;

  // =================================================================================================
  // END: VCL STANDARD ACTIONS FOR BIND SOURCES
  // =================================================================================================

  // =================================================================================================
  // BEGIN: VCL STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // Base class for all BinsDourceObjState standard actions
  TioBSPersistenceStdActionVcl = class(Vcl.ActnList.TCustomAction)
  strict private
    FClearAfterExecute: Boolean;
    FDisableIfChangesDoesNotExists: Boolean;
    FDisableIfChangesExists: Boolean;
    FDisableIfSaved: Boolean;
    FRaiseIfChangesDoesNotExists: Boolean;
    FRaiseIfChangesExists: Boolean;
    FRaiseIfRevertPointSaved: Boolean;
    FRaiseIfRevertPointNotSaved: Boolean;
    FTargetBindSource: IioBSPersistenceClient;
    function Get_Version: String;
    procedure SetTargetBindSource(const Value: IioBSPersistenceClient);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property ClearAfterExecute: Boolean read FClearAfterExecute write FClearAfterExecute default True;
    property DisableIfChangesDoesNotExists: Boolean read FDisableIfChangesDoesNotExists write FDisableIfChangesDoesNotExists default False;
    property DisableIfChangesExists: Boolean read FDisableIfChangesExists write FDisableIfChangesExists default False;
    property DisableIfSaved: Boolean read FDisableIfSaved write FDisableIfSaved default False;
    property RaiseIfChangesDoesNotExists: Boolean read FRaiseIfChangesDoesNotExists write FRaiseIfChangesDoesNotExists default False;
    property RaiseIfChangesExists: Boolean read FRaiseIfChangesExists write FRaiseIfChangesExists default True;
    property RaiseIfRevertPointSaved: Boolean read FRaiseIfRevertPointSaved write FRaiseIfRevertPointSaved default False;
    property RaiseIfRevertPointNotSaved: Boolean read FRaiseIfRevertPointNotSaved write FRaiseIfRevertPointNotSaved default False;
    property TargetBindSource: IioBSPersistenceClient read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  published
    property _Version: String read Get_Version;
    //  Publishing ancestor properties
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
    property ShortCut  default 0;
    property Visible;
    // Events
//    property OnExecute;
//    property OnHint;
//    property OnUpdate;
  end;

  TioBSPersistenceSaveRevertPoint = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
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
    procedure UpdateTarget (Target: TObject); override;
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
    procedure UpdateTarget (Target: TObject); override;
  published
//    property ClearAfterExecute; // Eliminata perchè poteva interferire con TioVMActionBSCloseQuery
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
    procedure UpdateTarget (Target: TObject); override;
  published
//    property ClearAfterExecute; // Eliminata perchè poteva interferire con TioVMActionBSCloseQuery
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
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
//    property ClearAfterExecute; // Eliminata perchè poteva interferire con TioVMActionBSCloseQuery
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
    procedure UpdateTarget (Target: TObject); override;
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

  TioBSPersistenceReload = class(TioBSPersistenceStdActionVcl)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
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
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property DisableIfSaved;
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
    FOnNewInstanceAsObject: TioStdActionNewInstanceAsObjectEvent;
    FOnNewInstanceAsInterface: TioStdActionNewInstanceAsInterfaceEvent;
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property DisableIfChangesExists;
    property DisableIfSaved;
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

  TioBSCloseQuery = class(TioBSPersistenceStdActionVcl, IioBSCloseQueryAction)
  strict private
    FExecuting, FExecutingEventHandler: Boolean;
    FInjectEventHandler: Boolean;
    FInternalExecutionMode: TioCloseQueryActionExecutionMode;
    FOnCloseQuery: TCloseQueryEvent;
    FOnConfirmationRequest: TioBSCloseQueryConfirmationRequestEvent;
    FOnEditingAction: TioBSCloseQueryOnEditingAction;
    FOnExecuteAction: TioBSCloseQueryOnExecuteAction;
    FOnUpdateScope: TioBSCloseQueryActionUpdateScope;
    [weak]
    FParentCloseQueryAction: IioBSCloseQueryAction;
    procedure _InjectEventHandler;
    function _CanClose: Boolean;
    function _IsChildOf(const ATargetQueryAction: IioBSCloseQueryAction): Boolean;
    // InternalExecutionMode
    function GetInternalExecutionMode: TioCloseQueryActionExecutionMode;
    procedure SetInternalExecutionMode(const Value: TioCloseQueryActionExecutionMode);
    // ParentCloseQueryAction
    function GetParentCloseQueryAction: IioBSCloseQueryAction;
    procedure SetParentCloseQueryAction(const Value: IioBSCloseQueryAction);
  strict protected
    procedure _DummyOnExecute(Sender: TObject);
    procedure Loaded; override;
    function DoOnConfirmationRequest: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
    property InternalExecutionMode: TioCloseQueryActionExecutionMode read GetInternalExecutionMode write SetInternalExecutionMode;
    function Execute: Boolean; override;
    function Executing: Boolean;
    property ParentCloseQueryAction: IioBSCloseQueryAction read GetParentCloseQueryAction write SetParentCloseQueryAction;
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    property InjectEventHandler: Boolean read FInjectEventHandler write FInjectEventHandler default True;
    property OnEditingAction: TioBSCloseQueryOnEditingAction read FOnEditingAction write FOnEditingAction default eaDisable;
    property OnExecuteAction: TioBSCloseQueryOnExecuteAction read FOnExecuteAction write FOnExecuteAction default eaClose;
    property OnUpdateScope: TioBSCloseQueryActionUpdateScope read FOnUpdateScope write FOnUpdateScope default usLocal;
    property TargetBindSource;
    // Events
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnConfirmationRequest: TioBSCloseQueryConfirmationRequestEvent read FOnConfirmationRequest write FOnConfirmationRequest;
    property OnHint;
  end;

  // =================================================================================================
  // END: VCL STANDARD ACTIONS FOR BIND SOURCES WITH PERSISTENCE PROPERTY (MASTER BIND SOURCES ONLY)
  // =================================================================================================

  // =================================================================================================
  // BEGIN: VCL STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

  TioShowBy = (byBSCurrent, byBSEach, byEntityTypeName, byVVMTypeName);
  TioViewContextBy = (vcByDefaultViewContextProvider, vcByViewContextProviderName, vcByViewContextProvider, vcByViewContext);

  // ShowCurrent action to show the current object of the BS
  TioShowAction = class(Vcl.ActnList.TAction)
  strict private
    FFromBS: IioStdActionTargetBindSource;
    FParentCloseQueryAction: IioBSCloseQueryAction;
    FShowBy: TioShowBy;
    FSelectorForBS: IioStdActionTargetBindSource;
    FTypeAlias: String;
    FTypeName: String;
    FViewContext: TComponent;
    FViewContextBy: TioViewContextBy;
    FViewContextProvider: TioViewContextProvider;
    FViewContextProviderName: String;
    function Get_Version: String;
    procedure SetFromBS(const Value: IioStdActionTargetBindSource);
    procedure SetParentCloseQueryAction(const Value: IioBSCloseQueryAction);
    procedure SetSelectorForBS(const Value: IioStdActionTargetBindSource);
    procedure SetViewContext(const Value: TComponent);
    procedure SetViewContextProvider(const Value: TioViewContextProvider);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget (Target: TObject); override;
  published
    property _Version: String read Get_Version;
    property FromBS: IioStdActionTargetBindSource read FFromBS write SetFromBS;
    property ParentCloseQueryAction: IioBSCloseQueryAction read FParentCloseQueryAction write SetParentCloseQueryAction;
    property ShowBy: TioShowBy read FShowBy write FShowBy;
    property SelectorForBS: IioStdActionTargetBindSource read FSelectorForBS write SetSelectorForBS;
    property TypeAlias: String read FTypeAlias write FTypeAlias;
    property TypeName: String read FTypeName write FTypeName;
    property ViewContext: TComponent read FViewContext write SetViewContext;
    property ViewContextBy: TioViewContextBy read FViewContextBy write FViewContextBy;
    property ViewContextProvider: TioViewContextProvider read FViewContextProvider write SetViewContextProvider;
    property ViewContextProviderName: String read FViewContextProviderName write FViewContextProviderName;
  end;

  // =================================================================================================
  // END: VCL STANDARD ACTIONS TO SHOW AN OBJECT
  // =================================================================================================

implementation

uses
  System.SysUtils, iORM.Exceptions, iORM.Utilities, iORM, System.Rtti,
  iORM.RttiContext.Factory, iORM.StdActions.CloseQueryActionRegister;

{ TioBSObjStateStdAction }

constructor TioBSPersistenceStdActionVcl.Create(AOwner: TComponent);
begin
  inherited;
  // Copied from TAction.Create
  DisableIfNoHandler := True;
  // New fields
  FClearAfterExecute := True;
  FDisableIfChangesDoesNotExists := False;
  FDisableIfChangesExists := False;
  FDisableIfSaved := False;
  FRaiseIfChangesDoesNotExists := False;
  FRaiseIfChangesExists := True;
  FRaiseIfRevertPointSaved := False;
  FRaiseIfRevertPointNotSaved := False;
end;

function TioBSPersistenceStdActionVcl.Get_Version: String;
begin
  Result := io.Version;
end;

function TioBSPersistenceStdActionVcl.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, IioBSPersistenceClient) and FTargetBindSource.isActive;
end;

procedure TioBSPersistenceStdActionVcl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
end;

procedure TioBSPersistenceStdActionVcl.SetTargetBindSource(const Value: IioBSPersistenceClient);
begin
  if Value <> FTargetBindSource then
  begin
    FTargetBindSource := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

{ TioBSObjStateRevert }

procedure TioBSPersistenceRevert.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Revert(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists, ClearAfterExecute);
end;

procedure TioBSPersistenceRevert.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevert;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSPersistenceRevertOrDelete }

procedure TioBSPersistenceRevertOrDelete.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.RevertOrDelete(RaiseIfRevertPointNotSaved, RaiseIfChangesDoesNotExists, ClearAfterExecute);
end;

procedure TioBSPersistenceRevertOrDelete.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanRevertOrDelete;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged or TargetBindSource.Persistence.IsInserting);
end;

{ TioBSObjStatePersist }

procedure TioBSPersistencePersist.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Refresh(True); // Otherwise, in some cases, an outdated value persisted
  TargetBindSource.Persistence.Persist(RaiseIfChangesDoesNotExists, ClearAfterExecute);
end;

procedure TioBSPersistencePersist.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanPersist;
  Enabled := Enabled and ((not DisableIfChangesDoesNotExists) or TargetBindSource.Persistence.IsChanged);
end;

{ TioBSObjStateSave }

procedure TioBSPersistenceSaveRevertPoint.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.SaveRevertPoint(True);
end;

procedure TioBSPersistenceSaveRevertPoint.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanSaveRevertPoint;
end;

{ TioBSObjStateClear }

procedure TioBSPersistenceClear.ExecuteTarget(Target: TObject);
begin
  TargetBindSource.Persistence.Clear(RaiseIfChangesExists);
end;

procedure TioBSPersistenceClear.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanClear;
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
end;

procedure TioBSPersistenceDelete.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanDelete;
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
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanReload;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceAppend }

constructor TioBSPersistenceAppend.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceAppend.ExecuteTarget(Target: TObject);
var
  LNewInstanceAsObject: TObject;
  LNewInstanceAsInterface: IInterface;
begin
  inherited;
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
  // New instance not provided (created by the ABSAdapter itself)
  TargetBindSource.Persistence.Append(RaiseIfRevertPointSaved, RaiseIfChangesExists);
end;

procedure TioBSPersistenceAppend.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSPersistenceInsert }

constructor TioBSPersistenceInsert.Create(AOwner: TComponent);
begin
  inherited;
  RaiseIfChangesExists := False;
end;

procedure TioBSPersistenceInsert.ExecuteTarget(Target: TObject);
var
  LNewInstanceAsObject: TObject;
  LNewInstanceAsInterface: IInterface;
begin
  inherited;
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
  // New instance not provided (created by the ABSAdapter itself)
  TargetBindSource.Persistence.Insert(RaiseIfRevertPointSaved, RaiseIfChangesExists);
end;

procedure TioBSPersistenceInsert.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := Assigned(TargetBindSource) and TargetBindSource.Persistence.CanInsert;
  Enabled := Enabled and ((not DisableIfChangesExists) or not TargetBindSource.Persistence.IsChanged);
  Enabled := Enabled and ((not DisableIfSaved) or not TargetBindSource.Persistence.IsSavedRevertPoint);
end;

{ TioBSSelectCurrent }

constructor TioBSSelectCurrent.Create(AOwner: TComponent);
begin
  inherited;
  FSelectionType := stAppend;
end;

procedure TioBSSelectCurrent.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.SelectCurrent(FSelectionType);
end;

procedure TioBSSelectCurrent.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.CanDoSelection;
end;

{ TioBSStdActionVcl<T> }

constructor TioBSStdActionVcl<T>.Create(AOwner: TComponent);
begin
  inherited;
  FTargetBindSource := nil;
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
    TargetBindSource := nil;
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

{ TioBSNextPage }

procedure TioBSNextPage.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.Paging.NextPage;
end;

procedure TioBSNextPage.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.IsActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsLastPage;
end;

{ TioBSPreviousPage }

procedure TioBSPrevPage.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.Paging.PrevPage;
end;

procedure TioBSPrevPage.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.IsActive and TargetBindSource.Paging.Enabled and not TargetBindSource.Paging.IsFirstPage;
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
  if Assigned(FOnAfterExecute) then
    FOnAfterExecute(Self);
end;

procedure TioViewAction.DoAfterUpdate;
begin
  if Assigned(FOnAfterUpdate) then
    FOnAfterUpdate(Self);
end;

procedure TioViewAction.DoBeforeExecute;
begin
  if Assigned(FOnBeforeExecute) then
    FOnBeforeExecute(Self);
end;

procedure TioViewAction.DoBeforeUpdate;
begin
  if Assigned(FOnBeforeUpdate) then
    FOnBeforeUpdate(Self);
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
    if FCaptionLinkedToVMAction and not (csDesigning in ComponentState) then
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
    if FEnabledLinkedToVMAction and not (csDesigning in ComponentState) then
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
    if FVisibleLinkedToVMAction and not (csDesigning in ComponentState) then
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
  Result := FVmAction;
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
//  OnExecute := _DummyOnExecute; // Set the dummy OnExecute event handler // NB: Nella versione VCL causa problemi
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

procedure TioBSCloseQuery.SetInternalExecutionMode(const Value: TioCloseQueryActionExecutionMode);
begin
  FInternalExecutionMode := Value;
end;

procedure TioBSCloseQuery.SetParentCloseQueryAction(const Value: IioBSCloseQueryAction);
begin
  FParentCloseQueryAction := Value;
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
      //      quindi esegue prima le ChildCQA e poi se stessa
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

function TioBSCloseQuery.GetInternalExecutionMode: TioCloseQueryActionExecutionMode;
begin
  Result := FInternalExecutionMode;
end;

function TioBSCloseQuery.GetParentCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := FParentCloseQueryAction;
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

function TioBSCloseQuery._CanClose: Boolean;
begin
  Result := (TargetBindSource = nil) or TargetBindSource.Persistence.IsEmpty or TargetBindSource.Persistence.CanSaveRevertPoint or (FOnEditingAction <> eaDisable);
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

constructor TioBSWhereBuild.Create(AOwner: TComponent);
begin
  inherited;
  FWhereAutoExecuteOnTargetBS := True;
end;

procedure TioBSWhereBuild.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.WhereBuild(FWhereAutoExecuteOnTargetBS);
end;

procedure TioBSWhereBuild.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.isActive;
end;

{ TioBSWhereClear }

constructor TioBSWhereClear.Create(AOwner: TComponent);
begin
  inherited;
  FWhereAutoExecuteOnTargetBS := False;
end;

procedure TioBSWhereClear.ExecuteTarget(Target: TObject);
begin
  inherited;
  TargetBindSource.WhereClear(FWhereAutoExecuteOnTargetBS);
end;

procedure TioBSWhereClear.UpdateTarget(Target: TObject);
begin
  inherited;
  Enabled := TargetBindSource.isActive;
end;

{ TioShowAction }

constructor TioShowAction.Create(AOwner: TComponent);
begin
  inherited;
  FFromBS := nil;
  FParentCloseQueryAction := nil;
  FShowBy := TioShowBy.byBSCurrent;
  FSelectorForBS := nil;
  FTypeAlias := '';
  FTypeName := '';
  FViewContext := nil;
  FViewContextBy := TioViewContextBy.vcByDefaultViewContextProvider;
  FViewContextProvider := nil;
  FViewContextProviderName := '';
end;

procedure TioShowAction.ExecuteTarget(Target: TObject);
begin
  inherited;

end;

function TioShowAction.Get_Version: String;
begin
  Result := io.Version;
end;

function TioShowAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target);
end;

procedure TioShowAction.UpdateTarget(Target: TObject);
begin
  inherited;
  // ShowBy
  case FShowBy of
    byBSCurrent, byBSEach:  
      Enabled := Enabled and assigned(FFromBS) and FFromBS.IsActive;
    byEntityTypeName, byVVMTypeName:
      Enabled := Enabled and not FTypeName.Trim.IsEmpty;
  end;
  // ViewContextBy
  case FViewContextBy of
    vcByViewContextProviderName:  
      Enabled := Enabled and not FViewContextProviderName.Trim.IsEmpty;
    vcByViewContextProvider:
      Enabled := Enabled and Assigned(FViewContextProvider);
    vcByViewContext:
      Enabled := Enabled and Assigned(FViewContext);
  end;
end;

procedure TioShowAction.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent = (FFromBS as TComponent)) then
      FFromBS := nil
    else
    if (AComponent = (FParentCloseQueryAction as TComponent)) then
      FParentCloseQueryAction := nil
    else
    if (AComponent = (FSelectorForBS as TComponent)) then
      FSelectorForBS := nil
    else
    if (AComponent = (FViewContext as TComponent)) then
      FViewContext := nil
    else
    if (AComponent = (FViewContextProvider as TComponent)) then
      FViewContextProvider:= nil;
  end;
end;

procedure TioShowAction.SetFromBS(const Value: IioStdActionTargetBindSource);
begin
  if Value <> FFromBS then
  begin
    FFromBS := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioShowAction.SetParentCloseQueryAction(const Value: IioBSCloseQueryAction);
begin
  if Value <> FParentCloseQueryAction then
  begin
    FParentCloseQueryAction := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioShowAction.SetSelectorForBS(const Value: IioStdActionTargetBindSource);
begin
  if Value <> FSelectorForBS then
  begin
    FSelectorForBS := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioShowAction.SetViewContext(const Value: TComponent);
begin
  if Value <> FViewContext then
  begin
    FViewContext := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

procedure TioShowAction.SetViewContextProvider(const Value: TioViewContextProvider);
begin
  if Value <> FViewContextProvider then
  begin
    FViewContextProvider := Value;
    if Value <> nil then
      (Value as TComponent).FreeNotification(Self);
  end;
end;

end.
