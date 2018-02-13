unit iORM.AbstractionLayer.Framework;

interface

uses
  System.Classes, System.Rtti;

type
  TioApplicationRef = class of TioApplication;
  TioApplication = class abstract
  private
    class var FConcreteClass: TioApplicationRef;
  protected
    class procedure SetConcreteClass(const AClass: TioApplicationRef);
    class procedure _HandleException(const Sender: TObject); virtual; abstract;
    class function _Terminate: Boolean; virtual; abstract;
  public
    class procedure HandleException(const Sender: TObject);
    class function Terminate: Boolean;
  end;

  TioComponentRef = class of TioComponent;
  TioComponent = class abstract
  private
    class var FConcreteClass: TioComponentRef;
  protected
    class procedure SetConcreteClass(const AClass: TioComponentRef);
    class procedure _SetParent(const AComponent, AParent: TObject); virtual; abstract;
  public
    class procedure SetParent(const AComponent, AParent: TObject);
  end;

  TioTimerRef = class of TioTimer;
  TioTimer = class abstract
  private
    class var FConcreteClass: TioTimerRef;
  protected
    class procedure SetConcreteClass(const AClass: TioTimerRef);
    function GetEnabled: Boolean; virtual; abstract;
    function GetInterval: Cardinal; virtual; abstract;
    function GetOnTimer: TNotifyEvent; virtual; abstract;
    function GetTag: Integer; virtual; abstract;
    procedure SetEnabled(const Value: Boolean); virtual; abstract;
    procedure SetInterval(const Value: Cardinal); virtual; abstract;
    procedure SetOnTimer(const Value: TNotifyEvent); virtual; abstract;
    procedure SetTag(const Value: Integer); virtual; abstract;
  public
    class function CreateNewTimer: TioTimer;
    property Enabled: Boolean read GetEnabled write SetEnabled default True;
    property Interval: Cardinal read GetInterval write SetInterval default 1000;
    property OnTimer: TNotifyEvent read GetOnTimer write SetOnTimer;
    property Tag:Integer read GetTag write SetTag;
  end;

  TioActionRef = class of TioAction;
  TioAction = class(TComponent)
  private
    class var FConcreteClass: TioActionRef;
  protected
    class function _CreateNewAction(const AOwner:TComponent): TioAction; overload; virtual; abstract;
    class function _CreateNewAction(const AOwner:TComponent; const AAction: TObject): TioAction; overload; virtual; abstract;
    class procedure SetConcreteClass(const AClass: TioActionRef);
    function GetCaption: string; virtual; abstract;
    function GetChecked: boolean; virtual; abstract;
    function GetEnabled: boolean; virtual; abstract;
    function GetGroupIndex: integer; virtual; abstract;
    function GetHint: string; virtual; abstract;
    function GetImageIndex: integer; virtual; abstract;
    function GetName: TComponentName; virtual; abstract;
    function GetVisible: boolean; virtual; abstract;
    function GetOnExecute: TNotifyEvent; virtual; abstract;
    function GetOnHint: THintEvent; virtual; abstract;
    function GetOnUpdate: TNotifyEvent; virtual; abstract;
    procedure SetCaption(const Value: string); virtual; abstract;
    procedure SetChecked(const Value: boolean); virtual; abstract;
    procedure SetEnabled(const Value: boolean); virtual; abstract;
    procedure SetGroupIndex(const Value: integer); virtual; abstract;
    procedure SetHint(const Value: string); virtual; abstract;
    procedure SetImageIndex(const Value: integer); virtual; abstract;
    procedure SetName(const Value: TComponentName); virtual; abstract;
    procedure SetVisible(const Value: boolean); virtual; abstract;
    procedure SetOnExecute(const Value: TNotifyEvent); virtual; abstract;
    procedure SetOnHint(const Value: THintEvent); virtual; abstract;
    procedure SetOnUpdate(const Value: TNotifyEvent); virtual; abstract;
  public
    class function CreateNewAction(const AOwner:TComponent): TioAction; overload;
    class function CreateNewAction(const AOwner:TComponent; const AAction: TObject): TioAction; overload;
    function Execute: Boolean; virtual; abstract;
    function AsTValue: TValue; virtual; abstract;
    property Caption:string read GetCaption write SetCaption;
    property Checked:boolean read GetChecked write SetChecked;
    property Enabled:boolean read GetEnabled write SetEnabled;
    property GroupIndex:integer read GetGroupIndex write SetGroupIndex;
    property Hint:string read GetHint write SetHint;
    property ImageIndex:integer read GetImageIndex write SetImageIndex;
    property Name:TComponentName read GetName write SetName;
    property Visible:boolean read GetVisible write SetVisible;
    property OnExecute:TNotifyEvent read GetOnExecute write SetOnExecute;
    property OnHint:THintEvent read GetOnHint write SetOnHint;
    property OnUpdate:TNotifyEvent read GetOnUpdate write SetOnUpdate;
  end;

implementation

{ TioTimer }

class function TioTimer.CreateNewTimer: TioTimer;
begin
  Result := FConcreteClass.Create;
end;

class procedure TioTimer.SetConcreteClass(const AClass: TioTimerRef);
begin
  FConcreteClass := AClass;
end;

{ TioApplication }

class procedure TioApplication.HandleException(const Sender: TObject);
begin
  FConcreteClass._HandleException(Sender);
end;

class procedure TioApplication.SetConcreteClass(const AClass: TioApplicationRef);
begin
  FConcreteClass := AClass;
end;

class function TioApplication.Terminate: Boolean;
begin
  Result := FConcreteClass._Terminate;
end;

{ TioAction }

class function TioAction.CreateNewAction(const AOwner: TComponent): TioAction;
begin
  Result := FConcreteClass._CreateNewAction(AOwner)
end;

class function TioAction.CreateNewAction(const AOwner:TComponent; const AAction: TObject): TioAction;
begin
  Result := FConcreteClass._CreateNewAction(AOwner, AAction)
end;

class procedure TioAction.SetConcreteClass(const AClass: TioActionRef);
begin
  FConcreteClass := AClass;
end;

{ TioControl }

class procedure TioComponent.SetConcreteClass(const AClass: TioComponentRef);
begin
  FConcreteClass := AClass;
end;

class procedure TioComponent.SetParent(const AComponent, AParent: TObject);
begin
  FConcreteClass._SetParent(AComponent, AParent);
end;

end.
