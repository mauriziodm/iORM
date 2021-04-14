unit FormTabImpianti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPerTabPageControlPrincipale, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxEdit, DB, cxDBData,
  cxCheckBox, cxTextEdit, cxCalendar, cxCurrencyEdit, StdCtrls,
  cxContainer, cxMaskEdit, cxDropDownEdit, CheckLst, Mask, MAURI_SB,
  Buttons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, cxPC, cxGridBandedTableView, cxGridDBBandedTableView, cxMemo,
  cxCheckComboBox, Menus, cxSchedulerStorage,
  cxSchedulerDateNavigator, 
  cxSchedulerUtils, 
  IB_Components, IBODataset, cxRadioGroup, cxGridChartView,
  cxCustomPivotGrid, cxSplitter,
  DBCtrls, FormGMap, cxRichEdit, cxInplaceContainer,
  cxVGrid, cxGridCustomPopupMenu, cxGridPopupMenu, cxLookAndFeelPainters,
  ImgList, cxDBLookupComboBox, dxPSGlbl, dxPSUtl, 
  dxBkgnd, dxWrap, dxPrnDev, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, cxImageComboBox, DataModule2,
  cxData, cxDataStorage, dxPSEngn, dxPrnPg, dxPSCompsProvider, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxLookAndFeels, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxSchedulerLnk, dxPScxPivotGridLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations, System.ImageList;

type
  TTabImpiantiForm = class(TModelPerTabPageControlPrincipaleForm)
    PageControlAssistenze: TcxPageControl;
    TabAssElenco: TcxTabSheet;
    PanelAssistenze: TPanel;
    GridAssistenze: TcxGrid;
    lvAssistenze: TcxGridLevel;
    PanelAssFiltri: TPanel;
    SubPanelAssFiltri: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    AssOtt: TSpeedButton;
    AssNov: TSpeedButton;
    AssDic: TSpeedButton;
    AssAgo: TSpeedButton;
    AssLug: TSpeedButton;
    AssGiu: TSpeedButton;
    AssMag: TSpeedButton;
    AssGen: TSpeedButton;
    AssFeb: TSpeedButton;
    AssMar: TSpeedButton;
    AssApr: TSpeedButton;
    AssMesiTutti: TSpeedButton;
    AssMesiNessuno: TSpeedButton;
    AssSet: TSpeedButton;
    SBAssFilterOpenClose: TSpeedButtonRollOver;
    AssSaveDateFilter: TSpeedButton;
    StaticText32: TStaticText;
    StaticText29: TStaticText;
    StaticText20: TStaticText;
    FilterAbbonati: TCheckListBox;
    StaticText27: TStaticText;
    FilterInScadenza: TCheckListBox;
    StaticText28: TStaticText;
    FilterCostruttore: TcxComboBox;
    FilterModello: TcxComboBox;
    FilterLocalita: TcxComboBox;
    StaticText39: TStaticText;
    StaticText42: TStaticText;
    FilterTipoImpianto: TcxComboBox;
    FilterPeriodicita: TcxComboBox;
    StaticText23: TStaticText;
    FilterTipoData: TcxComboBox;
    StaticText57: TStaticText;
    FilterIndirizzo: TEdit;
    StaticText69: TStaticText;
    FilterTecnicoPreferito: TcxComboBox;
    StaticText75: TStaticText;
    FilterAssTrova: TEdit;
    StaticText11: TStaticText;
    FilterMatricola: TEdit;
    StaticText36: TStaticText;
    FilterCodiceImpianto: TEdit;
    StaticText50: TStaticText;
    FilterCodiceCatasto: TEdit;
    Panel18: TPanel;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    TabAssMappa: TcxTabSheet;
    btvAssistenze: TcxGridDBBandedTableView;
    QryAss: TIBOQuery;
    SourceAss: TDataSource;
    MenuAssistenze: TPopupMenu;
    Centraletermica1: TMenuItem;
    Riscaldamento1: TMenuItem;
    N16: TMenuItem;
    Climatizzazione1: TMenuItem;
    Refrigerazione1: TMenuItem;
    N18: TMenuItem;
    Generico1: TMenuItem;
    TransAss: TIB_Transaction;
    btvAssistenzeCODICE: TcxGridDBBandedColumn;
    btvAssistenzeDATAAPERTURA: TcxGridDBBandedColumn;
    btvAssistenzeDESCRIZIONE: TcxGridDBBandedColumn;
    btvAssistenzePROVINCIAIMM: TcxGridDBBandedColumn;
    btvAssistenzeCOMUNEIMM: TcxGridDBBandedColumn;
    btvAssistenzeCAPIMM: TcxGridDBBandedColumn;
    btvAssistenzeTIPOIMPIANTO: TcxGridDBBandedColumn;
    btvAssistenzePERIODICITA: TcxGridDBBandedColumn;
    btvAssistenzePROXVISITAENTRO: TcxGridDBBandedColumn;
    btvAssistenzeDATAULTIMOINTERVENTO: TcxGridDBBandedColumn;
    btvAssistenzeDATAORAPROSSIMOAPPUNTAMENTO: TcxGridDBBandedColumn;
    btvAssistenzeINDIRIZZOIMM: TcxGridDBBandedColumn;
    QryAssCODICE: TIntegerField;
    QryAssDATAAPERTURA: TDateTimeField;
    QryAssTIPOIMPIANTO: TStringField;
    QryAssDESCRIZIONE: TStringField;
    QryAssCODICECATASTO: TStringField;
    QryAssNOTEPRIVATEEXISTS: TStringField;
    QryAssINDIRIZZOIMM: TStringField;
    QryAssZONAIMM: TStringField;
    QryAssCOMUNEIMM: TStringField;
    QryAssPROVINCIAIMM: TStringField;
    QryAssCAPIMM: TStringField;
    QryAssDATAULTIMOINTERVENTO: TDateTimeField;
    QryAssPROXVISITAENTRO: TDateTimeField;
    QryAssPERIODICITA: TIntegerField;
    QryAssDATAORAPROSSIMOAPPUNTAMENTO: TDateTimeField;
    QryAssCONTRATTO_STATO: TStringField;
    QryAssCOMPUTED_CONTRATTO_SCADUTO: TStringField;
    QryAssCONTRATTO_TIPO: TStringField;
    QryAssCONTRATTO_IMPORTO: TIBOFloatField;
    QryAssCONTRATTO_VALIDITA_FINE: TDateTimeField;
    QryAssCONTRATTO_DISDETTA_RICEVUTA: TStringField;
    QryAssRIFRESPIMP: TStringField;
    QryAssINQUALITADIRESPIMP: TStringField;
    QryAssTELEFONORESPIMP: TStringField;
    QryAssCELLULARERESPIMP: TStringField;
    QryAssRIFPROP: TStringField;
    QryAssTELEFONOPROP: TStringField;
    QryAssCELLULAREPROP: TStringField;
    QryAssRIFUT: TStringField;
    QryAssTELEFONOUT: TStringField;
    QryAssCELLULAREUT: TStringField;
    QryAssRIFINST: TStringField;
    QryAssTELEFONOINST: TStringField;
    QryAssCELLULAREINST: TStringField;
    btvAssistenzeCODICECATASTO: TcxGridDBBandedColumn;
    btvAssistenzeNOTE: TcxGridDBBandedColumn;
    btvAssistenzeNOTEPRIVATEEXISTS: TcxGridDBBandedColumn;
    btvAssistenzeZONAIMM: TcxGridDBBandedColumn;
    btvAssistenzeCONTRATTO_STATO: TcxGridDBBandedColumn;
    btvAssistenzeCOMPUTED_CONTRATTO_SCADUTO: TcxGridDBBandedColumn;
    btvAssistenzeCONTRATTO_TIPO: TcxGridDBBandedColumn;
    btvAssistenzeCONTRATTO_IMPORTO: TcxGridDBBandedColumn;
    btvAssistenzeCONTRATTO_VALIDITA_FINE: TcxGridDBBandedColumn;
    btvAssistenzeCONTRATTO_DISDETTA_RICEVUTA: TcxGridDBBandedColumn;
    btvAssistenzeRIFRESPIMP: TcxGridDBBandedColumn;
    btvAssistenzeINQUALITADIRESPIMP: TcxGridDBBandedColumn;
    btvAssistenzeTELEFONORESPIMP: TcxGridDBBandedColumn;
    btvAssistenzeCELLULARERESPIMP: TcxGridDBBandedColumn;
    btvAssistenzeRIFPROP: TcxGridDBBandedColumn;
    btvAssistenzeTELEFONOPROP: TcxGridDBBandedColumn;
    btvAssistenzeCELLULAREPROP: TcxGridDBBandedColumn;
    btvAssistenzeRIFUT: TcxGridDBBandedColumn;
    btvAssistenzeTELEFONOUT: TcxGridDBBandedColumn;
    btvAssistenzeCELLULAREUT: TcxGridDBBandedColumn;
    btvAssistenzeRIFINST: TcxGridDBBandedColumn;
    btvAssistenzeTELEFONOINST: TcxGridDBBandedColumn;
    btvAssistenzeCELLULAREINST: TcxGridDBBandedColumn;
    QryAssCOMPUTED_STATO: TStringField;
    QryAssCODICERESPIMP: TIntegerField;
    QryAssCODICEPROP: TIntegerField;
    QryAssCODICEUT: TIntegerField;
    QryAssCODICEINST: TIntegerField;
    btvAssistenzeCOMPUTED_STATO: TcxGridDBBandedColumn;
    cxGridPopupMenu1: TcxGridPopupMenu;
    BandHeaderMenu: TPopupMenu;
    BandHeaderMenuItemFissaSX: TMenuItem;
    BandHeaderMenuItemFissaDX: TMenuItem;
    BandHeaderMenuItemFissaNONE: TMenuItem;
    LabelImpiantiCount: TLabel;
    QryAssNOTE: TStringField;
    SBFilterRow: TSpeedButton;
    btvAssistenzeICON_URGENTE: TcxGridDBBandedColumn;
    btvAssistenzeICON_PRESCRIZIONE: TcxGridDBBandedColumn;
    btvAssistenzeICON_CHIAMATA: TcxGridDBBandedColumn;
    btvAssistenzeICON_ALLEGATO: TcxGridDBBandedColumn;
    QryAssEXIST_PRESCRIZIONI: TStringField;
    QryAssEXIST_URGENTI: TStringField;
    QryAssEXIST_CHIAMATE: TStringField;
    QryAssEXIST_ALLEGATITOSEND: TStringField;
    lvOP: TcxGridLevel;
    btvOP: TcxGridDBBandedTableView;
    QryAssID: TIntegerField;
    btvAssistenzeID: TcxGridDBBandedColumn;
    ImageList_PratApp: TImageList;
    QryOP: TIBOQuery;
    QryOPID: TIntegerField;
    QryOPIDPRATICA: TIntegerField;
    QryOPIDAPPARECCHIOPRAT: TIntegerField;
    QryOPIDOP: TStringField;
    QryOPDESCRIZIONE: TStringField;
    QryOPNOTE: TStringField;
    QryOPPERIODICITA: TIntegerField;
    QryOPMINUTIPREVISTI: TIntegerField;
    QryOPULTIMA: TDateTimeField;
    QryOPPROSSIMA: TDateTimeField;
    QryOPPRZUNIT: TIBOFloatField;
    QryOPADDEBITA: TStringField;
    QryOPGG_AUTOSEL: TSmallintField;
    SourceOP: TDataSource;
    btvOPID: TcxGridDBBandedColumn;
    btvOPIDPRATICA: TcxGridDBBandedColumn;
    btvOPIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    btvOPIDOP: TcxGridDBBandedColumn;
    btvOPDESCRIZIONE: TcxGridDBBandedColumn;
    btvOPNOTE: TcxGridDBBandedColumn;
    btvOPPERIODICITA: TcxGridDBBandedColumn;
    btvOPMINUTIPREVISTI: TcxGridDBBandedColumn;
    btvOPULTIMA: TcxGridDBBandedColumn;
    btvOPPROSSIMA: TcxGridDBBandedColumn;
    btvOPPRZUNITIVACOMP: TcxGridDBBandedColumn;
    btvOPADDEBITA: TcxGridDBBandedColumn;
    btvOPGG_AUTOSEL: TcxGridDBBandedColumn;
    btvOPTIPOAPPARECCHIO: TcxGridDBBandedColumn;
    btvOPCOSTRUTTORE: TcxGridDBBandedColumn;
    btvOPMODELLO: TcxGridDBBandedColumn;
    btvOPMATRICOLA: TcxGridDBBandedColumn;
    btvOPUBICAZIONE: TcxGridDBBandedColumn;
    QryOPTIPOAPPARECCHIO: TStringField;
    QryOPCOSTRUTTORE: TStringField;
    QryOPMODELLO: TStringField;
    QryOPMATRICOLA: TStringField;
    QryOPUBICAZIONE: TStringField;
    lvPrecedenti: TcxGridLevel;
    btvPrecInt: TcxGridDBBandedTableView;
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
    QryIntPrecPRATICA: TIntegerField;
    QryIntPrecDATAPRATICA1: TDateTimeField;
    btvPrecIntTIPORECORD: TcxGridDBBandedColumn;
    btvPrecIntMASTER_ID: TcxGridDBBandedColumn;
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
    btvPrecIntS1: TcxGridDBBandedColumn;
    btvPrecIntS2: TcxGridDBBandedColumn;
    btvPrecIntS3: TcxGridDBBandedColumn;
    btvPrecIntIMPORTO: TcxGridDBBandedColumn;
    btvPrecIntIMPORTOIVACOMP: TcxGridDBBandedColumn;
    btvPrecIntTECNICO_NOME: TcxGridDBBandedColumn;
    btvPrecIntIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    btvPrecIntCALC_PRZUNITNETTO: TcxGridDBBandedColumn;
    btvPrecIntCALC_PRZUNITIVACOMPNETTO: TcxGridDBBandedColumn;
    btvPrecIntPRATICA: TcxGridDBBandedColumn;
    btvPrecIntDATAPRATICA1: TcxGridDBBandedColumn;
    QryIntPrecAPPARECCHIO_FULL: TStringField;
    btvPrecIntAPPARECCHIO_FULL: TcxGridDBBandedColumn;
    lvPrescriz: TcxGridLevel;
    btvPresc: TcxGridDBBandedTableView;
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
    QryPrescFATTO: TStringField;
    QryPrescFATTO_DATA: TDateTimeField;
    QryPrescFATTO_NOTE: TStringField;
    SourcePresc: TDataSource;
    QryPrescPRATICA: TIntegerField;
    QryPrescDATAPRATICA1: TDateTimeField;
    btvPrescTIPORECORD: TcxGridDBBandedColumn;
    btvPrescIDIMPEGNO: TcxGridDBBandedColumn;
    btvPrescIDALLEGATO: TcxGridDBBandedColumn;
    btvPrescCODICE: TcxGridDBBandedColumn;
    btvPrescDESCRIZIONE: TcxGridDBBandedColumn;
    btvPrescTECNICO_NOME: TcxGridDBBandedColumn;
    btvPrescDATADOC: TcxGridDBBandedColumn;
    btvPrescUNIQUEKEYFIELD: TcxGridDBBandedColumn;
    btvPrescIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    btvPrescRISOLTO: TcxGridDBBandedColumn;
    btvPrescFATTO_DATA: TcxGridDBBandedColumn;
    btvPrescFATTO_NOTE: TcxGridDBBandedColumn;
    btvPrescPRATICA: TcxGridDBBandedColumn;
    btvPrescDATAPRATICA1: TcxGridDBBandedColumn;
    QryPrescAPPARECCHIO_FULL: TStringField;
    btvPrescAPPARECCHIO_FULL: TcxGridDBBandedColumn;
    lvImpegni: TcxGridLevel;
    tvImpegni: TcxGridDBTableView;
    QryImp: TIBOQuery;
    SourceImp: TDataSource;
    QryImpID: TIntegerField;
    QryImpPARENTID: TIntegerField;
    QryImpTIPOIMPEGNO: TStringField;
    QryImpEVENTMESSAGE: TStringField;
    QryImpSTART: TDateTimeField;
    QryImpLOCATION: TStringField;
    QryImpTIPOINTERVENTO: TStringField;
    QryImpDATAORACHIAMATA: TDateTimeField;
    QryImpTECNICO: TStringField;
    QryImpREGISTRO: TStringField;
    tvImpegniID: TcxGridDBColumn;
    tvImpegniPARENTID: TcxGridDBColumn;
    tvImpegniTIPOIMPEGNO: TcxGridDBColumn;
    tvImpegniEVENTMESSAGE: TcxGridDBColumn;
    tvImpegniSTART: TcxGridDBColumn;
    tvImpegniLOCATION: TcxGridDBColumn;
    tvImpegniTIPOINTERVENTO: TcxGridDBColumn;
    tvImpegniDATAORACHIAMATA: TcxGridDBColumn;
    tvImpegniTECNICO: TcxGridDBColumn;
    tvImpegniREGISTRO: TcxGridDBColumn;
    QryImpPRATICA: TIntegerField;
    QryImpDATAPRATICA1: TDateTimeField;
    tvImpegniPRATICA: TcxGridDBColumn;
    tvImpegniDATAPRATICA1: TcxGridDBColumn;
    QryPratApp: TIBOQuery;
    QryPratAppID: TIntegerField;
    QryPratAppCOSTRUTTORE: TStringField;
    QryPratAppMODELLO: TStringField;
    QryPratAppMATRICOLA: TStringField;
    QryPratAppUBICAZIONE: TStringField;
    QryPratAppTIPOAPPARECCHIO: TStringField;
    QryPratAppANNOCOSTRUZIONE: TIntegerField;
    QryPratAppDATAINSTALLAZIONE: TDateTimeField;
    QryPratAppDATACOLLAUDO: TDateTimeField;
    QryPratAppDISMESSO: TStringField;
    QryPratAppIDAPPABBINATO: TIntegerField;
    QryPratAppCOMPUTED_APPARECCHIO_FULL: TStringField;
    QryPratAppCOMPUTED_ABBINATO: TBooleanField;
    QryPratAppCOMPUTED_ORDER1: TIntegerField;
    QryPratAppCOMPUTED_ORDER2: TIntegerField;
    QryPratAppPOTENZATERMICA: TIBOFloatField;
    QryPratAppPOTENZATERMICA2: TIBOFloatField;
    QryPratAppTIPOCAMERA: TStringField;
    QryPratAppCOMBUSTIBILE: TStringField;
    QryPratAppCOMBUSTIBILEALTRO: TStringField;
    QryPratAppGARANZIA_SCADENZA: TDateTimeField;
    QryPratAppGARANZIA_NOTE: TStringField;
    QryPratAppGARANZIA_MESI: TSmallintField;
    QryPratAppGARANZIA_MESI_ESTENSIONE: TSmallintField;
    QryPratAppCOMPUTED_INGARANZIA: TStringField;
    QryPratAppDISMESSO_DATA: TDateTimeField;
    QryPratAppDISMESSO_NOTE: TStringField;
    QryPratAppVOLTAGGIOELETTRICO: TIntegerField;
    QryPratAppPOTENZAELETTRICA: TIBOFloatField;
    QryPratAppPORTATA: TIBOFloatField;
    QryPratAppPREVALENZA: TIBOFloatField;
    QryPratAppREFRIGERANTE: TStringField;
    QryPratAppCARICA: TIBOFloatField;
    QryPratAppPOTENZAFRIGORIFERA: TIBOFloatField;
    QryPratAppCOMPUTED_GARANZIA: TStringField;
    QryPratAppCOMPUTED_GARANZIA_NOTE: TStringField;
    SourcePratApp: TDataSource;
    lvApp: TcxGridLevel;
    tvApp: TcxGridDBTableView;
    tvAppID: TcxGridDBColumn;
    tvAppCOSTRUTTORE: TcxGridDBColumn;
    tvAppMODELLO: TcxGridDBColumn;
    tvAppMATRICOLA: TcxGridDBColumn;
    tvAppUBICAZIONE: TcxGridDBColumn;
    tvAppTIPOAPPARECCHIO: TcxGridDBColumn;
    tvAppANNOCOSTRUZIONE: TcxGridDBColumn;
    tvAppDATAINSTALLAZIONE: TcxGridDBColumn;
    tvAppDATACOLLAUDO: TcxGridDBColumn;
    tvAppDISMESSO: TcxGridDBColumn;
    tvAppIDAPPABBINATO: TcxGridDBColumn;
    tvAppCOMPUTED_APPARECCHIO_FULL: TcxGridDBColumn;
    tvAppCOMPUTED_ABBINATO: TcxGridDBColumn;
    tvAppCOMPUTED_ORDER1: TcxGridDBColumn;
    tvAppCOMPUTED_ORDER2: TcxGridDBColumn;
    tvAppPOTENZATERMICA: TcxGridDBColumn;
    tvAppPOTENZATERMICA2: TcxGridDBColumn;
    tvAppTIPOCAMERA: TcxGridDBColumn;
    tvAppCOMBUSTIBILE: TcxGridDBColumn;
    tvAppCOMBUSTIBILEALTRO: TcxGridDBColumn;
    tvAppGARANZIA_SCADENZA: TcxGridDBColumn;
    tvAppGARANZIA_NOTE: TcxGridDBColumn;
    tvAppGARANZIA_MESI: TcxGridDBColumn;
    tvAppGARANZIA_MESI_ESTENSIONE: TcxGridDBColumn;
    tvAppCOMPUTED_INGARANZIA: TcxGridDBColumn;
    tvAppDISMESSO_DATA: TcxGridDBColumn;
    tvAppDISMESSO_NOTE: TcxGridDBColumn;
    tvAppVOLTAGGIOELETTRICO: TcxGridDBColumn;
    tvAppPOTENZAELETTRICA: TcxGridDBColumn;
    tvAppPORTATA: TcxGridDBColumn;
    tvAppPREVALENZA: TcxGridDBColumn;
    tvAppREFRIGERANTE: TcxGridDBColumn;
    tvAppCARICA: TcxGridDBColumn;
    tvAppPOTENZAFRIGORIFERA: TcxGridDBColumn;
    tvAppCOMPUTED_GARANZIA: TcxGridDBColumn;
    tvAppCOMPUTED_GARANZIA_NOTE: TcxGridDBColumn;
    QryPratAppIDPRATICA: TIntegerField;
    tvAppIDPRATICA: TcxGridDBColumn;
    QryIntPrecGUID: TStringField;
    btvPrecIntGUID: TcxGridDBBandedColumn;
    QryIntPrecIDALLEGATOFG: TIntegerField;
    btvPrecIntIDALLEGATOFG: TcxGridDBBandedColumn;
    dxPrinter: TdxComponentPrinter;
    GridImpiantiLink: TdxGridReportLink;
    GroupBox1: TGroupBox;
    PanelSelezioneColonne: TPanel;
    SubPanelSelezioneColonne: TPanel;
    Label2: TLabel;
    Shape1: TShape;
    SbGcVisMem1: TSpeedButton;
    SbGcVisMem4: TSpeedButton;
    SbGcVisMem2: TSpeedButton;
    SbGcVisMem5: TSpeedButton;
    SbGcVisMem3: TSpeedButton;
    SbGcVisMemAdd: TSpeedButton;
    Label3: TLabel;
    SbGcVisMem6: TSpeedButton;
    SbGcVisMem7: TSpeedButton;
    SbGcVisMem8: TSpeedButton;
    SbGcVisMem9: TSpeedButton;
    SbGcVisMem10: TSpeedButton;
    SbGcVisMemSetPredef: TSpeedButton;
    TimerAddMemoryGC: TTimer;
    QryAssSTR_CERTIFIED_IMM: TStringField;
    btvAssistenzeSTR_CERTIFIED_IMM: TcxGridDBBandedColumn;
    QryAssEXIST_RIFDOC_CORRISPNOPAG: TStringField;
    btvAssistenzeICON_CORRISPNOPAG: TcxGridDBBandedColumn;
    QryAssRESOURCEID: TIntegerField;
    QryAssRESOURCENAME: TStringField;
    btvAssistenzeRESOURCEID: TcxGridDBBandedColumn;
    btvAssistenzeRESOURCENAME: TcxGridDBBandedColumn;
    QryAssCOMPUTED_NOTE: TStringField;
    StaticText1: TStaticText;
    FilterTipoContratto: TcxComboBox;
    QryOPINABBONAMENTO: TStringField;
    btvOPINABBONAMENTO: TcxGridDBBandedColumn;
    QryOPPRZUNITNETTOIVACOMP: TIBOFloatField;
    QryAssCONTRATTO_IMPORTONETTO: TIBOFloatField;
    QryAssCONTRATTO_IMPORTONETTOIVACOMP: TIBOFloatField;
    QryIntPrecINABBONAMENTO: TStringField;
    btvPrecIntINABBONAMENTO: TcxGridDBBandedColumn;
    QryOPNUMAPPARECCHI: TIntegerField;
    btvOPNUMAPPARECCHI: TcxGridDBBandedColumn;
    QryAssEXIST_SCADSOFF: TStringField;
    btvAssistenzeICON_SCADSOFF: TcxGridDBBandedColumn;
    QryImpEXISTS_URGENTI: TStringField;
    QryImpEXISTS_STAMPATO: TStringField;
    tvImpegniEXISTS_URGENTI: TcxGridDBColumn;
    tvImpegniEXISTS_STAMPATO: TcxGridDBColumn;
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
    AssDal: TcxDateEdit;
    AssAl: TcxDateEdit;
    btvAssistenzeHIGHLIGHTS: TcxGridDBBandedColumn;
    QryAssHIGHLIGHTS: TStringField;
    MenuElencoClienti: TPopupMenu;
    Esportainformatotesto1: TMenuItem;
    EsportainformatoExcel1: TMenuItem;
    StaticText2: TStaticText;
    FilterTipoDataOP: TcxComboBox;
    QryAssDATAULTIMAMANUTENZIONE: TDateTimeField;
    btvAssistenzeDATAULTIMAMANUTENZIONE: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PanelAssFiltriResize(Sender: TObject);
    procedure SBAssFilterOpenCloseClick(Sender: TObject);
    procedure QryAssCalcFields(DataSet: TDataSet);
    procedure AssMesiNessunoClick(Sender: TObject);
    procedure AssMesiTuttiClick(Sender: TObject);
    procedure AssSaveDateFilterClick(Sender: TObject);
    procedure AssGenClick(Sender: TObject);
    procedure AssGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AssMesiTuttiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterAssTrovaKeyPress(Sender: TObject; var Key: Char);
    procedure FilterAbbonatiClickCheck(Sender: TObject);
    procedure FilterAbbonatiExit(Sender: TObject);
    procedure FilterAbbonatiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterPeriodicitaPropertiesInitPopup(Sender: TObject);
    procedure FilterTipoContrattoPropertiesInitPopup(Sender: TObject);
    procedure FilterCostruttorePropertiesInitPopup(Sender: TObject);
    procedure FilterLocalitaPropertiesInitPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControlAssistenzeChange(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure btvAssistenzeDblClick(Sender: TObject);
    procedure btvAssistenzeCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure BandHeaderMenuItemFissaNONEClick(Sender: TObject);
    procedure BandHeaderMenuPopup(Sender: TObject);
    procedure btvAssistenzeDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure btvAssistenzeTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure btvAssistenzeCustomDrawGroupCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure SBFilterRowClick(Sender: TObject);
    procedure btvAssistenzeCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure btvOPDataControllerDataModeControllerDetailFirst(
      Sender: TcxDBDataModeController; ADataSet: TDataSet;
      const AMasterDetailKeyFieldNames: String;
      const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
    procedure btvOPPRZUNITIVACOMPGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure QryIntPrecCalcFields(DataSet: TDataSet);
    procedure btvPrecIntDataControllerDataModeControllerDetailFirst(
      Sender: TcxDBDataModeController; ADataSet: TDataSet;
      const AMasterDetailKeyFieldNames: String;
      const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
    procedure btvPrecIntCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvPrecIntCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvPrecIntQTAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvPrescDataControllerDataModeControllerDetailFirst(
      Sender: TcxDBDataModeController; ADataSet: TDataSet;
      const AMasterDetailKeyFieldNames: String;
      const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
    procedure btvPrescCODICECustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvPrescDESCRIZIONECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvPrescRISOLTOCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvPrescEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure btvPrescRISOLTOPropertiesEditValueChanged(Sender: TObject);
    procedure tvImpegniDataControllerDataModeControllerDetailFirst(
      Sender: TcxDBDataModeController; ADataSet: TDataSet;
      const AMasterDetailKeyFieldNames: String;
      const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
    procedure QryPratAppCalcFields(DataSet: TDataSet);
    procedure tvAppTIPOAPPARECCHIOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvAppCOMPUTED_APPARECCHIO_FULLCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvAppANNOCOSTRUZIONECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvAppGARANZIA_SCADENZACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvAppDataControllerDataModeControllerDetailFirst(
      Sender: TcxDBDataModeController; ADataSet: TDataSet;
      const AMasterDetailKeyFieldNames: String;
      const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
    procedure btvAssistenzeDataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure btvAssistenzeDataControllerDetailCollapsed(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure btvOPCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure GridImpiantiLinkCustomDrawHeaderCell(
      Sender: TdxGridReportLink; ACanvas: TCanvas; AView: TcxGridTableView;
      AColumn: TcxGridColumn; AnItem: TdxReportCellString;
      var ADone: Boolean);
    procedure GridImpiantiLinkCustomDrawBandCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridBandedTableView; ABand: TcxGridBand;
      AnItem: TdxReportCellString; var ADone: Boolean);
    procedure GridImpiantiLinkCustomDrawCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AColumn: TcxGridColumn;
      AnItem: TAbstractdxReportCellData; var ADone: Boolean);
    procedure btvAssistenzeCONTRATTO_STATOGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btvAssistenzeDATAORAPROSSIMOAPPUNTAMENTOGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure dxPrinterCustomDrawPageHeader(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure dxPrinterCustomDrawPageFooter(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure btvAssistenzeTELEFONORESPIMPGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btvAssistenzeTELEFONOPROPGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btvAssistenzeTELEFONOUTGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btvAssistenzeTELEFONOINSTGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure btvAssistenzeCONTRATTO_IMPORTOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure PanelSelezioneColonneResize(Sender: TObject);
    procedure SbGcVisMem1Click(Sender: TObject);
    procedure TimerAddMemoryGCTimer(Sender: TObject);
    procedure SbGcVisMem1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SbGcVisMemAddClick(Sender: TObject);
    procedure SbGcVisMemSetPredefClick(Sender: TObject);
    procedure AssMesiNessunoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterTecnicoPreferitoPropertiesInitPopup(Sender: TObject);
    procedure btvAssistenzeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterTipoDataPropertiesInitPopup(Sender: TObject);
    procedure btvOPPROSSIMACustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvOPPRZUNITIVACOMPCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvAssistenzeMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btvAssistenzeICON_SCADSOFFGetCellHint(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
      var AHintText: TCaption; var AIsHintMultiLine: Boolean;
      var AHintTextRect: TRect);
    procedure tvImpegniEXISTS_URGENTIGetCellHint(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
      var AHintText: TCaption; var AIsHintMultiLine: Boolean;
      var AHintTextRect: TRect);
    procedure btvPrecIntDataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
      AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
    procedure Esportainformatotesto1Click(Sender: TObject);
    procedure EsportainformatoExcel1Click(Sender: TObject);
    procedure FilterModelloPropertiesInitPopup(Sender: TObject);
    procedure FilterTipoDataPropertiesChange(Sender: TObject);
    procedure btvPrecIntAPPARECCHIO_FULLGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure QryAssBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    // Array che contiene gli ID degli apparecchi che sono principali e i quali sono
    //  sono abbinati altri apparecchi. MI serve per impostare il campo COMPUTED_ABBINATO
    //  a True anche per gli articoli principali di un abbinamento.
    ElencoAbbinatiPrincipali: array of Integer;

    fMapForm: TGmapForm;
    fGestioneColoriNonAbbonati: Boolean;

    procedure EseguiQueryAssistenze;
    procedure CaricaFormLayout;
    procedure CreaMappa;
    function GetGroupTitle(AViewInfo: TcxGridTableCellViewInfo): String;
    procedure CustomDraw_GetCellBackgroundColor(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
    procedure CustomDraw_GetCellFont(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
    procedure CustomDraw_DrawCellBorder(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
    function Abbinato(CurrRecord: TcxCustomGridRecord): Boolean;
    function Abbinato_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
    function Abbinato_Ultimo(CurrRecord: TcxCustomGridRecord): Boolean;
    function Dismesso(CurrRecord: TcxCustomGridRecord): Boolean;
    function Dismesso_Primo(CurrRecord: TcxCustomGridRecord): Boolean;
    function IntegerInArray(const Value: Integer;
      const ArrayOfInteger: array of Integer): Boolean;
    procedure RefreshElencoAbbinatiPrincipali;
    function GetPrintFooterTitle(ARecord: TcxCustomGridRecord;
      InitialLevelIndex: Integer; SaltaUltimoLivello: Boolean=False): String;
    function GetGroupTextStyle(ALevel: Integer): TFontStyles;
    procedure StartSalvaVistaNelleMemorie;
    procedure StopSalvaVistaNelleMemorie;
    function ExtractOpID(const AFilterDescription: String): String;
  public
    { Public declarations }
    // Proprietà che punta alla form della mappa
    property MapForm:TGmapForm read fMapForm write fMapForm;

    procedure TrovaButtonClick(Sender: TObject); override;
    procedure ResetQueryButtonClick(Sender: TObject); override;
    procedure EliminaButtonClick(Sender: TObject); override;
    procedure ApriDocumento;
  end;

var
  TabImpiantiForm: TTabImpiantiForm;

implementation

uses DataModule1, SchedaClienti, DateUtils, IniFiles, main,
  DataModuleStyles, Types, StrUtils, FormPratica, FormImpegni,
  SchedaPreventiviOrdini, FormAllegatiFG, cxVariants, cxGridExportLink, FormConfirm;

{$R *.dfm}

procedure TTabImpiantiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  TabImpiantiForm := nil;
end;

procedure TTabImpiantiForm.FormCreate(Sender: TObject);
begin
  inherited;
  PageControlAssistenze.Align := alClient;
  CloseFilterPanel(PanelAssFiltri, SBAssFilterOpenClose, False);
  AssMesiNessunoClick(AssMesiNessuno);
end;

procedure TTabImpiantiForm.PanelAssFiltriResize(Sender: TObject);
begin
  inherited;
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TTabImpiantiForm.SBAssFilterOpenCloseClick(Sender: TObject);
begin
  inherited;
  if PanelAssFiltri.Tag = 1
  then CloseFilterPanel(PanelAssFiltri, SBAssFilterOpenClose)
  else OpenFilterPanel(PanelAssFiltri, SBAssFilterOpenClose);
end;


procedure TTabImpiantiForm.EseguiQueryAssistenze;
begin
      // Se i check di alcuni gruppi di filtri sono tutti NON CHECCKATI li checcka automaticamente tutti
      //  perchè altrimenti non visualizzerebbe nulla
      if not (FilterAbbonati.Checked[0] or FilterAbbonati.Checked[1] or FilterAbbonati.Checked[2] or FilterAbbonati.Checked[3]) then begin
         FilterAbbonati.Checked[0] := True;
         FilterAbbonati.Checked[1] := True;
         FilterAbbonati.Checked[2] := True;
         FilterAbbonati.Checked[3] := False;
      end;

      // Creazione query di ricerca
      QryAss.Close;
      QryAss.SQL.Clear;
      QryAss.SQL.Add('SELECT IV.* FROM IMPIANTI_LIST_VIEW IV');
      QryAss.SQL.Add('WHERE');
      QryAss.SQL.Add('1=1');

      // Tutte le installazioni del cliente come primo intestatario e compunque anche quelle dove compare come
      //  altro soggetto.
      //  NB: Se siamo in FastSelectionMode non deve essere filtrato per l'eventuale soggetto selezionato corrente
      if (not DM1.FastSelectionMode) and (ClientiForm.ClienteCorrente <> '')
      then QryAss.SQL.Add('AND ((IV.CODICEPROP = ' + ClientiForm.ClienteCorrente + ') OR (IV.CODICEUT = ' + ClientiForm.ClienteCorrente + ') OR (IV.CODICEINST = ' + ClientiForm.ClienteCorrente + '))');

      // In base al tipo impianto e alla periodicità
      if FilterTipoImpianto.Text <> '' then QryAss.SQL.Add('AND IV.TIPOIMPIANTO LIKE ''%' + FilterTipoImpianto.Text + '%''');
      if FilterPeriodicita.Text <> '' then QryAss.SQL.Add('AND IV.PERIODICITA = ' + FilterPeriodicita.Text);
      if FilterTipoContratto.Text <> '' then QryAss.SQL.Add('AND IV.CONTRATTO_TIPO LIKE ''%' + FilterTipoContratto.Text + '%''');

      // Filtro per tecnico
      //  NB: IL codice del tecnico è alla fine della stringa del filtro in posizione non visibile
      if FilterTecnicoPreferito.Text <> '' then QryAss.SQL.Add('AND IV.RESOURCEID = ' + Trim(RightStr(FilterTecnicoPreferito.Text, 6)));

      // In base a se l'impianto è in abbonamento oppure no
      if not FilterAbbonati.Checked[0]  then QryAss.SQL.Add('AND IV.CONTRATTO_STATO <> ''T''');
      if not FilterAbbonati.Checked[1]  then QryAss.SQL.Add('AND IV.CONTRATTO_STATO <> ''F''');
      if not FilterAbbonati.Checked[2]  then QryAss.SQL.Add('AND IV.CONTRATTO_STATO <> ''S''');
      if not FilterAbbonati.Checked[3]  then QryAss.SQL.Add('AND IV.CONTRATTO_STATO <> ''D''');

      // Se è in scadenza oppure no
      if FilterInScadenza.Checked[0] then QryAss.SQL.Add('AND IV.PROXVISITAENTRO <=' + QuotedStr(FormatDateTime('mm/dd/yyyy', Date + 30)));

      // Codici
      if FilterCodiceImpianto.Text <> '' then QryAss.SQL.Add('AND IV.CODICE = ' + Trim(FilterCodiceImpianto.Text));
      if FilterCodiceCatasto.Text <> '' then QryAss.SQL.Add('AND IV.CODICECATASTO LIKE ''%' + Trim(FilterCodiceCatasto.Text) + '%''');

      // Ubicazione
      if FilterLocalita.Text <> '' then DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.COMUNEIMM', FilterLocalita.Text, True);
      if FilterIndirizzo.Text <> '' then DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.INDIRIZZOIMM', FilterIndirizzo.Text, True);

      // Codice catasto
      if FilterCodiceCatasto.Text <> '' then QryAss.SQL.Add('AND IV.CODICECATASTO = ' + QuotedStr(Trim(FilterCodiceCatasto.Text)));
      // Matricola
      if FilterMatricola.Text <> '' then QryAss.SQL.Add('AND EXISTS(SELECT PA.ID FROM PRATAPPARECCHI PA WHERE PA.IDPRATICA=IV.ID AND PA.MATRICOLA LIKE ' + QuotedStr(Trim(FilterMatricola.Text)) + ')');
      // Costruttore
      if FilterCostruttore.Text <> '' then QryAss.SQL.Add('AND EXISTS(SELECT PA.ID FROM PRATAPPARECCHI PA WHERE PA.IDPRATICA=IV.ID AND PA.COSTRUTTORE LIKE ' + QuotedStr(Trim(FilterCostruttore.Text)) + ')');
      // Modello
      if FilterModello.Text <> '' then QryAss.SQL.Add('AND EXISTS(SELECT PA.ID FROM PRATAPPARECCHI PA WHERE PA.IDPRATICA=IV.ID AND PA.MODELLO LIKE ' + QuotedStr(Trim(FilterModello.Text)) + ')');


      // =======================================================================
      // RIcerche per data
      // -----------------------------------------------------------------------
      if FilterTipoData.Text = 'Prossimo intervento' then begin
        // ----------
        // Date (Controllo sulla data del PROSSIMOINTERVENTOPREVISTO
        if DM1.ControllaDataStr(AssDal.EditText) then begin
           QryAss.SQL.Add('AND IV.PROXVISITAENTRO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
        end;
        if DM1.ControllaDataStr(AssAl.EditText)  then begin
           //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
           //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
           //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
           QryAss.SQL.Add('AND IV.PROXVISITAENTRO < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
        end;
        // ----------
      end else if FilterTipoData.Text = 'Ultimo intervento' then begin
        // ----------
        // Date (Controllo sulla data dell'ultimo intervento eseguito
        if DM1.ControllaDataStr(AssDal.EditText) then begin
           QryAss.SQL.Add('AND IV.DATAULTIMOINTERVENTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
        end;
        if DM1.ControllaDataStr(AssAl.EditText)  then begin
           //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
           //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
           //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
           QryAss.SQL.Add('AND IV.DATAULTIMOINTERVENTO < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
        end;
        // ----------
      end else if FilterTipoData.Text = 'Ultima manutenzione' then begin
        // ----------
        // Date (Controllo sulla data dell'ultimo intervento DI MANUTENZIONE eseguito
        if DM1.ControllaDataStr(AssDal.EditText) then begin
           QryAss.SQL.Add('AND IV.DATAULTIMAMANUTENZIONE >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
        end;
        if DM1.ControllaDataStr(AssAl.EditText)  then begin
           //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
           //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
           //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
           QryAss.SQL.Add('AND IV.DATAULTIMAMANUTENZIONE < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
        end;
        // ----------
      end else if (  (LeftStr(FilterTipoData.Text, 4) = 'op: ') or (FilterTipoData.Text = 'Operazioni Pianificate')  )
      and (DM1.ControllaDataStr(AssDal.EditText) or DM1.ControllaDataStr(AssAl.EditText))
      then begin
        // ----------
        if FilterTipoDataOP.Text = 'Prossima volta' then
        begin
          QryAss.SQL.Add('/* --------------------------------------------------- */');
          QryAss.SQL.Add('AND EXISTS (');
//          QryAss.SQL.Add('SELECT OPP.ID FROM OPPRATICA OPP WHERE OPP.IDPRATICA=IV.ID AND OPP.DESCRIZIONE = ' + QuotedStr(RightStr(FilterTipoData.Text, Length(FilterTipoData.Text)-4)));
          QryAss.SQL.Add('SELECT OPP.ID FROM OPPRATICA OPP WHERE OPP.IDPRATICA=IV.ID');
          if FilterTipoData.Text <> 'Operazioni Pianificate' then
            QryAss.SQL.Add('AND OPP.IDOP = '  +  QuotedStr(ExtractOpID(FilterTipoData.Text))); //    + QuotedStr(RightStr(FilterTipoData.Text, Length(FilterTipoData.Text)-4)));
          if DM1.ControllaDataStr(AssDal.EditText) then
            QryAss.SQL.Add('AND OPP.PROSSIMA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
          if DM1.ControllaDataStr(AssAl.EditText) then
            QryAss.SQL.Add('AND OPP.PROSSIMA < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
          QryAss.SQL.Add(')');  // fine exists
          QryAss.SQL.Add('/* --------------------------------------------------- */');
        end
        else
        if FilterTipoDataOP.Text = 'Ultima volta (impianto)' then
        begin
          QryAss.SQL.Add('/* --------------------------------------------------- */');
          QryAss.SQL.Add('AND EXISTS (');
//          QryAss.SQL.Add('SELECT OPP.ID FROM OPPRATICA OPP WHERE OPP.IDPRATICA=IV.ID AND OPP.DESCRIZIONE = ' + QuotedStr(RightStr(FilterTipoData.Text, Length(FilterTipoData.Text)-4)));
          QryAss.SQL.Add('SELECT OPP.ID FROM OPPRATICA OPP WHERE OPP.IDPRATICA=IV.ID');
          if FilterTipoData.Text <> 'Operazioni Pianificate' then
            QryAss.SQL.Add('AND OPP.IDOP = '  +  QuotedStr(ExtractOpID(FilterTipoData.Text))); //    + QuotedStr(RightStr(FilterTipoData.Text, Length(FilterTipoData.Text)-4)));
          if DM1.ControllaDataStr(AssDal.EditText) then
            QryAss.SQL.Add('AND OPP.ULTIMA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
          if DM1.ControllaDataStr(AssAl.EditText) then
            QryAss.SQL.Add('AND OPP.ULTIMA < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
          QryAss.SQL.Add(')');  // fine exists
          QryAss.SQL.Add('/* --------------------------------------------------- */');
        end
        else
        if FilterTipoDataOP.Text = 'Ultima volta (intervento)' then
        begin
          QryAss.SQL.Add('/* --------------------------------------------------- */');
          QryAss.SQL.Add('AND EXISTS (');
//          QryAss.SQL.Add('SELECT OPI.ID FROM OPIMPEGNO OPI WHERE OPI.IDPRATICA=IV.ID AND OPI.DESCRIZIONE = ' + QuotedStr(RightStr(FilterTipoData.Text, Length(FilterTipoData.Text)-4)) + ' AND OPI.EFFETTUATA=''T''');
          QryAss.SQL.Add('SELECT OPP.ID FROM OPPRATICA OPP WHERE OPP.IDPRATICA=IV.ID');
          if FilterTipoData.Text <> 'Operazioni Pianificate' then
            QryAss.SQL.Add('AND OPP.IDOP = '  +  QuotedStr(ExtractOpID(FilterTipoData.Text))); //    + QuotedStr(RightStr(FilterTipoData.Text, Length(FilterTipoData.Text)-4)));
          if DM1.ControllaDataStr(AssDal.EditText) then begin
            QryAss.SQL.Add('AND (SELECT IMPEGNI.DATAORAINTERVENTO FROM IMPEGNI WHERE IMPEGNI.ID=OPI.IDIMPEGNO) >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
          end;
          if DM1.ControllaDataStr(AssAl.EditText) then begin
            QryAss.SQL.Add('AND (SELECT IMPEGNI.DATAORAINTERVENTO FROM IMPEGNI WHERE IMPEGNI.ID=OPI.IDIMPEGNO) < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
          end;
          QryAss.SQL.Add(')');  // fine exists
          QryAss.SQL.Add('/* --------------------------------------------------- */');
        end;
        // ----------
      end;
      // =======================================================================

      // Aggiunge la ricerca con campo TROVA
      if Trim(FilterAssTrova.Text) <> '' then begin
        DM1.AddSQL(QryAss, 'AND', '(');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.DESCRIZIONE', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.RIFPROP', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.RIFUT', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.RIFINST', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.RIFRESPIMP', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.NOTE', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.TELEFONORESPIMP', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.CELLULARERESPIMP', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.TELEFONOPROP', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.CELLULAREPROP', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.TELEFONOUT', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.CELLULAREUT', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.TELEFONOINST', FilterAssTrova.Text, False);
        QryAss.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(QryAss.SQL, 'IV.CELLULAREINST', FilterAssTrova.Text, False);
        QryAss.SQL.Add(')');
      end;

      // Apre la query
//QryAss.SQL.SaveToFile('c:\sql.sql');
      QryAss.Open;

      // Si posizione all'inizio
      btvAssistenze.DataController.GotoFirst;
end;




procedure TTabImpiantiForm.EsportainformatoExcel1Click(Sender: TObject);
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
        GridAssistenze.BeginUpdate;
        try;
          ExportGridToExcel(
                           FileNameNoExt,   // FileName senza estensione
                           GridAssistenze,          // cxGrid
                           False,           // AExpand
                           True,            // ASaveAll
                           True,
                           'xls'            // AFileExt
                          );
        finally
          GridAssistenze.EndUpdate;
        end;
        // =========================================================================
    finally
      DM1.CloseWait;
      DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;

procedure TTabImpiantiForm.Esportainformatotesto1Click(Sender: TObject);
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
        GridAssistenze.BeginUpdate;
        try;
          ExportGridToText(FileNameNoExt,                 // FileName senza estensione
                           GridAssistenze,                        // cxGrid
                           True,                          // AExpand
                           True,                          // ASaveAll
                           #9,                            // Separator
                           '',                            // Start field delimiter
                           ''                             // End field delimiter
                          );
        finally
          GridAssistenze.EndUpdate;
        end;
        // =========================================================================
    finally
      DM1.CloseWait;
      DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;

function TTabImpiantiForm.ExtractOpID(const AFilterDescription: String): String;
var
  LSepPos: Integer;
begin
  // Elimina la prima parte "op: "
  Result := Copy(AFilterDescription, 5, 999);
  // Trova la posizione del separatore tra ID e descrizione della OP
  LSepPos := Pos(' - ', Result);
  if LSepPos = 0 then
    raise Exception.Create('ExtractOpID: Separatore tra codice e descrizione della O.P. non trovato.');
  // Ritorna il codice della OP
  Result := LeftStr(Result, LSepPos-1);
end;

procedure TTabImpiantiForm.QryAssBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if not (DM1.ModCtrl(MOD_CONTATTI) > 1) then
    raise Exception.Create('Operazione non permessa per questo utente!');
  // Chiede conferma per l'eliminazione
  if not TConfirmForm.ConfirmationRequest(
    Format('Elimina %s', [QryAssDESCRIZIONE.AsString]),
    Format('Per confermare digita "elimina %s", poi clicca sul bottone "Conferma".', [QryAssDESCRIZIONE.AsString]),
    Format('elimina %s', [QryAssDESCRIZIONE.AsString]),
    600, 300)
    then
      Abort;
end;

procedure TTabImpiantiForm.QryAssCalcFields(DataSet: TDataSet);
var
   QuantoMancaAlProssimoIntervento : Integer;
   TmpStr, TmpStr2: String;
begin
   // IN base allo stato dell'abbonamento dell'impianto setta il colore con
   //  cui visualizzare la riga.
   // --------------------------------------------------------------------------
      // Solo se l'impianto è in abbonamento
      // NB: Ora anche gli impianto Non in abbonamento usano i colori
      if (QryAssCONTRATTO_STATO.AsString = 'T')
      or ((QryAssCONTRATTO_STATO.AsString = 'F') and fGestioneColoriNonAbbonati)
      then begin
         // Variabile che contiene i giorni mancanti all'ultimo giorno
         if not QryAssPROXVISITAENTRO.IsNull then begin
            QuantoMancaAlProssimoIntervento := Trunc((QryAssPROXVISITAENTRO.AsDateTime - Now));
         end else begin
            QuantoMancaAlProssimoIntervento := 300;  // Valore di default se non può calcolarlo
         end;
         // Se è già stato preso un appuntamento per la manutenzione programma visualizza la riga in blu
         if not QryAssDATAORAPROSSIMOAPPUNTAMENTO.IsNull then begin
            QryAssCOMPUTED_STATO.Value := 'App.preso';
         // Se il prossimo intervento previsto cade entro 15 gg da oggi, visualizza tutto rosso
         end else if QuantoMancaAlProssimoIntervento <= 15 then begin
           QryAssCOMPUTED_STATO.Value := 'Urgente';
         // Se il prossimo intervento previsto cade tra 15 e 30 gg da oggi, visualizza tutto arancione
         end else if QuantoMancaAlProssimoIntervento <= 30 then begin
           QryAssCOMPUTED_STATO.Value := 'In scadenza';
         // Se il prossimo intervento previsto cade oltre i 30 gg da oggi, visualizza tutto verde
         end else begin
           QryAssCOMPUTED_STATO.Value := 'Ok';
         end;
      // Se invece l'abbonamento è stato sospeso, lo visualizza in grigio
      end else if QryAssCONTRATTO_STATO.AsString = 'S' then begin
         QryAssCOMPUTED_STATO.Value := 'Sospeso';
      // Se l'impianto è stato dismesso
      end else if QryAssCONTRATTO_STATO.AsString = 'D' then begin
         QryAssCOMPUTED_STATO.Value := 'Dismesso';
      // Se invece non è abbonato per niente
      end else begin
         QryAssCOMPUTED_STATO.Value := '';
      end;
   // --------------------------------------------------------------------------

   // Compone il campo COMPUTED_NOTE
   TmpStr  := Trim(QryAssRESOURCENAME.AsString);
   TmpStr2 := Trim(QryAssNOTE.AsString);
   if TmpStr <> '' then TmpStr := 'Pref. ' + UpperCase(TmpStr);
   if (TmpStr <> '') and (TmpStr2 <> '') then TmpStr := TmpStr + ' - ';
   QryAssCOMPUTED_NOTE.Value := TmpStr + TmpStr2;
end;

procedure TTabImpiantiForm.TrovaButtonClick(Sender: TObject);
begin
  inherited;
  EseguiQueryAssistenze;
end;

procedure TTabImpiantiForm.ResetQueryButtonClick(Sender: TObject);
begin
  inherited;

        FilterAssTrova.Text           := '';
        FilterAbbonati.Checked[0]     := True;
        FilterAbbonati.Checked[1]     := True;
        FilterAbbonati.Checked[2]     := True;
        FilterAbbonati.Checked[3]     := False;
        FilterInScadenza.Checked[0]   := False;
        FilterCostruttore.Text        := '';
        FilterModello.Text            := '';
        FilterLocalita.Text           := '';
        FilterIndirizzo.Text          := '';
        FilterMatricola.Text          := '';
        FilterCodiceImpianto.Text     := '';
        FilterCodiceCatasto.Text      := '';
        AssDal.Text                   := '';
        AssAl.Text                    := '';
        FilterTipoImpianto.Text       := '';
        FilterPeriodicita.Text        := '';
        FilterTipoData.Text           := 'Prossimo intervento';
        FilterTipoContratto.Text      := '';
        FilterTecnicoPreferito.Text   := '';
        // Senza filtro per date che in questo caso è meglio
        AssMesiNessunoClick(AssMesiNessuno);
        // Chiude la FilterRow annullando tutti i filtri eventualmente attivi
        if btvAssistenze.FilterRow.Visible then begin
          SBFilterRow.Down := False;
          SBFilterRowClick(SBFilterRow);
        end;




     {
     if (PageControl2.ActivePage = TabAssistenze) or (RxSpeedButtonResetQuery.Tag > 1) then begin
        FilterAssTrova.Text           := '';
        FilterAbbonati.Checked[0]     := True;
        FilterAbbonati.Checked[1]     := True;
        FilterInScadenza.Checked[0]   := False;
        FilterCostruttore.Text        := '';
        FilterModello.Text            := '';
        FilterModello.Text            := '';
        FilterLocalita.Text           := '';
        FilterMatricola.Text          := '';
        FilterCodiceImpianto.Text     := '';
        FilterCodiceCatasto.Text      := '';
//        FilterNumCivico.Text          := '';
//        FilterCAP.Text                := '';
        AssDal.Text                   := '';
        AssAl.Text                    := '';
        FilterTipoImpianto.Text       := '';
        FilterPeriodicita.Text        := '';
        FilterTipoData.Text           := 'Prossimo intervento';
        FilterTipoContratto.Text      := '';
        // Senza filtro per date che in questo caso è meglio
        AssMesiNessunoClick(AssMesiNessuno);
        // Azzera la query
        if RxSpeedButtonResetQuery.Tag > 1 then begin
          QryAss.Close;
          // Forza la selezione dell'elenco in modo che se si era nella mappa questa venga distrutta
          if PageControlAssistenze.ActivePage = TabAssMappa then begin
            PageControlAssistenze.ActivePage := TabAssElenco;
            PageControlAssistenzeChange(PageControlAssistenze);
          end;
        end;
     end;
     }

end;

procedure TTabImpiantiForm.AssMesiNessunoClick(Sender: TObject);
begin
  inherited;
   AssDal.Clear;
   AssAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   AssGen.GroupIndex := 600;
   AssFeb.GroupIndex := 600;
   AssMar.GroupIndex := 600;
   AssApr.GroupIndex := 600;
   AssMag.GroupIndex := 600;
   AssGiu.GroupIndex := 600;
   AssLug.GroupIndex := 600;
   AssAgo.GroupIndex := 600;
   AssSet.GroupIndex := 600;
   AssOtt.GroupIndex := 600;
   AssNov.GroupIndex := 600;
   AssDic.GroupIndex := 600;
   AssGen.Down   := False;
   AssFeb.Down   := False;
   AssMar.Down   := False;
   AssApr.Down   := False;
   AssMag.Down   := False;
   AssGiu.Down   := False;
   AssLug.Down   := False;
   AssAgo.Down   := False;
   AssSet.Down   := False;
   AssOtt.Down   := False;
   AssNov.Down   := False;
   AssDic.Down   := False;
end;

procedure TTabImpiantiForm.AssMesiTuttiClick(Sender: TObject);
begin
  inherited;
   AssDal.EditText := DM1.FilterDataDalDefault;
   AssAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if AssMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      AssGen.GroupIndex := 901;
      AssFeb.GroupIndex := 902;
      AssMar.GroupIndex := 903;
      AssApr.GroupIndex := 904;
      AssMag.GroupIndex := 905;
      AssGiu.GroupIndex := 906;
      AssLug.GroupIndex := 907;
      AssAgo.GroupIndex := 908;
      AssSet.GroupIndex := 909;
      AssOtt.GroupIndex := 910;
      AssNov.GroupIndex := 911;
      AssDic.GroupIndex := 912;
      AssGen.Down   := False;
      AssFeb.Down   := False;
      AssMar.Down   := False;
      AssApr.Down   := False;
      AssMag.Down   := False;
      AssGiu.Down   := False;
      AssLug.Down   := False;
      AssAgo.Down   := False;
      AssSet.Down   := False;
      AssOtt.Down   := False;
      AssNov.Down   := False;
      AssDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      AssMesiTutti.Tag := 0;
//   end;
end;

procedure TTabImpiantiForm.AssSaveDateFilterClick(Sender: TObject);
begin
  inherited;
  DM1.SalvaDatePredefinitePerFiltri(AssDal.EditText, AssAl.EditText);
end;

procedure TTabImpiantiForm.AssGenClick(Sender: TObject);
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
      AssMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            AssDal.EditText := ' 01/01/' + IntToStr(AA);
            AssAl.EditText  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            AssDal.EditText := ' 01/02/' + IntToStr(AA);
            AssAl.EditText  := ' ' + IntToStr(DaysInAMonth(CurrentYear, 2)) + '/02/' + IntToStr(AA);
         end;
         3:begin
            AssDal.EditText := ' 01/03/' + IntToStr(AA);
            AssAl.EditText  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            AssDal.EditText := ' 01/04/' + IntToStr(AA);
            AssAl.EditText  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            AssDal.EditText := ' 01/05/' + IntToStr(AA);
            AssAl.EditText  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            AssDal.EditText := ' 01/06/' + IntToStr(AA);
            AssAl.EditText  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            AssDal.EditText := ' 01/07/' + IntToStr(AA);
            AssAl.EditText  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            AssDal.EditText := ' 01/08/' + IntToStr(AA);
            AssAl.EditText  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            AssDal.EditText := ' 01/09/' + IntToStr(AA);
            AssAl.EditText  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            AssDal.EditText := ' 01/10/' + IntToStr(AA);
            AssAl.EditText  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            AssDal.EditText := ' 01/11/' + IntToStr(AA);
            AssAl.EditText  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            AssDal.EditText := ' 01/12/' + IntToStr(AA);
            AssAl.EditText  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      AssDal.Text := '';
      AssAl.Text  := '';
   end;
end;

procedure TTabImpiantiForm.AssGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      AssGenClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabImpiantiForm.AssMesiTuttiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiTuttiClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabImpiantiForm.FilterAssTrovaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then ClientiForm.RxSpeedButtonTrovaClick(Self);
end;

procedure TTabImpiantiForm.FilterAbbonatiClickCheck(Sender: TObject);
begin
  inherited;
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TTabImpiantiForm.FilterAbbonatiExit(Sender: TObject);
begin
  inherited;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

procedure TTabImpiantiForm.FilterAbbonatiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   CheckIndex:Integer;
   CurrCheckListBox:TCheckListBox;
   i: Integer;
begin
  inherited;
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

procedure TTabImpiantiForm.FilterPeriodicitaPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(PERIODICITA) FROM PRATICHE');
      Qry.Open;
      FilterPeriodicita.Properties.Items.Clear;
      FilterPeriodicita.Properties.Items.Add('');
      while not Qry.Eof do begin
         FilterPeriodicita.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTabImpiantiForm.FilterTipoContrattoPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(CONTRATTO_TIPO) FROM PRATICHE');
      Qry.Open;
      FilterTipoContratto.Properties.Items.Clear;
      FilterTipoContratto.Properties.Items.Add('');
      while not Qry.Eof do begin
         FilterTipoContratto.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTabImpiantiForm.FilterCostruttorePropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(COSTRUTTORE) FROM PRATAPPARECCHI');
      Qry.Open;
      FilterCostruttore.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterCostruttore.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTabImpiantiForm.FilterLocalitaPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(COMUNEIMM) FROM PRATICHE');
      Qry.Open;
      FilterLocalita.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterLocalita.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;



procedure TTabImpiantiForm.FilterModelloPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(MODELLO) FROM PRATAPPARECCHI WHERE COSTRUTTORE LIKE ''%' + FilterCostruttore.Text + '%''');
      Qry.Open;
      FilterModello.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterModello.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTabImpiantiForm.CaricaFormLayout;
var
  LO: TMemIniFile;
  Sez: String;
begin
   // Caricamento di titoli e captions
   // NB: Per il momento non ci sono titoli
   //CaricaTitoli;
   // Apertura file layouts.ini
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
     // Determina se attivare o meno la gestione dei colori per gli
     //  impianti NON ABBONATI
     Sez := 'Impianti';
     fGestioneColoriNonAbbonati := LO.ReadBool(Sez, 'GestioneColoriNonAbbonati', True);

     // ========================================================================
     // Settaggio FILTRI AGENTI
     // ------------------------------------------------------------------------
     // NB: Per il momento non ci sono i campi
     // ========================================================================


     // ========================================================================
     // Settaggio GRID MODE per le griglie
     // ------------------------------------------------------------------------
     Sez := 'GridMode';
     btvAssistenze.DataController.DataModeController.GridMode  := LO.ReadBool(Sez, 'tvAssistenze', False);
     // ========================================================================


     // ========================================================================
     // Settaggio CELL AUTO HEIGHT per le griglie
     // ------------------------------------------------------------------------
     Sez := 'CellAutoHeight';
     btvAssistenze.OptionsView.CellAutoHeight  := LO.ReadBool(Sez, 'tvAssistenze', True);
     // ========================================================================

   finally
     LO.Free;
   end;
end;




procedure TTabImpiantiForm.FormShow(Sender: TObject);
var
  CurrMemoryButton: TSpeedButton;
begin
  inherited;
  // Carica il layout della form
  CaricaFormLayout;
  // Carica la memoria predefinita e la seleziona come default iniziale
  DM2.CaricaTitoliMemorie('MEMORIEIMPIANTI.INI', SbGcVisMem1, SbGcVisMem2, SbGcVisMem3, SbGcVisMem4, SbGcVisMem5, SbGcVisMem6, SbGcVisMem7, SbGcVisMem8, SbGcVisMem9, SbGcVisMem10);
  CurrMemoryButton := DM2.MemPredef_LoadSelection('MEMORIE_IMPIANTI', SbGcVisMem1, SbGcVisMem2, SbGcVisMem3, SbGcVisMem4, SbGcVisMem5, SbGcVisMem6, SbGcVisMem7, SbGcVisMem8, SbGcVisMem9, SbGcVisMem10);
  if Assigned(CurrMemoryButton) then DM2.RichiamaMemoria(GridAssistenze, btvAssistenze, CurrMemoryButton, QryAss, False);  // NB: L'ultimo parametro = False altrimenti eseguirebbe due volte l'interrogazione alla creazione della form
  // Ho notato che a volte perdeva il collegamento all'ImageList che contiene le icone usate nell'elenco e quindi
  //  per evitare problemi le irassegno sempre anche qui
  TcxCustomImageComboBoxProperties(btvAssistenzeICON_URGENTE.Properties).Images                 := DM2.ImpiantiListImages;
  TcxCustomImageComboBoxProperties(btvAssistenzeICON_PRESCRIZIONE.Properties).Images            := DM2.ImpiantiListImages;
  TcxCustomImageComboBoxProperties(btvAssistenzeICON_CHIAMATA.Properties).Images                := DM2.ImpiantiListImages;
  TcxCustomImageComboBoxProperties(btvAssistenzeICON_ALLEGATO.Properties).Images                := DM2.ImpiantiListImages;
  TcxCustomImageComboBoxProperties(btvAssistenzeCONTRATTO_DISDETTA_RICEVUTA.Properties).Images  := DM2.ImpiantiListImages;
  TcxCustomImageComboBoxProperties(btvAssistenzeCOMPUTED_CONTRATTO_SCADUTO.Properties).Images   := DM2.ImpiantiListImages;
  // Imposta visibile la prima pagina
  PageControlAssistenze.ActivePage := TabAssElenco;
  PageControlAssistenzeChange(PageControlAssistenze);
end;

procedure TTabImpiantiForm.PageControlAssistenzeChange(Sender: TObject);
begin
  inherited;
  // Se siamo nella pagina della mappa crea l'apposita form all'interno del Tab
  //  NB: Ovviamente se non esiste già
  if (PageControlAssistenze.ActivePage = TabAssMappa) then begin
    if not Assigned(MapForm) then CreaMappa;
  // Se ci spostiamo fuori dalla mappa la distrugge
  end else begin
    if Assigned(MapForm) then begin
      MapForm.Free;
      MapForm := nil;
    end;
  end;
end;



procedure TTabImpiantiForm.ApriDocumento;
var
  DC, MDC:TcxCustomDataController;
  RI, MRI:Integer;
begin

  // ===========================================================================
  // VISTA SELEZIONATA: btvAssistenze
  // ---------------------------------------------------------------------------
  if GridAssistenze.FocusedView = btvAssistenze then begin
    // Verifica che ci sia una selezione valida
    if  (Assigned(btvAssistenze.Controller.FocusedRecord))
    and (btvAssistenze.Controller.FocusedRecord.IsData)
    and (btvAssistenze.Controller.SelectedRecordCount > 0)
    then begin
      // Seleziona la pratica
      if (DM1.ModCtrl(MOD_CONTATTI) > 0) then begin
        // Seleziona l'impianto corrente
        ClientiForm.SelezionaSoggettoPratica(QryAssCODICERESPIMP.AsInteger, QryAssID.AsInteger);
        // Passa automaticamente alla pagina successiva
        ClientiForm.VaiAlTabDopoSelezioneImpianto;
      end;
    end;

  // ===========================================================================
  // VISTA SELEZIONATA: Appuntamenti / Chiamate
  // ---------------------------------------------------------------------------
  end else if (GridAssistenze.FocusedView.IsDetail) and (GridAssistenze.FocusedView.PatternGridView = tvImpegni) then begin
    // Verifica che ci sia una selezione valida
    if  (Assigned(TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord))
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord.IsData)
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).SelectedRecordCount > 0)
    and (not VarIsNull(GridAssistenze.FocusedView.DataController.Values[GridAssistenze.FocusedView.DataController.FocusedRecordIndex, tvImpegniID.Index]))
    then begin
      // RIcava il DataController e il FOcused Record Index
      DC := GridAssistenze.FocusedView.DataController;
      RI := DC.FocusedRecordIndex;
      // Apre l'impegno
      DM1.ShowWait('Levante', 'Operazione in corso...');
      try
        DM1.ApriImpegno(DC.Values[RI, tvImpegniID.Index]);
      finally
        DM1.CloseWait;
      end;
    end;

  // ===========================================================================
  // VISTA SELEZIONATA: Apparecchi
  // ---------------------------------------------------------------------------
  end else if (GridAssistenze.FocusedView.IsDetail) and (GridAssistenze.FocusedView.PatternGridView = tvApp) then begin
    // Verifica che ci sia una selezione valida
    if  (Assigned(TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord))
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord.IsData)
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).SelectedRecordCount > 0)
    then begin
      DM1.ShowWait(MainForm.NomeApplicazione, 'Operazione in corso...');
      try
        // RIcava il datacontroller del MasterRecord
        MDC := GridAssistenze.FocusedView.DataController.GetMasterDataController;
        MRI := GridAssistenze.FocusedView.DataController.GetMasterRecordIndex;
        // Apre l'anagrafica dell'impianto
        if (DM1.ModCtrl(MOD_CONTATTI) > 0) and (not VarIsNull(MDC.Values[MRI,btvAssistenzeCODICE.Index]) and (not VarIsNull(MDC.Values[MRI,btvAssistenzeDATAAPERTURA.Index]))) then begin
          // Crea e apre l'anagrafica dell'impianto
          DM1.VisualizzaAssistenza(MDC.Values[MRI,btvAssistenzeCODICE.Index], MDC.Values[MRI,btvAssistenzeDATAAPERTURA.Index], False);
          // ----------
          // Si sposta nella pagina voluta
          PraticaForm.MainPageControl.ActivePage := PraticaForm.TabApparecchi;
          // Ricava il DataController su cui effettuare la ricerca
          MDC := PraticaForm.btvApp.DataController;
          // RIcava il data controller da cui prendere il dato da ricercare
          DC := GridAssistenze.FocusedView.DataController;
          RI := DC.FocusedRecordIndex;
          // Metto il focus sull'elenco
          PraticaForm.GridApp.SetFocus;
          // Effettua la ricerca
          MDC.Search.Locate(PraticaForm.btvAppID.Index, DC.Values[RI,tvAppID.Index]);
        end;
      finally
        DM1.CloseWait;
      end;
    end;

  // ===========================================================================
  // VISTA SELEZIONATA: OP   Operazioni Pianificate
  // ---------------------------------------------------------------------------
  end else if (GridAssistenze.FocusedView.IsDetail) and (GridAssistenze.FocusedView.PatternGridView = btvOP) then begin
    // Verifica che ci sia una selezione valida
    if  (Assigned(TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord))
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord.IsData)
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).SelectedRecordCount > 0)
    then begin
      DM1.ShowWait(MainForm.NomeApplicazione, 'Operazione in corso...');
      try
        // RIcava il datacontroller del MasterRecord
        MDC := GridAssistenze.FocusedView.DataController.GetMasterDataController;
        MRI := GridAssistenze.FocusedView.DataController.GetMasterRecordIndex;
        // Apre l'anagrafica dell'impianto
        if (DM1.ModCtrl(MOD_CONTATTI) > 0) and (not VarIsNull(MDC.Values[MRI,btvAssistenzeCODICE.Index]) and (not VarIsNull(MDC.Values[MRI,btvAssistenzeDATAAPERTURA.Index]))) then begin
          // Crea e apre l'anagrafica dell'impianto
          DM1.VisualizzaAssistenza(MDC.Values[MRI,btvAssistenzeCODICE.Index], MDC.Values[MRI,btvAssistenzeDATAAPERTURA.Index], False);
          // ----------
          // Si sposta nella pagina voluta
          PraticaForm.MainPageControl.ActivePage := PraticaForm.TabOP;
          // Ricava il DataController su cui effettuare la ricerca
          MDC := PraticaForm.btvOP.DataController;
          // RIcava il data controller da cui prendere il dato da ricercare
          DC := GridAssistenze.FocusedView.DataController;
          RI := DC.FocusedRecordIndex;
          // Metto il focus sull'elenco
          PraticaForm.GridOP.SetFocus;
          // Effettua la ricerca
          MDC.Search.Locate(PraticaForm.btvOPID.Index, DC.Values[RI,btvOPID.Index]);
        end;
      finally
        DM1.CloseWait;
      end;
    end;

  // ===========================================================================
  // VISTA SELEZIONATA:  Precedenti
  // ---------------------------------------------------------------------------
  end else if (GridAssistenze.FocusedView.IsDetail) and (GridAssistenze.FocusedView.PatternGridView = btvPrecInt) then begin
    // Verifica che ci sia una selezione valida
    if  (Assigned(TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord))
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord.IsData)
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).SelectedRecordCount > 0)
    then begin
      DM1.ShowWait(MainForm.NomeApplicazione, 'Operazione in corso...');
      try
        // RIcava il DataController e il FOcused Record Index
        DC := GridAssistenze.FocusedView.DataController;
        RI := DC.FocusedRecordIndex;
        // Apre l'impegno
        DM1.ApriImpegno(DC.Values[RI, btvPrecIntNUMDOC.Index]);
        // ---------------------------------------------------------------------
        // Se è una relazione intervento sposta il focus su quel campo
        if DC.DisplayTexts[RI,btvPrecIntTIPORECORD.Index] = '10-RELAZIONE INTERVENTO' then begin
          ImpegnoForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_APPUNTAMENTO;
          ImpegnoForm.DBERelazioneIntervento.SetFocus;
          ImpegnoForm.DBERelazioneIntervento.Color := DM1.tvArtDetail_Selection.Color;
        // ---------------------------------------------------------------------
        // Se è una OP
        end else if DC.DisplayTexts[RI,btvPrecIntTIPORECORD.Index] = '20-OPERAZIONE PIANIFICATA' then begin
          ImpegnoForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_OPERAZIONIPIANIFICATE;
          // Ricava il DataController su cui effettuare la ricerca
          MDC := ImpegnoForm.btvOP.DataController;
          // Metto il focus sull'elenco
          ImpegnoForm.GridOP.SetFocus;
          // Disabilito la selezione della singola cella altrimenti siccome c'è ImmediateEditor = True mi andrebbe subito in editing sul campo e non mi piaceva
          ImpegnoForm.btvOP.OptionsSelection.CellSelect := False;
          try
            // Effettua la ricerca
            MDC.Search.Locate(ImpegnoForm.btvOPIDOP.Index, DC.Values[RI,btvPrecIntCODICE.Index]);
          finally
            // Riabilito la selezione della singola cella
            ImpegnoForm.btvOP.OptionsSelection.CellSelect := True;
          end;
        // ---------------------------------------------------------------------
        // Se è un rigo documento
        end else if DC.DisplayTexts[RI,btvPrecIntTIPORECORD.Index] = '30-RIGO DOCUMENTO' then begin
          ImpegnoForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_RICAMBIMANODOPERA;
          // Ricava il DataController su cui effettuare la ricerca
          MDC :=  PreventiviOrdiniForm.tvCorpo.DataController;
          // Metto il focus sull'elenco
          PreventiviOrdiniForm.GridCorpo.SetFocus;
          // Effettua la ricerca
          MDC.Search.Locate(PreventiviOrdiniForm.tvCorpoGUID.Index, DC.Values[RI,btvPrecIntGUID.Index]);
        // ---------------------------------------------------------------------
        // Se è una osservazione di un allegato
        end else if DC.DisplayTexts[RI,btvPrecIntTIPORECORD.Index] = '40-OSSERVAZIONI ALLEGATO' then begin
          ImpegnoForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_ALLEGATI;
          // Apre l'allegato
          Application.CreateForm(TAllegatiFGForm, AllegatiFGForm);
          AllegatiFGForm.Parent := MainForm;
          AllegatiFGForm.Tag := 1;
          AllegatiFGForm.ID := DC.Values[RI,btvPrecIntIDALLEGATOFG.Index];
          AllegatiFGForm.DataSourceFromImpegni := ImpegnoForm.SourceImp;
          AllegatiFGForm.FieldDataOraInizioIntervento := ImpegnoForm.QryImpDATAORAINTERVENTO;
          AllegatiFGForm.FieldDataOraFineIntervento   := ImpegnoForm.QryImpDATAORAFINEINTERVENTO;
          AllegatiFGForm.Show;
          // Sposta il focus sulle osservazioni
          AllegatiFGForm.cxDBMemoOsservazioni.SetFocus;
          AllegatiFGForm.cxDBMemoOsservazioni.Style.Color := DM1.tvArtDetail_Selection.Color;
        // ---------------------------------------------------------------------
        end
      finally
        DM1.CloseWait;
      end;
    end;

  // ===========================================================================
  // VISTA SELEZIONATA:  Prescrizioni / Raccomandazioni
  // ---------------------------------------------------------------------------
  end else if (GridAssistenze.FocusedView.IsDetail) and (GridAssistenze.FocusedView.PatternGridView = btvPresc) then begin
    // Verifica che ci sia una selezione valida
    if  (Assigned(TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord))
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).FocusedRecord.IsData)
    and (TcxGridTableController(GridAssistenze.FocusedView.Controller).SelectedRecordCount > 0)
    then begin
      DM1.ShowWait(MainForm.NomeApplicazione, 'Operazione in corso...');
      try
        // RIcava il DataController e il FOcused Record Index
        DC := GridAssistenze.FocusedView.DataController;
        RI := DC.FocusedRecordIndex;
        // Apre l'impegno
        DM1.ApriImpegno(DC.Values[RI, btvPrescIDIMPEGNO.Index]);
        // ---------------------------------------------------------------------
        // Se è una raccomandazione dell'intervento di sposta sul campo
        if DC.DisplayTexts[RI,btvPrescTIPORECORD.Index] = '10-RACCOMANDAZIONI INT.' then begin
          // NB: Per il momento non fa nulla perchè ancora non ho fatto i campi Raccomandazioni e Prescrizioni nell'intervento
        // ---------------------------------------------------------------------
        // Se è una prescrizione dell'intervento di sposta sul campo
        end else if DC.DisplayTexts[RI,btvPrescTIPORECORD.Index] = '20-PRESCRIZIONI INT.' then begin
          // NB: Per il momento non fa nulla perchè ancora non ho fatto i campi Raccomandazioni e Prescrizioni nell'intervento
        // ---------------------------------------------------------------------
        // Se è una raccomandazione da un allegato...
        end else if DC.DisplayTexts[RI,btvPrescTIPORECORD.Index] = '30-RACCOMANDAZIONI ALL' then begin
          ImpegnoForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_ALLEGATI;
          // Apre l'allegato
          Application.CreateForm(TAllegatiFGForm, AllegatiFGForm);
          AllegatiFGForm.Parent := MainForm;
          AllegatiFGForm.Tag := 1;
          AllegatiFGForm.ID := DC.Values[RI,btvPrescIDALLEGATO.Index];
          AllegatiFGForm.DataSourceFromImpegni := ImpegnoForm.SourceImp;
          AllegatiFGForm.FieldDataOraInizioIntervento := ImpegnoForm.QryImpDATAORAINTERVENTO;
          AllegatiFGForm.FieldDataOraFineIntervento   := ImpegnoForm.QryImpDATAORAFINEINTERVENTO;
          AllegatiFGForm.Show;
          // Sposta il focus sulle osservazioni
          AllegatiFGForm.cxDBMemoRaccomandazioni.SetFocus;
          AllegatiFGForm.cxDBMemoRaccomandazioni.Style.Color := DM1.tvArtDetail_Selection.Color;
        // ---------------------------------------------------------------------
        // Se è una prescrizione da un allegato...
        end else if DC.DisplayTexts[RI,btvPrescTIPORECORD.Index] = '40-PRESCRIZIONI ALL' then begin
          ImpegnoForm.TabControlPagineDocumento.TabIndex := DOCTABIDX_ALLEGATI;
          // Apre l'allegato
          Application.CreateForm(TAllegatiFGForm, AllegatiFGForm);
          AllegatiFGForm.Parent := MainForm;
          AllegatiFGForm.Tag := 1;
          AllegatiFGForm.ID := DC.Values[RI,btvPrescIDALLEGATO.Index];
          AllegatiFGForm.DataSourceFromImpegni := ImpegnoForm.SourceImp;
          AllegatiFGForm.FieldDataOraInizioIntervento := ImpegnoForm.QryImpDATAORAINTERVENTO;
          AllegatiFGForm.FieldDataOraFineIntervento   := ImpegnoForm.QryImpDATAORAFINEINTERVENTO;
          AllegatiFGForm.Show;
          // Sposta il focus sulle osservazioni
          AllegatiFGForm.dbePrescrizioni.SetFocus;
          AllegatiFGForm.dbePrescrizioni.Style.Color := DM1.tvArtDetail_Selection.Color;
        // ---------------------------------------------------------------------
        end
      finally
        DM1.CloseWait;
      end;
    end;
  // ===========================================================================
  end;
end;

procedure TTabImpiantiForm.SpeedButton18Click(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  for i := 0 to lvAssistenze.Count -1 do lvAssistenze.Items[i].Visible := False;
  btvAssistenze.ViewData.Expand(False);
  for i := 0 to lvAssistenze.Count -1 do lvAssistenze.Items[i].Visible := True;
end;

procedure TTabImpiantiForm.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  btvAssistenze.ViewData.Collapse(True);
end;

procedure TTabImpiantiForm.btvAssistenzeDblClick(Sender: TObject);
begin
  inherited;
  // Dunque, se non siamo in FastSelectionMode il DblClick apre il docuemento selezionato
  //  e seleziona anche il Soggetto/Pratica/Impianto corrente, se invece siamo in FastSelectionMode
  //  apre sempre il documento ma non seleziona il SOggetto/Pratica/IMpianto corrente perchè lo fa
  //  già al semplice Click
  //  Se però si è fatto doppioclick su una vista dettaglio allora passa
  if (not DM1.FastSelectionMode)
  or (GridAssistenze.FocusedView <> btvAssistenze)
  then begin
    if not ClientiForm.RxSpeedButtonVisualizza.Enabled then Exit;
    ClientiForm.RxSpeedButtonVisualizzaClick(ClientiForm.RxSpeedButtonVisualizza);
  end;
end;

procedure TTabImpiantiForm.EliminaButtonClick(Sender: TObject);
begin
  inherited;
  // Prosegue con l'eliminazione
  QryASS.Delete;
end;

procedure TTabImpiantiForm.CreaMappa;
var
  CurrMapForm: TGmapForm;
begin
  // Imposta la MapForm corrente
  CurrMapForm := MapForm;
  // Se siamo nella pagina della mappa crea l'apposita form all'interno del Tab
  //  NB: Ovviamente se non esiste già
  if (PageControlAssistenze.ActivePage = TabAssMappa) and not Assigned(CurrMapForm) then begin
    // Verifica selezione
    if btvAssistenze.Controller.SelectedRecordCount = 0 then begin
      DM1.Messaggi('Levante', 'Nessuna voce selezionata!', '', [mbOk], 0, nil);
      Exit;
    end;
    // Crea la form della mappa
    CurrMapForm := GMap_CreateInParent(TabAssMappa);
    // Show della form della mappa
    CurrMapForm.Show;
    // Costruisce e visualizza la mappa
    CurrMapForm.CreaMappa(btvAssistenze.Controller
                         ,btvAssistenzePROVINCIAIMM.Index
                         ,btvAssistenzeCOMUNEIMM.Index
                         ,btvAssistenzeCAPIMM.Index
                         ,btvAssistenzeINDIRIZZOIMM.Index
                         ,0);
  end;
end;
















// -----------------------------------------------------------------------------
// Funzione che ritorna il colore da usare come sfondo della cella in base alla situazione
procedure TTabImpiantiForm.CustomDraw_GetCellBackgroundColor(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
begin
  // Se la riga è espansa la visualizza con il colore di sfondo opportuno
  if AviewInfo.GridRecord.Expanded then begin
    ACanvas.Brush.Color := lvAssistenze.Styles.TabsBackground.Color;
    Exit;
  end;
  // Se il rigo del filtro (FilterRow) usa il colore specificato appositamente
  //  in ogni caso, anche se è il rigo selezionato che mi piace di più
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    ACanvas.Brush.Color := btvAssistenze.Styles.FilterRowInfoText.Color;
    Exit;
  end;
  // Se è un impianto dismesso lo sfondo è più scuro
  if (AViewInfo.GridRecord.DisplayTexts[btvAssistenzeCOMPUTED_STATO.Index] = 'Dismesso') and (not AviewInfo.Selected)
  then ACanvas.Brush.Color := $00BFBFBF;
end;

// Funzione che ritorna il Font (Anche il colore) della cella da disegnare
procedure TTabImpiantiForm.CustomDraw_GetCellFont(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
const
  COLORE_ROSSO  = $000000D7;
  COLORE_VERDE  = $00009700;
  COLORE_BLU    = clBlue;
  COLORE_GRIGIO = $00525252;
var
  ComputedStato: String;
  CurrColumn: TcxGridDBBandedColumn;
begin
  // Inizializzazione
  CurrColumn := AViewInfo.Item as TcxGridDBBandedColumn;
  ComputedStato := AViewInfo.GridRecord.DisplayTexts[btvAssistenzeCOMPUTED_STATO.Index];
  // Se è il record del fitro di ricerca modifica...
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    ACanvas.Font.Name   := 'Tahoma';
    ACanvas.Font.Size   := 8;
    ACanvas.Font.Style  := [];
    ACanvas.Font.Color := clBlack;
  // Se la cella è nella prima riga dell'elenco degli impianti (quella in evidenza e colorata)
  //  determina il colore da usare per il font
  //  NB: La colonna btvAssistenzeTIPOIMPIANTO in ogni caso viene trattata in secondo pianto anche se è nella prima riga.
  end else if (CurrColumn.Position.RowIndex = 0) and (CurrColumn <> btvAssistenzeTIPOIMPIANTO) then begin
    ACanvas.Font.Name   := 'Tahoma';
    ACanvas.Font.Size   := 8;
    if (CurrColumn = btvAssistenzePROXVISITAENTRO) or (CurrColumn = btvAssistenzeRIFRESPIMP)
    then ACanvas.Font.Style  := [fsBold]
    else ACanvas.Font.Style  := [];
    // Determina il colore del font per il record   fGestioneColoriNonAbbonati
    if      (ComputedStato = 'In scadenza') or (ComputedStato = 'Urgente')  then ACanvas.Font.Color := COLORE_ROSSO   // Rosso
    else if (ComputedStato = 'App.preso')                                   then ACanvas.Font.Color := COLORE_BLU     // Blue
    else if (ComputedStato = 'Sospeso') or (ComputedStato = 'Dismesso')     then ACanvas.Font.Color := COLORE_GRIGIO  // Grigio
    else if (ComputedStato = 'Ok')                                          then ACanvas.Font.Color := COLORE_VERDE   // COLORE_VERDE
    else ACanvas.Font.Color := clBlack;                                                                               // Verde
  // Se invece è nella seconda riga e quindi in secondo piano
  end else begin
    ACanvas.Font.Name   := 'Tahoma';
    ACanvas.Font.Size   := 7;
    ACanvas.Font.Style  := [];
    ACanvas.Font.Color  := COLORE_GRIGIO;
  end;
end;

// Procedure che disegna i bordi delle celle
procedure TTabImpiantiForm.CustomDraw_DrawCellBorder(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
var
  CurrColumn: TcxGridDBBandedColumn;
  BorderColor: TColor;
begin
  // Inizializzazione
  CurrColumn := AViewInfo.Item as TcxGridDBBandedColumn;

  // ===========================================================================
  // BORDI
  // ---------------------------------------------------------------------------
  // Determina il colore dei bordi
  BorderColor := (Sender.OptionsView as TcxGridBandedTableOptionsView).GridLineColor;
  // Bordo Dx di separazione tra bande
  if CurrColumn.IsLeft
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bLeft], 1);
  // Bordo Dx di separazione al bordo estremo a destra di tutta la griglia
  if CurrColumn.IsMostRight
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bRight], 1);
  // Bordo Inferiore dell'ultimo record
  if  CurrColumn.IsBottom
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bBottom], 1);
  // ===========================================================================

  // ===========================================================================
  // BORDI FILTER ROW
  // ---------------------------------------------------------------------------
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    // Determina il colore dei bordi
    BorderColor := (Sender.OptionsView as TcxGridBandedTableOptionsView).GridLineColor;
    // Separazione celle
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bLeft,bBottom], 1);
    if CurrColumn.IsRight then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bRight], 1);
  end;
  // ===========================================================================
end;
// -----------------------------------------------------------------------------


















procedure TTabImpiantiForm.btvAssistenzeCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  CurrColumn: TcxGridDBBandedColumn;
begin
  inherited;
  // Custom Draw
  ADone := True;
  // Inizializzazione
  CurrColumn := AViewInfo.Item as TcxGridDBBandedColumn;
  // Determina il Font (compreso il colore) da utilizzare in base alla situazione
  CustomDraw_GetCellFont(Sender, ACanvas, AViewInfo);
  // Determina il colore di sfondo
  CustomDraw_GetCellBackgroundColor(Sender, ACanvas, AViewInfo);
  // Disegna il contenuto della cella in modo standard
  AviewInfo.EditViewInfo.Font             := ACanvas.Font;
  AviewInfo.EditViewInfo.TextColor        := ACanvas.Font.Color;
  AviewInfo.EditViewInfo.BackgroundColor  := ACanvas.Brush.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Se è il campo dello STATO del CONTRATTO e il contratto è scaduto gli scrive
  //  anche SCADUTO in grassetto sulla DX
  //  NB: Questo non ha una colonna per se ma lo traccio nella colonna "ABBONATO"
  if (CurrColumn = btvAssistenzeCONTRATTO_STATO) and (AviewInfo.Text = 'ABBONATO') and (AViewInfo.GridRecord.Values[btvAssistenzeCOMPUTED_CONTRATTO_SCADUTO.Index] = 'T') then begin
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Color  := clBlack;
    ACanvas.DrawTexT('(SCADUTO)  ', AviewInfo.Bounds, cxAlignRight or cxAlignVCenter);
  end;
  // Procedure che disegna i bordi delle celle
  CustomDraw_DrawCellBorder(Sender, ACanvas, AViewInfo);
end;

procedure TTabImpiantiForm.BandHeaderMenuItemFissaNONEClick(Sender: TObject);
var
  CurrBand: TcxGridBand;
begin
  inherited;

  // Imposta il Check
  (Sender as TMenuItem).Checked := True;

  // Recupera un puntatore alla Band cliccata
  CurrBand := TcxGridBandHeaderHitTest(cxGridPopupMenu1.HitTest).Band;

  // In base alla voce scelta...
  if      Sender = BandHeaderMenuItemFissaNONE  then CurrBand.FixedKind := fkNone
  else if Sender = BandHeaderMenuItemFissaSX    then CurrBand.FixedKind := fkLeft
  else if Sender = BandHeaderMenuItemFissaDX    then CurrBand.FixedKind := fkRight;
end;


procedure TTabImpiantiForm.BandHeaderMenuPopup(Sender: TObject);
var
  CurrBand: TcxGridBand;
begin
  inherited;
  // Recupera un puntatore alla Band cliccata
  CurrBand := TcxGridBandHeaderHitTest(cxGridPopupMenu1.HitTest).Band;
  // Imposta il valore iniziale del menù
  if      CurrBand.FixedKind = fkNone  then BandHeaderMenuItemFissaNONE.Checked := True
  else if CurrBand.FixedKind = fkLeft  then BandHeaderMenuItemFissaSX.Checked   := True
  else if CurrBand.FixedKind = fkRight then BandHeaderMenuItemFissaDX.Checked   := True;
end;

procedure TTabImpiantiForm.btvAssistenzeDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  inherited;
  // Visualizza i totali
  LabelImpiantiCount.Caption := '(' + ASender.FooterSummaryTexts[0] + ' impianti presenti)';
end;

procedure TTabImpiantiForm.btvAssistenzeTcxGridDBDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
  inherited;
  AText := VarToStr(AValue) + ' impianti presenti';
end;

procedure TTabImpiantiForm.btvAssistenzeCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
  CurrColor: TColor;
  CurrItem: TcxCustomGridTableItem;
  RI: Integer;
  AValues: PVariant;
  AItems: TcxDataSummaryItems;
begin


  // Inizializzazione
  ADone := True;
  R := AViewInfo.TextAreaBounds;
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;

  // Colonna corrente
  CurrItem := Sender.GroupedItems[AViewInfo.GridRecord.Level];
  // Record Index Corrente
  RI := AViewInfo.GridRecord.RecordIndex;

  // RIcava i dati dei summaries del Group Corrente
  Sender.DataController.Summary.GetGroupSummaryInfo(AViewInfo.GridRecord.Index, AItems, AValues);

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Campo
  TmpStr := GetGroupTitle(AViewInfo);
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO + SPAZIO;

  // Impianti presenti
  R.Right := 650;
  TmpStr := VarToStr(Variant(AValues^)[0]) + '  impianti presenti';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);

end;


// Questa funzione ritorna la stringa da utilizzare come titolo a sx di ogni footer
//  in modo che i footers con i totali dei gruppi abbiano a sx un titolo che indica
//  in modo preciso a quali gruppi si riferiscono i totali.
function TTabImpiantiForm.GetGroupTitle(AViewInfo:TcxGridTableCellViewInfo): String;
var
  InitialLevelIndex, CurrentLevelIndex: Integer;
  Row: TcxCustomGridRecord;
  FooterTitle: String;
begin
  // Inizializzazione
  Result := '';
  // Contiene il LevelIndex del footer che si sta tracciando
  InitialLevelIndex := AViewInfo.GridRecord.Level;
  // ALl'inizio contiene lo stesso valore di InitialLevelIndex ma poi viene usato durante l'elaborazione
  //  per ciclare tra i livelli precedenti e comporre così il titolo completo con tutti i testi di tutti i gruppi
  //  di tutti i Livelli di gruppo ai quali il footer è relativo.
  CurrentLevelIndex := InitialLevelIndex;
  // Row punta alla Row del Footer attuale, poi successivamente punterà
  //  alle Parent Row per risalire i titoli dei gruppi di livello precedenti.
  Row := AViewInfo.GridRecord;
  // Cicla finchè Row punta ad una Row Valida e cioè risale ogni GroupLevel finchè ce
  //  ne sono.
  while (Row <> nil) and (CurrentLevelIndex >= 0) do begin
    // Solo se la Row è relativa ad un Footer (not Row.IsData).
    if (not Row.IsData) and (Row.Level <= InitialLevelIndex) then begin
      // Compone il testo da ritornare aggiungendo il titolo del gruppo attuale.
      if FooterTitle <> ''
      then FooterTitle := Row.DisplayTexts[0]  + '  >  ' + FooterTitle
      else FooterTitle := Row.DisplayTexts[0];
      // Risale al livello precedente
      Dec(CurrentLevelIndex);
    end;
    // Risale alla PArentRow della Row Attuale.
    Row := Row.ParentRecord;
  end;
  // Compone il titolo da ritornale
  Result := FooterTitle;
end;








procedure TTabImpiantiForm.SBFilterRowClick(Sender: TObject);
begin
  inherited;
  // Attiva/Disattiva la Filter Row
  btvAssistenze.FilterRow.Visible := (Sender as TSpeedButton).Down;
  if not btvAssistenze.FilterRow.Visible then btvAssistenze.DataController.Filter.Clear;
end;

procedure TTabImpiantiForm.btvAssistenzeCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

function TTabImpiantiForm.Abbinato(CurrRecord:TcxCustomGridRecord): Boolean;
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
function TTabImpiantiForm.Abbinato_Primo(CurrRecord:TcxCustomGridRecord): Boolean;
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
function TTabImpiantiForm.Abbinato_Ultimo(CurrRecord:TcxCustomGridRecord): Boolean;
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

// Function che ritorna True se il record ricevuto è in disuso
function TTabImpiantiForm.Dismesso(CurrRecord:TcxCustomGridRecord): Boolean;
begin
  Result := (not VarIsNull(CurrRecord.Values[tvAppDISMESSO.Index])) and (CurrRecord.Values[tvAppDISMESSO.Index] = 'T');
end;

// Function che ritorna True se il record ricevuto è il primo di quelli in disuso
function TTabImpiantiForm.Dismesso_Primo(CurrRecord:TcxCustomGridRecord): Boolean;
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

function TTabImpiantiForm.IntegerInArray(const Value:Integer; const ArrayOfInteger : array of Integer): Boolean;
var
 Loop : Integer;
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





// Procedure che aggiorna l'array che contiene l'elenco degli ID degli apparecchi principali
//  di un abbinamento.
//  NB: Mi serve per impostare a True il campo COMPUTER_ABBINATO := True anche per i record
//       relativi agliapparecchi principali ai quali sono abbinati altri articoli secondari.
procedure TTabImpiantiForm.RefreshElencoAbbinatiPrincipali;
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


procedure TTabImpiantiForm.btvOPDataControllerDataModeControllerDetailFirst(
  Sender: TcxDBDataModeController; ADataSet: TDataSet;
  const AMasterDetailKeyFieldNames: String;
  const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
begin
  inherited;
  // Se il parametro è già quello giusto
{
  if QryOP.Params.ParamByName('IDPRATICA').Value = AMasterDetailKeyValues then
  begin
    QryOP.First;
    Exit;
  end;
}
  // Altrimenti chiede la query, imposta i nuovi parametri e la riapre.
  QryOP.DisableControls;
  try
    QryOP.Active := False;
    QryOP.Params.ParamByName(AMasterDetailKeyFieldNames).Value := AMasterDetailKeyValues;
    QryOP.Active := True;
  finally
    QryOP.EnableControls;
  end;
  AReopened := True;
end;

procedure TTabImpiantiForm.btvOPPRZUNITIVACOMPGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // NOn visualizza gli zeri
  if VarIsNull(ARecord.Values[Sender.Index]) or (ARecord.Values[Sender.Index] = 0)
  then AText := '';
  // Se la OP è compresa nell'abbonamento e ovviamente l'impianto è sotto contratto...
  if  (VarToStr(ARecord.Values[btvOPINABBONAMENTO.Index]) = 'T')
  and (QryAssCONTRATTO_STATO.AsString = 'T')
  then AText := 'Abb.';
end;

procedure TTabImpiantiForm.QryIntPrecCalcFields(DataSet: TDataSet);
begin
  inherited;
  // Calcola i prezziunitari netti
  if QryIntPrecQTA.AsFloat <> 0 then begin
    QryIntPrecCALC_PRZUNITNETTO.Value         := DM1.Arrotonda(   (QryIntPrecIMPORTO.AsFloat / QryIntPrecQTA.AsFloat)   , DM1.DecMicroPrz);
    QryIntPrecCALC_PRZUNITIVACOMPNETTO.Value  := DM1.Arrotonda(   (QryIntPrecIMPORTOIVACOMP.AsFloat / QryIntPrecQTA.AsFloat)   , DM1.DecMicroPrz);
  end else begin
    QryIntPrecCALC_PRZUNITNETTO.Value         := 0;
    QryIntPrecCALC_PRZUNITIVACOMPNETTO.Value  := 0;
  end;
end;

procedure TTabImpiantiForm.btvPrecIntDataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
var
  Date1, Date2: TDateTime;
begin
  inherited;
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

procedure TTabImpiantiForm.btvPrecIntDataControllerDataModeControllerDetailFirst(
  Sender: TcxDBDataModeController; ADataSet: TDataSet;
  const AMasterDetailKeyFieldNames: String;
  const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
begin
  inherited;
  // Se il parametro è già quello giusto
{
  if QryIntPrec.Params.ParamByName('PRATICA').Value = AMasterDetailKeyValues then
  begin
    QryIntPrec.First;
    Exit;
  end;
}
  // Altrimenti chiede la query, imposta i nuovi parametri e la riapre.
  QryIntPrec.DisableControls;
  try
    QryIntPrec.Active := False;
    QryIntPrec.Params.ParamByName('PRATICA').Value := AMasterDetailKeyValues[0];
    QryIntPrec.Params.ParamByName('DATAPRATICA1').Value := AMasterDetailKeyValues[1];
    QryIntPrec.Active := True;
  finally
    QryIntPrec.EnableControls;
  end;
  AReopened := True;
end;

procedure TTabImpiantiForm.btvPrecIntCustomDrawGroupCell(
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
//  ACanvas.FillRect(AViewInfo.Bounds);
  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, DM1.tvArtDetail_Content.Color, DM1.tvArtDetail_Selection.Color, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;
  // Rif. + TipoDocumento
  TmpStr := '   Rif. ' + Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntTIPODOC.Index] + ' del ';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Data documento
  TmpStr := LeftStr(   Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrecIntDATADOC.Index]   , 10);
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

procedure TTabImpiantiForm.btvPrecIntAPPARECCHIO_FULLGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if Trim(AText) = '()' then
    AText := '';
end;

procedure TTabImpiantiForm.btvPrecIntCustomDrawCell(
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
  ACanvas.Font.Size  := 8;

  // Se è una riga di Operazioni pianificate...
  if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '20-OPERAZIONE PIANIFICATA') then begin
    ACanvas.Font.Style := [fsItalic];
  // Se è una riga di Relazione Intervento
  end else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '10-RELAZIONE INTERVENTO') then begin
    ACanvas.Font.Style := [fsItalic];
  // Se è una riga di Analisi Fumi
  end else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '15-ANALISI FUMI ALLEGATO') then begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Size := 7;
  // Se è una riga di Osservazioni
  end else if (AViewInfo.GridRecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '40-OSSERVAZIONI ALLEGATO') then begin
    ACanvas.Font.Style := [fsBold];
    ACanvas.Brush.Color := DM1.tvArtDetail_ContentHighlight.Color;
  end;

  // Imposta i parametri e traccia il contenuto della cella
  AviewInfo.EditViewInfo.Font := ACanvas.Font;
  AviewInfo.EditViewInfo.TextColor := ACanvas.Font.Color;
  AviewInfo.EditViewInfo.BackgroundColor := ACanvas.Brush.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas); // Paint the default cell's contents

  // Se è l'ultima riga prima di un cambio apparecchio disegna una linea di separazione
  if  (AViewInfo.GridRecord.RecordIndex < (Sender.DataController.RecordCount-1))
  and (AViewInfo.GridRecord.DisplayTexts[btvPrecIntIDAPPARECCHIOPRAT.Index] <> Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex+1, btvPrecIntIDAPPARECCHIOPRAT.Index])
  and (AViewInfo.GridRecord.DisplayTexts[btvPrecIntMASTER_ID.Index] = Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex+1, btvPrecIntMASTER_ID.Index])
  then
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TTabImpiantiForm.btvPrecIntQTAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // IN questi casi non visualizza nulla
  if (   (not VarIsNull(ARecord.Values[Sender.Index])) and (ARecord.Values[Sender.Index] = 0)   )
  or ((ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '20-OPERAZIONE PIANIFICATA') and (Sender.Index = btvPrecIntQTA.Index))
  or (ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '30-RELAZIONE INTERVENTO')
  or (ARecord.DisplayTexts[btvPrecIntTIPORECORD.Index] = '40-OSSERVAZIONI ALLEGATO')
  then AText := '';
  // Se è una OP in abbonamento visualizza "Abb." e stiamo visualizzando un importo
//  if  (ARecord.DisplayTexts[btvPrecIntINABBONAMENTO.Index] = 'T')
//  and ((Sender = btvPrecIntCALC_PRZUNITIVACOMPNETTO) or (Sender = btvPrecIntCALC_PRZUNITNETTO))
//  then AText := 'Abb.';
end;

procedure TTabImpiantiForm.btvPrescDataControllerDataModeControllerDetailFirst(
  Sender: TcxDBDataModeController; ADataSet: TDataSet;
  const AMasterDetailKeyFieldNames: String;
  const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
begin
  inherited;
  // Se il parametro è già quello giusto
{
  if QryPresc.Params.ParamByName('PRATICA').Value = AMasterDetailKeyValues then
  begin
    QryPresc.First;
    Exit;
  end;
}
  // Altrimenti chiede la query, imposta i nuovi parametri e la riapre.
  QryPresc.DisableControls;
  try
    QryPresc.Active := False;
    QryPresc.Params.ParamByName('PRATICA').Value := AMasterDetailKeyValues[0];
    QryPresc.Params.ParamByName('DATAPRATICA1').Value := AMasterDetailKeyValues[1];
    QryPresc.Active := True;
  finally
    QryPresc.EnableControls;
  end;
  AReopened := True;
end;

procedure TTabImpiantiForm.btvPrescCODICECustomDrawCell(
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
//  ACanvas.Font.Color := clGray;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Data
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrescDATADOC.Index];
  ACanvas.Font.Style := [fsBold];
//  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Label Tecnico
  TmpStr := 'Tecnico:';
  ACanvas.Font.Style := [];
//  ACanvas.Font.Color := clGray;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Tecnico
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrescTECNICO_NOME.Index];
  ACanvas.Font.Style := [fsBold];
//  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Le prossime a DX
  R.Right := R.Right - 5;
  // Apparecchio
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,btvPrescAPPARECCHIO_FULL.Index];
  ACanvas.Font.Style := [fsBold];
//  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
  // Label Apparecchio:
  TmpStr := 'Apparecchio:';
//  ACanvas.Font.Color := clGray;
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
  R.Right := R.Right - ACanvas.TextWidth(TmpStr) - SPAZIO;
end;

procedure TTabImpiantiForm.btvPrescDESCRIZIONECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
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

procedure TTabImpiantiForm.btvPrescRISOLTOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  ADone := True;
  // Lo sfondo è fisso e non fa vedere la selezione
  AViewInfo.EditViewInfo.BackgroundColor := AViewInfo.Item.Styles.Content.Color;
  // Imposta i parametri e traccia il contenuto della cella
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Disegna la riga di separazione inferione
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, TcxGridDBBandedTableView(Sender).OptionsView.GridLineColor, [bBottom], 1);
end;

procedure TTabImpiantiForm.btvPrescEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := (AItem.Index = btvPrescRISOLTO.Index);
end;

procedure TTabImpiantiForm.btvPrescRISOLTOPropertiesEditValueChanged(
  Sender: TObject);
var
  RI: Integer;
  DC: TcxCustomDataController;
  TipoRecord: String;
begin
  // Inizializzazione
  DC := GridAssistenze.FocusedView.DataController;
  RI := DC.FocusedRecordIndex;
  // Se la prescrizione attuale è marcata come risolta...
  if TcxCustomEdit(Sender).EditingValue then
  begin
    DC.Cancel; // Altrimenti non mi salva poi la data di risoluzione del problema e mi da un errore
    DM2.ChiediConfermaPrescrizioneRisolta(DC, RI, btvPrescRISOLTO.Index, btvPrescFATTO_DATA.Index, btvPrescFATTO_NOTE.Index);
    // Se la prescrizione/raccomandazione attuale è stata selesionata dall'utente
    //  come fatta/risolta provvede a marcarca altrimenti la salta
    if (not VarIsNull(DC.Values[RI,btvPrescRISOLTO.Index])) and (DC.Values[RI,btvPrescRISOLTO.Index] = True) then
    begin
      // Carica il Tipo record del record attuale
      TipoRecord := DC.Values[RI,btvPrescTIPORECORD.Index];
      // Se è una raccomandazione di un impegno
      if      TipoRecord = '10-RACCOMANDAZIONI INT.' then
        DM2.RaccomandazioniImpegno_MarcaComeFatta(DC.Values[RI,btvPrescIDIMPEGNO.Index], DC.Values[RI,btvPrescFATTO_DATA.Index], DC.DisplayTexts[RI,btvPrescFATTO_NOTE.Index])
      // Se è una prescrizione di un impegno
      else if TipoRecord = '20-PRESCRIZIONI INT.' then
        DM2.PrescrizioniImpegno_MarcaComeFatta(DC.Values[RI,btvPrescIDIMPEGNO.Index], DC.Values[RI,btvPrescFATTO_DATA.Index], DC.DisplayTexts[RI,btvPrescFATTO_NOTE.Index])
      // Se è una raccomandazione di un allegato
      else if TipoRecord = '30-RACCOMANDAZIONI ALL' then
        DM2.RaccomandazioniAllegato_MarcaComeFatta(DC.Values[RI,btvPrescIDALLEGATO.Index], DC.Values[RI,btvPrescFATTO_DATA.Index], DC.DisplayTexts[RI,btvPrescFATTO_NOTE.Index])
      // Se è una prescrizione di un allegato
      else if TipoRecord = '40-PRESCRIZIONI ALL' then
        DM2.PrescrizioniAllegato_MarcaComeFatta(DC.Values[RI,btvPrescIDALLEGATO.Index], DC.Values[RI,btvPrescFATTO_DATA.Index], DC.DisplayTexts[RI,btvPrescFATTO_NOTE.Index]);
      // Aggiorna il dataset di dettaglio
      // NB: Lascio commentate le due righe sotto perchè altrimenti dava un AV perchè la chiamata a ClearDetails distruggeva
      //      tutte le viste di dettaglio che invece alla griglia evidentemente servono ancora. Facendo così la visualizzazione
      //      non si aggiorna finchè non si clicca su "Triva" cioè l'iconcina "P" continua a rimanere anche se si è marcata la
      //      prescrizione/raccomandazione come fatta (ma sempre meglio dell'errore)
      DC.Refresh;
//      DC.GetMasterDataController.ClearDetails;
    end;
  end;
end;

procedure TTabImpiantiForm.tvImpegniDataControllerDataModeControllerDetailFirst(
  Sender: TcxDBDataModeController; ADataSet: TDataSet;
  const AMasterDetailKeyFieldNames: String;
  const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
begin
  inherited;
  // Chiuede la query, imposta i nuovi parametri e la riapre.
  QryImp.DisableControls;
  try
    QryImp.Active := False;
    QryImp.Params.ParamByName('PRATICA').Value := AMasterDetailKeyValues[0];
    QryImp.Params.ParamByName('DATAPRATICA1').Value := AMasterDetailKeyValues[1];
    QryImp.Active := True;
  finally
    QryImp.EnableControls;
  end;
  AReopened := True;
end;

procedure TTabImpiantiForm.QryPratAppCalcFields(DataSet: TDataSet);
var
  InGaranzia, TmpStr, TmpStr2: String;
begin
  // Imposta i campi per l'ordinamento in modo che se un apparecchio è abbinato ad un altro
  //  venga sempre messo vicino ma dopo l'apparecchio principale
  if QryPratAppIDAPPABBINATO.IsNull or (QryPratAppIDAPPABBINATO.AsInteger = 0) or (QryPratAppDISMESSO.AsString = 'T') then begin
    QryPratAppCOMPUTED_ORDER1.Value   := QryPratAppID.Value;
    QryPratAppCOMPUTED_ORDER2.Value   := 0;
    QryPratAppCOMPUTED_ABBINATO.Value := IntegerInArray(QryPratAppCOMPUTED_ORDER1.Value, ElencoAbbinatiPrincipali);
  end else begin
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

procedure TTabImpiantiForm.tvAppTIPOAPPARECCHIOCustomDrawCell(
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
  ACanvas.Font.Size   := 7;

  //  NB: Un pò più a destra per la colonna TIPOAPPARECCHIO
  R := AViewInfo.TextAreaBounds;
  R.Left := R.Left + 14;

  // Se si tratta di un apparecchio dismesso disegna lo sfondo di un colore più scuro
  if (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Brush.Color := $00D3D3D3;
  // Se invece è un rigo selezionato
  end else if AViewInfo.Selected then begin
    ACanvas.Brush.Color := tvApp.Styles.Selection.Color;
  // Altrimenti usa il colore del Background che è più chiaro e mi piace di più
  end else begin
    ACanvas.Brush.Color := tvApp.Styles.Background.Color;
  end;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  //----------------------------------------------------------------------------
  // Memorizza il colore del Brush del Canvas per poi ripristinarlo (altrimenti cambiava)
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
    ACanvas.Font.Color := clGray;
    ACanvas.DrawTexT(AViewInfo.Text, R, cxAlignLeft or cxAlignVCenter);
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
  ACanvas.Pen.Color := TcxGridTableOptionsView(Sender.OptionsView).GridLineColor;
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

procedure TTabImpiantiForm.tvAppCOMPUTED_APPARECCHIO_FULLCustomDrawCell(
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
  // Se invece è un rigo selezionato
  end else if AViewInfo.Selected then begin
    ACanvas.Brush.Color := tvApp.Styles.Selection.Color;
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
  end else begin
    FontColor_PrimoPiano := Sender.Styles.Content.TextColor;
    FontColor_NoteGray := Sender.Styles.Content.TextColor;
    FontColor_NoteBlack := Sender.Styles.Content.TextColor;
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

procedure TTabImpiantiForm.tvAppANNOCOSTRUZIONECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  R: TRect;
  TmpStr: String;
begin
  ADone := True;

  // COLORE DI SFONDO
  // Se si tratta di un apparecchio dismesso disegna lo sfondo di un colore più scuro
  if (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Brush.Color := $00D3D3D3;
  // Se invece è un rigo selezionato
  end else if AViewInfo.Selected then begin
    ACanvas.Brush.Color := tvApp.Styles.Selection.Color;
  // Altrimenti usa il colore del Background che è più chiaro e mi piace di più
  end else begin
    ACanvas.Brush.Color := tvApp.Styles.Background.Color;
  end;
  // DIsegna lo sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  // COLORE DEL FONT
  // In base alla dismissione o meno dell'apparecchio imposta il colore del font.
  if          (AViewInfo.GridRecord.DisplayTexts[tvAppDISMESSO.Index] = 'T') then begin
    ACanvas.Font.Color := clGray;
  end;

  // Testo
  TmpStr := AviewInfo.GridRecord.DisplayTexts[tvAppANNOCOSTRUZIONE.Index];
  ACanvas.Font.Name := 'Verdana';
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

procedure TTabImpiantiForm.tvAppGARANZIA_SCADENZACustomDrawCell(
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
  // Se invece è un rigo selezionato
  end else if AViewInfo.Selected then begin
    ACanvas.Brush.Color := tvApp.Styles.Selection.Color;
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
        ACanvas.Font.Style := [fsBold];
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

procedure TTabImpiantiForm.tvAppDataControllerDataModeControllerDetailFirst(
  Sender: TcxDBDataModeController; ADataSet: TDataSet;
  const AMasterDetailKeyFieldNames: String;
  const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
begin
  inherited;
  // Se il parametro è già quello giusto
{
  if QryPratApp.Params.ParamByName('PRATICA').Value = AMasterDetailKeyValues then
  begin
    QryPratApp.First;
    Exit;
  end;
}
  // Altrimenti chiede la query, imposta i nuovi parametri e la riapre.
  QryPratApp.DisableControls;
  try
    QryPratApp.Active := False;
    QryPratApp.Params.ParamByName('IDPRATICA').Value := AMasterDetailKeyValues;
    QryPratApp.Active := True;
  finally
    QryPratApp.EnableControls;
  end;
  AReopened := True;

end;

procedure TTabImpiantiForm.btvAssistenzeDataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
var
  RowIndex: Integer;
begin
  inherited;

  // Inizializzazione
  RowIndex := ADataController.GetRowIndexByRecordIndex(ARecordIndex, False);
  // Prima chiude gli eventuali altri records expanded perchè altrimenti ho
  //  paura che l'utente faccia confusione.
  //  NB: Solo se non stiamo tenendo premuti CTRL o SHIFT per fare una selezione
  //       multipla altrimenti mi perde quelli già selezionati
  ADataController.CollapseDetails;

  // Focused e selezione sul record che si sta espandendo e deseleziona tutti gli altri
  //  NB: Deseleziona gli altri solo se non stiamo tenendo premuti CTRL o SHIFT per fare una selezione
  //       multipla altrimenti mi perde quelli già selezionati
  if (not DM2.isCtrlDown) and (not DM2.isShiftDown)
  then ADataController.ClearSelection;
  ADataController.FocusedRecordIndex := ARecordIndex;
  ADataController.SelectRows(RowIndex, RowIndex);

  // Se siamo in FastSelectionMode seleziona anche il soggetto/pratica/impianto
  //  corrente perchè altrimenti espandendo un record non lo facesa da solo
  if DM1.FastSelectionMode then ClientiForm.RxSpeedButtonVisualizzaClick(ClientiForm.RxSpeedButtonVisualizza);

  // Attiva le query dei dettagli se non lo sono già
  //  NB: Prima era nell'evento onAfterOpen della query dell'elenco impianti
  //       ma ò'ho spostata qui perchè così viene eseguito solo se necessario
  //       con un elleggerimento dell'apertura dell'elenco perchè era un pò lento.
  //  NB: Visualizza un messaggio di attesa per l'operatore solo se necessario altrimenti era troppo invadente e non mi piacera.
  if (not QryPratApp.Active)
  or (not QryOP.Active)
  or (not QryIntPrec.Active)
  or (not QryPresc.Active)
  or (not QryImp.Active)
  then DM1.ShowWait('Levante', 'Caricamento...');
  try
    if not QryPratApp.Active  then QryPratApp.Open;
    if not QryOP.Active       then QryOP.Open;
    if not QryIntPrec.Active  then QryIntPrec.Open;
    if not QryPresc.Active    then QryPresc.Open;
    if not QryImp.Active      then QryImp.Open;
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabImpiantiForm.btvAssistenzeDataControllerDetailCollapsed(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
var
  i: Integer;
begin
  inherited;
  // Elimina tutti i Details in modo che se vengono riaperti vengano
  //  ricreati nuovi e quindi eventualmente aggiornati (prima non si aggiornavano mai).
  for i := 0 to lvAssistenze.Count -1 do ADataController.ClearDetailLinkObject(ARecordIndex, i);
end;

procedure TTabImpiantiForm.btvOPCustomDrawGroupCell(
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
  //  NB: Se questo group è generale per l'impianto e cioè non specifico di qualche
  //  apparecchio...
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, DM1.tvArtDetail_Content.Color, DM1.tvArtDetail_Selection.Color, 30, True);
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

procedure TTabImpiantiForm.GridImpiantiLinkCustomDrawHeaderCell(
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
    AFont.Size := 8 * AScale;
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
    if (AColumn.Tag = 1) or (AColumn.IsRight) then begin
      R.Left   := AnItem.BoundsRect.Right;
      R.Top    := AnItem.BoundsRect.Top;
      R.Right  := AnItem.BoundsRect.Right;
      R.Bottom := AnItem.BoundsRect.Bottom;
      Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
    end;
    // BORDO SX
    if (AColumn.IsLeft) then begin
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

procedure TTabImpiantiForm.GridImpiantiLinkCustomDrawBandCell(
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
    AFont.Size := 8 * AScale;
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

procedure TTabImpiantiForm.GridImpiantiLinkCustomDrawCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas;
  AView: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AColumn: TcxGridColumn; AnItem: TAbstractdxReportCellData;
  var ADone: Boolean);
const
  SFONDO_HIGHLIGHT = $00E6E6E6;
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
  ColoreSfondo: TColor;
  ImageIndex: integer;
begin
  inherited;

  if AView.IsDetail then Exit;

  // Inizializzazione
  ADone := True;
  AScale := Sender.RealScaleFactor div 2;
  AFont := TFont.Create;
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

      // Determina il colore da usare come sfondo
      //  Se la banda della colonna attuale è tra quelle che devono avere lo sfondo grigio...
      if Assigned(LocalColumn.Position.Band.Styles.Content) and (LocalColumn.Position.Band.Styles.Content.Color <> clWhite)
      then ColoreSfondo := SFONDO_HIGHLIGHT
      else ColoreSfondo := clWhite;
      // Disegna il rettangolo di sfondo se il colore dello sfondo è <> dal bianco
      if ColoreSfondo <> clWhite then begin
        ACanvas.Brush.Color := ColoreSfondo;
        ACanvas.FillRect(R);
      end;                                                                                                                 

      // Se una di quelle celle di campi flag con le figurine iniziali
      if (CurrFieldName = 'EXIST_URGENTI') or (CurrFieldName = 'EXIST_CHIAMATE') or (CurrFieldName = 'EXIST_PRESCRIZIONI') or (CurrFieldName = 'EXIST_ALLEGATITOSEND')
      or (CurrFieldName = 'EXIST_RIFDOC_CORRISPNOPAG')
      or (CurrFieldName = 'COMPUTED_CONTRATTO_SCADUTO') or (CurrFieldName = 'CONTRATTO_DISDETTA_RICEVUTA')
      or (CurrFieldName = 'STR_CERTIFIED_IMM')
      then begin
        R.Left   := R.Left + Round(((R.Right - R.Left - (DM2.ImpiantiListImages.Width * AScale)) / 2));
        R.Left   := R.Left + AScale;
        R.Top    := R.Top + AScale;
        R.Right  := R.Left + Round(DM2.ImpiantiListImages.Width * AScale);
        R.Bottom := R.Top  + Round(DM2.ImpiantiListImages.Width * AScale);
        // RIcava l'indice dell'immagine da stampare
        ImageIndex := TcxImageComboBoxProperties(LocalColumn.Properties).FindItemByValue(ARecord.Values[LocalColumn.Index]).ImageIndex;
        // Stampa l'immagine
        if (ImageIndex <> -1)
        then Sender.DrawGraphic(ACanvas, R, R, DM2.ImpiantiListImages, ImageIndex, nil, True, True, clWhite);
      // Se invece è una cella con un testo normale...
      end else begin
        // Ricava il font da usare
        AFont.Assign(AnItem.Font);
        // Se è sulla seconda riga lo stampa in secondo piano.
        //  NB: Stampa in secondo piano anche il tipo di impianto anche se è in prima riga
        //  NB: Stampa in secondo piano anche il campo HIGHLIGHTS
        if (LocalColumn.Position.RowIndex > 0) or (CurrFieldName = 'TIPOIMPIANTO') then begin
          AFont.Color := clGray;
          AFont.Style := [];
        // Se è il campo degli HIGHLIGHTS
        end else if (CurrFieldName = 'HIGHLIGHTS') then begin
          AFont.Color := clBlack;
          AFont.Style := [];
        // Se invece è sulla prima riga lo stampa normale
        end else begin
          AFont.Color := clBlack;
          AFont.Style := [fsBold];
        end;

        // Se è la data dell'ultimo intervento effettuato lo rimpicciolisce un pochino
        //  NB: Stampa in secondo piano anche il campo HIGHLIGHTS
        if (CurrFieldName = 'DATAULTIMOINTERVENTO') or (CurrFieldName = 'HIGHLIGHTS')
        then AFont.Size := 350;
        // VALORE CELLA
        // Determinazione dell'allineamento orizzontale da utilizzare
        if      AColumn.Properties.Alignment.Horz = taLeftJustify   then HorizontalAlign := taLeft
        else if AColumn.Properties.Alignment.Horz = taRightJustify  then HorizontalAlign := taRight
        else if AColumn.Properties.Alignment.Horz = taCenter        then HorizontalAlign := taCenterX;
        // Se è un dato numerico e il suo valore è zero non lo stampa per niente
        if (not VarIsNull(ARecord.Values[AColumn.Index])) and VarIsNumeric(ARecord.Values[AColumn.Index]) and (ARecord.Values[AColumn.Index]=0)
        then begin
          AText := '';
        end else begin
          AText := ' ' + ARecord.DisplayTexts[AColumn.Index] + ' ';
        end;
        // Se è il campo dello STATO del CONTRATTO e il contratto è scaduto gli scrive
        //  anche SCADUTO in grassetto sulla DX
        //  NB: Questo non ha una colonna per se ma lo traccio nella colonna "ABBONATO"
        if (LocalColumn = btvAssistenzeCONTRATTO_STATO) and (ARecord.DisplayTexts[btvAssistenzeCONTRATTO_STATO.Index] = 'ABBONATO') and (ARecord.Values[btvAssistenzeCOMPUTED_CONTRATTO_SCADUTO.Index] = 'T')
        then AText := AText + '   (SCADUTO)';
        // Tracciamento del valore
        //  NB: Se è la colonna degli Highlight uso DrawTextEx così riesco a farlo stampare su più di una riga con a capo automatico
        if (AColumn = btvAssistenzeHIGHLIGHTS)
        then Sender.drawTextEx(ACanvas, R, 3, 1, 1, AText, AFont, ColoreSfondo, taLeft, taTop, True, True, False, True, True)
        else Sender.drawText(ACanvas, R, 0, AText, AFont, ColoreSfondo, HorizontalAlign, taCenterY, True, False, False);

      end;

      // BORDO DX
      if (AColumn.IsRight) then begin
         R.Left   := AnItem.BoundsRect.Right;
         R.Top    := AnItem.BoundsRect.Top;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO SX
      if (AColumn.IsLeft) then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Top;
         R.Right  := AnItem.BoundsRect.Left;
         R.Bottom := AnItem.BoundsRect.Bottom;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO INFERIORE
      if (AColumn.IsBottom) then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Bottom; // - AScale;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom; // - AScale;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO INFERIORE ULTIMO RECORD
      if (ARecord.IsLast) and (AColumn.IsBottom) then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Bottom - AScale;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom - AScale;
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


function TTabImpiantiForm.GetGroupTextStyle(ALevel: Integer): TFontStyles;
begin
  if ALevel = 0 then Result := [fsBold] else Result := [];
end;


function TTabImpiantiForm.GetPrintFooterTitle(ARecord:TcxCustomGridRecord; InitialLevelIndex:Integer; SaltaUltimoLivello:Boolean=False): String;
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


procedure TTabImpiantiForm.btvAssistenzeCONTRATTO_STATOGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
  inherited;
  // Conversione
  if      AText = 'T' then AText := 'ABBONATO'
  else if AText = 'F' then AText := 'NON ABB.'
  else if AText = 'S' then AText := 'SOSPESO'
  else if AText = 'D' then AText := 'DISMESSO';
end;

procedure TTabImpiantiForm.btvAssistenzeDATAORAPROSSIMOAPPUNTAMENTOGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  CurrVal: Variant;
begin
  inherited;
  // Inizializzazione
  AText := '';
  CurrVal := Sender.GridView.DataController.Values[ARecordIndex,btvAssistenzeDATAORAPROSSIMOAPPUNTAMENTO.Index];
  // Se è nullo esce subito
  if VarIsNull(CurrVal) or (CurrVal = 0) then Exit;
  // Altrimenti lo formatta a dovere
  AText := FormatDateTime('ddd dd/mm/yyyy "ore" hh.nn', CurrVal);
end;

procedure TTabImpiantiForm.dxPrinterCustomDrawPageHeader(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
  inherited;
   // Richiama il gestore di feault
   DM1.dxPrinterDefaultDrawPageHeader(AReportLink, ACanvas, ARect, ANom, ADenom);
end;

procedure TTabImpiantiForm.dxPrinterCustomDrawPageFooter(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
  inherited;
   // Richiama il gestore di feault
   DM1.dxPrinterDefaultDrawPageFooter(AReportLink, ACanvas, APageIndex, ARect, ANom, ADenom);
   // Stampa i totali solo sull'ultima pagina
   if (APageIndex + 1) = AReportLink.PageCount then begin
      // Prima di tutto resetta il sistema di stampa dei totali
      DM1.ResetPrintTotals;
      // IN base al ReportLink attuale (alla stampa attuale) stampa i totali corretti.
      if AReportLink.Name = 'GridImpiantiLink' then begin
         DM1.AddTotalSeparation(30, ANom, ADenom);
         DM1.AddPrintTotal(ACanvas, ARect, 'Impianti presenti', IntToStr(btvAssistenze.DataController.FilteredRecordCount), False, 60, ANom, ADenom, TP_PAGE_FOOTER);
      end;
   end;
end;

procedure TTabImpiantiForm.btvAssistenzeTELEFONORESPIMPGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  Cellulare, Sep: String;
begin
  inherited;
  // Ingloba anche il cellulare così non spreca spazio
  Cellulare := btvAssistenze.DataController.DisplayTexts[ARecordIndex, btvAssistenzeCELLULARERESPIMP.Index];
  if (Cellulare <> '') and (AText <> '') then Sep := '; ';
  AText := AText + Sep + Cellulare;
end;

procedure TTabImpiantiForm.btvAssistenzeTELEFONOPROPGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  Cellulare, Sep: String;
begin
  inherited;
  // Ingloba anche il cellulare così non spreca spazio
  Cellulare := btvAssistenze.DataController.DisplayTexts[ARecordIndex, btvAssistenzeCELLULAREPROP.Index];
  if (Cellulare <> '') and (AText <> '') then Sep := '; ';
  AText := AText + Sep + Cellulare;
end;

procedure TTabImpiantiForm.btvAssistenzeTELEFONOUTGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  Cellulare, Sep: String;
begin
  inherited;
  // Ingloba anche il cellulare così non spreca spazio
  Cellulare := btvAssistenze.DataController.DisplayTexts[ARecordIndex, btvAssistenzeCELLULAREUT.Index];
  if (Cellulare <> '') and (AText <> '') then Sep := '; ';
  AText := AText + Sep + Cellulare;
end;

procedure TTabImpiantiForm.btvAssistenzeTELEFONOINSTGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
var
  Cellulare, Sep: String;
begin
  inherited;
  // Ingloba anche il cellulare così non spreca spazio
  Cellulare := btvAssistenze.DataController.DisplayTexts[ARecordIndex, btvAssistenzeCELLULAREINST.Index];
  if (Cellulare <> '') and (AText <> '') then Sep := '; ';
  AText := AText + Sep + Cellulare;
end;

procedure TTabImpiantiForm.btvAssistenzeCONTRATTO_IMPORTOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if VarIsNull(ARecord.Values[btvAssistenzeCONTRATTO_IMPORTO.Index])
  or (ARecord.Values[btvAssistenzeCONTRATTO_IMPORTO.Index] = 0)
  then AText := '';
end;

procedure TTabImpiantiForm.PanelSelezioneColonneResize(Sender: TObject);
begin
  inherited;
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TTabImpiantiForm.SbGcVisMem1Click(Sender: TObject);
begin
  inherited;
  try
    if SbGcVisMemAdd.Down then begin
      StopSalvaVistaNelleMemorie;
      if DM1.Messaggi('Memorizza vista', 'Confermi di voler salvare la vista attuale in questa memoria?', 'NB: La nuova vista sovrascriverà l''eventuale vista precedentemente memorizzata nella stessa memoria.', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
      DM2.SaveBandedTableView(GridAssistenze, btvAssistenze,   'M' + RightStr((Sender as TSpeedButton).Name, 1));
      DM2.SalvaCaptionMemoria('MEMORIEIMPIANTI.INI', TSpeedButton(Sender), SbGcVisMem1,SbGcVisMem2,SbGcVisMem3,SbGcVisMem4,SbGcVisMem5,SbGcVisMem6,SbGcVisMem7,SbGcVisMem8,SbGcVisMem9,SbGcVisMem10);
      DM1.Messaggi('Memorizza vista', 'Memorizzato.', '', [mbOk], 0, nil);

    end else if SbGcVisMemSetPredef.Down then begin
      StopSalvaVistaNelleMemorie;
      if DM1.Messaggi('Imposta memoria predefinita', 'Confermi di voler impostare la memoria come predefinita?', '', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
      DM2.MemPredef_SaveSelection('MEMORIE_IMPIANTI', TSpeedButton(Sender), SbGcVisMem1,SbGcVisMem2,SbGcVisMem3,SbGcVisMem4,SbGcVisMem5,SbGcVisMem6,SbGcVisMem7,SbGcVisMem8,SbGcVisMem9,SbGcVisMem10);
      DM1.Messaggi('Imposta memoria predefinita', 'La memoria scelta è ora la predefinita per questa postazione.', '', [mbOk], 0, nil);
      // Selezione e carica la memoria scelta dall'utente
      DM2.RichiamaMemoria(GridAssistenze, btvAssistenze, TSpeedButton(Sender), QryAss, True);

    end else begin
      // Selezione e carica la memoria scelta dall'utente
      DM2.RichiamaMemoria(GridAssistenze, btvAssistenze, TSpeedButton(Sender), QryAss, True);
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabImpiantiForm.TimerAddMemoryGCTimer(Sender: TObject);
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
  if TimerAddMemoryGC.Tag = 20 then StopSalvaVistaNelleMemorie;
end;

procedure TTabImpiantiForm.StopSalvaVistaNelleMemorie;
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

procedure TTabImpiantiForm.StartSalvaVistaNelleMemorie;
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


procedure TTabImpiantiForm.SbGcVisMem1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      SbGcVisMem1Click(Sender);
   end;
end;

procedure TTabImpiantiForm.SbGcVisMemAddClick(Sender: TObject);
begin
  inherited;
  if SbGcVisMemAdd.Down then begin
    StartSalvaVistaNelleMemorie;
  end else begin
    StopSalvaVistaNelleMemorie;
  end;
end;

procedure TTabImpiantiForm.SbGcVisMemSetPredefClick(Sender: TObject);
begin
  inherited;
  if TSpeedButton(Sender).Down then begin
    StartSalvaVistaNelleMemorie;
  end else begin
    StopSalvaVistaNelleMemorie;
  end;
end;

procedure TTabImpiantiForm.AssMesiNessunoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiNessunoClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabImpiantiForm.FilterTecnicoPreferitoPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT RESOURCEID, RESOURCENAME FROM TECNICI');
      Qry.Open;
      FilterTecnicoPreferito.Properties.Items.Clear;
      FilterTecnicoPreferito.Properties.Items.Add('');
      while not Qry.Eof do begin
         FilterTecnicoPreferito.Properties.Items.Add(Qry.FieldByName('RESOURCENAME').AsString + '                                                          ' + Qry.FieldByName('RESOURCEID').AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTabImpiantiForm.btvAssistenzeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  // Se siamo in FastSelectionMode seleziona automaticamente il nuovo record sul quale siamo approdati
  // NB: SPOSTATO NELL'ONMOUSEDOWN PER FARE IN MODO CHE SE LO STO TRASINANDO NELL'AGENDA PER PRENDERE
  //      UN APPUNTAMENTO SIA GIà SELEZIONATO (NELL'ONCLICK QUESTO NON ACCADEVA)
  if DM1.FastSelectionMode and ClientiForm.RxSpeedButtonVisualizza.Enabled then begin
    ClientiForm.RxSpeedButtonVisualizzaClick(ClientiForm.RxSpeedButtonVisualizza);
  end;
end;

procedure TTabImpiantiForm.FilterTipoDataPropertiesChange(Sender: TObject);
begin
  inherited;
  FilterTipoDataOP.Visible := (LeftStr(FilterTipoData.Text,4) = 'op: ') or (FilterTipoData.Text = 'Operazioni Pianificate');
end;

procedure TTabImpiantiForm.FilterTipoDataPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci da visualizzare
  FilterTipoData.Properties.Items.Clear;
  FilterTipoData.Properties.Items.Add('Prossimo intervento');
  FilterTipoData.Properties.Items.Add('Ultimo intervento');
  FilterTipoData.Properties.Items.Add('Ultima manutenzione');
  FilterTipoData.Properties.Items.Add('Operazioni Pianificate');
  // Oltre alle voci fisse aggiunge anche le Operazioni Pianificate
  DM2.StringList_AddOpForFilter(FilterTipoData.Properties.Items);
end;

procedure TTabImpiantiForm.btvOPPROSSIMACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // In grassetto
  ACanvas.Font.Style := [fsBold];
end;

procedure TTabImpiantiForm.btvOPPRZUNITIVACOMPCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // In grassetto
  ACanvas.Font.Style := [fsBold];
end;

procedure TTabImpiantiForm.btvAssistenzeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  Site: TcxGridSite;
  HitTest: TcxCustomGridHitTest;
  Item: TcxCustomGridTableItem;
  MousePosition: TPoint;
begin
  // Inizializzazione
  Site := Sender as TcxGridSite;
  HitTest := Site.GridView.ViewInfo.GetHitTest(X, Y);
  MousePosition := (Sender as TControl).ClientToScreen(Point(X, Y));
  // ===========================================================================
  // COLUMN HEADER HINTS
  // ---------------------------------------------------------------------------
  // Se il mouse è sopra un ColumnHeader provvede a visualizzare il relativo Hint
  //  se la colonna relativa lo prevede (generalmente le colonne con le iconcine)
  if HitTest is TcxGridColumnHeaderHitTest then
  begin
    Item := TcxGridColumnHeaderHitTest(HitTest).Column;
    // Scadenze in sofferenza
    if          (Item = btvAssistenzeICON_SCADSOFF) then begin
     DM2.ColumnHeaderHint_Show(HINT_MSG_SCADSOFF, MousePosition);
     Exit;
    // Corrispettivo non pagato
    end else if (Item = btvAssistenzeICON_CORRISPNOPAG) then begin
     DM2.ColumnHeaderHint_Show(HINT_MSG_CORRISPNOPAG, MousePosition);
     Exit;
    // Urgente
    end else if (Item = btvAssistenzeICON_URGENTE) then begin
     DM2.ColumnHeaderHint_Show(HINT_MSG_URGENTE, MousePosition);
     Exit;
    // Chiamata/Appuntamento
    end else if (Item = btvAssistenzeICON_CHIAMATA) then begin
     DM2.ColumnHeaderHint_Show(HINT_MSG_CHIAMATA, MousePosition);
     Exit;
    // Prescrizione
    end else if (Item = btvAssistenzeICON_PRESCRIZIONE) then begin
     DM2.ColumnHeaderHint_Show(HINT_MSG_PRESCRIZIONE, MousePosition);
     Exit;
    // aLLEGATI
    end else if (Item = btvAssistenzeICON_ALLEGATO) then begin
     DM2.ColumnHeaderHint_Show(HINT_MSG_ALLEGATO_FG, MousePosition);
     Exit;
    end;
  end;
  // Se arriva qui allora l'eventuale Hint deve essere chiuso
  DM2.ColumnHeaderHint_Close;
  // ===========================================================================
end;

procedure TTabImpiantiForm.btvAssistenzeICON_SCADSOFFGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin
  inherited;
  // ===========================================================================
  // HINT
  // ---------------------------------------------------------------------------
  // Se il valore è una stringa nulla oppure 'F' esce subito e non visualizza
  //  alcun Hint
  if (ACellViewInfo.DisplayValue = '') or (ACellViewInfo.DisplayValue = 'F') then Exit;
  // IN base alla colonna su cui è posizionato il mouse
  //  determina il testo dell'hint da visualizzare
  if      Sender.Index = btvAssistenzeICON_SCADSOFF.Index     then AHintText := HINT_MSG_SCADSOFF
  else if Sender.Index = btvAssistenzeICON_CORRISPNOPAG.Index then AHintText := HINT_MSG_CORRISPNOPAG
  else if Sender.Index = btvAssistenzeICON_URGENTE.Index      then AHintText := HINT_MSG_URGENTE
  else if Sender.Index = btvAssistenzeICON_CHIAMATA.Index     then AHintText := HINT_MSG_CHIAMATA
  else if Sender.Index = btvAssistenzeICON_PRESCRIZIONE.Index then AHintText := HINT_MSG_PRESCRIZIONE
  else if Sender.Index = btvAssistenzeICON_ALLEGATO.Index     then AHintText := HINT_MSG_ALLEGATO_FG;
  // Altrimenti non va bene
  AIsHintMultiLine  := False;
  // ===========================================================================
end;

procedure TTabImpiantiForm.tvImpegniEXISTS_URGENTIGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin
  inherited;
  // ===========================================================================
  // HINT
  // ---------------------------------------------------------------------------
  // Se il valore è una stringa nulla oppure 'F' esce subito e non visualizza
  //  alcun Hint
  if (VarToStr(ACellViewInfo.DisplayValue) = '') or (ACellViewInfo.DisplayValue = 'F') then Exit;
  // IN base alla colonna su cui è posizionato il mouse
  //  determina il testo dell'hint da visualizzare
  if      Sender.Index = tvImpegniEXISTS_URGENTI.Index      then AHintText := HINT_MSG_URGENTE
  else if Sender.Index = tvImpegniEXISTS_STAMPATO.Index     then AHintText := HINT_MSG_STAMPATO;
  // Altrimenti non va bene
  AIsHintMultiLine  := False;
  // ===========================================================================
end;

end.
