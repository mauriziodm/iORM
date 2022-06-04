unit iORM.MVVM.VMAction;

interface

uses
  System.Classes, System.Generics.Collections, iORM.MVVM.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.CommonTypes;

type

  // =================================================================================================
  // BEGIN: MVVM BASE VIEW MODEL ACTION
  // =================================================================================================

  TioVMActionCustom = class (TComponent, IioVMAction)
  strict private
    FBindedViewActionsContainer: TList<IioViewAction>;
    FCaption: String;
    FEnabled: Boolean;
    FVisible: Boolean;
    FOnExecute: TNotifyEvent;
    FOnUpdate: TNotifyEvent;
    procedure _InternalExecute; virtual;
    procedure _InternalUpdate; virtual;
  strict protected
    procedure _InternalExecuteStdAction; virtual;
    procedure _InternalUpdateStdAction; virtual;
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure UnbindViewAction(const AViewAction: IioViewAction);
    procedure UnbindAllViewActions;
    // Caption property
    procedure SetCaption(const Value: String);
    function GetCaption: String;
    property Caption: String read GetCaption write SetCaption;
    // Enabled property
    procedure SetEnabled(const Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled default True;
    // Name property
    procedure SetName(const Value: TComponentName); reintroduce;
    function GetName: TComponentName;
    property Name: TComponentName read GetName write SetName;
    // Owner
    function GetOwnerComponent: TComponent;
    property Owner: TComponent read GetOwnerComponent;
    // Visible property
    procedure SetVisible(const Value: Boolean);
    function GetVisible: Boolean;
    property Visible: Boolean read GetVisible write SetVisible default True;
    // Events
    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; virtual;
    function Execute: Boolean;
    function Update: Boolean;
  end;

  TioVMAction = class(TioVMActionCustom)
  public
    property Owner: TComponent read GetOwnerComponent;
  published
    // Properties
    property Caption;
    property Enabled;
    property Name;
    property Visible;
    // Events
    property OnExecute;
    property OnUpdate;
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
    procedure SetTargetBindSource(const Value: T);
  strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property TargetBindSource: T read FTargetBindSource write SetTargetBindSource;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    property Owner: TComponent read GetOwnerComponent;
  published
    property Caption;
    property Enabled;
    property Name;
    property Visible;
    // Events
    property OnExecute;
    property OnUpdate;
  end;

  // SelectCurrent action to make a selection for a Selector BindSource
  TioVMActionBSSelectCurrent = class(TioVMActionBSCustom<IioStdActionTargetBindSource>)
  strict private
    FSelectionType: TioSelectionType;
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property SelectionType: TioSelectionType read FSelectionType write FSelectionType default stAppend;
  end;

  // Paging NextPage action
  TioVMActionBSNextPage = class(TioVMActionBSCustom<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    property TargetBindSource;
  end;
  // Paging PreviousPage action
  TioVMActionBSPrevPage = class(TioVMActionBSCustom<IioStdActionTargetMasterBindSource>)
  strict protected
    procedure _InternalExecuteStdAction; override;
    procedure _InternalUpdateStdAction; override;
  published
    property TargetBindSource;
  end;

  // =================================================================================================
  // END: MVVM STANDARD VMACTIONS FOR BIND SOURCES
  // =================================================================================================


implementation

uses
  System.SysUtils, iORM.Utilities;

{ TioVMActionCustom }

constructor TioVMActionCustom.Create(AOwner: TComponent);
begin
  inherited;
  FEnabled := True;
  FVisible := True;
  FBindedViewActionsContainer := TList<IioViewAction>.Create;
end;

destructor TioVMActionCustom.Destroy;
begin
  UnbindAllViewActions;
  FBindedViewActionsContainer.Free;
  inherited;
end;

function TioVMActionCustom.Execute: Boolean;
var
  LViewAction: IioViewAction;
begin
   // Execute the ViewAction.onBeforeExecute event
  for LViewAction in FBindedViewActionsContainer do
    LViewAction.DoBeforeExecute;
  // Execute the VMAction.onExecute event if assigned (or a standard action)
  _InternalExecute;
  // Execute the ViewAction.onAfterExecute event
  for LViewAction in FBindedViewActionsContainer do
    LViewAction.DoAfterExecute;
  // It's all right
  Result := True;
end;

function TioVMActionCustom.GetCaption: String;
begin
  Result := FCaption;
end;

function TioVMActionCustom.GetEnabled: Boolean;
begin
  Result := FEnabled;
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

function TioVMActionCustom.HandlesTarget(Target: TObject): Boolean;
begin
  Result := False;
end;

function TioVMActionCustom.Update: Boolean;
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
  // It's all right
  Result := True;
end;

procedure TioVMActionCustom._InternalExecute;
begin
  // Execute the VMAction.onExecute event if assigned
  if Assigned(FOnExecute) then
    FOnExecute(Self)
  else
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

procedure TioVMActionCustom.BindViewAction(const AViewAction: IioViewAction);
begin
  FBindedViewActionsContainer.Add(AViewAction);
  AViewAction.VMAction := Self;
  // Propagate Caption/Enabled/Visible to the new registered ViewAction if linked
  if AViewAction.CaptionLinkedToVMAction then
    AViewAction.Caption := FCaption;
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

procedure TioVMActionCustom.SetCaption(const Value: String);
var
  LViewAction: IioViewAction;
begin
  if Value <> FCaption then
  begin
    FCaption := Value;
    for LViewAction in FBindedViewActionsContainer do
      if LViewAction.CaptionLinkedToVMAction then
        LViewAction.Caption := Value;
  end;
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

function TioVMActionBSCustom<T>.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(Target) and Supports(FTargetBindSource, TioUtilities.TypeInfoToGUID(TypeInfo(T))) and FTargetBindSource.isActive;
end;

procedure TioVMActionBSCustom<T>.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = (FTargetBindSource as TComponent)) then
    TargetBindSource := nil;
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

{ TioBSSelectCurrentVMAction }

constructor TioVMActionBSSelectCurrent.Create(AOwner: TComponent);
begin
  inherited;
  FSelectionType := stAppend;
end;

procedure TioVMActionBSSelectCurrent._InternalExecuteStdAction;
begin
  inherited;
  TargetBindSource.SelectCurrent(FSelectionType);
end;

procedure TioVMActionBSSelectCurrent._InternalUpdateStdAction;
begin
  inherited;
  Enabled := TargetBindSource.CanDoSelection;
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

end.
