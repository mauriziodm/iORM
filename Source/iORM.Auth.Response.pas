unit iORM.Auth.Response;

interface

uses
  iORM.Auth.Interfaces;

type


    *** FINIRE DI SISTEMARE SUBJECTS, ASSTRING, CREATEBYSTRING ***



  TioAuthResponse = class(TInterfacedObject, IioAuthResponse)
  private
    FIsAuth: Boolean;
    // session subjects
    FSubjects: IioAuthSessionSubjects;
    // auth grant (auth code)
    FAutGnt: String;
    // refresh
    FRefTkn: String;
    FRefExp: TDateTime;
    // access
    FAccTkn: String;
    FAccExp: TDateTime;
    FRefAft: TDateTime;
    function GetAccTkn: String;
    function GetAccExp: TDateTime;
    function GetAutGnt: String;
    function GetIsAuth: Boolean;
    function GetRefAft: TDateTime;
    function GetRefTkn: String;
    function GetRefExp: TDateTime;
    function GetSubjects: IioAuthSessionSubjects;
    procedure SetAccTkn(const Value: String);
    procedure SetAccExp(const Value: TDateTime);
    procedure SetAutGnt(const Value: String);
    procedure SetIsAuth(const Value: Boolean);
    procedure SetRefAft(const Value: TDateTime);
    procedure SetRefTkn(const Value: String);
    procedure SetRefExp(const Value: TDateTime);
  public
    constructor Create;
    constructor CreateByJSONString(const AValue: String);
    function HasAutGnt: Boolean;
    function HasRefTkn: Boolean;
    function HasAccTkn: Boolean;
    function AsString: String;
    // properties
    property IsAuth: Boolean read GetIsAuth write SetIsAuth;
    // session subjects
    property Subjects: IioAuthSessionSubjects read GetSubjects;
    // auth grant (auth code)
    property AutGnt: String read GetAutGnt write SetAutGnt;
    // refresh
    property RefTkn: String read GetRefTkn write SetRefTkn;
    property RefExp: TDateTime read GetRefExp write SetRefExp;
    // access
    property AccTkn: String read GetAccTkn write SetAccTkn;
    property AccExp: TDateTime read GetAccExp write SetAccExp;
    property RefAft: TDateTime read GetRefAft write SetRefAft;
  end;

implementation

uses
  iORM.CommonTypes, iORM.Auth.Factory, DJSON, DJSON.Params;

{ TioAuthResponse }

constructor TioAuthResponse.Create;
begin
    // session subjects data
    FSubjects := TioAuthFactory.NewAuthSessionSubjects;
    // is authorized (login, access)
    FIsAuth := False;
    // sessionsubjects
    FSubjects := nil;
    // auth grant (auth code)
    FAutGnt:= IO_STRING_NULL_VALUE;
    // refresh
    FRefTkn := IO_STRING_NULL_VALUE;
    FRefExp := IO_DATETIME_NULL_VALUE;
    // access
    FAccTkn := IO_STRING_NULL_VALUE;
    FAccExp := IO_DATETIME_NULL_VALUE;
    FRefAft := IO_DATETIME_NULL_VALUE;
end;

constructor TioAuthResponse.CreateByString(const AValue: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  Create;
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    // is authorized
    LJSONValue := LJSONObject.GetValue('IsAuth');
    if Assigned(LJSONValue) then
      FIsAuth := (LJSONValue as TJSONBool).AsBoolean;
    // session subjects
    LJSONValue := LJSONObject.GetValue('Subjects');
    if Assigned(LJSONValue) then
      FSubjects.FromString(LJSONValue.Value);
    // auth grant (auth code)
    LJSONValue := LJSONObject.GetValue('AutGnt');
    if Assigned(LJSONValue) then
      FAutGnt := (LJSONValue as TJSONBool).AsBoolean;
    // refresh
    LJSONValue := LJSONObject.GetValue('RefTkn');
    if Assigned(LJSONValue) then
      FRefTkn := LJSONValue.Value;
    LJSONValue := LJSONObject.GetValue('RefExp');
    if Assigned(LJSONValue) then
      FRefExp :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
    // access
    LJSONValue := LJSONObject.GetValue('AccTkn');
    if Assigned(LJSONValue) then
      FAccTkn := LJSONValue.Value;
    LJSONValue := LJSONObject.GetValue('AccExp');
    if Assigned(LJSONValue) then
      FAccExp :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
    LJSONValue := LJSONObject.GetValue('RefAft');
    if Assigned(LJSONValue) then
      FRefAft :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
  finally
    LJSONObject.Free;
  end;
end;

function TioAuthResponse.GetAccExp: TDateTime;
begin
  Result := FAccExp;
end;

function TioAuthResponse.GetAccTkn: String;
begin
  Result := FAccTkn;
end;

function TioAuthResponse.GetAutGnt: String;
begin
  Result := FAutGnt;
end;

function TioAuthResponse.GetIsAuth: Boolean;
begin
  Result := FIsAuth;
end;

function TioAuthResponse.GetRefAft: TDateTime;
begin
  Result := FRefAft;
end;

function TioAuthResponse.GetRefExp: TDateTime;
begin
  Result := FRefExp;
end;

function TioAuthResponse.GetRefTkn: String;
begin
  Result := FRefTkn;
end;

function TioAuthResponse.GetSubjects: IioAuthSessionSubjects;
begin
  Result := FSubjects;
end;

function TioAuthResponse.HasAccTkn: Boolean;
begin
  Result := FAccTkn <> IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasAutGnt: Boolean;
begin
  Result := FAutGnt <> IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasRefTkn: Boolean;
begin
  Result := FRefTkn <> IO_STRING_NULL_VALUE;
end;

procedure TioAuthResponse.SetAccExp(const Value: TDateTime);
begin
  FAccExp := Value;
end;

procedure TioAuthResponse.SetAccTkn(const Value: String);
begin
  FAccTkn := Value;
end;

procedure TioAuthResponse.SetAutGnt(const Value: String);
begin
  FAutGnt := Value;
end;

procedure TioAuthResponse.SetIsAuth(const Value: Boolean);
begin
  FIsAuth := Value;
end;

procedure TioAuthResponse.SetRefAft(const Value: TDateTime);
begin
  FRefAft := Value;
end;

procedure TioAuthResponse.SetRefExp(const Value: TDateTime);
begin
  FRefExp := Value;
end;

procedure TioAuthResponse.SetRefTkn(const Value: String);
begin
  FRefTkn := Value;
end;

function TioAuthResponse.AsString: String;
var                                                                <
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.Create;
  try
    // is authorized
    LJSONObject.AddPair('IsAuth', FIsAuth);
    // session subjects
    LJSONObject.AddPair('Subjects', FSubjects.AsString);
    // auth grant (auth code)
    if HasAutGnt then
      LJSONObject.AddPair('AutGnt', FAutGnt);
    // refresh
    if HasRefTkn then
    begin
      LJSONObject.AddPair('RefTkn', FRefTkn);
      LJSONObject.AddPair('RefExp', DateTimeToUnix(FRefExp, True)); // True = UTC
    end;
    // refresh
    if HasAccTkn then
    begin
      LJSONObject.AddPair('AccTkn', FAccTkn);
      LJSONObject.AddPair('AccExp', DateTimeToUnix(FAccExp, True)); // True = UTC
      LJSONObject.AddPair('RefAft', DateTimeToUnix(RefAft, True)); // True = UTC
    end;
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

end.
