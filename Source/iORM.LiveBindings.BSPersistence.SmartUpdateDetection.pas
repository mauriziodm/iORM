unit iORM.LiveBindings.BSPersistence.SmartUpdateDetection;

interface

uses
  System.Generics.Collections;

const
  NEW_OBJ_KEY = 'NEW';


type

  IioSmartUpdateDetection = interface
    ['{715911CE-4750-422C-BC74-C8674A90AA3F}']
    procedure Clear;
    procedure NotifyEdit(const ACurrentObj: TObject);
    procedure NotifyPost(const ACurrentObj: TObject);
    function IsUpdated(const ACurrentObj: TObject): Boolean;
  end;


implementation

uses
  iORM.Utilities, System.SysUtils, ObjMapper;

type

  TioSmartUpdateDetectionBase = class abstract
  private
    FContainer: TDictionary<string, string>;
    FMonitor: TMonitor;
    procedure Lock;
    procedure Unlock;
    procedure Add(const ACurrentObj: TObject);
  protected
    function EncodeKey(const ACurrentObj: TObject): string;
    function EncodeValue(const ACurrentObj: TObject): string; virtual; abstract;
    function DoIsUpdated(const ACurrentObj: TObject): Boolean; virtual; abstract;
    procedure DoNotifyEdit(const ACurrentObj: TObject); virtual; abstract;
    procedure DoNotifyPost(const ACurrentObj: TObject); virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure NotifyEdit(const ACurrentObj: TObject);
    procedure NotifyPost(const ACurrentObj: TObject);
    function IsUpdated(const ACurrentObj: TObject): Boolean;
  end;

  TioSmartUpdateDetectionStateLess = class(TioSmartUpdateDetectionBase)
  protected
    function EncodeValue(const ACurrentObj: TObject): string; override;
    function DoIsUpdated(const ACurrentObj: TObject): Boolean; override;
    procedure DoNotifyEdit(const ACurrentObj: TObject); override;
    procedure DoNotifyPost(const ACurrentObj: TObject); override;
  end;

  TioSmartUpdateDetectionFullState = class(TioSmartUpdateDetectionBase)
  protected
    function EncodeValue(const ACurrentObj: TObject): string; override;
    function DoIsUpdated(const ACurrentObj: TObject): Boolean; override;
    procedure DoNotifyEdit(const ACurrentObj: TObject); override;
    procedure DoNotifyPost(const ACurrentObj: TObject); override;
  end;

{ TioSmartUpdateDetection }

procedure TioSmartUpdateDetectionBase.Add(const ACurrentObj: TObject);
var
  LKey, LValue: String;
begin
  if not Assigned(ACurrentObj) then
    Exit;
  LKey := EncodeKey(ACurrentObj);
  if LKey = NEW_OBJ_KEY then
    Exit;
  LValue := EncodeValue(ACurrentObj);
  FContainer.Add(LKey, LValue);
end;

procedure TioSmartUpdateDetectionBase.Clear;
begin
  Lock;
  try
    FContainer.Clear;
  finally
    Unlock;
  end;
end;

constructor TioSmartUpdateDetectionBase.Create;
begin
  inherited;
  FContainer := TDictionary<string, string>.Create;
end;

destructor TioSmartUpdateDetectionBase.Destroy;
begin
  FContainer.Free;
  inherited;
end;

function TioSmartUpdateDetectionBase.IsUpdated(const ACurrentObj: TObject): Boolean;
begin
  Lock;
  try
    Result := DoIsUpdated(ACurrentObj);
  finally
    Unlock;
  end;
end;

function TioSmartUpdateDetectionBase.EncodeKey(const ACurrentObj: TObject): string;
var
  LID: Integer;
begin
  LID := TioUtilities.ExtractOID(ACurrentObj);
  if LID <> 0 then
    Result := ACurrentObj.ClassName + '___' + LID.ToString
  else
    Result := NEW_OBJ_KEY;
end;

procedure TioSmartUpdateDetectionBase.Lock;
begin
  FMonitor.Enter(Self);
end;

procedure TioSmartUpdateDetectionBase.NotifyEdit(const ACurrentObj: TObject);
begin
  Lock;
  try
    DoNotifyEdit(ACurrentObj);
  finally
    Unlock;
  end;
end;

procedure TioSmartUpdateDetectionBase.NotifyPost(const ACurrentObj: TObject);
begin
  Lock;
  try
    DoNotifyPost(ACurrentObj);
  finally
    Unlock;
  end;
end;

procedure TioSmartUpdateDetectionBase.Unlock;
begin
  FMonitor.Exit(Self);
end;

{ TioSmartUpdateDetectionStateLess }

function TioSmartUpdateDetectionStateLess.DoIsUpdated(const ACurrentObj: TObject): Boolean;
var
  LKey: String;
begin
  if not Assigned(ACurrentObj) then
    Exit(False);
  LKey := EncodeKey(ACurrentObj);
  Result := (LKey = NEW_OBJ_KEY) or FContainer.ContainsKey(LKey);
end;

procedure TioSmartUpdateDetectionStateLess.DoNotifyEdit(const ACurrentObj: TObject);
begin
  // Do nothing
end;

procedure TioSmartUpdateDetectionStateLess.DoNotifyPost(const ACurrentObj: TObject);
begin
  Add(ACurrentObj);
end;

function TioSmartUpdateDetectionStateLess.EncodeValue(const ACurrentObj: TObject): string;
begin
  Result := '';
end;

{ TioSmartUpdateDetectionFullState }

function TioSmartUpdateDetectionFullState.DoIsUpdated(const ACurrentObj: TObject): Boolean;
var
  LKey, LCurrentState: String;
begin
  if not Assigned(ACurrentObj) then
    Exit(False);
  LKey := EncodeKey(ACurrentObj);
  Result := (LKey = NEW_OBJ_KEY) or FContainer.ContainsKey(LKey);
  if Result then
  begin
    LCurrentState := om.From(ACurrentObj).byFields.TypeAnnotationsON.ToString;
    Result := Result and (LCurrentState <> FContainer[LKey]);
  end;
end;

procedure TioSmartUpdateDetectionFullState.DoNotifyEdit(const ACurrentObj: TObject);
begin
  Add(ACurrentObj);
end;

procedure TioSmartUpdateDetectionFullState.DoNotifyPost(const ACurrentObj: TObject);
begin
  // Do nothing
end;

function TioSmartUpdateDetectionFullState.EncodeValue(const ACurrentObj: TObject): string;
begin
  Result := om.From(ACurrentObj).byFields.TypeAnnotationsON.ToString;
end;

end.
