unit SchedaProgressivi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  MPlayer, IniFiles, Buttons,
  DB, IBODataset, bmpPanel, cxStyles, cxGraphics, 
  cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, cxTextEdit, IB_Components,
  cxContainer, cxGroupBox, cxDBEdit, cxCurrencyEdit, cxRadioGroup,
  cxMaskEdit, cxDropDownEdit, cxBlobEdit, Menus, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, dxDateRanges, dxScrollbarAnnotations;

type
  TProgressiviForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    PageControl1: TPageControl;
    TabProgressivi: TTabSheet;
    TabFax: TTabSheet;
    PanelFax: TPanel;
    TabSegreteria: TTabSheet;
    PanelSegreteria: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    PanelTapiDevice: TPanel;
    ComboBoxTapiDevice: TComboBox;
    PanelMessaggioIniziale: TPanel;
    Label50: TLabel;
    MediaPlayerMessaggioIniziale: TMediaPlayer;
    Panel2: TPanel;
    Label46: TLabel;
    MediaPlayerMessaggioFinale: TMediaPlayer;
    PanelSegreteriaOnOff: TPanel;
    SBSegreteria: TSpeedButton;
    TabInternet: TTabSheet;
    PanelInternet: TPanel;
    PanelFax1: TPanel;
    LabelFax1: TLabel;
    RichEdit5: TRichEdit;
    PanelFax2: TPanel;
    LabelFax2: TLabel;
    RichEdit6: TRichEdit;
    Label17: TLabel;
    Label19: TLabel;
    Panel5: TPanel;
    ComboBoxPorta: TComboBox;
    Panel4: TPanel;
    ComboBoxClasse: TComboBox;
    PanelFax3: TPanel;
    LabelFax3: TLabel;
    RichEdit7: TRichEdit;
    Label18: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Edit1: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    PanelFax4: TPanel;
    LabelFax4: TLabel;
    RichEdit8: TRichEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label49: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Panel6: TPanel;
    ComboBoxOraInvio: TComboBox;
    PanelInternet1: TPanel;
    LabelInternet1: TLabel;
    REInternet: TRichEdit;
    Label29: TLabel;
    Edit5: TEdit;
    FaxEnabled: TCheckBox;
    QrySacs: TIBOQuery;
    SourceSacs: TDataSource;
    QrySacsRECORDID: TIntegerField;
    QrySacsBACKUPULTIMO: TDateTimeField;
    QrySacsBACKUPDRIVE: TStringField;
    QrySacsBACKUPPERIODICITA: TIntegerField;
    QrySacsBACKUPCHIAVESACS: TStringField;
    QrySacsBACKUPNUMCOPIE: TIntegerField;
    PanelProg: TScrollBox;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    Label28: TLabel;
    RichEdit1: TRichEdit;
    Prog25: TDBEdit;
    CodiceAutomatico: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Panel3: TPanel;
    SBRendiArticoliMovimentabili: TSpeedButton;
    Panel1: TPanel;
    SBRendiArticoliNonMovimentabili: TSpeedButton;
    CBSoloArticoliPreferiti: TDBCheckBox;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label39: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    RichEdit4: TRichEdit;
    CopiePreventivi: TDBEdit;
    CopieOrdini: TDBEdit;
    CopieOrdiniFornitori: TDBEdit;
    CopieSAL: TDBEdit;
    CopieDDT: TDBEdit;
    CopieFatture: TDBEdit;
    CopieNoteCredito: TDBEdit;
    CopieBolleEntrata: TDBEdit;
    CopieFattureAcquisto: TDBEdit;
    CopieRicevuteFiscali: TDBEdit;
    CopieBuoniConsegna: TDBEdit;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Bevel1: TBevel;
    RichEdit9: TRichEdit;
    Panel8: TPanel;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Panel9: TPanel;
    DBCGiorniBackup: TDBComboBox;
    Panel10: TPanel;
    DBCNumCopie: TDBComboBox;
    DBCheckBox2: TDBCheckBox;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label23: TLabel;
    RichEdit2: TRichEdit;
    DbeCodiceOpera1: TDBEdit;
    DbePrezzoOpera1: TDBEdit;
    DbeDescrizioneOpera1: TDBEdit;
    PanelGruppo5: TPanel;
    Label16: TLabel;
    RichEdit3: TRichEdit;
    DBMStartPreventivo: TDBMemo;
    Shape1: TShape;
    DBMEndPreventivo: TDBMemo;
    Shape2: TShape;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    PanelGruppo6: TPanel;
    Label22: TLabel;
    Label42: TLabel;
    RichEdit10: TRichEdit;
    Panel14: TPanel;
    DBHintEnabled: TCheckBox;
    DBHintDelay: TComboBox;
    Panel11: TPanel;
    SpeedButton1: TSpeedButton;
    Label25: TLabel;
    DBEdit10: TDBEdit;
    CopiaNoteDocScad: TCheckBox;
    Panel13: TPanel;
    SBArticoliConRicarichi: TSpeedButton;
    Panel15: TPanel;
    SBArticoliConSconti: TSpeedButton;
    dbeListiniRicaricoSconto: TcxDBRadioGroup;
    Label37: TLabel;
    Panel16: TPanel;
    DBECodiceDestinazione: TDBComboBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    PanelGruppo7: TPanel;
    Label38: TLabel;
    RichEdit11: TRichEdit;
    DBMemo1: TDBMemo;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    Label54: TLabel;
    DBEdit15: TDBEdit;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    Label55: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    Label56: TLabel;
    eBclConsideraSconto1: TDBCheckBox;
    eBclConsideraSconto2: TDBCheckBox;
    eBclConsideraSconto3: TDBCheckBox;
    Panel7: TPanel;
    SBApplicaScontiAcquisto: TSpeedButton;
    GridRicarichi: TcxGrid;
    tvRicarichi: TcxGridDBTableView;
    lvRicarichi: TcxGridLevel;
    TableRicarichi: TIBOTable;
    TableRicarichiALPREZZO: TIBOFloatField;
    TableRicarichiRICARICO1: TIBOFloatField;
    TableRicarichiRICARICO2: TIBOFloatField;
    TableRicarichiRICARICO3: TIBOFloatField;
    TableRicarichiRICARICO4: TIBOFloatField;
    SourceRIcarichi: TDataSource;
    tvRicarichiALPREZZO: TcxGridDBColumn;
    tvRicarichiRICARICO1: TcxGridDBColumn;
    tvRicarichiRICARICO2: TcxGridDBColumn;
    tvRicarichiRICARICO3: TcxGridDBColumn;
    tvRicarichiRICARICO4: TcxGridDBColumn;
    Shape7: TShape;
    eAbilitaRicarichiPerFascePrezzo: TDBCheckBox;
    Label57: TLabel;
    Panel17: TPanel;
    SBApplicaRicarichiPerFasceDiPrezzo: TSpeedButton;
    Label58: TLabel;
    CopieCaricoCantiere: TDBEdit;
    Label59: TLabel;
    CopieCommessa: TDBEdit;
    Label60: TLabel;
    CopieScaricoCantiere: TDBEdit;
    Label61: TLabel;
    CopieEstrattoConto: TDBEdit;
    PanelGruppo9: TPanel;
    LabelGruppo9: TLabel;
    RichEdit14: TRichEdit;
    Label62: TLabel;
    DBEdit16: TDBEdit;
    Label63: TLabel;
    DBEdit17: TDBEdit;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBCheckBox38: TDBCheckBox;
    DBCheckBox39: TDBCheckBox;
    DBCheckBox40: TDBCheckBox;
    DBCheckBox41: TDBCheckBox;
    Shape8: TShape;
    Label64: TLabel;
    Shape9: TShape;
    DBCheckBox42: TDBCheckBox;
    DBCheckBox44: TDBCheckBox;
    DBCheckBox46: TDBCheckBox;
    Shape10: TShape;
    Label66: TLabel;
    Shape11: TShape;
    LabelTipo1: TLabel;
    LabelTipo2: TLabel;
    LabelTipo3: TLabel;
    LabelTipo4: TLabel;
    LabelTipo5: TLabel;
    LabelTipo6: TLabel;
    DBETipo1: TcxDBComboBox;
    DBETipo2: TcxDBComboBox;
    DBETipo3: TcxDBComboBox;
    DBETipo4: TcxDBComboBox;
    DBETipo5: TcxDBComboBox;
    DBETipo6: TcxDBComboBox;
    LabelTitleTipiRighi: TLabel;
    PanelGruppo10: TPanel;
    LabelGruppo10: TLabel;
    RichEdit16: TRichEdit;
    Label67: TLabel;
    Panel19: TPanel;
    Label68: TLabel;
    Panel20: TPanel;
    DBComboBox1: TDBComboBox;
    Label69: TLabel;
    Panel21: TPanel;
    DBComboBox2: TDBComboBox;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    DbeRicarico1: TDBEdit;
    DbeRicarico2: TDBEdit;
    DbeRicarico3: TDBEdit;
    DbeRicarico4: TDBEdit;
    LabelRIcaricoScontoListini: TLabel;
    DbeCodiceOpera2: TDBEdit;
    DbeDescrizioneOpera2: TDBEdit;
    DbeCodiceOpera3: TDBEdit;
    DbeDescrizioneOpera3: TDBEdit;
    DbeCodiceOpera4: TDBEdit;
    DbeDescrizioneOpera4: TDBEdit;
    DbeCodiceOpera5: TDBEdit;
    DbeDescrizioneOpera5: TDBEdit;
    DbePrezzoOpera2: TDBEdit;
    DbePrezzoOpera3: TDBEdit;
    DbePrezzoOpera4: TDBEdit;
    DbePrezzoOpera5: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    Shape12: TShape;
    Label26: TLabel;
    Label27: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label43: TLabel;
    PrintersList: TComboBox;
    Label44: TLabel;
    DBEAttesaSecondiEmail: TcxDBComboBox;
    DBCheckBox43: TDBCheckBox;
    DbeMsgBolleEntrata: TcxDBBlobEdit;
    DbeMsgBuoniConsegna: TcxDBBlobEdit;
    DbeMsgCaricoCantiere: TcxDBBlobEdit;
    DbeMsgCommessa: TcxDBBlobEdit;
    DbeMsgDDT: TcxDBBlobEdit;
    DbeMsgEstrattoConto: TcxDBBlobEdit;
    DbeMsgFatture: TcxDBBlobEdit;
    DbeMsgFattureAcquisto: TcxDBBlobEdit;
    DbeMsgNoteDiCredito: TcxDBBlobEdit;
    DbeMsgOrdini: TcxDBBlobEdit;
    DbeMsgOrdiniFornitori: TcxDBBlobEdit;
    DbeMsgPreventivi: TcxDBBlobEdit;
    DbeMsgRicevuteFiscali: TcxDBBlobEdit;
    DbeMsgSAL: TcxDBBlobEdit;
    DbeMsgScaricoCantiere: TcxDBBlobEdit;
    DBCheckBox45: TDBCheckBox;
    DBCheckBox47: TDBCheckBox;
    Shape13: TShape;
    Label45: TLabel;
    Shape14: TShape;
    DBCheckBox48: TDBCheckBox;
    PanelGruppo8: TPanel;
    LabelGruppo8: TLabel;
    Label75: TLabel;
    Shape17: TShape;
    Shape18: TShape;
    Label53: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Shape24: TShape;
    RichEdit12: TRichEdit;
    DBEdit1: TDBEdit;
    dbeFL_LogoIntestazione: TDBCheckBox;
    dbeFL_TitoloPrincipale: TDBCheckBox;
    dbeFL_Chiamata: TDBCheckBox;
    DBCheckBox53: TDBCheckBox;
    DBCheckBox54: TDBCheckBox;
    DBCheckBox55: TDBCheckBox;
    DBCheckBox56: TDBCheckBox;
    DBCheckBox57: TDBCheckBox;
    DBCheckBox59: TDBCheckBox;
    DBCheckBox61: TDBCheckBox;
    DBCheckBox62: TDBCheckBox;
    DBCheckBox64: TDBCheckBox;
    DBCheckBox66: TDBCheckBox;
    DBCheckBox67: TDBCheckBox;
    DBCheckBox68: TDBCheckBox;
    DBCheckBox69: TDBCheckBox;
    dbeFL_Appuntamento: TDBCheckBox;
    DBCheckBox49: TDBCheckBox;
    DBCheckBox50: TDBCheckBox;
    DBCheckBox51: TDBCheckBox;
    DBCheckBox52: TDBCheckBox;
    DBCheckBox70: TDBCheckBox;
    Panel12: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox71: TDBCheckBox;
    DBCheckBox72: TDBCheckBox;
    DBEdit2: TDBEdit;
    Label76: TLabel;
    Panel22: TPanel;
    Label77: TLabel;
    Label78: TLabel;
    Shape15: TShape;
    Shape16: TShape;
    Label79: TLabel;
    Shape19: TShape;
    Shape20: TShape;
    Shape23: TShape;
    RichEdit13: TRichEdit;
    DBEdit3: TDBEdit;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox58: TDBCheckBox;
    Panel23: TPanel;
    DBRadioGroup2: TDBRadioGroup;
    DBCheckBox60: TDBCheckBox;
    DBCheckBox63: TDBCheckBox;
    Panel24: TPanel;
    Label80: TLabel;
    Label81: TLabel;
    Shape25: TShape;
    Shape26: TShape;
    Label82: TLabel;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    RichEdit17: TRichEdit;
    DBEdit4: TDBEdit;
    cbLogoIntestazione: TDBCheckBox;
    cbDatiAppuntamento: TDBCheckBox;
    cbMotivoChiamata: TDBCheckBox;
    cbIndirizzoImmobile: TDBCheckBox;
    cbDatiRespImp: TDBCheckBox;
    cbDatiPropCompleti: TDBCheckBox;
    cbDatiOccupanteCompleti: TDBCheckBox;
    cbDatiAmministratoreCompleti: TDBCheckBox;
    cbDatiImpianto: TDBCheckBox;
    cbDatiAbbonamentoContratto: TDBCheckBox;
    cbInterventiPrecedenti: TDBCheckBox;
    cbRaportoIntervento: TDBCheckBox;
    cbElencoRicambi: TDBCheckBox;
    cbAltreSpese: TDBCheckBox;
    cbFirme: TDBCheckBox;
    cbLogoPiede: TDBCheckBox;
    cbLuogoAppuntamento: TDBCheckBox;
    cbPrescrizioni: TDBCheckBox;
    cbDatiSoggetto: TDBCheckBox;
    cbNoteSoggetto: TDBCheckBox;
    cbDatiProprietario: TDBCheckBox;
    cbNoteImpianto: TDBCheckBox;
    Panel25: TPanel;
    rbDatiAppCompletiONo: TDBRadioGroup;
    cbFogliLavoroSeparatiPerApp: TDBCheckBox;
    cbOperazioniPianificate: TDBCheckBox;
    PanelCopia: TPanel;
    LabelCopieFoglioDiLavoro: TDBEdit;
    Label83: TLabel;
    cbSoloOPDaFare: TDBCheckBox;
    PanelGruppo11: TPanel;
    LabelGruppo11: TLabel;
    Label85: TLabel;
    RichEdit18: TRichEdit;
    Panel27: TPanel;
    AllegatoFGPrintersList: TDBComboBox;
    PanelGruppo12: TPanel;
    LabelGruppo12: TLabel;
    RichEdit19: TRichEdit;
    Label84: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    dbeSmtpSecure: TcxDBComboBox;
    Label89: TLabel;
    Label90: TLabel;
    RichEdit20: TRichEdit;
    dbeSmtpFrom: TcxDBTextEdit;
    dbeSmtpHost: TcxDBTextEdit;
    dbeSmtpPort: TcxDBTextEdit;
    dbeSmtpUser: TcxDBTextEdit;
    dbeSmtpPassword: TcxDBTextEdit;
    PanelGruppo13: TPanel;
    LabelGruppo13: TLabel;
    RichEdit21: TRichEdit;
    Label91: TLabel;
    dbeSmsMittente: TcxDBTextEdit;
    Label92: TLabel;
    Label93: TLabel;
    dbeSmsUser: TcxDBTextEdit;
    dbeSmsPassword: TcxDBTextEdit;
    Label94: TLabel;
    dbeSmsSogliaAvviso: TcxDBTextEdit;
    Image1: TImage;
    Label95: TLabel;
    LabelSmsCreditoResiduo: TLabel;
    SpeedButton2: TSpeedButton;
    TimerSmsCreditExpired: TTimer;
    Label96: TLabel;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Label97: TLabel;
    PanelGruppo0: TPanel;
    LabelGruppo0: TLabel;
    RichEdit22: TRichEdit;
    DBCheckBox97: TDBCheckBox;
    DBCheckBox98: TDBCheckBox;
    DBCheckBox101: TDBCheckBox;
    Label65: TLabel;
    Panel18: TPanel;
    ButtonRepository: TSpeedButton;
    eRepositoryPassword: TcxTextEdit;
    Shape34: TShape;
    PanelGruppo14: TPanel;
    LabelGruppo14: TLabel;
    RichEdit15: TRichEdit;
    eGoogleTaskEnabled: TDBCheckBox;
    eGoogleCalEnabled: TDBCheckBox;
    Shape35: TShape;
    Label98: TLabel;
    Label99: TLabel;
    eGoogleUsername: TcxDBTextEdit;
    eGooglePassword: TcxDBTextEdit;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Panel26: TPanel;
    sbGoogleTasksResetRefreshToken: TSpeedButton;
    Panel28: TPanel;
    sbGoogleCalResetRefreshToken: TSpeedButton;
    dbeAllegatiApriChiudi: TCheckBox;
    DBCheckBox99: TDBCheckBox;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    RxLabel15: TLabel;
    Shape36: TShape;
    Label103: TLabel;
    Shape37: TShape;
    DBCheckBox102: TDBCheckBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label104: TLabel;
    Label105: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Bevel3: TBevel;
    Label74: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    DbeSconto1: TDBEdit;
    DbeSconto2: TDBEdit;
    DbeSconto3: TDBEdit;
    DbeSconto4: TDBEdit;
    cbBolloAutomatico: TDBCheckBox;
    eBolloAutomaticoImporto: TDBEdit;
    eBolloAutomaticoSoglia: TDBEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label110: TLabel;
    DbeCostoOpera1: TDBEdit;
    DbeCostoOpera2: TDBEdit;
    DbeCostoOpera3: TDBEdit;
    DbeCostoOpera4: TDBEdit;
    DbeCostoOpera5: TDBEdit;
    Label111: TLabel;
    QrySacsBACKUPENABLED: TStringField;
    cdAbilitaSACS: TDBCheckBox;
    Dbe_FL_Messaggio: TcxDBBlobEdit;
    Label112: TLabel;
    Label113: TLabel;
    Dbe_FL_Messaggio_Altezza: TDBEdit;
    Label114: TLabel;
    DbeFLRappIntNumRigheDataOraInizioFine: TcxDBComboBox;
    Label115: TLabel;
    Dbe_FL_RappInt_AltezzaRelazInt: TDBEdit;
    cbStatoDocumento: TDBCheckBox;
    cbDatiIntestazioneFattura: TDBCheckBox;
    dbeTitoloAppuntamento: TDBEdit;
    Label116: TLabel;
    Label117: TLabel;
    dbeTitoloChiamata: TDBEdit;
    Label118: TLabel;
    dbeTitoloDatiSoggetto: TDBEdit;
    Label119: TLabel;
    dbeTitoloNoteSoggetto: TDBEdit;
    Label120: TLabel;
    dbeTitoloLuogoAppuntamento: TDBEdit;
    Label121: TLabel;
    dbeTitoloMotivoChiamata: TDBEdit;
    Panel29: TPanel;
    Label122: TLabel;
    RichEdit23: TRichEdit;
    DBCheckBox65: TDBCheckBox;
    Label123: TLabel;
    DBCheckBox73: TDBCheckBox;
    Label124: TLabel;
    dbeSmtpFromName: TcxDBTextEdit;
    Label125: TLabel;
    eIdBacheca: TcxTextEdit;
    Label126: TLabel;
    cbAddebitaBollo: TDBCheckBox;
    cbRichiedente: TDBCheckBox;
    Label127: TLabel;
    dbeTitoloRichiedente: TDBEdit;
    Label128: TLabel;
    Panel30: TPanel;
    Label129: TLabel;
    RichEdit24: TRichEdit;
    Label130: TLabel;
    eChiusuraAutomatica_Enabled: TDBCheckBox;
    Label412: TLabel;
    DBCheckBox74: TDBCheckBox;
    Label409: TLabel;
    DBCheckBox75: TDBCheckBox;
    DBCheckBox76: TDBCheckBox;
    Label411: TLabel;
    Label131: TLabel;
    eIncludiOPFatte: TDBCheckBox;
    eIncludiRifContratto: TDBCheckBox;
    eIncludiDicitura: TDBCheckBox;
    eDicitura: TDBEdit;
    Label132: TLabel;
    Label415: TLabel;
    ePanelDefaultProxVisitaInBase: TPanel;
    rgPanelDefaultProxVisitaInBase: TDBRadioGroup;
    Label133: TLabel;
    ePanelCalcoloProxVisitaAPartireDa: TPanel;
    rgPanelCalcoloProxVisitaAPartireDa: TDBRadioGroup;
    Label417: TLabel;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBSegreteriaClick(Sender: TObject);
    procedure CaricaParametri;
    procedure SalvaParametri;
    procedure MediaPlayerMessaggioInizialeClick(Sender: TObject;
      Button: TMPBtnType; var DoDefault: Boolean);
    procedure MediaPlayerMessaggioFinaleClick(Sender: TObject;
      Button: TMPBtnType; var DoDefault: Boolean);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure Prog1Enter(Sender: TObject);
    procedure Prog1Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxPortaDropDown(Sender: TObject);
    procedure RxSpeedButtonVisualizzaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure RendiTuttiArticoliMovimentabili(S:Boolean);
    procedure SBRendiArticoliMovimentabiliClick(Sender: TObject);
    procedure SBRendiArticoliNonMovimentabiliClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBArticoliConRicarichiClick(Sender: TObject);
    procedure SBApplicaScontiAcquistoClick(Sender: TObject);
    procedure tvRicarichiCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvRicarichiCustomDrawGroupCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure tvRicarichiCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure SBApplicaRicarichiPerFasceDiPrezzoClick(Sender: TObject);
    procedure ImpostaScontiDiAcquistoDaConsiderare(UsaSc1,UsaSc2,UsaSc3:Boolean; SoloArticoliAppenaImportati:Boolean=False);
    procedure ButtonRepositoryClick(Sender: TObject);
    procedure DBETipo1PropertiesInitPopup(Sender: TObject);
    procedure PrintersListDropDown(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure AllegatoFGPrintersListDropDown(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TimerSmsCreditExpiredTimer(Sender: TObject);
    procedure sbGoogleTasksResetRefreshTokenClick(Sender: TObject);
    procedure sbGoogleCalResetRefreshTokenClick(Sender: TObject);
    procedure eIdBachecaKeyPress(Sender: TObject; var Key: Char);
    procedure eRepositoryPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure eIdBachecaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);

  private
    procedure ImpostaTipoCalcoloListini(NewValue: STring);
    procedure CaricaFormLayout;
    procedure CaricaTitoli;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgressiviForm: TProgressiviForm;

implementation

uses DataModule1, main, FormHelp, FormRepository, StrUtils, Printers,
  DataModule2, Variants;

{$R *.DFM}

procedure TProgressiviForm.CaricaTitoli;
var
  M: TMemIniFile;
  Sez: String;
begin
  M := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    // ----- TIPI RIGHI (CONTI) -----
    Sez := 'ParametriProgressivi';
    LabelTitleTipiRighi.Caption :=  M.ReadString(Sez, 'TitoloTipiRighi', '');
    LabelTipo1.Caption := M.ReadString(Sez, 'TipiRighi1', 'Tipo 1');
    LabelTipo2.Caption := M.ReadString(Sez, 'TipiRighi2', 'Tipo 2');
    LabelTipo3.Caption := M.ReadString(Sez, 'TipiRighi3', 'Tipo 3');
    LabelTipo4.Caption := M.ReadString(Sez, 'TipiRighi4', 'Tipo 4');
    LabelTipo5.Caption := M.ReadString(Sez, 'TipiRighi5', 'Tipo 5');
    LabelTipo6.Caption := M.ReadString(Sez, 'TipiRighi6', 'Tipo 6');
  finally
    M.Free;
  end;
end;

procedure TProgressiviForm.CaricaFormLayout;
var
  LO: TMemIniFile;
  Sez: String;
begin
   // Caricamento di titoli e captions
   CaricaTitoli;
   // Apertura file layouts.ini
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
     // ========================================================================
     // TIPI RIGHI (CONTI)
     // ------------------------------------------------------------------------
     Sez := 'ParametriProgressivi';
     if LO.ReadBool(Sez, 'TipiRighi1', False) then begin
       LabelTipo1.Visible := True;
       DBETipo1.Visible := True;
     end;
     if LO.ReadBool(Sez, 'TipiRighi2', False) then begin
       LabelTipo2.Visible := True;
       DBETipo2.Visible := True;
     end;
     if LO.ReadBool(Sez, 'TipiRighi3', False) then begin
       LabelTipo3.Visible := True;
       DBETipo3.Visible := True;
     end;
     if LO.ReadBool(Sez, 'TipiRighi4', False) then begin
       LabelTipo4.Visible := True;
       DBETipo4.Visible := True;
     end;
     if LO.ReadBool(Sez, 'TipiRighi5', False) then begin
       LabelTipo5.Visible := True;
       DBETipo5.Visible := True;
     end;
     if LO.ReadBool(Sez, 'TipiRighi6', False) then begin
       LabelTipo6.Visible := True;
       DBETipo6.Visible := True;
     end;
     // ========================================================================
   finally
     LO.Free;
   end;
end;



procedure TProgressiviForm.ImpostaScontiDiAcquistoDaConsiderare(UsaSc1,UsaSc2,UsaSc3:Boolean; SoloArticoliAppenaImportati:Boolean=False);
var
   Qry, Qry2 : TIB_Cursor;
   Sc1, Sc2, Sc3, CostoBaseCalcoloListini, CostoReale, ScontoDiAcquisto1, ScontoDiAcquisto2, ScontoDiAcquisto3: Double;
   Csc1, Csc2, Csc3: String;
   TotalCount, PartialCount: Integer;
begin
   try
      DM1.ShowWait('', 'Inizializzazione...');
      // Inizializzazione
      TotalCount := 0;
      PartialCount := 0;
      if UsaSc1 then Csc1 := 'T' else Csc1 := 'F';
      if UsaSc2 then Csc2 := 'T' else Csc2 := 'F';
      if UsaSc3 then Csc3 := 'T' else Csc3 := 'F';
      Qry := TIB_Cursor.Create(Self);
      Qry2 := TIB_Cursor.Create(Self);
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry2.DatabaseName := DM1.ArcDBFile;
      Qry2.IB_Connection := DM1.DBAzienda;

      // Imposta la query che preleverà l'elenco degli articoli da aggiornare
      Qry.SQL.Add('SELECT CODICEARTICOLO, SCONTODIACQUISTO, SCONTODIACQUISTO2, SCONTODIACQUISTO3, PREZZODILISTINO, RICARICO, RICARICO2, RICARICO3, RICARICO4 FROM ARTICOLI');
      if SoloArticoliAppenaImportati then Qry.SQL.Add('WHERE FLAGAPPENAIMPORTATO=''A''');

      // IMposta la query per l'UPDATE dell'articolo con i nuovi sconti
      Qry2.SQL.Add('UPDATE ARTICOLI SET');
      Qry2.SQL.Add(' SCONTODIACQUISTO  = :P_SCONTOACQUISTO1,');
      Qry2.SQL.Add(' SCONTODIACQUISTO2 = :P_SCONTOACQUISTO2,');
      Qry2.SQL.Add(' SCONTODIACQUISTO3 = :P_SCONTOACQUISTO3,');
      Qry2.SQL.Add(' BCL_CONSIDERA_SCONTO1 = ''' + Csc1 + ''',');
      Qry2.SQL.Add(' BCL_CONSIDERA_SCONTO2 = ''' + Csc2 + ''',');
      Qry2.SQL.Add(' BCL_CONSIDERA_SCONTO3 = ''' + Csc3 + ''',');
      Qry2.SQL.Add(' ULTIMOPRZACQUISTO = :P_ULTIMOPRZACQUISTO,');
      Qry2.SQL.Add(' COSTOREALE = :P_COSTOREALE');
      Qry2.SQL.Add('WHERE CODICEARTICOLO = :P_CODICEARTICOLO');

      // Avvio transazione
      DM1.DBAzienda.StartTransaction;
      try
        // Apre l'elenco degli articoli e cicla per tutti gli articoli trovati per aggiornarli
        DM1.ShowWait('', 'Caricamento elento articoli...');
        Qry.Open;
        while not Qry.Eof do begin
          // Incrementa i contatori
          Inc(TotalCount);
          Inc(PartialCount);
          if PartialCount >= 133 then begin
            PartialCount := 0;
            DM1.ShowWait('', 'Impostazione sconti da considerare - Articolo N° ' + IntToStr(TotalCount));
          end;
          // Carica in variabili locali per comodità gli sconti di acquisto dell'articolo
          //  corrente oppure se è un nuovo articolo e stiamo ricalcolando gli sconti per articoli
          //  appena importati imposta lo sconto base di default.
          if SoloArticoliAppenaImportati and (Qry.FieldByName('SCONTODIACQUISTO').IsNull) then begin
            ScontoDiAcquisto1 := DM1.TableProgressiviSCONTOBASEACQ.AsFloat;
            ScontoDiAcquisto2 := 0;
            ScontoDiAcquisto3 := 0;
          end else begin
            ScontoDiAcquisto1 := Qry.FieldByName('SCONTODIACQUISTO').AsDouble;
            ScontoDiAcquisto2 := Qry.FieldByName('SCONTODIACQUISTO2').AsDouble;
            ScontoDiAcquisto3 := Qry.FieldByName('SCONTODIACQUISTO3').AsDouble;
          end;
          // Imposta il valore degli sconti da usare per il calcolo della base per il calcolo dei listini di vendita
          if UsaSc1 then Sc1 := ScontoDiAcquisto1 else Sc1 := 0;
          if UsaSc2 then Sc2 := ScontoDiAcquisto2 else Sc2 := 0;
          if UsaSc3 then Sc3 := ScontoDiAcquisto3 else Sc3 := 0;
          // Calcola il costo usato come base per il calcolo dei listini di vendita
          CostoBaseCalcoloListini := DM1.CalcolaImportoScontato(Qry.FieldByName('PREZZODILISTINO').AsDouble, Sc1, Sc2, Sc3, DM1.DecMicroPrz);
          // Calcola il costo reale considerando tutti i possibili sconti.
          CostoReale := DM1.CalcolaImportoScontato(Qry.FieldByName('PREZZODILISTINO').AsDouble,
                                                                    ScontoDiAcquisto1,
                                                                    ScontoDiAcquisto2,
                                                                    ScontoDiAcquisto3,
                                                                    DM1.DecMicroPrz);
          // Aggiorna l'articolo
          if not Qry2.Prepared then Qry2.Prepare;
          Qry2.Params.ParamByName('P_SCONTOACQUISTO1').AsDouble := ScontoDiAcquisto1;
          Qry2.Params.ParamByName('P_SCONTOACQUISTO2').AsDouble := ScontoDiAcquisto2;
          Qry2.Params.ParamByName('P_SCONTOACQUISTO3').AsDouble := ScontoDiAcquisto3;
          Qry2.Params.ParamByName('P_CODICEARTICOLO').AsString := Qry.FieldByName('CODICEARTICOLO').AsString;
          Qry2.Params.ParamByName('P_ULTIMOPRZACQUISTO').AsDouble := CostoBaseCalcoloListini;
          Qry2.Params.ParamByName('P_COSTOREALE').AsDouble := CostoReale;
          Qry2.ExecSQL;
          // Passa al prox articolo
          Qry.Next;
        end;
        // Ricalcola i listini di vendita
        DM1.EseguiQueryCalcolaListini(SoloArticoliAppenaImportati);
        // Conferma la transazione
        DM1.DBAzienda.Commit;
      except
        // Annulla la transazione
        DM1.DBAzienda.Rollback;
      end;
   finally
      if Assigned(Qry) then begin
        Qry.Close;
        Qry.Free;
      end;
      if Assigned(Qry2) then begin
        Qry2.Close;
        Qry2.Free;
      end;
   end;
end;


procedure TProgressiviForm.ImpostaTipoCalcoloListini(NewValue:STring);
var
   Qry : TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(Self);
   try
      // Inizializzazione
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // IMposta la query che renderà tutti gli articoli movimentabili o meno
      Qry.SQL.Add('UPDATE ARTICOLI SET TIPOCALCOLOLISTINO = ''' + NewValue + '''');
      Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;


procedure TProgressiviForm.RendiTuttiArticoliMovimentabili(S:Boolean);
var
   V : String;
   Qry : TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(Self);
   try
      // Inizializzazione
      if S then V := 'T' else V := 'F';
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // IMposta la query che renderà tutti gli articoli movimentabili o meno
      Qry.SQL.Add('UPDATE ARTICOLI SET ABILITAMOVMAG = ''' + V + '''');
      Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;


procedure TProgressiviForm.CaricaParametri;
var
   P:TMemIniFile;
begin
   // =======================================================================
   // ALL USERS
   // -----------------------------------------------------------------------
   // Carica parametro AllUsers
   P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
   try
      if PageControl1.ActivePage = TabProgressivi  then begin
         // ======================================================================================================================================
         // PARAMETRI E PROGRESSIVI
         // --------------------------------------------------------------------------------------------------------------------------------------
         CopiaNoteDocScad.Checked := P.ReadBool('SCADENZE', 'CopiaNoteDocumentoSulleScadenze', False);

         DBHintEnabled.Checked := P.ReadBool('HINTS', 'HintEnabled', True);
         DBHintDelay.Text := IntToStr(P.ReadInteger('HINTS', 'HintDelay', 5));
         // ======================================================================================================================================
      end else if PageControl1.ActivePage = TabFax then begin
         // ======================================================================================================================================
         // FAX
         // --------------------------------------------------------------------------------------------------------------------------------------
         FaxEnabled.Checked             := P.ReadBool('FAX', 'AbilitaFAX', False);
         ComboBoxPorta.Text             := P.ReadString('FAX', 'PortaCOM' , '1');
         ComboBoxClasse.Text            := P.ReadString('FAX', 'ClasseFAX' , 'Classe 1');
         ComboBoxOraInvio.Text          := P.ReadString('FAX', 'OraPredefinitaInvioFAX' , 'Immediatamente');
         Edit1.Text                     := P.ReadString('FAX', 'PrefissoLineaEsterna' , '');
         Edit7.Text                     := P.ReadString('FAX', 'TentativiChiamata' , '3');
         Edit8.Text                     := P.ReadString('FAX', 'IntervalloTraTentativi' , '60');
         Edit9.Text                     := P.ReadString('FAX', 'SquilliRisposta' , '0');
         Edit10.Text                    := P.ReadString('FAX', 'IntervalloControlloCoda' , '60');
         // ======================================================================================================================================
      end else if PageControl1.ActivePage = TabSegreteria then begin
         // ======================================================================================================================================
         // SEGRETERIA
         // --------------------------------------------------------------------------------------------------------------------------------------
//    if P.ReadBool('SEGRETERIA', 'AbilitaSegreteria', False) then begin
//       SBSegreteria.Glyph.LoadFromFile(DM1.CurrDir + 'ledon.bmp');
//       SBSegreteria.Font.Color := clRed;
//       SBSegreteria.Tag := 1;
//    end else begin
//       SBSegreteria.Glyph.LoadFromFile(DM1.CurrDir + 'ledoff.bmp');
//       SBSegreteria.Font.Color := clBlack;
//       SBSegreteria.Tag := 0;
//    end;
//    ComboBoxTapiDevice.Text := P.ReadString('SEGRETERIA', 'DispositivoTAPI' , '');
//    Edit2.Text := P.ReadString('SEGRETERIA', 'SquilliRisposta' , '6');
//    Edit3.Text := P.ReadString('SEGRETERIA', 'MaxSecondiMessaggio' , '30');
//    Edit4.Text := P.ReadString('SEGRETERIA', 'RitardoRiconfigurazione' , '3');

   // Solo se è abilitato il modulo segreteria e solo se è visualizzata la pagina della segreteria
//   if (StrToInt(DM1.SKeyData[MOD_SEGRETERIA]) > 0)and(PageControl1.ActivePage = TabSegreteria) then begin
//      MediaPlayerMessaggioIniziale.FileName := DM1.CurrDir + 'WelcMsg.wav';
//      MediaPlayerMessaggioFinale.FileName   := DM1.CurrDir + 'EndMsg.wav';
//      MediaPlayerMessaggioIniziale.Enabled  := True;
//      MediaPlayerMessaggioFinale.Enabled    := True;
//      MediaPlayerMessaggioIniziale.Open;
//      MediaPlayerMessaggioFinale.Open;
//   end else begin
//      MediaPlayerMessaggioIniziale.Enabled  := False;
//      MediaPlayerMessaggioFinale.Enabled    := False;
//      MediaPlayerMessaggioIniziale.FileName := '';
//      MediaPlayerMessaggioFinale.FileName   := '';
//   end;
         // ======================================================================================================================================
      end;
   finally
      P.Free;
   end;
      // =======================================================================




   // =======================================================================
   // USER
   // -----------------------------------------------------------------------
   // Carica parametro dello USER attuale
   P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
   try
      if PageControl1.ActivePage = TabProgressivi  then begin
         // ======================================================================================================================================
         // PARAMETRI E PROGRESSIVI
         // --------------------------------------------------------------------------------------------------------------------------------------
         dbeAllegatiApriChiudi.Checked := P.ReadBool('ALLEGATI', 'ApriChiudiAutomaticamente', True);
         PrintersList.Text := P.ReadString('ETICHETTE', 'LabelPrinter', '');
         // ID per fare in modo che la bacheca non sia condivisa tra tutti gli utenti (wuando non si usano nume utente e password)
         eIdBacheca.Text := P.ReadString('BACHECA', 'IDBacheca', '');
         // ======================================================================================================================================
      end else if PageControl1.ActivePage = TabInternet then begin
         // ======================================================================================================================================
         // INTERNET
         // --------------------------------------------------------------------------------------------------------------------------------------
         Edit5.Text := P.ReadString('INTERNET', 'WebBrowser' , 'c:\progra~1\intern~1\iexplore.exe');
         // ======================================================================================================================================
      end;
   finally
      P.Free;
   end;
      // =======================================================================
end;


procedure TProgressiviForm.SalvaParametri;
var
   P:TMemIniFile;
begin
   // =======================================================================
   // ALL USERS
   // -----------------------------------------------------------------------
   // Carica parametro AllUsers
   P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
   try
      if PageControl1.ActivePage = TabProgressivi  then begin
         // ======================================================================================================================================
         // PARAMETRI E PROGRESSIVI
         // --------------------------------------------------------------------------------------------------------------------------------------
         P.WriteBool('SCADENZE', 'CopiaNoteDocumentoSulleScadenze', CopiaNoteDocScad.Checked);

         P.WriteBool('HINTS', 'HintEnabled', DBHintEnabled.Checked);
         P.WriteInteger('HINTS', 'HintDelay', StrToInt(DBHintDElay.Text));
         // ======================================================================================================================================
      end else if PageControl1.ActivePage = TabFax then begin
         // ======================================================================================================================================
         // FAX
         // --------------------------------------------------------------------------------------------------------------------------------------
         if FaxEnabled.Checked then P.WriteBool('FAX', 'AbilitaFax', True) else P.WriteBool('FAX', 'AbilitaFax', False);
         P.WriteBool('FAX', 'AbilitaFax', FaxEnabled.Checked);
         P.WriteString('FAX', 'PortaCOM' , ComboBoxPorta.Text);
         P.WriteString('FAX', 'ClasseFAX' , ComboBoxClasse.Text);
         P.WriteString('FAX', 'OraPredefinitaInvioFAX' , ComboBoxOraInvio.Text);
         P.WriteString('FAX', 'PrefissoLineaEsterna' , Edit1.Text);
         P.WriteString('FAX', 'TentativiChiamata' , Edit7.Text);
         P.WriteString('FAX', 'IntervalloTraTentativi' , Edit8.Text);
         P.WriteString('FAX', 'SquilliRisposta' , Edit9.Text);
         P.WriteString('FAX', 'IntervalloControlloCoda' , Edit10.Text);
         // ======================================================================================================================================
      end else if PageControl1.ActivePage = TabSegreteria then begin
         // ======================================================================================================================================
         // SEGRETERIA
         // --------------------------------------------------------------------------------------------------------------------------------------
//         if SBSegreteria.Tag = 1 then P.WriteBool('SEGRETERIA', 'AbilitaSegreteria', True) else P.WriteBool('SEGRETERIA', 'AbilitaSegreteria', False);
//         P.WriteString('SEGRETERIA', 'DispositivoTAPI' , ComboBoxTapiDevice.Text);
//         P.WriteString('SEGRETERIA', 'SquilliRisposta' , Edit2.Text);
//         P.WriteString('SEGRETERIA', 'MaxSecondiMessaggio' , Edit3.Text);
//         P.WriteString('SEGRETERIA', 'RitardoRiconfigurazione' , Edit4.Text);
//         // Solo se è abilitato il modulo segreteria e solo se è visualizzata la pagina della segreteria
//         if (StrToInt(DM1.SKeyData[MOD_SEGRETERIA]) > 0)and(PageControl1.ActivePage = TabSegreteria) then begin
//            MediaPlayerMessaggioIniziale.Save;
//            MediaPlayerMessaggioFinale.Save;
//            MediaPlayerMessaggioIniziale.Enabled  := False;
//            MediaPlayerMessaggioFinale.Enabled    := False;
//            MediaPlayerMessaggioIniziale.FileName := '';
//            MediaPlayerMessaggioFinale.FileName   := '';
//         end;
         // ======================================================================================================================================
      end;
   finally
      P.UpdateFile;
      P.Free;
   end;
      // =======================================================================




   // =======================================================================
   // USER
   // -----------------------------------------------------------------------
   // Carica parametro AllUsers
   P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
   try
      if PageControl1.ActivePage = TabProgressivi  then begin
         // ======================================================================================================================================
         // PARAMETRI E PROGRESSIVI
         // --------------------------------------------------------------------------------------------------------------------------------------
         // Salva il parametro ch determina se il pannello degli allegati (Post-It) si apre o chiude automaticamente
         P.WriteBool('ALLEGATI', 'ApriChiudiAutomaticamente', dbeAllegatiApriChiudi.Checked);
         DM1.AllegatiApriChiudiAutomatico := P.ReadBool('ALLEGATI', 'ApriChiudiAutomaticamente', True);
         // Carica subito il nome dell'eventuale stampante dedicata alla stampa delle etichette
         P.WriteString('ETICHETTE', 'LabelPrinter', PrintersList.Text);
         DM1.DefaultLabelPrinterName := P.ReadString('ETICHETTE', 'LabelPrinter', '');
         // ID per fare in modo che la bacheca non sia condivisa tra tutti gli utenti (wuando non si usano nume utente e password)
         P.WriteString('BACHECA', 'IDBacheca', Trim(eIdBacheca.Text));
         // ======================================================================================================================================
      end else if PageControl1.ActivePage = TabInternet then begin
         // ======================================================================================================================================
         // INTERNET
         // --------------------------------------------------------------------------------------------------------------------------------------
         P.WriteString('INTERNET', 'WebBrowser' , Edit5.Text);
         // ======================================================================================================================================
      end;
   finally
      P.UpdateFile;
      P.Free;
   end;
      // =======================================================================
end;


procedure TProgressiviForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     close;
end;



procedure TProgressiviForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
  try
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then begin
          DM1.ShowWait('Levante', 'Attendere...');
          PanelGruppo6.Enabled := True;
          PanelGruppo2.Enabled    := True;
          // Abilita la modifica dei campi
          DM1.TableProgressivi.Edit;
          DM1.TableProgressivi2.Edit;
          QrySacs.Edit;
          if (PageControl1.ActivePage = TabProgressivi) then begin
             RxSpeedButtonNuovo.Enabled        := True;
             RxSpeedButtonElimina.Enabled      := True;
          end;
//          MediaPlayerMessaggioIniziale.VisibleButtons := [btPlay, btPause, btStop, btRecord];
//          MediaPlayerMessaggioFinale.VisibleButtons   := [btPlay, btPause, btStop, btRecord];
          DM1.ColoraTuttiCampi(ProgressiviForm, COLOR_MODIFICA);
          // IN base al Tab Selezionato sposta il focus di conseguenza
//          if      PageControl1.ActivePage = TabProgressivi  then DbeCodiceOpera1.SetFocus
//          else if PageControl1.ActivePage = TabFax          then FaxEnabled.SetFocus
//          else if PageControl1.ActivePage = TabSegreteria   then ComboBoxTapiDevice.SetFocus
//          else if PageControl1.ActivePage = TabInternet     then Edit5.SetFocus;
          // Imposta la griglia delle fasce di ricarico per permettere l'editing
          DM1.GridEdit(tvRicarichi, True);
          tvRicarichi.Styles.Background         := DM1.tvBackgroundModifica;
          tvRicarichi.Styles.ContentEven        := DM1.tvContentEvenModifica;
          tvRicarichi.Styles.ContentOdd         := DM1.tvContentOddModifica;
          eIdBacheca.Properties.ReadOnly := False;
     end else begin
          PanelGruppo6.Enabled := False;
          PanelGruppo2.Enabled    := False;
          // Disabilita la modifica dei campi
          DM1.TableProgressivi.Edit;
          DM1.TableProgressivi2.Edit;
          QrySacs.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
             DM1.ShowWait('Levante', 'Attendere...');
             DM1.TableProgressivi.Post;
             DM1.TableProgressivi2.Post;
             QrySacs.Post;
             SalvaParametri;
             DM1.CaricaParametriProgressivi;
             // Se la tabella dei ricarichi era in fase di inserimento di un nuovo record oppure
             //  in fase di modifica di un record esistente conferma il record
             if TableRicarichi.State <> dsBrowse then begin
               DbeCodiceOpera1.SetFocus;
               GridRicarichi.SetFocus;
               TableRicarichi.Post;
             end;
             DM1.GridEdit(tvRicarichi, False);
          end else if MR = mrNo then begin
             DM1.ShowWait('Levante', 'Attendere...');
             DM1.TableProgressivi.Cancel;
             DM1.TableProgressivi2.Cancel;
             QrySacs.Cancel;
             // Se la tabella dei ricarichi era in fase di inserimento di un nuovo record oppure
             //  in fase di modifica di un record esistente conferma il record
             if TableRicarichi.State <> dsBrowse then begin
               TableRicarichi.Cancel;
             end;
             DM1.GridEdit(tvRicarichi, False);
          end else begin
             RxSpeedModifica.Down := True;
             Exit;
          end;
          // Ripristina l'apparenza a video
          tvRicarichi.Styles.Background         := DM1.tvBackground;
          tvRicarichi.Styles.ContentEven        := DM1.tvContentEven;
          tvRicarichi.Styles.ContentOdd         := DM1.tvContentOdd;
          if PageControl1.ActivePage = TabProgressivi then begin
             RxSpeedButtonNuovo.Enabled      := False;
             RxSpeedButtonElimina.Enabled      := False;
          end;
//          MediaPlayerMessaggioIniziale.VisibleButtons := [btPlay, btPause, btStop];
//          MediaPlayerMessaggioFinale.VisibleButtons   := [btPlay, btPause, btStop];
          DM1.ColoraTuttiCampi(ProgressiviForm, COLOR_NORMALE);
          eIdBacheca.Properties.ReadOnly := True;
     end;

  finally
    DM1.CloseWait;
  end;
end;

procedure TProgressiviForm.FormCreate(Sender: TObject);
const
   LEFT_BORDER                  = 13;
   RIGHT_BORDER                 = 15;
   TOP_BORDER                   = 13;
   BOTTOM_BORDER                = 33;
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(ProgressiviForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Parametri e progressivi)';

   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, PageControl1, True);
   // Imposta le dimensioni del PageControl in modo che spariscano alla vista sia
   //  i Tabs che i bordi.
//   PageControl1.Left    := -2;
//   PageControl1.Width   := Width + 4;
   PageControl1.Width   := PageControl1.Width + 10;
   PageControl1.Left    := PageControl1.Left - 5;
   PageControl1.Top     := 45;
   PageControl1.Height  := Height - 43;

   PanelProg.Left    := LEFT_BORDER;
   PanelProg.Top     := TOP_BORDER;
   PanelProg.Width   := PageControl1.Width - LEFT_BORDER - RIGHT_BORDER;
   PanelProg.Height  := PageControl1.Height - TOP_BORDER - BOTTOM_BORDER;
   PanelProg.Color   := Color;

   PanelFax.Left    := LEFT_BORDER;
   PanelFax.Top     := TOP_BORDER;
   PanelFax.Width   := PageControl1.Width - LEFT_BORDER - RIGHT_BORDER;
   PanelFax.Height  := PageControl1.Height - TOP_BORDER - BOTTOM_BORDER;
   PanelFax.Color   := Color;

   PanelInternet.Left    := LEFT_BORDER;
   PanelInternet.Top     := TOP_BORDER;
   PanelInternet.Width   := PageControl1.Width - LEFT_BORDER - RIGHT_BORDER;
   PanelInternet.Height  := PageControl1.Height - TOP_BORDER - BOTTOM_BORDER;
   PanelInternet.Color   := Color;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;
   PanelGruppo3.Color := COLOR_SUBPANEL_BG;
   PanelFax1.Color    := COLOR_SUBPANEL_BG;
   PanelFax2.Color    := COLOR_SUBPANEL_BG;
   PanelFax3.Color    := COLOR_SUBPANEL_BG;
   PanelFax4.Color    := COLOR_SUBPANEL_BG;
   PanelInternet1.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo3.Color := COLOR_SUBPANEL_STEP_BG;
   LabelFax1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelFax2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelFax3.Color := COLOR_SUBPANEL_STEP_BG;
   LabelFax4.Color := COLOR_SUBPANEL_STEP_BG;
   LabelInternet1.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo3.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelFax1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelFax2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelFax3.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelFax4.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelInternet1.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);

   // Refresh della tabella
   DM1.TableProgressivi.Refresh;
end;

procedure TProgressiviForm.FormShow(Sender: TObject);
begin
     CaricaFormLayout;
     // Carica i parametri
     CaricaParametri;
     DM1.FocusRefresh;
     // Imposta la query per caricaRE I PARAMETRI sacs
     QrySacs.Open;
     // Se non trova il soggetto
     if QrySacs.Eof then begin
        MessageDlg('Parametri S.A.C.S. non trovati!', mtError, [mbOK], 0);
        QrySacs.Close;
     end;
     // Apre la tabella dei ricarichi
     TableRicarichi.Open;
end;

procedure TProgressiviForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

      // F2 = Modifica
      113: begin
         if RxSpeedModifica.Enabled then begin
            RxSpeedModifica.Down := not RxSpeedModifica.Down;
            RxSpeedModificaClick(Self);
         end;
      end;

   end;
end;

procedure TProgressiviForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // Chiude la Qry dei parametri SACS
   QrySacs.Close;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;

   Action := caFree;
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBImpostazioni.Down := False;
   // Il puntatore alla form := nil
   ProgressiviForm := nil;
end;

procedure TProgressiviForm.SBSegreteriaClick(Sender: TObject);
begin
   if SBSegreteria.Tag = 1 then begin
      SBSegreteria.Glyph.LoadFromFile(DM1.CurrDir + 'ledoff.bmp');
      SBSegreteria.Font.Color := clBlack;
      SBSegreteria.Tag := 0;
   end else begin
      SBSegreteria.Glyph.LoadFromFile(DM1.CurrDir + 'ledon.bmp');
      SBSegreteria.Font.Color := clRed;
      SBSegreteria.Tag := 1;
   end;
end;

procedure TProgressiviForm.MediaPlayerMessaggioInizialeClick(
  Sender: TObject; Button: TMPBtnType; var DoDefault: Boolean);
begin
   // Se è stato premuto il pulsante di registrazione azzera il file
   //  *.WAV copiandoci sopra un file vuoto e poi ci registra sopra.
   //  Devo fare così perchè altrimenti mi accoda sempre i nuovi messaggi
   //  mantenendo quelli precedenti.
   if Button = btRecord then begin
      MediaPlayerMessaggioIniziale.Close;
      DM1.CopiaFile(DM1.CurrDir + 'Blank.wav', DM1.CurrDir + 'WelcMsg.wav');
      MediaPlayerMessaggioIniziale.Open;
   end;
end;

procedure TProgressiviForm.MediaPlayerMessaggioFinaleClick(Sender: TObject;
  Button: TMPBtnType; var DoDefault: Boolean);
begin
   // Se è stato premuto il pulsante di registrazione azzera il file
   //  *.WAV copiandoci sopra un file vuoto e poi ci registra sopra.
   //  Devo fare così perchè altrimenti mi accoda sempre i nuovi messaggi
   //  mantenendo quelli precedenti.
   if Button = btRecord then begin
      MediaPlayerMessaggioFinale.Close;
      DM1.CopiaFile(DM1.CurrDir + 'Blank.wav', DM1.CurrDir + 'EndMsg.wav');
      MediaPlayerMessaggioFinale.Open;
   end;
end;

procedure TProgressiviForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Chiede prima conferma
  MessageBeep(0);
  if MessageDlg('Vuoi veramente eliminare il registro e tutti i suoi progressivi ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
     MessageBeep(0);
     if MessageDlg('Sei sicuro ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
       tvRicarichi.DataController.DeleteSelection;
     end;
  end;
end;

procedure TProgressiviForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  tvRicarichi.DataController.Append;
end;

procedure TProgressiviForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('IMPOSTAZIONI');
end;

procedure TProgressiviForm.Prog1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TProgressiviForm.Prog1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TProgressiviForm.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
   // Se non in modalità di modifica, annulla l'inserimento
   if not RxSpeedModifica.Down then Key := #0;
end;

procedure TProgressiviForm.ComboBoxPortaDropDown(Sender: TObject);
begin
   // Annulla se non in modifica
   if not RxSpeedModifica.Down then begin
      Edit1.SetFocus;
      (Sender as TComboBox).SetFocus;
      Exit;
   end;
end;

procedure TProgressiviForm.RxSpeedButtonVisualizzaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := False;
   // Cerca di riconoscere il mittente per accettare o meno l'operazione
   // ------------------------------------------------------------------
   // Se il mittente proviene da una TcxGrid o TcxView...
   //  Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
   //  che le griglie DevExpress passano surante il DragAndDrop.
   if Source is TcxDragControlObject then begin
      // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
      if TcxDragControlObject(Source).Control is TcxGridSite then begin
         // La vista diventa il controllo predefinito per comodità
         with TcxGridSite(TcxDragControlObject(Source).Control).GridView do begin
            // Controlla se la vista è tra quelle da riconoscere
            if (Name = 'tvRegistri')
            then accept := True;
         end;
      end;
   end;
end;

procedure TProgressiviForm.SBRendiArticoliMovimentabiliClick(Sender: TObject);
begin
   if DM1.Messaggi('Abilita movimentazione articoli',
                   'ATTENZIONE !'+
                   #13#13#13'Questa procedura renderà movimentabili tutti gli articoli presenti in archivio.'+
                   #13#13#13'Proseguire con l''operazione?',
                   'NB: E'' consigliabile effettuare una copia di sicurezza degli archivi prima di continuare',
                   [mbYes,mbNo], 0, nil) = mrYes then begin
      if DM1.Messaggi('Abilita movimentazione articoli', 'Sicuro/a?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
         DM1.ShowWait('Abilita movimentazione articoli', 'Operazione in corso...');
         RendiTuttiArticoliMovimentabili(True);
         // Metto un'attesa in modo che il messaggio sia visibile
         Sleep(1000);
         DM1.CloseWait;
         DM1.Messaggi('Abilita movimentazione articoli', 'Operazione terminata.', '', [mbOK], 0, nil);
      end;
   end;
end;

procedure TProgressiviForm.SBRendiArticoliNonMovimentabiliClick(
  Sender: TObject);
begin
   if DM1.Messaggi('Disabilita movimentazione articoli',
                   'ATTENZIONE !'+
                   #13#13#13'Questa procedura renderà tutti gli articoli presenti in archivio NON movimentabili.'+
                   #13#13#13'Proseguire con l''operazione?',
                   'NB: E'' consigliabile effettuare una copia di sicurezza degli archivi prima di continuare',
                   [mbYes,mbNo], 0, nil) = mrYes then begin
      if DM1.Messaggi('Disabilita movimentazione articoli', 'Sicuro/a?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
         DM1.ShowWait('Abilita movimentazione articoli', 'Operazione in corso...');
         RendiTuttiArticoliMovimentabili(False);
         // Metto un'attesa in modo che il messaggio sia visibile
         Sleep(1000);
         DM1.CloseWait;
         DM1.Messaggi('Disabilita movimentazione articoli', 'Operazione terminata.', '', [mbOK], 0, nil);
      end;
   end;
end;

procedure TProgressiviForm.SpeedButton1Click(Sender: TObject);
begin
  if DM1.Messaggi('Controllo listino Arcobaleno', 'Confermi di voler effettuare il controllo degli zeri iniziali nel Codice Articolo del listino del Gruppo Arcobaleno?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
    if DM1.Messaggi('Controllo listino Arcobaleno', 'ATTENZIONE !!!'#13#13#13'L''operazione potrebbe essere molto lunga (anche ore).'#13#13'Vuoi continuare ugualmente?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
      if DM1.Messaggi('Controllo listino Arcobaleno', 'IMPORTANTE !!!'#13#13#13'Prima di continuare è necessario che TUTTI GLI ALTRI COMPUTERS SIANO SPENTI.'#13#13'Continuare?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
        if DM1.Messaggi('Controllo listino Arcobaleno', 'ULTIMO AVVERTIMENTO.'#13#13#13'Si desidera avviare l''operazione?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
          DM1.ControllaListinoArcobalenoPerQuegliZeriMancantiNelCodice;
        end;
      end;
    end;
  end;
end;

procedure TProgressiviForm.SBArticoliConRicarichiClick(Sender: TObject);
var
  NewValue: String;
  TipoCalcoloStr: String;
begin
   NewValue := 'R';
   TipoCalcoloStr := 'RICARICHI';
   with Sender as TSpeedButton do begin
     if Name = 'SBArticoliConSconti' then begin
       NewValue := 'S';
       TipoCalcoloStr := 'SCONTI';
     end;
   end;
   if DM1.Messaggi('Imposta tipo calcolo listini',
                   'ATTENZIONE !'+
                   #13#13#13'Questa procedura imposterà tutti gli articoli presenti in archivio con il calcolo dei listini a ' + TipoCalcoloStr + '.'+
                   #13#13#13'Proseguire con l''operazione?',
                   'NB: E'' consigliabile effettuare una copia di sicurezza degli archivi prima di continuare',
                   [mbYes,mbNo], 0, nil) = mrYes then begin
      if DM1.Messaggi('Imposta tipo calcolo listini', 'Sicuro/a?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
         DM1.ShowWait('Imposta tipo calcolo listini', 'Operazione in corso...');
         ImpostaTipoCalcoloListini(NewValue);
         // Metto un'attesa in modo che il messaggio sia visibile
         Sleep(1000);
         DM1.CloseWait;
         DM1.Messaggi('Imposta tipo calcolo listini', 'Operazione terminata.', '', [mbOK], 0, nil);
      end;
   end;
end;

procedure TProgressiviForm.SBApplicaScontiAcquistoClick(Sender: TObject);
begin
  // Se il focus è sui check relativi a questa funzione
  //  sposta il focus su un altro controllo in modo che una eventuale modifica a quel campo
  //  venga recepita dal sistema.
  if eBclConsideraSconto1.Focused
  or eBclConsideraSconto2.Focused
  or eBclConsideraSconto3.Focused
  then begin
    eBclConsideraSconto2.SetFocus;
    eBclConsideraSconto1.SetFocus;
  end;
  // Chiede prima conferma
  if DM1.Messaggi('Levante', 'Confermi di voler applicare il parametro a tutti gli articoli dell''archivio?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  if DM1.Messaggi('Levante', 'Ultima conferma.'#13#13'Continuare con l''operazione?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  // Avvia l'operazione
  try
    DM1.ShowWait('Levante', 'Avvio operazione...');
    ImpostaScontiDiAcquistoDaConsiderare((DM1.TableProgressiviBCL_CONSIDERA_SC1.AsString = 'T'),
                                         (DM1.TableProgressiviBCL_CONSIDERA_SC2.AsString = 'T'),
                                         (DM1.TableProgressiviBCL_CONSIDERA_SC3.AsString = 'T'));
  finally
    DM1.CloseWait;
    DM1.Messaggi('Levante', 'Operazione terminata!', '', [mbOk], 0, nil);
  end;
end;

procedure TProgressiviForm.tvRicarichiCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TProgressiviForm.tvRicarichiCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TProgressiviForm.tvRicarichiCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TProgressiviForm.SBApplicaRicarichiPerFasceDiPrezzoClick(
  Sender: TObject);
begin
  // Se il focus è sul check che attiva/disattiva i ricarichi per fasce di prezzo,
  //  sposta il focus su un altro controllo in modo che una eventuale modifica a quel campo
  //  venga recepita dal sistema.
  if eAbilitaRicarichiPerFascePrezzo.Focused then
    GridRicarichi.SetFocus;
  // Controlla che siano abilitati i ricarichi per gasce di prezzo
  if not DM1.RicarichiPerFasceDiPrezzo then
  begin
    DM1.Messaggi('Levante', 'I ricarichi per fasce di prezzo sono DISABILITATI.', '', [mbOk], 0, nil);
    Exit;
  end;
  // Chiede prima conferma
  if DM1.Messaggi('Levante', 'Confermi di voler applicare il parametro a tutti gli articoli dell''archivio?', '', [mbYes,mbNo], 0, nil) <> mrYes then
    Exit;
  if DM1.Messaggi('Levante', 'Ultima conferma.'#13#13'Continuare con l''operazione?', '', [mbYes,mbNo], 0, nil) <> mrYes then
    Exit;
  // Avvia l'operazione
  try
    DM1.EseguiQueryCalcolaListini;
  finally
    DM1.Messaggi('Levante', 'Operazione terminata!', '', [mbOk], 0, nil);
  end;
end;

procedure TProgressiviForm.ButtonRepositoryClick(Sender: TObject);
begin
  if Uppercase(eRepositoryPassword.Text) <> 'TH3CLA' then
    raise Exception.Create('Password non riconosciuta.');
  if RepositoryForm = nil then begin
    Application.CreateForm(TRepositoryForm, RepositoryForm);
    RepositoryForm.Parent := MainForm;
    RepositoryForm.Show;
  end;
end;

procedure TProgressiviForm.eIdBachecaKeyPress(Sender: TObject; var Key: Char);
begin
//  if (Ord(Key) < 48) or (Ord(Key) > 58) then
//  Key := #0;
end;

procedure TProgressiviForm.eIdBachecaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  LValueStr: String;
  LValueInt: Integer;
begin
  LValueStr := Trim(VarToStr(DisplayValue));
  Error := (LValueStr <> '') and not TryStrToInt(LValueStr, LValueInt);
end;

procedure TProgressiviForm.eRepositoryPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 13 then ButtonRepositoryClick(ButtonRepository);
end;

procedure TProgressiviForm.DBETipo1PropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DESCRIZIONE FROM TIPIRIGHI WHERE LIVELLO = ''' + RightStr((Sender as TcxDBComboBox).Name, 1) + '''');
      Qry.Open;
      (Sender as TcxDBComboBox).Properties.Items.Clear;
      (Sender as TcxDBComboBox).Properties.Items.Add('');
      while not Qry.Eof do begin
         (Sender as TcxDBComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TProgressiviForm.PrintersListDropDown(Sender: TObject);
begin
  PrintersList.Items.Clear;
  PrintersList.Items.Add('');
  PrintersList.Items.AddStrings(Printer.Printers);
end;

procedure TProgressiviForm.DBComboBox1DropDown(Sender: TObject);
var
   Qry: TIB_Cursor;
begin
   DM1.Attendere;
   try
      Qry := TIB_Cursor.Create(Self);
      Qry.DatabaseName := DM1.GenDBFile;
      Qry.IB_Connection := DM1.DBGenerale;
      Qry.SQL.Add('SELECT R.NOMEFILE FROM REPOSITORY R WHERE R.TIPOFILE = ' + QuotedStr('LABSOGG'));
      Qry.Open;
      with Sender as TDBComboBox do begin
        Items.Clear;
        Items.Add('');
        while not Qry.Eof do begin
          Items.Add(Qry.Fields[0].AsString);
          Qry.Next;
        end;
      end;
      Qry.Close;
   finally
      DM1.ChiudiAttendere;
      if Assigned(Qry) then Qry.Free;
   end;
end;

procedure TProgressiviForm.AllegatoFGPrintersListDropDown(Sender: TObject);
begin
  AllegatoFGPrintersList.Items.Clear;
  AllegatoFGPrintersList.Items.Add('');
  AllegatoFGPrintersList.Items.AddStrings(Printer.Printers);
end;

procedure TProgressiviForm.SpeedButton2Click(Sender: TObject);
begin
  // Carica il credito residuo degli SMS
  DM1.ShowWait('Levante', 'Accedo al server degli SMS...');
  try
    DM2.SMS_CreditoResiduoLabel(LabelSmsCreditoResiduo);
    TimerSmsCreditExpired.Enabled := True;
  finally
    DM1.CloseWait;
  end;
end;

procedure TProgressiviForm.TimerSmsCreditExpiredTimer(Sender: TObject);
begin
  (Sender as TTimer).Enabled := False;
  LabelSmsCreditoResiduo.Caption := '- - -';
end;

procedure TProgressiviForm.sbGoogleTasksResetRefreshTokenClick(
  Sender: TObject);
var
  Q: TIB_Cursor;
begin
  if DM1.Messaggi('Levante', 'Confermi di voler azzerare il "Refresh Token" per l''accesso ai servizi di "Google Tasks"?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;

  Q := TIB_Cursor.Create(Self);
  try
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PROGRESS2 SET Google_Tasks_RefreshToken = ''''');
    Q.ExecSQL;
    DM1.Messaggi('Levante', 'Refresh Token eliminato.'#13#13'Per completare l''operazione chiudere Levante.', '', [mbOK], 0, nil);
  finally
    Q.Free;
  end;
end;

procedure TProgressiviForm.sbGoogleCalResetRefreshTokenClick(
  Sender: TObject);
var
  Q: TIB_Cursor;
begin
  if DM1.Messaggi('Levante', 'Confermi di voler azzerare il "Refresh Token" per l''accesso ai servizi di "Google Calendar"?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;

  Q := TIB_Cursor.Create(Self);
  try
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PROGRESS2 SET Google_Calendar_RefreshToken = ''''');
    Q.ExecSQL;
    DM1.Messaggi('Levante', 'Refresh Token eliminato.'#13#13'Per completare l''operazione chiudere Levante.', '', [mbOK], 0, nil);
  finally
    Q.Free;
  end;
end;

end.
