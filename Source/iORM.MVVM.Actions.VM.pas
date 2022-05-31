unit iORM.MVVM.Actions.VM;

interface

uses
  System.Classes, iORM.MVVM.Actions.Interfaces, System.Generics.Collections;

type

  TioVMActionCustom = class(TComponent)
  private
    FBindedViewActions: TList<IioViewAction>;
    FEnabled: Boolean;
    FVisible: Boolean;
    FOnExecute: TNotifyEvent;
    FOnUpdate: TNotifyEvent;
    procedure SetEnabled(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
  protected
    // IioBindedViewActionRegister interface
    procedure RegisterViewAction(const AViewAction: IioViewAction);
    procedure UnregisterViewAction(const AViewAction: IioViewAction);
    // Properties
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Visible: Boolean read FVisible write SetVisible default True;
    // Events
    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
    property OnUpdate: TNotifyEvent read FOnUpdate write FOnUpdate;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
    function Update: Boolean;
  end;

  TioVMAction = class(TioVMActionCustom)
  public
    // Properties
    property Enabled;
    property Visible;
    // Events
    property OnExecute;
    property OnUpdate;
  end;

implementation

{ TioVMActionCustom }

constructor TioVMActionCustom.Create(AOwner: TComponent);
begin
  inherited;
  FEnabled := True;
  FVisible := True;
  FBindedViewActions := TList<IioViewAction>.Create;
end;

destructor TioVMActionCustom.Destroy;
begin
  FBindedViewActions.Free;
  inherited;
end;

function TioVMActionCustom.Execute: Boolean;
var
  LViewAction: IioViewAction;
begin
   // Execute the ViewAction.onBeforeExecute event
  for LViewAction in FBindedViewActions do
    LViewAction.DoBeforeExecute;
  // Execute the VMAction.onExecute event
  if Assigned(FOnExecute) then
    FOnExecute(Self);
  // Execute the ViewAction.onAfterExecute event
  for LViewAction in FBindedViewActions do
    LViewAction.DoAfterExecute;
  // It's all right
  Result := True;
end;

function TioVMActionCustom.Update: Boolean;
var
  LViewAction: IioViewAction;
begin
  // Execute the ViewAction.onBeforeUpdate event
  for LViewAction in FBindedViewActions do
    LViewAction.DoBeforeUpdate;
  // Execute the VMAction.onUpdate event
  if Assigned(FOnUpdate) then
    FOnUpdate(Self);
  // Execute the ViewAction.onAfterUpdatee event
  for LViewAction in FBindedViewActions do
    LViewAction.DoAfterUpdate;
  // It's all right
  Result := True;
end;

procedure TioVMActionCustom.RegisterViewAction(const AViewAction: IioViewAction);
begin
  FBindedViewActions.Add(AViewAction);
end;

procedure TioVMActionCustom.SetEnabled(const Value: Boolean);
var
  LViewAction: IioViewAction;
begin
  if Value <> FEnabled then
    for LViewAction in FBindedViewActions do
      LViewAction.Enabled := Value;
end;

procedure TioVMActionCustom.SetVisible(const Value: Boolean);
var
  LViewAction: IioViewAction;
begin
  if Value <> FVisible then
    for LViewAction in FBindedViewActions do
      LViewAction.Visible := Value;
end;

procedure TioVMActionCustom.UnregisterViewAction(const AViewAction: IioViewAction);
begin
  FBindedViewActions.Remove(AViewAction);
end;

end.
