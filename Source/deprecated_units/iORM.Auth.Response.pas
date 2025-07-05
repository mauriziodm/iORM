unit iORM.Auth.Response;

interface

uses
  iORM.Auth.Interfaces;

type
  TioAuthResponse = class(TInterfacedObject, IioAuthResponse)
  private
    // access
    FAccessToken: String;
    FAccessTokenExp: TDateTime;
    FAccessTokenRefreshAfter: TDateTime;
    // authorization code
    FAuthorizationCode: String;
    // app
    FApp: String;
    FAppOID: Integer;
    // connection
    FConnection: String;
    FConnectionRemote: String;
    // true if the the request is authorized
    FIsAuthorized: Boolean;
    // refresh
    FRefreshToken: String;
    FRefreshTokenExp: TDateTime;
    // AuthState
    FState: String;
    // user
    FUser: String;
    FUserOID: Integer;
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenRefreshAfter: TDateTime;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetAuthorizationCode: String;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetIsAuthorized: Boolean;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetState: String;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetAccessTokenRefreshAfter(const Value: TDateTime);
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetAuthorizationCode(const Value: String);
    procedure SetConnection(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetIsAuthorized(const Value: Boolean);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
    procedure SetState(const Value: String);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    constructor Create;
    constructor CreateByJSONString(const AJSONString: String);
    function AsString: String;
    function HasAccessToken: Boolean;
    function HasAuthorizationCode: Boolean;
    function HasRefreshToken: Boolean;
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AccessTokenExp: TDateTime read GetAccessTokenExp write SetAccessTokenExp;
    property AccessTokenRefreshAfter: TDateTime read GetAccessTokenRefreshAfter write SetAccessTokenRefreshAfter;
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property AuthorizationCode: String read GetAuthorizationCode write SetAuthorizationCode;
    property Connection: String read GetConnection write SetConnection;
    property ConnectionRemote: String read GetConnectionRemote write SetConnectionRemote;
    property IsAuthorized: Boolean read GetIsAuthorized write SetIsAuthorized;
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenExp: TDateTime read GetRefreshTokenExp write SetRefreshTokenExp;
    property State: String read GetState write SetState;
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
  end;

implementation

uses
  iORM.CommonTypes, iORM.Auth.Factory, DJSON, DJSON.Params, System.JSON,
  System.DateUtils;

{ TioAuthResponse }

constructor TioAuthResponse.Create;
begin
  // app
  FApp := IO_STRING_NULL_VALUE;
  FAppOID := IO_INTEGER_NULL_VALUE;
  // user
  FUser := IO_STRING_NULL_VALUE;
  FUserOID := IO_INTEGER_NULL_VALUE;
  // connection
  FConnection := IO_STRING_NULL_VALUE;
  FConnectionRemote := IO_STRING_NULL_VALUE;
  // is authorized (login, access)
  FIsAuthorized := False;
  // auth grant (auth code)
  FAuthorizationCode:= IO_STRING_NULL_VALUE;
  // refresh
  FRefreshToken := IO_STRING_NULL_VALUE;
  FRefreshTokenExp := IO_DATETIME_NULL_VALUE;
  // access
  FAccessToken := IO_STRING_NULL_VALUE;
  FAccessTokenExp := IO_DATETIME_NULL_VALUE;
  FAccessTokenRefreshAfter := IO_DATETIME_NULL_VALUE;
end;

constructor TioAuthResponse.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  Create;
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    // access token
    LJSONValue := LJSONObject.GetValue(AR_ACCESSTOKEN);
    if Assigned(LJSONValue) then
      FAccessToken := LJSONValue.Value;
    // access token expiration
    LJSONValue := LJSONObject.GetValue(AR_ACCESSTOKEN_EXP);
    if Assigned(LJSONValue) then
      FAccessTokenExp :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
    // access token refresh after
    LJSONValue := LJSONObject.GetValue(AR_ACCESSTOKEN_REFRESHAFTER);
    if Assigned(LJSONValue) then
      FAccessTokenRefreshAfter :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
    // App
    LJSONValue := LJSONObject.GetValue(AR_APP);
    if Assigned(LJSONValue) then
      FApp := LJSONValue.Value;
    // AppOID
    LJSONValue := LJSONObject.GetValue(AR_APPOID);
    if Assigned(LJSONValue) then
      FAppOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // authorization code
    LJSONValue := LJSONObject.GetValue(AR_AUTHORIZATIONCODE);
    if Assigned(LJSONValue) then
      FAuthorizationCode := LJSONValue.Value;
    // Connection
    LJSONValue := LJSONObject.GetValue(AR_CONNECTION);
    if Assigned(LJSONValue) then
      FConnection := LJSONValue.Value;
    // ConnectionRemote
    LJSONValue := LJSONObject.GetValue(AR_CONNECTIONREMOTE);
    if Assigned(LJSONValue) then
      FConnectionRemote := LJSONValue.Value;
    // is authorized
    LJSONValue := LJSONObject.GetValue(AR_ISAUTHORIZED);
    if Assigned(LJSONValue) then
      FIsAuthorized := (LJSONValue as TJSONBool).AsBoolean;
    // refresh token
    LJSONValue := LJSONObject.GetValue(AR_REFRESHTOKEN);
    if Assigned(LJSONValue) then
      FRefreshToken := LJSONValue.Value;
    // refresh token expiration
    LJSONValue := LJSONObject.GetValue(AR_REFRESHTOKEN_EXP);
    if Assigned(LJSONValue) then
      FRefreshTokenExp :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
    // State
    LJSONValue := LJSONObject.GetValue(AR_STATE);
    if Assigned(LJSONValue) then
      FState := LJSONValue.Value;
    // User
    LJSONValue := LJSONObject.GetValue(AR_USER);
    if Assigned(LJSONValue) then
      FUser := LJSONValue.Value;
    // UserOID
    LJSONValue := LJSONObject.GetValue(AR_USEROID);
    if Assigned(LJSONValue) then
      FUserOID := dj.FromJSON(LJSONValue).&To<Integer>;
  finally
    LJSONObject.Free;
  end;
end;

function TioAuthResponse.GetAccessTokenExp: TDateTime;
begin
  Result := FAccessTokenExp;
end;

function TioAuthResponse.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthResponse.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioAuthResponse.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioAuthResponse.GetAuthorizationCode: String;
begin
  Result := FAuthorizationCode;
end;

function TioAuthResponse.GetConnection: String;
begin
  Result := FConnection;
end;

function TioAuthResponse.GetConnectionRemote: String;
begin
  Result := FConnectionRemote;
end;

function TioAuthResponse.GetIsAuthorized: Boolean;
begin
  Result := FIsAuthorized;
end;

function TioAuthResponse.GetAccessTokenRefreshAfter: TDateTime;
begin
  Result := FAccessTokenRefreshAfter;
end;

function TioAuthResponse.GetRefreshTokenExp: TDateTime;
begin
  Result := FRefreshTokenExp;
end;

function TioAuthResponse.GetState: String;
begin
  Result := FState;
end;

function TioAuthResponse.GetUser: String;
begin
  Result := FUser;
end;

function TioAuthResponse.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

function TioAuthResponse.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioAuthResponse.HasAccessToken: Boolean;
begin
  Result := FAccessToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasAuthorizationCode: Boolean;
begin
  Result := FAuthorizationCode <> IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasRefreshToken: Boolean;
begin
  Result := FRefreshToken <> IO_STRING_NULL_VALUE;
end;

procedure TioAuthResponse.SetAccessTokenExp(const Value: TDateTime);
begin
  FAccessTokenExp := Value;
end;

procedure TioAuthResponse.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioAuthResponse.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthResponse.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioAuthResponse.SetAuthorizationCode(const Value: String);
begin
  FAuthorizationCode := Value;
end;

procedure TioAuthResponse.SetConnection(const Value: String);
begin
  FConnection := Value;
end;

procedure TioAuthResponse.SetConnectionRemote(const Value: String);
begin
  FConnectionRemote := Value;
end;

procedure TioAuthResponse.SetIsAuthorized(const Value: Boolean);
begin
  FIsAuthorized := Value;
end;

procedure TioAuthResponse.SetAccessTokenRefreshAfter(const Value: TDateTime);
begin
  FAccessTokenRefreshAfter := Value;
end;

procedure TioAuthResponse.SetRefreshTokenExp(const Value: TDateTime);
begin
  FRefreshTokenExp := Value;
end;

procedure TioAuthResponse.SetState(const Value: String);
begin
  FState := Value;
end;

procedure TioAuthResponse.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TioAuthResponse.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

procedure TioAuthResponse.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

function TioAuthResponse.AsString: String;
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.Create;
  try
    // access token
    if HasAccessToken then
    begin
      LJSONObject.AddPair(AR_ACCESSTOKEN, FAccessToken);
      LJSONObject.AddPair(AR_ACCESSTOKEN_EXP, DateTimeToUnix(FAccessTokenExp, True)); // True = UTC
      LJSONObject.AddPair(AR_ACCESSTOKEN_REFRESHAFTER, DateTimeToUnix(FAccessTokenRefreshAfter, True)); // True = UTC
    end;
    // app
    if FApp <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(AR_APP, FApp);
    if FAppOID <> IO_INTEGER_NULL_VALUE then
      LJSONObject.AddPair(AR_APPOID, FAppOID);
    // authorization code
    if HasAuthorizationCode then
      LJSONObject.AddPair(AR_AUTHORIZATIONCODE, FAuthorizationCode);
    // connection
    if FConnection <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(AR_CONNECTION, FConnection);
    if FConnectionRemote <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(AR_CONNECTIONREMOTE, FConnectionRemote);
    // is authorized
    LJSONObject.AddPair(AR_ISAUTHORIZED, FIsAuthorized);
    // refresh token
    if HasRefreshToken then
    begin
      LJSONObject.AddPair(AR_REFRESHTOKEN, FRefreshToken);
      LJSONObject.AddPair(AR_REFRESHTOKEN_EXP, DateTimeToUnix(FRefreshTokenExp, True)); // True = UTC
    end;
    // state
    if FState <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(AR_STATE, FState);
    // user
    if FUser <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(AR_USER, FUser);
    if FUserOID <> IO_INTEGER_NULL_VALUE then
      LJSONObject.AddPair(AR_USEROID, FUserOID);
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

end.
