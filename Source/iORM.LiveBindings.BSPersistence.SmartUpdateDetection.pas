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
    function IsToBePersisted(const ACurrentObj: TObject): Boolean;
  end;

  TioSmartUpdateDetectionFaxtory = class
  public
    class function NewSmartUpdateDetectionSystem: IioSmartUpdateDetection;
  end;

implementation

uses
  iORM.Utilities, System.SysUtils, ObjMapper;

type

  TioSmartUpdateDetectionBase = class abstract (TInterfacedObject, IioSmartUpdateDetection)
  strict private
    FContainer: TDictionary<string, string>;
    FMonitor: TMonitor;
  protected
    procedure LockContainer;
    procedure UnlockContainer;
    procedure Add(const ACurrentObj: TObject);
    function EncodeKey(const ACurrentObj: TObject): string;
    function EncodeValue(const ACurrentObj: TObject): string; virtual;
    property Container: TDictionary<string, string> read FContainer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function IsToBePersisted(const ACurrentObj: TObject): Boolean; virtual; abstract;
    procedure NotifyEdit(const ACurrentObj: TObject); virtual;
    procedure NotifyPost(const ACurrentObj: TObject); virtual;
  end;

  TioSmartUpdateDetectionStateLess = class(TioSmartUpdateDetectionBase)
  protected
    function IsToBePersisted(const ACurrentObj: TObject): Boolean; override;
    procedure NotifyPost(const ACurrentObj: TObject); override;
  end;

  TioSmartUpdateDetectionStateFull = class(TioSmartUpdateDetectionBase)
  protected
    function EncodeValue(const ACurrentObj: TObject): string; override;
    function IsToBePersisted(const ACurrentObj: TObject): Boolean; override;
    procedure NotifyEdit(const ACurrentObj: TObject); override;
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
  LockContainer;
  try
    FContainer.Add(LKey, LValue);
  finally
    UnlockContainer;
  end;
end;

procedure TioSmartUpdateDetectionBase.Clear;
begin
  LockContainer;
  try
    FContainer.Clear;
  finally
    UnlockContainer;
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

function TioSmartUpdateDetectionBase.EncodeValue(const ACurrentObj: TObject): string;
begin
  Result := '';
end;

procedure TioSmartUpdateDetectionBase.LockContainer;
begin
  FMonitor.Enter(Self);
end;

procedure TioSmartUpdateDetectionBase.NotifyEdit(const ACurrentObj: TObject);
begin
  // Do nothing
end;

procedure TioSmartUpdateDetectionBase.NotifyPost(const ACurrentObj: TObject);
begin
  // Do Nothing
end;

procedure TioSmartUpdateDetectionBase.UnlockContainer;
begin
  FMonitor.Exit(Self);
end;

{ TioSmartUpdateDetectionStateLess }

function TioSmartUpdateDetectionStateLess.IsToBePersisted(const ACurrentObj: TObject): Boolean;
var
  LKey: String;
begin
  if not Assigned(ACurrentObj) then
    Exit(False);
  LKey := EncodeKey(ACurrentObj);
  LockContainer;
  try
    Result := (LKey = NEW_OBJ_KEY) or Container.ContainsKey(LKey);
  finally
    UnlockContainer;
  end;
end;

procedure TioSmartUpdateDetectionStateLess.NotifyPost(const ACurrentObj: TObject);
begin
  Add(ACurrentObj);
end;

{ TioSmartUpdateDetectionFullState }

function TioSmartUpdateDetectionStateFull.IsToBePersisted(const ACurrentObj: TObject): Boolean;
var
  LKey, LCurrentState: String;
begin
  if not Assigned(ACurrentObj) then
    Exit(False);
  LKey := EncodeKey(ACurrentObj);
  LockContainer;
  try
    Result := (LKey = NEW_OBJ_KEY) or Container.ContainsKey(LKey);
    if Result then
    begin
      LCurrentState := om.From(ACurrentObj).byFields.TypeAnnotationsON.ToString;
      Result := Result and (LCurrentState <> Container[LKey]);
    end;
  finally
    UnlockContainer;
  end;
end;

procedure TioSmartUpdateDetectionStateFull.NotifyEdit(const ACurrentObj: TObject);
begin
  Add(ACurrentObj);
end;

function TioSmartUpdateDetectionStateFull.EncodeValue(const ACurrentObj: TObject): string;
begin
  Result := om.From(ACurrentObj).byFields.TypeAnnotationsON.ToString;
end;

{ TioSmartUpdateDetectionFaxtory }

class function TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem: IioSmartUpdateDetection;
begin
  Result := TioSmartUpdateDetectionStateLess.Create;
//  Result := TioSmartUpdateDetectionStateFull.Create;
end;

end.
