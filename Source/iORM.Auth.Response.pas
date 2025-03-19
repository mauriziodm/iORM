unit iORM.Auth.Response;

interface

uses
  iORM.Auth.Interfaces;

type
  TioAuthResponse = class(TInterfacedObject, IioAuthResponse)
  private
    // app
    FApp: String;
    FAppOID: Integer;
    // user
    FUser: String;
    FUserOID: Integer;
    // connection
    FConnection: String;
    FConnectionRemote: String;
    // true if the the request is authorized
    FIsAuthorized: Boolean;
    // auth grant (auth code)
    FAuthGrant: String;
    // refresh
    FRefreshToken: String;
    FRefreshTokenExp: TDateTime;
    // access
    FAccessToken: String;
    FAccessTokenExp: TDateTime;
    FRefreshAfter: TDateTime;
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetAuthGrant: String;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetIsAuthorized: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetAuthGrant(const Value: String);
    procedure SetConnection(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetIsAuthorized(const Value: Boolean);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    constructor Create;
    constructor CreateByJSONString(const AJSONString: String);
    function AsString: String;
    function HasAccessToken: Boolean;
    function HasAuthGrant: Boolean;
    function HasRefreshToken: Boolean;
    // app props
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    // user props
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
    // connection props
    property Connection: String read GetConnection write SetConnection;
    property ConnectionRemote: String read GetConnectionRemote write SetConnectionRemote;
    // is authorized prop
    property IsAuthorized: Boolean read GetIsAuthorized write SetIsAuthorized;
    // auth grant (auth code) prop
    property AuthGrant: String read GetAuthGrant write SetAuthGrant;
    // refresh token props
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenExp: TDateTime read GetRefreshTokenExp write SetRefreshTokenExp;
    // access token props
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AccessTokenExp: TDateTime read GetAccessTokenExp write SetAccessTokenExp;
    property RefreshAfter: TDateTime read GetRefreshAfter write SetRefreshAfter;
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
  FAuthGrant:= IO_STRING_NULL_VALUE;
  // refresh
  FRefreshToken := IO_STRING_NULL_VALUE;
  FRefreshTokenExp := IO_DATETIME_NULL_VALUE;
  // access
  FAccessToken := IO_STRING_NULL_VALUE;
  FAccessTokenExp := IO_DATETIME_NULL_VALUE;
  FRefreshAfter := IO_DATETIME_NULL_VALUE;
end;

constructor TioAuthResponse.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  Create;
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    // App
    LJSONValue := LJSONObject.GetValue(AR_APP);
    if Assigned(LJSONValue) then
      FApp := LJSONValue.Value;
    // AppOID
    LJSONValue := LJSONObject.GetValue(AR_APP_OID);
    if Assigned(LJSONValue) then
      FAppOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // Connection
    LJSONValue := LJSONObject.GetValue(AR_CONNECTION);
    if Assigned(LJSONValue) then
      FConnection := LJSONValue.Value;
    // ConnectionRemote
    LJSONValue := LJSONObject.GetValue(AR_CONNECTION_REMOTE);
    if Assigned(LJSONValue) then
      FConnectionRemote := LJSONValue.Value;
    // User
    LJSONValue := LJSONObject.GetValue(AR_USER);
    if Assigned(LJSONValue) then
      FUser := LJSONValue.Value;
    // UserOID
    LJSONValue := LJSONObject.GetValue(AR_USER_OID);
    if Assigned(LJSONValue) then
      FUserOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // is authorized
    LJSONValue := LJSONObject.GetValue(AR_IS_AUTHORIZED);
    if Assigned(LJSONValue) then
      FIsAuthorized := (LJSONValue as TJSONBool).AsBoolean;
    // auth grant (auth code)
    LJSONValue := LJSONObject.GetValue(AR_AUTH_GRANT);
    if Assigned(LJSONValue) then
      FAuthGrant := LJSONValue.Value;
    // refresh token
    LJSONValue := LJSONObject.GetValue(AR_REFRESH_TOKEN);
    if Assigned(LJSONValue) then
      FRefreshToken := LJSONValue.Value;
    // refresh token expiration
    LJSONValue := LJSONObject.GetValue(AR_REFRESH_TOKEN_EXP);
    if Assigned(LJSONValue) then
      FRefreshTokenExp :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
    // access token
    LJSONValue := LJSONObject.GetValue(AR_ACCESS_TOKEN);
    if Assigned(LJSONValue) then
      FAccessToken := LJSONValue.Value;
    // access token expiration
    LJSONValue := LJSONObject.GetValue(AR_ACCESS_TOKEN_EXP);
    if Assigned(LJSONValue) then
      FAccessTokenExp :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
    // refresh after (access token)
    LJSONValue := LJSONObject.GetValue(AR_REFRESH_AFTER);
    if Assigned(LJSONValue) then
      FRefreshAfter :=  UnixToDateTime((LJSONValue as TJSONNumber).AsInt64, True); // True = UTC
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

function TioAuthResponse.GetAuthGrant: String;
begin
  Result := FAuthGrant;
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

function TioAuthResponse.GetRefreshAfter: TDateTime;
begin
  Result := FRefreshAfter;
end;

function TioAuthResponse.GetRefreshTokenExp: TDateTime;
begin
  Result := FRefreshTokenExp;
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

function TioAuthResponse.HasAuthGrant: Boolean;
begin
  Result := FAuthGrant <> IO_STRING_NULL_VALUE;
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

procedure TioAuthResponse.SetAuthGrant(const Value: String);
begin
  FAuthGrant := Value;
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

procedure TioAuthResponse.SetRefreshAfter(const Value: TDateTime);
begin
  FRefreshAfter := Value;
end;

procedure TioAuthResponse.SetRefreshTokenExp(const Value: TDateTime);
begin
  FRefreshTokenExp := Value;
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
    // is authorized
    LJSONObject.AddPair(AR_IS_AUTHORIZED, FIsAuthorized);
    // auth grant (auth code)
    if HasAuthGrant then
      LJSONObject.AddPair(AR_AUTH_GRANT, FAuthGrant);
    // refresh token
    if HasRefreshToken then
    begin
      LJSONObject.AddPair(AR_REFRESH_TOKEN, FRefreshToken);
      LJSONObject.AddPair(AR_REFRESH_TOKEN_EXP, DateTimeToUnix(FRefreshTokenExp, True)); // True = UTC
    end;
    // access token
    if HasAccessToken then
    begin
      LJSONObject.AddPair(AR_ACCESS_TOKEN, FAccessToken);
      LJSONObject.AddPair(AR_ACCESS_TOKEN_EXP, DateTimeToUnix(FAccessTokenExp, True)); // True = UTC
      LJSONObject.AddPair(AR_REFRESH_AFTER, DateTimeToUnix(RefreshAfter, True)); // True = UTC
    end;
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

end.
