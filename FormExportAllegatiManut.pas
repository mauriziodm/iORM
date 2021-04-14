unit FormExportAllegatiManut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteFilterListAnag, cxCustomData, cxGraphics,
  cxEdit, DB, cxDBData, Menus, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, cxCalendar, StdCtrls, Mask, MAURI_SB, Buttons,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLabel, cxStyles, cxFilter, cxData, cxDataStorage,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, Vcl.ComCtrls, dxCore,
  cxDateUtils;

type
  TExportAllegatiManutForm = class(TLevanteFilterListAnagForm)
    QID: TIntegerField;
    QTIPO: TStringField;
    QSTATOAVANZAMENTO: TSmallintField;
    QDATACONTROLLO: TDateTimeField;
    QFULLINDIRIZZOIMM: TStringField;
    QFULLRESPIMP: TStringField;
    QFULLPROP: TStringField;
    QGENCAL_FULLRIF: TStringField;
    QFULLPRATICA: TStringField;
    tvListID: TcxGridDBColumn;
    tvListTIPO: TcxGridDBColumn;
    tvListSTATOAVANZAMENTO: TcxGridDBColumn;
    tvListDATACONTROLLO: TcxGridDBColumn;
    tvListFULLINDIRIZZOIMM: TcxGridDBColumn;
    tvListFULLRESPIMP: TcxGridDBColumn;
    tvListFULLPROP: TcxGridDBColumn;
    tvListGENCAL_FULLRIF: TcxGridDBColumn;
    tvListFULLPRATICA: TcxGridDBColumn;
    Label34: TLabel;
    Label33: TLabel;
    PratOtt: TSpeedButton;
    PratNov: TSpeedButton;
    PratDic: TSpeedButton;
    PratAgo: TSpeedButton;
    PratLug: TSpeedButton;
    PratGiu: TSpeedButton;
    PratMag: TSpeedButton;
    PratGen: TSpeedButton;
    PratFeb: TSpeedButton;
    PratMar: TSpeedButton;
    PratApr: TSpeedButton;
    PratMesiTutti: TSpeedButton;
    PratMesiNessuno: TSpeedButton;
    PratSet: TSpeedButton;
    StaticText1: TStaticText;
    FilterEnte: TcxLookupComboBox;
    QryEntiLookup: TIBOQuery;
    SourceEntiLookup: TDataSource;
    QENTE_ID: TIntegerField;
    cxLabel1: TcxLabel;
    sbEsportaRigheSelezionate: TSpeedButtonRollOver;
    sbEsportaTutto: TSpeedButtonRollOver;
    QryAll: TIBOQuery;
    DataSource1: TDataSource;
    QryAllID: TIntegerField;
    QryAllTIPO: TStringField;
    QryAllSTATOAVANZAMENTO: TSmallintField;
    QryAllDATACONTROLLO: TDateTimeField;
    QryAllDATAORAARRIVO: TDateTimeField;
    QryAllDATAORAPARTENZA: TDateTimeField;
    QryAllIDIMPEGNO: TIntegerField;
    QryAllCODICECATASTO: TStringField;
    QryAllCODICEISTATCOMUNEIMM: TStringField;
    QryAllCOMUNEIMM: TStringField;
    QryAllCAPIMM: TStringField;
    QryAllZONAIMM: TStringField;
    QryAllINDIRIZZOIMM: TStringField;
    QryAllNUMCIVICOIMM: TStringField;
    QryAllPIANOIMM: TStringField;
    QryAllINTERNOIMM: TStringField;
    QryAllSCALAIMM: TStringField;
    QryAllPROVINCIAIMM: TStringField;
    QryAllCODICERESPIMP: TIntegerField;
    QryAllRAGSOCRESPIMP: TStringField;
    QryAllINDIRIZZORESPIMP: TStringField;
    QryAllNUMCIVICORESPIMP: TStringField;
    QryAllCAPRESPIMP: TStringField;
    QryAllCODICEISTATCOMUNERESPIMP: TStringField;
    QryAllCITTARESPIMP: TStringField;
    QryAllPROVINCIARESPIMP: TStringField;
    QryAllTELEFONORESPIMP: TStringField;
    QryAllCELLULARERESPIMP: TStringField;
    QryAllCODICEFISCALERESPIMP: TStringField;
    QryAllINQUALITADIRESPIMP: TStringField;
    QryAllPROPCODICE: TIntegerField;
    QryAllPROPDENOMINAZIONE: TStringField;
    QryAllPROPINDIRIZZO: TStringField;
    QryAllPROPNUMCIVICO: TStringField;
    QryAllPROPCAP: TStringField;
    QryAllPROPCODICEISTATCOMUNE: TStringField;
    QryAllPROPLOCALITA: TStringField;
    QryAllPROPPROVINCIA: TStringField;
    QryAllPROPTELEFONO: TStringField;
    QryAllPROPCELLULARE: TStringField;
    QryAllPROPCODICEFISCALE: TStringField;
    QryAllGENCAL_ID: TIntegerField;
    QryAllGENCAL_COSTRUTTORE: TStringField;
    QryAllGENCAL_MODELLO: TStringField;
    QryAllGENCAL_MATRICOLA: TStringField;
    QryAllGENCAL_TIPOLOGIA: TStringField;
    QryAllGENCAL_TIPOCAMERA: TStringField;
    QryAllGENCAL_TIPOTIRAGGIO: TStringField;
    QryAllGENCAL_ANNOCOSTRUZIONE: TIntegerField;
    QryAllGENCAL_POTENZATERMICAFOCOLARE: TIBOFloatField;
    QryAllGENCAL_POTENZATERMICA: TIBOFloatField;
    QryAllGENCAL_MARCAEFFICENERGETICA: TStringField;
    QryAllGENCAL_RISCALDAMENTO: TStringField;
    QryAllGENCAL_ACQUASANITARIA: TStringField;
    QryAllGENCAL_COMBUSTIBILE: TStringField;
    QryAllGENCAL_COMBUSTIBILEALTRO: TStringField;
    QryAllGENCAL_UBICAZIONE: TStringField;
    QryAllGENCAL_DATAINSTALLAZIONE: TDateTimeField;
    QryAllGENCAL_VOLUMETRIARISC: TIBOFloatField;
    QryAllGENCAL_FLUIDOTERMOVETTORE: TStringField;
    QryAllGENCAL_CONSUMI1_STAGIONE: TStringField;
    QryAllGENCAL_CONSUMI1_M3KG: TIBOFloatField;
    QryAllGENCAL_CONSUMI2_STAGIONE: TStringField;
    QryAllGENCAL_CONSUMI2_M3KG: TIBOFloatField;
    QryAllBRUC_ID: TIntegerField;
    QryAllBRUC_COSTRUTTORE: TStringField;
    QryAllBRUC_MODELLO: TStringField;
    QryAllBRUC_MATRICOLA: TStringField;
    QryAllBRUC_TIPOLOGIA: TStringField;
    QryAllBRUC_ANNOCOSTRUZIONE: TIntegerField;
    QryAllBRUC_DATAINSTALLAZIONE: TDateTimeField;
    QryAllBRUC_CAMPOFUNZIONAMENTO: TIBOFloatField;
    QryAllBRUC_CAMPOFUNZIONAMENTO2: TIBOFloatField;
    QryAllB_LIBRETTOIMPIANTO: TStringField;
    QryAllB_LIBRETTOIMPIANTO_NOTE: TStringField;
    QryAllB_RAPPCONTRTECN10435: TStringField;
    QryAllB_RAPPCONTRTECN10435_NOTE: TStringField;
    QryAllB_DICHCONFIMP: TStringField;
    QryAllB_DICHCONFIMP_NOTE: TStringField;
    QryAllB_LIBRUSOCALD: TStringField;
    QryAllB_LIBRUSOCALD_NOTE: TStringField;
    QryAllB_LIBRUSOBRUCIATORE: TStringField;
    QryAllB_LIBRUSOBRUCIATORE_NOTE: TStringField;
    QryAllB_PRATICAISPESL: TStringField;
    QryAllB_PRATICAISPESL_NOTE: TStringField;
    QryAllB_CERTPREVINCENDI: TStringField;
    QryAllB_CERTPREVINCENDI_NOTE: TStringField;
    QryAllB_CERTUNI8364: TStringField;
    QryAllB_CERTUNI8364_NOTE: TStringField;
    QryAllB_SCHEMIFUNZIDRAUL: TStringField;
    QryAllB_SCHEMIFUNZIDRAUL_NOTE: TStringField;
    QryAllB_SCHEMIFUNZELETTR: TStringField;
    QryAllB_SCHEMIFUNZELETTR_NOTE: TStringField;
    QryAllC_IDONLOCALEINSTALLAZ: TStringField;
    QryAllC_ADEGDIMENSVENTILAZ: TStringField;
    QryAllC_APERTVENTILAZLIBERE: TStringField;
    QryAllC_ESAMEVISIVOLINEEELETTRICHE: TStringField;
    QryAllC_BRUCFUNZIONAMCORRETTO: TStringField;
    QryAllD_PENDENZACORRETTA: TStringField;
    QryAllD_SEZIONICORRETTE: TStringField;
    QryAllD_CURVECORRETTE: TStringField;
    QryAllD_LUNGHEZZACORRETTA: TStringField;
    QryAllD_BUONOSTATOCONSERVAZ: TStringField;
    QryAllE_SCARICOCAMINOSINGOLO: TStringField;
    QryAllE_SCARICOCANNAFUMCOLLRAMIF: TStringField;
    QryAllE_APPSCARICAAPARETE: TStringField;
    QryAllE_NORIFLUSSIFUMILOCALE: TStringField;
    QryAllE_NOPERDITECONDOTTISCARICO: TStringField;
    QryAllF_UGELLIPULITI: TStringField;
    QryAllF_SCAMBLATOFUMOPULITO: TStringField;
    QryAllF_ACCENSFUNZAMREGOLARI: TStringField;
    QryAllF_DISPCOMANDOREGOLAZFUNZCORR: TStringField;
    QryAllF_ASSENZAPERDITEOSSIDAZRACC: TStringField;
    QryAllF_DISPSICUREZZANONMANOMESSI: TStringField;
    QryAllF_VASOESPANSIONECARICO: TStringField;
    QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI: TStringField;
    QryAllF_DISPROMPITIRAGGIONODETERIOR: TStringField;
    QryAllF_VALVOLASICUREZZASOVRAPRESS: TStringField;
    QryAllF_CIRCUITOARIAPULITO: TStringField;
    QryAllF_GUARNIZACCOPIAMINTEGRA: TStringField;
    QryAllG_CONTROLLOASSENZAFUGHEGAS: TStringField;
    QryAllG_ESAMEVISIVOCOIBENTAZIONI: TStringField;
    QryAllG_ESAMEVISIVOCAMINO: TStringField;
    QryAllANFUMI_EFFETTUATO: TStringField;
    QryAllANFUMI_TEMPFUMI: TIBOFloatField;
    QryAllANFUMI_TEMPAMBIENTE: TIBOFloatField;
    QryAllANFUMI_O2_PERC: TIBOFloatField;
    QryAllANFUMI_CO2_PERC: TIBOFloatField;
    QryAllANFUMI_BACHARACH_NUM: TIBOFloatField;
    QryAllANFUMI_CO_PPM: TIBOFloatField;
    QryAllANFUMI_CO_PERC: TIBOFloatField;
    QryAllANFUMI_RENDIMENTO_PERC: TIBOFloatField;
    QryAllANFUMI_TIRAGGIO_PA: TIBOFloatField;
    QryAllOSSERVAZIONI: TStringField;
    QryAllRACCOMANDAZIONI: TStringField;
    QryAllRACCOMANDAZIONI_FATTO: TStringField;
    QryAllRACCOMANDAZIONI_FATTO_DATA: TDateTimeField;
    QryAllRACCOMANDAZIONI_FATTO_NOTE: TStringField;
    QryAllPRESCRIZIONI: TStringField;
    QryAllPRESCRIZIONI_FATTO: TStringField;
    QryAllPRESCRIZIONI_FATTO_DATA: TDateTimeField;
    QryAllPRESCRIZIONI_FATTO_NOTE: TStringField;
    QryAllIMPPUOFUNZIONARE: TStringField;
    QryAllTECNICO_RESOURCEID: TIntegerField;
    QryAllTECNICO_NOMECOGNOME: TStringField;
    QryAllTECNICO_RAGSOC: TStringField;
    QryAllTECNICO_INDIRIZZO: TStringField;
    QryAllTECNICO_TELEFONO: TStringField;
    QryAllTECNICO_ESTREMIDOCQUALIFICA: TStringField;
    QryAllDATAORADAIMPEGNO: TStringField;
    QryAllTECNICO_DAIMPEGNO: TStringField;
    QryAllIDPRATICA: TIntegerField;
    SaveDialog: TSaveDialog;
    QryAllENTE_ID: TIntegerField;
    QryAllENTE_TRACCIATO: TStringField;
    QENTE_TRACCIATO: TStringField;
    tvListENTE_ID: TcxGridDBColumn;
    tvListENTE_TRACCIATO: TcxGridDBColumn;
    QENTE_FULL: TStringField;
    tvListENTE_FULL: TcxGridDBColumn;
    QryAllPERIODICITA: TIntegerField;
    QryAllCOMPUTED_STR_CERTIFIED_IMM: TStringField;
    QryAllCOMPUTED_STR_CERTIFIED_PROP: TStringField;
    QryAllCOMPUTED_STR_CERTIFIED_RESPIMP: TStringField;
    QryAllJOIN_TECNICO_INDIRIZZO: TStringField;
    QryAllJOIN_TECNICO_CITTA: TStringField;
    QryAllJOIN_TECNICO_CAP: TStringField;
    QryAllJOIN_TECNICO_PROVINCIA: TStringField;
    QryEntiLookupENTE_ID_TRACCIATO: TStringField;
    QryEntiLookupENTE_NOME_TRACCIATO: TStringField;
    QryAllIMPIANTO_NUMTOTGENERATORI: TIntegerField;
    QryAllIMPIANTO_POTENZATERMICAFOCTOT: TIBOFloatField;
    QryAllPALAZZOIMM: TStringField;
    QryAllBOLLINO_PREFISSO: TStringField;
    QryAllBOLLINO_NUMERO: TStringField;
    QryAllFIRMAPRESENTE_RESPONSABILE: TStringField;
    QryAllFIRMAPRESENTE_TECNICO: TStringField;
    QryAllAUTONOMOCENTRALIZZATO: TStringField;
    QryAllDATAINSTALLAZIONEIMPIANTO: TDateTimeField;
    QryAllCODICEMANUTENTORE: TStringField;
    QryAllCODICEOPERATOREMANUTENTORE: TStringField;
    FilterDal: TcxDateEdit;
    FilterAl: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FilterEnteKeyPress(Sender: TObject; var Key: Char);
    procedure PratMesiTuttiClick(Sender: TObject);
    procedure PratMesiTuttiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PratMesiNessunoClick(Sender: TObject);
    procedure PratMesiNessunoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PratGenClick(Sender: TObject);
    procedure PratGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure FilterEntePropertiesChange(Sender: TObject);
    procedure sbEsportaRigheSelezionateClick(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure sbEsportaTuttoClick(Sender: TObject);
    procedure QryAllCalcFields(DataSet: TDataSet);
  private
    function Export_AllegatoFG_Vanzotech(ID: Integer): String;
    procedure NumCivicoToNumCivicoEsponente(InputStr: String; var N, A: String);
    function OnlyNumChar(InputStr: String): String;
    function StelleEfficEnergetica(InStr: String): String;
    function ComponiNoteChecks: String;
    function MarcaAllegatiEsportati: Boolean;
    function Export_AllegatoFG_Siena(ID: Integer): String;
    procedure ScomponiIndirizzo(InputStr: String; var TipoToponimo,
      Toponimo: String);
    function TFN_to_SNNC(InStr: String): String;
    function TFN_to_SNNA(InStr: String): String;
    function TFN_to_SNES(InStr: String): String;
    function TFN_to_SNX(InStr: String): String;
    function TFN_to_SNC(InStr: String): String;
    function TFN_to_SNE(InStr: String): String;
    function TFN_to_SNA(InStr: String): String;
    function TFN_to_PNA(InStr: String): String;
    function TFN_to_SN(InStr: String): String;
    function TFN_to_PN(InStr: String): String;
    procedure GetIdEnteTracciato(var EnteID, EnteTracciato: String);
    function Export_AllegatoG_Vestasoft(ID: Integer): String;
    function Export_AllegatoF_Vestasoft(ID: Integer): String;
    { Private declarations }
  protected
    procedure EseguiQuery; override;
  public
    { Public declarations }
  end;

var
  ExportAllegatiManutForm: TExportAllegatiManutForm;

implementation

uses DataModule1, DateUtils, StrUtils, DataModule2;

{$R *.dfm}


// =============================================================================
// INIZIO - PROCEDURA DI ESPORTAZIONE ALLEGATI F/G VANZOTECH
// -----------------------------------------------------------------------------
function TExportAllegatiManutForm.Export_AllegatoFG_Vanzotech(ID:Integer): String;
const
  SEP = '|';
  DATE_FORMAT = 'ddmmyyyy';
var
  T1, T2, T3: String; // Stringhe temporanee di appoggio
  i: Integer;
  TipoDoc: String;
begin
  // Inizializzazione
  Result := '';
  // IMposta query per dati allegato
  QryAll.Close;
  QryAll.Prepare;
  QryAll.Params.ParamByName('P_ID').AsInteger := ID;
  QryAll.Open;
  try
    // Determinazione tipo documento (Serve a valorizzare 'TipoDoc' da usare poi in alcune condizioni)
    if      QryAllTIPO.AsString = 'F - impianti termici' then TipoDoc := 'F'
    else if QryAllTIPO.AsString = 'G - impianti termici' then TipoDoc := 'G'
    else Exit;
    // Tipo documento
    if      QryAllTIPO.AsString = 'F - impianti termici' then Result := '1'
    else if QryAllTIPO.AsString = 'G - impianti termici' then Result := '2'
    else Exit;
    // -------------------------------------------------------------------------
    // Indirizzo installazione impianto
    // -------------------------------------------------------------------------
    Result := Result + SEP + Trim(QryAllCOMUNEIMM.AsString);   // Comune
    Result := Result + SEP + Trim(QryAllPROVINCIAIMM.AsString);   // Provincia
    Result := Result + SEP + Trim(QryAllCODICECATASTO.AsString);   // Codice catasto
    Result := Result + SEP + Trim(QryAllINDIRIZZOIMM.AsString);   // Indirizzo
    // Numero civico con esponente separato
    NumCivicoToNumCivicoEsponente(QryAllNUMCIVICOIMM.AsString, T1, T2);
    Result := Result + SEP + T1;   // Civico
    Result := Result + SEP + T2;   // Esponente civico
    // Continua
    Result := Result + SEP + Trim(QryAllPIANOIMM.AsString);   // Piano
    // Interno impianto con esponente separato
    NumCivicoToNumCivicoEsponente(QryAllINTERNOIMM.AsString, T1, T2);
    Result := Result + SEP + T1;   // Interno
    Result := Result + SEP + T2;   // Esponente interno
    // -------------------------------------------------------------------------
    // Responsabile dell'impianto
    // -------------------------------------------------------------------------
    Result := Result + SEP + Trim(QryAllRAGSOCRESPIMP.AsString);   // RagSoc
    Result := Result + SEP + OnlyNumChar(QryAllTELEFONORESPIMP.AsString);   // Telefono
    // Tipologia responsabile
    T1 := QryAllINQUALITADIRESPIMP.AsString;
    T2 := '';
    if      (T1 = 'Occupante')          then T2 := '1'
    else if (T1 = 'Proprietario')       then T2 := '2'
    else if (T1 = 'Terzo responsabile') then T2 := '3'
    else if (T1 = 'Amministratore')     then T2 := '4';
    Result := Result + SEP + T2;
    // Indirizzo responsabile impiento
    T1 := Trim(QryAllINDIRIZZORESPIMP.AsString);
    T2 := Trim(QryAllCITTARESPIMP.AsString);
    if (Uppercase(T2) <> Uppercase(Trim(QryAllCOMUNEIMM.AsString))) and (T2 <> '') then T1 := T1 + ' - ' + T2;
    Result := Result + SEP + T1;
    // Numero civico con esponente separato
    NumCivicoToNumCivicoEsponente(QryAllNUMCIVICORESPIMP.AsString, T1, T2);
    Result := Result + SEP + T1;   // Civico
    Result := Result + SEP + T2;   // Esponente civico
    // Continua
    Result := Result + SEP;   // Piano
    Result := Result + SEP;   // Interno
    Result := Result + SEP;   // Esponente interno
    // -------------------------------------------------------------------------
    // Proprietario  (solo se diverso dal responsabile)
    // -------------------------------------------------------------------------
    // Nome e telefono proprietario
    if Uppercase(QryAllPROPDENOMINAZIONE.AsString) <> Uppercase(QryAllRAGSOCRESPIMP.AsString) then begin
      Result := Result + SEP + Trim(QryAllPROPDENOMINAZIONE.AsString);   // RagSoc
      Result := Result + SEP + OnlyNumChar(QryAllPROPTELEFONO.AsString);   // Telefono
    end else begin
      Result := Result + SEP;   // RagSoc
      Result := Result + SEP;   // Telefono
    end;
    // -------------------------------------------------------------------------
    // Dati intervento/controllo
    // -------------------------------------------------------------------------
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllDATACONTROLLO.AsDateTime);  // Data controllo
    // -------------------------------------------------------------------------
    // Analisi fumi
    // -------------------------------------------------------------------------
    // Effettuata Si/No
    T1 := Trim(QryAllANFUMI_EFFETTUATO.AsString);
    Result := Result + SEP + TFN_to_SNX(T1);
    // Valori analisi fumi se effettuato altrimenti vuoto
    if T1 = 'T' then begin
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPFUMI.AsFloat, 1);  // Temp fumi
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPAMBIENTE.AsFloat, 1);  // Temp ambiente
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_O2_PERC.AsFloat, 1);  // % O2
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO2_PERC.AsFloat, 1);  // % CO2
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_BACHARACH_NUM.AsFloat, 0);  // Bacharach
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO_PPM.AsFloat, 0);  // CO ppm
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_RENDIMENTO_PERC.AsFloat, 1);  // Rendimento
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TIRAGGIO_PA.AsFloat, 0);  // Tiraggio pa
    end else begin
      Result := Result + SEP;  // Temp fumi
      Result := Result + SEP;  // Temp ambiente
      Result := Result + SEP;  // % O2
      Result := Result + SEP;  // % CO2
      Result := Result + SEP;  // Bacharach
      Result := Result + SEP;  // CO ppm
      Result := Result + SEP;  // Rendimento
      Result := Result + SEP;  // Tiraggio pa
    end;
    // -------------------------------------------------------------------------
    // Osservazioni / Raccomandazioni + tecnico
    // -------------------------------------------------------------------------
    Result := Result + SEP + Trim(QryAllOSSERVAZIONI.AsString);
    Result := Result + SEP + Trim(QryAllRACCOMANDAZIONI.AsString);
    Result := Result + SEP + TFN_to_SNX(QryAllIMPPUOFUNZIONARE.AsString);
    Result := Result + SEP + Trim(QryAllPRESCRIZIONI.AsString);
    Result := Result + SEP + Trim(QryAllTECNICO_NOMECOGNOME.AsString);
    Result := Result + SEP + Trim(QryAllTECNICO_ESTREMIDOCQUALIFICA.AsString);
    Result := Result + SEP + FormatDateTime('hhnn', QryAllDATAORAARRIVO.AsDateTime);  // Ora arrivo
    Result := Result + SEP + FormatDateTime('hhnn', QryAllDATAORAPARTENZA.AsDateTime);  // Ora partenza
    // Firma del tecnico presente
    T1 := Trim(QryAllFIRMAPRESENTE_TECNICO.AsString);
    if (T1 = 'T') then T2 := 'S' else T2 := 'N';
    Result := Result + SEP + T2;
    // Firma del responsabile presente
    T1 := Trim(QryAllFIRMAPRESENTE_RESPONSABILE.AsString);
    if (T1 = 'T') then T2 := 'S' else T2 := 'N';
    Result := Result + SEP + T2;
    // -------------------------------------------------------------------------
    // Generatore di calore  allegato F
    // -------------------------------------------------------------------------
    Result := Result + SEP + Trim(QryAllGENCAL_COSTRUTTORE.AsString);
    Result := Result + SEP + Trim(QryAllGENCAL_MODELLO.AsString);
    Result := Result + SEP + Trim(QryAllGENCAL_MATRICOLA.AsString);
    Result := Result + SEP + StelleEfficEnergetica(QryAllGENCAL_MARCAEFFICENERGETICA.AsString);
    Result := Result + SEP + Trim(QryAllGENCAL_ANNOCOSTRUZIONE.AsString);
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICA.AsFloat, 1);  // Potenza termica nominale generatore in kW
    Result := Result + SEP + Trim(QryAllGENCAL_TIPOCAMERA.AsString);  // Tipologia generatore
    Result := Result + SEP + Trim(QryAllGENCAL_FLUIDOTERMOVETTORE.AsString);
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllGENCAL_DATAINSTALLAZIONE.AsDateTime);
    Result := Result + SEP + Trim(QryAllBRUC_COSTRUTTORE.AsString);
    Result := Result + SEP + Trim(QryAllBRUC_MODELLO.AsString);
    Result := Result + SEP + Trim(QryAllBRUC_MATRICOLA.AsString);
    Result := Result + SEP + Trim(QryAllBRUC_ANNOCOSTRUZIONE.AsString);
    Result := Result + SEP + DM1.VirgolaPunto(QryAllBRUC_CAMPOFUNZIONAMENTO.AsFloat, 1);   // Campo funzionamento min
    Result := Result + SEP + DM1.VirgolaPunto(QryAllBRUC_CAMPOFUNZIONAMENTO2.AsFloat, 1);  // Campo funzionamento max
    Result := Result + SEP + Trim(QryAllBRUC_TIPOLOGIA.AsString);
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllBRUC_DATAINSTALLAZIONE.AsDateTime);
    // Destinazione d'uso
    T1 := Trim(QryAllGENCAL_RISCALDAMENTO.AsString);
    T2 := Trim(QryAllGENCAL_ACQUASANITARIA.AsString);
    T3 := '';
    if      (T1 = 'T') and (T2 = 'T') then T3 := '3'
    else if (T1 = 'T') then T3 := '1'
    else if (T2 = 'T') then T3 := '2';
    Result := Result + SEP + T3;
    Result := Result + SEP;  // Destinazione d'uso Altro
    // Combustibile
    T1 := Trim(QryAllGENCAL_COMBUSTIBILE.AsString);
    T2 := '';
    if      (T1 = 'Gas di rete')        then T2 := '1'
    else if (T1 = 'Gasolio')            then T2 := '2'
    else if (T1 = 'GPL')                then T2 := '3'
    else if (T1 = 'Kerosene')           then T2 := '4'
    else if (T1 = 'Olio combustibile')  then T2 := '5'
    else if (T1 = 'Altro')              then T2 := '6';
    Result := Result + SEP + T2;
    Result := Result + SEP + Trim(QryAllGENCAL_COMBUSTIBILEALTRO.AsString);
    // -------------------------------------------------------------------------
    // Checks allegato F
    // -------------------------------------------------------------------------
    // Se è un allegato F compila i seguenti campi
    if (TipoDoc = 'F') then begin
      Result := Result + SEP + TFN_to_SNX(QryAllB_LIBRETTOIMPIANTO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_RAPPCONTRTECN10435.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_CERTUNI8364.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_DICHCONFIMP.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_LIBRUSOBRUCIATORE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_LIBRUSOCALD.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_PRATICAISPESL.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_CERTPREVINCENDI.AsString);
      Result := Result + SEP + ComponiNoteChecks;
      Result := Result + SEP + TFN_to_SNX(QryAllC_IDONLOCALEINSTALLAZ.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllC_ADEGDIMENSVENTILAZ.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllC_APERTVENTILAZLIBERE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllC_ESAMEVISIVOLINEEELETTRICHE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_UGELLIPULITI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllC_BRUCFUNZIONAMCORRETTO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_SCAMBLATOFUMOPULITO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_ACCENSFUNZAMREGOLARI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_DISPSICUREZZANONMANOMESSI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_VASOESPANSIONECARICO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllG_ESAMEVISIVOCAMINO.AsString);
    // Se NON è un allegato F li lascia vuoti
    end else begin
      // Sono 25 campi
      for i := 1 to 25 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Generatore di calore  allegato G
    // -------------------------------------------------------------------------
    Result := Result + SEP + Trim(QryAllGENCAL_COSTRUTTORE.AsString);
    Result := Result + SEP + Trim(QryAllGENCAL_MODELLO.AsString);
    Result := Result + SEP + Trim(QryAllGENCAL_MATRICOLA.AsString);
    Result := Result + SEP + StelleEfficEnergetica(QryAllGENCAL_MARCAEFFICENERGETICA.AsString);
    Result := Result + SEP + Trim(QryAllGENCAL_ANNOCOSTRUZIONE.AsString);
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICA.AsFloat, 1);  // Potenza termica nominale utile in kW
    // Tipologia (camera)
    T1 := Trim(QryAllGENCAL_TIPOCAMERA.AsString);
    T2 := '';
    if      (T1 = 'Tipo B') then T2 := 'B'
    else if (T1 = 'Tipo C') then T2 := 'C';
    Result := Result + SEP + T2;
    // Tiraggio
    T1 := Trim(QryAllGENCAL_TIPOTIRAGGIO.AsString);
    T2 := '';
    if      (T1 = 'Naturale') then T2 := 'N'
    else if (T1 = 'Forzato')  then T2 := 'F';
    Result := Result + SEP + T2;
    // Continua
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllGENCAL_DATAINSTALLAZIONE.AsDateTime);
    Result := Result + SEP + Trim(QryAllGENCAL_UBICAZIONE.AsString);
    // Destinazione d'uso
    T1 := Trim(QryAllGENCAL_RISCALDAMENTO.AsString);
    T2 := Trim(QryAllGENCAL_ACQUASANITARIA.AsString);
    T3 := '';
    if      (T1 = 'T') then T3 := 'R'
    else if (T2 = 'T') then T3 := 'A';
    Result := Result + SEP + T3;
    // Combustibile
    T1 := Trim(QryAllGENCAL_COMBUSTIBILE.AsString);
    T2 := '';
    if      (T1 = 'Gas di rete')        then T2 := '1'
    else if (T1 = 'Gasolio')            then T2 := '2'
    else if (T1 = 'GPL')                then T2 := '3'
    else if (T1 = 'Kerosene')           then T2 := '4'
    else if (T1 = 'Olio combustibile')  then T2 := '5'
    else if (T1 = 'Altro')              then T2 := '6';
    Result := Result + SEP + T2;
    Result := Result + SEP + Trim(QryAllGENCAL_COMBUSTIBILEALTRO.AsString);
    // Fluido termovettore
    T1 := Uppercase(Trim(QryAllGENCAL_FLUIDOTERMOVETTORE.AsString));
    T2 := '';
    if (T1 = 'ARIA') or (T1 = 'AIR') then T2 := 'A' else T2 := 'H';
    Result := Result + SEP + T2;
    // -------------------------------------------------------------------------
    // Checks allegato G
    // -------------------------------------------------------------------------
    // Se è un allegato G compila i seguenti campi
    if (TipoDoc = 'G') then begin
      Result := Result + SEP + TFN_to_SNX(QryAllB_DICHCONFIMP.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_LIBRETTOIMPIANTO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllB_LIBRUSOCALD.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllC_IDONLOCALEINSTALLAZ.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllC_ADEGDIMENSVENTILAZ.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllC_APERTVENTILAZLIBERE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllD_PENDENZACORRETTA.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllD_SEZIONICORRETTE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllD_CURVECORRETTE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllD_LUNGHEZZACORRETTA.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllD_BUONOSTATOCONSERVAZ.AsString);
      // Scarico camino
      T1 := Trim(QryAllE_SCARICOCAMINOSINGOLO.AsString);
      T2 := Trim(QryAllE_SCARICOCANNAFUMCOLLRAMIF.AsString);
      T3 := '';
      if      (T2 = 'T') then T3 := 'C'
      else if (T1 = 'T') then T3 := 'S';
      Result := Result + SEP + T3;
      // Continua
      Result := Result + SEP + TFN_to_SNX(QryAllE_APPSCARICAAPARETE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllE_NORIFLUSSIFUMILOCALE.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllE_NOPERDITECONDOTTISCARICO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_UGELLIPULITI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_DISPROMPITIRAGGIONODETERIOR.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_SCAMBLATOFUMOPULITO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_ACCENSFUNZAMREGOLARI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_VALVOLASICUREZZASOVRAPRESS.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_VASOESPANSIONECARICO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_DISPSICUREZZANONMANOMESSI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_CIRCUITOARIAPULITO.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllF_GUARNIZACCOPIAMINTEGRA.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString);
      Result := Result + SEP + TFN_to_SNX(QryAllG_ESAMEVISIVOCAMINO.AsString);
    // Se NON è un allegato G li lascia vuoti
    end else begin
      // Sono 30 campi
      for i := 1 to 30 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Altri campi
    // -------------------------------------------------------------------------
    Result := Result + SEP + Trim(QryAllBOLLINO_PREFISSO.AsString);  // Prefisso bollino
    Result := Result + SEP + Trim(QryAllBOLLINO_NUMERO.AsString);  // Bollino
    Result := Result + SEP + Trim(QryAllCODICEMANUTENTORE.AsString);  // Codice manutentore assegnato dall'ente di controllo al manutentore convenzionato
    Result := Result + SEP + QryAllIDPRATICA.AsString;  // ID impianto manutentore
    Result := Result + SEP + DM1.TableDatiAziendaP_IVA.AsString;  // Partita IVA manutentore
    // -------------------------------------------------------------------------
  finally
    // Pulizie finali
    QryAll.Close;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - PROCEDURA DI ESPORTAZIONE ALLEGATI F/G VANZOTECH
// =============================================================================




// =============================================================================
// INIZIO - PROCEDURA DI ESPORTAZIONE ALLEGATI F/G SIENA
// -----------------------------------------------------------------------------
function TExportAllegatiManutForm.Export_AllegatoFG_Siena(ID:Integer): String;
const
  SEP = Chr(9);
  DATE_FORMAT = 'dd/mm/yyyy';
var
  T1, T2, T3: String; // Stringhe temporanee di appoggio
  i: Integer;
  TipoDoc: String;
begin
  // Inizializzazione
  Result := '';
  // IMposta query per dati allegato
  QryAll.Close;
  QryAll.Prepare;
  QryAll.Params.ParamByName('P_ID').AsInteger := ID;
  QryAll.Open;
  try
    // Determinazione tipo documento (Serve a valorizzare 'TipoDoc' da usare poi in alcune condizioni)
    if      QryAllTIPO.AsString = 'F - impianti termici' then TipoDoc := 'F'
    else if QryAllTIPO.AsString = 'G - impianti termici' then TipoDoc := 'G'
    else Exit;
    // -------------------------------------------------------------------------
    // Dati intervento/controllo
    // -------------------------------------------------------------------------
    // Tipo documento
    if      QryAllTIPO.AsString = 'F - impianti termici' then Result := 'F'
    else if QryAllTIPO.AsString = 'G - impianti termici' then Result := 'G'
    else Exit;
    // Continua
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllDATACONTROLLO.AsDateTime);  // Data controllo
    Result := Result + SEP + LeftStr(Trim(QryAllBOLLINO_PREFISSO.AsString) ,4);  // Anno autocertificazione o prefisso bollino
    Result := Result + SEP + LeftStr(Trim(QryAllBOLLINO_NUMERO.AsString) ,20);  // Numero autocertificazione o numero bollino
    Result := Result + SEP;  // Rifiuta autocertificazione
    Result := Result + SEP;  // Data pagamento autocerficazione (bollino) se diversa dalla data del controllo
    Result := Result + SEP + QryAllPERIODICITA.AsString;   // Periodicità con sui si esegue la manutenzione
    Result := Result + SEP + LeftStr(Trim(QryAllID.AsString) ,20);   // Numero rapporto
    Result := Result + SEP + LeftStr(Trim(QryAllCODICECATASTO.AsString) ,20);   // Codice catasto
    Result := Result + SEP + LeftStr(Trim(QryAllTECNICO_NOMECOGNOME.AsString) ,80);  // Nome Tecnico
    Result := Result + SEP;  // Firma privacy (P=Presente)
    Result := Result + SEP + FormatDateTime('hhnn', QryAllDATAORAARRIVO.AsDateTime);  // Ora arrivo
    Result := Result + SEP + FormatDateTime('hhnn', QryAllDATAORAPARTENZA.AsDateTime);  // Ora partenza
    // -------------------------------------------------------------------------
    // Indirizzo installazione impianto / occupante
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllRAGSOCRESPIMP.AsString) ,60);   // RagSoc o Cognome
    Result := Result + SEP;  // Nome
    // Indirizzo
    T1 := ''; T2 := '';
    ScomponiIndirizzo(QryAllINDIRIZZOIMM.AsString, T1, T2);
    Result := Result + SEP + LeftStr(T1 ,20);   // Tipologia toponimo (Viale, Via, Piazza ecc.)
    Result := Result + SEP + LeftStr(T2 ,80);   // Toponimo (indirizzo)
    // Numero civico con esponente separato
    NumCivicoToNumCivicoEsponente(QryAllNUMCIVICOIMM.AsString, T1, T2);
    Result := Result + SEP + T1;   // Civico
    Result := Result + SEP + LeftStr(T2 ,10);   // Esponente civico
    // Continua
    Result := Result + SEP + LeftStr(Trim(QryAllINTERNOIMM.AsString) ,10);   // Interno
    Result := Result + SEP + LeftStr(Trim(QryAllPIANOIMM.AsString) ,10);   // Piano
    Result := Result + SEP + LeftStr(Trim(QryAllSCALAIMM.AsString) ,10);   // Scala
    Result := Result + SEP + LeftStr(Trim(QryAllPALAZZOIMM.AsString) ,10);  // Palazzo
    Result := Result + SEP + LeftStr(Trim(QryAllCAPIMM.AsString) ,10);   // CAP
    Result := Result + SEP + LeftStr(Trim(QryAllCOMUNEIMM.AsString) ,80);   // Comune
    Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIAIMM.AsString) ,2);   // Provincia
    // Codici ISTAT comune e provincia solo se certificati da stradario
    if QryAllCOMPUTED_STR_CERTIFIED_IMM.AsString = 'T' then begin
      // I primi 3 caratteri del codice istat del comune sono il codice della provincia, gli ultimi 3 quello del comune
      T1 := Trim(QryAllCODICEISTATCOMUNEIMM.AsString);
      T2 := LeftStr(T1, 3);
      T3 := RightStr(T1, 3);
      Result := Result + SEP + T2;   // Codice ISTAT provincia
      Result := Result + SEP + T3;   // Codice ISTAT comune
    end else begin
      Result := Result + SEP;   // Codice ISTAT provincia
      Result := Result + SEP;   // Codice ISTAT comune
    end;
    // Continua
    Result := Result + SEP + LeftStr(Trim(QryAllZONAIMM.AsString) ,80);   // Zona/Quartiere/Frazione
    Result := Result + SEP + LeftStr(Trim(QryAllTELEFONORESPIMP.AsString) ,20);   // Telefono
    Result := Result + SEP + LeftStr(Trim(QryAllCELLULARERESPIMP.AsString) ,20);   // Telefono2 (cellulare)
    Result := Result + SEP;   // Partita IVA
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEFISCALERESPIMP.AsString) ,16);   // Codice Fiscale
    Result := Result + SEP;   // Firma privacy
    // -------------------------------------------------------------------------
    // Proprietario
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllPROPDENOMINAZIONE.AsString) ,60);   // RagSoc o Cognome
    Result := Result + SEP;  // Nome
    // Indirizzo
    T1 := ''; T2 := '';
    ScomponiIndirizzo(QryAllPROPINDIRIZZO.AsString, T1, T2);
    Result := Result + SEP + LeftStr(T1 ,20);   // Tipologia toponimo (Viale, Via, Piazza ecc.)
    Result := Result + SEP + LeftStr(T2 ,80);   // Toponimo (indirizzo)
    // Numero civico con esponente separato
    NumCivicoToNumCivicoEsponente(QryAllPROPNUMCIVICO.AsString, T1, T2);
    Result := Result + SEP + T1;   // Civico
    Result := Result + SEP + LeftStr(T2 ,10);   // Esponente civico
    // Continua
    Result := Result + SEP;  // Interno
    Result := Result + SEP;  // Piano
    Result := Result + SEP;  // Scala
    Result := Result + SEP;  // Numero appartamento / palazzina
    Result := Result + SEP + LeftStr(Trim(QryAllPROPCAP.AsString) ,10);   // CAP
    Result := Result + SEP + LeftStr(Trim(QryAllPROPLOCALITA.AsString) ,80);   // Comune
    Result := Result + SEP + LeftStr(Trim(QryAllPROPPROVINCIA.AsString) ,2);   // Provincia
    // Codici ISTAT comune e provincia solo se certificati da stradario
    if QryAllCOMPUTED_STR_CERTIFIED_PROP.AsString = 'T' then begin
      // I primi 3 caratteri del codice istat del comune sono il codice della provincia, gli ultimi 3 quello del comune
      T1 := Trim(QryAllPROPCODICEISTATCOMUNE.AsString);
      T2 := LeftStr(T1, 3);
      T3 := RightStr(T1, 3);
      Result := Result + SEP + T2;   // Codice ISTAT provincia
      Result := Result + SEP + T3;   // Codice ISTAT comune
    end else begin
      Result := Result + SEP;   // Codice ISTAT provincia
      Result := Result + SEP;   // Codice ISTAT comune
    end;
    // Continua
    Result := Result + SEP;   // Zona/Quartiere/Frazione
    Result := Result + SEP + LeftStr(Trim(QryAllPROPTELEFONO.AsString) ,20);   // Telefono
    Result := Result + SEP + LeftStr(Trim(QryAllPROPCELLULARE.AsString) ,20);   // Telefono2 (cellulare)
    Result := Result + SEP;   // Partita IVA
    Result := Result + SEP + LeftStr(Trim(QryAllPROPCODICEFISCALE.AsString) ,16);   // Codice Fiscale
    // -------------------------------------------------------------------------
    // Terzo responsabile
    // -------------------------------------------------------------------------
    // NB: Se il responsabile dell'impianto è come terzo responsabile compila i seguenti campi
    //      altrimenti li lascia vuoti.
    if Trim(QryAllINQUALITADIRESPIMP.AsString) = 'Terzo responsabile' then begin
      Result := Result + SEP + LeftStr(Trim(QryAllRAGSOCRESPIMP.AsString) ,60);   // RagSoc o Cognome
      Result := Result + SEP;  // Nome
      // Indirizzo
      T1 := ''; T2 := '';
      ScomponiIndirizzo(QryAllINDIRIZZORESPIMP.AsString, T1, T2);
      Result := Result + SEP + LeftStr(T1 ,20);   // Tipologia toponimo (Viale, Via, Piazza ecc.)
      Result := Result + SEP + LeftStr(T2 ,80);   // Toponimo (indirizzo)
      // Numero civico con esponente separato
      NumCivicoToNumCivicoEsponente(QryAllNUMCIVICORESPIMP.AsString, T1, T2);
      Result := Result + SEP + T1;   // Civico
      Result := Result + SEP + LeftStr(T2 ,10);   // Esponente civico
      // Continua
      Result := Result + SEP;  // Interno
      Result := Result + SEP;  // Piano
      Result := Result + SEP;  // Scala
      Result := Result + SEP;  // Numero appartamento / palazzina
      Result := Result + SEP + LeftStr(Trim(QryAllCAPRESPIMP.AsString) ,10);   // CAP
      Result := Result + SEP + LeftStr(Trim(QryAllCITTARESPIMP.AsString) ,80);   // Comune
      Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIARESPIMP.AsString) ,2);   // Provincia
      // Codici ISTAT comune e provincia solo se certificati da stradario
      if QryAllCOMPUTED_STR_CERTIFIED_RESPIMP.AsString = 'T' then begin
        // I primi 3 caratteri del codice istat del comune sono il codice della provincia, gli ultimi 3 quello del comune
        T1 := Trim(QryAllCODICEISTATCOMUNERESPIMP.AsString);
        T2 := LeftStr(T1, 3);
        T3 := RightStr(T1, 3);
        Result := Result + SEP + T2;   // Codice ISTAT provincia
        Result := Result + SEP + T3;   // Codice ISTAT comune
      end else begin
        Result := Result + SEP;   // Codice ISTAT provincia
        Result := Result + SEP;   // Codice ISTAT comune
      end;
      // Continua
      Result := Result + SEP;   // Zona/Quartiere/Frazione
      Result := Result + SEP + LeftStr(Trim(QryAllTELEFONORESPIMP.AsString) ,20);   // Telefono
      Result := Result + SEP + LeftStr(Trim(QryAllCELLULARERESPIMP.AsString) ,20);   // Telefono2 (cellulare)
      Result := Result + SEP;   // Partita IVA
      Result := Result + SEP + LeftStr(Trim(QryAllCODICEFISCALERESPIMP.AsString) ,16);   // Codice Fiscale
    end else begin
      // Sono 20 campi
      for i := 1 to 20 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Generatore di calore
    // -------------------------------------------------------------------------
    Result := Result + SEP;   // Codice marca
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_COSTRUTTORE.AsString) ,80);  // Marca / produttore
    Result := Result + SEP;   // Codice famiglia / serie produzione
    Result := Result + SEP;   // Famiglia / serie produzione
    Result := Result + SEP;   // Codice modello
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_MODELLO.AsString) ,80); // Modello
    Result := Result + SEP;   // Codice combustibile (L=Legna, P=Pellet, TR=Teleriscaldamento)
    // Combustibile
    T1 := Trim(QryAllGENCAL_COMBUSTIBILE.AsString);
    if T1 <> 'Altro'
    then Result := Result + SEP + LeftStr(T1 ,80)
    else Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_COMBUSTIBILEALTRO.AsString) ,80);
    // Tiraggio
    T1 := Trim(QryAllGENCAL_TIPOTIRAGGIO.AsString);
    T2 := '';
    if      (T1 = 'Naturale') then T2 := 'N'
    else if (T1 = 'Forzato')  then T2 := 'F';
    Result := Result + SEP + T2;
    // Tipologia (camera)
    T1 := Trim(QryAllGENCAL_TIPOCAMERA.AsString);
    T2 := '';
    if      (T1 = 'Tipo A') then T2 := 'A'
    else if (T1 = 'Tipo B') then T2 := 'B'
    else if (T1 = 'Tipo C') then T2 := 'C';
    Result := Result + SEP + T2;
    // Continua
    Result := Result + SEP + TFN_to_SNX(QryAllGENCAL_RISCALDAMENTO.AsString);  // Uso riscaldamento
    Result := Result + SEP + TFN_to_SNX(QryAllGENCAL_ACQUASANITARIA.AsString);  // Uso acqua calda sanitaria
    Result := Result + SEP;  // Altro uso
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_MATRICOLA.AsString) ,30);  // Matricola
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_ANNOCOSTRUZIONE.AsString) ,4);  // Anno costruzione
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_UBICAZIONE.AsString) ,80);  // Locale installazione
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllGENCAL_DATAINSTALLAZIONE.AsDateTime);  // Data installazione
    Result := Result + SEP;  // Data collaudo
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICAFOCOLARE.AsFloat, 1);   // Potenza termica al focolare
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICA.AsFloat, 1);   // Potenza nominale utile
    Result := Result + SEP + StelleEfficEnergetica(QryAllGENCAL_MARCAEFFICENERGETICA.AsString);
    if TipoDoc = 'F' then   Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_TIPOLOGIA.AsString) ,60)   else Result := Result + SEP;
    if TipoDoc = 'F' then   Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_FLUIDOTERMOVETTORE.AsString) ,20)   else Result := Result + SEP;
    // -------------------------------------------------------------------------
    // Bruciatore abbinato (solo allegato F)
    // -------------------------------------------------------------------------
    if TipoDoc = 'F' then begin
      Result := Result + SEP;   // Codice costruttore
      Result := Result + SEP + LeftStr(Trim(QryAllBRUC_COSTRUTTORE.AsString) ,80);
      Result := Result + SEP;   // Codice modello
      Result := Result + SEP + LeftStr(Trim(QryAllBRUC_MODELLO.AsString) ,80);
      Result := Result + SEP + LeftStr(Trim(QryAllBRUC_MATRICOLA.AsString) ,30);
      Result := Result + SEP + LeftStr(Trim(QryAllBRUC_ANNOCOSTRUZIONE.AsString) ,4);
      Result := Result + SEP + LeftStr(Trim(QryAllBRUC_TIPOLOGIA.AsString) ,60);
      Result := Result + SEP + DM1.VirgolaPunto(QryAllBRUC_CAMPOFUNZIONAMENTO2.AsFloat, 1);  // Campo funzionamento max
    end else begin
      // Sono 8 campi
      for i := 1 to 8 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Installatore (solo per schede prima accensione)
    // -------------------------------------------------------------------------
    // Sono 21 campi
    for i := 1 to 21 do Result := Result + SEP;
    // -------------------------------------------------------------------------
    // Analisi fumi
    // -------------------------------------------------------------------------
    // Effettuata Si/No
    T1 := Trim(QryAllANFUMI_EFFETTUATO.AsString);
    Result := Result + SEP + TFN_to_SNX(T1);
    // Valori analisi fumi se effettuato altrimenti vuoto
    if T1 = 'T' then begin
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPFUMI.AsFloat, 1);  // Temp fumi
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPAMBIENTE.AsFloat, 1);  // Temp ambiente
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_O2_PERC.AsFloat, 1);  // % O2
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO2_PERC.AsFloat, 1);  // % CO2
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_BACHARACH_NUM.AsFloat, 0);  // Bacharach
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO_PPM.AsFloat, 0);  // CO ppm
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_RENDIMENTO_PERC.AsFloat, 1);  // Rendimento
      Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TIRAGGIO_PA.AsFloat, 0);  // Tiraggio pa
    end else begin
      Result := Result + SEP;  // Temp fumi
      Result := Result + SEP;  // Temp ambiente
      Result := Result + SEP;  // % O2
      Result := Result + SEP;  // % CO2
      Result := Result + SEP;  // Bacharach
      Result := Result + SEP;  // CO ppm
      Result := Result + SEP;  // Rendimento
      Result := Result + SEP;  // Tiraggio pa
    end;
    // -------------------------------------------------------------------------
    // Checks allegato G
    // -------------------------------------------------------------------------
    // Se è un allegato G compila i seguenti campi
    if (TipoDoc = 'G') then begin
      Result := Result + SEP + TFN_to_SNNC(QryAllB_DICHCONFIMP.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllB_LIBRETTOIMPIANTO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllB_LIBRUSOCALD.AsString);
      Result := Result + SEP + TFN_to_SNES(QryAllC_IDONLOCALEINSTALLAZ.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllC_ADEGDIMENSVENTILAZ.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllC_APERTVENTILAZLIBERE.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllD_PENDENZACORRETTA.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllD_SEZIONICORRETTE.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllD_CURVECORRETTE.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllD_LUNGHEZZACORRETTA.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllD_BUONOSTATOCONSERVAZ.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllE_SCARICOCAMINOSINGOLO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllE_SCARICOCANNAFUMCOLLRAMIF.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllE_APPSCARICAAPARETE.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllE_NORIFLUSSIFUMILOCALE.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllE_NOPERDITECONDOTTISCARICO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_UGELLIPULITI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_DISPROMPITIRAGGIONODETERIOR.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_SCAMBLATOFUMOPULITO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_ACCENSFUNZAMREGOLARI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_VALVOLASICUREZZASOVRAPRESS.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_VASOESPANSIONECARICO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_DISPSICUREZZANONMANOMESSI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_CIRCUITOARIAPULITO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_GUARNIZACCOPIAMINTEGRA.AsString);
      Result := Result + SEP + TFN_to_SNNA(QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString);
      Result := Result + SEP + TFN_to_SNNA(QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString);
      Result := Result + SEP + TFN_to_SNNA(QryAllG_ESAMEVISIVOCAMINO.AsString);
    // Se NON è un allegato G li lascia vuoti
    end else begin
      // Sono 31 campi
      for i := 1 to 31 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Checks allegato F
    // -------------------------------------------------------------------------
    // Se è un allegato F compila i seguenti campi
    if (TipoDoc = 'F') then begin
      Result := Result + SEP + TFN_to_SNNC(QryAllB_LIBRETTOIMPIANTO.AsString);
      Result := Result + SEP + Trim(QryAllB_LIBRETTOIMPIANTO_NOTE.AsString);

      Result := Result + SEP + TFN_to_SNNC(QryAllB_RAPPCONTRTECN10435.AsString);
      Result := Result + SEP + Trim(QryAllB_RAPPCONTRTECN10435_NOTE.AsString);

      Result := Result + SEP + TFN_to_SNNC(QryAllB_CERTUNI8364.AsString);
      Result := Result + SEP + Trim(QryAllB_CERTUNI8364_NOTE.AsString);

      Result := Result + SEP + TFN_to_SNNC(QryAllB_DICHCONFIMP.AsString);
      Result := Result + SEP + Trim(QryAllB_DICHCONFIMP_NOTE.AsString);

      Result := Result + SEP + TFN_to_SNNC(QryAllB_LIBRUSOBRUCIATORE.AsString);
      Result := Result + SEP + Trim(QryAllB_LIBRUSOBRUCIATORE_NOTE.AsString);

      Result := Result + SEP + TFN_to_SNNC(QryAllB_LIBRUSOCALD.AsString);
      Result := Result + SEP + Trim(QryAllB_LIBRUSOCALD_NOTE.AsString);

      Result := Result + SEP + TFN_to_SNNC(QryAllB_PRATICAISPESL.AsString);
      Result := Result + SEP + Trim(QryAllB_PRATICAISPESL_NOTE.AsString);

      Result := Result + SEP + TFN_to_SNNC(QryAllB_CERTPREVINCENDI.AsString);
      Result := Result + SEP + Trim(QryAllB_CERTPREVINCENDI_NOTE.AsString);
      // ---
      Result := Result + SEP + TFN_to_SNNC(QryAllC_IDONLOCALEINSTALLAZ.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllC_ADEGDIMENSVENTILAZ.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllC_APERTVENTILAZLIBERE.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllC_ESAMEVISIVOLINEEELETTRICHE.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_UGELLIPULITI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllC_BRUCFUNZIONAMCORRETTO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_SCAMBLATOFUMOPULITO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_ACCENSFUNZAMREGOLARI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_DISPSICUREZZANONMANOMESSI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_VASOESPANSIONECARICO.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString);
      Result := Result + SEP + TFN_to_SNNC(QryAllG_ESAMEVISIVOCAMINO.AsString);
    // Se NON è un allegato F li lascia vuoti
    end else begin
      // Sono 32 campi
      for i := 1 to 32 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Osservazioni / Raccomandazioni
    // -------------------------------------------------------------------------
    Result := Result + SEP + Trim(QryAllOSSERVAZIONI.AsString);
    Result := Result + SEP + Trim(QryAllRACCOMANDAZIONI.AsString);
    Result := Result + SEP + Trim(QryAllPRESCRIZIONI.AsString);
    Result := Result + SEP + TFN_to_SNNC(QryAllIMPPUOFUNZIONARE.AsString);
    // -------------------------------------------------------------------------
    // Tecnico
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEMANUTENTORE.AsString) ,10);  // Codice manutentore assegnato dall'ente di controllo al manutentore convenzionato
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaRAGIONESOCIALE.AsString) ,60);  // Cognome o Ragione Sociale
    Result := Result + SEP;  // Nome
    // Indirizzo
    T1 := ''; T2 := '';
    ScomponiIndirizzo(DM1.TableDatiAziendaINDIRIZZO.AsString, T1, T2);
    Result := Result + SEP + LeftStr(T1 ,20);   // Tipologia toponimo (Viale, Via, Piazza ecc.)
    Result := Result + SEP + LeftStr(T2 ,80);   // Toponimo (indirizzo)
    // Numero civico con esponente separato
    NumCivicoToNumCivicoEsponente(DM1.TableDatiAziendaNUMCIVICO.AsString, T1, T2);
    Result := Result + SEP + T1;   // Civico
    Result := Result + SEP + LeftStr(T2 ,10);   // Esponente civico
    // Continua
    Result := Result + SEP;  // Interno
    Result := Result + SEP;  // Piano
    Result := Result + SEP;  // Scala
    Result := Result + SEP;  // Numero appartamento / palazzina
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCAP.AsString) ,10);
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCITTA.AsString) ,80);
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaPROVINCIA.AsString) ,2);
    Result := Result + SEP;  // Codice ISTAT provincia
    Result := Result + SEP;  // Codice ISTAT comune
    Result := Result + SEP;  // Quartiere / frazione
    Result := Result + SEP;  // Zona / Quartiere / Frazione
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaTELEFONO.AsString) ,20);  // Telefono 1
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCELLULARE.AsString) ,20);  // Telefono 2
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaP_IVA.AsString) ,20);  // Partita IVA
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCODICEFISCALE.AsString) ,16);  // Codice fiscale
    // -------------------------------------------------------------------------
  finally
    // Pulizie finali
    QryAll.Close;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - PROCEDURA DI ESPORTAZIONE ALLEGATI F/G SIENA
// =============================================================================









// =============================================================================
// INIZIO - PROCEDURA DI ESPORTAZIONE ALLEGATI G VESTASOFT
// -----------------------------------------------------------------------------
function TExportAllegatiManutForm.Export_AllegatoG_Vestasoft(ID:Integer): String;
const
  SEP = '|';
  DATE_FORMAT = 'yyyymmdd';
var
  T1, T2, T3: String; // Stringhe temporanee di appoggio
  i: Integer;
  TipoDoc: String;
begin
  // Inizializzazione
  Result := '';
  // IMposta query per dati allegato
  QryAll.Close;
  QryAll.Prepare;
  QryAll.Params.ParamByName('P_ID').AsInteger := ID;
  QryAll.Open;
  try
    // Determinazione tipo documento (Serve a valorizzare 'TipoDoc' da usare poi in alcune condizioni)
    if      QryAllTIPO.AsString = 'F - impianti termici' then TipoDoc := 'F'
    else if QryAllTIPO.AsString = 'G - impianti termici' then TipoDoc := 'G'
    else Exit;
    // -------------------------------------------------------------------------
    // Dati impianto
    // -------------------------------------------------------------------------
    Result := Result + LeftStr(Trim(QryAllCODICECATASTO.AsString) ,20);   // Codice catasto
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllDATACONTROLLO.AsDateTime);  // Data controllo
    Result := Result + SEP;  // Esito controllo (P=Positico, N=Negativo, default null)
    Result := Result + SEP + TFN_to_SN(QryAllIMPPUOFUNZIONARE.AsString);
    // Data installazione impianto (NB: se vuola mettere 01/01/1900 nel formato 19000101)
    if (not QryAllDATAINSTALLAZIONEIMPIANTO.IsNull) and (QryAllDATAINSTALLAZIONEIMPIANTO.Value <> 0)
    then Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllDATAINSTALLAZIONEIMPIANTO.AsDateTime)
    else Result := Result + SEP + '19000101';
    // Impianto autonomo/centralizzato (0=Non noto, A=Autonomo, C=Centralizzato)
    T1 := Trim(QryAllAUTONOMOCENTRALIZZATO.AsString);
    T2 := '';
    if      (T1='Autonomo') then T2 := 'A'
    else if (T1='Centralizzato') then T2 := 'C'
    else T2 := '0';
    // Continua
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_ID.AsFloat, 0);   // Progressivo generatore
    Result := Result + SEP + 'G';  // Tipo documento
    Result := Result + SEP + FormatDateTime('hh:nn', QryAllDATAORAARRIVO.AsDateTime);  // Ora arrivo
    Result := Result + SEP + FormatDateTime('hh:nn', QryAllDATAORAPARTENZA.AsDateTime);  // Ora partenza
    Result := Result + SEP;  // Data scadenza dichiarazione
    Result := Result + SEP + LeftStr(Trim(QryAllID.AsString) ,20);   // Numero rapporto
    Result := Result + SEP;  // Numero di protocollo
    Result := Result + SEP;  // Data protocollo
    // -------------------------------------------------------------------------
    // Generatori di calore
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_MATRICOLA.AsString) ,20);  // Matricola
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_MODELLO.AsString) ,20); // Modello
    // Combustibile
    T1 := Trim(QryAllGENCAL_COMBUSTIBILE.AsString);
    T2 := '';
    if      (T1 = 'Gas di rete')        then T2 := 'METANO'
    else if (T1 = 'Gasolio')            then T2 := 'GASOLIO'
    else if (T1 = 'GPL')                then T2 := 'GPL'
    else if (T1 = 'Kerosene')           then T2 := 'KEROSENE'
    else if (T1 = 'Olio combustibile')  then T2 := 'OLIO'
    else if (T1 = 'Altro')              then T2 := Trim(QryAllGENCAL_COMBUSTIBILEALTRO.AsString);
    Result := Result + SEP + T2;
    // Scarico fumi generatore
    T1 := Trim(QryAllE_SCARICOCAMINOSINGOLO.AsString);
    T2 := Trim(QryAllE_SCARICOCANNAFUMCOLLRAMIF.AsString);
    T3 := Trim(QryAllE_APPSCARICAAPARETE.AsString);
    if      (T1 = 'T') then Result := Result + SEP + 'I'
    else if (T2 = 'T') then Result := Result + SEP + 'C'
    else if (T3 = 'T') then Result := Result + SEP + 'P'
    else Result := Result + SEP + '0';
    // Tiraggio
    T1 := Trim(QryAllGENCAL_TIPOTIRAGGIO.AsString);
    T2 := '';
    if      (T1 = 'Naturale') then T2 := 'N'
    else if (T1 = 'Forzato')  then T2 := 'F';
    Result := Result + SEP + T2;
    // Fluido termovettore
    T1 := Uppercase(Trim(QryAllGENCAL_FLUIDOTERMOVETTORE.AsString));
    T2 := '';
    if      (LeftStr(T1,4) = 'ARIA') or (LeftStr(T1,3) = 'AIR')   then   T2 := '2'
    else if (LeftStr(T1,5) = 'ACQUA') or (LeftStr(T1,3) = 'H2O')  then   T2 := '1'
    else    T2 := '3';
    Result := Result + SEP + T2;
    // Data di costruzione del generatore
    T1 := Trim(QryAllGENCAL_ANNOCOSTRUZIONE.AsString);
    if Length(T1) = 4 then T1 := T1 + '0101' else T1 := '';
    Result := Result + SEP + T1;
    // Destinazione d'uso
    T1 := Trim(QryAllGENCAL_RISCALDAMENTO.AsString);
    T2 := Trim(QryAllGENCAL_ACQUASANITARIA.AsString);
    T3 := '';
    if      (T1 = 'T') and (T2 = 'T') then T3 := 'E'
    else if (T1 = 'T') then T3 := 'R'
    else if (T2 = 'T') then T3 := 'A'
    else T3 := 'X';
    Result := Result + SEP + T3;
    // Tipologia (camera)
    T1 := Trim(QryAllGENCAL_TIPOCAMERA.AsString);
    T2 := '';
    if      (T1 = 'Tipo C') then T2 := 'C'
    else if (T1 = 'Tipo B') then T2 := 'A';
    Result := Result + SEP + T2;
    // Tipo locale di installazione
    T1 := Uppercase(Trim(QryAllGENCAL_UBICAZIONE.AsString));
    T2 := '';
    if      (RightStr(T1,7) = 'TECNICO') then T2 := 'T'
    else if (RightStr(T1,7) = 'ESTERNO') then T2 := 'E'
    else if (RightStr(T1,7) = 'INTERNO') then T2 := 'I';
    Result := Result + SEP + T2;
    // Continua
    Result := Result + SEP + StelleEfficEnergetica(QryAllGENCAL_MARCAEFFICENERGETICA.AsString);
    // -------------------------------------------------------------------------
    // Manutentore  (dell'azienda manutentrice, non dello specifico tecnico)
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEMANUTENTORE.AsString) ,8);  // Codice manutentore
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaRAGIONESOCIALE.AsString) ,100);  // Cognome o Ragione Sociale
    Result := Result + SEP;  // Nome
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaINDIRIZZO.AsString) ,40);  // Indirizzo
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCITTA.AsString) ,40);  // Comune
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaTELEFONO.AsString) ,15);  // Telefono
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCAP.AsString) ,5);  // CAP
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCODICEFISCALE.AsString) ,16);  // COdice fiscale (al momento p.IVA perchè non ho il codice fiscale
    // -------------------------------------------------------------------------
    // Responsabile dell'impianto
    // -------------------------------------------------------------------------
    Result := Result + SEP;  // Nome
    Result := Result + SEP + LeftStr(Trim(QryAllRAGSOCRESPIMP.AsString) ,100);   // RagSoc o cognome
    // Indirizzo (compreso di numero civico
    T1 := Trim(QryAllINDIRIZZORESPIMP.AsString);
    T2 := Trim(QryAllNUMCIVICORESPIMP.AsString);
    T3 := T1;
    if (T1 <> '') and (T2 <> '') then T3 := T3 + ' ' + T2;
    Result := Result + SEP + LeftStr(T3 ,40);
    // Continua
    Result := Result + SEP + LeftStr(Trim(QryAllCITTARESPIMP.AsString) ,40);   // Città
    Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIARESPIMP.AsString) ,4);   // Provincia
    Result := Result + SEP;  // Natura giuridica (G=Giuridica, F=Fisica)
    Result := Result + SEP + LeftStr(Trim(QryAllCAPRESPIMP.AsString) ,5);   // Cap
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEFISCALERESPIMP.AsString) ,16);   // Codice fiscale
    Result := Result + SEP + LeftStr(Trim(QryAllTELEFONORESPIMP.AsString) ,15);   // Telefono
    // -------------------------------------------------------------------------
    // Utente / Occupante
    // -------------------------------------------------------------------------
    // NB: Se il responsabile dell'impianto è come Utente / Occupante compila i seguenti campi
    //      altrimenti li lascia vuoti.
    if Trim(QryAllINQUALITADIRESPIMP.AsString) = 'Occupante' then begin
      Result := Result + SEP;  // Nome
      Result := Result + SEP + LeftStr(Trim(QryAllRAGSOCRESPIMP.AsString) ,100);   // RagSoc o cognome
      // Indirizzo (compreso di numero civico
      T1 := Trim(QryAllINDIRIZZORESPIMP.AsString);
      T2 := Trim(QryAllNUMCIVICORESPIMP.AsString);
      T3 := T1;
      if (T1 <> '') and (T2 <> '') then T3 := T3 + ' ' + T2;
      Result := Result + SEP + LeftStr(T3 ,40);
      // Continua
      Result := Result + SEP + LeftStr(Trim(QryAllCITTARESPIMP.AsString) ,40);   // Città
      Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIARESPIMP.AsString) ,4);   // Provincia
      Result := Result + SEP;  // Natura giuridica (G=Giuridica, F=Fisica)
      Result := Result + SEP + LeftStr(Trim(QryAllCAPRESPIMP.AsString) ,5);   // Cap
      Result := Result + SEP + LeftStr(Trim(QryAllCODICEFISCALERESPIMP.AsString) ,16);   // Codice fiscale
      Result := Result + SEP + LeftStr(Trim(QryAllTELEFONORESPIMP.AsString) ,15);   // Telefono
    end else begin
      // Sono 9 campi
      for i := 1 to 9 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Proprietario
    // -------------------------------------------------------------------------
    Result := Result + SEP;  // Nome
    Result := Result + SEP + LeftStr(Trim(QryAllPROPDENOMINAZIONE.AsString) ,100);   // RagSoc o cognome
    // Indirizzo (compreso di numero civico
    T1 := Trim(QryAllPROPINDIRIZZO.AsString);
    T2 := Trim(QryAllPROPNUMCIVICO.AsString);
    T3 := T1;
    if (T1 <> '') and (T2 <> '') then T3 := T3 + ' ' + T2;
    Result := Result + SEP + LeftStr(T3 ,40);
    // Continua
    Result := Result + SEP + LeftStr(Trim(QryAllPROPLOCALITA.AsString) ,40);   // Città
    Result := Result + SEP + LeftStr(Trim(QryAllPROPPROVINCIA.AsString) ,4);   // Provincia
    Result := Result + SEP;  // Natura giuridica (G=Giuridica, F=Fisica)
    Result := Result + SEP + LeftStr(Trim(QryAllPROPCAP.AsString) ,5);   // Cap
    Result := Result + SEP + LeftStr(Trim(QryAllPROPCODICEFISCALE.AsString) ,16);   // Codice fiscale
    Result := Result + SEP + LeftStr(Trim(QryAllPROPTELEFONO.AsString) ,15);   // Telefono
    // -------------------------------------------------------------------------
    // Intestatario (penso del contatore che non ho)
    // -------------------------------------------------------------------------
    // Sono 9 campi
    for i := 1 to 9 do Result := Result + SEP;
    // -------------------------------------------------------------------------
    // Checks allegato G
    // -------------------------------------------------------------------------
    Result := Result + SEP + TFN_to_SNC(QryAllB_DICHCONFIMP.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllB_LIBRETTOIMPIANTO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllB_LIBRUSOCALD.AsString);
    Result := Result + SEP + TFN_to_SNE(QryAllC_IDONLOCALEINSTALLAZ.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_RAPPCONTRTECN10435.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_CERTUNI8364.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_LIBRUSOBRUCIATORE.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_PRATICAISPESL.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_CERTPREVINCENDI.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllC_ESAMEVISIVOLINEEELETTRICHE.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllC_BRUCFUNZIONAMCORRETTO.AsString);
    Result := Result + SEP + TFN_to_SNE(QryAllC_IDONLOCALEINSTALLAZ.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllC_ADEGDIMENSVENTILAZ.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllC_APERTVENTILAZLIBERE.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllD_PENDENZACORRETTA.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllD_SEZIONICORRETTE.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllD_CURVECORRETTE.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllD_LUNGHEZZACORRETTA.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllD_BUONOSTATOCONSERVAZ.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllE_SCARICOCAMINOSINGOLO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllE_APPSCARICAAPARETE.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllE_NORIFLUSSIFUMILOCALE.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllE_NOPERDITECONDOTTISCARICO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_UGELLIPULITI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_DISPROMPITIRAGGIONODETERIOR.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_SCAMBLATOFUMOPULITO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_ACCENSFUNZAMREGOLARI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_VALVOLASICUREZZASOVRAPRESS.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_VASOESPANSIONECARICO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_DISPSICUREZZANONMANOMESSI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_CIRCUITOARIAPULITO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_GUARNIZACCOPIAMINTEGRA.AsString);
    Result := Result + SEP + TFN_to_PNA(QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString);
    Result := Result + SEP + TFN_to_PNA(QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString);
    Result := Result + SEP + TFN_to_PNA(QryAllG_ESAMEVISIVOCAMINO.AsString);
    // -------------------------------------------------------------------------
    // Analisi fumi
    // -------------------------------------------------------------------------
    // Effettuata Si/No
    T1 := Trim(QryAllANFUMI_EFFETTUATO.AsString);
    Result := Result + SEP + TFN_to_SN(T1);
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPFUMI.AsFloat, 2);  // Temp fumi
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPAMBIENTE.AsFloat, 2);  // Temp ambiente
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_O2_PERC.AsFloat, 2);  // % O2
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO2_PERC.AsFloat, 2);  // % CO2
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_BACHARACH_NUM.AsFloat, 2);  // Bacharach
    Result := Result + SEP + 'ppm';  // Unità di misura del CO
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO_PPM.AsFloat, 4);  // CO ppm
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_RENDIMENTO_PERC.AsFloat, 2);  // Rendimento
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TIRAGGIO_PA.AsFloat, 2);  // Tiraggio pa
    // -------------------------------------------------------------------------
    // Osservazioni / Raccomandazioni
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllOSSERVAZIONI.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllRACCOMANDAZIONI.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllPRESCRIZIONI.AsString) ,4000);
    // -------------------------------------------------------------------------
    // Altri dati vari
    // -------------------------------------------------------------------------
    Result := Result + SEP;  // Data utile intervento
    Result := Result + SEP;  // Delega responsabile = Nominativo del delegato dal responsabile
    Result := Result + SEP;  // Delega manutentore = Nominativo del delegato dal manutentore
    // Numero del bollino
    T1 := Trim(QryAllBOLLINO_PREFISSO.AsString);
    T2 := Trim(QryAllBOLLINO_NUMERO.AsString);
    if (T1 <> '') and (T2 <> '') then T3 := '-' else T3 := '';
    Result := Result + SEP + T1 + T3 + T2;
    // Continua
    Result := Result + SEP;  // Costo del bollino / dichiarazione / certificazione
    Result := Result + SEP;  // Tipo di pagamento
    Result := Result + SEP;  // Riferimenti pagamento
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICA.AsFloat, 2);   // Potenza nominale utile
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICAFOCOLARE.AsFloat, 2);   // Potenza termica al focolare
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_VOLUMETRIARISC.AsFloat, 2);   // Volumetria riscaldata
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_CONSUMI1_M3KG.AsFloat, 2);   // Consumi stagione corrente (1)
    Result := Result + SEP;  // Data inserimento
    Result := Result + SEP;  // Data modifica
    Result := Result + SEP;  // Utente inserimento
    Result := Result + SEP;  // Anomalie
    // -------------------------------------------------------------------------
    // Indirizzo installazione impianto
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllCOMUNEIMM.AsString) ,40);   // Comune
    // Indirizzo
    T1 := ''; T2 := '';
    ScomponiIndirizzo(QryAllINDIRIZZOIMM.AsString, T1, T2);
    Result := Result + SEP + LeftStr(T1 ,40);   // Tipologia toponimo (Viale, Via, Piazza ecc.)
    Result := Result + SEP + LeftStr(T2 ,50);   // Toponimo (indirizzo)
    // Numero civico con esponente separato
    NumCivicoToNumCivicoEsponente(QryAllNUMCIVICOIMM.AsString, T1, T2);
    Result := Result + SEP + Leftstr(T1 ,8);   // Civico
    Result := Result + SEP + LeftStr(T2 ,3);   // Esponente civico
    Result := Result + SEP + LeftStr(Trim(QryAllSCALAIMM.AsString) ,5);   // Scala
    Result := Result + SEP + LeftStr(Trim(QryAllPIANOIMM.AsString) ,5);   // Piano
    Result := Result + SEP + LeftStr(Trim(QryAllINTERNOIMM.AsString) ,5);   // Interno
    Result := Result + SEP + LeftStr(Trim(QryAllPALAZZOIMM.AsString) ,40);  // Palazzo
    Result := Result + SEP + LeftStr(Trim(QryAllCOMUNEIMM.AsString) ,40);   // Comune (denominazione ISTAT)
    Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIAIMM.AsString) ,40);   // Provincia
    Result := Result + SEP + LeftStr(Trim(QryAllCAPIMM.AsString) ,5);   // CAP
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_COSTRUTTORE.AsString) ,35);  // Marca / produttore
    // -------------------------------------------------------------------------
    // Altri dati vari
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEOPERATOREMANUTENTORE.AsString) ,16);  // Codice operatore manutentore
    Result := Result + SEP + TFN_to_SNC(QryAllE_SCARICOCANNAFUMCOLLRAMIF.AsString);
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_CONSUMI2_M3KG.AsFloat, 2);   // Consumi stagione precedente (2)
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_CONSUMI1_STAGIONE.AsString) ,40);  // Stagione termica attuale (1)
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_CONSUMI2_STAGIONE.AsString) ,40);  // Stagione termica precedente (2)
    Result := Result + SEP + 'A';  // Stato impianto (A=Attivo, N=Non attivo, L=Annullato, D=Da definire, R=Rottamato)
    Result := Result + SEP;  // Data rottamazione impianto
    // Data installazione impianto/generatore (NB: se vuola mettere 01/01/1900 nel formato 19000101)
    if (not QryAllGENCAL_DATAINSTALLAZIONE.IsNull) and (QryAllGENCAL_DATAINSTALLAZIONE.Value <> 0)
    then Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllGENCAL_DATAINSTALLAZIONE.AsDateTime)
    else Result := Result + SEP + '19000101';
    // Continua
    Result := Result + SEP;  // Data rottamazione generatore
    Result := Result + SEP + 'S';  // Generatore attivo (S=si, N=no)
    // Tipologia responsabile
    T1 := QryAllINQUALITADIRESPIMP.AsString;
    T2 := '';
    if      (T1 = 'Occupante')          then T2 := 'O'
    else if (T1 = 'Proprietario')       then T2 := 'P'
    else if (T1 = 'Terzo responsabile') then T2 := 'T'
    else if (T1 = 'Amministratore')     then T2 := 'A';
    Result := Result + SEP + T2;
    // -------------------------------------------------------------------------
  finally
    // Pulizie finali
    QryAll.Close;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - PROCEDURA DI ESPORTAZIONE ALLEGATI G VESTASOFT
// =============================================================================





// =============================================================================
// INIZIO - PROCEDURA DI ESPORTAZIONE ALLEGATI F VESTASOFT
// -----------------------------------------------------------------------------
function TExportAllegatiManutForm.Export_AllegatoF_Vestasoft(ID:Integer): String;
const
  SEP = '|';
  DATE_FORMAT = 'yyyymmdd';
var
  T1, T2, T3: String; // Stringhe temporanee di appoggio
  i: Integer;
  TipoDoc: String;
begin
  // Inizializzazione
  Result := '';
  // IMposta query per dati allegato
  QryAll.Close;
  QryAll.Prepare;
  QryAll.Params.ParamByName('P_ID').AsInteger := ID;
  QryAll.Open;
  try
    // Determinazione tipo documento (Serve a valorizzare 'TipoDoc' da usare poi in alcune condizioni)
    if      QryAllTIPO.AsString = 'F - impianti termici' then TipoDoc := 'F'
    else if QryAllTIPO.AsString = 'G - impianti termici' then TipoDoc := 'G'
    else Exit;
    // -------------------------------------------------------------------------
    // Dati impianto
    // -------------------------------------------------------------------------
    Result := Result + LeftStr(Trim(QryAllCODICECATASTO.AsString) ,20);   // Codice catasto
    Result := Result + SEP + DM1.VirgolaPunto(QryAllIMPIANTO_NUMTOTGENERATORI.AsFloat ,0);  // Numero totale dei generatori di calore presenti nell'impianto
    Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllDATACONTROLLO.AsDateTime);  // Data controllo
    Result := Result + SEP + TFN_to_SN(QryAllIMPPUOFUNZIONARE.AsString);
    // Data installazione impianto (NB: se vuola mettere 01/01/1900 nel formato 19000101)
    if (not QryAllDATAINSTALLAZIONEIMPIANTO.IsNull) and (QryAllDATAINSTALLAZIONEIMPIANTO.Value <> 0)
    then Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllDATAINSTALLAZIONEIMPIANTO.AsDateTime)
    else Result := Result + SEP + '19000101';
    // Impianto autonomo/centralizzato (0=Non noto, A=Autonomo, C=Centralizzato)
    T1 := Trim(QryAllAUTONOMOCENTRALIZZATO.AsString);
    T2 := '';
    if      (T1='Autonomo') then T2 := 'A'
    else if (T1='Centralizzato') then T2 := 'C'
    else T2 := '0';
    // Continua
    Result := Result + SEP + 'A';  // Stato impianto (A=Attivo, N=Non attivo, L=Annullato, D=Da definire, R=Rottamato)
    Result := Result + SEP;  // Data rottamazione impianto
    Result := Result + SEP + DM1.VirgolaPunto(QryAllIMPIANTO_POTENZATERMICAFOCTOT.AsFloat, 2);   // Potenza termica al focolare TOTALE DELL'IMPIANTO
    Result := Result + SEP + 'F';  // Tipo documento
    Result := Result + SEP + FormatDateTime('hh:nn', QryAllDATAORAARRIVO.AsDateTime);  // Ora arrivo
    Result := Result + SEP + FormatDateTime('hh:nn', QryAllDATAORAPARTENZA.AsDateTime);  // Ora partenza
    Result := Result + SEP + LeftStr(Trim(QryAllID.AsString) ,20);   // Numero rapporto
    Result := Result + SEP;  // Numero di protocollo
    Result := Result + SEP;  // Data protocollo
    // -------------------------------------------------------------------------
    // Generatori di calore
    // -------------------------------------------------------------------------
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_ID.AsFloat, 0);   // Progressivo generatore
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_MATRICOLA.AsString) ,20);  // Matricola
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_MODELLO.AsString) ,20); // Modello
    // Combustibile
    T1 := Trim(QryAllGENCAL_COMBUSTIBILE.AsString);
    T2 := '';
    if      (T1 = 'Gas di rete')        then T2 := 'METANO'
    else if (T1 = 'Gasolio')            then T2 := 'GASOLIO'
    else if (T1 = 'GPL')                then T2 := 'GPL'
    else if (T1 = 'Kerosene')           then T2 := 'KEROSENE'
    else if (T1 = 'Olio combustibile')  then T2 := 'OLIO'
    else if (T1 = 'Altro')              then T2 := Trim(QryAllGENCAL_COMBUSTIBILEALTRO.AsString);
    Result := Result + SEP + T2;
    // Scarico fumi generatore
    T1 := Trim(QryAllE_SCARICOCAMINOSINGOLO.AsString);
    T2 := Trim(QryAllE_SCARICOCANNAFUMCOLLRAMIF.AsString);
    T3 := Trim(QryAllE_APPSCARICAAPARETE.AsString);
    if      (T1 = 'T') then Result := Result + SEP + 'I'
    else if (T2 = 'T') then Result := Result + SEP + 'C'
    else if (T3 = 'T') then Result := Result + SEP + 'P'
    else Result := Result + SEP + '0';
    // Tiraggio
    T1 := Trim(QryAllGENCAL_TIPOTIRAGGIO.AsString);
    T2 := '';
    if      (T1 = 'Naturale') then T2 := 'N'
    else if (T1 = 'Forzato')  then T2 := 'F';
    Result := Result + SEP + T2;
    // Fluido termovettore
    T1 := Uppercase(Trim(QryAllGENCAL_FLUIDOTERMOVETTORE.AsString));
    T2 := '';
    if      (LeftStr(T1,4) = 'ARIA') or (LeftStr(T1,3) = 'AIR')   then   T2 := '2'
    else if (LeftStr(T1,5) = 'ACQUA') or (LeftStr(T1,3) = 'H2O')  then   T2 := '1'
    else    T2 := '3';
    Result := Result + SEP + T2;
    // Data di costruzione del generatore
    T1 := Trim(QryAllGENCAL_ANNOCOSTRUZIONE.AsString);
    if Length(T1) = 4 then T1 := T1 + '0101' else T1 := '';
    Result := Result + SEP + T1;
    // Destinazione d'uso
    T1 := Trim(QryAllGENCAL_RISCALDAMENTO.AsString);
    T2 := Trim(QryAllGENCAL_ACQUASANITARIA.AsString);
    T3 := '';
    if      (T1 = 'T') and (T2 = 'T') then T3 := 'E'
    else if (T1 = 'T') then T3 := 'R'
    else if (T2 = 'T') then T3 := 'A'
    else T3 := 'X';
    Result := Result + SEP + T3;
    // Tipologia (camera)
    T1 := Trim(QryAllGENCAL_TIPOCAMERA.AsString);
    T2 := '';
    if      (T1 = 'Tipo C') then T2 := 'C'
    else if (T1 = 'Tipo B') then T2 := 'A';
    Result := Result + SEP + T2;
    // Tipo locale di installazione
    T1 := Uppercase(Trim(QryAllGENCAL_UBICAZIONE.AsString));
    T2 := '';
    if      (RightStr(T1,7) = 'TECNICO') then T2 := 'T'
    else if (RightStr(T1,7) = 'ESTERNO') then T2 := 'E'
    else if (RightStr(T1,7) = 'INTERNO') then T2 := 'I';
    Result := Result + SEP + T2;
    // Continua
    Result := Result + SEP + StelleEfficEnergetica(QryAllGENCAL_MARCAEFFICENERGETICA.AsString);
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_COSTRUTTORE.AsString) ,35);  // Marca / produttore
    Result := Result + SEP + LeftStr(Trim(QryAllBRUC_COSTRUTTORE.AsString) ,35);  // Marca / produttore (bruciatore)
    Result := Result + SEP + LeftStr(Trim(QryAllBRUC_MODELLO.AsString) ,40);  // Modello (bruciatore)
    Result := Result + SEP + LeftStr(Trim(QryAllBRUC_MATRICOLA.AsString) ,35);  // Matricola (bruciatore)
    // Tipo di bruciatore
    T1 := Uppercase(Trim(QryAllBRUC_TIPOLOGIA.AsString));
    T2 := '';
    if      (RightStr(T1,7) = 'ATMOSFERICO')    then T2 := 'A'
    else if (RightStr(T1,7) = 'PRESSURIZZATO')  then T2 := 'P'
    else if (RightStr(T1,7) = 'PREMISCELATO')   then T2 := 'M';
    Result := Result + SEP + T2;
    // Data di costruzione del bruciatore
    T1 := Trim(QryAllBRUC_ANNOCOSTRUZIONE.AsString);
    if Length(T1) = 4 then T1 := T1 + '0101' else T1 := '';
    Result := Result + SEP + T1;
    // Data installazione generatore di calore (NB: se vuola mettere 01/01/1900 nel formato 19000101)
    if (not QryAllGENCAL_DATAINSTALLAZIONE.IsNull) and (QryAllGENCAL_DATAINSTALLAZIONE.Value <> 0)
    then Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllGENCAL_DATAINSTALLAZIONE.AsDateTime)
    else Result := Result + SEP + '19000101';
    // Continua
    Result := Result + SEP;  // Data rottamazione generatore
    Result := Result + SEP + 'S';  // Generatore attivo (S=si, N=no)
    // Data installazione BRUCIATORE (NB: se vuola mettere 01/01/1900 nel formato 19000101)
    if (not QryAllBRUC_DATAINSTALLAZIONE.IsNull) and (QryAllBRUC_DATAINSTALLAZIONE.Value <> 0)
    then Result := Result + SEP + FormatDateTime(DATE_FORMAT, QryAllBRUC_DATAINSTALLAZIONE.AsDateTime)
    else Result := Result + SEP + '19000101';
    // Continua
    Result := Result + SEP;  // Data rottamazione bruciatore
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICAFOCOLARE.AsFloat, 2);   // Potenza termica al focolare
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICA.AsFloat, 2);   // Potenza nominale utile
    // -------------------------------------------------------------------------
    // Manutentore  (dell'azienda manutentrice, non dello specifico tecnico)
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEMANUTENTORE.AsString) ,8);  // Codice manutentore
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaRAGIONESOCIALE.AsString) ,100);  // Cognome o Ragione Sociale
    Result := Result + SEP;  // Nome
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaINDIRIZZO.AsString) ,40);  // Indirizzo
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCITTA.AsString) ,40);  // Comune
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaTELEFONO.AsString) ,15);  // Telefono
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCAP.AsString) ,5);  // CAP
    Result := Result + SEP + LeftStr(Trim(DM1.TableDatiAziendaCODICEFISCALE.AsString) ,16);  // COdice fiscale (al momento p.IVA perchè non ho il codice fiscale
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEOPERATOREMANUTENTORE.AsString) ,16);  // Codice operatore manutentore
    // -------------------------------------------------------------------------
    // Responsabile dell'impianto
    // -------------------------------------------------------------------------
    Result := Result + SEP;  // Nome
    Result := Result + SEP + LeftStr(Trim(QryAllRAGSOCRESPIMP.AsString) ,100);   // RagSoc o cognome
    // Indirizzo (compreso di numero civico
    T1 := Trim(QryAllINDIRIZZORESPIMP.AsString);
    T2 := Trim(QryAllNUMCIVICORESPIMP.AsString);
    T3 := T1;
    if (T1 <> '') and (T2 <> '') then T3 := T3 + ' ' + T2;
    Result := Result + SEP + LeftStr(T3 ,40);
    // Continua
    Result := Result + SEP + LeftStr(Trim(QryAllCITTARESPIMP.AsString) ,40);   // Città
    Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIARESPIMP.AsString) ,4);   // Provincia
    Result := Result + SEP;  // Natura giuridica (G=Giuridica, F=Fisica)
    Result := Result + SEP + LeftStr(Trim(QryAllCAPRESPIMP.AsString) ,5);   // Cap
    Result := Result + SEP + LeftStr(Trim(QryAllCODICEFISCALERESPIMP.AsString) ,16);   // Codice fiscale
    Result := Result + SEP + LeftStr(Trim(QryAllTELEFONORESPIMP.AsString) ,15);   // Telefono
    // -------------------------------------------------------------------------
    // Utente / Occupante
    // -------------------------------------------------------------------------
    // NB: Se il responsabile dell'impianto è come Utente / Occupante compila i seguenti campi
    //      altrimenti li lascia vuoti.
    if Trim(QryAllINQUALITADIRESPIMP.AsString) = 'Occupante' then begin
      Result := Result + SEP;  // Nome
      Result := Result + SEP + LeftStr(Trim(QryAllRAGSOCRESPIMP.AsString) ,100);   // RagSoc o cognome
      // Indirizzo (compreso di numero civico
      T1 := Trim(QryAllINDIRIZZORESPIMP.AsString);
      T2 := Trim(QryAllNUMCIVICORESPIMP.AsString);
      T3 := T1;
      if (T1 <> '') and (T2 <> '') then T3 := T3 + ' ' + T2;
      Result := Result + SEP + LeftStr(T3 ,40);
      // Continua
      Result := Result + SEP + LeftStr(Trim(QryAllCITTARESPIMP.AsString) ,40);   // Città
      Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIARESPIMP.AsString) ,4);   // Provincia
      Result := Result + SEP;  // Natura giuridica (G=Giuridica, F=Fisica)
      Result := Result + SEP + LeftStr(Trim(QryAllCAPRESPIMP.AsString) ,5);   // Cap
      Result := Result + SEP + LeftStr(Trim(QryAllCODICEFISCALERESPIMP.AsString) ,16);   // Codice fiscale
      Result := Result + SEP + LeftStr(Trim(QryAllTELEFONORESPIMP.AsString) ,15);   // Telefono
    end else begin
      // Sono 9 campi
      for i := 1 to 9 do Result := Result + SEP;
    end;
    // -------------------------------------------------------------------------
    // Proprietario
    // -------------------------------------------------------------------------
    Result := Result + SEP;  // Nome
    Result := Result + SEP + LeftStr(Trim(QryAllPROPDENOMINAZIONE.AsString) ,100);   // RagSoc o cognome
    // Indirizzo (compreso di numero civico
    T1 := Trim(QryAllPROPINDIRIZZO.AsString);
    T2 := Trim(QryAllPROPNUMCIVICO.AsString);
    T3 := T1;
    if (T1 <> '') and (T2 <> '') then T3 := T3 + ' ' + T2;
    Result := Result + SEP + LeftStr(T3 ,40);
    // Continua
    Result := Result + SEP + LeftStr(Trim(QryAllPROPLOCALITA.AsString) ,40);   // Città
    Result := Result + SEP + LeftStr(Trim(QryAllPROPPROVINCIA.AsString) ,4);   // Provincia
    Result := Result + SEP;  // Natura giuridica (G=Giuridica, F=Fisica)
    Result := Result + SEP + LeftStr(Trim(QryAllPROPCAP.AsString) ,5);   // Cap
    Result := Result + SEP + LeftStr(Trim(QryAllPROPCODICEFISCALE.AsString) ,16);   // Codice fiscale
    Result := Result + SEP + LeftStr(Trim(QryAllPROPTELEFONO.AsString) ,15);   // Telefono
    // -------------------------------------------------------------------------
    // Intestatario (penso del contatore che non ho)
    // -------------------------------------------------------------------------
    // Sono 9 campi
    for i := 1 to 9 do Result := Result + SEP;
    // -------------------------------------------------------------------------
    // Indirizzo installazione impianto
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllCOMUNEIMM.AsString) ,40);   // Comune
    // Indirizzo
    T1 := ''; T2 := '';
    ScomponiIndirizzo(QryAllINDIRIZZOIMM.AsString, T1, T2);
    Result := Result + SEP + LeftStr(T1 ,40);   // Tipologia toponimo (Viale, Via, Piazza ecc.)
    Result := Result + SEP + LeftStr(T2 ,50);   // Toponimo (indirizzo)
    // Numero civico con esponente separato
    NumCivicoToNumCivicoEsponente(QryAllNUMCIVICOIMM.AsString, T1, T2);
    Result := Result + SEP + Leftstr(T1 ,8);   // Civico
    Result := Result + SEP + LeftStr(T2 ,3);   // Esponente civico
    // Continua
    Result := Result + SEP + LeftStr(Trim(QryAllSCALAIMM.AsString) ,5);   // Scala
    Result := Result + SEP + LeftStr(Trim(QryAllPIANOIMM.AsString) ,5);   // Piano
    Result := Result + SEP + LeftStr(Trim(QryAllINTERNOIMM.AsString) ,5);   // Interno
    Result := Result + SEP + LeftStr(Trim(QryAllPALAZZOIMM.AsString) ,40);  // Palazzo
    Result := Result + SEP + LeftStr(Trim(QryAllCOMUNEIMM.AsString) ,40);   // Comune (denominazione ISTAT)
    Result := Result + SEP + LeftStr(Trim(QryAllPROVINCIAIMM.AsString) ,40);   // Provincia
    Result := Result + SEP + LeftStr(Trim(QryAllCAPIMM.AsString) ,5);   // CAP
    // -------------------------------------------------------------------------
    // Altri dati vari
    // -------------------------------------------------------------------------
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_CONSUMI1_M3KG.AsFloat, 2);   // Consumi stagione corrente (1)
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_CONSUMI2_M3KG.AsFloat, 2);   // Consumi stagione precedente (2)
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_CONSUMI1_STAGIONE.AsString) ,40);  // Stagione termica attuale (1)
    Result := Result + SEP + LeftStr(Trim(QryAllGENCAL_CONSUMI2_STAGIONE.AsString) ,40);  // Stagione termica precedente (2)
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_VOLUMETRIARISC.AsFloat, 2);   // Volumetria riscaldata
    // -------------------------------------------------------------------------
    // Checks allegato F
    // -------------------------------------------------------------------------
    Result := Result + SEP + TFN_to_SN(QryAllB_LIBRETTOIMPIANTO.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_RAPPCONTRTECN10435.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_CERTUNI8364.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_DICHCONFIMP.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_LIBRUSOCALD.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_LIBRUSOBRUCIATORE.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_SCHEMIFUNZIDRAUL.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_SCHEMIFUNZELETTR.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_PRATICAISPESL.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllB_CERTPREVINCENDI.AsString);
    Result := Result + SEP + LeftStr(Trim(QryAllB_SCHEMIFUNZIDRAUL_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_SCHEMIFUNZELETTR_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_LIBRETTOIMPIANTO_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_RAPPCONTRTECN10435_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_CERTUNI8364_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_DICHCONFIMP_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_LIBRUSOCALD_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_LIBRUSOBRUCIATORE_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_PRATICAISPESL_NOTE.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllB_CERTPREVINCENDI_NOTE.AsString) ,4000);
    Result := Result + SEP + TFN_to_SNE(QryAllC_IDONLOCALEINSTALLAZ.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllC_ADEGDIMENSVENTILAZ.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllC_APERTVENTILAZLIBERE.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllC_ESAMEVISIVOLINEEELETTRICHE.AsString);
    Result := Result + SEP + TFN_to_PN(QryAllG_CONTROLLOASSENZAFUGHEGAS.AsString);
    Result := Result + SEP + TFN_to_PNA(QryAllG_ESAMEVISIVOCOIBENTAZIONI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllG_ESAMEVISIVOCAMINO.AsString);
    Result := Result + SEP + DM1.VirgolaPunto(QryAllGENCAL_POTENZATERMICA.AsFloat, 2);   // Potenza nominale utile
    Result := Result + SEP + TFN_to_SNC(QryAllF_UGELLIPULITI.AsString);
    Result := Result + SEP + TFN_to_SN(QryAllC_BRUCFUNZIONAMCORRETTO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_SCAMBLATOFUMOPULITO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_DISPCOMANDOREGOLAZFUNZCORR.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_DISPSICUREZZANONMANOMESSI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_ORGSOGGSOLLECITAZTERMINTEGRI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_ACCENSFUNZAMREGOLARI.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_ASSENZAPERDITEOSSIDAZRACC.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllF_VASOESPANSIONECARICO.AsString);
    Result := Result + SEP + TFN_to_SNC(QryAllE_NOPERDITECONDOTTISCARICO.AsString);
    // -------------------------------------------------------------------------
    // Analisi fumi
    // -------------------------------------------------------------------------
    // Effettuata Si/No
    T1 := Trim(QryAllANFUMI_EFFETTUATO.AsString);
    Result := Result + SEP + TFN_to_SN(T1);
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPFUMI.AsFloat, 2);  // Temp fumi
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TEMPAMBIENTE.AsFloat, 2);  // Temp ambiente
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_O2_PERC.AsFloat, 2);  // % O2
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO2_PERC.AsFloat, 2);  // % CO2
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_BACHARACH_NUM.AsFloat, 2);  // Bacharach
    Result := Result + SEP + 'ppm';  // Unità di misura del CO
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_CO_PPM.AsFloat, 4);  // CO ppm
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_RENDIMENTO_PERC.AsFloat, 2);  // Rendimento
    Result := Result + SEP + DM1.VirgolaPunto(QryAllANFUMI_TIRAGGIO_PA.AsFloat, 2);  // Tiraggio pa
    // -------------------------------------------------------------------------
    // Osservazioni / Raccomandazioni
    // -------------------------------------------------------------------------
    Result := Result + SEP + LeftStr(Trim(QryAllOSSERVAZIONI.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllRACCOMANDAZIONI.AsString) ,4000);
    Result := Result + SEP + LeftStr(Trim(QryAllPRESCRIZIONI.AsString) ,4000);
    // -------------------------------------------------------------------------
    // Altri dati vari
    // -------------------------------------------------------------------------
    Result := Result + SEP;  // Costo del bollino / dichiarazione / certificazione
    Result := Result + SEP;  // Tipo di pagamento
    Result := Result + SEP;  // Riferimenti pagamento
    Result := Result + SEP;  // Anomalie
    // Tipologia responsabile
    T1 := QryAllINQUALITADIRESPIMP.AsString;
    T2 := '';
    if      (T1 = 'Occupante')          then T2 := 'O'
    else if (T1 = 'Proprietario')       then T2 := 'P'
    else if (T1 = 'Terzo responsabile') then T2 := 'T'
    else if (T1 = 'Amministratore')     then T2 := 'A';
    Result := Result + SEP + T2;
    // -------------------------------------------------------------------------
  finally
    // Pulizie finali
    QryAll.Close;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - PROCEDURA DI ESPORTAZIONE ALLEGATI F VESTASOFT
// =============================================================================






























































// =============================================================================
// INIZIO - FUNZIONI DI CONVERSIONE DI CAMPI PER EXPORT
// -----------------------------------------------------------------------------
// Procedura che scompone un indirizzo in due campi distinti: La tipologia del toponimo se presente
//  e il nome del toponimo stesso.
procedure TExportAllegatiManutForm.ScomponiIndirizzo(InputStr:String; var TipoToponimo, Toponimo: String);
var
  FirstSpacePos: Integer;
  TempStr: String;
begin
  // Inizializzazione
  Toponimo := '';
  TipoToponimo := '';
  InputStr := Trim(InputStr);
  Toponimo := InputStr;
  // Cerca il primo spazio in modo poi di ricavare il tipo toponimo supponendo
  //  ovviamente che sia la prima parola
  FirstSpacePos := Pos(' ', InputStr);
  // Se non c'è alcuno spazio ritorna tutto come Toponimo (Tipo toponimo non c'è) ed esce
  if FirstSpacePos = 0 then Exit;
  // Altrimenti carica la prima parola (quella prima dello spazio trovato) nel  TipoToponimo
  TempStr := Uppercase(Trim(LeftStr(InputStr, FirstSpacePos-1)));
  // Se quanto trovato prima del primo spazio corrisponde ad un tipo toponimo da quelli elencati
  //  ritorna il Tipo così trovato separatamente dal Toponimo altrimenti ritorna tutto nel Toponimo.
  if (TempStr = 'BORGO') or (TempStr = 'B.GO') or (TempStr = 'B/GO')
  or (TempStr = 'CONTRADA') or (TempStr = 'C.DA') or (TempStr = 'C/DA')
  or (TempStr = 'CORSO') or (TempStr = 'C.SO') or (TempStr = 'C/SO')
  or (TempStr = 'CORTE') or (TempStr = 'C.TE') or (TempStr = 'C/TE')
  or (TempStr = 'GALLERIA')
  or (TempStr = 'GIARDINI')
  or (TempStr = 'LARGO') or (TempStr = 'L.GO') or (TempStr = 'L/GO')
  or (TempStr = 'LUNGO')
  or (TempStr = 'LUNGOFIUME')
  or (TempStr = 'LUNGOLAGO')
  or (TempStr = 'LOCALITA''') or (TempStr = 'LOCALITA') or (TempStr = Uppercase('località')) or (TempStr = 'LOC') or (TempStr = 'LOC.') or (TempStr = 'LOC.TA') or (TempStr = 'LOC.TA''') or (TempStr = Uppercase('loc.tà'))
  or (TempStr = 'PARCO')
  or (TempStr = 'PIAZZA') or (TempStr = 'P.ZZA') or (TempStr = 'P/ZZA') or (TempStr = 'P.ZA') or (TempStr = 'P/ZA')
  or (TempStr = 'PIAZZALE') or (TempStr = 'P.LE') or (TempStr = 'P/LE')
  or (TempStr = 'PORTICI')
  or (TempStr = 'STATALE')
  or (TempStr = 'STRADA') or (TempStr = 'S.DA') or (TempStr = 'S/DA')
  or (TempStr = 'VIA')
  or (TempStr = 'VIALE') or (TempStr = 'V.LE') or (TempStr = 'V/LE')
  or (TempStr = 'VICOLO') or (TempStr = 'V.LO') or (TempStr = 'V/LO')
  then begin
    TipoToponimo := TempStr;
    Toponimo := Trim(RightStr(InputStr, Length(InputStr)-FirstSpacePos));
  end;
end;

// Pocedura che converte una stringa ricevuta e contenente un numero civico in due stringhe
//  contenenti una la parte numerica e l'altra l'eventuale parte alfabetica e simbolica
procedure TExportAllegatiManutForm.NumCivicoToNumCivicoEsponente(InputStr:String; var N, A: String);
var
  i: Integer;
  C: Char;
begin
  // Azzeramento iniziale (IMPORTANTE!!!!)
  N := '';
  A := '';
  // Cicla per tutti i caratteri
  for i := 1 to Length(InputStr) do begin
    // Preleva il carattere corrente
    C := InputStr[i];
    // Se è una cifra numerica lo mette nella parte numerica altrimenti in quella alfabetica
    if (Ord(C) >= 48) and (Ord(C) <= 57)
    then N := N + C
    else A := A + C;
  end;
  // Elimina eventuali spazi inifiali/finali dalla parte alfabetica
  A := Trim(A);
end;

// Funzione che restituisce solo i caratteri che sono delle cifre numeriche
function TExportAllegatiManutForm.OnlyNumChar(InputStr:String): String;
var
  i: Integer;
  C: Char;
begin
  // Cicla per tutti i caratteri
  for i := 1 to Length(InputStr) do begin
    // Preleva il carattere corrente
    C := InputStr[i];
    // Se è una cifra numerica lo mette nella parte numerica altrimenti in quella alfabetica
    if (Ord(C) >= 48) and (Ord(C) <= 57)
    then Result := Result + C;
  end;
end;

// FUnzione che converte i miei valori T (True), F (False), N (non effettuato) in S o N o X
function TExportAllegatiManutForm.TFN_to_SNX(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'N' then Result := 'X'
  else Result := 'N';
end;

// FUnzione che converte i miei valori T (True), F (False), N (non effettuato) in S o N o NC
function TExportAllegatiManutForm.TFN_to_SNNC(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'N' then Result := 'NC'
  else Result := 'N';
end;

function TExportAllegatiManutForm.TFN_to_SNC(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'N' then Result := 'C'
  else Result := 'N';
end;

function TExportAllegatiManutForm.TFN_to_SNE(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'N' then Result := 'E'
  else Result := 'N';
end;

function TExportAllegatiManutForm.TFN_to_SNA(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'N' then Result := 'A'
  else Result := 'N';
end;

function TExportAllegatiManutForm.TFN_to_PNA(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'P'
  else if Trim(InStr) = 'N' then Result := 'A'
  else Result := 'N';
end;

// FUnzione che converte i miei valori T (True), F (False), N (non effettuato) in S o N oppure ''
function TExportAllegatiManutForm.TFN_to_SN(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'F' then Result := 'N'
  else Result := '';
end;

function TExportAllegatiManutForm.TFN_to_PN(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'P'
  else if Trim(InStr) = 'F' then Result := 'N'
  else Result := '';
end;

// FUnzione che converte i miei valori T (True), F (False), N (non effettuato) in S o N o NA
function TExportAllegatiManutForm.TFN_to_SNNA(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'N' then Result := 'NA'
  else Result := 'N';
end;

// FUnzione che converte i miei valori T (True), F (False), N (non effettuato) in S o N o ES
function TExportAllegatiManutForm.TFN_to_SNES(InStr:String): String;
begin
  if      Trim(InStr) = 'T' then Result := 'S'
  else if Trim(InStr) = 'N' then Result := 'ES'
  else Result := 'N';
end;

// Funzione che rielabora le stelle relative alla marcatura del generatore di calore
//  in modo che ritorni sempre un numero di una cifra indicante il numero di stelle
function TExportAllegatiManutForm.StelleEfficEnergetica(InStr:String): String;
var
  C: Char;
begin
  // Inizializzazione
  InStr := Trim(InStr);
  // Se è vuota esce subito altrimenti da un errore
  if InStr = '' then Exit;
  // Se il primo carattere è una cifra numerica ritorna quella cifra
  C := InStr[1];
  if (Ord(C) >= 48) and (Ord(C) <= 57) then begin
    Result := C;
    Exit;
  end;
  // Altrimenti ritorna la lunghezza della stringa stessa
  Result := IntToStr(Length(InStr));
end;

// Questa funzione ritorna una stringa con tutte le note relative alla parte di tutti i checks dell'allegato
//  questo perchè nel modello della Vanzotech c'è un solo campo note.
function TExportAllegatiManutForm.ComponiNoteChecks: String;
var
  TmpStr: String;
begin
  // Note B1
  TmpStr := Trim(QryAllB_LIBRETTOIMPIANTO_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B2
  TmpStr := Trim(QryAllB_RAPPCONTRTECN10435_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B3
  TmpStr := Trim(QryAllB_CERTUNI8364_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B4
  TmpStr := Trim(QryAllB_DICHCONFIMP_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B5
  TmpStr := Trim(QryAllB_LIBRUSOBRUCIATORE_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B6
  TmpStr := Trim(QryAllB_LIBRUSOCALD_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B7
  TmpStr := Trim(QryAllB_PRATICAISPESL_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B8
  TmpStr := Trim(QryAllB_CERTPREVINCENDI_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B9
  TmpStr := Trim(QryAllB_SCHEMIFUNZIDRAUL_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
  // Note B10
  TmpStr := Trim(QryAllB_SCHEMIFUNZELETTR_NOTE.AsString);
  if (Result <> '') and (TmpStr <> '') then TmpStr := '-' + TmpStr;
  Result := Result + TmpStr;
end;
// -----------------------------------------------------------------------------
// FINE - FUNZIONI DI CONVERSIONE DI CAMPI PER EXPORT
// =============================================================================

















procedure TExportAllegatiManutForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ExportAllegatiManutForm := nil;
end;

procedure TExportAllegatiManutForm.tvListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Size := 7;
end;

procedure TExportAllegatiManutForm.FilterEnteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  // Se viene premuto il pulsante INVIO preme il pulsante di avvio
  if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
end;

procedure TExportAllegatiManutForm.PratMesiTuttiClick(Sender: TObject);
begin
  inherited;
   FilterDal.EditText := DM1.FilterDataDalDefault;
   FilterAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if PratMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      PratGen.GroupIndex := 701;
      PratFeb.GroupIndex := 702;
      PratMar.GroupIndex := 703;
      PratApr.GroupIndex := 704;
      PratMag.GroupIndex := 705;
      PratGiu.GroupIndex := 706;
      PratLug.GroupIndex := 707;
      PratAgo.GroupIndex := 708;
      PratSet.GroupIndex := 709;
      PratOtt.GroupIndex := 710;
      PratNov.GroupIndex := 711;
      PratDic.GroupIndex := 712;
      PratGen.Down   := False;
      PratFeb.Down   := False;
      PratMar.Down   := False;
      PratApr.Down   := False;
      PratMag.Down   := False;
      PratGiu.Down   := False;
      PratLug.Down   := False;
      PratAgo.Down   := False;
      PratSet.Down   := False;
      PratOtt.Down   := False;
      PratNov.Down   := False;
      PratDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      PratMesiTutti.Tag := 0;
//   end;
end;

procedure TExportAllegatiManutForm.PratMesiTuttiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PratMesiTuttiClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TExportAllegatiManutForm.PratMesiNessunoClick(Sender: TObject);
begin
  inherited;
   FilterDal.Clear;
   FilterAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   PratGen.GroupIndex := 700;
   PratFeb.GroupIndex := 700;
   PratMar.GroupIndex := 700;
   PratApr.GroupIndex := 700;
   PratMag.GroupIndex := 700;
   PratGiu.GroupIndex := 700;
   PratLug.GroupIndex := 700;
   PratAgo.GroupIndex := 700;
   PratSet.GroupIndex := 700;
   PratOtt.GroupIndex := 700;
   PratNov.GroupIndex := 700;
   PratDic.GroupIndex := 700;
   PratGen.Down   := False;
   PratFeb.Down   := False;
   PratMar.Down   := False;
   PratApr.Down   := False;
   PratMag.Down   := False;
   PratGiu.Down   := False;
   PratLug.Down   := False;
   PratAgo.Down   := False;
   PratSet.Down   := False;
   PratOtt.Down   := False;
   PratNov.Down   := False;
   PratDic.Down   := False;
end;

procedure TExportAllegatiManutForm.PratMesiNessunoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PratMesiNessunoClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TExportAllegatiManutForm.PratGenClick(Sender: TObject);
var
   GG, MM, AA: Word;
   Mese:Shortint;
begin
  inherited;
   // Mese contiene l'indice del mese premuto
   Mese := (Sender as TSpeedButton).Tag;
   // AA COntiene l'anno in corso
   DecodeDate(Date, AA, MM, GG);
   // Se il GroupIndex è <> 600 significa che è stato premuto il
   //  tasto di selezione di tutti i mesi e quindi si comporta di conseguenza
   if (Sender as TSpeedButton).GroupIndex <> 600 then begin
      PratMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            FilterDal.EditText := ' 01/01/' + IntToStr(AA);
            FilterAl.EditText  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            FilterDal.EditText := ' 01/02/' + IntToStr(AA);
            FilterAl.EditText  := ' ' + IntToStr(DaysInAMonth(CurrentYear, 2)) + '/02/' + IntToStr(AA);
         end;
         3:begin
            FilterDal.EditText := ' 01/03/' + IntToStr(AA);
            FilterAl.EditText  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            FilterDal.EditText := ' 01/04/' + IntToStr(AA);
            FilterAl.EditText  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            FilterDal.EditText := ' 01/05/' + IntToStr(AA);
            FilterAl.EditText  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            FilterDal.EditText := ' 01/06/' + IntToStr(AA);
            FilterAl.EditText  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            FilterDal.EditText := ' 01/07/' + IntToStr(AA);
            FilterAl.EditText  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            FilterDal.EditText := ' 01/08/' + IntToStr(AA);
            FilterAl.EditText  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            FilterDal.EditText := ' 01/09/' + IntToStr(AA);
            FilterAl.EditText  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            FilterDal.EditText := ' 01/10/' + IntToStr(AA);
            FilterAl.EditText  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            FilterDal.EditText := ' 01/11/' + IntToStr(AA);
            FilterAl.EditText  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            FilterDal.EditText := ' 01/12/' + IntToStr(AA);
            FilterAl.EditText  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      FilterDal.Text := '';
      FilterAl.Text  := '';
   end;
end;

procedure TExportAllegatiManutForm.PratGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      PratGenClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TExportAllegatiManutForm.FormShow(Sender: TObject);
begin
  inherited;

  // Apre la query di lookup dell'ente di riferimento
  QryEntiLookup.Open;
end;

procedure TExportAllegatiManutForm.EseguiQuery;
var
  CommaPos: Integer;
  EnteID, EnteTracciato:String;
begin
  // Chiude la query
  Q.Close;
  // Verifica se i filtri sono impostati in modo appropriato altrimenti
  //  non prosegue per evitare dati incoerenti con i filtri stessi
  if (Trim(FilterEnte.EditText) = '') then begin
    Exit;
  end;
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    // IMposta la query
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM ALLEGATI_MANUT_EXPORT_LIST_VIEW');
    Q.SQL.Add('WHERE');
    Q.SQL.Add('1=1');
    // Filtro per Ente e Tracciato
    GetIdEnteTracciato(EnteID, EnteTracciato);
    // Imposta i filtri per ente e tracciato
    if  (Trim(EnteID)<>'') and (Trim(EnteTracciato)<>'') then begin
      Q.SQL.Add('AND ENTE_ID = ' + EnteID);
      Q.SQL.Add('AND ENTE_TRACCIATO = ' + QuotedStr(EnteTracciato));
    end;
    // Filtri
    if DM1.ControllaDataStr(FilterDal.Text) then DM1.AddSQL(Q, 'AND', 'DATACONTROLLO >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(FilterDal.Text)) + '''');
    if DM1.ControllaDataStr(FilterAl.Text)  then DM1.AddSQL(Q, 'AND', 'DATACONTROLLO <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(FilterAl.Text)) + '''');
    // Apre
    Q.Open;
  finally
    DM1.CloseWait;
  end;
end;

// Funzione che ritorna l'ID dell'ente selezionato per l'esportazione e il nome del tracciato
procedure TExportAllegatiManutForm.GetIdEnteTracciato(var EnteID, EnteTracciato:String);
var
  CommaPos: Integer;
  EnteSel: String;
begin
  // Inizializzazione
  EnteID := '';
  EnteTracciato := '';
  // Preleva la selezione
  EnteSel := VarToStr(FilterEnte.EditValue);
  // Trova la posizione della prima virgola (che fa da separatore tra l'ID e il nome del tracciato
  CommaPos := Pos(',', EnteSel);
  // Se non la trova restituisce un errore
  if CommaPos = 0 then raise Exception.Create('Selezione dell''Ente e del tracciato da esportare non valida!');
  // RIcava i dati da restituire
  EnteID := LeftStr(EnteSel, CommaPos-1);
  EnteTracciato := RightStr(EnteSel, Length(EnteSel)-CommaPos);
end;

procedure TExportAllegatiManutForm.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
  inherited;
  // Azzera i filtri
  FilterEnte.Clear;
  PratMesiNessunoClick(PratMesiNessuno);
end;

procedure TExportAllegatiManutForm.FilterEntePropertiesChange(
  Sender: TObject);
begin
  inherited;
  // Se cambia ualche filtro chiude subito la query
  Q.Close;
end;

procedure TExportAllegatiManutForm.sbEsportaRigheSelezionateClick(
  Sender: TObject);
var
  SL: TStrings;
  CurrLine, EnteID, EnteTracciato, TracciatoPerNomeFile: String;
  i, IdAllegato, RI: Integer;
  DC: TcxCustomDataController;
begin
  inherited;
  // Conferme iniziali
  if DM1.Messaggi('Creazione file x invio telematico.', 'Confermi di voler iniziare l''operazione?', 'NB: Assicurati di aver correttamente selezionato tutti gli allegati che intendi esportare o di aver cliccato su "Esporta TUTTO".', [mbYes,mbNo], 0, nil) <> mrYes Then Exit;
  // SI assicura che ci sia almeno un record selezionato
  if tvList.Controller.SelectedRecordCount = 0 then begin
    DM1.Messaggi('Creazione file x invio telematico.', 'Non c''è nessuna riga (allegato) selezionata.'#13#13'L''operazione è stata annullata.', 'NB: Prima di avviare l''operazione è necessario selezionare i documenti da inviare (oppure cliccare su "Esporta TUTTO").', [mbOk], 0, nil);
    Exit;
  end;
  // INizializzazine
  DC := tvList.DataController;
  // Ricava l'ID dell'Ente selezionato e il nome del tracciato da usare
  GetIdEnteTracciato(EnteID, EnteTracciato);
  // Crea la String List dove costruire il file da esportare
  SL := TStringList.Create;
  try
    // -------------------------------------------------------------------------
    // Cicla per tutte le righe (allegati) selezionati
    for i := 0 to tvList.Controller.SelectedRecordCount -1 do begin
      // Ricava il Record Index dell'allegato corrente
      RI := tvList.Controller.SelectedRecords[i].RecordIndex;
      // Aggiorna l'utente
      DM1.ShowWait('Creazione file x invio telematico.', 'Allegato ' + DC.DisplayTexts[RI,tvListID.Index] + ' (' + DC.DisplayTexts[RI,tvListTIPO.Index] + ') del ' + DC.DisplayTexts[RI,tvListDATACONTROLLO.Index] + #13 + DC.DisplayTexts[RI,tvListFULLPRATICA.Index] + #13 + DC.DisplayTexts[RI,tvListGENCAL_FULLRIF.Index]);
      // Ricava l'ID dell'allegato corrente
      IdAllegato := DC.Values[RI,tvListID.Index];

      // Costruisce la riga di esportazione...
      //  NB: IN base al tipo di tracciato scelto richiama il protocollo corretto
      // VANZOTECH
      if (EnteTracciato = 'VANZOTECH - Allegato F/G - Impianti termici') then begin
        CurrLine := Export_AllegatoFG_Vanzotech(IdAllegato);
        TracciatoPerNomeFile := 'Vanzotech';  // Usato per poi comporre il nome di default del file

      // SIENA
      end else if (EnteTracciato = 'SIENA - Allegato F/G - Impianti termici') then begin
        CurrLine := Export_AllegatoFG_Siena(IdAllegato);
        TracciatoPerNomeFile := 'Siena';  // Usato per poi comporre il nome di default del file

      // VESTASOFT - Allegato F
      end else if (EnteTracciato = 'VESTASOFT - Allegato F - Impianti termici') then begin
        CurrLine := Export_AllegatoF_Vestasoft(IdAllegato);
        TracciatoPerNomeFile := 'Vestasoft_F';  // Usato per poi comporre il nome di default del file

      // VESTASOFT - Allegato G
      end else if (EnteTracciato = 'VESTASOFT - Allegato G - Impianti termici') then begin
        CurrLine := Export_AllegatoG_Vestasoft(IdAllegato);
        TracciatoPerNomeFile := 'Vestasoft_G';  // Usato per poi comporre il nome di default del file

      // Tracciato non trovato
      end else begin
        raise Exception.Create('Tracciato di esportazione non riconosciuto!');
      end;

      // Aggiunge la nulva riga (il nuovo allegato) alla StringList
      SL.Add(CurrLine);
    end;
    DM1.CloseWait;
    // -------------------------------------------------------------------------
    // Preimposta il nome del file
    SaveDialog.FileName := 'Allegati Levante ' + FormatDateTime('dd_mm_yyyy hh_nn_ss', Now) + ' ' + TracciatoPerNomeFile + '.csv';
    // Chiede il nome del file e se l'utente decide di annullare esce subito
    if not SaveDialog.Execute then begin
      DM1.Messaggi('Creazione file x invio telematico.', 'Operazione annullata!', '', [mbOk], 0, nil);
      Exit;
    end;
    // Salva il contenuto della StringList generando così il file pronto per l'upload
    DM1.ShowWait('Creazione file x invio telematico.', 'Sto salvando il file...');
    SL.SaveToFile(SaveDialog.FileName);
    // Marca i documenti esportati come "Inviati telematicamente"
    DM1.ShowWait('Creazione file x invio telematico.', 'Sto marcando i documenti inviati come "Inviati internet".');
    if not MarcaAllegatiEsportati then begin
      // Se qualcosa è andato storto elimina il file appena creato in modo che non possa essere usato
      //  altrimenti ci potrebbero essere degli allegati inviati ma non marcati come tali
      DeleteFile(SaveDialog.FileName);
    end;
    // Refresh dell'elenco in modo che gli esportati spariscano
    Self.EseguiQuery;
  finally
    // Pulizie finali
    DM1.CloseWait;
    SL.Free;
  end;
  // Messaggio finale
  DM1.Messaggi('Creazione file x invio telematico.', 'Operazione completata!', '', [mbOk], 0, nil);
end;


// FUnzione che marca gli allegati come esportati e ritorna True se è andato tutto bene
function TExportAllegatiManutForm.MarcaAllegatiEsportati: Boolean;
var
  SL: TStrings;
  i, IdAllegato, RI: Integer;
  Qry: TIBOQuery;
begin
  inherited;
  // Inizializzazione
  Result := False;
  // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
  DM1.CheckForAlreadyInTransaction;
  // Crea la query
  Qry := TIBOQuery.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta la query in modo che marchi come Inviati via Internet gli allegati selezionati
    Qry.SQL.Add('UPDATE ALLEGATI_MANUT SET STATOAVANZAMENTO = 40 WHERE 1=2');
    for i := 0 to tvList.Controller.SelectedRecordCount -1 do Qry.SQL.Add('OR ID = ' + tvList.Controller.SelectedRecords[i].DisplayTexts[tvListID.Index]);
    // Esegue la query in una transazione e se va tutto bene imposta il valore di ritorno a True.
    DM1.DBAzienda.StartTransaction;
    try
      Qry.ExecSQL;
      DM1.DBAzienda.Commit;
      Result := True;
    except
      DM1.DBAzienda.Rollback;
      Result := False;
    end;
  finally
    // Pulizie finali
    Qry.Free;
  end;
end;




procedure TExportAllegatiManutForm.tvListDblClick(Sender: TObject);
begin
//  inherited;
  // Così nn risponde al doppio click
end;

procedure TExportAllegatiManutForm.sbEsportaTuttoClick(Sender: TObject);
begin
  inherited;
  // Seleziona tutte le righe e poi richiama l'esportazione dei righi selezionati.
  tvList.Controller.SelectAll;
  sbEsportaRigheSelezionateClick(sbEsportaRigheSelezionate);
end;

procedure TExportAllegatiManutForm.QryAllCalcFields(DataSet: TDataSet);
begin
  inherited;
  // ===========================================================================
  // Verifica l'indirizzo con la stradario per certificarlo
  // ---------------------------------------------------------------------------
  if DM2.Stradario_IndirizzoVerificato(QryAllCODICEISTATCOMUNEIMM.AsString, QryAllCOMUNEIMM.AsString, QryAllINDIRIZZOIMM.AsString, QryAllPROVINCIAIMM.AsString)
  then QryAllCOMPUTED_STR_CERTIFIED_IMM.AsString := 'T'
  else QryAllCOMPUTED_STR_CERTIFIED_IMM.AsString := 'F';
  // ===========================================================================

  // ===========================================================================
  // Verifica l'indirizzo con la stradario per certificarlo
  // ---------------------------------------------------------------------------
  if DM2.Stradario_IndirizzoVerificato(QryAllPROPCODICEISTATCOMUNE.AsString, QryAllPROPLOCALITA.AsString, QryAllPROPINDIRIZZO.AsString, QryAllPROPPROVINCIA.AsString)
  then QryAllCOMPUTED_STR_CERTIFIED_PROP.AsString := 'T'
  else QryAllCOMPUTED_STR_CERTIFIED_PROP.AsString := 'F';
  // ===========================================================================

  // ===========================================================================
  // Verifica l'indirizzo con la stradario per certificarlo
  // ---------------------------------------------------------------------------
  if DM2.Stradario_IndirizzoVerificato(QryAllCODICEISTATCOMUNERESPIMP.AsString, QryAllCITTARESPIMP.AsString, QryAllINDIRIZZORESPIMP.AsString, QryAllPROVINCIARESPIMP.AsString)
  then QryAllCOMPUTED_STR_CERTIFIED_RESPIMP.AsString := 'T'
  else QryAllCOMPUTED_STR_CERTIFIED_RESPIMP.AsString := 'F';
  // ===========================================================================
end;

end.
