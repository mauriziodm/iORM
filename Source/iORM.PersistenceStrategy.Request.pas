unit iORM.PersistenceStrategy.Request;

interface

uses
  iORM.CommonTypes, iORM.PersistenceStrategy.Interfaces,
  System.Rtti, iORM.LiveBindings.BSPersistence, iORM.Where.Interfaces,
  iORM.Abstraction, iORM.Attributes, iORM.Auth.Interfaces,
  iORM.Abstraction.SessionData.Interfaces;

type

  TioPersistenceStrategyRequest = class(TInterfacedObject, IioPersistenceStrategyRequest)
  private
    // method
    FMethod: TioPersistenceStrategyMethod;
    // auth
    [ioSkip]
    FAuthCache: IioAuthCache;
    FAuthContext: String;
    // session data
    FToken: String;
    FApp: String;
    FAppOID: Integer;
    FConnection: String;
    FConnectionRemote: String;
    FLic: String;
    FLicOID: Integer;
    FUsr: String;
    FUsrOID: Integer;
    // instances
    FDTO: TObject;
    FDTO_Serialize: Boolean;
    FIntf1: IInterface;
    FIntf1_Serialize: Boolean;
    FListDTO: TObject;
    FListDTO_Serialize: Boolean;
    FMasterBSPersistence: TioBSPersistence;
    FObj1: TObject;
    FObj1_Serialize: Boolean;
    FWhere: IioWhere;
    // others
    FBlindLevel: Byte;
    FForceAuthDecision: Boolean;
    FIntent: TioPersistenceIntentType;
    FMasterPropName: String;
    FMasterPropPath: String;
    FPropName: String;
    FRelationOID: Integer;
    FRelationPropName: String;
    // result
    FResult: TValue;
    // methods
    procedure _Clear(const FillSessionRelatedProperties: Boolean); inline;
    procedure _ClearGenericsFromJsonText(var AJSONText: String);
    function GetApp: String;
    function GetAppOID: Integer;
    function GetAuthCache: IioAuthCache;
    function GetAuthContext: String;
    function GetBlindLevel: Byte;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetDTO: TObject;
    function GetDTO_Serialize: Boolean;
    function GetForceAuthDecision: Boolean;
    function GetIntent: TioPersistenceIntentType;
    function GetIntf1: IInterface;
    function GetIntf1_Serialize: Boolean;
    function GetLic: String;
    function GetLicOID: Integer;
    function GetListDTO: TObject;
    function GetListDTO_Serialize: Boolean;
    function GetMasterBSPersistence: TioBSPersistence;
    function GetMasterPropName: String;
    function GetMasterPropPath: String;
    function GetMethod: TioPersistenceStrategyMethod;
    function GetObj1: TObject;
    function GetObj1_Serialize: Boolean;
    function GetPropName: String;
    function GetRelationOID: Integer;
    function GetRelationPropName: String;
    function GetResult: TValue;
    function GetResultAsBoolean: Boolean;
    function GetResultAsInteger: Integer;
    function GetToken: String;
    function GetUsr: String;
    function GetUsrOID: Integer;
    function GetWhere: IioWhere;
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetAuthCache(const Value: IioAuthCache);
    procedure SetAuthContext(const Value: String);
    procedure SetBlindLevel(const Value: Byte);
    procedure SetConnection(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetDTO(const Value: TObject);
    procedure SetDTO_Serialize(const Value: Boolean);
    procedure SetForceAuthDecision(const Value: Boolean);
    procedure SetIntent(const Value: TioPersistenceIntentType);
    procedure SetIntf1(const Value: IInterface);
    procedure SetIntf1_Serialize(const Value: Boolean);
    procedure SetLic(const Value: String);
    procedure SetLicOID(const Value: Integer);
    procedure SetListDTO(const Value: TObject);
    procedure SetListDTO_Serialize(const Value: Boolean);
    procedure SetMasterBSPersistence(const Value: TioBSPersistence);
    procedure SetMasterPropName(const Value: String);
    procedure SetMasterPropPath(const Value: String);
    procedure SetObj1(const Value: TObject);
    procedure SetObj1_Serialize(const Value: Boolean);
    procedure SetPropName(const Value: String);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropName(const Value: String);
    procedure SetResult(const Value: TValue);
    procedure SetResultAsBoolean(const Value: Boolean);
    procedure SetResultAsInteger(const Value: Integer);
    procedure SetToken(const Value: String);
    procedure SetUsr(const Value: String);
    procedure SetUsrOID(const Value: Integer);
    procedure SetWhere(const Value: IioWhere);
  public
    constructor Create(const AMethod: TioPersistenceStrategyMethod; const FillSessionRelatedProperties: Boolean);
    constructor CreateByJSONString(const AJSONString:String);
    function AsString: String;
    procedure ImportSessionData(const ASessionData: IioSessionData);
    procedure ImportSessionDataFromPSRequest(const APSRequest: IioPersistenceStrategyRequest);
    procedure SwitchToConnectionRemote;
    // method property
    property Method: TioPersistenceStrategyMethod read GetMethod;
    // auth
    property AuthCache: IioAuthCache read GetAuthCache write SetAuthCache;
    property AuthContext: String read GetAuthContext write SetAuthContext;
    property ForceAuthDecision: Boolean read GetForceAuthDecision write SetForceAuthDecision;
    // session data
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property Connection: String read GetConnection write SetConnection;
    property ConnectionRemote: String read GetConnectionRemote write SetConnectionRemote;
    property Lic: String read GetLic write SetLic;
    property LicOID: Integer read GetLicOID write SetLicOID;
    property Token: String read GetToken write SetToken;
    property Usr: String read GetUsr write SetUsr;
    property UsrOID: Integer read GetUsrOID write SetUsrOID;
    // instances
    property DTO: TObject read GetDTO write SetDTO;
    property DTO_Serialize: Boolean read GetDTO_Serialize write SetDTO_Serialize;
    property Intf1: IInterface read GetIntf1 write SetIntf1;
    property Intf1_Serialize: Boolean read GetIntf1_Serialize write SetIntf1_Serialize;
    property ListDTO: TObject read GetListDTO write SetListDTO;
    property ListDTO_Serialize: Boolean read GetListDTO_Serialize write SetListDTO_Serialize;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence write SetMasterBSPersistence;
    property Obj1: TObject read GetObj1 write SetObj1;
    property Obj1_Serialize: Boolean read GetObj1_Serialize write SetObj1_Serialize;
    property Where: IioWhere read GetWhere write SetWhere;
    // others
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    property Intent: TioPersistenceIntentType read GetIntent write SetIntent;
    property MasterPropName: String read GetMasterPropName write SetMasterPropName;
    property MasterPropPath: String read GetMasterPropPath write SetMasterPropPath;
    property PropName: String read GetPropName write SetPropName;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property RelationPropName: String read GetRelationPropName write SetRelationPropName;
    // result
    property Result: TValue read GetResult write SetResult;
    property ResultAsBoolean: Boolean read GetResultAsBoolean write SetResultAsBoolean;
    property ResultAsInteger: Integer read GetResultAsInteger write SetResultAsInteger;
  end;

implementation

uses
  System.JSON, DJSON, iORM.Exceptions, System.SysUtils, iORM.Auth.Factory, System.StrUtils;

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
    // AccessToken
    if (FToken <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_SESSION_TOKEN, FToken);
    // App
    if (FApp <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_SESSION_APP, FApp);
    // AppOID
    if FAppOID <> IO_INTEGER_NULL_VALUE then
      LJSONObject.AddPair(PSR_SESSION_APPOID, FAppOID);
    // Connection
    if (FConnection <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_SESSION_CONNECTION, FConnection);
    // ConnectionRemote
    if (FConnectionRemote <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_SESSION_CONNECTIONREMOTE, FConnectionRemote);
    // Lic
    if (FLic <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_SESSION_LIC, FLic);
    // LicOID
    if FLicOID <> IO_INTEGER_NULL_VALUE then
      LJSONObject.AddPair(PSR_SESSION_LICOID, FLicOID);
    // User
    if (FUsr <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_SESSION_USER, FUsr);
    // UserOID
    if (FUsrOID <> IO_INTEGER_NULL_VALUE) then
      LJSONObject.AddPair(PSR_SESSION_USEROID, FUsrOID);
    // ---------- instances ----------
    // DTO
    if FDTO_Serialize and Assigned(FDTO) then
      LJSONObject.AddPair(PSR_INSTANCES_DTO, dj.From(FDTO).byFields.TypeAnnotationsON.ToJsonValue);
    // AIntf1
    if FIntf1_Serialize and Assigned(FIntf1) then
      LJSONObject.AddPair(PSR_INSTANCES_INTF1, dj.From(FIntf1).byFields.TypeAnnotationsON.ToJsonValue);
    // ListDTO
    if FListDTO_Serialize and Assigned(FListDTO) then
      LJSONObject.AddPair(PSR_INSTANCES_LIST_DTO, dj.From(FListDTO).byFields.TypeAnnotationsON.ToJsonValue);
    // MasterBSPersistence
// NB: Non lo serializzo perchè tanto ho visto che nella HttpPersistenceStrategy non veniva passato nemmeno prima e quindi non veniva usato
//    if Assigned(FMasterBSPersistence) then
//      LJSONObject.AddPair(PSR_INSTANCES_MASTERBSPERSISTENCE, dj.From(FMasterBSPersistence).byFields.TypeAnnotationsON.ToJsonValue);
    // AObj1
    if FObj1_Serialize and Assigned(FObj1) then
      LJSONObject.AddPair(PSR_INSTANCES_OBJ1, dj.From(FObj1).byFields.TypeAnnotationsON.ToJsonValue);
    // Where
    if Assigned(FWhere) then
      LJSONObject.AddPair(PSR_INSTANCES_WHERE, dj.From(FWhere).byFields.TypeAnnotationsON.ToJsonValue);
    // ---------- others ----------
    // BlindLevel
    LJSONObject.AddPair(PSR_BLINDLEVEL, FBlindLevel);
    // IntentType
    LJSONObject.AddPair(PSR_INTENTTYPE, Ord(FIntent));
    // MasterPropName
    if (FMasterPropName <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_MASTERPROPERTYNAME, FMasterPropName);
    // MasterPropPath
    if (FMasterPropPath <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_MASTERPROPERTYPATH, FMasterPropPath);

    // PersistingNewEtmTimeSlot (Non credo sia necessaria serializzarla perchè agisce solo localmente)

    // PropName
    if (FPropName <> IO_STRING_NULL_VALUE) then
      LJSONObject.AddPair(PSR_PROPERTYNAME, FPropName);
    // RelationOID
    if FRelationOID <> IO_INTEGER_NULL_VALUE then
      LJSONObject.AddPair(PSR_RELATIONID, FRelationOID);
    // RelationPropName
    if FRelationPropName <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(PSR_RELATIONPROPERTYNAME, FRelationPropName);
    // ---------- end ----------
    // render as string
    Result := LJSONObject.ToString;
    // Sostituisce nel JSON eventuali TioWhere<T> (generics) con TioWhere(not generics) per evitare
    //  problemi poi nella deserializzazione (RTTI informations mancanti)
    _ClearGenericsFromJsonText(Result);
  finally
    LJSONObject.Free;
  end;
end;

constructor TioPersistenceStrategyRequest.Create(const AMethod: TioPersistenceStrategyMethod; const FillSessionRelatedProperties: Boolean);
begin
  // method
  FMethod := AMethod;
  // auth-cache
  FAuthCache := TioAuthFactory.NewAuthCacheCRUD;
  // other initializations
  _Clear(FillSessionRelatedProperties);
end;

constructor TioPersistenceStrategyRequest.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  // initialization
  _Clear(True);
  // Parse JSON string
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    // Method
    LJSONValue := LJSONObject.GetValue(PSR_METHOD);
    if Assigned(LJSONValue) then
      FMethod := TioPersistenceStrategyMethod((LJSONValue as TJSONNumber).AsInt)
    else
      raise EioGenericException.Create(ClassName, 'CreateByJSONString', '"Method" property not present (JSON).');
    // ---------- session ----------
    // AccessToken
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_TOKEN);
    if Assigned(LJSONValue) then
      FToken := LJSONValue.Value;
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
    // Lic
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_LIC);
    if Assigned(LJSONValue) then
      FLic := LJSONValue.Value;
    // LicOID
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_LICOID);
    if Assigned(LJSONValue) then
      FLicOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // User
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_USER);
    if Assigned(LJSONValue) then
      FUsr := LJSONValue.Value;
    // UserOID
    LJSONValue := LJSONObject.GetValue(PSR_SESSION_USEROID);
    if Assigned(LJSONValue) then
      FUsrOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // ---------- instances ----------
    // DTO
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_DTO);
    if Assigned(LJSONValue) then
      FDTO := dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
    // AIntf1
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_INTF1);
    if Assigned(LJSONValue) then
      if not Supports(dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject, IInterface, FIntf1) then
        EioGenericException.Create(ClassName, 'CreateByJSONString', 'IInterface not implemented by the object');
    // ListDTO
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_LIST_DTO);
    if Assigned(LJSONValue) then
      FListDTO := dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
    // MasterBSPersistence
// NB: Non lo serializzo perchè tanto ho visto che nella HttpPersistenceStrategy non veniva passato nemmeno prima e quindi non veniva usato
//    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_MASTERBSPERSISTENCE);
//    if Assigned(LJSONValue) then
//      FMasterBSPersistence := dj.FromJSON(FJSONDataValue).byFields.TypeAnnotationsON.ToObject;
    // AObj1
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_OBJ1);
    if Assigned(LJSONValue) then
      FObj1 := dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
    // Where
    LJSONValue := LJSONObject.GetValue(PSR_INSTANCES_WHERE);
    if Assigned(LJSONValue) then
      if not Supports(dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject, IioWhere, FWhere) then
        EioGenericException.Create(ClassName, 'CreateByJSONString', 'IioWhere interface not implemented by the object');
    // ---------- others ----------
    // BlindLevel
    LJSONValue := LJSONObject.GetValue(PSR_BLINDLEVEL);
    if Assigned(LJSONValue) then
      FBlindLevel := dj.FromJSON(LJSONValue).&To<Byte>;
    // IntentType
    LJSONValue := LJSONObject.GetValue(PSR_INTENTTYPE);
    if Assigned(LJSONValue) then
      FIntent := TioPersistenceIntentType((LJSONValue as TJSONNumber).AsInt);
    // MasterPropName
    LJSONValue := LJSONObject.GetValue(PSR_MASTERPROPERTYNAME);
    if Assigned(LJSONValue) then
      FMasterPropName := LJSONValue.Value;
    // MasterPropPath
    LJSONValue := LJSONObject.GetValue(PSR_MASTERPROPERTYPATH);
    if Assigned(LJSONValue) then
      FMasterPropPath := LJSONValue.Value;

    // PersistingNewEtmTimeSlot (Non credo sia necessaria serializzarla perchè agisce solo localmente)

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

function TioPersistenceStrategyRequest.GetAuthCache: IioAuthCache;
begin
  Result := FAuthCache;
end;

function TioPersistenceStrategyRequest.GetAuthContext: String;
begin
  Result := FAuthContext;
end;

function TioPersistenceStrategyRequest.GetToken: String;
begin
  Result := FToken;
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

function TioPersistenceStrategyRequest.GetDTO: TObject;
begin
  Result := FDTO;
end;

function TioPersistenceStrategyRequest.GetDTO_Serialize: Boolean;
begin
  Result := FDTO_Serialize;
end;

function TioPersistenceStrategyRequest.GetIntent: TioPersistenceIntentType;
begin
  Result := FIntent;
end;

function TioPersistenceStrategyRequest.GetIntf1: IInterface;
begin
  Result := FIntf1;
end;

function TioPersistenceStrategyRequest.GetIntf1_Serialize: Boolean;
begin
  Result := FIntf1_Serialize;
end;

function TioPersistenceStrategyRequest.GetLic: String;
begin
  Result := FLic;
end;

function TioPersistenceStrategyRequest.GetLicOID: Integer;
begin
  Result := FLicOID;
end;

function TioPersistenceStrategyRequest.GetListDTO: TObject;
begin
  Result := FListDTO;
end;

function TioPersistenceStrategyRequest.GetListDTO_Serialize: Boolean;
begin
  Result := FListDTO_Serialize;
end;

function TioPersistenceStrategyRequest.GetMasterBSPersistence: TioBSPersistence;
begin
  Result := FMasterBSPersistence;
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

function TioPersistenceStrategyRequest.GetObj1_Serialize: Boolean;
begin
  Result := FObj1_Serialize;
end;

function TioPersistenceStrategyRequest.GetForceAuthDecision: Boolean;
begin
  Result := FForceAuthDecision;
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

function TioPersistenceStrategyRequest.GetResult: TValue;
begin
  Result := FResult;
end;

function TioPersistenceStrategyRequest.GetResultAsBoolean: Boolean;
begin
  Result := FResult.AsBoolean;
end;

function TioPersistenceStrategyRequest.GetResultAsInteger: Integer;
begin
  Result := FResult.AsInteger;
end;

function TioPersistenceStrategyRequest.GetUsr: String;
begin
  Result := FUsr;
end;

function TioPersistenceStrategyRequest.GetUsrOID: Integer;
begin
  Result := FUsrOID;
end;

function TioPersistenceStrategyRequest.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

procedure TioPersistenceStrategyRequest.ImportSessionData(const ASessionData: IioSessionData);
begin
  // app
  FApp := ASessionData.App;
  FAppOID := ASessionData.AppOID;
  // connection
  FConnection := ASessionData.Connection;
  // license
  FLic := ASessionData.License;
  FLicOID := ASessionData.LicenseOID;
  // remote connection
  FConnectionRemote := ASessionData.ConnectionRemote;
  // user
  FUsr := ASessionData.User;
  FUsrOID := ASessionData.UserOID;
end;

procedure TioPersistenceStrategyRequest.ImportSessionDataFromPSRequest(const APSRequest: IioPersistenceStrategyRequest);
begin
  // auth-cache
  FAuthCache := APSRequest.AuthCache;
  // auth-context
  FAuthContext := APSRequest.AuthContext;
  // access token
  FToken := APSRequest.Token;
  // app
  FApp := APSRequest.App;
  FAppOID := APSRequest.AppOID;
  // connection
  FConnection := APSRequest.Connection;
  // license
  FLic := APSRequest.Lic;
  FLicOID := APSRequest.LicOID;
  // remote connection
  FConnectionRemote := APSRequest.ConnectionRemote;
  // user
  FUsr := APSRequest.Usr;
  FUsrOID := APSRequest.UsrOID;
end;

procedure TioPersistenceStrategyRequest.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioPersistenceStrategyRequest.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioPersistenceStrategyRequest.SetAuthCache(const Value: IioAuthCache);
begin
  FAuthCache := Value;
end;

procedure TioPersistenceStrategyRequest.SetAuthContext(const Value: String);
begin
  FAuthContext := Value;
end;

procedure TioPersistenceStrategyRequest.SetToken(const Value: String);
begin
  FToken := Value;
end;

procedure TioPersistenceStrategyRequest.SetBlindLevel(const Value: Byte);
begin
  FBlindLevel := Value;
end;

procedure TioPersistenceStrategyRequest.SetConnection(const Value: String);
begin
  FConnection := Value;
end;

procedure TioPersistenceStrategyRequest.SetConnectionRemote(const Value: String);
begin
  FConnectionRemote := Value;
end;

procedure TioPersistenceStrategyRequest.SetDTO(const Value: TObject);
begin
  FDTO := Value;
end;

procedure TioPersistenceStrategyRequest.SetDTO_Serialize(const Value: Boolean);
begin
  FDTO_Serialize := Value;
end;

procedure TioPersistenceStrategyRequest.SetIntent(const Value: TioPersistenceIntentType);
begin
  FIntent := Value;
end;

procedure TioPersistenceStrategyRequest.SetIntf1(const Value: IInterface);
begin
  FIntf1 := Value;
end;

procedure TioPersistenceStrategyRequest.SetIntf1_Serialize(const Value: Boolean);
begin
  FIntf1_Serialize := Value;
end;

procedure TioPersistenceStrategyRequest.SetLic(const Value: String);
begin
  FLic := Value;
end;

procedure TioPersistenceStrategyRequest.SetLicOID(const Value: Integer);
begin
  FLicOID := Value;
end;

procedure TioPersistenceStrategyRequest.SetListDTO(const Value: TObject);
begin
  FListDTO := Value;
end;

procedure TioPersistenceStrategyRequest.SetListDTO_Serialize(const Value: Boolean);
begin
  FListDTO_Serialize := Value;
end;

procedure TioPersistenceStrategyRequest.SetMasterBSPersistence(const Value: TioBSPersistence);
begin
  FMasterBSPersistence := Value;
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

procedure TioPersistenceStrategyRequest.SetObj1_Serialize(const Value: Boolean);
begin
  FObj1_Serialize := Value;
end;

procedure TioPersistenceStrategyRequest.SetForceAuthDecision(const Value: Boolean);
begin
  FForceAuthDecision := Value;
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

procedure TioPersistenceStrategyRequest.SetResult(const Value: TValue);
begin
  FResult := Value;
end;

procedure TioPersistenceStrategyRequest.SetResultAsBoolean(const Value: Boolean);
begin
  FResult := TValue.From<Boolean>(Value);
end;

procedure TioPersistenceStrategyRequest.SetResultAsInteger(const Value: Integer);
begin
  FResult := TValue.From<Integer>(Value);
end;

procedure TioPersistenceStrategyRequest.SetUsr(const Value: String);
begin
  FUsr := Value;
end;

procedure TioPersistenceStrategyRequest.SetUsrOID(const Value: Integer);
begin
  FUsrOID := Value;
end;

procedure TioPersistenceStrategyRequest.SetWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

procedure TioPersistenceStrategyRequest.SwitchToConnectionRemote;
begin
  FConnection := FConnectionRemote;
end;

procedure TioPersistenceStrategyRequest._Clear(const FillSessionRelatedProperties: Boolean);
begin
  // session
  FToken := IO_STRING_NULL_VALUE;
  if FillSessionRelatedProperties then
  begin
    FAuthCache := TioAuthFactory.NewAuthCacheCRUD;
    TioApplication.SessionDataStore._FillPersistenceStrategyRequest(Self);
  end
  else
  begin
    FAuthCache := nil;
    FApp := IO_STRING_NULL_VALUE;
    FAppOID := IO_INTEGER_NULL_VALUE;
    FConnection := IO_STRING_NULL_VALUE;
    FConnectionRemote := IO_STRING_NULL_VALUE;
    FLic := IO_STRING_NULL_VALUE;
    FLicOID := IO_INTEGER_NULL_VALUE;
    FUsr := IO_STRING_NULL_VALUE;
    FUsrOID := IO_INTEGER_NULL_VALUE;
  end;
  // auth
  FAuthContext := IO_STRING_NULL_VALUE;
  // instances
  FDTO := nil;
  FDTO_Serialize := True;
  FIntf1 := nil;
  FIntf1_Serialize := True;
  FListDTO := nil;
  FListDTO_Serialize := True;
  FMasterBSPersistence := nil;
  FObj1 := nil;
  FObj1_Serialize := True;
  FWhere := nil;
  // others
  FBlindLevel := BL_DEFAULT;
  FIntent := TioPersistenceIntentType.itRegular;
  FMasterPropName := IO_STRING_NULL_VALUE;
  FMasterPropPath := IO_STRING_NULL_VALUE;
  FForceAuthDecision := False;
  FPropName := IO_STRING_NULL_VALUE;
  FRelationOID := IO_INTEGER_NULL_VALUE;
  FRelationPropName := IO_STRING_NULL_VALUE;
  // result
  FResult := TValue.Empty;
end;

procedure TioPersistenceStrategyRequest._ClearGenericsFromJsonText(var AJSONText: String);
var
  LStart: Integer;
  LEnd: Integer;
  LGenericType: String;
begin
  // Sostituisce nel JSON eventuali TioWhere<T> (generics) con TioWhere(not generics) per evitare
  //  problemi poi nella deserializzazione (RTTI informations mancanti)
  LStart := Pos('TioWhere<', AJSONText);
  while LStart > 0 do
  begin
    LEnd := Pos('>', AJSONText, LStart);
    if LEnd > 0 then
    begin
      LGenericType := AJSONText.Substring(LStart-1, LEnd-LStart+1);
      AJSONText := AJSONText.Replace(LGenericType, 'TioWhere');
      LStart := Pos('TioWhere<', AJSONText);
    end;
  end;
end;

end.
