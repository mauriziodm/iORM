unit FormAnagArt;
                                                                                                                               
interface

uses
  Windows, Messages, Classes, System.SysUtils, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, DB, Menus, IniFiles,
  IBODataset,
  IB_Components, Buttons, bmpPanel,
  MAURI_SB, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, SchedaPreventiviOrdini,
  AppEvnts, cxCheckBox, cxDBEdit, cxImage, cxStyles,
  cxGraphics, cxDBData, cxGroupBox,
  cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxPC, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, cxDBLookupComboBox, cxSplitter, FormAllegati,
  dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations;

  const
  // COstanti che indica il TabiIndex dei Tabs presenti nella parte
  //  supuriore del documento e che compare negli interventi o negli
  //  articoli composti
  DOCTABIDX_APPUNTAMENTO          = 0;
  DOCTABIDX_RICAMBIMANODOPERA     = 1;
  DOCTABIDX_OPERAZIONIPIANIFICATE = 2;
  DOCTABIDX_INTERVENTIPRECEDENTI  = 3;
  DOCTABIDX_ALLEGATI              = 4;
  DOCTABIDX_ANAGRAFICAARTICOLO    = 5;
  DOCTABIDX_DISTINTABASE          = 6;
  DOCTABIDX_MAPPA                 = 7;

type
  TAnagArtForm = class(TForm)
    QryMagArt: TIBOQuery;
    SourceMagArt: TDataSource;
    ClientTopPanel: TbmpPanel;
    MenuStampe: TPopupMenu;
    Stampaetichettearticolo1: TMenuItem;
    PanelTubo: TPanel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    BitBtn2: TBitBtn;
    UMDiametro: TComboBox;
    Diametro: TEdit;
    Spessore: TEdit;
    PanelCucina: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    Fuochi: TComboBox;
    ConForno: TRadioButton;
    SenzaForno: TRadioButton;
    BitBtn1: TBitBtn;
    QryArt: TIBOQuery;
    SourceArt: TDataSource;
    QryArtCODICEARTICOLO: TStringField;
    QryArtCODICEGRUPPO1: TIntegerField;
    QryArtCODICEGRUPPO2: TIntegerField;
    QryArtCODICEGRUPPO3: TIntegerField;
    QryArtUNITADIMISURA: TStringField;
    QryArtULTIMOPRZACQUISTO: TIBOFloatField;
    QryArtPREZZODIVENDITA: TIBOFloatField;
    QryArtRICARICO: TIBOFloatField;
    QryArtIMPORTORICARICO: TIBOFloatField;
    QryArtPREZZODIVENDITA2: TIBOFloatField;
    QryArtPREZZODIVENDITA3: TIBOFloatField;
    QryArtPREZZODIVENDITA4: TIBOFloatField;
    QryArtRICARICO2: TIBOFloatField;
    QryArtRICARICO3: TIBOFloatField;
    QryArtRICARICO4: TIBOFloatField;
    QryArtIMPORTORICARICO2: TIBOFloatField;
    QryArtIMPORTORICARICO3: TIBOFloatField;
    QryArtIMPORTORICARICO4: TIBOFloatField;
    QryArtCODICEFORNITORE: TStringField;
    QryArtDESCRIZIONEFORNITORE: TStringField;
    QryArtCODICEIVA: TIntegerField;
    QryArtABILITAMOVMAG: TStringField;
    QryArtPREZZODILISTINO: TIBOFloatField;
    QryArtPREZZODILISTINOIVACOMP: TIBOFloatField;
    QryArtSCONTODIACQUISTO: TIBOFloatField;
    QryArtSCONTOLISTINO1: TIBOFloatField;
    QryArtSCONTOLISTINO2: TIBOFloatField;
    QryArtSCONTOLISTINO3: TIBOFloatField;
    QryArtSCONTOLISTINO4: TIBOFloatField;
    QryArtPRZVENDIVACOMP1: TIBOFloatField;
    QryArtPRZVENDIVACOMP2: TIBOFloatField;
    QryArtPRZVENDIVACOMP3: TIBOFloatField;
    QryArtPRZVENDIVACOMP4: TIBOFloatField;
    QryArtBARCODE: TStringField;
    QryArtUBICAZIONE: TStringField;
    QryArtCATEGORIA1: TStringField;
    QryArtCATEGORIA2: TStringField;
    QryArtCATEGORIA3: TStringField;
    QryArtJOLLY1: TStringField;
    QryArtJOLLY2: TStringField;
    QryArtJOLLY3: TStringField;
    QryArtJOLLY4: TStringField;
    QryArtJOLLY5: TStringField;
    QryArtJOLLY6: TStringField;
    QryArtJOLLY7: TStringField;
    QryArtJOLLY8: TStringField;
    QryArtJOLLY9: TStringField;
    QryArtJOLLY10: TStringField;
    QryArtDESCRIZIONE2: TStringField;
    QryArtDESCRIZIONE3: TStringField;
    QryArtDESCRIZIONE4: TStringField;
    QryArtDESCRIZIONE5: TStringField;
    QryArtQUANTITAAUTOMATICA: TIBOFloatField;
    QryArtMARCA: TStringField;
    QryArtPUNTORIORDINO: TIBOFloatField;
    QryArtLOTTORIORDINO: TIBOFloatField;
    QryArtSCORTAMINIMA: TIBOFloatField;
    QryArtABILITACONFORMITA: TStringField;
    QryArtCERTIFICAZIONE: TStringField;
    QryArtPOTENZA: TStringField;
    QryArtSISTVENTILAZIONE: TStringField;
    QryArtSISTSCARICOCOMB: TStringField;
    QryArtSISTCOLLEGELETTRICO: TStringField;
    QryArtSINCHRO: TStringField;
    QryArtDICHGASTIPO: TStringField;
    QryArtDICHGASNOTE: TStringField;
    QryArtINSTALLATO: TStringField;
    QryArtINSTALLABILE: TStringField;
    QryArtARTICOLOCOMPOSTO: TStringField;
    QryArtQTAOPERA: TIBOFloatField;
    QryArtSCONTODIACQUISTO2: TIBOFloatField;
    QryArtSCONTODIACQUISTO3: TIBOFloatField;
    QryArtUSASCONTIGRUPPI: TStringField;
    QryArtALIQUOTAIVA: TFloatField;
    QryArtCODICIAGGIUNTIVI: TStringField;
    QryArtPREFERITO: TStringField;
    QryArtDESCRIZIONE: TMemoField;
    QryArtCODICEGRUPPO4: TIntegerField;
    QryArtCODICEGRUPPO5: TIntegerField;
    QryArtCODICEGRUPPO6: TIntegerField;
    QryPA: TIBOQuery;
    QryArtCODICEPHOTOART: TStringField;
    QryPAJPEG: TBlobField;
    SourcePA: TDataSource;
    QryArtMINUTIPREVISTI: TIntegerField;
    QryArtFORNITOREPREFERITO: TIntegerField;
    QryListForn: TIBOQuery;
    SourceListForn: TDataSource;
    QryListFornCODICEFORNITORE: TIntegerField;
    QryListFornCODICEARTICOLO: TStringField;
    QryListFornPREZZODIACQUISTO: TIBOFloatField;
    QryListFornCODICEARTICOLOFORNITORE: TStringField;
    QryListFornRAGIONESOCIALE: TStringField;
    QryListFornSINCHRO: TStringField;
    QryListFornDESCRIZIONEFORNITORE: TStringField;
    MenuListiniFornitori: TPopupMenu;
    Impostacomefornitorepreferito: TMenuItem;
    QryListFornFORNITOREPREFERITO: TStringField;
    QryArtTIPOCALCOLOLISTINO: TStringField;
    QryMagArtCODICEARTICOLO: TStringField;
    QryMagArtCODICEMAGAZZINO: TIntegerField;
    QryMagArtDESCRIZIONE: TStringField;
    QryMagArtTIPO: TStringField;
    QryMagArtGIACENZA: TIBOFloatField;
    QryMagArtORDINATO: TIBOFloatField;
    QryMagArtIMPEGNATO: TIBOFloatField;
    QryArtFLAGAPPENAIMPORTATO: TStringField;
    QryArtBCL_CONSIDERA_SCONTO1: TStringField;
    QryArtBCL_CONSIDERA_SCONTO2: TStringField;
    QryArtBCL_CONSIDERA_SCONTO3: TStringField;
    QryArtCOSTOREALE: TIBOFloatField;
    QryArtTIPO1: TStringField;
    QryArtTIPO2: TStringField;
    QryArtTIPO3: TStringField;
    QryArtTIPO4: TStringField;
    QryArtTIPO5: TStringField;
    QryArtTIPO6: TStringField;
    QryMagArtDATACHIUSURAGENERALE: TDateTimeField;
    QryMagArtDATACHIUSURAARTICOLO: TDateTimeField;
    QryMagArtDISPONIBILE: TIBOFloatField;
    Label40: TLabel;
    QryArtDATAULTMOD_CREAZIONE: TDateTimeField;
    QryArtDATAULTMOD_GENERALE: TDateTimeField;
    QryArtDATAULTMOD_COSTO: TDateTimeField;
    QryArtDATAULTMOD_VENDITA: TDateTimeField;
    QryArtDATAULTMOD_LISTINO: TDateTimeField;
    QryListFornPREZZODILISTINO: TIBOFloatField;
    QryListFornSCONTODIACQUISTO1: TIBOFloatField;
    QryListFornSCONTODIACQUISTO2: TIBOFloatField;
    QryListFornSCONTODIACQUISTO3: TIBOFloatField;
    FormMainPanel: TPanel;
    PanelTabs: TPanel;
    TabControlPagineDocumento: TcxTabControl;
    ClientArea: TScrollBox;
    PanelIVA: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    DBEdit14: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit36: TDBEdit;
    Panel3: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    PanelListini: TPanel;
    Label7: TLabel;
    LabelScontiDiAcquisto: TLabel;
    LabelPrezzoAcquistoReale: TLabel;
    Label29: TLabel;
    Label17: TLabel;
    LabelScontiDiAcquistoPiu1: TLabel;
    LabelScontiDiAcquistoPiu2: TLabel;
    LabelConsideraScontiPerCalcoloListiniVendita: TLabel;
    LabelBaseCalcoloListini: TLabel;
    EditPrezzoDiListino: TDBEdit;
    EditPrezzoDiListinoIVAComp: TDBEdit;
    EditScontoDiAcquisto: TDBEdit;
    EditCostoReale: TDBEdit;
    EditScontoDiAcquisto2: TDBEdit;
    EditScontoDiAcquisto3: TDBEdit;
    DBCBUsaScontiGruppi: TcxDBCheckBox;
    eConsideraSc1: TcxDBCheckBox;
    eConsideraSc2: TcxDBCheckBox;
    eConsideraSc3: TcxDBCheckBox;
    EditUltimoPrzAcquisto: TDBEdit;
    PanelCodiceArticoloFornitore: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label27: TLabel;
    DBEdit13: TDBEdit;
    DBEdit20: TDBEdit;
    PanelCategorie: TPanel;
    LabelCategoria1: TLabel;
    LabelCategoria2: TLabel;
    LabelCategoria3: TLabel;
    LabelTitoloCategorie1: TLabel;
    LabelTitoloCategorie2: TLabel;
    LabelTitoloCategorie3: TLabel;
    PanelCateg1: TPanel;
    Categ1: TDBComboBox;
    PanelCateg2: TPanel;
    Categ2: TDBComboBox;
    PanelCateg3: TPanel;
    Categ3: TDBComboBox;
    PanelCustom: TPanel;
    LabelJolly1: TLabel;
    LabelJolly2: TLabel;
    LabelJolly3: TLabel;
    LabelJolly4: TLabel;
    LabelJolly5: TLabel;
    LabelJolly6: TLabel;
    LabelJolly7: TLabel;
    LabelJolly8: TLabel;
    LabelJolly9: TLabel;
    LabelJolly10: TLabel;
    LabelTitoloJolly1: TLabel;
    LabelTitoloJolly2: TLabel;
    LabelTitoloJolly3: TLabel;
    LabelTitoloJolly4: TLabel;
    LabelTitoloJolly5: TLabel;
    DBEJolly1: TDBEdit;
    DBEJolly2: TDBEdit;
    DBEJolly3: TDBEdit;
    DBEJolly4: TDBEdit;
    DBEJolly5: TDBEdit;
    DBEJolly6: TDBEdit;
    DBEJolly7: TDBEdit;
    DBEJolly8: TDBEdit;
    DBEJolly9: TDBEdit;
    DBEJolly10: TDBEdit;
    PanelDatiConform: TPanel;
    Label37: TLabel;
    Label34: TLabel;
    Label44: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel4: TPanel;
    TipoProdGas: TDBComboBox;
    DBENoteDichGas: TDBEdit;
    DBEPotenza: TDBEdit;
    DBECertificazione: TDBEdit;
    DBCBSistVent: TcxDBCheckBox;
    DBCBSistScar: TcxDBCheckBox;
    DBCBCollElettr: TcxDBCheckBox;
    DBCBArticoloInCOnformita: TcxDBCheckBox;
    DBCBInstallato: TcxDBCheckBox;
    DBCBInstallabile: TcxDBCheckBox;
    PanelConti: TPanel;
    LabelTipo1: TLabel;
    Label10: TLabel;
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
    PanelCodiceDescrizione: TPanel;
    Label72: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    LabelCodiceABarre: TLabel;
    BitBtnPhotoArt: TSpeedButtonRollOver;
    DBECodiceArticolo: TDBEdit;
    DBECodiceABarre: TDBEdit;
    CBArticoloPreferito: TcxDBCheckBox;
    DBMDescrizione: TDBMemo;
    cxDBImage1: TcxDBImage;
    PanelMinutiPrevisti: TPanel;
    Label43: TLabel;
    DBEMinutiPrevisti: TDBEdit;
    PanelMagazzino: TPanel;
    Label3: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    SBForzaGiacenzaArticolo: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBCBAbilitaMovMag: TcxDBCheckBox;
    GridMag: TcxGrid;
    tvMag: TcxGridDBTableView;
    tvMagCODICEARTICOLO: TcxGridDBColumn;
    tvMagCODICEMAGAZZINO: TcxGridDBColumn;
    tvMagTIPO: TcxGridDBColumn;
    tvMagDESCRIZIONE: TcxGridDBColumn;
    tvMagGIACENZA: TcxGridDBColumn;
    tvMagORDINATO: TcxGridDBColumn;
    tvMagIMPEGNATO: TcxGridDBColumn;
    tvMagDISPONIBILE: TcxGridDBColumn;
    tvMagDATACHIUSURAARTICOLO: TcxGridDBColumn;
    tvMagDATACHIUSURAGENERALE: TcxGridDBColumn;
    lvMag: TcxGridLevel;
    PanelCodiciAggiuntivi: TPanel;
    Label35: TLabel;
    Label39: TLabel;
    SBAggiungiCodice: TSpeedButton;
    SBEliminaCodice: TSpeedButton;
    DBEdit16: TDBEdit;
    PanelDescrizione2345: TPanel;
    Label45: TLabel;
    Label46: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    DBECodiceArticolo2: TDBEdit;
    DBECodiceABarre2: TDBEdit;
    CBArticoloPreferito2: TcxDBCheckBox;
    Panel2: TPanel;
    DBEMarca2: TDBComboBox;
    DBEDescrizione2: TDBEdit;
    DBEDescrizione3: TDBEdit;
    DBEDescrizione4: TDBEdit;
    DBEDescrizione5: TDBEdit;
    DBMDescrizione2: TDBMemo;
    PanelListiniFornitori: TPanel;
    Label71: TLabel;
    GridForn: TcxGrid;
    tvForn: TcxGridDBTableView;
    tvFornRAGSOCFORNITORE: TcxGridDBColumn;
    tvFornCODICEARTICOLO: TcxGridDBColumn;
    tvFornPREZZODILISTINO: TcxGridDBColumn;
    tvFornSCONTODIACQUISTO1: TcxGridDBColumn;
    tvFornSCONTODIACQUISTO2: TcxGridDBColumn;
    tvFornSCONTODIACQUISTO3: TcxGridDBColumn;
    tvFornPREZZODIACQUISTO: TcxGridDBColumn;
    tvFornCODICEARTICOLOFORNITORE: TcxGridDBColumn;
    tvFornDESCRIZIONEFORNITORE: TcxGridDBColumn;
    lvForn: TcxGridLevel;
    PanelGruppi: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    BitBtnGruppo1: TSpeedButtonRollOver;
    BitBtnGruppo2: TSpeedButtonRollOver;
    BitBtnGruppo3: TSpeedButtonRollOver;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    BitBtnGruppo4: TSpeedButtonRollOver;
    BitBtnGruppo5: TSpeedButtonRollOver;
    BitBtnGruppo6: TSpeedButtonRollOver;
    CodiceGruppo1: TDBEdit;
    DescGruppo1: TEdit;
    CodiceGruppo2: TDBEdit;
    DescGruppo2: TEdit;
    CodiceGruppo3: TDBEdit;
    DescGruppo3: TEdit;
    CodiceGruppo4: TDBEdit;
    DescGruppo4: TEdit;
    CodiceGruppo5: TDBEdit;
    DescGruppo5: TEdit;
    CodiceGruppo6: TDBEdit;
    DescGruppo6: TEdit;
    PanelDateUltMod: TPanel;
    Label1: TLabel;
    Label36: TLabel;
    Label18: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dbeDataCreazione: TDBEdit;
    dbeDataUltModCosto: TDBEdit;
    dbeDataUltModVendita: TDBEdit;
    dbeDataUltModListino: TDBEdit;
    dbeDataUltModGenerale: TDBEdit;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    PanelListiniVendita: TPanel;
    DBETipoCalcoloListini: TcxDBRadioGroup;
    Label13: TLabel;
    Label14: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    EditScontoListino1: TDBEdit;
    EditScontoListino2: TDBEdit;
    EditScontoListino3: TDBEdit;
    EditScontoListino4: TDBEdit;
    Label24: TLabel;
    EditRicarico: TDBEdit;
    EditRicarico2: TDBEdit;
    EditRicarico3: TDBEdit;
    EditRicarico4: TDBEdit;
    Label2: TLabel;
    EditImportoRicarico: TDBEdit;
    EditImportoRicarico2: TDBEdit;
    EditImportoRicarico3: TDBEdit;
    EditImportoRicarico4: TDBEdit;
    Label23: TLabel;
    EditPrezzoDiVendita: TDBEdit;
    EditPrezzoDiVendita2: TDBEdit;
    EditPrezzoDiVendita3: TDBEdit;
    EditPrezzoDiVendita4: TDBEdit;
    Label16: TLabel;
    EditPrzVendIVAComp1: TDBEdit;
    EditPrzVendIVAComp2: TDBEdit;
    EditPrzVendIVAComp3: TDBEdit;
    EditPrzVendIVAComp4: TDBEdit;
    PanelFissaPrzVend: TPanel;
    Label50: TLabel;
    Label70: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    Shape3: TShape;
    Shape4: TShape;
    QryArtFISSAPRZVEND: TStringField;
    QryFornLookup: TIBOQuery;
    SourceFornLookup: TDataSource;
    QryFornLookupCODICE: TIntegerField;
    QryFornLookupRAGIONESOCIALE: TStringField;
    tvFornCODICEFORNITORE: TcxGridDBColumn;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    QryArtFORNITORE: TStringField;
    dbeMarca: TcxDBComboBox;
    dbeFornitore: TcxDBComboBox;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure GridEdit(SetEdit: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CaricaLayout;
    procedure RxSpeedButtonHelpClick(Sender: TObject);     // Personale
    procedure EseguiQueryMagazziniArticoli(CodArt:String);
    procedure QryMagArtGIACENZAValidate(Sender: TField);
    procedure CheckButtonsGruppi;
    procedure PanelCucinaEnter(Sender: TObject);
    procedure PanelCucinaExit(Sender: TObject);
    procedure PanelTuboEnter(Sender: TObject);
    procedure PanelTuboExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TipoProdGasChange(Sender: TObject);
    procedure Categ1DropDown(Sender: TObject);
    procedure BitBtnGruppo1Click(Sender: TObject);
    procedure BitBtnGruppo2Click(Sender: TObject);
    procedure BitBtnGruppo3Click(Sender: TObject);
    procedure PBTabsPaint(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure Stampaetichettearticolo1Click(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure QryArtBeforePost(DataSet: TDataSet);
    procedure QryArtPREZZODIVENDITAValidate(Sender: TField);
    procedure QryArtRICARICOValidate(Sender: TField);
    procedure QryArtIMPORTORICARICOValidate(Sender: TField);
    procedure QryArtCODICEIVAValidate(Sender: TField);
    procedure QryArtPREZZODILISTINOValidate(Sender: TField);
    procedure QryArtPREZZODILISTINOIVACOMPValidate(Sender: TField);
    procedure QryArtSCONTOLISTINO1Validate(Sender: TField);
    procedure QryArtPRZVENDIVACOMP1Validate(Sender: TField);
    procedure QryArtQTAOPERAChange(Sender: TField);
    procedure CalcolaListiniArticoliPerCambioPrezzoDiVendita;
    procedure CalcolaListiniArticoliInBaseAlPrezzoDiListino;
    procedure CalcolaListiniArticoliInBaseAlPrezzoDiAcquisto;
    procedure QryArtUSASCONTIGRUPPIChange(Sender: TField);
    procedure QryArtCODICEGRUPPO1Change(Sender: TField);
    procedure QryArtCODICEGRUPPO1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SBAggiungiCodiceClick(Sender: TObject);
    procedure SBEliminaCodiceClick(Sender: TObject);
    procedure ControllaScontiRicarichiNulli;
    procedure BitBtnGruppo4Click(Sender: TObject);
    procedure BitBtnGruppo5Click(Sender: TObject);
    procedure BitBtnGruppo6Click(Sender: TObject);
    procedure QryArtCODICEPHOTOARTChange(Sender: TField);
    procedure BitBtnPhotoArtClick(Sender: TObject);
    procedure QryArtAfterOpen(DataSet: TDataSet);
    procedure StaticText1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure EditPrezzoDiListinoKeyPress(Sender: TObject; var Key: Char);
    procedure ImpostacomefornitorepreferitoClick(Sender: TObject);
    procedure MenuListiniFornitoriPopup(Sender: TObject);
    procedure EditCostoRealeDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure EditCostoRealeDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure tvFornCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvFornCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure QryArtTIPOCALCOLOLISTINOChange(Sender: TField);
    procedure tvMagTIPOGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: String);
    procedure tvMagCODICEMAGAZZINOGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure QryArtCOSTOREALEValidate(Sender: TField);
    procedure DBETipo1PropertiesInitPopup(Sender: TObject);
    procedure SBForzaGiacenzaArticoloClick(Sender: TObject);
    procedure QryListFornPREZZODILISTINOValidate(Sender: TField);
    procedure QryListFornPREZZODIACQUISTOValidate(Sender: TField);
    procedure TabControlPagineDocumentoChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure QryArtSCONTODIACQUISTOValidate(Sender: TField);
    procedure tvFornPREZZODILISTINOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure tvFornCODICEARTICOLOFORNITOREGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure QryArtPREZZODIVENDITAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure QryListFornBeforePost(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure dbeMarcaPropertiesInitPopup(Sender: TObject);
    procedure dbeFornitorePropertiesInitPopup(Sender: TObject);

  private
    { Private declarations }

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    // Puntatore alla form degli Allegati relativa a questa form stessa
    fAllegatiForm: TAllegatiForm;
    fNotePrivateSoggetto_InEvidenza: Boolean;
    fNotePrivateSoggetto_Evidenzia: Boolean;
    procedure Allegati_AggiornaDatiFiltri;
    procedure Allegati_CreaForm;
    procedure Allegati_VerificaAbilitazione;
    // =========================================================================

    procedure EseguiQueryListiniFornitoriArticolo(CodArt: String);
    procedure NuoviListiniFornitoriPerNuovoArticolo;

    procedure ControlloVisualizzazioneScontiRicarichi;
    procedure CaricaTitoli;
    procedure CambiaCodiceArticoloRighiDocumenti(OldCodArt, NewCodArt: String);
  public
    { Public declarations }
     DistintaBase:Boolean;
     // Queste contengono i riferimenti al record da visualizzare/editare
     CodiceArticolo, UMDefault:String;
     IVADefault: Integer;
     // Variabile che contiene il riferimento alla PreventiviOrdiniForm eventualmente già
     //  aperta quando  viene creata quella della DistintaBase in modo da poter ripristinare il tutto
     //  quando si esce dalla DistintaBase
     PrecPreventiviOrdiniForm:TPreventiviOrdiniForm;
     // Questa variabile autorizza 1o meno l'esecuzione dei calcoli all'interno della gestione
     //  dell'evento 'OnValidate' dei campi 'TableArticoliUltimoPrzAcquisto',
     //  'TableArticoliRicarico', 'TableArticoliPrezzoDiVendita'.
     GoValidate: Boolean;
     ListForn_GoValidate: Boolean;
  end;

var
  AnagArtForm: TAnagArtForm;

implementation

uses DataModule1, main, FormHelp,
  FormGruppi, FormPhotoArt, Variants, cxGridDBDataDefinitions, StrUtils,
  FormForzaGiacenzeMagazzino, DataModule2;

{$R *.DFM}

procedure TAnagArtForm.CaricaTitoli;
var
  M: TMemIniFile;
  Sez: String;
begin
  M := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    // ----- GIORNALE DI CANTIERE -----
    Sez := 'AnagArtForm';
    // Titoli dei tipi di righi predefiniti per l'articolo
    LabelTipo1.Caption := M.ReadString(Sez, 'TipoRigo1', 'Tipo 1');
    LabelTipo2.Caption := M.ReadString(Sez, 'TipoRigo2', 'Tipo 2');
    LabelTipo3.Caption := M.ReadString(Sez, 'TipoRigo3', 'Tipo 3');
    LabelTipo4.Caption := M.ReadString(Sez, 'TipoRigo4', 'Tipo 4');
    LabelTipo5.Caption := M.ReadString(Sez, 'TipoRigo5', 'Tipo 5');
    LabelTipo6.Caption := M.ReadString(Sez, 'TipoRigo6', 'Tipo 6');
  finally
    M.Free;
  end;
end;


procedure TAnagArtForm.CheckButtonsGruppi;
begin
   // Il pulsante del 1° livello deve essere sempre abilitato (ovviamente se si è in modalità di modifica)
   BitBtnGruppo1.Enabled        := RxSpeedModifica.Down;
   if BitBtnGruppo1.Enabled then CodiceGruppo1.Color := COLOR_MODIFICA else CodiceGruppo1.Color := COLOR_NORMALE;
   // Il pulsante del 2° livello deve essere abilitato se il livello precedente è stato assegnato (non è nullo)
   BitBtnGruppo2.Enabled := RxSpeedModifica.Down and ((not QryArtCodiceGruppo1.IsNull)or(QryArtCodiceGruppo1.AsInteger > 0));
   if BitBtnGruppo2.Enabled then CodiceGruppo2.Color := COLOR_MODIFICA else CodiceGruppo2.Color := COLOR_NORMALE;
   // Il pulsante del 3° livello deve essere abilitato se il livello precedente è stato assegnato (non è nullo)
   BitBtnGruppo3.Enabled := RxSpeedModifica.Down and ((not QryArtCodiceGruppo2.IsNull)or(QryArtCodiceGruppo2.AsInteger > 0));
   if BitBtnGruppo3.Enabled then CodiceGruppo3.Color := COLOR_MODIFICA else CodiceGruppo3.Color := COLOR_NORMALE;
   // Il pulsante del 4° livello deve essere abilitato se il livello precedente è stato assegnato (non è nullo)
   BitBtnGruppo4.Enabled := RxSpeedModifica.Down and ((not QryArtCodiceGruppo3.IsNull)or(QryArtCodiceGruppo3.AsInteger > 0));
   if BitBtnGruppo4.Enabled then CodiceGruppo4.Color := COLOR_MODIFICA else CodiceGruppo4.Color := COLOR_NORMALE;
   // Il pulsante del 5° livello deve essere abilitato se il livello precedente è stato assegnato (non è nullo)
   BitBtnGruppo5.Enabled := RxSpeedModifica.Down and ((not QryArtCodiceGruppo4.IsNull)or(QryArtCodiceGruppo4.AsInteger > 0));
   if BitBtnGruppo5.Enabled then CodiceGruppo5.Color := COLOR_MODIFICA else CodiceGruppo5.Color := COLOR_NORMALE;
   // Il pulsante del 6° livello deve essere abilitato se il livello precedente è stato assegnato (non è nullo)
   BitBtnGruppo6.Enabled := RxSpeedModifica.Down and ((not QryArtCodiceGruppo5.IsNull)or(QryArtCodiceGruppo5.AsInteger > 0));
   if BitBtnGruppo6.Enabled then CodiceGruppo6.Color := COLOR_MODIFICA else CodiceGruppo6.Color := COLOR_NORMALE;
end;


procedure TAnagArtForm.EseguiQueryListiniFornitoriArticolo(CodArt:String);
begin
  if QryListForn.Active then QryListForn.Close;
  QryListForn.ParamByName('P_CODICEARTICOLO').AsString := CodArt;
  QryListForn.Open;
end;

procedure TAnagArtForm.NuoviListiniFornitoriPerNuovoArticolo;
var
  Qry: TIB_Cursor;
  Y:Integer;
begin
  // Solo se abilitato
  if not DM1.Articoli_ListiniFornitoriAutomatici then
    Exit;
  // Apre la query dei listini fornitori per questo nuovo articolo con
  //  un codice articolo fasullo in modo che sia vuota.
  EseguiQueryListiniFornitoriArticolo('-9999');
  // IMposta la query per il reperimento dell'elenco delle categorie
  Qry := TIB_Cursor.Create(Self);
  try
    // Query che preleva l'elenco dei fornitori con listino
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CODICE, RAGIONESOCIALE, Nome, Cognome, TipoPersona FROM CLIENTI WHERE FORNITORECONLISTINO = ''T'' ORDER BY RAGIONESOCIALE');
    Qry.Open;
    // Cicla per creare i record dei listini dei vari fornitori con listino.
    while not Qry.Eof do begin
//      with tvForn.DataController do begin
//        Y := AppendRecord;
//        Values[Y, tvFornCODICEARTICOLO.Index] := '-9999';
//        Values[Y, tvFornCODICEFORNITORE.Index] := Qry.FieldValues['CODICE'];
//        Values[Y, tvFornRAGIONESOCIALE.Index] := Qry.FieldValues['RAGIONESOCIALE'];
//      end;
      QryListForn.Append;
      QryListFornCODICEARTICOLO.Value := '-9999';
      QryListFornCODICEFORNITORE.Value := Qry.Fields[0].Value;
      QryListFornRAGIONESOCIALE.Value := DM2.GetDenominazioneSoggetto(Qry);
      QryListForn.Post;
      Qry.Next;
    end;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

// Mi sembra che non venga più usata da nessuna parte, eliminare???
procedure TAnagArtForm.EseguiQueryMagazziniArticoli(CodArt:String);
begin
  if QryMagArt.Active then QryMagArt.Close;
  if not QryMagArt.Prepared then QryMagArt.Prepare;
  QryMagArt.Params.ParamByName('P_CODICEARTICOLO').AsString := CodArt;
  QryMagArt.Params.ParamByName('P_DATARICHIESTA').Clear;
  QryMagArt.Open;
end;



procedure TAnagArtForm.CaricaLayout;     // Personale
const
  MARGIN_UP = 0;
var
   LO : TMemIniFile;
   Contatore, YY, Sep, YYY, TmpInt: Integer;
   Sez, TmpStr, TitoloStr : String;
   TmpDBE : TDBEdit;
   TmpDBL : TPanel;
   TmpLabel, TmpTitolo : TLabel;
   TmpBool: Boolean;
begin
   // Carica i titoli dal menu.ini
   CaricaTitoli;

   // Inizializza la stringa che contiene il nome delle sezione nel file *.INI dove sono
   //  contenuti i parametri che ci interessano
   Sez := 'FormAnagraficaArticoli';
   // Apre il file che contiene i layouts di stampa e visualizzazione dei documenti.
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
    // Inizializza la variabile che contiene il valore della posizione attuale
    //  del pennello di  visualizzazione tramite il quale ci si regola per la visualizzazione
    //  dei componenti.
    YY := MARGIN_UP;
    // Carica nella variabile globale l'unità di misura di default da inserire nei nuovi articoli
    UMDefault := LO.ReadString(Sez, 'UMDefault', 'NONE');
    // Carica la separazione verticale tra i componenti su una variabile locale per comodità
    Sep := LO.ReadInteger(Sez, 'SeparazioneVerticale', 5) * 2;
    // ----- PANEL DEI TABS -----
    if DistintaBase then
    begin
       PanelTabs.Visible := True;
       TabControlPagineDocumento.Tabs[DOCTABIDX_APPUNTAMENTO].Visible           := False;
       TabControlPagineDocumento.Tabs[DOCTABIDX_RICAMBIMANODOPERA].Visible      := False;
       TabControlPagineDocumento.Tabs[DOCTABIDX_OPERAZIONIPIANIFICATE].Visible  := False;
       TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Visible   := False;
       TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Visible               := False;
       TabControlPagineDocumento.Tabs[DOCTABIDX_ANAGRAFICAARTICOLO].Visible     := True;
       TabControlPagineDocumento.Tabs[DOCTABIDX_DISTINTABASE].Visible           := True;
       TabControlPagineDocumento.Tabs[DOCTABIDX_MAPPA].Visible                  := False;
       inc(YY, 10);
    end
    else
      PanelTabs.Visible       := False;
    // Ridimensionamento e riposizionamento della ClientArea in base alla visualizzazione
    //  o meno del PanelTabs
    if PanelTabs.Visible
    then ClientArea.Top := PanelTabs.Height
    else ClientArea.Top := 0;
    ClientArea.Height := FormMainPanel.ClientHeight - PanelTabs.Height;
    // ----- PANEL CODICE DESCRIZIONE -----
    // In base al valore del flag visualizza il pannello completo, oppure
    //  il pannello ridotto.
    PanelDescrizione2345.Visible := False;
    PanelCodiceDescrizione.Visible := False;
    if DM1.AbilitaDescrizioni2345 then begin
      PanelDescrizione2345.Top     := YY;
      PanelDescrizione2345.Visible := True;
      YY := YY + PanelDescrizione2345.Height;
    end else begin
      PanelCodiceDescrizione.Top     := YY;
      PanelCodiceDescrizione.Visible := True;
      YY := YY + PanelCodiceDescrizione.Height;
    end;
    // ----- PANEL MINUTI PREVISTI -----
    PanelMinutiPrevisti.Visible := not DistintaBase;
    // ----- PANEL LISTINI FORNITORI -----
    if LO.ReadBool(Sez, 'PanelListiniFornitori', False) and (not DistintaBase) then begin
       YY := YY + Sep;
       PanelListiniFornitori.Top     := YY;
       PanelListiniFornitori.Visible := True;
       YY := YY + PanelListiniFornitori.Height;
       tvForn.Navigator.Visible := not DM1.Articoli_ListiniFornitoriAutomatici;
    end else PanelListiniFornitori.Visible := False;
    // ----- PANEL LISTINI -----
    if LO.ReadBool(Sez, 'PanelListini', False) and (not DistintaBase) then begin
       YY := YY + Sep;
       PanelListini.Top     := YY;
       PanelListini.Visible := True;
       // Visualizza o meno gli sconti di acquisto in base alle impostazioni
       TmpBool := DM1.Articoli_ScontiAcquistoVisible;
       LabelScontiDiAcquisto.Visible := TmpBool;
       LabelScontiDiAcquistoPiu1.Visible := TmpBool;
       LabelScontiDiAcquistoPiu2.Visible := TmpBool;
       LabelConsideraScontiPerCalcoloListiniVendita.Visible := TmpBool;
       LabelBaseCalcoloListini.Visible := TmpBool;
       DBCBUsaScontiGruppi.Visible := TmpBool;
       EditScontoDiAcquisto.Visible := TmpBool;
       EditScontoDiAcquisto2.Visible := TmpBool;
       EditScontoDiAcquisto3.Visible := TmpBool;
       eConsideraSc1.Visible := TmpBool;
       eConsideraSc2.Visible := TmpBool;
       eConsideraSc3.Visible := TmpBool;
       EditUltimoPrzAcquisto.Visible := TmpBool;
       LabelPrezzoAcquistoReale.Caption := 'Prezzo di acquisto';
       // Visualizza o meno i listini di vendita in base alle impostazioni
       if not DM1.Articoli_ListiniDiVenditaVisible then
       begin
         PanelListiniVendita.Visible := False;
         PanelListini.Height := PanelListiniVendita.Height -1;
       end;
       // Aggiorna YY
       YY := YY + PanelListini.Height;
    end else PanelListini.Visible := False;
    // ----- PANEL IVA -----
    if LO.ReadBool(Sez, 'PanelIVA', False) then begin
       YY := YY + Sep;
       PanelIVA.Top     := YY;
       PanelIVA.Visible := True;
       YY := YY + PanelIVA.Height;
    end else PanelIVA.Visible       := False;
    // ----- PANEL CODICI AGGIUNTIVI -----
    if LO.ReadBool(Sez, 'PanelCodiciAggiuntivi', False) and not DistintaBase then begin
       YY := YY + Sep;
       PanelCodiciAggiuntivi.Top     := YY;
       PanelCodiciAggiuntivi.Visible := True;
       YY := YY + PanelCodiciAggiuntivi.Height;
    end else PanelCodiciAggiuntivi.Visible       := False;
    // ----- PANEL GRUPPI -----
    if LO.ReadBool(Sez, 'PanelGruppi', False) then begin
       YY := YY + Sep;
       PanelGruppi.Top     := YY;
       PanelGruppi.Visible := True;
       YY := YY + PanelGruppi.Height;
    end else PanelGruppi.Visible       := False;
    // ----- PANEL MAGAZZINO -----
    if (LO.ReadInteger(Sez, 'PanelMagazzino', 155) > 0) and not DistintaBase then begin
       YY := YY + Sep;
       PanelMagazzino.Top     := YY;
       PanelMagazzino.Visible := True;
       YY := YY + PanelMagazzino.Height;
    end else PanelMagazzino.Visible       := False;
    // ----- PANEL CODICE ARTICOLO FORNITORE -----
    if LO.ReadBool(Sez, 'PanelCodiceArticoloFornitore', False) and not DistintaBase then begin
       YY := YY + Sep;
       PanelCodiceArticoloFornitore.Top     := YY;
       PanelCodiceArticoloFornitore.Visible := True;
       YY := YY + PanelCodiceArticoloFornitore.Height;
    end else PanelCodiceArticoloFornitore.Visible       := False;
    // ----- PANEL CONTI -----
    if (   LO.ReadBool(Sez, 'TipoRigo1', False) or LO.ReadBool(Sez, 'TipoRigo2', False) or LO.ReadBool(Sez, 'TipoRigo3', False) or LO.ReadBool(Sez, 'TipoRigo4', False) or LO.ReadBool(Sez, 'TipoRigo5', False) or LO.ReadBool(Sez, 'TipoRigo6', False)  )
    and (not DistintaBase) then begin
       YY := YY + Sep;
       PanelConti.Top     := YY;
       PanelConti.Visible := True;
       YY := YY + PanelConti.Height;
       // Rende visibili o meno i singoli campi
       if LO.ReadBool(Sez, 'TipoRigo1', False) then begin
         LabelTipo1.Visible := True;
         DBETipo1.Visible   := True;
       end;
       if LO.ReadBool(Sez, 'TipoRigo2', False) then begin
         LabelTipo2.Visible := True;
         DBETipo2.Visible   := True;
       end;
       if LO.ReadBool(Sez, 'TipoRigo3', False) then begin
         LabelTipo3.Visible := True;
         DBETipo3.Visible   := True;
       end;
       if LO.ReadBool(Sez, 'TipoRigo4', False) then begin
         LabelTipo4.Visible := True;
         DBETipo4.Visible   := True;
       end;
       if LO.ReadBool(Sez, 'TipoRigo5', False) then begin
         LabelTipo5.Visible := True;
         DBETipo5.Visible   := True;
       end;
       if LO.ReadBool(Sez, 'TipoRigo6', False) then begin
         LabelTipo6.Visible := True;
         DBETipo6.Visible   := True;
       end;
    end else PanelConti.Visible := False;

     // ----- CATEGORIE -----
     if LO.ReadString(Sez, 'Categoria1', '0') <> '0' then begin
        TmpInt := 1;
        YYY := -1;
        // Cicla per tutte le 3 possibili categorìe
        for Contatore := 1 to 3 do begin
           // Rimappa su variabili locali i componenti Label e LookupComboBoxes che si
           //  stanno impostando.
           TmpDBL   := (FindComponent('PanelCateg'+IntToStr(Contatore)) as TPanel);
           TmpLabel := (FindComponent('LabelCategoria'+IntToStr(Contatore)) as TLabel);
           // Carica in TmpStr la riga del file *.INI da elaborare e se è <> 0 la elabora,
           TmpStr := LO.ReadString(Sez, 'Categoria'+IntToStr(Contatore), '0');
           if TmpStr <> '0' then begin
              // Cicla finchè non vi siano più eventuali titoli da visualizzare contenuti nella
              //  riga del file *.INI attuale (titoli da visualizzare prima del campo attuele stesso.
              while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
                 // Prende la prima label di titolo disponibile, la imposta, la visualizza
                 TitoloStr := DM1.RitornaTestoPrimaDi('_', TmpStr, True);
                 TmpTitolo := (FindComponent('LabelTitoloCategorie'+IntToStr(TmpInt)) as TLabel);
                 TmpInt := TmpInt + 1;
                 TmpTitolo.Caption := ' ' + DM1.StrRight(TitoloStr, Length(TitoloStr)-3);
                 if TitoloStr[1] = 'L' then TmpTitolo.Alignment := taLeftJustify
                  else if TitoloStr[1] = 'C' then TmpTitolo.Alignment := taCenter
                  else if TitoloStr[1] = 'R' then TmpTitolo.Alignment := taRightJustify;
                 if TitoloStr[2] = 'N' then TmpTitolo.Font.Style := []
                 else if TitoloStr[2] = 'B' then TmpTitolo.Font.Style := [fsBold];
                 TmpTitolo.Top := YYY+1;
                 TmpTitolo.Visible := True;
                 YYY := YYY + TmpTitolo.Height;
              end;
              // Imposta il campo attuale e lo rende visibile
              Inc(YYY, 3);
              TmpLabel.Caption := TmpStr + ' ';
              TmpLabel.Top := YYY;
              TmpLabel.Visible := True;
              TmpDBL.Top := YYY;
              TmpDBL.Visible := True;
              YYY := YYY + TmpLabel.Height;
              // Dimensiona il pannello opportunamente
              PanelCategorie.Height := YYY+6;
           end else begin
              // Se invece il campo attuale è disabilitato lo rende invisibile
              TmpLabel.Visible := False;
              TmpDBL.Visible := False;
           end;
        end;
        // Posiziona il pannello e lo visualizza
        YY := YY + Sep;
        PanelCategorie.Top := YY;
        PanelCategorie.Visible := True;
        YY := YY + PanelCategorie.Height;
     end else PanelCategorie.Visible := False;
    // ----- PANEL DICHIARAZIONE CONFORMITA' -----
    if LO.ReadBool(Sez, 'PanelConformita', False) and not DistintaBase then begin
       YY := YY + Sep;
       PanelDatiConform.Top     := YY;
       PanelDatiConform.Visible := True;
       YY := YY + PanelDatiConform.Height;
    end else PanelDatiConform.Visible       := False;

     // ----- CAMPI JOLLY -----
     if LO.ReadString(Sez, 'Jolly1', '0') <> '0' then begin
        TmpInt := 1;
        YYY := -1;
        // Cicla per tutte i 10 possibili campi jolly
        for Contatore := 1 to 10 do begin
           // Rimappa su variabili locali i componenti Label e DBEdit che si
           //  stanno impostando.
           TmpDBE   := (FindComponent('DBEJolly'+IntToStr(Contatore)) as TDBEdit);
           TmpLabel := (FindComponent('LabelJolly'+IntToStr(Contatore)) as TLabel);
           // Carica in TmpStr la riga del file *.INI da elaborare e se è <> 0 la elabora,
           TmpStr := LO.ReadString(Sez, 'Jolly'+IntToStr(Contatore), '0');
           if TmpStr <> '0' then begin
              // Cicla finchè non vi siano più eventuali titoli da visualizzare contenuti nella
              //  riga del file *.INI attuale (titoli da visualizzare prima del campo attuale stesso.
              while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
                 // Prende la prima label di titolo disponibile, la imposta, la visualizza
                 TitoloStr := DM1.RitornaTestoPrimaDi('_', TmpStr, True);
                 TmpTitolo := (FindComponent('LabelTitoloJolly'+IntToStr(TmpInt)) as TLabel);
                 TmpInt := TmpInt + 1;
                 TmpTitolo.Caption := ' ' + DM1.StrRight(TitoloStr, Length(TitoloStr)-3);
                 if TitoloStr[1] = 'L' then TmpTitolo.Alignment := taLeftJustify
                  else if TitoloStr[1] = 'C' then TmpTitolo.Alignment := taCenter
                  else if TitoloStr[1] = 'R' then TmpTitolo.Alignment := taRightJustify;
                 if TitoloStr[2] = 'N' then TmpTitolo.Font.Style := []
                 else if TitoloStr[2] = 'B' then TmpTitolo.Font.Style := [fsBold];
                 TmpTitolo.Top := YYY+1;
                 TmpTitolo.Visible := True;
                 YYY := YYY + TmpTitolo.Height;
              end;
              // Imposta il campo attuale e lo rende visibile
              Inc(YYY, 3);
              TmpLabel.Caption := TmpStr + ' ';
              TmpLabel.Top := YYY;
              TmpLabel.Visible := True;
              TmpDBE.Top := YYY;
              TmpDBE.Visible := True;
              YYY := YYY + TmpLabel.Height;
              // Dimensiona il pannello opportunamente
              PanelCustom.Height := YYY+6;
           end else begin
              // Se invece il campo attuale è disabilitato lo rende invisibile
              TmpLabel.Visible := False;
              TmpDBE.Visible := False;
           end;
        end;
        // Posiziona il pannello e lo visualizza
        YY := YY + Sep;
        PanelCustom.Top := YY;
        PanelCustom.Visible := True;
        YY := YY + PanelCustom.Height;
     end else PanelCustom.Visible := False;
     // ------------------------------

    // ----- PANEL DATE ULTIME VARIAZIONI -----
    if LO.ReadBool(Sez, 'PanelUltimeVariazioni', True) and not DistintaBase then begin
       YY := YY + Sep;
       PanelDateUltMod.Top     := YY;
       PanelDateUltMod.Visible := True;
       YY := YY + PanelDateUltMod.Height;
    end else PanelDateUltMod.Visible       := False;

    // ----- PANEL DIBA FISSA PREZZO DI VENDITA -----
    if LO.ReadBool(Sez, 'PanelFissaPrzVend', True) and DistintaBase then begin
       YY := YY + Sep;
       PanelFissaPrzVend.Top     := YY;
       PanelFissaPrzVend.Visible := True;
       YY := YY + PanelFissaPrzVend.Height;
    end else PanelFissaPrzVend.Visible       := False;


   ClientArea.VertScrollBar.Range := YY + 5;
   LO.Free;
end;



procedure TAnagArtForm.FormCreate(Sender: TObject);
begin
   // Inizializzazione
   GoValidate := True;
   ListForn_GoValidate := True;
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(AnagArtForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Anagrafica articolo)';
   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
   // IMposta la proprietà "DisplayFormat" dei campi relativi ai prezzi
   //  in modo da poter visualizzare gli importi con il giosto numero
   //  dei decimali come impostato nei MicroPrezzi
   QryArtULTIMOPRZACQUISTO.DisplayFormat  := DM1.DisplayFormatMicroPrz;
   QryArtPREZZODIVENDITA.DisplayFormat    := DM1.DisplayFormatMicroPrz;
   QryArtPREZZODIVENDITA2.DisplayFormat   := DM1.DisplayFormatMicroPrz;
   QryArtPREZZODIVENDITA3.DisplayFormat   := DM1.DisplayFormatMicroPrz;
   QryArtPREZZODIVENDITA4.DisplayFormat   := DM1.DisplayFormatMicroPrz;
   QryArtIMPORTORICARICO.DisplayFormat    := DM1.DisplayFormatMicroPrz;
   QryArtIMPORTORICARICO2.DisplayFormat   := DM1.DisplayFormatMicroPrz;
   QryArtIMPORTORICARICO3.DisplayFormat   := DM1.DisplayFormatMicroPrz;
   QryArtIMPORTORICARICO4.DisplayFormat   := DM1.DisplayFormatMicroPrz;
   QryArtPREZZODILISTINO.DisplayFormat    := DM1.DisplayFormatMicroPrz;
   QryArtPREZZODILISTINOIVACOMP.DisplayFormat := DM1.DisplayFormatMicroPrz;
   QryArtPRZVENDIVACOMP1.DisplayFormat    := DM1.DisplayFormatMicroPrz;
   QryArtPRZVENDIVACOMP2.DisplayFormat    := DM1.DisplayFormatMicroPrz;
   QryArtPRZVENDIVACOMP3.DisplayFormat    := DM1.DisplayFormatMicroPrz;
   QryArtPRZVENDIVACOMP4.DisplayFormat    := DM1.DisplayFormatMicroPrz;
   // Imposta la proprietà DecimalPlaces delle colonne contenenti importi dei listini
   //  di altri fornitori
   QryListFornPREZZODILISTINO.DisplayFormat   := DM1.DisplayFormatMicroPrz;
   QryListFornPREZZODIACQUISTO.DisplayFormat  := DM1.DisplayFormatMicroPrz;
   (tvFornPREZZODILISTINO.GetProperties as TcxCurrencyEditProperties).DisplayFormat  := DM1.DisplayFormat;
   (tvFornPREZZODIACQUISTO.GetProperties as TcxCurrencyEditProperties).DisplayFormat := DM1.DisplayFormat;
   (tvFornPREZZODILISTINO.GetProperties as TcxCurrencyEditProperties).DecimalPlaces  := DM1.DecMicroPrz;
   (tvFornPREZZODIACQUISTO.GetProperties as TcxCurrencyEditProperties).DecimalPlaces := DM1.DecMicroPrz;
   // Limita la lunghezza della descrizione dell'articolo al numero di caratteri
   //  specificato dall'apposita variabile
   DBMDescrizione.MaxLength  := DM1.LunghezzaMaxDescrizioneArticolo;
   DBMDescrizione2.MaxLength := DM1.LunghezzaMaxDescrizioneArticolo;
   // Si posiziona al primo Tab
   TabControlPagineDocumento.TabIndex := DOCTABIDX_ANAGRAFICAARTICOLO;
end;

procedure TAnagArtForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

procedure TAnagArtForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   Close;
end;


procedure TAnagArtForm.ControllaScontiRicarichiNulli;
begin
   // Se tutti gli sconti e i ricarichi, e anche il prezzo di listino e anche il
   //  prezzo di acquisto sono nulli, penso che si tratti di un nuovo articolo
   //  e siccome altrimenti verrebbero fuori tutti degli zeri, esco subito.
   if  QryArtPREZZODILISTINO.IsNull
   and QryArtULTIMOPRZACQUISTO.IsNull
   and QryArtSCONTOLISTINO1.IsNull
   and QryArtSCONTOLISTINO2.IsNull
   and QryArtSCONTOLISTINO3.IsNull
   and QryArtSCONTOLISTINO4.IsNull
   then Exit;
   // Se gli sconti dei listini sono nulli richiama la gestione dell'evento relativo
   //  alla variazione del prezzo di acquisto, così li ricalcola.
   if QryArtSCONTOLISTINO1.IsNull or QryArtSCONTOLISTINO2.IsNull or QryArtSCONTOLISTINO3.IsNull or QryArtSCONTOLISTINO4.IsNull then begin
      QryArtCOSTOREALEValidate(QryArtCOSTOREALE);
   end;
   // Se i ricarichi dei listini sono nulli richiama la gestione dell'evento relativo
   //  alla variazione del prezzo di listino, così li ricalcola.
   if QryArtRICARICO.IsNull or QryArtRICARICO2.IsNull or QryArtRICARICO3.IsNull or QryArtRICARICO4.IsNull then begin
      QryArtPREZZODILISTINOValidate(QryArtPREZZODILISTINO);
   end;
end;


procedure TAnagArtForm.RxSpeedModificaClick(Sender: TObject);
var
   MR: TModalResult;
   Msg: String;
begin
     DM1.Attendere;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryArt.Edit;
          SourceMagArt.AutoEdit              := True;
          SourceListForn.AutoEdit            := True;
          RxSpeedButtonUscita.Enabled        := False;
          RxSpeedButtonStampa.Enabled        := False;
          SBAggiungiCodice.Enabled           := True;
          SBEliminaCodice.Enabled            := True;
          BitBtnPhotoArt.Enabled             := True;
          SBForzaGiacenzaArticolo.Enabled    := False;
          DM1.ColoraTuttiCampi(AnagArtForm, COLOR_MODIFICA);
          GridEdit(True);
          tvForn.Styles.Background         := DM1.tvBackgroundModifica;
          tvForn.Styles.ContentEven        := DM1.tvContentEvenModifica;
          tvForn.Styles.ContentOdd         := DM1.tvContentOddModifica;
          // Se gli sconti dei listini sono nulli richiama la gestione dell'evento relativo
          //  alla variazione del prezzo di acquisto, così li ricalcola.
          ControllaScontiRicarichiNulli;
          // Se la form è visibile
          if Visible then begin
             // Sposta il focus sul primo campo editabile
             //  Prima però lo sposta su un altro campo perchè altrimenti incasina l'evidenziazione del campo
             if PanelCodiceDescrizione.Visible then DBECodiceABarre.SetFocus else DBECodiceABarre2.SetFocus;
             if PanelCodiceDescrizione.Visible then DBECodiceArticolo.SetFocus else DBECodiceArticolo2.SetFocus;
          end;
          // Se è una distintabase mette in modifica anche la distinta
          if DistintaBase then begin
             PreventiviOrdiniForm.RxSpeedModifica.Down := True;
             PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
          end;
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
          // Non permette di editare i magazzini
          if QryListForn.State = dsEdit then QryListForn.Post;
          SourceListForn.AutoEdit                := False;
          // Disabilita la modifica dei campi
          QryArt.Edit;

          // ---------------------------------------------------------------------------------------------
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;

          // In base alla risposta dell'operatore...
          if MR = mrYes then begin

                // Se il codice articolo principale è nullo
                if (QryArtCodiceArticolo.IsNull) or (Trim(QryArtCodiceArticolo.Value) = '') then begin
                  // Se è abilitata l'assegnazione aitomatica del codice articolo principale, lo assegna automaticamente
                  //  altrimenti visualizza un avvertimento all'utente. Controlla anche se l'assegnazione automatica del
                  //  ha come destinazione il codice articolo principale.
                  if (DM1.TableProgressiviEnableProgArt.AsString = 'T') and (DM1.TableProgressiviPROGARTDESTINATION.AsString = 'Codice articolo')
                  then QryArtCodiceArticolo.Value := DM1.NextCodiceArticolo
                  else begin
                     DM1.Messaggi('Errore', 'Codice articolo non inserito.', 'NB: Nelle impostazioni è possibile attivare l''assegnazione automatica di un Codice Articolo progressivo.'#13#13'Per ulteriori informazioni chiamare il Centro Servizi.', [mbOK], 0, nil);
                     RxSpeedModifica.Down := True;
                     DM1.ChiudiAttendere;
                     Exit;
                  end;
                end;

                // Se il codice articolo è stato cambiato visualizza degli avvertimenti.
                if  (not QryArtCODICEARTICOLO.IsNull)
                and (Trim(QryArtCODICEARTICOLO.Value) <> '') and (CodiceArticolo <> '')
                and (QryArtCODICEARTICOLO.Value <> CodiceArticolo)
                then begin
                  Msg := 'ATTENZIONE !!!'#13#13'Si sta cambiando il CODICE ARTICOLO.'#13#13'Questa operazione, viste le possibili conseguenze, andrebbe eseguita sotto il controllo del Centro Servizi.'#13#13;
                  Msg := Msg + 'Prima di continuare chiamare il Centro Servizi'#13#13'Continuare ugualmente ignorando il consiglio?';
                  if DM1.Messaggi('Avvertimento', Msg, 'NB: Cliccando su "SI" continuerete con l''operazione a VOSTRO RISCHIO E PERICOLO; cliccanto invece su "NO" la conferma dell''articolo verrà annullata.', [mbYes, mbNo], 0, nil) <> mrYes then begin
                    // Riabilita la modifica dei campi ed esce
                    RxSpeedModifica.Down := True;
                    QryArt.Edit;
                    Exit;
                  end;
                  if DM1.Messaggi('2° Avvertimento', 'RIPETO !!!'#13#13'Prima di continuare è consigliabile chiamare il Centro Servizi.'#13#13'Continuare ugualmente ignorando il consiglio?', 'NB: Cliccando su "SI" continuerete con l''operazione a VOSTRO RISCHIO E PERICOLO; cliccanto invece su "NO" la conferma dell''articolo verrà annullata.', [mbYes, mbNo], 0, nil) <> mrYes then begin
                    // Riabilita la modifica dei campi ed esce
                    RxSpeedModifica.Down := True;
                    QryArt.Edit;
                    Exit;
                  end;
                end;

                // Controlla se il codice a barre è nullo o meno e se è nullo ed è attivata l'assegnazione automatica
                //  del codice con destinazione il codice a barre stesso, provvede ad assegnarlo autoamticamente.
                if (QryArtBARCODE.IsNull) or (Trim(QryArtBARCODE.Value) = '') then begin
                   if (DM1.TableProgressiviEnableProgArt.AsString = 'T') and (DM1.TableProgressiviPROGARTDESTINATION.AsString = 'Codice a barre')
                   then QryArtBARCODE.Value := DM1.NextCodiceArticolo;
                end;

               // COnferma le modifiche
               QryArt.Post;

               // Cicla per tutti i magazzini dell'articolo e aggiorna i codicearticolo relativi in modo che anche se è stato cambiato
               //  il codice dell'articolo non perda i suoi magazzini
               //-------------------------------------------------------------------------------
               if  (not QryArtCODICEARTICOLO.IsNull) and (Trim(QryArtCODICEARTICOLO.Value) <> '')
               then begin
                 QryListForn.First;
                 while not QryListForn.Eof do begin
                    // Se il codice articolo dei magazzini è diverso da quallo dell'articolo, significa che il codice dell'articolo è cambiato
                    //  e quindi aggiorna anche il codicearticolo del magazzino
                    if QryListForn.FieldByName('CODICEARTICOLO').AsString <> QryArtCodiceArticolo.AsString then
                    begin
                       QryListForn.Edit;
                       QryListFornCODICEARTICOLO.Value := QryArtCodiceArticolo.AsString;
                       QryListForn.Post;
                    end;
                    QryListForn.Next;   // Và al prossimo record
                 end;
                 // COnferma le modifiche alle giacenze di magazzino
                 QryListForn.ApplyUpdates;
               end;
               //-------------------------------------------------------------------------------

               // Se è cambiato il codice dell'articolo e se il veccio/nuovo codice è valido aggiorna
               //  tale codicearticolo anche nei righi dei documenti.
               //-------------------------------------------------------------------------------
               if  (not QryArtCODICEARTICOLO.IsNull)
               and (Trim(QryArtCODICEARTICOLO.Value) <> '') and (CodiceArticolo <> '')
               and (QryArtCODICEARTICOLO.Value <> CodiceArticolo)
               then begin
                 CambiaCodiceArticoloRighiDocumenti(CodiceArticolo, QryArtCODICEARTICOLO.Value);
               end;
               //-------------------------------------------------------------------------------


               // Controlla se il codice articolo non sia già usato da un altro articolo
               //  nel qual caso blocca tutto e avverte della situazione
               if (not QryArtBarCode.IsNull) and (QryArtBarCode.AsString <> '') then begin
                  if DM1.BarCodeEsistente(QryArtBarCode.Value) then begin
                     DM1.ChiudiAttendere;
                     MessageBeep(0);
                     MessageDlg('A T T E N Z I O N E !!! - Codice a barre già utilizzato !', mtWarning, [mbOK], 0);
                     RxSpeedModifica.Down := True;
                     QryArt.Edit;
                     if Visible then begin
                       if PanelCodiceDescrizione.Visible then DBECodiceArticolo.SetFocus else DBECodiceArticolo2.SetFocus;
                     end;
                     Exit;
                  end;
               end;
               // Aggiorna la query che richiama i righi dei magazzini dell'articolo e i relativi totali
               EseguiQueryMagazziniArticoli(QryArtCodiceArticolo.AsString);
               // Se è una distintabase rimette in modalità normale anche il documento
               if DistintaBase then begin
                  PreventiviOrdiniForm.ModalResultConferma := mrYes;
                  PreventiviOrdiniForm.RxSpeedModifica.Down := False;
                  PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
               end;
               // Decide se gli allegati devono essere già visibili oppure no.
               Allegati_VerificaAbilitazione;
               // Aggiorna la variabile che contiene il codice articolo attuale
               //  NB. La aggiorna quì alla fine perchè viene usata in alcune parti per reperire
               //       codice articolo precedente nel caso sia stato variato.
               // E' IMPORTANTE CHE QUESTA ISTRUZIONE SIA ESEGUITA DOPO AVER RIMESSO IN MODALITA' NORMALE
               //  LA DISTINTABASE
               CodiceArticolo := QryArtCodiceArticolo.AsString;
          end else if MR = mrNo then begin
            // Se è una distintabase rimette in modalità normale anche il documento
            if DistintaBase then begin
               PreventiviOrdiniForm.ModalResultConferma := mrNo;
               PreventiviOrdiniForm.RxSpeedModifica.Down := False;
               PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
            end;
            // Se si sta inserendo un nuovo articolo, provvede a annullare l'inserimento
            //   e anche a chiudere la form, se invece sta modificando un articolo già
            //   esistente, annulla solo le modifiche effettuate senza uscire dalla form.
            if QryArt.State = dsInsert then begin
                QryListForn.CancelUpdates;
                QryArt.Cancel;
                DM1.ChiudiAttendere;
                Close;
                Exit;
             end else begin
                QryListForn.CancelUpdates;
                QryArt.Cancel;
             end;
             // Se è una distintabase rimette in modalità normale anche il documento
             if DistintaBase then begin
                PreventiviOrdiniForm.ModalResultConferma := mrNo;
                PreventiviOrdiniForm.RxSpeedModifica.Down := False;
                PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
             end;
          end else begin
               RxSpeedModifica.Down := True;
               DM1.ChiudiAttendere;
               Exit;
          end;
          // ---------------------------------------------------------------------------------------------

          // Sposta il focus sul primo campo editabile
          // Rimette tasti e campi a posto
          RxSpeedButtonUscita.Enabled        := True;
          RxSpeedButtonStampa.Enabled        := True;
          SBAggiungiCodice.Enabled           := False;
          SBEliminaCodice.Enabled            := False;
          BitBtnPhotoArt.Enabled             := False;
          SBForzaGiacenzaArticolo.Enabled    := True;
          DM1.ColoraTuttiCampi(AnagArtForm, COLOR_NORMALE);
          GridEdit(False);
          tvForn.Styles.Background         := DM1.tvBackground;
          tvForn.Styles.ContentEven        := DM1.tvContentEven;
          tvForn.Styles.ContentOdd         := DM1.tvContentOdd;
          // Se la form è visible...
          if Visible then begin
             //  Prima però lo sposta su un altro campo perchè altrimenti incasina l'evidenziazione del campo
             if PanelCodiceDescrizione.Visible then  DBECodiceABarre.SetFocus else DBECodiceABarre2.SetFocus;
             if PanelCodiceDescrizione.Visible then  DBECodiceArticolo.SetFocus else DBECodiceArticolo2.SetFocus;
          end;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryArt.Edit;
          end;
       end;
     end;
     // Abilita i pulsanti di selezione correttiin base alla situazione
     CheckButtonsGruppi;

     DM1.ChiudiAttendere;
end;


// Procedura che cambia il codice articolo a tutti i righi dei documenti
procedure TAnagArtForm.CambiaCodiceArticoloRighiDocumenti(OldCodArt, NewCodArt: String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  OldCodArt := QuotedStr(OldCodArt);
  NewCodArt := QuotedStr(NewCodArt);
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE RIGHIPRV SET CODICEARTICOLO = ' + NewCodArt + ' WHERE CODICEARTICOLO = ' + OldCodArt);
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;



procedure TAnagArtForm.ControlloVisualizzazioneScontiRicarichi;
var
  Colore: TColor;
begin
  if RxSpeedModifica.Down then Colore := COLOR_MODIFICA else Colore := COLOR_NORMALE;
  if QryArtTIPOCALCOLOLISTINO.AsString = 'S' then begin
    EditScontoListino1.Tag := 0;
    EditScontoListino2.Tag := 0;
    EditScontoListino3.Tag := 0;
    EditScontoListino4.Tag := 0;
    EditScontoListino1.Color := Colore;
    EditScontoListino2.Color := Colore;
    EditScontoListino3.Color := Colore;
    EditScontoListino4.Color := Colore;
    EditScontoListino1.Font.Color := clBlack;
    EditScontoListino2.Font.Color := clBlack;
    EditScontoListino3.Font.Color := clBlack;
    EditScontoListino4.Font.Color := clBlack;
    EditScontoListino1.ReadOnly := False;
    EditScontoListino2.ReadOnly := False;
    EditScontoListino3.ReadOnly := False;
    EditScontoListino4.ReadOnly := False;
    EditScontoListino1.TabStop := True;
    EditScontoListino2.TabStop := True;
    EditScontoListino3.TabStop := True;
    EditScontoListino4.TabStop := True;
    EditRicarico.Tag := -1;
    EditRicarico2.Tag := -1;
    EditRicarico3.Tag := -1;
    EditRicarico4.Tag := -1;
    EditRicarico.Color := $00E9E9E9;
    EditRicarico2.Color := $00E9E9E9;
    EditRicarico3.Color := $00E9E9E9;
    EditRicarico4.Color := $00E9E9E9;
    EditRicarico.Font.Color := $00E9E9E9;
    EditRicarico2.Font.Color := $00E9E9E9;
    EditRicarico3.Font.Color := $00E9E9E9;
    EditRicarico4.Font.Color := $00E9E9E9;
    EditRicarico.ReadOnly := True;
    EditRicarico2.ReadOnly := True;
    EditRicarico3.ReadOnly := True;
    EditRicarico4.ReadOnly := True;
    EditRicarico.TabStop := False;
    EditRicarico2.TabStop := False;
    EditRicarico3.TabStop := False;
    EditRicarico4.TabStop := False;
    if EditRicarico.Focused  then EditScontoListino1.SetFocus;
    if EditRicarico2.Focused then EditScontoListino2.SetFocus;
    if EditRicarico3.Focused then EditScontoListino3.SetFocus;
    if EditRicarico4.Focused then EditScontoListino4.SetFocus;
  end else begin
    EditScontoListino1.Tag := -1;
    EditScontoListino2.Tag := -1;
    EditScontoListino3.Tag := -1;
    EditScontoListino4.Tag := -1;
    EditScontoListino1.Color := $00E9E9E9;
    EditScontoListino2.Color := $00E9E9E9;
    EditScontoListino3.Color := $00E9E9E9;
    EditScontoListino4.Color := $00E9E9E9;
    EditScontoListino1.Font.Color := $00E9E9E9;
    EditScontoListino2.Font.Color := $00E9E9E9;
    EditScontoListino3.Font.Color := $00E9E9E9;
    EditScontoListino4.Font.Color := $00E9E9E9;
    EditScontoListino1.ReadOnly := True;
    EditScontoListino2.ReadOnly := True;
    EditScontoListino3.ReadOnly := True;
    EditScontoListino4.ReadOnly := True;
    EditScontoListino1.TabStop := False;
    EditScontoListino2.TabStop := False;
    EditScontoListino3.TabStop := False;
    EditScontoListino4.TabStop := False;
    EditRicarico.Tag := 0;
    EditRicarico2.Tag := 0;
    EditRicarico3.Tag := 0;
    EditRicarico4.Tag := 0;
    EditRicarico.Color := Colore;
    EditRicarico2.Color := Colore;
    EditRicarico3.Color := Colore;
    EditRicarico4.Color := Colore;
    EditRicarico.Font.Color := clBlack;
    EditRicarico2.Font.Color := clBlack;
    EditRicarico3.Font.Color := clBlack;
    EditRicarico4.Font.Color := clBlack;
    EditRicarico.ReadOnly := False;
    EditRicarico2.ReadOnly := False;
    EditRicarico3.ReadOnly := False;
    EditRicarico4.ReadOnly := False;
    EditRicarico.TabStop := True;
    EditRicarico2.TabStop := True;
    EditRicarico3.TabStop := True;
    EditRicarico4.TabStop := True;
    if EditScontoListino1.Focused then EditRicarico.SetFocus;
    if EditScontoListino2.Focused then EditRicarico2.SetFocus;
    if EditScontoListino3.Focused then EditRicarico3.SetFocus;
    if EditScontoListino4.Focused then EditRicarico4.SetFocus;
  end;
end;

procedure TAnagArtForm.dbeFornitorePropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(FORNITORE) FROM ARTICOLI');
      Qry.Open;
      DBEFornitore.Properties.Items.Clear;
      while not Qry.Eof do begin
         DBEFornitore.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAnagArtForm.dbeMarcaPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(MARCA) FROM ARTICOLI');
      Qry.Open;
      DBEMarca.Properties.Items.Clear;
      while not Qry.Eof do begin
         DBEMarca.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAnagArtForm.FormShow(Sender: TObject);
var
   LO : TMemIniFile;
begin
  DM1.FocusRefresh;
  // Apre il file con le impostazioni
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // Carica i dati dei fornitori dell'articolo (se non ci sono i record dei fornitori li crea)
    DM1.ControlloFornitoriArticolo(CodiceArticolo);
    // In base al valore di 'Tag' apre la form in diverse modalità...
    case Tag of
       // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
       MODE_OPEN: begin
          // Imposta la query per carica il soggetto corrente
          QryArt.Close;
          QryArt.SQL.Clear;
          QryArt.SQL.Add('SELECT * FROM ARTICOLI WHERE CODICEARTICOLO = ''' + CodiceArticolo + '''');
          QryArt.Open;
          // Se trova l'articolo
          if not QryArt.Eof then begin
             // Carica i dati dei fornitori dell'articolo (se non ci sono i record dei fornitori li crea)
             DM1.ControlloFornitoriArticolo(CodiceArticolo);
//####             // Imposta la query che richiama i listini dei fornitori per questo articolo
//####             EseguiQueryListiniFornitoriArticolo(CodiceArticolo);
             // Imposta la query che richiama i righi dei magazzini dell'articolo e i relativi totali
             EseguiQueryMagazziniArticoli(CodiceArticolo);
             // Inizializza il flag che indica se si è aperto un articolo composto (DistintaBase) Oppure uno normale
             DistintaBase := QryArtARTICOLOCOMPOSTO.AsString = 'T';
             // Se quì DistintaBase = True significa che deve essere creato una nuovo articolo composto
             if DistintaBase then begin
                // Apre il documento
                // Salva il precedente valore del puntatore.
                PrecPreventiviOrdiniForm := PreventiviOrdiniForm;
                // Crea la distintabase
                Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
                PreventiviOrdiniForm.Parent    := MainForm;
                PreventiviOrdiniForm.DistintaBase := True;
                if QryArtCODICEARTICOLO.IsNull then begin
                   PreventiviOrdiniForm.TipoDoc := 'NEW';
                end else begin
                   PreventiviOrdiniForm.TipoDoc := QryArtCODICEARTICOLO.AsString;
                end;
                PreventiviOrdiniForm.Registro  := 'DIBA';
                PreventiviOrdiniForm.NumeroDoc := 1;
                PreventiviOrdiniForm.DataDoc   := StrToDate('01/01/1900');
                PreventiviOrdiniForm.Tag       := MODE_OPEN;
                // Sostituisce il gestore dell'evento
                PreventiviOrdiniForm.RxSpeedModifica.OnClick := PreventiviordiniForm.DiBaModificaClick;
                // Richiama l'OnShow per aprire i Dataset
                PreventiviOrdiniForm.FormShow(PreventiviOrdiniForm);
             end;
          end else begin
             MessageDlg('Articolo non trovato !', mtError, [mbOK], 0)
          end;
       end;
       // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
       MODE_NEW: begin
          // Carica l'IVA di default da assegnare ai nuovi articoli
          IVADefault := LO.ReadInteger('FormAnagraficaArticoli', 'IVADefault', 0);
          // Inizializza il Codice articolo
          CodiceArticolo := '';
          // Imposta una query che non deve trovare nulla
          QryArt.Close;
          QryArt.SQL.Clear;
          QryArt.SQL.Add('SELECT * FROM ARTICOLI WHERE CODICEARTICOLO = ''MAUROSTRONZO''');
          QryArt.Open;
          // Effettua l'Append del nuovo record
          QryArt.Append;
          // Se quì DistintaBase = True significa che deve essere creato una nuovo articolo composto
          if DistintaBase then
          begin
             QryArtARTICOLOCOMPOSTO.Value := 'T';
             // Apre il documento
             // Salva il precedente valore del puntatore.
             PrecPreventiviOrdiniForm := PreventiviOrdiniForm;
             // Crea la distintabase
             Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
             PreventiviOrdiniForm.Parent    := MainForm;
             PreventiviOrdiniForm.DistintaBase := True;
             if QryArtCODICEARTICOLO.IsNull then begin
                PreventiviOrdiniForm.TipoDoc := 'NEW' + FormatDateTime('hhnnss', Now); // Per risolvere il problema se più utenti stavano creando articolo composti in contemporanea
//                PreventiviOrdiniForm.TipoDoc := 'NEW';
             end else begin
                PreventiviOrdiniForm.TipoDoc := QryArtCODICEARTICOLO.AsString;
             end;
             PreventiviOrdiniForm.Registro  := 'DIBA';
             PreventiviOrdiniForm.NumeroDoc := 1;
             PreventiviOrdiniForm.DataDoc   := StrToDate('01/01/1900');
             PreventiviOrdiniForm.Tag       := MODE_OPEN;
             // Sostituisce il gestore dell'evento
             PreventiviOrdiniForm.RxSpeedModifica.OnClick := PreventiviordiniForm.DiBaModificaClick;
             // Richiama l'OnShow per aprire i Dataset
             PreventiviOrdiniForm.FormShow(PreventiviOrdiniForm);
          end;
          // Valori di default
          if DM1.DefaultAbilitaMovMag then QryArtAbilitaMovMag.Value := 'T' else QryArtAbilitaMovMag.Value := 'F';
          QryArtUsaScontiGruppi.Value      := 'F';
          QryArtAbilitaConformita.Value    := 'T';
          QryArtInstallato.Value           := '0';
          QryArtInstallabile.Value         := '0';
          QryArtSistVentilazione.Value     := '0';
          QryArtSistScaricoComb.Value      := '0';
          QryArtSistCollegElettrico.Value  := '0';
          QryArtPreferito.Value            := 'F';
          QryArtPuntoRiordino.Value        := 0;
          QryArtScortaMinima.Value         := 0;
          QryArtLottoRiordino.Value        := 0;

          QryArtQTAOPERA.OnChange := nil;
          QryArtQTAOPERA.Value    := 0;
          QryArtQTAOPERA.OnChange := QryArtQTAOPERAChange;

          QryArtTipoCalcoloListino.Value   := DM1.TipoCalcoloListiniVenditaDefault;
          if UMDefault <> 'NONE' then QryArtUnitaDiMisura.Value := UMDefault;
          if IVADefault <> 0 then QryArtCodiceIVA.Value := IVADefault;

          if DM1.BCL_ConsideraSconto1 then QryArtBCL_CONSIDERA_SCONTO1.Value := 'T' else QryArtBCL_CONSIDERA_SCONTO1.Value := 'F';
          if DM1.BCL_ConsideraSconto2 then QryArtBCL_CONSIDERA_SCONTO2.Value := 'T' else QryArtBCL_CONSIDERA_SCONTO2.Value := 'F';
          if DM1.BCL_ConsideraSconto3 then QryArtBCL_CONSIDERA_SCONTO3.Value := 'T' else QryArtBCL_CONSIDERA_SCONTO3.Value := 'F';

          // Carica i ricarichi e sconti per il calcolo dei listini di vendita
          // -----------------------------------------------------------------
          // Se è abilitata la gestione dei ricarichi per fasce di prezzo
          if DM1.RicarichiPerFasceDiPrezzo then begin
            DM1.CaricaFasceRicarichi;
            QryArtRICARICO.Value  := DM1.GetRicaricoPerPrezzo(0, 1, False);
            QryArtRICARICO2.Value := DM1.GetRicaricoPerPrezzo(0, 2, False);
            QryArtRICARICO3.Value := DM1.GetRicaricoPerPrezzo(0, 3, False);
            QryArtRICARICO4.Value := DM1.GetRicaricoPerPrezzo(0, 4, False);
          // Altrimenti carica quelli normali di default
          end else begin
            QryArtRICARICO.Value  := DM1.TableProgressiviRICARICOLISTINO1.AsFloat;
            QryArtRICARICO2.Value := DM1.TableProgressiviRICARICOLISTINO2.AsFloat;
            QryArtRICARICO3.Value := DM1.TableProgressiviRICARICOLISTINO3.AsFloat;
            QryArtRICARICO4.Value := DM1.TableProgressiviRICARICOLISTINO4.AsFloat;
          end;
          // Carica gli sconti
          QryArtSCONTOLISTINO1.Value  := DM1.TableProgressiviSCONTOLISTINO1.AsFloat;
          QryArtSCONTOLISTINO2.Value  := DM1.TableProgressiviSCONTOLISTINO2.AsFloat;
          QryArtSCONTOLISTINO3.Value  := DM1.TableProgressiviSCONTOLISTINO3.AsFloat;
          QryArtSCONTOLISTINO4.Value  := DM1.TableProgressiviSCONTOLISTINO4.AsFloat;
          // -----------------------------------------------------------------
       end;
    end;

    // Carica il layout della form
    CaricaLayout;
    // Azzera la scrollbar
    ClientArea.VertScrollBar.Position := 0;

    // Richiama le descrizioni dei gruppi dei quali l'articolo fà parte
    if (QryArtCODICEGRUPPO1.AsInteger <> -1) then begin
      DM1.CodGruppoToDescrizione(QryArtCODICEGRUPPO1.AsString, '-1', '-1', '-1', '-1', '-1', DescGruppo1);
      if (QryArtCODICEGRUPPO2.AsInteger <> -1) then begin
         DM1.CodGruppoToDescrizione(QryArtCODICEGRUPPO1.AsString, QryArtCODICEGRUPPO2.AsString, '-1', '-1', '-1', '-1', DescGruppo2);
         if (QryArtCODICEGRUPPO3.AsInteger <> -1) then begin
            DM1.CodGruppoToDescrizione(QryArtCODICEGRUPPO1.AsString, QryArtCODICEGRUPPO2.AsString, QryArtCODICEGRUPPO3.AsString, '-1', '-1', '-1', DescGruppo3);
            if (QryArtCODICEGRUPPO4.AsInteger <> -1) then begin
               DM1.CodGruppoToDescrizione(QryArtCODICEGRUPPO1.AsString, QryArtCODICEGRUPPO2.AsString, QryArtCODICEGRUPPO3.AsString, QryArtCODICEGRUPPO4.AsString, '-1', '-1', DescGruppo4);
               if (QryArtCODICEGRUPPO5.AsInteger <> -1) then begin
                  DM1.CodGruppoToDescrizione(QryArtCODICEGRUPPO1.AsString, QryArtCODICEGRUPPO2.AsString, QryArtCODICEGRUPPO3.AsString, QryArtCODICEGRUPPO4.AsString, QryArtCODICEGRUPPO5.AsString, '-1', DescGruppo5);
                  if (QryArtCODICEGRUPPO6.AsInteger <> -1) then begin
                     DM1.CodGruppoToDescrizione(QryArtCODICEGRUPPO1.AsString, QryArtCODICEGRUPPO2.AsString, QryArtCODICEGRUPPO3.AsString, QryArtCODICEGRUPPO4.AsString, QryArtCODICEGRUPPO5.AsString, QryArtCODICEGRUPPO6.AsString, DescGruppo6);
                  end;
               end;
            end;
         end;
      end;
    end;
    // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
    if (DM1.ModCtrl(MOD_ARTICOLI) > 1) and not MainForm.ModoAssistenzeRDP then
     RxSpeedModifica.Enabled := True
    else
     RxSpeedModifica.Enabled := False;

    {
    // Se questo articolo è un articolo composto (distintabase)
    if DistintaBase then begin
      // Apre il documento
      // Salva il precedente valore del puntatore.
      PrecPreventiviOrdiniForm := PreventiviOrdiniForm;
      // Crea la distintabase
      Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
      PreventiviOrdiniForm.Parent    := MainForm;
      PreventiviOrdiniForm.DistintaBase := True;
      if QryArtCODICEARTICOLO.IsNull then begin
         PreventiviOrdiniForm.TipoDoc := 'NEW';
      end else begin
         PreventiviOrdiniForm.TipoDoc := QryArtCODICEARTICOLO.AsString;
      end;
      PreventiviOrdiniForm.Registro  := 'DIBA';
      PreventiviOrdiniForm.NumeroDoc := 1;
      PreventiviOrdiniForm.DataDoc   := StrToDate('01/01/1900');
      PreventiviOrdiniForm.Tag       := MODE_OPEN;
      // Sostituisce il gestore dell'evento
      PreventiviOrdiniForm.RxSpeedModifica.OnClick := PreventiviordiniForm.DiBaModificaClick;
      // Richiama l'OnShow per aprire i Dataset
      PreventiviOrdiniForm.FormShow(PreventiviOrdiniForm);
    end;
    }

    // Se la form è stata richiamata per la creazione di un nuovo articolo pone già
    //  il tutto in modalità di Modifica
    if Tag = MODE_NEW then begin
      //  Pone la form direttamente in modalità di modifica
      RxSpeedModifica.Down := True;
      RxSpeedModificaClick(Self);
      // Apre la query dei listini di acquisto fornitori con un codice fasullo in modo che
      //  la query risulti vuota e crea i listini fornitori per il nuovo articolo (se abilitato)
      NuoviListiniFornitoriPerNuovoArticolo;
      // Se è una nuova distinta base provvede a caricare i valori relativi alle manodopera
      if DistintaBase then
      begin
        // Imposta il prezzo unitario della mano d'opera di default
        //  (perchè qunado il documento viene creato per una DIBA altrimenti non venivano inizializzate)
        PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA.Value           := DM1.Manodopera[0].PrezzoUnitario1;
        PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA1.Value          := DM1.Manodopera[1].PrezzoUnitario1;
        PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA2.Value          := DM1.Manodopera[2].PrezzoUnitario1;
        PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA3.Value          := DM1.Manodopera[3].PrezzoUnitario1;
        PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA4.Value          := DM1.Manodopera[4].PrezzoUnitario1;
      end;
    end;
    // Apre le query relative ai listini fornitori
    QryFornLookup.Open;
    EseguiQueryListiniFornitoriArticolo(CodiceArticolo);

    // Inizializza i campi degli sconti di acquisto in base al flag che decide
    //  se gli sconti devono essere presi dai gruppi oppure no.
    QryArtUSASCONTIGRUPPIChange(QryArtUSASCONTIGRUPPI);

    // Controlla la visualizzazione degli sconti e dei ricarichi nei listini articoli
    ControlloVisualizzazioneScontiRicarichi;

    // Decide se gli allegati devono essere già visibili oppure no.
    Allegati_VerificaAbilitazione;
  finally
    LO.Free;
  end;
end;


procedure TAnagArtForm.GridEdit(SetEdit: Boolean);
begin
  // In base al parametro ricevuto mette la griglia del corpo documento
  // in modalità di editing oppure no
  tvForn.OptionsCustomize.ColumnHorzSizing := SetEdit;
  tvForn.OptionsData.Appending := SetEdit;
  tvForn.OptionsData.Deleting := SetEdit;
  tvForn.OptionsData.Editing := SetEdit;
  tvForn.OptionsData.Inserting := SetEdit;
end;

procedure TAnagArtForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TAnagArtForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Se è in MOdifica chiede se Confermare o annullare l'operazione prima di uscire
   if RxSpeedModifica.Down then begin RxSpeedModifica.Down := False; RxSpeedModificaClick(Self); end;

   // Se il puntatore PreventiviOrdiniForm non è nullo e la sua variabile DistintaBAse = True
   // Significa che si tratta della distintabase dll'articolo attuale e quindi la distrugge
   if (PreventiviOrdiniForm <> nil) and PreventiviOrdiniForm.DistintaBase then PreventiviOrdiniForm.Close;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;

   AnagArtForm := nil;
end;

procedure TAnagArtForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('ARTICOLI');
end;

procedure TAnagArtForm.QryMagArtGIACENZAValidate(Sender: TField);
begin
   // Calcola la disponibilità di magazzino
   QryMagArtDisponibile.Value := QryMagArtGiacenza.AsFloat - QryMagArtImpegnato.AsFloat;
end;

procedure TAnagArtForm.PanelCucinaEnter(Sender: TObject);
begin
   MessageBeep(0);
end;

procedure TAnagArtForm.PanelCucinaExit(Sender: TObject);
begin
   // Impedisce di uscire dal pannello se non si è premuto il pulsante OK
   if PanelCucina.Tag = 0 then begin
      MessageBeep(0);
      PanelCucina.SetFocus;
   end;
end;

procedure TAnagArtForm.PanelTuboEnter(Sender: TObject);
begin
   MessageBeep(0);
end;

procedure TAnagArtForm.PanelTuboExit(Sender: TObject);
begin
   // Impedisce di uscire dal pannello se non si è premuto il pulsante OK
   if PanelTubo.Tag = 0 then begin
      MessageBeep(0);
      PanelTubo.SetFocus;
   end;
end;

procedure TAnagArtForm.Allegati_AggiornaDatiFiltri;
begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QryArtCODICEARTICOLO.IsNull then fAllegatiForm.Filter_CodiceArticolo := QryArtCODICEARTICOLO.Value;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
end;

procedure TAnagArtForm.Allegati_CreaForm;
begin
    // Se la form degli allegati non è stata ancora creata la crea.
    if not Assigned(fAllegatiForm) then begin
      // Crea la form degli allegati
      fAllegatiForm := MainForm.Allegati_CreaForm(PanelAllegati);
      // Passa lo Splitter alla finestra degli allegati
      fAllegatiForm.Splitter := SplitterAllegati;
      // Parte con lo splitter chiuso
//      SplitterAllegati.CloseSplitter;
    end;
    // Imposta i filtri
    Allegati_AggiornaDatiFiltri;
end;

procedure TAnagArtForm.Allegati_VerificaAbilitazione;
begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QryArt.State = dsInsert) then begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end else begin
      Allegati_CreaForm;
      SplitterAllegati.Enabled := True;
    end;
end;

procedure TAnagArtForm.BitBtn1Click(Sender: TObject);
begin
   // Autocompila  le note
   if ConForno.Checked then begin
      DBENoteDichGas.Field.Value :=  'cucina a ' + Fuochi.Text + ' fuochi con forno';
   end else begin
      DBENoteDichGas.Field.Value :=  'cucina a ' + Fuochi.Text + ' fuochi senza forno';
   end;
   // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
   PanelCucina.Tag := 1;
   PanelCucina.Visible := False;
end;

procedure TAnagArtForm.BitBtn2Click(Sender: TObject);
var
   OutStr: String;
begin
   // Autocompila  le note
   OutStr := 'fi ' + UMDiametro.Text + ' ' + Diametro.Text;
   if Trim(Spessore.Text) <> '' then  OutStr := OutStr + ', spessore mm ' + Spessore.Text;
   DBENoteDichGas.Field.Value := OutStr;
   // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
   PanelTubo.Tag := 1;
   PanelTubo.Visible := False;
end;

procedure TAnagArtForm.TipoProdGasChange(Sender: TObject);
begin
   if TipoProdGas.Text = 'Cucina' then begin
      PanelCucina.Top := PANEL_DATI_ENTE_GAS_TOP;
      PanelCucina.Left := PANEL_DATI_ENTE_GAS_LEFT;
      PanelCucina.Visible := True;
      PanelCucina.SetFocus;
      PanelCucina.Update;
   end else if TipoProdGas.Text = 'Tubo' then begin
      PanelTubo.Top := PANEL_DATI_ENTE_GAS_TOP;
      PanelTubo.Left := PANEL_DATI_ENTE_GAS_LEFT;
      PanelTubo.Visible := True;
      PanelTubo.SetFocus;
      PanelTubo.Update;
   end;
end;

procedure TAnagArtForm.Categ1DropDown(Sender: TObject);
var
   CategIndex:String;
   CB: TDBComboBox;
   Qry: TIB_Cursor;
begin
   CB := (Sender as TDBComboBox);
   CB.Items.Clear;
   CategIndex := IntToStr(CB.Tag);
   // IMposta la query per il reperimento dell'elenco delle categorie
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT CAMPO1 FROM CATEG' + CategIndex + ' ORDER BY CAMPO1');
      Qry.Open;
      while not Qry.Eof do begin
         CB.Items.Add(Qry.FieldByName('CAMPO1').AsString);
         Qry.Next;   
      end;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;

procedure TAnagArtForm.BitBtnGruppo1Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 998;   // Abilita la selezione
      GruppiForm.LivelloAttivo := 1;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagArtForm.BitBtnGruppo2Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 998;   // Abilita la selezione
      GruppiForm.Selezionato1  := CodiceGruppo1.Field.AsInteger;
      GruppiForm.LivelloAttivo := 2;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagArtForm.BitBtnGruppo3Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 998;   // Abilita la selezione
      GruppiForm.Selezionato1  := CodiceGruppo1.Field.AsInteger;
      GruppiForm.Selezionato2  := CodiceGruppo2.Field.AsInteger;
      GruppiForm.LivelloAttivo := 3;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagArtForm.PBTabsPaint(Sender: TObject);
const
   PBT_HEIGHT   = 19;
begin
//   with PBTabs do begin
//      Canvas.Pen.Color := $00CCCCCC;
//      Canvas.MoveTo(0, PBT_HEIGHT);
//      Canvas.LineTo(10, PBT_HEIGHT);
//      Canvas.LineTo(10, 0);
//      Canvas.LineTo(110,0);
//      Canvas.LineTo(129, PBT_HEIGHT);
//      Canvas.LineTo(Width, PBT_HEIGHT);
//   end;
end;

procedure TAnagArtForm.RxSpeedButtonStampaClick(Sender: TObject);
var
   ClientPoint, ScreenPoint: TPoint;
begin
   // Esegue la conversione delle coordinate dove dovrà apparire il menù
   //  da coordinate client della finestra a coordinate assolute dello schermo.
   //  (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
   ClientPoint.X  := RxSpeedButtonStampa.Left + POPUP_X_OFFSET + ClientTopPanel.Left;
   ClientPoint.Y  := RxSpeedButtonStampa.Top + POPUP_Y_OFFSET;
   ScreenPoint    := ClientToScreen(ClientPoint);
   // Imposta la proprietà TAG del menù (0=Anteprima, 1=Stampa, 2=Fax, 3=Email)
   MenuStampe.Tag := 1;
   MenuStampe.Popup(ScreenPoint.X, ScreenPoint.Y);
end;

procedure TAnagArtForm.Stampaetichettearticolo1Click(Sender: TObject);
begin
   DM1.Attendere;
   try
      // Svuota la tabella delle etichette
      DM2.SvuotaTabellaEtichette(IDX_ETICHETTA_ARTICOLO);
      // Crea la query e cicla per aggiungere a questa tutti gli articoli che servono
      DM2.LoadTabellaEtichetteArticoli(CodiceArticolo);
      // Crea e avvia la form per la stampa delle etichette
      DM2.StampaEtichette(IDX_ETICHETTA_ARTICOLO);
   finally
      DM1.ChiudiAttendere;
   end;
end;

procedure TAnagArtForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   ClientPoint, ScreenPoint: TPoint;
begin
   // *************************************************************************
   //   NB: FACENDO CLICK COL DX RICHIAMA IL MENU' DI STAMPA
   // *************************************************************************
   if Button = mbRight then begin
      // Esegue la conversione delle coordinate dove dovrà apparire il menù
      //  da coordinate client della finestra a coordinate assolute dello schermo.
      //  (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
      ClientPoint.X := RxSpeedButtonStampa.Left + POPUP_X_OFFSET + ClientTopPanel.Left;
      ClientPoint.Y := RxSpeedButtonStampa.Top + POPUP_Y_OFFSET;
      ScreenPoint   := ClientToScreen(ClientPoint);
      // Imposta la proprietà TAG del menù (0=Anteprima, 1=Stampa, 2=Fax, 3=Email)
      MenuStampe.Tag := 0;
      MenuStampe.Popup(ScreenPoint.X, ScreenPoint.Y);
   end;
end;

procedure TAnagArtForm.QryArtBeforePost(DataSet: TDataSet);
begin
   // Marca il record come modificato
   DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
end;

procedure TAnagArtForm.QryArtPREZZODIVENDITAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsCurrency = 0 then
    Text := ''
  else
    Text := CurrToStrF(Sender.AsCurrency, ffCurrency, DM1.DecMicroPrz);
end;

procedure TAnagArtForm.QryArtPREZZODIVENDITAValidate(Sender: TField);
begin
   // Esegue l'evento solo se autorizzato
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Calcola i listini in base al prezzo di acquisto
      CalcolaListiniArticoliPerCambioPrezzoDiVendita;
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
   end;
end;

procedure TAnagArtForm.QryArtRICARICOValidate(Sender: TField);
begin
   // Esegue l'evento solo se autorizzato
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Calcola i listini in base al prezzo di acquisto
      CalcolaListiniArticoliInBaseAlPrezzoDiAcquisto;
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
   end;
end;

procedure TAnagArtForm.QryArtIMPORTORICARICOValidate(Sender: TField);
begin
   // Esegue l'evento solo se autorizzato
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Calcola il risultante prezzo di vendita IVA esclusa
      QryArtPrezzoDiVendita.Value   := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico.Value;
      QryArtPrezzoDiVendita2.Value  := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico2.Value;
      QryArtPrezzoDiVendita3.Value  := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico3.Value;
      QryArtPrezzoDiVendita4.Value  := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico4.Value;
      // Ricalcola i listini per cambio prezzo di vendita
      CalcolaListiniArticoliPerCambioPrezzoDiVendita;
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
   end;
end;

procedure TAnagArtForm.QryArtCODICEIVAValidate(Sender: TField);
begin
      // Esegue l'evento solo se autorizzato
      if GoValidate then begin
         // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
         GoValidate := False;
         // Calcola i listini in base al prezzo di Listino
         CalcolaListiniArticoliInBaseAlPrezzoDiListino;
         // Riabilita l'evento 'OnValidate'
         GoValidate := True;
      end;
end;



procedure TAnagArtForm.QryArtPREZZODILISTINOValidate(Sender: TField);
var
  Sc1, Sc2, Sc3: Double;
begin
   // Controlla che l'esecuzione dell'evento sia autorizzata.
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Flag che indica se, per il ricalcolo dei prezzi di listino e di acquisto degli articoli,
      //  alla variazione del PrezzoDiListino deve essere ricalcolato il PrezzoDiAcquisto (e/o viceversa)
      //  in base agli sconti di acquisto impostati oppure se invece tali importi devono rimanere fissi e
      //  ad essere ricalcolati devono essere gli sconti
      if DM1.Articoli_RicalcoloPrzAcquistoImportiFissi then
      begin
        QryArtSCONTODIACQUISTO.Value  := DM1.CalcolaSconto(QryArtPrezzoDiListino.AsFloat, QryArtCOSTOREALE.Value, 2);
        QryArtSCONTODIACQUISTO2.Value := 0;
        QryArtSCONTODIACQUISTO3.Value := 0;
      end
      else
        // Calcola il prezzo di acquisto applicando gli sconti
        //  NB: Questo è la base per il calcolo desi listini di vendita
        QryArtCOSTOREALE.Value := DM1.CalcolaImportoScontato(QryArtPrezzoDiListino.AsFloat,
                                                             QryArtScontoDiAcquisto.AsFloat,
                                                             QryArtScontoDiAcquisto2.AsFloat,
                                                             QryArtScontoDiAcquisto3.AsFloat,
                                                             DM1.DecMicroPrz);
      // Calcola il prezzo di acquisto applicando gli sconti
      //  NB: Questo è la base per il calcolo desi listini di vendita
      //  NB: Prima verifica quali sono gli sconti da considerare
      if QryArtBCL_CONSIDERA_SCONTO1.AsString = 'T' then Sc1 := QryArtScontoDiAcquisto.AsFloat else Sc1 := 0;
      if QryArtBCL_CONSIDERA_SCONTO2.AsString = 'T' then Sc2 := QryArtScontoDiAcquisto2.AsFloat else Sc2 := 0;
      if QryArtBCL_CONSIDERA_SCONTO3.AsString = 'T' then Sc3 := QryArtScontoDiAcquisto3.AsFloat else Sc3 := 0;
      QryArtUltimoPrzAcquisto.Value := DM1.CalcolaImportoScontato(QryArtPrezzoDiListino.AsFloat, Sc1, Sc2, Sc3, DM1.DecMicroPrz);
      // Richiama la procedura che calcola tutti i listini in base al prezzo di listino.
      //  NB: RIcalcola i listini in base al prezzo di acquisto solo se l'articolo
      //       attuale usa il ricaroco dal prezzo di acquisto altrimenti richiama
      //       il calcolo dei listini in base al prezzo di listino e allo sconto.
      if QryArtTIPOCALCOLOLISTINO.AsString <> 'R'
      then begin
        CalcolaListiniArticoliInBaseAlPrezzoDiListino;
      end else begin
        // Se è attivata la gestione automatica dei ricarichi a fasce di prezzo, ricava
        //  i ricarichi di vendita in base al nuovo prezzo
        if DM1.RicarichiPerFasceDiPrezzo then begin
          DM1.CaricaFasceRicarichi;
          QryArtRICARICO.Value  := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 1, False);
          QryArtRICARICO2.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 2, False);
          QryArtRICARICO3.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 3, False);
          QryArtRICARICO4.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 4, False);
        end;
        // Calcola i listini
        CalcolaListiniArticoliInBaseAlPrezzoDiAcquisto;
      end;
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
   end;
end;

procedure TAnagArtForm.QryArtPREZZODILISTINOIVACOMPValidate(
  Sender: TField);
begin
   // Controlla che l'esecuzione dell'evento sia autorizzata.
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Calcola il prezzo di listino IVA esclusa
      QryArtPrezzoDiListino.Value := DM1.Arrotonda(QryArtPrezzoDiListinoIVAComp.Value * 100 / (100 + QryArtAliquotaIVA.Value), FormatSettings.CurrencyDecimals);
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
      // Poi continua come se a variare fosse stato il PrezzoDiListino
      QryArtPrezzoDiListinoValidate(QryArtPrezzoDiListino);
   end;
end;


procedure TAnagArtForm.QryArtSCONTODIACQUISTOValidate(Sender: TField);
var
  Sc1, Sc2, Sc3: Double;
begin
   // Controlla che l'esecuzione dell'evento sia autorizzata.
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      try
        // Calcola il prezzo di acquisto applicando gli sconti
        //  NB: Questo è la base per il calcolo desi listini di vendita
        QryArtCOSTOREALE.Value := DM1.CalcolaImportoScontato(QryArtPrezzoDiListino.AsFloat,
                                                             QryArtScontoDiAcquisto.AsFloat,
                                                             QryArtScontoDiAcquisto2.AsFloat,
                                                             QryArtScontoDiAcquisto3.AsFloat,
                                                             DM1.DecMicroPrz);
        // Calcola il prezzo di acquisto applicando gli sconti
        //  NB: Questo è la base per il calcolo desi listini di vendita
        //  NB: Prima verifica quali sono gli sconti da considerare
        if QryArtBCL_CONSIDERA_SCONTO1.AsString = 'T' then Sc1 := QryArtScontoDiAcquisto.AsFloat else Sc1 := 0;
        if QryArtBCL_CONSIDERA_SCONTO2.AsString = 'T' then Sc2 := QryArtScontoDiAcquisto2.AsFloat else Sc2 := 0;
        if QryArtBCL_CONSIDERA_SCONTO3.AsString = 'T' then Sc3 := QryArtScontoDiAcquisto3.AsFloat else Sc3 := 0;
        QryArtUltimoPrzAcquisto.Value := DM1.CalcolaImportoScontato(QryArtPrezzoDiListino.AsFloat, Sc1, Sc2, Sc3, DM1.DecMicroPrz);
        // Richiama la procedura che calcola tutti i listini in base al prezzo di listino.
        //  NB: RIcalcola i listini in base al prezzo di acquisto solo se l'articolo
        //       attuale usa il ricaroco dal prezzo di acquisto altrimenti richiama
        //       il calcolo dei listini in base al prezzo di listino e allo sconto.
        if QryArtTIPOCALCOLOLISTINO.AsString <> 'R'
        then begin
          CalcolaListiniArticoliInBaseAlPrezzoDiListino;
        end else begin
          // Se è attivata la gestione automatica dei ricarichi a fasce di prezzo, ricava
          //  i ricarichi di vendita in base al nuovo prezzo
          if DM1.RicarichiPerFasceDiPrezzo then begin
            DM1.CaricaFasceRicarichi;
            QryArtRICARICO.Value  := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 1, False);
            QryArtRICARICO2.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 2, False);
            QryArtRICARICO3.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 3, False);
            QryArtRICARICO4.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 4, False);
          end;
          // Calcola i listini
          CalcolaListiniArticoliInBaseAlPrezzoDiAcquisto;
        end;
      finally
        // Riabilita l'evento 'OnValidate'
        GoValidate := True;
      end;
   end;
end;

procedure TAnagArtForm.QryArtSCONTOLISTINO1Validate(Sender: TField);
begin
   // Controlla che l'esecuzione dell'evento sia autorizzata.
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Richiama la procedura che calcola tutti i listini in base al prezzo di listino.
      CalcolaListiniArticoliInBaseAlPrezzoDiListino;
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
   end;
end;

procedure TAnagArtForm.QryArtPRZVENDIVACOMP1Validate(Sender: TField);
begin
   // Esegue l'evento solo se autorizzato
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Calcola il prezzo di vendita IVA esclusa e poi richiama il ricalcolo
      //  dei listini per variazione del prezzo di vendita
      if (not QryArtAliquotaIVA.IsNull)and(QryArtAliquotaIVA.Value <> 0) then begin
         QryArtPrezzoDiVendita.Value  := DM1.Arrotonda(QryArtPrzVendIVAComp1.Value * 100 / (100+QryArtAliquotaIVA.Value), FormatSettings.CurrencyDecimals);
         QryArtPrezzoDiVendita2.Value := DM1.Arrotonda(QryArtPrzVendIVAComp2.Value * 100 / (100+QryArtAliquotaIVA.Value), FormatSettings.CurrencyDecimals);
         QryArtPrezzoDiVendita3.Value := DM1.Arrotonda(QryArtPrzVendIVAComp3.Value * 100 / (100+QryArtAliquotaIVA.Value), FormatSettings.CurrencyDecimals);
         QryArtPrezzoDiVendita4.Value := DM1.Arrotonda(QryArtPrzVendIVAComp4.Value * 100 / (100+QryArtAliquotaIVA.Value), FormatSettings.CurrencyDecimals);
      end else begin
         QryArtPrezzoDiVendita.Value  := QryArtPrzVendIVAComp1.Value;
         QryArtPrezzoDiVendita2.Value := QryArtPrzVendIVAComp2.Value;
         QryArtPrezzoDiVendita3.Value := QryArtPrzVendIVAComp3.Value;
         QryArtPrezzoDiVendita4.Value := QryArtPrzVendIVAComp4.Value;
      end;
      CalcolaListiniArticoliPerCambioPrezzoDiVendita;
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
   end;
end;

procedure TAnagArtForm.QryArtQTAOPERAChange(Sender: TField);
begin
   // Richiama il calcolo dei totali
   PreventiviOrdiniForm.CalcolaTotali(True);
end;



procedure TAnagArtForm.CalcolaListiniArticoliPerCambioPrezzoDiVendita;
begin
   // Calcola l'importo ricarico
   QryArtImportoRicarico.Value  := QryArtPrezzoDiVendita.Value  - QryArtUltimoPrzAcquisto.Value;
   QryArtImportoRicarico2.Value := QryArtPrezzoDiVendita2.Value - QryArtUltimoPrzAcquisto.Value;
   QryArtImportoRicarico3.Value := QryArtPrezzoDiVendita3.Value - QryArtUltimoPrzAcquisto.Value;
   QryArtImportoRicarico4.Value := QryArtPrezzoDiVendita4.Value - QryArtUltimoPrzAcquisto.Value;
   // Calcola la percentuale di ricarico (Arrotondato al secondo decimale dopo la virgola)
   if QryArtUltimoPrzAcquisto.Value > 0 then begin
      QryArtRicarico.Value  := Round( (QryArtImportoRicarico.Value  * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
      QryArtRicarico2.Value := Round( (QryArtImportoRicarico2.Value * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
      QryArtRicarico3.Value := Round( (QryArtImportoRicarico3.Value * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
      QryArtRicarico4.Value := Round( (QryArtImportoRicarico4.Value * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
   end else begin
      QryArtRicarico.Value  := 0;
      QryArtRicarico2.Value  := 0;
      QryArtRicarico3.Value  := 0;
      QryArtRicarico4.Value  := 0;
   end;
   // Calcola lo sconto di rispetto al prezzo di listino (Arrotondato al secondo decimale dopo la virgola)
   if QryArtPrezzoDiListino.Value > 0 then begin
      QryArtScontoListino1.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita.Value)  * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
      QryArtScontoListino2.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita2.Value) * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
      QryArtScontoListino3.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita3.Value) * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
      QryArtScontoListino4.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita4.Value) * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
   end else begin
      QryArtScontoListino1.Value := 0;
      QryArtScontoListino2.Value := 0;
      QryArtScontoListino3.Value := 0;
      QryArtScontoListino4.Value := 0;
   end;
   // Calcola il prezzo IVA compresa
   QryArtPrzVendIVAComp1.Value := QryArtPrezzoDiVendita.Value  + DM1.Arrotonda((QryArtPrezzoDiVendita.Value  * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp2.Value := QryArtPrezzoDiVendita2.Value + DM1.Arrotonda((QryArtPrezzoDiVendita2.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp3.Value := QryArtPrezzoDiVendita3.Value + DM1.Arrotonda((QryArtPrezzoDiVendita3.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp4.Value := QryArtPrezzoDiVendita4.Value + DM1.Arrotonda((QryArtPrezzoDiVendita4.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
end;



procedure TAnagArtForm.CalcolaListiniArticoliInBaseAlPrezzoDiListino;
begin
   // Calcola il prezzo di vendita netto
   QryArtPrezzoDiVendita.Value  := QryArtPrezzoDiListino.Value - DM1.Arrotonda(  (QryArtPrezzoDiListino.Value / 100 * QryArtScontoListino1.Value),  FormatSettings.CurrencyDecimals);
   QryArtPrezzoDiVendita2.Value := QryArtPrezzoDiListino.Value - DM1.Arrotonda(  (QryArtPrezzoDiListino.Value / 100 * QryArtScontoListino2.Value),  FormatSettings.CurrencyDecimals);
   QryArtPrezzoDiVendita3.Value := QryArtPrezzoDiListino.Value - DM1.Arrotonda(  (QryArtPrezzoDiListino.Value / 100 * QryArtScontoListino3.Value),  FormatSettings.CurrencyDecimals);
   QryArtPrezzoDiVendita4.Value := QryArtPrezzoDiListino.Value - DM1.Arrotonda(  (QryArtPrezzoDiListino.Value / 100 * QryArtScontoListino4.Value),  FormatSettings.CurrencyDecimals);
   // Calcola l'importo del ricarico
   QryArtImportoRicarico.Value  := QryArtPrezzoDiVendita.Value  - QryArtUltimoPrzAcquisto.Value;
   QryArtImportoRicarico2.Value := QryArtPrezzoDiVendita2.Value - QryArtUltimoPrzAcquisto.Value;
   QryArtImportoRicarico3.Value := QryArtPrezzoDiVendita3.Value - QryArtUltimoPrzAcquisto.Value;
   QryArtImportoRicarico4.Value := QryArtPrezzoDiVendita4.Value - QryArtUltimoPrzAcquisto.Value;
   // Calcola la percentuale di ricarico (Arrotondato al secondo decimale dopo la virgola)
//   if QryArtUltimoPrzAcquisto.Value > 0 then begin
//      QryArtRicarico.Value  := Round( (QryArtImportoRicarico.Value  * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
//      QryArtRicarico2.Value := Round( (QryArtImportoRicarico2.Value * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
//      QryArtRicarico3.Value := Round( (QryArtImportoRicarico3.Value * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
//      QryArtRicarico4.Value := Round( (QryArtImportoRicarico4.Value * 100 / QryArtUltimoPrzAcquisto.Value) * 100) / 100;
//   end else begin
//      QryArtRicarico.Value  := 0;
//      QryArtRicarico2.Value  := 0;
//      QryArtRicarico3.Value  := 0;
//      QryArtRicarico4.Value  := 0;
//   end;
   // Calcola il prezzo IVA compresa
   QryArtPrzVendIVAComp1.Value := QryArtPrezzoDiVendita.Value  + DM1.Arrotonda((QryArtPrezzoDiVendita.Value  * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp2.Value := QryArtPrezzoDiVendita2.Value + DM1.Arrotonda((QryArtPrezzoDiVendita2.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp3.Value := QryArtPrezzoDiVendita3.Value + DM1.Arrotonda((QryArtPrezzoDiVendita3.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp4.Value := QryArtPrezzoDiVendita4.Value + DM1.Arrotonda((QryArtPrezzoDiVendita4.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   // Ricalcola il prezzo di listino IVA compresa
   QryArtPrezzoDiListinoIVAComp.Value := QryArtPrezzoDiListino.Value + DM1.Arrotonda(QryArtPrezzoDiListino.Value * QryArtAliquotaIVA.Value / 100, FormatSettings.CurrencyDecimals);
end;


procedure TAnagArtForm.CalcolaListiniArticoliInBaseAlPrezzoDiAcquisto;
begin
   // Calcola l'importo del ricarico
   QryArtImportoRicarico.Value  := DM1.Arrotonda(  QryArtUltimoPrzAcquisto.Value * QryArtRicarico.Value   / 100,  FormatSettings.CurrencyDecimals);
   QryArtImportoRicarico2.Value := DM1.Arrotonda(  QryArtUltimoPrzAcquisto.Value * QryArtRicarico2.Value  / 100,  FormatSettings.CurrencyDecimals);
   QryArtImportoRicarico3.Value := DM1.Arrotonda(  QryArtUltimoPrzAcquisto.Value * QryArtRicarico3.Value  / 100,  FormatSettings.CurrencyDecimals);
   QryArtImportoRicarico4.Value := DM1.Arrotonda(  QryArtUltimoPrzAcquisto.Value * QryArtRicarico4.Value  / 100,  FormatSettings.CurrencyDecimals);
   // Calcola il prezzo di vendita
   QryArtPrezzoDiVendita.Value  := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico.Value;
   QryArtPrezzoDiVendita2.Value := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico2.Value;
   QryArtPrezzoDiVendita3.Value := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico3.Value;
   QryArtPrezzoDiVendita4.Value := QryArtUltimoPrzAcquisto.Value + QryArtImportoRicarico4.Value;
   // Calcola il prezzo IVA compresa
   QryArtPrzVendIVAComp1.Value := QryArtPrezzoDiVendita.Value  + DM1.Arrotonda((QryArtPrezzoDiVendita.Value  * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp2.Value := QryArtPrezzoDiVendita2.Value + DM1.Arrotonda((QryArtPrezzoDiVendita2.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp3.Value := QryArtPrezzoDiVendita3.Value + DM1.Arrotonda((QryArtPrezzoDiVendita3.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   QryArtPrzVendIVAComp4.Value := QryArtPrezzoDiVendita4.Value + DM1.Arrotonda((QryArtPrezzoDiVendita4.Value * QryArtAliquotaIVA.Value / 100 ), FormatSettings.CurrencyDecimals);
   // Calcola lo sconto di rispetto al prezzo di listino (Arrotondato al secondo decimale dopo la virgola)
//   if QryArtPrezzoDiListino.Value > 0 then begin
//      QryArtScontoListino1.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita.Value)  * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
//      QryArtScontoListino2.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita2.Value) * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
//      QryArtScontoListino3.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita3.Value) * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
//      QryArtScontoListino4.Value := Round( ((QryArtPrezzoDiListino.Value - QryArtPrezzoDiVendita4.Value) * 100 / QryArtPrezzoDiListino.Value) * 100 ) / 100;
//   end else begin
//      QryArtScontoListino1.Value := 0;
//      QryArtScontoListino2.Value := 0;
//      QryArtScontoListino3.Value := 0;
//      QryArtScontoListino4.Value := 0;
//   end;
   // Ricalcola il prezzo di listino IVA compresa
   QryArtPrezzoDiListinoIVAComp.Value := QryArtPrezzoDiListino.Value + DM1.Arrotonda(QryArtPrezzoDiListino.Value * QryArtAliquotaIVA.Value / 100, FormatSettings.CurrencyDecimals);
end;


procedure TAnagArtForm.QryArtUSASCONTIGRUPPIChange(Sender: TField);
var
   V : Boolean;
   Qry : TIB_Cursor;
begin
   // Se il flag è impostato a True gli sconti di acquisto vengono presi dal
   //  gruppo e quindi i relativi campi diventano non editabili
   // --------------------------------------------------------------------------
   // Crea l'oggetto Query
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // V contiene il valore del fòag per comodità
      V := (Sender.AsString = 'T');
      // Se il flag indica che bisogna usare gli sconti specificati nei gruppi rende
      //  non editabili i campi degli sconti di acquisto e importa i valori degli sconti
      //  specificati nel gruppo di appartenenza dell'articolo
      if V then begin
         // Aggiorna la visualizzazione dei campi
         with EditScontoDiAcquisto do begin
            Color    := COLOR_NORMALE;
            TabStop  := False;
            ReadOnly := True;
            Tag      := -1;
         end;
         with EditScontoDiAcquisto2 do begin
            Color    := COLOR_NORMALE;
            TabStop  := False;
            ReadOnly := True;
            Tag      := -1;
         end;
         with EditScontoDiAcquisto3 do begin
            Color    := COLOR_NORMALE;
            TabStop  := False;
            ReadOnly := True;
            Tag      := -1;
         end;
         // Imposta la query che preleverà gli sconti dei gruppi ovviamente solo se è specificato
         //  almeno il primo gruppo, altrimenti è inutile
         //  NB: Siccome questo gestore di evento viene richiamato anche nell'evento onShow della form per
         //       inizializzare i campi degli sconti, evita di entrare in questo blocco se non si è
         //       in modalità di modifica, altrimenti darebbe un errore.
         if (not QryArtCODICEGRUPPO1.IsNull) and (QryArt.State <> dsBrowse) then begin
            Qry.SQL.Add('SELECT SCONTODIACQUISTO1, SCONTODIACQUISTO2, SCONTODIACQUISTO3 FROM GRUPPI');
            Qry.SQL.Add('WHERE CODICE1 = ' + QryArtCODICEGRUPPO1.AsString);
            if not QryArtCODICEGRUPPO2.IsNull then Qry.SQL.Add('  AND CODICE2 = ' + QryArtCODICEGRUPPO2.AsString);
            if not QryArtCODICEGRUPPO3.IsNull then Qry.SQL.Add('  AND CODICE3 = ' + QryArtCODICEGRUPPO3.AsString);
            Qry.Open;
            if not Qry.Eof then begin
               if not Qry.FieldByName('SCONTODIACQUISTO1').IsNull then QryArtSCONTODIACQUISTO.Value  := Qry.FieldByName('SCONTODIACQUISTO1').AsFloat else QryArtSCONTODIACQUISTO.Value  := 0;
               if not Qry.FieldByName('SCONTODIACQUISTO2').IsNull then QryArtSCONTODIACQUISTO2.Value := Qry.FieldByName('SCONTODIACQUISTO2').AsFloat else QryArtSCONTODIACQUISTO2.Value  := 0;
               if not Qry.FieldByName('SCONTODIACQUISTO3').IsNull then QryArtSCONTODIACQUISTO3.Value := Qry.FieldByName('SCONTODIACQUISTO3').AsFloat else QryArtSCONTODIACQUISTO3.Value  := 0;
            end;
         end;
      // Se invece il flag = False ripristina l'editing e l'utilizzo degli sconti impostati
      //  nell'articolo stesso
      end else begin
         // Aggiorna la visualizzazione dei campi
         with EditScontoDiAcquisto do begin
            if RxSpeedModifica.Down then Color := COLOR_MODIFICA else Color := COLOR_NORMALE;
            TabStop  := True;
            ReadOnly := False;
            Tag      := 0;
         end;
         with EditScontoDiAcquisto2 do begin
            if RxSpeedModifica.Down then Color := COLOR_MODIFICA else Color := COLOR_NORMALE;
            TabStop  := True;
            ReadOnly := False;
            Tag      := 0;
         end;
         with EditScontoDiAcquisto3 do begin
            if RxSpeedModifica.Down then Color := COLOR_MODIFICA else Color := COLOR_NORMALE;
            TabStop  := True;
            ReadOnly := False;
            Tag      := 0;
         end;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAnagArtForm.QryArtCODICEGRUPPO1Change(Sender: TField);
begin
   // Quando campia un gruppo ed è impostato l'uso degli sconti dei gruppi provvede ovviamente
   //  all'aggiornamento degli sconti stessi in base agli sconti del nuovo gruppo selezionato.
   // ----------------------------------------------------------------------------------------
   if QryArtUSASCONTIGRUPPI.AsString = 'T' then QryArtUSASCONTIGRUPPIChange(QryArtUSASCONTIGRUPPI);
end;

procedure TAnagArtForm.QryArtCODICEGRUPPO1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
   CV : String;   // Valore corrente del campo
begin
   CV := (Sender as TField).AsString;
   // Se il valore del campo è -1 oppure 0 non visualizza nulla
   if (CV = '0') or (CV = '-1') then Text := '' else Text := CV;
end;

procedure TAnagArtForm.SBAggiungiCodiceClick(Sender: TObject);
var
   NC : String;
begin
   NC := InputBox('Aggiungi Codice', 'Digita il codice da aggiungere', '');
   if NC <> '' then begin
      QryArtCODICIAGGIUNTIVI.Value := QryArtCODICIAGGIUNTIVI.AsString + '<' + NC + '>';
   end;
end;

procedure TAnagArtForm.SBEliminaCodiceClick(Sender: TObject);
var
   NC : String;
begin
   NC := InputBox('Aggiungi Codice', 'Digita il codice da eliminare', '');
   if NC <> '' then begin
      QryArtCODICIAGGIUNTIVI.Value := StringReplace(QryArtCODICIAGGIUNTIVI.AsString, '<' + NC + '>', '', [rfReplaceAll]);
   end;
end;

procedure TAnagArtForm.BitBtnGruppo4Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 998;   // Abilita la selezione
      GruppiForm.Selezionato1  := CodiceGruppo1.Field.AsInteger;
      GruppiForm.Selezionato2  := CodiceGruppo2.Field.AsInteger;
      GruppiForm.Selezionato3  := CodiceGruppo3.Field.AsInteger;
      GruppiForm.LivelloAttivo := 4;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagArtForm.BitBtnGruppo5Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 998;   // Abilita la selezione
      GruppiForm.Selezionato1  := CodiceGruppo1.Field.AsInteger;
      GruppiForm.Selezionato2  := CodiceGruppo2.Field.AsInteger;
      GruppiForm.Selezionato3  := CodiceGruppo3.Field.AsInteger;
      GruppiForm.Selezionato4  := CodiceGruppo4.Field.AsInteger;
      GruppiForm.LivelloAttivo := 5;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagArtForm.BitBtnGruppo6Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 998;   // Abilita la selezione
      GruppiForm.Selezionato1  := CodiceGruppo1.Field.AsInteger;
      GruppiForm.Selezionato2  := CodiceGruppo2.Field.AsInteger;
      GruppiForm.Selezionato3  := CodiceGruppo3.Field.AsInteger;
      GruppiForm.Selezionato4  := CodiceGruppo4.Field.AsInteger;
      GruppiForm.Selezionato5  := CodiceGruppo5.Field.AsInteger;
      GruppiForm.LivelloAttivo := 6;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagArtForm.QryArtCODICEPHOTOARTChange(Sender: TField);
begin
   if not Sender.IsNull then begin
      if QryPA.Active then QryPA.Close;
      QryPA.Params.ParamByName('COD').AsString := Sender.AsString;
      QryPA.Open;
   end;
end;

procedure TAnagArtForm.BitBtnPhotoArtClick(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TPhotoArtForm, PhotoArtForm);
      PhotoArtForm.Parent := MainForm;
      PhotoArtForm.Tag := 999;   // Abilita la selezione
      PhotoArtForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagArtForm.QryArtAfterOpen(DataSet: TDataSet);
begin
   // Apre anche la Qry della foto
   QryArtCODICEPHOTOARTChange(QryArtCODICEPHOTOART);
end;

procedure TAnagArtForm.StaticText1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := True;
end;

procedure TAnagArtForm.EditPrezzoDiListinoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TAnagArtForm.tvFornCODICEARTICOLOFORNITOREGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if VarIsNull(ARecord.Values[Sender.Index])
  or (Trim(ARecord.Values[Sender.Index]) = '')
  then AText := '- - -';
end;

procedure TAnagArtForm.ImpostacomefornitorepreferitoClick(Sender: TObject);
begin
  if DM1.Messaggi('Imposta fornitore preferito', 'Confermi di voler impostare il fornitore selezionato come "preferito" per questo articolo?', 'NB: Il prezzo di acquisto relativo al fornitore selezionato verrà copiato e utilizzato come ultimo prezzo di acquisto dell''articolo.', [mbYes,mbNo], 0, nil) = mrYes
  then begin
    QryArtFORNITOREPREFERITO.Value := QryListFornCODICEFORNITORE.AsInteger;
    if (not QryListFornPREZZODIACQUISTO.IsNull) and (QryListFornPREZZODIACQUISTO.Value <> 0) then
      QryArtULTIMOPRZACQUISTO.Value := QryListFornPREZZODIACQUISTO.Value
    else
    if (not QryArtULTIMOPRZACQUISTO.IsNull) and (QryArtULTIMOPRZACQUISTO.Value <> 0) then
    begin
      if QryListForn.State = dsBrowse then QryListForn.Edit;
      QryListFornPREZZODIACQUISTO.Value := QryArtULTIMOPRZACQUISTO.Value;
    end;
    tvForn.DataController.Refresh;
  end;
end;

procedure TAnagArtForm.MenuListiniFornitoriPopup(Sender: TObject);
begin
  Impostacomefornitorepreferito.Visible := RxSpeedModifica.Down;
end;

procedure TAnagArtForm.EditCostoRealeDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := False;
   if not RxSpeedModifica.Down then Exit;
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
            if (Name = 'tvForn')
            then accept := True;
         end;
      end;
   end;
end;

procedure TAnagArtForm.EditCostoRealeDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
   if not RxSpeedModifica.Down then Exit;
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
            if (Name = 'tvForn')
            then ImpostacomefornitorepreferitoClick(Impostacomefornitorepreferito);
         end;
      end;
   end;
end;

procedure TAnagArtForm.tvFornCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TAnagArtForm.tvFornCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TAnagArtForm.QryArtTIPOCALCOLOLISTINOChange(Sender: TField);
begin
  ControlloVisualizzazioneScontiRicarichi;
  // Ricalcola
  QryArtPREZZODILISTINOValidate(QryArtPREZZODILISTINO);
end;

procedure TAnagArtForm.tvMagTIPOGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: String);
begin
  if AText = 'C' then begin
    AText := '1 - Chiusura';
  end else if AText = 'M' then begin
    AText := '2 - Movimenti successivi';
  end else if AText = 'A' then begin
    AText := 'Complessivo';
  end;
end;

procedure TAnagArtForm.tvMagCODICEMAGAZZINOGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
  if tvMagCODICEMAGAZZINO.GroupIndex > -1 then begin
    AText := AText + ' - ' + tvMag.DataController.DisplayTexts[ARecordIndex, tvMagDESCRIZIONE.Index];
  end;
end;

procedure TAnagArtForm.QryArtCOSTOREALEValidate(Sender: TField);
var
  TmpDouble, Sc1, Sc2, Sc3: Double;
begin
   // Controlla che l'esecuzione dell'evento sia autorizzata.
   if GoValidate then begin
      // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
      GoValidate := False;
      // Default se il PrezzoDiListino fosse zerp
      if QryArtPREZZODILISTINO.AsFloat = 0 then QryArtPREZZODILISTINO.Value := QryArtCOSTOREALE.Value;
      // Se il metodo di calcolo dei listini di vendita è a sconto sul prezo di listino
      //  ricalcola lo sconto-
      // Flag che indica se, per il ricalcolo dei prezzi di listino e di acquisto degli articoli,
      //  alla variazione del PrezzoDiListino deve essere ricalcolato il PrezzoDiAcquisto (e/o viceversa)
      //  in base agli sconti di acquisto impostati oppure se invece tali importi devono rimanere fissi e
      //  ad essere ricalcolati devono essere gli sconti
      if (QryArtTIPOCALCOLOLISTINO.AsString <> 'R') or DM1.Articoli_RicalcoloPrzAcquistoImportiFissi then begin
        QryArtSCONTODIACQUISTO.Value  := DM1.CalcolaSconto(QryArtPrezzoDiListino.AsFloat, QryArtCOSTOREALE.Value, 2);
        QryArtSCONTODIACQUISTO2.Value := 0;
        QryArtSCONTODIACQUISTO3.Value := 0;
      // Altrimenti se il metodo di calcolo dei listini di vendita è il ricarico sul prezzo
      //  di scquisto, ricalcola il prezzo di listino
      end else begin
        // Ricalcola il prezzo di listino
        TmpDouble := QryArtCOSTOREALE.AsFloat / ((100-QryArtSCONTODIACQUISTO3.AsFloat)/100);
        TmpDouble := TmpDouble / ((100-QryArtSCONTODIACQUISTO2.AsFloat)/100);
        QryArtPREZZODILISTINO.Value := DM1.arrotonda( TmpDouble / ((100-QryArtSCONTODIACQUISTO.AsFloat)/100) , DM1.DecMicroPrz);
      end;
      // Calcola il prezzo di acquisto applicando gli sconti
      //  NB: Questo è la base per il calcolo desi listini di vendita
      //  NB: Prima verifica quali sono gli sconti da considerare
      if QryArtBCL_CONSIDERA_SCONTO1.AsString = 'T' then Sc1 := QryArtScontoDiAcquisto.AsFloat else Sc1 := 0;
      if QryArtBCL_CONSIDERA_SCONTO2.AsString = 'T' then Sc2 := QryArtScontoDiAcquisto2.AsFloat else Sc2 := 0;
      if QryArtBCL_CONSIDERA_SCONTO3.AsString = 'T' then Sc3 := QryArtScontoDiAcquisto3.AsFloat else Sc3 := 0;
      QryArtUltimoPrzAcquisto.Value := DM1.CalcolaImportoScontato(QryArtPrezzoDiListino.AsFloat, Sc1, Sc2, Sc3, DM1.DecMicroPrz);
      // Richiama la procedura che calcola tutti i listini in base al prezzo di listino.
      //  NB: RIcalcola i listini in base al prezzo di acquisto solo se l'articolo
      //       attuale usa il ricaroco dal prezzo di acquisto altrimenti richiama
      //       il calcolo dei listini in base al prezzo di listino e allo sconto.
      if QryArtTIPOCALCOLOLISTINO.AsString <> 'R'
      then begin
        CalcolaListiniArticoliInBaseAlPrezzoDiListino;
      end else begin
        // Se è attivata la gestione automatica dei ricarichi a fasce di prezzo, ricava
        //  i ricarichi di vendita in base al nuovo prezzo
        if DM1.RicarichiPerFasceDiPrezzo then begin
          DM1.CaricaFasceRicarichi;
          QryArtRICARICO.Value  := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 1, False);
          QryArtRICARICO2.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 2, False);
          QryArtRICARICO3.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 3, False);
          QryArtRICARICO4.Value := DM1.GetRicaricoPerPrezzo(QryArtCOSTOREALE.AsFloat, 4, False);
        end;
        // Calcola i listini
        CalcolaListiniArticoliInBaseAlPrezzoDiAcquisto;
      end;
      // Riabilita l'evento 'OnValidate'
      GoValidate := True;
   end;
end;

procedure TAnagArtForm.DBETipo1PropertiesInitPopup(Sender: TObject);
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

procedure TAnagArtForm.SBForzaGiacenzaArticoloClick(Sender: TObject);
begin
  // Si assicura che almeno il codice artiolo non sia vuoto.
  if QryArtCODICEARTICOLO.IsNull or (Trim(QryArtCODICEARTICOLO.AsString) = '') then begin
    DM1.Messaggi('Levante', 'Codice articolo non valido!', '', [mbOk], 0, nil);
    Exit;
  end;
  // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
  Application.CreateForm(TForzaGiacenzeMagazzinoForm, ForzaGiacenzeMagazzinoForm);
  ForzaGiacenzeMagazzinoForm.AddArticolo(QryArtCODICEARTICOLO.AsString, QryArtDESCRIZIONE.AsString);
  try
    ForzaGiacenzeMagazzinoForm.ShowModal;
  finally
    // Aggiorna la query che richiama i righi dei magazzini dell'articolo e i relativi totali
    EseguiQueryMagazziniArticoli(QryArtCodiceArticolo.AsString);
  end;
end;

procedure TAnagArtForm.tvFornPREZZODILISTINOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if VarIsNull(ARecord.Values[Sender.Index])
  or (ARecord.Values[Sender.Index] = 0)
  then AText := '- - -';
end;

procedure TAnagArtForm.QryListFornPREZZODILISTINOValidate(Sender: TField);
begin
  // Controlla che l'esecuzione dell'evento sia autorizzata.
  if ListForn_GoValidate then begin
    // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
    ListForn_GoValidate := False;
    try
      // Calcola il prezzo di acquisto applicando gli sconti
      //  NB: Questo è la base per il calcolo desi listini di vendita
      QryListFornPREZZODIACQUISTO.Value := DM1.CalcolaImportoScontato(QryListFornPREZZODILISTINO.AsFloat,
                                                                  QryListFornSCONTODIACQUISTO1.AsFloat,
                                                                  QryListFornSCONTODIACQUISTO2.AsFloat,
                                                                  QryListFornSCONTODIACQUISTO3.AsFloat,
                                                                  DM1.DecMicroPrz);
    finally
      // Riabilita l'evento 'OnValidate'
      ListForn_GoValidate := True;
    end;
  end;
end;


procedure TAnagArtForm.QryListFornBeforePost(DataSet: TDataSet);
begin
  // Inizializza il codice articolo
  QryListFornCODICEARTICOLO.Value := QryArtCODICEARTICOLO.AsString;
end;

procedure TAnagArtForm.QryListFornPREZZODIACQUISTOValidate(Sender: TField);
var
  TmpDouble: Double;
begin
  // Controlla che l'esecuzione dell'evento sia autorizzata.
  if ListForn_GoValidate then begin
    // Fà in modo che i Fields modificati non effettuino l'evento 'OnValidate'
    ListForn_GoValidate := False;
    try
      // Ricalcola il prezzo di listino
      TmpDouble := QryListFornPREZZODIACQUISTO.AsFloat / ((100-QryListFornSCONTODIACQUISTO3.AsFloat)/100);
      TmpDouble := TmpDouble / ((100-QryListFornSCONTODIACQUISTO2.AsFloat)/100);
      QryListFornPREZZODILISTINO.Value := DM1.arrotonda( TmpDouble / ((100-QryListFornSCONTODIACQUISTO1.AsFloat)/100) , DM1.DecMicroPrz);
    finally
      // Riabilita l'evento 'OnValidate'
      ListForn_GoValidate := True;
    end;
  end;
end;

procedure TAnagArtForm.TabControlPagineDocumentoChange(Sender: TObject);
begin
  // In base al tab selezionato dall'utente...
  case (Sender as TcxTabControl).TabIndex of
    // ----- Tab Distinta baase
    DOCTABIDX_DISTINTABASE:
    begin
      PreventiviOrdiniForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_DISTINTABASE;
      PreventiviOrdiniForm.Show;
      // Proprietà che se messa a True fa in modo che alla prossima chiamata della procedure
      //  CaricaLayoutDocumento non vengano rielaborate le impostazioni delle colonne del documento
      //  in modo da velocizzare un pò l'esecuzione.
      PreventiviOrdiniForm.CaricaLayoutDocumento_NotLoadColumnSettingsNextTime := True;
      PreventiviOrdiniForm.CaricaLayoutDocumento;
    end;
    // ----------------------
  end;
end;

procedure TAnagArtForm.FormResize(Sender: TObject);
begin
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, FormMainPanel, False);
   // Centra la Client Area
   ClientArea.Left := Trunc((FormMainPanel.ClientWidth - ClientArea.Width) / 2);
   if ClientArea.Left < 0 then ClientArea.Left := 0;
end;

end.
