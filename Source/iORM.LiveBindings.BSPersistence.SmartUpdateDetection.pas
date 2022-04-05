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
    procedure NotifyEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String);
    procedure NotifyPost(const ACurrentObj: TObject; const AMasterPropertyPath: String);
    function IsToBePersisted(const ACurrentObj: TObject; const AMasterPropertyPath: String): Boolean;
  end;

  TioSmartUpdateDetectionFaxtory = class
  public
    class function NewSmartUpdateDetectionSystem(const AStateFullSUD: Boolean): IioSmartUpdateDetection;
  end;

implementation

uses
  iORM.Utilities, System.SysUtils, ObjMapper;

type

  TioSmartUpdateDetectionBase = class abstract(TInterfacedObject, IioSmartUpdateDetection)
  strict private
    FObjStateCollection: TDictionary<string, string>;
    FMonitor: TMonitor;
  protected
    procedure Lock;
    procedure Unlock;
    procedure Add(const ACurrentObj: TObject; const AMasterPropertyPath: String);
    function EncodeKey(const ACurrentObj: TObject; const AMasterPropertyPath: String): string;
    function EncodeValue(const ACurrentObj: TObject): string; virtual;
    property ObjStateCollection: TDictionary<string, string> read FObjStateCollection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function IsToBePersisted(const ACurrentObj: TObject; const AMasterPropertyPath: String): Boolean; virtual; abstract;
    procedure NotifyEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String); virtual; abstract;
    procedure NotifyPost(const ACurrentObj: TObject; const AMasterPropertyPath: String); virtual; abstract;
  end;

  TioSmartUpdateDetectionStateLess = class(TioSmartUpdateDetectionBase)
   public
    function IsToBePersisted(const ACurrentObj: TObject; const AMasterPropertyPath: String): Boolean; override;
    procedure NotifyEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String); override;
    procedure NotifyPost(const ACurrentObj: TObject; const AMasterPropertyPath: String); override;
  end;

  TioSmartUpdateDetectionStateFull = class(TioSmartUpdateDetectionBase)
  public
    function EncodeValue(const ACurrentObj: TObject): string; override;
    function IsToBePersisted(const ACurrentObj: TObject; const AMasterPropertyPath: String): Boolean; override;
    procedure NotifyEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String); override;
    procedure NotifyPost(const ACurrentObj: TObject; const AMasterPropertyPath: String); override;
  end;

  { TioSmartUpdateDetection }

procedure TioSmartUpdateDetectionBase.Add(const ACurrentObj: TObject; const AMasterPropertyPath: String);
var
  LKey, LValue: String;
begin
  if not Assigned(ACurrentObj) then
    Exit;
  LKey := EncodeKey(ACurrentObj, AMasterPropertyPath);
  if LKey = NEW_OBJ_KEY then
    Exit;
  Lock;
  try
    if FObjStateCollection.ContainsKey(LKey) then
      Exit;
    LValue := EncodeValue(ACurrentObj);
    FObjStateCollection.Add(LKey, LValue);
  finally
    Unlock;
  end;
end;

procedure TioSmartUpdateDetectionBase.Clear;
begin
  Lock;
  try
    FObjStateCollection.Clear;
  finally
    Unlock;
  end;
end;

constructor TioSmartUpdateDetectionBase.Create;
begin
  inherited;
  FObjStateCollection := TDictionary<string, string>.Create;
end;

destructor TioSmartUpdateDetectionBase.Destroy;
begin
  FObjStateCollection.Free;
  inherited;
end;

function TioSmartUpdateDetectionBase.EncodeKey(const ACurrentObj: TObject; const AMasterPropertyPath: String): string;
var
  LID: Integer;
begin
  LID := TioUtilities.ExtractOID(ACurrentObj);
  if LID <> 0 then
    Result := AMasterPropertyPath + '.' + ACurrentObj.ClassName + '.' + LID.ToString
  else
    Result := NEW_OBJ_KEY;
end;

function TioSmartUpdateDetectionBase.EncodeValue(const ACurrentObj: TObject): string;
begin
  Result := '';
end;

procedure TioSmartUpdateDetectionBase.Lock;
begin
  FMonitor.Enter(Self);
end;

procedure TioSmartUpdateDetectionBase.Unlock;
begin
  FMonitor.Exit(Self);
end;

{ TioSmartUpdateDetectionStateLess }

function TioSmartUpdateDetectionStateLess.IsToBePersisted(const ACurrentObj: TObject; const AMasterPropertyPath: String): Boolean;
var
  LKey: String;
begin
  if not Assigned(ACurrentObj) then
    Exit(False);
  LKey := EncodeKey(ACurrentObj, AMasterPropertyPath);
  if LKey = NEW_OBJ_KEY then
    Exit(True);
  Lock;
  try
    Result := ObjStateCollection.ContainsKey(LKey);
  finally
    Unlock;
  end;
end;

procedure TioSmartUpdateDetectionStateLess.NotifyEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String);
begin
  // Do nothing
end;

procedure TioSmartUpdateDetectionStateLess.NotifyPost(const ACurrentObj: TObject; const AMasterPropertyPath: String);
begin
  Add(ACurrentObj, AMasterPropertyPath);
end;

{ TioSmartUpdateDetectionFullState }

function TioSmartUpdateDetectionStateFull.IsToBePersisted(const ACurrentObj: TObject; const AMasterPropertyPath: String): Boolean;
var
  LKey, LCurrentState: String;
begin
  if not Assigned(ACurrentObj) then
    Exit(False);
  LKey := EncodeKey(ACurrentObj, AMasterPropertyPath);
  if LKey = NEW_OBJ_KEY then
    Exit(True);
  Lock;
  try
    if ObjStateCollection.ContainsKey(LKey) then
    begin
      LCurrentState := EncodeValue(ACurrentObj);
      Result := LCurrentState <> ObjStateCollection[LKey];
    end
    else
      Result := False;
  finally
    Unlock;
  end;
end;

procedure TioSmartUpdateDetectionStateFull.NotifyEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String);
begin
  Add(ACurrentObj, AMasterPropertyPath);
end;

procedure TioSmartUpdateDetectionStateFull.NotifyPost(const ACurrentObj: TObject; const AMasterPropertyPath: String);
begin
  // Do nothing
end;

function TioSmartUpdateDetectionStateFull.EncodeValue(const ACurrentObj: TObject): string;
begin
  Result := om.From(ACurrentObj).byFields.IgnoreObjStatus.TypeAnnotationsON.ToString;
end;

{ TioSmartUpdateDetectionFaxtory }

class function TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(const AStateFullSUD: Boolean): IioSmartUpdateDetection;
begin
  if AStateFullSUD then
    Result := TioSmartUpdateDetectionStateFull.Create
  else
    Result := TioSmartUpdateDetectionStateLess.Create;
end;

end.
