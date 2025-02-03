unit iORM.PersistenceStrategy.Request;

interface

type

  TioPersistenceStrategyRequest = class
  private
    // session data
    FApp: String;
    FAppOID: Integer;
    FConnection: String;
    FConnectionRemote: String;
    FUsr: String;
    FUsrOID: Integer;
    // auth
    FAuthToken: String; // for auth purposes -> AccessToken, RefreshToken, CodeVerifier, CodeChallenge
    // others
    FBlindLevel: Byte;
    FIntent: TioPersistenceIntentType;
    FMasterPropName: String;
    FMasterPropPath: String;
    FRelationOID: Integer;
    FRelationPropName: String;
    // methods
    function GetApp: String;
    function GetAppOID: Integer;
    function GetAuthToken: String;
    function GetBlindLevel: Byte;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetIntent: TioPersistenceIntentType;
    function GetMasterPropName: String;
    function GetMasterPropPath: String;
    function GetRelationOID: Integer;
    function GetRelationPropName: String;
    function GetUsr: String;
    function GetUsrOID: Integer;
    procedure SetMasterPropName(const Value: String);
    procedure SetMasterPropPath(const Value: String);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropName(const Value: String);
  public
    constructor Create(const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
    constructor CreateByJSONString(const AJSONString:String);
    function AsString: String;
    // session data
    property App: String read GetApp;
    property AppOID: Integer read GetAppOID;
    property Connection: String read GetConnection;
    property ConnectionRemote: String read GetConnectionRemote;
    property Usr: String read GetUsr;
    property UsrOID: Integer read GetUsrOID;
    // auth
    property AuthToken: String read GetAuthToken; // for auth purposes -> AccessToken, RefreshToken, CodeVerifier, CodeChallenge
    // others
    property BlindLevel: Byte read GetBlindLevel;
    property Intent: TioPersistenceIntentType read GetIntent;
    property MasterPropName: String read GetMasterPropName write SetMasterPropName;
    property MasterPropPath: String read GetMasterPropPath write SetMasterPropPath;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property RelationPropName: String read GetRelationPropName write SetRelationPropName;
  end;

implementation

uses
  iORM.Abstraction, iORM.Auth.Interfaces;

{ TioPersistenceStrategyRequest }

function TioPersistenceStrategyRequest.AsString: String;
begin
  // NB: quando serializza sostituisce il ConnectionName con il ConnectionNameRemote in modo che l'app server usi la connessione
  //      corretta (quella remote) che diventa di fatto la connessione in uso per il server
  Result := Format('{"Intent": %d, "BlindLevel": %d, "RelationPropName": "%s", "RelationOID": %d, "MasterPropName": "%s", "MasterPropPath": "%s", "AuthToken": "%s", "App": "%s", "AppOID": %d, "ConnectionName": "%s", "ConnectionNameRemote": "%s", "User": "%s", "UserOID": %d}',
    [Ord(FIntent), FBlindLevel, FRelationPropName, FRelationOID, FMasterPropName, FMasterPropPath, FAuthToken, FApp, FAppOID, FConnectionNameRemote, IO_STRING_NULL_VALUE, FUser, FUserOID]);
end;

constructor TioPersistenceStrategyRequest.Create(const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
var
  LSession: IioAuthSession;
begin
  FIntent := AIntent;
  FBlindLevel := ABlindLevel;
  FMasterPropName := IO_STRING_NULL_VALUE;
  FMasterPropPath := IO_STRING_NULL_VALUE;
  FRelationOID := IO_INTEGER_NULL_VALUE;
  FRelationPropName := IO_STRING_NULL_VALUE;
  // Fill session
  LSession := TioApplication.AcquireSession;
  try
    // session data
    FApp := LSession.SessionData.App;
    FAppOID := LSession.SessionData.AppOID;
    FConnection := LSession.SessionData.ConnectionName;
    FConnectionRemote := LSession.SessionData.ConnectionNameRemote;
    FUsr := LSession.SessionData.Usr;
    FUsrOID := LSession.SessionData.UsrOID;
    // auth
    FAuthToken := LSession.AccessToken;
  finally
    TioApplication.ReleaseSession;
  end;
end;

constructor TioPersistenceStrategyRequest.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  LJSONObject := TJSONObject.ParseJSONValue(Value) as TJSONObject;
  try
    // session data
    FApp := LJSONObject.GetValue('App').Value;
    FAppOID := (LJSONObject.GetValue('AppOID') as TJSONNumber).AsInt;
    FConnectionName := LJSONObject.GetValue('ConnectionName').Value;
    FConnectionNameRemote := LJSONObject.GetValue('ConnectionNameRemote').Value;
    FUser := LJSONObject.GetValue('User').Value;
    FUserOID := (LJSONObject.GetValue('UserOID') as TJSONNumber).AsInt;
    // auth
    FAuthToken := LJSONObject.GetValue('AuthToken').Value;
    // others
    FBlindLevel := (LJSONObject.GetValue('BlindLevel') as TJSONNumber).AsInt;
    FIntent := TioPersistenceIntentType((LJSONObject.GetValue('FIntent') as TJSONNumber).AsInt);
    FMasterPropName := LJSONObject.GetValue('MasterPropName').Value;
    FMasterPropPath := LJSONObject.GetValue('MasterPropPath').Value;
    FRelationOID := (LJSONObject.GetValue('RelationOID') as TJSONNumber).AsInt;
    FRelationPropName := LJSONObject.GetValue('RelationPropName').Value;
  finally
    LJSONObject.Free;
  end;
end;

function TioPersistenceStrategyRequest.GetApp: String;
begin
  Result := FApp;
end;

function TioPersistenceStrategyRequest.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioPersistenceStrategyRequest.GetAuthToken: String;
begin
  Result := FAuthToken;
end;

function TioPersistenceStrategyRequest.GetBlindLevel: Byte;
begin
  Result := FBlindLevel;
end;

function TioPersistenceStrategyRequest.GetConnection: String;
begin
  Result := FConnection;
end;

function TioPersistenceStrategyRequest.GetConnectionRemote: String;
begin
  Result := FConnectionRemote;
end;

function TioPersistenceStrategyRequest.GetIntent: TioPersistenceIntentType;
begin
  Result := FIntent;
end;

function TioPersistenceStrategyRequest.GetMasterPropName: String;
begin
  Result := FMasterPropName;
end;

function TioPersistenceStrategyRequest.GetMasterPropPath: String;
begin
  Result := FMasterPropPath;
end;

function TioPersistenceStrategyRequest.GetRelationOID: Integer;
begin
  Result := FRelationOID;
end;

function TioPersistenceStrategyRequest.GetRelationPropName: String;
begin
  Result := FRelationPropName;
end;

function TioPersistenceStrategyRequest.GetUsr: String;
begin
  Result := FUsr;
end;

function TioPersistenceStrategyRequest.GetUsrOID: Integer;
begin
  Result := FUsrOID;
end;

procedure TioPersistenceStrategyRequest.SetMasterPropName(const Value: String);
begin
  FMasterPropName := Value;
end;

procedure TioPersistenceStrategyRequest.SetMasterPropPath(const Value: String);
begin
  FMasterPropPath := Value;
end;

procedure TioPersistenceStrategyRequest.SetRelationOID(const Value: Integer);
begin
  FRelationOID := Value;
end;

procedure TioPersistenceStrategyRequest.SetRelationPropName(const Value: String);
begin
  FRelationPropName := Value;
end;

end.
