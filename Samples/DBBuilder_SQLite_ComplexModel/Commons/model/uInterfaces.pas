unit uInterfaces;

interface

uses
  System.Generics.Collections,
  iORM.Containers.Interfaces,
  VCL.Controls;

type
  TStatoSincronizzazione = (siIntrodotto,siConfermato,siTrasmesso);

  IGenericContainer<T> = interface
    ['{49CABA7F-2DD3-48A4-B060-64AEF4160D83}']
    function GetItem(AKey: string): T;
    procedure SetItem(AKey: string; AValue: T);
    procedure ClearItems;
  end;

  IControlMover = interface
    ['{54558FC8-EC76-4B51-896C-677EE8BBD029}']
    procedure SetFocused(const Value: TControl);
    property Focused: TControl write SetFocused;
  end;

  IGlobalKeyboard = interface
    ['{9550A5DE-F96E-4E23-9460-BBCA6209F73C}']
    procedure SetKeyBoardVisible(const Value: Boolean);
    function GetKeyBoardVisible: Boolean;
    property KeyBoardVisible: Boolean read GetKeyBoardVisible write SetKeyBoardVisible;
  end;

  IConfigurazione = Interface
    ['{A7705517-3124-4BB5-BCFF-660EAB81CEEC}']
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
    // Property
    property ID: Integer read GetID write SetID;
    property Postazione: String read GetPostazione write SetPostazione;
    property Azienda: String read GetAzienda write SetAzienda;
    property CodiceLicenza: String read GetCodiceLicenza write SetCodiceLicenza;
    property Classe:string read GetClasse write SetClasse;
    property Stagione:string read GetStagione write SetStagione;
    property Magazzino:string read GetMagazzino write SetMagazzino;
  End;


  IListableView = interface
    ['{38C4F5BF-8BA1-417E-A738-033170A384AC}']
    function GetItemText: String;
    function GetItemDetail: String;
    function GetItemHeaderText: String;
    procedure SetItemText(Value: string);
    procedure SetItemDetail(Value: string);
    procedure SetItemHeaderText(Value: string);
    property ItemText: String read GetItemText write SetItemText;
    property ItemDetail: String read GetItemDetail write SetItemDetail;
    property ItemHeaderText: String read GetItemHeaderText write SetItemHeaderText;
  end;

  ISincroInfo = interface
    ['{38C4F5BF-8BA1-417E-A738-033170A384AC}']
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
    procedure SetDataUltimaSincro(const AValue:TDate);
    procedure SetTabellaUtenti(const AValue: boolean);
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
    function GetUserNameSincro: string;
    function GetUserPasswordSincro: string;
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
  //*-------------------------------------------------------------------------------*
  //* Interfaccia per tutte le tabelle che implementano un codice e una descrizione *
  //*-------------------------------------------------------------------------------*
  ITabelleBase = interface
    ['{472EC4B2-E96C-442F-A3F4-F4D556358F62}']
    // Getter and Setter
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    procedure SetCodice(const AValue:String);
    function GetCodice: String;
    procedure SetDescrizione(const AValue:String);
    function GetDescrizione: String;
    procedure SetTitolo(const AValue:String);
    function GetTitolo: String;
    // Proprietà
    property ID: Integer read GetID write SetID;
    property Codice: String read GetCodice write SetCodice;
    property Descrizione: String read GetDescrizione write SetDescrizione;
    property Titolo: String read GetTitolo write SetTitolo;
  end;

  IMagazzino = interface(ITabelleBase)
    ['{29744026-345B-43C9-8C8A-16EE7CE002D6}']
  end;

  IUtente = interface(ITabelleBase)
    ['{52E77439-0E0D-4733-9ABE-C61075B3E4B6}']
    function GetPassword: String;
    procedure SetPassword(const AValue: String);
    property Password: String read GetPassword write SetPassword;
  end;

  IValuta = interface(ITabelleBase)
    ['{29744026-345B-43C9-8C8A-16EE7CE002D6}']
    // Getter and Setter
    function GetImportoCambio: Currency;
    function GetNumeroDecimali: Integer;
    function GetTipoOperatore: String;
    procedure SetImportoCambio(const AValue: Currency);
    procedure SetNumeroDecimali(const AValue: Integer);
    procedure SetTipoOperatore(const AValue: String);
    // Proprietà
    property NumeroDecimali: Integer read GetNumeroDecimali write SetNumeroDecimali;
    property ImportoCambio: Currency read GetImportoCambio write SetImportoCambio;
    property TipoOperatore: String read GetTipoOperatore write SetTipoOperatore;
  end;

  ITipoPagamento = interface(ITabelleBase)
    ['{FF7DD630-B70C-488F-B24E-718DF2D26D33}']
  end;

  ICodiceSconto = interface(ITabelleBase)
    ['{52D704F6-27A5-4671-A7B2-60082033D298}']
    // Getter and Setter
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
    // Proprietà
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
  end;

  //*------------------------------- *
  //* Tabella Sconti Cliente (Righe) *
  //*------------------------------- *
  IScontoClienteRiga = interface
    ['{D946A768-16F2-4571-A152-12E57C7B7802}']
    // Getter and Setter
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
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
    function GetCodiceCliente: string;
    procedure SetCodiceCliente(const AValue: string);
    // Proprietà
    property ID: Integer read GetID write SetID;
    property CodiceCliente: string read GetCodiceCliente write SetCodiceCliente;
    property CodiceStruttura1: string read GetCodiceStruttura1 write SetCodiceStruttura1;
    property CodiceStruttura2: string read GetCodiceStruttura2 write SetCodiceStruttura2;
    property CodiceStruttura3: string read GetCodiceStruttura3 write SetCodiceStruttura3;
    property CodiceStruttura4: string read GetCodiceStruttura4 write SetCodiceStruttura4;
    property PercSconto1: Currency read GetPercSconto1 write SetPercSconto1;
    property PercSconto2: Currency read GetPercSconto2 write SetPercSconto2;
    property PercSconto3: Currency read GetPercSconto3 write SetPercSconto3;
    property CodiceSconto: string read GetCodiceSconto write SetCodiceSconto;
    property FlagContoVendita: string read GetFlagContoVendita write SetFlagContoVendita;
    property FlagScontoTestata: string read GetFlagScontoTestata write SetFlagScontoTestata;
  end;

  //*--------------------------------- *
  //* Tabella Sconti Cliente (Testate) *
  //*--------------------------------- *
  IScontoClienteTestata = interface
    ['{E25F9063-B8B1-412A-990A-2B858DDCC3BC}']
    // Getter and Setter
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
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
    function GetCodiceCliente: string;
    procedure SetCodiceCliente(const AValue: string);
    // Proprietà
    property ID: Integer read GetID write SetID;
    property CodiceCliente: string read GetCodiceCliente write SetCodiceCliente;
    property CodiceStruttura1: string read GetCodiceStruttura1 write SetCodiceStruttura1;
    property CodiceStruttura2: string read GetCodiceStruttura2 write SetCodiceStruttura2;
    property CodiceStruttura3: string read GetCodiceStruttura3 write SetCodiceStruttura3;
    property CodiceStruttura4: string read GetCodiceStruttura4 write SetCodiceStruttura4;
    property PercSconto1: Currency read GetPercSconto1 write SetPercSconto1;
    property PercSconto2: Currency read GetPercSconto2 write SetPercSconto2;
    property PercSconto3: Currency read GetPercSconto3 write SetPercSconto3;
    property CodiceSconto: string read GetCodiceSconto write SetCodiceSconto;
    property CodicePagamento: string read GetCodicePagamento write SetCodicePagamento;
  end;

  ITipoListino = interface(ITabelleBase)
    ['{C116D1D5-2780-4532-9028-261896A6E350}']
    // Getter and Setter
    function GetTipo: String;
    procedure SetTipo(const AValue: String);
    function GetValuta: string;
    procedure SetValuta(const AValue: string);
    // Proprietà
    property Tipo: String read GetTipo write SetTipo;
    property Valuta: string read GetValuta write SetValuta;
  end;

  IClasseOrdine = interface(ITabelleBase)
    ['{DF8CBED6-CBB2-40C9-B370-70DA63343CAF}']
  end;

  IStagione = interface(ITabelleBase)
    ['{F07F7F78-08F8-40CE-9403-8C44EF20C984}']
  end;

  ITipoDocumento = interface(ITabelleBase)
    ['{0B766E96-0E8B-44C0-A1CB-6FDFFD1EA1BC}']
  end;

  IRaggruppamento = interface(ITabelleBase)
    ['{58A89178-B1AD-4999-87D1-8B40A4703231}']
  end;

  ICodiceSpesa = interface(ITabelleBase)
    ['{82783885-9003-4E8E-AFFC-4FE176F43742}']
  end;

  IAliquotaIva = interface(ITabelleBase)
    ['{F5101E2E-9EB1-4F88-9B7B-3BCB98097D47}']
    function GetPercIva: Currency;
    procedure SetPercIva(const AValue: Currency);
    property PercIva: Currency read GetPercIva write SetPercIva;
  end;

  ISetTaglia = interface(ITabelleBase)
    ['{866174A1-B432-47BC-B81D-0CDFE3A3D1B0}']
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

  IRipartizioneTaglia = interface
    ['{7EF2EDD3-DB47-4B26-97BF-8A3B9D6B2DE4}']
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
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
    property ID: Integer read GetID write SetID;
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
  end;

  IArticolo = interface(ITabelleBase)
    ['{207FBFCB-F836-4C7C-AF3D-09154180A9F0}']
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
  end;

  ITaglia = interface
    ['{102B4FE2-28E6-4E4F-8565-077BC889C833}']
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
    property ID: Integer read GetID write SetID;
    property Articolo: String read GetArticolo write SetArticolo;
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

  ICodiceABarre = interface
    ['{E489802F-0C1C-4415-94F2-92125DF04A19}']
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
    property ID: Integer read GetID write SetID;
    property Articolo: String read GetArticolo write SetArticolo;
    property Taglia: String read GetTaglia write SetTaglia;
    property Ean: String read GetEan write SetEan;
    property Tipo: String read GetTipo write SetTipo;
  end;

  IListinoVendita = interface
    ['{131A66E0-CD8C-4B28-B4D4-6B6738B641F0}']
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
    property ID: Integer read GetID write SetID;
    property Listino: String read GetListino write SetListino;
    property Articolo: String read GetArticolo write SetArticolo;
    property DataInizio: TDateTime read GetDataInizio write SetDataInizio;
    property DataFine: TDateTime read GetDataFine write SetDataFine;
    property Prezzo: currency read GetPrezzo write SetPrezzo;
    property Valuta: string read GetValuta write SetValuta;
  end;

  ICliente = interface(ITabelleBase)
    ['{AEDFB520-67C8-41B6-9444-56D845E8D960}']
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
  end;

  IScalarinoTaglia = interface
    ['{ED64296F-4D95-47E9-8E81-895767841B20}']
    procedure SetID(const AValue:Integer);
    function GetID: Integer;
    procedure SetRigaID(const AValue:Integer);
    function GetRigaID: Integer;
    function GetTaglia1: integer;
    procedure SetTaglia1(const AValue: integer);
    function GetTaglia2: integer;
    procedure SetTaglia2(const AValue: integer);
    function GetTaglia3: integer;
    procedure SetTaglia3(const AValue: integer);
    function GetTaglia4: integer;
    procedure SetTaglia4(const AValue: integer);
    function GetTaglia5: integer;
    procedure SetTaglia5(const AValue: integer);
    function GetTaglia6: integer;
    procedure SetTaglia6(const AValue: integer);
    function GetTaglia7: integer;
    procedure SetTaglia7(const AValue: integer);
    function GetTaglia8: integer;
    procedure SetTaglia8(const AValue: integer);
    function GetTaglia9: integer;
    procedure SetTaglia9(const AValue: integer);
    function GetTaglia10: integer;
    procedure SetTaglia10(const AValue: integer);
    function GetTaglia11: integer;
    procedure SetTaglia11(const AValue: integer);
    function GetTaglia12: integer;
    procedure SetTaglia12(const AValue: integer);
    function GetTaglia13: integer;
    procedure SetTaglia13(const AValue: integer);
    function GetTaglia14: integer;
    procedure SetTaglia14(const AValue: integer);
    function GetTaglia15: integer;
    procedure SetTaglia15(const AValue: integer);
    function GetTaglia16: integer;
    procedure SetTaglia16(const AValue: integer);
    function GetTaglia17: integer;
    procedure SetTaglia17(const AValue: integer);
    function GetTaglia18: integer;
    procedure SetTaglia18(const AValue: integer);
    function GetTaglia19: integer;
    procedure SetTaglia19(const AValue: integer);
    function GetTaglia20: integer;
    procedure SetTaglia20(const AValue: integer);
    function GetTaglia21: integer;
    procedure SetTaglia21(const AValue: integer);
    function GetTaglia22: integer;
    procedure SetTaglia22(const AValue: integer);
    function GetTaglia23: integer;
    procedure SetTaglia23(const AValue: integer);
    function GetTaglia24: integer;
    procedure SetTaglia24(const AValue: integer);
    function GetQuantitaTotale: integer;
    property ID: Integer read GetID write SetID;
    property RigaID: Integer read GetRigaID write SetRigaID;
    property Taglia1: integer read GetTaglia1 write SetTaglia1;
    property Taglia2: integer read GetTaglia2 write SetTaglia2;
    property Taglia3: integer read GetTaglia3 write SetTaglia3;
    property Taglia4: integer read GetTaglia4 write SetTaglia4;
    property Taglia5: integer read GetTaglia5 write SetTaglia5;
    property Taglia6: integer read GetTaglia6 write SetTaglia6;
    property Taglia7: integer read GetTaglia7 write SetTaglia7;
    property Taglia8: integer read GetTaglia8 write SetTaglia8;
    property Taglia9: integer read GetTaglia9 write SetTaglia9;
    property Taglia10: integer read GetTaglia10 write SetTaglia10;
    property Taglia11: integer read GetTaglia11 write SetTaglia11;
    property Taglia12: integer read GetTaglia12 write SetTaglia12;
    property Taglia13: integer read GetTaglia13 write SetTaglia13;
    property Taglia14: integer read GetTaglia14 write SetTaglia14;
    property Taglia15: integer read GetTaglia15 write SetTaglia15;
    property Taglia16: integer read GetTaglia16 write SetTaglia16;
    property Taglia17: integer read GetTaglia17 write SetTaglia17;
    property Taglia18: integer read GetTaglia18 write SetTaglia18;
    property Taglia19: integer read GetTaglia19 write SetTaglia19;
    property Taglia20: integer read GetTaglia20 write SetTaglia20;
    property Taglia21: integer read GetTaglia21 write SetTaglia21;
    property Taglia22: integer read GetTaglia22 write SetTaglia22;
    property Taglia23: integer read GetTaglia23 write SetTaglia23;
    property Taglia24: integer read GetTaglia24 write SetTaglia24;
    property QuantitaTotale: integer read GetQuantitaTotale;
  end;

  INumeratore = interface
    ['{BC7F2AD7-AAAC-4793-8DD8-4B4FF780D9FD}']
    procedure SetID(const Value:Integer);
    function GetID: Integer;
    function GetChiave: string;
    function GetNumero: integer;
    procedure SetChiave(const Value: string);
    procedure SetNumero(const Value: integer);
    property ID: Integer read GetID write SetID;
    property Numero: integer read GetNumero write SetNumero;
    property Chiave: string read GetChiave write SetChiave;
  end;

  IVersione = interface
    ['{41065B95-F0E6-4103-B42C-CB2D132B2257}']
    procedure SetID(const Value:Integer);
    function GetID: Integer;
    function GetNumero: integer;
    procedure SetNumero(const Value: integer);
    function GetDataRilascio: TDateTime;
    procedure SetDataRilascio(const Value: TDateTime);
    property ID: Integer read GetID write SetID;
    property Numero: integer read GetNumero write SetNumero;
    property DataRilascio: TDateTime read GetDataRilascio write SetDataRilascio;
  end;

  IRigaOrdine = interface
    ['{A76EBEB7-1686-42D2-B311-BA64CDCCB330}']
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
    function GetArticoloCodiceDecodifica: string;
    function GetArticoloDescrizioneDecodifica: string;
    function GetCodiceRipartizione: String;
    function GetAliquotaIvaCodiceDecodifica: String;
    function GetCodiceScontoDecodifica: String;
    function GetCodiceScontoDescrizioneDecodifica: String;
    function GetAliquotaIvaDecrizioneDecodifica: String;
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
    procedure SetQuantitaTotale(const Value: Integer);
    // Decodifiche
    procedure SetArticoloCodiceDecodifica(const Value: string);
    procedure SetArticoloDescrizioneDecodifica(const Value: string);
    procedure SetCodiceRipartizione(const Value: String);
    procedure SetAliquotaIvaCodiceDecodifica(const Value: String);
    procedure SetAliquotaIvaDecrizioneDecodifica(const Value: String);
    procedure SetCodiceScontoDecodifica(const Value: String);
    procedure SetCodiceScontoDescrizioneDecodifica(const Value: String);
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
    property ID:Integer read GetID write SetID;
    property TestataID: Integer read GetTestataID write SetTestataID;
    property NumeroRiga: Integer read GetNumeroRiga write SetNumeroRiga;
    property Articolo:IArticolo read GetArticolo write SetArticolo;
    property RipartizioneTaglia:IRipartizioneTaglia read GetRipartizioneTaglia write SetRipartizioneTaglia;
    property DataConsegna:TDateTime read GetDataConsegna write SetDataConsegna;
    property AliquotaIva:IAliquotaIva read GetAliquotaIva write SetAliquotaIva;
    property ScontoTestata:Boolean read GetScontoTestata write SetScontoTestata;
    property Sconto1:Currency read GetSconto1 write SetSconto1;
    property Sconto2:Currency read GetSconto2 write SetSconto2;
    property Sconto3:Currency read GetSconto3 write SetSconto3;
    property CodiceSconto:ICodiceSconto read GetCodiceSconto write SetCodiceSconto;
    property Note:string read GetNote write SetNote;
    property MerceInCV:Boolean read GetMerceInCV write SetMerceInCV;
    //property CodiceCommento:ISetCommenti read GetCodiceCommento write SetCodiceCommento;
    property RiferimentiLiberi:string read GetRiferimentiLiberi write SetRiferimentiLiberi;
    //property Quantita: IScalarinoTaglia read GetQuantita write SetQuantita;
    property QuantitaTotale: Integer read GetQuantitaTotale write SetQuantitaTotale;
    property ImportoUnitario:Currency read GetImportoUnitario write SetImportoUnitario;
    property ImportoTotale: Currency read GetImportoTotale write SetImportoTotale;
    // Quantita per taglie
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
    // Decodifiche
    property ArticoloCodiceDecodifica: string read GetArticoloCodiceDecodifica write SetArticoloCodiceDecodifica;
    property ArticoloDescrizioneDecodifica: string read GetArticoloDescrizioneDecodifica write SetArticoloDescrizioneDecodifica;
    property CodiceRipartizione: String read GetCodiceRipartizione write SetCodiceRipartizione;
    property AliquotaIvaCodiceDecodifica: String read GetAliquotaIvaCodiceDecodifica write SetAliquotaIvaCodiceDecodifica;
    property AliquotaIvaDescrizioneDecodifica: String read GetAliquotaIvaDecrizioneDecodifica write SetAliquotaIvaDecrizioneDecodifica;
    property CodiceScontoDecodifica: String read GetCodiceScontoDecodifica write SetCodiceScontoDecodifica;
    property CodiceScontoDescrizioneDecodifica: String read GetCodiceScontoDescrizioneDecodifica write SetCodiceScontoDescrizioneDecodifica;
  end;

  ITestataOrdine = interface
    ['{C9F3D58E-15EE-450F-9700-08B4FF428A61}']
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
    function GetUtenteInserimento: String;
    function GetUtenteUltimaModifica: String;
    function GetQuantitaTotale: Integer;
    function DecodificaStato(const Value: TStatoSincronizzazione): string;
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

    property ID:Integer read GetID write SetID;
    property Cliente:ICliente read GetCliente write SetCliente;
    property NumeroOrdine: string read GetNumeroOrdine write SetNumeroOrdine;
    property DataOrdine:TDateTime read GetDataOrdine write SetDataOrdine;
    property Riferimento:String read GetRiferimento write SetRiferimento;
    property DataRiferimento:TDateTime read GetDataRiferimento write SetDataRiferimento;
    property Magazzino:IMagazzino read GetMagazzino write SetMagazzino;
    property DataConsegna:TDateTime read GetDataConsegna write SetDataConsegna;
    property Valuta:IValuta read GetValuta write SetValuta;
    property Cambio:Currency read GetCambio write SetCambio;
    property TipoOperatore:String read GetTipoOperatore write SetTipoOperatore;
    property TipoPagamento:ITipoPagamento read GetTipoPagamento write SetTipoPagamento;
    property Sconto1:Currency read GetSconto1 write SetSconto1;
    property Sconto2:Currency read GetSconto2 write SetSconto2;
    property Sconto3:Currency read GetSconto3 write SetSconto3;
    property CodiceSconto:ICodiceSconto read GetCodiceSconto write SetCodiceSconto;
    property Listino:ITipoListino read GetListino write SetListino;
    property Classe:IClasseOrdine read GetClasse write SetClasse;
    property Stagione:IStagione read GetStagione write SetStagione;
    property TipoDocumento:ITipoDocumento read GetTipoDocumento write SetTipoDocumento;
    property StatoSincronizzazione:TStatoSincronizzazione read GetStatoSincronizzazione write SetStatoSincronizzazione;
    property Righe:TList<IRigaOrdine> read GetRighe write SetRighe;
    property ImportoTotale: currency read GetImportoTotale write SetImportoTotale;
    property QuantitaTotale: integer read GetQuantitaTotale write SetQuantitaTotale;
    property UtenteInserimento: string read GetUtenteInserimento write SetUtenteInserimento;
    property UtenteUltimaModifica: string read GetUtenteUltimaModifica write SetUtenteUltimaModifica;
    // Decodifiche
    property ClienteCodiceDecodifica: String read GetClienteCodiceDecodifica write SetClienteCodiceDecodifica;
    property ClienteDescrizioneDecodifica: String read GetClienteDescrizioneDecodifica write SetClienteDescrizioneDecodifica;
    property MagazzinoCodiceDecodifica: String read GetMagazzinoCodiceDecodifica write SetMagazzinoCodiceDecodifica;
    property MagazzinoDescrizioneDecodifica: String read GetMagazzinoDescrizioneDecodifica write SetMagazzinoDescrizioneDecodifica;
    property TipoPagamentoCodiceDecodifica: String read GetTipoPagamentoCodiceDecodifica write SetTipoPagamentoCodiceDecodifica;
    property TipoPagamentoDescrizioneDecodifica: String read GetTipoPagamentoDescrizioneDecodifica write SetTipoPagamentoDescrizioneDecodifica;
    property ScontoCodiceDecodifica: String read GetScontoCodiceDecodifica write SetScontoCodiceDecodifica;
    property ScontoDescrizioneDecodifica: String read GetScontoDescrizioneDecodifica write SetScontoDescrizioneDecodifica;
    property ListinoCodiceDecodifica: String read GetListinoCodiceDecodifica write SetListinoCodiceDecodifica;
    property ListinoDescrizioneDecodifica: String read GetListinoDescrizioneDecodifica write SetListinoDescrizioneDecodifica;
    property ClasseOrdineCodiceDecodifica: String read GetClasseOrdineCodiceDecodifica write SetClasseOrdineCodiceDecodifica;
    property ClasseOrdineDescrizioneDecodifica: String read GetClasseOrdineDescrizioneDecodifica write SetClasseOrdineDescrizioneDecodifica;
    property StagioneCodiceDecodifica: String read GetStagioneCodiceDecodifica write SetStagioneCodiceDecodifica;
    property StagioneDescrizioneDecodifica: String read GetStagioneDescrizioneDecodifica write SetStagioneDescrizioneDecodifica;
    property TipoDocumentoCodiceDecodifica: String read GetTipoDocumentoCodiceDecodifica write SetTipoDocumentoCodiceDecodifica;
    property TipoDocumentoDescrizioneDecodifica: String read GetTipoDocumentoDescrizioneDecodifica write SetTipoDocumentoDescrizioneDecodifica;
    property ValutaCodiceDecodifica: String read GetValutaCodiceDecodifica write SetValutaCodiceDecodifica;
  end;

implementation

end.
