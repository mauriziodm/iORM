unit FormTabGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPerTabPageControlPrincipale, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxEdit, DB, cxDBData,
  cxTextEdit, cxMemo, cxCheckBox, cxCurrencyEdit, cxCalendar,
  cxDropDownEdit, cxClasses, cxCustomPivotGrid, cxDBPivotGrid, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxLabel, cxGroupBox, cxRadioGroup, ExtCtrls, cxPC, StdCtrls, cxContainer,
  cxMaskEdit, Mask, CheckLst, MAURI_SB, Buttons, IBODataset, DataModule1,
  IB_Components, Menus, cxNavigator, cxDBNavigator, UnitRepositoryIniFile, dxPSGlbl,
  dxPSUtl, dxBkgnd, dxWrap, dxPrnDev, 
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  ImgList, cxImageComboBox, cxData, cxDataStorage,
  dxPSEngn, dxPrnPg, dxPSCompsProvider, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.ComCtrls, dxCore, cxDateUtils,
  cxPCdxBarPopupMenu, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers,
  cxGridChartView, cxGridDBChartView, FrameChart, cxDBEdit, dxBarBuiltInMenu,
  dxDateRanges, dxScrollbarAnnotations, System.ImageList;

const
  // Costanti belle bande del btvGC
  GC_BAND_ARTICOLO              = 0;
  GC_BAND_COMMESSA              = 1;
  GC_BAND_GIACENZA              = 2;
  GC_BAND_MONTATO               = 3;
  GC_BAND_DAMONTARE_COMMESSA    = 4;
  GC_BAND_DAMONTARE_GIACENZA    = 5;
  GC_BAND_FATTURATO             = 6;
  GC_BAND_DAFATTURARE_COMMESSA  = 7;
  GC_BAND_DAFATTURARE_GIACENZA  = 8;
  GC_BAND_DAFATTURARE_MONTATO   = 9;
  GC_BAND_RIEPILOGO             = 10;
  GC_BAND_RIEPILOGO_PERC        = 11;
  GC_BAND_SOTTOCANTIERI         = 12;
  GC_BAND_MAGAZZINO             = 13;
  GC_BAND_GRUPPI                = 14;
  GC_BAND_CATEGCANT             = 15;
  // Costanti delle bande del btvGCRighi
  GCRIGHI_BAND_VARIE          = 0;
  GCRIGHI_BAND_ARTICOLO       = 1;
  GCRIGHI_BAND_VALORE         = 2;
  GCRIGHI_BAND_TRACK          = 3;
  GCRIGHI_BAND_SOTTOCANTIERI  = 4;
  GCRIGHI_BAND_GRUPPI         = 5;
  GCRIGHI_BAND_MAGAZZINO      = 6;
  GCRIGHI_BAND_DOCUMENTO      = 7;
  GCRIGHI_BAND_CATEGCANT      = 8;
  GCRIGHI_BAND_INVISIBILI     = 9;

type
  // Classe creata solo per tirare fuori una proprietà che era
  //  Protected ma che mi serviva.
  TcxCustomGridRecordByMauri = class(TcxCustomGridRecord)
  private
    function GetIsUltimoRecordDelGruppo: Boolean;
  public
    property IsUltimoRecordDelGruppo:Boolean read GetIsUltimoRecordDelGruppo;
  end;


  TTabGCForm = class(TModelPerTabPageControlPrincipaleForm)
    PanelGC: TPanel;
    PanelGCFiltri: TPanel;
    SubPanelGCFiltri: TPanel;
    GCLab_CodiceArticolo: TLabel;
    GCLab_Gruppo3: TLabel;
    GCLab_Gruppo2: TLabel;
    GCLab_Gruppo1: TLabel;
    GCLabAl: TLabel;
    GCLab_Dal: TLabel;
    GCSet: TSpeedButton;
    GCOtt: TSpeedButton;
    GCNov: TSpeedButton;
    GCDic: TSpeedButton;
    GCAgo: TSpeedButton;
    GCLug: TSpeedButton;
    GCGiu: TSpeedButton;
    GCMag: TSpeedButton;
    GCGen: TSpeedButton;
    GCFeb: TSpeedButton;
    GCMar: TSpeedButton;
    GCApr: TSpeedButton;
    GCMesiTutti: TSpeedButton;
    GCMesiNessuno: TSpeedButton;
    GCBitBtnGruppo1: TSpeedButtonRollOver;
    GCBitBtnGruppo2: TSpeedButtonRollOver;
    GCBitBtnGruppo3: TSpeedButtonRollOver;
    SpeedButtonRollOver14: TSpeedButtonRollOver;
    GCLab_Gruppo6: TLabel;
    GCLab_Gruppo5: TLabel;
    GCLab_Gruppo4: TLabel;
    GCBitBtnGruppo4: TSpeedButtonRollOver;
    GCBitBtnGruppo5: TSpeedButtonRollOver;
    GCBitBtnGruppo6: TSpeedButtonRollOver;
    GCLab_DescrizioneArticolo: TLabel;
    GCLab_Marca: TLabel;
    SBGCFilterOpenClose: TSpeedButtonRollOver;
    GCCodiceArticolo: TEdit;
    GCDescGruppo1: TEdit;
    GCDescGruppo2: TEdit;
    GCDescGruppo3: TEdit;
    GCGruppiTitolo: TStaticText;
    GCLab_TipoMovimento: TStaticText;
    GCCheckListBoxSegnoOperazione: TCheckListBox;
    GCCodiceGruppo1: TEdit;
    GCCodiceGruppo2: TEdit;
    GCCodiceGruppo3: TEdit;
    GCDescGruppo4: TEdit;
    GCDescGruppo5: TEdit;
    GCDescGruppo6: TEdit;
    GCCodiceGruppo4: TEdit;
    GCCodiceGruppo5: TEdit;
    GCCodiceGruppo6: TEdit;
    GCLab_Stato: TStaticText;
    GCSoloStato: TcxComboBox;
    GCLab_Tipo: TStaticText;
    GCTipo: TCheckListBox;
    GCDescrizione: TEdit;
    GCMarca: TEdit;
    StaticText79: TStaticText;
    FilterGCTrova: TEdit;
    Panel20: TPanel;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    cxPageControlGC: TcxPageControl;
    TabGCElenco: TcxTabSheet;
    PanelSelezioneColonne: TPanel;
    SubPanelSelezioneColonne: TPanel;
    LabelSfondoManodopera: TLabel;
    Label13: TLabel;
    Label103: TLabel;
    Shape3: TShape;
    Label104: TLabel;
    SbGcVisQta: TSpeedButton;
    SbGcVisImportiVendita: TSpeedButton;
    SbGcVisPrzUnitVendita: TSpeedButton;
    SbGcVisMem1: TSpeedButton;
    SbGcVisMem4: TSpeedButton;
    SbGcVisMem2: TSpeedButton;
    SbGcVisMem5: TSpeedButton;
    SbGcVisMem3: TSpeedButton;
    SbGcVisMemAdd: TSpeedButton;
    Label1: TLabel;
    Label4: TLabel;
    SbGcVisPrzUnitAcquisto: TSpeedButton;
    SbGcVisImportiAcquisto: TSpeedButton;
    Label9: TLabel;
    SbGcVisRicaricoPercent: TSpeedButton;
    SbGcVisRicaricoImporto: TSpeedButton;
    Shape5: TShape;
    SbGcVisPerArticolo: TSpeedButton;
    SbGcVisCronologicoGiorno: TSpeedButton;
    SbGcVisCronologicoMese: TSpeedButton;
    SbGcVisPerCantiere: TSpeedButton;
    LabelSfondoRicarico: TLabel;
    Shape4: TShape;
    Label19: TLabel;
    SbGcVisCommessa: TSpeedButton;
    SbGcVisMagazzino: TSpeedButton;
    SbGcVisGiacenza: TSpeedButton;
    SbGcVisMontato: TSpeedButton;
    SbGcVisFatturato: TSpeedButton;
    SbGcVisSottocantieri: TSpeedButton;
    SbGcVisGruppi: TSpeedButton;
    ShapeCorniceManodopera: TShape;
    GcVisLabelManodopera1: TLabel;
    GcVisLabelManodopera2: TLabel;
    GcVisLabelManodopera3: TLabel;
    GcVisLabelManodopera4: TLabel;
    GcVisLabelManodopera5: TLabel;
    StaticText11: TStaticText;
    LabelTitoloRicarico: TStaticText;
    GcVisPrezzoManodopera1: TcxCurrencyEdit;
    GcVisPrezzoManodopera2: TcxCurrencyEdit;
    GcVisPrezzoManodopera3: TcxCurrencyEdit;
    GcVisPrezzoManodopera4: TcxCurrencyEdit;
    GcVisPrezzoManodopera5: TcxCurrencyEdit;
    TabGCAda: TcxTabSheet;
    PivotGridGC: TcxDBPivotGrid;
    cxDBPivotGrid1CODICEARTICOLO: TcxDBPivotGridField;
    cxDBPivotGrid1DESCRIZIONE: TcxDBPivotGridField;
    cxDBPivotGrid1UNITADIMISURA: TcxDBPivotGridField;
    cxDBPivotGrid1SOTTOCANTIERE1: TcxDBPivotGridField;
    cxDBPivotGrid1SOTTOCANTIERE2: TcxDBPivotGridField;
    cxDBPivotGrid1SOTTOCANTIERE3: TcxDBPivotGridField;
    cxDBPivotGrid1SOTTOCANTIERE4: TcxDBPivotGridField;
    cxDBPivotGrid1SOTTOCANTIERE5: TcxDBPivotGridField;
    cxDBPivotGrid1SOTTOCANTIERE6: TcxDBPivotGridField;
    cxDBPivotGrid1QTA1: TcxDBPivotGridField;
    cxDBPivotGrid1SEGNOOPERAZIONECANTIERE: TcxDBPivotGridField;
    cxDBPivotGrid1IMPORTORIGO: TcxDBPivotGridField;
    cxDBPivotGrid1IMPORTORIGOIVACOMPRESA: TcxDBPivotGridField;
    cxDBPivotGrid1QTADISPONIBILE: TcxDBPivotGridField;
    QryGC: TIBOQuery;
    QryGCCODICEARTICOLO: TStringField;
    QryGCDESCRIZIONE: TStringField;
    QryGCTIPOLOGIA: TStringField;
    QryGCUNITADIMISURA: TStringField;
    QryGCSOTTOCANTIERE1: TStringField;
    QryGCSOTTOCANTIERE2: TStringField;
    QryGCSOTTOCANTIERE3: TStringField;
    QryGCGRUPPO1: TStringField;
    QryGCGRUPPO2: TStringField;
    QryGCGRUPPO3: TStringField;
    QryGCGRUPPO4: TStringField;
    QryGCGRUPPO5: TStringField;
    QryGCGRUPPO6: TStringField;
    QryGCCOMMESSA_QTA: TIBOFloatField;
    QryGCCOMMESSA_IMPORTOACQ: TIBOFloatField;
    QryGCCOMMESSA_IMPORTOVEND: TIBOFloatField;
    QryGCCOMMESSA_PRZUNITACQ: TCurrencyField;
    QryGCCOMMESSA_PRZUNITVEND: TCurrencyField;
    QryGCCOMMESSA_GUADAGNOIMPORTO: TIBOFloatField;
    QryGCCOMMESSA_GUADAGNOUNITARIO: TCurrencyField;
    QryGCCOMMESSA_RICARICO: TFloatField;
    QryGCGIACENZA_QTA: TFloatField;
    QryGCGIACENZA_PRZUNITACQ: TCurrencyField;
    QryGCGIACENZA_PRZUNITVEND: TCurrencyField;
    QryGCGIACENZA_IMPORTOACQ: TCurrencyField;
    QryGCGIACENZA_IMPORTOVEND: TCurrencyField;
    QryGCGIACENZA_GUADAGNOUNITARIO: TCurrencyField;
    QryGCGIACENZA_GUADAGNOIMPORTO: TCurrencyField;
    QryGCGIACENZA_RICARICO: TFloatField;
    QryGCMONTATO_QTA: TIBOFloatField;
    QryGCMONTATO_PRZUNITACQ: TCurrencyField;
    QryGCMONTATO_PRZUNITVEND: TCurrencyField;
    QryGCMONTATO_IMPORTOACQ: TCurrencyField;
    QryGCMONTATO_IMPORTOVEND: TCurrencyField;
    QryGCFATTURATO_IMPORTOVEND: TIBOFloatField;
    QryGCMAG_GIACENZA: TIBOFloatField;
    QryGCMAG_ORDINATO: TIBOFloatField;
    QryGCMAG_IMPEGNATO: TIBOFloatField;
    QryGCMAG_DISPONIBILE: TFloatField;
    QryGCMAG_DAORDINARE: TFloatField;
    QryGCMAG_ULTIMOPREZZOACQUISTO: TIBOFloatField;
    QryGCIMPORTOINVENTARIOUA: TCurrencyField;
    QryGCDATADOCUMENTO: TDateTimeField;
    SourceGC: TDataSource;
    TimerGC: TTimer;
    QryGCAda: TIBOQuery;
    QryGCAdaCODICEARTICOLO: TStringField;
    QryGCAdaDESCRIZIONE: TMemoField;
    QryGCAdaUNITADIMISURA: TStringField;
    QryGCAdaSOTTOCANTIERE1: TStringField;
    QryGCAdaSOTTOCANTIERE2: TStringField;
    QryGCAdaSOTTOCANTIERE3: TStringField;
    QryGCAdaSOTTOCANTIERE4: TStringField;
    QryGCAdaSOTTOCANTIERE5: TStringField;
    QryGCAdaSOTTOCANTIERE6: TStringField;
    QryGCAdaQTA: TIBOFloatField;
    QryGCAdaSEGNOOPERAZIONECANTIERE: TStringField;
    QryGCAdaIMPORTORIGO: TIBOFloatField;
    QryGCAdaIMPORTORIGOIVACOMPRESA: TIBOFloatField;
    QryGCAdaQTADISPONIBILE: TIBOFloatField;
    SourceGCAda: TDataSource;
    TimerAddMemoryGC: TTimer;
    MenuElencoClienti: TPopupMenu;
    Copianellabacheca1: TMenuItem;
    uttiirighi1: TMenuItem;
    Sololerigheselezionate1: TMenuItem;
    GC_CreaDoc: TMenuItem;
    GC_CreaDoc_Conto: TMenuItem;
    GC_CreaDoc_Conto_Tutte: TMenuItem;
    GC_CreaDoc_Conto_Selezionate: TMenuItem;
    GC_CreaDoc_Fattura: TMenuItem;
    GC_CreaDoc_Fattura_Tutte: TMenuItem;
    GC_CreaDoc_Fattura_Selezionate: TMenuItem;
    N8: TMenuItem;
    Selezionavista1: TMenuItem;
    Salvaimpostazionicolonne1: TMenuItem;
    Ripristinacolonneeliminate1: TMenuItem;
    N17: TMenuItem;
    EsportainformatoExcel1: TMenuItem;
    QryNewGC: TIBOQuery;
    SourceNewGC: TDataSource;
    QryNewGCCODICEARTICOLO: TStringField;
    QryNewGCUNITADIMISURA: TStringField;
    QryNewGCGC_QTA_MOD: TStringField;
    QryNewGCGC_QTA: TIBOFloatField;
    QryNewGCGC_COSTONETTOUNITARIO_MOD: TStringField;
    QryNewGCGC_COSTONETTOUNITARIO: TIBOFloatField;
    QryNewGCGC_COSTONETTOIMPORTO: TIBOFloatField;
    QryNewGCGC_RICARICO_MOD: TStringField;
    QryNewGCGC_RICARICO: TIBOFloatField;
    QryNewGCGC_GUADAGNOUNITARIO: TIBOFloatField;
    QryNewGCGC_GUADAGNOIMPORTO: TIBOFloatField;
    QryNewGCGC_PRZVEND: TIBOFloatField;
    QryNewGCGC_PRZVENDIMPORTO: TIBOFloatField;
    QryNewGCSOTTOCANTIERE1: TStringField;
    QryNewGCSOTTOCANTIERE2: TStringField;
    QryNewGCSOTTOCANTIERE3: TStringField;
    QryNewGCSEGNOOPERAZIONE: TStringField;
    QryNewGCSEGNOOPERAZIONECANTIERE: TStringField;
    QryNewGCPROGRIGO: TIntegerField;
    QryNewGCPROGRIGO2: TIntegerField;
    QryNewGCTIPOLOGIA: TStringField;
    QryNewGCTIPODOCUMENTO: TStringField;
    QryNewGCNUMORDPREV: TIntegerField;
    QryNewGCREGISTRO: TStringField;
    QryNewGCDATADOCUMENTO: TDateTimeField;
    QryNewGCSTATODESCRIZIONE: TStringField;
    QryNewGCSTATOFOREGROUND: TStringField;
    QryNewGCCAUSALE: TStringField;
    QryNewGCCODICEMAGAZZINO: TSmallintField;
    QryNewGCPREZZOUNITARIO: TIBOFloatField;
    QryNewGCQTA: TIBOFloatField;
    QryNewGCSCONTORIGO: TIBOFloatField;
    QryNewGCSCONTORIGO2: TIBOFloatField;
    QryNewGCSCONTORIGO3: TIBOFloatField;
    QryNewGCIMPORTORIGO: TIBOFloatField;
    QryNewGCPREZZOACQUISTOARTICOLO: TIBOFloatField;
    QryNewGCIMPORTOACQUISTOARTICOLO: TIBOFloatField;
    QryNewGCMARGINE: TIBOFloatField;
    QryNewGCSOGGETTO: TStringField;
    QryNewGCNOTERIGO: TMemoField;
    QryNewGCGRUPPO1: TStringField;
    QryNewGCGRUPPO2: TStringField;
    QryNewGCGRUPPO3: TStringField;
    QryNewGCGRUPPO4: TStringField;
    QryNewGCGRUPPO5: TStringField;
    QryNewGCGRUPPO6: TStringField;
    QryNewGCDESCRIZIONE: TMemoField;
    QryNewGCPRATICA: TIntegerField;
    QryNewGCDATAPRATICA1: TDateTimeField;
    cxDBNavigator1: TcxDBNavigator;
    cxDBNavigator2: TcxDBNavigator;
    MenuGCAggiungi: TPopupMenu;
    MaterialiApparecchi1: TMenuItem;
    Manodopera1: TMenuItem;
    QryNewGCOPERAINDEX: TIntegerField;
    QryNewGCRIFPRATICA: TStringField;
    QryNewGCCODICECLIENTE: TIntegerField;
    QryNewGCGC_SEZIONE: TStringField;
    QryNewGCGC_DESCRIZIONE_MOD: TStringField;
    QryNewGCGC_DESCRIZIONE: TMemoField;
    QryNewGCGRP_DATADOCUMENTO: TDateTimeField;
    QryNewGCGRP_SOTTOCANTIERE1: TStringField;
    QryNewGCGRP_SOTTOCANTIERE2: TStringField;
    QryNewGCGRP_SOTTOCANTIERE3: TStringField;
    SBGCSelezioneColonneOpenClose: TSpeedButtonRollOver;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    SbGcVisMem6: TSpeedButton;
    SbGcVisMem7: TSpeedButton;
    SbGcVisMem8: TSpeedButton;
    SbGcVisMem9: TSpeedButton;
    SbGcVisMem10: TSpeedButton;
    LabelSfondoCosto: TLabel;
    ShapeCorniceCosto: TShape;
    LabelTitoloCosto: TStaticText;
    SbGcVisDocumenti: TSpeedButton;
    PanelGridGC: TPanel;
    GridGC: TcxGrid;
    btvGC: TcxGridDBBandedTableView;
    btvGCDATADOCUMENTO: TcxGridDBBandedColumn;
    btvGCTIPOLOGIA: TcxGridDBBandedColumn;
    btvGCDESCRIZIONE: TcxGridDBBandedColumn;
    btvGCCODICEARTICOLO: TcxGridDBBandedColumn;
    btvGCUNITADIMISURA: TcxGridDBBandedColumn;
    btvGCCOMMESSA_QTA: TcxGridDBBandedColumn;
    btvGCCOMMESSA_PRZUNITACQ: TcxGridDBBandedColumn;
    btvGCCOMMESSA_IMPORTOACQ: TcxGridDBBandedColumn;
    btvGCCOMMESSA_RICARICO: TcxGridDBBandedColumn;
    btvGCCOMMESSA_GUADAGNOUNITARIO: TcxGridDBBandedColumn;
    btvGCCOMMESSA_GUADAGNOIMPORTO: TcxGridDBBandedColumn;
    btvGCCOMMESSA_PRZUNITVEND: TcxGridDBBandedColumn;
    btvGCCOMMESSA_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCGIACENZA_QTA: TcxGridDBBandedColumn;
    btvGCGIACENZA_PRZUNITACQ: TcxGridDBBandedColumn;
    btvGCGIACENZA_IMPORTOACQ: TcxGridDBBandedColumn;
    btvGCGIACENZA_RICARICO: TcxGridDBBandedColumn;
    btvGCGIACENZA_GUADAGNOUNITARIO: TcxGridDBBandedColumn;
    btvGCGIACENZA_GUADAGNOIMPORTO: TcxGridDBBandedColumn;
    btvGCGIACENZA_PRZUNITVEND: TcxGridDBBandedColumn;
    btvGCGIACENZA_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCMONTATO_QTA: TcxGridDBBandedColumn;
    btvGCMONTATO_PRZUNITACQ: TcxGridDBBandedColumn;
    btvGCMONTATO_IMPORTOACQ: TcxGridDBBandedColumn;
    btvGCMONTATO_PRZUNITVEND: TcxGridDBBandedColumn;
    btvGCMONTATO_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCFATTURATO_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCMAG_GIACENZA: TcxGridDBBandedColumn;
    btvGCMAG_ORDINATO: TcxGridDBBandedColumn;
    btvGCMAG_IMPEGNATO: TcxGridDBBandedColumn;
    btvGCMAG_DISPONIBILE: TcxGridDBBandedColumn;
    btvGCMAG_DAORDINARE: TcxGridDBBandedColumn;
    btvGCMAG_ULTIMOPREZZOACQUISTO: TcxGridDBBandedColumn;
    btvGCIMPORTOINVENTARIOUA: TcxGridDBBandedColumn;
    btvGCSOTTOCANTIERE1: TcxGridDBBandedColumn;
    btvGCSOTTOCANTIERE2: TcxGridDBBandedColumn;
    btvGCSOTTOCANTIERE3: TcxGridDBBandedColumn;
    btvGCGRUPPO1: TcxGridDBBandedColumn;
    btvGCGRUPPO2: TcxGridDBBandedColumn;
    btvGCGRUPPO3: TcxGridDBBandedColumn;
    btvGCGRUPPO4: TcxGridDBBandedColumn;
    btvGCGRUPPO5: TcxGridDBBandedColumn;
    btvGCGRUPPO6: TcxGridDBBandedColumn;
    btvGCRighi: TcxGridDBBandedTableView;
    btvGCRighiGC_SEZIONE: TcxGridDBBandedColumn;
    btvGCRighiGC_DATADOCUMENTO: TcxGridDBBandedColumn;
    btvGCRighiTIPOLOGIA: TcxGridDBBandedColumn;
    btvGCRighiSEGNOOPERAZIONE: TcxGridDBBandedColumn;
    btvGCRighiSEGNOOPERAZIONECANTIERE: TcxGridDBBandedColumn;
    btvGCRighiGC_CODICEARTICOLO: TcxGridDBBandedColumn;
    btvGCRighiGC_DESCRIZIONE_MOD: TcxGridDBBandedColumn;
    btvGCRighiGC_DESCRIZIONE: TcxGridDBBandedColumn;
    btvGCRighiGC_UNITADIMISURA: TcxGridDBBandedColumn;
    btvGCRighiGC_QTA_MOD: TcxGridDBBandedColumn;
    btvGCRighiGC_QTA: TcxGridDBBandedColumn;
    btvGCRighiGC_COSTONETTOUNITARIO_MOD: TcxGridDBBandedColumn;
    btvGCRighiGC_COSTONETTOUNITARIO: TcxGridDBBandedColumn;
    btvGCRighiGC_COSTONETTOIMPORTO: TcxGridDBBandedColumn;
    btvGCRighiGC_RICARICO_MOD: TcxGridDBBandedColumn;
    btvGCRighiGC_RICARICO: TcxGridDBBandedColumn;
    btvGCRighiGC_GUADAGNOUNITARIO: TcxGridDBBandedColumn;
    btvGCRighiGC_GUADAGNOIMPORTO: TcxGridDBBandedColumn;
    btvGCRighiGC_PRZVEND: TcxGridDBBandedColumn;
    btvGCRighiGC_PRZVENDIMPORTO: TcxGridDBBandedColumn;
    btvGCRighiSOTTOCANTIERE1: TcxGridDBBandedColumn;
    btvGCRighiSOTTOCANTIERE2: TcxGridDBBandedColumn;
    btvGCRighiSOTTOCANTIERE3: TcxGridDBBandedColumn;
    btvGCRighiGRUPPO1: TcxGridDBBandedColumn;
    btvGCRighiGRUPPO2: TcxGridDBBandedColumn;
    btvGCRighiGRUPPO3: TcxGridDBBandedColumn;
    btvGCRighiGRUPPO4: TcxGridDBBandedColumn;
    btvGCRighiGRUPPO5: TcxGridDBBandedColumn;
    btvGCRighiGRUPPO6: TcxGridDBBandedColumn;
    btvGCRighiTIPODOCUMENTO: TcxGridDBBandedColumn;
    btvGCRighiNUMORDPREV: TcxGridDBBandedColumn;
    btvGCRighiREGISTRO: TcxGridDBBandedColumn;
    btvGCRighiDATADOCUMENTO: TcxGridDBBandedColumn;
    btvGCRighiSOGGETTO: TcxGridDBBandedColumn;
    btvGCRighiCODICEARTICOLO: TcxGridDBBandedColumn;
    btvGCRighiDESCRIZIONE: TcxGridDBBandedColumn;
    btvGCRighiUNITADIMISURA: TcxGridDBBandedColumn;
    btvGCRighiPREZZOUNITARIO: TcxGridDBBandedColumn;
    btvGCRighiQTA: TcxGridDBBandedColumn;
    btvGCRighiSCONTORIGO: TcxGridDBBandedColumn;
    btvGCRighiSCONTORIGO2: TcxGridDBBandedColumn;
    btvGCRighiSCONTORIGO3: TcxGridDBBandedColumn;
    btvGCRighiIMPORTORIGO: TcxGridDBBandedColumn;
    btvGCRighiPREZZOACQUISTOARTICOLO: TcxGridDBBandedColumn;
    btvGCRighiIMPORTOACQUISTOARTICOLO: TcxGridDBBandedColumn;
    btvGCRighiMARGINE: TcxGridDBBandedColumn;
    btvGCRighiSTATODESCRIZIONE: TcxGridDBBandedColumn;
    btvGCRighiSTATOFOREGROUND: TcxGridDBBandedColumn;
    btvGCRighiCAUSALE: TcxGridDBBandedColumn;
    btvGCRighiCODICEMAGAZZINO: TcxGridDBBandedColumn;
    btvGCRighiNOTERIGO: TcxGridDBBandedColumn;
    btvGCRighiPROGRIGO: TcxGridDBBandedColumn;
    btvGCRighiPROGRIGO2: TcxGridDBBandedColumn;
    btvGCRighiGRP_DATADOCUMENTO: TcxGridDBBandedColumn;
    btvGCRighiGRP_SOTTOCANTIERE1: TcxGridDBBandedColumn;
    btvGCRighiGRP_SOTTOCANTIERE2: TcxGridDBBandedColumn;
    btvGCRighiGRP_SOTTOCANTIERE3: TcxGridDBBandedColumn;
    lvGC2: TcxGridLevel;
    lvGC2Det: TcxGridLevel;
    lvGCRighi: TcxGridLevel;
    dxPrinter: TdxComponentPrinter;
    GridGCLink: TdxGridReportLink;
    ImageListForPrint: TImageList;
    QryGCRIFPRATICA: TStringField;
    btvGCRIFPRATICA: TcxGridDBBandedColumn;
    btvGCRighiRIFPRATICA: TcxGridDBBandedColumn;
    QryNewGCGC_PRESENTEINCOMMESSA: TStringField;
    QryNewGCGC_PRZVENDDACOMMESSA: TStringField;
    btvGCRighiGC_PRESENTEINCOMMESSA: TcxGridDBBandedColumn;
    btvGCRighiGC_PRZVENDDACOMMESSA: TcxGridDBBandedColumn;
    ImageListForScreen: TImageList;
    SbGcVisTrack: TSpeedButton;
    btvGCRighiTRACK_PREVENTIVO: TcxGridDBBandedColumn;
    btvGCRighiTRACK_COMMESSA: TcxGridDBBandedColumn;
    btvGCRighiTRACK_DDT: TcxGridDBBandedColumn;
    btvGCRighiTRACK_SAL: TcxGridDBBandedColumn;
    btvGCRighiTRACK_ESTRATTO_CONTO: TcxGridDBBandedColumn;
    btvGCRighiTRACK_FATTURA: TcxGridDBBandedColumn;
    QryNewGCTRACK_PREVENTIVO: TStringField;
    QryNewGCTRACK_COMMESSA: TStringField;
    QryNewGCTRACK_DDT: TStringField;
    QryNewGCTRACK_FATTURA: TStringField;
    QryNewGCTRACK_ESTRATTO_CONTO: TStringField;
    QryNewGCTRACK_SAL: TStringField;
    QryNewGCCODICEIVA: TIntegerField;
    QryNewGCDESCRIZIONEIVA: TStringField;
    QryNewGCALIQUOTAIVA: TIBOFloatField;
    btvGCRighiCODICEIVA: TcxGridDBBandedColumn;
    btvGCRighiDESCRIZIONEIVA: TcxGridDBBandedColumn;
    btvGCRighiALIQUOTAIVA: TcxGridDBBandedColumn;
    btvGCRighiOPERAINDEX: TcxGridDBBandedColumn;
    btvGCRighiGUID_REF: TcxGridDBBandedColumn;
    QryNewGCGUID_REF: TStringField;
    QryNewGCGUID: TStringField;
    QryNewGCGUID_ANCESTOR: TStringField;
    btvGCRighiGUID: TcxGridDBBandedColumn;
    btvGCRighiGUID_ANCESTOR: TcxGridDBBandedColumn;
    QryNewGCTRACK_BOLLA_ENTR: TStringField;
    QryNewGCTRACK_FATT_ACQUI: TStringField;
    QryNewGCTRACK_ORD_FORN: TStringField;
    btvGCRighiTRACK_BOLLA_ENTR: TcxGridDBBandedColumn;
    btvGCRighiTRACK_FATT_ACQUI: TcxGridDBBandedColumn;
    btvGCRighiTRACK_ORD_FORN: TcxGridDBBandedColumn;
    TransGC: TIB_Transaction;
    TransGCAda: TIB_Transaction;
    TransNewGC: TIB_Transaction;
    DDT1: TMenuItem;
    Contuttelerighe1: TMenuItem;
    Soloconlerigheselezionate1: TMenuItem;
    SAL1: TMenuItem;
    Contuttelerighe2: TMenuItem;
    Soloconlerigheselezionate2: TMenuItem;
    TimerAutoqueryDblClick: TTimer;
    RigamanualesoloMaterialiApparecchi1: TMenuItem;
    Selezionatutto1: TMenuItem;
    ApriVisualizzaVaia1: TMenuItem;
    OpenDocMenu: TPopupMenu;
    Schedaanagraficaarticolo1: TMenuItem;
    Documento1: TMenuItem;
    N1: TMenuItem;
    Preventivo1: TMenuItem;
    Commessa1: TMenuItem;
    DDT2: TMenuItem;
    SAL2: TMenuItem;
    Estrattoconto1: TMenuItem;
    Fattura1: TMenuItem;
    Ordinefornitore1: TMenuItem;
    Bolladientrata1: TMenuItem;
    Fatturadiacquisto1: TMenuItem;
    GCLab_CantieriApertiChiusi: TStaticText;
    GCCantieriApertiChiusi: TCheckListBox;
    QryGCMONTATO_GUADAGNOIMPORTO: TIBOFloatField;
    QryGCDAMONT_GIACENZA_IMPORTOVEND: TIBOFloatField;
    QryGCDAMONT_COMMESSA_IMPORTOVEND: TIBOFloatField;
    QryGCDAFATT_GIACENZA_IMPORTOVEND: TIBOFloatField;
    QryGCDAFATT_COMMESSA_IMPORTOVEND: TIBOFloatField;
    QryGCDAFATT_MONTATO_IMPORTOVEND: TIBOFloatField;
    QryGCMONTATO_GUADAGNOUNITARIO: TCurrencyField;
    QryGCMONTATO_RICARICO: TFloatField;
    btvGCMONTATO_GUADAGNOUNITARIO: TcxGridDBBandedColumn;
    btvGCMONTATO_GUADAGNOIMPORTO: TcxGridDBBandedColumn;
    btvGCMONTATO_RICARICO: TcxGridDBBandedColumn;
    btvGCDAMONT_GIACENZA_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCDAMONT_COMMESSA_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCDAFATT_GIACENZA_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCDAFATT_COMMESSA_IMPORTOVEND: TcxGridDBBandedColumn;
    btvGCDAFATT_MONTATO_IMPORTOVEND: TcxGridDBBandedColumn;
    SbGcVisDaMontareCommessa: TSpeedButton;
    SbGcVisDaMontareGiacenza: TSpeedButton;
    SbGcVisDaFatturareCommessa: TSpeedButton;
    SbGcVisDaFatturareGiacenza: TSpeedButton;
    SbGcVisDaFatturareMontato: TSpeedButton;
    PanelFiltersSottocantieri: TPanel;
    GCLabelSottocantiere1: TStaticText;
    GCSottocantiere1: TcxComboBox;
    GCLabelSottocantiere2: TStaticText;
    GCSottocantiere2: TcxComboBox;
    GCLabelSottocantiere3: TStaticText;
    GCSottocantiere3: TcxComboBox;
    PanelFilterCategorieCantieri: TPanel;
    GCLabelCategCant1: TStaticText;
    GCCategCant1: TcxComboBox;
    GCLabelCategCant2: TStaticText;
    GCCategCant2: TcxComboBox;
    GCLabelCategCant3: TStaticText;
    GCCategCant3: TcxComboBox;
    GCLabelCategCant4: TStaticText;
    GCCategCant4: TcxComboBox;
    GCLabelCategCant5: TStaticText;
    GCCategCant5: TcxComboBox;
    GCLabelCategCant6: TStaticText;
    GCCategCant6: TcxComboBox;
    QryGCCATEGCANT1: TStringField;
    QryGCCATEGCANT2: TStringField;
    QryGCCATEGCANT3: TStringField;
    QryGCCATEGCANT4: TStringField;
    QryGCCATEGCANT5: TStringField;
    QryGCCATEGCANT6: TStringField;
    SbGcVisCategCant: TSpeedButton;
    btvGCCATEGCANT1: TcxGridDBBandedColumn;
    btvGCCATEGCANT2: TcxGridDBBandedColumn;
    btvGCCATEGCANT3: TcxGridDBBandedColumn;
    btvGCCATEGCANT4: TcxGridDBBandedColumn;
    btvGCCATEGCANT5: TcxGridDBBandedColumn;
    btvGCCATEGCANT6: TcxGridDBBandedColumn;
    SpeedButton1: TSpeedButton;
    SbGcVisMemSetPredef: TSpeedButton;
    GCLabelSoloRighiNoZero: TStaticText;
    GCSoloRighiNoZero: TCheckListBox;
    QryNewGCMAG_GIACENZA: TIBOFloatField;
    QryNewGCMAG_ORDINATO: TIBOFloatField;
    QryNewGCMAG_IMPEGNATO: TIBOFloatField;
    QryNewGCMAG_ULTIMOPREZZOACQUISTO: TIBOFloatField;
    QryNewGCMAG_DISPONIBILE: TFloatField;
    QryNewGCIMPORTOINVENTARIOUA: TCurrencyField;
    btvGCRighiMAG_GIACENZA: TcxGridDBBandedColumn;
    btvGCRighiMAG_ORDINATO: TcxGridDBBandedColumn;
    btvGCRighiMAG_IMPEGNATO: TcxGridDBBandedColumn;
    btvGCRighiMAG_DISPONIBILE: TcxGridDBBandedColumn;
    btvGCRighiMAG_ULTIMOPREZZOACQUISTO: TcxGridDBBandedColumn;
    btvGCRighiIMPORTOINVENTARIOUA: TcxGridDBBandedColumn;
    Esportainformatotesto1: TMenuItem;
    QryNewGCRIFDOC: TStringField;
    btvGCRighiRIFDOC: TcxGridDBBandedColumn;
    btvGCRighiCODICEARTICOLOREALE: TcxGridDBBandedColumn;
    QryNewGCCODICEARTICOLOREALE: TStringField;
    QryNewGCAGENTE: TStringField;
    QryNewGCAGENTE2: TStringField;
    QryNewGCAGENTE3: TStringField;
    QryNewGCAGENTE4: TStringField;
    QryNewGCTIPO1: TStringField;
    QryNewGCTIPO2: TStringField;
    QryNewGCTIPO3: TStringField;
    QryNewGCTIPO4: TStringField;
    QryNewGCTIPO5: TStringField;
    QryNewGCTIPO6: TStringField;
    btvGCRighiAGENTE1: TcxGridDBBandedColumn;
    btvGCRighiAGENTE2: TcxGridDBBandedColumn;
    btvGCRighiAGENTE3: TcxGridDBBandedColumn;
    btvGCRighiAGENTE4: TcxGridDBBandedColumn;
    btvGCRighiTIPO1: TcxGridDBBandedColumn;
    btvGCRighiTIPO2: TcxGridDBBandedColumn;
    btvGCRighiTIPO3: TcxGridDBBandedColumn;
    btvGCRighiTIPO4: TcxGridDBBandedColumn;
    btvGCRighiTIPO5: TcxGridDBBandedColumn;
    btvGCRighiTIPO6: TcxGridDBBandedColumn;
    LabelGCAgente: TStaticText;
    GCAgente: TcxComboBox;
    LabelGCAgente2: TStaticText;
    GCAgente2: TcxComboBox;
    LabelGCAgente3: TStaticText;
    GCAgente3: TcxComboBox;
    LabelGCAgente4: TStaticText;
    GCAgente4: TcxComboBox;
    GCLabelTipo1: TStaticText;
    GCTipo1: TcxComboBox;
    GCLabelTipo2: TStaticText;
    GCTipo2: TcxComboBox;
    GCLabelTipo3: TStaticText;
    GCTipo3: TcxComboBox;
    GCLabelTipo4: TStaticText;
    GCTipo4: TcxComboBox;
    GCLabelTipo5: TStaticText;
    GCTipo5: TcxComboBox;
    GCLabelTipo6: TStaticText;
    GCTipo6: TcxComboBox;
    Panel8: TPanel;
    SBGCCollapse: TSpeedButton;
    SBGCExpand: TSpeedButton;
    SBFilterRowSoggetti: TSpeedButton;
    QryNewGCCATEGCANT1: TStringField;
    QryNewGCCATEGCANT2: TStringField;
    QryNewGCCATEGCANT3: TStringField;
    QryNewGCCATEGCANT4: TStringField;
    QryNewGCCATEGCANT5: TStringField;
    QryNewGCCATEGCANT6: TStringField;
    btvGCRighiCATEGCANT1: TcxGridDBBandedColumn;
    btvGCRighiCATEGCANT2: TcxGridDBBandedColumn;
    btvGCRighiCATEGCANT3: TcxGridDBBandedColumn;
    btvGCRighiCATEGCANT4: TcxGridDBBandedColumn;
    btvGCRighiCATEGCANT5: TcxGridDBBandedColumn;
    btvGCRighiCATEGCANT6: TcxGridDBBandedColumn;
    QryNewGCIMMOBLOCALITA: TStringField;
    QryNewGCIMMOBINDIRIZZO: TStringField;
    QryNewGCIMMOBNUMCIVICO: TStringField;
    QryNewGCIMMOBPROVINCIA: TStringField;
    QryNewGCIMMOBCAP: TStringField;
    btvGCRighiIMMOBLOCALITA: TcxGridDBBandedColumn;
    btvGCRighiIMMOBINDIRIZZO: TcxGridDBBandedColumn;
    btvGCRighiIMMOBNUMCIVICO: TcxGridDBBandedColumn;
    btvGCRighiIMMOBPROVINCIA: TcxGridDBBandedColumn;
    btvGCRighiIMMOBCAP: TcxGridDBBandedColumn;
    GCDal: TcxDateEdit;
    GCAl: TcxDateEdit;
    Panel1: TPanel;
    GCVisTipoCosto: TcxRadioGroup;
    Panel2: TPanel;
    GcVisTipoRicarico: TcxRadioGroup;
    ShapeCorniceRicarico: TShape;
    GcVisRicaricoPerc: TcxCurrencyEdit;
    GcVisListino: TcxComboBox;
    GCVisLabelTipoRicaricoComeDaCommessa: TLabel;
    GCVisTipoRicaricoComeDaCommessa: TcxCheckBox;
    QryGCRIFSOGGPRAT: TStringField;
    QryNewGCRIFSOGGPRAT: TStringField;
    btvGCRighiRIFSOGGPRAT: TcxGridDBBandedColumn;
    btvGCRIFSOGGPRAT: TcxGridDBBandedColumn;
    btvGCRighiPRATICA: TcxGridDBBandedColumn;
    QryGCRIEP_QTA: TFloatField;
    QryGCRIEP_COSTI: TCurrencyField;
    QryGCRIEP_MARGINE_COMMESSA: TCurrencyField;
    QryGCRIEP_MARGINE_FATTURATO: TCurrencyField;
    QryGCRIEP_PERC_QTA: TFloatField;
    QryGCRIEP_PERC_COSTI: TCurrencyField;
    QryGCRIEP_PERC_MARGINE_COMMESSA: TCurrencyField;
    QryGCRIEP_PERC_MARGINE_FATTURATO: TCurrencyField;
    btvGCRIEP_QTA: TcxGridDBBandedColumn;
    btvGCRIEP_COSTI: TcxGridDBBandedColumn;
    btvGCRIEP_MARGINE_COMMESSA: TcxGridDBBandedColumn;
    btvGCRIEP_MARGINE_FATTURATO: TcxGridDBBandedColumn;
    btvGCRIEP_PERC_QTA: TcxGridDBBandedColumn;
    btvGCRIEP_PERC_COSTI: TcxGridDBBandedColumn;
    btvGCRIEP_PERC_MARGINE_COMMESSA: TcxGridDBBandedColumn;
    btvGCRIEP_PERC_MARGINE_FATTURATO: TcxGridDBBandedColumn;
    SbGcVisRiepilogo: TSpeedButton;
    SbGcVisRiepilogoPerc: TSpeedButton;
    TabGCCharts: TcxTabSheet;
    LabelTitoloManodopera: TStaticText;
    GcVisCostoManodopera1: TcxCurrencyEdit;
    GcVisCostoManodopera2: TcxCurrencyEdit;
    GcVisCostoManodopera3: TcxCurrencyEdit;
    GcVisCostoManodopera4: TcxCurrencyEdit;
    GcVisCostoManodopera5: TcxCurrencyEdit;
    LabelTitoloManodoperaVend: TStaticText;
    LabelTitoloManodoperaCosto: TStaticText;
    GCVisAccorpaManodoperaInBacheca: TcxCheckBox;
    Label5: TLabel;
    QryGCRIEP_MARGINE_MONTATO: TCurrencyField;
    QryGCRIEP_PERC_MARGINE_MONTATO: TCurrencyField;
    btvGCRIEP_MARGINE_MONTATO: TcxGridDBBandedColumn;
    btvGCRIEP_PERC_MARGINE_MONTATO: TcxGridDBBandedColumn;
    StaticText1: TStaticText;
    GCAltroDate: TCheckListBox;
    QryGCTIPO1: TStringField;
    QryGCTIPO2: TStringField;
    QryGCTIPO3: TStringField;
    QryGCTIPO4: TStringField;
    QryGCTIPO5: TStringField;
    QryGCTIPO6: TStringField;
    btvGCTIPO1: TcxGridDBBandedColumn;
    btvGCTIPO2: TcxGridDBBandedColumn;
    btvGCTIPO3: TcxGridDBBandedColumn;
    btvGCTIPO4: TcxGridDBBandedColumn;
    btvGCTIPO5: TcxGridDBBandedColumn;
    btvGCTIPO6: TcxGridDBBandedColumn;
    QryNewGCGRP_TIPO1: TStringField;
    QryNewGCGRP_TIPO2: TStringField;
    QryNewGCGRP_TIPO3: TStringField;
    QryNewGCGRP_TIPO4: TStringField;
    QryNewGCGRP_TIPO5: TStringField;
    QryNewGCGRP_TIPO6: TStringField;
    btvGCRighiGRP_TIPO1: TcxGridDBBandedColumn;
    btvGCRighiGRP_TIPO2: TcxGridDBBandedColumn;
    btvGCRighiGRP_TIPO3: TcxGridDBBandedColumn;
    btvGCRighiGRP_TIPO4: TcxGridDBBandedColumn;
    btvGCRighiGRP_TIPO5: TcxGridDBBandedColumn;
    btvGCRighiGRP_TIPO6: TcxGridDBBandedColumn;
    QryGCAGENTE: TStringField;
    QryGCAGENTE2: TStringField;
    QryGCAGENTE3: TStringField;
    QryGCAGENTE4: TStringField;
    btvGCAGENTE1: TcxGridDBBandedColumn;
    btvGCAGENTE2: TcxGridDBBandedColumn;
    btvGCAGENTE3: TcxGridDBBandedColumn;
    btvGCAGENTE4: TcxGridDBBandedColumn;
    QryNewGCGRP_AGENTE1: TStringField;
    QryNewGCGRP_AGENTE2: TStringField;
    QryNewGCGRP_AGENTE3: TStringField;
    QryNewGCGRP_AGENTE4: TStringField;
    btvGCRighiGRP_AGENTE1: TcxGridDBBandedColumn;
    btvGCRighiGRP_AGENTE2: TcxGridDBBandedColumn;
    btvGCRighiGRP_AGENTE3: TcxGridDBBandedColumn;
    btvGCRighiGRP_AGENTE4: TcxGridDBBandedColumn;
    Raggruppadatapergiornosolovistacronologica1: TMenuItem;
    N2: TMenuItem;
    QryNewGCRDA: TStringField;
    btvGCRighiRDA: TcxGridDBBandedColumn;
    btvGCRighiDATAPRATICA1: TcxGridDBBandedColumn;
    QryNewGCDESCRIZIONEPRATICA: TStringField;
    btvGCRighiDESCRIZIONEPRATICA: TcxGridDBBandedColumn;
    StaticText39: TStaticText;
    GCRDA: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerGCTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QryGCCalcFields(DataSet: TDataSet);
    procedure btvGCDataControllerGroupingChanged(Sender: TObject);
    procedure btvGCDblClick(Sender: TObject);
    procedure btvGCEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure btvGCKeyPress(Sender: TObject; var Key: Char);
    procedure btvGCMAG_DAORDINAREGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure SbGcVisCommessaClick(Sender: TObject);
    procedure SbGcVisCommessaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SbGcVisMem1Click(Sender: TObject);
    procedure TimerAddMemoryGCTimer(Sender: TObject);
    procedure SbGcVisMem1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SbGcVisMemAddClick(Sender: TObject);
    procedure SBGCFilterOpenCloseClick(Sender: TObject);
    procedure FilterGCTrovaKeyPress(Sender: TObject; var Key: Char);
    procedure GCSoloStatoPropertiesInitPopup(Sender: TObject);
    procedure GCTipoClickCheck(Sender: TObject);
    procedure GCTipoExit(Sender: TObject);
    procedure GCTipoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GCBitBtnGruppo1Click(Sender: TObject);
    procedure GCBitBtnGruppo2Click(Sender: TObject);
    procedure GCBitBtnGruppo3Click(Sender: TObject);
    procedure GCBitBtnGruppo4Click(Sender: TObject);
    procedure GCBitBtnGruppo5Click(Sender: TObject);
    procedure GCBitBtnGruppo6Click(Sender: TObject);
    procedure GCCodiceGruppo1Change(Sender: TObject);
    procedure GCCodiceGruppo2Change(Sender: TObject);
    procedure GCCodiceGruppo3Change(Sender: TObject);
    procedure GCCodiceGruppo4Change(Sender: TObject);
    procedure GCCodiceGruppo5Change(Sender: TObject);
    procedure GCMesiTuttiClick(Sender: TObject);
    procedure GCMesiTuttiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GCMesiNessunoClick(Sender: TObject);
    procedure GCMesiNessunoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GCGenClick(Sender: TObject);
    procedure GCGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelGCFiltriResize(Sender: TObject);
    procedure SBGCExpandClick(Sender: TObject);
    procedure SBGCCollapseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Selezionatutto1Click(Sender: TObject);
    procedure uttiirighi1Click(Sender: TObject);
    procedure Sololerigheselezionate1Click(Sender: TObject);
    procedure GC_CreaDoc_Conto_TutteClick(Sender: TObject);
    procedure GC_CreaDoc_Conto_SelezionateClick(Sender: TObject);
    procedure GC_CreaDoc_Fattura_TutteClick(Sender: TObject);
    procedure GC_CreaDoc_Fattura_SelezionateClick(Sender: TObject);
    procedure EsportainformatoExcel1Click(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Salvaimpostazionicolonne1Click(Sender: TObject);
    procedure Ripristinacolonneeliminate1Click(Sender: TObject);
    procedure PivotGridGCCustomization(Sender: TObject);
    procedure MaterialiApparecchi1Click(Sender: TObject);
    procedure Manodopera1Click(Sender: TObject);
    procedure btvGCRighiCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvGCRighiCustomDrawBandHeader(
      Sender: TcxGridBandedTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridBandHeaderViewInfo; var ADone: Boolean);
    procedure btvGCRighiCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btvGCRighiTIPODOCUMENTOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure QryNewGCGC_DESCRIZIONE_MODChange(Sender: TField);
    procedure QryNewGCGC_DESCRIZIONEChange(Sender: TField);
    procedure btvGCRighiSEGNOOPERAZIONEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvGCRighiSEGNOOPERAZIONECANTIEREGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvGCRighiSOTTOCANTIERE1PropertiesInitPopup(Sender: TObject);
    procedure btvGCRighiSEGNOOPERAZIONECANTIEREPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure btvGCRighiCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btvGCRighiCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure btvGCRighiCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure SBGCSelezioneColonneOpenCloseClick(Sender: TObject);
    procedure QryNewGCGC_QTA_MODChange(Sender: TField);
    procedure QryNewGCGC_QTAChange(Sender: TField);
    procedure QryNewGCGC_COSTONETTOUNITARIO_MODChange(Sender: TField);
    procedure QryNewGCGC_COSTONETTOUNITARIOChange(Sender: TField);
    procedure QryNewGCGC_RICARICO_MODChange(Sender: TField);
    procedure QryNewGCGC_RICARICOChange(Sender: TField);
    procedure SbGcVisPerArticoloMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SbGcVisPerArticoloClick(Sender: TObject);
    procedure GridGCLinkCustomDrawFooterCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridTableView;
      ARecord: TcxCustomGridRecord; AColumn: TcxGridColumn;
      ALevel: Integer; AnItem: TdxReportCellString; var ADone: Boolean);
    procedure GridGCLinkCustomDrawCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AColumn: TcxGridColumn;
      AnItem: TAbstractdxReportCellData; var ADone: Boolean);
    procedure GridGCLinkCustomDrawBandCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridBandedTableView; ABand: TcxGridBand;
      AnItem: TdxReportCellString; var ADone: Boolean);
    procedure btvGCRighiGC_RICARICOGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure GridGCLinkCustomDrawHeaderCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridTableView; AColumn: TcxGridColumn;
      AnItem: TdxReportCellString; var ADone: Boolean);
    procedure dxPrinterCustomDrawPageHeader(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure dxPrinterCustomDrawPageFooter(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure btvGCGIACENZA_QTAGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: String);
    procedure QryNewGCBeforeDelete(DataSet: TDataSet);
    procedure btvGCRighiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btvGCRighiSOTTOCANTIERE2PropertiesInitPopup(Sender: TObject);
    procedure btvGCRighiSOTTOCANTIERE3PropertiesPopup(Sender: TObject);
    procedure btvGCRighiEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure btvGCGIACENZA_QTAGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvGCRighiTRACK_PREVENTIVOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    function ElaboraDescrizioneTracking(AText: String; Grouped: Boolean; ARecord: TcxCustomGridRecord): String;
    procedure dxPrinterStartGenerateReport(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure dxPrinterEndGenerateReport(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure btvGCRighiEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure GCSottocantiere1PropertiesInitPopup(Sender: TObject);
    procedure Contuttelerighe1Click(Sender: TObject);
    procedure Soloconlerigheselezionate1Click(Sender: TObject);
    procedure Contuttelerighe2Click(Sender: TObject);
    procedure Soloconlerigheselezionate2Click(Sender: TObject);
    procedure TimerAutoqueryDblClickTimer(Sender: TObject);
    procedure QryNewGCNewRecord(DataSet: TDataSet);
    procedure btvGCRighiFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btvGCRighiTIPOLOGIAGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btvGCRighiGC_SEZIONEGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btvGCRighiEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure QryNewGCBeforePost(DataSet: TDataSet);
    procedure RigamanualesoloMaterialiApparecchi1Click(Sender: TObject);
    procedure SetManodoperaInsertSQL;
    procedure SetMaterialiApparecchiInsertSQL;
    procedure SetManodoperaUpdateSQL;
    procedure SetMaterialiApparecchiUpdateSQL;
    procedure SetAltreSpeseUpdateSQL;
    function NextProgRigo: Integer;
    procedure Schedaanagraficaarticolo1Click(Sender: TObject);
    procedure Documento1Click(Sender: TObject);
    procedure Preventivo1Click(Sender: TObject);
    procedure Commessa1Click(Sender: TObject);
    procedure DDT2Click(Sender: TObject);
    procedure SAL2Click(Sender: TObject);
    procedure Estrattoconto1Click(Sender: TObject);
    procedure Fattura1Click(Sender: TObject);
    procedure Ordinefornitore1Click(Sender: TObject);
    procedure Bolladientrata1Click(Sender: TObject);
    procedure Fatturadiacquisto1Click(Sender: TObject);
    procedure OpenDocMenuPopup(Sender: TObject);
    procedure MenuElencoClientiPopup(Sender: TObject);
    procedure GCCantieriApertiChiusiMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btvGCRighiDataControllerSortingChanged(Sender: TObject);
    procedure btvGCDataControllerSortingChanged(Sender: TObject);
    procedure GCCategCant1PropertiesInitPopup(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SbGcVisMemSetPredefClick(Sender: TObject);
    procedure QryNewGCCalcFields(DataSet: TDataSet);
    procedure Esportainformatotesto1Click(Sender: TObject);
    procedure InserisciNuovoRigoCantiere(CodArt,StmCodArt:String; CodMag:String; Mode:TAddArtMode; Qta:Double = 0; RicalcoloTotali:Boolean=True);
    procedure GCAgentePropertiesInitPopup(Sender: TObject);
    procedure GCAgente2PropertiesInitPopup(Sender: TObject);
    procedure GCAgente3PropertiesInitPopup(Sender: TObject);
    procedure GCAgente4PropertiesInitPopup(Sender: TObject);
    procedure GCAgentePropertiesEditValueChanged(Sender: TObject);
    procedure GCAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure GCAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure GCTipo1PropertiesInitPopup(Sender: TObject);
    procedure SBFilterRowSoggettiClick(Sender: TObject);
    procedure cxPageControlGCPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure btvGCDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
    procedure btvGCTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems18GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure btvGCRIEP_QTACustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvGCRIEP_MARGINE_COMMESSACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvGCRIEP_COSTICustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btvGCRIEP_MARGINE_COMMESSACustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure btvGCTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems19G(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure btvGCRIEP_QTACustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btvGCCOMMESSA_QTACustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btvGCRighiDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure btvGCCOMMESSA_RICARICOCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure GCVisAccorpaManodoperaInBachecaPropertiesChange(Sender: TObject);
    procedure btvGCRighiDataControllerFilterRecord(ADataController: TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
    procedure btvGCRighiGC_QTAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure btvGCDataControllerSummaryFooterSummaryItemsSummary(ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments; var OutArguments: TcxSummaryEventOutArguments);
    procedure Raggruppadatapergiornosolovistacronologica1Click(Sender: TObject);
  private
    { Private declarations }
    // Procedura che salva e ripristina le colonne della vista di dettaglio dei righi quando si
    //  passa dalla visualizzazione normale (dettaglio) a quella riassuntiva per articolo o data e poi
    //  ripristina la situazione al ritorno alla visualizzazione normale (dettaglio).
    //  Ho dovuto farlo perchè altrimenti le colonne che al momento del passaggio dalla visualizzazinoe
    //  normale a quella riassuntiva erano in ragruppamento al ritorno alla visualizzazione normale
    //  sparivano.
    PrecBtvGCRighiGroupedColumn: array of TcxGridDBBandedColumn;
    // Variabili che contengono il valore precedente della proprietà Column.GroupIndex
    //  delle colonne relative ai sottogruppi del giornale di cantiere
    PrecGroupIndexSottocantiere1, PrecGroupIndexSottocantiere2, PrecGroupIndexSottocantiere3: Integer;
    PrecGroupIndexTipo1, PrecGroupIndexTipo2, PrecGroupIndexTipo3, PrecGroupIndexTipo4, PrecGroupIndexTipo5, PrecGroupIndexTipo6: Integer;
    PrecGroupIndexAgente1, PrecGroupIndexAgente2, PrecGroupIndexAgente3, PrecGroupIndexAgente4: Integer;
    // Riferimento globale al frame dei grafici
    FChartFrame: TChartFrame;
    // Parametro che, quando si esporta dal GC alla bacheca, indica se la manodopera e le altre spese devono essere riepilogate
    // cumulativamente alla fine del documento destinazione oppure no
    FBachecaAccorpaManodopera, FBachecaAccorpaAltreSpese: Boolean;
    // Flag che disabilita l'esecuzione dell'evento OnChange
    fGC_DisableOnChangeEvents: Boolean;
    fGC_DisableOnCustomDrawBandHeader: Boolean;
    fDatiSez_Visible_PrzUnitVendita: Boolean;
    fGC_Filter_Visible_TipoMovimento: Boolean;
    fDatiSez_Visible_Qta: Boolean;
    fTipoVis_Visible_CronologicoMese: Boolean;
    fGC_Filter_Visible_DescrizioneArticolo: Boolean;
    fGC_Filter_Visible_Tipologia: Boolean;
    fGC_Col_Visible_TipologiaArticolo: Boolean;
    fGC_Filter_Visible_Gruppi: Boolean;
    fTipoVis_Visible_CronologicoGiorno: Boolean;
    fDatiSez_Visible_PrzUnitCosto: Boolean;
    fDatiSez_Visible_ImportoCosto: Boolean;
    fSez_Visible_Commessa: Boolean;
    fSez_Visible_Carico: Boolean;
    fGC_Filter_Visible_Marca: Boolean;
    fGC_Filter_Visible_Stato: Boolean;
    fSez_Visible_Magazzino: Boolean;
    fSez_Visible_Scarico: Boolean;
    fDatiSez_Visible_ImportoVendita: Boolean;
    fTipoVis_Visible_PerArticolo: Boolean;
    fSez_Visible_Gruppi: Boolean;
    fSez_Visible_Fatturato: Boolean;
    fSez_Visible_Sottocantieri: Boolean;
    fSez_Visible_Montato: Boolean;
    fGC_Tariffe_Enabled: Boolean;
    fSez_Visible_DaFatturare: Boolean;
    fGC_Filter_Visible_CodiceArticolo: Boolean;
    fSez_Visible_Giacenza: Boolean;
    fGC_Panel_Visible_SezioniConCantiereNonSelezionato: Boolean;
    fGC_Panel_Visible_Costo: Boolean;
    fGC_Panel_Visible_SezioniConCantiereSelezionato: Boolean;
    fGC_Panel_Visible_Ricarico: Boolean;
    fGC_Panel_Visible_Manodopera: Boolean;
    fSez_Visible_Documenti: Boolean;
    fSez_Visible_Tracking: Boolean;
    fGC_Filter_Visible_Sottocantiere3: Boolean;
    fGC_Filter_Visible_CantieriApertiChiusi: Boolean;
    fGC_Filter_Visible_Sottocantiere1: Boolean;
    fGC_Filter_Visible_Sottocantiere2: Boolean;
    fSez_Visible_DaFatturare_Commessa: Boolean;
    fSez_Visible_DaMontare_Commessa: Boolean;
    fSez_Visible_DaFatturare_Giacenza: Boolean;
    fSez_Visible_DaFatturare_Montato: Boolean;
    fSez_Visible_DaMontare_Giacenza: Boolean;
    fSez_Visible_CategCant: Boolean;
    fGC_Filter_Visible_CategCant1: Boolean;
    fGC_Filter_Visible_CategCant5: Boolean;
    fGC_Filter_Visible_CategCant4: Boolean;
    fGC_Filter_Visible_CategCant6: Boolean;
    fGC_Filter_Visible_CategCant3: Boolean;
    fGC_Filter_Visible_CategCant2: Boolean;
    // Variabili globali su cui vengono costruiti i parametri
    //  da passare alla StoredProcedure che alimenta il GC
    fParam_CodiceSoggetto,
    fParam_CodicePratica,
    fParam_DataPratica,
    fParam_SolocantieriAperti,
    fParam_DatiDiMagazzino,
    fParam_Agente1,
    fParam_Agente2,
    fParam_Agente3,
    fParam_Agente4,
    fParam_TipoRigo1,
    fParam_TipoRigo2,
    fParam_TipoRigo3,
    fParam_TipoRigo4,
    fParam_TipoRigo5,
    fParam_TipoRigo6,
    fParam_Sottocantiere1,
    fParam_Sottocantiere2,
    fParam_Sottocantiere3,
    fParam_CategCant1,
    fParam_CategCant2,
    fParam_CategCant3,
    fParam_CategCant4,
    fParam_CategCant5,
    fParam_CategCant6: String;
    fGC_MemoriaPredefinita: TSpeedButton;
    fDefaultSoloRighiNoZero: Boolean;
    fGC_Filter_SoloRighiNoZero: Boolean;
    // Flag che determinano se i totali e subtotali del Giornale di Cantiere devono considerarei solo valori assoluti
    //  (quindi anche gli importi negativi vengono conteggiati come positivi) oppure no.
    FValoreAssolutoTot_DatFattMontato: Boolean;

    procedure SalvaStatoSelettoriGC(P:TRepositoryIniFile);
    procedure EsportaGC(TV: TcxGridBandedTableView);
    procedure EsportaManodoperaGC(TV: TcxGridBandedTableView);
    procedure EsportaSpeseGC(TV: TcxGridBandedTableView);
    procedure VisualizzaColonneGCMaster;
    procedure StopSalvaVistaGCNelleMemorie;
    procedure RipristinaVistaGC(NomeVista: String);
    procedure StartSalvaVistaGCNelleMemorie;
    procedure CaricaTitoli;
    procedure CaricaFormLayout;
    procedure SetDatiSez_Visible_ImportoCosto(const Value: Boolean);
    procedure SetDatiSez_Visible_ImportoVendita(const Value: Boolean);
    procedure SetDatiSez_Visible_PrzUnitCosto(const Value: Boolean);
    procedure SetDatiSez_Visible_PrzUnitVendita(const Value: Boolean);
    procedure SetDatiSez_Visible_Qta(const Value: Boolean);
    procedure SetGC_Col_Visible_TipologiaArticolo(const Value: Boolean);
    procedure SetGC_Filter_Visible_CodiceArticolo(const Value: Boolean);
    procedure SetGC_Filter_Visible_DescrizioneArticolo(
      const Value: Boolean);
    procedure SetGC_Filter_Visible_Gruppi(const Value: Boolean);
    procedure SetGC_Filter_Visible_Marca(const Value: Boolean);
    procedure SetGC_Filter_Visible_Stato(const Value: Boolean);
    procedure SetGC_Filter_Visible_Tipologia(const Value: Boolean);
    procedure SetGC_Filter_Visible_TipoMovimento(const Value: Boolean);
    procedure SetGC_Tariffe_Enabled(const Value: Boolean);
    procedure SetSez_Visible_Commessa(const Value: Boolean);
    procedure SetSez_Visible_Fatturato(const Value: Boolean);
    procedure SetSez_Visible_Giacenza(const Value: Boolean);
    procedure SetSez_Visible_Gruppi(const Value: Boolean);
    procedure SetSez_Visible_Magazzino(const Value: Boolean);
    procedure SetSez_Visible_Montato(const Value: Boolean);
    procedure SetSez_Visible_Sottocantieri(const Value: Boolean);
    procedure SetTipoVis_Visible_CronologicoGiorno(const Value: Boolean);
    procedure SetTipoVis_Visible_CronologicoMese(const Value: Boolean);
    procedure SetTipoVis_Visible_PerArticolo(const Value: Boolean);
    procedure EseguiQueryGC;
    procedure EseguiQueryGCAda;
    procedure EseguiQueryGCNew;
    procedure GC_SalvaTariffeRicarichi;
    procedure GC_CaricaTariffeRicarichi;
    procedure GC_DeselezionaTutto;
    procedure GC_SelezionaTutto;
    procedure GC_CopiaRighiInBacheca(Tutti:Boolean=True);
    procedure GC_GeneraDocumento(TipoDoc: String; TuttiRighi: Boolean);
    procedure GridEdit(SetEdit: Boolean);
    function IsRigoGiornaleCantiere(CampoTipoDoc: TField): Boolean;
    procedure CopiaCampiGcNeiCampiNormali(DS: TDataSet);
    function GCRighiNew_SelectedSectionCount: Integer;
    procedure ResetSectionButtons;
    function GetPrimaColonnaVisibileSx(btv: TcxGridBandedTableView): TcxGridBandedColumn;
    function GetFooterTitle(AViewInfo: TcxCustomGridCellViewInfo): String;
    function GetFooterTitleBoundsRect(CurrView: TcxGridBandedTableView; FooterViewInfo:TcxGridFooterViewInfo): TRect;
    procedure SalvaVistaBandTableView(Grid:TcxGrid; btv:TcxGridBandedTableView; P:TRepositoryIniFile);
    procedure CaricaVistaBandTableView(Grid:TcxGrid; btv: TcxGridBandedTableView; P:TRepositoryIniFile);
    procedure UngroupAll(btv: TcxGridBandedTableView);
    procedure CaricaStatoSelettoriGC(P: TRepositoryIniFile);
    procedure SalvaVistaGC(NomeVista: String);
    function GetPrintFooterTitle(ARecord: TcxCustomGridRecord; InitialLevelIndex: Integer; SaltaUltimoLivello:Boolean=False): String;
    function GetGroupTextStyle(ALevel: Integer): TFontStyles;
    procedure SetGC_Panel_Visible_Costo(const Value: Boolean);
    procedure SetGC_Panel_Visible_Manodopera(const Value: Boolean);
    procedure SetGC_Panel_Visible_Ricarico(const Value: Boolean);
    procedure SetSez_Visible_Documenti(const Value: Boolean);
    procedure SetGC_Panel_Visible_SezioniConCantiereSelezionato;
    procedure SetGC_Panel_Visible_SezioniConCantiereNonSelezionato;
    procedure VisualizzazioneConCantiereSelezionato;
    procedure VisualizzazioneConCantiereNonSelezionato;
    procedure AdattaLarghezzaColonneTracking(ForPrint: Boolean);
    procedure EsportaNewGC;
    function GetTipoDocPerEsportazioneRigoGCNew(
      DC: TcxCustomDataController; RI: Integer): String;
    function GetNumDocPerEsportazioneRigoGCNew(DC: TcxCustomDataController;
      RI: Integer): Integer;
    function GetRegDocPerEsportazioneRigoGCNew(DC: TcxCustomDataController;
      RI: Integer): String;
    function GetDataDocPerEsportazioneRigoGCNew(DC: TcxCustomDataController; RI: Integer): TDateTime;
    procedure EsportaManodoperaNewGC;
    procedure EsportaSpeseNewGC;
    function Get_GC_IsVistaDettaglio: Boolean;
    function GetRagSocCliDocumento(TipoDoc: String; NumDoc: Integer;
      RegDoc: String; DataDoc: TDateTime): String;
    procedure SalvaCaptionMemoriaGC(Sender: TObject);
    procedure CaricaTitoliMemorie;
    procedure ScaricaMemoryCaptionFile(NomeFile:String);
    procedure SetSez_Visible_Tracking(const Value: Boolean);
    function  GCCodArtToOperaIndex(CodArt: String): Integer;
    function GetPrzUnitOperaCantiere(OI: Integer): Double;
    function GetCostoUnitOperaCantiere(OI: Integer): Double;
    procedure InitNewItemRowFields(Sender: TcxCustomGridTableView);
    function CalcolaTipologiaRigo(DC:TcxCustomDataController; RI:Integer; CurrTipologiaText:String='NONE'): String;
    procedure ImpostaInsertUpdateQuery(DC:TcxCustomDataController; RI: Integer);
    procedure NuovoArticoloGC;
    procedure ApriDocumentoTracking(DC:TcxCustomDataController; RI:Integer; TrackColID: Integer);
    procedure SetGC_Filter_Visible_CantieriApertiChiusi(
      const Value: Boolean);
    procedure SetGC_Filter_Visible_Sottocantiere1(const Value: Boolean);
    procedure SetGC_Filter_Visible_Sottocantiere2(const Value: Boolean);
    procedure SetGC_Filter_Visible_Sottocantiere3(const Value: Boolean);
    procedure UnsortAll(btv: TcxGridBandedTableView);
    procedure SetSez_Visible_DaFatturare_Commessa(const Value: Boolean);
    procedure SetSez_Visible_DaFatturare_Giacenza(const Value: Boolean);
    procedure SetSez_Visible_DaFatturare_Montato(const Value: Boolean);
    procedure SetSez_Visible_DaMontare_Commessa(const Value: Boolean);
    procedure SetSez_Visible_DaMontare_Giacenza(const Value: Boolean);
    function  DeterminaParametriInterrogazione(ForzaDatiDiMagazzinoDisabilitati:Boolean): String;
    procedure SetSez_Visible_CategCant(const Value: Boolean);
    procedure SetGC_Filter_Visible_CategCant1(const Value: Boolean);
    procedure SetGC_Filter_Visible_CategCant2(const Value: Boolean);
    procedure SetGC_Filter_Visible_CategCant3(const Value: Boolean);
    procedure SetGC_Filter_Visible_CategCant4(const Value: Boolean);
    procedure SetGC_Filter_Visible_CategCant5(const Value: Boolean);
    procedure SetGC_Filter_Visible_CategCant6(const Value: Boolean);
    procedure MemPredef_StartSelection;
    procedure MemPredef_StopSelection;
    procedure SetGC_MemoriaPredefinita(const Value: TSpeedButton);
    procedure MemPredef_SaveSelection(MemButton: TSpeedButton);
    procedure MemPredef_LoadSelection;
    procedure RichiamaMemoria(MemButton:TSpeedButton; OpenQuery:Boolean=True);
    procedure SetGC_Filter_SoloRighiNoZero(const Value: Boolean);
    procedure SaveRestoreGroupedBtvGCRighiColumn(Restore: Boolean);
    function GetGC_CantiereSelezionato: Boolean;
    procedure ShowGCChart;
    procedure ShowGCRighiChart;
  public
    { Public declarations }
    // Flag che indica se siamo visualizzando il gionale di cantiere dall'internod i cantiere oppure da fuori
    property GC_CantiereSelezionato:Boolean     read GetGC_CantiereSelezionato;
    // Proprietà di visualizzazione del GC
    property Sez_Visible_Commessa:Boolean       read fSez_Visible_Commessa      write SetSez_Visible_Commessa;
    property Sez_Visible_Giacenza:Boolean       read fSez_Visible_Giacenza      write SetSez_Visible_Giacenza;

    property Sez_Visible_Montato:Boolean        read fSez_Visible_Montato       write SetSez_Visible_Montato;
    property Sez_Visible_DaMontare_Commessa:Boolean    read fSez_Visible_DaMontare_Commessa   write SetSez_Visible_DaMontare_Commessa;
    property Sez_Visible_DaMontare_Giacenza:Boolean    read fSez_Visible_DaMontare_Giacenza   write SetSez_Visible_DaMontare_Giacenza;

    property Sez_Visible_Fatturato:Boolean      read fSez_Visible_Fatturato     write SetSez_Visible_Fatturato;
    property Sez_Visible_DaFatturare_Commessa:Boolean    read fSez_Visible_DaFatturare_Commessa   write SetSez_Visible_DaFatturare_Commessa;
    property Sez_Visible_DaFatturare_Giacenza:Boolean    read fSez_Visible_DaFatturare_Giacenza   write SetSez_Visible_DaFatturare_Giacenza;
    property Sez_Visible_DaFatturare_Montato:Boolean     read fSez_Visible_DaFatturare_Montato    write SetSez_Visible_DaFatturare_Montato;

    property Sez_Visible_Magazzino:Boolean      read fSez_Visible_Magazzino     write SetSez_Visible_Magazzino;
    property Sez_Visible_Sottocantieri:Boolean  read fSez_Visible_Sottocantieri write SetSez_Visible_Sottocantieri;
    property Sez_Visible_Gruppi:Boolean         read fSez_Visible_Gruppi        write SetSez_Visible_Gruppi;
    property Sez_Visible_Documenti:Boolean      read fSez_Visible_Documenti     write SetSez_Visible_Documenti;
    property Sez_Visible_Tracking:Boolean       read fSez_Visible_Tracking      write SetSez_Visible_Tracking;
    property Sez_Visible_CategCant:Boolean      read fSez_Visible_CategCant     write SetSez_Visible_CategCant;

    property DatiSez_Visible_Qta:Boolean            read fDatiSez_Visible_Qta             write SetDatiSez_Visible_Qta;
    property DatiSez_Visible_ImportoCosto:Boolean   read fDatiSez_Visible_ImportoCosto    write SetDatiSez_Visible_ImportoCosto;
    property DatiSez_Visible_ImportoVendita:Boolean read fDatiSez_Visible_ImportoVendita  write SetDatiSez_Visible_ImportoVendita;
    property DatiSez_Visible_PrzUnitCosto:Boolean   read fDatiSez_Visible_PrzUnitCosto    write SetDatiSez_Visible_PrzUnitCosto;
    property DatiSez_Visible_PrzUnitVendita:Boolean read fDatiSez_Visible_PrzUnitVendita  write SetDatiSez_Visible_PrzUnitVendita;

    property TipoVis_Visible_PerArticolo:Boolean        read fTipoVis_Visible_PerArticolo       write SetTipoVis_Visible_PerArticolo;
    property TipoVis_Visible_CronologicoGiorno:Boolean  read fTipoVis_Visible_CronologicoGiorno write SetTipoVis_Visible_CronologicoGiorno;
    property TipoVis_Visible_CronologicoMese:Boolean    read fTipoVis_Visible_CronologicoMese   write SetTipoVis_Visible_CronologicoMese;

    property GC_Col_Visible_TipologiaArticolo:Boolean read fGC_Col_Visible_TipologiaArticolo write SetGC_Col_Visible_TipologiaArticolo;

    property GC_Filter_Visible_CodiceArticolo:Boolean       read fGC_Filter_Visible_CodiceArticolo        write SetGC_Filter_Visible_CodiceArticolo;
    property GC_Filter_Visible_DescrizioneArticolo:Boolean  read fGC_Filter_Visible_DescrizioneArticolo   write SetGC_Filter_Visible_DescrizioneArticolo;
    property GC_Filter_Visible_Tipologia:Boolean            read fGC_Filter_Visible_Tipologia             write SetGC_Filter_Visible_Tipologia;
    property GC_Filter_Visible_Stato:Boolean                read fGC_Filter_Visible_Stato                 write SetGC_Filter_Visible_Stato;
    property GC_Filter_Visible_Gruppi:Boolean               read fGC_Filter_Visible_Gruppi                write SetGC_Filter_Visible_Gruppi;
    property GC_Filter_Visible_TipoMovimento:Boolean        read fGC_Filter_Visible_TipoMovimento         write SetGC_Filter_Visible_TipoMovimento;
    property GC_Filter_Visible_Marca:Boolean                read fGC_Filter_Visible_Marca                 write SetGC_Filter_Visible_Marca;
    property GC_Filter_Visible_Sottocantiere1:Boolean       read fGC_Filter_Visible_Sottocantiere1        write SetGC_Filter_Visible_Sottocantiere1;
    property GC_Filter_Visible_Sottocantiere2:Boolean       read fGC_Filter_Visible_Sottocantiere2        write SetGC_Filter_Visible_Sottocantiere2;
    property GC_Filter_Visible_Sottocantiere3:Boolean       read fGC_Filter_Visible_Sottocantiere3        write SetGC_Filter_Visible_Sottocantiere3;
    property GC_Filter_Visible_CantieriApertiChiusi:Boolean read fGC_Filter_Visible_CantieriApertiChiusi  write SetGC_Filter_Visible_CantieriApertiChiusi;
    property GC_Filter_Visible_CategCant1:Boolean           read fGC_Filter_Visible_CategCant1            write SetGC_Filter_Visible_CategCant1;
    property GC_Filter_Visible_CategCant2:Boolean           read fGC_Filter_Visible_CategCant2            write SetGC_Filter_Visible_CategCant2;
    property GC_Filter_Visible_CategCant3:Boolean           read fGC_Filter_Visible_CategCant3            write SetGC_Filter_Visible_CategCant3;
    property GC_Filter_Visible_CategCant4:Boolean           read fGC_Filter_Visible_CategCant4            write SetGC_Filter_Visible_CategCant4;
    property GC_Filter_Visible_CategCant5:Boolean           read fGC_Filter_Visible_CategCant5            write SetGC_Filter_Visible_CategCant5;
    property GC_Filter_Visible_CategCant6:Boolean           read fGC_Filter_Visible_CategCant6            write SetGC_Filter_Visible_CategCant6;
    property GC_Filter_SoloRighiNoZero:Boolean              read fGC_Filter_SoloRighiNoZero               write SetGC_Filter_SoloRighiNoZero;

    property GC_Tariffe_Enabled:Boolean                     read fGC_Tariffe_Enabled                    write SetGC_Tariffe_Enabled;

    property GC_Panel_Visible_Costo:Boolean                 read fGC_Panel_Visible_Costo                write SetGC_Panel_Visible_Costo;
    property GC_Panel_Visible_Ricarico:Boolean              read fGC_Panel_Visible_Ricarico             write SetGC_Panel_Visible_Ricarico;
    property GC_Panel_Visible_Manodopera:Boolean            read fGC_Panel_Visible_Manodopera           write SetGC_Panel_Visible_Manodopera;

    // Proprietà che indica se attualmente è selezionata la nuova vista di dettaglio oppure una delle viste
    //  riepilogate per Articolo, Giorno, Mese
    property GC_IsVistaDettaglio:Boolean  read Get_GC_IsVistaDettaglio;

    // Proprietà che determina la memoria predefinita per la stazione
    property GC_MemoriaPredefinita:TSpeedButton read fGC_MemoriaPredefinita write SetGC_MemoriaPredefinita;

    // Proprietà che fornisce un riferimento all'eventuale frame dei grafici
    property ChartFrame: TChartFrame read FChartFrame;

    procedure NuovoRigoMaterialiApparecchi(CodTutti,CodArt,CodBarre,CodForn:String; Mode:TAddArtMode; Qta:Double = 0);
    procedure NuovoRigoOre(CodDip: Integer; Mode: TAddArtMode);

    function IsSummaryView: Boolean;

    // Override
    procedure TrovaButtonClick(Sender: TObject); override;
    procedure ResetQueryButtonClick(Sender: TObject); override;
    procedure ApriDocumento(var DocType:String; var Registro:String; var DocNum:Longint; var DocDate:TDate);
    procedure ModificaButtonClick(Sender: TObject); override;
    procedure EliminaButtonClick(Sender: TObject); override;
  end;

var
  TabGCForm: TTabGCForm;

implementation

uses SchedaClienti, main,
  FormGruppi, FormAnagArt, FormRappGiorn, SchedaPreventiviOrdini,
  cxGridExportLink, cxExportPivotGridLink, SchedaArticoli1, StrUtils,
  FormDipendenti, FormLevanteListAnag, cxGridDBDataDefinitions, Math,
  Types, FormQtaArticoloGC, IniFiles, DataModuleStyles;

{$R *.dfm}

// Procedura che effettua il salvataggio delle impostazioni della griglia
procedure TTabGCForm.SalvaVistaBandTableView(Grid:TcxGrid; btv:TcxGridBandedTableView; P:TRepositoryIniFile);
var
  i, ii: Integer;
  Sez: String;
  CurrBand: TcxGridBand;
  CurrColumn: TcxGridBandedColumn;
begin
    // Cicla per tutte le Bande della vista e ne salva le proprietà che ci interessano
    for i := 0 to btv.Bands.Count -1 do begin
      CurrBand  := btv.Bands[i];
      Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption;
      P.WriteBool(Sez, 'Visible', CurrBand.Visible);
      P.WriteInteger(Sez, 'ColIndex', CurrBand.Position.ColIndex);
      // Cicla per tutte le colonne della banda corrente e ne salva le proprietà che ci interessano
      for ii := 0 to CurrBand.ColumnCount -1 do begin
        CurrColumn := CurrBand.Columns[ii];
        Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption + '___COLUMN___' + CurrColumn.Name;
        P.WriteBool(Sez, 'Visible', CurrColumn.Visible);
        P.WriteInteger(Sez, 'GroupIndex', CurrColumn.GroupIndex);
        P.WriteInteger(Sez, 'BandIndex', CurrColumn.Position.BandIndex);
        P.WriteInteger(Sez, 'ColIndex', CurrColumn.Position.ColIndex);
        P.WriteInteger(Sez, 'SortIndex', CurrColumn.SortIndex);
        P.WriteInteger(Sez, 'SortOrder', Ord(CurrColumn.SortOrder));
        P.WriteInteger(Sez, 'Width', CurrColumn.Width);
      end;
    end;
end;

// Procedura che effettua il salvataggio delle impostazioni della griglia
procedure TTabGCForm.CaricaVistaBandTableView(Grid:TcxGrid; btv:TcxGridBandedTableView; P:TRepositoryIniFile);
var
  i, ii, iii: Integer;
  Sez: String;
  CurrBand: TcxGridBand;
  CurrColumn: TcxGridBandedColumn;
begin
    // Cicla per tutte le Bande della vista e ne salva le proprietà che ci interessano
    for i := 0 to btv.Bands.Count -1 do begin
      CurrBand  := btv.Bands[i];
      Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption;
      if P.SectionExists(Sez) then begin
        if P.ValueExists(Sez, 'Visible')  then CurrBand.Visible := P.ReadBool(Sez, 'Visible', True);
        if P.ValueExists(Sez, 'ColIndex') then CurrBand.Position.ColIndex := P.ReadInteger(Sez, 'ColIndex', 0);
        // Cicla per tutte le colonne della banda corrente e ne salva le proprietà che ci interessano
        for ii := 0 to CurrBand.ColumnCount -1 do begin
          CurrColumn := CurrBand.Columns[ii];
          Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption + '___COLUMN___' + CurrColumn.Name;
           if P.SectionExists(Sez) then begin
             if P.ValueExists(Sez, 'Visible')     then CurrColumn.Visible := P.ReadBool(Sez, 'Visible', True);
             if P.ValueExists(Sez, 'GroupIndex')  then CurrColumn.GroupIndex := P.ReadInteger(Sez, 'GroupIndex', -1);
             if P.ValueExists(Sez, 'BandIndex')   then CurrColumn.Position.BandIndex := P.ReadInteger(Sez, 'BandIndex', 0);
             if P.ValueExists(Sez, 'ColIndex')    then CurrColumn.Position.ColIndex := P.ReadInteger(Sez, 'ColIndex', 0);
             // Carica le  impostazioni per l'ordinamento solo se non siamo una Vista Dettaglio
             //  questo perchè altrimenti ritorna un errore poi la stampa del GC nel caso venga specificato un
             //  ordinamento probabilmente perchè si disallineano i DataController.
             if not btv.IsDetail then begin
               if P.ValueExists(Sez, 'SortIndex')   then CurrColumn.SortIndex := P.ReadInteger(Sez, 'SortIndex', -1);
               if P.ValueExists(Sez, 'SortOrder')   then begin
                 CurrColumn.SortOrder := Low(CurrColumn.SortOrder);
                 for iii := 1 to P.ReadInteger(Sez, 'SortOrder', -1) do CurrColumn.SortOrder := Succ(CurrColumn.SortOrder);
               end;
             end;
             if P.ValueExists(Sez, 'Width')       then CurrColumn.Width := P.ReadInteger(Sez, 'Width', -1);
          end;
        end;
      end;
    end;
end;

procedure TTabGCForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TabGCForm := nil;
end;

procedure TTabGCForm.TimerGCTimer(Sender: TObject);
begin
  inherited;
  // Disabilita il Timer
  (Sender as TTimer).Enabled := False;
  // Riavvia la ricerca
  ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
  // Aggiorna la situazione dei raggruppamenti per sottocantieri
  PrecGroupIndexSottocantiere1 := btvGCSOTTOCANTIERE1.GroupIndex;
  PrecGroupIndexSottocantiere2 := btvGCSOTTOCANTIERE2.GroupIndex;
  PrecGroupIndexSottocantiere3 := btvGCSOTTOCANTIERE3.GroupIndex;
  // Aggiorna la situazione dei raggruppamenti per  tipi righi
  PrecGroupIndexTipo1 := btvGCTIPO1.GroupIndex;
  PrecGroupIndexTipo2 := btvGCTIPO2.GroupIndex;
  PrecGroupIndexTipo3 := btvGCTIPO3.GroupIndex;
  PrecGroupIndexTipo4 := btvGCTIPO4.GroupIndex;
  PrecGroupIndexTipo5 := btvGCTIPO5.GroupIndex;
  PrecGroupIndexTipo6 := btvGCTIPO6.GroupIndex;
  // Aggiorna la situazione dei raggruppamenti per agenti
  PrecGroupIndexAgente1 := btvGCAGENTE1.GroupIndex;
  PrecGroupIndexAgente2 := btvGCAGENTE2.GroupIndex;
  PrecGroupIndexAgente3 := btvGCAGENTE3.GroupIndex;
  PrecGroupIndexAgente4 := btvGCAGENTE4.GroupIndex;
end;

procedure TTabGCForm.FormCreate(Sender: TObject);
begin
  inherited;

  cxPageControlGC.ActivePage := TabGCElenco;

  PanelGC.Align := alClient;

  //inizializzazione
  fGC_DisableOnChangeEvents         := False;
  fGC_DisableOnCustomDrawBandHeader := False;
  PrecGroupIndexSottocantiere1      := -1;
  PrecGroupIndexSottocantiere2      := -1;
  PrecGroupIndexSottocantiere3      := -1;
  PrecGroupIndexTipo1      := -1;
  PrecGroupIndexTipo2      := -1;
  PrecGroupIndexTipo3      := -1;
  PrecGroupIndexTipo4      := -1;
  PrecGroupIndexTipo5      := -1;
  PrecGroupIndexTipo6      := -1;

  CloseFilterPanel(PanelSelezioneColonne, SBGCSelezioneColonneOpenClose, False, 50, True);
  CloseFilterPanel(PanelGCFiltri, SBGCFilterOpenClose, False);

  GCMesiNessunoClick(GCMesiNessuno);

  GC_CaricaTariffeRicarichi;

  // Parametro che, quando si esporta dal GC alla bacheca, indica se la manodopera e le altre spese devono essere riepilogate
  // cumulativamente alla fine del documento destinazione oppure no
//  FBachecaAccorpaManodopera := True;
  FBachecaAccorpaAltreSpese := True;
end;




procedure TTabGCForm.CaricaFormLayout;
var
  LO: TRepositoryIniFile;
  Sez: String;
begin
   // Caricamento di titoli e captions
   CaricaTitoli;
   CaricaTitoliMemorie;
   // Apertura file layouts.ini
   LO := TRepositoryIniFile.Create(DM1.Repository_Layouts.FullLocalFileName, DM1.DBGenerale);
   try
     // ========================================================================
     // Settaggio CELL AUTO HEIGHT per le griglie
     // ------------------------------------------------------------------------
     Sez := 'CellAutoHeight';
     btvGC.OptionsView.CellAutoHeight       := LO.ReadBool(Sez, 'tvGC', False);
     btvGCRighi.OptionsView.CellAutoHeight  := LO.ReadBool(Sez, 'tvGCRighi', True);
     // ========================================================================

     // ========================================================================
     // GIORNALE DI CANTIERE
     // ------------------------------------------------------------------------
     Sez := 'GiornaleCantiere';
     // Flag che determinano se i totali e subtotali del Giornale di Cantiere devono considerarei solo valori assoluti
     //  (quindi anche gli importi negativi vengono conteggiati come positivi) oppure no.
     FValoreAssolutoTot_DatFattMontato      := LO.ReadBool(Sez, 'ValoreAssolutoTot_DaFattMontato', False);

     // Sezioni
     Self.Sez_Visible_Commessa              := LO.ReadBool(Sez, 'Sezione_Commessa', True);
     Self.Sez_Visible_Giacenza              := LO.ReadBool(Sez, 'Sezione_Giacenza', True);
     Self.Sez_Visible_Montato               := LO.ReadBool(Sez, 'Sezione_Montato', True);
     Self.Sez_Visible_Fatturato             := LO.ReadBool(Sez, 'Sezione_Fatturato', True);
     Self.Sez_Visible_Magazzino             := LO.ReadBool(Sez, 'Sezione_Magazzino', True);
     Self.Sez_Visible_Sottocantieri         := LO.ReadBool(Sez, 'Sezione_Sottocantieri', True);
     Self.Sez_Visible_Gruppi                := LO.ReadBool(Sez, 'Sezione_Gruppi', True);
     Self.Sez_Visible_CategCant             := LO.ReadBool(Sez, 'Sezione_CategorieCantieri', False);

     Self.Sez_Visible_DaMontare_Commessa    := LO.ReadBool(Sez, 'Sezione_DaMontare', True) and Self.Sez_Visible_Montato;
     Self.Sez_Visible_DaMontare_Giacenza    := LO.ReadBool(Sez, 'Sezione_DaMontare', True) and Self.Sez_Visible_Montato;

     Self.Sez_Visible_DaFatturare_Montato   := LO.ReadBool(Sez, 'Sezione_DaFatturare', True) and Self.Sez_Visible_Fatturato;
     Self.Sez_Visible_DaFatturare_Commessa  := LO.ReadBool(Sez, 'Sezione_DaFatturare', True) and Self.Sez_Visible_Fatturato;
     Self.Sez_Visible_DaFatturare_Giacenza  := LO.ReadBool(Sez, 'Sezione_DaFatturare', True) and Self.Sez_Visible_Fatturato;
     Self.Sez_Visible_DaFatturare_Montato   := LO.ReadBool(Sez, 'Sezione_DaFatturare', True) and Self.Sez_Visible_Fatturato;

     // Dati per sezione
     Self.DatiSez_Visible_Qta             := LO.ReadBool(Sez, 'DatiSez_Qta', True);
     Self.DatiSez_Visible_ImportoCosto    := LO.ReadBool(Sez, 'DatiSez_ImportoCosto', True);
     Self.DatiSez_Visible_ImportoVendita  := LO.ReadBool(Sez, 'DatiSez_ImportoVendita', True);
     Self.DatiSez_Visible_PrzUnitCosto    := LO.ReadBool(Sez, 'DatiSez_PrzUnitCosto', True);
     Self.DatiSez_Visible_PrzUnitVendita  := LO.ReadBool(Sez, 'DatiSez_PrzUnitVendita', True);

     // TipoVisualizzazione
     Self.TipoVis_Visible_PerArticolo       := LO.ReadBool(Sez, 'TipoVisualizzazione_PerArticolo', True);
     Self.TipoVis_Visible_CronologicoGiorno := LO.ReadBool(Sez, 'TipoVisualizzazione_CronologicoGiorno', True);
     Self.TipoVis_Visible_CronologicoMese   := LO.ReadBool(Sez, 'TipoVisualizzazione_CronologicoMese', True);

     // Colonne
     Self.GC_Col_Visible_TipologiaArticolo := LO.ReadBool(Sez, 'Col_TipologiaArticolo', True);

     Self.btvGCRighiTIPO1.Visible := LO.ReadBool(Sez, 'GC_Column_Tipo1', False);
     Self.btvGCRighiTIPO2.Visible := LO.ReadBool(Sez, 'GC_Column_Tipo2', False);
     Self.btvGCRighiTIPO3.Visible := LO.ReadBool(Sez, 'GC_Column_Tipo3', False);
     Self.btvGCRighiTIPO4.Visible := LO.ReadBool(Sez, 'GC_Column_Tipo4', False);
     Self.btvGCRighiTIPO5.Visible := LO.ReadBool(Sez, 'GC_Column_Tipo5', False);
     Self.btvGCRighiTIPO6.Visible := LO.ReadBool(Sez, 'GC_Column_Tipo6', False);
     Self.btvGCTIPO1.Visible      := Self.btvGCRighiTIPO1.Visible;
     Self.btvGCTIPO2.Visible      := Self.btvGCRighiTIPO2.Visible;
     Self.btvGCTIPO3.Visible      := Self.btvGCRighiTIPO3.Visible;
     Self.btvGCTIPO4.Visible      := Self.btvGCRighiTIPO4.Visible;
     Self.btvGCTIPO5.Visible      := Self.btvGCRighiTIPO5.Visible;
     Self.btvGCTIPO6.Visible      := Self.btvGCRighiTIPO6.Visible;

     btvGCCATEGCANT1.VisibleForCustomization                  :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption1 <> '0');
     btvGCCATEGCANT2.VisibleForCustomization                  :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption2 <> '0');
     btvGCCATEGCANT3.VisibleForCustomization                  :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption3 <> '0');
     btvGCCATEGCANT4.VisibleForCustomization                  :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption4 <> '0');
     btvGCCATEGCANT5.VisibleForCustomization                  :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption5 <> '0');
     btvGCCATEGCANT6.VisibleForCustomization                  :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption6 <> '0');

     btvGCRighiCATEGCANT1.VisibleForCustomization             :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption1 <> '0');
     btvGCRighiCATEGCANT2.VisibleForCustomization             :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption2 <> '0');
     btvGCRighiCATEGCANT3.VisibleForCustomization             :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption3 <> '0');
     btvGCRighiCATEGCANT4.VisibleForCustomization             :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption4 <> '0');
     btvGCRighiCATEGCANT5.VisibleForCustomization             :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption5 <> '0');
     btvGCRighiCATEGCANT6.VisibleForCustomization             :=(ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption6 <> '0');

     // Filtri
     Self.GC_Filter_Visible_CodiceArticolo        :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_CodiceArticolo', True);
     Self.GC_Filter_Visible_DescrizioneArticolo   :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_DescrizioneArticolo', True);
     Self.GC_Filter_Visible_Marca                 :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_Marca', True);
     Self.GC_Filter_Visible_Tipologia             :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_Tipologia', True);
     Self.GC_Filter_Visible_Stato                 :=                                  LO.ReadBool(Sez, 'Filter_Stato', True);
     Self.GC_Filter_Visible_Gruppi                :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_Gruppi', True);
     Self.GC_Filter_Visible_TipoMovimento         :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_TipoMovimento', True);
     Self.GC_Filter_Visible_CantieriApertiChiusi  :=(     ClientiForm.PraticaCorrente = '') and LO.ReadBool(Sez, 'Filter_CantieriApertiChiusi', True);
     Self.GC_Filter_Visible_Sottocantiere1        :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_Sottocantiere1', True);
     Self.GC_Filter_Visible_Sottocantiere2        :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_Sottocantiere2', True);
     Self.GC_Filter_Visible_Sottocantiere3        :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_Sottocantiere3', True);
     Self.GC_Filter_Visible_CategCant1            :=(     ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption1 <> '0');
     Self.GC_Filter_Visible_CategCant2            :=(     ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption2 <> '0');
     Self.GC_Filter_Visible_CategCant3            :=(     ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption3 <> '0');
     Self.GC_Filter_Visible_CategCant4            :=(     ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption4 <> '0');
     Self.GC_Filter_Visible_CategCant5            :=(     ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption5 <> '0');
     Self.GC_Filter_Visible_CategCant6            :=(     ClientiForm.PraticaCorrente = '') and (DM1.CategCantCaption6 <> '0');
     Self.GC_Filter_SoloRighiNoZero               :=      GC_CantiereSelezionato  and LO.ReadBool(Sez, 'Filter_SoloRighiNoZero', True);

     Self.GCTipo1.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo1', False);
     Self.GCTipo2.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo2', False);
     Self.GCTipo3.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo3', False);
     Self.GCTipo4.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo4', False);
     Self.GCTipo5.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo5', False);
     Self.GCTipo6.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo6', False);
     Self.GCLabelTipo1.Visible := Self.GCTipo1.Visible;
     Self.GCLabelTipo2.Visible := Self.GCTipo2.Visible;
     Self.GCLabelTipo3.Visible := Self.GCTipo3.Visible;
     Self.GCLabelTipo4.Visible := Self.GCTipo4.Visible;
     Self.GCLabelTipo5.Visible := Self.GCTipo5.Visible;
     Self.GCLabelTipo6.Visible := Self.GCTipo6.Visible;

     // Agenti
     LabelGCAgente.Visible              := (DM1.GridsColumnAgenteCaption <> '');
     LabelGCAgente2.Visible             := (DM1.GridsColumnAgente2Caption <> '');
     LabelGCAgente3.Visible             := (DM1.GridsColumnAgente3Caption <> '');
     LabelGCAgente4.Visible             := (DM1.GridsColumnAgente4Caption <> '');
     GCAgente.Visible                   := LabelGCAgente.Visible;
     GCAgente2.Visible                  := LabelGCAgente2.Visible;
     GCAgente3.Visible                  := LabelGCAgente3.Visible;
     GCAgente4.Visible                  := LabelGCAgente4.Visible;
     btvGCRighiAGENTE1.Visible          := LabelGCAgente.Visible;
     btvGCRighiAGENTE2.Visible          := LabelGCAgente2.Visible;
     btvGCRighiAGENTE3.Visible          := LabelGCAgente3.Visible;
     btvGCRighiAGENTE4.Visible          := LabelGCAgente4.Visible;
     btvGCAGENTE1.Visible               := LabelGCAgente.Visible;
     btvGCAGENTE2.Visible               := LabelGCAgente2.Visible;
     btvGCAGENTE3.Visible               := LabelGCAgente3.Visible;
     btvGCAGENTE4.Visible               := LabelGCAgente4.Visible;

     // Carica il valore di default per il filtro
     fDefaultSoloRighiNoZero                      := LO.ReadBool(Sez, 'DefaultFiltroSoloRighiNoZero', False);

     // In base ai filtri abilitati o disabilitati relativi alle categorie cantieri
     //  cerca di limitarne l'occupazione se non visibili
     PanelFilterCategorieCantieri.Height := 0;
     PanelFilterCategorieCantieri.Visible := False;
     if (Self.GC_Filter_Visible_CategCant1 or Self.GC_Filter_Visible_CategCant2 or Self.GC_Filter_Visible_CategCant3) then begin
       PanelFilterCategorieCantieri.Visible := True;
       PanelFilterCategorieCantieri.Height := 19;
     end;
     if (Self.GC_Filter_Visible_CategCant4 or Self.GC_Filter_Visible_CategCant5 or Self.GC_Filter_Visible_CategCant6) then begin
       PanelFilterCategorieCantieri.Visible := True;
       PanelFilterCategorieCantieri.Height := 38;
     end;
     // Dimesiona il SubPanel che contiene i filtri in modo che riadatti
     SubPanelGCFiltri.Height := PanelFilterCategorieCantieri.Top + PanelFilterCategorieCantieri.Height + 5;   // + 5 per lasciare una separazione bianc sul fondo
     // ========================================================================
   finally
     LO.Free;
   end;
end;

procedure TTabGCForm.CaricaTitoli;
var
  M: TRepositoryIniFile;
  Sez: String;
begin
  M := TRepositoryIniFile.Create(DM1.Repository_Menu.FullLocalFileName, DM1.DBGenerale);
  try
     Sez := 'GiornaleCantiere';

     // Caricamento titoli sezione MONTATO
     SbGcVisMontato.Caption := M.ReadString(Sez, 'Sezione_Montato', 'Montato');
     SbGcVisDaMontareCommessa.Caption := M.ReadString(Sez, 'Sezione_DaMontare_Commessa', 'Da montare (comm)');
     SbGcVisDaMontareGiacenza.Caption := M.ReadString(Sez, 'Sezione_DaMontare_Giacenza', 'Da montare (giac)');
     SbGcVisDaFatturareMontato.Caption := Format('Da fatt. (%s)', [SbGcVisMontato.Caption]);
     btvGC.Bands[3].Caption := SbGcVisMontato.Caption;
     btvGC.Bands[4].Caption := SbGcVisDaMontareCommessa.Caption;
     btvGC.Bands[5].Caption := SbGcVisDaMontareGiacenza.Caption;
     btvGC.Bands[9].Caption := SbGcVisDaFatturareMontato.Caption;
     btvGCRIEP_MARGINE_MONTATO.Caption := M.ReadString(Sez, 'Column_MargineEffettivoMontato', 'Marg.eff.mont.');
     btvGCRIEP_PERC_MARGINE_MONTATO.Caption := btvGCRIEP_MARGINE_MONTATO.Caption;

     // CAricamento titoli colonne pratiche e sottopratiche
     btvGCRighiSOTTOCANTIERE1.Caption   := DM1.GridsColumnSottopratica1Caption;
     btvGCRighiSOTTOCANTIERE2.Caption   := DM1.GridsColumnSottopratica2Caption;
     btvGCRighiSOTTOCANTIERE3.Caption   := DM1.GridsColumnSottopratica3Caption;
//     tvRighiDocSOTTOCANTIERE4.Caption   := DM1.GridsColumnSottopratica4Caption;
//     tvRighiDocSOTTOCANTIERE5.Caption   := DM1.GridsColumnSottopratica5Caption;
//     tvRighiDocSOTTOCANTIERE6.Caption   := DM1.GridsColumnSottopratica6Caption;
     btvGCCOMMESSA_QTA.Caption        := DM1.GridGCQtaCommessaCaption;
     btvGCGIACENZA_QTA.Caption        := DM1.GridGCQtaGiacenzaCaption;
     btvGCMONTATO_QTA.Caption         := DM1.GridGCQtaMontataCaption;
     btvGCSOTTOCANTIERE1.Caption      := DM1.GridsColumnSottopratica1Caption;
     btvGCSOTTOCANTIERE2.Caption      := DM1.GridsColumnSottopratica2Caption;
     btvGCSOTTOCANTIERE3.Caption      := DM1.GridsColumnSottopratica3Caption;
     btvGCCATEGCANT1.Caption          := DM1.CategCantCaption1;
     btvGCCATEGCANT2.Caption          := DM1.CategCantCaption2;
     btvGCCATEGCANT3.Caption          := DM1.CategCantCaption3;
     btvGCCATEGCANT4.Caption          := DM1.CategCantCaption4;
     btvGCCATEGCANT5.Caption          := DM1.CategCantCaption5;
     btvGCCATEGCANT6.Caption          := DM1.CategCantCaption6;

     // Caricamento titoli agenti
     btvGCRighiAGENTE1.Caption        := DM1.GridsColumnAgenteCaption;
     btvGCRighiAGENTE2.Caption        := DM1.GridsColumnAgente2Caption;
     btvGCRighiAGENTE3.Caption        := DM1.GridsColumnAgente3Caption;
     btvGCRighiAGENTE4.Caption        := DM1.GridsColumnAgente4Caption;
     btvGCAGENTE1.Caption             := DM1.GridsColumnAgenteCaption;
     btvGCAGENTE2.Caption             := DM1.GridsColumnAgente2Caption;
     btvGCAGENTE3.Caption             := DM1.GridsColumnAgente3Caption;
     btvGCAGENTE4.Caption             := DM1.GridsColumnAgente4Caption;
     LabelGCAgente.Caption            := ' ' + DM1.GridsColumnAgenteCaption;
     LabelGCAgente2.Caption           := ' ' + DM1.GridsColumnAgente2Caption;
     LabelGCAgente3.Caption           := ' ' + DM1.GridsColumnAgente3Caption;
     LabelGCAgente4.Caption           := ' ' + DM1.GridsColumnAgente4Caption;

     // Caricamento titoli tipi righi
     GCLabelTipo1.Caption               := M.ReadString(Sez, 'Filter_TipoRigo1', 'Tipo rigo 1');
     GCLabelTipo2.Caption               := M.ReadString(Sez, 'Filter_TipoRigo2', 'Tipo rigo 2');
     GCLabelTipo3.Caption               := M.ReadString(Sez, 'Filter_TipoRigo3', 'Tipo rigo 3');
     GCLabelTipo4.Caption               := M.ReadString(Sez, 'Filter_TipoRigo4', 'Tipo rigo 4');
     GCLabelTipo5.Caption               := M.ReadString(Sez, 'Filter_TipoRigo5', 'Tipo rigo 5');
     GCLabelTipo6.Caption               := M.ReadString(Sez, 'Filter_TipoRigo6', 'Tipo rigo 6');
     btvGCRighiTIPO1.Caption            := M.ReadString(Sez, 'GC_Column_Tipo1', 'Tipo 1');
     btvGCRighiTIPO2.Caption            := M.ReadString(Sez, 'GC_Column_Tipo2', 'Tipo 2');
     btvGCRighiTIPO3.Caption            := M.ReadString(Sez, 'GC_Column_Tipo3', 'Tipo 3');
     btvGCRighiTIPO4.Caption            := M.ReadString(Sez, 'GC_Column_Tipo4', 'Tipo 4');
     btvGCRighiTIPO5.Caption            := M.ReadString(Sez, 'GC_Column_Tipo5', 'Tipo 5');
     btvGCRighiTIPO6.Caption            := M.ReadString(Sez, 'GC_Column_Tipo6', 'Tipo 6');
     btvGCTIPO1.Caption                 := btvGCRighiTIPO1.Caption;
     btvGCTIPO2.Caption                 := btvGCRighiTIPO2.Caption;
     btvGCTIPO3.Caption                 := btvGCRighiTIPO3.Caption;
     btvGCTIPO4.Caption                 := btvGCRighiTIPO4.Caption;
     btvGCTIPO5.Caption                 := btvGCRighiTIPO5.Caption;
     btvGCTIPO6.Caption                 := btvGCRighiTIPO6.Caption;

     // Caricamento titoli sottocantieri
     GCLabelSottocantiere1.Caption    := DM1.GridsColumnSottopratica1Caption;
     GCLabelSottocantiere2.Caption    := DM1.GridsColumnSottopratica2Caption;
     GCLabelSottocantiere3.Caption    := DM1.GridsColumnSottopratica3Caption;

     // Caricamento titoli cagorie cantiere
     GCLabelCategCant1.Caption        := ' ' + DM1.CategCantCaption1;
     GCLabelCategCant2.Caption        := ' ' + DM1.CategCantCaption2;
     GCLabelCategCant3.Caption        := ' ' + DM1.CategCantCaption3;
     GCLabelCategCant4.Caption        := ' ' + DM1.CategCantCaption4;
     GCLabelCategCant5.Caption        := ' ' + DM1.CategCantCaption5;
     GCLabelCategCant6.Caption        := ' ' + DM1.CategCantCaption6;
     btvGCCATEGCANT1.Caption          := DM1.CategCantCaption1;
     btvGCCATEGCANT2.Caption          := DM1.CategCantCaption2;
     btvGCCATEGCANT3.Caption          := DM1.CategCantCaption3;
     btvGCCATEGCANT4.Caption          := DM1.CategCantCaption4;
     btvGCCATEGCANT5.Caption          := DM1.CategCantCaption5;
     btvGCCATEGCANT6.Caption          := DM1.CategCantCaption6;
     btvGCRighiCATEGCANT1.Caption     := DM1.CategCantCaption1;
     btvGCRighiCATEGCANT2.Caption     := DM1.CategCantCaption2;
     btvGCRighiCATEGCANT3.Caption     := DM1.CategCantCaption3;
     btvGCRighiCATEGCANT4.Caption     := DM1.CategCantCaption4;
     btvGCRighiCATEGCANT5.Caption     := DM1.CategCantCaption5;
     btvGCRighiCATEGCANT6.Caption     := DM1.CategCantCaption6;

     // ----- PRATICHE -----
     Sez := 'TitoliPratiche';
     GcVisLabelManodopera1.Caption      := DM1.Manodopera[0].Descrizione;
     GcVisLabelManodopera2.Caption      := DM1.Manodopera[1].Descrizione;
     GcVisLabelManodopera3.Caption      := DM1.Manodopera[2].Descrizione;
     GcVisLabelManodopera4.Caption      := DM1.Manodopera[3].Descrizione;
     GcVisLabelManodopera5.Caption      := DM1.Manodopera[4].Descrizione;

  finally
    M.Free;
  end;
end;





procedure TTabGCForm.QryGCCalcFields(DataSet: TDataSet);
begin
  inherited;
  // COMMESSA
  if QryGCCOMMESSA_QTA.AsFloat <> 0 then begin
    QryGCCOMMESSA_PRZUNITACQ.Value        := DM1.Arrotonda(   (QryGCCOMMESSA_IMPORTOACQ.AsFloat / QryGCCOMMESSA_QTA.AsFloat)                    , DM1.DecMicroPrz);
    QryGCCOMMESSA_PRZUNITVEND.Value       := DM1.Arrotonda(   (QryGCCOMMESSA_IMPORTOVEND.AsFloat / QryGCCOMMESSA_QTA.AsFloat)                   , DM1.DecMicroPrz);
    QryGCCOMMESSA_GUADAGNOUNITARIO.Value  := QryGCCOMMESSA_PRZUNITVEND.AsCurrency - QryGCCOMMESSA_PRZUNITACQ.AsFloat;
    if QryGCCOMMESSA_IMPORTOACQ.AsFloat <> 0
    then QryGCCOMMESSA_RICARICO.Value     := DM1.Arrotonda(   (100 * QryGCCOMMESSA_GUADAGNOIMPORTO.AsFloat / QryGCCOMMESSA_IMPORTOACQ.AsFloat)  , DM1.DecMicroPrz)
    else QryGCCOMMESSA_RICARICO.Value     := 0;
  end else begin
    QryGCCOMMESSA_PRZUNITACQ.Value        := 0;
    QryGCCOMMESSA_PRZUNITVEND.Value       := 0;
    QryGCCOMMESSA_GUADAGNOUNITARIO.Value  := 0;
    QryGCCOMMESSA_RICARICO.Value          := 0;
  end;

  // GIACENZA
  if QryGCGIACENZA_QTA.AsFloat <> 0 then begin
    QryGCGIACENZA_PRZUNITACQ.Value        := DM1.Arrotonda(   (QryGCGIACENZA_IMPORTOACQ.AsFloat / QryGCGIACENZA_QTA.AsFloat)                    , DM1.DecMicroPrz);
    QryGCGIACENZA_PRZUNITVEND.Value       := DM1.Arrotonda(   (QryGCGIACENZA_IMPORTOVEND.AsFloat / QryGCGIACENZA_QTA.AsFloat)                   , DM1.DecMicroPrz);
    QryGCGIACENZA_GUADAGNOUNITARIO.Value  := QryGCGIACENZA_PRZUNITVEND.AsCurrency - QryGCGIACENZA_PRZUNITACQ.AsFloat;
    if QryGCGIACENZA_IMPORTOACQ.AsFloat <> 0
    then QryGCGIACENZA_RICARICO.Value     := DM1.Arrotonda(   (100 * QryGCGIACENZA_GUADAGNOIMPORTO.AsFloat / QryGCGIACENZA_IMPORTOACQ.AsFloat)  , DM1.DecMicroPrz)
    else QryGCGIACENZA_RICARICO.Value     := 0;
  end else begin
    QryGCGIACENZA_PRZUNITACQ.Value        := 0;
    QryGCGIACENZA_PRZUNITVEND.Value       := 0;
    QryGCGIACENZA_GUADAGNOUNITARIO.Value  := 0;
    QryGCGIACENZA_RICARICO.Value          := 0;
  end;

  // MONTATO
  if QryGCMONTATO_QTA.AsFloat <> 0 then begin
    QryGCMONTATO_PRZUNITACQ.Value        := DM1.Arrotonda(   (QryGCMONTATO_IMPORTOACQ.AsFloat / QryGCMONTATO_QTA.AsFloat)                    , DM1.DecMicroPrz);
    QryGCMONTATO_PRZUNITVEND.Value       := DM1.Arrotonda(   (QryGCMONTATO_IMPORTOVEND.AsFloat / QryGCMONTATO_QTA.AsFloat)                   , DM1.DecMicroPrz);
    QryGCMONTATO_GUADAGNOUNITARIO.Value  := QryGCMONTATO_PRZUNITVEND.AsCurrency - QryGCMONTATO_PRZUNITACQ.AsFloat;
    if QryGCMONTATO_IMPORTOACQ.AsFloat <> 0
    then QryGCMONTATO_RICARICO.Value     := DM1.Arrotonda(   (100 * QryGCMONTATO_GUADAGNOIMPORTO.AsFloat / QryGCMONTATO_IMPORTOACQ.AsFloat)  , DM1.DecMicroPrz)
    else QryGCMONTATO_RICARICO.Value     := 0;
  end else begin
    QryGCMONTATO_PRZUNITACQ.Value        := 0;
    QryGCMONTATO_PRZUNITVEND.Value       := 0;
    QryGCMONTATO_GUADAGNOUNITARIO.Value  := 0;
    QryGCMONTATO_RICARICO.Value          := 0;
  end;

  // RRIEPILOGO
  QryGCRIEP_QTA.Value := QryGCGIACENZA_QTA.AsFloat - QryGCCOMMESSA_QTA.AsFloat;
  QryGCRIEP_COSTI.Value := QryGCGIACENZA_IMPORTOACQ.AsFloat - QryGCCOMMESSA_IMPORTOACQ.AsFloat;
  QryGCRIEP_MARGINE_COMMESSA.Value := QryGCCOMMESSA_IMPORTOVEND.AsFloat - QryGCGIACENZA_IMPORTOACQ.AsFloat;
  QryGCRIEP_MARGINE_FATTURATO.Value := QryGCFATTURATO_IMPORTOVEND.AsFloat - QryGCGIACENZA_IMPORTOACQ.AsFloat;
  QryGCRIEP_MARGINE_MONTATO.Value := QryGCMONTATO_IMPORTOVEND.AsFloat - QryGCGIACENZA_IMPORTOACQ.AsFloat;

  // RIEPILOGO PERCENTUALE
  // ---------------------------------------------------------------------------
  // Aumento/diminuzione qtà effettiva rispetto al preventivato
  if QryGCCOMMESSA_QTA.AsFloat <> 0 then
    QryGCRIEP_PERC_QTA.Value := SimpleRoundTo(QryGCRIEP_QTA.AsFloat * 100 / QryGCCOMMESSA_QTA.AsFloat, DM1.DecimaliMarginiPercentuali*(-1))
  else
    QryGCRIEP_PERC_QTA.Value := 0;
  // Aumento/diminuzione costo effettivo rispetto al preventivato
  if QryGCCOMMESSA_IMPORTOACQ.AsFloat <> 0 then
    QryGCRIEP_PERC_COSTI.Value := SimpleRoundTo(QryGCRIEP_COSTI.AsFloat * 100 / QryGCCOMMESSA_IMPORTOACQ.AsFloat, DM1.DecimaliMarginiPercentuali*(-1))
  else
    QryGCRIEP_PERC_COSTI.Value := 0;
  // Margine effettivo con valore alla vendita come da commessa rispetto ai costi reali a consuntivo
  if QryGCGIACENZA_IMPORTOACQ.AsFloat <> 0 then
    QryGCRIEP_PERC_MARGINE_COMMESSA.Value := SimpleRoundTo(QryGCRIEP_MARGINE_COMMESSA.AsFloat * 100 / QryGCGIACENZA_IMPORTOACQ.AsFloat, DM1.DecimaliMarginiPercentuali*(-1))
  else
    QryGCRIEP_PERC_MARGINE_COMMESSA.Value := 0;
  // Margine effettivo con valore alla vendita come da fatture rispetto ai costi reali a consuntivo
  if QryGCGIACENZA_IMPORTOACQ.AsFloat <> 0 then
    QryGCRIEP_PERC_MARGINE_FATTURATO.Value := SimpleRoundTo(QryGCRIEP_MARGINE_FATTURATO.AsFloat * 100 / QryGCGIACENZA_IMPORTOACQ.AsFloat, DM1.DecimaliMarginiPercentuali*(-1))
  else
    QryGCRIEP_PERC_MARGINE_FATTURATO.Value := 0;
  // Margine effettivo con valore alla vendita come da montato rispetto ai costi reali a consuntivo
  if QryGCGIACENZA_IMPORTOACQ.AsFloat <> 0 then
    QryGCRIEP_PERC_MARGINE_MONTATO.Value := SimpleRoundTo(QryGCRIEP_MARGINE_MONTATO.AsFloat * 100 / QryGCGIACENZA_IMPORTOACQ.AsFloat, DM1.DecimaliMarginiPercentuali*(-1))
  else
    QryGCRIEP_PERC_MARGINE_MONTATO.Value := 0;
  // ---------------------------------------------------------------------------

  // FATTURATO
{
  if QryGCFATTURATO_QTA.AsFloat <> 0 then begin
    QryGCFATTURATO_PRZUNITACQ.Value        := DM1.Arrotonda(   (QryGCFATTURATO_IMPORTOACQ.AsFloat / QryGCFATTURATO_QTA.AsFloat)                    , DM1.DecMicroPrz);
    QryGCFATTURATO_PRZUNITVEND.Value       := DM1.Arrotonda(   (QryGCFATTURATO_IMPORTOVEND.AsFloat / QryGCFATTURATO_QTA.AsFloat)                   , DM1.DecMicroPrz);
    QryGCFATTURATO_GUADAGNOUNITARIO.Value  := QryGCFATTURATO_PRZUNITVEND.AsCurrency - QryGCFATTURATO_PRZUNITACQ.AsFloat;
    if QryGCFATTURATO_IMPORTOACQ.AsFloat <> 0
    then QryGCFATTURATO_RICARICO.Value     := DM1.Arrotonda(   (100 * QryGCFATTURATO_GUADAGNOIMPORTO.AsFloat / QryGCFATTURATO_IMPORTOACQ.AsFloat)  , DM1.DecMicroPrz)
    else QryGCFATTURATO_RICARICO.Value     := 0;
  end else begin
    QryGCFATTURATO_PRZUNITACQ.Value        := 0;
    QryGCFATTURATO_PRZUNITVEND.Value       := 0;
    QryGCFATTURATO_GUADAGNOUNITARIO.Value  := 0;
    QryGCFATTURATO_RICARICO.Value          := 0;
  end;
}

  // DA FATTURARE
{
  if QryGCDAFATTURARE_QTA.AsFloat <> 0 then begin
    QryGCDAFATTURARE_PRZUNITACQ.Value        := DM1.Arrotonda(   (QryGCDAFATTURARE_IMPORTOACQ.AsFloat / QryGCDAFATTURARE_QTA.AsFloat)                    , DM1.DecMicroPrz);
    QryGCDAFATTURARE_PRZUNITVEND.Value       := DM1.Arrotonda(   (QryGCDAFATTURARE_IMPORTOVEND.AsFloat / QryGCDAFATTURARE_QTA.AsFloat)                   , DM1.DecMicroPrz);
    QryGCDAFATTURARE_GUADAGNOUNITARIO.Value  := QryGCDAFATTURARE_PRZUNITVEND.AsCurrency - QryGCDAFATTURARE_PRZUNITACQ.AsFloat;
    if QryGCDAFATTURARE_IMPORTOACQ.AsFloat <> 0
    then QryGCDAFATTURARE_RICARICO.Value     := DM1.Arrotonda(   (100 * QryGCDAFATTURARE_GUADAGNOIMPORTO.AsFloat / QryGCDAFATTURARE_IMPORTOACQ.AsFloat)  , DM1.DecMicroPrz)
    else QryGCDAFATTURARE_RICARICO.Value     := 0;
  end else begin
    QryGCDAFATTURARE_PRZUNITACQ.Value        := 0;
    QryGCDAFATTURARE_PRZUNITVEND.Value       := 0;
    QryGCDAFATTURARE_GUADAGNOUNITARIO.Value  := 0;
    QryGCDAFATTURARE_RICARICO.Value          := 0;
  end;
}

  // IMPORTO INVENTARIO ULTIMO ACQUISTO
  QryGCIMPORTOINVENTARIOUA.Value := QryGCMAG_ULTIMOPREZZOACQUISTO.AsCurrency * QryGCMAG_GIACENZA.AsFloat;

  // DISPONIBILE A MAGAZZINO
  if DM1.TableProgressiviMAG_ORDINATONELDISPONIBILE.AsBoolean
  then QryGCMAG_DISPONIBILE.Value := QryGCMAG_GIACENZA.AsFloat - QryGCMAG_IMPEGNATO.AsFloat + QryGCMAG_ORDINATO.AsFloat
  else QryGCMAG_DISPONIBILE.Value := QryGCMAG_GIACENZA.AsFloat - QryGCMAG_IMPEGNATO.AsFloat;

  // QTA DA ORDINARE
  QryGCMAG_DAORDINARE.Value := QryGCCOMMESSA_QTA.AsFloat - QryGCMAG_DISPONIBILE.AsFloat;

end;



// Questa procedura copia i dati personalizzati del giornale di cantiere (i campi
//  il nui nome inizia con GC_ nei rispettivi campi normali del rigo (quelli del documento)
//  in modo che anche i righi aggiunti direttamente possano essere visualizzati nel giornale
//  di magazzino o manodopera/spese
procedure TTabGCForm.CopiaCampiGcNeiCampiNormali(DS:TDataSet);
begin
  DS.FieldByName('DESCRIZIONE').Value                   := DS.FieldByName('GC_DESCRIZIONE').AsString;
  DS.FieldByName('QTA').Value                           := DS.FieldByName('GC_QTA').AsFloat;
  DS.FieldByName('PREZZOACQUISTOARTICOLO').Value        := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat;
  DS.FieldByName('IMPORTOACQUISTOARTICOLO').Value       := DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
  DS.FieldByName('MARGINE').Value                       := 0;
  DS.FieldByName('PREZZOUNITARIO').Value                := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat;
  DS.FieldByName('IMPORTORIGO').Value                   := DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
end;

procedure TTabGCForm.btvGCCOMMESSA_QTACustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  AGroupRow: TcxGridGroupRow;
  ADataRow: TcxGridDataRow;
begin
  // Anche se i valori delle colonne Qtà di solito non sono in grassetto
  //  il totale lo mettiamo cmq in grassetto.
  ACanvas.Font.Style := [fsBold];
  // Questo blocco di codice fa in modo che questo totale sia visualizzato solamente
  //  nel raggruppamento che rappresenta la manodopera mentre lo rende invisibile
  //  per tutti gli altri. Infatti il totale Qtà ha senso solamente per la manodopera
  //  mentre perde di significato negli altri casi
  if AViewInfo is TcxGridRowFooterCellViewInfo then
  begin
    if TcxGridRowFooterCellViewInfo(AViewInfo).GridRecord is TcxGridGroupRow then
    begin
      AGroupRow := TcxGridRowFooterCellViewInfo(AViewInfo).GridRecord as TcxGridGroupRow;
      if not StartsStr('MANODOPERA', Uppercase(VarToStr(AGroupRow.Value))) then
        AViewInfo.Text := '';
    end
    else
    begin
      ADataRow := TcxGridRowFooterCellViewInfo(AViewInfo).GridRecord as TcxGridDataRow;
      if not StartsStr('MANODOPERA', UpperCase(VarToStr(TcxGridGroupRow(ADataRow.ParentRecord).Value))) then
        AViewInfo.Text := '';
    end;
  end;
end;

procedure TTabGCForm.btvGCCOMMESSA_RICARICOCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
  // Anche se i valori delle colonne Qtà di solito non sono in grassetto
  //  il totale lo mettiamo cmq in grassetto.
  ACanvas.Font.Style := [fsBold];
end;

procedure TTabGCForm.btvGCDataControllerGroupingChanged(Sender: TObject);
begin
  inherited;
// NB: HO disabilitato questa funzionalità perchè  altrimenti ogni volta che si portava a raggruppamento una colonna
//      e poi un'altra ogni volta bisognava attendere l'escuzione della query che è piuttosto lenta.
//      Inoltre ho notato anche che, sempre a causa di questa funzionalità, la query veniva eseguita più volte
//      quando, una volta selezionato un cantiere, si andava sul GC.
  // Controlla che il raggruppamento dei sottocantieri non sia cambiato, se è cambiato
  //  provvede ad attivare il timer che poi dopo eseguira una nuova query di ricerca
  //  NB: la esegue dal timer perchè se la eseguivo da quì dava un AV.
//  if (btvGCSOTTOCANTIERE1.GroupIndex <> PrecGroupIndexSottocantiere1)
//  or (btvGCSOTTOCANTIERE2.GroupIndex <> PrecGroupIndexSottocantiere2)
//  or (btvGCSOTTOCANTIERE3.GroupIndex <> PrecGroupIndexSottocantiere3)
//  or (btvGCTIPO1.GroupIndex <> PrecGroupIndexTipo1)
//  or (btvGCTIPO2.GroupIndex <> PrecGroupIndexTipo2)
//  or (btvGCTIPO3.GroupIndex <> PrecGroupIndexTipo3)
//  or (btvGCTIPO4.GroupIndex <> PrecGroupIndexTipo4)
//  or (btvGCTIPO5.GroupIndex <> PrecGroupIndexTipo5)
//  or (btvGCTIPO6.GroupIndex <> PrecGroupIndexTipo6)
//  or (btvGCAGENTE.GroupIndex <> PrecGroupIndexAgente1)
//  or (btvGCAGENTE2.GroupIndex <> PrecGroupIndexAgente2)
//  or (btvGCAGENTE3.GroupIndex <> PrecGroupIndexAgente3)
//  or (btvGCAGENTE4.GroupIndex <> PrecGroupIndexAgente4)
//  then
//  begin
//    TimerGC.Enabled := True;
//  end;
end;

// Salva lo stato dei vari pulsanti selettori del giornale di cantiere
procedure TTabGCForm.SalvaStatoSelettoriGC(P:TRepositoryIniFile);
const
  SEZ = 'SELETTORI';
begin
    P.WriteBool(SEZ, SbGcVisCommessa.Name, SbGcVisCommessa.Down);
    P.WriteBool(SEZ, SbGcVisGiacenza.Name, SbGcVisGiacenza.Down);
    P.WriteBool(SEZ, SbGcVisRiepilogo.Name, SbGcVisRiepilogo.Down);
    P.WriteBool(SEZ, SbGcVisRiepilogoPerc.Name, SbGcVisRiepilogoPerc.Down);
    P.WriteBool(SEZ, SbGcVisMontato.Name, SbGcVisMontato.Down);
    P.WriteBool(SEZ, SbGcVisFatturato.Name, SbGcVisFatturato.Down);
    P.WriteBool(SEZ, SbGcVisMagazzino.Name, SbGcVisMagazzino.Down);
    P.WriteBool(SEZ, SbGcVisSottocantieri.Name, SbGcVisSottocantieri.Down);
    P.WriteBool(SEZ, SbGcVisGruppi.Name, SbGcVisGruppi.Down);
    P.WriteBool(SEZ, SbGcVisDocumenti.Name, SbGcVisDocumenti.Down);
    P.WriteBool(SEZ, SbGcVisTrack.Name, SbGcVisTrack.Down);
    P.WriteBool(SEZ, SbGcVisCategCant.Name, SbGcVisCategCant.Down);

    P.WriteBool(SEZ, SbGcVisDaMontareCommessa.Name, SbGcVisDaMontareCommessa.Down);
    P.WriteBool(SEZ, SbGcVisDaMontareGiacenza.Name, SbGcVisDaMontareGiacenza.Down);

    P.WriteBool(SEZ, SbGcVisDaFatturareCommessa.Name, SbGcVisDaFatturareCommessa.Down);
    P.WriteBool(SEZ, SbGcVisDaFatturareGiacenza.Name, SbGcVisDaFatturareGiacenza.Down);
    P.WriteBool(SEZ, SbGcVisDaFatturareMontato.Name,  SbGcVisDaFatturareMontato.Down);

    P.WriteBool(SEZ, SbGcVisQta.Name, SbGcVisQta.Down);
    P.WriteBool(SEZ, SbGcVisImportiAcquisto.Name, SbGcVisImportiAcquisto.Down);
    P.WriteBool(SEZ, SbGcVisImportiVendita.Name, SbGcVisImportiVendita.Down);
    P.WriteBool(SEZ, SbGcVisPrzUnitAcquisto.Name, SbGcVisPrzUnitAcquisto.Down);
    P.WriteBool(SEZ, SbGcVisPrzUnitVendita.Name, SbGcVisPrzUnitVendita.Down);
    P.WriteBool(SEZ, SbGcVisRicaricoPercent.Name, SbGcVisRicaricoPercent.Down);
    P.WriteBool(SEZ, SbGcVisRicaricoImporto.Name, SbGcVisRicaricoImporto.Down);

    P.WriteBool(SEZ, SbGcVisPerArticolo.Name, SbGcVisPerArticolo.Down);
    P.WriteBool(SEZ, SbGcVisCronologicoGiorno.Name, SbGcVisCronologicoGiorno.Down);
    P.WriteBool(SEZ, SbGcVisCronologicoMese.Name, SbGcVisCronologicoMese.Down);
    P.WriteBool(SEZ, SbGcVisPerCantiere.Name, SbGcVisPerCantiere.Down);

    P.UpdateFile;
end;

procedure TTabGCForm.CaricaStatoSelettoriGC(P:TRepositoryIniFile);
const
  SEZ = 'SELETTORI';
begin
    if SbGcVisCommessa.Visible        then SbGcVisCommessa.Down := P.ReadBool(SEZ, SbGcVisCommessa.Name, (not GC_CantiereSelezionato))               else SbGcVisCommessa.Down := False;
    if SbGcVisGiacenza.Visible        then SbGcVisGiacenza.Down := P.ReadBool(SEZ, SbGcVisGiacenza.Name, True)                else SbGcVisGiacenza.Down := False;
    if SbGcVisRiepilogo.Visible       then SbGcVisRiepilogo.Down := P.ReadBool(SEZ, SbGcVisRiepilogo.Name, False)             else SbGcVisRiepilogo.Down := False;
    if SbGcVisRiepilogoPerc.Visible   then SbGcVisRiepilogoPerc.Down := P.ReadBool(SEZ, SbGcVisRiepilogoPerc.Name, False)     else SbGcVisRiepilogoPerc.Down := False;
    if SbGcVisMontato.Visible         then SbGcVisMontato.Down := P.ReadBool(SEZ, SbGcVisMontato.Name, False)                 else SbGcVisMontato.Down := False;
    if SbGcVisFatturato.Visible       then SbGcVisFatturato.Down := P.ReadBool(SEZ, SbGcVisFatturato.Name, (not GC_CantiereSelezionato))      else SbGcVisFatturato.Down := False;
    if SbGcVisMagazzino.Visible       then SbGcVisMagazzino.Down := P.ReadBool(SEZ, SbGcVisMagazzino.Name, False)             else SbGcVisMagazzino.Down := False;
    if SbGcVisSottocantieri.Visible   then SbGcVisSottocantieri.Down := P.ReadBool(SEZ, SbGcVisSottocantieri.Name, False)     else SbGcVisSottocantieri.Down := False;
    if SbGcVisGruppi.Visible          then SbGcVisGruppi.Down := P.ReadBool(SEZ, SbGcVisGruppi.Name, False)                   else SbGcVisGruppi.Down := False;
    if SbGcVisDocumenti.Visible       then SbGcVisDocumenti.Down := P.ReadBool(SEZ, SbGcVisDocumenti.Name, False)             else SbGcVisDocumenti.Down := False;
    if SbGcVisTrack.Visible           then SbGcVisTrack.Down := P.ReadBool(SEZ, SbGcVisTrack.Name, False)                     else SbGcVisTrack.Down := False;
    if SbGcVisCategCant.Visible       then SbGcVisCategCant.Down := P.ReadBool(SEZ, SbGcVisCategCant.Name, False)             else SbGcVisCategCant.Down := False;

    if SbGcVisDaMontareCommessa.Visible then SbGcVisDaMontareCommessa.Down := P.ReadBool(SEZ, SbGcVisDaMontareCommessa.Name, False)  else SbGcVisDaMontareCommessa.Down := False;
    if SbGcVisDaMontareGiacenza.Visible then SbGcVisDaMontareGiacenza.Down := P.ReadBool(SEZ, SbGcVisDaMontareGiacenza.Name, False)  else SbGcVisDaMontareGiacenza.Down := False;

    if SbGcVisDaFatturareCommessa.Visible then SbGcVisDaFatturareCommessa.Down := P.ReadBool(SEZ, SbGcVisDaFatturareCommessa.Name, (not GC_CantiereSelezionato))  else SbGcVisDaFatturareCommessa.Down := False;
    if SbGcVisDaFatturareGiacenza.Visible then SbGcVisDaFatturareGiacenza.Down := P.ReadBool(SEZ, SbGcVisDaFatturareGiacenza.Name, (not GC_CantiereSelezionato))  else SbGcVisDaFatturareGiacenza.Down := False;
    if SbGcVisDaFatturareMontato.Visible  then SbGcVisDaFatturareMontato.Down  := P.ReadBool(SEZ, SbGcVisDaFatturareMontato.Name,  False)  else SbGcVisDaFatturareMontato.Down  := False;

    if SbGcVisQta.Visible             then SbGcVisQta.Down := P.ReadBool(SEZ, SbGcVisQta.Name, (GC_CantiereSelezionato))                          else SbGcVisQta.Down := False;
    if SbGcVisPrzUnitAcquisto.Visible then SbGcVisPrzUnitAcquisto.Down := P.ReadBool(SEZ, SbGcVisPrzUnitAcquisto.Name, (GC_CantiereSelezionato))  else SbGcVisPrzUnitAcquisto.Down := False;
    if SbGcVisImportiAcquisto.Visible then SbGcVisImportiAcquisto.Down := P.ReadBool(SEZ, SbGcVisImportiAcquisto.Name, (GC_CantiereSelezionato))  else SbGcVisImportiAcquisto.Down := False;
    if SbGcVisPrzUnitVendita.Visible  then SbGcVisPrzUnitVendita.Down := P.ReadBool(SEZ, SbGcVisPrzUnitVendita.Name, (GC_CantiereSelezionato))    else SbGcVisPrzUnitVendita.Down := False;
    if SbGcVisImportiVendita.Visible  then SbGcVisImportiVendita.Down := P.ReadBool(SEZ, SbGcVisImportiVendita.Name, True)                        else SbGcVisImportiVendita.Down := False;
    if SbGcVisRicaricoPercent.Visible  then SbGcVisRicaricoPercent.Down := P.ReadBool(SEZ, SbGcVisRicaricoPercent.Name, (GC_CantiereSelezionato)) else SbGcVisRicaricoPercent.Down := False;
    if SbGcVisRicaricoImporto.Visible  then SbGcVisRicaricoImporto.Down := P.ReadBool(SEZ, SbGcVisRicaricoImporto.Name, (GC_CantiereSelezionato)) else SbGcVisRicaricoImporto.Down := False;

    if SbGcVisPerArticolo.Visible       then SbGcVisPerArticolo.Down := P.ReadBool(SEZ, SbGcVisPerArticolo.Name, (not GC_CantiereSelezionato))    else SbGcVisPerArticolo.Down := False;
    if SbGcVisCronologicoGiorno.Visible then SbGcVisCronologicoGiorno.Down := P.ReadBool(SEZ, SbGcVisCronologicoGiorno.Name, False)               else SbGcVisCronologicoGiorno.Down := False;
    if SbGcVisCronologicoMese.Visible   then SbGcVisCronologicoMese.Down := P.ReadBool(SEZ, SbGcVisCronologicoMese.Name, False)                   else SbGcVisCronologicoMese.Down := False;
    if SbGcVisPerCantiere.Visible       then SbGcVisPerCantiere.Down := P.ReadBool(SEZ, SbGcVisPerCantiere.Name, False)                           else SbGcVisPerCantiere.Down := False;
end;


procedure TTabGCForm.btvGCDblClick(Sender: TObject);
begin
  inherited;
   // Visualizza il documento
   OpenDocMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TTabGCForm.btvGCEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  inherited;
   // In base al tipo del mittente
   if Target is TListView then begin
      // Se il mittente è la ricezione di un documento dal sistema di interscambio dei documenti...
      if (Target as TListView).Name = 'ListViewExpDoc' then begin
        // Esporta i righi selezionati del Giornale di Cantiere
        EsportaGC(btvGC);
      end;
   end;
end;



// Funzione che ritorna il nome del SOGGETTO del documento
function TTabGCForm.GetRagSocCliDocumento(TipoDoc:String; NumDoc:Integer; RegDoc:String; DataDoc:TDateTime): String;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := '';
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT RAGSOCCLI FROM PRVORDCL');
    Q.SQL.Add('WHERE TIPODOCUMENTO =  ''' + TipoDoc + '''');
    Q.SQL.Add('  AND NUMORDPREV = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND REGISTRO =  ''' + RegDoc + '''');
    Q.SQL.Add('  AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.Open;
    if not Q.Eof then begin
      Result := Q.Fields[0].AsString;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;


// Funzione che ritorna il tipo di documento da inserire nell'esportazione di un rigo
//  alla bacheca in base a quanto risulta dal sistema di tracking dei documenti.
function TTabGCForm.GetTipoDocPerEsportazioneRigoGCNew(DC:TcxCustomDataController; RI:Integer):String;
begin
  // Se il rigo è stato messo in un DDT...
  if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_DDT.Index])) and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> '')
    then Result := DM1.ExpDocToDocType(DC.Values[RI, btvGCRighiTRACK_DDT.Index])
  // Se il rigo è stato messo in una BOLLA_ENTR...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])) and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> '')
    then Result := DM1.ExpDocToDocType(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])
  // Se il rigo è stato messo in una COMMESSA...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])) and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> '')
    then Result := DM1.ExpDocToDocType(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])
  // Se il rigo è stato messo in un PREVENTIVO...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])) and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> '')
    then Result := DM1.ExpDocToDocType(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])
  // Altrimenti usa i dati del documento originario
  else Result := DC.Values[RI, btvGCRighiTIPODOCUMENTO.Index];
end;

// Funzione che ritorna il numero di documento da inserire nell'esportazione di un rigo
//  alla bacheca in base a quanto risulta dal sistema di tracking dei documenti.
function TTabGCForm.GetNumDocPerEsportazioneRigoGCNew(DC:TcxCustomDataController; RI:Integer):Integer;
begin
  // Se il rigo è stato messo in un DDT...
  if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_DDT.Index])) and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> '')
    then Result := DM1.ExpDocToDocNum(DC.Values[RI, btvGCRighiTRACK_DDT.Index])
  // Se il rigo è stato messo in una BOLLA_ENTR...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])) and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> '')
    then Result := DM1.ExpDocToDocNum(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])
  // Se il rigo è stato messo in una COMMESSA...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])) and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> '')
    then Result := DM1.ExpDocToDocNum(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])
  // Se il rigo è stato messo in un PREVENTIVO...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])) and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> '')
    then Result := DM1.ExpDocToDocNum(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])
  // Altrimenti usa i dati del documento originario
  else Result := DC.Values[RI, btvGCRighiNUMORDPREV.Index];
end;

// Funzione che ritorna il registro di documento da inserire nell'esportazione di un rigo
//  alla bacheca in base a quanto risulta dal sistema di tracking dei documenti.
function TTabGCForm.GetRegDocPerEsportazioneRigoGCNew(DC:TcxCustomDataController; RI:Integer):String;
begin
  // Se il rigo è stato messo in un DDT...
  if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_DDT.Index])) and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> '')
    then Result := DM1.ExpDocToDocReg(DC.Values[RI, btvGCRighiTRACK_DDT.Index])
  // Se il rigo è stato messo in una BOLLA_ENTR...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])) and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> '')
    then Result := DM1.ExpDocToDocReg(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])
  // Se il rigo è stato messo in una COMMESSA...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])) and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> '')
    then Result := DM1.ExpDocToDocReg(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])
  // Se il rigo è stato messo in un PREVENTIVO...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])) and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> '')
    then Result := DM1.ExpDocToDocReg(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])
  // Altrimenti usa i dati del documento originario
  else Result := DC.Values[RI, btvGCRighiREGISTRO.Index];
end;

function TTabGCForm.GetDataDocPerEsportazioneRigoGCNew(DC:TcxCustomDataController; RI:Integer):TDateTime;
begin
  // Se il rigo è stato messo in un DDT...
  if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_DDT.Index])) and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_DDT.Index] <> '')
    then Result := DM1.ExpDocToDocDate(DC.Values[RI, btvGCRighiTRACK_DDT.Index])
  // Se il rigo è stato messo in una BOLLA DI ENTRATA...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])) and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index] <> '')
    then Result := DM1.ExpDocToDocDate(DC.Values[RI, btvGCRighiTRACK_BOLLA_ENTR.Index])
  // Se il rigo è stato messo in una COMMESSA...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])) and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index] <> '')
    then Result := DM1.ExpDocToDocDate(DC.Values[RI, btvGCRighiTRACK_COMMESSA.Index])
  // Se il rigo è stato messo in un PREVENTIVO...
  else if (not VarIsNull(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])) and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> 'n.c.') and (DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index] <> '')
    then Result := DM1.ExpDocToDocDate(DC.Values[RI, btvGCRighiTRACK_PREVENTIVO.Index])
  // Altrimenti usa i dati del documento originario
  else Result := DC.Values[RI, btvGCRighiDATADOCUMENTO.Index];
end;

// Esporta i righi selezionati del giornale di cantiere
procedure TTabGCForm.EsportaNewGC;
var
   i, RI, PR:Longint;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   SpeseExists, ManodoperaExists, Updating: Boolean;
   CurrTipoDoc, CurrRegDoc: String;
   CurrNumDoc: Integer;
   CurrDataDoc: TDateTime;
   LocalTransaction: TIB_Transaction;
   ATipologiaRigo: String;
   ExtraRif: String;
begin
   // Inizializzazione
   SpeseExists := False;
   ManodoperaExists := False;
   // Creazione del componente transazione
   LocalTransaction := TIB_Transaction.Create(Self);
   LocalTransaction.IB_Connection := DM1.DBGenerale;
   LocalTransaction.Isolation := tiCommitted;
   // Creazione del componenti Query per l'inserimento dei righi nella bacheca
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   // DC punta al Datacontroller
   DC := btvGCRighi.DataController;
   // Inizio update della griglia
   Updating := btvGCRighi.IsUpdateLocked;
   if not Updating then btvGCRighi.BeginUpdate;
   // Avvio della transazione
   LocalTransaction.StartTransaction;
   // Messaggio a video
   DM1.ShowWait('Levante','Esportazione delle voci selezionate in corso...');
   try try
      // Prima di tutto trova il PROGRIGO + alto all'interno della tabella TmpRighi in modo da
      //  continuare con la progressione
      Qry.SQL.Add('SELECT MAX(PROGRIGO) AS PR FROM TMPRIGHI');
      Qry.Open;
      PR := Qry.FieldByName('PR').AsInteger;
      Qry.Close;
      Inc(PR,1);
      // Copia tutti righi da esportare nel file 'TmpRighi' da dove, in seguito,
      //  potranno essere importati in nuovi documenti con il relativo riferimento.
      //----------------------------------
      for i := 0 to btvGCRighi.Controller.SelectedRecordCount - 1 do begin
         // Se questo rigo non è un rigo di Grouping procede, altrimenti lo salta
         if btvGCRighi.Controller.SelectedRecords[i].IsData then begin
           // RI contiene l'indice del record da importare
           RI := btvGCRighi.Controller.SelectedRecords[i].RecordIndex;
           // Carica la tipologia del rigo
           //  NB: Se la tipologia del rigo attuale non è di tipo "Materiali / Apparecchi"
           //       e nemmeno "Altre spese" allora significa che è manodopera; però siccome
           //       nel caso della manodopera la tipologia del rigo non è univoca (in pratica
           //       è uno dei 5 diversi tipi di manodopera che si possono avere) allora
           //       imposta la variabile in modo fisso = "Manodopera"
           ATipologiaRigo := VarToStr(DC.Values[RI,btvGCRighiTIPOLOGIA.Index]);
           if (ATipologiaRigo <> 'Materiali / Apparecchi') and (ATipologiaRigo <> 'Altre spese') and (ATipologiaRigo <> 'Relazione Intervento') then
             ATipologiaRigo := 'Manodopera';
           // Se il rigo attuale fa parte della manodopera imposta il flag
           //  che indica che c'è almeno un rigo di manodopera presente nel GC
           // Se il rigo attuale fa parte delle spese varie imposta il flag
           //  che indica che c'è almeno un rigo di spese varie presente nel GC
           if (FBachecaAccorpaAltreSpese and (ATipologiaRigo = 'Altre spese')) then
             SpeseExists := True
           else
           if (FBachecaAccorpaManodopera and (ATipologiaRigo = 'Manodopera')) then
             ManodoperaExists := True;
           // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno (a meno che non sia un rigo Relazione Intervento)
           //  NB: Inoltre esporta direttamente solo i righi di Materiali / Apparecchi perchè
           //       gli altri li mette riepilogati su un unico rigo (se abilitato)
           if (not VarIsNull(DC.Values[RI,btvGCRighiGC_QTA.Index])) and (DC.Values[RI,btvGCRighiGC_QTA.Index] <> 0) and
           (
             (ATipologiaRigo = 'Materiali / Apparecchi')  // Rigo normale
             or ((ATipologiaRigo = 'Altre spese') and not FBachecaAccorpaAltreSpese)  // Rigo altre spese e riepilogazione non attiva
             or ((ATipologiaRigo = 'Manodopera') and not FBachecaAccorpaManodopera)  // Rigo manodopera e riepilogazione non attiva
           )
           or (ATipologiaRigo = 'Relazione Intervento')  // Relazione Intervento
           then
           begin
             // Ricava i dati del documento in alcune variabili per comodità
             CurrTipoDoc := GetTipoDocPerEsportazioneRigoGCNew(DC,RI);
             CurrNumDoc  := GetNumDocPerEsportazioneRigoGCNew(DC,RI);
             CurrRegDoc  := GetRegDocPerEsportazioneRigoGCNew(DC,RI);
             CurrDataDoc := GetDataDocPerEsportazioneRigoGCNew(DC,RI);

             // Costruisce il valore (eventuale) dell'EXTRARIF con cui esportare l'eventuale RDA (Max 200 char)
             // -----------------------------------------------------------------
             ExtraRif := Trim(VarToStr(DC.Values[RI,btvGCRighiRDA.Index]));
             if ExtraRif <> '' then
               ExtraRif := LeftStr(Format(' (RDA %s)', [ExtraRif]), 200);
             // -----------------------------------------------------------------

             // Effettua l'inserimento dei righi selezionati nell'archivio
             //  temporaneo dei righi selezionati per essere importati in altri documenti.
             // ------------------------------------------------------------------------
             // Se il rigo è tra quelli selezionati, procede alla suo esportazione.
             Qry.SQL.Clear;
             Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, RagSocCli, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica, DataPratica, DescPratica,');
             Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
             Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti, EXTRA_RIFERIMENTO,');
             Qry.SQL.Add('GUID_REF, GUID_ANCESTOR)');
             Qry.SQL.Add('values (');
             Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID

             // In base al tracking dei documenti determina quale deve essere il riferimento a documento di provenienza
             Qry.SQL.Add(QuotedStr(CurrTipoDoc) + ',');     // Tipo documento
             Qry.SQL.Add(QuotedStr(CurrRegDoc) + ',');      // Registro documento
             Qry.SQL.Add(IntToStr(CurrNumDoc) + ',');       // NumOrdPrev
             Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', CurrDataDoc)) + ',');   // Data documento
             Qry.SQL.Add(QuotedStr(GetRagSocCliDocumento(CurrTipoDoc, CurrNumDoc, CurrRegDoc, CurrDataDoc)) + ',');     // RagSocCli

             Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
             Qry.SQL.Add('-1,');   // ProgRigo2

             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente

             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiCODICEARTICOLOREALE.Index]) + ',');   // COdice articolo
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiGC_CODICEARTICOLO.Index]) + ',');   // COdice articolo STM

//             Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // Pratica
//             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica
             Qry.SQL.Add(DM1.IntVarToSQL(DC.Values[RI,btvGCRighiPRATICA.Index]) + ',');
//             Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', DC.Values[RI,btvGCRighiDATAPRATICA1.Index])) + ',');   // Data pratica
             Qry.SQL.Add(DM1.DateVarToSQL(DC.Values[RI,btvGCRighiDATAPRATICA1.Index]) + ',');
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiDESCRIZIONEPRATICA.Index]) + ',');

             Qry.SQL.Add(DM1.IntVarToSQL(DC.Values[RI,btvGCRighiCODICEIVA.Index]) + ',');   // Codice IVA
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiDESCRIZIONEIVA.Index]) + ',');   // Descrizione IVA
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiALIQUOTAIVA.Index]) + ',');   // Aliquota IVA
             Qry.SQL.Add(DM1.StrVarToSQL(DM1.StrLeft(DC.DisplayTexts[RI,btvGCRighiGC_DESCRIZIONE.Index], 5000)) + ',');   // Descrizione
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_PRZVEND.Index]) + ',');   // Prezzo unitario
             Qry.SQL.Add('NULL,');   // Prezzo unitario IVA compresa
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_QTA.Index], 4) + ',');   // Qtà
             Qry.SQL.Add('0,');   // Sconto rigo 1
             Qry.SQL.Add('0,');   // Sconto rigo 2
             Qry.SQL.Add('0,');   // Sconto rigo 3
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiGC_UNITADIMISURA.Index]) + ',');
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_COSTONETTOUNITARIO.Index]) + ',');   // Prezzo acquisto articolo
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_RICARICO.Index]) + ',');   // Margine
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_GUADAGNOIMPORTO.Index]) + ',');   // Importo Margine
             Qry.SQL.Add('NULL,');   // Note rigo
             Qry.SQL.Add('NULL,');   // MovMag
             Qry.SQL.Add('NULL,');   // PrzUnitOpera
             Qry.SQL.Add('NULL,');   // QtaOpera
             Qry.SQL.Add('NULL,');   // CodiceMagazzino
             Qry.SQL.Add('NULL,');    // Minuti previsti
             Qry.SQL.Add(AnsiQuotedStr(ExtraRif, '''') + ',');
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiGUID_REF.Index]) + ',');
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiGUID.Index]));
             Qry.SQL.Add(')');
//Qry.SQL.SaveToFile('c:\sql.sql');
             Qry.ExecSQL;
           end;
         end;
      end;
      // Effettua l'esportazione dell'eventuale manodopera selezionata
      if ManodoperaExists then begin
        DM1.ShowWait('', 'Esportazione della manodopera selezionata in corso...');
        EsportaManodoperaNewGC;
      end;
      // Effettua l'esportazione delle eventuali spese varie
      if SpeseExists then begin
        DM1.ShowWait('', 'Esportazione delle altre spese selezionate in corso...');
        EsportaSpeseNewGC;
      end;
      // Commit
      LocalTransaction.Commit;
   except
      // Rollback
      LocalTransaction.Rollback;
   end;
   finally
      DM1.CloseWait;
      if not Updating then btvGCRighi.EndUpdate;
      Qry.Free;
      LocalTransaction.Free;
      MainForm.AggiornaDocumentiEsportati;
   end;
end;

// Esporta i righi selezionati del nuovo giornale di cantiere SOLO MANODOPERA
procedure TTabGCForm.EsportaManodoperaNewGC;
type
   TLocalTotaliManodopera = record
     Qta: Double;
     ImportoCosto: Double;
     ImportoVendita: Double;
     CostoUnit: Double;
     PrzUnitVend: Double;
     Ricarico: Double;
     RicaricoImporto: Double;
   end;
var
   i, RI, PR:Longint;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   QtaRigo, RicaricoRigo, CostoUnitRigo, ImportoCostoRigo: Double;
   LocalTotaliManodopera: array[0..4] of TLocalTotaliManodopera;
   OI: Integer;
begin
   // Inizializzazione
   QtaRigo := 0;
   RicaricoRigo := 0;
   CostoUnitRigo := 0;
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   DC := btvGCRighi.DataController;
   try
      // Prima di tutto trova il PROGRIGO + alto all'interno della tabella TmpRighi in modo da
      //  continuare con la progressione
      Qry.SQL.Add('SELECT MAX(PROGRIGO) AS PR FROM TMPRIGHI');
      Qry.Open;
      PR := Qry.FieldByName('PR').AsInteger;
      Qry.Close;
      Inc(PR,1);
      // Ora calcola il totale della manodopera
      //----------------------------------
      for i := 0 to btvGCRighi.Controller.SelectedRecordCount - 1 do begin
         // Se questo rigo non è un rigo di Grouping procede, altrimenti lo salta
         if btvGCRighi.Controller.SelectedRecords[i].IsData then begin
           // RI contiene l'indice del record da importare
           RI := btvGCRighi.Controller.SelectedRecords[i].RecordIndex;
           // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno
           //  NB: Solo se è un rigo manodopera
           //  Se invece è un rigo da considerare aggiorna i totali
           if (not VarIsNull(DC.Values[RI,btvGCRighiGC_QTA.Index]))
           and (DC.Values[RI,btvGCRighiGC_QTA.Index] <> 0)
           and (DC.Values[RI,btvGCRighiTIPOLOGIA.Index] <> 'Materiali / Apparecchi')
           and (DC.Values[RI,btvGCRighiTIPOLOGIA.Index] <> 'Altre spese')
           then begin
             // Ricava l'indice del tipo di manodopera da aggiornare tra quele disponibili.
             OI := DC.Values[RI,btvGCRighiOPERAINDEX.Index];
             // Aggiorna i totali
             LocalTotaliManodopera[OI].Qta := LocalTotaliManodopera[OI].Qta + DM1.NoNullFloatValue(DC, RI, btvGCRighiGC_QTA.Index);
             LocalTotaliManodopera[OI].ImportoCosto := LocalTotaliManodopera[OI].ImportoCosto + DM1.NoNullFloatValue(DC, RI, btvGCRighiGC_COSTONETTOIMPORTO.Index);
           end;
         end;
      end;
      //----------------------------------
      // Effettua il calcolo di alcuni valori e l'inserimento del rigo così generato nella bacheca
      for i := 0 to Length(LocalTotaliManodopera) -1 do
      begin
        // RIcalcolo alcuni totali
        if LocalTotaliManodopera[i].Qta <> 0 then
        begin
          // Se specificato usa come costo unitario di manodopera il costo specifico del cantiere
          //  se questo è uguale a zero usa il costo dei righi
          LocalTotaliManodopera[i].CostoUnit := GetCostoUnitOperaCantiere(i);
          if LocalTotaliManodopera[i].CostoUnit = 0 then
            LocalTotaliManodopera[i].CostoUnit := DM1.Arrotonda(LocalTotaliManodopera[i].ImportoCosto / LocalTotaliManodopera[i].Qta,   DM1.DecMicroPrz);
          // Determina il prezzo unitazio di vendita della manodopera da esportare
          LocalTotaliManodopera[i].PrzUnitVend := GetPrzUnitOperaCantiere(i);
          // Effettua l'inserimento della manodopera nella bacheca
          Qry.SQL.Clear;
          Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica,');
          Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
          Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
          Qry.SQL.Add('values (');
          Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
          Qry.SQL.Add('''CANTIERE'',');     // Tipo documento
          Qry.SQL.Add(''''',');            // Registro
          Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // NumOrdPrev
          if ClientiForm.DataPraticaCorrenteSQL <> '' then
            Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
          else
            Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento
          Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
          Qry.SQL.Add('-1,');   // ProgRigo2
          Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente
          Qry.SQL.Add('''' + DM1.Manodopera[i].Codice + ''',');   // COdice articolo
          Qry.SQL.Add('''' + DM1.Manodopera[i].Codice + ''',');   // COdice articolo STM
          Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica
          Qry.SQL.Add('NULL,');   // Codice IVA
          Qry.SQL.Add('NULL,');   // Descrizione IVA
          Qry.SQL.Add('NULL,');   // Aliquota IVA
          Qry.SQL.Add(QuotedStr(DM1.Manodopera[i].Descrizione) + ',');   // Descrizione
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].PrzUnitVend) + ',');   // Prezzo unitario
          Qry.SQL.Add('NULL,');   // Prezzo unitario IVA compresa
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].Qta, 4) + ',');   // Qta
          Qry.SQL.Add('0,');   // Sconto rigo 1
          Qry.SQL.Add('0,');   // Sconto rigo 2
          Qry.SQL.Add('0,');   // Sconto rigo 3
          Qry.SQL.Add(QuotedStr(DM1.Manodopera[i].UM) + ',');
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].CostoUnit) + ',');   // Prezzo acquisto articolo
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].Ricarico) + ',');   // Margine
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].RicaricoImporto) + ',');   // Importo margine
          Qry.SQL.Add('NULL,');   // Note rigo
          Qry.SQL.Add('NULL,');   // MovMag
          Qry.SQL.Add('NULL,');   // PrzUnitOpera
          Qry.SQL.Add('NULL,');   // QtaOpera
          Qry.SQL.Add('NULL,');   // CodiceMagazzino
          Qry.SQL.Add('NULL');    // Minuti previsti
          Qry.SQL.Add(')');
          Qry.ExecSQL;
        end;
      end;
   finally
      Qry.Free;
   end;
end;

// Esporta i righi selezionati del nuovo giornale di cantiere solo SPESE VARIE
procedure TTabGCForm.EsportaSpeseNewGC;
var
   i, RI, PR, PR2:Longint;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
begin
   // Inizializzazione
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   DC := btvGCRighi.DataController;
   try
      // Prima di tutto trova il PROGRIGO + alto all'interno della tabella TmpRighi in modo da
      //  continuare con la progressione
      Qry.SQL.Add('SELECT MAX(PROGRIGO) AS PR FROM TMPRIGHI');
      Qry.Open;
      PR := Qry.FieldByName('PR').AsInteger;
      Qry.Close;
      Inc(PR,1);
      PR2 := 0;

      // INserisce il rigo principale delle spese varie
      Qry.SQL.Clear;
      Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica,');
      Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
      Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
      Qry.SQL.Add('values (');
      Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
      Qry.SQL.Add('''CANTIERE'',');     // Tipo documento
      Qry.SQL.Add(''''',');            // Registro                               DM1.FloatVarToSQL(PrzUnitRigo) + ',');
      Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // NumOrdPrev
      if ClientiForm.DataPraticaCorrenteSQL <> '' then
        Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
      else
        Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento
      Qry.SQL.Add(IntToStr(PR) + ',');   // ProgRigo
      Qry.SQL.Add('-1,');   // ProgRigo2
      Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente
      Qry.SQL.Add('NULL,');   // COdice articolo
      Qry.SQL.Add('NULL,');   // COdice articolo STM
      Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica
      Qry.SQL.Add('NULL,');   // Codice IVA
      Qry.SQL.Add('NULL,');   // Descrizione IVA
      Qry.SQL.Add('NULL,');   // Aliquota IVA
      Qry.SQL.Add('''RIMBORSO SPESE VARIE   (In questa voce posso essere compresi tutti quei costi che non siano manodopera, materiali o apparecchi (es: noleggi di attrezzature, vitto, alloggio, pedaggi ecc.)'',');   // Descrizione
      Qry.SQL.Add('NULL,');   // Prezzo unitario
      Qry.SQL.Add('NULL,');   // Prezzo unitario IVA compresa
      Qry.SQL.Add('1,');   // Qtà
      Qry.SQL.Add('0,');   // Sconto rigo 1
      Qry.SQL.Add('0,');   // Sconto rigo 2
      Qry.SQL.Add('0,');   // Sconto rigo 3
      Qry.SQL.Add('NULL,');   // Unità di misura
      Qry.SQL.Add('0,');   // Prezzo acquisto articolo
      Qry.SQL.Add('0,');   // Margine
      Qry.SQL.Add('NULL,');   // Importo margine
      Qry.SQL.Add('NULL,');   // Note rigo
      Qry.SQL.Add('NULL,');   // MovMag
      Qry.SQL.Add('NULL,');   // PrzUnitOpera
      Qry.SQL.Add('NULL,');   // QtaOpera
      Qry.SQL.Add('NULL,');   // CodiceMagazzino
      Qry.SQL.Add('NULL');    // Minuti previsti
      Qry.SQL.Add(')');
      Qry.ExecSQL;

      // Cicla per tutti i righi alla ricerca dei righi relativi alle spese varie
      for i := 0 to btvGCRighi.Controller.SelectedRecordCount - 1 do begin
         // Se questo rigo non è un rigo di Grouping procede, altrimenti lo salta
         if btvGCRighi.Controller.SelectedRecords[i].IsData then begin
           // RI contiene l'indice del record da importare
           RI := btvGCRighi.Controller.SelectedRecords[i].RecordIndex;
           // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno
           if (DC.Values[RI,btvGCRighiTIPOLOGIA.Index] = 'Altre spese')
           then begin
             // Se il rigo è tra quelli selezionati, procede alla suo esportazione.
             Qry.SQL.Clear;
             Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, Pratica,');
             Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
             Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
             Qry.SQL.Add('values (');
             Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
             Qry.SQL.Add('''CANTIERE'',');   // Tipo documento
             Qry.SQL.Add(''''',');   // Registro
             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // NumOrdPrev
             if ClientiForm.DataPraticaCorrenteSQL <> '' then
               Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
             else
               Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento
             Qry.SQL.Add(IntToStr(PR) + ',');   // ProgRigo
             Qry.SQL.Add(IntToStr(PR2) + ',');   // ProgRIgo2
             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente
             Qry.SQL.Add('NULL,');   // COdice articolo
             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica
             Qry.SQL.Add('NULL,');   // Codice IVA
             Qry.SQL.Add('NULL,');   // Descrizione IVA
             Qry.SQL.Add('NULL,');   // Aliquota IVA
             Qry.SQL.Add(DM1.StrVarToSQL(DM1.StrLeft(DC.DisplayTexts[RI,btvGCRighiGC_DESCRIZIONE.Index], 5000)) + ',');   // Descrizione
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_PRZVEND.Index]) + ',');   // PrezzoUnitario
             Qry.SQL.Add('NULL,');   // PrezzoUnitario IVA compresa
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_QTA.Index], 4) + ',');   // Qta
             Qry.SQL.Add('0,');    // Sconto rigo 1
             Qry.SQL.Add('0,');   // Sconto rigo 2
             Qry.SQL.Add('0,');   // Sconto rigo 3
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCRighiGC_UNITADIMISURA.Index]) + ',');   // UNita di misura
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_COSTONETTOUNITARIO.Index]) + ',');   // Prezzo acquisto articolo
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_RICARICO.Index]) + ',');   // Ricarico
             Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RI,btvGCRighiGC_GUADAGNOIMPORTO.Index]) + ',');   // IMporto ricarido
             Qry.SQL.Add('NULL,');   // Note rigo
             Qry.SQL.Add('NULL,');   // MovMag
             Qry.SQL.Add('NULL,');   // PrzUnitOpera
             Qry.SQL.Add('NULL,');   // QtaOpera
             Qry.SQL.Add('NULL,');   // Codice magazzino
             Qry.SQL.Add('NULL');    // Minuti previsti
             Qry.SQL.Add(')');
             Qry.ExecSQL;
             // Agiorna PR2
             Inc(PR2);
           end;
         end;
      end;
   finally
      Qry.Free;
   end;
end;







// Esporta i righi selezionati del giornale di cantiere
procedure TTabGCForm.EsportaGC(TV:TcxGridBandedTableView);
var
   i, RI, YY, PR:Longint;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   CostoUnitRigo, CostoImportoRigo, RicaricoRigo, QtaRigo, PrzUnitVend: Double;
   SpeseExists, ManodoperaExists, Updating: Boolean;
   CodiceArticolo: String;
begin
   // Avverte l'utente che l'esportazione in bacheca dalla vista riepilogata non
   //  inserirà i riferimenti ai documenti.
   if DM1.Messaggi('Esportazione Cantiere in Bacheca', 'ATTENZIONE !!!'#13#13'L''esportazione in bacheca da una vista riepilogata non inserirà i riferimenti ai documenti.'#13#13#13'Continuare ugualmente?', 'Suggerimento: Per evere anche i riferimenti ai documenti effettuare l''esportazione dalla vista non riepilogativa.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
   // Inizializzazione
   SpeseExists := False;
   ManodoperaExists := False;
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   DC := TV.DataController;
   // Inizio update della griglia
   Updating := GridGC.UpdateLocked;
   if not Updating then GridGC.BeginUpdate;
   // Avvio della transazione
   DM1.DBAzienda.StartTransaction;
   // Messaggio a video
   DM1.ShowWait('Levante','Esportazione delle voci selezionate in corso...');
   try try
      if DM1.RicarichiPerFasceDiPrezzo then DM1.CaricaFasceRicarichi;
      // Prima di tutto trova il PROGRIGO + alto all'interno della tabella TmpRighi in modo da
      //  continuare con la progressione
      Qry.SQL.Add('SELECT MAX(PROGRIGO) AS PR FROM TMPRIGHI');
      Qry.Open;
      PR := Qry.FieldByName('PR').AsInteger;
      Qry.Close;
      Inc(PR,1);
      // Copia tutti righi da esportare nel file 'TmpRighi' da dove, in seguito,
      //  potranno essere importati in nuovi documenti con il relativo riferimento.
      //  Copia solo i righi specificati dal parametro ricevuto
      //  dal chiamante (ListaDoc).
      //----------------------------------
      for i := 0 to tv.Controller.SelectedRecordCount - 1 do begin
         // Se questo rigo non è un rigo di Grouping procede, altrimenti lo salta
         if tv.Controller.SelectedRecords[i].IsData then begin
           // RI contiene l'indice del record da importare
           RI := TV.Controller.SelectedRecords[i].RecordIndex;
           // Se il rigo attuale fa parte della manodopera imposta il flag
           //  che indica che c'è almeno un rigo di manodopera presente nel GC
           if (DC.Values[RI,btvGCTIPOLOGIA.Index] = 'Manodopera') then ManodoperaExists := True;
           // Se il rigo attuale fa parte delle spese varie imposta il flag
           //  che indica che c'è almeno un rigo di spese varie presente nel GC
           if (DC.Values[RI,btvGCTIPOLOGIA.Index] = 'Altre spese') then SpeseExists := True;
           // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno
           if (not VarIsNull(DC.Values[RI,btvGCGIACENZA_QTA.Index]))
           and (DC.Values[RI,btvGCGIACENZA_QTA.Index] <> 0)
           and (DC.Values[RI,btvGCTIPOLOGIA.Index] <> 'Manodopera')
           and (DC.Values[RI,btvGCTIPOLOGIA.Index] <> 'Altre spese')
           then begin
             // Calcola gli importi da inserire poi nei righi esportati
             CodiceArticolo       := DM1.NoNullStringValue(DC, RI, btvGCCODICEARTICOLO.Index);
             QtaRigo              := DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_QTA.Index);
             CostoUnitRigo        := DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_PRZUNITACQ.Index);
             CostoImportoRigo     := DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_IMPORTOACQ.Index);
             RicaricoRigo         := DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_RICARICO.Index);
             PrzUnitVend          := DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_PRZUNITVEND.Index);
             // Effettua l'inserimento dei righi selezionati nell'archivio
             //  temporaneo dei righi selezionati per essere importati in altri documenti.
             // ------------------------------------------------------------------------
             // Se il rigo è tra quelli selezionati, procede alla suo esportazione.
             Qry.SQL.Clear;
             Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica,');
             Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
             Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
             Qry.SQL.Add('values (');
             Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
             Qry.SQL.Add('''CANTIERE'',');     // Tipo documento
             Qry.SQL.Add(''''',');            // Registro                               DM1.FloatVarToSQL(PrzUnitRigo) + ',');

//             Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // NumOrdPrev
             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica as NumOrdPrev

//             Qry.SQL.Add('''' + ClientiForm.DataPraticaCorrenteSQL + ''',');   // Data documento
             if ClientiForm.DataPraticaCorrenteSQL <> '' then
               Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
             else
               Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento

             Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
             Qry.SQL.Add('-1,');   // ProgRigo2

             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente

             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCCODICEARTICOLO.Index]) + ',');   // COdice articolo
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCCODICEARTICOLO.Index]) + ',');   // COdice articolo STM

//             Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // Pratica
             Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica

             Qry.SQL.Add('NULL,');   // Codice IVA
             Qry.SQL.Add('NULL,');   // Descrizione IVA
             Qry.SQL.Add('NULL,');   // Aliquota IVA
             Qry.SQL.Add(DM1.StrVarToSQL(DM1.StrLeft(DC.DisplayTexts[RI,btvGCDESCRIZIONE.Index], 5000)) + ',');   // Descrizione
             Qry.SQL.Add(DM1.FloatVarToSQL(PrzUnitVend) + ',');   // Prezzo unitario
             Qry.SQL.Add('NULL,');   // Prezzo unitario IVA compresa
             // Se il rigo delle VARIE la Qta è sepre = 1
             if (not VarIsNull(DC.Values[RI,btvGCDESCRIZIONE.Index])) and (Trim(DC.Values[RI,btvGCDESCRIZIONE.Index]) = 'VARIE') then begin
               Qry.SQL.Add('1,');
             end else begin
               Qry.SQL.Add(DM1.FloatVarToSQL(QtaRigo, 4) + ',');
             end;
             Qry.SQL.Add('0,');   // Sconto rigo 1
             Qry.SQL.Add('0,');   // Sconto rigo 2
             Qry.SQL.Add('0,');   // Sconto rigo 3
             Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RI,btvGCUNITADIMISURA.Index]) + ',');
             Qry.SQL.Add(DM1.FloatVarToSQL(CostoUnitRigo) + ',');   // Prezzo acquisto articolo
             Qry.SQL.Add(DM1.FloatVarToSQL(RicaricoRigo) + ',');   // Margine
             Qry.SQL.Add('NULL,');   // Importo margine
             Qry.SQL.Add('NULL,');   // Note rigo
             Qry.SQL.Add('NULL,');   // MovMag
             Qry.SQL.Add('NULL,');   // PrzUnitOpera
             Qry.SQL.Add('NULL,');   // QtaOpera
             Qry.SQL.Add('NULL,');   // CodiceMagazzino
             Qry.SQL.Add('NULL');    // Minuti previsti
             Qry.SQL.Add(')');
//Qry.SQL.SaveToFile('c:\sql.sql');
             Qry.ExecSQL;
             // Se i rigo è un rigo VARIE esporta anche il dettaglio dei righi che compongono questa particolare sezione
             //  come sottorighi del rigo principale.
             // ------------------------------------------------------------------------
             // Inizio esportazione sottorighi
             // ------------------------------------------------------------------------
             if (not VarIsNull(DC.Values[RI,btvGCDESCRIZIONE.Index])) and (Trim(DC.Values[RI,btvGCDESCRIZIONE.Index]) = 'VARIE') then begin
               // DC ora punta al DetailDataController del rigo attuale
               DC := DC.GetDetailDataController(RI,0);
               // Cicla per tutti i sottorighi
               for YY := 0 to DC.RecordCount -1 do begin
                  // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno
                  if (not VarIsNull(DC.Values[YY,btvGCRighiGC_QTA.Index]))
                  and (DC.Values[YY,btvGCRighiGC_QTA.Index] <> 0)
                  and (DC.Values[YY,btvGCRighiTIPOLOGIA.Index] <> 'Manodopera')
                  then begin
                    // Calcola gli importi da inserire poi nei righi esportati
                    CodiceArticolo       := DM1.NoNullStringValue(DC, YY, btvGCRighiCODICEARTICOLO.Index);
                    QtaRigo              := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_QTA.Index);
                    CostoUnitRigo        := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_COSTONETTOUNITARIO.Index);
                    CostoImportoRigo     := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_COSTONETTOIMPORTO.Index);
                    RicaricoRigo         := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_RICARICO.Index);
                    PrzUnitVend          := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_PRZVEND.Index);

                    // Effettua l'inserimento dei righi selezionati nell'archivio
                    //  temporaneo dei righi selezionati per essere importati in altri documenti.
                    // ------------------------------------------------------------------------
                    // Se il rigo è tra quelli selezionati, procede alla suo esportazione.
                    Qry.SQL.Clear;
                    Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica,');
                    Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
                    Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
                    Qry.SQL.Add('values (');
                    Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
                    Qry.SQL.Add('''CANTIERE'',');   // Tipo documento
                    Qry.SQL.Add(''''',');   // Registro

//                    Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // NumOrdPrev
                    Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica as NumOrdPrev

//                    Qry.SQL.Add('''' + ClientiForm.DataPraticaCorrenteSQL + ''',');   // Data documento
                    if ClientiForm.DataPraticaCorrenteSQL <> '' then
                      Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
                    else
                      Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento

                    Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
                    Qry.SQL.Add(IntToStr(YY) + ',');   // ProgRIgo2

//                    Qry.SQL.Add(ClientiForm.ClienteCorrente + ',');   // COdice cliente
                    Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente

                    Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[YY,btvGCRighiGC_CODICEARTICOLO.Index]) + ',');   // COdice articolo
                    Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[YY,btvGCRighiGC_CODICEARTICOLO.Index]) + ',');   // COdice articolo STM

//                    Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // COdice pratica
                    Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Codice pratica

                    Qry.SQL.Add('NULL,');   // Codice IVA
                    Qry.SQL.Add('NULL,');   // Descrizione IVA
                    Qry.SQL.Add('NULL,');   // Aliquota IVA
                    Qry.SQL.Add(DM1.StrVarToSQL(DM1.StrLeft(DC.DisplayTexts[YY,btvGCRighiGC_DESCRIZIONE.Index], 5000)) + ',');   // Descrizione
                    Qry.SQL.Add('NULL,');   // PrezzoUnitario
                    Qry.SQL.Add('NULL,');   // PrezzoUnitario IVA compresa
                    Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[YY,btvGCRighiGC_QTA.Index]) + ',');   // Qta
                    Qry.SQL.Add('0,');    // Sconto rigo 1
                    Qry.SQL.Add('0,');   // Sconto rigo 2
                    Qry.SQL.Add('0,');   // Sconto rigo 3
                    Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[YY,btvGCRighiGC_UNITADIMISURA.Index]) + ',');   // UNita di misura
                    Qry.SQL.Add(DM1.FloatVarToSQL(CostoUnitRigo) + ',');   // Prezzo acquisto articolo
                    Qry.SQL.Add(DM1.FloatVarToSQL(RicaricoRigo) + ',');   // Ricarico
                    Qry.SQL.Add('NULL,');   // IMporto ricarido
                    Qry.SQL.Add('NULL,');   // Note rigo
                    Qry.SQL.Add('NULL,');   // MovMag
                    Qry.SQL.Add('NULL,');   // PrzUnitOpera
                    Qry.SQL.Add('NULL,');   // QtaOpera
                    Qry.SQL.Add('NULL,');   // Codice magazzino
                    Qry.SQL.Add('NULL');    // Minuti previsti
                    Qry.SQL.Add(')');
                    Qry.ExecSQL;
                  end;
               end;
               // DC ora ritorna a puntare al MasterDataController
               DC := DC.GetMasterDataController;
               // ------------------------------------------------------------------------
             end;
           end;
         end;
      end;
      // Effettua l'esportazione dell'eventuale manodopera selezionata
      if ManodoperaExists then begin
        DM1.ShowWait('', 'Esportazione della manodopera selezionata in corso...');
        EsportaManodoperaGC(TV);
      end;
      // Effettua l'esportazione delle eventuali spese varie
      if SpeseExists then begin
        DM1.ShowWait('', 'Esportazione della altre spese selezionata in corso...');
        EsportaSpeseGC(TV);
      end;
      // Commit
      DM1.DBAzienda.Commit;
   except
      // Rollback
      DM1.DBAzienda.Rollback;
   end;
   finally
      DM1.CloseWait;
      if not Updating then GridGC.EndUpdate;
      Qry.Free;
      MainForm.AggiornaDocumentiEsportati;
   end;
end;


// Esporta i righi selezionati del nuovo giornale di cantiere SOLO MANODOPERA
procedure TTabGCForm.EsportaManodoperaGC;
type
   TLocalTotaliManodopera = record
     Qta: Double;
     ImportoCosto: Double;
     ImportoVendita: Double;
     CostoUnit: Double;
     PrzUnitVend: Double;
     Ricarico: Double;
     RicaricoImporto: Double;
   end;
var
   i, RI, PR:Longint;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   QtaRigo, RicaricoRigo, CostoUnitRigo, ImportoCostoRigo: Double;
   LocalTotaliManodopera: array[0..4] of TLocalTotaliManodopera;
   OI: Integer;
begin
   // Inizializzazione
   QtaRigo := 0;
   RicaricoRigo := 0;
   CostoUnitRigo := 0;
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   DC := btvGC.DataController;
   try
      // Prima di tutto trova il PROGRIGO + alto all'interno della tabella TmpRighi in modo da
      //  continuare con la progressione
      Qry.SQL.Add('SELECT MAX(PROGRIGO) AS PR FROM TMPRIGHI');
      Qry.Open;
      PR := Qry.FieldByName('PR').AsInteger;
      Qry.Close;
      Inc(PR,1);
      // Ora calcola il totale della manodopera
      //----------------------------------
      for i := 0 to btvGC.Controller.SelectedRecordCount - 1 do begin
         // Se questo rigo non è un rigo di Grouping procede, altrimenti lo salta
         if btvGC.Controller.SelectedRecords[i].IsData then begin
           // RI contiene l'indice del record da importare
           RI := btvGC.Controller.SelectedRecords[i].RecordIndex;
           // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno
           //  NB: Solo se è un rigo manodopera
           //  Se invece è un rigo da considerare aggiorna i totali
           if (not VarIsNull(DC.Values[RI,btvGCGIACENZA_QTA.Index]))
           and (DC.Values[RI,btvGCGIACENZA_QTA.Index] <> 0)
           and (DC.Values[RI,btvGCTIPOLOGIA.Index] <> 'Materiali / Apparecchi')
           and (DC.Values[RI,btvGCTIPOLOGIA.Index] <> 'Altre spese')
           then begin
             // Ricava l'indice del tipo di manodopera da aggiornare tra quele disponibili.
             OI := GCCodArtToOperaIndex(DC.Values[RI,btvGCCODICEARTICOLO.Index]);
             // Aggiorna i totali
             LocalTotaliManodopera[OI].Qta              := LocalTotaliManodopera[OI].Qta + DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_QTA.Index);
             LocalTotaliManodopera[OI].ImportoCosto     := LocalTotaliManodopera[OI].ImportoCosto + DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_IMPORTOACQ.Index);
           end;
         end;
      end;
      // Effettua il calcolo di alcuni valori e l'inserimento del rigo così generato nella bacheca
      for i := 0 to Length(LocalTotaliManodopera) -1 do
      begin
        // RIcalcolo alcuni totali
        if LocalTotaliManodopera[i].Qta <> 0 then
        begin
          // Se specificato usa come costo unitario di manodopera il costo specifico del cantiere
          //  se questo è uguale a zero usa il costo dei righi
          LocalTotaliManodopera[i].CostoUnit := GetCostoUnitOperaCantiere(i);
          if LocalTotaliManodopera[i].CostoUnit = 0 then
            LocalTotaliManodopera[i].CostoUnit := DM1.Arrotonda(LocalTotaliManodopera[i].ImportoCosto / LocalTotaliManodopera[i].Qta,   DM1.DecMicroPrz);
          // Determina il prezzo unitazio di vendita della manodopera da esportare
          LocalTotaliManodopera[i].PrzUnitVend := GetPrzUnitOperaCantiere(i);
          // Effettua l'inserimento della manodoper a nella bacheca
          Qry.SQL.Clear;
          Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica,');
          Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
          Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
          Qry.SQL.Add('values (');
          Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
          Qry.SQL.Add('''CANTIERE'',');     // Tipo documento
          Qry.SQL.Add(''''',');            // Registro

//          Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // NumOrdPrev
          Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica as NumOrdPrev

//          Qry.SQL.Add('''' + ClientiForm.DataPraticaCorrenteSQL + ''',');   // Data documento
          if ClientiForm.DataPraticaCorrenteSQL <> '' then
            Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
          else
            Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento

          Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
          Qry.SQL.Add('-1,');   // ProgRigo2

//          Qry.SQL.Add(ClientiForm.ClienteCorrente + ',');   // Codice cliente
          Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente

          Qry.SQL.Add('''' + DM1.Manodopera[i].Codice + ''',');   // COdice articolo
          Qry.SQL.Add('''' + DM1.Manodopera[i].Codice + ''',');   // COdice articolo STM

//          Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // Pratica
          Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Codice pratica

          Qry.SQL.Add('NULL,');   // Codice IVA
          Qry.SQL.Add('NULL,');   // Descrizione IVA
          Qry.SQL.Add('NULL,');   // Aliquota IVA
          Qry.SQL.Add(QuotedStr(DM1.Manodopera[i].Descrizione) + ',');   // Descrizione
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].PrzUnitVend) + ',');   // Prezzo unitario
          Qry.SQL.Add('NULL,');   // Prezzo unitario IVA compresa
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].Qta, 4) + ',');   // Qta
          Qry.SQL.Add('0,');   // Sconto rigo 1
          Qry.SQL.Add('0,');   // Sconto rigo 2
          Qry.SQL.Add('0,');   // Sconto rigo 3
          Qry.SQL.Add(QuotedStr(DM1.Manodopera[i].UM) + ',');
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].CostoUnit) + ',');   // Prezzo acquisto articolo
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].Ricarico) + ',');   // Margine
          Qry.SQL.Add(DM1.FloatVarToSQL(LocalTotaliManodopera[i].RicaricoImporto) + ',');   // Importo margine
          Qry.SQL.Add('NULL,');   // Note rigo
          Qry.SQL.Add('NULL,');   // MovMag
          Qry.SQL.Add('NULL,');   // PrzUnitOpera
          Qry.SQL.Add('NULL,');   // QtaOpera
          Qry.SQL.Add('NULL,');   // CodiceMagazzino
          Qry.SQL.Add('NULL');    // Minuti previsti
          Qry.SQL.Add(')');
          Qry.ExecSQL;
        end;
      end;
   finally
      Qry.Free;
   end;
end;
{
// Esporta i righi selezionati del giornale di cantiere SOLO MANODOPERA
procedure TTabGCForm.EsportaManodoperaGC(TV:TcxGridBandedTableView; CodiceListino:Integer);
var
   LocalTotaliManodopera: array[0..4] of TLocalTotaliManodopera;
   OI: Integer;
   i, RI, PR:Longint;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   CostoUnitRigo, RicaricoRigo, QtaRigo: Double;
begin
   // Controllo
   if (CodiceListino > 4) or (CodiceListino < 1) then begin
     raise Exception.Create('Codice listino errato...');
   end;
   // Inizializzazione
   QtaRigo := 0;
   RicaricoRigo := 0;
   CostoUnitRigo := 0;
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   DC := TV.DataController;
   try
      // Prima di tutto trova il PROGRIGO + alto all'interno della tabella TmpRighi in modo da
      //  continuare con la progressione
      Qry.SQL.Add('SELECT MAX(PROGRIGO) AS PR FROM TMPRIGHI');
      Qry.Open;
      PR := Qry.FieldByName('PR').AsInteger;
      Qry.Close;
      Inc(PR,1);
      // Ora calcola il totale della manodopera
      //----------------------------------
      for i := 0 to tv.Controller.SelectedRecordCount - 1 do begin
         // Se questo rigo non è un rigo di Grouping procede, altrimenti lo salta
         if tv.Controller.SelectedRecords[i].IsData then begin
           // RI contiene l'indice del record da importare
           RI := TV.Controller.SelectedRecords[i].RecordIndex;
           // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno
           //  NB: Solo se è un rigo manodopera
           if (not VarIsNull(DC.Values[RI,btvGCGIACENZA_QTA.Index]))
           and (DC.Values[RI,btvGCGIACENZA_QTA.Index] <> 0)
           and (DC.Values[RI,btvGCTIPOLOGIA.Index] <> 'Materiali / Apparecchi')
           and (DC.Values[RI,btvGCTIPOLOGIA.Index] <> 'Altre spese')
           then begin
             // Aggiorna i totali
             QtaRigo := QtaRigo + DM1.NoNullFloatValue(DC, RI, btvGCGIACENZA_QTA.Index);
           end;
         end;
      end;
      // Ricava il costo unitario della manodopera
      case CodiceListino of
        1: CostoUnitRigo := DM1.Manodopera[0].PrezzoUnitario1;
        2: CostoUnitRigo := DM1.Manodopera[0].PrezzoUnitario2;
        3: CostoUnitRigo := DM1.Manodopera[0].PrezzoUnitario3;
        4: CostoUnitRigo := DM1.Manodopera[0].PrezzoUnitario4;
      end;
      // Effettua l'inserimento della manodopera nella bacheca
      Qry.SQL.Clear;
      Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, Pratica,');
      Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
      Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
      Qry.SQL.Add('values (');
      Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
      Qry.SQL.Add('''CANTIERE'',');     // Tipo documento
      Qry.SQL.Add(''''',');            // Registro                               DM1.FloatVarToSQL(PrzUnitRigo) + ',');
      Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // NumOrdPrev
      Qry.SQL.Add('''' + ClientiForm.DataPraticaCorrenteSQL + ''',');   // Data documento
      Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
      Qry.SQL.Add('-1,');   // ProgRigo2
      Qry.SQL.Add(ClientiForm.ClienteCorrente + ',');   // Codice cliente
      Qry.SQL.Add('''' + DM1.Manodopera[0].Codice + ''',');   // COdice articolo
      Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // Pratica
      Qry.SQL.Add('NULL,');   // Codice IVA
      Qry.SQL.Add('NULL,');   // Descrizione IVA
      Qry.SQL.Add('NULL,');   // Aliquota IVA
      Qry.SQL.Add(QuotedStr(DM1.Manodopera[0].Descrizione) + ',');   // Descrizione
      Qry.SQL.Add('NULL,');   // Prezzo unitario
      Qry.SQL.Add('NULL,');   // Prezzo unitario IVA compresa
      Qry.SQL.Add(DM1.FloatVarToSQL(QtaRigo) + ',');   // Qta
      Qry.SQL.Add('0,');   // Sconto rigo 1
      Qry.SQL.Add('0,');   // Sconto rigo 2
      Qry.SQL.Add('0,');   // Sconto rigo 3
      Qry.SQL.Add(QuotedStr(DM1.Manodopera[0].UM) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(CostoUnitRigo) + ',');   // Prezzo acquisto articolo
      Qry.SQL.Add(DM1.FloatVarToSQL(RicaricoRigo) + ',');   // Margine
      Qry.SQL.Add('NULL,');   // Importo margine
      Qry.SQL.Add('NULL,');   // Note rigo
      Qry.SQL.Add('NULL,');   // MovMag
      Qry.SQL.Add('NULL,');   // PrzUnitOpera
      Qry.SQL.Add('NULL,');   // QtaOpera
      Qry.SQL.Add('NULL,');   // CodiceMagazzino
      Qry.SQL.Add('NULL');    // Minuti previsti
      Qry.SQL.Add(')');
      Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;
}

// Esporta i righi selezionati dellle SPESE VARIE del giornale di cantiere
procedure TTabGCForm.EsportaSpeseGC(TV:TcxGridBandedTableView);
var
   i, RI, YY, PR:Longint;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   CostoUnitRigo, CostoImportoRigo, RicaricoRigo, QtaRigo, PrzUnitRigo: Double;
begin
   // Inizializzazione
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   DC := TV.DataController;
   try
      // Prima di tutto trova il PROGRIGO + alto all'interno della tabella TmpRighi in modo da
      //  continuare con la progressione
      Qry.SQL.Add('SELECT MAX(PROGRIGO) AS PR FROM TMPRIGHI');
      Qry.Open;
      PR := Qry.FieldByName('PR').AsInteger;
      Qry.Close;
      Inc(PR,1);

      // INserisce il rigo principale delle spese varie
      Qry.SQL.Clear;
      Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloSTM, Pratica,');
      Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
      Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
      Qry.SQL.Add('values (');
      Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
      Qry.SQL.Add('''CANTIERE'',');     // Tipo documento
      Qry.SQL.Add(''''',');            // Registro                               DM1.FloatVarToSQL(PrzUnitRigo) + ',');

//      Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // NumOrdPrev
      Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica as NumOrdPrev

//      Qry.SQL.Add('''' + ClientiForm.DataPraticaCorrenteSQL + ''',');   // Data documento
      if ClientiForm.DataPraticaCorrenteSQL <> '' then
        Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
      else
        Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento

      Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
      Qry.SQL.Add('-1,');   // ProgRigo2

//      Qry.SQL.Add(ClientiForm.ClienteCorrente + ',');   // Codice cliente
      Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente

      Qry.SQL.Add('NULL,');   // COdice articolo
      Qry.SQL.Add('NULL,');   // COdice articolo STM

//      Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // Pratica
      Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Codice pratica

      Qry.SQL.Add('NULL,');   // Codice IVA
      Qry.SQL.Add('NULL,');   // Descrizione IVA
      Qry.SQL.Add('NULL,');   // Aliquota IVA
      Qry.SQL.Add('''RIMBORSO SPESE VARIE   (In questa voce posso essere compresi tutti quei costi che non siano manodopera, materiali o apparecchi (es: noleggi di attrezzature, vitto, alloggio, pedaggi ecc.)'',');   // Descrizione
      Qry.SQL.Add('NULL,');   // Prezzo unitario
      Qry.SQL.Add('NULL,');   // Prezzo unitario IVA compresa
      Qry.SQL.Add('1,');   // Qtà
      Qry.SQL.Add('0,');   // Sconto rigo 1
      Qry.SQL.Add('0,');   // Sconto rigo 2
      Qry.SQL.Add('0,');   // Sconto rigo 3
      Qry.SQL.Add('NULL,');   // Unità di misura
      Qry.SQL.Add('0,');   // Prezzo acquisto articolo
      Qry.SQL.Add('0,');   // Margine
      Qry.SQL.Add('NULL,');   // Importo margine
      Qry.SQL.Add('NULL,');   // Note rigo
      Qry.SQL.Add('NULL,');   // MovMag
      Qry.SQL.Add('NULL,');   // PrzUnitOpera
      Qry.SQL.Add('NULL,');   // QtaOpera
      Qry.SQL.Add('NULL,');   // CodiceMagazzino
      Qry.SQL.Add('NULL');    // Minuti previsti
      Qry.SQL.Add(')');
      Qry.ExecSQL;

      // Cicla per tutti i righi alla ricerca dei righi relativi alle spese varie
      for i := 0 to tv.Controller.SelectedRecordCount - 1 do begin
         // Se questo rigo non è un rigo di Grouping procede, altrimenti lo salta
         if tv.Controller.SelectedRecords[i].IsData then begin
           // RI contiene l'indice del record da importare
           RI := TV.Controller.SelectedRecords[i].RecordIndex;
           // Se la giacenza dell'articolo attuale  = 0 non lo esporta nemmeno
           if (DC.Values[RI,btvGCTIPOLOGIA.Index] = 'Altre spese')
           then begin
             // DC ora punta al DetailDataController del rigo attuale
             DC := DC.GetDetailDataController(RI,0);
             // Cicla per tutti i sottorighi
             for YY := 0 to DC.RecordCount -1 do begin
               // Calcola gli importi da inserire poi nei righi esportati
               QtaRigo              := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_QTA.Index);
               CostoUnitRigo        := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_COSTONETTOUNITARIO.Index);
               PrzUnitRigo          := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_PRZVEND.Index);
               RicaricoRigo         := DM1.NoNullFloatValue(DC, YY, btvGCRighiGC_RICARICO.Index);
               // Se il rigo è tra quelli selezionati, procede alla suo esportazione.
               Qry.SQL.Clear;
               Qry.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, Pratica,');
               Qry.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
               Qry.SQL.Add('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti)');
               Qry.SQL.Add('values (');
               Qry.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
               Qry.SQL.Add('''CANTIERE'',');   // Tipo documento
               Qry.SQL.Add(''''',');   // Registro

//               Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // NumOrdPrev
               Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Pratica as NumOrdPrev

//               Qry.SQL.Add('''' + ClientiForm.DataPraticaCorrenteSQL + ''',');   // Data documento
               if ClientiForm.DataPraticaCorrenteSQL <> '' then
                 Qry.SQL.Add(QuotedStr(ClientiForm.DataPraticaCorrenteSQL) + ',')   // Data documento
               else
                 Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', 0)) + ',');   // Data documento

               Qry.SQL.Add(IntToStr(PR + i) + ',');   // ProgRigo
               Qry.SQL.Add(IntToStr(YY) + ',');   // ProgRIgo2

//               Qry.SQL.Add(ClientiForm.ClienteCorrente + ',');   // COdice cliente
               Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.ClienteCorrente, 0)) + ',');   // Codice cliente

               Qry.SQL.Add('NULL,');   // COdice articolo

//               Qry.SQL.Add(ClientiForm.PraticaCorrente + ',');   // COdice pratica
               Qry.SQL.Add(IntToStr(StrToIntDef(ClientiForm.PraticaCorrente, 0)) + ',');   // Codice pratica

               Qry.SQL.Add('NULL,');   // Codice IVA
               Qry.SQL.Add('NULL,');   // Descrizione IVA
               Qry.SQL.Add('NULL,');   // Aliquota IVA
               Qry.SQL.Add(DM1.StrVarToSQL(DM1.StrLeft(DC.DisplayTexts[YY,btvGCRighiGC_DESCRIZIONE.Index], 5000)) + ',');   // Descrizione
               Qry.SQL.Add(DM1.FloatVarToSQL(PrzUnitRigo) + ',');   // PrezzoUnitario
               Qry.SQL.Add('NULL,');   // PrezzoUnitario IVA compresa
               Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[YY,btvGCRighiGC_QTA.Index], 4) + ',');   // Qta
               Qry.SQL.Add('0,');    // Sconto rigo 1
               Qry.SQL.Add('0,');   // Sconto rigo 2
               Qry.SQL.Add('0,');   // Sconto rigo 3
               Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[YY,btvGCRighiGC_UNITADIMISURA.Index]) + ',');   // UNita di misura
               Qry.SQL.Add(DM1.FloatVarToSQL(CostoUnitRigo) + ',');   // Prezzo acquisto articolo
               Qry.SQL.Add(DM1.FloatVarToSQL(RicaricoRigo) + ',');   // Ricarico
               Qry.SQL.Add('NULL,');   // IMporto ricarido
               Qry.SQL.Add('NULL,');   // Note rigo
               Qry.SQL.Add('NULL,');   // MovMag
               Qry.SQL.Add('NULL,');   // PrzUnitOpera
               Qry.SQL.Add('NULL,');   // QtaOpera
               Qry.SQL.Add('NULL,');   // Codice magazzino
               Qry.SQL.Add('NULL');    // Minuti previsti
               Qry.SQL.Add(')');
               Qry.ExecSQL;
             end;
             // DC ora ritorna a puntare al MasterDataController
             DC := DC.GetMasterDataController;
           end;
         end;
      end;
   finally
      Qry.Free;
   end;
end;


// Funzione che ritorna l'OperaIndex a partire dal CodiceArticolo della riga di
//  Manodopera
function TTabGCForm.GCCodArtToOperaIndex(CodArt:String): Integer;
var
  CodArtOpera: String;
begin
  Result := -1;
  CodArtOpera := RightStr(CodArt, (Length(CodArt)-8));
  if      CodArtOpera = DM1.Manodopera[0].Codice then Result := 0
  else if CodArtOpera = DM1.Manodopera[1].Codice then Result := 1
  else if CodArtOpera = DM1.Manodopera[2].Codice then Result := 2
  else if CodArtOpera = DM1.Manodopera[3].Codice then Result := 3
  else if CodArtOpera = DM1.Manodopera[4].Codice then Result := 4;
end;


// Funzione che ritorna il prezzo di vendita della manodopera come da cantiere
function TTabGCForm.GetPrzUnitOperaCantiere(OI:Integer): Double;
begin
  Result := 0;
  case OI of
    0: Result := GcVisPrezzoManodopera1.Value;
    1: Result := GcVisPrezzoManodopera2.Value;
    2: Result := GcVisPrezzoManodopera3.Value;
    3: Result := GcVisPrezzoManodopera4.Value;
    4: Result := GcVisPrezzoManodopera5.Value;
  end;
end;

// Funzione che ritorna la data di documento da inserire nell'esportazione di un rigo
//  alla bacheca in base a quanto risulta dal sistema di tracking dei documenti.
function TTabGCForm.GetCostoUnitOperaCantiere(OI: Integer): Double;
begin
  Result := 0;
  case OI of
    0: Result := GcVisCostoManodopera1.Value;
    1: Result := GcVisCostoManodopera2.Value;
    2: Result := GcVisCostoManodopera3.Value;
    3: Result := GcVisCostoManodopera4.Value;
    4: Result := GcVisCostoManodopera5.Value;
  end;
end;

procedure TTabGCForm.btvGCKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TTabGCForm.btvGCMAG_DAORDINAREGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
  inherited;
  // Se la qta da ordinare < 0 significa che non bisogna ordinare nulla
  if btvGC.DataController.Values[ARecordIndex, btvGCMAG_DAORDINARE.Index] <= 0 then begin
    AText := '- - -';
  end;
end;

procedure TTabGCForm.SbGcVisCommessaClick(Sender: TObject);
begin
  inherited;
  VisualizzaColonneGCMaster;
end;

procedure TTabGCForm.SbGcVisCommessaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      ResetSectionButtons;
      (Sender as TSpeedButton).Down := True;
      SbGcVisCommessaClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabGCForm.ResetSectionButtons;
begin
  SbGcVisCommessa.Down      := False;
  SbGcVisMagazzino.Down     := False;
  SbGcVisGiacenza.Down      := False;
  SbGcVisMontato.Down       := False;
  SbGcVisFatturato.Down     := False;
  SbGcVisSottocantieri.Down := False;
  SbGcVisGruppi.Down        := False;

  SbGcVisDaMontareCommessa.Down   := False;
  SbGcVisDaMontareGiacenza.Down   := False;

  SbGcVisDaFatturareCommessa.Down   := False;
  SbGcVisDaFatturareGiacenza.Down   := False;
  SbGcVisDaFatturareMontato.Down    := False;

  GCSoloRighiNoZero.Checked[0] := fDefaultSoloRighiNoZero;
end;

procedure TTabGCForm.VisualizzaColonneGCMaster;
var
  AlreadyUpdating: Boolean;
begin
  AlreadyUpdating := GridGC.UpdateLocked;
  if not AlreadyUpdating then GridGC.BeginUpdate;
  try
    // =========================================================================
    // BANDE
    // -------------------------------------------------------------------------
    // btvGC
    btvGC.Bands.FindItemID(GC_BAND_ARTICOLO).Visible              := True;
    btvGC.Bands.FindItemID(GC_BAND_COMMESSA).Visible              := SbGcVisCommessa.Down;
    btvGC.Bands.FindItemID(GC_BAND_GIACENZA).Visible              := SbGcVisGiacenza.Down;

    btvGC.Bands.FindItemID(GC_BAND_RIEPILOGO).Visible             := SbGcVisRiepilogo.Down;
    btvGC.Bands.FindItemID(GC_BAND_RIEPILOGO_PERC).Visible        := SbGcVisRiepilogoPerc.Down;

    btvGC.Bands.FindItemID(GC_BAND_MONTATO).Visible               := SbGcVisMontato.Down;
    btvGC.Bands.FindItemID(GC_BAND_DAMONTARE_COMMESSA).Visible    := SbGcVisDaMontareCommessa.Down;
    btvGC.Bands.FindItemID(GC_BAND_DAMONTARE_GIACENZA).Visible    := SbGcVisDaMontareGiacenza.Down;

    btvGC.Bands.FindItemID(GC_BAND_FATTURATO).Visible             := SbGcVisFatturato.Down;
    btvGC.Bands.FindItemID(GC_BAND_DAFATTURARE_COMMESSA).Visible  := SbGcVisDaFatturareCommessa.Down;
    btvGC.Bands.FindItemID(GC_BAND_DAFATTURARE_GIACENZA).Visible  := SbGcVisDaFatturareGiacenza.Down;
    btvGC.Bands.FindItemID(GC_BAND_DAFATTURARE_MONTATO).Visible   := SbGcVisDaFatturareMontato.Down;

    btvGC.Bands.FindItemID(GC_BAND_MAGAZZINO).Visible             := SbGcVisMagazzino.Down;
    btvGC.Bands.FindItemID(GC_BAND_SOTTOCANTIERI).Visible         := SbGcVisSottocantieri.Down;
    btvGC.Bands.FindItemID(GC_BAND_GRUPPI).Visible                := SbGcVisGruppi.Down;
    btvGC.Bands.FindItemID(GC_BAND_CATEGCANT).Visible             := SbGcVisCategCant.Down;

    // btvGCRighi
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_ARTICOLO).Visible       := True;
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_VALORE).Visible         := True;
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_TRACK).Visible          := SbGcVisTrack.Down;
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_SOTTOCANTIERI).Visible  := SbGcVisSottocantieri.Down;
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_GRUPPI).Visible         := SbGcVisGruppi.Down;
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_MAGAZZINO).Visible      := SbGcVisMagazzino.Down and GC_IsVistaDettaglio;
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_DOCUMENTO).Visible      := SbGcVisDocumenti.Down;
    btvGCRighi.Bands.FindItemID(GCRIGHI_BAND_CATEGCANT).Visible      := SbGcVisCategCant.Down;
    // =========================================================================

    // =========================================================================
    // COLONNE BTVGC
    // -------------------------------------------------------------------------
    // Visualizza o meno le colonne ARTICOLO
//    btvGCTIPOLOGIA.Visible              := btvGCTIPOLOGIA.Position.Band.Visible          and True;
    btvGCCODICEARTICOLO.Visible         := btvGCCODICEARTICOLO.Position.Band.Visible     and True;
    btvGCDESCRIZIONE.Visible            := btvGCDESCRIZIONE.Position.Band.Visible        and True;
    btvGCUNITADIMISURA.Visible          := btvGCUNITADIMISURA.Position.Band.Visible      and True;

    // Visualizza o meno le colonne COMMESSA
    btvGCCOMMESSA_QTA.Visible             := btvGCCOMMESSA_QTA.Position.Band.Visible          and SbGcVisQta.Down;
    btvGCCOMMESSA_IMPORTOACQ.Visible      := btvGCCOMMESSA_IMPORTOACQ.Position.Band.Visible   and SbGcVisImportiAcquisto.Down;
    btvGCCOMMESSA_IMPORTOVEND.Visible     := btvGCCOMMESSA_IMPORTOVEND.Position.Band.Visible  and SbGcVisImportiVendita.Down;
    btvGCCOMMESSA_PRZUNITACQ.Visible      := btvGCCOMMESSA_PRZUNITACQ.Position.Band.Visible   and SbGcVisPrzUnitAcquisto.Down;
    btvGCCOMMESSA_PRZUNITVEND.Visible     := btvGCCOMMESSA_PRZUNITVEND.Position.Band.Visible  and SbGcVisPrzUnitVendita.Down;
    btvGCCOMMESSA_RICARICO.Visible        := btvGCCOMMESSA_RICARICO.Position.Band.Visible     and SbGcVisRicaricoPercent.Down;
//    btvGCCOMMESSA_GUADAGNOUNITARIO.Visible:= btvGCCOMMESSA_GUADAGNOUNITARIO.Position.Band.Visible and SbGcVisRicaricoImporto.Down;
    btvGCCOMMESSA_GUADAGNOUNITARIO.Visible := False;
    btvGCCOMMESSA_GUADAGNOIMPORTO.Visible := btvGCCOMMESSA_GUADAGNOIMPORTO.Position.Band.Visible  and SbGcVisRicaricoImporto.Down;

    // Visualizza o meno le colonne GIACENZA
    btvGCGIACENZA_QTA.Visible             := btvGCGIACENZA_QTA.Position.Band.Visible          and SbGcVisQta.Down;
    btvGCGIACENZA_IMPORTOACQ.Visible      := btvGCGIACENZA_IMPORTOACQ.Position.Band.Visible   and SbGcVisImportiAcquisto.Down;
    btvGCGIACENZA_IMPORTOVEND.Visible     := btvGCGIACENZA_IMPORTOVEND.Position.Band.Visible  and SbGcVisImportiVendita.Down;
    btvGCGIACENZA_PRZUNITACQ.Visible      := btvGCGIACENZA_PRZUNITACQ.Position.Band.Visible   and SbGcVisPrzUnitAcquisto.Down;
    btvGCGIACENZA_PRZUNITVEND.Visible     := btvGCGIACENZA_PRZUNITVEND.Position.Band.Visible  and SbGcVisPrzUnitVendita.Down;
    btvGCGIACENZA_RICARICO.Visible        := btvGCGIACENZA_RICARICO.Position.Band.Visible     and SbGcVisRicaricoPercent.Down;
//    btvGCCOMMESSA_GUADAGNOUNITARIO.Visible:= btvGCCOMMESSA_GUADAGNOUNITARIO.Position.Band.Visible and SbGcVisRicaricoImporto.Down;
    btvGCGIACENZA_GUADAGNOUNITARIO.Visible := False;
    btvGCGIACENZA_GUADAGNOIMPORTO.Visible := btvGCGIACENZA_GUADAGNOIMPORTO.Position.Band.Visible  and SbGcVisRicaricoImporto.Down;

    // Visualizza o meno le colonne RIEPILOGO
    btvGCRIEP_QTA.Visible                := btvGCRIEP_QTA.Position.Band.Visible               and SbGcVisQta.Down             and SbGcVisCommessa.Down;
    btvGCRIEP_COSTI.Visible              := btvGCRIEP_COSTI.Position.Band.Visible             and SbGcVisImportiAcquisto.Down and SbGcVisCommessa.Down;
    btvGCRIEP_MARGINE_COMMESSA.Visible   := btvGCRIEP_MARGINE_COMMESSA.Position.Band.Visible  and SbGcVisRicaricoImporto.Down and SbGcVisCommessa.Down;
    btvGCRIEP_MARGINE_FATTURATO.Visible  := btvGCRIEP_MARGINE_FATTURATO.Position.Band.Visible and SbGcVisRicaricoImporto.Down and SbGcVisFatturato.Down;
    btvGCRIEP_MARGINE_MONTATO.Visible    := btvGCRIEP_MARGINE_MONTATO.Position.Band.Visible   and SbGcVisRicaricoImporto.Down and SbGcVisMontato.Down;
    // Visualizza o meno le colonne RIEPILOGO PERC
    btvGCRIEP_PERC_QTA.Visible                := btvGCRIEP_PERC_QTA.Position.Band.Visible               and SbGcVisQta.Down             and SbGcVisCommessa.Down;
    btvGCRIEP_PERC_COSTI.Visible              := btvGCRIEP_PERC_COSTI.Position.Band.Visible             and SbGcVisImportiAcquisto.Down and SbGcVisCommessa.Down;
    btvGCRIEP_PERC_MARGINE_COMMESSA.Visible   := btvGCRIEP_PERC_MARGINE_COMMESSA.Position.Band.Visible  and SbGcVisRicaricoPercent.Down and SbGcVisCommessa.Down;
    btvGCRIEP_PERC_MARGINE_FATTURATO.Visible  := btvGCRIEP_PERC_MARGINE_FATTURATO.Position.Band.Visible and SbGcVisRicaricoPercent.Down and SbGcVisFatturato.Down;;
    btvGCRIEP_PERC_MARGINE_MONTATO.Visible    := btvGCRIEP_PERC_MARGINE_MONTATO.Position.Band.Visible   and SbGcVisRicaricoPercent.Down and SbGcVisMontato.Down;;

    // Visualizza o meno le colonne MONTATO
    btvGCMONTATO_QTA.Visible             := btvGCMONTATO_QTA.Position.Band.Visible          and SbGcVisQta.Down;
    btvGCMONTATO_IMPORTOACQ.Visible      := btvGCMONTATO_IMPORTOACQ.Position.Band.Visible   and SbGcVisImportiAcquisto.Down;
    btvGCMONTATO_IMPORTOVEND.Visible     := btvGCMONTATO_IMPORTOVEND.Position.Band.Visible  and SbGcVisImportiVendita.Down;
    btvGCMONTATO_PRZUNITACQ.Visible      := btvGCMONTATO_PRZUNITACQ.Position.Band.Visible   and SbGcVisPrzUnitAcquisto.Down;
    btvGCMONTATO_PRZUNITVEND.Visible     := btvGCMONTATO_PRZUNITVEND.Position.Band.Visible  and SbGcVisPrzUnitVendita.Down;
    btvGCMONTATO_RICARICO.Visible        := btvGCMONTATO_RICARICO.Position.Band.Visible     and SbGcVisRicaricoPercent.Down;
//    btvGCCOMMESSA_GUADAGNOUNITARIO.Visible:= btvGCCOMMESSA_GUADAGNOUNITARIO.Position.Band.Visible and SbGcVisRicaricoImporto.Down;
    btvGCMONTATO_GUADAGNOUNITARIO.Visible := False;
    btvGCMONTATO_GUADAGNOIMPORTO.Visible := btvGCMONTATO_GUADAGNOIMPORTO.Position.Band.Visible  and SbGcVisRicaricoImporto.Down;

    // Visualizza o meno le colonne FATTURATO
    btvGCFATTURATO_IMPORTOVEND.Visible     := btvGCFATTURATO_IMPORTOVEND.Position.Band.Visible;

    // Visualizza o meno le colonne DA MONTARE
    btvGCDAMONT_COMMESSA_IMPORTOVEND.Visible     := btvGCDAMONT_COMMESSA_IMPORTOVEND.Position.Band.Visible;
    btvGCDAMONT_GIACENZA_IMPORTOVEND.Visible     := btvGCDAMONT_GIACENZA_IMPORTOVEND.Position.Band.Visible;

    // Visualizza o meno le colonne DA FATTURARE
    btvGCDAFATT_COMMESSA_IMPORTOVEND.Visible     := btvGCDAFATT_COMMESSA_IMPORTOVEND.Position.Band.Visible;
    btvGCDAFATT_GIACENZA_IMPORTOVEND.Visible     := btvGCDAFATT_GIACENZA_IMPORTOVEND.Position.Band.Visible;
    btvGCDAFATT_MONTATO_IMPORTOVEND.Visible      := btvGCDAFATT_MONTATO_IMPORTOVEND.Position.Band.Visible;

    // MAGAZZINO
    btvGCMAG_DISPONIBILE.Visible             := btvGCMAG_DISPONIBILE.Position.Band.Visible;
    btvGCMAG_DAORDINARE.Visible              := btvGCMAG_DAORDINARE.Position.Band.Visible;
    btvGCMAG_ULTIMOPREZZOACQUISTO.Visible    := btvGCMAG_ULTIMOPREZZOACQUISTO.Position.Band.Visible;

    // SOTTOCANTIERI
    btvGCSOTTOCANTIERE1.Visible := btvGCSOTTOCANTIERE1.Position.Band.Visible;
    btvGCSOTTOCANTIERE2.Visible := btvGCSOTTOCANTIERE2.Position.Band.Visible;
    btvGCSOTTOCANTIERE3.Visible := btvGCSOTTOCANTIERE3.Position.Band.Visible;

    // GRUPPI
    btvGCGRUPPO1.Visible := btvGCGRUPPO1.Position.Band.Visible;
    btvGCGRUPPO2.Visible := btvGCGRUPPO2.Position.Band.Visible;
    btvGCGRUPPO3.Visible := btvGCGRUPPO3.Position.Band.Visible;
    btvGCGRUPPO4.Visible := btvGCGRUPPO4.Position.Band.Visible;
    btvGCGRUPPO5.Visible := btvGCGRUPPO5.Position.Band.Visible;
    btvGCGRUPPO6.Visible := btvGCGRUPPO6.Position.Band.Visible;

    // CATEGORIE CANTIERI
    //  NB: Per decidere se sono visibili o meno veerifica anche la proprietà "VisibleForCUstomization" che
    //       viene impostata nel caricamento del layout in base alle impostazioni del layout.ini
    btvGCCATEGCANT1.Visible := btvGCCATEGCANT1.Position.Band.Visible and btvGCCATEGCANT1.VisibleForCustomization;
    btvGCCATEGCANT2.Visible := btvGCCATEGCANT2.Position.Band.Visible and btvGCCATEGCANT2.VisibleForCustomization;
    btvGCCATEGCANT3.Visible := btvGCCATEGCANT3.Position.Band.Visible and btvGCCATEGCANT3.VisibleForCustomization;
    btvGCCATEGCANT4.Visible := btvGCCATEGCANT4.Position.Band.Visible and btvGCCATEGCANT4.VisibleForCustomization;
    btvGCCATEGCANT5.Visible := btvGCCATEGCANT5.Position.Band.Visible and btvGCCATEGCANT5.VisibleForCustomization;
    btvGCCATEGCANT6.Visible := btvGCCATEGCANT6.Position.Band.Visible and btvGCCATEGCANT6.VisibleForCustomization;
    // =========================================================================

    // =========================================================================
    // COLONNE BTVGCRIGHI
    // -------------------------------------------------------------------------
    // Se siamo in una vista riassunta per articolo, giorno o mese, lega la Vista
    //  dei BtvGCRighi come detail di btvGC altrimenti la slega.
    if IsSummaryView then begin
      lvGC2Det.GridView := btvGCRighi;
      lvGC2.MakeVisible;
      btvGCRighi.OptionsView.GroupByBox := False;
      // Se siamo riassunti per articolo o data disabilita la possibilità di
      //  sorting delle colonne perchè altrimenti ci sono problemi nella stampa
      //  del giornale di cantiere con i dettagli aperti.
      //  NB: Elimina anche la possibilità di grouping salvando prima in un array
      //       le colonne grouped per una eventuale successivo ripristino.
      SaveRestoreGroupedBtvGCRighiColumn(False);
      UngroupAll(btvGCRighi);
      UnsortAll(btvGCRighi);
      btvGCRighi.OptionsCustomize.ColumnSorting := False;
    end else begin
      lvGCRighi.GridView :=btvGCRighi;
      lvGCRighi.MakeVisible;
      btvGCRighi.OptionsView.GroupByBox := True;
      // Se NON siamo riassunti per articolo o data riabilita la possibilità
      //  di sorting delle colonne.
      btvGCRighi.OptionsCustomize.ColumnSorting := True;
      // Ripristina le eventuali colonne grouped
      SaveRestoreGroupedBtvGCRighiColumn(True);
    end;
    btvGCRighiGC_QTA_MOD.Visible                  := btvGCRighiGC_QTA_MOD.Position.Band.Visible                 and SbGcVisQta.Down;
    btvGCRighiGC_QTA.Visible                      := btvGCRighiGC_QTA.Position.Band.Visible                     and SbGcVisQta.Down;
    btvGCRighiGC_COSTONETTOUNITARIO_MOD.Visible   := btvGCRighiGC_COSTONETTOUNITARIO_MOD.Position.Band.Visible  and SbGcVisPrzUnitAcquisto.Down;
    btvGCRighiGC_COSTONETTOUNITARIO.Visible       := btvGCRighiGC_COSTONETTOUNITARIO.Position.Band.Visible      and SbGcVisPrzUnitAcquisto.Down;
    btvGCRighiGC_COSTONETTOIMPORTO.Visible        := btvGCRighiGC_COSTONETTOIMPORTO.Position.Band.Visible       and SbGcVisImportiAcquisto.Down;
    btvGCRighiGC_RICARICO_MOD.Visible             := btvGCRighiGC_RICARICO_MOD.Position.Band.Visible            and SbGcVisRicaricoPercent.Down;
    btvGCRighiGC_RICARICO.Visible                 := btvGCRighiGC_RICARICO.Position.Band.Visible                and SbGcVisRicaricoPercent.Down;
//    btvGCRighiGC_GUADAGNOUNITARIO.Visible         := btvGCRighiGC_GUADAGNOUNITARIO.Position.Band.Visible        and SbGcVisRicaricoImporto.Down;
    btvGCRighiGC_GUADAGNOUNITARIO.Visible         := False;
    btvGCRighiGC_GUADAGNOIMPORTO.Visible          := btvGCRighiGC_GUADAGNOIMPORTO.Position.Band.Visible         and SbGcVisRicaricoImporto.Down;
    btvGCRighiGC_PRZVEND.Visible                  := btvGCRighiGC_PRZVEND.Position.Band.Visible                 and SbGcVisPrzUnitVendita.Down;
    btvGCRighiGC_PRZVENDIMPORTO.Visible           := btvGCRighiGC_PRZVENDIMPORTO.Position.Band.Visible          and SbGcVisImportiVendita.Down;

    // TRACK
    btvGCRighiTRACK_PREVENTIVO.Visible      := btvGCRighiTRACK_PREVENTIVO.Position.Band.Visible;
    btvGCRighiTRACK_COMMESSA.Visible        := btvGCRighiTRACK_COMMESSA.Position.Band.Visible;
    btvGCRighiTRACK_DDT.Visible             := btvGCRighiTRACK_DDT.Position.Band.Visible;
    btvGCRighiTRACK_SAL.Visible             := btvGCRighiTRACK_SAL.Position.Band.Visible;
    btvGCRighiTRACK_ESTRATTO_CONTO.Visible  := btvGCRighiTRACK_ESTRATTO_CONTO.Position.Band.Visible;
    btvGCRighiTRACK_FATTURA.Visible         := btvGCRighiTRACK_FATTURA.Position.Band.Visible;

    // MAGAZZINO
    btvGCRighiMAG_DISPONIBILE.Visible             := btvGCRighiMAG_DISPONIBILE.Position.Band.Visible;
    btvGCRighiMAG_ULTIMOPREZZOACQUISTO.Visible    := btvGCRighiMAG_ULTIMOPREZZOACQUISTO.Position.Band.Visible;

    // DATI DOCUMENTO
    btvGCRighiCODICEARTICOLOREALE.Visible := btvGCRighiCODICEARTICOLOREALE.Position.Band.Visible and (DM1.TableProgressiviDOCGESTARTFORNSECONDARI.AsString = 'T');

    // CATEGORIE CANTIERI
    //  NB: Per decidere se sono visibili o meno veerifica anche la proprietà "VisibleForCUstomization" che
    //       viene impostata nel caricamento del layout in base alle impostazioni del layout.ini
    btvGCRighiCATEGCANT1.Visible := btvGCRighiCATEGCANT1.Position.Band.Visible and btvGCRighiCATEGCANT1.VisibleForCustomization;
    btvGCRighiCATEGCANT2.Visible := btvGCRighiCATEGCANT2.Position.Band.Visible and btvGCRighiCATEGCANT2.VisibleForCustomization;
    btvGCRighiCATEGCANT3.Visible := btvGCRighiCATEGCANT3.Position.Band.Visible and btvGCRighiCATEGCANT3.VisibleForCustomization;
    btvGCRighiCATEGCANT4.Visible := btvGCRighiCATEGCANT4.Position.Band.Visible and btvGCRighiCATEGCANT4.VisibleForCustomization;
    btvGCRighiCATEGCANT5.Visible := btvGCRighiCATEGCANT5.Position.Band.Visible and btvGCRighiCATEGCANT5.VisibleForCustomization;
    btvGCRighiCATEGCANT6.Visible := btvGCRighiCATEGCANT6.Position.Band.Visible and btvGCRighiCATEGCANT6.VisibleForCustomization;
    // =========================================================================

  finally
    if not AlreadyUpdating then GridGC.EndUpdate;
  end;
end;




// Procedura che salva e ripristina le colonne della vista di dettaglio dei righi quando si
//  passa dalla visualizzazione normale (dettaglio) a quella riassuntiva per articolo o data e poi
//  ripristina la situazione al ritorno alla visualizzazione normale (dettaglio).
//  Ho dovuto farlo perchè altrimenti le colonne che al momento del passaggio dalla visualizzazinoe
//  normale a quella riassuntiva erano in ragruppamento al ritorno alla visualizzazione normale
//  sparivano.
procedure TTabGCForm.SaveRestoreGroupedBtvGCRighiColumn(Restore:Boolean);
var
  i: Integer;
begin
  // Se siamo in modalità restore ripristina le colonne grouped precedentemente
  //  salvate
  if Restore then begin
    // Cicla per tutto l'array e ripristina le colonne rpecedentemente grouped
    for i := 0 to Length(PrecBtvGCRighiGroupedColumn) -1 do begin
      PrecBtvGCRighiGroupedColumn[i].GroupBy(i);
    end;
  // Se invece siamo in modalità salvataggio salva le colonne attualmente grouped per
  //  il successivo ripristino.
  end else begin
    // Dimensiona l'array
    SetLength(PrecBtvGCRighiGroupedColumn, btvGCRighi.GroupedColumnCount);
    // Cicla per le colonne grouped della vista e le salva nell'array
    for i := 0 to btvGCRighi.GroupedColumnCount -1 do begin
      PrecBtvGCRighiGroupedColumn[i] := (btvGCRighi.GroupedColumns[i] as TcxGridDBBandedColumn);;
    end;
  end;
end;






procedure TTabGCForm.UngroupAll(btv:TcxGridBandedTableView);
var
  i: Integer;
begin
  for i := (btv.GroupedColumnCount -1) downto 0 do begin
    btv.GroupedColumns[i].GroupIndex := -1;
  end;
end;

procedure TTabGCForm.UnsortAll(btv:TcxGridBandedTableView);
var
  i: Integer;
begin
  for i := (btv.SortedItemCount -1) downto 0 do begin
    btv.SortedItems[i].SortOrder := soNone;
  end;
end;



procedure TTabGCForm.SbGcVisMem1Click(Sender: TObject);
begin
  inherited;
  try
    if SbGcVisMemAdd.Down then begin
      StopSalvaVistaGCNelleMemorie;
      if DM1.Messaggi('Memorizza vista', 'Confermi di voler salvare la vista attuale in questa memoria?', 'NB: La nuova vista sovrascriverà l''eventuale vista precedentemente memorizzata nella stessa memoria.', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
      SalvaVistaGC('M' + RightStr((Sender as TSpeedButton).Name, 1));
      SalvaCaptionMemoriaGC(Sender);
      DM1.Messaggi('Memorizza vista', 'Memorizzato.', '', [mbOk], 0, nil);
    end else if SbGcVisMemSetPredef.Down then begin
      StopSalvaVistaGCNelleMemorie;
      if DM1.Messaggi('Imposta memoria predefinita', 'Confermi di voler impostare la memoria come predefinita?', '', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
      MemPredef_SaveSelection(Sender as TSpeedButton);
      DM1.Messaggi('Imposta memoria predefinita', 'La memoria scelta è ora la predefinita per questa postazione.', '', [mbOk], 0, nil);
      // Selezione e carica la memoria scelta dall'utente
      RichiamaMemoria((Sender as TSpeedButton), True);
    end else begin
      // Selezione e carica la memoria scelta dall'utente
      RichiamaMemoria((Sender as TSpeedButton), True);
    end;
  finally
    DM1.CloseWait;
  end;
end;


// Procedura che richiama la memoria specificata dall'apposito parametro
//  Il parametro 'OpenQuery' se True lancia anche l'interrogazione
procedure TTabGCForm.RichiamaMemoria(MemButton:TSpeedButton; OpenQuery:Boolean=True);
begin
  try
    // Il pulsante della memoria scelta viene messo Down
    MemButton.Down := True;
    // Chiusura Query
    if QryGC.Active    then QryGC.Close;
    if QryNewGC.Active then QryNewGC.Close;
    // Richiamo vista associata alla memoria
    RipristinaVistaGC('M' + RightStr(MemButton.Name, 1));
    // Interrogazione
    if OpenQuery then ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
  finally
    DM1.CloseWait;
  end;
end;


// Procedura che effettua il salvataggioe upload del file INI contenente i tioli delle
//  memorie del GC
procedure TTabGCForm.SalvaCaptionMemoriaGC(Sender: TObject);
var
  NomeFile, MemoryCaption, CodiceMemoria:String;
  P: TRepositoryIniFile;
  SB:TSpeedButton;
begin
  // Inizializzazione
  SB := (Sender as TSpeedButton);
  MemoryCaption := SB.Caption;
  CodiceMemoria := RightStr(SB.Name, 1);
  // Chiede il nome della memoria
  if InputQuery('Nome Memoria', 'Quale titolo per questa memoria?', MemoryCaption) then begin
    // Controlla che la vista non sia nullo
    if Trim(MemoryCaption) = '' then raise Exception.Create('Titolo non valido.');
  end else begin
    // Se l'utente ha cliccato su Cancel annulla l'operazione
    Exit;
  end;
  // Ricava il nome del file
  //  NB: Se siamo con il giornale di cantiere non selezionato aggiunge
  //       il suffisso 'UNSEL' al nome del file per avere memorie separate nei due casi
  if GC_CantiereSelezionato
    then NomeFile := 'GC_NEW_SEL_MEMORY_CAPT.INI'
    else NomeFile := 'GC_NEW_UNSEL_MEMORY_CAPT.INI';
  // Scarica dal repository il file dei titoli delle memorie
  //  prima di aggiornarlo in modo da essere sicuro di usare una versione la
  //  più aggiornata possibile
  ScaricaMemoryCaptionFile(NomeFile);
  // Salva il titolo della memoria modificata
  P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
  try
    P.WriteString('MemoryCaptions', 'Memory'+CodiceMemoria, MemoryCaption);
    P.UpdateFile;
  finally
    P.Free;
  end;
  // Alla fine ricarica i titoli delle memorie
  CaricaTitoliMemorie;
end;

// procedura che scarica dal repository il file dei titoli delle memorie
//  prima di aggiornarlo
procedure TTabGCForm.ScaricaMemoryCaptionFile(NomeFile:String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('SELECT CONTENUTO FROM REPOSITORY WHERE NOMEFILE = ''' + NomeFile + '''');
    Q.Open;
    if not Q.Eof then Q.FieldByName('CONTENUTO').SaveToFile(DM1.ImpGridsDir + NomeFile);
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TTabGCForm.CaricaTitoliMemorie;
var
  NomeFile:String;
  P: TRepositoryIniFile;
begin
  // Ricava il nome del file
  //  NB: Se siamo con il giornale di cantiere non selezionato aggiunge
  //       il suffisso 'UNSEL' al nome del file per avere memorie separate nei due casi
  if GC_CantiereSelezionato
    then NomeFile := 'GC_NEW_SEL_MEMORY_CAPT.INI'
    else NomeFile := 'GC_NEW_UNSEL_MEMORY_CAPT.INI';
  // Salva il titolo della memoria modificata
  P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
  try
    SbGcVisMem1.Caption  := P.ReadString('MemoryCaptions', 'Memory1', '---');
    SbGcVisMem2.Caption  := P.ReadString('MemoryCaptions', 'Memory2', '---');
    SbGcVisMem3.Caption  := P.ReadString('MemoryCaptions', 'Memory3', '---');
    SbGcVisMem4.Caption  := P.ReadString('MemoryCaptions', 'Memory4', '---');
    SbGcVisMem5.Caption  := P.ReadString('MemoryCaptions', 'Memory5', '---');
    SbGcVisMem6.Caption  := P.ReadString('MemoryCaptions', 'Memory6', '---');
    SbGcVisMem7.Caption  := P.ReadString('MemoryCaptions', 'Memory7', '---');
    SbGcVisMem8.Caption  := P.ReadString('MemoryCaptions', 'Memory8', '---');
    SbGcVisMem9.Caption  := P.ReadString('MemoryCaptions', 'Memory9', '---');
    SbGcVisMem10.Caption := P.ReadString('MemoryCaptions', 'Memory0', '---');
  finally
    P.Free;
  end;
end;


// Disattiva la fase di memorizzazione della vista in una delle memorie
procedure TTabGCForm.StopSalvaVistaGCNelleMemorie;
begin
  TimerAddMemoryGC.Enabled := False;
  SbGcVisMemAdd.Down := False;
  SbGcVisMem1.Font.Size := 7;
  SbGcVisMem2.Font.Size := 7;
  SbGcVisMem3.Font.Size := 7;
  SbGcVisMem4.Font.Size := 7;
  SbGcVisMem5.Font.Size := 7;
  SbGcVisMem6.Font.Size := 7;
  SbGcVisMem7.Font.Size := 7;
  SbGcVisMem8.Font.Size := 7;
  SbGcVisMem9.Font.Size := 7;
  SbGcVisMem10.Font.Size := 7;
  SbGcVisMemAdd.Down := False;
  SbGcVisMemSetPredef.Down := False;
  PanelSelezioneColonne.Update;
end;

procedure TTabGCForm.StartSalvaVistaGCNelleMemorie;
begin
  SbGcVisMem1.Font.Size := 1;
  SbGcVisMem2.Font.Size := 1;
  SbGcVisMem3.Font.Size := 1;
  SbGcVisMem4.Font.Size := 1;
  SbGcVisMem5.Font.Size := 1;
  SbGcVisMem6.Font.Size := 1;
  SbGcVisMem7.Font.Size := 1;
  SbGcVisMem8.Font.Size := 1;
  SbGcVisMem9.Font.Size := 1;
  SbGcVisMem10.Font.Size := 1;
  PanelSelezioneColonne.Update;
  TimerAddMemoryGC.Tag := 0;
  TimerAddMemoryGC.Enabled := True;
end;

// Disattiva la fase di memorizzazione della vista in una delle memorie
procedure TTabGCForm.MemPredef_StopSelection;
begin
  StopSalvaVistaGCNelleMemorie;
end;

procedure TTabGCForm.MemPredef_StartSelection;
begin
  SbGcVisMem1.Font.Size := 1;
  SbGcVisMem2.Font.Size := 1;
  SbGcVisMem3.Font.Size := 1;
  SbGcVisMem4.Font.Size := 1;
  SbGcVisMem5.Font.Size := 1;
  SbGcVisMem6.Font.Size := 1;
  SbGcVisMem7.Font.Size := 1;
  SbGcVisMem8.Font.Size := 1;
  SbGcVisMem9.Font.Size := 1;
  SbGcVisMem10.Font.Size := 1;
  PanelSelezioneColonne.Update;
  TimerAddMemoryGC.Tag := 0;
  TimerAddMemoryGC.Enabled := True;
end;

procedure TTabGCForm.MemPredef_SaveSelection(MemButton:TSpeedButton);
var
  P: TMemIniFile;
begin
  P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
  try
    // Salva nel param.ini (quindi in locale) la memoria predefinita
    //  NB: In base al fatto che siamo dentro ad un cantiere selezionato o meno
    //       usa un nome diverso in modo da avere due possibilità separate.
    if GC_CantiereSelezionato
      then P.WriteString('GC', 'MemoriaPredefinita', RightStr(MemButton.Name, 1))
      else P.WriteString('GC', 'MemoriaPredefinita_Unsel', RightStr(MemButton.Name, 1));
    P.UpdateFile;
    // Imposta la proprietà che determina la memoria predefinita
    GC_MemoriaPredefinita := MemButton;
  finally
    P.Free;
  end;
end;

procedure TTabGCForm.MemPredef_LoadSelection;
var
  P: TMemIniFile;
  MemButtonName, MemNumber: String;
  FoundComponent: TComponent;
begin
  P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
  try
    // Numero della memoria predefinita
    //  NB: Se legge '0' gli aggiunge l'uno davanti per trasformarlo in '10'
    //  NB: In base al fatto che siamo dentro ad un cantiere selezionato o meno
    //       usa un nome diverso in modo da avere due possibilità separate.
    //  NB: Se legge '' lo forza a '1' (è capitato anche se il parametro era vuoto quindi non togliere questa verifica)
    if GC_CantiereSelezionato
      then MemNumber := P.ReadString('GC', 'MemoriaPredefinita', '1')
      Else MemNumber := P.ReadString('GC', 'MemoriaPredefinita_Unsel', '1');
    if Trim(MemNumber) = '' then MemNumber := '1'; 
    if MemNumber = '0' then MemNumber := '10';
    // Costruisce il nome del pulsante di memoria da selezionare come predefinito
    MemButtonName := 'SbGcVisMem' + MemNumber;
    // Cerca il pulsante della memoria da predefinire
    FoundComponent := Self.FindComponent(MemButtonName);
    // Se il componente trovato = nil (non trovato) esce subito
    if FoundComponent = nil then Exit;
    // Imposta il pulsate di memoria trovato come predefinito
    GC_MemoriaPredefinita := TSpeedButton(FoundComponent);
  finally
    P.Free;
  end;
end;



procedure TTabGCForm.RipristinaVistaGC(NomeVista:String);
const
  SEZ = 'SELETTORI';
var
  NomeFile:String;
  P: TRepositoryIniFile;
  AlreadyUpdating: Boolean;
begin
  AlreadyUpdating := GridGC.UpdateLocked;
  if not AlreadyUpdating then GridGC.BeginUpdate;
  try
    // Ricava il nome del file
    //  NB: Se siamo con il giornale di cantiere non selezionato aggiunge
    //       il suffisso 'UNSEL' al nome del file per avere memorie separate nei due casi
    if GC_CantiereSelezionato
      then NomeFile := GridGC.Name + '___NEW___' + NomeVista + '.ini'
      else NomeFile := GridGC.Name + '___NEW_UNSEL___' + NomeVista + '.ini';
    // Salva lo stato dei pulsanti selettori nello stesso file
    P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
    try
      // Caricamento dello stato dei selettori
      CaricaStatoSelettoriGC(P);
      // Effettua la visualizzazione
      VisualizzaColonneGCMaster;
      // Carica le viste
      CaricaVistaBandTableView(GridGC, btvGC, P);
      CaricaVistaBandTableView(GridGC, btvGCRighi, P);
      // Se siamo con il cantiere selezionato la colonna RIFPRATICA deve essere invisibile altrimenti visibile
      //  NB: NOn usa il flag "GC_CantiereSelezionato"
      btvGCRIFPRATICA.Visible       := (ClientiForm.PraticaCorrente = '') and (btvGCRIFPRATICA.GroupIndex = -1);
      btvGCRIFSOGGPRAT.Visible      := btvGCRIFPRATICA.Visible;
      btvGCRighiRIFPRATICA.Visible  := (ClientiForm.PraticaCorrente = '') and (btvGCRighiRIFPRATICA.GroupIndex = -1);
      btvGCRighiRIFSOGGPRAT.Visible := btvGCRighiRIFPRATICA.Visible;
      // Se invece siamo fuori da un cantiere selezionato esegue altre forzature
      //  NB: Qui invece usare il flag "GC_CantiereSelezionato"
      if not GC_CantiereSelezionato then begin
        btvGCCODICEARTICOLO.Visible := False;
        btvGCTIPOLOGIA.Visible      := False;
      end;
    finally
      P.Free;
    end;
  finally
    if not AlreadyUpdating then GridGC.EndUpdate;
  end;
end;

procedure TTabGCForm.SalvaVistaGC(NomeVista:String);
const
  SEZ = 'SELETTORI';
var
  NomeFile:String;
  P: TRepositoryIniFile;
begin
  // Ricava il nome del file
  //  NB: Se siamo con il giornale di cantiere non selezionato aggiunge
  //       il suffisso 'UNSEL' al nome del file per avere memorie separate nei due casi
  if GC_CantiereSelezionato
    then NomeFile := GridGC.Name + '___NEW___' + NomeVista + '.ini'
    else NomeFile := GridGC.Name + '___NEW_UNSEL___' + NomeVista + '.ini';
  // Salva lo stato dei pulsanti selettori nello stesso file
  P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
  try
    SalvaVistaBandTableView(GridGC, btvGC, P);
    SalvaVistaBandTableView(GridGC, btvGCRighi, P);
    SalvaStatoSelettoriGC(P);
    P.UpdateFile;
  finally
    P.Free;
  end;
end;




procedure TTabGCForm.TimerAddMemoryGCTimer(Sender: TObject);
begin
  inherited;
  if SbGcVisMem1.Font.Size = 1 then begin
    SbGcVisMem1.Font.Size := 7;
    SbGcVisMem2.Font.Size := 7;
    SbGcVisMem3.Font.Size := 7;
    SbGcVisMem4.Font.Size := 7;
    SbGcVisMem5.Font.Size := 7;
    SbGcVisMem6.Font.Size := 7;
    SbGcVisMem7.Font.Size := 7;
    SbGcVisMem8.Font.Size := 7;
    SbGcVisMem9.Font.Size := 7;
    SbGcVisMem10.Font.Size := 7;
  end else begin
    SbGcVisMem1.Font.Size := 1;
    SbGcVisMem2.Font.Size := 1;
    SbGcVisMem3.Font.Size := 1;
    SbGcVisMem4.Font.Size := 1;
    SbGcVisMem5.Font.Size := 1;
    SbGcVisMem6.Font.Size := 1;
    SbGcVisMem7.Font.Size := 1;
    SbGcVisMem8.Font.Size := 1;
    SbGcVisMem9.Font.Size := 1;
    SbGcVisMem10.Font.Size := 1;
  end;
  TimerAddMemoryGC.Tag := TimerAddMemoryGC.Tag + 1;
  if TimerAddMemoryGC.Tag = 20 then StopSalvaVistaGCNelleMemorie;
end;

procedure TTabGCForm.SbGcVisMem1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      SbGcVisMem1Click(Sender);
   end;
end;

procedure TTabGCForm.SbGcVisMemAddClick(Sender: TObject);
begin
  inherited;
  if SbGcVisMemAdd.Down then begin
    StartSalvaVistaGCNelleMemorie;
  end else begin
    StopSalvaVistaGCNelleMemorie;
  end;
end;

procedure TTabGCForm.SetDatiSez_Visible_ImportoCosto(
  const Value: Boolean);
begin
  fDatiSez_Visible_ImportoCosto := Value;
  if not Value then SbGcVisImportiAcquisto.Down := False;
  SbGcVisImportiAcquisto.Visible := Value;
end;

procedure TTabGCForm.SetDatiSez_Visible_ImportoVendita(
  const Value: Boolean);
begin
  fDatiSez_Visible_ImportoVendita := Value;
  if not Value then SbGcVisImportiVendita.Down := False;
  SbGcVisImportiVendita.Visible := Value;
end;

procedure TTabGCForm.SetDatiSez_Visible_PrzUnitCosto(
  const Value: Boolean);
begin
  fDatiSez_Visible_PrzUnitCosto := Value;
  if not Value then SbGcVisPrzUnitAcquisto.Down := False;
  SbGcVisPrzUnitAcquisto.Visible := Value;
end;

procedure TTabGCForm.SetDatiSez_Visible_PrzUnitVendita(
  const Value: Boolean);
begin
  fDatiSez_Visible_PrzUnitVendita := Value;
  if not Value then SbGcVisPrzUnitVendita.Down := False;
  SbGcVisPrzUnitVendita.Visible := Value;
end;

procedure TTabGCForm.SetDatiSez_Visible_Qta(const Value: Boolean);
begin
  fDatiSez_Visible_Qta := Value;
  if not Value then SbGcVisQta.Down := False;
  SbGcVisQta.Visible := Value;
end;

procedure TTabGCForm.SetGC_Col_Visible_TipologiaArticolo(
  const Value: Boolean);
begin
  fGC_Col_Visible_TipologiaArticolo := Value;
  if not Value then begin
    btvGCTIPOLOGIA.GroupIndex := -1;
    btvGCTIPOLOGIA.SortOrder := soNone;
  end;
  btvGCTIPOLOGIA.Visible := False;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CodiceArticolo(
  const Value: Boolean);
begin
  fGC_Filter_Visible_CodiceArticolo := Value;
  GCLab_CodiceArticolo.Visible := Value;
  GCCodiceArticolo.Visible := Value;
  SpeedButtonRollOver14.Visible := False;
end;

procedure TTabGCForm.SetGC_Filter_Visible_DescrizioneArticolo(
  const Value: Boolean);
begin
  fGC_Filter_Visible_DescrizioneArticolo := Value;
  GCLab_DescrizioneArticolo.Visible := Value;
  GCDescrizione.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_Gruppi(const Value: Boolean);
begin
  fGC_Filter_Visible_Gruppi := Value;
  GCGruppiTitolo.Visible := Value;
  GCLab_Gruppo1.Visible := Value;
  GCLab_Gruppo2.Visible := Value;
  GCLab_Gruppo3.Visible := Value;
  GCLab_Gruppo4.Visible := Value;
  GCLab_Gruppo5.Visible := Value;
  GCLab_Gruppo6.Visible := Value;
  GCCodiceGruppo1.Visible := Value;
  GCCodiceGruppo2.Visible := Value;
  GCCodiceGruppo3.Visible := Value;
  GCCodiceGruppo4.Visible := Value;
  GCCodiceGruppo5.Visible := Value;
  GCCodiceGruppo6.Visible := Value;
  GCBitBtnGruppo1.Visible := Value;
  GCBitBtnGruppo2.Visible := Value;
  GCBitBtnGruppo3.Visible := Value;
  GCBitBtnGruppo4.Visible := Value;
  GCBitBtnGruppo5.Visible := Value;
  GCBitBtnGruppo6.Visible := Value;
  GCDescGruppo1.Visible := Value;
  GCDescGruppo2.Visible := Value;
  GCDescGruppo3.Visible := Value;
  GCDescGruppo4.Visible := Value;
  GCDescGruppo5.Visible := Value;
  GCDescGruppo6.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_Stato(const Value: Boolean);
begin
  fGC_Filter_Visible_Stato := Value;
  GCLab_Stato.Visible := Value;
  GCSoloStato.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_Tipologia(
  const Value: Boolean);
begin
  fGC_Filter_Visible_Tipologia := Value;
  GCLab_Tipo.Visible := Value;
  GCTipo.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_TipoMovimento(
  const Value: Boolean);
begin
  fGC_Filter_Visible_TipoMovimento := Value;
  GCLab_TipoMovimento.Visible := Value;
  GCCheckListBoxSegnoOperazione.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_Marca(const Value: Boolean);
begin
  fGC_Filter_Visible_Marca := Value;
  GCLab_Marca.Visible := Value;
  GCMarca.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CantieriApertiChiusi(
  const Value: Boolean);
begin
  fGC_Filter_Visible_CantieriApertiChiusi := Value;
  GCCantieriApertiChiusi.Visible := Value;
  GCLab_CantieriApertiChiusi.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_Sottocantiere1(
  const Value: Boolean);
begin
  fGC_Filter_Visible_Sottocantiere1 := Value;
  GCSottocantiere1.Visible := Value;
  GCLabelSottocantiere1.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_Sottocantiere2(
  const Value: Boolean);
begin
  fGC_Filter_Visible_Sottocantiere2 := Value;
  GCSottocantiere2.Visible := Value;
  GCLabelSottocantiere2.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_Sottocantiere3(
  const Value: Boolean);
begin
  fGC_Filter_Visible_Sottocantiere3 := Value;
  GCSottocantiere3.Visible := Value;
  GCLabelSottocantiere3.Visible := Value;
end;




procedure TTabGCForm.SetGC_Tariffe_Enabled(const Value: Boolean);
begin
  fGC_Tariffe_Enabled                           := Value;

  GcVisTipoRicarico.Enabled                     := Value;
  GcVisTipoCosto.Enabled                        := Value;
  GcVisRicaricoPerc.Enabled                     := Value;
  GcVisListino.Enabled                          := Value;
  GcVisPrezzoManodopera1.Enabled                := Value;
  GcVisPrezzoManodopera2.Enabled                := Value;
  GcVisPrezzoManodopera3.Enabled                := Value;
  GcVisPrezzoManodopera4.Enabled                := Value;
  GcVisPrezzoManodopera5.Enabled                := Value;
  GcVisCostoManodopera1.Enabled                 := Value;
  GcVisCostoManodopera2.Enabled                 := Value;
  GcVisCostoManodopera3.Enabled                 := Value;
  GcVisCostoManodopera4.Enabled                 := Value;
  GcVisCostoManodopera5.Enabled                 := Value;
  GCVisTipoRicaricoComeDaCommessa.Enabled       := Value;
  GCVisAccorpaManodoperaInBacheca.Enabled       := Value;
  if Value then GCVisLabelTipoRicaricoComeDaCommessa.Font.Color := $000063C6 else GCVisLabelTipoRicaricoComeDaCommessa.Font.Color := clBtnShadow;
end;

procedure TTabGCForm.SetSez_Visible_Commessa(const Value: Boolean);
begin
  fSez_Visible_Commessa := Value;
  if not Value then SbGcVisCommessa.Down := False;
  SbGcVisCommessa.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Documenti(const Value: Boolean);
begin
  fSez_Visible_Documenti := Value;
  if not Value then SbGcVisDocumenti.Down := False;
  SbGcVisDocumenti.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Tracking(const Value: Boolean);
begin
  fSez_Visible_Tracking := Value;
  if not Value then SbGcVisTrack.Down := False;
  SbGcVisTrack.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Fatturato(const Value: Boolean);
begin
  fSez_Visible_Fatturato := Value;
  if not Value then SbGcVisFatturato.Down := False;
  SbGcVisFatturato.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Giacenza(const Value: Boolean);
begin
  fSez_Visible_Giacenza := Value;
  if not Value then SbGcVisGiacenza.Down := False;
  SbGcVisGiacenza.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Gruppi(const Value: Boolean);
begin
  fSez_Visible_Gruppi := Value;
  if not Value then SbGcVisGruppi.Down := False;
  SbGcVisGruppi.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Magazzino(const Value: Boolean);
begin
  fSez_Visible_Magazzino := Value;
  if not Value then SbGcVisMagazzino.Down := False;
  SbGcVisMagazzino.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Montato(const Value: Boolean);
begin
  fSez_Visible_Montato := Value;
  if not Value then SbGcVisMontato.Down := False;
  SbGcVisMontato.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_Sottocantieri(const Value: Boolean);
begin
  fSez_Visible_Sottocantieri := Value;
  if not Value then SbGcVisSottocantieri.Down := False;
  SbGcVisSottocantieri.Visible := Value;
end;

procedure TTabGCForm.SetTipoVis_Visible_CronologicoGiorno(
  const Value: Boolean);
begin
  fTipoVis_Visible_CronologicoGiorno := Value;
  if not Value then SbGcVisCronologicoGiorno.Down := False;
  SbGcVisCronologicoGiorno.Visible := Value;
end;

procedure TTabGCForm.SetTipoVis_Visible_CronologicoMese(
  const Value: Boolean);
begin
  fTipoVis_Visible_CronologicoMese := Value;
  if not Value then SbGcVisCronologicoMese.Down := False;
  SbGcVisCronologicoMese.Visible := Value;
end;

procedure TTabGCForm.SetTipoVis_Visible_PerArticolo(
  const Value: Boolean);
begin
  fTipoVis_Visible_PerArticolo := Value;
  if not Value then SbGcVisPerArticolo.Down := False;
  SbGcVisPerArticolo.Visible := Value;
end;

procedure TTabGCForm.ShowGCChart;
var
  LMontato: String;
begin
  // Carica alcune caption base relative al montato
  LMontato := SbGcVisMontato.Caption;
  // Se il frame del grafico era già esistente lo distrugge e in ogni caso ne crea uno nuovo
  if Assigned(FChartFrame) then
    FChartFrame.Free;
  FChartFrame := TChartFrame.Create(TabGCCharts, btvGC, SourceGC);
  // Carica i valori nel grafico
  FChartFrame.BeginUpdate;
  try
    FChartFrame.SetReportTitle('Giornale di Cantiere');

    FChartFrame.SetCategories(btvGCDESCRIZIONE, 'Descrizione');

    FChartFrame.AddSerieIfVisible(btvGCCOMMESSA_QTA, 'Preventivo qtà');
    FChartFrame.AddSerieIfVisible(btvGCCOMMESSA_IMPORTOACQ, 'Preventivo costo');
    FChartFrame.AddSerieIfVisible(btvGCCOMMESSA_GUADAGNOIMPORTO, 'Preventivo margine');
    FChartFrame.AddSerieIfVisible(btvGCCOMMESSA_IMPORTOVEND, 'Preventivo vendita');

    FChartFrame.AddSerieIfVisible(btvGCGIACENZA_QTA, 'Consuntivo qtà');
    FChartFrame.AddSerieIfVisible(btvGCGIACENZA_IMPORTOACQ, 'Consuntivo costo');
    FChartFrame.AddSerieIfVisible(btvGCGIACENZA_GUADAGNOIMPORTO, 'Consuntivo margine');
    FChartFrame.AddSerieIfVisible(btvGCGIACENZA_IMPORTOVEND, 'Consuntivo vendita');

    FChartFrame.AddSerieIfVisible(btvGCMONTATO_QTA, Format('%s qtà', [LMontato]));
    FChartFrame.AddSerieIfVisible(btvGCMONTATO_IMPORTOACQ, Format('%s costo', [LMontato]));
    FChartFrame.AddSerieIfVisible(btvGCMONTATO_GUADAGNOIMPORTO, Format('%s margine', [LMontato]));
    FChartFrame.AddSerieIfVisible(btvGCMONTATO_IMPORTOVEND, Format('%s vendita', [LMontato]));

    FChartFrame.AddSerieIfVisible(btvGCDAMONT_COMMESSA_IMPORTOVEND, SbGcVisDaMontareCommessa.Caption);
    FChartFrame.AddSerieIfVisible(btvGCDAMONT_GIACENZA_IMPORTOVEND, SbGcVisDaMontareGiacenza.Caption);

    FChartFrame.AddSerieIfVisible(btvGCFATTURATO_IMPORTOVEND, 'Fatturato vendita');

    FChartFrame.AddSerieIfVisible(btvGCDAFATT_COMMESSA_IMPORTOVEND, 'Da fatturare > Preventivo');
    FChartFrame.AddSerieIfVisible(btvGCDAFATT_GIACENZA_IMPORTOVEND, 'Da fatturare > Consuntivo');
    FChartFrame.AddSerieIfVisible(btvGCDAFATT_MONTATO_IMPORTOVEND, Format('Da fatturare > %s', [LMontato]));

    FChartFrame.AddSerieIfVisible(btvGCRIEP_QTA, 'Variazione qtà');
    FChartFrame.AddSerieIfVisible(btvGCRIEP_COSTI, 'Variazione costo');
    FChartFrame.AddSerieIfVisible(btvGCRIEP_MARGINE_COMMESSA, 'Margine eff. > Commessa');
    FChartFrame.AddSerieIfVisible(btvGCRIEP_MARGINE_FATTURATO, 'Margine eff. > Fatturato');
    FChartFrame.AddSerieIfVisible(btvGCRIEP_MARGINE_MONTATO, Format('Margine eff. > %s', [LMontato]));
  finally
    FChartFrame.EndUpdate;
  end;
end;

procedure TTabGCForm.ShowGCRighiChart;
begin
  if Assigned(FChartFrame) then
    FChartFrame.Free;
  FChartFrame := TChartFrame.Create(TabGCCharts, btvGCRighi, SourceNewGC);
  FChartFrame.BeginUpdate;
  try
    FChartFrame.SetReportTitle('Giornale di Cantiere (cronologico)');

    FChartFrame.SetCategories(btvGCRighiDESCRIZIONE, 'Descrizione');
    FChartFrame.AddSerieIfVisible(btvGCRighiGC_QTA, 'Quantità');
    FChartFrame.AddSerieIfVisible(btvGCRighiGC_COSTONETTOIMPORTO, 'Costo');
    FChartFrame.AddSerieIfVisible(btvGCRighiGC_GUADAGNOIMPORTO, 'Margine');
    FChartFrame.AddSerieIfVisible(btvGCRighiGC_PRZVENDIMPORTO, 'Vendita');
  finally
    FChartFrame.EndUpdate;
  end;
end;

procedure TTabGCForm.SBGCFilterOpenCloseClick(Sender: TObject);
begin
  inherited;
  if PanelGCFiltri.Tag = 1
  then CloseFilterPanel(PanelGCFiltri, SBGCFilterOpenClose)
  else OpenFilterPanel(PanelGCFiltri, SBGCFilterOpenClose);
end;

procedure TTabGCForm.FilterGCTrovaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then ClientiForm.RxSpeedButtonTrovaClick(Self);
end;

procedure TTabGCForm.GCSoloStatoPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DESCRIZIONE FROM STATI');

      // Se siamo da fuori cantiere selezionato visualizza solo gli
      //  stati relativi a cantieri
      if not GC_CantiereSelezionato then Qry.SQL.Add('WHERE TIPODOCUMENTO = ''Cantieri/Pratiche''');

      Qry.Open;
      (Sender as TcxComboBox).Properties.Items.Clear;
      while not Qry.Eof do begin
         (Sender as TcxComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTabGCForm.GCTipoClickCheck(Sender: TObject);
begin
  inherited;
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TTabGCForm.GCTipoExit(Sender: TObject);
begin
  inherited;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

procedure TTabGCForm.GCTipoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   CheckIndex, i:Integer;
   CurrCheckListBox:TCheckListBox;
begin
   // ----------------------------------------------------------------------------------------------------
   // Questo codice server per fare in modo che anche se l'utente clicca sul titolo della voce, questa
   //  venga selezinata o deselezionata come se si fosse cliccato sul riquadrino del segno di check)
   // ----------------------------------------------------------------------------------------------------
   // La variabie CurrCheckListBox Punta alla CheckListBox che ha richiamata l'evento
   CurrCheckListBox := Sender as TCheckListBox;
   // Solo se sè cliccato con il pulsante SX del mouse
   if Button = mbLeft then begin
      // Quale voce si trova sotto il mouse?
      CheckIndex := CurrCheckListBox.ItemAtPos(Point(X,Y), True);
      // Se c'era una voce cambia il suo stato
      if CheckIndex <> -1 then begin
         if CurrCheckListBox.Tag = 0 then CurrCheckListBox.Checked[CheckIndex] := not CurrCheckListBox.Checked[CheckIndex];
         // Rimette la Proprietà Tag del componente = 0
         CurrCheckListBox.Tag := 0;
      end;
   // Se invece è stato premuto il pulsante DX7
   end else if Button = mbRight then begin
      // Quale voce si trova sotto il mouse?
      CheckIndex := CurrCheckListBox.ItemAtPos(Point(X,Y), True);
      // Se c'era una voce cambia il suo stato
      if CheckIndex <> -1 then begin
         if CurrCheckListBox.Tag = 0 then CurrCheckListBox.Checked[CheckIndex] := not CurrCheckListBox.Checked[CheckIndex];
         // Rimette la Proprietà Tag del componente = 0
         CurrCheckListBox.Tag := 0;
      end;
      // Esegue la ricerca
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CurrCheckListBox.ItemIndex := -1;
end;

procedure TTabGCForm.GCVisAccorpaManodoperaInBachecaPropertiesChange(Sender: TObject);
begin
  inherited;
  FBachecaAccorpaManodopera := GCVisAccorpaManodoperaInBacheca.Checked;
end;

procedure TTabGCForm.GCBitBtnGruppo1Click(Sender: TObject);
begin
  inherited;
      DM1.Attendere;
      try
        // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
        Application.CreateForm(TGruppiForm, GruppiForm);
        GruppiForm.Parent := MainForm;
        GruppiForm.Tag := 993;   // Abilita la selezione
        GruppiForm.LivelloAttivo := 1;
        GruppiForm.Show;
      finally
        DM1.ChiudiAttendere;
      end;
end;

procedure TTabGCForm.GCBitBtnGruppo2Click(Sender: TObject);
begin
  inherited;
      DM1.Attendere;
      try
        // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
        Application.CreateForm(TGruppiForm, GruppiForm);
        GruppiForm.Parent := MainForm;
        GruppiForm.Tag := 993;   // Abilita la selezione
        GruppiForm.Selezionato1  := StrToInt(GCCodiceGruppo1.Text);
        GruppiForm.LivelloAttivo := 2;
        GruppiForm.Show;
      finally
        DM1.ChiudiAttendere;
      end;
end;

procedure TTabGCForm.GCBitBtnGruppo3Click(Sender: TObject);
begin
  inherited;
      DM1.Attendere;
      try
        // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
        Application.CreateForm(TGruppiForm, GruppiForm);
        GruppiForm.Parent := MainForm;
        GruppiForm.Tag := 993;   // Abilita la selezione
        GruppiForm.Selezionato1  := StrToInt(GCCodiceGruppo1.Text);
        GruppiForm.Selezionato2  := StrToInt(GCCodiceGruppo2.Text);
        GruppiForm.LivelloAttivo := 3;
        GruppiForm.Show;
      finally
        DM1.ChiudiAttendere;
      end;
end;

procedure TTabGCForm.GCBitBtnGruppo4Click(Sender: TObject);
begin
  inherited;
      DM1.Attendere;
      try
        // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
        Application.CreateForm(TGruppiForm, GruppiForm);
        GruppiForm.Parent := MainForm;
        GruppiForm.Tag := 993;   // Abilita la selezione
        GruppiForm.Selezionato1  := StrToInt(GCCodiceGruppo1.Text);
        GruppiForm.Selezionato2  := StrToInt(GCCodiceGruppo2.Text);
        GruppiForm.Selezionato3  := StrToInt(GCCodiceGruppo3.Text);
        GruppiForm.LivelloAttivo := 4;
        GruppiForm.Show;
      finally
        DM1.ChiudiAttendere;
      end;
end;

procedure TTabGCForm.GCBitBtnGruppo5Click(Sender: TObject);
begin
  inherited;
      DM1.Attendere;
      try
        // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
        Application.CreateForm(TGruppiForm, GruppiForm);
        GruppiForm.Parent := MainForm;
        GruppiForm.Tag := 993;   // Abilita la selezione
        GruppiForm.Selezionato1  := StrToInt(GCCodiceGruppo1.Text);
        GruppiForm.Selezionato2  := StrToInt(GCCodiceGruppo2.Text);
        GruppiForm.Selezionato3  := StrToInt(GCCodiceGruppo3.Text);
        GruppiForm.Selezionato4  := StrToInt(GCCodiceGruppo4.Text);
        GruppiForm.LivelloAttivo := 5;
        GruppiForm.Show;
      finally
        DM1.ChiudiAttendere;
      end;
end;

procedure TTabGCForm.GCBitBtnGruppo6Click(Sender: TObject);
begin
  inherited;
      DM1.Attendere;
      try
        // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
        Application.CreateForm(TGruppiForm, GruppiForm);
        GruppiForm.Parent := MainForm;
        GruppiForm.Tag := 993;   // Abilita la selezione
        GruppiForm.Selezionato1  := StrToInt(GCCodiceGruppo1.Text);
        GruppiForm.Selezionato2  := StrToInt(GCCodiceGruppo2.Text);
        GruppiForm.Selezionato3  := StrToInt(GCCodiceGruppo3.Text);
        GruppiForm.Selezionato4  := StrToInt(GCCodiceGruppo4.Text);
        GruppiForm.Selezionato5  := StrToInt(GCCodiceGruppo5.Text);
        GruppiForm.LivelloAttivo := 6;
        GruppiForm.Show;
      finally
        DM1.ChiudiAttendere;
      end;
end;

procedure TTabGCForm.GCCodiceGruppo1Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(GCCodiceGruppo1.Text) = '' then begin
      GCCodiceGruppo2.Text  := '';
      GCDescGruppo2.Text    := '';
      GCCodiceGruppo2.Color := GCGruppiTitolo.Color;
      GCDescGruppo2.Color   := GCGruppiTitolo.Color;
      GCCodiceGruppo2.TabStop := False;
      GCBitBtnGruppo2.Enabled := False;
   end else begin
      GCCodiceGruppo2.Color := GCCodiceGruppo1.Color;
      GCDescGruppo2.Color   := GCCodiceGruppo1.Color;
      GCCodiceGruppo2.TabStop := True;
      GCBitBtnGruppo2.Enabled := True;
   end;
end;

procedure TTabGCForm.GCCodiceGruppo2Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(GCCodiceGruppo2.Text) = '' then begin
      GCCodiceGruppo3.Text  := '';
      GCDescGruppo3.Text    := '';
      GCCodiceGruppo3.Color := GCGruppiTitolo.Color;
      GCDescGruppo3.Color   := GCGruppiTitolo.Color;
      GCCodiceGruppo3.TabStop := False;
      GCBitBtnGruppo3.Enabled := False;
   end else begin
      GCCodiceGruppo3.Color := GCCodiceGruppo1.Color;
      GCDescGruppo3.Color   := GCCodiceGruppo1.Color;
      GCCodiceGruppo3.TabStop := True;
      GCBitBtnGruppo3.Enabled := True;
   end;
end;

procedure TTabGCForm.GCCodiceGruppo3Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(GCCodiceGruppo3.Text) = '' then begin
      GCCodiceGruppo4.Text  := '';
      GCDescGruppo4.Text    := '';
      GCCodiceGruppo4.Color := GCGruppiTitolo.Color;
      GCDescGruppo4.Color   := GCGruppiTitolo.Color;
      GCCodiceGruppo4.TabStop := False;
      GCBitBtnGruppo4.Enabled := False;
   end else begin
      GCCodiceGruppo4.Color := GCCodiceGruppo1.Color;
      GCDescGruppo4.Color   := GCCodiceGruppo1.Color;
      GCCodiceGruppo4.TabStop := True;
      GCBitBtnGruppo4.Enabled := True;
   end;
end;

procedure TTabGCForm.GCCodiceGruppo4Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(GCCodiceGruppo4.Text) = '' then begin
      GCCodiceGruppo5.Text  := '';
      GCDescGruppo5.Text    := '';
      GCCodiceGruppo5.Color := GCGruppiTitolo.Color;
      GCDescGruppo5.Color   := GCGruppiTitolo.Color;
      GCCodiceGruppo5.TabStop := False;
      GCBitBtnGruppo5.Enabled := False;
   end else begin
      GCCodiceGruppo5.Color := GCCodiceGruppo1.Color;
      GCDescGruppo5.Color   := GCCodiceGruppo1.Color;
      GCCodiceGruppo5.TabStop := True;
      GCBitBtnGruppo5.Enabled := True;
   end;
end;

procedure TTabGCForm.GCCodiceGruppo5Change(Sender: TObject);
begin
  inherited;
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(GCCodiceGruppo5.Text) = '' then begin
      GCCodiceGruppo6.Text  := '';
      GCDescGruppo6.Text    := '';
      GCCodiceGruppo6.Color := GCGruppiTitolo.Color;
      GCDescGruppo6.Color   := GCGruppiTitolo.Color;
      GCCodiceGruppo6.TabStop := False;
      GCBitBtnGruppo6.Enabled := False;
   end else begin
      GCCodiceGruppo6.Color := GCCodiceGruppo1.Color;
      GCDescGruppo6.Color   := GCCodiceGruppo1.Color;
      GCCodiceGruppo6.TabStop := True;
      GCBitBtnGruppo6.Enabled := True;
   end;
end;

procedure TTabGCForm.GCMesiTuttiClick(Sender: TObject);
begin
   GCDal.EditText := DM1.FilterDataDalDefault;
   GCAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if ImpMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      GCGen.GroupIndex := 1101;
      GCFeb.GroupIndex := 1102;
      GCMar.GroupIndex := 1103;
      GCApr.GroupIndex := 1104;
      GCMag.GroupIndex := 1105;
      GCGiu.GroupIndex := 1106;
      GCLug.GroupIndex := 1107;
      GCAgo.GroupIndex := 1108;
      GCSet.GroupIndex := 1109;
      GCOtt.GroupIndex := 1110;
      GCNov.GroupIndex := 1111;
      GCDic.GroupIndex := 1112;
      GCGen.Down   := False;
      GCFeb.Down   := False;
      GCMar.Down   := False;
      GCApr.Down   := False;
      GCMag.Down   := False;
      GCGiu.Down   := False;
      GCLug.Down   := False;
      GCAgo.Down   := False;
      GCSet.Down   := False;
      GCOtt.Down   := False;
      GCNov.Down   := False;
      GCDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      GCMesiTutti.Tag := 0;
//   end;
end;

procedure TTabGCForm.GCMesiTuttiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      GCMesiTuttiClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabGCForm.GCMesiNessunoClick(Sender: TObject);
begin
  inherited;
   GCDal.Clear;
   GCAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   GCGen.GroupIndex := 600;
   GCFeb.GroupIndex := 600;
   GCMar.GroupIndex := 600;
   GCApr.GroupIndex := 600;
   GCMag.GroupIndex := 600;
   GCGiu.GroupIndex := 600;
   GCLug.GroupIndex := 600;
   GCAgo.GroupIndex := 600;
   GCSet.GroupIndex := 600;
   GCOtt.GroupIndex := 600;
   GCNov.GroupIndex := 600;
   GCDic.GroupIndex := 600;
   GCGen.Down   := False;
   GCFeb.Down   := False;
   GCMar.Down   := False;
   GCApr.Down   := False;
   GCMag.Down   := False;
   GCGiu.Down   := False;
   GCLug.Down   := False;
   GCAgo.Down   := False;
   GCSet.Down   := False;
   GCOtt.Down   := False;
   GCNov.Down   := False;
   GCDic.Down   := False;
end;

procedure TTabGCForm.GCMesiNessunoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      GCMesiNessunoClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabGCForm.GCGenClick(Sender: TObject);
var
   GG, MM, AA: Word;
   Mese:Shortint;
begin
   // Mese contiene l'indice del mese premuto
   Mese := (Sender as TSpeedButton).Tag;
   // AA COntiene l'anno in corso
   DecodeDate(Date, AA, MM, GG);
   // Se il GroupIndex è <> 600 significa che è stato premuto il
   //  tasto di selezione di tutti i mesi e quindi si comporta di conseguenza
   if (Sender as TSpeedButton).GroupIndex <> 600 then begin
      GCMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            GCDal.EditText := ' 01/01/' + IntToStr(AA);
            GCAl.EditText  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            GCDal.EditText := ' 01/02/' + IntToStr(AA);
            GCAl.EditText  := ' 28/02/' + IntToStr(AA);
         end;
         3:begin
            GCDal.EditText := ' 01/03/' + IntToStr(AA);
            GCAl.EditText  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            GCDal.EditText := ' 01/04/' + IntToStr(AA);
            GCAl.EditText  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            GCDal.EditText := ' 01/05/' + IntToStr(AA);
            GCAl.EditText  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            GCDal.EditText := ' 01/06/' + IntToStr(AA);
            GCAl.EditText  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            GCDal.EditText := ' 01/07/' + IntToStr(AA);
            GCAl.EditText  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            GCDal.EditText := ' 01/08/' + IntToStr(AA);
            GCAl.EditText  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            GCDal.EditText := ' 01/09/' + IntToStr(AA);
            GCAl.EditText  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            GCDal.EditText := ' 01/10/' + IntToStr(AA);
            GCAl.EditText  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            GCDal.EditText := ' 01/11/' + IntToStr(AA);
            GCAl.EditText  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            GCDal.EditText := ' 01/12/' + IntToStr(AA);
            GCAl.EditText  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      GCDal.Text := '';
      GCAl.Text  := '';
   end;
end;

procedure TTabGCForm.GCGenMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      GCGenClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabGCForm.PanelGCFiltriResize(Sender: TObject);
begin
  inherited;
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TTabGCForm.SBGCExpandClick(Sender: TObject);
begin
  inherited;
  // Se siamo nella visualizzazione nuova di dettaglio sui righi...
  if GridGC.ActiveView = btvGCRighi then begin
    DM1.ShowWait('Levante', 'Espansione in corso...');
    try
      btvGCRighi.ViewData.Expand(True);
    finally
      DM1.CloseWait;
    end;
  // Altrimenti se siamo in una visualizzazione riepilogata (vecchia)...
  end else begin
    GridGC.BeginUpdate;
    DM1.ShowWait('Levante', 'Espansione in corso...');
    try
      QryNewGC.Close;
      btvGC.ViewData.Collapse(True);
      btvGC.ViewData.Expand(True);
      // Apre la tabella dei dettagli dei righi
      //  NB: Solo se siamo in un cantiere selezionato
      if GC_CantiereSelezionato then QryNewGC.Open;
    finally
      GridGC.EndUpdate;
      DM1.CloseWait;
    end;
  end;
end;

procedure TTabGCForm.SBGCCollapseClick(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Chiusura dettagli in corso...');
  try
    (GridGC.ActiveView as TcxGridDBBandedTableView).ViewData.Collapse(True);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.ApriDocumento(var DocType, Registro: String;
  var DocNum: Integer; var DocDate: TDate);
var
  ClientPoint, ScreenPoint: TPoint;
begin
  // Se l'utente ha i permessi
  if (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) then begin
   // Visualizza il menù
   // Esegue la conversione delle coordinate dove dovrà apparire il menù
   //  da coordinate client della finestra a coordinate assolute dello schermo.
   //  (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
   ClientPoint.X := ClientiForm.RxSpeedButtonVisualizza.Left + POPUP_X_OFFSET + ClientiForm.ClientTopPanel.Left;
   ClientPoint.Y := ClientiForm.RxSpeedButtonVisualizza.Top + POPUP_Y_OFFSET;
   ScreenPoint   := ClientiForm.ClientToScreen(ClientPoint);
   OpenDocMenu.Popup(ScreenPoint.X, ScreenPoint.Y);
  end;
end;

procedure TTabGCForm.Raggruppadatapergiornosolovistacronologica1Click(Sender: TObject);
begin
  inherited;
  if Raggruppadatapergiornosolovistacronologica1.Checked then
    btvGCRighiGC_DATADOCUMENTO.DateTimeGrouping := dtgByDate
  else
    btvGCRighiGC_DATADOCUMENTO.DateTimeGrouping := dtgByMonth;
end;

procedure TTabGCForm.ResetQueryButtonClick(Sender: TObject);
begin
  inherited;
      FilterGCTrova.Text := '';
      GCSoloStato.Text := '';
      GCCodiceArticolo.Text := '';
      GCTipo.Checked[0]           := True;
      GCTipo.Checked[1]           := True;
      GCTipo.Checked[2]           := True;
      GCCantieriApertiChiusi.Checked[0]        := True;
      GCCantieriApertiChiusi.Checked[1]        := False;
      GCCheckListBoxSegnoOperazione.Checked[0] := True;
      GCCheckListBoxSegnoOperazione.Checked[1] := True;
      GCCheckListBoxSegnoOperazione.Checked[2] := True;
      GCCheckListBoxSegnoOperazione.Checked[3] := True;
      GCCheckListBoxSegnoOperazione.Checked[4] := True;
      GCCodiceGruppo1.Text        := '';
      GCCodiceGruppo2.Text        := '';
      GCCodiceGruppo3.Text        := '';
      GCCodiceGruppo4.Text        := '';
      GCCodiceGruppo5.Text        := '';
      GCCodiceGruppo6.Text        := '';
      GCDescGruppo1.Text          := '';
      GCDescGruppo2.Text          := '';
      GCDescGruppo3.Text          := '';
      GCDescGruppo4.Text          := '';
      GCDescGruppo5.Text          := '';
      GCDescGruppo6.Text          := '';
      GCDal.Text                  := '';
      GCAl.Text                   := '';
      GCAgente.Text               := '';
      GCAgente2.Text              := '';
      GCAgente3.Text              := '';
      GCAgente4.Text              := '';
      GCTipo1.Text                := '';
      GCTipo2.Text                := '';
      GCTipo3.Text                := '';
      GCTipo4.Text                := '';
      GCTipo5.Text                := '';
      GCTipo6.Text                := '';
      GCSottocantiere1.Text       := '';
      GCSottocantiere2.Text       := '';
      GCSottocantiere3.Text       := '';
      GCCategCant1.Text           := '';
      GCCategCant2.Text           := '';
      GCCategCant3.Text           := '';
      GCCategCant4.Text           := '';
      GCCategCant5.Text           := '';
      GCCategCant6.Text           := '';
      GCRDA.Text                  := '';
      // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
      //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
      //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
      //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
      GCMesiTutti.Tag := 1;
      GCMesiNessunoClick(GCMesiNessuno);
      GCAltroDate.Checked[0] := True;
      // Seleziona solo i documenti dell'anno in corso se non si è dentro
      //  un cantiere altrimenti li visualizza senza limiti di date
      if ClientiForm.PraticaCorrente = '' then GCMesiTuttiClick(Self);
      // Azzera la query
      if ClientiForm.RxSpeedButtonResetQuery.Tag = 1 then QryGC.Close;
end;

procedure TTabGCForm.TrovaButtonClick(Sender: TObject);
begin
  inherited;
  try
    // Avvia l'esecuzione dell'interrogazione
    EseguiQueryGC;
  finally
    // Se l'utente ha i permessi necessari e non ci sono stati errori abilita il
    //  pulsante di MODIFICA in modo che sia attivo solo se la query è aperta.
    //  E solo se siamo in un cantiere selezionato
    ClientiForm.RxSpeedModifica.Enabled := (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 1) and (QryNewGC.Active) and (ClientiForm.PraticaCorrente <> '');
  end;
end;







procedure TTabGCForm.EseguiQueryGCNew;
var
  Cronologica: Boolean;
begin
  // Inizializzazione
  Cronologica := SbGcVisCronologicoGiorno.Down or SbGcVisCronologicoMese.Down;
  btvGCRighi.OptionsView.ExpandButtonsForEmptyDetails := False;

  // ===========================================================================
  // IMPOSTAZIONE QUERY PER I RIGHI DEI DOCUMENTI DA VISUALIZZARE NELLA NUOVA VERSIONE DEL GC
  // ---------------------------------------------------------------------------
  if QryNewGC.Active then QryNewGC.Close;
  QryNewGC.SQL.Clear;

  QryNewGC.SQL.Add('SELECT');

  // ---------- INIZIO CAMPI CAMPI COINVOLTI NELL'ORDINAMENTO ------------------
  // Se è attia la visualizzazione cronologica ritorna anche tutti i righi raggruppati per
  //  data documento altrimenti no
  if Cronologica
  then QryNewGC.SQL.Add(' V.DATADOCUMENTO AS GRP_DATADOCUMENTO')
  else QryNewGC.SQL.Add(' CAST(NULL AS DATE) AS GRP_DATADOCUMENTO');

  // Codice articolo reale
  QryNewGC.SQL.Add(' ,V.CODICEARTICOLO AS CODICEARTICOLOREALE');

  // Se le colonne relative ai sottogruppi sono in raggruppamento...
  //  NB: Questi campi che contengono il valore 'TUTTI' in quei campi che non sono oggetto i raggruppamento sono
  //       utilizzati solo per la relazione Master-Detail con il rigo principale e NON per la visualizzazione.
  if btvGCSOTTOCANTIERE1.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.SOTTOCANTIERE1 AS GRP_SOTTOCANTIERE1') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_SOTTOCANTIERE1');
  if btvGCSOTTOCANTIERE2.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.SOTTOCANTIERE2 AS GRP_SOTTOCANTIERE2') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_SOTTOCANTIERE2');
  if btvGCSOTTOCANTIERE3.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.SOTTOCANTIERE3 AS GRP_SOTTOCANTIERE3') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_SOTTOCANTIERE3');
  if btvGCTIPO1.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.TIPO1 AS GRP_TIPO1') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_TIPO1');
  if btvGCTIPO2.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.TIPO2 AS GRP_TIPO2') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_TIPO2');
  if btvGCTIPO3.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.TIPO3 AS GRP_TIPO3') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_TIPO3');
  if btvGCTIPO4.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.TIPO4 AS GRP_TIPO4') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_TIPO4');
  if btvGCTIPO5.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.TIPO5 AS GRP_TIPO5') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_TIPO5');
  if btvGCTIPO6.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.TIPO6 AS GRP_TIPO6') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS GRP_TIPO6');
  if btvGCAGENTE1.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.AGENTE  AS GRP_AGENTE1')  else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS GRP_AGENTE1');
  if btvGCAGENTE2.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.AGENTE2 AS GRP_AGENTE2') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS GRP_AGENTE2');
  if btvGCAGENTE3.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.AGENTE3 AS GRP_AGENTE3') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS GRP_AGENTE3');
  if btvGCAGENTE4.GroupIndex <> -1 then QryNewGC.SQL.Add(' ,V.AGENTE4 AS GRP_AGENTE4') else QryNewGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS GRP_AGENTE4');
  // ---------- FINE CAMPI CAMPI COINVOLTI NELL'ORDINAMENTO --------------------


  // Determina il codice articolo in base a se si tratta di un articolo oppure di ore
  //  di manodopera oppure di altre spese
  QryNewGC.SQL.Add('/* ---------- */');
  QryNewGC.SQL.Add(' ,COALESCE(');
  QryNewGC.SQL.Add('    CAST(');
  QryNewGC.SQL.Add('      CASE V.TIPOLOGIA');
  QryNewGC.SQL.Add('        WHEN ''Manodopera'' THEN ''Opera - '' || V.OPERACODICE');
  QryNewGC.SQL.Add('        WHEN ''Altre spese'' THEN V.CODICEARTICOLO');
  QryNewGC.SQL.Add('        ELSE V.CODICEARTICOLOSTM');
  QryNewGC.SQL.Add('      END');
  QryNewGC.SQL.Add('    AS VARCHAR(25))');
  QryNewGC.SQL.Add('  , '''') AS CODICEARTICOLO');
  QryNewGC.SQL.Add('/* ---------- */');

  QryNewGC.SQL.Add(' ,V.DESCRIZIONE');
  QryNewGC.SQL.Add(' ,V.UnitaDiMisura');
  QryNewGC.SQL.Add(' ,V.GC_SEZIONE');
  QryNewGC.SQL.Add(' ,V.GC_DESCRIZIONE_MOD');
  QryNewGC.SQL.Add(' ,V.GC_DESCRIZIONE');
  QryNewGC.SQL.Add(' ,V.GC_QTA_MOD');
  QryNewGC.SQL.Add(' ,V.GC_QTA');
  QryNewGC.SQL.Add(' ,V.GC_COSTONETTOUNITARIO_MOD');
  QryNewGC.SQL.Add(' ,V.GC_COSTONETTOUNITARIO');
  QryNewGC.SQL.Add(' ,V.GC_COSTONETTOIMPORTO');
  QryNewGC.SQL.Add(' ,V.GC_RICARICO_MOD');
  QryNewGC.SQL.Add(' ,V.GC_RICARICO');
  QryNewGC.SQL.Add(' ,V.GC_GUADAGNOUNITARIO');
  QryNewGC.SQL.Add(' ,V.GC_GUADAGNOIMPORTO');
  QryNewGC.SQL.Add(' ,V.GC_PRZVEND');
  QryNewGC.SQL.Add(' ,V.GC_PRESENTEINCOMMESSA');
  QryNewGC.SQL.Add(' ,V.GC_PRZVENDDACOMMESSA');
  QryNewGC.SQL.Add(' ,V.GC_PRZVENDIMPORTO');
  QryNewGC.SQL.Add(' ,V.AGENTE');
  QryNewGC.SQL.Add(' ,V.AGENTE2');
  QryNewGC.SQL.Add(' ,V.AGENTE3');
  QryNewGC.SQL.Add(' ,V.AGENTE4');
  QryNewGC.SQL.Add(' ,V.TIPO1');
  QryNewGC.SQL.Add(' ,V.TIPO2');
  QryNewGC.SQL.Add(' ,V.TIPO3');
  QryNewGC.SQL.Add(' ,V.TIPO4');
  QryNewGC.SQL.Add(' ,V.TIPO5');
  QryNewGC.SQL.Add(' ,V.TIPO6');
  QryNewGC.SQL.Add(' ,V.SOTTOCANTIERE1');
  QryNewGC.SQL.Add(' ,V.SOTTOCANTIERE2');
  QryNewGC.SQL.Add(' ,V.SOTTOCANTIERE3');
  QryNewGC.SQL.Add(' ,V.SEGNOOPERAZIONE');
  QryNewGC.SQL.Add(' ,V.SEGNOOPERAZIONECANTIERE');
  QryNewGC.SQL.Add(' ,V.PROGRIGO');
  QryNewGC.SQL.Add(' ,V.PROGRIGO2');

  // Determina la descrizione della TIPOLOGIA per fare in modo che le manodopere
  //  siano raggruppabili separatamente per tipo, altrimenti non era possibile.
  QryNewGC.SQL.Add('/* ---------- */');
  QryNewGC.SQL.Add(' ,CAST(');
  QryNewGC.SQL.Add('    CASE V.TIPOLOGIA');
  QryNewGC.SQL.Add('      WHEN ''Manodopera'' THEN V.OPERADESCRIZIONE');
  QryNewGC.SQL.Add('      ELSE V.TIPOLOGIA');
  QryNewGC.SQL.Add('    END');
  QryNewGC.SQL.Add('  AS VARCHAR(60)) AS TIPOLOGIA');
  QryNewGC.SQL.Add('/* ---------- */');

  QryNewGC.SQL.Add(' ,V.TipoDocumento');
  QryNewGC.SQL.Add(' ,V.NumOrdPrev');
  QryNewGC.SQL.Add(' ,V.Registro');
  QryNewGC.SQL.Add(' ,V.DataDocumento');
  QryNewGC.SQL.Add(' ,V.STATODESCRIZIONE');
  QryNewGC.SQL.Add(' ,V.STATOFOREGROUND');
  QryNewGC.SQL.Add(' ,V.CAUSALE');
  QryNewGC.SQL.Add(' ,V.CodiceMagazzino');
  QryNewGC.SQL.Add(' ,V.PrezzoUnitario');
  QryNewGC.SQL.Add(' ,V.Qta');
  QryNewGC.SQL.Add(' ,V.ScontoRigo');
  QryNewGC.SQL.Add(' ,V.ScontoRigo2');
  QryNewGC.SQL.Add(' ,V.ScontoRigo3');
  QryNewGC.SQL.Add(' ,V.ImportoRigo');
  QryNewGC.SQL.Add(' ,V.PREZZOACQUISTOARTICOLO');
  QryNewGC.SQL.Add(' ,CAST(V.PREZZOACQUISTOARTICOLO * V.QTA   AS NUMERIC(11,4)) AS IMPORTOACQUISTOARTICOLO');
  QryNewGC.SQL.Add(' ,V.MARGINE');
  QryNewGC.SQL.Add(' ,V.SOGGETTO');
  QryNewGC.SQL.Add(' ,V.NOTERIGO');
  QryNewGC.SQL.Add(' ,V.PRATICA');
  QryNewGC.SQL.Add(' ,V.DATAPRATICA1');
  QryNewGC.SQL.Add(' ,V.DESCRIZIONEPRATICA');
  QryNewGC.SQL.Add(' ,V.RIFPRATICA');
  QryNewGC.SQL.Add(' ,V.RIFSOGGPRAT');
  QryNewGC.SQL.Add(' ,V.OPERAINDEX');
  QryNewGC.SQL.Add(' ,V.CODICECLIENTE');
  QryNewGC.SQL.Add(' ,V.CODICEIVA');
  QryNewGC.SQL.Add(' ,V.DESCRIZIONEIVA');
  QryNewGC.SQL.Add(' ,V.ALIQUOTAIVA');
  QryNewGC.SQL.Add(' ,V.IMMOBLOCALITA');
  QryNewGC.SQL.Add(' ,V.IMMOBINDIRIZZO');
  QryNewGC.SQL.Add(' ,V.IMMOBNUMCIVICO');
  QryNewGC.SQL.Add(' ,V.IMMOBPROVINCIA');
  QryNewGC.SQL.Add(' ,V.IMMOBCAP');
  QryNewGC.SQL.Add(' ,V.RDA');

  // Reperimento dei gruppi, sottogruppi ecc.
  // NB: Se non sono visualizzati li ritorna nulli per massimizzare le prestazioni
  if SbGCVisGruppi.Down then begin
    QryNewGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=-1 AND G.Codice3=-1 AND G.Codice4=-1 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo1 || '')'' AS VARCHAR(150)) AS GRUPPO1');
    QryNewGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=-1 AND G.Codice4=-1 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo2 || '')'' AS VARCHAR(150)) AS GRUPPO2');
    QryNewGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=-1 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo3 || '')'' AS VARCHAR(150)) AS GRUPPO3');
    QryNewGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=A.CodiceGruppo4 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo4 || '')''');
    QryNewGC.SQL.Add('     AS VARCHAR(150)) AS GRUPPO4');
    QryNewGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=A.CodiceGruppo4 AND G.Codice5=A.CodiceGruppo5 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo5 || '')''');
    QryNewGC.SQL.Add('     AS VARCHAR(150)) AS GRUPPO5');
    QryNewGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=A.CodiceGruppo4 AND G.Codice5=A.CodiceGruppo5 AND G.Codice6=A.CodiceGruppo6)');
    QryNewGC.SQL.Add('     || ''  ('' || A.CodiceGruppo6 || '')'' AS VARCHAR(150)) AS GRUPPO6');
  end else begin
    QryNewGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO1');
    QryNewGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO2');
    QryNewGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO3');
    QryNewGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO4');
    QryNewGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO5');
    QryNewGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO6');
  end;

  // Colonne relative al TRACKING
  QryNewGC.SQL.Add(' ,V.TRACK_PREVENTIVO');
  QryNewGC.SQL.Add(' ,V.TRACK_COMMESSA');
  QryNewGC.SQL.Add(' ,V.TRACK_DDT');
  QryNewGC.SQL.Add(' ,V.TRACK_FATTURA');
  QryNewGC.SQL.Add(' ,V.TRACK_ESTRATTO_CONTO');
  QryNewGC.SQL.Add(' ,V.TRACK_SAL');
  QryNewGC.SQL.Add(' ,V.TRACK_ORD_FORN');
  QryNewGC.SQL.Add(' ,V.TRACK_BOLLA_ENTR');
  QryNewGC.SQL.Add(' ,V.TRACK_FATT_ACQUI');
  QryNewGC.SQL.Add(' ,V.GUID_REF');
  QryNewGC.SQL.Add(' ,V.GUID');
  QryNewGC.SQL.Add(' ,V.GUID_ANCESTOR');

  // Magazzino
  //  NB: Se non siamo nella nuova vista dettaglio evita di calcolare i dati di magazzino
  //       per motivi di ottimizzazione delle prestazioni.
  if SbGcVisMagazzino.Down and GC_IsVistaDettaglio then
  begin
// --- OLD CODE ---
//    QryNewGC.SQL.Add(' ,MA.MAG_GIACENZA');
//    QryNewGC.SQL.Add(' ,MA.MAG_ORDINATO');
//    QryNewGC.SQL.Add(' ,MA.MAG_IMPEGNATO');
// --- OLD CODE ---
    QryNewGC.SQL.Add(' ,(SELECT MAG.OUT_GIACENZA FROM MAG_GET_GIACENZE_ALL(A.CODICEARTICOLO, NULL) MAG) AS MAG_GIACENZA');
//    QryNewGC.SQL.Add(' ,(SELECT MAG.OUT_ORDINATO FROM MAG_GET_GIACENZE_ALL(A.CODICEARTICOLO, NULL) MAG) AS MAG_ORDINATO');
//    QryNewGC.SQL.Add(' ,(SELECT MAG.OUT_IMPEGNATO FROM MAG_GET_GIACENZE_ALL(A.CODICEARTICOLO, NULL) MAG) AS MAG_IMPEGNATO');
    QryNewGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_ORDINATO');
    QryNewGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_IMPEGNATO');
  end else begin
    QryNewGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_GIACENZA');
    QryNewGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_ORDINATO');
    QryNewGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_IMPEGNATO');
  end;

  // Categorie cantieri
  QryNewGC.SQL.Add(' ,V.CATEGCANT1 ,V.CATEGCANT2 ,V.CATEGCANT3 ,V.CATEGCANT4 ,V.CATEGCANT5 ,V.CATEGCANT6');

  // Parte per il calcolo dell'ultimo prezzo acquisto articolo dinamico
  QryNewGC.SQL.Add(' ,V.MAG_ULTIMOPREZZOACQUISTO');

  // FROM
  //  NB: Se non siamo nella nuova vista dettaglio evita di calcolare i dati di magazzino
  //       per motivi di ottimizzazione delle prestazioni.
  QryNewGC.SQL.Add('FROM GC_BASE (' + DeterminaParametriInterrogazione(not GC_IsVistaDettaglio) + ') V');
  QryNewGC.SQL.Add('LEFT JOIN ARTICOLI A ON (A.CODICEARTICOLO=V.CODICEARTICOLO)');
// --- OLD CODE ---
//  if SbGcVisMagazzino.Down and GC_IsVistaDettaglio then
//  begin
//    QryNewGC.SQL.Add('LEFT JOIN');
//    QryNewGC.SQL.Add('  (SELECT M.CODICEARTICOLO, SUM(M.GIACENZA) AS MAG_GIACENZA, SUM(M.ORDINATO) AS MAG_ORDINATO, SUM(M.IMPEGNATO) AS MAG_IMPEGNATO FROM MAG_ART AS M GROUP BY M.CODICEARTICOLO)');
//    QryNewGC.SQL.Add('  AS MA ON (MA.CODICEARTICOLO = V.CODICEARTICOLO)');
//  end;
// --- OLD CODE ---

  // Copia delle clausole WHERE dalla QryGC
  DM1.CopySQLWhereCondition(QryGC.SQL, QryNewGC.SQL);

  // ORDER BY e chiusura query
  //  NB: Sono se siamo in una vista riepilogata (giusto perchè altrimenti salta il collegamento con i righi master)
  //  NB: Sembra che invece non sia necessario, l'importante è che l'ordinamento del DataController sia corretto.
  if not GC_IsVistaDettaglio
    then QryNewGC.SQL.Add('ORDER BY  1,2,3,4,5');

  // OPEN
//  QryNewGC.SQL.SaveToFile('c:\QryGCNew.sql');
  QryNewGC.Open;
  // ===========================================================================

  // Si posiziona all'inizio del GC, ho fatto così perchè alla Laura Termoidraulica
  //  ava un problema che all'apertura del GC gli si posizionava sempre a metà
  //  e la cosa era molto fastidiosa
  btvGCRighi.DataController.GotoFirst;

  // Le prossime righe fanno in modo che  se l'utente ha deciso di visualizzare
  //  più d una sezione (es: COMMESSA e GIACENZA) il risultato venga automaticamente
  //  raggruppato per Sezione cone primo livello di raggruppamento.
  //  NB: Solo se non siamo sulla vista con riassunto per...
  //  NB: In base a quanto sopra scritto rende anche visibili o meno i totali del footer
//  if (GCRighiNew_SelectedSectionCount > 1) and (lvGCRighi.ActuallyVisible) then begin
  if (GCRighiNew_SelectedSectionCount > 1) and (GC_IsVistaDettaglio) then begin 
    btvGCRighi.OptionsView.Footer := False;
    btvGCRighiGC_SEZIONE.GroupBy(0);
  end else begin
    btvGCRighi.OptionsView.Footer := GC_IsVistaDettaglio;
    btvGCRighiGC_SEZIONE.GroupBy(-1);
  end;

  // Espande tutto
  btvGCRighi.ViewData.Expand(True);  // Sostuito da apposita proprietà nel DataController.Options

end;


// Questa funzione ritorna True se l'utente ha selezionato più di una sezione
//  tra quelle visualizzabili nella vista btvGCRighi in modo che poi il programma
//  possa automaticamente raggruppare per sezione e dare quindi i totali per sezione.
function TTabGCForm.GCRighiNew_SelectedSectionCount: Integer;
var
  NumSez: Integer;
begin
  NumSez := 0;
  if SbGcVisCommessa.Down then Inc(NumSez);
  if SbGcVisGiacenza.Down then Inc(NumSez);
  if SbGcVisMontato.Down then Inc(NumSez);
  if SbGcVisFatturato.Down then Inc(NumSez);
  Result := NumSez;
end;




// Procedura che determina i parametri per richiamare
//  la Stored Procedure che popola il GC
function TTabGCForm.DeterminaParametriInterrogazione(ForzaDatiDiMagazzinoDisabilitati:Boolean): String;
begin

  // Se c'è una pratica selezionata...
  if ClientiForm.PraticaCorrente <> '' then begin
    fParam_CodiceSoggetto := 'NULL';
    fParam_CodicePratica  := ClientiForm.PraticaCorrente;
    fParam_DataPratica    := QuotedStr(ClientiForm.DataPraticaCorrenteSQL);
  // Oppure se c'è un soggetto selezionato....
  end else if ClientiForm.ClienteCorrente <> '' then begin
    fParam_CodiceSoggetto := ClientiForm.ClienteCorrente;
    fParam_CodicePratica  := 'NULL';
    fParam_DataPratica    := 'NULL';
  // Oppure se non c'è ne soggetto ne pratica selezionata
  end else begin
    fParam_CodiceSoggetto := 'NULL';
    fParam_CodicePratica  := 'NULL';
    fParam_DataPratica    := 'NULL';
  end;

  // Solo cantieri aperti
  if (Self.GCCantieriApertiChiusi.Checked[0] and not Self.GCCantieriApertiChiusi.Checked[1] and not GC_CantiereSelezionato)
    then fParam_SolocantieriAperti := QuotedStr('T')
    else fParam_SolocantieriAperti := 'NULL';
  // Dati di magazzino dell'articolo
  if SbGcVisMagazzino.Down and not ForzaDatiDiMagazzinoDisabilitati
    then fParam_DatiDiMagazzino := QuotedStr('T')
    else fParam_DatiDiMagazzino := QuotedStr('F');

  // Agenti
  if GCAgente.Text <> ''
    then fParam_Agente1 := QuotedStr(GCAgente.Text)
    else fParam_Agente1 := 'NULL';
  if GCAgente2.Text <> ''
    then fParam_Agente2 := QuotedStr(GCAgente2.Text)
    else fParam_Agente2 := 'NULL';
  if GCAgente3.Text <> ''
    then fParam_Agente3 := QuotedStr(GCAgente3.Text)
    else fParam_Agente3 := 'NULL';
  if GCAgente4.Text <> ''
    then fParam_Agente4 := QuotedStr(GCAgente4.Text)
    else fParam_Agente4 := 'NULL';

  // Tipo righi
  if GCTipo1.Text <> ''
    then fParam_TipoRigo1 := QuotedStr(GCTipo1.Text)
    else fParam_TipoRigo1 := 'NULL';
  if GCTipo2.Text <> ''
    then fParam_TipoRigo2 := QuotedStr(GCTipo2.Text)
    else fParam_TipoRigo2 := 'NULL';
  if GCTipo3.Text <> ''
    then fParam_TipoRigo3 := QuotedStr(GCTipo3.Text)
    else fParam_TipoRigo3 := 'NULL';
  if GCTipo4.Text <> ''
    then fParam_TipoRigo4 := QuotedStr(GCTipo4.Text)
    else fParam_TipoRigo4 := 'NULL';
  if GCTipo5.Text <> ''
    then fParam_TipoRigo5 := QuotedStr(GCTipo5.Text)
    else fParam_TipoRigo5 := 'NULL';
  if GCTipo6.Text <> ''
    then fParam_TipoRigo6 := QuotedStr(GCTipo6.Text)
    else fParam_TipoRigo6 := 'NULL';

  // Sottocantieri
  if GCSottocantiere1.Text <> ''
    then fParam_Sottocantiere1 := QuotedStr(GCSottocantiere1.Text)
    else fParam_Sottocantiere1 := 'NULL';
  if GCSottocantiere2.Text <> ''
    then fParam_Sottocantiere2 := QuotedStr(GCSottocantiere2.Text)
    else fParam_Sottocantiere2 := 'NULL';
  if GCSottocantiere3.Text <> ''
    then fParam_Sottocantiere3 := QuotedStr(GCSottocantiere3.Text)
    else fParam_Sottocantiere3 := 'NULL';
  // Categorie cantieri
  if GCCategCant1.Text <> ''
    then fParam_CategCant1 := QuotedStr(GCCategCant1.Text)
    else fParam_CategCant1 := 'NULL';
  if GCCategCant2.Text <> ''
    then fParam_CategCant2 := QuotedStr(GCCategCant2.Text)
    else fParam_CategCant2 := 'NULL';
  if GCCategCant3.Text <> ''
    then fParam_CategCant3 := QuotedStr(GCCategCant3.Text)
    else fParam_CategCant3 := 'NULL';
  if GCCategCant4.Text <> ''
    then fParam_CategCant4 := QuotedStr(GCCategCant4.Text)
    else fParam_CategCant4 := 'NULL';
  if GCCategCant5.Text <> ''
    then fParam_CategCant5 := QuotedStr(GCCategCant5.Text)
    else fParam_CategCant5 := 'NULL';
  if GCCategCant6.Text <> ''
    then fParam_CategCant6 := QuotedStr(GCCategCant6.Text)
    else fParam_CategCant6 := 'NULL';
  // Costruisce il risultato da restituire
  Result := fParam_CodiceSoggetto + ',' + fParam_CodicePratica + ',' + fParam_DataPratica + ',' + fParam_SolocantieriAperti + ',' + fParam_DatiDiMagazzino + ',' + fParam_Sottocantiere1 + ',' + fParam_Sottocantiere2 + ',' + fParam_Sottocantiere3 + ',' + fParam_CategCant1 + ',' + fParam_CategCant2 + ',' + fParam_CategCant3 + ',' + fParam_CategCant4 + ',' + fParam_CategCant5 + ',' + fParam_CategCant6
                                  + ',' + fParam_Agente1 + ',' + fParam_Agente2 + ',' + fParam_Agente3 + ',' + fParam_Agente4 + ',' + fParam_TipoRigo1 + ',' + fParam_TipoRigo2 + ',' + fParam_TipoRigo3 + ',' + fParam_TipoRigo4 + ',' + fParam_TipoRigo5 + ',' + fParam_TipoRigo6;
end;


procedure TTabGCForm.EseguiQueryGC;
var
  i : Integer;
  GroupByStr: String;
  Cronologica, Magazzino: Boolean;
begin
 // Chiusura Query
 if QryGC.Active    then QryGC.Close;
 if QryNewGC.Active then QryNewGC.Close;

 // Inizializzazione
 Cronologica := SbGcVisCronologicoGiorno.Down or SbGcVisCronologicoMese.Down;
 Magazzino := (btvGCMAG_DISPONIBILE.Visible or btvGCMAG_DAORDINARE.Visible) and (GC_CantiereSelezionato);
 GroupByStr := '';
 btvGC.OptionsView.ExpandButtonsForEmptyDetails := False;

 if Magazzino then begin
   if DM1.Messaggi('Levante - Giornale di Cantiere', 'ATTENZIONE !!!'#13#13'Quando la sezione dei dati di magazzino è attiva l''esecuzione dell''interrogazione potrebbe essere molto lenta.'#13#13'Potrebbero essere necessari diversi minuti.'#13#13'Proseguire?', '', [mbYes,mbNo], 0, nil) <> mrYes
   then begin
     Exit;
   end;
 end;

 // Se alcuni filtri suono completamente vuoti li defaultizza
 if (not GCCheckListBoxSegnoOperazione.Checked[0]) and (not GCCheckListBoxSegnoOperazione.Checked[1]) and (not GCCheckListBoxSegnoOperazione.Checked[2]) and (not GCCheckListBoxSegnoOperazione.Checked[3]) and (not GCCheckListBoxSegnoOperazione.Checked[4]) then begin
   GCCheckListBoxSegnoOperazione.Checked[0] := True;
   GCCheckListBoxSegnoOperazione.Checked[1] := True;
   GCCheckListBoxSegnoOperazione.Checked[2] := True;
   GCCheckListBoxSegnoOperazione.Checked[3] := True;
   GCCheckListBoxSegnoOperazione.Checked[4] := True;
 end;
 if (not GCCantieriApertiChiusi.Checked[0]) and (not GCCantieriApertiChiusi.Checked[1]) then begin
   GCCantieriApertiChiusi.Checked[0] := True;
   GCCantieriApertiChiusi.Checked[1] := False;
 end;
 if (not GCTipo.Checked[0]) and (not GCTipo.Checked[1]) and (not GCTipo.Checked[2]) then begin
   GCTipo.Checked[0] := True;
   GCTipo.Checked[1] := True;
   GCTipo.Checked[2] := True;
 end;
 // Inizia l'aggiornamento della griglia
 GridGC.BeginUpdate;
 // Avvia la transazione
 DM1.DBAzienda.StartTransaction;
 try try
    DM1.ShowWait('Giornale di Cantiere', 'Caricamento dati...');
    // ===========================================================================
    // SELECT
    // ---------------------------------------------------------------------------
    QryGC.SQL.Clear;
    QryGC.SQL.Add('SELECT');

    // Se siamo all'interno di un cantiere selezionato...
    if GC_CantiereSelezionato then begin
      QryGC.SQL.Add('A.UNITADIMISURA');
      // Determina il codice articolo in base a se si tratta di un articolo oppure di ore
      //  di manodopera oppure di altre spese
      QryGC.SQL.Add('/* ---------- */');
      QryGC.SQL.Add(' ,COALESCE(');
      QryGC.SQL.Add('    CAST(');
      QryGC.SQL.Add('      CASE V.TIPOLOGIA');
      QryGC.SQL.Add('        WHEN ''Manodopera'' THEN ''Opera - '' || V.OPERACODICE');
      QryGC.SQL.Add('        WHEN ''Altre spese'' THEN V.CODICEARTICOLO');
      QryGC.SQL.Add('        ELSE V.CODICEARTICOLO');
      QryGC.SQL.Add('      END');
      QryGC.SQL.Add('    AS VARCHAR(25))');
      QryGC.SQL.Add('  , '''') AS CODICEARTICOLO');
      QryGC.SQL.Add('/* ---------- */');
      // Determina la descrizione in base a se si tratta di un articolo oppure di ore
      //  di manodopera oppure di altre spese
      QryGC.SQL.Add('/* ---------- */');
      QryGC.SQL.Add(' ,CAST(');
      QryGC.SQL.Add('    CASE V.TIPOLOGIA');
      QryGC.SQL.Add('      WHEN ''Manodopera'' THEN V.OPERADESCRIZIONE');
      QryGC.SQL.Add('      WHEN ''Altre spese'' THEN V.DESCRIZIONE');
      QryGC.SQL.Add('      ELSE COALESCE(A.DESCRIZIONE, V.GC_DESCRIZIONE)');
      QryGC.SQL.Add('    END');
      QryGC.SQL.Add('  AS VARCHAR(5000)) AS DESCRIZIONE');
      QryGC.SQL.Add('/* ---------- */');
    // Se invece siamo fuori da un cantiere forza tutti i codici articolo e descrizione
    //  in modo che praticmente indichino la tipologia.
    end else begin
      // Se siamo all'interno di un cantiere selezionato
      //  rende tutte le unità di misura ugiali altrimenti se la fattura contiere anche
      //  dei righi di manodopera mi separa la fattura in due righi uno per i Materiali apparecchi
      //  e 1 per la manodopera
      QryGC.SQL.Add('CAST(NULL AS VARCHAR(2)) AS UNITADIMISURA');
      // Determina il codice articolo in base a se si tratta di un articolo oppure di ore
      //  di manodopera oppure di altre spese
      QryGC.SQL.Add('/* ---------- */');
      QryGC.SQL.Add(' ,COALESCE(');
      QryGC.SQL.Add('    CAST(');
      QryGC.SQL.Add('      CASE');
      QryGC.SQL.Add('        WHEN (V.SEGNOOPERAZIONECANTIERE = ''F'') THEN ''Fatturato''');
      QryGC.SQL.Add('        WHEN (V.TIPOLOGIA = ''Manodopera'') THEN ''Opera - '' || V.OPERACODICE');
      QryGC.SQL.Add('        WHEN (V.TIPOLOGIA = ''Altre spese'') THEN ''Spese''');
      QryGC.SQL.Add('        ELSE ''Mat/App''');
      QryGC.SQL.Add('      END');
      QryGC.SQL.Add('    AS VARCHAR(25))');
      QryGC.SQL.Add('  , '''') AS CODICEARTICOLO');
      QryGC.SQL.Add('/* ---------- */');
      // Determina la descrizione in base a se si tratta di un articolo oppure di ore
      //  di manodopera oppure di altre spese
      QryGC.SQL.Add('/* ---------- */');
      QryGC.SQL.Add(' ,CAST(');
      QryGC.SQL.Add('    CASE');
      QryGC.SQL.Add('      WHEN (V.SEGNOOPERAZIONECANTIERE = ''F'' AND TIPODOCUMENTO <> ''Nota_accre'') THEN ''- Fattura n° '' || V.NUMORDPREV || V.REGISTRO || '' del '' || V.DataDocumento');
      QryGC.SQL.Add('      WHEN (V.SEGNOOPERAZIONECANTIERE = ''F'' AND TIPODOCUMENTO =  ''Nota_accre'') THEN ''- Nota di credito n° '' || V.NUMORDPREV || V.REGISTRO || '' del '' || V.DataDocumento');
      QryGC.SQL.Add('      WHEN (V.TIPOLOGIA = ''Manodopera'') THEN V.OPERADESCRIZIONE');
      QryGC.SQL.Add('      WHEN (V.TIPOLOGIA = ''Altre spese'') THEN ''Altre spese''');
      QryGC.SQL.Add('      ELSE ''Materiali / Apparecchi''');
      QryGC.SQL.Add('    END');
      QryGC.SQL.Add('  AS VARCHAR(5000)) AS DESCRIZIONE');
      QryGC.SQL.Add('/* ---------- */');
    end;

    // Se è attiva la visualizzazione cronologica ritorna anche tutti i righi raggruppati per
    //  data documento altrimenti no
    if Cronologica
    then
    begin
      if DM1.ControllaDataStr(GCDal.EditText) then
      begin
        QryGC.SQL.Add(', CASE ');
        QryGC.SQL.Add('    WHEN (V.GC_SEZIONE = ''Commessa'') THEN CAST(''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(GCDal.EditText))) + ''' AS TIMESTAMP)');
        QryGC.SQL.Add('    ELSE V.DATADOCUMENTO');
        QryGC.SQL.Add('  END AS DATADOCUMENTO');
      end
      else
        QryGC.SQL.Add(' ,V.DATADOCUMENTO');
      GroupByStr := GroupByStr + ', DATADOCUMENTO';
    end
    else
      QryGC.SQL.Add(' ,CAST(NULL AS DATE) AS DATADOCUMENTO');

    // Se le colonne relative ai sottogruppi sono in raggruppamento...
    if btvGCSOTTOCANTIERE1.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.SOTTOCANTIERE1');
      GroupByStr := GroupByStr + ', V.SOTTOCANTIERE1';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS SOTTOCANTIERE1');

    if btvGCSOTTOCANTIERE2.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.SOTTOCANTIERE2');
      GroupByStr := GroupByStr + ', V.SOTTOCANTIERE2';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS SOTTOCANTIERE2');

    if btvGCSOTTOCANTIERE3.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.SOTTOCANTIERE3');
      GroupByStr := GroupByStr + ', V.SOTTOCANTIERE3';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS SOTTOCANTIERE3');

    // Se le colonne relative ai TipiRighi sono in raggruppamento...
    if btvGCTIPO1.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.TIPO1');
      GroupByStr := GroupByStr + ', V.TIPO1';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS TIPO1');

    if btvGCTIPO2.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.TIPO2');
      GroupByStr := GroupByStr + ', V.TIPO2';
    end
    else
     QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS TIPO2');

    if btvGCTIPO3.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.TIPO3');
      GroupByStr := GroupByStr + ', V.TIPO3';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS TIPO3');

    if btvGCTIPO4.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.TIPO4');
      GroupByStr := GroupByStr + ', V.TIPO4';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS TIPO4');

    if btvGCTIPO5.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.TIPO5');
      GroupByStr := GroupByStr + ', V.TIPO5';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS TIPO5');

    if btvGCTIPO6.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.TIPO6');
      GroupByStr := GroupByStr + ', V.TIPO6';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(20)) AS TIPO6');

    // Se le colonne relative agli AGENTI sono in raggruppamento...
    if btvGCAGENTE1.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.AGENTE');
      GroupByStr := GroupByStr + ', V.AGENTE';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS AGENTE');

    if btvGCAGENTE2.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.AGENTE2');
      GroupByStr := GroupByStr + ', V.AGENTE2';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS AGENTE2');

    if btvGCAGENTE3.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.AGENTE3');
      GroupByStr := GroupByStr + ', V.AGENTE3';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS AGENTE3');

    if btvGCAGENTE4.GroupIndex <> -1 then
    begin
      QryGC.SQL.Add(' ,V.AGENTE4');
      GroupByStr := GroupByStr + ', V.AGENTE4';
    end
    else
      QryGC.SQL.Add(' ,CAST(''TUTTI'' AS VARCHAR(25)) AS AGENTE4');

    // Reperimento dei gruppi, sottogruppi ecc.
    // NB: Se non sono visualizzati li ritorna nulli per massimizzare le prestazioni
    if SbGCVisGruppi.Down then begin
      QryGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=-1 AND G.Codice3=-1 AND G.Codice4=-1 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo1 || '')'' AS VARCHAR(150)) AS GRUPPO1');
      QryGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=-1 AND G.Codice4=-1 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo2 || '')'' AS VARCHAR(150)) AS GRUPPO2');
      QryGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=-1 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo3 || '')'' AS VARCHAR(150)) AS GRUPPO3');
      QryGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=A.CodiceGruppo4 AND G.Codice5=-1 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo4 || '')'' ');
      QryGC.SQL.Add('     AS VARCHAR(150)) AS GRUPPO4');
      QryGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=A.CodiceGruppo4 AND G.Codice5=A.CodiceGruppo5 AND G.Codice6=-1) || ''  ('' || A.CodiceGruppo5 || '')''  ');
      QryGC.SQL.Add('     AS VARCHAR(150)) AS GRUPPO5');
      QryGC.SQL.Add(' ,CAST((SELECT G.Descrizione FROM Gruppi G WHERE G.Codice1=A.CodiceGruppo1 AND G.Codice2=A.CodiceGruppo2 AND G.Codice3=A.CodiceGruppo3 AND G.Codice4=A.CodiceGruppo4 AND G.Codice5=A.CodiceGruppo5 AND G.Codice6=A.CodiceGruppo6) ');
      QryGC.SQL.Add('     || ''  ('' || A.CodiceGruppo6 || '')'' AS VARCHAR(150)) AS GRUPPO6');
    end else begin
      QryGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO1');
      QryGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO2');
      QryGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO3');
      QryGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO4');
      QryGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO5');
      QryGC.SQL.Add(' ,CAST(NULL AS VARCHAR(150)) AS GRUPPO6');
    end;

    // Commessa
    QryGC.SQL.Add(' ,SUM(V.GC_COMMESSA_QTA) AS COMMESSA_QTA');
    QryGC.SQL.Add(' ,SUM(V.GC_COMMESSA_IMPORTOACQ) AS COMMESSA_IMPORTOACQ');
    QryGC.SQL.Add(' ,SUM(V.GC_COMMESSA_IMPORTOVEND) AS COMMESSA_IMPORTOVEND');
    QryGC.SQL.Add(' ,SUM(V.GC_COMMESSA_GUADAGNOIMPORTO) AS COMMESSA_GUADAGNOIMPORTO');

    // Giacenza
    QryGC.SQL.Add(' ,SUM(V.GC_GIACENZA_QTA) AS GIACENZA_QTA');
    QryGC.SQL.Add(' ,SUM(V.GC_GIACENZA_IMPORTOACQ) AS GIACENZA_IMPORTOACQ');
    QryGC.SQL.Add(' ,SUM(V.GC_GIACENZA_IMPORTOVEND) AS GIACENZA_IMPORTOVEND');
    QryGC.SQL.Add(' ,SUM(V.GC_GIACENZA_GUADAGNOIMPORTO) AS GIACENZA_GUADAGNOIMPORTO');

    // Montato
    QryGC.SQL.Add(' ,SUM(V.GC_MONTATO_QTA) AS MONTATO_QTA');
    QryGC.SQL.Add(' ,SUM(V.GC_MONTATO_IMPORTOACQ) AS MONTATO_IMPORTOACQ');
    QryGC.SQL.Add(' ,SUM(V.GC_MONTATO_IMPORTOVEND) AS MONTATO_IMPORTOVEND');
    QryGC.SQL.Add(' ,SUM(V.GC_MONTATO_GUADAGNOIMPORTO) AS MONTATO_GUADAGNOIMPORTO');

    // Fatturato
    QryGC.SQL.Add(' ,SUM(V.GC_FATTURATO_IMPORTOVEND) AS FATTURATO_IMPORTOVEND');

    // Da montare
    QryGC.SQL.Add(' ,SUM(V.GC_DAMONT_GIACENZA_IMPORTOVEND) AS DAMONT_GIACENZA_IMPORTOVEND');
    QryGC.SQL.Add(' ,SUM(V.GC_DAMONT_COMMESSA_IMPORTOVEND) AS DAMONT_COMMESSA_IMPORTOVEND');

    // Da fatturare
    QryGC.SQL.Add(' ,SUM(V.GC_DAFATT_GIACENZA_IMPORTOVEND) AS DAFATT_GIACENZA_IMPORTOVEND');
    QryGC.SQL.Add(' ,SUM(V.GC_DAFATT_COMMESSA_IMPORTOVEND) AS DAFATT_COMMESSA_IMPORTOVEND');
    QryGC.SQL.Add(' ,SUM(V.GC_DAFATT_MONTATO_IMPORTOVEND) AS DAFATT_MONTATO_IMPORTOVEND');

    // Magazzino
    if SbGcVisMagazzino.Down then begin
      QryGC.SQL.Add(' ,MA.MAG_GIACENZA');
      QryGC.SQL.Add(' ,MA.MAG_ORDINATO');
      QryGC.SQL.Add(' ,MA.MAG_IMPEGNATO');
      GroupByStr := GroupByStr + ', MA.MAG_GIACENZA, MA.MAG_ORDINATO, MA.MAG_IMPEGNATO';
    end else begin
      QryGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_GIACENZA');
      QryGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_ORDINATO');
      QryGC.SQL.Add(' ,CAST(NULL AS NUMERIC(11,4)) AS MAG_IMPEGNATO');
    end;

    // Parte per il calcolo dell'ultimo prezzo acquisto articolo dinamico
    QryGC.SQL.Add(' ,V.MAG_ULTIMOPREZZOACQUISTO');

    // Se siamo in un cantiere selezionato ritorna la normale TIPOLOGIA del rigo
    //  se invece siamo fuori da un cantiere selezionato esegue alcune forzature
    //  in particolare nel fatturato.
    if GC_CantiereSelezionato then begin
      QryGC.SQL.Add(' ,TIPOLOGIA');
    end else begin
      QryGC.SQL.Add(' ,CAST(');
      QryGC.SQL.Add('    CASE');
      QryGC.SQL.Add('      WHEN (V.SEGNOOPERAZIONECANTIERE = ''F'') THEN ''- Fatturato''');
      QryGC.SQL.Add('      ELSE V.TIPOLOGIA');
      QryGC.SQL.Add('    END');
      QryGC.SQL.Add('  AS VARCHAR(60)) AS TIPOLOGIA');
    end;

    // Riferimento al cantiere
    QryGC.SQL.Add(' ,V.RIFPRATICA');
    QryGC.SQL.Add(' ,V.RIFSOGGPRAT');

    // Categorie cantieri
    QryGC.SQL.Add(' ,V.CATEGCANT1 ,V.CATEGCANT2 ,V.CATEGCANT3 ,V.CATEGCANT4 ,V.CATEGCANT5 ,V.CATEGCANT6');

    // ===========================================================================
    // FROM E JOIN
    // ---------------------------------------------------------------------------
    QryGC.SQL.Add('FROM GC_BASE (' + DeterminaParametriInterrogazione(False) + ') V');
    QryGC.SQL.Add('LEFT JOIN ARTICOLI A ON (A.CODICEARTICOLO=V.CODICEARTICOLO)');
    if SbGcVisMagazzino.Down then
    begin
      QryGC.SQL.Add('LEFT JOIN');
      QryGC.SQL.Add('  (SELECT M.CODICEARTICOLO, SUM(M.GIACENZA) AS MAG_GIACENZA, SUM(M.ORDINATO) AS MAG_ORDINATO, SUM(M.IMPEGNATO) AS MAG_IMPEGNATO FROM MAG_ART AS M GROUP BY M.CODICEARTICOLO)');
      QryGC.SQL.Add('  AS MA ON (MA.CODICEARTICOLO = V.CODICEARTICOLO)');
    end;

    // ===========================================================================
    // WHERE E OPEN
    // ---------------------------------------------------------------------------
    QryGC.SQL.Add('WHERE 1=1');

    // Se c'è una pratica selezionata...
{
    if ClientiForm.PraticaCorrente <> '' then begin
      QryGC.SQL.Add('AND ((V.Pratica = ''' + ClientiForm.PraticaCorrente + ''')AND(V.DataPratica1='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
    // Oppure se c'è un soggetto selezionato....
    end else if ClientiForm.ClienteCorrente <> '' then begin
      QryGC.SQl.Add('AND V.CODSOGGPRAT = ' + ClientiForm.ClienteCorrente);
      QryGC.SQl.Add('AND V.PRATICA IS NOT NULL AND RIFPRATICA <> ''''');
    // Oppure se non c'è ne soggetto ne pratica selezionata
    end else begin
        QryGC.SQl.Add('AND V.CODICECLIENTE IS NOT NULL AND V.CODICECLIENTE > 0');
        QryGC.SQl.Add('AND V.PRATICA IS NOT NULL AND RIFPRATICA <> ''''');
    end;
}

    // Se specificato che si vogliono visualizzare solo i righi con valore <> 0
    //  fa in modo che tutti i righi che hanno l'importo di costo e di vendita = 0
    //  vengano ignorati
    if GCSoloRighiNoZero.Checked[0] then DM1.AddSQL(QryGC, 'AND', '((V.GC_COSTONETTOIMPORTO<>0 AND V.GC_COSTONETTOIMPORTO IS NOT NULL) OR (V.GC_PRZVENDIMPORTO<>0 AND V.GC_PRZVENDIMPORTO IS NOT NULL))');

    // Se specificato ricerca per COdiceArticolo
    if GCCodiceArticolo.Text <> '' then DM1.AddSQL(QryGC, 'AND', 'V.CodiceArticolo LIKE ''' + Trim(GCCodiceArticolo.Text) + '''');
    // Se è specificato la ricerca per testo (Descrizione, note ecc)
    if GCDescrizione.Text <> '' then begin
       DM1.AddSQL(QryGC, 'AND', '(');
       DM1.AggiungiRicercaCampo(QryGC.SQL, 'V.Descrizione', GCDescrizione.Text, False);
       QryGC.SQL.Add('OR');
       DM1.AggiungiRicercaCampo(QryGC.SQL, 'V.NoteRigo', GCDescrizione.Text, False);
       QryGC.SQL.Add(')');
    end;
    // Se specificato ricerca per marca
    if GCMarca.Text <> '' then DM1.AddSQL(QryGC, 'AND', 'UPPER(A.Marca) = UPPER(''' + Trim(GCMarca.Text) + ''')');

    // Se specificato ricerca per RDA
    if GCRDA.Text <> '' then DM1.AddSQL(QryGC, 'AND', 'UPPER(V.RDA) = UPPER(''' + Trim(GCRDA.Text) + ''')');

    // Se è stato specificato un filtraggio per stato si comporta diversamente a seconda del fatto
    //  che siamo dentro ad un cantiere selezionato oppure fuori.
    //  Se siamo dentro un cantiere selezionato filtra per stato dei documenti imputati al cantiere stesso.
    //  Se siamo invece fuori dal cantiere filtra per stato dei cantieri
    if GCSoloStato.Text <> '' then begin
      if GC_CantiereSelezionato then begin
        DM1.AddSQL(QryGC, 'AND', 'V.StatoDescrizione = ''' + Trim(GCSoloStato.Text) + '''');
      end else begin
        DM1.AddSQL(QryGC, 'AND', 'V.StatoDescrizionePratica1 = ''' + Trim(GCSoloStato.Text) + '''');
      end;
    end;

    // Filtro per pratica aperta/chiusa
    //  NB: Questo filtro non deve fare nulla nel caso siamo dentro un cantiere selezionato
//    if not GC_CantiereSelezionato then begin  //NB: Modificato per problema Sala Ivan
    if (ClientiForm.PraticaCorrente = '') then
    begin
      if GCCantieriApertiChiusi.Checked[0] and (not GCCantieriApertiChiusi.Checked[1])
        then QryGC.SQL.Add('AND V.DATACHIUSURAPRATICA1 IS NULL')
      else if (not GCCantieriApertiChiusi.Checked[0]) and GCCantieriApertiChiusi.Checked[1]
        then QryGC.SQL.Add('AND V.DATACHIUSURAPRATICA1 IS NOT NULL');
    end;

    // Se specificato ricerca per Agente
    if GCAgente.Text  <> '' then DM1.AddSQL(QryGC, 'AND', 'V.Agente  = ''' + Trim(GCAgente.Text) + '''');
    if GCAgente2.Text <> '' then DM1.AddSQL(QryGC, 'AND', 'V.Agente2 = ''' + Trim(GCAgente2.Text) + '''');
    if GCAgente3.Text <> '' then DM1.AddSQL(QryGC, 'AND', 'V.Agente3 = ''' + Trim(GCAgente3.Text) + '''');
    if GCAgente4.Text <> '' then DM1.AddSQL(QryGC, 'AND', 'V.Agente4 = ''' + Trim(GCAgente4.Text) + '''');

    // Filtra in base ai gruppi/sottogruppi selezionati
    if GCCodiceGruppo1.Text <>  ''     then DM1.AddSQL(QryGC, 'AND', 'A.CODICEGRUPPO1 = ' + GCCodiceGruppo1.Text);
    if GCCodiceGruppo2.Text <>  ''     then DM1.AddSQL(QryGC, 'AND', 'A.CODICEGRUPPO2 = ' + GCCodiceGruppo2.Text);
    if GCCodiceGruppo3.Text <>  ''     then DM1.AddSQL(QryGC, 'AND', 'A.CODICEGRUPPO3 = ' + GCCodiceGruppo3.Text);
    if GCCodiceGruppo4.Text <>  ''     then DM1.AddSQL(QryGC, 'AND', 'A.CODICEGRUPPO4 = ' + GCCodiceGruppo4.Text);
    if GCCodiceGruppo5.Text <>  ''     then DM1.AddSQL(QryGC, 'AND', 'A.CODICEGRUPPO5 = ' + GCCodiceGruppo5.Text);
    if GCCodiceGruppo6.Text <>  ''     then DM1.AddSQL(QryGC, 'AND', 'A.CODICEGRUPPO6 = ' + GCCodiceGruppo6.Text);
    // Filtra in base alla tipologia
    //  NB: Filtro disabilitato se siamo fuori dal cantiere selezionato
    if GC_CantiereSelezionato then begin
      if not GCTipo.Checked[0] then QryGC.SQL.Add('AND V.TIPOLOGIA <> ''Materiali / Apparecchi''');
      if not GCTipo.Checked[1] then QryGC.SQL.Add('AND V.TIPOLOGIA <> ''Manodopera''');
      if not GCTipo.Checked[2] then QryGC.SQL.Add('AND V.TIPOLOGIA <> ''Altre spese''');
    end;
    // Filtra in base ai tipi di movimentazione selesionata
    if not GCCheckListBoxSegnoOperazione.Checked[0] then QryGC.SQL.Add('AND V.SEGNOOPERAZIONECANTIERE <> ''C''');
    if not GCCheckListBoxSegnoOperazione.Checked[1] then QryGC.SQL.Add('AND V.SEGNOOPERAZIONECANTIERE <> ''+''');
    if not GCCheckListBoxSegnoOperazione.Checked[2] then QryGC.SQL.Add('AND V.SEGNOOPERAZIONECANTIERE <> ''-''');
    if not GCCheckListBoxSegnoOperazione.Checked[3] then QryGC.SQL.Add('AND V.SEGNOOPERAZIONECANTIERE <> ''M''');
    if not GCCheckListBoxSegnoOperazione.Checked[4] then QryGC.SQL.Add('AND V.SEGNOOPERAZIONECANTIERE <> ''F''');

    // Se specificate ricerca per intervallo di date
    //  eventualmente tenendo conto anche del flag che indica se la commessa deve cmq essere NON filtrata
    //  (in pratica la commessa deve essere esclusa dal filtraggio)
//    if DM1.ControllaDataStr(GCDal.EditText) then
//      DM1.AddSQL(QryGC, 'AND', 'V.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(GCDal.EditText))) + '''');
//    if DM1.ControllaDataStr(GCAl.EditText) then
//      DM1.AddSQL(QryGC, 'AND', 'V.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(GCAl.EditText))) + '''');
    if DM1.ControllaDataStr(GCDal.EditText) or DM1.ControllaDataStr(GCAl.EditText) then
    begin
      QryGC.SQL.Add('AND');
      // Se la commessa deve essere esclusa dal filtraggio aggiunge le parentesi
      if GCAltroDate.Checked[0] then
        QryGC.SQL.Add('((');
      // Data Da
      if DM1.ControllaDataStr(GCDal.EditText) then
        QryGC.SQL.Add('V.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(GCDal.EditText))) + '''');
      // Data A
      if DM1.ControllaDataStr(GCAl.EditText) then
      begin
        // Se c'era anche la Data Dal aggiunge il necessario AND
        if DM1.ControllaDataStr(GCDal.EditText) then
          QryGC.SQL.Add('AND');
        QryGC.SQL.Add('V.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(GCAl.EditText))) + '''');
      end;
      // Se la commessa deve essere esclusa dal filtraggio chiude la parentesi interna di quelle aggiunte prima
      //  poi aggiunge la condizione per escludere dal filtraggio la commessa e poi aggiunge anche la parentesi esterna
      if GCAltroDate.Checked[0] then
        QryGC.SQL.Add(') OR V.GC_SEZIONE = ''Commessa'')');
    end;

    // Se specificato il filtro per sottocantieri
{
    if GCSottocantiere1.Text <> '' then QryGC.SQL.Add('AND V.SOTTOCANTIERE1 = ''' + GCSottocantiere1.Text + '''');
    if GCSottocantiere2.Text <> '' then QryGC.SQL.Add('AND V.SOTTOCANTIERE2 = ''' + GCSottocantiere2.Text + '''');
    if GCSottocantiere3.Text <> '' then QryGC.SQL.Add('AND V.SOTTOCANTIERE3 = ''' + GCSottocantiere3.Text + '''');
}

    // Aggiunge la ricerca con campo TROVA
    if Trim(FilterGCTrova.Text) <> '' then begin
      DM1.AddSQL(QryGC, 'AND', '(');
      DM1.AggiungiRicercaCampo(QryGC.SQL, 'V.CODICEARTICOLO', FilterGCTrova.Text, False);
      QryGC.SQL.Add('OR');
      DM1.AggiungiRicercaCampo(QryGC.SQL, 'V.DESCRIZIONE', FilterGCTrova.Text, False);
      QryGC.SQL.Add('OR');
      DM1.AggiungiRicercaCampo(QryGC.SQL, 'A.DESCRIZIONE', FilterGCTrova.Text, False);
      QryGC.SQL.Add('OR');
      DM1.AggiungiRicercaCampo(QryGC.SQL, 'A.MARCA', FilterGCTrova.Text, False);
      QryGC.SQL.Add('OR');
      DM1.AggiungiRicercaCampo(QryGC.SQL, 'V.NOTERIGO', FilterGCTrova.Text, False);
      QryGC.SQL.Add(')');
    end;

    // Parte per filtrare solo i righi relativi alle sezioni volute
    // NB: TOlta perchè non vorrei che magari l'utente pensasse che una sezione sia vuota e invece non lo è
    // NB: Alla fine ho visto che togliendola del tutto, nella visualizzazione normale (non riassunta) si visualizzavano
    //      tutte le sezioni (in pratica non funzionava il filtro per selezione che sono i selettori in alto). Allora
    //      ho deciso che se sono in una visualizzazione riassunta salto il filtro altrimenti lo uso.
    if GC_IsVistaDettaglio then begin
      if not SbGcVisCommessa.Down   then QryGC.SQL.Add('AND V.GC_SEZIONE <> ''Commessa''');
      if not SbGcVisGiacenza.Down   then QryGC.SQL.Add('AND V.GC_SEZIONE <> ''Giacenza''');
      if not SbGcVisMontato.Down    then QryGC.SQL.Add('AND V.GC_SEZIONE <> ''Montato''');
      if not SbGcVisFatturato.Down  then QryGC.SQL.Add('AND V.GC_SEZIONE <> ''Fatturato''');
    end;

    // Se fuori dalla seleziona di un cantiere usa anche i filtri per categorie cantieri
    //  che invece ovviamente non hanno senso se siamo dentro un cantiere...
    if ClientiForm.PraticaCorrente = '' then begin
      if GCCategCant1.Text <> '' then QryGC.SQL.Add('AND V.CATEGCANT1 = ''' + GCCategCant1.Text + '''');
      if GCCategCant2.Text <> '' then QryGC.SQL.Add('AND V.CATEGCANT2 = ''' + GCCategCant2.Text + '''');
      if GCCategCant3.Text <> '' then QryGC.SQL.Add('AND V.CATEGCANT3 = ''' + GCCategCant3.Text + '''');
      if GCCategCant4.Text <> '' then QryGC.SQL.Add('AND V.CATEGCANT4 = ''' + GCCategCant4.Text + '''');
      if GCCategCant5.Text <> '' then QryGC.SQL.Add('AND V.CATEGCANT5 = ''' + GCCategCant5.Text + '''');
      if GCCategCant6.Text <> '' then QryGC.SQL.Add('AND V.CATEGCANT6 = ''' + GCCategCant6.Text + '''');
    end;

    // Group by
    if GC_CantiereSelezionato then begin
      QryGC.SQL.Add('GROUP BY CODICEARTICOLO, DESCRIZIONE, UNITADIMISURA, MAG_ULTIMOPREZZOACQUISTO, TIPOLOGIA,');
      QryGC.SQL.Add('  A.CodiceGruppo1, A.CodiceGruppo2, A.CodiceGruppo3, A.CodiceGruppo4, A.CodiceGruppo5, A.CodiceGruppo6, RIFPRATICA, RIFSOGGPRAT, CATEGCANT1, CATEGCANT2, CATEGCANT3, CATEGCANT4, CATEGCANT5, CATEGCANT6' + GroupByStr);
    end else begin
      QryGC.SQL.Add('GROUP BY CODICEARTICOLO, DESCRIZIONE, UNITADIMISURA, MAG_ULTIMOPREZZOACQUISTO, TIPOLOGIA, RIFPRATICA, RIFSOGGPRAT, CATEGCANT1, CATEGCANT2, CATEGCANT3, CATEGCANT4, CATEGCANT5, CATEGCANT6' + GroupByStr);
    end;

    // Attiva la query
    //  NB: Se siamo sulla vista dettaglio diretta sui righi non la esegue perchè non serve
    if not GC_IsVistaDettaglio then begin
//QryGC.SQL.SaveToFile('c:\QueryGC.sql');
      QryGC.Open;
    end;


    // ===========================================================================
    // INIZIO - IMPOSTAZIONE DEI RAGGRUPPAMENTI DI DEFAULT
    // ---------------------------------------------------------------------------
    // Se stiamo visualizzando la cronologia del cantiere fa in modo
    //  che i dati siano raggruppati per data
    btvGC.ViewData.Collapse(True);  // Collassa tutto prima altrimenti da dei problemi
    if Cronologica then begin
      // Se siamo con un cantiere selezionato...
      if GC_CantiereSelezionato then begin
        // Se non è già raggruppato per DATADOCUMENTO lo raggruppa come 1° livello
        if (btvGCDATADOCUMENTO.GroupIndex = -1) then btvGCDATADOCUMENTO.GroupIndex := 0;
        btvGCDATADOCUMENTO.Visible := False;
        // Se non è già raggruppato per TIPOLOGIA lo raggruppa come 2° livello
        if (btvGCTIPOLOGIA.GroupIndex = -1) and (Self.GC_Col_Visible_TipologiaArticolo) then btvGCTIPOLOGIA.GroupIndex := 1;
        btvGCTIPOLOGIA.Visible := False;
        // Imposta il tipo di raggruppamento per date
        if SbGcVisCronologicoGiorno.Down      then btvGCDATADOCUMENTO.DateTimeGrouping := dtgByDate
        else if SbGcVisCronologicoMese.Down   then btvGCDATADOCUMENTO.DateTimeGrouping := dtgByMonth
        else btvGCDATADOCUMENTO.DateTimeGrouping := dtgDefault;
      // Altrimenti se non c'è alcun cantiere selezionato...
      end else begin
        // Se non è già raggruppato per RIFPRATICA (Cantiere) lo raggruppa come 1° livello
        if (btvGCRIFPRATICA.GroupIndex = -1) then btvGCRIFPRATICA.GroupIndex := 0;
        btvGCRIFPRATICA.Visible := False;
        // Se non è già raggruppato per DATADOCUMENTO lo raggruppa come 2° livello
        if (btvGCDATADOCUMENTO.GroupIndex = -1) then btvGCDATADOCUMENTO.GroupIndex := 1;
        btvGCDATADOCUMENTO.Visible := False;
        // Imposta il tipo di raggruppamento per date
        if SbGcVisCronologicoGiorno.Down      then btvGCDATADOCUMENTO.DateTimeGrouping := dtgByDate
        else if SbGcVisCronologicoMese.Down   then btvGCDATADOCUMENTO.DateTimeGrouping := dtgByMonth
        else btvGCDATADOCUMENTO.DateTimeGrouping := dtgDefault;
      end;
    // Se invece siamo in visualizzazione NON CRONOLOGICA...
    end else begin
      // Toglie alcuni raggruppamenti
      btvGCDATADOCUMENTO.GroupIndex         := -1;
      btvGCDATADOCUMENTO.Visible            := False;
      btvGCDATADOCUMENTO.DateTimeGrouping   := dtgDefault;
      btvGCTIPOLOGIA.GroupIndex             := -1;
      btvGCTIPOLOGIA.Visible                := True;
      // Se siamo con un cantiere selezionato...
      if GC_CantiereSelezionato then begin
        // IN ogni caso non deve essere raggruppato per pratica/cantiere (ovviamente)
        btvGCRIFPRATICA.GroupIndex            := -1;
        // Se non c'è alcun raggruppamento per la colonna TIPOLOGIA mette cmq un
        //  raggruppamento per questa colonna quale ultimo livello di raggruppamento.
        if (btvGCTIPOLOGIA.GroupIndex = -1) and (Self.GC_Col_Visible_TipologiaArticolo) then begin
          btvGCTIPOLOGIA.GroupIndex := btvGC.GroupedItemCount;
          btvGCTIPOLOGIA.Visible := False;
        end;
      // Altrimenti se non c'è alcun cantiere selezionato...
      end else begin
        // Se non è già raggruppato per RIFPRATICA (Cantiere) lo raggruppa come 1° livello
        if (btvGCRIFPRATICA.GroupIndex = -1) then btvGCRIFPRATICA.GroupIndex := 0;
        btvGCRIFPRATICA.Visible   := False;
        // Imposta l'ordinamento in modo che il fatturato sia sempre
        //  dopo i Materiali/Apparecchi, la manodopera e le spese
        btvGCTIPOLOGIA.SortOrder  := soDescending;
        btvGCTIPOLOGIA.Visible    := False;
      end;
    end;
    // Espande tutto
    btvGC.ViewData.Expand(True);  // Sostuito da apposita proprietà nel DataController.Options
    // ---------------------------------------------------------------------------
    // FINE - IMPOSTAZIONE DEI RAGGRUPPAMENTI DI DEFAULT
    // ===========================================================================


    // ===========================================================================
    // IMPOSTAZIONE QUERY PER I RIGHI DEI DOCUMENTI DA VISUALIZZARE COME DETTAGLIO
    // ---------------------------------------------------------------------------
    // Apre la query con i righi grezzi della nuova versione del GC
    if GC_CantiereSelezionato then begin
      EseguiQueryGCNew;
    end;
    // ===========================================================================

    // Si posiziona all'inizio del GC, ho fatto così perchè alla Laura Termoidraulica
    //  ava un problema che all'apertura del GC gli si posizionava sempre a metà
    //  e la cosa era molto fastidiosa
    btvGC.DataController.GotoFirst;
    btvGCRighi.DataController.GotoFirst;

    // Se tutto è andato bene conferma la transazione
    DM1.DBAzienda.CommitRetaining;
 except
    // Se invece c'è stato qualche problema annulla tutto
    DM1.DBAzienda.RollbackRetaining;
    raise;
 end;
 finally
    DM1.CloseWait;
    GridGC.EndUpdate;
 end;
end;







// Procedura che carica i dati relativi ai ricarichi e alle tariffe di manodopera
//  nel giornale di cantiere
procedure TTabGCForm.GC_CaricaTariffeRicarichi;
var
  Q: TIB_Cursor;
begin
  // Carica i dati dei ricarichi del cantiere solo se c'è un cantiere selezionato
  if ClientiForm.PraticaCorrente = '' then Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che cerca se c'è già un record relativo a questo distributore e questa filiale
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT PRZUNITOPERA1_1, PRZUNITOPERA1_2, PRZUNITOPERA1_3, PRZUNITOPERA1_4, PRZUNITOPERA1_5,');
    Q.SQL.Add('  COSTOUNITOPERA1_1, COSTOUNITOPERA1_2, COSTOUNITOPERA1_3, COSTOUNITOPERA1_4, COSTOUNITOPERA1_5,');
    Q.SQL.Add('  TIPORICARICO, RICARICOPERC, LISTINO, TIPOCOSTO, TIPORICARICOCOMEDACOMMESSA, AccorpaOperaInBacheca');
    Q.SQL.Add('FROM PRATICHE');
    Q.SQL.Add('WHERE CODICE = ' + ClientiForm.PraticaCorrente + ' AND DATAAPERTURA = ''' + ClientiForm.DataPraticaCorrenteSQL + '''');
    Q.Open;
    if not Q.Eof then begin
      if not Q.FieldByName('TIPORICARICO').IsNull then GcVisTipoRicarico.ItemIndex      := Q.FieldByName('TIPORICARICO').AsInteger;
      if not Q.FieldByName('TIPOCOSTO').IsNull then GcVisTipoCosto.ItemIndex            := Q.FieldByName('TIPOCOSTO').AsInteger;
      if not Q.FieldByName('RICARICOPERC').IsNull then GcVisRicaricoPerc.Value          := Q.FieldByName('RICARICOPERC').AsFloat;
      if not Q.FieldByName('LISTINO').IsNull      then GcVisListino.Text                := Q.FieldByName('LISTINO').AsString;

      GCVisTipoRicaricoComeDaCommessa.Checked := (Q.FieldByName('TIPORICARICOCOMEDACOMMESSA').AsString = 'T');
      GCVisAccorpaManodoperaInBacheca.Checked := (Q.FieldByName('AccorpaOperaInBacheca ').AsString = 'T');

      if not Q.FieldByName('PRZUNITOPERA1_1').IsNull then GcVisPrezzoManodopera1.Value  := Q.FieldByName('PRZUNITOPERA1_1').AsFloat;
      if not Q.FieldByName('PRZUNITOPERA1_2').IsNull then GcVisPrezzoManodopera2.Value  := Q.FieldByName('PRZUNITOPERA1_2').AsFloat;
      if not Q.FieldByName('PRZUNITOPERA1_3').IsNull then GcVisPrezzoManodopera3.Value  := Q.FieldByName('PRZUNITOPERA1_3').AsFloat;
      if not Q.FieldByName('PRZUNITOPERA1_4').IsNull then GcVisPrezzoManodopera4.Value  := Q.FieldByName('PRZUNITOPERA1_4').AsFloat;
      if not Q.FieldByName('PRZUNITOPERA1_5').IsNull then GcVisPrezzoManodopera5.Value  := Q.FieldByName('PRZUNITOPERA1_5').AsFloat;

      if not Q.FieldByName('COSTOUNITOPERA1_1').IsNull then GcVisCostoManodopera1.Value   := Q.FieldByName('COSTOUNITOPERA1_1').AsFloat;
      if not Q.FieldByName('COSTOUNITOPERA1_2').IsNull then GcVisCostoManodopera2.Value  := Q.FieldByName('COSTOUNITOPERA1_2').AsFloat;
      if not Q.FieldByName('COSTOUNITOPERA1_3').IsNull then GcVisCostoManodopera3.Value  := Q.FieldByName('COSTOUNITOPERA1_3').AsFloat;
      if not Q.FieldByName('COSTOUNITOPERA1_4').IsNull then GcVisCostoManodopera4.Value  := Q.FieldByName('COSTOUNITOPERA1_4').AsFloat;
      if not Q.FieldByName('COSTOUNITOPERA1_5').IsNull then GcVisCostoManodopera5.Value  := Q.FieldByName('COSTOUNITOPERA1_5').AsFloat;
    end;
  finally
    Q.Free
  end;
end;


// Procedura che carica i dati relativi ai ricarichi e alle tariffe di manodopera
//  nel giornale di cantiere
procedure TTabGCForm.GC_SalvaTariffeRicarichi;
var
  Q: TIB_Cursor;
begin
  // Solo se i pannelli delle tariffe e manodopere sono abilitati e solo se siamo dentro ad un cantiere
  if (ClientiForm.PraticaCorrente = '') then Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PRATICHE SET');
    Q.SQL.Add(' TIPORICARICO = ' + IntToStr(GcVisTipoRicarico.ItemIndex) + ',');

    if GCVisTipoRicaricoComeDaCommessa.Checked
      then Q.SQL.Add(' TIPORICARICOCOMEDACOMMESSA = ''T'',')
      else Q.SQL.Add(' TIPORICARICOCOMEDACOMMESSA = ''F'',');

    if GCVisAccorpaManodoperaInBacheca.Checked
      then Q.SQL.Add(' AccorpaOperaInBacheca = ''T'',')
      else Q.SQL.Add(' AccorpaOperaInBacheca = ''F'',');

    Q.SQL.Add(' TIPOCOSTO = ' + IntToStr(GcVisTipoCosto.ItemIndex) + ',');
    Q.SQL.Add(' RICARICOPERC = ' + DM1.VirgolaPunto(GcVisRicaricoPerc.Value) + ',');
    Q.SQL.Add(' LISTINO = ' + GcVisListino.Text + ',');
    Q.SQL.Add(' PRZUNITOPERA1_1 = ' + DM1.VirgolaPunto(GcVisPrezzoManodopera1.Value) + ',');
    Q.SQL.Add(' PRZUNITOPERA1_2 = ' + DM1.VirgolaPunto(GcVisPrezzoManodopera2.Value) + ',');
    Q.SQL.Add(' PRZUNITOPERA1_3 = ' + DM1.VirgolaPunto(GcVisPrezzoManodopera3.Value) + ',');
    Q.SQL.Add(' PRZUNITOPERA1_4 = ' + DM1.VirgolaPunto(GcVisPrezzoManodopera4.Value) + ',');
    Q.SQL.Add(' PRZUNITOPERA1_5 = ' + DM1.VirgolaPunto(GcVisPrezzoManodopera5.Value) + ',');
    Q.SQL.Add(' COSTOUNITOPERA1_1 = ' + DM1.VirgolaPunto(GcVisCostoManodopera1.Value) + ',');
    Q.SQL.Add(' COSTOUNITOPERA1_2 = ' + DM1.VirgolaPunto(GcVisCostoManodopera2.Value) + ',');
    Q.SQL.Add(' COSTOUNITOPERA1_3 = ' + DM1.VirgolaPunto(GcVisCostoManodopera3.Value) + ',');
    Q.SQL.Add(' COSTOUNITOPERA1_4 = ' + DM1.VirgolaPunto(GcVisCostoManodopera4.Value) + ',');
    Q.SQL.Add(' COSTOUNITOPERA1_5 = ' + DM1.VirgolaPunto(GcVisCostoManodopera5.Value));
    Q.SQL.Add('WHERE CODICE = ' + ClientiForm.PraticaCorrente + ' AND DATAAPERTURA = ''' + ClientiForm.DataPraticaCorrenteSQL + '''');
    Q.ExecSQL;
  finally
    Q.Free
  end;
end;





procedure TTabGCForm.FormShow(Sender: TObject);
begin
  inherited;
  CaricaFormLayout;
  // In base al flag sopra modifica l'apparenza della form
  //  NB: Non usare il flag
//  if GC_CantiereSelezionato then VisualizzazioneConCantiereSelezionato else VisualizzazioneConCantiereNonSelezionato;
  if (ClientiForm.PraticaCorrente <> '') then VisualizzazioneConCantiereSelezionato else VisualizzazioneConCantiereNonSelezionato;
  // Carica la memoria predefinita e la seleziona come default iniziale
  MemPredef_LoadSelection;
  RichiamaMemoria(GC_MemoriaPredefinita, False);
  // Se la query non è attiva, azzera i filtri e e effettua la ricerca automaticamente
  if (not QryGC.Active) and (not QryGC.Active) then begin
    ClientiForm.RxSpeedButtonResetQueryClick(ClientiForm.RxSpeedButtonResetQuery);
    if DM1.GoAutoquery(IDX_AUTOQUERY_GC) then begin
      ClientiForm.RxSpeedButtonTrovaClick(Self);
    end;
  end;
end;

procedure TTabGCForm.Selezionatutto1Click(Sender: TObject);
begin
  inherited;
  GC_SelezionaTutto;
end;


// Procedura che seleziona tutti i righi del GC
procedure TTabGCForm.GC_SelezionaTutto;
var
  i: Integer;
  Updating: Boolean;
  CurrentView:TcxGridDBBandedTableView;
begin
  // Se siamo nella vista nuova di dettaglio sui righi punta
  //  sulla relativa View altrimenti punta sull'altra
  if (GridGC.ActiveView = btvGCRighi) then CurrentView:=btvGCRighi else CurrentView:=btvGC;

  DM1.ShowWait('Levante', 'Seleziona tutte le righe...');
  Updating := GridGC.UpdateLocked;
  if not Updating then GridGC.BeginUpdate;
  try
    // Prima deseleziona tutto
    for i := (CurrentView.Controller.SelectedRecordCount -1) downto 0 do begin
      CurrentView.Controller.SelectedRecords[i].Selected := False;
    end;
    // Poi seleziona tutti i righi evitando i righi di gruppo
    for i := 0 to (CurrentView.ViewData.RecordCount -1) do begin
      if CurrentView.ViewData.Records[i].IsData then CurrentView.ViewData.Records[i].Selected := True;
    end;
  finally
    DM1.CloseWait;
    if not Updating then GridGC.EndUpdate;
  end;
end;

// Procedura che deseleziona tutti i righi del GC
procedure TTabGCForm.GC_DeselezionaTutto;
var
  i: Integer;
  Updating: Boolean;
  CurrentView:TcxGridDBBandedTableView;
begin
  // Se siamo nella vista nuova di dettaglio sui righi punta
  //  sulla relativa View altrimenti punta sull'altra
  if (GridGC.ActiveView = btvGCRighi) then CurrentView:=btvGCRighi else CurrentView:=btvGC;

  Updating := GridGC.UpdateLocked;
  if not Updating then GridGC.BeginUpdate;
  try
    // Prima deseleziona tutto
    for i := (CurrentView.Controller.SelectedRecordCount -1) downto 0 do begin
      CurrentView.Controller.SelectedRecords[i].Selected := False;
    end;
  finally
    if not Updating then GridGC.EndUpdate;
  end;
end;




procedure TTabGCForm.GC_CopiaRighiInBacheca(Tutti:Boolean=True);
var
  Updating: Boolean;
begin
  DM1.ShowWait('Levante', 'Copia righe in bacheca...');
  Updating := GridGC.UpdateLocked;
  if not Updating and Tutti then SBGCExpandClick(SBGCExpand);
  if not Updating then GridGC.BeginUpdate;
  try
    // Se il parametro Tutti = True seleziona tutti i righi presenti nel GC
    if Tutti then GC_SelezionaTutto;
    // Esporta i righi selezionati del Giornale di Cantiere
    if (GridGC.ActiveView = btvGCRighi)
      then EsportaNewGC
      else EsportaGC(btvGC);
    // Deseleziona tutto altrimenti sta brutto
    if Tutti then GC_DeselezionaTutto;
  finally
    DM1.CloseWait;
    if not Updating then GridGC.EndUpdate;
  end;
end;



procedure TTabGCForm.uttiirighi1Click(Sender: TObject);
begin
  inherited;
  GC_CopiaRighiInBacheca(True);
end;

procedure TTabGCForm.Sololerigheselezionate1Click(Sender: TObject);
begin
  inherited;
  GC_CopiaRighiInBacheca(False);
end;

procedure TTabGCForm.GC_CreaDoc_Conto_TutteClick(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('Estratto_conto', True);
end;




// Procedura che genera automaticamente un documento con i righi del GC
procedure TTabGCForm.GC_GeneraDocumento(TipoDoc:String; TuttiRighi:Boolean);
begin
  if DM1.Messaggi('Creazione automatica documento', 'Proseguire con la creazione automatica del documento?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;

  // Se la bacheca non è vuota avverte l'utente che deve esserlo e poi esce
  if MainForm.ListViewExpDoc.Items.Count <> 0 then begin
    DM1.Messaggi('Creazione automatica documento', 'ATTENZIONE !!!'#13#13'Quando si avvia la generazione automatica di un documento la bacheca deve essere vuota.'#13#13'L''operazione è stata annullata!', '', [mbOk], 0, nil);
    Exit;
  end;

  DM1.ShowWait('Levante', 'Copia nella bacheca...');
  try
    // Espande tutto altrimenti non funziona
    if  TuttiRighi then SBGCExpandClick(SBGCExpand);
    // Esporta nella bacheca i righi
    GC_CopiaRighiInBacheca(TuttiRighi);
    // Crea il nuovo documento
    DM1.ShowWait('Levante', 'Creazione documento...');
    DM1.NuovoDocFisc(TipoDoc,
                     '',
                     StrToIntDef(ClientiForm.ClienteCorrente, 0),
                     StrToIntDef(ClientiForm.PraticaCorrente, 0),
                     ClientiForm.DataPraticaCorrente,
                     1,
                     0,
                     False,
                     False);
    // Importa tutti i documenti presenti in Bacheca
    MainForm.Incollatuttelevocisuldocumento1Click(MainForm.Incollatuttelevocisuldocumento1);    
//    PreventiviOrdiniForm.ImportaDocFisc('CANTIERE', '', StrToInt(ClientiForm.PraticaCorrente), StrToDate(ClientiForm.DataPraticaCorrente), 0, False);
    // Dopo aver effettuato l'importazione di tutti i righi si assicura che i righi relativi alla manodopera e alle altre spese
    //  sianoposizionate alla fine del documento
    PreventiviOrdiniForm.SpostaManodoperaSpeseInFondo(FBachecaAccorpaManodopera, FBachecaAccorpaAltreSpese);
  finally
    DM1.CloseWait;
    MainForm.AggiornaDocumentiEsportati;
  end;
end;



procedure TTabGCForm.GC_CreaDoc_Conto_SelezionateClick(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('Estratto_conto', False);
end;

procedure TTabGCForm.GC_CreaDoc_Fattura_TutteClick(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('Fattura', True);
end;

procedure TTabGCForm.GC_CreaDoc_Fattura_SelezionateClick(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('Fattura', False);
end;

procedure TTabGCForm.Esportainformatotesto1Click(Sender: TObject);
var
  FileNameNoExt: String;
begin
  // Richiede all'utente il nome del file
  // NB: Prima azzera il nome del file
  DM1.TxtSaveDialog.FileName := '';
  if DM1.TxtSaveDialog.Execute then begin
    FileNameNoExt := LeftStr(DM1.TxtSaveDialog.FileName, (Length(DM1.TxtSaveDialog.FileName) - Length(ExtractFileExt(DM1.TxtSaveDialog.FileName))));
    // Verifica che il file non esista già, e se esiste chiede se lo si vuole sovrascrivere
    if FileExists(FileNameNoExt + '.txt') then begin
      if DM1.Messaggi('Esportazione', 'File già esistente !!!'#13#13'Devo proseguire e sovrascrivere il file?', 'NB: Rispondendo "SI" e quindi sovrascrivendo il file esistente i dati in esso contenuti saranno perduti.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    end;
    // Informa l'utente
    DM1.ShowWait('Esportazione Testo', 'Operazione in corso...');
    try
        // =========================================================================
        // ESPORTAZIONE DA UNA GXGRID
        // -------------------------------------------------------------------------
        GridGC.BeginUpdate;
        try;
          ExportGridToText(FileNameNoExt,                 // FileName senza estensione
                           GridGC,                        // cxGrid
                           True,                          // AExpand
                           True,                          // ASaveAll
                           #9,                            // Separator
                           '',                            // Start field delimiter
                           ''                             // End field delimiter
                          );
        finally
          GridGC.EndUpdate;
        end;
        // =========================================================================
    finally
      DM1.CloseWait;
      DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;

procedure TTabGCForm.EsportainformatoExcel1Click(Sender: TObject);
var
  FileNameNoExt: String;
begin
  // Richiede all'utente il nome del file
  // NB: Prima azzera il nome del file
  DM1.ExcelSaveDialog.FileName := '';
  if DM1.ExcelSaveDialog.Execute then begin
    FileNameNoExt := LeftStr(DM1.ExcelSaveDialog.FileName, (Length(DM1.ExcelSaveDialog.FileName) - Length(ExtractFileExt(DM1.ExcelSaveDialog.FileName))));
    // Verifica che il file non esista già, e se esiste chiede se lo si vuole sovrascrivere
    if FileExists(FileNameNoExt + '.xls') then begin
      if DM1.Messaggi('Esportazione', 'File già esistente !!!'#13#13'Devo proseguire e sovrascrivere il file?', 'NB: Rispondendo "SI" e quindi sovrascrivendo il file esistente i dati in esso contenuti saranno perduti.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    end;
    // Informa l'utente
    DM1.ShowWait('Esportazione Excel', 'Operazione in corso...');
    try
        // =========================================================================
        // ESPORTAZIONE DA UNA GXGRID
        // -------------------------------------------------------------------------
        GridGC.BeginUpdate;
        try;
          ExportGridToExcel(
                           FileNameNoExt,   // FileName senza estensione
                           GridGC,          // cxGrid
                           False,           // AExpand
                           True,            // ASaveAll
                           True,
                           'xls'            // AFileExt
                          );
        finally
          GridGC.EndUpdate;
        end;
        // =========================================================================
    finally
      DM1.CloseWait;
      DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;

procedure TTabGCForm.Selezionavista1Click(Sender: TObject);
var
   CurrGrid:TcxControl;
   CurrItemCaption:String;
begin
   // Caption della voce selezionata
   CurrItemCaption := (Sender as TMenuItem).Caption;
   // Se la Caption della voce selezionata contiene il carattere & (incasina tutto)
   //  lo toglie.
   CurrItemCaption := StringReplace(CurrItemCaption, '&', #0, [rfReplaceAll]);
   // Se la voce attuale è la radice del menu di selezione viste esce subito
   if (Sender as TMenuItem).Name = 'Selezionavista1' then Exit;
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridGC;
   // Carica la vista attuale
   if CurrGrid is TcxGrid then DM1.RipristinaDevExpress((CurrGrid as TcxGrid), CurrItemCaption, False);
   if CurrGrid is TcxDBPivotGrid then DM1.RipristinaPivotDevExpress((CurrGrid as TcxDBPivotGrid), CurrItemCaption);
end;

procedure TTabGCForm.Salvaimpostazionicolonne1Click(Sender: TObject);
var
   Vista:String;
   CurrGrid:TcxControl;
begin
   // Chiede il nome della vista
   if InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then begin
      // Controlla che la vista non sia nullo
      if Trim(Vista) = '' then raise Exception.Create('Il nome della vista non può essere vuoto.');
   end else begin
      // Se l'utente ha cliccato su Cancel annulla l'operazione
      Exit;
   end;
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridGC;
   // Carica la vista attuale
   if CurrGrid is TcxGrid then DM1.SalvaGriglieDevExpress((CurrGrid as TcxGrid), Vista, False);
   if CurrGrid is TcxDBPivotGrid then DM1.SalvaGrigliePivotDevExpress((CurrGrid as TcxDBPivotGrid), Vista);
end;

procedure TTabGCForm.Ripristinacolonneeliminate1Click(Sender: TObject);
var
  CurrGrid: TcxControl;
begin
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridGC;
   // Carica la vista attuale
   if CurrGrid is TcxGrid then (CurrGrid as TcxGrid).FocusedView.Controller.Customization := True;
   if CurrGrid is TcxDBPivotGrid then (CurrGrid as TcxDBPivotGrid).Customization.Visible := True;
end;

procedure TTabGCForm.PivotGridGCCustomization(Sender: TObject);
begin
  inherited;
  DM1.OpenPivotGridCustomizationForm((Sender as TcxDBPivotGrid));
end;



procedure TTabGCForm.cxPageControlGCPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  LChart: TChartFrame;
begin
  inherited;
  // Normalmente la PivotGrid è scollegata perchè altrimenti causa rallentamenti
  //  pesanti in presenza di molti record
  DM1.ShowWait('Levante', 'Caricamento...');
  try
    // ADA
    if NewPage = TabGCAda then
      PivotGridGC.DataSource := SourceGCAda
    else
      PivotGridGC.DataSource := nil;
    // Charts
    if NewPage = TabGCCharts then
      if IsSummaryView then
        ShowGCChart
      else
        ShowGCRighiChart;
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.EseguiQueryGCAda;
begin
 DM1.ShowWait('Giornale di Cantiere', 'Caricamento dati...');
 try
  // Imposta la query per il giornale di cantiere
  // ---------------------------------------------------------------------------
  if QryGCAda.Active then QryGCAda.Close;
  QryGCAda.SQL.Clear;
  QryGCAda.SQL.Add('SELECT DISTINCT R.CODICEARTICOLO, A.DESCRIZIONE, A.UNITADIMISURA,');
  QryGCAda.SQL.Add(' R.SOTTOCANTIERE1, R.SOTTOCANTIERE2, R.SOTTOCANTIERE3, R.SOTTOCANTIERE4, R.SOTTOCANTIERE5, R.SOTTOCANTIERE6,');
  QryGCAda.SQL.Add(' R.QTA, R.SEGNOOPERAZIONECANTIERE, R.IMPORTORIGO, R.IMPORTORIGOIVACOMPRESA,');
  QryGCAda.SQL.Add(' CAST( (SELECT SUM(M2.DISPONIBILE)  FROM MAGAZZINI M2 WHERE M2.CODICEARTICOLO = R.CODICEARTICOLO) AS NUMERIC (11,4)) AS QTADISPONIBILE');

  QryGCAda.SQL.Add('FROM RIGHIPRV R');
  QryGCAda.SQL.Add('LEFT JOIN ARTICOLI A ON (A.CODICEARTICOLO=R.CODICEARTICOLO)');
  QryGCAda.SQL.Add('INNER JOIN PRVORDCL T ON (R.TIPODOCUMENTO=T.TIPODOCUMENTO AND R.REGISTRO=T.REGISTRO AND R.NUMORDPREV=T.NUMORDPREV AND R.DATADOCUMENTO=T.DATADOCUMENTO)');
  QryGCAda.SQL.Add('WHERE R.SEGNOOPERAZIONECANTIERE<>''='' AND R.SEGNOOPERAZIONECANTIERE IS NOT NULL AND R.SEGNOOPERAZIONECANTIERE<>''''');
  // Filtra per la pratica/cantiere aperto
  QryGCAda.SQL.Add('AND ((R.Pratica = ''' + ClientiForm.PraticaCorrente + ''')AND(R.DataPratica1='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
  // Se specificato ricerca per COdiceArticolo
  if GCCodiceArticolo.Text <> '' then QryGCAda.SQL.Add('AND R.CodiceArticolo = ''' + Trim(GCCodiceArticolo.Text) + '''');
   // Se specificato lo sttato del documento
  if GCSoloStato.Text <> '' then QryGCAda.SQL.Add('AND T.StatoDescrizione = ''' + Trim(GCSoloStato.Text) + '''');
  // Filtra in base ai tipi di movimentazione selesionata
  DM1.AddSQL(QryGCAda, 'AND', '(');
   if GCCheckListBoxSegnoOperazione.Checked[0] then DM1.AddSQL(QryGCAda, '', 'R.SEGNOOPERAZIONECANTIERE = ''C'' OR');
   if GCCheckListBoxSegnoOperazione.Checked[1] then DM1.AddSQL(QryGCAda, '', 'R.SEGNOOPERAZIONECANTIERE = ''+'' OR');
   if GCCheckListBoxSegnoOperazione.Checked[2] then DM1.AddSQL(QryGCAda, '', 'R.SEGNOOPERAZIONECANTIERE = ''-'' OR');
   if GCCheckListBoxSegnoOperazione.Checked[3] then DM1.AddSQL(QryGCAda, '', 'R.SEGNOOPERAZIONECANTIERE = ''M'' OR');
   if GCCheckListBoxSegnoOperazione.Checked[4] then DM1.AddSQL(QryGCAda, '', 'R.SEGNOOPERAZIONECANTIERE = ''='' OR R.SEGNOOPERAZIONECANTIERE IS NULL OR R.SEGNOOPERAZIONECANTIERE = '''' OR');
   QryGCAda.SQL[QryGCAda.SQL.Count-1] := DM1.StrLeft(QryGCAda.SQL[QryGCAda.SQL.Count-1], Length(QryGCAda.SQL[QryGCAda.SQL.Count-1])-3);  // Elimina l'ultimo OR
  QryGCAda.SQL.Add(')');
  // Se specificate ricerca per intervallo di date
  if DM1.ControllaDataStr(GCDal.EditText) then DM1.AddSQL(QryGCAda, 'AND', 'R.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(GCDal.EditText))) + '''');
  if DM1.ControllaDataStr(GCAl.EditText)  then DM1.AddSQL(QryGCAda, 'AND', 'R.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(Trim(GCAl.EditText))) + '''');
  // Attiva la query
  QryGCAda.Open;
 finally
  DM1.CloseWait;
 end;
end;




// Funzione che rigotna il prossimo ProgRigo da assegnare ad un nuovo rigo.
function TTabGCForm.NextProgRigo:Integer;
var
  Q: TIB_Cursor;
begin
  Result := 0;
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;

    // In base alla tipologia del nuovo rigo determina da quale tabella dovrà prendere
    //  il PROGRIGO più alto assegnato fino ad ora.
    Q.SQL.Add('SELECT MAX(PROGRIGO) FROM GC_BASE_RIGHI_NEW WHERE TIPODOCUMENTO=''Giornale_cantiere'' AND NUMORDPREV=' + ClientiForm.PraticaCorrente + ' AND PRATICA=' + ClientiForm.PraticaCorrente + ' AND DATAPRATICA1 =''' + ClientiForm.DataPraticaCorrenteSQL + '''');

    // Apre la query e ricava il progressivo rigo più alto assegnato e poi gli aggiunge 1 e lo ritorna al chiamante
    Q.Open;
    if not Q.Eof then begin
      Result := Q.Fields[0].AsInteger + 1;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TTabGCForm.ModificaButtonClick(Sender: TObject);
var
   MR:TModalResult;
begin
     DM1.Attendere;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF ClientiForm.RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Avvia la transazione
          DM1.DBAzienda.StartTransaction;
          // Disabilita il main menù
          MainForm.DisabilitaMainMenu(False);
          // Attiva i campi delle tariffe
          GC_Tariffe_Enabled := True;
          GridEdit(True);
          // Modica i pulsanti e i colori dei campi per la modifica
          ClientiForm.RxSpeedButtonNuovo.Enabled         := True;
          ClientiForm.RxSpeedButtonElimina.Enabled       := True;
          ClientiForm.RxSpeedButtonStampa.Enabled        := False;
          ClientiForm.RxSpeedButtonUscita.Enabled        := False;
          ClientiForm.RxSpeedButtonTrova.Enabled         := False;
          ClientiForm.RxSpeedButtonResetQuery.Enabled    := False;
          ClientiForm.RxSpeedButtonVisualizza.Enabled    := False;
          SbGcVisPerArticolo.Enabled                     := False;
          SbGcVisCronologicoGiorno.Enabled               := False;
          SbGcVisCronologicoMese.Enabled                 := False;
          // Colora tutti i campi per la modofica
          DM1.ColoraTuttiCampi(TabGCForm, COLOR_MODIFICA);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               ClientiForm.RxSpeedModifica.Down := False;
               // Riabilita il main menù
               MainForm.AbilitaMainMenu;
          end;
       end;
     end
     else
     begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Sposta il focus in modo da salvare il valore appena inserito anche se l'utente non ha onfermato con invio
               GcVisRicaricoPerc.SetFocus;
               GridGC.SetFocus;
               // Visualizza il messaggio di operazione in corso
               DM1.ShowWait('Documento', 'Conferma...');
               try
                 // COnferma i dati
                 GC_SalvaTariffeRicarichi;
                 if QryNewGC.State <> dsBrowse then QryNewGC.Post;
                 // Commit
                 DM1.DBAzienda.CommitRetaining;
                 // Riabilita il main menù
                 MainForm.AbilitaMainMenu;
                 // Rieffettua l'interrogazione
                 ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
               finally
                 DM1.CloseWait;
               end;
          end else if MR = mrNo then begin
             // Ricarica i dati delle tariffe perchè potrebbe essere state variate
             GC_CaricaTariffeRicarichi;
             if QryNewGC.State <> dsBrowse then QryNewGC.Cancel;
             // Rollback
             DM1.DBAzienda.RollbackRetaining;
             // Riabilita il main menù
             MainForm.AbilitaMainMenu;
             // Rieffettua l'interrogazione
             ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
             // Chiude il mesaggio di attesa
             DM1.ChiudiAttendere;
          end else begin
               ClientiForm.RxSpeedModifica.Down := True;
               DM1.ChiudiAttendere;
               Exit;
          end;
          // Attiva i campi delle tariffe
          GC_Tariffe_Enabled := False;
          GridEdit(False);
          // Modica i pulsanti e i colori dei campi per la modifica
          ClientiForm.RxSpeedButtonNuovo.Enabled         := True;
          ClientiForm.RxSpeedButtonElimina.Enabled       := False;
          ClientiForm.RxSpeedButtonStampa.Enabled        := True;
          ClientiForm.RxSpeedButtonUscita.Enabled        := True;
          ClientiForm.RxSpeedButtonTrova.Enabled         := True;
          ClientiForm.RxSpeedButtonResetQuery.Enabled    := True;
          ClientiForm.RxSpeedButtonVisualizza.Enabled    := True;
          SbGcVisPerArticolo.Enabled                     := True;
          SbGcVisCronologicoGiorno.Enabled               := True;
          SbGcVisCronologicoMese.Enabled                 := True;
          // Colora tutti i campi per la modofica
          DM1.ColoraTuttiCampi(TabGCForm, COLOR_NORMALE);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               ClientiForm.RxSpeedModifica.Down := True;
               // Disabilita il main menù
               MainForm.DisabilitaMainMenu(False);
          end;
       end;
     end;
     DM1.ChiudiAttendere;
end;



procedure TTabGCForm.GridEdit(SetEdit:Boolean);
var
   i:Integer;
   tvClone:TcxGridTableView;
begin
  if QryNewGC.Active then begin
     // In base al parametro ricevuto mette la griglia del corpo documento
     //  in modalità di editing oppure no
//     btvGCRighi.OptionsData.Appending         := SetEdit;
     btvGCRighi.OptionsData.Editing           := SetEdit;
//     btvGCRighi.OptionsData.Inserting         := SetEdit;
  end;
end;




procedure TTabGCForm.MaterialiApparecchi1Click(Sender: TObject);
begin
   DM1.Attendere;
   try
      // Visualizza la form che permette di selezionare l'articolo da inserire
      //  nel documento.
      Application.CreateForm(TArticoliForm, ArticoliForm);
      ArticoliForm.Parent := MainForm;
      ArticoliForm.Tag := 990;   // Abilita la seleziona dell'articolo
      ArticoliForm.AddMode := AM_Append;
      ArticoliForm.Show;
   finally
      DM1.ChiudiAttendere;
   end;
end;





// Procedure che riceve i codici articolo da caricare come nuovo rigo di documento
procedure TTabGCForm.InserisciNuovoRigoCantiere(CodArt,StmCodArt:String; CodMag:String; Mode:TAddArtMode; Qta:Double = 0; RicalcoloTotali:Boolean=True);
var
   y : Integer;
   Qry: TIBOQuery;
   DC:TcxDBDataController;
   GoRichiediQta: Boolean;
begin
  // Verifica dei parametri ricevuti
  if CodArt = '' then raise Exception.Create('Codice articolo non valido.');

  // DC Punta al DataController che attualmente ha il focus
  DC := GridGC.FocusedView.DataController as TcxDBDataController;
  // Y contiene la coordinata Y della cella selezionata
  y := DC.FocusedRecordIndex;

  // Crea Qry
  Qry := TIBOQuery.Create(Self);
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta la query che caricherà i dati dell'articol
    Qry.SQL.Add('SELECT * FROM DOC_NUOVO_RIGO_DOCUMENTO(:P_MAINCODART, :P_STMCODART)');
    // Imposta i parametri della query
    Qry.Prepare;
    Qry.Params.ParamByName('P_MAINCODART').AsString := CodArt;
    if StmCodArt <> '' then Qry.Params.ParamByName('P_STMCODART').AsString := StmCodArt;
    // Apre la query
    Qry.Open;

    // Ovviamente se non trova l'articolo l'operazione non può continuare
    if Qry.Eof then raise Exception.Create('Codice articolo non trovato!');

    // Blocca il painting della griglia sullo schermo per velocizzare l'esecuzione dei calcoli
    //  NB. Tolto perchè altrimenti dava problemi
//    DC.BeginUpdate;

    // Se non c'è alcun record selezionato forza l'Append del nuovo rigo
    //  altrimenti dà un errore.
    if DC.FocusedRecordIndex = -1 then Mode := AM_Append;
    // Y contiene la coordinata Y della cella selezionata
    y := DC.FocusedRecordIndex;
    // Questa riga è stata aggiunta per risolvere alcuni problemi.
    //  Non ho ben capito perchè funziona però funziona quindi non toglierla.
    //  Il problema accadeva quando ad esempio avevo un documento con 1 riga
    //  e quando io aggiungevo un articolo con il codice dopo aver aver modificato
    //  un campo del rigo già esistente il nuovo articolo appariva prima del rigo
    //  e non in fondo. Così va tutto bene.
    DC.FocusedRecordIndex := -1;

     // In base alla modalità modifica il rigo corrente oppure fà un append o un insert.
     case Mode of
       AM_Append: DC.DataSet.Append;
       AM_Insert: DC.DataSet.Insert;
     end;

     try
       // Procedura che imposta la proprietà InsertSQL della IBOQuery per poter inserire
       //  un rigo di Materiali / Apparecchi
       //  NB: Prima era all'inizio della procedura ma dava dei problemi con i righi inseriti
       //       direttamente nel GC ora qui va bene
       SetMaterialiApparecchiInsertSQL;
       SetMaterialiApparecchiUpdateSQL;

       // Inizializzazione del nuovo record
       DC.DataSet.FieldByName('GC_SEZIONE').Value  := 'Giacenza';
       DC.DataSet.FieldByName('TIPOLOGIA').Value  := 'Materiali / Apparecchi';

       // Prima di tutto imposta il magazzino che il rigo deve movimentare
       DC.DataSet.FieldByName('CODICEMAGAZZINO').AsInteger  := StrToInt(CodMag);
       // Inizia ad importare l'articolo
       DC.DataSet.FieldByName('CODICEARTICOLOREALE').AsString := Qry.FieldByName('CodiceArticolo').AsString;
       DC.DataSet.FieldByName('CODICEARTICOLO').AsString      := Qry.FieldByName('CodiceArticoloStm').AsString;
       // Se è impostato un limite per la lunghezza della descrizione...
       if DM1.LunghezzaMaxDescrizioneArticolo <> 0
       then DC.DataSet.FieldByName('DESCRIZIONE').AsString  := LeftStr(Qry.FieldByName('Descrizione').AsString, DM1.LunghezzaMaxDescrizioneArticolo)
       else DC.DataSet.FieldByName('DESCRIZIONE').AsString  := Qry.FieldByName('Descrizione').AsString;
       DC.DataSet.FieldByName('GC_DESCRIZIONE').AsString := DC.DataSet.FieldByName('DESCRIZIONE').AsString;
       // Continua con il caricamento dell'articolo
       DC.DataSet.FieldByName('UNITADIMISURA').AsString           := Qry.FieldByName('UnitaDiMisura').AsString;
       DC.DataSet.FieldByName('GC_COSTONETTOUNITARIO').AsFloat    := Qry.FieldByName('CostoReale').AsFloat;

       // Se il parametro Qta = 0 allora si defaultizza al valore indicato dal campo
       //  QtaAutomatica nell'amagrafica dell'articolo stesso, oppure se il flag
       //  apposito abilita alla richiesta immediata della qta all'operatore...
       GoRichiediQta := (Qta = 0);
       if Qta = 0 then begin
         if Qry.FieldByName('QuantitaAutomatica').IsNull then Qta := 1 else Qta := Qry.FieldByName('QuantitaAutomatica').AsFloat;
       end;
  //         if DM1.RichiediQta and GoRichiediQta then begin
       if GoRichiediQta then begin
         Qta := DM1.ChiediQtaArticolo(Qry.FieldByName('CodiceArticolo').AsString
                                     ,LeftStr(Qry.FieldByName('Descrizione').AsString, 60)
                                     ,Qry.FieldByName('UnitaDiMisura').AsString
                                     ,Qta);
       end;
       DC.DataSet.FieldByName('GC_QTA').AsFloat := Qta;
       // Conferma il dato e si posiziona su di esso
       DC.DataSet.Post;
       TabGCForm.btvGCRighi.Controller.ClearSelection;
       TabGCForm.btvGCRighi.Controller.FocusedRecord.Selected := True;
       TabGCForm.GridGC.SetFocus;
     except
       DC.DataSet.Cancel;
     end;

  finally
    DM1.CloseWait;
    Qry.Close;
    Qry.Free;
    // Riabilita il painting del componente forzando così l'aggiornamento dello schermo
    //  NB. Tolto perchè altrimenti dava problemi
//    DC.EndUpdate;
  end;
end;






procedure TTabGCForm.NuovoRigoMaterialiApparecchi(CodTutti,CodArt,CodBarre,CodForn:String; Mode:TAddArtMode; Qta:Double = 0);
var
   y : Integer;
   Qry: TIBOQuery;
   TmpStr:String;
   DC:TcxDBDataController;
   GoRichiediQta: Boolean;
   NumRecFound: Integer;
begin
   // Se i codici sono tutti nulli esce
   if (CodTutti = '')and(CodArt = '')and(CodBarre = '')and(CodForn = '') then Exit;

   // DC Punta al DataController che attualmente ha il focus
   DC := GridGC.FocusedView.DataController as TcxDBDataController;

   // Blocca il painting della griglia sullo schermo per velocizzare l'esecuzione dei calcoli
   //  NB. Tolto perchè altrimenti dava problemi
//   DC.BeginUpdate;
   // Se non c'è alcun record selezionato forza l'Append del nuovo rigo
   //  altrimenti dà un errore.
   if DC.FocusedRecordIndex = -1 then Mode := AM_Append;
   // Y contiene la coordinata Y della cella selezionata
   y := DC.FocusedRecordIndex;

   // Questa riga è stata aggiunta per risolvere alcuni problemi.
   //  Non ho ben capito perchè funziona però funziona quindi non toglierla.
   //  Il problema accadeva quando ad esempio avevo un documento con 1 riga
   //  e quando io aggiungevo un articolo con il codice dopo aver aver modificato
   //  un campo del rigo già esistente il nuovo articolo appariva prima del rigo
   //  e non in fondo. Così va tutto bene.
   DC.FocusedRecordIndex := -1;

   // Crea Qry
   Qry := TIBOQuery.Create(Self);
   DM1.ShowWait('Levante', 'Operazione in corso...');
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;

      // Cerca l'articolo desiderato
      Qry.SQL.Add('SELECT DISTINCT(A.CodiceArticolo), A.Descrizione, A.Descrizione2, A.Descrizione3, A.Descrizione4, A.Descrizione5, A.UnitaDiMisura, A.UltimoPrzAcquisto,');
      Qry.SQL.Add('       A.QuantitaAutomatica, A.PrezzoDiVendita, A.PrezzoDiVendita2, A.PrezzoDiVendita3, A.PrezzoDiVendita4, A.CodiceIVA, A.ScortaMinima, A.AbilitaMovMag,');
      Qry.SQL.Add('       A.PrezzoDiListino, A.ScontoListino1, A.ScontoListino2, A.ScontoListino3, A.ScontoListino4, A.ArticoloComposto, A.QtaOpera,');
      Qry.SQL.Add('       A.Ricarico, A.Ricarico2, A.Ricarico3, A.Ricarico4, A.MinutiPrevisti, A.ScontoDiAcquisto, A.ScontoDiAcquisto2, A.ScontoDiAcquisto3, A.CostoReale,');
      Qry.SQL.Add('       A.TIPO1, A.TIPO2, A.TIPO3, A.TIPO4, A.TIPO5, A.TIPO6');
      Qry.SQL.Add('FROM Articoli A');
      // Costruisce la Stringa con le clausole di where dei codici per la ricerca dell'articolo
      TmpStr := '';

      // Se è specificato il parametro TuttiCod cerca indistintamente per tutti i codici altrimenti
      //  per i singoli codici
      //  NB: Nei codici aggiuntivi i codici possono essere racchiusi tra <> e []
      // -----------------------------------------------------------------------
      if CodTutti <> '' then begin
        TmpStr := '';
        // Se è abilitata la ricerca per codice principale
        if DM1.TableProgressiviRICART_CODICEPRINC.AsString <> 'F' then begin
          if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
          TmpStr := TmpStr + 'A.CodiceArticolo LIKE ''' + CodTutti + '''';
        end;
        // Se è abilitata la ricerca per Barcode
        if DM1.TableProgressiviRICART_BARCODE.AsString <> 'F' then begin
          if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
          TmpStr := TmpStr + 'A.BarCode LIKE  ''' + CodTutti + '''';
        end;
        // Se è abilitata la ricerca per Codice articolo fornitore
        if DM1.TableProgressiviRICART_CODICEFORN.AsString <> 'F' then begin
          if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
          TmpStr := TmpStr + 'A.CodiceFornitore LIKE  ''' + CodTutti + '''';
        end;
        // Se è abilitata la ricerca per Codici aggiuntivi
        if DM1.TableProgressiviRICART_CODAGG.AsString <> 'F' then begin
          if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
          TmpStr := TmpStr + '(CodiciAggiuntivi LIKE  ''%<' + CodTutti + '>%'' OR A.CodiciAggiuntivi LIKE  ''%[' + CodTutti + ']%'')';
        end;
        // Se è abilitata la ricerca per il sistema di gestione dei listini fornitori
        if DM1.TableProgressiviRICART_LISTFORN.AsString <> 'F' then begin
          if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
          TmpStr := TmpStr + 'EXISTS (SELECT LF.CODICEARTICOLO FROM LISTFORN LF WHERE LF.CODICEARTICOLO = A.CODICEARTICOLO AND LF.CODICEARTICOLOFORNITORE LIKE ''' + CodTutti + ''')';
        end;
      end else begin
         if CodArt    <> '' then TmpStr := TmpStr + 'CodiceArticolo = ''' + CodArt + ''' OR ';
         if CodBarre  <> '' then TmpStr := TmpStr + 'BarCode = ''' + CodBarre + ''' OR ';
         if CodForn   <> '' then TmpStr := TmpStr + 'CodiceFornitore = ''' + CodForn + ''' OR ';
         TmpStr := DM1.StrLeft(TmpStr, Length(TmpStr) - 4);   // Elimina l'ultimo OR
      end;
      // Aggiunge le condizioni rilevate
      if TmpStr <> '' then Qry.SQL.Add('WHERE (' + TmpStr + ')');
      // Se è stata specificata una restrizione nel'accesso alle risorse
      //  dell'agenda per utente la applica
      if DM1.LimitazioniArticoliPerUtente <> '' then begin
        if TmpStr = '' then Qry.SQL.Add('WHERE') else Qry.SQL.Add(' AND ');
        Qry.SQL.Add('(' + DM1.LimitazioniArticoliPerUtente + ')');
      end;
      // -----------------------------------------------------------------------

      // Apre la query
      Qry.Open;

      // Indica se si sono trovati più di un articolo oppure no
      NumRecFound := Qry.RecordCount;

      // Se trova un solo articolo lo importa direttamente nel documento
      if NumRecFound = 1 then begin

         // CodArt Ora contiene il codice articolo dell'articolo trovato dalla query
         //  (In questo modo anche se ei era cercato l'articolo per altri tipi di codice, non ci sono problemi)
         CodArt := Qry.FieldByName('CodiceArticolo').AsString;

         // In base alla modalità modifica il rigo corrente oppure fà un append o un isert.
         case Mode of
            AM_Append: DC.DataSet.Append;
            AM_Insert: DC.DataSet.Insert;
         end;
         try
           // y punta al record corrente
           y := DC.FocusedRecordIndex;

           // Procedura che imposta la proprietà InsertSQL della IBOQuery per poter inserire
           //  un rigo di Materiali / Apparecchi
           //  NB: Prima era all'inizio della procedura ma dava dei problemi con i righi inseriti
           //       direttamente nel GC ora qui va bene
           SetMaterialiApparecchiInsertSQL;
           SetMaterialiApparecchiUpdateSQL;

           // Inizializzazione del nuovo record
           DC.DataSet.FieldByName('GC_SEZIONE').Value  := 'Giacenza';
           DC.DataSet.FieldByName('TIPOLOGIA').Value  := 'Materiali / Apparecchi';

           // Prima di tutto imposta il magazzino che il rigo deve movimentare
           DC.DataSet.FieldByName('CODICEMAGAZZINO').AsInteger  := StrToInt(DM1.MagazzinoDefault);
           // Inizia ad importare l'articolo
           DC.DataSet.FieldByName('CODICEARTICOLO').AsString    := Qry.FieldByName('CodiceArticolo').AsString;
           // Se è impostato un limite per la lunghezza della descrizione...
           if DM1.LunghezzaMaxDescrizioneArticolo <> 0
           then DC.DataSet.FieldByName('DESCRIZIONE').AsString  := LeftStr(Qry.FieldByName('Descrizione').AsString, DM1.LunghezzaMaxDescrizioneArticolo)
           else DC.DataSet.FieldByName('DESCRIZIONE').AsString  := Qry.FieldByName('Descrizione').AsString;
           DC.DataSet.FieldByName('GC_DESCRIZIONE').AsString := DC.DataSet.FieldByName('DESCRIZIONE').AsString;
           // Continua con il caricamento dell'articolo
           DC.DataSet.FieldByName('UNITADIMISURA').AsString           := Qry.FieldByName('UnitaDiMisura').AsString;
           DC.DataSet.FieldByName('GC_COSTONETTOUNITARIO').AsFloat    := Qry.FieldByName('CostoReale').AsFloat;

           // Se il parametro Qta = 0 allora si defaultizza al valore indicato dal campo
           //  QtaAutomatica nell'amagrafica dell'articolo stesso, oppure se il flag
           //  apposito abilita alla richiesta immediata della qta all'operatore...
           GoRichiediQta := (Qta = 0);
           if Qta = 0 then begin
             if Qry.FieldByName('QuantitaAutomatica').IsNull then Qta := 1 else Qta := Qry.FieldByName('QuantitaAutomatica').AsFloat;
           end;
  //         if DM1.RichiediQta and GoRichiediQta then begin
           if GoRichiediQta then begin
             Qta := DM1.ChiediQtaArticolo(Qry.FieldByName('CodiceArticolo').AsString
                                         ,LeftStr(Qry.FieldByName('Descrizione').AsString, 60)
                                         ,Qry.FieldByName('UnitaDiMisura').AsString
                                         ,Qta);
           end;
           DC.DataSet.FieldByName('GC_QTA').AsFloat := Qta;
           // Conferma il dato e si posiziona su di esso
           DC.DataSet.Post;
           TabGCForm.btvGCRighi.Controller.ClearSelection;
           TabGCForm.btvGCRighi.Controller.FocusedRecord.Selected := True;
           TabGCForm.GridGC.SetFocus;
         except
           DC.DataSet.Cancel;
         end;

      // -----------------------------------------------------------------------------
      // Se invece ne trova più di uno visualizza l'elenco per permettere di scegliere
      // -----------------------------------------------------------------------------
      end else if NumRecFound > 1 then begin

         // Prima ripristina il focused record index che precedentemente avevo forzato a -1 per
         //  risolvere un problema spiegato più sopra. Se non ripristino il valore del FocusedRecordIndex
         //  succede che nel caso il codice inserito sia in più articoli quando l'utente seleziona
         //  l'articolo voluto tra quelli  trovati lo inserisce in una nuova riga e non su quella
         //  su cui ha scritto il codice articolo da ceercare (ovviamente nel caso avesse inserito
         //  il codice voluto direttamente sul rigo).
         DC.FocusedRecordIndex := y;
         DM1.SelezionaArticolo(CodTutti, '', Mode, 0);

      // Altrimenti significa che non ha trovato alcun articolo e quindi ritorna un errore
      end else begin

         MessageBeep(0);
         MessageDlg('Articolo non trovato !', mtError, [mbOK], 0)

      end;
      Qry.Close;
   finally
      DM1.CloseWait;
      Qry.Free;
   end;
end;


// Funzione che ritorna True se il rigo attuale è un rigo aggiunto nel Giornale di Cantiere
//  e non relativo ad un documento.
function TTabGCForm.IsRigoGiornaleCantiere(CampoTipoDoc:TField): Boolean;
begin
  Result := CampoTipoDoc.AsString = 'Giornale_cantiere';
end;


function TTabGCForm.IsSummaryView: Boolean;
begin
  Result := SbGcVisPerArticolo.Down or SbGcVisCronologicoGiorno.Down or SbGcVisCronologicoMese.Down;
end;

// Procedura che imposta la proprietà InsertSQL della IBOQuery per poter inserire
//  un rigo di Materiali / Apparecchi
procedure TTabGCForm.SetMaterialiApparecchiInsertSQL;
begin
  with QryNewGC do begin
      InsertSQL.Clear;
      InsertSQL.Add('INSERT INTO RIGHIPRV (');
      InsertSQL.Add(' TIPODOCUMENTO,');
      InsertSQL.Add(' NUMORDPREV,');
      InsertSQL.Add(' REGISTRO,');
      InsertSQL.Add(' DATADOCUMENTO,');
      InsertSQL.Add(' PROGRIGO,');
      InsertSQL.Add(' PROGRIGO2,');
      InsertSQL.Add(' CODICECLIENTE,');
      InsertSQL.Add(' SEGNOOPERAZIONECANTIERE,');
      InsertSQL.Add(' PRATICA,');
      InsertSQL.Add(' DATAPRATICA1,');
      InsertSQL.Add(' CODICEARTICOLO,');
      InsertSQL.Add(' CODICEARTICOLOSTM,');
      InsertSQL.Add(' DESCRIZIONE,');
      InsertSQL.Add(' UNITADIMISURA,');
      InsertSQL.Add(' NOTERIGO,');
      InsertSQL.Add(' SOTTOCANTIERE1,');
      InsertSQL.Add(' SOTTOCANTIERE2,');
      InsertSQL.Add(' SOTTOCANTIERE3,');
      InsertSQL.Add(' GC_DESCRIZIONE_MOD,');
      InsertSQL.Add(' GC_DESCRIZIONE,');
      InsertSQL.Add(' GC_QTA_MOD,');
      InsertSQL.Add(' GC_QTA,');
      InsertSQL.Add(' GC_COSTONETTOUNITARIO_MOD,');
      InsertSQL.Add(' GC_COSTONETTOUNITARIO,');
      InsertSQL.Add(' GC_RICARICO_MOD,');
      InsertSQL.Add(' GC_RICARICO,');
      InsertSQL.Add(' GUID,');
      InsertSQL.Add(' GUID_REF,');
      InsertSQL.Add(' GUID_ANCESTOR');
      InsertSQL.Add(') VALUES (');
      InsertSQL.Add(' :TIPODOCUMENTO,');
      InsertSQL.Add(' :NUMORDPREV,');
      InsertSQL.Add(' :REGISTRO,');
      InsertSQL.Add(' :DATADOCUMENTO,');
      InsertSQL.Add(' :PROGRIGO,');
      InsertSQL.Add(' :PROGRIGO2,');
      InsertSQL.Add(' :CODICECLIENTE,');
      InsertSQL.Add(' :SEGNOOPERAZIONECANTIERE,');
      InsertSQL.Add(' :PRATICA,');
      InsertSQL.Add(' :DATAPRATICA1,');
      InsertSQL.Add(' :CODICEARTICOLOREALE,');
      InsertSQL.Add(' :CODICEARTICOLO,');
      InsertSQL.Add(' :DESCRIZIONE,');
      InsertSQL.Add(' :UNITADIMISURA,');
      InsertSQL.Add(' :NOTERIGO,');
      InsertSQL.Add(' :SOTTOCANTIERE1,');
      InsertSQL.Add(' :SOTTOCANTIERE2,');
      InsertSQL.Add(' :SOTTOCANTIERE3,');
      InsertSQL.Add(' :GC_DESCRIZIONE_MOD,');
      InsertSQL.Add(' :GC_DESCRIZIONE,');
      InsertSQL.Add(' :GC_QTA_MOD,');
      InsertSQL.Add(' :GC_QTA,');
      InsertSQL.Add(' :GC_COSTONETTOUNITARIO_MOD,');
      InsertSQL.Add(' :GC_COSTONETTOUNITARIO,');
      InsertSQL.Add(' :GC_RICARICO_MOD,');
      InsertSQL.Add(' :GC_RICARICO,');
      InsertSQL.Add(' :GUID,');
      InsertSQL.Add(' :GUID_REF,');
      InsertSQL.Add(' :GUID_ANCESTOR');
      InsertSQL.Add(')');
  end;
end;

// Procedura che imposta la proprietà InsertSQL della IBOQuery per poter inserire
//  un rigo di manodopera
procedure TTabGCForm.SetManodoperaInsertSQL;
begin
  with QryNewGC do begin
      InsertSQL.Clear;
      InsertSQL.Add('INSERT INTO RAPGIORNRIGHI (');
      InsertSQL.Add(' TIPODOC,');
      InsertSQL.Add(' REGISTRO,');
      InsertSQL.Add(' NUMDOC,');
      InsertSQL.Add(' DATADOC,');
      InsertSQL.Add(' NUMRIGO,');
      InsertSQL.Add(' NUMRIGO2,');
      InsertSQL.Add(' CODDIPENDENTE,');
      InsertSQL.Add(' DESCRIZDIPENDENTE,');
      InsertSQL.Add(' CODCANTIERE,');
      InsertSQL.Add(' DATACANTIERE,');
      InsertSQL.Add(' DESCRIZCANTIERE,');
      InsertSQL.Add(' CODSOGGETTO,');
      InsertSQL.Add(' DESCRIZSOGGETTO,');
      InsertSQL.Add(' NOTE,');
      InsertSQL.Add(' QTA,');
      InsertSQL.Add(' COSTOORARIO,');
      InsertSQL.Add(' IMPORTOCOSTOORARIO,');
      InsertSQL.Add(' VERSIONE,');
      InsertSQL.Add(' OPERAINDEX,');
      InsertSQL.Add(' SEGNOOPERAZIONECANTIERE,');
      InsertSQL.Add(' SOTTOCANTIERE1,');
      InsertSQL.Add(' SOTTOCANTIERE2,');
      InsertSQL.Add(' SOTTOCANTIERE3,');
      InsertSQL.Add(' GC_DESCRIZIONE_MOD,');
      InsertSQL.Add(' GC_DESCRIZIONE,');
      InsertSQL.Add(' GC_QTA_MOD,');
      InsertSQL.Add(' GC_QTA,');
      InsertSQL.Add(' GC_COSTONETTOUNITARIO_MOD,');
      InsertSQL.Add(' GC_COSTONETTOUNITARIO,');
      InsertSQL.Add(' GC_RICARICO_MOD,');
      InsertSQL.Add(' GC_RICARICO,');
      InsertSQL.Add(' GUID,');
      InsertSQL.Add(' GUID_REF,');
      InsertSQL.Add(' GUID_ANCESTOR');
      InsertSQL.Add(') VALUES (');
      InsertSQL.Add(' :TIPODOCUMENTO,');
      InsertSQL.Add(' :REGISTRO,');
      InsertSQL.Add(' :NUMORDPREV,');
      InsertSQL.Add(' :DATADOCUMENTO,');
      InsertSQL.Add(' :PROGRIGO,');
      InsertSQL.Add(' :PROGRIGO2,');
      InsertSQL.Add(' :CODICEMAGAZZINO,');
      InsertSQL.Add(' :DESCRIZIONE,');
      InsertSQL.Add(' :PRATICA,');
      InsertSQL.Add(' :DATAPRATICA1,');
      InsertSQL.Add(' :RIFPRATICA,');
      InsertSQL.Add(' :CODICECLIENTE,');
      InsertSQL.Add(' :SOGGETTO,');
      InsertSQL.Add(' :NOTERIGO,');
      InsertSQL.Add(' :QTA,');
      InsertSQL.Add(' :PREZZOACQUISTOARTICOLO,');
      InsertSQL.Add(' :IMPORTOACQUISTOARTICOLO,');
      InsertSQL.Add(' ' + IntToStr(MainForm.PrgVersion) + ',');
      InsertSQL.Add(' :OPERAINDEX,');
      InsertSQL.Add(' :SEGNOOPERAZIONECANTIERE,');
      InsertSQL.Add(' :SOTTOCANTIERE1,');
      InsertSQL.Add(' :SOTTOCANTIERE2,');
      InsertSQL.Add(' :SOTTOCANTIERE3,');
      InsertSQL.Add(' :GC_DESCRIZIONE_MOD,');
      InsertSQL.Add(' :GC_DESCRIZIONE,');
      InsertSQL.Add(' :GC_QTA_MOD,');
      InsertSQL.Add(' :GC_QTA,');
      InsertSQL.Add(' :GC_COSTONETTOUNITARIO_MOD,');
      InsertSQL.Add(' :GC_COSTONETTOUNITARIO,');
      InsertSQL.Add(' :GC_RICARICO_MOD,');
      InsertSQL.Add(' :GC_RICARICO,');
      InsertSQL.Add(' :GUID,');
      InsertSQL.Add(' :GUID_REF,');
      InsertSQL.Add(' :GUID_ANCESTOR');
      InsertSQL.Add(')');
  end;
end;

// Procedura che imposta la proprietà UpdateSQL della IBOQuery per poter modificare
//  un rigo di manodopera
procedure TTabGCForm.SetManodoperaUpdateSQL;
begin
  with QryNewGC do begin
      EditSQL.Clear;
      EditSQL.Add('UPDATE RAPGIORNRIGHI SET');
      EditSQL.Add(' TIPODOC = :TIPODOCUMENTO,');
      EditSQL.Add(' REGISTRO = :REGISTRO,');
      EditSQL.Add(' NUMDOC = :NUMORDPREV,');
      EditSQL.Add(' DATADOC = :DATADOCUMENTO,');
      EditSQL.Add(' NUMRIGO = :PROGRIGO,');
      EditSQL.Add(' NUMRIGO2 = :PROGRIGO2,');
      EditSQL.Add(' CODDIPENDENTE = :CODICEMAGAZZINO,');
      EditSQL.Add(' DESCRIZDIPENDENTE = :DESCRIZIONE,');
      EditSQL.Add(' NOTE = :NOTERIGO,');
      EditSQL.Add(' CODCANTIERE = :PRATICA,');
      EditSQL.Add(' DATACANTIERE = :DATAPRATICA1,');
      EditSQL.Add(' DESCRIZCANTIERE = :RIFPRATICA,');
      EditSQL.Add(' CODSOGGETTO = :CODICECLIENTE,');
      EditSQL.Add(' DESCRIZSOGGETTO = :SOGGETTO,');
      EditSQL.Add(' QTA = :QTA,');
      EditSQL.Add(' COSTOORARIO = :PREZZOACQUISTOARTICOLO,');
      EditSQL.Add(' IMPORTOCOSTOORARIO = :IMPORTOACQUISTOARTICOLO,');
      EditSQL.Add(' VERSIONE = ' + IntToStr(MainForm.PrgVersion) + ',');
      EditSQL.Add(' OPERAINDEX = :OPERAINDEX,');
      EditSQL.Add(' SEGNOOPERAZIONECANTIERE = :SEGNOOPERAZIONECANTIERE,');
      EditSQL.Add(' SOTTOCANTIERE1 = :SOTTOCANTIERE1,');
      EditSQL.Add(' SOTTOCANTIERE2 = :SOTTOCANTIERE2,');
      EditSQL.Add(' SOTTOCANTIERE3 = :SOTTOCANTIERE3,');
      EditSQL.Add(' GC_DESCRIZIONE_MOD = :GC_DESCRIZIONE_MOD,');
      EditSQL.Add(' GC_DESCRIZIONE = :GC_DESCRIZIONE,');
      EditSQL.Add(' GC_QTA_MOD = :GC_QTA_MOD,');
      EditSQL.Add(' GC_QTA = :GC_QTA,');
      EditSQL.Add(' GC_COSTONETTOUNITARIO_MOD = :GC_COSTONETTOUNITARIO_MOD,');
      EditSQL.Add(' GC_COSTONETTOUNITARIO = :GC_COSTONETTOUNITARIO,');
      EditSQL.Add(' GC_RICARICO_MOD = :GC_RICARICO_MOD,');
      EditSQL.Add(' GC_RICARICO = :GC_RICARICO,');
      EditSQL.Add(' GUID = :GUID,');
      EditSQL.Add(' GUID_REF = :GUID_REF,');
      EditSQL.Add(' GUID_ANCESTOR = :GUID_ANCESTOR');
      EditSQL.Add('WHERE');
      EditSQL.Add(' TIPODOC = :OLD_TIPODOCUMENTO');
      EditSQL.Add(' AND REGISTRO = :OLD_REGISTRO');
      EditSQL.Add(' AND NUMDOC = :OLD_NUMORDPREV');
      EditSQL.Add(' AND DATADOC = :OLD_DATADOCUMENTO');
      EditSQL.Add(' AND NUMRIGO = :OLD_PROGRIGO');
      EditSQL.Add(' AND NUMRIGO2 = :OLD_PROGRIGO2');
  end;
end;

// Procedura che imposta la proprietà UpdateSQL della IBOQuery per poter modificare
//  un rigo di Materiali / Apparecchi
procedure TTabGCForm.SetMaterialiApparecchiUpdateSQL;
begin
  with QryNewGC do begin
      EditSQL.Clear;
      EditSQL.Add('UPDATE RIGHIPRV SET');
      EditSQL.Add(' TIPODOCUMENTO = :TIPODOCUMENTO,');
      EditSQL.Add(' NUMORDPREV = :NUMORDPREV,');
      EditSQL.Add(' REGISTRO = :REGISTRO,');
      EditSQL.Add(' DATADOCUMENTO = :DATADOCUMENTO,');
      EditSQL.Add(' PROGRIGO = :PROGRIGO,');
      EditSQL.Add(' PROGRIGO2 = :PROGRIGO2,');
      EditSQL.Add(' CODICECLIENTE = :CODICECLIENTE,');
      EditSQL.Add(' SEGNOOPERAZIONECANTIERE = :SEGNOOPERAZIONECANTIERE,');
      EditSQL.Add(' PRATICA = :PRATICA,');
      EditSQL.Add(' DATAPRATICA1 = :DATAPRATICA1,');
      EditSQL.Add(' CODICEARTICOLO = :CODICEARTICOLOREALE,');
      EditSQL.Add(' CODICEARTICOLOSTM = :CODICEARTICOLO,');
      EditSQL.Add(' DESCRIZIONE = :DESCRIZIONE,');
      EditSQL.Add(' UNITADIMISURA = :UNITADIMISURA,');
      EditSQL.Add(' NOTERIGO = :NOTERIGO,');
      EditSQL.Add(' SOTTOCANTIERE1 = :SOTTOCANTIERE1,');
      EditSQL.Add(' SOTTOCANTIERE2 = :SOTTOCANTIERE2,');
      EditSQL.Add(' SOTTOCANTIERE3 = :SOTTOCANTIERE3,');
      EditSQL.Add(' GC_DESCRIZIONE_MOD = :GC_DESCRIZIONE_MOD,');
      EditSQL.Add(' GC_DESCRIZIONE = :GC_DESCRIZIONE,');
      EditSQL.Add(' GC_QTA_MOD = :GC_QTA_MOD,');
      EditSQL.Add(' GC_QTA = :GC_QTA,');
      EditSQL.Add(' GC_COSTONETTOUNITARIO_MOD = :GC_COSTONETTOUNITARIO_MOD,');
      EditSQL.Add(' GC_COSTONETTOUNITARIO = :GC_COSTONETTOUNITARIO,');
      EditSQL.Add(' GC_RICARICO_MOD = :GC_RICARICO_MOD,');
      EditSQL.Add(' GC_RICARICO = :GC_RICARICO,');
      EditSQL.Add(' GUID = :GUID,');
      EditSQL.Add(' GUID_REF = :GUID_REF,');
      EditSQL.Add(' GUID_ANCESTOR = :GUID_ANCESTOR');
      EditSQL.Add('WHERE');
      EditSQL.Add(' TIPODOCUMENTO = :OLD_TIPODOCUMENTO');
      EditSQL.Add(' AND REGISTRO = :OLD_REGISTRO');
      EditSQL.Add(' AND NUMORDPREV = :OLD_NUMORDPREV');
      EditSQL.Add(' AND DATADOCUMENTO = :OLD_DATADOCUMENTO');
      EditSQL.Add(' AND PROGRIGO = :OLD_PROGRIGO');
      EditSQL.Add(' AND PROGRIGO2 = :OLD_PROGRIGO2');
  end;
end;

// Procedura che imposta la proprietà UpdateSQL della IBOQuery per poter modificare
//  un rigo di AltreSpese
procedure TTabGCForm.SetAltreSpeseUpdateSQL;
begin
  with QryNewGC do begin
      EditSQL.Clear;
      EditSQL.Add('UPDATE RAPGIORNRIGHISPESE SET');
      EditSQL.Add(' TIPODOC = :TIPODOCUMENTO,');
      EditSQL.Add(' REGISTRO = :REGISTRO,');
      EditSQL.Add(' NUMDOC = :NUMORDPREV,');
      EditSQL.Add(' DATADOC = :DATADOCUMENTO,');
      EditSQL.Add(' NUMRIGO = :PROGRIGO,');
      EditSQL.Add(' NUMRIGO2 = :PROGRIGO2,');
      EditSQL.Add(' CODDIPENDENTE = :CODICEMAGAZZINO,');
      EditSQL.Add(' DESCRIZDIPENDENTE = :DESCRIZIONE,');
      EditSQL.Add(' NOTE = :NOTERIGO,');
// NB: Eliminate per risolvere uno string truncation error
//      EditSQL.Add(' CODCANTIERE = :PRATICA,');
//      EditSQL.Add(' DATACANTIERE = :DATAPRATICA1,');
//      EditSQL.Add(' DESCRIZCANTIERE = :RIFPRATICA,');
//      EditSQL.Add(' CODSOGGETTO = :CODICECLIENTE,');
//      EditSQL.Add(' DESCRIZSOGGETTO = :SOGGETTO,');
      EditSQL.Add(' VERSIONE = ' + IntToStr(MainForm.PrgVersion) + ',');
      EditSQL.Add(' SEGNOOPERAZIONECANTIERE = :SEGNOOPERAZIONECANTIERE,');
      EditSQL.Add(' SOTTOCANTIERE1 = :SOTTOCANTIERE1,');
      EditSQL.Add(' SOTTOCANTIERE2 = :SOTTOCANTIERE2,');
      EditSQL.Add(' SOTTOCANTIERE3 = :SOTTOCANTIERE3,');
      EditSQL.Add(' GC_DESCRIZIONE_MOD = :GC_DESCRIZIONE_MOD,');
      EditSQL.Add(' GC_DESCRIZIONE = :GC_DESCRIZIONE,');
      EditSQL.Add(' GC_COSTONETTOUNITARIO_MOD = :GC_COSTONETTOUNITARIO_MOD,');
      EditSQL.Add(' GC_COSTONETTOUNITARIO = :GC_COSTONETTOUNITARIO,');
      EditSQL.Add(' GC_RICARICO_MOD = :GC_RICARICO_MOD,');
      EditSQL.Add(' GC_RICARICO = :GC_RICARICO,');
      EditSQL.Add(' GUID = :GUID,');
      EditSQL.Add(' GUID_REF = :GUID_REF,');
      EditSQL.Add(' GUID_ANCESTOR = :GUID_ANCESTOR');
      EditSQL.Add('WHERE');
      EditSQL.Add(' TIPODOC = :OLD_TIPODOCUMENTO');
      EditSQL.Add(' AND REGISTRO = :OLD_REGISTRO');
      EditSQL.Add(' AND NUMDOC = :OLD_NUMORDPREV');
      EditSQL.Add(' AND DATADOC = :OLD_DATADOCUMENTO');
      EditSQL.Add(' AND NUMRIGO = :OLD_PROGRIGO');
      EditSQL.Add(' AND NUMRIGO2 = :OLD_PROGRIGO2');
  end;
end;


procedure TTabGCForm.Manodopera1Click(Sender: TObject);
begin
    DM1.Attendere;
    try
      Application.CreateForm(TDipendentiForm, DipendentiForm);
      DipendentiForm.Parent := MainForm;
      DipendentiForm.DblClickMode := DblClickModeSelection;
      DipendentiForm.CallerCode := 9;
      DipendentiForm.Show;
    finally
      DM1.ChiudiAttendere;
    end;
end;


procedure TTabGCForm.NuovoRigoOre(CodDip:Integer; Mode:TAddArtMode);
var
   y : Integer;
   Qry: TIB_Cursor;
   DC:TcxDBDataController;
   Tmp: String;
begin
   // DC Punta al DataController che attualmente ha il focus
   DC := GridGC.FocusedView.DataController as TcxDBDataController;
   // Y contiene la coordinata Y della cella selezionata
   y := DC.FocusedRecordIndex;
   // Crea Qry
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Cerca il dipendente desiderato
      Qry.SQL.Add('SELECT *');
      Qry.SQL.Add('FROM DIPENDENTI D');
      Qry.SQL.Add('WHERE D.CODICE = ' + IntToStr(CodDip));
      // Apre la query
      Qry.Open;
      // Se trova il dipendente
      if not Qry.Eof then begin
        // Se non c'è alcun record selezionato forza l'Append del nuovo rigo
        //  altrimenti dà un errore.
        if DC.FocusedRecordIndex = -1 then Mode := AM_Append;

        // In base alla modalità modifica il rigo corrente oppure fà un append o un isert.
        case Mode of
           AM_Append: DC.DataSet.Append;
           AM_Insert: DC.DataSet.Insert;
        end;
        try
          // Procedura che imposta la proprietà InsertSQL della IBOQuery per poter inserire
          //  un rigo di Manodopera
          //  NB: Prima era all'inizio della procedura ma dava dei problemi con i righi inseriti
          //       direttamente nel GC ora qui va bene
          SetManodoperaInsertSQL;
          SetManodoperaUpdateSQL;

          // Y contiene la coordinata Y della cella selezionata
          y := DC.FocusedRecordIndex;
          // Costruisce il Nome + COgnome
          // Construisce il Nome e cognome del dipendente
          Tmp := '';
          if not Qry.FieldByName('NOME').IsNull then Tmp := Trim(Qry.FieldByName('NOME').AsString);
          if not Qry.FieldByName('COGNOME').IsNull then begin
            if Length(Trim(Tmp)) > 0 then Tmp := Tmp + ' ';
            Tmp := Tmp + Trim(Qry.FieldByName('COGNOME').AsString);
          end;
          // CArica i valori
          DC.DataSet.FieldByName('TIPOLOGIA').AsString            := DM1.Manodopera[Qry.FieldByName('OPERAINDEX').AsInteger].Descrizione;
          DC.DataSet.FieldByName('TIPODOCUMENTO').AsString        := 'Giornale_cantiere';
          DC.DataSet.FieldByName('CODICEMAGAZZINO').AsInteger     := CodDip;                          // Il codice dipendente lo parcheggio nel codice magazzino perchè è un intero anche lui e senza fare un campo apposito.
          DC.DataSet.FieldByName('DESCRIZIONE').AsString          := Tmp;                             // Nome del dipendente
          DC.DataSet.FieldByName('GC_DESCRIZIONE').AsString       := Tmp;                             // Nome del dipendente
          DC.DataSet.FieldByName('CODICEARTICOLO').AsString       := 'Opera - ' + IntToStr(CodDip);   // NB: Solo per farlo vedere subito sul rigo appena inserito in quanto è un campo calcolato
          DC.DataSet.FieldByName('OPERAINDEX').AsInteger          := Qry.FieldByName('OPERAINDEX').AsInteger;
          DC.DataSet.FieldByName('SOGGETTO').AsString             := ClientiForm.RagSocCS;
          if not Qry.FieldByName('COSTOORARIO').IsNull
            then DC.DataSet.FieldByName('GC_COSTONETTOUNITARIO').AsCurrency := Qry.FieldByName('COSTOORARIO').AsCurrency;

          // Impostazione del prezzo di vendita
          case Qry.FieldByName('OPERAINDEX').AsInteger of
            0: DC.DataSet.FieldByName('GC_PRZVEND').AsCurrency := GcVisPrezzoManodopera1.Value;
            1: DC.DataSet.FieldByName('GC_PRZVEND').AsCurrency := GcVisPrezzoManodopera2.Value;
            2: DC.DataSet.FieldByName('GC_PRZVEND').AsCurrency := GcVisPrezzoManodopera3.Value;
            3: DC.DataSet.FieldByName('GC_PRZVEND').AsCurrency := GcVisPrezzoManodopera4.Value;
            4: DC.DataSet.FieldByName('GC_PRZVEND').AsCurrency := GcVisPrezzoManodopera5.Value;
          end;

          // Se è abilitato, richiede la Qtà di ore da inserire
  //        if DM1.RichiediQta then DM1.ChiediOreManodopera(CodDip,
          DM1.ChiediOreManodopera(CodDip,
                                  Tmp,
                                  DC.DataSet.FieldByName('GC_QTA'),
                                  DC.DataSet.FieldByName('NOTERIGO')
                                 );
          // Conferma il dato e si posiziona su di esso
          DC.DataSet.Post;
          TabGCForm.btvGCRighi.Controller.ClearSelection;
          TabGCForm.btvGCRighi.Controller.FocusedRecord.Selected := True;
          TabGCForm.GridGC.SetFocus;
        except
          DC.DataSet.Cancel;
        end;
      // Altrimenti significa che non ha trovato alcun articolo e quindi ritorna un errore
      end else begin
         MessageBeep(0);
         MessageDlg('Dipendente non trovato !', mtError, [mbOK], 0)
      end;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;


procedure TTabGCForm.btvGCRighiCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Column: TcxGridDBBandedColumn;
  LineColor: TColor;
  X, Y: Integer;
  BM: TBitmap;
begin
  inherited;
  // Inizializzazione
  Column := AViewInfo.Item as TcxGridDBBandedColumn;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // ===========================================================================
  // Se la colonna è quella che indica se il prezzo di vendita è come da commessa...
  //  provvede a visualizzare l'eventuale flag che indica la situazione, altrimenti
  //  disegna il contenuto della cella in modo normale
  // ---------------------------------------------------------------------------
  if Column.DataBinding.FieldName = 'GC_PRZVENDDACOMMESSA' then
  begin
    // RIcava le coordinate per posizionare il flag
    X := AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left - ImageListForScreen.Width) / 2);
    Y := AViewInfo.Bounds.Top + Trunc((AViewInfo.Bounds.Bottom - AViewInfo.Bounds.Top - ImageListForScreen.Height) / 2);
    // Se il prezzo di vendita attuale è come da commessa disegna...
    if (not VarIsNull(AViewInfo.GridRecord.Values[btvGCRighiGC_PRZVENDDACOMMESSA.Index])) and (AViewInfo.GridRecord.Values[btvGCRighiGC_PRZVENDDACOMMESSA.Index] = 'T') then begin
      BM := TBitmap.Create;
      try
        BM.Transparent := True;
        ImageListForScreen.GetBitmap(0, BM);
        ACanvas.Draw(X, Y, BM);
      finally
        FreeAndNil(BM);
      end;
    // Se invece il prezzo di vendita attuale non è come da commessa però l'articolo
    //  è presente in commessa...
    end else if (not VarIsNull(AViewInfo.GridRecord.Values[btvGCRighiGC_PRESENTEINCOMMESSA.Index])) and (AViewInfo.GridRecord.Values[btvGCRighiGC_PRESENTEINCOMMESSA.Index] = 'T') then begin
      BM := TBitmap.Create;
      try
        BM.Transparent := True;
        ImageListForScreen.GetBitmap(1, BM);
        ACanvas.Draw(X, Y, BM);
      finally
        FreeAndNil(BM);
      end;
    end;
  end
  else
  begin
    // Disegna il contenuto della cella in modo standard
    AViewInfo.EditViewInfo.Paint(ACanvas); // Paint the default cell's contents
  end;
  // ===========================================================================

  // ===========================================================================
  // Se è una colonna del TRACKING traccia anche una separazione tra le righe
  //  per una maggiore chiarezza.
  // ---------------------------------------------------------------------------
  if LeftStr(Column.Name, 15) = 'btvGCRighiTRACK' then begin
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, $00DFDFDF, $00DFDFDF, [bBottom], 1)
  end;
  // ===========================================================================

  // ===========================================================================
  // Disegna la linea di separazione alla sx di questa colonna
  // ---------------------------------------------------------------------------
  LineColor := TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor;
  if Column.IsRight then ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bRight], 1);
  if Column.IsLeft then ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bLeft], 1);
  if TcxCustomGridRecordByMauri(AViewInfo.GridRecord).GetIsUltimoRecordDelGruppo then ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bBottom], 1);
  ADone := True; //Suppress the default drawing
  // ===========================================================================
end;

procedure TTabGCForm.btvGCRIEP_COSTICustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // Se il valore è maggiore a zero lo visualizza in rosso (variazione del costo in aumento)
  if (LeftStr(AViewInfo.Text, 1) <> '-') and (AViewInfo.Text <> '0') then
    ACanvas.Font.Color := clRed;
end;

procedure TTabGCForm.btvGCRIEP_MARGINE_COMMESSACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il valore è inferiore a zero lo visualizza in rosso (margine negativo)
  if (not VarIsNull(AViewInfo.Value)) and (AViewInfo.Value < 0) then
    AViewInfo.EditViewInfo.TextColor := clRed;
end;

procedure TTabGCForm.btvGCRIEP_MARGINE_COMMESSACustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il valore è minore di zero lo visualizza in rosso (margine negativo)
  if (LeftStr(AViewInfo.Text, 1) = '-')then
    ACanvas.Font.Color := clRed;
end;

procedure TTabGCForm.btvGCRIEP_QTACustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  // Se il valore è maggiore a zero lo visualizza in rosso (variazione del costo in aumento)
  if (not VarIsNull(AViewInfo.Value)) and (AViewInfo.Value > 0) then
    AViewInfo.EditViewInfo.TextColor := clRed;
end;

procedure TTabGCForm.btvGCRIEP_QTACustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var
  AGroupRow: TcxGridGroupRow;
  ADataRow: TcxGridDataRow;
begin
  // Questo blocco di codice fa in modo che questo totale sia visualizzato solamente
  //  nel raggruppamento che rappresenta la manodopera mentre lo rende invisibile
  //  per tutti gli altri. Infatti il totale Qtà ha senso solamente per la manodopera
  //  mentre perde di significato negli altri casi
  btvGCCOMMESSA_QTACustomDrawFooterCell(Sender, ACanvas, AViewInfo, ADone);
  // Se il valore è maggiore a zero lo visualizza in rosso (variazione del costo in aumento)
  btvGCRIEP_COSTICustomDrawFooterCell(Sender, ACanvas, AViewInfo, Adone);
end;

procedure TTabGCForm.btvGCRighiCustomDrawBandHeader(
  Sender: TcxGridBandedTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridBandHeaderViewInfo; var ADone: Boolean);
var
  LineColor: TColor;
begin
  inherited;
  // ===========================================================================
  // Disegna la linea di separazione alla sx di questa colonna
  // ---------------------------------------------------------------------------
  LineColor := TcxGridDBBandedTableView(Sender).Styles.BandHeader.TextColor;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // Visualizza il testo dell'intestazione
  ACanvas.DrawText(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignHCenter or cxAlignVCenter);
  // Disegna il bordo
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bRight,bTop,bLeft], 1);
  // Sopprime il disegno di default
  ADone := True;
  // ===========================================================================
end;

procedure TTabGCForm.btvGCRighiCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  LineColor: TColor;
  X,Y:Integer;
begin
  inherited;
  // ===========================================================================
  // Disegna la linea di separazione alla sx di questa colonna
  // ---------------------------------------------------------------------------
  //  LineColor := TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor;
  LineColor := TcxGridTableView(Sender).Styles.Header.TextColor;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // Visualizza il testo dell'intestazione
  ACanvas.DrawText(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignHCenter or cxAlignVCenter);

  // Disegna il bordo
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bTop], 1);
  if AViewInfo.Column.IsRight then ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bRight], 1);
  if AViewInfo.Column.IsLeft then ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bLeft], 1);
  // Se non c'è il pulsante del mouse premuto sull'intestazione della colonna e se i dati
  //  non sono raggruppati per questa colonna, imposta R in modo che non sia visibile il bordo sx
  //  perchè altrimenti  è brutto.
  if (AViewInfo.Column.GroupIndex > -1) or (AViewInfo.IsPressed)
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bTop,bRight,bBottom,bLeft], 1);

  // Se è la colonna di ordinamento visualizza il triangolino
  if AViewInfo.Column.SortIndex > -1 then begin
     X := AViewInfo.Bounds.Right-13;
     Y := AViewInfo.Bounds.Top+5;
     if Assigned(AviewInfo.Column.Styles.Header) then begin
       ACanvas.Pen.Color   := AviewInfo.Column.Styles.Header.TextColor;
       ACanvas.Brush.Color := AviewInfo.Column.Styles.Header.TextColor;
     end else begin
       ACanvas.Pen.Color   := LineColor;
       ACanvas.Brush.Color := LineColor;
     end;
     if AViewInfo.Column.SortOrder = soDescending then begin
        ACanvas.Polygon([Point(X,Y), Point(X+8,Y), Point(X+4,Y+7)]);
     end else begin
        ACanvas.Polygon([Point(X+4,Y), Point(X+8,Y+7), Point(X,Y+7)]);
     end;
  end;

  // Sopprime il disegno di default
  ADone := True;
  // ===========================================================================
end;

procedure TTabGCForm.btvGCRighiTIPODOCUMENTOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // Se si tratta di un rigo senza documento aggiunto direttamente nel
  //  giornale di cantiere...
  if (VarIsNull(ARecord.Values[btvGCRighiTIPODOCUMENTO.Index])) or (ARecord.Values[btvGCRighiTIPODOCUMENTO.Index] = 'Giornale_cantiere')
  then AText := '';
end;

procedure TTabGCForm.QryNewGCGC_DESCRIZIONE_MODChange(Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_DESCRIZIONE').Value            := DS.FieldByName('DESCRIZIONE').AsString;
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.QryNewGCGC_DESCRIZIONEChange(Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_DESCRIZIONE_MOD').Value := 'T';
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.btvGCRighiSEGNOOPERAZIONEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if      AText = '+' then AText := 'Carico'
  else if AText = '-' then AText := 'Scarico'
  else if AText = 'O' then AText := 'Ordinato'
  else if AText = 'I' then AText := 'Impegnato'
  else    AText := '';
end;

procedure TTabGCForm.btvGCRighiSEGNOOPERAZIONECANTIEREGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if      AText = '+' then AText := 'Carico'
  else if AText = '-' then AText := 'Scarico'
  else if AText = 'M' then AText := 'Montato'
  else if AText = 'F' then AText := 'Fatturato'
  else if AText = 'D' then AText := 'D.D.T.'
  else if AText = 'C' then AText := 'Commessa'
  else    AText := '';
end;

procedure TTabGCForm.btvGCRighiSOTTOCANTIERE1PropertiesInitPopup(
  Sender: TObject);
var
  Qry: TIB_Cursor;
  CurrPratica: Integer;
  CurrDataPratica: TDateTime;
  CB:TcxComboBox;
begin
  // CB Punta al ComboBox corrente
  CB := Sender as TcxComboBox;
  CB.Properties.Items.Clear;
  // Se il rigo corrente non appartiene a nessuna pratica esce subito
  if QryNewGCPRATICA.IsNull or (QryNewGCPRATICA.AsInteger = 0) then Exit;
  // CArica i riferimenti alla pratica
  CurrPratica     := QryNewGCPRATICA.AsInteger;
  CurrDataPratica := QryNewGCDATAPRATICA1.AsDateTime;
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta query
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT ID FROM SOTTOCANTIERI1 WHERE');
    Qry.SQL.Add('TIPOCANTIERE = ''P''');
    Qry.SQL.Add('AND CODICECANTIERE = ' + IntToStr(CurrPratica));
    Qry.SQL.Add('AND DATAAPERTURACANTIERE = ''' + FormatDateTime('mm/dd/yyyy', CurrDataPratica) + '''');
    Qry.Open;
    while not Qry.Eof do begin
      CB.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TTabGCForm.btvGCRighiSEGNOOPERAZIONECANTIEREPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if      DisplayValue = 'Carico' then DisplayValue := '+'
  else if DisplayValue = 'Scarico' then DisplayValue := '-'
  else if DisplayValue = 'Commessa' then DisplayValue := 'C'
  else if DisplayValue = 'Montato' then DisplayValue := 'M'
  else if DisplayValue = 'Fatturato' then DisplayValue := 'F'
  else if DisplayValue = 'D.D.T.' then DisplayValue := 'D';
end;







procedure TTabGCForm.btvGCRighiCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  LineColor:TColor;
  LEditProperties: TcxCustomEditProperties;
begin
  inherited;
  // RIcava le edit properties sia che sia valorizata la properties che la RepositoryItem
  if Assigned(AviewInfo.Column.Properties) then
    LEditProperties := AviewInfo.Column.Properties
  else if Assigned(AviewInfo.Column.RepositoryItem) then
    LEditProperties := AviewInfo.Column.RepositoryItem.Properties
  else
    LEditProperties := nil;
  // Se non è una colonna con un summary definito esce subito.
//  if AViewInfo.Column.Summary.GroupFooterKind = skNone then Exit;
  // Prende il colore delle linee separatrici delle colonne
  LineColor := Sender.OptionsView.GridLineColor;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AviewInfo.Bounds);
  // I totali sono sempre con font neri per essere più visibili
  //  (però potrebbero essere stati impostati rossi nell'evento "onCustomDrawFooterCell"
  //   della colonna, nel qual caso lo lascia così)
  ACanvas.Font.Size := ACanvas.Font.Size + 1;
  if ACanvas.Font.Color <> clRed then
    ACanvas.Font.Color := clBlack;
  // Visualizza il testo dell'intestazione con il giusto allineamento
  if Assigned(LEditProperties) then
  begin
    if LEditProperties.Alignment.Horz = taRightJustify
      then ACanvas.DrawText(AViewInfo.Text, AViewInfo.Bounds, cxAlignRight or cxAlignVCenter)
    else if LEditProperties.Alignment.Horz = taLeftJustify
      then ACanvas.DrawText(AViewInfo.Text, AViewInfo.Bounds, cxAlignLeft or cxAlignVCenter)
    else   ACanvas.DrawText(AViewInfo.Text, AViewInfo.Bounds, cxAlignHCenter or cxAlignVCenter);
  end;
  // Suppress the default drawing
  ADone := True;
end;




// Funzione che ritorna la prima colonna visibile a sx
function TTabGCForm.GetPrimaColonnaVisibileSx(btv:TcxGridBandedTableView): TcxGridBandedColumn;
var
  bi, ci: Integer;
begin
  Result := nil;
  for bi := 0 to btv.Bands.Count -1 do begin
    for ci := 0 to btv.Bands[bi].ColumnCount -1 do begin
      if btv.Bands[bi].Columns[ci].Position.VisibleColIndex = 0 then begin
        Result := btv.Bands[bi].Columns[ci];
        Exit;
      end;
    end;
  end;
end;


// Questa funzione ritorna il TRect di pertinenza del titolo del Footer
function TTabGCForm.GetFooterTitleBoundsRect(CurrView:TcxGridBandedTableView; FooterViewInfo:TcxGridFooterViewInfo):TRect;
var
  Col:TcxGridBandedColumn; 
begin
  // Inizializzazione
  Result := FooterViewInfo.Bounds;
  Col    := GetPrimaColonnaVisibileSx(CurrView);
  // Se la prima colonna visibile a sx della vista ha la proprietà
  //  Position.BandIndex > 0 significa che si tratta di una colonna che non
  //  appartiene alla prima Band visualizzata a SX e questo accade perchè
  //  tutte le colonne della prina Band a SX sono in raggruppamento, questo causava
  //  un disallineamento e quindi gestisco questo caso separatamente.
  if Col.Position.BandIndex > 0 then begin
    // Buono per quando le colonne della prima banda sono tutte in raggruppamento
    Result.Left  := CurrView.ViewInfo.HeaderViewInfo.BandsViewInfo[  Col.Position.Band.VisibleIndex  ].Bounds.Left;
  // Altrimenti usa il metodo normale.
  end else begin
    // Buono quanto le colonne della prima banda non sono tutte in raggruppamento
    Result.Left  := CurrView.ViewInfo.HeaderViewInfo.Items[  Col.VisibleIndex  ].Bounds.Right  -  Col.Width;
  end;
  // Calcola la coordinata Right
  Result.Right := CurrView.ViewInfo.ScrollableAreaBoundsHorz.Left - CurrView.ViewInfo.FixedBandSeparatorWidth;
end;


// Questa funzione ritorna la stringa da utilizzare come titolo a sx di ogni footer
//  in modo che i footers con i totali dei gruppi abbiano a sx un titolo che indica
//  in modo preciso a quali gruppi si riferiscono i totali.
function TTabGCForm.GetFooterTitle(AViewInfo:TcxCustomGridCellViewInfo): String;
var
  InitialLevelIndex, CurrentLevelIndex: Integer;
  Row: TcxCustomGridRecord;
  FooterTitle: String;
begin
  // Inizializzazione
  Result := '';
  // Se AViewInfo è di tipo TcxGridRowFooterViewInfo significa che stiamo tracciando
  //  un GroupFooter e quindi procede con il calcolo del titolo comprensivo del testo
  //  dei gruppi a cui corrisponde
  //  NB: Se invece AviewInfo non è di questo tipo significa che saitmo tracciando
  //       il Footer finale della Vista e quindi ritorna solo il te3sto 'TOTALE:' come risultato.
  if (AViewInfo is TcxGridRowFooterViewInfo) then begin
    // Contiene il LevelIndex del footer che si sta tracciando
    InitialLevelIndex := TcxGridRowFooterViewInfo(AViewInfo).GroupLevel;
    // ALl'inizio contiene lo stesso valore di InitialLevelIndex ma poi viene usato durante l'elaborazione
    //  per ciclare tra i livelli precedenti e comporre così il titolo completo con tutti i testi di tutti i gruppi
    //  di tutti i Livelli di gruppo ai quali il footer è relativo.
    CurrentLevelIndex := InitialLevelIndex;
    // Row punta alla Row del Footer attuale, poi successivamente punterà
    //  alle Parent Row per risalire i titoli dei gruppi di livello precedenti.
    Row := TcxGridRowFooterViewInfo(AViewInfo).GridRecord;
    // Cicla finchè Row punta ad una Row Valida e cioè risale ogni GroupLevel finchè ce
    //  ne sono.
    while (Row <> nil) and (CurrentLevelIndex >= 0) do begin
      // Solo se la Row è relativa ad un Footer (not Row.IsData).
      if (not Row.IsData) and (Row.Level <= InitialLevelIndex) then begin
        // Compone il testo da ritornare aggiungendo il titolo del gruppo attuale.
        if FooterTitle <> ''
        then FooterTitle := Row.DisplayTexts[0]  + ' --> ' + FooterTitle
        else FooterTitle := Row.DisplayTexts[0];
        // Risale al livello precedente
        Dec(CurrentLevelIndex);
      end;
      // Risale alla PArentRow della Row Attuale.
      Row := Row.ParentRecord;
    end;
    // Compone il titolo da ritornale
    Result := Result + '(' + FooterTitle + ')';
  end;
end;


procedure TTabGCForm.btvGCRighiCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
var
  i, vi: Integer;
  R:TRect;
  LineColor:TColor;
  CurrView:TcxGridBandedTableView;
  FooterTitleBoundsRect: TRect;
begin
  inherited;
  // In questo modo scrive il testo sul Group Box in italiano
  DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
  // ===========================================================================
  // INIZIO - PARTE PER IL CUSTOM DRAW DEI FOOTERS
  // ---------------------------------------------------------------------------
  // Se stiamo visualizzando un footer
  if (AViewInfo is TcxGridFooterViewInfo) then begin
    // Inizializzazione
    ADone                     := True;
    CurrView                  := (Sender as TcxGridBandedTableView);
    LineColor                 := CurrView.OptionsView.GridLineColor;
    FooterTitleBoundsRect     := GetFooterTitleBoundsRect(CurrView, TcxGridFooterViewInfo(AViewInfo));
    // Disegna lo sfondo di tutto il footer
    ACanvas.FillRect(AViewInfo.Bounds);
    ACanvas.FillRect(CurrView.ViewInfo.ScrollableAreaBoundsHorz);
    // Parte per disegnare il titolo a sx della riga dei totali (testo e bordo)
    ACanvas.DrawText('                        '+GetFooterTitle(AViewInfo), FooterTitleBoundsRect, cxAlignLeft or cxAlignVCenter);
    ACanvas.Font.Style := ACanvas.Font.Style + [fsBold] - [fsItalic];
    if AViewInfo is TcxGridRowFooterViewInfo
    then ACanvas.DrawText('       TOTALE:', FooterTitleBoundsRect, cxAlignLeft or cxAlignVCenter)
    else ACanvas.DrawText('TOTALE GENERALE   ', FooterTitleBoundsRect, cxAlignRight or cxAlignVCenter);
    ACanvas.DrawComplexFrame(FooterTitleBoundsRect, LineColor, LineColor, [bLeft,bRight], 1);
    // Disegna il Fixed Separator
    R.Left   := FooterTitleBoundsRect.Right;
    R.Right  := FooterTitleBoundsRect.Right + CurrView.ViewInfo.FixedBandSeparatorWidth;
    R.Top    := FooterTitleBoundsRect.Top;
    R.Bottom := FooterTitleBoundsRect.Bottom;
    ACanvas.DrawComplexFrame(R, CurrView.ViewInfo.FixedBandSeparatorColor, CurrView.ViewInfo.FixedBandSeparatorColor, [bRight], CurrView.ViewInfo.FixedBandSeparatorWidth);
    // Cicla per tutte le informazioni di visualizzazione degli header delle
    //  colonne in modo da reperire le informazioni relative alla posizione orizzontale
    //  dell'header stesso e quindi anche del relativo totale sul footer.
    for i := 0 to CurrView.ViewInfo.HeaderViewInfo.Count -1 do begin
      // Se la colonna attuale è completamente al di fuori dell'area di visualizzazione e in particolare
      //  a sx delle colonne fisse, evita completamente di disegnarle perchè tanto sarebbe inutile.
      if  (CurrView.ViewInfo.HeaderViewInfo.Items[i].Bounds.Right > CurrView.ViewInfo.ScrollableAreaBoundsHorz.Left)
      and (CurrView.ViewInfo.HeaderViewInfo.Items[i].Bounds.Left < CurrView.ViewInfo.ClientBounds.Right)
      then begin
        // Imposta i colori dello sfondo uguali allo sfondo della colonna in modo che
        //  anche i totali appaiano sullo stesso sfondo.
        if Assigned(CurrView.ViewInfo.HeaderViewInfo.Items[i].Column.Styles.Footer) then begin
          // Calcola la posizione del REctangle relatico al totale della colonna che stiamo
          //  considerando, per fare questo prende le coordinate Left e Right dal Bound
          //  del relativo Header e invece Top e Bottom usa quelli locali al Bounds generico
          //  del footer.
          //  NB: Il valore della coordinata Left è corretto per non andare sopra
          //       le colonne fisse a sx nel caso ci siano.
          R.Left    := Max(CurrView.ViewInfo.HeaderViewInfo.Items[i].Bounds.Left,   CurrView.ViewInfo.ScrollableAreaBoundsHorz.Left);
          R.Right   := CurrView.ViewInfo.HeaderViewInfo.Items[i].Bounds.Right;
          R.Top     := AViewInfo.Bounds.Top;
          R.Bottom  := AViewInfo.Bounds.Bottom;
          ACanvas.Brush.Color := CurrView.ViewInfo.HeaderViewInfo.Items[i].Column.Styles.Footer.Color;
          ACanvas.Pen.Color   := CurrView.ViewInfo.HeaderViewInfo.Items[i].Column.Styles.Footer.Color;
          // Disegna il rettangolo di sfondo del totale
          ACanvas.FillRect(R);
          // Disegna il bordo del totale
          if CurrView.ViewInfo.HeaderViewInfo.Items[i].Column.IsRight then ACanvas.DrawComplexFrame(R, LineColor, LineColor, [bRight], 1);
          if CurrView.ViewInfo.HeaderViewInfo.Items[i].Column.IsLeft then ACanvas.DrawComplexFrame(R, LineColor, LineColor, [bLeft], 1);
        end;
      end;
    end;
    // Se stiamo visualizzando il footer finale contenente il Totale Generale
    //  disegna una linea superiore in modo più spesso rispetto ai GroupsFooter
    //  in modo da aumentarne il distacco
    if not (AViewInfo is TcxGridRowFooterViewInfo) then begin
      ACanvas.DrawComplexFrame(FooterTitleBoundsRect, LineColor, LineColor, [bTop], 3);
      ACanvas.DrawComplexFrame(AViewInfo.Bounds, LineColor, LineColor, [bTop], 3);
      ACanvas.DrawComplexFrame(FooterTitleBoundsRect, clBlack, clBlack, [bTop], 2);
      ACanvas.DrawComplexFrame(AViewInfo.Bounds, clBlack, clBlack, [bTop], 2);
    end;
  end;
  // ---------------------------------------------------------------------------
  // FINE - PARTE PER IL CUSTOM DRAW DEI FOOTERS
  // ===========================================================================
end;

{ TcxCustomGridRecordByMauri }

function TcxCustomGridRecordByMauri.GetIsUltimoRecordDelGruppo: Boolean;
begin
  Result := Self.IsParentRecordLast[ 0 ];
end;

procedure TTabGCForm.btvGCRighiCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
var
  CurrColor: TColor;
begin
  // Inizializzazione
  ADone := True;

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender as TcxGridDBBandedTableView).Styles.Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Campo
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT('    ' + AViewInfo.GridRecord.DisplayTexts[0], AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignBottom);

  ACanvas.DrawComplexFrame(AViewInfo.Bounds, (Sender as TcxGridDBBandedTableView).OptionsView.GridLineColor, (Sender as TcxGridDBBandedTableView).OptionsView.GridLineColor, [bTop], 1);
{
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
}
end;

procedure TTabGCForm.SBGCSelezioneColonneOpenCloseClick(Sender: TObject);
begin
  inherited;
  if PanelSelezioneColonne.Tag = 1
  then CloseFilterPanel(PanelSelezioneColonne, SBGCSelezioneColonneOpenClose, False, 50, True)
  else OpenFilterPanel(PanelSelezioneColonne, SBGCSelezioneColonneOpenClose, False, True);
end;

procedure TTabGCForm.QryNewGCGC_QTA_MODChange(Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_QTA').Value                    := DS.FieldByName('QTA').AsFloat;
    // Ricalcola anche gli altri campi (come gestore evento DS.FieldByName('GC_COSTONETTOUNITARIOOnChange)
    DS.FieldByName('GC_COSTONETTOIMPORTO').Value      := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_PRZVENDIMPORTO').Value         := DS.FieldByName('GC_PRZVEND').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_GUADAGNOIMPORTO').Value        := DS.FieldByName('GC_PRZVENDIMPORTO').AsFloat - DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.QryNewGCGC_QTAChange(Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_QTA_MOD').Value := 'T';
    DS.FieldByName('GC_COSTONETTOIMPORTO').Value      := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_PRZVENDIMPORTO').Value         := DS.FieldByName('GC_PRZVEND').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_GUADAGNOIMPORTO').Value        := DS.FieldByName('GC_PRZVENDIMPORTO').AsFloat - DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.QryNewGCGC_COSTONETTOUNITARIO_MODChange(
  Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_COSTONETTOUNITARIO').Value := DS.FieldByName('PREZZOACQUISTOARTICOLO').AsFloat;
    // Ricalcola anche gli altri campi (come gestore evento QryGCDetGC_COSTONETTOUNITARIOOnChange)
    DS.FieldByName('GC_COSTONETTOIMPORTO').Value  := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_PRZVEND').Value            := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * (100+DS.FieldByName('GC_RICARICO').AsFloat) / 100;
    DS.FieldByName('GC_PRZVENDIMPORTO').Value     := DS.FieldByName('GC_PRZVEND').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_GUADAGNOUNITARIO').Value   := DS.FieldByName('GC_PRZVEND').AsFloat - DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat;
    DS.FieldByName('GC_GUADAGNOIMPORTO').Value    := DS.FieldByName('GC_PRZVENDIMPORTO').AsFloat - DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.QryNewGCGC_COSTONETTOUNITARIOChange(Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_COSTONETTOUNITARIO_MOD').Value := 'T';
    DS.FieldByName('GC_COSTONETTOIMPORTO').Value      := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_PRZVEND').Value                := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * (100+DS.FieldByName('GC_RICARICO').AsFloat) / 100;
    DS.FieldByName('GC_PRZVENDIMPORTO').Value         := DS.FieldByName('GC_PRZVEND').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_GUADAGNOUNITARIO').Value       := DS.FieldByName('GC_PRZVEND').AsFloat - DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat;
    DS.FieldByName('GC_GUADAGNOIMPORTO').Value        := DS.FieldByName('GC_PRZVENDIMPORTO').AsFloat - DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.QryNewGCGC_RICARICO_MODChange(Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_RICARICO').Value               := DS.FieldByName('MARGINE').AsFloat;
    // Ricalcola anche gli altri campi (come gestore evento DS.FieldByName('GC_COSTONETTOUNITARIOOnChange)
    DS.FieldByName('GC_PRZVEND').Value                := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * (100+DS.FieldByName('GC_RICARICO').AsFloat) / 100;
    DS.FieldByName('GC_PRZVENDIMPORTO').Value         := DS.FieldByName('GC_PRZVEND').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_GUADAGNOUNITARIO').Value       := DS.FieldByName('GC_PRZVEND').AsFloat - DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat;
    DS.FieldByName('GC_GUADAGNOIMPORTO').Value        := DS.FieldByName('GC_PRZVENDIMPORTO').AsFloat - DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.QryNewGCGC_RICARICOChange(Sender: TField);
var
  DS: TDataset;
begin
  inherited;
  // Se la gestione dell'evento OnChange è disabilitato esce subito
  if fGC_DisableOnChangeEvents then Exit;
  // Ricava il dataset
  DS := Sender.DataSet;
  // Prima di tutto disabilita gli eventi On Change degli altri campi
  fGC_DisableOnChangeEvents := True;
  try
    DS.FieldByName('GC_RICARICO_MOD').Value := 'T';
    DS.FieldByName('GC_PRZVEND').Value                := DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat * (100+DS.FieldByName('GC_RICARICO').AsFloat) / 100;
    DS.FieldByName('GC_PRZVENDIMPORTO').Value         := DS.FieldByName('GC_PRZVEND').AsFloat * DS.FieldByName('GC_QTA').AsFloat;
    DS.FieldByName('GC_GUADAGNOUNITARIO').Value       := DS.FieldByName('GC_PRZVEND').AsFloat - DS.FieldByName('GC_COSTONETTOUNITARIO').AsFloat;
    DS.FieldByName('GC_GUADAGNOIMPORTO').Value        := DS.FieldByName('GC_PRZVENDIMPORTO').AsFloat - DS.FieldByName('GC_COSTONETTOIMPORTO').AsFloat;
    // Se è un rigo di Giornale di Cantiere aggiorna anche i campi del rigo documenti
    if IsRigoGiornaleCantiere(DS.FieldByName('TIPODOCUMENTO'))
    then CopiaCampiGcNeiCampiNormali(DS);
  finally
    // Ripristina il tutto
    fGC_DisableOnChangeEvents := False;
  end;
end;

procedure TTabGCForm.SbGcVisPerArticoloMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := not (Sender as TSpeedButton).Down;
      SbGcVisCommessaClick(Sender);
   end;
end;

procedure TTabGCForm.SbGcVisPerArticoloClick(Sender: TObject);
begin
  inherited;
  VisualizzaColonneGCMaster;
  ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TTabGCForm.GridGCLinkCustomDrawFooterCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas; AView: TcxGridTableView;
  ARecord: TcxCustomGridRecord; AColumn: TcxGridColumn; ALevel: Integer;
  AnItem: TdxReportCellString; var ADone: Boolean);
var
  ARect: TRect;
  AFont: TFont;
  AText: String;
  AScale: Integer;
  HorizontalAlign: TcxTextAlignX;
  VerticalAlign: TcxTextAlignY;
begin
  inherited;
  AScale := Sender.RealScaleFactor div 2;
  // Inizializzazione
  //  NB: Alcuni valori li inizializza su variabili locali perchè
  //       altrimenti se lo facevo direttamente sulle proprietà degli
  //       oggetti influenzava ad esempio anche il colore del font dei righi normali,
  //       in questo modo invece non succede.
  AFont := TFont.Create;
  try
    ACanvas.Brush.Color := DM1.tvGridFooter.Color;
    ARect.Left    := AnItem.BoundsRect.Left;
    ARect.Top     := AnItem.BoundsRect.Top;
    ARect.Right   := AnItem.BoundsRect.Right;
    ARect.Bottom  := AnItem.BoundsRect.Bottom;
    AFont.Assign(AnItem.Font);
    AFont.Color := clBlack;
{ TODO : PrintingSystem DrawBackground }//    AnItem.DrawBackground(ACanvas.Handle);
    HorizontalAlign := AnItem.TextAlignX;
    VerticalAlign   := AnItem.TextAlignY;
    // Se stiamo stampando il footer forza l'allineamento verticale di qualunque
    //  cosa a Bottom in modo da staccarlo un pò di più.
    if ALevel < 0 then VerticalAlign := taBottom else VerticalAlign := taTop;
    // Se stiamo stampando una qualche colonna particolare...
    // ===========================================================================
    // GC_DESCRIZIONE di un GROUP FOOTER
    // ---------------------------------------------------------------------------
    if (AColumn = btvGCRighiGC_DESCRIZIONE) and (ALevel >= 0) then begin
      // Rileva il fattore di conversione per la dimensione dei font
      // Impostazione del font per la stampa del titolo 'Tot';
      AFont.Name := 'Arial';
      AFont.Color := clBlue;
      AFont.Size := 7 * AScale;
      AFont.Style := GetGroupTextStyle(ALevel);
      AText := 'TOTALE:   ';
      Sender.DrawText(ACanvas, ARect, 0, AText, AFont, ACanvas.Brush.Color, taLeft, VerticalAlign, True, False, False);
      // Sposta a dx il limite sx del Rect per non stampare il resto sopra
      Self.Canvas.Font.Assign(AFont);
      Self.Canvas.Font.Size := 7;
      ARect.Left := ARect.Left + (Self.Canvas.TextWidth(AText) * AScale);
      ARect.Top  := ARect.Top + (4 * AScale);
      // Settaggio della dimensione del font opportunamente confertito in
      //  base al fattore di scala
      AFont.Size := 4 * AScale;
      AFont.Style := AFont.Style + [fsItalic];
      // Costruzione del testo contenente i riferimenti ai vari livelli
      AText := GetPrintFooterTitle(ARecord, ALevel);
      // Stampa il testo ottenuto
      Sender.DrawText(ACanvas, ARect, 0, AText, AFont, ACanvas.Brush.Color, taLeft, VerticalAlign, True, False, False);
    // ===========================================================================
    // ===========================================================================
    // GC_DESCRIZIONE de FOOTER di tutta la griglia
    // ---------------------------------------------------------------------------
    end else if (AColumn = btvGCRighiGC_DESCRIZIONE) and (ALevel < 0) then begin
      // Impostazione del font per la stampa del titolo 'Tot';
      AFont.Color := clBlue;
      AFont.Size := 8 * AScale;
      AFont.Style := [fsBold, fsUnderline];
      AText := 'TOTALE GENERALE';
      Sender.DrawText(ACanvas, ARect, 0, AText, AFont, clWhite, taLeft, VerticalAlign, True, False, False);
    // ===========================================================================
    // ===========================================================================
    // ALTRI
    // ---------------------------------------------------------------------------
    end else begin
      // Se sono i totali generali...
      AFont.Style := GetGroupTextStyle(ALevel);
      if ALevel < 0 then AFont.Style := [fsBold, fsUnderline];
      // Se è un totale relativo a una Quantità lo stampa solo se è relativo alla MANODOPERA
      if (  (AColumn = btvGCCOMMESSA_QTA) or (AColumn = btvGCGIACENZA_QTA) or (AColumn = btvGCMONTATO_QTA) or (AColumn = btvGCRIEP_QTA) or (AColumn = btvGCRIEP_PERC_QTA)  )
      and (VarToStr(TcxGridGroupRow(ARecord.ParentRecord).Value) <> 'Manodopera') then
        AnItem.Text := '';
      // Le colonne delle sezioni di riepilogo sono stampate in rosso se il dato è peggiorativo rispetto
      //  a quanto preventivato
      if (((AColumn = btvGCRIEP_QTA) or (AColumn = btvGCRIEP_COSTI) or (AColumn = btvGCRIEP_PERC_QTA) or (AColumn = btvGCRIEP_PERC_COSTI)) and (LeftStr(AnItem.Text,1) = '+'))
      or (((AColumn = btvGCRIEP_MARGINE_COMMESSA) or (AColumn = btvGCRIEP_MARGINE_FATTURATO) or (AColumn = btvGCRIEP_MARGINE_MONTATO)) and (LeftStr(AnItem.Text,1) = '-'))
      or (((AColumn = btvGCRIEP_PERC_MARGINE_COMMESSA) or (AColumn = btvGCRIEP_PERC_MARGINE_FATTURATO) or (AColumn = btvGCRIEP_PERC_MARGINE_MONTATO)) and (LeftStr(AnItem.Text,1) = '-'))
      then
        AFont.Color := clRed;
      // Tracciamento del valore
      Sender.DrawText(ACanvas, ARect, 0, AnItem.Text, AFont, ACanvas.Brush.Color, HorizontalAlign, VerticalAlign, True, False, False);
    // ===========================================================================
    end;
    // Disattiva il tracciamento di default
    ADone := True;
  finally
    AFont.Free;
  end;
end;

// Questa funzione ritorna la stringa da utilizzare come titolo a sx di ogni footer
//  in modo che i footers con i totali dei gruppi abbiano a sx un titolo che indica
//  in modo preciso a quali gruppi si riferiscono i totali.
function TTabGCForm.GetPrintFooterTitle(ARecord:TcxCustomGridRecord; InitialLevelIndex:Integer; SaltaUltimoLivello:Boolean=False): String;
var
  CurrentLevelIndex: Integer;
  FooterTitle: String;
  Row: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := '';
  // Se la funzione non deve ritornare nel testo il titolo del livello più alto
  if SaltaUltimoLivello then Dec(InitialLevelIndex);
  // ALl'inizio contiene lo stesso valore di InitialLevelIndex ma poi viene usato durante l'elaborazione
  //  per ciclare tra i livelli precedenti e comporre così il titolo completo con tutti i testi di tutti i gruppi
  //  di tutti i Livelli di gruppo ai quali il footer è relativo.
  //  NB: InitialLevelIndex contiene il LevelIndex del footer che si sta tracciando
  CurrentLevelIndex := InitialLevelIndex;
  // Row punta alla Row del Footer attuale, poi successivamente punterà
  //  alle Parent Row per risalire i titoli dei gruppi di livello precedenti.
  Row := ARecord;
  // Cicla finchè Row punta ad una Row Valida e cioè risale ogni GroupLevel finchè ce
  //  ne sono.
  while (Row <> nil) and (CurrentLevelIndex >= 0) do begin
    // Solo se la Row è relativa ad un Footer (not Row.IsData).
    if (not Row.IsData) and (Row.Level <= InitialLevelIndex) then begin
      // Compone il testo da ritornare aggiungendo il titolo del gruppo attuale.
      if FooterTitle <> ''
      then FooterTitle := Row.DisplayTexts[0]  + '; ' + FooterTitle
      else FooterTitle := Row.DisplayTexts[0];
      // Risale al livello precedente
      Dec(CurrentLevelIndex);
    end;
    // Risale alla PArentRow della Row Attuale.
    Row := Row.ParentRecord;
  end;
  // Compone il titolo da ritornale
  FooterTitle := Trim(FooterTitle);
  if FooterTitle <> '' then FooterTitle := '(' + FooterTitle + ')';
  Result := FooterTitle;
end;



procedure TTabGCForm.GridGCLinkCustomDrawCell(Sender: TdxGridReportLink;
  ACanvas: TCanvas; AView: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AColumn: TcxGridColumn;
  AnItem: TAbstractdxReportCellData; var ADone: Boolean);
var
  AText, ATextPrecLevels: String;
  R: TRect;
  AFont: TFont;
  AmpiezzaArrotondamentoBordi: Integer;
  HorizontalAlign: TcxTextAlignX;
  AScale: Integer;
  LarghezzaTotaleTesto, LarghezzaTestoCurrLev, LarghezzaTestoPrecLev, AltezzaTotaleTesto: Integer;
  LocalColumn: TcxGridDBBandedColumn;
  CurrFieldName: String;
  LEditProperties: TcxCustomEditProperties;
begin
  inherited;
  ADone := True;
  AScale := Sender.RealScaleFactor div 2;
  AFont := TFont.Create;
  // RIcava le edit properties sia che sia valorizata la properties che la RepositoryItem
  if Assigned(AColumn.Properties) then
    LEditProperties := AColumn.Properties
  else if Assigned(AColumn.RepositoryItem) then
    LEditProperties := AColumn.RepositoryItem.Properties
  else
    LEditProperties := nil;
  try
    // =========================================================================
    // Se è una cella normale (non un group header)
    // -------------------------------------------------------------------------
    if ARecord.IsData then begin
      // LocalColumn punta alla colonna corrente per comodità
      LocalColumn := AColumn as TcxGridDBBandedColumn;
      CurrFieldName := LocalColumn.DataBinding.FieldName;
      // Impostazione del Rectangle per la stampa del testo
      R.Left    := AnItem.BoundsRect.Left;
      R.Top     := AnItem.BoundsRect.Top;
      R.Right   := AnItem.BoundsRect.Right;
      R.Bottom  := AnItem.BoundsRect.Bottom;
      // Se una di quelle celle di campi _MOD che quindi devono stampare il PIN
      //  (Checkbox)...
      if (CurrFieldName = 'GC_DESCRIZIONE_MOD') or (CurrFieldName = 'GC_QTA_MOD') or (CurrFieldName = 'GC_COSTONETTOUNITARIO_MOD') or (CurrFieldName = 'GC_RICARICO_MOD') then begin
        R.Left   := R.Left + Round(((R.Right - R.Left - (ImageListForPrint.Width * AScale / 2)) / 2));
        R.Left   := R.Left + AScale;
        R.Top    := R.Top + AScale;
        R.Right  := R.Left + Round(ImageListForPrint.Width * AScale / 2) + AScale;
        R.Bottom := R.Top  + Round(ImageListForPrint.Width * AScale / 2) + AScale;
        if ARecord.Values[AColumn.Index] = 'T'
          then Sender.DrawGraphic(ACanvas, R, R, ImageListForPrint, 0, nil, True, True, clWhite);
      // Se invece è la colonna che indica se il prezzo di vendita è COME DA COMMESSA...
      end else if (CurrFieldName = 'GC_PRZVENDDACOMMESSA') then begin
        R.Left   := R.Left + Round(((R.Right - R.Left - (ImageListForPrint.Width * AScale / 2)) / 2));
        R.Left   := R.Left + AScale;
        R.Top    := R.Top + AScale;
        R.Right  := R.Left + Round(ImageListForPrint.Width * AScale / 2) + AScale;
        R.Bottom := R.Top  + Round(ImageListForPrint.Width * AScale / 2) + AScale;
        if ARecord.Values[btvGCRighiGC_PRZVENDDACOMMESSA.Index] = 'T'
          then Sender.DrawGraphic(ACanvas, R, R, ImageListForPrint, 1, nil, True, True, clWhite)
        else if ARecord.Values[btvGCRighiGC_PRESENTEINCOMMESSA.Index] = 'T'
          then Sender.DrawGraphic(ACanvas, R, R, ImageListForPrint, 2, nil, True, True, clWhite);
      // Se invece è una cella con un testo normale...
      end else begin
        AFont.Assign(AnItem.Font);
        AFont.Color := clBlack;
        // Per una maggiore chiarezza della stampa faccio in modo che i prezzi unitari
        //  stampati in corsivo e i totali normale senza grassetto.
        if (CurrFieldName = 'GC_COSTONETTOUNITARIO') or (CurrFieldName = 'GC_RICARICO') or (CurrFieldName = 'GC_GUADAGNOUNITARIO') or (CurrFieldName = 'GC_PRZVEND') then begin
          AFont.Style := [fsItalic];
        end else if (CurrFieldName = 'GC_COSTONETTOIMPORTO') or (CurrFieldName = 'GC_GUADAGNOIMPORTO') or (CurrFieldName = 'GC_PRZVENDIMPORTO') then begin
          AFont.Style := [];
        end;
        // Le colonne delle sezioni di riepilogo sono stampate in rosso se il dato è peggiorativo rispetto
        //  a quanto preventivato
        if (((CurrFieldName = 'RIEP_QTA') or (CurrFieldName = 'RIEP_COSTI') or (CurrFieldName = 'RIEP_PERC_QTA') or (CurrFieldName = 'RIEP_PERC_COSTI')) and (ARecord.Values[AColumn.Index] > 0))
        or (((CurrFieldName = 'RIEP_MARGINE_COMMESSA') or (CurrFieldName = 'RIEP_MARGINE_FATTURATO') or (CurrFieldName = 'RIEP_MARGINE_MONTATO')) and (ARecord.Values[AColumn.Index] < 0))
        or (((CurrFieldName = 'RIEP_PERC_MARGINE_COMMESSA') or (CurrFieldName = 'RIEP_PERC_MARGINE_FATTURATO') or (CurrFieldName = 'RIEP_PERC_MARGINE_MONTATO')) and (ARecord.Values[AColumn.Index] < 0))
        then
          AFont.Color := clRed;
        // VALORE CELLA
        // Determinazione dell'allineamento orizzontale da utilizzare
        if Assigned(LEditProperties) then
        begin
          if      LEditProperties.Alignment.Horz = taLeftJustify   then HorizontalAlign := taLeft
          else if LEditProperties.Alignment.Horz = taRightJustify  then HorizontalAlign := taRight
          else if LEditProperties.Alignment.Horz = taCenter        then HorizontalAlign := taCenterX;
        end;
        // ###########
        // Se è un dato numerico e il suo valore è zero non lo stampa per niente
        if (not VarIsNull(ARecord.Values[AColumn.Index])) and VarIsNumeric(ARecord.Values[AColumn.Index]) and (ARecord.Values[AColumn.Index]=0)
        then begin
          AText := '';
        end else begin
//          AText := ' ' + ARecord.DisplayTexts[AColumn.Index] + ' ';
          AText := ARecord.DisplayTexts[AColumn.Index];
        end;
        // Se è una colonna del tracking, rielabora il testo da stampare
        if Pos('TRACK_', CurrFieldName) > 0 then AText := ElaboraDescrizioneTracking(AText, False, ARecord);
        // Tracciamento del valore
        Sender.drawText(ACanvas, R, 0, AText, AFont, clWhite, HorizontalAlign, taTop, True, True, False);
      end;
      // BORDO DX
      if AColumn.IsRight then begin
         R.Left   := AnItem.BoundsRect.Right;
         R.Top    := AnItem.BoundsRect.Top;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO SX
      if AColumn.IsLeft then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Top;
         R.Right  := AnItem.BoundsRect.Left;
         R.Bottom := AnItem.BoundsRect.Bottom;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO INFERIORE
      if TcxCustomGridRecordByMauri(ARecord).GetIsUltimoRecordDelGruppo then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Bottom; // - AScale;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom; // - AScale;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
    // =========================================================================
    // Se invece non è una cella normale ma è un GroupHeader
    // -------------------------------------------------------------------------
    end else begin
      // Inizializzazione
      AText := ARecord.DisplayTexts[AColumn.Index];
      ATextPrecLevels := GetPrintFooterTitle(ARecord, ARecord.Level, True);
      AmpiezzaArrotondamentoBordi := 10 * AScale;
      // Se è una colonna del tracking, rielabora il testo da stampare
      //  NB: Prima aggiunge la sequenza di caratteri " : " altrimenti non funziona bene
      if Pos('TRACK_', CurrFieldName) > 0 then begin
        AText := ' : ' + AText;
        AText := Trim(ElaboraDescrizioneTracking(AText, True, ARecord));
      end;
      // Determinazione della larghezza totale del testo
      Self.Canvas.Font.Name := 'Arial';
      Self.Canvas.Font.Size := 8;
      Self.Canvas.Font.Style := GetGroupTextStyle(ARecord.Level);
      LarghezzaTestoCurrLev := Self.Canvas.TextWidth(AText) * AScale;
      AltezzaTotaleTesto    := Self.Canvas.TextHeight(AText) * AScale;
      Self.Canvas.Font.Size := 5;
      Self.Canvas.Font.Style := Self.Canvas.Font.Style + [fsItalic];
      LarghezzaTestoPrecLev := Self.Canvas.TextWidth(ATextPrecLevels) * AScale;
      // Fattore di correzione perchè altrimenti a volte tronca le ultime lettere e allora aggiungo il 10% alla lunghezza del testo
      if Trim(AText) <> '' then Inc(LarghezzaTestoCurrLev, Round(LarghezzaTestoCurrLev/10));
      if Trim(ATextPrecLevels) <> '' then Inc(LarghezzaTestoPrecLev, Round(LarghezzaTestoPrecLev/10));
      // Otteniamo la larghezza totale dei testi
      LarghezzaTotaleTesto := LarghezzaTestoCurrLev + LarghezzaTestoPrecLev;
      // Nel Caso sia il primo gruppo e non è espanso visualizza anche una linea orizzontale a tutta larghezza
      // Se è il primo livello e non è espanso traccia anche la linea orizzontale fino al margine destro
      if (ARecord.Level = 0) and ((not ARecord.Expanded) or (AView.GroupedItemCount > 1)) then begin
        R.Left    := AnItem.BoundsRect.Left;
        R.Top     := AnItem.BoundsRect.Bottom - Round((AltezzaTotaleTesto - (AScale * 2)) / 2) - (2 * AScale);
        R.Right   := AnItem.BoundsRect.Right;
        R.Bottom  := R.Top;
        Sender.DrawRectangle(ACanvas, R, clBlue, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
      end;
      // Modifica del Bounds Rect per il posizionamento del frame
      R.Left    := AnItem.BoundsRect.Left;
      R.Top     := AnItem.BoundsRect.Bottom - AltezzaTotaleTesto - (AScale * 2);
      R.Right   := AnItem.BoundsRect.Left + LarghezzaTotaleTesto + (AmpiezzaArrotondamentoBordi * 2);
      R.Bottom  := AnItem.BoundsRect.Bottom;
      // Se l'ultimo livello fa sparire gli arrotondamenti inferiori
      if (ARecord.Level = (AView.GroupedItemCount -1)) and (ARecord.Expanded) then R.Bottom := R.Bottom + AltezzaTotaleTesto;
      // Traccia il contorno
      Sender.DrawRoundRect(ACanvas, R, AmpiezzaArrotondamentoBordi, AmpiezzaArrotondamentoBordi, $00FFDFDF, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
      // Modifica del Bounds Rect per il posizionamento del Testo
      R.Left    := R.Left + AmpiezzaArrotondamentoBordi;
      R.Right   := R.Left + LarghezzaTestoCurrLev;
      R.Top     := R.Top + AScale;
      R.Bottom  := AnItem.BoundsRect.Bottom - AScale;
      AFont.Name  := 'Arial';
      AFont.Color := clBlue;
      AFont.Size  := 8 * AScale;
      AFont.Style := GetGroupTextStyle(ARecord.Level);
      Sender.drawText(aCanvas, R, 0, AText, AFont, $00FFDFDF, taLeft, taTop, True, False, False);
      R.Left    := R.Right;
      R.Right   := R.Left + LarghezzaTestoPrecLev + Round(AmpiezzaArrotondamentoBordi / 2);
      R.Top     := R.Top + Round(4 * AScale);
      AFont.Size  := 5 * AScale;
      AFont.Style := AFont.Style + [fsItalic];
      Sender.drawText(aCanvas, R, 0, ATextPrecLevels, AFont, $00FFDFDF, taRight, taTop, True, False, False);
      // Se l'ultimo livello traccia la linea inferiore
      if (ARecord.Level = (AView.GroupedItemCount -1)) and (ARecord.Expanded) then begin
        R.Left    := AnItem.BoundsRect.Left;
        R.Top     := AnItem.BoundsRect.Bottom;
        R.Right   := AnItem.BoundsRect.Right;
        R.Bottom  := AnItem.BoundsRect.Bottom;
        Sender.DrawRectangle(ACanvas, R, clBlue, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
      end;
    // =========================================================================
    end;
  finally
    AFont.Free;
  end;
end;

function TTabGCForm.GetGroupTextStyle(ALevel: Integer): TFontStyles;
begin
  if ALevel = 0 then Result := [fsBold] else Result := [];
end;

procedure TTabGCForm.GridGCLinkCustomDrawBandCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas;
  AView: TcxGridBandedTableView; ABand: TcxGridBand;
  AnItem: TdxReportCellString; var ADone: Boolean);
var
  ARect: TRect;
  AFont: TFont;
  AText: String;
  AScale: Integer;
  RealCellHeight: Integer;
begin
  inherited;
  // Inizializzazione
  ADone := True;
  AScale := Sender.RealScaleFactor div 2;
  RealCellHeight := AnItem.BoundsRect.Bottom - AnItem.BoundsRect.Top;
  AFont := TFont.Create;
  try
    AFont.Assign(AnItem.Font);
    AFont.Name := 'Arial';
    AFont.Size := 6 * AScale;
    AFont.Style := [];
    AFont.Color := clBlue;
    AText := AnItem.Text;
    // Tracciamento sfondo e contorno
    ARect.Left    := AnItem.BoundsRect.Left;
    ARect.Right   := AnItem.BoundsRect.Right;
    ARect.Top     := AnItem.BoundsRect.Top;
    ARect.Bottom  := AnItem.BoundsRect.Bottom + RealCellHeight;  // Fa in modo che vada proprio fuori in modo da non disegnare il bordo inferiore
    Sender.DrawRoundRect(ACanvas, ARect, RealCellHeight, RealCellHeight, $00FFDFDF, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
    // Tracciamento testo
    ARect.Left    := AnItem.BoundsRect.Left     + RealCellHeight;
    ARect.Top     := AnItem.BoundsRect.Top      + (1 * AScale);
    ARect.Right   := AnItem.BoundsRect.Right    - RealCellHeight;
    ARect.Bottom  := AnItem.BoundsRect.Bottom   - (1 * AScale);
    Sender.drawText(ACAnvas, ARect, 0, AText, AFont, $00FFDFDF, taCenterX, taCenterY, True, False, False);
  finally
    AFont.Free;
  end;
end;

procedure TTabGCForm.btvGCRighiGC_QTAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord.Values[btvGCRighiTIPOLOGIA.Index] = 'Relazione Intervento' then
    AText := '';
end;

procedure TTabGCForm.btvGCRighiGC_RICARICOGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  Value: Variant;
begin
  inherited;
  Value := Sender.DataBinding.DataController.Values[ARecordIndex, Sender.Index];
  if VarIsNull(Value)
    then AText := ''
    else AText := FloatToStr(SimpleRoundTo(Value, DM1.DecimaliMarginiPercentuali*(-1))) + '%';
end;

procedure TTabGCForm.GridGCLinkCustomDrawHeaderCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas; AView: TcxGridTableView;
  AColumn: TcxGridColumn; AnItem: TdxReportCellString; var ADone: Boolean);
var
  AText: String;
  R: TRect;
  AFont: TFont;
  AScale: Integer;
begin
  inherited;
  // Inizializzazione
  ADone := True;
  AScale := Sender.RealScaleFactor div 2;
  AFont := TFont.Create;
  try
    AFont.Assign(AnItem.Font);
    AFont.Name := 'Arial';
    AFont.Size := 6 * AScale;
    AFont.Style := [];
    AFont.Color := clBlue;
    AText := AnItem.Text;
    // TESTO
    R.Left    := AnItem.BoundsRect.Left;
    R.Right   := AnItem.BoundsRect.Right;
    R.Top     := AnItem.BoundsRect.Top;
    R.Bottom  := AnItem.BoundsRect.Bottom;
    Sender.DrawRectangle(ACanvas, R, $00FFDFDF, $00FFDFDF, TdxPSSolidFillPattern, $00FFDFDF);
    Sender.drawText(ACAnvas, R, 0, AText, AFont, $00FFDFDF, taCenterX, taCenterY, True, False, False);
    // BORDO DX
    if AColumn.IsRight then begin
      R.Left   := AnItem.BoundsRect.Right;
      R.Top    := AnItem.BoundsRect.Top;
      R.Right  := AnItem.BoundsRect.Right;
      R.Bottom := AnItem.BoundsRect.Bottom;
      Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
    end;
    // BORDO SX
    if AColumn.IsLeft then begin
      R.Left   := AnItem.BoundsRect.Left;
      R.Top    := AnItem.BoundsRect.Top;
      R.Right  := AnItem.BoundsRect.Left;
      R.Bottom := AnItem.BoundsRect.Bottom;
      Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
    end;
    // BORDO INFERIORE
    R.Left   := AnItem.BoundsRect.Left;
    R.Top    := AnItem.BoundsRect.Bottom;
    R.Right  := AnItem.BoundsRect.Right;
    R.Bottom := AnItem.BoundsRect.Bottom;
    Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
    // BORDO SUPERIORE
    R.Left   := AnItem.BoundsRect.Left;
    R.Top    := AnItem.BoundsRect.Top;
    R.Right  := AnItem.BoundsRect.Right;
    R.Bottom := AnItem.BoundsRect.Top;
    Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
  finally
    AFont.Free;
  end;

end;

procedure TTabGCForm.dxPrinterCustomDrawPageHeader(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
  inherited;
   DM1.dxPrinterDefaultDrawPageHeader(AReportLink, ACanvas, ARect, ANom, ADenom, False);
end;

procedure TTabGCForm.dxPrinterCustomDrawPageFooter(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
  inherited;
   DM1.dxPrinterDefaultDrawPageFooter(AReportLink, ACanvas, APageIndex, ARect, ANom, ADenom);
end;

procedure TTabGCForm.btvGCGIACENZA_QTAGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  DC: TcxCustomDataController;
  Tipologia: String;
  Value: Variant;
begin
  inherited;
  // Inizializzazione
  DC := Sender.GridView.DataController;
  Tipologia := '';
  if not VarIsNull(DC.Values[ARecordIndex, btvGCTIPOLOGIA.Index])
    then Tipologia := DC.Values[ARecordIndex, btvGCTIPOLOGIA.Index];
  // Se siamo fuori da un cantiere selezionato e stiamo visualizzando
  //  un rigo di materiali oppure di altre spese rende invisibili i valori
  if  (not GC_CantiereSelezionato)
  and (
           (  (Tipologia <> 'Materiali / Apparecchi') and (Tipologia <> 'Manodopera') and (Tipologia <> 'Altre spese')  )
        or (  (Tipologia = 'Materiali / Apparecchi')  and (  (RightStr(Sender.Name, 4) = '_QTA') or (RightStr(Sender.Name, 12) = '_PRZUNITVEND') or (RightStr(Sender.Name, 11) = '_PRZUNITACQ') or (RightStr(Sender.Name, 9)  = '_RICARICO')or (RightStr(Sender.Name, 17) = '_GUADAGNOUNITARIO')  )  )
        or (  (Tipologia = 'Altre spese')             and (  (RightStr(Sender.Name, 4) = '_QTA') or (RightStr(Sender.Name, 12) = '_PRZUNITVEND') or (RightStr(Sender.Name, 11) = '_PRZUNITACQ') or (RightStr(Sender.Name, 9)  = '_RICARICO')or (RightStr(Sender.Name, 17) = '_GUADAGNOUNITARIO')  )  )
      )
  then begin
    AText := '';
  // Se invece siamo dentro ad un cantiere selezionato...
  end else begin
    // Se la colonna attuale è una colonna di Ricarico la rielabora in modo da evitare i decimali e da
    //  aggiungere il carattere "%" alla fine.
    //  NB: anche se è una colonna della banda "Riepilogo %" perchè sono tutte percentuali
    if (RightStr(Sender.Name, 9) = '_RICARICO') or (LeftStr(Sender.Name, 14) = 'btvGCRIEP_PERC') then
    begin
      Value := Sender.DataBinding.DataController.Values[ARecordIndex, Sender.Index];
      if VarIsNull(Value) or (Value = 0)
        then AText := ''
        else AText := FloatToStr(SimpleRoundTo(Value, DM1.DecimaliMarginiPercentuali*(-1))) + '%';
    end;
    // Se la colonna attuale è una colonna di riepilogo variazione Qtà o Costo la rielabora
    //  in modo da aggiungere il segno "+" ai valori positivi
    if (RightStr(Sender.Name, 8) = 'RIEP_QTA')
    or (RightStr(Sender.Name, 10) = 'RIEP_COSTI')
    or (RightStr(Sender.Name, 13) = 'RIEP_PERC_QTA')
    or (RightStr(Sender.Name, 15) = 'RIEP_PERC_COSTI')
    then
    begin
      Value := Sender.DataBinding.DataController.Values[ARecordIndex, Sender.Index];
      if (not VarIsNull(Value)) and (Value > 0)
        then AText := '+' + Trim(AText);
    end;
  end;
end;

procedure TTabGCForm.SetGC_Panel_Visible_Costo(const Value: Boolean);
begin
  fGC_Panel_Visible_Costo := Value;
  LabelSfondoCosto.Visible := Value;
  LabelTitoloCosto.Visible := Value;
  GCVisTipoCosto.Visible := Value;
  ShapeCorniceCosto.Visible := Value;
end;

procedure TTabGCForm.SetGC_Panel_Visible_Manodopera(const Value: Boolean);
begin
  fGC_Panel_Visible_Manodopera := Value;
  LabelSfondoManodopera.Visible := Value;
  LabelTitoloManodopera.Visible := Value;
  LabelTitoloManodoperaVend.Visible := Value;
  LabelTitoloManodoperaCosto.Visible := Value;
  ShapeCorniceManodopera.Visible := Value;
  GcVisLabelManodopera1.Visible := Value;
  GcVisLabelManodopera2.Visible := Value;
  GcVisLabelManodopera3.Visible := Value;
  GcVisLabelManodopera4.Visible := Value;
  GcVisLabelManodopera5.Visible := Value;
  GcVisPrezzoManodopera1.Visible := Value;
  GcVisPrezzoManodopera2.Visible := Value;
  GcVisPrezzoManodopera3.Visible := Value;
  GcVisPrezzoManodopera4.Visible := Value;
  GcVisPrezzoManodopera5.Visible := Value;
  GcVisCostoManodopera1.Visible  := Value;
  GcVisCostoManodopera2.Visible  := Value;
  GcVisCostoManodopera3.Visible  := Value;
  GcVisCostoManodopera4.Visible  := Value;
  GcVisCostoManodopera5.Visible  := Value;
end;

procedure TTabGCForm.SetGC_Panel_Visible_Ricarico(const Value: Boolean);
begin
  fGC_Panel_Visible_Ricarico := Value;
  LabelSfondoRicarico.Visible := Value;
  LabelTitoloRicarico.Visible := Value;
  ShapeCorniceRicarico.Visible := Value;
  GcVisTipoRicarico.Visible := Value;
  GcVisRicaricoPerc.Visible := Value;
  GcVisListino.Visible := Value;
  GCVisTipoRicaricoComeDaCommessa.Visible := Value;
  GCVisLabelTipoRicaricoComeDaCommessa.Visible := Value;
end;

procedure TTabGCForm.SetGC_Panel_Visible_SezioniConCantiereSelezionato;
begin
  Sez_Visible_Commessa              := True;
  Sez_Visible_Giacenza              := True;
  Sez_Visible_Montato               := True;
  Sez_Visible_DaMontare_Commessa    := True;
  Sez_Visible_DaMontare_Giacenza    := True;
  Sez_Visible_Fatturato             := True;
  Sez_Visible_DaFatturare_Commessa  := True;
  Sez_Visible_DaFatturare_Giacenza  := True;
  Sez_Visible_DaFatturare_Montato   := True;
  Sez_Visible_Magazzino             := True;
  Sez_Visible_Sottocantieri         := True;
  Sez_Visible_Gruppi                := True;
  Sez_Visible_Documenti             := True;
  Sez_Visible_Tracking              := True;
  Sez_Visible_CategCant             := False;
end;

procedure TTabGCForm.SetGC_Panel_Visible_SezioniConCantiereNonSelezionato;
begin
  Sez_Visible_Commessa              := True;
  Sez_Visible_Giacenza              := True;
  Sez_Visible_Montato               := True;
  Sez_Visible_DaMontare_Commessa    := True;
  Sez_Visible_DaMontare_Giacenza    := True;
  Sez_Visible_Fatturato             := True;
  Sez_Visible_DaFatturare_Commessa  := True;
  Sez_Visible_DaFatturare_Giacenza  := True;
  Sez_Visible_DaFatturare_Montato   := True;
  Sez_Visible_Magazzino             := True and not DM1.GC_CantiereNoSel_VisualizzazioneRiassuntiva;
  Sez_Visible_Sottocantieri         := True;
  Sez_Visible_Gruppi                := True and not DM1.GC_CantiereNoSel_VisualizzazioneRiassuntiva;
  Sez_Visible_Documenti             := True and not DM1.GC_CantiereNoSel_VisualizzazioneRiassuntiva;
  Sez_Visible_Tracking              := True and not DM1.GC_CantiereNoSel_VisualizzazioneRiassuntiva;
  Sez_Visible_CategCant             := True;
end;

procedure TTabGCForm.VisualizzazioneConCantiereSelezionato;
begin
  SetGC_Panel_Visible_SezioniConCantiereSelezionato;
  GC_Panel_Visible_Costo       := True;
  GC_Panel_Visible_Manodopera  := True;
  GC_Panel_Visible_Ricarico    := True;
  // Con il cantiere selezionato deve essere possibile trascinare dei righi nella bacheca
  btvGC.DragMode      := dmAutomatic;
  btvGCRighi.DragMode := dmAutomatic;
end;

procedure TTabGCForm.VisualizzazioneConCantiereNonSelezionato;
begin
  SetGC_Panel_Visible_SezioniConCantiereNonSelezionato;
  GC_Panel_Visible_Costo       := False;
  GC_Panel_Visible_Manodopera  := False;
  GC_Panel_Visible_Ricarico    := False;
  // Con il cantiere selezionato NON deve essere possibile trascinare dei righi nella bacheca
  //  se è abilitata la sola visualizzazione riepilogativa (senza articoli)
  if DM1.GC_CantiereNoSel_VisualizzazioneRiassuntiva then
  begin
    btvGC.DragMode      := dmManual;
    btvGCRighi.DragMode := dmManual;
  end
  else
  begin
    btvGC.DragMode      := dmAutomatic;
    btvGCRighi.DragMode := dmAutomatic;
  end;
end;





procedure TTabGCForm.EliminaButtonClick(Sender: TObject);
begin
  inherited;
  // Chiede prima conferma
  if DM1.Messaggi('Elimina righi dal Giornale di Cantiere', 'Eliminare tutti i righi selezionati?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  if DM1.Messaggi('Elimina righi dal Giornale di Cantiere', 'Sicuro/a?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  btvGCRighi.Controller.DeleteSelection;
end;

procedure TTabGCForm.QryNewGCBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  // Verifica se si tratta di un rigo cancellabile
  if DataSet.FieldByName('TIPODOCUMENTO').AsString <> 'Giornale_cantiere' then begin
    DM1.Messaggi('Elimina Rigo', 'ATTENZIONE !!!'#13#13'Il rigo relativo all''articolo "' + DataSet.FieldByName('GC_DESCRIZIONE').AsString + '" relativo al documento "' + DataSet.FieldByName('TIPODOCUMENTO').AsString + ' ' + DataSet.FieldByName('NUMORDPREV').AsString + DataSet.FieldByName('REGISTRO').AsString + ' del ' + DataSet.FieldByName('DATADOCUMENTO').AsString + ' non è eliminabile.', 'NB: Le righe collegate ai documenti non sono eliminabili dal Giornale di Cantiere ma solo dall''interno del documento stesso.', [mbOk], 0, nil);
    Abort; 
  end;
  // Se invece è eliminabile verifica di che tipo si tratta, se si tratta e in base a questo imposta l'SQL per l'eliminazione appropriato ed esegue l'eliminazione.
  // Se si tratta di Materiali / Apparecchi...
  if DataSet.FieldByName('TIPOLOGIA').AsString = 'Materiali / Apparecchi' then begin
    with DataSet as TIBOQuery do begin
      DeleteSQL.Clear;
      DeleteSQL.Add('DELETE FROM RIGHIPRV WHERE');
      DeleteSQL.Add(' TIPODOCUMENTO = :TIPODOCUMENTO');
      DeleteSQL.Add(' AND REGISTRO = :REGISTRO');
      DeleteSQL.Add(' AND NUMORDPREV = :NUMORDPREV');
      DeleteSQL.Add(' AND DATADOCUMENTO = :DATADOCUMENTO');
      DeleteSQL.Add(' AND PROGRIGO = :PROGRIGO');
      DeleteSQL.Add(' AND PROGRIGO2 = :PROGRIGO2');
    end;
  // Oppure se si tratta di Manodopera...
  end else begin
    with DataSet as TIBOQuery do begin
      DeleteSQL.Clear;
      DeleteSQL.Add('DELETE FROM RAPGIORNRIGHI WHERE');
      DeleteSQL.Add(' TIPODOC = :TIPODOCUMENTO');
      DeleteSQL.Add(' AND REGISTRO = :REGISTRO');
      DeleteSQL.Add(' AND NUMDOC = :NUMORDPREV');
      DeleteSQL.Add(' AND DATADOC = :DATADOCUMENTO');
      DeleteSQL.Add(' AND NUMRIGO = :PROGRIGO');
      DeleteSQL.Add(' AND NUMRIGO2 = :PROGRIGO2');
    end;
  end;
end;

procedure TTabGCForm.btvGCRighiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   // Se invece è stato premuto il puslante "Canc" con il focus sulla griglia
   //  richiama la pressione del pulsante di cancellazione dei documenti, perchè
   //  l'eliminazione interna della griglia sui documento è stata disabilitata perchè
   //  dava un errore. Così gli faccio richiamare la mia funzione di cancellazione dei documenti
   //  così funziona anche il Canc.
   if key = 46 then ClientiForm.RxSpeedButtonEliminaClick(ClientiForm.RxSpeedButtonElimina);
end;

procedure TTabGCForm.btvGCRighiSOTTOCANTIERE2PropertiesInitPopup(
  Sender: TObject);
var
  Qry: TIB_Cursor;
  CurrPratica: Integer;
  CurrDataPratica: TDateTime;
  CB:TcxComboBox;
begin
  // CB Punta al ComboBox corrente
  CB := Sender as TcxComboBox;
  CB.Properties.Items.Clear;
  // Se il rigo corrente non appartiene a nessuna pratica esce subito
  if QryNewGCPRATICA.IsNull or (QryNewGCPRATICA.AsInteger = 0) then Exit;
  // CArica i riferimenti alla pratica
  CurrPratica     := QryNewGCPRATICA.AsInteger;
  CurrDataPratica := QryNewGCDATAPRATICA1.AsDateTime;
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta query
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT ID FROM SOTTOCANTIERI2 WHERE');
    Qry.SQL.Add('TIPOCANTIERE = ''P''');
    Qry.SQL.Add('AND CODICECANTIERE = ' + IntToStr(CurrPratica));
    Qry.SQL.Add('AND DATAAPERTURACANTIERE = ''' + FormatDateTime('mm/dd/yyyy', CurrDataPratica) + '''');
    Qry.Open;
    while not Qry.Eof do begin
      CB.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TTabGCForm.btvGCRighiSOTTOCANTIERE3PropertiesPopup(
  Sender: TObject);
var
  Qry: TIB_Cursor;
  CurrPratica: Integer;
  CurrDataPratica: TDateTime;
  CB:TcxComboBox;
begin
  // CB Punta al ComboBox corrente
  CB := Sender as TcxComboBox;
  CB.Properties.Items.Clear;
  // Se il rigo corrente non appartiene a nessuna pratica esce subito
  if QryNewGCPRATICA.IsNull or (QryNewGCPRATICA.AsInteger = 0) then Exit;
  // CArica i riferimenti alla pratica
  CurrPratica     := QryNewGCPRATICA.AsInteger;
  CurrDataPratica := QryNewGCDATAPRATICA1.AsDateTime;
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta query
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT ID FROM SOTTOCANTIERI3 WHERE');
    Qry.SQL.Add('TIPOCANTIERE = ''P''');
    Qry.SQL.Add('AND CODICECANTIERE = ' + IntToStr(CurrPratica));
    Qry.SQL.Add('AND DATAAPERTURACANTIERE = ''' + FormatDateTime('mm/dd/yyyy', CurrDataPratica) + '''');
    Qry.Open;
    while not Qry.Eof do begin
      CB.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TTabGCForm.btvGCRighiEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
var
  Tipologia, Sezione: String;
  IsDocument: Boolean;
begin
  inherited;
  // Se siamo nella FilterRow...
  if (Sender.Controller as TcxGridTableController).FocusedRow.IsFilterRow then begin
    AAllow := True;
    Exit;
  end;
  // Inizializzazione
  AAllow := False;
  // Se il NewItemRow non è inizializzato lo inizializza sempre come rigo di giacenza di Materiali/Apparecchi
  if Sender.Controller.NewItemRecordFocused and VarIsNull(Sender.Controller.FocusedRecord.Values[btvGCRighiGC_SEZIONE.Index]) then begin
    Sezione := 'Giacenza';
  end else begin
    Sezione := Trim(Sender.Controller.FocusedRecord.Values[btvGCRighiGC_SEZIONE.Index]);
  end;
  if Sender.Controller.NewItemRecordFocused and VarIsNull(Sender.Controller.FocusedRecord.Values[btvGCRighiTIPOLOGIA.Index]) then begin
    Tipologia := 'Materiali / Apparecchi';
  end else begin
    Tipologia := Trim(Sender.Controller.FocusedRecord.Values[btvGCRighiTIPOLOGIA.Index]);
  end;
  if Sender.Controller.NewItemRecordFocused and VarIsNull(Sender.Controller.FocusedRecord.Values[btvGCRighiTIPODOCUMENTO.Index]) then begin
    IsDocument := False;
  end else begin
    IsDocument := (Trim(Sender.Controller.FocusedRecord.Values[btvGCRighiTIPODOCUMENTO.Index]) <> 'Giornale_cantiere');
  end;
  // In base alla situazione abilita/disabilita l'editing del campo corrente
  // GC_DATADOCUMENTO
  if AItem = btvGCRighiGC_DATADOCUMENTO then begin
    AAllow := (not IsDocument);
  // SEGNOOPERAZIONE
  end else if AItem = btvGCRighiSEGNOOPERAZIONE then begin
    AAllow := (Tipologia='Materiali / Apparecchi') and (not IsDocument);
  // SEGNOOPERAZIONECANTIERE
  end else if AItem = btvGCRighiSEGNOOPERAZIONECANTIERE then begin
    AAllow := (Tipologia='Materiali / Apparecchi') and (not IsDocument);
  // GC_CODICEARTICOLO
  end else if AItem = btvGCRighiGC_CODICEARTICOLO then begin
    AAllow := (Tipologia='Materiali / Apparecchi') and (not IsDocument);
  // GC_DESCRIZIONE_MOD
  end else if AItem = btvGCRighiGC_DESCRIZIONE_MOD then begin
    AAllow := True;
  // GC_DESCRIZIONE
  end else if AItem = btvGCRighiGC_DESCRIZIONE then begin
    AAllow := True;
  // UNITA DI MISURA
  end else if AItem = btvGCRighiUNITADIMISURA then begin
    AAllow := (Tipologia='Materiali / Apparecchi') and (not IsDocument);
  // GC_QTA_MOD
  end else if AItem = btvGCRighiGC_QTA_MOD then begin
    AAllow := (Tipologia<>'Altre spese');
  // GC_QTA
  end else if AItem = btvGCRighiGC_QTA then begin
    AAllow := (Tipologia<>'Altre spese');
  // GC_COSTONETTOUNOTARIO_MOD
  end else if AItem = btvGCRighiGC_COSTONETTOUNITARIO_MOD then begin
    AAllow := (Tipologia='Materiali / Apparecchi') or (Tipologia='Altre spese');
  // GC_COSTONETTOUNOTARIO
  end else if AItem = btvGCRighiGC_COSTONETTOUNITARIO then begin
    AAllow := (Tipologia='Materiali / Apparecchi') or (Tipologia='Altre spese');
  // GC_RICARICO_MOD
  end else if AItem = btvGCRighiGC_RICARICO_MOD then begin
    AAllow := (Tipologia='Materiali / Apparecchi') or (Tipologia='Altre spese');
  // GC_RICARICO
  end else if AItem = btvGCRighiGC_RICARICO then begin
    AAllow := (Tipologia='Materiali / Apparecchi') or (Tipologia='Altre spese');
  // SOTTOCANTIERE 1
  end else if (AItem = btvGCRighiSOTTOCANTIERE1) or (AItem = btvGCRighiSOTTOCANTIERE2)or (AItem = btvGCRighiSOTTOCANTIERE3) then begin
    AAllow := True;
  end;
end;

procedure TTabGCForm.btvGCGIACENZA_QTAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // Fa in modo che se il campo contiene un valore a zero non lo visualizza nemmeno
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0)
  then begin
    AText := '';
  end;
end;

procedure TTabGCForm.btvGCRighiTRACK_PREVENTIVOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // Funzione che ritorna il testo dei campi di Tracking dei documenti opportunamente
  //  rielaborati per una migliore visualizzazione
  AText := ElaboraDescrizioneTracking(AText, ((Sender as TcxGridDBBandedColumn).GroupIndex <> -1), ARecord);
end;

procedure TTabGCForm.btvGCTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems18GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  // Se il valore è positivo aggiunge il "+" perchè trattandosi di una variazione
  //  penso sia meglio esplicitarlo
  if VarIsNull(AValue) or (AValue = 0) then
    AText := ''
  else
  if AValue > 0 then
    AText := '+' + AText;
end;

procedure TTabGCForm.btvGCTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems19G(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  // Se è zero non visualizza nulla
  if VarIsNull(AValue) or (AValue = 0) then
    AText := '';
end;

// Funzione che ritorna il testo dei campi di Tracking dei documenti opportunamente
//  rielaborati per una migliore visualizzazione
function TTabGCForm.ElaboraDescrizioneTracking(AText:String; Grouped:Boolean; ARecord: TcxCustomGridRecord): String;
var
  Tipologia: String;
  Prec: String;
begin
  // Inizializzazione
  Prec := AText;
  AText := Trim(AText);
  if not VarIsNull(ARecord.Values[btvGCRighiTIPOLOGIA.Index]) then Tipologia := ARecord.Values[btvGCRighiTIPOLOGIA.Index];
  // In base a se è in raggrupamento...
  if Grouped then begin
    // Toglie la prima parte del testo del gruppo
    AText := Copy(AText, Pos(' :', AText)+3, 9999);
    // Se  AText non contiene un valore valido...
    //  lo rimette a posto ponendolo allo stesso valore
    //  della chiamate altrimenti da un errore.
    if (AText = '') or (AText = 'n.c.') then begin
      Result := Prec;
      Exit;
    end;
    // Compone il risultato
    Result := '   ' + DM1.ExpDocToDocType(AText) + ' n° ' + IntToStr(DM1.ExpDocToDocNum(AText)) + DM1.ExpDocToDocReg(AText) + ' del ' + DM1.ExpDocToDocDateStr(AText);
    Prec := DM1.ExpDocToDocRagioneSocialeStr(AText);
    if Prec <> '' then Result := Result + 'di ' + Prec + '...'
  end else begin
    // NB: Se è un rigo di manodopera mette la dicitura "n.d."
    if (Tipologia <> 'Materiali / Apparecchi') then begin
      Result := 'n.d.';
      Exit;
    end;
    // Fa in modo che sparisca il tipo di documento in modo che non occupi
    //  spazio inutile e anche il mittente
    Result := Copy(AText, Pos(' ', AText)+1, 9999);
  end;
end;

procedure TTabGCForm.dxPrinterStartGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  inherited;
  // In stampa allarga le colone del tracking
  AdattaLarghezzaColonneTracking(True);
  // Cambia alcuni colori per adattarlo meglio alla stampa
  btvGCRighi.Styles.Group.Color := clWhite;
end;

// Procedure che cambia la larghezza delle colonne di tracking per adattarle alla stampa
procedure TTabGCForm.AdattaLarghezzaColonneTracking(ForPrint:Boolean);
var
  W: Integer;
begin
  // Imposta la nuova larghezza
  W := 65;
  if ForPrint then W := 100;
  // In stampa allarga le colone del tracking
  btvGCRighiTRACK_PREVENTIVO.BestFitMaxWidth := W;
  btvGCRighiTRACK_PREVENTIVO.MinWidth := W;
  btvGCRighiTRACK_PREVENTIVO.Width := W;
  btvGCRighiTRACK_COMMESSA.BestFitMaxWidth := W;
  btvGCRighiTRACK_COMMESSA.MinWidth := W;
  btvGCRighiTRACK_COMMESSA.Width := W;
  btvGCRighiTRACK_DDT.BestFitMaxWidth := W;
  btvGCRighiTRACK_DDT.MinWidth := W;
  btvGCRighiTRACK_DDT.Width := W;
  btvGCRighiTRACK_SAL.BestFitMaxWidth := W;
  btvGCRighiTRACK_SAL.MinWidth := W;
  btvGCRighiTRACK_SAL.Width := W;
  btvGCRighiTRACK_ESTRATTO_CONTO.BestFitMaxWidth := W;
  btvGCRighiTRACK_ESTRATTO_CONTO.MinWidth := W;
  btvGCRighiTRACK_ESTRATTO_CONTO.Width := W;
  btvGCRighiTRACK_FATTURA.BestFitMaxWidth := W;
  btvGCRighiTRACK_FATTURA.MinWidth := W;
  btvGCRighiTRACK_FATTURA.Width := W;
end;

procedure TTabGCForm.dxPrinterEndGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  inherited;
  // In stampa allarga le colone del tracking
  AdattaLarghezzaColonneTracking(False);
  // Cambia alcuni colori per adattarlo meglio alla stampa
  btvGCRighi.Styles.Group.Color := $00FBE0DB;
end;

procedure TTabGCForm.btvGCRighiEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  inherited;
   // In base al tipo del mittente
   if Target is TListView then begin
      // Se il mittente è la ricezione di un documento dal sistema di interscambio dei documenti...
      if (Target as TListView).Name = 'ListViewExpDoc' then begin
        // Esporta i righi selezionati del Giornale di Cantiere
        EsportaNewGC;
      end;
   end;
end;

function TTabGCForm.Get_GC_IsVistaDettaglio: Boolean;
begin
  Result := (not SbGcVisPerArticolo.Down) and (not SbGcVisCronologicoGiorno.Down) and (not SbGcVisCronologicoMese.Down); 
end;


procedure TTabGCForm.GCSottocantiere1PropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  Combo:TcxComboBox;
  StcIndex: String;
begin
  // Inizializzazione
  Combo := (Sender as TcxComboBox);
  StcIndex := RightStr(Combo.Name, 1);
  Combo.Properties.Items.Clear;
  Combo.Properties.Items.Add('');
  // Se il documento non appartiene ad una pratica esce subito
  if (ClientiForm.PraticaCorrente = '0') or (ClientiForm.PraticaCorrente = '') then Exit;
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta query
    Qry.SQL.Add('SELECT ID FROM SOTTOCANTIERI' + StcIndex + ' WHERE');
    Qry.SQL.Add('TIPOCANTIERE = ''P''');
    Qry.SQL.Add('AND CODICECANTIERE = ' + ClientiForm.PraticaCorrente);
    Qry.SQL.Add('AND DATAAPERTURACANTIERE = ''' + ClientiForm.DataPraticaCorrenteSQL + '''');
    Qry.Open;
    // Caricamento dati
    while not Qry.Eof do
    begin
      Combo.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TTabGCForm.Contuttelerighe1Click(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('D.D.T.', True);
end;

procedure TTabGCForm.Soloconlerigheselezionate1Click(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('D.D.T.', False);
end;

procedure TTabGCForm.Contuttelerighe2Click(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('S.A.L.', True);
end;

procedure TTabGCForm.Soloconlerigheselezionate2Click(Sender: TObject);
begin
  inherited;
  GC_GeneraDocumento('S.A.L.', False);
end;

procedure TTabGCForm.TimerAutoqueryDblClickTimer(Sender: TObject);
begin
  inherited;
  TimerAutoqueryDblClick.Enabled := False;
  TabGCForm.TrovaButtonClick(Self);
end;

// Procedure che inizializza alcuni campi del nuovo rigo se questi sono nulli
procedure TTabGCForm.InitNewItemRowFields(Sender: TcxCustomGridTableView);
var
  FR: TcxCustomGridRecord;
begin
  FR := Sender.Controller.FocusedRecord;
  if FR = nil then Exit;
  if VarIsNull(FR.Values[btvGCRighiTIPODOCUMENTO.Index])            then FR.Values[btvGCRighiTIPODOCUMENTO.Index] := 'Giornale_cantiere';
  if VarIsNull(FR.Values[btvGCRighiNUMORDPREV.Index])               then FR.Values[btvGCRighiNUMORDPREV.Index] := StrToInt(ClientiForm.PraticaCorrente);
  if VarIsNull(FR.Values[btvGCRighiREGISTRO.Index])                 then FR.Values[btvGCRighiREGISTRO.Index] := DM1.RegistroDefault;
  if VarIsNull(FR.Values[btvGCRighiDATADOCUMENTO.Index])            then FR.Values[btvGCRighiDATADOCUMENTO.Index] := StrToDate(ClientiForm.DataPraticaCorrente);
  if VarIsNull(FR.Values[btvGCRighiPROGRIGO.Index])                 then FR.Values[btvGCRighiPROGRIGO.Index] := NextProgRigo;
  if VarIsNull(FR.Values[btvGCRighiPROGRIGO2.Index])                then FR.Values[btvGCRighiPROGRIGO2.Index] := (-1);
  if VarIsNull(FR.Values[btvGCRighiTIPOLOGIA.Index])                then FR.Values[btvGCRighiTIPOLOGIA.Index] := 'Materiali / Apparecchi';
  if VarIsNull(FR.Values[btvGCRighiGC_SEZIONE.Index])               then FR.Values[btvGCRighiGC_SEZIONE.Index] := 'Giacenza';
  if VarIsNull(FR.Values[btvGCRighiSEGNOOPERAZIONECANTIERE.Index])  then FR.Values[btvGCRighiSEGNOOPERAZIONECANTIERE.Index] := '+';
  if VarIsNull(FR.Values[btvGCRighiSEGNOOPERAZIONE.Index])          then FR.Values[btvGCRighiSEGNOOPERAZIONE.Index] := '=';
  if VarIsNull(FR.Values[btvGCRighiRIFPRATICA.Index])               then FR.Values[btvGCRighiRIFPRATICA.Index] := ClientiForm.PraticaCorrente + ' - ' + ClientiForm.DataPraticaCorrente + ' - ' + ClientiForm.DescPraticaCorrente;
end;

procedure TTabGCForm.QryNewGCNewRecord(DataSet: TDataSet);
begin
  inherited;
  // Default campi
  DataSet.FieldByName('TIPODOCUMENTO').Value := 'Giornale_cantiere';
  DataSet.FieldByName('NUMORDPREV').Value := StrToInt(ClientiForm.PraticaCorrente);
  DataSet.FieldByName('REGISTRO').Value := DM1.RegistroDefault;
  DataSet.FieldByName('DATADOCUMENTO').Value := ClientiForm.DataPraticaCorrente;
  DataSet.FieldByName('PROGRIGO').Value := NextProgRigo;
  DataSet.FieldByName('PROGRIGO2').Value := -1;
  DataSet.FieldByName('SEGNOOPERAZIONECANTIERE').Value := '+';
  DataSet.FieldByName('SEGNOOPERAZIONE').Value := '=';
  DataSet.FieldByName('PRATICA').Value := StrToInt(ClientiForm.PraticaCorrente);
  DataSet.FieldByName('DATAPRATICA1').Value := StrToDate(ClientiForm.DataPraticaCorrente);
  DataSet.FieldByName('RIFPRATICA').Value := ClientiForm.PraticaCorrente + ' - ' + ClientiForm.DataPraticaCorrente + ' - ' + ClientiForm.DescPraticaCorrente;
  DataSet.FieldByName('CODICECLIENTE').Value := StrToInt(ClientiForm.ClienteCorrente);
end;


// Funzione che ritorna la TIPOLOGIA del rigo
//  NB: Inizializza la variabile OperaIndex a -1 che significa che il relativo campo del rigo non ha un valore
//       infatti assumo che se OperaIndex è nullo (-1) significa che il rigo non è un rigo di manodopera e quindi
//       come tipologia ritorna 'Materiali / Apparecchi' altrimenti ritorna la desrizione del tipo di
//       manodopera.
//       Ho dovuto fare così per far funzionare bene l'inserimento al volo direttamente nel giornale di cantiere altrimenti
//       per questo tipo di righi il valore di TIPOLOGIA e GC_SEZIONE faceva casino in quanto sono campi che in realtà
//       non esistono.
function TTabGCForm.CalcolaTipologiaRigo(DC:TcxCustomDataController; RI:Integer; CurrTipologiaText:String='NONE'): String;
var
  OperaIndex: Integer;
  CurrTipologia: String;
begin
  // Inizializzazione
  //  NB: Inizializza la variabile OperaIndex a -1 che significa che il relativo campo del rigo non ha un valore
  //       infatti assumo che se OperaIndex è nullo (-1) significa che il rigo non è un rigo di manodopera e quindi
  //       come tipologia ritorna 'Materiali / Apparecchi' altrimenti ritorna la desrizione del tipo di
  //       manodopera.
  //       Ho dovuto fare così per far funzionare bene l'inserimento al volo direttamente nel giornale di cantiere altrimenti
  //       per questo tipo di righi il valore di TIPOLOGIA e GC_SEZIONE faceva casino in quanto sono campi che in realtà
  //       non esistono.
  Result := '';
  OperaIndex := -1;
  // Determina il valore attuale della Tipologia
  if CurrTipologiaText = 'NONE'
    then CurrTipologia := DC.DisplayTexts[RI, btvGCRighiTIPOLOGIA.Index]
    else CurrTipologia := CurrTipologiaText;
  // Se il campo OperaIndex del rigo non è nullo lo assegna alla variabile
  if not VarIsNull(DC.Values[RI, btvGCRighiOPERAINDEX.Index])
    then OperaIndex := DC.Values[RI, btvGCRighiOPERAINDEX.Index];
  // Se il valore del campo è nullo significa che si tratta di un rigo aggiunto al volo e allora ritorna il valore
  //  deducendolo dal fatto che se OperaIndex <> -1 si tratta di manodopera altrimenti di Materiali/Apparecchi
  if Trim(CurrTipologia) = '' then begin
    if OperaIndex = -1
    then CurrTipologia := 'Materiali / Apparecchi'
    else CurrTipologia := DM1.Manodopera[OperaIndex].Descrizione;
  end;
  // IMposta il valore da ritornare
  Result := CurrTipologia;
end;

// Procedure che imposta le query per Update/Insert in base alla situazione per fare in modo che
//  queste operazioni avvengano nella tabella giusta
procedure TTabGCForm.ImpostaInsertUpdateQuery(DC:TcxCustomDataController; RI: Integer);
var
  CurrTipologia: String;
begin
  // Inizializzazione
  CurrTipologia := CalcolaTipologiaRigo(DC, RI);
  // IN base alla tipologia del rigo attuale imposta le query per L'Insert/Update appropriate
  //  Materiali / Apparecchi
  if CurrTipologia = 'Materiali / Apparecchi' then begin
    SetMaterialiApparecchiInsertSQL;
    SetMaterialiApparecchiUpdateSQL;
  // Altre spese
  end else if CurrTipologia = 'Altre spese' then begin
    SetAltreSpeseUpdateSQL;
  // Manodopera
  end else begin
    SetManodoperaInsertSQL;
    SetManodoperaUpdateSQL;
  end;
end;



procedure TTabGCForm.btvGCRighiFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  // IN base alla tipologia del rigo attuale imposta le query per L'Insert/Update appropriate
  //  Materiali / Apparecchi
  // Inizializzazione
  if AFocusedRecord <> nil then begin
    ImpostaInsertUpdateQuery(Sender.DataController, AFocusedRecord.RecordIndex);
  end;
end;

procedure TTabGCForm.btvGCRighiTIPOLOGIAGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  OperaIndex: Integer;
begin
  inherited;
  //  NB: NOn mettere il controllo se FocusedRecordIndex = -1 perchè da dei problemi
  AText := CalcolaTipologiaRigo(Sender.GridView.DataController, ARecordIndex, AText);
end;

procedure TTabGCForm.btvGCRighiGC_SEZIONEGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
  inherited;
  // Se il valore del campo è nullo significa che è un rigo aggiunto al volo
  //  direttamente dal giornale di cantiere e quindi ritorna il valore di Giacenza
  //  che è quello corretto in questo caso.
  if Trim(AText) = '' then AText := 'Giacenza';
end;

procedure TTabGCForm.btvGCRighiEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  inherited;
  // IN base alla tipologia del rigo attuale imposta le query per L'Insert/Update appropriate
  //  Materiali / Apparecchi
  // Inizializzazione
  //  NB: LO faccio anche qui perchè mi serviva di eseguirlo anche dopo l'editing ma prima del post
  //  NB: NOn mettere il controllo se FocusedRecordIndex = -1 perchè da dei problemi
  ImpostaInsertUpdateQuery(Sender.DataController, Sender.DataController.FocusedRecordIndex);
end;

procedure TTabGCForm.QryNewGCBeforePost(DataSet: TDataSet);
var
  NewGuid: String;
begin
  inherited;
  // Se necessario, crea i GUID dei righi
  if DataSet.FieldByName('GUID').IsNull then begin
    NewGuid := DM1.GUIDAsString;
    DataSet.FieldByName('GUID').Value := NewGuid;
    if DataSet.FieldByName('GUID_REF').IsNull then DataSet.FieldByName('GUID_REF').Value := NewGuid;
  end;
end;

procedure TTabGCForm.NuovoArticoloGC;
begin
  Application.CreateForm(TQtaArticoloGCForm, QtaArticoloGCForm);
  try
    QtaArticoloGCForm.UnitaDiMisura := 'nr';
    QtaArticoloGCForm.Qta := 1;
    QtaArticoloGCForm.Ricarico := GcVisRicaricoPerc.Value;
    QtaArticoloGCForm.ShowModal;
  finally
    QtaArticoloGCForm.Close;
    QtaArticoloGCForm.Free;
  end;
end;



procedure TTabGCForm.RigamanualesoloMaterialiApparecchi1Click(
  Sender: TObject);
begin
  inherited;
  NuovoArticoloGC;
end;

procedure TTabGCForm.Schedaanagraficaarticolo1Click(Sender: TObject);
begin
  inherited;
  if DM1.ModCtrl(MOD_ARTICOLI) > 0 then begin
    DM1.ShowWait('Levante', 'Apertura scheda anagrafica articolo...');
    try
      Application.CreateForm(TAnagArtForm, AnagArtForm);
      // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
      //  che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
      //  Il problema lo dava solo quando assegnavo la proprietà Parent della form AnagArtForm.
      //  con le altre form andava bene.
      MainForm.FormSetParentPlatformDependent(AnagArtForm, MainForm);
      Windows.SetParent(AnagArtForm.Handle, MainForm.Handle);
      AnagArtForm.CodiceArticolo := QryNewGCCODICEARTICOLOREALE.AsString;
      AnagArtForm.Tag := 1;
      AnagArtForm.Show;
    finally
      DM1.CloseWait;
    end;
  end;
end;

procedure TTabGCForm.Documento1Click(Sender: TObject);
var
  DC: TcxCustomDataController;
  RI, DocNum: Integer;
  DocType, Registro, GUIDToSearch: String;
  DocDate: TDateTime;
  Tipologia: String;
begin
  inherited;
  // Solo se un rigo dettaglio
  if GridGC.FocusedView = btvGC then Exit;
  // Seleziona la pratica
  if (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) then begin
    // Inizializzazione
    DC := GridGC.FocusedView.DataController;
    RI := DC.FocusedRecordIndex;
    GUIDToSearch := Trim(DC.DisplayTexts[RI, btvGCRighiGUID_REF.Index]);
    // Carica su delle varibili di appoggio i dati identificativi del document
    DocType   := DC.Values[RI, btvGCRighiTIPODOCUMENTO.Index];
    Registro  := DC.Values[RI, btvGCRighiREGISTRO.Index];
    DocNum    := DC.Values[RI, btvGCRighiNUMORDPREV.Index];
    DocDate   := DC.Values[RI, btvGCRighiDATADOCUMENTO.Index];
    Tipologia := DC.Values[RI, btvGCRighiTIPOLOGIA.Index];
    // Se è un rigo inserito a mano nel Giornale di cantiere esce subito
    if DocType = 'Giornale_cantiere' then Exit;
    // Se è un rapporto giornaliero...
    if DocType = 'Rapp.giorn.' then begin
      DM1.ShowWait('Levante', 'Apertura documento...');
      try
        // Crea e visualizza il rapporto giornaliero
        Application.CreateForm(TRappGiornForm, RappGiornForm);
        RappGiornForm.Parent     := MainForm;
        RappGiornForm.NumDoc     := DocNum;
        RappGiornForm.DataDoc    := DocDate;
        RappGiornForm.Registro   := Registro;
        RappGiornForm.Tag := 1;
        RappGiornForm.Show;
        // Localizza il rigo
        RappGiornForm.LocateGUID(Tipologia, GUIDToSearch);
      finally
        DM1.CloseWait;
      end;
    //  Altrimenti se un altro tipo di documento...
    end else begin
      DM1.ShowWait('Levante', 'Apertura documento...');
      try
        // Crea e visualizza la form con il documento selezionato
        DM1.ApriDocFiscLocalizzaRigo(DocType, DocNum, Registro, DocDate, GUIDToSearch, False);
      finally
        DM1.CloseWait;
      end;
    end;
  end;
end;


// Procedura che abilita/disabilita le voci del menù
procedure TTabGCForm.OpenDocMenuPopup(Sender: TObject);
var
  DC: TcxCustomDataController;
  RI: Integer;
  TmpStr: String;
  procedure ControllaAbilitazioneDocumentoTracking(MI:TMenuItem; CurrItemIndex:Integer);
  begin
    TmpStr := Trim(DC.DisplayTexts[RI, CurrItemIndex]);
    if TmpStr <> '' then
    begin
      MI.Caption := DM1.ExpDocToDocType(DC.Values[RI, CurrItemIndex]) + ' n. ' + IntToStr(DM1.ExpDocToDocNum(DC.Values[RI, CurrItemIndex])) + DM1.ExpDocToDocReg(DC.Values[RI, CurrItemIndex]) + ' del ' + DateToStr(DM1.ExpDocToDocDate(DC.Values[RI, CurrItemIndex]));
      MI.Visible := True;
    end
    else
      MI.Visible := False;
  end;
begin
  inherited;
  // Tutto invisibile
  for RI := 0 to OpenDocMenu.Items.Count -1 do
    if not OpenDocMenu.Items[RI].IsLine then OpenDocMenu.Items[RI].Visible := False;
  // Verifica permessi
  if not (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) then Exit;
  // Solo se siamo su un rigo di dati
  if ((GridGC.FocusedView as TcxGridDBBandedTableView).Controller.FocusedRecord = nil) or (not (GridGC.FocusedView as TcxGridDBBandedTableView).Controller.FocusedRecord.IsData) then
    Exit;
  // Inizializzazione
  DC := GridGC.FocusedView.DataController;
  RI := DC.FocusedRecordIndex;
  // Se la GridView attiva è GridGC verifica solo per l'apertura della scheda anagrafica articolo
  if GridGC.FocusedView = btvGC then
  begin
    // ---------------------------------------------------------------------------
    // ARTICOLO
    TmpStr := Trim(DC.DisplayTexts[RI, btvGCCODICEARTICOLO.Index]);
    if (TmpStr <> '') and DM1.ArticoloEsistente(TmpStr) then begin
      Schedaanagraficaarticolo1.Caption := 'Scheda anagrafica articolo';
      Schedaanagraficaarticolo1.Visible := True;
    end;
    // ---------------------------------------------------------------------------
  end
  // Se invece la grid GC attiva è qualunque altra verifica tutto
  else
  begin
    // ---------------------------------------------------------------------------
    // ARTICOLO
    TmpStr := Trim(DC.DisplayTexts[RI, btvGCRighiCODICEARTICOLOREALE.Index]);
    if (TmpStr <> '') and DM1.ArticoloEsistente(TmpStr) then begin
      Schedaanagraficaarticolo1.Caption := 'Scheda anagrafica articolo';
      Schedaanagraficaarticolo1.Visible := True;
    end;
    // ---------------------------------------------------------------------------
    // DOCUMENTO CARICO
    TmpStr := Trim(DC.DisplayTexts[RI, btvGCRighiTIPODOCUMENTO.Index]);
    if TmpStr <> 'Giornale_cantiere' then begin
      Documento1.Caption := 'Documento   (' + TmpStr + ')';
      Documento1.Visible := True;
    end;
    // ---------------------------------------------------------------------------
    // TRACKING DOCUMENTO
    ControllaAbilitazioneDocumentoTracking(Preventivo1,         btvGCRighiTRACK_PREVENTIVO.Index);
    ControllaAbilitazioneDocumentoTracking(Commessa1,           btvGCRighiTRACK_COMMESSA.Index);
    ControllaAbilitazioneDocumentoTracking(DDT2,                btvGCRighiTRACK_DDT.Index);
    ControllaAbilitazioneDocumentoTracking(SAL2,                btvGCRighiTRACK_SAL.Index);
    ControllaAbilitazioneDocumentoTracking(Estrattoconto1,      btvGCRighiTRACK_ESTRATTO_CONTO.Index);
    ControllaAbilitazioneDocumentoTracking(Fattura1,            btvGCRighiTRACK_FATTURA.Index);
    ControllaAbilitazioneDocumentoTracking(Ordinefornitore1,    btvGCRighiTRACK_ORD_FORN.Index);
    ControllaAbilitazioneDocumentoTracking(Bolladientrata1,     btvGCRighiTRACK_BOLLA_ENTR.Index);
    ControllaAbilitazioneDocumentoTracking(Fatturadiacquisto1,  btvGCRighiTRACK_FATT_ACQUI.Index);
    // ---------------------------------------------------------------------------
  end;
end;



// Procedura che  apre il documento relativo alla colonna di tracking specificata e si posiziona sul rigo
procedure TTabGCForm.ApriDocumentoTracking(DC:TcxCustomDataController; RI:Integer; TrackColID:Integer);
var
  CurrNumDoc: Integer;
  CurrTipoDoc, CurrRegDoc, GUIDToSearch: String;
  CurrDataDoc: TDateTime;
begin
  inherited;
  // Solo se un rigo dettaglio
  if GridGC.FocusedView = btvGC then Exit;
  // Verifica permessi
  if not (DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 0) then Exit;
  // Inizializzazione
  GUIDToSearch := Trim(DC.DisplayTexts[RI, btvGCRighiGUID_REF.Index]);
  // Verifica esistenza documento
  if Trim( DC.DisplayTexts[RI, TrackColID] ) = '' then Exit;
  // Ricava i dati del documento in alcune variabili per comodità
  CurrTipoDoc := DM1.ExpDocToDocType(DC.Values[RI, TrackColID]);
  CurrNumDoc  := DM1.ExpDocToDocNum(DC.Values[RI, TrackColID]);
  CurrRegDoc  := DM1.ExpDocToDocReg(DC.Values[RI, TrackColID]);
  CurrDataDoc := DM1.ExpDocToDocDate(DC.Values[RI, TrackColID]);
  // Se è un rigo inserito a mano nel Giornale di cantiere esce subito
  if CurrTipoDoc = 'Giornale_cantiere' then Exit;
  // Crea e visualizza la form con il documento selezionato
  DM1.ApriDocFiscLocalizzaRigo(CurrTipoDoc, CurrNumDoc, CurrRegDoc, CurrDataDoc, GUIDToSearch, False);
end;


procedure TTabGCForm.Preventivo1Click(Sender: TObject);
begin
  inherited;
  // Apre il documento
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_PREVENTIVO.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.Commessa1Click(Sender: TObject);
begin
  inherited;
  // Apre il documento
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_COMMESSA.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.DDT2Click(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_DDT.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.SAL2Click(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_SAL.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.Estrattoconto1Click(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_ESTRATTO_CONTO.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.Fattura1Click(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_FATTURA.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.Ordinefornitore1Click(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_ORD_FORN.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.Bolladientrata1Click(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_BOLLA_ENTR.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.Fatturadiacquisto1Click(Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Apertura documento...');
  try
    ApriDocumentoTracking(GridGC.FocusedView.DataController, GridGC.FocusedView.DataController.FocusedRecordIndex, btvGCRighiTRACK_FATT_ACQUI.Index);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabGCForm.MenuElencoClientiPopup(Sender: TObject);
var
  i: Integer;
  NewMenuItem: TMenuItem;
  M: TPopupMenu;
begin
  inherited;
  // Inizializza tutti i meno a non abilitati se siamo in modalità di modifica
  //   NB: Ho dovuto fare così perchè quando il GC va in modifica apre una transazione
  //        che rimane aperta finchè non si conferma o si annulla e questo crea dei casini
  M := Sender as TPopupMenu;
  for i := 0 to M.Items.Count -1 do
    M.Items[i].Enabled := (not ClientiForm.RxSpeedModifica.Down);
  // IMposta e attacca all'apposita voce di questomenù il sottomenù
  //  per l'apertura dei documenti
  //  NB: Solo se non siamo in modalità di modifica.
  if (not ClientiForm.RxSpeedModifica.Down) then
  begin
    OpenDocMenuPopup(OpenDocMenu);
    ApriVisualizzaVaia1.Clear;
    for i := 0 to OpenDocMenu.Items.Count -1 do
    begin
      NewMenuItem := TMenuItem.Create(Self);
      NewMenuItem.Caption := OpenDocMenu.Items[i].Caption;
      NewMenuItem.Visible := OpenDocMenu.Items[i].Visible;
      NewMenuItem.OnClick := OpenDocMenu.Items[i].OnClick;
      ApriVisualizzaVaia1.Insert(i, NewMenuItem);
    end;
  end;
end;

procedure TTabGCForm.GCCantieriApertiChiusiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   CheckIndex:Integer;
   CurrCheckListBox:TCheckListBox;
   i: Integer;
begin
   // ----------------------------------------------------------------------------------------------------
   // Questo codice server per fare in modo che anche se l'utente clicca sul titolo della voce, questa
   //  venga selezinata o deselezionata come se si fosse cliccato sul riquadrino del segno di check)
   // ----------------------------------------------------------------------------------------------------
   // La variabie CurrCheckListBox Punta alla CheckListBox che ha richiamata l'evento
   CurrCheckListBox := Sender as TCheckListBox;
   // Solo se sè cliccato con il pulsante SX del mouse
   if Button = mbLeft then begin
      // Quale voce si trova sotto il mouse?
      CheckIndex := CurrCheckListBox.ItemAtPos(Point(X,Y), True);
      // Se c'era una voce cambia il suo stato
      if CheckIndex <> -1 then begin
         if CurrCheckListBox.Tag = 0 then CurrCheckListBox.Checked[CheckIndex] := not CurrCheckListBox.Checked[CheckIndex];
         // Rimette la Proprietà Tag del componente = 0
         CurrCheckListBox.Tag := 0;
      end;
   // Se invece è stato premuto il pulsante DX
   end else if Button = mbRight then begin
      // Quale voce si trova sotto il mouse?
      CheckIndex := CurrCheckListBox.ItemAtPos(Point(X,Y), True);
      // Deseleziona tutti i documenti
      for i := 0 to CurrCheckListBox.Items.Count -1 do CurrCheckListBox.Checked[i] := False;
      // Chekka il documento
      CurrCheckListBox.Checked[CheckIndex] := True;
      // Esegue la ricerca
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CurrCheckListBox.ItemIndex := -1;
   // ----------------------------------------------------------------------------------------------------
end;

procedure TTabGCForm.btvGCRighiDataControllerFilterRecord(ADataController: TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
begin
  inherited;
  Accept := (btvGCRighiRIFDOC.GroupIndex <> -1) or (ADataController.Values[ARecordIndex, btvGCRighiTIPOLOGIA.Index] <> 'Relazione Intervento');
end;

procedure TTabGCForm.btvGCRighiDataControllerSortingChanged(
  Sender: TObject);
begin
  inherited;
   btvGCRighi.Controller.GoToFirst(False);
end;

// =============================================================================
// CALCOLO TOTALI E SUBTOTALI
// -----------------------------------------------------------------------------
procedure TTabGCForm.btvGCRighiDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);

  procedure CalcFooterSummary;
  var
    V1, V2, VResult: Double;

    function GetFooterSummaryValue(const AItemLink:TObject): Double;
    var
      LValue: Variant;
    begin
      LValue := ASender.FooterSummaryValues[ASender.FooterSummaryItems.IndexOfItemLink(AItemLink)];
      if VarIsNull(LValue) then
        Result := 0
      else
        Result := LValue;
    end;

    procedure SetFooterSummaryValue(const AItemLink:TObject; const AValue:Double);
    begin
      ASender.FooterSummaryValues[ASender.FooterSummaryItems.IndexOfItemLink(AItemLink)] := AValue;
    end;

  begin
    // Percentuale di ricarico medio
    V1 := GetFooterSummaryValue(btvGCRighiGC_GUADAGNOIMPORTO);
    V2 := GetFooterSummaryValue(btvGCRighiGC_COSTONETTOIMPORTO);
    if V2 <> 0 then
      VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCRighiGC_RICARICO, VResult);
  end;

  // ---------------------------------------------------------------------------
  procedure CalcGroupSummaries;

    function Groups: TcxDataControllerGroups;
    begin
      Result := btvGC.DataController.Groups;
    end;

    function GetGroupSummaryValue(const ADataGroupIndex:integer; const AItemLink:TObject): Double;
    var
      LValue: Variant;
      ASummaryItems: TcxDataSummaryItems;
    begin
      ASummaryItems := ASender.GroupSummaryItems[Groups.Level[ADataGroupIndex]];
      if not Assigned(ASummaryItems) then
        Exit;
      LValue := ASender.GroupSummaryValues[ADataGroupIndex, ASummaryItems.IndexOfItemLink(AItemLink)];
      if VarIsNull(LValue) then
        Result := 0
      else
        Result := LValue;
    end;

    procedure SetGroupSummaryValue(const ADataGroupIndex:integer; const AItemLink:TObject; const AValue:Double);
    var
      ASummaryItems: TcxDataSummaryItems;
    begin
      ASummaryItems := ASender.GroupSummaryItems[Groups.Level[ADataGroupIndex]];
      if not Assigned(ASummaryItems) then
        Exit;
      ASender.GroupSummaryValues[ADataGroupIndex, ASummaryItems.IndexOfItemLink(AItemLink)] := AValue;
    end;

    procedure CalcGroupSummary(ADataGroupIndex: Integer);
    var
      V1, V2, VResult: Variant;
    begin
      // Percentuale di ricarico medio
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCRighiGC_GUADAGNOIMPORTO);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCRighiGC_COSTONETTOIMPORTO);
      if V2 <> 0 then
        VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRighiGC_RICARICO, VResult);
    end;

    procedure CalcGroupSummariesByDataGroupIndex(ADataGroupIndex: Integer);
    var
      I: Integer;
    begin
      if Groups.Level[ADataGroupIndex] >= Groups.GroupingItemCount - 1 then
        Exit;
      for I := 0 to Groups.ChildCount[ADataGroupIndex] - 1 do
      begin
        CalcGroupSummary(Groups.ChildDataGroupIndex[ADataGroupIndex, I]);
        CalcGroupSummariesByDataGroupIndex(Groups.ChildDataGroupIndex[ADataGroupIndex, I]);
      end;
    end;

  begin
    CalcGroupSummariesByDataGroupIndex(-1);
  end;
  // ---------------------------------------------------------------------------

begin
  CalcFooterSummary;
  CalcGroupSummaries;
end;
// =============================================================================

procedure TTabGCForm.btvGCDataControllerSortingChanged(Sender: TObject);
begin
  inherited;
   btvGC.Controller.GoToFirst(False);
end;

// =============================================================================
// CALCOLO TOTALI E SUBTOTALI
// -----------------------------------------------------------------------------
procedure TTabGCForm.btvGCDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);

  procedure CalcFooterSummary;
  var
    V1, V2, VResult: Double;

    function GetFooterSummaryValue(const AItemLink:TObject): Double;
    var
      LValue: Variant;
    begin
      LValue := ASender.FooterSummaryValues[ASender.FooterSummaryItems.IndexOfItemLink(AItemLink)];
      if VarIsNull(LValue) then
        Result := 0
      else
        Result := LValue;
    end;

    procedure SetFooterSummaryValue(const AItemLink:TObject; const AValue:Double);
    begin
      ASender.FooterSummaryValues[ASender.FooterSummaryItems.IndexOfItemLink(AItemLink)] := AValue;
    end;

  begin
    // -------------------------------------------------------------------------
    // Percentuale di ricarico medio (commessa)
    V1 := GetFooterSummaryValue(btvGCCOMMESSA_GUADAGNOIMPORTO);
    V2 := GetFooterSummaryValue(btvGCCOMMESSA_IMPORTOACQ);
    if V2 <> 0 then
      VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCCOMMESSA_RICARICO, VResult);
    // Percentuale di ricarico medio (giacenza)
    V1 := GetFooterSummaryValue(btvGCGIACENZA_GUADAGNOIMPORTO);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    if V2 <> 0 then
      VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCGIACENZA_RICARICO, VResult);
    // Percentuale di ricarico medio (montato)
    V1 := GetFooterSummaryValue(btvGCMONTATO_GUADAGNOIMPORTO);
    V2 := GetFooterSummaryValue(btvGCMONTATO_IMPORTOACQ);
    if V2 <> 0 then
      VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCMONTATO_RICARICO, VResult);
    // -------------------------------------------------------------------------
    // Riepilogo: variazione costo effettivo (rispetto al costo preventivato in commessa)
    V1 := GetFooterSummaryValue(btvGCCOMMESSA_IMPORTOACQ);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    VResult := V2 - V1;
    SetFooterSummaryValue(btvGCRIEP_COSTI, VResult);
    // Riepologo: variazione margine effettivo rispetto alla commessa
    V1 := GetFooterSummaryValue(btvGCCOMMESSA_IMPORTOVEND);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    VResult := V1 - V2;
    SetFooterSummaryValue(btvGCRIEP_MARGINE_COMMESSA, VResult);
    // Riepologo: variazione margine effettivo rispetto alla fattura
    V1 := GetFooterSummaryValue(btvGCFATTURATO_IMPORTOVEND);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    VResult := V1 - V2;
    SetFooterSummaryValue(btvGCRIEP_MARGINE_FATTURATO, VResult);
    // Riepologo: variazione margine effettivo rispetto al montato
    V1 := GetFooterSummaryValue(btvGCMONTATO_IMPORTOVEND);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    VResult := V1 - V2;
    SetFooterSummaryValue(btvGCRIEP_MARGINE_MONTATO, VResult);
    // -------------------------------------------------------------------------
    // Riepilogo: variazione costo percentuale rispetto alla commessa
    V1 := GetFooterSummaryValue(btvGCCOMMESSA_IMPORTOACQ);
    V2 := GetFooterSummaryValue(btvGCRIEP_COSTI);
    if V1 <> 0 then
      VResult := SimpleRoundTo(V2 * 100 / V1, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCRIEP_PERC_COSTI, VResult);
    // Riepilogo: variazione margine percentuale rispetto alla commessa
    V1 := GetFooterSummaryValue(btvGCRIEP_MARGINE_COMMESSA);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    if V2 <> 0 then
      VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCRIEP_PERC_MARGINE_COMMESSA, VResult);
    // Riepilogo: variazione margine percentuale rispetto alla fattura
    V1 := GetFooterSummaryValue(btvGCRIEP_MARGINE_FATTURATO);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    if V2 <> 0 then
      VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCRIEP_PERC_MARGINE_FATTURATO, VResult);
    // Riepilogo: variazione margine percentuale rispetto al montato
    V1 := GetFooterSummaryValue(btvGCRIEP_MARGINE_MONTATO);
    V2 := GetFooterSummaryValue(btvGCGIACENZA_IMPORTOACQ);
    if V2 <> 0 then
      VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
    else
      VResult := 0;
    SetFooterSummaryValue(btvGCRIEP_PERC_MARGINE_MONTATO, VResult);
    // -------------------------------------------------------------------------
  end;

  // ---------------------------------------------------------------------------
  procedure CalcGroupSummaries;

    function Groups: TcxDataControllerGroups;
    begin
      Result := btvGC.DataController.Groups;
    end;

    function GetGroupSummaryValue(const ADataGroupIndex:integer; const AItemLink:TObject): Double;
    var
      LValue: Variant;
      ASummaryItems: TcxDataSummaryItems;
    begin
      ASummaryItems := ASender.GroupSummaryItems[Groups.Level[ADataGroupIndex]];
      LValue := ASender.GroupSummaryValues[ADataGroupIndex, ASummaryItems.IndexOfItemLink(AItemLink)];
      if VarIsNull(LValue) then
        Result := 0
      else
        Result := LValue;
    end;

    procedure SetGroupSummaryValue(const ADataGroupIndex:integer; const AItemLink:TObject; const AValue:Double);
    var
      ASummaryItems: TcxDataSummaryItems;
    begin
      ASummaryItems := ASender.GroupSummaryItems[Groups.Level[ADataGroupIndex]];
      ASender.GroupSummaryValues[ADataGroupIndex, ASummaryItems.IndexOfItemLink(AItemLink)] := AValue;
    end;

    procedure CalcGroupSummary(ADataGroupIndex: Integer);
    var
      V1, V2, VResult: Variant;
    begin
      // -------------------------------------------------------------------------
      // Percentuale di ricarico medio (commessa)
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_GUADAGNOIMPORTO);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_IMPORTOACQ);
      if V2 <> 0 then
        VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_RICARICO, VResult);
      // Percentuale di ricarico medio (giacenza)
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_GUADAGNOIMPORTO);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      if V2 <> 0 then
        VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_RICARICO, VResult);
      // Percentuale di ricarico medio (montato)
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCMONTATO_GUADAGNOIMPORTO);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCMONTATO_IMPORTOACQ);
      if V2 <> 0 then
        VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCMONTATO_RICARICO, VResult);
      // -------------------------------------------------------------------------
      // Riepilogo: variazione Qtà effettiva (rispetto alla Qtà preventivata in commessa)
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_QTA);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_QTA);
      VResult :=  V2 - V1;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_QTA, VResult);
      // Riepilogo: variazione costo effettivo (rispetto al costo preventivato in commessa)
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_IMPORTOACQ);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      VResult :=  V2 - V1;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_COSTI, VResult);
      // Riepologo: variazione margine effettivo rispetto alla commessa
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_IMPORTOVEND);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      VResult :=  V1 - V2;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_MARGINE_COMMESSA, VResult);
      // Riepologo: variazione margine effettivo rispetto alla fattura
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCFATTURATO_IMPORTOVEND);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      VResult :=  V1 - V2;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_MARGINE_FATTURATO, VResult);
      // Riepologo: variazione margine effettivo rispetto al Montato
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCMONTATO_IMPORTOVEND);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      VResult :=  V1 - V2;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_MARGINE_MONTATO, VResult);
      // -------------------------------------------------------------------------
      // Riepilogo: variazione Qtà percentuale rispetto alla commessa
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_QTA);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_QTA);
      if V1 <> 0 then
        VResult := SimpleRoundTo(V2 * 100 / V1, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_PERC_QTA, VResult);
      // Riepilogo: variazione costo percentuale rispetto alla commessa
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCCOMMESSA_IMPORTOACQ);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_COSTI);
      if V1 <> 0 then
        VResult := SimpleRoundTo(V2 * 100 / V1, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_PERC_COSTI, VResult);
      // Riepilogo: variazione margine percentuale rispetto alla commessa
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_MARGINE_COMMESSA);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      if V2 <> 0 then
        VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_PERC_MARGINE_COMMESSA, VResult);
      // Riepilogo: variazione margine percentuale rispetto alla fattura
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_MARGINE_FATTURATO);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      if V2 <> 0 then
        VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_PERC_MARGINE_FATTURATO, VResult);
      // Riepilogo: variazione margine percentuale rispetto al montato
      V1 := GetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_MARGINE_MONTATO);
      V2 := GetGroupSummaryValue(ADataGroupIndex, btvGCGIACENZA_IMPORTOACQ);
      if V2 <> 0 then
        VResult := SimpleRoundTo(V1 * 100 / V2, DM1.DecimaliMarginiPercentuali*(-1))
      else
        VResult := 0;
      SetGroupSummaryValue(ADataGroupIndex, btvGCRIEP_PERC_MARGINE_MONTATO, VResult);
    end;

    procedure CalcGroupSummariesByDataGroupIndex(ADataGroupIndex: Integer);
    var
      I: Integer;
    begin
      if Groups.Level[ADataGroupIndex] >= Groups.GroupingItemCount - 1 then
        Exit;
      for I := 0 to Groups.ChildCount[ADataGroupIndex] - 1 do
      begin
        CalcGroupSummary(Groups.ChildDataGroupIndex[ADataGroupIndex, I]);
        CalcGroupSummariesByDataGroupIndex(Groups.ChildDataGroupIndex[ADataGroupIndex, I]);
      end;
    end;

  begin
    CalcGroupSummariesByDataGroupIndex(-1);
  end;
  // ---------------------------------------------------------------------------

begin
  CalcFooterSummary;
  CalcGroupSummaries;
end;

procedure TTabGCForm.btvGCDataControllerSummaryFooterSummaryItemsSummary(ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments; var OutArguments: TcxSummaryEventOutArguments);
var
  LValue: Extended;
  LSummaryItem: TcxGridDBTableSummaryItem;
begin
  inherited;
  // Se abilitato calcula il totale considerando sempre il valore assoluto di ogni riga
  //  in pratica anche i valori negativi sono considerati come positivi
  if FValoreAssolutoTot_DatFattMontato  then
  begin
    LSummaryItem := Arguments.SummaryItem as TcxGridDBTableSummaryItem;
    if LSummaryItem.Column = btvGCDAFATT_MONTATO_IMPORTOVEND then
    begin
      LValue := ASender.DataController.Values[Arguments.RecordIndex, btvGCDAFATT_MONTATO_IMPORTOVEND.Index];
      // Questo codice imposta il valore del record corrente come assoluto e lascia poi al codice
      //  della griglia  la somma
      OutArguments.Value := Abs(LValue);
//      // IN alternativa funziona anche questo che esegue anche la somma
//      OutArguments.SummaryValue := OutArguments.SummaryValue + Abs(LValue);
//      OutArguments.Done := True;
    end;
  end;
end;

// =============================================================================

procedure TTabGCForm.SetSez_Visible_DaFatturare_Commessa(
  const Value: Boolean);
begin
  fSez_Visible_DaFatturare_Commessa := Value;
  if not Value then SbGcVisDaFatturareCommessa.Down := False;
  SbGcVisDaFatturareCommessa.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_DaFatturare_Giacenza(
  const Value: Boolean);
begin
  fSez_Visible_DaFatturare_Giacenza := Value;
  if not Value then SbGcVisDaFatturareGiacenza.Down := False;
  SbGcVisDaFatturareGiacenza.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_DaFatturare_Montato(
  const Value: Boolean);
begin
  fSez_Visible_DaFatturare_Montato := Value;
  if not Value then SbGcVisDaFatturareMontato.Down := False;
  SbGcVisDaFatturareMontato.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_DaMontare_Commessa(
  const Value: Boolean);
begin
  fSez_Visible_DaMontare_Commessa := Value;
  if not Value then SbGcVisDaMontareCommessa.Down := False;
  SbGcVisDaMontareCommessa.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_DaMontare_Giacenza(
  const Value: Boolean);
begin
  fSez_Visible_DaMontare_Giacenza := Value;
  if not Value then SbGcVisDaMontareGiacenza.Down := False;
  SbGcVisDaMontareGiacenza.Visible := Value;
end;

procedure TTabGCForm.SetSez_Visible_CategCant(const Value: Boolean);
begin
  fSez_Visible_CategCant := Value;
  if not Value then SbGcVisCategCant.Down := False;
  SbGcVisCategCant.Visible := Value;
end;

procedure TTabGCForm.GCCategCant1PropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  Combo:TcxComboBox;
  StcIndex: String;
begin
  // Inizializzazione
  Combo := (Sender as TcxComboBox);
  StcIndex := RightStr(Combo.Name, 1);
  Combo.Properties.Items.Clear;
  Combo.Properties.Items.Add('');
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta query
    Qry.SQL.Add('SELECT CAMPO1 FROM CATEGCANT' + StcIndex);
    Qry.Open;
    // Caricamento dati
    while not Qry.Eof do
    begin
      Combo.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CategCant1(const Value: Boolean);
begin
  fGC_Filter_Visible_CategCant1 := Value;
  GCCategCant1.Visible := Value;
  GCLabelCategCant1.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CategCant2(const Value: Boolean);
begin
  fGC_Filter_Visible_CategCant2 := Value;
  GCCategCant2.Visible := Value;
  GCLabelCategCant2.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CategCant3(const Value: Boolean);
begin
  fGC_Filter_Visible_CategCant3 := Value;
  GCCategCant3.Visible := Value;
  GCLabelCategCant3.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CategCant4(const Value: Boolean);
begin
  fGC_Filter_Visible_CategCant4 := Value;
  GCCategCant4.Visible := Value;
  GCLabelCategCant4.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CategCant5(const Value: Boolean);
begin
  fGC_Filter_Visible_CategCant5 := Value;
  GCCategCant5.Visible := Value;
  GCLabelCategCant5.Visible := Value;
end;

procedure TTabGCForm.SetGC_Filter_Visible_CategCant6(const Value: Boolean);
begin
  fGC_Filter_Visible_CategCant6 := Value;
  GCCategCant6.Visible := Value;
  GCLabelCategCant6.Visible := Value;
end;

procedure TTabGCForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DM1.SalvaDatePredefinitePerFiltri(GCDal.EditText, GCAl.EditText);
end;

procedure TTabGCForm.SbGcVisMemSetPredefClick(Sender: TObject);
begin
  inherited;
  if SbGcVisMemSetPredef.Down then begin
    MemPredef_StartSelection;
  end else begin
    MemPredef_StopSelection;
  end;
end;

procedure TTabGCForm.SetGC_MemoriaPredefinita(const Value: TSpeedButton);
begin
  // Memorizza il nuovo valore nel campo
  fGC_MemoriaPredefinita := Value;
  // Tutti i pulsanti hanno vengono settati come non predefiniti
  SbGcVisMem1.Font.Style  := [];
  SbGcVisMem2.Font.Style  := [];
  SbGcVisMem3.Font.Style  := [];
  SbGcVisMem4.Font.Style  := [];
  SbGcVisMem5.Font.Style  := [];
  SbGcVisMem6.Font.Style  := [];
  SbGcVisMem7.Font.Style  := [];
  SbGcVisMem8.Font.Style  := [];
  SbGcVisMem9.Font.Style  := [];
  SbGcVisMem10.Font.Style := [];
  // Invece il pulsante della memoria predefinita deve apparire in grassetto
  Value.Font.Style := [fsBold];
end;

procedure TTabGCForm.SetGC_Filter_SoloRighiNoZero(const Value: Boolean);
begin
  fGC_Filter_SoloRighiNoZero := Value;
  GCSoloRighiNoZero.Visible := Value;
  GCLabelSoloRighiNoZero.Visible := Value;
end;

procedure TTabGCForm.QryNewGCCalcFields(DataSet: TDataSet);
begin
  inherited;
  // Composizione del campo di riferimento al documento
  QryNewGCRIFDOC.Value := QryNewGCTIPODOCUMENTO.AsString + ' ' + QryNewGCNUMORDPREV.AsString + QryNewGCREGISTRO.AsString + ' del ' + QryNewGCDATADOCUMENTO.AsString;
  if Trim(QryNewGCRDA.AsString) <> '' then
  QryNewGCRIFDOC.Value := QryNewGCRIFDOC.Value + Format(' (RDA %s)', [Trim(QryNewGCRDA.AsString)]);

  // IMPORTO INVENTARIO ULTIMO ACQUISTO
  QryNewGCIMPORTOINVENTARIOUA.Value := QryNewGCMAG_ULTIMOPREZZOACQUISTO.AsCurrency * QryNewGCMAG_GIACENZA.AsFloat;

  // DISPONIBILE A MAGAZZINO
  if DM1.TableProgressiviMAG_ORDINATONELDISPONIBILE.AsBoolean
  then QryNewGCMAG_DISPONIBILE.Value := QryNewGCMAG_GIACENZA.AsFloat - QryNewGCMAG_IMPEGNATO.AsFloat + QryNewGCMAG_ORDINATO.AsFloat
  else QryNewGCMAG_DISPONIBILE.Value := QryNewGCMAG_GIACENZA.AsFloat - QryNewGCMAG_IMPEGNATO.AsFloat;
end;

procedure TTabGCForm.GCAgentePropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(GcAgente.Properties.Items, 1, '');
end;

procedure TTabGCForm.GCAgente2PropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(GcAgente2.Properties.Items, 2, GCAgente.Text);
end;

procedure TTabGCForm.GCAgente3PropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(GCAgente3.Properties.Items, 3, GCAgente2.Text);
end;

procedure TTabGCForm.GCAgente4PropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(GCAgente4.Properties.Items, 4, GCAgente3.Text);
end;

procedure TTabGCForm.GCAgentePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(1, GCAgente2);
end;

procedure TTabGCForm.GCAgente2PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(2, GCAgente3);
end;

procedure TTabGCForm.GCAgente3PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(3, GCAgente4);
end;

procedure TTabGCForm.GCTipo1PropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DESCRIZIONE FROM TIPIRIGHI WHERE LIVELLO = ''' + RightStr((Sender as TcxComboBox).Name, 1) + ''' AND ABILITATO <> ''F''');
      Qry.Open;
      (Sender as TcxComboBox).Properties.Items.Clear;
      (Sender as TcxComboBox).Properties.Items.Add('');
      while not Qry.Eof do begin
         (Sender as TcxComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

function TTabGCForm.GetGC_CantiereSelezionato: Boolean;
begin
  // Imposta il flag che indica se stiamo visualizzando il giornale di cantiere
  //  dall'interno di cantiere oppure dall'esterno
  Result := (ClientiForm.PraticaCorrente <> '') or not DM1.GC_CantiereNoSel_VisualizzazioneRiassuntiva;
end;

procedure TTabGCForm.SBFilterRowSoggettiClick(Sender: TObject);
begin
  inherited;
  // Attiva/Disattiva la Filter Row
  btvGC.FilterRow.Visible := (Sender as TSpeedButton).Down;
  if not btvGC.FilterRow.Visible then btvGC.DataController.Filter.Clear;
  // Attiva/Disattiva la Filter Row
  btvGCRighi.FilterRow.Visible := (Sender as TSpeedButton).Down;
  if not btvGCRighi.FilterRow.Visible then btvGCRighi.DataController.Filter.Clear;
end;

end.
