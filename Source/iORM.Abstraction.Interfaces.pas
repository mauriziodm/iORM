unit iORM.Abstraction.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Context.Interfaces,
  iORM.PersistenceStrategy.Interfaces;

type

  // Questa è l'interfaccia che verrà usata nell'anonymous method per validare l'access-token
  //  prima di ogni richiesta di esecuzione di una azione su un oggetto/classe.
  //  NB: Se e quando vorrò usarla anche per le standard-action non avro nessuno IioCOntext
  //       a disposizione quindi farò una classe apposita che implementa semplicemente questa classe
  //       e che popolerò appositamente per la validazione dell'access-token e stabilire quindi se
  //       quella action deve essere abilitata per quell'utente e per quell'oggetto oppure no.
  IioTokenValidationRequest = interface
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
