unit iORM.Session.Model;

interface

uses
  iORM.Session.Interfaces;

const
  ROLES_SEPARATOR = ',';

type

  TioSession = class(TInterfacedObject, IioSession)
  private
    FConnectionName: String;
    FUserName: String;
    FUserID: Integer;
    FUserToken: String;
    function GetConnectionName: String;
    function GetUserID: Integer;
    function GetUserName: String;
    function GetUserToken: String;
    procedure SetConnectionName(const Value: String);
    procedure SetUserID(const Value: Integer);
    procedure SetUserName(const Value: String);
    procedure SetUserToken(const Value: String);
  public
    constructor Create;
    constructor CreateThreadSession(const AGlobalConnectionName: String);
    function HasRole(const ARole: String): Boolean;
    property ConnectionName: String read GetConnectionName write SetConnectionName;
    property UserID: Integer read GetUserID write SetUserID;
    property UserName: String read GetUserName write SetUserName;
    property UserToken: String read GetUserToken write SetUserToken;
  end;

implementation

uses System.SysUtils;

{ TioSession }

constructor TioSession.Create;
begin
  FConnectionName := String.Empty;
  FUserName := String.Empty;
  FUserID := 0;
  FUserRoles := String.Empty;
end;

constructor TioSession.CreateThreadSession(const AGlobalConnectionName: String);
begin
  Create;
  FConnectionName := AGlobalConnectionName;
end;

function TioSession.GetConnectionName: String;
begin
  Result := FConnectionName;
end;

function TioSession.GetUserID: Integer;
begin
  Result := FUserID;
end;

function TioSession.GetUserName: String;
begin
  Result := FUserName;
end;

function TioSession.GetUserToken: String;
begin
  // remove the leading and trailing comma
  Result := FUserToken.DeQuotedString(ROLES_SEPARATOR);
end;

function TioSession.HasRole(const ARole: String): Boolean;
begin
  Result := FUserToken.Contains(ROLES_SEPARATOR + ARole.ToLower + ROLES_SEPARATOR);
end;

procedure TioSession.SetConnectionName(const Value: String);
begin
  FConnectionName := Value;
end;

procedure TioSession.SetUserID(const Value: Integer);
begin
  FUserID := Value;
end;

procedure TioSession.SetUserName(const Value: String);
begin
  FUserName := Value;
end;

procedure TioSession.SetUserToken(const Value: String);
begin
  FUserToken := Value;
end;

end.
