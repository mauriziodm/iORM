unit uModel;

interface

uses
  iORM.Attributes, System.Generics.Collections,
  iORM.Containers.Interfaces, iORM.CommonTypes,
  ObjMapper.Attributes,
  uInterfaces;

{$RTTI EXPLICIT METHODS([vcPublic, vcProtected])}

type
  TUserInfo = record
    UserName: string;
    Description: string;
  end;

  TGlobalKeyboard = class(TInterfacedObject, IGlobalKeyboard)
  private
    FKeyBoardVisible: Boolean;
    procedure SetKeyBoardVisible(const Value: Boolean);
    function GetKeyBoardVisible: Boolean;
  public
    property KeyBoardVisible: Boolean read GetKeyBoardVisible write SetKeyBoardVisible;
  end;

  TGenericContainer<T> = class(TInterfacedObject, IGenericContainer<T>)
  private
    FDict: TObjectDictionary<string,T>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetItem(AKey: string): T;
    procedure SetItem(AKey: string; AValue: T);
    procedure ClearItems;
  end;

  [ioEntity('Configurazione')]
  TConfigurazione = class(TInterfacedObject, IConfigurazione)
  private
    FID: Integer;
    FPostazione: String;
    FAzienda: String;
    FCodiceLicenza: String;
    FClasse: String;
    FMagazzino: String;
    FStagione: String;
    procedure SetID(const Value:Integer);
    procedure SetPostazione(const Value: String);
    procedure SetAzienda(const Value: String);
    procedure SetCodiceLicenza(const Value: String);
    procedure SetClasse(const Value: String);
    procedure SetStagione(const Value: String);
    procedure SetMagazzino(const Value: String);
    function GetID: Integer;
    function GetPostazione: String;
    function GetAzienda: String;
    function GetCodiceLicenza: String;
    function GetClasse: String;
    function GetStagione: String;
    function GetMagazzino: String;
    class var FIstanza: TConfigurazione;
  public
    class function NuovaIstanza: TConfigurazione;
    procedure CaricaConfigurazione;
    property ID: Integer read GetID write SetID;
    property Postazione: String read GetPostazione write SetPostazione;
    property Azienda: String read GetAzienda write SetAzienda;
    property CodiceLicenza: String read GetCodiceLicenza write SetCodiceLicenza;
    property Classe:string read GetClasse write SetClasse;
    property Stagione:string read GetStagione write SetStagione;
    property Magazzino:string read GetMagazzino write SetMagazzino;
  end;

  [ioEntity, ioDisableAutoCreateDB]
  TTabelleBase = class(TInterfacedObject, ITabelleBase)
  private
  protected
    FID: Integer;
    FCodice: String;
    FDescrizione: String;
    FTitolo: String;
    function GetCodice: String;
    function GetDescrizione: String;
    procedure SetCodice(const AValue: String);
    procedure SetDescrizione(const AValue: String);
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    function GetTitolo: String;
    procedure SetTitolo(const AValue: String);
  public
    property ID: Integer read GetID write SetID;
    [ioIndex('codice',ioAscending,True)]
    property Codice: String read GetCodice write SetCodice;
    property Descrizione: String read GetDescrizione write SetDescrizione;
    [ioSkip]
    property Titolo: String read GetTitolo write SetTitolo;
  end;

  [ioEntity('SincroInfo')]
  TSincroInfo = class(TInterfacedObject, ISincroInfo)
  private
    FID: integer;
    FServerPortNumber: integer;
    FTabellaArticoli: boolean;
    FTabellaValute: boolean;
    FTabellaListiniDiVendita: boolean;
    FTabellaStagioni: boolean;
    FTabellaCodiciABarre: boolean;
    FTabellaAliquoteIva: boolean;
    FTabellaTipoListini: boolean;
    FTabellaRipartizioneTaglie: boolean;
    FServerIpAddress: string;
    FTabellaClassiOrdine: boolean;
    FTabellaCodiciSpesa: boolean;
    FTabellaCodiciRaggruppamento: boolean;
    FTabellaTipiDocumenti: boolean;
    FTabellaTaglie: boolean;
    FTabellaCommenti: boolean;
    FTabellaSetTaglie: boolean;
    FTabellaMagazzini: boolean;
    FTabellaCodiciSconto: boolean;
    FTabellaPagamenti: boolean;
    FDataUltimaSincro: TDate;
    FTabellaUtenti: boolean;
    FUserNameSincro: string;
    FUserPasswordSincro: string;
    procedure SetServerIpAddress(const AValue: string);
    procedure SetServerPortNumber(const AValue: integer);
    procedure SetTabellaAliquoteIva(const AValue: boolean);
    procedure SetTabellaArticoli(const AValue: boolean);
    procedure SetTabellaClassiOrdine(const AValue: boolean);
    procedure SetTabellaCodiciABarre(const AValue: boolean);
    procedure SetTabellaCodiciRaggruppamento(const AValue: boolean);
    procedure SetTabellaCodiciSconto(const AValue: boolean);
    procedure SetTabellaCodiciSpesa(const AValue: boolean);
    procedure SetTabellaCommenti(const AValue: boolean);
    procedure SetTabellaListiniDiVendita(const AValue: boolean);
    procedure SetTabellaMagazzini(const AValue: boolean);
    procedure SetTabellaPagamenti(const AValue: boolean);
    procedure SetTabellaRipartizioneTaglie(const AValue: boolean);
    procedure SetTabellaSetTaglie(const AValue: boolean);
    procedure SetTabellaStagioni(const AValue: boolean);
    procedure SetTabellaTaglie(const AValue: boolean);
    procedure SetTabellaTipiDocumenti(const AValue: boolean);
    procedure SetTabellaTipoListini(const AValue: boolean);
    procedure SetTabellaValute(const AValue: boolean);
    procedure SetID(const AValue:Integer);
    procedure SetDataUltimaSincro(const AValue: TDate);
    procedure SetUserNameSincro(const AValue: string);
    procedure SetUserPasswordSincro(const AValue: string);
    function GetServerIpAddress: string;
    function GetServerPortNumber: integer;
    function GetTabellaAliquoteIva: boolean;
    function GetTabellaArticoli: boolean;
    function GetTabellaClassiOrdine: boolean;
    function GetTabellaCodiciABarre: boolean;
    function GetTabellaCodiciRaggruppamento: boolean;
    function GetTabellaCodiciSconto: boolean;
    function GetTabellaCodiciSpesa: boolean;
    function GetTabellaCommenti: boolean;
    function GetTabellaListiniDiVendita: boolean;
    function GetTabellaMagazzini: boolean;
    function GetTabellaPagamenti: boolean;
    function GetTabellaRipartizioneTaglie: boolean;
    function GetTabellaSetTaglie: boolean;
    function GetTabellaStagioni: boolean;
    function GetTabellaTaglie: boolean;
    function GetTabellaTipiDocumenti: boolean;
    function GetTabellaTipoListini: boolean;
    function GetTabellaValute: boolean;
    function GetID: Integer;
    function GetDataUltimaSincro: TDate;
    function GetTabellaUtenti: boolean;
    procedure SetTabellaUtenti(const AValue: boolean);
    function GetUserNameSincro: string;
    function GetUserPasswordSincro: string;
  public
    constructor Create;
    destructor Destroy; override;
    property ID: Integer read GetID write SetID;
    property TabellaMagazzini: boolean read GetTabellaMagazzini write SetTabellaMagazzini;
    property TabellaValute: boolean read GetTabellaValute write SetTabellaValute;
    property TabellaPagamenti: boolean read GetTabellaPagamenti write SetTabellaPagamenti;
    property TabellaCodiciSconto: boolean read GetTabellaCodiciSconto write SetTabellaCodiciSconto;
    property TabellaTipoListini: boolean read GetTabellaTipoListini write SetTabellaTipoListini;
    property TabellaClassiOrdine: boolean read GetTabellaClassiOrdine write SetTabellaClassiOrdine;
    property TabellaStagioni: boolean read GetTabellaStagioni write SetTabellaStagioni;
    property TabellaTipiDocumenti: boolean read GetTabellaTipiDocumenti write SetTabellaTipiDocumenti;
    property TabellaCodiciRaggruppamento: boolean read GetTabellaCodiciRaggruppamento write SetTabellaCodiciRaggruppamento;
    property TabellaCodiciSpesa: boolean read GetTabellaCodiciSpesa write SetTabellaCodiciSpesa;
    property TabellaAliquoteIva: boolean read GetTabellaAliquoteIva write SetTabellaAliquoteIva;
    property TabellaSetTaglie: boolean read GetTabellaSetTaglie write SetTabellaSetTaglie;
    property TabellaRipartizioneTaglie: boolean read GetTabellaRipartizioneTaglie write SetTabellaRipartizioneTaglie;
    property TabellaCommenti: boolean read GetTabellaCommenti write SetTabellaCommenti;
    property TabellaArticoli: boolean read GetTabellaArticoli write SetTabellaArticoli;
    property TabellaTaglie: boolean read GetTabellaTaglie write SetTabellaTaglie;
    property TabellaCodiciABarre: boolean read GetTabellaCodiciABarre write SetTabellaCodiciABarre;
    property TabellaListiniDiVendita: boolean read GetTabellaListiniDiVendita write SetTabellaListiniDiVendita;
    property TabellaUtenti: boolean read GetTabellaUtenti write SetTabellaUtenti;
    property ServerIpAddress: string read GetServerIpAddress write SetServerIpAddress;
    property ServerPortNumber: integer read GetServerPortNumber write SetServerPortNumber;
    property DataUltimaSincro: TDate read GetDataUltimaSincro write SetDataUltimaSincro;
    property UserNameSincro: string read GetUserNameSincro write SetUserNameSincro;
    property UserPasswordSincro: string read GetUserPasswordSincro write SetUserPasswordSincro;
  end;

  [ioEntity('Magazzini')]
  TMagazzino = class(TTabelleBase, IMagazzino,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('Valute')]
  TValuta = class(TTabelleBase, IValuta,IListableView)
  private
    FImportoCambio: Currency;
    FNumeroDecimali: Integer;
    FTipoOperatore: String;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetImportoCambio: Currency;
    function GetNumeroDecimali: Integer;
    function GetTipoOperatore: String;
    procedure SetImportoCambio(const AValue: Currency);
    procedure SetNumeroDecimali(const AValue: Integer);
    procedure SetTipoOperatore(const AValue: String);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String; ANumeroDecimali: Integer; AImportoCambio: Currency; ATipoOperatore: string); overload;
    destructor Destroy; override;
    property NumeroDecimali: Integer read GetNumeroDecimali write SetNumeroDecimali;
    property ImportoCambio: Currency read GetImportoCambio write SetImportoCambio;
    property TipoOperatore: String read GetTipoOperatore write SetTipoOperatore;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('TipiPagamento')]
  TTipoPagamento = class(TTabelleBase, ITipoPagamento,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('CodiciSconto')]
  TCodiceSconto = class(TTabelleBase, ICodiceSconto,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    FSc1: Currency;
    FSc2: Currency;
    FSc3: Currency;
    FSc4: Currency;
    FSc5: Currency;
    FSc6: Currency;
    FSc7: Currency;
    FSc8: Currency;
    FSc9: Currency;
    FSc10: Currency;
    function GetPercSconto1: Currency;
    procedure SetPercSconto1(const AValue: Currency);
    function GetPercSconto2: Currency;
    procedure SetPercSconto2(const AValue: Currency);
    function GetPercSconto3: Currency;
    procedure SetPercSconto3(const AValue: Currency);
    function GetPercSconto4: Currency;
    procedure SetPercSconto4(const AValue: Currency);
    function GetPercSconto5: Currency;
    procedure SetPercSconto5(const AValue: Currency);
    function GetPercSconto6: Currency;
    procedure SetPercSconto6(const AValue: Currency);
    function GetPercSconto7: Currency;
    procedure SetPercSconto7(const AValue: Currency);
    function GetPercSconto8: Currency;
    procedure SetPercSconto8(const AValue: Currency);
    function GetPercSconto9: Currency;
    procedure SetPercSconto9(const AValue: Currency);
    function GetPercSconto10: Currency;
    procedure SetPercSconto10(const AValue: Currency);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String; ASc1,ASc2,ASc3,ASc4,ASc5,ASc6,Asc7,Asc8,Asc9,Asc10: Currency); overload;
    destructor Destroy; override;
    property PercSconto1: Currency read GetPercSconto1 write SetPercSconto1;
    property PercSconto2: Currency read GetPercSconto2 write SetPercSconto2;
    property PercSconto3: Currency read GetPercSconto3 write SetPercSconto3;
    property PercSconto4: Currency read GetPercSconto4 write SetPercSconto4;
    property PercSconto5: Currency read GetPercSconto5 write SetPercSconto5;
    property PercSconto6: Currency read GetPercSconto6 write SetPercSconto6;
    property PercSconto7: Currency read GetPercSconto7 write SetPercSconto7;
    property PercSconto8: Currency read GetPercSconto8 write SetPercSconto8;
    property PercSconto9: Currency read GetPercSconto9 write SetPercSconto9;
    property PercSconto10: Currency read GetPercSconto10 write SetPercSconto10;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  //*------------------------------- *
  //* Tabella Sconti Cliente (Righe) *
  //*------------------------------- *
  [ioEntity('ScontiClienteRiga')]
  TScontoClienteRiga = class(TInterfacedObject, IScontoClienteRiga,IListableView)
  private
    FID: Integer;
    FCodiceCliente: string;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    FCodiceStruttura1: string;
    FCodiceStruttura2: string;
    FCodiceStruttura3: string;
    FCodiceStruttura4: string;
    FPercSconto1: Currency;
    FPercSconto2: Currency;
    FPercSconto3: Currency;
    FCodiceSconto: string;
    FFlagContoVendita: string;
    FFlagScontoTestata: string;
    function GetPercSconto1: Currency;
    procedure SetPercSconto1(const AValue: Currency);
    function GetPercSconto2: Currency;
    procedure SetPercSconto2(const AValue: Currency);
    function GetPercSconto3: Currency;
    procedure SetPercSconto3(const AValue: Currency);
    function GetCodiceStruttura1: string;
    procedure SetCodiceStruttura1(const AValue: string);
    function GetCodiceStruttura2: string;
    procedure SetCodiceStruttura2(const AValue: string);
    function GetCodiceStruttura3: string;
    procedure SetCodiceStruttura3(const AValue: string);
    function GetCodiceStruttura4: string;
    procedure SetCodiceStruttura4(const AValue: string);
    function GetCodiceSconto: string;
    procedure SetCodiceSconto(const AValue: string);
    function GetFlagContoVendita: string;
    procedure SetFlagContoVendita(const AValue: string);
    function GetFlagScontoTestata: string;
    procedure SetFlagScontoTestata(const AValue: string);
    function GetID: integer;
    procedure SetID(const AValue: integer);
    function GetCodiceCliente: string;
    procedure SetCodiceCliente(const AValue: string);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    property ID: Integer read GetID write SetID;
    [ioIndex('CodiceCliente,CodiceStruttura1,CodiceStruttura2,CodiceStruttura3,CodiceStruttura4',ioAscending,True)]
    [ioVarchar(6,False,False)]
    property CodiceCliente: string read GetCodiceCliente write SetCodiceCliente;
    [ioVarchar(6,False,False)]
    property CodiceStruttura1: string read GetCodiceStruttura1 write SetCodiceStruttura1;
    [ioVarchar(6,False,False)]
    property CodiceStruttura2: string read GetCodiceStruttura2 write SetCodiceStruttura2;
    [ioVarchar(6,False,False)]
    property CodiceStruttura3: string read GetCodiceStruttura3 write SetCodiceStruttura3;
    [ioVarchar(7,False,False)]
    property CodiceStruttura4: string read GetCodiceStruttura4 write SetCodiceStruttura4;
    property PercSconto1: Currency read GetPercSconto1 write SetPercSconto1;
    property PercSconto2: Currency read GetPercSconto2 write SetPercSconto2;
    property PercSconto3: Currency read GetPercSconto3 write SetPercSconto3;
    property CodiceSconto: string read GetCodiceSconto write SetCodiceSconto;
    property FlagContoVendita: string read GetFlagContoVendita write SetFlagContoVendita;
    property FlagScontoTestata: string read GetFlagScontoTestata write SetFlagScontoTestata;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  //*--------------------------------- *
  //* Tabella Sconti Cliente (Testata) *
  //*--------------------------------- *
  [ioEntity('ScontiClienteTestata')]
  TScontoClienteTestata = class(TInterfacedObject, IScontoClienteTestata,IListableView)
  private
    FID: Integer;
    FCodiceCliente: string;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    FCodiceStruttura1: string;
    FCodiceStruttura2: string;
    FCodiceStruttura3: string;
    FCodiceStruttura4: string;
    FPercSconto1: Currency;
    FPercSconto2: Currency;
    FPercSconto3: Currency;
    FCodiceSconto: string;
    FCodicePagamento: string;
    function GetPercSconto1: Currency;
    procedure SetPercSconto1(const AValue: Currency);
    function GetPercSconto2: Currency;
    procedure SetPercSconto2(const AValue: Currency);
    function GetPercSconto3: Currency;
    procedure SetPercSconto3(const AValue: Currency);
    function GetCodiceStruttura1: string;
    procedure SetCodiceStruttura1(const AValue: string);
    function GetCodiceStruttura2: string;
    procedure SetCodiceStruttura2(const AValue: string);
    function GetCodiceStruttura3: string;
    procedure SetCodiceStruttura3(const AValue: string);
    function GetCodiceStruttura4: string;
    procedure SetCodiceStruttura4(const AValue: string);
    function GetCodiceSconto: string;
    procedure SetCodiceSconto(const AValue: string);
    function GetCodicePagamento: string;
    procedure SetCodicePagamento(const AValue: string);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
    function GetID: integer;
    procedure SetID(const AValue: integer);
    function GetCodiceCliente: string;
    procedure SetCodiceCliente(const AValue: string);
  public
    property ID: Integer read GetID write SetID;
    [ioIndex('CodiceCliente,CodiceStruttura1,CodiceStruttura2,CodiceStruttura3,CodiceStruttura4',ioAscending,True)]
    [ioVarchar(6,False,False)]
    property CodiceCliente: string read GetCodiceCliente write SetCodiceCliente;
    [ioVarchar(6,False,False)]
    property CodiceStruttura1: string read GetCodiceStruttura1 write SetCodiceStruttura1;
    [ioVarchar(6,False,False)]
    property CodiceStruttura2: string read GetCodiceStruttura2 write SetCodiceStruttura2;
    [ioVarchar(6,False,False)]
    property CodiceStruttura3: string read GetCodiceStruttura3 write SetCodiceStruttura3;
    [ioVarchar(7,False,False)]
    property CodiceStruttura4: string read GetCodiceStruttura4 write SetCodiceStruttura4;
    property PercSconto1: Currency read GetPercSconto1 write SetPercSconto1;
    property PercSconto2: Currency read GetPercSconto2 write SetPercSconto2;
    property PercSconto3: Currency read GetPercSconto3 write SetPercSconto3;
    property CodiceSconto: string read GetCodiceSconto write SetCodiceSconto;
    property CodicePagamento: string read GetCodicePagamento write SetCodicePagamento;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('TipiListino')]
  TTipoListino = class(TTabelleBase, ITipoListino,IListableView)
  private
    FTipo: String;
    FValuta: string;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetTipo: String;
    procedure SetTipo(const AValue: String);
    function GetValuta: string;
    procedure SetValuta(const AValue: string);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String; ATipo: String; AValuta: string); overload;
    destructor Destroy; override;
    property Tipo: String read GetTipo write SetTipo;
    property Valuta: string read GetValuta write SetValuta;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('ClassiOrdine')]
  TClasseOrdine = class(TTabelleBase, IClasseOrdine,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('Stagioni')]
  TStagione = class(TTabelleBase, IStagione,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('TipiDocumento')]
  TTipoDocumento = class(TTabelleBase, ITipoDocumento,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('Raggruppamenti')]
  TRaggruppamento = class(TTabelleBase, IRaggruppamento)
  private
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
  end;

  [ioEntity('CodiciSpesa')]
  TCodiceSpesa = class(TTabelleBase, ICodiceSpesa)
  private
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
  end;

  [ioEntity('AliquoteIva')]
  TAliquotaIva = class(TTabelleBase, IAliquotaIva,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    FPercIva: currency;
    function GetPercIva: Currency;
    procedure SetPercIva(const AValue: Currency);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String; APercIva: Currency); overload;
    destructor Destroy; override;
    property PercIva: Currency read GetPercIva write SetPercIva;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('SetTaglie')]
  TSetTaglia = class(TTabelleBase, ISetTaglia)
  private
    FTaglia1: String;
    FTaglia2: String;
    FTaglia3: String;
    FTaglia4: String;
    FTaglia5: String;
    FTaglia6: String;
    FTaglia7: String;
    FTaglia8: String;
    FTaglia9: String;
    FTaglia10: String;
    FTaglia11: String;
    FTaglia12: String;
    FTaglia13: String;
    FTaglia14: String;
    FTaglia15: String;
    FTaglia16: String;
    FTaglia17: String;
    FTaglia18: String;
    FTaglia19: String;
    FTaglia20: String;
    FTaglia21: String;
    FTaglia22: String;
    FTaglia23: String;
    FTaglia24: String;
    function GetTaglia1: string;
    procedure SetTaglia1(const AValue: string);
    function GetTaglia2: string;
    procedure SetTaglia2(const AValue: string);
    function GetTaglia3: string;
    procedure SetTaglia3(const AValue: string);
    function GetTaglia4: string;
    procedure SetTaglia4(const AValue: string);
    function GetTaglia5: string;
    procedure SetTaglia5(const AValue: string);
    function GetTaglia6: string;
    procedure SetTaglia6(const AValue: string);
    function GetTaglia7: string;
    procedure SetTaglia7(const AValue: string);
    function GetTaglia8: string;
    procedure SetTaglia8(const AValue: string);
    function GetTaglia9: string;
    procedure SetTaglia9(const AValue: string);
    function GetTaglia10: string;
    procedure SetTaglia10(const AValue: string);
    function GetTaglia11: string;
    procedure SetTaglia11(const AValue: string);
    function GetTaglia12: string;
    procedure SetTaglia12(const AValue: string);
    function GetTaglia13: string;
    procedure SetTaglia13(const AValue: string);
    function GetTaglia14: string;
    procedure SetTaglia14(const AValue: string);
    function GetTaglia15: string;
    procedure SetTaglia15(const AValue: string);
    function GetTaglia16: string;
    procedure SetTaglia16(const AValue: string);
    function GetTaglia17: string;
    procedure SetTaglia17(const AValue: string);
    function GetTaglia18: string;
    procedure SetTaglia18(const AValue: string);
    function GetTaglia19: string;
    procedure SetTaglia19(const AValue: string);
    function GetTaglia20: string;
    procedure SetTaglia20(const AValue: string);
    function GetTaglia21: string;
    procedure SetTaglia21(const AValue: string);
    function GetTaglia22: string;
    procedure SetTaglia22(const AValue: string);
    function GetTaglia23: string;
    procedure SetTaglia23(const AValue: string);
    function GetTaglia24: string;
    procedure SetTaglia24(const AValue: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    property Taglia1: string read GetTaglia1 write SetTaglia1;
    property Taglia2: string read GetTaglia2 write SetTaglia2;
    property Taglia3: string read GetTaglia3 write SetTaglia3;
    property Taglia4: string read GetTaglia4 write SetTaglia4;
    property Taglia5: string read GetTaglia5 write SetTaglia5;
    property Taglia6: string read GetTaglia6 write SetTaglia6;
    property Taglia7: string read GetTaglia7 write SetTaglia7;
    property Taglia8: string read GetTaglia8 write SetTaglia8;
    property Taglia9: string read GetTaglia9 write SetTaglia9;
    property Taglia10: string read GetTaglia10 write SetTaglia10;
    property Taglia11: string read GetTaglia11 write SetTaglia11;
    property Taglia12: string read GetTaglia12 write SetTaglia12;
    property Taglia13: string read GetTaglia13 write SetTaglia13;
    property Taglia14: string read GetTaglia14 write SetTaglia14;
    property Taglia15: string read GetTaglia15 write SetTaglia15;
    property Taglia16: string read GetTaglia16 write SetTaglia16;
    property Taglia17: string read GetTaglia17 write SetTaglia17;
    property Taglia18: string read GetTaglia18 write SetTaglia18;
    property Taglia19: string read GetTaglia19 write SetTaglia19;
    property Taglia20: string read GetTaglia20 write SetTaglia20;
    property Taglia21: string read GetTaglia21 write SetTaglia21;
    property Taglia22: string read GetTaglia22 write SetTaglia22;
    property Taglia23: string read GetTaglia23 write SetTaglia23;
    property Taglia24: string read GetTaglia24 write SetTaglia24;
  end;

  [ioEntity('RipartizioneTaglie')]
  TRipartizioneTaglia = class(TInterfacedObject, IRipartizioneTaglia,IListableView)
  private
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    FID: Integer;
    FCodiceRipartizione : String;
    FDescrizioneRipartizione: String;
    FTipoRipartizione : String;
    FQuantitaTaglia1: Integer;
    FQuantitaTaglia2: Integer;
    FQuantitaTaglia3: Integer;
    FQuantitaTaglia4: Integer;
    FQuantitaTaglia5: Integer;
    FQuantitaTaglia6: Integer;
    FQuantitaTaglia7: Integer;
    FQuantitaTaglia8: Integer;
    FQuantitaTaglia9: Integer;
    FQuantitaTaglia10: Integer;
    FQuantitaTaglia11: Integer;
    FQuantitaTaglia12: Integer;
    FQuantitaTaglia13: Integer;
    FQuantitaTaglia14: Integer;
    FQuantitaTaglia15: Integer;
    FQuantitaTaglia16: Integer;
    FQuantitaTaglia17: Integer;
    FQuantitaTaglia18: Integer;
    FQuantitaTaglia19: Integer;
    FQuantitaTaglia20: Integer;
    FQuantitaTaglia21: Integer;
    FQuantitaTaglia22: Integer;
    FQuantitaTaglia23: Integer;
    FQuantitaTaglia24: Integer;
    function GetCodiceRipartizione: String;
    procedure SetCodiceRipartizione(const AValue: String);
    function GetDescrizioneRipartizione: String;
    procedure SetDescrizioneRipartizione(const AValue: String);
    function GetTipoRipartizione: String;
    procedure SetTipoRipartizione(const AValue: String);
    function GetQuantitaTaglia1: integer;
    procedure SetQuantitaTaglia1(const AValue: integer);
    function GetQuantitaTaglia2: integer;
    procedure SetQuantitaTaglia2(const AValue: integer);
    function GetQuantitaTaglia3: integer;
    procedure SetQuantitaTaglia3(const AValue: integer);
    function GetQuantitaTaglia4: integer;
    procedure SetQuantitaTaglia4(const AValue: integer);
    function GetQuantitaTaglia5: integer;
    procedure SetQuantitaTaglia5(const AValue: integer);
    function GetQuantitaTaglia6: integer;
    procedure SetQuantitaTaglia6(const AValue: integer);
    function GetQuantitaTaglia7: integer;
    procedure SetQuantitaTaglia7(const AValue: integer);
    function GetQuantitaTaglia8: integer;
    procedure SetQuantitaTaglia8(const AValue: integer);
    function GetQuantitaTaglia9: integer;
    procedure SetQuantitaTaglia9(const AValue: integer);
    function GetQuantitaTaglia10: integer;
    procedure SetQuantitaTaglia10(const AValue: integer);
    function GetQuantitaTaglia11: integer;
    procedure SetQuantitaTaglia11(const AValue: integer);
    function GetQuantitaTaglia12: integer;
    procedure SetQuantitaTaglia12(const AValue: integer);
    function GetQuantitaTaglia13: integer;
    procedure SetQuantitaTaglia13(const AValue: integer);
    function GetQuantitaTaglia14: integer;
    procedure SetQuantitaTaglia14(const AValue: integer);
    function GetQuantitaTaglia15: integer;
    procedure SetQuantitaTaglia15(const AValue: integer);
    function GetQuantitaTaglia16: integer;
    procedure SetQuantitaTaglia16(const AValue: integer);
    function GetQuantitaTaglia17: integer;
    procedure SetQuantitaTaglia17(const AValue: integer);
    function GetQuantitaTaglia18: integer;
    procedure SetQuantitaTaglia18(const AValue: integer);
    function GetQuantitaTaglia19: integer;
    procedure SetQuantitaTaglia19(const AValue: integer);
    function GetQuantitaTaglia20: integer;
    procedure SetQuantitaTaglia20(const AValue: integer);
    function GetQuantitaTaglia21: integer;
    procedure SetQuantitaTaglia21(const AValue: integer);
    function GetQuantitaTaglia22: integer;
    procedure SetQuantitaTaglia22(const AValue: integer);
    function GetQuantitaTaglia23: integer;
    procedure SetQuantitaTaglia23(const AValue: integer);
    function GetQuantitaTaglia24: integer;
    procedure SetQuantitaTaglia24(const AValue: integer);
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ATipoRipartizione, ACodiceRipartizione: String); overload;
    destructor Destroy; override;
    property ID: Integer read GetID write SetID;
    [ioIndex('CodiceRipartizione,TipoRipartizione',ioAscending,True)]
    property CodiceRipartizione: String read GetCodiceRipartizione write SetCodiceRipartizione;
    property DescrizioneRipartizione: String read GetDescrizioneRipartizione write SetDescrizioneRipartizione;
    property TipoRipartizione: String read GetTipoRipartizione write SetTipoRipartizione;
    property QuantitaTaglia1: Integer read GetQuantitaTaglia1 write SetQuantitaTaglia1;
    property QuantitaTaglia2: Integer read GetQuantitaTaglia2 write SetQuantitaTaglia2;
    property QuantitaTaglia3: Integer read GetQuantitaTaglia3 write SetQuantitaTaglia3;
    property QuantitaTaglia4: Integer read GetQuantitaTaglia4 write SetQuantitaTaglia4;
    property QuantitaTaglia5: Integer read GetQuantitaTaglia5 write SetQuantitaTaglia5;
    property QuantitaTaglia6: Integer read GetQuantitaTaglia6 write SetQuantitaTaglia6;
    property QuantitaTaglia7: Integer read GetQuantitaTaglia7 write SetQuantitaTaglia7;
    property QuantitaTaglia8: Integer read GetQuantitaTaglia8 write SetQuantitaTaglia8;
    property QuantitaTaglia9: Integer read GetQuantitaTaglia9 write SetQuantitaTaglia9;
    property QuantitaTaglia10: Integer read GetQuantitaTaglia10 write SetQuantitaTaglia10;
    property QuantitaTaglia11: Integer read GetQuantitaTaglia11 write SetQuantitaTaglia11;
    property QuantitaTaglia12: Integer read GetQuantitaTaglia12 write SetQuantitaTaglia12;
    property QuantitaTaglia13: Integer read GetQuantitaTaglia13 write SetQuantitaTaglia13;
    property QuantitaTaglia14: Integer read GetQuantitaTaglia14 write SetQuantitaTaglia14;
    property QuantitaTaglia15: Integer read GetQuantitaTaglia15 write SetQuantitaTaglia15;
    property QuantitaTaglia16: Integer read GetQuantitaTaglia16 write SetQuantitaTaglia16;
    property QuantitaTaglia17: Integer read GetQuantitaTaglia17 write SetQuantitaTaglia17;
    property QuantitaTaglia18: Integer read GetQuantitaTaglia18 write SetQuantitaTaglia18;
    property QuantitaTaglia19: Integer read GetQuantitaTaglia19 write SetQuantitaTaglia19;
    property QuantitaTaglia20: Integer read GetQuantitaTaglia20 write SetQuantitaTaglia20;
    property QuantitaTaglia21: Integer read GetQuantitaTaglia21 write SetQuantitaTaglia21;
    property QuantitaTaglia22: Integer read GetQuantitaTaglia22 write SetQuantitaTaglia22;
    property QuantitaTaglia23: Integer read GetQuantitaTaglia23 write SetQuantitaTaglia23;
    property QuantitaTaglia24: Integer read GetQuantitaTaglia24 write SetQuantitaTaglia24;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('Articoli')]
  TArticolo = class(TTabelleBase, IArticolo, IListableView)
  private
    FIsTagliaColore: boolean;
    FMarchio: string;
    FClassificazione1: string;
    FClassificazione2: string;
    FClassificazione3: string;
    FStat1: string;
    FStat2: string;
    FStat3: string;
    FStat4: string;
    FStat5: string;
    FStat6: string;
    FStat7: string;
    FStat8: string;
    FStat9: string;
    FFornitore: string;
    FStagione: string;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    procedure SetIsTagliaColore(const AValue:boolean);
    function GetIsTagliaColore: boolean;
    procedure SetMarchio(const AValue:string);
    function GetMarchio: string;
    procedure SetClassificazione1(const AValue:string);
    function GetClassificazione1: string;
    procedure SetClassificazione2(const AValue:string);
    function GetClassificazione2: string;
    procedure SetClassificazione3(const AValue:string);
    function GetClassificazione3: string;
    procedure SetStat1(const AValue:string);
    function GetStat1: string;
    procedure SetStat2(const AValue:string);
    function GetStat2: string;
    procedure SetStat3(const AValue:string);
    function GetStat3: string;
    procedure SetStat4(const AValue:string);
    function GetStat4: string;
    procedure SetStat5(const AValue:string);
    function GetStat5: string;
    procedure SetStat6(const AValue:string);
    function GetStat6: string;
    procedure SetStat7(const AValue:string);
    function GetStat7: string;
    procedure SetStat8(const AValue:string);
    function GetStat8: string;
    procedure SetStat9(const AValue:string);
    function GetStat9: string;
    procedure SetFornitore(const AValue:string);
    function GetFornitore: string;
    procedure SetStagione(const AValue:string);
    function GetStagione: string;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    property IsTagliaColore: boolean read GetIsTagliaColore write SetIsTagliaColore;
    property Marchio: string read GetMarchio write SetMarchio;
    property Classificazione1: string read GetClassificazione1 write SetClassificazione1;
    property Classificazione2: string read GetClassificazione2 write SetClassificazione2;
    property Classificazione3: string read GetClassificazione3 write SetClassificazione3;
    property Stat1: string read GetStat1 write SetStat1;
    property Stat2: string read GetStat2 write SetStat2;
    property Stat3: string read GetStat3 write SetStat3;
    property Stat4: string read GetStat4 write SetStat4;
    property Stat5: string read GetStat5 write SetStat5;
    property Stat6: string read GetStat6 write SetStat6;
    property Stat7: string read GetStat7 write SetStat7;
    property Stat8: string read GetStat8 write SetStat8;
    property Stat9: string read GetStat9 write SetStat9;
    property Fornitore: string read GetFornitore write SetFornitore;
    property Stagione: string read GetStagione write SetStagione;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('Taglie')]
  TTaglia = class(TInterfacedObject, ITaglia)
  private
    FID: Integer;
    FArticolo : String;
    FTaglia1: String;
    FTaglia2: String;
    FTaglia3: String;
    FTaglia4: String;
    FTaglia5: String;
    FTaglia6: String;
    FTaglia7: String;
    FTaglia8: String;
    FTaglia9: String;
    FTaglia10: String;
    FTaglia11: String;
    FTaglia12: String;
    FTaglia13: String;
    FTaglia14: String;
    FTaglia15: String;
    FTaglia16: String;
    FTaglia17: String;
    FTaglia18: String;
    FTaglia19: String;
    FTaglia20: String;
    FTaglia21: String;
    FTaglia22: String;
    FTaglia23: String;
    FTaglia24: String;
    FTaglia25: String;
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    function GetArticolo: String;
    procedure SetArticolo(const AValue: String);
    function GetTaglia1: string;
    procedure SetTaglia1(const AValue: string);
    function GetTaglia2: string;
    procedure SetTaglia2(const AValue: string);
    function GetTaglia3: string;
    procedure SetTaglia3(const AValue: string);
    function GetTaglia4: string;
    procedure SetTaglia4(const AValue: string);
    function GetTaglia5: string;
    procedure SetTaglia5(const AValue: string);
    function GetTaglia6: string;
    procedure SetTaglia6(const AValue: string);
    function GetTaglia7: string;
    procedure SetTaglia7(const AValue: string);
    function GetTaglia8: string;
    procedure SetTaglia8(const AValue: string);
    function GetTaglia9: string;
    procedure SetTaglia9(const AValue: string);
    function GetTaglia10: string;
    procedure SetTaglia10(const AValue: string);
    function GetTaglia11: string;
    procedure SetTaglia11(const AValue: string);
    function GetTaglia12: string;
    procedure SetTaglia12(const AValue: string);
    function GetTaglia13: string;
    procedure SetTaglia13(const AValue: string);
    function GetTaglia14: string;
    procedure SetTaglia14(const AValue: string);
    function GetTaglia15: string;
    procedure SetTaglia15(const AValue: string);
    function GetTaglia16: string;
    procedure SetTaglia16(const AValue: string);
    function GetTaglia17: string;
    procedure SetTaglia17(const AValue: string);
    function GetTaglia18: string;
    procedure SetTaglia18(const AValue: string);
    function GetTaglia19: string;
    procedure SetTaglia19(const AValue: string);
    function GetTaglia20: string;
    procedure SetTaglia20(const AValue: string);
    function GetTaglia21: string;
    procedure SetTaglia21(const AValue: string);
    function GetTaglia22: string;
    procedure SetTaglia22(const AValue: string);
    function GetTaglia23: string;
    procedure SetTaglia23(const AValue: string);
    function GetTaglia24: string;
    procedure SetTaglia24(const AValue: string);
    function GetTaglia25: string;

    procedure SetTaglia25(const Value: string);  public
    constructor Create; overload;
    constructor Create(AArticolo: String); overload;
    destructor Destroy; override;
    property ID: Integer read GetID write SetID;
    [ioIndex('Articolo',ioAscending,True)]
    [ioVarchar(15,False,False)]
    property Articolo: String read GetArticolo write SetArticolo;
    [ioVarchar(10,False,False)]
    property Taglia1: string read GetTaglia1 write SetTaglia1;
    property Taglia2: string read GetTaglia2 write SetTaglia2;
    property Taglia3: string read GetTaglia3 write SetTaglia3;
    property Taglia4: string read GetTaglia4 write SetTaglia4;
    property Taglia5: string read GetTaglia5 write SetTaglia5;
    property Taglia6: string read GetTaglia6 write SetTaglia6;
    property Taglia7: string read GetTaglia7 write SetTaglia7;
    property Taglia8: string read GetTaglia8 write SetTaglia8;
    property Taglia9: string read GetTaglia9 write SetTaglia9;
    property Taglia10: string read GetTaglia10 write SetTaglia10;
    property Taglia11: string read GetTaglia11 write SetTaglia11;
    property Taglia12: string read GetTaglia12 write SetTaglia12;
    property Taglia13: string read GetTaglia13 write SetTaglia13;
    property Taglia14: string read GetTaglia14 write SetTaglia14;
    property Taglia15: string read GetTaglia15 write SetTaglia15;
    property Taglia16: string read GetTaglia16 write SetTaglia16;
    property Taglia17: string read GetTaglia17 write SetTaglia17;
    property Taglia18: string read GetTaglia18 write SetTaglia18;
    property Taglia19: string read GetTaglia19 write SetTaglia19;
    property Taglia20: string read GetTaglia20 write SetTaglia20;
    property Taglia21: string read GetTaglia21 write SetTaglia21;
    property Taglia22: string read GetTaglia22 write SetTaglia22;
    property Taglia23: string read GetTaglia23 write SetTaglia23;
    property Taglia24: string read GetTaglia24 write SetTaglia24;
    [ioVarchar(10,False,False)]
    property Taglia25: string read GetTaglia25 write SetTaglia25;
  end;

  [ioEntity('CodiciABarre')]
  TCodiceABarre = class(TInterfacedObject, ICodiceABarre)
  private
    FID: Integer;
    FArticolo : String;
    FTaglia: string;
    FEan: string;
    FTipo: string;
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    function GetArticolo: String;
    procedure SetArticolo(const AValue: String);
    function GetTaglia: String;
    procedure SetTaglia(const AValue: String);
    function GetEan: String;
    procedure SetEan(const AValue: String);
    function GetTipo: String;
    procedure SetTipo(const AValue: String);
  public
    constructor Create; overload;
    constructor Create(AArticolo: String); overload;
    destructor Destroy; override;
    property ID: Integer read GetID write SetID;
    [ioIndex('Articolo,Taglia',ioAscending,True)]
    property Articolo: String read GetArticolo write SetArticolo;
    property Taglia: String read GetTaglia write SetTaglia;
    [ioIndex('Ean',ioAscending,True)]
    property Ean: String read GetEan write SetEan;
    property Tipo: String read GetTipo write SetTipo;
  end;

  [ioEntity('ListiniVendita')]
  TListinoVendita = class(TInterfacedObject, IListinoVendita, IListableView)
  private
    FID: Integer;
    FListino: String;
    FArticolo : String;
    FDataInizio: TDateTime;
    FDataFine: TDateTime;
    FPrezzo: currency;
    FValuta: string;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    function GetListino: String;
    procedure SetListino(const AValue: String);
    function GetArticolo: String;
    procedure SetArticolo(const AValue: String);
    function GetDataInizio: TDateTime;
    procedure SetDataInizio(const AValue: TDateTime);
    function GetDataFine: TDateTime;
    procedure SetDataFine(const AValue: TDateTime);
    function GetPrezzo: currency;
    procedure SetPrezzo(const AValue: currency);
    function GetValuta: string;
    procedure SetValuta(const AValue: string);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(AListino: string; AArticolo: String; ADataInizio: TDateTime; ADataFine: TDateTime; APrezzo: currency); overload;
    destructor Destroy; override;
    property ID: Integer read GetID write SetID;
    [ioIndex('Listino,Articolo,DataInizio,DataFine',ioAscending,True)]
    property Listino: String read GetListino write SetListino;
    property Articolo: String read GetArticolo write SetArticolo;
    property DataInizio: TDateTime read GetDataInizio write SetDataInizio;
    property DataFine: TDateTime read GetDataFine write SetDataFine;
    property Prezzo: currency read GetPrezzo write SetPrezzo;
    property Valuta: string read GetValuta write SetValuta;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  [ioEntity('Utenti')]
  TUtente = class(TTabelleBase, IUtente)
  protected
    FPassword: String;
    function GetPassword: String;
    procedure SetPassword(const AValue: String);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String; APassword: string); overload;
    destructor Destroy; override;
    property Password: String read GetPassword write SetPassword;
  end;

  [ioEntity('Clienti')]
  TCliente = class(TTabelleBase, ICliente, IListableView)
  private
    FCap: string;
    FCodiceSconto: string;
    FEstensioneRagioneSociale: string;
    FIndirizzo: string;
    FListino: string;
    FLocalita: string;
    FNazione: string;
    FPartitaIva: string;
    FProvincia: string;
    FSconto1: currency;
    FSconto2: currency;
    FSconto3: currency;
    FTelefono: string;
    FTipoDocumento: string;
    FAssoggettamentoFiscale: string;
    FCodicePagamento: string;
    FStrutturaScontiTestata: string;
    FStrutturaScontiRiga: string;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    function GetCap: string;
    function GetCodiceSconto: string;
    function GetEstensioneRagioneSociale: string;
    function GetIndirizzo: string;
    function GetListino: string;
    function GetLocalita: string;
    function GetNazione: string;
    function GetPartitaIva: string;
    function GetProvincia: string;
    function GetSconto1: currency;
    function GetSconto2: currency;
    function GetSconto3: currency;
    function GetTelefono: string;
    function GetCodicePagamento: string;
    function GetAssoggettamentoFiscale: string;
    function GetTipoDocumento: string;
    function GetMicroViewClassName: String;
    function GetStrutturaScontiTestata: string;
    function GetStrutturaScontiRiga: string;
    procedure SetCap(const AValue: string);
    procedure SetCodiceSconto(const AValue: string);
    procedure SetEstensioneRagioneSociale(const AValue: string);
    procedure SetIndirizzo(const AValue: string);
    procedure SetListino(const AValue: string);
    procedure SetLocalita(const AValue: string);
    procedure SetNazione(const AValue: string);
    procedure SetPartitaIva(const AValue: string);
    procedure SetProvincia(const AValue: string);
    procedure SetSconto1(const AValue: currency);
    procedure SetSconto2(const AValue: currency);
    procedure SetSconto3(const AValue: currency);
    procedure SetTelefono(const AValue: string);
    procedure SetCodicePagamento(const AValue: string);
    procedure SetAssoggettamentoFiscale(const AValue: string);
    procedure SetTipoDocumento(const AValue: string);
    procedure SetStrutturaScontiTestata(const AValue: string);
    procedure SetStrutturaScontiRiga(const AValue: string);
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
  public
    constructor Create; overload;
    constructor Create(ACodice: String; ADescrizione: String); overload;
    destructor Destroy; override;
    property EstensioneRagioneSociale: string read GetEstensioneRagioneSociale write SetEstensioneRagioneSociale;
    property Indirizzo: string read GetIndirizzo write SetIndirizzo;
    property Cap: string read GetCap write SetCap;
    property Localita: string read GetLocalita write SetLocalita;
    property Provincia: string read GetProvincia write SetProvincia;
    property Nazione: string read GetNazione write SetNazione;
    property PartitaIva: string read GetPartitaIva write SetPartitaIva;
    property Listino: string read GetListino write SetListino;
    property Telefono: string read GetTelefono write SetTelefono;
    property Sconto1: currency read GetSconto1 write SetSconto1;
    property Sconto2: currency read GetSconto2 write SetSconto2;
    property Sconto3: currency read GetSconto3 write SetSconto3;
    property CodiceSconto: string read GetCodiceSconto write SetCodiceSconto;
    property CodicePagamento: string read GetCodicePagamento write SetCodicePagamento;
    property AssoggettamentoFiscale: string read GetAssoggettamentoFiscale write SetAssoggettamentoFiscale;
    property TipoDocumento: string read GetTipoDocumento write SetTipoDocumento;
    property StrutturaScontiTestata: string read GetStrutturaScontiTestata write SetStrutturaScontiTestata;
    property StrutturaScontiRiga: string read GetStrutturaScontiRiga write SetStrutturaScontiRiga;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

//  [ioEntity('QuantitaRighe')]
//  TScalarinoTaglia = class(TInterfacedObject, IScalarinoTaglia)
//  private
//    FID: Integer;
//    FRigaID: Integer;
//    FTaglia1: integer;
//    FTaglia2: integer;
//    FTaglia3: integer;
//    FTaglia4: integer;
//    FTaglia5: integer;
//    FTaglia6: integer;
//    FTaglia7: integer;
//    FTaglia8: integer;
//    FTaglia9: integer;
//    FTaglia10: integer;
//    FTaglia11: integer;
//    FTaglia12: integer;
//    FTaglia13: integer;
//    FTaglia14: integer;
//    FTaglia15: integer;
//    FTaglia16: integer;
//    FTaglia17: integer;
//    FTaglia18: integer;
//    FTaglia19: integer;
//    FTaglia20: integer;
//    FTaglia21: integer;
//    FTaglia22: integer;
//    FTaglia23: integer;
//    FTaglia24: integer;
//    procedure SetID(const AValue:Integer);
//    function GetID: Integer;
//    procedure SetRigaID(const AValue:Integer);
//    function GetRigaID: Integer;
//    function GetTaglia1: integer;
//    procedure SetTaglia1(const AValue: integer);
//    function GetTaglia2: integer;
//    procedure SetTaglia2(const AValue: integer);
//    function GetTaglia3: integer;
//    procedure SetTaglia3(const AValue: integer);
//    function GetTaglia4: integer;
//    procedure SetTaglia4(const AValue: integer);
//    function GetTaglia5: integer;
//    procedure SetTaglia5(const AValue: integer);
//    function GetTaglia6: integer;
//    procedure SetTaglia6(const AValue: integer);
//    function GetTaglia7: integer;
//    procedure SetTaglia7(const AValue: integer);
//    function GetTaglia8: integer;
//    procedure SetTaglia8(const AValue: integer);
//    function GetTaglia9: integer;
//    procedure SetTaglia9(const AValue: integer);
//    function GetTaglia10: integer;
//    procedure SetTaglia10(const AValue: integer);
//    function GetTaglia11: integer;
//    procedure SetTaglia11(const AValue: integer);
//    function GetTaglia12: integer;
//    procedure SetTaglia12(const AValue: integer);
//    function GetTaglia13: integer;
//    procedure SetTaglia13(const AValue: integer);
//    function GetTaglia14: integer;
//    procedure SetTaglia14(const AValue: integer);
//    function GetTaglia15: integer;
//    procedure SetTaglia15(const AValue: integer);
//    function GetTaglia16: integer;
//    procedure SetTaglia16(const AValue: integer);
//    function GetTaglia17: integer;
//    procedure SetTaglia17(const AValue: integer);
//    function GetTaglia18: integer;
//    procedure SetTaglia18(const AValue: integer);
//    function GetTaglia19: integer;
//    procedure SetTaglia19(const AValue: integer);
//    function GetTaglia20: integer;
//    procedure SetTaglia20(const AValue: integer);
//    function GetTaglia21: integer;
//    procedure SetTaglia21(const AValue: integer);
//    function GetTaglia22: integer;
//    procedure SetTaglia22(const AValue: integer);
//    function GetTaglia23: integer;
//    procedure SetTaglia23(const AValue: integer);
//    function GetTaglia24: integer;
//    procedure SetTaglia24(const AValue: integer);
//    function GetQuantitaTotale: integer;
//  public
//    property ID: Integer read GetID write SetID;
//    property RigaID: Integer read GetRigaID write SetRigaID;
//    property Taglia1: integer read GetTaglia1 write SetTaglia1;
//    property Taglia2: integer read GetTaglia2 write SetTaglia2;
//    property Taglia3: integer read GetTaglia3 write SetTaglia3;
//    property Taglia4: integer read GetTaglia4 write SetTaglia4;
//    property Taglia5: integer read GetTaglia5 write SetTaglia5;
//    property Taglia6: integer read GetTaglia6 write SetTaglia6;
//    property Taglia7: integer read GetTaglia7 write SetTaglia7;
//    property Taglia8: integer read GetTaglia8 write SetTaglia8;
//    property Taglia9: integer read GetTaglia9 write SetTaglia9;
//    property Taglia10: integer read GetTaglia10 write SetTaglia10;
//    property Taglia11: integer read GetTaglia11 write SetTaglia11;
//    property Taglia12: integer read GetTaglia12 write SetTaglia12;
//    property Taglia13: integer read GetTaglia13 write SetTaglia13;
//    property Taglia14: integer read GetTaglia14 write SetTaglia14;
//    property Taglia15: integer read GetTaglia15 write SetTaglia15;
//    property Taglia16: integer read GetTaglia16 write SetTaglia16;
//    property Taglia17: integer read GetTaglia17 write SetTaglia17;
//    property Taglia18: integer read GetTaglia18 write SetTaglia18;
//    property Taglia19: integer read GetTaglia19 write SetTaglia19;
//    property Taglia20: integer read GetTaglia20 write SetTaglia20;
//    property Taglia21: integer read GetTaglia21 write SetTaglia21;
//    property Taglia22: integer read GetTaglia22 write SetTaglia22;
//    property Taglia23: integer read GetTaglia23 write SetTaglia23;
//    property Taglia24: integer read GetTaglia24 write SetTaglia24;
//    [IoSkip]
//    property QuantitaTotale: integer read GetQuantitaTotale;
//  end;

  [ioEntity('RigheOrdine')]
  TRigaOrdine = class(TInterfacedObject, IRigaOrdine, IListableView)
  private
    FAliquotaIva: IAliquotaIva;
    FArticolo: IArticolo;
    FCodiceSconto: ICodiceSconto;
    FDataConsegna: TDateTime;
    FID: Integer;
    FTestataID: Integer;
    FNumeroRiga: Integer;
    FImportoTotale: Currency;
    FImportoUnitario: Currency;
    FQuantitaTotale: Integer;
    FMerceInCV: Boolean;
    FNote: string;
    //FQuantita: IScalarinoTaglia;
    FRiferimentiLiberi: string;
    FRipartizioneTaglia: IRipartizioneTaglia;
    FSconto1: Currency;
    FSconto2: Currency;
    FSconto3: Currency;
    FScontoTestata: Boolean;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    FArticoloCodiceDecodifica: string;
    FArticoloDescrizioneDecodifica: string;
    FCodiceRipartizione: string;
    FAliquotaIvaCodiceDecodifica: string;
    FAliquotaIvaDecrizioneDecodifica: string;
    FCodiceScontoDecodifica: string;
    FCodiceScontoDescrizioneDecodifica: string;
    FQuantitaTaglia1: integer;
    FQuantitaTaglia2: integer;
    FQuantitaTaglia3: integer;
    FQuantitaTaglia4: integer;
    FQuantitaTaglia5: integer;
    FQuantitaTaglia6: integer;
    FQuantitaTaglia7: integer;
    FQuantitaTaglia8: integer;
    FQuantitaTaglia9: integer;
    FQuantitaTaglia10: integer;
    FQuantitaTaglia11: integer;
    FQuantitaTaglia12: integer;
    FQuantitaTaglia13: integer;
    FQuantitaTaglia14: integer;
    FQuantitaTaglia15: integer;
    FQuantitaTaglia16: integer;
    FQuantitaTaglia17: integer;
    FQuantitaTaglia18: integer;
    FQuantitaTaglia19: integer;
    FQuantitaTaglia20: integer;
    FQuantitaTaglia21: integer;
    FQuantitaTaglia22: integer;
    FQuantitaTaglia23: integer;
    FQuantitaTaglia24: integer;
    function GetAliquotaIva: IAliquotaIva;
    function GetArticolo: IArticolo;
    function GetCodiceSconto: ICodiceSconto;
    function GetDataConsegna: TDateTime;
    function GetID: Integer;
    function GetTestataID: Integer;
    function GetNumeroRiga: Integer;
    function GetImportoTotale: Currency;
    function GetImportoUnitario: Currency;
    function GetMerceInCV: Boolean;
    function GetNote: string;
    //function GetQuantita: IScalarinoTaglia;
    function GetQuantitaTotale: Integer;
    function GetRiferimentiLiberi: string;
    function GetRipartizioneTaglia: IRipartizioneTaglia;
    function GetSconto1: Currency;
    function GetSconto2: Currency;
    function GetSconto3: Currency;
    function GetScontoTestata: Boolean;
    procedure SetAliquotaIva(const Value: IAliquotaIva);
    procedure SetArticolo(const Value: IArticolo);
    procedure SetCodiceSconto(const Value: ICodiceSconto);
    procedure SetDataConsegna(const Value: TDateTime);
    procedure SetID(const Value: Integer);
    procedure SetTestataID(const Value: Integer);
    procedure SetNumeroRiga(const Value: Integer);
    procedure SetImportoTotale(const Value: Currency);
    procedure SetImportoUnitario(const Value: Currency);
    procedure SetMerceInCV(const Value: Boolean);
    procedure SetNote(const Value: string);
    //procedure SetQuantita(const Value: IScalarinoTaglia);
    procedure SetRiferimentiLiberi(const Value: string);
    procedure SetRipartizioneTaglia(const Value: IRipartizioneTaglia);
    procedure SetSconto1(const Value: Currency);
    procedure SetSconto2(const Value: Currency);
    procedure SetSconto3(const Value: Currency);
    procedure SetScontoTestata(const Value: Boolean);
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    function GetItemText: String;
    function GetQuantitaTaglia1: integer;
    function GetQuantitaTaglia10: integer;
    function GetQuantitaTaglia11: integer;
    function GetQuantitaTaglia12: integer;
    function GetQuantitaTaglia13: integer;
    function GetQuantitaTaglia14: integer;
    function GetQuantitaTaglia15: integer;
    function GetQuantitaTaglia16: integer;
    function GetQuantitaTaglia17: integer;
    function GetQuantitaTaglia18: integer;
    function GetQuantitaTaglia19: integer;
    function GetQuantitaTaglia2: integer;
    function GetQuantitaTaglia20: integer;
    function GetQuantitaTaglia21: integer;
    function GetQuantitaTaglia22: integer;
    function GetQuantitaTaglia23: integer;
    function GetQuantitaTaglia24: integer;
    function GetQuantitaTaglia3: integer;
    function GetQuantitaTaglia4: integer;
    function GetQuantitaTaglia5: integer;
    function GetQuantitaTaglia6: integer;
    function GetQuantitaTaglia7: integer;
    function GetQuantitaTaglia8: integer;
    function GetQuantitaTaglia9: integer;
    // Decodifiche
    function GetArticoloCodiceDecodifica: string;
    function GetArticoloDescrizioneDecodifica: string;
    function GetCodiceRipartizione: String;
    function GetAliquotaIvaCodiceDecodifica: String;
    function GetCodiceScontoDecodifica: String;
    function GetCodiceScontoDescrizioneDecodifica: String;
    function GetAliquotaIvaDecrizioneDecodifica: String;
    procedure SetQuantitaTaglia1(const Value: integer);
    procedure SetQuantitaTaglia10(const Value: integer);
    procedure SetQuantitaTaglia11(const Value: integer);
    procedure SetQuantitaTaglia12(const Value: integer);
    procedure SetQuantitaTaglia13(const Value: integer);
    procedure SetQuantitaTaglia14(const Value: integer);
    procedure SetQuantitaTaglia15(const Value: integer);
    procedure SetQuantitaTaglia16(const Value: integer);
    procedure SetQuantitaTaglia17(const Value: integer);
    procedure SetQuantitaTaglia18(const Value: integer);
    procedure SetQuantitaTaglia19(const Value: integer);
    procedure SetQuantitaTaglia2(const Value: integer);
    procedure SetQuantitaTaglia20(const Value: integer);
    procedure SetQuantitaTaglia21(const Value: integer);
    procedure SetQuantitaTaglia22(const Value: integer);
    procedure SetQuantitaTaglia23(const Value: integer);
    procedure SetQuantitaTaglia24(const Value: integer);
    procedure SetQuantitaTaglia3(const Value: integer);
    procedure SetQuantitaTaglia4(const Value: integer);
    procedure SetQuantitaTaglia5(const Value: integer);
    procedure SetQuantitaTaglia6(const Value: integer);
    procedure SetQuantitaTaglia7(const Value: integer);
    procedure SetQuantitaTaglia8(const Value: integer);
    procedure SetQuantitaTaglia9(const Value: integer);
    procedure SetQuantitaTotale(const Value: Integer);
    // Decodifiche
    procedure SetArticoloCodiceDecodifica(const Value: string);
    procedure SetArticoloDescrizioneDecodifica(const Value: string);
    procedure SetCodiceRipartizione(const Value: String);
    procedure SetAliquotaIvaCodiceDecodifica(const Value: String);
    procedure SetAliquotaIvaDecrizioneDecodifica(const Value: String);
    procedure SetCodiceScontoDecodifica(const Value: String);
    procedure SetCodiceScontoDescrizioneDecodifica(const Value: String);
  public
    constructor Create;
    property ID:Integer read GetID write SetID;
    property TestataID:Integer read GetTestataID write SetTestataID;
    property NumeroRiga: Integer read GetNumeroRiga write SetNumeroRiga;
    [ioBelongsTo('IArticolo')]
    property Articolo:IArticolo read GetArticolo write SetArticolo;
    [ioBelongsTo('IRipartizioneTaglia')]
    property RipartizioneTaglia:IRipartizioneTaglia read GetRipartizioneTaglia write SetRipartizioneTaglia;
    property DataConsegna:TDateTime read GetDataConsegna write SetDataConsegna;
    [ioBelongsTo('IAliquotaIva')]
    property AliquotaIva:IAliquotaIva read GetAliquotaIva write SetAliquotaIva;
    property ScontoTestata:Boolean read GetScontoTestata write SetScontoTestata;
    property Sconto1:Currency read GetSconto1 write SetSconto1;
    property Sconto2:Currency read GetSconto2 write SetSconto2;
    property Sconto3:Currency read GetSconto3 write SetSconto3;
    [ioBelongsTo('ICodiceSconto')]
    property CodiceSconto:ICodiceSconto read GetCodiceSconto write SetCodiceSconto;
    property Note:string read GetNote write SetNote;
    property MerceInCV:Boolean read GetMerceInCV write SetMerceInCV;
    //property CodiceCommento:ISetCommenti read GetCodiceCommento write SetCodiceCommento;
    property RiferimentiLiberi:string read GetRiferimentiLiberi write SetRiferimentiLiberi;
    //[ioHasOne('IScalarinoTaglia','RigaID')]
    //property Quantita: IScalarinoTaglia read GetQuantita write SetQuantita;
    property QuantitaTotale: Integer read GetQuantitaTotale write SetQuantitaTotale;
    property QuantitaTaglia1: integer read GetQuantitaTaglia1 write SetQuantitaTaglia1;
    property QuantitaTaglia2: integer read GetQuantitaTaglia2 write SetQuantitaTaglia2;
    property QuantitaTaglia3: integer read GetQuantitaTaglia3 write SetQuantitaTaglia3;
    property QuantitaTaglia4: integer read GetQuantitaTaglia4 write SetQuantitaTaglia4;
    property QuantitaTaglia5: integer read GetQuantitaTaglia5 write SetQuantitaTaglia5;
    property QuantitaTaglia6: integer read GetQuantitaTaglia6 write SetQuantitaTaglia6;
    property QuantitaTaglia7: integer read GetQuantitaTaglia7 write SetQuantitaTaglia7;
    property QuantitaTaglia8: integer read GetQuantitaTaglia8 write SetQuantitaTaglia8;
    property QuantitaTaglia9: integer read GetQuantitaTaglia9 write SetQuantitaTaglia9;
    property QuantitaTaglia10: integer read GetQuantitaTaglia10 write SetQuantitaTaglia10;
    property QuantitaTaglia11: integer read GetQuantitaTaglia11 write SetQuantitaTaglia11;
    property QuantitaTaglia12: integer read GetQuantitaTaglia12 write SetQuantitaTaglia12;
    property QuantitaTaglia13: integer read GetQuantitaTaglia13 write SetQuantitaTaglia13;
    property QuantitaTaglia14: integer read GetQuantitaTaglia14 write SetQuantitaTaglia14;
    property QuantitaTaglia15: integer read GetQuantitaTaglia15 write SetQuantitaTaglia15;
    property QuantitaTaglia16: integer read GetQuantitaTaglia16 write SetQuantitaTaglia16;
    property QuantitaTaglia17: integer read GetQuantitaTaglia17 write SetQuantitaTaglia17;
    property QuantitaTaglia18: integer read GetQuantitaTaglia18 write SetQuantitaTaglia18;
    property QuantitaTaglia19: integer read GetQuantitaTaglia19 write SetQuantitaTaglia19;
    property QuantitaTaglia20: integer read GetQuantitaTaglia20 write SetQuantitaTaglia20;
    property QuantitaTaglia21: integer read GetQuantitaTaglia21 write SetQuantitaTaglia21;
    property QuantitaTaglia22: integer read GetQuantitaTaglia22 write SetQuantitaTaglia22;
    property QuantitaTaglia23: integer read GetQuantitaTaglia23 write SetQuantitaTaglia23;
    property QuantitaTaglia24: integer read GetQuantitaTaglia24 write SetQuantitaTaglia24;
    property ImportoUnitario:Currency read GetImportoUnitario write SetImportoUnitario;
    property ImportoTotale: Currency read GetImportoTotale write SetImportoTotale;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
    [ioSkip]
    property ArticoloCodiceDecodifica: string read GetArticoloCodiceDecodifica write SetArticoloCodiceDecodifica;
    [ioSkip]
    property ArticoloDescrizioneDecodifica: string read GetArticoloDescrizioneDecodifica write SetArticoloDescrizioneDecodifica;
    [ioSkip]
    property CodiceRipartizione: String read GetCodiceRipartizione write SetCodiceRipartizione;
    [ioSkip]
    property AliquotaIvaCodiceDecodifica: String read GetAliquotaIvaCodiceDecodifica write SetAliquotaIvaCodiceDecodifica;
    [ioSkip]
    property AliquotaIvaDescrizioneDecodifica: String read GetAliquotaIvaDecrizioneDecodifica write SetAliquotaIvaDecrizioneDecodifica;
    [ioSkip]
    property CodiceScontoDecodifica: String read GetCodiceScontoDecodifica write SetCodiceScontoDecodifica;
    [ioSkip]
    property CodiceScontoDescrizioneDecodifica: String read GetCodiceScontoDescrizioneDecodifica write SetCodiceScontoDescrizioneDecodifica;
  end;

  [ioEntity('TestateOrdini'), ioFields]
  TTestataOrdine = class(TInterfacedObject, ITestataOrdine,IListableView)
  private
    FCambio: Currency;
    FClasse: IClasseOrdine;
    FCliente: ICliente;
    FCodiceSconto: ICodiceSconto;
    FDataConsegna: TDateTime;
    FDataOrdine: TDateTime;
    FDataRiferimento: TDateTime;
    FID: Integer;
    FListino: ITipoListino;
    FMagazzino: IMagazzino;
    FRiferimento: String;
    FRighe: TList<IRigaOrdine>;
    FSconto1: Currency;
    FSconto2: Currency;
    FSconto3: Currency;
    FStagione: IStagione;
    FStatoSincronizzazione: TStatoSincronizzazione;
    FTipoDocumento: ITipoDocumento;
    FTipoOperatore: String;
    FTipoPagamento: ITipoPagamento;
    FValuta: IValuta;
    FNumeroOrdine: String;
    FImportoTotale: currency;
    FQuantitaTotale: Integer;
    FUtenteInserimento: String;
    FUtenteUltimaModifica: String;
    FItemText: string;
    FItemDetail: string;
    FItemHeaderText: string;
    FClienteCodiceDecodifica: string;
    FClienteDescrizioneDecodifica: string;
    FMagazzinoCodiceDecodifica: string;
    FMagazzinoDescrizioneDecodifica: string;
    FTipoPagamentoCodiceDecodifica: string;
    FTipoPagamentoDescrizioneDecodifica: string;
    FScontoCodiceDecodifica: string;
    FScontoDescrizioneDecodifica: string;
    FListinoCodiceDecodifica: string;
    FListinoDescrizioneDecodifica: string;
    FClasseOrdineCodiceDecodifica: string;
    FClasseOrdineDescrizioneDecodifica: string;
    FStagioneCodiceDecodifica: string;
    FStagioneDescrizioneDecodifica: string;
    FTipoDocumentoCodiceDecodifica: string;
    FTipoDocumentoDescrizioneDecodifica: string;
    FValutaCodiceDecodifica: string;
    function GetCambio: Currency;
    function GetClasse: IClasseOrdine;
    function GetCliente: ICliente;
    function GetCodiceSconto: ICodiceSconto;
    function GetDataConsegna: TDateTime;
    function GetDataOrdine: TDateTime;
    function GetDataRiferimento: TDateTime;
    function GetID: Integer;
    function GetListino: ITipoListino;
    function GetMagazzino: IMagazzino;
    function GetRiferimento: String;
    function GetRighe: TList<IRigaOrdine>;
    function GetSconto1: Currency;
    function GetSconto2: Currency;
    function GetSconto3: Currency;
    function GetStagione: IStagione;
    function GetStatoSincronizzazione: TStatoSincronizzazione;
    function GetTipoDocumento: ITipoDocumento;
    function GetTipoOperatore: String;
    function GetTipoPagamento: ITipoPagamento;
    function GetValuta: IValuta;
    function GetNumeroOrdine: String;
    function GetImportoTotale: currency;
    function GetQuantitaTotale: Integer;
    function GetUtenteInserimento: String;
    function GetUtenteUltimaModifica: String;
    function DecodificaStato(const Value: TStatoSincronizzazione): string;
//    function GetMagazzinoDecodifica: String;
    function GetStatoSincronizzazioneDecodifica: String;
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetCambio(const Value: Currency);
    procedure SetClasse(const Value: IClasseOrdine);
    procedure SetCliente(const Value: ICliente);
    procedure SetCodiceSconto(const Value: ICodiceSconto);
    procedure SetDataConsegna(const Value: TDateTime);
    procedure SetDataOrdine(const Value: TDateTime);
    procedure SetDataRiferimento(const Value: TDateTime);
    procedure SetID(const Value: Integer);
    procedure SetListino(const Value: ITipoListino);
    procedure SetMagazzino(const Value: IMagazzino);
    procedure SetRiferimento(const Value: String);
    procedure SetRighe(const Value: TList<IRigaOrdine>);
    procedure SetSconto1(const Value: Currency);
    procedure SetSconto2(const Value: Currency);
    procedure SetSconto3(const Value: Currency);
    procedure SetStagione(const Value: IStagione);
    procedure SetStatoSincronizzazione(const Value: TStatoSincronizzazione);
    procedure SetTipoDocumento(const Value: ITipoDocumento);
    procedure SetTipoOperatore(const Value: String);
    procedure SetTipoPagamento(const Value: ITipoPagamento);
    procedure SetValuta(const Value: IValuta);
    procedure SetNumeroOrdine(const Value: String);
    procedure SetUtenteUltimaModifica(const Value: String);
    procedure SetUtenteInserimento(const Value: String);
    procedure SetImportoTotale(const Value: Currency);
    procedure SetQuantitaTotale(const Value: Integer);
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
    // Decodifiche setter
    procedure SetClienteCodiceDecodifica(const Value: string);
    procedure SetClienteDescrizioneDecodifica(const Value: string);
    procedure SetMagazzinoCodiceDecodifica(const Value: string);
    procedure SetMagazzinoDescrizioneDecodifica(const Value: string);
    procedure SetTipoPagamentoCodiceDecodifica(const Value: string);
    procedure SetTipoPagamentoDescrizioneDecodifica(const Value: string);
    procedure SetScontoCodiceDecodifica(const Value: string);
    procedure SetScontoDescrizioneDecodifica(const Value: string);
    procedure SetListinoCodiceDecodifica(const Value: string);
    procedure SetListinoDescrizioneDecodifica(const Value: string);
    procedure SetClasseOrdineCodiceDecodifica(const Value: string);
    procedure SetClasseOrdineDescrizioneDecodifica(const Value: string);
    procedure SetStagioneCodiceDecodifica(const Value: string);
    procedure SetStagioneDescrizioneDecodifica(const Value: string);
    procedure SetTipoDocumentoCodiceDecodifica(const Value: string);
    procedure SetTipoDocumentoDescrizioneDecodifica(const Value: string);
    procedure SetValutaCodiceDecodifica(const Value: string);
    // Decodifiche getter
    function GetClienteCodiceDecodifica: String;
    function GetClienteDescrizioneDecodifica: String;
    function GetMagazzinoCodiceDecodifica: String;
    function GetMagazzinoDescrizioneDecodifica: String;
    function GetTipoPagamentoCodiceDecodifica: String;
    function GetTipoPagamentoDescrizioneDecodifica: String;
    function GetScontoCodiceDecodifica: String;
    function GetScontoDescrizioneDecodifica: String;
    function GetListinoCodiceDecodifica: String;
    function GetListinoDescrizioneDecodifica: String;
    function GetClasseOrdineCodiceDecodifica: String;
    function GetClasseOrdineDescrizioneDecodifica: String;
    function GetStagioneCodiceDecodifica: String;
    function GetStagioneDescrizioneDecodifica: String;
    function GetTipoDocumentoCodiceDecodifica: String;
    function GetTipoDocumentoDescrizioneDecodifica: String;
    function GetValutaCodiceDecodifica: String;
  public
    constructor Create;
    property ID:Integer read GetID write SetID;
    [ioBelongsTo('ICliente')]
    property Cliente:ICliente read GetCliente write SetCliente;
    [ioIndex('NumeroOrdine',ioAscending,True)]
    property NumeroOrdine:String read GetNumeroOrdine write SetNumeroOrdine;
    property DataOrdine:TDateTime read GetDataOrdine write SetDataOrdine;
    property Riferimento:String read GetRiferimento write SetRiferimento;
    property DataRiferimento:TDateTime read GetDataRiferimento write SetDataRiferimento;
    [ioBelongsTo('IMagazzino')]
    property Magazzino:IMagazzino read GetMagazzino write SetMagazzino;
    property DataConsegna:TDateTime read GetDataConsegna write SetDataConsegna;
    [ioBelongsTo('IValuta')]
    property Valuta:IValuta read GetValuta write SetValuta;
    property Cambio:Currency read GetCambio write SetCambio;
    property TipoOperatore:String read GetTipoOperatore write SetTipoOperatore;
    [ioBelongsTo('ITipoPagamento')]
    property TipoPagamento:ITipoPagamento read GetTipoPagamento write SetTipoPagamento;
    property Sconto1:Currency read GetSconto1 write SetSconto1;
    property Sconto2:Currency read GetSconto2 write SetSconto2;
    property Sconto3:Currency read GetSconto3 write SetSconto3;
    [ioBelongsTo('ICodiceSconto')]
    property CodiceSconto:ICodiceSconto read GetCodiceSconto write SetCodiceSconto;
    [ioBelongsTo('ITipoListino')]
    property Listino:ITipoListino read GetListino write SetListino;
    [ioBelongsTo('IClasseOrdine')]
    property Classe:IClasseOrdine read GetClasse write SetClasse;
    [ioBelongsTo('IStagione')]
    property Stagione:IStagione read GetStagione write SetStagione;
    [ioBelongsTo('ITipoDocumento')]
    property TipoDocumento:ITipoDocumento read GetTipoDocumento write SetTipoDocumento;
    property StatoSincronizzazione:TStatoSincronizzazione read GetStatoSincronizzazione write SetStatoSincronizzazione;
    //[ioHasMany('IRigaOrdine', 'TestataID', ioLazyLoad), ioInject]
    //property Righe:IioList<IRigaOrdine> read GetRighe write SetRighe;
    [ioHasMany('IRigaOrdine', 'TestataID', ioLazyLoad)]
    property Righe:TList<IRigaOrdine> read GetRighe write SetRighe;
    property ImportoTotale: currency read GetImportoTotale write SetImportoTotale;
    property QuantitaTotale: integer read GetQuantitaTotale write SetQuantitaTotale;
    property UtenteInserimento: string read GetUtenteInserimento write SetUtenteInserimento;
    property UtenteUltimaModifica: string read GetUtenteUltimaModifica write SetUtenteUltimaModifica;
    // Per decodifiche
    [ioSkip]
    property StatoSincronizzazioneDecodifica: String read GetStatoSincronizzazioneDecodifica;
    [ioSkip]
    property ItemText: String read GetItemText write SetItemText;
    [ioSkip]
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    [ioSkip]
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
    [ioSkip]
    property ClienteCodiceDecodifica: String read GetClienteCodiceDecodifica write SetClienteCodiceDecodifica;
    [ioSkip]
    property ClienteDescrizioneDecodifica: String read GetClienteDescrizioneDecodifica write SetClienteDescrizioneDecodifica;
    [ioSkip]
    property MagazzinoCodiceDecodifica: String read GetMagazzinoCodiceDecodifica write SetMagazzinoCodiceDecodifica;
    [ioSkip]
    property MagazzinoDescrizioneDecodifica: String read GetMagazzinoDescrizioneDecodifica write SetMagazzinoDescrizioneDecodifica;
    [ioSkip]
    property TipoPagamentoCodiceDecodifica: String read GetTipoPagamentoCodiceDecodifica write SetTipoPagamentoCodiceDecodifica;
    [ioSkip]
    property TipoPagamentoDescrizioneDecodifica: String read GetTipoPagamentoDescrizioneDecodifica write SetTipoPagamentoDescrizioneDecodifica;
    [ioSkip]
    property ScontoCodiceDecodifica: String read GetScontoCodiceDecodifica write SetScontoCodiceDecodifica;
    [ioSkip]
    property ScontoDescrizioneDecodifica: String read GetScontoDescrizioneDecodifica write SetScontoDescrizioneDecodifica;
    [ioSkip]
    property ListinoCodiceDecodifica: String read GetListinoCodiceDecodifica write SetListinoCodiceDecodifica;
    [ioSkip]
    property ListinoDescrizioneDecodifica: String read GetListinoDescrizioneDecodifica write SetListinoDescrizioneDecodifica;
    [ioSkip]
    property ClasseOrdineCodiceDecodifica: String read GetClasseOrdineCodiceDecodifica write SetClasseOrdineCodiceDecodifica;
    [ioSkip]
    property ClasseOrdineDescrizioneDecodifica: String read GetClasseOrdineDescrizioneDecodifica write SetClasseOrdineDescrizioneDecodifica;
    [ioSkip]
    property StagioneCodiceDecodifica: String read GetStagioneCodiceDecodifica write SetStagioneCodiceDecodifica;
    [ioSkip]
    property StagioneDescrizioneDecodifica: String read GetStagioneDescrizioneDecodifica write SetStagioneDescrizioneDecodifica;
    [ioSkip]
    property TipoDocumentoCodiceDecodifica: String read GetTipoDocumentoCodiceDecodifica write SetTipoDocumentoCodiceDecodifica;
    [ioSkip]
    property TipoDocumentoDescrizioneDecodifica: String read GetTipoDocumentoDescrizioneDecodifica write SetTipoDocumentoDescrizioneDecodifica;
    [ioSkip]
    property ValutaCodiceDecodifica: String read GetValutaCodiceDecodifica write SetValutaCodiceDecodifica;
  end;

  [ioEntity('Numeratori'), ioFields]
  TNumeratore = class(TInterfacedObject, INumeratore)
  private
    FNumero: integer;
    FChiave: string;
    FID: Integer;
    function GetChiave: string;
    function GetNumero: integer;
    function GetID: Integer;
    procedure SetChiave(const Value: string);
    procedure SetNumero(const Value: integer);
    procedure SetID(const Value:Integer);
  public
    property ID: Integer read GetID write SetID;
    property Numero: integer read GetNumero write SetNumero;
    [ioIndex('Chiave',ioAscending,True)]
    property Chiave: string read GetChiave write SetChiave;
  end;

  [ioEntity('Versione'), ioFields]
  TVersione = class(TInterfacedObject, IVersione)
  private
    FNumero: Integer;
    FDataRilascio: TDateTime;
    FID: Integer;
    function GetNumero: integer;
    procedure SetNumero(const Value: integer);
    function GetDataRilascio: TDateTime;
    procedure SetDataRilascio(const Value: TDateTime);
    procedure SetID(const Value:Integer);
    function GetID: Integer;
    class var FIstanza: TVersione;
  public
    class function NuovaIstanza: TVersione;
    procedure CaricaVersione;
    property ID: Integer read GetID write SetID;
    property Numero: integer read GetNumero write SetNumero;
    property DataRilascio: TDateTime read GetDataRilascio write SetDataRilascio;
  end;

implementation

uses
  System.SysUtils, iORM.Containers.Factory, iORM,
  iORM.LazyLoad.Generics.List;

{ TMagazzino }

constructor TMagazzino.Create(ACodice: String; ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;


constructor TMagazzino.Create;
begin
  inherited;
end;


destructor TMagazzino.Destroy;
begin
  inherited;
end;

function TMagazzino.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TMagazzino.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TMagazzino.GetItemText: String;
begin
  Result := FDescrizione;
end;

procedure TMagazzino.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TMagazzino.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TMagazzino.SetItemText(Value: string);
begin
  FItemText := Value;
end;

constructor TUtente.Create;
begin
  inherited;
end;

constructor TUtente.Create(ACodice, ADescrizione, APassword: string);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  FPassword := APassword;
  inherited Create;
end;

destructor TUtente.Destroy;
begin

  inherited;
end;

function TUtente.GetPassword: String;
begin
  Result := FPassword;
end;

procedure TUtente.SetPassword(const AValue: String);
begin
  FPassword := AValue;
end;

{ TConfigurazione }

procedure TConfigurazione.SetID(const Value:Integer);
begin
  FID := Value;
end;

procedure TConfigurazione.SetMagazzino(const Value: String);
begin
  FMagazzino := Value;
end;

procedure TConfigurazione.SetPostazione(const Value: String);
begin
  FPostazione := Value;
end;

procedure TConfigurazione.SetStagione(const Value: String);
begin
  FStagione := Value;
end;

procedure TConfigurazione.SetAzienda(const Value: String);
begin
  FAzienda := Value;
end;

procedure TConfigurazione.SetClasse(const Value: String);
begin
  FClasse := Value;
end;

procedure TConfigurazione.SetCodiceLicenza(const Value: String);
begin
  FCodiceLicenza := Value;
end;

function TConfigurazione.GetID: Integer;
begin
  Result := FID;
end;

function TConfigurazione.GetMagazzino: String;
begin
  Result := FMagazzino;
end;

function TConfigurazione.GetPostazione: String;
begin
  Result := FPostazione;
end;

function TConfigurazione.GetStagione: String;
begin
  Result := FStagione;
end;

class function TConfigurazione.NuovaIstanza: TConfigurazione;
begin
  if not Assigned(FIstanza) then
  begin
    FIstanza := TConfigurazione.Create;
    FIstanza.CaricaConfigurazione;
  end;
  Result := FIstanza
end;

procedure TConfigurazione.CaricaConfigurazione;
var
  LConfigurazione: TConfigurazione;
begin
//  LConfigurazione := TBaseData.CaricaConfigurazione;
//  try
//    FPostazione := LConfigurazione.Postazione;
//    FAzienda := LConfigurazione.Azienda;
//    FCodiceLicenza := LConfigurazione.CodiceLicenza;
//    FClasse := LConfigurazione.Classe;
//    FStagione := LConfigurazione.Stagione;
//    FMagazzino := LConfigurazione.Magazzino;
//
//  finally
//    LConfigurazione.Free;
//  end;
end;

function TConfigurazione.GetAzienda: String;
begin
  Result := FAzienda;
end;

function TConfigurazione.GetClasse: String;
begin
  Result := FClasse;
end;

function TConfigurazione.GetCodiceLicenza: String;
begin
  Result := FCodiceLicenza;
end;

{ TTabelleBase }

function TTabelleBase.GetCodice: String;
begin
  Result := FCodice;
end;

function TTabelleBase.GetDescrizione: String;
begin
  Result := FDescrizione;
end;

function TTabelleBase.GetID: Integer;
begin
  Result := FID;
end;

function TTabelleBase.GetTitolo: String;
begin
  Result := FTitolo;
end;

procedure TTabelleBase.SetCodice(const AValue: String);
begin
  FCodice := AValue;
end;

procedure TTabelleBase.SetDescrizione(const AValue: String);
begin
  FDescrizione := AValue;
end;

procedure TTabelleBase.SetID(const AValue: Integer);
begin
  FID := AValue;
end;

procedure TTabelleBase.SetTitolo(const AValue: String);
begin
  FTitolo := AValue;
end;

constructor TValuta.Create(ACodice, ADescrizione: String;
  ANumeroDecimali: Integer; AImportoCambio: Currency; ATipoOperatore: string);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  FNumeroDecimali := ANumeroDecimali;
  FImportoCambio := AImportoCambio;
  FTipoOperatore := ATipoOperatore;
  inherited Create;
end;

constructor TValuta.Create;
begin
  inherited;
end;

destructor TValuta.Destroy;
begin

  inherited;
end;

function TValuta.GetImportoCambio: Currency;
begin
  Result := FImportoCambio;
end;

function TValuta.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TValuta.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TValuta.GetItemText: String;
begin
  Result := FDescrizione;
end;

function TValuta.GetNumeroDecimali: Integer;
begin
  Result := FNumeroDecimali;
end;

function TValuta.GetTipoOperatore: String;
begin
  Result := FTipoOperatore;
end;

procedure TValuta.SetImportoCambio(const AValue: Currency);
begin
  FImportoCambio := AValue;
end;

procedure TValuta.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TValuta.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TValuta.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TValuta.SetNumeroDecimali(const AValue: Integer);
begin
  FNumeroDecimali := AValue;
end;

procedure TValuta.SetTipoOperatore(const AValue: String);
begin
  FTipoOperatore := AValue;
end;

{ TTipoPagamento }

constructor TTipoPagamento.Create;
begin

end;

constructor TTipoPagamento.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TTipoPagamento.Destroy;
begin

  inherited;
end;

function TTipoPagamento.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TTipoPagamento.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TTipoPagamento.GetItemText: String;
begin
  Result := FDescrizione;
end;

procedure TTipoPagamento.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TTipoPagamento.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TTipoPagamento.SetItemText(Value: string);
begin
  FItemText := Value;
end;

{ TCodiceSconto }

constructor TCodiceSconto.Create(ACodice, ADescrizione: String; ASc1, ASc2,
  ASc3, ASc4, ASc5, ASc6, Asc7, Asc8, Asc9, Asc10: Currency);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  FSc1 := ASc1;
  FSc2 := ASc2;
  FSc3 := ASc3;
  FSc4 := ASc4;
  FSc5 := ASc5;
  FSc6 := ASc6;
  FSc7 := ASc7;
  FSc8 := ASc8;
  FSc9 := ASc9;
  FSc10 := ASc10;
  inherited Create;
end;

constructor TCodiceSconto.Create;
begin

end;

destructor TCodiceSconto.Destroy;
begin

  inherited;
end;

function TCodiceSconto.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TCodiceSconto.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TCodiceSconto.GetItemText: String;
begin
  Result := FDescrizione;
end;

function TCodiceSconto.GetPercSconto1: Currency;
begin
  Result := FSc1;
end;

procedure TCodiceSconto.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TCodiceSconto.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TCodiceSconto.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TCodiceSconto.SetPercSconto1(const AValue: Currency);
begin
  FSc1 := AValue;
end;

function TCodiceSconto.GetPercSconto2: Currency;
begin
  Result := FSc2;
end;

procedure TCodiceSconto.SetPercSconto2(const AValue: Currency);
begin
  FSc2 := AValue;
end;

function TCodiceSconto.GetPercSconto3: Currency;
begin
  Result := FSc3;
end;

procedure TCodiceSconto.SetPercSconto3(const AValue: Currency);
begin
  FSc3 := AValue;
end;

function TCodiceSconto.GetPercSconto4: Currency;
begin
  Result := FSc4;
end;

procedure TCodiceSconto.SetPercSconto4(const AValue: Currency);
begin
  FSc4 := AValue;
end;

function TCodiceSconto.GetPercSconto5: Currency;
begin
  Result := FSc5;
end;

procedure TCodiceSconto.SetPercSconto5(const AValue: Currency);
begin
  FSc5 := AValue;
end;

function TCodiceSconto.GetPercSconto6: Currency;
begin
  Result := FSc6;
end;

procedure TCodiceSconto.SetPercSconto6(const AValue: Currency);
begin
  FSc6 := AValue;
end;

function TCodiceSconto.GetPercSconto7: Currency;
begin
  Result := FSc7;
end;

procedure TCodiceSconto.SetPercSconto7(const AValue: Currency);
begin
  FSc7 := AValue;
end;

function TCodiceSconto.GetPercSconto8: Currency;
begin
  Result := FSc8;
end;

procedure TCodiceSconto.SetPercSconto8(const AValue: Currency);
begin
  FSc8 := AValue;
end;

function TCodiceSconto.GetPercSconto9: Currency;
begin
  Result := FSc9;
end;

procedure TCodiceSconto.SetPercSconto9(const AValue: Currency);
begin
  FSc9 := AValue;
end;

function TCodiceSconto.GetPercSconto10: Currency;
begin
  Result := FSc10;
end;

procedure TCodiceSconto.SetPercSconto10(const AValue: Currency);
begin
  FSc10 := AValue;
end;

{ TTipoListino }

constructor TTipoListino.Create;
begin

end;

constructor TTipoListino.Create(ACodice, ADescrizione, ATipo: String;
  AValuta: string);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  FTipo := ATipo;
  FValuta := AValuta;
  inherited Create;
end;

destructor TTipoListino.Destroy;
begin

  inherited;
end;

function TTipoListino.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TTipoListino.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TTipoListino.GetItemText: String;
begin
  Result := FDescrizione;
end;

function TTipoListino.GetTipo: String;
begin
  Result := FTipo;
end;

function TTipoListino.GetValuta: string;
begin
  Result := FValuta;
end;

procedure TTipoListino.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TTipoListino.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TTipoListino.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TTipoListino.SetTipo(const AValue: String);
begin
  FTipo := AValue;
end;

procedure TTipoListino.SetValuta(const AValue: string);
begin
  FValuta := AValue;
end;

{ TClasseOrdine }

constructor TClasseOrdine.Create;
begin

end;

constructor TClasseOrdine.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TClasseOrdine.Destroy;
begin

  inherited;
end;

function TClasseOrdine.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TClasseOrdine.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TClasseOrdine.GetItemText: String;
begin
  Result := FDescrizione;
end;

procedure TClasseOrdine.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TClasseOrdine.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TClasseOrdine.SetItemText(Value: string);
begin
  FItemText := Value;
end;

{ TStagione }

constructor TStagione.Create;
begin

end;

constructor TStagione.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TStagione.Destroy;
begin

  inherited;
end;

function TStagione.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TStagione.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TStagione.GetItemText: String;
begin
  Result := FDescrizione;
end;

procedure TStagione.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TStagione.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TStagione.SetItemText(Value: string);
begin
  FItemText := Value;
end;

{ TTipoDocumento }

constructor TTipoDocumento.Create;
begin

end;

constructor TTipoDocumento.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TTipoDocumento.Destroy;
begin

  inherited;
end;

function TTipoDocumento.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TTipoDocumento.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TTipoDocumento.GetItemText: String;
begin
  Result := FDescrizione;
end;

procedure TTipoDocumento.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TTipoDocumento.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TTipoDocumento.SetItemText(Value: string);
begin
  FItemText := Value;
end;

{ TRaggruppamento }

constructor TRaggruppamento.Create;
begin

end;

constructor TRaggruppamento.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TRaggruppamento.Destroy;
begin

  inherited;
end;

{ TCodiceSpesa }

constructor TCodiceSpesa.Create;
begin

end;

constructor TCodiceSpesa.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TCodiceSpesa.Destroy;
begin

  inherited;
end;

{ TSincroInfo }

constructor TSincroInfo.Create;
begin
  FID := 1;
  FServerIpAddress := '127.0.0.1';
  FServerPortNumber := 8070;
  FTabellaArticoli := False;
  FTabellaValute := False;
  FTabellaListiniDiVendita := False;
  FTabellaStagioni := False;
  FTabellaCodiciABarre := False;
  FTabellaAliquoteIva := False;
  FTabellaTipoListini := False;
  FTabellaRipartizioneTaglie := False;
  FTabellaClassiOrdine := False;
  FTabellaCodiciSpesa := False;
  FTabellaCodiciRaggruppamento := False;
  FTabellaTipiDocumenti := False;
  FTabellaTaglie := False;
  FTabellaCommenti := False;
  FTabellaSetTaglie := False;
  FTabellaMagazzini := False;
  FTabellaCodiciSconto := False;
  FTabellaPagamenti := False;
  FDataUltimaSincro := EncodeDate(2000,01,01);
  FUserNameSincro := '';
  FUserPasswordSincro := '';
end;

destructor TSincroInfo.Destroy;
begin

  inherited;
end;

function TSincroInfo.GetDataUltimaSincro: TDate;
begin
  Result := FDataUltimaSincro;
end;

function TSincroInfo.GetID: Integer;
begin
  Result := FID;
end;

function TSincroInfo.GetServerIpAddress: string;
begin
  Result := FServerIpAddress;
end;

function TSincroInfo.GetServerPortNumber: integer;
begin
  Result := FServerPortNumber;
end;

function TSincroInfo.GetTabellaAliquoteIva: boolean;
begin
  Result := FTabellaAliquoteIva
end;

function TSincroInfo.GetTabellaArticoli: boolean;
begin
  Result := FTabellaArticoli;
end;

function TSincroInfo.GetTabellaClassiOrdine: boolean;
begin
  Result := FTabellaClassiOrdine;
end;

function TSincroInfo.GetTabellaCodiciABarre: boolean;
begin
  Result := FTabellaCodiciABarre;
end;

function TSincroInfo.GetTabellaCodiciRaggruppamento: boolean;
begin
  Result := FTabellaCodiciRaggruppamento;
end;

function TSincroInfo.GetTabellaCodiciSconto: boolean;
begin
  Result := FTabellaCodiciSconto;
end;

function TSincroInfo.GetTabellaCodiciSpesa: boolean;
begin
  Result := FTabellaCodiciSpesa;
end;

function TSincroInfo.GetTabellaCommenti: boolean;
begin
  Result := FTabellaCommenti;
end;

function TSincroInfo.GetTabellaListiniDiVendita: boolean;
begin
  Result := FTabellaListiniDiVendita;
end;

function TSincroInfo.GetTabellaMagazzini: boolean;
begin
  Result := FTabellaMagazzini;
end;

function TSincroInfo.GetTabellaPagamenti: boolean;
begin
  Result := FTabellaPagamenti;
end;

function TSincroInfo.GetTabellaRipartizioneTaglie: boolean;
begin
  Result := FTabellaRipartizioneTaglie;
end;

function TSincroInfo.GetTabellaSetTaglie: boolean;
begin
  Result := FTabellaSetTaglie;
end;

function TSincroInfo.GetTabellaStagioni: boolean;
begin
  Result := FTabellaStagioni;
end;

function TSincroInfo.GetTabellaTaglie: boolean;
begin
  Result := FTabellaTaglie;
end;

function TSincroInfo.GetTabellaTipiDocumenti: boolean;
begin
  Result := FTabellaTipiDocumenti;
end;

function TSincroInfo.GetTabellaTipoListini: boolean;
begin
  Result := FTabellaTipoListini;
end;

function TSincroInfo.GetTabellaUtenti: boolean;
begin
  Result := FTabellaUtenti;
end;

function TSincroInfo.GetTabellaValute: boolean;
begin
  Result := FTabellaValute;
end;

function TSincroInfo.GetUserNameSincro: string;
begin
  Result := FUserNameSincro;
end;

function TSincroInfo.GetUserPasswordSincro: string;
begin
  Result := FUserPasswordSincro;
end;

procedure TSincroInfo.SetDataUltimaSincro(const AValue: TDate);
begin
  FDataUltimaSincro := AValue;
end;

procedure TSincroInfo.SetID(const AValue: Integer);
begin
  FID := AValue;
end;

procedure TSincroInfo.SetServerIpAddress(const AValue: string);
begin
  FServerIpAddress := AValue;
end;

procedure TSincroInfo.SetServerPortNumber(const AValue: integer);
begin
  FServerPortNumber := AValue;
end;

procedure TSincroInfo.SetTabellaAliquoteIva(const AValue: boolean);
begin
  FTabellaAliquoteIva := AValue;
end;

procedure TSincroInfo.SetTabellaArticoli(const AValue: boolean);
begin
  FTabellaArticoli := AValue;
end;

procedure TSincroInfo.SetTabellaClassiOrdine(const AValue: boolean);
begin
  FTabellaClassiOrdine := AValue;
end;

procedure TSincroInfo.SetTabellaCodiciABarre(const AValue: boolean);
begin
  FTabellaCodiciABarre := AValue;
end;

procedure TSincroInfo.SetTabellaCodiciRaggruppamento(const AValue: boolean);
begin
  FTabellaCodiciRaggruppamento := AValue;
end;

procedure TSincroInfo.SetTabellaCodiciSconto(const AValue: boolean);
begin
  FTabellaCodiciSconto := AValue;
end;

procedure TSincroInfo.SetTabellaCodiciSpesa(const AValue: boolean);
begin
  FTabellaCodiciSpesa := AValue;
end;

procedure TSincroInfo.SetTabellaCommenti(const AValue: boolean);
begin
  FTabellaCommenti := AValue;
end;

procedure TSincroInfo.SetTabellaListiniDiVendita(const AValue: boolean);
begin
  FTabellaListiniDiVendita := AValue;
end;

procedure TSincroInfo.SetTabellaMagazzini(const AValue: boolean);
begin
  FTabellaMagazzini := AValue;
end;

procedure TSincroInfo.SetTabellaPagamenti(const AValue: boolean);
begin
  FTabellaPagamenti := AValue;
end;

procedure TSincroInfo.SetTabellaRipartizioneTaglie(const AValue: boolean);
begin
  FTabellaRipartizioneTaglie := AValue;
end;

procedure TSincroInfo.SetTabellaSetTaglie(const AValue: boolean);
begin
  FTabellaSetTaglie := AValue;
end;

procedure TSincroInfo.SetTabellaStagioni(const AValue: boolean);
begin
  FTabellaStagioni := AValue;
end;

procedure TSincroInfo.SetTabellaTaglie(const AValue: boolean);
begin
  FTabellaTaglie := AValue;
end;

procedure TSincroInfo.SetTabellaTipiDocumenti(const AValue: boolean);
begin
  FTabellaTipiDocumenti := AValue;
end;

procedure TSincroInfo.SetTabellaTipoListini(const AValue: boolean);
begin
  FTabellaTipoListini := AValue;
end;

procedure TSincroInfo.SetTabellaUtenti(const AValue: boolean);
begin
  FTabellaUtenti := AValue;
end;

procedure TSincroInfo.SetTabellaValute(const AValue: boolean);
begin
  FTabellaValute := AValue;
end;

procedure TSincroInfo.SetUserNameSincro(const AValue: string);
begin
  FUserNameSincro := AValue;
end;

procedure TSincroInfo.SetUserPasswordSincro(const AValue: string);
begin
  FUserPasswordSincro := AValue;
end;

{ TAliquotaIva }

constructor TAliquotaIva.Create;
begin

end;

constructor TAliquotaIva.Create(ACodice, ADescrizione: String;
  APercIva: Currency);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  FPercIva := APercIva;
  inherited Create;
end;

destructor TAliquotaIva.Destroy;
begin

  inherited;
end;

function TAliquotaIva.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TAliquotaIva.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TAliquotaIva.GetItemText: String;
begin
  Result := FDescrizione;
end;

function TAliquotaIva.GetPercIva: Currency;
begin
  Result := FPercIva;
end;

procedure TAliquotaIva.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TAliquotaIva.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TAliquotaIva.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TAliquotaIva.SetPercIva(const AValue: Currency);
begin
  FPercIva := AValue;
end;

{ TRipartizioneTaglia }

constructor TRipartizioneTaglia.Create(ATipoRipartizione, ACodiceRipartizione: String);
begin
  FTipoRipartizione := ATipoRipartizione;
  FCodiceRipartizione := ACodiceRipartizione;
  inherited Create;
end;

constructor TRipartizioneTaglia.Create;
begin

end;

destructor TRipartizioneTaglia.Destroy;
begin

  inherited;
end;

function TRipartizioneTaglia.GetTipoRipartizione: String;
begin
  Result := FTipoRipartizione;
end;

procedure TRipartizioneTaglia.SetTipoRipartizione(const AValue: String);
begin
  FTipoRipartizione := AValue;
end;

function TRipartizioneTaglia.GetCodiceRipartizione: String;
begin
  Result := FCodiceRipartizione;
end;

function TRipartizioneTaglia.GetDescrizioneRipartizione: String;
begin
  Result := FDescrizioneRipartizione;
end;

procedure TRipartizioneTaglia.SetCodiceRipartizione(const AValue: String);
begin
  FCodiceRipartizione := AValue;
end;

procedure TRipartizioneTaglia.SetDescrizioneRipartizione(const AValue: String);
begin
  FDescrizioneRipartizione := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia1: integer;
begin
  Result := FQuantitaTaglia1;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia1(const AValue: integer);
begin
  FQuantitaTaglia1 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia2: integer;
begin
  Result := FQuantitaTaglia2;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia2(const AValue: integer);
begin
  FQuantitaTaglia2 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia3: integer;
begin
  Result := FQuantitaTaglia3;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia3(const AValue: integer);
begin
  FQuantitaTaglia3 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia4: integer;
begin
  Result := FQuantitaTaglia4;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia4(const AValue: integer);
begin
  FQuantitaTaglia4 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia5: integer;
begin
  Result := FQuantitaTaglia5;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia5(const AValue: integer);
begin
  FQuantitaTaglia5 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia6: integer;
begin
  Result := FQuantitaTaglia6;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia6(const AValue: integer);
begin
  FQuantitaTaglia6 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia7: integer;
begin
  Result := FQuantitaTaglia7;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia7(const AValue: integer);
begin
  FQuantitaTaglia7 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia8: integer;
begin
  Result := FQuantitaTaglia8;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia8(const AValue: integer);
begin
  FQuantitaTaglia8 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia9: integer;
begin
  Result := FQuantitaTaglia9;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia9(const AValue: integer);
begin
  FQuantitaTaglia9 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia10: integer;
begin
  Result := FQuantitaTaglia10;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia10(const AValue: integer);
begin
  FQuantitaTaglia10 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia11: integer;
begin
  Result := FQuantitaTaglia11;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia11(const AValue: integer);
begin
  FQuantitaTaglia11 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia12: integer;
begin
  Result := FQuantitaTaglia12;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia12(const AValue: integer);
begin
  FQuantitaTaglia12 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia13: integer;
begin
  Result := FQuantitaTaglia13;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia13(const AValue: integer);
begin
  FQuantitaTaglia13 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia14: integer;
begin
  Result := FQuantitaTaglia14;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia14(const AValue: integer);
begin
  FQuantitaTaglia14 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia15: integer;
begin
  Result := FQuantitaTaglia15;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia15(const AValue: integer);
begin
  FQuantitaTaglia15 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia16: integer;
begin
  Result := FQuantitaTaglia16;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia16(const AValue: integer);
begin
  FQuantitaTaglia16 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia17: integer;
begin
  Result := FQuantitaTaglia17;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia17(const AValue: integer);
begin
  FQuantitaTaglia17 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia18: integer;
begin
  Result := FQuantitaTaglia18;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia18(const AValue: integer);
begin
  FQuantitaTaglia18 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia19: integer;
begin
  Result := FQuantitaTaglia19;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia19(const AValue: integer);
begin
  FQuantitaTaglia19 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia20: integer;
begin
  Result := FQuantitaTaglia20;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia20(const AValue: integer);
begin
  FQuantitaTaglia20 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia21: integer;
begin
  Result := FQuantitaTaglia21;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia21(const AValue: integer);
begin
  FQuantitaTaglia21 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia22: integer;
begin
  Result := FQuantitaTaglia22;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia22(const AValue: integer);
begin
  FQuantitaTaglia22 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia23: integer;
begin
  Result := FQuantitaTaglia23;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia23(const AValue: integer);
begin
  FQuantitaTaglia23 := AValue;
end;

function TRipartizioneTaglia.GetQuantitaTaglia24: integer;
begin
  Result := FQuantitaTaglia24;
end;

procedure TRipartizioneTaglia.SetQuantitaTaglia24(const AValue: integer);
begin
  FQuantitaTaglia24 := AValue;
end;

procedure TRipartizioneTaglia.SetID(const AValue:Integer);
begin
  FID := AValue;
end;

procedure TRipartizioneTaglia.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TRipartizioneTaglia.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TRipartizioneTaglia.SetItemText(Value: string);
begin
  FItemText := Value;
end;

function TRipartizioneTaglia.GetID: Integer;
begin
  Result := FID;
end;

function TRipartizioneTaglia.GetItemDetail: String;
begin
  Result := FDescrizioneRipartizione;
end;

function TRipartizioneTaglia.GetItemHeaderText: String;
begin
  Result := FCodiceRipartizione + ' ' + FDescrizioneRipartizione;
end;

function TRipartizioneTaglia.GetItemText: String;
begin
  Result := FCodiceRipartizione + '/' + FTipoRipartizione;
end;

function TTaglia.GetID: Integer;
begin
  Result := FID;
end;

function TTaglia.GetTaglia1: string;
begin
  Result := FTaglia1;
end;

procedure TTaglia.SetTaglia1(const AValue: string);
begin
  FTaglia1 := AValue;
end;

function TTaglia.GetTaglia2: string;
begin
  Result := FTaglia2;
end;

procedure TTaglia.SetTaglia2(const AValue: string);
begin
  FTaglia2 := AValue;
end;

function TTaglia.GetTaglia3: string;
begin
  Result := FTaglia3;
end;

procedure TTaglia.SetTaglia3(const AValue: string);
begin
  FTaglia3 := AValue;
end;

function TTaglia.GetTaglia4: string;
begin
  Result := FTaglia4;
end;

procedure TTaglia.SetTaglia4(const AValue: string);
begin
  FTaglia4 := AValue;
end;

function TTaglia.GetTaglia5: string;
begin
  Result := FTaglia5;
end;

procedure TTaglia.SetTaglia5(const AValue: string);
begin
  FTaglia5 := AValue;
end;

function TTaglia.GetTaglia6: string;
begin
  Result := FTaglia6;
end;

procedure TTaglia.SetTaglia6(const AValue: string);
begin
  FTaglia6 := AValue;
end;

function TTaglia.GetTaglia7: string;
begin
  Result := FTaglia7;
end;

procedure TTaglia.SetTaglia7(const AValue: string);
begin
  FTaglia7 := AValue;
end;

function TTaglia.GetTaglia8: string;
begin
  Result := FTaglia8;
end;

procedure TTaglia.SetTaglia8(const AValue: string);
begin
  FTaglia8 := AValue;
end;

function TTaglia.GetTaglia9: string;
begin
  Result := FTaglia9;
end;

procedure TTaglia.SetTaglia9(const AValue: string);
begin
  FTaglia9 := AValue;
end;

function TTaglia.GetTaglia10: string;
begin
  Result := FTaglia10;
end;

procedure TTaglia.SetTaglia10(const AValue: string);
begin
  FTaglia10 := AValue;
end;

function TTaglia.GetTaglia11: string;
begin
  Result := FTaglia11;
end;

procedure TTaglia.SetTaglia11(const AValue: string);
begin
  FTaglia11 := AValue;
end;

function TTaglia.GetTaglia12: string;
begin
  Result := FTaglia12;
end;

procedure TTaglia.SetTaglia12(const AValue: string);
begin
  FTaglia12 := AValue;
end;

function TTaglia.GetTaglia13: string;
begin
  Result := FTaglia13;
end;

procedure TTaglia.SetTaglia13(const AValue: string);
begin
  FTaglia13 := AValue;
end;

function TTaglia.GetTaglia14: string;
begin
  Result := FTaglia14;
end;

procedure TTaglia.SetTaglia14(const AValue: string);
begin
  FTaglia14 := AValue;
end;

function TTaglia.GetTaglia15: string;
begin
  Result := FTaglia15;
end;

procedure TTaglia.SetTaglia15(const AValue: string);
begin
  FTaglia15 := AValue;
end;

function TTaglia.GetTaglia16: string;
begin
  Result := FTaglia16;
end;

procedure TTaglia.SetTaglia16(const AValue: string);
begin
  FTaglia16 := AValue;
end;

function TTaglia.GetTaglia17: string;
begin
  Result := FTaglia17;
end;

procedure TTaglia.SetTaglia17(const AValue: string);
begin
  FTaglia17 := AValue;
end;

function TTaglia.GetTaglia18: string;
begin
  Result := FTaglia18;
end;

procedure TTaglia.SetTaglia18(const AValue: string);
begin
  FTaglia18 := AValue;
end;

function TTaglia.GetTaglia19: string;
begin
  Result := FTaglia19;
end;

procedure TTaglia.SetTaglia19(const AValue: string);
begin
  FTaglia19 := AValue;
end;

function TTaglia.GetTaglia20: string;
begin
  Result := FTaglia20;
end;

procedure TTaglia.SetTaglia20(const AValue: string);
begin
  FTaglia20 := AValue;
end;

function TTaglia.GetTaglia21: string;
begin
  Result := FTaglia21;
end;

procedure TTaglia.SetTaglia21(const AValue: string);
begin
  FTaglia21 := AValue;
end;

function TTaglia.GetTaglia22: string;
begin
  Result := FTaglia22;
end;

procedure TTaglia.SetTaglia22(const AValue: string);
begin
  FTaglia22 := AValue;
end;

function TTaglia.GetTaglia23: string;
begin
  Result := FTaglia23;
end;

procedure TTaglia.SetTaglia23(const AValue: string);
begin
  FTaglia23 := AValue;
end;

function TTaglia.GetTaglia24: string;
begin
  Result := FTaglia24;
end;

function TTaglia.GetTaglia25: string;
begin
  Result := FTaglia25;
end;

procedure TTaglia.SetTaglia24(const AValue: string);
begin
  FTaglia24 := AValue;
end;

procedure TTaglia.SetTaglia25(const Value: string);
begin
  FTaglia25 := Value;
end;

constructor TTaglia.Create;
begin

end;

constructor TTaglia.Create(AArticolo: String);
begin
  FArticolo := AArticolo;
end;

destructor TTaglia.Destroy;
begin

  inherited;
end;

function TTaglia.GetArticolo: String;
begin
  Result := FArticolo;
end;

procedure TTaglia.SetArticolo(const AValue: String);
begin
  FArticolo := AValue;
end;

procedure TTaglia.SetID(const AValue: Integer);
begin
  FID := AValue;
end;

procedure TCodiceABarre.SetID(const AValue:Integer);
begin
  FID := AValue;
end;

function TCodiceABarre.GetID: Integer;
begin
  Result := FID;
end;

constructor TCodiceABarre.Create;
begin

end;

constructor TCodiceABarre.Create(AArticolo: String);
begin
  FArticolo := AArticolo;
  inherited Create;
end;

destructor TCodiceABarre.Destroy;
begin

  inherited;
end;

function TCodiceABarre.GetArticolo: String;
begin
  Result := FArticolo;
end;

procedure TCodiceABarre.SetArticolo(const AValue: String);
begin
  FArticolo := AValue;
end;

function TCodiceABarre.GetTaglia: String;
begin
  Result := FTaglia;
end;

procedure TCodiceABarre.SetTaglia(const AValue: String);
begin
  FTaglia := AValue;
end;

function TCodiceABarre.GetEan: String;
begin
  Result := FEan;
end;

procedure TCodiceABarre.SetEan(const AValue: String);
begin
  FEan := AValue;
end;

function TCodiceABarre.GetTipo: String;
begin
  Result := FTipo;
end;

procedure TCodiceABarre.SetTipo(const AValue: String);
begin
  FTipo := AValue;
end;

{ TListinoVendita }

constructor TListinoVendita.Create;
begin

end;

constructor TListinoVendita.Create(AListino, AArticolo: String; ADataInizio,
  ADataFine: TDateTime; APrezzo: currency);
begin
  FListino := AListino;
  FArticolo := AArticolo;
  FDataInizio := ADataInizio;
  FDataFine := ADataFine;
  FPrezzo := APrezzo;
  inherited Create;
end;

destructor TListinoVendita.Destroy;
begin

  inherited;
end;

function TListinoVendita.GetArticolo: String;
begin
  Result := FArticolo;
end;

function TListinoVendita.GetDataFine: TDateTime;
begin
  Result := FDataFine;
end;

function TListinoVendita.GetDataInizio: TDateTime;
begin
  Result := FDataInizio;
end;

function TListinoVendita.GetID: Integer;
begin
  Result := FID;
end;

function TListinoVendita.GetItemDetail: String;
begin
  Result := FListino;
end;

function TListinoVendita.GetItemHeaderText: String;
begin
  Result := FArticolo;
end;

function TListinoVendita.GetItemText: String;
begin
  if not FValuta.IsEmpty then
    Result := 'Valuta ' + FValuta
  else
    Result := '';
end;

function TListinoVendita.GetListino: String;
begin
  Result := FListino;
end;

function TListinoVendita.GetPrezzo: currency;
begin
  Result := FPrezzo;
end;

function TListinoVendita.GetValuta: string;
begin
  Result := FValuta;
end;

procedure TListinoVendita.SetArticolo(const AValue: String);
begin
  FArticolo := AValue;
end;

procedure TListinoVendita.SetDataFine(const AValue: TDateTime);
begin
  FDataFine := AValue;
end;

procedure TListinoVendita.SetDataInizio(const AValue: TDateTime);
begin
  FDataInizio := AValue;
end;

procedure TListinoVendita.SetID(const AValue: Integer);
begin
  FID := AValue;
end;

procedure TListinoVendita.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TListinoVendita.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TListinoVendita.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TListinoVendita.SetListino(const AValue: String);
begin
  FListino := AValue;
end;

procedure TListinoVendita.SetPrezzo(const AValue: currency);
begin
  FPrezzo := AValue;
end;

procedure TListinoVendita.SetValuta(const AValue: string);
begin
  FValuta := AValue;
end;

{ TArticolo }

constructor TArticolo.Create;
begin

end;

constructor TArticolo.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TArticolo.Destroy;
begin

  inherited;
end;

procedure TArticolo.SetClassificazione1(const AValue: string);
begin
  FClassificazione1 := AValue;
end;

procedure TArticolo.SetClassificazione2(const AValue: string);
begin
  FClassificazione2 := AValue;
end;

procedure TArticolo.SetClassificazione3(const AValue: string);
begin
  FClassificazione3 := AValue;
end;

procedure TArticolo.SetFornitore(const AValue: string);
begin
  FFornitore := AValue;
end;

procedure TArticolo.SetIsTagliaColore(const AValue:boolean);
begin
  FIsTagliaColore := AValue;
end;

function TArticolo.GetClassificazione1: string;
begin
  Result := FClassificazione1;
end;

function TArticolo.GetClassificazione2: string;
begin
  Result := FClassificazione2;
end;

function TArticolo.GetClassificazione3: string;
begin
  Result := FClassificazione3;
end;

function TArticolo.GetFornitore: string;
begin
  Result := FFornitore;
end;

function TArticolo.GetIsTagliaColore: boolean;
begin
  Result := FIsTagliaColore;
end;

function TArticolo.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TArticolo.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TArticolo.GetItemText: String;
begin
  Result := FDescrizione;
end;

function TArticolo.GetMarchio: string;
begin
  Result := FMarchio;
end;

function TArticolo.GetStagione: string;
begin
  Result := FStagione;
end;

function TArticolo.GetStat1: string;
begin
  Result := FStat1;
end;

function TArticolo.GetStat2: string;
begin
  Result := FStat2;
end;

function TArticolo.GetStat3: string;
begin
  Result := FStat3;
end;

function TArticolo.GetStat4: string;
begin
  Result := FStat4;
end;

function TArticolo.GetStat5: string;
begin
  Result := FStat5;
end;

function TArticolo.GetStat6: string;
begin
  Result := FStat6;
end;

function TArticolo.GetStat7: string;
begin
  Result := FStat7;
end;

function TArticolo.GetStat8: string;
begin
  Result := FStat8;
end;

function TArticolo.GetStat9: string;
begin
  Result := FStat9;
end;

procedure TArticolo.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TArticolo.SetMarchio(const AValue: string);
begin
  FMarchio := AValue;
end;

procedure TArticolo.SetStagione(const AValue: string);
begin
  FStagione := AValue;
end;

procedure TArticolo.SetStat1(const AValue: string);
begin
  FStat1 := AValue;
end;

procedure TArticolo.SetStat2(const AValue: string);
begin
  FStat2 := AValue;
end;

procedure TArticolo.SetStat3(const AValue: string);
begin
  FStat3 := AValue;
end;

procedure TArticolo.SetStat4(const AValue: string);
begin
  FStat4 := AValue;
end;

procedure TArticolo.SetStat5(const AValue: string);
begin
  FStat5 := AValue;
end;

procedure TArticolo.SetStat6(const AValue: string);
begin
  FStat6 := AValue;
end;

procedure TArticolo.SetStat7(const AValue: string);
begin
  FStat7 := AValue;
end;

procedure TArticolo.SetStat8(const AValue: string);
begin
  FStat8 := AValue;
end;

procedure TArticolo.SetStat9(const AValue: string);
begin
  FStat9 := AValue;
end;

procedure TArticolo.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TArticolo.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

{ TSetTaglia }

constructor TSetTaglia.Create;
begin

end;

constructor TSetTaglia.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
  inherited Create;
end;

destructor TSetTaglia.Destroy;
begin

  inherited;
end;

function TSetTaglia.GetTaglia1: string;
begin
  Result := FTaglia1;
end;

procedure TSetTaglia.SetTaglia1(const AValue: string);
begin
  FTaglia1 := AValue;
end;

function TSetTaglia.GetTaglia2: string;
begin
  Result := FTaglia2;
end;

procedure TSetTaglia.SetTaglia2(const AValue: string);
begin
  FTaglia2 := AValue;
end;

function TSetTaglia.GetTaglia3: string;
begin
  Result := FTaglia3;
end;

procedure TSetTaglia.SetTaglia3(const AValue: string);
begin
  FTaglia3 := AValue;
end;

function TSetTaglia.GetTaglia4: string;
begin
  Result := FTaglia4;
end;

procedure TSetTaglia.SetTaglia4(const AValue: string);
begin
  FTaglia4 := AValue;
end;

function TSetTaglia.GetTaglia5: string;
begin
  Result := FTaglia5;
end;

procedure TSetTaglia.SetTaglia5(const AValue: string);
begin
  FTaglia5 := AValue;
end;

function TSetTaglia.GetTaglia6: string;
begin
  Result := FTaglia6;
end;

procedure TSetTaglia.SetTaglia6(const AValue: string);
begin
  FTaglia6 := AValue;
end;

function TSetTaglia.GetTaglia7: string;
begin
  Result := FTaglia7;
end;

procedure TSetTaglia.SetTaglia7(const AValue: string);
begin
  FTaglia7 := AValue;
end;

function TSetTaglia.GetTaglia8: string;
begin
  Result := FTaglia8;
end;

procedure TSetTaglia.SetTaglia8(const AValue: string);
begin
  FTaglia8 := AValue;
end;

function TSetTaglia.GetTaglia9: string;
begin
  Result := FTaglia9;
end;

procedure TSetTaglia.SetTaglia9(const AValue: string);
begin
  FTaglia9 := AValue;
end;

function TSetTaglia.GetTaglia10: string;
begin
  Result := FTaglia10;
end;

procedure TSetTaglia.SetTaglia10(const AValue: string);
begin
  FTaglia10 := AValue;
end;

function TSetTaglia.GetTaglia11: string;
begin
  Result := FTaglia11;
end;

procedure TSetTaglia.SetTaglia11(const AValue: string);
begin
  FTaglia11 := AValue;
end;

function TSetTaglia.GetTaglia12: string;
begin
  Result := FTaglia12;
end;

procedure TSetTaglia.SetTaglia12(const AValue: string);
begin
  FTaglia12 := AValue;
end;

function TSetTaglia.GetTaglia13: string;
begin
  Result := FTaglia13;
end;

procedure TSetTaglia.SetTaglia13(const AValue: string);
begin
  FTaglia13 := AValue;
end;

function TSetTaglia.GetTaglia14: string;
begin
  Result := FTaglia14;
end;

procedure TSetTaglia.SetTaglia14(const AValue: string);
begin
  FTaglia14 := AValue;
end;

function TSetTaglia.GetTaglia15: string;
begin
  Result := FTaglia15;
end;

procedure TSetTaglia.SetTaglia15(const AValue: string);
begin
  FTaglia15 := AValue;
end;

function TSetTaglia.GetTaglia16: string;
begin
  Result := FTaglia16;
end;

procedure TSetTaglia.SetTaglia16(const AValue: string);
begin
  FTaglia16 := AValue;
end;

function TSetTaglia.GetTaglia17: string;
begin
  Result := FTaglia17;
end;

procedure TSetTaglia.SetTaglia17(const AValue: string);
begin
  FTaglia17 := AValue;
end;

function TSetTaglia.GetTaglia18: string;
begin
  Result := FTaglia18;
end;

procedure TSetTaglia.SetTaglia18(const AValue: string);
begin
  FTaglia18 := AValue;
end;

function TSetTaglia.GetTaglia19: string;
begin
  Result := FTaglia19;
end;

procedure TSetTaglia.SetTaglia19(const AValue: string);
begin
  FTaglia19 := AValue;
end;

function TSetTaglia.GetTaglia20: string;
begin
  Result := FTaglia20;
end;

procedure TSetTaglia.SetTaglia20(const AValue: string);
begin
  FTaglia20 := AValue;
end;

function TSetTaglia.GetTaglia21: string;
begin
  Result := FTaglia21;
end;

procedure TSetTaglia.SetTaglia21(const AValue: string);
begin
  FTaglia21 := AValue;
end;

function TSetTaglia.GetTaglia22: string;
begin
  Result := FTaglia22;
end;

procedure TSetTaglia.SetTaglia22(const AValue: string);
begin
  FTaglia22 := AValue;
end;

function TSetTaglia.GetTaglia23: string;
begin
  Result := FTaglia23;
end;

procedure TSetTaglia.SetTaglia23(const AValue: string);
begin
  FTaglia23 := AValue;
end;

function TSetTaglia.GetTaglia24: string;
begin
  Result := FTaglia24;
end;

procedure TSetTaglia.SetTaglia24(const AValue: string);
begin
  FTaglia24 := AValue;
end;

{ TCliente }

constructor TCliente.Create(ACodice, ADescrizione: String);
begin
  FCodice := ACodice;
  FDescrizione := ADescrizione;
end;

constructor TCliente.Create;
begin

end;

destructor TCliente.Destroy;
begin

  inherited;
end;

function TCliente.GetAssoggettamentoFiscale: string;
begin
  Result := FAssoggettamentoFiscale;
end;

function TCliente.GetCap: string;
begin
  Result := FCap;
end;


function TCliente.GetCodicePagamento: string;
begin
  Result := FCodicePagamento;
end;

function TCliente.GetCodiceSconto: string;
begin
  Result := FCodiceSconto;
end;

function TCliente.GetEstensioneRagioneSociale: string;
begin
  Result := FEstensioneRagioneSociale;
end;

function TCliente.GetIndirizzo: string;
begin
  Result := FIndirizzo;
end;

function TCliente.GetItemDetail: String;
begin
  Result := FCodice + ' ' + FDescrizione;
end;

function TCliente.GetItemHeaderText: String;
begin
  Result := FCodice;
end;

function TCliente.GetItemText: String;
begin
  Result := FDescrizione;
end;

function TCliente.GetListino: string;
begin
  Result := FListino;
end;

function TCliente.GetLocalita: string;
begin
  Result := FLocalita;
end;

function TCliente.GetMicroViewClassName: String;
begin
  Result := 'Cliente';
end;

function TCliente.GetNazione: string;
begin
  Result := FNazione;
end;

function TCliente.GetPartitaIva: string;
begin
  Result := FPartitaIva;
end;

function TCliente.GetProvincia: string;
begin
  Result := FProvincia;
end;

function TCliente.GetSconto1: currency;
begin
  Result := FSconto1;
end;

function TCliente.GetSconto2: currency;
begin
  Result := FSconto2;
end;

function TCliente.GetSconto3: currency;
begin
  Result := FSconto3;
end;

function TCliente.GetStrutturaScontiRiga: string;
begin
  Result := FStrutturaScontiRiga;
end;

function TCliente.GetStrutturaScontiTestata: string;
begin
  Result := FStrutturaScontiTestata;
end;

function TCliente.GetTelefono: string;
begin
  Result := FTelefono;
end;

function TCliente.GetTipoDocumento: string;
begin
  Result := FTipoDocumento;
end;

procedure TCliente.SetAssoggettamentoFiscale(const AValue: string);
begin
  FAssoggettamentoFiscale := AValue;
end;

procedure TCliente.SetCap(const AValue: string);
begin
  FCap := AValue;
end;

procedure TCliente.SetCodicePagamento(const AValue: string);
begin
  FCodicePagamento := AValue;
end;

procedure TCliente.SetCodiceSconto(const AValue: string);
begin
  FCodiceSconto := AValue;
end;

procedure TCliente.SetEstensioneRagioneSociale(const AValue: string);
begin
  FEstensioneRagioneSociale := AValue;
end;

procedure TCliente.SetIndirizzo(const AValue: string);
begin
  FIndirizzo := AValue;
end;

procedure TCliente.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TCliente.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TCliente.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TCliente.SetListino(const AValue: string);
begin
  FListino := AValue;
end;

procedure TCliente.SetLocalita(const AValue: string);
begin
  FLocalita := AValue;
end;

procedure TCliente.SetNazione(const AValue: string);
begin
  FNazione := AValue;
end;

procedure TCliente.SetPartitaIva(const AValue: string);
begin
  FPartitaIva := AValue;
end;

procedure TCliente.SetProvincia(const AValue: string);
begin
  FProvincia := AValue;
end;

procedure TCliente.SetSconto1(const AValue: currency);
begin
  FSconto1 := AValue;
end;

procedure TCliente.SetSconto2(const AValue: currency);
begin
  FSconto2 := AValue;
end;

procedure TCliente.SetSconto3(const AValue: currency);
begin
  FSconto3 := AValue;
end;

procedure TCliente.SetStrutturaScontiRiga(const AValue: string);
begin
  FStrutturaScontiRiga := AValue;
end;

procedure TCliente.SetStrutturaScontiTestata(const AValue: string);
begin
  FStrutturaScontiTestata := AValue;
end;

procedure TCliente.SetTelefono(const AValue: string);
begin
  FTelefono := AValue;
end;

procedure TCliente.SetTipoDocumento(const AValue: string);
begin
  FTipoDocumento := AValue;
end;

//function TScalarinoTaglia.GetID: Integer;
//begin
//  Result := FID;
//end;
//
//function TScalarinoTaglia.GetQuantitaTotale: integer;
//begin
//  Result := FTaglia1 + FTaglia2 + FTaglia3 + FTaglia4 + FTaglia5 + FTaglia6 +
//            FTaglia7 + FTaglia8 + FTaglia9 + FTaglia10 + FTaglia11 + FTaglia12 +
//            FTaglia13 + FTaglia14 + FTaglia15 + FTaglia16 + FTaglia17 + FTaglia18 +
//            FTaglia19 + FTaglia20 + FTaglia21 + FTaglia22 + FTaglia23 + FTaglia24;
//end;
//
//function TScalarinoTaglia.GetRigaID: Integer;
//begin
//  Result := FRigaID;
//end;
//
//function TScalarinoTaglia.GetTaglia1: integer;
//begin
//  Result := FTaglia1;
//end;
//
//procedure TScalarinoTaglia.SetTaglia1(const AValue: integer);
//begin
//  FTaglia1 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia2: integer;
//begin
//  Result := FTaglia2;
//end;
//
//procedure TScalarinoTaglia.SetTaglia2(const AValue: integer);
//begin
//  FTaglia2 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia3: integer;
//begin
//  Result := FTaglia3;
//end;
//
//procedure TScalarinoTaglia.SetTaglia3(const AValue: integer);
//begin
//  FTaglia3 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia4: integer;
//begin
//  Result := FTaglia4;
//end;
//
//procedure TScalarinoTaglia.SetTaglia4(const AValue: integer);
//begin
//  FTaglia4 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia5: integer;
//begin
//  Result := FTaglia5;
//end;
//
//procedure TScalarinoTaglia.SetTaglia5(const AValue: integer);
//begin
//  FTaglia5 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia6: integer;
//begin
//  Result := FTaglia6;
//end;
//
//procedure TScalarinoTaglia.SetTaglia6(const AValue: integer);
//begin
//  FTaglia6 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia7: integer;
//begin
//  Result := FTaglia7;
//end;
//
//procedure TScalarinoTaglia.SetTaglia7(const AValue: integer);
//begin
//  FTaglia7 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia8: integer;
//begin
//  Result := FTaglia8;
//end;
//
//procedure TScalarinoTaglia.SetTaglia8(const AValue: integer);
//begin
//  FTaglia8 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia9: integer;
//begin
//  Result := FTaglia9;
//end;
//
//procedure TScalarinoTaglia.SetTaglia9(const AValue: integer);
//begin
//  FTaglia9 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia10: integer;
//begin
//  Result := FTaglia10;
//end;
//
//procedure TScalarinoTaglia.SetTaglia10(const AValue: integer);
//begin
//  FTaglia10 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia11: integer;
//begin
//  Result := FTaglia11;
//end;
//
//procedure TScalarinoTaglia.SetTaglia11(const AValue: integer);
//begin
//  FTaglia11 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia12: integer;
//begin
//  Result := FTaglia12;
//end;
//
//procedure TScalarinoTaglia.SetTaglia12(const AValue: integer);
//begin
//  FTaglia12 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia13: integer;
//begin
//  Result := FTaglia13;
//end;
//
//procedure TScalarinoTaglia.SetTaglia13(const AValue: integer);
//begin
//  FTaglia13 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia14: integer;
//begin
//  Result := FTaglia14;
//end;
//
//procedure TScalarinoTaglia.SetTaglia14(const AValue: integer);
//begin
//  FTaglia14 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia15: integer;
//begin
//  Result := FTaglia15;
//end;
//
//procedure TScalarinoTaglia.SetTaglia15(const AValue: integer);
//begin
//  FTaglia15 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia16: integer;
//begin
//  Result := FTaglia16;
//end;
//
//procedure TScalarinoTaglia.SetTaglia16(const AValue: integer);
//begin
//  FTaglia16 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia17: integer;
//begin
//  Result := FTaglia17;
//end;
//
//procedure TScalarinoTaglia.SetTaglia17(const AValue: integer);
//begin
//  FTaglia17 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia18: integer;
//begin
//  Result := FTaglia18;
//end;
//
//procedure TScalarinoTaglia.SetTaglia18(const AValue: integer);
//begin
//  FTaglia18 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia19: integer;
//begin
//  Result := FTaglia19;
//end;
//
//procedure TScalarinoTaglia.SetTaglia19(const AValue: integer);
//begin
//  FTaglia19 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia20: integer;
//begin
//  Result := FTaglia20;
//end;
//
//procedure TScalarinoTaglia.SetTaglia20(const AValue: integer);
//begin
//  FTaglia20 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia21: integer;
//begin
//  Result := FTaglia21;
//end;
//
//procedure TScalarinoTaglia.SetTaglia21(const AValue: integer);
//begin
//  FTaglia21 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia22: integer;
//begin
//  Result := FTaglia22;
//end;
//
//procedure TScalarinoTaglia.SetTaglia22(const AValue: integer);
//begin
//  FTaglia22 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia23: integer;
//begin
//  Result := FTaglia23;
//end;
//
//procedure TScalarinoTaglia.SetTaglia23(const AValue: integer);
//begin
//  FTaglia23 := AValue;
//end;
//
//function TScalarinoTaglia.GetTaglia24: integer;
//begin
//  Result := FTaglia24;
//end;
//
//procedure TScalarinoTaglia.SetTaglia24(const AValue: integer);
//begin
//  FTaglia24 := AValue;
//end;
//
//procedure TScalarinoTaglia.SetID(const AValue: Integer);
//begin
//  FID := AValue;
//end;
//
//procedure TScalarinoTaglia.SetRigaID(const AValue: Integer);
//begin
//  FRigaID := AValue;
//end;

{ TRigaOrdine }

constructor TRigaOrdine.Create;
begin
  FAliquotaIVA := TAliquotaIva.Create;
  FArticolo := TArticolo.Create;
  FCodiceSconto := TCodiceSconto.Create;
//  FQuantita := TScalarinoTaglia.Create;
  FRipartizioneTaglia := TRipartizioneTaglia.Create;
end;

function TRigaOrdine.GetAliquotaIva: IAliquotaIva;
begin
  Result := FAliquotaIva;
end;

function TRigaOrdine.GetAliquotaIvaCodiceDecodifica: String;
begin
  if Assigned(FAliquotaIva) then
    Result := FAliquotaIva.Codice
  else
    Result := '';
end;

function TRigaOrdine.GetAliquotaIvaDecrizioneDecodifica: String;
begin
  if Assigned(FAliquotaIva) then
    Result := FAliquotaIva.Descrizione
  else
    Result := '';
end;

function TRigaOrdine.GetArticolo: IArticolo;
begin
  Result := FArticolo;
end;

function TRigaOrdine.GetArticoloCodiceDecodifica: string;
begin
  if Assigned(FArticolo) then
    Result := FArticolo.Codice
  else
    Result := '';
end;

function TRigaOrdine.GetArticoloDescrizioneDecodifica: string;
begin
  if Assigned(FArticolo) then
    Result := FArticolo.Descrizione
  else
    Result := '';
end;

function TRigaOrdine.GetCodiceRipartizione: String;
begin
  if Assigned(FRipartizioneTaglia) then
  begin
    if (not (FRipartizioneTaglia.CodiceRipartizione.IsEmpty) and
        not (FRipartizioneTaglia.TipoRipartizione.IsEmpty)) then
      Result := FRipartizioneTaglia.CodiceRipartizione + '/' + FRipartizioneTaglia.TipoRipartizione
    else
      Result := '';
  end
  else
    Result := '';
end;

function TRigaOrdine.GetCodiceSconto: ICodiceSconto;
begin
  Result := FCodiceSconto;
end;

function TRigaOrdine.GetCodiceScontoDecodifica: String;
begin
  if Assigned(FCodiceSconto) then
    Result := FCodiceSconto.Codice
  else
    Result := '';
end;

function TRigaOrdine.GetCodiceScontoDescrizioneDecodifica: String;
begin
  if Assigned(FCodiceSconto) then
    Result := FCodiceSconto.Descrizione
  else
    Result := '';
end;

function TRigaOrdine.GetDataConsegna: TDateTime;
begin
  Result := FDataConsegna;
end;

function TRigaOrdine.GetID: Integer;
begin
  Result := FID;
end;

function TRigaOrdine.GetTestataID: Integer;
begin
  Result := FTestataID;
end;

function TRigaOrdine.GetImportoTotale: Currency;
begin
 Result := FImportoTotale;
end;

function TRigaOrdine.GetImportoUnitario: Currency;
begin
  Result := FImportoUnitario;
end;

function TRigaOrdine.GetItemDetail: String;
begin
  if Assigned(FArticolo) then
    Result := Format('Qta:%d Imp.Unit.%m Imp.Tot.%m',[GetQuantitaTotale,FImportoUnitario,FImportoTotale])
  else
    Result := '';
end;

function TRigaOrdine.GetItemHeaderText: String;
begin
  if Assigned(FArticolo) then
    Result := Format('Riga:%d Articolo:%s',[FNumeroRiga, FArticolo.Codice])
  else
    Result := '';
end;

function TRigaOrdine.GetItemText: String;
begin
  if Assigned(FArticolo) then
    Result := Format('Descrizione:%s',[FArticolo.Descrizione])
  else
    Result := '';
end;

function TRigaOrdine.GetMerceInCV: Boolean;
begin
  Result := FMerceInCV;
end;

function TRigaOrdine.GetNote: string;
begin
  Result := FNote;
end;

function TRigaOrdine.GetNumeroRiga: Integer;
begin
  Result := FNumeroRiga;
end;

//function TRigaOrdine.GetQuantita: IScalarinoTaglia;
//begin
//  Result := FQuantita;
//end;

function TRigaOrdine.GetQuantitaTaglia1: integer;
begin
  Result := FQuantitaTaglia1;
end;

function TRigaOrdine.GetQuantitaTaglia10: integer;
begin
  Result := FQuantitaTaglia10;
end;

function TRigaOrdine.GetQuantitaTaglia11: integer;
begin
  Result := FQuantitaTaglia11;
end;

function TRigaOrdine.GetQuantitaTaglia12: integer;
begin
  Result := FQuantitaTaglia12;
end;

function TRigaOrdine.GetQuantitaTaglia13: integer;
begin
  Result := FQuantitaTaglia13;
end;

function TRigaOrdine.GetQuantitaTaglia14: integer;
begin
  Result := FQuantitaTaglia14;
end;

function TRigaOrdine.GetQuantitaTaglia15: integer;
begin
  Result := FQuantitaTaglia15;
end;

function TRigaOrdine.GetQuantitaTaglia16: integer;
begin
  Result := FQuantitaTaglia16;
end;

function TRigaOrdine.GetQuantitaTaglia17: integer;
begin
  Result := FQuantitaTaglia17;
end;

function TRigaOrdine.GetQuantitaTaglia18: integer;
begin
  Result := FQuantitaTaglia18;
end;

function TRigaOrdine.GetQuantitaTaglia19: integer;
begin
  Result := FQuantitaTaglia19;
end;

function TRigaOrdine.GetQuantitaTaglia2: integer;
begin
  Result := FQuantitaTaglia2;
end;

function TRigaOrdine.GetQuantitaTaglia20: integer;
begin
  Result := FQuantitaTaglia20;
end;

function TRigaOrdine.GetQuantitaTaglia21: integer;
begin
  Result := FQuantitaTaglia21;
end;

function TRigaOrdine.GetQuantitaTaglia22: integer;
begin
  Result := FQuantitaTaglia22;
end;

function TRigaOrdine.GetQuantitaTaglia23: integer;
begin
  Result := FQuantitaTaglia23;
end;

function TRigaOrdine.GetQuantitaTaglia24: integer;
begin
  Result := FQuantitaTaglia24;
end;

function TRigaOrdine.GetQuantitaTaglia3: integer;
begin
  Result := FQuantitaTaglia3;
end;

function TRigaOrdine.GetQuantitaTaglia4: integer;
begin
  Result := FQuantitaTaglia4;
end;

function TRigaOrdine.GetQuantitaTaglia5: integer;
begin
  Result := FQuantitaTaglia5;
end;

function TRigaOrdine.GetQuantitaTaglia6: integer;
begin
  Result := FQuantitaTaglia6;
end;

function TRigaOrdine.GetQuantitaTaglia7: integer;
begin
  Result := FQuantitaTaglia7;
end;

function TRigaOrdine.GetQuantitaTaglia8: integer;
begin
  Result := FQuantitaTaglia8;
end;

function TRigaOrdine.GetQuantitaTaglia9: integer;
begin
  Result := FQuantitaTaglia9;
end;

function TRigaOrdine.GetQuantitaTotale: Integer;
begin
  Result := FQuantitaTaglia1+FQuantitaTaglia2+FQuantitaTaglia3+FQuantitaTaglia4+
            FQuantitaTaglia5+FQuantitaTaglia6+FQuantitaTaglia7+FQuantitaTaglia8+
            FQuantitaTaglia9+FQuantitaTaglia10+FQuantitaTaglia11+FQuantitaTaglia12+
            FQuantitaTaglia13+FQuantitaTaglia14+FQuantitaTaglia15+FQuantitaTaglia16+
            FQuantitaTaglia17+FQuantitaTaglia18+FQuantitaTaglia19+FQuantitaTaglia20+
            FQuantitaTaglia21+FQuantitaTaglia22+FQuantitaTaglia23+FQuantitaTaglia24;
end;

function TRigaOrdine.GetRiferimentiLiberi: string;
begin
  Result := FRiferimentiLiberi;
end;

function TRigaOrdine.GetRipartizioneTaglia: IRipartizioneTaglia;
begin
  Result := FRipartizioneTaglia;
end;

function TRigaOrdine.GetSconto1: Currency;
begin
  Result := FSconto1;
end;

function TRigaOrdine.GetSconto2: Currency;
begin
  Result := FSconto2;
end;

function TRigaOrdine.GetSconto3: Currency;
begin
  Result := FSconto3;
end;

function TRigaOrdine.GetScontoTestata: Boolean;
begin
  Result := FScontoTestata;
end;

procedure TRigaOrdine.SetAliquotaIva(const Value: IAliquotaIva);
begin
  FAliquotaIva := Value;
end;

procedure TRigaOrdine.SetAliquotaIvaCodiceDecodifica(const Value: String);
begin
  FAliquotaIvaCodiceDecodifica := Value;
end;

procedure TRigaOrdine.SetAliquotaIvaDecrizioneDecodifica(const Value: String);
begin
  FAliquotaIvaDecrizioneDecodifica := Value;
end;

procedure TRigaOrdine.SetArticolo(const Value: IArticolo);
begin
  FArticolo := Value;
end;

procedure TRigaOrdine.SetArticoloCodiceDecodifica(const Value: string);
begin
  FArticoloCodiceDecodifica := Value;
end;

procedure TRigaOrdine.SetArticoloDescrizioneDecodifica(
  const Value: string);
begin
  FArticoloDescrizioneDecodifica := Value;
end;

procedure TRigaOrdine.SetCodiceRipartizione(const Value: String);
begin
  FCodiceRipartizione := Value;
end;

procedure TRigaOrdine.SetCodiceSconto(const Value: ICodiceSconto);
begin
  FCodiceSconto := Value;
end;

procedure TRigaOrdine.SetCodiceScontoDecodifica(const Value: String);
begin
  FCodiceScontoDecodifica := Value;
end;

procedure TRigaOrdine.SetCodiceScontoDescrizioneDecodifica(const Value: String);
begin
  FCodiceScontoDescrizioneDecodifica := Value;
end;

procedure TRigaOrdine.SetDataConsegna(const Value: TDateTime);
begin
  FDataConsegna := Value;
end;

procedure TRigaOrdine.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TRigaOrdine.SetTestataID(const Value: Integer);
begin
  FTestataID := Value;
end;

procedure TRigaOrdine.SetImportoTotale(const Value: Currency);
begin
  FImportoTotale := Value;
end;

procedure TRigaOrdine.SetImportoUnitario(const Value: Currency);
begin
  FImportoUnitario := Value;
end;

procedure TRigaOrdine.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TRigaOrdine.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TRigaOrdine.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TRigaOrdine.SetMerceInCV(const Value: Boolean);
begin
  FMerceInCV := Value;
end;

procedure TRigaOrdine.SetNote(const Value: string);
begin
  FNote := Value;
end;

procedure TRigaOrdine.SetNumeroRiga(const Value: Integer);
begin
  FNumeroRiga := Value;
end;

//procedure TRigaOrdine.SetQuantita(const Value: IScalarinoTaglia);
//begin
//  FQuantita := Value;
//end;

procedure TRigaOrdine.SetQuantitaTaglia1(const Value: integer);
begin
  FQuantitaTaglia1 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia10(const Value: integer);
begin
  FQuantitaTaglia10 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia11(const Value: integer);
begin
  FQuantitaTaglia11 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia12(const Value: integer);
begin
  FQuantitaTaglia12 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia13(const Value: integer);
begin
  FQuantitaTaglia13 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia14(const Value: integer);
begin
  FQuantitaTaglia14 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia15(const Value: integer);
begin
  FQuantitaTaglia15 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia16(const Value: integer);
begin
  FQuantitaTaglia16 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia17(const Value: integer);
begin
  FQuantitaTaglia17 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia18(const Value: integer);
begin
  FQuantitaTaglia18 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia19(const Value: integer);
begin
  FQuantitaTaglia19 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia2(const Value: integer);
begin
  FQuantitaTaglia2 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia20(const Value: integer);
begin
  FQuantitaTaglia20 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia21(const Value: integer);
begin
  FQuantitaTaglia21 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia22(const Value: integer);
begin
  FQuantitaTaglia22 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia23(const Value: integer);
begin
  FQuantitaTaglia23 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia24(const Value: integer);
begin
  FQuantitaTaglia24 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia3(const Value: integer);
begin
  FQuantitaTaglia3 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia4(const Value: integer);
begin
  FQuantitaTaglia4 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia5(const Value: integer);
begin
  FQuantitaTaglia5 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia6(const Value: integer);
begin
  FQuantitaTaglia6 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia7(const Value: integer);
begin
  FQuantitaTaglia7 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia8(const Value: integer);
begin
  FQuantitaTaglia8 := Value;
end;

procedure TRigaOrdine.SetQuantitaTaglia9(const Value: integer);
begin
  FQuantitaTaglia9 := Value;
end;

procedure TRigaOrdine.SetQuantitaTotale(const Value: Integer);
begin
  FQuantitaTotale := Value;
end;

procedure TRigaOrdine.SetRiferimentiLiberi(const Value: string);
begin
  FRiferimentiLiberi := Value;
end;

procedure TRigaOrdine.SetRipartizioneTaglia(const Value: IRipartizioneTaglia);
begin
  FRipartizioneTaglia := Value;
end;

procedure TRigaOrdine.SetSconto1(const Value: Currency);
begin
  FSconto1 := Value;
end;

procedure TRigaOrdine.SetSconto2(const Value: Currency);
begin
  FSconto2 := Value;
end;

procedure TRigaOrdine.SetSconto3(const Value: Currency);
begin
  FSconto3 := Value;
end;

procedure TRigaOrdine.SetScontoTestata(const Value: Boolean);
begin
  FScontoTestata := Value;
end;

{ TTestataOrdine }

function TTestataOrdine.GetCambio: Currency;
begin
  Result := FCambio;
end;

function TTestataOrdine.GetClasse: IClasseOrdine;
begin
  Result := FClasse;
end;

function TTestataOrdine.GetClasseOrdineCodiceDecodifica: String;
begin
  if Assigned(FClasse) then
    Result := FClasse.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetClasseOrdineDescrizioneDecodifica: String;
begin
  if Assigned(FClasse) then
    Result := FClasse.Descrizione
  else
    Result := '';
end;

function TTestataOrdine.GetCliente: ICliente;
begin
  Result := FCliente;
end;

function TTestataOrdine.GetClienteCodiceDecodifica: String;
begin
  if Assigned(FCliente) then
    Result := FCliente.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetCodiceSconto: ICodiceSconto;
begin
  Result := FCodiceSconto;
end;

function TTestataOrdine.GetDataConsegna: TDateTime;
begin
  Result := FDataConsegna;
end;

function TTestataOrdine.GetDataOrdine: TDateTime;
begin
  Result := FDataOrdine;
end;

function TTestataOrdine.GetDataRiferimento: TDateTime;
begin
  Result := FDataRiferimento;
end;

function TTestataOrdine.GetID: Integer;
begin
  Result := FID;
end;

function TTestataOrdine.GetListino: ITipoListino;
begin
  Result := FListino;
end;

function TTestataOrdine.GetListinoCodiceDecodifica: String;
begin
  if Assigned(FListino) then
    Result := FListino.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetListinoDescrizioneDecodifica: String;
begin
  if Assigned(FListino) then
    Result := FListino.Descrizione
  else
    Result := '';
end;

function TTestataOrdine.GetMagazzino: IMagazzino;
begin
  Result := FMagazzino;
end;

function TTestataOrdine.GetMagazzinoCodiceDecodifica: String;
begin
  if Assigned(FMagazzino) then
    Result := FMagazzino.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetMagazzinoDescrizioneDecodifica: String;
begin
  if Assigned(FMagazzino) then
    Result := FMagazzino.Descrizione
  else
    Result := '';
end;

function TTestataOrdine.GetRiferimento: String;
begin
  Result := FRiferimento;
end;

function TTestataOrdine.GetRighe: TList<IRigaOrdine>;
begin
  Result := FRighe;
end;

function TTestataOrdine.GetSconto1: Currency;
begin
  Result := FSconto1;
end;

function TTestataOrdine.GetSconto2: Currency;
begin
  Result := FSconto2;
end;

function TTestataOrdine.GetSconto3: Currency;
begin
  Result := FSconto3;
end;

function TTestataOrdine.GetScontoCodiceDecodifica: String;
begin
  if Assigned(FCodiceSconto) then
    Result := FCodiceSconto.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetScontoDescrizioneDecodifica: String;
begin
  if Assigned(FCodiceSconto) then
    Result := FCodiceSconto.Descrizione
  else
    Result := '';
end;

function TTestataOrdine.GetStagione: IStagione;
begin
  Result := FStagione;
end;

function TTestataOrdine.GetStagioneCodiceDecodifica: String;
begin
  if Assigned(FStagione) then
    Result := FStagione.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetStagioneDescrizioneDecodifica: String;
begin
  if Assigned(FStagione) then
    Result := FStagione.Descrizione
  else
    Result := '';
end;

function TTestataOrdine.GetStatoSincronizzazione: TStatoSincronizzazione;
begin
  Result := FStatoSincronizzazione;
end;

function TTestataOrdine.GetTipoDocumento: ITipoDocumento;
begin
  Result := FTipoDocumento;
end;

function TTestataOrdine.GetTipoDocumentoCodiceDecodifica: String;
begin
  if Assigned(FTipoDocumento) then
    Result := FTipoDocumento.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetTipoDocumentoDescrizioneDecodifica: String;
begin
  if Assigned(FTipoDocumento) then
    Result := FTipoDocumento.Descrizione
  else
    Result := '';
end;

function TTestataOrdine.GetTipoOperatore: String;
begin
  Result := FTipoOperatore;
end;

function TTestataOrdine.GetTipoPagamento: ITipoPagamento;
begin
  Result := FTipoPagamento;
end;

function TTestataOrdine.GetTipoPagamentoCodiceDecodifica: String;
begin
  if Assigned(FTipoPagamento) then
    Result := FTipoPagamento.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetTipoPagamentoDescrizioneDecodifica: String;
begin
  if Assigned(FTipoPagamento) then
    Result := FTipoPagamento.Descrizione
  else
    Result := '';
end;

function TTestataOrdine.GetValuta: IValuta;
begin
  Result := FValuta;
end;

function TTestataOrdine.GetValutaCodiceDecodifica: String;
begin
  if Assigned(FValuta) then
    Result := FValuta.Codice
  else
    Result := '';
end;

function TTestataOrdine.GetNumeroOrdine: String;
begin
  Result := FNumeroOrdine;
end;


function TTestataOrdine.GetClienteDescrizioneDecodifica: String;
begin
  if Assigned(FCliente) then
    Result := FCliente.Descrizione
  else
    Result := '';
end;
//
//function TTestataOrdine.GetMagazzinoDecodifica: String;
//begin
//  if Assigned(FMagazzino) then
//    Result := FMagazzino.Descrizione
//  else
//    Result := '';
//end;

constructor TTestataOrdine.Create;
begin
  FCliente := TCliente.Create;
  FClasse := TClasseOrdine.Create;
  FCodiceSconto := TCodiceSconto.Create;
  FListino := TTipoListino.Create;
  FMagazzino := TMagazzino.Create;
  FTipoDocumento := TTipoDocumento.Create;
  FTipoPagamento := TTipoPagamento.Create;
  FStagione := TStagione.Create;
  //FRighe :=  TioList<IRigaOrdine>.Create;
  FRighe :=  TList<IRigaOrdine>.Create;
  inherited;
end;

function TTestataOrdine.DecodificaStato(const Value: TStatoSincronizzazione): string;
begin
  if Value=TStatoSincronizzazione.siIntrodotto then
  begin
    Result := 'Introdotto';
  end
  else if Value=TStatoSincronizzazione.siConfermato then
  begin
    Result := 'Confermato';
  end
  else if Value=TStatoSincronizzazione.siTrasmesso then
  begin
    Result := 'Trasmesso';
  end;
end;

function TTestataOrdine.GetImportoTotale: Currency;
var
  LRiga: IRigaOrdine;
begin
  Result := FImportoTotale;
end;

function TTestataOrdine.GetItemDetail: String;
begin
  Result := Format('Quantità Totali:%d Importo Totale:%m',[FQuantitaTotale,FImportoTotale]);
end;

function TTestataOrdine.GetItemHeaderText: String;
begin
  if Assigned(FCliente) then
    Result := Format('Cliente %s - %s',[FCliente.Codice,FCliente.Descrizione])
  else
    Result := '';
end;

function TTestataOrdine.GetItemText: String;
begin
  if Assigned(FMagazzino) then
    Result := ''
  else
    Result := '';
end;

function TTestataOrdine.GetQuantitaTotale: Integer;
begin
  Result := FQuantitaTotale;
end;

function TTestataOrdine.GetUtenteInserimento: String;
begin
  Result := FUtenteInserimento;
end;

function TTestataOrdine.GetUtenteUltimaModifica: String;
begin
  Result := FUtenteUltimaModifica;
end;

procedure TTestataOrdine.SetCambio(const Value: Currency);
begin
  FCambio := Value;
end;

procedure TTestataOrdine.SetClasse(const Value: IClasseOrdine);
begin
  FClasse := Value;
end;

procedure TTestataOrdine.SetClasseOrdineCodiceDecodifica(const Value: string);
begin
  FClasseOrdineCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetClasseOrdineDescrizioneDecodifica(
  const Value: string);
begin
  FClasseOrdineDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetCliente(const Value: ICliente);
begin
  FCliente := Value;
end;

procedure TTestataOrdine.SetClienteCodiceDecodifica(const Value: string);
begin
  FClienteCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetClienteDescrizioneDecodifica(const Value: string);
begin
  FClienteDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetCodiceSconto(const Value: ICodiceSconto);
begin
  FCodiceSconto := Value;
end;

procedure TTestataOrdine.SetDataConsegna(const Value: TDateTime);
begin
  FDataConsegna := Value;
end;

procedure TTestataOrdine.SetDataOrdine(const Value: TDateTime);
begin
  FDataOrdine := Value;
end;

procedure TTestataOrdine.SetDataRiferimento(const Value: TDateTime);
begin
  FDataRiferimento := Value;
end;

procedure TTestataOrdine.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TTestataOrdine.SetListino(const Value: ITipoListino);
begin
  FListino := Value;
end;

procedure TTestataOrdine.SetListinoCodiceDecodifica(const Value: string);
begin
  FListinoCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetListinoDescrizioneDecodifica(const Value: string);
begin
  FListinoDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetMagazzino(const Value: IMagazzino);
begin
  FMagazzino := Value;
end;

procedure TTestataOrdine.SetMagazzinoCodiceDecodifica(const Value: string);
begin
  FMagazzinoCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetMagazzinoDescrizioneDecodifica(const Value: string);
begin
  FMagazzinoDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetRiferimento(const Value: String);
begin
  FRiferimento := Value;
end;

procedure TTestataOrdine.SetRighe(const Value: TList<IRigaOrdine>);
begin
  FRighe := Value;
end;

procedure TTestataOrdine.SetSconto1(const Value: Currency);
begin
  FSconto1 := Value;
end;

procedure TTestataOrdine.SetSconto2(const Value: Currency);
begin
  FSconto2 := Value;
end;

procedure TTestataOrdine.SetSconto3(const Value: Currency);
begin
  FSconto3 := Value;
end;

procedure TTestataOrdine.SetScontoCodiceDecodifica(const Value: string);
begin
  FScontoCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetScontoDescrizioneDecodifica(const Value: string);
begin
  FScontoDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetStagione(const Value: IStagione);
begin
  FStagione := Value;
end;

procedure TTestataOrdine.SetStagioneCodiceDecodifica(const Value: string);
begin
  FStagioneCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetStagioneDescrizioneDecodifica(const Value: string);
begin
  FStagioneDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetStatoSincronizzazione(
  const Value: TStatoSincronizzazione);
begin
  FStatoSincronizzazione := Value;
end;

procedure TTestataOrdine.SetTipoDocumento(const Value: ITipoDocumento);
begin
  FTipoDocumento := Value;
end;

procedure TTestataOrdine.SetTipoDocumentoCodiceDecodifica(const Value: string);
begin
  FTipoDocumentoCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetTipoDocumentoDescrizioneDecodifica(
  const Value: string);
begin
  FTipoDocumentoDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetTipoOperatore(const Value: String);
begin
  FTipoOperatore := Value;
end;

procedure TTestataOrdine.SetTipoPagamento(const Value: ITipoPagamento);
begin
  FTipoPagamento := Value;
end;

procedure TTestataOrdine.SetTipoPagamentoCodiceDecodifica(const Value: string);
begin
  FTipoPagamentoCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetTipoPagamentoDescrizioneDecodifica(
  const Value: string);
begin
  FTipoPagamentoDescrizioneDecodifica := Value;
end;

procedure TTestataOrdine.SetValuta(const Value: IValuta);
begin
  FValuta := Value;
end;

procedure TTestataOrdine.SetValutaCodiceDecodifica(const Value: string);
begin
  FValutaCodiceDecodifica := Value;
end;

procedure TTestataOrdine.SetNumeroOrdine(const Value: String);
begin
  FNumeroOrdine := Value;
end;

procedure TTestataOrdine.SetUtenteUltimaModifica(const Value: String);
begin
  FUtenteUltimaModifica := Value;
end;

procedure TTestataOrdine.SetUtenteInserimento(const Value: String);
begin
  FUtenteInserimento := Value;
end;

procedure TTestataOrdine.SetImportoTotale(const Value: Currency);
begin
  FImportoTotale := Value;
end;

procedure TTestataOrdine.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TTestataOrdine.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TTestataOrdine.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TTestataOrdine.SetQuantitaTotale(const Value: Integer);
begin
  FQuantitaTotale := Value;
end;

function TTestataOrdine.GetStatoSincronizzazioneDecodifica: String;
begin
  Result := Self.DecodificaStato(FStatoSincronizzazione);
end;

{ TNumeratore }

function TNumeratore.GetChiave: string;
begin
  Result := FChiave;
end;

function TNumeratore.GetNumero: integer;
begin
  Result := FNumero;
end;

function TNumeratore.GetID: integer;
begin
  Result := FID;
end;

procedure TNumeratore.SetChiave(const Value: string);
begin
  FChiave := Value;
end;

procedure TNumeratore.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

procedure TNumeratore.SetID(const Value: integer);
begin
  FID := Value;
end;

{ TVersione }

procedure TVersione.CaricaVersione;
var
  LVersione: TVersione;
begin
//  LVersione := '';
//  try
//    FNumero := LVersione.Numero;
//    FDataRilascio := LVersione.DataRilascio;
//  finally
//    LVersione.Free;
//  end;
end;

function TVersione.GetDataRilascio: TDateTime;
begin
  Result := FDataRilascio;
end;

function TVersione.GetNumero: integer;
begin
  Result := FNumero;
end;

class function TVersione.NuovaIstanza: TVersione;
begin
  if not Assigned(FIstanza) then
  begin
    FIstanza := TVersione.Create;
    FIstanza.CaricaVersione;
  end;
  Result := FIstanza
end;

function TVersione.GetID: integer;
begin
  Result := FID;
end;

procedure TVersione.SetDataRilascio(const Value: TDateTime);
begin
  FDataRilascio := Value;
end;

procedure TVersione.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

procedure TVersione.SetID(const Value: integer);
begin
  FID := Value;
end;

{ TGlobalKeyboard }

function TGlobalKeyboard.GetKeyBoardVisible: Boolean;
begin
  Result := FKeyBoardVisible;
end;

procedure TGlobalKeyboard.SetKeyBoardVisible(const Value: Boolean);
begin
  FKeyBoardVisible := Value;
end;

{ TScontoClienteRiga }

function TScontoClienteRiga.GetCodiceCliente: string;
begin
  Result := FCodiceCliente;
end;

function TScontoClienteRiga.GetCodiceSconto: string;
begin
  Result := FCodiceSconto;
end;

function TScontoClienteRiga.GetCodiceStruttura1: string;
begin
  Result := FCodiceStruttura1;
end;

function TScontoClienteRiga.GetCodiceStruttura2: string;
begin
  Result := FCodiceStruttura2;
end;

function TScontoClienteRiga.GetCodiceStruttura3: string;
begin
  Result := FCodiceStruttura3;
end;

function TScontoClienteRiga.GetCodiceStruttura4: string;
begin
  Result := FCodiceStruttura4;
end;

function TScontoClienteRiga.GetFlagContoVendita: string;
begin
  Result := FFlagContoVendita;
end;

function TScontoClienteRiga.GetFlagScontoTestata: string;
begin
  Result := FFlagScontoTestata;
end;

function TScontoClienteRiga.GetID: integer;
begin
  Result := FID;
end;

function TScontoClienteRiga.GetItemDetail: String;
begin
  Result := FItemDetail;
end;

function TScontoClienteRiga.GetItemHeaderText: String;
begin
  Result := FItemHeaderText;
end;

function TScontoClienteRiga.GetItemText: String;
begin
  Result := FItemText;
end;

function TScontoClienteRiga.GetPercSconto1: Currency;
begin
  Result := FPercSconto1;
end;

function TScontoClienteRiga.GetPercSconto2: Currency;
begin
  Result := FPercSconto2;
end;

function TScontoClienteRiga.GetPercSconto3: Currency;
begin
  Result := FPercSconto3;
end;

procedure TScontoClienteRiga.SetCodiceCliente(const AValue: string);
begin
  FCodiceCliente := AValue;
end;

procedure TScontoClienteRiga.SetCodiceSconto(const AValue: string);
begin
  FCodiceSconto := AValue;
end;

procedure TScontoClienteRiga.SetCodiceStruttura1(const AValue: string);
begin
  FCodiceStruttura1 := AValue;
end;

procedure TScontoClienteRiga.SetCodiceStruttura2(const AValue: string);
begin
  FCodiceStruttura2 := AValue;
end;

procedure TScontoClienteRiga.SetCodiceStruttura3(const AValue: string);
begin
  FCodiceStruttura3 := AValue;
end;

procedure TScontoClienteRiga.SetCodiceStruttura4(const AValue: string);
begin
  FCodiceStruttura4 := AValue;
end;

procedure TScontoClienteRiga.SetFlagContoVendita(const AValue: string);
begin
  FFlagContoVendita := AValue;
end;

procedure TScontoClienteRiga.SetFlagScontoTestata(const AValue: string);
begin
  FFlagScontoTestata := AValue;
end;

procedure TScontoClienteRiga.SetID(const AValue: integer);
begin
  FID := AValue;
end;

procedure TScontoClienteRiga.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TScontoClienteRiga.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TScontoClienteRiga.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TScontoClienteRiga.SetPercSconto1(const AValue: Currency);
begin
  FPercSconto1 := AValue;
end;

procedure TScontoClienteRiga.SetPercSconto2(const AValue: Currency);
begin
  FPercSconto2 := AValue;
end;

procedure TScontoClienteRiga.SetPercSconto3(const AValue: Currency);
begin
  FPercSconto3 := AValue;
end;

{ TScontoClienteTestata }

function TScontoClienteTestata.GetCodiceCliente: string;
begin
  Result := FCodiceCliente;
end;

function TScontoClienteTestata.GetCodicePagamento: string;
begin
  Result := FCodicePagamento;
end;

function TScontoClienteTestata.GetCodiceSconto: string;
begin
  Result := FCodiceSconto;
end;

function TScontoClienteTestata.GetCodiceStruttura1: string;
begin
  Result := FCodiceStruttura1;
end;

function TScontoClienteTestata.GetCodiceStruttura2: string;
begin
  Result := FCodiceStruttura2;
end;

function TScontoClienteTestata.GetCodiceStruttura3: string;
begin
  Result := FCodiceStruttura3;
end;

function TScontoClienteTestata.GetCodiceStruttura4: string;
begin
  Result := FCodiceStruttura4;
end;

function TScontoClienteTestata.GetID: integer;
begin
  Result := FID;
end;

function TScontoClienteTestata.GetItemDetail: String;
begin
  Result := FItemDetail;
end;

function TScontoClienteTestata.GetItemHeaderText: String;
begin
  Result := FItemHeaderText;
end;

function TScontoClienteTestata.GetItemText: String;
begin
  Result := FItemText;
end;

function TScontoClienteTestata.GetPercSconto1: Currency;
begin
  Result := FPercSconto1;
end;

function TScontoClienteTestata.GetPercSconto2: Currency;
begin
  Result := FPercSconto2;
end;

function TScontoClienteTestata.GetPercSconto3: Currency;
begin
  Result := FPercSconto3;
end;

procedure TScontoClienteTestata.SetCodiceCliente(const AValue: string);
begin
  FCodiceCliente := AValue;
end;

procedure TScontoClienteTestata.SetCodicePagamento(const AValue: string);
begin
  FCodicePagamento := AValue;
end;

procedure TScontoClienteTestata.SetCodiceSconto(const AValue: string);
begin
  FCodiceSconto := AValue;
end;

procedure TScontoClienteTestata.SetCodiceStruttura1(const AValue: string);
begin
  FCodiceStruttura1 := AValue;
end;

procedure TScontoClienteTestata.SetCodiceStruttura2(const AValue: string);
begin
  FCodiceStruttura2 := AValue;
end;

procedure TScontoClienteTestata.SetCodiceStruttura3(const AValue: string);
begin
  FCodiceStruttura3 := AValue;
end;

procedure TScontoClienteTestata.SetCodiceStruttura4(const AValue: string);
begin
  FCodiceStruttura4 := AValue;
end;

procedure TScontoClienteTestata.SetID(const AValue: integer);
begin
  FID := AValue;
end;

procedure TScontoClienteTestata.SetItemDetail(Value: string);
begin
  FItemDetail := Value;
end;

procedure TScontoClienteTestata.SetItemHeaderText(Value: string);
begin
  FItemHeaderText := Value;
end;

procedure TScontoClienteTestata.SetItemText(Value: string);
begin
  FItemText := Value;
end;

procedure TScontoClienteTestata.SetPercSconto1(const AValue: Currency);
begin
  FPercSconto1 := AValue;
end;

procedure TScontoClienteTestata.SetPercSconto2(const AValue: Currency);
begin
  FPercSconto2 := AValue;
end;

procedure TScontoClienteTestata.SetPercSconto3(const AValue: Currency);
begin
  FPercSconto3 := AValue;
end;

{ TGenericContainer<T> }

procedure TGenericContainer<T>.ClearItems;
begin
  FDict.Clear;
end;

constructor TGenericContainer<T>.Create;
begin
  FDict := TObjectDictionary<string,T>.Create;
end;

destructor TGenericContainer<T>.Destroy;
begin
  FDict.Free;
  inherited;
end;

function TGenericContainer<T>.GetItem(AKey: string): T;
begin
  FDict.TryGetValue(AKey, Result);
end;

procedure TGenericContainer<T>.SetItem(AKey: string; AValue: T);
begin
  FDict.Add(AKey, AValue);
end;

end.


