unit FormImpegni;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bmpPanel, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons,
  MAURI_SB, IB_Components, IBODataset, DB, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxSpinEdit, cxTimeEdit, cxCheckListBox,
  cxDBCheckListBox, Menus, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMemo, cxCheckBox,
  cxButtonEdit, cxGridBandedTableView, cxGridDBBandedTableView, DataModule1,
  cxPC, cxCurrencyEdit, FormGMap, ImgList, cxSplitter, FormAllegati,
  cxRichEdit, cxImageComboBox, cxData, cxDataStorage, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, cxColorComboBox,
  cxDBColorComboBox, dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations,
  System.ImageList, cxCustomListBox, qrddlgs;

const
  RESPIMP_TOP = 18;
  RESPIMP_MIDDLE = 28;
  RESPIMP_BOTTOM = 35;

  PANELDISABLED = $00F5F5F5;
  PANELENABLED = $00E9E9E9;

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
  TImpegnoForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    QryImp: TIBOQuery;
    SourceImp: TDataSource;
    QryAss: TIBOQuery;
    SourceAss: TDataSource;
    QryAssRAGSOCUT: TStringField;
    QryAssINDIRIZZOUT: TStringField;
    QryAssCAPUT: TStringField;
    QryAssCITTAUT: TStringField;
    QryAssPROVINCIAUT: TStringField;
    QryAssTELEFONOUT: TStringField;
    QryAssCELLULAREUT: TStringField;
    QryAssRAGSOCINST: TStringField;
    QryAssINDIRIZZOINST: TStringField;
    QryAssCAPINST: TStringField;
    QryAssCITTAINST: TStringField;
    QryAssPROVINCIAINST: TStringField;
    QryAssTELEFONOINST: TStringField;
    QryAssCELLULAREINST: TStringField;
    QryAssCOMUNEIMM: TStringField;
    QryAssINDIRIZZOIMM: TStringField;
    QryAssNUMCIVICOIMM: TStringField;
    QryAssPROVINCIAIMM: TStringField;
    QryAssPIANOIMM: TStringField;
    QryAssINTERNOIMM: TStringField;
    QryAssCOSTRUTTORE: TStringField;
    QryAssMODELLO: TStringField;
    QryAssMATRICOLA: TStringField;
    QryAssBREVEDESCRIZIONECALDAIA: TStringField;
    QryAssPOTENZANOMINALE: TStringField;
    QryAssDATAINSTALLAZIONE: TDateTimeField;
    QryAssDATAPRIMAACCENSIONE: TDateTimeField;
    QryAssTIPOCAMERA: TStringField;
    QryAssTIPOTIRAGGIO: TStringField;
    QryAssCOMBUSTIBILE: TStringField;
    QryAssCOMBUSTIBILEALTRO: TStringField;
    QryAssABBONATO: TStringField;
    QryAssDATAINIZIOABBONAMENTO: TDateTimeField;
    QryAssDATAFINEABBONAMENTO: TDateTimeField;
    QryAssRICEVUTADISDETTA: TStringField;
    QryAssDATADISDETTA: TDateTimeField;
    QryAssMEZZODISDETTA: TStringField;
    QryAssMEZZODISDETTAALTRO: TStringField;
    QryImpID: TIntegerField;
    QryImpPARENTID: TIntegerField;
    QryImpTIPOIMPEGNO: TStringField;
    QryImpEVENTTYPE: TIntegerField;
    QryImpSTART: TDateTimeField;
    QryImpFINISH: TDateTimeField;
    QryImpOPTIONS: TIntegerField;
    QryImpCAPTION: TStringField;
    QryImpRECURRENCEINDEX: TIntegerField;
    QryImpRECURENCEINFO: TBlobField;
    QryImpRESOURCEID: TIntegerField;
    QryImpLOCATION: TStringField;
    QryImpEVENTMESSAGE: TStringField;
    QryImpREMINDER: TIntegerField;
    QryImpSTATE: TIntegerField;
    QryImpLABELCOLOR: TIntegerField;
    QryImpTIPOINTERVENTO: TStringField;
    QryImpDATAORACHIAMATA: TDateTimeField;
    QryImpDATAORAINTERVENTO: TDateTimeField;
    QryImpRELAZIONEINTERVENTO: TMemoField;
    QryImpOSSERVAZIONI: TStringField;
    QryImpRACCOMANDAZIONI: TStringField;
    QryImpPRESCRIZIONI: TStringField;
    QryImpCLIENTE: TIntegerField;
    QryImpRAGSOCCLI: TStringField;
    QryImpINDIRIZZOCLI: TStringField;
    QryImpCITTACLI: TStringField;
    QryImpCAPCLI: TStringField;
    QryImpPROVINCIACLI: TStringField;
    QryImpPRATICA: TIntegerField;
    QryImpPRATICA2: TIntegerField;
    QryImpPRATICA3: TIntegerField;
    QryImpDATAPRATICA1: TDateTimeField;
    QryImpDATAPRATICA2: TDateTimeField;
    QryImpDATAPRATICA3: TDateTimeField;
    MenuStampe: TPopupMenu;
    Fogliodilavoro1: TMenuItem;
    QryAssTIPOCONTRATTO: TStringField;
    QryAssIMPORTOCONTRATTO: TIBOFloatField;
    QryAssPRATICA: TIntegerField;
    QryAssDATAPRATICA1: TDateTimeField;
    QryAssNOTE: TStringField;
    QryAssTIPOIMPIANTO: TStringField;
    QryAssPERIODICITA: TIntegerField;
    QryAssNOTEMONTAGGIO: TStringField;
    QryTecnici: TIBOQuery;
    SourceTecnici: TDataSource;
    QryTecniciRESOURCEID: TIntegerField;
    QryTecniciRESOURCENAME: TStringField;
    QryImpNUMCIVICOCLI: TStringField;
    QryAssNUMCIVICOUT: TStringField;
    QryAssNUMCIVICOINST: TStringField;
    QryImpDATAORAFINEINTERVENTO: TDateTimeField;
    QryImpVEICOLO: TStringField;
    QryImpKMPERCORSI: TIBOFloatField;
    QryImpSPESECARBURANTE: TIBOFloatField;
    QryImpSPESEVITTO: TIBOFloatField;
    QryImpSPESEALLOGGIO: TIBOFloatField;
    QryImpSPESEAUTOSTRADA: TIBOFloatField;
    QryImpSPESEALTRE: TIBOFloatField;
    Button1: TButton;
    QryAssRISCALDAMENTO: TStringField;
    QryAssACQUASANITARIA: TStringField;
    QryAssMARCAEFFICIENZAENERG: TStringField;
    QryAssLOCALEINSTALLAZIONE: TStringField;
    QryAssFLUIDOTERMOVETTORE: TStringField;
    QryAssANNOCOSTRUZIONE: TIntegerField;
    QryAssRAGSOCRESPIMP: TStringField;
    QryAssINDIRIZZORESPIMP: TStringField;
    QryAssNUMCIVICORESPIMP: TStringField;
    QryAssCAPRESPIMP: TStringField;
    QryAssCITTARESPIMP: TStringField;
    QryAssPROVINCIARESPIMP: TStringField;
    QryAssTELEFONORESPIMP: TStringField;
    QryAssCELLULARERESPIMP: TStringField;
    QryAssCAPIMM: TStringField;
    QryAssINDIRIZZOCOMPLETORESPINP: TStringField;
    QryAssINQUALITADIRESPIMP: TStringField;
    QryDatiTecnico: TIBOQuery;
    DataSource1: TDataSource;
    QryDatiTecnicoNOME: TStringField;
    QryDatiTecnicoINDIRIZZOCOMPLETO: TMemoField;
    QryDatiTecnicoESTREMIDOCQUALIFICA: TStringField;
    N1: TMenuItem;
    StampaKITperiltecnico1: TMenuItem;
    QryIntPrec: TIBOQuery;
    SourceIntPrec: TDataSource;
    Rapportointerventiprecedenti1: TMenuItem;
    QryImpPARTITAIVACLI: TStringField;
    QryImpCODICEFISCALECLI: TStringField;
    QryImpREGISTRO: TStringField;
    QryImpAGENTE: TStringField;
    QryImpCODICEARTICOLO: TStringField;
    QryImpDESCRIZIONEARTICOLO: TStringField;
    QryAssCODICEFISCALEUT: TStringField;
    QryAssCODICEFISCALERESPIMP: TStringField;
    QryAssCODICECATASTO: TStringField;
    QryAssRAGSOCPROP: TStringField;
    QryAssINDIRIZZOPROP: TStringField;
    QryAssNUMCIVICOPROP: TStringField;
    QryAssCAPPROP: TStringField;
    QryAssCITTAPROP: TStringField;
    QryAssPROVINCIAPROP: TStringField;
    QryAssCODICEFISCALEPROP: TStringField;
    QryAssTELEFONOPROP: TStringField;
    QryAssCELLULAREPROP: TStringField;
    QryAssINDIRIZZOCOMPLETOCLI: TStringField;
    QryImpTELEFONOCLI: TStringField;
    QryImpCELLULARECLI: TStringField;
    QryAssPOTENZANOMINALEFOCOLARE: TStringField;
    QryImpAGENTE2: TStringField;
    QryImpAGENTE3: TStringField;
    QryImpAGENTE4: TStringField;
    QryOP: TIBOQuery;
    SourceOP: TDataSource;
    QryOPID: TIntegerField;
    QryOPIDIMPEGNO: TIntegerField;
    QryOPIDPRATICA: TIntegerField;
    QryOPIDOPPRATICA: TIntegerField;
    QryOPIDAPPARECCHIOPRAT: TIntegerField;
    QryOPIDOP: TStringField;
    QryOPDESCRIZIONE: TStringField;
    QryOPDAEFFETTUARE: TStringField;
    QryOPEFFETTUATA: TStringField;
    QryOPMINUTIPREVISTI: TIntegerField;
    QryOPPERIODICITA: TIntegerField;
    QryOPULTIMA: TDateTimeField;
    QryOPPROSSIMA: TDateTimeField;
    QryImpIDPRATICA: TIntegerField;
    MenuOP: TPopupMenu;
    AggiornaOP1: TMenuItem;
    FormMainPanel: TPanel;
    PanelTabs: TPanel;
    TabControlPagineDocumento: TcxTabControl;
    PageControlPagineDocumento: TcxPageControl;
    TabAppuntamento: TcxTabSheet;
    AppuntamentoClientArea: TScrollBox;
    PanelChiamata: TPanel;
    LabelPanelChiamata: TLabel;
    Label21: TLabel;
    LabelMotivoChiamata: TLabel;
    DBText1: TDBText;
    LabelTipoIntervento: TLabel;
    DBEMotivoChiamata: TDBMemo;
    DBEDataChiamata: TcxDBDateEdit;
    DBETipoIntervento: TcxDBCheckListBox;
    DBEOraChiamata: TcxDBTimeEdit;
    PanelAppuntamento: TPanel;
    Shape7: TShape;
    LabelPanelAppuntamento: TLabel;
    Label3: TLabel;
    LabelLuogoAppuntamento: TLabel;
    Label13: TLabel;
    LabelTecnico: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    LabelAgente: TLabel;
    LabelArticolo: TLabel;
    DBELuogo: TDBMemo;
    DBEDataAppuntamento: TcxDBDateEdit;
    DBEDataFineAppuntamento: TcxDBDateEdit;
    DBETecnico: TcxDBLookupComboBox;
    DBEOraAppuntamento: TcxDBTimeEdit;
    DBEOraFineAppuntamento: TcxDBTimeEdit;
    DbeArticolo: TcxDBButtonEdit;
    DbeDescrizioneArticolo: TcxDBTextEdit;
    DbeAgente: TcxDBComboBox;
    PanelAgenti: TPanel;
    LabelAgente2: TLabel;
    LabelAgente3: TLabel;
    LabelAgente4: TLabel;
    dbeAgente2: TcxDBComboBox;
    dbeAgente3: TcxDBComboBox;
    dbeAgente4: TcxDBComboBox;
    PanelIntervento: TPanel;
    Shape12: TShape;
    LabelPanelIntervento: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    LabelSpese: TLabel;
    Label28: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label34: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    LabelStatoDocumento: TLabel;
    DBERelazioneIntervento: TDBMemo;
    DBEKm: TDBEdit;
    PanelVeicolo: TPanel;
    DBEVeicolo: TDBComboBox;
    DBECarburante: TDBEdit;
    DBEAutostrada: TDBEdit;
    DBEAlloggio: TDBEdit;
    DBEVitto: TDBEdit;
    DBEAltreSpese: TDBEdit;
    DBEDataIntervento: TcxDBDateEdit;
    DBEOraIntervento: TcxDBTimeEdit;
    DBEOraFineIntervento: TcxDBTimeEdit;
    DBEditStatoDocumento: TDBEdit;
    PanelRifDoc: TPanel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    dbeRifDoc_TipoDoc: TcxDBComboBox;
    dbeRifDoc_NumDoc: TcxDBTextEdit;
    dbeRifDoc_RegDoc: TcxDBComboBox;
    dbeRifDoc_DataDoc: TcxDBDateEdit;
    PanelNumDataDocumento: TPanel;
    ShapeAzioni: TShape;
    ShapeDocumento: TShape;
    LabelData: TLabel;
    LabelDocumento: TLabel;
    LabelAzioni: TLabel;
    LabelAzioneMagazzino: TLabel;
    LabelAzioneCantiere: TLabel;
    LabelNumReg: TLabel;
    LabelCantiere: TLabel;
    BitBtnPratica1: TSpeedButtonRollOver;
    TipoDocumento: TcxDBComboBox;
    DBEditNumDoc: TcxDBTextEdit;
    DBComboRegistro: TcxDBComboBox;
    DBEDataDoc: TcxDBDateEdit;
    DbeAzioneMagazzino: TcxComboBox;
    DbeAzioneCantiere: TcxComboBox;
    DBEditSegnoOperazione: TDBEdit;
    DBEditSegnoOperazioneCantiere: TDBEdit;
    DbeDescrizioneCantiere: TcxTextEdit;
    PanelLuogoDestinazione: TPanel;
    LabelPanelDestinazioneMerce: TLabel;
    BitBtnDestinazioneMerci: TSpeedButtonRollOver;
    DBEIndirizzoDest: TDBEdit;
    DBECapDest: TDBEdit;
    DBECittaDest: TDBEdit;
    DBEProvinciaDest: TDBEdit;
    DBERagSocDest: TDBEdit;
    DBENumCivicoDest: TDBEdit;
    PanelDestinatario: TPanel;
    Label33: TLabel;
    LabelPanelDestinatario: TLabel;
    SBSoggetto: TSpeedButtonRollOver;
    SBEspandiSoggetto: TSpeedButtonRollOver;
    DBText3: TDBText;
    Label54: TLabel;
    Label75: TLabel;
    Label1: TLabel;
    DBERagSocCli: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit44: TDBEdit;
    PanelCantiere: TPanel;
    Shape19: TShape;
    BitBtnPratica1_2: TSpeedButtonRollOver;
    DbeDescrizioneCantiere2: TcxTextEdit;
    PanelInterventiPrecedenti: TPanel;
    LabelPanelInterventiPrecedenti: TLabel;
    GridInterventiPrecedenti: TcxGrid;
    tvIntPrec: TcxGridDBTableView;
    tvIntPrecID: TcxGridDBColumn;
    tvIntPrecDATAORAINTERVENTO: TcxGridDBColumn;
    tvIntPrecRESOURCENAME: TcxGridDBColumn;
    tvIntPrecTIPOINTERVENTO: TcxGridDBColumn;
    tvIntPrecRELAZIONEINTERVENTO: TcxGridDBColumn;
    lvIntPrec: TcxGridLevel;
    PanelPratiche: TPanel;
    Label29: TLabel;
    LabelPanelPraticheCaption: TLabel;
    Label32: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Bevel11: TBevel;
    DBECodicePratica1: TDBEdit;
    DBEdit11: TDBEdit;
    EditDescrizionePratica1: TEdit;
    PanelImpegnoGenerico: TPanel;
    Label15: TLabel;
    Bevel5: TBevel;
    Label17: TLabel;
    Label20: TLabel;
    Shape13: TShape;
    Label7: TLabel;
    Label14: TLabel;
    LabelTecnico2: TLabel;
    Label18: TLabel;
    Label35: TLabel;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    DBELuogoImpegno: TDBMemo;
    DBEMotivoImpegno: TDBMemo;
    DBEDataInizioGenerico: TcxDBDateEdit;
    DbeTecnico2: TcxDBLookupComboBox;
    DBEOraInizioGenerico: TcxDBTimeEdit;
    DBEOraFineGenerico: TcxDBTimeEdit;
    PanelInformazioniUtili: TPanel;
    LabelInformazioniUtili: TLabel;
    PanelCreaIntervento: TPanel;
    SBCreaIntervento: TSpeedButtonRollOver;
    TabOP: TcxTabSheet;
    TabAllegati: TcxTabSheet;
    PanelAllegatiFG: TPanel;
    Label4: TLabel;
    GridAll: TcxGrid;
    btvAll: TcxGridDBBandedTableView;
    lvAll: TcxGridLevel;
    QryAllegati: TIBOQuery;
    SourceAllegati: TDataSource;
    QryAllegatiID: TIntegerField;
    QryAllegatiTIPO: TStringField;
    QryAllegatiDATACONTROLLO: TDateTimeField;
    QryAllegatiGENCAL_ID: TIntegerField;
    QryAllegatiGENCAL_COSTRUTTORE: TStringField;
    QryAllegatiGENCAL_MODELLO: TStringField;
    QryAllegatiGENCAL_MATRICOLA: TStringField;
    QryAllegatiBRUC_ID: TIntegerField;
    QryAllegatiBRUC_COSTRUTTORE: TStringField;
    QryAllegatiBRUC_MODELLO: TStringField;
    QryAllegatiBRUC_MATRICOLA: TStringField;
    btvAllID: TcxGridDBBandedColumn;
    btvAllTIPO: TcxGridDBBandedColumn;
    btvAllSTATOAVANZAMENTO: TcxGridDBBandedColumn;
    btvAllDATACONTROLLO: TcxGridDBBandedColumn;
    btvAllGENCAL_ID: TcxGridDBBandedColumn;
    btvAllGENCAL_COSTRUTTORE: TcxGridDBBandedColumn;
    btvAllGENCAL_MODELLO: TcxGridDBBandedColumn;
    btvAllGENCAL_MATRICOLA: TcxGridDBBandedColumn;
    btvAllBRUC_ID: TcxGridDBBandedColumn;
    btvAllBRUC_COSTRUTTORE: TcxGridDBBandedColumn;
    btvAllBRUC_MODELLO: TcxGridDBBandedColumn;
    btvAllBRUC_MATRICOLA: TcxGridDBBandedColumn;
    QryAllegatiIDIMPEGNO: TIntegerField;
    QryImpMASTER_ID: TIntegerField;
    MenuNuovoAllegato: TPopupMenu;
    CreazioneallegatiFG1: TMenuItem;
    QryAllegatiSTATOAVANZAMENTO: TSmallintField;
    AllegatiFG1: TMenuItem;
    N2: TMenuItem;
    QryAssDESCRIZIONE: TStringField;
    TabInterventiPrecedenti: TcxTabSheet;
    PanelOP: TPanel;
    LabelOP: TLabel;
    GridOP: TcxGrid;
    btvOP: TcxGridDBBandedTableView;
    btvOPID: TcxGridDBBandedColumn;
    btvOPIDIMPEGNO: TcxGridDBBandedColumn;
    btvOPIDPRATICA: TcxGridDBBandedColumn;
    btvOPIDOPPRATICA: TcxGridDBBandedColumn;
    btvOPIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    btvOPIDOP: TcxGridDBBandedColumn;
    btvOPDESCRIZIONE: TcxGridDBBandedColumn;
    btvOPDAEFFETTUARE: TcxGridDBBandedColumn;
    btvOPEFFETTUATA: TcxGridDBBandedColumn;
    btvOPMINUTIPREVISTI: TcxGridDBBandedColumn;
    btvOPPERIODICITA: TcxGridDBBandedColumn;
    btvOPULTIMA: TcxGridDBBandedColumn;
    btvOPPROSSIMA: TcxGridDBBandedColumn;
    lvOP: TcxGridLevel;
    PanelPrecInt: TPanel;
    Label6: TLabel;
    GridPrecInt: TcxGrid;
    btvPrecInt: TcxGridDBBandedTableView;
    lvPrecInt: TcxGridLevel;
    QryIntPrecTIPORECORD: TStringField;
    QryIntPrecDATADOC: TDateTimeField;
    QryIntPrecCODICE: TStringField;
    QryIntPrecUM: TStringField;
    QryIntPrecQTA: TIBOFloatField;
    QryIntPrecPRZUNIT: TIBOFloatField;
    QryIntPrecPRZUNITIVACOMP: TIBOFloatField;
    QryIntPrecS1: TIBOFloatField;
    QryIntPrecS2: TIBOFloatField;
    QryIntPrecS3: TIBOFloatField;
    QryIntPrecIMPORTO: TIBOFloatField;
    QryIntPrecIMPORTOIVACOMP: TIBOFloatField;
    QryIntPrecTECNICO_NOME: TStringField;
    QryIntPrecCALC_PRZUNITNETTO: TCurrencyField;
    QryIntPrecCALC_PRZUNITIVACOMPNETTO: TCurrencyField;
    btvPrecIntTIPORECORD: TcxGridDBBandedColumn;
    btvPrecIntDATADOC: TcxGridDBBandedColumn;
    btvPrecIntCODICE: TcxGridDBBandedColumn;
    btvPrecIntDESCRIZIONE: TcxGridDBBandedColumn;
    btvPrecIntUM: TcxGridDBBandedColumn;
    btvPrecIntQTA: TcxGridDBBandedColumn;
    btvPrecIntPRZUNIT: TcxGridDBBandedColumn;
    btvPrecIntPRZUNITIVACOMP: TcxGridDBBandedColumn;
    btvPrecIntS1: TcxGridDBBandedColumn;
    btvPrecIntS2: TcxGridDBBandedColumn;
    btvPrecIntS3: TcxGridDBBandedColumn;
    btvPrecIntIMPORTO: TcxGridDBBandedColumn;
    btvPrecIntIMPORTOIVACOMP: TcxGridDBBandedColumn;
    btvPrecIntTECNICO_NOME: TcxGridDBBandedColumn;
    btvPrecIntCALC_PRZUNITNETTO: TcxGridDBBandedColumn;
    btvPrecIntCALC_PRZUNITIVACOMPNETTO: TcxGridDBBandedColumn;
    QryIntPrecDESCRIZIONE: TStringField;
    QryIntPrecMASTER_ID: TIntegerField;
    QryIntPrecTIPODOC: TStringField;
    QryIntPrecNUMDOC: TIntegerField;
    QryIntPrecREGDOC: TStringField;
    btvPrecIntMASTER_ID: TcxGridDBBandedColumn;
    btvPrecIntTIPODOC: TcxGridDBBandedColumn;
    btvPrecIntNUMDOC: TcxGridDBBandedColumn;
    btvPrecIntREGDOC: TcxGridDBBandedColumn;
    PanelPrescrizioni: TPanel;
    Label12: TLabel;
    GridPresc: TcxGrid;
    btvPresc: TcxGridDBBandedTableView;
    lvPresc: TcxGridLevel;
    QryPresc: TIBOQuery;
    QryPrescTIPORECORD: TStringField;
    QryPrescIDIMPEGNO: TIntegerField;
    QryPrescIDALLEGATO: TIntegerField;
    QryPrescCODICE: TStringField;
    QryPrescTECNICO_NOME: TStringField;
    SourcePresc: TDataSource;
    btvPrescTIPORECORD: TcxGridDBBandedColumn;
    btvPrescIDIMPEGNO: TcxGridDBBandedColumn;
    btvPrescIDALLEGATO: TcxGridDBBandedColumn;
    btvPrescCODICE: TcxGridDBBandedColumn;
    btvPrescDESCRIZIONE: TcxGridDBBandedColumn;
    btvPrescTECNICO_NOME: TcxGridDBBandedColumn;
    QryPrescDATADOC: TDateTimeField;
    btvPrescDATADOC: TcxGridDBBandedColumn;
    QryPrescDESCRIZIONE: TStringField;
    btvPrescRISOLTO: TcxGridDBBandedColumn;
    TimerBlink: TTimer;
    QryPrescUNIQUEKEYFIELD: TStringField;
    btvPrescUNIQUEKEYFIELD: TcxGridDBBandedColumn;
    QryPratApp: TIBOQuery;
    QryPratAppCOMPUTED_APPARECCHIO_FULL: TStringField;
    SourcePratApp: TDataSource;
    QryPratAppCOSTRUTTORE: TStringField;
    QryPratAppMODELLO: TStringField;
    QryPratAppMATRICOLA: TStringField;
    QryPratAppUBICAZIONE: TStringField;
    QryPratAppTIPOAPPARECCHIO: TStringField;
    QryPratAppANNOCOSTRUZIONE: TIntegerField;
    QryPratAppDATAINSTALLAZIONE: TDateTimeField;
    QryPratAppDATACOLLAUDO: TDateTimeField;
    QryPratAppID: TIntegerField;
    btvOPTIPOAPPARECCHIO: TcxGridDBBandedColumn;
    btvOPCOSTRUTTORE: TcxGridDBBandedColumn;
    btvOPMODELLO: TcxGridDBBandedColumn;
    btvOPMATRICOLA: TcxGridDBBandedColumn;
    btvOPUBICAZIONE: TcxGridDBBandedColumn;
    QryIntPrecIDAPPARECCHIOPRAT: TIntegerField;
    btvPrecIntIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    QryPrescIDAPPARECCHIOPRAT: TIntegerField;
    btvPrescIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    QryOPPRZUNIT: TIBOFloatField;
    QryOPADDEBITA: TStringField;
    btvOPPRZUNIT: TcxGridDBBandedColumn;
    btvOPADDEBITA: TcxGridDBBandedColumn;
    TabMappa: TcxTabSheet;
    PanelApparecchi: TPanel;
    LabelPanelApparecchi: TLabel;
    GridApp: TcxGrid;
    tvApp: TcxGridDBTableView;
    lvApp: TcxGridLevel;
    tvAppID: TcxGridDBColumn;
    tvAppCOSTRUTTORE: TcxGridDBColumn;
    tvAppMODELLO: TcxGridDBColumn;
    tvAppMATRICOLA: TcxGridDBColumn;
    tvAppUBICAZIONE: TcxGridDBColumn;
    tvAppTIPOAPPARECCHIO: TcxGridDBColumn;
    tvAppANNOCOSTRUZIONE: TcxGridDBColumn;
    tvAppDATAINSTALLAZIONE: TcxGridDBColumn;
    tvAppDATACOLLAUDO: TcxGridDBColumn;
    tvAppCOMPUTED_APPARECCHIO_FULL: TcxGridDBColumn;
    QryPratAppDISMESSO: TStringField;
    QryPratAppCOMPUTED_ABBINATO: TBooleanField;
    QryPratAppCOMPUTED_ORDER1: TIntegerField;
    QryPratAppCOMPUTED_ORDER2: TIntegerField;
    QryPratAppIDAPPABBINATO: TIntegerField;
    tvAppDISMESSO: TcxGridDBColumn;
    tvAppCOMPUTED_ABBINATO: TcxGridDBColumn;
    tvAppCOMPUTED_ORDER1: TcxGridDBColumn;
    tvAppCOMPUTED_ORDER2: TcxGridDBColumn;
    ImageList_PratApp: TImageList;
    QryPratAppMASTER_ID: TIntegerField;
    QryPratAppSELECTED: TStringField;
    tvAppMASTER_ID: TcxGridDBColumn;
    tvAppIDAPPABBINATO: TcxGridDBColumn;
    tvAppSELECTED: TcxGridDBColumn;
    QryPratAppGARANZIA_SCADENZA: TDateTimeField;
    tvAppGARANZIA_SCADENZA: TcxGridDBColumn;
    tvAppSELECTED2: TcxGridDBColumn;
    QryPratAppPOTENZATERMICA: TIBOFloatField;
    QryPratAppTIPOCAMERA: TStringField;
    QryPratAppCOMBUSTIBILE: TStringField;
    QryPratAppCOMBUSTIBILEALTRO: TStringField;
    tvAppPOTENZATERMICA: TcxGridDBColumn;
    tvAppTIPOCAMERA: TcxGridDBColumn;
    tvAppCOMBUSTIBILE: TcxGridDBColumn;
    tvAppCOMBUSTIBILEALTRO: TcxGridDBColumn;
    QryPratAppCOMPUTED_INGARANZIA: TStringField;
    tvAppCOMPUTED_INGARANZIA: TcxGridDBColumn;
    QryPratAppGARANZIA_NOTE: TStringField;
    QryPratAppGARANZIA_MESI: TSmallintField;
    QryPratAppGARANZIA_MESI_ESTENSIONE: TSmallintField;
    tvAppGARANZIA_NOTE: TcxGridDBColumn;
    tvAppGARANZIA_MESI: TcxGridDBColumn;
    tvAppGARANZIA_MESI_ESTENSIONE: TcxGridDBColumn;
    QryPratAppDISMESSO_DATA: TDateTimeField;
    QryPratAppDISMESSO_NOTE: TStringField;
    tvAppDISMESSO_DATA: TcxGridDBColumn;
    tvAppDISMESSO_NOTE: TcxGridDBColumn;
    QryPratAppVOLTAGGIOELETTRICO: TIntegerField;
    QryPratAppPOTENZAELETTRICA: TIBOFloatField;
    QryPratAppPORTATA: TIBOFloatField;
    QryPratAppPREVALENZA: TIBOFloatField;
    tvAppVOLTAGGIOELETTRICO: TcxGridDBColumn;
    tvAppPOTENZAELETTRICA: TcxGridDBColumn;
    tvAppPORTATA: TcxGridDBColumn;
    tvAppPREVALENZA: TcxGridDBColumn;
    QryPratAppREFRIGERANTE: TStringField;
    QryPratAppCARICA: TIBOFloatField;
    QryPratAppPOTENZAFRIGORIFERA: TIBOFloatField;
    tvAppREFRIGERANTE: TcxGridDBColumn;
    tvAppCARICA: TcxGridDBColumn;
    tvAppPOTENZAFRIGORIFERA: TcxGridDBColumn;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    PanelUbicazioneImpianto: TPanel;
    Label267: TLabel;
    PanelNoteImpianto: TPanel;
    Label16: TLabel;
    dbeNoteImpianto: TDBMemo;
    PanelRespImp: TPanel;
    Label251: TLabel;
    DBText9: TDBText;
    SBEspandiRespImp: TSpeedButtonRollOver;
    SBRespImp: TSpeedButtonRollOver;
    DbeInQualitaDi: TcxDBRadioGroup;
    PanelAbbonamentoImpianto: TPanel;
    Label322: TLabel;
    Label323: TLabel;
    Label324: TLabel;
    Label325: TLabel;
    Label326: TLabel;
    Label327: TLabel;
    Label328: TLabel;
    Label329: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    Contratto_Stato: TcxDBRadioGroup;
    Contratto_SospesoMesi: TcxDBComboBox;
    Contratto_SospesoDal: TcxDBDateEdit;
    Contratto_DismessoDal: TcxDBDateEdit;
    Contratto_Numero: TcxDBTextEdit;
    Contratto_DataStipula: TcxDBDateEdit;
    Contratto_Mesi: TcxDBComboBox;
    Contratto_MesiRinnovo: TcxDBComboBox;
    Contratto_ValiditaInizio: TcxDBDateEdit;
    Contratto_ValiditaScadenza: TcxDBDateEdit;
    Contratto_DisdettaMezzo: TcxDBComboBox;
    Contratto_Importo: TcxDBCurrencyEdit;
    Contratto_DisdettaRicevuta: TcxDBCheckBox;
    Contratto_DisdettaData: TcxDBDateEdit;
    Contratto_Tipo: TcxDBComboBox;
    PanelProprietarioImpianto: TPanel;
    LabelPanelProprietario: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label234: TLabel;
    Label235: TLabel;
    Label236: TLabel;
    Label237: TLabel;
    Label239: TLabel;
    SBProprietario: TSpeedButtonRollOver;
    SBEspandiProprietario: TSpeedButtonRollOver;
    DBText2: TDBText;
    Label240: TLabel;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    PanelOccupanteImpianto: TPanel;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label238: TLabel;
    Label255: TLabel;
    Label256: TLabel;
    Label257: TLabel;
    Label258: TLabel;
    Label259: TLabel;
    Label260: TLabel;
    DBText4: TDBText;
    SBEspandiOccupante: TSpeedButtonRollOver;
    SBOccupante: TSpeedButtonRollOver;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    PanelAmministratoreImpianto: TPanel;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    DBText5: TDBText;
    SBEspandiInstallatore: TSpeedButtonRollOver;
    SBInstallatore: TSpeedButtonRollOver;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    QryAssCODICEPROP: TIntegerField;
    QryAssCODICEUT: TIntegerField;
    QryAssCODICEINST: TIntegerField;
    QryAssCODICERESPIMP: TIntegerField;
    QryAssZONAIMM: TStringField;
    QryAssSCALAIMM: TStringField;
    QryAssCODICEFISCALEINST: TStringField;
    QryAssCONTRATTO_STATO: TStringField;
    QryAssCONTRATTO_SOSP_MESI: TSmallintField;
    QryAssCONTRATTO_SOSP_DATA: TDateTimeField;
    QryAssCONTRATTO_DISMESSO_DATA: TDateTimeField;
    QryAssCONTRATTO_DATASTIPULA: TDateTimeField;
    QryAssCONTRATTO_IMPORTO: TIBOFloatField;
    QryAssCONTRATTO_TIPO: TStringField;
    QryAssCONTRATTO_MESI: TSmallintField;
    QryAssCONTRATTO_MESI_RINNOVO: TSmallintField;
    QryAssCONTRATTO_VALIDITA_INIZIO: TDateTimeField;
    QryAssCONTRATTO_VALIDITA_FINE: TDateTimeField;
    QryAssCONTRATTO_DISDETTA_RICEVUTA: TStringField;
    QryAssCONTRATTO_DISDETTA_DATARICEZ: TDateTimeField;
    QryAssCONTRATTO_DISDETTA_MEZZO: TStringField;
    QryAssTIPO: TStringField;
    PanelSoggetto: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBText6: TDBText;
    SpeedButtonRollOver1: TSpeedButtonRollOver;
    SBSoggImpianto: TSpeedButtonRollOver;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    PanelNoteSoggetto: TPanel;
    Label46: TLabel;
    dbeNoteSoggetto: TDBMemo;
    QrySogg: TIBOQuery;
    SourceSogg: TDataSource;
    QrySoggCODICE: TIntegerField;
    QrySoggRAGIONESOCIALE: TStringField;
    QrySoggINDIRIZZO: TStringField;
    QrySoggNUMCIVICO: TStringField;
    QrySoggCITTA: TStringField;
    QrySoggCAP: TStringField;
    QrySoggPROVINCIA: TStringField;
    QrySoggTELEFONO: TStringField;
    QrySoggCELLULARE: TStringField;
    QrySoggPARTITAIVA: TStringField;
    QrySoggCODICEFISCALE: TStringField;
    QrySoggNOTE: TMemoField;
    QryPratAppCOMPUTED_GARANZIA: TStringField;
    QryPratAppCOMPUTED_GARANZIA_NOTE: TStringField;
    RE: TcxRichEdit;
    QryAssCOMPUTED_CONTRATTO_SCADUTO: TStringField;
    QryParamFoglioLavoro: TIBOQuery;
    QryParamFoglioLavoroFL_LOGO_INTESTAZIONE: TStringField;
    QryParamFoglioLavoroFL_TITOLO: TStringField;
    QryParamFoglioLavoroFL_DATI_PRESCRIZIONI: TStringField;
    QryParamFoglioLavoroFL_DATI_CHIAMATA: TStringField;
    QryParamFoglioLavoroFL_DATI_APPUNTAMENTO: TStringField;
    QryParamFoglioLavoroFL_DATI_SOGGETTO: TStringField;
    QryParamFoglioLavoroFL_DATI_SOGGETTO_NOTE: TStringField;
    QryParamFoglioLavoroFL_DATI_IMPIANTO: TStringField;
    QryParamFoglioLavoroFL_DATI_ABBONAMENTO: TStringField;
    QryParamFoglioLavoroFL_DATI_IMMOBILE: TStringField;
    QryParamFoglioLavoroFL_DATI_RESPIMP: TStringField;
    QryParamFoglioLavoroFL_DATI_PROP_UT_AMM: TStringField;
    QryParamFoglioLavoroFL_DATI_PROPRIETARIO: TStringField;
    QryParamFoglioLavoroFL_DATI_UTENTE: TStringField;
    QryParamFoglioLavoroFL_DATI_INSTALLATORE: TStringField;
    QryParamFoglioLavoroFL_DATI_IMPIANTO_NOTE: TStringField;
    QryParamFoglioLavoroFL_DATI_APPARECCHI: TStringField;
    QryParamFoglioLavoroFL_DATI_APPARECCHI_SEPARATI: TStringField;
    QryParamFoglioLavoroFL_DATI_OP: TStringField;
    QryParamFoglioLavoroFL_DATI_PRECEDENTI: TStringField;
    QryParamFoglioLavoroFL_DATI_NUMULTINTERV: TIntegerField;
    QryParamFoglioLavoroFL_DATI_RAPPINT: TStringField;
    QryParamFoglioLavoroFL_DATI_MERCE: TStringField;
    QryParamFoglioLavoroFL_DATI_ALTRESPESE: TStringField;
    QryParamFoglioLavoroFL_DATI_FIRME: TStringField;
    QryParamFoglioLavoroFL_LOGO_PIEDE: TStringField;
    QryParamFoglioLavoroFL_COPIE: TIntegerField;
    QryParamFoglioLavoroFL_DATI_OP_SOLODAFARE: TStringField;
    QryPratAppPOTENZATERMICA2: TIBOFloatField;
    tvAppPOTENZATERMICA2: TcxGridDBColumn;
    QryPrescFATTO: TStringField;
    QryPrescFATTO_DATA: TDateTimeField;
    QryPrescFATTO_NOTE: TStringField;
    btvPrescFATTO_DATA: TcxGridDBBandedColumn;
    btvPrescFATTO_NOTE: TcxGridDBBandedColumn;
    PanelCheckNotePrivateSoggetto: TPanel;
    cbVediNotePrivateSoggetto: TcxCheckBox;
    dbeNotePrivateSoggetto: TDBMemo;
    dbeNotePrivateImpianto: TDBMemo;
    PanelCheckNotePrivateImpianto: TPanel;
    cbVediNotePrivateImpianto: TcxCheckBox;
    QryAssNOTEPRIVATE: TMemoField;
    QrySoggNOTEPRIVATE: TMemoField;
    QryImpURGENTE: TStringField;
    dbeUrgente: TcxDBCheckBox;
    Image1: TImage;
    QryAssCOMPUTED_STR_CERTIFIED_IMM: TStringField;
    QryAssCODICEISTATCOMUNEIMM: TStringField;
    Label268: TLabel;
    Label269: TLabel;
    Label271: TLabel;
    Label272: TLabel;
    Label275: TLabel;
    Label276: TLabel;
    Label332: TLabel;
    Label333: TLabel;
    Label334: TLabel;
    Shape29: TShape;
    dbeComuneImm: TcxDBButtonEdit;
    dbeZonaImm: TcxDBComboBox;
    dbeCapImm: TcxDBButtonEdit;
    dbeProvinciaImm: TcxDBButtonEdit;
    dbeIndirizzoImm: TcxDBButtonEdit;
    dbeNumCivicoImm: TcxDBTextEdit;
    dbeScalaImm: TcxDBTextEdit;
    dbePianoImm: TcxDBTextEdit;
    dbeInternoImm: TcxDBTextEdit;
    dbeStrCertImageCombo: TcxDBImageComboBox;
    Label335: TLabel;
    dbePalazzinaImm: TcxDBTextEdit;
    QryAssPALAZZOIMM: TStringField;
    QryAssCONTRATTO_NUMERO: TStringField;
    Shape1: TShape;
    dbeRifDoc_CorrispNoPag: TcxDBImageComboBox;
    Label139: TLabel;
    QryAssRESOURCEID: TIntegerField;
    QryOPINABBONAMENTO: TStringField;
    btvOPINABBONAMENTO: TcxGridDBBandedColumn;
    Shape2: TShape;
    sbContrattoRinnova: TSpeedButton;
    QryOPSCONTO1: TIBOFloatField;
    QryOPSCONTO2: TIBOFloatField;
    QryOPSCONTO3: TIBOFloatField;
    QryOPPRZUNITNETTO: TIBOFloatField;
    QryOPCODICEIVA: TIntegerField;
    QryOPPRZUNITIVACOMP: TIBOFloatField;
    QryOPPRZUNITNETTOIVACOMP: TIBOFloatField;
    QryOPALIQUOTAIVA: TFloatField;
    btvOPSCONTO1: TcxGridDBBandedColumn;
    btvOPSCONTO2: TcxGridDBBandedColumn;
    btvOPSCONTO3: TcxGridDBBandedColumn;
    btvOPPRZUNITNETTO: TcxGridDBBandedColumn;
    btvOPCODICEIVA: TcxGridDBBandedColumn;
    btvOPPRZUNITIVACOMP: TcxGridDBBandedColumn;
    btvOPPRZUNITNETTOIVACOMP: TcxGridDBBandedColumn;
    btvOPALIQUOTAIVA: TcxGridDBBandedColumn;
    QryAssCONTRATTO_SCONTO1: TIBOFloatField;
    QryAssCONTRATTO_SCONTO2: TIBOFloatField;
    QryAssCONTRATTO_SCONTO3: TIBOFloatField;
    QryAssCONTRATTO_IMPORTONETTO: TIBOFloatField;
    QryAssCONTRATTO_CODICEIVA: TIntegerField;
    QryAssCONTRATTO_IMPORTOIVACOMP: TIBOFloatField;
    QryAssCONTRATTO_IMPORTONETTOIVACOMP: TIBOFloatField;
    QryAssCONTRATTO_ALIQUOTAIVA: TFloatField;
    QryAssCONTRATTO_DESCRIZIONEIVA: TStringField;
    QryPratAppCOMPUTED_APPARECCHIO_NOUBICAZ: TStringField;
    Label339: TLabel;
    Label340: TLabel;
    Contratto_Sconto1: TcxDBCurrencyEdit;
    Contratto_Sconto2: TcxDBCurrencyEdit;
    Contratto_Sconto3: TcxDBCurrencyEdit;
    Contratto_ImportoNetto: TcxDBCurrencyEdit;
    Label342: TLabel;
    Label344: TLabel;
    Contratto_ImportoNettoIvaComp: TcxDBCurrencyEdit;
    Contratto_CodiceIVA: TcxDBLookupComboBox;
    QryIntPrecINABBONAMENTO: TStringField;
    btvPrecIntINABBONAMENTO: TcxGridDBBandedColumn;
    QryIntPrecRIFDOC_TIPO: TStringField;
    QryIntPrecRIFDOC_NUM: TIntegerField;
    QryIntPrecRIFDOC_REG: TStringField;
    QryIntPrecRIFDOC_DATA: TDateTimeField;
    QryIntPrecRIFDOC_CORRISPNOPAG: TStringField;
    QryIntPrecRIFDOC_TOTALEDOCUMENTO: TIBOFloatField;
    Image2: TImage;
    cxDBCheckBox1: TcxDBCheckBox;
    QryImpSTAMPATO: TStringField;
    btvPrecIntRIFDOC_TIPO: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_NUM: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_REG: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_DATA: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_CORRISPNOPAG: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_TOTALEDOCUMENTO: TcxGridDBBandedColumn;
    sbCreaIntervento1: TSpeedButtonRollOver;
    sbCreaIntervento2: TSpeedButtonRollOver;
    LabelDurataIntervento: TLabel;
    LabelDurataAppuntamento: TLabel;
    SBEspandiPratica1: TSpeedButtonRollOver;
    SBEspandiPratica2: TSpeedButtonRollOver;
    QryOPLookup_DESCAPPARECCHIOPRAT: TStringField;
    QryAssIMMOBCODICE: TIntegerField;
    QryAssIMMOBINDIRIZZO: TStringField;
    QryAssIMMOBNUMCIVICO: TStringField;
    QryAssIMMOBLOCALITA: TStringField;
    QryAssIMMOBPROVINCIA: TStringField;
    QryAssIMMOBCAP: TStringField;
    sbOpenTask2: TSpeedButtonRollOver;
    sbOpenTask1: TSpeedButtonRollOver;
    QryTecniciGCAL_CALENDAR_ID: TStringField;
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
    ReportDesignerDialog1: TReportDesignerDialog;
    Label253: TLabel;
    eIndirizzoRespImp: TDBEdit;
    Label254: TLabel;
    eNumCivicoRespImp: TDBEdit;
    Label262: TLabel;
    eCittaRespImp: TDBEdit;
    Label261: TLabel;
    eCAPRespImp: TDBEdit;
    Label263: TLabel;
    eProvinciaRespImp: TDBEdit;
    Label264: TLabel;
    eTelefonoRespImp: TDBEdit;
    Label266: TLabel;
    eCellulareRespImp: TDBEdit;
    QryAssNATURAGIURIDICARESPIMP: TStringField;
    QryAssNOMERESPIMP: TStringField;
    QryAssCOGNOMERESPIMP: TStringField;
    QryAssPARTITAIVARESPIMP: TStringField;
    dbeLabelColor: TcxDBColorComboBox;
    dbeState: TcxDBImageComboBox;
    Label47: TLabel;
    Label48: TLabel;
    LabelRagioneSociale: TLabel;
    LabelNome: TLabel;
    LabelCognome: TLabel;
    LabelTipoPersona: TLabel;
    Shape18: TShape;
    Shape20: TShape;
    dbeNaturaGiuridica: TcxDBRadioGroup;
    eRagSocRespImp: TDBEdit;
    eNomeRespImp: TDBEdit;
    eCognomeRespImp: TDBEdit;
    Label49: TLabel;
    eCodiceFiscaleRespImp: TDBEdit;
    Label50: TLabel;
    ePIVARespImp: TDBEdit;
    QryParamFoglioLavoroFL_LABEL_APPUNTAMENTO: TStringField;
    QryParamFoglioLavoroFL_LABEL_CHIAMATA: TStringField;
    QryParamFoglioLavoroFL_LABEL_CLIENTE: TStringField;
    QryParamFoglioLavoroFL_LABEL_LUOGO: TStringField;
    QryParamFoglioLavoroFL_LABEL_MOTIVO: TStringField;
    QryParamFoglioLavoroFL_LABEL_NOTE: TStringField;
    QryParamFoglioLavoroFL_DATI_INTESTAZFATTURA: TStringField;
    QryParamFoglioLavoroFL_MESSAGGIO: TMemoField;
    QryParamFoglioLavoroFL_MESSAGGIO_ALTEZZA: TIntegerField;
    QryParamFoglioLavoroFL_DATI_RAPPINT_NUMRIGHEDATAORA: TIntegerField;
    QryParamFoglioLavoroFL_DATI_RAPPINT_ALTEZZARELAZINT: TIntegerField;
    QryParamFoglioLavoroFL_DATI_RAPPINT_STATO: TStringField;
    SourceParamFoglioLavoro: TDataSource;
    QryImpDATAORAINTERVENTO2: TDateTimeField;
    QryImpDATAORAINTERVENTO3: TDateTimeField;
    QryImpDATAORAINTERVENTO4: TDateTimeField;
    QryImpDATAORAINTERVENTO5: TDateTimeField;
    QryImpDATAORAFINEINTERVENTO2: TDateTimeField;
    QryImpDATAORAFINEINTERVENTO3: TDateTimeField;
    QryImpDATAORAFINEINTERVENTO4: TDateTimeField;
    QryImpDATAORAFINEINTERVENTO5: TDateTimeField;
    CheckBoxFatto: TcxDBCheckBox;
    QryImpFATTO: TStringField;
    QryIntPrecAPPARECCHIO_FULL: TStringField;
    btvPrecIntAPPARECCHIO_FULL: TcxGridDBBandedColumn;
    QryImpRICHIEDENTE: TStringField;
    DBERichiedente: TcxDBComboBox;
    Label51: TLabel;
    PopupMenuAzzeraCantiereImpianto: TPopupMenu;
    Deselezionacantiereimpianto1: TMenuItem;
    cbSelezionaAppTutti: TcxCheckBox;
    LabelCantiere2: TLabel;
    Label53: TLabel;
    Shape21: TShape;
    dbeRDA: TcxDBTextEdit;
    QryImpRDA: TStringField;
    QryParamFoglioLavoroFL_DATI_RICHIEDENTE: TStringField;
    QryParamFoglioLavoroFL_LABEL_RICHIEDENTE: TStringField;
    PopupMenuAnnullaAppuntamento: TPopupMenu;
    AnnullaApuntamento1: TMenuItem;
    QryAssPRM_PROXVISITA_INBASEA: TStringField;
    QryAssPRM_PROXVISITA_ADDPERIODSU: TStringField;
    QryAssPRM_AUTODOC_OPFATTE: TStringField;
    QryAssPRM_AUTODOC_RIFCONTRATTO: TStringField;
    QryAssPRM_AUTODOC_DICITURA: TStringField;
    QryAssPRM_AUTODOC_DICITURATXT: TStringField;
    QryAssPRM_AUTOCLOSE_ENABLED: TStringField;
    QryAssPRM_AUTOCLOSE_SOLOMANUT: TStringField;
    QryAssPRM_AUTOCLOSE_FATTURA: TStringField;
    QryAssPRM_AUTOCLOSE_SCAD: TStringField;
    QryAssPROXVISITAENTRO: TDateTimeField;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure SBEspandiSoggettoClick(Sender: TObject);
    procedure SBSoggettoClick(Sender: TObject);
    procedure QryImpCLIENTEChange(Sender: TField);
    procedure DBETipoInterventoExit(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure QryImpDATAORAINTERVENTOChange(Sender: TField);
    procedure QryImpSTARTChange(Sender: TField);
    procedure QryImpFINISHChange(Sender: TField);
    procedure DBEVeicoloDropDown(Sender: TObject);
    procedure DBEKmKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure QryImpPRATICAChange(Sender: TField);
    procedure Button1Click(Sender: TObject);

    procedure StampaKITperiltecnico1Click(Sender: TObject);
    procedure MarcaOpDaFareComeFatte;
    procedure OP_RifContratto_Check;
    procedure OP_RifContratto_Dicitura_Check;
    procedure OP_Check;
    function TryChiusuraAutomaticaImpegno(const AStampaFoglioLavoro, AStampaRCEE, AAggiornaImpianto, AFattura, AAnteprimeDiStampa: Boolean;
      const ADataFatturazione: TDate): Boolean;

    procedure Rapportointerventiprecedenti1Click(Sender: TObject);
    procedure DBComboRegistroPropertiesInitPopup(Sender: TObject);
    procedure QryImpRAGSOCCLIChange(Sender: TField);
    procedure EditDescrizionePratica1Change(Sender: TObject);
    procedure QryImpTIPOIMPEGNOChange(Sender: TField);
    procedure QryImpDATAORAFINEINTERVENTOChange(Sender: TField);
    procedure SBCreaInterventoClick(Sender: TObject);
    procedure QryImpIDChange(Sender: TField);
    procedure QryImpREGISTROChange(Sender: TField);
    procedure BitBtnDestinazioneMerciClick(Sender: TObject);
    procedure ProcessBarcode(Barcode: String);
    procedure MenuStampePopup(Sender: TObject);
    procedure DBEditStatoDocumentoChange(Sender: TObject);
    procedure StampaFoglioDiLavoro(Preview, KitTecnico: Boolean; Copie:Integer=0);
    procedure QryImpBeforePost(DataSet: TDataSet);
    procedure DbeArticoloPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure QryImpAGENTEChange(Sender: TField);
    procedure QryImpAGENTE2Change(Sender: TField);
    procedure QryImpAGENTE3Change(Sender: TField);
    procedure QryImpAGENTE4Change(Sender: TField);
    procedure QryImpIDPRATICAChange(Sender: TField);
    procedure AggiornaOP1Click(Sender: TObject);
    procedure btvOPULTIMAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure dbeRifDoc_RegDocPropertiesInitPopup(Sender: TObject);
    procedure QryOPBeforePost(DataSet: TDataSet);
    procedure TabControlPagineDocumentoChange(Sender: TObject);
    procedure PageControlPagineDocumentoChange(Sender: TObject);
    procedure btvAllGENCAL_COSTRUTTOREGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvAllSTATOAVANZAMENTOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure btvAllDataControllerDataChanged(Sender: TObject);
    procedure CreazioneallegatiFG1Click(Sender: TObject);
    procedure btvAllDblClick(Sender: TObject);
    procedure AllegatiFG_RefreshQuery;
    procedure AllegatiFG1Click(Sender: TObject);
    procedure QryIntPrecCalcFields(DataSet: TDataSet);
    procedure btvPrecIntQTAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvPrecIntCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvPrecIntCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvPrescDESCRIZIONECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvPrescDataControllerDataChanged(Sender: TObject);
    procedure TimerBlinkTimer(Sender: TObject);
    procedure btvPrescEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure QryPratAppCalcFields(DataSet: TDataSet);
    procedure btvOPCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvOPCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvPrescCODICECustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvPrescRISOLTOCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvOPPRZUNITGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure QryOPAfterPost(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure QryPratAppAfterOpen(DataSet: TDataSet);
    procedure QryPratAppAfterPost(DataSet: TDataSet);
    procedure QryPratAppAfterRefresh(DataSet: TDataSet);
    procedure QryPratAppAfterDelete(DataSet: TDataSet);
    procedure tvAppSELECTEDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvAppEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure tvAppGARANZIA_SCADENZACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvAppCOMPUTED_APPARECCHIO_FULLCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvAppTIPOAPPARECCHIOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvAppANNOCOSTRUZIONECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormDestroy(Sender: TObject);
    function Dismesso(CurrRecord: TcxCustomGridRecord): Boolean;
    function Dismesso_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
    function Abbinato(CurrRecord: TcxCustomGridRecord): Boolean;
    function Abbinato_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
    function Abbinato_Ultimo(CurrRecord: TcxCustomGridRecord): Boolean;
    procedure DbeAgentePropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure DbeAgentePropertiesInitPopup(Sender: TObject);
    procedure dbeAgente2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente4PropertiesInitPopup(Sender: TObject);
    procedure Fogliodilavoro1Click(Sender: TObject);
    procedure SBEspandiRespImpClick(Sender: TObject);
    procedure SBEspandiProprietarioClick(Sender: TObject);
    procedure SBEspandiOccupanteClick(Sender: TObject);
    procedure SBEspandiInstallatoreClick(Sender: TObject);
    procedure SBInstallatoreClick(Sender: TObject);
    procedure SBOccupanteClick(Sender: TObject);
    procedure SBProprietarioClick(Sender: TObject);
    procedure SBRespImpClick(Sender: TObject);
    procedure QryAssCODICERESPIMPChange(Sender: TField);
    procedure QryAssCODICEPROPChange(Sender: TField);
    procedure QryAssCODICEUTChange(Sender: TField);
    procedure QryAssCODICEINSTChange(Sender: TField);
    procedure btvPrescRISOLTOPropertiesEditValueChanged(Sender: TObject);
    procedure cbVediNotePrivateSoggettoPropertiesChange(Sender: TObject);
    procedure QrySoggAfterOpen(DataSet: TDataSet);
    procedure QryAssAfterOpen(DataSet: TDataSet);
    procedure QryAssCalcFields(DataSet: TDataSet);
    procedure dbeComuneImmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dbeZonaImmPropertiesInitPopup(Sender: TObject);
    procedure QryAssCONTRATTO_VALIDITA_INIZIOChange(Sender: TField);
    procedure sbContrattoRinnovaClick(Sender: TObject);
    procedure btvOPPROSSIMACustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvOPCODICEIVACustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QryOPPRZUNITValidate(Sender: TField);
    procedure btvOPPERIODICITAGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvOPCODICEIVAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvOPPRZUNITNETTOIVACOMPGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure QryAssCONTRATTO_IMPORTOValidate(Sender: TField);
    procedure Contratto_ImportoKeyPress(Sender: TObject; var Key: Char);
    procedure QryOPPRZUNITNETTOIVACOMPValidate(Sender: TField);
    procedure btvOPEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure DBEOraInterventoPropertiesChange(Sender: TObject);
    procedure DBEOraAppuntamentoPropertiesChange(Sender: TObject);
    procedure SBEspandiPratica1Click(Sender: TObject);
    procedure QryImpRESOURCEIDChange(Sender: TField);
    procedure QryAssCONTRATTO_IMPORTONETTOIVACOMPValidate(Sender: TField);
    procedure sbOpenTask1Click(Sender: TObject);
    procedure btvPrecIntDataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
      AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
    procedure dbeNaturaGiuridicaPropertiesChange(Sender: TObject);
    procedure eCognomeRespImpKeyPress(Sender: TObject; var Key: Char);
    procedure QryPratAppBeforePost(DataSet: TDataSet);
    procedure DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
    procedure btvPrecIntAPPARECCHIO_FULLGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure DBERichiedentePropertiesInitPopup(Sender: TObject);
    procedure Deselezionacantiereimpianto1Click(Sender: TObject);
    procedure cbSelezionaAppTuttiPropertiesChange(Sender: TObject);
    procedure AnnullaApuntamento1Click(Sender: TObject);
    procedure DBETipoInterventoCheckStatesToEditValue(Sender: TObject; const ACheckStates: TcxCheckStates; out AEditValue: Variant);
    procedure DBETipoInterventoEditValueToCheckStates(Sender: TObject; const AEditValue: Variant; var ACheckStates: TcxCheckStates);
  private
    { Private declarations }
    fAzioniVisible: Boolean;
    // Array che contiene gli ID degli apparecchi che sono principali e i quali sono
    //  sono abbinati altri apparecchi. MI serve per impostare il campo COMPUTED_ABBINATO
    //  a True anche per gli articoli principali di un abbinamento.
    ElencoAbbinatiPrincipali: array of Integer;
    // FOrm della mappa
    fMapForm: TGmapForm;
    // Flag che indica se simamo attualmente in fase di modifica di una OP da parte
    //  di un rigo del documento collegato, nel qual caso fa in modo che non si inneschi
    //  un ciclo infinito.
    fUpdatingOpFromDoc: Boolean;
    // Conferma solo se c'è un soggetto del documento
    ConfermaDocSoloConSoggettoSelezionato: Boolean;
    // Conferma solo se appartenente ad una pratica
    ConfermaDocSoloConPraticaSelezionata: Boolean;
    // Conferma solo se il soggetto del documento è lo stesso della pratica di cui il documento fa parte
    ConfermaDocSoloSeStessoSoggettoDocEPratica: Boolean;
    // Conferma solo con articolo selezionato
    ConfermaDocSoloConArticoloSelezionato: Boolean;
    // Variabili che contengono la differenza tra la fine dell'appuntamento e l'inizio
    fDifferenzaAppuntamento: TDateTime;
    fDifferenzaIntervento: TDateTime;
    fTipoInterventoVisible: Boolean;
    fLuogoAppuntamentoVisible: Boolean;
    fAgenteVisible: Boolean;
    fArticoloVisible: Boolean;

    fTipoInterventoDefault: String;

    // Flags che indicano quali dati copiare nel luogo dell'appuntamento
    fCopiaCodFiscNelLuogoApp,
    fCopiaDescPraticaNelLuogoApp,
    fCopiaCapNelLuogoApp,
    fCopiaLocalitaNelLuogoApp,
    fCopiaProvinciaNelLuogoApp,
    fCopiaIndirizzoNelLuogoApp,
    fCopiaTelefonoNelLuogoApp,
    fCopiaCellulareNelLuogoApp: Boolean;

    fAbilitaStampaTagAppuntamento: Boolean;

    // Flag che indica se il documento deve chiedere una conferma prima del
    //  salvataggio del documento
    fConfermaSenzaConferma: Boolean;

    // Flag che indica se in questo momento stiamo creando un nuovo documento collegato
    //  (Intervento)
    fCreandoDocumentoCollegato: Boolean;

    fPrescrizioni_InEvidenza: Boolean;
    fPrescrizioni_Evidenzia: Boolean;

    fCalcoloInCorso: Boolean;

    // Flag che indica se, quando si clicca sul pulsante per convertire un appuntamento in
    //  intervento, deve chiedere la conferma all'utente
    fAppuntamentoToInterventoRichiediConferma: Boolean;

    // Parametri che determina se l'ID dell'impegno è progressivo o meno e se
    //  , in caso fosse progressivo, deve avere un preambolo con l'anno prima del
    //  numero (es: 190001 per il primo impegno del 2019)
    fIDProgressivo, FIDProgressivoAnno: Boolean;

    // Flag che indica se siamo in modalità di chiusura automatica ell'impegno
    FChiusuraAutomatica: Boolean;

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    // Puntatore alla form degli Allegati relativa a questa form stessa
    fAllegatiForm: TAllegatiForm;
    fNotePrivateSoggetto_Evidenzia: Boolean;
    fNotePrivateSoggetto_InEvidenza: Boolean;
    fNotePrivateImpianto_Evidenzia: Boolean;
    fNotePrivateImpianto_InEvidenza: Boolean;
    fImpiantoConPiuDiUnApparecchio: Boolean;
    FAgendaRefreshOnClose: Boolean;
    procedure Allegati_AggiornaDatiFiltri;
    procedure Allegati_CreaForm;
    procedure Allegati_VerificaAbilitazione;
    // =========================================================================


    procedure CaricaLayoutDocumento;
    procedure CaricaDatiTecnico(Codice: Integer);
    procedure ApriQueryElencoUltimiInterventi;
    procedure ApriDocumentoCollegato;
    procedure ApriPannelloIntestatario(P: TPanel);
    procedure ChiudiPannelloIntestatario(P: TPanel);
    function GetAppuntamentoEnabled: Boolean;
    function GetChiamataEnabled: Boolean;
    procedure SetAppuntamentoEnabled(const Value: Boolean);
    procedure SetChiamataEnabled(const Value: Boolean);
    procedure SetAzioniVisible(const Value: Boolean);
    function ImpiantoIsCaldaia: Boolean;
    procedure OpenQryAss;
    procedure SetTipoInterventoVisible(const Value: Boolean);
    procedure SetLuogoAppuntamentoVisible(const Value: Boolean);
    procedure SetAgenteVisible(const Value: Boolean);
    procedure SetArticoloVisible(const Value: Boolean);
    procedure CaricaTitoli;
    procedure CaricaUbicazioneImpiantoNelLuogoApp;
    procedure StampaTagAppuntamento(Preview:Boolean=False);
    procedure ImportaOpPratica(IdPratica: Integer);
    procedure NuovoRigoOP_DaPratica(IdOpPrat: Integer; Mode: TAddArtMode);
    procedure AggiornaIdOP;
    procedure AggiornaSingolaOpPratica(IdOpPratica:Integer; DataUltima:TDatetime; Periodicita:Integer; ForzaDataProssima:TDatetime=0);
    procedure AggiornaOpPraticaFatte;
    function IsUltimoIntervento: Boolean;
    function ConfermaModificheOP: TModalResult;
    procedure AllegatiFG_ApriQuery;
    procedure EnableDisableToolsBtn;
    procedure VisualizzaPreparaAllegatiForm(ForzaVisualizzazione:Boolean=False);
    procedure RefreshTabAllegati;
    procedure StampaTuttiGliAllegatiFG(Preview:Boolean);
    function UltimoRecordIntervento(CurrRecord: TcxCustomGridRecord): Boolean;
    procedure ApriQueryElencoPrescrizioni;
    procedure RefreshTabPrescrizioni;
    procedure SetPrescrizioni_Evidenzia(const Value: Boolean);
    procedure SetPrescrizioni_InEvidenza(const Value: Boolean);
    procedure MarcaPrescrizioniComeFatte;
    procedure RefreshQueryElencoPrescrizioni;
    procedure ApriQueryApparecchiPratica;
    function OPFromDoc_FindByOpApparecchio(DC: TcxCustomDataController; OP_ID: Integer): Integer;
    procedure DistruggiMappa;
    function GetApparecchiEnabled: Boolean;
    procedure SetApparecchiEnabled(const Value: Boolean);
    function IntegerInArray(const Value: Integer;
      const ArrayOfInteger: array of Integer): Boolean;
    procedure RefreshElencoAbbinatiPrincipali;
    procedure OpenQrySogg;
    function GetImpiantoAssegnato: Boolean;
    function GetPraticaAssegnata: Boolean;
    function GetSoggettoAssegnato: Boolean;
    procedure SetDataControllerFilterByApp(FDC: TcxCustomDataController; Column:TcxGridDBBandedColumn);
    procedure StampaFoglioDiLavoroCumulativo(Preview, KitTecnico: Boolean; Copie:Integer; DisableFilters:Boolean=False);
    procedure StampaFoglioDiLavoroSeparatoPerApparecchio(Preview,
      KitTecnico: Boolean; Copie:Integer=0);
    procedure ApriQueryParametriFoglioLavoro;
    procedure ImpostaDimensioniPannelliNote;
    procedure SetNotePrivateImpianto_Evidenzia(const Value: Boolean);
    procedure SetNotePrivateImpianto_InEvidenza(const Value: Boolean);
    procedure SetNotePrivateSoggetto_Evidenzia(const Value: Boolean);
    procedure SetNotePrivateSoggetto_InEvidenza(const Value: Boolean);
    procedure ControllaEvidenziazioneNotePrivateSoggetto;
    procedure ControllaEvidenziazioneNotePrivateImpianto;
    function GetPiuDiUnApparecchio: Boolean;
    procedure MarcaComeStampato;
    function DateTimeDifferenceToString(FromDateTime, ToDateTime: Variant): String;
    function CheckIfConfermaConAggiornamentoOP: Boolean;
    procedure GoogleTasks_CreateOrOpenTask(Invisible:Boolean=False);
    procedure GCal_CreateOrOpenEvent(Invisible:Boolean=False);
    procedure LoadSchedulerEventStateComboBoxProperties(const AcxImageComboBox:TcxDBImageComboBox);
    procedure LoadSchedulerLabelColorComboBoxProperties(const AcxColorComboBox:TcxDBColorComboBox);
    procedure SelezionaDeselezionaAppTutti(const ASeleziona: Boolean);
  public
    { Public declarations }
    // Variabili che contengono il riferimento al record corrente
    CurrentID, CurrentMASTER_ID : Integer;
    // Variabili apoggio dal conetnuto ovvio
    CodiceCliente,CodicePratica,DataPratica,TipoImpegno:String;

    constructor Create(AOwner: TComponent); override;

    property ChiamataEnabled:Boolean read GetChiamataEnabled write SetChiamataEnabled;
    property AppuntamentoEnabled:Boolean read GetAppuntamentoEnabled write SetAppuntamentoEnabled;
    property ApparecchiEnabled:Boolean read GetApparecchiEnabled write SetApparecchiEnabled;
    // Péroprieta che indica se è visualizzato o meno il pannellino delle azioni documento
    property AzioniVisible:Boolean read fAzioniVisible write SetAzioniVisible;
    // Proprietà che indica se il dato TipoIntervento deve essere visibile oppure no
    property TipoInterventoVisible: Boolean read fTipoInterventoVisible write SetTipoInterventoVisible;
    // Proprietà che indica se il Luogo dell'appuntamento deve essere visibile oppure no.
    property LuogoAppuntamentoVisible: Boolean read fLuogoAppuntamentoVisible write SetLuogoAppuntamentoVisible;
    // Proprietà che indica se il campo Agente è visibile appure no
    property AgenteVisible:Boolean read fAgenteVisible write SetAgenteVisible;
    // Proprietà che indica se l'articolo deve essere visible appure no.
    property ArticoloVisible:Boolean read fArticoloVisible write SetArticoloVisible;
    // Proprietà che determina se le stampe disponibili sono quelle normali per gli
    //  idraulici oppure solo la stampa del tag dell'appuntamento per Exis
    property AbilitaStampaTagAppuntamento:Boolean read fAbilitaStampaTagAppuntamento write fAbilitaStampaTagAppuntamento;

    // Proprietà che indica se in questo momento stiamo creando un nuovo documento collegato
    //  (Intervento)
    property CreandoDocumentoCollegato:Boolean read fCreandoDocumentoCollegato;



    // Proprietà che viene usata per far lampeggiare le prescrizioni se ci sono e che indica se in questo momento
    //  è in evidenza oppure no
    property Prescrizioni_InEvidenza:Boolean read fPrescrizioni_InEvidenza write SetPrescrizioni_InEvidenza;
    property NotePrivateSoggetto_InEvidenza:Boolean read fNotePrivateSoggetto_InEvidenza write SetNotePrivateSoggetto_InEvidenza;
    property NotePrivateImpianto_InEvidenza:Boolean read fNotePrivateImpianto_InEvidenza write SetNotePrivateImpianto_InEvidenza;
    // Proprietà che indica se le prescrizioni sono presenti e quindi sono da evidenziare oppure no
    property Prescrizioni_Evidenzia:Boolean read fPrescrizioni_Evidenzia write SetPrescrizioni_Evidenzia;
    property NotePrivateSoggetto_Evidenzia:Boolean read fNotePrivateSoggetto_Evidenzia write SetNotePrivateSoggetto_Evidenzia;
    property NotePrivateImpianto_Evidenzia:Boolean read fNotePrivateImpianto_Evidenzia write SetNotePrivateImpianto_Evidenzia;



    // Proprietà che punta alla form della mappa
    property MapForm:TGmapForm read fMapForm write fMapForm;
    // Proprietà che espone la FormAllegati del documento
    property AllegatiForm:TAllegatiForm read fAllegatiForm;
    // Proprietà che indica se l'appuntamento ha un cliente oppure un impianto assegnato
    property SoggettoAssegnato:Boolean read GetSoggettoAssegnato;
    property ImpiantoAssegnato:Boolean read GetImpiantoAssegnato;
    property PraticaAssegnata:Boolean read GetPraticaAssegnata;

    // Proprietà che indica se c'è più di un apparecchio nell'impianto oppure no.
    property PiuDiUnApparecchio:Boolean read GetPiuDiUnApparecchio;

    // Proprietà che indica se effettuare il refresh dell'agenda (in caso di agenda visibile) alla chiusura
    //  della form (chiusura di se stessa).
    //  NB: Altrimenti quanto stampavo il kit per il tecnico dall'agenda mi dava un errore alla fine
    property AgendaRefreshOnClose: Boolean read FAgendaRefreshOnClose write FAgendaRefreshOnClose;
  end;

var
  ImpegnoForm: TImpegnoForm;

implementation

uses main, QRAppuntamento, 
  SchedaClienti, IniFiles, cxSchedulerDialogs, cxSchedulerStorage,
  QRUltimiInterventiImpianto, SchedaPreventiviOrdini, DateUtils, StrUtils,
  SchedaArticoli1, FormAggiornaOp, FormAllegatiFG,
  FormConfermaAppuntamento, DataModuleStyles, cxDataUtils, DataModule2,
  UnitGoogleTasks, UnitGoogleCal, FormWait, cxVariants, cxSchedulerUtils,
  FormAssistenzeMobileMain;

{$R *.dfm}




// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che crea la form degli allegati se questa non esiste già e la
  //  apre, alla fine esegue l'interrogazione per mostrare gli allegati.
  procedure TImpegnoForm.Allegati_CreaForm;
  begin
    // Se la form degli allegati non è stata ancora creata la crea.
    if not Assigned(fAllegatiForm) then begin
      // Crea la form degli allegati
      fAllegatiForm := MainForm.Allegati_CreaForm(PanelAllegati);
      // Passa lo Splitter alla finestra degli allegati
      fAllegatiForm.Splitter := SplitterAllegati;
      // Se il documento attuale è un intervento e la parte appuntamento è già stata creata e anche
      //  la rispettiva FormALlegati è stata creata la linka alla presente.
      if (PreventiviOrdiniForm <> nil) and (PreventiviOrdiniForm.AllegatiForm <> nil) then begin
        AllegatiForm.LinkedAllegatiForm := PreventiviOrdiniForm.AllegatiForm;
      end;
    end;
    // Imposta i filtri
    Allegati_AggiornaDatiFiltri;
  end;

  // Procedure che aggiorna i filtri di collegamento della form degli allegati
  //  con la form attuale
  procedure TImpegnoForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QryImpCLIENTE.IsNull then fAllegatiForm.Filter_CodSogg := QryImpCLIENTE.Value;

    // Codice Pratica
    if not QryImpPRATICA.IsNull then fAllegatiForm.Filter_CodPrat := QryImpPRATICA.Value;
    // Data Pratica
    if not QryImpDATAPRATICA1.IsNull then fAllegatiForm.Filter_DataPrat := QryImpDATAPRATICA1.Value;

    // Tipo documento
    fAllegatiForm.Filter_TipoDoc := 'Intervento';
    // Registro Documento
    if not QryImpREGISTRO.IsNull then fAllegatiForm.Filter_RegDoc := QryImpREGISTRO.Value;
    // Numero documento
    if not QryImpID.IsNull then fAllegatiForm.Filter_NumDoc := QryImpID.Value;
    // Data documento
    //  NB: La data degli interventi non può essere usata
//    if not QryImpDATAORACHIAMATA.IsNull then fAllegatiForm.Filter_DataDoc := QryImpDATAORACHIAMATA.Value;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TImpegnoForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    //  NB: Se siamo in Modalità Assistenza Mobile via RDP rende invisibile gli allegati (post-it)
    if MainForm.ModoAssistenzeRDP then
    begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Visible := False;
    end
    else
    if QryImp.State = dsInsert then
    begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end
    else
    begin
      Allegati_CreaForm;
      SplitterAllegati.Enabled := True;
    end;
  end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================















procedure TImpegnoForm.AnnullaApuntamento1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Annulla appuntamento', 'Confermi di voler annullare l''appuntamento?', 'NB: L''operazione azzererà data, ora, tecnico, colore e tipo dell''appuntamento.', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    try
      QryImpSTART.OnChange := nil;
      QryImpFINISH.OnChange := nil;
      QryImpTIPOIMPEGNO.Value := 'Chiamata';
      QryImpSTART.Clear;
      QryImpFINISH.Clear;
      QryImpRESOURCEID.Clear;
      QryImpLABELCOLOR.Clear;
      QryImpSTATE.Clear;
      DBELuogo.SetFocus;
      DBEDataAppuntamento.SetFocus;
    finally
      QryImpSTART.OnChange := QryImpSTARTChange;
      QryImpFINISH.OnChange := QryImpFINISHChange;
    end;
  end;
end;



// Procedure che visualizza la form di preparazione degli eventuali
//  allegati.
procedure TImpegnoForm.VisualizzaPreparaAllegatiForm(ForzaVisualizzazione:Boolean=False);
begin
  // Se non siamo in un impianto di riscaldamento o centrale termica esce
  // NB: Controllo disabilitato su richiesta di Sivieri per fare in modo che
  //      venissero creati gli RCEE anche se l'impianto èer "generico"
//  if  (QryAssTIPOIMPIANTO.AsString <> 'Riscaldamento')
//  and (QryAssTIPOIMPIANTO.AsString <> 'Centrale termica')
//  and (QryAssTIPOIMPIANTO.AsString <> 'Climatizzazione')
//  and (QryAssTIPOIMPIANTO.AsString <> 'Refrigerazione')
//  then Exit;
  // Solo se appuntamento o chiamata (intervento solo su richiesta)
  if (not ForzaVisualizzazione) and (QryImpTIPOIMPEGNO.AsString <> 'Chiamata') and (QryImpTIPOIMPEGNO.AsString <> 'Appuntamento')
  then Exit;
  // Crea, imposta e visualizza la form di preparazione degli allegati
  Application.CreateForm(TConfermaAppuntamentoForm, ConfermaAppuntamentoForm);
  ConfermaAppuntamentoForm.IdImpegno     := QryImpMASTER_ID.Value;
  ConfermaAppuntamentoForm.IdImpegnoLong := QryImpID.Value;
  ConfermaAppuntamentoForm.IdPratica     := QryImpIDPRATICA.Value;
  // Carica i dati
  // NB: Se tutti gli apparecchio hanno il rispettivo allegato esce subito e non visualizza alcuna form
  if (ConfermaAppuntamentoForm.CaricaDatiAllegatiFG = 0) and not ForzaVisualizzazione then begin
    ConfermaAppuntamentoForm.Close;
    Exit;
  end;
  ConfermaAppuntamentoForm.ShowModal;
  // Al ritorno rinfresca l'elenco degli allegati
  AllegatiFG_RefreshQuery;
end;


// Procedure che effettua il refresh della query degli allegati F e G
procedure TImpegnoForm.AllegatiFG_RefreshQuery;
begin
  if QryAllegati.Active then begin
    QryAllegati.Refresh;
  end else begin
    AllegatiFG_ApriQuery;
  end;
end;

// Query che apre la query relativa agli allegati
procedure TImpegnoForm.AllegatiFG_ApriQuery;
begin
  if QryImpMASTER_ID.IsNull or (QryImpMASTER_ID.AsInteger = 0) then begin
    DM1.Messaggi('Levante', 'Master_ID dell''impegno non assegnato.'#13#13'La query degli allegati F e G non sarà aperta.', '', [mbOk], 0, nil);
    Exit;
  end;
  if QryAllegati.Active then QryAllegati.Close;
  if not QryAllegati.Prepared then QryAllegati.Prepare;
  QryAllegati.Params.ParamByName('P_IDIMPEGNO').AsInteger := QryImpMASTER_ID.AsInteger;
  QryAllegati.Open;
end;

// Procedura che apre la query che contiene i dati dell'impianto a cui
//  è assegnato l'impegno
procedure  TImpegnoForm.OpenQryAss;
begin
  // Chiude la query
  QryAss.Close;
  // Se non è specificato un impianto/cantiere non lo apre
  // NB: Anche se è un cantiere non serve che si apra tanto non usa questi dati
  if (QryImpPRATICA.AsInteger = 0) then Exit;   // Altrimemnti fa casini
  // Query che carica i dati dell'impianto
  QryAss.Prepare;
  QryAss.Params.ParamByName('P_PRATICA').asInteger := QryImpPRATICA.AsInteger;
  QryAss.Params.ParamByName('P_DATAPRATICA').AsDateTime := QryImpDATAPRATICA1.AsDateTime;
  QryAss.Open;
  // Rende i campi modificabili se siamo in modifica
  if RxSpeedModifica.Down then SourceAss.AutoEdit := True;
end;


// Procedura che apre la query che contiene i dati del soggetto a cui
//  è assegnato l'impegno
procedure  TImpegnoForm.OpenQrySogg;
begin
  // Chiude la query
  QrySogg.Close;
  // Se non è specificato un soggetto non lo apre
  // NB: Anche se è assegnato ad un impianto non lo apre perchè tanto non usa questi dati
  if (QryImpCLIENTE.AsInteger = 0) or Self.ImpiantoAssegnato then Exit;
  // Query che carica i dati del soggetto
  QrySogg.Prepare;
  QrySogg.Params.ParamByName('P_CODICE').AsInteger := QryImpCLIENTE.AsInteger;
  QrySogg.Open;
  // Se siamo in modalità di modifica le rende modificabili
  if RxSpeedModifica.Down then SourceSogg.AutoEdit := True;
end;


// Funzione che ritorna True se l'impianto a cui è assegnato il
//  documento è una caldaia.
function TImpegnoForm.ImpiantoIsCaldaia: Boolean;
begin
  Result := (
              DM1.IsInPratica(QryImp, 'PRATICA')
              and (not QryAssTIPOIMPIANTO.IsNull)
              and (   (QryAssTIPOIMPIANTO.AsString = 'Riscaldamento') or (QryAssTIPOIMPIANTO.AsString = 'Centrale termica')   )
            );
end;


procedure TImpegnoForm.ProcessBarcode(Barcode:String);
var
  TipoCodice: String;
  Cmd: String;
begin
// NB: HO tolto ShowWait perchè altrimenti su Vista quando si leggeva
//      un codice a barre l'applicazione perdeva il focus e mi causava problemi
//  DM1.ShowWait('Levante', 'Elaborazione codice a barre...');
  try
    // Ricava il tipo di codice letto
    TipoCodice := LeftStr(Barcode, 1);
    // In base al tipo di codice letto...
    if (TipoCodice = BARCODE_TIPOCODICE_CMD) then begin
      // =========================================================================
      // COMANDO "TRASFORMA IN INTERVENTO"
      // -------------------------------------------------------------------------
      // Ricava il tipo di documento letto
      Cmd := Barcode[2];
      // Se è stato letto un comando di trasformazione del documento in INTERVENTO
      if (Cmd = BARCODE_CMD_CONVERTIINTERVENTO) then begin
        SBCreaIntervento.Tag := 1;  // Così non chiede la conferma
        SBCreaInterventoClick(SBCreaIntervento);
      end;
      // =========================================================================
    // Se è stato letto un codice che indica un Agente, assegna l'agente al
    //  documento e poi lo trasforma in intervento.
    end else if (TipoCodice = BARCODE_TIPOCODICE_AGENTE) then begin
      // =========================================================================
      // ASSEGNAZIONE DELL'AGENTE E TRASFORMAZIONE IN INTERVENTO
      // -------------------------------------------------------------------------
      // Se è già un intervento esce subito
      if (not QryImpTIPOIMPEGNO.IsNull) and (QryImpTIPOIMPEGNO.Value = 'Intervento') then Exit;
      // Disabilita momentaneamente tutta la form in modo da evitare che l'utente
      //  prema il pulsante modifica per uscire dalla modifica prima dhe l'operazione sia completata
      //  altrimenti dava dei problemi.
      Self.Enabled := False;
      try
        // Depura il codice a barre letto dal primo carattere
        Barcode := MidStr(Barcode, 2, 1000);
        // Contestualmente trasforma l'appuntamento in un INtervento
        //  NB: IN questo modo si mette anche il documento in modalità di Modifica
        SBCreaIntervento.Tag := 1;  // Così non chiede la conferma
        SBCreaInterventoClick(SBCreaIntervento);
        // Messaggio
        DM1.ShowWait('Levante', 'Attendere...');
        try
          // Assegna l'agente
          QryImpAGENTE.AsString := DM1.GetNomeAgenteByCodice(StrToInt(Barcode));
        finally
          DM1.CloseWait;
        end;
      finally
        Self.Enabled := True;
        Self.Update;
        Application.ProcessMessages;
        // Imposta il focus
        DBERelazioneIntervento.SetFocus;
      end;
      // =========================================================================
    // Se è stato letto un codice documento (probabilmente lo stesso documento su cui
    //  siamo ora significa che lo vogliamo confermare, chiudere ed uscire
    end else if (TipoCodice = BARCODE_TIPOCODICE_DOCUMENTO) then begin
      // =========================================================================
      // CONFERMA E CHIUSURA AUTOMATICA DEL DOCUMENTO
      // -------------------------------------------------------------------------
      // Depura il codice a barre letto dal primo  e dal secondo carattere
      Barcode := MidStr(Barcode, 3, 1000);
      // Se è lo stesso barcode del documento attuale conferma il documento stesso
      //  e torna al menù principale.
      if Barcode = QryImpID.AsString then
      begin
        if RxSpeedModifica.Down then begin
          fConfermaSenzaConferma := True;
          RxSpeedModifica.Down := False;
          RxSpeedModificaClick(RxSpeedModifica);
        end;
        Close;
      end;
      // =========================================================================
    end;
  finally
//    DM1.CloseWait;
  end;
end;

procedure TImpegnoForm.CaricaLayoutDocumento;     // Personale
const
  MARGIN_UP = 10;
var
   LO : TMemIniFile;
   Sezione, Sottosez:String;
   YY, Sep, i : Integer;
begin
   // Disabilita il tracciamento a schermo della form
   LockWindowUpdate(Self.Handle);
   try
     // Prima di tutto si posiziona all'inizio della form
     AppuntamentoClientArea.VertScrollBar.Position := 0;
     // Inizializzazione
     PanelCreaIntervento.ParentColor    := True;
     PanelInformazioniUtili.ParentColor := True;
     // Prima di tutto rende invisibili i Tabs del PageControl
     PageControlPagineDocumento.HideTabs := True;

     // ========================================================================
     // BUTTONS DI GOOGLE TASKS E CALENDAR
     // ------------------------------------------------------------------------
     // Google Tasks
     sbOpenTask1.Visible := DM1.GoogleTasks_Enabled and (QryImpTIPOIMPEGNO.AsString = 'Chiamata');
     sbOpenTask2.Visible := sbOpenTask1.Visible;
     // ========================================================================

     // ------ CARICAMENTO PULSANTI E BOTTONI
     SBCreaIntervento.Glyph.LoadFromFile(DM1.TemaDir + 'btn_VUOTO.bmp');
     // Inizializzazione della sezione del Layouts.ini da ciu bisogna leggere i parametri
     Sezione := 'Appuntamenti';
     // Carica il tipo di impegno in modo da caricare i parametri relativi
     Sottosez := 'V_Appuntamento_';
     if QryImpTIPOIMPEGNO.AsString = 'Intervento' then Sottosez := 'V_Intervento_';
     // Inizializza la variabile che contiene il valore della posizione attuale
     //  del pennello di  visualizzazione tramite il quale ci si regola per la visualizzazione
     //  dei componenti.
     //  NB: Gli sottrae VertScrollBar.Position altrimenti fa casino
     YY := MARGIN_UP;
     // Apre il file che contiene i layouts di stampa e visualizzazione dei documenti.
     LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
     try
       // Parametri che determina se l'ID dell'impegno è progressivo o meno e se
       //  , in caso fosse progressivo, deve avere un preambolo con l'anno prima del
       //  numero (es: 190001 per il primo impegno del 2019)
       fIDProgressivo := LO.Readbool(Sezione, 'IDProgressivo', False);
       fIDProgressivoAnno := LO.Readbool(Sezione, 'IDProgressivoAnno', True);
       // Parametro che indica se l'agenda deve essere aggiornata alla chiusura dell'impegno (se vsibile)
       AgendaRefreshOnClose := LO.Readbool('AGENDA', 'RefreshOnClose', True);
       // Carica la proprietà che determina se le stampe disponibili sono quelle normali
       //  per gli idraulici oppure quelli della Exis
       fAbilitaStampaTagAppuntamento := LO.Readbool(Sezione, 'StampaTagAppuntamento', False);
       // Carica i flags che indica come eventualmente assegnare valori automaticamente al campo
       //  "Luogo appuntamento"
       fCopiaCodFiscNelLuogoApp     := LO.Readbool(Sezione, 'CopiaCodFiscNelLuogoApp',    False);
       fCopiaDescPraticaNelLuogoApp := LO.Readbool(Sezione, 'CopiaDescPraticaNelLuogoApp',True);
       fCopiaCapNelLuogoApp         := LO.Readbool(Sezione, 'CopiaCapNelLuogoApp',        False);
       fCopiaLocalitaNelLuogoApp    := LO.Readbool(Sezione, 'CopiaLocalitaNelLuogoApp',   True);
       fCopiaProvinciaNelLuogoApp   := LO.Readbool(Sezione, 'CopiaProvinciaNelLuogoApp',  True);
       fCopiaIndirizzoNelLuogoApp   := LO.Readbool(Sezione, 'CopiaIndirizzoNelLuogoApp',  True);
       fCopiaTelefonoNelLuogoApp    := LO.Readbool(Sezione, 'CopiaTelefonoNelLuogoApp',   False);
       fCopiaCellulareNelLuogoApp   := LO.Readbool(Sezione, 'CopiaCellulareNelLuogoApp',  False);

       fTipoInterventoDefault := Trim(LO.ReadString(Sezione, 'TipoInterventoDefault', ''));

       // Flag che indica se, quando si clicca sul pulsante per convertire un appuntamento in
       //  intervento, deve chiedere la conferma all'utente
       fAppuntamentoToInterventoRichiediConferma := LO.Readbool(Sezione, 'AppuntamentoToInterventoRichiediConferma',  False);

       // Carica la separazione verticale tra i componenti su una variabile locale per comodità
       Sep := LO.ReadInteger(Sezione, 'SeparazioneVerticale', 5) * 2;

       // Rende invisibili tutti i pannelli
       for i := 0 to AppuntamentoClientArea.ControlCount -1 do begin
         if AppuntamentoClientArea.Controls[i] is TPanel then AppuntamentoClientArea.Controls[i].Visible := False;
       end;

       // In base al tipo di intervento visualizza la form diversamente
       //  Se è un impegno generico...
       if QryImpTIPOIMPEGNO.AsString = 'Generico' then begin

         // ======================================================================
         //  APPUNTAMENTI GENERICI
         // ----------------------------------------------------------------------
         // Tabs per il passaggio ai documento collegati
         if (LO.ReadBool(Sezione, Sottosez+'TabsDocumentiCollegati', True)) then begin
           PanelTabs.Top := YY;
           PanelTabs.Visible := True;
           YY := YY + PanelTabs.Height + Sep;
           TabControlPagineDocumento.Tabs[DOCTABIDX_APPUNTAMENTO].Visible           := True;
           TabControlPagineDocumento.Tabs[DOCTABIDX_RICAMBIMANODOPERA].Visible      := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_OPERAZIONIPIANIFICATE].Visible  := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Visible   := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Visible               := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_ANAGRAFICAARTICOLO].Visible     := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_DISTINTABASE].Visible           := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_MAPPA].Visible                  := False;
         end else PanelTabs.Visible := False;
         // Posizionamento PageControl
         PageControlPagineDocumento.Top := YY;
  //       PageControlPagineDocumento.Height := ClientArea.ClientHeight - YY;
         // Azzera YY perchè tutti le altre pagine di componenti sono contenute nel
         //  PageControl
         YY := MARGIN_UP;
         // PanelDestinatario
         LabelPanelDestinatario.Caption := ' SOGGETTO';
         PanelDestinatario.Top := YY;
         PanelDestinatario.Visible := True;
         YY := YY + PanelDestinatario.Height + Sep;
         // PanelDestinazione merce
         PanelLuogoDestinazione.Visible := False;
         // Pannello Impegno Generico
         PanelImpegnoGenerico.Top := YY;
         PanelImpegnoGenerico.Visible := True;
         YY := YY + PanelImpegnoGenerico.Height + Sep;
         // Dimensiona verticalmente la ScrollBox
         AppuntamentoClientArea.VertScrollBar.Range := YY;
         // Sposta il focus sul primo campo editabile
         DBEMotivoImpegno.SetFocus;
         // ======================================================================

       // Se è una chiamata oppure un appuntaento...
       end else if (QryImpTIPOIMPEGNO.AsString = 'Chiamata') or (QryImpTIPOIMPEGNO.AsString = 'Appuntamento') then begin

         // ======================================================================
         //  CHIAMATA / APPUNTAMENTO
         // ----------------------------------------------------------------------
         // Tabs per il passaggio ai documento collegati
         if (LO.ReadBool(Sezione, Sottosez+'TabsDocumentiCollegati', True)) then begin
           PanelTabs.Top := YY;
           PanelTabs.Visible := True;
           YY := YY + PanelTabs.Height + Sep;
           // Abilita/Disabilita i pannelli
           TabControlPagineDocumento.Tabs[DOCTABIDX_APPUNTAMENTO].Enabled           := True;
           TabControlPagineDocumento.Tabs[DOCTABIDX_RICAMBIMANODOPERA].Enabled      := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_OPERAZIONIPIANIFICATE].Enabled  := Self.ImpiantoAssegnato;
           TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Enabled   := Self.ImpiantoAssegnato or Self.PraticaAssegnata;
           TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Enabled               := Self.ImpiantoAssegnato;
           TabControlPagineDocumento.Tabs[DOCTABIDX_MAPPA].Enabled                  := True;
           // Rende visibili o meni alcuni Tabs in base ai parametri
           TabControlPagineDocumento.Tabs[DOCTABIDX_APPUNTAMENTO].Visible           := LO.ReadBool(Sezione, Sottosez+'TabAppuntamento', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_RICAMBIMANODOPERA].Visible      := LO.ReadBool(Sezione, Sottosez+'TabRicambiManodopera', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_OPERAZIONIPIANIFICATE].Visible  := LO.ReadBool(Sezione, Sottosez+'TabOperazioniPianificate', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Visible   := LO.ReadBool(Sezione, Sottosez+'TabInterventiPrecedenti', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Visible               := LO.ReadBool(Sezione, Sottosez+'TabAllegati', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_MAPPA].Visible                  := LO.ReadBool(Sezione, Sottosez+'TabMappa', True);
           // Altri Tabs invece sono fissi
           TabControlPagineDocumento.Tabs[DOCTABIDX_ANAGRAFICAARTICOLO].Visible     := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_DISTINTABASE].Visible           := False;
         end else PanelTabs.Visible := False;
         // Posizionamento PageControl
         PageControlPagineDocumento.Top := YY;
  //       PageControlPagineDocumento.Height := ClientArea.ClientHeight - YY;
         // Azzera YY perchè tutti le altre pagine di componenti sono contenute nel
         //  PageControl
         YY := MARGIN_UP;

         // ======================================================================
         // DATI PRINCIPALI E DEL CANTIERE/PRATICA
         // ----------------------------------------------------------------------
         // Pannello dei dati principali e del cantiere/pratica
         //  NB: In base a varie cobinazioni di questi pannelli decide il da farsi
         if (LO.ReadBool(Sezione, Sottosez+'DatiPrincipaliDocumento', False))or(LO.ReadBool(Sezione, Sottosez+'Azioni', False)) then
         begin
           PanelNumDataDocumento.Top := YY;
           PanelNumDataDocumento.Visible := True;
           YY := YY + PanelNumDataDocumento.Height + Sep;
           AzioniVisible := LO.ReadBool(Sezione, Sottosez+'Azioni', False);
           PanelCantiere.Visible := False;
         end
         else
         if (LO.ReadBool(Sezione, Sottosez+'Pratica', True)) then begin
           PanelCantiere.Top := YY;
           PanelCantiere.Visible := True;
           YY := YY + PanelCantiere.Height + Sep;
           PanelNumDataDocumento.Visible := False;
         end
         else
         begin
           PanelCantiere.Visible := False;
           PanelNumDataDocumento.Visible := False;
         end;
         // ======================================================================

         // ======================================================================
         // DATI SOGGETTO MANUALI (SENZA SOGGETTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // ----- DATI DESTINATARIO - LUOGO DI DESTINAZIONE -----
         // NB: Solo se impianto non assegnato
         if  (   (LO.ReadBool(Sezione, Sottosez+'Destinatario', True))   or   (LO.ReadBool(Sezione, Sottosez+'LuogoDestinazione', False))   )
         and (not SoggettoAssegnato)
         and (not ImpiantoAssegnato)
         then begin
           YY := YY + Sep;
           LabelPanelDestinatario.Caption := ' SOGGETTO';
           PanelDestinatario.Height       := INTESTATARIO_CLOSE;
           PanelDestinatario.Top          := YY;
           PanelDestinatario.Visible      := LO.ReadBool(Sezione, Sottosez+'Destinatario', True);
           PanelLuogoDestinazione.Height  := INTESTATARIO_CLOSE;
           PanelLuogoDestinazione.Top     := YY;
           PanelLuogoDestinazione.Visible := LO.ReadBool(Sezione, Sottosez+'LuogoDestinazione', False);
           YY := YY + PanelDestinatario.Height;
         end;
         // ======================================================================

         // ======================================================================
         // DATI SOGGETTO (CON SOGGETTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // Panel Dati Soggetto
         // NB: Solo se soggetto assegnato e impianto invece no
         if (LO.ReadBool(Sezione, Sottosez+'DatiAnagSoggetto', True))
         and SoggettoAssegnato
         and (not ImpiantoAssegnato)
         then begin
           PanelSoggetto.Top := YY;
           PanelSoggetto.Visible := True;
           YY := YY + PanelSoggetto.Height + Sep;
         end;
         // Panel Note Soggetto
         // NB: Solo se soggetto assegnato e impianto invece no
         if (LO.ReadBool(Sezione, Sottosez+'NoteSoggetto', True))
         and SoggettoAssegnato
         and (not ImpiantoAssegnato)
         then begin
           PanelNoteSoggetto.Top := YY;
           PanelNoteSoggetto.Visible := True;
           YY := YY + PanelNoteSoggetto.Height + Sep;
         end;
         // ======================================================================

         // ======================================================================
         // DATI IMPIANTO (CON IMPIANTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // Panel Ubicazione Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'UbicazioneImpianto', True))
         and ImpiantoAssegnato
         then begin
           PanelUbicazioneImpianto.Top := YY;
           PanelUbicazioneImpianto.Visible := True;
           YY := YY + PanelUbicazioneImpianto.Height + Sep;
         end;
         // Panel Responsabile Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'ResponsabileImpianto', True))
         and ImpiantoAssegnato
         then begin
           PanelRespImp.Top := YY;
           PanelRespImp.Visible := True;
           YY := YY + PanelRespImp.Height + Sep;
         end;
         // Panel Note Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'NoteImpianto', True))
         and ImpiantoAssegnato
         then begin
           PanelNoteImpianto.Top := YY;
           PanelNoteImpianto.Visible := True;
           YY := YY + PanelNoteImpianto.Height + Sep;
         end;
         // Panel Apparecchi
         if (LO.ReadBool(Sezione, Sottosez+'Apparecchi', True))
         and ImpiantoAssegnato
         then begin
           PanelApparecchi.Top := YY;
           PanelApparecchi.Visible := True;
           Self.ApparecchiEnabled := True;
           YY := YY + PanelApparecchi.Height + Sep;
         end else PanelApparecchi.Visible := False;
         // ======================================================================

         // Panel Chiamata
         if (LO.ReadBool(Sezione, Sottosez+'Chiamata', True)) then begin
           PanelChiamata.Top := YY;
           PanelChiamata.Visible := True;
           Self.ChiamataEnabled := True;
           YY := YY + PanelChiamata.Height + Sep;
         end else PanelChiamata.Visible := False;
         // Panel Appuntamento
         if (LO.ReadBool(Sezione, Sottosez+'Appuntamento', True)) then begin
           PanelAppuntamento.Top := YY;
           PanelAppuntamento.Visible := True;
           Self.AppuntamentoEnabled := True;
           YY := YY + PanelAppuntamento.Height + Sep;
         end else PanelAppuntamento.Visible := False;
         {
         // Panel Operazioni Pianificate
         if (LO.ReadBool(Sezione, Sottosez+'OperazioniPianificate', True)) then begin
           PanelOP.Top := YY;
           PanelOP.Visible := True;
           YY := YY + PanelOP.Height + Sep;
         end else PanelOP.Visible := False;
         }
         // Panel RapportoIntervento
         if (LO.ReadBool(Sezione, Sottosez+'RapportoIntervento', False)) then begin
           PanelIntervento.Height := LabelSpese.Top;
           PanelIntervento.Top := YY;
           PanelIntervento.Visible := True;
           YY := YY + PanelIntervento.Height + Sep;
         end else PanelIntervento.Visible := False;

         // ======================================================================
         // DATI IMPIANTO (CON IMPIANTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // Panel Abbonamento Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'AbbonamentoImpianto', True))
         and ImpiantoAssegnato
         then begin
           PanelAbbonamentoImpianto.Top := YY;
           PanelAbbonamentoImpianto.Visible := True;
           YY := YY + PanelAbbonamentoImpianto.Height + Sep;
         end;
         // Panel Amministratore Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'AmministratoreImpianto', True))
         and ImpiantoAssegnato
         then begin
           PanelAmministratoreImpianto.Top := YY;
           PanelAmministratoreImpianto.Visible := True;
           YY := YY + PanelAmministratoreImpianto.Height + Sep;
         end;
         // Panel Proprietario Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'ProprietarioImpianto', True))
         and ImpiantoAssegnato
         then begin
           PanelProprietarioImpianto.Top := YY;
           PanelProprietarioImpianto.Visible := True;
           YY := YY + PanelProprietarioImpianto.Height + Sep;
         end;
         // Panel Occupante Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'OccupanteImpianto', True))
         and ImpiantoAssegnato
         then begin
           PanelOccupanteImpianto.Top := YY;
           PanelOccupanteImpianto.Visible := True;
           YY := YY + PanelOccupanteImpianto.Height + Sep;
         end;
         // ======================================================================

         // Button Crea Intervento
         if (LO.ReadBool(Sezione, Sottosez+'ButtonCreaIntervento', True)) then begin
           sbCreaIntervento1.Visible := True;
           sbCreaIntervento2.Visible := True;
           {
           PanelCreaIntervento.Top := YY;
           PanelCreaIntervento.Visible := True;
           YY := YY + PanelCreaIntervento.Height + Sep;
         end else PanelCreaIntervento.Visible := False;
           }
         end else begin
           sbCreaIntervento1.Visible := False;
           sbCreaIntervento2.Visible := False;
         end;

         // Titolo Info Utili
         if (LO.ReadBool(Sezione, Sottosez+'TitoloInfoUtili', False)) then begin
           PanelInformazioniUtili.Top := YY;
           PanelInformazioniUtili.Visible := True;
           YY := YY + PanelInformazioniUtili.Height + Sep;
         end else PanelInformazioniUtili.Visible := False;
         // Panel Interventi Precedenti
  {
         if (LO.ReadBool(Sezione, Sottosez+'InterventiPrecedenti', False)) then begin
           PanelInterventiPrecedenti.Top := YY;
           PanelInterventiPrecedenti.Visible := True;
           YY := YY + PanelInterventiPrecedenti.Height + Sep;
         end else PanelInterventiPrecedenti.Visible := False;
  }
         // Definizione del Parent di alcuni campi
         LabelTipoIntervento.Parent     := PanelChiamata;
         DBETipoIntervento.Parent       := PanelChiamata;
         LabelTecnico.Parent            := PanelAppuntamento;
         DBETecnico.Parent              := PanelAppuntamento;
         LabelAgente.Parent             := PanelAppuntamento;
         PanelAgenti.Parent             := PanelAppuntamento;
         DBEAgente.Parent               := PanelAppuntamento;
         PanelAgenti.Parent             := PanelAppuntamento;
         LabelArticolo.Parent           := PanelAppuntamento;
         DBEArticolo.Parent             := PanelAppuntamento;
         DbeDescrizioneArticolo.Parent  := PanelAppuntamento;
         // Dimensiona verticalmente la ScrollBox
         AppuntamentoClientArea.VertScrollBar.Range := YY;
         // ======================================================================

       // Se è un intervento...
       end
       else
       if QryImpTIPOIMPEGNO.AsString = 'Intervento' then
       begin

         // ======================================================================
         //  INTERVENTO
         // ----------------------------------------------------------------------
         // Tabs per il passaggio ai documento collegati
         if (LO.ReadBool(Sezione, Sottosez+'TabsDocumentiCollegati', True)) then
         begin
           PanelTabs.Top := YY;
           PanelTabs.Visible := True;
           YY := YY + PanelTabs.Height + Sep;
           // Abilita/Disabilita i pannelli
           TabControlPagineDocumento.Tabs[DOCTABIDX_APPUNTAMENTO].Enabled           := True;
           TabControlPagineDocumento.Tabs[DOCTABIDX_RICAMBIMANODOPERA].Enabled      := True;
           TabControlPagineDocumento.Tabs[DOCTABIDX_OPERAZIONIPIANIFICATE].Enabled  := Self.ImpiantoAssegnato;
           TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Enabled   := Self.ImpiantoAssegnato;
           TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Enabled               := Self.ImpiantoAssegnato;
           TabControlPagineDocumento.Tabs[DOCTABIDX_MAPPA].Enabled                  := True;
           // Rende visibili o meni alcuni Tabs in base ai parametri
           TabControlPagineDocumento.Tabs[DOCTABIDX_APPUNTAMENTO].Visible           := LO.ReadBool(Sezione, Sottosez+'TabAppuntamento', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_RICAMBIMANODOPERA].Visible      := LO.ReadBool(Sezione, Sottosez+'TabRicambiManodopera', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_OPERAZIONIPIANIFICATE].Visible  := LO.ReadBool(Sezione, Sottosez+'TabOperazioniPianificate', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Visible   := LO.ReadBool(Sezione, Sottosez+'TabInterventiPrecedenti', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Visible               := LO.ReadBool(Sezione, Sottosez+'TabAllegati', True);
           TabControlPagineDocumento.Tabs[DOCTABIDX_MAPPA].Visible                  := LO.ReadBool(Sezione, Sottosez+'TabMappa', True);
           // Altri Tabs invece sono fissi
           TabControlPagineDocumento.Tabs[DOCTABIDX_ANAGRAFICAARTICOLO].Visible     := False;
           TabControlPagineDocumento.Tabs[DOCTABIDX_DISTINTABASE].Visible           := False;
         end
         else
           PanelTabs.Visible := False;
         // Posizionamento PageControl
         PageControlPagineDocumento.Top := YY;
  //       PageControlPagineDocumento.Height := ClientArea.ClientHeight - YY;
         // Azzera YY perchè tutti le altre pagine di componenti sono contenute nel
         //  PageControl
         YY := MARGIN_UP;
         // Pannello dei dati principali e del cantiere/pratica
         //  NB: In base a varie cobinazioni di questi pannelli decide il da farsi
         if (LO.ReadBool(Sezione, Sottosez+'DatiPrincipaliDocumento', True))or(LO.ReadBool(Sezione, Sottosez+'Azioni', True)) then
         begin
           PanelNumDataDocumento.Top := YY;
           PanelNumDataDocumento.Visible := True;
           YY := YY + PanelNumDataDocumento.Height + Sep;
           AzioniVisible := LO.ReadBool(Sezione, Sottosez+'Azioni', True);
           PanelCantiere.Visible := False;
         end
         else
         if (LO.ReadBool(Sezione, Sottosez+'Pratica', True)) then
         begin
           PanelCantiere.Top := YY;
           PanelCantiere.Visible := True;
           YY := YY + PanelCantiere.Height + Sep;
           PanelNumDataDocumento.Visible := False;
         end
         else
         begin
           PanelCantiere.Visible := False;
           PanelNumDataDocumento.Visible := False;
         end;

         // ======================================================================
         // DATI SOGGETTO MANUALI (SENZA SOGGETTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // ----- DATI DESTINATARIO - LUOGO DI DESTINAZIONE -----
         // NB: Solo se impianto non assegnato
         if  (   (LO.ReadBool(Sezione, Sottosez+'Destinatario', True))   or   (LO.ReadBool(Sezione, Sottosez+'LuogoDestinazione', False))   )
         and (not SoggettoAssegnato)
         and (not ImpiantoAssegnato)
         then
         begin
           YY := YY + Sep;
           LabelPanelDestinatario.Caption := ' SOGGETTO';
           PanelDestinatario.Height       := INTESTATARIO_CLOSE;
           PanelDestinatario.Top          := YY;
           PanelDestinatario.Visible      := LO.ReadBool(Sezione, Sottosez+'Destinatario', True);
           PanelLuogoDestinazione.Height  := INTESTATARIO_CLOSE;
           PanelLuogoDestinazione.Top     := YY;
           PanelLuogoDestinazione.Visible := LO.ReadBool(Sezione, Sottosez+'LuogoDestinazione', False);
           YY := YY + PanelDestinatario.Height;
         end;
         // ======================================================================

         // ======================================================================
         // DATI SOGGETTO (CON SOGGETTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // Panel Dati Soggetto
         // NB: Solo se soggetto assegnato e impianto invece no
         if (LO.ReadBool(Sezione, Sottosez+'DatiAnagSoggetto', True))
         and SoggettoAssegnato
         and (not ImpiantoAssegnato)
         then
         begin
           PanelSoggetto.Top := YY;
           PanelSoggetto.Visible := True;
           YY := YY + PanelSoggetto.Height + Sep;
         end;
         // Panel Note Soggetto
         // NB: Solo se soggetto assegnato e impianto invece no
         if (LO.ReadBool(Sezione, Sottosez+'NoteSoggetto', True))
         and SoggettoAssegnato
         and (not ImpiantoAssegnato)
         then
         begin
           PanelNoteSoggetto.Top := YY;
           PanelNoteSoggetto.Visible := True;
           YY := YY + PanelNoteSoggetto.Height + Sep;
         end;
         // ======================================================================

         // ======================================================================
         // DATI IMPIANTO (CON IMPIANTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // Panel Ubicazione Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'UbicazioneImpianto', True))
         and ImpiantoAssegnato
         then
         begin
           PanelUbicazioneImpianto.Top := YY;
           PanelUbicazioneImpianto.Visible := True;
           YY := YY + PanelUbicazioneImpianto.Height + Sep;
         end;
         // Panel Responsabile Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'ResponsabileImpianto', True))
         and ImpiantoAssegnato
         then
         begin
           PanelRespImp.Top := YY;
           PanelRespImp.Visible := True;
           YY := YY + PanelRespImp.Height + Sep;
         end;
         // Panel Note Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'NoteImpianto', True))
         and ImpiantoAssegnato
         then
         begin
           PanelNoteImpianto.Top := YY;
           PanelNoteImpianto.Visible := True;
           YY := YY + PanelNoteImpianto.Height + Sep;
         end;
         // Panel Apparecchi
         if (LO.ReadBool(Sezione, Sottosez+'Apparecchi', True))
         and ImpiantoAssegnato
         then
         begin
           PanelApparecchi.Top := YY;
           PanelApparecchi.Visible := True;
           Self.ApparecchiEnabled := True;
           YY := YY + PanelApparecchi.Height + Sep;
         end
         else
           PanelApparecchi.Visible := False;
         // ======================================================================

         // Panel RapportoIntervento
         if (LO.ReadBool(Sezione, Sottosez+'RapportoIntervento', True)) then begin
           PanelIntervento.Height := LabelSpese.Top;
           PanelIntervento.Top := YY;
           PanelIntervento.Visible := True;
           YY := YY + PanelIntervento.Height + Sep;
         end else PanelIntervento.Visible := False;

         // ======================================================================
         // DATI IMPIANTO (CON IMPIANTO SELEZIONATO)
         // ----------------------------------------------------------------------
         // Panel Abbonamento Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'AbbonamentoImpianto', True))
         and ImpiantoAssegnato
         then
         begin
           PanelAbbonamentoImpianto.Top := YY;
           PanelAbbonamentoImpianto.Visible := True;
           YY := YY + PanelAbbonamentoImpianto.Height + Sep;
         end;
         // Panel Amministratore Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'AmministratoreImpianto', True))
         and ImpiantoAssegnato
         then
         begin
           PanelAmministratoreImpianto.Top := YY;
           PanelAmministratoreImpianto.Visible := True;
           YY := YY + PanelAmministratoreImpianto.Height + Sep;
         end;
         // Panel Proprietario Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'ProprietarioImpianto', True))
         and ImpiantoAssegnato
         then
         begin
           PanelProprietarioImpianto.Top := YY;
           PanelProprietarioImpianto.Visible := True;
           YY := YY + PanelProprietarioImpianto.Height + Sep;
         end;
         // Panel Occupante Impianto
         // NB: Solo se impianto assegnato
         if (LO.ReadBool(Sezione, Sottosez+'OccupanteImpianto', True))
         and ImpiantoAssegnato
         then
         begin
           PanelOccupanteImpianto.Top := YY;
           PanelOccupanteImpianto.Visible := True;
           YY := YY + PanelOccupanteImpianto.Height + Sep;
         end;
         // ======================================================================

         {
         // Panel Operazioni Pianificate
         if (LO.ReadBool(Sezione, Sottosez+'OperazioniPianificate', True)) then begin
           PanelOP.Top := YY;
           PanelOP.Visible := True;
           YY := YY + PanelOP.Height + Sep;
         end else PanelOP.Visible := False;
         }
         // Titolo Info Utili
         if (LO.ReadBool(Sezione, Sottosez+'TitoloInfoUtili', True)) then
         begin
           PanelInformazioniUtili.Top := YY;
           PanelInformazioniUtili.Visible := True;
           YY := YY + PanelInformazioniUtili.Height + Sep;
         end
         else
           PanelInformazioniUtili.Visible := False;
         // Panel Appuntamento
         if (LO.ReadBool(Sezione, Sottosez+'Appuntamento', True)) then
         begin
           PanelAppuntamento.Top := YY;
           PanelAppuntamento.Visible := True;
           Self.AppuntamentoEnabled := False;
           YY := YY + PanelAppuntamento.Height + Sep;
         end
         else
           PanelAppuntamento.Visible := False;
         // Panel Chiamata
         if (LO.ReadBool(Sezione, Sottosez+'Chiamata', True)) then
         begin
           PanelChiamata.Top := YY;
           PanelChiamata.Visible := True;
           Self.ChiamataEnabled := False;
           YY := YY + PanelChiamata.Height + Sep;
         end
         else
           PanelChiamata.Visible := False;
         {
         // Panel Interventi Precedenti
         if (LO.ReadBool(Sezione, Sottosez+'InterventiPrecedenti', False)) then begin
           PanelInterventiPrecedenti.Top := YY;
           PanelInterventiPrecedenti.Visible := True;
           YY := YY + PanelInterventiPrecedenti.Height + Sep;
         end else PanelInterventiPrecedenti.Visible := False;
         }
         // Button Crea Intervento
         if (LO.ReadBool(Sezione, Sottosez+'ButtonCreaIntervento', False)) then
         begin
           sbCreaIntervento1.Visible := True;
           sbCreaIntervento2.Visible := True;
           {
           PanelCreaIntervento.Top := YY;
           PanelCreaIntervento.Visible := True;
           YY := YY + PanelCreaIntervento.Height + Sep;
         end else PanelCreaIntervento.Visible := False;
           }
         end
         else
         begin
           sbCreaIntervento1.Visible := False;
           sbCreaIntervento2.Visible := False;
         end;
         // Definizione del Parent di alcuni campi
         LabelTipoIntervento.Parent     := PanelIntervento;
         DBETipoIntervento.Parent       := PanelIntervento;
         LabelTecnico.Parent            := PanelIntervento;
         DBETecnico.Parent              := PanelIntervento;
         LabelAgente.Parent             := PanelIntervento;
         DBEAgente.Parent               := PanelIntervento;
         PanelAgenti.Parent             := PanelIntervento;
         LabelArticolo.Parent           := PanelIntervento;
         DBEArticolo.Parent             := PanelIntervento;
         DbeDescrizioneArticolo.Parent  := PanelIntervento;
         // Sistema il Tab Order del pannello
         DBETipoIntervento.TabOrder       := DBEditStatoDocumento.TabOrder + 1;
         DBETecnico.TabOrder              := DBETipoIntervento.TabOrder + 1;
         DbeAgente.TabOrder               := DBETecnico.TabOrder + 1;
         PanelAgenti.TabOrder             := DbeAgente.TabOrder + 1;
         DBEArticolo.TabOrder             := PanelAgenti.TabOrder + 1;
         DbeDescrizioneArticolo.TabOrder  := DBEArticolo.TabOrder + 1;
         DBERelazioneIntervento.TabOrder  := DbeDescrizioneArticolo.TabOrder + 1;
         // Dimensiona verticalmente la ScrollBox
         AppuntamentoClientArea.VertScrollBar.Range := YY;
         // ======================================================================

       end;

       // Altri flag di visualizzazione
       TipoInterventoVisible          := LO.ReadBool(Sezione, 'TipoIntervento', True);
       LuogoAppuntamentoVisible       := LO.ReadBool(Sezione, 'LuogoAppuntamento', True);
       AgenteVisible                  := LO.ReadBool(Sezione, 'Agente', False);
       ArticoloVisible                := LO.ReadBool(Sezione, 'Articolo', False);

       // Carica alcuni flags
       ConfermaDocSoloConSoggettoSelezionato        := LO.ReadBool(Sezione, 'ConfermaDocSoloConSoggettoSelezionato', False);
       ConfermaDocSoloConPraticaSelezionata         := LO.ReadBool(Sezione, 'ConfermaDocSoloConPraticaSelezionata', False);
       ConfermaDocSoloSeStessoSoggettoDocEPratica   := LO.ReadBool(Sezione, 'ConfermaDocSoloSeStessoSOggettoDocEPratica', False);
       ConfermaDocSoloConArticoloSelezionato        := LO.ReadBool(Sezione, 'ConfermaDocSoloConArticoloSelezionato', False);

       // Se non c'è il documento collegato e si tratta di un Intervento lo crea subito
       //  altrimenti se c0è già un documento collegato aggiorna il suo layout perchè
       //  potrebbero essere cambiati alcuni dati.
       if (PreventiviOrdiniForm = nil) then
       begin
         if (QryImpTIPOIMPEGNO.AsString = 'Intervento') then
           ApriDocumentoCollegato
       end
       else
         PreventiviOrdiniForm.CaricaTitoli;  // Per aggiornare i Tabs anche nel documento collegato

     finally
       LO.Free;
     end;

     // ========================================================================
     // PARTE CHE, SE C'E' UN SOLO APPARECCHIO NELL'IMPIANTO O NESSUNO
     //  NON VISUALIZZA L'INDICAZIONE DELL'APPARECCHIO STESSO NELLE O.P.
     //  E NEI PRECEDENTI
     // ------------------------------------------------------------------------
     // Se c'è più di 1 apparecchio...
     // NB: HO bloccato il tutto in modo che sia sempre separato per apparecchio
     //      alla fine è meglio e più chiaro così, in più è sempre uguale.
//     if PiuDiUnApparecchio then
     if True then
       btvOPIDAPPARECCHIOPRAT.GroupIndex := 0
     // Se NON c'è più di 1 apparecchio...
     else
       btvOPIDAPPARECCHIOPRAT.GroupIndex := -1;
     // ========================================================================
  finally
    // RIabilita il tracciamento della Form
   LockWindowUpdate(0);
  end;
end;



procedure TImpegnoForm.FormKeyUp(Sender: TObject; var Key: Word;
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

      // F7 = Stampa
      118: begin
         if RxSpeedButtonStampa.Enabled then begin
            RxSpeedButtonStampa.Down := not RxSpeedButtonStampa.Down;
            RxSpeedButtonStampaClick(Self);
         end;
      end;

      // F12 = Crea intervento
      123: begin
         if sbCreaIntervento1.Enabled or sbCreaIntervento2.Enabled then begin
            SBCreaInterventoClick(SBCreaIntervento);
         end;
      end;
   end;
end;

procedure TImpegnoForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  Close;
end;

procedure TImpegnoForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Inizializzazione
     MR := mrNone;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then
     begin
       // Apre l'attesa
       DM1.Attendere;
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Avvia la transazione verificandoprima che non ce ne siano altre già avviate
          // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
          DM1.CheckForAlreadyInTransaction;
          DM1.DBAzienda.StartTransaction;
          // Abilita la modifica dei campi
          // NB: Per risolvere la lentezza soprattutto relativa a QrySogge e QryAss
          //      ne ho imposato la proprietà PessimisticLocking = False
          QryImp.Edit;
          if QryAss.Active then
            QryAss.Edit;   // *** LENTO ***    Prima testo se sono Active perchè in caso di nuovo documento non lo sono e darebbe errore
          if QrySogg.Active then
            QrySogg.Edit; // *** LENTO ***   Prima testo se sono Active perchè in caso di nuovo documento non lo sono e darebbe errore
          SourceOP.AutoEdit := True;
          SourcePratApp.AutoEdit := True;
          // Abilita Pulsanti e altro
          EnableDisableToolsBtn;
          SBSoggetto.Enabled                 := True;
          SBRespImp.Enabled                  := True;
          SBProprietario.Enabled             := True;
          SBOccupante.Enabled                := True;
          SBInstallatore.Enabled             := True;
          SBSoggImpianto.Enabled             := True;
          sbContrattoRinnova.Enabled         := True;
          BitBtnDestinazioneMerci.Enabled    := True;
          BitBtnPratica1.Enabled             := True;
          BitBtnPratica1_2.Enabled           := True;
          BitBtnSelezioneStato.Enabled       := True;
          DbeAzioneMagazzino.Enabled         := True;
          DbeAzioneCantiere.Enabled          := True;
          sbOpenTask1.Enabled                := False;
          sbOpenTask2.Enabled                := False;
          btvAll.PopupMenu                   := nil;
          cbSelezionaAppTutti.Enabled        := True;
          // Flag che se True fa in modo che sia possibili modificare il registro dei documento solo
          //  alla creazione del documento stesso e non lo consente più successivamente.
          DBComboRegistro.Enabled := not (DM1.ModificaRegistroSoloNuovoDocumento and (not QryImpID.IsNull));
          // Se è in chiusura automatica non colora i campi per motivi estetici (preferisco)
          if not FChiusuraAutomatica then
            DM1.ColoraTuttiCampi(ImpegnoForm, COLOR_MODIFICA);
          // Mette in modifica anche il documento collegamo
          if PreventiviOrdiniForm <> nil then begin
            PreventiviOrdiniForm.RxSpeedModifica.Down := True;
            PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
          end;
          // Chiude l'attesa
          DM1.ChiudiAttendere;
       except
          on E: Exception do begin
               // Chiude l'attesa
               DM1.ChiudiAttendere;
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end
     else
     begin
       // Apre l'attesa
       DM1.Attendere;
       try
         // Gestisce l'eccezione nel caso qualche cosa vada storto
         try
            // Disabilita la modifica dei campi
            QryImp.Edit;
            // Se si è letto il codice a barre del documento lo conferma senza richiedere
            //  la conferma all'utente
            if fConfermaSenzaConferma then
            begin
              MR := mrYes;
              fConfermaSenzaConferma := False;
            end;
            // Chiede di confermare le modifiche o di annullare l'operazione
            //  NB: Se è un Intervento ed è l'ultimo degli interventi richiede conferma
            //      con anche conferma di aggiornametno delle OP
            //  NB: Se non è stata inserita la data e ora di inizio intervento non può
            //      procedere con la conferma ConfermaModificheOP e quindi usa quella normale
            //      (tanto se si devono annullare i cambiamenti funziona mentre se si conferma darebbe l'errore che non è stato specificato il campo).
            if MR = mrNone then
            begin
              //if Self.ImpiantoAssegnato and IsUltimoIntervento
              if CheckIfConfermaConAggiornamentoOP then
                MR := ConfermaModificheOP
              else
                MR := DM1.ConfermaModifiche;
            end;
            if MR = mrYes then
            begin
                 // Se il responsabile dell'impianto è una persona giuridica la Ragione Sociale
                 //  è un campo obbligatorio
                 if eRagSocRespImp.Focused then
                   Self.SelectNext(eRagSocRespImp, True, True);  // Per essere sicuri che il dato sia confermato
                 if (QryAssNATURAGIURIDICARESPIMP.AsString = 'G') and (Trim(QryAssRAGSOCRESPIMP.AsString) = '') then
                   raise Exception.Create('Campo obbligatorio ("Ragione Sociale" del Responsabile Impianto)');
                 // Sposto adesso il focus su un campo qualsiasi  tranne DBETipoIntervento
                 //  perchè se l'utente ha cliccato sul componente e poi conferma il documento
                 //  senza avere prima spostato il focus il componente stesso non ha ancora
                 //  agiornato il campo sul database e quindi il valore da controlare con le righe
                 //  successive non sarebbe giusto.
                 //  NB: Questo solo se siamo nella pagina "Appuntamento"
                 if PageControlPagineDocumento.ActivePage = TabAppuntamento then begin
                   if (QryImpTIPOIMPEGNO.AsString = 'Generico') then begin
                     DBEOraInizioGenerico.SetFocus;
                     DBEDataInizioGenerico.SetFocus;
                   end else if (QryImpTIPOIMPEGNO.AsString = 'Intervento') then begin
                     DBEOraIntervento.SetFocus;
                     DBEDataIntervento.SetFocus;
                   end else if PanelChiamata.Visible then begin
                     DBEOraChiamata.SetFocus;
                     DBEDataChiamata.SetFocus;
                   end else if PanelAppuntamento.Visible then begin
                     DBEOraAppuntamento.SetFocus;
                     DBEDataAppuntamento.SetFocus;
                   end;
                 end;
                 // Controlla che la DATAORAINTERVENTO non sia nulla nel caso di un Intervento
                 if (QryImpTIPOIMPEGNO.AsString = 'Intervento') and (QryImpDATAORAINTERVENTO.IsNull) then begin
                   DM1.Messaggi('ATTENZIONE!!!', 'Data di esecuzione dell''intervento non inserita.'#13#13'Conferma annullata!', '', [mbOk], 0, nil);
                   RxSpeedModifica.Down := True;
                   Exit;
                 end;
                 // Nel caso sia abilitato ilrelativo flag controlla che il documento
                 //  abbia il soggetto selezionato altrimenti non ne permette la conferma
                 if ConfermaDocSoloConSoggettoSelezionato and ((QryImpCLIENTE.IsNull) or (QryImpCLIENTE.AsInteger = 0)) then begin
                   DM1.Messaggi('ATTENZIONE!!!', 'Soggetto non selezionato.'#13#13'Conferma annullata!', '', [mbOk], 0, nil);
                   RxSpeedModifica.Down := True;
                   Exit;
                 end;
                 // Nel caso sia abilitato ilrelativo flag controlla che il documento
                 //  abbia una pratica selezionato altrimenti non ne permette la conferma
                 if ConfermaDocSoloConPraticaSelezionata and (QryImpPRATICA.IsNull) then begin
                   DM1.Messaggi('ATTENZIONE!!!', 'Pratica/Cantiere non selezionata.'#13#13'Conferma annullata!', '', [mbOk], 0, nil);
                   RxSpeedModifica.Down := True;
                   Exit;
                 end;
                 // Nel caso sia abilitato ilrelativo flag controlla che il soggetto
                 //  intestatario del documento sia lo stesso soggetto intestatario della pratica
                 //  ovviamente il documento deve far parte di una pratica.
                 if  ConfermaDocSoloSeStessoSoggettoDocEPratica
                 and ((QryImpPRATICA.IsNull) or (QryImpCLIENTE.IsNull) or (QryImpCLIENTE.AsInteger = 0) or (QryImpCLIENTE.AsInteger <> DM1.GetCodiceSoggettoPratica(QryImpPRATICA.AsInteger, QryImpDATAPRATICA1.AsDateTime)))
                 then begin
                   DM1.Messaggi('ATTENZIONE!!!', 'Il soggetto intestatario del documento e il soggetto intestatario della pratica/cantiere della quale il documento fa parte devono combaciare.'#13#13'Conferma annullata!', '', [mbOk], 0, nil);
                   RxSpeedModifica.Down := True;
                   Exit;
                 end;
                 // Nel caso sia abilitato ilrelativo flag controlla che l'impegno abbia l'articolo selezionato...
                 if ConfermaDocSoloConArticoloSelezionato and ((QryImpCODICEARTICOLO.IsNull) or (Trim(QryImpCODICEARTICOLO.AsString)='')) then begin
                   DM1.Messaggi('ATTENZIONE!!!', 'Articolo/Trattamento non selezionato.'#13#13'Conferma annullata!', '', [mbOk], 0, nil);
                   RxSpeedModifica.Down := True;
                   Exit;
                 end;



                 // Nel caso sia un intervento (doc collegato) verifica la correttezza del protocollo
                 if  (PreventiviOrdiniForm <> nil)
                 and (not PreventiviOrdiniForm.QryDocumentoPROTOCOLLO.IsNull)
                 and PreventiviOrdiniForm.ControllaProtocolloDocStessoAnno(PreventiviOrdiniForm.QryDocumentoPROTOCOLLO.Value)
                 then
                 begin
                   DM1.Messaggi('ATTENZIONE!!!', 'Un documento con lo stesso protocollo è già presente.', '', [mbOk], 0, nil);
                   RxSpeedModifica.Down := True;
                   PreventiviOrdiniForm.RxSpeedModifica.Down := True;
                   Exit;
                 end;


                 // Controlla che il campo TIPOINTERVENETO sia stato compilato altrimenti
                 //  fà in modo che non si possa salvare
//                 if (QryImpTIPOIMPEGNO.AsString <> 'Generico') and (QryImpTIPOINTERVENTO.IsNull or (Trim(QryImpTIPOINTERVENTO.AsString) = '')) then
                 if (QryImpTIPOIMPEGNO.AsString <> 'Generico')
                 and not (DBETipoIntervento.Items[0].Checked or DBETipoIntervento.Items[1].Checked or DBETipoIntervento.Items[2].Checked) then
                 begin
                   // Chiude l'attesa
                   DM1.ChiudiAttendere;
                   RxSpeedModifica.Down := not RxSpeedModifica.Down;
                   DM1.Messaggi('Levante', 'Non è stato specificato il TIPO INTERVENTO.', 'NB: Il campo TIPO INTERVENTO E'' OBBLIGATORIO', [mbOK], 0, nil);
                   Exit;
                 end;



                 // Controlla che il tecnico sia inserito
  //               if QryImpRESOURCEID.IsNull then begin
                    // Chiude l'attesa
  //                  DM1.ChiudiAttendere;
  //                  RxSpeedModifica.Down := not RxSpeedModifica.Down;
  //                  DM1.Messaggi('Levante', 'Non è stato specificato il campo "' + DM1.GridsColumnTecnicoCaption + '".', 'NB: Il campo "' + DM1.GridsColumnTecnicoCaption + '" E'' OBBLIGATORIO', [mbOK], 0, nil);
  //                  Exit;
  //               end;
                 // Controlla che sia stato inserito l'orario di inizio e fine dell'appuntamento
  //               if QryImpSTART.IsNull or QryImpFINISH.IsNull then begin
                    // Chiude l'attesa
  //                  DM1.ChiudiAttendere;
  //                  RxSpeedModifica.Down := not RxSpeedModifica.Down;
  //                  DM1.Messaggi('Levante', 'Non è stato specificata l''ora di inizio o fine dell''appuntamento.', 'NB: QUESTI CAMPI SONO OBBLIGATORI', [mbOK], 0, nil);
  //                  Exit;
  //               end;
                 // Se il codice cliente è nullo (nuovo cliente) ne assegna uno nuovo.
                 if QryImpID.IsNull then begin
                    QryImpID.Value := DM1.NextCodiceImpegno(fIDProgressivo, FIDProgressivoAnno, QryImpDATAORACHIAMATA.AsDateTime);
                 end;

                 // Se si tratta di una chiamata ma sono compilati i campi relativi
                 //  all'appuntamento lo trasforma in un appuntamento
                 if (QryImpTIPOIMPEGNO.AsString <> 'Generico') and (QryImpTipoImpegno.AsString <> 'Intervento') then begin
                   // Se la data e ora dell'appuntamento è impostato imposta il tipo
                   //  di impegno come appuntamento, altrimenti è una chiamata
                   if not QryImpStart.IsNull then begin
                     // Se era una chiamata ora lo fa diventare un appuntamento
                     if QryImpTipoImpegno.AsString <> 'Appuntamento' then begin
                       QryImpTipoImpegno.Value := 'Appuntamento';
                       // ======================================================
                       // GOOGLE TASKS
                       // ------------------------------------------------------
                       try try
                         DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
                         GoogleTasks_DeleteTaskByMaster_ID(QryImpMASTER_ID.AsInteger, True);
                       except
                         DM1.Messaggi('Levante', 'Google Tasks'#13#13'Temo di non riuscire a comunicare.'#13#13'Dovrai eliminare manualmente la chiamata dai Tasks.', '', [mbOk], 0, nil);
                       end;
                       finally
                         DM1.CloseWait;
                       end;
                       // ======================================================
                     end;
                   end else begin
                     // Se era già dello stesso tipo non fa nulla altrimenti mi sfarfalla lo schermo
                     if QryImpTipoImpegno.AsString <> 'Chiamata' then QryImpTipoImpegno.Value := 'Chiamata';
                   end;
                 end;

                 // Post
                 QryImp.Post;
                 QryImp.ApplyUpdates;
                 QryImp.CommitUpdates;

                 // Esegue il post solo se la pratica o il soggetto sono stati assegnati e ovviamente se
                 //  il relativo DataSet è in Editing/Inserting
                 // NB: Per risolvere la lentezza soprattutto relativa a QrySogge e QryAss
                 //      ne ho imposato la proprietà PessimisticLocking = False
                 if QryAss.Active and (QryAss.State <> dsBrowse)then begin
                   if (QryImpPRATICA.AsInteger <> 0) then QryAss.Post else QryAss.Cancel;
                 end;
                 if QrySogg.Active and (QrySogg.State <> dsBrowse)then begin
                   if (QryImpCLIENTE.AsInteger <> 0) then QrySogg.Post else QrySogg.Cancel;
                 end;
                 // Esegue il post delle OP solo se il relativo DataSet è in Editing/Inserting
                 if QryOP.State <> dsBrowse then QryOP.Post;

                 SourceOP.AutoEdit := False;
                 SourcePratApp.AutoEdit := False;

                 // Aggiorna i dati identificativi del documento collegato
                 if PreventiviOrdiniForm <> nil then begin
                   PreventiviOrdiniForm.QryDocumentoTIPODOCUMENTO.Value := 'Intervento';
                   PreventiviOrdiniForm.QryDocumentoREGISTRO.Value := QryImpREGISTRO.AsString;
                   PreventiviOrdiniForm.QryDocumentoNUMORDPREV.Value := QryImpID.Value;
                   PreventiviOrdiniForm.QryDocumentoDATADOCUMENTO.Value := DateOf(QryImpDATAORAINTERVENTO.Value);
                   // Rimette in modalità normale anche il documento collegato
                   PreventiviOrdiniForm.ModalResultConferma := mrYes;
                   PreventiviOrdiniForm.RxSpeedModifica.Down := False;
                   PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
                 end;

                 // Procedure che cicla per tutte le operazioni pianificate e aggiorna
                 //  l'ID relativo all'impegno.
                 AggiornaIdOP;

                 // Procedure che marca le raccomandazioni/prescrizione come fatte/risolte
                 MarcaPrescrizioniComeFatte;
                 // Commit
                 DM1.DBAzienda.CommitRetaining;
                 // Aggiorna le variabili che contengono il riferimento all'impegno corrente
                 CurrentID       := QryImpID.AsInteger;
                 // Se aperta chiude e riapre la query che contiene i dati dell'impianto a cui
                 //  questo impegno è associato. In questo modo se l'ID dell'impegno è cambiato oppure
                 //  se si stà confermando un impegno nuovo, QryAss contiene i dati dell'impianto correttamente.
                 OpenQryAss;
                 OpenQrySogg;
                 // VIsualizza la form che permette di creare in una botta sole
                 //  tutti gli allegati necessari.
                 VisualizzaPreparaAllegatiForm;
                 // Solo se il tab degli allegati è visibile a enabled
                 if TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Enabled and TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Visible then
                 begin
                   // Refresh dell'elenco degli allegati
                   AllegatiFG_RefreshQuery;
                   // Refresh delle prescrizioni/raccomandazioni
                   RefreshQueryElencoPrescrizioni;
                 end;
                 // Se disabilitato riabilita il pulsante di trasformazione in Intervento
                 if SBCreaIntervento.Visible then SBCreaIntervento.Enabled := True;
                 if sbCreaIntervento1.Visible then sbCreaIntervento1.Enabled := True;
                 if sbCreaIntervento2.Visible then sbCreaIntervento2.Enabled := True;
                 // Decide se gli allegati devono essere già visibili oppure no.
                 Allegati_VerificaAbilitazione;
                 // Distrugge la mappa in modo che se è cambiato l'indirizzo questa venga ricreata con quello nuovo
                 DistruggiMappa;
                 // ======================================================
                 // GOOGLE TASKS
                 // ------------------------------------------------------
                 // Se si tratta di una nuova Chiamata (Self.Tag = 2) e se la funzionalità è abilitata
                 //  gestisce la creazione automatica di un Task di GoogleTasks
                 if  (Self.Tag = 2)
                 and DM1.GoogleTasks_Enabled
                 and DM1.GoogleTasks_CreazioneAutomaticaDaChiamata
                 and (QryImpTipoImpegno.AsString = 'Chiamata')
                 then begin
                   GoogleTasks_CreateOrOpenTask(DM1.GoogleTasks_CreazioneAutomaticaDaChiamataInvisibile);
                 end;
                 // ======================================================
                 // ======================================================
                 // GOOGLE CALENDAR
                 // ------------------------------------------------------
                 // Crea o aggiorna l'evento su google calendar
                 if  DM1.GoogleCalendar_Enabled
                 and (QryImpTipoImpegno.AsString = 'Appuntamento')
                 then begin
                   GCal_CreateOrOpenEvent(DM1.GoogleCalendar_CreazioneAutomaticaDaAppuntamentoInvisible);
                 end;
                 // ======================================================
            end else if MR = mrNo then begin
               // Rimette in modalità normale anche il documento collegato
               if PreventiviOrdiniForm <> nil then begin
                 PreventiviOrdiniForm.ModalResultConferma := mrNo;
                 PreventiviOrdiniForm.RxSpeedModifica.Down := False;
                 PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
               end;
               // Se si sta inserendo un nuovo articolo, provvede a annullare l'inserimento
               //   e anche a chiudere la form, se invece sta modificando un articolo già
               //   esistente, annulla solo le modifiche effettuate senza uscire dalla form.
               if QryImp.State = dsInsert then begin
                  QryImp.Cancel;
                  QryImp.CommitUpdates;
                  QryAss.Cancel;
                  QrySogg.Cancel;
                  SourceOP.AutoEdit := False;
                  DM1.DBAzienda.RollbackRetaining;
                  // Refresh delle prescrizioni/raccomandazioni
                  RefreshQueryElencoPrescrizioni;
                  // Chiude
                  DM1.ChiudiAttendere;
                  Close;
                  Exit;
               end else begin
                  QryImp.Cancel;
                  QryImp.CommitUpdates;
                  QryAss.Cancel;
                  QrySogg.Cancel;
                  SourceOP.AutoEdit := False;
                  DM1.DBAzienda.RollbackRetaining;
                  // Refresh delle prescrizioni/raccomandazioni
                  RefreshQueryElencoPrescrizioni;
                  // Se aperta chiude e riapre la query che contiene i dati dell'impianto a cui
                  //  questo impegno è associato. In questo modo se l'ID dell'impegno è cambiato oppure
                  //  se si stà confermando un impegno nuovo, QryAss contiene i dati dell'impianto correttamente.
                  OpenQryAss;
                  OpenQrySogg;
                  // Risistema il layout perchè potrebbero essere cambiato alcuni dati
                  CaricaLayoutDocumento;
               end;
            end else begin
                 RxSpeedModifica.Down := True;
                 if  (PreventiviOrdiniForm <> nil) then PreventiviOrdiniForm.RxSpeedModifica.Down := True;
                 DM1.ChiudiAttendere;
                 Exit;
            end;
            // Rimette a posto pulsanti e campi
            EnableDisableToolsBtn;
            SBSoggetto.Enabled                 := False;
            SBRespImp.Enabled                  := False;
            SBProprietario.Enabled             := False;
            SBOccupante.Enabled                := False;
            SBInstallatore.Enabled             := False;
            SBSoggImpianto.Enabled             := False;
            sbContrattoRinnova.Enabled         := False;
            BitBtnDestinazioneMerci.Enabled    := False;
            BitBtnPratica1.Enabled             := False;
            BitBtnPratica1_2.Enabled           := False;
            BitBtnSelezioneStato.Enabled       := False;
            sbOpenTask1.Enabled                := True and (QryImpTIPOIMPEGNO.AsString = 'Chiamata');
            sbOpenTask2.Enabled                := True and (QryImpTIPOIMPEGNO.AsString = 'Chiamata');
            DbeAzioneMagazzino.Enabled         := False;
            DbeAzioneCantiere.Enabled          := False;
            btvAll.PopupMenu                   := MenuNuovoAllegato;
            cbSelezionaAppTutti.Enabled        := False;
            DM1.ColoraTuttiCampi(ImpegnoForm, COLOR_NORMALE);
         except
            on E: Exception do begin
                 // Chiude l'attesa
                 DM1.ChiudiAttendere;
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 RxSpeedModifica.Down := True;
                 // Riabilita la modifica dei campi
                 QryImp.Edit;
                 QryAss.Edit;
                 if (QrySogg.State = dsBrowse) then
                   QrySogg.Edit;
            end;
         end;
       finally
         // Chiude l'attesa
         DM1.ChiudiAttendere;
       end;
     end;
end;




// Function verifica se, alla conferma dell'intervento, sia necessario richiedere
//  la conferma con la form che esegue l'aggiornamento delle periodicità delle OP
//  e dell'impianto.
function TImpegnoForm.CheckIfConfermaConAggiornamentoOP: Boolean;
var
  OPDaAggiornare, CollaudoManutenzione: Boolean;
  i: Integer;
begin
  // Verifica che l'intervento sia marcato come Collaudo o come manutenzione (no guasto)...
  //  NB: Se però non è specificato il check sul GUASTO per sicurezza la esegue ugualmente
  CollaudoManutenzione := (DBETipoIntervento.Items[0].Checked or DBETipoIntervento.Items[1].Checked or (not DBETipoIntervento.Items[2].Checked));
  // Se anche una sola OP è marcata come fatta allora deve visualizzare la form di conferma
  //  completa anche con le OP
  //  NB: Le OP con periodicità = 0 non contano perchè non sono da aggiornare
  OPDaAggiornare := False;
  for i := 0 to btvOP.DataController.RecordCount -1 do
  begin
    if  (DM1.NoNullStringValue(btvOP.DataController,i,btvOPEFFETTUATA.Index) = 'T')
    and (DM1.NoNullIntValue(btvOP.DataController,i,btvOPPERIODICITA.Index) <> 0)
    and (DM1.NoNullIntValue(btvOP.DataController,i,btvOPIDOPPRATICA.Index) <> 0)
    then begin
      OPDaAggiornare := True;
      Break;
    end;
  end;
  // Compone la condizione perchè venga visualizzata la form di conferma completa
  //  di aggiornamento delle OP
  Result := Self.ImpiantoAssegnato and IsUltimoIntervento and (CollaudoManutenzione or OPDaAggiornare);
end;





procedure TImpegnoForm.DistruggiMappa;
begin
  if not Assigned(MapForm) then Exit;
  if  (PageControlPagineDocumento.ActivePage = TabMappa)
  and (DM1.Messaggi('Levante', 'I dati potrebbero essere cambiati!'#13#13'Ricreare la mappa?', '', [mbYes,mbNo], 0, nil) = mrYes)
  then begin
    MapForm.Free;
    MapForm := nil;
    PageControlPagineDocumentoChange(PageControlPagineDocumento);
  end;
end;

procedure TImpegnoForm.AggiornaIdOP;
//var
//  PrecPos: TBookmark;
begin
// NB: Ho eliminato l'uso del bookmark perchè mi dava un errore inc erte condizioni
//      per cui non rimetterlo, va benissimo così
//  PrecPos := QryOP.GetBookmark;
  QryOP.DisableControls;
  try
    // Uso questo flag per disabilitare l'aggiunta o la rimozione
    //  delle OP nei ricambi/manodopera (documentoCollegato) perchè
    //  è giusto così e perchè mi dava anche un errore
    fUpdatingOpFromDoc := True;
    // Si posiziona all'inizio delle OP
    QryOP.First;
    // CIcla per tutte le OP
    while not QryOP.Eof do begin
      // ID
      if (QryOPID.AsInteger = 0) then begin
        if QryOP.State = dsBrowse then QryOP.Edit;
        QryOPID.Value := DM1.Generators_NextGenID('GEN_ID_OPIMPEGNO');
      end;
      // IDIMPEGNO
      if (QryOPIDIMPEGNO.AsInteger = 0) or (QryOPIDIMPEGNO.AsInteger <> QryImpID.AsInteger) then begin
        if QryOP.State = dsBrowse then QryOP.Edit;
        QryOPIDIMPEGNO.Value := QryImpID.AsInteger;
      end;
      // QryOPIDPRATICA
      if (QryOPIDPRATICA.AsInteger = 0) or (QryOPIDPRATICA.AsInteger <> QryImpIDPRATICA.AsInteger) then begin
        if QryOP.State = dsBrowse then QryOP.Edit;
        QryOPIDPRATICA.Value := QryImpIDPRATICA.AsInteger;
      end;
      // Se necessario esegue il Post
      if QryOP.State = dsEdit then QryOP.Post;
      // Avanti il prossimo
      QryOP.Next;
    end;
  finally
    // Uso questo flag per disabilitare l'aggiunta o la rimozione
    //  delle OP nei ricambi/manodopera (documentoCollegato) perchè
    //  è giusto così e perchè mi dava anche un errore
    fUpdatingOpFromDoc := False;
    // Pulizie finali
// NB: Ho eliminato l'uso del bookmark perchè mi dava un errore inc erte condizioni
//      per cui non rimetterlo, va benissimo così
//    QryOP.GotoBookmark(PrecPos);
//    QryOP.FreeBookmark(PrecPos);
    QryOP.EnableControls;
  end;
end;


procedure TImpegnoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Verifica che non ci sia una transazione attiva
   // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
   DM1.CheckForAlreadyInTransaction;

   // Se il puntatore PreventiviOrdiniForm non è nullo e la sua variabile DistintaBAse = True
   // Significa che si tratta della distintabase dll'articolo attuale e quindi la distrugge
   if (PreventiviOrdiniForm <> nil) and PreventiviOrdiniForm.IsImpegno then
     PreventiviOrdiniForm.Close;

   // Solo se siamo in modalità assistenza mobile
   if MainForm.ModoAssistenzeRDP then
   begin
     AssistenzeMobileMainForm.MainPageControl.ActivePage := AssistenzeMobileMainForm.TabImpegni;
   end
   else
   begin
     // Rende invisibile la LabelTipoDocumento e il relativo pulsante
     // e ripristina la IconaDocTipo precedente
     //  Prima ovviamente sblocca l'IconaDocTipo
     MainForm.BloccaIconaDocTipo(False, Name);
     MainForm.RipristinaIconaDocTipo;

     // Se è visibile l'agenda laterale la aggiorna
     if Self.AgendaRefreshOnClose and Assigned(ClientiForm.AgendaForm) and (ClientiForm.AgendaForm.Splitter.State = ssOpened)
       then ClientiForm.AgendaForm.EseguiQueryAgenda;
     // Se nella pagine principale c'è la pagina dell'agenda selezionata
     //  esegue il refresh dell'agenda stessa
     if Self.AgendaRefreshOnClose and (ClientiForm.PageControl2.ActivePage = ClientiForm.TabAgenda)
       then ClientiForm.RxSpeedButtonTrovaClick(MainForm.RxSpeedButtonTrova);
   end;
end;

procedure TImpegnoForm.FormCreate(Sender: TObject);
begin
  // Disabilita l'event handler OnResize perchè in alcuni casi (ModoManutenzioniRDP) si creavano dei
  //  problemi di posizionamento e dimensionamento dei controlli della form dovuti al settaggio del parent
  //  della form.
  OnResize := nil;
  // Inizializzazione
  fCalcoloInCorso := False;
  // Altrimenti a volte si scollega
  dbeStrCertImageCombo.Properties.Images := DM2.StrCertifiedPanelImages;
  // Flag che indica se simamo attualmente in fase di modifica di una OP da parte
  //  di un rigo del documento collegato, nel qual caso fa in modo che non si inneschi
  //  un ciclo infinito.
  fUpdatingOpFromDoc := False;
  // Inizializzazione
  fCreandoDocumentoCollegato := False;
  // IMposta i settaggi di visualizzazione della form
  MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
  // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
  Caption := MainForm.NomeApplicazione + ' - (Impegno)';
  // Colore normale (non modifica) nei campi
  DM1.ColoraTuttiCampi(ImpegnoForm, COLOR_NORMALE);
  // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
  // IMposta la posizione della client area e i relativi margini
//   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
//   ClientArea.ParentColor := True;
  // Carica l'icona del tipo documento visualizzato
  MainForm.SalvaIconaDocTipo;
  MainForm.CaricaIconaDocTipo(Self.Name);
  // Blocca l'aggiornamento dell'IconaDocTipo
  MainForm.BloccaIconaDocTipo(True, Name);
  // Chiude i pannelli dei dati del destinatario e della destinazione merce
  PanelDestinatario.Height := INTESTATARIO_CLOSE;
  PanelLuogoDestinazione.Height := INTESTATARIO_CLOSE;
  // Carica i titoli delle etichette
  CaricaTitoli;
  // Altre inizializzazioni
  fConfermaSenzaConferma := False;
  // Si posiziona al primo Tab
  TabControlPagineDocumento.TabIndex := DOCTABIDX_APPUNTAMENTO;
  TabControlPagineDocumentoChange(TabControlPagineDocumento);
  // Imposta le dimensioni dei pannelli delle note
  ImpostaDimensioniPannelliNote;
  // Imposta la imagelist per il combo dello stato dell'evento
  Self.LoadSchedulerEventStateComboBoxProperties(dbeState);
  Self.LoadSchedulerLabelColorComboBoxProperties(dbeLabelColor);
end;




procedure TImpegnoForm.RefreshQueryElencoPrescrizioni;
begin
  // Se la query è attiva
  if QryPresc.Active then begin
    QryPresc.Close;
    QryPresc.Open;
    Exit;
  end;
  // Se invece non è attiva
  ApriQueryElencoPrescrizioni;
end;

procedure TImpegnoForm.ApriQueryElencoPrescrizioni;
begin
  // Prima chiude la query se è già aperta
  if QryPresc.Active then QryPresc.Close;
  // IMposta ed apre la query che contiene l'elenco degli ultimi 3 interventi effettuato
  //  sullo stesso impianto
  if not QryPresc.Prepared then QryPresc.Prepare;
  // Se il documento da parte di una pratica (impianto) imposta i parametri in modo che trovi tutti
  //  gli interventi realtivi allo stesso impianto anc e se di soggetti diversi (magari è cambiato il proprietario dell'impianto).
  if (not QryImpPRATICA.IsNull) and (QryImpPRATICA.AsInteger <> 0) then begin
    QryPresc.Params.ParamByName('P_CLIENTE').AsInteger    := 0;
    QryPresc.Params.ParamByName('P_PRATICA').AsInteger    := QryImpPRATICA.Value;
    QryPresc.Params.ParamByName('P_DATAPRATICA').AsDate   := QryImpDATAPRATICA1.Value;
  // Se invece il documento ha solo il soggetto cerca tutti gli interventi precedenti relativi al solo soggetto
  //  senza ovviamente considerare l'impianto in quanto non c'è.
  end else if ((QryImpPRATICA.IsNull) or (QryImpPRATICA.AsInteger = 0)) and ((not QryImpCLIENTE.IsNull) and (QryImpCLIENTE.AsInteger <> 0)) then begin
    QryPresc.Params.ParamByName('P_CLIENTE').AsInteger    := QryImpCLIENTE.Value;
    QryPresc.Params.ParamByName('P_PRATICA').AsInteger    := -999999;
    QryPresc.Params.ParamByName('P_DATAPRATICA').AsDate   := QryImpDATAPRATICA1.Value;
  // Se invece il documento non ha ne l'impianto ne il soggetto fa in modo che non trovi niente
  end else begin
    QryPresc.Params.ParamByName('P_CLIENTE').AsInteger    := -999999;
    QryPresc.Params.ParamByName('P_PRATICA').AsInteger    := -999999;
    QryPresc.Params.ParamByName('P_DATAPRATICA').AsDate   := StrToDate('01/01/1900');
  end;
  // Gli interventi dorvanno ovviamente essere precedenti ad oggi
  QryPresc.Params.ParamByName('P_DATAORADOCATTUALE').AsDateTime := Now;
  // Apre la query
  QryPresc.Open;
end;



procedure TImpegnoForm.ApriQueryApparecchiPratica;
var
  StrMasterID, StrID: String;
begin
  // Prima chiude la query se è già aperta
  if QryPratApp.Active then QryPratApp.Close;
  // Continua solo se il documento fa parte di una pratica
  if QryImpIDPRATICA.IsNull or (QryImpIDPRATICA.AsInteger = 0) then
    Exit;
  // Per comodità carica il MASTER_ID corrente su una stringa
  StrMasterID := IntToStr(CurrentMASTER_ID);
  StrID := IntToStr(CurrentID);
  // Visto che stiamo inserendo un nuovo appuntamento questo (l'appuntamento)
  //  non è ancora nella tabella degli impegni finchè non sarà confermato
  //  e quindi la StoredProcedure che modifico nella linea qui sotto darebbe un errore.
  //  Per evitarlo la modifico mettendo il parametro MASTER_ID fisso a quello aasegnato
  //  all'appuntamento ma non ancora confermato.
  QryPratApp.EditSQL.Clear;
  QryPratApp.EditSQL.Add('EXECUTE PROCEDURE IMPAPPSEL_SETAPPSEL (' + StrMasterID + ', :ID, :SELECTED)');
  // Per lo stesso di cui sopra reimposta da zero la query con il MASTER_ID da codice
  QryPratApp.SQL.Clear;
  QryPratApp.SQL.Add('SELECT PA.ID, CAST(' + StrMasterID + ' AS INTEGER) AS MASTER_ID,');
  QryPratApp.SQL.Add(' PA.COSTRUTTORE, PA.MODELLO, PA.MATRICOLA, PA.UBICAZIONE, PA.TIPOAPPARECCHIO,');
  QryPratApp.SQL.Add(' PA.ANNOCOSTRUZIONE, PA.DATAINSTALLAZIONE, PA.DATACOLLAUDO, PA.IDAPPABBINATO, PA.GARANZIA_SCADENZA, PA.GARANZIA_NOTE,');
  QryPratApp.SQL.Add(' PA.POTENZATERMICA, PA.POTENZATERMICA2, PA.TIPOCAMERA, PA.COMBUSTIBILE, PA.COMBUSTIBILEALTRO, PA.GARANZIA_MESI, PA.GARANZIA_MESI_ESTENSIONE,');
  QryPratApp.SQL.Add(' PA.DISMESSO, PA.DISMESSO_DATA, PA.DISMESSO_NOTE, PA.VOLTAGGIOELETTRICO, PA.POTENZAELETTRICA, PA.PORTATA, PA.PREVALENZA,');
  QryPratApp.SQL.Add(' PA.REFRIGERANTE, PA.CARICA, PA.POTENZAFRIGORIFERA,');
  QryPratApp.SQL.Add(' (SELECT OUTVAR FROM IMPAPPSEL_GETSELECTED (' + StrMasterID + ', PA.ID)) AS SELECTED');
  QryPratApp.SQL.Add('FROM PRATAPPARECCHI PA');
  QryPratApp.SQL.Add('WHERE PA.IDPRATICA = :P_IDPRATICA');
  // NB: Solo se siamo in modifica di un documento esistente: fa in modo che non si vedano gli eventuali apparecchi dismessi
  //       successivamente all'intervento/appuntaemento corrente, per fare questo in pratica carica solo gli apparecchi per i
  //       quali esistono OP nell'impegno stesso.
  // NB: Se invece siamo in creazione di un nuovo impegno allora carica solo gli apparecchi NON dismessi (ovviamente essendo in
  //      creazione di un nuovo impegno non ci sono ancora, a questo punto,   alcuna OP quindi non posso basarmi su di esse
  //      come faccio in caso di apertura di un impegno già esistente.
   case Tag of
     1: QryPratApp.SQL.Add('AND EXISTS (SELECT OPI.ID FROM OPIMPEGNO OPI WHERE OPI.IDIMPEGNO = ' + StrID + ' AND OPI.IDAPPARECCHIOPRAT = PA.ID)');
     2: QryPratApp.SQL.Add('AND COALESCE(PA.DISMESSO,''F'') <> ''T''');
   end;
  // Imposta ed apre la query
  if not QryPratApp.Prepared then QryPratApp.Prepare;
  QryPratApp.ParamByName('P_IDPRATICA').AsInteger := QryImpIDPRATICA.AsInteger;
  QryPratApp.Open;
  // Imposta il filtraggio delle OP e degli interventi precedenti
  //  in base agli apparecchio selezionati.
  SetDataControllerFilterByApp(btvOP.DataController, btvOPIDAPPARECCHIOPRAT);
  SetDataControllerFilterByApp(btvPrecInt.DataController, btvPrecIntIDAPPARECCHIOPRAT);
end;


procedure TImpegnoForm.ApriQueryElencoUltimiInterventi;
begin
  // Prima chiude la query se è già aperta
  if QryIntPrec.Active then
    Exit;
  // IMposta ed apre la query che contiene l'elenco degli ultimi 3 interventi effettuato
  //  sullo stesso impianto
  if not QryIntPrec.Prepared then QryIntPrec.Prepare;
  // Se il documento da parte di una pratica (impianto) imposta i parametri in modo che trovi tutti
  //  gli interventi realtivi allo stesso impianto anc e se di soggetti diversi (magari è cambiato il proprietario dell'impianto).
  if (not QryImpPRATICA.IsNull) and (QryImpPRATICA.AsInteger <> 0) then begin
    QryIntPrec.Params.ParamByName('P_CLIENTE').AsInteger    := 0;
    QryIntPrec.Params.ParamByName('P_PRATICA').AsInteger    := QryImpPRATICA.Value;
    QryIntPrec.Params.ParamByName('P_DATAPRATICA').AsDate   := QryImpDATAPRATICA1.Value;
  // Se invece il documento ha solo il soggetto cerca tutti gli interventi precedenti relativi al solo soggetto
  //  senza ovviamente considerare l'impianto in quanto non c'è.
  end else if ((QryImpPRATICA.IsNull) or (QryImpPRATICA.AsInteger = 0)) and ((not QryImpCLIENTE.IsNull) and (QryImpCLIENTE.AsInteger <> 0)) then begin
    QryIntPrec.Params.ParamByName('P_CLIENTE').AsInteger    := QryImpCLIENTE.Value;
    QryIntPrec.Params.ParamByName('P_PRATICA').AsInteger    := -999999;
    QryIntPrec.Params.ParamByName('P_DATAPRATICA').AsDate   := QryImpDATAPRATICA1.Value;
  // Se invece il documento non ha ne l'impianto ne il soggetto fa in modo che non trovi niente
  end else begin
    QryIntPrec.Params.ParamByName('P_CLIENTE').AsInteger    := -999999;
    QryIntPrec.Params.ParamByName('P_PRATICA').AsInteger    := -999999;
    QryIntPrec.Params.ParamByName('P_DATAPRATICA').AsDate   := StrToDate('01/01/1900');
  end;
  // Gli interventi dorvanno ovviamente essere precedenti ad oggi
  QryIntPrec.Params.ParamByName('P_DATAORADOCATTUALE').AsDateTime := Now;
  // Apre la query
  QryIntPrec.Open;
end;
{
procedure TImpegnoForm.ApriQueryElencoUltimiInterventi;
begin
  // Prima chiude la query se è già aperta
  if QryIntPrec.Active then QryIntPrec.Close;
  QryIntPrec.SQL.Clear;
  // Se il documento da parte di una pratica (impianto) imposta i parametri in modo che trovi tutti
  //  gli interventi realtivi allo stesso impianto anc e se di soggetti diversi (magari è cambiato il proprietario dell'impianto).
  if (not QryImpPRATICA.IsNull) and (QryImpPRATICA.AsInteger <> 0) then begin

    // Imposta la query
    QryIntPrec.SQL.Add('SELECT T.RESOURCENAME, I.*');
    QryIntPrec.SQL.Add('FROM IMPEGNI I');
    QryIntPrec.SQL.Add('LEFT JOIN TECNICI T ON (T.RESOURCEID = I.RESOURCEID)');
    QryIntPrec.SQL.Add('WHERE I.PRATICA = :P_PRATICA');
    QryIntPrec.SQL.Add('  AND I.DATAPRATICA1 = :P_DATAPRATICA');
    QryIntPrec.SQL.Add('  AND I.DATAORAINTERVENTO < :P_DATAORADOCATTUALE');
    QryIntPrec.SQL.Add('  AND I.TIPOIMPEGNO = ''Intervento''');
    QryIntPrec.SQL.Add('ORDER BY DATAORAINTERVENTO DESCESC');
    // Imposta i parametri
    QryIntPrec.Prepare;
    QryIntPrec.Params.ParamByName('P_PRATICA').AsInteger    := QryImpPRATICA.Value;
    QryIntPrec.Params.ParamByName('P_DATAPRATICA').AsDate   := QryImpDATAPRATICA1.Value;
    QryIntPrec.Params.ParamByName('P_DATAORADOCATTUALE').AsDateTime := Now;

  // Se invece il documento ha solo il soggetto cerca tutti gli interventi precedenti relativi al solo soggetto
  //  senza ovviamente considerare l'impianto in quanto non c'è.
  end else if ((QryImpPRATICA.IsNull) or (QryImpPRATICA.AsInteger = 0)) and ((not QryImpCLIENTE.IsNull) and (QryImpCLIENTE.AsInteger <> 0)) then begin

    // Imposta la query
    QryIntPrec.SQL.Add('SELECT T.RESOURCENAME, I.*');
    QryIntPrec.SQL.Add('FROM IMPEGNI I');
    QryIntPrec.SQL.Add('LEFT JOIN TECNICI T ON (T.RESOURCEID = I.RESOURCEID)');
    QryIntPrec.SQL.Add('WHERE I.CLIENTE = :P_CLIENTE');
    QryIntPrec.SQL.Add('  AND (I.PRATICA = 0 OR I.PRATICA IS NULL)');
    QryIntPrec.SQL.Add('  AND I.DATAORAINTERVENTO < :P_DATAORADOCATTUALE');
    QryIntPrec.SQL.Add('  AND I.TIPOIMPEGNO = ''Intervento''');
    QryIntPrec.SQL.Add('ORDER BY DATAORAINTERVENTO DESCESC');
    // Imposta i parametri
    QryIntPrec.Prepare;
    QryIntPrec.Params.ParamByName('P_CLIENTE').AsInteger    := QryImpCLIENTE.Value;
    QryIntPrec.Params.ParamByName('P_DATAORADOCATTUALE').AsDateTime := Now;

  // Se invece il documento non ha ne l'impianto ne il soggetto fa in modo che non trovi niente
  end else begin

    // Imposta la query
    QryIntPrec.SQL.Add('SELECT T.RESOURCENAME, I.*');
    QryIntPrec.SQL.Add('FROM IMPEGNI I');
    QryIntPrec.SQL.Add('LEFT JOIN TECNICI T ON (T.RESOURCEID = I.RESOURCEID)');
    QryIntPrec.SQL.Add('WHERE I.CLIENTE = -999999');
    QryIntPrec.SQL.Add('  AND I.PRATICA = -999999');
    QryIntPrec.SQL.Add('  AND I.DATAORAINTERVENTO < :P_DATAORADOCATTUALE');
    QryIntPrec.SQL.Add('  AND I.TIPOIMPEGNO = ''Intervento''');
    QryIntPrec.SQL.Add('ORDER BY DATAORAINTERVENTO DESCESC');
    // Imposta i parametri
    QryIntPrec.Prepare;
    QryIntPrec.Params.ParamByName('P_DATAORADOCATTUALE').AsDateTime := Now;

  end;
  // Gli interventi dorvanno ovviamente essere precedenti ad oggi
  // Apre la query
  QryIntPrec.Open;
end;
}

// Apre il pannello dei dati dell'intestatario del documento
procedure TImpegnoForm.ApriPannelloIntestatario(P:TPanel);
const
   SPEED = 1;
var
   AltezzaDaAperto: Integer;
begin
   // Ricava l'altezza che il pannello deve avere da aperto, la ricava
   //  dalla costante normalmente ma se nella proprietà Tag del Pannello stesso
   //  c'è un valore <> 0 allora significa che per quel particolare pannello la dimensione
   //  in altezza da aperto deve essere quella.
   AltezzaDaAperto := INTESTATARIO_OPEN;
   if P.Tag <> 0 then AltezzaDaAperto := P.Tag;
   // Se risulta già aperto esce subito
   if P.Height = AltezzaDaAperto then Exit;
   // Effettua l'apertura del pannello
   while P.Height < AltezzaDaAperto do begin
      P.Height := P.Height + 1;
      P.Update;
//      Sleep(SPEED);
   end;
end;

// Apre il pannello dei dati dell'intestatario del documento
procedure TImpegnoForm.ChiudiPannelloIntestatario(P:TPanel);
const
   SPEED = 1;
begin
   // Se risulta già aperto esce subito
   if P.Height = INTESTATARIO_CLOSE then Exit;
   // Effettua l'apertura del pannello
   while P.Height > INTESTATARIO_CLOSE do begin
      P.Height := P.Height - 1;
      P.Update;
//      Sleep(SPEED);
   end;
end;

function TImpegnoForm.TryChiusuraAutomaticaImpegno(const AStampaFoglioLavoro, AStampaRCEE, AAggiornaImpianto, AFattura, AAnteprimeDiStampa: Boolean;
      const ADataFatturazione: TDate): Boolean;
var
  LTipoImpegno: String;
  procedure BuildMsg(AMsg: String);
  var
    LTipoImpegno: String;
  begin
    LTipoImpegno := QryImpTIPOIMPEGNO.AsString;
    AMsg := 'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13 + AMsg + #13#13'----------';
    // Riferimento all'impegno
    if LTipoImpegno = 'Chiamata' then
      AMsg := AMsg + #13#13 + Format('Chiamata %d del %s', [QryImpID.AsInteger, LeftStr(QryImpDATAORACHIAMATA.AsString, 10)])
    else
    if LTipoImpegno = 'Appuntamento' then
      AMsg := AMsg + #13#13 + Format('Appuntamento %d del %s', [QryImpID.AsInteger, LeftStr(QryImpSTART.AsString, 10)])
    else
      AMsg := AMsg + #13#13 + Format('Intervento %d del %s', [QryImpID.AsInteger, LeftStr(QryImpDATAORAINTERVENTO.AsString, 10)]);
    // Riferimento all'impianto
    AMsg := AMsg + #13#13 + Format('%s (%d del %s)', [QryAssDESCRIZIONE.AsString, QryAssPRATICA.AsInteger, QryAssDATAPRATICA1.AsString]);
    // Riferimento responsabile dell'impiango
    AMsg := AMsg + #13#13 + Format('%s (%d)', [QryAssRAGSOCRESPIMP.AsString, QryAssCODICERESPIMP.AsInteger]);
    // Visualizza il messaggio
    DM1.Messaggi('Chiusura automatica ' + LTipoImpegno, AMsg, '', [mbOK], 0, nil);
  end;
begin
  Result := True;
  // Prima verifica se per questo impianto e per questo impegno è abilitata la chiusura automatica, altrimenti esce
  if (QryAssPRM_AUTOCLOSE_ENABLED.AsString <> 'T') then
  begin
    BuildMsg('Chiusura automatica non abilitata per questo impianto.');
    Exit(False);
  end;
  // Prima verifica se per questo impianto è abilitata la chiusura solo per le manutenzioni e se questo intervento è di manutenzione
  if (QryAssPRM_AUTOCLOSE_SOLOMANUT.AsString = 'T') and not QryImpTIPOINTERVENTO.AsString.Contains('12:Manutenzione') then
  begin
    BuildMsg('Chiusura automatica solo per interventi di manutenzione su questo impianto.');
    Exit(False);
  end;
  // Prosegue con la chiusura dell'impegno
  FChiusuraAutomatica := True;
  try
    LTipoImpegno := QryImpTIPOIMPEGNO.AsString;
    // Foglio di lavoro
    if AStampaFoglioLavoro then
      StampaFoglioDiLavoro(AAnteprimeDiStampa, True, DM1.TableProgressiviFL_COPIE.AsInteger);
    // Allegati RCEE
    if AStampaRCEE then
      StampaTuttiGliAllegatiFG(AAnteprimeDiStampa);
    // Trasforma in intervento (se non lo è già)
    if (LTipoImpegno <> 'Intervento') then
    begin
      SBCreaInterventoClick(SBCreaIntervento);
      if LTipoImpegno = 'Chiamata' then
        QryImpDATAORAINTERVENTO.Value := ADataFatturazione;
      MarcaOpDaFareComeFatte;
      // Conferma l'intervento
      RxSpeedModifica.Down := False;
      RxSpeedModificaClick(RxSpeedModifica);
    end;
    // Esporta in bacheca per la successiva fatturazione (se abilitato)
    if AFattura then
      DM1.EsportaDocFisc(QryImpTIPOIMPEGNO.AsString, QryImpREGISTRO.AsString, QryImpID.AsInteger, QryImpDATAORAINTERVENTO.AsDateTime);
    // Chiude l'impegno
    RxSpeedButtonUscitaClick(RxSpeedButtonUscita);
  finally
    FChiusuraAutomatica := False;
  end;
end;

procedure TImpegnoForm.FormShow(Sender: TObject);
begin
      DM1.FocusRefresh;

      // Carica alcuni parametri di visualizzazione
      //  NB: C'è anche alla fine o quasi, lasciarli tutti e due
      //  NB: Spostato un pò più in basso perchè altrimenti ancora non c'era aperta ancora
      //       nessuna query.
//      CaricaLayoutDocumento;

      // In base al valore di 'Tag' apre la form in diverse modalità...
      case Tag of
         // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
         1: begin
            // IMposta la query per richiamare il record da modificare
            QryImp.Close;
            QryImp.SQL.Clear;
            QryImp.SQL.Add('SELECT * FROM IMPEGNI WHERE ID = ' + IntToStr(CurrentID));
            QryImp.Open;
            // Se trova il record procede, altrimenti visualizza un errore ed esce dalla form
            if QryImp.Eof then begin
               MessageDlg('Impegno non trovato!', mtError, [mbOK], 0);
               ImpegnoForm.Close;
               Exit;
            end;
            // Imposta il nuovo MASTER_ID per il nuovo impegno che si sta creando
            CurrentMASTER_ID := QryImpMASTER_ID.Value;
            // Apre la query con i dati degli apparecchi da usare nelle OP
            ApriQueryApparecchiPratica;
            // Apre la queri delle operazioni pianificate
            if (not QryOP.Active) then
            begin
              QryOP.Prepare;
              QryOP.Params.ParamByName('P_IDIMPEGNO').AsInteger := QryImpID.AsInteger;
              QryOP.Open;
            end;
         end;
         // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
         2: begin
            // Alla creazione il pulsante di conversione in INtervento deve essere disabilitato
            //  altrimenti ci sono problemi.
            SBCreaIntervento.Enabled  := False;
            sbCreaIntervento1.Enabled := False;
            sbCreaIntervento2.Enabled := False;
            // Se non è aperta, apre la query vuota in modo da poter inserire un nuovo record
            if not QryImp.Active then begin
               QryImp.Close;
               QryImp.SQL.Clear;
               QryImp.SQL.Add('SELECT * FROM IMPEGNI WHERE ID = -999 AND PARENTID = -999');
               QryImp.Open;
            end;

            // Imposta il nuovo MASTER_ID per il nuovo impegno che si sta creando
            CurrentMASTER_ID := DM1.Generators_NextGenID('GEN_ID_IMPEGNI');

            // Apre la query con i dati degli apparecchi da usare nelle OP
            ApriQueryApparecchiPratica;
            // Apre la queri delle operazioni pianificate vuota
            if (not QryOP.Active) then
            begin
              QryOP.Prepare;
              QryOP.Params.ParamByName('P_IDIMPEGNO').AsInteger := 0;
              QryOP.Open;
            end;

            //  Pone la form direttamente in modalità di modifica
            RxSpeedModifica.Down := True;
            RxSpeedModificaClick(Self);
            // Agiungle il nuovo record
            QryImp.Append;
            // IMpostazione valori predefiniti nei campi
            QryImpMASTER_ID.Value            := CurrentMASTER_ID;
            QryImpParentID.Value             := 0;
            QryImpTipoIMpegno.Value          := TipoImpegno;
            QryImpREGISTRO.Value             := DM1.RegistroDefault;
            QryImpDataOraChiamata.Value      := now;
            QryImpCliente.Value              := StrToInt(CodiceCliente);
            if DataPratica <> ''   then QryImpDataPratica1.Value  := StrToDate(DataPratica);
            if CodicePratica <> '' then QryImpPratica.Value       := StrToInt(CodicePratica);

            // Se siamo in modalità di modifica e il TIPOINTERVENTO è nullo gli assegna
            //  il valore di default specificato nei parametri.
            if  (QryImp.State <> dsBrowse)
            and ((QryImpTIPOINTERVENTO.IsNull)or(Trim(QryImpTIPOINTERVENTO.AsString)=''))
            and (fTipoInterventoDefault <> '')
            then
              QryImpTIPOINTERVENTO.Value := fTipoInterventoDefault;

            //  Pone la form direttamente in modalità di modifica
//            RxSpeedModifica.Down := True;
//            RxSpeedModificaClick(Self);
         end;
      end;

   // Carica alcuni parametri di visualizzazione
   //  NB: C'è anche alla fine o quasi, lasciarli tutti e due
   //  NB: Prima era un pochino più in alto (ho lasciato li un ricordo)
   CaricaLayoutDocumento;

   // Imposta i campi che contengono le eventuali differenze di tempo tra l'inizio e la fine dell'appuntamento
   //  e/o dell'intervento per poi mantenere la stessa differenza se l'utente cambia l'inizio dell'intervento
   fDifferenzaAppuntamento  := (QryImpFINISH.Value - QryImpSTART.Value);
   fDifferenzaIntervento    := (QryImpDATAORAFINEINTERVENTO.Value - QryImpDATAORAINTERVENTO.Value);

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if ((QryImpTIPOIMPEGNO.AsString = 'Generico')  and (DM1.ModCtrl(MOD_AGENDA) > 1))
   or ((QryImpTIPOIMPEGNO.AsString <> 'Generico') and (DM1.ModCtrl(MOD_CONTATTI) > 1))
   then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Carica la descrizione delle pratiche
   if (not QryImpPRATICA.IsNull)  and (not QryImpDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QryImpPRATICA.Value,  QryImpDATAPRATICA1.Value, EditDescrizionePratica1);

   // Apre anche la query con i dati aggiuntivi dell'impianto
   OpenQryAss;
   OpenQrySogg;

   // Apre la Query che contiene l'elenco dei tecnici per la selezione del
   //  tecnico.
   // Compone la query delle risorse
   // Se è stata specificata una restrizione nel'accesso alle risorse
   //  dell'agenda per utente la applica
   QryTecnici.SQL.Clear;
   QryTecnici.SQL.Add('SELECT * FROM TECNICI');
   QryTecnici.SQL.Add('WHERE ABILITATO <> ''F''');
   if DM1.LimitazioniRisorseAgendaPerUtente <> '' then begin
     QryTecnici.SQL.Add('AND ' + DM1.LimitazioniRisorseAgendaPerUtente);
   end;
   QryTecnici.SQL.Add('ORDER BY RESOURCENAME');
   QryTecnici.Open;

   // Carica alcuni parametri di visualizzazione
   //  NB: C'è anche all'inizio lasciarli tutti e due
   CaricaLayoutDocumento;

   // Apre la queru che contiene l'elenco degli interventi precedenti per
   //  stesso impianto.
   // NB: SPOSTATO NELL'ONCHANGE DEL PAGECONTROLPAGINEDOCUMENTO PER MOTIVI DI PRESTAZIONI
//   ApriQueryElencoUltimiInterventi;

   // Solo se il tab degli allegati è visibile a enabled
   if TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Enabled and TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Visible then
   begin
     // Apre la queru che contiene l'elenco delle raccomandazioni/prescrizioni
     //  dello stesso impianto.
     RefreshQueryElencoPrescrizioni;
     // Apre la query degli allegati F e G
     AllegatiFG_RefreshQuery;
   end;

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;

   // Pone il focus
   if RxSpeedModifica.Down then begin
     if TipoImpegno = 'Generico' then DBEMotivoImpegno.SetFocus
     else if TipoImpegno = 'Intervento' then DBEDataIntervento.SetFocus
     else begin
       if PanelChiamata.Visible then DBEMotivoChiamata.SetFocus
       else if PanelAppuntamento.Visible then DBEDataAppuntamento.SetFocus;
     end;
   end;

  // Riabilita l'event handler OnResize perchè in alcuni casi (ModoManutenzioniRDP) si creavano dei
  //  problemi di posizionamento e dimensionamento dei controlli della form dovuti al settaggio del parent
  //  della form.
  OnResize := FormResize;
  FormResize(Self);
end;


{
procedure TImpegnoForm.ApriDocumentoCollegato;
var
  Q:TIB_Cursor;
begin

  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che cerca se c'è già un record relativo a questo distributore e questa filiale
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT COUNT(*) AS QUANTI FROM PRVORDCL WHERE');
    Q.SQL.Add(' TIPODOCUMENTO = ''' + 'Intervento' + '''');
    Q.SQL.Add(' AND REGISTRO = ''' + '-' + '''');
    Q.SQL.Add(' AND NUMORDPREV = ' + QryImpID.AsString);
    Q.SQL.Add(' AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy ', DateOf(QryImpDATAORACHIAMATA.AsDateTime)) + '''');
    Q.Open;

    // Crea il documento collegato all'impegno
    Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
    PreventiviOrdiniForm.Parent    := MainForm;
    PreventiviOrdiniForm.Tag       := MODE_OPEN;
    // Sostituisce il gestore dell'evento
    PreventiviOrdiniForm.RxSpeedModifica.OnClick := PreventiviordiniForm.ImpegnoModificaClick;

    // Se il documento associato esiste già imposta i dati per l'apertura
    PreventiviOrdiniForm.TipoDoc   := 'Intervento';
    if Q.Fields[0].AsInteger > 0 then begin
      PreventiviOrdiniForm.Registro  := '-';
      PreventiviOrdiniForm.NumeroDoc := QryImpID.Value;
      PreventiviOrdiniForm.DataDoc   := QryImpDATAORACHIAMATA.Value;
    end;

    // Richiama l'OnShow per aprire i Dataset
    PreventiviOrdiniForm.FormShow(PreventiviOrdiniForm);
  finally
    Q.Close;
    Q.Free;
  end;
end;
}
procedure TImpegnoForm.ApriDocumentoCollegato;
var
  Q:TIB_Cursor;
  PrecTipoDocIsNull, PrecNumDocIsNull, PrecRegDocIsNull, PrecDataDocIsNull, PrecStateIsBrowse: Boolean;
  PrecTipoDoc:String;
  PrecNumDoc:Integer;
  PrecRegDoc:String;
  PrecDataDoc:TDateTime;
begin
  // Salva i dati identificativi del documento prima della creazione del documento collegato
  PrecTipoDocIsNull := QryImpTIPOIMPEGNO.IsNull;
  PrecNumDocIsNull  := QryImpID.IsNull;
  PrecRegDocIsNull  := QryImpREGISTRO.IsNull;
  PrecDataDocIsNull := QryImpDATAORAINTERVENTO.IsNull;
  PrecTipoDoc       := QryImpTIPOIMPEGNO.AsString;
  PrecNumDoc        := QryImpID.AsInteger;
  PrecRegDoc        := QryImpREGISTRO.AsString;
  PrecDataDoc       := QryImpDATAORAINTERVENTO.AsDateTime;
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  DM1.DisabilitaSetAgenti := True;
  try
    // Imposta la query che cerca se il documento esiste già
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT COUNT(*) AS QUANTI FROM PRVORDCL WHERE');
    Q.SQL.Add(' TIPODOCUMENTO = ''' + 'Intervento' + '''');
    Q.SQL.Add(' AND REGISTRO = ''' + QryImpREGISTRO.AsString + '''');
    if not QryImpID.IsNull then
      Q.SQL.Add(' AND NUMORDPREV = ' + QryImpID.AsString)
    else
      Q.SQL.Add(' AND NUMORDPREV = -999');
    Q.SQL.Add(' AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DateOf(QryImpDATAORAINTERVENTO.AsDateTime)) + '''');
    Q.Open;

    // Se il documento esiste già, lo apre
    if Q.Fields[0].AsInteger > 0 then
    begin
      Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
      MainForm.SetParentComponent(PreventiviOrdiniForm);
      PreventiviOrdiniForm.Tag       := MODE_OPEN;
      PreventiviOrdiniForm.TipoDoc   := 'Intervento';
      PreventiviOrdiniForm.Registro  := QryImpREGISTRO.AsString;
      PreventiviOrdiniForm.NumeroDoc := QryImpID.Value;
      PreventiviOrdiniForm.DataDoc   := QryImpDATAORAINTERVENTO.Value;
    // Se invece il documento non esiste già lo crea nuovo
    end
    else
    begin
      // Imposta il flag che indica se siamo nella fase di creazione del documento collegato (Intervento)
      fCreandoDocumentoCollegato := True;
      try
        // Creazione documento collegato
        DM1.NuovoDocFisc('Intervento', QryImpREGISTRO.AsString, QryImpCLIENTE.AsInteger, QryImpPRATICA.AsInteger, QryImpDATAPRATICA1.AsString, 1, 0, False, False);
        // Ripristina i dati originari di identificazione dell'impegno perchè dopo la creazione
        //  del documento colegato potrebbero essere cambiati
        PrecStateIsBrowse := (QryImp.State = dsBrowse);
        if PrecStateIsBrowse then QryImp.Edit;
        try
          if PrecTipoDocIsNull then begin
            QryImpTIPOIMPEGNO.Clear;
          end else begin
            QryImpTIPOIMPEGNO.Value := PrecTipoDoc;
          end;
          if PrecNumDocIsNull then begin
            QryImpID.Clear;
          end else begin
            QryImpID.Value := PrecNumDoc;
          end;
          if PrecRegDocIsNull then begin
            QryImpREGISTRO.Clear;
          end else begin
            QryImpREGISTRO.Value := PrecRegDoc;
          end;
          if PrecDataDocIsNull then begin
            QryImpDATAORAINTERVENTO.Clear;
          end else begin
            QryImpDATAORAINTERVENTO.Value := PrecDataDoc;
          end;
          if PrecStateIsBrowse then QryImp.Post;
        except
          if PrecStateIsBrowse then QryImp.Cancel;
          raise;
        end;
      finally
        // Imposta il flag che indica se siamo nella fase di creazione del documento collegato (Intervento)
        fCreandoDocumentoCollegato := False;
      end;
    end;

    // Richiama l'OnShow per aprire i Dataset
    PreventiviOrdiniForm.FormShow(PreventiviOrdiniForm);
    PreventiviOrdiniForm.TipoDocumento.Enabled := Self.TipoDocumento.Enabled;
    // COllega i campi del luogo destinazione merce
    DBERagSocDest.DataSource    := PreventiviOrdiniForm.SourceDocumento;
    DBEIndirizzoDest.DataSource := PreventiviOrdiniForm.SourceDocumento;
    DBENumCivicoDest.DataSource := PreventiviOrdiniForm.SourceDocumento;
    DBECapDest.DataSource       := PreventiviOrdiniForm.SourceDocumento;
    DBECittaDest.DataSource     := PreventiviOrdiniForm.SourceDocumento;
    DBEProvinciaDest.DataSource := PreventiviOrdiniForm.SourceDocumento;
    DBEditStatoDocumento.DataSource := PreventiviOrdiniForm.SourceDocumento;
    dbeRifDoc_TipoDoc.DataBinding.DataSource      := PreventiviOrdiniForm.SourceDocumento;
    dbeRifDoc_NumDoc.DataBinding.DataSource       := PreventiviOrdiniForm.SourceDocumento;
    dbeRifDoc_RegDoc.DataBinding.DataSource       := PreventiviOrdiniForm.SourceDocumento;
    dbeRifDoc_DataDoc.DataBinding.DataSource      := PreventiviOrdiniForm.SourceDocumento;
    dbeRifDoc_CorrispNoPag.DataBinding.DataSource := PreventiviOrdiniForm.SourceDocumento;
    DBERagSocDest.DataField     := PreventiviOrdiniForm.QryDocumentoRAGSOCDESTMERCI.FieldName;
    DBEIndirizzoDest.DataField  := PreventiviOrdiniForm.QryDocumentoINDIRIZZODESTMERCI.FieldName;
    DBENumCivicoDest.DataField  := PreventiviOrdiniForm.QryDocumentoNUMCIVICODESTMERCI.FieldName;
    DBECapDest.DataField        := PreventiviOrdiniForm.QryDocumentoCAPDESTMERCI.FieldName;
    DBECittaDest.DataField      := PreventiviOrdiniForm.QryDocumentoCITTADESTMERCI.FieldName;
    DBEProvinciaDest.DataField  := PreventiviOrdiniForm.QryDocumentoPROVINCIADESTMERCI.FieldName;
    DBEditStatoDocumento.DataField  := PreventiviOrdiniForm.QryDocumentoSTATODESCRIZIONE.FieldName;
    dbeRifDoc_TipoDoc.DataBinding.DataField       := PreventiviOrdiniForm.QryDocumentoRIFDOC_TIPO.FieldName;
    dbeRifDoc_NumDoc.DataBinding.DataField        := PreventiviOrdiniForm.QryDocumentoRIFDOC_NUM.FieldName;
    dbeRifDoc_RegDoc.DataBinding.DataField        := PreventiviOrdiniForm.QryDocumentoRIFDOC_REG.FieldName;
    dbeRifDoc_DataDoc.DataBinding.DataField       := PreventiviOrdiniForm.QryDocumentoRIFDOC_DATA.FieldName;
    dbeRifDoc_CorrispNoPag.DataBinding.DataField  := PreventiviOrdiniForm.QryDocumentoRIFDOC_CORRISPNOPAG.FieldName;
    BitBtnSelezioneStato.onClick    := PreventiviOrdiniForm.BitBtnSelezioneStato.OnClick;
    // Se l'impegno è in modalità di modifica, pone in modifica anche il documento collegato
    if RxSpeedModifica.Down then begin
      PreventiviOrdiniForm.RxSpeedModifica.Down := True;
      PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
    end;
    // Carica i valori delle azione cantiere e magazzino dal documento collegato
    //  sull'impegno e poi imposta i rispettivi gestori di evento
    Self.DbeAzioneMagazzino.Properties.Items := PreventiviOrdiniForm.DbeAzioneMagazzino.Properties.Items;
    Self.DbeAzioneCantiere.Properties.Items := PreventiviOrdiniForm.DbeAzioneCantiere.Properties.Items;
    Self.DbeAzioneMagazzino.Text := PreventiviOrdiniForm.DbeAzioneMagazzino.Text;
    Self.DbeAzioneCantiere.Text := PreventiviOrdiniForm.DbeAzioneCantiere.Text;
    Self.DbeAzioneMagazzino.Properties.OnChange := PreventiviOrdiniForm.DbeAzioneMagazzino.Properties.OnChange;
    Self.DbeAzioneCantiere.Properties.OnChange := PreventiviOrdiniForm.DbeAzioneCantiere.Properties.OnChange;
    // Sostituisce il gestore dell'evento
    PreventiviOrdiniForm.RxSpeedModifica.OnClick := PreventiviordiniForm.ImpegnoModificaClick;
  finally
    DM1.DisabilitaSetAgenti := False;
    Q.Close;
    Q.Free;
  end;
end;


procedure TImpegnoForm.DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
begin
  if RxSpeedModifica.Down
  and (  (Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)  )
  then
    DM2.ClearCantiereDoc(QryImpPRATICA, QryImpDATAPRATICA1, DbeDescrizioneCantiere);
end;

procedure TImpegnoForm.DBEdit1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
   // Controlla se il controllo che ha il form fa parte del pannello dei dati
   //  del destinatario del documento, ed eventualmente espande il relativo pannello.
   if (Sender as TControl).Parent is TPanel then begin
      if ((Sender as TControl).Parent as TPanel).Name = PanelDestinatario.Name
      then ApriPannelloIntestatario(PanelDestinatario)
      else ChiudiPannelloIntestatario(PanelDestinatario);
   end else ChiudiPannelloIntestatario(PanelDestinatario);
   // Controlla se il controllo che ha il form fa parte del pannello dei dati
   //  della destinazione merce del documento, ed eventualmente espande il relativo pannello.
   if (Sender as TControl).Parent is TPanel then begin
      if ((Sender as TControl).Parent as TPanel).Name = PanelLuogoDestinazione.Name
      then ApriPannelloIntestatario(PanelLuogoDestinazione)
      else ChiudiPannelloIntestatario(PanelLuogoDestinazione);
   end else ChiudiPannelloIntestatario(PanelLuogoDestinazione);
end;

procedure TImpegnoForm.DBEdit1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TImpegnoForm.SBEspandiSoggettoClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryImpCliente.Value);
end;

procedure TImpegnoForm.SBSoggettoClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryImpCliente, QryImpPRATICA, QryImpDATAPRATICA1, '');
end;

procedure TImpegnoForm.QryImpCLIENTEChange(Sender: TField);
var
  QryCli: TIB_Cursor;
  LEventLocation: String;
  procedure AddToEventLocation(const AField: TIB_Column; ASeparator: String; var AResult: String);
  var
    LCurrentValue: String;
  begin
    LCurrentValue := Trim(AField.AsString);
    if LCurrentValue <> '' then
    begin
      if AResult = '' then
        ASeparator := '';
      AResult := AResult + ASeparator + LCurrentValue;
    end;
  end;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, PartitaIVA, CodiceFiscale, Telefono, Cellulare,');
    QryCli.SQL.Add('CodiceDestinazMerci, RagSocDestinazMerci, IndirizzoDestinazMerci, NumCivicoDestinazMerci, CittaDestinazMerci, CapDestinazMerci, ProvinciaDestinazMerci');
    QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryImpCliente.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      // Carica i dati del soggetto
      QryImpRagSocCli.Value          := DM2.GetDenominazioneSoggetto(QryCli);
      QryImpIndirizzoCli.Value       := QryCli.FieldByName('Indirizzo').AsString;
      QryImpNumCivicoCli.Value       := QryCli.FieldByName('NumCivico').AsString;
      QryImpCittaCli.Value           := QryCli.FieldByName('Citta').AsString;
      QryImpCAPCli.Value             := QryCli.FieldByName('CAP').AsString;
      QryImpProvinciaCli.Value       := QryCli.FieldByName('Provincia').AsString;
      QryImpPARTITAIVACLI.Value      := QryCli.FieldByName('PartitaIVA').AsString;
      QryImpCODICEFISCALECLI.Value   := QryCli.FieldByName('CodiceFiscale').AsString;
      QryImpTELEFONOCLI.Value        := QryCli.FieldByName('Telefono').AsString;
      QryImpCELLULARECLI.Value       := QryCli.FieldByName('Cellulare').AsString;
      // Carica gli agenti
      DM1.SetAgenti(QryImp, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');

      // ==============================================================
      // Se abilitato copia i dati del soggetto nel luogo appuntamento
      // --------------------------------------------------------------
      LEventLocation := '';

      // Composizione luogo appuntamento con i dati della destinazione merce del cliente
      if fCopiaCapNelLuogoApp then
        AddToEventLocation(QryCli.FieldByName('CapDestinazMerci'), ', ', LEventLocation);
      if fCopiaLocalitaNelLuogoApp then
        AddToEventLocation(QryCli.FieldByName('CittaDestinazMerci'), ', ', LEventLocation);
      if fCopiaProvinciaNelLuogoApp then
        AddToEventLocation(QryCli.FieldByName('ProvinciaDestinazMerci'), ', ', LEventLocation);
      if fCopiaIndirizzoNelLuogoApp then
      begin
        AddToEventLocation(QryCli.FieldByName('IndirizzoDestinazMerci'), ', ', LEventLocation);
        AddToEventLocation(QryCli.FieldByName('NumCivicoDestinazMerci'), ' ', LEventLocation);
      end;

      // Composizione luogo appuntamento con i dati del cliente del cliente
      //  NB: Solo se non c'è una destinazione merce specifica nel soggetto
      if LEventLocation = '' then
      begin
        if fCopiaCapNelLuogoApp then
          AddToEventLocation(QryCli.FieldByName('CAP'), ', ', LEventLocation);
        if fCopiaLocalitaNelLuogoApp then
          AddToEventLocation(QryCli.FieldByName('Citta'), ', ', LEventLocation);
        if fCopiaProvinciaNelLuogoApp then
          AddToEventLocation(QryCli.FieldByName('Provincia'), ', ', LEventLocation);
        if fCopiaIndirizzoNelLuogoApp then
        begin
          AddToEventLocation(QryCli.FieldByName('Indirizzo'), ', ', LEventLocation);
          AddToEventLocation(QryCli.FieldByName('NumCivico'), ' ', LEventLocation);
        end;
      end;

      // Composizione luogo appuntamento numeri di telefono e altri dati
      if fCopiaTelefonoNelLuogoApp then
        AddToEventLocation(QryCli.FieldByName('Telefono'), ' - ', LEventLocation);
      if fCopiaCellulareNelLuogoApp then
        AddToEventLocation(QryCli.FieldByName('Cellulare'), ' - ', LEventLocation);
      if fCopiaCodFiscNelLuogoApp then
        AddToEventLocation(QryCli.FieldByName('CodiceFiscale'), ' - CF:', LEventLocation);

      // Assegnazione al luogo dell'appuntamento
      if LEventLocation <> '' then
        QryImpLOCATION.Value := LEventLocation;
      // ==============================================================

    end;
    // Se aperta chiude e riapre la query che contiene i dati del soggetto
    //  questo impegno è associato. In questo modo se l'ID dell'impegno è cambiato oppure
    //  se si stà confermando un impegno nuovo, QrySogg contiene i dati del soggetto
    OpenQrySogg;
    // Carica alcuni parametri di visualizzazione
    CaricaLayoutDocumento;
    // Aggiorna anche il documento collegato se c'è
    if PreventiviOrdiniForm <> nil then begin
      QryImpCLIENTE.OnChange := nil;
      PreventiviOrdiniForm.QryDocumentoCODICECLIENTE.Value := QryImpCLIENTE.Value;
      QryImpCLIENTE.OnChange := QryImpCLIENTEChange;
    end;
  finally
    QryCli.Close;
    QryCli.Free;
  end;
end;

procedure TImpegnoForm.DBETipoInterventoCheckStatesToEditValue(Sender: TObject; const ACheckStates: TcxCheckStates; out AEditValue: Variant);
var
  LValue: String;
begin
  // Converte le voci checkate nel corrispettivo valore da salvare nel DB
  //  NB: Da quando uso questo evento devo per forza avere queste righe altrimenti
  //      non mi memorizza il dato.
  LValue := '';
  if DBETipoIntervento.Items[0].Checked then
    LValue := LValue + '8:Collaudo';
  if DBETipoIntervento.Items[1].Checked then
    LValue := LValue + '12:Manutenzione';
  if DBETipoIntervento.Items[2].Checked then
    LValue := LValue + '6:Guasto';
  if not LValue.IsEmpty then
    AEditValue := ';' + LValue;
  // Aggiunge/toglie le diciture relative al contratto (per i rinnovi dell'abbonamento)
  OP_RifContratto_Dicitura_Check;
  OP_RifContratto_Check;
end;

procedure TImpegnoForm.DBETipoInterventoEditValueToCheckStates(Sender: TObject; const AEditValue: Variant; var ACheckStates: TcxCheckStates);
var
  LValue: String;
begin
  // Converte le voci checkate nel corrispettivo valore da salvare nel DB
  //  NB: Da quando uso questo evento devo per forza avere queste righe altrimenti
  //      non mi memorizza il dato.
  LValue := VarToStr(AEditValue);

  if LValue.Contains('8:Collaudo') then
    ACheckStates[0] := cbsChecked
  else
    ACheckStates[0] := cbsUnchecked;

  if LValue.Contains('12:Manutenzione') then
    ACheckStates[1] := cbsChecked
  else
    ACheckStates[1] := cbsUnchecked;

  if LValue.Contains('6:Guasto') then
    ACheckStates[2] := cbsChecked
  else
    ACheckStates[2] := cbsUnchecked;
end;

procedure TImpegnoForm.DBETipoInterventoExit(Sender: TObject);
begin
   // Non mi piace che rimanga evidenziata l'ultima voce su cui si è fato click
   (Sender as TcxDBCheckListBox).ItemIndex := -1;
   // Richiama il gestore di default
   DBEdit1Exit(Sender);
end;

procedure TImpegnoForm.StampaTagAppuntamento(Preview:Boolean=False);
var
   Qry: TIB_Cursor;
   TmpStr:String;
begin
   DM1.Attendere;
   try
      // Svuota la tabella delle etichette
      DM2.SvuotaTabellaEtichette(IDX_ETICHETTA_SOGGETTO);
      // -----------------------------------------------------------------------------------------------------------------------------------
      // Crea la query e cicla per aggiungere a questa tutti gli articoli che servono
      Qry := TIB_Cursor.Create(Self);
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('INSERT INTO LABSOGG (CODICESTAZIONE, PROGRIGO, JOLLY1, JOLLY2, JOLLY3, JOLLY4, JOLLY5, JOLLY6, JOLLY7, JOLLY8)');
      Qry.SQL.Add('VALUES(');
      Qry.SQL.Add(QuotedStr(DM1.CodiceUtente) + ',');
      Qry.SQL.Add(':P_PROGRIGO,');
      Qry.SQL.Add(':P_ID,');
      Qry.SQL.Add(':P_NOMEPAZIENTE,');
      Qry.SQL.Add(':P_PRATICA,');
      Qry.SQL.Add(':P_TERAPIA,');
      Qry.SQL.Add(':P_TERAPISTA,');
      Qry.SQL.Add(':P_STUDIO,');
      Qry.SQL.Add(':P_DATAAPP,');
      Qry.SQL.Add(':P_ORAAPP');
      Qry.SQL.Add(')');
      // Prepare
      Qry.Prepare;
      // Imposta i parametri della query per l'inserimento del record
      //  attuale nela tabella di stampa delle etochette
      Qry.Params.ParamByName('P_PROGRIGO').AsInteger := 0;
      // ID
      if not QryImpID.IsNull
        then Qry.Params.ParamByName('P_ID').AsString := '#' + BARCODE_TIPOCODICE_DOCUMENTO + BARCODE_DOC_INTERVENTO + QryImpID.AsString + '#'
        else Qry.Params.ParamByName('P_ID').AsString := '';
      // Nome paziente
      TmpStr := '';
      if (not QryImpRAGSOCCLI.IsNull) or (not QryImpCLIENTE.IsNull) then begin
        if (not QryImpRAGSOCCLI.IsNull) then TmpStr := TmpStr + Uppercase(Trim(QryImpRAGSOCCLI.AsString));
        if (not QryImpCLIENTE.IsNull)   then TmpStr := TmpStr + '  (' + Uppercase(Trim(QryImpCLIENTE.AsString)) + ')';
      end;
      Qry.Params.ParamByName('P_NOMEPAZIENTE').AsString := TmpStr;
      // Nome Pratica
      TmpStr := '';
      if (not QryImpPRATICA.IsNull) or (not QryImpDATAPRATICA1.IsNull) or (Trim(EditDescrizionePratica1.Text)<>'') then begin
        if (Trim(EditDescrizionePratica1.Text)<>'') and (Trim(EditDescrizionePratica1.Text)<>'- - -') then TmpStr := TmpStr + Uppercase(Trim(EditDescrizionePratica1.Text));
        if (not QryImpPRATICA.IsNull) then TmpStr := TmpStr + '  (' + QryImpPRATICA.AsString + ', ' + FormatDateTime('dd-mm-yyyy', QryImpDATAPRATICA1.AsDateTime) + ')';
      end;
      Qry.Params.ParamByName('P_PRATICA').AsString := TmpStr;
      // Articolo (terapia)
      TmpStr := '';
      if (not QryImpCODICEARTICOLO.IsNull) or (not QryImpDESCRIZIONEARTICOLO.IsNull) then begin
        if (not QryImpCODICEARTICOLO.IsNull) then TmpStr := TmpStr + Uppercase(Trim(QryImpCODICEARTICOLO.AsString));
        if (not QryImpDESCRIZIONEARTICOLO.IsNull) then begin
          if Trim(TmpStr) <> '' then TmpStr := TmpStr + ' - ';
          TmpStr := TmpStr + Uppercase(Trim(QryImpDESCRIZIONEARTICOLO.AsString));
        end;
      end;
      Qry.Params.ParamByName('P_TERAPIA').AsString := TmpStr;
      // Terapista (Agente)
      if (not QryImpAGENTE.IsNull)
        then Qry.Params.ParamByName('P_TERAPISTA').AsString := Uppercase(Trim(QryImpAGENTE.AsString))
        else Qry.Params.ParamByName('P_TERAPISTA').AsString := '';
      // Studio (Tecnico)
      if (not QryImpRESOURCEID.IsNull)
        then Qry.Params.ParamByName('P_STUDIO').AsString := Uppercase(Trim(DBETecnico.Text))
        else Qry.Params.ParamByName('P_STUDIO').AsString := '';
      // Data appuntamento
      if (not QryImpSTART.IsNull)
        then Qry.Params.ParamByName('P_DATAAPP').AsString := FormatDateTime('dddd dd/mm/yyyy', QryImpSTART.AsDateTime)
        else Qry.Params.ParamByName('P_DATAAPP').AsString := '';
      // Ora appuntamento
      if (not QryImpSTART.IsNull)
        then Qry.Params.ParamByName('P_ORAAPP').AsString := FormatDateTime('hh:nn', QryImpSTART.AsDateTime)
        else Qry.Params.ParamByName('P_ORAAPP').AsString := '';
      // Esegue l'inserimento
      Qry.ExecSQL;
      // -----------------------------------------------------------------------------------------------------------------------------------
      // Crea e avvia la form per la stampa delle etichette
      DM2.StampaEtichettaSilent((MenuStampe.Tag = 0), DM1.TableProgressiviDEFAULTLABELFILENAME.AsString, DM1.DefaultLabelPrinterName);
   finally
      DM1.ChiudiAttendere;
      if Assigned(Qry) then Qry.Free;
   end;
end;

procedure TImpegnoForm.RxSpeedButtonStampaClick(Sender: TObject);
var
   ClientPoint, ScreenPoint: TPoint;
begin
  // ==========================================================================
  // STAMPA MAPPE
  // --------------------------------------------------------------------------
  // Mappa
  if (PageControlPagineDocumento.ActivePage = TabMappa) then begin
    MapForm.PrintPreview;
    Exit;
  end;
  // ==========================================================================

  // Se è un "Intervento" visualizza il menù di stampa del documento collegato,
  if QryImpTIPOIMPEGNO.AsString = 'Intervento' then
  begin
    TabControlPagineDocumento.TabIndex := 1;  // Altrimenti non stampa bene la descrizione degli articoli
    PreventiviOrdiniForm.RxSpeedButtonStampaClick(PreventiviOrdiniForm.RxSpeedButtonStampa);
  // Se invece non è un intervento visualizza il proprio menù di stampa
  end
  else
  begin
    // NB: Se è attivata la proprietà che indica di stampare automaticamente
    //  solo il tagliando dell'appuntamento Exis...
    //  Lo stampa ed esce subito in modo da non fare nemmeno vedere le altre
    //  possibilità di stampa relative agli idraulici
    if AbilitaStampaTagAppuntamento then
    begin
      StampaTagAppuntamento;
      Exit;
    end
    else
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
  end;
end;

procedure TImpegnoForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   ClientPoint, ScreenPoint: TPoint;
begin
  // ==========================================================================
  // STAMPA MAPPE
  // --------------------------------------------------------------------------
  // Mappa
  if (Button = mbRight) and (PageControlPagineDocumento.ActivePage = TabMappa) then begin
    MapForm.PrintPreview;
    Exit;
  end;
  // ==========================================================================

  // Se è un "Intervento" visualizza il menù di stampa del documento collegato,
  if QryImpTIPOIMPEGNO.AsString = 'Intervento' then
  begin
    TabControlPagineDocumento.TabIndex := 1;  // Altrimenti non stampa bene la descrizione degli articoli
    PreventiviOrdiniForm.RxSpeedButtonStampaMouseUp(PreventiviOrdiniForm.RxSpeedButtonStampa, Button, Shift, X, Y);
  // Se invece non è un intervento visualizza il proprio menù di stampa
  end
  else
  begin
    // *************************************************************************
    //   NB: FACENDO CLICK COL DX RICHIAMA IL MENU' DI STAMPA
    // *************************************************************************
    if Button = mbRight then begin
      // NB: Se è attivata la proprietà che indica di stampare automaticamente
      //  solo il tagliando dell'appuntamento Exis...
      //  Lo stampa ed esce subito in modo da non fare nemmeno vedere le altre
      //  possibilità di stampa relative agli idraulici
      if AbilitaStampaTagAppuntamento then begin
        StampaTagAppuntamento(True);
        Exit;
      end else begin
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
  end;
end;



// =============================================================================
// INIZIO - PROCEDURE PER LA STAMPA DEL FOGLIO DI LAVORO
// -----------------------------------------------------------------------------
procedure TImpegnoForm.StampaFoglioDiLavoro(Preview, KitTecnico:Boolean; Copie:Integer=0);
var
  i: Integer;
begin
   // Se le copie impostate nei parametri e progressivi = -1 allora significa che
   //  le stampe sono disabilitate
   if Copie < 0 then
     Exit;
   // CArica gli interventi precedenti se non lo sono già
   if not QryIntPrec.Active then
     ApriQueryElencoUltimiInterventi;
   // Apre la query con i parametri di stampa del foglio di lavoro
   ApriQueryParametriFoglioLavoro;
   try
      // Disabilita il tracciamento della form
      LockWindowUpdate(Self.Handle);
      // Imposta la proprietà DIsplayFOrmat dei campi datetime per migliorare l'aspetto della stampa
      QryImpSTART.DisplayFormat             := 'ddd dd/mm/yy  -  hh.nn';
      QryImpDATAORACHIAMATA.DisplayFormat   := 'ddd dd/mm/yy  -  hh.nn';
      QryImpDATAORAINTERVENTO.DisplayFormat := 'ddd dd/mm/yy  -  hh.nn';
      QryImpDATAORAFINEINTERVENTO.DisplayFormat := 'ddd dd/mm/yy  -  hh.nn';

      // In base al valore dell'apposito parametro lancia la stampa del
      //  Foglio di Lavoro cumulativo o separato per apparecchio.
      if (QryParamFoglioLavoroFL_DATI_APPARECCHI_SEPARATI.AsString = 'T') and ImpiantoAssegnato then
      begin
        // Stampa i fogli di lavoro separato per apparecchi
        StampaFoglioDiLavoroSeparatoPerApparecchio(Preview, KitTecnico, Copie);
      end
      else
      begin
        // Se sono state specificate il numeto di copie da stampare
        //  le stampa senza chiedere nulla
        if (Copie > 0) and (not Preview) then
        begin
          for i := 1 to Copie do
            StampaFoglioDiLavoroCumulativo(Preview, KitTecnico, 1);
        end
        // Se invece non sono state specificate le copie desiderate lo chiede
        else
          StampaFoglioDiLavoroCumulativo(Preview, KitTecnico, Copie);
      end;

   finally
      // Chiude la query con i parametri del foglio di lavoro
      // Imposta la proprietà DIsplayFOrmat dei campi datetime per migliorare l'aspetto della stampa
      QryImpSTART.DisplayFormat             := '';
      QryImpDATAORACHIAMATA.DisplayFormat   := '';
      QryImpDATAORAINTERVENTO.DisplayFormat := '';
      QryImpDATAORAFINEINTERVENTO.DisplayFormat := '';
      // Ripristina il tracciamento della form
      LockWindowUpdate(0);
   end;
end;


// Avvia la stampa del foglio di lavoro unico cumulativo per tutti gli apparecchi dell'impianto
procedure TImpegnoForm.StampaFoglioDiLavoroCumulativo(Preview, KitTecnico:Boolean; Copie:Integer; DisableFilters:Boolean=False);
begin
   // Se siamo in preview le copie sono sempre 1
   if Preview then
     Copie := 1;
   // INizializzazione
   Application.CreateForm(TAppuntamentoQR, AppuntamentoQR);
   try
      // A meno che l'apposito parametro abbia disabilitato il filtraggio (ad es: in caso di stampa separata per apparecchio)
      //  procede, se impostato nei parametri generali, a filtrare e quindi a stampare solo le OP marcate come "DA FARE"
      if (not DisableFilters) and (QryParamFoglioLavoroFL_DATI_OP_SOLODAFARE.AsString = 'T') then
      begin
        btvOP.DataController.Filter.AddItem(nil, btvOPDAEFFETTUARE, foEqual, 'T', 'T');
        btvOP.DataController.Filter.Active := True;
      end;
      // Anteprima
      if Preview then
         AppuntamentoQR.Preview
      // Stampa
      else
      begin
         // Form di attesa
         DM1.Attendere;
         // Se siamo in stampa del kit per il tecnico non fa apparire mai la
         //  Dialog Box per settare le copie ecc.
         if (KitTecnico) or (DM1.SettaStampante(AppuntamentoQR, Copie)) then begin
            AppuntamentoQR.Print;
            // Procedure che marca come "stampato" l'impegno dopo la stampa del foglio di lavoro
            MarcaComeStampato;
         end;
      end;
   finally
      // Rimette a posto anche gli elenchi di OP e Precedenti
      if (not DisableFilters) and (QryParamFoglioLavoroFL_DATI_OP_SOLODAFARE.AsString = 'T') then begin
        SetDataControllerFilterByApp(btvOP.DataController, btvOPIDAPPARECCHIOPRAT);
      end;
      // Pulizie finali
      DM1.ChiudiAttendere;
      AppuntamentoQR.Free;
   end;
end;

// Procedure che marca come "stampato" l'impegno dopo la stampa del foglio di lavoro
procedure TImpegnoForm.MarcaComeStampato;
var
   Q: TIB_Cursor;
begin
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE IMPEGNI SET STAMPATO = ''T'' WHERE ID = ' + QryImpID.AsString);
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TImpegnoForm.MarcaOpDaFareComeFatte;
var
  LPrecPos: TBookmark;
begin
  QryOP.DisableControls;
  LPrecPos := QryOP.GetBookmark;
  try
    QryOP.First;
    while not QryOP.Eof do
    begin
      if QryOPDAEFFETTUARE.AsString = 'T' then
      begin
        QryOP.Edit;
        try
          QryOPEFFETTUATA.Value := 'T';
        except
          QryOP.Cancel;
          raise;
        end;
        QryOP.Post;
      end;
      QryOP.Next;
    end;
  finally
    QryOP.GotoBookmark(LPrecPos);
    QryOP.EnableControls;
  end;
end;

// Procedure che avvia la stampa dei fogli di lavoro separati per apparecchio
procedure TImpegnoForm.StampaFoglioDiLavoroSeparatoPerApparecchio(Preview, KitTecnico:Boolean; Copie:Integer=0);
var
  AppSelArray: array of integer;
  i, ii: Integer;
  DC, DC_OP, DC_Prec: TcxCustomdataController;
  AItemList: TcxFilterCriteriaItemList;
begin
  // Inizializzazione
  DC := tvApp.DataController;
  DC_OP := btvOP.DataController;
  DC_Prec := btvPrecInt.DataController;

  // Se siamo in preview le copie sono sempre 1
  if Preview then Copie := 1;
  // Se le copie = 0 le mette a 1 altrimenti non stamperebbe nulla
  // NB: COnsidera il valore assoluto delle copie, questo perchè a volte qui potrebbe ricevere
  //      come num° di copie richieste un valore negativo (visualizzazione dialog con già le copie
  //      impostate) e altrimenti non stamperebbe nulla.
  Copie := Abs(Copie);
  if Copie = 0 then Copie := 1;

  try
    // Per prima cosa cicla per tutti gli apparecchi presenti e memorizza il loro ID
    //  nell'apposito array (solo quelli selezionati)
    SetLength(AppSelArray, 0);
    for i := 0 to DC.RecordCount -1 do begin
      // Se l'apparecchio attuale è selezionato e non dismesso lo aggiunge all'array
      if (DC.DisplayTexts[i,tvAppDISMESSO.Index] <> 'T') and (DC.DisplayTexts[i,tvAppSELECTED2.Index] = 'T') then begin
        SetLength(AppSelArray, Length(AppSelArray)+1);
        AppSelArray[Length(AppSelArray)-1] := DC.Values[i,tvAppID.Index];
      end;
    end;

    // Adesso cicla per tutti gli apparecchi selezionati presenti nell'array
    //  e filtra l'elenco degli apprecchi per averne uno alla volta e stampare
    //  un foglio di lavoro solo per lui.
    for i := 0 to Length(AppSelArray) -1 do begin
      // -----------------------------------------------------------------------
      // FIltra l'alenco degli apparecchi per l'apparecchio attuale
      DC.Filter.Active := False;
      DC.Filter.Clear;
      DC.Filter.Root.BoolOperatorKind := fboAND;
      DC.Filter.AddItem(nil, tvAppID, foEqual, AppSelArray[i], IntToStr(AppSelArray[i]));
      DC.Filter.Active := True;
      // -----------------------------------------------------------------------
      // Filtra anche le OP
      // NB: Se si è scelto di stampare solo le OP DA FARE aggiunge il relativo filtro
      DC_OP.Filter.Active := False;
      DC_OP.Filter.Clear;
      DC_OP.Filter.Root.BoolOperatorKind := fboAND;
      // Condizione per avere solo le OP dell'apparecchio corrente e le OP generiche per l'impianto
      AItemList := DC_OP.Filter.Root.AddItemList(fboOr);
      AItemList.AddItem(btvOPIDAPPARECCHIOPRAT, foEqual, AppSelArray[i], IntToStr(AppSelArray[i]));
      AItemList.AddItem(btvOPIDAPPARECCHIOPRAT, foEqual, 0, '0');
      // Condizione (eventuale) per stampare solo le OP marcate come "da fare"
      if QryParamFoglioLavoroFL_DATI_OP_SOLODAFARE.AsString = 'T' then DC_OP.Filter.AddItem(nil, btvOPDAEFFETTUARE, foEqual, 'T', 'T');
      DC_OP.Filter.Active := True;
      // -----------------------------------------------------------------------
      // Filtra anche i precedenti
      DC_Prec.Filter.Active := False;
      DC_Prec.Filter.Clear;
      DC_Prec.Filter.Root.BoolOperatorKind := fboAND;
      DC_Prec.Filter.AddItem(nil, btvPrecIntIDAPPARECCHIOPRAT, foEqual, AppSelArray[i], IntToStr(AppSelArray[i]));
      DC_Prec.Filter.Active := True;
      // -----------------------------------------------------------------------
      // Avvia la stampa del Foglio di Lavoro solo per l'apparecchio attuale
      for ii := 1 to Copie do StampaFoglioDiLavoroCumulativo(Preview, KitTecnico, 1, True);
    end;

  finally
    // Rimette a posto i filtri dell'elenco apparecchi
    DC.Filter.Active := False;
    DC.Filter.Clear;
    // Rimette a posto anche gli elenchi di OP e Precedenti
    SetDataControllerFilterByApp(btvOP.DataController, btvOPIDAPPARECCHIOPRAT);
    SetDataControllerFilterByApp(btvPrecInt.DataController, btvPrecIntIDAPPARECCHIOPRAT);
  end;
end;

// -----------------------------------------------------------------------------
// FINE - PROCEDURE PER LA STAMPA DEL FOGLIO DI LAVORO
// =============================================================================




procedure TImpegnoForm.QryImpDATAORAINTERVENTOChange(Sender: TField);
begin
  if (fDifferenzaIntervento = 0) and (fDifferenzaAppuntamento = 0) then fDifferenzaIntervento := StrToTime('01.00')
  else if (fDifferenzaIntervento = 0) and (fDifferenzaAppuntamento <> 0) then fDifferenzaIntervento := fDifferenzaAppuntamento;
  // Reimposta anche la fine dell'appuntamento in modo da mantenere inalterata la durata
  //  dell'appuntamento stesso
  if not QryImpDATAORAINTERVENTO.IsNull
  then QryImpDATAORAFINEINTERVENTO.Value := QryImpDATAORAINTERVENTO.Value + fDifferenzaIntervento;
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    QryImpDATAORAINTERVENTO.OnChange := nil;
    try
      if QryImpDATAORAINTERVENTO.IsNull
      then PreventiviOrdiniForm.QryDocumentoDATADOCUMENTO.Clear
      else PreventiviOrdiniForm.QryDocumentoDATADOCUMENTO.Value := QryImpDATAORAINTERVENTO.Value;
    finally
      QryImpDATAORAINTERVENTO.OnChange := QryImpDATAORAINTERVENTOChange;
    end;
  end;
end;

procedure TImpegnoForm.QryImpDATAORAFINEINTERVENTOChange(Sender: TField);
begin
  if (fDifferenzaIntervento = 0) and (fDifferenzaAppuntamento = 0) then fDifferenzaIntervento := StrToTime('01.00')
  else if (fDifferenzaIntervento = 0) and (fDifferenzaAppuntamento <> 0) then fDifferenzaIntervento := fDifferenzaAppuntamento;
  // Reimposta anche la fine dell'appuntamento in modo da mantenere inalterata la durata
  //  dell'appuntamento stesso
  if QryImpDATAORAINTERVENTO.IsNull then QryImpDATAORAINTERVENTO.Value := QryImpDATAORAFINEINTERVENTO.Value - fDifferenzaIntervento;
  // Memorizza la differenza tra la fine e l'inizio in modo che
  //  se l'utente modifica l'ora di inizio il programma reimposta anche l'ora di fine
  //  in modo da mantenere sempre la stessa durata dell'appuntamento.
  fDifferenzaIntervento := (QryImpDATAORAFINEINTERVENTO.Value - QryImpDATAORAINTERVENTO.Value);
end;

procedure TImpegnoForm.QryImpSTARTChange(Sender: TField);
begin
  // Reimposta anche la fine dell'appuntamento in modo da mantenere inalterata la durata
  //  dell'appuntamento stesso
  if QryImpFINISH.IsNull
  then QryImpFINISH.Value := QryImpSTART.Value + StrToTime('01.00')
  else QryImpFINISH.Value := QryImpSTART.Value + fDifferenzaAppuntamento;
end;

procedure TImpegnoForm.QryImpFINISHChange(Sender: TField);
begin
  // Reimposta anche la fine dell'appuntamento in modo da mantenere inalterata la durata
  //  dell'appuntamento stesso
  if QryImpSTART.IsNull then QryImpSTART.Value := QryImpFINISH.Value - StrToTime('01.00');
  // Memorizza la differenza tra la fine e l'inizio in modo che
  //  se l'utente modifica l'ora di inizio il programma reimposta anche l'ora di fine
  //  in modo da mantenere sempre la stessa durata dell'appuntamento.
  fDifferenzaAppuntamento := (QryImpFINISH.Value - QryImpSTART.Value);
end;

procedure TImpegnoForm.DBEVeicoloDropDown(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(VEICOLO) FROM IMPEGNI');
      Qry.Open;
      DBEVeicolo.Items.Clear;
      while not Qry.Eof do begin
         DBEVeicolo.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TImpegnoForm.DBEKmKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TImpegnoForm.dbeNaturaGiuridicaPropertiesChange(Sender: TObject);
begin
  // All invisible
  LabelRagioneSociale.Visible := False;
  LabelNome.Visible           := False;
  LabelCognome.Visible        := False;
  eRagSocRespImp.Visible      := False;
  eNomeRespImp.Visible        := False;
  eCognomeRespImp.Visible     := False;
  // Show depending....
  case dbeNaturaGiuridica.ItemIndex of
    // Persona fisica
    0: begin
      LabelCognome.Caption    := 'Cognome o Rag.Soc.';
      // Posizionamento verticale
      LabelNome.Top       := RESPIMP_MIDDLE;
      LabelCognome.Top    := RESPIMP_MIDDLE;
      eNomeRespImp.Top    := RESPIMP_MIDDLE;
      eCognomeRespImp.Top := RESPIMP_MIDDLE;
      // Abilita
      LabelNome.Visible       := True;
      LabelCognome.Visible    := True;
      eNomeRespImp.Visible    := True;
      eCognomeRespImp.Visible := True;
    end;
    // Persona giuridica
    //  anche cognome e nome visibili
    1: begin
      LabelCognome.Caption    := 'Cognome';
      // Posizionamento verticale
      LabelRagioneSociale.Top := RESPIMP_TOP;
      LabelNome.Top           := RESPIMP_BOTTOM;
      LabelCognome.Top        := RESPIMP_BOTTOM;
      eRagSocRespImp.Top      := RESPIMP_TOP;
      eNomeRespImp.Top        := RESPIMP_BOTTOM;
      eCognomeRespImp.Top     := RESPIMP_BOTTOM;
      // Abilita
      LabelRagioneSociale.Visible := True;
      LabelNome.Visible           := True;
      LabelCognome.Visible        := True;
      eRagSocRespImp.Visible      := True;
      eNomeRespImp.Visible        := True;
      eCognomeRespImp.Visible     := True;
    end;
  end;
end;

procedure TImpegnoForm.BitBtnPratica1Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QryImpPratica,
                        QryImpDataPratica1,
                        QryImpIDPRATICA,
                        QryImpCliente,
                        QryImpCliente.Value);
end;

procedure TImpegnoForm.QryImpPRATICAChange(Sender: TField);
begin
   DM1.ShowWait('Levante', 'Opeazione in corso...');
   try
     // Carica la descrizione delle pratiche
     if (not QryImpPRATICA.IsNull)  and (not QryImpDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QryImpPRATICA.Value,  QryImpDATAPRATICA1.Value, EditDescrizionePratica1);
     // Se c'è un documento collegato lo aggiorna
     if PreventiviOrdiniForm <> nil then begin
       QryImpPRATICA.OnChange := nil;
       PreventiviOrdiniForm.QryDocumentoDATAPRATICA1.Value := QryImpDATAPRATICA1.Value;
       PreventiviOrdiniForm.QryDocumentoPRATICA.Value := QryImpPRATICA.Value;
       QryImpPRATICA.OnChange := QryImpPRATICAChange;
     end;
     // Carica i dati dell'ubicazione dell'impianto nel luogo dell'appuntamento
     // NB: Carica anche l'ID della pratica
     CaricaUbicazioneImpiantoNelLuogoApp;
     // Carica gli agenti
     DM1.SetAgenti(QryImp, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');
     // Se aperta chiude e riapre la query che contiene i dati dell'impianto a cui
     //  questo impegno è associato. In questo modo se l'ID dell'impegno è cambiato oppure
     //  se si stà confermando un impegno nuovo, QryAss contiene i dati dell'impianto correttamente.
     OpenQryAss;
     // Se l'impianto ha specificato un tecnico preferito e se l'impegno invece non ne ha,
     //  imposta quello dell'impianto
     if (QryImpRESOURCEID.AsInteger = 0) and (QryAssRESOURCEID.AsInteger <> 0)
     then QryImpRESOURCEID.Value := QryAssRESOURCEID.Value;
     // Carica alcuni parametri di visualizzazione
     CaricaLayoutDocumento;
   finally
     DM1.CloseWait;
   end;
end;

// NB: Carica anche l'ID della pratica
procedure TImpegnoForm.CaricaUbicazioneImpiantoNelLuogoApp;
var
  Q: TIB_Cursor;
  TmpStr: String;
begin
  if QryImpPRATICA.IsNull or QryImpDATAPRATICA1.IsNull or (QryImpPRATICA.AsInteger = 0) then Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che cerca se c'è già un record relativo a questo distributore e questa filiale
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT P.ID, P.TIPO, P.DESCRIZIONE, P.IMMOBCAP, P.IMMOBLOCALITA, P.IMMOBINDIRIZZO, P.IMMOBNUMCIVICO, P.IMMOBPROVINCIA, P.TELEFONORESPIMP, P.CELLULARERESPIMP, P.CODICEFISCALERESPIMP, P.PROPCODICEFISCALE,');
    Q.SQL.Add(' P.CAPIMM, P.COMUNEIMM, P.PROVINCIAIMM, P.INDIRIZZOIMM, P.NUMCIVICOIMM');
    Q.SQL.Add('FROM PRATICHE P');
    Q.SQL.Add('WHERE P.CODICE = ' + QryImpPRATICA.AsString);
    Q.SQL.Add('  AND P.DATAAPERTURA = ''' + FormatDateTime('mm/dd/yyyy', QryImpDATAPRATICA1.AsDateTime) + '''');
    Q.Open;
    if not Q.Eof then begin
      // Carica l'ID della pratica
      QryImpIDPRATICA.Value := Q.FieldByName('ID').AsInteger;
      // Se il luogo dell'appuntamento non è inserito copia i dati del soggetto
      // NB: HO tolto la condizione perchè così e meglio, non rimetterla
//      if (QryImpLOCATION.IsNull) or (Trim(QryImpLOCATION.AsString)='') then begin
        TmpStr := '';
        // Se si tratta di un impianto carica i dati dell'impianto
        if Q.FieldByName('TIPO').AsString = 'A' then begin

          if fCopiaDescPraticaNelLuogoApp and (Trim(Q.FieldByName('DESCRIZIONE').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ', ';
            TmpStr := TmpStr + Trim(Q.FieldByName('DESCRIZIONE').AsString);
          end;
          if fCopiaCapNelLuogoApp and (Trim(Q.FieldByName('CAPIMM').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - ';
            TmpStr := TmpStr + Trim(Q.FieldByName('CAPIMM').AsString);
          end;
          if fCopiaLocalitaNelLuogoApp and (Trim(Q.FieldByName('COMUNEIMM').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - ';
            TmpStr := TmpStr + Trim(Q.FieldByName('COMUNEIMM').AsString);
          end;
          if fCopiaProvinciaNelLuogoApp and (Trim(Q.FieldByName('PROVINCIAIMM').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ', ';
            TmpStr := TmpStr + Trim(Q.FieldByName('PROVINCIAIMM').AsString);
          end;
          if fCopiaIndirizzoNelLuogoApp and (Trim(Q.FieldByName('INDIRIZZOIMM').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ', ';
            TmpStr := TmpStr + Trim(Q.FieldByName('INDIRIZZOIMM').AsString);
            if (Trim(Q.FieldByName('NUMCIVICOIMM').AsString) <> '') then TmpStr := TmpStr + ' ' + Trim(Q.FieldByName('NUMCIVICOIMM').AsString);
          end;
          if fCopiaTelefonoNelLuogoApp and (Trim(Q.FieldByName('TELEFONORESPIMP').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - ';
            TmpStr := TmpStr + Trim(Q.FieldByName('TELEFONORESPIMP').AsString);
          end;
          if fCopiaCellulareNelLuogoApp and (Trim(Q.FieldByName('CELLULARERESPIMP').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - ';
            TmpStr := TmpStr + Trim(Q.FieldByName('CELLULARERESPIMP').AsString);
          end;
          if fCopiaCodFiscNelLuogoApp and (Trim(Q.FieldByName('CODICEFISCALERESPIMP').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - CF:';
            TmpStr := TmpStr + Trim(Q.FieldByName('CODICEFISCALERESPIMP').AsString);
          end;

        // Se invece si tratta di un cantiere carica i dati del cantiere
        end else if Q.FieldByName('TIPO').AsString = 'P' then begin

          if fCopiaDescPraticaNelLuogoApp and (Trim(Q.FieldByName('DESCRIZIONE').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ', ';
            TmpStr := TmpStr + Trim(Q.FieldByName('DESCRIZIONE').AsString);
          end;
          if fCopiaCapNelLuogoApp and (Trim(Q.FieldByName('IMMOBCAP').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - ';
            TmpStr := TmpStr + Trim(Q.FieldByName('IMMOBCAP').AsString);
          end;
          if fCopiaLocalitaNelLuogoApp and (Trim(Q.FieldByName('IMMOBLOCALITA').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - ';
            TmpStr := TmpStr + Trim(Q.FieldByName('IMMOBLOCALITA').AsString);
          end;
          if fCopiaProvinciaNelLuogoApp and (Trim(Q.FieldByName('IMMOBPROVINCIA').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ', ';
            TmpStr := TmpStr + Trim(Q.FieldByName('IMMOBPROVINCIA').AsString);
          end;
          if fCopiaIndirizzoNelLuogoApp and (Trim(Q.FieldByName('IMMOBINDIRIZZO').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ', ';
            TmpStr := TmpStr + Trim(Q.FieldByName('IMMOBINDIRIZZO').AsString);
            if (Trim(Q.FieldByName('IMMOBNUMCIVICO').AsString) <> '') then TmpStr := TmpStr + ' ' + Trim(Q.FieldByName('IMMOBNUMCIVICO').AsString);
          end;
          if fCopiaCodFiscNelLuogoApp and (Trim(Q.FieldByName('PROPCODICEFISCALE').AsString) <> '') then begin
            if TmpStr <> '' then TmpStr := TmpStr + ' - CF:';
            TmpStr := TmpStr + Trim(Q.FieldByName('PROPCODICEFISCALE').AsString);
          end;

        end;
        // Assegnazione valore costruito
        if TmpStr <> '' then QryImpLOCATION.Value := TmpStr;
//      end;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TImpegnoForm.Button1Click(Sender: TObject);
begin
  ReportDesignerDialog1.NewReport('', False);
end;

procedure TImpegnoForm.CaricaDatiTecnico(Codice:Integer);
begin
  with QryDatiTecnico do begin
    if Active then Close;
    if not Prepared then Prepare;
    ParamByName('P_Codice').AsInteger := Codice;
    Open;
  end;  
end;

procedure TImpegnoForm.StampaKITperiltecnico1Click(Sender: TObject);
var
  isPreview: Boolean;
begin
  // Preview?
  isPreview := (MenuStampe.Tag = 0);
  // Foglio di lavoro
  StampaFoglioDiLavoro(isPreview, True, DM1.TableProgressiviFL_COPIE.AsInteger);
  // Allegati
  StampaTuttiGliAllegatiFG(isPreview);
end;

procedure TImpegnoForm.Rapportointerventiprecedenti1Click(Sender: TObject);
begin
   // Apre la queru che contiene l'elenco degli interventi precedenti per
   //  stesso impianto.
   ApriQueryElencoUltimiInterventi;
   // Stampa sulla stampante
   Application.CreateForm(TUltimiInterventiImpiantoQR, UltimiInterventiImpiantoQR);
   try
      // Imposta la proprietà DIsplayFOrmat dei campi datetime per migliorare l'aspetto della stampa
//      QryIntPrecSTART.DisplayFormat             := 'ddd dd/mm/yy  -  hh.nn';
//      QryIntPrecDATAORACHIAMATA.DisplayFormat   := 'ddd dd/mm/yy  -  hh.nn';
//      QryIntPrecDATAORAINTERVENTO.DisplayFormat := 'ddd dd/mm/yy  -  hh.nn';
//      QryIntPrecDATAORAFINEINTERVENTO.DisplayFormat := 'ddd dd/mm/yy  -  hh.nn';
      // Anteprima
      if MenuStampe.Tag = 0 then begin
         UltimiInterventiImpiantoQR.Preview;
      // Stampa
      end else if MenuStampe.Tag = 1 then begin
         DM1.Attendere;
         if DM1.SettaStampante(UltimiInterventiImpiantoQR, 0) then begin
            UltimiInterventiImpiantoQR.Print;
         end;
         DM1.ChiudiAttendere;
      end;
   finally
      // Imposta la proprietà DIsplayFOrmat dei campi datetime per migliorare l'aspetto della stampa
//      QryIntPrecSTART.DisplayFormat             := '';
//      QryIntPrecDATAORACHIAMATA.DisplayFormat   := '';
//      QryIntPrecDATAORAINTERVENTO.DisplayFormat := '';
//      QryIntPrecDATAORAFINEINTERVENTO.DisplayFormat := '';

      UltimiInterventiImpiantoQR.Free;
   end;
end;

procedure TImpegnoForm.DBComboRegistroPropertiesInitPopup(Sender: TObject);
var
   Qry:TIB_Cursor;
begin
   // Crea la query che fornirà l'elenco dei registri disponibili
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT Registro FROM ProgReg');
      Qry.Open;
      // Carica i registri nelle items del componente
      DBComboRegistro.Properties.Items.Clear;
      while not Qry.Eof do begin
         DBComboRegistro.Properties.Items.Add(Qry.FieldByName('Registro').Value);
         Qry.Next;
      end;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

procedure TImpegnoForm.QryImpRAGSOCCLIChange(Sender: TField);
begin
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    Sender.OnChange := nil;
    PreventiviOrdiniForm.QryDocumento.FieldByName(Sender.FieldName).Value := Sender.Value;
    Sender.OnChange := QryImpRAGSOCCLIChange;
  end;
end;

procedure TImpegnoForm.EditDescrizionePratica1Change(Sender: TObject);
begin
  if QryImpPRATICA.AsInteger > 0 then begin
    DbeDescrizioneCantiere.Text := EditDescrizionePratica1.Text;
  end else begin
    DbeDescrizioneCantiere.Text := '- - -';
  end;
  DbeDescrizioneCantiere2.Text := DbeDescrizioneCantiere.Text;
end;

function TImpegnoForm.GetAppuntamentoEnabled: Boolean;
begin
  Result := PanelAppuntamento.Enabled;
end;

function TImpegnoForm.GetChiamataEnabled: Boolean;
begin
  Result := PanelChiamata.Enabled;
end;

procedure TImpegnoForm.SetAppuntamentoEnabled(const Value: Boolean);
begin
  PanelAppuntamento.Enabled := Value;

  if Value then begin
    PanelAppuntamento.Color := PANELENABLED;
  end else begin
    PanelAppuntamento.Color := PANELDISABLED;
  end;

  DBEDataAppuntamento.ParentColor := not Value;
  DBEOraAppuntamento.ParentColor := not Value;
  DBEDataFineAppuntamento.ParentColor := not Value;
  DBEOraFineAppuntamento.ParentColor := not Value;
  DBELuogo.ParentColor := not Value;

  if Value then begin
    if RxSpeedModifica.Down then DM1.ColoraTuttiCampi(ImpegnoForm, COLOR_MODIFICA) else DM1.ColoraTuttiCampi(ImpegnoForm, COLOR_NORMALE);
  end;

  if Value then begin
    DBEDataAppuntamento.Style.Font.Color := clBlack;
    DBEOraAppuntamento.Style.Font.Color := clBlack;
    DBEDataFineAppuntamento.Style.Font.Color := clBlack;
    DBEOraFineAppuntamento.Style.Font.Color := clBlack;
    DBELuogo.Font.Color := clBlack;
    Label3.Font.Color := clGray;
    Label13.Font.Color := clGray;
    LabelLuogoAppuntamento.Font.Color := clGray;
    Label2.Font.Color := clGray;
    Label5.Font.Color := clGray;
    Shape5.Pen.Color := clGray;
    Shape4.Pen.Color := clGray;
    Shape6.Pen.Color := clGray;
    Shape7.Pen.Color := clGray;
    LabelPanelAppuntamento.Font.Color := clMaroon;
  end else begin
    DBEDataAppuntamento.Style.Font.Color := clGray;
    DBEOraAppuntamento.Style.Font.Color := clGray;
    DBEDataFineAppuntamento.Style.Font.Color := clGray;
    DBEOraFineAppuntamento.Style.Font.Color := clGray;
    DBELuogo.Font.Color := clGray;
    Label3.Font.Color := clGray;
    Label13.Font.Color := clGray;
    LabelLuogoAppuntamento.Font.Color := clGray;
    Label2.Font.Color := clGray;
    Label5.Font.Color := clGray;
    Shape5.Pen.Color := clSilver;
    Shape4.Pen.Color := clSilver;
    Shape6.Pen.Color := clSilver;
    Shape7.Pen.Color := clSilver;
    LabelPanelAppuntamento.Font.Color := clGray;
  end;

  Update;
end;

function TImpegnoForm.GetApparecchiEnabled: Boolean;
begin
  Result := PanelApparecchi.Enabled;
end;

procedure TImpegnoForm.SetApparecchiEnabled(const Value: Boolean);
begin
  // Abilita(disabilita il pannello
  PanelApparecchi.Enabled := Value;
  // IMposta il colore di sfondo conseguenza
  if Value then begin
    PanelApparecchi.Color := PANELENABLED;
  end else begin
    PanelApparecchi.Color := PANELDISABLED;
  end;
  // IMposta il colore di Labels e campi
  if Value then begin
    LabelPanelApparecchi.Font.Color := clMaroon;
  end else begin
    LabelPanelApparecchi.Font.Color := clGray;
  end;
  // Forza l'aggiornamento dello schermo
  Update;
end;

procedure TImpegnoForm.SetChiamataEnabled(const Value: Boolean);
var
  i: Integer;
begin
  PanelChiamata.Enabled := Value;

  if Value then begin
    PanelChiamata.Color := PANELENABLED;
  end else begin
    PanelChiamata.Color := PANELDISABLED;
  end;

  DBEDataChiamata.ParentColor := not Value;
  DBEOraChiamata.ParentColor := not Value;
  DBEMotivoChiamata.ParentColor := not Value;

  if Value then begin
    if RxSpeedModifica.Down then DM1.ColoraTuttiCampi(ImpegnoForm, COLOR_MODIFICA) else DM1.ColoraTuttiCampi(ImpegnoForm, COLOR_NORMALE);
  end;

  if Value then begin
    DBEDataChiamata.Style.Font.Color := clBlack;
    DBEOraChiamata.Style.Font.Color := clBlack;
    DBEMotivoChiamata.Font.Color := clBlack;
    Label21.Font.Color := clGray;
    LabelMotivoChiamata.Font.Color := clGray;
    LabelPanelChiamata.Font.Color := clMaroon;
  end else begin
    DBEDataChiamata.Style.Font.Color := clGray;
    DBEOraChiamata.Style.Font.Color := clGray;
    DBEMotivoChiamata.Font.Color := clGray;
    Label21.Font.Color := clGray;
    LabelMotivoChiamata.Font.Color := clGray;
    LabelPanelChiamata.Font.Color := clGray;
  end;

  Update;
end;

procedure TImpegnoForm.QryImpTIPOIMPEGNOChange(Sender: TField);
begin
   // Se è appena diventato un intervento mette per default l'inizio e la fine
   //  dell'intervento uguale all'appuntamento
   //  NB: PRIMA ERA DOPO "CaricaLayoutDocumento" (LA RIGA SOTTO) ORA HO PROVATO A SPOSTARLO QUI
   //      PERCHE' MI PIACE DI PIU'
   if (QryImpTIPOIMPEGNO.AsString = 'Intervento') and (not VarIsNull(QryImpTIPOIMPEGNO.OldValue)) and (QryImpTIPOIMPEGNO.OldValue <> 'Intervento') then
   begin
     if QryImpDATAORAINTERVENTO.IsNull and not QryImpSTART.IsNull then
       QryImpDATAORAINTERVENTO.Value := QryImpSTART.Value;
     if QryImpDATAORAFINEINTERVENTO.IsNull and not QryImpFINISH.IsNull then
       QryImpDATAORAFINEINTERVENTO.Value := QryImpFINISH.Value;
   end;
   // Carica alcuni parametri di visualizzazione
   CaricaLayoutDocumento;
end;

procedure TImpegnoForm.SetAzioniVisible(const Value: Boolean);
begin
  fAzioniVisible := Value;
  LabelAzioni.visible := Value;
  ShapeAzioni.visible := Value;
  LabelAzioneMagazzino.visible := Value;
  LabelAzioneCantiere.visible := Value;
  DbeAzioneMagazzino.visible := Value;
  DbeAzioneCantiere.visible := Value;
  DBEditSegnoOperazione.visible := Value;
  DBEditSegnoOperazioneCantiere.visible := Value;
end;

procedure TImpegnoForm.SBCreaInterventoClick(Sender: TObject);
var
  PrecFormEnabled: Boolean;
  PrecWaitMsg: String;
  MasterID: Integer;
begin
  // Se è già un intervento esce subito
  if (not QryImpTIPOIMPEGNO.IsNull) and (QryImpTIPOIMPEGNO.Value = 'Intervento') then Exit;
  // Chiede prima conferma
  //  NB: Non la chiede se la trasformazione in intervento è stata richiesta con il codice a barre (Tag = 1)
  if (SBCreaIntervento.Tag = 0) and fAppuntamentoToInterventoRichiediConferma and (DM1.Messaggi('Creazione Rapporto di Intervento', 'Confermi?', '', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;

  // RImette il Tag del pulsante a posto
  SBCreaIntervento.Tag := 0;
  // Messaggio
  DM1.ShowWait('Levante', 'Sto creando l''Intervento'#13#13'Un momento per favore...');
  // Disabilita momentaneamente tutta la form in modo da evitare che l'utente
  //  prema il pulsante modifica per uscire dalla modifica prima dhe l'operazione sia completata
  //  altrimenti dava dei problemi.
  PrecFormEnabled := Self.Enabled;
  Self.Enabled := False;
  try
    // Disabilita l'event handler QryImpCLIENTEChange perchè altrimenti se l'utente ha aggiunto al luogo
    //  dell'appuntamento una sua annotazione (oltre a quanto messo da Levante automaticamente) questa nota
    //  viene persa perchè Levante riassegna il sogegtto e questo causa la ri-creazione automatica
    //  del luogo appunatemnto con conseguente cancellazione delle note inserite dall'utente.
    QryImpCLIENTE.OnChange := nil;
    QryImpPRATICA.OnChange := nil;
    // =========================================================================
    // Trasforma il documento in rapporto di intervento
    // -------------------------------------------------------------------------
    if not RxSpeedModifica.Down then
    begin
      RxSpeedModifica.Down := True;
      RxSpeedModificaClick(RxSpeedModifica);
    end;
    QryImpTIPOIMPEGNO.Value := 'Intervento';
    // =========================================================================
    // Assegna l'agente
    if (not QryImpAGENTE.IsNull)  then QryImpAGENTEChange(QryImpAgente);
    if (not QryImpAGENTE2.IsNull) then QryImpAGENTE2Change(QryImpAgente2);
    if (not QryImpAGENTE3.IsNull) then QryImpAGENTE3Change(QryImpAgente3);
    if (not QryImpAGENTE4.IsNull) then QryImpAGENTE4Change(QryImpAgente4);
    // Carica i magazzini e/o il registro relativo al tecnico se specificato
    //  e se è impostato che deve farlo
    if (not QryImpRESOURCEID.IsNull) and (QryImpRESOURCEID.AsInteger <> 0)
    then QryImpRESOURCEIDChange(QryImpRESOURCEID);
    // Carica l'articolo automaticamente se specificato nell'appuntamento
    if (not QryImpCODICEARTICOLO.IsNull) and (Trim(QryImpCODICEARTICOLO.AsString) <> '') then
    begin
      PreventiviOrdiniForm.NuovoRigoDocumento('', Trim(QryImpCODICEARTICOLO.AsString), '', '', '', AM_Append, 1);
    end;
    // Se è già checkato che è un intervento di manutenzione aggiunge il riferimento
    //  al contratto
    OP_RifContratto_Dicitura_Check;
    OP_RifContratto_Check;
    // ===========================================================================
    // ELIMINAZIONE GOOGLE TASK  &  GOOGLE CALENDAR
    // ---------------------------------------------------------------------------
    // Salva il messaggio attuale della wait form
    if Assigned(WaitForm) then PrecWaitMsg := WaitForm.LabelMessaggio.Caption;
    try
      // RIcava il Master ID
      MasterID := QryImpMASTER_ID.AsInteger;
      // Google Tasks
      if DM1.GoogleTasks_Enabled and DM1.GoogleTasks_EliminaAdAppuntamentoFatto then begin
        DM1.ShowWait('', 'Sto comunicando con Google Tasks...');
        try
          GoogleTasks_DeleteTaskByMaster_ID(MasterID, False);
        except
          DM1.Messaggi('Levante', 'Google Tasks'#13#13'Temo di non essere riuscito a eliminare il Task.', '', [mbOK], 0, nil);
        end;
      end;
      // Goocle Calendar
      if DM1.GoogleCalendar_Enabled and DM1.GoogleCalendar_EliminaAdAppuntamentoFatto then begin
        DM1.ShowWait('', 'Sto comunicando con Google Calendar...');
        try
          GCal_DeleteEventByMaster_ID(MasterID, False);
        except
          DM1.Messaggi('Levante', 'Google Calendar'#13#13'Mi dispiace, non sono riuscito a eliminare l''evento.', '', [mbOK], 0, nil);
        end;
      end;
    finally
      // Ripristina il messaggio della wait form precedente
      if PrecWaitMsg <> '' then DM1.ShowWait('', PrecWaitMsg);
    end;
    // ===========================================================================

  finally
    // RIpristina l'event handler QryImpCLIENTEChange
    QryImpCLIENTE.OnChange := QryImpCLIENTEChange;
    QryImpPRATICA.OnChange := QryImpPRATICAChange;

    DM1.CloseWait;

    if PrecFormEnabled then begin
      Self.Enabled := True;
      Self.Update;
      Application.ProcessMessages;
      // Imposta il focus
      // NB: COme richiesto dalla Samuela della Climatek e come penso anche io che sia giusto
      //      posiziona il focus dull'ora di inizio dell'appuntamento e se il dato è nullo
      //      perchè abbiamo creato l'intervento direttamente da una chiama lo posiziona
      //      sulla data.
      if QryImpDATAORAINTERVENTO.IsNull
        then DBEDataIntervento.SetFocus
        else DBEOraIntervento.SetFocus;
    end;
  end;
end;

// FUnction che rieve due TDatetime e ritorna una stringa
//  contenente la differenza tra i due in ore e minuti.
function TImpegnoForm.DateTimeDifferenceToString(FromDateTime, ToDateTime: Variant): String;
var
  Ore, Minuti, MinutiTotali: Integer;
  OreStr, MinutiStr, Separator: String;
begin
  // Inizializzazione
  Result    := '';
  OreStr    := '';
  MinutiStr := '';
  Separator := '';
  // I due valori devono essere validi
  if VarIsNull(FromDateTime) or (VarToDateTime(FromDateTime) = 0) or VarIsNull(ToDateTime) or (VarToDateTime(ToDateTime) = 0)
  then Exit;
  // Prima di tutto trova quanti minuti sono in totale
  MinutiTotali := Abs(Round(MinuteSpan(VarToDateTime(FromDateTime), VarToDateTime(ToDateTime))));
  // Calcola le ore
  Ore := MinutiTotali div 60;
  // Calcola i minuti rimanenti
  Minuti := MinutiTotali mod 60;
  // Costruisce la stringa per le ore
  if      Ore = 1 then OreStr := '1 ora'
  else if Ore > 1 then OreStr := IntToStr(Ore) + ' ore';
  // Costruisce la stringa per i minuti
  if      Minuti = 1 then MinutiStr := '1 minuto'
  else if Minuti > 1 then MinutiStr := IntToStr(Minuti) + ' minuti';
  // Determina il separatore tra ore e minuti
  if (OreStr <> '') and (MinutiStr <> '') then Separator := ' e ';
  // Costruisce il valore da ritornare
  Result := OreStr + Separator + MinutiStr;
end;


// FUnction che ritorna true se l'intervento attuale è il più recente
function TImpegnoForm.IsUltimoIntervento: Boolean;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := False;
  // Se non è un intervento esce subito
  //  anche se non c'è un impegno nel documento
  if (QryImpTIPOIMPEGNO.AsString <> 'Intervento') or (QryImpIDPRATICA.AsInteger = 0) then Exit;
  // Esegue la query per vedere se c'è un altro intervento più recente
  // Imposta la query che eseguirà l'operazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà i dati dell'operazione pianificata
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Conta quenti interventi ci sono per lo stesso impianto successivi all'attuale
    //  se ce non ce ne sono ritorna True.
    Q.SQL.Add('SELECT COUNT(*) AS QUANTI FROM IMPEGNI IMP WHERE');
    Q.SQL.Add('    IMP.IDPRATICA = ' + IntToStr(QryImpIDPRATICA.AsInteger));
    Q.SQL.Add('AND IMP.TIPOIMPEGNO = ' + QuotedStr('Intervento'));
    Q.SQL.Add('AND IMP.DATAORAINTERVENTO > :P_DATAORAINTERVENTO');
    Q.SQL.Add('AND IMP.ID > :P_ID');
    // Prepare ed esecuzione
    Q.Prepare;
    Q.Params.ParamByName('P_DATAORAINTERVENTO').AsDateTime := QryImpDATAORAINTERVENTO.AsDateTime;
    Q.Params.ParamByName('P_ID').AsInteger := QryImpID.AsInteger;
    Q.Open;
    // Valorizzazion valore da ritornale
    Result := (Q.Fields[0].AsInteger = 0);
    // CHiude la query
    Q.Close;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;

procedure TImpegnoForm.LoadSchedulerEventStateComboBoxProperties(
  const AcxImageComboBox: TcxDBImageComboBox);
var
  LItem: TcxImageComboBoxItem;
  I: Integer;
begin
   dbeState.Properties.Images := TimeLinePatterns;
   // Item 1
   LItem := AcxImageComboBox.Properties.Items[0];
   LItem.Description := DM1.AgendaStateDescription1;
   LItem.ImageIndex := 0;
   LItem.Value := 0;
   // Item 2
   LItem := AcxImageComboBox.Properties.Items[1];
   LItem.Description := DM1.AgendaStateDescription2;
   LItem.ImageIndex := 1;
   LItem.Value := 1;
   // Item 3
   LItem := AcxImageComboBox.Properties.Items[2];
   LItem.Description := DM1.AgendaStateDescription3;
   LItem.ImageIndex := 2;
   LItem.Value := 2;
   // Item 4
   LItem := AcxImageComboBox.Properties.Items[3];
   LItem.Description := DM1.AgendaStateDescription4;
   LItem.ImageIndex := 3;
   LItem.Value := 4;
end;

procedure TImpegnoForm.LoadSchedulerLabelColorComboBoxProperties(
  const AcxColorComboBox: TcxDBColorComboBox);
var
  I: Integer;
  LItem: TcxColorComboBoxItem;
begin
  AcxColorComboBox.Properties.Items.Clear;
  for I := 0 to EventLabels.Count-1 do
  begin
    LItem := TcxColorComboBoxItem.Create(AcxColorComboBox.Properties.Items);
    LItem.Description := EventLabels[I].Caption;
    LItem.Color := EventLabels[I].Color;
  end;
end;

// Procedure che esegue l'aggiornamento delle OP della pratica che sono state
//  marcate ome effettuate.
procedure TImpegnoForm.AggiornaOpPraticaFatte;
var
  PrecPos:TBookmark;
begin
  // Solo se è un intervento
  if QryImpTIPOIMPEGNO.AsString <> 'Intervento' then
    raise Exception.Create('Questa funzionalità è disponibile solo per gli interventi!!!');
  // Si assicura che sia stato inserito il campo "DATAORAINTERVENTO"
  if QryImpDATAORAINTERVENTO.IsNull or (QryImpDATAORAINTERVENTO.Value = 0) or (QryImpDATAORAINTERVENTO.Value = StrToDate('01/01/1900')) then
    raise Exception.Create('DATAORAINTERVENTO non valida!');
  // Verifica che il documento faccia parte di un impegno
  if QryImpIDPRATICA.AsInteger = 0 then
    raise Exception.Create('Impianto non specificato!');
  // Se non è l'ultimo intervento per lo stesso impianto avvisa l'utente
  if not IsUltimoIntervento then
    if DM1.Messaggi('ATTENZIONE !!!', 'CI SONO ALTRI INTERVENTI PIU'' RECENTI !!!'#13#13'Di solito solo il più recente deve aggiornare la situazione delle operazioni pianificate dell''impianto.'#13#13'Vuoi proseguire ugualmente?', 'NB: Continuando con questa operazione potresti riportare indietro nel tempo la situazione di alcune operazioni pianificate (quelle marcate come "fatte" nel presente intervento).', [mbyes,mbNo], 0, nil) <> mrYes then Exit;
  // Salva la posizione attuale
  PrecPos := QryOP.GetBookmark;
  try
    // Disabilita l'aggiornamento dei componenti
    QryOP.DisableControls;
    // Si sposta all'inizio
    QryOP.First;
    // Cicla per tutti i records e ne esegue l'aggiornamento
    while not QryOP.Eof do begin
      if (QryOPEFFETTUATA.AsString = 'T') and (QryOPPERIODICITA.AsInteger <> 0) then begin
        AggiornaSingolaOpPratica(QryOPIDOPPRATICA.Value, QryImpDATAORAINTERVENTO.Value, QryOPPERIODICITA.AsInteger);
      end;
      QryOP.Next;
    end;
  finally
    // Ripristino
    QryOP.GotoBookmark(PrecPos);
    QryOP.FreeBookmark(PrecPos);
    QryOP.EnableControls;
  end;
end;

// Procedura che effettua l'aggiornamento dell'operazione pianificata
procedure TImpegnoForm.AggiornaSingolaOpPratica(IdOpPratica:Integer; DataUltima:TDatetime; Periodicita:Integer; ForzaDataProssima:TDatetime=0);
var
  Q: TIB_Cursor;
begin
  // Se il parametro "ForzaDataProssima" = 0 significa che l'utente non ha richiesto di impostare una
  //  data di scadenza specifica e forzata, in questo caso la calcola automaticamente
  if ForzaDataProssima = 0 then begin
    ForzaDataProssima := DataUltima + Periodicita;
  end;
  // Imposta la query che eseguirà l'operazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà i dati dell'operazione pianificata
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE OPPRATICA OPP SET');
    Q.SQL.Add('OPP.ULTIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DataUltima)) + ',');
    Q.SQL.Add('OPP.PROSSIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', ForzaDataProssima)) + ',');
    Q.SQL.Add('OPP.PERIODICITA = ' + IntToStr(Periodicita));
    Q.SQL.Add('WHERE OPP.ID = ' + IntToStr(IdOpPratica));
    // Esegue la query
    Q.ExecSQL;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;



// Procedure che effettua l'importazione delle operazioni pianificate
//  predefinite dalla pratica
procedure TImpegnoForm.ImportaOpPratica(IdPratica:Integer);
var
  Q: TIB_Cursor;
  R: TModalResult;
begin
  // Se siamo nella fase di creazione del documento collegato (Intervento) esce subito senza
  //  fare nulla altrimenti c'erano dei problemi
  if fCreandoDocumentoCollegato then
    Exit;
  // Disabilita l'aggiornamento dello schermo della griglia
  btvOP.BeginUpdate;
  try
    // Inizializzazione
    R := mrYes;
    // Se ci sono già delle oeprazioni pianificate chiede conferma all'utente se sostituirle oppure mantenere le esistenti
    if (QryOP.RecordCount > 0) then
      R := DM1.Messaggi('Caricamento operazioni pianificate', 'ATTENZIONE !!!'#13#13'Ci sono già delle operazioni pianificate precedenti nel documento.'#13#13'Eliminare le voci operazioni pianificate precedenti e caricare le nuove?', 'NB: Cliccando su "SI" le operazioni pianiticate nuove sostituiranno le vecchie che saranno eliminate; cliccando su "NO" saranno mantenute le vecchie e NON verranno caricate le nuove.', [mbYes,mbNo], 0, nil);
    // Se la nuova pratica è nulla (IDPRATICA = 0) oppure se è cambiata
    //  la pratica ma c'erano già delle operazioni pianificate nel documento
    //  (magari perchè precedentemente era stata selezionata una pratica errata)
    //  avverte l'utente e chiede se si vogliono eliminare le operazioni pianificate
    //  precedenti.
    if (QryOP.RecordCount > 0) and (R = mrYes) then begin
       // Elimina le OP esistenti
       QryOP.First;
       while not QryOP.Eof do
         QryOP.Delete;
    end;
    // A questo punto se la nuova IDPRATICA = 0 esce subito
    if (IdPratica = 0) or (R <> mrYes) then
      Exit;
    // Inizializzazione
    Q := TIB_Cursor.Create(Self);
    try
      // Imposta la query che ricaverà i dati dell'operazione pianificata
      Q.DatabaseName := DM1.ArcDBFile;
      Q.IB_Connection := DM1.DBAzienda;
      // Imposta la query che ricaverà l'elenco delle operazioni pianificate
      //  predefinite dalla pratica
      Q.SQL.Add('SELECT OPPRATICA.ID');
      Q.SQL.Add('FROM OPPRATICA');
      Q.SQL.Add('LEFT JOIN PRATAPPARECCHI ON (PRATAPPARECCHI.ID = OPPRATICA.IDAPPARECCHIOPRAT)');
      Q.SQL.Add('WHERE OPPRATICA.IDPRATICA = ' + IntToStr(IdPratica));
      Q.SQL.Add('  AND COALESCE(PRATAPPARECCHI.DISMESSO,''F'') <> ''T''');
      // Apre la query e verifica di aver trovato qualcosa
      Q.Open;
      // Cicla per le OP trovate e le carica nel documento
      while not Q.Eof do
      begin
        if Q.Fields[0].AsInteger <> 0 then
          Self.NuovoRigoOP_DaPratica(Q.Fields[0].AsInteger, AM_Append);
        Q.Next;
      end;
      // Chiude la query
      Q.Close;
    finally
      // Pulizie finali
      Q.Free;
    end;
  finally
    // RImette tutto a posto
    btvOP.EndUpdate;
  end;
end;

// Procedura che carica un nuovo rigo dioperazioni pianificate
procedure TImpegnoForm.NuovoRigoOP_DaPratica(IdOpPrat:Integer; Mode:TAddArtMode);
var
  DC:TcxCustomDataController;
  Q: TIB_Cursor;
begin
  // DC Punta al DataController che attualmente ha il focus
  DC := btvOP.DataController;
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Uso questo flag per disabilitare l'aggiunta o la rimozione
    //  delle OP nei ricambi/manodopera (documentoCollegato) perchè
    //  è giusto così e perchè altrimenti faceva una cosa inutile e lenta
    fUpdatingOpFromDoc := True;
    // Imposta la query che ricaverà i dati dell'operazione pianificata
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT * FROM OPPRATICA WHERE ID = ' + IntToStr(IdOpPrat));
    // Apre la query e ne carica il contenuto
    Q.Open;
    if Q.Eof then raise Exception.Create('Voce non trovata!');
    // Se non c'è alcun record selezionato forza l'Append del nuovo rigo
    //  altrimenti dà un errore.
    if DC.FocusedRecordIndex = -1 then Mode := AM_Append;
    // In base alla modalità modifica il rigo corrente oppure fà un append o un isert.
    case Mode of
       AM_Append: QryOP.Append;
       AM_Insert: QryOP.Insert;
    end;
    // Carica i dati nel nuovo record
    QryOPID.Value := DM1.Generators_NextGenID('GEN_ID_OPIMPEGNO');
    QryOPIDIMPEGNO.Value := QryImpID.AsInteger;
    QryOPIDPRATICA.Value := Q.FieldByName('IDPRATICA').AsInteger;
    QryOPIDOPPRATICA.Value := Q.FieldByName('ID').AsInteger;
    QryOPIDAPPARECCHIOPRAT.Value := Q.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
    QryOPIDOP.Value := Q.FieldByName('IDOP').AsString;
    QryOPDESCRIZIONE.Value := Q.FieldByName('DESCRIZIONE').AsString;
    QryOPMINUTIPREVISTI.Value := Q.FieldByName('MINUTIPREVISTI').AsInteger;
    QryOPPERIODICITA.Value := Q.FieldByName('PERIODICITA').AsInteger;
    QryOPULTIMA.Value := Q.FieldByName('ULTIMA').AsDateTime;
    QryOPPROSSIMA.Value := Q.FieldByName('PROSSIMA').AsDateTime;
    QryOPPRZUNIT.Value := Q.FieldByName('PRZUNIT').AsCurrency;
    QryOPSCONTO1.Value := Q.FieldByName('SCONTO1').AsDouble;
    QryOPSCONTO2.Value := Q.FieldByName('SCONTO2').AsDouble;
    QryOPSCONTO3.Value := Q.FieldByName('SCONTO3').AsDouble;
    QryOPPRZUNITNETTO.Value := Q.FieldByName('PRZUNITNETTO').AsCurrency;
    QryOPCODICEIVA.Value := Q.FieldByName('CODICEIVA').Value;
    QryOPPRZUNITIVACOMP.Value := Q.FieldByName('PRZUNITIVACOMP').AsCurrency;
    QryOPPRZUNITNETTOIVACOMP.Value := Q.FieldByName('PRZUNITNETTOIVACOMP').AsCurrency;
    QryOPADDEBITA.Value := Q.FieldByName('ADDEBITA').AsString;
    QryOPINABBONAMENTO.Value := Q.FieldByName('INABBONAMENTO').AsString;
    // Se la data attuale è successiva alla risultante tra PROSSIMA - GG_AUTOSEL
    //  seleziona automaticamente l'OP come "da fare"
    if  (Q.FieldByName('GG_AUTOSEL').AsInteger <> 0)
    and (Q.FieldByName('PROSSIMA').IsNotNull)
    and (Now >= (Q.FieldByName('PROSSIMA').AsDateTime - Q.FieldByName('GG_AUTOSEL').AsInteger))
    then QryOPDAEFFETTUARE.Value := 'T';
    // Post
    QryOP.Post;
    // Chiude la query
    Q.Close;
  finally
    // Uso questo flag per disabilitare l'aggiunta o la rimozione
    //  delle OP nei ricambi/manodopera (documentoCollegato) perchè
    //  è giusto così e perchè altrimenti faceva una cosa inutile e lenta
    fUpdatingOpFromDoc := False;
    // Pulizie finali
    Q.Free;
  end;
end;


procedure TImpegnoForm.QryImpIDChange(Sender: TField);
begin
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    QryImpID.OnChange := nil;
    if QryImpID.IsNull
    then begin
      PreventiviOrdiniForm.QryDocumentoNUMORDPREV.Clear;
      PreventiviOrdiniForm.QryDocumentoBARCODE.Clear;
    end else begin
      PreventiviOrdiniForm.QryDocumentoNUMORDPREV.Value := QryImpID.Value;
      PreventiviOrdiniForm.QryDocumentoBARCODE.Value := '11' + QryImpID.AsString;
    end;
    QryImpID.OnChange := QryImpIDChange;
  end;
end;

procedure TImpegnoForm.QryImpREGISTROChange(Sender: TField);
begin
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    QryImpREGISTRO.OnChange := nil;
    if QryImpREGISTRO.IsNull
    then PreventiviOrdiniForm.QryDocumentoREGISTRO.Clear
    else PreventiviOrdiniForm.QryDocumentoREGISTRO.Value := QryImpREGISTRO.Value;
    QryImpREGISTRO.OnChange := QryImpREGISTROChange;
  end;
end;

procedure TImpegnoForm.BitBtnDestinazioneMerciClick(Sender: TObject);
begin
   DM1.SelezionaCliente(PreventiviOrdiniForm.QryDocumentoCodiceDestMerci, PreventiviOrdiniForm.QryDocumentoPRATICA, PreventiviOrdiniForm.QryDocumentoDATAPRATICA1, '');
end;

procedure TImpegnoForm.MenuStampePopup(Sender: TObject);
begin
  AllegatiFG1.Visible := ImpiantoIsCaldaia;
end;

procedure TImpegnoForm.DBEditStatoDocumentoChange(Sender: TObject);
begin
   DBEditStatoDocumento.Font.Color := DM1.StrToColor(PreventiviOrdiniForm.QryDocumentoStatoForeground.Value, clBlack);
   DBEditStatoDocumento.Color      := DM1.StrToColor(PreventiviOrdiniForm.QryDocumentoStatoBackground.Value, clSilver);
end;

procedure TImpegnoForm.QryImpBeforePost(DataSet: TDataSet);
begin
  // IMposta il colore dell'evento
  //  NB: Solo se il campo è NULL altrimenti tiene il colore che c'è
  if QryImpLABELCOLOR.IsNull then
  begin
    if QryImpTIPOIMPEGNO.AsString = 'Generico' then
      ImpegnoForm.QryImpLABELCOLOR.Value := DM1.AgContentGenerico.Color
    else
    if (not QryImpPRATICA.IsNull) and (QryImpPRATICA.AsInteger > 0) then
      ImpegnoForm.QryImpLABELCOLOR.Value := DM1.AgContentImpianto.Color
    else
      ImpegnoForm.QryImpLABELCOLOR.Value := DM1.AgContentNoImpianto.Color;
  end;
end;

procedure TImpegnoForm.DbeArticoloPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if not RxSpeedModifica.down then Exit;
       // Visualizza la form che permette di selezionare l'articolo da inserire
       //  nel documento.
       Application.CreateForm(TArticoliForm, ArticoliForm);
       ArticoliForm.Parent := MainForm;
       ArticoliForm.Tag := 991;   // Abilita la seleziona dell'articolo
       ArticoliForm.Show;
end;

procedure TImpegnoForm.SetTipoInterventoVisible(const Value: Boolean);
begin
  fTipoInterventoVisible := Value;
  // Inizializza a tutto invisibile
  LabelTipoIntervento.Visible := Value;
  DBETipoIntervento.Visible := Value;
end;

procedure TImpegnoForm.SetLuogoAppuntamentoVisible(const Value: Boolean);
begin
  fLuogoAppuntamentoVisible := Value;
  LabelLuogoAppuntamento.Visible := Value;
  DBELuogo.Visible := Value;
end;

procedure TImpegnoForm.SelezionaDeselezionaAppTutti(const ASeleziona: Boolean);
var
  LBookmark: TBookmark;
begin
  QryPratApp.DisableControls;
  LBookmark := QryPratApp.GetBookmark;
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    QryPratApp.First;
    while not QryPratApp.Eof do
    begin
      QryPratApp.Edit;
      QryPratAppSELECTED.AsString := IfThen(ASeleziona, 'T', 'F');
      QryPratApp.Post;
      QryPratApp.Next;
    end;
  finally
    DM1.CloseWait;
    QryPratApp.GotoBookmark(LBookmark);
    QryPratApp.FreeBookmark(LBookmark);
    QryPratApp.EnableControls;
  end;
end;

procedure TImpegnoForm.SetAgenteVisible(const Value: Boolean);
begin
  fAgenteVisible := Value;
  LabelAgente.Visible := Value;
  DbeAgente.Visible := Value;
end;

procedure TImpegnoForm.SetArticoloVisible(const Value: Boolean);
begin
  fArticoloVisible := Value;
  LabelArticolo.Visible := Value;
  DbeArticolo.Visible := Value;
  DbeDescrizioneArticolo.Visible := Value;
end;

procedure TImpegnoForm.QryImpAGENTEChange(Sender: TField);
begin
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    QryImpAGENTE.OnChange := nil;
    if QryImpAGENTE.IsNull
    then begin
      PreventiviOrdiniForm.QryDocumentoAGENTE.Clear;
    end else begin
      PreventiviOrdiniForm.QryDocumentoAGENTE.Value := QryImpAGENTE.Value;
    end;
    QryImpAGENTE.OnChange := QryImpAgenteChange;
  end;
end;

// Carica le caption dei vari campi
procedure TImpegnoForm.CaricaTitoli;
var
  M: TMemIniFile;
  Sez:String;
begin
  Sez := 'TitoliImpegno';
  M := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    // Tabs Per spostarsi tra le varie sezini dell'intervento
    TabControlPagineDocumento.Tabs[DOCTABIDX_APPUNTAMENTO].Caption          := M.ReadString(Sez, 'Tabs_Appuntamento', 'Appuntamento/Intervento');
    TabControlPagineDocumento.Tabs[DOCTABIDX_RICAMBIMANODOPERA].Caption     := M.ReadString(Sez, 'Tabs_RicambiManodopera', 'Ricambi/Manodopera');
    TabControlPagineDocumento.Tabs[DOCTABIDX_OPERAZIONIPIANIFICATE].Caption := M.ReadString(Sez, 'Tabs_OperazioniPianificate', 'Operazioni pianificate');
    TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Caption              := M.ReadString(Sez, 'Tabs_Allegati', 'Allegati');
    // Dati documento
    LabelCantiere.Caption  := DM1.DatiDocumento_LabelPratica;
    LabelCantiere2.Caption := LabelCantiere.Caption;
    LabelAzioneCantiere.Caption := DM1.DatiDocumento_LabelAzionePratica;
    // Soggetto
    LabelPanelDestinatario.Caption := ' ' + M.ReadString(Sez, 'Soggetto_PanelTitle', 'SOGGETTO');
    // Destinazione merce
    LabelPanelDestinazioneMerce.Caption := ' ' + M.ReadString(Sez, 'DestinazioneMerce_PanelTitle', 'DESTINAZIONE DELLA MERCE');
    // Chiamata
    LabelMotivoChiamata.Caption := M.ReadString(Sez, 'Chiamata_LabelMotivoDellaChiamata', 'Motivo della chiamata:');
    LabelTipoIntervento.Caption := M.ReadString(Sez, 'Chiamata_LabelTipoIntervento', 'Tipo intervento');
    // Appuntamento
    LabelLuogoAppuntamento.Caption := M.ReadString(Sez, 'Appuntamento_LabelLuogo', 'Luogo');
    LabelTecnico.Caption := M.ReadString(Sez, 'Appuntamento_LabelTecnico', 'Tecnico');
    LabelArticolo.Caption := M.ReadString(Sez, 'Appuntamento_LabelArticolo', 'Articolo');

    // SubPanel Agenti
//    LabelAgente.Caption  := M.ReadString(Sez, 'Appuntamento_LabelAgente', 'Agente');
    // Agente 1
    LabelAgente.Caption  := DM1.GridsColumnAgenteCaption;
    dbeAgente.Visible    := (DM1.GridsColumnAgenteCaption <> '');
    if DM1.AgenteEditable then dbeAgente.Properties.DropDownListStyle := lsEditList else dbeAgente.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 2
    LabelAgente2.Caption := DM1.GridsColumnAgente2Caption;
    dbeAgente2.Visible   := (DM1.GridsColumnAgente2Caption <> '');
    if DM1.Agente2Editable then dbeAgente2.Properties.DropDownListStyle := lsEditList else dbeAgente2.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 3
    LabelAgente3.Caption := DM1.GridsColumnAgente3Caption;
    dbeAgente3.Visible   := (DM1.GridsColumnAgente3Caption <> '');
    if DM1.Agente3Editable then dbeAgente3.Properties.DropDownListStyle := lsEditList else dbeAgente3.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 4
    LabelAgente4.Caption := DM1.GridsColumnAgente4Caption;
    dbeAgente4.Visible   := (DM1.GridsColumnAgente4Caption <> '');
    if DM1.Agente4Editable then dbeAgente4.Properties.DropDownListStyle := lsEditList else dbeAgente4.Properties.DropDownListStyle := lsEditFixedList;
    // Se almeno uno dei campi agente è attivo e se il pannello è autorizzato a visualizzarsi, si visualizza
    PanelAgenti.Visible  := (   dbeAgente2.Visible or dbeAgente3.Visible or dbeAgente4.Visible   );
    // Se il pannello agenti non deve essere visualizzato ridimensiona anche il MainPanel
    if not PanelAgenti.Visible then begin
      PanelAppuntamento.Height  := PanelAppuntamento.Height - PanelAgenti.Height;
    end;

    // Intervento
    LabelPanelIntervento.Caption := ' ' + M.ReadString(Sez, 'Intervento_PanelTitle', 'RAPPORTO INTERVENTO');
    // InterventI precedenti
    LabelPanelInterventiPrecedenti.Caption := ' ' + M.ReadString(Sez, 'InterventiPrecedenti_PanelTitle', 'RAPPORTO INTERVENTO');
    // Button Crea Intervento
    SBCreaIntervento.Caption := M.ReadString(Sez, 'CreaIntervento_ButtonCaption', 'Crea Rapporto di Intervento');
  finally
    M.Free;
  end;
end;

procedure TImpegnoForm.QryImpAGENTE2Change(Sender: TField);
begin
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    QryImpAGENTE2.OnChange := nil;
    if QryImpAGENTE2.IsNull
    then begin
      PreventiviOrdiniForm.QryDocumentoAGENTE2.Clear;
    end else begin
      PreventiviOrdiniForm.QryDocumentoAGENTE2.Value := QryImpAGENTE2.Value;
    end;
    QryImpAGENTE2.OnChange := QryImpAgente2Change;
  end;
end;

procedure TImpegnoForm.QryImpAGENTE3Change(Sender: TField);
begin
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    QryImpAGENTE3.OnChange := nil;
    if QryImpAGENTE3.IsNull
    then begin
      PreventiviOrdiniForm.QryDocumentoAGENTE3.Clear;
    end else begin
      PreventiviOrdiniForm.QryDocumentoAGENTE3.Value := QryImpAGENTE3.Value;
    end;
    QryImpAGENTE3.OnChange := QryImpAgente3Change;
  end;
end;

procedure TImpegnoForm.QryImpAGENTE4Change(Sender: TField);
begin
  // Se c'è un documento collegato lo aggiorna
  if PreventiviOrdiniForm <> nil then begin
    QryImpAGENTE4.OnChange := nil;
    if QryImpAGENTE4.IsNull
    then begin
      PreventiviOrdiniForm.QryDocumentoAGENTE4.Clear;
    end else begin
      PreventiviOrdiniForm.QryDocumentoAGENTE4.Value := QryImpAGENTE4.Value;
    end;
    QryImpAGENTE4.OnChange := QryImpAgente4Change;
  end;
end;

procedure TImpegnoForm.QryImpIDPRATICAChange(Sender: TField);
begin
  // Riapre la query con i dati degli apparecchi da usare nelle OP
  ApriQueryApparecchiPratica;
  // Importa le operazioni pianificate della pratica appena impostata
  ImportaOpPratica(Sender.AsInteger);
end;

procedure TImpegnoForm.AggiornaOP1Click(Sender: TObject);
begin
  if DM1.Messaggi('Levante', 'Confermi di voler aggiornare la situazione delle operazioni pianificate dell''impianto in base ai dati inseriti in questo interveno?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    AggiornaOpPraticaFatte;
  finally
    DM1.CloseWait;
  end;
end;

// Apre la query con i parametri di stampa del foglio di lavoro
procedure TImpegnoForm.ApriQueryParametriFoglioLavoro;
begin
  if QryParamFoglioLavoro.Active then QryParamFoglioLavoro.Close;
  QryParamFoglioLavoro.Prepare;
  QryParamFoglioLavoro.Params.ParamByName('ID_PRATICA').AsInteger := QryImpIDPRATICA.AsInteger;
  QryParamFoglioLavoro.Open;
end;



procedure TImpegnoForm.btvOPULTIMAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // Se il campo è 0 restituisce una stringa vuota altrimenti
  //  mi visualizzava una data del 1899 perchè il valore del campo
  //  Datetime = 0
  if (VarIsNull(ARecord.Values[Sender.Index])) or (ARecord.Values[Sender.Index] = 0)
  then AText := '';
end;

// Procedure che visualizza la form di conferma dell'intervento con anche
//  i dati per l'aggiornamento delle operazioni pianificate dell'impianto.
function TImpegnoForm.ConfermaModificheOP: TModalResult;
begin
  // Inizializzazione
  Result := mrNone;
  // Crea la form, ne imposta alcune proprietà
  Application.CreateForm(TAggiornaOpForm, AggiornaOpForm);
  try
    AggiornaOPForm.ImpDataSet := QryImp;
    AggiornaOpForm.SourceDataSet := QryOP;
    AggiornaOpForm.PratDataSet := QryAss;
    AggiornaOpForm.PratApparecchiDataSet := QryPratApp;
    AggiornaOpForm.Prepare(FChiusuraAutomatica);
    // Visualizza la form
    if not FChiusuraAutomatica then
      Result := AggiornaOpForm.ShowModal
    else
      Result := mrYes;
  finally
    // Pulizie finali
    FreeAndNil(AggiornaOpForm);
  end;
end;

procedure TImpegnoForm.dbeRifDoc_RegDocPropertiesInitPopup(
  Sender: TObject);
var
   Qry:TIB_Cursor;
begin
   // Crea la query che fornirà l'elenco dei registri disponibili
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT Registro FROM ProgReg');
      Qry.Open;
      // Carica i registri nelle items del componente
      dbeRifDoc_RegDoc.Properties.Items.Clear;
      dbeRifDoc_RegDoc.Properties.Items.Add('');
      while not Qry.Eof do begin
         dbeRifDoc_RegDoc.Properties.Items.Add(Qry.FieldByName('Registro').Value);
         Qry.Next;
      end;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

procedure TImpegnoForm.QryOPBeforePost(DataSet: TDataSet);
begin
  // Imposta alcuni ID nel caso non fossero valorizzati
  if QryOPID.AsInteger = 0 then QryOPID.Value := DM1.Generators_NextGenID('GEN_ID_OPIMPEGNO');
  if QryOPIDIMPEGNO.AsInteger = 0 then QryOPIDIMPEGNO.Value := -9999;  // Valore prossivorio
end;

procedure TImpegnoForm.TabControlPagineDocumentoChange(Sender: TObject);
begin
  // In base al tab selezionato dall'utente...
  case (Sender as TcxTabControl).TabIndex of
    // ----- Tab Appuntamento
    DOCTABIDX_APPUNTAMENTO:
    begin
      PageControlPagineDocumento.ActivePage := TabAppuntamento;
    end;
    // ----- Tab Ricambi/Manodopera
    DOCTABIDX_RICAMBIMANODOPERA:
    begin
      PreventiviOrdiniForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_RICAMBIMANODOPERA;
      PreventiviOrdiniForm.Show;
      // Proprietà che se messa a True fa in modo che alla prossima chiamata della procedure
      //  CaricaLayoutDocumento non vengano rielaborate le impostazioni delle colonne del documento
      //  in modo da velocizzare un pò l'esecuzione.
      PreventiviOrdiniForm.CaricaLayoutDocumento_NotLoadColumnSettingsNextTime := True;
      PreventiviOrdiniForm.CaricaLayoutDocumento;
    end;
    // ----- Tab Operazioni Pianificate
    DOCTABIDX_OPERAZIONIPIANIFICATE:
    begin
      PageControlPagineDocumento.ActivePage := TabOP;
    end;
    // ----- Tab Interventi precedenti
    DOCTABIDX_INTERVENTIPRECEDENTI:
    begin
      PageControlPagineDocumento.ActivePage := TabInterventiPrecedenti;
      // Per correggere il fatto che il tab in alcune condizioni appariva nero
      if TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color = clNone
      then TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color := clWhite;
    end;
    // ----- Tab Allegati
    DOCTABIDX_ALLEGATI:
    begin
      PageControlPagineDocumento.ActivePage := TabAllegati;
    end;
    // ----- Tab Mappa
    DOCTABIDX_MAPPA:
    begin
      PageControlPagineDocumento.ActivePage := TabMappa;
    end;
    // ----------------------
  end;
end;

procedure TImpegnoForm.PageControlPagineDocumentoChange(Sender: TObject);
var
  TmpStr: String;
begin

  // ===========================================================================
  // IN BASE ALLA PAGINA SELEZIONATA ABILITA/DISABILITA ALCUNI PULSANTI
  // ---------------------------------------------------------------------------
  // Procedure che determina quali pulsanti degli strumenti sono visibili o no
  //  in base alla situazione.
  EnableDisableToolsBtn;
  // ===========================================================================

  // ===========================================================================
  // VISUALIZZAZIONE MAPPA
  // ---------------------------------------------------------------------------
  // Se siamo nella pagina della mappa crea l'apposita form all'interno del Tab
  //  NB: Ovviamente se non esiste già
  if (PageControlPagineDocumento.ActivePage = TabMappa) and not Assigned(MapForm) then begin
    // Crea la form della mappa
    MapForm := GMap_CreateInParent(TabMappa);
    // Show della form della mappa
    MapForm.Show;
    // Visualizza la mappa
    MapForm.CreaMappa(QryImpLOCATION.AsString);
  end;
  // ===========================================================================

  // ===========================================================================
  // VISUALIZZAZIONE INTERVENTI PRECEDENTI
  // ---------------------------------------------------------------------------
  // Se siamo nella pagina degli interventi precedenti
  if (PageControlPagineDocumento.ActivePage = TabInterventiPrecedenti) then begin
    // Apre la queru che contiene l'elenco degli interventi precedenti per
    //  stesso impianto.
    DM1.ShowWait('Carico precedenti.', 'Solo un momento...');
    try
      ApriQueryElencoUltimiInterventi;
    finally
      DM1.CloseWait;
    end;
  end;
  // ===========================================================================

end;


// Procedure che determina quali pulsanti degli strumenti sono visibili o no
//  in base alla situazione.
procedure TImpegnoForm.EnableDisableToolsBtn;
begin
  // Uscita
  RxSpeedButtonUscita.Enabled     := (not RxSpeedModifica.Down);
  // Nuovo/Crea
  RxSpeedButtonNuovo.Enabled      := (not RxSpeedModifica.Down) and (PageControlPagineDocumento.ActivePage = TabAllegati);
  // Elimina
  RxSpeedButtonElimina.Enabled    := (not RxSpeedModifica.Down) and (PageControlPagineDocumento.ActivePage = TabAllegati);
  // Stampa
  RxSpeedButtonStampa.Enabled     := (not RxSpeedModifica.Down);
  // Apri/Visualizza
  RxSpeedButtonVisualizza.Enabled := (not RxSpeedModifica.Down) and (PageControlPagineDocumento.ActivePage = TabAllegati);
end;


procedure TImpegnoForm.btvAllGENCAL_COSTRUTTOREGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  Curr: String;
begin
  // MOdello
  Curr := Trim(ARecord.DisplayTexts[btvAllGENCAL_MODELLO.Index]);
  if Curr <> '' then AText := AText + '   ' + Curr;
  // Matricola
  Curr := Trim(ARecord.DisplayTexts[btvAllGENCAL_MATRICOLA.Index]);
  if Curr <> '' then AText := AText + '      (' + Curr + ')';

  // Apparecchio allegato COSTRUTTORE
  Curr := Trim(ARecord.DisplayTexts[btvAllBRUC_COSTRUTTORE.Index]);
  if Curr <> '' then AText := AText + #13 + '+' + #13 + Curr else Exit;
  // Apparecchio allegato MOdello
  Curr := Trim(ARecord.DisplayTexts[btvAllBRUC_MODELLO.Index]);
  if Curr <> '' then AText := AText + '   ' + Curr;
  // MApparecchio allegato Matricola
  Curr := Trim(ARecord.DisplayTexts[btvAllBRUC_MATRICOLA.Index]);
  if Curr <> '' then AText := AText + '      (' + Curr + ')';
end;

procedure TImpegnoForm.btvAllSTATOAVANZAMENTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Size := 7;
end;

procedure TImpegnoForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
  // Se siamo nella pagina degli allegati F e G...
  if PageControlPagineDocumento.ActivePage = TabAllegati then begin
    if btvAll.DataController.FocusedRecordIndex = (-1) then Exit;
    DM1.ShowWait('Levante', 'Apertura allegato');
    try
      Application.CreateForm(TAllegatiFGForm, AllegatiFGForm);
      MainForm.SetParentComponent(AllegatiFGForm);
      AllegatiFGForm.Tag := 1;
      AllegatiFGForm.ID := QryAllegatiID.Value;
      AllegatiFGForm.DataSourceFromImpegni := SourceImp;
      AllegatiFGForm.FieldDataOraInizioIntervento := QryImpDATAORAINTERVENTO;
      AllegatiFGForm.FieldDataOraFineIntervento   := QryImpDATAORAFINEINTERVENTO;
      AllegatiFGForm.Show;
    finally
      DM1.CloseWait;
    end;
  end;
end;

procedure TImpegnoForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Se siamo nella pagina degli allegati
  if PageControlPagineDocumento.ActivePage = TabAllegati then begin
    if DM1.Messaggi('Levante', 'Eliminare le voci selezionate?', 'NB: L''eliminazione sarà definitiva e non reversibile.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    btvAll.DataController.DeleteSelection;
  end; 
end;


// Procedure che aggiorna nel Tab delle prescrizioni il numero delle prescrizioni presenti
//  e se ce ne sono fa anche lampeggiare il riquadro

procedure TImpegnoForm.btvPrescDataControllerDataChanged(Sender: TObject);
begin
  RefreshTabPrescrizioni;
end;


// Procedure che aggiorna nel Tab degli allegati il numero degli allegati presenti
procedure TImpegnoForm.RefreshTabAllegati;
var
  V: Byte;
begin
  V := btvAll.DataController.RecordCount;
  if V = 0
  then TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Caption := 'Allegati'
  else TabControlPagineDocumento.Tabs[DOCTABIDX_ALLEGATI].Caption := 'Allegati - ' + IntToStr(V);
end;

procedure TImpegnoForm.btvAllDataControllerDataChanged(Sender: TObject);
begin
  RefreshTabAllegati;
end;

constructor TImpegnoForm.Create(AOwner: TComponent);
begin
  inherited;
  // Default value
  AgendaRefreshOnClose := True;
  FChiusuraAutomatica := False;
end;

procedure TImpegnoForm.CreazioneallegatiFG1Click(Sender: TObject);
begin
  // VIsualizza la form che permette di creare in una botta sole
  //  tutti gli allegati necessari.
  VisualizzaPreparaAllegatiForm(True);
end;

procedure TImpegnoForm.btvAllDblClick(Sender: TObject);
begin
  // Visualizza l'allegato
  if RxSpeedButtonVisualizza.Enabled then
    RxSpeedButtonVisualizzaClick(RxSpeedButtonVisualizza);
end;

procedure TImpegnoForm.AllegatiFG1Click(Sender: TObject);
var
  Preview: Boolean;
begin
  // Inizializzazione
  Preview := (MenuStampe.Tag = 0);
  // Stampa tutti gli eventuali allegati FG presenti nell'impegno
  if not Preview then DM1.ShowWait('Levante', 'Stampa allegati F/G');
  try
    StampaTuttiGliAllegatiFG(Preview);
  finally
    DM1.CloseWait;
  end;
end;


// Procedure che stampa tutti gli allegati F/G dell'impegno
procedure TImpegnoForm.StampaTuttiGliAllegatiFG(Preview:Boolean);
var
  PrecPos: TBookmark;
begin
  // Stampa tutti gli eventuali allegati FG presenti nell'impegno
  // ------------------------------------------------------------
  // Disabilita l'aggiornamento dei controlli
  QryAllegati.DisableControls;
  // Salva la posizione corrente
  PrecPos := QryAllegati.GetBookmark;
  try
    // Cicla per tutti gli eventuali alegati F/G e li stampa
    QryAllegati.First;
    while not QryAllegati.Eof do begin
      DM1.StampaAllegatoFG(QryAllegatiID.Value, Preview);
      QryAllegati.Next;
    end;
    // Ripristina la posizione precedente
    QryAllegati.GotoBookmark(PrecPos);
  finally
    // Pulizie finali
    QryAllegati.FreeBookmark(PrecPos);
    // Riabilita i controlli
    QryAllegati.EnableControls;
  end;
end;



procedure TImpegnoForm.QryIntPrecCalcFields(DataSet: TDataSet);
begin
  // Calcola i prezziunitari netti
  if QryIntPrecQTA.AsFloat <> 0 then begin
    QryIntPrecCALC_PRZUNITNETTO.Value         := DM1.Arrotonda(   (QryIntPrecIMPORTO.AsFloat / QryIntPrecQTA.AsFloat)   , DM1.DecMicroPrz);
    QryIntPrecCALC_PRZUNITIVACOMPNETTO.Value  := DM1.Arrotonda(   (QryIntPrecIMPORTOIVACOMP.AsFloat / QryIntPrecQTA.AsFloat)   , DM1.DecMicroPrz);
  end else begin
    QryIntPrecCALC_PRZUNITNETTO.Value         := 0;
    QryIntPrecCALC_PRZUNITIVACOMPNETTO.Value  := 0;
  end;
end;

procedure TImpegnoForm.btvPrecIntQTAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // IN questi casi non visualizza nulla
  if (   (not VarIsNull(ARecord.Values[Sender.Index])) and (ARecord.Values[Sender.Index] = 0)   )
  or ((ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '20-OPERAZIONE PIANIFICATA') and (Sender = btvPrecIntQTA))
  or (ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '30-RELAZIONE INTERVENTO')
  or (ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '40-OSSERVAZIONI ALLEGATO')
  then AText := '';
  // Se è una OP in abbonamento visualizza "Abb." e stiamo visualizzando un importo
//  if  (ARecord.DisplayTexts[btvPrecIntINABBONAMENTO.Index] = 'T')
//  and ((Sender = btvPrecIntCALC_PRZUNITIVACOMPNETTO) or (Sender = btvPrecIntCALC_PRZUNITNETTO))
//  then AText := 'Abb.';
end;





// Function che ritorna True se il record ricevuto è l'ultimo di un intervento
//  per poi disegnare la linea di separazione dai dati del prossimo intervento
function TImpegnoForm.UltimoRecordIntervento(CurrRecord:TcxCustomGridRecord): Boolean;
var
  NextRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Se è l'ultimo record in assoluto è evidentemente anche l'ultimo
  //  record tra i records abbinati e quindi...
  if CurrRecord.IsLast then begin
    Result := True;
    Exit;
  end;
  // Altrimenti controlliamo se il prossimo record è riferito allo stesso
  //  intervento dell'attuale.
  NextRecord := CurrRecord.ViewData.Records[CurrRecord.Index + 1];
  Result := (CurrRecord.DisplayTexts[btvPrecIntMASTER_ID.Index] <> NextRecord.DisplayTexts[btvPrecIntMASTER_ID.Index]);
end;



procedure TImpegnoForm.btvPrecIntAPPARECCHIO_FULLGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if Trim(AText) = '()' then
    AText := '';
end;

procedure TImpegnoForm.btvPrecIntCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Column: TcxGridDBBandedColumn;
  R: TRect;
  DrawTextFlags: Integer;
  PrecBrushColor: TColor;
begin
  // Inizializzazione
  ADone := True;
  Column := AViewInfo.Item as TcxGridDBBandedColumn;
  ACanvas.Font.Name  := 'Arial';
  ACanvas.Font.Size  := 7;
  ACanvas.Font.Color := clBlack;

  // Se è una riga di Operazioni pianificate...
  if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '20-OPERAZIONE PIANIFICATA') then begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Color := clGray;
  // Se è una riga di Analisi Fumi
  end else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '15-ANALISI FUMI ALLEGATO') then begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Color := clGray;
  // Se è una riga di Relazione Intervento
  end else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '10-RELAZIONE INTERVENTO') then begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Color := clBlack;
  // Se è una riga di Osservazioni
  end else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '40-OSSERVAZIONI ALLEGATO') then begin
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Color := clBlack;
    ACanvas.Brush.Color := $00EFEFEF;
  end;

  // Se è la colonna del prezzo unitario oppure della Qtà...
  if (AviewInfo.Item.Index = btvPrecIntCALC_PRZUNITNETTO.Index) or (AviewInfo.Item.Index = btvPrecIntQTA.Index) then begin
    ACanvas.Font.Color := clGray;
    ACanvas.Font.Style := [];
  end;

  // Imposta i parametri e traccia il contenuto della cella
  AviewInfo.EditViewInfo.Font := ACanvas.Font;
  AviewInfo.EditViewInfo.TextColor := ACanvas.Font.Color;
  AviewInfo.EditViewInfo.BackgroundColor := ACanvas.Brush.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas); // Paint the default cell's contents

  // Se è l'ultima riga prima di un cambio apparecchio disegna una linea di separazione
  //  NB: Se c'è un solo apparecchio non traccia la linea di separazione (potrebero esserci
  //      alcune OP generiche per l'impianto e altre specifiche per apparecchio).
  if  (not AViewInfo.GridRecord.IsLast)
  and (AViewInfo.GridRecord.DisplayTexts[btvPrecIntIDAPPARECCHIOPRAT.Index] <> Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex+1, btvPrecIntIDAPPARECCHIOPRAT.Index])
  and (AViewInfo.GridRecord.DisplayTexts[btvPrecIntMASTER_ID.Index] = Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex+1, btvPrecIntMASTER_ID.Index])
  then begin
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
  end;
end;

procedure TImpegnoForm.btvPrecIntCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 15;
var
  R: TRect;
  TmpStr: String;
  CurrColor: TColor;
begin
  // Inizializzazione
  ADone := True;
  R := AViewInfo.TextAreaBounds;
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;
  // Rif. + TipoDocumento
  TmpStr := '   Rif. ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntTIPODOC.Index] + ' del ';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Data documento
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntDATADOC.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;

  // Riferimento a Ricevuta Fiscale o altro documento
  if (Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntRIFDOC_NUM.Index] <> '') then begin
    TmpStr := '('
              + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntRIFDOC_TIPO.Index]
              + ' n° '
              + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntRIFDOC_NUM.Index]
              + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntRIFDOC_REG.Index]
              + ' del '
              + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntRIFDOC_DATA.Index]
              + '   '
              + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntRIFDOC_TOTALEDOCUMENTO.Index]
              + ')';
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  end;

  // Tecnico
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntTECNICO_NOME.Index] + '   ';
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
  // Label Tecnico:
  TmpStr := 'Tecnico:';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
end;

procedure TImpegnoForm.btvPrecIntDataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
var
  Date1, Date2: TDateTime;
begin
  // Se sta ordinando per Master_ID (perchè è grouped) lo forza a tenere
  //  in considerazione anche le date perchè altrimenti in alcuni casi
  //  scazzava l'ordinamento deu precedenti
  if (AItemIndex = btvPrecIntMASTER_ID.Index) then begin
    Date1 := ADataController.Values[ARecordIndex1,btvPrecIntDATADOC.Index];
    Date2 := ADataController.Values[ARecordIndex2,btvPrecIntDATADOC.Index];
    if Date1 = Date2
    then Compare := VarCompare(V1, V2)
    else Compare := VarCompare(Date1, Date2);
  // In tutti gli altri casi procede normalmente
  end else begin
    Compare := VarCompare(V1, V2);
  end;
end;

procedure TImpegnoForm.btvPrescDESCRIZIONECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ADone := True;
  // Grassetto in ogni caso
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [fsBold];
  // Se è una prescrizione scrive in rosso
  if Pos('PRESCRIZIONI', AViewInfo.GridRecord.DisplayTexts[btvPrescTIPORECORD.Index]) <> 0 then begin
    ACanvas.Font.Color := clRed;
  end;
  // Imposta i parametri e traccia il contenuto della cella
  AviewInfo.EditViewInfo.Font := ACanvas.Font;
  AviewInfo.EditViewInfo.TextColor := ACanvas.Font.Color;
  AViewInfo.EditViewInfo.BackgroundColor := Sender.Styles.Content.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Disegna la riga di separazione inferione
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
end;























procedure TImpegnoForm.btvPrescEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  AAllow := (AItem.Index = btvPrescRISOLTO.Index) and (RxSpeedModifica.Down);
end;


// Procedure che marca le raccomandazioni/prescrizione come fatte/risolte
procedure TImpegnoForm.MarcaPrescrizioniComeFatte;
var
  DC: TcxCustomDataController;
  i: Integer;
  TipoRecord: String;
begin
  // Inizializzazione
  DC := btvPresc.DataController;
  // CIcla per tutti i record
  for i := 0 to DC.RecordCount -1 do begin
    // Se la prescrizione/raccomandazione attuale è stata selesionata dall'utente
    //  come fatta/risolta provvede a marcarca altrimenti la salta
    if (not VarIsNull(DC.Values[i,btvPrescRISOLTO.Index])) and (DC.Values[i,btvPrescRISOLTO.Index] = True) then begin
      // Carica il Tipo record del record attuale
      TipoRecord := DC.Values[i,btvPrescTIPORECORD.Index];
      // Se è una raccomandazione di un impegno
      if      TipoRecord = '10-RACCOMANDAZIONI INT.' then
        DM2.RaccomandazioniImpegno_MarcaComeFatta(DC.Values[i,btvPrescIDIMPEGNO.Index], DC.Values[i,btvPrescFATTO_DATA.Index], DC.DisplayTexts[i,btvPrescFATTO_NOTE.Index])
      else
      // Se è una prescrizione di un impegno
      if TipoRecord = '20-PRESCRIZIONI INT.' then
        DM2.PrescrizioniImpegno_MarcaComeFatta(DC.Values[i,btvPrescIDIMPEGNO.Index], DC.Values[i,btvPrescFATTO_DATA.Index], DC.DisplayTexts[i,btvPrescFATTO_NOTE.Index])
      else
      // Se è una raccomandazione di un allegato
      if TipoRecord = '30-RACCOMANDAZIONI ALL' then
        DM2.RaccomandazioniAllegato_MarcaComeFatta(DC.Values[i,btvPrescIDALLEGATO.Index], DC.Values[i,btvPrescFATTO_DATA.Index], DC.DisplayTexts[i,btvPrescFATTO_NOTE.Index])
      else
      // Se è una prescrizione di un allegato
      if TipoRecord = '40-PRESCRIZIONI ALL' then
        DM2.PrescrizioniAllegato_MarcaComeFatta(DC.Values[i,btvPrescIDALLEGATO.Index], DC.Values[i,btvPrescFATTO_DATA.Index], DC.DisplayTexts[i,btvPrescFATTO_NOTE.Index]);
    end;
  end;
end;


// Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
//  di un abbinamento.
//  NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
//       relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
procedure TImpegnoForm.RefreshElencoAbbinatiPrincipali;
var
  PrecPos: TBookmark;
  Quanti: Integer;
begin
  SetLength(ElencoAbbinatiPrincipali, 0);
  QryPratApp.DisableControls;
  PrecPos := QryPratApp.GetBookmark;
  try
    QryPratApp.First;
    while not QryPratApp.Eof do begin
      if (QryPratAppIDAPPABBINATO.AsInteger <> 0) and (QryPratAppDISMESSO.AsString <> 'T') then begin
        Quanti := Length(ElencoAbbinatiPrincipali);
        SetLength(ElencoAbbinatiPrincipali, Quanti+1);
        ElencoAbbinatiPrincipali[Quanti] := QryPratAppIDAPPABBINATO.AsInteger;
      end;
      QryPratApp.Next;
    end;
  finally
    QryPratApp.GotoBookmark(PrecPos);
    QryPratApp.FreeBookmark(PrecPos);
    QryPratApp.EnableControls;
  end;
end;



procedure TImpegnoForm.QryPratAppCalcFields(DataSet: TDataSet);
var
  InGaranzia, TmpStr, TmpStr2: String;
begin
  // Imposta i campi per l'ordinamento in modo che se un apparecchio è abbinato ad un altro
  //  venga sempre messo vicino ma dopo l'apparecchio principale
  if QryPratAppIDAPPABBINATO.IsNull or (QryPratAppIDAPPABBINATO.AsInteger = 0) or (QryPratAppDISMESSO.AsString = 'T') then
  begin
    QryPratAppCOMPUTED_ORDER1.Value   := QryPratAppID.Value;
    QryPratAppCOMPUTED_ORDER2.Value   := 0;
    QryPratAppCOMPUTED_ABBINATO.Value := IntegerInArray(QryPratAppCOMPUTED_ORDER1.Value, ElencoAbbinatiPrincipali);
  end
  else
  begin
    QryPratAppCOMPUTED_ORDER1.Value   := QryPratAppIDAPPABBINATO.Value;
    QryPratAppCOMPUTED_ORDER2.Value   := QryPratAppID.Value;
    QryPratAppCOMPUTED_ABBINATO.Value := True;
  end;


  // Se però l'apparecchio è marcato come "Sostituito/Non più un uso"
  //  allora non lo considera più come abbinato anche se eventualmente lo era
  //  in modo da riuscire a mettere in fondo alla lista gli apparecchi sostituiti.
  if QryPratAppDISMESSO.AsString = 'T' then QryPratAppCOMPUTED_ABBINATO.Value := False;




  // Costruisce la descrizione completa dell'apparecchio da usare poi come riferimento
  //  allapparecchio stesso
  QryPratAppCOMPUTED_APPARECCHIO_FULL.Value := Trim(QryPratAppCOSTRUTTORE.AsString + ' ' + QryPratAppMODELLO.AsString + ' (' + QryPratAppMATRICOLA.AsString + ') ' + QryPratAppUBICAZIONE.AsString);
  // Costruisce la descrizione dell'apparecchio ma senza l'ubicazioneda usare poi come riferimento
  //  allapparecchio stesso
  QryPratAppCOMPUTED_APPARECCHIO_NOUBICAZ.Value := Trim(QryPratAppCOSTRUTTORE.AsString + ' ' + QryPratAppMODELLO.AsString + ' ' + QryPratAppMATRICOLA.AsString);

  // Calcola il flag che indica se l'apparecchio è ancora in garanzia oppure no
  if QryPratAppGARANZIA_SCADENZA.IsNull then QryPratAppCOMPUTED_INGARANZIA.Value := 'N'
  else if Now > QryPratAppGARANZIA_SCADENZA.AsDateTime then QryPratAppCOMPUTED_INGARANZIA.Value := 'F'
  else QryPratAppCOMPUTED_INGARANZIA.Value := 'T';

  // ===========================================================================
  // COSTRUZIONE TESTO GARANZIA
  // ---------------------------------------------------------------------------
  // Inizializzazione variabili appoggio
  InGaranzia :=  QryPratAppCOMPUTED_INGARANZIA.Value;
  // Se l'apparecchio è in uso e quindi non è dismesso
  if QryPratAppDISMESSO.AsString <> 'T' then begin

    // Se le info ci sono e l'apparecchio è ancora in garanzia...
    if InGaranzia = 'T' then begin
      TmpStr  := QryPratAppGARANZIA_MESI.AsString;
      TmpStr2 := QryPratAppGARANZIA_MESI_ESTENSIONE.AsString;
      if TmpStr2 <> '' then TmpStr := TmpStr + '>' + TmpStr2;
      if TmpStr <> '' then TmpStr := ' (' + TmpStr + ')';
      TmpStr := 'IN GARANZIA' + TmpStr + ' fino al ' + QryPratAppGARANZIA_SCADENZA.AsString;
    // Se invece le info ci sono e l'apparecchio NON è ancora in garanzia...
    end else if InGaranzia = 'F' then begin
      TmpStr := 'Garanzia SCADUTA dal ' + QryPratAppGARANZIA_SCADENZA.AsString;
    // Se invece non ci sono info sufficienti a determinare la garanzia...
    end else begin
      TmpStr := 'Scadenza garanzia non determinata';
    end;
    // Assegna al campo il calore ottenuto
    QryPratAppCOMPUTED_GARANZIA.Value := TmpStr;
    // Note Garanzia
    QryPratAppCOMPUTED_GARANZIA_NOTE.Value := QryPratAppGARANZIA_NOTE.AsString;

  // Se invece l'apparecchio attuale è stato dismesso
  end else begin

    // Costruisce il testo della garanzia
    QryPratAppCOMPUTED_GARANZIA.Value := 'DISMESSO dal ' + QryPratAppDISMESSO_DATA.AsString;
    // Costruisce il testo delle note garanzia
    QryPratAppCOMPUTED_GARANZIA_NOTE.Value := QryPratAppDISMESSO_NOTE.AsString;

  end;
  // ===========================================================================
end;

function TImpegnoForm.IntegerInArray(const Value:Integer; const ArrayOfInteger : array of Integer): Boolean;
var
 i: Integer;
begin
  Result := False;
  for i := 0 to Length(ArrayOfInteger) -1 do begin
    if Value = ArrayOfInteger[i] then begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TImpegnoForm.btvOPCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
  CurrColor: TColor;
begin
  // Inizializzazione
  ADone := True;
  R := AViewInfo.TextAreaBounds;
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Se questo grup non è relativo a nessun apparecchio lo disegna diverso
  if VarIsNull(AViewInfo.GridRecord.Values[btvOPIDAPPARECCHIOPRAT.Index]) or (AViewInfo.GridRecord.Values[btvOPIDAPPARECCHIOPRAT.Index] = 0) then begin
    TmpStr := 'Generiche per tutto l''impianto';
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignHCenter or cxAlignBottom);
    Exit;
  end;

  // Tipo apparecchio
  TmpStr := '   ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvOPTIPOAPPARECCHIO.Index] + ':';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Apparecchio
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvOPCOSTRUTTORE.Index] + '   ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvOPMODELLO.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO + SPAZIO;
  // Label Matricola
  TmpStr := 'Matricola:';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Matricola
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvOPMATRICOLA.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Le prossime a DX
  R.Left := R.Right - 120;
  R.Right := R.Right - 5;
  // Label Ubicazione:
  TmpStr := 'Dove:';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Ubicazione
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvOPUBICAZIONE.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
end;

procedure TImpegnoForm.btvOPCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  // Se la OP attuale è selezionata come da fare lo evidenzia in rosso
  if AViewInfo.GridRecord.Values[btvOPDAEFFETTUARE.Index] = 'T'
  then ACanvas.Font.Color := clRed;
  // Se la OP attuale è marcata come fatta la evidenzia in verde
  if AViewInfo.GridRecord.Values[btvOPEFFETTUATA.Index] = 'T'
  then ACanvas.Font.Color := $0000A600;
end;

procedure TImpegnoForm.btvPrescCODICECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
begin
  // Inizializzazione
  ADone := True;
  R := AViewInfo.TextAreaBounds;
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 7;
  ACanvas.Brush.Color := Sender.Styles.Content.Color;

  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  // Tipo
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrescCODICE.Index] + ' del';
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := clGray;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Data
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrescDATADOC.Index];
//  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Label Tecnico
  TmpStr := 'Tecnico:';
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := clGray;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Tecnico
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrescTECNICO_NOME.Index];
//  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Le prossime a DX
  R.Right := R.Right - 5;
  // Apparecchio
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrescIDAPPARECCHIOPRAT.Index];
//  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
  // Label Apparecchio:
  TmpStr := 'Apparecchio:';
  ACanvas.Font.Color := clGray;
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
end;

procedure TImpegnoForm.btvPrescRISOLTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ADone := True;
  // Lo sfondo è fisso e non fa vedere la selezione
  AViewInfo.EditViewInfo.BackgroundColor := AViewInfo.Item.Styles.Content.Color;
  // Imposta i parametri e traccia il contenuto della cella
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Disegna la riga di separazione inferione
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TImpegnoForm.btvOPPRZUNITGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // NOn visualizza gli zeri
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0) then
    AText := '';
  // Se la OP è compresa nell'abbonamento e ovviamente l'impianto è sotto contratto...
  if  (VarToStr(ARecord.Values[btvOPINABBONAMENTO.Index]) = 'T') and (QryAssCONTRATTO_STATO.AsString = 'T') then
    AText := '';
end;







// =============================================================================
// INIZIO - PARTE CHE AGGIORNA LE OP NEL DOCUMENTO DALL'IMPEGNO
// -----------------------------------------------------------------------------
procedure TImpegnoForm.OP_RifContratto_Check;
var
  LDescrizione: String;
  LAbbonamento, LManutenzione, LSetImportoRinnovo: Boolean;
begin
  // Flag che indica se siamo attualmente in fase di modifica di una OP da parte
  //  di un rigo del documento collegato, nel qual caso fa in modo che non si inneschi
  //  un ciclo infinito.
  // Se non c'è il documento collegato esce subito
  if fUpdatingOpFromDoc or (PreventiviOrdiniForm = nil) or (QryAssPRM_AUTODOC_RIFCONTRATTO.AsString = 'F') then
    Exit;
  // Messaggio di attesa
  DM1.Attendere;
  try
    LAbbonamento := (QryAssCONTRATTO_STATO.AsString = 'T');
    LManutenzione := DBETipoIntervento.Items[1].Checked;
    LSetImportoRinnovo := (QryAssPRM_AUTODOC_DICITURA.AsString = 'F');
    // Riga riferimento al contratto (se in abbonamento e si tratta di un intervento di manutenzione)
    PreventiviOrdiniForm.OP_RifContratto_Check(LAbbonamento and LManutenzione, LSetImportoRinnovo);
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TImpegnoForm.OP_RifContratto_Dicitura_Check;
var
  LDescrizione: String;
  LAbbonamento, LManutenzione, LSetImportoRinnovo: Boolean;
begin
  // Flag che indica se siamo attualmente in fase di modifica di una OP da parte
  //  di un rigo del documento collegato, nel qual caso fa in modo che non si inneschi
  //  un ciclo infinito.
  // Se non c'è il documento collegato esce subito
  if fUpdatingOpFromDoc or (PreventiviOrdiniForm = nil) or (QryAssPRM_AUTODOC_DICITURA.AsString = 'F')
    or (QryAssPRM_AUTODOC_DICITURATXT.AsString.Trim.IsEmpty) then
    Exit;
  // Messaggio di attesa
  DM1.Attendere;
  try
    LAbbonamento := (QryAssCONTRATTO_STATO.AsString = 'T');
    LManutenzione := DBETipoIntervento.Items[1].Checked;
    LSetImportoRinnovo := (QryAssPRM_AUTODOC_DICITURA.AsString = 'T');
    // Riga riferimento al contratto (se in abbonamento e si tratta di un intervento di manutenzione)
    PreventiviOrdiniForm.OP_RifContrattoDicitura_Check(LAbbonamento and LManutenzione, LSetImportoRinnovo);
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TImpegnoForm.OP_Check;
var
  LDescrizione: String;
  LAbbonamento: Boolean;
  LPrzUnit, LPrzUnitNettoIC, LSconto1, LSconto2, LSconto3: Double;
begin
  // Flag che indica se siamo attualmente in fase di modifica di una OP da parte
  //  di un rigo del documento collegato, nel qual caso fa in modo che non si inneschi
  //  un ciclo infinito.
  // Se non c'è il documento collegato esce subito
  // NB: Anche se nell'anagrafica dell'impianto si è scelto di NON incluedere le OP fatte on l'apposito check
  if fUpdatingOpFromDoc or (PreventiviOrdiniForm = nil) or (QryAssPRM_AUTODOC_OPFATTE.AsString = 'F') then
    Exit;
  // ===========================================================================
  // Aggiorna il corpo del documento se opportuno
  // ---------------------------------------------------------------------------
  // Messaggio di attesa
  DM1.Attendere;
  try
    // Riga relativa alla OP corrente (se da aggiungere al documento in caso sia stata effettuata)
    if (QryOPADDEBITA.AsString = 'T') and (QryOPEFFETTUATA.AsString = 'T') then
    begin
      // Compone la descrizione del rigo relativo alla OP (se c'è più in un apparecchio
      //  e la OP corrente è relativa a un apparecchio allora ci mette anche Marca/Modello/Matricola
      LDescrizione := QryOPDESCRIZIONE.AsString;
      if (QryPratApp.RecordCount > 1) and (QryOPIDAPPARECCHIOPRAT.AsInteger <> 0) then
        LDescrizione := LDescrizione + ' (' + QryOPLookup_DESCAPPARECCHIOPRAT.AsString + ')';
      // La OP è a costo zero se è compresa nell'abbonamento e lìimpianto è esso stesso in abbonamento
      LAbbonamento := (QryAssCONTRATTO_STATO.AsString = 'T') and (QryOPINABBONAMENTO.AsString = 'T');
      // Determina importi
      if not LAbbonamento then
      begin
        LPrzUnit := QryOPPRZUNIT.AsFloat;
        LPrzUnitNettoIC := QryOPPRZUNITNETTOIVACOMP.AsFloat;
        LSconto1 := QryOPSCONTO1.AsFloat;
        LSconto2 := QryOPSCONTO2.AsFloat;
        LSconto3 := QryOPSCONTO3.AsFloat;
      end
      else
      begin
        LPrzUnit := 0;
        LPrzUnitNettoIC := 0;
        LSconto1 := 0;
        LSconto2 := 0;
        LSconto3 := 0;
      end;
      // Aggiunge la riga al documento
      PreventiviOrdiniForm.OP_AddOrUpdate(QryOPID.AsInteger, QryOPIDOP.AsString, LDescrizione, LPrzUnit, LPrzUnitNettoIC, LSconto1, LSconto2, LSconto3, QryOPCODICEIVA.AsInteger, QryOPIDAPPARECCHIOPRAT.AsInteger);
    end
    // Elimina il rigo se del caso
    else
      PreventiviOrdiniForm.OP_Delete(QryOPID.AsInteger);
  finally
    DM1.ChiudiAttendere;
  end;
  // ===========================================================================
end;

procedure TImpegnoForm.QryOPAfterPost(DataSet: TDataSet);
begin
  OP_Check;
end;

// FUnction che cerca il primo rigo del documento relativo alla OP e all'apparecchio ricevuti come parametro e ne ritorn
//  il Record Index oppure -1 se non lo trova
function TImpegnoForm.OPFromDoc_FindByOpApparecchio(DC: TcxCustomDataController; OP_ID: Integer): Integer;
var
  i: Integer;
begin
  // Inizializzazione
  Result := -1;
  // Cicla per tutti i righi
  for i := 0 to DC.RecordCount -1 do begin
    if  (not VarIsNull(DC.Values[i,btvOPID.Index]))
    and (DC.Values[i,btvOPID.Index] = OP_ID)
    then begin
      Result := i;
      Break;
    end;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - PARTE CHE AGGIORNA LE OP NEL DOCUMENTO DALL'IMPEGNO
// =============================================================================




procedure TImpegnoForm.FormResize(Sender: TObject);
begin
     // IMposta la posizione della client area e i relativi margini
     MainForm.CalcolaDimensioniClientAreaChildForm(Self, FormMainPanel, False);
     // Appuntamento
     AppuntamentoClientArea.Left := Trunc((TabAppuntamento.ClientWidth - AppuntamentoClientArea.Width) / 2);
     if AppuntamentoClientArea.Left < 0 then AppuntamentoClientArea.Left := 0;
     // OP
     PanelOP.Left := Trunc((TabOP.ClientWidth - PanelOP.Width) / 2);
     if PanelOP.Left < 0 then PanelOP.Left := 0;
     // Allegati
     PanelAllegatiFG.Left := Trunc((TabAllegati.ClientWidth - PanelAllegatiFG.Width) / 2);
     if PanelAllegatiFG.Left < 0 then PanelAllegatiFG.Left := 0;
     // Interventi precedenti e prescrizioni
     PanelPrescrizioni.Left := Trunc((TabInterventiPrecedenti.ClientWidth - PanelPrescrizioni.Width) / 2);
     if PanelPrescrizioni.Left < 0 then PanelPrescrizioni.Left := 0;
     PanelPrecInt.Left := PanelPrescrizioni.Left;
end;

procedure TImpegnoForm.QryPratAppAfterOpen(DataSet: TDataSet);
begin
  // Determina la visibilità della scrollbar verticale, altrimenti da quando ho dovuto mettere
  //  GridMode = True la scrollbar appariva sempre anche se c'era un solo apparecchio e non mi
  //  piaceva.
  if DataSet.RecordCount > 6 then
    tvApp.OptionsView.ScrollBars := TScrollStyle.ssVertical
  else
    tvApp.OptionsView.ScrollBars := TScrollStyle.ssNone;
  // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
  //  di un abbinamento.
  //  NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
  //       relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
  RefreshElencoAbbinatiPrincipali;
end;

procedure TImpegnoForm.QryPratAppAfterPost(DataSet: TDataSet);
begin
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
    //  di un abbinamento.
    //  NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
    //       relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
    RefreshElencoAbbinatiPrincipali;
    // Refresh dei dati che altrimenti non si aggiornano
    tvApp.DataController.DataSet.Refresh;
    // Imposta il filtraggio delle OP e degli interventi precedenti
    //  in base agli apparecchio selezionati.
    SetDataControllerFilterByApp(btvOP.DataController, btvOPIDAPPARECCHIOPRAT);
    SetDataControllerFilterByApp(btvPrecInt.DataController, btvPrecIntIDAPPARECCHIOPRAT);
  finally
    DM1.CloseWait;
  end;
end;

procedure TImpegnoForm.QryPratAppAfterRefresh(DataSet: TDataSet);
begin
  // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
  //  di un abbinamento.
  //  NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
  //       relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
  RefreshElencoAbbinatiPrincipali;
end;

procedure TImpegnoForm.QryPratAppBeforePost(DataSet: TDataSet);
var
  LMasterID: Variant;
  LID: Variant;
  LSelected: Variant;
begin
  LMasterID := QryPratAppMASTER_ID.Value;
  LID := QryPratAppID.Value;
  LSelected := QryPratAppSELECTED.Value;
end;

procedure TImpegnoForm.QryPratAppAfterDelete(DataSet: TDataSet);
begin
  // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
  //  di un abbinamento.
  //  NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
  //       relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
  RefreshElencoAbbinatiPrincipali;
end;



{
procedure TImpegnoForm.tvAppCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  Column: TcxGridDBColumn;
  R: TRect;
  DrawTextFlags, ShapeRectVertMiddle, ShapeRectLeft, ShapeRectRight: Integer;
  PrecBrushColor: TColor;
  BM: TBitmap;
begin
  // Imposta il disegno custom
  ADone := True;
  // Inizializzazione
  Column := AViewInfo.Item as TcxGridDBColumn;
  ACanvas.Font.Name   := 'Arial';
  ACanvas.Font.Size   := 8;
  // In base alla dismissione o meno dell'apparecchio imposta il colore del font.
  if          (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Font.Color := clGray;
  end else if (AViewInfo.GridRecord.DisplayTexts[tvAppSELECTED2.Index] = 'T') then begin
    ACanvas.Font.Color := clGreen;
  end else begin
    ACanvas.Font.Color := clRed;
  end;
  // Traccia anche il testo
  //  NB: Un pò più a destra per la colonna TIPOAPPARECCHIO
  R := AViewInfo.TextAreaBounds;
  if Column = tvAppTIPOAPPARECCHIO then R.Left := R.Left + 13;
  // Determinazione dell'allineamento orizzontale da utilizzare
  if      Column.Properties.Alignment.Horz = taLeftJustify   then DrawTextFlags := cxAlignLeft
  else if Column.Properties.Alignment.Horz = taRightJustify  then DrawTextFlags := cxAlignRight
  else if Column.Properties.Alignment.Horz = taCenter        then DrawTextFlags := cxAlignHCenter;
  DrawTextFlags := DrawTextFlags or cxAlignVCenter;

  // Se si tratta di un apparecchio dismesso disegna lo sfondo di un colore più scuro
  if (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Brush.Color := $00D3D3D3;
  // Altrimenti usa il colore del Background che è più chiaro e mi piace di più
  end else begin
    ACanvas.Brush.Color := tvApp.Styles.Background.Color;
  end;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  //----------------------------------------------------------------------------
  // Memorizza il colore del Brish del Canvas per poi ripristinarlo (altrimenti cambiava)
  PrecBrushColor := ACanvas.Brush.Color;
  // Se è il primo apparecchio dismesso disegna una linea di separazione superiore
  if Dismesso_Primo(AViewInfo.GridRecord)
    then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bTop], 1);
  // Ripristina il colore del brush del canvas
  ACanvas.Brush.Color := PrecBrushColor;
  //----------------------------------------------------------------------------

  // Se non è un record abbinato oppure se non è la colonna del TIPOAPPARECCHIO
  //  lo visualizza normalmente ed esce.
  if (Column <> tvAppTIPOAPPARECCHIO)
  or (   (not Abbinato(AViewInfo.GridRecord))   and   (not Dismesso(AViewInfo.GridRecord))   )
  then begin
    // Traccia il testo
    ACanvas.DrawTexT(AViewInfo.Text, R, DrawTextFlags);
    // Esce
    Exit;
  end;


  // ----------------------------------------------------------------------------------------
  // Se è un rigo DISMESSO...
  // ----------------------------------------------------------------------------------------
  if Dismesso(AViewInfo.GridRecord) then begin
    // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
    BM := TBitmap.Create;
    try
      BM.Transparent := True;
      ImageList_PratApp.GetBitmap(0, BM);
      ACanvas.DrawImage(ImageList_PratApp, AViewInfo.Bounds.Left + 2, AViewInfo.Bounds.Top + 4, 0);
//      ACanvas.Draw(AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top + 1, BM);
    finally
      FreeAndNil(BM);
    end;
    // TRaccia il testo un pò più a DX
    ACanvas.DrawTexT(AViewInfo.Text, R, DrawTextFlags);
    // Esce
    Exit;
  end;

  // ----------------------------------------------------------------------------------------
  // Se arriva qui significa che si tratta di un rigo abbinato e della colonna
  //  TIPOAPPARECHIO e quindi provvede a rendere in grafica il legame tra i records abbinati.
  // ----------------------------------------------------------------------------------------
  // Calcola alcune misure
  ShapeRectLeft       := AViewInfo.Bounds.Left + 5;
  ShapeRectRight      := AViewInfo.Bounds.Left + 9;
  ShapeRectVertMiddle := Round((AViewInfo.Bounds.Bottom + AViewInfo.Bounds.Top) / 2);
  // IMposta il Canvas
  ACanvas.Pen.Color := $00999999;
  ACanvas.Pen.Width := 1;
  // DIsegna la lineetta orizzontale al centro del record
  ACanvas.MoveTo(ShapeRectRight, ShapeRectVertMiddle);
  ACanvas.LineTo(ShapeRectLeft, ShapeRectVertMiddle);
  // Se non è il primo dell'abbinamento disegna anche la lineetta
  //  di raccordo con il record precedente
  if not Abbinato_Primo(AViewInfo.GridRecord) then begin
    ACanvas.LineTo(ShapeRectLeft, AViewInfo.Bounds.Top-1);
  end;
  // Se non è l'ultimo dell'abbinamento disegna anche la lineetta
  //  di raccordo con il record successivo
  if not Abbinato_Ultimo(AViewInfo.GridRecord) then begin
    ACanvas.LineTo(ShapeRectLeft, AViewInfo.Bounds.Bottom+1);
  end;
  // Traccia anche il testo un pò più a destra
  ACanvas.DrawTexT(AViewInfo.Text, R, DrawTextFlags);

end;
}






// Function che ritorna True se il record ricevuto è in disuso
procedure TImpegnoForm.Deselezionacantiereimpianto1Click(Sender: TObject);
begin
  if RxSpeedModifica.Down then
  begin
    if DbeDescrizioneCantiere.Focused then
      DM2.ClearCantiereDoc(QryImpPRATICA, QryImpDATAPRATICA1, DbeDescrizioneCantiere)
    else
      DM2.ClearCantiereDoc(QryImpPRATICA, QryImpDATAPRATICA1, DbeDescrizioneCantiere2);
  end
  else
    DM1.Messaggi('Levante', 'Il documento deve essere in modalità di modifica', '', [mbOk], 0, nil);
end;

function TImpegnoForm.Dismesso(CurrRecord:TcxCustomGridRecord): Boolean;
begin
  Result := (not VarIsNull(CurrRecord.Values[tvAppDISMESSO.Index])) and (CurrRecord.Values[tvAppDISMESSO.Index] = 'T');
end;

// Function che ritorna True se il record ricevuto è il primo di quelli in disuso
function TImpegnoForm.Dismesso_Primo(CurrRecord:TcxCustomGridRecord): Boolean;
var
  PrevRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Se l'apparecchio attuale non è in disuso ovviamente esce subito ritornando False
  if not Dismesso(CurrRecord) then Exit;
  // Se arriva qui significa che è un record in disuso e se è il primo record del Dataset è ovviamente anche il
  //  primo record dei dismessi
  if CurrRecord.IsFirst then begin
    Result := True;
    Exit;
  end;
  // Se il record precedente (se esiste) non è dismesso sigifica che il record corrente è il primo dei dismessi.
  PrevRecord := CurrRecord.ViewData.Records[CurrRecord.Index - 1];
  Result := (VarIsNull(PrevRecord.Values[tvAppDISMESSO.Index])) or (PrevRecord.Values[tvAppDISMESSO.Index] <> 'T');
end;

// Function che ritorna True se il record ricevuto è in abbinamento ad un altro record.
function TImpegnoForm.Abbinato(CurrRecord:TcxCustomGridRecord): Boolean;
var
  NextRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Prima di tutto controlla se il campo COMPUTED_ABBINATO = T significa che è abbinato
  //  e quindi ritorna subito True ed esce
  //  NB: IL campo è True se si tratta di un apparecchio tipo un bruciatore che ha il campo "Abbinato a" o similare
  //       specificato. Se invece il record è quello del l'apparecchio principale il campo = False e quindi serve
  //       un altro tipo di controllo
  if CurrRecord.Values[tvAppCOMPUTED_ABBINATO.Index] then begin
    Result := True;
    Exit;
  end;
  // Se il campo  COMPUTED_ABBINATO = False verifica se il record successivo è abbinato a quello corrente
  //  nel qual caso ritorna True perchè è evidentemente abbinato al record successivo.
  //  NB: Ovviamente se il record attuale è l'ultimo c'è poco da controllare.
  if CurrRecord.IsLast then Exit;
  NextRecord := CurrRecord.ViewData.Records[CurrRecord.Index + 1];
  Result := (CurrRecord.Values[tvAppCOMPUTED_ORDER1.Index] = NextRecord.Values[tvAppCOMPUTED_ORDER1.Index]);
end;

// Function che ritorna True se il record ricevuto è in abbinamento ad un altro record
//  ed è il primo dei records abbinati.
function TImpegnoForm.Abbinato_Primo(CurrRecord:TcxCustomGridRecord): Boolean;
var
  PrevRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Se non è un record abbinato ritorna False ed esce subito
  //  quindi se continua significa che è abbinato.
  if not Abbinato(CurrRecord) then Exit;
  // Se è il primo record in assoluto è evidentemente anche il primo
  //  record tra i records abbinati e quindi...
  if CurrRecord.IsFirst then begin
    Result := True;
    Exit;
  end;
  // Altirmenti controlliamo il record precedente e se ha il
  //  campo COMPUTED_ORD1 di valore diverso dal record attuale
  //  significa che il record attuale è il primo dell'abbinamento.
  PrevRecord := CurrRecord.ViewData.Records[CurrRecord.Index - 1];
  Result := (CurrRecord.Values[tvAppCOMPUTED_ORDER1.Index] <> PrevRecord.Values[tvAppCOMPUTED_ORDER1.Index]);
end;

// Function che ritorna True se il record ricevuto è in abbinamento ad un altro record
//  ed è il primo dei records abbinati.
function TImpegnoForm.Abbinato_Ultimo(CurrRecord:TcxCustomGridRecord): Boolean;
var
  NextRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Se non è un record abbinato ritorna False ed esce subito
  //  quindi se continua significa che è abbinato.
  if not Abbinato(CurrRecord) then Exit;
  // Se è l'ultimo record in assoluto è evidentemente anche l'ultimo
  //  record tra i records abbinati e quindi...
  if CurrRecord.IsLast then begin
    Result := True;
    Exit;
  end;
  // Altirmenti controlliamo il record successivo e se ha il
  //  campo COMPUTED_ORD1 di valore diverso dal record attuale
  //  significa che il record attuale l'ultimo dell'abbinamento.
  NextRecord := CurrRecord.ViewData.Records[CurrRecord.Index + 1];
  Result := (CurrRecord.Values[tvAppCOMPUTED_ORDER1.Index] <> NextRecord.Values[tvAppCOMPUTED_ORDER1.Index]);
end;


procedure TImpegnoForm.tvAppSELECTEDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ADone := True;
  // Determina il colore della sfondo in base al fatto che l'apparecchio
  //  sia dismesso oppure no
  if AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] <> 'T' then
    AViewInfo.EditViewInfo.BackgroundColor := Sender.Styles.Content.Color
  else
    AViewInfo.EditViewInfo.BackgroundColor := $00D3D3D3;;
  // Traccia il contenuto della cella                                                  -
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Separatore
  if not AViewInfo.GridRecord.IsFirst
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bTop], 1);
  // Se ' l'ultimo record visualizzato disegna anche la linea in basso    
  if AviewInfo.GridRecord.IsLast then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TImpegnoForm.tvAppEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  // Permette l'editing solo se si tratta di un apparecchio in uso
//  AAllow := Sender.DataController.DisplayTexts[Sender.DataController.FocusedRecordIndex, tvAppDISMESSO.Index] <> 'T';
  AAllow := True; // DA quando ho fatto le modifiche per Climatec di Conti Gianni per gestire meglio anche gli apparecchi dismessi
end;

procedure TImpegnoForm.tvAppGARANZIA_SCADENZACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 3;
var
  R: TRect;
  TmpStr, TmpStr2: String;
  InGaranzia: String;
begin
  // Imposta il disegno custom
  ADone := True;
  InGaranzia := AViewInfo.GridRecord.DisplayTexts[tvAppCOMPUTED_INGARANZIA.Index];
  // Inizializzazione
  ACanvas.Font.Name   := 'Arial';
  R := AViewInfo.TextAreaBounds;

  // COLORE DI SFONDO
  // Se si tratta di un apparecchio dismesso disegna lo sfondo di un colore più scuro
  if (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Brush.Color := $00D3D3D3;
  // Altrimenti usa il colore del Background che è più chiaro e mi piace di più
  end else begin
    ACanvas.Brush.Color := AViewInfo.Item.Styles.Content.Color;
  end;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  // COLORE DEL FONT
  // In base alla dismissione o meno dell'apparecchio imposta il colore del font.
  if          (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Font.Color := clGray;
  end else if (AViewInfo.GridRecord.DisplayTexts[tvAppSELECTED2.Index] = 'T') then begin
    ACanvas.Font.Color := clGreen;
  end else begin
    ACanvas.Font.Color := clRed;
  end;

  try

    // Se l'apparecchio è in uso e quindi non è dismesso
    if AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] <> 'T' then begin

      // =========================================================================
      // APPARECCHIO IN USO (NON DISMESSO) VISUALIZZA INFO SULLA GARANZIA
      // -------------------------------------------------------------------------
      // GARANZIA NON DETERMINATA
      if InGaranzia = 'N' then begin
        TmpStr := 'Scadenza garanzia non determinata';
        ACanvas.Font.Color := clGray;
        ACanvas.Font.Size  := 7;
        ACanvas.Font.Style := [];
        ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
        R.Right := R.Right - ACanvas.TextWidth(TmpStr);
        Exit;
      end;

      // DATA SCADENZA GARANZIA
      if InGaranzia <> 'N' then begin
        TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppGARANZIA_SCADENZA.Index];
        ACanvas.Font.Size  := 8;
        ACanvas.Font.Style := [];
        ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
        R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
        R.Bottom := R.Top + ACanvas.TextHeight(TmpStr);
      end;

      // LABEL GARANZIA
      if InGaranzia = 'T' then begin
        TmpStr  := AviewInfo.GridRecord.DisplayTexts[tvAppGARANZIA_MESI.Index];
        TmpStr2 := AviewInfo.GridRecord.DisplayTexts[tvAppGARANZIA_MESI_ESTENSIONE.Index];
        if TmpStr2 <> '' then TmpStr := TmpStr + '>' + TmpStr2;
        if TmpStr <> '' then TmpStr := ' (' + TmpStr + ')';
        TmpStr := 'IN GARANZIA' + TmpStr + ' fino al';
      end else if InGaranzia = 'F' then begin
        TmpStr := 'Garanzia SCADUTA dal';
      end;
      ACanvas.Font.Size  := 7;
      ACanvas.Font.Style := [];
      ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);
      R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;

      // Passa alla riga inferiore
      R := AViewInfo.TextAreaBounds;
      ACanvas.Font.Size := 8;
      R.Top := R.Top + ACanvas.TextHeight('XXX') + 1;

      // NOTE GARANZIA
      if InGaranzia = 'T' then begin
        TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppGARANZIA_NOTE.Index];
        ACanvas.Font.Color := clGray;
        ACanvas.Font.Size  := 7;
        ACanvas.Font.Style := [];
        ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
      end;
      // =========================================================================

    // Se invece l'apparecchio attuale è stato dismesso
    end else begin

      // =========================================================================
      // APPARECCHIO DISMESSO VISUALIZZA INFO SULLA DISMISSIONE
      // -------------------------------------------------------------------------

      // DATA DISMISSIONE
      TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO_DATA.Index];
      ACanvas.Font.Size  := 8;
      ACanvas.Font.Style := [fsBold];
      ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
      R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
      R.Bottom := R.Top + ACanvas.TextHeight(TmpStr);

      // LABEL GARANZIA
      TmpStr := 'DISMESSO dal';
      ACanvas.Font.Size  := 7;
      ACanvas.Font.Style := [];
      ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);
      R.Right := R.Right - ACanvas.TextWidth(TmpStr);

      // Passa alla riga inferiore
      R := AViewInfo.TextAreaBounds;
      ACanvas.Font.Size := 8;
      R.Top := R.Top + ACanvas.TextHeight('XXX') + 1;

      // NOTE DISMISSIONE
      TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO_NOTE.Index];
      ACanvas.Font.Color := clGray;
      ACanvas.Font.Size  := 7;
      ACanvas.Font.Style := [];
      ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
      // =========================================================================

    end;

  finally
    // Alla fine disegna una linea di separazione
    if not AViewInfo.GridRecord.IsFirst
    then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bTop], 1);
    // Se ' l'ultimo record visualizzato disegna anche la linea in basso
    if AviewInfo.GridRecord.IsLast then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bBottom], 1);
  end;
end;



// Procedure filtra le operazioni pianificate in base agli apparecchi selezionati o meno nella
//  griglia con l'elenco degli apparecchi dell'impegno
procedure TImpegnoForm.SetDataControllerFilterByApp(FDC:TcxCustomDataController; Column:TcxGridDBBandedColumn);
var
  i: Integer;
  DC: TcxCUstomDataController;
begin
  // Inizializzazione
  DC := tvApp.DataController;
  // Azzeramento degli eventuali filtri precedenti
  FDC.Filter.Active := False;
  FDC.Filter.Clear;
  FDC.Filter.Root.BoolOperatorKind := fboAND;
  // Cicla per tutti gli apparecchi...
  for i := 0 to DC.RecordCount -1 do
  begin
    // Se l'apparecchio corrente non è stato dismesso (i dismessi non fanno testo) e se
    //  sempre l'apparecchio corrente è DESELEZIONATo...
    if (DC.DisplayTexts[i,tvAppSELECTED2.Index] = 'F') then
    begin
      // Aggiungle l'esclusione dell'apparecchio corrente
      FDC.Filter.AddItem(nil, Column, foNotEqual, DC.Values[i,tvAppID.Index], DC.DisplayTexts[i,tvAppID.Index]);
    end;
  end;
  // Alla fine applica il filtro così ottenuto
  FDC.Filter.Active := not FDC.Filter.IsEmpty;
end;

procedure TImpegnoForm.tvAppCOMPUTED_APPARECCHIO_FULLCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 3;
var
  R: TRect;
  TmpStr, TipoApparecchio: String;
  FontColor_PrimoPiano, FontColor_NoteGray, FontColor_NoteBlack: TColor;
begin
  // Imposta il disegno custom
  ADone := True;
  // Inizializzazione
  ACanvas.Font.Name   := 'Arial';
  R := AViewInfo.TextAreaBounds;
  TipoApparecchio := AViewInfo.GridRecord.DisplayTexts[tvAppTIPOAPPARECCHIO.Index];

  // COLORE DI SFONDO
  // Se si tratta di un apparecchio dismesso disegna lo sfondo di un colore più scuro
  if (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Brush.Color := $00D3D3D3;
  // Altrimenti usa il colore del Background che è più chiaro e mi piace di più
  end else begin
    ACanvas.Brush.Color := tvApp.Styles.Background.Color;
  end;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  // COLORE DEL FONT
  // In base alla dismissione o meno dell'apparecchio imposta il colore del font.
  if          (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    FontColor_PrimoPiano := clGray;
    FontColor_NoteGray := clGray;
    FontColor_NoteBlack := clGray;
  end else if (AViewInfo.GridRecord.DisplayTexts[tvAppSELECTED2.Index] = 'T') then begin
    FontColor_PrimoPiano := clGreen;
    FontColor_NoteGray := clGray;
    FontColor_NoteBlack := clBlack;
  end else begin
    FontColor_PrimoPiano := clRed;
    FontColor_NoteGray := clGray;
    FontColor_NoteBlack := clBlack;
  end;

  // TIPO APPARECCHIO
  TmpStr := AViewInfo.Text;
  ACanvas.Font.Color := FontColor_PrimoPiano;
  ACanvas.Font.Size  := 8;
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);

  // Passa alla riga inferiore
  R.Top := R.Top + ACanvas.TextHeight(TmpStr) + 1;

  // In base al tipo di apparecchio visualizza alcune informazioni aggiuntive
  if TipoApparecchio = 'Generatore di calore' then begin
    // ===========================================================================
    // GENERATORE DI CALORE
    // ---------------------------------------------------------------------------
    ACanvas.Font.Size  := 7;
    // Label Potenza
    TmpStr := 'Pot.';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Potenza
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPOTENZATERMICA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Camera
    TmpStr := 'kW   camera tipo';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Camera
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppTIPOCAMERA.Index];
    TmpStr := RightStr(TmpStr, 1);
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Combustibile
    ACanvas.Font.Color := FontColor_NoteGray;
    TmpStr := '   alimentazione a';
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Combustibile
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppCOMBUSTIBILE.Index];
    if TmpStr = 'Altro' then TmpStr := TmpStr + ' (' + AViewInfo.GridRecord.DisplayTexts[tvAppCOMBUSTIBILEALTRO.Index] + ')';
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // ===========================================================================
  end else if TipoApparecchio = 'Bruciatore' then begin
    // ===========================================================================
    // BRUCIATORE
    // ---------------------------------------------------------------------------
    ACanvas.Font.Size  := 7;
    // Label Campo di funzionamento
    TmpStr := 'Campo di funzionamento';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Campo di funzionamento
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPOTENZATERMICA.Index] + ' - ' + AViewInfo.GridRecord.DisplayTexts[tvAppPOTENZATERMICA2.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // UM campo di funzionamento
    TmpStr := 'kW';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // ===========================================================================
  end else if TipoApparecchio = 'Pompa di circolazione' then begin
    // ===========================================================================
    // POMPA DI CIRCOLAZIONE
    // ---------------------------------------------------------------------------
    ACanvas.Font.Size  := 7;
    // Voltaggio elettrico
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppVOLTAGGIOELETTRICO.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Voltaggio elettrico
    TmpStr := 'V';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Potenza elettrica
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPOTENZAELETTRICA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Potenza elettrica
    TmpStr := 'kW';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Portata
    TmpStr := 'portata';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Portata
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPORTATA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Prevalenza
    TmpStr := 'prevalenza';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Portata
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPREVALENZA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // ===========================================================================
  end else if (TipoApparecchio = 'Unità esterna') or (TipoApparecchio = 'Monoblocco') or (TipoApparecchio = 'Macchina per freddo') then begin
    // ===========================================================================
    // UNITA INTERNA + MONOBLOCCO + MACCHINA PER FREDDO
    // ---------------------------------------------------------------------------
    ACanvas.Font.Size  := 7;
    // Voltaggio elettrico
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppVOLTAGGIOELETTRICO.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Voltaggio elettrico
    TmpStr := 'V';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Potenza elettrica
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPOTENZAELETTRICA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label Potenza elettrica
    TmpStr := 'kW  gas';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Carica
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppCARICA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label carica gas
    TmpStr := 'kg';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Tipo refrigerante
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppREFRIGERANTE.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label resa
    TmpStr := 'resa freddo/caldo';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Resa freddo
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPOTENZAFRIGORIFERA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label /
    TmpStr := '/';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Resa caldo
    TmpStr := AViewInfo.GridRecord.DisplayTexts[tvAppPOTENZATERMICA.Index];
    ACanvas.Font.Color := FontColor_NoteBlack;
    ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
    // Label finale
    TmpStr := 'kW';
    ACanvas.Font.Color := FontColor_NoteGray;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr);
    // ===========================================================================
  end;

  // Linea a sx
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bLeft], 1);
  // Alla fine disegna una linea di separazione
  if not AViewInfo.GridRecord.IsFirst
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bTop], 1);
  // Se ' l'ultimo record visualizzato disegna anche la linea in basso
  if AviewInfo.GridRecord.IsLast then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TImpegnoForm.tvAppTIPOAPPARECCHIOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Column: TcxGridDBColumn;
  R: TRect;
  ShapeRectVertMiddle, ShapeRectLeft, ShapeRectRight: Integer;
  PrecBrushColor: TColor;
  BM: TBitmap;
begin
  // Imposta il disegno custom
  ADone := True;

  // Inizializzazione
  Column := AViewInfo.Item as TcxGridDBColumn;
  ACanvas.Font.Name   := 'Arial';
  ACanvas.Font.Size   := 8;

  // In base alla dismissione o meno dell'apparecchio imposta il colore del font.
  if          (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Font.Color := clGray;
  end else if (AViewInfo.GridRecord.DisplayTexts[tvAppSELECTED2.Index] = 'T') then begin
    ACanvas.Font.Color := clGreen;
  end else begin
    ACanvas.Font.Color := clRed;
  end;

  //  NB: Un pò più a destra per la colonna TIPOAPPARECCHIO
  R := AViewInfo.TextAreaBounds;
  R.Left := R.Left + 7;

  // Se si tratta di un apparecchio dismesso disegna lo sfondo di un colore più scuro
  if (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Brush.Color := $00D3D3D3;
  // Altrimenti usa il colore del Background che è più chiaro e mi piace di più
  end else begin
    ACanvas.Brush.Color := tvApp.Styles.Background.Color;
  end;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  //----------------------------------------------------------------------------
  // Memorizza il colore del Brish del Canvas per poi ripristinarlo (altrimenti cambiava)
  PrecBrushColor := ACanvas.Brush.Color;
  // Se è il primo apparecchio dismesso disegna una linea di separazione superiore
  if Dismesso_Primo(AViewInfo.GridRecord)
    then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bTop], 1);
  // Se ' l'ultimo record visualizzato disegna anche la linea in basso    
  if AviewInfo.GridRecord.IsLast then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bBottom], 1);
  // Ripristina il colore del brush del canvas
  ACanvas.Brush.Color := PrecBrushColor;
  //----------------------------------------------------------------------------

  // Se non è un record abbinato e nemmeno dismesso lo visualizza normalmente ed esce
  if (   (not Abbinato(AViewInfo.GridRecord))   and   (not Dismesso(AViewInfo.GridRecord))   )
  then begin
    // Traccia il testo
    ACanvas.DrawTexT(AViewInfo.Text, R, cxAlignLeft or cxAlignVCenter);
    // Esce
    Exit;
  end;

  // ----------------------------------------------------------------------------------------
  // Se è un rigo DISMESSO...
  // ----------------------------------------------------------------------------------------
  if Dismesso(AViewInfo.GridRecord) then begin
    // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
    BM := TBitmap.Create;
    try
      BM.Transparent := True;
      ImageList_PratApp.GetBitmap(0, BM);
      ACanvas.DrawImage(ImageList_PratApp, AViewInfo.Bounds.Left + 2,      Round((AViewInfo.Bounds.Top + AViewInfo.Bounds.Bottom - BM.Height) /  2)+1,      0);
    finally
      FreeAndNil(BM);
    end;
    // TRaccia il testo un pò più a DX
    ACanvas.DrawTexT(AViewInfo.Text, R, cxAlignLeft or cxAlignVCenter);
    // Esce
    Exit;
  end;

  // ----------------------------------------------------------------------------------------
  // Se arriva qui significa che si tratta di un rigo abbinato e della colonna
  //  TIPOAPPARECHIO e quindi provvede a rendere in grafica il legame tra i records abbinati.
  // ----------------------------------------------------------------------------------------
  // Calcola alcune misure
  ShapeRectLeft       := AViewInfo.Bounds.Left + 3;
  ShapeRectRight      := AViewInfo.Bounds.Left + 7;
  ShapeRectVertMiddle := Round((AViewInfo.Bounds.Bottom + AViewInfo.Bounds.Top) / 2);
  // IMposta il Canvas
  ACanvas.Pen.Color := $00999999;
  ACanvas.Pen.Width := 1;
  // DIsegna la lineetta orizzontale al centro del record
  ACanvas.MoveTo(ShapeRectRight, ShapeRectVertMiddle);
  ACanvas.LineTo(ShapeRectLeft, ShapeRectVertMiddle);
  // Se non è il primo dell'abbinamento disegna anche la lineetta
  //  di raccordo con il record precedente
  if not Abbinato_Primo(AViewInfo.GridRecord) then begin
    ACanvas.LineTo(ShapeRectLeft, AViewInfo.Bounds.Top-1);
  end;
  // Se non è l'ultimo dell'abbinamento disegna anche la lineetta
  //  di raccordo con il record successivo
  if not Abbinato_Ultimo(AViewInfo.GridRecord) then begin
    ACanvas.LineTo(ShapeRectLeft, AViewInfo.Bounds.Bottom+1);
  end;
  // Traccia anche il testo un pò più a destra
  ACanvas.DrawTexT(AViewInfo.Text, R, cxAlignLeft or cxAlignVCenter);

end;





procedure TImpegnoForm.eCognomeRespImpKeyPress(Sender: TObject; var Key: Char);
begin
  // La somma del cognome + nome (compreso lo spazio che li separa)
  //  non deve superare i 60 caratteri, altrimenti potrebbe generare
  //  errori (StringTruncation) oppure venire troncati.
  //  NB: Se il focus è sul cognome o sul nome lo sposta in modo da
  //       essere sicuro che il valore sia postato al campo
  if ((Length(eCognomeRespImp.Text + ' ' + eNomeRespImp.Text)) >= 60)
  and (Ord(Key) <> 8)  // BackSpace (altrimenti il backspace non funzionava più una volta raggiunta le dimensione massima
  then
    Key := #0;
end;

procedure TImpegnoForm.tvAppANNOCOSTRUZIONECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  R: TRect;
  TmpStr: String;
begin
  ADone := True;

  // Sfondo
  if AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] <> 'T'
  then ACanvas.Brush.Color := tvApp.Styles.Background.Color
  else ACanvas.Brush.Color := $00D3D3D3;
  ACanvas.FillRect(AViewInfo.Bounds);

  // Testo
  TmpStr := AviewInfo.GridRecord.DisplayTexts[tvAppANNOCOSTRUZIONE.Index];
  ACanvas.Font.Name := 'Verdana';
  ACanvas.Font.Color := clGray;
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];
  ACanvas.SetFontAngle(90);
  R := AViewInfo.Bounds;
  R.Left := R.Left + 1;
  R.Right := R.Right + 500;
  R.Bottom := R.Bottom + 9;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);

  // Alla fine disegna una linea di separazione
  if not AViewInfo.GridRecord.IsFirst
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bTop], 1);
  // Se ' l'ultimo record visualizzato disegna anche la linea in basso
  if AviewInfo.GridRecord.IsLast then ACanvas.DrawComplexFrame(AViewInfo.Bounds, tvApp.OptionsView.GridLineColor, tvApp.OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TImpegnoForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

function TImpegnoForm.GetImpiantoAssegnato: Boolean;
begin
  // NB: Restituisce True solo se l'impianto è proprio un impianto mentre
  //      restituisce False se è una Pratica/Cantiere perchè altrimenti
  //      visualizzava i pannelli specifici degli impianti (Responsabile dell'impianto,
  //      Utente/Occupante, Amministratore) anche per le pratiche che invece non
  //      hanno questi campi.
  Result := (QryImpPRATICA.AsInteger <> 0) and (QryAssTIPO.AsString = 'A');
end;

function TImpegnoForm.GetPraticaAssegnata: Boolean;
begin
  // NB: Restituisce True solo se la pratica è proprio una pratica mentre
  //      restituisce False se è un Impianto
  Result := (QryImpPRATICA.AsInteger <> 0) and (QryAssTIPO.AsString = 'P');
end;

function TImpegnoForm.GetSoggettoAssegnato: Boolean;
begin
  Result := (QryImpCLIENTE.AsInteger <> 0);
end;



procedure TImpegnoForm.DbeAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryImp.State = dsEdit) or (QryImp.State = dsInsert) then DM1.AgenteChanged(1, dbeAgente2);
end;

procedure TImpegnoForm.dbeAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryImp.State = dsEdit) or (QryImp.State = dsInsert) then DM1.AgenteChanged(2, dbeAgente3);
end;

procedure TImpegnoForm.dbeAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryImp.State = dsEdit) or (QryImp.State = dsInsert) then DM1.AgenteChanged(3, dbeAgente4);
end;

procedure TImpegnoForm.DbeAgentePropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente.Properties.Items, 1, '');
end;

procedure TImpegnoForm.dbeAgente2PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente2.Properties.Items, 2, dbeAgente.Text);
end;

procedure TImpegnoForm.dbeAgente3PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente3.Properties.Items, 3, dbeAgente2.Text);
end;

procedure TImpegnoForm.dbeAgente4PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente4.Properties.Items, 4, dbeAgente3.Text);
end;

procedure TImpegnoForm.Fogliodilavoro1Click(Sender: TObject);
begin
  // RIchiama la procedura di stampa
  //  NB: Le Copie le passa in negativo in modo che appaia sempre la Dialog per
  //       impostare le copie stesse con il valore di deafult.
  StampaFoglioDiLavoro((MenuStampe.Tag = 0), False, (0 - DM1.TableProgressiviFL_COPIE.AsInteger));
end;

procedure TImpegnoForm.SBEspandiRespImpClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryAssCODICERESPIMP.Value);
end;

procedure TImpegnoForm.SBEspandiProprietarioClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryAssCODICEPROP.Value);
end;

procedure TImpegnoForm.SBEspandiOccupanteClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryAssCODICEUT.Value);
end;

procedure TImpegnoForm.SBEspandiInstallatoreClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryAssCODICEINST.Value);
end;

procedure TImpegnoForm.SBInstallatoreClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryAssCODICEINST, QryImpPRATICA, QryImpDATAPRATICA1, '');
end;

procedure TImpegnoForm.SBOccupanteClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryAssCODICEUT, QryImpPRATICA, QryImpDATAPRATICA1, '');
end;

procedure TImpegnoForm.SBProprietarioClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryAssCODICEPROP, QryImpPRATICA, QryImpDATAPRATICA1, '');
end;

procedure TImpegnoForm.SBRespImpClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryAssCODICERESPIMP, QryImpPRATICA, QryImpDATAPRATICA1, '');
end;

procedure TImpegnoForm.QryAssCODICERESPIMPChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, Telefono, Cellulare, CodiceFiscale');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryAssCODICERESPIMP.AsString);
      QryCli.Open;
      // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
      if not QryCli.Eof then begin
          QryAssRagSocRespImp.Value          := QryCli.FieldByName('RagioneSociale').AsString;
          QryAssNOMERESPIMP.Value            := QryCli.FieldByName('Nome').AsString;
          QryAssCOGNOMERESPIMP.Value         := QryCli.FieldByName('Cognome').AsString;
          QryAssNATURAGIURIDICARESPIMP.Value := QryCli.FieldByName('TipoPersona').AsString;
          QryAssIndirizzoRespImp.Value       := QryCli.FieldByName('Indirizzo').AsString;
          QryAssNumCivicoRespImp.Value       := QryCli.FieldByName('NumCivico').AsString;
          QryAssCittaRespImp.Value           := QryCli.FieldByName('Citta').AsString;
          QryAssCAPRespImp.Value             := QryCli.FieldByName('CAP').AsString;
          QryAssProvinciaRespImp.Value       := QryCli.FieldByName('Provincia').AsString;
          QryAssTelefonoRespImp.Value        := QryCli.FieldByName('Telefono').AsString;
          QryAssCellulareRespImp.Value       := QryCli.FieldByName('Cellulare').AsString;
          QryAssCodiceFiscaleRespImp.Value   := QryCli.FieldByName('CodiceFiscale').AsString;
      end;
      if (not QryAssCODICERESPIMP.IsNull) then begin
        if QryAssCODICERESPIMP.Value = QryAssCODICEPROP.AsInteger
          then QryAssINQUALITADIRESPIMP.Value := 'Proprietario'
        else if QryAssCODICERESPIMP.Value = QryAssCODICEUT.AsInteger
          then QryAssINQUALITADIRESPIMP.Value := 'Occupante'
        else QryAssINQUALITADIRESPIMP.Value := 'Terzo responsabile';
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TImpegnoForm.QryAssCODICEPROPChange(Sender: TField);
var
   Qry: TIB_Cursor;
begin
   // Carica i dati del destinatario della richiesta prima accensione caldaia
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   try
      Qry.SQL.Add('SELECT RAGIONESOCIALE, Cognome, Nome, TipoPersona, INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA, TELEFONO, PARTITAIVA, CODICEFISCALE');
      Qry.SQL.Add('FROM CLIENTI');
      Qry.SQL.Add('WHERE CODICE = ' + QryAssCODICEPROP.AsString);
      Qry.Open;
      if not Qry.Eof then begin
         QryAssRAGSOCPROP.Value          := DM2.GetDenominazioneSoggetto(Qry);
         QryAssINDIRIZZOPROP.Value       := Qry.FieldByName('INDIRIZZO').AsString;
         QryAssNUMCIVICOPROP.Value       := Qry.FieldByName('NUMCIVICO').AsString;
         QryAssCAPPROP.Value             := Qry.FieldByName('CAP').AsString;
         QryAssCITTAPROP.Value           := Qry.FieldByName('CITTA').AsString;
         QryAssPROVINCIAPROP.Value       := Qry.FieldByName('PROVINCIA').AsString;
         QryAssTELEFONOPROP.Value        := Qry.FieldByName('TELEFONO').AsString;
         QryAssCODICEFISCALEPROP.Value   := Qry.FieldByName('CODICEFISCALE').AsString;
      end else begin
         MessageBeep(0);
         MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOK], 0)
      end;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;

procedure TImpegnoForm.QryAssCODICEUTChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, Telefono, Cellulare, CodiceFiscale');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryAssCodiceUT.AsString);
      QryCli.Open;
      // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
      if not QryCli.Eof then begin
          QryAssRagSocUT.Value          := DM2.GetDenominazioneSoggetto(QryCli);
          QryAssIndirizzoUT.Value       := QryCli.FieldByName('Indirizzo').AsString;
          QryAssNumCivicoUT.Value       := QryCli.FieldByName('NumCivico').AsString;
          QryAssCittaUT.Value           := QryCli.FieldByName('Citta').AsString;
          QryAssCAPUT.Value             := QryCli.FieldByName('CAP').AsString;
          QryAssProvinciaUT.Value       := QryCli.FieldByName('Provincia').AsString;
          QryAssTelefonoUT.Value        := QryCli.FieldByName('Telefono').AsString;
          QryAssCellulareUT.Value       := QryCli.FieldByName('Cellulare').AsString;
          QryAssCodiceFiscaleUT.Value   := QryCli.FieldByName('CodiceFiscale').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TImpegnoForm.QryAssCODICEINSTChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, Telefono, Cellulare, CodiceFiscale');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryAssCodiceInst.AsString);
      QryCli.Open;
      // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
      if not QryCli.Eof then begin
          QryAssRagSocInst.Value          := DM2.GetDenominazioneSoggetto(QryCli);
          QryAssIndirizzoInst.Value       := QryCli.FieldByName('Indirizzo').AsString;
          QryAssNumCivicoInst.Value       := QryCli.FieldByName('NumCivico').AsString;
          QryAssCittaInst.Value           := QryCli.FieldByName('Citta').AsString;
          QryAssCAPInst.Value             := QryCli.FieldByName('CAP').AsString;
          QryAssProvinciaInst.Value       := QryCli.FieldByName('Provincia').AsString;
          QryAssTELEFONOINST.Value        := QryCli.FieldByName('Telefono').AsString;
          QryAssCELLULAREINST.Value       := QryCli.FieldByName('Cellulare').AsString;
          QryAssCODICEFISCALEINST.Value   := QryCli.FieldByName('CodiceFiscale').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TImpegnoForm.btvPrescRISOLTOPropertiesEditValueChanged(
  Sender: TObject);
var
  RI: Integer;
  DC: TcxCustomDataController;
  TmpStr: String;
begin
    DC := btvPresc.DataController;
    RI := DC.FocusedRecordIndex;
    TmpStr := VarToStr(DC.Values[RI,btvPrescRISOLTO.Index]);
    if TmpStr = 'True' then
    begin
      DC.Cancel; // Altrimenti non mi salva poi la data di risoluzione del problema e mi da un errore
      DM2.ChiediConfermaPrescrizioneRisolta(DC, RI, btvPrescRISOLTO.Index, btvPrescFATTO_DATA.Index, btvPrescFATTO_NOTE.Index);
    end;
end;

procedure TImpegnoForm.cbSelezionaAppTuttiPropertiesChange(Sender: TObject);
begin
  SelezionaDeselezionaAppTutti(cbSelezionaAppTutti.Checked);
end;

procedure TImpegnoForm.cbVediNotePrivateSoggettoPropertiesChange(
  Sender: TObject);
begin
  // IN base alla selezione dimensiona il pannello Note
  ImpostaDimensioniPannelliNote;
  // RIchiama il calcolo del layout per ridisporre i Pannelli successivi
  CaricaLayoutDocumento;
end;

// Imposta le dimensioni dei pannelli delle note
procedure TImpegnoForm.ImpostaDimensioniPannelliNote;
begin
  // Note soggetto
  if cbVediNotePrivateSoggetto.Checked
    then PanelNoteSoggetto.Height := dbeNotePrivateSoggetto.Top + dbeNotePrivateSoggetto.Height + 5
    else PanelNoteSoggetto.Height := dbeNotePrivateSoggetto.Top;
  // Note impianto
  if cbVediNotePrivateImpianto.Checked
    then PanelNoteImpianto.Height := dbeNotePrivateImpianto.Top + dbeNotePrivateImpianto.Height + 5
    else PanelNoteImpianto.Height := dbeNotePrivateImpianto.Top;
end;





procedure TImpegnoForm.QrySoggAfterOpen(DataSet: TDataSet);
begin
  // Verifica se devono essere evidenziale le note
  ControllaEvidenziazioneNotePrivateSoggetto;
end;

procedure TImpegnoForm.QryAssAfterOpen(DataSet: TDataSet);
begin
  // Verifica se devono essere evidenziale le note
  ControllaEvidenziazioneNotePrivateImpianto;
end;



























// =============================================================================
// INIZIO PARTE PER EVIDENZIAZIONE LAMPEGGIANTE (PRESCRIZIONI, NOTE ECC.)
// -----------------------------------------------------------------------------
// Verifica se deve essere avviato il lampeddio (evidenziaizione) del campo
procedure TImpegnoForm.ControllaEvidenziazioneNotePrivateSoggetto;
begin
  NotePrivateSoggetto_Evidenzia := (Trim(QrySoggNOTEPRIVATE.AsString) <> '');
end;
// Verifica se deve essere avviato il lampeddio (evidenziaizione) del campo
procedure TImpegnoForm.ControllaEvidenziazioneNotePrivateImpianto;
begin
  NotePrivateImpianto_Evidenzia := (Trim(QryAssNOTEPRIVATE.AsString) <> '');
end;
// Verifica se deve essere avviato il lampeddio (evidenziaizione) del campo
procedure TImpegnoForm.RefreshTabPrescrizioni;
var
  V: Byte;
begin
  V := btvPresc.DataController.RecordCount;
  if V = 0 then begin
    TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Caption := 'Precedenti';
    Prescrizioni_Evidenzia := False;
  end else begin
    TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Caption := 'Precedenti - ' + IntToStr(V);
    Prescrizioni_Evidenzia := True;
  end;
end;




procedure TImpegnoForm.TimerBlinkTimer(Sender: TObject);
begin
  // Fa lampeggiare le prescrizioni se è il caso
  if Prescrizioni_Evidenzia then Prescrizioni_InEvidenza := not Prescrizioni_InEvidenza;
  if NotePrivateSoggetto_Evidenzia then NotePrivateSoggetto_InEvidenza := not NotePrivateSoggetto_InEvidenza;
  if NotePrivateImpianto_Evidenzia then NotePrivateImpianto_InEvidenza := not NotePrivateImpianto_InEvidenza;
end;




// --------------------------
procedure TImpegnoForm.SetPrescrizioni_Evidenzia(const Value: Boolean);
begin
  fPrescrizioni_Evidenzia := Value;
  // Resetta l'aspetto se il lammpeggio viene interrotto.
  if not Value then Prescrizioni_InEvidenza := False;
end;

procedure TImpegnoForm.SetNotePrivateImpianto_Evidenzia(
  const Value: Boolean);
begin
  fNotePrivateImpianto_Evidenzia := Value;
  // Resetta l'aspetto se il lammpeggio viene interrotto.
  if not Value then NotePrivateImpianto_InEvidenza := False;
end;

procedure TImpegnoForm.SetNotePrivateSoggetto_Evidenzia(
  const Value: Boolean);
begin
  fNotePrivateSoggetto_Evidenzia := Value;
  // Resetta l'aspetto se il lammpeggio viene interrotto.
  if not Value then NotePrivateSoggetto_InEvidenza := False;
end;
// --------------------------




// --------------------------
procedure TImpegnoForm.SetNotePrivateImpianto_InEvidenza(
  const Value: Boolean);
const
  NORMAL_PANEL_COLOR = clWhite;
  BLINK_PANEL_COLOR  = $00C1C1FF;
begin
  fNotePrivateImpianto_InEvidenza := Value;
  // Se deve essere evidenziato lo evidenzia
  if Value
  then PanelCheckNotePrivateImpianto.Color := BLINK_PANEL_COLOR
  else PanelCheckNotePrivateImpianto.Color := NORMAL_PANEL_COLOR;
end;

procedure TImpegnoForm.SetNotePrivateSoggetto_InEvidenza(
  const Value: Boolean);
const
  NORMAL_PANEL_COLOR = clWhite;
  BLINK_PANEL_COLOR  = $00C1C1FF;
begin
  fNotePrivateSoggetto_InEvidenza := Value;
  // Se deve essere evidenziato lo evidenzia
  if Value
  then PanelCheckNotePrivateSoggetto.Color := BLINK_PANEL_COLOR
  else PanelCheckNotePrivateSoggetto.Color := NORMAL_PANEL_COLOR;
end;

procedure TImpegnoForm.SetPrescrizioni_InEvidenza(const Value: Boolean);
const
  NORMAL_PANEL_COLOR = $00E9E9E9;
  BLINK_PANEL_COLOR  = $00C1C1FF;
begin
  fPrescrizioni_InEvidenza := Value;
  // Se deve essere visualizzato in evidenza
  if Value then begin

    // =========================================================================
    // Disegna in evidenza le raccomandazioni/prescrizioni
    // -------------------------------------------------------------------------
    PanelPrescrizioni.Color := BLINK_PANEL_COLOR;
    TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color := BLINK_PANEL_COLOR;
    // Se esiste il documneto collegato imposta anche quello
    if PreventiviOrdiniForm <> nil then begin
      PreventiviOrdiniForm.TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color := BLINK_PANEL_COLOR;
    end;
    // =========================================================================

  end else begin

    // =========================================================================
    // Disegna NON in evidenza le raccomandazioni/prescrizioni
    // -------------------------------------------------------------------------
    PanelPrescrizioni.Color := NORMAL_PANEL_COLOR;
    if TabControlPagineDocumento.TabIndex = DOCTABIDX_INTERVENTIPRECEDENTI
    then TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color := clWhite
    else TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color := clNone;
    // Se esiste il documneto collegato imposta anche quello
    if PreventiviOrdiniForm <> nil then begin
      if PreventiviOrdiniForm.TabControlPagineDocumento.TabIndex = DOCTABIDX_INTERVENTIPRECEDENTI
      then PreventiviOrdiniForm.TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color := clWhite
      else PreventiviOrdiniForm.TabControlPagineDocumento.Tabs[DOCTABIDX_INTERVENTIPRECEDENTI].Color := clNone;
    end;
    // =========================================================================

  end;
end;
// --------------------------
// -----------------------------------------------------------------------------
// FINE PARTE PER EVIDENZIAZIONE LAMPEGGIANTE (PRESCRIZIONI, NOTE ECC.)
// =============================================================================





procedure TImpegnoForm.QryAssCalcFields(DataSet: TDataSet);
begin
  // ===========================================================================
  // Verifica l'indirizzo con la stradario per certificarlo
  // ---------------------------------------------------------------------------
  if DM2.Stradario_IndirizzoVerificato(QryAssCODICEISTATCOMUNEIMM.AsString, QryAssCOMUNEIMM.AsString, QryAssINDIRIZZOIMM.AsString, QryAssPROVINCIAIMM.AsString)
  then QryAssCOMPUTED_STR_CERTIFIED_IMM.AsString := 'T'
  else QryAssCOMPUTED_STR_CERTIFIED_IMM.AsString := 'F';
  // ===========================================================================
end;

procedure TImpegnoForm.dbeComuneImmPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  // Solo se siamo in modalità di modifica
  if not RxSpeedModifica.Down then Exit;
  // RIchiama la selezione dallo stradario
  DM1.ShowWait('Levante', 'Apertura stradario...');
  try
    DM2.Stradario_SelezionaIndirizzo(QryAssCODICEISTATCOMUNEIMM, QryAssCOMUNEIMM, QryAssINDIRIZZOIMM, QryAssPROVINCIAIMM, QryAssCAPIMM);
  finally
    DM1.CloseWait;
  end;
end;

procedure TImpegnoForm.dbeZonaImmPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(ZONAIMM) FROM PRATICHE');
      if (not QryAssCOMUNEIMM.IsNull) and (Trim(QryAssCOMUNEIMM.AsString) <> '')
        then Qry.SQL.Add('WHERE COMUNEIMM = ' + QuotedStr(QryAssCOMUNEIMM.AsString));
      Qry.Open;
      dbeZonaImm.Properties.Items.Clear;
      dbeZonaImm.Properties.Items.Add('');
      while not Qry.Eof do begin
         dbeZonaImm.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TImpegnoForm.QryAssCONTRATTO_VALIDITA_INIZIOChange(
  Sender: TField);
begin
  // Se non sono ancora stati inseriti i dati necessari esce subito
  if QryAssCONTRATTO_MESI.IsNull
  or QryAssCONTRATTO_VALIDITA_INIZIO.IsNull
  then Exit;
  // Ricalcola la data di scadenza in base ai dati inseriti.
  QryAssCONTRATTO_VALIDITA_FINE.Value := IncDay(   IncMonth(QryAssCONTRATTO_VALIDITA_INIZIO.AsDateTime, QryAssCONTRATTO_MESI.AsInteger)   , (-1));
end;

procedure TImpegnoForm.sbContrattoRinnovaClick(Sender: TObject);
begin
  DM2.Contratto_Rinnova(QryAssCONTRATTO_VALIDITA_FINE, QryAssCONTRATTO_MESI_RINNOVO, QryAssCONTRATTO_STATO, QryAssCONTRATTO_DISDETTA_RICEVUTA);
end;

procedure TImpegnoForm.btvOPPROSSIMACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
end;

procedure TImpegnoForm.btvOPCODICEIVACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // Font più piccolo
  ACanvas.Font.Size := 7;
end;

procedure TImpegnoForm.QryOPPRZUNITValidate(Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il prezzo netto scontato
    QryOPPRZUNITNETTO.Value := DM1.CalcolaImportoScontato(QryOPPRZUNIT.AsFloat, QryOPSCONTO1.AsFloat, QryOPSCONTO2.AsFloat, QryOPSCONTO3.AsFloat, DM1.DecMicroPrz);
    // Calcola il prezzo lordo iva compresa
    QryOPPRZUNITIVACOMP.Value := DM1.Arrotonda(    QryOPPRZUNIT.AsFloat * ((100+QryOPALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
    // Calcola il netto iva compresa
    QryOPPRZUNITNETTOIVACOMP.Value := DM1.Arrotonda(    QryOPPRZUNITNETTO.AsFloat * ((100+QryOPALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TImpegnoForm.btvOPPERIODICITAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // NOn visualizza gli zeri
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0)
  then AText := '';
end;

procedure TImpegnoForm.btvOPCODICEIVAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // Se la OP è compresa nell'abbonamento e ovviamente l'impianto è sotto contratto...
  if  (VarToStr(ARecord.Values[btvOPINABBONAMENTO.Index]) = 'T')
  and (QryAssCONTRATTO_STATO.AsString = 'T')
  then AText := '';
end;

procedure TImpegnoForm.btvOPPRZUNITNETTOIVACOMPGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // NOn visualizza gli zeri
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0)
  then AText := '';
  // Se la OP è compresa nell'abbonamento e ovviamente l'impianto è sotto contratto...
  if  (VarToStr(ARecord.Values[btvOPINABBONAMENTO.Index]) = 'T')
  and (QryAssCONTRATTO_STATO.AsString = 'T')
  then AText := 'Abb.';
end;

procedure TImpegnoForm.QryAssCONTRATTO_IMPORTOValidate(Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il prezzo netto scontato
    QryAssCONTRATTO_IMPORTONETTO.Value := DM1.CalcolaImportoScontato(QryAssCONTRATTO_IMPORTO.AsFloat, QryAssCONTRATTO_SCONTO1.AsFloat, QryAssCONTRATTO_SCONTO2.AsFloat, QryAssCONTRATTO_SCONTO3.AsFloat, DM1.DecMicroPrz);
    // Calcola il prezzo lordo iva compresa
    QryAssCONTRATTO_IMPORTOIVACOMP.Value := DM1.Arrotonda(    QryAssCONTRATTO_IMPORTO.AsFloat * ((100+QryAssCONTRATTO_ALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
    // Calcola il netto iva compresa
    QryAssCONTRATTO_IMPORTONETTOIVACOMP.Value := DM1.Arrotonda(    QryAssCONTRATTO_IMPORTONETTO.AsFloat * ((100+QryAssCONTRATTO_ALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TImpegnoForm.Contratto_ImportoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '.' then Key := ',';
end;

procedure TImpegnoForm.QryOPPRZUNITNETTOIVACOMPValidate(Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il lordo IVA compresa considerando tutti gli sconti = 0
    QryOPPRZUNIT.Value      := DM1.Arrotonda(    QryOPPRZUNITNETTOIVACOMP.AsFloat / ((100 + QryOPALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
    QryOPSCONTO1.Value      := 0;
    QryOPSCONTO2.Value      := 0;
    QryOPSCONTO3.Value      := 0;
    QryOPPRZUNITNETTO.Value := QryOPPRZUNIT.AsFloat;
    // Anche il lordi IVA compresa
    QryOPPRZUNITIVACOMP.Value := QryOPPRZUNITNETTOIVACOMP.AsFloat;
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TImpegnoForm.btvOPEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  // Inizializzazione
  AAllow := True;
  // Se l'OP attuale è compresa nell'abbonamento non rende modificabili i dati relativi
  //  al prezzo della OP stessa (prezzo, IVA, sconti ecc.) anche perchè se è compresa nell'abbonamento
  //  questi dati sono già invisibili.
  if (AItem = btvOPPRZUNIT)
  or (AItem = btvOPSCONTO1)
  or (AItem = btvOPSCONTO2)
  or (AItem = btvOPSCONTO3)
  or (AItem = btvOPPRZUNITNETTO)
  or (AItem = btvOPCODICEIVA)
  or (AItem = btvOPPRZUNITIVACOMP)
  or (AItem = btvOPPRZUNITNETTOIVACOMP)
  then begin
    AAllow := (VarToStr(Sender.Controller.FocusedRecord.Values[btvOPINABBONAMENTO.Index]) <> 'T') or (QryAssCONTRATTO_STATO.AsString <> 'T');
  end;
end;

function TImpegnoForm.GetPiuDiUnApparecchio: Boolean;
begin
  Result := (tvApp.DataController.RecordCount > 1);
end;

procedure TImpegnoForm.DBEOraInterventoPropertiesChange(Sender: TObject);
var
  DurataStr: String;
begin
  // Aggiorna la Label che indica la durata dell'intervento in ore e minuti come stringa
  DurataStr := DateTimeDifferenceToString(dbeOraIntervento.EditingValue, dbeOraFineIntervento.EditingValue);
  if DurataStr = ''
    then LabelDurataIntervento.Caption := '- - -'
    else LabelDurataIntervento.Caption := 'Durata intervento:   ' + DurataStr;
end;

procedure TImpegnoForm.DBERichiedentePropertiesInitPopup(Sender: TObject);
var
  Q:TIB_Cursor;
begin
  DBERichiedente.Properties.Items.Clear;
  DBERichiedente.Properties.Items.Add('');
  if QryImpIDPRATICA.IsNull or (QryImpIDPRATICA.AsInteger = 0) then
    Exit;
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT DISTINCT(RICHIEDENTE) FROM IMPEGNI WHERE IDPRATICA = ' + QryImpIDPRATICA.AsString + ' AND COALESCE(RICHIEDENTE,'''') <> ''''');
    Q.Open;
    while not Q.Eof do
    begin
      DBERichiedente.Properties.Items.Add(q.Fields[0].AsString);
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

procedure TImpegnoForm.DBEOraAppuntamentoPropertiesChange(Sender: TObject);
var
  DurataStr: String;
begin
  // Aggiorna la Label che indica la durata dell'intervento in ore e minuti come stringa
  DurataStr := DateTimeDifferenceToString(DBEOraAppuntamento.EditingValue, DBEOraFineAppuntamento.EditingValue);
  if DurataStr = ''
    then LabelDurataAppuntamento.Caption := '- - -'
    else LabelDurataAppuntamento.Caption := 'Durata appuntamento:   ' + DurataStr;
end;

procedure TImpegnoForm.SBEspandiPratica1Click(Sender: TObject);
begin
  try
    DM1.ShowWait('Levante', 'Sto caricando i dati...');
    DM1.VisualizzaCantiereImpianto(QryImpIDPRATICA, QryImpPRATICA, QryImpDATAPRATICA1, True);
  finally
    DM1.CloseWait;
  end;
end;

procedure TImpegnoForm.QryImpRESOURCEIDChange(Sender: TField);
var
  Qry : TIB_Cursor;
  New_Registro: String;
  New_Mag1, New_Mag2: Integer;
  ImpostaMag: Boolean;
begin
  // Verifica parametro
  if (Sender.IsNull) or (Sender.AsInteger = 0) then Exit; 
  // Imposta la query che ricaverà le informazioni sul tecnico
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT ASSEGNAMAGAZZINO, CODICEMAGAZZINO1, CODICEMAGAZZINO2, REGISTRO');
    Qry.SQL.Add('FROM TECNICI');
    Qry.SQL.Add('WHERE RESOURCEID = ' + Sender.AsString);
    Qry.Open;
    // Se non trova il tecnico ritorna un errore
    if Qry.Eof then raise Exception.Create('Tecnico non trovato!');
    // Carica i dati trovati in alcune variabili locali per comodità e poi chiude la query
    New_Registro  := Trim(Qry.FieldByName('REGISTRO').AsString);
    ImpostaMag    := (Qry.FieldByName('ASSEGNAMAGAZZINO').AsString = 'T');
    New_Mag1      := Qry.FieldByName('CODICEMAGAZZINO1').AsInteger;
    New_Mag2      := Qry.FieldByName('CODICEMAGAZZINO2').AsInteger;
    Qry.Close;
    // Se impostato aggiorna il RifDoc_Registro del documento a cui fa
    //  riferimento il documento stesso (Intervento)
    //  NB: Il dato è nella parte documento, quallo allegato all'impegno
    if (New_Registro <> '') and (PreventiviOrdiniForm <> nil) then begin
      PreventiviOrdiniForm.QryDocumentoRIFDOC_REG.Value := New_Registro;
    end;
    // Se impostato aggiorna il magazzino del documento collegato (intervento)
    //  se esiste ovviamente.
    //  NB: Il dato è nella parte documento, quallo allegato all'impegno
    if ImpostaMag and (PreventiviOrdiniForm <> nil) then begin
      if New_Mag1 <> 0 then PreventiviOrdiniForm.QryDocumentoCODICEMAGAZZINO.Value  := New_Mag1;
      if New_Mag2 <> 0 then PreventiviOrdiniForm.QryDocumentoCODICEMAGAZZINO2.Value := New_Mag2;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TImpegnoForm.QryAssCONTRATTO_IMPORTONETTOIVACOMPValidate(
  Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il lordo IVA compresa considerando tutti gli sconti = 0
    QryAssCONTRATTO_IMPORTO.Value      := DM1.Arrotonda(    QryAssCONTRATTO_IMPORTONETTOIVACOMP.AsFloat / ((100 + QryAssCONTRATTO_ALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
    QryAssCONTRATTO_SCONTO1.Value      := 0;
    QryAssCONTRATTO_SCONTO2.Value      := 0;
    QryAssCONTRATTO_SCONTO3.Value      := 0;
    QryAssCONTRATTO_IMPORTONETTO.Value := QryAssCONTRATTO_IMPORTO.AsFloat;
    // Anche il lordi IVA compresa
    QryAssCONTRATTO_IMPORTOIVACOMP.Value := QryAssCONTRATTO_IMPORTONETTOIVACOMP.AsFloat;
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;



// Procedure che Crea/Apre il Task di Google Tasks relativo all'impegno corrente (chiamata)
//  se giò presente lo apre per modificarlo altrimenti lo rea nuovo.
procedure TImpegnoForm.GCal_CreateOrOpenEvent(Invisible:Boolean=False);
var
  NewEventTitle, NewEventDescrizione, NewEventLocation, NewEventCalendarID, NewEventCalendarName, StrToAdd, Urgente, TmpStr: String;
  NewEventStartTime, NewEventEndTime: TDateTime;
  NewEventAllDay: Boolean;
begin
  // Se la chiamata è marcata come urgente lo mette nel titolo
  if QryImpURGENTE.AsString = 'T' then Urgente := 'Urgente - ';
  // ===========================================================================
  // In base alla situazione e costruisce i valori di default per l'eventuale
  //  nuovo Task
  // ---------------------------------------------------------------------------
  // COstruisce il titolo dell'evento in base alla situazione
  if      Self.ImpiantoAssegnato
    then NewEventTitle := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QryAssRAGSOCRESPIMP.AsString) + ' - ' + Trim(QryAssDESCRIZIONE.AsString)
  else if Self.PraticaAssegnata
    then NewEventTitle := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QrySoggRAGIONESOCIALE.AsString) + ' - ' + Trim(QryAssDESCRIZIONE.AsString)
  else if Self.SoggettoAssegnato
    then NewEventTitle := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QrySoggRAGIONESOCIALE.AsString)
  else
         NewEventTitle := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QryImpRAGSOCCLI.AsString);

  // Descrizione
  NewEventDescrizione   := Trim(QryImpEVENTMESSAGE.AsString);
  // Location
  NewEventLocation      := Trim(QryImpLOCATION.AsString);
  // StartTime
  NewEventStartTime     := QryImpSTART.AsDateTime;
  // EndTime
  NewEventEndTime       := QryImpFINISH.AsDateTime;
  // AllDay
  NewEventAllDay        := (NewEventStartTime = DateOf(NewEventStartTime)) and (NewEventEndTime = DateOf(NewEventEndTime));
  // Calendar
  if QryTecnici.Locate('RESOURCEID', QryImpRESOURCEID.AsInteger, []) then begin
    NewEventCalendarID    := QryTecniciGCAL_CALENDAR_ID.AsString;
    NewEventCalendarName  := QryTecniciRESOURCENAME.AsString;
  end;
  // ===========================================================================

  // Procede con la creazione/modifica del Task
  //  NB: Solo se ha trovato la risorsa altrimenti non fa nulla
  if NewEventCalendarID = '' then begin
    DM1.Messaggi('Levante', 'Calendar not found on Google Calendar!', '', [mbOk], 0, nil);
    Exit;
  end;
  GCal_ShowEventForm_Impegno(QryImpMASTER_ID.Value, NewEventTitle, NewEventDescrizione, NewEventLocation,
                             NewEventAllDay, NewEventStartTime, NewEventEndTime, NewEventCalendarID,
                             NewEventCalendarName, Invisible);
end;


// Procedure che Crea/Apre il Task di Google Tasks relativo all'impegno corrente (chiamata)
//  se giò presente lo apre per modificarlo altrimenti lo rea nuovo.
procedure TImpegnoForm.GoogleTasks_CreateOrOpenTask(Invisible:Boolean=False);
var
  NewTaskTitle, NewTaskNotes, Urgente, StrToAdd, TmpStr: String;
  NewDueDate: TDateTime;
begin
  // Se la chiamata è marcata come urgente lo mette nel titolo
  if QryImpURGENTE.AsString = 'T' then Urgente := 'Urgente - ';
  // ===========================================================================
  // In base alla situazione e costruisce i valori di default per l'eventuale
  //  nuovo Task
  // ---------------------------------------------------------------------------
  // Se l'IMPIANTO è assegnato
  if Self.ImpiantoAssegnato then begin

    // --- TITOLO ---
    NewTaskTitle  := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QryAssRAGSOCRESPIMP.AsString) + ' - ' + Trim(QryAssDESCRIZIONE.AsString);
    // --- NOTES ---
    // Motivo della chiamata
    StrToAdd := Trim(QryImpEVENTMESSAGE.AsString);
    // Indirizzo
    TmpStr := Trim(   Trim(QryAssCOMUNEIMM.AsString) + ' ' + Trim(QryAssINDIRIZZOIMM.AsString) + ' ' + Trim(QryAssNUMCIVICOIMM.AsString)   );
    if (TmpStr <> '') and (StrToAdd <> '') then TmpStr := '; ' + TmpStr;
    StrToAdd := StrToAdd + TmpStr;
    // Telefono
    TmpStr := Trim(QryAssTELEFONORESPIMP.AsString);
    if (TmpStr <> '') and (StrToAdd <> '') then TmpStr := '; ' + TmpStr;
    StrToAdd := StrToAdd + TmpStr;
    // Cellulare
    TmpStr := Trim(QryAssCELLULARERESPIMP.AsString);
    if (TmpStr <> '') and (StrToAdd <> '') then TmpStr := '; ' + TmpStr;
    StrToAdd := StrToAdd + TmpStr;
    // Assegnazione
    NewTaskNotes := StrToAdd;
    // --- DUEDATE ---
    NewDueDate    := DateOf(QryImpDATAORACHIAMATA.AsDateTime);

  // Se il CANTIERE
  end else if Self.PraticaAssegnata then begin

    // --- TITOLO ---
    NewTaskTitle  := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QrySoggRAGIONESOCIALE.AsString) + ' - ' + Trim(QryAssDESCRIZIONE.AsString);
    // --- NOTES ---
    // Motivo della chiamata
    StrToAdd := Trim(QryImpEVENTMESSAGE.AsString);
    // Indirizzo
    TmpStr := Trim(   Trim(QryAssIMMOBLOCALITA.AsString) + ' ' + Trim(QryAssIMMOBINDIRIZZO.AsString) + ' ' + Trim(QryAssIMMOBNUMCIVICO.AsString)   );
    if (TmpStr <> '') and (StrToAdd <> '') then TmpStr := '; ' + TmpStr;
    StrToAdd := StrToAdd + TmpStr;
    // Assegnazione
    NewTaskNotes := StrToAdd;
    // --- DUEDATE ---
    NewDueDate    := DateOf(QryImpDATAORACHIAMATA.AsDateTime);

  // Se il Soggetto è assegnato
  end else if Self.SoggettoAssegnato then begin

    // --- TITOLO ---
    NewTaskTitle  := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QrySoggRAGIONESOCIALE.AsString);
    // --- NOTES ---
    // Motivo della chiamata
    StrToAdd := Trim(QryImpEVENTMESSAGE.AsString);
    // Indirizzo
    TmpStr := Trim(   Trim(QrySoggCITTA.AsString) + ' ' + Trim(QrySoggINDIRIZZO.AsString) + ' ' + Trim(QrySoggNUMCIVICO.AsString)   );
    if (TmpStr <> '') and (StrToAdd <> '') then TmpStr := '; ' + TmpStr;
    StrToAdd := StrToAdd + TmpStr;
    // Telefono
    TmpStr := Trim(QrySoggTELEFONO.AsString);
    if (TmpStr <> '') and (StrToAdd <> '') then TmpStr := '; ' + TmpStr;
    StrToAdd := StrToAdd + TmpStr;
    // Cellulare
    TmpStr := Trim(QrySoggCELLULARE.AsString);
    if (TmpStr <> '') and (StrToAdd <> '') then TmpStr := '; ' + TmpStr;
    StrToAdd := StrToAdd + TmpStr;
    // Assegnazione
    NewTaskNotes := StrToAdd;
    // --- DUEDATE ---
    NewDueDate    := DateOf(QryImpDATAORACHIAMATA.AsDateTime);

  // Se invece non c'è ne soggetto ne cantiere/impianto...
  end else begin

    // --- TITOLO ---
    NewTaskTitle  := QryImpMASTER_ID.AsString + ': ' + Urgente + Trim(QryImpRAGSOCCLI.AsString);
    // --- NOTES ---
    // Motivo della chiamata
    StrToAdd := Trim(QryImpEVENTMESSAGE.AsString);
    // Assegnazione
    NewTaskNotes := StrToAdd;
    // --- DUEDATE ---
    NewDueDate    := DateOf(QryImpDATAORACHIAMATA.AsDateTime);

  end;
  // ===========================================================================

  // Procede con la creazione/modifica del Task
  GoogleTasks_ShowTaskForm_Impegno(QryImpMASTER_ID.Value, NewTaskTitle, NewTaskNotes, NewDueDate, Invisible);
end;




procedure TImpegnoForm.sbOpenTask1Click(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
  try
    GoogleTasks_CreateOrOpenTask;
  finally
    DM1.CloseWait;
  end;
end;

end.
