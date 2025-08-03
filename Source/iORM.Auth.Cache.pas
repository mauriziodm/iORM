unit iORM.Auth.Cache;

interface

uses
  iORM.Auth.Interfaces, System.Generics.Collections;

type

  // Ho deciso di avere due AuthCache diverse, una per le operazioni CRUD (IioAuthCacheUI in iORM.PersistenceStrategy.Interfaces)
  //  che viene usata nelle PersistenceStrategies per autorizzare o meno le operazioni,
  //  questa ha lo stesso ciclo di vita della transazione/PSRequest quindi
  //  ogni volta si azzera quindi non c'è nemmeno bisogno di proteggeerla per il multithreading, così c'è anche il vantaggio
  //  che se i permessi dell'utente dovessero cambiare mentre la transazione è in atto i permessi visti saranno consistenti
  //  per tutta la durata dell'operazione.
  //  L'altra IioAuthCacheUI invece viene usata nel frontend e nella UI (BindSources e StandardActions) quindi deve essere globale
  //  e deve essere thread-safe. La classe che la implementa mantiene anche una copia dell'ultimo Token usato in modo che
  //  quando nelle chiamate successive cambia la cache viene svuotata e fare in modo quindi che se, ad esempio,
  //  si fa un logout e ci si riautentica come altro utente i permessi preesistenti vengano eliminati, inoltre anche
  //  se i permessi dello stesso utente dovessero cambiare dopo l'autenticazione una volta scaduto e rinnovato il token
  //  verranno usati i nuovi permessi solo con un leggero ritardo  pari al max. alla dirata del token. Ho deciso di mantenere
  //  la AuthCacheUI nel SessionData in modo che anche con uniGUI funzioni correttamente visto che in questo caso già iORM
  //  mantiene SessionData separati per le diverse sessioni.
  //  NB:  L'Accesso all'AuthCacheUI è thread-safe perchè è una proprietà della classe TioSessionData alla quale si accedete
  //        attraverso la TioSessionDataStore che li portegge perchè un SessionData va acquisito con gli appositi metodi
  //        Acquire... e Release...
  TioAuthCacheCustom = class (TInterfacedObject, IioAuthCache)
  strict private
    FInternalContainer: TDictionary<String, Boolean>;
  protected
    procedure Clear;
  public
    constructor Create;
    destructor Destroy; override;
    function IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest): Boolean; virtual;
  end;

  TioAuthCacheCRUD = class (TioAuthCacheCustom)
  end;

  TioAuthCacheUI = class (TioAuthCacheCustom)
  strict private
    FPreviousToken: String;
  public
    function IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest): Boolean; override;
  end;

implementation

uses
  System.SysUtils, iORM.Abstraction, iORM.CommonTypes;

{ TioAuthCacheCustom }

procedure TioAuthCacheCustom.Clear;
begin
  FInternalContainer.Clear;
end;

constructor TioAuthCacheCustom.Create;
begin
  FInternalContainer := TDictionary<String, Boolean>.Create;
end;

destructor TioAuthCacheCustom.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioAuthCacheCustom.IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest): Boolean;
var
  LKey: String;
begin
  // Non-regular operations (e.g. itRevert, itSynchro_XXX) are never subject to authorization
  if (AAuthDecisionRequest.Intent <> itRegular) or AAuthDecisionRequest.ForceAuthDecision then
    Exit(True);
  // Compose the key
  LKey := AAuthDecisionRequest.TypeName + ':' + IntToStr(Ord(AAuthDecisionRequest.ActionType));
  // Authorization decision
  if not FInternalContainer.TryGetValue(LKey, Result) then
  begin
    Result := TioApplication._FAuthDecisionMethod_InternalUse(AAuthDecisionRequest);
    FInternalContainer.Add(LKey, Result);
  end;
  // If the ActionType is not atSelect and the operation isn't authorized then Abort
  if (AAuthDecisionRequest.ActionType > atSelect) and not Result then
    Abort;
end;

{ TioAuthCacheUI }

function TioAuthCacheUI.IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest): Boolean;
begin
  // Clear cache if necessary
  if AAuthDecisionRequest.Token <> FPreviousToken then
    Clear;
  // inherit
  Result := inherited;
end;

end.
