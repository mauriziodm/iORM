unit iORM.MVVM.Actions.VM;

interface

uses
  System.Classes, iORM.MVVM.Actions.Interfaces, System.Generics.Collections;

type

  TioVMActionCustom = class(TComponent, IioVMAction)
  private
    FBindedViewActions: TList<IioViewAction>;
    FCaption: String;
    FEnabled: Boolean;
    FVisible: Boolean;
    FOnExecute: TNotifyEvent;
    FOnUpdate: TNotifyEvent;
  protected
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
  UnbindAllViewActions;
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

function TioVMActionCustom.GetCaption: String;
begin
  Result := FCaption;
end;

function TioVMActionCustom.GetEnabled: Boolean;
begin
  Result := FEnabled;
end;

function TioVMActionCustom.GetVisible: Boolean;
begin
  Result := FVisible;
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

procedure TioVMActionCustom.BindViewAction(const AViewAction: IioViewAction);
begin
  FBindedViewActions.Add(AViewAction);
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
  FBindedViewActions.Remove(AViewAction);
  AViewAction.VMAction := nil;
end;

procedure TioVMActionCustom.UnbindAllViewActions;
var
  I: Integer;
begin
  for I := FBindedViewActions.Count-1 downto 0 do
    UnbindViewAction(FBindedViewActions[I]);
end;

procedure TioVMActionCustom.SetCaption(const Value: String);
var
  LViewAction: IioViewAction;
begin
  if Value <> FCaption then
  begin
    FCaption := Value;
    for LViewAction in FBindedViewActions do
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
    for LViewAction in FBindedViewActions do
      if LViewAction.EnabledLinkedToVMAction then
        LViewAction.Enabled := Value;
  end;
end;

procedure TioVMActionCustom.SetVisible(const Value: Boolean);
var
  LViewAction: IioViewAction;
begin
  if Value <> FVisible then
  begin
    FVisible := Value;
    for LViewAction in FBindedViewActions do
      if LViewAction.VisibleLinkedToVMAction then
        LViewAction.Visible := Value;
  end;
end;

end.
