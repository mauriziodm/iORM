unit iORM.Abstraction.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Context.Interfaces,
  iORM.PersistenceStrategy.Interfaces;

type

  TioProjectPlatform = (ppVCL, ppFMX, ppUniGUI);

  // show-hide wait related methods
  TioShowWaitMethod = reference to Procedure;
  TioHideWaitMethod = reference to Procedure;

  // forward declaration
  IioAuthDecisionRequest = interface;

  // access-token related methods
  // note: The anonymous method of type "TioTokenValidateMethod" can return true or false
  //        to authorize or not the operation to be performed. But be careful, if the operation
  //        is not authorized simply returning false will not raise any exception so the operation
  //        will not be performed but the user will probably not notice the lack of authorization;
  //        If you want to inform the user of the failed authorization, you need to raise an exception
  //        within the annoying method itself (TioTokenValidateMethod).
  TioAuthTokenProviderMethod = reference to Function: String;
  TioAuthDecisionMethod = reference to Function(const AAuthDecisionRequest: IioAuthDecisionRequest): Boolean;

  // Questa è l'interfaccia che verrà usata nell'anonymous method per validare l'access-token
  //  prima di ogni richiesta di esecuzione di una azione su un oggetto/classe.
  //  NB: Se e quando vorrò usarla anche per le standard-action non avro nessuno IioCOntext
  //       a disposizione quindi farò una classe apposita che implementa semplicemente questa classe
  //       e che popolerò appositamente per la validazione dell'access-token e stabilire quindi se
  //       quella action deve essere abilitata per quell'utente e per quell'oggetto oppure no.
  IioAuthDecisionRequest = interface
    ['{02E419C2-347C-412D-B7B3-F264EFB92B94}']
    // methods
    function AsContext: IioContext;
    function IsContext: Boolean;
    // access-token
    function GetToken: String;
    property Token: String read GetToken;
    // action type
    function GetActionType: TioPersistenceActionType;
    property ActionType: TioPersistenceActionType read GetActionType;
    // intent
    function GetIntent: TioPersistenceIntentType;
    property Intent: TioPersistenceIntentType read GetIntent;
    // type name
    function GetTypeName: String;
    property TypeName: String read GetTypeName;
  end;

implementation

end.
