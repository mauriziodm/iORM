unit FormAllegatiFG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBaseAllegati, cxControls, cxSplitter,
  ExtCtrls, bmpPanel, DB, IBODataset, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxDBEdit, DBCtrls, Buttons, MAURI_SB, StdCtrls, Mask,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, cxLabel,
  cxMemo, cxSpinEdit, cxTimeEdit, IB_Components,
  Menus, cxCurrencyEdit, cxImageComboBox, cxButtonEdit, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, IB_Access, qrddlgs;

const
  RESPIMP_TOP = 18;
  RESPIMP_MIDDLE = 28;
  RESPIMP_BOTTOM = 35;

type
  TAllegatiFGForm = class(TModelBaseAllegatiForm)
    QryAll: TIBOQuery;
    QryAllID: TIntegerField;
    QryAllTIPO: TStringField;
    QryAllDATACONTROLLO: TDateTimeField;
    QryAllDATAORAARRIVO: TDateTimeField;
    QryAllDATAORAPARTENZA: TDateTimeField;
    QryAllIDIMPEGNO: TIntegerField;
    QryAllCODICECATASTO: TStringField;
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
    QryAllGENCAL_MARCAEFFICENERGETICA: TStringField;
    QryAllGENCAL_RISCALDAMENTO: TStringField;
    QryAllGENCAL_ACQUASANITARIA: TStringField;
    QryAllGENCAL_COMBUSTIBILE: TStringField;
    QryAllGENCAL_COMBUSTIBILEALTRO: TStringField;
    QryAllGENCAL_UBICAZIONE: TStringField;
    QryAllGENCAL_DATAINSTALLAZIONE: TDateTimeField;
    QryAllGENCAL_FLUIDOTERMOVETTORE: TStringField;
    QryAllGENCAL_CONSUMI1_STAGIONE: TStringField;
    QryAllGENCAL_CONSUMI2_STAGIONE: TStringField;
    QryAllBRUC_ID: TIntegerField;
    QryAllBRUC_COSTRUTTORE: TStringField;
    QryAllBRUC_MODELLO: TStringField;
    QryAllBRUC_MATRICOLA: TStringField;
    QryAllBRUC_TIPOLOGIA: TStringField;
    QryAllBRUC_ANNOCOSTRUZIONE: TIntegerField;
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
    QryAllOSSERVAZIONI: TStringField;
    QryAllRACCOMANDAZIONI: TStringField;
    QryAllPRESCRIZIONI: TStringField;
    QryAllIMPPUOFUNZIONARE: TStringField;
    QryAllTECNICO_RESOURCEID: TIntegerField;
    QryAllTECNICO_NOMECOGNOME: TStringField;
    QryAllTECNICO_RAGSOC: TStringField;
    QryAllTECNICO_INDIRIZZO: TStringField;
    QryAllTECNICO_TELEFONO: TStringField;
    QryAllTECNICO_ESTREMIDOCQUALIFICA: TStringField;
    Panel_G_UbicazioneImpianto: TPanel;
    Label267: TLabel;
    Panel_G_Proprietario: TPanel;
    Label226: TLabel;
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
    DBText3: TDBText;
    Label240: TLabel;
    dbePropRagSoc: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    Panel_G_ResponsabileImpianto: TPanel;
    Label251: TLabel;
    Label253: TLabel;
    Label254: TLabel;
    Label261: TLabel;
    Label262: TLabel;
    Label263: TLabel;
    Label264: TLabel;
    Label266: TLabel;
    DBText9: TDBText;
    SBEspandiRespImp: TSpeedButtonRollOver;
    SBRespImp: TSpeedButtonRollOver;
    eIndirizzoRespImp: TDBEdit;
    eNumCivicoRespImp: TDBEdit;
    eCAPRespImp: TDBEdit;
    eCittaRespImp: TDBEdit;
    eProvinciaRespImp: TDBEdit;
    eTelefonoRespImp: TDBEdit;
    eCellulareRespImp: TDBEdit;
    DbeInQualitaDi: TcxDBRadioGroup;
    Panel_G_IdentificazioneImpianto: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label44: TLabel;
    Label80: TLabel;
    Label82: TLabel;
    Label180: TLabel;
    Label181: TLabel;
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
    GenCal_Tipologia: TDBEdit;
    GenCal_DataInstallazione: TcxDBDateEdit;
    Label2: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label3: TLabel;
    Label4: TLabel;
    GenCal_Consumi1_Stagione: TDBEdit;
    Label5: TLabel;
    GenCal_Consumi1_M3KG: TDBEdit;
    Label6: TLabel;
    GenCal_Consumi2_Stagione: TDBEdit;
    Label7: TLabel;
    GenCal_Consumi2_M3KG: TDBEdit;
    Panel_F_IdentificazioneImpianto: TPanel;
    Label8: TLabel;
    DBText2: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    F_GenCal_Matricola: TDBEdit;
    F_GenCal_PotenzaNominale: TDBEdit;
    F_GenCal_Tiraggio: TcxDBRadioGroup;
    F_GenCal_Combustibile: TcxDBRadioGroup;
    F_GenCal_CombustibileAltro: TDBEdit;
    F_PanelCostruttore: TPanel;
    F_GenCal_Costruttore: TDBComboBox;
    F_PanelModello: TPanel;
    F_GenCal_Modello: TDBComboBox;
    F_GenCal_AnnoCostruzione: TDBEdit;
    F_PanelMarcaEfficEnerg: TPanel;
    F_GenCal_MarcaEfficienzaEnerg: TDBComboBox;
    F_GenCal_UsoAcquaSanitaria: TcxDBCheckBox;
    F_PanelFluidoTermovettore: TPanel;
    F_GenCal_FluidoTermovettore: TDBComboBox;
    F_PanelLocaleInstallazione: TPanel;
    F_GenCal_LocaleInstallazione: TDBComboBox;
    F_GenCal_UsoRiscaldamento: TcxDBCheckBox;
    F_GenCal_CodiceCatastoImpianti: TDBEdit;
    F_GenCal_PotenzaNominaleFocolare: TDBEdit;
    F_GenCal_VolumetriaRiscaldata: TDBEdit;
    F_GenCal_Tipologia: TDBEdit;
    F_GenCal_DataInstallazione: TcxDBDateEdit;
    F_GenCal_Consumi1_Stagione: TDBEdit;
    F_GenCal_Consumi1_M3KG: TDBEdit;
    F_GenCal_Consumi2_Stagione: TDBEdit;
    F_GenCal_Consumi2_M3KG: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    F_GenCal_TipoCamera: TcxDBRadioGroup;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    F_Bruc_Matricola: TDBEdit;
    F_Bruc_PanelCostruttore: TPanel;
    F_Bruc_Costruttore: TDBComboBox;
    F_Bruc_PanelModello: TPanel;
    F_Bruc_Modello: TDBComboBox;
    Label38: TLabel;
    Label39: TLabel;
    F_Bruc_AnnoCostruzione: TDBEdit;
    F_Bruc_CampoFunzionamento: TDBEdit;
    Label40: TLabel;
    F_Bruc_Tipologia: TDBEdit;
    Panel_G_EsameVisivoImpianto: TPanel;
    Label41: TLabel;
    Label42: TLabel;
    Panel2: TPanel;
    Label45: TLabel;
    dbeB1: TcxDBRadioGroup;
    Panel3: TPanel;
    Label43: TLabel;
    dbeB2: TcxDBRadioGroup;
    Panel4: TPanel;
    Label46: TLabel;
    dbeB3: TcxDBRadioGroup;
    Label50: TLabel;
    Panel8: TPanel;
    Label51: TLabel;
    dbeC1: TcxDBRadioGroup;
    Panel9: TPanel;
    Label52: TLabel;
    dbeC2: TcxDBRadioGroup;
    Panel10: TPanel;
    Label53: TLabel;
    dbeC3: TcxDBRadioGroup;
    Label54: TLabel;
    Panel11: TPanel;
    Label55: TLabel;
    dbeD1: TcxDBRadioGroup;
    Panel12: TPanel;
    Label56: TLabel;
    dbeD2: TcxDBRadioGroup;
    Panel13: TPanel;
    Label57: TLabel;
    dbeD3: TcxDBRadioGroup;
    Panel15: TPanel;
    Label58: TLabel;
    dbeD4: TcxDBRadioGroup;
    Panel16: TPanel;
    Label59: TLabel;
    dbeD5: TcxDBRadioGroup;
    Label60: TLabel;
    Panel17: TPanel;
    Label61: TLabel;
    dbeE1: TcxDBRadioGroup;
    Panel19: TPanel;
    Label62: TLabel;
    dbeE2: TcxDBRadioGroup;
    Panel20: TPanel;
    Label63: TLabel;
    dbeE3: TcxDBRadioGroup;
    Panel21: TPanel;
    Label64: TLabel;
    dbeE4: TcxDBRadioGroup;
    Panel22: TPanel;
    Label65: TLabel;
    dbeE5: TcxDBRadioGroup;
    Label66: TLabel;
    Label67: TLabel;
    Label70: TLabel;
    Label47: TLabel;
    Panel6: TPanel;
    Label49: TLabel;
    dbeF2: TcxDBRadioGroup;
    Panel7: TPanel;
    Label71: TLabel;
    dbeF3: TcxDBRadioGroup;
    Panel23: TPanel;
    Label74: TLabel;
    dbeF4: TcxDBRadioGroup;
    Panel24: TPanel;
    Label75: TLabel;
    dbeF5: TcxDBRadioGroup;
    Panel25: TPanel;
    Label76: TLabel;
    dbeF6: TcxDBRadioGroup;
    Panel26: TPanel;
    Label77: TLabel;
    dbeF7: TcxDBRadioGroup;
    Panel27: TPanel;
    Label78: TLabel;
    dbeF8: TcxDBRadioGroup;
    Panel28: TPanel;
    Label79: TLabel;
    dbeF9: TcxDBRadioGroup;
    Panel5: TPanel;
    Label48: TLabel;
    dbeF1: TcxDBRadioGroup;
    Panel29: TPanel;
    Label81: TLabel;
    dbeF10: TcxDBRadioGroup;
    Panel30: TPanel;
    Label83: TLabel;
    dbeF11: TcxDBRadioGroup;
    Panel31: TPanel;
    Label84: TLabel;
    dbeF12: TcxDBRadioGroup;
    Label85: TLabel;
    Panel32: TPanel;
    Label86: TLabel;
    dbeG1: TcxDBRadioGroup;
    Panel33: TPanel;
    Label87: TLabel;
    dbeG2: TcxDBRadioGroup;
    Panel34: TPanel;
    Label88: TLabel;
    dbeG3: TcxDBRadioGroup;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Panel_F_DocumentazioneTecnicaCorredo: TPanel;
    Shape20: TShape;
    Label98: TLabel;
    Label99: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Panel35: TPanel;
    Label114: TLabel;
    dbe_F_B1: TcxDBRadioGroup;
    Panel36: TPanel;
    Label115: TLabel;
    dbe_F_B2: TcxDBRadioGroup;
    Panel37: TPanel;
    Label116: TLabel;
    dbe_F_B3: TcxDBRadioGroup;
    Shape15: TShape;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Panel1: TPanel;
    Label100: TLabel;
    dbe_F_B4: TcxDBRadioGroup;
    Panel38: TPanel;
    Label101: TLabel;
    dbe_F_B5: TcxDBRadioGroup;
    Panel39: TPanel;
    Label102: TLabel;
    dbe_F_B6: TcxDBRadioGroup;
    Panel40: TPanel;
    Label103: TLabel;
    dbe_F_B7: TcxDBRadioGroup;
    Panel41: TPanel;
    dbe_F_B8: TcxDBRadioGroup;
    Panel42: TPanel;
    Label107: TLabel;
    dbe_F_B9: TcxDBRadioGroup;
    Panel43: TPanel;
    Label108: TLabel;
    dbe_F_B10: TcxDBRadioGroup;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    Label109: TLabel;
    Label104: TLabel;
    Panel_F_EsameVisivoImpianto: TPanel;
    Shape16: TShape;
    Label110: TLabel;
    Label111: TLabel;
    Panel45: TPanel;
    Label118: TLabel;
    dbe_F_C11: TcxDBRadioGroup;
    Panel46: TPanel;
    Label119: TLabel;
    dbe_F_C12: TcxDBRadioGroup;
    Panel47: TPanel;
    Label120: TLabel;
    dbe_F_C13: TcxDBRadioGroup;
    Panel48: TPanel;
    Label121: TLabel;
    dbe_F_C20: TcxDBRadioGroup;
    Panel49: TPanel;
    Label122: TLabel;
    Panel50: TPanel;
    Label123: TLabel;
    dbe_F_C31: TcxDBRadioGroup;
    Panel51: TPanel;
    Label124: TLabel;
    dbe_F_C32: TcxDBRadioGroup;
    Panel52: TPanel;
    Label125: TLabel;
    Panel53: TPanel;
    Label126: TLabel;
    dbe_F_C41: TcxDBRadioGroup;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Panel54: TPanel;
    Label113: TLabel;
    dbe_F_C42: TcxDBRadioGroup;
    Panel55: TPanel;
    Label117: TLabel;
    dbe_F_C43: TcxDBRadioGroup;
    Panel56: TPanel;
    Label127: TLabel;
    dbe_F_C44: TcxDBRadioGroup;
    Panel57: TPanel;
    Label128: TLabel;
    dbe_F_C45: TcxDBRadioGroup;
    Panel58: TPanel;
    Label129: TLabel;
    dbe_F_C46: TcxDBRadioGroup;
    Panel59: TPanel;
    Label130: TLabel;
    dbe_F_C47: TcxDBRadioGroup;
    SourceAll: TDataSource;
    Shape21: TShape;
    Shape23: TShape;
    Panel44: TPanel;
    Label112: TLabel;
    dbe_F_C50: TcxDBRadioGroup;
    Shape24: TShape;
    Panel60: TPanel;
    Label131: TLabel;
    dbe_F_C60: TcxDBRadioGroup;
    Shape25: TShape;
    Panel61: TPanel;
    Label132: TLabel;
    dbe_F_C70: TcxDBRadioGroup;
    Panel_G_ControlloRendimentoCombustione: TPanel;
    Label133: TLabel;
    Label134: TLabel;
    Shape26: TShape;
    dbeAnFumi_TempFumi: TcxDBTextEdit;
    Label135: TLabel;
    Shape27: TShape;
    dbeAnFumi_TempAmbiente: TcxDBTextEdit;
    Label136: TLabel;
    Shape28: TShape;
    dbeAnFumi_O2_Perc: TcxDBTextEdit;
    Label137: TLabel;
    Shape30: TShape;
    dbeAnFumi_CO2_Perc: TcxDBTextEdit;
    Label138: TLabel;
    Shape31: TShape;
    dbeAnFumi_Bacharach: TcxDBTextEdit;
    Label139: TLabel;
    Shape34: TShape;
    dbeAnFumi_CO_ppm: TcxDBTextEdit;
    Label140: TLabel;
    Shape35: TShape;
    dbeAnFumi_RendCombustione_Perc: TcxDBTextEdit;
    Label141: TLabel;
    Shape36: TShape;
    dbeAnFumi_RendMinimo: TcxDBTextEdit;
    PanelAnalisiFumiEffettuata: TPanel;
    dbeAnalisiFumiEffettuata: TcxDBRadioGroup;
    Panel_G_Osservazioni: TPanel;
    Label142: TLabel;
    cxDBMemoOsservazioni: TcxDBMemo;
    Panel_G_Raccomandazioni: TPanel;
    Label143: TLabel;
    cxDBMemoRaccomandazioni: TcxDBMemo;
    Label144: TLabel;
    Panel_G_Prescrizioni: TPanel;
    Label145: TLabel;
    Panel63: TPanel;
    dbeImpiantoPuoFunzionare: TcxDBRadioGroup;
    dbePrescrizioni: TcxDBMemo;
    Label146: TLabel;
    Label147: TLabel;
    Panel_G_Tecnico: TPanel;
    Label148: TLabel;
    Label149: TLabel;
    SBTecnico: TSpeedButtonRollOver;
    DBText4: TDBText;
    dbeTecnicoNome: TDBEdit;
    Label158: TLabel;
    dbeTecnicoRagSoc: TDBEdit;
    Label159: TLabel;
    dbeTecnicoIndirizzo: TDBEdit;
    Label160: TLabel;
    dbeTecnicoTelefono: TDBEdit;
    Label161: TLabel;
    dbeTecnicoEstremiDocQualifica: TDBEdit;
    PanelNumDataDocumento: TPanel;
    ShapeDocumento: TShape;
    LabelData: TLabel;
    LabelDocumento: TLabel;
    LabelCantiere: TLabel;
    eDataControllo: TcxDBDateEdit;
    eOrarioArrivo: TcxDBTimeEdit;
    Label152: TLabel;
    eOrarioPartenza: TcxDBTimeEdit;
    TransAll: TIB_Transaction;
    cxDBTextEdit19: TcxDBTextEdit;
    QryPrat: TIBOQuery;
    SourcePrat: TDataSource;
    QryPratPRATICA_FULL: TStringField;
    QryPratCODICE: TIntegerField;
    QryPratDATAAPERTURA: TDateTimeField;
    cxDBCheckBox1: TcxDBCheckBox;
    QryAllDATAORADAIMPEGNO: TStringField;
    dbeUsaTecnicoIntervento: TcxDBCheckBox;
    QryAllTECNICO_DAIMPEGNO: TStringField;
    SP_AggiornaTecnico: TIB_StoredProc;
    QryAllSTATOAVANZAMENTO: TSmallintField;
    PanelStatoAvanzamento: TPanel;
    Label150: TLabel;
    Panel62: TPanel;
    cxDBRadioGroup60: TcxDBRadioGroup;
    Shape22: TShape;
    Button1: TButton;
    MenuStampe: TPopupMenu;
    StampaKITperiltecnico1: TMenuItem;
    N1: TMenuItem;
    Fogliodilavoro1: TMenuItem;
    Rapportointerventiprecedenti1: TMenuItem;
    AllegatoGfrontespizio1: TMenuItem;
    AllegatoGRetro1: TMenuItem;
    N2: TMenuItem;
    AllegatoHfrontespizio1: TMenuItem;
    AllegatoHRetro1: TMenuItem;
    QryAllANFUMI_TEMPFUMI: TIBOFloatField;
    QryAllANFUMI_TEMPAMBIENTE: TIBOFloatField;
    QryAllANFUMI_O2_PERC: TIBOFloatField;
    QryAllANFUMI_CO2_PERC: TIBOFloatField;
    QryAllANFUMI_BACHARACH_NUM: TIBOFloatField;
    QryAllANFUMI_CO_PPM: TIBOFloatField;
    QryAllANFUMI_CO_PERC: TIBOFloatField;
    QryAllANFUMI_RENDIMENTO_PERC: TIBOFloatField;
    QryAllANFUMI_TIRAGGIO_PA: TIBOFloatField;
    QryAllINDIRIZZORESPIMP_FULL: TStringField;
    QryAllPROPINDIRIZZO_FULL: TStringField;
    QryAllTECNICO_INDIRIZZO_FULL: TStringField;
    QryImpStm: TIBOQuery;
    SourceImp: TDataSource;
    QryImpStmDATACONTROLLO: TDateTimeField;
    QryImpStmDATAORAARRIVO: TDateTimeField;
    QryImpStmDATAORAPARTENZA: TDateTimeField;
    QryImpStmOSSERVAZIONI: TStringField;
    QryImpStmRACCOMANDAZIONI: TStringField;
    QryImpStmPRESCRIZIONI: TStringField;
    N3: TMenuItem;
    QryAllGENCAL_POTENZATERMICAFOCOLARE: TIBOFloatField;
    QryAllGENCAL_POTENZATERMICA: TIBOFloatField;
    QryAllGENCAL_VOLUMETRIARISC: TIBOFloatField;
    QryAllGENCAL_CONSUMI1_M3KG: TIBOFloatField;
    QryAllGENCAL_CONSUMI2_M3KG: TIBOFloatField;
    QryAllBRUC_CAMPOFUNZIONAMENTO: TIBOFloatField;
    EditInserimentoFacilitato: TEdit;
    SBInserimentoFacilitato: TSpeedButton;
    Label151: TLabel;
    F_Bruc_DataInstallazione: TcxDBDateEdit;
    QryAllBRUC_DATAINSTALLAZIONE: TDateTimeField;
    SBInserimentoFacilitato_F: TSpeedButton;
    EditInserimentoFacilitato_F: TEdit;
    Stampaallegato1: TMenuItem;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    QryAllRACCOMANDAZIONI_FATTO: TStringField;
    QryAllPRESCRIZIONI_FATTO: TStringField;
    Label153: TLabel;
    F_Bruc_CampoFunzionamento2: TDBEdit;
    QryAllBRUC_CAMPOFUNZIONAMENTO2: TIBOFloatField;
    QryPratID: TIntegerField;
    QryPratDEFAULTALLEGATIFGPRINTERNAME: TStringField;
    QryPratDEFAULTALLEGATOFFILENAME: TStringField;
    QryPratDEFAULTALLEGATOGFILENAME: TStringField;
    QryAllRACCOMANDAZIONI_FATTO_DATA: TDateTimeField;
    QryAllRACCOMANDAZIONI_FATTO_NOTE: TStringField;
    QryAllPRESCRIZIONI_FATTO_DATA: TDateTimeField;
    QryAllPRESCRIZIONI_FATTO_NOTE: TStringField;
    cxDBDateEdit1: TcxDBDateEdit;
    Label154: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Label155: TLabel;
    cxDBDateEdit2: TcxDBDateEdit;
    Label156: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    Label157: TLabel;
    QryAllCODICEISTATCOMUNEIMM: TStringField;
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
    QryAllCOMPUTED_STR_CERTIFIED_IMM: TStringField;
    QryAllCODICEISTATCOMUNERESPIMP: TStringField;
    QryAllPROPCODICEISTATCOMUNE: TStringField;
    Label335: TLabel;
    dbePalazzinaImm: TcxDBTextEdit;
    PanelBollino: TPanel;
    Label162: TLabel;
    Label163: TLabel;
    dbeBollinoPrefisso: TDBEdit;
    dbeBollinoNumero: TDBEdit;
    dbeFirmaResponsabilePresente: TcxDBCheckBox;
    dbeFirmaDelTecnicoPresente: TcxDBCheckBox;
    QryAllPALAZZOIMM: TStringField;
    QryAllBOLLINO_PREFISSO: TStringField;
    QryAllBOLLINO_NUMERO: TStringField;
    QryAllFIRMAPRESENTE_RESPONSABILE: TStringField;
    QryAllFIRMAPRESENTE_TECNICO: TStringField;
    Label164: TLabel;
    ReportDesignerDialog1: TReportDesignerDialog;
    Label165: TLabel;
    ePag: TcxDBTextEdit;
    Label166: TLabel;
    ePagDi: TcxDBTextEdit;
    Label167: TLabel;
    dbeCodiceCatasto: TcxDBTextEdit;
    Label168: TLabel;
    dbePotenzaNominale: TcxDBTextEdit;
    Label169: TLabel;
    Panel_RCEE1_DocTecnicaCorredo: TPanel;
    Shape33: TShape;
    Shape40: TShape;
    Label182: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    PanelDicConfPresente: TPanel;
    Label201: TLabel;
    eDichConfPresente: TcxDBRadioGroup;
    PanelLibrettoImpPresente: TPanel;
    Label202: TLabel;
    cxDBRadioGroup2: TcxDBRadioGroup;
    PanelLibrettoCompilato: TPanel;
    Label220: TLabel;
    cxDBRadioGroup17: TcxDBRadioGroup;
    PanelLibrUsoManutPresenti: TPanel;
    Label232: TLabel;
    cxDBRadioGroup25: TcxDBRadioGroup;
    Panel_RCEE1_TrattamentoAcqua: TPanel;
    Label183: TLabel;
    LabelTrattAcqua_Riscaldamento: TLabel;
    Label188: TLabel;
    DBEdit10: TDBEdit;
    Label189: TLabel;
    LabelTrattAcqua_ACS: TLabel;
    Panel_RCEE1_ControlloImpianto: TPanel;
    Shape37: TShape;
    Shape42: TShape;
    Label191: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    PanelInstIntLocaleIdoneo: TPanel;
    Label213: TLabel;
    cxDBRadioGroup3: TcxDBRadioGroup;
    PanelInstExtGeratoriIdonei: TPanel;
    Label214: TLabel;
    cxDBRadioGroup4: TcxDBRadioGroup;
    PanelApertVentilazLibere: TPanel;
    Label215: TLabel;
    cxDBRadioGroup5: TcxDBRadioGroup;
    PanelCanaleFumoIdoneo: TPanel;
    Label245: TLabel;
    cxDBRadioGroup21: TcxDBRadioGroup;
    PanelSistRegolazTempFunzionante: TPanel;
    Label246: TLabel;
    cxDBRadioGroup22: TcxDBRadioGroup;
    PanelAdeguateDimensAperture: TPanel;
    Label197: TLabel;
    cxDBRadioGroup6: TcxDBRadioGroup;
    PanelNoPerditeCombLiquido: TPanel;
    Label198: TLabel;
    cxDBRadioGroup7: TcxDBRadioGroup;
    PanelIdoneaTenutaGeneratore: TPanel;
    Label199: TLabel;
    cxDBRadioGroup8: TcxDBRadioGroup;
    Panel_RCEE1_GruppoTermico: TPanel;
    Label194: TLabel;
    Label200: TLabel;
    Label203: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    eGTMatricola: TDBEdit;
    eGTPotNominaleUtile: TDBEdit;
    eGTTipoTiraggio: TcxDBRadioGroup;
    eGTCombustibile: TcxDBRadioGroup;
    PanelGTFabbricante: TPanel;
    DBComboBox1: TDBComboBox;
    PanelGTModello: TPanel;
    DBComboBox2: TDBComboBox;
    eGTTiraggio: TDBEdit;
    eGTAcquaSanitaria: TcxDBCheckBox;
    eGTRiscaldamento: TcxDBCheckBox;
    eGTPotNominaleFocolare: TDBEdit;
    eDataInstallazione: TcxDBDateEdit;
    Label242: TLabel;
    eGruppoTermicoGT: TDBEdit;
    eTipoGruppoTermico: TcxDBRadioGroup;
    Label243: TLabel;
    Label244: TLabel;
    Shape43: TShape;
    Label219: TLabel;
    Label247: TLabel;
    Label248: TLabel;
    PanelDispComandoRegolasFunzionanti: TPanel;
    Label249: TLabel;
    cxDBRadioGroup13: TcxDBRadioGroup;
    PanelDispSicurezzaNonManomessi: TPanel;
    Label250: TLabel;
    cxDBRadioGroup14: TcxDBRadioGroup;
    PanelValvolaSicurezzaSoprìvrapress: TPanel;
    Label255: TLabel;
    cxDBRadioGroup15: TcxDBRadioGroup;
    PanelScambPulito: TPanel;
    Label256: TLabel;
    cxDBRadioGroup16: TcxDBRadioGroup;
    PanelPresRiflusso: TPanel;
    Label227: TLabel;
    cxDBRadioGroup18: TcxDBRadioGroup;
    PanelRisultContrUNI10389: TPanel;
    Label231: TLabel;
    cxDBRadioGroup19: TcxDBRadioGroup;
    Label217: TLabel;
    Shape32: TShape;
    Label216: TLabel;
    dbeAnFumi_ModuloTermico: TcxDBTextEdit;
    Panel_RCEE1_CheckList: TPanel;
    Label218: TLabel;
    Label223: TLabel;
    cxDBCheckBox16: TcxDBCheckBox;
    cxDBCheckBox26: TcxDBCheckBox;
    cxDBCheckBox27: TcxDBCheckBox;
    cxDBCheckBox28: TcxDBCheckBox;
    QryAllNATURAGIURIDICARESPIMP: TStringField;
    QryAllNOMERESPIMP: TStringField;
    QryAllCOGNOMERESPIMP: TStringField;
    QryAllB_LIBRETTOIMPIANTOCOMPILATO: TStringField;
    QryAllC_EXTINST_GENERATOREIDONEO: TStringField;
    QryAllF_SISTIREGOLAZTEMPFUNZIONANTE: TStringField;
    QryAllG_ASSENZAPERDITECOMBLIQUIDO: TStringField;
    QryAllG_RISCTRLUNI10389_1: TStringField;
    QryAllANFUMI_RENDMINIMOLEGGE: TIBOFloatField;
    QryAllANFUMI_MODULOTERMICO: TStringField;
    QryAllCHKLST_ADOZVALVTERMOST: TStringField;
    QryAllCHKLST_ISOLAMRETEDISTRIB: TStringField;
    QryAllCHKLST_SISTTRATTAMACQUA: TStringField;
    QryAllCHKLST_SOSTSISTREGOLAZ: TStringField;
    QryAllTH2O_DUREZZATOTALE: TIBOFloatField;
    QryAllTH2O_TRATTRISCALDAM: TStringField;
    QryAllTH2O_TRATTACS: TStringField;
    QryAllPAG: TStringField;
    QryAllPAGDI: TStringField;
    QryAllPOTENZANOMINALEMAX: TIBOFloatField;
    QryAllPARTITAIVARESPIMP: TStringField;
    dbeTrattAcqua_Riscaldamento: TcxDBComboBox;
    dbeTrattAcqua_ACS: TcxDBComboBox;
    QryAllGENCAL_GRUPPOTERMICO_GT: TStringField;
    QryDatiAzie: TIBOQuery;
    QryDatiAzieRAGIONESOCIALE: TStringField;
    QryDatiAzieP_IVA: TStringField;
    QryDatiAzieINDIRIZZO: TStringField;
    QryDatiAzieNUMCIVICO: TStringField;
    QryDatiAzieCITTA: TStringField;
    QryDatiAziePROVINCIA: TStringField;
    SourceDatiAzie: TDataSource;
    QryPratDEFAULTALLEGATORCEE1FILENAME: TStringField;
    QryPratDEFAULTALLEGATORCEE2FILENAME: TStringField;
    QryPratDEFAULTALLEGATORCEE3FILENAME: TStringField;
    QryPratDEFAULTALLEGATORCEE4FILENAME: TStringField;
    QryAllGENCAL_TIPOLOGIA2: TStringField;
    QryAllANFUMI_CUFUMISECCHI: TIBOFloatField;
    QryAllANFUMI_PORTATACOMBUSTIBILE: TIBOFloatField;
    QryAllANFUMI_RISPETTA_BACHARACH: TStringField;
    QryAllANFUMI_RISPETTA_CO_FUMISECCHI: TStringField;
    QryAllANFUMI_RISPETTA_RENDIMENTO: TStringField;
    QryAllH2OREINTEGRO1_ESERCIZIO1: TStringField;
    QryAllH2OREINTEGRO1_ESERCIZIO2: TStringField;
    QryAllH2OREINTEGRO1_LETTURAINIZIALE: TIBOFloatField;
    QryAllH2OREINTEGRO1_LETTURAFINALE: TIBOFloatField;
    QryAllH2OREINTEGRO1_CONSUMOTOTALE: TIBOFloatField;
    QryAllH2OREINTEGRO2_ESERCIZIO1: TStringField;
    QryAllH2OREINTEGRO2_ESERCIZIO2: TStringField;
    QryAllH2OREINTEGRO2_LETTURAINIZIALE: TIBOFloatField;
    QryAllH2OREINTEGRO2_LETTURAFINALE: TIBOFloatField;
    QryAllH2OREINTEGRO2_CONSUMOTOTALE: TIBOFloatField;
    QryAllTH2O1_NOMEPRODOTTO: TStringField;
    QryAllTH2O1_ESERCIZIO1: TStringField;
    QryAllTH2O1_ESERCIZIO2: TStringField;
    QryAllTH2O1_QTACONSUMATA: TIBOFloatField;
    QryAllTH2O1_UM: TStringField;
    QryAllTH2O1_CIRCUITO_IMPTERMICO: TStringField;
    QryAllTH2O1_CIRCUITO_ACS: TStringField;
    QryAllTH2O1_CIRCUITO_ALTRO: TStringField;
    QryAllTH2O2_NOMEPRODOTTO: TStringField;
    QryAllTH2O2_ESERCIZIO1: TStringField;
    QryAllTH2O2_ESERCIZIO2: TStringField;
    QryAllTH2O2_QTACONSUMATA: TIBOFloatField;
    QryAllTH2O2_UM: TStringField;
    QryAllTH2O2_CIRCUITO_IMPTERMICO: TStringField;
    QryAllTH2O2_CIRCUITO_ACS: TStringField;
    QryAllTH2O2_CIRCUITO_ALTRO: TStringField;
    QryAllCOMBUSTIBILE1_NOME: TStringField;
    QryAllCOMBUSTIBILE1_UM: TStringField;
    QryAllCOMBUSTIBILE1_ESERCIZIO1: TStringField;
    QryAllCOMBUSTIBILE1_ESERCIZIO2: TStringField;
    QryAllCOMBUSTIBILE1_ACQUISTI: TIBOFloatField;
    QryAllCOMBUSTIBILE1_LETTURAINIZIALE: TIBOFloatField;
    QryAllCOMBUSTIBILE1_LETTURAFINALE: TIBOFloatField;
    QryAllCOMBUSTIBILE1_CONSUMO: TIBOFloatField;
    QryAllCOMBUSTIBILE2_NOME: TStringField;
    QryAllCOMBUSTIBILE2_UM: TStringField;
    QryAllCOMBUSTIBILE2_ESERCIZIO1: TStringField;
    QryAllCOMBUSTIBILE2_ESERCIZIO2: TStringField;
    QryAllCOMBUSTIBILE2_ACQUISTI: TIBOFloatField;
    QryAllCOMBUSTIBILE2_LETTURAINIZIALE: TIBOFloatField;
    QryAllCOMBUSTIBILE2_LETTURAFINALE: TIBOFloatField;
    QryAllCOMBUSTIBILE2_CONSUMO: TIBOFloatField;
    QryAllELETTRICITA1_ESERCIZIO1: TStringField;
    QryAllELETTRICITA1_ESERCIZIO2: TStringField;
    QryAllELETTRICITA1_LETTURAINIZIALE: TIBOFloatField;
    QryAllELETTRICITA1_LETTURAFINALE: TIBOFloatField;
    QryAllELETTRICITA1_CONSUMOTOTALE: TIBOFloatField;
    QryAllELETTRICITA2_ESERCIZIO1: TStringField;
    QryAllELETTRICITA2_ESERCIZIO2: TStringField;
    QryAllELETTRICITA2_LETTURAINIZIALE: TIBOFloatField;
    QryAllELETTRICITA2_LETTURAFINALE: TIBOFloatField;
    QryAllELETTRICITA2_CONSUMOTOTALE: TIBOFloatField;
    QryAllGENCAL_TIPOLOGIA2_ALTRO: TStringField;
    dbeTipologia2: TcxDBRadioGroup;
    eGTCombustibileAltro: TDBEdit;
    dbeTipologia2Altro: TDBEdit;
    Panel_RCEE1_Lombardia_TH2O: TPanel;
    Shape38: TShape;
    Label173: TLabel;
    Shape39: TShape;
    Label174: TLabel;
    Shape41: TShape;
    Label175: TLabel;
    Shape44: TShape;
    Label176: TLabel;
    Shape45: TShape;
    Label177: TLabel;
    Shape46: TShape;
    DBEdit1: TDBEdit;
    Label178: TLabel;
    DBEdit2: TDBEdit;
    Shape47: TShape;
    DBEdit3: TDBEdit;
    Label179: TLabel;
    DBEdit4: TDBEdit;
    Shape48: TShape;
    Label185: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Shape49: TShape;
    Shape50: TShape;
    Shape51: TShape;
    Label186: TLabel;
    Shape52: TShape;
    DBEdit7: TDBEdit;
    Label187: TLabel;
    DBEdit8: TDBEdit;
    Shape53: TShape;
    DBEdit9: TDBEdit;
    Label224: TLabel;
    DBEdit11: TDBEdit;
    Shape54: TShape;
    Label225: TLabel;
    Shape55: TShape;
    Label233: TLabel;
    Shape56: TShape;
    Label238: TLabel;
    Shape57: TShape;
    Label241: TLabel;
    Shape58: TShape;
    Label257: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Shape59: TShape;
    Shape60: TShape;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Shape61: TShape;
    Shape62: TShape;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Shape63: TShape;
    Shape64: TShape;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Shape65: TShape;
    Shape66: TShape;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Shape67: TShape;
    Shape68: TShape;
    Shape69: TShape;
    cxDBCheckBox4: TcxDBCheckBox;
    Shape70: TShape;
    cxDBCheckBox5: TcxDBCheckBox;
    Shape71: TShape;
    cxDBCheckBox6: TcxDBCheckBox;
    Shape72: TShape;
    cxDBCheckBox7: TcxDBCheckBox;
    Shape73: TShape;
    cxDBCheckBox8: TcxDBCheckBox;
    Shape74: TShape;
    cxDBCheckBox9: TcxDBCheckBox;
    Panel_RCEE1_Lombardia_GruppoTermico1: TPanel;
    Shape109: TShape;
    Shape110: TShape;
    Label289: TLabel;
    Label290: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    Panel64: TPanel;
    Label293: TLabel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Panel65: TPanel;
    Label294: TLabel;
    cxDBRadioGroup9: TcxDBRadioGroup;
    Panel66: TPanel;
    Label295: TLabel;
    cxDBRadioGroup10: TcxDBRadioGroup;
    Panel67: TPanel;
    Label296: TLabel;
    cxDBRadioGroup11: TcxDBRadioGroup;
    QryPratCATASTO_SEZIONE_IMM: TStringField;
    QryPratCATASTO_FOGLIO_IMM: TStringField;
    QryPratCATASTO_PARTICELLA_IMM: TStringField;
    QryPratCATASTO_SUB_IMM: TStringField;
    Shape111: TShape;
    Label287: TLabel;
    dbeAnFumi_NOX_ppm: TcxDBTextEdit;
    QryAllANFUMI_NOX_PPM: TIBOFloatField;
    QryAllBOLLINO_CALC: TStringField;
    QryPratPOD: TStringField;
    QryPratPDR: TStringField;
    QryPratPROXVISITAENTRO: TDateTimeField;
    Panel_RCEE1_Lombardia_GruppoTermico2: TPanel;
    Shape112: TShape;
    Label288: TLabel;
    Shape113: TShape;
    Shape114: TShape;
    Shape115: TShape;
    Label297: TLabel;
    Shape116: TShape;
    Shape117: TShape;
    Shape118: TShape;
    Label298: TLabel;
    Shape119: TShape;
    Label299: TLabel;
    Shape120: TShape;
    Label300: TLabel;
    Shape121: TShape;
    Label301: TLabel;
    Shape122: TShape;
    Shape123: TShape;
    Shape124: TShape;
    Label302: TLabel;
    Shape125: TShape;
    Shape126: TShape;
    Shape127: TShape;
    Label303: TLabel;
    Shape128: TShape;
    Shape129: TShape;
    Shape130: TShape;
    Label304: TLabel;
    Shape131: TShape;
    Shape132: TShape;
    Shape133: TShape;
    Label305: TLabel;
    Shape134: TShape;
    Label306: TLabel;
    Shape135: TShape;
    Label307: TLabel;
    Shape136: TShape;
    Label308: TLabel;
    Shape137: TShape;
    Label309: TLabel;
    Shape138: TShape;
    Label310: TLabel;
    Shape139: TShape;
    Label311: TLabel;
    Shape140: TShape;
    Shape141: TShape;
    Shape142: TShape;
    Shape143: TShape;
    Shape144: TShape;
    Shape145: TShape;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    Panel_RCEE2_ControlloImpianto: TPanel;
    Shape75: TShape;
    Shape76: TShape;
    Label258: TLabel;
    Label259: TLabel;
    Label260: TLabel;
    Label270: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    Label277: TLabel;
    Panel18: TPanel;
    Label278: TLabel;
    cxDBRadioGroup12: TcxDBRadioGroup;
    Panel68: TPanel;
    Label279: TLabel;
    cxDBRadioGroup20: TcxDBRadioGroup;
    Panel69: TPanel;
    Label280: TLabel;
    cxDBRadioGroup23: TcxDBRadioGroup;
    Panel70: TPanel;
    Label281: TLabel;
    cxDBRadioGroup24: TcxDBRadioGroup;
    Panel71: TPanel;
    Label282: TLabel;
    cxDBRadioGroup26: TcxDBRadioGroup;
    Panel73: TPanel;
    Panel_RCEE2_GruppoFrigo: TPanel;
    Label283: TLabel;
    Label284: TLabel;
    Label285: TLabel;
    Label286: TLabel;
    Label312: TLabel;
    Label314: TLabel;
    Label315: TLabel;
    Label316: TLabel;
    Label317: TLabel;
    Label318: TLabel;
    Shape77: TShape;
    Label319: TLabel;
    Label320: TLabel;
    Label321: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    dbeFrigoTipologia: TcxDBRadioGroup;
    Panel72: TPanel;
    DBComboBox3: TDBComboBox;
    Panel74: TPanel;
    DBComboBox4: TDBComboBox;
    cxDBCheckBox10: TcxDBCheckBox;
    cxDBCheckBox11: TcxDBCheckBox;
    DBEdit25: TDBEdit;
    cxDBDateEdit3: TcxDBDateEdit;
    DBEdit26: TDBEdit;
    Panel75: TPanel;
    Label323: TLabel;
    cxDBRadioGroup30: TcxDBRadioGroup;
    Panel76: TPanel;
    Label324: TLabel;
    cxDBRadioGroup31: TcxDBRadioGroup;
    Panel77: TPanel;
    Label325: TLabel;
    cxDBRadioGroup32: TcxDBRadioGroup;
    Panel78: TPanel;
    Label326: TLabel;
    cxDBRadioGroup33: TcxDBRadioGroup;
    Panel79: TPanel;
    Label327: TLabel;
    cxDBRadioGroup34: TcxDBRadioGroup;
    Label329: TLabel;
    DBEdit28: TDBEdit;
    cxDBCheckBox12: TcxDBCheckBox;
    Label330: TLabel;
    Label331: TLabel;
    cxDBCheckBox13: TcxDBCheckBox;
    cxDBCheckBox14: TcxDBCheckBox;
    dbeFrigoCombustibileAltro: TDBEdit;
    QryAllFRIGO_NUMCIRCUITI: TIntegerField;
    QryAllFRIGO_POTENZAFRIGORIFERA: TIBOFloatField;
    QryAllFRIGO_RAFFRESCAMENTO: TStringField;
    QryAlMODPROVA_RAFFRESCAMENTO: TStringField;
    QryAlMODPROVA_RISCALDAMENTO: TStringField;
    PanelFrigoAnalisiRendimento: TPanel;
    Shape78: TShape;
    Shape79: TShape;
    Shape80: TShape;
    Shape81: TShape;
    Shape82: TShape;
    Shape83: TShape;
    Shape84: TShape;
    Shape85: TShape;
    Label322: TLabel;
    Label328: TLabel;
    Label336: TLabel;
    Label337: TLabel;
    Label338: TLabel;
    Label339: TLabel;
    Label340: TLabel;
    Label341: TLabel;
    Shape86: TShape;
    Label342: TLabel;
    Shape87: TShape;
    Label343: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    cxDBTextEdit18: TcxDBTextEdit;
    cxDBTextEdit20: TcxDBTextEdit;
    cxDBTextEdit21: TcxDBTextEdit;
    cxDBTextEdit22: TcxDBTextEdit;
    cxDBTextEdit23: TcxDBTextEdit;
    PanelFrigoAnalisiRendimentoEstLombardia: TPanel;
    Shape88: TShape;
    Label344: TLabel;
    Shape89: TShape;
    Label345: TLabel;
    Shape90: TShape;
    Label346: TLabel;
    Shape91: TShape;
    Label347: TLabel;
    Shape92: TShape;
    Label348: TLabel;
    Shape93: TShape;
    Label349: TLabel;
    Shape94: TShape;
    Label350: TLabel;
    Shape95: TShape;
    Label351: TLabel;
    cxDBTextEdit24: TcxDBTextEdit;
    cxDBTextEdit25: TcxDBTextEdit;
    cxDBTextEdit26: TcxDBTextEdit;
    cxDBTextEdit27: TcxDBTextEdit;
    cxDBTextEdit28: TcxDBTextEdit;
    cxDBTextEdit29: TcxDBTextEdit;
    QryAllTORAF_TEMPUSCFLUIDO: TIBOFloatField;
    QryAllTORAF_TEMPBULBOUMIDOARIA: TIBOFloatField;
    QryAllSCAMBINT_TEMPINGLATOEXT: TIBOFloatField;
    QryAllSCAMBINT_TEMPUSCLATOEXT: TIBOFloatField;
    QryAllSCAMBINT_TEMPINGLATOMACCHINA: TIBOFloatField;
    QryAllSCAMBINT_TEMPUSCLATOMACCHINA: TIBOFloatField;
    Panel_RCEE2_CheckList: TPanel;
    Label313: TLabel;
    Label352: TLabel;
    cxDBCheckBox15: TcxDBCheckBox;
    cxDBCheckBox17: TcxDBCheckBox;
    cxDBCheckBox18: TcxDBCheckBox;
    cxDBCheckBox19: TcxDBCheckBox;
    Panel_RCEE1B_ControlloImpianto: TPanel;
    Shape96: TShape;
    Shape97: TShape;
    Label184: TLabel;
    Label190: TLabel;
    Label353: TLabel;
    Label354: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    Panel80: TPanel;
    Label358: TLabel;
    cxDBRadioGroup27: TcxDBRadioGroup;
    Panel81: TPanel;
    Label359: TLabel;
    cxDBRadioGroup28: TcxDBRadioGroup;
    Panel82: TPanel;
    Label360: TLabel;
    cxDBRadioGroup29: TcxDBRadioGroup;
    Panel83: TPanel;
    Label361: TLabel;
    cxDBRadioGroup35: TcxDBRadioGroup;
    Panel84: TPanel;
    Label362: TLabel;
    cxDBRadioGroup36: TcxDBRadioGroup;
    Panel85: TPanel;
    Label363: TLabel;
    cxDBRadioGroup37: TcxDBRadioGroup;
    Panel86: TPanel;
    Label364: TLabel;
    cxDBRadioGroup38: TcxDBRadioGroup;
    Panel87: TPanel;
    Label365: TLabel;
    cxDBRadioGroup39: TcxDBRadioGroup;
    Panel_RCEE1B_GruppoTermico: TPanel;
    Label366: TLabel;
    Label367: TLabel;
    Label368: TLabel;
    Label369: TLabel;
    Label370: TLabel;
    Label371: TLabel;
    Label373: TLabel;
    Label374: TLabel;
    Label376: TLabel;
    Label380: TLabel;
    DBEdit24: TDBEdit;
    DBEdit27: TDBEdit;
    Panel88: TPanel;
    DBComboBox5: TDBComboBox;
    Panel89: TPanel;
    DBComboBox6: TDBComboBox;
    DBEdit29: TDBEdit;
    cxDBCheckBox20: TcxDBCheckBox;
    cxDBCheckBox21: TcxDBCheckBox;
    cxDBDateEdit4: TcxDBDateEdit;
    DBEdit31: TDBEdit;
    cxDBRadioGroup42: TcxDBRadioGroup;
    cxDBRadioGroup49: TcxDBRadioGroup;
    DBEdit33: TDBEdit;
    cxDBRadioGroup40: TcxDBRadioGroup;
    cxDBRadioGroup41: TcxDBRadioGroup;
    DBEdit30: TDBEdit;
    Label372: TLabel;
    cxDBCheckBox22: TcxDBCheckBox;
    Shape99: TShape;
    Shape98: TShape;
    Label377: TLabel;
    Label378: TLabel;
    Label379: TLabel;
    Panel90: TPanel;
    Label381: TLabel;
    cxDBRadioGroup43: TcxDBRadioGroup;
    Panel91: TPanel;
    Label382: TLabel;
    cxDBRadioGroup44: TcxDBRadioGroup;
    Panel92: TPanel;
    Label383: TLabel;
    cxDBRadioGroup45: TcxDBRadioGroup;
    Panel93: TPanel;
    Label384: TLabel;
    cxDBRadioGroup46: TcxDBRadioGroup;
    Panel94: TPanel;
    Label385: TLabel;
    cxDBRadioGroup47: TcxDBRadioGroup;
    Panel95: TPanel;
    Label386: TLabel;
    cxDBRadioGroup48: TcxDBRadioGroup;
    Shape100: TShape;
    Panel14: TPanel;
    Label375: TLabel;
    cxDBRadioGroup50: TcxDBRadioGroup;
    Panel96: TPanel;
    Label387: TLabel;
    cxDBRadioGroup51: TcxDBRadioGroup;
    Panel97: TPanel;
    Label388: TLabel;
    cxDBRadioGroup52: TcxDBRadioGroup;
    Panel98: TPanel;
    Label389: TLabel;
    cxDBRadioGroup53: TcxDBRadioGroup;
    Panel99: TPanel;
    Label390: TLabel;
    cxDBRadioGroup54: TcxDBRadioGroup;
    Panel100: TPanel;
    Label391: TLabel;
    cxDBRadioGroup55: TcxDBRadioGroup;
    Panel101: TPanel;
    Label392: TLabel;
    cxDBRadioGroup56: TcxDBRadioGroup;
    DBEdit34: TDBEdit;
    QryAllGENCAL_TIPOTIRAGGIO_ALTRO: TStringField;
    QryAllGENCAL_CUCINA: TStringField;
    QryAllGENCAL_MARCATURACE: TStringField;
    QryAllGENCAL_PLACCACAMINO: TStringField;
    QryAllGENCAL_MODEVACUAZFUMI: TStringField;
    QryAllGENCAL_ARIACOMBURENTE: TStringField;
    QryAllGENCAL_CONTRARIACOMBURENTE: TStringField;
    QryAllGENCAL_CARICACOMBUSTIBILE: TStringField;
    QryPratDEFAULTALLEGATORCEE1BFILENAME: TStringField;
    LabelRagioneSociale: TLabel;
    LabelNome: TLabel;
    LabelCognome: TLabel;
    LabelTipoPersona: TLabel;
    Shape101: TShape;
    Shape102: TShape;
    dbeNaturaGiuridica: TcxDBRadioGroup;
    eRagSocRespImp: TDBEdit;
    eNomeRespImp: TDBEdit;
    eCognomeRespImp: TDBEdit;
    Label393: TLabel;
    eCodiceFiscaleRespImp: TDBEdit;
    Label394: TLabel;
    ePIVARespImp: TDBEdit;
    QryAllCOPIE: TSmallintField;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label170: TLabel;
    Panel102: TPanel;
    Label171: TLabel;
    cxDBRadioGroup57: TcxDBRadioGroup;
    Panel103: TPanel;
    Label172: TLabel;
    cxDBRadioGroup58: TcxDBRadioGroup;
    Panel104: TPanel;
    Label252: TLabel;
    cxDBRadioGroup59: TcxDBRadioGroup;
    Panel_RCEE1B_Toscana_DocTecnicaCorredo: TPanel;
    Shape103: TShape;
    Shape104: TShape;
    Label395: TLabel;
    Label396: TLabel;
    Label397: TLabel;
    Label398: TLabel;
    Panel106: TPanel;
    Label399: TLabel;
    cxDBRadioGroup61: TcxDBRadioGroup;
    Panel107: TPanel;
    Label400: TLabel;
    cxDBRadioGroup62: TcxDBRadioGroup;
    Panel108: TPanel;
    Label401: TLabel;
    cxDBRadioGroup63: TcxDBRadioGroup;
    Panel109: TPanel;
    Label402: TLabel;
    cxDBRadioGroup64: TcxDBRadioGroup;
    Label265: TLabel;
    Label403: TLabel;
    Panel105: TPanel;
    Label404: TLabel;
    cxDBRadioGroup65: TcxDBRadioGroup;
    QryAllANFUMI_PORTATATERMICAEFFETTIVA: TIBOFloatField;
    QryAllCONTREG_TIPODISTRIBUZIONE: TStringField;
    QryAllCONTREG_UNITAIMMCONTABILIZATE: TStringField;
    QryAllCONTREG_VALVOLETERMOSTATPRES: TStringField;
    QryAllCONTREG_TIPOCONTABILIZZAZIONE: TStringField;
    QryAllCONTREG_ALTRISISTTERMOREGOLAZ: TStringField;
    QryAllCONTREG_CORRETTOFUNZIONAMENTO: TStringField;
    dbeAnFumi_Bacharach2: TcxDBTextEdit;
    dbeAnFumi_Bacharach3: TcxDBTextEdit;
    Shape152: TShape;
    Label416: TLabel;
    dbeAnFumi_COFumiSecchi_ppm: TcxDBTextEdit;
    Shape153: TShape;
    Label417: TLabel;
    dbeAnFumi_PortataComb_m3h: TcxDBTextEdit;
    Shape154: TShape;
    Label418: TLabel;
    dbeAnFumi_PotTermEff_kw: TcxDBTextEdit;
    Label419: TLabel;
    Label421: TLabel;
    QryAllANFUMI_BACHARACH_NUM2: TIBOFloatField;
    QryAllANFUMI_BACHARACH_NUM3: TIBOFloatField;
    PanelTermoregolazione: TPanel;
    Label405: TLabel;
    Label406: TLabel;
    cxDBRadioGroup66: TcxDBRadioGroup;
    Label407: TLabel;
    Label408: TLabel;
    Label409: TLabel;
    cxDBRadioGroup67: TcxDBRadioGroup;
    cxDBRadioGroup68: TcxDBRadioGroup;
    Label410: TLabel;
    Label411: TLabel;
    Label412: TLabel;
    DBEdit32: TDBEdit;
    cxDBRadioGroup69: TcxDBRadioGroup;
    Label413: TLabel;
    cxDBRadioGroup70: TcxDBRadioGroup;
    Label414: TLabel;
    Panel110: TPanel;
    cxDBRadioGroup71: TcxDBRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure QryAllPROPCODICEChange(Sender: TField);
    procedure QryAllCODICERESPIMPChange(Sender: TField);
    procedure SBProprietarioClick(Sender: TObject);
    procedure SBRespImpClick(Sender: TObject);
    procedure SBTecnicoClick(Sender: TObject);
    procedure SBEspandiProprietarioClick(Sender: TObject);
    procedure SBEspandiRespImpClick(Sender: TObject);
    procedure GenCal_CostruttoreDropDown(Sender: TObject);
    procedure GenCal_ModelloDropDown(Sender: TObject);
    procedure GenCal_LocaleInstallazioneDropDown(Sender: TObject);
    procedure GenCal_MarcaEfficienzaEnergDropDown(Sender: TObject);
    procedure GenCal_FluidoTermovettoreDropDown(Sender: TObject);
    procedure dbePropRagSocEnter(Sender: TObject);
    procedure dbePropRagSocExit(Sender: TObject);
    procedure F_Bruc_CostruttoreDropDown(Sender: TObject);
    procedure F_Bruc_ModelloDropDown(Sender: TObject);
    procedure QryAllDATAORADAIMPEGNOChange(Sender: TField);
    procedure QryAllAfterOpen(DataSet: TDataSet);
    procedure QryAllTECNICO_DAIMPEGNOChange(Sender: TField);
    procedure Button1Click(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AllegatoGfrontespizio1Click(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure dbeAnFumi_TempFumiKeyPress(Sender: TObject; var Key: Char);
    procedure QryAllCalcFields(DataSet: TDataSet);
    procedure EditInserimentoFacilitatoKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure SBInserimentoFacilitatoClick(Sender: TObject);
    procedure EditInserimentoFacilitatoExit(Sender: TObject);
    procedure dbeAnalisiFumiEffettuataPropertiesChange(Sender: TObject);
    procedure dbeImpiantoPuoFunzionarePropertiesChange(Sender: TObject);
    procedure SBInserimentoFacilitato_FClick(Sender: TObject);
    procedure EditInserimentoFacilitato_FExit(Sender: TObject);
    procedure EditInserimentoFacilitato_FKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Stampaallegato1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ApriQueryAllegato;
    procedure StampaAllegatoFG(Preview:Boolean; Copie:Integer=0);
    procedure dbeZonaImmPropertiesInitPopup(Sender: TObject);
    procedure dbeComuneImmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure LabelDocumentoDblClick(Sender: TObject);
    procedure cxDBRadioGroup28PropertiesChange(Sender: TObject);
    procedure dbeNaturaGiuridicaPropertiesChange(Sender: TObject);
    procedure eCognomeRespImpKeyPress(Sender: TObject; var Key: Char);
  private
    fID: Integer;
    fFieldDataOraInizioIntervento: TDatetimeField;
    fFieldDataOraFineIntervento: TDatetimeField;
    fDataOraControllaDaImpegno: Boolean;
    fDataSourceFromImpegni: TDataSource;
    fTecnicoDaImpegno: Boolean;
    fIDImpegno: Integer;
    fInserimentoFacilitato_Index: Byte;
    fInserimentoFacilitato_Array: array of TcxDBRadioGroup;
    fSoloPerStampare: Boolean;

    fQueryAllegatiImpegnoDaAggiornare: Boolean;

    fAnalisiFumi_Bacharach: Boolean;

    // Flag che indica se, quando si entra in modifica di un allegato, deve essere
    //  automaticamente impostato il campo "Analisi fumi effettuata" a "SI" in modo da
    //  non doverlo impostare a mano perchè tanto alcuni dicono che l'allegato bisogna farlo
    //  solo quando si fa anche l'analisi dei fumi e quindi...
    //  NB: L'anno chiesto Climatec di Conti Gianni e Termoidraulica Adriatica
    fAnalisiFumi_SiAutomatico: Boolean;

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    procedure Allegati_AggiornaDatiFiltri; override;
    procedure Allegati_VerificaAbilitazione; override;
    // =========================================================================

    procedure CaricaFormLayout;
    procedure SetDataOraControllaDaImpegno(const Value:Boolean);
    procedure SetTecnicoDaImpegno(const Value: Boolean);
    procedure AggiornaTecnicoDaImpegno;
    procedure ApriQueryPerStampa;
    procedure ImpostaCampiAnalisiFumi;
    procedure ImpostaCampiPrescrizioni;
    procedure StampaAllegato(NomeFile:String; Preview:Boolean; PrinterName:String; Copie:Integer=0);
    procedure StampaAllegatoGVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
    procedure StampaAllegatoFVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
    { Private declarations }
  public
    { Public declarations }
    property ID:Integer read fID write fID;
    property DataSourceFromImpegni:TDataSource read fDataSourceFromImpegni write fDataSourceFromImpegni;
    property FieldDataOraInizioIntervento: TDatetimeField read fFieldDataOraInizioIntervento write fFieldDataOraInizioIntervento;
    property FieldDataOraFineIntervento: TDatetimeField read fFieldDataOraFineIntervento write fFieldDataOraFineIntervento;
    property DataOraControllaDaImpegno:Boolean read fDataOraControllaDaImpegno write SetDataOraControllaDaImpegno;
    property TecnicoDaImpegno:Boolean read fTecnicoDaImpegno write SetTecnicoDaImpegno;
    property SoloPerStampare:Boolean read fSoloPerStampare write fSoloPerStampare;
  end;

var
  AllegatiFGForm: TAllegatiFGForm;

implementation

uses DataModule1, main, FormTecnici, FormModelBase, FormImpegni, IniFiles,
  QRAllegatoGVanz, QRAllegatoFVanz, Printers, DataModule2, StrUtils;

{$R *.dfm}


// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che aggiorna i filtri di collegamento della form degli allegati
  //  con la form attuale
  procedure TAllegatiFGForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QryAllCODICERESPIMP.IsNull then fAllegatiForm.Filter_CodSogg := QryAllCODICERESPIMP.Value;

    // Codice Pratica
    if not QryPratCODICE.IsNull then fAllegatiForm.Filter_CodPrat := QryPratCODICE.Value;
    // Data Pratica
    if not QryPratDATAAPERTURA.IsNull then fAllegatiForm.Filter_DataPrat := QryPratDATAAPERTURA.Value;

    // Tipo Documento
    fAllegatiForm.Filter_TipoDoc := 'Allegato ' + QryAllTIPO.AsString;
    // Registro Documento
    fAllegatiForm.Filter_RegDoc := '';
    // Numero documento
    if not QryAllID.IsNull then fAllegatiForm.Filter_NumDoc := QryAllID.Value;
    // Data documento
    fAllegatiForm.Filter_DataDoc := StrToDate('01/01/1900');

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TAllegatiFGForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QryAll.State = dsInsert) then begin
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




// Procedure che all'apertura dell'allegato, se necessario, aggiorna prima
//  il tecnico degli allegati relativi all'impegno chiamante, in modo che se
//  per caso l'utente lo ha cambiato e non ha ancora confermato l'impegno cmq.
//  è a posto.
procedure TAllegatiFGForm.AggiornaTecnicoDaImpegno;
var
  DS: TDataset;
begin
  DS := DataSourceFromImpegni.DataSet;
  if not SP_AggiornaTecnico.Prepared then SP_AggiornaTecnico.Prepare;
  SP_AggiornaTecnico.Params.ParamByName('IN_IDIMPEGNO').Value     := DS.FieldByName('MASTER_ID').Value;
  SP_AggiornaTecnico.Params.ParamByName('IN_CODICETECNICO').Value := DS.FieldByName('RESOURCEID').Value;
  SP_AggiornaTecnico.Execute;
end;


procedure TAllegatiFGForm.ApriQueryAllegato;
begin
  // Imposta ed apre la query dell'allegato
  if ID = 0 then raise Exception.Create('ID allegato non valido!');
  if QryAll.Active then QryAll.Close;
  if not QryAll.Prepared then QryAll.Prepare;
  QryAll.Params.ParamByName('P_ID').AsInteger := ID;
  QryAll.Open;
  // IMposta ed apre la query con alcuni dati dell'impianto.
  if QryPrat.Active then QryPrat.Close;
  if (not QryAllGENCAL_ID.IsNull) and (QryAllGENCAL_ID.AsInteger <> 0) then begin
    if not QryPrat.Prepared then QryPrat.Prepare;
    QryPrat.Params.ParamByName('P_PA_ID').AsInteger := QryAllGENCAL_ID.AsInteger;
    QryPrat.Open;
  end;
  // Apre la query con i dati azienda (per le stampe)
  QryDatiAzie.Open;
end;


procedure TAllegatiFGForm.ApriQueryPerStampa;
begin
  // Imposta ed apre la query con alcuni dati dell'impegno
  if QryImpStm.Active then QryImpStm.Close;
  if not QryImpStm.Prepared then QryImpStm.Prepare;
  QryImpStm.Params.ParamByName('P_ID').AsInteger := QryAllID.AsInteger;
  QryImpStm.Open;
end;


procedure TAllegatiFGForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Se la FOrm dell'impegno relativo all'allegato esiste e se è stato
  //  "prenotato" l'aggiornamento dell'elenco degli allegati lo esegue.
  if fQueryAllegatiImpegnoDaAggiornare and (ImpegnoForm <> nil) then ImpegnoForm.AllegatiFG_RefreshQuery;
  // Chiude
  Action := caFree;
  AllegatiFGForm := nil;
end;

procedure TAllegatiFGForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TAllegatiFGForm.FormShow(Sender: TObject);
begin
  inherited;
   // In base al valore di 'Tag' apre la form in diverse modalità...
   case Tag of
      // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
      1: begin
        // Apre la query e carica il documento
        ApriQueryAllegato;
      end;

      // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
      2: begin
         // AL momento non è prevista la creazione dell'allegato in questo modo.
      end;
   end;

   // Imposta il layout della form
   ImpostaCampiAnalisiFumi;
   CaricaFormLayout;

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if DM1.ModCtrl(MOD_CONTATTI) > 1 then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;

   // Scrollbar verticale all'inizio
   ClientArea.VertScrollBar.Position := 0;
end;




procedure TAllegatiFGForm.CaricaFormLayout;
const
  Sep = 15;
var
  YY: Integer;
  LO : TMemIniFile;
  Sezione:String;
begin
  // Inizializzazione
  YY := 0;
  // Inizializzazione della sezione del Layouts.ini da ciu bisogna leggere i parametri
  Sezione := 'AllegatiFG';
  // Apre il file che contiene i layouts di stampa e visualizzazione dei documenti.
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // PanelNumDataDocumento
    PanelNumDataDocumento.Top := YY;
    PanelNumDataDocumento.Visible := True;
    Inc(YY, (PanelNumDataDocumento.Height + Sep));
    // In base al tipo di allegato imposta il layout
    if LeftStr(QryAllTIPO.AsString,6) = 'RCEE1B' then begin

      // =========================================================================
      // RCEE1B - Rapporto di Controllo di Efficienza Energetica Tipo 1B (gruppi termici a biomassa)
      // -------------------------------------------------------------------------
      // IMpostazione etichetta del tipo di documento
      LabelDocumento.Caption := '  Rapp. di contr. di eff. energ. tipo 1B (gruppi termici a biomassa comb.)';

      // Dati identificativi
      Panel_G_UbicazioneImpianto.Top := YY;
      Panel_G_UbicazioneImpianto.Visible := True;
      Inc(YY, (Panel_G_UbicazioneImpianto.Height + Sep));
      // Responsabile impianto
      Panel_G_ResponsabileImpianto.Top := YY;
      Panel_G_ResponsabileImpianto.Visible := True;
      Inc(YY, (Panel_G_ResponsabileImpianto.Height + Sep));
      // Documentazione tecnica a corredo
      Panel_RCEE1_DocTecnicaCorredo.Top := YY;
      Panel_RCEE1_DocTecnicaCorredo.Visible := True;
      Inc(YY, (Panel_RCEE1_DocTecnicaCorredo.Height + Sep));
      // Se abilitati gli extra della Toscana aggiunge un altro pannello
      //  alla sezione "Documentazione tecnica a corredo"
      if LO.Readbool(Sezione, 'IntegrazioneToscana', False) then
      begin
        Panel_RCEE1B_Toscana_DocTecnicaCorredo.Top := YY - Sep;
        Panel_RCEE1B_Toscana_DocTecnicaCorredo.Visible := True;
        Inc(YY, (Panel_RCEE1B_Toscana_DocTecnicaCorredo.Height));
      end;
      // Trattamento dell'acqua
      Panel_RCEE1_TrattamentoAcqua.Top := YY;
      Panel_RCEE1_TrattamentoAcqua.Visible := True;
      Inc(YY, (Panel_RCEE1_TrattamentoAcqua.Height + Sep));
      // Se abilitati gli extra della Lombardia aggiunge un altro pannello
      //  alla sezione "Trattamento dell'acqua"
      if LO.Readbool(Sezione, 'IntegrazioneLombardia', False) then
      begin
        Panel_RCEE1_Lombardia_TH2O.Top := YY - Sep;
        Panel_RCEE1_Lombardia_TH2O.Visible := True;
        Inc(YY, (Panel_RCEE1_Lombardia_TH2O.Height));
      end;
      // Controllo dell'impianto
      Panel_RCEE1B_ControlloImpianto.Top := YY;
      Panel_RCEE1B_ControlloImpianto.Visible := True;
      Inc(YY, (Panel_RCEE1B_ControlloImpianto.Height + Sep));
      // Controllo e verifica energetica del gruppo termico
      Panel_RCEE1B_GruppoTermico.Top := YY;
      Panel_RCEE1B_GruppoTermico.Visible := True;
      Inc(YY, (Panel_RCEE1B_GruppoTermico.Height + Sep));
      //  alla sezione "Controllo e verifica energetica del gruppo termico"
      if LO.Readbool(Sezione, 'IntegrazioneLombardia', False) then
      begin
        Panel_RCEE1_Lombardia_GruppoTermico2.Top := YY;  // NoSeparazione
        Panel_RCEE1_Lombardia_GruppoTermico2.Visible := True;
        Inc(YY, (Panel_RCEE1_Lombardia_GruppoTermico2.Height));
      end;
      // Check-List
      Panel_RCEE1_CheckList.Top := YY;
      Panel_RCEE1_CheckList.Visible := True;
      Inc(YY, (Panel_RCEE1_CheckList.Height + Sep));
      // Panel_G_Osservazioni
      Panel_G_Osservazioni.Top := YY;
      Panel_G_Osservazioni.Visible := True;
      Inc(YY, (Panel_G_Osservazioni.Height + Sep));
      // Panel_G_Raccomandazioni
      Panel_G_Raccomandazioni.Top := YY;
      Panel_G_Raccomandazioni.Visible := True;
      Inc(YY, (Panel_G_Raccomandazioni.Height + Sep));
      // Panel_G_Prescrizioni
      Panel_G_Prescrizioni.Top := YY;
      Panel_G_Prescrizioni.Visible := True;
      Inc(YY, (Panel_G_Prescrizioni.Height + Sep));
      // Panel_G_Tecnico
      Panel_G_Tecnico.Top := YY;
      Panel_G_Tecnico.Visible := True;
      Inc(YY, (Panel_G_Tecnico.Height + Sep));
      // Panel_Bollino
      PanelBollino.Top := YY;
      PanelBollino.Visible := True;
      Inc(YY, (PanelBollino.Height + Sep));
      // IMpostazione scrollbar
      ClientArea.VertScrollBar.Range := YY;
      ClientArea.VertScrollBar.Position := 0;
      // =========================================================================

    end else if LeftStr(QryAllTIPO.AsString,5) = 'RCEE1' then begin

      // =========================================================================
      // RCEE1 - Rapporto di Controllo di Efficienza Energetica Tipo 1 (gruppi termici)
      // -------------------------------------------------------------------------
      // IMpostazione etichetta del tipo di documento
      LabelDocumento.Caption := '  Rapporto di controllo di efficienza energetica tipo 1 (gruppi termici)';

      // Dati identificativi
      Panel_G_UbicazioneImpianto.Top := YY;
      Panel_G_UbicazioneImpianto.Visible := True;
      Inc(YY, (Panel_G_UbicazioneImpianto.Height + Sep));
      // Responsabile impianto
      Panel_G_ResponsabileImpianto.Top := YY;
      Panel_G_ResponsabileImpianto.Visible := True;
      Inc(YY, (Panel_G_ResponsabileImpianto.Height + Sep));
      // Documentazione tecnica a corredo
      Panel_RCEE1_DocTecnicaCorredo.Top := YY;
      Panel_RCEE1_DocTecnicaCorredo.Visible := True;
      Inc(YY, (Panel_RCEE1_DocTecnicaCorredo.Height + Sep));
      // Trattamento dell'acqua
      Panel_RCEE1_TrattamentoAcqua.Top := YY;
      Panel_RCEE1_TrattamentoAcqua.Visible := True;
      Inc(YY, (Panel_RCEE1_TrattamentoAcqua.Height + Sep));
      // Se abilitati gli extra della Lombardia aggiunge un altro pannello
      //  alla sezione "Trattamento dell'acqua"
      if LO.Readbool(Sezione, 'IntegrazioneLombardia', False) then
      begin
        Panel_RCEE1_Lombardia_TH2O.Top := YY - Sep;
        Panel_RCEE1_Lombardia_TH2O.Visible := True;
        Inc(YY, (Panel_RCEE1_Lombardia_TH2O.Height));
      end;
      // Controllo dell'impianto
      Panel_RCEE1_ControlloImpianto.Top := YY;
      Panel_RCEE1_ControlloImpianto.Visible := True;
      Inc(YY, (Panel_RCEE1_ControlloImpianto.Height + Sep));
      // Controllo e verifica energetica del gruppo termico
      Panel_RCEE1_GruppoTermico.Top := YY;
      Panel_RCEE1_GruppoTermico.Visible := True;
      Inc(YY, (Panel_RCEE1_GruppoTermico.Height + Sep));
      // Se abilitati gli extra della Lombardia aggiunge un altro pannello
      // Panel_G_ControlloRendimentoCombustione
      Panel_G_ControlloRendimentoCombustione.Top := YY;
      Panel_G_ControlloRendimentoCombustione.Visible := True;
      Inc(YY, (Panel_G_ControlloRendimentoCombustione.Height + Sep));
      //  alla sezione "Controllo e verifica energetica del gruppo termico"
      if LO.Readbool(Sezione, 'IntegrazioneLombardia', False) then
      begin
        Panel_RCEE1_Lombardia_GruppoTermico1.Top := YY - Sep;
        Panel_RCEE1_Lombardia_GruppoTermico1.Visible := True;
        Inc(YY, (Panel_RCEE1_Lombardia_GruppoTermico1.Height));
        // -----
        Panel_RCEE1_Lombardia_GruppoTermico2.Top := YY;  // NoSeparazione
        Panel_RCEE1_Lombardia_GruppoTermico2.Visible := True;
        Inc(YY, (Panel_RCEE1_Lombardia_GruppoTermico2.Height));
      end;
      // Check-List
      Panel_RCEE1_CheckList.Top := YY;
      Panel_RCEE1_CheckList.Visible := True;
      Inc(YY, (Panel_RCEE1_CheckList.Height + Sep));
      // Se abilitati gli extra della Emilia-Romagna aggiunge un altro pannello
      //  dal titolo "Sistemi di termoregolazione e contabilizzazione del calore"
      if LO.Readbool(Sezione, 'IntegrazioneEmiliaRomagna', False) then
      begin
        PanelTermoregolazione.Top := YY;
        PanelTermoregolazione.Visible := True;
        Inc(YY, (PanelTermoregolazione.Height + Sep));
      end;
      // Panel_G_Osservazioni
      Panel_G_Osservazioni.Top := YY;
      Panel_G_Osservazioni.Visible := True;
      Inc(YY, (Panel_G_Osservazioni.Height + Sep));
      // Panel_G_Raccomandazioni
      Panel_G_Raccomandazioni.Top := YY;
      Panel_G_Raccomandazioni.Visible := True;
      Inc(YY, (Panel_G_Raccomandazioni.Height + Sep));
      // Panel_G_Prescrizioni
      Panel_G_Prescrizioni.Top := YY;
      Panel_G_Prescrizioni.Visible := True;
      Inc(YY, (Panel_G_Prescrizioni.Height + Sep));
      // Panel_G_Tecnico
      Panel_G_Tecnico.Top := YY;
      Panel_G_Tecnico.Visible := True;
      Inc(YY, (Panel_G_Tecnico.Height + Sep));
      // Panel_Bollino
      PanelBollino.Top := YY;
      PanelBollino.Visible := True;
      Inc(YY, (PanelBollino.Height + Sep));
      // IMpostazione scrollbar
      ClientArea.VertScrollBar.Range := YY;
      ClientArea.VertScrollBar.Position := 0;
      // =========================================================================

    end else if LeftStr(QryAllTIPO.AsString,5) = 'RCEE2' then begin

      // =========================================================================
      // RCEE1 - Rapporto di Controllo di Efficienza Energetica Tipo 2 (gruppi frigo/pompe di calore)
      // -------------------------------------------------------------------------
      // IMpostazione etichetta del tipo di documento
      LabelDocumento.Caption := '  Rapporto di controllo di efficienza energetica tipo 2 (gruppi frigo)';

      // Dati identificativi
      Panel_G_UbicazioneImpianto.Top := YY;
      Panel_G_UbicazioneImpianto.Visible := True;
      Inc(YY, (Panel_G_UbicazioneImpianto.Height + Sep));
      // Responsabile impianto
      Panel_G_ResponsabileImpianto.Top := YY;
      Panel_G_ResponsabileImpianto.Visible := True;
      Inc(YY, (Panel_G_ResponsabileImpianto.Height + Sep));
      // Documentazione tecnica a corredo
      Panel_RCEE1_DocTecnicaCorredo.Top := YY;
      Panel_RCEE1_DocTecnicaCorredo.Visible := True;
      Inc(YY, (Panel_RCEE1_DocTecnicaCorredo.Height + Sep));
      // Trattamento dell'acqua (applica alcune modifiche)
      Panel_RCEE1_TrattamentoAcqua.Top := YY;
      Panel_RCEE1_TrattamentoAcqua.Visible := True;
      LabelTrattAcqua_Riscaldamento.Caption := 'Trattamento';
      LabelTrattAcqua_ACS.Visible := False;
      dbeTrattAcqua_ACS.Visible := False;
      Panel_RCEE1_TrattamentoAcqua.Height := Panel_RCEE1_TrattamentoAcqua.Height - dbeTrattAcqua_ACS.Height;
      Inc(YY, (Panel_RCEE1_TrattamentoAcqua.Height + Sep));
      // Se abilitati gli extra della Lombardia aggiunge un altro pannello
      //  alla sezione "Trattamento dell'acqua"
      if LO.Readbool(Sezione, 'IntegrazioneLombardia', False) then
      begin
        Panel_RCEE1_Lombardia_TH2O.Top := YY - Sep;
        Panel_RCEE1_Lombardia_TH2O.Visible := True;
        Inc(YY, (Panel_RCEE1_Lombardia_TH2O.Height));
      end;
      // Controllo dell'impianto
      Panel_RCEE2_ControlloImpianto.Top := YY;
      Panel_RCEE2_ControlloImpianto.Visible := True;
      Inc(YY, (Panel_RCEE2_ControlloImpianto.Height + Sep));
      // Controllo e verifica energetica del gruppo termico
      Panel_RCEE2_GruppoFrigo.Top := YY;
      Panel_RCEE2_GruppoFrigo.Visible := True;
      Inc(YY, (Panel_RCEE2_GruppoFrigo.Height + Sep));
      // Se abilitati gli extra della Lombardia aggiunge un altro pannello
      // Panel_G_ControlloRendimentoCombustione
      PanelFrigoAnalisiRendimento.Top := YY;
      PanelFrigoAnalisiRendimento.Visible := True;
      Inc(YY, (PanelFrigoAnalisiRendimento.Height + Sep));
      //  Integrazione Lombardia alla sezione "Controllo e verifica energetica del gruppo frigo"
      if LO.Readbool(Sezione, 'IntegrazioneLombardia', False) then
      begin
        PanelFrigoAnalisiRendimentoEstLombardia.Top := YY - Sep;
        PanelFrigoAnalisiRendimentoEstLombardia.Visible := True;
        Inc(YY, (PanelFrigoAnalisiRendimentoEstLombardia.Height));
        // -----
        Panel_RCEE1_Lombardia_GruppoTermico2.Top := YY;  // NoSeparazione
        Panel_RCEE1_Lombardia_GruppoTermico2.Visible := True;
        Inc(YY, (Panel_RCEE1_Lombardia_GruppoTermico2.Height));
      end;
      // Check-List
      Panel_RCEE2_CheckList.Top := YY;
      Panel_RCEE2_CheckList.Visible := True;
      Inc(YY, (Panel_RCEE2_CheckList.Height + Sep));
      // Se abilitati gli extra della Emilia-Romagna aggiunge un altro pannello
      //  dal titolo "Sistemi di termoregolazione e contabilizzazione del calore"
      if LO.Readbool(Sezione, 'IntegrazioneEmiliaRomagna', False) then
      begin
        PanelTermoregolazione.Top := YY;
        PanelTermoregolazione.Visible := True;
        Inc(YY, (PanelTermoregolazione.Height + Sep));
      end;
      // Panel_G_Osservazioni
      Panel_G_Osservazioni.Top := YY;
      Panel_G_Osservazioni.Visible := True;
      Inc(YY, (Panel_G_Osservazioni.Height + Sep));
      // Panel_G_Raccomandazioni
      Panel_G_Raccomandazioni.Top := YY;
      Panel_G_Raccomandazioni.Visible := True;
      Inc(YY, (Panel_G_Raccomandazioni.Height + Sep));
      // Panel_G_Prescrizioni
      Panel_G_Prescrizioni.Top := YY;
      Panel_G_Prescrizioni.Visible := True;
      Inc(YY, (Panel_G_Prescrizioni.Height + Sep));
      // Panel_G_Tecnico
      Panel_G_Tecnico.Top := YY;
      Panel_G_Tecnico.Visible := True;
      Inc(YY, (Panel_G_Tecnico.Height + Sep));
      // Panel_Bollino
      PanelBollino.Top := YY;
      PanelBollino.Visible := True;
      Inc(YY, (PanelBollino.Height + Sep));
      // IMpostazione scrollbar
      ClientArea.VertScrollBar.Range := YY;
      ClientArea.VertScrollBar.Position := 0;
      // =========================================================================

    end else if LeftStr(QryAllTIPO.AsString,1) = 'G' then begin

      // =========================================================================
      // ALLEGATO G
      // -------------------------------------------------------------------------
      // IMpostazione etichetta del tipo di documento
      LabelDocumento.Caption := '  ALLEGATO - G';
      // Panel_G_UbicazioneImpianto
      Panel_G_UbicazioneImpianto.Top := YY;
      Panel_G_UbicazioneImpianto.Visible := True;
      Inc(YY, (Panel_G_UbicazioneImpianto.Height + Sep));
      // Panel_G_Proprietario
      Panel_G_Proprietario.Top := YY;
      Panel_G_Proprietario.Visible := True;
      Inc(YY, (Panel_G_Proprietario.Height + Sep));
      // Panel_G_ResponsabileImpianto
      Panel_G_ResponsabileImpianto.Top := YY;
      Panel_G_ResponsabileImpianto.Visible := True;
      Inc(YY, (Panel_G_ResponsabileImpianto.Height + Sep));
      // Panel_G_IdentificazioneImpianto
      Panel_G_IdentificazioneImpianto.Top := YY;
      Panel_G_IdentificazioneImpianto.Visible := True;
      Inc(YY, (Panel_G_IdentificazioneImpianto.Height + Sep));
      // Panel_G_EsameVisivoImpianto
      Panel_G_EsameVisivoImpianto.Top := YY;
      Panel_G_EsameVisivoImpianto.Visible := True;
      Inc(YY, (Panel_G_EsameVisivoImpianto.Height + Sep));
      // Panel_G_ControlloRendimentoCombustione
      Panel_G_ControlloRendimentoCombustione.Top := YY;
      Panel_G_ControlloRendimentoCombustione.Visible := True;
      Inc(YY, (Panel_G_ControlloRendimentoCombustione.Height + Sep));
      // Panel_G_Osservazioni
      Panel_G_Osservazioni.Top := YY;
      Panel_G_Osservazioni.Visible := True;
      Inc(YY, (Panel_G_Osservazioni.Height + Sep));
      // Panel_G_Raccomandazioni
      Panel_G_Raccomandazioni.Top := YY;
      Panel_G_Raccomandazioni.Visible := True;
      Inc(YY, (Panel_G_Raccomandazioni.Height + Sep));
      // Panel_G_Prescrizioni
      Panel_G_Prescrizioni.Top := YY;
      Panel_G_Prescrizioni.Visible := True;
      Inc(YY, (Panel_G_Prescrizioni.Height + Sep));
      // Panel_G_Tecnico
      Panel_G_Tecnico.Top := YY;
      Panel_G_Tecnico.Visible := True;
      Inc(YY, (Panel_G_Tecnico.Height + Sep));
      // Panel_Bollino
      PanelBollino.Top := YY;
      PanelBollino.Visible := True;
      Inc(YY, (PanelBollino.Height + Sep));
      // IMpostazione scrollbar
      ClientArea.VertScrollBar.Range := YY;
      ClientArea.VertScrollBar.Position := 0;
      // =========================================================================

    end else if LeftStr(QryAllTIPO.AsString,1) = 'F' then begin

      // =========================================================================
      // ALLEGATO G
      // -------------------------------------------------------------------------
      // IMpostazione etichetta del tipo di documento
      LabelDocumento.Caption := '  ALLEGATO - F';
      // Panel_G_UbicazioneImpianto
      Panel_G_UbicazioneImpianto.Top := YY;
      Panel_G_UbicazioneImpianto.Visible := True;
      Inc(YY, (Panel_G_UbicazioneImpianto.Height + Sep));
      // Panel_G_Proprietario
      Panel_G_Proprietario.Top := YY;
      Panel_G_Proprietario.Visible := True;
      Inc(YY, (Panel_G_Proprietario.Height + Sep));
      // Panel_G_ResponsabileImpianto
      Panel_G_ResponsabileImpianto.Top := YY;
      Panel_G_ResponsabileImpianto.Visible := True;
      Inc(YY, (Panel_G_ResponsabileImpianto.Height + Sep));
      // Panel_F_IdentificazioneImpianto
      Panel_F_IdentificazioneImpianto.Top := YY;
      Panel_F_IdentificazioneImpianto.Visible := True;
      Inc(YY, (Panel_F_IdentificazioneImpianto.Height + Sep));
      // Panel_F_DocumentazioneTecnicaCorredo
      Panel_F_DocumentazioneTecnicaCorredo.Top := YY;
      Panel_F_DocumentazioneTecnicaCorredo.Visible := True;
      Inc(YY, (Panel_F_DocumentazioneTecnicaCorredo.Height + Sep));
      // Panel_F_EsameVisivoImpianto
      Panel_F_EsameVisivoImpianto.Top := YY;
      Panel_F_EsameVisivoImpianto.Visible := True;
      Inc(YY, (Panel_F_EsameVisivoImpianto.Height + Sep));
      // Panel_G_ControlloRendimentoCombustione
      Panel_G_ControlloRendimentoCombustione.Top := YY;
      Panel_G_ControlloRendimentoCombustione.Visible := True;
      Inc(YY, (Panel_G_ControlloRendimentoCombustione.Height + Sep));
      // Panel_G_Osservazioni
      Panel_G_Osservazioni.Top := YY;
      Panel_G_Osservazioni.Visible := True;
      Inc(YY, (Panel_G_Osservazioni.Height + Sep));
      // Panel_G_Raccomandazioni
      Panel_G_Raccomandazioni.Top := YY;
      Panel_G_Raccomandazioni.Visible := True;
      Inc(YY, (Panel_G_Raccomandazioni.Height + Sep));
      // Panel_G_Prescrizioni
      Panel_G_Prescrizioni.Top := YY;
      Panel_G_Prescrizioni.Visible := True;
      Inc(YY, (Panel_G_Prescrizioni.Height + Sep));
      // Panel_G_Tecnico
      Panel_G_Tecnico.Top := YY;
      Panel_G_Tecnico.Visible := True;
      Inc(YY, (Panel_G_Tecnico.Height + Sep));
      // Panel_Bollino
      PanelBollino.Top := YY;
      PanelBollino.Visible := True;
      Inc(YY, (PanelBollino.Height + Sep));
      // IMpostazione scrollbar
      ClientArea.VertScrollBar.Range := YY;
      ClientArea.VertScrollBar.Position := 0;
      // =========================================================================

    end;

    // ===========================================================================
    // CARICAMENTO PARAMETRI DA LAYOUTS.INI
    // ---------------------------------------------------------------------------
    // Abilita/Disabilita l'editing del campo n° di bacharach nell'analisi fumi
    //  NB: Chiesto dalla Climatec di San Clemente
    fAnalisiFumi_Bacharach := LO.Readbool(Sezione, 'AnalisiFumi_Bacharach', True);
    // Flag che indica se, quando si entra in modifica di un allegato, deve essere
    //  automaticamente impostato il campo "Analisi fumi effettuata" a "SI" in modo da
    //  non doverlo impostare a mano perchè tanto alcuni dicono che l'allegato bisogna farlo
    //  solo quando si fa anche l'analisi dei fumi e quindi...
    //  NB: L'anno chiesto Climatec di Conti Gianni e Termoidraulica Adriatica
    fAnalisiFumi_SiAutomatico := LO.Readbool(Sezione, 'AnalisiFumi_SiAutomatico', False);
  // Pulizie finali
  finally
    LO.Free;
  end;
  // ===========================================================================
end;


procedure TAllegatiFGForm.cxDBRadioGroup28PropertiesChange(Sender: TObject);
begin
  inherited;
  // In base alla selezione fa apparire e sposta il campo
  //  del combustibile nella posizione corretta
  dbeFrigoCombustibileAltro.Visible := False;
  case dbeFrigoTipologia.ItemIndex of
    1: begin
      dbeFrigoCombustibileAltro.Visible := True;
      dbeFrigoCombustibileAltro.Top := 165;
    end;
    3: begin
      dbeFrigoCombustibileAltro.Visible := True;
      dbeFrigoCombustibileAltro.Top := 199;
    end;
  end;
end;

procedure TAllegatiFGForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
  inherited;
     DM1.Attendere;
     try
       // A seconda che il tasto sia abbassato o meno svolge la funzione di
       //  attivare la modifica dei campi o disabilitarla.
       IF RxSpeedModifica.Down then
       begin
         // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
         //  tutto a posto.
         try
            // Tabella in editing mode
            QryAll.Edit;
            // Modica i pulsanti e i colori dei campi per la modifica
            RxSpeedButtonStampa.Enabled         := False;
            RxSpeedButtonUscita.Enabled         := False;
            SBProprietario.Enabled              := True;
            SBRespImp.Enabled                   := True;
            // Pulsante per l'inserimento facilitato
            SBInserimentoFacilitato.Enabled     := True;
            SBInserimentoFacilitato.Down        := False;
            SBInserimentoFacilitato_F.Enabled   := True;
            SBInserimentoFacilitato_F.Down      := False;
            // Per abilitare o meno lo SpeedButton di selezione del tecnico.
            SetTecnicoDaImpegno(TecnicoDaImpegno);
            // Colora tutti i campi per la modofica
            DM1.ColoraTuttiCampi(Self, COLOR_MODIFICA);
            // Procedure che colora e imposta appropriatamente i campi relativi all'analisi dei fumi
            //  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
            //  se l'analisifumi è stat effettuata oppure no.
            ImpostaCampiAnalisiFumi;
            // Procedure che colora e imposta appropriatamente i campi relativi alle prescrizioni
            //  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
            //  se l'impianto può funzionare in sicurezza oppure no
            ImpostaCampiPrescrizioni;
            // Flag che indica se, quando si entra in modifica di un allegato, deve essere
            //  automaticamente impostato il campo "Analisi fumi effettuata" a "SI" in modo da
            //  non doverlo impostare a mano perchè tanto alcuni dicono che l'allegato bisogna farlo
            //  solo quando si fa anche l'analisi dei fumi e quindi...
            //  NB: L'anno chiesto Climatec di Conti Gianni e Termoidraulica Adriatica
            if fAnalisiFumi_SiAutomatico then begin
              QryAllANFUMI_EFFETTUATO.Value := 'T';
            end;
            // Sposta il focus
            dbeZonaImm.SetFocus;
            dbeComuneImm.SetFocus;
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
            MR := DM1.ConfermaModifiche;
            if MR = mrYes then begin
                 // Se il responsabile dell'impianto è una persona giuridica la Ragione Sociale
                 //  è un campo obbligatorio
                 if eRagSocRespImp.Focused then Self.SelectNext(eRagSocRespImp, True, True);  // Per essere sicuri che il dato sia confermato
                 if (QryAllNATURAGIURIDICARESPIMP.AsString = 'G') and (Trim(QryAllRAGSOCRESPIMP.AsString) = '') then
                   raise Exception.Create('Campo obbligatorio ("Ragione Sociale" del Responsabile Impianto)');
                 // Se esiste la form dell'impegno relativo all'allegato ne fa eseguire il refresh per
                 //  aggiornare la situazione degli allegati.
                 fQueryAllegatiImpegnoDaAggiornare := True;
                 // Sposta il focus in modo da salvare il valore appena inserito anche se l'utente non ha onfermato con invio
                 dbeZonaImm.SetFocus;
                 dbeComuneImm.SetFocus;
                 // Visualizza il messaggio di operazione in corso
                 DM1.ShowWait('Documento', 'Conferma documento');
                 try
                   // COnferma i dati
                   QryAll.Post;
                   // Decide se gli allegati devono essere già visibili oppure no.
                   Allegati_VerificaAbilitazione;
                 finally
                   DM1.CloseWait;
                 end;
            end else if MR = mrNo then begin
               if QryAll.State = dsInsert then begin
                  QryAll.Cancel;
                  // Chiude il mesaggio di attesa
                  DM1.ChiudiAttendere;
                  Close;    // Chiude la form (altrimenti dà problemi)
                  Exit;
               end else begin
                  QryAll.Cancel;
              end;
            end else begin
                 RxSpeedModifica.Down := True;
                 DM1.ChiudiAttendere;
                 Exit;
            end;
            // Ripristina i pulsanti e i colori dei campi
            RxSpeedButtonStampa.Enabled         := True;
            RxSpeedButtonUscita.Enabled         := True;
            SBProprietario.Enabled              := False;
            SBRespImp.Enabled                   := False;
            // Pulsante per l'inserimento facilitato
            if SBInserimentoFacilitato.Down then begin
              SBInserimentoFacilitato.Down        := False;
              SBInserimentoFacilitatoClick(SBInserimentoFacilitato);
            end;
            SBInserimentoFacilitato_F.Enabled     := False;
            if SBInserimentoFacilitato_F.Down then begin
              SBInserimentoFacilitato_F.Down        := False;
              SBInserimentoFacilitato_FClick(SBInserimentoFacilitato_F);
            end;
            SBInserimentoFacilitato_F.Enabled     := False;
            // Per abilitare o meno lo SpeedButton di selezione del tecnico.
            SetTecnicoDaImpegno(TecnicoDaImpegno);
            // RImette i colori normali
            DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
            // Procedure che colora e imposta appropriatamente i campi relativi all'analisi dei fumi
            //  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
            //  se l'analisifumi è stat effettuata oppure no.
            ImpostaCampiAnalisiFumi;
            // Procedure che colora e imposta appropriatamente i campi relativi alle prescrizioni
            //  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
            //  se l'impianto può funzionare in sicurezza oppure no
            ImpostaCampiPrescrizioni;
         except
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 RxSpeedModifica.Down := True;
                 // Riabilita la modifica dei campi
                 QryAll.Edit;
            end;
         end;
       end;
     finally
       DM1.ChiudiAttendere;
     end;
end;

procedure TAllegatiFGForm.QryAllPROPCODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
   TmpStr: String;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, PartitaIVA, CodiceFiscale, Telefono, Cellulare');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + (Sender as TIntegerField).AsString);
      QryCli.Open;
      // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
      if not QryCli.Eof then begin
          QryAllPROPDENOMINAZIONE.Value   := DM2.GetDenominazioneSoggetto(QryCli);
          QryAllPROPINDIRIZZO.Value       := QryCli.FieldByName('Indirizzo').AsString;
          QryAllPROPNUMCIVICO.Value       := QryCli.FieldByName('NumCivico').AsString;
          QryAllPROPLOCALITA.Value        := QryCli.FieldByName('Citta').AsString;
          QryAllPROPCAP.Value             := QryCli.FieldByName('CAP').AsString;
          QryAllPROPPROVINCIA.Value       := QryCli.FieldByName('Provincia').AsString;
          QryAllPROPCODICEFISCALE.Value   := QryCli.FieldByName('CodiceFiscale').AsString;
          QryAllPROPTELEFONO.Value        := QryCli.FieldByName('Telefono').AsString;
          QryAllPROPCELLULARE.Value       := QryCli.FieldByName('Cellulare').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TAllegatiFGForm.QryAllCODICERESPIMPChange(Sender: TField);
var
   QryCli: TIB_Cursor;
   TmpStr: String;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, Nome, Cognome, TipoPersona, Indirizzo, NumCivico, Citta, CAP, Provincia, PartitaIVA, CodiceFiscale, Telefono, Cellulare');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + (Sender as TIntegerField).AsString);
      QryCli.Open;
      // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
      if not QryCli.Eof then begin
          QryAllRAGSOCRESPIMP.Value          := QryCli.FieldByName('RagioneSociale').AsString;
          QryAllNOMERESPIMP.Value            := QryCli.FieldByName('Nome').AsString;
          QryAllCOGNOMERESPIMP.Value         := QryCli.FieldByName('Cognome').AsString;
          QryAllNATURAGIURIDICARESPIMP.Value := QryCli.FieldByName('TipoPersona').AsString;
          QryAllINDIRIZZORESPIMP.Value       := QryCli.FieldByName('Indirizzo').AsString;
          QryAllNUMCIVICORESPIMP.Value       := QryCli.FieldByName('NumCivico').AsString;
          QryAllCITTARESPIMP.Value           := QryCli.FieldByName('Citta').AsString;
          QryAllCAPRESPIMP.Value             := QryCli.FieldByName('CAP').AsString;
          QryAllPROVINCIARESPIMP.Value       := QryCli.FieldByName('Provincia').AsString;
          QryAllCODICEFISCALERESPIMP.Value   := QryCli.FieldByName('CodiceFiscale').AsString;
          QryAllTELEFONORESPIMP.Value        := QryCli.FieldByName('Telefono').AsString;
          QryAllCELLULARERESPIMP.Value       := QryCli.FieldByName('Cellulare').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TAllegatiFGForm.SBProprietarioClick(Sender: TObject);
begin
  inherited;
   DM1.SelezionaCliente(QryAllPROPCODICE, nil, nil, '');
end;

procedure TAllegatiFGForm.SBRespImpClick(Sender: TObject);
begin
  inherited;
   DM1.SelezionaCliente(QryAllCODICERESPIMP, nil, nil, '');
end;

procedure TAllegatiFGForm.SBTecnicoClick(Sender: TObject);
begin
      DM1.Attendere;
      try
        // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
        Application.CreateForm(TTecniciForm, TecniciForm);
        TecniciForm.Parent := MainForm;
        TecniciForm.Tag := 998;   // Abilita la seleziona del tecnico
        TecniciForm.Show;
      finally
        DM1.ChiudiAttendere;
      end;
end;

procedure TAllegatiFGForm.SBEspandiProprietarioClick(Sender: TObject);
begin
  inherited;
   DM1.VisualizzaCliente(QryAllPROPCODICE.Value);
end;

procedure TAllegatiFGForm.SBEspandiRespImpClick(Sender: TObject);
begin
  inherited;
   DM1.VisualizzaCliente(QryAllCODICERESPIMP.Value);
end;

procedure TAllegatiFGForm.GenCal_CostruttoreDropDown(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(COSTRUTTORE) FROM PRATAPPARECCHI WHERE UPPER(TIPOAPPARECCHIO) = UPPER(''Generatore di calore'') AND TRIM(COSTRUTTORE) <> ''''');
      Qry.Open;
      (Sender as TDBComboBox).Items.Clear;
      (Sender as TDBComboBox).Items.Add('');
      while not Qry.Eof do begin
         (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAllegatiFGForm.GenCal_ModelloDropDown(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(MODELLO) FROM PRATAPPARECCHI WHERE COSTRUTTORE LIKE ''%' + QryAllGENCAL_COSTRUTTORE.AsString + '%'' AND TIPOAPPARECCHIO = ''Generatore di calore'' AND TRIM(MODELLO) <> ''''');
      Qry.Open;
      (Sender as TDBComboBox).Items.Clear;
      (Sender as TDBComboBox).Items.Add('');
      while not Qry.Eof do begin
         (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAllegatiFGForm.GenCal_LocaleInstallazioneDropDown(
  Sender: TObject);
var
   Qry : TIB_Cursor;
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
      while not Qry.Eof do begin
         (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAllegatiFGForm.GenCal_MarcaEfficienzaEnergDropDown(
  Sender: TObject);
var
   Qry : TIB_Cursor;
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
      while not Qry.Eof do begin
         (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAllegatiFGForm.GenCal_FluidoTermovettoreDropDown(
  Sender: TObject);
var
   Qry : TIB_Cursor;
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
      while not Qry.Eof do begin
         (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAllegatiFGForm.dbePropRagSocEnter(Sender: TObject);
begin
  inherited;
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TAllegatiFGForm.dbePropRagSocExit(Sender: TObject);
begin
  inherited;
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TAllegatiFGForm.F_Bruc_CostruttoreDropDown(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(COSTRUTTORE) FROM PRATAPPARECCHI WHERE UPPER(TIPOAPPARECCHIO) = UPPER(''Bruciatore'') AND TRIM(COSTRUTTORE) <> ''''');
      Qry.Open;
      (Sender as TDBComboBox).Items.Clear;
      (Sender as TDBComboBox).Items.Add('');
      while not Qry.Eof do begin
         (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAllegatiFGForm.F_Bruc_ModelloDropDown(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(MODELLO) FROM PRATAPPARECCHI WHERE COSTRUTTORE LIKE ''%' + QryAllBRUC_COSTRUTTORE.AsString + '%'' AND TIPOAPPARECCHIO = ''Bruciatore'' AND TRIM(MODELLO) <> ''''');
      Qry.Open;
      (Sender as TDBComboBox).Items.Clear;
      (Sender as TDBComboBox).Items.Add('');
      while not Qry.Eof do begin
         (Sender as TDBComboBox).Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAllegatiFGForm.SetDataOraControllaDaImpegno(const Value:Boolean);
begin
  // Se siamo in modalità "SoloPerLaStampa" non lo permette
  if SoloPerStampare then Exit;
  // Salva il nuovo valore
  fDataOraControllaDaImpegno          := Value;
  // Se Dati dall'impegno rende a sola lettura i controlli
  if Value then begin

    eDataControllo.Properties.ReadOnly      := True;
    eDataControllo.Tag                      := -1;                            // Così non cambia più colore
    eDataControllo.Style.Color              := ShapeDocumento.Brush.Color;    // Stesso solore dello sfondo
    eDataControllo.TabStop                  := False;
    eDataControllo.DataBinding.DataField    := '';                            // Altrimenti poi da un errore quando cambio il DataSource
    eDataControllo.DataBinding.DataSource   := DataSourceFromImpegni;
    eDataControllo.DataBinding.DataField    := FieldDataOraInizioIntervento.FieldName;
    eDataControllo.Style.ButtonTransparency := ebtHideInactive;

    eOrarioArrivo.Properties.ReadOnly       := True;
    eOrarioArrivo.Tag                       := -1;                            // Così non cambia più colore
    eOrarioArrivo.Style.Color               := ShapeDocumento.Brush.Color;    // Stesso solore dello sfondo
    eOrarioArrivo.TabStop                   := False;
    eOrarioArrivo.DataBinding.DataField    := '';                             // Altrimenti poi da un errore quando cambio il DataSource
    eOrarioArrivo.DataBinding.DataSource    := DataSourceFromImpegni;
    eOrarioArrivo.DataBinding.DataField     := FieldDataOraInizioIntervento.FieldName;
    eOrarioArrivo.Style.ButtonTransparency  := ebtHideInactive;

    eOrarioPartenza.Properties.ReadOnly     := True;
    eOrarioPartenza.Tag                     := -1;                            // Così non cambia più colore
    eOrarioPartenza.Style.Color             := ShapeDocumento.Brush.Color;    // Stesso solore dello sfondo
    eOrarioPartenza.TabStop                 := False;
    eOrarioPartenza.DataBinding.DataField    := '';                           // Altrimenti poi da un errore quando cambio il DataSource
    eOrarioPartenza.DataBinding.DataSource  := DataSourceFromImpegni;
    eOrarioPartenza.DataBinding.DataField   := FieldDataOraFineIntervento.FieldName;
    eOrarioPartenza.Style.ButtonTransparency:= ebtHideInactive;

  // Se invece i dati sono locali
  end else begin

    eDataControllo.Properties.ReadOnly      := False;
    eDataControllo.Tag                      := 0;                             // Così non cambia più colore
    if RxSpeedModifica.Down then eDataControllo.Style.Color := COLOR_MODIFICA else eDataControllo.Style.Color := COLOR_NORMALE;
    eDataControllo.TabStop                  := True;
    eDataControllo.DataBinding.DataField    := '';                            // Altrimenti poi da un errore quando cambio il DataSource
    eDataControllo.DataBinding.DataSource   := SourceAll;
    eDataControllo.DataBinding.DataField    := QryAllDATACONTROLLO.FieldName;
    eDataControllo.Style.ButtonTransparency := ebtNone;

    eOrarioArrivo.Properties.ReadOnly      := False;
    eOrarioArrivo.Tag                      := 0;                             // Così non cambia più colore
    if RxSpeedModifica.Down then eOrarioArrivo.Style.Color := COLOR_MODIFICA else eOrarioArrivo.Style.Color := COLOR_NORMALE;
    eOrarioArrivo.TabStop                  := True;
    eOrarioArrivo.DataBinding.DataField    := '';                            // Altrimenti poi da un errore quando cambio il DataSource
    eOrarioArrivo.DataBinding.DataSource   := SourceAll;
    eOrarioArrivo.DataBinding.DataField    := QryAllDATAORAARRIVO.FieldName;
    eOrarioArrivo.Style.ButtonTransparency := ebtNone;

    eOrarioPartenza.Properties.ReadOnly      := False;
    eOrarioPartenza.Tag                      := 0;                             // Così non cambia più colore
    if RxSpeedModifica.Down then eOrarioPartenza.Style.Color := COLOR_MODIFICA else eOrarioPartenza.Style.Color := COLOR_NORMALE;
    eOrarioPartenza.TabStop                  := True;
    eOrarioPartenza.DataBinding.DataField    := '';                            // Altrimenti poi da un errore quando cambio il DataSource
    eOrarioPartenza.DataBinding.DataSource   := SourceAll;
    eOrarioPartenza.DataBinding.DataField    := QryAllDATAORAPARTENZA.FieldName;
    eOrarioPartenza.Style.ButtonTransparency := ebtNone;

  end;
end;

procedure TAllegatiFGForm.QryAllDATAORADAIMPEGNOChange(Sender: TField);
begin
  inherited;
  DataOraControllaDaImpegno := (Sender.AsString <> 'F') or (Sender.IsNull);
end;

procedure TAllegatiFGForm.QryAllAfterOpen(DataSet: TDataSet);
begin
  inherited;
  // Inizializzazione flag per DataOraInizio e fine da Impegno
  // NB: Anche quello per il tecnico
  DataOraControllaDaImpegno := QryAllDATAORADAIMPEGNO.AsString <> 'F';
  TecnicoDaImpegno := QryAllTECNICO_DAIMPEGNO.AsString <> 'F';
end;

procedure TAllegatiFGForm.SetTecnicoDaImpegno(const Value: Boolean);
begin
  fTecnicoDaImpegno := Value;
  // Se il tecnico deve essere quello dell'impegno...
  if Value then begin

    SBTecnico.Enabled := False;

    dbeTecnicoNome.ReadOnly := True;
    dbeTecnicoNome.Tag := -1; // Così non cambia più colore
    dbeTecnicoNome.ParentColor := True;
    dbeTecnicoNome.TabStop := False;

    dbeTecnicoRagSoc.ReadOnly := True;
    dbeTecnicoRagSoc.Tag := -1; // Così non cambia più colore
    dbeTecnicoRagSoc.ParentColor := True;
    dbeTecnicoRagSoc.TabStop := False;

    dbeTecnicoIndirizzo.ReadOnly := True;
    dbeTecnicoIndirizzo.Tag := -1; // Così non cambia più colore
    dbeTecnicoIndirizzo.ParentColor := True;
    dbeTecnicoIndirizzo.TabStop := False;

    dbeTecnicoTelefono.ReadOnly := True;
    dbeTecnicoTelefono.Tag := -1; // Così non cambia più colore
    dbeTecnicoTelefono.ParentColor := True;
    dbeTecnicoTelefono.TabStop := False;

    dbeTecnicoEstremiDocQualifica.ReadOnly := True;
    dbeTecnicoEstremiDocQualifica.Tag := -1; // Così non cambia più colore
    dbeTecnicoEstremiDocQualifica.ParentColor := True;
    dbeTecnicoEstremiDocQualifica.TabStop := False;

  // Se invece il tecnico è locale
  end else begin

    SBTecnico.Enabled := RxSpeedModifica.Down;

    dbeTecnicoNome.ReadOnly := False;
    dbeTecnicoNome.Tag := 0; // Così cambia di nuovo colore
    if RxSpeedModifica.Down then dbeTecnicoNome.Color := COLOR_MODIFICA else dbeTecnicoNome.Color := COLOR_NORMALE;
    dbeTecnicoNome.TabStop := True;

    dbeTecnicoRagSoc.ReadOnly := False;
    dbeTecnicoRagSoc.Tag := 0; // Così cambia di nuovo colore
    if RxSpeedModifica.Down then dbeTecnicoRagSoc.Color := COLOR_MODIFICA else dbeTecnicoRagSoc.Color := COLOR_NORMALE;
    dbeTecnicoRagSoc.TabStop := True;

    dbeTecnicoIndirizzo.ReadOnly := False;
    dbeTecnicoIndirizzo.Tag := 0; // Così cambia di nuovo colore
    if RxSpeedModifica.Down then dbeTecnicoIndirizzo.Color := COLOR_MODIFICA else dbeTecnicoIndirizzo.Color := COLOR_NORMALE;
    dbeTecnicoIndirizzo.TabStop := True;

    dbeTecnicoTelefono.ReadOnly := False;
    dbeTecnicoTelefono.Tag := 0; // Così cambia di nuovo colore
    if RxSpeedModifica.Down then dbeTecnicoTelefono.Color := COLOR_MODIFICA else dbeTecnicoTelefono.Color := COLOR_NORMALE;
    dbeTecnicoTelefono.TabStop := True;

    dbeTecnicoEstremiDocQualifica.ReadOnly := False;
    dbeTecnicoEstremiDocQualifica.Tag := 0; // Così cambia di nuovo colore
    if RxSpeedModifica.Down then dbeTecnicoEstremiDocQualifica.Color := COLOR_MODIFICA else dbeTecnicoEstremiDocQualifica.Color := COLOR_NORMALE;
    dbeTecnicoEstremiDocQualifica.TabStop := True;

  end;
end;

procedure TAllegatiFGForm.QryAllTECNICO_DAIMPEGNOChange(Sender: TField);
begin
  inherited;
  // Alla variazione della selezione del campo aggiorna lo schermo
  TecnicoDaImpegno := Sender.AsString <> 'F';
end;

procedure TAllegatiFGForm.Button1Click(Sender: TObject);
begin
  inherited;
  ReportDesignerDialog1.NewReport('', False);
end;

procedure TAllegatiFGForm.AllegatoGfrontespizio1Click(Sender: TObject);
begin
  inherited;
  // Anteprima
  if MenuStampe.Tag = 0 then begin
     ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'New_Allegato_G_Lombardia_NoteIntegrate.QR2');
  // Stampa
  end else if MenuStampe.Tag = 1 then begin
     MenuStampe.Tag := 0;
     DM1.Attendere;
     try
       ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'New_Allegato_G_Lombardia_NoteIntegrate.QR2');
     finally
       DM1.ChiudiAttendere;
     end;
  end;
end;

procedure TAllegatiFGForm.RxSpeedButtonStampaClick(Sender: TObject);
var
   ClientPoint, ScreenPoint: TPoint;
begin
  inherited;
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

procedure TAllegatiFGForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   ClientPoint, ScreenPoint: TPoint;
begin
  inherited;
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

procedure TAllegatiFGForm.dbeAnFumi_TempFumiKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = '.' then Key := ',';
end;

procedure TAllegatiFGForm.QryAllCalcFields(DataSet: TDataSet);
begin
  inherited;
  // Indirizzo completo Responsabile Impianto
  QryAllINDIRIZZORESPIMP_FULL.Value := Trim(QryAllINDIRIZZOIMM.AsString) + ' ' + Trim(QryAllNUMCIVICORESPIMP.AsString) + ' - ' + Trim(QryAllCAPRESPIMP.AsString) + ' ' + Trim(QryAllCITTARESPIMP.AsString) + '  (' + Trim(QryAllPROVINCIARESPIMP.AsString) + ')';
  // Indirizzo completo Proprietario
  QryAllPROPINDIRIZZO_FULL.Value := Trim(QryAllPROPINDIRIZZO.AsString) + ' ' + Trim(QryAllPROPNUMCIVICO.AsString) + ' - ' + Trim(QryAllPROPCAP.AsString) + ' ' + Trim(QryAllPROPLOCALITA.AsString) + '  (' + Trim(QryAllPROPPROVINCIA.AsString) + ')';
  // Indirizzo completo Tecnico
  QryAllTECNICO_INDIRIZZO_FULL.Value := Trim(QryAllTECNICO_INDIRIZZO.AsString) + ' - ' + Trim(QryAllTECNICO_TELEFONO.AsString);

  // Bollino
  QryAllBOLLINO_CALC.Value := Trim(QryAllBOLLINO_PREFISSO.AsString + ' ' + QryAllBOLLINO_NUMERO.AsString);

  // ===========================================================================
  // Verifica l'indirizzo con la stradario per certificarlo
  // ---------------------------------------------------------------------------
  if DM2.Stradario_IndirizzoVerificato(QryAllCODICEISTATCOMUNEIMM.AsString, QryAllCOMUNEIMM.AsString, QryAllINDIRIZZOIMM.AsString, QryAllPROVINCIAIMM.AsString)
  then QryAllCOMPUTED_STR_CERTIFIED_IMM.AsString := 'T'
  else QryAllCOMPUTED_STR_CERTIFIED_IMM.AsString := 'F';
  // ===========================================================================
end;

procedure TAllegatiFGForm.EditInserimentoFacilitatoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  NewVal: String;
  CurrRadioGroup: TcxDBRadioGroup;
begin
  inherited;
  try
    // Inizializzazione
    NewVal := '';
    // In base al pulsante premuto dall'utente determina il valore da inserire
    case Key of
      VK_Left:  NewVal := 'T';
      VK_Down:  NewVal := 'F';
      VK_Right: NewVal := 'N';
    end;
    // Se l'utente non ha premuto uno dei pulsanti previsti esce subito senza fare nulla
    if NewVal = '' then begin
      // Esce
      Exit;
    end;
    // ------------------------------------
    // Punta all'editor della voce corrente
    CurrRadioGroup := fInserimentoFacilitato_Array[fInserimentoFacilitato_Index] as TcxDBRadioGroup;
    // Assegna il valore
    CurrRadioGroup.DataBinding.Field.AsString := NewVal;
    // Rimette il controllo corrente al suo colore normale
    CurrRadioGroup.ParentColor := True;
    // ------------------------------------
    // Se siamo arrivati alla fine esce dall'inserimento facilitato
    if fInserimentoFacilitato_Index = (Length(fInserimentoFacilitato_Array) - 1) then begin
      // Esce dalla modalità di inserimento faciltato
      SBInserimentoFacilitato.Down := False;
      SBInserimentoFacilitatoClick(SBInserimentoFacilitato);
      // Esce
      Exit;
    end;
    // Passa al prossimo
    inc(fInserimentoFacilitato_Index);
    // Evidenzia il successivo
    (fInserimentoFacilitato_Array[fInserimentoFacilitato_Index] as TcxDBRadioGroup).Style.Color := COLOR_FOCUS;
  finally
    // Annulla la pressione del pulsante
    Key := 0;
  end;
end;

procedure TAllegatiFGForm.SBInserimentoFacilitatoClick(Sender: TObject);
begin
  inherited;
  // Se è premuto attiva l'inserimento facilitato
  if SBInserimentoFacilitato.Down then begin
  // Inizializzazione del sistema di inserimento facilitato
  fInserimentoFacilitato_Index := 0;
    // Dimensionamento e assegnazione dell'array contenente il controlli da inserire
    SetLength(fInserimentoFacilitato_Array, 31);
    fInserimentoFacilitato_Array[0]  := dbeB1;
    fInserimentoFacilitato_Array[1]  := dbeB2;
    fInserimentoFacilitato_Array[2]  := dbeB3;
    fInserimentoFacilitato_Array[3]  := dbeC1;
    fInserimentoFacilitato_Array[4]  := dbeC2;
    fInserimentoFacilitato_Array[5]  := dbeC3;
    fInserimentoFacilitato_Array[6]  := dbeD1;
    fInserimentoFacilitato_Array[7]  := dbeD2;
    fInserimentoFacilitato_Array[8]  := dbeD3;
    fInserimentoFacilitato_Array[9]  := dbeD4;
    fInserimentoFacilitato_Array[10] := dbeD5;
    fInserimentoFacilitato_Array[11] := dbeE1;
    fInserimentoFacilitato_Array[12] := dbeE2;
    fInserimentoFacilitato_Array[13] := dbeE3;
    fInserimentoFacilitato_Array[14] := dbeE4;
    fInserimentoFacilitato_Array[15] := dbeE5;
    fInserimentoFacilitato_Array[16] := dbeF1;
    fInserimentoFacilitato_Array[17] := dbeF2;
    fInserimentoFacilitato_Array[18] := dbeF3;
    fInserimentoFacilitato_Array[19] := dbeF4;
    fInserimentoFacilitato_Array[20] := dbeF5;
    fInserimentoFacilitato_Array[21] := dbeF6;
    fInserimentoFacilitato_Array[22] := dbeF7;
    fInserimentoFacilitato_Array[23] := dbeF8;
    fInserimentoFacilitato_Array[24] := dbeF9;
    fInserimentoFacilitato_Array[25] := dbeF10;
    fInserimentoFacilitato_Array[26] := dbeF11;
    fInserimentoFacilitato_Array[27] := dbeF12;
    fInserimentoFacilitato_Array[28] := dbeG1;
    fInserimentoFacilitato_Array[29] := dbeG2;
    fInserimentoFacilitato_Array[30] := dbeG3;
    // Evidenzia il primo
    fInserimentoFacilitato_Array[0].Style.Color := COLOR_FOCUS;
    // Rende visibile il DBEdit sul quale metterà il ocus e intercetterà la pressione dei pulsanti
    //  cursore ma fà in modo non venga visto dall'utente.
    EditInserimentoFacilitato.Left    := -1000;
    EditInserimentoFacilitato.Visible := True;
    EditInserimentoFacilitato.SetFocus;
  // Se invece è stato risollevato interrompe l'inserimento facilitato
  end else begin
    // All'uscita dalla modalità di inserimento semplificato imposta il focus
    //  sull'ultimo controllo.
    fInserimentoFacilitato_Array[fInserimentoFacilitato_Index].SetFocus;
    // Disabilita il dbEdit e sposta il focus al controllo successivo
    EditInserimentoFacilitato.Visible := False;
    // Messaggio per l'utente
    DM1.Messaggi('Levante', 'Inserimento facilitato terminato!', '', [mbOk], 0, nil);
  end;
end;

procedure TAllegatiFGForm.EditInserimentoFacilitatoExit(Sender: TObject);
begin
  inherited;
  // Se esce dal DBEdit disabilita l'inserimento facilitato
  if SBInserimentoFacilitato.Down then begin
    SBInserimentoFacilitato.Down := False;
    SBInserimentoFacilitatoClick(SBInserimentoFacilitato);
  end;
end;


// Procedure che colora e imposta appropriatamente i campi relativi all'analisi dei fumi
//  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
//  se l'analisifumi è stat effettuata oppure no.
procedure TAllegatiFGForm.ImpostaCampiAnalisiFumi;
var
  InEditing: Boolean;
  ColoreCampi: TColor;
begin
  // Inizializzazione
  InEditing := RxSpeedModifica.Down and (QryAllANFUMI_EFFETTUATO.AsString = 'T');
  if InEditing then ColoreCampi := COLOR_MODIFICA else ColoreCampi := COLOR_NORMALE;

  // IMpostazione campi
  dbeAnFumi_TempFumi.Properties.ReadOnly              := not InEditing;
  dbeAnFumi_TempAmbiente.Properties.ReadOnly          := not InEditing;
  dbeAnFumi_O2_Perc.Properties.ReadOnly               := not InEditing;
  dbeAnFumi_CO2_Perc.Properties.ReadOnly              := not InEditing;
  dbeAnFumi_Bacharach.Properties.ReadOnly             := (not InEditing) or (not fAnalisiFumi_Bacharach);
  dbeAnFumi_Bacharach2.Properties.ReadOnly            := (not InEditing) or (not fAnalisiFumi_Bacharach);
  dbeAnFumi_Bacharach3.Properties.ReadOnly            := (not InEditing) or (not fAnalisiFumi_Bacharach);
  dbeAnFumi_CO_ppm.Properties.ReadOnly                := not InEditing;
  dbeAnFumi_RendCombustione_Perc.Properties.ReadOnly  := not InEditing;
  dbeAnFumi_RendMinimo.Properties.ReadOnly            := not InEditing;
  dbeAnFumi_NOX_ppm.Properties.ReadOnly               := not InEditing;
  dbeAnFumi_ModuloTermico.Properties.ReadOnly         := not InEditing;
  dbeAnFumi_PotTermEff_kw.Properties.ReadOnly         := not InEditing;
  dbeAnFumi_COFumiSecchi_ppm.Properties.ReadOnly      := not InEditing;
  dbeAnFumi_PortataComb_m3h.Properties.ReadOnly       := not InEditing;

  dbeAnFumi_TempFumi.TabStop              := InEditing;
  dbeAnFumi_TempAmbiente.TabStop          := InEditing;
  dbeAnFumi_O2_Perc.TabStop               := InEditing;
  dbeAnFumi_CO2_Perc.TabStop              := InEditing;
  dbeAnFumi_Bacharach.TabStop             := InEditing and fAnalisiFumi_Bacharach;
  dbeAnFumi_Bacharach2.TabStop            := InEditing and fAnalisiFumi_Bacharach;
  dbeAnFumi_Bacharach3.TabStop            := InEditing and fAnalisiFumi_Bacharach;
  dbeAnFumi_CO_ppm.TabStop                := InEditing;
  dbeAnFumi_RendCombustione_Perc.TabStop  := InEditing;
  dbeAnFumi_RendMinimo.TabStop            := InEditing;
  dbeAnFumi_NOX_ppm.TabStop               := InEditing;
  dbeAnFumi_ModuloTermico.TabStop         := InEditing;
  dbeAnFumi_PotTermEff_kw.TabStop         := InEditing;
  dbeAnFumi_COFumiSecchi_ppm.TabStop         := InEditing;
  dbeAnFumi_PortataComb_m3h.TabStop         := InEditing;

  dbeAnFumi_TempFumi.Style.Color              := ColoreCampi;
  dbeAnFumi_TempAmbiente.Style.Color          := ColoreCampi;
  dbeAnFumi_O2_Perc.Style.Color               := ColoreCampi;
  dbeAnFumi_CO2_Perc.Style.Color              := ColoreCampi;
  if fAnalisiFumi_Bacharach then
  begin
    dbeAnFumi_Bacharach.Style.Color  := ColoreCampi;
    dbeAnFumi_Bacharach2.Style.Color := ColoreCampi;
    dbeAnFumi_Bacharach3.Style.Color := ColoreCampi;
  end
  else
  begin
    dbeAnFumi_Bacharach.ParentColor  := True;
    dbeAnFumi_Bacharach2.ParentColor := True;
    dbeAnFumi_Bacharach3.ParentColor := True;
    dbeAnFumi_Bacharach.Tag  := -1;
    dbeAnFumi_Bacharach2.Tag := -1;
    dbeAnFumi_Bacharach3.Tag := -1;
  end;
  dbeAnFumi_CO_ppm.Style.Color                := ColoreCampi;
  dbeAnFumi_RendCombustione_Perc.Style.Color  := ColoreCampi;
  dbeAnFumi_RendMinimo.Style.Color            := ColoreCampi;
  dbeAnFumi_NOX_ppm.Style.Color               := ColoreCampi;
  dbeAnFumi_ModuloTermico.Style.Color         := ColoreCampi;
  dbeAnFumi_PotTermEff_kw.Style.Color         := ColoreCampi;
  dbeAnFumi_COFumiSecchi_ppm.Style.Color      := ColoreCampi;
  dbeAnFumi_PortataComb_m3h.Style.Color       := ColoreCampi;
end;


procedure TAllegatiFGForm.dbeAnalisiFumiEffettuataPropertiesChange(
  Sender: TObject);
begin
  inherited;
  // Procedure che colora e imposta appropriatamente i campi relativi all'analisi dei fumi
  //  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
  //  se l'analisifumi è stat effettuata oppure no.
  ImpostaCampiAnalisiFumi;
end;



// Procedure che colora e imposta appropriatamente i campi relativi alle prescrizioni
//  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
//  se l'impianto può funzionare in sicurezza oppure no
procedure TAllegatiFGForm.ImpostaCampiPrescrizioni;
var
  InEditing: Boolean;
  ColoreCampi: TColor;
begin
  // Inizializzazione
  InEditing := RxSpeedModifica.Down and (QryAllIMPPUOFUNZIONARE.AsString = 'F');
  if InEditing then ColoreCampi := COLOR_MODIFICA else ColoreCampi := COLOR_NORMALE;
  // IMpostazione campi
  dbePrescrizioni.Properties.ReadOnly  := not InEditing;
  dbePrescrizioni.TabStop              := InEditing;
  dbePrescrizioni.Style.Color          := ColoreCampi;
end;


procedure TAllegatiFGForm.LabelDocumentoDblClick(Sender: TObject);
begin
  inherited;
  ReportDesignerDialog1.NewReport('', False);
end;

procedure TAllegatiFGForm.dbeImpiantoPuoFunzionarePropertiesChange(
  Sender: TObject);
begin
  inherited;
  // Procedure che colora e imposta appropriatamente i campi relativi alle prescrizioni
  //  in modo che siano editabili solo se l'utente ha impostato il radio button che indica
  //  se l'impianto può funzionare in sicurezza oppure no
  ImpostaCampiPrescrizioni;
end;



procedure TAllegatiFGForm.dbeNaturaGiuridicaPropertiesChange(Sender: TObject);
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

procedure TAllegatiFGForm.SBInserimentoFacilitato_FClick(Sender: TObject);
begin
  inherited;
  // Se è premuto attiva l'inserimento facilitato
  if SBInserimentoFacilitato_F.Down then begin
    // Inizializzazione del sistema di inserimento facilitato
    fInserimentoFacilitato_Index := 0;
    // Dimensionamento e assegnazione dell'array contenente il controlli da inserire
    SetLength(fInserimentoFacilitato_Array, 26);
    fInserimentoFacilitato_Array[0]  := dbe_F_B1;
    fInserimentoFacilitato_Array[1]  := dbe_F_B2;
    fInserimentoFacilitato_Array[2]  := dbe_F_B3;
    fInserimentoFacilitato_Array[3]  := dbe_F_B4;
    fInserimentoFacilitato_Array[4]  := dbe_F_B5;
    fInserimentoFacilitato_Array[5]  := dbe_F_B6;
    fInserimentoFacilitato_Array[6]  := dbe_F_B7;
    fInserimentoFacilitato_Array[7]  := dbe_F_B8;
    fInserimentoFacilitato_Array[8]  := dbe_F_B9;
    fInserimentoFacilitato_Array[9]  := dbe_F_B10;
    fInserimentoFacilitato_Array[10] := dbe_F_C11;
    fInserimentoFacilitato_Array[11] := dbe_F_C12;
    fInserimentoFacilitato_Array[12] := dbe_F_C13;
    fInserimentoFacilitato_Array[13] := dbe_F_C20;
    fInserimentoFacilitato_Array[14] := dbe_F_C31;
    fInserimentoFacilitato_Array[15] := dbe_F_C32;
    fInserimentoFacilitato_Array[16] := dbe_F_C41;
    fInserimentoFacilitato_Array[17] := dbe_F_C42;
    fInserimentoFacilitato_Array[18] := dbe_F_C43;
    fInserimentoFacilitato_Array[19] := dbe_F_C44;
    fInserimentoFacilitato_Array[20] := dbe_F_C45;
    fInserimentoFacilitato_Array[21] := dbe_F_C46;
    fInserimentoFacilitato_Array[22] := dbe_F_C46;
    fInserimentoFacilitato_Array[23] := dbe_F_C50;
    fInserimentoFacilitato_Array[24] := dbe_F_C60;
    fInserimentoFacilitato_Array[25] := dbe_F_C70;
    // Evidenzia il primo
    fInserimentoFacilitato_Array[0].Style.Color := COLOR_FOCUS;
    // Rende visibile il DBEdit sul quale metterà il ocus e intercetterà la pressione dei pulsanti
    //  cursore ma fà in modo non venga visto dall'utente.
    EditInserimentoFacilitato_F.Left    := -1000;
    EditInserimentoFacilitato_F.Visible := True;
    EditInserimentoFacilitato_F.SetFocus;
  // Se invece è stato risollevato interrompe l'inserimento facilitato
  end else begin
    // All'uscita dalla modalità di inserimento semplificato imposta il focus
    //  sull'ultimo controllo.
    fInserimentoFacilitato_Array[fInserimentoFacilitato_Index].SetFocus;
    // Disabilita il dbEdit e sposta il focus al controllo successivo
    EditInserimentoFacilitato_F.Visible := False;
    // Messaggio per l'utente
    DM1.Messaggi('Levante', 'Inserimento facilitato terminato!', '', [mbOk], 0, nil);
  end;
end;

procedure TAllegatiFGForm.EditInserimentoFacilitato_FExit(Sender: TObject);
begin
  inherited;
  // Se esce dal DBEdit disabilita l'inserimento facilitato
  if SBInserimentoFacilitato_F.Down then begin
    SBInserimentoFacilitato_F.Down := False;
    SBInserimentoFacilitato_FClick(SBInserimentoFacilitato_F);
  end;

end;

procedure TAllegatiFGForm.EditInserimentoFacilitato_FKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  NewVal: String;
  CurrRadioGroup: TcxDBRadioGroup;
begin
  inherited;
  try
    // Inizializzazione
    NewVal := '';
    // In base al pulsante premuto dall'utente determina il valore da inserire
    case Key of
      VK_Left:  NewVal := 'T';
      VK_Down:  NewVal := 'F';
      VK_Right: NewVal := 'F';
    end;
    // Se l'utente non ha premuto uno dei pulsanti previsti esce subito senza fare nulla
    if NewVal = '' then begin
      // Esce
      Exit;
    end;
    // ------------------------------------
    // Punta all'editor della voce corrente
    CurrRadioGroup := fInserimentoFacilitato_Array[fInserimentoFacilitato_Index] as TcxDBRadioGroup;
    // Assegna il valore
    CurrRadioGroup.DataBinding.Field.AsString := NewVal;
    // Rimette il controllo corrente al suo colore normale
    CurrRadioGroup.ParentColor := True;
    // ------------------------------------
    // Se siamo arrivati alla fine esce dall'inserimento facilitato
    if fInserimentoFacilitato_Index = (Length(fInserimentoFacilitato_Array) - 1) then begin
      // Esce dalla modalità di inserimento faciltato
      SBInserimentoFacilitato_F.Down := False;
      SBInserimentoFacilitato_FClick(SBInserimentoFacilitato_F);
      // Esce
      Exit;
    end;
    // Passa al prossimo
    inc(fInserimentoFacilitato_Index);
    // Evidenzia il successivo
    (fInserimentoFacilitato_Array[fInserimentoFacilitato_Index] as TcxDBRadioGroup).Style.Color := COLOR_FOCUS;
  finally
    // Annulla la pressione del pulsante
    Key := 0;
  end;
end;


procedure TAllegatiFGForm.StampaAllegatoGVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
var
  i: Integer;
begin
  inherited;
  // Apertura delle query necessarie alla stampa
  ApriQueryPerStampa;
  // Creazione report
  Application.CreateForm(TAllegatoGVanzQR, AllegatoGVanzQR);
  try
    // Preview
    if Preview then begin
      AllegatoGVanzQR.Preview;

    // Stampa
    end else begin
      DM1.Attendere;
      // Se è stata specificata una stampante apposita per la stampa dell'allegato la imposta
      if Trim(PrinterName) <> '' then AllegatoGVanzQR.PrinterSettings.PrinterIndex := Printer.Printers.IndexOf(PrinterName);
      // Stampa per il n° di copie volute
      for i := 1 to Copie do begin
        AllegatoGVanzQR.Print;
      end;
      // Dopo la stampa marca l'allegao come "Stampato"
      if QryAllSTATOAVANZAMENTO.AsInteger < 20 then begin
        QryAll.Edit;
        QryAllSTATOAVANZAMENTO.Value := 20;
        QryAll.Post;
      end;
    end;

  finally
    // Pulizie finali
    DM1.ChiudiAttendere;
    AllegatoGVanzQR.Free;
  end;
end;

procedure TAllegatiFGForm.StampaAllegatoFVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
var
  i: Integer;
begin
  inherited;
  // Apertura delle query necessarie alla stampa
  ApriQueryPerStampa;
  // Creazione report
  Application.CreateForm(TAllegatoFVanzQR, AllegatoFVanzQR);
  try
    // Preview
    if Preview then begin
      AllegatoFVanzQR.Preview;

    // Stampa
    end else begin
      DM1.Attendere;
      // Se è stata specificata una stampante apposita per la stampa dell'allegato la imposta
      if Trim(PrinterName) <> '' then AllegatoFVanzQR.PrinterSettings.PrinterIndex := Printer.Printers.IndexOf(PrinterName);
      // Stampa per il n° di copie volute
      for i := 1 to Copie do begin
        AllegatoFVanzQR.Print;
      end;
      // Dopo la stampa marca l'allegao come "Stampato"
      if QryAllSTATOAVANZAMENTO.AsInteger < 20 then begin
        QryAll.Edit;
        QryAllSTATOAVANZAMENTO.Value := 20;
        QryAll.Post;
      end;
    end;

  finally
    // Pulizie finali
    DM1.ChiudiAttendere;
    AllegatoFVanzQR.Free;
  end;
end;


procedure TAllegatiFGForm.StampaAllegato(NomeFile:String; Preview:Boolean; PrinterName:String; Copie:Integer=0);
var
  i: Integer;
  ListOfPrinters:TStrings;
begin
  inherited;
  // Determina il numero di copie da stampare se non specificato
  if Copie = 0 then
    Copie := QryAllCOPIE.AsInteger;
  // Apertura delle query necessarie alla stampa
  ApriQueryPerStampa;
  // Se è stata specificata una stampante apposita per la stampa dell'allegato la imposta
  if Trim(PrinterName) <> '' then ReportDesignerDialog1.PrinterSettings.PrinterIndex := Printer.Printers.IndexOf(PrinterName);
  // Anteprima
  if Preview then begin
     ReportDesignerDialog1.PreviewReport(DM1.ReportDir + NomeFile);
  // Stampa
  end else begin
     DM1.Attendere;
     try
       for i := 1 to Copie do begin
         ReportDesignerDialog1.PrintReport(DM1.ReportDir + NomeFile);
       end;
       // Dopo la stampa marca l'allegao come "Stampato"
       if QryAllSTATOAVANZAMENTO.AsInteger < 20 then begin
         QryAll.Edit;
         QryAllSTATOAVANZAMENTO.Value := 20;
         QryAll.Post;
       end;
     finally
       DM1.ChiudiAttendere;
     end;
  end;
end;

procedure TAllegatiFGForm.StampaAllegatoFG(Preview:Boolean; Copie:Integer=0);
var
  NomeFileAllegato, DedicatedPrinterName: String;
begin
  inherited;
  // Stampa l'allageto F o G
  try
    // Carica il nome dell'eventuale stampante dedicata alla stampa dell'allegato
    DedicatedPrinterName := QryPratDEFAULTALLEGATIFGPRINTERNAME.AsString;
    // In base al ipo di allegato imposta il nome file corretto
    if      QryAllTIPO.AsString = 'RCEE1B - gruppi termici a biomassa combustibile' then NomeFileAllegato := QryPratDEFAULTALLEGATORCEE1BFILENAME.AsString
    else if QryAllTIPO.AsString = 'RCEE1 - gruppi termici' then NomeFileAllegato := QryPratDEFAULTALLEGATORCEE1FILENAME.AsString
    else if QryAllTIPO.AsString = 'RCEE2 - gruppi frigo/pompe di calore' then NomeFileAllegato := QryPratDEFAULTALLEGATORCEE2FILENAME.AsString
    else if QryAllTIPO.AsString = 'G - impianti termici' then NomeFileAllegato := QryPratDEFAULTALLEGATOGFILENAME.AsString
    else if QryAllTIPO.AsString = 'F - impianti termici' then NomeFileAllegato := QryPratDEFAULTALLEGATOFFILENAME.AsString
    else Exit;
    // Se è stato scelto di stampare l'allegato G Vanzotech
    if NomeFileAllegato = 'Allegato_G a lettura ottica Vanzotech' then begin
      StampaAllegatoGVanzotech(Preview, DedicatedPrinterName, Copie);
    // Se è stato scelto di stampare l'allegato F Vanzotech
    end else if NomeFileAllegato = 'Allegato_F a lettura ottica Vanzotech' then begin
      StampaAllegatoFVanzotech(Preview, DedicatedPrinterName, Copie);
    // Se invece è stato scelto un modulo normale...
    end else begin
      StampaAllegato(NomeFileAllegato, Preview, DedicatedPrinterName, Copie);
    end;
    // Se esiste la form dell'impegno relativo all'allegato ne fa eseguire il refresh per
    //  aggiornare la situazione degli allegati.
    fQueryAllegatiImpegnoDaAggiornare := True;
  finally
    // Pulizie finali
    MenuStampe.Tag := 0;
  end;
end;


procedure TAllegatiFGForm.Stampaallegato1Click(Sender: TObject);
begin
  // Stampa l'allageto F o G
  StampaAllegatoFG((MenuStampe.Tag = 0));
end;


procedure TAllegatiFGForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  dbeStrCertImageCombo.Properties.Images := DM2.StrCertifiedPanelImages; // Altrimenti a volte si scollega
  SoloPerStampare := False;
  fQueryAllegatiImpegnoDaAggiornare := False;
  fAnalisiFumi_Bacharach := True;
end;


procedure TAllegatiFGForm.dbeZonaImmPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(ZONAIMM) FROM PRATICHE');
      if (not QryAllCOMUNEIMM.IsNull) and (Trim(QryAllCOMUNEIMM.AsString) <> '')
        then Qry.SQL.Add('WHERE COMUNEIMM = ' + QuotedStr(QryAllCOMUNEIMM.AsString));
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

procedure TAllegatiFGForm.eCognomeRespImpKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
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

procedure TAllegatiFGForm.dbeComuneImmPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  // Solo se siamo in modalità di modifica
  if not RxSpeedModifica.Down then Exit;
  // RIchiama la selezione dallo stradario
  DM1.ShowWait('Levante', 'Apertura stradario...');
  try
    DM2.Stradario_SelezionaIndirizzo(QryAllCODICEISTATCOMUNEIMM, QryAllCOMUNEIMM, QryAllINDIRIZZOIMM, QryAllPROVINCIAIMM, QryAllCAPIMM);
  finally
    DM1.CloseWait;
  end;
end;

end.
