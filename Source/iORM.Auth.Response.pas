unit iORM.Auth.Response;

interface

uses
  iORM.Auth.Interfaces;

type

  TioAuthResponse = class(TInterfacedObject, IioAuthResponse)
  private
    FIsAuthorized: Boolean;
    // user
    FUserAuthToken: String;
    FUserOID: Integer;
    // app
    FAppAuthToken: String;
    FAppOID: Integer;
    // access
    FAccessToken: String;
    FRefreshAfter: TDateTime;
    FRefreshToken: String;
    function GetAccessToken: String;
    function GetAppAuthToken: String;
    function GetAppOID: Integer;
    function GetIsAuthorized: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetUserAuthToken: String;
    function GetUserOID: Integer;
    procedure SetAccessToken(const Value: String);
    procedure SetAppAuthToken(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetIsAuthorized(const Value: Boolean);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetUserAuthToken(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    // properties
    property IsAuthorized: Boolean read GetIsAuthorized write SetIsAuthorized;
    // user
    property UserAuthToken: String read GetUserAuthToken write SetUserAuthToken;
    property UserOID: Integer read GetUserOID write SetUserOID;
    // app
    property AppAuthToken: String read GetAppAuthToken write SetAppAuthToken;
    property AppOID: Integer read GetAppOID write SetAppOID;
    // access
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property RefreshAfter: TDateTime read GetRefreshAfter write SetRefreshAfter;
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
  end;

implementation

{ TioAuthResponse }

function TioAuthResponse.GetAccessToken: String;
begin
  Result := FAccessToken;
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

function TioAuthResponse.GetRefreshAfter: TDateTime;
begin
  Result := FRefreshAfter;
end;

function TioAuthResponse.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioAuthResponse.GetUserAuthToken: String;
begin
  Result := FUserAuthToken;
end;

function TioAuthResponse.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

procedure TioAuthResponse.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
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

procedure TioAuthResponse.SetRefreshAfter(const Value: TDateTime);
begin
  FRefreshAfter := Value;
end;

procedure TioAuthResponse.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

procedure TioAuthResponse.SetUserAuthToken(const Value: String);
begin
  FUserAuthToken := Value;
end;

procedure TioAuthResponse.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

end.
