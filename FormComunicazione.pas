unit FormComunicazione;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBaseAllegati, cxControls, cxSplitter,
  ExtCtrls, bmpPanel, cxDBEdit, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, Mask, DBCtrls, Buttons,
  MAURI_SB, cxPC, ComCtrls, DB, IBODataset, cxMemo, cxRichEdit,
  cxDBRichEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, IB_Components, 
  IdComponent, 
  
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, ToolWin, ImgList, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxNavigator,
  dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations, System.ImageList;

type
  TComunicazioneForm = class(TModelBaseAllegatiForm)
    PanelNumDataDocumento: TPanel;
    ShapeDocumento: TShape;
    LabelData: TLabel;
    LabelTipoComunicazione: TLabel;
    LabelCantiere: TLabel;
    Label152: TLabel;
    dbeData: TcxDBDateEdit;
    PanelDestinatario: TPanel;
    MittenteDestinatario: TLabel;
    btnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    dbeRagSocCli: TDBEdit;
    dbeIndirizzo: TDBEdit;
    dbeCap: TDBEdit;
    dbeComune: TDBEdit;
    dbeProvincia: TDBEdit;
    dbeNumCivico: TDBEdit;
    dbeCodiceSoggetto: TDBText;
    PanelOggetto: TPanel;
    Label226: TLabel;
    Label228: TLabel;
    dbeOggetto: TDBEdit;
    MainPageControl: TcxPageControl;
    TabLettera: TcxTabSheet;
    TabEmail: TcxTabSheet;
    TabSms: TcxTabSheet;
    PanelCorpo: TPanel;
    Label29: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dbeEmailIndirizzo: TDBEdit;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    dbeSmsNumCellulare: TDBEdit;
    QryMsg: TIBOTable;
    SourceMsg: TDataSource;
    QryMsgID: TIntegerField;
    QryMsgRIF_ID: TIntegerField;
    QryMsgID_SOURCE: TIntegerField;
    QryMsgID_SOGGETTO: TIntegerField;
    QryMsgDEST_RAGSOC: TStringField;
    QryMsgDEST_INDIRIZZO: TStringField;
    QryMsgDEST_NUMCIVICO: TStringField;
    QryMsgDEST_COMUNE: TStringField;
    QryMsgDEST_PROVINCIA: TStringField;
    QryMsgDEST_CAP: TStringField;
    QryMsgDEST_EMAIL: TStringField;
    QryMsgDEST_CELLULARE: TStringField;
    QryMsgID_PRATICA: TIntegerField;
    QryMsgDATA: TDateTimeField;
    QryMsgMSG_TYPE: TStringField;
    QryMsgMSG_OGGETTO: TStringField;
    QryMsgMSG_BLOB: TMemoField;
    Editor: TcxDBRichEdit;
    dbeEmailCorpo: TcxDBMemo;
    dbeSmsCorpo: TcxDBMemo;
    btnPratica: TSpeedButtonRollOver;
    QryComImp: TIBOQuery;
    SourceImp: TDataSource;
    QryComImpID: TIntegerField;
    QryComImpRIF_DATO: TStringField;
    QryComImpRIF_TIMEOFFSET_DAYS: TIntegerField;
    QryComImpMSG_OGGETTO: TStringField;
    QryComImpCOMPUTED_MODELLOFULL: TStringField;
    QryMsgPRATICA: TIntegerField;
    QryMsgDATAPRATICA1: TDateTimeField;
    dbeModello: TcxDBLookupComboBox;
    LabelDescPratica: TcxTextEdit;
    DBText1: TDBText;
    Panel5: TPanel;
    sbEmailAnnulla: TSpeedButtonRollOver;
    sbEmailInvia: TSpeedButtonRollOver;
    Panel6: TPanel;
    sbSmsAnnulla: TSpeedButtonRollOver;
    sbSmsInvia: TSpeedButtonRollOver;
    Panel7: TPanel;
    sbLetteraAnnulla: TSpeedButtonRollOver;
    sbLetteraInvia: TSpeedButtonRollOver;
    Label7: TLabel;
    LabelSmsCreditoResiduo: TLabel;
    Image1: TImage;
    Shape1: TShape;
    Label8: TLabel;
    LabelSmsCaratteriDisponibili: TLabel;
    LogoLettera: TImage;
    LogoSms: TImage;
    LogoEmail: TImage;
    TabStorico: TcxTabSheet;
    Panel8: TPanel;
    Label9: TLabel;
    GridSto: TcxGrid;
    btvSto: TcxGridDBBandedTableView;
    lvSto: TcxGridLevel;
    QrySto: TIBOQuery;
    SourceSto: TDataSource;
    QryStoID: TIntegerField;
    QryStoID_MSG: TIntegerField;
    QryStoDATAORAINVIO: TDateTimeField;
    QryStoDESTINAZIONE: TStringField;
    QryStoOPERATORE: TStringField;
    btvStoID: TcxGridDBBandedColumn;
    btvStoID_MSG: TcxGridDBBandedColumn;
    btvStoDATAORAINVIO: TcxGridDBBandedColumn;
    btvStoDESTINAZIONE: TcxGridDBBandedColumn;
    btvStoOPERATORE: TcxGridDBBandedColumn;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    QryMsgDATAULTMOD_CREAZIONE: TDateTimeField;
    QryMsgDATAULTMOD_GENERALE: TDateTimeField;
    ToolbarImages: TImageList;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    ToolButton5: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    FontDialog1: TFontDialog;
    QryMsgRIF_TIPO: TStringField;
    QrySegnaposto: TIBOQuery;
    SpeedButton2: TSpeedButton;
    TimerSmsCreditExpired: TTimer;
    QrySegnapostoGEN_DATA_ATTUALE: TStringField;
    QrySegnapostoGEN_ORA_ATTUALE: TStringField;
    QrySegnapostoMSG_SOGGETTO_ID: TStringField;
    QrySegnapostoMSG_SOGGETTO_NOME: TStringField;
    QrySegnapostoMSG_PRATICA_ID: TStringField;
    QrySegnapostoMSG_PRATICA_CODICE: TStringField;
    QrySegnapostoMSG_PRATICA_DATAAPERTURA: TStringField;
    QrySegnapostoMSG_PRATICA_DESCRIZIONE: TStringField;
    QrySegnapostoMSG_PRATICA_TIPOIMPIANTO: TStringField;
    QrySegnapostoMSG_PRATICA_PROXVISITAENTRO: TStringField;
    QrySegnapostoMSG_PRATICA_CONTRATTO_DATA_FINE: TStringField;
    QrySegnapostoMSG_PRATICA_CONTRATTO_IMPORTO: TIBOFloatField;
    QrySegnapostoMSG_PRATICA_CONTRATTO_IMPORTOIC: TIBOFloatField;
    QrySegnapostoDATIAZIE_RAGIONESOCIALE: TStringField;
    QrySegnapostoDATIAZIE_INDIRIZZO: TStringField;
    QrySegnapostoDATIAZIE_NUMCIVICO: TStringField;
    QrySegnapostoDATIAZIE_CITTA: TStringField;
    QrySegnapostoDATIAZIE_PROVINCIA: TStringField;
    QrySegnapostoDATIAZIE_CAP: TStringField;
    QrySegnapostoDATIAZIE_TELEFONO: TStringField;
    QrySegnapostoDATIAZIE_CELLULARE: TStringField;
    QrySegnapostoDATIAZIE_FAX: TStringField;
    QrySegnapostoDATIAZIE_EMAIL: TStringField;
    QrySegnapostoRIF_TIPO: TStringField;
    QrySegnapostoRIF_NUMERO: TStringField;
    QrySegnapostoRIF_REGISTRO: TStringField;
    QrySegnapostoRIF_DATA: TStringField;
    QrySegnapostoRIF_ORA: TStringField;
    QrySegnapostoRIF_DESCRIZIONE: TStringField;
    QrySegnapostoRIF_SCADENZA_DATA: TStringField;
    QrySegnapostoRIF_RIFERIMENTO: TStringField;
    QrySegnapostoRIF_SOGGETTO_ID: TStringField;
    QrySegnapostoRIF_SOGGETTO_NOME: TStringField;
    QrySegnapostoRIF_PRATICA_ID: TStringField;
    QrySegnapostoRIF_PRATICA_CODICE: TStringField;
    QrySegnapostoRIF_PRATICA_DATAAPERTURA: TStringField;
    QrySegnapostoRIF_PRATICA_DESCRIZIONE: TStringField;
    QrySegnapostoRIF_PRATICA_TIPOIMPIANTO: TStringField;
    QrySegnapostoRIF_PRATICA_PROXVISITAENTRO: TStringField;
    QrySegnapostoRIF_PRATICA_CONTRATTO_DATA_FINE: TStringField;
    QrySegnapostoRIF_PRATICA_CONTRATTO_IMPORTO: TIBOFloatField;
    QrySegnapostoRIF_PRATICA_CONTRATTO_IMPORTOIC: TIBOFloatField;
    QrySegnapostoRIF_MOTIVO_DELLA_CHIAMATA: TStringField;
    QrySegnapostoRIF_RICHIEDENTE: TStringField;
    QrySegnapostoRIF_DA_EFFETTUARE_ID: TStringField;
    QrySegnapostoRIF_IMPORTO: TIBOFloatField;
    QrySegnapostoMSG_SOGGETTO_COGNOME: TStringField;
    QrySegnapostoMSG_SOGGETTO_RAGIONESOCIALE: TStringField;
    QrySegnapostoMSG_SOGGETTO_INDIRIZZO: TStringField;
    QrySegnapostoMSG_SOGGETTO_NUMCIVICO: TStringField;
    QrySegnapostoMSG_SOGGETTO_CAP: TStringField;
    QrySegnapostoMSG_SOGGETTO_COMUNE: TStringField;
    QrySegnapostoMSG_SOGGETTO_PROVINCIA: TStringField;
    QrySegnapostoMSG_SOGGETTO_PARTITAIVA: TStringField;
    QrySegnapostoMSG_SOGGETTO_CODICEFISCALE: TStringField;
    QrySegnapostoRIF_PRATICA_APP_TIPOIMPIANTO: TStringField;
    QrySegnapostoRIF_PRATICA_APP_TIPOAPPARECCHIO: TStringField;
    QrySegnapostoRIF_PRATICA_APP_COSTRUTTORE: TStringField;
    QrySegnapostoRIF_PRATICA_APP_MODELLO: TStringField;
    QrySegnapostoRIF_PRATICA_APP_MATRICOLA: TStringField;
    QrySegnapostoRIF_RDA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure QryComImpCalcFields(DataSet: TDataSet);
    procedure btnPraticaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure dbeRagSocCliEnter(Sender: TObject);
    procedure dbeRagSocCliExit(Sender: TObject);
    procedure dbeDataEnter(Sender: TObject);
    procedure dbeDataExit(Sender: TObject);
    procedure QryMsgID_SOGGETTOChange(Sender: TField);
    procedure QryMsgID_PRATICAChange(Sender: TField);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QryMsgID_SOURCEChange(Sender: TField);
    procedure QryMsgBeforePost(DataSet: TDataSet);
    procedure QryMsgMSG_TYPEChange(Sender: TField);
    procedure dbeSmsCorpoPropertiesChange(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbLetteraAnnullaClick(Sender: TObject);
    procedure sbLetteraInviaClick(Sender: TObject);
    procedure btvStoDATAORAINVIOGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: String);
    procedure MainPageControlChange(Sender: TObject);
    procedure btvStoOPERATOREGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure ToolButton1Click(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure CenterAlignClick(Sender: TObject);
    procedure RightAlignClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure EditorPropertiesSelectionChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TimerSmsCreditExpiredTimer(Sender: TObject);
    procedure LabelDescPraticaKeyPress(Sender: TObject; var Key: Char);
  private
    fP_ID: Integer;
    { Private declarations }

    // Varianile che contiene il nome del controllo che possiede il focus
    ActiveControlName:String;
    fP_MOD_ID: Integer;
    fP_NEW_ID_MODELLO: Integer;
    fP_NEW_TIPO_COMUNICAZIONE: String;
    fP_NEW_SILENT: Boolean;
    fP_NEW_ID_PRATICA: Integer;
    fP_NEW_ID_SOGGETTO: Integer;
    fP_NEW_ID_RIF: Integer;
    fP_NEW_RIF_DATO: String;
    fForcedModalResult: TModalResult;

    FUpdating: Boolean;

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    procedure Allegati_AggiornaDatiFiltri; override;
    procedure Allegati_VerificaAbilitazione; override;
    // =========================================================================

    procedure ApriQuery;
    procedure CaricaModello(ID: Integer; MsgType:String);
    function GetSMS_CaratteriDisponibili: Integer;
    procedure ApriQueryStorico;
    procedure PerformFileOpen(const AFileName: string);
    procedure FileSaveAs(Sender: TObject);
    function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure CaricaIconaDocTipo(Titolo: String);
    procedure CaricaDatiSegnaposto(CurrMemoEditor:TcxCustomMemo);
    procedure MemoSearchAndReplace(CurrMemoEditor:TcxDBMemo; InSearch, InReplace: string);
    procedure RichEditSearchAndReplace(CurrMemoEditor:TcxDBRichEdit; InSearch, InReplace: string);
    function MessaggioNonInviato: Boolean;

  public
    { Public declarations }
    property P_MOD_ID:Integer read fP_MOD_ID write fP_MOD_ID;
    property P_NEW_ID_MODELLO:Integer read fP_NEW_ID_MODELLO write fP_NEW_ID_MODELLO;
    property P_NEW_TIPO_COMUNICAZIONE:String read fP_NEW_TIPO_COMUNICAZIONE write fP_NEW_TIPO_COMUNICAZIONE;
    property P_NEW_SILENT:Boolean read fP_NEW_SILENT write fP_NEW_SILENT;
    property P_NEW_ID_PRATICA:Integer read fP_NEW_ID_PRATICA write fP_NEW_ID_PRATICA;
    property P_NEW_ID_SOGGETTO:Integer read fP_NEW_ID_SOGGETTO write fP_NEW_ID_SOGGETTO;
    property P_NEW_ID_RIF:Integer read fP_NEW_ID_RIF write fP_NEW_ID_RIF;
    property P_NEW_RIF_DATO:String read fP_NEW_RIF_DATO write fP_NEW_RIF_DATO;

    property SMS_CaratteriDisponibili:Integer read GetSMS_CaratteriDisponibili;

    // Proprietà che indica di non chiedere nulla all'utente durante la conferma del documento
    property ForcedModalResult:TModalResult read fForcedModalResult write fForcedModalResult;
  end;

var
  ComunicazioneForm: TComunicazioneForm;

implementation

uses DataModule1, StrUtils, main, DataModule2, 
  FormTabComunicazioni, IniFiles;

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'Untitled';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d   Col: %3d';

{$R *.dfm}



// =============================================================================
// INIZIO: PARTE CHE CARICA LA BITMAP E IL TITOLO DELLE COMUNICAZIONI
//  NB: Non ho usato la gestione di default perchè altrimenti le installazioni
//       vecchia non avrebbero avuto alcun titolo in quanto non sarebbero stati
//       gestiti i valori di default corretti in assenza della relativa Sezione
//       sul file ini e l'impossiblità di gestire il file Ini stesso
// -----------------------------------------------------------------------------
procedure TComunicazioneForm.CaricaIconaDocTipo(Titolo:String);
var
   TestoRect:TRect;
   P:TMemIniFile;
   S:String;
begin
   // Prima di tutto controlla se l'IconaDocTipo è bloccata ed se si, esce subito sanza fare nulla
   if MainForm.FlagBloccoIconaDocTipo > 0 then Exit;
   // Apre il file dei parametri del manu
   P := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
   try
     // Carica e dimensiona la bitmap che indica il tipo di form visualizzata
     S := P.ReadString(Titolo, 'Bitmap', 'dt_Comunicazioni.bmp');
     if (S <> '') and (FileExists(DM1.TemaDir + S)) then begin
       MainForm.ImgDocTipo.Picture.LoadFromFile(DM1.TemaDir + S);
       MainForm.ImgDocTipo.Height := MainForm.ImgDocTipo.Picture.Height;
       MainForm.ImgDocTipo.Visible := True;
     end else MainForm.ImgDocTipo.Visible := False;
     // Caption1
     MainForm.Caption1.Caption := P.ReadString(Titolo, 'Caption1', 'Comunicazioni');
     MainForm.Caption1.Top := P.ReadInteger(Titolo, 'Caption1Top', 22);
     MainForm.Caption1.Left := P.ReadInteger(Titolo, 'Caption1Left', 80);
     MainForm.Caption1.Font.Name := P.ReadString(Titolo, 'Caption1FontName', 'Verdana');
     MainForm.Caption1.Font.Size := P.ReadInteger(Titolo, 'Caption1FontSize', 13);
     if P.ReadBool(Titolo, 'Caption1FontStyleBold', False) then MainForm.Caption1.Font.Style := [fsBold] else MainForm.Caption1.Font.Style := [];
     // Caption2
     MainForm.Caption2.Caption := P.ReadString(Titolo, 'Caption2', '');
     MainForm.Caption2.Top := P.ReadInteger(Titolo, 'Caption2Top', 0);
     MainForm.Caption2.Left := P.ReadInteger(Titolo, 'Caption2Left', 0);
     MainForm.Caption2.Font.Name := P.ReadString(Titolo, 'Caption2FontName', 'Verdana');
     MainForm.Caption2.Font.Size := P.ReadInteger(Titolo, 'Caption2FontSize', 10);
     if P.ReadBool(Titolo, 'Caption2FontStyleBold', True) then MainForm.Caption2.Font.Style := [fsBold] else MainForm.Caption2.Font.Style := [];
     // Caption3
     MainForm.Caption3.Caption := P.ReadString(Titolo, 'Caption3', '');
     MainForm.Caption3.Top := P.ReadInteger(Titolo, 'Caption3Top', 0);
     MainForm.Caption3.Left := P.ReadInteger(Titolo, 'Caption3Left', 0);
     MainForm.Caption3.Font.Name := P.ReadString(Titolo, 'Caption3FontName', 'Verdana');
     MainForm.Caption3.Font.Size := P.ReadInteger(Titolo, 'Caption3FontSize', 10);
     if P.ReadBool(Titolo, 'Caption3FontStyleBold', True) then MainForm.Caption3.Font.Style := [fsBold] else MainForm.Caption3.Font.Style := [];
   finally
     P.Free;
     Update;
   end;
end;
// -----------------------------------------------------------------------------
// FINE: PARTE CHE CARICA LA BITMAP E IL TITOLO DELLE COMUNICAZIONI
// =============================================================================





// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che aggiorna i filtri di collegamento della form degli allegati
  //  con la form attuale
  procedure TComunicazioneForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QryMsgID_SOGGETTO.IsNull then fAllegatiForm.Filter_CodSogg := QryMsgID_SOGGETTO.Value;

    // Codice Pratica
    if not QryMsgPRATICA.IsNull then fAllegatiForm.Filter_CodPrat := QryMsgPRATICA.Value;
    // Data Pratica
    if not QryMsgDATAPRATICA1.IsNull then fAllegatiForm.Filter_DataPrat := QryMsgDATAPRATICA1.Value;

    // Tipo Documento
    fAllegatiForm.Filter_TipoDoc := 'Comunicazione';
    // Registro Documento
    fAllegatiForm.Filter_RegDoc := '';
    // Numero documento
    if not QryMsgID.IsNull then fAllegatiForm.Filter_NumDoc := QryMsgID.Value;
    // Data documento
    fAllegatiForm.Filter_DataDoc := QryMsgDATA.AsDateTime;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TComunicazioneForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QryMsg.State = dsInsert) then begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end else begin
      Allegati_CreaForm;
      SplitterAllegati.Enabled := True;
    end;
  end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================








procedure TComunicazioneForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Controlla se il messaggio è stato inviato almeno una volta e se non lo è
  //  avvisa l'utente e gli chiede se vuole rinunciare a uscire dalla form
  //  Se il messaggio non è stato confermato non esegue il controllo perchè
  //  darebbe un errore in quanto l'ID non è stato assegnato
  if  (not QryMsgID.IsNull)
  and MessaggioNonInviato
  and (DM1.Messaggi('Levante', 'ATTENZIONE !!!'#13#13'Comunicazione ancora NON INVIATA.'#13#13'Vuoi uscire senza inviarla?', 'NB: Per fare prima la prossima volta clicca direttamente sul pulsante "Conferma e invia", risparmierai un passaggio.', [mbYes,mbNo], 0, nil) <> mrYes)
  then begin
    Action := caNone;
    Exit;
  end;
  // Distrugge la form
  Action := caFree;
  // Se è in transazione vuol dire che qualcosa non è andato
  //  per il verso giusto perchè qui non dovrebbe essere mai in transazione
  //  quindi avverte l'utente
  // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
  DM1.CheckForAlreadyInTransaction;
  // Chiude
  ComunicazioneForm := nil;
  // Se necessario aggiorna l'elenco delle comunicazioni automatiche
  //  NB: No se siamo in silent mode
  if (TabComunicazioniForm <> nil) and (TabComunicazioniForm.QryComAuto.Active) and (not P_NEW_SILENT)
  then begin
    try
      if not P_NEW_SILENT then DM1.ShowWait('Levante', 'Attendere...');
      TabComunicazioniForm.EseguiQueryComAuto;
    finally
      DM1.CloseWait;
    end;
  end;
end;

procedure TComunicazioneForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TComunicazioneForm.QryComImpCalcFields(DataSet: TDataSet);
var
  TmpStr: String;
begin
  inherited;
  // ===========================================================================
  // Compone il riferimento completo al modello di comunicazione
  // ---------------------------------------------------------------------------
  // Parte del numeri dei giorni di anticipo/ritardo riepstto al dato di riferimento
  TmpStr := QryComImpRIF_TIMEOFFSET_DAYS.AsString + ' giorni ';
  if LeftStr(TmpStr,1) = '-'
    then TmpStr := RightStr(TmpStr,Length(TmpStr)-1) + 'prima'
    else TmpStr := TmpStr + 'dopo';
  TmpStr := '(invio ' + TmpStr + ')';
  // Dato di riferimento
  QryComImpCOMPUTED_MODELLOFULL.AsString := QryComImpRIF_DATO.AsString + ' ' + TmpStr + ' - ' + QryComImpMSG_OGGETTO.AsString;
  // ===========================================================================
end;

procedure TComunicazioneForm.btnPraticaClick(Sender: TObject);
begin
  inherited;
  DM1.SelezionaCantiereImpianto(QryMsgPRATICA,
                                QryMsgDATAPRATICA1,
                                QryMsgID_PRATICA,
                                QryMsgID_SOGGETTO,
                                QryMsgID_SOGGETTO.Value);
end;



procedure TComunicazioneForm.FormShow(Sender: TObject);
begin
  inherited;
   // Se siamo in modalità Silent fa in modo che la form non sia visibile anche se in realtà
   //  tecnicamente è Visible altrimenti mi da degli errori.
   if P_NEW_SILENT then begin
     // NB: Per non far essere visibile la form in SilentMode Imposto la sua posizione
     //     fuori dallo schermo e non impostando le dimensioni a 0 (vedi riche sotto commentate ma
     //     lasciate in modo da ricordare in futuro che cmq. avevo già provato il metodo) perchè
     //     impostando le dimensioni a zero mi dava problemi con le email inviate cumulativamente
     //     invece così sembra andare bene.
     Self.Top := 10000;
//     Self.Width   := 0;
//     Self.Height  := 0;
   end;

   // Se è in transazione vuol dire che qualcosa non è andato
   //  per il verso giusto perchè qui non dovrebbe essere mai in transazione
   //  quindi avverte l'utente
   // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
   DM1.CheckForAlreadyInTransaction;

   // In base al valore di 'Tag' apre la form in diverse modalità...
   case Tag of
      // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
      1: begin
        // Apre la query e carica il documento
        ApriQuery;
        // Così si configura l'aspetto della form in base al tipo di comunicazione
        QryMsgMSG_TYPEChange(QryMsgMSG_TYPE);
      end;

      // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
      2: begin
         // Apre la query in modo che non trovi alcun record
         P_MOD_ID := 9999;
         ApriQuery;
         // Avvia la transazione subito (prima dell'append quindi non posso aspettare l'entrata in editing)
         DM1.DBAzienda.StartTransaction;
         // Esegue l'append del nuovo record lo medde in editing
         QryMsg.Append;
         // Clicca il pulsante modifica
         RxSpeedModifica.Down := True;
         RxSpeedModificaClick(Self);
         // Defaultizzazione dati
         QryMsgMSG_TYPE.Value := P_NEW_TIPO_COMUNICAZIONE;
         QryMsgDATA.Value := Now;
         QryMsgID_SOGGETTO.Value := P_NEW_ID_SOGGETTO;
         QryMsgID_PRATICA.Value := P_NEW_ID_PRATICA;
         if P_NEW_ID_RIF > 0 then
           QryMsgRIF_ID.Value := P_NEW_ID_RIF;
         if P_NEW_RIF_DATO <> '' then
           QryMsgRIF_TIPO.Value := P_NEW_RIF_DATO;
         // Carica l'eventuale modello di comunicazione (se specificata)
         if P_NEW_ID_MODELLO <> 0 then
           QryMsgID_SOURCE.Value := P_NEW_ID_MODELLO;
      end;
   end;


   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if DM1.ModCtrl(MOD_CONTATTI) > 1 then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Carica la descrizione delle pratiche
   if (QryMsgID_PRATICA.AsInteger <> 0) then LabelDescPratica.Text := DM1.GetDescrizionePratica(QryMsgID_PRATICA.AsInteger);

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;

   // Scrollbar verticale all'inizio
   ClientArea.VertScrollBar.Position := 0;

   // Se il messaggio è un SMS...
   if QryMsgMSG_TYPE.AsString = 'sms' then begin
     // Aggiorna il contatore dei caratteri rimanenti
     LabelSmsCaratteriDisponibili.Caption := IntToStr(SMS_CaratteriDisponibili);
   end;
end;





// Procedura che carica sulla comunicazione attuale i dati del modello di cui riceve l'ID
procedure TComunicazioneForm.CaricaModello(ID:Integer; MsgType:String);
var
  DatoDiRiferimento: String;
  Qry: TIB_Cursor;
begin
  // In base al tipo di comunicazione prende il testo corretto
  if      MsgType = 'lettera' then MsgType := 'MSG_TEXT_LETTERA'
  else if MsgType = 'e-mail'  then MsgType := 'MSG_TEXT_EMAIL'
  else if MsgType = 'sms'     then MsgType := 'MSG_TEXT_SMS'
  else raise Exception.Create('Tipo di comunicazione non corretto.');
  // IMposta la query che prelevereà i dati del modello
  Qry := TIB_Cursor.Create(Self);
  try
    // Disabilita i controlli perchè altrimenti dava problemi in alcune circostanze
    QryMsg.DisableControls;
    // Continua a impostare la query
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // IMposta la query
    Qry.SQL.Add('SELECT RIF_DATO, MSG_OGGETTO,' + MsgType + ' AS MSG_TEXT FROM COM_IMPOSTAZIONI WHERE ID = ' + IntToStr(ID));
    Qry.Open;
    // Ovviamente se non trova nulla...
    if Qry.Eof then raise Exception.Create('Modello di comunicazione non trovato.');
    // IMposta il tipo di riferimento del messaggio
    DatoDiRiferimento := Qry.FieldByName('RIF_DATO').AsString;
    DatoDiRiferimento := DM1.RitornaTestoPrimaDi(':', DatoDiRiferimento, False);
    QryMsgRIF_TIPO.Value := DatoDiRiferimento;
    // Carica i dati trovati
    QryMsgMSG_OGGETTO.Value := Qry.FieldByName('MSG_OGGETTO').AsString;
    if not Qry.FieldByName('MSG_TEXT').IsNull then QryMsgMSG_BLOB.Value := Qry.FieldByName('MSG_TEXT').Value;
    // Chiude la query
    Qry.Close;
  finally
    // Riabilita i controlli precedentemente disabilitati
    if QryMsg.ControlsDisabled then QryMsg.EnableControls;
    // Pulizie
    Qry.Free;
  end;
end;


// Procedure che effettua la sostituzione dei segnaposto con i dati
//  effettivi
procedure TComunicazioneForm.CaricaDatiSegnaposto(CurrMemoEditor:TcxCustomMemo);
var
  i: Integer;
  CurrFieldName, CurrTextValue: String;
  oldCursor : TCursor;
begin
  oldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    // Verifica lo stato della query
    if QrySegnaposto.Active then QrySegnaposto.Close;
    // Prepara la query per l'esecuzione
    QrySegnaposto.Unprepare;
    QrySegnaposto.Prepare;
    QrySegnaposto.Params.ParamByName('P_MSG_SOGGETTO_ID').Value := QryMsgID_SOGGETTO.Value;
    QrySegnaposto.Params.ParamByName('P_MSG_PRATICA_ID').Value  := QryMsgID_PRATICA.Value;
    QrySegnaposto.Params.ParamByName('P_MSG_RIF_ID').Value      := QryMsgRIF_ID.Value;
    QrySegnaposto.Params.ParamByName('P_MSG_RIF_TIPO').Value    := QryMsgRIF_TIPO.Value;
    // Apre la query
    QrySegnaposto.Open;
    // Se non ha trovato nulla esce ubito senfa fare nulla
    if QrySegnaposto.Eof then Exit;
    // Altrimenti cicla per tutti i campi...
    for i := 0 to QrySegnaposto.Fields.Count -1 do begin
      // Carica alcuni dati in variabili locali per comodità
      //  e se necessarrio effettua degli adattamenti
      //  NB: In base al tipo di file esegue o meno delle conversioni
      CurrFieldName := '<' + QrySegnaposto.Fields[i].FieldName + '>';
      // Campo currency
      if (QrySegnaposto.Fields[i] is TFloatField) and (TFloatField(QrySegnaposto.Fields[i]).currency) then begin
        CurrTextValue :=  CurrToStrF(QrySegnaposto.Fields[i].AsFloat, ffCurrency, 2);
      // Campo alfanumerico o tutti quelli non considerati
      end else begin
        CurrTextValue := QrySegnaposto.Fields[i].AsString;
      end;
      // RImpiazza i segnaposto relativi al campo corrente con i relativi valori
      //  utilizzanto la funzione corretta in base al tipo di editor usato
      if      CurrMemoEditor is TcxDBMemo     then MemoSearchAndReplace((CurrMemoEditor as TcxDBMemo), CurrFieldName, CurrTextValue)
      else if CurrMemoEditor is TcxDBRichEdit then RichEditSearchAndReplace((CurrMemoEditor as TcxDBRichEdit), CurrFieldName, CurrTextValue);
    end;
    // Siccome per far funzionare bene la Stored procedure che crea i modelli predefiniti ho aggiunto
    //  (nella SP) nel testo dei messaggi di puntini quando c'erano delle linee vuote (perchè
    //  altrimenti sparivano) qui sotto se ci sono linee composte solo da
    //  in puntino gli elimino il puntino stesso
    for i := 0 to CurrMemoEditor.Lines.Count -1 do begin
      if Trim(CurrMemoEditor.Lines[i]) = '.' then CurrMemoEditor.Lines[i] := '';
    end;
    // Altrimenti non aggiornava il Dataset
    CurrMemoEditor.PostEditValue;
  finally
    // Pulizie finale
    Screen.Cursor := oldCursor;
    QrySegnaposto.Close;
  end;
end;



procedure TComunicazioneForm.MemoSearchAndReplace(CurrMemoEditor:TcxDBMemo; InSearch, InReplace: string) ;
begin
  // Effettua la sostituzione
  CurrMemoEditor.Text := StringReplace(CurrMemoEditor.Text, InSearch, InReplace, [rfReplaceAll]);
end;

procedure TComunicazioneForm.RichEditSearchAndReplace(CurrMemoEditor:TcxDBRichEdit; InSearch, InReplace: string) ;
var
  X, ToEnd : integer;
begin
    with CurrMemoEditor do
    begin
      X := 0;
      ToEnd := length(Text);
      X := FindText(inSearch, X, ToEnd, []) ;
      while X <> -1 do
      begin
        SetFocus;
        SelStart := X;
        SelLength := length(inSearch) ;
        SelText := InReplace;
        X := FindText(inSearch, X + length(InReplace), ToEnd, []) ;
      end;
    end;
end;



procedure TComunicazioneForm.ApriQuery;
begin
  // Imposta ed apre la query dell'allegato
  if P_MOD_ID = 0 then raise Exception.Create('ID comunicazione non valido!');
  if QryMsg.Active then QryMsg.Close;
  QryMsg.SQLWhere.Clear;
  QryMsg.SQLWhere.Add('WHERE ID = ' + IntToStr(P_MOD_ID));
  QryMsg.Open;
  // IMposta ed apre la query con i modelli di comunicazione
  //  NB: Serve per il LookupComboBox di selezione del modello
  if not QryComImp.Active then QryComImp.Open;
end;


// Imposta e apre la query della storico
procedure TComunicazioneForm.ApriQueryStorico;
begin
  if QrySto.Active then QrySto.Close;
  if QryMsgID.IsNull then Exit;
  QrySto.SQL.Clear;
  QrySto.SQL.Add('SELECT * FROM COM_STORICO WHERE ID_MSG = ' + QryMsgID.AsString);
  QrySto.Open;
end;


procedure TComunicazioneForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
  inherited;

     if not P_NEW_SILENT then DM1.Attendere;
     try
       // A seconda che il tasto sia abbassato o meno svolge la funzione di
       //  attivare la modifica dei campi o disabilitarla.
       IF RxSpeedModifica.Down then
       begin
         // Azzera il forcedModalResult
         ForcedModalResult := mrNone;
         // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
         //  tutto a posto.
         try
            // Avvia la transazione
            //  NB: Potrebbe già essere in transazione se si tratta della creazione di un
            //       nuovo messaggio
            if not DM1.DBAzienda.InTransaction then DM1.DBAzienda.StartTransaction;
            // Tabella in editing mode
            QryMsg.Edit;
            // Modica i pulsanti e i colori dei campi per la modifica
            RxSpeedButtonUscita.Enabled         := False;
            RxSpeedButtonStampa.Enabled         := False;
            btnCliente.Enabled                  := True;
            btnPratica.Enabled                  := True;
            // Imposta i pulsanti Annulla e Invia dei messaggi
            sbLetteraAnnulla.Enabled            := True;
            sbEmailAnnulla.Enabled              := True;
            sbSmsAnnulla.Enabled                := True;
            sbLetteraInvia.Caption              := 'Conferma e invia';
            sbEmailInvia.Caption                := 'Conferma e invia';
            sbSmsInvia.Caption                  := 'Conferma e invia';
            // Colora tutti i campi per la modofica
            DM1.ColoraTuttiCampi(Self, COLOR_MODIFICA);
            // Sposta il focus
            dbeModello.SetFocus;
            dbeOggetto.SetFocus;
         except
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 RxSpeedModifica.Down := False;
            end;
         end;
       end
       else
       begin
          // Gestisce l'eccezione nel caso qualche cosa vada storto
         try
            // Chiede di confermare le modifiche o di annullare l'operazione
            //  NB: Se però è stata specificata la proprietà ForcedModalResult
            //      non chiede nulla e usa quella
            if ForcedModalResult = mrNone
            then MR := DM1.ConfermaModifiche
            else MR := ForcedModalResult;
            // Si comporta di conseguenza
            if MR = mrYes then begin
                 // Sposta il focus in modo da salvare il valore appena inserito anche se l'utente non ha onfermato con invio
                 dbeModello.SetFocus;
                 dbeOggetto.SetFocus;
                 // Visualizza il messaggio di operazione in corso
                 if not P_NEW_SILENT then DM1.ShowWait('Documento', 'Conferma documento');
                 try
                   // COnferma i dati
                   //  NB: Però solo se è in editing, controllo questo perchè in caso di stampa
                   //       automatica (silent) potrebbe essere già stato eseguito il post prima.
                   if (QryMsg.State = dsEdit) or (QryMsg.State = dsInsert)
                   then QryMsg.Post;
                   // Se è in transazione, effettua il commit
                   DM1.DBAzienda.Commit;
                   // Decide se gli allegati devono essere già visibili oppure no.
                   Allegati_VerificaAbilitazione;
                 finally
                   if not P_NEW_SILENT then DM1.CloseWait;
                 end;
                 // Se il messaggio non è stato ancora inviato avverte l'utente
                 if MessaggioNonInviato then DM1.Messaggi('Levante', 'ATTENZIONE !!!'#13#13'Comunicazione ancora NON INVIATA.'#13#13'Per inviarla clicca su "Invia".', 'NB: Per fare prima la prossima volta clicca direttamente sul pulsante "Conferma e invia", risparmierai un passaggio.', [mbOk], 0, nil);
            end else if MR = mrNo then begin
               if QryMsg.State = dsInsert then begin
                  QryMsg.Cancel;
                  // Se è in transazione, effettua il rollback
                  DM1.DBAzienda.Rollback;
                  // Chiude il mesaggio di attesa
                  if not P_NEW_SILENT then DM1.ChiudiAttendere;
                  Close;    // Chiude la form (altrimenti dà problemi)
                  Exit;
               end else begin
                  QryMsg.Cancel;
                  // Se è in transazione, effettua il rollback
                  DM1.DBAzienda.Rollback;
              end;
            end else begin
                 RxSpeedModifica.Down := True;
                 DM1.ChiudiAttendere;
                 Exit;
            end;
            // Ripristina i pulsanti e i colori dei campi
            RxSpeedButtonUscita.Enabled         := True;
            RxSpeedButtonStampa.Enabled         := True;
            btnCliente.Enabled                  := False;
            btnPratica.Enabled                  := False;
            // Imposta i pulsanti Annulla e Invia dei messaggi
            sbLetteraAnnulla.Enabled            := False;
            sbEmailAnnulla.Enabled              := False;
            sbSmsAnnulla.Enabled                := False;
            sbLetteraInvia.Caption              := 'Invia';
            sbEmailInvia.Caption                := 'Invia';
            sbSmsInvia.Caption                  := 'Invia';
            // RImette i colori normali
            DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
         except
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 RxSpeedModifica.Down := True;
                 // Riabilita la modifica dei campi
                 QryMsg.Edit;
            end;
         end;
       end;
     finally
       if not P_NEW_SILENT then DM1.ChiudiAttendere;
     end;
end;


// Procedure che informa l'utente che il messaggio non è stato ancora inviato
//  ovviamente solo se non è stato ancora inviato.
function TComunicazioneForm.MessaggioNonInviato: Boolean;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := False;
  // Crea e iposta la query
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT COUNT(*) FROM COM_STORICO WHERE ID_MSG = ' + QryMsgID.AsString);
    Q.Open;
    // Imposta il valore da ritornare
    Result := (Q.Fields[0].AsInteger = 0);
    // Chiude la query
    Q.Close;
  finally
    Q.Free;
  end;
end;


procedure TComunicazioneForm.btnClienteClick(Sender: TObject);
begin
  inherited;
  if not P_NEW_SILENT then DM1.ShowWait('Levante', #13'Caricamento...');
  try
    DM1.SelezionaCliente(QryMsgID_SOGGETTO, QryMsgPRATICA, QryMsgDATAPRATICA1, '');
  finally
    if not P_NEW_SILENT then DM1.CloseWait;
  end;
end;

procedure TComunicazioneForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
  inherited;
   // IN base al controlla atttivo in questo momento, abilita l'opportuna ricerca
   // ---------------------------------------------------------------------------
   // RAGIONE SOCIALE DESTINATARIO
   if ActiveControlName = 'dbeRagSocCli' then begin
     DM1.SelezionaCliente(QryMsgID_SOGGETTO, QryMsgPRATICA, QryMsgDATAPRATICA1, dbeRagSocCli.Text);
   end;
   // ---------------------------------------------------------------------------
end;

procedure TComunicazioneForm.dbeRagSocCliEnter(Sender: TObject);
begin
  inherited;
  // Attiva il pulsante F5 Trova (se si è in modalità di modifica
  if RxSpeedModifica.Down then RxSpeedButtonTrova.Enabled := True;
  // RIchiama la gestione dell'evento che colora il campo in editing di giallo
  dbeDataEnter(Sender);
end;

procedure TComunicazioneForm.dbeRagSocCliExit(Sender: TObject);
begin
  inherited;
  // Attiva il pulsante F5 Trova (se si è in modalità di modifica
  if RxSpeedModifica.Down then RxSpeedButtonTrova.Enabled := False;
  // RIchiama la gestione dell'evento che colora il campo in editing di giallo
  dbeDataExit(Sender);
end;

procedure TComunicazioneForm.dbeDataEnter(Sender: TObject);
begin
  inherited;
  // Se è in modalità di Modifica...
  if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
  // Aggiorna la variabile che conteiene il nome del controllo che ha il focus
  ActiveControlName := (Sender as TControl).Name;
end;

procedure TComunicazioneForm.dbeDataExit(Sender: TObject);
begin
  inherited;
  // Se è in modalità di Modifica...
  if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TComunicazioneForm.QryMsgID_SOGGETTOChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia, Cellulare, Email');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryMsgID_SOGGETTO.AsString);
      QryCli.Open;
      // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
      if not QryCli.Eof then begin
         QryMsgDEST_RAGSOC.Value      := QryCli.FieldByName('RagioneSociale').AsString;
         QryMsgDEST_INDIRIZZO.Value   := QryCli.FieldByName('Indirizzo').AsString;
         QryMsgDEST_NUMCIVICO.Value   := QryCli.FieldByName('NumCivico').AsString;
         QryMsgDEST_COMUNE.Value      := QryCli.FieldByName('Citta').AsString;
         QryMsgDEST_CAP.Value         := QryCli.FieldByName('CAP').AsString;
         QryMsgDEST_PROVINCIA.Value   := QryCli.FieldByName('Provincia').AsString;
         QryMsgDEST_CELLULARE.Value   := QryCli.FieldByName('Cellulare').AsString;
         QryMsgDEST_EMAIL.Value       := QryCli.FieldByName('Email').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TComunicazioneForm.QryMsgID_PRATICAChange(Sender: TField);
var
  Qry:TIB_Cursor;
begin
  inherited;
  // Se il codice non è valido esce
  if (QryMsgID_PRATICA.AsInteger = 0) then Exit; 
  // Carica la descrizione delle pratiche
  LabelDescPratica.Text := DM1.GetDescrizionePratica(QryMsgID_PRATICA.AsInteger);
  // carica anche il codice e la data di apertura della pratica per compatibilità con il passato
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CODICE, DATAAPERTURA FROM PRATICHE WHERE ID = ' + Sender.AsString);
    Qry.Open;
    if Qry.Eof then raise Exception.Create('Pratica non trovata.');
    QryMsgPRATICA.Value       := Qry.FieldByName('CODICE').Value;
    QryMsgDATAPRATICA1.Value  := Qry.FieldByName('DATAAPERTURA').Value;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TComunicazioneForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
  inherited;
  if not P_NEW_SILENT then DM1.ShowWait('Levante', #13'Caricamento...');
  try
    DM1.VisualizzaCliente(QryMsgID_SOGGETTO.Value);
  finally
    if not P_NEW_SILENT then DM1.CloseWait;
  end;
end;

procedure TComunicazioneForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Logo e titolo della form
  //  NB: Non ho usato la gestione di default perchè altrimenti le installazioni
  //       vecchia non avrebbero avuto alcun titolo in quanto non sarebbero stati
  //       gestiti i valori di default corretti in assenza della relativa Sezione
  //       sul file ini e l'impossiblità di gestire il file Ini stesso
  CaricaIconaDocTipo(Self.Name);
  MainForm.BloccaIconaDocTipo(True, Name);
  // Inizializzazione
  P_NEW_ID_MODELLO  := 0;
  P_NEW_ID_SOGGETTO := 0;
  P_NEW_ID_PRATICA  := 0;
  P_NEW_SILENT      := False;
  // Posizionamento loghi
  LogoSms.Left    := LogoLettera.Left;
  LogoEmail.Left  := LogoLettera.Left;
  // Inizializzazione editor lettera
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  GetFontNames;
  EditorPropertiesSelectionChange(Self);
end;

procedure TComunicazioneForm.QryMsgID_SOURCEChange(Sender: TField);
begin
  inherited;
  // Scollega il gestore di evento perchè altrimenti dava problemi perchè
  //  in alcune situazioni veniva eseguito due volte di seguito con le lettere)
  QryMsgID_SOURCE.OnChange := nil;
  try
    if not P_NEW_SILENT then
      DM1.ShowWait('Levante', 'Caricamento...');
    // Carica i dati del modello specificato
    CaricaModello(Sender.AsInteger, QryMsgMSG_TYPE.AsString);
    // Sostituisce gli eventuali segnaposto presenti nel testo
    //  con i dati effettivi
    if          MainPageControl.ActivePage = TabLettera then
    begin
      CaricaDatiSegnaposto(Editor);
    end
    else
    if MainPageControl.ActivePage = TabEmail then
    begin
      CaricaDatiSegnaposto(dbeEmailCorpo);
    end
    else
    if MainPageControl.ActivePage = TabSms then
    begin
      CaricaDatiSegnaposto(dbeSmsCorpo);
    end;
  finally
    // Ricollega il gestore di evento
    QryMsgID_SOURCE.OnChange := QryMsgID_SOURCEChange;
    // Pulizie finali
    if not P_NEW_SILENT then DM1.CloseWait;
  end;
end;

procedure TComunicazioneForm.QryMsgBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_COM_MESSAGGI');
end;

procedure TComunicazioneForm.QryMsgMSG_TYPEChange(Sender: TField);
begin
  inherited;
  // Seleziona la pagina corretta da visualizzare in base al tipo di messaggio
  //  NB: Seleziona anche il logo
  //  NB: Determina anche quali tabs del PageControl devono essere visibili
  LogoLettera.Visible   := False;
  LogoEmail.Visible     := False;
  LogoSms.Visible       := False;

  TabLettera.TabVisible := False;
  TabEmail.TabVisible   := False;
  TabSms.TabVisible     := False;

  if          Sender.AsString = 'lettera' then begin
    TabLettera.TabVisible := True;
    LogoLettera.Visible := True;
    MainPageControl.ActivePage := TabLettera;
  end else if Sender.AsString = 'e-mail' then begin
    TabEmail.TabVisible := True;
    LogoEmail.Visible := True;
    MainPageControl.ActivePage := TabEmail;
  end else if Sender.AsString = 'sms' then begin
    TabSms.TabVisible := True;
    LogoSms.Visible := True;
    MainPageControl.ActivePage := TabSms;
  end else raise Exception.Create('Tipo di comunicazione non corretto.');
end;





function TComunicazioneForm.GetSMS_CaratteriDisponibili: Integer;
begin
  Result := 160 - Length(dbeSmsCorpo.EditingText);
end;

procedure TComunicazioneForm.dbeSmsCorpoPropertiesChange(Sender: TObject);
begin
  inherited;
  // Aggiorna il contatore dei caratteri rimanenti
  LabelSmsCaratteriDisponibili.Caption := IntToStr(SMS_CaratteriDisponibili);
end;

procedure TComunicazioneForm.RxSpeedButtonStampaClick(Sender: TObject);
begin
  inherited;
  // Stampa
  if not P_NEW_SILENT then DM1.Attendere;
  try
    DM2.LETTERA_Stampa(QryMsgID.AsInteger, 1);
  finally
    if not P_NEW_SILENT then DM1.ChiudiAttendere;
  end;
end;

procedure TComunicazioneForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  // Preview
  if Button = mbRight then begin
    // Preview
    if not P_NEW_SILENT then DM1.Attendere;
    try
      DM2.LETTERA_Stampa(QryMsgID.AsInteger, 1, True);
    finally
      if not P_NEW_SILENT then DM1.ChiudiAttendere;
    end;
  end;
end;

procedure TComunicazioneForm.sbLetteraAnnullaClick(Sender: TObject);
begin
  inherited;
  // Se siamo in modifica prima conferma
  if RxSpeedModifica.Down then begin
    // IMposta la proprietà ForcedModalResult in modo che non venga chiesta conferma
    // all'utente.
    ForcedModalResult := mrNo;
    // Annulla tutto
    RxSpeedModifica.Down := False;
    RxSpeedModificaClick(RxSpeedModifica);
  end;
end;

procedure TComunicazioneForm.sbLetteraInviaClick(Sender: TObject);
var
  TuttoBene: Boolean;
begin
  inherited;

  // Se l'ID è nullo ne assegna uno nuovo
  //  NB: Perchè se è un nuovo messaggio e non è stato ancora confermato non avrebbe l'ID
  if QryMsgID.IsNull then begin
    QryMsgID.Value := DM1.Generators_NextGenID('GEN_ID_COM_MESSAGGI');
    QryMsg.Post;  // Altrimenti non andava bene
  end;

  // ===========================================================================
  // Effettua l'invio della comunicazione  in base al tipo
  // ---------------------------------------------------------------------------
  // ----- Lettera -----
  if          QryMsgMSG_TYPE.AsString = 'lettera' then begin
    if not P_NEW_SILENT then DM1.Attendere;
    try
      TuttoBene := DM2.LETTERA_Stampa(QryMsgID.AsInteger, 1);
    finally
      if not P_NEW_SILENT then DM1.ChiudiAttendere;
    end;

  // ----- E-Mail -----
  end else if QryMsgMSG_TYPE.AsString = 'e-mail' then begin
    if not P_NEW_SILENT then DM1.ShowWait('Levante', 'Invio e-mail in corso...');
    try
      TuttoBene := DM2.EMAIL_Send(QryMsgID.Value, dbeEmailIndirizzo.Text, dbeOggetto.Text, dbeEmailCorpo.Lines);
    finally
      if not P_NEW_SILENT then DM1.CloseWait;
    end;

  // ----- SMS -----
  end else if QryMsgMSG_TYPE.AsString = 'sms' then begin
    if not P_NEW_SILENT then DM1.ShowWait('Levante', 'Invio SMS in corso...');
    try
      // Invia l'SMS
      TuttoBene := DM2.SMS_Invia(QryMsgID.Value, QryMsgDEST_CELLULARE.AsString, dbeSmsCorpo.Text);
      // Carica il credito residuo degli SMS
      DM2.SMS_CreditoResiduoLabel(LabelSmsCreditoResiduo);
    finally
      if not P_NEW_SILENT then DM1.CloseWait;
    end;

  // ----- Tipo non valido -----
  end else raise Exception.Create('Tipo di comunicazione non riconosciuto.');
  // ===========================================================================

  // Se è andato tutto bene
  if TuttoBene then begin
    // Se siamo in modifica prima conferma
    if RxSpeedModifica.Down and TuttoBene then begin
      // IMposta la proprietà ForcedModalResult in modo che non venga chiesta conferma
      // all'utente.
      ForcedModalResult := mrYes;
      // Annulla tutto
      RxSpeedModifica.Down := False;
      RxSpeedModificaClick(RxSpeedModifica);
    end;
    // Messaggio di fine lavoro
    //  NB: Se non siamo in Silent Mode
    if not P_NEW_SILENT
    then DM1.Messaggi('Levante', 'Messaggio inviato.', '', [mbOk], 0, nil);
  end;

end;


procedure TComunicazioneForm.btvStoDATAORAINVIOGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  TmpDateTime: TDateTime;
begin
  inherited;
  // Rielabora il dato
  if VarIsNull(btvSto.DataController.Values[ARecordIndex,Sender.Index]) then Exit;
  TmpDateTime := btvSto.DataController.Values[ARecordIndex,Sender.Index];
  AText := 'Invio del  ' + FormatDateTime('dd/mm/yyyy', TmpDateTime) + '  alle ore  ' + FormatDateTime('hh.nn', TmpDateTime);
end;

procedure TComunicazioneForm.MainPageControlChange(Sender: TObject);
begin
  inherited;
  // Se siamo andati nello storico lo apre
  if MainPageControl.ActivePage = TabStorico then begin
    ApriQueryStorico;
  // Altrimenti la chiude
  end else begin
    QrySto.Close;
  end;
end;

procedure TComunicazioneForm.btvStoOPERATOREGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if AText = '' then AText := '- - -';
end;

procedure TComunicazioneForm.ToolButton1Click(Sender: TObject);
begin
  inherited;
  Editor.Lines.Clear;
end;

procedure TComunicazioneForm.OpenButtonClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
  end;
end;

procedure TComunicazioneForm.PerformFileOpen(const AFileName: string);
begin
  Editor.SetFocus;
  Editor.Lines.LoadFromFile(AFileName);
end;

procedure TComunicazioneForm.SaveButtonClick(Sender: TObject);
begin
  inherited;
  FileSaveAs(Sender)
end;

procedure TComunicazioneForm.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Editor.Lines.SaveToFile(SaveDialog.FileName);
  end;
end;


procedure TComunicazioneForm.CutButtonClick(Sender: TObject);
begin
  inherited;
  Editor.CutToClipboard;
end;

procedure TComunicazioneForm.CopyButtonClick(Sender: TObject);
begin
  inherited;
  Editor.CopyToClipboard;
end;

procedure TComunicazioneForm.PasteButtonClick(Sender: TObject);
begin
  inherited;
  Editor.PasteFromClipboard;
end;

procedure TComunicazioneForm.UndoButtonClick(Sender: TObject);
begin
  inherited;
  with Editor do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TComunicazioneForm.FontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

function TComunicazioneForm.CurrText: TTextAttributes;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;


procedure TComunicazioneForm.FontSizeChange(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TComunicazioneForm.BoldButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TComunicazioneForm.ItalicButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TComunicazioneForm.UnderlineButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TComunicazioneForm.LabelDescPraticaKeyPress(Sender: TObject; var Key: Char);
begin
  if RxSpeedModifica.Down
  and (  (Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)  )
  then
    DM2.ClearCantiereDoc(QryMsgPRATICA, QryMsgDATAPRATICA1, LabelDescPratica);
end;

procedure TComunicazioneForm.LeftAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TComunicazioneForm.CenterAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TComunicazioneForm.RightAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TComunicazioneForm.BulletsButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);
end;

procedure TComunicazioneForm.EditorPropertiesSelectionChange(
  Sender: TObject);
begin
  inherited;
  with Editor.Paragraph do
  try
    FUpdating := True;
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
  finally
    FUpdating := False;
  end;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TComunicazioneForm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;




procedure TComunicazioneForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  // Carica il credito residuo degli SMS
  DM1.ShowWait('Levante', 'Accedo al server degli SMS...');
  try
    DM2.SMS_CreditoResiduoLabel(LabelSmsCreditoResiduo);
    TimerSmsCreditExpired.Enabled := True;
  finally
    DM1.CloseWait;
  end;
end;

procedure TComunicazioneForm.TimerSmsCreditExpiredTimer(Sender: TObject);
begin
  inherited;
  (Sender as TTimer).Enabled := False;
  LabelSmsCreditoResiduo.Caption := '- - -';
end;

end.
