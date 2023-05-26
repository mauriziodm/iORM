unit iORM.Abstraction.uniGUI;

interface

uses
  System.Classes, iORM.Abstraction, uniTimer, Vcl.ActnList, System.Rtti;

type
  TioUniGUI = class(TComponent)
  strict private
    function Get_Version: String;
  published
    property _Version: String read Get_Version;
  end;

  TioApplicationUniGUI = class(TioApplication)
  protected
    class procedure _HandleException(const Sender: TObject); override;
    class procedure _ShowMessage(const AMessage: string); override;
    class function _Terminate: Boolean; override;
  end;

  TioControlUniGUI = class(TioControl)
  protected
    class procedure _SetParent(const AControl, AParent: TObject); override;
    class procedure _SetVisible(const AControl: TObject; const AVisible: Boolean); override;
  end;

  TioTimerUniGUI = class(TioTimer)
  private
    FInternalTimer: TUniTimer;
  protected
    function GetEnabled: Boolean; override;
    function GetInterval: Cardinal; override;
    function GetOnTimer: TNotifyEvent; override;
    function GetTag: Integer; override;
    procedure SetEnabled(const Value: Boolean); override;
    procedure SetInterval(const Value: Cardinal); override;
    procedure SetOnTimer(const Value: TNotifyEvent); override;
    procedure SetTag(const Value: Integer); override;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TioActionUniGUI = class(TioAction)
  private
    FInternalAction: TAction;
  protected
    class function _CreateNewAction(const AOwner:TComponent): TioAction; override;
    class function _CreateNewAction(const AOwner:TComponent; const AAction: TObject): TioAction; override;
    class function _IsValid(const AField: TRttiField): Boolean; override;
    function GetCaption: string; override;
    function GetChecked: boolean; override;
    function GetEnabled: boolean; override;
    function GetGroupIndex: integer; override;
    function GetHint: string; override;
    function GetImageIndex: integer; override;
    function GetName: TComponentName; override;
    function GetVisible: boolean; override;
    function GetOnExecute: TNotifyEvent; override;
    function GetOnHint: THintEvent; override;
    function GetOnUpdate: TNotifyEvent; override;
    procedure SetCaption(const Value: string); override;
    procedure SetChecked(const Value: boolean); override;
    procedure SetEnabled(const Value: boolean); override;
    procedure SetGroupIndex(const Value: integer); override;
    procedure SetHint(const Value: string); override;
    procedure SetImageIndex(const Value: integer); override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetVisible(const Value: boolean); override;
    procedure SetOnExecute(const Value: TNotifyEvent); override;
    procedure SetOnHint(const Value: THintEvent); override;
    procedure SetOnUpdate(const Value: TNotifyEvent); override;
  public
    constructor Create(AOwner: TComponent); reintroduce; overload;
    constructor Create(AOwner: TComponent; const AAction: TObject); reintroduce; overload;
    function Execute: Boolean; override;
    function AsTValue: TValue; override;
  end;

implementation

uses
  iORM, Vcl.Forms, Vcl.Dialogs, iORM.Exceptions, Vcl.Controls;

{ TioUniGUI }

function TioUniGUI.Get_Version: String;
begin
  Result := io.Version;
end;

{ TioApplicationUniGUI }

class procedure TioApplicationUniGUI._HandleException(const Sender: TObject);
begin
  Application.HandleException(Sender);
end;

class procedure TioApplicationUniGUI._ShowMessage(const AMessage: string);
begin
  Vcl.Dialogs.ShowMessage(AMessage);
end;

class function TioApplicationUniGUI._Terminate: Boolean;
begin
  Result := True;
  Application.Terminate;
end;

{ TioControlUniGUI }

class procedure TioControlUniGUI._SetParent(const AControl, AParent: TObject);
begin
  inherited;
  if not (AControl is TControl) then
    raise EioException.Create(Self.ClassName, '_SetParent', 'AControl must descend from TControl.');
  if not (AParent is TWinControl) then
    raise EioException.Create(Self.ClassName, '_SetParent', 'AParent must descend from TWinControl.');
  TControl(AControl).Parent := TWinControl(AParent);
end;

class procedure TioControlUniGUI._SetVisible(const AControl: TObject; const AVisible: Boolean);
begin
  inherited;
  if not (AControl is TControl) then
    raise EioException.Create(Self.ClassName, '_SetParent', 'AControl must descend from TControl.');
  TControl(AControl).Visible := AVisible;
end;

{ TioTimerUniGUI }

constructor TioTimerUniGUI.Create;
begin
  inherited;
  FInternalTimer := TUniTimer.Create(nil);
end;

destructor TioTimerUniGUI.Destroy;
begin
  FInternalTimer.Free;
  inherited;
end;

function TioTimerUniGUI.GetEnabled: Boolean;
begin
  Result := FInternalTimer.Enabled;
end;

function TioTimerUniGUI.GetInterval: Cardinal;
begin
  Result := FInternalTimer.Interval;
end;

function TioTimerUniGUI.GetOnTimer: TNotifyEvent;
begin
  Result := FInternalTimer.OnTimer;
end;

function TioTimerUniGUI.GetTag: Integer;
begin
  Result := FInternalTimer.Tag;
end;

procedure TioTimerUniGUI.SetEnabled(const Value: Boolean);
begin
  FInternalTimer.Enabled := Value;
end;

procedure TioTimerUniGUI.SetInterval(const Value: Cardinal);
begin
  FInternalTimer.Interval := Value;
end;

procedure TioTimerUniGUI.SetOnTimer(const Value: TNotifyEvent);
begin
  FInternalTimer.OnTimer := Value;
end;

procedure TioTimerUniGUI.SetTag(const Value: Integer);
begin
  FInternalTimer.Tag := Value;
end;

{ TioActionUniGUI }

function TioActionUniGUI.AsTValue: TValue;
begin
  Result := TValue.From<TAction>(FInternalAction);
end;

constructor TioActionUniGUI.Create(AOwner: TComponent);
begin
  inherited;
  FInternalAction := TAction.Create(AOwner);
end;

constructor TioActionUniGUI.Create(AOwner: TComponent; const AAction: TObject);
begin
  inherited Create(AOwner);
  FInternalAction := AAction as TAction;
end;

function TioActionUniGUI.Execute: Boolean;
begin
  Result := FInternalAction.Execute;
end;

function TioActionUniGUI.GetCaption: string;
begin
  Result := FInternalAction.Caption;
end;

function TioActionUniGUI.GetChecked: boolean;
begin
  Result := FInternalAction.Checked;
end;

function TioActionUniGUI.GetEnabled: boolean;
begin
  Result := FInternalAction.Enabled;
end;

function TioActionUniGUI.GetGroupIndex: integer;
begin
  Result := FInternalAction.GroupIndex;
end;

function TioActionUniGUI.GetHint: string;
begin
  Result := FInternalAction.Hint;
end;

function TioActionUniGUI.GetImageIndex: integer;
begin
  Result := FInternalAction.ImageIndex;
end;

function TioActionUniGUI.GetName: TComponentName;
begin
  Result := FInternalAction.Name;
end;

function TioActionUniGUI.GetOnExecute: TNotifyEvent;
begin
  Result := FInternalAction.OnExecute;
end;

function TioActionUniGUI.GetOnHint: THintEvent;
begin
  Result := FInternalAction.OnHint;
end;

function TioActionUniGUI.GetOnUpdate: TNotifyEvent;
begin
  Result := FInternalAction.OnUpdate;
end;

function TioActionUniGUI.GetVisible: boolean;
begin
  Result := FInternalAction.Visible;
end;

procedure TioActionUniGUI.SetCaption(const Value: string);
begin
  FInternalAction.Caption := Value;
end;

procedure TioActionUniGUI.SetChecked(const Value: boolean);
begin
  FInternalAction.Checked := Value;
end;

procedure TioActionUniGUI.SetEnabled(const Value: boolean);
begin
  FInternalAction.Enabled := Value;
end;

procedure TioActionUniGUI.SetGroupIndex(const Value: integer);
begin
  FInternalAction.GroupIndex := Value;
end;

procedure TioActionUniGUI.SetHint(const Value: string);
begin
  FInternalAction.Hint := Value;
end;

procedure TioActionUniGUI.SetImageIndex(const Value: integer);
begin
  FInternalAction.ImageIndex := Value;
end;

procedure TioActionUniGUI.SetName(const Value: TComponentName);
begin
  FInternalAction.Name := Value;
end;

procedure TioActionUniGUI.SetOnExecute(const Value: TNotifyEvent);
begin
  FInternalAction.OnExecute := Value;
end;

procedure TioActionUniGUI.SetOnHint(const Value: THintEvent);
begin
  FInternalAction.OnHint := Value;
end;

procedure TioActionUniGUI.SetOnUpdate(const Value: TNotifyEvent);
begin
  FInternalAction.OnUpdate := Value;
end;

procedure TioActionUniGUI.SetVisible(const Value: boolean);
begin
  FInternalAction.Visible := Value;
end;

class function TioActionUniGUI._CreateNewAction(const AOwner: TComponent): TioAction;
begin
  Result := Self.Create(AOwner);
end;

class function TioActionUniGUI._CreateNewAction(const AOwner: TComponent; const AAction: TObject): TioAction;
begin
  Result := Self.Create(AOwner, AAction);
end;

class function TioActionUniGUI._IsValid(const AField: TRttiField): Boolean;
begin
  // A Valid Field is a Field of TAction type (or derived)
  Result := AField.FieldType.IsInstance and AField.FieldType.AsInstance.MetaclassType.InheritsFrom(TAction);
end;

initialization

  TioApplicationUniGUI.SetConcreteClass(TioApplicationUniGUI);
  TioControlUniGUI.SetConcreteClass(TioControlUniGUI);
  TioTimerUniGUI.SetConcreteClass(TioTimerUniGUI);
  TioActionUniGUI.SetConcreteClass(TioActionUniGUI);

end.
