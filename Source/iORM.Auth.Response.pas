unit iORM.Auth.Response;

interface

uses
  iORM.Auth.Interfaces;

type

  TioAuthResponse = class(TInterfacedObject, IioAuthResponse)
  private
    FIsAuthorized: Boolean;
    // user
    FUser: String;
    FUserAuthToken: String;
    FUserOID: Integer;
    // app
    FApp: String;
    FAppAuthToken: String;
    FAppOID: Integer;
    // access
    FAccessToken: String;
    FRefreshAfter: TDateTime;
    FRefreshToken: String;
    function GetAccessToken: String;
    function GetAppAuthToken: String;
    function GetAppOID: Integer;
    function GetApp: String;
    function GetIsAuthorized: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetUserAuthToken: String;
    function GetUserOID: Integer;
    function GetUser: String;
    procedure SetAccessToken(const Value: String);
    procedure SetAppAuthToken(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetApp(const Value: String);
    procedure SetIsAuthorized(const Value: Boolean);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetUserAuthToken(const Value: String);
    procedure SetUserOID(const Value: Integer);
    procedure SetUser(const Value: String);
  public
    constructor Create;
    constructor CreateByString(const AValue: String);
    function HasAccessToken: Boolean;
    function HasAppAuthToken: Boolean;
    function HasRefreshAfter: Boolean;
    function HasRefreshToken: Boolean;
    function HasUserAuthToken: Boolean;
    function AsString: String;
    // properties
    property IsAuthorized: Boolean read GetIsAuthorized write SetIsAuthorized;
    // user
    property UserAuthToken: String read GetUserAuthToken write SetUserAuthToken;
    property UserOID: Integer read GetUserOID write SetUserOID;
    property User: String read GetUser write SetUser;
    // app
    property AppAuthToken: String read GetAppAuthToken write SetAppAuthToken;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property App: String read GetApp write SetApp;
    // access
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property RefreshAfter: TDateTime read GetRefreshAfter write SetRefreshAfter;
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
  end;

implementation

uses
  iORM.CommonTypes, DJSON, DJSON.Params;

{ TioAuthResponse }

constructor TioAuthResponse.Create;
begin
    FIsAuthorized := False;
    // user
    FUser := IO_STRING_NULL_VALUE;
    FUserAuthToken := IO_STRING_NULL_VALUE;
    FUserOID := IO_INTEGER_NULL_VALUE;
    // app
    FApp := IO_STRING_NULL_VALUE;
    FAppAuthToken := IO_STRING_NULL_VALUE;
    FAppOID := IO_INTEGER_NULL_VALUE;
    // access
    FAccessToken := IO_STRING_NULL_VALUE;
    FRefreshAfter := IO_DATETIME_NULL_VALUE;
    FRefreshToken := IO_STRING_NULL_VALUE;
end;

constructor TioAuthResponse.CreateByString(const AValue: String);
begin
  Create;
  dj.FromJson(AValue).byFields.DateTimeFormat(TdjDateTimeFormat.dfUnix).&To(Self);
end;

function TioAuthResponse.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioAuthResponse.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthResponse.GetAppAuthToken: String;
begin
  Result := FAppAuthToken;
end;

function TioAuthResponse.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioAuthResponse.GetIsAuthorized: Boolean;
begin
  Result := FIsAuthorized;
end;

function TioAuthResponse.GetIsExpired: Boolean;
begin
  Result := FIsExpired;
end;

function TioAuthResponse.GetRefreshAfter: TDateTime;
begin
  Result := FRefreshAfter;
end;

function TioAuthResponse.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioAuthResponse.GetUser: String;
begin
  Result := FUser;
end;

function TioAuthResponse.GetUserAuthToken: String;
begin
  Result := FUserAuthToken;
end;

function TioAuthResponse.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

function TioAuthResponse.HasAccessToken: Boolean;
begin
  Result := FAccessToken = IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasAppAuthToken: Boolean;
begin
  Result := FAppAuthToken = IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasRefreshAfter: Boolean;
begin
  Result := FRefreshAfter = IO_DATETIME_NULL_VALUE;
end;

function TioAuthResponse.HasRefreshToken: Boolean;
begin
  Result := FRefreshToken = IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasUserAuthToken: Boolean;
begin
  Result := FUserAuthToken = IO_STRING_NULL_VALUE;
end;

procedure TioAuthResponse.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioAuthResponse.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioAuthResponse.SetAppAuthToken(const Value: String);
begin
  FAppAuthToken := Value;
end;

procedure TioAuthResponse.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthResponse.SetIsAuthorized(const Value: Boolean);
begin
  FIsAuthorized := Value;
end;

procedure TioAuthResponse.SetIsExpired(const Value: Boolean);
begin
  FIsExpired := Value;
end;

procedure TioAuthResponse.SetRefreshAfter(const Value: TDateTime);
begin
  FRefreshAfter := Value;
end;

procedure TioAuthResponse.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

procedure TioAuthResponse.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TioAuthResponse.SetUserAuthToken(const Value: String);
begin
  FUserAuthToken := Value;
end;

procedure TioAuthResponse.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

function TioAuthResponse.AsString: String;
begin
  Result := dj.From(Self).byFields.DateTimeFormat(TdjDateTimeFormat.dfUnix).ToJson;
end;

end.
