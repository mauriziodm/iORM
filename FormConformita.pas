unit FormConformita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Menus,
  Buttons, ComCtrls, IBODataset, Db, IniFiles, UnitRepositoryIniFile,
  IB_Components, bmpPanel, MAURI_SB, Variants, cxPC, cxControls,
  cxContainer, cxEdit, cxLabel, cxStyles, cxCustomData, cxGraphics,
  cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxDropDownEdit, ClassPuzzle, ClassPuzzleLayer,
  ClassPuzzleObject, ClassTextPuzzleObject, ExtDlgs, cxMaskEdit,
  cxGroupBox, cxRadioGroup, cxDBEdit, QRCtrls, Quickrpt, FormPuzzleTools,
  cxCurrencyEdit, cxSplitter, FormAllegati, cxMemo, cxFilter, cxData,
  cxDataStorage, cxCalendar, cxCheckBox, cxDBLookupComboBox, cxButtonEdit,
  cxGridCardView, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, cxGridCustomLayoutView, qrddlgs,
  dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations;

const
  IDX_DESCRIZIONE = 0;
  IDX_MARCA = 1;
  IDX_UM = 2;
  IDX_QTA = 3;
  IDX_POTENZA = 4;
  IDX_CERTIFICAZIONE = 5;
  IDX_INSTALLATO = 6;
  IDX_INSTALLABILE = 7;
  IDX_VENTILAZIONE = 8;
  IDX_SC_COMB = 9;
  IDX_COLL_ELET = 10;
  IDX_SERNUM = 11;
  IDX_GAS_TIPO = 12;
  IDX_NOTE = 13;
  IDX_CODICE = 14;

type
  TConformitaForm = class(TForm)
    MenuStampe: TPopupMenu;
    Dichiarazionediconformit1: TMenuItem;
    Relazionetipologicadelmaterialeutilizzato1: TMenuItem;
    Autodichiarazionedipossessodeirequisititecnicoprofessionali1: TMenuItem;
    PanelCucina: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    Fuochi: TComboBox;
    ConForno: TRadioButton;
    SenzaForno: TRadioButton;
    BitBtn1: TBitBtn;
    PanelTubo: TPanel;
    Label67: TLabel;
    BitBtn2: TBitBtn;
    UMDiametro: TComboBox;
    Diametro: TEdit;
    Label68: TLabel;
    Spessore: TEdit;
    Label69: TLabel;
    DichiarazioniperlEntedistributoredelgas1: TMenuItem;
    Richiestadiprimaaccensionecaldaia1: TMenuItem;
    ClientTopPanel: TbmpPanel;
    PanelPratiche: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    BitBtnPratica1: TBitBtn;
    BitBtnPratica2: TBitBtn;
    BitBtnPratica3: TBitBtn;
    PanelOggetto: TPanel;
    Label4: TLabel;
    Label47: TLabel;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    PanelDestinatario: TPanel;
    Label78: TLabel;
    Bevel3: TBevel;
    QryApp: TIBOQuery;
    QryMat: TIBOQuery;
    SourceApp: TDataSource;
    SourceMat: TDataSource;
    QryAppS3RIF: TStringField;
    QryAppS3UBICAZIONE: TStringField;
    QryAppS3COMPONENTE: TStringField;
    QryAppS3VENTILAZIONE: TStringField;
    QryAppS3SCARICO: TStringField;
    QryAppS3TIPO: TStringField;
    QryAppS3PORTATATERMICA: TIBOFloatField;
    QryAppS3TIPOCOLLEGAMENTO: TStringField;
    QryAppS3INSTALLATOINSTALLABILE: TStringField;
    QryAppS3MODELLO: TStringField;
    QryMatS3RIF: TStringField;
    QryMatS3UBICAZIONE: TStringField;
    QryMatS3COMPONENTE: TStringField;
    QryMatS3MATERIALE: TStringField;
    QryMatS3QTA: TIBOFloatField;
    QryMatS3DIAMETRO: TStringField;
    QryMatS3LUNGHEZZA: TIBOFloatField;
    QryMatS3INSTALLAZIONE: TStringField;
    QryMatS3CERTIFICAZIONE: TStringField;
    QryAppCODICECONF: TIntegerField;
    QryAppDATACONF: TDateTimeField;
    QryAppPROGRIGOCONF: TIntegerField;
    QryMatCODICECONF: TIntegerField;
    QryMatDATACONF: TDateTimeField;
    QryMatPROGRIGOCONF: TIntegerField;
    QryAppTIPODOCUMENTO: TStringField;
    QryAppREGISTRO: TStringField;
    QryAppNUMORDPREV: TIntegerField;
    QryAppDATADOCUMENTO: TDateTimeField;
    QryAppPROGRIGO: TIntegerField;
    QryAppPROGRIGO2: TIntegerField;
    QryMatTIPODOCUMENTO: TStringField;
    QryMatREGISTRO: TStringField;
    QryMatNUMORDPREV: TIntegerField;
    QryMatDATADOCUMENTO: TDateTimeField;
    QryMatPROGRIGO: TIntegerField;
    QryMatPROGRIGO2: TIntegerField;
    QryAppS3MATERIALEAPPARECCHIO: TStringField;
    QryMatS3MATERIALEAPPARECCHIO: TStringField;
    Label79: TLabel;
    Timer1: TTimer;
    Label80: TLabel;
    LabelX: TLabel;
    LabelY: TLabel;
    LabelPrevX: TLabel;
    LabelPrevY: TLabel;
    LabelStatus: TLabel;
    LabelTubePrevX: TLabel;
    LabelTubePrevY: TLabel;
    LabelNextObjectType: TLabel;
    QryAltri: TIBOQuery;
    SourceAltri: TDataSource;
    QryAltriTIPODOCUMENTO: TStringField;
    QryAltriREGISTRO: TStringField;
    QryAltriNUMORDPREV: TIntegerField;
    QryAltriDATADOCUMENTO: TDateTimeField;
    QryAltriPROGRIGO: TIntegerField;
    QryAltriPROGRIGO2: TIntegerField;
    QryAltriCODICECONF: TIntegerField;
    QryAltriDATACONF: TDateTimeField;
    QryAltriPROGRIGOCONF: TIntegerField;
    QryAppRIFLETTER: TStringField;
    QryAppBITMAPFILENAME: TStringField;
    QryAppBITMAPFILENAME2: TStringField;
    QryMatRIFLETTER: TStringField;
    QryMatBITMAPFILENAME: TStringField;
    QryMatBITMAPFILENAME2: TStringField;
    QryAltriS3COMPONENTE: TStringField;
    QryAltriRIFLETTER: TStringField;
    QryAltriBITMAPFILENAME: TStringField;
    QryAltriBITMAPFILENAME2: TStringField;
    QryAppS3X: TSmallintField;
    QryAppS3Y: TSmallintField;
    QryAppS3ROTATION: TSmallintField;
    QryMatS3X: TSmallintField;
    QryMatS3Y: TSmallintField;
    QryMatS3ROTATION: TSmallintField;
    QryAltriS3X: TSmallintField;
    QryAltriS3Y: TSmallintField;
    QryAltriS3ROTATION: TSmallintField;
    QryAltriS3RIF: TStringField;
    QryAltriS3MATERIALEAPPARECCHIO: TStringField;
    QryAltriS3ENTRYPOINT: TSmallintField;
    QryAltriS3EXITPOINT: TSmallintField;
    QryAppS3ENTRYPOINT: TSmallintField;
    QryAppS3EXITPOINT: TSmallintField;
    QryMatS3ENTRYPOINT: TSmallintField;
    QryMatS3EXITPOINT: TSmallintField;
    MenuPuzzle: TPopupMenu;
    Caricasfondo1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    QryMatSINCHRO: TStringField;
    QryAppSINCHRO: TStringField;
    QryAltriSINCHRO: TStringField;
    ProvaStampaSchema1: TMenuItem;
    ProvastampaPag31: TMenuItem;
    ProvastampaPag11: TMenuItem;
    Grigliavisibileinvisibile1: TMenuItem;
    StampaallegatoA1: TMenuItem;
    Label26: TLabel;
    StampaAllegatoB1: TMenuItem;
    QrySocGas: TIBOQuery;
    QrySocGasCODICE: TIntegerField;
    QrySocGasRAGIONESOCIALE: TStringField;
    QrySocGasINDIRIZZO: TStringField;
    QrySocGasLOCALITA: TStringField;
    QrySocGasCAP: TStringField;
    QrySocGasPROVINCIA: TStringField;
    QrySocGasTELEFONO: TStringField;
    QrySocGasFAX: TStringField;
    QrySocGasSINCHRO: TStringField;
    SourceSocGas: TDataSource;
    QrySocGasIMGINTESTAZIONE: TBlobField;
    QrySocGasSTAMPAINTESTAZIONE: TStringField;
    QrySocGasFILEREPORTCUSTOM: TStringField;
    QrySocGasSTAMPAREPORTCUSTOM: TStringField;
    StampaallegatoC1: TMenuItem;
    StampaallegatoE1: TMenuItem;
    StampaallegatoE2: TMenuItem;
    QryTermoAltri: TIBOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    DateTimeField2: TDateTimeField;
    IntegerField5: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    StringField7: TStringField;
    StringField8: TStringField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    StringField9: TStringField;
    SourceTermoAltri: TDataSource;
    QryTermoApp: TIBOQuery;
    StringField10: TStringField;
    StringField11: TStringField;
    IntegerField6: TIntegerField;
    DateTimeField3: TDateTimeField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    DateTimeField4: TDateTimeField;
    IntegerField10: TIntegerField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    IBOFloatField1: TIBOFloatField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    SmallintField8: TSmallintField;
    SmallintField9: TSmallintField;
    SmallintField10: TSmallintField;
    StringField25: TStringField;
    QryTermoMat: TIBOQuery;
    StringField26: TStringField;
    StringField27: TStringField;
    IntegerField11: TIntegerField;
    DateTimeField5: TDateTimeField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    DateTimeField6: TDateTimeField;
    IntegerField15: TIntegerField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    IBOFloatField2: TIBOFloatField;
    StringField32: TStringField;
    IBOFloatField3: TIBOFloatField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    SmallintField11: TSmallintField;
    SmallintField12: TSmallintField;
    SmallintField13: TSmallintField;
    SmallintField14: TSmallintField;
    SmallintField15: TSmallintField;
    StringField39: TStringField;
    SourceTermoMat: TDataSource;
    SourceTermoApp: TDataSource;
    QryIdroAltri: TIBOQuery;
    StringField40: TStringField;
    StringField41: TStringField;
    IntegerField16: TIntegerField;
    DateTimeField7: TDateTimeField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    DateTimeField8: TDateTimeField;
    IntegerField20: TIntegerField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    SmallintField16: TSmallintField;
    SmallintField17: TSmallintField;
    SmallintField18: TSmallintField;
    StringField46: TStringField;
    StringField47: TStringField;
    SmallintField19: TSmallintField;
    SmallintField20: TSmallintField;
    StringField48: TStringField;
    SourceIdroAltri: TDataSource;
    QryIdroApp: TIBOQuery;
    StringField49: TStringField;
    StringField50: TStringField;
    IntegerField21: TIntegerField;
    DateTimeField9: TDateTimeField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    DateTimeField10: TDateTimeField;
    IntegerField25: TIntegerField;
    StringField51: TStringField;
    StringField52: TStringField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    IBOFloatField4: TIBOFloatField;
    StringField57: TStringField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    StringField61: TStringField;
    StringField62: TStringField;
    StringField63: TStringField;
    SmallintField21: TSmallintField;
    SmallintField22: TSmallintField;
    SmallintField23: TSmallintField;
    SmallintField24: TSmallintField;
    SmallintField25: TSmallintField;
    StringField64: TStringField;
    SourceIdroApp: TDataSource;
    QryIdroMat: TIBOQuery;
    StringField65: TStringField;
    StringField66: TStringField;
    IntegerField26: TIntegerField;
    DateTimeField11: TDateTimeField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    IntegerField29: TIntegerField;
    DateTimeField12: TDateTimeField;
    IntegerField30: TIntegerField;
    StringField67: TStringField;
    StringField68: TStringField;
    StringField69: TStringField;
    StringField70: TStringField;
    IBOFloatField5: TIBOFloatField;
    StringField71: TStringField;
    IBOFloatField6: TIBOFloatField;
    StringField72: TStringField;
    StringField73: TStringField;
    StringField74: TStringField;
    StringField75: TStringField;
    StringField76: TStringField;
    StringField77: TStringField;
    SmallintField26: TSmallintField;
    SmallintField27: TSmallintField;
    SmallintField28: TSmallintField;
    SmallintField29: TSmallintField;
    SmallintField30: TSmallintField;
    StringField78: TStringField;
    SourceIdroMat: TDataSource;
    QryTermoAppS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryTermoAppS3NUMELEMENTI: TIntegerField;
    QryTermoAppS3NUMCOLONNE: TIntegerField;
    QryTermoAppS3INTERASSE: TIBOFloatField;
    QryTermoAppS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryAltriTIPO: TSmallintField;
    QryAltriS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryAltriS3NUMELEMENTI: TIntegerField;
    QryAltriS3NUMCOLONNE: TIntegerField;
    QryAltriS3INTERASSE: TIBOFloatField;
    QryAltriS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryTermoAltriTIPO: TSmallintField;
    QryTermoAltriS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryTermoAltriS3NUMELEMENTI: TIntegerField;
    QryTermoAltriS3NUMCOLONNE: TIntegerField;
    QryTermoAltriS3INTERASSE: TIBOFloatField;
    QryTermoAltriS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryIdroAltriTIPO: TSmallintField;
    QryIdroAltriS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryIdroAltriS3NUMELEMENTI: TIntegerField;
    QryIdroAltriS3NUMCOLONNE: TIntegerField;
    QryIdroAltriS3INTERASSE: TIBOFloatField;
    QryIdroAltriS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryAppTIPO: TSmallintField;
    QryAppS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryAppS3NUMELEMENTI: TIntegerField;
    QryAppS3NUMCOLONNE: TIntegerField;
    QryAppS3INTERASSE: TIBOFloatField;
    QryAppS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryTermoAppTIPO: TSmallintField;
    QryIdroAppTIPO: TSmallintField;
    QryIdroAppS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryIdroAppS3NUMELEMENTI: TIntegerField;
    QryIdroAppS3NUMCOLONNE: TIntegerField;
    QryIdroAppS3INTERASSE: TIBOFloatField;
    QryIdroAppS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryMatTIPO: TSmallintField;
    QryMatS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryMatS3NUMELEMENTI: TIntegerField;
    QryMatS3NUMCOLONNE: TIntegerField;
    QryMatS3INTERASSE: TIBOFloatField;
    QryMatS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryTermoMatTIPO: TSmallintField;
    QryTermoMatS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryTermoMatS3NUMELEMENTI: TIntegerField;
    QryTermoMatS3NUMCOLONNE: TIntegerField;
    QryTermoMatS3INTERASSE: TIBOFloatField;
    QryTermoMatS3SUPERFICIESCAMBIO: TIBOFloatField;
    QryIdroMatTIPO: TSmallintField;
    QryIdroMatS3NUMLIVELLITEMPERATURA: TIntegerField;
    QryIdroMatS3NUMELEMENTI: TIntegerField;
    QryIdroMatS3NUMCOLONNE: TIntegerField;
    QryIdroMatS3INTERASSE: TIBOFloatField;
    QryIdroMatS3SUPERFICIESCAMBIO: TIBOFloatField;
    LabelAbsoluteMousePositionX: TLabel;
    LabelAbsoluteMousePositionY: TLabel;
    LabelHorzScrollBarPosition: TLabel;
    LabelVertScrollBarPosition: TLabel;
    LabelPuzzleTag: TLabel;
    LabelPuzzleRightMargin: TLabel;
    LabelPuzzleRightMarginScreen: TLabel;
    CopiamuriscrittedallasezioneGAS1: TMenuItem;
    CopiamuriscrittedallasezioneTERMO1: TMenuItem;
    N1: TMenuItem;
    CopiamuriscrittedallasezioneIDRO1: TMenuItem;
    CopiaimmaginedisfondodallasezioneGAS1: TMenuItem;
    CopiaimmaginedisfondodallasezioneTERMO1: TMenuItem;
    CopiaimmaginedisfondodallasezioneIDRO1: TMenuItem;
    QryLoad: TIBOQuery;
    Eliminaimmaginedisfondo1: TMenuItem;
    QryAltriDESCRIZIONE: TMemoField;
    QryTermoAltriDESCRIZIONE: TMemoField;
    QryIdroAltriDESCRIZIONE: TMemoField;
    FormMainPanel: TPanel;
    ClientArea: TPanel;
    Label134: TLabel;
    cxPageControl1: TcxPageControl;
    TabModello: TcxTabSheet;
    Label135: TLabel;
    Label138: TLabel;
    DBECodiceModello: TDBEdit;
    DBEDescrizioneModello: TDBEdit;
    TabNewDichiarazione: TcxTabSheet;
    ScrollBoxDichiarazione: TScrollBox;
    PanelDocumento: TPanel;
    Label161: TLabel;
    Label2: TLabel;
    Label175: TLabel;
    Label179: TLabel;
    DBEdit13: TDBEdit;
    PanelCodData: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    Label1: TLabel;
    LabelStatoDocumento: TLabel;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    DBECodice: TDBEdit;
    DBERagSocCli: TDBEdit;
    DBEditStatoDocumento: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit16: TDBEdit;
    PanelCommittente: TPanel;
    Label141: TLabel;
    SBCommittente: TSpeedButtonRollOver;
    SBEspandiCommittente: TSpeedButtonRollOver;
    DBText3: TDBText;
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
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    PanelProprietario: TPanel;
    Label151: TLabel;
    SBProprietario: TSpeedButtonRollOver;
    SBEspandiProprietario: TSpeedButtonRollOver;
    DBText2: TDBText;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    Label167: TLabel;
    PropDenominazione: TDBEdit;
    PropIndirizzo: TDBEdit;
    PropNumCivico: TDBEdit;
    PropScala: TDBEdit;
    PropPiano: TDBEdit;
    PropInterno: TDBEdit;
    PropCAP: TDBEdit;
    PropLocalita: TDBEdit;
    PropProvincia: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    PanelImmobile: TPanel;
    Label9: TLabel;
    Label34: TLabel;
    Label113: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    SBImmobile: TSpeedButtonRollOver;
    SBEspandiImmobile: TSpeedButtonRollOver;
    DBText4: TDBText;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBEFoglio: TDBEdit;
    DBEParticella: TDBEdit;
    DBESub: TDBEdit;
    ImpLocalita: TDBEdit;
    ImpProvincia: TDBEdit;
    ImpCAP: TDBEdit;
    ImpIndirizzo: TDBEdit;
    ImpNumCivico: TDBEdit;
    impScala: TDBEdit;
    ImpPiano: TDBEdit;
    ImpInterno: TDBEdit;
    PanelDichiaraDiAver: TPanel;
    Label23: TLabel;
    Label38: TLabel;
    dbeRispettatoProgetto: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    dbeProgettoRedattoDa: TDBEdit;
    DBEdit18: TDBEdit;
    PanelAllegati: TPanel;
    Label24: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox40: TDBCheckBox;
    PanelSocGasCantiere: TPanel;
    Label169: TLabel;
    Label170: TLabel;
    SBSocGasCantiere: TSpeedButtonRollOver;
    DBText8: TDBText;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label176: TLabel;
    DBESocGasRagSoc: TDBEdit;
    DBESocGasIndirizzo: TDBEdit;
    DBESocGasCAP: TDBEdit;
    DBESocGasLocalita: TDBEdit;
    DBESocGasProvincia: TDBEdit;
    DBECodicePuntoRiconsegna: TDBEdit;
    PanelImpianto: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Shape2: TShape;
    Label168: TLabel;
    Label7: TLabel;
    Label181: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBEdit5: TDBEdit;
    DBCheckBox32: TDBCheckBox;
    Panel1: TPanel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    TabListaMateriale: TcxTabSheet;
    PanelDichiara: TPanel;
    Label3: TLabel;
    Label46: TLabel;
    Label180: TLabel;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBEdit39: TDBEdit;
    DBMemo3: TDBMemo;
    TabAllegati4690: TcxTabSheet;
    cxPageControl2: TcxPageControl;
    Tab4690Sez1: TcxTabSheet;
    Shape3: TShape;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape4: TShape;
    Label14: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    Shape5: TShape;
    Label28: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label137: TLabel;
    DBEdit15: TDBEdit;
    DBCBS1QAProgImpgas: TDBCheckBox;
    DBCBS1QAProgCamino: TDBCheckBox;
    DBCBS1QAProgPrevInc: TDBCheckBox;
    DBCBS1QBDichGasPrec: TDBCheckBox;
    DBCBS1QBDichCaminoPrec: TDBCheckBox;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBCBS1QCProgImpIntGas: TDBCheckBox;
    DBCBS1QCCPI: TDBCheckBox;
    DBEdit48: TDBEdit;
    DBEdit54: TDBEdit;
    DBCBS1QCRelTec: TDBCheckBox;
    DBCBS1QCAll2: TDBCheckBox;
    DBEdit50: TDBEdit;
    DBEdit53: TDBEdit;
    DBCBS1QADicConfModB: TDBCheckBox;
    DBCBS1QADicConfModD: TDBCheckBox;
    DBEdit2: TDBEdit;
    DbeCommittAllegObblig: TcxDBComboBox;
    Tab4690Sez2QuadroA: TcxTabSheet;
    Shape10: TShape;
    Shape6: TShape;
    Label44: TLabel;
    Label45: TLabel;
    Shape7: TShape;
    Label117: TLabel;
    Label118: TLabel;
    Shape8: TShape;
    Label119: TLabel;
    Shape9: TShape;
    Label114: TLabel;
    Label115: TLabel;
    DBCBS2QANuovoImpGas: TDBCheckBox;
    DBCBS2QAInstAppgas: TDBCheckBox;
    DBEdit60: TDBEdit;
    cxLabel1: TcxLabel;
    DBCBS2QAInstTrattoTub: TDBCheckBox;
    DBCBS2QAInstPzSpec: TDBCheckBox;
    DBCBS2QACollegAppCannaFum: TDBCheckBox;
    DBCBS2QAmodImpEsist: TDBCheckBox;
    DBCBS2QARealApVent: TDBCheckBox;
    DBCBS2QARealApAeraz: TDBCheckBox;
    DBCBS2QACaminoSingolo: TDBCheckBox;
    DBCBS2QACannaCollettiva: TDBCheckBox;
    DBCBS2QACannaCollRamif: TDBCheckBox;
    DBCBS2QAAltro: TDBCheckBox;
    cxLabel2: TcxLabel;
    DBCBS2QBAppCollKW: TDBCheckBox;
    DBCBS2QBSoloPred: TDBCheckBox;
    DBCBS2QBCollegamentoDi: TDBCheckBox;
    DBCBS2QBSostDi: TDBCheckBox;
    DBCBS2QBAdegNorma: TDBCheckBox;
    DBCBS2QBAltro: TDBCheckBox;
    DBCBS2QCEsecConfProg: TDBCheckBox;
    DBCBS2QCEsecCuraInst: TDBCheckBox;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    TabSez2QuadroB: TcxTabSheet;
    Puzzle1: TPuzzle;
    Tab4690Sez3: TcxTabSheet;
    Shape11: TShape;
    Label116: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Label122: TLabel;
    Label123: TLabel;
    Label139: TLabel;
    DBCBDichiaroMarcaturaCE: TDBCheckBox;
    GridApp: TcxGrid;
    tvApp: TcxGridDBTableView;
    tvAppRIF: TcxGridDBColumn;
    tvAppUBICAZIONE: TcxGridDBColumn;
    tvAppAPPARECCHIATURA: TcxGridDBColumn;
    tvAppTIPO: TcxGridDBColumn;
    tvAppMODELLOMARCA: TcxGridDBColumn;
    tvAppPORTATATERMICA: TcxGridDBColumn;
    tvAppTIPOCOLLEGAMENTO: TcxGridDBColumn;
    tvAppINSTALLATOINSTALLABILE: TcxGridDBColumn;
    tvAppVENTILAZIONE: TcxGridDBColumn;
    tvAppSCARICO: TcxGridDBColumn;
    lvApp: TcxGridLevel;
    DBCBAperturaVentilazione: TDBCheckBox;
    DBCBAperturaAerazione: TDBCheckBox;
    DBCBPianoCotturaControlloFiamma: TDBCheckBox;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit45: TDBEdit;
    Tab4690Sez3QuadroB: TcxTabSheet;
    Shape15: TShape;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label136: TLabel;
    DBCBUNI: TDBCheckBox;
    DBCBDM: TDBCheckBox;
    DBCBAltro: TDBCheckBox;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    GridMateriali: TcxGrid;
    tvMateriali: TcxGridDBTableView;
    tvMaterialiS3RIF: TcxGridDBColumn;
    tvMaterialiS3UBICAZIONE: TcxGridDBColumn;
    tvMaterialiS3COMPONENTE: TcxGridDBColumn;
    tvMaterialiS3MATERIALE: TcxGridDBColumn;
    tvMaterialiS3QTA: TcxGridDBColumn;
    tvMaterialiS3DIAMETRO: TcxGridDBColumn;
    tvMaterialiS3LUNGHEZZA: TcxGridDBColumn;
    tvMaterialiS3INSTALLAZIONE: TcxGridDBColumn;
    tvMaterialiS3CERTIFICAZIONE: TcxGridDBColumn;
    lvMateriali: TcxGridLevel;
    DBEdit67: TDBEdit;
    Tab4690Sez4: TcxTabSheet;
    Shape16: TShape;
    Label128: TLabel;
    Label130: TLabel;
    Label129: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label140: TLabel;
    DBCBTenutaTubazioni: TDBCheckBox;
    DBEdit68: TDBEdit;
    DBCBTenutaCamino: TDBCheckBox;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    TabTermo: TcxTabSheet;
    PageControlTermo: TcxPageControl;
    TabTermoDisegno: TcxTabSheet;
    PuzzleTermo: TPuzzle;
    TabTermoElencoApp: TcxTabSheet;
    Shape24: TShape;
    Label201: TLabel;
    GridTermoApp: TcxGrid;
    tvTermoApp: TcxGridDBTableView;
    tvTermoAppRIF: TcxGridDBColumn;
    tvTermoAppUBICAZIONE: TcxGridDBColumn;
    tvTermoAppCOMPONENTE: TcxGridDBColumn;
    tvTermoAppTIPO: TcxGridDBColumn;
    tvTermoAppMODELLO: TcxGridDBColumn;
    tvTermoAppPORTATATERMICA: TcxGridDBColumn;
    tvTermoAppTIPOCOLLEGAMENTO: TcxGridDBColumn;
    tvTermoAppINSTALLATOINSTALLABILE: TcxGridDBColumn;
    tvTermoAppNUMELEMENTI: TcxGridDBColumn;
    tvTermoAppNUMCOLONNE: TcxGridDBColumn;
    tvTermoAppINTERASSE: TcxGridDBColumn;
    tvTermoAppSUPERFICIESCAMBIO: TcxGridDBColumn;
    tvTermoAppNUMLIVELLITEMPERATURA: TcxGridDBColumn;
    tvTermoAppVENTILAZIONE: TcxGridDBColumn;
    tvTermoAppSCARICO: TcxGridDBColumn;
    lvTermoApp: TcxGridLevel;
    DBCheckBox38: TDBCheckBox;
    TabTermoElencoMat: TcxTabSheet;
    Shape28: TShape;
    Label211: TLabel;
    Label182: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    GridTermoMat: TcxGrid;
    tvTermoMat: TcxGridDBTableView;
    tvTermoMatRIF: TcxGridDBColumn;
    tvTermoMatUBICAZIONE: TcxGridDBColumn;
    tvTermoMatCOMPONENTE: TcxGridDBColumn;
    tvTermoMatMATERIALE: TcxGridDBColumn;
    tvTermoMatQTA: TcxGridDBColumn;
    tvTermoMatDIAMETRO: TcxGridDBColumn;
    tvTermoMatLUNGHEZZA: TcxGridDBColumn;
    tvTermoMatINSTALLAZIONE: TcxGridDBColumn;
    tvTermoMatCERTIFICAZIONE: TcxGridDBColumn;
    lvTermoMat: TcxGridLevel;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    TabTermoAltro: TcxTabSheet;
    Shape18: TShape;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    TabIdro: TcxTabSheet;
    PageControlIdro: TcxPageControl;
    TabIdroDisegno: TcxTabSheet;
    PuzzleIdro: TPuzzle;
    TabIdroElencoApp: TcxTabSheet;
    Shape1: TShape;
    Label177: TLabel;
    GridIdroApp: TcxGrid;
    tvIdroApp: TcxGridDBTableView;
    tvIdroAppRIF: TcxGridDBColumn;
    tvIdroAppUBICAZIONE: TcxGridDBColumn;
    tvIdroAppCOMPONENTE: TcxGridDBColumn;
    tvIdroAppTIPO: TcxGridDBColumn;
    tvIdroAppMODELLO: TcxGridDBColumn;
    tvIdroAppPORTATATERMICA: TcxGridDBColumn;
    tvIdroAppTIPOCOLLEGAMENTO: TcxGridDBColumn;
    tvIdroAppINSTALLATOINSTALLABILE: TcxGridDBColumn;
    tvIdroAppVENTILAZIONE: TcxGridDBColumn;
    tvIdroAppSCARICO: TcxGridDBColumn;
    lvIdroApp: TcxGridLevel;
    DBCheckBox39: TDBCheckBox;
    TabIdroElencoMat: TcxTabSheet;
    Shape17: TShape;
    Label178: TLabel;
    Label183: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    GridIdroMat: TcxGrid;
    tvIdroMat: TcxGridDBTableView;
    tvIdroMatRIF: TcxGridDBColumn;
    tvIdroMatUBICAZIONE: TcxGridDBColumn;
    tvIdroMatCOMPONENTE: TcxGridDBColumn;
    tvIdroMatMATERIALE: TcxGridDBColumn;
    tvIdroMatQTA: TcxGridDBColumn;
    tvIdroMatDIAMETRO: TcxGridDBColumn;
    tvIdroMatLUNGHEZZA: TcxGridDBColumn;
    tvIdroMatINSTALLAZIONE: TcxGridDBColumn;
    tvIdroMatCERTIFICAZIONE: TcxGridDBColumn;
    lvIdroMat: TcxGridLevel;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    TabIdroAltro: TcxTabSheet;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Shape19: TShape;
    Label199: TLabel;
    Label200: TLabel;
    Label202: TLabel;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    TabRichPrimaAccensione: TcxTabSheet;
    ScrollBoxRichiestaPrimaAccensione: TScrollBox;
    Label86: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label111: TLabel;
    DBText32: TDBText;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    DBText33: TDBText;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    SpeedButtonRollOver1: TSpeedButtonRollOver;
    BitBtnPrimAccSogg: TSpeedButtonRollOver;
    Label109: TLabel;
    Label110: TLabel;
    Label112: TLabel;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    Panel2: TPanel;
    PrimAccRagSoc: TLabel;
    PrimAccIndirizzo: TLabel;
    PrimAccCAP: TLabel;
    PrimAccCitta: TLabel;
    PrimAccProvincia: TLabel;
    DBEdit49: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBMemo2: TDBMemo;
    PanelNoteAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    PageControl1: TPageControl;
    TabDichiarazione: TTabSheet;
    TabElencoMateriale: TTabSheet;
    TabAutodichiarazione: TTabSheet;
    ScrollBoxAutodichiarazione: TScrollBox;
    Label52: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    DBText1: TDBText;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText24: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    DBText30: TDBText;
    DBText31: TDBText;
    Label90: TLabel;
    Label54: TLabel;
    Label41: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label97: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label105: TLabel;
    CheckBoxA: TCheckBox;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    CheckBoxB: TCheckBox;
    CheckBoxC: TCheckBox;
    CheckBoxD: TCheckBox;
    CheckBoxE: TCheckBox;
    CheckBoxF: TCheckBox;
    CheckBoxG: TCheckBox;
    TabRichiestaPrimaAccensione: TTabSheet;
    Shape20: TShape;
    Label48: TLabel;
    Label203: TLabel;
    Shape21: TShape;
    cxDBMemo1: TcxDBMemo;
    DBEDataDoc: TcxDBDateEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    GridRT: TcxGrid;
    tvRT: TcxGridTableView;
    tvDiBa: TcxGridTableView;
    tvDiBaMOVMAG: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO2: TcxGridColumn;
    tvDiBaCODICEARTICOLO: TcxGridColumn;
    tvDiBaCODICEARTICOLOSTM: TcxGridColumn;
    tvDiBaDESCRIZIONE: TcxGridColumn;
    tvDiBaPREZZOUNITARIO: TcxGridColumn;
    tvDiBaPREZZOUNITARIOIVACOMPRESA: TcxGridColumn;
    tvDiBaPRZUNITNETTO: TcxGridColumn;
    tvDiBaUNITADIMISURA: TcxGridColumn;
    tvDiBaQTA: TcxGridColumn;
    tvDiBaQTAINEVASIONE: TcxGridColumn;
    tvDiBaQTAEVASA: TcxGridColumn;
    tvDiBaQTADAEVADERE: TcxGridColumn;
    tvDiBaSCONTORIGO: TcxGridColumn;
    tvDiBaSCONTORIGO2: TcxGridColumn;
    tvDiBaSCONTORIGO3: TcxGridColumn;
    tvDiBaIMPORTORIGO: TcxGridColumn;
    tvDiBaIMPORTORIGOIVACOMPRESA: TcxGridColumn;
    tvDiBaCODICEIVA: TcxGridColumn;
    tvDiBaDESCRIZIONEIVA: TcxGridColumn;
    tvDiBaALIQUOTAIVA: TcxGridColumn;
    tvDiBaNOTERIGO: TcxGridColumn;
    tvDiBaPREZZOACQUISTOARTICOLO: TcxGridColumn;
    tvDiBaMARGINE: TcxGridColumn;
    tvDiBaIMPORTOMARGINE: TcxGridColumn;
    tvDiBaPRZUNITOPERA: TcxGridColumn;
    tvDiBaQTAOPERA: TcxGridColumn;
    tvDiBaIMPORTOOPERA: TcxGridColumn;
    tvDiBaIMPORTOCOMPONENTI: TcxGridColumn;
    tvDiBaSELEZIONATO: TcxGridColumn;
    tvDiBaMINUTIPREVISTI: TcxGridColumn;
    tvDiBaSOTTOCANTIERE1: TcxGridColumn;
    tvDiBaSOTTOCANTIERE2: TcxGridColumn;
    tvDiBaSOTTOCANTIERE3: TcxGridColumn;
    tvDiBaSOTTOCANTIERE4: TcxGridColumn;
    tvDiBaSOTTOCANTIERE5: TcxGridColumn;
    tvDiBaSOTTOCANTIERE6: TcxGridColumn;
    tvDiBaS3RIF: TcxGridColumn;
    tvDiBaS3UBICAZIONE: TcxGridColumn;
    tvDiBaS3COMPONENTE: TcxGridColumn;
    tvDiBaS3MATERIALE: TcxGridColumn;
    tvDiBaS3QTA: TcxGridColumn;
    tvDiBaS3DIAMETRO: TcxGridColumn;
    tvDiBaS3LUNGHEZZA: TcxGridColumn;
    tvDiBaS3INSTALLAZIONE: TcxGridColumn;
    tvDiBaS3CERTIFICAZIONE: TcxGridColumn;
    tvDiBaS3VENTILAZIONE: TcxGridColumn;
    tvDiBaS3SCARICO: TcxGridColumn;
    tvDiBaS3TIPO: TcxGridColumn;
    tvDiBaS3MODELLO: TcxGridColumn;
    tvDiBaS3PORTATATERMICA: TcxGridColumn;
    tvDiBaS3TIPOCOLLEGAMENTO: TcxGridColumn;
    tvDiBaS3INSTALLATOINSTALLABILE: TcxGridColumn;
    tvDiBaS3MATERIALEAPPARECCHIO: TcxGridColumn;
    tvDiBaTIPO1: TcxGridColumn;
    tvDiBaTIPO2: TcxGridColumn;
    tvDiBaTIPO3: TcxGridColumn;
    tvDiBaTIPO4: TcxGridColumn;
    tvDiBaTIPO5: TcxGridColumn;
    tvDiBaTIPO6: TcxGridColumn;
    tvDiBaTODELETE: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvDiBaGC_RICARICO_MOD: TcxGridColumn;
    tvDiBaGC_RICARICO: TcxGridColumn;
    tvDiBaGC_QTA_MOD: TcxGridColumn;
    tvDiBaGC_QTA: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE: TcxGridColumn;
    tvDiBaGUID: TcxGridColumn;
    tvDiBaGUID_REF: TcxGridColumn;
    tvDiBaGUID_ANCESTOR: TcxGridColumn;
    tvDiBaORDER: TcxGridColumn;
    tvDiBaIDAPPARECCHIO: TcxGridColumn;
    tvDiBaIDOPIMPEGNO: TcxGridColumn;
    cvTot: TcxGridCardView;
    cvTotCOMPONENTI: TcxGridCardViewRow;
    cvTotMARGINE: TcxGridCardViewRow;
    cvTotIMPORTOMARGINE: TcxGridCardViewRow;
    cvTotTOTALECOMPONENTI: TcxGridCardViewRow;
    cvTotPRZUNITOPERA: TcxGridCardViewRow;
    cvTotQTAOPERA: TcxGridCardViewRow;
    cvTotIMPORTOOPERA: TcxGridCardViewRow;
    cvTotTOTALE: TcxGridCardViewRow;
    tvOre: TcxGridTableView;
    tvOreCODDIPENDENTE: TcxGridColumn;
    tvOreDESCRIZDIPENDENTE: TcxGridColumn;
    tvOreQTA: TcxGridColumn;
    tvOreNOTE: TcxGridColumn;
    tvOreSOTTOCANTIERE1: TcxGridColumn;
    tvOreSOTTOCANTIERE2: TcxGridColumn;
    tvOreSOTTOCANTIERE3: TcxGridColumn;
    tvOreTIPOORE1: TcxGridColumn;
    tvOreTIPOORE2: TcxGridColumn;
    tvOreTIPOORE3: TcxGridColumn;
    tvOrePRZUNITVEND: TcxGridColumn;
    tvOreIMPORTOVEND: TcxGridColumn;
    tvOreCOSTOORARIO: TcxGridColumn;
    tvOreIMPORTOCOSTOORARIO: TcxGridColumn;
    tvOreOPERAINDEX: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvOreGC_RICARICO_MOD: TcxGridColumn;
    tvOreGC_RICARICO: TcxGridColumn;
    tvOreGC_QTA_MOD: TcxGridColumn;
    tvOreGC_QTA: TcxGridColumn;
    tvOreGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvOreGC_DESCRIZIONE: TcxGridColumn;
    tvOreGUID: TcxGridColumn;
    tvOreGUID_REF: TcxGridColumn;
    tvOreGUID_ANCESTOR: TcxGridColumn;
    lvRT: TcxGridLevel;
    tvRTDescrizione: TcxGridColumn;
    tvRTMarca: TcxGridColumn;
    tvRTUM: TcxGridColumn;
    tvRTQta: TcxGridColumn;
    tvRTPotenza: TcxGridColumn;
    tvRTCertificazione: TcxGridColumn;
    tvRTInstallato: TcxGridColumn;
    tvRTInstallabile: TcxGridColumn;
    tvRTVentilazione: TcxGridColumn;
    tvRTScComb: TcxGridColumn;
    tvRTCooElett: TcxGridColumn;
    tvRTNumSerie: TcxGridColumn;
    tvRTDichEnteGas: TcxGridColumn;
    tvRTNote: TcxGridColumn;
    tvRTCodice: TcxGridColumn;
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
    ReportDesignerDialog1: TReportDesignerDialog;
    Shape22: TShape;
    PanelAllegatoI: TPanel;
    Label207: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label212: TLabel;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Label204: TLabel;
    DBEdit19: TDBEdit;
    PanelSonoNonSono: TPanel;
    RBSono: TRadioButton;
    RBNonSono: TRadioButton;
    PanelImpiantoCompletamenteRealizzato: TPanel;
    RBImpiantoRealizzatoDaDitta: TRadioButton;
    RBImpiantoNonRealizzatoDaDitta: TRadioButton;
    DBCheckBox41: TDBCheckBox;
    DBCheckBox42: TDBCheckBox;
    TimerUI: TTimer;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    TimerCloseNonTrovato: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure BitBtnPratica2Click(Sender: TObject);
    procedure BitBtnPratica3Click(Sender: TObject);
    procedure DBEditStatoDocumentoChange(Sender: TObject);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure ImportaDocumentiEsportati;
    procedure ImportaDocumento(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate);
    procedure SalvaRighiConformita(CodiceConf: Longint; DataConf: TDate);
    procedure CaricaRighiConformita(CodiceConf: Longint; DataConf: TDate);
    procedure InserisciNuovoRigo(CodArt, StmCodArt: String; Qta: Double; InsertRigo: Boolean);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonNuovoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure Dichiarazionediconformit1Click(Sender: TObject);
    procedure Relazionetipologicadelmaterialeutilizzato1Click(Sender: TObject);
    procedure Autodichiarazionedipossessodeirequisititecnicoprofessionali1Click(Sender: TObject);
    procedure PanelCucinaEnter(Sender: TObject);
    procedure PanelCucinaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PanelTuboEnter(Sender: TObject);
    procedure PanelTuboExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DichiarazioniperlEntedistributoredelgas1Click(Sender: TObject);
    procedure CaricaDatiDestinatarioRichiestaPrimaAccensione(Cod: Integer);
    procedure Richiestadiprimaaccensionecaldaia1Click(Sender: TObject);
    procedure SalvaRighiAccorpatiInUnUnicoRigo(CodiceConf: Longint; DataConf: TDate; ProgRigo: Longint; DC: TcxCustomDataController);
    procedure AggiungiRiferimentoDocumento(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate);
    procedure BitBtnClienteClick(Sender: TObject);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButtonRollOver1Click(Sender: TObject);
    procedure BitBtnPrimAccSoggClick(Sender: TObject);
    procedure QryAppBeforePost(DataSet: TDataSet);
    procedure cxPageControl2Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure Puzzle1SelectionChange(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
    procedure Puzzle1NewPuzzleObject(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
    procedure tvAppRIFGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: String);
    procedure cxPageControl1Change(Sender: TObject);
    procedure Caricasfondo1Click(Sender: TObject);
    procedure Puzzle1BeforeDeletePuzzleObject(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
    procedure ProvaStampaSchema1Click(Sender: TObject);
    procedure ProvastampaPag31Click(Sender: TObject);
    procedure ProvastampaPag11Click(Sender: TObject);
    procedure Grigliavisibileinvisibile1Click(Sender: TObject);
    procedure StampaallegatoA1Click(Sender: TObject);
    procedure SBEspandiProprietarioClick(Sender: TObject);
    procedure SBCommittenteClick(Sender: TObject);
    procedure SBEspandiImmobileClick(Sender: TObject);
    procedure SBImmobileClick(Sender: TObject);
    procedure SBEspandiCommittenteClick(Sender: TObject);
    procedure SBProprietarioClick(Sender: TObject);
    procedure StampaAllegatoB1Click(Sender: TObject);
    procedure SBSocGasCantiereClick(Sender: TObject);
    procedure StampaallegatoC1Click(Sender: TObject);
    procedure StampaallegatoE1Click(Sender: TObject);
    procedure StampaallegatoE2Click(Sender: TObject);
    procedure tvMaterialiS3UBICAZIONEPropertiesInitPopup(Sender: TObject);
    procedure tvMaterialiS3COMPONENTEPropertiesInitPopup(Sender: TObject);
    procedure tvAppUBICAZIONEPropertiesInitPopup(Sender: TObject);
    procedure tvAppAPPARECCHIATURAPropertiesInitPopup(Sender: TObject);
    procedure DBEdit56KeyPress(Sender: TObject; var Key: Char);
    procedure PuzzleTermoSelectionChange(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
    procedure PuzzleIdroSelectionChange(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
    procedure tvTermoMatUBICAZIONEPropertiesInitPopup(Sender: TObject);
    procedure tvTermoMatCOMPONENTEPropertiesInitPopup(Sender: TObject);
    procedure tvTermoAppUBICAZIONEPropertiesInitPopup(Sender: TObject);
    procedure tvTermoAppCOMPONENTEPropertiesInitPopup(Sender: TObject);
    procedure tvIdroAppUBICAZIONEPropertiesInitPopup(Sender: TObject);
    procedure tvIdroAppCOMPONENTEPropertiesInitPopup(Sender: TObject);
    procedure tvIdroMatUBICAZIONEPropertiesInitPopup(Sender: TObject);
    procedure tvIdroMatCOMPONENTEPropertiesInitPopup(Sender: TObject);
    procedure tvAppCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DbeCommittAllegObbligPropertiesInitPopup(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SetBitmapsSchemaFileName;
    procedure tvTermoMatEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure tvTermoAppEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure tvMaterialiEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure tvIdroMatEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure tvAppEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure tvIdroAppEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure QryAppAfterPost(DataSet: TDataSet);
    procedure CopiaimmaginedisfondodallasezioneGAS1Click(Sender: TObject);
    procedure CopiaimmaginedisfondodallasezioneTERMO1Click(Sender: TObject);
    procedure CopiaimmaginedisfondodallasezioneIDRO1Click(Sender: TObject);
    procedure MenuPuzzlePopup(Sender: TObject);
    procedure CopiamuriscrittedallasezioneTERMO1Click(Sender: TObject);
    procedure CopiamuriscrittedallasezioneGAS1Click(Sender: TObject);
    procedure CopiamuriscrittedallasezioneIDRO1Click(Sender: TObject);
    procedure Eliminaimmaginedisfondo1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PanelNoteAllegatiResize(Sender: TObject);
    procedure tvRTDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvRTEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure tvRTEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure ReportDesignerDialog1BandBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure TimerUITimer(Sender: TObject);
    procedure AzzeraStato1Click(Sender: TObject);
    procedure DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerCloseNonTrovatoTimer(Sender: TObject);

  private
    { Private declarations }
    // MaxRifProv: Indica il valore massimo assegnato come riferimento provvisorio per
    // gli oggetti inseriti negli elenchi dei materiali/apparecchi ma non nel disegno.
    MaxRifProv: Smallint;
    // Indice temporaneo per la valorizzazione del campo PROGRIGO quando il rigo non fa
    // parte di un documento.
    MaxProgRigo: Integer;
    // Memorizza il cxTabSheet selezionato prima di passare via programma ad un tab
    // relativo ai dati dei materiali/apparecchi
    PrecTabGasMaterialiApparecchi: TcxTabSheet;
    PrecTabTermoMaterialiApparecchi: TcxTabSheet;
    PrecTabIdroMaterialiApparecchi: TcxTabSheet;
    fIsDocModel: Boolean;
    fCodiceModello: Integer;
    fCodiceConformitaSorgente: Integer;
    fDataConformitaSorgente: TDate;
    // Flag che indica se l'esecuzione del gestore dell'evento on Show è stata completata
    // per la prima volta oppure no
    fOnShowCompletato: Boolean;

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    // Puntatore alla form degli Allegati relativa a questa form stessa
    fAllegatiForm: TAllegatiForm;
    procedure Allegati_AggiornaDatiFiltri;
    procedure Allegati_CreaForm;
    procedure Allegati_VerificaAbilitazione;
    // =========================================================================

    function GetMaxProgRigo: Integer;
    function GetNextProgRigo: Integer;
    procedure CreaPuzzleLayers(P: TPuzzle);
    function CalcolaNuovoRiferimento(PO: TPuzzleObject): String;
    procedure CreaNuovaVoceElencoMaterialeApparecchi(P: TPuzzle; PO: TPuzzleObject);
    procedure AggiornaRecordOggetto(PO: TPuzzleObject; CDS: TIBOQuery);
    procedure LoadPuzzleObjects(CodConf: Integer; DataConf: TDateTime; PO: TPuzzle);
    function CalcolaNuovoRiferimentoProvvisorio(DescArt: String): String;
    procedure ClosePuzzleToolsForm;
    procedure CheckForPuzzleToolsShow;
    procedure SalvaSfondoPuzzle(P: TPuzzle; Sezione, BlobFieldName: String);
    procedure CaricaSfondoDisegno(P: TPuzzle; Sezione, BlobFieldName: String);
    procedure CopyTestateConformita;
    procedure CopyRighi4690(DestDataset: TIBOQuery; MatApp, Sezione: String);
    procedure ImportaModello;
    procedure CheckForDeleteButtonShow;
    procedure EliminaMatAppSelezionatiGriglia;
    procedure ImportaDatiPratica;
    procedure SBEspandiIMMOBrietarioClick(Sender: TObject);
    procedure SBIMMOBrietarioClick(Sender: TObject);
    procedure CopyTestateConformitaDaDichiarazione;
    procedure ImportaDichiarazioneDiConformita;
    procedure CopyRighi4690DaDichiarazione(DestDataset: TIBOQuery; MatApp, Sezione: String);
    function GetDatasetToUse(P: TPuzzle; MatApp: String): TIBOQuery;
    function GetCurrentMatAppTableView: TcxGridDBTableView;
    function MatAppPresent(DescArt: String): Boolean;
    function LocatePuzzleObjectByRif(V: TcxGridDBTableView; RifToSearch: String): Boolean;
    procedure CheckForAggiungiButtonShow;
    procedure CaricaRighiApparecchiMateriali;
    procedure RicaricaDisegno(P: TPuzzle);
    procedure CreatePuzzleTools;
    procedure EnableDisablePuzzleTools(PT: TPuzzleToolsForm; Enabled: Boolean);
    function OggettiSelezionatiTuttiDiUnTipo(L: TPuzzleLayer): Boolean;
    procedure AggiornaTuttiGliOggettiDelDataset(P: TPuzzle; CDS: TIBOQuery);
    procedure AggiornaElencoMaterialiApparecchi(P: TPuzzle; PO: TPuzzleObject; RifToSearch: String = '');
    procedure CopiaImmagineDiSfondo(PSource, PDest: TPuzzle);
    procedure LoadPuzzleObjectsFromDataSet(PO: TPuzzle; DS: TDataSet);
    procedure CopiaMuri(PDest: TPuzzle; DSSource, DSDest: TDataSet);
    procedure GridEdit(SetEdit: Boolean);
    procedure CaricaDati;
    procedure SalvaDati;
  public
    { Public declarations }
    // Queste contengono i riferimenti al record da visualizzare/editare
    CodiceConformita: Longint;
    DataConformita: TDate;
    CodiceCliente, CodicePratica, DataPratica: String;
    // Proprietà che contengono il nome attuale delle Bitmaps per la stampa degli schemi
    BmpSchemaGasFileName, BmpSchemaTermoFileName, BmpSchemaIdroFileName: String;
    // Questa proprietà indica se il documneto attuale è un modello oppure no
    property IsDocModel: Boolean read fIsDocModel write fIsDocModel;
    // Proprietà che indica il riferimento al modello di dichiarazione a cui
    // il documento corrente si riferisce e da cui ha importato i dati.
    property CodiceModello: Integer read fCodiceModello write fCodiceModello;
    property CodiceConformitaSorgente: Integer read fCodiceConformitaSorgente write fCodiceConformitaSorgente;
    property DataConformitaSorgente: TDate read fDataConformitaSorgente write fDataConformitaSorgente;

    procedure StampaSchema(Puzzle: TPuzzle; QRImg: TBitMap);
  end;

var
  ConformitaForm: TConformitaForm;

implementation

uses DataModule1, QRDichiarazioneConformita, main, FormHelp,
  SchedaArticoli1, FormAnagArt, QRElencoMateriale, QRAutodichiarazione,
  QRDichiarazioneGas, QRRichiestaPrimaAccensione,
  Math, StrUtils, ClassTubePuzzleObject, ARAll4690S2QB, QRAll4690Pag3,
  QRAll4690Pag1, FormStampaDichiarazione,
  FormPuzzleToolsGas, FormPuzzleToolsTermo, FormPuzzleToolsIdro;

{$R *.DFM}

// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
// Procedure che crea la form degli allegati se questa non esiste già e la
// apre, alla fine esegue l'interrogazione per mostrare gli allegati.
procedure TConformitaForm.Allegati_CreaForm;
begin
  // Se la form degli allegati non è stata ancora creata la crea.
  if not Assigned(fAllegatiForm) then
  begin
    // Crea la form degli allegati
    fAllegatiForm := MainForm.Allegati_CreaForm(PanelNoteAllegati);
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
procedure TConformitaForm.Allegati_AggiornaDatiFiltri;
begin
  // Ovviamente se la form degli allegati è chiusa esce subito
  if fAllegatiForm = nil then
    Exit;

  // Azzeramento filtri
  fAllegatiForm.AzzeraFiltri;

  // Codice soggetto
  if not DM1.TableConformitaCLIENTE.IsNull then
    fAllegatiForm.Filter_CodSogg := DM1.TableConformitaCLIENTE.Value;

  // Codice Pratica
  if not DM1.TableConformitaPRATICA.IsNull then
    fAllegatiForm.Filter_CodPrat := DM1.TableConformitaPRATICA.Value;
  // Data Pratica
  if not DM1.TableConformitaDATAPRATICA1.IsNull then
    fAllegatiForm.Filter_DataPrat := DM1.TableConformitaDATAPRATICA1.Value;

  // Tipo Documento
  fAllegatiForm.Filter_TipoDoc := 'Conformita';
  // Registro Documento
  // NB: LA dichiarazione di conformità non ha registro
  fAllegatiForm.Filter_RegDoc := '';
  // Numero documento
  if not DM1.TableConformitaCODICE.IsNull then
    fAllegatiForm.Filter_NumDoc := DM1.TableConformitaCODICE.Value;
  // Data documento
  if not DM1.TableConformitaDATA.IsNull then
    fAllegatiForm.Filter_DataDoc := DM1.TableConformitaDATA.Value;

  // Imposta i filtri
  fAllegatiForm.ImpostaFiltri;

  // Effettua l'interrogazione
  fAllegatiForm.EseguiQuery;
end;

// Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
// determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
procedure TConformitaForm.Allegati_VerificaAbilitazione;
begin
  // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
  // stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
  // perchè abbiamo scelto che non si possono inserire allegati in documento in fase
  // di creazione finchè non è stato confermato almeno la prima volta.
  if (DM1.TableConformita.State = dsInsert) then
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

procedure TConformitaForm.GridEdit(SetEdit: Boolean);
begin
  // In base al parametro ricevuto mette la griglia del corpo documento
  // in modalità di editing oppure no
  tvRT.OptionsData.Appending := SetEdit;
  tvRT.OptionsData.Deleting := SetEdit;
  tvRT.OptionsData.Editing := SetEdit;
  tvRT.OptionsData.Inserting := SetEdit;
end;

// Procedura che setta i nomi attuali delle Bitmaps per la stampa degli schemi
// della dichiarazione di conforità.
// Praticamente conpone il nome deil files aggiungendo anche la data e ora fino ai
// secondi in modo da scongiurare che lanciando la stampa simultaneamente da due levante
// diversi che giarno sulla stessa macchina posano mischiarsi gli schemi.
procedure TConformitaForm.SetBitmapsSchemaFileName;
var
  TmpStr: String;
begin
  TmpStr := FormatDateTime('dd_mm_yyyy_hh_nn_ss', Now);
  BmpSchemaGasFileName := 'SchemaGas_' + TmpStr + '.bmp';
  BmpSchemaTermoFileName := 'SchemaTermo_' + TmpStr + '.bmp';
  BmpSchemaIdroFileName := 'SchemaIdro_' + TmpStr + '.bmp';
end;

// =============================================================================
// INIZIO: PARTE PER LA STAMPA DEL DISEGNO
// -----------------------------------------------------------------------------
{
  // Stampa lo schema
  procedure TConformitaForm.StampaSchema(Puzzle:TPuzzle; QRImg:TQRImage);
  var
  L, i: Integer;
  CurrLayer: TPuzzleLayer;
  CurrObj: TPuzzleObject;
  PrecWidth, PrecHeight: Integer;
  begin
  // Salva le dimensioni attuali dello schema
  PrecWidth := QRImg.Width;
  PrecHeight := QRImg.Height;
  // RIdimensiona l'oggetto che stamperà lo schema in modo che
  //  sia uguale al Puzzle di ConformitaForm.
  QRImg.Width := Puzzle.Width;
  QRImg.Height := Puzzle.Height;
  // Stampa la griglia di sfondo
  //  QRImg.Canvas.Draw(0, 0, ConformitaForm.Puzzle1.SfondoGriglia.Picture.Graphic);
  // Stampa l'immagine di sfondo
  QRImg.Canvas.Draw(0, 0, Puzzle.SfondoImg.Picture.Graphic);
  // Cicla per tutti i layers del disegno schematico
  for L := 0 to Puzzle.ComponentCount -1 do begin
  // Solo se si tratta di un layer...
  if Puzzle.Components[L] is TPuzzleLayer then begin
  // CurrLayer punta al layer corrente
  CurrLayer := Puzzle.Components[L] as TPuzzleLayer;
  // Cicla per tutti gli oggetti del layer corrente,,,
  for i := 0 to CurrLayer.ComponentCount -1 do begin
  // Se l'oggetto corrente è un PuzzleObject...
  if CurrLayer.Components[i] is TPuzzleObject then begin
  // CurrObj punta all'oggetto corrente.
  CurrObj := CurrLayer.Components[i] as TPuzzleObject;
  // Disegna l'oggetto corrente nello schema da stampare...
  QRImg.Canvas.Draw(CurrObj.Left, CurrObj.Top, CurrObj.Picture.Graphic);
  end;
  end;
  end;
  end;
  // Ridimensionamento disegno per adattamento alla pagina
  QRImg.Stretch := True;
  QRImg.Width := PrecWidth;
  QRImg.Height := PrecHeight;
  end;
}
// Stampa lo schema
procedure TConformitaForm.StampaSchema(Puzzle: TPuzzle; QRImg: TBitMap);
var
  L, i: Integer;
  CurrLayer: TPuzzleLayer;
  CurrObj: TPuzzleObject;
begin
  // RIdimensiona l'oggetto che stamperà lo schema in modo che
  // sia uguale al Puzzle di ConformitaForm.
  QRImg.Width := Puzzle.HorzScrollBar.Range;
  QRImg.Height := Puzzle.VertScrollBar.Range;
  // Stampa la griglia di sfondo
  // QRImg.Canvas.Draw(0, 0, ConformitaForm.Puzzle1.SfondoGriglia.Picture.Graphic);
  // Stampa l'immagine di sfondo
  QRImg.Canvas.StretchDraw(QRImg.Canvas.ClipRect, Puzzle.SfondoImg.Picture.Graphic);
  // QRImg.Canvas.Draw(0, 0, Puzzle.SfondoImg.Picture.Graphic);
  // Cicla per tutti i layers del disegno schematico
  for L := 0 to Puzzle.ComponentCount - 1 do
  begin
    // Solo se si tratta di un layer...
    if Puzzle.Components[L] is TPuzzleLayer then
    begin
      // CurrLayer punta al layer corrente
      CurrLayer := Puzzle.Components[L] as TPuzzleLayer;
      // Cicla per tutti gli oggetti del layer corrente,,,
      for i := 0 to CurrLayer.ComponentCount - 1 do
      begin
        // Se l'oggetto corrente è un PuzzleObject...
        if CurrLayer.Components[i] is TPuzzleObject then
        begin
          // CurrObj punta all'oggetto corrente.
          CurrObj := CurrLayer.Components[i] as TPuzzleObject;
          // Disegna l'oggetto corrente nello schema da stampare...
          QRImg.Canvas.Draw((CurrObj.Left + Puzzle.HorzScrollBar.Position), (CurrObj.Top + Puzzle.VertScrollBar.Position), CurrObj.Picture.Bitmap);
          // QRImg.Canvas.Draw(CurrObj.Left, CurrObj.Top, CurrObj.Glyph);
          // CurrObj.DrawRiferimento(QRImg.Canvas, CurrObj.Left, CurrObj.Top);
        end;
      end;
    end;
  end;
end;
// -----------------------------------------------------------------------------
// FINE: PARTE PER LA STAMPA DEL DISEGNO
// =============================================================================




// =============================================================================
// INIZIO: PARTE PER LA DERIVAZIONE DI UNA DICHIARAZIONE DA UN'ALTRA DICHIARAZIONE
// -----------------------------------------------------------------------------

// Questa procedura effettua l'importazione dei dati del modello sulla
// dichiarazione di conformità attuale.
procedure TConformitaForm.ImportaDichiarazioneDiConformita;
begin
  try
    MaxProgRigo := 0;
    // Carica i dati del modello
    DM1.ShowWait('Copia Dichiarazione di Conformità', 'Copia dati testata in corso...');
    CopyTestateConformitaDaDichiarazione;
    DM1.ShowWait('Copia Dichiarazione di Conformità', 'Copia righi Relazione tipologica dei materiali utilizzati in corso...');
    CaricaRighiConformita(Self.CodiceConformitaSorgente, Self.DataConformitaSorgente);
    DM1.ShowWait('Copia Dichiarazione di Conformità', 'Copia righi allegati 46/90 (apparecchi) in corso...');
    CopyRighi4690DaDichiarazione(Self.QryApp, 'A', 'GAS');
    CopyRighi4690DaDichiarazione(Self.QryTermoApp, 'A', 'TERMO');
    CopyRighi4690DaDichiarazione(Self.QryIdroApp, 'A', 'IDRO');
    DM1.ShowWait('Copia Dichiarazione di Conformità', 'Copia righi allegati 46/90 (materiali) in corso...');
    CopyRighi4690DaDichiarazione(Self.QryMat, 'M', 'GAS');
    CopyRighi4690DaDichiarazione(Self.QryTermoMat, 'M', 'TERMO');
    CopyRighi4690DaDichiarazione(Self.QryIdroMat, 'M', 'IDRO');
    DM1.ShowWait('Copia Dichiarazione di Conformità', 'Copia righi allegati 46/90 (altri) in corso...');
    CopyRighi4690DaDichiarazione(Self.QryAltri, '', 'GAS');
    CopyRighi4690DaDichiarazione(Self.QryTermoAltri, '', 'TERMO');
    CopyRighi4690DaDichiarazione(Self.QryIdroAltri, '', 'IDRO');
  finally
    DM1.CloseWait;
  end;
end;

// Questa procedura copia i valori della testata del MOdello
procedure TConformitaForm.CopyTestateConformitaDaDichiarazione;
var
  Q: TIB_Cursor;
  i: Integer;
begin
  // Se non è specificato nessun modello esce subito
  if Self.CodiceConformitaSorgente = 0 then
    Exit;
  // Crea e imposta la query che preleverà i campi del modello per copiarne
  // i valori sul documento attuale
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT FIRST 1 * FROM CONFORM WHERE CODICE = ' + IntToStr(Self.CodiceConformitaSorgente) + ' AND DATA = ''' + FormatDateTime('mm/dd/yyyy',
      Self.DataConformitaSorgente) + '''');
    Q.Open;
    if Q.Eof then
      Exit;
    // Cicla per tutti i campi...
    for i := 0 to Q.FieldCount - 1 do
    begin
      // Se il campo attuale non è una di questi elencati nelle varie IF procede con la copia
      // del valore del campo dal MOdello.
      if Q.Fields[i].FieldName = 'CODICE' then // Non lo importa
      else if Q.Fields[i].FieldName = 'DATA' then // Non lo importa
      else if Q.Fields[i].FieldName = 'CLIENTE' then // Non lo importa
      else if Q.Fields[i].FieldName = 'PRATICA' then // Non lo importa
      else if Q.Fields[i].FieldName = 'DATAPRATICA1' then // Non lo importa
      else if Q.Fields[i].FieldName = 'PRATICA2' then // Non lo importa
      else if Q.Fields[i].FieldName = 'DATAPRATICA2' then // Non lo importa
      else if Q.Fields[i].FieldName = 'PRATICA3' then // Non lo importa
      else if Q.Fields[i].FieldName = 'DATAPRATICA3' then // Non lo importa
      else
      begin
        // Importa il valore del modello nel documento corrente al campo attuale.
        if (not Q.Fields[i].IsNull) then
        begin
          DM1.TableConformita.FieldByName(Q.Fields[i].FieldName).Value := Q.Fields[i].Value;
        end;
      end;
    end;
    // Reimposta il cliente della dichiarazione di conformita e la pratica
    // perchè ora li ha erediati dal documento sorgente e invece bisogna mettere
    // l'utente e la pratica attualmente selezionati.
    if Self.CodiceCliente <> '' then
      DM1.TableConformitaCLIENTE.Value := StrToInt(Self.CodiceCliente);
    if Self.CodicePratica <> '' then
    begin
      DM1.TableConformitaPRATICA.Value := StrToInt(Self.CodicePratica);
      DM1.TableConformitaDATAPRATICA1.Value := StrToDate(Self.DataPratica);
    end;
  finally
    Q.Free;
  end;
end;

// Questa procedura copia i valori della testata del MOdello
procedure TConformitaForm.CopyRighi4690DaDichiarazione(DestDataset: TIBOQuery; MatApp, Sezione: String);
var
  Q: TIB_Cursor;
  i: Integer;
begin
  // Se non è specificato nessun modello esce subito
  if Self.CodiceConformitaSorgente = 0 then
    Exit;
  // Crea e imposta la query che preleverà i campi del modello per copiarne
  // i valori sul documento attuale
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Se il parametro MatApp = '' allora carica tutti i righi tranne quelli che sono Materiali o Apparecchi
    if MatApp = '' then
      Q.SQL.Add('SELECT * FROM RIGHIPRV WHERE CODICECONF = ' + IntToStr(Self.CodiceConformitaSorgente) + ' AND DATACONF = ''' + FormatDateTime('mm/dd/yyyy',
        DataConformitaSorgente) + ''' AND S3MATERIALEAPPARECCHIO <> ''M'' AND S3MATERIALEAPPARECCHIO <> ''A'' AND S3SEZIONE = ''' + Sezione + '''')
    else
      Q.SQL.Add('SELECT * FROM RIGHIPRV WHERE CODICECONF = ' + IntToStr(Self.CodiceConformitaSorgente) + ' AND DATACONF = ''' + FormatDateTime('mm/dd/yyyy',
        DataConformitaSorgente) + ''' AND S3MATERIALEAPPARECCHIO = ''' + MatApp + ''' AND S3SEZIONE = ''' + Sezione + '''');
    Q.Open;
    // Cicla finchè ci sono righi da importare
    while not Q.Eof do
    begin
      // Append del rigo sul Dataset destinazione
      DestDataset.Append;
      // Cicla per tutti i campi...
      for i := 0 to Q.FieldCount - 1 do
      begin
        // Se il campo attuale non è una di questi elencati nelle varie IF procede con la copia
        // del valore del campo dal MOdello.
        if Q.Fields[i].FieldName = 'CODICECONF' then // Non lo importa
        else if Q.Fields[i].FieldName = 'DATACONF' then // Non lo importa
        else if Q.Fields[i].FieldName = 'PRATICA' then // Non lo importa
        else if Q.Fields[i].FieldName = 'DATAPRATICA' then // Non lo importa
        else if Q.Fields[i].FieldName = 'TIPODOCUMENTO' then // Non lo importa
        else if Q.Fields[i].FieldName = 'REGISTRO' then // Non lo importa
        else if Q.Fields[i].FieldName = 'NUMORDPREV' then // Non lo importa
        else if Q.Fields[i].FieldName = 'DATADOCUMENTO' then // Non lo importa
        else
        begin
          // Importa il valore del modello nel documento corrente al campo attuale.
          // NB: Solo e il valore del campo attuale non è nullo e solo se il campo attuale esiste anche nel
          // Dataset destinazione.
          if (not Q.Fields[i].IsNull) and (DestDataset.Fields.FindField(Q.Fields[i].FieldName) <> nil) then
          begin
            // Copia il campo
            DestDataset.FieldByName(Q.Fields[i].FieldName).Value := Q.Fields[i].Value;
            // Se il campo è il progressivo del rigo, aggiorna la variabile che contiene il PROGRIGO
            // massimo assegnato.
            if (Q.Fields[i].FieldName = 'PROGRIGO') and (Q.Fields[i].AsInteger > MaxProgRigo) then
              MaxProgRigo := Q.Fields[i].AsInteger;
          end;
        end;
      end;
      DestDataset.Post;
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

// -----------------------------------------------------------------------------
// FINE: PARTE PER LA DERIVAZIONE DI UNA DICHIARAZIONE DA UN'ALTRA DICHIARAZIONE
// =============================================================================
// =============================================================================
// INIZIO: PARTE PER LA DERIVAZIONE DI UNA DICHIARAZIONE DA UN MODELLO
// -----------------------------------------------------------------------------

// Questa procedura effettua l'importazione dei dati del modello sulla
// dichiarazione di conformità attuale.
procedure TConformitaForm.ImportaModello;
begin
  try
    MaxProgRigo := 0;
    // Carica i dati del modello
    DM1.ShowWait('Creazione automatica Dichiarazione di Conformità', 'Creazione dati testata in corso...');
    CopyTestateConformita;
    DM1.ShowWait('Copia Dichiarazione di Conformità', 'Copia righi Relazione tipologica dei materiali utilizzati in corso...');
    CaricaRighiConformita(Self.CodiceModello, StrToDate('01/01/1900'));
    DM1.ShowWait('Creazione automatica Dichiarazione di Conformità', 'Creazione righi allegati 46/90 (apparecchi) in corso...');
    CopyRighi4690(Self.QryApp, 'A', 'GAS');
    CopyRighi4690(Self.QryTermoApp, 'A', 'TERMO');
    CopyRighi4690(Self.QryIdroApp, 'A', 'IDRO');
    DM1.ShowWait('Creazione automatica Dichiarazione di Conformità', 'Creazione righi allegati 46/90 (materiali) in corso...');
    CopyRighi4690(Self.QryMat, 'M', 'GAS');
    CopyRighi4690(Self.QryTermoMat, 'M', 'TERMO');
    CopyRighi4690(Self.QryIdroMat, 'M', 'IDRO');
    DM1.ShowWait('Creazione automatica Dichiarazione di Conformità', 'Creazione righi allegati 46/90 (altri) in corso...');
    CopyRighi4690(Self.QryAltri, '', 'GAS');
    CopyRighi4690(Self.QryTermoAltri, '', 'TERMO');
    CopyRighi4690(Self.QryIdroAltri, '', 'IDRO');
  finally
    DM1.CloseWait;
  end;
end;

// Questa procedura copia i valori della testata del MOdello
procedure TConformitaForm.CopyTestateConformita;
var
  Q: TIB_Cursor;
  i: Integer;
begin
  // Se non è specificato nessun modello esce subito
  if Self.CodiceModello = 0 then
    Exit;
  // Crea e imposta la query che preleverà i campi del modello per copiarne
  // i valori sul documento attuale
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT FIRST 1 * FROM CONFORM WHERE CODICE = ' + IntToStr(Self.CodiceModello) + ' AND DATA = ''01/01/1900''');
    Q.Open;
    if Q.Eof then
      Exit;
    // Cicla per tutti i campi...
    for i := 0 to Q.FieldCount - 1 do
    begin
      // Se il campo attuale non è una di questi elencati nelle varie IF procede con la copia
      // del valore del campo dal MOdello.
      if Q.Fields[i].FieldName = 'CODICE' then // Non lo importa
      else if Q.Fields[i].FieldName = 'DATA' then // Non lo importa
      else if Q.Fields[i].FieldName = 'CLIENTE' then // Non lo importa
      else if Q.Fields[i].FieldName = 'DESCMODELLO' then // Non lo importa
      else if Q.Fields[i].FieldName = 'S2QBBGIMAGE' then // Non lo importa
      else if Q.Fields[i].FieldName = 'ILSOTTOSCRITTO' then // Non lo importa
      else if Q.Fields[i].FieldName = 'RIFMODEL_CODICE' then
        DM1.TableConformitaRIFMODEL_CODICE.Value := Q.FieldByName('CODICE').Value
      else
      begin
        // Importa il valore del modello nel documento corrente al campo attuale.
        if (not Q.Fields[i].IsNull) then
        begin
          DM1.TableConformita.FieldByName(Q.Fields[i].FieldName).Value := Q.Fields[i].Value;
        end;
      end;
    end;
  finally
    Q.Free;
  end;
end;

// Questa procedura copia i valori della testata del MOdello
procedure TConformitaForm.CopyRighi4690(DestDataset: TIBOQuery; MatApp, Sezione: String);
var
  Q: TIB_Cursor;
  i: Integer;
begin
  // Se non è specificato nessun modello esce subito
  if Self.CodiceModello = 0 then
    Exit;
  // Crea e imposta la query che preleverà i campi del modello per copiarne
  // i valori sul documento attuale
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Se il parametro MatApp = '' allora carica tutti i righi tranne quelli che sono Materiali o Apparecchi
    if MatApp = '' then
      Q.SQL.Add('SELECT * FROM RIGHIPRV WHERE CODICECONF = ' + IntToStr(Self.CodiceModello) +
        ' AND DATACONF = ''01/01/1900'' AND S3MATERIALEAPPARECCHIO <> ''M'' AND S3MATERIALEAPPARECCHIO <> ''A'' AND S3SEZIONE = ''' + Sezione + '''')
    else
      Q.SQL.Add('SELECT * FROM RIGHIPRV WHERE CODICECONF = ' + IntToStr(Self.CodiceModello) + ' AND DATACONF = ''01/01/1900'' AND S3MATERIALEAPPARECCHIO = ''' +
        MatApp + ''' AND S3SEZIONE = ''' + Sezione + '''');
    Q.Open;
    // Cicla finchè ci sono righi da importare
    while not Q.Eof do
    begin
      // Append del rigo sul Dataset destinazione
      DestDataset.Append;
      // Cicla per tutti i campi...
      for i := 0 to Q.FieldCount - 1 do
      begin
        // Se il campo attuale non è una di questi elencati nelle varie IF procede con la copia
        // del valore del campo dal MOdello.
        if Q.Fields[i].FieldName = 'CODICECONF' then // Non lo importa
        else if Q.Fields[i].FieldName = 'DATACONF' then // Non lo importa
        else if Q.Fields[i].FieldName = 'PRATICA' then // Non lo importa
        else if Q.Fields[i].FieldName = 'DATAPRATICA' then // Non lo importa
        else if Q.Fields[i].FieldName = 'TIPODOCUMENTO' then // Non lo importa
        else if Q.Fields[i].FieldName = 'REGISTRO' then // Non lo importa
        else if Q.Fields[i].FieldName = 'NUMORDPREV' then // Non lo importa
        else if Q.Fields[i].FieldName = 'DATADOCUMENTO' then // Non lo importa
        else
        begin
          // Importa il valore del modello nel documento corrente al campo attuale.
          // NB: Solo e il valore del campo attuale non è nullo e solo se il campo attuale esiste anche nel
          // Dataset destinazione.
          if (not Q.Fields[i].IsNull) and (DestDataset.Fields.FindField(Q.Fields[i].FieldName) <> nil) then
          begin
            // Copia il campo
            DestDataset.FieldByName(Q.Fields[i].FieldName).Value := Q.Fields[i].Value;
            // Se il campo è il progressivo del rigo, aggiorna la variabile che contiene il PROGRIGO
            // massimo assegnato.
            if (Q.Fields[i].FieldName = 'PROGRIGO') and (Q.Fields[i].AsInteger > MaxProgRigo) then
              MaxProgRigo := Q.Fields[i].AsInteger;
          end;
        end;
      end;
      DestDataset.Post;
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

// -----------------------------------------------------------------------------
// FINE: PARTE PER LA DERIVAZIONE DI UNA DICHIARAZIONE DA UN MODELLO
// =============================================================================

{
  // Questa procedura crea l'oggetto in base ai parametri specificati. Viene utilizzata
  //  nel caricamento del disegno dal database all'apertura del documento.
  procedure TConformitaForm.LoadPuzzleObjects(CodConf:Integer; DataConf:TDateTime);
  var
  CurrentPuzzleLayer: TPuzzleLayer;
  NewObject: TPuzzleObject;
  NewMasterObject, NewPrevObject: TTubePuzzleObject;
  DotPosition: Byte;
  CurrentRif: String;
  begin
  // Inizializzazione
  NewObject := nil;
  NewMasterObject := nil;
  NewPrevObject := nil;
  // Tira fuori il layer dei materiali e apparecchi, per comodità
  //  CurrentPuzzleLayer := ConformitaForm.Puzzle1.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
  // IMposta ed apre la query che rimedia alcuni dati dell'oggetto da caricare
  //  dall'archivio delle apparecchiature e dei materiali
  if QryLoad.Active then QryLoad.Close;
  QryLoad.ParamValues['P_CODICECONF'] := CodConf;
  QryLoad.ParamValues['P_DATACONF'] := DataConf;
  if not QryLoad.Prepared then QryLoad.Prepare;
  QryLoad.Open;
  // Disabilita gli eventi per il puzzle
  Puzzle1.DisableEvents := True;
  try
  while not QryLoad.Eof do begin
  // Annota nella variabile globale il valore massimo progressivo del riferimento
  //  dell'oggetto corrente nel caso questo sia un oggetto presente negli elenchi
  //  materiali/apparecchi ma non nel disegno (Rif. che comincia con la lettera 'X').
  CurrentRif := QryLoad.FieldByName('S3RIF').AsString;
  if LeftStr(CurrentRif, 1) = 'X' then MaxRifProv := Max(MaxRifProv, StrToInt(Copy(CurrentRif, 2, 100)))
  // Se invece non inizia con 'X' allora carica l'elemento corrente nel disegno.
  else begin
  // =======================================================================
  // Crea l'oggetto e ne imposta le proprietà opportune
  // -----------------------------------------------------------------------
  // Tira fuori il layer dei materiali e apparecchi, per comodità
  //  Oppure quello dei muri se si tratta di un muro (RifLetter = 'W')
  //  Se invece si tratta di un sub oggetto di un oggetto composto (muri) dopo il master (slave)
  //  allora si tiene il CurrentPuzzleLayer del Master (quello che c'è già).
  if QryLoad.FieldByName('RIFLETTER').AsString = 'W' then CurrentPuzzleLayer := ConformitaForm.Puzzle1.FindComponent('LayerMuri') as TPuzzleLayer
  else if QryLoad.FieldByName('RIFLETTER').AsString = 'V' then // Non fa nulla, mantiene il Current puzzle layer precedente (Quello del Master)
  else CurrentPuzzleLayer := ConformitaForm.Puzzle1.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
  // DotPosition contiene la posizione del carattere separatore "." presente
  //  nella proprietà Riferimento dell'elemento nel caso questo sia un elemento
  //  successivo al primo in un oggetto composto da più di un elemento (Tubi)
  DotPosition := Pos('.', QryLoad.FieldByName('S3RIF').AsString);
  // Se l'elemento attuale non è un elemento composto da diversi elementi oppure se, anche se si tratta
  //  di un oggetto composto stiamo trattando il primo elemento (MasterObject) azzera tutti i riferimenti
  //  al MasterObject, al PrevTubeElement e al NextTubeElement.
  if DotPosition = 0 then begin
  // Se NewmasterOnject <> nil significa che si è appena terminato di caricare un oggetto composto
  //  (tubo) e quindi prima di azzerare le suddette variabili provvede a disegnare
  //  le linee separatrici all'inizio e alla fine del tubo stesso.
  if (NewMasterObject <> nil) then NewMasterObject.DisegnaLineaSeparazioneIniziale;
  if (NewPrevObject <> nil) then NewPrevObject.DisegnaLineaSeparazioneFinale;
  NewMasterObject := nil;
  NewPrevObject := nil;
  end;
  // Se è un oggetto normale e non composto (tubi)...
  if QryLoad.FieldByName('TIPO').AsInteger = 0
  then NewObject := TPuzzleObject.Create(CurrentPuzzleLayer, NewMasterObject, QryLoad.FieldByName('S3X').AsInteger, QryLoad.FieldByName('S3Y').AsInteger)
  // Se invece è un oggetto composto (Tubi)...
  else if QryLoad.FieldByName('TIPO').AsInteger = 1
  then NewObject := TTubePuzzleObject.Create(CurrentPuzzleLayer, NewMasterObject, NewPrevObject, QryLoad.FieldByName('S3X').AsInteger, QryLoad.FieldByName('S3Y').AsInteger);
  // Imposta le altre proprietà
  NewObject.ObjectName              := QryLoad.FieldByName('S3COMPONENTE').AsString;
  NewObject.RifLetter               := QryLoad.FieldByName('RIFLETTER').AsString;
  NewObject.MaterialeApparecchio    := QryLoad.FieldByName('S3MATERIALEAPPARECCHIO').AsString;
  NewObject.Tipo                    := QryLoad.FieldByName('TIPO').AsString;
  NewObject.BitmapFileName          := DM1.PuzzleDir + QryLoad.FieldByName('BITMAPFILENAME').AsString;
  NewObject.Rotation                := TRotationValue(QryLoad.FieldByName('S3ROTATION').AsInteger);
  NewObject.Riferimento             := QryLoad.FieldByName('S3RIF').AsString;
  // Se è di tipo TTUbePuzzleObject cioè è un oggetto composto da più elementi (Tubo)
  //  imposta anche alcune proprietà aggiuntive
  if NewObject is TTubePuzzleObject then begin
  (NewObject as TTubePuzzleObject).BitmapFileName2 := DM1.PuzzleDir + QryLoad.FieldByName('BITMAPFILENAME2').AsString;
  (NewObject as TTubePuzzleObject).EntryPoint := TEntryExitPoint(QryLoad.FieldByName('S3ENTRYPOINT').AsInteger);
  (NewObject as TTubePuzzleObject).ExitPoint := TEntryExitPoint(QryLoad.FieldByName('S3EXITPOINT').AsInteger);
  // Se nel riferimento non c'è il carattere separatore "." significa che l'oggetto è un oggetto master e quindi lo
  //  memorizza come riferimento nell'apposita variabile.
  //  NB: Praticamente gli elementi successivi al primo di un oggetto composto da più di un elemento contengono
  //       nel proprio campo RIFERIMENTO un riferimento composto da due parti (es: D1.1), la prima parte prima del
  //       punto contiene il riferimento dell'oggetto Master e la parte dopo il punto è un numero progressivo
  //       per ritrovare la sequenza corretta degli elementi dirante il caricamento dal database.
  //  NB: Inoltre se si tratta del MasterObject disegna anche la linea di separazione
  if DotPosition = 0 then NewMasterObject := (NewObject as TTubePuzzleObject);
  // Annota l'elemento attuale come elemento precedente per essere usato
  //  eventualmente nel caricamento del prossimo elemento.
  NewPrevObject := (NewObject as TTubePuzzleObject);
  end;
  // =======================================================================
  end;
  // Avanti il prossimo
  QryLoad.Next;
  end;
  // Se all'uscita da questa procedura NewMasterOnject punta a qualcosa
  //  significa che l'ultimo oggetto caricato face parte di un oggetto composto
  //  cioè di un tubo e perciò provvede a disegnare i separatori iniziale e finale.
  //  Altrimenti per l'ultimo tubo non lo farebbe
  if (NewObject is TTubePuzzleObject) and (NewMasterObject <> nil) then begin
  NewMasterObject.DisegnaLineaSeparazioneIniziale;
  NewPrevObject.DisegnaLineaSeparazioneFinale;
  end;
  finally
  // Riabilita gli eventi per il puzzle
  Puzzle1.DisableEvents := False;
  // CHiude la query
  QryLoad.Close;
  end;
  end;
}
{
  // Questa procedura crea l'oggetto in base ai parametri specificati. Viene utilizzata
  //  nel caricamento del disegno dal database all'apertura del documento.
  procedure TConformitaForm.LoadPuzzleObjects(CodConf:Integer; DataConf:TDateTime; PO:TPuzzle);
  var
  CurrentPuzzleLayer: TPuzzleLayer;
  NewObject: TPuzzleObject;
  NewMasterObject, NewPrevObject: TTubePuzzleObject;
  DotPosition: Byte;
  CurrentRif, CurrentRifLetter, CurrentBitmapFileName, CurrentBitmapFileName2: String;
  CurrentTipo: Smallint;
  begin
  // Inizializzazione
  NewObject := nil;
  NewMasterObject := nil;
  NewPrevObject := nil;
  // IMposta ed apre la query che rimedia alcuni dati dell'oggetto da caricare
  //  dall'archivio delle apparecchiature e dei materiali
  if QryLoad.Active then QryLoad.Close;
  QryLoad.ParamValues['P_CODICECONF'] := CodConf;
  QryLoad.ParamValues['P_DATACONF'] := DataConf;
  QryLoad.ParamValues['P_SEZIONE'] := PO.Sezione;
  if not QryLoad.Prepared then QryLoad.Prepare;
  QryLoad.Open;
  // Disabilita gli eventi per il puzzle
  PO.DisableEvents := True;
  try
  while not QryLoad.Eof do begin
  // Annota nella variabile globale il valore massimo progressivo del riferimento
  //  dell'oggetto corrente nel caso questo sia un oggetto presente negli elenchi
  //  materiali/apparecchi ma non nel disegno (Rif. che comincia con la lettera 'X').
  CurrentRif := QryLoad.FieldByName('S3RIF').AsString;
  if LeftStr(CurrentRif, 1) = 'X' then MaxRifProv := Max(MaxRifProv, StrToInt(Copy(CurrentRif, 2, 100)))
  // Se invece il riferimento dell'oggetto corrente è nullo non carica nulla
  else if QryLoad.FieldByName('S3RIF').IsNull then
  // Se invece non inizia con 'X' allora carica l'elemento corrente nel disegno.
  else begin
  // =======================================================================
  // Crea l'oggetto e ne imposta le proprietà opportune
  // -----------------------------------------------------------------------
  // Carica in alcune variabili locali alcune proprietà del nuovo oggetto
  //  dal record attuale
  CurrentRifLetter := QryLoad.FieldByName('RIFLETTER').AsString;
  CurrentTipo := QryLoad.FieldByName('TIPO').AsInteger;
  CurrentBitmapFileName := DM1.PuzzleDir + QryLoad.FieldByName('BITMAPFILENAME').AsString;
  CurrentBitmapFileName2 := DM1.PuzzleDir + QryLoad.FieldByName('BITMAPFILENAME2').AsString;
  // Tira fuori il layer dei materiali e apparecchi, per comodità
  //  Oppure quello dei muri se si tratta di un muro (RifLetter = 'W')
  //  Se invece si tratta di un sub oggetto di un oggetto composto (muri) dopo il master (slave)
  //  allora si tiene il CurrentPuzzleLayer del Master (quello che c'è già).
  if CurrentRifLetter = 'W' then CurrentPuzzleLayer := PO.FindComponent('LayerMuri') as TPuzzleLayer
  else if CurrentRifLetter = 'V' then // Non fa nulla, mantiene il Current puzzle layer precedente (Quello del Master)
  else CurrentPuzzleLayer := PO.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
  // DotPosition contiene la posizione del carattere separatore "." presente
  //  nella proprietà Riferimento dell'elemento nel caso questo sia un elemento
  //  successivo al primo in un oggetto composto da più di un elemento (Tubi)
  DotPosition := Pos('.', QryLoad.FieldByName('S3RIF').AsString);
  // Se l'elemento attuale non è un elemento composto da diversi elementi oppure se, anche se si tratta
  //  di un oggetto composto stiamo trattando il primo elemento (MasterObject) azzera tutti i riferimenti
  //  al MasterObject, al PrevTubeElement e al NextTubeElement.
  if DotPosition = 0 then begin
  // Se NewmasterOnject <> nil significa che si è appena terminato di caricare un oggetto composto
  //  (tubo) e quindi prima di azzerare le suddette variabili provvede a disegnare
  //  le linee separatrici all'inizio e alla fine del tubo stesso.
  if (NewMasterObject <> nil) then NewMasterObject.DisegnaLineaSeparazioneIniziale;
  if (NewPrevObject <> nil) then NewPrevObject.DisegnaLineaSeparazioneFinale;
  NewMasterObject := nil;
  NewPrevObject := nil;
  end;
  // Se è un oggetto normale e non composto (tubi)...
  if CurrentTipo = 0
  then NewObject := TPuzzleObject.Create(CurrentPuzzleLayer, NewMasterObject, QryLoad.FieldByName('S3X').AsInteger, QryLoad.FieldByName('S3Y').AsInteger)
  // Se invece è un oggetto composto (Tubi)...
  else if CurrentTipo = 1
  then NewObject := TTubePuzzleObject.Create(CurrentPuzzleLayer, NewMasterObject, NewPrevObject, QryLoad.FieldByName('S3X').AsInteger, QryLoad.FieldByName('S3Y').AsInteger);
  // Imposta le altre proprietà
  NewObject.ObjectName              := QryLoad.FieldByName('S3COMPONENTE').AsString;
  NewObject.RifLetter               := CurrentRifLetter;
  NewObject.MaterialeApparecchio    := QryLoad.FieldByName('S3MATERIALEAPPARECCHIO').AsString;
  NewObject.Tipo                    := IntToStr(CurrentTipo);
  NewObject.BitmapFileName          := CurrentBitmapFileName;
  NewObject.Rotation                := TRotationValue(QryLoad.FieldByName('S3ROTATION').AsInteger);
  NewObject.Riferimento             := QryLoad.FieldByName('S3RIF').AsString;
  // Se è di tipo TTUbePuzzleObject cioè è un oggetto composto da più elementi (Tubo)
  //  imposta anche alcune proprietà aggiuntive
  if NewObject is TTubePuzzleObject then begin
  (NewObject as TTubePuzzleObject).BitmapFileName2 := CurrentBitmapFileName2;
  (NewObject as TTubePuzzleObject).EntryPoint := TEntryExitPoint(QryLoad.FieldByName('S3ENTRYPOINT').AsInteger);
  (NewObject as TTubePuzzleObject).ExitPoint := TEntryExitPoint(QryLoad.FieldByName('S3EXITPOINT').AsInteger);
  // Se nel riferimento non c'è il carattere separatore "." significa che l'oggetto è un oggetto master e quindi lo
  //  memorizza come riferimento nell'apposita variabile.
  //  NB: Praticamente gli elementi successivi al primo di un oggetto composto da più di un elemento contengono
  //       nel proprio campo RIFERIMENTO un riferimento composto da due parti (es: D1.1), la prima parte prima del
  //       punto contiene il riferimento dell'oggetto Master e la parte dopo il punto è un numero progressivo
  //       per ritrovare la sequenza corretta degli elementi dirante il caricamento dal database.
  //  NB: Inoltre se si tratta del MasterObject disegna anche la linea di separazione
  if DotPosition = 0 then NewMasterObject := (NewObject as TTubePuzzleObject);
  // Annota l'elemento attuale come elemento precedente per essere usato
  //  eventualmente nel caricamento del prossimo elemento.
  NewPrevObject := (NewObject as TTubePuzzleObject);
  end;
  // =======================================================================
  end;
  // Avanti il prossimo
  QryLoad.Next;
  end;
  // Se all'uscita da questa procedura NewMasterOnject punta a qualcosa
  //  significa che l'ultimo oggetto caricato face parte di un oggetto composto
  //  cioè di un tubo e perciò provvede a disegnare i separatori iniziale e finale.
  //  Altrimenti per l'ultimo tubo non lo farebbe
  if (NewObject is TTubePuzzleObject) and (NewMasterObject <> nil) then begin
  NewMasterObject.DisegnaLineaSeparazioneIniziale;
  NewPrevObject.DisegnaLineaSeparazioneFinale;
  end;
  finally
  // Riabilita gli eventi per il puzzle
  PO.DisableEvents := False;
  // CHiude la query
  QryLoad.Close;
  end;
  end;
}
// Questa procedura crea l'oggetto in base ai parametri specificati. Viene utilizzata
// nel caricamento del disegno dal database all'apertura del documento.
procedure TConformitaForm.LoadPuzzleObjects(CodConf: Integer; DataConf: TDateTime; PO: TPuzzle);
begin
  // IMposta ed apre la query che rimedia alcuni dati dell'oggetto da caricare
  // dall'archivio delle apparecchiature e dei materiali
  if QryLoad.Active then
    QryLoad.Close;
  QryLoad.Params.ParamByName('P_CODICECONF').AsInteger := CodConf;
  QryLoad.Params.ParamByName('P_DATACONF').AsDate := DataConf;
  QryLoad.Params.ParamByName('P_SEZIONE').AsString := PO.Sezione;
  if not QryLoad.Prepared then
    QryLoad.Prepare;
  QryLoad.Open;
  try
    // Procedura che crea/carica gli oggetti del disegno presenti nel Dataset ricevuto.
    LoadPuzzleObjectsFromDataSet(PO, QryLoad);
  finally
    // CHiude la query
    QryLoad.Close;
  end;
end;

// Procedura che crea/carica gli oggetti del disegno presenti nel Dataset ricevuto.
procedure TConformitaForm.LoadPuzzleObjectsFromDataSet(PO: TPuzzle; DS: TDataSet);
var
  CurrentPuzzleLayer: TPuzzleLayer;
  NewObject: TPuzzleObject;
  NewMasterObject, NewPrevObject: TTubePuzzleObject;
  DotPosition: Byte;
  CurrentRif, CurrentRifLetter, CurrentBitmapFileName, CurrentBitmapFileName2: String;
  CurrentTipo: Smallint;
begin
  // Inizializzazione
  NewObject := nil;
  NewMasterObject := nil;
  NewPrevObject := nil;
  // Disabilita gli eventi per il puzzle
  PO.DisableEvents := True;
  try
    DS.First;
    while not DS.Eof do
    begin
      // Annota nella variabile globale il valore massimo progressivo del riferimento
      // dell'oggetto corrente nel caso questo sia un oggetto presente negli elenchi
      // materiali/apparecchi ma non nel disegno (Rif. che comincia con la lettera 'X').
      CurrentRif := DS.FieldByName('S3RIF').AsString;
      if LeftStr(CurrentRif, 1) = 'X' then
        MaxRifProv := Max(MaxRifProv, StrToInt(Copy(CurrentRif, 2, 100)))
        // Se invece il riferimento dell'oggetto corrente è nullo non carica nulla
      else if DS.FieldByName('S3RIF').IsNull then
        // Se invece non inizia con 'X' allora carica l'elemento corrente nel disegno.
      else
      begin
        // =======================================================================
        // Crea l'oggetto e ne imposta le proprietà opportune
        // -----------------------------------------------------------------------
        // Carica in alcune variabili locali alcune proprietà del nuovo oggetto
        // dal record attuale
        CurrentRifLetter := DS.FieldByName('RIFLETTER').AsString;
        CurrentTipo := DS.FieldByName('TIPO').AsInteger;
        CurrentBitmapFileName := DM1.PuzzleDir + DS.FieldByName('BITMAPFILENAME').AsString;
        CurrentBitmapFileName2 := DM1.PuzzleDir + DS.FieldByName('BITMAPFILENAME2').AsString;
        // Tira fuori il layer dei materiali e apparecchi, per comodità
        // Oppure quello dei muri se si tratta di un muro (RifLetter = 'W')
        // Se invece si tratta di un sub oggetto di un oggetto composto (muri) dopo il master (slave)
        // allora si tiene il CurrentPuzzleLayer del Master (quello che c'è già).
        if CurrentRifLetter = 'W' then
          CurrentPuzzleLayer := PO.FindComponent('LayerMuri') as TPuzzleLayer
        else if CurrentRifLetter = 'V' then // Non fa nulla, mantiene il Current puzzle layer precedente (Quello del Master)
        else
          CurrentPuzzleLayer := PO.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
        // DotPosition contiene la posizione del carattere separatore "." presente
        // nella proprietà Riferimento dell'elemento nel caso questo sia un elemento
        // successivo al primo in un oggetto composto da più di un elemento (Tubi)
        DotPosition := Pos('.', DS.FieldByName('S3RIF').AsString);
        // Se l'elemento attuale non è un elemento composto da diversi elementi oppure se, anche se si tratta
        // di un oggetto composto stiamo trattando il primo elemento (MasterObject) azzera tutti i riferimenti
        // al MasterObject, al PrevTubeElement e al NextTubeElement.
        if DotPosition = 0 then
        begin
          // Se NewmasterOnject <> nil significa che si è appena terminato di caricare un oggetto composto
          // (tubo) e quindi prima di azzerare le suddette variabili provvede a disegnare
          // le linee separatrici all'inizio e alla fine del tubo stesso.
          if (NewMasterObject <> nil) then
            NewMasterObject.DisegnaLineaSeparazioneIniziale;
          if (NewPrevObject <> nil) then
            NewPrevObject.DisegnaLineaSeparazioneFinale;
          NewMasterObject := nil;
          NewPrevObject := nil;
        end;
        // Se è un oggetto normale e non composto (tubi)...
        if CurrentTipo = 0 then
          NewObject := TPuzzleObject.Create(CurrentPuzzleLayer, NewMasterObject, DS.FieldByName('S3X').AsInteger, DS.FieldByName('S3Y').AsInteger)
          // Se un oggeto testo libero
        else if CurrentTipo = 2 then
          NewObject := TTextPuzzleObject.Create(CurrentPuzzleLayer, NewMasterObject, DS.FieldByName('S3X').AsInteger, DS.FieldByName('S3Y').AsInteger)
          // Se invece è un oggetto composto (Tubi)...
        else if CurrentTipo = 1 then
          NewObject := TTubePuzzleObject.Create(CurrentPuzzleLayer, NewMasterObject, NewPrevObject, DS.FieldByName('S3X').AsInteger,
            DS.FieldByName('S3Y').AsInteger);
        // Imposta le altre proprietà
        NewObject.ObjectName := DS.FieldByName('S3COMPONENTE').AsString;
        NewObject.RifLetter := CurrentRifLetter;
        NewObject.MaterialeApparecchio := DS.FieldByName('S3MATERIALEAPPARECCHIO').AsString;
        NewObject.Tipo := IntToStr(CurrentTipo);
        NewObject.BitmapFileName := CurrentBitmapFileName;
        NewObject.Rotation := TRotationValue(DS.FieldByName('S3ROTATION').AsInteger);
        NewObject.Riferimento := DS.FieldByName('S3RIF').AsString;
        // Se il puzzle layer a cui appartiene l'oggetto appena creato è il Puzzle layer attivo
        // l'oggetto sarà abilitato altrimenti no
        NewObject.Enabled := CurrentPuzzleLayer.ActiveLayer;
        // Se è di tipo TTUbePuzzleObject cioè è un oggetto composto da più elementi (Tubo)
        // imposta anche alcune proprietà aggiuntive
        if NewObject is TTubePuzzleObject then
        begin
          (NewObject as TTubePuzzleObject).BitmapFileName2 := CurrentBitmapFileName2;
          (NewObject as TTubePuzzleObject).EntryPoint := TEntryExitPoint(DS.FieldByName('S3ENTRYPOINT').AsInteger);
          (NewObject as TTubePuzzleObject).ExitPoint := TEntryExitPoint(DS.FieldByName('S3EXITPOINT').AsInteger);
          // Se nel riferimento non c'è il carattere separatore "." significa che l'oggetto è un oggetto master e quindi lo
          // memorizza come riferimento nell'apposita variabile.
          // NB: Praticamente gli elementi successivi al primo di un oggetto composto da più di un elemento contengono
          // nel proprio campo RIFERIMENTO un riferimento composto da due parti (es: D1.1), la prima parte prima del
          // punto contiene il riferimento dell'oggetto Master e la parte dopo il punto è un numero progressivo
          // per ritrovare la sequenza corretta degli elementi dirante il caricamento dal database.
          // NB: Inoltre se si tratta del MasterObject disegna anche la linea di separazione
          if DotPosition = 0 then
            NewMasterObject := (NewObject as TTubePuzzleObject);
          // Annota l'elemento attuale come elemento precedente per essere usato
          // eventualmente nel caricamento del prossimo elemento.
          NewPrevObject := (NewObject as TTubePuzzleObject);
        end;
        // Se è un oggetto Testo Libero imposta alcune propruetà aggiuntive
        if NewObject is TTextPuzzleObject then
        begin
          (NewObject as TTextPuzzleObject).Text := DS.FieldByName('DESCRIZIONE').AsString;
        end;
        // =======================================================================
      end;
      // Avanti il prossimo
      DS.Next;
    end;
    // Se all'uscita da questa procedura NewMasterOnject punta a qualcosa
    // significa che l'ultimo oggetto caricato face parte di un oggetto composto
    // cioè di un tubo e perciò provvede a disegnare i separatori iniziale e finale.
    // Altrimenti per l'ultimo tubo non lo farebbe
    if (NewObject is TTubePuzzleObject) and (NewMasterObject <> nil) then
    begin
      NewMasterObject.DisegnaLineaSeparazioneIniziale;
      NewPrevObject.DisegnaLineaSeparazioneFinale;
    end;
  finally
    // Riabilita gli eventi per il puzzle
    PO.DisableEvents := False;
  end;
end;

// Procedura che effettua la copia degli oggetti del layer dei muri da una sezione all'altra
procedure TConformitaForm.CopiaMuri(PDest: TPuzzle; DSSource, DSDest: TDataSet);
var
  i: Integer;
  FN: String;
  PL: TPuzzleLayer;
begin
  try
    // Disabilita i controlli dei DataSet coinvolti
    DSDest.DisableControls;
    DSSource.DisableControls;

    // =========================================================================
    // PARTE CHE ELIMINA DAL PUZZLE E DAL DATASET DESTINATARIO I MURI PRESENTI
    // -------------------------------------------------------------------------
    // Lavora sul Layer dei muri del Puzzle Destinazione
    PL := PDest.FindComponent('LayerMuri') as TPuzzleLayer;
    if PL = nil then
      raise Exception.Create('Layer dei muri nel disegno destinazione non trovato.');
    // Deseleziona tutto
    PL.UnselectAllSelectedObjects(nil);
    // Cicla per tutti gli oggetti del layer muri
    for i := (PL.ComponentCount - 1) downto 0 do
    begin
      // Verifica che il componente attuale sia un PuzzleObject e che abbia la
      // proprietà RifLetter = 'W', questo fa in modo che elimini solo i muri.
      if (PL.Components[i] is TPuzzleObject) and ((PL.Components[i] as TPuzzleObject).RifLetter = 'W') then
      begin
        // Elimina il componente individuato
        (PL.Components[i] as TPuzzleObject).Selected := True;
      end;
    end;
    // Elimina tutti gli oggetti che attualmente sono selezionati
    // NB: Ho fatto così perchè ciclando sempicemente ed eliminandli da dentro il ciclo mi dava degli errori
    PL.DeleteSelectedObjects;
    // =========================================================================

    // =========================================================================
    // PARTE CHE COPIA I RECORD DAL DATASET SORGENTE A QUELLO DESTINAZIONE
    // -------------------------------------------------------------------------
    // Si posiziona sul primo record da copiare
    DSSource.First;
    // Cicla per tutti i record da copiare nel DataSet sorgente
    while not DSSource.Eof do
    begin
      // Solo i records che riguardano muri e scritte
      // NB: Serve per evitare gli elementi dei muri che sono slave del MasterObjects
      if DSSource.FieldByName('RIFLETTER').AsString = 'W' then
      begin
        // Inserisce il nuovo record nel DataSet Destinazione
        DSDest.Append;
        // Cicla per tutti i campi del DataSet e ne copia i valori dal DataSet sorgente a quello destinatario
        for i := 0 to DSSource.FieldCount - 1 do
        begin
          // Per comodità FN contiene il none del campo attuale
          FN := DSSource.Fields[i].FieldName;
          // Evita di copiare alcuni campi
          if (FN = 'TIPODOCUMENTO') or (FN = 'REGISTRO') or (FN = 'NUMORDPREV') or (FN = 'DATADOCUMENTO') or (FN = 'PROGRIGO') or (FN = 'PROGRIGO2') then
          else
          begin
            // Se non è nullo copia il valore del campo corrente
            if not DSSource.Fields[i].IsNull then
              DSDest.Fields[i].Value := DSSource.Fields[i].Value;
          end;
        end;
        // Eseguq il post nel DataSet destinazione
        DSDest.Post;
      end;
      // Avanti il prossimo
      DSSource.Next;
    end;
    // =========================================================================

  finally
    // Ripristina la posizione iniziale sul DataSet origine
    DSSource.First;
    // Riabilita i controlli dei DataSet coinvolti
    DSSource.EnableControls;
    DSDest.EnableControls;
    // Carica sul Puzzle destinatario gli oggetti appena copiati dal DataSet sorgente.
    LoadPuzzleObjectsFromDataSet(PDest, DSDest);
  end;
end;

// Questa procedura crea un nuovo record negli elenchi dei materiali o degli apparecchi
// e assegna al nuovo oggetto appena creato il riferiento.
procedure TConformitaForm.CreaNuovaVoceElencoMaterialeApparecchi(P: TPuzzle; PO: TPuzzleObject);
var
  CDS: TIBOQuery;
begin
  // In base al flag che indica se il nuovo oggetto è un materiale, un apparecchio o altro,
  // si connette al Dataset appropriato.
  CDS := GetDatasetToUse(P, PO.MaterialeApparecchio);
  // NB: Se non disabilita i controlli legati al dataset succedono cose strane dopo
  // l'inserimento di nuovi elementi del disegno.
  CDS.DisableControls;
  try
    try
      // Calcola il nuovo riferimento
      PO.Riferimento := CalcolaNuovoRiferimento(PO);
      // Inserisce il nuovo record
      CDS.Append;
      // Aggiorna i relativi campi con i dati dell'oggetto appena creato
      AggiornaRecordOggetto(PO, CDS);
      // Effettua il post
      CDS.Post;
      // Se l'oggetto corrente è di tipo TTubePuzzleObject (E' un tubo o simile) e la sua proprietà
      // NexTubeElement <> nil allora la funzione richiama ricorsivamente se stessa per salvare
      // anche gli elementi successivi
      if (PO is TTubePuzzleObject) and ((PO as TTubePuzzleObject).NextTubeElement <> nil) then
      begin
        CreaNuovaVoceElencoMaterialeApparecchi(P, (PO as TTubePuzzleObject).NextTubeElement);
      end;
    except
      // Se il dataset è in stato di append esegue il cancel delle modifiche
      if CDS.State = dsInsert then
        CDS.Cancel;
    end;
  finally
    CDS.EnableControls;
  end;
end;

{
  // Questa procedura aggiorna il record relativo all'oggetto corrente con i dati
  //  modificati dall'utente.
  // Procedura che si occupa di aggiornare per tutti gli oggetti nel puzzle specificato e presenti nel dataset ricevuto
  //  alcuni dei dati relativi alla posizione dell'oggetto sul diesgno alla sua rotazione ecc.
  //  Faccio così per poter poi evitare di aggiornarli in tempo reale durante lo spostamento degli oggetti e velocizzare
  //  così questa operazione che era molto lenta.
  procedure TConformitaForm.AggiornaTuttiGliOggettiDelDataset(P:TPuzzle; CDS:TIBOQuery);
  var
  PO: TPuzzleObject;
  CurrRif: String;
  i:Integer;
  begin
  // Disabilita tutti i controlli
  CDS.DisableControls;
  try
  // Si posiziona all'inizio del dataset
  CDS.First;
  i := 0;
  // Cicla per tutti i record del dataset
  while not CDS.Eof do begin
  // Ricava l'oggetto del disegno relativo al record attuale
  // NB: Solo se il record corrente ha il campo Riferimento valido e
  //      che non comincia con X
  CurrRif := CDS.FieldByName('S3RIF').AsString;
  if (CurrRif <> '') then begin
  PO := P.PuzzleObjectByRif(CurrRif);
  // Effettua l'aggiornamento dell'oggetto attuale
  CDS.Edit;
  CDS.FieldByName('TIPODOCUMENTO').Value      := 'Conformita';
  CDS.FieldByName('REGISTRO').Value           := 'C';
  CDS.FieldByName('NUMORDPREV').Value         := DM1.TableConformitaCODICE.Value;
  CDS.FieldByName('DATADOCUMENTO').Value      := DM1.TableConformitaDATA.Value;
  CDS.FieldByName('PROGRIGO2').Value          := -1; // NB: PROGRIGO rimane com'è
  CDS.FieldByName('CODICECONF').Value         := DM1.TableConformitaCODICE.Value;
  CDS.FieldByName('DATACONF').Value           := DM1.TableConformitaDATA.Value;
  CDS.FieldByName('PROGRIGOCONF').Value       := i;
  // Ovviamente prosegue solo se PO è <> da nil (lo è quando non ha trovato alcun oggetto del puzzle con il Rif.)
  if PO <> nil then begin
  CDS.FieldByName('S3X').Value                := PO.X;
  CDS.FieldByName('S3Y').Value                := PO.Y;
  CDS.FieldByName('S3ROTATION').Value         := Ord(PO.Rotation);
  if PO is TTubePuzzleObject then begin
  CDS.FieldByName('S3ENTRYPOINT').Value     := Ord((PO as TTubePuzzleObject).EntryPoint);
  CDS.FieldByName('S3EXITPOINT').Value      := Ord((PO as TTubePuzzleObject).ExitPoint);
  end;
  if PO is TTextPuzzleObject then begin
  CDS.FieldByName('DESCRIZIONE').Value      := (PO as TTextPuzzleObject).Text;
  end;
  end;
  CDS.Post;
  end;
  // Avanti il prossimo
  CDS.Next;
  Inc(i);
  end;
  finally
  // Riabilita i controlli
  CDS.EnableControls;
  end;
  end;
}
// Questa procedura aggiorna il record relativo all'oggetto corrente con i dati
// modificati dall'utente.
// Procedura che si occupa di aggiornare per tutti gli oggetti nel puzzle specificato e presenti nel dataset ricevuto
// alcuni dei dati relativi alla posizione dell'oggetto sul diesgno alla sua rotazione ecc.
// Faccio così per poter poi evitare di aggiornarli in tempo reale durante lo spostamento degli oggetti e velocizzare
// così questa operazione che era molto lenta.
procedure TConformitaForm.AggiornaTuttiGliOggettiDelDataset(P: TPuzzle; CDS: TIBOQuery);
var
  PO: TPuzzleObject;
  CurrRif: String;
  i: Integer;
begin
  // Disabilita tutti i controlli
  CDS.DisableControls;
  try
    // Si posiziona all'inizio del dataset
    CDS.First;
    i := 0;
    // Cicla per tutti i record del dataset
    while not CDS.Eof do
    begin
      // Effettua l'aggiornamento dell'oggetto attuale con alcuni campi
      // fondamentali per il corretto salvataggio dei righi
      CDS.Edit;
      CDS.FieldByName('TIPODOCUMENTO').Value := 'Conformita';
      CDS.FieldByName('REGISTRO').Value := 'C';
      CDS.FieldByName('NUMORDPREV').Value := DM1.TableConformitaCODICE.Value;
      CDS.FieldByName('DATADOCUMENTO').Value := DM1.TableConformitaDATA.Value;
      CDS.FieldByName('PROGRIGO2').Value := -1; // NB: PROGRIGO rimane com'è
      CDS.FieldByName('CODICECONF').Value := DM1.TableConformitaCODICE.Value;
      CDS.FieldByName('DATACONF').Value := DM1.TableConformitaDATA.Value;
      CDS.FieldByName('PROGRIGOCONF').Value := i;
      // Ricava l'oggetto del disegno relativo al record attuale
      // e lo aggiorna con alcuni dati presi dal disegno
      // NB: Solo se il record corrente ha il campo Riferimento valido e
      // che non comincia con X
      CurrRif := CDS.FieldByName('S3RIF').AsString;
      if (CurrRif <> '') and (LeftStr(CurrRif, 1) <> 'X') then
      begin
        PO := P.PuzzleObjectByRif(CurrRif);
        // Ovviamente prosegue solo se PO è <> da nil (lo è quando non ha trovato alcun oggetto del puzzle con il Rif.)
        if PO <> nil then
        begin
          CDS.FieldByName('S3X').Value := PO.X;
          CDS.FieldByName('S3Y').Value := PO.Y;
          CDS.FieldByName('S3ROTATION').Value := Ord(PO.Rotation);
          if PO is TTubePuzzleObject then
          begin
            CDS.FieldByName('S3ENTRYPOINT').Value := Ord((PO as TTubePuzzleObject).EntryPoint);
            CDS.FieldByName('S3EXITPOINT').Value := Ord((PO as TTubePuzzleObject).ExitPoint);
          end;
          if PO is TTextPuzzleObject then
          begin
            CDS.FieldByName('DESCRIZIONE').Value := (PO as TTextPuzzleObject).Text;
          end;
        end;
        // Effettua il post del record attuale
        CDS.Post;
      end;
      // Avanti il prossimo
      CDS.Next;
      Inc(i);
    end;
  finally
    // Riabilita i controlli
    CDS.EnableControls;
  end;
end;

// Procedura che aggiorna il record relativo all'oggetto ricevuto come parametro e nel Dataset
// anchesso ricevuto come parametro.
procedure TConformitaForm.AggiornaRecordOggetto(PO: TPuzzleObject; CDS: TIBOQuery);
begin
  // Aggiorna il record
  CDS.FieldByName('S3RIF').Value := PO.Riferimento;
  CDS.FieldByName('RIFLETTER').Value := PO.RifLetter;
  CDS.FieldByName('TIPO').Value := PO.Tipo;
  CDS.FieldByName('BITMAPFILENAME').Value := ExtractFileName(PO.BitmapFileName);
  CDS.FieldByName('S3COMPONENTE').Value := PO.ObjectName;
  CDS.FieldByName('S3MATERIALEAPPARECCHIO').Value := PO.MaterialeApparecchio;
  CDS.FieldByName('S3X').Value := PO.X;
  CDS.FieldByName('S3Y').Value := PO.Y;
  CDS.FieldByName('S3ROTATION').Value := Ord(PO.Rotation);
  if PO is TTubePuzzleObject then
  begin
    CDS.FieldByName('BITMAPFILENAME2').Value := ExtractFileName((PO as TTubePuzzleObject).BitmapFileName2);
    CDS.FieldByName('S3ENTRYPOINT').Value := Ord((PO as TTubePuzzleObject).EntryPoint);
    CDS.FieldByName('S3EXITPOINT').Value := Ord((PO as TTubePuzzleObject).ExitPoint);
  end;
end;

// Verifica se un componente con la stesa descrizione ricevuta è presente nell'elenco dei Materiali/Apparecchi.
function TConformitaForm.MatAppPresent(DescArt: String): Boolean;
var
  Q: TIB_Cursor;
begin
  Result := False;
  try
    Q := TIB_Cursor.Create(Self);
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT COUNT(*) AS QUANTI FROM APPARECCHI WHERE DESCRIZIONE = ''' + DescArt + '''');
    Q.Open;
    Result := (Q.Fields[0].AsInteger > 0);
  finally
    Q.Free;
  end;
end;

// Questa funzione ritorna un RIferimento provvisorio da memorizzare nel
// campo S3RIF del rigo attuale. Tale codice inizia con 'X' che e sta ad indicare
// che il rigo attuale è presente negli elenchi dei materiali/Apparecchi ma
// non nel disegno.
function TConformitaForm.CalcolaNuovoRiferimentoProvvisorio(DescArt: String): String;
begin
  // Inizializzazione
  Result := 'NULL';
  // Verifica se esiste nell'elenco dei Materiali/Appareddhi il componente attuale
  // e se non c'è imposta il valore di ritorno a NULL così non viene assegnato alcun riferimento
  // in quanto l'oggetto non è visualizzabile sul disegno visto che non c'è il relativo simbolo
  if not MatAppPresent(DescArt) then
    Exit;
  // Altrimenti continua con l'assegnazione di un riferimento provvisorio
  Inc(MaxRifProv);
  Result := 'X' + IntToStr(MaxRifProv);
end;

// Questa funzione ritorna il prossimo riferimento valido con la lettera
// ricevuta come parametro.
function TConformitaForm.CalcolaNuovoRiferimento(PO: TPuzzleObject): String;
var
  MaxValue: Integer;
  i: Integer;
  CurrentPuzzleLayer: TPuzzleLayer;
  CurrentPuzzleObject: TPuzzleObject;
  Prefisso: String;
  P: TPuzzle;
begin
  // Inizializzazione
  Result := '';
  MaxValue := 0;
  // P Punta al TPuzzle al quale il PuzzleObject appartiene
  P := (PO.Owner as TPuzzleLayer).Owner as TPuzzle;
  // Prefisso contiene la parte iniziale del riferimento prima del numero progressivo
  // che ci interessa controllare per ogni oggetto allo scopo di trovare il valore maggiore
  // assegnato finora. Faccio così perchè negli elementi successivi al primo facenti parte di
  // un oggetto composto da più elementi (tubi), il prefisso diventa uguale al riferimento
  // completo del MAsterObject a cui viene aggiunto un ulteriore numero progressivo per
  // mantenere la sequenza corretta degli elementi che compongono l'oggetto.
  if PO.MasterObject = nil then
    Prefisso := PO.RifLetter
  else
    Prefisso := PO.MasterObject.Riferimento + '.';
  // Tira fuori il layer dei materiali e apparecchi, per comodità
  // Oppure il layer dei Muri se sta tracciando un Muro.
  if PO.RifLetter = 'W' then
    CurrentPuzzleLayer := P.FindComponent('LayerMuri') as TPuzzleLayer
  else
    CurrentPuzzleLayer := P.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
  // Cicla per tutti gli oggetti del layer identificando quelli che hanno la stessa RifLetter
  // in modo da trovare il valore maggiore
  for i := 0 to CurrentPuzzleLayer.ComponentCount - 1 do
  begin
    // La variabile punta all'oggetto correntemente in analisi per comodità
    CurrentPuzzleObject := CurrentPuzzleLayer.Components[i] as TPuzzleObject;
    // Se la parte più a sx del riferimento dell'oggetto corrente è uguale al contenuto
    // del "Prefisso"...
    if (LeftStr(CurrentPuzzleObject.Riferimento, Length(Prefisso)) = Prefisso) and (Pos('.', CurrentPuzzleObject.Riferimento) = Pos('.', Prefisso)) then
    begin
      // MaxValue contiene il maggior numero progressivo per lo stesso prefisso trovato fino ad ora.
      MaxValue := Max(MaxValue, StrToInt(Copy(CurrentPuzzleObject.Riferimento, Length(Prefisso) + 1, 100)));
    end;
  end;
  // Aggiunge 1 al maggior valore trovato e lo ritorna come risultato
  // NB: Se si tratta di un ogetto Master calcola il nuovo progressivo senza aggiungere
  // gli zeri iniziali per allineare il numero a 3 cifre, l'allineamento a 3 cifre lo uso solo
  // per il sottoprogressivo solo degli oggetti slave come nel caso dei tubi o dei muri.
  if PO.MasterObject = nil then
    Result := Prefisso + IntToStr(MaxValue + 1)
  else
    Result := Prefisso + DM1.PadR(IntToStr(MaxValue + 1), '0', 3);
end;

procedure TConformitaForm.CaricaDatiDestinatarioRichiestaPrimaAccensione(Cod: Integer);
var
  Qry: TIBOQuery;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIBOQuery.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add('SELECT RagioneSociale, Indirizzo, Citta, CAP, Provincia');
    Qry.SQL.Add('FROM Clienti');
    Qry.SQL.Add('WHERE Codice = ' + IntToStr(Cod));
    Qry.Open;
    if not Qry.Eof then
    begin
      PrimAccRagSoc.Caption := Qry.FieldByName('RagioneSociale').AsString;
      PrimAccIndirizzo.Caption := Qry.FieldByName('Indirizzo').AsString;
      PrimAccCAP.Caption := Qry.FieldByName('CAP').AsString;
      PrimAccCitta.Caption := Qry.FieldByName('Citta').AsString;
      PrimAccProvincia.Caption := Qry.FieldByName('Provincia').AsString;
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

procedure TConformitaForm.InserisciNuovoRigo(CodArt, StmCodArt: String; Qta: Double; InsertRigo: Boolean);
var
  Y: Integer;
  Qry: TIBOQuery;
  DC: TcxCustomDataController;
begin
  // Inizializzazione
  DC := tvRT.DataController;
  // Verifica dei parametri ricevuti
  if CodArt = '' then
    raise Exception.Create('Codice articolo non valido.');
  // Crea l'oggetto query
  Qry := TIBOQuery.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    // Imposta la query che caricherà i dati dell'articol
    Qry.SQL.Add('SELECT * FROM DOC_NUOVO_RIGO_DOCUMENTO(:P_MAINCODART, :P_STMCODART)');
    // Imposta i parametri della query
    Qry.Prepare;
    Qry.Params.ParamByName('P_MAINCODART').AsString := CodArt;
    if StmCodArt <> '' then
      Qry.Params.ParamByName('P_STMCODART').AsString := StmCodArt;
    // Apre la query
    Qry.Open;
    // Ovviamente se non trova l'articolo l'operazione non può continuare
    if Qry.Eof then
      raise Exception.Create('Codice articolo non trovato!');

    // Aggiunge o appende un rigo alla griglia
    if InsertRigo then
    begin
      Y := DC.InsertRecord(DC.FocusedRecordIndex);
    end
    else
    begin
      Y := DC.AppendRecord;
    end;

    // Inserisce nel rigo nuovo i dati dell'articolo
    DC.Values[Y, tvRTDescrizione.Index] := Qry.FieldByName('Descrizione').AsString;
    DC.Values[Y, tvRTMarca.Index] := Qry.FieldByName('Marca').AsString;
    DC.Values[Y, tvRTUM.Index] := Qry.FieldByName('UnitaDiMisura').AsString;
    DC.Values[Y, tvRTQta.Index] := FloatToStr(Qta);
    DC.Values[Y, tvRTPotenza.Index] := Qry.FieldByName('Potenza').AsString;
    DC.Values[Y, tvRTCertificazione.Index] := Qry.FieldByName('Certificazione').AsString;
    DC.Values[Y, tvRTInstallato.Index] := Qry.FieldByName('Installato').AsString;
    DC.Values[Y, tvRTInstallabile.Index] := Qry.FieldByName('Installabile').AsString;
    DC.Values[Y, tvRTVentilazione.Index] := Qry.FieldByName('SistVentilazione').AsString;
    DC.Values[Y, tvRTScComb.Index] := Qry.FieldByName('SistScaricoComb').AsString;
    DC.Values[Y, tvRTCooElett.Index] := Qry.FieldByName('SistCollegElettrico').AsString;
    DC.Values[Y, tvRTDichEnteGas.Index] := Qry.FieldByName('DichGasTipo').AsString;
    DC.Values[Y, tvRTNote.Index] := Qry.FieldByName('DichGasNote').AsString;
    DC.Values[Y, tvRTCodice.Index] := Qry.FieldByName('CodiceArticoloStm').AsString;
    // Chiude la query
    Qry.Close;

  finally
    // Distrugge l0oggetto query
    Qry.Free;
  end;
end;

procedure TConformitaForm.CaricaRighiConformita(CodiceConf: Longint; DataConf: TDate);
var
  Qry: TIB_Cursor;
  Y: Integer;
  LO: TMemIniFile;
  DC: TcxCustomDataController;
begin
  // Crea l'oggetto query e lo imposta in modo che estragga i righi da importare
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add
      ('SELECT CodiceArticolo, Descrizione, UM, Qta, Marca, Certificazione, Potenza, Installato, Installabile, SistVentilazione, SistScaricoComb, SistCollegElettrico, SerNum, DichGasTipo, Note, ProgRigo');
    Qry.SQL.Add('FROM RighiConf');
    Qry.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(CodiceConf));
    Qry.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataConf) + '''');
    Qry.SQL.Add('ORDER BY PROGRIGO');
    Qry.Open;
    // Prima di procedere con il caricamento controlla che i righi del documento posseggano il PROGRIGO necessario per
    // il corretto ordinamento e se non è presente annulla la query precedente e la rifà senza
    // ORDER BY in quanto si tratta di un documento fatto con una versione dove ancora non c'era il PROGRIGO, altrimenti lasciando
    // tale istruzione scazzerebbe l'ordinamento stesso.
    if (Qry.FieldByName('PROGRIGO').IsNull) or (Qry.FieldByName('PROGRIGO').AsInteger = 0) then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add
        ('SELECT CodiceArticolo, Descrizione, UM, Qta, Marca, Certificazione, Potenza, Installato, Installabile, SistVentilazione, SistScaricoComb, SistCollegElettrico, SerNum, DichGasTipo, Note');
      Qry.SQL.Add('FROM RighiConf');
      Qry.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(CodiceConf));
      Qry.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataConf) + '''');
      Qry.Open;
      Qry.First;
    end;

    // DC punta al DataController per comodità
    DC := tvRT.DataController;
    // Cicla per tutti i righi trovati e li carica nella griglia
    DC.RecordCount := 0;
    while not Qry.Eof do
    begin
      Y := DC.AppendRecord;
      DC.Values[Y, tvRTDescrizione.Index] := Qry.FieldByName('Descrizione').AsString;
      DC.Values[Y, tvRTMarca.Index] := Qry.FieldByName('Marca').AsString;
      DC.Values[Y, tvRTUM.Index] := Qry.FieldByName('UM').AsString;
      DC.Values[Y, tvRTQta.Index] := Qry.FieldByName('QTA').AsFloat;
      DC.Values[Y, tvRTPotenza.Index] := Qry.FieldByName('Potenza').AsString;
      DC.Values[Y, tvRTCertificazione.Index] := Qry.FieldByName('Certificazione').AsString;
      DC.Values[Y, tvRTInstallato.Index] := Qry.FieldByName('Installato').AsString;
      DC.Values[Y, tvRTInstallabile.Index] := Qry.FieldByName('Installabile').AsString;
      DC.Values[Y, tvRTVentilazione.Index] := Qry.FieldByName('SistVentilazione').AsString;
      DC.Values[Y, tvRTScComb.Index] := Qry.FieldByName('SistScaricoComb').AsString;
      DC.Values[Y, tvRTCooElett.Index] := Qry.FieldByName('SistCollegElettrico').AsString;
      DC.Values[Y, tvRTNumSerie.Index] := Qry.FieldByName('SerNum').AsString;
      DC.Values[Y, tvRTDichEnteGas.Index] := Qry.FieldByName('DichGasTipo').AsString;
      DC.Values[Y, tvRTNote.Index] := Qry.FieldByName('Note').AsString;
      DC.Values[Y, tvRTCodice.Index] := Qry.FieldByName('CodiceArticolo').AsString;
      // Avanti il prossimo
      Qry.Next;
    end;

    // Provvede a caricare i check box dell'autodichiaazione dei requisiti tecnico professionali
    LO := TMemIniFile.Create(DM1.UserAppDataLevanteDir + 'Conformita.ini');
    CheckBoxA.Checked := LO.ReadBool('AUTODICHIARAZIONE', 'PuntoA', False);
    CheckBoxB.Checked := LO.ReadBool('AUTODICHIARAZIONE', 'PuntoB', False);
    CheckBoxC.Checked := LO.ReadBool('AUTODICHIARAZIONE', 'PuntoC', False);
    CheckBoxD.Checked := LO.ReadBool('AUTODICHIARAZIONE', 'PuntoD', False);
    CheckBoxE.Checked := LO.ReadBool('AUTODICHIARAZIONE', 'PuntoE', False);
    CheckBoxF.Checked := LO.ReadBool('AUTODICHIARAZIONE', 'PuntoF', False);
    CheckBoxG.Checked := LO.ReadBool('AUTODICHIARAZIONE', 'PuntoG', False);
    LO.Free;
  finally
    // Sistrugge l0oggetto query
    Qry.Free;
  end;
end;

procedure TConformitaForm.SalvaRighiAccorpatiInUnUnicoRigo(CodiceConf: Longint; DataConf: TDate; ProgRigo: Longint; DC: TcxCustomDataController);
var
  TotQTA: Real;
  i: Integer;
  Qry: TIBOQuery;
begin
  TotQTA := 0;
  // Crea l'oggetto Qry
  Qry := TIBOQuery.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try

    // Calcola il totale dei prezzi unitario e delle QTA di tutti i righi uguali al primo
    // elimina anche i righi che così vengono riepiogati
    // Cicla per tutti i righi (tranne il primo che fà da riferimento)
    i := 1;
    while i < (DC.RecordCount - 1) do
    begin
      if (DC.Values[i, tvRTDescrizione.Index] = DC.Values[0, tvRTDescrizione.Index]) and (DC.Values[i, tvRTMarca.Index] = DC.Values[0, tvRTMarca.Index]) and
        (DC.Values[i, tvRTUM.Index] = DC.Values[0, tvRTUM.Index]) and (DC.Values[i, tvRTPotenza.Index] = DC.Values[0, tvRTPotenza.Index]) and
        (DC.Values[i, tvRTCertificazione.Index] = DC.Values[0, tvRTCertificazione.Index]) and
        (DC.Values[i, tvRTInstallato.Index] = DC.Values[0, tvRTInstallato.Index]) and
        (DC.Values[i, tvRTInstallabile.Index] = DC.Values[0, tvRTInstallabile.Index]) and
        (DC.Values[i, tvRTVentilazione.Index] = DC.Values[0, tvRTVentilazione.Index]) and (DC.Values[i, tvRTScComb.Index] = DC.Values[0, tvRTScComb.Index]) and
        (DC.Values[i, tvRTCooElett.Index] = DC.Values[0, tvRTCooElett.Index]) and (DC.Values[i, tvRTNumSerie.Index] = DC.Values[0, tvRTNumSerie.Index]) and
        (DC.Values[i, tvRTDichEnteGas.Index] = DC.Values[0, tvRTDichEnteGas.Index]) and (DC.Values[i, tvRTNote.Index] = DC.Values[0, tvRTNote.Index]) and
        (DC.Values[i, tvRTCodice.Index] = DC.Values[0, tvRTCodice.Index]) then
      begin
        TotQTA := TotQTA + DM1.NoNullFloatValue(DC, i, tvRTQta.Index);
        DC.DeleteRecord(i); // Elimina il rigo
        dec(i); // Decrementa 'i' per compensare l'eliminazione del rigo
      end;
      Inc(i); // Passa al prossimo rigo
    end;

    // Aggiunge a TotQTA anche la Qta del primo rigo
    TotQTA := TotQTA + DM1.NoNullFloatValue(DC, 0, tvRTQta.Index);

    // Controlla che i checkbox non contengano valori nulli ed eventualmente li defaultizza a disabilitati
    if VarIsNull(DC.Values[0, tvRTInstallato.Index]) or (DC.Values[0, tvRTInstallato.Index] <> '1') then
      DC.Values[0, tvRTInstallato.Index] := '0';
    if VarIsNull(DC.Values[0, tvRTInstallabile.Index]) or (DC.Values[0, tvRTInstallabile.Index] <> '1') then
      DC.Values[0, tvRTInstallabile.Index] := '0';
    if VarIsNull(DC.Values[0, tvRTVentilazione.Index]) or (DC.Values[0, tvRTVentilazione.Index] <> '1') then
      DC.Values[0, tvRTVentilazione.Index] := '0';
    if VarIsNull(DC.Values[0, tvRTScComb.Index]) or (DC.Values[0, tvRTScComb.Index] <> '1') then
      DC.Values[0, tvRTScComb.Index] := '0';
    if VarIsNull(DC.Values[0, tvRTCooElett.Index]) or (DC.Values[0, tvRTCooElett.Index] <> '1') then
      DC.Values[0, tvRTCooElett.Index] := '0';

    // Salva un rigo unico riepilogativo di tutti i righi che soddisfacevano la condizione con la somma delle loro QTA
    // Salva il rigo attuale
    // NB: Non posso usare la funzione Salva Rifo perchè la QTA è calcolata e non viene presa dalla griglia
    Qry.SQL.Clear;
    Qry.SQL.Add('insert into righiconf (CodiceDichiarazione, DataDichiarazione, ProgRigo, CodiceArticolo, Descrizione,');
    Qry.SQL.Add
      ('UM, Qta, Marca, Certificazione, Potenza, Installato, Installabile, SistVentilazione, SistScaricoComb, SistCollegElettrico, SerNum, DichGasTipo, Sinchro, Note)');
    Qry.SQL.Add('values (');
    Qry.SQL.Add(IntToStr(CodiceConf) + ',');
    Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DataConf) + ''',');
    Qry.SQL.Add(IntToStr(ProgRigo) + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTCodice.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTDescrizione.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTUM.Index], '''') + ',');
    Qry.SQL.Add(DM1.VirgolaPunto(TotQTA) + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTMarca.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTCertificazione.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTPotenza.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.Values[0, tvRTInstallato.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.Values[0, tvRTInstallabile.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.Values[0, tvRTVentilazione.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.Values[0, tvRTScComb.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.Values[0, tvRTCooElett.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTNumSerie.Index], '''') + ',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTDichEnteGas.Index], '''') + ',');
    Qry.SQL.Add('''' + RECORD_MODIFIED + ''',');
    Qry.SQL.Add(AnsiQuotedStr(DC.DisplayTexts[0, tvRTNote.Index], ''''));
    Qry.SQL.Add(')');
    // Qry.SQL.SaveToFile('c:\sql.sql');
    Qry.ExecSQL;

    // Aggiorna l'anagrafica dell'articolo con i dati relativi alla dichiarazione di conformità
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE ARTICOLI SET');
    Qry.SQL.Add('ABILITACONFORMITA = ''T'',');
    Qry.SQL.Add('POTENZA = ' + AnsiQuotedStr(DC.DisplayTexts[0, tvRTPotenza.Index], '''') + ',');
    Qry.SQL.Add('CERTIFICAZIONE = ' + AnsiQuotedStr(DC.DisplayTexts[0, tvRTCertificazione.Index], '''') + ',');
    Qry.SQL.Add('INSTALLATO = ''' + DC.Values[0, tvRTInstallato.Index] + ''',');
    Qry.SQL.Add('INSTALLABILE = ''' + DC.Values[0, tvRTInstallabile.Index] + ''',');
    Qry.SQL.Add('SISTVENTILAZIONE = ''' + DC.Values[0, tvRTVentilazione.Index] + ''',');
    Qry.SQL.Add('SISTSCARICOCOMB = ''' + DC.Values[0, tvRTScComb.Index] + ''',');
    Qry.SQL.Add('SISTCOLLEGELETTRICO = ''' + DC.Values[0, tvRTCooElett.Index] + ''',');
    Qry.SQL.Add('DICHGASTIPO = ' + AnsiQuotedStr(DC.DisplayTexts[0, tvRTDichEnteGas.Index], '''') + ',');
    Qry.SQL.Add('DICHGASNOTE = ' + AnsiQuotedStr(DC.DisplayTexts[0, tvRTNote.Index], ''''));
    Qry.SQL.Add('WHERE CODICEARTICOLO = ' + AnsiQuotedStr(DC.DisplayTexts[0, tvRTCodice.Index], ''''));
    Qry.ExecSQL;

    // Elimina anche il primo rigo
    DC.DeleteRecord(0);

  finally
    // Distrugge Qry
    Qry.Free;
  end;
end;

procedure TConformitaForm.SalvaRighiConformita(CodiceConf: Longint; DataConf: TDate);
var
  Qry: TIBOQuery;
  ProgRigo: Integer;
  LO: TRepositoryIniFile;
  DC: TcxCustomDataController;
begin
  // Inizializzazione
  ProgRigo := 0;
  // Crea l'oggetto Qry
  Qry := TIBOQuery.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    // Prima di tutto Elimina i vecchi righi della conformità per poi aggiornarli con quelli nuovi modificati/aggiunti
    Qry.SQL.Add('delete from righiconf');
    Qry.SQL.Add('where CodiceDichiarazione = ' + IntToStr(CodiceConf));
    Qry.SQL.Add('  and DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataConf) + '''');
    Qry.ExecSQL;

    // Cicla per tutti i righi dell'elenco del materiale e salva i righi accorpando quelli identici (tranne ovviamente la Qtà)
    DC := tvRT.DataController;
    // Cicla finchè vi sono righi da salvare
    while DC.RecordCount > 0 do
    begin
      // Incrementa il progressivo del rigo
      Inc(ProgRigo);
      // Richiama la procedura che salva il rigo corrente insieme a tutti gli altri righi che hanno lo stesso
      // codice articolo, PrezzoUnitario, Sconti 1,2 e 3 e COdice IVA accorpandoli in un unico rigo.
      SalvaRighiAccorpatiInUnUnicoRigo(CodiceConf, DataConf, ProgRigo, DC);
    end;

    // Provvede a salvare il contenuto dei check box dell'autodichiaazione dei requisiti tecnico professionali
    LO := TRepositoryIniFile.Create(DM1.UserAppDataLevanteDir + 'Conformita.ini', DM1.DBGenerale);
    try
      LO.WriteBool('AUTODICHIARAZIONE', 'PuntoA', CheckBoxA.Checked);
      LO.WriteBool('AUTODICHIARAZIONE', 'PuntoB', CheckBoxB.Checked);
      LO.WriteBool('AUTODICHIARAZIONE', 'PuntoC', CheckBoxC.Checked);
      LO.WriteBool('AUTODICHIARAZIONE', 'PuntoD', CheckBoxD.Checked);
      LO.WriteBool('AUTODICHIARAZIONE', 'PuntoE', CheckBoxE.Checked);
      LO.WriteBool('AUTODICHIARAZIONE', 'PuntoF', CheckBoxF.Checked);
      LO.WriteBool('AUTODICHIARAZIONE', 'PuntoG', CheckBoxG.Checked);
      LO.UpdateFile;
    finally
      LO.Free;
    end;
    // Ricarica i righi del documento per aggiornare lo schermo che altrimenti appare vuoto in quanto i righi sono
    // stati eliminati durante l'operazione di salvataggio con accorpamento.
    CaricaRighiConformita(CodiceConf, DataConf);
  finally
    // Distrugge l'oggetto query
    Qry.Free;
  end;
end;

procedure TConformitaForm.AggiungiRiferimentoDocumento(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate);
var
  Rif: String;
  Year, Month, Day: Word;
begin
  // Questa funzione aggiunge il riferimento al documento Ovviamente solo se non è già inserito
  // ------------------------------------------------------------------------------------------
  // Decodifica la data in modo da forzare la scrittura delle sole ultime due cifre dell'anno indipententemente dalle impostazioni di windows
  DecodeDate(DataDoc, Year, Month, Day);
  // Carica il valore dell'anno nella variabile per comodità
  Rif := IntToStr(Year);
  // Costruisce il testo del riferimento in questa variabile
  Rif := TipoDoc + ' ' + IntToStr(NumDoc) + Registro + ' ' + DM1.PadR(IntToStr(Day), '0', 2) + '/' + DM1.PadR(IntToStr(Month), '0', 2) + '/' +
    DM1.StrRight(Rif, 2) + '; ';
  // Se il riferimento non è già inserito nel campo lo iserisce, altrimenti niente.
  if Pos(Rif, DM1.TableConformitaRifDocumFiscale.AsString) = 0 then
    DM1.TableConformitaRifDocumFiscale.Value := DM1.TableConformitaRifDocumFiscale.AsString + Rif;
end;

procedure TConformitaForm.ImportaDocumento(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate);
var
  Qry, Qry2: TIB_Cursor;
  Y: Integer;
  DC: TcxCustomDataController;
begin
  // Inizializzazione
  DC := tvRT.DataController;
  // Crea l'oggetto query e lo imposta in modo che estragga i righi da importare
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.GenDBFile;
  Qry.IB_Connection := DM1.DBGenerale;
  // Crea l'otteggo Qry2 e lo imposta in modo da prelevare dall'archivio articoli i dati che sono
  // mancanti nell'archivio TmpRighi
  Qry2 := TIB_Cursor.Create(Self);
  Qry2.DatabaseName := DM1.ArcDBFile;
  Qry2.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add('SELECT CodiceArticolo, Descrizione, QTA, UnitaDiMisura FROM TmpRighi');
    Qry.SQL.Add('WHERE TipoDocumento = ''' + TipoDoc + '''');
    Qry.SQL.Add('  AND Registro = ''' + Registro + '''');
    Qry.SQL.Add('  AND NumOrdPrev = ' + IntToStr(NumDoc));
    Qry.SQL.Add('  AND DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Qry.Open;
    // Cicla fino alla fine dei righi trovati e li importa nella grid
    while not Qry.Eof do
    begin
      // Ovviamente salta i righi di riferimento ai documenti di provenienza dei righi
      if (DM1.StrLeft(Qry.FieldByName('DESCRIZIONE').AsString, 4) <> '--->') and (Trim(Qry.FieldByName('DESCRIZIONE').AsString) <> '') then
      begin
        // Se il codice Articolo è valido richiama dall'archivio articoli l'articolo che si stà elaborando per prelevare
        // alcuni dati per la certificazione di conformità che non sono presenti in TmpRighi
        if (not Qry.FieldByName('CodiceArticolo').IsNull) and (Trim(Qry.FieldByName('CodiceArticolo').AsString) <> '') then
        begin
          Qry2.SQL.Clear;
          Qry2.SQL.Add
            ('SELECT AbilitaConformita, Marca, Certificazione, Potenza, Installato, Installabile, SistVentilazione, SistScaricoComb, SistCollegElettrico, DichGasTipo, DichGasNote');
          Qry2.SQL.Add('FROM Articoli');
          Qry2.SQL.Add('WHERE CodiceArticolo = ''' + Qry.FieldByName('CodiceArticolo').AsString + '''');
          Qry2.Open;
        end;
        // Importa l'articolo (solo se l'articolo è marcato come abilitato alla dichiarazione di conformità
        if (not Qry2.Active) or (Qry2.Eof) or (Qry2.FieldByName('AbilitaConformita').AsString <> 'F') then
        begin
          Y := DC.AppendRecord;
          DC.Values[Y, tvRTDescrizione.Index] := LeftStr(Qry.FieldByName('Descrizione').AsString, 1000);
          DC.Values[Y, tvRTUM.Index] := Qry.FieldByName('UnitaDiMisura').AsString;
          DC.Values[Y, tvRTQta.Index] := Qry.FieldByName('QTA').AsFloat;
          DC.Values[Y, tvRTCodice.Index] := Qry.FieldByName('CodiceArticolo').AsString;
          DC.Values[Y, tvRTInstallato.Index] := '1';
          DC.Values[Y, tvRTInstallabile.Index] := '0';
          // Se la Qry2 ha trovato almento un articolo
          if Qry2.Active and (not Qry2.Eof) then
          begin
            DC.Values[Y, tvRTPotenza.Index] := Qry2.FieldByName('Potenza').AsString;
            DC.Values[Y, tvRTCertificazione.Index] := Qry2.FieldByName('Certificazione').AsString;
            DC.Values[Y, tvRTMarca.Index] := Qry2.FieldByName('Marca').AsString;
            DC.Values[Y, tvRTInstallato.Index] := Qry2.FieldByName('Installato').AsString;
            DC.Values[Y, tvRTInstallabile.Index] := Qry2.FieldByName('Installabile').AsString;
            DC.Values[Y, tvRTVentilazione.Index] := Qry2.FieldByName('SistVentilazione').AsString;
            DC.Values[Y, tvRTScComb.Index] := Qry2.FieldByName('SistScaricoComb').AsString;
            DC.Values[Y, tvRTCooElett.Index] := Qry2.FieldByName('SistCollegElettrico').AsString;
            DC.Values[Y, tvRTDichEnteGas.Index] := Qry2.FieldByName('DichGasTipo').AsString;
            DC.Values[Y, tvRTNote.Index] := Qry2.FieldByName('DichGasNote').AsString;
            // Altrimenti imposta i valori di default
          end
          else
          begin
            DC.Values[Y, tvRTPotenza.Index] := '';
            DC.Values[Y, tvRTCertificazione.Index] := '';
            DC.Values[Y, tvRTMarca.Index] := '';
            DC.Values[Y, tvRTInstallato.Index] := '0';
            DC.Values[Y, tvRTInstallabile.Index] := '0';
            DC.Values[Y, tvRTNumSerie.Index] := '';
            DC.Values[Y, tvRTNote.Index] := '';
            DC.Values[Y, tvRTVentilazione.Index] := '0';
            DC.Values[Y, tvRTScComb.Index] := '0';
            DC.Values[Y, tvRTCooElett.Index] := '0';
            DC.Values[Y, tvRTDichEnteGas.Index] := '';
            DC.Values[Y, tvRTNote.Index] := '';
          end;
        end;
      end;
      Qry2.Close;
      Qry.Next;
    end;
    // INserisce il riferimento al documento appena importato nell'apposito campo
    AggiungiRiferimentoDocumento(TipoDoc, Registro, NumDoc, DataDoc);
    // Elimina il documento appena importato
    DM1.EliminaExpDoc(TipoDoc, Registro, NumDoc, DataDoc);
  finally
    // Sistrugge l0oggetto query
    Qry.Free;
    Qry2.Free;
  end;
end;

procedure TConformitaForm.ImportaDocumentiEsportati;
var
  Capt: String;
begin
  // Cicla per tutti i documenti esportati indicati nella ListView della MainForm
  // e importa quelli selezionati nel documento attuale.
  while MainForm.ListViewExpDoc.SelCount > 0 do
  begin
    Capt := MainForm.ListViewExpDoc.Selected.Caption;
    // Se è un documento esportato ne importa i righi
    if (MainForm.ListViewExpDoc.Selected.ImageIndex = 0) or (MainForm.ListViewExpDoc.Selected.ImageIndex = 3) then
    begin
      ImportaDocumento(DM1.ExpDocToDocType(Capt), DM1.ExpDocToDocReg(Capt), DM1.ExpDocToDocNum(Capt), DM1.ExpDocToDocDate(Capt));
      // Se è un articolo esportato lo importa come articolo
    end
    else if MainForm.ListViewExpDoc.Selected.ImageIndex = 1 then
    begin
      // Inserisce l'articolo nel documento.
      ConformitaForm.InserisciNuovoRigo(DM1.ExpArtToCodice(Capt), DM1.ExpArtToCodiceStm(Capt), DM1.ExpArtToQta(Capt), False);
      // Elimina l'articolo appena importato
      DM1.EliminaExpArt(DM1.ExpArtToCodice(Capt), DM1.ExpArtToCodiceStm(Capt));
    end;
    // Elimina la voce
    MainForm.ListViewExpDoc.Selected.Delete;
  end;
  MainForm.AggiornaDocumentiEsportati;
end;

procedure TConformitaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  // Distrugge la PuzzleToolsFOrm
  Self.ClosePuzzleToolsForm;

  // Controlla che all'uscita della form non ci siano transazioni aperte, altrimenti
  // succede un casino con perdite di dati ecc.
  // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
  DM1.CheckForAlreadyInTransaction;

  // Rende invisibile la LabelTipoDocumento e il relativo pulsante
  // e ripristina la IconaDocTipo precedente
  // Prima ovviamente sblocca l'IconaDocTipo
  MainForm.BloccaIconaDocTipo(False, Name);
  MainForm.RipristinaIconaDocTipo;
end;

procedure TConformitaForm.FormCreate(Sender: TObject);
begin
  // Inizializzazione
  fOnShowCompletato := False;
  // IMposta i settaggi di visualizzazione della form
  MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina,
    RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
  // Colore normale (non modifica) nei campi
  DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
  // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
  Caption := MainForm.NomeApplicazione + ' - (Dichiarazione di conformità)';
  // IMposta la posizione della client area e i relativi margini
  MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
  ClientArea.ParentColor := True;
  // Calcola la dimensione massima del pannello del corpo della lettera
  // PanelCorpo.Height    := ClientArea.Height - PanelCorpo.Top - 3;
  // FinalLineCorpo.Top   := PanelCorpo.Height - 2;
  cxPageControl1.Left := -1;
  cxPageControl1.Top := 0;
  // cxPageControl1.Width   := PanelCorpo.Width + 3;
  // cxPageControl1.Height  := PanelCorpo.Height;
  ScrollBoxDichiarazione.Height := TabDichiarazione.Height;
  ScrollBoxAutodichiarazione.Height := TabDichiarazione.Height;
  // Carica l'icona del tipo documento visualizzato
  // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
  MainForm.SalvaIconaDocTipo;
  MainForm.CaricaIconaDocTipo(Self.Name);
  // Blocca l'aggiornamento dell'IconaDocTipo
  MainForm.BloccaIconaDocTipo(True, Self.Name);
  // Defaultizza il flag che indica se la dichiarazione attuale è un modello oppure no
  Self.IsDocModel := False;
  // Defaultizza il riferimento all'eventuale MOdello
  Self.CodiceModello := 0;
  Self.CodiceConformitaSorgente := 0;

  // Imposta le sezioni dei Puzzle
  Puzzle1.Sezione := 'GAS';
  PuzzleTermo.Sezione := 'TERMO';
  PuzzleIdro.Sezione := 'IDRO';
end;

procedure TConformitaForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    // ESC
    27:
      begin
        if Assigned(RxSpeedButtonUscita.OnClick) and RxSpeedButtonUscita.Enabled then
        begin
          RxSpeedButtonUscita.OnClick(RxSpeedButtonUscita);
        end;
      end;

    // F1 = Help
    112:
      begin
        if Assigned(RxSpeedButtonHelp.OnClick) and RxSpeedButtonHelp.Enabled then
        begin
          RxSpeedButtonHelp.OnClick(RxSpeedButtonHelp);
        end;
      end;

    // F2 = Modifica
    113:
      begin
        if Assigned(RxSpeedModifica.OnClick) and RxSpeedModifica.Enabled then
        begin
          RxSpeedModifica.Down := not RxSpeedModifica.Down;
          RxSpeedModifica.OnClick(RxSpeedModifica);
        end;
      end;

    // F3 = Nuovo
    114:
      begin
        if Assigned(RxSpeedButtonNuovo.OnClick) and RxSpeedButtonNuovo.Enabled then
        begin
          RxSpeedButtonNuovo.OnClick(RxSpeedButtonNuovo);
        end;
      end;

    // F4 = Elimina
    115:
      begin
        if Assigned(RxSpeedButtonNuovo.OnClick) and RxSpeedButtonElimina.Enabled then
        begin
          RxSpeedButtonElimina.OnClick(RxSpeedButtonElimina);
        end;
      end;

    // F5 = Trova
    116:
      begin
        if Assigned(RxSpeedButtonTrova.OnClick) and RxSpeedButtonTrova.Enabled then
        begin
          RxSpeedButtonTrova.OnClick(RxSpeedButtonTrova);
        end;
      end;

    // F6 = No filtri
    117:
      begin
        if Assigned(RxSpeedButtonResetQuery.OnClick) and RxSpeedButtonResetQuery.Enabled then
        begin
          RxSpeedButtonResetQuery.OnClick(RxSpeedButtonResetQuery);
        end;
      end;

    // F7 = Stampa
    118:
      begin
        if Assigned(RxSpeedButtonStampa.OnClick) and RxSpeedButtonStampa.Enabled then
        begin
          RxSpeedButtonStampa.OnClick(RxSpeedButtonStampa);
        end;
      end;

    // F8 = Fax
    119:
      begin
        if Assigned(RxSpeedButtonFax.OnClick) and RxSpeedButtonFax.Enabled then
        begin
          RxSpeedButtonFax.OnClick(RxSpeedButtonFax);
        end;
      end;

    // F9 = Email
    120:
      begin
        if Assigned(RxSpeedButtonMail.OnClick) and RxSpeedButtonMail.Enabled then
        begin
          RxSpeedButtonMail.OnClick(RxSpeedButtonMail);
        end;
      end;

    // F10 = Visualizza
    121:
      begin
        if Assigned(RxSpeedButtonVisualizza.OnClick) and RxSpeedButtonVisualizza.Enabled then
        begin
          RxSpeedButtonVisualizza.OnClick(RxSpeedButtonVisualizza);
        end;
      end;
  end;
end;

// Ritorna il prossimo PROGRIGO da utilizzare
function TConformitaForm.GetNextProgRigo: Integer;
begin
  Inc(MaxProgRigo, 1);
  Result := MaxProgRigo;
end;

// Ricava il PROGRIGO più alto usato finora in questo documento
function TConformitaForm.GetMaxProgRigo: Integer;
var
  Q: TIB_Cursor;
begin
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT MAX(PROGRIGO) AS MAXPROGRIGO FROM RIGHIPRV');
    Q.SQL.Add('WHERE CODICECONF = :P_CODICECONF');
    Q.SQL.Add(' AND DATACONF = :P_DATACONF');
    Q.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
    Q.ParamByName('P_DATACONF').AsDateTime := DataConformita;
    Q.Open;
    Result := Q.Fields[0].AsInteger;
  finally
    Q.Free;
  end;
end;

procedure TConformitaForm.ImportaDatiPratica;
var
  Q: TIB_Cursor;
begin
  Q := TIB_Cursor.Create(nil);
  try
    DM1.TableConformitaPRATICA.Value := StrToInt(CodicePratica);
    DM1.TableConformitaDATAPRATICA1.Value := StrToDate(DataPratica);
    // Imposta la query che preleva i dati della pratica
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT CLIENTE, RAGSOCCLI, INDIRIZZOCLI, CAPCLI, CITTACLI, PROVINCIACLI,');
    Q.SQL.Add(
      ' COMMITCODICE, COMMITDENOMINAZIONE, COMMITINDIRIZZO, COMMITNUMCIVICO, COMMITSCALA, COMMITPIANO, COMMITINTERNO, COMMITCAP, COMMITLOCALITA, COMMITPROVINCIA, COMMITTELEFONO, COMMITPIVA, COMMITCODICEFISCALE,');
    Q.SQL.Add(
      ' PROPCODICE, PROPDENOMINAZIONE, PROPINDIRIZZO, PROPNUMCIVICO, PROPSCALA, PROPPIANO, PROPINTERNO, PROPCAP, PROPLOCALITA, PROPPROVINCIA, PROPTELEFONO, PROPPIVA, PROPCODICEFISCALE,');
    Q.SQL.Add(' IMMOBCODICE, IMMOBINDIRIZZO, IMMOBNUMCIVICO, IMMOBSCALA, IMMOBPIANO, IMMOBINTERNO, IMMOBCAP, IMMOBLOCALITA, IMMOBPROVINCIA,');
    Q.SQL.Add(' SOCGASCODICE');
    Q.SQL.Add('FROM PRATICHE');
    Q.SQL.Add('WHERE CODICE = ' + CodicePratica + ' AND DATAAPERTURA = ''' + FormatDateTime('MM/DD/YYYY', StrToDate(DataPratica)) + '''');
    Q.Open;
    if Q.Eof then
      raise Exception.Create('Pratica non trovata.');
    if not Q.FieldByName('CLIENTE').IsNull then
      DM1.TableConformitaCLIENTE.Value := Q.FieldByName('CLIENTE').Value;
    if not Q.FieldByName('RAGSOCCLI').IsNull then
      DM1.TableConformitaRAGSOCCLI.Value := Q.FieldByName('RAGSOCCLI').Value;
    if not Q.FieldByName('INDIRIZZOCLI').IsNull then
      DM1.TableConformitaINDIRIZZOCLI.Value := Q.FieldByName('INDIRIZZOCLI').Value;
    if not Q.FieldByName('CAPCLI').IsNull then
      DM1.TableConformitaCAPCLI.Value := Q.FieldByName('CAPCLI').Value;
    if not Q.FieldByName('CITTACLI').IsNull then
      DM1.TableConformitaCITTACLI.Value := Q.FieldByName('CITTACLI').Value;
    if not Q.FieldByName('PROVINCIACLI').IsNull then
      DM1.TableConformitaPROVINCIACLI.Value := Q.FieldByName('PROVINCIACLI').Value;
    // Importa i dati del committente dalla pratica
    if not Q.FieldByName('COMMITCODICE').IsNull then
      DM1.TableConformitaCOMMITCODICE.Value := Q.FieldByName('COMMITCODICE').Value;
    if not Q.FieldByName('COMMITDENOMINAZIONE').IsNull then
      DM1.TableConformitaCOMMITDENOMINAZIONE.Value := Q.FieldByName('COMMITDENOMINAZIONE').Value;
    if not Q.FieldByName('COMMITINDIRIZZO').IsNull then
      DM1.TableConformitaCOMMITINDIRIZZO.Value := Q.FieldByName('COMMITINDIRIZZO').Value;
    if not Q.FieldByName('COMMITNUMCIVICO').IsNull then
      DM1.TableConformitaCOMMITNUMCIVICO.Value := Q.FieldByName('COMMITNUMCIVICO').Value;
    if not Q.FieldByName('COMMITSCALA').IsNull then
      DM1.TableConformitaCOMMITSCALA.Value := Q.FieldByName('COMMITSCALA').Value;
    if not Q.FieldByName('COMMITPIANO').IsNull then
      DM1.TableConformitaCOMMITPIANO.Value := Q.FieldByName('COMMITPIANO').Value;
    if not Q.FieldByName('COMMITINTERNO').IsNull then
      DM1.TableConformitaCOMMITINTERNO.Value := Q.FieldByName('COMMITINTERNO').Value;
    if not Q.FieldByName('COMMITCAP').IsNull then
      DM1.TableConformitaCOMMITCAP.Value := Q.FieldByName('COMMITCAP').Value;
    if not Q.FieldByName('COMMITLOCALITA').IsNull then
      DM1.TableConformitaCOMMITLOCALITA.Value := Q.FieldByName('COMMITLOCALITA').Value;
    if not Q.FieldByName('COMMITPROVINCIA').IsNull then
      DM1.TableConformitaCOMMITPROVINCIA.Value := Q.FieldByName('COMMITPROVINCIA').Value;
    if not Q.FieldByName('COMMITTELEFONO').IsNull then
      DM1.TableConformitaCOMMITTELEFONO.Value := Q.FieldByName('COMMITTELEFONO').Value;
    if not Q.FieldByName('COMMITPIVA').IsNull then
      DM1.TableConformitaCOMMITPIVA.Value := Q.FieldByName('COMMITPIVA').Value;
    if not Q.FieldByName('COMMITCODICEFISCALE').IsNull then
      DM1.TableConformitaCOMMITCODICEFISCALE.Value := Q.FieldByName('COMMITCODICEFISCALE').Value;
    // Importa i dati del IMMOBRIETARIO dalla pratica
    if not Q.FieldByName('PROPCODICE').IsNull then
      DM1.TableConformitaPROPCODICE.Value := Q.FieldByName('PROPCODICE').Value;
    if not Q.FieldByName('PROPDENOMINAZIONE').IsNull then
      DM1.TableConformitaPROPDENOMINAZIONE.Value := Q.FieldByName('PROPDENOMINAZIONE').Value;
    if not Q.FieldByName('PROPINDIRIZZO').IsNull then
      DM1.TableConformitaPROPINDIRIZZO.Value := Q.FieldByName('PROPINDIRIZZO').Value;
    if not Q.FieldByName('PROPNUMCIVICO').IsNull then
      DM1.TableConformitaPROPNUMCIVICO.Value := Q.FieldByName('PROPNUMCIVICO').Value;
    if not Q.FieldByName('PROPSCALA').IsNull then
      DM1.TableConformitaPROPSCALA.Value := Q.FieldByName('PROPSCALA').Value;
    if not Q.FieldByName('PROPPIANO').IsNull then
      DM1.TableConformitaPROPPIANO.Value := Q.FieldByName('PROPPIANO').Value;
    if not Q.FieldByName('PROPINTERNO').IsNull then
      DM1.TableConformitaPROPINTERNO.Value := Q.FieldByName('PROPINTERNO').Value;
    if not Q.FieldByName('PROPCAP').IsNull then
      DM1.TableConformitaPROPCAP.Value := Q.FieldByName('PROPCAP').Value;
    if not Q.FieldByName('PROPLOCALITA').IsNull then
      DM1.TableConformitaPROPLOCALITA.Value := Q.FieldByName('PROPLOCALITA').Value;
    if not Q.FieldByName('PROPPROVINCIA').IsNull then
      DM1.TableConformitaPROPPROVINCIA.Value := Q.FieldByName('PROPPROVINCIA').Value;
    if not Q.FieldByName('PROPTELEFONO').IsNull then
      DM1.TableConformitaPROPTELEFONO.Value := Q.FieldByName('PROPTELEFONO').Value;
    if not Q.FieldByName('PROPPIVA').IsNull then
      DM1.TableConformitaPROPPIVA.Value := Q.FieldByName('PROPPIVA').Value;
    if not Q.FieldByName('PROPCODICEFISCALE').IsNull then
      DM1.TableConformitaPROPCODICEFISCALE.Value := Q.FieldByName('PROPCODICEFISCALE').Value;
    // Importa i dati delL'IMMOBILE dalla pratica
    if not Q.FieldByName('IMMOBCODICE').IsNull then
      DM1.TableConformitaIMMOBCODICE.Value := Q.FieldByName('IMMOBCODICE').Value;
    // if not Q.FieldByName('IMMOBDENOMINAZIONE').IsNull then DM1.TableConformitaIMMOBDENOMINAZIONE.Value := Q.FieldByName('IMMOBDENOMINAZIONE').Value;
    if not Q.FieldByName('IMMOBINDIRIZZO').IsNull then
      DM1.TableConformitaVIA.Value := Q.FieldByName('IMMOBINDIRIZZO').Value;
    if not Q.FieldByName('IMMOBNUMCIVICO').IsNull then
      DM1.TableConformitaNUMERO.Value := Q.FieldByName('IMMOBNUMCIVICO').Value;
    if not Q.FieldByName('IMMOBSCALA').IsNull then
      DM1.TableConformitaSCALA.Value := Q.FieldByName('IMMOBSCALA').Value;
    if not Q.FieldByName('IMMOBPIANO').IsNull then
      DM1.TableConformitaPIANO.Value := Q.FieldByName('IMMOBPIANO').Value;
    if not Q.FieldByName('IMMOBINTERNO').IsNull then
      DM1.TableConformitaINTERNO.Value := Q.FieldByName('IMMOBINTERNO').Value;
    if not Q.FieldByName('IMMOBCAP').IsNull then
      DM1.TableConformitaCAP.Value := Q.FieldByName('IMMOBCAP').Value;
    if not Q.FieldByName('IMMOBLOCALITA').IsNull then
      DM1.TableConformitaNELCOMUNEDI.Value := Q.FieldByName('IMMOBLOCALITA').Value;
    if not Q.FieldByName('IMMOBPROVINCIA').IsNull then
      DM1.TableConformitaPROVINCIA.Value := Q.FieldByName('IMMOBPROVINCIA').Value;
    // IMporta i dati della Società Gas
    if not Q.FieldByName('SOCGASCODICE').IsNull then
      DM1.TableConformitaSOCGASCODICE.Value := Q.FieldByName('SOCGASCODICE').Value;
  finally
    Q.Free;
  end;
end;

procedure TConformitaForm.CaricaRighiApparecchiMateriali;
begin
  // Caricamento APPARECCHI
  if QryApp.Active then
    QryApp.Close;
  if not QryApp.Prepared then
    QryApp.Prepare;
  QryApp.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryApp.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryApp.Open;

  if QryTermoApp.Active then
    QryTermoApp.Close;
  if not QryTermoApp.Prepared then
    QryTermoApp.Prepare;
  QryTermoApp.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryTermoApp.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryTermoApp.Open;

  if QryIdroApp.Active then
    QryIdroApp.Close;
  if not QryIdroApp.Prepared then
    QryIdroApp.Prepare;
  QryIdroApp.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryIdroApp.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryIdroApp.Open;

  // Caricamento MATERIALI
  if QryMat.Active then
    QryMat.Close;
  if not QryMat.Prepared then
    QryMat.Prepare;
  QryMat.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryMat.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryMat.Open;

  if QryTermoMat.Active then
    QryTermoMat.Close;
  if not QryTermoMat.Prepared then
    QryTermoMat.Prepare;
  QryTermoMat.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryTermoMat.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryTermoMat.Open;

  if QryIdroMat.Active then
    QryIdroMat.Close;
  if not QryIdroMat.Prepared then
    QryIdroMat.Prepare;
  QryIdroMat.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryIdroMat.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryIdroMat.Open;

  // Imposta ed apre la query dei righi dell'elenco degli elementi "Vari" cioè
  // di quegli elementi che compongono oggetti composti da più di una casella
  // (solo gli elementi successuvu al primo).
  if QryAltri.Active then
    QryAltri.Close;
  if not QryAltri.Prepared then
    QryAltri.Prepare;
  QryAltri.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryAltri.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryAltri.Open;

  if QryTermoAltri.Active then
    QryTermoAltri.Close;
  if not QryTermoAltri.Prepared then
    QryTermoAltri.Prepare;
  QryTermoAltri.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryTermoAltri.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryTermoAltri.Open;

  if QryIdroAltri.Active then
    QryIdroAltri.Close;
  if not QryIdroAltri.Prepared then
    QryIdroAltri.Prepare;
  QryIdroAltri.ParamByName('P_CODICECONF').AsInteger := CodiceConformita;
  QryIdroAltri.ParamByName('P_DATACONF').AsDateTime := DataConformita;
  QryIdroAltri.Open;
end;

// Carica i dati per i componenti non DBAware presenti nella form
procedure TConformitaForm.CaricaDati;
begin

  if DM1.TableConformitaCOMPLETAMENTEREALIZZATODITTA.AsString = '1' then
    RBImpiantoRealizzatoDaDitta.Checked := True
  else if DM1.TableConformitaCOMPLETAMENTEREALIZZATODITTA.AsString = '0' then
    RBImpiantoNonRealizzatoDaDitta.Checked := True;

  if DM1.TableConformitaPRESENTITUTTEDICHCONFALTREDITTE.AsString = '1' then
    RBSono.Checked := True
  else if DM1.TableConformitaCOMPLETAMENTEREALIZZATODITTA.AsString = '0' then
    RBNonSono.Checked := True;

end;

// Salva i dati per i componenti non DBAware presenti nella form
procedure TConformitaForm.SalvaDati;
begin

  if RBImpiantoRealizzatoDaDitta.Checked then
    DM1.TableConformitaCOMPLETAMENTEREALIZZATODITTA.Value := '1'
  else if RBImpiantoNonRealizzatoDaDitta.Checked then
    DM1.TableConformitaCOMPLETAMENTEREALIZZATODITTA.Value := '0'
  else
    DM1.TableConformitaCOMPLETAMENTEREALIZZATODITTA.Clear;

  if RBSono.Checked then
    DM1.TableConformitaPRESENTITUTTEDICHCONFALTREDITTE.Value := '1'
  else if RBNonSono.Checked then
    DM1.TableConformitaPRESENTITUTTEDICHCONFALTREDITTE.Value := '0'
  else
    DM1.TableConformitaPRESENTITUTTEDICHCONFALTREDITTE.Clear;

end;

procedure TConformitaForm.FormShow(Sender: TObject);
var
  TempStr: String;
begin
  try
    DM1.ShowWait('Dichiarazione di Conformità', 'Attendere...');
    // Inizializzazione
    MaxProgRigo := 0;
    // Se si tratta di un modello rende visibili tutti i Tabs
    // anche quello dei Dati del Modello...
    if Self.IsDocModel then
    begin
      TabModello.TabVisible := True;
      cxPageControl1.ActivePage := TabModello;
      cxPageControl2.ActivePage := TabSez2QuadroB;
      PanelCodData.Visible := False;
      // Altrimenti se non è un modello rende invisibile i dati del modello
    end
    else
    begin
      TabModello.TabVisible := False;
      cxPageControl1.ActivePage := TabNewDichiarazione;
      cxPageControl2.ActivePage := TabSez2QuadroB;
      PanelCodData.Visible := True;
    end;
    DM1.FocusRefresh;
    // In base al valore di 'Tag' apre la form in diverse modalità...
    case Tag of
      // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
      1:
        begin
          DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento...');
          DM1.TableConformita.Refresh;
          if DM1.TableConformita.Locate('Codice;Data', VarArrayOf([CodiceConformita, DataConformita]), []) then
          begin
            // Carica i dati per i componenti non DBAware presenti nella form
            Self.CaricaDati;
            // CArica i righi della vecchia  relazione tipologica del materiale utilizzato
            DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento righi tipologica del materiale utilizzato...');
            CaricaRighiConformita(DM1.TableConformitaCODICE.AsInteger, DM1.TableConformitaDATA.AsDateTime);
            // Carica nella variabile apposita il PROGRIGO massimo presente nei righi
            MaxProgRigo := GetMaxProgRigo;

            // Imposta ed apre la query dei righi dell'elenco delle apparecchiature
            DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento righi apparecchi, materiali, varie...');
            CaricaRighiApparecchiMateriali;

          end
          else
          begin
            MessageDlg('Dichiarazione di conformità non trovata !', mtError, [mbOK], 0);
            TimerCloseNonTrovato.Enabled := True;
            Exit;
          end;
        end;
      // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
      2:
        begin
          DM1.ShowWait('Dichiarazione di Conformità', 'Creazione nuovo documento...');
          DM1.TableConformita.Append;
          DM1.ShowWait('Dichiarazione di Conformità', 'Inizializzazione nuovo documento...');
          // La nuova dichiarazione di conformità avrà codice = al codice della chiave
          // però in negativo. Questo perchè mi serve cmq. un codice da subito e non deve
          // interferire con i normali codici per cui l'ho fatto negativo. Ho usato
          // il codice chiave perchè così ogni stazione lo fa diverso altrimenti darebbe un
          // Key Violation nel caso che due stazioni facessero contemporaneamente una nuova
          // dichiarazione di conformità.
          // Se si tratta di una versione demo di levante la chiave non c'è (-1) e quindi
          // per non avere problemi assume codice -9999
          if StrToInt(DM1.CodiceUtente) > 0 then
            DM1.TableConformitaCODICE.Value := (StrToInt(DM1.CodiceUtente) * (-1))
          else
            DM1.TableConformitaCODICE.Value := -9999;
          DM1.TableConformitaDATA.Value := Now;
          // Solo se non è un modello
          if not Self.IsDocModel then
          begin
            DM1.TableConformitaCLIENTE.Value := StrToInt(CodiceCliente);
            DM1.TableConformitaCOMMITCODICE.Value := StrToInt(CodiceCliente);
            DM1.TableConformitaPROPCODICE.Value := StrToInt(CodiceCliente);
            DM1.TableConformitaIMMOBCODICE.Value := StrToInt(CodiceCliente);
            // Se il nuovo documento fa parte di una pratica...
            if (CodicePratica <> '') and (DataPratica <> '') then
            begin
              // Importa i dati della pratica
              ImportaDatiPratica;
            end;
          end;
          DM1.TableConformitaDATA.Value := Date;
          DM1.TableConformitaIlSottoscritto.Value := Trim(DM1.TableDatiAziendaTITOLARENOME.Value + ' ' + DM1.TableDatiAziendaTITOLARECOGNOME.Value);
          DM1.TableConformitaRESPTECNICO.Value := DM1.TableDatiAziendaRTNOME.Value;
          DM1.TableConformitaNatoCitta.Value := DM1.TableDatiAziendaNatoCitta.Value;
          DM1.TableConformitaNatoProv.Value := DM1.TableDatiAziendaNatoProv.Value;
          DM1.TableConformitaNatoIl.Value := DM1.TableDatiAziendaNatoIl.Value;
          DM1.TableConformitaResidenteCitta.Value := DM1.TableDatiAziendaResidenteCitta.Value;
          DM1.TableConformitaResidenteIndirizzo.Value := DM1.TableDatiAziendaResidenteIndirizzo.Value;
          DM1.TableConformitaResidenteProv.Value := DM1.TableDatiAziendaResidenteProv.Value;
          DM1.TableConformitaImpiantoInServizio.Value := '0';
          DM1.TableConformitaNuovoImpianto.Value := '0';
          DM1.TableConformitaTrasformazione.Value := '0';
          DM1.TableConformitaAmpliamento.Value := '0';
          DM1.TableConformitaManutStraordinaria.Value := '0';
          DM1.TableConformitaAltro.Value := '0';
          DM1.TableConformitaSostituzApparecchioInstallato.Value := '0';
          DM1.TableConformitaRispettatoProgetto.Value := '0';
          DM1.TableConformitaSeguitoNormaTecnica.Value := '0';
          DM1.TableConformitaInstallatoComponenti.Value := '0';
          DM1.TableConformitaControllatoImpianto.Value := '0';
          DM1.TableConformitaAllegatoProgetto.Value := '0';
          DM1.TableConformitaAllegatoRelazione.Value := '0';
          DM1.TableConformitaAllegatoSchema.Value := '0';
          DM1.TableConformitaAllegatoRifConformita.Value := '0';
          DM1.TableConformitaAllegatoCopiaCertificato.Value := '0';
          DM1.TableConformitaALLEGATOATTMATNONORM.Value := '0';
          DM1.TableConformitaUsoIndustriale.Value := '0';
          DM1.TableConformitaUsoCivile.Value := '0';
          DM1.TableConformitaUsoCOmmercio.Value := '0';
          DM1.TableConformitaAltriUsi.Value := '0';
          DM1.TableConformitaRispondenteNorme.Value := '1';
          DM1.TableConformitaConformeArt7.Value := '1';
          DM1.TableConformitaMatIdoneiAmbient.Value := '1';
          DM1.TableConformitaCompImpEsistente.Value := '1';
          DM1.TableConformitaAllegati.Value := '1';
          DM1.TableConformitaS1QAPROGIMPGAS.Value := '0';
          DM1.TableConformitaS1QAPROGCAMINO.Value := '0';
          DM1.TableConformitaS1QAPROGPREVINC.Value := '0';
          DM1.TableConformitaS1QBDICHGASPREC.Value := '0';
          DM1.TableConformitaS1QBDICCAMINOPREC.Value := '0';
          DM1.TableConformitaS1QCPROGIMPINTGAS.Value := '0';
          DM1.TableConformitaS1QCCPI.Value := '0';
          DM1.TableConformitaS1QCRELTEC.Value := '0';
          DM1.TableConformitaS1QCALL2.Value := '0';
          DM1.TableConformitaS2QANUOVOIMPGAS.Value := '0';
          DM1.TableConformitaS2QAMODIMPESIST.Value := '0';
          DM1.TableConformitaS2QAINSTAPPGAS.Value := '0';
          DM1.TableConformitaS2QAINSTTRATTOTUBO.Value := '0';
          DM1.TableConformitaS2QAINSTPZSPEC.Value := '0';
          DM1.TableConformitaS2QACOLLEGAPPCANNAFUM.Value := '0';
          DM1.TableConformitaS2QAREALAPVENT.Value := '0';
          DM1.TableConformitaS2QAREALAPAERAZ.Value := '0';
          DM1.TableConformitaS2QACAMINOSINGOLO.Value := '0';
          DM1.TableConformitaS2QACANNACOLLETTIVA.Value := '0';
          DM1.TableConformitaS2QACANNACOLLRAMIF.Value := '0';
          DM1.TableConformitaS2QAALTRO.Value := '0';
          DM1.TableConformitaS2QBAPPCOLLKW.Value := '0';
          DM1.TableConformitaS2QBSOLOPRED.Value := '0';
          DM1.TableConformitaS2QBCOLLEGAMENTODI.Value := '0';
          DM1.TableConformitaS2QBSOSTITUZIONEDI.Value := '0';
          DM1.TableConformitaS2QBADEGNORMA.Value := '0';
          DM1.TableConformitaS2QBALTRO.Value := '0';
          DM1.TableConformitaS2QCESECCONFPROG.Value := '0';
          DM1.TableConformitaS2QCESECCURAINST.Value := '0';
          DM1.TableConformitaS3QAAPPCE.Value := '0';
          DM1.TableConformitaS3QAAPVENTEFF1.Value := '0';
          DM1.TableConformitaS3QACONTMANCFIAMMA.Value := '0';
          DM1.TableConformitaS3QAAPVENTEFF2.Value := '0';
          DM1.TableConformitaS3QBUNI.Value := '0';
          DM1.TableConformitaS3QBDM120496.Value := '0';
          DM1.TableConformitaS3QBALTRO.Value := '0';
          DM1.TableConformitaS4TENUTATUBGAS.Value := '0';
          DM1.TableConformitaS4TENUTACAMINO.Value := '0';

          DM1.TableConformitaTERMOTIPMAT_UNI.Value := '0';
          DM1.TableConformitaTERMOTIPMAT_ALTRO.Value := '0';
          DM1.TableConformitaTERMOTIPAPP_CE.Value := '0';

          DM1.TableConformitaIDROTIPMAT_UNI.Value := '0';
          DM1.TableConformitaIDROTIPMAT_ALTRO.Value := '0';
          DM1.TableConformitaIDROTIPAPP_CE.Value := '0';

          DM1.TableConformitaRAPPTECNICOCOMPATIBILITA11CIG.Value := '0';
          DM1.TableConformitaDICHPROGETTISTAPREVENZINCENDI.Value := '0';

          // Costruisce il valore di default del campo "Rispettati il progetto redatto da..."
          // della prima pagina della dichiarazione
          if DM1.TableDatiAziendaRTSETDEFAULTPROGETTOREDATTODA.AsString = 'T' then
          begin
            TempStr := Trim(DM1.TableDatiAziendaRTNOME.AsString);
            if (not DM1.TableDatiAziendaRTQUALIFICA.IsNull) and (Trim(DM1.TableDatiAziendaRTQUALIFICA.AsString) <> '') then
              TempStr := TempStr + '; Qualifica: ' + Trim(DM1.TableDatiAziendaRTQUALIFICA.AsString);
            if (not DM1.TableDatiAziendaRTESTREMIISCRIZIONEALBO.IsNull) and (Trim(DM1.TableDatiAziendaRTESTREMIISCRIZIONEALBO.AsString) <> '') then
              TempStr := TempStr + '; Estremi iscriz. Albo: ' + Trim(DM1.TableDatiAziendaRTESTREMIISCRIZIONEALBO.AsString);
            DM1.TableConformitaPROGETTOREDATTODA.Value := TempStr;
          end;

          // Imposta ed apre la query dei righi dell'elenco delle apparecchiature
          if QryApp.Active then
            QryApp.Close;
          QryApp.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryApp.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryApp.Prepared then
            QryApp.Prepare;
          QryApp.Open;

          if QryTermoApp.Active then
            QryTermoApp.Close;
          QryTermoApp.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryTermoApp.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryTermoApp.Prepared then
            QryTermoApp.Prepare;
          QryTermoApp.Open;

          if QryIdroApp.Active then
            QryIdroApp.Close;
          QryIdroApp.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryIdroApp.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryIdroApp.Prepared then
            QryIdroApp.Prepare;
          QryIdroApp.Open;

          // Imposta ed apre la query dei righi dell'elenco dei materiali
          if QryMat.Active then
            QryMat.Close;
          QryMat.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryMat.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryMat.Prepared then
            QryMat.Prepare;
          QryMat.Open;

          if QryTermoMat.Active then
            QryTermoMat.Close;
          QryTermoMat.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryTermoMat.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryTermoMat.Prepared then
            QryTermoMat.Prepare;
          QryTermoMat.Open;

          if QryIdroMat.Active then
            QryIdroMat.Close;
          QryIdroMat.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryIdroMat.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryIdroMat.Prepared then
            QryIdroMat.Prepare;
          QryIdroMat.Open;

          // Imposta ed apre la query dei righi dell'elenco dei materiali
          if QryAltri.Active then
            QryAltri.Close;
          QryAltri.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryAltri.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryAltri.Prepared then
            QryAltri.Prepare;
          QryAltri.Open;

          if QryTermoAltri.Active then
            QryTermoAltri.Close;
          QryTermoAltri.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryTermoAltri.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryTermoAltri.Prepared then
            QryTermoAltri.Prepare;
          QryTermoAltri.Open;

          if QryIdroAltri.Active then
            QryIdroAltri.Close;
          QryIdroAltri.ParamByName('P_CODICECONF').AsInteger := DM1.TableConformitaCODICE.Value;
          QryIdroAltri.ParamByName('P_DATACONF').AsDateTime := DM1.TableConformitaDATA.Value;
          if not QryIdroAltri.Prepared then
            QryIdroAltri.Prepare;
          QryIdroAltri.Open;

          // Pone il documento in modifica
          RxSpeedModifica.Down := True;
          RxSpeedModificaClick(Self);
          // Se la IMMOBrieta CodiceModello < 0 significa che deve prelevare i dati dal modello
          // e caricarli sulla nuova dichiarazione appena creata.
          DM1.ShowWait('Dichiarazione di Conformità', 'Compilazione automatica documento...');
          if Self.CodiceModello < 0 then
            ImportaModello;
          if Self.CodiceConformitaSorgente > 0 then
            ImportaDichiarazioneDiConformita;
        end;
    end;

    // Apre la tabella dei dati della Società del Gas
    QrySocGas.Open;

    // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
    if DM1.ModCtrl(MOD_CONFORMITA) > 1 then
    begin
      RxSpeedModifica.Enabled := True;
    end
    else
    begin
      RxSpeedModifica.Enabled := False;
    end;
    // Carica i dati del destinatario della richiesta di prima accensione
    DM1.ShowWait('Dichiarazione di Conformità', 'Compilazione automatica dati per richiesta prima accensione...');
    CaricaDatiDestinatarioRichiestaPrimaAccensione(DM1.TableConformitaPrimAccCodiceSogg.AsInteger);
    // Focus Sul primo campo
    if Self.IsDocModel then
    begin
      DBEDescrizioneModello.SetFocus;
    end
    else
    begin
      DBECodice.SetFocus;
    end;

    // ==============================================================================
    // CREAZIONE DEL PUZZLE RELATIVO AL DISEGNO SCHEMATICO GAS
    // ------------------------------------------------------------------------------
    // Rende visibile la pagina realtiva al disegno schematico prima di creare i Layers
    // altrimenti non li dimensiona correttamente, poi crea i layers e poi rimette tutto
    // a posto.
    cxPageControl1.ActivePage := TabAllegati4690;
    cxPageControl2.ActivePage := TabSez2QuadroB;
    Puzzle1.HorzScrollBar.Position := 0;
    Puzzle1.VertScrollBar.Position := 0;
    // Crea i layers del disegno e imposta il primo attivo
    DM1.ShowWait('Dichiarazione di Conformità', 'Inizializzazione disegno schematico (gas)...');
    CreaPuzzleLayers(Puzzle1);
    // Carica l'eventuale sfondo del disegno
    DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento sfondo disegno schematico (gas)...');
    CaricaSfondoDisegno(Puzzle1, 'GAS', 'S2QBBGImage');
    // Se la proprietà CodiceModello < 0 significa che si sta creando una nuova
    // dichiarazione che eredita i dati dal modello specificato, in questo caso
    // carica il disegno dal modello perchè altrimenti non avendo ancora salvato
    // nulla del documento attuale non caricherebbe niente.
    // Nel caso invece si stia creando la dichiarazione copiandola da una normale dichiarazione
    // precedente, carica i dati dei materiali/apparecchi dalla dichiarazione sorgente sempre
    // perchè la dichiarazione attuale non ha ancora salvato i righi.
    DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento oggetti dello schema...');
    if (Self.CodiceModello < 0) and (Tag = 2) then
      LoadPuzzleObjects(Self.CodiceModello, StrToDate('01/01/1900'), Puzzle1)
    else if (Self.CodiceConformitaSorgente > 0) and (Tag = 2) then
      LoadPuzzleObjects(Self.CodiceConformitaSorgente, Self.DataConformitaSorgente, Puzzle1)
    else
      LoadPuzzleObjects(DM1.TableConformitaCODICE.Value, DM1.TableConformitaDATA.Value, Puzzle1);
    // Imposta il layer attivo in modo che i muri e gli altri layer siano disabilitati
    // altrimenti rimangono disegnati come abilitati
    Puzzle1.ActiveLayer := Puzzle1.FindComponent('LayerMuri') as TPuzzleLayer;
    Puzzle1.ActiveLayer := Puzzle1.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
    // ==============================================================================

    // ==============================================================================
    // CREAZIONE DEL PUZZLE RELATIVO AL DISEGNO SCHEMATICO TERMO
    // ------------------------------------------------------------------------------
    // Rende visibile la pagina realtiva al disegno schematico prima di creare i Layers
    // altrimenti non li dimensiona correttamente, poi crea i layers e poi rimette tutto
    // a posto.
    cxPageControl1.ActivePage := TabTermo;
    PageControlTermo.ActivePage := TabTermoDisegno;
    PuzzleTermo.HorzScrollBar.Position := 0;
    PuzzleTermo.VertScrollBar.Position := 0;
    // Crea i layers del disegno e imposta il primo attivo
    DM1.ShowWait('Dichiarazione di Conformità', 'Inizializzazione disegno schematico (termo)...');
    CreaPuzzleLayers(PuzzleTermo);
    // Carica l'eventuale sfondo del disegno
    DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento sfondo disegno schematico (termo)...');
    CaricaSfondoDisegno(PuzzleTermo, 'TERMO', 'TermoBackgImage');
    // Se la proprietà CodiceModello < 0 significa che si sta creando una nuova
    // dichiarazione che eredita i dati dal modello specificato, in questo caso
    // carica il disegno dal modello perchè altrimenti non avendo ancora salvato
    // nulla del documento attuale non caricherebbe niente.
    // Nel caso invece si stia creando la dichiarazione copiandola da una normale dichiarazione
    // precedente, carica i dati dei materiali/apparecchi dalla dichiarazione sorgente sempre
    // perchè la dichiarazione attuale non ha ancora salvato i righi.
    DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento oggetti dello schema (termo)...');
    if (Self.CodiceModello < 0) and (Tag = 2) then
      LoadPuzzleObjects(Self.CodiceModello, StrToDate('01/01/1900'), PuzzleTermo)
    else if (Self.CodiceConformitaSorgente > 0) and (Tag = 2) then
      LoadPuzzleObjects(Self.CodiceConformitaSorgente, Self.DataConformitaSorgente, PuzzleTermo)
    else
      LoadPuzzleObjects(DM1.TableConformitaCODICE.Value, DM1.TableConformitaDATA.Value, PuzzleTermo);
    // Imposta il layer attivo in modo che i muri e gli altri layer siano disabilitati
    // altrimenti rimangono disegnati come abilitati
    PuzzleTermo.ActiveLayer := PuzzleTermo.FindComponent('LayerMuri') as TPuzzleLayer;
    PuzzleTermo.ActiveLayer := PuzzleTermo.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
    // ==============================================================================

    // ==============================================================================
    // CREAZIONE DEL PUZZLE RELATIVO AL DISEGNO SCHEMATICO IDRO
    // ------------------------------------------------------------------------------
    // Rende visibile la pagina realtiva al disegno schematico prima di creare i Layers
    // altrimenti non li dimensiona correttamente, poi crea i layers e poi rimette tutto
    // a posto.
    cxPageControl1.ActivePage := TabIdro;
    PageControlIdro.ActivePage := TabIdroDisegno;
    PuzzleIdro.HorzScrollBar.Position := 0;
    PuzzleIdro.VertScrollBar.Position := 0;
    // Crea i layers del disegno e imposta il primo attivo
    DM1.ShowWait('Dichiarazione di Conformità', 'Inizializzazione disegno schematico (idro)...');
    CreaPuzzleLayers(PuzzleIdro);
    // Carica l'eventuale sfondo del disegno
    DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento sfondo disegno schematico (idro)...');
    CaricaSfondoDisegno(PuzzleIdro, 'IDRO', 'IdroBackgImage');
    // Se la proprietà CodiceModello < 0 significa che si sta creando una nuova
    // dichiarazione che eredita i dati dal modello specificato, in questo caso
    // carica il disegno dal modello perchè altrimenti non avendo ancora salvato
    // nulla del documento attuale non caricherebbe niente.
    // Nel caso invece si stia creando la dichiarazione copiandola da una normale dichiarazione
    // precedente, carica i dati dei materiali/apparecchi dalla dichiarazione sorgente sempre
    // perchè la dichiarazione attuale non ha ancora salvato i righi.
    DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento oggetti dello schema (idro)...');
    if (Self.CodiceModello < 0) and (Tag = 2) then
      LoadPuzzleObjects(Self.CodiceModello, StrToDate('01/01/1900'), PuzzleIdro)
    else if (Self.CodiceConformitaSorgente > 0) and (Tag = 2) then
      LoadPuzzleObjects(Self.CodiceConformitaSorgente, Self.DataConformitaSorgente, PuzzleIdro)
    else
      LoadPuzzleObjects(DM1.TableConformitaCODICE.Value, DM1.TableConformitaDATA.Value, PuzzleIdro);
    // Imposta il layer attivo in modo che i muri e gli altri layer siano disabilitati
    // altrimenti rimangono disegnati come abilitati
    PuzzleIdro.ActiveLayer := PuzzleIdro.FindComponent('LayerMuri') as TPuzzleLayer;
    PuzzleIdro.ActiveLayer := PuzzleIdro.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
    // ==============================================================================

    // Se si tratta di un modello rende visibili tutti i Tabs
    // anche quello dei Dati del Modello...
    if Self.IsDocModel then
    begin
      TabModello.TabVisible := True;
      cxPageControl1.ActivePage := TabModello;
      cxPageControl2.ActivePage := Tab4690Sez1;
      PanelCodData.Visible := False;
      // Altrimenti se non è un modello rende invisibile i dati del modello
    end
    else
    begin
      TabModello.TabVisible := False;
      cxPageControl1.ActivePage := TabNewDichiarazione;
      cxPageControl2.ActivePage := Tab4690Sez1;
      PanelCodData.Visible := True;
    end;

    // Crea le forms relative ai puzzle tools (se non sono già create)
    DM1.ShowWait('Dichiarazione di Conformità', 'Creazione pannelli puzzle tools...');
    CreatePuzzleTools;

    // Forza a True la proprietà dei puzzles che fa in modo che quando
    // il layer diventa inattivo. Attualmente dovrebbe essere disabilitato per
    // motivi di velocità
    Puzzle1.GrayedObjectsOnInactiveLayer := True;
    PuzzleTermo.GrayedObjectsOnInactiveLayer := True;
    PuzzleIdro.GrayedObjectsOnInactiveLayer := True;

    // Decide se gli allegati devono essere già visibili oppure no.
    Allegati_VerificaAbilitazione;
  finally
    // Chiude il messaggio di attesa
    DM1.CloseWait;
    // Flag che indica se l'esecuzione del gestore dell'evento on Show è stata completata
    // per la prima volta oppure no
    fOnShowCompletato := True;
    // Per sicurezza
    Application.ProcessMessages;
  end;
end;

// Procedura che, in caso di annullamento delle operazioni eseguita (rollback) distrugge gli elementi del
// disegno e li ricarica dal database (altirmenti dava alcuni errori).
procedure TConformitaForm.RicaricaDisegno(P: TPuzzle);
begin
  // Prima di tutto azzera tutti i puzzle layers
  P.ClearAllObjects;
  // Ricarica gli elementi del disegno
  LoadPuzzleObjects(DM1.TableConformitaCODICE.Value, DM1.TableConformitaDATA.Value, P);
end;

{
  procedure TConformitaForm.SalvaSfondoPuzzle;
  var
  BlobField: TField;
  BS: TIB_BlobStream;
  begin
  BlobField := DM1.TableConformitaS2QBBGIMAGE;
  BS := TIB_BlobStream (DM1.TableConformita.CreateBlobStream(DM1.TableConformitaS2QBBGIMAGE,bmReadWrite) );
  try
  Puzzle1.SfondoImg.Picture.Bitmap.SaveToStream(BS);
  finally
  BS.Free;
  end;
  end;
}

procedure TConformitaForm.SalvaSfondoPuzzle(P: TPuzzle; Sezione, BlobFieldName: String);
var
  FN: String;
begin
  // FN COntiene il nome completo del file dello sfondo
  FN := DM1.CartellaTmp + 'SfondoSchema_' + Sezione + '.JPG';
  // Se lo sfondo è vuoto mette il relativo campo = NULL
  // if not Assigned(P.SfondoImg.Picture) then begin
  if not P.SfondoImg.Visible then
  begin
    (DM1.TableConformita.FieldByName(BlobFieldName) as TBlobField).Clear;
    // Se invece lo sfondo non è vuoto lo salva
  end
  else
  begin
    P.SaveBackgroundJPGImage(FN);
    if FileExists(FN) then
    begin
      (DM1.TableConformita.FieldByName(BlobFieldName) as TBlobField).LoadFromFile(FN);
      // if not DeleteFile(FN) then raise Exception.Create('Non è stato possibile eliminare il file temporaneo "' + FN + '".');
    end;
  end;
end;

{
  // Carica lo sfondo del disegno (se c'è) e per farlo controlla se la dichiarazione attuale fa riferimento
  //  ad un modello, se lo fa carica l'immagine dal modello, altrimenti lo carica dal record della dichiarazione stessa.
  procedure TConformitaForm.CaricaSfondoDisegno;
  var
  BlobField: TField;
  BS: TStream;
  Q: TIBOQuery;
  begin
  Q := TIBOQuery.Create(nil);
  try
  Q.DatabaseName  := DM1.ArcDBFile;
  Q.IB_Connection := DM1.DBAzienda;
  // Se la dichiarazione fa riferimento ad un modello carica lo sfondo dal modello
  //  altrimenti dal blob della dichiarazione stessa.
  if DM1.TableConformitaRIFMODEL_CODICE.IsNull or DM1.TableConformitaRIFMODEL_DATA.IsNull then begin
  if DM1.TableConformitaS2QBBGIMAGE.IsNull then Exit;
  BS := DM1.TableConformita.CreateBlobStream(DM1.TableConformitaS2QBBGIMAGE,bmRead);
  BlobField := DM1.TableConformitaS2QBBGIMAGE;
  end else begin
  Q.SQL.Add('SELECT S2QBBGIMAGE FROM CONFORM WHERE CODICE = P_CODICE AND DATA = P_DATA');
  Q.ParamByName('P_CODICE').Value := DM1.TableConformitaRIFMODEL_CODICE.Value;
  Q.ParamByName('P_DATA').Value := DM1.TableConformitaRIFMODEL_DATA.Value;
  Q.Open;
  if Q.Eof then Exit;
  if Q.Fields[0].IsNull then Exit;
  BS := Q.CreateBlobStream(Q.Fields[0],bmRead);
  BlobField := Q.Fields[0];
  Q.Close;
  end;
  // Carica lo sfondo
  Puzzle1.SfondoImg.Picture.Bitmap.LoadFromStream(BS);
  finally
  if Assigned(BS) then BS.Free;
  if Assigned(Q) then Q.Free;
  end;
  end;
}

// Carica lo sfondo del disegno (se c'è) e per farlo controlla se la dichiarazione attuale fa riferimento
// ad un modello, se lo fa carica l'immagine dal modello, altrimenti lo carica dal record della dichiarazione stessa.
procedure TConformitaForm.CaricaSfondoDisegno(P: TPuzzle; Sezione, BlobFieldName: String);
var
  FN: String;
  Q: TIBOQuery;
begin
  FN := DM1.CartellaTmp + 'SfondoSchema_' + Sezione + '.JPG';
  Q := TIBOQuery.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Se la dichiarazione fa riferimento ad un modello carica lo sfondo dal modello
    // altrimenti dal blob della dichiarazione stessa.
    if (DM1.TableConformitaRIFMODEL_CODICE.IsNull) or (not DM1.TableConformita.FieldByName(BlobFieldName).IsNull) then
    begin
      if DM1.TableConformita.FieldByName(BlobFieldName).IsNull then
        Exit;
      (DM1.TableConformita.FieldByName(BlobFieldName) as TBlobField).SaveToFile(FN);
    end
    else
    begin
      Q.SQL.Add('SELECT ' + BlobFieldName + ' FROM CONFORM WHERE CODICE = :P_CODICE AND DATA = ''01/01/1900''');
      Q.ParamByName('P_CODICE').Value := DM1.TableConformitaRIFMODEL_CODICE.Value;
      Q.Open;
      if Q.Eof then
        Exit;
      if Q.Fields[0].IsNull then
        Exit;
      (Q.Fields[0] as TBlobField).SaveToFile(FN);
      Q.Close;
    end;
    // Carica lo sfondo
    P.LoadBackgroundBMPImage(FN);
  finally
    if Assigned(Q) then
      Q.Free;
  end;
end;

// Crea i layers del disegno  GAS
procedure TConformitaForm.CreaPuzzleLayers(P: TPuzzle);
var
  NPL: TPuzzleLayer;
begin
  // Crea il layer dei muri
  NPL := P.CreateNewPuzzleLayer(32, 32);
  NPL.Name := 'LayerMuri';
  // Crea il layer dei Materiali e degli apparecchi
  NPL := P.CreateNewPuzzleLayer(32, 32);
  NPL.Name := 'LayerMaterialiApparecchi';
  // Imposta il layer attivo
  P.ActiveLayer := NPL;
end;

procedure TConformitaForm.RxSpeedModificaClick(Sender: TObject);
var
  MR: TModalResult;
begin
  // A seconda che il tasto sia abbassato o meno svolge la funzione di
  // attivare la modifica dei campi o disabilitarla.
  IF RxSpeedModifica.Down then
  begin
    // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
    // tutto a posto.
    try
      try
        // Per sicurezza ricarica i righi dell'elenco del materiale utilizzato così se nel frattempo
        // qualcuno li ha modificati sono aggiornati.
        DM1.ShowWait('Dichiarazione di Conformità', 'Caricamento righi relazione tipologica');
        CaricaRighiConformita(DM1.TableConformitaCODICE.AsInteger, DM1.TableConformitaDATA.AsDateTime);
        // Avvia la transazione
        DM1.ShowWait('', 'Avvio transazione');
        DM1.DBAzienda.StartTransaction;
        // Tabella in editing mode
        DM1.ShowWait('', 'Avvio modalità di editing');
        DM1.TableConformita.Edit;
        SourceApp.AutoEdit := True;
        SourceMat.AutoEdit := True;
        SourceAltri.AutoEdit := True;
        SourceTermoApp.AutoEdit := True;
        SourceTermoMat.AutoEdit := True;
        SourceTermoAltri.AutoEdit := True;
        SourceIdroApp.AutoEdit := True;
        SourceIdroMat.AutoEdit := True;
        SourceIdroAltri.AutoEdit := True;
        // Modica i pulsanti e i colori dei campi per la modifica
        RxSpeedButtonNuovo.Enabled := True;
        RxSpeedButtonElimina.Enabled := True;
        RxSpeedButtonStampa.Enabled := False;
        RxSpeedButtonFax.Enabled := False;
        RxSpeedButtonUscita.Enabled := False;
        BitBtnSelezioneStato.Enabled := True;
        BitBtnPratica1.Enabled := True;
        BitBtnPratica2.Enabled := True;
        BitBtnPratica3.Enabled := True;
        BitBtnCliente.Enabled := True;
        BitBtnPrimAccSogg.Enabled := True;
        SBCommittente.Enabled := True;
        SBProprietario.Enabled := True;
        SBImmobile.Enabled := True;
        SBSocGasCantiere.Enabled := True;
        // Abilita/Disabilita disegni
        Puzzle1.PuzzleState := psSelect;
        PuzzleTermo.PuzzleState := psSelect;
        PuzzleIdro.PuzzleState := psSelect;
        EnableDisablePuzzleTools(PuzzleToolsGasForm, True);
        EnableDisablePuzzleTools(PuzzleToolsTermoForm, True);
        EnableDisablePuzzleTools(PuzzleToolsIdroForm, True);
        // Colora tutti i campi per la modofica
        DM1.ColoraTuttiCampi(ConformitaForm, COLOR_MODIFICA);
        tvRT.Styles.Background := DM1.tvBackgroundModifica;
        tvRT.Styles.ContentEven := DM1.tvContentEvenModifica;
        tvRT.Styles.ContentOdd := DM1.tvContentOddModifica;
        tvApp.Styles.Background := DM1.tvBackgroundModifica;
        tvApp.Styles.ContentEven := DM1.tvContentEvenModifica;
        tvApp.Styles.ContentOdd := DM1.tvContentOddModifica;
        tvMateriali.Styles.Background := DM1.tvBackgroundModifica;
        tvMateriali.Styles.ContentEven := DM1.tvContentEvenModifica;
        tvMateriali.Styles.ContentOdd := DM1.tvContentOddModifica;
        tvTermoApp.Styles.Background := DM1.tvBackgroundModifica;
        tvTermoApp.Styles.ContentEven := DM1.tvContentEvenModifica;
        tvTermoApp.Styles.ContentOdd := DM1.tvContentOddModifica;
        tvTermoMat.Styles.Background := DM1.tvBackgroundModifica;
        tvTermoMat.Styles.ContentEven := DM1.tvContentEvenModifica;
        tvTermoMat.Styles.ContentOdd := DM1.tvContentOddModifica;
        tvIdroApp.Styles.Background := DM1.tvBackgroundModifica;
        tvIdroApp.Styles.ContentEven := DM1.tvContentEvenModifica;
        tvIdroApp.Styles.ContentOdd := DM1.tvContentOddModifica;
        tvIdroMat.Styles.Background := DM1.tvBackgroundModifica;
        tvIdroMat.Styles.ContentEven := DM1.tvContentEvenModifica;
        tvIdroMat.Styles.ContentOdd := DM1.tvContentOddModifica;
        // Abilita la griglia alla modifica
        GridEdit(True);
      except
        on E: Exception do
        begin
          MessageBeep(0);
          MessageDlg(E.Message, mtError, [mbOK], 0);
          RxSpeedModifica.Down := False;
        end;
      end;
    finally
      DM1.CloseWait;
    end;
  end
  else
  begin
    // Gestisce l'eccezione nel caso qualche cosa vada storto
    try
      try
        // Disabilita la modifica dei campi
        DM1.TableConformita.Edit;
        // Chiede di confermare le modifiche o di annullare l'operazione

        MR := DM1.ConfermaModifiche;
        if MR = mrYes then
        begin
          // Se il codice cliente è nullo (nuovo documento) ne assegna uno nuovo.
          DM1.ShowWait('Dichiarazione di Conformità', 'Verifica codice documento');
          if DM1.TableConformitaCODICE.IsNull or ((DM1.TableConformitaCODICE.AsInteger = (StrToInt(DM1.CodiceUtente) * (-1))) and
            (StrToInt(DM1.CodiceUtente) > 0)) or (DM1.TableConformitaCODICE.AsInteger = -9999) then
          begin
            // Se stiamo creando un modello d dichiarazione di conformità...
            if Self.IsDocModel then
            begin
              DM1.TableConformitaCODICE.Value := DM1.NextCodiceNegativo('CONFORM', 'CODICE');
              DM1.TableConformitaDATA.Value := StrToDate('01/01/1900');
              // Altrimenti se siamo in una dichiarazione normale...
            end
            else
              DM1.TableConformitaCODICE.Value := DM1.NextNumData('CONFORM', 'CODICE', 'DATA', DM1.TableConformitaDATA.Value);
          end;
          // Salva l'immagine di sfondo del disegno
          // NB: Solo se la conformità attuale non fa rimerimento
          // ad un modello.
          DM1.ShowWait('', 'Salvataggio sfondo schemi');
          if DM1.TableConformitaRIFMODEL_CODICE.IsNull then
            SalvaSfondoPuzzle(Puzzle1, 'GAS', 'S2QBBGImage');
          SalvaSfondoPuzzle(PuzzleTermo, 'TERMO', 'TermoBackgImage');
          SalvaSfondoPuzzle(PuzzleIdro, 'IDRO', 'IdroBackgImage');
          // Post dei dati
          DM1.ShowWait('', 'Conferma dati principali');
          Self.SalvaDati; // Salva i dati di componenti non DBAware prima del Post
          DM1.TableConformita.Post;
          SourceApp.AutoEdit := False;
          SourceMat.AutoEdit := False;
          SourceAltri.AutoEdit := False;
          SourceTermoApp.AutoEdit := False;
          SourceTermoMat.AutoEdit := False;
          SourceTermoAltri.AutoEdit := False;
          SourceIdroApp.AutoEdit := False;
          SourceIdroMat.AutoEdit := False;
          SourceIdroAltri.AutoEdit := False;
          // Salva i righi dell'elenco del materiale utilizzato
          DM1.ShowWait('', 'Salvataggio righi relazione tipologica');
          SalvaRighiConformita(DM1.TableConformitaCODICE.AsInteger, DM1.TableConformitaDATA.AsDateTime);
          // Imposta correttamente il numero e la data del documneto nei righi e anche il progressivo
          // del rigo.
          // NB: Aggiorna anche alla fine i dati relativi alla posizione e alla rotazione degli
          // elementi del disegno.
          DM1.ShowWait('', 'Aggiornamento e salvataggio oggetti schemi');
          AggiornaTuttiGliOggettiDelDataset(Puzzle1, QryApp);
          AggiornaTuttiGliOggettiDelDataset(Puzzle1, QryMat);
          AggiornaTuttiGliOggettiDelDataset(Puzzle1, QryAltri);
          AggiornaTuttiGliOggettiDelDataset(PuzzleTermo, QryTermoApp);
          AggiornaTuttiGliOggettiDelDataset(PuzzleTermo, QryTermoMat);
          AggiornaTuttiGliOggettiDelDataset(PuzzleTermo, QryTermoAltri);
          AggiornaTuttiGliOggettiDelDataset(PuzzleIdro, QryIdroApp);
          AggiornaTuttiGliOggettiDelDataset(PuzzleIdro, QryIdroMat);
          AggiornaTuttiGliOggettiDelDataset(PuzzleIdro, QryIdroAltri);
          // Commit
          DM1.ShowWait('', 'Commit della transazione');
          DM1.DBAzienda.Commit;
          // Decide se gli allegati devono essere già visibili oppure no.
          Allegati_VerificaAbilitazione;
          // Aggiorna le variebili globali che contengono il riferimento alla Dichiarazione di Conformità corrente
          CodiceConformita := DM1.TableConformitaCODICE.AsInteger;
          DataConformita := DM1.TableConformitaDATA.AsDateTime;
          // Imposta ed apre la query dei righi dell'elenco delle apparecchiature
          DM1.ShowWait('', 'Caricamento righi apparecchi, materiali, varie...');
          CaricaRighiApparecchiMateriali;
        end
        else if MR = mrNo then
        begin
          if DM1.TableConformita.State = dsInsert then
          begin
            // Esegue il cancel di tutte le modifiche ai dati
            DM1.ShowWait('Dichiarazione di Conformità', 'Annullamento delle modifiche effettuate');
            DM1.TableConformita.Cancel;
            SourceApp.AutoEdit := False;
            SourceMat.AutoEdit := False;
            SourceAltri.AutoEdit := False;
            SourceTermoApp.AutoEdit := False;
            SourceTermoMat.AutoEdit := False;
            SourceTermoAltri.AutoEdit := False;
            SourceIdroApp.AutoEdit := False;
            SourceIdroMat.AutoEdit := False;
            SourceIdroAltri.AutoEdit := False;
            // Rollback
            DM1.ShowWait('', 'Rollback della transazione');
            DM1.DBAzienda.Rollback;
            Close; // Chiude la form (altrimenti dà problemi)
            Exit;
          end
          else
          begin
            DM1.ShowWait('Dichiarazione di Conformità', 'Annullamento delle modifiche effettuate');
            DM1.TableConformita.Cancel;
            SourceApp.AutoEdit := False;
            SourceMat.AutoEdit := False;
            SourceAltri.AutoEdit := False;
            SourceTermoApp.AutoEdit := False;
            SourceTermoMat.AutoEdit := False;
            SourceTermoAltri.AutoEdit := False;
            SourceIdroApp.AutoEdit := False;
            SourceIdroMat.AutoEdit := False;
            SourceIdroAltri.AutoEdit := False;
            // Rollback
            DM1.ShowWait('', 'Rollback della transazione');
            DM1.DBAzienda.Rollback;
            // RIgenera il disegno perchè altrimenti ci potrebbero essere problemi
            DM1.ShowWait('', 'Ricaricamento/Annullamento modifiche schema GAS');
            RicaricaDisegno(Puzzle1);
            DM1.ShowWait('', 'Ricaricamento/Annullamento modifiche schema TERMO');
            RicaricaDisegno(PuzzleTermo);
            DM1.ShowWait('', 'Ricaricamento/Annullamento modifiche schema IDRO');
            RicaricaDisegno(PuzzleIdro);
          end;
        end
        else
        begin
          DM1.ShowWait('Dichiarazione di Conformità', 'Annullamento operazione...');
          RxSpeedModifica.Down := True;
          Exit;
        end;
        // Ripristina i pulsanti e i colori dei campi
        DM1.ShowWait('', 'Ripristino modalità di consultazione');
        RxSpeedButtonNuovo.Enabled := False;
        RxSpeedButtonElimina.Enabled := False;
        RxSpeedButtonStampa.Enabled := True;
        RxSpeedButtonFax.Enabled := True;
        RxSpeedButtonUscita.Enabled := True;
        BitBtnSelezioneStato.Enabled := False;
        BitBtnPratica1.Enabled := False;
        BitBtnPratica2.Enabled := False;
        BitBtnPratica3.Enabled := False;
        BitBtnCliente.Enabled := False;
        BitBtnPrimAccSogg.Enabled := False;
        SBCommittente.Enabled := False;
        SBProprietario.Enabled := False;
        SBImmobile.Enabled := False;
        SBSocGasCantiere.Enabled := False;
        // Abilita/Disabilita disegni
        Puzzle1.PuzzleState := psReadOnly;
        PuzzleTermo.PuzzleState := psReadOnly;
        PuzzleIdro.PuzzleState := psReadOnly;
        EnableDisablePuzzleTools(PuzzleToolsGasForm, False);
        EnableDisablePuzzleTools(PuzzleToolsTermoForm, False);
        EnableDisablePuzzleTools(PuzzleToolsIdroForm, False);
        // RImette i colori normali
        DM1.ColoraTuttiCampi(ConformitaForm, COLOR_NORMALE);
        tvRT.Styles.Background := DM1.tvBackground;
        tvRT.Styles.ContentEven := DM1.tvContentEven;
        tvRT.Styles.ContentOdd := DM1.tvContentOdd;
        tvApp.Styles.Background := DM1.tvBackground;
        tvApp.Styles.ContentEven := DM1.tvContentEven;
        tvApp.Styles.ContentOdd := DM1.tvContentOdd;
        tvMateriali.Styles.Background := DM1.tvBackground;
        tvMateriali.Styles.ContentEven := DM1.tvContentEven;
        tvMateriali.Styles.ContentOdd := DM1.tvContentOdd;
        tvTermoApp.Styles.Background := DM1.tvBackground;
        tvTermoApp.Styles.ContentEven := DM1.tvContentEven;
        tvTermoApp.Styles.ContentOdd := DM1.tvContentOdd;
        tvTermoMat.Styles.Background := DM1.tvBackground;
        tvTermoMat.Styles.ContentEven := DM1.tvContentEven;
        tvTermoMat.Styles.ContentOdd := DM1.tvContentOdd;
        tvIdroApp.Styles.Background := DM1.tvBackground;
        tvIdroApp.Styles.ContentEven := DM1.tvContentEven;
        tvIdroApp.Styles.ContentOdd := DM1.tvContentOdd;
        tvIdroMat.Styles.Background := DM1.tvBackground;
        tvIdroMat.Styles.ContentEven := DM1.tvContentEven;
        tvIdroMat.Styles.ContentOdd := DM1.tvContentOdd;
        // Disabilita la modifica nella griglia
        GridEdit(False);
        // Negli schemi si assicura che il layer attivo sia quello dei Materiali/Apparecchi
        if Puzzle1.ActiveLayer.Name <> 'LayerMaterialiApparecchi' then
          Puzzle1.ActiveLayer := Puzzle1.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
        if PuzzleTermo.ActiveLayer.Name <> 'LayerMaterialiApparecchi' then
          PuzzleTermo.ActiveLayer := PuzzleTermo.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
        if PuzzleIdro.ActiveLayer.Name <> 'LayerMaterialiApparecchi' then
          PuzzleIdro.ActiveLayer := PuzzleIdro.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
      except
        on E: Exception do
        begin
          MessageBeep(0);
          MessageDlg(E.Message, mtError, [mbOK], 0);
          RxSpeedModifica.Down := True;
          // Riabilita la modifica dei campi
          DM1.TableConformita.Edit;
          SourceApp.AutoEdit := True;
          SourceMat.AutoEdit := True;
          SourceAltri.AutoEdit := True;
          SourceTermoApp.AutoEdit := True;
          SourceTermoMat.AutoEdit := True;
          SourceTermoAltri.AutoEdit := True;
          SourceIdroApp.AutoEdit := True;
          SourceIdroMat.AutoEdit := True;
          SourceIdroAltri.AutoEdit := True;
        end;
      end;
    finally
      DM1.CloseWait;
    end;
  end;
end;

// Procedura che abilita il relativo PuzzleTools
procedure TConformitaForm.EnableDisablePuzzleTools(PT: TPuzzleToolsForm; Enabled: Boolean);
begin
  if not Assigned(PT) then
    Exit;
  if Enabled then
  begin
    PT.Enabled := True;
    PT.NavBarMateriali.ActiveGroup.SelectedLinkIndex := 0; // Seleziona il primo elemento
    PT.NavBarMuri.ActiveGroup.SelectedLinkIndex := 0; // Seleziona il primo elemento
  end
  else
  begin
    PT.Enabled := False;
    PT.NavBarMateriali.ActiveGroup.SelectedLinkIndex := -1; // Altrimenti rimane selezionato il componente
    PT.NavBarMuri.ActiveGroup.SelectedLinkIndex := -1; // Altrimenti rimane selezionato il componente
  end;
end;

procedure TConformitaForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  Close;
end;

procedure TConformitaForm.BitBtnPratica1Click(Sender: TObject);
begin
  DM1.SelezionaCantiereImpianto(DM1.TableConformitaPRATICA, DM1.TableConformitaDATAPRATICA1, nil, DM1.TableConformitaCLIENTE, DM1.TableConformitaCLIENTE.Value);
end;

procedure TConformitaForm.BitBtnPratica2Click(Sender: TObject);
begin
  DM1.SelezionaCantiereImpianto(DM1.TableConformitaPratica2, DM1.TableConformitaDataPratica2, nil, nil, DM1.TableConformitaCLIENTE.Value);
end;

procedure TConformitaForm.BitBtnPratica3Click(Sender: TObject);
begin
  DM1.SelezionaCantiereImpianto(DM1.TableConformitaPratica3, DM1.TableConformitaDataPratica3, nil, nil, DM1.TableConformitaCLIENTE.Value);
end;

procedure TConformitaForm.DBEditStatoDocumentoChange(Sender: TObject);
begin
  DBEditStatoDocumento.Font.Color := DM1.StrToColor(DM1.TableConformitaStatoForeground.Value, clBlack);
  DBEditStatoDocumento.Color := DM1.StrToColor(DM1.TableConformitaStatoBackground.Value, clSilver);
end;

procedure TConformitaForm.DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TConformitaForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
  // Richiama la selezione dello stato del documento
  DM1.SelezionaStato('Conformita', DM1.TableConformita, 0);
  DBEditStatoDocumento.Font.Color := DM1.StrToColor(DM1.TableConformitaStatoForeground.Value, clBlack);
  DBEditStatoDocumento.Color := DM1.StrToColor(DM1.TableConformitaStatoBackground.Value, clSilver);
end;

procedure TConformitaForm.RxSpeedButtonStampaClick(Sender: TObject);
begin
  Application.CreateForm(TStampaDichiarazioneForm, StampaDichiarazioneForm);
  StampaDichiarazioneForm.Parent := MainForm;
  StampaDichiarazioneForm.Show;
end;

procedure TConformitaForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
  HelpForm.Aiuto('DICHIARAZIONI DI CONFORMITA');
end;

procedure TConformitaForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  DM1.Attendere;
  // Visualizza la form che permette di selezionare l'articolo da inserire
  // nel documento.
  Application.CreateForm(TArticoliForm, ArticoliForm);
  ArticoliForm.Parent := MainForm;
  ArticoliForm.Tag := 998; // Abilita la seleziona dell'articolo per l'inserimento nella dichiarazione di conformità
  RxSpeedButtonNuovo.Tag := 0; // Append del nuovo articolo
  ArticoliForm.Show;
  DM1.ChiudiAttendere;
end;

procedure TConformitaForm.RxSpeedButtonNuovoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // *************************************************************************
  // NB: FACENDO CLICK COL DX SI INSERISCE UN NUOVO ARTICOLO NEL DOCUMENTO
  // NEL PUNTO DOVE SI TROVA IL CURSORE FACENDO SCORRERE GLI ARTICOLI
  // SUCCESSIVI DI 1 POSTO.
  // *************************************************************************
  if Button = mbRight then
  begin
    // Visualizza la form che permette di selezionare l'articolo da inserire
    // nel documento.
    Application.CreateForm(TArticoliForm, ArticoliForm);
    ArticoliForm.Parent := MainForm;
    ArticoliForm.Tag := 998;
    RxSpeedButtonNuovo.Tag := 1; // Insert del nuovo articolo
    ArticoliForm.Show;
  end;
end;

procedure TConformitaForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
var
  DC: TcxCustomDataController;
  CodiceArticolo: string;
begin
  // Inizializzazione
  DC := tvRT.DataController;
  // Alcune verifiche prima di proseguire
  if DC.FocusedRecordIndex = -1 then
    Exit;
  // Carica e verifica il codice articolo
  CodiceArticolo := Trim(DC.DisplayTexts[DC.FocusedRecordIndex, tvRTCodice.Index]);
  if CodiceArticolo = '' then
    Exit;
  // Apre la form con l'articolo
  DM1.Attendere;
  try
    Application.CreateForm(TAnagArtForm, AnagArtForm);
    // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
    // che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
    // Il problema lo dava solo quando assegnavo la IMMOBrietà Parent della form AnagArtForm.
    // con le altre form andava bene.
    // AnagArtForm.Parent := MainForm;
    MainForm.FormSetParentPlatformDependent(AnagArtForm, MainForm);
    AnagArtForm.CodiceArticolo := CodiceArticolo;
    AnagArtForm.Tag := 1;
    AnagArtForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TConformitaForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  try
    // Se è selezionata la pagina degli allegati legge 46/90...
    if Self.cxPageControl1.ActivePage = Self.TabAllegati4690 then
    begin
      // Se è selezionata la pagina del disegno
      if Self.cxPageControl2.ActivePage = Self.TabSez2QuadroB then
      begin
        if DM1.Messaggi('Elimina oggetti', 'Eliminare gli oggetti selezionati?', '', [mbYes, mbNo], 0, nil) = mrYes then
        begin
          DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
          Self.Puzzle1.DeleteSelectedObjects;
        end;
        // Se è selezionata la pagina dell'elenco apparecchi
      end
      else if Self.cxPageControl2.ActivePage = Self.Tab4690Sez3 then
      begin
        DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
        EliminaMatAppSelezionatiGriglia;
        // Se è selezionata la pagina dell'elenco materiali
      end
      else if Self.cxPageControl2.ActivePage = Self.Tab4690Sez3QuadroB then
      begin
        DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
        EliminaMatAppSelezionatiGriglia;
      end;

      // Se è selezionata la pagina TERMO
    end
    else if Self.cxPageControl1.ActivePage = Self.TabTermo then
    begin
      // Se è selezionata la pagina del disegno
      if Self.PageControlTermo.ActivePage = Self.TabTermoDisegno then
      begin
        if DM1.Messaggi('Elimina oggetti', 'Eliminare gli oggetti selezionati?', '', [mbYes, mbNo], 0, nil) = mrYes then
        begin
          DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
          Self.PuzzleTermo.DeleteSelectedObjects;
        end;
        // Se è selezionata la pagina dell'elenco apparecchi
      end
      else if Self.PageControlTermo.ActivePage = Self.TabTermoElencoApp then
      begin
        DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
        EliminaMatAppSelezionatiGriglia;
        // Se è selezionata la pagina dell'elenco materiali
      end
      else if Self.PageControlTermo.ActivePage = Self.TabTermoElencoMat then
      begin
        DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
        EliminaMatAppSelezionatiGriglia;
      end;

      // Se è selezionata la pagina IDRO
    end
    else if Self.cxPageControl1.ActivePage = Self.TabIdro then
    begin
      // Se è selezionata la pagina del disegno
      if Self.PageControlIdro.ActivePage = Self.TabIdroDisegno then
      begin
        if DM1.Messaggi('Elimina oggetti', 'Eliminare gli oggetti selezionati?', '', [mbYes, mbNo], 0, nil) = mrYes then
        begin
          DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
          Self.PuzzleIdro.DeleteSelectedObjects;
        end;
        // Se è selezionata la pagina dell'elenco apparecchi
      end
      else if Self.PageControlIdro.ActivePage = Self.TabIdroElencoApp then
      begin
        DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
        EliminaMatAppSelezionatiGriglia;
        // Se è selezionata la pagina dell'elenco materiali
      end
      else if Self.PageControlIdro.ActivePage = Self.TabIdroElencoMat then
      begin
        DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
        EliminaMatAppSelezionatiGriglia;
      end;

      // Se invece è selezionata la pagina della relazione tipologica del materiale utilizzato...
    end
    else if Self.cxPageControl1.ActivePage = Self.TabListaMateriale then
    begin
      // Solo se vi è almeno un documento selezionato
      if tvRT.Controller.SelectedRecordCount > 0 then
      begin
        MessageBeep(0);
        if MessageDlg('ATTENZIONE!!! - Vuoi eliminare i righi selezionati ?', mtWarning, [mbOK, mbNo], 0) = mrOk then
        begin
          DM1.ShowWait(MainForm.NomeApplicazione, 'Eliminazione oggetti selezionati in corso...');
          tvRT.DataController.DeleteSelection;
        end;
      end;
    end;
  finally
    DM1.CloseWait;
  end;

end;

procedure TConformitaForm.Dichiarazionediconformit1Click(Sender: TObject);
begin
  // Stampa sulla stampante
  Application.CreateForm(TDichiarazioneConformitaQR, DichiarazioneConformitaQR);
  try
    // Anteprima
    if MenuStampe.Tag = 0 then
    begin
      DichiarazioneConformitaQR.Preview;
      // Stampa
    end
    else if MenuStampe.Tag = 1 then
    begin
      DM1.Attendere;
      if DM1.SettaStampante(DichiarazioneConformitaQR, 0) then
      begin
        DichiarazioneConformitaQR.Print;
      end;
      DM1.ChiudiAttendere;
    end;
  finally
    DichiarazioneConformitaQR.Free;
  end;
end;

procedure TConformitaForm.Relazionetipologicadelmaterialeutilizzato1Click(Sender: TObject);
begin
  // Stampa sulla stampante
  Application.CreateForm(TElencoMaterialeQR, ElencoMaterialeQR);
  ElencoMaterialeQR.CodiceConf := CodiceConformita;
  ElencoMaterialeQR.DataConf := DataConformita;
  try
    // Anteprima
    if MenuStampe.Tag = 0 then
    begin
      ElencoMaterialeQR.Preview;
      // Stampa
    end
    else if MenuStampe.Tag = 1 then
    begin
      DM1.Attendere;
      if DM1.SettaStampante(ElencoMaterialeQR, 0) then
      begin
        ElencoMaterialeQR.Print;
      end;
      DM1.ChiudiAttendere;
    end;
  finally
    ElencoMaterialeQR.Free;
  end;
end;

procedure TConformitaForm.ReportDesignerDialog1BandBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  LabelCopiaPer: TQRLabel;
begin
  inherited;
  LabelCopiaPer := TQRLabel(ConformitaForm.ReportDesignerDialog1.ReportForm.FindComponent('LabelCopiaPer'));
  case StampaDichiarazioneForm.CopiaPer of
    1:
      LabelCopiaPer.Caption := 'Copia per il committente';
    2:
      LabelCopiaPer.Caption := 'Copia per il comune';
    3:
      LabelCopiaPer.Caption := 'Copia per l''impresa';
    4:
      LabelCopiaPer.Caption := 'Copia per la C.C.I.A.A.';
    5:
      LabelCopiaPer.Caption := 'Copia per il distributore';
    6:
      LabelCopiaPer.Caption := '';
  end;
end;

procedure TConformitaForm.Autodichiarazionedipossessodeirequisititecnicoprofessionali1Click(Sender: TObject);
begin
  // Stampa sulla stampante
  Application.CreateForm(TAutodichiarazioneQR, AutodichiarazioneQR);
  try
    // Anteprima
    if MenuStampe.Tag = 0 then
    begin
      AutodichiarazioneQR.Preview;
      // Stampa
    end
    else if MenuStampe.Tag = 1 then
    begin
      DM1.Attendere;
      if DM1.SettaStampante(AutodichiarazioneQR, 0) then
      begin
        AutodichiarazioneQR.Print;
      end;
      DM1.ChiudiAttendere;
    end;
  finally
    AutodichiarazioneQR.Free;
  end;
end;

procedure TConformitaForm.AzzeraStato1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    DM1.TableConformitaSTATODESCRIZIONE.Clear;
    DM1.TableConformitaSTATOFOREGROUND.Clear;
    DM1.TableConformitaSTATOBACKGROUND.Clear;
    DBECodice.SetFocus;
    DBEditStatoDocumento.SetFocus;
  end;
end;

procedure TConformitaForm.tvRTEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  // Per non so quale motivo, quando entro in editing di un campo (Descrizione) passa 2 o 3 volte di quà
  // e anche quando lo confermo passa altre due o tre volte di quà.
  // Però quando modificavo la descrizione (dopo aver messo il memo) premendo INVIO al secondo passaggio
  // mi dava Access Violation Error e ho visto che AItem era nil. Quindi per risolvere
  // ora controllo AItem e se è = nil esco subito.
  if AItem = nil then
    Exit;
  // Se si tratta della colonna che indica se il rigo finirà anche nella dichiarazione per l'ente del GAS, in base
  // al tipo selezionato visualizzerà un riquodro per completare i dati da inserire nelle note.
  if AItem = tvRTDichEnteGas then
  begin
    if VarToStr(Sender.Controller.EditingController.Edit.EditValue) = 'Cucina' then
    begin
      PanelCucina.Top := ClientArea.Top + PANEL_DATI_ENTE_GAS_TOP;
      PanelCucina.Left := ClientArea.Left + PANEL_DATI_ENTE_GAS_LEFT;
      PanelCucina.Visible := True;
      PanelCucina.SetFocus;
      PanelCucina.Update;
    end
    else if VarToStr(Sender.Controller.EditingController.Edit.EditValue) = 'Tubo' then
    begin
      PanelTubo.Top := ClientArea.Top + PANEL_DATI_ENTE_GAS_TOP;
      PanelTubo.Left := ClientArea.Left + PANEL_DATI_ENTE_GAS_LEFT;
      PanelTubo.Visible := True;
      PanelTubo.SetFocus;
      PanelTubo.Update;
    end;
  end;
end;

procedure TConformitaForm.PanelCucinaEnter(Sender: TObject);
begin
  MessageBeep(0);
end;

procedure TConformitaForm.PanelCucinaExit(Sender: TObject);
begin
  // Impedisce di uscire dal pannello se non si è premuto il pulsante OK
  if PanelCucina.Tag = 0 then
  begin
    MessageBeep(0);
    PanelCucina.SetFocus;
  end;
end;

procedure TConformitaForm.BitBtn1Click(Sender: TObject);
var
  DC: TcxCustomDataController;
begin
  DC := tvRT.DataController;
  // Autocompila  le note
  if ConForno.Checked then
  begin
    DC.Values[DC.FocusedRecordIndex, tvRTNote.Index] := 'cucina a ' + Fuochi.Text + ' fuochi con forno';
  end
  else
  begin
    DC.Values[DC.FocusedRecordIndex, tvRTNote.Index] := 'cucina a ' + Fuochi.Text + ' fuochi senza forno';
  end;
  // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
  PanelCucina.Tag := 1;
  PanelCucina.Visible := False;
end;

procedure TConformitaForm.PanelTuboEnter(Sender: TObject);
begin
  MessageBeep(0);
end;

procedure TConformitaForm.PanelTuboExit(Sender: TObject);
begin
  // Impedisce di uscire dal pannello se non si è premuto il pulsante OK
  if PanelTubo.Tag = 0 then
  begin
    MessageBeep(0);
    PanelTubo.SetFocus;
  end;
end;

procedure TConformitaForm.BitBtn2Click(Sender: TObject);
var
  OutStr: String;
  DC: TcxCustomDataController;
begin
  DC := tvRT.DataController;
  // Autocompila  le note
  OutStr := 'fi ' + UMDiametro.Text + ' ' + Diametro.Text;
  if Trim(Spessore.Text) <> '' then
    OutStr := OutStr + ', spessore mm ' + Spessore.Text;
  DC.Values[DC.FocusedRecordIndex, tvRTNote.Index] := OutStr;
  // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
  PanelTubo.Tag := 1;
  PanelTubo.Visible := False;
end;

procedure TConformitaForm.DichiarazioniperlEntedistributoredelgas1Click(Sender: TObject);
begin
  // Stampa sulla stampante
  Application.CreateForm(TDichiarazioneGasQR, DichiarazioneGasQR);
  try
    // Anteprima
    if MenuStampe.Tag = 0 then
    begin
      DichiarazioneGasQR.Preview;
      // Stampa
    end
    else if MenuStampe.Tag = 1 then
    begin
      DM1.Attendere;
      if DM1.SettaStampante(DichiarazioneGasQR, 0) then
      begin
        DichiarazioneGasQR.Print;
      end;
      DM1.ChiudiAttendere;
    end;
  finally
    DichiarazioneGasQR.Free;
  end;
end;

procedure TConformitaForm.Richiestadiprimaaccensionecaldaia1Click(Sender: TObject);
begin
  // Stampa sulla stampante
  Application.CreateForm(TRichiestaPrimaAccensioneQR, RichiestaPrimaAccensioneQR);
  try
    // Anteprima
    if MenuStampe.Tag = 0 then
    begin
      RichiestaPrimaAccensioneQR.Preview;
      // Stampa
    end
    else if MenuStampe.Tag = 1 then
    begin
      DM1.Attendere;
      if DM1.SettaStampante(RichiestaPrimaAccensioneQR, 0) then
      begin
        RichiestaPrimaAccensioneQR.Print;
      end;
      DM1.ChiudiAttendere;
    end;
  finally
    RichiestaPrimaAccensioneQR.Free;
  end;
end;

procedure TConformitaForm.BitBtnClienteClick(Sender: TObject);
begin
  DM1.SelezionaCliente(DM1.TableConformitaCLIENTE, DM1.TableConformitaPRATICA, DM1.TableConformitaDATAPRATICA1, '');
end;

procedure TConformitaForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(DM1.TableConformitaCLIENTE.Value);
end;

procedure TConformitaForm.DBEdit3Enter(Sender: TObject);
begin
  // Se è in modalità di Modifica...
  if RxSpeedModifica.Down then
    DM1.ControlEnter(Sender);
end;

procedure TConformitaForm.DBEdit3Exit(Sender: TObject);
begin
  // Se è in modalità di Modifica...
  if RxSpeedModifica.Down then
    DM1.ControlExit(Sender);
end;

procedure TConformitaForm.SpeedButtonRollOver1Click(Sender: TObject);
begin
  DM1.VisualizzaCliente(DM1.TableConformitaPrimAccCodiceSogg.Value);
end;

procedure TConformitaForm.BitBtnPrimAccSoggClick(Sender: TObject);
begin
  DM1.SelezionaCliente(DM1.TableConformitaPrimAccCodiceSogg, DM1.TableConformitaPRATICA, DM1.TableConformitaDATAPRATICA1, '');
end;

procedure TConformitaForm.QryAppBeforePost(DataSet: TDataSet);
var
  NuovoRiferimentoProvvisorio: String;
  DS: TIBOQuery;
begin
  DS := (DataSet as TIBOQuery);
  // Se il campo S3COMPONENTE è nullo o vuoto da un errore e non esegue il post
  if DS.FieldByName('S3COMPONENTE').IsNull or (Trim(DS.FieldByName('S3COMPONENTE').AsString) = '') then
  begin
    DM1.Messaggi('Dichiarazione di conformità', 'Il campo ''COMPONENTE'' o ''APPARECCHIATURA'' è obbligatorio.', '', [mbOK], 0, nil);
    Abort;
  end;
  // Marca il record come modificato
  DS.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
  // Se i campi della chiave primaria dei righi sono nulli gli assegna dei valori giusto per non avere errori
  if DS.FieldByName('TIPODOCUMENTO').IsNull then
    DS.FieldByName('TIPODOCUMENTO').Value := 'Conformita';
  if DS.FieldByName('REGISTRO').IsNull then
    DS.FieldByName('REGISTRO').Value := 'C';
  if DS.FieldByName('NUMORDPREV').IsNull then
    DS.FieldByName('NUMORDPREV').Value := DM1.TableConformitaCODICE.AsInteger;
  if DS.FieldByName('DATADOCUMENTO').IsNull then
    DS.FieldByName('DATADOCUMENTO').Value := DM1.TableConformitaDATA.AsDateTime;
  if DS.FieldByName('PROGRIGO').IsNull then
    DS.FieldByName('PROGRIGO').Value := GetNextProgRigo;
  if DS.FieldByName('PROGRIGO2').IsNull then
    DS.FieldByName('PROGRIGO2').Value := '-1';
  // Se il rigo attuale non ha il Riferimento, ne assegna uno provisorio che inizia con la lettera 'X'
  // tale lettera indica appunto che si tratta di un rigo presente negli elenchi dei materiali e apparecchi
  // ma che non è presente nel disegno.
  // NB: Quanto sopra scritto solo se esiste nell'elenco dei Materiali/Apparecchi la relatica voce (componente) altrimenti
  // il riferimento rimane NULL e anche se c'era già un riferimento provvisorio (X) ma ora non c'è una corrisponente
  // voce sempre nell'elenco dei Materiali/Apparecchi lo rimemme a NULL.
  if DS.FieldByName('S3RIF').IsNull then
  begin
    NuovoRiferimentoProvvisorio := CalcolaNuovoRiferimentoProvvisorio(DS.FieldByName('S3COMPONENTE').AsString);
    if NuovoRiferimentoProvvisorio <> 'NULL' then
      DS.FieldByName('S3RIF').Value := NuovoRiferimentoProvvisorio;
  end
  else if (LeftStr(DS.FieldByName('S3RIF').AsString, 1) = 'X') then
  begin
    NuovoRiferimentoProvvisorio := CalcolaNuovoRiferimentoProvvisorio(DS.FieldByName('S3COMPONENTE').AsString);
    if NuovoRiferimentoProvvisorio = 'NULL' then
      DS.FieldByName('S3RIF').Clear;
  end;
  // Se il DS è quello dei Materiali imposta il campo MaterialeApparecchio := 'M'
  // se invece è quello degli apparecchi lo imposta a 'A'.
  if DS.Name = 'QryApp' then
    DS.FieldByName('S3MATERIALEAPPARECCHIO').Value := 'A'
  else if DS.Name = 'QryMat' then
    DS.FieldByName('S3MATERIALEAPPARECCHIO').Value := 'M'
  else if DS.Name = 'QryTermoApp' then
    DS.FieldByName('S3MATERIALEAPPARECCHIO').Value := 'A'
  else if DS.Name = 'QryTermoMat' then
    DS.FieldByName('S3MATERIALEAPPARECCHIO').Value := 'M'
  else if DS.Name = 'QryIdroApp' then
    DS.FieldByName('S3MATERIALEAPPARECCHIO').Value := 'A'
  else if DS.Name = 'QryIdroMat' then
    DS.FieldByName('S3MATERIALEAPPARECCHIO').Value := 'M';
end;

procedure TConformitaForm.cxPageControl2Change(Sender: TObject);
begin
  CheckForAggiungiButtonShow;
  CheckForDeleteButtonShow;
  // Se la pagina attivata è quella del disegno, visualizza la form con
  // i componenti.
  CheckForPuzzleToolsShow;
end;

// Procedura che si occupa della creazione delle form relative ai pannelli laterali
// con le info dei materiali/apparecchi dei disegni
procedure TConformitaForm.CreatePuzzleTools;
begin
  // Creazione PuzzleTools della sezione GAS
  if PuzzleToolsGasForm = nil then
  begin
    Application.CreateForm(TPuzzleToolsGasForm, PuzzleToolsGasForm);
    PuzzleToolsGasForm.Sezione := 'GAS';
    PuzzleToolsGasForm.Puzzle := Puzzle1;
    PuzzleToolsGasForm.DSApparecchi := QryApp;
    PuzzleToolsGasForm.DSMateriali := QryMat;
    PuzzleToolsGasForm.CaricaTuttiGliElementi;
    // Se siamo in modalità di modifica lo abilita
    EnableDisablePuzzleTools(PuzzleToolsGasForm, (RxSpeedModifica.Down));
  end;
  // Creazione PuzzleTools della sezione TERMO
  if PuzzleToolsTermoForm = nil then
  begin
    Application.CreateForm(TPuzzleToolsTermoForm, PuzzleToolsTermoForm);
    PuzzleToolsTermoForm.Sezione := 'TERMO';
    PuzzleToolsTermoForm.Puzzle := PuzzleTermo;
    PuzzleToolsTermoForm.DSApparecchi := QryTermoApp;
    PuzzleToolsTermoForm.DSMateriali := QryTermoMat;
    PuzzleToolsTermoForm.CaricaTuttiGliElementi;
    // Se siamo in modalità di modifica lo abilita
    EnableDisablePuzzleTools(PuzzleToolsTermoForm, (RxSpeedModifica.Down));
  end;
  // Creazione PuzzleTools della sezione IDRO
  if PuzzleToolsIdroForm = nil then
  begin
    Application.CreateForm(TPuzzleToolsIdroForm, PuzzleToolsIdroForm);
    PuzzleToolsIdroForm.Sezione := 'IDRO';
    PuzzleToolsIdroForm.Puzzle := PuzzleIdro;
    PuzzleToolsIdroForm.DSApparecchi := QryIdroApp;
    PuzzleToolsIdroForm.DSMateriali := QryIdroMat;
    PuzzleToolsIdroForm.CaricaTuttiGliElementi;
    // Se siamo in modalità di modifica lo abilita
    EnableDisablePuzzleTools(PuzzleToolsIdroForm, (RxSpeedModifica.Down));
  end;
end;

// Questa procedura si occupa di visualizzare la PuzzleToolsForm se sono
// selezionati i Tabs relativi nei PageControls della form
procedure TConformitaForm.CheckForPuzzleToolsShow;
begin
  // Se non è sttao completat almento per la prima volta l'evento onShow della form esce subito
  // NB: Altrimenti mi si vedevano i pannelli laterali con i dati dei componenti durante il caricamento
  // della dichiarazione di conformità e non mi piaceva
  if not fOnShowCompletato then
    Exit;

  // Puzzle Tools GAS
  if ((cxPageControl1.ActivePage = TabAllegati4690) and (cxPageControl2.ActivePage = TabSez2QuadroB)) then
  begin
    PuzzleToolsGasForm.Show;
  end
  else
  begin
    if PuzzleToolsGasForm <> nil then
      PuzzleToolsGasForm.Hide;
  end;

  // Puzzle Tools TERMO
  if ((cxPageControl1.ActivePage = TabTermo) and (PageControlTermo.ActivePage = TabTermoDisegno)) then
  begin
    PuzzleToolsTermoForm.Show;
  end
  else
  begin
    if PuzzleToolsTermoForm <> nil then
      PuzzleToolsTermoForm.Hide;
  end;

  // Puzzle Tools IDRO
  if ((cxPageControl1.ActivePage = TabIdro) and (PageControlIdro.ActivePage = TabIdroDisegno)) then
  begin
    PuzzleToolsIdroForm.Show;
  end
  else
  begin
    if PuzzleToolsIdroForm <> nil then
      PuzzleToolsIdroForm.Hide;
  end;

end;

// Questa procedura si occupa di abilitare o meno il pulsante "Aggiungi" in base
// a quale pagina è attialmente visible nei PageControls
procedure TConformitaForm.CheckForAggiungiButtonShow;
begin
  RxSpeedButtonNuovo.Enabled := (((cxPageControl1.ActivePage = TabListaMateriale))) and RxSpeedModifica.Down;
end;

// Questa procedura si occupa di abilitare o meno il pulsante "Elimina" in base
// a quale pagina è attialmente visible nei PageControls

procedure TConformitaForm.CheckForDeleteButtonShow;
begin
  RxSpeedButtonElimina.Enabled := (((cxPageControl1.ActivePage = TabAllegati4690) and ((cxPageControl2.ActivePage = TabSez2QuadroB) or
    (cxPageControl2.ActivePage = Tab4690Sez3) or (cxPageControl2.ActivePage = Tab4690Sez3QuadroB))) or ((cxPageControl1.ActivePage = TabListaMateriale)) or
    ((cxPageControl1.ActivePage = TabTermo)) or ((cxPageControl1.ActivePage = TabIdro))) and RxSpeedModifica.Down;
end;

procedure TConformitaForm.ClosePuzzleToolsForm;
begin
  if PuzzleToolsGasForm <> nil then
  begin
    PuzzleToolsGasForm.Close;
  end;
  if PuzzleToolsTermoForm <> nil then
  begin
    PuzzleToolsTermoForm.Close;
  end;
  if PuzzleToolsIdroForm <> nil then
  begin
    PuzzleToolsIdroForm.Close;
  end;
end;

procedure TConformitaForm.Timer1Timer(Sender: TObject);
var
  AbsMousePos: TPoint;
begin
  GetCursorPos(AbsMousePos);

  Label80.Caption := PuzzleTermo.NextPuzzleObject.ObjectName;
  Label79.Caption := PuzzleTermo.NextPuzzleObject.BitmapFileName;
  LabelX.Caption := IntToStr(PuzzleTermo.GridMousePosition.X);
  LabelY.Caption := IntToStr(PuzzleTermo.GridMousePosition.Y);
  LabelPrevX.Caption := IntToStr(PuzzleTermo.GridMovingPrevPosition.X);
  LabelPrevY.Caption := IntToStr(PuzzleTermo.GridMovingPrevPosition.Y);
  LabelTubePrevX.Caption := IntToStr(PuzzleTermo.GridTubePrevPos.X);
  LabelTubePrevY.Caption := IntToStr(PuzzleTermo.GridTubePrevPos.Y);
  LabelNextObjectType.Caption := IntToStr(PuzzleTermo.NextPuzzleObjectType);
  // LabelHorzScrollBarPosition.Caption := IntToStr(PuzzleTermo.ActiveLayer.HorzCardsCount);
  // LabelVertScrollBarPosition.Caption := IntToStr(PuzzleTermo.ActiveLayer.VertCardsCount);

  // LabelAbsoluteMousePositionX.Caption := IntToStr(AbsMousePos.X);
  // LabelAbsoluteMousePositionY.Caption := IntToStr(AbsMousePos.Y);
  LabelAbsoluteMousePositionX.Caption := IntToStr(PuzzleTermo.GridTubePrevPos.X);
  LabelAbsoluteMousePositionY.Caption := IntToStr(PuzzleTermo.GridTubePrevPos.Y);

  LabelPuzzleRightMargin.Caption := IntToStr(PuzzleTermo.ClientToScreen(Point(0, PuzzleTermo.Top)).Y);
  LabelPuzzleRightMarginScreen.Caption := IntToStr(PuzzleTermo.ClientOrigin.Y);
  LabelPuzzleTag.Caption := IntToStr(PuzzleTermo.Tag);

  if PuzzleTermo.PuzzleState = psSelect then
    LabelStatus.Caption := 'psSelect'
  else if PuzzleTermo.PuzzleState = psInsert then
    LabelStatus.Caption := 'psInsert'
  else if PuzzleTermo.PuzzleState = psMove then
    LabelStatus.Caption := 'psMove'
  else
    LabelStatus.Caption := 'psNone';
end;

procedure TConformitaForm.TimerCloseNonTrovatoTimer(Sender: TObject);
begin
  TimerCloseNonTrovato.Enabled := False;
  Close;
end;

procedure TConformitaForm.TimerUITimer(Sender: TObject);
begin
  dbeProgettoRedattoDa.Visible := dbeRispettatoProgetto.Checked;
end;

procedure TConformitaForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  // Se è visibile il Puzzle del GAS
  if (cxPageControl1.ActivePage = TabAllegati4690) and (cxPageControl2.ActivePage = TabSez2QuadroB) then
  begin
    for i := 0 to Puzzle1.ActiveLayer.SelectedObjectsCount - 1 do
    begin
      Puzzle1.ActiveLayer.SelectedObjects[i].RotateLeft;
    end;
    Handled := True;
    // Se è visibile il Puzzle del TERMO
  end
  else if (cxPageControl1.ActivePage = TabTermo) and (PageControlTermo.ActivePage = TabTermoDisegno) then
  begin
    for i := 0 to PuzzleTermo.ActiveLayer.SelectedObjectsCount - 1 do
    begin
      PuzzleTermo.ActiveLayer.SelectedObjects[i].RotateLeft;
    end;
    Handled := True;
    // Se è visibile il Puzzle del IDRO
  end
  else if (cxPageControl1.ActivePage = TabIdro) and (PageControlIdro.ActivePage = TabIdroDisegno) then
  begin
    for i := 0 to PuzzleIdro.ActiveLayer.SelectedObjectsCount - 1 do
    begin
      PuzzleIdro.ActiveLayer.SelectedObjects[i].RotateLeft;
    end;
    Handled := True;
  end;
end;

procedure TConformitaForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  // Se è visibile il Puzzle del GAS
  if (cxPageControl1.ActivePage = TabAllegati4690) and (cxPageControl2.ActivePage = TabSez2QuadroB) then
  begin
    for i := 0 to Puzzle1.ActiveLayer.SelectedObjectsCount - 1 do
    begin
      Puzzle1.ActiveLayer.SelectedObjects[i].RotateRight;
    end;
    Handled := True;
    // Se è visibile il Puzzle del TERMO
  end
  else if (cxPageControl1.ActivePage = TabTermo) and (PageControlTermo.ActivePage = TabTermoDisegno) then
  begin
    for i := 0 to PuzzleTermo.ActiveLayer.SelectedObjectsCount - 1 do
    begin
      PuzzleTermo.ActiveLayer.SelectedObjects[i].RotateRight;
    end;
    Handled := True;
    // Se è visibile il Puzzle del IDRO
  end
  else if (cxPageControl1.ActivePage = TabIdro) and (PageControlIdro.ActivePage = TabIdroDisegno) then
  begin
    for i := 0 to PuzzleIdro.ActiveLayer.SelectedObjectsCount - 1 do
    begin
      PuzzleIdro.ActiveLayer.SelectedObjects[i].RotateRight;
    end;
    Handled := True;
  end;
end;

function TConformitaForm.LocatePuzzleObjectByRif(V: TcxGridDBTableView; RifToSearch: String): Boolean;
var
  i: Integer;
begin
  // Inizializzazione
  Result := False;
  V.BeginUpdate;
  try
    with V.DataController do
    begin
      // Cicla per tutti i record della griglia
      for i := 0 to RecordCount - 1 do
      begin
        // Se il RIF del record attuale è quello che stiamo cercando...
        // NB: LA COLONNA RIF DEVE ESSERE LA PRIMA A SX
        if Values[i, 0] = RifToSearch then
        begin
          Result := True;
          FocusedRecordIndex := i;
          Break;
        end;
      end;
    end;
  finally
    V.EndUpdate;
  end;
end;

procedure TConformitaForm.Puzzle1SelectionChange(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
var
  CurrentSelectedObject: TPuzzleObject;
begin
  // Se la form attuale (conformità) non è più quella con il focus (ad es: perchè
  // l'operatore si è spostato su una proprietà dell'oggetto per cambiarla nel pannello
  // laterale del disegno) provvede a reimpostarla come attiva, altrimenti non funzionano
  // più alcune cose come ad es: la rotazione dell'oggetto attualmente selezionato in quanto
  // non essendo più la form selezionata non riceve gli eventi di gestione della rotellina del mouase ad esempio.
  if not Self.Active then
    Self.SetFocus;
  // Se è slezionato un solo elemento e in base al tipo di elemento selezionato,
  // visualizza i dati dell'elemento stesso, altrimenti visualizza la palette
  // normale di selezione.
  // NB: Verifica anche che gli oggetti selezionati siano tutti o Materiali o apparecchi e se non è
  // così ovviamente non visualizza il pannello laterale perchè i pannelli per i due tipi di oggetti è
  // doverso e non saprebbe come fare.
  if (SenderPuzzle.ActiveLayer.SelectedObjectsCount > 0) and (OggettiSelezionatiTuttiDiUnTipo(SenderPuzzle.ActiveLayer)) then
  begin
    // Se la pagina attuale (prima della selezione) è una delle pagine relative ai layer (non i dati
    // dell'elemento del disegno corrente), prima di cambiarlo provvede a memorizzarlo in modo
    // da poterlo ripristinare quanto l'utente deseleziona gli elementi.
    if (PuzzleToolsGasForm.cxPageControl1.ActivePage = PuzzleToolsGasForm.TabMaterialiApparecchi) or
      (PuzzleToolsGasForm.cxPageControl1.ActivePage = PuzzleToolsGasForm.TabMuri) then
      PrecTabGasMaterialiApparecchi := PuzzleToolsGasForm.cxPageControl1.ActivePage;
    // L'oggetto punta all'elemento attuale
    CurrentSelectedObject := SenderPuzzle.ActiveLayer.SelectedObjects[SenderPuzzle.ActiveLayer.SelectedObjectsCount - 1];
    // Se si tratta di un apparecchio...
    if CurrentSelectedObject.MaterialeApparecchio = 'A' then
    begin
      if not LocatePuzzleObjectByRif(tvApp, CurrentSelectedObject.Riferimento) then
        raise Exception.Create('Oggetto selezionato non trovato!');
      PuzzleToolsGasForm.cxPageControl1.ActivePage := PuzzleToolsGasForm.TabDatiApparecchi;
      PuzzleToolsGasForm.CaricaDatiApparecchio(QryApp);
      // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
      PuzzleToolsGasForm.TabMaterialiApparecchi.Enabled := False;
      PuzzleToolsGasForm.TabMuri.Enabled := False;
      // Se invece si tratta di un Materiale
    end
    else if CurrentSelectedObject.MaterialeApparecchio = 'M' then
    begin
      if not LocatePuzzleObjectByRif(tvMateriali, CurrentSelectedObject.Riferimento) then
        raise Exception.Create('Oggetto selezionato non trovato!');
      PuzzleToolsGasForm.cxPageControl1.ActivePage := PuzzleToolsGasForm.TabDatiMateriali;
      PuzzleToolsGasForm.CaricaDatiMateriale(QryMat);
      // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
      PuzzleToolsGasForm.TabMaterialiApparecchi.Enabled := False;
      PuzzleToolsGasForm.TabMuri.Enabled := False;
      // Se non si tratta di nessuno dei due...
    end
    else
    begin
      PrecTabGasMaterialiApparecchi := nil;
    end;
  end
  else
  begin
    // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
    PuzzleToolsGasForm.TabMaterialiApparecchi.Enabled := True;
    PuzzleToolsGasForm.TabMuri.Enabled := True;
    // Ripristina la visualizzazione del TabSheet che era selezionato prima di passare
    // al TabSheet relativo ai dati del Materiale/Apparecchio selezionato
    if PrecTabGasMaterialiApparecchi <> nil then
      PuzzleToolsGasForm.cxPageControl1.ActivePage := PrecTabGasMaterialiApparecchi;
  end;
end;

procedure TConformitaForm.Puzzle1NewPuzzleObject(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
begin
  // Al'inserimento di un nuovo oggetto lo registra negli elenchi degli oggetti
  // in modo da salvare il tutto alla conferma del documento.
  // NB: Solo se l'oggetto appena inserito non possiede già un valore per
  // la Proprietà riferimento, altrimenti siginfica che si è inserito
  // un oggetto tra quelli già presenti negli elenchi ma ancora non presente
  // nel disegno.
  if SenderPuzzleObject.Riferimento = '' then
  begin
    CreaNuovaVoceElencoMaterialeApparecchi(SenderPuzzle, SenderPuzzleObject);
    // Altrimenti se il riferimento c'è già e inizia con 'X' significa che si è aggiunto al disegno
    // un oggetto già presente negli elenchi ma non nel disegno stesso e quindi invece di inserirlo
    // in un nuovo record modifica quello esistente.
  end
  else if LeftStr(SenderPuzzleObject.Riferimento, 1) = 'X' then
  begin
    AggiornaElencoMaterialiApparecchi(SenderPuzzle, SenderPuzzleObject, SenderPuzzleObject.Riferimento);
    // Aggiorna l'elenco degli oggetti presenti negli elenchi ma non nel disegno
    if SenderPuzzle = Puzzle1 then
      PuzzleToolsGasForm.CaricaMaterialiApparecchiGiaInElenco
    else if SenderPuzzle = PuzzleTermo then
      PuzzleToolsTermoForm.CaricaMaterialiApparecchiGiaInElenco
    else if SenderPuzzle = PuzzleIdro then
      PuzzleToolsIdroForm.CaricaMaterialiApparecchiGiaInElenco;
  end;
end;

procedure TConformitaForm.tvAppRIFGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: String);
begin
  if LeftStr(AText, 1) = 'X' then
    AText := '(' + AText + ')';
end;

procedure TConformitaForm.cxPageControl1Change(Sender: TObject);
begin
  CheckForAggiungiButtonShow;
  CheckForDeleteButtonShow;
  // Se la pagina attivata è quella del disegno, visualizza la form con
  // i componenti.
  CheckForPuzzleToolsShow;
end;

procedure TConformitaForm.Caricasfondo1Click(Sender: TObject);
var
  CurrentPuzzle: TPuzzle;
begin
  // Determina quale Disegno è visibile
  if cxPageControl1.ActivePage = TabAllegati4690 then
    CurrentPuzzle := Puzzle1
  else if cxPageControl1.ActivePage = TabTermo then
    CurrentPuzzle := PuzzleTermo
  else if cxPageControl1.ActivePage = TabIdro then
    CurrentPuzzle := PuzzleIdro;

  if Assigned(CurrentPuzzle) and OpenPictureDialog1.Execute then
  begin
    CurrentPuzzle.LoadBackgroundBMPImage(OpenPictureDialog1.FileName);
    CurrentPuzzle.SfondoImg.Visible := True;
    // In caso di caricamento/eliminazione di uno sfondo del disegno
    // diverso da quello del modello elimina il riferimento al modello stesso.
    DM1.TableConformitaRIFMODEL_CODICE.Clear;
  end;
end;

function TConformitaForm.GetDatasetToUse(P: TPuzzle; MatApp: String): TIBOQuery;
begin
  // Inizializzazione
  Result := nil;
  // Decide quale Dataset utilizzare in base al Puzzle e al tipo di elemento
  if P = Puzzle1 then
  begin
    if MatApp = 'M' then
      Result := QryMat
    else if MatApp = 'A' then
      Result := QryApp
    else
      Result := QryAltri;
  end
  else if P = PuzzleTermo then
  begin
    if MatApp = 'M' then
      Result := QryTermoMat
    else if MatApp = 'A' then
      Result := QryTermoApp
    else
      Result := QryTermoAltri;
  end
  else if P = PuzzleIdro then
  begin
    if MatApp = 'M' then
      Result := QryIdroMat
    else if MatApp = 'A' then
      Result := QryIdroApp
    else
      Result := QryIdroAltri;
  end;
end;

procedure TConformitaForm.Puzzle1BeforeDeletePuzzleObject(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
var
  DS: TIBOQuery;
  PrecControlEnabled: Boolean;
begin
  // Elimina il rispettivo record relativo al componente che si sta eliminanto.
  // Per farlo prima di tutto decide quale Dataset utilizzare in base al tipo di
  // oggetto.
  DS := GetDatasetToUse(SenderPuzzle, SenderPuzzleObject.MaterialeApparecchio);
  // Disabilita i controlli legati al Dataset
  // NB: Ho inserito questa riga per risolvere il problema che avveniva
  // quando eliminavo gli oggetti dal disegno prima di aver
  // confermato una nuova dichiarazione almeno una volta
  PrecControlEnabled := not DS.ControlsDisabled;
  if PrecControlEnabled then
    DS.DisableControls;
  try
    // Cerca il record relatico all'oggetto che si sta eliminanto e se lo trova
    // lo elimina.
    DS.First; // Altrimenti potrebe dare problemi
    if DS.Locate('S3RIF', SenderPuzzleObject.Riferimento, []) then
    begin
      DS.Delete;
    end;
  finally
    if PrecControlEnabled then
      DS.EnableControls;
  end;
end;

// RItorna la TableView dell'elencl relativo ai materiali o apparecchi
// relativi alla sezione attualmente visualizzata
function TConformitaForm.GetCurrentMatAppTableView: TcxGridDBTableView;
begin
  if (cxPageControl1.ActivePage = TabAllegati4690) and (cxPageControl2.ActivePage = Tab4690Sez3) then
    Result := tvApp
  else if (cxPageControl1.ActivePage = TabAllegati4690) and (cxPageControl2.ActivePage = Tab4690Sez3QuadroB) then
    Result := tvMateriali
  else if (cxPageControl1.ActivePage = TabTermo) and (PageControlTermo.ActivePage = TabTermoElencoApp) then
    Result := tvTermoApp
  else if (cxPageControl1.ActivePage = TabTermo) and (PageControlTermo.ActivePage = TabTermoElencoMat) then
    Result := tvTermoMat
  else if (cxPageControl1.ActivePage = TabIdro) and (PageControlIdro.ActivePage = TabIdroElencoApp) then
    Result := tvIdroApp
  else if (cxPageControl1.ActivePage = TabIdro) and (PageControlIdro.ActivePage = TabIdroElencoMat) then
    Result := tvIdroMat
  else
    Result := nil;
end;

// Elimina tutti i materiali o apparecchi attualmente selezionati nell'elenco relativo
// dal disegno e dagli elenchi stessi
procedure TConformitaForm.EliminaMatAppSelezionatiGriglia;
var
  CurrGrid: TcxGridDBTableView;
  P: TPuzzle;
begin
  // IN base alla pagina attiva sceglie la TableView sulla quale lavorare.
  CurrGrid := GetCurrentMatAppTableView;
  // In base alla pagina selezionata ritorna il TPUzzle da utilizzare
  if (cxPageControl1.ActivePage = TabAllegati4690) then
    P := Puzzle1
  else if (cxPageControl1.ActivePage = TabTermo) then
    P := PuzzleTermo
  else if (cxPageControl1.ActivePage = TabIdro) then
    P := PuzzleIdro
  else
    P := nil;
  // Cicla finchè ci sono record selezionati da eliminare
  while CurrGrid.Controller.SelectedRecordCount > 0 do
  begin
    // Mette il focus sul record da eliminare
    CurrGrid.Controller.SelectedRecords[0].Focused := True;
    // Elimina il record
    if CurrGrid.DataController.DataSet.FieldByName('S3RIF').IsNull or (LeftStr(CurrGrid.DataController.DataSet.FieldByName('S3RIF').AsString, 1) = 'X') then
    begin
      CurrGrid.DataController.DeleteFocused;
    end
    else
    begin
      P.DeletePuzzleObjectByRif(CurrGrid.DataController.DataSet.FieldValues['S3RIF']);
    end;
  end;
end;

procedure TConformitaForm.ProvaStampaSchema1Click(Sender: TObject);
begin
  Application.CreateForm(TAll4690S2QBQR, All4690S2QBQR);
  try
    All4690S2QBQR.Preview;
  finally
    All4690S2QBQR.Free;
  end;
end;

procedure TConformitaForm.ProvastampaPag31Click(Sender: TObject);
begin
  Application.CreateForm(TAll4690Pag3QR, All4690Pag3QR);
  All4690Pag3QR.Preview;
  All4690Pag3QR.Free;
end;

procedure TConformitaForm.ProvastampaPag11Click(Sender: TObject);
begin
  Application.CreateForm(TAll4690Pag1QR, All4690Pag1QR);
  All4690Pag1QR.Preview;
  All4690Pag1QR.Free;
end;

procedure TConformitaForm.Grigliavisibileinvisibile1Click(Sender: TObject);
var
  CurrentPuzzle: TPuzzle;
begin
  // Determina quale Disegno è visibile
  if cxPageControl1.ActivePage = TabAllegati4690 then
    CurrentPuzzle := Puzzle1
  else if cxPageControl1.ActivePage = TabTermo then
    CurrentPuzzle := PuzzleTermo
  else if cxPageControl1.ActivePage = TabIdro then
    CurrentPuzzle := PuzzleIdro;

  if Assigned(CurrentPuzzle) then
  begin
    CurrentPuzzle.GridVisible := not CurrentPuzzle.GridVisible;
    CurrentPuzzle.Update;
  end;
end;

procedure TConformitaForm.StampaallegatoA1Click(Sender: TObject);
begin
  // NB: Questo era già commentato  ReportDesignerDialog1.PrintReport('c:\winproject\levantedev\reports\Allegato_A_Base.QR2');
  ReportDesignerDialog1.PreviewReport('c:\winproject\levantedev\reports\Allegato_A_Base.QR2');
end;

procedure TConformitaForm.SBEspandiIMMOBrietarioClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(DM1.TableConformitaCOMMITCODICE.Value);
end;

procedure TConformitaForm.SBEspandiProprietarioClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(DM1.TableConformitaPROPCODICE.Value);
end;

procedure TConformitaForm.SBCommittenteClick(Sender: TObject);
begin
  DM1.SelezionaCliente(DM1.TableConformitaCOMMITCODICE, DM1.TableConformitaPRATICA, DM1.TableConformitaDATAPRATICA1, '');
end;

procedure TConformitaForm.SBIMMOBrietarioClick(Sender: TObject);
begin
  DM1.SelezionaCliente(DM1.TableConformitaIMMOBCODICE, DM1.TableConformitaPRATICA, DM1.TableConformitaDATAPRATICA1, '');
end;

procedure TConformitaForm.SBEspandiImmobileClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(DM1.TableConformitaIMMOBCODICE.Value);
end;

procedure TConformitaForm.SBImmobileClick(Sender: TObject);
begin
  DM1.SelezionaCliente(DM1.TableConformitaIMMOBCODICE, DM1.TableConformitaPRATICA, DM1.TableConformitaDATAPRATICA1, '');
end;

procedure TConformitaForm.SBEspandiCommittenteClick(Sender: TObject);
begin
  DM1.VisualizzaCliente(DM1.TableConformitaCOMMITCODICE.Value);
end;

procedure TConformitaForm.SBProprietarioClick(Sender: TObject);
begin
  DM1.SelezionaCliente(DM1.TableConformitaPROPCODICE, DM1.TableConformitaPRATICA, DM1.TableConformitaDATAPRATICA1, '');
end;

procedure TConformitaForm.StampaAllegatoB1Click(Sender: TObject);
begin
  // Già commentato  ReportDesignerDialog1.PrintReport('c:\winproject\levantedev\reports\Allegato_B_Base.QR2');
  // già commentato  ReportDesignerDialog1.PreviewReport('c:\winproject\levantedev\reports\Allegato_B_Base.QR2');
  ReportDesignerDialog1.PreviewReport('c:\reports\Allegato_B_Base.QR2');
end;

procedure TConformitaForm.SBSocGasCantiereClick(Sender: TObject);
begin
  DM1.SelezionaSocGas(DM1.TableConformitaSOCGASCODICE);
end;

procedure TConformitaForm.StampaallegatoC1Click(Sender: TObject);
begin
  ReportDesignerDialog1.PreviewReport('c:\reports\Allegato_C_Base.QR2');
end;

procedure TConformitaForm.StampaallegatoE1Click(Sender: TObject);
begin
  ReportDesignerDialog1.PreviewReport('c:\reports\Allegato_D_Base.QR2');
end;

procedure TConformitaForm.StampaallegatoE2Click(Sender: TObject);
begin
  ReportDesignerDialog1.PreviewReport('c:\reports\Allegato_E_Base.QR2');
end;

procedure TConformitaForm.tvMaterialiS3UBICAZIONEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  FN: ShortString;
begin
  // FN Contiene il FieldName a cui è collegata la colonna corrente
  FN := tvMateriali.Columns[tvMateriali.Controller.FocusedColumnIndex].DataBinding.FieldName;
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(' + FN + ') FROM RIGHIPRV WHERE S3MATERIALEAPPARECCHIO = ''M''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      Items.Add('');
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvMaterialiS3COMPONENTEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM APPARECCHI WHERE MATERIALEAPPARECCHIO = ''M''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Add('');
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvAppUBICAZIONEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  FN: ShortString;
begin
  // FN Contiene il FieldName a cui è collegata la colonna corrente
  FN := tvApp.Columns[tvApp.Controller.FocusedColumnIndex].DataBinding.FieldName;
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(' + FN + ') FROM RIGHIPRV WHERE S3MATERIALEAPPARECCHIO = ''A''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      Items.Add('');
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvAppAPPARECCHIATURAPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM APPARECCHI WHERE MATERIALEAPPARECCHIO = ''A''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.DBEdit56KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then
    Key := ',';
end;

// Funzione che ritorna True se tutti gli eventuali elementi selezionati del disegno
// sono o tutti materiali o tutti apparecchi. Praticamente la uso per la multi selezione
// nel senso che per poter selezionare più elementi e modificarli contemporaneamente dal
// pannello laterale devono essere o tutti di un tipèo o tutti dell'altro perchè le due
// shermate sono diverse.
function TConformitaForm.OggettiSelezionatiTuttiDiUnTipo(L: TPuzzleLayer): Boolean;
var
  i, iPrec: Integer;
begin
  // INizializzazione
  Result := True;
  iPrec := 0;
  // Cicla per tutti gli oggetti selezionati e verifica che siano tutti materiali
  // o apparecchi.
  for i := 0 to L.SelectedObjectsCount - 1 do
  begin
    if L.SelectedObjects[i].MaterialeApparecchio <> L.SelectedObjects[iPrec].MaterialeApparecchio then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

procedure TConformitaForm.PuzzleTermoSelectionChange(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
var
  CurrentSelectedObject: TPuzzleObject;
begin
  // Se la form attuale (conformità) non è più quella con il focus (ad es: perchè
  // l'operatore si è spostato su una proprietà dell'oggetto per cambiarla nel pannello
  // laterale del disegno) provvede a reimpostarla come attiva, altrimenti non funzionano
  // più alcune cose come ad es: la rotazione dell'oggetto attualmente selezionato in quanto
  // non essendo più la form selezionata non riceve gli eventi di gestione della rotellina del mouase ad esempio.
  if not Self.Active then
    Self.SetFocus;
  // Se è slezionato un solo elemento e in base al tipo di elemento selezionato,
  // visualizza i dati dell'elemento stesso, altrimenti visualizza la palette
  // normale di selezione.
  // NB: Verifica anche che gli oggetti selezionati siano tutti o Materiali o apparecchi e se non è
  // così ovviamente non visualizza il pannello laterale perchè i pannelli per i due tipi di oggetti è
  // doverso e non saprebbe come fare.
  if (SenderPuzzle.ActiveLayer.SelectedObjectsCount > 0) and (OggettiSelezionatiTuttiDiUnTipo(SenderPuzzle.ActiveLayer)) then
  begin
    // Se la pagina attuale (prima della selezione) è una delle pagine relative ai layer (non i dati
    // dell'elemento del disegno corrente), prima di cambiarlo provvede a memorizzarlo in modo
    // da poterlo ripristinare quanto l'utente deseleziona gli elementi.
    if (PuzzleToolsTermoForm.cxPageControl1.ActivePage = PuzzleToolsTermoForm.TabMaterialiApparecchi) or
      (PuzzleToolsTermoForm.cxPageControl1.ActivePage = PuzzleToolsTermoForm.TabMuri) then
      PrecTabTermoMaterialiApparecchi := PuzzleToolsTermoForm.cxPageControl1.ActivePage;
    // L'oggetto punta all'elemento attuale
    CurrentSelectedObject := SenderPuzzle.ActiveLayer.SelectedObjects[SenderPuzzle.ActiveLayer.SelectedObjectsCount - 1];
    // Se si tratta di un apparecchio...
    if CurrentSelectedObject.MaterialeApparecchio = 'A' then
    begin
      if not LocatePuzzleObjectByRif(tvTermoApp, CurrentSelectedObject.Riferimento) then
        raise Exception.Create('Oggetto selezionato non trovato!');
      PuzzleToolsTermoForm.cxPageControl1.ActivePage := PuzzleToolsTermoForm.TabDatiApparecchi;
      PuzzleToolsTermoForm.CaricaDatiApparecchio(QryTermoApp);
      // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
      PuzzleToolsTermoForm.TabMaterialiApparecchi.Enabled := False;
      PuzzleToolsTermoForm.TabMuri.Enabled := False;
      // Se invece si tratta di un Materiale
    end
    else if CurrentSelectedObject.MaterialeApparecchio = 'M' then
    begin
      if not LocatePuzzleObjectByRif(tvTermoMat, CurrentSelectedObject.Riferimento) then
        raise Exception.Create('Oggetto selezionato non trovato!');
      PuzzleToolsTermoForm.cxPageControl1.ActivePage := PuzzleToolsTermoForm.TabDatiMateriali;
      PuzzleToolsTermoForm.CaricaDatiMateriale(QryTermoMat);
      // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
      PuzzleToolsTermoForm.TabMaterialiApparecchi.Enabled := False;
      PuzzleToolsTermoForm.TabMuri.Enabled := False;
      // Se non si tratta di nessuno dei due...
    end
    else
    begin
      PrecTabTermoMaterialiApparecchi := nil;
    end;
  end
  else
  begin
    // Riabilita i Tabs altrimenti l'utente potrebbe creare casini
    PuzzleToolsTermoForm.TabMaterialiApparecchi.Enabled := True;
    PuzzleToolsTermoForm.TabMuri.Enabled := True;
    // Ripristina la visualizzazione del TabSheet che era selezionato prima di passare
    // al TabSheet relativo ai dati del Materiale/Apparecchio selezionato
    if PrecTabTermoMaterialiApparecchi <> nil then
      PuzzleToolsTermoForm.cxPageControl1.ActivePage := PrecTabTermoMaterialiApparecchi;
  end;
end;

procedure TConformitaForm.PuzzleIdroSelectionChange(SenderPuzzle: TPuzzle; SenderPuzzleObject: TPuzzleObject);
var
  CurrentSelectedObject: TPuzzleObject;
begin
  // Se la form attuale (conformità) non è più quella con il focus (ad es: perchè
  // l'operatore si è spostato su una proprietà dell'oggetto per cambiarla nel pannello
  // laterale del disegno) provvede a reimpostarla come attiva, altrimenti non funzionano
  // più alcune cose come ad es: la rotazione dell'oggetto attualmente selezionato in quanto
  // non essendo più la form selezionata non riceve gli eventi di gestione della rotellina del mouase ad esempio.
  if not Self.Active then
    Self.SetFocus;
  // Se è slezionato un solo elemento e in base al tipo di elemento selezionato,
  // visualizza i dati dell'elemento stesso, altrimenti visualizza la palette
  // normale di selezione.
  // NB: Verifica anche che gli oggetti selezionati siano tutti o Materiali o apparecchi e se non è
  // così ovviamente non visualizza il pannello laterale perchè i pannelli per i due tipi di oggetti è
  // doverso e non saprebbe come fare.
  if (SenderPuzzle.ActiveLayer.SelectedObjectsCount > 0) and (OggettiSelezionatiTuttiDiUnTipo(SenderPuzzle.ActiveLayer)) then
  begin
    // Se la pagina attuale (prima della selezione) è una delle pagine relative ai layer (non i dati
    // dell'elemento del disegno corrente), prima di cambiarlo provvede a memorizzarlo in modo
    // da poterlo ripristinare quanto l'utente deseleziona gli elementi.
    if (PuzzleToolsIdroForm.cxPageControl1.ActivePage = PuzzleToolsIdroForm.TabMaterialiApparecchi) or
      (PuzzleToolsIdroForm.cxPageControl1.ActivePage = PuzzleToolsIdroForm.TabMuri) then
      PrecTabIdroMaterialiApparecchi := PuzzleToolsIdroForm.cxPageControl1.ActivePage;
    // L'oggetto punta all'elemento attuale
    CurrentSelectedObject := SenderPuzzle.ActiveLayer.SelectedObjects[SenderPuzzle.ActiveLayer.SelectedObjectsCount - 1];
    // Se si tratta di un apparecchio...
    if CurrentSelectedObject.MaterialeApparecchio = 'A' then
    begin
      if not LocatePuzzleObjectByRif(tvIdroApp, CurrentSelectedObject.Riferimento) then
        raise Exception.Create('Oggetto selezionato non trovato!');
      PuzzleToolsIdroForm.cxPageControl1.ActivePage := PuzzleToolsIdroForm.TabDatiApparecchi;
      PuzzleToolsIdroForm.CaricaDatiApparecchio(QryIdroApp);
      // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
      PuzzleToolsIdroForm.TabMaterialiApparecchi.Enabled := False;
      PuzzleToolsIdroForm.TabMuri.Enabled := False;
      // Se invece si tratta di un Materiale
    end
    else if CurrentSelectedObject.MaterialeApparecchio = 'M' then
    begin
      if not LocatePuzzleObjectByRif(tvIdroMat, CurrentSelectedObject.Riferimento) then
        raise Exception.Create('Oggetto selezionato non trovato!');
      PuzzleToolsIdroForm.cxPageControl1.ActivePage := PuzzleToolsIdroForm.TabDatiMateriali;
      PuzzleToolsIdroForm.CaricaDatiMateriale(QryIdroMat);
      // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
      PuzzleToolsIdroForm.TabMaterialiApparecchi.Enabled := False;
      PuzzleToolsIdroForm.TabMuri.Enabled := False;
      // Se non si tratta di nessuno dei due...
    end
    else
    begin
      PrecTabIdroMaterialiApparecchi := nil;
    end;
  end
  else
  begin
    // Disabilita i Tabs altrimenti l'utente potrebbe creare casini
    PuzzleToolsIdroForm.TabMaterialiApparecchi.Enabled := True;
    PuzzleToolsIdroForm.TabMuri.Enabled := True;
    // Ripristina la visualizzazione del TabSheet che era selezionato prima di passare
    // al TabSheet relativo ai dati del Materiale/Apparecchio selezionato
    if PrecTabIdroMaterialiApparecchi <> nil then
      PuzzleToolsIdroForm.cxPageControl1.ActivePage := PrecTabIdroMaterialiApparecchi;
  end;
end;

procedure TConformitaForm.tvTermoMatUBICAZIONEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  FN: ShortString;
begin
  // FN Contiene il FieldName a cui è collegata la colonna corrente
  FN := tvTermoMat.Columns[tvTermoMat.Controller.FocusedColumnIndex].DataBinding.FieldName;
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(' + FN + ') FROM RIGHIPRV WHERE S3MATERIALEAPPARECCHIO = ''M''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      Items.Add('');
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvTermoMatCOMPONENTEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM APPARECCHI WHERE MATERIALEAPPARECCHIO = ''M''   AND   SEZIONE = ''TERMO''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvTermoAppUBICAZIONEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  FN: ShortString;
begin
  // FN Contiene il FieldName a cui è collegata la colonna corrente
  FN := tvTermoApp.Columns[tvTermoApp.Controller.FocusedColumnIndex].DataBinding.FieldName;
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(' + FN + ') FROM RIGHIPRV WHERE S3MATERIALEAPPARECCHIO = ''A''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      Items.Add('');
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvTermoAppCOMPONENTEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM APPARECCHI WHERE MATERIALEAPPARECCHIO = ''A''   AND   SEZIONE = ''TERMO''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvIdroAppUBICAZIONEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  FN: ShortString;
begin
  // FN Contiene il FieldName a cui è collegata la colonna corrente
  FN := tvIdroApp.Columns[tvIdroApp.Controller.FocusedColumnIndex].DataBinding.FieldName;
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(' + FN + ') FROM RIGHIPRV WHERE S3MATERIALEAPPARECCHIO = ''A''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      Items.Add('');
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvIdroAppCOMPONENTEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM APPARECCHI WHERE MATERIALEAPPARECCHIO = ''A''   AND   SEZIONE = ''IDRO''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvIdroMatUBICAZIONEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  FN: ShortString;
begin
  // FN Contiene il FieldName a cui è collegata la colonna corrente
  FN := tvIdroMat.Columns[tvIdroMat.Controller.FocusedColumnIndex].DataBinding.FieldName;
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DISTINCT(' + FN + ') FROM RIGHIPRV WHERE S3MATERIALEAPPARECCHIO = ''M''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      Items.Add('');
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvIdroMatCOMPONENTEPropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM APPARECCHI WHERE MATERIALEAPPARECCHIO = ''M''   AND   SEZIONE = ''IDRO''');
    Qry.Open;
    with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do
    begin
      Items.Clear;
      while not Qry.Eof do
      begin
        Items.Add(Qry.Fields[0].AsString);
        Qry.Next;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TConformitaForm.tvAppCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // Solo se non è selezionata
  if not AViewInfo.Selected then
  begin
    // Se il riferimento è nullo visualizza rigo in rosso che indica che
    // l'oggetto non potrà essere messo nel disegno.
    if VarIsNull(AViewInfo.GridRecord.Values[tvApp.GetColumnByFieldName('S3RIF').Index]) then
      ACanvas.Font.Color := clRed;
  end;
end;

procedure TConformitaForm.DbeCommittAllegObbligPropertiesInitPopup(Sender: TObject);
begin
  with Sender as TcxDBComboBox do
  begin
    Properties.Items.Clear;

    if (not DM1.TableConformitaCOMMITDENOMINAZIONE.IsNull) and (Trim(DM1.TableConformitaCOMMITDENOMINAZIONE.AsString) <> '') then
      Properties.Items.Add(DM1.TableConformitaCOMMITDENOMINAZIONE.AsString + '   (Committente)');

    if (not DM1.TableConformitaPROPDENOMINAZIONE.IsNull) and (Trim(DM1.TableConformitaPROPDENOMINAZIONE.AsString) <> '') then
      Properties.Items.Add(DM1.TableConformitaPROPDENOMINAZIONE.AsString + '   (Proprietario)');

    if (not DM1.TableConformitaRAGSOCCLI.IsNull) and (Trim(DM1.TableConformitaRAGSOCCLI.AsString) <> '') then
      Properties.Items.Add(DM1.TableConformitaRAGSOCCLI.AsString + '   (Soggetto documento)');

  end;
end;

procedure TConformitaForm.FormResize(Sender: TObject);
begin
  // IMposta la posizione della client area e i relativi margini
  MainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(Self, FormMainPanel, ClientArea, SplitterAllegati, True, True);
  // Ridimensiona i pannelli laterali
  if PuzzleToolsGasForm <> nil then
    PuzzleToolsGasForm.Ridimensiona;
  if PuzzleToolsTermoForm <> nil then
    PuzzleToolsTermoForm.Ridimensiona;
  if PuzzleToolsIdroForm <> nil then
    PuzzleToolsIdroForm.Ridimensiona;
end;

procedure TConformitaForm.tvTermoMatEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  // Forza il post dei dati (altrimenti non ottiene i dati aggiornati
  Sender.DataController.Post;
  // Aggiorna i PuzzleTools (i pannelli laterali con i dati dei componenti selezionati del disegno)
  PuzzleToolsTermoForm.CaricaDatiMateriale(QryTermoMat);
end;

procedure TConformitaForm.tvTermoAppEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  // Forza il post dei dati (altrimenti non ottiene i dati aggiornati
  Sender.DataController.Post;
  // Aggiorna i PuzzleTools (i pannelli laterali con i dati dei componenti selezionati del disegno)
  PuzzleToolsTermoForm.CaricaDatiApparecchio(QryTermoApp);
end;

procedure TConformitaForm.tvMaterialiEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  // Forza il post dei dati (altrimenti non ottiene i dati aggiornati
  Sender.DataController.Post;
  // Aggiorna i PuzzleTools (i pannelli laterali con i dati dei componenti selezionati del disegno)
  PuzzleToolsGasForm.CaricaDatiMateriale(QryMat);
end;

procedure TConformitaForm.tvIdroMatEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  // Forza il post dei dati (altrimenti non ottiene i dati aggiornati
  Sender.DataController.Post;
  // Aggiorna i PuzzleTools (i pannelli laterali con i dati dei componenti selezionati del disegno)
  PuzzleToolsIdroForm.CaricaDatiMateriale(QryIdroMat);
end;

procedure TConformitaForm.tvAppEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  // Forza il post dei dati (altrimenti non ottiene i dati aggiornati
  Sender.DataController.Post;
  // Aggiorna i PuzzleTools (i pannelli laterali con i dati dei componenti selezionati del disegno)
  PuzzleToolsGasForm.CaricaDatiApparecchio(QryApp);
end;

procedure TConformitaForm.tvIdroAppEditValueChanged(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  // Forza il post dei dati (altrimenti non ottiene i dati aggiornati
  Sender.DataController.Post;
  // Aggiorna i PuzzleTools (i pannelli laterali con i dati dei componenti selezionati del disegno)
  PuzzleToolsIdroForm.CaricaDatiApparecchio(QryIdroApp);
end;

// Questa procedura aggiorna il record relativo all'oggetto corrente con i dati
// modificati dall'utente.
procedure TConformitaForm.AggiornaElencoMaterialiApparecchi(P: TPuzzle; PO: TPuzzleObject; RifToSearch: String = '');
var
  CDS: TIBOQuery;
begin
  // Nel caso il parametro RifToSearch non sia stato valorizzato, lo valorizza con
  // il riferimento dell'oggetto PO
  if RifToSearch = '' then
    RifToSearch := PO.Riferimento;
  // In base al flag che indica se il nuovo oggetto è un materiale, un apparecchio o altro,
  // si connette al Dataset appropriato.
  // NB: Anche in base a qual'è il TPuzzle Mittente
  CDS := GetDatasetToUse(P, PO.MaterialeApparecchio);
  try
    // NB: Se non disabilita i controlli legati al dataset succedono cose strane dopo
    // l'inserimento di nuovi elementi del disegno.
    CDS.DisableControls;
    // Nel caso il riferimento attiale dell'oggetto inizia con la lettera 'X' provvede
    // ad assegnare un nuovo riferimento.
    if LeftStr(RifToSearch, 1) = 'X' then
      PO.Riferimento := CalcolaNuovoRiferimento(PO);
    // Si posiziona sul record relativo all'elemento modificato
    CDS.First;
    // tvMateriali.DataController.GotoFirst;
    if not CDS.Locate('S3RIF', RifToSearch, []) then
      raise Exception.Create('Oggetto da aggiornare non trovato.');
    // Pone il record in Edit mode
    CDS.Edit;
    try
      // Aggiorna i relativi campi con i dati dell'oggetto appena creato
      AggiornaRecordOggetto(PO, CDS);
      // Effettua il post dei dati
      CDS.Post;
      // Se l'oggetto corrente è di tipo TTubePuzzleObject (E' un tubo o simile) e la sua proprietà
      // Riferimento inizia con la 'X' significa che si è appena inserito nel disegno un tubo o simile
      // già presente negli elenchi ma non nel disegno. IN questo caso, ora ha modificato il record
      // che era già presente nell'elenco dei materiali e relativo ora all'elemento Master del tubo,
      // nella riga successiva richiama la procedura che aggiungerà tutti gli elementi successivi al primo
      // creando gli appositi record nuovi.
      if (PO is TTubePuzzleObject) and ((PO as TTubePuzzleObject).NextTubeElement <> nil) and (LeftStr(RifToSearch, 1) = 'X') then
      begin
        CreaNuovaVoceElencoMaterialeApparecchi(P, (PO as TTubePuzzleObject).NextTubeElement);
      end;
    except
      // Se il dataset è in stato di append esegue il cancel delle modifiche
      if CDS.State = dsEdit then
        CDS.Cancel;
    end;
  finally
    CDS.EnableControls;
  end;
end;

procedure TConformitaForm.QryAppAfterPost(DataSet: TDataSet);
var
  DS: TIBOQuery;
begin
  // Aggiorna l'elenco dei componenti che hanno il riferimento che inizia con X oppure nullo nel disegno.
  DS := (DataSet as TIBOQuery);
  // NB: Ho messo la condizione qui sotto perchè altrimenti senza causava problemi al salvataggio dei righi
  // degli elenchi con righi inseriti solo negli elenchi e non nel disegno (salvava solo il primo record).
  if not DS.ControlsDisabled then
  begin
    if ((DS.Name = 'QryApp') or (DS.Name = 'QryMat')) and ((LeftStr(DS.FieldByName('S3RIF').AsString, 1) = 'X') or (DS.FieldByName('S3RIF').IsNull)) and
      Assigned(PuzzleToolsGasForm) then
      PuzzleToolsGasForm.CaricaMaterialiApparecchiGiaInElenco
    else if ((DS.Name = 'QryTermoApp') or (DS.Name = 'QryTermoMat')) and
      ((LeftStr(DS.FieldByName('S3RIF').AsString, 1) = 'X') or (DS.FieldByName('S3RIF').IsNull)) and Assigned(PuzzleToolsTermoForm) then
      PuzzleToolsTermoForm.CaricaMaterialiApparecchiGiaInElenco
    else if ((DS.Name = 'QryIdroApp') or (DS.Name = 'QryIdroMat')) and ((LeftStr(DS.FieldByName('S3RIF').AsString, 1) = 'X') or (DS.FieldByName('S3RIF').IsNull)
      ) and Assigned(PuzzleToolsIdroForm) then
      PuzzleToolsIdroForm.CaricaMaterialiApparecchiGiaInElenco
  end;
end;

// Procedure che copia l'immagine di sfondo da una sezione all'altra
procedure TConformitaForm.CopiaImmagineDiSfondo(PSource, PDest: TPuzzle);
var
  FN: String;
begin
  FN := DM1.CartellaTmp + 'TmpCopiaSfondoImgSchema.jpg';
  PSource.SaveBackgroundJPGImage(FN);
  // Application.ProcessMessages;
  // Sleep(1000);
  // Application.ProcessMessages;
  PDest.LoadBackgroundBMPImage(FN);
end;

procedure TConformitaForm.CopiaimmaginedisfondodallasezioneGAS1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePage = TabTermo then
  begin
    Self.CopiaImmagineDiSfondo(Puzzle1, PuzzleTermo);

  end
  else if cxPageControl1.ActivePage = TabIdro then
  begin
    Self.CopiaImmagineDiSfondo(Puzzle1, PuzzleIdro);

  end;
end;

procedure TConformitaForm.CopiaimmaginedisfondodallasezioneTERMO1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePage = TabAllegati4690 then
  begin
    Self.CopiaImmagineDiSfondo(PuzzleTermo, Puzzle1);
    Puzzle1.SfondoImg.Visible := True;
    // In caso di caricamento/eliminazione di uno sfondo del disegno
    // diverso da quello del modello elimina il riferimento al modello stesso.
    DM1.TableConformitaRIFMODEL_CODICE.Clear;

  end
  else if cxPageControl1.ActivePage = TabIdro then
  begin
    Self.CopiaImmagineDiSfondo(PuzzleTermo, PuzzleIdro);

  end;
end;

procedure TConformitaForm.CopiaimmaginedisfondodallasezioneIDRO1Click(Sender: TObject);
begin
  if cxPageControl1.ActivePage = TabAllegati4690 then
  begin
    Self.CopiaImmagineDiSfondo(PuzzleIdro, Puzzle1);
    Puzzle1.SfondoImg.Visible := True;
    // In caso di caricamento/eliminazione di uno sfondo del disegno
    // diverso da quello del modello elimina il riferimento al modello stesso.
    DM1.TableConformitaRIFMODEL_CODICE.Clear;

  end
  else if cxPageControl1.ActivePage = TabTermo then
  begin
    Self.CopiaImmagineDiSfondo(PuzzleIdro, PuzzleTermo);

  end;
end;

procedure TConformitaForm.MenuPuzzlePopup(Sender: TObject);
var
  i: Integer;
begin
  // DIsattiva tutte le voci
  for i := 0 to MenuPuzzle.Items.Count - 1 do
    MenuPuzzle.Items[i].Enabled := False;
  // In base alla sezione attiva abilita le voci appropriate
  Eliminaimmaginedisfondo1.Enabled := True;

  if cxPageControl1.ActivePage = TabAllegati4690 then
  begin
    CopiamuriscrittedallasezioneTERMO1.Enabled := True;
    CopiamuriscrittedallasezioneIDRO1.Enabled := True;
    CopiaimmaginedisfondodallasezioneTERMO1.Enabled := True;
    CopiaimmaginedisfondodallasezioneIDRO1.Enabled := True;
    Caricasfondo1.Enabled := True;

  end
  else if cxPageControl1.ActivePage = TabTermo then
  begin
    CopiamuriscrittedallasezioneGAS1.Enabled := True;
    CopiamuriscrittedallasezioneIDRO1.Enabled := True;
    CopiaimmaginedisfondodallasezioneGAS1.Enabled := True;
    CopiaimmaginedisfondodallasezioneIDRO1.Enabled := True;
    Caricasfondo1.Enabled := True;

  end
  else if cxPageControl1.ActivePage = TabIdro then
  begin
    CopiamuriscrittedallasezioneGAS1.Enabled := True;
    CopiamuriscrittedallasezioneTERMO1.Enabled := True;
    CopiaimmaginedisfondodallasezioneGAS1.Enabled := True;
    CopiaimmaginedisfondodallasezioneTERMO1.Enabled := True;
    Caricasfondo1.Enabled := True;

  end;
end;

procedure TConformitaForm.CopiamuriscrittedallasezioneTERMO1Click(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try

    if cxPageControl1.ActivePage = TabAllegati4690 then
    begin
      Self.CopiaMuri(Puzzle1, QryTermoAltri, QryAltri);

    end
    else if cxPageControl1.ActivePage = TabIdro then
    begin
      Self.CopiaMuri(PuzzleIdro, QryTermoAltri, QryIdroAltri);

    end;

  finally
    DM1.CloseWait;
  end;
end;

procedure TConformitaForm.CopiamuriscrittedallasezioneGAS1Click(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try

    if cxPageControl1.ActivePage = TabTermo then
    begin
      Self.CopiaMuri(PuzzleTermo, QryAltri, QryTermoAltri);

    end
    else if cxPageControl1.ActivePage = TabIdro then
    begin
      Self.CopiaMuri(PuzzleIdro, QryAltri, QryIdroAltri);

    end;

  finally
    DM1.CloseWait;
  end;
end;

procedure TConformitaForm.CopiamuriscrittedallasezioneIDRO1Click(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try

    if cxPageControl1.ActivePage = TabAllegati4690 then
    begin
      Self.CopiaMuri(Puzzle1, QryIdroAltri, QryAltri);

    end
    else if cxPageControl1.ActivePage = TabTermo then
    begin
      Self.CopiaMuri(PuzzleTermo, QryIdroAltri, QryTermoAltri);

    end;

  finally
    DM1.CloseWait;
  end;
end;

procedure TConformitaForm.Eliminaimmaginedisfondo1Click(Sender: TObject);
var
  CurrentPuzzle: TPuzzle;
begin
  // Determina quale Disegno è visibile
  if cxPageControl1.ActivePage = TabAllegati4690 then
    CurrentPuzzle := Puzzle1
  else if cxPageControl1.ActivePage = TabTermo then
    CurrentPuzzle := PuzzleTermo
  else if cxPageControl1.ActivePage = TabIdro then
    CurrentPuzzle := PuzzleIdro;

  if DM1.Messaggi('Elimina immagine di sfondo.', 'Confermi di voler eliminare l''immagine di sfondo?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    CurrentPuzzle.SfondoImg.Picture.Bitmap.FreeImage;
    CurrentPuzzle.SfondoImg.Visible := False;
    // In caso di caricamento/eliminazione di uno sfondo del disegno
    // diverso da quello del modello elimina il riferimento al modello stesso.
    DM1.TableConformitaRIFMODEL_CODICE.Clear;
  end;
end;

procedure TConformitaForm.PageControl1Change(Sender: TObject);
begin
  // Se la pagina selezionata è quella dell'elenco del materiale abilita
  // il pulsante apertura della scheda altrimenti no
  if PageControl1.ActivePage = TabElencoMateriale then
  begin
    RxSpeedButtonVisualizza.Enabled := True;
    GridRT.SetFocus;
  end
  else
  begin
    RxSpeedButtonVisualizza.Enabled := False;
  end;
end;

procedure TConformitaForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then
  begin
    fAllegatiForm.Free;
  end;
end;

procedure TConformitaForm.PanelNoteAllegatiResize(Sender: TObject);
begin
  // IMposta la posizione della client area e i relativi margini
  MainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(Self, FormMainPanel, ClientArea, SplitterAllegati, True, True);
end;

procedure TConformitaForm.tvRTDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  // Controlla il mittente per accettare o meno l'operazione
  if (Source is TListView) and (RxSpeedModifica.Down) then
  begin
    if (Source as TListView).Name = 'ListViewExpDoc' then
    begin
      Accept := True;
    end;
  end;
end;

procedure TConformitaForm.tvRTEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
var
  DC: TcxCustomDataController;
begin
  AAllow := True;
  DC := tvRT.DataController;
  // Se si stà cercando di editare le note ma il campo che indica il tipo di dato da inserire nella dichiarazione
  // per l'ente GAS = Tubo oppure Cucina non fà editare le note.
  if (AItem = tvRTNote) and ((DC.DisplayTexts[DC.FocusedRecordIndex, tvRTDichEnteGas.Index] = 'Cucina') or
    (DC.DisplayTexts[DC.FocusedRecordIndex, tvRTDichEnteGas.Index] = 'Tubo')) then
  begin
    AAllow := False;
  end;
end;

end.
