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
    FIntent: TioPersistenceIntentType;
    FForceAuthDecision: Boolean;
    FTypeName: String;
    FToken: String;
    function GetToken: String;
    function GetActionType: TioPersistenceActionType;
    function GetIntent: TioPersistenceIntentType;
    function GetForceAuthDecision: Boolean;
    function GetTypeName: String;
  public
    constructor Create(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AForceAuthDecision: Boolean);
    function IsAuthorized: Boolean;
    property Token: String read GetToken;
    property ActionType: TioPersistenceActionType read GetActionType;
    property Intent: TioPersistenceIntentType read GetIntent;
    property ForceAuthDecision: Boolean read GetForceAuthDecision;
    property TypeName: String read GetTypeName;
  end;

implementation

uses
  iORM.Abstraction, iORM.Abstraction.SessionData.Interfaces;

{ TioAuthDecisionRequestUI }

constructor TioAuthDecisionRequestUI.Create(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AForceAuthDecision: Boolean);
begin
  FActionType := AActionType;
  FIntent := AIntent;
  FForceAuthDecision := AForceAuthDecision;
  FTypeName := ATypeName;
  FToken := TioApplication.ProvideAuthToken;
end;

function TioAuthDecisionRequestUI.GetActionType: TioPersistenceActionType;
begin
  Result := FActionType;
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

function TioAuthDecisionRequestUI.IsAuthorized: Boolean;
var
  LSessionData: IioSessionData;
begin
  // Acquire the MainSessionData (thread-safe)
  LSessionData := TioApplication.SessionDataStore.AcquireMainSessionData;
  try
    // Check authorization from SessionData.AuthCache
    Result := LSessionData.AuthCacheUI.IsAuthorized(Self);
  finally
    // Release the MainSessionData (thread-safe)
    TioApplication.SessionDataStore.Release;
  end;
end;

end.
