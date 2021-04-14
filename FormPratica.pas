unit FormPratica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, bmpPanel, Buttons, StdCtrls, DBCtrls, Mask,
  IB_Components, IBODataset, Db, MAURI_SB, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, cxDBEdit, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxStyles, cxCustomData, cxGraphics,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCalendar, cxTimeEdit, cxCurrencyEdit, cxMemo, cxCheckComboBox, IniFiles,
  Menus, cxPC, cxGridBandedTableView, cxGridDBBandedTableView, ImgList,
  DataModule1,
  cxSplitter, cxLabel, FormAllegati, FormGMap,
  cxButtonEdit, cxImageComboBox, cxFilter, cxData, cxDataStorage,
  cxPCdxBarPopupMenu,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, IB_Access,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerDateNavigator,
  cxDateNavigator, dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations,
  System.ImageList;

const
  RESPIMP_TOP = 18;
  RESPIMP_MIDDLE = 28;
  RESPIMP_BOTTOM = 35;

  MODE_PRATICHE = 0;
  MODE_ASSISTENZE = 1;

type
  // Struttura che contiene il riferimento alla pratica modello nel caso
  // di duplicazione di una pratica/cantiere
  TDatiModelloPratica = record
    Tipo: String;
    Codice: Integer;
    DataApertura: TDate;
  end;

  TPraticaForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    QryPrat: TIBOQuery;
    SourcePrat: TDataSource;
    QryPratCODICE: TIntegerField;
    QryPratDATAAPERTURA: TDateTimeField;
    QryPratCLIENTE: TIntegerField;
    QryPratDATACHIUSURA: TDateTimeField;
    QryPratDESCRIZIONE: TStringField;
    QryPratNOTE: TStringField;
    QryPratARGOMENTO: TStringField;
    QryPratPROVENIENZA: TStringField;
    QryPratSTATODESCRIZIONE: TStringField;
    QryPratSTATOFOREGROUND: TStringField;
    QryPratSTATOBACKGROUND: TStringField;
    QryPratALTRISOGGETTI: TStringField;
    QryPratSINCHRO: TStringField;
    QryPratTIPO: TStringField;
    QryPratCOSTRUTTORE: TStringField;
    QryPratMODELLO: TStringField;
    QryPratMATRICOLA: TStringField;
    QryPratCOMBUSTIBILE: TStringField;
    QryPratTIPOLOGIACALDAIA: TStringField;
    QryPratTIPOCAMERA: TStringField;
    QryPratTIPOTIRAGGIO: TStringField;
    QryPratPOTENZANOMINALE: TStringField;
    QryPratDATAINSTALLAZIONE: TDateTimeField;
    QryPratINSTALLATORE: TStringField;
    QryPratDATAPRIMAACCENSIONE: TDateTimeField;
    QryPratRAGSOCCLI: TStringField;
    QryPratINDIRIZZOCLI: TStringField;
    QryPratCAPCLI: TStringField;
    QryPratCITTACLI: TStringField;
    QryPratPROVINCIACLI: TStringField;
    QryPratCODICEUT: TIntegerField;
    QryPratRAGSOCUT: TStringField;
    QryPratINDIRIZZOUT: TStringField;
    QryPratCAPUT: TStringField;
    QryPratCITTAUT: TStringField;
    QryPratPROVINCIAUT: TStringField;
    QryPratCODICEINST: TIntegerField;
    QryPratRAGSOCINST: TStringField;
    QryPratINDIRIZZOINST: TStringField;
    QryPratCAPINST: TStringField;
    QryPratCITTAINST: TStringField;
    QryPratPROVINCIAINST: TStringField;
    QryPratCOMUNEIMM: TStringField;
    QryPratINDIRIZZOIMM: TStringField;
    QryPratNUMCIVICOIMM: TStringField;
    QryPratPIANOIMM: TStringField;
    QryPratINTERNOIMM: TStringField;
    QryPratPROVINCIAIMM: TStringField;
    QryPratBREVEDESCRIZIONECALDAIA: TStringField;
    QryPratCOMBUSTIBILEALTRO: TStringField;
    QryPratABBONATO: TStringField;
    QryPratDATAINIZIOABBONAMENTO: TDateTimeField;
    QryPratDATAFINEABBONAMENTO: TDateTimeField;
    QryPratRICEVUTADISDETTA: TStringField;
    QryPratDATADISDETTA: TDateTimeField;
    QryPratMEZZODISDETTA: TStringField;
    QryPratMEZZODISDETTAALTRO: TStringField;
    QryPratTIPOCONTRATTO: TStringField;
    QryPratIMPORTOCONTRATTO: TIBOFloatField;
    QryPratCAPIMM: TStringField;
    QryPratTIPOIMPIANTO: TStringField;
    QryPratNOTEMONTAGGIO: TStringField;
    QryPratPERIODICITA: TIntegerField;
    QryS1: TIBOQuery;
    SourceS1: TDataSource;
    QryS1ID: TStringField;
    QryS2: TIBOQuery;
    SourceS2: TDataSource;
    QryS3: TIBOQuery;
    SourceS3: TDataSource;
    QryS2ID: TStringField;
    QryS3ID: TStringField;
    QryS1TIPOCANTIERE: TStringField;
    QryS1CODICECANTIERE: TIntegerField;
    QryS1DATAAPERTURACANTIERE: TDateTimeField;
    QryS2TIPOCANTIERE: TStringField;
    QryS2CODICECANTIERE: TIntegerField;
    QryS2DATAAPERTURACANTIERE: TDateTimeField;
    QryS3TIPOCANTIERE: TStringField;
    QryS3CODICECANTIERE: TIntegerField;
    QryS3DATAAPERTURACANTIERE: TDateTimeField;
    QryPratUNITAIMMOBILIARI: TIntegerField;
    QryPratCOMMITCODICE: TIntegerField;
    QryPratCOMMITDENOMINAZIONE: TStringField;
    QryPratCOMMITINDIRIZZO: TStringField;
    QryPratCOMMITNUMCIVICO: TStringField;
    QryPratCOMMITSCALA: TStringField;
    QryPratCOMMITPIANO: TStringField;
    QryPratCOMMITINTERNO: TStringField;
    QryPratCOMMITCAP: TStringField;
    QryPratCOMMITLOCALITA: TStringField;
    QryPratCOMMITPROVINCIA: TStringField;
    QryPratPROPCODICE: TIntegerField;
    QryPratPROPDENOMINAZIONE: TStringField;
    QryPratPROPINDIRIZZO: TStringField;
    QryPratPROPNUMCIVICO: TStringField;
    QryPratPROPSCALA: TStringField;
    QryPratPROPPIANO: TStringField;
    QryPratPROPINTERNO: TStringField;
    QryPratPROPCAP: TStringField;
    QryPratPROPLOCALITA: TStringField;
    QryPratPROPPROVINCIA: TStringField;
    QryPratIMMOBCODICE: TIntegerField;
    QryPratIMMOBINDIRIZZO: TStringField;
    QryPratIMMOBNUMCIVICO: TStringField;
    QryPratIMMOBSCALA: TStringField;
    QryPratIMMOBPIANO: TStringField;
    QryPratIMMOBINTERNO: TStringField;
    QryPratIMMOBCAP: TStringField;
    QryPratIMMOBLOCALITA: TStringField;
    QryPratIMMOBPROVINCIA: TStringField;
    QryPratCOMMITTELEFONO: TStringField;
    QryPratCOMMITPIVA: TStringField;
    QryPratCOMMITCODICEFISCALE: TStringField;
    QryPratPROPTELEFONO: TStringField;
    QryPratPROPPIVA: TStringField;
    QryPratPROPCODICEFISCALE: TStringField;
    QryPratSOCGASCODICE: TIntegerField;
    QrySocGas: TIBOQuery;
    SourceSocGas: TDataSource;
    QrySocGasCODICE: TIntegerField;
    QrySocGasRAGIONESOCIALE: TStringField;
    QrySocGasINDIRIZZO: TStringField;
    QrySocGasLOCALITA: TStringField;
    QrySocGasCAP: TStringField;
    QrySocGasPROVINCIA: TStringField;
    QrySocGasTELEFONO: TStringField;
    QrySocGasFAX: TStringField;
    QrySocGasSINCHRO: TStringField;
    QryPratNUMCIVICOCLI: TStringField;
    QryPratNUMCIVICOUT: TStringField;
    QryPratNUMCIVICOINST: TStringField;
    QryPratRISCALDAMENTO: TStringField;
    QryPratACQUASANITARIA: TStringField;
    QryPratMARCAEFFICIENZAENERG: TStringField;
    QryPratLOCALEINSTALLAZIONE: TStringField;
    QryPratFLUIDOTERMOVETTORE: TStringField;
    QryPratCODICERESPIMP: TIntegerField;
    QryPratRAGSOCRESPIMP: TStringField;
    QryPratINDIRIZZORESPIMP: TStringField;
    QryPratNUMCIVICORESPIMP: TStringField;
    QryPratCAPRESPIMP: TStringField;
    QryPratCITTARESPIMP: TStringField;
    QryPratPROVINCIARESPIMP: TStringField;
    QryPratINQUALITADIRESPIMP: TStringField;
    QryPratANNOCOSTRUZIONE: TIntegerField;
    QryPratVISIBLETOEXPRESSMAG: TStringField;
    QryPratTELEFONOCLI: TStringField;
    QryPratCELLULARECLI: TStringField;
    QryPratCODICEFISCALECLI: TStringField;
    QryPratTELEFONOUT: TStringField;
    QryPratCELLULAREUT: TStringField;
    QryPratCODICEFISCALEUT: TStringField;
    QryPratCODICECATASTO: TStringField;
    QryPratTELEFONORESPIMP: TStringField;
    QryPratCELLULARERESPIMP: TStringField;
    QryPratCODICEFISCALERESPIMP: TStringField;
    QryPratPRZUNITOPERA1_1: TIBOFloatField;
    QryPratPRZUNITOPERA1_2: TIBOFloatField;
    QryPratPRZUNITOPERA1_3: TIBOFloatField;
    QryPratPRZUNITOPERA1_4: TIBOFloatField;
    QryPratPRZUNITOPERA1_5: TIBOFloatField;
    QryPratTIPORICARICO: TSmallintField;
    QryPratRICARICOPERC: TIBOFloatField;
    QryPratLISTINO: TSmallintField;
    QryPratTIPOCOSTO: TSmallintField;
    QryPratTIPORICARICOCOMEDACOMMESSA: TStringField;
    QryPratPOTENZANOMINALEFOCOLARE: TStringField;
    PopupMenuDataChiusura: TPopupMenu;
    Annulladatachiusura1: TMenuItem;
    QryPratCATEGCANT1: TStringField;
    QryPratCATEGCANT2: TStringField;
    QryPratCATEGCANT3: TStringField;
    QryPratCATEGCANT4: TStringField;
    QryPratCATEGCANT5: TStringField;
    QryPratCATEGCANT6: TStringField;
    QryPratAGENTE: TStringField;
    QryPratAGENTE2: TStringField;
    QryPratAGENTE3: TStringField;
    QryPratAGENTE4: TStringField;
    QryPratID: TIntegerField;
    QryPratApp: TIBOQuery;
    QryPratAppID: TIntegerField;
    QryPratAppIDPRATICA: TIntegerField;
    QryPratAppTIPOIMPIANTO: TStringField;
    QryPratAppTIPOAPPARECCHIO: TStringField;
    QryPratAppCOSTRUTTORE: TStringField;
    QryPratAppMODELLO: TStringField;
    QryPratAppMATRICOLA: TStringField;
    QryPratAppBREVEDESCRIZIONE: TMemoField;
    QryPratAppNOTESULMONTAGGIO: TMemoField;
    QryPratAppANNOCOSTRUZIONE: TIntegerField;
    QryPratAppMARCAEFFICENERGETICA: TStringField;
    QryPratAppTIPOLOGIA: TStringField;
    QryPratAppUBICAZIONE: TStringField;
    QryPratAppDATAINSTALLAZIONE: TDateTimeField;
    QryPratAppINSTCODICE: TIntegerField;
    QryPratAppINSTRAGSOC: TStringField;
    QryPratAppDATACOLLAUDO: TDateTimeField;
    QryPratAppCOLLCODICE: TIntegerField;
    QryPratAppCOLLRAGSOC: TStringField;
    QryPratAppRISCALDAMENTO: TStringField;
    QryPratAppACQUASANITARIA: TStringField;
    QryPratAppFLUIDOTERMOVETTORE: TStringField;
    QryPratAppTIPOCAMERA: TStringField;
    QryPratAppTIPOTIRAGGIO: TStringField;
    QryPratAppCOMBUSTIBILE: TStringField;
    QryPratAppCERTIFICAZIONE: TStringField;
    QryPratAppTENUTA: TStringField;
    QryPratAppREFRIGERANTE: TStringField;
    QryPratAppCOMPRESSORI: TStringField;
    QryPratAppDISMESSO: TStringField;
    QryPratAppDISMESSO_NOTE: TStringField;
    QryPratAppDISMESSO_DATA: TDateTimeField;
    QryPratAppIDAPPABBINATO: TIntegerField;
    QryPratAppCODICECATASTO: TStringField;
    QryPratAppCOMBUSTIBILEALTRO: TStringField;
    SourcePratApp: TDataSource;
    QryOP: TIBOQuery;
    QryOPIDPRATICA: TIntegerField;
    QryOPIDAPPARECCHIOPRAT: TIntegerField;
    QryOPIDOP: TStringField;
    QryOPDESCRIZIONE: TStringField;
    QryOPNOTE: TStringField;
    QryOPPERIODICITA: TIntegerField;
    QryOPMINUTIPREVISTI: TIntegerField;
    QryOPULTIMA: TDateTimeField;
    QryOPPROSSIMA: TDateTimeField;
    SourceOP: TDataSource;
    PopupMenuNuovoApparecchio: TPopupMenu;
    Generatoredicalore1: TMenuItem;
    Bruciatore1: TMenuItem;
    Pompadicircolazione1: TMenuItem;
    Unitesterna1: TMenuItem;
    Unitinterna1: TMenuItem;
    Monoblocco1: TMenuItem;
    Macchinaperfreddo1: TMenuItem;
    Altro1: TMenuItem;
    QryPratAppCOMPUTED_ORDER1: TIntegerField;
    QryPratAppCOMPUTED_ORDER2: TIntegerField;
    QryPratAppCOMPUTED_ABBINATO: TBooleanField;
    ImageList_PratApp: TImageList;
    QryPratPROXVISITAENTRO: TDateTimeField;
    FormMainPanel: TPanel;
    MainPageControl: TcxPageControl;
    TabPratica: TcxTabSheet;
    TabImpianto: TcxTabSheet;
    TabApparecchi: TcxTabSheet;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    TabOP: TcxTabSheet;
    ClientAreaImpianto: TScrollBox;
    PanelNumDescrizioneImpianto: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Label33: TLabel;
    DbeTipoImpianto: TDBEdit;
    dbeProxVisitaEntro: TcxDBDateEdit;
    ClientAreaPratica: TScrollBox;
    PanelProprietarioCantiere: TPanel;
    Label151: TLabel;
    SBProprietarioCantiere: TSpeedButtonRollOver;
    SpeedButtonRollOver3: TSpeedButtonRollOver;
    DBText6: TDBText;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label50: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    PropDenominazione: TDBEdit;
    PropIndirizzo: TDBEdit;
    PropNumCivico: TDBEdit;
    PropScala: TDBEdit;
    PropPiano: TDBEdit;
    PropInterno: TDBEdit;
    PropCAP: TDBEdit;
    PropLocalita: TDBEdit;
    PropProvincia: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    PanelImmobileCantiere: TPanel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    SBImmobileCantiere: TSpeedButtonRollOver;
    SpeedButtonRollOver5: TSpeedButtonRollOver;
    DBText7: TDBText;
    ImpLocalita: TDBEdit;
    ImpProvincia: TDBEdit;
    ImpCAP: TDBEdit;
    ImpIndirizzo: TDBEdit;
    ImpNumCivico: TDBEdit;
    impScala: TDBEdit;
    ImpPiano: TDBEdit;
    ImpInterno: TDBEdit;
    MainPanelDatiAnagrafici: TPanel;
    PanelDatiAnagrafici: TPanel;
    LabelPanelDatiPraticaCaption: TLabel;
    Label30: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    LabelUnitaImmobiliari: TLabel;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    LabelStatoDocumento: TLabel;
    LabelAgente: TLabel;
    LabelAgente2: TLabel;
    DbeVisibleToExpressMag: TcxDBCheckBox;
    Codice: TDBEdit;
    Descrizione: TDBEdit;
    DbeUnitaImmobiliari: TDBEdit;
    DBEditStatoDocumento: TDBEdit;
    dbeAgente: TcxDBComboBox;
    dbeAgente2: TcxDBComboBox;
    PanelSoggetto: TPanel;
    Label1: TLabel;
    SBSoggetto: TSpeedButtonRollOver;
    SBEspandiSoggetto: TSpeedButtonRollOver;
    DBText1: TDBText;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    PanelNotePratica: TPanel;
    Label67: TLabel;
    Note: TDBMemo;
    PanelDatiAnagrafici2: TPanel;
    LabelAgente3: TLabel;
    LabelAgente4: TLabel;
    dbeAgente3: TcxDBComboBox;
    dbeAgente4: TcxDBComboBox;
    PanelSocGasCantiere: TPanel;
    Label61: TLabel;
    Label62: TLabel;
    SBSocGasCantiere: TSpeedButtonRollOver;
    DBText8: TDBText;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    DBESocGasRagSoc: TDBEdit;
    DBESocGasIndirizzo: TDBEdit;
    DBESocGasCAP: TDBEdit;
    DBESocGasLocalita: TDBEdit;
    DBESocGasProvincia: TDBEdit;
    PanelSottocantieri: TPanel;
    LabelPanelSottopraticheCaption: TLabel;
    GridS1: TcxGrid;
    tvS1: TcxGridDBTableView;
    tvS1ID: TcxGridDBColumn;
    lvS1: TcxGridLevel;
    GridS2: TcxGrid;
    tvS2: TcxGridDBTableView;
    tvS2ID: TcxGridDBColumn;
    lvS2: TcxGridLevel;
    GridS3: TcxGrid;
    tvS3: TcxGridDBTableView;
    tvS3ID: TcxGridDBColumn;
    lvS3: TcxGridLevel;
    PanelCategorie: TPanel;
    LabelCategoria1: TLabel;
    LabelCategoria2: TLabel;
    LabelCategoria3: TLabel;
    LabelCategoria4: TLabel;
    LabelCategoria5: TLabel;
    LabelCategoria6: TLabel;
    Label81: TLabel;
    PanelCateg1: TPanel;
    Categ1: TDBComboBox;
    PanelCateg2: TPanel;
    Categ2: TDBComboBox;
    PanelCateg3: TPanel;
    Categ3: TDBComboBox;
    PanelCateg4: TPanel;
    Categ4: TDBComboBox;
    PanelCateg5: TPanel;
    Categ5: TDBComboBox;
    PanelCateg6: TPanel;
    Categ6: TDBComboBox;
    PanelApparecchiImpianto: TPanel;
    Label18: TLabel;
    GridApp: TcxGrid;
    btvApp: TcxGridDBBandedTableView;
    btvAppID: TcxGridDBBandedColumn;
    btvAppTIPOAPPARECCHIO: TcxGridDBBandedColumn;
    btvAppCOSTRUTTORE: TcxGridDBBandedColumn;
    btvAppMODELLO: TcxGridDBBandedColumn;
    btvAppMATRICOLA: TcxGridDBBandedColumn;
    btvAppANNOCOSTRUZIONE: TcxGridDBBandedColumn;
    btvAppCOMBUSTIBILE: TcxGridDBBandedColumn;
    btvAppTIPOCAMERA: TcxGridDBBandedColumn;
    btvAppTIPOTIRAGGIO: TcxGridDBBandedColumn;
    btvAppPOTENZATERMICA: TcxGridDBBandedColumn;
    btvAppPOTENZATERMICAFOCOLARE: TcxGridDBBandedColumn;
    btvAppCOMPRESSORI: TcxGridDBBandedColumn;
    btvAppPOTENZAFRIGORIFERA: TcxGridDBBandedColumn;
    btvAppREFRIGERANTE: TcxGridDBBandedColumn;
    btvAppCARICA: TcxGridDBBandedColumn;
    btvAppTENUTA: TcxGridDBBandedColumn;
    btvAppVOLTAGGIOELETTRICO: TcxGridDBBandedColumn;
    btvAppPOTENZAELETTRICA: TcxGridDBBandedColumn;
    btvAppIDPRATICA: TcxGridDBBandedColumn;
    btvAppTIPOIMPIANTO: TcxGridDBBandedColumn;
    btvAppBREVEDESCRIZIONE: TcxGridDBBandedColumn;
    btvAppNOTESULMONTAGGIO: TcxGridDBBandedColumn;
    btvAppMARCAEFFICENERGETICA: TcxGridDBBandedColumn;
    btvAppTIPOLOGIA: TcxGridDBBandedColumn;
    btvAppUBICAZIONE: TcxGridDBBandedColumn;
    btvAppDATAINSTALLAZIONE: TcxGridDBBandedColumn;
    btvAppINSTCODICE: TcxGridDBBandedColumn;
    btvAppINSTRAGSOC: TcxGridDBBandedColumn;
    btvAppDATACOLLAUDO: TcxGridDBBandedColumn;
    btvAppCOLLCODICE: TcxGridDBBandedColumn;
    btvAppCOLLRAGSOC: TcxGridDBBandedColumn;
    btvAppRISCALDAMENTO: TcxGridDBBandedColumn;
    btvAppACQUASANITARIA: TcxGridDBBandedColumn;
    btvAppFLUIDOTERMOVETTORE: TcxGridDBBandedColumn;
    btvAppVOLUMETRIARISC: TcxGridDBBandedColumn;
    btvAppCERTIFICAZIONE: TcxGridDBBandedColumn;
    btvAppPORTATA: TcxGridDBBandedColumn;
    btvAppPREVALENZA: TcxGridDBBandedColumn;
    btvAppDISMESSO: TcxGridDBBandedColumn;
    btvAppDISMESSO_NOTE: TcxGridDBBandedColumn;
    btvAppCOMPUTED_ORDER1: TcxGridDBBandedColumn;
    btvAppCOMPUTED_ORDER2: TcxGridDBBandedColumn;
    btvAppCOMPUTED_ABBINATO: TcxGridDBBandedColumn;
    lvApp: TcxGridLevel;
    PageControlApparecchiImpianto: TcxPageControl;
    TabTermo_GeneratoreDiCalore: TcxTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    LabelDataPrimaAccensione: TLabel;
    Label36: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label44: TLabel;
    Label80: TLabel;
    Bevel20: TBevel;
    Label177: TLabel;
    GenCal_BtnSelezInstallatore: TSpeedButtonRollOver;
    GenCal_BtnApriInstallatore: TSpeedButtonRollOver;
    Label82: TLabel;
    Label178: TLabel;
    GenCal_BtnSelezCollaudatore: TSpeedButtonRollOver;
    GenCal_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Bevel26: TBevel;
    Label187: TLabel;
    Label194: TLabel;
    GenCal_CodiceInstallatore: TDBText;
    GenCal_CodiceCollaudatore: TDBText;
    GenCal_Matricola: TDBEdit;
    GenCal_PotenzaNominale: TDBEdit;
    GenCal_TipoCamera: TcxDBRadioGroup;
    GenCal_Tiraggio: TcxDBRadioGroup;
    GenCal_Combustibile: TcxDBRadioGroup;
    GenCal_CombustibileAltro: TDBEdit;
    PanelCostruttore: TPanel;
    GenCal_Costruttore: TDBComboBox;
    PanelModello: TPanel;
    GenCal_Modello: TDBComboBox;
    GenCal_AnnoCostruzione: TDBEdit;
    PanelMarcaEfficEnerg: TPanel;
    GenCal_MarcaEfficienzaEnerg: TDBComboBox;
    GenCal_UsoAcquaSanitaria: TcxDBCheckBox;
    PanelFluidoTermovettore: TPanel;
    GenCal_FluidoTermovettore: TDBComboBox;
    PanelLocaleInstallazione: TPanel;
    GenCal_LocaleInstallazione: TDBComboBox;
    GenCal_UsoRiscaldamento: TcxDBCheckBox;
    GenCal_CodiceCatastoImpianti: TDBEdit;
    GenCal_PotenzaNominaleFocolare: TDBEdit;
    GenCal_VolumetriaRiscaldata: TDBEdit;
    GenCal_CheckSostituito: TcxDBCheckBox;
    GenCal_DataSostituzione: TcxDBDateEdit;
    GenCal_NoteSostituzione: TDBEdit;
    GenCal_Certificazione: TDBEdit;
    GenCal_BreveDescApp: TcxDBMemo;
    GenCal_NoteMontaggio: TcxDBMemo;
    GenCal_DataInstallazione: TcxDBDateEdit;
    GenCal_DataCollaudo: TcxDBDateEdit;
    GenCal_NomeInstallatore: TDBEdit;
    GenCal_NomeCollaudatore: TDBEdit;
    TabTermo_BruciatoreAbbinato: TcxTabSheet;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label201: TLabel;
    Bevel25: TBevel;
    Bruc_BtnSelezInstallatore: TSpeedButtonRollOver;
    Bruc_BtnApriInstallatore: TSpeedButtonRollOver;
    Label197: TLabel;
    Bruc_BtnSelezCollaudatore: TSpeedButtonRollOver;
    Bruc_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label199: TLabel;
    Bevel27: TBevel;
    Label200: TLabel;
    Label202: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Bruc_CodiceInstallatore: TDBText;
    Label198: TLabel;
    Bruc_CodiceCollaudatore: TDBText;
    Bruc_Matricola: TDBEdit;
    Bruc_CampoFunzionamento: TDBEdit;
    PanelBrucCostruttore: TPanel;
    Bruc_Costruttore: TDBComboBox;
    PanelBrucModello: TPanel;
    Bruc_Modello: TDBComboBox;
    Bruc_AnnoFabbricazione: TDBEdit;
    Bruc_Tipologia: TDBEdit;
    Bruc_CheckSostituito: TcxDBCheckBox;
    Bruc_DataSostituzione: TcxDBDateEdit;
    Bruc_NoteSostituzione: TDBEdit;
    Bruc_Certificazione: TDBEdit;
    Bruc_BreveDescApp: TcxDBMemo;
    Bruc_NoteMontaggio: TcxDBMemo;
    Bruc_DataInstallazione: TcxDBDateEdit;
    Bruc_DataCollaudo: TcxDBDateEdit;
    Bruc_NomeInstallatore: TDBEdit;
    Bruc_NomeCollaudatore: TDBEdit;
    Bruc_AbbinatoApparecchio: TcxComboBox;
    TabTermo_Pompa: TcxTabSheet;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Bevel19: TBevel;
    PompaCirc_BtnSelezInstallatore: TSpeedButtonRollOver;
    PompaCirc_BtnApriInstallatore: TSpeedButtonRollOver;
    Label92: TLabel;
    PompaCirc_BtnSelezCollaudatore: TSpeedButtonRollOver;
    PompaCirc_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label94: TLabel;
    Bevel28: TBevel;
    Label188: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label203: TLabel;
    Label91: TLabel;
    PompaCirc_CodiceInstallatore: TDBText;
    Label93: TLabel;
    PompaCirc_CodiceCollaudatore: TDBText;
    PompaCirc_Matricola: TDBEdit;
    PompaCirc_PotenzaAssorbita: TDBEdit;
    PanelCircCostruttore: TPanel;
    PompaCirc_Costruttore: TDBComboBox;
    PanelCircModello: TPanel;
    PompaCirc_Modello: TDBComboBox;
    PompaCirc_AnnoFabbricazione: TDBEdit;
    PompaCirc_Portata: TDBEdit;
    PompaCirc_CheckSostituito: TcxDBCheckBox;
    PompaCirc_DataSostituzione: TcxDBDateEdit;
    PompaCirc_NoteSostituzione: TDBEdit;
    PompaCirc_TensioneAlim: TDBEdit;
    PompaCirc_Prevalenza: TDBEdit;
    PompaCirc_Certificazione: TDBEdit;
    PompaCirc_BreveDescApp: TcxDBMemo;
    PompaCirc_NoteMontaggio: TcxDBMemo;
    PompaCirc_DataInstallazione: TcxDBDateEdit;
    PompaCirc_DataCollaudo: TcxDBDateEdit;
    PompaCirc_NomeInstallatore: TDBEdit;
    PompaCirc_NomeCollaudatore: TDBEdit;
    TabAltro: TcxTabSheet;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Bevel21: TBevel;
    Altro_BtnSelezInstallatore: TSpeedButtonRollOver;
    Altro_BtnApriInstallatore: TSpeedButtonRollOver;
    Label103: TLabel;
    Altro_BtnSelezCollaudatore: TSpeedButtonRollOver;
    Altro_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label105: TLabel;
    Bevel29: TBevel;
    Label193: TLabel;
    Label204: TLabel;
    Label102: TLabel;
    Altro_CodiceInstallatore: TDBText;
    Label104: TLabel;
    Altro_CodiceCollaudatore: TDBText;
    Altro_Matricola: TDBEdit;
    PanelAltroCostruttore: TPanel;
    Altro_Costruttore: TDBComboBox;
    PanelAltroModello: TPanel;
    Altro_Modello: TDBComboBox;
    Altro_AnnoFabbricazione: TDBEdit;
    Altro_CheckSostituito: TcxDBCheckBox;
    Altro_DataSostituzione: TcxDBDateEdit;
    Altro_NoteSostituzione: TDBEdit;
    Altro_Certificazione: TDBEdit;
    Altro_BreveDescApp: TcxDBMemo;
    Altro_NoteMontaggio: TcxDBMemo;
    Altro_DataInstallazione: TcxDBDateEdit;
    Altro_DataCollaudo: TcxDBDateEdit;
    Altro_NomeInstallatore: TDBEdit;
    Altro_NomeCollaudatore: TDBEdit;
    TabClima_UnitaEsterna: TcxTabSheet;
    Label101: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Bevel22: TBevel;
    UnExt_BtnSelezInstallatore: TSpeedButtonRollOver;
    UnExt_BtnApriInstallatore: TSpeedButtonRollOver;
    Label114: TLabel;
    UnExt_BtnSelezCollaudatore: TSpeedButtonRollOver;
    UnExt_ApriCollaudatore: TSpeedButtonRollOver;
    Label116: TLabel;
    Bevel30: TBevel;
    Label117: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    Label211: TLabel;
    Label113: TLabel;
    UnExt_CodiceInstallatore: TDBText;
    Label115: TLabel;
    UnExt_CodiceCollaudatore: TDBText;
    UnExt_Matricola: TDBEdit;
    UnExt_Compressori: TDBEdit;
    PanelUnExtCostruttore: TPanel;
    UnExt_Costruttore: TDBComboBox;
    PanelUnExtModello: TPanel;
    UnExt_Modello: TDBComboBox;
    UnExt_AnnoFabbricazione: TDBEdit;
    UnExt_PotFrigorifera: TDBEdit;
    UnExt_CheckSostituito: TcxDBCheckBox;
    UnExt_DataSostituzione: TcxDBDateEdit;
    UnExt_NoteSostituzione: TDBEdit;
    UnExt_Certificazione: TDBEdit;
    UnExt_Refrigerante: TDBEdit;
    UnExt_Carica: TDBEdit;
    UnExt_PotTermicaNominale: TDBEdit;
    UnExt_PotAssorbRaffreddamento: TDBEdit;
    UnExt_TensioneAlimentazione: TDBEdit;
    UnExt_BreveDescApp: TcxDBMemo;
    UnExt_NoteMontaggio: TcxDBMemo;
    UnExt_DataInstallazione: TcxDBDateEdit;
    UnExt_DataCollaudo: TcxDBDateEdit;
    UnExt_NomeInstallatore: TDBEdit;
    UnExt_NomeCollaudatore: TDBEdit;
    TabClima_UnitaInterna: TcxTabSheet;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Bevel23: TBevel;
    UnInt_BtnSelezInstallatore: TSpeedButtonRollOver;
    UnInt_BtnApriInstallatore: TSpeedButtonRollOver;
    Label126: TLabel;
    UnInt_BtnSelezCollaudatore: TSpeedButtonRollOver;
    UnInt_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label128: TLabel;
    Bevel31: TBevel;
    Label129: TLabel;
    Label212: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    UnInt_CodiceInstallatore: TDBText;
    Label127: TLabel;
    UnInt_CodiceCollaudatore: TDBText;
    UnInt_Matricola: TDBEdit;
    PanelUnIntCostruttore: TPanel;
    UnInt_Costruttore: TDBComboBox;
    PanelUnIntModello: TPanel;
    UnInt_Modello: TDBComboBox;
    UnInt_AnnoFabbricazione: TDBEdit;
    UnInt_CheckSostituito: TcxDBCheckBox;
    UnInt_DataSostituzione: TcxDBDateEdit;
    UnInt_NoteSostituzione: TDBEdit;
    UnInt_Certificazione: TDBEdit;
    UnInt_BreveDescApp: TcxDBMemo;
    UnInt_NoteMontaggio: TcxDBMemo;
    UnInt_DataInstallazione: TcxDBDateEdit;
    UnInt_DataCollaudo: TcxDBDateEdit;
    UnInt_NomeInstallatore: TDBEdit;
    UnInt_NomeCollaudatore: TDBEdit;
    UnInt_AbbinatoApparecchio: TcxComboBox;
    TabClima_Monoblocco: TcxTabSheet;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Bevel24: TBevel;
    MonBlk_BtnSelezInstallatore: TSpeedButtonRollOver;
    MonBlk_BtnApriInstallatore: TSpeedButtonRollOver;
    Label139: TLabel;
    MonBlk_BtnSelezCollaudatore: TSpeedButtonRollOver;
    MonBlk_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label161: TLabel;
    Bevel32: TBevel;
    Label165: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    Label219: TLabel;
    Label138: TLabel;
    MonBlk_CodiceInstallatore: TDBText;
    Label140: TLabel;
    MonBlk_CodiceCollaudatore: TDBText;
    MonBlk_Matricola: TDBEdit;
    MonBlk_Compressori: TDBEdit;
    PanelMobBlkCostruttore: TPanel;
    MonBlk_Costruttore: TDBComboBox;
    PanelMobBlkModello: TPanel;
    MonBlk_Modello: TDBComboBox;
    MonBlk_AnnoFabbricazione: TDBEdit;
    MonBlk_PotFrigoriferaNom: TDBEdit;
    MonBlk_CheckSostituito: TcxDBCheckBox;
    MonBlk_DataSostituzione: TcxDBDateEdit;
    MonBlk_NoteSostituzione: TDBEdit;
    MonBlk_Certificazione: TDBEdit;
    MonBlk_Refrigerante: TDBEdit;
    MonBlk_Carica: TDBEdit;
    MonBlk_PotTermicaNom: TDBEdit;
    MonBlk_PotAssorbRaffreddamento: TDBEdit;
    MonBlk_TensioneAlimentazione: TDBEdit;
    MonBlk_BreveDescApp: TcxDBMemo;
    MonBlk_NoteMontaggio: TcxDBMemo;
    MonBlk_DataInstallazione: TcxDBDateEdit;
    MonBlk_DataCollaudo: TcxDBDateEdit;
    MonBlk_NomeInstallatore: TDBEdit;
    MonBlk_NomeCollaudatore: TDBEdit;
    TabFreddo_MacchinaPerFreddo: TcxTabSheet;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Bevel33: TBevel;
    Freddo_BtnSelezInstallatore: TSpeedButtonRollOver;
    Freddo_BtnApriInstallatore: TSpeedButtonRollOver;
    Label175: TLabel;
    Freddo_BtnSelezCollaudatore: TSpeedButtonRollOver;
    Freddo_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label210: TLabel;
    Bevel34: TBevel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label227: TLabel;
    Label174: TLabel;
    Freddo_CodiceInstallatore: TDBText;
    Label176: TLabel;
    Freddo_CodiceCollaudatore: TDBText;
    Freddo_Matricola: TDBEdit;
    Freddo_Compressori: TDBEdit;
    PanelFreddoCostruttore: TPanel;
    Freddo_Costruttore: TDBComboBox;
    PanelFreddoModello: TPanel;
    Freddo_Modello: TDBComboBox;
    Freddo_AnnoCostruzione: TDBEdit;
    Freddo_PotFrigoriferaNom: TDBEdit;
    Freddo_CheckSostituito: TcxDBCheckBox;
    Freddo_DataSostituzione: TcxDBDateEdit;
    Freddo_NoteSostituzione: TDBEdit;
    Freddo_Certificazione: TDBEdit;
    Freddo_Refrigerante: TDBEdit;
    Freddo_Carica: TDBEdit;
    Freddo_PotTermicaNom: TDBEdit;
    Freddo_PotAssorbRaffreddamento: TDBEdit;
    Freddo_TensioneAlimentazione: TDBEdit;
    Freddo_DescBreveApp: TcxDBMemo;
    Freddo_NoteMontaggio: TcxDBMemo;
    Freddo_DataInstallazione: TcxDBDateEdit;
    Freddo_DataCollaudo: TcxDBDateEdit;
    Freddo_NomeInstallatore: TDBEdit;
    Freddo_NomeCollaudatore: TDBEdit;
    PanelOP: TPanel;
    Label218: TLabel;
    GridOP: TcxGrid;
    btvOP: TcxGridDBBandedTableView;
    btvOPIDOP: TcxGridDBBandedColumn;
    btvOPDESCRIZIONE: TcxGridDBBandedColumn;
    btvOPIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    btvOPMINUTIPREVISTI: TcxGridDBBandedColumn;
    btvOPPERIODICITA: TcxGridDBBandedColumn;
    btvOPULTIMA: TcxGridDBBandedColumn;
    btvOPPROSSIMA: TcxGridDBBandedColumn;
    btvOPNOTE: TcxGridDBBandedColumn;
    btvOPID: TcxGridDBBandedColumn;
    btvOPIDPRATICA: TcxGridDBBandedColumn;
    lvOP: TcxGridLevel;
    PanelApparecchio: TPanel;
    Label5: TLabel;
    Bevel4: TBevel;
    PanelApparecchio2: TPanel;
    Label32: TLabel;
    LabelCostruttore2: TLabel;
    LabelModello2: TLabel;
    LabelMatricola2: TLabel;
    LabelDataInstallazione2: TLabel;
    LabelResaFrigorifera2: TLabel;
    LabelTipoMacchina2: TLabel;
    SBDataInstallazione2: TSpeedButtonRollOver;
    Bevel5: TBevel;
    LabelDataCollaudo2: TLabel;
    DBEDataCollaudo2: TLabel;
    LabelTipoRefrigerante2: TLabel;
    LabelTenuta2: TLabel;
    LabelCaricaKG2: TLabel;
    Label34: TLabel;
    DBEMatricola2: TDBEdit;
    DBEDataInstallazione2: TDBEdit;
    PanelCostruttore2: TPanel;
    DBECostruttore2: TDBComboBox;
    PanelModello2: TPanel;
    DBEModello2: TDBComboBox;
    DBETipoMacchina: TDBMemo;
    PanelResaFrigorifera2: TPanel;
    DBEResaFrigorifera2: TDBComboBox;
    PanelTipoRefrigerante2: TPanel;
    DBComboBox4: TDBComboBox;
    PanelTenuta2: TPanel;
    DBComboBox5: TDBComboBox;
    PanelCaricaKG2: TPanel;
    DBComboBox6: TDBComboBox;
    DBENoteMontaggio2: TDBMemo;
    PanelApparecchio3: TPanel;
    Label13: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    SBDataInstallazione3: TSpeedButtonRollOver;
    Bevel9: TBevel;
    Label43: TLabel;
    DBEDataCollaudo3: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEMatricola3: TDBEdit;
    DBEDataInstallazione3: TDBEdit;
    Panel3: TPanel;
    DBECostruttore3: TDBComboBox;
    Panel4: TPanel;
    DBEModello3: TDBComboBox;
    DBEDescrizioneImpianto: TDBMemo;
    Panel5: TPanel;
    DBEPotenza3: TDBComboBox;
    Panel6: TPanel;
    DBComboBox7: TDBComboBox;
    Panel7: TPanel;
    DBComboBox8: TDBComboBox;
    Panel8: TPanel;
    DBComboBox9: TDBComboBox;
    DBENoteMontaggio3: TDBMemo;
    PanelCommittenteCantiere: TPanel;
    Label141: TLabel;
    SBCommittenteCantiere: TSpeedButtonRollOver;
    SpeedButtonRollOver1: TSpeedButtonRollOver;
    DBText5: TDBText;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    CommitDenominazione: TDBEdit;
    CommitIndirizzo: TDBEdit;
    CommitNumCivico: TDBEdit;
    CommitScala: TDBEdit;
    CommitPiano: TDBEdit;
    CommitInterno: TDBEdit;
    CommitCAP: TDBEdit;
    CommitLocalita: TDBEdit;
    CommitProvincia: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    PanelProprietarioImpianto: TPanel;
    Label226: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label234: TLabel;
    Label235: TLabel;
    Label236: TLabel;
    Label237: TLabel;
    Label239: TLabel;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit63: TDBEdit;
    SBProprietario: TSpeedButtonRollOver;
    SBEspandiProprietario: TSpeedButtonRollOver;
    DBText3: TDBText;
    Label240: TLabel;
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
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBText2: TDBText;
    SBEspandiOccupante: TSpeedButtonRollOver;
    SBOccupante: TSpeedButtonRollOver;
    PanelAmministratoreImpianto: TPanel;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBText4: TDBText;
    SBEspandiInstallatore: TSpeedButtonRollOver;
    SBInstallatore: TSpeedButtonRollOver;
    PanelRespImp: TPanel;
    Label251: TLabel;
    DbeInQualitaDi: TcxDBRadioGroup;
    DBText9: TDBText;
    SBEspandiRespImp: TSpeedButtonRollOver;
    SBRespImp: TSpeedButtonRollOver;
    PanelUbicazioneImpianto: TPanel;
    Label267: TLabel;
    Label268: TLabel;
    Label269: TLabel;
    Label271: TLabel;
    Label272: TLabel;
    Label275: TLabel;
    Label276: TLabel;
    PanelNoteImpianto: TPanel;
    Label3: TLabel;
    dbeNote: TDBMemo;
    Label4: TLabel;
    dbeDescrizione: TDBEdit;
    LabelAzioni: TLabel;
    QryPratTELEFONOINST: TStringField;
    QryPratCELLULAREINST: TStringField;
    QryPratCODICEFISCALEINST: TStringField;
    QryPratZONAIMM: TStringField;
    QryPratSCALAIMM: TStringField;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    dbeCodiceCatasto: TDBEdit;
    Label15: TLabel;
    PanelAltroUbicazione: TPanel;
    Altro_Ubicazione: TDBComboBox;
    Label16: TLabel;
    PanelUnExtUbicazione: TPanel;
    DBComboBox1: TDBComboBox;
    Label17: TLabel;
    PanelUnIntUbicazione: TPanel;
    DBComboBox2: TDBComboBox;
    Label24: TLabel;
    PanelMobBlkUbicazione: TPanel;
    DBComboBox3: TDBComboBox;
    Label27: TLabel;
    PanelFreddoUbicazione: TPanel;
    DBComboBox10: TDBComboBox;
    PanelStampaAllegato: TPanel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Label28: TLabel;
    QryPratAppALLEGATO: TStringField;
    QryPratAppPOTENZAELETTRICA: TIBOFloatField;
    QryPratAppPOTENZAFRIGORIFERA: TIBOFloatField;
    QryPratAppPOTENZATERMICA: TIBOFloatField;
    QryPratAppPOTENZATERMICAFOCOLARE: TIBOFloatField;
    QryPratAppVOLUMETRIARISC: TIBOFloatField;
    QryPratAppVOLTAGGIOELETTRICO: TIntegerField;
    QryPratAppCARICA: TIBOFloatField;
    QryPratAppPORTATA: TIBOFloatField;
    QryPratAppPREVALENZA: TIBOFloatField;
    Label29: TLabel;
    GenCal_Garanzia_Mesi: TcxDBComboBox;
    Label31: TLabel;
    GenCal_Garanzia_Mesi_estensione: TcxDBComboBox;
    Label74: TLabel;
    GenCal_Garanzia_APartireDa: TcxDBComboBox;
    Label75: TLabel;
    GenCal_Garanzia_Scadenza: TcxDBDateEdit;
    Label76: TLabel;
    GenCal_Garanzia_Note: TDBEdit;
    Bevel3: TBevel;
    Label77: TLabel;
    Label78: TLabel;
    QryPratAppGARANZIA_MESI: TSmallintField;
    QryPratAppGARANZIA_MESI_ESTENSIONE: TSmallintField;
    QryPratAppGARANZIA_APARTIREDA: TStringField;
    QryPratAppGARANZIA_SCADENZA: TDateTimeField;
    QryPratAppGARANZIA_NOTE: TStringField;
    Label79: TLabel;
    Label248: TLabel;
    Label249: TLabel;
    Label250: TLabel;
    Label277: TLabel;
    Bevel6: TBevel;
    Label278: TLabel;
    Label279: TLabel;
    Bruc_Garanzia_Mesi: TcxDBComboBox;
    Bruc_Garanzia_Mesi_estensione: TcxDBComboBox;
    Bruc_Garanzia_APartireDa: TcxDBComboBox;
    Bruc_Garanzia_Scadenza: TcxDBDateEdit;
    Bruc_Garanzia_Note: TDBEdit;
    Label280: TLabel;
    Label281: TLabel;
    Label282: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Bevel7: TBevel;
    Label285: TLabel;
    Label286: TLabel;
    PompaCirc_Garanzia_Mesi: TcxDBComboBox;
    PompaCirc_Garanzia_Mesi_estensione: TcxDBComboBox;
    PompaCirc_Garanzia_APartireDa: TcxDBComboBox;
    PompaCirc_Garanzia_Scadenza: TcxDBDateEdit;
    PompaCirc_Garanzia_Note: TDBEdit;
    Label287: TLabel;
    Label288: TLabel;
    Label289: TLabel;
    Label290: TLabel;
    Label291: TLabel;
    Bevel16: TBevel;
    Label292: TLabel;
    Label293: TLabel;
    Altro_Garanzia_Mesi: TcxDBComboBox;
    Altro_Garanzia_Mesi_estensione: TcxDBComboBox;
    Altro_Garanzia_APartireDa: TcxDBComboBox;
    Altro_Garanzia_Scadenza: TcxDBDateEdit;
    Altro_Garanzia_Note: TDBEdit;
    Label294: TLabel;
    Label295: TLabel;
    Label296: TLabel;
    Label297: TLabel;
    Label298: TLabel;
    Bevel40: TBevel;
    Label299: TLabel;
    Label300: TLabel;
    UnExt_Garanzia_Mesi: TcxDBComboBox;
    UnExt_Garanzia_Mesi_estensione: TcxDBComboBox;
    UnExt_Garanzia_APartireDa: TcxDBComboBox;
    UnExt_Garanzia_Scadenza: TcxDBDateEdit;
    UnExt_Garanzia_Note: TDBEdit;
    Label301: TLabel;
    Label302: TLabel;
    Label303: TLabel;
    Label304: TLabel;
    Label305: TLabel;
    Bevel41: TBevel;
    Label306: TLabel;
    Label307: TLabel;
    UnInt_Garanzia_Mesi: TcxDBComboBox;
    UnInt_Garanzia_Mesi_estensione: TcxDBComboBox;
    UnInt_Garanzia_APartireDa: TcxDBComboBox;
    UnInt_Garanzia_Scadenza: TcxDBDateEdit;
    UnInt_Garanzia_Note: TDBEdit;
    Label308: TLabel;
    Label309: TLabel;
    Label310: TLabel;
    Label311: TLabel;
    Label312: TLabel;
    Bevel42: TBevel;
    Label313: TLabel;
    Label314: TLabel;
    MonBlk_Garanzia_Mesi: TcxDBComboBox;
    MonBlk_Garanzia_Mesi_estensione: TcxDBComboBox;
    MonBlk_Garanzia_APartireDa: TcxDBComboBox;
    MonBlk_Garanzia_Scadenza: TcxDBDateEdit;
    MonBlk_Garanzia_Note: TDBEdit;
    Label315: TLabel;
    Label316: TLabel;
    Label317: TLabel;
    Label318: TLabel;
    Label319: TLabel;
    Bevel43: TBevel;
    Label320: TLabel;
    Label321: TLabel;
    Freddo_Garanzia_Mesi: TcxDBComboBox;
    Freddo_Garanzia_Mesi_estensione: TcxDBComboBox;
    Freddo_Garanzia_APartireDa: TcxDBComboBox;
    Freddo_Garanzia_Scadenza: TcxDBDateEdit;
    Freddo_Garanzia_Note: TDBEdit;
    QryPratCONTRATTO_STATO: TStringField;
    QryPratCONTRATTO_TIPO: TStringField;
    QryPratCONTRATTO_DATASTIPULA: TDateTimeField;
    QryPratCONTRATTO_VALIDITA_INIZIO: TDateTimeField;
    QryPratCONTRATTO_VALIDITA_FINE: TDateTimeField;
    QryPratCONTRATTO_MESI: TSmallintField;
    QryPratCONTRATTO_MESI_RINNOVO: TSmallintField;
    QryPratCONTRATTO_IMPORTO: TIBOFloatField;
    QryPratCONTRATTO_SOSP_DATA: TDateTimeField;
    QryPratCONTRATTO_SOSP_MESI: TSmallintField;
    QryPratCONTRATTO_DISMESSO_DATA: TDateTimeField;
    QryPratCONTRATTO_DISDETTA_RICEVUTA: TStringField;
    QryPratCONTRATTO_DISDETTA_DATARICEZ: TDateTimeField;
    QryPratCONTRATTO_DISDETTA_MEZZO: TStringField;
    PanelAbbonamentoImpianto: TPanel;
    Label322: TLabel;
    Contratto_Stato: TcxDBRadioGroup;
    Contratto_SospesoMesi: TcxDBComboBox;
    Contratto_SospesoDal: TcxDBDateEdit;
    Contratto_DismessoDal: TcxDBDateEdit;
    Label323: TLabel;
    Contratto_Numero: TcxDBTextEdit;
    Contratto_DataStipula: TcxDBDateEdit;
    Label324: TLabel;
    Label325: TLabel;
    Contratto_Mesi: TcxDBComboBox;
    Label326: TLabel;
    Contratto_MesiRinnovo: TcxDBComboBox;
    Contratto_ValiditaInizio: TcxDBDateEdit;
    Label327: TLabel;
    Contratto_ValiditaScadenza: TcxDBDateEdit;
    Label328: TLabel;
    Label329: TLabel;
    Contratto_DisdettaMezzo: TcxDBComboBox;
    Contratto_Importo: TcxDBCurrencyEdit;
    Label330: TLabel;
    Contratto_DisdettaRicevuta: TcxDBCheckBox;
    Contratto_DisdettaData: TcxDBDateEdit;
    Label331: TLabel;
    Contratto_Tipo: TcxDBComboBox;
    QryPratAppCOMPUTED_APPARECCHIO_FULL: TStringField;
    SP_OP_PRATAPP_ADDALL: TIB_StoredProc;
    btvOPTIPOAPPARECCHIO: TcxGridDBBandedColumn;
    btvOPCOSTRUTTORE: TcxGridDBBandedColumn;
    btvOPMODELLO: TcxGridDBBandedColumn;
    btvOPMATRICOLA: TcxGridDBBandedColumn;
    btvOPUBICAZIONE: TcxGridDBBandedColumn;
    QryOPPRZUNIT: TIBOFloatField;
    QryOPADDEBITA: TStringField;
    btvOPPRZUNIT: TcxGridDBBandedColumn;
    btvOPADDEBITA: TcxGridDBBandedColumn;
    QryOPGG_AUTOSEL: TSmallintField;
    btvOPGG_AUTOSEL: TcxGridDBBandedColumn;
    TabMappa: TcxTabSheet;
    QryPratCOMPUTED_CONTRATTO_SCADUTO: TStringField;
    QryPratFL_USAPREDEFINITI: TStringField;
    QryPratFL_DATI_APPARECCHI: TStringField;
    QryPratFL_DATI_APPARECCHI_SEPARATI: TStringField;
    QryPratFL_DATI_OP: TStringField;
    QryPratFL_DATI_PRECEDENTI: TStringField;
    QryPratFL_DATI_NUMULTINTERV: TIntegerField;
    QryPratFL_DATI_RAPPINT: TStringField;
    QryPratFL_DATI_MERCE: TStringField;
    QryPratFL_DATI_ALTRESPESE: TStringField;
    QryPratFL_DATI_FIRME: TStringField;
    QryPratFL_COPIE: TIntegerField;
    TabParametri: TcxTabSheet;
    ClientAreaParametri: TScrollBox;
    PanelParamFoglioLavoro: TPanel;
    Label384: TLabel;
    Prm_FL_LabelCopie: TLabel;
    Prm_FL_Copie: TDBEdit;
    Prm_FL_LabelPrecedentiUltimi: TLabel;
    Prm_FL_LabelApparecchi: TLabel;
    Shape27: TShape;
    Shape28: TShape;
    Prm_FL_PrecedentiUltimi: TDBEdit;
    Prm_FL_Precedenti: TDBCheckBox;
    Prm_FL_RappInt: TDBCheckBox;
    Prm_FL_RappIntPezzi: TDBCheckBox;
    Prm_FL_RappIntSpese: TDBCheckBox;
    Prm_FL_Firme: TDBCheckBox;
    Panel25: TPanel;
    Prm_FL_Apparecchi: TDBRadioGroup;
    Prm_FL_FogliLavoroSeparati: TDBCheckBox;
    Prm_FL_OP: TDBCheckBox;
    Prm_FL_Predefiniti: TDBCheckBox;
    Prm_FL_OP_DAFARE: TDBCheckBox;
    QryPratFL_DATI_OP_SOLODAFARE: TStringField;
    QryPratAppPOTENZATERMICA2: TIBOFloatField;
    Bruc_CampoFunzionamento2: TDBEdit;
    Label6: TLabel;
    MenuNuovaOP: TPopupMenu;
    Genericaperlimpianto1: TMenuItem;
    Specificaperapparecchio1: TMenuItem;
    btvAppCOMPUTED_APPARECCHIO_FULL: TcxGridDBBandedColumn;
    dbePeriodicitaImpianto: TcxDBComboBox;
    Label14: TLabel;
    TabInterventiPrecedenti: TcxTabSheet;
    QryIntPrec: TIBOQuery;
    QryIntPrecTIPORECORD: TStringField;
    QryIntPrecMASTER_ID: TIntegerField;
    QryIntPrecTIPODOC: TStringField;
    QryIntPrecNUMDOC: TIntegerField;
    QryIntPrecREGDOC: TStringField;
    QryIntPrecDATADOC: TDateTimeField;
    QryIntPrecCODICE: TStringField;
    QryIntPrecDESCRIZIONE: TStringField;
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
    QryIntPrecIDAPPARECCHIOPRAT: TIntegerField;
    QryIntPrecCALC_PRZUNITNETTO: TCurrencyField;
    QryIntPrecCALC_PRZUNITIVACOMPNETTO: TCurrencyField;
    SourceIntPrec: TDataSource;
    QryPresc: TIBOQuery;
    QryPrescTIPORECORD: TStringField;
    QryPrescIDIMPEGNO: TIntegerField;
    QryPrescIDALLEGATO: TIntegerField;
    QryPrescCODICE: TStringField;
    QryPrescDESCRIZIONE: TStringField;
    QryPrescTECNICO_NOME: TStringField;
    QryPrescDATADOC: TDateTimeField;
    QryPrescUNIQUEKEYFIELD: TStringField;
    QryPrescIDAPPARECCHIOPRAT: TIntegerField;
    SourcePresc: TDataSource;
    TimerBlink: TTimer;
    MainPanelPrecedenti: TPanel;
    PanelPrecInt: TPanel;
    Label25: TLabel;
    GridPrecInt: TcxGrid;
    btvPrecInt: TcxGridDBBandedTableView;
    btvPrecIntTIPODOC: TcxGridDBBandedColumn;
    btvPrecIntNUMDOC: TcxGridDBBandedColumn;
    btvPrecIntREGDOC: TcxGridDBBandedColumn;
    btvPrecIntDATADOC: TcxGridDBBandedColumn;
    btvPrecIntCODICE: TcxGridDBBandedColumn;
    btvPrecIntDESCRIZIONE: TcxGridDBBandedColumn;
    btvPrecIntUM: TcxGridDBBandedColumn;
    btvPrecIntQTA: TcxGridDBBandedColumn;
    btvPrecIntPRZUNIT: TcxGridDBBandedColumn;
    btvPrecIntPRZUNITIVACOMP: TcxGridDBBandedColumn;
    btvPrecIntCALC_PRZUNITNETTO: TcxGridDBBandedColumn;
    btvPrecIntCALC_PRZUNITIVACOMPNETTO: TcxGridDBBandedColumn;
    btvPrecIntS1: TcxGridDBBandedColumn;
    btvPrecIntS2: TcxGridDBBandedColumn;
    btvPrecIntS3: TcxGridDBBandedColumn;
    btvPrecIntIMPORTO: TcxGridDBBandedColumn;
    btvPrecIntIMPORTOIVACOMP: TcxGridDBBandedColumn;
    btvPrecIntTECNICO_NOME: TcxGridDBBandedColumn;
    btvPrecIntTIPORECORD: TcxGridDBBandedColumn;
    btvPrecIntMASTER_ID: TcxGridDBBandedColumn;
    btvPrecIntIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    lvPrecInt: TcxGridLevel;
    PanelPrescrizioni: TPanel;
    Label35: TLabel;
    GridPresc: TcxGrid;
    btvPresc: TcxGridDBBandedTableView;
    btvPrescCODICE: TcxGridDBBandedColumn;
    btvPrescDESCRIZIONE: TcxGridDBBandedColumn;
    btvPrescDATADOC: TcxGridDBBandedColumn;
    btvPrescTECNICO_NOME: TcxGridDBBandedColumn;
    btvPrescRISOLTO: TcxGridDBBandedColumn;
    btvPrescTIPORECORD: TcxGridDBBandedColumn;
    btvPrescIDIMPEGNO: TcxGridDBBandedColumn;
    btvPrescIDALLEGATO: TcxGridDBBandedColumn;
    btvPrescUNIQUEKEYFIELD: TcxGridDBBandedColumn;
    btvPrescIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    lvPresc: TcxGridLevel;
    QryPrescFATTO: TStringField;
    QryPrescFATTO_DATA: TDateTimeField;
    QryPrescFATTO_NOTE: TStringField;
    btvPrescFATTO_DATA: TcxGridDBBandedColumn;
    btvPrescFATTO_NOTE: TcxGridDBBandedColumn;
    QryPratNOTEPRIVATE: TMemoField;
    dbeNotePrivateImpianto: TDBMemo;
    PanelCheckNotePrivateImpianto: TPanel;
    cbVediNotePrivateImpianto: TcxCheckBox;
    QryPratCODICEISTATCOMUNEIMM: TStringField;
    dbeComuneImm: TcxDBButtonEdit;
    dbeZonaImm: TcxDBComboBox;
    Label332: TLabel;
    dbeCapImm: TcxDBButtonEdit;
    Label333: TLabel;
    dbeProvinciaImm: TcxDBButtonEdit;
    dbeIndirizzoImm: TcxDBButtonEdit;
    dbeScalaImm: TcxDBTextEdit;
    dbePianoImm: TcxDBTextEdit;
    dbeInternoImm: TcxDBTextEdit;
    QryPratCOMPUTED_STR_CERTIFIED_IMM: TStringField;
    dbeStrCertImageCombo: TcxDBImageComboBox;
    Shape1: TShape;
    PanelTrascinaQui: TPanel;
    Label270: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    dbeEnteRif: TcxDBLookupComboBox;
    Label11: TLabel;
    QryPratENTE_ID: TIntegerField;
    QryEntiLookup: TIBOQuery;
    SourceEntiLookup: TDataSource;
    Label335: TLabel;
    dbePalazzinaImm: TcxDBTextEdit;
    dbeCodiceImpianto: TDBEdit;
    dbeDataImpianto: TcxDBDateEdit;
    Label70: TLabel;
    dbeDataCostruzioneImpianto: TcxDBDateEdit;
    PanelImpiantoCentralizzatoAutonomo: TPanel;
    cxDBRadioGroup2: TcxDBRadioGroup;
    QryPratAUTONOMOCENTRALIZZATO: TStringField;
    QryPratPALAZZOIMM: TStringField;
    QryPratCONTRATTO_NUMERO: TStringField;
    PanelComunicazioniAutomaticheImpianto: TPanel;
    Label336: TLabel;
    Label337: TLabel;
    dbeComSms: TcxDBCheckBox;
    dbeComEmail: TcxDBCheckBox;
    dbeComLettera: TcxDBCheckBox;
    QryPratCOM_SMS: TStringField;
    QryPratCOM_EMAIL: TStringField;
    QryPratCOM_LETTERA: TStringField;
    PanelInfo: TPanel;
    Label338: TLabel;
    Label343: TLabel;
    QryPratRESOURCEID: TIntegerField;
    QryTecnici: TIBOQuery;
    QryTecniciRESOURCEID: TIntegerField;
    QryTecniciRESOURCENAME: TStringField;
    SourceTecnici: TDataSource;
    DBETecnico: TcxDBLookupComboBox;
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
    Label339: TLabel;
    Contratto_Sconto1: TcxDBCurrencyEdit;
    Contratto_Sconto2: TcxDBCurrencyEdit;
    Contratto_Sconto3: TcxDBCurrencyEdit;
    Label340: TLabel;
    Contratto_ImportoNetto: TcxDBCurrencyEdit;
    Label341: TLabel;
    Label342: TLabel;
    Contratto_ImportoNettoIvaComp: TcxDBCurrencyEdit;
    Contratto_CodiceIVA: TcxDBLookupComboBox;
    Label344: TLabel;
    QryPratCONTRATTO_SCONTO1: TIBOFloatField;
    QryPratCONTRATTO_SCONTO2: TIBOFloatField;
    QryPratCONTRATTO_SCONTO3: TIBOFloatField;
    QryPratCONTRATTO_IMPORTONETTO: TIBOFloatField;
    QryPratCONTRATTO_CODICEIVA: TIntegerField;
    QryPratCONTRATTO_IMPORTOIVACOMP: TIBOFloatField;
    QryPratCONTRATTO_IMPORTONETTOIVACOMP: TIBOFloatField;
    QryPratCONTRATTO_ALIQUOTAIVA: TFloatField;
    QryIntPrecINABBONAMENTO: TStringField;
    btvPrecIntINABBONAMENTO: TcxGridDBBandedColumn;
    QryIntPrecRIFDOC_TIPO: TStringField;
    QryIntPrecRIFDOC_NUM: TIntegerField;
    QryIntPrecRIFDOC_REG: TStringField;
    QryIntPrecRIFDOC_DATA: TDateTimeField;
    QryIntPrecRIFDOC_CORRISPNOPAG: TStringField;
    QryIntPrecRIFDOC_TOTALEDOCUMENTO: TIBOFloatField;
    btvPrecIntRIFDOC_TIPO: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_NUM: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_REG: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_DATA: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_CORRISPNOPAG: TcxGridDBBandedColumn;
    btvPrecIntRIFDOC_TOTALEDOCUMENTO: TcxGridDBBandedColumn;
    Button1: TButton;
    QryOPID: TIntegerField;
    PanelRiferimenti: TPanel;
    Label345: TLabel;
    LabelAgenteImp: TLabel;
    LabelAgenteImp2: TLabel;
    LabelAgenteImp3: TLabel;
    LabelAgenteImp4: TLabel;
    dbeAgenteImp: TcxDBComboBox;
    dbeAgenteImp2: TcxDBComboBox;
    dbeAgenteImp3: TcxDBComboBox;
    dbeAgenteImp4: TcxDBComboBox;
    DBEDataApertura: TcxDBDateEdit;
    DBEDataChiusura: TcxDBDateEdit;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    QryPratJOLLY1: TStringField;
    QryPratJOLLY2: TStringField;
    QryPratJOLLY3: TStringField;
    QryPratJOLLY4: TStringField;
    QryPratJOLLY5: TStringField;
    QryPratJOLLY6: TStringField;
    QryPratJOLLY7: TStringField;
    QryPratJOLLY8: TStringField;
    QryPratJOLLY9: TStringField;
    QryPratJOLLY10: TStringField;
    QryPratJOLLY11: TDateTimeField;
    QryPratJOLLY12: TDateTimeField;
    QryPratJOLLY13: TDateTimeField;
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
    LabelJolly11: TLabel;
    LabelJolly12: TLabel;
    LabelJolly13: TLabel;
    DBEJolly11: TcxDBDateEdit;
    DBEJolly12: TcxDBDateEdit;
    DBEJolly13: TcxDBDateEdit;
    Label346: TLabel;
    dbeDataInstallazioneImpianto: TcxDBDateEdit;
    QryPratDATACOSTRUZIONE: TDateTimeField;
    QryPratPOTENZANOMINALEMAX: TIBOFloatField;
    QryPratNATURAGIURIDICARESPIMP: TStringField;
    QryPratNOMERESPIMP: TStringField;
    QryPratCOGNOMERESPIMP: TStringField;
    QryPratPOD: TStringField;
    QryPratPDR: TStringField;
    QryPratAppPROGRESSIVOIMPIANTO: TStringField;
    QryPratAppPROGRESSIVOIMPIANTODI: TStringField;
    Label265: TLabel;
    eCodiceFiscaleRespImp: TDBEdit;
    Label254: TLabel;
    ePIVARespImp: TDBEdit;
    Label261: TLabel;
    eIndirizzoRespImp: TDBEdit;
    Label262: TLabel;
    eNumCivicoRespImp: TDBEdit;
    Label263: TLabel;
    eCittaRespImp: TDBEdit;
    Label264: TLabel;
    eCAPRespImp: TDBEdit;
    Label266: TLabel;
    eProvinciaRespImp: TDBEdit;
    Label347: TLabel;
    eTelefonoRespImp: TDBEdit;
    Label348: TLabel;
    eCellulareRespImp: TDBEdit;
    QryPratPARTITAIVARESPIMP: TStringField;
    Label349: TLabel;
    dbePotenzaNominaleTotMax: TDBEdit;
    Label350: TLabel;
    dbePOD: TDBEdit;
    Label351: TLabel;
    Label352: TLabel;
    dbePDR: TDBEdit;
    Shape22: TShape;
    Label353: TLabel;
    DBEdit1: TDBEdit;
    Label354: TLabel;
    DBEdit5: TDBEdit;
    QryPratAppTIPOLOGIA2: TStringField;
    QryPratAppTIPOLOGIA2_ALTRO: TStringField;
    GenCal_Tipologia2: TcxDBRadioGroup;
    cxDBComboBox1: TcxDBComboBox;
    DBEtIPOLOGIA2aLTRO: TDBEdit;
    QryPratCATASTO_SEZIONE_IMM: TStringField;
    QryPratCATASTO_FOGLIO_IMM: TStringField;
    QryPratCATASTO_PARTICELLA_IMM: TStringField;
    QryPratCATASTO_SUB_IMM: TStringField;
    Label334: TLabel;
    dbeNumCivicoImm: TcxDBTextEdit;
    Label355: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    Label356: TLabel;
    Label357: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label358: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label359: TLabel;
    QryPratAppRAFFRESCAMENTO: TStringField;
    UnExt_Riscaldamento: TcxDBCheckBox;
    UnExt_AcquaSanitarla: TcxDBCheckBox;
    QryPratAppNUMCIRCUITI: TIntegerField;
    Label360: TLabel;
    UnExt_NumCircuiti: TDBEdit;
    Label361: TLabel;
    UnExt_Raffrescamento: TcxDBCheckBox;
    UnExt_TipologiaGeneratore: TcxDBComboBox;
    Label362: TLabel;
    UnExt_Label_Combustibile: TLabel;
    UnExt_Combustibile: TDBEdit;
    QryPratAppCUCINA: TStringField;
    QryPratAppTIPOTIRAGGIO_ALTRO: TStringField;
    TabTermo_GeneratoreDiCaloreBiomassa: TcxTabSheet;
    Label363: TLabel;
    Label364: TLabel;
    Label365: TLabel;
    Label366: TLabel;
    Label367: TLabel;
    Label370: TLabel;
    Label371: TLabel;
    Label374: TLabel;
    Label375: TLabel;
    Label377: TLabel;
    GenCalBio_BtnSelezInstallatore: TSpeedButtonRollOver;
    GenCalBio_BtnApriInstallatore: TSpeedButtonRollOver;
    Label378: TLabel;
    Label379: TLabel;
    GenCalBio_BtnSelezCollaudatore: TSpeedButtonRollOver;
    GenCalBio_BtnApriCollaudatore: TSpeedButtonRollOver;
    Label380: TLabel;
    Label382: TLabel;
    GenCalBio_CodiceInst: TDBText;
    GenCalBio_CodiceColl: TDBText;
    Label386: TLabel;
    Label387: TLabel;
    Label388: TLabel;
    Label389: TLabel;
    Label390: TLabel;
    Label391: TLabel;
    Label392: TLabel;
    Label393: TLabel;
    Label394: TLabel;
    Label368: TLabel;
    GenCalBio_Matricola: TDBEdit;
    GenCalBio_PotNominaleUtile: TDBEdit;
    Panel_GenCalBio_Marca: TPanel;
    GenCalBio_Marca: TDBComboBox;
    Panel_GenCalBio_Modello: TPanel;
    GenCalBio_Modello: TDBComboBox;
    GenCalBio_AnnoFabbricazione: TDBEdit;
    Panel_GenCalBio_LocaleInstallazione: TPanel;
    GenCalBio_LocaleInstallazione: TDBComboBox;
    GenCalBio_CodiceCatasto: TDBEdit;
    GenCalBio_BreveDesc: TcxDBMemo;
    GenCalBio_NoteMontaggio: TcxDBMemo;
    GenCalBio_DataInstallazione: TcxDBDateEdit;
    GenCalBio_DataColl: TcxDBDateEdit;
    GenCalBio_RagSocInst: TDBEdit;
    GenCalBio_RagSocColl: TDBEdit;
    GenCalBio_GaranziaMesi: TcxDBComboBox;
    GenCalBio_GaranziaExtMesi: TcxDBComboBox;
    GenCalBio_GaranziaDa: TcxDBComboBox;
    GenCalBio_GaranziaScad: TcxDBDateEdit;
    GenCalBio_GaranziaNote: TDBEdit;
    GenCalBio_GenNum: TDBEdit;
    GenCalBio_GenNumDi: TDBEdit;
    GenCalBio_Tipologia: TcxDBComboBox;
    GenCalBio_Riscaldamento: TcxDBCheckBox;
    GenCalBio_Cucina: TcxDBCheckBox;
    GenCalBio_AcquaSanitaria: TcxDBCheckBox;
    Label369: TLabel;
    GenCalBio_TipoCaminetto: TcxDBComboBox;
    Label372: TLabel;
    GenCalBio_TipoStufa: TcxDBComboBox;
    Label373: TLabel;
    GenCalBio_TradCond: TcxDBComboBox;
    Label376: TLabel;
    GenCalBio_TipoStufa_Altro: TDBEdit;
    Label381: TLabel;
    GenCalBio_TradCond_Altro: TDBEdit;
    Generatoredicaloreabiomassacombustibile1: TMenuItem;
    GenCalBio_PanelMarcaturaCE: TPanel;
    Label383: TLabel;
    GenCalBio_MarcaturaCE: TcxDBRadioGroup;
    GenCalBio_PanelPlaccaCamino: TPanel;
    Label385: TLabel;
    cxDBRadioGroup51: TcxDBRadioGroup;
    GenCalBio_PanelModalitaEvacuazFumi: TPanel;
    Label395: TLabel;
    cxDBRadioGroup52: TcxDBRadioGroup;
    GenCalBio_PanelAriaComburente: TPanel;
    Label396: TLabel;
    cxDBRadioGroup53: TcxDBRadioGroup;
    GenCalBio_ControlloAriaComburente: TPanel;
    Label397: TLabel;
    cxDBRadioGroup54: TcxDBRadioGroup;
    GenCalBio_CaricamentoCombustibile: TPanel;
    Label398: TLabel;
    cxDBRadioGroup55: TcxDBRadioGroup;
    Shape5: TShape;
    Shape6: TShape;
    Shape8: TShape;
    Shape9: TShape;
    GenCalBio_PanelCombustibile: TPanel;
    Label399: TLabel;
    cxDBRadioGroup56: TcxDBRadioGroup;
    DBEdit34: TDBEdit;
    Shape10: TShape;
    Shape11: TShape;
    QryPratAppMARCATURACE: TStringField;
    QryPratAppPLACCACAMINO: TStringField;
    QryPratAppMODEVACUAZFUMI: TStringField;
    QryPratAppARIACOMBURENTE: TStringField;
    QryPratAppCONTRARIACOMBURENTE: TStringField;
    QryPratAppCARICACOMBUSTIBILE: TStringField;
    Label400: TLabel;
    MonBlk_NumCircuiti: TDBEdit;
    Label401: TLabel;
    Freddo_NumCircuiti: TDBEdit;
    Label402: TLabel;
    MonBlk_Riscaldamento: TcxDBCheckBox;
    MonBlk_Raffrescamento: TcxDBCheckBox;
    MonBlk_AcquaSanitarla: TcxDBCheckBox;
    Label403: TLabel;
    MonBlk_TipologiaGeneratore: TcxDBComboBox;
    Label404: TLabel;
    MonBlk_Combustibile: TDBEdit;
    Label405: TLabel;
    Freddo_Riscaldamento: TcxDBCheckBox;
    Freddo_Raffrescamento: TcxDBCheckBox;
    Freddo_AcquaSanitarla: TcxDBCheckBox;
    Label406: TLabel;
    Freddo_TipologiaGeneratore: TcxDBComboBox;
    Label407: TLabel;
    Freddo_Combustibile: TDBEdit;
    GenCalBio_CheckSostituito: TcxDBCheckBox;
    GenCalBio_DataSostituzione: TcxDBDateEdit;
    Label408: TLabel;
    GenCalBio_NoteSostituzione: TDBEdit;
    Shape7: TShape;
    LabelRagioneSociale: TLabel;
    LabelNome: TLabel;
    LabelCognome: TLabel;
    LabelTipoPersona: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    dbeNaturaGiuridica: TcxDBRadioGroup;
    eRagSocRespImp: TDBEdit;
    eNomeRespImp: TDBEdit;
    eCognomeRespImp: TDBEdit;
    QryPratCOSTOUNITOPERA1_1: TIBOFloatField;
    QryPratCOSTOUNITOPERA1_2: TIBOFloatField;
    QryPratCOSTOUNITOPERA1_3: TIBOFloatField;
    QryPratCOSTOUNITOPERA1_4: TIBOFloatField;
    QryPratCOSTOUNITOPERA1_5: TIBOFloatField;
    QryPratNOME: TStringField;
    Label71: TLabel;
    Nome: TDBEdit;
    DBEAccorpaManodoperaBacheca: TcxDBCheckBox;
    QryPratACCORPAOPERAINBACHECA: TStringField;
    QryIntPrecAPPARECCHIO_FULL: TStringField;
    btvPrecIntAPPARECCHIO_FULL: TcxGridDBBandedColumn;
    QryPratRAGSOCIMM: TStringField;
    Label252: TLabel;
    dbeRagSocImm: TcxDBButtonEdit;
    QryIva: TIBOQuery;
    QryIvaCODICEIVA: TIntegerField;
    QryIvaDESCRIZIONEIVA: TStringField;
    QryIvaALIQUOTAIVA: TIBOFloatField;
    DSIva: TDataSource;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    PanelParamChiusuraAutomatica: TPanel;
    Label253: TLabel;
    eChiusuraAutomatica_Enabled: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label409: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label411: TLabel;
    PanelParamCompilazioneAutomaticaDocumento: TPanel;
    Label413: TLabel;
    PanelParamCalcoloProxVisita: TPanel;
    Label414: TLabel;
    ePanelDefaultProxVisitaInBase: TPanel;
    rgPanelDefaultProxVisitaInBase: TDBRadioGroup;
    Label415: TLabel;
    Label416: TLabel;
    ePanelCalcoloProxVisitaAPartireDa: TPanel;
    rgPanelCalcoloProxVisitaAPartireDa: TDBRadioGroup;
    Label417: TLabel;
    eIncludiOPFatte: TDBCheckBox;
    eIncludiRifContratto: TDBCheckBox;
    eIncludiDicitura: TDBCheckBox;
    eDicitura: TDBEdit;
    Label412: TLabel;
    QryPratPRM_PROXVISITA_INBASEA: TStringField;
    QryPratPRM_PROXVISITA_ADDPERIODSU: TStringField;
    QryPratPRM_AUTODOC_OPFATTE: TStringField;
    QryPratPRM_AUTODOC_RIFCONTRATTO: TStringField;
    QryPratPRM_AUTODOC_DICITURA: TStringField;
    QryPratPRM_AUTODOC_DICITURATXT: TStringField;
    QryPratPRM_AUTOCLOSE_ENABLED: TStringField;
    QryPratPRM_AUTOCLOSE_SOLOMANUT: TStringField;
    QryPratPRM_AUTOCLOSE_FATTURA: TStringField;
    QryPratPRM_AUTOCLOSE_SCAD: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure DescrizioneEnter(Sender: TObject);
    procedure DescrizioneExit(Sender: TObject);
    procedure ImpostaLayout;
    procedure QryPratCLIENTEChange(Sender: TField);
    procedure QryPratCODICEUTChange(Sender: TField);
    procedure QryPratCODICEINSTChange(Sender: TField);
    procedure SBEspandiProprietarioClick(Sender: TObject);
    procedure SBProprietarioClick(Sender: TObject);
    procedure SBEspandiOccupanteClick(Sender: TObject);
    procedure SBEspandiInstallatoreClick(Sender: TObject);
    procedure SBOccupanteClick(Sender: TObject);
    procedure SBInstallatoreClick(Sender: TObject);
    procedure DBEModello2Change(Sender: TObject);
    procedure DBEModello3Change(Sender: TObject);
    procedure tvS1CustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure tvS1CustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure tvS1CustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure QryS1BeforePost(DataSet: TDataSet);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure SpeedButtonRollOver1Click(Sender: TObject);
    procedure SpeedButtonRollOver3Click(Sender: TObject);
    procedure SpeedButtonRollOver5Click(Sender: TObject);
    procedure SBCommittenteCantiereClick(Sender: TObject);
    procedure SBProprietarioCantiereClick(Sender: TObject);
    procedure SBImmobileCantiereClick(Sender: TObject);
    procedure QryPratCOMMITCODICEChange(Sender: TField);
    procedure QryPratPROPCODICEChange(Sender: TField);
    procedure QryPratIMMOBCODICEChange(Sender: TField);
    procedure SBSocGasCantiereClick(Sender: TObject);
    procedure QryPratAfterOpen(DataSet: TDataSet);
    procedure QryPratBeforeClose(DataSet: TDataSet);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure SBEspandiRespImpClick(Sender: TObject);
    procedure SBRespImpClick(Sender: TObject);
    procedure QryPratCODICERESPIMPChange(Sender: TField);
    procedure PanelRespImp_OldDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PanelRespImp_OldDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Annulladatachiusura1Click(Sender: TObject);
    procedure PopupMenuDataChiusuraPopup(Sender: TObject);
    procedure Categ1DropDown(Sender: TObject);
    procedure QryPratAppBeforePost(DataSet: TDataSet);
    procedure Generatoredicalore1Click(Sender: TObject);
    procedure Bruciatore1Click(Sender: TObject);
    procedure Pompadicircolazione1Click(Sender: TObject);
    procedure Unitesterna1Click(Sender: TObject);
    procedure Unitinterna1Click(Sender: TObject);
    procedure Monoblocco1Click(Sender: TObject);
    procedure Macchinaperfreddo1Click(Sender: TObject);
    procedure Altro1Click(Sender: TObject);
    procedure btvAppFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GenCal_CostruttoreDropDown(Sender: TObject);
    procedure GenCal_ModelloDropDown(Sender: TObject);
    procedure GenCal_LocaleInstallazioneDropDown(Sender: TObject);
    procedure GenCal_MarcaEfficienzaEnergDropDown(Sender: TObject);
    procedure GenCal_FluidoTermovettoreDropDown(Sender: TObject);
    procedure QryPratAppINSTCODICEChange(Sender: TField);
    procedure QryPratAppCOLLCODICEChange(Sender: TField);
    procedure GenCal_BtnSelezInstallatoreClick(Sender: TObject);
    procedure GenCal_BtnSelezCollaudatoreClick(Sender: TObject);
    procedure GenCal_BtnApriInstallatoreClick(Sender: TObject);
    procedure GenCal_BtnApriCollaudatoreClick(Sender: TObject);
    procedure Bruc_AbbinatoApparecchioPropertiesInitPopup(Sender: TObject);
    procedure QryPratAppIDAPPABBINATOChange(Sender: TField);
    procedure QryPratAppAfterScroll(DataSet: TDataSet);
    procedure Bruc_AbbinatoApparecchioKeyPress(Sender: TObject; var Key: Char);
    procedure QryPratBeforePost(DataSet: TDataSet);
    procedure QryPratAppCalcFields(DataSet: TDataSet);
    procedure Bruc_AbbinatoApparecchioPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure UnInt_AbbinatoApparecchioPropertiesInitPopup(Sender: TObject);
    procedure btvAppCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure QryPratAppAfterOpen(DataSet: TDataSet);
    procedure QryPratAppAfterPost(DataSet: TDataSet);
    procedure QryPratAppAfterRefresh(DataSet: TDataSet);
    procedure QryPratAppAfterDelete(DataSet: TDataSet);
    procedure btvAppDISMESSOGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: String);
    procedure GenCal_CheckSostituitoPropertiesEditValueChanged(Sender: TObject);
    procedure NuovoRigoOP(CodOP: String; Mode: TAddArtMode; CodiceApparecchio: Integer = -1);
    procedure QryOPBeforePost(DataSet: TDataSet);
    procedure btvOPULTIMAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
    procedure FormResize(Sender: TObject);
    procedure MainPageControlChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QryPratAppGARANZIA_MESIChange(Sender: TField);
    procedure GenCal_Garanzia_MesiPropertiesInitPopup(Sender: TObject);
    procedure GenCal_Garanzia_Mesi_estensionePropertiesInitPopup(Sender: TObject);
    procedure Contratto_ImportoKeyPress(Sender: TObject; var Key: Char);
    procedure Contratto_TipoPropertiesInitPopup(Sender: TObject);
    procedure QryPratCONTRATTO_MESIChange(Sender: TField);
    procedure MainPageControlPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure btvOPCustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure QryPratAGENTEChange(Sender: TField);
    procedure QryPratAGENTE2Change(Sender: TField);
    procedure QryPratAGENTE3Change(Sender: TField);
    procedure QryPratAGENTE4Change(Sender: TField);
    procedure GenCal_ModelloChange(Sender: TObject);
    procedure dbeAgentePropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgentePropertiesInitPopup(Sender: TObject);
    procedure dbeAgente2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente4PropertiesInitPopup(Sender: TObject);
    procedure Prm_FL_PredefinitiClick(Sender: TObject);
    procedure Genericaperlimpianto1Click(Sender: TObject);
    procedure MenuNuovaOPPopup(Sender: TObject);
    function NuovoApparecchio(Tipo: String): Integer;
    procedure btvPrescDataControllerDataChanged(Sender: TObject);
    procedure TimerBlinkTimer(Sender: TObject);
    procedure btvPrescEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure btvPrescCODICECustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvPrescDESCRIZIONECustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvPrescRISOLTOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvPrecIntCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvPrecIntCustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure btvPrecIntQTAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
    procedure QryIntPrecCalcFields(DataSet: TDataSet);
    procedure btvPrescRISOLTOPropertiesEditValueChanged(Sender: TObject);
    procedure cbVediNotePrivateImpiantoPropertiesChange(Sender: TObject);
    procedure QryPratAfterPost(DataSet: TDataSet);
    procedure btvPrecIntEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure dbeZonaImmPropertiesInitPopup(Sender: TObject);
    procedure dbeComuneImmPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure QryPratCalcFields(DataSet: TDataSet);
    procedure PanelProprietarioImpiantoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PanelProprietarioImpiantoEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure PanelTrascinaQuiDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure PanelTrascinaQuiDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sbContrattoRinnovaClick(Sender: TObject);
    procedure QryOPPRZUNITValidate(Sender: TField);
    procedure btvOPPROSSIMACustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvOPPRZUNITNETTOIVACOMPCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QryPratCONTRATTO_STATOChange(Sender: TField);
    procedure btvOPPRZUNITNETTOIVACOMPGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvOPPRZUNITGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvOPPERIODICITAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvOPCODICEIVAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvOPEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure QryPratCONTRATTO_IMPORTOValidate(Sender: TField);
    procedure btvOPCODICEIVACustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure QryOPPRZUNITNETTOIVACOMPValidate(Sender: TField);
    procedure Button1Click(Sender: TObject);
    procedure QryPratCONTRATTO_IMPORTONETTOIVACOMPValidate(Sender: TField);
    procedure dbeAgenteImpPropertiesInitPopup(Sender: TObject);
    procedure dbeAgenteImp2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgenteImp3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgenteImp4PropertiesInitPopup(Sender: TObject);
    procedure dbeAgenteImpPropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgenteImp2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgenteImp3PropertiesEditValueChanged(Sender: TObject);
    procedure btvPrecIntDataControllerCompare(ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2, AItemIndex: Integer;
      const V1, V2: Variant; var Compare: Integer);
    procedure Generatoredicaloreabiomassacombustibile1Click(Sender: TObject);
    procedure eIndirizzoRespImpExit(Sender: TObject);
    procedure dbeNaturaGiuridicaPropertiesChange(Sender: TObject);
    procedure eCognomeRespImpKeyPress(Sender: TObject; var Key: Char);
    procedure btvPrecIntAPPARECCHIO_FULLGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure btvAppNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
    procedure QryS1BeforeDelete(DataSet: TDataSet);
    procedure QryPratAppMATRICOLAChange(Sender: TField);
    procedure AzzeraStato1Click(Sender: TObject);
    procedure DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
    // Flags che abilitano o meno la copia dell'Agente relativo nella descrizione della pratica se voluto dall'utente (EXIS)
    vCopiaAgente1PratToDescrizione, vCopiaAgente2PratToDescrizione, vCopiaAgente3PratToDescrizione, vCopiaAgente4PratToDescrizione: Boolean;
    // Array che contiene gli ID degli apparecchi che sono principali e i quali sono
    // sono abbinati altri apparecchi. MI serve per impostare il campo COMPUTED_ABBINATO
    // a True anche per gli articoli principali di un abbinamento.
    ElencoAbbinatiPrincipali: array of Integer;
    // Variabile che contiene il valore del campo Tipo della tabella Pratiche in base
    // alla modalità con ciu viene richiama la form
    CampoTipo: String[1];

    // Parametro che, quando si esporta dal GC alla bacheca, indica se la manodopera e le altre spese devono essere riepilogate
    // cumulativamente alla fine del documento destinazione oppure no
    FBachecaAccorpaManodopera: Boolean;

    // FOrm della mappa
    fMapForm: TGmapForm;

    fCalcoloInCorso: Boolean;

    fCaller_DataPratica: TDateTimeField;
    fCaller_CodicePratica: TIntegerField;
    fCaller_IdPratica: TIntegerField;

    // Proprietà che indica che l'anagrafica dell'impianto è ststa richiamata da dentro un documento
    // e quindi poi viene usata per determinare se le pagine di OP, Precedenti ecc. debbano
    // essere visibili oppure no.
    // (Ho deciso che quando viene richiamata da dentro un documento non devono essere visibili)
    fFromDocument: Boolean;

    // IMposta il flag che indica se usare la transazione o meno
    // NB: Questo flag impedisce alla form di usare la transazione
    // e viene usato quando l'anagrafica viene richiamata da dentro
    // una documento e c'è una transazione già in atto (quella del
    // documento). HO fatto questo per fare in modo che l'anagrafica
    // della pratica fosse editabile anche quando richiamata da dentro un
    // documento.
    fDisableTransaction: Boolean;

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    // Puntatore alla form degli Allegati relativa a questa form stessa
    fAllegatiForm: TAllegatiForm;
    fPrescrizioni_InEvidenza: Boolean;
    fPrescrizioni_Evidenzia: Boolean;
    fNotePrivateImpianto_Evidenzia: Boolean;
    fNotePrivateImpianto_InEvidenza: Boolean;
    procedure Allegati_AggiornaDatiFiltri;
    procedure Allegati_CreaForm;
    procedure Allegati_VerificaAbilitazione;
    // =========================================================================

    procedure CopiaSottocantieriDaModello;
    function PanelFocused(Panel: TControl): Boolean;
    procedure CaricaDescrizioneApparecchioAbbinato;
    procedure AggiornaIdApparecchi;
    procedure AggiornaIdOP;
    function Abbinato(CurrRecord: TcxCustomGridRecord): Boolean;
    function Abbinato_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
    function Abbinato_Ultimo(CurrRecord: TcxCustomGridRecord): Boolean;
    procedure RefreshElencoAbbinatiPrincipali;
    function IntegerInArray(const Value: Integer; const ArrayOfInteger: array of Integer): Boolean;
    function Dismesso(CurrRecord: TcxCustomGridRecord): Boolean;
    function Dismesso_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
    procedure ImportaOpPerTipoImpianto(TipoImpianto: String);
    procedure ImpostaLayout_Pratiche;
    procedure ImpostaLayout_Impianti;
    procedure ResetFocus;
    procedure RicalcolaScadenzaGaranziaApparecchio;
    procedure OP_OpenOrRefresh;
    procedure DistruggiMappa;
    procedure CopiaAgenteInDescrizionePratica;
    function GetParamRappIntPredefiniti: Boolean;
    procedure SetParamRappIntPredefiniti(const Value: Boolean);
    procedure CaricaParametriDefault;
    procedure CaricaSubMenuNuovaOP;
    procedure ApriQueryElencoUltimiInterventi;
    procedure ApriQueryElencoPrescrizioni;
    procedure RefreshQueryElencoPrescrizioni;
    procedure RefreshTabPrescrizioni;
    procedure SetPrescrizioni_Evidenzia(const Value: Boolean);
    procedure SetPrescrizioni_InEvidenza(const Value: Boolean);
    procedure MarcaPrescrizioniComeFatte;
    procedure ImpostaDimensioniPannelliNote;
    procedure SetNotePrivateImpianto_Evidenzia(const Value: Boolean);
    procedure SetNotePrivateImpianto_InEvidenza(const Value: Boolean);
    procedure ControllaEvidenziazioneNotePrivateImpianto;
    procedure ControlloMatricolaApparecchioEsistente;
  public
    { Public declarations }
    // Queste contengono i riferimenti al record da visualizzare/editare
    CodicePratica: Longint;
    DataApertura: TDate;
    CodiceCliente: String;
    Mode: Byte;
    // Proprietà che contiene il rifeirmento ad una eventuale pratica di riferimenti
    // da cui copiare i sottocantieri alla conferma di un nuovo cantiere appena creato.
    DatiModelloPratica: TDatiModelloPratica;
    // Tipo del nuovo impianto da creare
    TipoNuovoImpianto: String;
    // Proprietà che punta alla form della mappa
    property MapForm: TGmapForm read fMapForm write fMapForm;
    // Proprietà che indica se i parametri di stampa del foglio di lavoro sono
    // presi dai predefiniti dei Parametri e progressivi oppure no
    property ParamRappIntPredefiniti: Boolean read GetParamRappIntPredefiniti write SetParamRappIntPredefiniti;
    // Proprietà che viene usata per far lampeggiare le prescrizioni se ci sono e che indica se in questo momento
    // è in evidenza oppure no
    property Prescrizioni_InEvidenza: Boolean read fPrescrizioni_InEvidenza write SetPrescrizioni_InEvidenza;
    property NotePrivateImpianto_InEvidenza: Boolean read fNotePrivateImpianto_InEvidenza write SetNotePrivateImpianto_InEvidenza;
    // Proprietà che indica se le prescrizioni sono presenti e quindi sono da evidenziare oppure no
    property Prescrizioni_Evidenzia: Boolean read fPrescrizioni_Evidenzia write SetPrescrizioni_Evidenzia;
    property NotePrivateImpianto_Evidenzia: Boolean read fNotePrivateImpianto_Evidenzia write SetNotePrivateImpianto_Evidenzia;

    // Proprietà che punta ai TField (Codice e data) della form chiamante (normalmente un documento)
    // in modo che alla conferma dell'anagrafica pratica si possano poi aggiornare anche i
    // dati del documento stesso.
    property Caller_IdPratica: TIntegerField read fCaller_IdPratica write fCaller_IdPratica;
    property Caller_CodicePratica: TIntegerField read fCaller_CodicePratica write fCaller_CodicePratica;
    property Caller_DataPratica: TDateTimeField read fCaller_DataPratica write fCaller_DataPratica;

    // Proprietà che indica che l'anagrafica dell'impianto è ststa richiamata da dentro un documento
    // e quindi poi viene usata per determinare se le pagine di OP, Precedenti ecc. debbano
    // essere visibili oppure no.
    // (Ho deciso che quando viene richiamata da dentro un documento non devono essere visibili)
    property FromDocument: Boolean read fFromDocument write fFromDocument;

    // IMposta il flag che indica se usare la transazione o meno
    // NB: Questo flag impedisce alla form di usare la transazione
    // e viene usato quando l'anagrafica viene richiamata da dentro
    // una documento e c'è una transazione già in atto (quella del
    // documento). HO fatto questo per fare in modo che l'anagrafica
    // della pratica fosse editabile anche quando richiamata da dentro un
    // documento.
    property DisableTransaction: Boolean read fDisableTransaction write fDisableTransaction;
  end;

var
  PraticaForm: TPraticaForm;

implementation

uses main, FormHelp, SchedaClienti, Variants,
  FormOperazioniPianificate, FormLevanteListAnag, DateUtils, Types,
  DataModuleStyles, DataModule2, cxVariants, StrUtils;

{$R *.DFM}

// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
// Procedure che crea la form degli allegati se questa non esiste già e la
// apre, alla fine esegue l'interrogazione per mostrare gli allegati.
procedure TPraticaForm.Allegati_CreaForm;
begin
  // Se la form degli allegati non è stata ancora creata la crea.
  if not Assigned(fAllegatiForm) then
  begin
    // Crea la form degli allegati
    fAllegatiForm := MainForm.Allegati_CreaForm(PanelAllegati);
    // Passa lo Splitter alla finestra degli allegati
    fAllegatiForm.Splitter := SplitterAllegati;
    // Parte con lo splitter chiuso
    // SplitterAllegati.CloseSplitter;
  end;
  // Imposta i filtri
  Allegati_AggiornaDatiFiltri;
end;

// Procedure che aggiorna i filtri di collegamento della form degli allegati
// con la form attuale
procedure TPraticaForm.Allegati_AggiornaDatiFiltri;
begin
  // Ovviamente se la form degli allegati è chiusa esce subito
  if fAllegatiForm = nil then
    Exit;

  // Azzeramento filtri
  fAllegatiForm.AzzeraFiltri;

  // Codice soggetto
  if not QryPratCLIENTE.IsNull then
    fAllegatiForm.Filter_CodSogg := QryPratCLIENTE.Value;

  // Codice Pratica
  if not QryPratCODICE.IsNull then
    fAllegatiForm.Filter_CodPrat := QryPratCODICE.Value;
  // Data Pratica
  if not QryPratDATAAPERTURA.IsNull then
    fAllegatiForm.Filter_DataPrat := QryPratDATAAPERTURA.Value;

  // Imposta i filtri
  fAllegatiForm.ImpostaFiltri;

  // Effettua l'interrogazione
  fAllegatiForm.EseguiQuery;
end;

// Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
// determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
procedure TPraticaForm.Allegati_VerificaAbilitazione;
begin
  // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
  // stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
  // perchè abbiamo scelto che non si possono inserire allegati in documento in fase
  // di creazione finchè non è stato confermato almeno la prima volta.
  if (QryPrat.State = dsInsert) then
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

procedure TPraticaForm.ControlloMatricolaApparecchioEsistente;
var
  Qry: TIB_Cursor;
  LMatricola: String;
  LCurrentID: Integer;
begin
  LCurrentID := QryPratAppID.AsInteger;
  LMatricola := Uppercase(Trim(QryPratAppMATRICOLA.AsString));
  if LMatricola = '' then
    Exit;
  // Crea l'oggetto query, lo imposta e lo esegue per vedere se il codice articolo è già esistente
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) FROM PRATAPPARECCHI');
    Qry.SQL.Add('WHERE UPPER(MATRICOLA) = ' + QuotedStr(LMatricola));
    Qry.SQL.Add('  AND ID <> ' + IntToStr( LCurrentID));
    Qry.Open;
    if Qry.Fields[0].Value > 0 then
      DM1.Messaggi('A T T E N Z I O N E !!!', 'Matricola già presente'#13#13'Un apparecchio con la stessa matricola è già presente negli archivi di Levante.'#13#13'Si consiglia di verificare per non inserire duplicati.', '', [mbOk], 0, nil);
  finally
    // Distrugge la query
    Qry.Free;
  end;
end;

// Procedure che copia i sottocantiere dal cantiere modello alla fine della creazione
// di una nuovo cantiere.
procedure TPraticaForm.CopiaSottocantieriDaModello;
  procedure CopiaSottocantiere(IDX: Integer);
  var
    QSrc, QDst: TIB_Cursor;
  begin
    try
      // IMpostazione query sorgente
      QSrc := TIB_Cursor.Create(Self);
      QSrc.DatabaseName := DM1.ArcDBFile;
      QSrc.IB_Connection := DM1.DBAzienda;
      QSrc.SQL.Add('SELECT ID FROM SOTTOCANTIERI' + IntToStr(IDX) + ' WHERE');
      QSrc.SQL.Add('  TIPOCANTIERE = ' + QuotedStr(DatiModelloPratica.Tipo));
      QSrc.SQL.Add('  AND CODICECANTIERE = ' + IntToStr(DatiModelloPratica.Codice));
      QSrc.SQL.Add('  AND DATAAPERTURACANTIERE = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DatiModelloPratica.DataApertura)));
      // IMpostazione query destinazione
      QDst := TIB_Cursor.Create(Self);
      QDst.DatabaseName := DM1.ArcDBFile;
      QDst.IB_Connection := DM1.DBAzienda;
      QDst.SQL.Add('INSERT INTO SOTTOCANTIERI' + IntToStr(IDX));
      QDst.SQL.Add('(ID, TIPOCANTIERE, CODICECANTIERE, DATAAPERTURACANTIERE)');
      QDst.SQL.Add('VALUES (:P_ID, :P_TIPOCANTIERE, :P_CODICECANTIERE, :P_DATAAPERTURACANTIERE)');
      QDst.Prepare;
      // Apre la query sorgente e cicla per i suoi record e li inserisce nel
      // nuovo cantiere.
      QSrc.Open;
      while not QSrc.Eof do
      begin
        // Carica il sottocantiere corrente
        QDst.Params.ParamByName('P_ID').AsString := QSrc.Fields[0].AsString;
        QDst.Params.ParamByName('P_TIPOCANTIERE').AsString := 'P';
        QDst.Params.ParamByName('P_CODICECANTIERE').AsInteger := QryPratCODICE.AsInteger;
        QDst.Params.ParamByName('P_DATAAPERTURACANTIERE').AsDateTime := QryPratDATAAPERTURA.AsDateTime;
        QDst.ExecSQL;
        // Avanti il prossimo
        QSrc.Next;
      end;
      QSrc.Close;
    finally
      if Assigned(QSrc) then
        QSrc.Free;
      if Assigned(QDst) then
        QDst.Free;
    end;
  end;

begin
  // Se non è stata specificata una pratica modello esce subito
  if DatiModelloPratica.Tipo = '' then
    Exit;
  // Copia i sottocantieri dalla pratica modello
  CopiaSottocantiere(1);
  CopiaSottocantiere(2);
  CopiaSottocantiere(3);
end;

procedure TPraticaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  // Sblocca l'aggiornamento dell'IconaDocTipo
  MainForm.BloccaIconaDocTipo(False, Name);
  // Ripristina l'iconaDocTipoPrecedente
  MainForm.RipristinaIconaDocTipo;

  // Distrugge la mappa
  if Assigned(GmapForm) then
    FreeAndNil(GmapForm);

  // Mette manualmente a nil il valore del puntatore alla Form
  PraticaForm := nil;

  // Se <> nil riseleziona la voce del main menù che era selezionata
  // prima dell'apertura dell'anagrafica
  if MainForm.PrecSelectedMainMenuItem <> nil then
    MainForm.MMItemSetSelected(MainForm.PrecSelectedMainMenuItem);
end;

procedure TPraticaForm.FormCreate(Sender: TObject);
begin
  // Inizializzazione
  fCalcoloInCorso := False;
  dbeStrCertImageCombo.Properties.Images := DM2.StrCertifiedPanelImages;
  // Altrimenti a volte si scollega
  // IMposta i settaggi di visualizzazione della form
  MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina,
    RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
  // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
  Caption := MainForm.NomeApplicazione + ' - (Anagrafica Pratica/Cantiere)';
  // Colore normale (non modifica) nei campi
  DM1.ColoraTuttiCampi(PraticaForm, COLOR_NORMALE);
  // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
  // IMposta la posizione della client area e i relativi margini
  MainForm.CalcolaDimensioniClientAreaChildForm(Self, FormMainPanel, False);
  FormMainPanel.ParentColor := True;
  // IN base alla selezione dimensiona il pannello Note
  ImpostaDimensioniPannelliNote;
end;

procedure TPraticaForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of

    // ESC
    27:
      begin
        if RxSpeedButtonUscita.Enabled then
        begin
          RxSpeedButtonUscitaClick(Self);
        end;
      end;

    // F2 = Modifica
    113:
      begin
        if RxSpeedModifica.Enabled then
        begin
          RxSpeedModifica.Down := not RxSpeedModifica.Down;
          RxSpeedModificaClick(Self);
        end;
      end;

  end;
end;

{
  // Questa procedura imposta l'aspetto della form in base alla modalità
  procedure TPraticaForm.ImpostaLayout;
  var
  YY, YYY, contatore: Integer;
  SeparazioneVerticale: Byte;
  LO: TMemIniFile;
  Sezione, TmpStr: String;
  TmpVisible: Boolean;
  TmpDBL: TPanel;
  TmpLabel: TLabel;
  begin
  // INizializzazione
  YY := 0;
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
  // Prima rende invisibili tutti i pannelli
  MainPanelDatiAnagrafici.Visible  := False;
  PanelSottocantieri.Visible := False;
  PanelCommittenteCantiere.Visible := False;
  PanelProprietarioCantiere.Visible := False;
  PanelImmobileCantiere.Visible := False;
  PanelSocGasCantiere.Visible := False;
  PanelDatiSoggettiAssistenza.Visible := False;
  PanelOP.Visible := False;
  PanelApparecchi.Visible := False;
  PanelApparecchio.Visible := False;
  PanelApparecchio2.Visible := False;
  PanelApparecchio3.Visible := False;
  PanelRiepilogoInterventi.Visible := False;
  PanelAbbonamento.Visible := False;
  PanelCategorie.Visible := False;
  // In base al MODE della form visualizza il relativo layout
  case Mode of

  // ----- ASSISTENZE -----
  MODE_ASSISTENZE: begin
  Sezione := 'FormImpianti';
  SeparazioneVerticale := LO.ReadInteger(Sezione, 'SeparazioneVerticale', 10);
  // PanelRiepilogoInterventi
  if LO.ReadBool(Sezione, 'PanelRiepilogoInterventi', True) then begin
  PanelRiepilogoInterventi.Top := YY;
  PanelRiepilogoInterventi.Visible := True;
  inc(YY, (PanelRiepilogoInterventi.Height + SeparazioneVerticale));
  end;
  // PanelDatiSoggettiAssistenza
  if LO.ReadBool(Sezione, 'PanelDatiSoggettiAssistenza', True) then begin
  PanelDatiSoggettiAssistenza.Top := YY;
  PanelDatiSoggettiAssistenza.Visible := True;
  inc(YY, (PanelDatiSoggettiAssistenza.Height + SeparazioneVerticale));
  end;
  // PanelOP (Operazioni Pianificate)
  if LO.ReadBool(Sezione, 'PanelOperazioniPianificate', True) then begin
  PanelOP.Top := YY;
  PanelOP.Visible := True;
  inc(YY, (PanelOP.Height + SeparazioneVerticale));
  end;
  // PanelApparecchio
  if LO.ReadBool(Sezione, 'PanelApparecchio', True) then begin
  PanelApparecchi.Top := YY;
  PanelApparecchi.Visible := True;
  // RIdimensiona i dati dell'apparecchio in modo che non si vedano i
  //  Tabs del PageControl
  PageControlApparecchiImpianto.HideTabs := True;
  PageControlApparecchiImpianto.Height := PageControlApparecchiImpianto.Height - PageControlApparecchiImpianto.TabHeight;  // 22
  PanelApparecchi.Height := PageControlApparecchiImpianto.Top + PageControlApparecchiImpianto.Height + 7;
  EndLineApparecchi.Top := PanelApparecchi.Height - 2;
  // Incrementa il contatore
  inc(YY, (PanelApparecchi.Height + SeparazioneVerticale));
  // Nella stessa posizione ci devono essere anche gli altri tipi di apparecchio
  PanelApparecchio.Top  := PanelApparecchi.Top;
  PanelApparecchio2.Top := PanelApparecchi.Top;
  PanelApparecchio3.Top := PanelApparecchi.Top;
  end;
  // PanelAbbonamento
  if LO.ReadBool(Sezione, 'PanelAbbonamento', True) then begin
  PanelAbbonamento.Top := YY;
  PanelAbbonamento.Visible := True;
  inc(YY, (PanelAbbonamento.Height + SeparazioneVerticale));
  end;
  end;

  // ----- PRATICHE -----
  MODE_PRATICHE: begin
  Sezione := 'FormPratiche';
  SeparazioneVerticale := LO.ReadInteger(Sezione, 'SeparazioneVerticale', 10);
  // PanelDatiAnagrafici
  if LO.ReadBool(Sezione, 'PanelDatiAnagrafici', True) then begin
  MainPanelDatiAnagrafici.Top := YY;
  MainPanelDatiAnagrafici.Visible := True;
  inc(YY, (MainPanelDatiAnagrafici.Height + SeparazioneVerticale));
  // SubPanel Agenti
  // Agente 1
  LabelAgente.Caption  := DM1.GridsColumnAgenteCaption;
  dbeAgente.Visible    := (DM1.GridsColumnAgenteCaption <> '');
  // Agente 2
  LabelAgente2.Caption := DM1.GridsColumnAgente2Caption;
  dbeAgente2.Visible   := (DM1.GridsColumnAgente2Caption <> '');
  // Agente 3
  LabelAgente3.Caption := DM1.GridsColumnAgente3Caption;
  dbeAgente3.Visible   := (DM1.GridsColumnAgente3Caption <> '');
  // Agente 4
  LabelAgente4.Caption := DM1.GridsColumnAgente4Caption;
  dbeAgente4.Visible   := (DM1.GridsColumnAgente4Caption <> '');
  // Se l'agente 3 e 4 cono invisibili evita che si visualizza il pannello
  PanelDatiAnagrafici2.Visible := (dbeAgente3.Visible or dbeAgente4.Visible);
  end;

  // ----- CATEGORIE -----
  if DM1.CategCantCaption1 <> '0' then begin
  YYY := 14;
  // Cicla per tutte le 6 possibili categorìe
  for Contatore := 1 to 6 do begin
  // Rimappa su variabili locali i componenti Label e LookupComboBoxes che si
  //  stanno impostando.
  TmpDBL   := (FindComponent('PanelCateg'+IntToStr(Contatore)) as TPanel);
  TmpLabel := (FindComponent('LabelCategoria'+IntToStr(Contatore)) as TLabel);
  // Carica in Tmpstr il titolo impostato per la categoria attuale
  case Contatore of
  1: TmpStr := DM1.CategCantCaption1;
  2: TmpStr := DM1.CategCantCaption2;
  3: TmpStr := DM1.CategCantCaption3;
  4: TmpStr := DM1.CategCantCaption4;
  5: TmpStr := DM1.CategCantCaption5;
  6: TmpStr := DM1.CategCantCaption6;
  end;
  // Se il titolo della categoria attuale <> 0 attiva la vategoria stessa, altrimenti la disabilita
  if TmpStr <> '0' then begin
  // Imposta il titolo della categoria attuale
  TmpLabel.Caption := TmpStr;
  // Imposta il campo attuale e lo rende visibile
  Inc(YYY, 3);
  TmpLabel.Caption := TmpStr + ' ';
  TmpLabel.Top := YYY;
  TmpLabel.Visible := True;
  TmpDBL.Top := YYY;
  TmpDBL.Visible := True;
  YYY := YYY + TmpDBL.Height;
  // Dimensiona il pannello opportunamente
  PanelCategorie.Height := YYY+6;
  // POsizione la Final Line
  FinalLineCategorie.Top := PanelCategorie.Height - FinalLineCategorie.Height;
  end else begin
  // Se invece il campo attuale è disabilitato lo rende invisibile
  TmpLabel.Visible := False;
  TmpDBL.Visible := False;
  end;
  end;
  // Posiziona il pannello e lo visualizza
  PanelCategorie.Top := YY;
  PanelCategorie.Visible := True;
  inc(YY, (PanelCategorie.Height + SeparazioneVerticale));
  end else PanelCategorie.Visible := False;


  // PanelCommittenteCantiere
  if LO.ReadBool(Sezione, 'PanelCommittenteCantiere', True) then begin
  PanelCommittenteCantiere.Top := YY;
  PanelCommittenteCantiere.Visible := True;
  inc(YY, (PanelCommittenteCantiere.Height + SeparazioneVerticale));
  end;
  // PanelProprietarioCantiere
  if LO.ReadBool(Sezione, 'PanelProprietarioCantiere', True) then begin
  PanelProprietarioCantiere.Top := YY;
  PanelProprietarioCantiere.Visible := True;
  inc(YY, (PanelProprietarioCantiere.Height + SeparazioneVerticale));
  end;
  // PanelImmobileCantiere
  if LO.ReadBool(Sezione, 'PanelImmobileCantiere', True) then begin
  PanelImmobileCantiere.Top := YY;
  PanelImmobileCantiere.Visible := True;
  inc(YY, (PanelImmobileCantiere.Height + SeparazioneVerticale));
  end;
  // PanelSocGasCantiere
  if LO.ReadBool(Sezione, 'PanelSocGasCantiere', True) then begin
  PanelSocGasCantiere.Top := YY;
  PanelSocGasCantiere.Visible := True;
  inc(YY, (PanelSocGasCantiere.Height + SeparazioneVerticale));
  end;
  // PanelSottocantieri
  if LO.ReadBool(Sezione, 'PanelSottocantieri', True) then begin
  PanelSottocantieri.Top := YY;
  PanelSottocantieri.Visible := True;
  inc(YY, (PanelSottocantieri.Height + SeparazioneVerticale));
  end;
  // Campo - UnitaImmobiliari
  TmpVisible := LO.ReadBool(Sezione, 'UnitaImmobiliariVisible', True);
  LabelUnitaImmobiliari.Visible := TmpVisible;
  DbeUnitaImmobiliari.Visible   := TmpVisible;
  // Campo - VisibleToExpressMag
  TmpVisible := LO.ReadBool(Sezione, 'VisibleToExpressMagVisible', True);
  DbeVisibleToExpressMag.Visible := TmpVisible;
  end;

  end;
  // IMposta il range della scrollbar della Client Area
  //    ClientArea.VertScrollBar.Range := YY;
  finally
  LO.Free;
  end;
  end;
}
// Questa procedura imposta l'aspetto della form in base alla modalità
procedure TPraticaForm.ImpostaLayout;
begin
  // In base al MODE della form visualizza il relativo layout
  case Mode of
    MODE_ASSISTENZE:
      ImpostaLayout_Impianti;
    MODE_PRATICHE:
      ImpostaLayout_Pratiche;
  end;
end;

// Questa procedura imposta l'aspetto della form in base alla modalità IMPIANTI
procedure TPraticaForm.ImpostaLayout_Impianti;
const
  MARGIN_UP = 0;
var
  YY: Integer;
  SeparazioneVerticale: Byte;
  LO: TMemIniFile;
  Sezione: String;
begin
  // INizializzazione
  YY := MARGIN_UP;
  Sezione := 'FormImpianti';
  // IMposta il PageControl
  MainPageControl.HideTabs := False;
  TabPratica.TabVisible := False;
  TabImpianto.TabVisible := True;
  MainPageControl.ActivePage := TabImpianto;
  MainPageControlChange(MainPageControl);
  // Continua con la lettura dei parametri dal file layouts.ini
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // RIcava la separazione verticale tra i paannelli
    SeparazioneVerticale := LO.ReadInteger(Sezione, 'SeparazioneVerticale', 10);

    // PanelNumDescrizioneImpianto
    // NB: HO commentato le linee che leggono dal Layouts.ini perchè uesto pannello
    // tanto deve essere sempre attivo
    // if LO.ReadBool(Sezione, 'PanelNumDescrizioneImpianto', True) then begin
    PanelNumDescrizioneImpianto.Top := YY;
    PanelNumDescrizioneImpianto.Visible := True;
    inc(YY, (PanelNumDescrizioneImpianto.Height + SeparazioneVerticale));
    // NB: Se l'anagrafica è stata richiamata da dentro un impianto impedisce
    // la modifica del codice e della data dell'impianto/pratica
    if FromDocument or LO.ReadBool(Sezione, 'CodiceDataReadOnly', True) then
    begin
      dbeCodiceImpianto.ReadOnly := True;
      dbeDataImpianto.Properties.ReadOnly := True;
      Codice.ReadOnly := True;
      DBEDataApertura.Properties.ReadOnly := True;
      DBEDataApertura.Tag := -1; // Così non si colora di giallo
    end;
    // end else PanelNumDescrizioneImpianto.Visible := False;

    // ------------------------
    // Panel riferimenti
    // Agente 1
    LabelAgenteImp.Caption := DM1.GridsColumnAgenteCaption;
    dbeAgenteImp.Visible := (DM1.GridsColumnAgenteCaption <> '');
    if DM1.AgenteEditable then
      dbeAgenteImp.Properties.DropDownListStyle := lsEditList
    else
      dbeAgenteImp.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 2
    LabelAgenteImp2.Caption := DM1.GridsColumnAgente2Caption;
    dbeAgenteImp2.Visible := (DM1.GridsColumnAgente2Caption <> '');
    if DM1.Agente2Editable then
      dbeAgenteImp2.Properties.DropDownListStyle := lsEditList
    else
      dbeAgenteImp2.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 3
    LabelAgenteImp3.Caption := DM1.GridsColumnAgente3Caption;
    dbeAgenteImp3.Visible := (DM1.GridsColumnAgente3Caption <> '');
    if DM1.Agente3Editable then
      dbeAgenteImp3.Properties.DropDownListStyle := lsEditList
    else
      dbeAgenteImp3.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 4
    LabelAgenteImp4.Caption := DM1.GridsColumnAgente4Caption;
    dbeAgenteImp4.Visible := (DM1.GridsColumnAgente4Caption <> '');
    if DM1.Agente4Editable then
      dbeAgenteImp4.Properties.DropDownListStyle := lsEditList
    else
      dbeAgenteImp4.Properties.DropDownListStyle := lsEditFixedList;
    // Visibilità pannello RIFERIMENTI (Agenti=
    if dbeAgenteImp.Visible or dbeAgenteImp2.Visible or dbeAgenteImp3.Visible or dbeAgenteImp4.Visible then
    begin
      PanelRiferimenti.Top := YY;
      PanelRiferimenti.Visible := True;
      inc(YY, (PanelRiferimenti.Height + SeparazioneVerticale));
    end
    else
      PanelRiferimenti.Visible := False;
    // ------------------------

    // PanelUbicazioneImpianto
    if LO.ReadBool(Sezione, 'PanelUbicazioneImpianto', True) then
    begin
      PanelUbicazioneImpianto.Top := YY;
      PanelUbicazioneImpianto.Visible := True;
      inc(YY, (PanelUbicazioneImpianto.Height + SeparazioneVerticale));
    end
    else
      PanelUbicazioneImpianto.Visible := False;

    // PanelNoteImpianto
    if LO.ReadBool(Sezione, 'PanelNoteImpianto', True) then
    begin
      PanelNoteImpianto.Top := YY;
      PanelNoteImpianto.Visible := True;
      inc(YY, (PanelNoteImpianto.Height + SeparazioneVerticale));
    end
    else
      PanelNoteImpianto.Visible := False;

    // PanelProprietarioImpianto
    if LO.ReadBool(Sezione, 'PanelProprietarioImpianto', True) then
    begin
      PanelProprietarioImpianto.Top := YY;
      PanelProprietarioImpianto.Visible := True;
      inc(YY, (PanelProprietarioImpianto.Height + SeparazioneVerticale));
    end
    else
      PanelProprietarioImpianto.Visible := False;

    // PanelOccupanteImpianto
    if LO.ReadBool(Sezione, 'PanelOccupanteImpianto', True) then
    begin
      PanelOccupanteImpianto.Top := YY;
      PanelOccupanteImpianto.Visible := True;
      inc(YY, (PanelOccupanteImpianto.Height + SeparazioneVerticale));
    end
    else
      PanelOccupanteImpianto.Visible := False;

    // PanelAmministratoreImpianto
    if LO.ReadBool(Sezione, 'PanelAmministratoreImpianto', True) then
    begin
      PanelAmministratoreImpianto.Top := YY;
      PanelAmministratoreImpianto.Visible := True;
      inc(YY, (PanelAmministratoreImpianto.Height + SeparazioneVerticale));
    end
    else
      PanelAmministratoreImpianto.Visible := False;

    // PanelRespImp = Responsabile Impianto
    if LO.ReadBool(Sezione, 'PanelRespImp', True) then
    begin
      PanelRespImp.Top := YY;
      PanelRespImp.Visible := True;
      inc(YY, (PanelRespImp.Height + SeparazioneVerticale));
    end
    else
      PanelRespImp.Visible := False;

    // PanelAbbonamentoImpianto
    if LO.ReadBool(Sezione, 'PanelAbbonamentoImpianto', True) then
    begin
      PanelAbbonamentoImpianto.Top := YY;
      PanelAbbonamentoImpianto.Visible := True;
      inc(YY, (PanelAbbonamentoImpianto.Height + SeparazioneVerticale));
    end
    else
      PanelAbbonamentoImpianto.Visible := False;

    // ----- PANEL ALTRE INFORMAZIONI -----
    if LO.ReadBool(Sezione, 'PanelAltreInformazioni', True) then
    begin
      PanelInfo.Top := YY;
      PanelInfo.Visible := True;
      inc(YY, (PanelInfo.Height + SeparazioneVerticale));
    end
    else
      PanelInfo.Visible := False;

    // ----- PANEL COMUNICAZIONI AUTOMATICHE -----
    if LO.ReadBool(Sezione, 'PanelComunicazioniAutomatiche', True) then
    begin
      PanelComunicazioniAutomaticheImpianto.Top := YY;
      PanelComunicazioniAutomaticheImpianto.Visible := True;
      inc(YY, (PanelComunicazioniAutomaticheImpianto.Height + SeparazioneVerticale));
    end
    else
      PanelComunicazioniAutomaticheImpianto.Visible := False;

    // IMposta il range della scrollbar della Client Area
    ClientAreaImpianto.VertScrollBar.Range := YY;

    // =========================================================================
    // ALTRI TABS IMPIANTO
    // NB: Questi tabs non verranno resi visibili anche se l'anagrafica è
    // stata aperta da dentro un altro documento.
    // -------------------------------------------------------------------------
    // Tab apparecchi impianto
    TabApparecchi.TabVisible := LO.ReadBool(Sezione, 'TabApparecchiImpianto', True) and not FromDocument;
    PageControlApparecchiImpianto.HideTabs := True;

    // Tab oparazioni pianificate
    TabOP.TabVisible := LO.ReadBool(Sezione, 'TabOPImpianto', True) and not FromDocument;

    // Tab interventi precedenti
    TabInterventiPrecedenti.TabVisible := LO.ReadBool(Sezione, 'TabInterventiPrecedenti', True) and not FromDocument;

    // Tab Parametri
    TabParametri.TabVisible := LO.ReadBool(Sezione, 'TabParametri', True) and not FromDocument;
    // =========================================================================
  finally
    LO.Free;
  end;
end;

// Questa procedura imposta l'aspetto della form in base alla modalità PRATICHE/CANTIERI
procedure TPraticaForm.ImpostaLayout_Pratiche;
const
  MARGIN_UP = 10;
var
  YY, YYY, contatore, TmpInt: Integer;
  SeparazioneVerticale: Byte;
  LO: TMemIniFile;
  Sezione, TmpStr, TitoloStr: String;
  TmpVisible: Boolean;
  TmpDBL: TPanel;
  TmpLabel: TLabel;
  // TmpDBE : TDBEdit;
  TmpDBE: TControl;
begin
  // INizializzazione
  YY := MARGIN_UP;
  Sezione := 'FormPratiche';
  // IMposta il PageControl
  MainPageControl.HideTabs := False;
  MainPageControl.ActivePage := TabPratica;
  TabImpianto.TabVisible := False;
  TabApparecchi.TabVisible := False;
  TabOP.TabVisible := False;
  TabInterventiPrecedenti.TabVisible := False;
  TabParametri.TabVisible := False;
  MainPageControlChange(MainPageControl);
  // Continua con la lettura dei parametri dal file layouts.ini
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // RIcava la separazione verticale tra i paannelli
    SeparazioneVerticale := LO.ReadInteger(Sezione, 'SeparazioneVerticale', 10);

    // Parametro che, quando si esporta dal GC alla bacheca, indica se la manodopera e le altre spese devono essere riepilogate
    // cumulativamente alla fine del documento destinazione oppure no
    FBachecaAccorpaManodopera := LO.ReadBool(Sezione, 'AccorpaManodoperaInBacheca', True);

    // Flags che abilitano o meno la copia dell'Agente relativo nella descrizione della pratica se voluto dall'utente (EXIS)
    vCopiaAgente1PratToDescrizione := LO.ReadBool(Sezione, 'CopiaAgente1PratToDescrizione', False);
    vCopiaAgente2PratToDescrizione := LO.ReadBool(Sezione, 'CopiaAgente2PratToDescrizione', False);
    vCopiaAgente3PratToDescrizione := LO.ReadBool(Sezione, 'CopiaAgente3PratToDescrizione', False);
    vCopiaAgente4PratToDescrizione := LO.ReadBool(Sezione, 'CopiaAgente4PratToDescrizione', False);

    // PanelDatiAnagrafici
    // NB: HO commentato le linee che leggono dal Layouts.ini perchè uesto pannello
    // tanto deve essere sempre attivo
    // if LO.ReadBool(Sezione, 'PanelDatiAnagrafici', True) then begin
    MainPanelDatiAnagrafici.Top := YY;
    MainPanelDatiAnagrafici.Visible := True;
    inc(YY, (MainPanelDatiAnagrafici.Height + SeparazioneVerticale));
    // NB: Se l'anagrafica è stata richiamata da dentro un impianto impedisce
    // la modifica del codice e della data dell'impianto/pratica
    if FromDocument or LO.ReadBool(Sezione, 'CodiceDataReadOnly', True) then
    begin
      dbeCodiceImpianto.ReadOnly := True;
      dbeDataImpianto.Properties.ReadOnly := True;
      Codice.ReadOnly := True;
      DBEDataApertura.Properties.ReadOnly := True;
      DBEDataApertura.Tag := -1; // Così non si colora di giallo
    end;
    // Campo - UnitaImmobiliari
    TmpVisible := LO.ReadBool(Sezione, 'UnitaImmobiliariVisible', True);
    LabelUnitaImmobiliari.Visible := TmpVisible;
    DbeUnitaImmobiliari.Visible := TmpVisible;
    // Campo - VisibleToExpressMag
    TmpVisible := LO.ReadBool(Sezione, 'VisibleToExpressMagVisible', True);
    DbeVisibleToExpressMag.Visible := TmpVisible;
    // SubPanel Agenti
    // Agente 1
    LabelAgente.Caption := DM1.GridsColumnAgenteCaption;
    dbeAgente.Visible := (DM1.GridsColumnAgenteCaption <> '');
    if DM1.AgenteEditable then
      dbeAgente.Properties.DropDownListStyle := lsEditList
    else
      dbeAgente.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 2
    LabelAgente2.Caption := DM1.GridsColumnAgente2Caption;
    dbeAgente2.Visible := (DM1.GridsColumnAgente2Caption <> '');
    if DM1.Agente2Editable then
      dbeAgente2.Properties.DropDownListStyle := lsEditList
    else
      dbeAgente2.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 3
    LabelAgente3.Caption := DM1.GridsColumnAgente3Caption;
    dbeAgente3.Visible := (DM1.GridsColumnAgente3Caption <> '');
    if DM1.Agente3Editable then
      dbeAgente3.Properties.DropDownListStyle := lsEditList
    else
      dbeAgente3.Properties.DropDownListStyle := lsEditFixedList;
    // Agente 4
    LabelAgente4.Caption := DM1.GridsColumnAgente4Caption;
    dbeAgente4.Visible := (DM1.GridsColumnAgente4Caption <> '');
    if DM1.Agente4Editable then
      dbeAgente4.Properties.DropDownListStyle := lsEditList
    else
      dbeAgente4.Properties.DropDownListStyle := lsEditFixedList;
    // Se l'agente 3 e 4 cono invisibili evita che si visualizza il pannello
    PanelDatiAnagrafici2.Visible := (dbeAgente3.Visible or dbeAgente4.Visible);
    // end else MainPanelDatiAnagrafici.Visible := False;

    // ----- CATEGORIE -----
    if DM1.CategCantCaption1 <> '0' then
    begin
      YYY := 14;
      // Cicla per tutte le 6 possibili categorìe
      for contatore := 1 to 6 do
      begin
        // Rimappa su variabili locali i componenti Label e LookupComboBoxes che si
        // stanno impostando.
        TmpDBL := (FindComponent('PanelCateg' + IntToStr(contatore)) as TPanel);
        TmpLabel := (FindComponent('LabelCategoria' + IntToStr(contatore)) as TLabel);
        // Carica in Tmpstr il titolo impostato per la categoria attuale
        case contatore of
          1:
            TmpStr := DM1.CategCantCaption1;
          2:
            TmpStr := DM1.CategCantCaption2;
          3:
            TmpStr := DM1.CategCantCaption3;
          4:
            TmpStr := DM1.CategCantCaption4;
          5:
            TmpStr := DM1.CategCantCaption5;
          6:
            TmpStr := DM1.CategCantCaption6;
        end;
        // Se il titolo della categoria attuale <> 0 attiva la vategoria stessa, altrimenti la disabilita
        if TmpStr <> '0' then
        begin
          // Imposta il titolo della categoria attuale
          TmpLabel.Caption := TmpStr;
          // Imposta il campo attuale e lo rende visibile
          inc(YYY, 3);
          TmpLabel.Caption := TmpStr + ' ';
          TmpLabel.Top := YYY;
          TmpLabel.Visible := True;
          TmpDBL.Top := YYY;
          TmpDBL.Visible := True;
          YYY := YYY + TmpDBL.Height;
          // Dimensiona il pannello opportunamente
          PanelCategorie.Height := YYY + 6;
        end
        else
        begin
          // Se invece il campo attuale è disabilitato lo rende invisibile
          TmpLabel.Visible := False;
          TmpDBL.Visible := False;
        end;
      end;
      // Posiziona il pannello e lo visualizza
      PanelCategorie.Top := YY;
      PanelCategorie.Visible := True;
      inc(YY, (PanelCategorie.Height + SeparazioneVerticale));
    end
    else
      PanelCategorie.Visible := False;
    // ------------------------------

    // ----- CAMPI JOLLY -----
    if LO.ReadString(Sezione, 'Jolly1', '0') <> '0' then
    begin
      TmpInt := 1;
      YYY := -1;
      // Cicla per tutte i 13 possibili campi jolly
      for contatore := 1 to 13 do
      begin
        // Carica in TmpStr la riga del file *.INI da elaborare e se è <> 0 la elabora,
        TmpStr := LO.ReadString(Sezione, 'Jolly' + IntToStr(contatore), '0');
        if TmpStr <> '0' then
        begin
          // Cicla finchè non vi siano più eventuali titoli da visualizzare contenuti nella
          // riga del file *.INI attuale (titoli da visualizzare prima del campo attuale stesso.
          while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do
          begin
            // Prende la prima label di titolo disponibile, la imposta, la visualizza
            TitoloStr := DM1.RitornaTestoPrimaDi('_', TmpStr, True);
            TmpLabel := (FindComponent('LabelTitoloJolly' + IntToStr(TmpInt)) as TLabel);
            TmpInt := TmpInt + 1;
            TmpLabel.Caption := ' ' + DM1.StrRight(TitoloStr, Length(TitoloStr) - 3);
            if TitoloStr[1] = 'L' then
              TmpLabel.Alignment := taLeftJustify
            else if TitoloStr[1] = 'C' then
              TmpLabel.Alignment := taCenter
            else if TitoloStr[1] = 'R' then
              TmpLabel.Alignment := taRightJustify;
            if TitoloStr[2] = 'N' then
              TmpLabel.Font.Style := []
            else if TitoloStr[2] = 'B' then
              TmpLabel.Font.Style := [fsBold];
            if YYY > 0 then
              inc(YYY, 5); // Per spaziare meglio (ma non per la prima label)
            TmpLabel.Top := YYY;
            TmpLabel.Visible := True;
            YYY := YYY + TmpLabel.Height;
          end;
          // Rimappa su variabili locali i componenti Label e DBEdit che si
          // stanno impostando.
          TmpDBE := (FindComponent('DBEJolly' + IntToStr(contatore)) as TControl);
          TmpLabel := (FindComponent('LabelJolly' + IntToStr(contatore)) as TLabel);
          // Imposta il campo attuale e lo rende visibile
          inc(YYY, 3);
          TmpLabel.Caption := TmpStr + ' ';
          TmpLabel.Top := YYY;
          TmpLabel.Visible := True;
          TmpDBE.Top := YYY;
          TmpDBE.Visible := True;
          YYY := YYY + TmpLabel.Height;
          // Dimensiona il pannello opportunamente
          PanelCustom.Height := YYY + 6;
        end
        else
        begin
          // Rimappa su variabili locali i componenti Label e DBEdit che si
          // stanno impostando.
          TmpDBE := (FindComponent('DBEJolly' + IntToStr(contatore)) as TControl);
          TmpLabel := (FindComponent('LabelJolly' + IntToStr(contatore)) as TLabel);
          // Se invece il campo attuale è disabilitato lo rende invisibile
          TmpLabel.Visible := False;
          TmpDBE.Visible := False;
        end;
      end;
      // Posiziona il pannello e lo visualizza
      PanelCustom.Top := YY;
      PanelCustom.Visible := True;
      YY := YY + PanelCustom.Height + SeparazioneVerticale;
    end
    else
      PanelCustom.Visible := False;
    // ------------------------------

    // PanelImmobileCantiere - UBICAZIONE CANTIERE
    if LO.ReadBool(Sezione, 'PanelImmobileCantiere', True) then
    begin
      PanelImmobileCantiere.Top := YY;
      PanelImmobileCantiere.Visible := True;
      inc(YY, (PanelImmobileCantiere.Height + SeparazioneVerticale));
    end
    else
      PanelImmobileCantiere.Visible := False;

    // PanelCommittenteCantiere
    if LO.ReadBool(Sezione, 'PanelCommittenteCantiere', True) then
    begin
      PanelCommittenteCantiere.Top := YY;
      PanelCommittenteCantiere.Visible := True;
      inc(YY, (PanelCommittenteCantiere.Height + SeparazioneVerticale));
    end
    else
      PanelCommittenteCantiere.Visible := False;

    // PanelProprietarioCantiere
    if LO.ReadBool(Sezione, 'PanelProprietarioCantiere', True) then
    begin
      PanelProprietarioCantiere.Top := YY;
      PanelProprietarioCantiere.Visible := True;
      inc(YY, (PanelProprietarioCantiere.Height + SeparazioneVerticale));
    end
    else
      PanelProprietarioCantiere.Visible := False;

    // PanelSocGasCantiere
    if LO.ReadBool(Sezione, 'PanelSocGasCantiere', True) then
    begin
      PanelSocGasCantiere.Top := YY;
      PanelSocGasCantiere.Visible := True;
      inc(YY, (PanelSocGasCantiere.Height + SeparazioneVerticale));
    end
    else
      PanelSocGasCantiere.Visible := False;

    // PanelSottocantieri
    if LO.ReadBool(Sezione, 'PanelSottocantieri', True) then
    begin
      PanelSottocantieri.Top := YY;
      PanelSottocantieri.Visible := True;
      inc(YY, (PanelSottocantieri.Height + SeparazioneVerticale));
    end
    else
      PanelSottocantieri.Visible := False;
    // IMposta il range della scrollbar della Client Area
    ClientAreaPratica.VertScrollBar.Range := YY;
  finally
    LO.Free;
  end;
end;

// Questa procedura aggiorna i valori del pannello riassuntivo degli ultimi
// interventi e di previsione di quello successivo.
procedure TPraticaForm.FormShow(Sender: TObject);
var
  P: TMemIniFile;
begin
  DM1.FocusRefresh;
  // Salva l'icona del tipo documento precedente e carica la nuova
  MainForm.SalvaIconaDocTipo;
  // IMposta il valore della variabile globale privata CampoTipo in modo che contenga
  // il valore da assegnare a tale campo in base alla modalità di chiamata della form
  // Carica anche l'icona in alto a sx del tipo di documento
  case Mode of
    MODE_ASSISTENZE:
      begin
        CampoTipo := 'A';
        MainForm.CaricaIconaDocTipo('ImpiantiContrattiForm');
        // Voglio che quando creo un nuovo impianto non sia visualizzata alcuna scheda don i dati dell'apparecchio
        PageControlApparecchiImpianto.ActivePage := nil;
        // FOrsa la posizione delle Scrolls-Bar
        ClientAreaImpianto.VertScrollBar.Position := 0;
      end;
    MODE_PRATICHE:
      begin
        CampoTipo := 'P';
        MainForm.CaricaIconaDocTipo('PraticaForm');
        // FOrsa la posizione delle Scrolls-Bar
        ClientAreaPratica.VertScrollBar.Position := 0;
        // Carica alcune Caption dall'apposito file menu.ini
        P := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
        try
          LabelPanelDatiPraticaCaption.Caption := ' ' + P.ReadString('TitoliPratiche', 'PanelDatiPraticaCaption', 'DATI CANTIERE');
          LabelPanelSottopraticheCaption.Caption := ' ' + P.ReadString('TitoliPratiche', 'PanelSottopraticheCaption', 'SOTTOCANTIERI');
          tvS1ID.Caption := ' ' + P.ReadString('TitoliPratiche', 'PanelSottopraticheSottopratica1Caption', 'Sottocantieri livello 1');
          tvS2ID.Caption := ' ' + P.ReadString('TitoliPratiche', 'PanelSottopraticheSottopratica2Caption', 'Sottocantieri livello 2');
          tvS3ID.Caption := ' ' + P.ReadString('TitoliPratiche', 'PanelSottopraticheSottopratica3Caption', 'Sottocantieri livello 3');
        finally
          P.Free;
        end;
      end;
  end;
  // Blocca l'aggiornamento dell'IconaDocTipo
  MainForm.BloccaIconaDocTipo(True, Name);

  // Configura aspetto form
  ImpostaLayout;

  // In base al valore di 'Tag' apre la form in diverse modalità...
  case Tag of
    // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
    1:
      begin
        // IMposta la query per richiamare il record da modificare
        QryPrat.Close;
        QryPrat.SQL.Clear;
        QryPrat.SQL.Add('SELECT * FROM PRATICHE WHERE CODICE = ' + IntToStr(CodicePratica) + ' AND DATAAPERTURA = ''' + FormatDateTime('mm/dd/yyyy',
          DataApertura) + ''' AND TIPO = ''' + CampoTipo + '''');
        QryPrat.Open;
        // Se trova il record procede, altrimenti visualizza un errore ed esce dalla form
        if QryPrat.Eof then
        begin
          MessageDlg('Pratica/Cantiere non trovato!', mtError, [mbOK], 0);
          PraticaForm.Close;
          Exit;
        end;
      end;
    // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
    2:
      begin
        // Se non è aperta, apre la query vuota in modo da poter inserire un nuovo record
        if not QryPrat.Active then
        begin
          QryPrat.SQL.Clear;
          QryPrat.SQL.Add('SELECT * FROM PRATICHE WHERE CODICE = -999');
          QryPrat.Open;
        end;
        // Agiungle il nuovo record
        QryPrat.Append;
        QryPratDATAAPERTURA.Value := Date;
        QryPratCLIENTE.Value := StrToInt(CodiceCliente);
        QryPratCOMMITCODICE.Value := StrToInt(CodiceCliente);
        QryPratPROPCODICE.Value := StrToInt(CodiceCliente);
        QryPratIMMOBCODICE.Value := StrToInt(CodiceCliente);
        QryPratCODICERESPIMP.Value := StrToInt(CodiceCliente);
        QryPratTIPO.Value := CampoTipo;
        QryPratINQUALITADIRESPIMP.Value := 'Proprietario';
        // QryPratTIPOIMPIANTO.Value          := 'Caldaia';
        // Prezzi e costi OPERA
        QryPratPRZUNITOPERA1_1.Value := DM1.Manodopera[0].PrezzoUnitario1;
        QryPratPRZUNITOPERA1_2.Value := DM1.Manodopera[1].PrezzoUnitario1;
        QryPratPRZUNITOPERA1_3.Value := DM1.Manodopera[2].PrezzoUnitario1;
        QryPratPRZUNITOPERA1_4.Value := DM1.Manodopera[3].PrezzoUnitario1;
        QryPratPRZUNITOPERA1_5.Value := DM1.Manodopera[4].PrezzoUnitario1;
        QryPratCOSTOUNITOPERA1_1.Value := 0;
        QryPratCOSTOUNITOPERA1_2.Value := 0;
        QryPratCOSTOUNITOPERA1_3.Value := 0;
        QryPratCOSTOUNITOPERA1_4.Value := 0;
        QryPratCOSTOUNITOPERA1_5.Value := 0;

        QryPratTIPORICARICO.Value := DM1.GC_Default_TipoRicarico;
        if DM1.GC_Default_RicaricoPerc <> 0 then
          QryPratRICARICOPERC.Value := DM1.GC_Default_RicaricoPerc
        else
          QryPratRICARICOPERC.Value := DM1.TableProgressiviRICARICOLISTINO1.AsFloat;
        QryPratLISTINO.Value := DM1.GC_Default_Listino;
        QryPratTIPOCOSTO.Value := DM1.GC_Default_TipoCosto;
        QryPratTIPORICARICOCOMEDACOMMESSA.Value := DM1.GC_Default_TipoRicaricoComeDaCommessa;

        QryPratCONTRATTO_STATO.Value := 'F';

        QryPratCOM_SMS.Value := 'T';
        QryPratCOM_EMAIL.Value := 'T';
        QryPratCOM_LETTERA.Value := 'T';

        // Parametro che, quando si esporta dal GC alla bacheca, indica se la manodopera e le altre spese devono essere riepilogate
        // cumulativamente alla fine del documento destinazione oppure no
        if FBachecaAccorpaManodopera then
          QryPratACCORPAOPERAINBACHECA.Value := 'T'
        else
          QryPratACCORPAOPERAINBACHECA.Value := 'F';

        // Procedure che carica i valori predefiniti nei parametri e progressivi della
        // stampa del foglio di lavoro
        CaricaParametriDefault;
        // Se stiamo creando un nuovo impianto imposta il tipo
        if TipoNuovoImpianto <> '' then
          QryPratTIPOIMPIANTO.Value := TipoNuovoImpianto;
        // Rende invisibile o disabilitato il pannello dei sottocantieri perchè non
        // possibile inserirne finchè non è stato assegnato il codice al cantiere.
        PanelSottocantieri.Visible := False;
        // Pone la form direttamente in modalità di modifica
        RxSpeedModifica.Down := True;
        RxSpeedModificaClick(Self);
        // Carica le operazioni pianificate predefinite del tipo impianto
        // NB: Le carico dopo la messa in modifica dell'impianto perchè
        // così è sotto transazione e se l'utente annulla il nuovo impianto spariscono
        // anche le nuoce operazioni pianificate
        if TipoNuovoImpianto <> '' then
          ImportaOpPerTipoImpianto(TipoNuovoImpianto);
      end;
  end;

  // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
  if ((Mode = MODE_PRATICHE) and (DM1.ModCtrl(MOD_PRATICHE) > 1) or (Mode = MODE_ASSISTENZE) and (DM1.ModCtrl(MOD_CONTATTI) > 1)) then
  begin
    RxSpeedModifica.Enabled := True;
  end
  else
  begin
    RxSpeedModifica.Enabled := False;
  end;

  // Apre la queru che contiene l'elenco degli interventi precedenti per
  // stesso impianto.
  if (Mode = MODE_ASSISTENZE) and not FromDocument then
    ApriQueryElencoUltimiInterventi;
  // Apre la queru che contiene l'elenco delle raccomandazioni/prescrizioni
  // dello stesso impianto.
  if (Mode = MODE_ASSISTENZE) and not FromDocument then
    RefreshQueryElencoPrescrizioni;

  // Focus (l'ho messo quì anche se così se vado su un'altra pagina e poi ritorno non lo ritrovo nella stessa posizione
  // in cui era precedentemente; questo perhè altrimenti tooenevo che quando passavo a un'altra pagina e poi ritornavo
  // comunque non veniva ripristinato il focus per niente.
  ResetFocus;

  // Decide se gli allegati devono essere già visibili oppure no.
  Allegati_VerificaAbilitazione;

  // Imposta i checks relativi ai parametri di stampa del FOglio di Lavoro.
  ParamRappIntPredefiniti := Prm_FL_Predefiniti.Checked;

  // Apre la query di lookup dell'ente di riferimento E dei tecnici
  if QryPratTIPO.AsString = 'A' then
  begin
    QryEntiLookup.Open;
    QryTecnici.Open;
  end;
  // Apre lq query elle aliquota iva (OP) solo se siamo in un impianto
  if Mode = MODE_ASSISTENZE then
    QryIva.Open;
end;

// Procedure che carica i valori predefiniti nei parametri e progressivi della
// stampa del foglio di lavoro e degli allegati F e G
procedure TPraticaForm.CaricaParametriDefault;
begin
  QryPratFL_USAPREDEFINITI.Value := 'T';
  QryPratFL_DATI_APPARECCHI.Value := DM1.TableProgressiviFL_DATI_APPARECCHI.Value;
  QryPratFL_DATI_APPARECCHI_SEPARATI.Value := DM1.TableProgressiviFL_DATI_APPARECCHI_SEPARATI.Value;
  QryPratFL_DATI_OP.Value := DM1.TableProgressiviFL_DATI_OP.Value;
  QryPratFL_DATI_PRECEDENTI.Value := DM1.TableProgressiviFL_DATI_PRECEDENTI.Value;
  QryPratFL_DATI_NUMULTINTERV.Value := DM1.TableProgressiviFL_DATI_NUMULTINTERV.Value;
  QryPratFL_DATI_RAPPINT.Value := DM1.TableProgressiviFL_DATI_RAPPINT.Value;
  QryPratFL_DATI_MERCE.Value := DM1.TableProgressiviFL_DATI_MERCE.Value;
  QryPratFL_DATI_ALTRESPESE.Value := DM1.TableProgressiviFL_DATI_ALTRESPESE.Value;
  QryPratFL_DATI_FIRME.Value := DM1.TableProgressiviFL_DATI_FIRME.Value;
  QryPratFL_COPIE.Value := DM1.TableProgressiviFL_COPIE.Value;


  // Carica i parametri di default per la chiusura automatica di chiamate/appuntamenti/interventi
  QryPratPRM_PROXVISITA_INBASEA.Value := DM1.TableProgressivi2PRM_PROXVISITA_INBASEA.Value;
  QryPratPRM_PROXVISITA_ADDPERIODSU.Value := DM1.TableProgressivi2PRM_PROXVISITA_ADDPERIODSU.Value;

  QryPratPRM_AUTODOC_OPFATTE.Value := DM1.TableProgressivi2PRM_AUTODOC_OPFATTE.Value;
  QryPratPRM_AUTODOC_RIFCONTRATTO.Value := DM1.TableProgressivi2PRM_AUTODOC_RIFCONTRATTO.Value;
  QryPratPRM_AUTODOC_DICITURA.Value := DM1.TableProgressivi2PRM_AUTODOC_DICITURA.Value;
  QryPratPRM_AUTODOC_DICITURATXT.Value := DM1.TableProgressivi2PRM_AUTODOC_DICITURATXT.Value;

  QryPratPRM_AUTOCLOSE_ENABLED.Value := DM1.TableProgressivi2PRM_AUTOCLOSE_ENABLED.Value;
  QryPratPRM_AUTOCLOSE_SOLOMANUT.Value := DM1.TableProgressivi2PRM_AUTOCLOSE_SOLOMANUT.Value;
  QryPratPRM_AUTOCLOSE_FATTURA.Value := DM1.TableProgressivi2PRM_AUTOCLOSE_FATTURA.Value;
  QryPratPRM_AUTOCLOSE_SCAD.Value := DM1.TableProgressivi2PRM_AUTOCLOSE_SCAD.Value;;
end;

// Questa procedura resetta il focus spostandolo al primo campo editabile in base alla situazione.
procedure TPraticaForm.ResetFocus;
begin
  case Mode of
    // Pratiche
    MODE_PRATICHE:
      begin
        if MainPageControl.ActivePage = TabPratica then
        begin
          DBEDataApertura.SetFocus;
          Descrizione.SetFocus;
        END;
      end;
    // Impianti
    MODE_ASSISTENZE:
      begin;
        if MainPageControl.ActivePage = TabImpianto then
        begin
          dbeDataInstallazioneImpianto.SetFocus;
          dbeDescrizione.SetFocus;
        end
        else if MainPageControl.ActivePage = TabApparecchi then
        begin
          PageControlApparecchiImpianto.SetFocus;
          GridApp.SetFocus;
        end
        else if MainPageControl.ActivePage = TabOP then
        begin
          MainPageControl.SetFocus;
          GridOP.SetFocus;
        end;
      end;
  end;
end;

procedure TPraticaForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  // Se nel main menù è selezionata la voce dei dati anagrafici del soggetto, torna
  // al Tab predefinito a cui andare dopo la selezione del soggettoselezionato.
  // Altrimenti chiude semplicemente la form
  Close;
  if (Mode = MODE_PRATICHE) and MainForm.MMItemIsSelected(MainForm.SBPratica) then
    ClientiForm.VaiAlTabDopoSelezionePratica
  else if (Mode = MODE_ASSISTENZE) and MainForm.MMItemIsSelected(MainForm.SBAssistenza) then
    ClientiForm.VaiAlTabDopoSelezioneImpianto;
end;

procedure TPraticaForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
  HelpForm.Aiuto('PRATICHE');
end;

procedure TPraticaForm.RxSpeedModificaClick(Sender: TObject);
var
  MR: TModalResult;
begin
  // A seconda che il tasto sia abbassato o meno svolge la funzione di
  // attivare la modifica dei campi o disabilitarla.
  if RxSpeedModifica.Down then
  begin
    // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
    // tutto a posto.
    try
      // IMposta il flag che indica se usare la transazione o meno
      // NB: Questo flag impedisce alla form di usare la transazione
      // e viene usato quando l'anagrafica viene richiamata da dentro
      // una documento e c'è una transazione già in atto (quella del
      // documento). HO fatto questo per fare in modo che l'anagrafica
      // della pratica fosse editabile anche quando richiamata da dentro un
      // documento.
      DisableTransaction := (Assigned(Caller_IdPratica) or (Assigned(Caller_CodicePratica) and Assigned(Caller_DataPratica))) and DM1.DBAzienda.InTransaction;
      // Abilita la modifica dei campi
      if not DisableTransaction then
        DM1.DBAzienda.StartTransaction;

      QryPrat.Edit;

      SourcePratApp.AutoEdit := True;
      SourceOP.AutoEdit := True;
      // Aggiunge un livello di bloccaggio dell'IconaDocTipo per disabilitare il MainMenu
      MainForm.BloccaIconaDocTipo(True, Name);
      RxSpeedButtonUscita.Enabled := False;
      SBSoggetto.Enabled := True;
      SBProprietario.Enabled := True;
      SBOccupante.Enabled := True;
      SBInstallatore.Enabled := True;
      SBCommittenteCantiere.Enabled := True;
      SBProprietarioCantiere.Enabled := True;
      SBImmobileCantiere.Enabled := True;
      SBSocGasCantiere.Enabled := True;
      SBRespImp.Enabled := True;
      BitBtnSelezioneStato.Enabled := True;
      sbContrattoRinnova.Enabled := True;
      // Buttons SelezInstallatore
      GenCal_BtnSelezInstallatore.Enabled := True;
      GenCalBio_BtnSelezInstallatore.Enabled := True;
      Bruc_BtnSelezInstallatore.Enabled := True;
      PompaCirc_BtnSelezInstallatore.Enabled := True;
      Altro_BtnSelezInstallatore.Enabled := True;
      UnExt_BtnSelezInstallatore.Enabled := True;
      UnInt_BtnSelezInstallatore.Enabled := True;
      MonBlk_BtnSelezInstallatore.Enabled := True;
      Freddo_BtnSelezInstallatore.Enabled := True;
      // Buttons SelezCollaudatore
      GenCal_BtnSelezCollaudatore.Enabled := True;
      GenCalBio_BtnSelezCollaudatore.Enabled := True;
      Bruc_BtnSelezCollaudatore.Enabled := True;
      PompaCirc_BtnSelezCollaudatore.Enabled := True;
      Altro_BtnSelezCollaudatore.Enabled := True;
      UnExt_BtnSelezCollaudatore.Enabled := True;
      UnInt_BtnSelezCollaudatore.Enabled := True;
      MonBlk_BtnSelezCollaudatore.Enabled := True;
      Freddo_BtnSelezCollaudatore.Enabled := True;
      // Per impostare i pulsanti Nuovo e Elimina
      MainPageControlChange(MainPageControl);
      // ---------------------------------------------
      if MainForm.PSChiudi.Visible then
        MainForm.PSChiudi.Enabled := False;
      DM1.ColoraTuttiCampi(PraticaForm, COLOR_MODIFICA);
      // Sposta il focus sul primo campo editabile
      case Mode of
        MODE_PRATICHE:
          begin
            ResetFocus;
            // Visualizza le griglie dei sottocantieri in modalità di etiding
            tvS1.Styles.Background := DM1.tvBackgroundModifica;
            tvS1.Styles.ContentEven := DM1.tvContentEvenModifica;
            tvS1.Styles.ContentOdd := DM1.tvContentOddModifica;
            tvS2.Styles.Background := DM1.tvBackgroundModifica;
            tvS2.Styles.ContentEven := DM1.tvContentEvenModifica;
            tvS2.Styles.ContentOdd := DM1.tvContentOddModifica;
            tvS3.Styles.Background := DM1.tvBackgroundModifica;
            tvS3.Styles.ContentEven := DM1.tvContentEvenModifica;
            tvS3.Styles.ContentOdd := DM1.tvContentOddModifica;
            // Rende editabili le griglie dei sottocantiero
            DM1.GridEdit(tvS1, True);
            DM1.GridEdit(tvS2, True);
            DM1.GridEdit(tvS3, True);
          end;
        MODE_ASSISTENZE:
          begin;
            ResetFocus;
            // Visualizza le griglie dei sottocantieri in modalità di etiding
            btvApp.Styles.Background := DM1.tvBackgroundModifica;
            btvApp.Styles.ContentEven := DM1.tvContentEvenModifica;
            btvApp.Styles.ContentOdd := DM1.tvContentOddModifica;
            btvOp.Styles.Background := DM1.tvBackgroundModifica;
            btvOp.Styles.ContentEven := DM1.tvContentEvenModifica;
            btvOp.Styles.ContentOdd := DM1.tvContentOddModifica;
            // Rende editabili le griglie contenute
            DM1.GridEdit(btvApp, True);
            DM1.GridEdit(btvOp, True);
          end;
      end;
    except
      on E: Exception do
      begin
        DM1.DBAzienda.Rollback;
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
      // Disabilita la modifica dei campi
      QryPrat.Edit;
      // Chiede di confermare le modifiche o di annullare l'operazione
      MR := DM1.ConfermaModifiche;
      if MR = mrYes then
      begin
        // Se il responsabile dell'impianto è una persona giuridica la Ragione Sociale
        // è un campo obbligatorio
        if eRagSocRespImp.Focused then
          Self.SelectNext(eRagSocRespImp, True, True); // Per essere sicuri che il dato sia confermato
        if (QryPratTIPO.AsString = 'A') and (QryPratNATURAGIURIDICARESPIMP.AsString = 'G') and (Trim(QryPratRAGSOCRESPIMP.AsString) = '') then
          raise Exception.Create('Campo obbligatorio ("Ragione Sociale" del Responsabile Impianto)');
        // Se il codice cliente è nullo (nuovo cliente) ne assegna uno nuovo.
        if QryPratCODICE.IsNull then
        begin
          QryPratCODICE.Value := DM1.ControllaSeBisognaAggiungereIlCodiceChiave(DM1.NextCodicePratica(QryPratTIPO.AsString));
        end;
        // Se i campi chiave sono assegnati rende visibile i sottocantieri
        if Mode = MODE_PRATICHE then
          PanelSottocantieri.Visible := (not QryPratTIPO.IsNull) and (not QryPratCODICE.IsNull) and (not QryPratDATAAPERTURA.IsNull);
        // Aggiorna il codice della pratica corrente
        CodicePratica := QryPratCODICE.Value;
        QryPratSINCHRO.Value := RECORD_MODIFIED;
        // Marca il record come modificato
        QryPrat.Post;
        // Ovviamente solo se siamo su un impianto
        if (Mode = MODE_ASSISTENZE) then
        begin
          if QryPratApp.Active and (QryPratApp.State <> dsBrowse) then
            QryPratApp.Post;
          if QryOP.Active and (QryOP.State <> dsBrowse) then
            QryOP.Post;
          SourcePratApp.AutoEdit := False;
          SourceOP.AutoEdit := False;
          // Procedure che cicla per tutti gli apparecchi dell'impianto e ne imposta
          // l'ID della pratica se questo è diverso
          AggiornaIdApparecchi;
          AggiornaIdOP;
        end;
        // Se siamo in modalità Pratiche/Cantieri e siamo in inserimento di un nuovo cantiere
        // allora se è stata specificata una pratica modello da cui copiare i sottocantieri...
        if (Mode = MODE_PRATICHE) and (Self.Tag = 2) and (DatiModelloPratica.Tipo <> '') then
        begin
          CopiaSottocantieriDaModello;
          QryS1.Refresh;
          QryS2.Refresh;
          QryS3.Refresh;
        end;
        // Procedure che marca le raccomandazioni/prescrizione come fatte/risolte
        MarcaPrescrizioniComeFatte;
        // Conferma il tutto
        // QryPrat.ApplyUpdates;
        // QryPrat.CommitUpdates;
        if not DisableTransaction then
          DM1.DBAzienda.Commit;
        // Decide se gli allegati devono essere già visibili oppure no.
        Allegati_VerificaAbilitazione;
        // Distrugge la mappa in modo che se è cambiato l'indirizzo questa venga ricreata con quello nuovo
        DistruggiMappa;
        // Refresh delle prescrizioni/raccomandazioni
        RefreshQueryElencoPrescrizioni;
        // Se si tratta di una nuova pratica appena inserita la seleziona già
        // come pratica corrente in modo da poter subito inserire documenti per lui
        // NB: Solo se siamo in FastSelectionMode
        if DM1.FastSelectionMode and (Self.Tag = 2) then
        begin
          if QryPratTIPO.AsString = 'A' then
            ClientiForm.SelezionaSoggettoPratica(QryPratCODICERESPIMP.AsInteger, QryPratID.AsInteger)
          else if QryPratTIPO.AsString = 'P' then
            ClientiForm.SelezionaSoggettoPratica(QryPratCLIENTE.AsInteger, QryPratID.AsInteger);
        end;
      end
      else if MR = mrNo then
      begin
        if QryPrat.State = dsInsert then
        begin
          QryPrat.Cancel;
          SourcePratApp.AutoEdit := False;
          SourceOP.AutoEdit := False;
          // QryPrat.CommitUpdates;
          if not DisableTransaction then
            DM1.DBAzienda.Rollback;
          // Refresh delle prescrizioni/raccomandazioni
          RefreshQueryElencoPrescrizioni;
          // Toglie un livello di bloccaggio dell'IconaDocTipo per riabilitare il MainMenu
          MainForm.BloccaIconaDocTipo(False, Name);
          // Chiude la form ed esce
          Close;
          Exit;
        end
        else
        begin
          QryPrat.Cancel;
          SourcePratApp.AutoEdit := False;
          SourceOP.AutoEdit := False;
          // QryPrat.CommitUpdates;
          if not DisableTransaction then
            DM1.DBAzienda.Rollback;
          // Refresh delle prescrizioni/raccomandazioni
          RefreshQueryElencoPrescrizioni;
        end;
      end
      else
      begin
        RxSpeedModifica.Down := True;
        Exit;
      end;
      // Toglie un livello di bloccaggio dell'IconaDocTipo per riabilitare il MainMenu
      MainForm.BloccaIconaDocTipo(False, Name);
      // Sincronizza i controlli a video con la situazione reali degli archivi
      RxSpeedButtonUscita.Enabled := True;
      SBSoggetto.Enabled := False;
      SBProprietario.Enabled := False;
      SBOccupante.Enabled := False;
      SBInstallatore.Enabled := False;
      SBCommittenteCantiere.Enabled := False;
      SBProprietarioCantiere.Enabled := False;
      SBImmobileCantiere.Enabled := False;
      SBSocGasCantiere.Enabled := False;
      SBRespImp.Enabled := False;
      BitBtnSelezioneStato.Enabled := False;
      sbContrattoRinnova.Enabled := False;
      // Buttons SelezInstallatore
      GenCal_BtnSelezInstallatore.Enabled := False;
      GenCalBio_BtnSelezInstallatore.Enabled := False;
      Bruc_BtnSelezInstallatore.Enabled := False;
      PompaCirc_BtnSelezInstallatore.Enabled := False;
      Altro_BtnSelezInstallatore.Enabled := False;
      UnExt_BtnSelezInstallatore.Enabled := False;
      UnInt_BtnSelezInstallatore.Enabled := False;
      MonBlk_BtnSelezInstallatore.Enabled := False;
      Freddo_BtnSelezInstallatore.Enabled := False;
      // Buttons SelezCollaudatore
      GenCal_BtnSelezCollaudatore.Enabled := False;
      GenCalBio_BtnSelezCollaudatore.Enabled := False;
      Bruc_BtnSelezCollaudatore.Enabled := False;
      PompaCirc_BtnSelezCollaudatore.Enabled := False;
      Altro_BtnSelezCollaudatore.Enabled := False;
      UnExt_BtnSelezCollaudatore.Enabled := False;
      UnInt_BtnSelezCollaudatore.Enabled := False;
      MonBlk_BtnSelezCollaudatore.Enabled := False;
      Freddo_BtnSelezCollaudatore.Enabled := False;
      // Per impostare i pulsanti Nuovo e Elimina
      MainPageControlChange(MainPageControl);
      if MainForm.PSChiudi.Visible then
        MainForm.PSChiudi.Enabled := True;
      DM1.ColoraTuttiCampi(PraticaForm, COLOR_NORMALE);
      // Sposta il focus sul primo campo editabile
      case Mode of
        MODE_PRATICHE:
          begin
            ResetFocus;
            // Visualizza le griglie dei sottocantieri come NON editabili
            tvS1.Styles.Background := DM1.tvBackground;
            tvS1.Styles.ContentEven := DM1.tvContentEven;
            tvS1.Styles.ContentOdd := DM1.tvContentOdd;
            tvS2.Styles.Background := DM1.tvBackground;
            tvS2.Styles.ContentEven := DM1.tvContentEven;
            tvS2.Styles.ContentOdd := DM1.tvContentOdd;
            tvS3.Styles.Background := DM1.tvBackground;
            tvS3.Styles.ContentEven := DM1.tvContentEven;
            tvS3.Styles.ContentOdd := DM1.tvContentOdd;
            // Rende NON editabili le griglie dei sottocantiero
            DM1.GridEdit(tvS1, False);
            DM1.GridEdit(tvS2, False);
            DM1.GridEdit(tvS3, False);
            // Disabilita i pulsanti nuovo e elimina usati per i sottocantieri
            // RxSpeedButtonNuovo.Enabled := False;
            // RxSpeedButtonElimina.Enabled := False;
          end;
        MODE_ASSISTENZE:
          begin;
            ResetFocus;
            // Visualizza le griglie dei sottocantieri in modalità di etiding
            btvApp.Styles.Background := DM1.tvBackground;
            btvApp.Styles.ContentEven := DM1.tvContentEven;
            btvApp.Styles.ContentOdd := DM1.tvContentOdd;
            btvOp.Styles.Background := DM1.tvBackground;
            btvOp.Styles.ContentEven := DM1.tvContentEven;
            btvOp.Styles.ContentOdd := DM1.tvContentOdd;
            // Rende editabili le griglie contenute
            DM1.GridEdit(btvApp, False);
            DM1.GridEdit(btvOp, False);
          end;
      end;
    except
      on E: Exception do
      begin
        MessageBeep(0);
        MessageDlg(E.Message, mtError, [mbOK], 0);
        RxSpeedModifica.Down := True;
        // Riabilita la modifica dei campi
        QryPrat.Edit;
      end;
    end;
  end;
end;

procedure TPraticaForm.DistruggiMappa;
begin
  if not Assigned(MapForm) then
    Exit;
  if (MainPageControl.ActivePage = TabMappa) and (DM1.Messaggi('Levante', 'I dati potrebbero essere cambiati!'#13#13'Ricreare la mappa?', '', [mbYes, mbNo], 0,
    nil) = mrYes) then
  begin
    MapForm.Free;
    MapForm := nil;
    MainPageControlChange(MainPageControl);
  end;
end;

procedure TPraticaForm.eCognomeRespImpKeyPress(Sender: TObject; var Key: Char);
begin
  // La somma del cognome + nome (compreso lo spazio che li separa)
  // non deve superare i 60 caratteri, altrimenti potrebbe generare
  // errori (StringTruncation) oppure venire troncati.
  // NB: Se il focus è sul cognome o sul nome lo sposta in modo da
  // essere sicuro che il valore sia postato al campo
  if ((Length(eCognomeRespImp.Text + ' ' + eNomeRespImp.Text)) >= 60) and (Ord(Key) <> 8)
  // BackSpace (altrimenti il backspace non funzionava più una volta raggiunta le dimensione massima
  then
    Key := #0;
end;

procedure TPraticaForm.eIndirizzoRespImpExit(Sender: TObject);
begin
end;

// Procedure che cicla per tutti gli apparecchi dell'impianto e ne imposta
// l'ID della pratica se questo è diverso
procedure TPraticaForm.AggiornaIdApparecchi;
var
  PrecPos: TBookmark;
begin
  if not QryPratApp.Active then
    Exit;
  QryPratApp.DisableControls;
  PrecPos := QryPratApp.GetBookmark;
  try
    QryPratApp.First;
    while not QryPratApp.Eof do
    begin
      if QryPratAppIDPRATICA.Value <> QryPratID.Value then
      begin
        QryPratApp.Edit;
        try
          QryPratAppIDPRATICA.Value := QryPratID.Value;
        finally
          QryPratApp.Post;
        end;
      end;
      QryPratApp.Next;
    end;
  finally
    QryPratApp.GotoBookmark(PrecPos);
    QryPratApp.FreeBookmark(PrecPos);
    QryPratApp.EnableControls;
  end;
end;

// Procedure che cicla per tutte le operazioni pianificate dell'impianto e ne imposta
// l'ID della pratica se questo è diverso
procedure TPraticaForm.AggiornaIdOP;
var
  PrecPos: TBookmark;
begin
  if not QryOP.Active then
    Exit;
  QryOP.DisableControls;
  PrecPos := QryOP.GetBookmark;
  try
    QryOP.First;
    while not QryOP.Eof do
    begin
      if QryOPIDPRATICA.Value <> QryPratID.Value then
      begin
        QryOP.Edit;
        try
          QryOPIDPRATICA.Value := QryPratID.Value;
        finally
          QryOP.Post;
        end;
      end;
      QryOP.Next;
    end;
  finally
    QryOP.GotoBookmark(PrecPos);
    QryOP.FreeBookmark(PrecPos);
    QryOP.EnableControls;
  end;
end;

procedure TPraticaForm.DescrizioneEnter(Sender: TObject);
begin
  // Se è in modalità di Modifica...
  if RxSpeedModifica.Down then
    DM1.ControlEnter(Sender);
end;

procedure TPraticaForm.DescrizioneExit(Sender: TObject);
begin
  // Se è in modalità di Modifica...
  if RxSpeedModifica.Down then
    DM1.ControlExit(Sender);
end;

procedure TPraticaForm.QryPratCLIENTEChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    // Query che preleva i dati dell'proprietario dell'immobile
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add
      ('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Scala, Piano, Interno, Palazzo,Citta, CAP, Provincia, Telefono, Cellulare, CodiceFiscale,');
    QryCli.SQL.Add('  Agente, Agente2, Agente3, Agente4');
    QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryPratCLIENTE.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      QryPratRAGSOCCLI.Value := DM2.GetDenominazioneSoggetto(QryCli);
      QryPratINDIRIZZOCLI.Value := QryCli.FieldByName('Indirizzo').AsString;
      QryPratNUMCIVICOCLI.Value := QryCli.FieldByName('NumCivico').AsString;
      QryPratCITTACLI.Value := QryCli.FieldByName('Citta').AsString;
      QryPratCAPCLI.Value := QryCli.FieldByName('CAP').AsString;
      QryPratPROVINCIACLI.Value := QryCli.FieldByName('Provincia').AsString;
      QryPratTELEFONOCLI.Value := QryCli.FieldByName('Telefono').AsString;
      QryPratCELLULARECLI.Value := QryCli.FieldByName('Cellulare').AsString;
      QryPratCODICEFISCALECLI.Value := QryCli.FieldByName('CodiceFiscale').AsString;
      QryPratAGENTE.Value := QryCli.FieldByName('Agente').AsString;
      QryPratAGENTE2.Value := QryCli.FieldByName('Agente2').AsString;
      QryPratAGENTE3.Value := QryCli.FieldByName('Agente3').AsString;
      QryPratAGENTE4.Value := QryCli.FieldByName('Agente4').AsString;
    end;
    // Se il codice dell'utente/occupante è vuoto o nullo copia lo stesso soggetto
    // anche li, anche se il codice è uguale mantiene l'uguaglianza
    if QryPratCODICEUT.IsNull or (QryPratCODICEUT.AsInteger = 0) then
    begin
      QryPratCODICEUT.Value := QryPratCLIENTE.AsInteger;
    end;
    // Se i dati dell'ubicazione dell'immobile sono vuoti provvede a riampire anche quelli
    // con gli stessi dati
    if (QryPratCOMUNEIMM.AsString = '') and (QryPratPROVINCIAIMM.AsString = '') and (QryPratINDIRIZZOIMM.AsString = '') and (QryPratNUMCIVICOIMM.AsString = '')
      and (QryPratPIANOIMM.AsString = '') and (QryPratINTERNOIMM.AsString = '') and (QryPratPALAZZOIMM.AsString = '') and (QryPratCAPIMM.AsString = '') then
    begin
      QryPratCOMUNEIMM.Value := QryCli.FieldByName('Citta').AsString;
      QryPratPROVINCIAIMM.Value := QryCli.FieldByName('Provincia').AsString;
      QryPratINDIRIZZOIMM.Value := QryCli.FieldByName('Indirizzo').AsString;
      QryPratNUMCIVICOIMM.Value := QryCli.FieldByName('NumCivico').AsString;
      QryPratSCALAIMM.Value := QryCli.FieldByName('Scala').AsString;
      QryPratPIANOIMM.Value := QryCli.FieldByName('Piano').AsString;
      QryPratINTERNOIMM.Value := QryCli.FieldByName('Interno').AsString;
      QryPratPALAZZOIMM.Value := QryCli.FieldByName('Palazzo').AsString;
      QryPratCAPIMM.Value := QryCli.FieldByName('CAP').AsString;
    end;
  finally
    QryCli.Close;
    QryCli.Free;
  end;
end;

procedure TPraticaForm.QryPratCODICEUTChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, Telefono, Cellulare, CodiceFiscale');
    QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryPratCODICEUT.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      QryPratRAGSOCUT.Value := DM2.GetDenominazioneSoggetto(QryCli);
      QryPratINDIRIZZOUT.Value := QryCli.FieldByName('Indirizzo').AsString;
      QryPratNUMCIVICOUT.Value := QryCli.FieldByName('NumCivico').AsString;
      QryPratCITTAUT.Value := QryCli.FieldByName('Citta').AsString;
      QryPratCAPUT.Value := QryCli.FieldByName('CAP').AsString;
      QryPratPROVINCIAUT.Value := QryCli.FieldByName('Provincia').AsString;
      QryPratTELEFONOUT.Value := QryCli.FieldByName('Telefono').AsString;
      QryPratCELLULAREUT.Value := QryCli.FieldByName('Cellulare').AsString;
      QryPratCODICEFISCALEUT.Value := QryCli.FieldByName('CodiceFiscale').AsString;
    end;
  finally
    QryCli.Close;
    QryCli.Free;
  end;
end;

procedure TPraticaForm.QryPratCODICEINSTChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, Telefono, Cellulare, CodiceFiscale');
    QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryPratCODICEINST.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      QryPratRAGSOCINST.Value := DM2.GetDenominazioneSoggetto(QryCli);
      QryPratINDIRIZZOINST.Value := QryCli.FieldByName('Indirizzo').AsString;
      QryPratNUMCIVICOINST.Value := QryCli.FieldByName('NumCivico').AsString;
      QryPratCITTAINST.Value := QryCli.FieldByName('Citta').AsString;
      QryPratCAPINST.Value := QryCli.FieldByName('CAP').AsString;
      QryPratPROVINCIAINST.Value := QryCli.FieldByName('Provincia').AsString;
      QryPratTELEFONOINST.Value := QryCli.FieldByName('Telefono').AsString;
      QryPratCELLULAREINST.Value := QryCli.FieldByName('Cellulare').AsString;
      QryPratCODICEFISCALEINST.Value := QryCli.FieldByName('CodiceFiscale').AsString;
    end;
  finally
    QryCli.Close;
    QryCli.Free;
  end;
end;

procedure TPraticaForm.SBEspandiProprietarioClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratCLIENTE.Value);
end;

procedure TPraticaForm.SBProprietarioClick(Sender: TObject);
begin
  DM1.SelezionaCliente(QryPratCLIENTE, nil, nil, '');
end;

procedure TPraticaForm.SBEspandiOccupanteClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratCODICEUT.Value);
end;

procedure TPraticaForm.SBEspandiInstallatoreClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratCODICEINST.Value);
end;

procedure TPraticaForm.SBOccupanteClick(Sender: TObject);
begin
  DM1.SelezionaCliente(QryPratCODICEUT, nil, nil, '');
end;

procedure TPraticaForm.SBInstallatoreClick(Sender: TObject);
begin
  DM1.SelezionaCliente(QryPratCODICEINST, nil, nil, '');
end;

procedure TPraticaForm.DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TPraticaForm.DBEModello2Change(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Solo se il focus è sul campo stesso altrimenti l'evento viene richiamato
  // anche quando viene fatto lo schow della form.
  if not DBEModello2.Focused then
    Exit;
  // Carica i dati della caldaia da una caldaia già inserita precedentemente
  // in modo da non doverli piùriscrivere
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT FIRST 1 COSTRUTTORE, MODELLO, BREVEDESCRIZIONECALDAIA, POTENZANOMINALE, TIPOCAMERA, TIPOTIRAGGIO, COMBUSTIBILE, COMBUSTIBILEALTRO');
    Qry.SQL.Add('FROM PRATICHE WHERE');
    if DBECostruttore2.Text <> '' then
      Qry.SQL.Add('COSTRUTTORE = ''' + DBECostruttore2.Text + ''' AND');
    Qry.SQL.Add('MODELLO = ''' + DBEModello2.Text + '''');
    if QryPrat.FieldByName('CODICE').IsNull then
    begin
      Qry.SQL.Add('AND (NOT CODICE IS NULL ' + QryPrat.FieldByName('CODICE').AsString + ' OR DATAAPERTURA <> ''' + FormatDateTime('mm/dd/yyyy',
        QryPrat.FieldByName('DATAAPERTURA').AsDateTime) + ''')');
    end
    else
    begin
      Qry.SQL.Add('AND (CODICE <> ' + QryPrat.FieldByName('CODICE').AsString + ' OR DATAAPERTURA <> ''' + FormatDateTime('mm/dd/yyyy',
        QryPrat.FieldByName('DATAAPERTURA').AsDateTime) + ''')');
    end;
    Qry.SQL.Add('AND TIPO = ''' + QryPrat.FieldByName('TIPO').AsString + '''');
    Qry.SQL.Add('AND UPPER(TIPOIMPIANTO) = UPPER(''' + QryPrat.FieldByName('TIPOIMPIANTO').AsString + ''')');
    Qry.Open;
    // Se trova qualcosa
    if not Qry.Eof then
    begin
      QryPratCOSTRUTTORE.Value := Qry.FieldByName('COSTRUTTORE').AsString;
      QryPratMODELLO.Value := Qry.FieldByName('MODELLO').AsString;
      QryPratBREVEDESCRIZIONECALDAIA.Value := Qry.FieldByName('BREVEDESCRIZIONECALDAIA').AsString;
      QryPratPOTENZANOMINALE.Value := Qry.FieldByName('POTENZANOMINALE').AsString;
      QryPratTIPOCAMERA.Value := Qry.FieldByName('TIPOCAMERA').AsString;
      QryPratTIPOTIRAGGIO.Value := Qry.FieldByName('TIPOTIRAGGIO').AsString;
      QryPratCOMBUSTIBILE.Value := Qry.FieldByName('COMBUSTIBILE').AsString;
      QryPratCOMBUSTIBILEALTRO.Value := Qry.FieldByName('COMBUSTIBILEALTRO').AsString;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.DBEModello3Change(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Solo se il focus è sul campo stesso altrimenti l'evento viene richiamato
  // anche quando viene fatto lo schow della form.
  if not DBEModello3.Focused then
    Exit;
  // Carica i dati della caldaia da una caldaia già inserita precedentemente
  // in modo da non doverli piùriscrivere
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT FIRST 1 COSTRUTTORE, MODELLO, BREVEDESCRIZIONECALDAIA, POTENZANOMINALE, TIPOCAMERA, TIPOTIRAGGIO, COMBUSTIBILE, COMBUSTIBILEALTRO');
    Qry.SQL.Add('FROM PRATICHE WHERE');
    if DBECostruttore3.Text <> '' then
      Qry.SQL.Add('COSTRUTTORE = ''' + DBECostruttore3.Text + ''' AND');
    Qry.SQL.Add('MODELLO = ''' + DBEModello3.Text + '''');
    if QryPrat.FieldByName('CODICE').IsNull then
    begin
      Qry.SQL.Add('AND (NOT CODICE IS NULL ' + QryPrat.FieldByName('CODICE').AsString + ' OR DATAAPERTURA <> ''' + FormatDateTime('mm/dd/yyyy',
        QryPrat.FieldByName('DATAAPERTURA').AsDateTime) + ''')');
    end
    else
    begin
      Qry.SQL.Add('AND (CODICE <> ' + QryPrat.FieldByName('CODICE').AsString + ' OR DATAAPERTURA <> ''' + FormatDateTime('mm/dd/yyyy',
        QryPrat.FieldByName('DATAAPERTURA').AsDateTime) + ''')');
    end;
    Qry.SQL.Add('AND TIPO = ''' + QryPrat.FieldByName('TIPO').AsString + '''');
    Qry.SQL.Add('AND UPPER(TIPOIMPIANTO) = UPPER(''' + QryPrat.FieldByName('TIPOIMPIANTO').AsString + ''')');
    Qry.Open;
    // Se trova qualcosa
    if not Qry.Eof then
    begin
      QryPratCOSTRUTTORE.Value := Qry.FieldByName('COSTRUTTORE').AsString;
      QryPratMODELLO.Value := Qry.FieldByName('MODELLO').AsString;
      QryPratBREVEDESCRIZIONECALDAIA.Value := Qry.FieldByName('BREVEDESCRIZIONECALDAIA').AsString;
      QryPratPOTENZANOMINALE.Value := Qry.FieldByName('POTENZANOMINALE').AsString;
      QryPratTIPOCAMERA.Value := Qry.FieldByName('TIPOCAMERA').AsString;
      QryPratTIPOTIRAGGIO.Value := Qry.FieldByName('TIPOTIRAGGIO').AsString;
      QryPratCOMBUSTIBILE.Value := Qry.FieldByName('COMBUSTIBILE').AsString;
      QryPratCOMBUSTIBILEALTRO.Value := Qry.FieldByName('COMBUSTIBILEALTRO').AsString;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.tvS1CustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TPraticaForm.tvS1CustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TPraticaForm.tvS1CustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
  var ADone: Boolean);
begin
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TPraticaForm.QryS1BeforeDelete(DataSet: TDataSet);
begin
    if DM1.Messaggi('Elimina', 'Eliminare la voce selezionata?', '', [mbYes, mbNo], 0, nil) <> mrYes then
      Abort;
end;

procedure TPraticaForm.QryS1BeforePost(DataSet: TDataSet);
begin
  // Se i dati della primary key della pratica sono stati già assegnati
  // prosegue impostando questi dati anche nel sottocantiere, altrimenti
  // annulla l'operazione
  if (QryPratTIPO.IsNull) or (QryPratTIPO.AsString = '') or (QryPratCODICE.IsNull) or (QryPratCODICE.AsInteger = 0) or (QryPratDATAAPERTURA.IsNull) then
  begin
    DM1.Messaggi('Levante',
      'I dati identificativi della pratica/cantiere non sono completi.'#13#13'Prima di poter inserire dei sottocantieri è necessario che il CODICE e la DATA DI APERTURA della pratica siano stati inseriti.',
      '', [mbOK], 0, nil);
    Abort;
    Exit;
  end;
  with DataSet do
  begin
    FieldByName('TIPOCANTIERE').Value := QryPratTIPO.AsString;
    FieldByName('CODICECANTIERE').Value := QryPratCODICE.AsInteger;
    FieldByName('DATAAPERTURACANTIERE').Value := QryPratDATAAPERTURA.AsDateTime;
  end;
end;

procedure TPraticaForm.RxSpeedButtonNuovoClick(Sender: TObject);
var
  ClientPoint, ScreenPoint: TPoint;
begin
  // Elenco apparecchi di un impianto
  if MainPageControl.ActivePage = TabApparecchi then
  begin

    // ===========================================================================
    // ELENCO APPARECCHI DI UN IMPIANTO
    // ---------------------------------------------------------------------------
    // Esegue la conversione delle coordinate dove dovrà apparire il menù
    // da coordinate client della finestra a coordinate assolute dello schermo.
    // (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
    ClientPoint.X := RxSpeedButtonNuovo.Left + POPUP_X_OFFSET + ClientTopPanel.Left;
    ClientPoint.Y := RxSpeedButtonNuovo.Top + POPUP_Y_OFFSET;
    ScreenPoint := ClientToScreen(ClientPoint);
    // Apre il menu
    PopupMenuNuovoApparecchio.Popup(ScreenPoint.X, ScreenPoint.Y)
    // ===========================================================================

    // Operazioni pianificate di un impianto
  end
  else if MainPageControl.ActivePage = TabOP then
  begin

    // ===========================================================================
    // OPERAZIONI PIANIFICATE DI UN IMPIANTO
    // ---------------------------------------------------------------------------
    // Esegue la conversione delle coordinate dove dovrà apparire il menù
    // da coordinate client della finestra a coordinate assolute dello schermo.
    // (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
    ClientPoint.X := RxSpeedButtonNuovo.Left + POPUP_X_OFFSET + ClientTopPanel.Left;
    ClientPoint.Y := RxSpeedButtonNuovo.Top + POPUP_Y_OFFSET;
    ScreenPoint := ClientToScreen(ClientPoint);
    // Apre il menu
    MenuNuovaOP.Popup(ScreenPoint.X, ScreenPoint.Y)
    // ===========================================================================

  end;
end;

// Procedura che importa tutte le operazioni pianificate predefinite per
// il tipo di impianto.
procedure TPraticaForm.ImportaOpPerTipoImpianto(TipoImpianto: String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà i dati dell'operazione pianificata
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Imposta la query che ricaverà l'elenco delle operazioni pianificate
    // predefinite per il tipo di impianto
    Q.SQL.Add('SELECT CODICE FROM OP WHERE AGGNUOVOIMPIANTO = ' + QuotedStr('I'));
    Q.SQL.Add('AND TIPO LIKE ' + QuotedStr('%' + TipoImpianto + '%'));
    Q.Open;
    // Cicla per tutte le OP trovate e le inserisce nell'impianto
    while not Q.Eof do
    begin
      NuovoRigoOP(Q.Fields[0].AsString, AM_Append);
      Q.Next;
    end;
    // Chiude la query
    Q.Close;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;

// Procedure che aggiunge l'operazione pianifica all'elenco apposito
procedure TPraticaForm.NuovoRigoOP(CodOP: String; Mode: TAddArtMode; CodiceApparecchio: Integer = -1);
var
  DC: TcxCustomDataController;
  Q: TIB_Cursor;
begin
  // DC Punta al DataController che attualmente ha il focus
  DC := btvOP.DataController;
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà i dati dell'operazione pianificata
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT CODICE, DESCRIZIONE, NOTE, PERIODICITA, MINUTIPREVISTI, GG_AUTOSEL, ADDEBITA, INABBONAMENTO,');
    Q.SQL.Add('PRZUNIT, SCONTO1, SCONTO2, SCONTO3, PRZUNITNETTO, CODICEIVA, PRZUNITIVACOMP, PRZUNITNETTOIVACOMP');
    Q.SQL.Add('FROM OP WHERE CODICE = ' + QuotedStr(CodOP));
    // Apre la query e ne carica il contenuto
    Q.Open;
    if Q.Eof then
      raise Exception.Create('Voce non trovata!');
    // Se non c'è alcun record selezionato forza l'Append del nuovo rigo
    // altrimenti dà un errore.
    if DC.FocusedRecordIndex = -1 then
      Mode := AM_Append;
    // In base alla modalità modifica il rigo corrente oppure fà un append o un isert.
    case Mode of
      AM_Append:
        QryOP.Append;
      AM_Insert:
        QryOP.Insert;
    end;
    // Carica i dati nel nuovo record
    QryOPID.Value := DM1.Generators_NextGenID('GEN_ID_OPPRATICA');
    QryOPIDPRATICA.Value := QryPratID.Value;
    QryOPIDOP.Value := Q.FieldByName('CODICE').AsString;
    QryOPDESCRIZIONE.Value := Q.FieldByName('DESCRIZIONE').AsString;
    QryOPNOTE.Value := Q.FieldByName('NOTE').AsString;
    QryOPPERIODICITA.Value := Q.FieldByName('PERIODICITA').AsInteger;
    QryOPGG_AUTOSEL.Value := Q.FieldByName('GG_AUTOSEL').AsInteger;
    QryOPMINUTIPREVISTI.Value := Q.FieldByName('MINUTIPREVISTI').AsInteger;

    QryOPPRZUNIT.Value := Q.FieldByName('PRZUNIT').AsCurrency;
    QryOPSCONTO1.Value := Q.FieldByName('SCONTO1').AsFloat;
    QryOPSCONTO2.Value := Q.FieldByName('SCONTO2').AsFloat;
    QryOPSCONTO3.Value := Q.FieldByName('SCONTO3').AsFloat;
    QryOPPRZUNITNETTO.Value := Q.FieldByName('PRZUNITNETTO').AsCurrency;
    QryOPCODICEIVA.Value := Q.FieldByName('CODICEIVA').AsInteger;
    QryOPPRZUNITIVACOMP.Value := Q.FieldByName('PRZUNITIVACOMP').AsCurrency;
    QryOPPRZUNITNETTOIVACOMP.Value := Q.FieldByName('PRZUNITNETTOIVACOMP').AsCurrency;

    QryOPADDEBITA.Value := Q.FieldByName('ADDEBITA').AsString;
    QryOPINABBONAMENTO.Value := Q.FieldByName('INABBONAMENTO').AsString;
    // Se specificato assegna la nuova OP all'apparecchio
    if CodiceApparecchio <> (-1) then
      QryOPIDAPPARECCHIOPRAT.Value := CodiceApparecchio;
    // Comferma la nuova OP
    QryOP.Post;
    // Chiude la query
    Q.Close;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;

// Procedure che aggiunge all'elenco delle operazioni pianificate l'operazione
// pianificata di cui si riceve il codice
procedure TPraticaForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
    // Se siamo negli apparecchi di un impianto...
  if MainPageControl.ActivePage = TabApparecchi then
  begin

    // =========================================================================
    // ELIMINA APPARECCHIO IMPIANTO
    // -------------------------------------------------------------------------
    if DM1.Messaggi('Elimina', 'Confermi di voler eliminare la voce selezionata?', '', [mbYes, mbNo], 0, nil) = mrYes then
    begin
      btvApp.DataController.DeleteSelection;
      // Altrimenti quando elimino l'ultimo record mi rimane la pagina dei dati apparecchio.
      PageControlApparecchiImpianto.ActivePage := nil;
    end;
    // =========================================================================

    // Se siamo nelle operazioni pianificate di un impianto...
  end
  else if MainPageControl.ActivePage = TabOP then
  begin

    // =========================================================================
    // ELIMINA OPERAZIONE PIANIFICATA
    // -------------------------------------------------------------------------
    if DM1.Messaggi('Elimina', 'Confermi di voler eliminare la voce selezionata?', '', [mbYes, mbNo], 0, nil) = mrYes then
    begin
      btvOP.DataController.DeleteSelection;
    end;
    // =========================================================================

  end;
end;

procedure TPraticaForm.SpeedButtonRollOver1Click(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratCOMMITCODICE.Value);
end;

procedure TPraticaForm.SpeedButtonRollOver3Click(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratPROPCODICE.Value);
end;

procedure TPraticaForm.SpeedButtonRollOver5Click(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratIMMOBCODICE.Value);
end;

procedure TPraticaForm.SBCommittenteCantiereClick(Sender: TObject);
begin
  DM1.SelezionaCliente(QryPratCOMMITCODICE, nil, nil, '');
end;

procedure TPraticaForm.SBProprietarioCantiereClick(Sender: TObject);
begin
  DM1.SelezionaCliente(QryPratPROPCODICE, nil, nil, '');
end;

procedure TPraticaForm.SBImmobileCantiereClick(Sender: TObject);
begin
  DM1.SelezionaCliente(QryPratIMMOBCODICE, nil, nil, '');
end;

procedure TPraticaForm.QryPratCOMMITCODICEChange(Sender: TField);
var
  Qry: TIB_Cursor;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add
      ('SELECT RAGIONESOCIALE, Nome, Cognome, TipoPersona,  INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA, TELEFONO, PARTITAIVA, CODICEFISCALE');
    Qry.SQL.Add('FROM CLIENTI');
    Qry.SQL.Add('WHERE CODICE = ' + QryPratCOMMITCODICE.AsString);
    Qry.Open;
    if not Qry.Eof then
    begin
      QryPratCOMMITDENOMINAZIONE.Value := DM2.GetDenominazioneSoggetto(Qry);
      QryPratCOMMITINDIRIZZO.Value := Qry.FieldByName('INDIRIZZO').AsString;
      QryPratCOMMITNUMCIVICO.Value := Qry.FieldByName('NUMCIVICO').AsString;
      QryPratCOMMITSCALA.Value := Qry.FieldByName('SCALA').AsString;
      QryPratCOMMITPIANO.Value := Qry.FieldByName('PIANO').AsString;
      QryPratCOMMITINTERNO.Value := Qry.FieldByName('INTERNO').AsString;
      QryPratCOMMITCAP.Value := Qry.FieldByName('CAP').AsString;
      QryPratCOMMITLOCALITA.Value := Qry.FieldByName('CITTA').AsString;
      QryPratCOMMITPROVINCIA.Value := Qry.FieldByName('PROVINCIA').AsString;
      QryPratCOMMITTELEFONO.Value := Qry.FieldByName('TELEFONO').AsString;
      QryPratCOMMITPIVA.Value := Qry.FieldByName('PARTITAIVA').AsString;
      QryPratCOMMITCODICEFISCALE.Value := Qry.FieldByName('CODICEFISCALE').AsString;
    end
    else
    begin
      MessageBeep(0);
      MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOK], 0)
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.QryPratPROPCODICEChange(Sender: TField);
var
  Qry: TIB_Cursor;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add
      ('SELECT RAGIONESOCIALE, Nome, Cognome, TipoPersona, INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA, TELEFONO, PARTITAIVA, CODICEFISCALE');
    Qry.SQL.Add('FROM CLIENTI');
    Qry.SQL.Add('WHERE CODICE = ' + QryPratPROPCODICE.AsString);
    Qry.Open;
    if not Qry.Eof then
    begin
      QryPratPROPDENOMINAZIONE.Value := DM2.GetDenominazioneSoggetto(Qry);
      QryPratPROPINDIRIZZO.Value := Qry.FieldByName('INDIRIZZO').AsString;
      QryPratPROPNUMCIVICO.Value := Qry.FieldByName('NUMCIVICO').AsString;
      QryPratPROPSCALA.Value := Qry.FieldByName('SCALA').AsString;
      QryPratPROPPIANO.Value := Qry.FieldByName('PIANO').AsString;
      QryPratPROPINTERNO.Value := Qry.FieldByName('INTERNO').AsString;
      QryPratPROPCAP.Value := Qry.FieldByName('CAP').AsString;
      QryPratPROPLOCALITA.Value := Qry.FieldByName('CITTA').AsString;
      QryPratPROPPROVINCIA.Value := Qry.FieldByName('PROVINCIA').AsString;
      QryPratPROPTELEFONO.Value := Qry.FieldByName('TELEFONO').AsString;
      QryPratPROPPIVA.Value := Qry.FieldByName('PARTITAIVA').AsString;
      QryPratPROPCODICEFISCALE.Value := Qry.FieldByName('CODICEFISCALE').AsString;
    end
    else
    begin
      MessageBeep(0);
      MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOK], 0)
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.QryPratIMMOBCODICEChange(Sender: TField);
var
  Qry: TIB_Cursor;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add('SELECT RAGIONESOCIALE, INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA');
    Qry.SQL.Add('FROM CLIENTI');
    Qry.SQL.Add('WHERE CODICE = ' + QryPratIMMOBCODICE.AsString);
    Qry.Open;
    if not Qry.Eof then
    begin
      QryPratNOME.Value := Qry.FieldByName('RAGIONESOCIALE').AsString;
      QryPratIMMOBINDIRIZZO.Value := Qry.FieldByName('INDIRIZZO').AsString;
      QryPratIMMOBNUMCIVICO.Value := Qry.FieldByName('NUMCIVICO').AsString;
      QryPratIMMOBSCALA.Value := Qry.FieldByName('SCALA').AsString;
      QryPratIMMOBPIANO.Value := Qry.FieldByName('PIANO').AsString;
      QryPratIMMOBINTERNO.Value := Qry.FieldByName('INTERNO').AsString;
      QryPratIMMOBCAP.Value := Qry.FieldByName('CAP').AsString;
      QryPratIMMOBLOCALITA.Value := Qry.FieldByName('CITTA').AsString;
      QryPratIMMOBPROVINCIA.Value := Qry.FieldByName('PROVINCIA').AsString;
    end
    else
    begin
      MessageBeep(0);
      MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOK], 0)
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.SBSocGasCantiereClick(Sender: TObject);
begin
  DM1.SelezionaSocGas(QryPratSOCGASCODICE);
end;

procedure TPraticaForm.QryPratAfterOpen(DataSet: TDataSet);
begin
  // Se siamo in modalità Impienti e contratti apre le query relative
  // alle apparecchiature e alle operazioni pianificate
  if Mode = MODE_ASSISTENZE then
  begin
    // Se la form è stata richiamata da dentro un documento non apre un bel niente
    if not FromDocument then
    begin
      // Apparecchi
      if QryPratApp.Active then
        QryPratApp.Close;
      if not QryPratApp.Prepared then
        QryPratApp.Prepare;
      QryPratApp.Params.ParamByName('P_IDPRATICA').AsInteger := QryPratID.AsInteger;
      QryPratApp.Open;
      // Apre le Operazioni pianificate
      OP_OpenOrRefresh;
    end;
    // Se invece siamo in modalità Cantieri/Pratiche apre le query
    // relative ai sottocantieri
  end
  else if Mode = MODE_PRATICHE then
  begin
    // Apre la query delle società Gas
    QrySocGas.Open;
    // Apre le query dei sottocantieri
    QryS1.Open;
    QryS2.Open;
    QryS3.Open;
  end;
  // Verifica se devono essere evidenziale le note
  ControllaEvidenziazioneNotePrivateImpianto;
end;

// Procedure che apre o rinfresca le Operazioni Pianificate
procedure TPraticaForm.OP_OpenOrRefresh;
begin
  // Se la query è già aperta la rinfresca
  if QryOP.Active then
  begin
    QryOP.Refresh;
    // Altrimenti la imposta e la apre
  end
  else
  begin
    if not QryOP.Prepared then
      QryOP.Prepare;
    QryOP.Params.ParamByName('P_IDPRATICA').AsInteger := QryPratID.AsInteger;
    QryOP.Open;
    // Si posiziona all'inizio
    btvOP.DataController.GotoFirst;
  end;
end;

procedure TPraticaForm.QryPratBeforeClose(DataSet: TDataSet);
begin
  QrySocGas.Close;
end;

procedure TPraticaForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
  // Richiama la selezione dello stato del documento
  DM1.SelezionaStato('Cantieri/Pratiche', QryPrat, 0);
end;

procedure TPraticaForm.SBEspandiRespImpClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratCODICERESPIMP.Value);
end;

procedure TPraticaForm.SBRespImpClick(Sender: TObject);
begin
  DM1.SelezionaCliente(QryPratCODICERESPIMP, nil, nil, '');
end;

procedure TPraticaForm.QryPratCODICERESPIMPChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, Telefono, Cellulare, CodiceFiscale');
    QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryPratCODICERESPIMP.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      QryPratRAGSOCRESPIMP.Value := QryCli.FieldByName('RagioneSociale').AsString;
      QryPratNOMERESPIMP.Value := QryCli.FieldByName('Nome').AsString;
      QryPratCOGNOMERESPIMP.Value := QryCli.FieldByName('Cognome').AsString;
      QryPratNATURAGIURIDICARESPIMP.Value := QryCli.FieldByName('TipoPersona').AsString;
      QryPratINDIRIZZORESPIMP.Value := QryCli.FieldByName('Indirizzo').AsString;
      QryPratNUMCIVICORESPIMP.Value := QryCli.FieldByName('NumCivico').AsString;
      QryPratCITTARESPIMP.Value := QryCli.FieldByName('Citta').AsString;
      QryPratCAPRESPIMP.Value := QryCli.FieldByName('CAP').AsString;
      QryPratPROVINCIARESPIMP.Value := QryCli.FieldByName('Provincia').AsString;
      QryPratTELEFONORESPIMP.Value := QryCli.FieldByName('Telefono').AsString;
      QryPratCELLULARERESPIMP.Value := QryCli.FieldByName('Cellulare').AsString;
      QryPratCODICEFISCALERESPIMP.Value := QryCli.FieldByName('CodiceFiscale').AsString;
    end;
    if (not QryPratCODICERESPIMP.IsNull) then
    begin
      if QryPratCODICERESPIMP.Value = QryPratCLIENTE.AsInteger then
        QryPratINQUALITADIRESPIMP.Value := 'Proprietario'
      else if QryPratCODICERESPIMP.Value = QryPratCODICEUT.AsInteger then
        QryPratINQUALITADIRESPIMP.Value := 'Occupante'
      else if QryPratCODICERESPIMP.Value = QryPratCODICEINST.AsInteger then
        QryPratINQUALITADIRESPIMP.Value := 'Amministratore'
      else
        QryPratINQUALITADIRESPIMP.Value := 'Terzo responsabile';
    end;
  finally
    QryCli.Close;
    QryCli.Free;
  end;
end;

procedure TPraticaForm.PanelRespImp_OldDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  Mittente: TControl;
begin
  Accept := False;
  // Se il mittente è un elemento del pannello dei dati del proprietario...
  if (Source is TControl) then
  begin
    Mittente := (Source as TControl);
    if (Mittente.Name = 'PanelProprietario') or (Mittente.Parent.Name = 'PanelProprietario') then
      Accept := True;
    if (Mittente.Name = 'PanelOccupante') or (Mittente.Parent.Name = 'PanelOccupante') then
      Accept := True;
    if (Mittente.Name = 'PanelInstallatore') or (Mittente.Parent.Name = 'PanelInstallatore') then
      Accept := True;
  end;
end;

procedure TPraticaForm.PanelRespImp_OldDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Mittente: TControl;
begin
  if not RxSpeedModifica.Down then
    Exit;
  // Se il mittente è un elemento del pannello dei dati del proprietario...
  if (Source is TControl) then
  begin
    Mittente := (Source as TControl);
    // Se il mittente è un elemento del pannello dei dati del proprietario...

    if (Mittente.Name = 'PanelProprietario') or (Mittente.Parent.Name = 'PanelProprietario') then
    begin
      if not QryPratCLIENTE.IsNull then
        QryPratCODICERESPIMP.Value := QryPratCLIENTE.AsInteger;
    end;

    if (Mittente.Name = 'PanelOccupante') or (Mittente.Parent.Name = 'PanelOccupante') then
    begin
      if not QryPratCODICEUT.IsNull then
        QryPratCODICERESPIMP.Value := QryPratCODICEUT.AsInteger;
    end;

    if (Mittente.Name = 'PanelInstallatore') or (Mittente.Parent.Name = 'PanelInstallatore') then
    begin
      if not QryPratCODICEINST.IsNull then
        QryPratCODICERESPIMP.Value := QryPratCODICEINST.AsInteger;
    end;
  end;
end;

procedure TPraticaForm.Annulladatachiusura1Click(Sender: TObject);
begin
  if DM1.Messaggi('Levante', 'Annullare la data di chiusura?', 'NB: Annullando la data di chiusura si riapre la pratica/cant.', [mbYes, mbNo], 0, nil) <> mrYes
  then
    Exit;
  QryPratDATACHIUSURA.Clear;
end;

procedure TPraticaForm.PopupMenuDataChiusuraPopup(Sender: TObject);
begin
  Annulladatachiusura1.Enabled := RxSpeedModifica.Down;
end;

procedure TPraticaForm.Categ1DropDown(Sender: TObject);
var
  CategIndex: String;
  CB: TDBComboBox;
  Qry: TIB_Cursor;
begin
  CB := (Sender as TDBComboBox);
  CB.Items.Clear;
  CB.Items.Add(''); // Valore vuoto per annullare la soluzione.
  CategIndex := IntToStr(CB.Tag);
  // IMposta la query per il reperimento dell'elenco delle categorie
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CAMPO1 FROM CATEGCANT' + CategIndex + ' ORDER BY CAMPO1');
    Qry.Open;
    while not Qry.Eof do
    begin
      CB.Items.Add(Qry.FieldByName('CAMPO1').AsString);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.ApriQueryElencoUltimiInterventi;
begin
  // Prima chiude la query se è già aperta
  if QryIntPrec.Active then
    QryIntPrec.Close;
  // Se il codice pratica (impianto) non è ancora assegnato esce subi e non apre nulla
  // NB: Per risolvere il problema che quando creavo un impianto, finchè non lo confermavo e quindi non
  // veniva assegnato il COdice mi visualizzava i predenti di tutti gli impianti.
  if QryPratCODICE.AsInteger = 0 then
    Exit;
  // IMposta ed apre la query che contiene l'elenco degli ultimi 3 interventi effettuato
  // sullo stesso impianto
  if not QryIntPrec.Prepared then
    QryIntPrec.Prepare;
  // IMpostazione Parametri Query
  QryIntPrec.Params.ParamByName('P_PRATICA').AsInteger := QryPratCODICE.Value;
  QryIntPrec.Params.ParamByName('P_DATAPRATICA').AsDate := QryPratDATAAPERTURA.Value;
  // Apre la query
  QryIntPrec.Open;
end;

procedure TPraticaForm.AzzeraStato1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    QryPratSTATODESCRIZIONE.Clear;
    QryPratSTATOFOREGROUND.Clear;
    QryPratSTATOBACKGROUND.Clear;
    Descrizione.SetFocus;
    DBEditStatoDocumento.SetFocus;
  end;
end;

procedure TPraticaForm.RefreshQueryElencoPrescrizioni;
begin
  // Se l'anagrafica è stata chiamata da dentro un documento non fa nulla
  if FromDocument then
    Exit;
  // Se la query è attiva
  if QryPresc.Active then
  begin
    QryPresc.Close;
    QryPresc.Open;
    Exit;
  end;
  // Se invece non è attiva
  ApriQueryElencoPrescrizioni;
end;

procedure TPraticaForm.ApriQueryElencoPrescrizioni;
begin
  // Se l'anagrafica è stata chiamata da dentro un documento non fa nulla
  if FromDocument then
    Exit;
  // Prima chiude la query se è già aperta
  if QryPresc.Active then
    QryPresc.Close;
  // Se il codice pratica (impianto) non è ancora assegnato esce subi e non apre nulla
  // NB: Per risolvere il problema che quando creavo un impianto, finchè non lo confermavo e quindi non
  // veniva assegnato il COdice mi visualizzava i predenti di tutti gli impianti.
  if QryPratCODICE.AsInteger = 0 then
    Exit;
  // IMposta ed apre la query che contiene l'elenco degli ultimi 3 interventi effettuato
  // sullo stesso impianto
  if not QryPresc.Prepared then
    QryPresc.Prepare;
  // Imposta i parametri della query
  QryPresc.Params.ParamByName('P_PRATICA').AsInteger := QryPratCODICE.Value;
  QryPresc.Params.ParamByName('P_DATAPRATICA').AsDate := QryPratDATAAPERTURA.Value;
  // Apre la query
  QryPresc.Open;
end;

procedure TPraticaForm.QryPratAppBeforePost(DataSet: TDataSet);
begin
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then
  begin
    DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_PRATAPPARECCHI');
  end;
  // IMposta l'ID della pratica nel rigo attuale
  DataSet.FieldByName('IDPRATICA').AsInteger := QryPratID.AsInteger;
  // Imposta il TIPOIMPIANTO uguale a quello della pratica
  DataSet.FieldByName('TIPOIMPIANTO').AsString := QryPratTIPOIMPIANTO.AsString;
  // Se l'utente non specifica quale allegato vuole per l'apparecchio lo
  // assume lui in base alla potenza
  if ((QryPratAppALLEGATO.IsNull) or (Trim(QryPratAppALLEGATO.AsString) = '')) then
  begin
    if (QryPratAppTIPOAPPARECCHIO.AsString = 'Generatore di calore') then
      QryPratAppALLEGATO.Value := 'RCEE1 - gruppi termici'
    else if (QryPratAppTIPOAPPARECCHIO.AsString = 'Generatore di calore biomassa') then
      QryPratAppALLEGATO.Value := 'RCEE1B - gruppi termici a biomassa combustibile'
    else if (QryPratAppTIPOAPPARECCHIO.AsString = 'Unità esterna') or (QryPratAppTIPOAPPARECCHIO.AsString = 'Monoblocco') or
      (QryPratAppTIPOAPPARECCHIO.AsString = 'Macchina per freddo') then
      QryPratAppALLEGATO.Value := 'RCEE2 - gruppi frigo/pompe di calore';
  end;
  // Verifica che non si sia inserito un apparecchio più volte
  ControlloMatricolaApparecchioEsistente;
end;

function TPraticaForm.NuovoApparecchio(Tipo: String): Integer;
begin
  // Disabilito tutti i controlli altrimenti in alcuni casi mi dava un errore
  QryPratApp.DisableControls;
  try
    // Crea il nuovo apparecchio
    QryPratApp.Append;
    // Assegna il tipo di apparecchio
    QryPratAppTIPOAPPARECCHIO.Value := Tipo;
    // Effettua il post del record
    QryPratApp.Post;
    // Ritorna l'ID assegnato al nuovo apperacchio
    Result := QryPratAppID.AsInteger;
    // Alimina eventuali caratteri dopo 'Altro' nel caso l'apparecchio sia ti tipo 'Altro'
    //  NB: Faccio questo da quando ho messo la posisbilità di specificare un tipo custom di apparecchio per
    //       per gli apparecchi 'Altro'
    if LeftStr(Tipo, 8) = 'Altro - ' then
      Tipo := 'Altro';
    // Se ci sono crea automaticamente le Operazioni Pianificate
    // preimpostate per il tipo di apparecchio
    SP_OP_PRATAPP_ADDALL.Prepare;
    SP_OP_PRATAPP_ADDALL.ParamByName('IN_IDPRATICA').AsInteger := QryPratID.Value;
    SP_OP_PRATAPP_ADDALL.ParamByName('IN_IDPRATAPP').AsInteger := QryPratAppID.Value;
    SP_OP_PRATAPP_ADDALL.ParamByName('IN_TIPOPRATAPP').AsString := Tipo;
    SP_OP_PRATAPP_ADDALL.ParamByName('IN_TIPOIMPIANTO').AsString := QryPratTIPOIMPIANTO.AsString;
    SP_OP_PRATAPP_ADDALL.ExecProc;
    // Refresh delle Operazioni pianificate
    OP_OpenOrRefresh;
  finally
    // Riabilito i controlli
    QryPratApp.EnableControls;
  end;
end;

procedure TPraticaForm.Generatoredicalore1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Generatore di calore');
end;

procedure TPraticaForm.Generatoredicaloreabiomassacombustibile1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Generatore di calore biomassa');
end;

procedure TPraticaForm.Bruciatore1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Bruciatore');
end;

procedure TPraticaForm.Pompadicircolazione1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Pompa di circolazione');
end;

procedure TPraticaForm.Unitesterna1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Unità esterna');
end;

procedure TPraticaForm.Unitinterna1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Unità interna');
end;

procedure TPraticaForm.Monoblocco1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Monoblocco');
end;

procedure TPraticaForm.Macchinaperfreddo1Click(Sender: TObject);
begin
  // Crea il nuovo apparecchio
  NuovoApparecchio('Macchina per freddo');
end;

procedure TPraticaForm.Altro1Click(Sender: TObject);
var
  LTipo: string;
begin
  // Da all'utente la possibilità di specificare un tipo di apparecchio custom
  //  da visualizare
  LTipo := Trim(InputBox('Apparecchio altro (max 12 caratteri)', 'Tipo', ''));
  if LTipo <> '' then
    LTipo := 'Altro - ' + LeftStr(LTipo, 12)
  else
    LTipo := 'Altro';
  // Crea il nuovo apparecchio
  NuovoApparecchio(LTipo);
end;

procedure TPraticaForm.btvAppFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  TipoApparecchio: String;
begin
  // In base al tipo di apparecchio presente nel record attualmente con il focus,
  // visualizza la pagina relativa
  // ---------------------------------------------------------------------------
  // Alcuni controlli per evitare errori
  if AFocusedRecord = nil then
    Exit;
  if VarIsNull(AFocusedRecord.Values[btvAppTIPOAPPARECCHIO.Index]) then
    Exit;
  // Carica il TipoApparecchio
  TipoApparecchio := QryPratApp.FieldByName('TIPOAPPARECCHIO').AsString;
  // IN base al tipo di apparecchio visualizza la pagina corretta.
  if TipoApparecchio = 'Generatore di calore' then
    PageControlApparecchiImpianto.ActivePage := TabTermo_GeneratoreDiCalore
  else if TipoApparecchio = 'Generatore di calore biomassa' then
    PageControlApparecchiImpianto.ActivePage := TabTermo_GeneratoreDiCaloreBiomassa
  else if TipoApparecchio = 'Bruciatore' then
    PageControlApparecchiImpianto.ActivePage := TabTermo_BruciatoreAbbinato
  else if TipoApparecchio = 'Pompa di circolazione' then
    PageControlApparecchiImpianto.ActivePage := TabTermo_Pompa
  else if TipoApparecchio = 'Unità esterna' then
    PageControlApparecchiImpianto.ActivePage := TabClima_UnitaEsterna
  else if TipoApparecchio = 'Unità interna' then
    PageControlApparecchiImpianto.ActivePage := TabClima_UnitaInterna
  else if TipoApparecchio = 'Monoblocco' then
    PageControlApparecchiImpianto.ActivePage := TabClima_Monoblocco
  else if TipoApparecchio = 'Macchina per freddo' then
    PageControlApparecchiImpianto.ActivePage := TabFreddo_MacchinaPerFreddo
  else if LeftStr(TipoApparecchio, 5) = 'Altro' then
    PageControlApparecchiImpianto.ActivePage := TabAltro
  else
    PageControlApparecchiImpianto.ActivePage := nil;
end;

procedure TPraticaForm.btvAppNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  case AButtonIndex of
    NBDI_APPEND:
    begin
      RxSpeedButtonNuovoClick(RxSpeedButtonNuovo);
      ADone := True;
    end;
  end;
end;

function TPraticaForm.PanelFocused(Panel: TControl): Boolean;
var
  CurrentControl: TControl;
begin
  // questa funzione ritorna True se il focus è su qualunque controllo dei dati dell'apparecchio.
  Result := False;
  if (MainForm.ActiveControl = nil) then
    Exit;
  CurrentControl := MainForm.ActiveControl;
  repeat
    if (CurrentControl.Parent = nil) or (not(CurrentControl.Parent is TControl)) then
      Exit;
    CurrentControl := CurrentControl.Parent;
    Result := (CurrentControl = Panel);
  until Result;
end;

procedure TPraticaForm.GenCal_CostruttoreDropDown(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(COSTRUTTORE) FROM PRATAPPARECCHI WHERE UPPER(TIPOAPPARECCHIO) = UPPER(' + QuotedStr(QryPratAppTIPOAPPARECCHIO.AsString) +
      ') AND TRIM(COSTRUTTORE) <> ''''');
    Qry.Open;
    (Sender as TDBComboBox).Items.Clear;
    (Sender as TDBComboBox).Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.GenCal_ModelloDropDown(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(MODELLO) FROM PRATAPPARECCHI WHERE COSTRUTTORE LIKE ''%' + QryPratApp.FieldByName('COSTRUTTORE').AsString +
      '%'' AND TIPOAPPARECCHIO = ''' + QryPratAppTIPOAPPARECCHIO.AsString + ''' AND TRIM(MODELLO) <> ''''');
    Qry.Open;
    (Sender as TDBComboBox).Items.Clear;
    (Sender as TDBComboBox).Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.GenCal_LocaleInstallazioneDropDown(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(UBICAZIONE) FROM PRATAPPARECCHI WHERE TRIM(UBICAZIONE) <> ''''');
    Qry.Open;
    (Sender as TDBComboBox).Items.Clear;
    (Sender as TDBComboBox).Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
    // Se non ci sono inserisce le seguenti voci
    if ((Sender as TDBComboBox).Items.IndexOf('TECNICO') = -1) then
      (Sender as TDBComboBox).Items.Add('TECNICO');
    if ((Sender as TDBComboBox).Items.IndexOf('ESTERNO') = -1) then
      (Sender as TDBComboBox).Items.Add('ESTERNO');
    if ((Sender as TDBComboBox).Items.IndexOf('INTERNO') = -1) then
      (Sender as TDBComboBox).Items.Add('INTERNO');
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.GenCal_MarcaEfficienzaEnergDropDown(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(MARCAEFFICENERGETICA) FROM PRATAPPARECCHI WHERE TRIM(MARCAEFFICENERGETICA) <> ''''');
    Qry.Open;
    (Sender as TDBComboBox).Items.Clear;
    (Sender as TDBComboBox).Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.GenCal_FluidoTermovettoreDropDown(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(FLUIDOTERMOVETTORE) FROM PRATAPPARECCHI WHERE TRIM(FLUIDOTERMOVETTORE) <> ''''');
    Qry.Open;
    (Sender as TDBComboBox).Items.Clear;
    (Sender as TDBComboBox).Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.QryPratAppINSTCODICEChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale FROM Clienti WHERE Codice = ' + QryPratAppINSTCODICE.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      QryPratAppINSTRAGSOC.Value := QryCli.FieldByName('RagioneSociale').AsString;
    end;
    QryCli.Close;
  finally
    QryCli.Free;
  end;
end;

procedure TPraticaForm.QryPratAppMATRICOLAChange(Sender: TField);
begin
  // Verifica che non si sia inserito un apparecchio più volte
  ControlloMatricolaApparecchioEsistente;
end;

procedure TPraticaForm.QryPratAppCOLLCODICEChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale FROM Clienti WHERE Codice = ' + QryPratAppCOLLCODICE.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      QryPratAppCOLLRAGSOC.Value := QryCli.FieldByName('RagioneSociale').AsString;
    end;
    QryCli.Close;
  finally
    QryCli.Free;
  end;
end;

procedure TPraticaForm.GenCal_BtnSelezInstallatoreClick(Sender: TObject);
begin
  // Altrimenti alcune volde dava errore
  if QryPratApp.State = dsBrowse then
    QryPratApp.Edit;
  // Esegue la selezione del cliente
  DM1.SelezionaCliente(QryPratAppINSTCODICE, nil, nil, '');
end;

procedure TPraticaForm.GenCal_BtnSelezCollaudatoreClick(Sender: TObject);
begin
  // Altrimenti alcune volde dava errore
  if QryPratApp.State = dsBrowse then
    QryPratApp.Edit;
  // Esegue la selezione del cliente
  DM1.SelezionaCliente(QryPratAppCOLLCODICE, nil, nil, '');
end;

procedure TPraticaForm.GenCal_BtnApriInstallatoreClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratAppINSTCODICE.Value);
end;

procedure TPraticaForm.GenCal_BtnApriCollaudatoreClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(QryPratAppCOLLCODICE.Value);
end;

// Procedura che carica la descrizione dell'apparecchio al quale l'apparecchio attuale è abbinato.
procedure TPraticaForm.CaricaDescrizioneApparecchioAbbinato;
var
  Qry: TIB_Cursor;
  TmpStr: String;
  IDApp: String;
begin
  // INizializzazione
  TmpStr := '';
  IDApp := '';
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Esegue la query solo se l'IDAPPABBONATO <> NULL
    if (not QryPratAppIDAPPABBINATO.IsNull) and (QryPratAppIDAPPABBINATO.AsInteger <> 0) then
    begin
      // Ricava l'ID dell'apparecchio al quale l'apparecchio
      // attuale è abbinato
      IDApp := QryPratAppIDAPPABBINATO.AsString;
      // Imposta la query che preleva i dati dell'apparecchio da visualizzare e la apre
      Qry.SQL.Add
        ('SELECT CAST(PA.COSTRUTTORE || '' '' || PA.MODELLO || ''      (Matricola: '' || PA.MATRICOLA || '')'' || ''      {ID: '' || PA.ID || ''}''         AS VARCHAR(200)) AS DESCAPPABBINATO');
      Qry.SQL.Add('FROM PRATAPPARECCHI PA WHERE PA.ID = ' + IDApp);
      Qry.Open;
      // Carica il dato sulla stringa temporanea per comodità
      TmpStr := Qry.Fields[0].AsString;
      // Chiude la query
      Qry.Close;
    end;
  finally
    // CArica i dati nei ComboBox relativi
    Bruc_AbbinatoApparecchio.Text := TmpStr;
    UnInt_AbbinatoApparecchio.Text := TmpStr;
    // Distrugge la query
    Qry.Free;
  end;
end;

procedure TPraticaForm.Bruc_AbbinatoApparecchioPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  TmpStr: String;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT ID, COSTRUTTORE, MODELLO, MATRICOLA FROM PRATAPPARECCHI PA WHERE');

    // Se la pratica non è ancora stata confermata per la prima volta IDPRATICA = 0
    if QryPratID.IsNull then
      Qry.SQL.Add('    PA.IDPRATICA = 0')
    else
      Qry.SQL.Add('    PA.IDPRATICA = ' + QryPratID.AsString);

    Qry.SQL.Add('AND PA.TIPOAPPARECCHIO = ' + QuotedStr('Generatore di calore'));
    Qry.Open;
    (Sender as TcxComboBox).Properties.Items.Clear;
    (Sender as TcxComboBox).Properties.Items.Add('');
    while not Qry.Eof do
    begin
      // Costruisce su TmpStr la stringa dei dati dell'apparecchio
      TmpStr := Qry.FieldByName('COSTRUTTORE').AsString + ' ' + Qry.FieldByName('MODELLO').AsString + '      (Matricola: ' + Qry.FieldByName('MATRICOLA')
        .AsString + ')';
      // Gli aggiunge l'ID all'estrema destra
      TmpStr := TmpStr + '      {ID: ' + Qry.FieldByName('ID').AsString + '}';
      // Aggiunge l'apparecchio al ComboBox
      (Sender as TcxComboBox).Properties.Items.Add(TmpStr);
      // Passa al prossimo
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.QryPratAppIDAPPABBINATOChange(Sender: TField);
begin
  CaricaDescrizioneApparecchioAbbinato;
end;

procedure TPraticaForm.QryPratAppAfterScroll(DataSet: TDataSet);
begin
  // Caricamento descrizione eventuali apparecchio abbinato
  CaricaDescrizioneApparecchioAbbinato;
end;

procedure TPraticaForm.Bruc_AbbinatoApparecchioKeyPress(Sender: TObject; var Key: Char);
begin
  // NOn accetta input dalla tastiera
  Key := #0;
end;

procedure TPraticaForm.QryPratBeforePost(DataSet: TDataSet);
begin
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then
  begin
    DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_PRATICHE');
  end;
end;

function TPraticaForm.IntegerInArray(const Value: Integer; const ArrayOfInteger: array of Integer): Boolean;
var
  Loop: Integer;
  i: Integer;
begin
  Result := False;
  for i := 0 to Length(ArrayOfInteger) - 1 do
  begin
    if Value = ArrayOfInteger[i] then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TPraticaForm.QryPratAppCalcFields(DataSet: TDataSet);
var
  Abbinato: Boolean;
  i, Quanti, CurrentOrder1: Integer;
begin
  // Imposta i campi per l'ordinamento in modo che se un apparecchio è abbinato ad un altro
  // venga sempre messo vicino ma dopo l'apparecchio principale
  if QryPratAppIDAPPABBINATO.IsNull or (QryPratAppIDAPPABBINATO.AsInteger = 0) or (QryPratAppDISMESSO.AsString = 'T') then
  begin
    QryPratAppCOMPUTED_ORDER1.Value := QryPratAppID.Value;
    QryPratAppCOMPUTED_ORDER2.Value := 0;
    QryPratAppCOMPUTED_ABBINATO.Value := IntegerInArray(QryPratAppCOMPUTED_ORDER1.Value, ElencoAbbinatiPrincipali);
  end
  else
  begin
    QryPratAppCOMPUTED_ORDER1.Value := QryPratAppIDAPPABBINATO.Value;
    QryPratAppCOMPUTED_ORDER2.Value := QryPratAppID.Value;
    QryPratAppCOMPUTED_ABBINATO.Value := True;
  end;
  // Se però l'apparecchio è marcato come "Sostituito/Non più un uso"
  // allora non lo considera più come abbinato anche se eventualmente lo era
  // in modo da riuscire a mettere in fondo alla lista gli apparecchi sostituiti.
  if QryPratAppDISMESSO.AsString = 'T' then
    QryPratAppCOMPUTED_ABBINATO.Value := False;
  // Costruisce la descrizione completa dell'apparecchio da usare poi come riferimento
  // allapparecchio stesso
  QryPratAppCOMPUTED_APPARECCHIO_FULL.Value := Trim(QryPratAppCOSTRUTTORE.AsString + ' ' + QryPratAppMODELLO.AsString + ' (' + QryPratAppMATRICOLA.AsString +
    ') ' + QryPratAppUBICAZIONE.AsString);
end;

procedure TPraticaForm.Bruc_AbbinatoApparecchioPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  CurrCB: TcxComboBox;
  TmpStr: String;
  ID: Integer;
  Inizio, Fine: Integer;
begin
  // Inizializzazione
  CurrCB := (Sender as TcxComboBox);
  // Se il dataset non è in modalità di Editing o Insert esce subito.
  if not RxSpeedModifica.Down then
    Exit;
  // Carica il contenuto del combobox
  TmpStr := CurrCB.EditText;
  // Inizio e Fine contengono l'indice dei caratteri che indica l'inizio e la fine dell'ID
  Inizio := Pos('{', TmpStr) + 5;
  Fine := Pos('}', TmpStr);
  // Se non è in editing lo mette in editing
  if QryPratApp.State = dsBrowse then
    QryPratApp.Edit;
  // Se uno dei due non è stato trovato azzera il campo ed esce
  if (Inizio = 0) or (Fine = 0) then
  begin
    QryPratAppIDAPPABBINATO.Clear;
    Exit;
  end;
  // Carica in TmpStr solo la parte relativa all'ID dell'apparecchio
  TmpStr := Copy(TmpStr, Inizio, (Fine - Inizio));
  // Carica l'ID ottenuto nel campo
  QryPratAppIDAPPABBINATO.Value := StrToInt(TmpStr);
  // COnferma
  QryPratApp.Post;
end;

procedure TPraticaForm.UnInt_AbbinatoApparecchioPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  TmpStr: String;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT ID, COSTRUTTORE, MODELLO, MATRICOLA FROM PRATAPPARECCHI PA WHERE');

    // Se la pratica non è ancora stata confermata per la prima volta IDPRATICA = 0
    if QryPratID.IsNull then
      Qry.SQL.Add('    PA.IDPRATICA = 0')
    else
      Qry.SQL.Add('    PA.IDPRATICA = ' + QryPratID.AsString);

    Qry.SQL.Add('AND PA.TIPOAPPARECCHIO = ' + QuotedStr('Unità esterna'));
    Qry.Open;
    (Sender as TcxComboBox).Properties.Items.Clear;
    (Sender as TcxComboBox).Properties.Items.Add('');
    while not Qry.Eof do
    begin
      // Costruisce su TmpStr la stringa dei dati dell'apparecchio
      TmpStr := Qry.FieldByName('COSTRUTTORE').AsString + ' ' + Qry.FieldByName('MODELLO').AsString + '      (Matricola: ' + Qry.FieldByName('MATRICOLA')
        .AsString + ')';
      // Gli aggiunge l'ID all'estrema destra
      TmpStr := TmpStr + '      {ID: ' + Qry.FieldByName('ID').AsString + '}';
      // Aggiunge l'apparecchio al ComboBox
      (Sender as TcxComboBox).Properties.Items.Add(TmpStr);
      // Passa al prossimo
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.btvAppCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Column: TcxGridDBBandedColumn;
  R: TRect;
  DrawTextFlags, ShapeRectVertMiddle, ShapeRectLeft, ShapeRectRight: Integer;
  PrecBrushColor: TColor;
  BM: TBitmap;
begin
  ADone := True;
  // Inizializzazione
  Column := AViewInfo.Item as TcxGridDBBandedColumn;
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;
  // ACanvas.Font.Color  := clBlack;
  // Traccia anche il testo
  // NB: Un pò più a destra per la colonna TIPOAPPARECCHIO
  R := AViewInfo.TextAreaBounds;
  if Column.Index = btvAppTIPOAPPARECCHIO.Index then
    R.Left := R.Left + 13;
  // Determinazione dell'allineamento orizzontale da utilizzare
  if Column.Properties.Alignment.Horz = taLeftJustify then
    DrawTextFlags := cxAlignLeft
  else if Column.Properties.Alignment.Horz = taRightJustify then
    DrawTextFlags := cxAlignRight
  else if Column.Properties.Alignment.Horz = taCenter then
    DrawTextFlags := cxAlignHCenter;
  DrawTextFlags := DrawTextFlags or cxAlignVCenter;

  // Se si tratta di un apparecchio dismesso disegna lo sfondo di un colore più scuro
  if (not AViewInfo.GridRecord.Selected) and (not VarIsNull(AViewInfo.GridRecord.Values[btvAppDISMESSO.Index])) and
    (AViewInfo.GridRecord.Values[btvAppDISMESSO.Index] = 'T') then
  begin
    ACanvas.Brush.Color := $00D3D3D3;
    // Se invece è un rigo selezionato
  end
  else if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := btvApp.Styles.Selection.Color;
    // Altrimenti usa il colore del Background che è più chiaro e mi piace di più
  end
  else
  begin
    ACanvas.Brush.Color := btvApp.Styles.Background.Color;
  end;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  // ----------------------------------------------------------------------------
  // Memorizza il colore del Brish del Canvas per poi ripristinarlo (altrimenti cambiava)
  PrecBrushColor := ACanvas.Brush.Color;
  // Se è il primo apparecchio dismesso disegna una linea di separazione superiore
  if Dismesso_Primo(AViewInfo.GridRecord) then
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, btvApp.OptionsView.GridLineColor, btvApp.OptionsView.GridLineColor, [bTop], 1);
  // Ripristina il colore del brush del canvas
  ACanvas.Brush.Color := PrecBrushColor;
  // ----------------------------------------------------------------------------

  // Se non è un record abbinato oppure se non è la colonna del TIPOAPPARECCHIO
  // lo visualizza normalmente ed esce.
  if (Column.Index <> btvAppTIPOAPPARECCHIO.Index) or ((not Abbinato(AViewInfo.GridRecord)) and (not Dismesso(AViewInfo.GridRecord))) then
  begin
    // Traccia il testo
    ACanvas.DrawTexT(AViewInfo.Text, R, DrawTextFlags);
    // Esce
    Exit;
  end;

  // ----------------------------------------------------------------------------------------
  // Se è un rigo DISMESSO...
  // ----------------------------------------------------------------------------------------
  if Dismesso(AViewInfo.GridRecord) then
  begin
    // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
    BM := TBitmap.Create;
    try
      BM.Transparent := True;
      ImageList_PratApp.GetBitmap(0, BM);
      ACanvas.DrawImage(ImageList_PratApp, AViewInfo.Bounds.Left + 2, AViewInfo.Bounds.Top + 4, 0);
      // ACanvas.Draw(AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top + 1, BM);
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
  // TIPOAPPARECHIO e quindi provvede a rendere in grafica il legame tra i records abbinati.
  // ----------------------------------------------------------------------------------------
  // Calcola alcune misure
  ShapeRectLeft := AViewInfo.Bounds.Left + 5;
  ShapeRectRight := AViewInfo.Bounds.Left + 9;
  ShapeRectVertMiddle := Round((AViewInfo.Bounds.Bottom + AViewInfo.Bounds.Top) / 2);
  // IMposta il Canvas
  ACanvas.Pen.Color := $00999999;
  ACanvas.Pen.Width := 1;
  // DIsegna la lineetta orizzontale al centro del record
  ACanvas.MoveTo(ShapeRectRight, ShapeRectVertMiddle);
  ACanvas.LineTo(ShapeRectLeft, ShapeRectVertMiddle);
  // Se non è il primo dell'abbinamento disegna anche la lineetta
  // di raccordo con il record precedente
  if not Abbinato_Primo(AViewInfo.GridRecord) then
  begin
    ACanvas.LineTo(ShapeRectLeft, AViewInfo.Bounds.Top - 1);
  end;
  // Se non è l'ultimo dell'abbinamento disegna anche la lineetta
  // di raccordo con il record successivo
  if not Abbinato_Ultimo(AViewInfo.GridRecord) then
  begin
    ACanvas.LineTo(ShapeRectLeft, AViewInfo.Bounds.Bottom + 1);
  end;
  // Traccia anche il testo un pò più a destra
  ACanvas.DrawTexT(AViewInfo.Text, R, DrawTextFlags);

end;

// Function che ritorna True se il record ricevuto è in disuso
function TPraticaForm.Dismesso(CurrRecord: TcxCustomGridRecord): Boolean;
begin
  Result := (not VarIsNull(CurrRecord.Values[btvAppDISMESSO.Index])) and (CurrRecord.Values[btvAppDISMESSO.Index] = 'T');
end;

// Function che ritorna True se il record ricevuto è il primo di quelli in disuso
function TPraticaForm.Dismesso_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
var
  PrevRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Se l'apparecchio attuale non è in disuso ovviamente esce subito ritornando False
  if not Dismesso(CurrRecord) then
    Exit;
  // Se arriva qui significa che è un record in disuso e se è il primo record del Dataset è ovviamente anche il
  // primo record dei dismessi
  if CurrRecord.IsFirst then
  begin
    Result := True;
    Exit;
  end;
  // Se il record precedente (se esiste) non è dismesso sigifica che il record corrente è il primo dei dismessi.
  PrevRecord := CurrRecord.ViewData.Records[CurrRecord.Index - 1];
  Result := (VarIsNull(PrevRecord.Values[btvAppDISMESSO.Index])) or (PrevRecord.Values[btvAppDISMESSO.Index] <> 'T');
end;

// Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
// di un abbinamento.
// NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
// relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
procedure TPraticaForm.RefreshElencoAbbinatiPrincipali;
var
  PrecPos: TBookmark;
  Quanti: Integer;
begin
  SetLength(ElencoAbbinatiPrincipali, 0);
  QryPratApp.DisableControls;
  PrecPos := QryPratApp.GetBookmark;
  try
    QryPratApp.First;
    while not QryPratApp.Eof do
    begin
      if (QryPratAppIDAPPABBINATO.AsInteger <> 0) and (QryPratAppDISMESSO.AsString <> 'T') then
      begin
        Quanti := Length(ElencoAbbinatiPrincipali);
        SetLength(ElencoAbbinatiPrincipali, Quanti + 1);
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

// Function che ritorna True se il record ricevuto è in abbinamento ad un altro record.
function TPraticaForm.Abbinato(CurrRecord: TcxCustomGridRecord): Boolean;
var
  NextRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Prima di tutto controlla se il campo COMPUTED_ABBINATO = T significa che è abbinato
  // e quindi ritorna subito True ed esce
  // NB: IL campo è True se si tratta di un apparecchio tipo un bruciatore che ha il campo "Abbinato a" o similare
  // specificato. Se invece il record è quello del l'apparecchio principale il campo = False e quindi serve
  // un altro tipo di controllo
  if CurrRecord.Values[btvAppCOMPUTED_ABBINATO.Index] then
  begin
    Result := True;
    Exit;
  end;
  // Se il campo  COMPUTED_ABBINATO = False verifica se il record successivo è abbinato a quello corrente
  // nel qual caso ritorna True perchè è evidentemente abbinato al record successivo.
  // NB: Ovviamente se il record attuale è l'ultimo c'è poco da controllare.
  if CurrRecord.IsLast then
    Exit;
  NextRecord := CurrRecord.ViewData.Records[CurrRecord.Index + 1];
  Result := (CurrRecord.Values[btvAppCOMPUTED_ORDER1.Index] = NextRecord.Values[btvAppCOMPUTED_ORDER1.Index]);
end;

// Function che ritorna True se il record ricevuto è in abbinamento ad un altro record
// ed è il primo dei records abbinati.
function TPraticaForm.Abbinato_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
var
  PrevRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Se non è un record abbinato ritorna False ed esce subito
  // quindi se continua significa che è abbinato.
  if not Abbinato(CurrRecord) then
    Exit;
  // Se è il primo record in assoluto è evidentemente anche il primo
  // record tra i records abbinati e quindi...
  if CurrRecord.IsFirst then
  begin
    Result := True;
    Exit;
  end;
  // Altirmenti controlliamo il record precedente e se ha il
  // campo COMPUTED_ORD1 di valore diverso dal record attuale
  // significa che il record attuale è il primo dell'abbinamento.
  PrevRecord := CurrRecord.ViewData.Records[CurrRecord.Index - 1];
  Result := (CurrRecord.Values[btvAppCOMPUTED_ORDER1.Index] <> PrevRecord.Values[btvAppCOMPUTED_ORDER1.Index]);
end;

// Function che ritorna True se il record ricevuto è in abbinamento ad un altro record
// ed è il primo dei records abbinati.
function TPraticaForm.Abbinato_Ultimo(CurrRecord: TcxCustomGridRecord): Boolean;
var
  NextRecord: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := False;
  // Se non è un record abbinato ritorna False ed esce subito
  // quindi se continua significa che è abbinato.
  if not Abbinato(CurrRecord) then
    Exit;
  // Se è l'ultimo record in assoluto è evidentemente anche l'ultimo
  // record tra i records abbinati e quindi...
  if CurrRecord.IsLast then
  begin
    Result := True;
    Exit;
  end;
  // Altirmenti controlliamo il record successivo e se ha il
  // campo COMPUTED_ORD1 di valore diverso dal record attuale
  // significa che il record attuale l'ultimo dell'abbinamento.
  NextRecord := CurrRecord.ViewData.Records[CurrRecord.Index + 1];
  Result := (CurrRecord.Values[btvAppCOMPUTED_ORDER1.Index] <> NextRecord.Values[btvAppCOMPUTED_ORDER1.Index]);
end;

procedure TPraticaForm.QryPratAppAfterOpen(DataSet: TDataSet);
begin
  // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
  // di un abbinamento.
  // NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
  // relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
  RefreshElencoAbbinatiPrincipali;
end;

procedure TPraticaForm.QryPratAppAfterPost(DataSet: TDataSet);
begin
  // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
  // di un abbinamento.
  // NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
  // relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
  RefreshElencoAbbinatiPrincipali;
end;

procedure TPraticaForm.QryPratAppAfterRefresh(DataSet: TDataSet);
begin
  // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
  // di un abbinamento.
  // NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
  // relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
  RefreshElencoAbbinatiPrincipali;
end;

procedure TPraticaForm.QryPratAppAfterDelete(DataSet: TDataSet);
begin
  // Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
  // di un abbinamento.
  // NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
  // relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
  RefreshElencoAbbinatiPrincipali;
  // Refresh delle Operazioni pianificate
  OP_OpenOrRefresh;
end;

procedure TPraticaForm.btvAppDISMESSOGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: String);
begin
  // FAccio così perchè se il campo era nullo mi si ordinava male.
  if AText <> 'T' then
    AText := 'F';
end;

procedure TPraticaForm.GenCal_CheckSostituitoPropertiesEditValueChanged(Sender: TObject);
begin
  with (Sender as TcxDBCheckBox).DataBinding.DataSource.DataSet do
  begin
    // Così si aggiorna subito lo schermo.
    if (State = dsInsert) or (State = dsEdit) then
      Post;
  end;
end;

procedure TPraticaForm.QryOPBeforePost(DataSet: TDataSet);
begin
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then
  begin
    DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_OPPRATICA');
  end;
  // IMposta l'ID della pratica nel rigo attuale
  DataSet.FieldByName('IDPRATICA').AsInteger := QryPratID.AsInteger;
end;

procedure TPraticaForm.btvOPULTIMAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
begin
  // Se il campo è 0 restituisce una stringa vuota altrimenti
  // mi visualizzava una data del 1899 perchè il valore del campo
  // Datetime = 0
  if (VarIsNull(ARecord.Values[Sender.Index])) or (ARecord.Values[Sender.Index] = 0) then
    AText := '';
end;

procedure TPraticaForm.FormResize(Sender: TObject);
begin
  // IMposta la posizione della client area e i relativi margini
  MainForm.CalcolaDimensioniClientAreaChildForm(Self, FormMainPanel, False);
  // Posizione Anagrafica Pratica
  ClientAreaPratica.Left := Trunc((TabPratica.ClientWidth - ClientAreaPratica.Width) / 2);
  if ClientAreaPratica.Left < 0 then
    ClientAreaPratica.Left := 0;
  // Posizione Anagrafica Impianyo
  ClientAreaImpianto.Left := Trunc((TabImpianto.ClientWidth - ClientAreaImpianto.Width) / 2);
  if ClientAreaImpianto.Left < 0 then
    ClientAreaImpianto.Left := 0;
  // Posizione Dati impianto
  PageControlApparecchiImpianto.Left := Trunc((PanelApparecchiImpianto.ClientWidth - PageControlApparecchiImpianto.Width) / 2) - 1;
  if PageControlApparecchiImpianto.Left < 0 then
    PageControlApparecchiImpianto.Left := 0;
  // Posizione Parametri stampa foglio di lavoro
  ClientAreaParametri.Left := Trunc((TabParametri.ClientWidth - ClientAreaParametri.Width) / 2);
  if ClientAreaParametri.Left < 0 then
    ClientAreaParametri.Left := 0;
end;

procedure TPraticaForm.MainPageControlChange(Sender: TObject);
var
  TmpStr: String;
begin
  RxSpeedButtonNuovo.Enabled := ((MainPageControl.ActivePage = TabApparecchi) or (MainPageControl.ActivePage = TabOP)) and RxSpeedModifica.Down;
  RxSpeedButtonElimina.Enabled := ((MainPageControl.ActivePage = TabApparecchi) or (MainPageControl.ActivePage = TabOP)) and RxSpeedModifica.Down;
  RxSpeedButtonStampa.Enabled := (MainPageControl.ActivePage = TabMappa) and not RxSpeedModifica.Down;

  // ===========================================================================
  // VISUALIZZAZIONE MAPPA
  // ---------------------------------------------------------------------------
  // Se siamo nella pagina della mappa crea l'apposita form all'interno del Tab
  // NB: Ovviamente se non esiste già
  if (MainPageControl.ActivePage = TabMappa) and not Assigned(MapForm) then
  begin
    // Crea la form della mappa
    MapForm := GMap_CreateInParent(TabMappa);
    // Show della form della mappa
    MapForm.Show;
    // IMposta l'indirizzo da ricercare
    // NB: IN base a se è pratica o impianto...
    // Se è impianto
    if QryPratTIPO.AsString = 'A' then
    begin
      // Visualizza la mappa
      MapForm.CreaMappa(QryPratPROVINCIAIMM.AsString, QryPratCOMUNEIMM.AsString, QryPratCAPIMM.AsString, QryPratINDIRIZZOIMM.AsString,
        QryPratNUMCIVICOIMM.AsString);
      // Se è pratica
    end
    else if QryPratTIPO.AsString = 'P' then
    begin
      // Visualizza la mappa
      MapForm.CreaMappa(QryPratIMMOBPROVINCIA.AsString, QryPratIMMOBLOCALITA.AsString, QryPratIMMOBCAP.AsString, QryPratIMMOBINDIRIZZO.AsString,
        QryPratIMMOBNUMCIVICO.AsString);
    end;
  end;
  // ===========================================================================

end;

procedure TPraticaForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then
  begin
    fAllegatiForm.Free;
  end;
end;

// Procedure che ricalcola la data di scadenza della garanzia
procedure TPraticaForm.RicalcolaScadenzaGaranziaApparecchio;
var
  Mesi: Integer;
  DataIniziale: TDateTime;
  DataScadenza: TDateTime;
begin
  // Ricava i mesi di durata della garanzia e se non sono stati indicati esce subito
  Mesi := QryPratAppGARANZIA_MESI.AsInteger + QryPratAppGARANZIA_MESI_ESTENSIONE.AsInteger;
  if Mesi = 0 then
    Exit;
  // Se non è indicato da quale data far partire il conteggio per il calcolo della scadenza di garanzia esce subito.
  if QryPratAppGARANZIA_APARTIREDA.IsNull then
    Exit;
  // Ricava la data dalla quale calcolare la scadenza di garanzia e se è nulla esce
  if QryPratAppGARANZIA_APARTIREDA.AsString = 'Installazione' then
  begin
    if QryPratAppDATAINSTALLAZIONE.IsNull then
      Exit;
    DataIniziale := QryPratAppDATAINSTALLAZIONE.AsDateTime;
  end
  else
  begin
    if QryPratAppDATACOLLAUDO.IsNull then
      Exit;
    DataIniziale := QryPratAppDATACOLLAUDO.AsDateTime;
  end;
  // Calcola la data di scadenza della garanzia
  DataScadenza := IncMonth(DataIniziale, Mesi);
  DataScadenza := IncDay(DataScadenza, (-1));
  // Assegna il risultato al campo
  QryPratAppGARANZIA_SCADENZA.Value := DataScadenza;
end;

procedure TPraticaForm.QryPratAppGARANZIA_MESIChange(Sender: TField);
begin
  RicalcolaScadenzaGaranziaApparecchio;
end;

procedure TPraticaForm.GenCal_Garanzia_MesiPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(GARANZIA_MESI) FROM PRATAPPARECCHI WHERE GARANZIA_MESI IS NOT NULL ORDER BY 1');
    Qry.Open;
    (Sender as TcxDBComboBox).Properties.Items.Clear;
    (Sender as TcxDBComboBox).Properties.Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TcxDBComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.GenCal_Garanzia_Mesi_estensionePropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(GARANZIA_MESI_ESTENSIONE) FROM PRATAPPARECCHI WHERE GARANZIA_MESI_ESTENSIONE IS NOT NULL ORDER BY 1');
    Qry.Open;
    (Sender as TcxDBComboBox).Properties.Items.Clear;
    (Sender as TcxDBComboBox).Properties.Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TcxDBComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.Contratto_ImportoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ',';
end;

procedure TPraticaForm.Contratto_TipoPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  FieldName: String;
begin
  // Ricava il FieldName
  FieldName := (Sender as TcxDBComboBox).DataBinding.Field.FieldName;
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(' + FieldName + ') FROM PRATICHE WHERE ' + FieldName + ' IS NOT NULL ORDER BY 1');
    Qry.Open;
    (Sender as TcxDBComboBox).Properties.Items.Clear;
    (Sender as TcxDBComboBox).Properties.Items.Add('');
    while not Qry.Eof do
    begin
      (Sender as TcxDBComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.QryPratCONTRATTO_MESIChange(Sender: TField);
begin
  // Se non sono ancora stati inseriti i dati necessari esce subito
  if QryPratCONTRATTO_MESI.IsNull or QryPratCONTRATTO_VALIDITA_INIZIO.IsNull then
    Exit;
  // Ricalcola la data di scadenza in base ai dati inseriti.
  QryPratCONTRATTO_VALIDITA_FINE.Value := IncDay(IncMonth(QryPratCONTRATTO_VALIDITA_INIZIO.AsDateTime, QryPratCONTRATTO_MESI.AsInteger), (-1));
end;

procedure TPraticaForm.MainPageControlPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  // Se stiamo uscendo dalla pagina degli apparecchi e il Dataset degli apparecchi
  // è in insert oppure in Edit esegue il post automatico altrimenti non si aggiorna
  // bene l'elenco delle OP con i dati dell'apparecchio appena inserito/modificato
  if (MainPageControl.ActivePage = TabApparecchi) and ((QryPratApp.State = dsInsert) or (QryPratApp.State = dsEdit)) then
  begin
    QryPratApp.Post;
  end;
end;

procedure TPraticaForm.btvOPCustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
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
  if AViewInfo.Selected then
    CurrColor := Sender.Styles.Selection.Color
  else
    CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  // NB: Se questo group è generale per l'impianto e cioè non specifico di qualche
  // apparecchio...
  DMStyles.DrawGradient(ACanvas.Canvas, AViewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Se questo grup non è relativo a nessun apparecchio lo disegna diverso
  if VarIsNull(AViewInfo.GridRecord.Values[btvOPIDAPPARECCHIOPRAT.Index]) or (AViewInfo.GridRecord.Values[btvOPIDAPPARECCHIOPRAT.Index] = 0) then
  begin
    TmpStr := 'Generiche per tutto l''impianto';
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignHCenter or cxAlignBottom);
    Exit;
  end;

  // Tipo apparecchio
  TmpStr := '   ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvOPTIPOAPPARECCHIO.Index] + ':';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Apparecchio
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvOPCOSTRUTTORE.Index] + '   ' + Sender.DataController.DisplayTexts
    [AViewInfo.GridRecord.RecordIndex, btvOPMODELLO.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO + SPAZIO;
  // Label Matricola
  TmpStr := 'Matricola:';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Matricola
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvOPMATRICOLA.Index];
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
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvOPUBICAZIONE.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
end;

procedure TPraticaForm.RxSpeedButtonStampaClick(Sender: TObject);
begin
  if MainPageControl.ActivePage = TabMappa then
  begin
    MapForm.PrintPreview;
  end;
end;

procedure TPraticaForm.RxSpeedButtonStampaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    if MainPageControl.ActivePage = TabMappa then
    begin
      MapForm.PrintPreview;
    end;
  end;
end;

// Pricedure che copia, se abilitato, l'agente nella descrizione della pratica stessa
procedure TPraticaForm.CopiaAgenteInDescrizionePratica;
var
  TmpStr, DescPrat: String;
begin
  // Inizializzazione
  DescPrat := '';
  // Agente1
  if vCopiaAgente1PratToDescrizione then
  begin
    TmpStr := Trim(QryPratAGENTE.AsString);
    if (TmpStr <> '') and (DescPrat <> '') then
      DescPrat := DescPrat + ' - ';
    DescPrat := DescPrat + TmpStr;
  end;
  // Agente2
  if vCopiaAgente2PratToDescrizione then
  begin
    TmpStr := Trim(QryPratAGENTE2.AsString);
    if (TmpStr <> '') and (DescPrat <> '') then
      DescPrat := DescPrat + ' - ';
    DescPrat := DescPrat + TmpStr;
  end;
  // Agente3
  if vCopiaAgente3PratToDescrizione then
  begin
    TmpStr := Trim(QryPratAGENTE3.AsString);
    if (TmpStr <> '') and (DescPrat <> '') then
      DescPrat := DescPrat + ' - ';
    DescPrat := DescPrat + TmpStr;
  end;
  // Agente4
  if vCopiaAgente4PratToDescrizione then
  begin
    TmpStr := Trim(QryPratAGENTE4.AsString);
    if (TmpStr <> '') and (DescPrat <> '') then
      DescPrat := DescPrat + ' - ';
    DescPrat := DescPrat + TmpStr;
  end;
  // Imposta la descrizione della pratica
  QryPratDESCRIZIONE.Value := DescPrat;
end;

procedure TPraticaForm.QryPratAGENTEChange(Sender: TField);
begin
  // Se è abilitata la copia automatica dell'Agente nella descrizione della pratica...
  if vCopiaAgente1PratToDescrizione then
    CopiaAgenteInDescrizionePratica;
end;

procedure TPraticaForm.QryPratAGENTE2Change(Sender: TField);
begin
  // Se è abilitata la copia automatica dell'Agente nella descrizione della pratica...
  if vCopiaAgente2PratToDescrizione then
    CopiaAgenteInDescrizionePratica;
end;

procedure TPraticaForm.QryPratAGENTE3Change(Sender: TField);
begin
  // Se è abilitata la copia automatica dell'Agente nella descrizione della pratica...
  if vCopiaAgente3PratToDescrizione then
    CopiaAgenteInDescrizionePratica;
end;

procedure TPraticaForm.QryPratAGENTE4Change(Sender: TField);
begin
  // Se è abilitata la copia automatica dell'Agente nella descrizione della pratica...
  if vCopiaAgente4PratToDescrizione then
    CopiaAgenteInDescrizionePratica;
end;

procedure TPraticaForm.GenCal_ModelloChange(Sender: TObject);
var
  Qry: TIB_Cursor;
  CurrMarca, CurrModello, CurrFieldName: String;
  CurrComboBox: TDBComboBox;
  i: Integer;
begin
  // CurrComboBox punta al campo MARCA o MODELLO se si tratta di uno di questi due altrimenti esce
  if not(Sender is TDBComboBox) then
    Exit;
  CurrComboBox := Sender as TDBComboBox;
  // Solo se il focus è su un campo relativo a MARCA o MODELLO altrimenti l'evento viene richiamato
  // anche quando viene fatto lo show della form.
  if not CurrComboBox.Focused then
    Exit;
  // Se il ComboBox è relativo a uno dei due campi interessati ne carica il valore nell'apposita variabile mentre
  // l'altro valore che ci interessa lo prende dal DataSet altrimenti se li prende entrambi dal dataset quello su cui c'è
  // il focus è che ha appena cambiato il suo valore potrebbe contenere un valore vecchio perchè non ancora postato.
  // NB: Se il focus è su un altro campo esce subito.
  if CurrComboBox.Field.FieldName = 'COSTRUTTORE' then
  begin
    CurrMarca := CurrComboBox.Text;
    CurrModello := QryPratAppMODELLO.AsString;
  end
  else if CurrComboBox.Field.FieldName = 'MODELLO' then
  begin
    CurrMarca := QryPratAppCOSTRUTTORE.AsString;
    CurrModello := CurrComboBox.Text;
  end
  else
    Exit;
  // Sia la Marca che il Modello devono essere valorizzati altrimenti esce
  if (Trim(CurrMarca) = '') or (Trim(CurrModello) = '') then
    Exit;
  // Se ha superato tutti i controlli precedenti costruisce la query per
  // rimediare i dati di eventuali inserimenti precedenti dello stesso apparecchio
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT FIRST 1 PA.* FROM PRATAPPARECCHI PA WHERE');
    Qry.SQL.Add(' PA.COSTRUTTORE = ' + QuotedStr(CurrMarca));
    Qry.SQL.Add(' AND PA.MODELLO = ' + QuotedStr(CurrModello));
    Qry.SQL.Add(' AND PA.TIPOAPPARECCHIO = ' + QuotedStr(QryPratAppTIPOAPPARECCHIO.AsString));
    Qry.SQL.Add('ORDER BY PA.ID DESC');
    Qry.Open;
    // Se non ha trovato nulla esce
    if Qry.Eof then
      Exit;
    // Altrimenti cicla per tutti i campi tranne quelli che devono essere
    // espressamente esclusi e assegna il loro valore all'apparecchio corrente
    // NB: Uso il metodo delle esclusioni perchè così se aggiungo un campo non devo
    // preoccuparmi di aggiungerlo in questa funzione/procedura
    for i := 0 to Qry.FieldCount - 1 do
    begin
      // CurrFieldName contiene il nome del campo corrente
      CurrFieldName := Qry.Fields[i].FieldName;
      // Se è uno dei campi da escludere salta al prossimo
      if (CurrFieldName = 'ID') or (CurrFieldName = 'IDPRATICA') or (CurrFieldName = 'TIPOIMPIANTO') or (CurrFieldName = 'TIPOAPPARECCHIO') or
        (CurrFieldName = 'COSTRUTTORE') or (CurrFieldName = 'MODELLO') or (CurrFieldName = 'MATRICOLA') or (CurrFieldName = 'UBICAZIONE') or
        (CurrFieldName = 'DATAINSTALLAZIONE') or (CurrFieldName = 'INSTCODICE') or (CurrFieldName = 'INSTRAGSOC') or (CurrFieldName = 'DATACOLLAUDO') or
        (CurrFieldName = 'COLLCODICE') or (CurrFieldName = 'COLLRAGSOC') or (CurrFieldName = 'DISMESSO') or (CurrFieldName = 'DISMESSO_NOTE') or
        (CurrFieldName = 'DISMESSO_DATA') or (CurrFieldName = 'IDAPPABBINATO') or (CurrFieldName = 'CODICECATASTO') or
        (CurrFieldName = 'GARANZIA_MESI_ESTENSIONE') or (CurrFieldName = 'GARANZIA_SCADENZA') then
        Continue;
      // Se invece il campo corrente non è tra quelli da escludere da questa elaborazione lo assegna
      // allo stesso campo del record corrente
      if Qry.Fields[i].IsNull then
        QryPratApp.FieldByName(CurrFieldName).Clear
      else
        QryPratApp.FieldByName(CurrFieldName).Value := Qry.Fields[i].Value;
    end;
  finally
    // Pulizie finali
    Qry.Free;
  end;
end;

procedure TPraticaForm.dbeAgentePropertiesEditValueChanged(Sender: TObject);
begin
  // Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  // che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryPrat.State = dsEdit) or (QryPrat.State = dsInsert) then
    DM1.AgenteChanged(1, dbeAgente2);
end;

procedure TPraticaForm.dbeAgente2PropertiesEditValueChanged(Sender: TObject);
begin
  // Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  // che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryPrat.State = dsEdit) or (QryPrat.State = dsInsert) then
    DM1.AgenteChanged(2, dbeAgente3);
end;

procedure TPraticaForm.dbeAgente3PropertiesEditValueChanged(Sender: TObject);
begin
  // Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  // che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryPrat.State = dsEdit) or (QryPrat.State = dsInsert) then
    DM1.AgenteChanged(3, dbeAgente4);
end;

procedure TPraticaForm.dbeAgentePropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente.Properties.Items, 1, '');
end;

procedure TPraticaForm.dbeAgente2PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente2.Properties.Items, 2, dbeAgente.Text);
end;

procedure TPraticaForm.dbeAgente3PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente3.Properties.Items, 3, dbeAgente2.Text);
end;

procedure TPraticaForm.dbeAgente4PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente4.Properties.Items, 4, dbeAgente3.Text);
end;

function TPraticaForm.GetParamRappIntPredefiniti: Boolean;
begin
  Result := Prm_FL_Predefiniti.Checked;
end;

procedure TPraticaForm.SetParamRappIntPredefiniti(const Value: Boolean);
begin
  Prm_FL_LabelCopie.Enabled := not Value;
  Prm_FL_Copie.Enabled := not Value;
  Prm_FL_LabelApparecchi.Enabled := not Value;
  Prm_FL_Apparecchi.Enabled := not Value;
  Prm_FL_FogliLavoroSeparati.Enabled := not Value;
  Prm_FL_OP.Enabled := not Value;
  Prm_FL_OP_DAFARE.Enabled := not Value;
  Prm_FL_Precedenti.Enabled := not Value;
  Prm_FL_LabelPrecedentiUltimi.Enabled := not Value;
  Prm_FL_PrecedentiUltimi.Enabled := not Value;
  Prm_FL_RappInt.Enabled := not Value;
  Prm_FL_RappIntPezzi.Enabled := not Value;
  Prm_FL_RappIntSpese.Enabled := not Value;
  Prm_FL_Firme.Enabled := not Value;
end;

procedure TPraticaForm.Prm_FL_PredefinitiClick(Sender: TObject);
begin
  ParamRappIntPredefiniti := (Sender as TDBCheckBox).Checked;
end;

procedure TPraticaForm.Genericaperlimpianto1Click(Sender: TObject);
begin
  // Visualizza la form per la selezione di una nuova operazione pianificata da
  // aggiungere all'impianto.
  DM1.Attendere;
  try
    Application.CreateForm(TOperazioniPianificateForm, OperazioniPianificateForm);
    OperazioniPianificateForm.Parent := MainForm;
    OperazioniPianificateForm.DblClickMode := DblClickModeSelection;
    OperazioniPianificateForm.CallerCode := 1;
    // Se la proprietà Tag <> 0 significa che si è cliccato scegliendo di aggiungere
    // l'OP ad un apparecchio specifico e siccome quando creo le MenuItems del sottomenù aposito
    // metto l'ID dell'apparecchio nella proprietà Tag...
    if (Sender as TMenuItem).Tag > 0 then
      OperazioniPianificateForm.IdApparecchio := (Sender as TMenuItem).Tag;
    // IN base al tipo di impianto filtra solo le operazioni pianificate pertinenti
    OperazioniPianificateForm.CampoPerFiltroSelezione := QryPratTIPOIMPIANTO.AsString;
    // Visualizza la form a video
    OperazioniPianificateForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TPraticaForm.CaricaSubMenuNuovaOP;
var
  NewMenuItem: TMenuItem;
  i: Integer;
  DC: TcxCustomDataController;
begin
  // Inizializzazione
  DC := btvApp.DataController;
  Specificaperapparecchio1.Clear;
  // Cicla per tutti gli apparecchi dell'impianto
  for i := 0 to DC.RecordCount - 1 do
  begin
    // Se è unrigo di raggruppamento oppure un apparecchio dismesso passa al successivo
    if (DC.DisplayTexts[i, btvAppDISMESSO.Index] = 'T') then
      Continue;
    // Crea la nuova MenùItem per l'apparecchio attuale
    NewMenuItem := TMenuItem.Create(Self);
    NewMenuItem.Tag := DC.Values[i, btvAppID.Index];
    NewMenuItem.Caption := DC.DisplayTexts[i, btvAppCOMPUTED_APPARECCHIO_FULL.Index];
    NewMenuItem.OnClick := Genericaperlimpianto1Click;
    Specificaperapparecchio1.Add(NewMenuItem);
  end;
end;

procedure TPraticaForm.MenuNuovaOPPopup(Sender: TObject);
begin
  CaricaSubMenuNuovaOP;
end;

procedure TPraticaForm.btvPrescDataControllerDataChanged(Sender: TObject);
begin
  RefreshTabPrescrizioni;
end;

procedure TPraticaForm.btvPrescEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  AAllow := (AItem.Index = btvPrescRISOLTO.Index) and (RxSpeedModifica.Down);
end;

procedure TPraticaForm.MarcaPrescrizioniComeFatte;
var
  DC: TcxCustomDataController;
  i: Integer;
  TipoRecord: String;
begin
  // Se l'anagrafica è stata chiamata da dentro un documento non fa nulla
  if FromDocument then
    Exit;
  // Inizializzazione
  DC := btvPresc.DataController;
  // CIcla per tutti i record
  for i := 0 to DC.RecordCount - 1 do
  begin
    // Se la prescrizione/raccomandazione attuale è stata selesionata dall'utente
    // come fatta/risolta provvede a marcarca altrimenti la salta
    if (not VarIsNull(DC.Values[i, btvPrescRISOLTO.Index])) and (DC.Values[i, btvPrescRISOLTO.Index] = True) then
    begin
      // Carica il Tipo record del record attuale
      TipoRecord := DC.Values[i, btvPrescTIPORECORD.Index];
      // Se è una raccomandazione di un impegno
      if TipoRecord = '10-RACCOMANDAZIONI INT.' then
        DM2.RaccomandazioniImpegno_MarcaComeFatta(DC.Values[i, btvPrescIDIMPEGNO.Index], DC.Values[i, btvPrescFATTO_DATA.Index],
          DC.DisplayTexts[i, btvPrescFATTO_NOTE.Index])
        // Se è una prescrizione di un impegno
      else if TipoRecord = '20-PRESCRIZIONI INT.' then
        DM2.PrescrizioniImpegno_MarcaComeFatta(DC.Values[i, btvPrescIDIMPEGNO.Index], DC.Values[i, btvPrescFATTO_DATA.Index],
          DC.DisplayTexts[i, btvPrescFATTO_NOTE.Index])
        // Se è una raccomandazione di un allegato
      else if TipoRecord = '30-RACCOMANDAZIONI ALL' then
        DM2.RaccomandazioniAllegato_MarcaComeFatta(DC.Values[i, btvPrescIDALLEGATO.Index], DC.Values[i, btvPrescFATTO_DATA.Index],
          DC.DisplayTexts[i, btvPrescFATTO_NOTE.Index])
        // Se è una prescrizione di un allegato
      else if TipoRecord = '40-PRESCRIZIONI ALL' then
        DM2.PrescrizioniAllegato_MarcaComeFatta(DC.Values[i, btvPrescIDALLEGATO.Index], DC.Values[i, btvPrescFATTO_DATA.Index],
          DC.DisplayTexts[i, btvPrescFATTO_NOTE.Index]);
    end;
  end;
end;

procedure TPraticaForm.btvPrescCODICECustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
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
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrescCODICE.Index] + ' del';
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := clGray;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Data
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrescDATADOC.Index];
  // ACanvas.Font.Style := [fsBold];
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
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrescTECNICO_NOME.Index];
  // ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Le prossime a DX
  R.Right := R.Right - 5;
  // Apparecchio
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrescIDAPPARECCHIOPRAT.Index];
  // ACanvas.Font.Style := [fsBold];
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

procedure TPraticaForm.btvPrescDESCRIZIONECustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ADone := True;
  // Grassetto in ogni caso
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [fsBold];
  // Se è una prescrizione scrive in rosso
  if Pos('PRESCRIZIONI', AViewInfo.GridRecord.DisplayTexts[btvPrescTIPORECORD.Index]) <> 0 then
  begin
    ACanvas.Font.Color := clRed;
  end;
  // Imposta i parametri e traccia il contenuto della cella
  AViewInfo.EditViewInfo.Font := ACanvas.Font;
  AViewInfo.EditViewInfo.TextColor := ACanvas.Font.Color;
  AViewInfo.EditViewInfo.BackgroundColor := Sender.Styles.Content.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Disegna la riga di separazione inferione
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor,
    TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TPraticaForm.btvPrescRISOLTOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ADone := True;
  // Lo sfondo è fisso e non fa vedere la selezione
  AViewInfo.EditViewInfo.BackgroundColor := AViewInfo.Item.Styles.Content.Color;
  // Imposta i parametri e traccia il contenuto della cella
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Disegna la riga di separazione inferione
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor,
    TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TPraticaForm.btvPrecIntAPPARECCHIO_FULLGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if Trim(AText) = '()' then
    AText := '';
end;

procedure TPraticaForm.btvPrecIntCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  Column: TcxGridDBBandedColumn;
  R: TRect;
  DrawTextFlags: Integer;
  PrecBrushColor: TColor;
begin
  // Inizializzazione
  ADone := True;
  Column := AViewInfo.Item as TcxGridDBBandedColumn;
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Color := clBlack;

  // Se è una riga di Operazioni pianificate...
  if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '20-OPERAZIONE PIANIFICATA') then
  begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Color := clGray;
    // Se è una riga di Analisi Fumi
  end
  else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '15-ANALISI FUMI ALLEGATO') then
  begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Color := clGray;
    // Se è una riga di Relazione Intervento
  end
  else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '10-RELAZIONE INTERVENTO') then
  begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Color := clBlack;
    // Se è una riga di Osservazioni
  end
  else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '40-OSSERVAZIONI ALLEGATO') then
  begin
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Color := clBlack;
    ACanvas.Brush.Color := $00EFEFEF;
  end;

  // Se è la colonna del prezzo unitario oppure della Qtà...
  if (AViewInfo.Item.Index = btvPrecIntCALC_PRZUNITNETTO.Index) or (AViewInfo.Item.Index = btvPrecIntQTA.Index) then
  begin
    ACanvas.Font.Color := clGray;
    ACanvas.Font.Style := [];
  end;

  // Imposta i parametri e traccia il contenuto della cella
  AViewInfo.EditViewInfo.Font := ACanvas.Font;
  AViewInfo.EditViewInfo.TextColor := ACanvas.Font.Color;
  AViewInfo.EditViewInfo.BackgroundColor := ACanvas.Brush.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas); // Paint the default cell's contents

  // Se è l'ultima riga prima di un cambio apparecchio disegna una linea di separazione
  // NB: Se c'è un solo apparecchio non traccia la linea di separazione (potrebero esserci
  // alcune OP generiche per l'impianto e altre specifiche per apparecchio).
  if (not AViewInfo.GridRecord.IsLast) and (AViewInfo.GridRecord.DisplayTexts[btvPrecIntIDAPPARECCHIOPRAT.Index] <> Sender.DataController.DisplayTexts
    [AViewInfo.GridRecord.RecordIndex + 1, btvPrecIntIDAPPARECCHIOPRAT.Index]) and
    (AViewInfo.GridRecord.DisplayTexts[btvPrecIntMASTER_ID.Index] = Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex + 1,
    btvPrecIntMASTER_ID.Index]) then
  begin
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor,
      TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
  end;
end;

procedure TPraticaForm.btvPrecIntCustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
  var ADone: Boolean);
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
  if AViewInfo.Selected then
    CurrColor := Sender.Styles.Selection.Color
  else
    CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AViewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;
  // Rif. + TipoDocumento
  TmpStr := '   Rif. ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrecIntTIPODOC.Index] + ' del ';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Data documento
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrecIntDATADOC.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;

  // Riferimento a Ricevuta Fiscale o altro documento
  if (Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrecIntRIFDOC_NUM.Index] <> '') then
  begin
    TmpStr := '(' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrecIntRIFDOC_TIPO.Index] + ' n° ' +
      Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrecIntRIFDOC_NUM.Index] + Sender.DataController.DisplayTexts
      [AViewInfo.GridRecord.RecordIndex, btvPrecIntRIFDOC_REG.Index] + ' del ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,
      btvPrecIntRIFDOC_DATA.Index] + '   ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrecIntRIFDOC_TOTALEDOCUMENTO.Index] + ')';
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
    R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  end;

  // Tecnico
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex, btvPrecIntTECNICO_NOME.Index] + '   ';
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
  // Label Tecnico:
  TmpStr := 'Tecnico:';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
end;

procedure TPraticaForm.btvPrecIntDataControllerCompare(ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2, AItemIndex: Integer;
  const V1, V2: Variant; var Compare: Integer);
var
  Date1, Date2: TDateTime;
begin
  // Se sta ordinando per Master_ID (perchè è grouped) lo forza a tenere
  // in considerazione anche le date perchè altrimenti in alcuni casi
  // scazzava l'ordinamento deu precedenti
  if (AItemIndex = btvPrecIntMASTER_ID.Index) then
  begin
    Date1 := ADataController.Values[ARecordIndex1, btvPrecIntDATADOC.Index];
    Date2 := ADataController.Values[ARecordIndex2, btvPrecIntDATADOC.Index];
    if Date1 = Date2 then
      Compare := VarCompare(V1, V2)
    else
      Compare := VarCompare(Date1, Date2);
    // In tutti gli altri casi procede normalmente
  end
  else
  begin
    Compare := VarCompare(V1, V2);
  end;
end;

procedure TPraticaForm.btvPrecIntQTAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
begin
  // IN questi casi non visualizza nulla
  if ((not VarIsNull(ARecord.Values[Sender.Index])) and (ARecord.Values[Sender.Index] = 0)) or
    ((ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '20-OPERAZIONE PIANIFICATA') and (Sender = btvPrecIntQTA)) or
    (ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '30-RELAZIONE INTERVENTO') or
    (ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '40-OSSERVAZIONI ALLEGATO') then
    AText := '';
  // Se è una OP in abbonamento visualizza "Abb." e stiamo visualizzando un importo
  // if  (ARecord.DisplayTexts[btvPrecIntINABBONAMENTO.Index] = 'T')
  // and ((Sender = btvPrecIntCALC_PRZUNITIVACOMPNETTO) or (Sender = btvPrecIntCALC_PRZUNITNETTO))
  // then AText := 'Abb.';
end;

procedure TPraticaForm.QryIntPrecCalcFields(DataSet: TDataSet);
begin
  // Calcola i prezziunitari netti
  if QryIntPrecQTA.AsFloat <> 0 then
  begin
    QryIntPrecCALC_PRZUNITNETTO.Value := DM1.Arrotonda((QryIntPrecIMPORTO.AsFloat / QryIntPrecQTA.AsFloat), DM1.DecMicroPrz);
    QryIntPrecCALC_PRZUNITIVACOMPNETTO.Value := DM1.Arrotonda((QryIntPrecIMPORTOIVACOMP.AsFloat / QryIntPrecQTA.AsFloat), DM1.DecMicroPrz);
  end
  else
  begin
    QryIntPrecCALC_PRZUNITNETTO.Value := 0;
    QryIntPrecCALC_PRZUNITIVACOMPNETTO.Value := 0;
  end;
end;

procedure TPraticaForm.btvPrescRISOLTOPropertiesEditValueChanged(Sender: TObject);
var
  RI: Integer;
  DC: TcxCustomDataController;
  TmpStr: String;
begin
  DC := btvPresc.DataController;
  RI := DC.FocusedRecordIndex;
  TmpStr := DC.DisplayTexts[RI, btvPrescRISOLTO.Index];
  if TmpStr = 'True' then
  begin
    DC.Cancel; // Altrimenti non mi salva poi la data di risoluzione del problema e mi da un errore
    DM2.ChiediConfermaPrescrizioneRisolta(DC, RI, btvPrescRISOLTO.Index, btvPrescFATTO_DATA.Index, btvPrescFATTO_NOTE.Index);
  end;
end;

// Imposta le dimensioni dei pannelli delle note
procedure TPraticaForm.ImpostaDimensioniPannelliNote;
begin
  // Note impianto
  if cbVediNotePrivateImpianto.Checked then
    PanelNoteImpianto.Height := dbeNotePrivateImpianto.Top + dbeNotePrivateImpianto.Height + 5
  else
    PanelNoteImpianto.Height := dbeNotePrivateImpianto.Top;
end;

procedure TPraticaForm.cbVediNotePrivateImpiantoPropertiesChange(Sender: TObject);
begin
  // IN base alla selezione dimensiona il pannello Note
  ImpostaDimensioniPannelliNote;
  // RIchiama il calcolo del layout per ridisporre i Pannelli successivi
  ImpostaLayout;
end;

// =============================================================================
// INIZIO PARTE PER EVIDENZIAZIONE LAMPEGGIANTE (PRESCRIZIONI, NOTE ECC.)
// -----------------------------------------------------------------------------
// Verifica se deve essere avviato il lampeddio (evidenziaizione) del campo
procedure TPraticaForm.ControllaEvidenziazioneNotePrivateImpianto;
begin
  NotePrivateImpianto_Evidenzia := (Trim(QryPratNOTEPRIVATE.AsString) <> '');
end;

// Procedure che aggiorna nel Tab delle prescrizioni il numero delle prescrizioni presenti
// e se ce ne sono fa anche lampeggiare il riquadro
procedure TPraticaForm.RefreshTabPrescrizioni;
var
  V: Byte;
begin
  V := btvPresc.DataController.RecordCount;
  if V = 0 then
  begin
    TabInterventiPrecedenti.Caption := 'Precedenti';
    Prescrizioni_Evidenzia := False;
  end
  else
  begin
    TabInterventiPrecedenti.Caption := 'Precedenti - ' + IntToStr(V);
    Prescrizioni_Evidenzia := True;
  end;
end;

procedure TPraticaForm.TimerBlinkTimer(Sender: TObject);
begin
  // Fa lampeggiare le prescrizioni
  if Prescrizioni_Evidenzia then
    Prescrizioni_InEvidenza := not Prescrizioni_InEvidenza;
  if NotePrivateImpianto_Evidenzia then
    NotePrivateImpianto_InEvidenza := not NotePrivateImpianto_InEvidenza;
end;

// --------------------------
procedure TPraticaForm.SetPrescrizioni_Evidenzia(const Value: Boolean);
begin
  fPrescrizioni_Evidenzia := Value;
  // Resetta l'aspetto se il lammpeggio viene interrotto.
  if not Value then
    Prescrizioni_InEvidenza := False;
end;

procedure TPraticaForm.SetNotePrivateImpianto_Evidenzia(const Value: Boolean);
begin
  fNotePrivateImpianto_Evidenzia := Value;
  // Resetta l'aspetto se il lammpeggio viene interrotto.
  if not Value then
    NotePrivateImpianto_InEvidenza := False;
end;
// --------------------------

// --------------------------
procedure TPraticaForm.SetNotePrivateImpianto_InEvidenza(const Value: Boolean);
const
  NORMAL_PANEL_COLOR = clWhite;
  BLINK_PANEL_COLOR = $00C1C1FF;
begin
  fNotePrivateImpianto_InEvidenza := Value;
  // Se deve essere evidenziato lo evidenzia
  if Value then
    PanelCheckNotePrivateImpianto.Color := BLINK_PANEL_COLOR
  else
    PanelCheckNotePrivateImpianto.Color := NORMAL_PANEL_COLOR;
end;

procedure TPraticaForm.SetPrescrizioni_InEvidenza(const Value: Boolean);
const
  NORMAL_PANEL_COLOR = $00E9E9E9;
  BLINK_PANEL_COLOR = $00C1C1FF;
begin
  fPrescrizioni_InEvidenza := Value;
  // Se deve essere visualizzato in evidenza
  if Value then
  begin

    // =========================================================================
    // Disegna in evidenza le raccomandazioni/prescrizioni
    // -------------------------------------------------------------------------
    PanelPrescrizioni.Color := BLINK_PANEL_COLOR;
    TabInterventiPrecedenti.Color := BLINK_PANEL_COLOR;
    // =========================================================================

  end
  else
  begin

    // =========================================================================
    // Disegna NON in evidenza le raccomandazioni/prescrizioni
    // -------------------------------------------------------------------------
    PanelPrescrizioni.Color := NORMAL_PANEL_COLOR;
    if MainPageControl.ActivePage = TabInterventiPrecedenti then
      TabInterventiPrecedenti.Color := clWhite
    else
      TabInterventiPrecedenti.Color := clNone;
    // =========================================================================

  end;
end;
// -----------------------------------------------------------------------------
// FINE PARTE PER EVIDENZIAZIONE LAMPEGGIANTE (PRESCRIZIONI, NOTE ECC.)
// =============================================================================

procedure TPraticaForm.QryPratAfterPost(DataSet: TDataSet);
begin
  // Verifica se devono essere evidenziale le note
  ControllaEvidenziazioneNotePrivateImpianto;
end;

procedure TPraticaForm.btvPrecIntEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  AAllow := True;
end;

procedure TPraticaForm.dbeNaturaGiuridicaPropertiesChange(Sender: TObject);
begin
  // All invisible
  LabelRagioneSociale.Visible := False;
  LabelNome.Visible := False;
  LabelCognome.Visible := False;
  eRagSocRespImp.Visible := False;
  eNomeRespImp.Visible := False;
  eCognomeRespImp.Visible := False;
  // Show depending....
  case dbeNaturaGiuridica.ItemIndex of
    // Persona fisica
    0:
      begin
        LabelCognome.Caption := 'Cognome o Rag.Soc.';
        // Posizionamento verticale
        LabelNome.Top := RESPIMP_MIDDLE;
        LabelCognome.Top := RESPIMP_MIDDLE;
        eNomeRespImp.Top := RESPIMP_MIDDLE;
        eCognomeRespImp.Top := RESPIMP_MIDDLE;
        // Abilita
        LabelNome.Visible := True;
        LabelCognome.Visible := True;
        eNomeRespImp.Visible := True;
        eCognomeRespImp.Visible := True;
      end;
    // Persona giuridica
    // anche cognome e nome visibili
    1:
      begin
        LabelCognome.Caption := 'Cognome';
        // Posizionamento verticale
        LabelRagioneSociale.Top := RESPIMP_TOP;
        LabelNome.Top := RESPIMP_BOTTOM;
        LabelCognome.Top := RESPIMP_BOTTOM;
        eRagSocRespImp.Top := RESPIMP_TOP;
        eNomeRespImp.Top := RESPIMP_BOTTOM;
        eCognomeRespImp.Top := RESPIMP_BOTTOM;
        // Abilita
        LabelRagioneSociale.Visible := True;
        LabelNome.Visible := True;
        LabelCognome.Visible := True;
        eRagSocRespImp.Visible := True;
        eNomeRespImp.Visible := True;
        eCognomeRespImp.Visible := True;
      end;
  end;
end;

procedure TPraticaForm.dbeZonaImmPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(ZONAIMM) FROM PRATICHE');
    if (not QryPratCOMUNEIMM.IsNull) and (Trim(QryPratCOMUNEIMM.AsString) <> '') then
      Qry.SQL.Add('WHERE COMUNEIMM = ' + QuotedStr(QryPratCOMUNEIMM.AsString));
    Qry.Open;
    dbeZonaImm.Properties.Items.Clear;
    dbeZonaImm.Properties.Items.Add('');
    while not Qry.Eof do
    begin
      dbeZonaImm.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPraticaForm.dbeComuneImmPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  // Solo se siamo in modalità di modifica
  if not RxSpeedModifica.Down then
    Exit;
  // RIchiama la selezione dallo stradario
  DM1.ShowWait('Levante', 'Apertura stradario...');
  try
    DM2.Stradario_SelezionaIndirizzo(QryPratCODICEISTATCOMUNEIMM, QryPratCOMUNEIMM, QryPratINDIRIZZOIMM, QryPratPROVINCIAIMM, QryPratCAPIMM);
  finally
    DM1.CloseWait;
  end;
end;

procedure TPraticaForm.QryPratCalcFields(DataSet: TDataSet);
begin
  // ===========================================================================
  // Verifica l'indirizzo con la stradario per certificarlo
  // ---------------------------------------------------------------------------
  if DM2.Stradario_IndirizzoVerificato(QryPratCODICEISTATCOMUNEIMM.AsString, QryPratCOMUNEIMM.AsString, QryPratINDIRIZZOIMM.AsString,
    QryPratPROVINCIAIMM.AsString) then
    QryPratCOMPUTED_STR_CERTIFIED_IMM.AsString := 'T'
  else
    QryPratCOMPUTED_STR_CERTIFIED_IMM.AsString := 'F';
  // ===========================================================================
end;

procedure TPraticaForm.PanelProprietarioImpiantoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Attiva il drag and drop (se è il caso)
  if (ssCtrl in Shift) and (Sender is TControl) then
  begin
    TControl(Sender).BeginDrag(True);
    PanelTrascinaQui.Align := alClient;
    PanelTrascinaQui.Visible := True;
    PanelTrascinaQui.Update;
  end;
end;

procedure TPraticaForm.PanelProprietarioImpiantoEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  // Esce dal trascinamento e rimette le cose a posto
  PanelTrascinaQui.Visible := False;
  PanelTrascinaQui.Update;
end;

procedure TPraticaForm.PanelTrascinaQuiDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  Mittente: TControl;
begin
  Accept := False;
  // Se il mittente è un elemento del pannello dei dati del proprietario...
  if (Source is TControl) then
  begin
    Mittente := (Source as TControl);
    if (Mittente.Name = 'PanelProprietarioImpianto') or (Mittente.Parent.Name = 'PanelProprietarioImpianto') then
      Accept := True;
    if (Mittente.Name = 'PanelOccupanteImpianto') or (Mittente.Parent.Name = 'PanelOccupanteImpianto') then
      Accept := True;
    if (Mittente.Name = 'PanelAmministratoreImpianto') or (Mittente.Parent.Name = 'PanelAmministratoreImpianto') then
      Accept := True;
  end;
end;

procedure TPraticaForm.PanelTrascinaQuiDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Mittente: TControl;
begin
  if not RxSpeedModifica.Down then
    Exit;
  // Se il mittente è un elemento del pannello dei dati del proprietario...
  if (Source is TControl) then
  begin
    Mittente := (Source as TControl);
    // Se il mittente è un elemento del pannello dei dati del proprietario...

    if (Mittente.Name = 'PanelProprietarioImpianto') or (Mittente.Parent.Name = 'PanelProprietarioImpianto') then
    begin
      if not QryPratCLIENTE.IsNull then
      begin
        QryPratCODICERESPIMP.Value := QryPratCLIENTE.AsInteger;
        QryPratRAGSOCRESPIMP.Value := QryPratRAGSOCCLI.AsString;
        QryPratCITTARESPIMP.Value := QryPratCITTACLI.AsString;
        QryPratCAPRESPIMP.Value := QryPratCAPCLI.AsString;
        QryPratPROVINCIARESPIMP.Value := QryPratPROVINCIACLI.AsString;
        QryPratINDIRIZZORESPIMP.Value := QryPratINDIRIZZOCLI.AsString;
        QryPratNUMCIVICORESPIMP.Value := QryPratNUMCIVICOCLI.AsString;
        QryPratTELEFONORESPIMP.Value := QryPratTELEFONOCLI.AsString;
        QryPratCELLULARERESPIMP.Value := QryPratCELLULARECLI.AsString;
        QryPratCODICEFISCALERESPIMP.Value := QryPratCODICEFISCALECLI.AsString;
      end
      else
        raise Exception.Create('Codice proprietario non specificato!');
    end;

    if (Mittente.Name = 'PanelOccupanteImpianto') or (Mittente.Parent.Name = 'PanelOccupanteImpianto') then
    begin
      if not QryPratCODICEUT.IsNull then
      begin
        QryPratCODICERESPIMP.Value := QryPratCODICEUT.AsInteger;
        QryPratRAGSOCRESPIMP.Value := QryPratRAGSOCUT.AsString;
        QryPratCITTARESPIMP.Value := QryPratCITTAUT.AsString;
        QryPratCAPRESPIMP.Value := QryPratCAPUT.AsString;
        QryPratPROVINCIARESPIMP.Value := QryPratPROVINCIAUT.AsString;
        QryPratINDIRIZZORESPIMP.Value := QryPratINDIRIZZOUT.AsString;
        QryPratNUMCIVICORESPIMP.Value := QryPratNUMCIVICOUT.AsString;
        QryPratTELEFONORESPIMP.Value := QryPratTELEFONOUT.AsString;
        QryPratCELLULARERESPIMP.Value := QryPratCELLULAREUT.AsString;
        QryPratCODICEFISCALERESPIMP.Value := QryPratCODICEFISCALEUT.AsString;
      end
      else
        raise Exception.Create('Codice utente/occupante non specificato!');
    end;

    if (Mittente.Name = 'PanelAmministratoreImpianto') or (Mittente.Parent.Name = 'PanelAmministratoreImpianto') then
    begin
      if not QryPratCODICEINST.IsNull then
      begin
        QryPratCODICERESPIMP.Value := QryPratCODICEINST.AsInteger;
        QryPratRAGSOCRESPIMP.Value := QryPratRAGSOCINST.AsString;
        QryPratCITTARESPIMP.Value := QryPratCITTAINST.AsString;
        QryPratCAPRESPIMP.Value := QryPratCAPINST.AsString;
        QryPratPROVINCIARESPIMP.Value := QryPratPROVINCIAINST.AsString;
        QryPratINDIRIZZORESPIMP.Value := QryPratINDIRIZZOINST.AsString;
        QryPratNUMCIVICORESPIMP.Value := QryPratNUMCIVICOIMM.AsString;
        QryPratTELEFONORESPIMP.Value := QryPratTELEFONOINST.AsString;
        QryPratCELLULARERESPIMP.Value := QryPratCELLULAREINST.AsString;
        QryPratCODICEFISCALERESPIMP.Value := QryPratCODICEFISCALEINST.AsString;
      end
      else
        raise Exception.Create('Codice amministratore non specificato!');
    end;
  end;
end;

procedure TPraticaForm.sbContrattoRinnovaClick(Sender: TObject);
begin
  DM2.Contratto_Rinnova(QryPratCONTRATTO_VALIDITA_FINE, QryPratCONTRATTO_MESI_RINNOVO, QryPratCONTRATTO_STATO, QryPratCONTRATTO_DISDETTA_RICEVUTA);
end;

procedure TPraticaForm.QryOPPRZUNITValidate(Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then
    Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il prezzo netto scontato
    QryOPPRZUNITNETTO.Value := DM1.CalcolaImportoScontato(QryOPPRZUNIT.AsFloat, QryOPSCONTO1.AsFloat, QryOPSCONTO2.AsFloat, QryOPSCONTO3.AsFloat,
      DM1.DecMicroPrz);
    // Calcola il prezzo lordo iva compresa
    QryOPPRZUNITIVACOMP.Value := DM1.Arrotonda(QryOPPRZUNIT.AsFloat * ((100 + QryOPALIQUOTAIVA.AsFloat) / 100), DM1.DecMicroPrz);
    // Calcola il netto iva compresa
    QryOPPRZUNITNETTOIVACOMP.Value := DM1.Arrotonda(QryOPPRZUNITNETTO.AsFloat * ((100 + QryOPALIQUOTAIVA.AsFloat) / 100), DM1.DecMicroPrz);
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TPraticaForm.btvOPPROSSIMACustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
end;

procedure TPraticaForm.btvOPPRZUNITNETTOIVACOMPCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Font.Style := [fsBold];
end;

procedure TPraticaForm.QryPratCONTRATTO_STATOChange(Sender: TField);
begin
  // CAusa l'aggiornamento delle OP altrimenti non mi aggiornava subito a video
  // lo stato delle OP
  btvOP.Invalidate(True);
end;

procedure TPraticaForm.btvOPPRZUNITNETTOIVACOMPGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
begin
  // NOn visualizza gli zeri
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0) then
    AText := '';
  // Se la OP è compresa nell'abbonamento e ovviamente l'impianto è sotto contratto...
  if (VarToStr(ARecord.Values[btvOPINABBONAMENTO.Index]) = 'T') and (QryPratCONTRATTO_STATO.AsString = 'T') then
    AText := 'Abb.';
end;

procedure TPraticaForm.btvOPPRZUNITGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
begin
  // NOn visualizza gli zeri
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0) then
    AText := '';
  // Se la OP è compresa nell'abbonamento e ovviamente l'impianto è sotto contratto...
  if (VarToStr(ARecord.Values[btvOPINABBONAMENTO.Index]) = 'T') and (QryPratCONTRATTO_STATO.AsString = 'T') then
    AText := '';
end;

procedure TPraticaForm.btvOPPERIODICITAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
begin
  // NOn visualizza gli zeri
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0) then
    AText := '';
end;

procedure TPraticaForm.btvOPCODICEIVAGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: String);
begin
  // Se la OP è compresa nell'abbonamento e ovviamente l'impianto è sotto contratto...
  if (VarToStr(ARecord.Values[btvOPINABBONAMENTO.Index]) = 'T') and (QryPratCONTRATTO_STATO.AsString = 'T') then
    AText := '';
end;

procedure TPraticaForm.btvOPEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  // Inizializzazione
  AAllow := True;
  // Se l'OP attuale è compresa nell'abbonamento non rende modificabili i dati relativi
  // al prezzo della OP stessa (prezzo, IVA, sconti ecc.) anche perchè se è compresa nell'abbonamento
  // questi dati sono già invisibili.
  if (AItem = btvOPPRZUNIT) or (AItem = btvOPSCONTO1) or (AItem = btvOPSCONTO2) or (AItem = btvOPSCONTO3) or (AItem = btvOPPRZUNITNETTO) or
    (AItem = btvOPCODICEIVA) or (AItem = btvOPPRZUNITIVACOMP) or (AItem = btvOPPRZUNITNETTOIVACOMP) then
  begin
    AAllow := (VarToStr(Sender.Controller.FocusedRecord.Values[btvOPINABBONAMENTO.Index]) <> 'T') or (QryPratCONTRATTO_STATO.AsString <> 'T');
  end;
end;

procedure TPraticaForm.QryPratCONTRATTO_IMPORTOValidate(Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then
    Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il prezzo netto scontato
    QryPratCONTRATTO_IMPORTONETTO.Value := DM1.CalcolaImportoScontato(QryPratCONTRATTO_IMPORTO.AsFloat, QryPratCONTRATTO_SCONTO1.AsFloat,
      QryPratCONTRATTO_SCONTO2.AsFloat, QryPratCONTRATTO_SCONTO3.AsFloat, DM1.DecMicroPrz);
    // Calcola il prezzo lordo iva compresa
    QryPratCONTRATTO_IMPORTOIVACOMP.Value := DM1.Arrotonda(QryPratCONTRATTO_IMPORTO.AsFloat * ((100 + QryPratCONTRATTO_ALIQUOTAIVA.AsFloat) / 100),
      DM1.DecMicroPrz);
    // Calcola il netto iva compresa
    QryPratCONTRATTO_IMPORTONETTOIVACOMP.Value := DM1.Arrotonda(QryPratCONTRATTO_IMPORTONETTO.AsFloat * ((100 + QryPratCONTRATTO_ALIQUOTAIVA.AsFloat) / 100),
      DM1.DecMicroPrz);
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TPraticaForm.btvOPCODICEIVACustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  // Font più piccolo
  ACanvas.Font.Size := 7;
end;

procedure TPraticaForm.QryOPPRZUNITNETTOIVACOMPValidate(Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then
    Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il lordo IVA compresa considerando tutti gli sconti = 0
    QryOPPRZUNIT.Value := DM1.Arrotonda(QryOPPRZUNITNETTOIVACOMP.AsFloat / ((100 + QryOPALIQUOTAIVA.AsFloat) / 100), DM1.DecMicroPrz);
    QryOPSCONTO1.Value := 0;
    QryOPSCONTO2.Value := 0;
    QryOPSCONTO3.Value := 0;
    QryOPPRZUNITNETTO.Value := QryOPPRZUNIT.AsFloat;
    // Anche il lordi IVA compresa
    QryOPPRZUNITIVACOMP.Value := QryOPPRZUNITNETTOIVACOMP.AsFloat;
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TPraticaForm.Button1Click(Sender: TObject);
begin
  if not QryOP.Active then
  begin
    QryOP.Open;
  end;
  QryOP.SQL.SaveToFile('c:\sql.sql');
  QryOP.EditSQL.SaveToFile('c:\editsql.sql');
  QryOP.Edit;
  QryOPDESCRIZIONE.Value := QryOPDESCRIZIONE.Value + '*';
  QryOP.Post;
end;

procedure TPraticaForm.QryPratCONTRATTO_IMPORTONETTOIVACOMPValidate(Sender: TField);
begin
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then
    Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il lordo IVA compresa considerando tutti gli sconti = 0
    QryPratCONTRATTO_IMPORTO.Value := DM1.Arrotonda(QryPratCONTRATTO_IMPORTONETTOIVACOMP.AsFloat / ((100 + QryPratCONTRATTO_ALIQUOTAIVA.AsFloat) / 100),
      DM1.DecMicroPrz);
    QryPratCONTRATTO_SCONTO1.Value := 0;
    QryPratCONTRATTO_SCONTO2.Value := 0;
    QryPratCONTRATTO_SCONTO3.Value := 0;
    QryPratCONTRATTO_IMPORTONETTO.Value := QryPratCONTRATTO_IMPORTO.AsFloat;
    // Anche il lordi IVA compresa
    QryPratCONTRATTO_IMPORTOIVACOMP.Value := QryPratCONTRATTO_IMPORTONETTOIVACOMP.AsFloat;
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TPraticaForm.dbeAgenteImpPropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgenteImp.Properties.Items, 1, '');
end;

procedure TPraticaForm.dbeAgenteImp2PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgenteImp2.Properties.Items, 2, dbeAgenteImp.Text);
end;

procedure TPraticaForm.dbeAgenteImp3PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgenteImp3.Properties.Items, 3, dbeAgenteImp2.Text);
end;

procedure TPraticaForm.dbeAgenteImp4PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgenteImp4.Properties.Items, 4, dbeAgenteImp3.Text);
end;

procedure TPraticaForm.dbeAgenteImpPropertiesEditValueChanged(Sender: TObject);
begin
  // Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  // che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryPrat.State = dsEdit) or (QryPrat.State = dsInsert) then
    DM1.AgenteChanged(1, dbeAgenteImp2);
end;

procedure TPraticaForm.dbeAgenteImp2PropertiesEditValueChanged(Sender: TObject);
begin
  // Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  // che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryPrat.State = dsEdit) or (QryPrat.State = dsInsert) then
    DM1.AgenteChanged(2, dbeAgenteImp3);
end;

procedure TPraticaForm.dbeAgenteImp3PropertiesEditValueChanged(Sender: TObject);
begin
  // Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  // che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryPrat.State = dsEdit) or (QryPrat.State = dsInsert) then
    DM1.AgenteChanged(3, dbeAgenteImp4);
end;

end.
