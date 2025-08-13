unit iORM.Auth.DecisionRequestUI;

interface

uses
  iORM.Auth.Interfaces, iORM.CommonTypes;

type

  // Questa è la classe che implementa IioAuthDecisionRequest che viene usata per le richieste
  //  di autorizzazione da parte della UI (BindSources e standard-actions). L'altra classe
  //  che implementa IioAuthDecisionRequest è la TioContext_PSRequest che in pratica è il Context stesso.
  TioAuthDecisionRequestUI = class(TInterfacedObject, IioAuthDecisionRequest)
  private
    FActionType:TioPersistenceActionType;
    FAuthContext: String;
    FIntent: TioPersistenceIntentType;
    FForceAuthDecision: Boolean;
    FTypeName: String;
    FToken: String;
    function GetActionType: TioPersistenceActionType;
    function GetAuthContext: String;
    function GetForceAuthDecision: Boolean;
    function GetIntent: TioPersistenceIntentType;
    function GetToken: String;
    function GetTypeName: String;
    procedure SetActionType(const Value: TioPersistenceActionType);
    procedure SetAuthContext(const Value: String);
    procedure SetTypeName(const Value: String);
  public
    constructor Create(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AAuthContext: String; const AForceAuthDecision: Boolean);
    function IsAuthorized(const Silent: Boolean): Boolean;
    // properties
    property ActionType: TioPersistenceActionType read GetActionType write SetActionType;
    property AuthContext: String read GetAuthContext write SetAuthContext;
    property ForceAuthDecision: Boolean read GetForceAuthDecision;
    property Intent: TioPersistenceIntentType read GetIntent;
    property Token: String read GetToken;
    property TypeName: String read GetTypeName write SetTypeName;
  end;

implementation

uses
  iORM.Abstraction, iORM.Abstraction.SessionData.Interfaces;

{ TioAuthDecisionRequestUI }

constructor TioAuthDecisionRequestUI.Create(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AAuthContext: String; const AForceAuthDecision: Boolean);
begin
  FActionType := AActionType;
  FAuthContext := AAuthContext;
  FIntent := AIntent;
  FForceAuthDecision := AForceAuthDecision;
  FTypeName := ATypeName;
  FToken := TioApplication.ProvideAuthToken;
end;

function TioAuthDecisionRequestUI.GetActionType: TioPersistenceActionType;
begin
  Result := FActionType;
end;

function TioAuthDecisionRequestUI.GetAuthContext: String;
begin
  Result := FAuthContext;
end;

function TioAuthDecisionRequestUI.GetIntent: TioPersistenceIntentType;
begin
  Result := FIntent;
end;

function TioAuthDecisionRequestUI.GetForceAuthDecision: Boolean;
begin
  Result := FForceAuthDecision;
end;

function TioAuthDecisionRequestUI.GetToken: String;
begin
  Result := FToken;
end;

function TioAuthDecisionRequestUI.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioAuthDecisionRequestUI.IsAuthorized(const Silent: Boolean): Boolean;
var
  LSessionData: IioSessionData;
begin
  // Acquire the MainSessionData (thread-safe)
  LSessionData := TioApplication.SessionDataStore.AcquireMainSessionData;
  try
    // Check authorization from SessionData.AuthCache
    Result := LSessionData.AuthCacheUI.IsAuthorized(Self, Silent);
  finally
    // Release the MainSessionData (thread-safe)
    TioApplication.SessionDataStore.Release;
  end;
end;

procedure TioAuthDecisionRequestUI.SetActionType(const Value: TioPersistenceActionType);
begin
  FActionType := Value;
end;

procedure TioAuthDecisionRequestUI.SetAuthContext(const Value: String);
begin
  FAuthContext := Value;
end;

procedure TioAuthDecisionRequestUI.SetTypeName(const Value: String);
begin
  FTypeName := Value;
end;

end.
