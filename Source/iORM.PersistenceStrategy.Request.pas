unit iORM.PersistenceStrategy.Request;

interface

uses
  iORM.CommonTypes, iORM.PersistenceStrategy.Interfaces;

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
    FAuthGrant: String; // NEW
    FAuthIntention: TioAuthIntention; // NEW
    FAuthScope: String; // NEW
    FAuthToken: String; // for auth purposes -> AccessToken, RefreshToken, CodeVerifier, CodeChallenge
    // instances
    FObj1: TObject; // NEW
    FObj2: TObject; // NEW
    FIntf1: IInterface; // NEW
    FIntf2: IInterface; // NEW
    // others
    FBlindLevel: Byte;
    FIntentType: TioPersistenceIntentType;
    FMasterPropName: String;
    FMasterPropPath: String;
    FMethod: TioPersistenceStrategyMethod; // NEW
    FPropName: String; // NEW
    FRelationOID: Integer;
    FRelationPropName: String;
    // methods
    procedure _FillSessionRelatedProperties; inline;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetAuthGrant: String;
    function GetAuthIntention: TioAuthIntention;
    function GetAuthScope: String;
    function GetAuthToken: String;
    function GetBlindLevel: Byte;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetIntentType: TioPersistenceIntentType;
    function GetIntf1: IInterface;
    function GetIntf2: IInterface;
    function GetMasterPropName: String;
    function GetMasterPropPath: String;
    function GetMethod: TioPersistenceStrategyMethod;
    function GetObj1: TObject;
    function GetObj2: TObject;
    function GetPropName: String;
    function GetRelationOID: Integer;
    function GetRelationPropName: String;
    function GetUsr: String;
    function GetUsrOID: Integer;
    procedure SetAuthGrant(const Value: String);
    procedure SetAuthIntention(const Value: TioAuthIntention);
    procedure SetAuthScope(const Value: String);
    procedure SetBlindLevel(const Value: Byte);
    procedure SetIntentType(const Value: TioPersistenceIntentType);
    procedure SetIntf1(const Value: IInterface);
    procedure SetIntf2(const Value: IInterface);
    procedure SetMasterPropName(const Value: String);
    procedure SetMasterPropPath(const Value: String);
    procedure SetObj1(const Value: TObject);
    procedure SetObj2(const Value: TObject);
    procedure SetPropName(const Value: String);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropName(const Value: String);
  public
    constructor Create(const AMethod: TioPersistenceStrategyMethod; const FillSessionRelatedProperties: Boolean);
    constructor CreateByJSONString(const AJSONString:String);
    function AsString: String;
    // method
    property Method: TioPersistenceStrategyMethod read GetMethod;
    // session data
    property App: String read GetApp;
    property AppOID: Integer read GetAppOID;
    property Connection: String read GetConnection;
    property ConnectionRemote: String read GetConnectionRemote;
    property Usr: String read GetUsr;
    property UsrOID: Integer read GetUsrOID;
    // auth
    property AuthGrant: String read GetAuthGrant;
    property AuthIntention: TioAuthIntention read GetAuthIntention;
    property AuthScope: String read GetAuthScope;
    property AuthToken: String read GetAuthToken; // for auth purposes -> AccessToken, RefreshToken, CodeVerifier, CodeChallenge
    // instances
    property Intf1: IInterface read GetIntf1 write SetIntf1;
    property Intf2: IInterface read GetIntf2 write SetIntf2;
    property Obj1: TObject read GetObj1 write SetObj1;
    property Obj2: TObject read GetObj2 write SetObj2;
    // others
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    property IntentType: TioPersistenceIntentType read GetIntentType write SetIntentType;
    property MasterPropName: String read GetMasterPropName write SetMasterPropName;
    property MasterPropPath: String read GetMasterPropPath write SetMasterPropPath;
    property PropName: String read GetPropName write SetPropName;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property RelationPropName: String read GetRelationPropName write SetRelationPropName;
  end;

implementation

uses
  iORM.Abstraction, iORM.Auth.Interfaces;

{ TioPersistenceStrategyRequest }

function TioPersistenceStrategyRequest.AsString: String;
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.Create;
  try
    // method
    LJSONObject.AddPair(PSR_METHOD, Ord(FMethod));
    // ---------- session ----------
    // App
    if not FApp.IsEmpty then
      LJSONObject.AddPair(PSR_SESSION_APP, FApp.AsString);
    // AppOID
    if FAppOID <> IO_INTEGER_NULL_VALUE then
      LJSONObject.AddPair(PSR_SESSION_APPOID, FAppOID);
    // Connection
    if not FConnection.IsEmpty then
      LJSONObject.AddPair(PSR_SESSION_CONNECTION, FConnection.AsString);
    // ConnectionRemote
    if not FConnectionRemote.IsEmpty then
      LJSONObject.AddPair(PSR_SESSION_CONNECTIONREMOTE, FConnectionRemote.AsString);
    // User
    if not FUsr.IsEmpty then
      LJSONObject.AddPair(PSR_SESSION_USER, FUsr.AsString);
    // UserOID
    if not FUsrOID.IsEmpty then
      LJSONObject.AddPair(PSR_SESSION_USEROID, FUsrOID.AsString);
    // ---------- auth ----------
    // AuthGrant
    if not FAuthGrant.IsEmpty then
      LJSONObject.AddPair(PSR_AUTH_GRANT, FAuthGrant.AsString);
    // AuthIntention
    LJSONObject.AddPair(PSR_AUTH_INTENTION, Ord(FAuthIntention));
    // AuthScope
    if not FAuthScope.IsEmpty then
      LJSONObject.AddPair(PSR_AUTH_SCOPE, FAuthScope.AsString);
    // AuthToken
    if not FAuthToken.IsEmpty then
      LJSONObject.AddPair(PSR_AUTH_TOKEN, FAuthToken.AsString);
    // ---------- instances ----------
    // AIntf1
    if Assigned(FIntf1) then
      LJSONObject.AddPair(PSR_INSTANCES_INTF1, dj.From(FIntf1).byFields.TypeAnnotationsON.ToJsonValue);
    // AIntf2
    if Assigned(FIntf2) then
      LJSONObject.AddPair(PSR_INSTANCES_INTF2, dj.From(FIntf2).byFields.TypeAnnotationsON.ToJsonValue);
    // AObj1
    if Assigned(FObj1) then
      LJSONObject.AddPair(PSR_INSTANCES_OBJ1, dj.From(FObj1).byFields.TypeAnnotationsON.ToJsonValue);
    // AObj2
    if Assigned(FObj2) then
      LJSONObject.AddPair(PSR_INSTANCES_OBJ2, dj.From(FObj2).byFields.TypeAnnotationsON.ToJsonValue);
    // ---------- others ----------
    // BlindLevel
    LJSONObject.AddPair(PSR_BLINDLEVEL, FBlindLevel);
    // IntentType
    LJSONObject.AddPair(PSR_INTENTTYPE, Ord(FIntentType));
    // MasterPropName
    if not FMasterPropName.IsEmpty then
      LJSONObject.AddPair(PSR_MASTERPROPERTYNAME, FMasterPropName.AsString);
    // MasterPropPath
    if not FMasterPropPath.IsEmpty then
      LJSONObject.AddPair(PSR_MASTERPROPERTYPATH, FMasterPropPath.AsString);
    // PropName
    if not FPropName.IsEmpty then
      LJSONObject.AddPair(PSR_PROPERTYNAME, FPropName.AsString);
    // RelationOID
    if FRelationOID <> IO_INTEGER_NULL_VALUE then
      LJSONObject.AddPair(PSR_RELATIONID, FRelationOID);
    // RelationPropName
    if FRelationPropName <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(PSR_RELATIONPROPERTYNAME, FRelationPropName);
    // ---------- end ----------
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

constructor TioPersistenceStrategyRequest.Create(const AMethod: TioPersistenceStrategyMethod; const FillSessionRelatedProperties: Boolean);
begin
  // method
  FMethod := AMethod;
  // auth and session
  FAuthGrant := IO_STRING_NULL_VALUE;
  FAuthIntention: TioAuthIntention.aiRead;
  FAuthScope := IO_STRING_NULL_VALUE;
  if FillSessionRelatedProperties then
    _FillSessionRelatedProperties;
  // instances
  AIntf1 := nil;
  AIntf2 := nil;
  AObj1 := nil;
  AObj2 := nil;
  // others
  FBlindLevel := BL_DEFAULT;
  FIntent := TioPersistenceIntentType.itRegular;
  FMasterPropName := IO_STRING_NULL_VALUE;
  FMasterPropPath := IO_STRING_NULL_VALUE;
  FPropName := IO_STRING_NULL_VALUE;
  FRelationOID := IO_INTEGER_NULL_VALUE;
  FRelationPropName := IO_STRING_NULL_VALUE;
end;

constructor TioPersistenceStrategyRequest.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  Create;
  LJSONObject := TJSONObject.ParseJSONValue(Value) as TJSONObject;
  try
    // Method
    LJSONValue := LJSONObject.GetValue(PSR_METHOD);
    if Assigned(LJSONValue) then
      FAuthIntention := TioPersistenceStrategyMethod((LJSONValue as TJSONNumber).AsInt)
    else
      raise EioGenericException.Create(ClassName, 'CreateByJSONString', '"Method" property not present (JSON).');
    // ---------- session ----------
    // App
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_APP);
    if Assigned(LJSONValue) then
      FApp := LJSONValue.Value;
    // AppOID
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_APPOID);
    if Assigned(LJSONValue) then
      FAppOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // Connection
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_CONNECTION);
    if Assigned(LJSONValue) then
      FConnection := LJSONValue.Value;
    // ConnectionRemote
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_CONNECTIONREMOTE);
    if Assigned(LJSONValue) then
      FConnectionRemote := LJSONValue.Value;
    // User
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_USER);
    if Assigned(LJSONValue) then
      FUsr := LJSONValue.Value;
    // UserOID
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_USEROID);
    if Assigned(LJSONValue) then
      FUsrOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // ---------- auth ----------
    // AuthGrant
    LJSONValue := LJSONObject.GetValue(PSR_AUTH_GRANT);
    if Assigned(LJSONValue) then
      FAuthGrant := LJSONValue.Value;
    // AuthIntention
    LJSONValue := LJSONObject.GetValue(PSR_AUTH_INTENTION);
    if Assigned(LJSONValue) then
      FAuthIntention := TioAuthIntention((LJSONValue as TJSONNumber).AsInt);
    // AuthScope
    LJSONValue := LJSONObject.GetValue(PSR_AUTH_SCOPE);
    if Assigned(LJSONValue) then
      FAuthScope := LJSONValue.Value;
    // AuthToken
    LJSONValue := LJSONObject.GetValue(PSR_AUTH_TOKEN);
    if Assigned(LJSONValue) then
      FAuthToken := LJSONValue.Value;
    // ---------- instances ----------
    // AIntf1
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_INTF1);
    if Assigned(LJSONValue) then
      FIntf1 := dj.FromJSON(FJSONDataValue).byFields.TypeAnnotationsON.ToObject;
    // AIntf2
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_INTF2);
    if Assigned(LJSONValue) then
      FIntf2 := dj.FromJSON(FJSONDataValue).byFields.TypeAnnotationsON.ToObject;
    // AObj1
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_OBJ1);
    if Assigned(LJSONValue) then
      FObj1 := dj.FromJSON(FJSONDataValue).byFields.TypeAnnotationsON.ToObject;
    // AObj2
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_OBJ2);
    if Assigned(LJSONValue) then
      FObj2 := dj.FromJSON(FJSONDataValue).byFields.TypeAnnotationsON.ToObject;
    // ---------- others ----------
    // BlindLevel
    LJSONValue := LJSONObject.GetValue(PSR_BLINDLEVEL);
    if Assigned(LJSONValue) then
      FBlindLevel := dj.FromJSON(LJSONValue).&To<Byte>;
    // IntentType
    LJSONValue := LJSONObject.GetValue(PSR_INTENTTYPE);
    if Assigned(LJSONValue) then
      FIntentType := TioPersistenceIntentType((LJSONValue as TJSONNumber).AsInt);
    // MasterPropName
    LJSONValue := LJSONObject.GetValue(PSR_MASTERPROPERTYNAME);
    if Assigned(LJSONValue) then
      FMasterPropName := LJSONValue.Value;
    // MasterPropPath
    LJSONValue := LJSONObject.GetValue(PSR_MASTERPROPERTYPATH);
    if Assigned(LJSONValue) then
      FMasterPropPath := LJSONValue.Value;
    // PropName
    LJSONValue := LJSONObject.GetValue(PSR_PROPERTYNAME);
    if Assigned(LJSONValue) then
      FPropName := LJSONValue.Value;
    // RelationOID
    LJSONValue := LJSONObject.GetValue(PSR_RELATIONID);
    if Assigned(LJSONValue) then
      FRelationOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // RelationPropName
    LJSONValue := LJSONObject.GetValue(PSR_RELATIONPROPERTYNAME);
    if Assigned(LJSONValue) then
      FRelationPropName := dj.FromJSON(LJSONValue).&To<String>;
    // ---------- end ----------
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

function TioPersistenceStrategyRequest.GetAuthGrant: String;
begin
  Result := FAuthGrant;
end;

function TioPersistenceStrategyRequest.GetAuthIntention: TioAuthIntention;
begin
  Result := FAuthIntention;
end;

function TioPersistenceStrategyRequest.GetAuthScope: String;
begin
  Result := FAuthScope;
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

function TioPersistenceStrategyRequest.GetIntf1: IInterface;
begin
  Result := FIntf1;
end;

function TioPersistenceStrategyRequest.GetIntf2: IInterface;
begin
  Result := FIntf2;
end;

function TioPersistenceStrategyRequest.GetMasterPropName: String;
begin
  Result := FMasterPropName;
end;

function TioPersistenceStrategyRequest.GetMasterPropPath: String;
begin
  Result := FMasterPropPath;
end;

function TioPersistenceStrategyRequest.GetMethod: TioPersistenceStrategyMethod;
begin
  Result := FMethod;
end;

function TioPersistenceStrategyRequest.GetObj1: TObject;
begin
  Result := FObj1;
end;

function TioPersistenceStrategyRequest.GetObj2: TObject;
begin
  Result := FObj2;
end;

function TioPersistenceStrategyRequest.GetPropName: String;
begin
  Result := FPropName;
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

procedure TioPersistenceStrategyRequest.SetAuthGrant(const Value: String);
begin
  FAuthGrant := Value;
end;

procedure TioPersistenceStrategyRequest.SetAuthIntention(const Value: TioAuthIntention);
begin
  FAuthIntention := Value;
end;

procedure TioPersistenceStrategyRequest.SetAuthScope(const Value: String);
begin
  FAuthScope := Value;
end;

procedure TioPersistenceStrategyRequest.SetBlindLevel(const Value: Byte);
begin
  FBlindLevel := Value;
end;

procedure TioPersistenceStrategyRequest.SetIntent(const Value: TioPersistenceIntentType);
begin
  FIntent := Value;
end;

procedure TioPersistenceStrategyRequest.SetIntf1(const Value: IInterface);
begin
  FIntf1 := Value:
end;

procedure TioPersistenceStrategyRequest.SetIntf2(const Value: IInterface);
begin
  FIntf2 := Value:
end;

procedure TioPersistenceStrategyRequest.SetMasterPropName(const Value: String);
begin
  FMasterPropName := Value;
end;

procedure TioPersistenceStrategyRequest.SetMasterPropPath(const Value: String);
begin
  FMasterPropPath := Value;
end;

procedure TioPersistenceStrategyRequest.SetObj1(const Value: TObject);
begin
  FObj1 := Value;
end;

procedure TioPersistenceStrategyRequest.SetObj2(const Value: TObject);
begin
  FObj2 := Value;
end;

procedure TioPersistenceStrategyRequest.SetPropName(const Value: String);
begin
  FPropName := Value;
end;

procedure TioPersistenceStrategyRequest.SetRelationOID(const Value: Integer);
begin
  FRelationOID := Value;
end;

procedure TioPersistenceStrategyRequest.SetRelationPropName(const Value: String);
begin
  FRelationPropName := Value;
end;

procedure TioPersistenceStrategyRequest._FillSessionRelatedProperties;
begin
  try
    with TioApplication.AcquireSession do
    begin
      // session data
      FApp := SessionData.App;
      FAppOID := SessionData.AppOID;
      FConnection := SessionData.ConnectionName;
      FConnectionRemote := SessionData.ConnectionNameRemote;
      FUsr := SessionData.Usr;
      FUsrOID := SessionData.UsrOID;
      // auth
      FAuthToken := AccessToken;
    end;
  finally
    TioApplication.ReleaseSession;
  end;
end;

end.
