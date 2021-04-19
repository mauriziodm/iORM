unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons,
  MPlayer, ComCtrls, OleCtrls, ImgList,
  Menus,
  DBCtrls, DB,
  IB_Components,
  bmpPanel, IB_Grid, FrameStart, MAURI_SB,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerDateNavigator,
  cxContainer, cxDateNavigator, StrUtils, FormModelBase,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckBox, IdFTP, cxSplitter, FormAllegati, FormAgendaSlide,
  dxGDIPlusClasses, cxStyles, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  CommCtrl, System.ImageList;

const

  // --------------------------------------------------------------------------
  // Costanti per la gestione dei Windows Messages della MainForm
  // NB: la gestione dei WM del SACS sono nell'apposita unit del SACS
  // --------------------------------------------------------------------------
  WM_LEV_COM_AUTO_COUNT_UPDATE = 'WM_LEV_COM_AUTO_COUNT_UPDATE';

  // --------------------------------------------------------------------------
  // Costanti di parametri per la versione LEVANTE LIGHT
  // --------------------------------------------------------------------------
  LEVANTE_LIGHT_MODE = False;
  // LEVANTE_LIGHT_MODE      = True;

  // --------------------------------------------------------------------------
  // Costanti che indicano se visualizzare o meno la Splash Form anche
  // all'uscita dal programma e per quanti secondi.
  // --------------------------------------------------------------------------
  SPLASH_FORM_ON_EXIT_ENABLED = True;
  SPLASH_FORM_ON_EXIT_MILLISECONDS = 0;

  // --------------------------------------------------------------------------
  // Costanti per il posizionamento e il dimensionamento delle icone relative alle comunicazioni
  // --------------------------------------------------------------------------
  DS_LEFT_MARGIN = 0;
  DS_TOP_MARGIN = 1;
  DS_ICON_WIDTH = 10;
  DS_ICON_SEPARATION = 1;

  // ===========================================================================
  // COSTANTI PER IL MENU' PRINCIPALE
  MM_ITEM_INVISIBLE = -1;
  MM_ITEM_DISABLED = 0;
  MM_ITEM_ENABLED = 1;
  MM_ITEM_SELECTED = 2;

  MM_SEPARATOR_HEIGHT = 5;
  // ---------------------------------------------------------------------------

  // ===========================================================================
  // COSTANTI PER IL MENU UTILITA' E IMPOSTAZIONI (Le costanti contengono il codice di ogni voce per la sua identificazione)
  // ---------------------------------------------------------------------------
  I_GRUPPI = 01;
  I_CATEG1 = 02;
  I_CATEG2 = 03;
  I_CATEG3 = 04;
  I_CATEG4 = 05;
  I_CATEG5 = 06;
  I_CATEG6 = 07;
  I_CATEG7 = 08;
  I_CATEG8 = 09;
  I_BANCHE = 10;
  I_PAGAM = 11;
  I_DATIAZIENDA = 12;
  I_IVA = 13;
  I_CAUSALI = 14;
  I_MAGAZZINI = 15;
  I_PROGRESSIVI = 16;
  I_FAX = 17;
  I_INTERNET = 18;
  I_EXTPRG = 19;
  I_STATI = 20;
  I_LOGHI = 21;
  I_TWAIN = 22;
  I_ETICHETTE = 23;
  I_MULTIREGISTRO = 24;
  I_TECNICI = 25;
  I_PHOTOART = 26;
  I_CAUSALICANTIERI = 27;
  I_APPARECCHI = 28;
  I_MODELLI_DICHIARAZ = 29;
  I_SOCIETA_GAS = 30;
  I_DIPENDENTI = 31;
  I_AUTOMEZZI = 32;
  I_TIPIOREDIPENDENTI = 33;
  I_TIPIALTRESPESE = 34;
  I_AGENTI = 35;
  I_AGENTI2 = 36;
  I_AGENTI3 = 37;
  I_AGENTI4 = 38;
  I_TIPIRIGHI1 = 39;
  I_TIPIRIGHI2 = 40;
  I_TIPIRIGHI3 = 41;
  I_TIPIRIGHI4 = 42;
  I_TIPIRIGHI5 = 43;
  I_TIPIRIGHI6 = 44;
  I_OPERAZIONIPIANIFICATE = 45;
  I_CATEGCANT1 = 46;
  I_CATEGCANT2 = 47;
  I_CATEGCANT3 = 48;
  I_CATEGCANT4 = 49;
  I_CATEGCANT5 = 50;
  I_CATEGCANT6 = 51;
  I_ENTI = 52;
  I_COM_MODELLI = 53;

  U_BANCO = 71;
  U_FATTDIFF = 72;
  U_AGGLIST = 73;
  U_IMPORTAZIONE = 74;
  U_SINCHRO = 75;
  U_BACKUP = 76;
  U_ABOUT = 77;
  U_TELETRASPORTO = 78;
  U_AUMENTOLISTINI = 79;
  U_MODIFICAMARGINI = 80;
  U_CHIUSURAMAGAZZINO = 81;
  U_ESPORTAZIONE = 82;
  U_AZZERAMENTOMAGAZZINO = 83;
  U_STRADARIO = 84;
  U_ALLEGATIMANUT_EXPORT = 85;
  U_ETICHETTA_ENERGETICA = 86;
  // ===========================================================================

  // ===========================================================================
  // COSTANTI RELATIVI ALLE DIMENSIONI E POSIZIONI DELLE FORM
  // ---------------------------------------------------------------------------
  MAINFORM_WIDTH = 1024;
  MAINFORM_HEIGHT = 734;

  CLIENTFORM_POSITION_LEFT_MARGIN_FROM_MAIN_FORM = 211;
  CLIENTFORM_POSITION_RIGHT_MARGIN_FROM_MAIN_FORM = 100;
  CLIENTFORM_POSITION_TOP_MARGIN_FROM_MAIN_FORM = 0;
  CLIENTFORM_POSITION_BOTTOM_MARGIN_FROM_MAIN_FORM = 25;

  CLIENTFORM_BG_COLOR = clWhite;

  // Costanti per il posizionamento delle client area delle varie form
  // Questi valori sono usati per quelle form che si ridimensionano e che quindi
  // hanno larghezza variabile. Sono usate anche nelle form a larghezza fissa
  // nel calcolo per il centraggio.
  CLIENT_LEFT_BORDER = 15;
  CLIENT_RIGHT_BORDER = 9; // 9
  CLIENT_TOP_BORDER = 83;
  CLIENT_BOTTOM_BORDER = 0; // 0
  // Questa costante vie usata per dimensionare la larghezza della client area
  // nelle form a larghezza fissa non ridimensionabile
  CLIENT_WIDTH = 686; // 686

  // Costanti per il posizionamento dei menu popup rispetto ai componenti che li richiamano
  POPUP_X_OFFSET = 10;
  POPUP_Y_OFFSET = 50;

  // Questo parametro server per calcolare l'altezza del pannello principale quando
  // ci sono bande (pannelli) formati da più sottobande come ad esempio nella banda
  // pagamento dei documenti:
  // Banda principale := Modalità di pagamento
  // Sottobande       := Banca + Scadenze
  // In questo caso L'altezza del pannello principale Viene calcolato così:
  // H := SubPanel.Top + SubPanel.Height + SUBPANEL_FATTORE_CORREZIONE
  // NB: Se la banda principale non è visibile, nessuna delle sottobande può essere visibile
  // NB: Si usa un procedimento simile anche per calcolare la posizione della linea in basso del pannello principale
  SUBPANEL_TOP = 16;
  SUBPANEL_FATTORE_CORREZIONE = 4;

  // Colori da utilizzare nei campi delle form (Quando sono in modifica, quando non lo sono, quando ricevono il focus ecc)
  COLOR_NORMALE = $00E9E9E9;
  // COLOR_NORMALE                 = $00F7F7F7;
  COLOR_MODIFICA = $00D9FFFF;
  COLOR_FOCUS = clYellow;

  // Colori da utilizzare nei pannelli delle form divise in operazioni (Modalità di pagamento, fatturaz. differita, Gruppi ecc)
  COLOR_SUBPANEL_BG = $00E9E9E9;
  COLOR_SUBPANEL_STEP_BG = clBlack;
  COLOR_SUBPANEL_STEP_FONT = clWhite;

  COLOR_SUBPANEL_BG_SELECTED = $00F7F7F7;
  COLOR_SUBPANEL_LABEL_FONT_SELECTED = $00E9E9E9;
  COLOR_SUBPANEL_STEP_BG_SELECTED = $00E9E9E9;
  COLOR_SUBPANEL_STEP_FONT_SELECTED = $00F7F7F7;

  // COlore di visualizzazione dei pannelli della schermata di Login
  COLOR_LOGIN_OPZIONI = $00DC7E5A;
  // ===========================================================================

type

  // Struttura che conterrà lo stack delle ImgDocTipo (icone in alto a sx che indicano
  // il tipo di schermata
  ItemDocTipoPointer = ^ItemDocTipoRecord;

  ItemDocTipoRecord = record
    ImgDocTipo: TBitmap;
    LabelTipoDocumentoVisible: Boolean;
    SBTipoDocumentoVisible: Boolean;
    Caption1, Caption2, Caption3: String;
    Caption1Top, Caption2Top, Caption3Top: Integer;
    Caption1Left, Caption2Left, Caption3Left: Integer;
    Caption1FontName, Caption2FontName, Caption3FontName: String;
    Caption1FontSize, Caption2FontSize, Caption3FontSize: Byte;
    Caption1FontStyleBold, Caption2FontStyleBold, Caption3FontStyleBold: Boolean;
  end;

  // ### TRASPARENZA ###
  TSetLayeredWindowAttributes = function(hwnd: hwnd; // handle to the layered window
    crKey: TColor; // specifies the color key
    bAlpha: Byte; // value for the blend function
    dwFlags: DWORD // action
    ): BOOL; stdcall;

  TmainForm = class(TForm)
    ImageListExpDocLargeImages: TImageList;
    StartFrame: TStartFrame;
    TimerStartStop: TTimer;
    AvviaLevanteBiometrico: TButton;
    MenuBacheca: TPopupMenu;
    SvuotaBacheca: TMenuItem;
    Incollalevociselezionatesuldocumento1: TMenuItem;
    Incollatuttelevocisuldocumento1: TMenuItem;
    PanelTopStretched: TPanel;
    ImageTopStretched: TImage;
    MainTopPanel: TbmpPanel;
    MediaPlayer1: TMediaPlayer;
    MainLeftPanel: TPanel;
    ImageLeftPanelParteSfumata: TImage;
    ImageLeftPanelParteFissaSuperiore: TImage;
    ImgDocTipo: TImage;
    SBTipoDocumento: TSpeedButtonRollOver;
    LabelTipoDocumento: TLabel;
    SBRubrica: TPaintBox;
    SBDocumenti: TPaintBox;
    SBGM: TPaintBox;
    SBCV: TPaintBox;
    SBArticoli: TPaintBox;
    SBPratiche: TPaintBox;
    SBScadenze: TPaintBox;
    SBPrimanota: TPaintBox;
    SBSoggetto: TPaintBox;
    SBPratica: TPaintBox;
    SSChiudi: TSpeedButtonRollOver;
    SBAssistenze: TPaintBox;
    SBAssistenza: TPaintBox;
    PSChiudi: TSpeedButtonRollOver;
    SBImpegni: TPaintBox;
    SBAgenda: TPaintBox;
    MMSeparatore1: TPaintBox;
    MMSeparatore2: TPaintBox;
    MMSeparatore3: TPaintBox;
    SBGC: TPaintBox;
    Caption1: TLabel;
    Caption2: TLabel;
    Caption3: TLabel;
    SBPartitario: TPaintBox;
    SBGOS: TPaintBox;
    SBUtilita: TSpeedButtonRollOver;
    SBImpostazioni: TSpeedButtonRollOver;
    PanelNomiDoc: TPanel;
    ListBoxNomeDoc: TListBox;
    PanelDateNavigator: TPanel;
    AgendaDateNavigator: TcxDateNavigator;
    eGruppoAgenda: TcxComboBox;
    AgendaNoInterventi: TcxCheckBox;
    PanelMenuUtilita: TPanel;
    SU: TShape;
    UtilitaTitolo: TImage;
    UtilitaBarra: TImage;
    MenuUtilita: TListBox;
    MainRightPanel: TPanel;
    ImageRightPanelTopFixed: TImage;
    ImageRightPanelStretched: TImage;
    ImageRightPanelBottomFixed: TImage;
    Attendere: TImage;
    ListViewExpDoc: TListView;
    MainBottomPanel: TPanel;
    ImageBottomPanelRightFixed: TImage;
    ImageBottomPanelStretched: TImage;
    ImageBottomPanelLeftFixed: TImage;
    LabelDataOdierna: TLabel;
    Label7: TLabel;
    LabelAziendaCorrente: TLabel;
    Label13: TLabel;
    LabelStatus: TLabel;
    SBStopFax: TSpeedButton;
    Label1: TLabel;
    LabelOperatoreCorrente: TLabel;
    SBImportPalmare: TSpeedButtonRollOver;
    SBResOrd: TPaintBox;
    TimerLaunchTabForms: TTimer;
    LabelAllegati: TLabel;
    TimerBlinkAllegatiAlarm: TTimer;
    SBComunicazioni: TPaintBox;
    Refresh1: TMenuItem;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListViewExpDocDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean); // Personale;
    procedure AggiornaDocumentiEsportati;
    procedure ListViewExpDocKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListViewExpDocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ListViewExpDocEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Importazionearchividibase1Click(Sender: TObject);
    procedure CaricaLayout;
    procedure CaricaTemaClientForm(F: TForm; TopPanel: TbmpPanel; ESC, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10: TSpeedButton;
      SetOnResizeEventHandler: Boolean = True);
    procedure FormResize(Sender: TObject);
    procedure SBRubricaClick(Sender: TObject);
    procedure CheckMainMenu;
    procedure SSChiudiClick(Sender: TObject);
    procedure PSChiudiClick(Sender: TObject);
    procedure PanelNomiDocExit(Sender: TObject);
    procedure SBTipoDocumentoClick(Sender: TObject);
    procedure ListBoxNomeDocClick(Sender: TObject);
    procedure AbilitaMainMenu;
    procedure DisabilitaMainMenu(AllDisable: Boolean);
    procedure SBUtilitaClick(Sender: TObject);
    procedure RiempiMenuUtilita;
    procedure MenuUtilitaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MenuUtilitaClick(Sender: TObject);
    procedure VisualizzaUtilita;
    procedure ChiudiUtilita;
    procedure SBImpostazioniClick(Sender: TObject);
    procedure SalvaIconaDocTipo;
    procedure RipristinaIconaDocTipo;
    procedure CaricaIconaDocTipo(Titolo: String);
    procedure VisualizzaAvvio(LoadBitmap: Boolean);
    procedure CaricaElencoAziende;
    procedure TimerStartStopTimer(Sender: TObject);
    procedure OpenStartFrame;
    procedure CloseStartFrame;
    procedure ListViewExpDocAdvancedCustomDraw(Sender: TCustomListView; const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    function TrayBarTop: Integer;
    procedure LevanteException(Sender: TObject; E: Exception);
    procedure SBRubricaPaint(Sender: TObject);
    function MMItemIsSelected(MMI: TPaintBox): Boolean;
    procedure MMItemSetSelected(MMI: TPaintBox);
    procedure MMItemSetUnselected(MMI: TPaintBox);
    procedure MMItemSetEnabled(MMI: TPaintBox; Enabled: Boolean);
    procedure MMItemSetVisible(MMI: TPaintBox; Visible: Boolean);
    procedure MainMenuInvisibile;
    procedure RefreshMainMenu;
    function IsMainMenuEnabled: Boolean;
    function MMItemGetSelected: TPaintBox;
    procedure MainLeftPanelDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure LoadMainMenuImages;
    procedure BloccaIconaDocTipo(Blocca: Boolean; NomeFormChiamante: TComponentName);
    function IconaDocTipoBloccata: Integer;
    procedure FormSetParentPlatformDependent(CF, PF: TForm);
    procedure ChiudiLevante;

    procedure FormFadeOut(F: TForm);
    procedure FormFadeIn(F: TForm);
    procedure FormInitFullTrasparent(F: TForm);
    procedure FormInitFullOpaque(F: TForm);

    procedure ApriTeletrasporto(Hidden: Boolean = False);
    procedure AvviaLevanteBiometricoClick(Sender: TObject);
    procedure SvuotaBachecaClick(Sender: TObject);
    procedure ApriCalendario;
    procedure ChiudiCalendario;
    procedure eGruppoAgendaPropertiesInitPopup(Sender: TObject);
    procedure eGruppoAgendaPropertiesChange(Sender: TObject);
    procedure Incollalevociselezionatesuldocumento1Click(Sender: TObject);
    procedure Incollatuttelevocisuldocumento1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BarCodeReadingInit;
    procedure PanelTopStretchedResize(Sender: TObject);
    procedure CalcolaLeftMainTopPanel(PanelTopStretched: TPanel);
    procedure MainRightPanelResize(Sender: TObject);
    procedure CalcolaDimensioniClientAreaChildForm(F: TForm; ClientArea: TWinControl; FixedWidth: Boolean);
    procedure FixedWidthFormResize(Sender: TObject);
    procedure SBImportPalmareClick(Sender: TObject);
    procedure ControllaAbilitazioneImportazionePalmare;
    procedure GoVenditaAlBanco;
    procedure SBRubricaDblClick(Sender: TObject);
    procedure SBDocumentiDblClick(Sender: TObject);
    procedure SBGMDblClick(Sender: TObject);
    procedure SBCVDblClick(Sender: TObject);
    procedure SBArticoliDblClick(Sender: TObject);
    procedure SBPraticheDblClick(Sender: TObject);
    procedure SBScadenzeDblClick(Sender: TObject);
    procedure SBPrimanotaDblClick(Sender: TObject);
    procedure SBAssistenzeDblClick(Sender: TObject);
    procedure SBImpegniDblClick(Sender: TObject);
    procedure SBGCDblClick(Sender: TObject);
    procedure SBGOSDblClick(Sender: TObject);
    procedure SBPartitarioDblClick(Sender: TObject);
    function LevanteLight_DatiUtenteCorretti: Boolean;
    procedure LevanteLight_SalvaDatiUtente;
    function LevanteSacs_UIDCheck(NomeUt, PswdUt: string): Boolean;
    procedure CaricaParametriFTP(LocFTP: TIdFTP);
    procedure TimerLaunchTabFormsTimer(Sender: TObject);
    function Allegati_CreaForm(OwnerParent: TWinControl; Splitter: TcxSplitter = nil): TAllegatiForm;
    function Agenda_CreaForm(OwnerParent: TWinControl; Splitter: TcxSplitter = nil): TAgendaSlideForm;
    procedure MenuBachecaPopup(Sender: TObject);
    procedure CalcolaDimensioniFormMainPanelAndClientAreaChildForm(F: TForm; FormMainPanel, ClientArea: TWinControl; SplitterAllegati: TcxSplitter;
      FixedWidth, FixedClientAreaHeight: Boolean);
    procedure TimerBlinkAllegatiAlarmTimer(Sender: TObject);
    procedure SBComunicazioniDblClick(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure SBSoggettoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SBSoggettoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SBSoggettoEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure SBSoggettoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure InhibitLVInfoTips(LV: TListView);
    procedure AgendaDateNavigatorSelectionChanged(Sender: TObject; const AStart, AFinish: TDateTime);

  private
    { Private declarations }
    MMDragDrop_MouseDownPos: TPoint;
    // -------------------------------------------------------------
    // Riferimenti alla prima e ultima voce del menu
    // NB: Servono per la visualizzazione dei segmenti dell'albero
    // in modo che il primo e l'ultimo chiudano il menù
    MMFirst1, MMFirst2, MMLast1, MMLast2: String;
    // Flag che indica se il mainmenu è attivo oppure no
    // viene usato in alcune form per testare lo stato del MainMenu
    // senza dover controllare una per una le voci.
    MainMenuEnabled: Boolean;
    // Array che contiene il flag che indica lo stato di ciascun pulsante
    MainMenuState: array [0 .. 17] of Shortint;
    // Lista che contiene un array di puntatori alle bitmap relative al main menu
    MMImgList: TList;
    // Lista che contiene lo stack delle IconeDocTipo (le immagini in alto a sx che
    // indicano che tipo di schermata è visualizzata.
    StackIconaDocTipo: TList;
    // Flag che indica se è in esecuzione una copia di sicurezza da parte
    // di Levante Guardian per gestire il ciclo di attesa.
    SacsInProgress: Boolean;
    // Flag che indica se siamo in modalità di lettura di un codice a barre
    fReadingBarcode: Boolean;
    // Variabile su cui viene costruito il codice a barre che si sta leggendo
    fBarcode: String;
    // Variabile che contiene il codice ASCII del carattere di Start/Stop
    // per la lettura dei codici a barre
    fBarcodeStartCharCode: Integer;
    // Percorso della cartella del tema
    MainFormTemaDir: String;
    fIsLevanteLight: Boolean;
    // Array per l'inoltro dei windows messages relativi al drag and drop di files
    // allegati all'ultima finestra di allegati creata.
    AllegatiFormStack: array of TAllegatiForm;
    fAllegati_Count_Alarm: Integer;
    fAllegati_Count: Integer;
    fComAuto_ComunicazioniPronte: Integer;

    // Contiene l'ultima voce del MainMenù selezionata prima di entrare nell'anagrafica
    // Soggetto/Cantiere/Impianto
    fPrecSelectedMainMenuItem: TPaintBox;

    function IsActiveForm(FormName: String): Boolean;
    function GetBarcodeStartChar: Char;
    procedure CalcolaPosizioneVerticaleCalendario;
    function ClipTextForMenuPaint(Canvas: TCanvas; LeftPos: Integer; StrIn: String): String;
    procedure LevanteLight_CaricaDatiUtente;
    procedure SetAllegati_Count(const Value: Integer);
    procedure SetAllegati_Count_Alarm(const Value: Integer);
    procedure Allegati_AggiornaLabelCount(ShowAlarm: Boolean);
    procedure TracciaQtaNuoveComAuto(PB: TPaintBox; T: String);
    procedure SetComAuto_ComunicazioniPronte(const Value: Integer);
    procedure RefreshMainMenu_NormalMode;
    procedure RefreshMainMenu_FastSelectionMode;
    procedure CheckMainMenu_NormalMode;
    procedure CheckMainMenu_FastSelectionMode;
    function GetCLI_Param_Ristrutturazione: Boolean;
    // procedure Indirizzo2MHT(Indirizzo, NomeFile: string);
    // procedure LevanteInfoDownload(Forza: Boolean);
  public
    { Public declarations }
    // Flag che se a True blocca l'aggiornamento dell'Icona Doc Tipo
    FlagBloccoIconaDocTipo: Integer;
    // Array che contiene il testo dei pulsanti
    MainMenuCaptions: array [0 .. 18] of String;
    // --------------------------------------------------------------------------
    // Costanti per l'identificazione e la versione del programma
    // queste costanti vengono usate per la visualizzazione delle caption
    // delle form e per il controllo della versione
    NomeApplicazione, VersioneApplicazione: String;
    PrgVersion, PrgVersionNoBuild: Integer;
    // Questo flag indica se siamo in modalità DEMO
    ModoDemo: Boolean;
    // Questo flag indica la modalità Assistenze Mobile (gestione manutenzioni via RDP da remoto)
    ModoAssistenzeRDP: Boolean;
    // Questo flag indica se si è in modalità di Setup dei parametri di base per la connessione
    // al DB
    ModoSetup: Boolean;
    // Flag che indica se caricare o meno le banche dagli archivi di base in caso
    // di ritrutturazione
    NoBancheArcBase: Boolean;
    // Quest flag indica se l'ultimo DragDrop è stato avviato dalla bacheca cliccando
    // con il pulsante destro del mouse (Insert)
    BachecaInsert: Boolean;
    // Questo flag indica se il programma è in esecuzione in modalità MAGAZZINO
    MagKioskMode: Boolean;
    // ------------------------------------------------------------------------
    // Override della funzione di gestione dei messaggi dell'applicazione, da questa funzione
    // Usata per il drag & drop dall'esterno dell'applicazione
    // Usata per aggiornare il numero di comunicazioni automatiche pronte per l'invio
    procedure WndProc(var Msg: TMessage); override;
    // ------------------------------------------------------------------------
    property BarcodeStartCharCode: Integer read fBarcodeStartCharCode;
    property BarcodeStartChar: Char read GetBarcodeStartChar;

    // Levante Light
    property IsLevanteLight: Boolean read fIsLevanteLight write fIsLevanteLight;

    // ------------------------------------------------------------------------
    // Proprietà relative al sistema di notifica del numero degli allegati presenti
    property Allegati_Count: Integer read fAllegati_Count write SetAllegati_Count;
    property Allegati_Count_Alarm: Integer read fAllegati_Count_Alarm write SetAllegati_Count_Alarm;
    // ------------------------------------------------------------------------

    // Proprietà che contiene il numero di comunicazioni automatiche
    // pronte per essere inviate presenti nell'azienda
    property ComAuto_Count: Integer read fComAuto_ComunicazioniPronte write SetComAuto_ComunicazioniPronte;
    // ------------------------------------------------------------------------

    // Contiene l'ultima voce del MainMenù selezionata prima di entrare nell'anagrafica
    // Soggetto/Cantiere/Impianto
    property PrecSelectedMainMenuItem: TPaintBox read fPrecSelectedMainMenuItem write fPrecSelectedMainMenuItem;

    procedure EsportaGridSuTesto(Grid: TcxGrid);
    procedure EsportaGridSuExcel(Grid: TcxGrid);
    procedure EsportaDocumentoSilent(TipoDoc: String; NumDoc: Integer; RegDoc: String; DataDoc: TDate; TipoFile: String; AvvertiQuandoTerminato: Boolean);
    procedure AllegatiFormStack_Registra(AllegatiForm: TAllegatiForm);
    procedure AllegatiFormStack_Elimina;
    function AllegatiFormStack_GetLastAllegatiForm: TAllegatiForm;
    function AllegatiFormStack_ExistsByIndex(Index: Integer): Boolean;
    procedure SetParentComponent(const ANewComponent: TControl);

    property CLI_Param_Ristrutturazione: Boolean read GetCLI_Param_Ristrutturazione;
  end;

var
  mainForm: TmainForm;

  // Variabili globali che contengono i codidi identificativi dei windows messager
  // della MainForm.
  // NB: La gestione dei windows messages del SACS sono nella unit del SACS
  MsgLevComAutoCountUpdate: Integer;

implementation

uses SchedaArticoli1, DataModule1, SchedaClienti,
  SchedaIntestazioneDocumenti,
  FormAnagArt, FormAnagCli,
  FormAziende, FormBanche, FormContatti, FormExtFile, FormExtPrg, FormPagamenti,
  SchedaDatiAzienda, SchedaPreventiviOrdini,
  SchedaProgressivi, SchedaTesti, FormScadenziario, FormConformita,
  FormStatiOggetti, FormAliquoteIVA,
  FormSelezioneCliente, FormAbout, FormCategoria1,
  FormImportazione, FormPrimanota,
  FormBackup,
  FormSubSogg, FormCausali, FormAnagMaga, FormGruppi,
  FormFattDifferita, FormSplash, FormSynchro, FormArchivioBanche, FormHints,
  FormHint, FormPagamRisc,
  FormMultiregistro, FormScambioDoc, FormImpegni, FormTecnici, FormPhotoArt,
  FormApparecchi, FormAumentoListini,
  FormListaModelliConf, FormSocGas, FormModificaMargini,
  FormDipendenti, FormAutomezzi, FormTipiOreDipendenti, FormTipiAltreSpese,
  FormChiusuraMagazzino, ExtTerm_Zebex_Z2031, FormVendBancoSeleCant,
  FormAgenti, FormDatiRigo, FormTipiRighi, FormTabGC, FormExport,
  FormOperazioniPianificate, FormAzzeramentoMagazzino, cxGridExportLink, ShellAPI,
  FormSelezioneStradario, FormEnti, FormExportAllegatiManut,
  FormComModelli, FormSelezionaPraticheImpianti, SACS,
  FormEtichetteListImpostazioni, FormEtichettaEnergetica, FormAllegatiFG, FormAssistenzeMobileMain,
  Levante.Version.InterfacesAndFactory, IniFiles;

{$R *.DFM}

// Procedure per inibire la visualizzazione del InfoTip (Hint relativo alle Items
// delle ListView) nella bacheca e nelle TLIstView del teletrasporto che causavano
// dei problemi di visualizzazione
procedure TmainForm.InhibitLVInfoTips(LV: TListView);
begin

  SendMessage(LV.Handle, LVM_SETTOOLTIPS, 0, 0);

  {
    ListView_SetExtendedListViewStyle(
    LV.Handle,
    ListView_GetExtendedListViewStyle(LV.Handle) and not LVS_EX_INFOTIP
    );
  }
end;

// =============================================================================
// INIZIO PARTE PER GESTIONE FORM AGENDA RIGHT
// -----------------------------------------------------------------------------
// Procedura che crea una istanza di una form Allegati e la ritorna come risultato
function TmainForm.Agenda_CreaForm(OwnerParent: TWinControl; Splitter: TcxSplitter = nil): TAgendaSlideForm;
begin
  Result := TAgendaSlideForm.Create(OwnerParent);
  Result.Parent := OwnerParent;
  Result.Align := alClient;
  if Splitter <> nil then
    Splitter.Control := Result;
  Result.Show;
end;
// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE FORM AGENDA RIGHT
// =============================================================================

// =============================================================================
// INIZIO PARTE PER GESTIONE FORM ALLEGATI
// -----------------------------------------------------------------------------
// Procedura che crea una istanza di una form Allegati e la ritorna come risultato
function TmainForm.Allegati_CreaForm(OwnerParent: TWinControl; Splitter: TcxSplitter = nil): TAllegatiForm;
begin
  Result := TAllegatiForm.Create(OwnerParent);
  Result.Parent := OwnerParent;
  Result.Align := alClient;
  if Splitter <> nil then
    Splitter.Control := Result;
  Result.Show;
end;

procedure TmainForm.SetAllegati_Count(const Value: Integer);
begin
  fAllegati_Count := Value;
  // Se sta già lampeggianto esce subito senza aggiornare
  // lo schermo perchè tanto ci pensa già il timer (anzi
  // sarebbe peggio perchè causerebbe imprecisioni nel lampeggio).
  if TimerBlinkAllegatiAlarm.Enabled then
    Exit;
  // Altrimenti aggiorna subito lo schermo
  Allegati_AggiornaLabelCount(False);
end;

procedure TmainForm.SetAllegati_Count_Alarm(const Value: Integer);
begin
  fAllegati_Count_Alarm := Value;
  // Se ci sono allegati in allarme avvia la visualizzazione alternata
  // e il lampeggio dello splitter, altrimenti lo ferma
  if (Value > 0) then
  begin
    // HO disabilitato gli allarmi perchè davano degli AV
//    TimerBlinkAllegatiAlarm.Enabled := True;
  end
  else
  begin
    TimerBlinkAllegatiAlarm.Enabled := False;
    Allegati_AggiornaLabelCount(False);
  end;
end;

procedure TmainForm.TimerBlinkAllegatiAlarmTimer(Sender: TObject);
begin
  // Visualizza alternativamente il numero degli allegati normali e in allarme
  if LabelAllegati.Tag = 0 then
    Allegati_AggiornaLabelCount(True)
  else
    Allegati_AggiornaLabelCount(False);
end;

procedure TmainForm.Allegati_AggiornaLabelCount(ShowAlarm: Boolean);
const
  NORMAL_SPLITTER_COLOR = $00FFDFDF;
  BLINK_SPLITTER_COLOR = $00C1C1FF;
  NORMAL_LABEL_COLOR = $00FFC6C6;
  BLINK_LABEL_COLOR = $008080FF;
begin
  // Così spero di evitare un AV quando si esce dal programma
  if (csFreeNotification in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) or (csFixups in ComponentState) then
    Exit;
  // Se deve visualizzare il numero degli allarmi presenti...
  if ShowAlarm then
  begin
    LabelAllegati.Tag := 1;
    // Aggiorna la Lebel
    LabelAllegati.Caption := IntToStr(Allegati_Count_Alarm);
    LabelAllegati.Font.Color := BLINK_LABEL_COLOR;
    // Se non c'è ancora una AllegatiForm esce subito altrimenti da un AV
    if (AllegatiFormStack_GetLastAllegatiForm = nil) or (AllegatiFormStack_GetLastAllegatiForm.Splitter = nil) then
      Exit;
    // Aggiorna lo Splitter
    AllegatiFormStack_GetLastAllegatiForm.Splitter.Color := BLINK_SPLITTER_COLOR;
    with mainForm.AllegatiFormStack_GetLastAllegatiForm.Splitter.HotZone as TcxMediaPlayer9Style do
    begin
      ArrowColor := clRed;
      BorderColor := clRed;
    end;
    // Se invece deve visualizzare il numero degli allegati normali...
  end
  else
  begin
    LabelAllegati.Tag := 0;
    // Aggiorna la Lebel
    if Allegati_Count > 0 then
      LabelAllegati.Caption := IntToStr(Allegati_Count)
    else
      LabelAllegati.Caption := '';
    LabelAllegati.Font.Color := NORMAL_LABEL_COLOR;
    // Se non c'è ancora una AllegatiForm esce subito altrimenti da un AV
    if (AllegatiFormStack_GetLastAllegatiForm = nil) or (AllegatiFormStack_GetLastAllegatiForm.Splitter = nil) then
      Exit;
    // Aggiorna lo Splitter
    AllegatiFormStack_GetLastAllegatiForm.Splitter.Color := NORMAL_SPLITTER_COLOR;
    with mainForm.AllegatiFormStack_GetLastAllegatiForm.Splitter.HotZone as TcxMediaPlayer9Style do
    begin
      ArrowColor := clWindowText;
      BorderColor := clBtnShadow;
    end;
  end;
  // Forza l'agiornamento dello schermo
  LabelAllegati.Update;
  AllegatiFormStack_GetLastAllegatiForm.Splitter.Update;
end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE FORM ALLEGATI
// =============================================================================

// Procedura che effettua l'esportazione di una griglia
procedure TmainForm.EsportaGridSuTesto(Grid: TcxGrid);
var
  FileNameNoExt: String;
begin
  // Richiede all'utente il nome del file
  // NB: Prima azzera il nome del file
  DM1.TxtSaveDialog.FileName := '';
  if DM1.TxtSaveDialog.Execute then
  begin
    FileNameNoExt := LeftStr(DM1.TxtSaveDialog.FileName, (Length(DM1.TxtSaveDialog.FileName) - Length(ExtractFileExt(DM1.TxtSaveDialog.FileName))));
    // Verifica che il file non esista già, e se esiste chiede se lo si vuole sovrascrivere
    if FileExists(FileNameNoExt + '.txt') then
    begin
      if DM1.Messaggi('Esportazione', 'File già esistente !!!'#13#13'Devo proseguire e sovrascrivere il file?',
        'NB: Rispondendo "SI" e quindi sovrascrivendo il file esistente i dati in esso contenuti saranno perduti.', [mbYes, mbNo], 0, nil) <> mrYes then
        Exit;
    end;
    // Informa l'utente
    DM1.ShowWait('Esportazione Testo', 'Operazione in corso...');
    try
      // =========================================================================
      // ESPORTAZIONE DA UNA GXGRID
      // -------------------------------------------------------------------------
      Grid.BeginUpdate;
      try;
        ExportGridToText(FileNameNoExt, // FileName senza estensione
          Grid, // cxGrid
          True, // AExpand
          True, // ASaveAll
          #9, // Separator
          '', // Start field delimiter
          '' // End field delimiter
          );
      finally
        Grid.EndUpdate;
      end;
      // =========================================================================
    finally
      DM1.CloseWait;
      DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;

// Procedura che effettua l'esportazione di una griglia
procedure TmainForm.EsportaGridSuExcel(Grid: TcxGrid);
var
  FileNameNoExt: String;
begin
  // Richiede all'utente il nome del file
  // NB: Prima azzera il nome del file
  DM1.ExcelSaveDialog.FileName := '';
  if DM1.ExcelSaveDialog.Execute then
  begin
    FileNameNoExt := LeftStr(DM1.ExcelSaveDialog.FileName, (Length(DM1.ExcelSaveDialog.FileName) - Length(ExtractFileExt(DM1.ExcelSaveDialog.FileName))));
    // Verifica che il file non esista già, e se esiste chiede se lo si vuole sovrascrivere
    if FileExists(FileNameNoExt + '.xls') then
    begin
      if DM1.Messaggi('Esportazione', 'File già esistente !!!'#13#13'Devo proseguire e sovrascrivere il file?',
        'NB: Rispondendo "SI" e quindi sovrascrivendo il file esistente i dati in esso contenuti saranno perduti.', [mbYes, mbNo], 0, nil) <> mrYes then
        Exit;
    end;
    // Informa l'utente
    DM1.ShowWait('Esportazione Excel', 'Operazione in corso...');
    try
      // =========================================================================
      // ESPORTAZIONE DA UNA GXGRID
      // -------------------------------------------------------------------------
      Grid.BeginUpdate;
      try;
        ExportGridToExcel(FileNameNoExt, // FileName senza estensione
          Grid, // cxGrid
          False, // AExpand
          True, // ASaveAll
          True, 'xls' // AFileExt
          );
      finally
        Grid.EndUpdate;
      end;
      // =========================================================================
    finally
      DM1.CloseWait;
      DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;

// Procedura che richiama la form dell'esportazione archivi in modo silent
// ed esegue una esportazione automatizzata senza l'intervento dell'operatore
// in pratica l'ho costruita per poter esportare i documenti
procedure TmainForm.EsportaDocumentoSilent(TipoDoc: String; NumDoc: Integer; RegDoc: String; DataDoc: TDate; TipoFile: String; AvvertiQuandoTerminato: Boolean);
var
  TmpStr, FilterFileName: String;
  LO: TMemIniFile;
begin
  // Verifica che la form di esportazione non sia già esistente
  if ExportForm <> nil then
    raise Exception.Create('Form esportazione già esistente.');

  // Carica dal Layouts.ini il nome del filtro di esportazione da utilizzare
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // In Base al tipo di file richiesto carica il nome filetro di esportazione da usare
    if (Uppercase(TipoFile) = 'XLS') or (Uppercase(TipoFile) = 'EXCEL') then
    begin
      FilterFileName := LO.ReadString(TipoDoc, 'NomeFiltroEsportazioneExcel', 'EsportaDocumentoSingoloExcel');
    end
    else if (Uppercase(TipoFile) = 'TXT') or (Uppercase(TipoFile) = 'CSV') or (Uppercase(TipoFile) = 'TESTO') or (Uppercase(TipoFile) = 'TEXT') then
    begin
      FilterFileName := LO.ReadString(TipoDoc, 'NomeFiltroEsportazioneExcel', 'EsportaDocumentoSingoloTesto');
    end;
  finally
    LO.Free;
  end;

  // Crea la form di esportazione
  Application.CreateForm(TExportForm, ExportForm);
  try
    ExportForm.Parent := mainForm;

    // Imposta il nome del filtro di esportazione
    ExportForm.FilterFileName := FilterFileName;

    // Imposta il flag che indica se deve avvertire a operazione terminata
    ExportForm.AvvertiQuandoTerminato := AvvertiQuandoTerminato;

    // Imposta i parametri della form esportazione con i dati del documento
    ExportForm.AddQueryParams('P_TIPODOCUMENTO', TipoDoc);
    ExportForm.AddQueryParams('P_REGISTRO', RegDoc);
    ExportForm.AddQueryParams('P_NUMORDPREV', NumDoc);
    ExportForm.AddQueryParams('P_DATADOCUMENTO', DataDoc);

    // COmpone automaticamente il nome del file destinazione
    TmpStr := TipoDoc + ' ' + IntToStr(NumDoc) + ' del ' + FormatDatetime('dd_mm_yyyy', DataDoc);
    ExportForm.DestinationFileNameNoExt := TmpStr;

    // Esegue l'esportazione
    ExportForm.AvviaEsportazione;
  finally
    ExportForm.Close;
  end;
end;




// =============================================================================
// INIZIO - PARTE PER LO SCARICAMENTEO DELLA PAGINA WEB PUBBLICITARIA
// -----------------------------------------------------------------------------
// Funzione che controlla se c'è la connessione ad internet e se c'è controlla che
// l'ultimo aggiornamento delle notizie di Levante non sia più vecchio di 1 ora
// Se è più vecchio di 1 ora provvede ad un aggiornamento
{
  procedure TLevanteMainForm.LevanteInfoDownload(Forza:Boolean);
  var
  P: TIniFile;
  PIVA, CodiceAttivazione: String;
  begin
  // NB: SOLO SE SIAMO IN MODALITà LEVANTE LIGHT
  //  (Perchè in modalità Full ancora questo compito è affidato al Guardian)
  if MainForm.IsLevanteLight then begin
  // Prima di tutto verifica se c'è la connessione ad internet
  if not DM1.InternetIsConnected then begin
  if Forza then raise Exception.Create('Connesione a Internet non attiva!');
  //      Exit;
  end;
  // Legge dal file Param.ini la data e ora dell'ultima aggiornamento
  //  e la confronta con la data e ora attuali.
  // Se è passato più di 1 ora dall'ultimo aggiornamento scarica l'aggiornametno attuale.
  P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
  try
  // NB: Il confronto tra le due date avviene in realtà verificando se la differenza tra i due dati
  //      è superiore ad 1 giorno sia con differenza negativa che positiva, in questo modo il tutto funziona
  //      anche se la data è sballata.
  //      if Forza
  //      or (   (Now - P.ReadDateTime('ActivationKey', 'UltimoAggiornamento', StrToDate('01/01/1900'))) > 1   )
  //      then begin
  // Scarica l'aggiornamento
  PIVA := Trim(StartFrame.EditPIVA.Text);
  CodiceAttivazione := CleanStringFromSeparators(Trim(StartFrame.EditCodiceAttivazione.Text));
  Indirizzo2MHT('http://www.levantesw.it/comunicazioni/?p_iva=' + PIVA + '&pwd=' + CodiceAttivazione + '&layout=1', DM1.CoverDir + 'cover.mht');
  // Aggiorna la data dell'ultimo aggiornamento del sistema di comunicazioni
  P.WriteDateTime('ActivationKey', 'UltimoAggiornamento', Now);
  P.UpdateFile;
  //      end;
  finally
  P.Free;
  end;
  end;
  end;
}

{
  procedure TLevanteMainForm.Indirizzo2MHT(Indirizzo: String; NomeFile: string);
  var
  Messaggio: IMessage;
  ConfigurazioneMessaggio: IConfiguration;
  CorpoMessaggio: _Stream;
  //_Stream è un tipo definito in ADO_TLB. Per questo che la unit CDO_TLB include
  //la unit ADO_TLB
  begin
  //creo un messaggio
  Messaggio := CoMessage.Create;
  //creo la configurazione del messaggio
  ConfigurazioneMessaggio := CoConfiguration.Create;
  try
  //assegno al messaggio la sua configurazione (fondamentale)
  Messaggio.Configuration := ConfigurazioneMessaggio;

  //vado a definire il CORPO del messaggio utilizzando il contenuto della pagina
  //all' url Indirizzo: vengono aggregte tra loro le varie risorse a cui si fa
  //riferimento nella pagina (immagini, etc...). Il CORPO del messaggio viene
  //salvato in uno stream; vogliamo includere tutte le risorse a cui si fa
  //riferimento nella pagina e quindi il 2° parametro del metodo IMessage.CreateMHTMLBody
  //(tipo enumerativo Flags) va settato a CdoSuppressNone;
  //gli ultimi 2 parametri sono rispettivamente utenza e password eventuali previste
  //per l' accesso alla pagina;
  //I valori che può assumere il tipo enumerativo CdoMHTMLFlags sono i seguenti

  //CdoSuppressNone
  //Valore = 0
  //Inserisci nel file qualsiasi elemento (immagini, etc...) trovato nell' html
  //dell' indirizzo (naturlamente non in maniera ricorsiva)

  //CdoSuppressImages
  //Valore = 1
  //Non inserisce risorse nel tag IMG

  //CdoSuppressBGSounds
  //Valore = 2
  //Non inserisce risorse nel tag BGSOUND.

  //CdoSuppressFrames
  //Valore = 4
  //Non inserisce risorse nel tag FRAME.

  //CdoSuppressObjects
  //Valore = 8
  //Non inserisce risorse nel tag OBJECT.

  //CdoSuppressStyleSheets
  //Valore = 16
  //Non inserisce risorse nel tag LINK

  //CdoSuppressAll
  //Valore 31
  //Non inserisce risorse (in pratica scarica solo l' html della pagina)
  try
  Messaggio.CreateMHTMLBody(Indirizzo, CdoSuppressNone, '', '');
  except
  Exit;
  end;

  //Ottengo lo stream che contiene il CORPO del messaggio
  CorpoMessaggio := Messaggio.GetStream;

  //salviamo lo stream su un file utilizzando il metodo SaveToFile della interface
  //_Stream definita in ADO_TLB; adSaveCreateOverWrite significa che se il file è
  //già esistente verrà sovrascritto
  CorpoMessaggio.SaveToFile(NomeFile, adSaveCreateOverWrite);
  finally
  Messaggio := nil;
  ConfigurazioneMessaggio := nil;
  CorpoMessaggio := nil;
  end;
  end;
}

// -----------------------------------------------------------------------------
// FINE - PARTE PER LO SCARICAMENTEO DELLA PAGINA WEB PUBBLICITARIA
// =============================================================================

// Procura che carica i parametri per il componente FTP dall'apposito file INI
procedure TmainForm.CaricaParametriFTP(LocFTP: TIdFTP);
var
  P: TMemIniFile;
  Sez, Host, Username, Password, ProxyType: String;
begin
  Sez := 'FTP';
  P := TMemIniFile.Create(DM1.CurrDir + 'FTP.INI');
  try
    // Prima carica alcuni dati sensibili in delle variabili locali
    Host := Trim(P.ReadString(Sez, 'Host', ''));
    Username := Trim(P.ReadString(Sez, 'Username', ''));
    Password := Trim(P.ReadString(Sez, 'Password', ''));
    // Imposta i parametri di cui sopra solo se non sono vuoti in sostituzione
    // di quelli già impostati a design-time
    if Host <> '' then
      LocFTP.Host := Host;
    if Username <> '' then
      LocFTP.Username := Username;
    if Password <> '' then
      LocFTP.Password := Password;
    // Prosegue con gli altri parametri normali
    LocFTP.Port := P.ReadInteger(Sez, 'Port', 21);
    LocFTP.Passive := P.ReadBool(Sez, 'Passive', True);
    // Parametri per l'eventuale PROXY
    LocFTP.ProxySettings.Host := Trim(P.ReadString(Sez, 'Proxy_Host', ''));
    LocFTP.ProxySettings.Port := P.ReadInteger(Sez, 'Proxy_Port', 0);
    LocFTP.ProxySettings.Username := Trim(P.ReadString(Sez, 'Proxy_UserName', ''));
    LocFTP.ProxySettings.Password := Trim(P.ReadString(Sez, 'Proxy_Password', ''));
    // Impostazione Proxy.Type
    ProxyType := Trim(P.ReadString(Sez, 'Proxy_Type', 'None'));
    if ProxyType = 'None' then
      LocFTP.ProxySettings.ProxyType := fpcmNone
    else if ProxyType = 'UserSite' then
      LocFTP.ProxySettings.ProxyType := fpcmUserSite
    else if ProxyType = 'Site' then
      LocFTP.ProxySettings.ProxyType := fpcmSite
    else if ProxyType = 'Open' then
      LocFTP.ProxySettings.ProxyType := fpcmOpen
    else if ProxyType = 'UserPass' then
      LocFTP.ProxySettings.ProxyType := fpcmUserPass
    else if ProxyType = 'Transparent' then
      LocFTP.ProxySettings.ProxyType := fpcmTransparent
    else if ProxyType = 'HttpProxyWithFtp' then
      LocFTP.ProxySettings.ProxyType := fpcmHttpProxyWithFtp;
  finally
    P.Free;
  end;
end;

// Procedura che dimensiona la ClientArea delle form
procedure TmainForm.CalcolaDimensioniClientAreaChildForm(F: TForm; ClientArea: TWinControl; FixedWidth: Boolean);
begin
  // Posizionamento superiore
  ClientArea.Top := CLIENT_TOP_BORDER;
  // Dimensionamento verticale
  ClientArea.Height := F.Height - CLIENT_TOP_BORDER - CLIENT_BOTTOM_BORDER;
  // Dimensionamento e posizionamento orizzontale in caso di form a larghezza fissa
  if FixedWidth then
  begin
    ClientArea.Width := CLIENT_WIDTH;
    ClientArea.Left := CLIENT_LEFT_BORDER + Trunc((F.Width - CLIENT_WIDTH - CLIENT_LEFT_BORDER - CLIENT_RIGHT_BORDER) / 2);
    // Dimensionamento e posizionamento orizzontale in caso di form a larghezza variabile
  end
  else
  begin
    ClientArea.Left := CLIENT_LEFT_BORDER;
    ClientArea.Width := F.Width - CLIENT_LEFT_BORDER - CLIENT_RIGHT_BORDER;
  end;
end;

// Procedura che dimensiona la ClientArea delle form
procedure TmainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(F: TForm; FormMainPanel, ClientArea: TWinControl; SplitterAllegati: TcxSplitter;
  FixedWidth, FixedClientAreaHeight: Boolean);
var
  SplitterTop: Integer;
begin
  // Inizializzazione
  if FixedClientAreaHeight then
    SplitterTop := SplitterAllegati.Height
  else
    SplitterTop := (FormMainPanel.ClientHeight - SplitterAllegati.Top);
  // Imposta le dimensioni del pannello principale
  FormMainPanel.Left := CLIENT_LEFT_BORDER;
  FormMainPanel.Top := CLIENT_TOP_BORDER;
  FormMainPanel.Width := F.Width - CLIENT_LEFT_BORDER - CLIENT_RIGHT_BORDER;
  FormMainPanel.Height := F.Height - CLIENT_TOP_BORDER - CLIENT_BOTTOM_BORDER;
  // Posizionamento ClientArea
  ClientArea.Top := 0;
  ClientArea.Height := FormMainPanel.ClientHeight - SplitterTop - 5;
  // Dimensionamento e posizionamento orizzontale in caso di form a larghezza fissa
  if FixedWidth then
  begin
    ClientArea.Width := CLIENT_WIDTH;
    ClientArea.Left := Trunc((FormMainPanel.Width - ClientArea.Width) / 2);
    if ClientArea.Left < 0 then
      ClientArea.Left := 0;
    // Dimensionamento e posizionamento orizzontale in caso di form a larghezza variabile
  end
  else
  begin
    ClientArea.Left := 0;
    ClientArea.Width := FormMainPanel.Width;
  end;
end;

// Funzione che ritorna True se la form che il nome uguale al parametro
// ricevuto.
function TmainForm.IsActiveForm(FormName: String): Boolean;
var
  N: String;
  i: Integer;
begin
  // Indice per prelevre la form attiva
  i := ControlCount - 1;
  // Ricava il nome dell'ultimo controllo (FOrm) della MainForm che praticamente
  // è la form attiva in questo momento.
  N := Controls[i].Name;
  // NB: Se la form ritornata = 'DatiRigoForm' ritorna la form ancora precedente
  // altrimenti non funge
  if N = 'DatiRigoForm' then
  begin
    dec(i);
    N := Controls[i].Name;
  end;
  // Se la form precedente è 'PreventiviOrdiniForm' e quella prima ancora
  // è'ImpegniForm' ritorna quest'ultima in quanto significa che si tratta
  // di un intervento.
  if (N = 'PreventiviOrdiniForm') and (Controls[i - 1].Name = 'ImpegnoForm') then
  begin
    dec(i);
    N := Controls[i].Name;
  end;
  // Ritorna il risultato
  Result := (N = FormName);
end;

// Procedura che inizializza il sistema di lettura dei codici a barre
procedure TmainForm.BarCodeReadingInit;
begin
  // Inizializza il sistema di lettura dei codici a barre
  fReadingBarcode := False;
  fBarcode := '';
  fBarcodeStartCharCode := DM1.TableProgressiviASCIISTARTDOCBARCODE.AsInteger;
end;

// =================================================================================================================================
// FUNZIONI E PROCEDURE PER LA GESTIONE DEL MAIN MENU'
// ---------------------------------------------------------------------------------------------------------------------------------
procedure TmainForm.LoadMainMenuImages;
var
  B: TBitmap; // B è un puntatore a Bitmap
begin
  // Crea la Lista che contiene i puntatori alle bitmap dei pulsanti del main menu
  MMImgList := TList.Create;
  // ===================================================================================================================================
  // INIZIA IL CARICAMENTO DELLE BITMAPS NELLE TIMAGELIST
  // -----------------------------------------------------------------------------------------------------------------------------------
  // BITMAPS DEI PANNELLI TIPO SOGGETTO SELEZIONATO, PRATICA SELEZIONATA, IMPIANTO SELEZIONATO
  B := TBitmap.Create;
  B.Transparent := True;
  B.LoadFromFile(MainFormTemaDir + 'mm_sel_dis.bmp');
  B.Dormant;
  B.FreeImage;
  MMImgList.Add(B);
  B := TBitmap.Create;
  B.Transparent := True;
  B.LoadFromFile(MainFormTemaDir + 'mm_sel_en.bmp');
  B.Dormant;
  B.FreeImage;
  MMImgList.Add(B);
  B := TBitmap.Create;
  B.Transparent := True;
  B.LoadFromFile(MainFormTemaDir + 'mm_sel_down.bmp');
  B.Dormant;
  B.FreeImage;
  MMImgList.Add(B);
  // B:=TBitmap.Create;   B.Transparent:=True;   B.LoadFromFile(MainFormTemaDir + 'mm_sel_dis.bmp');      MMImgList.Add(B);
  // B:=TBitmap.Create;   B.Transparent:=True;   B.LoadFromFile(MainFormTemaDir + 'mm_sel_en.bmp');       MMImgList.Add(B);
  // B:=TBitmap.Create;   B.Transparent:=True;   B.LoadFromFile(MainFormTemaDir + 'mm_sel_down.bmp');     MMImgList.Add(B);
  SBSoggetto.Height := B.Height; // Dimensionamento automatico verticale
  SBPratica.Height := B.Height; // Dimensionamento automatico verticale
  SBAssistenza.Height := B.Height; // Dimensionamento automatico verticale

  // BITMAPS DEGLI SFONDI DELLE ITEMS DEL MENU PRINCIPALE
  B := TBitmap.Create;
  B.Transparent := True;
  B.LoadFromFile(MainFormTemaDir + 'mm_item_dis.bmp');
  B.Dormant;
  B.FreeImage;
  MMImgList.Add(B);
  B := TBitmap.Create;
  B.Transparent := True;
  B.LoadFromFile(MainFormTemaDir + 'mm_item_en.bmp');
  B.Dormant;
  B.FreeImage;
  MMImgList.Add(B);
  B := TBitmap.Create;
  B.Transparent := True;
  B.LoadFromFile(MainFormTemaDir + 'mm_item_down.bmp');
  B.Dormant;
  B.FreeImage;
  MMImgList.Add(B);
  // B:=TBitmap.Create;   B.Transparent:=True;   B.LoadFromFile(MainFormTemaDir + 'mm_item_dis.bmp');     MMImgList.Add(B);
  // B:=TBitmap.Create;   B.Transparent:=True;   B.LoadFromFile(MainFormTemaDir + 'mm_item_en.bmp');      MMImgList.Add(B);
  // B:=TBitmap.Create;   B.Transparent:=True;   B.LoadFromFile(MainFormTemaDir + 'mm_item_down.bmp');    MMImgList.Add(B);
  SBRubrica.Height := B.Height; // Dimensionamento automatico verticale
  SBDocumenti.Height := B.Height; // Dimensionamento automatico verticale
  SBGM.Height := B.Height; // Dimensionamento automatico verticale
  SBCV.Height := B.Height; // Dimensionamento automatico verticale
  SBArticoli.Height := B.Height; // Dimensionamento automatico verticale
  SBPratiche.Height := B.Height; // Dimensionamento automatico verticale
  SBScadenze.Height := B.Height; // Dimensionamento automatico verticale
  SBPrimanota.Height := B.Height; // Dimensionamento automatico verticale
  SBAssistenze.Height := B.Height; // Dimensionamento automatico verticale
  SBImpegni.Height := B.Height; // Dimensionamento automatico verticale
  SBAgenda.Height := B.Height; // Dimensionamento automatico verticale
  SBGC.Height := B.Height; // Dimensionamento automatico verticale
  SBPartitario.Height := B.Height; // Dimensionamento automatico verticale
  SBGOS.Height := B.Height; // Dimensionamento automatico verticale
  SBResOrd.Height := B.Height; // Dimensionamento automatico verticale
  SBComunicazioni.Height := B.Height; // Dimensionamento automatico verticale

  // IMposta l'altezza dei separatori
  MMSeparatore1.Height := MM_SEPARATOR_HEIGHT;
  MMSeparatore2.Height := MM_SEPARATOR_HEIGHT;
  MMSeparatore3.Height := MM_SEPARATOR_HEIGHT;
end;

function TmainForm.IsMainMenuEnabled: Boolean;
begin
  Result := MainMenuEnabled;
end;

function TmainForm.MMItemIsSelected(MMI: TPaintBox): Boolean;
begin
  // Questa funzione ritorna True se la voce del menu ricevuta come parametro
  // è selezionato.
  Result := MainMenuState[MMI.Tag] = MM_ITEM_SELECTED;
end;

// Function che ritorna il TPaintBox relativo alla voce del MainMenù
// attualmente selezionata.
function TmainForm.MMItemGetSelected: TPaintBox;
begin
  // Inizializzazione
  Result := nil;
  // RItorna il PaintBoxAtualmente selezionato
  if MMItemIsSelected(SBSoggetto) then
    Result := SBSoggetto
  else if MMItemIsSelected(SBPratica) then
    Result := SBPratica
  else if MMItemIsSelected(SBAssistenza) then
    Result := SBAssistenza
  else if MMItemIsSelected(SBAssistenze) then
    Result := SBAssistenze
  else if MMItemIsSelected(SBRubrica) then
    Result := SBRubrica
  else if MMItemIsSelected(SBDocumenti) then
    Result := SBDocumenti
  else if MMItemIsSelected(SBGM) then
    Result := SBGM
  else if MMItemIsSelected(SBCV) then
    Result := SBCV
  else if MMItemIsSelected(SBArticoli) then
    Result := SBArticoli
  else if MMItemIsSelected(SBPratiche) then
    Result := SBPratiche
  else if MMItemIsSelected(SBScadenze) then
    Result := SBScadenze
  else if MMItemIsSelected(SBImpegni) then
    Result := SBImpegni
  else if MMItemIsSelected(SBPrimanota) then
    Result := SBPrimanota
  else if MMItemIsSelected(SBAgenda) then
    Result := SBAgenda
  else if MMItemIsSelected(SBGC) then
    Result := SBGC
  else if MMItemIsSelected(SBPartitario) then
    Result := SBPartitario
  else if MMItemIsSelected(SBGOS) then
    Result := SBGOS
  else if MMItemIsSelected(SBResOrd) then
    Result := SBResOrd
  else if MMItemIsSelected(SBComunicazioni) then
    Result := SBComunicazioni;
end;

procedure TmainForm.MMItemSetSelected(MMI: TPaintBox);
begin
  // Questa funzione Seleziona la voce del main menu ricevuta come parametro.
  // ------------------------------------------------------------------------
  // Prima però deve deselezionare quello precedente
  if MMItemIsSelected(SBSoggetto) then
    MMItemSetUnselected(SBSoggetto);
  if MMItemIsSelected(SBPratica) then
    MMItemSetUnselected(SBPratica);
  if MMItemIsSelected(SBAssistenza) then
    MMItemSetUnselected(SBAssistenza);
  if MMItemIsSelected(SBAssistenze) then
    MMItemSetUnselected(SBAssistenze);
  if MMItemIsSelected(SBRubrica) then
    MMItemSetUnselected(SBRubrica);
  if MMItemIsSelected(SBDocumenti) then
    MMItemSetUnselected(SBDocumenti);
  if MMItemIsSelected(SBGM) then
    MMItemSetUnselected(SBGM);
  if MMItemIsSelected(SBCV) then
    MMItemSetUnselected(SBCV);
  if MMItemIsSelected(SBArticoli) then
    MMItemSetUnselected(SBArticoli);
  if MMItemIsSelected(SBPratiche) then
    MMItemSetUnselected(SBPratiche);
  if MMItemIsSelected(SBScadenze) then
    MMItemSetUnselected(SBScadenze);
  if MMItemIsSelected(SBImpegni) then
    MMItemSetUnselected(SBImpegni);
  if MMItemIsSelected(SBPrimanota) then
    MMItemSetUnselected(SBPrimanota);
  if MMItemIsSelected(SBAgenda) then
    MMItemSetUnselected(SBAgenda);
  if MMItemIsSelected(SBGC) then
    MMItemSetUnselected(SBGC);
  if MMItemIsSelected(SBPartitario) then
    MMItemSetUnselected(SBPartitario);
  if MMItemIsSelected(SBGOS) then
    MMItemSetUnselected(SBGOS);
  if MMItemIsSelected(SBResOrd) then
    MMItemSetUnselected(SBResOrd);
  if MMItemIsSelected(SBComunicazioni) then
    MMItemSetUnselected(SBComunicazioni);
  // Seleziona la voce
  MainMenuState[MMI.Tag] := MM_ITEM_SELECTED;
  MMI.Refresh;
end;

procedure TmainForm.MMItemSetUnselected(MMI: TPaintBox);
begin
  // Questa funzione Deseleziona la voce del main menu ricevuta come parametro.
  // ------------------------------------------------------------------------
  // Seleziona la voce
  MainMenuState[MMI.Tag] := MM_ITEM_ENABLED;
  MMI.Refresh;
end;

procedure TmainForm.MMItemSetEnabled(MMI: TPaintBox; Enabled: Boolean);
begin
  // Questa funzione Ablita/Disabilita la voce del main menu ricevuta come parametro.
  // ------------------------------------------------------------------------
  if Enabled then
  begin
    // Setta il flag a Enabled, ma se è già selected non fà nulla altrimenti succedono casini
    // di visualizzazione
    if MainMenuState[MMI.Tag] <> MM_ITEM_SELECTED then
      MainMenuState[MMI.Tag] := MM_ITEM_ENABLED;
  end
  else
    MainMenuState[MMI.Tag] := MM_ITEM_DISABLED;
  MMI.Enabled := Enabled;
end;

procedure TmainForm.MMItemSetVisible(MMI: TPaintBox; Visible: Boolean);
begin
  // Questa funzione AbIlita/Disabilita la voce del main menu ricevuta come parametro.
  // ------------------------------------------------------------------------
  if Visible and (not MMI.Visible) then
    MMI.Top := 10000; // In questo modo evito gli sfarfallamenti
  if Visible then
    MainMenuState[MMI.Tag] := MM_ITEM_ENABLED
  else
    MainMenuState[MMI.Tag] := MM_ITEM_INVISIBLE;
  MMI.Visible := Visible;
end;

procedure TmainForm.MainMenuInvisibile;
begin
  // Rende invisibili tutte le voci del mainmenu
  MMItemSetVisible(SBSoggetto, False);
  MMItemSetVisible(SBPratica, False);
  MMItemSetVisible(SBAssistenza, False);
  MMItemSetVisible(SBAssistenze, False);
  MMItemSetVisible(SBRubrica, False);
  MMItemSetVisible(SBPratiche, False);
  MMItemSetVisible(SBDocumenti, False);
  MMItemSetVisible(SBScadenze, False);
  MMItemSetVisible(SBImpegni, False);
  MMItemSetVisible(SBArticoli, False);
  MMItemSetVisible(SBGM, False);
  MMItemSetVisible(SBCV, False);
  MMItemSetVisible(SBPrimanota, False);
  MMItemSetVisible(SBAgenda, False);
  MMItemSetVisible(SBGC, False);
  MMItemSetVisible(SBPartitario, False);
  MMItemSetVisible(SBGOS, False);
  MMItemSetVisible(SBResOrd, False);
  MMItemSetVisible(SBComunicazioni, False);
end;

procedure TmainForm.DisabilitaMainMenu(AllDisable: Boolean);
begin
  // Imposta il Flag che indica se il MainMenu è abilitato o meno
  MainMenuEnabled := False;

  // Variabile utilizzata per disabilitare o meno i pulsanti del mainmenu in modo
  // diverso in base a se è cliccato uno dei pulsanti Impostazioni o Utilità
  AllDisable := SBImpostazioni.Down or SBUtilita.Down or AllDisable;
  // Disabilita tutti i pulsanti del menù principale tranne quello selezionato
  MMItemSetEnabled(SBSoggetto, MMItemIsSelected(SBSoggetto) and not AllDisable);
  MMItemSetEnabled(SBPratica, MMItemIsSelected(SBPratica) and not AllDisable);
  MMItemSetEnabled(SBAssistenza, MMItemIsSelected(SBAssistenza) and not AllDisable);
  MMItemSetEnabled(SBAssistenze, MMItemIsSelected(SBAssistenze) and not AllDisable);
  MMItemSetEnabled(SBRubrica, MMItemIsSelected(SBRubrica) and not AllDisable);
  MMItemSetEnabled(SBPratiche, MMItemIsSelected(SBPratiche) and not AllDisable);
  MMItemSetEnabled(SBDocumenti, MMItemIsSelected(SBDocumenti) and not AllDisable);
  MMItemSetEnabled(SBScadenze, MMItemIsSelected(SBScadenze) and not AllDisable);
  MMItemSetEnabled(SBImpegni, MMItemIsSelected(SBImpegni) and not AllDisable);
  MMItemSetEnabled(SBArticoli, MMItemIsSelected(SBArticoli) and not AllDisable);
  MMItemSetEnabled(SBGM, MMItemIsSelected(SBGM) and not AllDisable);
  MMItemSetEnabled(SBCV, MMItemIsSelected(SBCV) and not AllDisable);
  MMItemSetEnabled(SBPrimanota, MMItemIsSelected(SBPrimanota) and not AllDisable);
  MMItemSetEnabled(SBAgenda, MMItemIsSelected(SBAgenda) and not AllDisable);
  MMItemSetEnabled(SBGC, MMItemIsSelected(SBGC) and not AllDisable);
  MMItemSetEnabled(SBPartitario, MMItemIsSelected(SBPartitario) and not AllDisable);
  MMItemSetEnabled(SBGOS, MMItemIsSelected(SBGOS) and not AllDisable);
  MMItemSetEnabled(SBResOrd, MMItemIsSelected(SBResOrd) and not AllDisable);
  MMItemSetEnabled(SBComunicazioni, MMItemIsSelected(SBComunicazioni) and not AllDisable);

  // Disabilita il calendario dell'agenda

  if (not ModoAssistenzeRDP) and (ClientiForm.PageControl2.ActivePage = ClientiForm.TabAgenda) then
    ChiudiCalendario;

  // Se la voce selezionata non è il soggetto selezionato e c'è un soggetto selezionato
  // disabilita il pulsante di chiusura del soggetto selezionato
  if (not MMItemIsSelected(SBSoggetto)) and (SSChiudi.Visible) then
    SSChiudi.Enabled := False;
  if (not MMItemIsSelected(SBPratica)) and (not MMItemIsSelected(SBAssistenza)) and (PSChiudi.Visible) then
    PSChiudi.Enabled := False;

  // Utilità e Impostazioni
  SBUtilita.Enabled := SBUtilita.Down;
  SBImpostazioni.Enabled := SBImpostazioni.Down;
end;

procedure TmainForm.CheckMainMenu;
begin
  // Questa funzione visualizza e ridimensiona nel modo corretto il Menù principale
  // in base a quali moduli sono o meno attivati dalla chiave
  // NB: Se siamo in modalità Levante Light visualizza comunque tutti
  // i moduli ma lascia attivi solo quelli che abbiamo deciso noi
  // ------------------------------------------------------------------------------
  // In base alla modalità poosiziona le voci del menù principale
  if DM1.FastSelectionMode then
    CheckMainMenu_FastSelectionMode
  else
    CheckMainMenu_NormalMode;
  // Effettua il posizionamento delle voci del MainMenu
  RefreshMainMenu;
end;

procedure TmainForm.CheckMainMenu_FastSelectionMode;
begin
  // Questa funzione visualizza e ridimensiona nel modo corretto il Menù principale
  // in base a quali moduli sono o meno attivati dalla chiave
  // NB: Se siamo in modalità Levante Light visualizza comunque tutti
  // i moduli ma lascia attivi solo quelli che abbiamo deciso noi
  // ------------------------------------------------------------------------------
  // Soggetto selezionato e pratica selezionata sono invisibili all'inizio
  MMItemSetVisible(SBSoggetto, False);
  MMItemSetVisible(SBPratica, False);
  MMItemSetVisible(SBAssistenza, False);
  // ---------------------------------------
  // Il pulsante RUBRICA è sempre attivo
  MMItemSetVisible(SBRubrica, True);
  MMFirst1 := SBRubrica.Name;
  MMLast1 := SBRubrica.Name;
  // Se attivo visualizza il pulsante PRATICHE/CANTIERI
  if (DM1.ModCtrl(MOD_PRATICHE) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBPratiche, True);
    MMLast1 := SBPratiche.Name;
  end
  else
    MMItemSetVisible(SBPratiche, False);
  // Se attivo visualizza il pulsante ASSISTENZE
  if (DM1.ModCtrl(MOD_CONTATTI) > 0) and (DM1.MainMenuVisualizzaImpianti or (IsLevanteLight)) then
  begin
    MMItemSetVisible(SBAssistenze, True);
    MMLast1 := SBAssistenze.Name;
  end
  else
    MMItemSetVisible(SBAssistenze, False);
  // ---------------------------------------
  // Il pulsante DOCUMENTI è sempre attivo
  MMItemSetVisible(SBDocumenti, True);
  MMFirst2 := SBDocumenti.Name;
  MMLast2 := SBDocumenti.Name;
  // Se attivo visualizza il pulsante COMUNICAZIONI
  if (DM1.ModCtrl(MOD_TESTI) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBComunicazioni, True);
    MMLast2 := SBComunicazioni.Name;
  end
  else
    MMItemSetVisible(SBComunicazioni, False);
  // Se attivo visualizza il pulsante SCADENZE
  if (DM1.ModCtrl(MOD_SCADENZARIO) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBScadenze, True);
    MMLast2 := SBScadenze.Name;
  end
  else
    MMItemSetVisible(SBScadenze, False);
  // Se attivo visualizza il pulsante PRIMANOTA
  if (DM1.ModCtrl(MOD_PRIMANOTA) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBPrimanota, True);
    MMLast2 := SBPrimanota.Name;
  end
  else
    MMItemSetVisible(SBPrimanota, False);
  // Se attivo visualizza il pulsante PARTITARIO
  if (DM1.ModCtrl(MOD_PRIMANOTA) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBPartitario, True);
    MMLast2 := SBPartitario.Name;
  end
  else
    MMItemSetVisible(SBPartitario, False);
  // ---------------------------------------
  // Se attivo visualizza il pulsante AGENDA
  // NB: In Fast Selection mode l'agenda non è nel main menù ma a lato
  MMItemSetVisible(SBAgenda, False);
  ClientiForm.Agenda_SlideEnabled := (DM1.ModCtrl(MOD_AGENDA) > 0) or (IsLevanteLight);
  // Se attivo visualizza il pulsante IMPEGNI
  if (DM1.ModCtrl(MOD_CONTATTI) > 0) and (DM1.MainMenuVisualizzaImpegni or (IsLevanteLight)) then
  begin
    MMItemSetVisible(SBImpegni, True);
    MMLast2 := SBImpegni.Name;
  end
  else
    MMItemSetVisible(SBImpegni, False);
  // ---------------------------------------
  // Se attivo visualizza il pulsante ARTICOLI
  if (DM1.ModCtrl(MOD_ARTICOLI) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBArticoli, True);
    MMLast2 := SBArticoli.Name;
  end
  else
    MMItemSetVisible(SBArticoli, False);
  // Se attivo visualizza il pulsante GIORNALE DI MAGAZZINO
  if (DM1.ModCtrl(MOD_GIORNALE_MAGAZZINO) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBGM, True);
    MMLast2 := SBGM.Name;
  end
  else
    MMItemSetVisible(SBGM, False);
  // Se attivo visualizza il pulsante GIORNALE MANODOPERA SPESE
  if (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBGOS, True);
    MMLast2 := SBGOS.Name;
  end
  else
    MMItemSetVisible(SBGOS, False);
  // Se attivo visualizza il pulsante GIORNALE DI CANTIERE
  if (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBGC, True);
    MMLast2 := SBGC.Name;
  end
  else
    MMItemSetVisible(SBGC, False);
  // Se attivo visualizza il pulsante CONDIZIONI DI VENDITA
  if DM1.ModCtrl(MOD_CONDIZIONI_VENDITA) > 0 then
  begin
    MMItemSetVisible(SBCV, True);
    MMLast2 := SBCV.Name;
  end
  else
    MMItemSetVisible(SBCV, False);
  // Se attivo visualizza il pulsante RESIDUO ORDINI
  // if MainForm.IsLevanteLight then begin
  MMItemSetVisible(SBResOrd, True);
  MMLast2 := SBResOrd.Name;
  // end else MMItemSetVisible(SBResOrd, False);
  // ---------------------------------------
  // In modalità LevanteLight non devono esser visibili i menu
  // "Impostazioni" e "Utilità"
  if IsLevanteLight then
  begin
    SBUtilita.Visible := False;
    SBImpostazioni.Visible := False;
  end;
end;

procedure TmainForm.CheckMainMenu_NormalMode;
begin
  // Questa funzione visualizza e ridimensiona nel modo corretto il Menù principale
  // in base a quali moduli sono o meno attivati dalla chiave
  // NB: Se siamo in modalità Levante Light visualizza comunque tutti
  // i moduli ma lascia attivi solo quelli che abbiamo deciso noi
  // ------------------------------------------------------------------------------
  // Soggetto selezionato e pratica selezionata sono invisibili all'inizio
  MMItemSetVisible(SBSoggetto, False);
  MMItemSetVisible(SBPratica, False);
  MMItemSetVisible(SBAssistenza, False);

  // Il pulsante RUBRICA è sempre attivo
  MMItemSetVisible(SBRubrica, True);
  MMFirst1 := SBRubrica.Name;
  MMLast1 := SBRubrica.Name;

  // Se attivo visualizza il pulsante PRATICHE/CANTIERI
  if (DM1.ModCtrl(MOD_PRATICHE) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBPratiche, True);
    MMLast1 := SBPratiche.Name;
  end
  else
    MMItemSetVisible(SBPratiche, False);

  // Se attivo visualizza il pulsante ASSISTENZE
  if (DM1.ModCtrl(MOD_CONTATTI) > 0) and (DM1.MainMenuVisualizzaImpianti or (IsLevanteLight)) then
  begin
    MMItemSetVisible(SBAssistenze, True);
    MMLast1 := SBAssistenze.Name;
  end
  else
    MMItemSetVisible(SBAssistenze, False);

  // Il pulsante DOCUMENTI è sempre attivo
  MMItemSetVisible(SBDocumenti, True);
  MMLast1 := SBDocumenti.Name;

  // Se attivo visualizza il pulsante COMUNICAZIONI
  if (DM1.ModCtrl(MOD_TESTI) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBComunicazioni, True);
    MMLast1 := SBScadenze.Name;
  end
  else
    MMItemSetVisible(SBComunicazioni, False);

  // Se attivo visualizza il pulsante SCADENZE
  if (DM1.ModCtrl(MOD_SCADENZARIO) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBScadenze, True);
    MMLast1 := SBScadenze.Name;
  end
  else
    MMItemSetVisible(SBScadenze, False);

  // Se attivo visualizza il pulsante PRIMANOTA
  if (DM1.ModCtrl(MOD_PRIMANOTA) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBPrimanota, True);
    MMLast1 := SBPrimanota.Name;
  end
  else
    MMItemSetVisible(SBPrimanota, False);

  // Se attivo visualizza il pulsante PARTITARIO
  if (DM1.ModCtrl(MOD_PRIMANOTA) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBPartitario, True);
    MMLast1 := SBPartitario.Name;
  end
  else
    MMItemSetVisible(SBPartitario, False);

  // Se attivo visualizza il pulsante AGENDA
  // NB: Se NON siamo in FastSelectionMode rende visibile l'agenda normale nel main menù
  // e non visibile quella a lato a dx.
  ClientiForm.Agenda_SlideEnabled := False;
  if (DM1.ModCtrl(MOD_AGENDA) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBAgenda, True);
    MMLast1 := SBAgenda.Name;
  end
  else
    MMItemSetVisible(SBAgenda, False);

  // Se attivo visualizza il pulsante IMPEGNI
  if (DM1.ModCtrl(MOD_CONTATTI) > 0) and (DM1.MainMenuVisualizzaImpegni or (IsLevanteLight)) then
  begin
    MMItemSetVisible(SBImpegni, True);
    MMLast1 := SBImpegni.Name;
  end
  else
    MMItemSetVisible(SBImpegni, False);

  // Se attivo visualizza il pulsante ARTICOLI
  if (DM1.ModCtrl(MOD_ARTICOLI) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBArticoli, True);
    MMLast1 := SBArticoli.Name;
  end
  else
    MMItemSetVisible(SBArticoli, False);

  // Se attivo visualizza il pulsante GIORNALE DI MAGAZZINO
  if (DM1.ModCtrl(MOD_GIORNALE_MAGAZZINO) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBGM, True);
    MMLast1 := SBGM.Name;
  end
  else
    MMItemSetVisible(SBGM, False);

  // Se attivo visualizza il pulsante GIORNALE MANODOPERA SPESE
  if (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBGOS, True);
    MMLast1 := SBGOS.Name;
  end
  else
    MMItemSetVisible(SBGOS, False);

  // Se attivo visualizza il pulsante GIORNALE DI CANTIERE
  if (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) or (IsLevanteLight) then
  begin
    MMItemSetVisible(SBGC, True);
    MMLast1 := SBGC.Name;
  end
  else
    MMItemSetVisible(SBGC, False);

  // Se attivo visualizza il pulsante CONDIZIONI DI VENDITA
  if DM1.ModCtrl(MOD_CONDIZIONI_VENDITA) > 0 then
  begin
    MMItemSetVisible(SBCV, True);
    MMLast1 := SBCV.Name;
  end
  else
    MMItemSetVisible(SBCV, False);

  // Se attivo visualizza il pulsante RESIDUO ORDINI
  // if MainForm.IsLevanteLight then begin
  MMItemSetVisible(SBResOrd, True);
  MMLast1 := SBResOrd.Name;
  // end else MMItemSetVisible(SBResOrd, False);

  // In modalità LevanteLight non devono esser visibili i menu
  // "Impostazioni" e "Utilità"
  if IsLevanteLight then
  begin
    SBUtilita.Visible := False;
    SBImpostazioni.Visible := False;
  end;
end;

procedure TmainForm.RefreshMainMenu;
const
  SSCHIUDI_LEFT_OFFSET = 164;
  SSCHIUDI_TOP_OFFSET = 1;
  PSCHIUDI_LEFT_OFFSET = 164;
  PSCHIUDI_TOP_OFFSET = 1;
begin
  // In base alla modalità poosiziona le voci del menù principale
  if DM1.FastSelectionMode then
    RefreshMainMenu_FastSelectionMode
  else
    RefreshMainMenu_NormalMode;

  // Posizionamento pulsante per chiudere il soggetto e la pratica selezionati
  mainForm.SSChiudi.Top := mainForm.SBSoggetto.Top + SSCHIUDI_TOP_OFFSET;
  mainForm.SSChiudi.Left := mainForm.SBSoggetto.Left + SSCHIUDI_LEFT_OFFSET;
  if mainForm.SBPratica.Visible then
  begin
    mainForm.PSChiudi.Top := mainForm.SBPratica.Top + SSCHIUDI_TOP_OFFSET;
    mainForm.PSChiudi.Left := mainForm.SBPratica.Left + SSCHIUDI_LEFT_OFFSET;
  end
  else if mainForm.SBAssistenza.Visible then
  begin
    mainForm.PSChiudi.Top := mainForm.SBAssistenza.Top + SSCHIUDI_TOP_OFFSET;
    mainForm.PSChiudi.Left := mainForm.SBAssistenza.Left + SSCHIUDI_LEFT_OFFSET;
  end
end;

procedure TmainForm.RefreshMainMenu_NormalMode;
var
  YY: Integer;
begin
  // Inizializzazione
  YY := 100;
  // Posizione verticalmente le varie voci
  if SBSoggetto.Visible then
  begin
    SBSoggetto.Top := YY;
    Inc(YY, SBSoggetto.Height);
  end;
  if SBPratica.Visible then
  begin
    SBPratica.Top := YY;
    Inc(YY, SBPratica.Height);
  end;
  if SBAssistenza.Visible then
  begin
    SBAssistenza.Top := YY;
    Inc(YY, SBAssistenza.Height);
  end;
  if SBRubrica.Visible then
  begin
    SBRubrica.Top := YY;
    Inc(YY, SBRubrica.Height);
  end;
  if SBPratiche.Visible then
  begin
    SBPratiche.Top := YY;
    Inc(YY, SBPratiche.Height);
  end;

  MMSeparatore1.Top := YY;
  Inc(YY, MMSeparatore1.Height);

  if SBDocumenti.Visible then
  begin
    SBDocumenti.Top := YY;
    Inc(YY, SBDocumenti.Height);
  end;
  if SBComunicazioni.Visible then
  begin
    SBComunicazioni.Top := YY;
    Inc(YY, SBComunicazioni.Height);
  end;
  if SBScadenze.Visible then
  begin
    SBScadenze.Top := YY;
    Inc(YY, SBScadenze.Height);
  end;
  if SBPrimanota.Visible then
  begin
    SBPrimanota.Top := YY;
    Inc(YY, SBPrimanota.Height);
  end;
  if SBPartitario.Visible then
  begin
    SBPartitario.Top := YY;
    Inc(YY, SBPartitario.Height);
  end;

  MMSeparatore2.Top := YY;
  Inc(YY, MMSeparatore2.Height);

  if SBAgenda.Visible then
  begin
    SBAgenda.Top := YY;
    Inc(YY, SBAgenda.Height);
  end;
  if SBAssistenze.Visible then
  begin
    SBAssistenze.Top := YY;
    Inc(YY, SBAssistenze.Height);
  end;
  if SBImpegni.Visible then
  begin
    SBImpegni.Top := YY;
    Inc(YY, SBImpegni.Height);
  end;

  MMSeparatore3.Top := YY;
  Inc(YY, MMSeparatore3.Height);

  if SBArticoli.Visible then
  begin
    SBArticoli.Top := YY;
    Inc(YY, SBArticoli.Height);
  end;
  if SBGM.Visible then
  begin
    SBGM.Top := YY;
    Inc(YY, SBGM.Height);
  end;
  if SBGOS.Visible then
  begin
    SBGOS.Top := YY;
    Inc(YY, SBGOS.Height);
  end;
  if SBGC.Visible then
  begin
    SBGC.Top := YY;
    Inc(YY, SBGC.Height);
  end;
  if SBCV.Visible then
  begin
    SBCV.Top := YY;
    Inc(YY, SBCV.Height);
  end;
  if SBResOrd.Visible then
  begin
    SBResOrd.Top := YY;
    Inc(YY, SBResOrd.Height);
  end;
end;

procedure TmainForm.RefreshMainMenu_FastSelectionMode;
var
  YY: Integer;
begin
  // Inizializzazione
  YY := 100;
  // Posizione verticalmente le varie voci
  if SBRubrica.Visible then
  begin
    SBRubrica.Top := YY;
    Inc(YY, SBRubrica.Height);
  end;
  if SBPratiche.Visible then
  begin
    SBPratiche.Top := YY;
    Inc(YY, SBPratiche.Height);
  end;
  if SBAssistenze.Visible then
  begin
    SBAssistenze.Top := YY;
    Inc(YY, SBAssistenze.Height);
  end;

  // Dimensiona e posiziona il primo separatore
  MMSeparatore1.Height := 30;
  MMSeparatore1.Width := MainLeftPanel.Width;
  MMSeparatore1.Left := 4;
  MMSeparatore1.Top := YY;
  Inc(YY, MMSeparatore1.Height);

  if SBSoggetto.Visible then
  begin
    SBSoggetto.Top := YY;
    Inc(YY, SBSoggetto.Height);
  end;
  if SBPratica.Visible then
  begin
    SBPratica.Top := YY;
    Inc(YY, SBPratica.Height);
  end;
  if SBAssistenza.Visible then
  begin
    SBAssistenza.Top := YY;
    Inc(YY, SBAssistenza.Height);
  end;

  if SBDocumenti.Visible then
  begin
    SBDocumenti.Top := YY;
    Inc(YY, SBDocumenti.Height);
  end;
  if SBComunicazioni.Visible then
  begin
    SBComunicazioni.Top := YY;
    Inc(YY, SBComunicazioni.Height);
  end;
  if SBScadenze.Visible then
  begin
    SBScadenze.Top := YY;
    Inc(YY, SBScadenze.Height);
  end;
  if SBPrimanota.Visible then
  begin
    SBPrimanota.Top := YY;
    Inc(YY, SBPrimanota.Height);
  end;
  if SBPartitario.Visible then
  begin
    SBPartitario.Top := YY;
    Inc(YY, SBPartitario.Height);
  end;

  MMSeparatore2.Top := YY;
  Inc(YY, MMSeparatore3.Height);

  if SBAgenda.Visible then
  begin
    SBAgenda.Top := YY;
    Inc(YY, SBAgenda.Height);
  end;
  if SBImpegni.Visible then
  begin
    SBImpegni.Top := YY;
    Inc(YY, SBImpegni.Height);
  end;

  MMSeparatore3.Top := YY;
  Inc(YY, MMSeparatore3.Height);

  if SBArticoli.Visible then
  begin
    SBArticoli.Top := YY;
    Inc(YY, SBArticoli.Height);
  end;
  if SBGM.Visible then
  begin
    SBGM.Top := YY;
    Inc(YY, SBGM.Height);
  end;
  if SBGOS.Visible then
  begin
    SBGOS.Top := YY;
    Inc(YY, SBGOS.Height);
  end;
  if SBGC.Visible then
  begin
    SBGC.Top := YY;
    Inc(YY, SBGC.Height);
  end;
  if SBCV.Visible then
  begin
    SBCV.Top := YY;
    Inc(YY, SBCV.Height);
  end;
  if SBResOrd.Visible then
  begin
    SBResOrd.Top := YY;
    Inc(YY, SBResOrd.Height);
  end;
end;

procedure TmainForm.AbilitaMainMenu;
begin
  // Imposta il Flag che indica se il MainMenu è abilitato o meno
  MainMenuEnabled := True;

  // Se siamo in modalità Levante Light visualizza comunque tutti
  // i moduli ma lascia attivi solo quelli che abbiamo deciso noi
  if IsLevanteLight then
  begin
    // Abilita tutti i pulsanti del menù principale
    MMItemSetEnabled(SBSoggetto, False);
    MMItemSetEnabled(SBPratica, False);
    MMItemSetEnabled(SBAssistenza, False);
    MMItemSetEnabled(SBAssistenze, False);
    MMItemSetEnabled(SBRubrica, False);
    MMItemSetEnabled(SBPratiche, False);
    MMItemSetEnabled(SBDocumenti, True);
    MMItemSetEnabled(SBScadenze, False);
    MMItemSetEnabled(SBImpegni, False);
    MMItemSetEnabled(SBArticoli, True);
    MMItemSetEnabled(SBGM, False);
    MMItemSetEnabled(SBCV, False);
    MMItemSetEnabled(SBPrimanota, False);
    MMItemSetEnabled(SBAgenda, False);
    MMItemSetEnabled(SBGC, False);
    MMItemSetEnabled(SBPartitario, False);
    MMItemSetEnabled(SBGOS, False);
    MMItemSetEnabled(SBResOrd, True);
    MMItemSetEnabled(SBComunicazioni, False);
    // Se invece siamo in modalità normale abilita tutti i pulsanti del menù principale
  end
  else
  begin
    MMItemSetEnabled(SBSoggetto, True);
    MMItemSetEnabled(SBPratica, True);
    MMItemSetEnabled(SBAssistenza, True);
    MMItemSetEnabled(SBAssistenze, True);
    MMItemSetEnabled(SBRubrica, True);
    MMItemSetEnabled(SBPratiche, True);
    MMItemSetEnabled(SBDocumenti, True);
    MMItemSetEnabled(SBScadenze, True);
    MMItemSetEnabled(SBImpegni, True);
    MMItemSetEnabled(SBArticoli, True);
    MMItemSetEnabled(SBGM, True);
    MMItemSetEnabled(SBCV, True);
    MMItemSetEnabled(SBPrimanota, True);
    MMItemSetEnabled(SBAgenda, True);
    MMItemSetEnabled(SBGC, True);
    MMItemSetEnabled(SBPartitario, True);
    MMItemSetEnabled(SBGOS, True);
    MMItemSetEnabled(SBResOrd, True);
    MMItemSetEnabled(SBComunicazioni, True);
  end;

  // Disabilita il calendario dell'agenda
  if ClientiForm.PageControl2.ActivePage = ClientiForm.TabAgenda then
    ApriCalendario;

  // Se la voce selezionata è il soggetto selezionato o similari, attiva il pulsante di chiusura del
  // soggetto selezionato o similare
  if (not MMItemIsSelected(SBSoggetto)) and (SSChiudi.Visible) then
    SSChiudi.Enabled := True;
  if (not MMItemIsSelected(SBPratica)) and (not MMItemIsSelected(SBAssistenza)) and (PSChiudi.Visible) then
    PSChiudi.Enabled := True;

  // Utilità e Impostazioni
  SBUtilita.Enabled := DM1.AbilitaMenuUtilita;
  SBImpostazioni.Enabled := DM1.AbilitaMenuImpostazioni;
end;
// =================================================================================================================================

procedure TmainForm.LevanteException(Sender: TObject; E: Exception);
begin
  // Visualizza l'errore
  Application.ShowException(E);
end;

function TmainForm.TrayBarTop: Integer;
var
  r: TRect;
begin
  GetWindowRect(FindWindow('Shell_TrayWnd', nil), r);
  Result := r.Top;
end;

procedure TmainForm.FormSetParentPlatformDependent(CF, PF: TForm);
begin
  // Questa procedura imposta la proprietà Parent della CF(ClientForm) in modo che punti
  // alla PF (ParentForm). E' stata creata per risolvere un problema che apariva quando
  // il programma girava su Win95/98/ME e solo quando assegnavo la proprietà Parent
  // della form AnagArtForm := MainFOrm (AnagArtForm.Parent := MainForm).
  // Se invece di fare la suddetta assegnazione uso l'API Windows.SetParent non mi dà
  // l'errore. Però per evitare possibili problemi uso questo modo solo se il programma stà girando
  // su Win95/98/ME. I problemi possono nascere perchè usando l'API direttamente Delhi non ha modo di
  // aggiornare alcune sue strutture e altre cose, quindi devo fare attenzione. Cmq per il momento
  // sembra funzionare correttamente.
  // --------------------------------------------------------------------------
  // Se il programma stà girando su Win95/98/Me usa l'API di Windows direttamente
  if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
  begin
    Windows.SetParent(CF.Handle, PF.Handle);
    // Altrimenti fà l'assegnazione normale delle proprietà
  end
  else
  begin
    CF.Parent := PF;
  end;
end;

procedure TmainForm.BloccaIconaDocTipo(Blocca: Boolean; NomeFormChiamante: TComponentName);
var
  SogliaPerDisabilitaMainMenu: Byte;
begin
  // IMposta la soglia oltre la quale deve disabilitare il MainMenu a 1 se le form
  // chiamanti sono fra quelle elencate, a 0 in tutti gli altri casi
  SogliaPerDisabilitaMainMenu := 0;

  // Se il parametro = True  incrementa il flag altrimenti lo decrementa
  // Bloccato > 1  -  Sbloccato = 0
  if Blocca then
  begin
    // Incrementa il livello del flag
    Inc(FlagBloccoIconaDocTipo, 1);
    // Se il flag > Soglia Disabilita il MainMenu
    if FlagBloccoIconaDocTipo > SogliaPerDisabilitaMainMenu then
    begin
      DisabilitaMainMenu(False);
    end;
  end
  else
  begin
    // Decrementa il livello del flag
    dec(FlagBloccoIconaDocTipo, 1);
    // Se il flag del blocco <= soglia allora riabilita anche il MainMenu
    if FlagBloccoIconaDocTipo <= SogliaPerDisabilitaMainMenu then
      AbilitaMainMenu;
  end;
end;

function TmainForm.IconaDocTipoBloccata: Integer;
begin
  // Ritorna True se l'aggiornamento dell'IconaDocTipo è bloccato
  Result := FlagBloccoIconaDocTipo;
end;

procedure TmainForm.CaricaIconaDocTipo(Titolo: String);
var
  TestoRect: TRect;
  P: TMemIniFile;
  S: String;
begin
  // Prima di tutto controlla se l'IconaDocTipo è bloccata ed se si, esce subito sanza fare nulla
  if FlagBloccoIconaDocTipo > 0 then
    Exit;
  // Apre il file dei parametri del manu
  P := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    // Carica e dimensiona la bitmap che indica il tipo di form visualizzata
    S := P.ReadString(Titolo, 'Bitmap', '');
    if (S <> '') and (FileExists(DM1.TemaDir + S)) then
    begin
      ImgDocTipo.Picture.LoadFromFile(DM1.TemaDir + S);
      ImgDocTipo.Height := ImgDocTipo.Picture.Height;
      ImgDocTipo.Visible := True;
    end
    else
    begin
      ImgDocTipo.Visible := False;
    end;
    // Caption1
    Caption1.Caption := P.ReadString(Titolo, 'Caption1', '');
    Caption1.Top := P.ReadInteger(Titolo, 'Caption1Top', 0);
    Caption1.Left := P.ReadInteger(Titolo, 'Caption1Left', 0);
    Caption1.Font.Name := P.ReadString(Titolo, 'Caption1FontName', 'Verdana');
    Caption1.Font.Size := P.ReadInteger(Titolo, 'Caption1FontSize', 10);
    if P.ReadBool(Titolo, 'Caption1FontStyleBold', True) then
      Caption1.Font.Style := [fsBold]
    else
      Caption1.Font.Style := [];
    // Caption2
    Caption2.Caption := P.ReadString(Titolo, 'Caption2', '');
    Caption2.Top := P.ReadInteger(Titolo, 'Caption2Top', 0);
    Caption2.Left := P.ReadInteger(Titolo, 'Caption2Left', 0);
    Caption2.Font.Name := P.ReadString(Titolo, 'Caption2FontName', 'Verdana');
    Caption2.Font.Size := P.ReadInteger(Titolo, 'Caption2FontSize', 10);
    if P.ReadBool(Titolo, 'Caption2FontStyleBold', True) then
      Caption2.Font.Style := [fsBold]
    else
      Caption2.Font.Style := [];
    // Caption3
    Caption3.Caption := P.ReadString(Titolo, 'Caption3', '');
    Caption3.Top := P.ReadInteger(Titolo, 'Caption3Top', 0);
    Caption3.Left := P.ReadInteger(Titolo, 'Caption3Left', 0);
    Caption3.Font.Name := P.ReadString(Titolo, 'Caption3FontName', 'Verdana');
    Caption3.Font.Size := P.ReadInteger(Titolo, 'Caption3FontSize', 10);
    if P.ReadBool(Titolo, 'Caption3FontStyleBold', True) then
      Caption3.Font.Style := [fsBold]
    else
      Caption3.Font.Style := [];
  finally
    P.Free;
    Update;
  end;
end;

procedure TmainForm.SalvaIconaDocTipo;
var
  CurrIconaDocTipo: ItemDocTipoPointer;
begin
  if Self.ImgDocTipo.Picture.Graphic = nil then
    Exit;
  // Prima di tutto controlla se l'IconaDocTipo è bloccata ed se si, esce subito sanza fare nulla
  if FlagBloccoIconaDocTipo > 0 then
    Exit;
  // Se non è già stata creata crea la TList che contiene lo stack delle IconeDocTipo
  if not Assigned(StackIconaDocTipo) then
    StackIconaDocTipo := TList.Create;
  // Crea il puntatore al record che conterrà i dati della IconaDocTipo corrente per essere inserita
  // nello stack
  New(CurrIconaDocTipo);
  // Inserisce i dati dell'IconaDocTipo da salvare nel record
  if not Self.ImgDocTipo.Picture.Graphic.Empty then
  begin
    CurrIconaDocTipo^.ImgDocTipo := TBitmap.Create;
    CurrIconaDocTipo^.ImgDocTipo.Assign(ImgDocTipo.Picture);
  end;
  CurrIconaDocTipo^.LabelTipoDocumentoVisible := LabelTipoDocumento.Visible;
  CurrIconaDocTipo^.SBTipoDocumentoVisible := SBTipoDocumento.Visible;
  CurrIconaDocTipo^.Caption1 := Caption1.Caption;
  CurrIconaDocTipo^.Caption1Top := Caption1.Top;
  CurrIconaDocTipo^.Caption1Left := Caption1.Left;
  CurrIconaDocTipo^.Caption1FontName := Caption1.Font.Name;
  CurrIconaDocTipo^.Caption1FontSize := Caption1.Font.Size;
  CurrIconaDocTipo^.Caption1FontStyleBold := fsBold in Caption1.Font.Style;
  CurrIconaDocTipo^.Caption2 := Caption2.Caption;
  CurrIconaDocTipo^.Caption2Top := Caption2.Top;
  CurrIconaDocTipo^.Caption2Left := Caption2.Left;
  CurrIconaDocTipo^.Caption2FontName := Caption2.Font.Name;
  CurrIconaDocTipo^.Caption2FontSize := Caption2.Font.Size;
  CurrIconaDocTipo^.Caption2FontStyleBold := fsBold in Caption2.Font.Style;
  CurrIconaDocTipo^.Caption3 := Caption3.Caption;
  CurrIconaDocTipo^.Caption3Top := Caption3.Top;
  CurrIconaDocTipo^.Caption3Left := Caption3.Left;
  CurrIconaDocTipo^.Caption3FontName := Caption3.Font.Name;
  CurrIconaDocTipo^.Caption3FontSize := Caption3.Font.Size;
  CurrIconaDocTipo^.Caption3FontStyleBold := fsBold in Caption3.Font.Style;
  // Esegue il metodo Dormant della Bitmap e poi FreeImage per liberare le risorse GDI occupate
  // dalla Bitmap stessa e quindi ottimizzarne l'utilizzo.
  CurrIconaDocTipo^.ImgDocTipo.Dormant;
  CurrIconaDocTipo^.ImgDocTipo.FreeImage;
  // INserisce il record appena impostato nello stack
  StackIconaDocTipo.Add(CurrIconaDocTipo);
  StackIconaDocTipo.Capacity := StackIconaDocTipo.Count;
  // Rende invisibile la label che indica il tipo documento e il button per la scelta del tipo documento
  LabelTipoDocumento.Visible := False;
  SBTipoDocumento.Visible := False;
end;

procedure TmainForm.RipristinaIconaDocTipo;
var
  CurrIconaDocTipo: ItemDocTipoPointer;
begin
  if Self.ImgDocTipo.Picture.Graphic = nil then
    Exit;
  // Prima di tutto controlla se l'IconaDocTipo è bloccata ed se si, esce subito sanza fare nulla
  if FlagBloccoIconaDocTipo > 0 then
    Exit;
  // Carica sul record attuale i dati da riprstinare
  CurrIconaDocTipo := StackIconaDocTipo.Items[StackIconaDocTipo.Count - 1];
  // Ora ripristina il tutto
  if Assigned(CurrIconaDocTipo^.ImgDocTipo) then
  begin
    ImgDocTipo.Picture.Assign(CurrIconaDocTipo^.ImgDocTipo);
    ImgDocTipo.Visible := True;
  end;
  LabelTipoDocumento.Visible := CurrIconaDocTipo^.LabelTipoDocumentoVisible;
  SBTipoDocumento.Visible := CurrIconaDocTipo^.SBTipoDocumentoVisible;
  Caption1.Caption := CurrIconaDocTipo^.Caption1;
  Caption1.Top := CurrIconaDocTipo^.Caption1Top;
  Caption1.Left := CurrIconaDocTipo^.Caption1Left;
  Caption1.Font.Name := CurrIconaDocTipo^.Caption1FontName;
  Caption1.Font.Size := CurrIconaDocTipo^.Caption1FontSize;
  if CurrIconaDocTipo^.Caption1FontStyleBold then
    Caption1.Font.Style := [fsBold]
  else
    Caption1.Font.Style := [];
  Caption2.Caption := CurrIconaDocTipo^.Caption2;
  Caption2.Top := CurrIconaDocTipo^.Caption2Top;
  Caption2.Left := CurrIconaDocTipo^.Caption2Left;
  Caption2.Font.Name := CurrIconaDocTipo^.Caption2FontName;
  Caption2.Font.Size := CurrIconaDocTipo^.Caption2FontSize;
  if CurrIconaDocTipo^.Caption2FontStyleBold then
    Caption2.Font.Style := [fsBold]
  else
    Caption2.Font.Style := [];
  Caption3.Caption := CurrIconaDocTipo^.Caption3;
  Caption3.Top := CurrIconaDocTipo^.Caption3Top;
  Caption3.Left := CurrIconaDocTipo^.Caption3Left;
  Caption3.Font.Name := CurrIconaDocTipo^.Caption3FontName;
  Caption3.Font.Size := CurrIconaDocTipo^.Caption3FontSize;
  if CurrIconaDocTipo^.Caption3FontStyleBold then
    Caption3.Font.Style := [fsBold]
  else
    Caption3.Font.Style := [];
  // Elimina l'elemento dalla TList
  Dispose(CurrIconaDocTipo);
  StackIconaDocTipo.Delete(StackIconaDocTipo.Count - 1);
  StackIconaDocTipo.Capacity := StackIconaDocTipo.Count;
end;

// TODO -oMauri: Questa procedura, una volta terminata la conversione al modello a oggetti delle form, dovrà essere eliminata in quanto sostituita dalla stessa procedura inserita nella capostipite di tutte le form del progetto
procedure TmainForm.CaricaTemaClientForm(F: TForm; TopPanel: TbmpPanel; ESC, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10: TSpeedButton;
  SetOnResizeEventHandler: Boolean = True);
var
  PanelTopStretched: TPanel;
begin
  F.Position := poDesigned;
  // IMposta le dimensioni e il posizionamento della form
  F.Left := CLIENTFORM_POSITION_LEFT_MARGIN_FROM_MAIN_FORM;
  F.Top := CLIENTFORM_POSITION_TOP_MARGIN_FROM_MAIN_FORM;
  F.Width := ClientWidth - CLIENTFORM_POSITION_RIGHT_MARGIN_FROM_MAIN_FORM - F.Left;
  F.Height := ClientHeight - CLIENTFORM_POSITION_BOTTOM_MARGIN_FROM_MAIN_FORM - F.Top;
  F.Color := CLIENTFORM_BG_COLOR;
  // Imposta gli anchors della form
  F.Anchors := [akLeft, akTop, akRight, akBottom];
  // Imposta il gestore dell'evento onResize della Form
  if (not Assigned(F.OnResize)) and SetOnResizeEventHandler then
  begin
    F.OnResize := mainForm.FixedWidthFormResize;
  end;
  // Crea il pannello superiore ridimensionabile contenente lo sfondo dei pulsanti
  // e lo imposta.
  PanelTopStretched := TPanel.Create(F);
  PanelTopStretched.Height := 68;
  PanelTopStretched.Color := mainForm.PanelTopStretched.Color;
  PanelTopStretched.Parent := F;
  PanelTopStretched.BringToFront;
  PanelTopStretched.Name := mainForm.PanelTopStretched.Name;
  PanelTopStretched.Caption := '';
  PanelTopStretched.Align := alTop;
  PanelTopStretched.BevelInner := mainForm.PanelTopStretched.BevelInner;
  PanelTopStretched.BevelOuter := mainForm.PanelTopStretched.BevelOuter;
  PanelTopStretched.OnResize := mainForm.PanelTopStretched.OnResize;
  // Crea il TImage che contiene lo sfondo del pannello superiore sotto ai pulsanti
  with TImage.Create(F) do
  begin
    Parent := PanelTopStretched;
    Stretch := True;
    Align := alClient;
    Picture.Bitmap := mainForm.ImageTopStretched.Picture.Bitmap;
  end;
  // Carica l'immagine di sfondo del pannello dei pulsanti e dimsneiona il tutto
  TopPanel.Bitmap := MainTopPanel.Bitmap;
  TopPanel.Top := MainTopPanel.Top;
  TopPanel.Width := MainTopPanel.Width;
  TopPanel.Height := MainTopPanel.Height;
  TopPanel.Left := MainTopPanel.Left;
  TopPanel.BringToFront;
  // Dimensiona i pulsanti in base a come sono dimensionati nella MainForm
  // ---------------------------------------------------------------------
  ESC.Left := RxSpeedButtonUscita.Left;
  ESC.Top := RxSpeedButtonUscita.Top;
  ESC.Width := RxSpeedButtonUscita.Width;
  ESC.Height := RxSpeedButtonUscita.Height;
  ESC.NumGlyphs := RxSpeedButtonUscita.NumGlyphs;
  ESC.Glyph := RxSpeedButtonUscita.Glyph;
  ESC.Cursor := RxSpeedButtonUscita.Cursor;

  F1.Left := RxSpeedButtonHelp.Left;
  F1.Top := RxSpeedButtonHelp.Top;
  F1.Width := RxSpeedButtonHelp.Width;
  F1.Height := RxSpeedButtonHelp.Height;
  F1.NumGlyphs := RxSpeedButtonHelp.NumGlyphs;
  F1.Glyph := RxSpeedButtonHelp.Glyph;
  F1.Cursor := RxSpeedButtonHelp.Cursor;

  F2.Left := RxSpeedModifica.Left;
  F2.Top := RxSpeedModifica.Top;
  F2.Width := RxSpeedModifica.Width;
  F2.Height := RxSpeedModifica.Height;
  F2.NumGlyphs := RxSpeedModifica.NumGlyphs;
  F2.Glyph := RxSpeedModifica.Glyph;
  F2.Cursor := RxSpeedModifica.Cursor;

  F3.Left := RxSpeedButtonNuovo.Left;
  F3.Top := RxSpeedButtonNuovo.Top;
  F3.Width := RxSpeedButtonNuovo.Width;
  F3.Height := RxSpeedButtonNuovo.Height;
  F3.NumGlyphs := RxSpeedButtonNuovo.NumGlyphs;
  F3.Glyph := RxSpeedButtonNuovo.Glyph;
  F3.Cursor := RxSpeedButtonNuovo.Cursor;

  F4.Left := RxSpeedButtonElimina.Left;
  F4.Top := RxSpeedButtonElimina.Top;
  F4.Width := RxSpeedButtonElimina.Width;
  F4.Height := RxSpeedButtonElimina.Height;
  F4.NumGlyphs := RxSpeedButtonElimina.NumGlyphs;
  F4.Glyph := RxSpeedButtonElimina.Glyph;
  F4.Cursor := RxSpeedButtonElimina.Cursor;

  F5.Left := RxSpeedButtonTrova.Left;
  F5.Top := RxSpeedButtonTrova.Top;
  F5.Width := RxSpeedButtonTrova.Width;
  F5.Height := RxSpeedButtonTrova.Height;
  F5.NumGlyphs := RxSpeedButtonTrova.NumGlyphs;
  F5.Glyph := RxSpeedButtonTrova.Glyph;
  F5.Cursor := RxSpeedButtonTrova.Cursor;

  F6.Left := RxSpeedButtonResetQuery.Left;
  F6.Top := RxSpeedButtonResetQuery.Top;
  F6.Width := RxSpeedButtonResetQuery.Width;
  F6.Height := RxSpeedButtonResetQuery.Height;
  F6.NumGlyphs := RxSpeedButtonResetQuery.NumGlyphs;
  F6.Glyph := RxSpeedButtonResetQuery.Glyph;
  F6.Cursor := RxSpeedButtonResetQuery.Cursor;

  F7.Left := RxSpeedButtonStampa.Left;
  F7.Top := RxSpeedButtonStampa.Top;
  F7.Width := RxSpeedButtonStampa.Width;
  F7.Height := RxSpeedButtonStampa.Height;
  F7.NumGlyphs := RxSpeedButtonStampa.NumGlyphs;
  F7.Glyph := RxSpeedButtonStampa.Glyph;
  F7.Cursor := RxSpeedButtonStampa.Cursor;

  F8.Left := RxSpeedButtonFax.Left;
  F8.Top := RxSpeedButtonFax.Top;
  F8.Width := RxSpeedButtonFax.Width;
  F8.Height := RxSpeedButtonFax.Height;
  F8.NumGlyphs := RxSpeedButtonFax.NumGlyphs;
  F8.Glyph := RxSpeedButtonFax.Glyph;
  F8.Cursor := RxSpeedButtonFax.Cursor;

  F9.Left := RxSpeedButtonMail.Left;
  F9.Top := RxSpeedButtonMail.Top;
  F9.Width := RxSpeedButtonMail.Width;
  F9.Height := RxSpeedButtonMail.Height;
  F9.NumGlyphs := RxSpeedButtonMail.NumGlyphs;
  F9.Glyph := RxSpeedButtonMail.Glyph;
  F9.Cursor := RxSpeedButtonMail.Cursor;

  F10.Left := RxSpeedButtonVisualizza.Left;
  F10.Top := RxSpeedButtonVisualizza.Top;
  F10.Width := RxSpeedButtonVisualizza.Width;
  F10.Height := RxSpeedButtonVisualizza.Height;
  F10.NumGlyphs := RxSpeedButtonVisualizza.NumGlyphs;
  F10.Glyph := RxSpeedButtonVisualizza.Glyph;
  F10.Cursor := RxSpeedButtonVisualizza.Cursor;
  // ---------------------------------------------------------------------

  F.Update;
end;

// Gestore di evento onResize per tutte le form a larghezza fissa
procedure TmainForm.FixedWidthFormResize(Sender: TObject);
var
  ClientArea: TWinControl;
  F: TForm;
begin
  // RIcava la ClientArea e la Form
  F := Sender as TForm;
  ClientArea := (F.FindComponent('ClientArea') as TWinControl);
  // Se la client area non è stata trovata esce subito senza fare nulla
  if ClientArea = nil then
    Exit;
  // IMposta la posizione della client area e i relativi margini
  mainForm.CalcolaDimensioniClientAreaChildForm(F, ClientArea, True);
end;

procedure TmainForm.CaricaLayout;
begin
  // Calcola le dimensioni e i posizionamento dei pannelli principali
  // (Li calcolo manualmente perchè altrimenti con gli allineamenti
  // automatici, mi dava alcuni problemi)
  {
    MainBottomPanel.Left         := 0;
    MainBottomPanel.Top          := ClientHeight - MainBottomPanel.Height;
    MainBottomPanel.Width        := ClientWidth;
    MainLeftPanel.Left           := 0;
    MainLeftPanel.Top            := 0;
    MainLeftPanel.Height         := ClientHeight - MainBottomPanel.Height;
    MainRightPanel.Left          := ClientWidth - MainRightPanel.Width;
    MainRightPanel.Top           := 0;
    MainRightPanel.Height        := MainLeftPanel.Height;
    MainTopPanel.Left            := MainLeftPanel.Width;
    MainTopPanel.Top             := 0;
    MainTopPanel.Width           := ClientWidth - MainLeftPanel.Width - MainRightPanel.Width;
  }

  // Caricamento delle bitmap del pannello superiore
  PanelTopStretched.Align := alClient;
  MainTopPanel.Bitmap.LoadFromFile(MainFormTemaDir + 'top_panel.bmp');
  ImageTopStretched.Picture.LoadFromFile(MainFormTemaDir + 'top_panel_stretched.bmp');

  // Caricamento delle bitmap del pannello di sinistra
  ImageLeftPanelParteFissaSuperiore.Picture.LoadFromFile(MainFormTemaDir + 'sx_panel_top_fixed.bmp');
  ImageLeftPanelParteFissaSuperiore.Align := alTop;
  ImageLeftPanelParteSfumata.Picture.LoadFromFile(MainFormTemaDir + 'sx_panel_bottom_stretched.bmp');
  ImageLeftPanelParteSfumata.Align := alClient;
  ImgDocTipo.Top := 0;
  ImgDocTipo.Left := 0;

  // Caricamento delle bitmap del pannello di destra
  ImageRightPanelTopFixed.Picture.LoadFromFile(MainFormTemaDir + 'dx_panel_top_fixed.bmp');
  ImageRightPanelBottomFixed.Picture.LoadFromFile(MainFormTemaDir + 'dx_panel_bottom_fixed.bmp');
  ImageRightPanelStretched.Picture.LoadFromFile(MainFormTemaDir + 'dx_panel_stretched.bmp');

  // Caricamento delle bitmap del pannesso inferiore
  ImageBottomPanelLeftFixed.Picture.LoadFromFile(MainFormTemaDir + 'bottom_panel_left_fixed.bmp');
  ImageBottomPanelRightFixed.Picture.LoadFromFile(MainFormTemaDir + 'bottom_panel_right_fixed.bmp');
  ImageBottomPanelStretched.Picture.LoadFromFile(MainFormTemaDir + 'bottom_panel_stretched.bmp');

  // Carica le Bitmap relative alla menù principale
  LoadMainMenuImages;
  // Carica le bitmap dei pulsanti superiori
  RxSpeedButtonUscita.Glyph.LoadFromFile(MainFormTemaDir + 'btn_ESC.bmp');
  RxSpeedButtonHelp.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F1.bmp');
  RxSpeedModifica.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F2.bmp');
  RxSpeedButtonNuovo.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F3.bmp');
  RxSpeedButtonElimina.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F4.bmp');
  RxSpeedButtonTrova.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F5.bmp');
  RxSpeedButtonResetQuery.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F6.bmp');
  RxSpeedButtonStampa.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F7.bmp');
  RxSpeedButtonFax.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F8.bmp');
  RxSpeedButtonMail.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F9.bmp');
  RxSpeedButtonVisualizza.Glyph.LoadFromFile(MainFormTemaDir + 'btn_F10.bmp');
  // Carica le bitmap dei pulsanti del MainMenù
  SBUtilita.Glyph.LoadFromFile(MainFormTemaDir + 'btn_mm_utilita.bmp');
  SBImpostazioni.Glyph.LoadFromFile(MainFormTemaDir + 'btn_mm_impostazioni.bmp');
  // Carica le Bitmap dei pulsanti di Massimizzazione e di Chiusura dei pannelli del
  // soggetto e pratica selezionata.
  SSChiudi.Glyph.LoadFromFile(MainFormTemaDir + 'sb_close.bmp');
  PSChiudi.Glyph.LoadFromFile(MainFormTemaDir + 'sb_close.bmp');
  // Carica la Bitmap del pulsante di selezione del tipo documento principale
  // che viene utilizzato dei documenti fiscali per selezionarne il tipo
  SBTipoDocumento.Glyph.LoadFromFile(MainFormTemaDir + 'sb_doc_tipo.bmp');
  // Carica la Bitmap dell'attesa in alto a DX
  Attendere.Picture.LoadFromFile(MainFormTemaDir + 'attendere.bmp');
  // Forza l'aggiornamento dello schermo
  Update;
  Application.ProcessMessages;
end;

Procedure TmainForm.AggiornaDocumentiEsportati;
var
  QueryExpDoc: TIB_Cursor;
  ListItem: TListItem;
begin
  // Crea il componente TIBOQuery lo imposta ed esegue la query risultante
  QueryExpDoc := TIB_Cursor.Create(Self);
  try
    QueryExpDoc.DatabaseName := DM1.GenDBFile;
    QueryExpDoc.IB_Connection := DM1.DBGenerale;

    // --------------------------------------------------------------------------
    // Reperimento RIGHI DOCUMENTI
    QueryExpDoc.SQL.Add
      ('SELECT DISTINCT TipoDocumento, Registro, NumOrdPrev, DataDocumento, CodiceCliente, CAST(NULL AS VARCHAR(25)) AS CodiceArticolo, CAST(NULL AS VARCHAR(25)) AS CodiceArticoloStm,');
    QueryExpDoc.SQL.Add
      (' CAST(NULL AS VARCHAR(5000)) AS Descrizione, CAST(NULL AS DECIMAL(15,4)) AS QTA, RAGSOCCLI, CAST(NULL AS INTEGER) AS ProgRigo, EXTRA_RIFERIMENTO, ID');
    QueryExpDoc.SQL.Add('FROM TmpRighi');
    QueryExpDoc.SQL.Add('WHERE STATION_ID = ' + DM1.CodiceUtente +
      ' AND TIPODOCUMENTO <> ''ARTICOLO'' AND TIPODOCUMENTO <> ''Allegato''');
    // --------------------------------------------------------------------------

    QueryExpDoc.SQL.Add('UNION ALL');

    // --------------------------------------------------------------------------
    // Reperimento ALLEGATI
    QueryExpDoc.SQL.Add
      ('SELECT DISTINCT TipoDocumento, Registro, NumOrdPrev, DataDocumento, CodiceCliente, CAST(NULL AS VARCHAR(25)) AS CodiceArticolo, CAST(NULL AS VARCHAR(25)) AS CodiceArticoloStm,');
    QueryExpDoc.SQL.Add(' CAST(NULL AS VARCHAR(5000)) AS Descrizione, CAST(NULL AS DECIMAL(15,4)) AS QTA, RAGSOCCLI, ProgRigo, EXTRA_RIFERIMENTO, ID');
    QueryExpDoc.SQL.Add('FROM TmpRighi');
    QueryExpDoc.SQL.Add('WHERE STATION_ID = ' + DM1.CodiceUtente + ' AND TIPODOCUMENTO = ''Allegato''');
    // --------------------------------------------------------------------------

    QueryExpDoc.SQL.Add('UNION ALL');

    // --------------------------------------------------------------------------
    // Reperimento ARTICOLI
    QueryExpDoc.SQL.Add
      ('SELECT TIPODOCUMENTO, CAST(NULL AS VARCHAR(5)) AS REGISTRO, CAST(NULL AS INTEGER) AS NUMORDPREV, CAST(NULL AS TIMESTAMP) AS DATADOCUMENTO, CAST(NULL AS INTEGER) AS CODICECLIENTE, CODICEARTICOLO, CODICEARTICOLOSTM, DESCRIZIONE,');
    QueryExpDoc.SQL.Add('  QTA, RAGSOCCLI, CAST(NULL AS INTEGER) AS ProgRigo, EXTRA_RIFERIMENTO, ID');
    QueryExpDoc.SQL.Add('FROM TmpRighi');
    QueryExpDoc.SQL.Add('WHERE STATION_ID = ' + DM1.CodiceUtente + ' AND TIPODOCUMENTO = ''ARTICOLO''');
    // --------------------------------------------------------------------------

    QueryExpDoc.Open;
    // Cicla per tutta la query e carica le item nella ListView
    QueryExpDoc.First;
    ListViewExpDoc.Items.Clear;
    while not QueryExpDoc.EOF do
    begin
      // Se è un articolo
      if (QueryExpDoc.FieldByName('TIPODOCUMENTO').AsString = 'ARTICOLO') then
      begin
        ListItem := ListViewExpDoc.Items.Add;
        ListItem.ImageIndex := 1;
        ListItem.Caption := QueryExpDoc.FieldByName('DESCRIZIONE').AsString + ' ' + '{' + QueryExpDoc.FieldByName('CODICEARTICOLO').AsString + '}' + '{' +
          QueryExpDoc.FieldByName('CODICEARTICOLOSTM').AsString + '}';
        ListItem.Caption := ListItem.Caption + '[' + QueryExpDoc.FieldByName('QTA').AsString + ']';
        // Se è un articolo esportato dal cantiere (non varie)
      end
      else if (QueryExpDoc.FieldByName('TIPODOCUMENTO').AsString = 'CANTIERE') or (QueryExpDoc.FieldByName('TIPODOCUMENTO').AsString = 'CANT.VARIE') then
      begin
        ListItem := ListViewExpDoc.Items.Add;
        ListItem.ImageIndex := 3;
        ListItem.Caption := QueryExpDoc.FieldByName('TipoDocumento').AsString + ' ' + IntToStr(QueryExpDoc.FieldByName('NumOrdPrev').AsInteger) + ' ' +
          QueryExpDoc.FieldByName('Registro').AsString + ' ' + DateToStr(QueryExpDoc.FieldByName('DataDocumento').AsDateTime);
        // Se è una chiamata
      end
      else if QueryExpDoc.FieldByName('TIPODOCUMENTO').AsString = 'Palmare' then
      begin
        ListItem := ListViewExpDoc.Items.Add;
        ListItem.ImageIndex := 4;
        ListItem.Caption := QueryExpDoc.FieldByName('TipoDocumento').AsString + ' ' + IntToStr(QueryExpDoc.FieldByName('NumOrdPrev').AsInteger) + ' ' +
          QueryExpDoc.FieldByName('Registro').AsString + ' ' + DateToStr(QueryExpDoc.FieldByName('DataDocumento').AsDateTime) + ' ' +
          LeftStr(Trim(QueryExpDoc.FieldByName('EXTRA_RIFERIMENTO').AsString), 10);
        // Se è un allegato
      end
      else if QueryExpDoc.FieldByName('TIPODOCUMENTO').AsString = 'Allegato' then
      begin
        ListItem := ListViewExpDoc.Items.Add;
        ListItem.ImageIndex := 5;
        ListItem.Caption := QueryExpDoc.FieldByName('TipoDocumento').AsString + ' ' + QueryExpDoc.FieldByName('Registro').AsString + '.' +
          IntToStr(QueryExpDoc.FieldByName('NumOrdPrev').AsInteger) + '.' + IntToStr(QueryExpDoc.FieldByName('ProgRigo').AsInteger);
        // Se invece è un rigo documento
      end
      else
      begin
        ListItem := ListViewExpDoc.Items.Add;
        ListItem.ImageIndex := 0;
        ListItem.Caption := QueryExpDoc.FieldByName('TipoDocumento').AsString + ' ' + IntToStr(QueryExpDoc.FieldByName('NumOrdPrev').AsInteger) + ' ' +
          QueryExpDoc.FieldByName('Registro').AsString + ' ' + DateToStr(QueryExpDoc.FieldByName('DataDocumento').AsDateTime) + ' ' +
          LeftStr(Trim(QueryExpDoc.FieldByName('RAGSOCCLI').AsString), 10);
        ListItem.GroupID := QueryExpDoc.FieldByName('ID').AsInteger; // LDE: ID documento
      end;
      // Và al prossimo record
      QueryExpDoc.Next;
    end;
  finally
    // Distrugge la query e libera le risorse
    QueryExpDoc.Free;
  end;
end;

procedure TmainForm.ApriCalendario;
begin
  // Gli assegna lo scheduler in base alla modalità
  if not Assigned(AgendaDateNavigator.Scheduler) then
  begin
    AgendaDateNavigator.Scheduler := ClientiForm.Agenda;
    AgendaDateNavigator.SelectedDays.Clear;
  end;
  // Calcola il posizionamento e lo visualizza
  CalcolaPosizioneVerticaleCalendario;
  PanelDateNavigator.Left := Trunc((MainLeftPanel.Width - PanelDateNavigator.Width) / 2) + 3;
  PanelDateNavigator.Visible := True;
  PanelDateNavigator.Update;
end;

procedure TmainForm.ChiudiCalendario;
begin
  PanelDateNavigator.Visible := False;
  MainLeftPanel.Update;
end;

procedure TmainForm.CalcolaPosizioneVerticaleCalendario;
begin
  PanelDateNavigator.Top := SBUtilita.Top - PanelDateNavigator.Height - 15;
end;

procedure TmainForm.ControllaAbilitazioneImportazionePalmare;
var
  LO: TMemIniFile;
begin
  LO := TMemIniFile.Create(DM1.CurrDir + 'ExtTerminal.ini');
  try
    SBImportPalmare.Visible := LO.ReadBool('ZEBEX_2031', 'ButtonVisible', False);
    SBImportPalmare.Enabled := LO.ReadBool('ZEBEX_2031', 'ButtonEnabled', False) and (not mainForm.IsLevanteLight);
  finally
    LO.Free;
  end;
end;

procedure TmainForm.FormShow(Sender: TObject);
begin
  // NB: La proprietà WindowsState della MainForm DEVE essere impostata
  // a wsMinimized nell'ObjectInspector e poi qua la metto a
  // wsMaximized, cos' risolvo il problema che quando la proporzione
  // dei caratteri era > del 100% l'aplicazione non si apriva
  // veramente a tutto schermo (al 100% invece andava bene)
  WindowState := wsMaximized;
  // Per evitare problemid i visualizzazione nelle TListView
  InhibitLVInfoTips(ListViewExpDoc);
  // Carica il Tema per l'Hint e imposta le dimensioni orizzontali
  HintForm.CaricaTema;
  HintForm.CalcolaDimensioniOrizzontali;

  // Esegue le operazioni di apertura solo alla partenza
  if not DM1.DBGenerale.Connected then
  begin
    // Se al lancio del programma è stato specificato il parametro 'R' oppure 'r' che stà per Ristruttura
    // oppure è la prima volta che l'eseguibile viene eseguito dopo un aggiornamento...
    // NB: Controlla anche se esiste la tabella con l'elenco delle aziende e se non esiste significa che si è
    // al primo avvio dopo l'installazione (altrimenti si è al primo avvio dopo un aggiornamento) e quindi
    // ancora senza archivi creati. Quindi avvia il programma in modalità normale per creare le tabelle
    // e non  in modalità di ristrutturazione (altrimenti dà degli errori).
    // NB: Entra in modo ristrutturazione solo se la stazione è il server.
    if DM1.ModoRistrutturazioneArchivi then
    begin
      DM1.AttivaTabelle(True, False);
      // Se è stato specificato il parametro R e non si è al primo avvio dopo un aggiornamento
      // visualizza la form delle aziende per fare o meno la ristrutturazione manuale.
      if CLI_Param_Ristrutturazione then
      begin
        // Visualizza la schermata di avvio
        VisualizzaAvvio(True);
        // Visualizza la form delle aziende
        Application.CreateForm(TAziendeForm, AziendeForm);
        AziendeForm.Parent := mainForm;
        AziendeForm.Mode := AZIENDE_RISTRUTTURA;
        AziendeForm.Show;
        Exit;
      end;
      // Visualizza un messaggio per avvisare l'utente di quello che succederà
      if (DM1.Messaggi('Levante - Aggiornamento',
        'A T T E N Z I O N E !!!'#13#13'E'' la prima volta che si avvia Lev@nte dopo un aggiornamento.'#13#13'E'' necessaria una ristrutturazione degli archivi, il programma eseguirà questa operazione automaticamente.'#13#13#13'Continuare?',
        'NB: L''operazione potrebbe durare alcune decine di minuti.', [mbYes, mbNo], 0, nil) = mrYes) and
        (DM1.Messaggi('Levante - Aggiornamento',
        'Lev@nte è pronto per avviare la procedura di ristrutturazione automatica degli archivi.'#13#13#13'Confermi di voler continuare?',
        'NB: Assicurarsi di aver effettuato una copia di sicurezza degli archivi prima di continuare', [mbYes, mbNo], 0, nil) = mrYes) then
      begin
        // Visualizza la schermata di avvio
        VisualizzaAvvio(True);
        // Non fà nulla procede semplicemente al richiamo della form delle aziende
        Application.CreateForm(TAziendeForm, AziendeForm);
        AziendeForm.Parent := mainForm;
        AziendeForm.Mode := AZIENDE_AGGIORNATO;
        AziendeForm.Show;
      end
      else
      begin
        DM1.Messaggi('Levante - Aggiornamento', 'Aggiornamento annullato dall''operatore'#13#13'Levante si chiuderà automaticamente.',
          'NB: L''aggiornamento verrà riproposto al prossimo avvio.', [mbOk], 0, nil);
        Application.Terminate;
      end;
    end
    else
    // Se invece è un avvio normale...
    begin
      DM1.InitCopyProtection(False);
      DM1.ReadSmartKey;
      VisualizzaAvvio(True);
    end;
  end;
end;

procedure TmainForm.CaricaElencoAziende;
var
  Qry: TIB_Cursor;
begin
  // Questa funzione carica nella ComboBox di selezione dell'azienda da aprire
  // l'elenco di tutte le aziende presenti nel sistema.
  // -------------------------------------------------------------------------
  StartFrame.CBAzienda.Items.Clear;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('SELECT AZIENDA FROM AZIENDE');
    Qry.Open;
    while not Qry.EOF do
    begin
      StartFrame.CBAzienda.Items.Add(Qry.FieldByName('AZIENDA').AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TmainForm.LevanteLight_CaricaDatiUtente;
var
  Qry: TIB_Cursor;
begin
  // Prima di tutto azzera le informazioni
  StartFrame.EditRagSoc.Text := '';
  StartFrame.EditPIVA.Text := '';
  StartFrame.EditNomeUtente.Text := '';
  StartFrame.EditPswd.Text := '';
  StartFrame.EditPID.Text := '';
  StartFrame.EditCodiceAttivazione.Text := '';
  // Questa funzione carica nella ComboBox di selezione dell'azienda da aprire
  // l'elenco di tutte le aziende presenti nel sistema.
  // -------------------------------------------------------------------------
  StartFrame.CBAzienda.Items.Clear;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('SELECT FIRST 1 * FROM LL_USER');
    Qry.Open;
    if not Qry.EOF then
    begin
      StartFrame.EditRagSoc.Text := Trim(Qry.FieldByName('RAGIONESOCIALE').AsString);
      StartFrame.EditPIVA.Text := Trim(Qry.FieldByName('P_IVA').AsString);
      StartFrame.EditNomeUtente.Text := Trim(Qry.FieldByName('USER_UID').AsString);
      StartFrame.EditPswd.Text := Trim(Qry.FieldByName('USER_PSWD').AsString);
      StartFrame.EditPID.Text := Trim(Qry.FieldByName('CA_PID').AsString);
      StartFrame.EditCodiceAttivazione.Text := Trim(Qry.FieldByName('CA_CODICEATTIVAZIONE').AsString);
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// Funziona che ritorna True se il nome utente e la password sono esatti
function TmainForm.LevanteSacs_UIDCheck(NomeUt, PswdUt: string): Boolean;
begin
  Result := (NomeUt = StartFrame.EditNomeUtente.Text) and (PswdUt = StartFrame.EditPswd.Text);
  // Se l'utente non è autorizzato lo avverte
  if not Result then
  begin
    MessageBeep(0);
    MessageDlg('U T E N T E   N O N   R I C O N O S C I U T O   !!!', mtWarning, [mbOk], 0);
  end;
end;

// Procedura che salva i dati dell'utente Levante Light
procedure TmainForm.LevanteLight_SalvaDatiUtente;
var
  Qry: TIB_Cursor;
begin
  // Inizializzazione
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    // Avvio della transazione
    DM1.DBGenerale.StartTransaction;
    try
      // Imposta la query che elimina i dati dell'utente per poi salvare quell nuovi
      Qry.SQL.Add('DELETE FROM LL_USER');
      Qry.ExecSQL;
      // Imposta la query cha salva i di dati di accesso a Levante Light
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO LL_USER (RAGIONESOCIALE, USER_UID, USER_PSWD, P_IVA, CA_PID, CA_CODICEATTIVAZIONE)');
      Qry.SQL.Add('VALUES(');
      Qry.SQL.Add(QuotedStr(Trim(StartFrame.EditRagSoc.Text)) + ',');
      Qry.SQL.Add(QuotedStr(Trim(StartFrame.EditNomeUtente.Text)) + ',');
      Qry.SQL.Add(QuotedStr(Trim(StartFrame.EditPswd.Text)) + ',');
      Qry.SQL.Add(QuotedStr(Trim(StartFrame.EditPIVA.Text)) + ',');
      Qry.SQL.Add(QuotedStr(Trim(StartFrame.EditPID.Text)) + ',');
      Qry.SQL.Add(QuotedStr(Trim(StartFrame.EditCodiceAttivazione.Text)) + '');
      Qry.SQL.Add(')');
      Qry.ExecSQL;
      // Se tutto è andato bene esegue il commit
      DM1.DBGenerale.Commit;
    except
      DM1.DBGenerale.Rollback;
      raise;
    end;
  finally
    Qry.Free;
  end;
end;

// Funzione che ritorna True se i dati utente per l'accesso a Levante Light sono corretti
function TmainForm.LevanteLight_DatiUtenteCorretti: Boolean;
begin
  Result := False;
  // Verifica i dati
  if (Trim(StartFrame.EditRagSoc.Text) <> '') and (Trim(StartFrame.EditPIVA.Text) <> '') and (Trim(StartFrame.EditNomeUtente.Text) <> '') and
    (Trim(StartFrame.EditPswd.Text) <> '') and (Trim(StartFrame.EditPID.Text) <> '') and (Trim(StartFrame.EditCodiceAttivazione.Text) <> '') and DM1.VerificaCodiceAttivazioneTeletrasporto
  then
    Result := True;
end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  // Imposta alcune proprietà del mouse
  Mouse.DragImmediate := False;
  Mouse.DragThreshold := 10;
  // Si registra come form interessata a ricevere i WindowsMessages relativi
  // alla gestione del drag and drop di files dall'esterno del programma.
  DragAcceptFiles(Self.Handle, True);
  // Inizializza oa form completamente trasparente e quindi invisibile
  FormInitFullTrasparent(Self);
  // Ricava la directory contenente il tema
  MainFormTemaDir := ExtractFileDir(Application.ExeName) + '\tema\';
  // Fa sparire dalla vista il pulsante agiunto per l'avvio con il sensore biometrico
  AvviaLevanteBiometrico.Top := 1;
  AvviaLevanteBiometrico.Left := 1;
  AvviaLevanteBiometrico.Width := 2;
  AvviaLevanteBiometrico.Height := 2;
  // Assegna il gestore dell'evento OnException dell'applicazione per una gestione centralizzata
  // degli errori.
  Application.OnException := LevanteException;
  // Inizializza il flag di blocco dell'aggiornamento dell'IconaDocTipo
  FlagBloccoIconaDocTipo := 0;
  // Inizializza il flag che indica se ci troviamo in modalità LevanteLight
  IsLevanteLight := LEVANTE_LIGHT_MODE;

  // Imposta la Variabile ModoSetup in base al parametro ricevuto
  // all'avvio del programma.
  // ModoSetup := True;
  ModoSetup := False;
  if (ParamStr(1) = 'S') or (ParamStr(1) = 's') then
    ModoSetup := True;

  // Questo flag indica la modalità Assistenze Mobile (gestione manutenzioni via RDP da remoto)
  // ModoAssistenzeRDP := True;
  ModoAssistenzeRDP := False;
  if (ParamStr(1) = 'A') or (ParamStr(1) = 'a') then
    ModoAssistenzeRDP := True;

  // Imposta il flag che indica se siamo in esecuzione in modalità dimostrativa
  // ModoDemo := True;
  ModoDemo := False;
  if (ParamStr(1) = 'D') or (ParamStr(1) = 'd') then
    ModoDemo := True;

  // IMposta il flag che indica se il programma è in esecuzione in modalità
  // MagKioskMode oppure no
  // MagKioskMode := True;
  MagKioskMode := False;
  if (ParamStr(1) = 'M') or (ParamStr(1) = 'm') then
    MagKioskMode := True;

  // IMposta il flag che evita il caricamento delle banche dagli archivi di base
  NoBancheArcBase := False;
  if (Uppercase(ParamStr(2)) = 'NOBANCHE') then
    NoBancheArcBase := True;

  // Carica il layout per la MainForm
  CaricaLayout;
  // IMposta quanti millisecondi devono rimanere visibili gli Hints
  // perchè l'impostazione di default è troppo breve
  Application.HintHidePause := 10000;

  // IMposta il nome del'applicazion e la versione per l'identificazione e le caption delle form
  // ===========================================================================================
  NomeApplicazione := '';
  NomeApplicazione := NomeApplicazione + 'L';
  NomeApplicazione := NomeApplicazione + 'e';
  NomeApplicazione := NomeApplicazione + 'v';
  NomeApplicazione := NomeApplicazione + '@';
  NomeApplicazione := NomeApplicazione + 'n';
  NomeApplicazione := NomeApplicazione + 't';
  NomeApplicazione := NomeApplicazione + 'e';
  VersioneApplicazione := '4.11.170 R1';
  // ===========================================================================================
  // Impostazione della versione attuale del programma  (esempio 4.11.056 R1 = 4110561)
  PrgVersion := 4111701;
  PrgVersionNoBuild := PrgVersion div 10000; // Versione del programma senza il numero di build
  // ===========================================================================================

  // ==========================================================================
  // Imposta la caption dell'applicazione
  // --------------------------------------------------------------------------
  Caption := mainForm.NomeApplicazione + ' ' + VersioneApplicazione;
  // Se siamo in modalità EXPRESS_MAG modifica la caption dell'applicazione
  if MagKioskMode then
    Caption := Caption + ' - EXPRESS';
  // Se siamo in ristrutturaazione
  if CLI_Param_Ristrutturazione then
    Caption := Caption + ' - RISTRUTTURAZIONE';
  // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
  // NB: IMposta anche altre variabili globali per la versione ecc.
  if D_MODE then
    Caption := Caption + ' - (Versione Demo)';
  // Se siamo in modalità Levante Light
  if IsLevanteLight then
    Caption := 'Mini-' + Caption + '   -   (Versione ridotta: per info 0541/694750)';
  // Se siamo in modalità LEVARCO
  if LEVARCO_MODE then
    Caption := Caption + ' - (KL)';
  // ==========================================================================

  // Effettua la registrazione dei messaggi necessari al funzionamento del sistema di
  // backup, e memorizza nelle apposite variabili globali i codici identificativi
  // dei messaggi stessi.
  // Registra gli identificativi dei WindowsMessages relativi al Backup (SACS)
  RegistraMessaggi;
  SACS.RegistraMessaggi;
end;

procedure TmainForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  N: String;
begin
  N := Controls[ControlCount - 1].Name;

  // Se viene premuto CTRL+ALT+H richiama form di impostazione del messaggio
  // Hint relativo al componente sul quale si trova il cursore
  if (Key = 72) and (ssCtrl in Shift) and (ssAlt in Shift) then
  begin
    Application.CreateForm(THintsForm, HintsForm);
    HintsForm.Parent := mainForm;
    HintsForm.LocalComponentOwner := FindDragTarget(Mouse.CursorPos, True).Owner.Name;
    HintsForm.LocalComponentName := FindDragTarget(Mouse.CursorPos, True).Name;
    HintsForm.Show;
  end;

  // Smista la chiamata alla form appropriata
  if N = 'AnagArtForm' then
    AnagArtForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ClientiForm' then
    ClientiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'AnagCliForm' then
    AnagCliForm.FormKeyUp(Self, Key, Shift)
    // else if N = 'AziendeForm'                 then AziendeForm.FormKeyUp(Self, Key, Shift)
  else if N = 'BancheForm' then
    BancheForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ContattiForm' then
    ContattiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ExtFileForm' then
    ExtFileForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ExtPrgForm' then
    ExtPrgForm.FormKeyUp(Self, Key, Shift)
    // else if N = 'NetDirForm'                  then NetDirForm.FormKeyUp(Self, Key, Shift)
  else if N = 'PagamentiForm' then
    PagamentiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ScadenzeForm' then
    ScadenzeForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ArticoliForm' then
    ArticoliForm.FormKeyUp(Self, Key, Shift)
  else if N = 'DatiAziendaForm' then
    DatiAziendaForm.FormKeyUp(Self, Key, Shift)
  else if N = 'IntestazioneDocumentiForm' then
    IntestazioneDocumentiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'PreventiviOrdiniForm' then
    PreventiviOrdiniForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ProgressiviForm' then
    ProgressiviForm.FormKeyUp(Self, Key, Shift)
  else if N = 'TestiForm' then
    TestiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ConformitaForm' then
    ConformitaForm.FormKeyUp(Self, Key, Shift)
  else if N = 'SelezionaPraticheImpiantiForm' then
    SelezionaPraticheImpiantiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'SelezioneClienteForm' then
    SelezioneClienteForm.FormKeyUp(Self, Key, Shift)
  else if N = 'StatiOggettiForm' then
    StatiOggettiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'AliquoteIVAForm' then
    AliquoteIVAForm.FormKeyUp(Self, Key, Shift)
  else if N = 'Categoria1Form' then
    Categoria1Form.FormKeyUp(Self, Key, Shift)
    // else if N = 'TracciatiForm'               then TracciatiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'PrimanotaForm' then
    PrimanotaForm.FormKeyUp(Self, Key, Shift)
    // else if N = 'SecurityForm'                then SecurityForm.FormKeyUp(Self, Key, Shift)
  else if N = 'SubSoggForm' then
    SubSoggForm.FormKeyUp(Self, Key, Shift)
  else if N = 'CausaliForm' then
    CausaliForm.FormKeyUp(Self, Key, Shift)
  else if N = 'AnagMagaForm' then
    AnagMagaForm.FormKeyUp(Self, Key, Shift)
  else if N = 'GruppiForm' then
    GruppiForm.FormKeyUp(Self, Key, Shift)
  else if N = 'FattDifferitaForm' then
    FattDifferitaForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ArchivioBancheForm' then
    ArchivioBancheForm.FormKeyUp(Self, Key, Shift)
  else if N = 'PagamRiscForm' then
    PagamRiscForm.FormKeyUp(Self, Key, Shift)
  else if N = 'MultiregistroForm' then
    MultiregistroForm.FormKeyUp(Self, Key, Shift)
  else if N = 'ImpegnoForm' then
    ImpegnoForm.FormKeyUp(Self, Key, Shift)
  else if N = 'SelezioneStradarioForm' then
    SelezioneStradarioForm.FormKeyUp(Self, Key, Shift);
end;

procedure TmainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Chiede prima conferma
  Action := caNone;
  if mainForm.ModoAssistenzeRDP or (DM1.Messaggi('Chiusura Levante', 'Vuoi veramente chiudere Levante?', '', [mbYes, mbNo], 0, nil) = mrYes) then
    ChiudiLevante;
end;

procedure TmainForm.ChiudiLevante;
begin
  // Prima di uscire dal programma Ferma il fax
  DM1.ShowWait('CHIUSURA LEVANTE', 'Attendere chiusura di Levante in corso...');
  try
    mainForm.FormFadeOut(mainForm);
    // Chiusura dei databases
    DM1.ShowWait('', 'Stop database generale');
    DM1.DBGenerale.Disconnect;
    while DM1.DBGenerale.Connected do
      Application.ProcessMessages; // Attende l'effettiva disconnessione dal database
    DM1.ShowWait('', 'Stop database dell''azienda');
    DM1.DBAzienda.Disconnect;
    while DM1.DBAzienda.Connected do
      Application.ProcessMessages; // Attende l'effettiva disconnessione dal database
    // Chiude il messaggio sullo schermo
  finally
    DM1.CloseWait;
  end;
  // Esce
  // NB: In base alla costante che indica se deve visualizare o meno la splash form all'uscita
  // del programma esce in due possibili modi diversi.
  if SPLASH_FORM_ON_EXIT_ENABLED then
  begin
    // Visualizza la splashform
    SplashForm := TSplashForm.Create(Application);
    SplashForm.Show;
    SplashForm.Update;
    // Attiva il timer che avvierà la procedura per uscire dal programma
    TimerStartStop.Interval := 500;
    TimerStartStop.Tag := 9;
    TimerStartStop.Enabled := True;
  end
  else
  begin
    Application.Terminate;
  end;
end;

procedure TmainForm.ListViewExpDocDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  // Cerca di riconoscere il mittente per accettare o meno l'operazione
  // ------------------------------------------------------------------
  // Se il mittente proviene da una TcxGrid o TcxView...
  // Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
  // che le griglie DevExpress passano surante il DragAndDrop.
  if Source is TcxDragControlObject then
  begin
    // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
    if TcxDragControlObject(Source).Control is TcxGridSite then
    begin
      // La vista diventa il controllo predefinito per comodità
      with TcxGridSite(TcxDragControlObject(Source).Control).GridView do
      begin
        // Controlla se la vista è tra quelle da riconoscere
        if (Name = 'tvDoc') or (Name = 'tvArt') or (PatternGridView.Name = 'tvLF') or (Name = 'tvCorpo') or (PatternGridView.Name = 'tvDiBa') or
          (Name = 'tvImpegni') or (Name = 'btvGC') or (Name = 'btvGCRighi') or (Name = 'cvAllegati') then
          Accept := True;
      end;
    end;
  end;
end;

procedure TmainForm.ListViewExpDocKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Se è stato premuto il tasto 'Canc' elimina i documenti esportati selezionati
  if Key = 46 then
  begin
    while ListViewExpDoc.SelCount > 0 do
    begin
      // Se si tratta di righi di documento ma non di una cofnormità (è così perchè anche la cofnormità usa ImageIndex = 0)
      if (ListViewExpDoc.Selected.ImageIndex = 0) and ((DM1.ExpDocToDocType(mainForm.ListViewExpDoc.Selected.Caption) <> 'Conformita')) then
      begin
        DM1.EliminaExpDoc(DM1.ExpDocToDocType(ListViewExpDoc.Selected.Caption), DM1.ExpDocToDocReg(ListViewExpDoc.Selected.Caption),
          DM1.ExpDocToDocNum(ListViewExpDoc.Selected.Caption), DM1.ExpDocToDocDate(ListViewExpDoc.Selected.Caption));
        // Se si tratta di una cofnormità (è così perchè anche la cofnormità usa ImageIndex = 0)
      end
      else if (ListViewExpDoc.Selected.ImageIndex = 0) and ((DM1.ExpDocToDocType(mainForm.ListViewExpDoc.Selected.Caption) = 'Conformita')) then
      begin
        DM1.EliminaExpConformita(DM1.ExpDocToDocNum(ListViewExpDoc.Selected.Caption), DM1.ExpDocToDocDate(ListViewExpDoc.Selected.Caption));
        // Se invece si tratta di articoli esportati
      end
      else if ListViewExpDoc.Selected.ImageIndex = 1 then
      begin
        DM1.EliminaExpArt(DM1.ExpArtToCodice(ListViewExpDoc.Selected.Caption), DM1.ExpArtToCodiceStm(ListViewExpDoc.Selected.Caption));
        // Se invece si tratta di impegni esportati
      end
      else if ListViewExpDoc.Selected.ImageIndex = 2 then
      begin
        DM1.EliminaExpImpegno(DM1.ExpImpegnoToID(ListViewExpDoc.Selected.Caption));
      end;
      // Elimina la voce
      ListViewExpDoc.Selected.Delete;
    end;
    AggiornaDocumentiEsportati;
  end;
end;

procedure TmainForm.ListViewExpDocMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Se si è cliccato con pulsante sx del mouse inizia il DragDrop
  // mettendo il flag BachecaInsert := False per indicare che il
  // destinatario deve fare l'append di quanto riceve
  if (Button = mbLeft) then
  begin
    BachecaInsert := False;
    ListViewExpDoc.BeginDrag(False);
    // Se invece si è cliccato con pulsante dx del mouse inizia il DragDrop
    // mettendo il flag BachecaInsert := True per indicare che il
    // destinatario deve fare l'Insert di quanto riceve
  end
  else if (Button = mbRight) then
  begin
    BachecaInsert := True;
    ListViewExpDoc.BeginDrag(False);
  end;
end;

procedure TmainForm.ListViewExpDocEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  // Altrimenti dà un errore
  if Target <> nil then
  begin
    // Se il target è la TAdvStringGrid dei righi dell'elenco del materiale della conformità
    // esegue l'importazione dei righi
    if (Target is TcxGridSite) then
    begin
      if TcxGridSite(Target).GridView.Name = 'tvRT' then
      begin
        ConformitaForm.ImportaDocumentiEsportati;
      end;
    end;
  end;
end;

procedure TmainForm.Importazionearchividibase1Click(Sender: TObject);
begin
  DM1.Attendere;
  Application.CreateForm(TSynchroForm, SynchroForm);
  SynchroForm.Parent := mainForm;
  SynchroForm.FormMode := SYNCHRO_MODE_ARCBASE;
  SynchroForm.Show;
  DM1.ChiudiAttendere;
end;

procedure TmainForm.FormResize(Sender: TObject);
begin
  // Si assicura che la form non sia inferiore alle dimensioni minime
  if not mainForm.ModoAssistenzeRDP then
  begin
    if Width < MAINFORM_WIDTH then
      Width := MAINFORM_WIDTH;
    if Height < MAINFORM_HEIGHT then
      Height := MAINFORM_HEIGHT;
  end;
  // Posizionamento pulsanti "Impostazioni" e "Utilità"
  SBUtilita.Left := 13;
  SBUtilita.Top := MainLeftPanel.Height - 22;
  SBImpostazioni.Left := 94;
  SBImpostazioni.Top := SBUtilita.Top;
  // Forza il ritracciamento della bacheca, altrimenti in alcuni casi non era perfetta
  ListViewExpDoc.Repaint;
  // RIcalcola la posizione del calendario
  CalcolaPosizioneVerticaleCalendario;
  // Ridimensiona anche la form di selezione del cantiere nella vendita al banco
  if VendBancoSeleCantForm <> nil then
    VendBancoSeleCantForm.FormResize(VendBancoSeleCantForm);
  // Ridimensiona anche il teletrasporto
  if ScambioDocForm <> nil then
    ScambioDocForm.Ridimensiona;
  // Dimensiona e visualizza il Frame
  StartFrame.Color := COLOR_LOGIN_OPZIONI;
  StartFrame.Left := 0;
  StartFrame.Top := 0;
  StartFrame.Width := ClientWidth;
  StartFrame.Height := ClientHeight;
  // Forza l'aggiornamento immediato dello schermo
  Self.Update;
end;

procedure TmainForm.SBRubricaClick(Sender: TObject);
var
  AllowChange: Boolean;
  CurrTab: TTabSheet;
begin
  // Se non uso una variabile non funziona e dà errore
  AllowChange := True;
  // Se non è già la voce selezionata
  if not MMItemIsSelected(Sender as TPaintBox) then
  begin
    // Memorizza la precedente voce di menù selezionata
    // NB: Però solo se non è una anagrafica Soggetto/Cantiere/Impianto
    if (MMItemGetSelected <> SBSoggetto) and (MMItemGetSelected <> SBPratica) and (MMItemGetSelected <> SBAssistenza) then
      PrecSelectedMainMenuItem := MMItemGetSelected;
    // Seleziona la voce del menu
    MMItemSetSelected(Sender as TPaintBox);
    with (Sender as TPaintBox) do
    begin
      // Se è stata cliccata una voce normale (non il soggetto selezionato oppure la pratica)
      if (Name <> 'SBSoggetto') and (Name <> 'SBPratica') and (Name <> 'SBAssistenza') then
      begin

        // CurrTab contiene il riferimento al TabSheet da attivare
        if Name = 'SBRubrica' then
          CurrTab := ClientiForm.TabClienti
        else if Name = 'SBDocumenti' then
          CurrTab := ClientiForm.TabDocumenti
        else if Name = 'SBGM' then
          CurrTab := ClientiForm.TabMagazzino
        else if Name = 'SBCV' then
          CurrTab := ClientiForm.TabCondVend
        else if Name = 'SBArticoli' then
          CurrTab := ClientiForm.TabArticoli
        else if Name = 'SBPratiche' then
          CurrTab := ClientiForm.TabPratiche
        else if Name = 'SBAssistenze' then
          CurrTab := ClientiForm.TabAssistenze
        else if Name = 'SBScadenze' then
          CurrTab := ClientiForm.TabScadenze
        else if Name = 'SBImpegni' then
          CurrTab := ClientiForm.TabImpegni
        else if Name = 'SBPrimanota' then
          CurrTab := ClientiForm.TabPrimanota
        else if Name = 'SBAgenda' then
          CurrTab := ClientiForm.TabAgenda
        else if Name = 'SBGC' then
          CurrTab := ClientiForm.TabGC
        else if Name = 'SBPartitario' then
          CurrTab := ClientiForm.TabPartitario
        else if Name = 'SBResOrd' then
          CurrTab := ClientiForm.TabResOrd
        else if Name = 'SBComunicazioni' then
          CurrTab := ClientiForm.TabComunicazioni
        else if Name = 'SBGOS' then
          CurrTab := ClientiForm.TabGOS;
        // ClientiForm.RxSpeedButtonResetQueryClick(Self);   // Azzera i filtri
        mainForm.PrecSelectedMainMenuItem := nil; // Non eliminarlo
        ClientiForm.PageControl2Changing(Self, AllowChange);
        ClientiForm.PageControl2.ActivePage := CurrTab;
        ClientiForm.PageControl2Change(Self);

        // Se invece si tratta proprio del Soggetto selezionato oppure la pratica selezionata
      end
      else
      begin

        // Se è stato cliccato sul soggetto selezionato...
        // NB: Prima di procedere disabilita il pulsante di chiusura della pratica perchè
        // se uno ci cliccava sopra mentre stata ancora aprendo l'anagraica della pratica
        // dava un errore.
        if Name = 'SBSoggetto' then
        begin
          DM1.ShowWait(NomeApplicazione, 'Caricamento...');
          try
            SSChiudi.Enabled := False;
            ClientiForm.PageControl2Changing(Self, AllowChange);
            DisabilitaMainMenu(True); // Altrimenti in alcuni casi dava un errore
            MMItemSetSelected(SBSoggetto);
            DM1.VisualizzaCliente(StrToInt(ClientiForm.ClienteCorrente), True);
          finally
            DM1.CloseWait;
            AbilitaMainMenu;
            SSChiudi.Enabled := True;
          end;
          // Se invece è stato cliccato sulla pratica sslezionata...
          // NB: Prima di procedere disabilita il pulsante di chiusura della pratica perchè
          // se uno ci cliccava sopra mentre stata ancora aprendo l'anagraica della pratica
          // dava un errore.
        end
        else if Name = 'SBPratica' then
        begin
          DM1.ShowWait(NomeApplicazione, 'Caricamento...');
          try
            PSChiudi.Enabled := False;
            ClientiForm.PageControl2Changing(Self, AllowChange);
            DisabilitaMainMenu(True); // Altrimenti in alcuni casi dava un errore
            MMItemSetSelected(SBPratica);
            DM1.VisualizzaPratica(StrToInt(ClientiForm.PraticaCorrente), StrToDate(ClientiForm.DataPraticaCorrente), False);
          finally
            DM1.CloseWait;
            AbilitaMainMenu;
            PSChiudi.Enabled := True;
          end;
          // Se invece è stato cliccato sull'assistenze impianto selezionato...
          // NB: Prima di procedere disabilita il pulsante di chiusura della pratica perchè
          // se uno ci cliccava sopra mentre stata ancora aprendo l'anagraica della pratica
          // dava un errore.
        end
        else if Name = 'SBAssistenza' then
        begin
          DM1.ShowWait(NomeApplicazione, 'Caricamento...');
          try
            PSChiudi.Enabled := False;
            ClientiForm.PageControl2Changing(Self, AllowChange);
            DisabilitaMainMenu(True); // Altrimenti in alcuni casi dava un errore
            MMItemSetSelected(SBAssistenza);
            DM1.VisualizzaAssistenza(StrToInt(ClientiForm.PraticaCorrente), StrToDate(ClientiForm.DataPraticaCorrente), False);
          finally
            DM1.CloseWait;
            AbilitaMainMenu;
            PSChiudi.Enabled := True;
          end;
        end;

      end;
    end;
  end;
end;

procedure TmainForm.SSChiudiClick(Sender: TObject);
begin
  // Deseleziona il soggetto e la pratica selezionati
  ClientiForm.SelezionaSoggettoPratica;
  {
    // Forza la selezione della pagina della rubrica
    SBRubricaClick(SBRubrica);
  }
end;

procedure TmainForm.PSChiudiClick(Sender: TObject);
begin
  // Deseleziona la Pratica/Cantiere/Impianto corrente
  ClientiForm.SelezionaSoggettoPratica(ClientiForm.ID_ClienteCorrente);
  {
    // Si riporta sulla pagina che era selezionata al
    //  momento della selezione del cantiere.
    if      ClientiForm.PrecPaginaCorrente = IDX_AUTOQUERY_RUBRICA    then SBRubricaClick(SBRubrica)
    else if ClientiForm.PrecPaginaCorrente = IDX_AUTOQUERY_PRATICHE   then SBRubricaClick(SBPratiche)
    else if ClientiForm.PrecPaginaCorrente = IDX_AUTOQUERY_ASSISTENZE then SBRubricaClick(SBAssistenze)
    // Se la pagina precedentemente selezionata non è specificata usa il vecchio metodo
    else begin
    if ClientiForm.TipoPraticaCorrente = 'P' then begin
    // Forza la selezione della pagina delle Pratiche
    SBRubricaClick(SBPratiche);
    end else if ClientiForm.TipoPraticaCorrente = 'A' then begin
    // Forza la selezione della pagina delle Pratiche
    SBRubricaClick(SBAssistenze);
    end;
    end;
  }
end;

procedure TmainForm.PanelNomiDocExit(Sender: TObject);
begin
  // Impedisce di uscire dal pannello se non si è premuto il pulsante OK
  if PanelNomiDoc.Tag = 0 then
  begin
    MessageBeep(0);
    ListBoxNomeDoc.SetFocus;
  end;
end;

procedure TmainForm.SBTipoDocumentoClick(Sender: TObject);
begin
  if SBTipoDocumento.Down then
  begin
    // In base ai permessi rende o meno visibili i tipo di documento nella comboboox di selezione
    ListBoxNomeDoc.Items.Clear;
    if DM1.ModCtrl(MOD_BUONO_CONSEGNA) > 1 then
      ListBoxNomeDoc.Items.Add('Buono_cons');
    if DM1.ModCtrl(MOD_DDT) > 1 then
      ListBoxNomeDoc.Items.Add('D.D.T.');
    if DM1.ModCtrl(MOD_FATTURE) > 1 then
      ListBoxNomeDoc.Items.Add('Fattura');
    if DM1.ModCtrl(MOD_FATTURE_RF) > 1 then
      ListBoxNomeDoc.Items.Add('Fatt.R.F.');
    if DM1.ModCtrl(MOD_NOTE_ACCREDITO) > 1 then
      ListBoxNomeDoc.Items.Add('Nota_accre');
    if DM1.ModCtrl(MOD_ORDINI) > 1 then
      ListBoxNomeDoc.Items.Add('Ordine');
    if DM1.ModCtrl(MOD_PREVENTIVI) > 1 then
      ListBoxNomeDoc.Items.Add('Preventivo');
    if DM1.ModCtrl(MOD_RICEVUTE_FISCALI) > 1 then
      ListBoxNomeDoc.Items.Add('Ricev.fisc');
    if DM1.ModCtrl(MOD_SAL) > 1 then
      ListBoxNomeDoc.Items.Add('S.A.L.');

    if DM1.ModCtrl(MOD_BOLLE_ENTRATA) > 1 then
      ListBoxNomeDoc.Items.Add('Bolla_entr');
    if DM1.ModCtrl(MOD_FATTURE_ACQUISTO) > 1 then
      ListBoxNomeDoc.Items.Add('Fatt.acqui');
    if DM1.ModCtrl(MOD_ORDINI_FORNITORI) > 1 then
      ListBoxNomeDoc.Items.Add('Ord.fornit');
    if DM1.ModCtrl(MOD_NOTE_ACCREDITO) > 1 then
      ListBoxNomeDoc.Items.Add('N.C.fornit');
    // Se è visibile la form laterale con i dati del rigo selezionato la rende
    // momentaneamente invisibile
    if DatiRigoForm <> nil then
      DatiRigoForm.Hide;
    // POsiziona il pannello e lo visualizza
    PanelNomiDoc.Left := SBTipoDocumento.Left + SBTipoDocumento.Width - PanelNomiDoc.Width;
    PanelNomiDoc.Top := LabelTipoDocumento.Top + LabelTipoDocumento.Height;
    PanelNomiDoc.Tag := 0;
    PanelNomiDoc.Visible := True;
    ListBoxNomeDoc.SetFocus;
    PanelNomiDoc.Update;
  end
  else
  begin
    // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
    PanelNomiDoc.Tag := 1;
    PanelNomiDoc.Visible := False;
    Update;
  end;
end;

procedure TmainForm.ListBoxNomeDocClick(Sender: TObject);
begin
  SBTipoDocumento.Down := False;
  // Rende di nuovo visibile il pannello laterale con i dati del rigo
  if (DatiRigoForm <> nil) and (not DatiRigoForm.Visible) then
    DatiRigoForm.Show;
  // Imposta il nuovo tipo documento
  PreventiviOrdiniForm.TipoDoc := ListBoxNomeDoc.Items[ListBoxNomeDoc.ItemIndex];
  PreventiviOrdiniForm.QryDocumentoTipoDocumento.Value := PreventiviOrdiniForm.TipoDoc;
  PreventiviOrdiniForm.CambiaTipoDocumento;
  // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
  PanelNomiDoc.Tag := 1;
  PanelNomiDoc.Visible := False;
  Update;
end;

procedure TmainForm.SBUtilitaClick(Sender: TObject);
begin
  // Se il pulsante è premuto deve visualizzare il relativo menù
  if SBUtilita.Down then
  begin
    // Se l'altro pulsante è Down lo rialza
    if SBImpostazioni.Down then
    begin
      SBImpostazioni.Down := False;
      SBImpostazioniClick(Self);
    end;
    // IMposta il Tag del menu per indicare che si vuole il menu delle UTILITA
    MenuUtilita.Tag := 0;
    // Popola il menu e lo visualizza
    RiempiMenuUtilita;
    VisualizzaUtilita;
    // Focus sul menu
    MenuUtilita.SetFocus;
    // Se il pulsante è alzato deve sparire il relativo menù
  end
  else
  begin
    // Se il menù è aperto chiude il menù
    if PanelMenuUtilita.Visible then
      ChiudiUtilita;
  end;
end;

procedure TmainForm.VisualizzaUtilita;
const
  Speed = 3;
  Passo = 100;
var
  FinalTop: Integer;
begin
  // Calcola la posizione finale
  PanelMenuUtilita.Left := 7;
  FinalTop := SBUtilita.Top - PanelMenuUtilita.Height - 10;
  try
    // ANIMAZIONE
    // ------------------------------------------------------------------------------------------------
    // Finchè l'altezza del pannello non è quella voluta (Altezza)
    while PanelMenuUtilita.Top > FinalTop do
    begin
      // INcrementa l'altezza del mannello in base al passo
      PanelMenuUtilita.Top := PanelMenuUtilita.Top - Passo;
      PanelMenuUtilita.Update;
      // Attesa per il prossimo passo
      Sleep(Speed);
    end;
    // ------------------------------------------------------------------------------------------------
  finally
    // IN ogni caso alla fine il pannello lo forzo alla posizione calcolata
    // e imposto la proprietà Down del bottone = True.
    // facendo questo anche se c'è stato un errore alla fine è sempre a posti.
    PanelMenuUtilita.Top := FinalTop;
    PanelMenuUtilita.Update;
    // In base a quale pulsante è stato premuto forza lo forza a down := True;
    case MenuUtilita.Tag of
      0:
        SBUtilita.Down := True;
      1:
        SBImpostazioni.Down := True;
    end;
  end;
end;

procedure TmainForm.ChiudiUtilita;
const
  Speed = 3;
  Passo = 100;
var
  FinalTop: Integer;
begin
  // Calcola la posizione finale
  FinalTop := PanelMenuUtilita.Top + PanelMenuUtilita.Height;
  try
    // ANIMAZIONE
    // ------------------------------------------------------------------------------------------------
    // Finchè l'altezza del pannello non è quella voluta (Altezza)
    while PanelMenuUtilita.Top < FinalTop do
    begin
      // INcrementa l'altezza del mannello in base al passo
      PanelMenuUtilita.Top := PanelMenuUtilita.Top + Passo;
      MainLeftPanel.Update;
      // Attesa per il prossimo passo
      Sleep(Speed);
    end;
    // ------------------------------------------------------------------------------------------------
  finally
    // IN ogni caso alla fine il pannello lo forzo alla posizione calcolata
    // e imposto la proprietà Down del bottone = True.
    // facendo questo anche se c'è stato un errore alla fine è sempre a posti.
    PanelMenuUtilita.Top := FinalTop;
    PanelMenuUtilita.Visible := False;
    MainLeftPanel.Update;
    // In base a quale pulsante è stato premuto forza lo forza a down := True;
    SBUtilita.Down := False;
    SBImpostazioni.Down := False;
  end;
end;

procedure TmainForm.RiempiMenuUtilita;
const
  SEP = '                                                               ';
var
  LO, AL, MENU: TMemIniFile;
begin
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  MENU := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  AL := TMemIniFile.Create(DM1.CurrDir + 'agglist.ini');
  try
    // Svuota tutto
    MenuUtilita.Items.Clear;
    // INIZIO INSERIMENTO VOCI
    // -----------------------------------------------------------------------------------
    // Se la proprietà MenuUtilita.Tag = 0 significa che deve essere caricato il menù Utilità
    case MenuUtilita.Tag of
      // UTILITA'
      0:
        begin
          MenuUtilita.Items.Add('Vendita al banco' + SEP + IntToStr(U_BANCO));
          if (DM1.ModCtrl(MOD_FATT_RIEPILOGATIVA) > 1) then
            MenuUtilita.Items.Add('Fatturazione differita in 4 passi' + SEP + IntToStr(U_FATTDIFF));
          if AL.ReadString('LISTINO1', 'MenuLabel', 'NONE') <> 'NONE' then
            MenuUtilita.Items.Add(StringReplace(AL.ReadString('LISTINO1', 'MenuLabel', 'NONE'), '_', ' ', [rfReplaceAll]) + SEP + IntToStr(U_AGGLIST));

          if (DM1.ModCtrl(MOD_IMPORTAZIONE_ARCHIVI) > 0) and (DM1.IsServer) then
            MenuUtilita.Items.Add('Importazione archivi' + SEP + IntToStr(U_IMPORTAZIONE));
          if (DM1.ModCtrl(MOD_IMPORTAZIONE_ARCHIVI) > 0) then
            MenuUtilita.Items.Add('Import/Export archivi' + SEP + IntToStr(U_ESPORTAZIONE));

          if DM1.AbilitaSincronizzazione then
            MenuUtilita.Items.Add('Sincronizzazione' + SEP + IntToStr(U_SINCHRO));
          MenuUtilita.Items.Add('Copia di sicurezza azienda' + SEP + IntToStr(U_BACKUP));
          MenuUtilita.Items.Add('Informazioni sul programma' + SEP + IntToStr(U_ABOUT));
          MenuUtilita.Items.Add('Teletrasporto' + SEP + IntToStr(U_TELETRASPORTO));
          if (DM1.ModCtrl(MOD_ARTICOLI) > 1) then
          begin
            MenuUtilita.Items.Add('Aumento prezzi di listino' + SEP + IntToStr(U_AUMENTOLISTINI));
            MenuUtilita.Items.Add('Modifica margine articoli' + SEP + IntToStr(U_MODIFICAMARGINI));
          end;
          if (DM1.ModCtrl(MOD_ARTICOLI) > 0) and (DM1.IsServer) then
            MenuUtilita.Items.Add('Chiusura magazzini (consolidam.)' + SEP + IntToStr(U_CHIUSURAMAGAZZINO));
          if (DM1.ModCtrl(MOD_ARTICOLI) > 0) and (DM1.IsServer) then
            MenuUtilita.Items.Add('Azzeramento giacenze magazzini' + SEP + IntToStr(U_AZZERAMENTOMAGAZZINO));
          if (DM1.ModCtrl(MOD_PRATICHE) > 0) then
            MenuUtilita.Items.Add('Stradario' + SEP + IntToStr(U_STRADARIO));
          if (DM1.ModCtrl(MOD_PRATICHE) > 0) then
            MenuUtilita.Items.Add('Crea file invio telem. allegati F/G' + SEP + IntToStr(U_ALLEGATIMANUT_EXPORT));
          if (DM1.ModCtrl(MOD_PRATICHE) > 0) then
            MenuUtilita.Items.Add('Calcola etichetta energetica' + SEP + IntToStr(U_ETICHETTA_ENERGETICA));

          // Carica le Bitmap
          UtilitaTitolo.Picture.LoadFromFile(DM1.TemaDir + 'title_utilita.bmp');
          UtilitaBarra.Picture.LoadFromFile(DM1.TemaDir + 'title_bar.bmp');
        end;
      // IMPOSTAZIONI
      1:
        begin
          MenuUtilita.Items.Add('Gruppi, sottogruppi...' + SEP + IntToStr(I_GRUPPI));

          if DM1.CategCaption1 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption1 + SEP + IntToStr(I_CATEG1));
          if DM1.CategCaption2 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption2 + SEP + IntToStr(I_CATEG2));
          if DM1.CategCaption3 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption3 + SEP + IntToStr(I_CATEG3));
          if DM1.CategCaption4 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption4 + SEP + IntToStr(I_CATEG4));
          if DM1.CategCaption5 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption5 + SEP + IntToStr(I_CATEG5));
          if DM1.CategCaption6 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption6 + SEP + IntToStr(I_CATEG6));
          if DM1.CategCaption7 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption7 + SEP + IntToStr(I_CATEG7));
          if DM1.CategCaption8 <> '0' then
            MenuUtilita.Items.Add(DM1.CategCaption8 + SEP + IntToStr(I_CATEG8));

          if LO.ReadString('CategCant1', 'MenuCaption', '0') <> '0' then
            MenuUtilita.Items.Add(LO.ReadString('CategCant1', 'MenuCaption', '0') + SEP + IntToStr(I_CATEGCANT1));
          if LO.ReadString('CategCant2', 'MenuCaption', '0') <> '0' then
            MenuUtilita.Items.Add(LO.ReadString('CategCant2', 'MenuCaption', '0') + SEP + IntToStr(I_CATEGCANT2));
          if LO.ReadString('CategCant3', 'MenuCaption', '0') <> '0' then
            MenuUtilita.Items.Add(LO.ReadString('CategCant3', 'MenuCaption', '0') + SEP + IntToStr(I_CATEGCANT3));
          if LO.ReadString('CategCant4', 'MenuCaption', '0') <> '0' then
            MenuUtilita.Items.Add(LO.ReadString('CategCant4', 'MenuCaption', '0') + SEP + IntToStr(I_CATEGCANT4));
          if LO.ReadString('CategCant5', 'MenuCaption', '0') <> '0' then
            MenuUtilita.Items.Add(LO.ReadString('CategCant5', 'MenuCaption', '0') + SEP + IntToStr(I_CATEGCANT5));
          if LO.ReadString('CategCant6', 'MenuCaption', '0') <> '0' then
            MenuUtilita.Items.Add(LO.ReadString('CategCant6', 'MenuCaption', '0') + SEP + IntToStr(I_CATEGCANT6));

          // Agenti
          if DM1.AgentiMenuCaption <> '' then
            MenuUtilita.Items.Add(DM1.AgentiMenuCaption + SEP + IntToStr(I_AGENTI));
          if DM1.Agenti2MenuCaption <> '' then
            MenuUtilita.Items.Add(DM1.Agenti2MenuCaption + SEP + IntToStr(I_AGENTI2));
          if DM1.Agenti3MenuCaption <> '' then
            MenuUtilita.Items.Add(DM1.Agenti3MenuCaption + SEP + IntToStr(I_AGENTI3));
          if DM1.Agenti4MenuCaption <> '' then
            MenuUtilita.Items.Add(DM1.Agenti4MenuCaption + SEP + IntToStr(I_AGENTI4));

          MenuUtilita.Items.Add('Banche' + SEP + IntToStr(I_BANCHE));
          MenuUtilita.Items.Add('Modalità di pagamento' + SEP + IntToStr(I_PAGAM));
          MenuUtilita.Items.Add('Dati azienda' + SEP + IntToStr(I_DATIAZIENDA));
          MenuUtilita.Items.Add('Aliquote IVA' + SEP + IntToStr(I_IVA));
          // MenuUtilita.Items.Add('Causali cantieri' + SEP + IntToStr(I_CAUSALICANTIERI));
          MenuUtilita.Items.Add('Causali documenti' + SEP + IntToStr(I_CAUSALI));
          MenuUtilita.Items.Add('Magazzini' + SEP + IntToStr(I_MAGAZZINI));
          MenuUtilita.Items.Add('Parametri e progressivi' + SEP + IntToStr(I_PROGRESSIVI));
          // MenuUtilita.Items.Add('Fax' + SEP + IntToStr(I_FAX));
          // MenuUtilita.Items.Add('Internet' + SEP + IntToStr(I_INTERNET));
          MenuUtilita.Items.Add('Colleg. a progr. esterni' + SEP + IntToStr(I_EXTPRG));
          MenuUtilita.Items.Add('Stati documenti' + SEP + IntToStr(I_STATI));
          MenuUtilita.Items.Add('Intestazioni documenti' + SEP + IntToStr(I_LOGHI));
          // MenuUtilita.Items.Add('Selezione scanner' + SEP + IntToStr(I_TWAIN));
          MenuUtilita.Items.Add('Etichette' + SEP + IntToStr(I_ETICHETTE));
          MenuUtilita.Items.Add('Multiregistro' + SEP + IntToStr(I_MULTIREGISTRO));
          if (DM1.ModCtrl(MOD_CONTATTI) > 1) then
            MenuUtilita.Items.Add(DM1.TecniciMenuCaption + SEP + IntToStr(I_TECNICI));
          if (DM1.ModCtrl(MOD_CONFORMITA) > 1) then
          begin
            MenuUtilita.Items.Add('Apparecchi / Materiali' + SEP + IntToStr(I_APPARECCHI));
            MenuUtilita.Items.Add('Modelli dichiarazioni di conf.' + SEP + IntToStr(I_MODELLI_DICHIARAZ));
            MenuUtilita.Items.Add('Società distribuzione gas' + SEP + IntToStr(I_SOCIETA_GAS));
          end;
          MenuUtilita.Items.Add('Photo album articoli' + SEP + IntToStr(I_PHOTOART));
          MenuUtilita.Items.Add('Dipendenti / Operai' + SEP + IntToStr(I_DIPENDENTI));
          MenuUtilita.Items.Add('Automezzi' + SEP + IntToStr(I_AUTOMEZZI));
          MenuUtilita.Items.Add('Tipi ore dipententi/operari' + SEP + IntToStr(I_TIPIOREDIPENDENTI));
          MenuUtilita.Items.Add('Tipi di spese varie' + SEP + IntToStr(I_TIPIALTRESPESE));
          MenuUtilita.Items.Add('Enti' + SEP + IntToStr(I_ENTI));

          if LO.ReadBool('AnagraficheTipiRighi', 'TipiRighi1', False) then
            MenuUtilita.Items.Add(MENU.ReadString('TitoliTipiRighi', 'TipoRigo1MenuCaption', 'Tipo di righi 1') + SEP + IntToStr(I_TIPIRIGHI1));
          if LO.ReadBool('AnagraficheTipiRighi', 'TipiRighi2', False) then
            MenuUtilita.Items.Add(MENU.ReadString('TitoliTipiRighi', 'TipoRigo2MenuCaption', 'Tipo di righi 2') + SEP + IntToStr(I_TIPIRIGHI2));
          if LO.ReadBool('AnagraficheTipiRighi', 'TipiRighi3', False) then
            MenuUtilita.Items.Add(MENU.ReadString('TitoliTipiRighi', 'TipoRigo3MenuCaption', 'Tipo di righi 3') + SEP + IntToStr(I_TIPIRIGHI3));
          if LO.ReadBool('AnagraficheTipiRighi', 'TipiRighi4', False) then
            MenuUtilita.Items.Add(MENU.ReadString('TitoliTipiRighi', 'TipoRigo4MenuCaption', 'Tipo di righi 4') + SEP + IntToStr(I_TIPIRIGHI4));
          if LO.ReadBool('AnagraficheTipiRighi', 'TipiRighi5', False) then
            MenuUtilita.Items.Add(MENU.ReadString('TitoliTipiRighi', 'TipoRigo5MenuCaption', 'Tipo di righi 5') + SEP + IntToStr(I_TIPIRIGHI5));
          if LO.ReadBool('AnagraficheTipiRighi', 'TipiRighi6', False) then
            MenuUtilita.Items.Add(MENU.ReadString('TitoliTipiRighi', 'TipoRigo6MenuCaption', 'Tipo di righi 6') + SEP + IntToStr(I_TIPIRIGHI6));

          MenuUtilita.Items.Add('Operazioni pianificate' + SEP + IntToStr(I_OPERAZIONIPIANIFICATE));

          if (DM1.ModCtrl(MOD_TESTI) > 1) then
            MenuUtilita.Items.Add('Comunicazioni automatiche' + SEP + IntToStr(I_COM_MODELLI));

          // Carica le Bitmap
          UtilitaTitolo.Picture.LoadFromFile(DM1.TemaDir + 'title_impostazioni.bmp');
          UtilitaBarra.Picture.LoadFromFile(DM1.TemaDir + 'title_bar.bmp');
        end;
    end;
    // -----------------------------------------------------------------------------------
    // Calcola l'altezza della ListBox
    MenuUtilita.Top := 5;
    MenuUtilita.Height := MenuUtilita.Items.Count * MenuUtilita.ItemHeight;
    PanelMenuUtilita.Height := MenuUtilita.Height + 10;
    // Posizionamento e dimensionamento Bitmap del titolo
    UtilitaTitolo.Height := UtilitaTitolo.Picture.Bitmap.Height;
    UtilitaBarra.Top := UtilitaTitolo.Top + UtilitaTitolo.Height;
    UtilitaBarra.Height := PanelMenuUtilita.Height - UtilitaBarra.Top;
    // Posizione iniziale pannello chiuso
    PanelMenuUtilita.Top := SBUtilita.Top;
    PanelMenuUtilita.Visible := True;
    PanelMenuUtilita.Update;
  finally
    LO.Free;
    MENU.Free;
    AL.Free;
  end;
end;

procedure TmainForm.MenuUtilitaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  // Simula un Hot Track
  MenuUtilita.ItemIndex := MenuUtilita.ItemAtPos(Point(X, Y), True);
end;

procedure TmainForm.MenuUtilitaClick(Sender: TObject);
var
  Sel: Byte;
  SelStr: String;
  MR: TModalResult;
begin
  try
    // Pone in Sel il codice (Ultimi 2 caratteri a DX del titolo della voce)
    SelStr := MenuUtilita.Items[MenuUtilita.ItemIndex];
    Sel := StrToInt(DM1.StrRight(SelStr, 2));
    // ============================================================================
    // VISUALIZZA LA FORM RELATIVA ALLA VOCE SELEZIONATA
    // ----------------------------------------------------------------------------
    case Sel of
      I_GRUPPI:
        begin
          if GruppiForm = nil then
          begin
            Application.CreateForm(TGruppiForm, GruppiForm);
            GruppiForm.Parent := mainForm;
            GruppiForm.Show;
          end;
        end;

      I_CATEG1:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG1';
            Categoria1Form.Show;
          end;
        end;

      I_CATEG2:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG2';
            Categoria1Form.Show;
          end;
        end;

      I_CATEG3:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG3';
            Categoria1Form.Show;
          end;
        end;

      I_CATEG4:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG4';
            Categoria1Form.Show;
          end;
        end;

      I_CATEG5:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG5';
            Categoria1Form.Show;
          end;
        end;

      I_CATEG6:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG6';
            Categoria1Form.Show;
          end;
        end;

      I_CATEG7:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG7';
            Categoria1Form.Show;
          end;
        end;

      I_CATEG8:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEG8';
            Categoria1Form.Show;
          end;
        end;

      I_CATEGCANT1:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEGCANT1';
            Categoria1Form.Show;
          end;
        end;

      I_CATEGCANT2:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEGCANT2';
            Categoria1Form.Show;
          end;
        end;

      I_CATEGCANT3:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEGCANT3';
            Categoria1Form.Show;
          end;
        end;

      I_CATEGCANT4:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEGCANT4';
            Categoria1Form.Show;
          end;
        end;

      I_CATEGCANT5:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEGCANT5';
            Categoria1Form.Show;
          end;
        end;

      I_CATEGCANT6:
        begin
          if Categoria1Form = nil then
          begin
            Application.CreateForm(TCategoria1Form, Categoria1Form);
            Categoria1Form.Parent := mainForm;
            Categoria1Form.Tabella := 'CATEGCANT6';
            Categoria1Form.Show;
          end;
        end;

      I_BANCHE:
        begin
          if ArchivioBancheForm = nil then
          begin
            Application.CreateForm(TArchivioBancheForm, ArchivioBancheForm);
            ArchivioBancheForm.Parent := mainForm;
            ArchivioBancheForm.Show;
          end;
        end;

      I_PAGAM:
        begin
          if PagamentiForm = nil then
          begin
            Application.CreateForm(TPagamentiForm, PagamentiForm);
            PagamentiForm.Parent := mainForm;
            PagamentiForm.Show;
          end;
        end;

      I_DATIAZIENDA:
        begin
          if DatiAziendaForm = nil then
          begin
            Application.CreateForm(TDatiAziendaForm, DatiAziendaForm);
            DatiAziendaForm.Parent := mainForm;
            DatiAziendaForm.Show;
          end;
        end;

      I_IVA:
        begin
          if AliquoteIVAForm = nil then
          begin
            Application.CreateForm(TAliquoteIVAForm, AliquoteIVAForm);
            AliquoteIVAForm.Parent := mainForm;
            AliquoteIVAForm.Show;
          end;
        end;

      I_CAUSALI:
        begin
          if CausaliForm = nil then
          begin
            Application.CreateForm(TCausaliForm, CausaliForm);
            CausaliForm.Parent := mainForm;
            CausaliForm.Show;
          end;
        end;

      I_CAUSALICANTIERI:
        begin
          {
            if CausaliCantieriForm = nil then begin
            Application.CreateForm(TCausaliCantieriForm, CausaliCantieriForm);
            CausaliCantieriForm.Parent := MainForm;
            CausaliCantieriForm.Show;
            end;
          }
        end;

      I_MAGAZZINI:
        begin
          if AnagMagaForm = nil then
          begin
            Application.CreateForm(TAnagMagaForm, AnagMagaForm);
            AnagMagaForm.Parent := mainForm;
            AnagMagaForm.Show;
          end;
        end;

      I_PROGRESSIVI:
        begin
          if ProgressiviForm = nil then
          begin
            DM1.ShowWait('Levante', 'Attendere...');
            try
              Application.CreateForm(TProgressiviForm, ProgressiviForm);
              ProgressiviForm.Parent := mainForm;
              ProgressiviForm.PageControl1.ActivePage := ProgressiviForm.TabProgressivi;
              ProgressiviForm.Show;
            finally
              DM1.CloseWait;
            end;
          end;
        end;

      {
        I_FAX: begin
        if ProgressiviForm = nil then begin
        Application.CreateForm(TProgressiviForm, ProgressiviForm);
        ProgressiviForm.Parent := MainForm;
        ProgressiviForm.PageControl1.ActivePage := ProgressiviForm.TabFax;
        ProgressiviForm.Show;
        end;
        end;
      }

      I_INTERNET:
        begin
          if ProgressiviForm = nil then
          begin
            Application.CreateForm(TProgressiviForm, ProgressiviForm);
            ProgressiviForm.Parent := mainForm;
            ProgressiviForm.PageControl1.ActivePage := ProgressiviForm.TabInternet;
            ProgressiviForm.Show;
          end;
        end;

      I_EXTPRG:
        begin
          if ExtPrgForm = nil then
          begin
            Application.CreateForm(TExtPrgForm, ExtPrgForm);
            ExtPrgForm.Parent := mainForm;
            ExtPrgForm.Show;
          end;
        end;

      I_STATI:
        begin
          if StatiOggettiForm = nil then
          begin
            Application.CreateForm(TStatiOggettiForm, StatiOggettiForm);
            StatiOggettiForm.Parent := mainForm;
            StatiOggettiForm.Show;
          end;
        end;

      I_LOGHI:
        begin
          if IntestazioneDocumentiForm = nil then
          begin
            Application.CreateForm(TIntestazioneDocumentiForm, IntestazioneDocumentiForm);
            IntestazioneDocumentiForm.Parent := mainForm;
            // Imposta alcune variabili pubbliche della form
            IntestazioneDocumentiForm.FileBmp := 'Intestaz.bmp';
            IntestazioneDocumentiForm.Sezione := 'TestataDocumenti';
            IntestazioneDocumentiForm.Show;
          end;
        end;

      I_ETICHETTE:
        begin
          if EtichetteListImpostazioniForm = nil then
          begin
            Application.CreateForm(TEtichetteListImpostazioniForm, EtichetteListImpostazioniForm);
            EtichetteListImpostazioniForm.Parent := mainForm;
            EtichetteListImpostazioniForm.Show;
          end;
        end;

      I_MULTIREGISTRO:
        begin
          if MultiregistroForm = nil then
          begin
            Application.CreateForm(TMultiregistroForm, MultiregistroForm);
            MultiregistroForm.Parent := mainForm;
            MultiregistroForm.Show;
          end;
        end;

      I_TECNICI:
        begin
          if TecniciForm = nil then
          begin
            Application.CreateForm(TTecniciForm, TecniciForm);
            TecniciForm.Parent := mainForm;
            TecniciForm.Show;
          end;
        end;

      I_APPARECCHI:
        begin
          if ApparecchiForm = nil then
          begin
            Application.CreateForm(TApparecchiForm, ApparecchiForm);
            ApparecchiForm.Parent := mainForm;
            ApparecchiForm.Show;
          end;
        end;

      I_MODELLI_DICHIARAZ:
        begin
          if ListaModelliConfForm = nil then
          begin
            Application.CreateForm(TListaModelliConfForm, ListaModelliConfForm);
            ListaModelliConfForm.Parent := mainForm;
            ListaModelliConfForm.Show;
          end;
        end;

      I_SOCIETA_GAS:
        begin
          if SocGasForm = nil then
          begin
            Application.CreateForm(TSocGasForm, SocGasForm);
            SocGasForm.Parent := mainForm;
            SocGasForm.Show;
          end;
        end;

      I_PHOTOART:
        begin
          if PhotoArtForm = nil then
          begin
            Application.CreateForm(TPhotoArtForm, PhotoArtForm);
            PhotoArtForm.Parent := mainForm;
            PhotoArtForm.Show;
          end;
        end;

      I_DIPENDENTI:
        begin
          if DipendentiForm = nil then
          begin
            Application.CreateForm(TDipendentiForm, DipendentiForm);
            DipendentiForm.Parent := mainForm;
            DipendentiForm.Show;
          end;
        end;

      I_AUTOMEZZI:
        begin
          if AutomezziForm = nil then
          begin
            Application.CreateForm(TAutomezziForm, AutomezziForm);
            AutomezziForm.Parent := mainForm;
            AutomezziForm.Show;
          end;
        end;

      I_TIPIOREDIPENDENTI:
        begin
          if TipiOreDipendentiForm = nil then
          begin
            Application.CreateForm(TTipiOreDipendentiForm, TipiOreDipendentiForm);
            TipiOreDipendentiForm.Parent := mainForm;
            TipiOreDipendentiForm.Show;
          end;
        end;

      I_TIPIALTRESPESE:
        begin
          if TipiAltreSpeseForm = nil then
          begin
            Application.CreateForm(TTipiAltreSpeseForm, TipiAltreSpeseForm);
            TipiAltreSpeseForm.Parent := mainForm;
            TipiAltreSpeseForm.Show;
          end;
        end;

      I_AGENTI:
        begin
          if AgentiForm = nil then
          begin
            Application.CreateForm(TAgentiForm, AgentiForm);
            AgentiForm.Parent := mainForm;
            AgentiForm.IndiceTabella := '';
            AgentiForm.Show;
          end;
        end;

      I_AGENTI2:
        begin
          if AgentiForm = nil then
          begin
            Application.CreateForm(TAgentiForm, AgentiForm);
            AgentiForm.Parent := mainForm;
            AgentiForm.IndiceTabella := '2';
            AgentiForm.Show;
          end;
        end;

      I_AGENTI3:
        begin
          if AgentiForm = nil then
          begin
            Application.CreateForm(TAgentiForm, AgentiForm);
            AgentiForm.Parent := mainForm;
            AgentiForm.IndiceTabella := '3';
            AgentiForm.Show;
          end;
        end;

      I_AGENTI4:
        begin
          if AgentiForm = nil then
          begin
            Application.CreateForm(TAgentiForm, AgentiForm);
            AgentiForm.Parent := mainForm;
            AgentiForm.IndiceTabella := '4';
            AgentiForm.Show;
          end;
        end;

      I_TIPIRIGHI1 .. I_TIPIRIGHI6:
        begin
          if TipiRighiForm = nil then
          begin
            Application.CreateForm(TTipiRighiForm, TipiRighiForm);
            TipiRighiForm.Parent := mainForm;
            TipiRighiForm.Livello := Sel - I_TIPIRIGHI1 + 1;
            TipiRighiForm.Show;
          end;
        end;

      I_OPERAZIONIPIANIFICATE:
        begin
          if OperazioniPianificateForm = nil then
          begin
            Application.CreateForm(TOperazioniPianificateForm, OperazioniPianificateForm);
            OperazioniPianificateForm.Parent := mainForm;
            OperazioniPianificateForm.Show;
          end;
        end;

      I_ENTI:
        begin
          if EntiForm = nil then
          begin
            Application.CreateForm(TEntiForm, EntiForm);
            EntiForm.Parent := mainForm;
            EntiForm.Show;
          end;
        end;

      I_COM_MODELLI:
        begin
          if ComModelliForm = nil then
          begin
            Application.CreateForm(TComModelliForm, ComModelliForm);
            ComModelliForm.Parent := mainForm;
            ComModelliForm.Show;
          end;
        end;

      U_BANCO:
        begin
          GoVenditaAlBanco;
        end;

      U_FATTDIFF:
        begin
          if FattDifferitaForm = nil then
          begin
            Application.CreateForm(TFattDifferitaForm, FattDifferitaForm);
            FattDifferitaForm.Parent := mainForm;
            FattDifferitaForm.Show;
          end;
        end;

      U_AGGLIST:
        begin
          if SynchroForm = nil then
          begin
            Application.CreateForm(TSynchroForm, SynchroForm);
            SynchroForm.Parent := mainForm;
            SynchroForm.FormMode := SYNCHRO_MODE_AGGLIST;
            SynchroForm.Show;
          end;
        end;

      U_IMPORTAZIONE:
        begin
          if ImportazioneForm = nil then
          begin
            Application.CreateForm(TImportazioneForm, ImportazioneForm);
            ImportazioneForm.ShowModal;
          end;
        end;

      U_ESPORTAZIONE:
        begin
          if ExportForm = nil then
          begin
            Application.CreateForm(TExportForm, ExportForm);
            ExportForm.Parent := mainForm;
            ExportForm.Show;
          end;
        end;

      U_SINCHRO:
        begin
          if SynchroForm = nil then
          begin
            Application.CreateForm(TSynchroForm, SynchroForm);
            SynchroForm.Parent := mainForm;
            SynchroForm.FormMode := SYNCHRO_MODE_NORMAL;
            SynchroForm.Show;
          end;
        end;

      U_BACKUP:
        begin
          if BackupForm = nil then
          begin
            // Invia il messaggio di richiesta di esecuzione del backup al Guardian
            MR := SendBackupRequest;
            // Se invece l'operazione è stata annullata dall'utente per qualche motivo...
            if MR = mrCancel then
            begin
              DM1.Messaggi('Levante', 'ATTENZIONE !!!'#13#13'La copia di sicurezza è stata ANNULLATA!', '', [mbOk], 0, nil);
              // Se invece l'operazione è stata annullata dall'utente per qualche motivo...
            end
            else if MR = mrAbort then
            begin
              DM1.Messaggi('Levante',
                'ATTENZIONE !!!'#13#13'Non è stato possibile effettuare/completare la copia di sicurezza perchè Levante Guardian è occupato oppure si è verificato un errore.',
                '', [mbOk], 0, nil);
            end;
          end;
        end;

      U_ABOUT:
        begin
          if AboutForm = nil then
          begin
            Application.CreateForm(TAboutForm, AboutForm);
            AboutForm.ShowModal;
          end;
        end;

      U_TELETRASPORTO:
        begin
          ApriTeletrasporto;
        end;

      U_AUMENTOLISTINI:
        begin
          if AumentoListiniForm = nil then
          begin
            AumentoListiniForm := TAumentoListiniForm.Create(Application, TIPOFORM_UTILITA, 0);
            AumentoListiniForm.Show;
          end;
        end;

      U_MODIFICAMARGINI:
        begin
          if ModificaMarginiForm = nil then
          begin
            ModificaMarginiForm := TModificaMarginiForm.Create(Application, TIPOFORM_UTILITA, 0);
            ModificaMarginiForm.Show;
          end;
        end;

      U_CHIUSURAMAGAZZINO:
        begin
          if ChiusuraMagazzinoForm = nil then
          begin
            ChiusuraMagazzinoForm := TChiusuraMagazzinoForm.Create(Application, TIPOFORM_UTILITA, 0);
            ChiusuraMagazzinoForm.Show;
          end;
        end;

      U_AZZERAMENTOMAGAZZINO:
        begin
          if AzzeramentoMagazzinoForm = nil then
          begin
            AzzeramentoMagazzinoForm := TAzzeramentoMagazzinoForm.Create(Application, TIPOFORM_UTILITA, 0);
            AzzeramentoMagazzinoForm.Show;
          end;
        end;

      U_STRADARIO:
        begin
          if SelezioneStradarioForm = nil then
          begin
            Application.CreateForm(TSelezioneStradarioForm, SelezioneStradarioForm);
            SelezioneStradarioForm.Parent := mainForm;
            SelezioneStradarioForm.Show;
          end;
        end;

      U_ALLEGATIMANUT_EXPORT:
        begin
          if ExportAllegatiManutForm = nil then
          begin
            Application.CreateForm(TExportAllegatiManutForm, ExportAllegatiManutForm);
            ExportAllegatiManutForm.Parent := mainForm;
            ExportAllegatiManutForm.Show;
          end;
        end;

      U_ETICHETTA_ENERGETICA:
        begin
          if EtichettaEnergeticaForm = nil then
          begin
            Application.CreateForm(TEtichettaEnergeticaForm, EtichettaEnergeticaForm);
            EtichettaEnergeticaForm.Parent := mainForm;
            EtichettaEnergeticaForm.Show;
          end;
        end;
    end;

    // ============================================================================
  finally
    // Chiude il menu
    ChiudiUtilita;
  end;
end;

procedure TmainForm.GoVenditaAlBanco;
begin
  if PreventiviOrdiniForm <> nil then
    Exit;
  Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
  PreventiviOrdiniForm.Parent := mainForm;
  // Chiama la fuunzione NUovoDocFisc per iniziare la sessione  di vendita al banco
  DM1.NuovoDocFisc(DM1.KioskTipoDocDefault, '', 0, 0, '', 4, 0, False, False);
end;

procedure TmainForm.SBImpostazioniClick(Sender: TObject);
begin
  // Se il pulsante è premuto deve visualizzare il relativo menù
  if SBImpostazioni.Down then
  begin
    // Se l'altro pulsante è Down lo rialza
    if SBUtilita.Down then
    begin
      SBUtilita.Down := False;
      SBUtilitaClick(Self);
    end;
    // IMposta il Tag del menu per indicare che si vuole il menu delle UTILITA
    MenuUtilita.Tag := 1;
    // Popola il menu e lo visualizza
    RiempiMenuUtilita;
    VisualizzaUtilita;
    // Focus sul menu
    MenuUtilita.SetFocus;
    // Se il pulsante è alzato deve sparire il relativo menù
  end
  else
  begin
    // Se il menù è aperto chiude il menù
    if PanelMenuUtilita.Visible then
      ChiudiUtilita
    else
      SBImpostazioni.Down := True;
  end;
end;

procedure TmainForm.VisualizzaAvvio(LoadBitmap: Boolean);
begin
  try
    // Rende visibile anche il pulsante di avvio per il dispositivo biometrico
    AvviaLevanteBiometrico.Visible := True;

    // Azzera l'IDOperatore corrente
    if not mainForm.ModoAssistenzeRDP then
      DM1.IDOperatoreCorrente := '';
    // Visualizza ilo StartFrame
    StartFrame.Show;
    StartFrame.Update;

    // Messaggio da non visualizzare al primo avvio del programma
    if (SplashForm = nil) and (not IsLevanteLight) then
      DM1.ShowWait('Levante', 'Caricamento elenco aziende...');
    // Apre solo il database generale per prelevare l'elenco delle aziende
    // selezionabili. (NB: Secondo parametro = False per fare in modo che
    // non si colleghi al database dei dati dell'azienda selezionata,
    // soprattutto perchè a questo punto ancora non c'è un'azienda
    // selezionata)
    DM1.AttivaTabelle(True, False);
    // Precarica le aziende presenti nella ComboBox di selezione
    CaricaElencoAziende;
    // La ComboBox di selezione dell'azienda contiene il nome dell'ultime azienda corrente
    StartFrame.CBAzienda.ItemIndex := StartFrame.CBAzienda.Items.IndexOf(DM1.AziendaCorrente);
    // Azzera Nome utente e password
    StartFrame.EditUID.Text := '';
    StartFrame.EditPassword.Text := '';
    // Se il modulo password è attivo
    if (StrToInt(DM1.SKeyData[MOD_PASSWORD]) > 0) or mainForm.IsLevanteLight then
    begin
      StartFrame.LabelUID.Font.Color := clBlack;
      StartFrame.LabelPassword.Font.Color := clBlack;
      StartFrame.EditUID.Color := COLOR_MODIFICA;
      StartFrame.EditUID.Enabled := True;
      StartFrame.EditPassword.Color := COLOR_MODIFICA;
      StartFrame.EditPassword.Enabled := True;
      StartFrame.CBAzienda.Color := COLOR_MODIFICA;
      StartFrame.CBAzienda.Enabled := True;
      // Focus sul nome utente
      if StartFrame.Visible then
        StartFrame.EditUID.SetFocus;
    end
    else
    begin
      StartFrame.LabelUID.Font.Color := $00CCCCCC;
      StartFrame.LabelPassword.Font.Color := $00CCCCCC;
      StartFrame.EditUID.Color := COLOR_NORMALE;
      StartFrame.EditUID.Enabled := False;
      StartFrame.EditPassword.Color := COLOR_NORMALE;
      StartFrame.EditPassword.Enabled := False;
      StartFrame.CBAzienda.Color := COLOR_MODIFICA;
      StartFrame.CBAzienda.Enabled := True;
      // Focus sull'elenco delle aziende
      StartFrame.CBAzienda.SetFocus;
    end;
    // Se siamo in modalità Levante Light e i dati utente non sono
    // validi forza la visualizzazione delle form per l'inserimento
    // dei dati stessi
    // Se siamo in modelità Levante light carica i dati per l'accesso a questa modalità
    if mainForm.IsLevanteLight then
    begin
      // Se siamo in Levante Light precarica i dati dell'utente per questa modalità
      mainForm.LevanteLight_CaricaDatiUtente;
      // Se i dati utente non sono validi visualizza l'apposito pannello
      // da dove si possono correggere/inserire.
      if not mainForm.LevanteLight_DatiUtenteCorretti then
      begin
        // imposta il frame dei dati utente levante light
        StartFrame.SpeedButtonRollOver10.Visible := False;
        StartFrame.SBGridOK.Visible := True;
        StartFrame.PanelDatiUtenteLevanteLight.Visible := True;
        StartFrame.EditRagSoc.SetFocus;
      end;
    end;
  finally
    // A questo punto se è apertala splash form la chiude
    if SplashForm <> nil then
    begin
      TimerStartStop.Interval := 300;
      TimerStartStop.Tag := 1;
      TimerStartStop.Enabled := True;
    end;
    // CHiude la finestra dei messaggi
    DM1.CloseWait;
  end;
end;

procedure TmainForm.TimerStartStopTimer(Sender: TObject);
begin
  TimerStartStop.Enabled := False;
  case TimerStartStop.Tag of

    // Se viene chiamato all'avvio dell'applicazione effettua il FadeOut
    // della splash form, che viene fatto quì perchè altrimenti non
    // si vede la dissolvenza.
    1:
      begin
        // Se è una versione DEMO ed se non è già stata visualizzata, visualizza
        // la form con  le informazioni sul periodo demo
        if D_MODE and not DM1.DemoFlags.InfoDemoShowed then
        begin
          // Messaggio informativo
          DM1.Messaggi('Informazioni Versione Dimostrativa', 'Lev@nte è in esecuzione in versione dimostrativa.'#13#13#13'Mancano ' +
            IntToStr(DM1.DemoFlags.GiorniMancantiFineDemo) + ' giorni alla fine del periodo demo.',
            'NB: Per ulteriori informazioni o aiuto sull''utilizzo del programma chiamare il CENTRO SERVIZI: 0541/475704'#13#13'NB: Nella versione dimostrativa alcune funzionalità NON sono attive.',
            [mbOk], 0, nil);
          // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
          // NB: IMposta anche altre variabili globali per la versione ecc.
          mainForm.Caption := mainForm.NomeApplicazione + ' ' + VersioneApplicazione + ' - (Versione Demo: ' + IntToStr(DM1.DemoFlags.GiorniMancantiFineDemo) +
            ' giorni alla scadenza)';
          // IMposta il flag
          DM1.DemoFlags.InfoDemoShowed := True;
        end;
        // Ovviamente solo se è aperta
        if SplashForm <> nil then
          SplashForm.Close;
        // Esegue il controllo di backup
        // NB: Solo se non è in modalità di Ristrutturazione altrimenti rompe
        if (not DM1.ModoRistrutturazioneArchivi) and (not MagKioskMode) and (not IsLevanteLight) and (not ModoAssistenzeRDP) then
          DM1.BackupCheck;
        // Se siamo in modalità Assistenze/Manutenzioni RDP (Mobile) allora entra subito
        // senza attendere l'inserimento di nome utente e password
        if ModoAssistenzeRDP then
          StartFrame.EntraInAzienda(False)
        else
          // Carica la cover
          StartFrame.ShowCover(True);
      end;

    // Se viene chiamato all'uscita dall'azienda per ritornare alla schermata di Login
    2:
      begin
        // Riporta la MainForm a 1024 x 768 di risoluzione
        // Altrimenti la visualizzazione della cover fa schifo
        // MainForm.WindowState := wsNormal;
        // MainForm.Width       := MAINFORM_WIDTH;
        // MainForm.Height      := MAINFORM_HEIGHT;
        // Si disconnette dal database dell'azienda
        // e poi quando è sicuro che la disconnessione
        // è stata effettuata, rivisualizza il Login.
        // NB: Tutto questo per evitare ritardi di visualizzazione
        // quando si esce per ritornare al Login.
        // NB: Tutto questo perchè altrimenti quando si usciva veniva visualizzata
        // la schermata di Login con nella parte centrale ancora la schermata sotto
        // e questo era piuttosto brutto. Visto che il problema era dovuto
        // all'attesa della disconnessione dai databases ho escogitato questo sistema
        // per risolverlo.
        DM1.ShowWait('Levante', 'Disconnessione database generale');
        DM1.DBGenerale.Disconnect;
        while DM1.DBGenerale.Connected do
          Application.ProcessMessages; // Attende l'effettiva disconnessione dal database
        DM1.ShowWait('Levante', 'Disconnessione database dell''azienda');
        DM1.DBAzienda.Disconnect;
        while DM1.DBAzienda.Connected do
          Application.ProcessMessages; // Attende l'effettiva disconnessione dal database
        // Apre la schermata Di Login
        OpenStartFrame;
        // Fa riapparire la form
        mainForm.FormFadeIn(mainForm);
      end;

    // Se viene chiamato all'uscita dell'applicazione effettua il FadeOut
    // della splash form.
    9:
      begin
        if SPLASH_FORM_ON_EXIT_ENABLED then
        begin
          // Chiude la form principale
          mainForm.Hide;
          Sleep(SPLASH_FORM_ON_EXIT_MILLISECONDS);
          // Ovviamente solo se è aperta
          if SplashForm <> nil then
            SplashForm.Close;
          // Chiude l'applicazione
          Application.Terminate;
        end;
      end;

  end;
  // Reset del Tag
  TimerStartStop.Tag := 0;
end;

procedure TmainForm.OpenStartFrame;
// const
// C_PASSO = 30;
// C_DELAY = 3;
begin
  DM1.ShowWait('Levante', 'Inizializzazione Login');

  // Apre lo startFrame con una animazione
  // StartFrame.Top := StartFrame.Height * (-1);
  StartFrame.Visible := True;
  // while StartFrame.Top < 0 do begin
  // StartFrame.Top := StartFrame.Top + C_PASSO;
  // StartFrame.Update;
  // Sleep(C_DELAY);
  // end;
  // StartFrame.Top := 0;
  // Chiamata per reimpostare la schermata di login
  VisualizzaAvvio(False);
end;

procedure TmainForm.CloseStartFrame;
// const
// C_PASSO = 60;
// C_DELAY = 3;
begin
  // Fà sparire la cover
  // StartFrame.ShowCover(False);
  // Chiude lo Startframe con una animazione
  // while StartFrame.Top > StartFrame.Height * (-1) do begin
  // StartFrame.Top := StartFrame.Top - C_PASSO;
  // MainForm.Update;
  // Sleep(C_DELAY);
  // end;
  // Libera la spazio occupato dalla Bitmap (è grossa)
  // StartFrame.Sfondo.Picture := nil;
  // StartFrame invisibile
  StartFrame.Visible := False;
  // Rende invisibile anche il pulsante di avvio per il dispositivo biometrico
  AvviaLevanteBiometrico.Visible := False;
end;

procedure TmainForm.ListViewExpDocAdvancedCustomDraw(Sender: TCustomListView; const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  Y, BottomFixedPosition: Integer;
  UpperBitmap: TBitmap;
begin
  // Inizializzazione
  Y := 0;
  BottomFixedPosition := ImageRightPanelBottomFixed.Top - ListViewExpDoc.Top;
  UpperBitmap := ImageRightPanelStretched.Picture.Bitmap;
  // Carica la bitmap della parte variabile superiore per simulare la trasparenza nella
  // parte alta della bacheca
  repeat
    ListViewExpDoc.Canvas.Draw((0 - ListViewExpDoc.Left), Y, ImageRightPanelStretched.Picture.Bitmap);
    Inc(Y, UpperBitmap.Height);
  until Y > BottomFixedPosition;
  // Carica la bitmap della parte fissa inferiore per simulare la trasparenza nella
  // parte bassa della bacheca
  ListViewExpDoc.Canvas.Draw((0 - ListViewExpDoc.Left), BottomFixedPosition, ImageRightPanelBottomFixed.Picture.Bitmap);
end;

procedure TmainForm.SBRubricaPaint(Sender: TObject);
const
  // Costanti contenenti i parametri di visualizzazione del MainMenu
  MM_INDENT_LEFT_MARGIN = 7;

  MM_ITEM_LEFT_MARGIN = 25;
  MM_ITEM_CAPTION_LEFT_MARGIN = 18;
  MM_ITEM_CAPTION_LEFT_MARGIN_SELECTED = 28;
  MM_ITEM_CAPTION_TOP_MARGIN = 2;
  MM_ITEM_CAPTION_TOP_MARGIN_SELECTED = 3;
  MM_ITEM_CAPTION_RIGHT_MARGIN = 20;

  MM_SELECTED_CAPTION_LEFT_MARGIN = 6;
  MM_SELECTED_CAPTION_TOP_MARGIN = 3;
  MM_SELECTED_CAPTION_RIGHT_MARGIN = 30;

  MM_DATA_LEFT_MARGIN = 6;
  MM_DATA_RIGHT_MARGIN = 20;
  MM_DATA_TOP_MARGIN = 24;
  MM_DATA_VERT_SEPARATION = 15;

  MM_SELECTED_START_INDEX = 0;
  MM_ITEM_START_INDEX = 3;
var
  CT, XX, YY, TmpInt: Integer;
begin
  // CT COntiene il valore di Tag della TPAintBox del pulsante attuale
  CT := (Sender as TPaintBox).Tag;
  // Per comodità...
  with Sender as TPaintBox do
  begin
    // Se l'oggetto è visibile continua altrimenti è inutile
    if Visible then
    begin
      // IMposta il colore delle righe a SX di unione delle voci
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psSolid;
      Canvas.Pen.Color := $00D4A08B;

      // Se si stà visualizzando un separatore...
      if LeftStr(Name, 12) = 'MMSeparatore' then
      begin
        // Se si tratta del primo separatore e siamo un FastSelectionMode
        // fa in modo che vengano tracciate due linee orizzontali per separare
        // bene la parte dei Soggetti/Pratiche/Impianti dal resto
        if (DM1.FastSelectionMode) and (Name = 'MMSeparatore1') then
        begin
          Canvas.Pen.Color := $00F7E2DA;
          TmpInt := Height div 2;
          Canvas.MoveTo(0, TmpInt - 3);
          Canvas.LineTo(Width, TmpInt - 3);
          Canvas.MoveTo(0, TmpInt + 0);
          Canvas.LineTo(Width, TmpInt + 0);
          Canvas.Pen.Color := $00F1CFC0;
          Canvas.MoveTo(0, TmpInt - 1);
          Canvas.LineTo(Width, TmpInt - 1);
          Canvas.MoveTo(0, TmpInt - 2);
          Canvas.LineTo(Width, TmpInt - 2);
          // Altrimenti visualizza un separatore normale con la linea di
          // congiungimento verticale a sx di collegamento delle voci del manu
        end
        else
        begin
          Canvas.MoveTo(MM_INDENT_LEFT_MARGIN, 0);
          Canvas.LineTo(MM_INDENT_LEFT_MARGIN, Height);
        end;

        // Se si stà visualizzando un pulsante normale...
      end
      else if (Name <> 'SBSoggetto') and (Name <> 'SBPratica') and (Name <> 'SBAssistenza') then
      begin
        // Riga verticale superiore
        if ((Name <> MMFirst1) and (Name <> MMFirst2)) or
          ((Name = 'SBDocumenti') and ((ClientiForm.ID_ClienteCorrente <> -1) or (ClientiForm.ID_PraticaCorrente <> 0))) then
        begin
          Canvas.MoveTo(MM_INDENT_LEFT_MARGIN, 0);
          Canvas.LineTo(MM_INDENT_LEFT_MARGIN, Height div 2);
        end;
        // Riga orizzontale
        Canvas.MoveTo(MM_INDENT_LEFT_MARGIN, Height div 2);
        Canvas.LineTo(MM_ITEM_LEFT_MARGIN, Height div 2);
        // Riga verticale inferiore
        if (Name <> MMLast1) and (Name <> MMLast2) then
        begin
          Canvas.MoveTo(MM_INDENT_LEFT_MARGIN, Height div 2);
          Canvas.LineTo(MM_INDENT_LEFT_MARGIN, Height);
        end;

        // Visualizza la bitmap relativa al pulsante e al suo stato
        // NB: LASCIARE DOPPIO perchè altrimenti su Delphi XE2 a volte non la tracciava
        // oppure togliere il Dormant al caricamento delle bitmap
        Canvas.Draw(0, 0, MMImgList.Items[MM_ITEM_START_INDEX + MainMenuState[CT]]);
        Canvas.Draw(0, 0, MMImgList.Items[MM_ITEM_START_INDEX + MainMenuState[CT]]);

        // Imposta il font per i titolo da del pannello
        Canvas.Font.Name := 'Verdana';
        Canvas.Font.Size := 8;
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Style := bsClear; // NB: Testo trasparente
        case MainMenuState[CT] of
          MM_ITEM_DISABLED:
            Canvas.Font.Color := $00D4A08B;
          MM_ITEM_ENABLED:
            Canvas.Font.Color := $0074331D;
          MM_ITEM_SELECTED:
            Canvas.Font.Color := clWhite;
        end;
        // Visualizza il testo
        if MainMenuState[CT] = MM_ITEM_SELECTED then
          Canvas.TextOut(MM_ITEM_CAPTION_LEFT_MARGIN_SELECTED, MM_ITEM_CAPTION_TOP_MARGIN_SELECTED, MainMenuCaptions[CT])
        else
          Canvas.TextOut(MM_ITEM_CAPTION_LEFT_MARGIN, MM_ITEM_CAPTION_TOP_MARGIN, MainMenuCaptions[CT]);

        // Se è in pulsante delle comunicazioni...
        // E se il numero di nuove comunicazioni automatiche presenti > 0
        if (Name = 'SBComunicazioni') and (ComAuto_Count > 0) then
          TracciaQtaNuoveComAuto((Sender as TPaintBox), IntToStr(ComAuto_Count));

        // Se invece si stà visualizzando un pannello del soggetto selezionato oppure la pratica selezionata...
      end
      else
      begin
        // Riga inferiore
        Canvas.MoveTo(MM_INDENT_LEFT_MARGIN, Height div 2);
        Canvas.LineTo(MM_INDENT_LEFT_MARGIN, Height);

        // Visualizza la bitmap relativa al pannello e al suo stato
        // NB: LASCIARE DOPPIO perchè altrimenti su Delphi XE2 a volte non la tracciava
        // oppure togliere il Dormant al caricamento delle bitmap
        Canvas.Draw(0, 0, MMImgList.Items[MM_SELECTED_START_INDEX + MainMenuState[CT]]);
        Canvas.Draw(0, 0, MMImgList.Items[MM_SELECTED_START_INDEX + MainMenuState[CT]]);

        // Imposta il font per i titolo da del pannello
        Canvas.Font.Name := 'Verdana';
        Canvas.Font.Size := 7;
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Style := bsClear; // NB: Testo trasparente
        case MainMenuState[CT] of
          MM_ITEM_DISABLED:
            Canvas.Font.Color := $00D4A08B;
          MM_ITEM_ENABLED:
            Canvas.Font.Color := $0074331D;
          MM_ITEM_SELECTED:
            Canvas.Font.Color := $0074331D;
        end;
        // Visualizza la caption del pannello
        Canvas.TextOut(MM_SELECTED_CAPTION_LEFT_MARGIN, MM_SELECTED_CAPTION_TOP_MARGIN, MainMenuCaptions[CT]);

        // Imposta il font per i dati da visualizzare dentro al pannello
        Canvas.Font.Name := 'Verdana';
        Canvas.Font.Size := 7;
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Style := bsClear; // NB: Testo trasparente
        case MainMenuState[CT] of
          MM_ITEM_DISABLED:
            Canvas.Font.Color := $00D4A08B;
          MM_ITEM_ENABLED:
            Canvas.Font.Color := $0074331D;
          MM_ITEM_SELECTED:
            Canvas.Font.Color := clWhite;
        end;
        XX := MM_DATA_LEFT_MARGIN;
        YY := MM_DATA_TOP_MARGIN;
        // Se si tratta del soggetto selezionato...
        if Name = 'SBSoggetto' then
        begin
          // Visualizza i dati
          Canvas.Font.Style := [fsBold];
          Canvas.TextOut(XX, YY, ClipTextForMenuPaint(Canvas, XX, ClientiForm.RagSocCS));
          Canvas.Font.Style := [];
          Inc(YY, MM_DATA_VERT_SEPARATION);
          Canvas.TextOut(XX, YY, ClipTextForMenuPaint(Canvas, XX, 'Tel.'));
          Canvas.TextOut(XX + 30, YY, ClipTextForMenuPaint(Canvas, XX, ClientiForm.TelefonoCS));
          Inc(YY, MM_DATA_VERT_SEPARATION);
          Canvas.TextOut(XX, YY, ClipTextForMenuPaint(Canvas, XX, 'Cell.'));
          Canvas.TextOut(XX + 30, YY, ClipTextForMenuPaint(Canvas, XX, ClientiForm.CellulareCS));
          // Se invece si tratta della pratica selezionata...
        end
        else if (Name = 'SBPratica') or (Name = 'SBAssistenza') then
        begin
          // Visualizza i dati
          Canvas.Font.Style := [fsBold];
          Canvas.TextOut(XX, YY, ClipTextForMenuPaint(Canvas, XX, ClientiForm.DescPraticaCorrente));
          Canvas.Font.Style := [];
          Inc(YY, MM_DATA_VERT_SEPARATION);
          Canvas.TextOut(XX, YY, ClipTextForMenuPaint(Canvas, XX, ClientiForm.ComunePraticaCorrente));
          Inc(YY, MM_DATA_VERT_SEPARATION);
          Canvas.TextOut(XX, YY, ClipTextForMenuPaint(Canvas, XX, ClientiForm.IndirizzoPraticaCorrente));
        end;
      end;
    end;
  end;
end;

// Procedure che disegna il numero di nuovi messaggi automatici pronti da inviare sul
// pulsante delle comunicazioni nel menù principale.
procedure TmainForm.TracciaQtaNuoveComAuto(PB: TPaintBox; T: String);
const
  LABEL_RIGHT = 5;
  LABEL_TOP = 2;
var
  LabelWidth, LabelLeft: Integer;
  PrecFont: TFont;
begin
  // Salva il font
  PrecFont := TFont.Create;
  PrecFont.Assign(PB.Canvas.Font);
  try
    // Inizializzazione
    PB.Canvas.Font.Size := 8;
    PB.Canvas.Font.Style := [fsBold];
    // Determina la largezza della label con il numero
    LabelWidth := PB.Canvas.TextWidth(T);
    // Determina la posizione orizzontale delle label con il numero
    LabelLeft := PB.Width - LabelWidth - LABEL_RIGHT;
    // Traccia il testo
    PB.Canvas.TextOut(LabelLeft, LABEL_TOP, T);
    // Ripristina il font
  finally
    PB.Canvas.Font.Assign(PrecFont);
    PrecFont.Free;
  end;
end;

// FUnzione che effettua il clipping per non far sconfinare il testo nelle
// captions del menù principale
function TmainForm.ClipTextForMenuPaint(Canvas: TCanvas; LeftPos: Integer; StrIn: String): String;
const
  MAX_RIGHT_BORDER = 190;
var
  MaxWidth: Integer;
begin
  // Cicla finchè la scritta non risntra nella larghezza specificato togliendo un carattere alla volta
  Result := StrIn;
  MaxWidth := MAX_RIGHT_BORDER - LeftPos;
  while Canvas.TextWidth(Result) > MaxWidth do
    Result := LeftStr(Result, Length(Result) - 1);
end;

procedure TmainForm.MainLeftPanelDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  // Cerca di riconoscere il mittente per accettare o meno l'operazione
  // ------------------------------------------------------------------
  // Se il mittente proviene da una TcxGrid o TcxView...
  // Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
  // che le griglie DevExpress passano surante il DragAndDrop.
  if Source is TcxDragControlObject then
  begin
    // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
    if TcxDragControlObject(Source).Control is TcxGridSite then
    begin
      // La vista diventa il controllo predefinito per comodità
      with TcxGridSite(TcxDragControlObject(Source).Control).GridView do
      begin
        // Controlla se la vista è tra quelle da riconoscere
        if (Name = 'tvRubrica') or (Name = 'tvPrat') or (Name = 'tvAssistenze') then
          Accept := True;
      end;
    end;
  end;
end;

{ procedure TLevanteMainForm.ApriTeletrasporto;
  var
  Qry : TIB_Cursor;
  begin
  // Se il codice di attivazione non è valido esce subito
  if not DM1.VerificaCodiceAttivazioneTeletrasporto then begin
  raise Exception.Create('CODICE DI ATTIVAZIONE NON VALIDO !!!'#13#13'Chiamare il centro servizi.');
  end;
  // Se il teletrasporto è già aperto esce
  if ScambioDocForm <> nil then begin
  // Il pulsante Impostazioni deve tornare NON PREMUTO
  MainForm.SBUtilita.Down := False;
  // Messaggio ed uscita
  DM1.Messaggi('Informazione.', 'Il Teletrasporto è già attivo.', '', [mbOK], 0, nil);
  Exit;
  end;
  // Preleva e memorizza in una apposita variabile globale la partita iva dell'azienda
  //  per utilizzarlo come codice univoco per l'interscambio dei documenti
  Qry := TIB_Cursor.Create(Self);
  try
  DM1.ShowWait(SHOW_WAIT_TITLE, 'Checking global code...');
  // Imposta la query per prelevare la PIVA dell'azienda
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  Qry.SQl.Add('SELECT P_IVA, CA_PID FROM DATIAZIE');
  Qry.Open;
  if not Qry.Eof then begin
  // Se il codice utente per il sistema di interscambio dei documento è '' chiude
  //  tutto perchè un codice valido deve esserci per forza, ovviamente
  if Qry.Fields[0].AsString = '' then begin
  // Solleva un'eccezione
  raise Exception.Create('Codice globale azienda non valido');
  end;
  DM1.ShowWait(SHOW_WAIT_TITLE, 'System initialization...');
  // Crea la form di interscambio dei documenti
  Application.CreateForm(TScambioDocForm, ScambioDocForm);
  ScambioDocForm.Parent := MainRightPanel.Parent;
  // Inizializzazione codice azienda
  ScambioDocForm.DXC_CodiceAzienda := Qry.Fields[0].AsString;
  ScambioDocForm.DXC_PidAzienda := Qry.Fields[1].AsString;
  //  Visualizza la form
  ScambioDocForm.Show;
  // Chiude la query
  Qry.Close;
  end else begin
  // Solleva un'eccezione
  raise Exception.Create('Dati azienda non trovati.');
  end;
  finally
  DM1.CloseWait;
  Qry.Free;
  // Il pulsante Impostazioni deve tornare NON PREMUTO
  MainForm.SBUtilita.Down := False;
  end;
  end;
}
procedure TmainForm.ApriTeletrasporto(Hidden: Boolean = False);
var
  Local_PIVA, Local_PID: String;
begin
  // Se il codice di attivazione non è valido esce subito
  if not DM1.VerificaCodiceAttivazioneTeletrasporto then
  begin
    raise Exception.Create('CODICE DI ATTIVAZIONE NON VALIDO !!!'#13#13'Chiamare il centro servizi.');
  end;
  // Se il teletrasporto è già aperto esce
  if ScambioDocForm <> nil then
  begin
    // Il pulsante Impostazioni deve tornare NON PREMUTO
    mainForm.SBUtilita.Down := False;
    // Messaggio ed uscita
    DM1.Messaggi('Informazione.', 'Il Teletrasporto è già attivo.', '', [mbOk], 0, nil);
    Exit;
  end;
  // In base alla modalità (LevanteLight) carica in alcune variabili locali i dati
  // di identificazione per l'invio/ricezione dei documenti
  try
    DM1.ShowWait(SHOW_WAIT_TITLE, 'Checking global code...');
    // In base alla modalità carica i dati di identificazione appropriati
    if IsLevanteLight then
    begin
      Local_PIVA := Trim(StartFrame.EditPIVA.Text);
      Local_PID := Trim(StartFrame.EditPID.Text);
    end
    else
    begin
      Local_PIVA := Trim(DM1.TableDatiAziendaP_IVA.AsString);
      Local_PID := Trim(DM1.TableDatiAziendaCA_PID.AsString);
    end;
    // Se il codice utente per il sistema di interscambio dei documento è '' chiude
    // tutto perchè un codice valido deve esserci per forza, ovviamente
    if Local_PIVA = '' then
    begin
      // Solleva un'eccezione
      raise Exception.Create('Codice globale azienda non valido');
    end;
    DM1.ShowWait(SHOW_WAIT_TITLE, 'System initialization...');
    // Crea la form di interscambio dei documenti
    Application.CreateForm(TScambioDocForm, ScambioDocForm);
    ScambioDocForm.Parent := MainRightPanel.Parent;
    // Se l'apposito flag indica che il teletrasporto non deve essere visibile
    // semplicemente lo sposta fuori dallo schermo
    if Hidden then
      ScambioDocForm.Top := 10000;
    // Inizializzazione codice azienda
    ScambioDocForm.DXC_CodiceAzienda := Local_PIVA;
    ScambioDocForm.DXC_PidAzienda := Local_PID;
    // Se siamo in modalità Levante Light imposta l'Alpha Blend
    // in modo che la form sia invisibile
    if mainForm.IsLevanteLight then
    begin
      ScambioDocForm.Left := 0 - ScambioDocForm.Width;
    end;
    // Visualizza la form
    ScambioDocForm.Show;
  finally
    DM1.CloseWait;
    // Il pulsante Impostazioni deve tornare NON PREMUTO
    mainForm.SBUtilita.Down := False;
  end;
end;

// =============================================================================
// INIZIO - PARTE PER LA TRASPARENZA E L'EFFETTO FADE IN/OUT DELLE FORM
// -----------------------------------------------------------------------------
procedure TmainForm.FormFadeOut(F: TForm);
var
  i: Integer;
begin
  // Non serve più da quando la MainForm e la StartFrame sono a tutto schermo
  Exit;
  // Fà sparire la splash form con un FadeOut
  if not F.AlphaBlend then
    F.AlphaBlend := True;
  try
    // NB: Se non siamo in modalità Levante Light non effettua nessuna dissolvenza e mette
    // la form completamente opaca perchè altrimenti in teleassistenza è lentissimo
    if mainForm.IsLevanteLight then
    begin
      // Imposta il valore iniziale di opacità della form a completamente opaco
      // per poi iniziare la dissolvenza
      i := 255;
      // Cicla per effettuare la dissolvenza
      while i > 0 do
      begin
        F.AlphaBlendValue := i;
        Application.ProcessMessages;
        dec(i, 50);
        Sleep(20);
      end;
    end;
  finally
    // Impostazione finale a completamente trasparente
    F.AlphaBlendValue := 0;
    Application.ProcessMessages;
  end;
end;

procedure TmainForm.FormFadeIn(F: TForm);
var
  i: Integer;
begin
  try
    Application.ProcessMessages;
    // Se la form è comletamente opaca esce subito
    if not F.AlphaBlend then
      Exit;
    // NB: Se non siamo in modalità Levante Light non effettua nessuna dissolvenza e mette
    // la form completamente opaca perchè altrimenti in teleassistenza è lentissimo
    if mainForm.IsLevanteLight then
    begin
      // Impostazione iniziale del livello di trasparenza
      i := F.AlphaBlendValue;
      // CIcla per effettuare l'effetto di dissolvenza
      while i < 255 do
      begin
        F.AlphaBlendValue := i;
        Application.ProcessMessages;
        Inc(i, 50);
        Sleep(20);
      end;
    end;
  finally
    // Alla fine si assicura che la form sia completamente opaca
    // NB: Se siamo in modalità normale (non levantelight pone proprio
    // la proprietà AlphaBlend = False per scongiurare a priori qualunque problema
    // potesse derivare dalla trasparenza
    if mainForm.IsLevanteLight then
      F.AlphaBlendValue := 255
    else
      F.AlphaBlend := False;
    Application.ProcessMessages;
  end;
end;

procedure TmainForm.FormInitFullTrasparent(F: TForm);
begin
  F.AlphaBlend := True;
  F.AlphaBlendValue := 0;
end;

procedure TmainForm.FormInitFullOpaque(F: TForm);
begin
  F.AlphaBlend := False;
  F.AlphaBlendValue := 255;
end;
// -----------------------------------------------------------------------------
// FINE - PARTE PER LA TRASPARENZA E L'EFFETTO FADE IN/OUT DELLE FORM
// =============================================================================

procedure TmainForm.AvviaLevanteBiometricoClick(Sender: TObject);
begin
  StartFrame.ButtonAvvioClick(StartFrame.ButtonAvvio);
end;

procedure TmainForm.SvuotaBachecaClick(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    // Chiede conferma
    if DM1.Messaggi('SvuotaBacheca', 'Svuotare la bacheca?', '', [mbYes, mbNo], 0, nil) = mrYes then
    begin
      // Imposta la query che svuoterà la bacheca e la esegue
      Qry.DatabaseName := DM1.GenDBFile;
      Qry.IB_Connection := DM1.DBGenerale;
      Qry.SQL.Add('DELETE FROM TMPRIGHI WHERE STATION_ID = ' + DM1.CodiceUtente);
      Qry.ExecSQL;
      // Aggiorna la visualizzazione della bacheca
      AggiornaDocumentiEsportati;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TmainForm.eGruppoAgendaPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(GRUPPO) FROM TECNICI');

    // Se è stata specificata una restrizione nel'accesso alle risorse
    // dell'agenda per utente la applica
    if DM1.LimitazioniRisorseAgendaPerUtente <> '' then
    begin
      Qry.SQL.Add('WHERE');
      Qry.SQL.Add(DM1.LimitazioniRisorseAgendaPerUtente);
    end;

    Qry.Open;
    (Sender as TcxComboBox).Properties.Items.Clear;
    (Sender as TcxComboBox).Properties.Items.Add('');
    while not Qry.EOF do
    begin
      if Trim(Qry.Fields[0].AsString) <> '' then
        (Sender as TcxComboBox).Properties.Items.Add(Trim(Qry.Fields[0].AsString));
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TmainForm.eGruppoAgendaPropertiesChange(Sender: TObject);
var
  Qry: TIB_Cursor;
  i: Integer;
  Scelta: String;
begin
  // Sposta il focus (altrimenti rimane evidenziato il testo del
  // ComboBox e non mi piace.
  ClientiForm.Agenda.SetFocus;
  // Inizializzazione
  Scelta := Uppercase(Trim((Sender as TcxComboBox).Text));
  // Disabilita il tracciamento a video
  ClientiForm.Agenda.BeginUpdate;
  try
    // Imposta la query che mi ritornail numero delle risorse memorizzate
    Qry := TIB_Cursor.Create(Self);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT RESOURCEID, GRUPPO FROM TECNICI');

    // Se è stata specificata una restrizione nel'accesso alle risorse
    // dell'agenda per utente la applica
    if DM1.LimitazioniRisorseAgendaPerUtente <> '' then
    begin
      Qry.SQL.Add('WHERE');
      Qry.SQL.Add(DM1.LimitazioniRisorseAgendaPerUtente);
    end;

    Qry.Open;
    // Cicla per tutte le risorse disponibili
    while not Qry.EOF do
    begin
      // Cicla per tutte le risorse
      for i := 0 to Qry.RecordCount - 1 do
      begin
        // Se l'utente ha selezionato di visualizzare tutte le risorse le rende tutte visibili
        if Scelta = '' then
        begin
          ClientiForm.Agenda.Storage.Resources.ResourceItems.Items[i].Visible := True;
          // Se invece è stato scelto un gruppo...
        end
        else
        begin
          // Se la risorsa attuale è quella che cerchiamo controlla se il suo gruppo
          // è uguglae a quello selezionato sul combo box e se è così lo rende visibile
          // altrimenti invisibile.
          if ClientiForm.Agenda.Storage.Resources.ResourceItems.Items[i].ResourceID = Qry.FieldByName('RESOURCEID').AsInteger then
          begin
            ClientiForm.Agenda.Storage.Resources.ResourceItems.Items[i].Visible := (Uppercase(Trim(Qry.FieldByName('GRUPPO').AsString)) = Scelta);
          end;
        end;
      end;
      // Avanti il prossimo
      Qry.Next;
    end;
  finally
    // Disabilita il tracciamento a video
    ClientiForm.Agenda.EndUpdate;
    // Altre pulizie finali
    if Assigned(Qry) then
      Qry.Free;
  end;
end;

procedure TmainForm.AgendaDateNavigatorSelectionChanged(Sender: TObject; const AStart, AFinish: TDateTime);
begin
  // Se la CLientiForm ancora non esiste esce subito
  if not Assigned(ClientiForm) then
    Exit;

  try
    // In base alla modalità...
    if DM1.FastSelectionMode then
    begin
      // Aggiorna l'agenda laterale
      if not Assigned(ClientiForm.AgendaForm) then
        Exit;
      ClientiForm.AgendaForm.sbAgenda_RefreshClick(ClientiForm.AgendaForm.sbAgenda_Refresh);
    end
    else
    begin
      // Verifica che sia selezionata il Tab dell'agenda
      if ClientiForm.PageControl2.ActivePage <> ClientiForm.TabAgenda then
        Exit;
      // Richiama l'evento del pulsante TROVA
      ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
    end;
  finally
    // Pulizie finali
    // Application.ProcessMessages;
  end;
end;

procedure TmainForm.Incollalevociselezionatesuldocumento1Click(Sender: TObject);
begin
  // Questa funzionalità funziona solo verso i righi di un documento tipo (Preventivi, DDT, Fatture ecc).
  if not Assigned(PreventiviOrdiniForm) then
    Exit;
  // Esegue l'importazione nel corpo del documento
  PreventiviOrdiniForm.MIIncollaRighiSelezionatiClick(PreventiviOrdiniForm.MIIncollaRighiSelezionati);
  // Altrimenti non so perchè la ListViewExpDoc mi rimane un Dragging
  if ListViewExpDoc.Dragging then
    ListViewExpDoc.EndDrag(False);
end;

procedure TmainForm.Incollatuttelevocisuldocumento1Click(Sender: TObject);
var
  i: Integer;
begin
  // Questa funzionalità funziona solo verso i righi di un documento tipo (Preventivi, DDT, Fatture ecc).
  if not Assigned(PreventiviOrdiniForm) then
    Exit;
  // Seleziona tutte le voci presenti nella bacheca
  ListViewExpDoc.SelectAll;
  // Esegue l'importazione nel corpo del documento
  PreventiviOrdiniForm.MIIncollaRighiSelezionatiClick(PreventiviOrdiniForm.MIIncollaRighiSelezionati);
  // Altrimenti non so perchè la ListViewExpDoc mi rimane un Dragging
  if ListViewExpDoc.Dragging then
    ListViewExpDoc.EndDrag(False);
end;

procedure TmainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // ===========================================================================
  // SISTEMA DI LETTURA DEL CODICE A BARRE PER IL RICHIAMO DEI DOCUMENTI
  // ---------------------------------------------------------------------------
  // Se non siamo già in modalità di lettura barcode e inconta il carattere
  // di start/stop avvia il sistema di lettura dei codici a barre.
  if (not fReadingBarcode) and (Ord(Key) = fBarcodeStartCharCode) then
  begin
    fReadingBarcode := True;
    fBarcode := '';
    Key := #0;
    // Sesiamo già in lettura del codice a barre e incontra il carattere
    // di start/stop esce dalla modalità di lettura del codice a barre
    // e inoltra il codice letto alla form interessate
  end
  else if (fReadingBarcode) and (Ord(Key) = fBarcodeStartCharCode) then
  begin
    fReadingBarcode := False;
    Key := #0;
    if (ClientiForm <> nil) and (IsActiveForm('ClientiForm')) then
      ClientiForm.ProcessBarcode(fBarcode)
    else if (ImpegnoForm <> nil) and (IsActiveForm('ImpegnoForm')) then
      ImpegnoForm.ProcessBarcode(fBarcode)
    else if (PreventiviOrdiniForm <> nil) and (IsActiveForm('PreventiviOrdiniForm')) then
      PreventiviOrdiniForm.ProcessBarcode(fBarcode);
    // Se siamo in modalità di lettura del codice a barre aggiunge il carattere attuale
    // alla tringa che contiene il codice a barre in lettura.
  end
  else if (fReadingBarcode) then
  begin
    fBarcode := fBarcode + Key;
    Key := #0;
  end;
  // ===========================================================================
end;

function TmainForm.GetCLI_Param_Ristrutturazione: Boolean;
begin
  Result := (ParamStr(1) = 'R') or (ParamStr(1) = 'r');
//  Result := True;
end;

function TmainForm.GetBarcodeStartChar: Char;
begin
  Result := Chr(fBarcodeStartCharCode);
end;

procedure TmainForm.PanelTopStretchedResize(Sender: TObject);
begin
  mainForm.CalcolaLeftMainTopPanel(Sender as TPanel);
end;

procedure TmainForm.CalcolaLeftMainTopPanel(PanelTopStretched: TPanel);
var
  WidthDiff: Integer;
  MainTopPanel: TbmpPanel;
begin
  // Ricava il pannello dei pulsanti
  MainTopPanel := (PanelTopStretched.Parent.FindComponent('ClientTopPanel') as TbmpPanel);
  if MainTopPanel = nil then
    MainTopPanel := (PanelTopStretched.Parent.FindComponent('MainTopPanel') as TbmpPanel);
  // Effettua il calcolo della posizione del pannello con i pulsanti
  WidthDiff := PanelTopStretched.Width - MainTopPanel.Width;
  MainTopPanel.Left := Trunc(WidthDiff / 2);
  if MainTopPanel.Left < 0 then
    MainTopPanel.Left := 0;
  PanelTopStretched.Update;
  Application.ProcessMessages;
end;

procedure TmainForm.MainRightPanelResize(Sender: TObject);
begin
  ListViewExpDoc.Top := 107;
  ListViewExpDoc.Left := 3;
  ListViewExpDoc.Width := MainRightPanel.Width - 4;
  ListViewExpDoc.Height := MainRightPanel.Height - 240;
  // ListViewExpDoc.Height := MainRightPanel.Height - 265;
  // ListViewExpDoc.Height := MainRightPanel.Height - 276;

  SBImportPalmare.Top := ListViewExpDoc.Top + ListViewExpDoc.Height + 55;
  SBImportPalmare.Left := 33;
  // SBImportPalmare.Left := Round((MainRightPanel.Width - SBImportPalmare.Width) / 2);

  LabelAllegati.Top := ListViewExpDoc.Top + ListViewExpDoc.Height + 108;
  LabelAllegati.Left := 0;
end;

procedure TmainForm.SBImportPalmareClick(Sender: TObject);
begin
  DM1.ShowWait('Importazione Palmare', 'Operazione in corso...');
  try
    SBImportPalmare.Enabled := False;
    SBImportPalmare.Update;
    if PreventiviOrdiniForm <> nil then
    begin
      mainForm.SBImportPalmare.Enabled := False;
      mainForm.SBImportPalmare.Update;
    end;
    Zebex_2031_ScaricaArticoliInBacheca(1, 'COM1');
    mainForm.AggiornaDocumentiEsportati;
  finally
    SBImportPalmare.Enabled := True;
    SBImportPalmare.Update;
    if PreventiviOrdiniForm <> nil then
    begin
      mainForm.SBImportPalmare.Enabled := True;
      mainForm.SBImportPalmare.Update;
    end;
    DM1.CloseWait;
  end;
end;

procedure TmainForm.SBRubricaDblClick(Sender: TObject);
begin
  if not ClientiForm.QrySoggetti.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBDocumentiDblClick(Sender: TObject);
begin
  if not ClientiForm.QryDoc.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBGMDblClick(Sender: TObject);
begin
  if not ClientiForm.QryGM.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBCVDblClick(Sender: TObject);
begin
  if not ClientiForm.QryCV.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBArticoliDblClick(Sender: TObject);
begin
  if not ClientiForm.QryArticoli.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBPraticheDblClick(Sender: TObject);
begin
  if not ClientiForm.QryPratiche.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBScadenzeDblClick(Sender: TObject);
begin
  if not ClientiForm.QryScad.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBPrimanotaDblClick(Sender: TObject);
begin
  if not ClientiForm.QueryPrimanota.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBAssistenzeDblClick(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Caricamento...');
  TimerLaunchTabForms.Enabled := True;
end;

procedure TmainForm.SBImpegniDblClick(Sender: TObject);
begin
  if not ClientiForm.QryImp.Active then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBGCDblClick(Sender: TObject);
begin
  if (not TabGCForm.QryGC.Active) and (not TabGCForm.QryNewGC.Active) then
  begin
    DM1.ShowWait('Levante', 'Caricamento...');
    TabGCForm.TimerAutoqueryDblClick.Enabled := True;
  end;
end;

procedure TmainForm.SBGOSDblClick(Sender: TObject);
begin
  if (not ClientiForm.QryGOSOre.Active) and (not ClientiForm.QryGOSSpese.Active) then
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TmainForm.SBPartitarioDblClick(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Caricamento...');
  TimerLaunchTabForms.Enabled := True;
end;

procedure TmainForm.TimerLaunchTabFormsTimer(Sender: TObject);
begin
  try
    (Sender as TTimer).Enabled := False;
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
  finally
    DM1.CloseWait;
  end;
end;

procedure TmainForm.MenuBachecaPopup(Sender: TObject);
begin
  Incollalevociselezionatesuldocumento1.Enabled := Assigned(PreventiviOrdiniForm);
  Incollatuttelevocisuldocumento1.Enabled := Assigned(PreventiviOrdiniForm);
end;

// =============================================================================
// INIZIO DELLA GESTIONE DEL DRAG AND DROP DEI FILES SUL DESKTOP DI WINDOWS SUGLI ALLEGATI
// -----------------------------------------------------------------------------
// Procedure che registra nell'apposito array (stack) la FormAllegati ricevuta come parametro
// per poi essere in grado di inoltrare i WindowMessages di tipo WM_DROPFILES.
procedure TmainForm.AllegatiFormStack_Registra(AllegatiForm: TAllegatiForm);
var
  Last: Integer;
begin
  Last := Length(AllegatiFormStack);
  SetLength(AllegatiFormStack, Last + 1);
  AllegatiFormStack[Last] := AllegatiForm;
  // IMposta la nuova form allegati della stessa grandezza della precedente
  if Last > 0 then
  begin
    AllegatiForm.PrecSplitter := AllegatiFormStack[Last - 1].Splitter;
    AllegatiForm.PrecAllegatiForm := AllegatiFormStack[Last - 1];
    AllegatiForm.PrecAllegatiFormIndex := Last - 1;
  end;
end;

// Function che passandogli l'indice di una FormAllegati verifica se questa è presente ancora nello
// stack e se è presente ritorna True altrimenti False
function TmainForm.AllegatiFormStack_ExistsByIndex(Index: Integer): Boolean;
begin
  Result := (Index < (Length(AllegatiFormStack) - 1));
end;

// Procedure che deregistra dall'apposito array (stack) l'ultima FormAllegati registrata
procedure TmainForm.AllegatiFormStack_Elimina;
var
  Ultima, Penultima: TAllegatiForm;
  LastIndex: Integer;
begin
  // Inizializzazione
  LastIndex := Length(AllegatiFormStack) - 1;
  // Elimina la form allegati più recente
  SetLength(AllegatiFormStack, LastIndex);
end;

// Funzione che ritorna l'ultima FormAllegati presente nell'apposito stack
function TmainForm.AllegatiFormStack_GetLastAllegatiForm: TAllegatiForm;
var
  LastIndex: Integer;
begin
  // Inizializzazione
  Result := nil;
  LastIndex := Length(AllegatiFormStack) - 1;
  if LastIndex < 0 then
    Exit;
  Result := AllegatiFormStack[LastIndex];
end;

// -----------------------------------------------------------------------------
// FINE DELLA GESTIONE DEL DRAG AND DROP DEI FILES SUL DESKTOP DI WINDOWS SUGLI ALLEGATI
// =============================================================================





// =============================================================================
// INIZIO DELLA GESTIONE DEI WINDOWS MESSAGES DELLA MAIN FORM
// nb: La gestione dei WM relativi al SACS sono nell'apposita unit del SACS
// -----------------------------------------------------------------------------

// Override della Windows Procedure per gestire il WindowsMessage WM_DROPFILES necessario
// per il funzionamento del drag & drop dall'esterno del programma stesso.
procedure TmainForm.WndProc(var Msg: TMessage);
var
  LFileNameBuffer: array [0 .. MAX_PATH] of Char;
  LFileExtension: string;
begin
  inherited;
  // Gestione del WM_LEV_COM_AUTO_COUNT_UPDATE che aggiorna il numero di comunicazioni
  // automatiche ci sono pronte per essere inviate
  if (Msg.Msg = MsgLevComAutoCountUpdate) then
  begin
    ComAuto_Count := Msg.LParam;
  end
  else
    // Gestione del WM_DROPFILES
    if (Msg.Msg = WM_DROPFILES) and (Length(AllegatiFormStack) > 0) then
    begin
      DragQueryFile(TWMDROPFILES(Msg).Drop, 0, @LFileNameBuffer, sizeof(LFileNameBuffer));
      LFileExtension := ExtractFileExt(LFileNameBuffer);
      if Uppercase(LFileExtension) = '.XML' then
        SendMessage(ClientiForm.GridDoc.Handle, Msg.Msg, Msg.WParam, Msg.LParam)
      else
        SendMessage(AllegatiFormStack[Length(AllegatiFormStack) - 1].GridAllegati.Handle, Msg.Msg, Msg.WParam, Msg.LParam);
    end;
end;

// Effettua la registrazione dei messaggi necessari al funzionamento del sistema di
// backup, e memorizza nelle apposite variabili globali i codidi identificativi
// dei messaggi stessi.
procedure RegistraMessaggi;
begin
  // Registrazione del messaggio con il quale il ThreadLev richiede
  // l'aggiornamento del numero di comunicazioni automatiche pronte
  // per essere inviate ci sono nell'azienda corrente
  MsgLevComAutoCountUpdate := RegisterWindowMessage(WM_LEV_COM_AUTO_COUNT_UPDATE);
  // --------------------------------------------------------------------------
  // Verifica che tutti gli identificativi dei mesaggi siano validi e se non
  // lo sono solleva un'eccezione.
  if (MsgLevComAutoCountUpdate = 0) then
    raise Exception.Create('Errore durante la registrazione dei windows messages della MainForm.');
  // --------------------------------------------------------------------------
end;

// -----------------------------------------------------------------------------
// FINE DELLA GESTIONE DEI WINDOWS MESSAGES DELLA MAIN FORM
// nb: La gestione dei WM relativi al SACS sono nell'apposita unit del SACS
// =============================================================================

procedure TmainForm.SBComunicazioniDblClick(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Caricamento...');
  TimerLaunchTabForms.Enabled := True;
end;

procedure TmainForm.SetComAuto_ComunicazioniPronte(const Value: Integer);
begin
  if Value = fComAuto_ComunicazioniPronte then
    Exit;
  fComAuto_ComunicazioniPronte := Value;
  // Forza l'aggiornamento dello schermo
  SBComunicazioni.Invalidate;
end;

procedure TmainForm.SetParentComponent(const ANewComponent: TControl);
begin
  if mainForm.ModoAssistenzeRDP then
  begin
    ANewComponent.Align := alClient;
    ANewComponent.Parent := AssistenzeMobileMainForm.TabImpegno;
  end
  else
    ANewComponent.Parent := Self;
end;

procedure TmainForm.Refresh1Click(Sender: TObject);
begin
  AggiornaDocumentiEsportati;
end;

// =============================================================================
// INIZIO GESTIONE AVVIO DRAGDROP DAL SOGGETTO/PRATICA/IMPIANTO SELEZIONATO
// NB: Siccome non funzionavano bene ne DragMode = dmAutomatic ne altro
// ho deciso di gestire completamente l'avvio del DragDrop con codice
// scritto da me e così funziona
// -----------------------------------------------------------------------------
procedure TmainForm.SBSoggettoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MMDragDrop_MouseDownPos := Mouse.CursorPos;
end;

procedure TmainForm.SBSoggettoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (MMDragDrop_MouseDownPos.X <> 0) and ((Abs(Mouse.CursorPos.X - MMDragDrop_MouseDownPos.X) > 10) or
    (Abs(Mouse.CursorPos.Y - MMDragDrop_MouseDownPos.Y) > 10)) then
  begin
    (Sender as TPaintBox).OnClick := nil;
    try
      (Sender as TPaintBox).BeginDrag(True);
    finally
      (Sender as TPaintBox).OnClick := SBRubricaClick;
    end;
  end;
end;

procedure TmainForm.SBSoggettoEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  MMDragDrop_MouseDownPos.X := 0;
  MMDragDrop_MouseDownPos.Y := 0;
end;

procedure TmainForm.SBSoggettoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MMDragDrop_MouseDownPos.X := 0;
  MMDragDrop_MouseDownPos.Y := 0;
end;
// -----------------------------------------------------------------------------
// FINE GESTIONE AVVIO DRAGDROP DAL SOGGETTO/PRATICA/IMPIANTO SELEZIONATO
// =============================================================================

end.
