unit FormAnagCli;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Buttons,
  Mask, Menus, IniFiles, Db, IBODataset,
  IB_Components, bmpPanel, MAURI_SB, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxPC, FormGMap,
  cxSplitter, FormAllegati, cxCheckBox, cxGraphics, cxCalendar, cxPCdxBarPopupMenu,
  cxLookAndFeels, cxLookAndFeelPainters, cxGroupBox, cxRadioGroup, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxBarBuiltInMenu;

const
  RESPIMP_TOP = 34;
  RESPIMP_MIDDLE = 44;
  RESPIMP_BOTTOM = 51;

type
  TAnagCliForm = class(TForm)
    MenuStampe: TPopupMenu;
    Schedaanagraficacliente1: TMenuItem;
    ClientTopPanel: TbmpPanel;
    QrySogg: TIBOQuery;
    SourceSogg: TDataSource;
    QrySoggCODICE: TIntegerField;
    QrySoggRAGIONESOCIALE: TStringField;
    QrySoggINDIRIZZO: TStringField;
    QrySoggCITTA: TStringField;
    QrySoggCAP: TStringField;
    QrySoggPROVINCIA: TStringField;
    QrySoggTELEFONO: TStringField;
    QrySoggFAX: TStringField;
    QrySoggCELLULARE: TStringField;
    QrySoggCHIEDEREDI: TStringField;
    QrySoggSCONTO: TSmallintField;
    QrySoggINDIRIZZODESTINAZMERCI: TStringField;
    QrySoggCITTADESTINAZMERCI: TStringField;
    QrySoggCAPDESTINAZMERCI: TStringField;
    QrySoggPROVINCIADESTINAZMERCI: TStringField;
    QrySoggLISTINO: TSmallintField;
    QrySoggCONTOCORRENTE: TStringField;
    QrySoggPAGAMENTO: TIntegerField;
    QrySoggCLIENTEFORNITORE: TStringField;
    QrySoggCODICEIVA: TIntegerField;
    QrySoggPARTITAIVA: TStringField;
    QrySoggSITOINTERNET: TStringField;
    QrySoggATTIVITASVOLTA: TStringField;
    QrySoggDATANASCITA: TDateTimeField;
    QrySoggLUOGONASCITA: TStringField;
    QrySoggSESSO: TStringField;
    QrySoggTELEX: TStringField;
    QrySoggCATEGORIA1: TStringField;
    QrySoggCATEGORIA2: TStringField;
    QrySoggCATEGORIA3: TStringField;
    QrySoggCATEGORIA4: TStringField;
    QrySoggCATEGORIA5: TStringField;
    QrySoggJOLLY1: TStringField;
    QrySoggJOLLY2: TStringField;
    QrySoggJOLLY3: TStringField;
    QrySoggJOLLY4: TStringField;
    QrySoggJOLLY5: TStringField;
    QrySoggJOLLY6: TStringField;
    QrySoggJOLLY7: TStringField;
    QrySoggJOLLY8: TStringField;
    QrySoggJOLLY9: TStringField;
    QrySoggJOLLY10: TStringField;
    QrySoggJOLLY11: TStringField;
    QrySoggJOLLY12: TStringField;
    QrySoggJOLLY13: TStringField;
    QrySoggJOLLY14: TStringField;
    QrySoggJOLLY15: TStringField;
    QrySoggJOLLY16: TStringField;
    QrySoggJOLLY17: TStringField;
    QrySoggJOLLY18: TStringField;
    QrySoggJOLLY19: TStringField;
    QrySoggJOLLY20: TStringField;
    QrySoggJOLLY21: TStringField;
    QrySoggJOLLY22: TStringField;
    QrySoggJOLLY23: TStringField;
    QrySoggJOLLY24: TStringField;
    QrySoggJOLLY25: TStringField;
    QrySoggJOLLY26: TStringField;
    QrySoggJOLLY27: TStringField;
    QrySoggJOLLY28: TStringField;
    QrySoggJOLLY29: TStringField;
    QrySoggJOLLY30: TStringField;
    QrySoggJOLLY31: TStringField;
    QrySoggJOLLY32: TStringField;
    QrySoggJOLLY33: TStringField;
    QrySoggJOLLY34: TStringField;
    QrySoggJOLLY35: TStringField;
    QrySoggJOLLY36: TStringField;
    QrySoggJOLLY37: TStringField;
    QrySoggJOLLY38: TStringField;
    QrySoggJOLLY39: TStringField;
    QrySoggJOLLY40: TStringField;
    QrySoggJOLLY41: TStringField;
    QrySoggJOLLY42: TStringField;
    QrySoggJOLLY43: TStringField;
    QrySoggJOLLY44: TStringField;
    QrySoggJOLLY45: TStringField;
    QrySoggJOLLY46: TStringField;
    QrySoggJOLLY47: TStringField;
    QrySoggJOLLY48: TStringField;
    QrySoggJOLLY49: TStringField;
    QrySoggJOLLY50: TStringField;
    QrySoggNOTE: TStringField;
    QrySoggCODICERIF: TIntegerField;
    QrySoggRAGSOCRIF: TStringField;
    QrySoggINDIRIZZORIF: TStringField;
    QrySoggCITTARIF: TStringField;
    QrySoggCAPRIF: TStringField;
    QrySoggPROVINCIARIF: TStringField;
    QrySoggTITOLO: TStringField;
    QrySoggABI: TStringField;
    QrySoggCAB: TStringField;
    QrySoggCODICEDESTINAZMERCI: TIntegerField;
    QrySoggRAGSOCDESTINAZMERCI: TStringField;
    QrySoggEMAIL: TStringField;
    QrySoggSINCHRO: TStringField;
    QrySoggSALTAMESE1: TStringField;
    QrySoggSALTAMESE2: TStringField;
    QrySoggSALTAMESE3: TStringField;
    QrySoggSALTAMESE4: TStringField;
    QrySoggSALTAMESE5: TStringField;
    QrySoggSALTAMESE6: TStringField;
    QrySoggSALTAMESE7: TStringField;
    QrySoggSALTAMESE8: TStringField;
    QrySoggSALTAMESE9: TStringField;
    QrySoggSALTAMESE10: TStringField;
    QrySoggSALTAMESE11: TStringField;
    QrySoggSALTAMESE12: TStringField;
    QrySoggSALTAMESESPOSTAALGIORNO: TIntegerField;
    QrySoggSPOSTASCADALGIORNO: TIntegerField;
    QrySoggADDEBITASPESE: TStringField;
    Stampaetichettecliente1: TMenuItem;
    QrySoggCIN: TStringField;
    QrySoggSPESEINCASSO: TIBOFloatField;
    QrySoggNUMCIVICO: TStringField;
    QrySoggSCALA: TStringField;
    QrySoggPIANO: TStringField;
    QrySoggINTERNO: TStringField;
    QrySoggCODICEFISCALE: TStringField;
    QrySoggNUMCIVICODESTINAZMERCI: TStringField;
    QrySoggNUMCIVICORIF: TStringField;
    QrySoggSTATODESCRIZIONE: TStringField;
    QrySoggSTATOFOREGROUND: TStringField;
    QrySoggSTATOBACKGROUND: TStringField;
    QrySoggFORNITORECONLISTINO: TStringField;
    QrySoggIMPORTOFIDO: TIBOFloatField;
    QrySoggAGENTE: TStringField;
    QrySoggAGENTE2: TStringField;
    QrySoggAGENTE3: TStringField;
    QrySoggAGENTE4: TStringField;
    FormMainPanel: TPanel;
    MainPageControl: TcxPageControl;
    TabAnagrafica: TcxTabSheet;
    ClientArea: TScrollBox;
    PanelBancaPagamento: TPanel;
    Label40: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    BitBtnBanca: TSpeedButtonRollOver;
    BitBtnPagamento: TSpeedButtonRollOver;
    Label46: TLabel;
    Label55: TLabel;
    DescrizionePagamento: TEdit;
    DBEdit22: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    Banca: TEdit;
    ABI: TEdit;
    CAB: TEdit;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
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
    LabelJolly11: TLabel;
    LabelJolly12: TLabel;
    LabelJolly13: TLabel;
    LabelJolly14: TLabel;
    LabelJolly15: TLabel;
    LabelJolly16: TLabel;
    LabelJolly17: TLabel;
    LabelJolly18: TLabel;
    LabelJolly19: TLabel;
    LabelJolly20: TLabel;
    LabelJolly21: TLabel;
    LabelJolly22: TLabel;
    LabelJolly23: TLabel;
    LabelJolly24: TLabel;
    LabelJolly25: TLabel;
    LabelJolly26: TLabel;
    LabelJolly27: TLabel;
    LabelJolly28: TLabel;
    LabelJolly29: TLabel;
    LabelJolly30: TLabel;
    LabelJolly31: TLabel;
    LabelJolly32: TLabel;
    LabelJolly33: TLabel;
    LabelJolly34: TLabel;
    LabelJolly35: TLabel;
    LabelJolly36: TLabel;
    LabelJolly37: TLabel;
    LabelJolly38: TLabel;
    LabelJolly39: TLabel;
    LabelJolly40: TLabel;
    LabelJolly41: TLabel;
    LabelJolly42: TLabel;
    LabelJolly43: TLabel;
    LabelJolly44: TLabel;
    LabelJolly45: TLabel;
    LabelJolly46: TLabel;
    LabelJolly47: TLabel;
    LabelJolly48: TLabel;
    LabelJolly49: TLabel;
    LabelJolly50: TLabel;
    LabelTitoloJolly1: TLabel;
    LabelTitoloJolly2: TLabel;
    LabelTitoloJolly3: TLabel;
    LabelTitoloJolly4: TLabel;
    LabelTitoloJolly5: TLabel;
    LabelTitoloJolly6: TLabel;
    LabelTitoloJolly7: TLabel;
    LabelTitoloJolly8: TLabel;
    LabelTitoloJolly9: TLabel;
    LabelTitoloJolly10: TLabel;
    LabelTitoloJolly11: TLabel;
    LabelTitoloJolly12: TLabel;
    LabelTitoloJolly13: TLabel;
    LabelTitoloJolly14: TLabel;
    LabelTitoloJolly15: TLabel;
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
    DBEJolly11: TDBEdit;
    DBEJolly12: TDBEdit;
    DBEJolly13: TDBEdit;
    DBEJolly14: TDBEdit;
    DBEJolly15: TDBEdit;
    DBEJolly16: TDBEdit;
    DBEJolly17: TDBEdit;
    DBEJolly18: TDBEdit;
    DBEJolly19: TDBEdit;
    DBEJolly20: TDBEdit;
    DBEJolly21: TDBEdit;
    DBEJolly22: TDBEdit;
    DBEJolly23: TDBEdit;
    DBEJolly24: TDBEdit;
    DBEJolly25: TDBEdit;
    DBEJolly26: TDBEdit;
    DBEJolly27: TDBEdit;
    DBEJolly28: TDBEdit;
    DBEJolly29: TDBEdit;
    DBEJolly30: TDBEdit;
    DBEJolly31: TDBEdit;
    DBEJolly32: TDBEdit;
    DBEJolly33: TDBEdit;
    DBEJolly34: TDBEdit;
    DBEJolly35: TDBEdit;
    DBEJolly36: TDBEdit;
    DBEJolly37: TDBEdit;
    DBEJolly38: TDBEdit;
    DBEJolly39: TDBEdit;
    DBEJolly40: TDBEdit;
    DBEJolly50: TDBEdit;
    DBEJolly49: TDBEdit;
    DBEJolly48: TDBEdit;
    DBEJolly47: TDBEdit;
    DBEJolly46: TDBEdit;
    DBEJolly45: TDBEdit;
    DBEJolly44: TDBEdit;
    DBEJolly43: TDBEdit;
    DBEJolly42: TDBEdit;
    DBEJolly41: TDBEdit;
    PanelDestinazioneMerce: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label38: TLabel;
    Label44: TLabel;
    BitBtnDestinazioneMerci: TSpeedButtonRollOver;
    Label52: TLabel;
    DBEdit18: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit3: TDBEdit;
    PanelCategorie: TPanel;
    LabelCategoria1: TLabel;
    LabelCategoria2: TLabel;
    LabelCategoria3: TLabel;
    LabelCategoria4: TLabel;
    LabelCategoria5: TLabel;
    LabelTitoloCategorie1: TLabel;
    LabelTitoloCategorie2: TLabel;
    LabelTitoloCategorie3: TLabel;
    FinalLineCategorie: TBevel;
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
    PanelRiferimentoSoggetto: TPanel;
    Label200: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label37: TLabel;
    LabelRiferimentoSoggetto: TLabel;
    BitBtnRiferimentoSoggetto: TSpeedButtonRollOver;
    Label53: TLabel;
    DBEdit11: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit4: TDBEdit;
    MainPanelDatiAnagrafici: TPanel;
    Label72: TLabel;
    PanelDatiAnagrafici: TPanel;
    Label28: TLabel;
    LabelRagioneSociale: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    LabelStatoDocumento: TLabel;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    RagioneSociale: TDBEdit;
    Indirizzo: TDBEdit;
    Citta: TDBEdit;
    Provincia: TDBEdit;
    CAP: TDBEdit;
    PanelTipoSoggetto: TPanel;
    DBComboBoxTipoSoggetto: TDBComboBox;
    NumCivico: TDBEdit;
    Scala: TDBEdit;
    Piano: TDBEdit;
    Interno: TDBEdit;
    DBEditStatoDocumento: TDBEdit;
    Codice: TDBEdit;
    PanelDataNascita: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    PanelAttivitaSvolta: TPanel;
    Label1: TLabel;
    DBEdit13: TDBEdit;
    PanelPartitaIVA: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label51: TLabel;
    DBEdit12: TDBEdit;
    DBECodiceFiscale: TDBEdit;
    MainPanelRecapiti: TPanel;
    Label19: TLabel;
    PanelTelefono: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label24: TLabel;
    Telefono: TDBEdit;
    Fax: TDBEdit;
    Cellulare: TDBEdit;
    DBEdit24: TDBEdit;
    PanelInternet: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    BitBtnWWW: TSpeedButtonRollOver;
    Email: TDBEdit;
    DBEdit23: TDBEdit;
    PanelChiedereDi: TPanel;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    PanelListinoSconto: TPanel;
    Label43: TLabel;
    Label9: TLabel;
    Label25: TLabel;
    Panel3: TPanel;
    DBComboBox1: TDBComboBox;
    DBEdit16: TDBEdit;
    PanelAgenti: TPanel;
    LabelAgente: TLabel;
    LabelAgente2: TLabel;
    LabelAgente3: TLabel;
    LabelAgente4: TLabel;
    dbeAgente: TcxDBComboBox;
    dbeAgente2: TcxDBComboBox;
    dbeAgente3: TcxDBComboBox;
    dbeAgente4: TcxDBComboBox;
    PanelListinoFornitore: TPanel;
    Label54: TLabel;
    DBCheckBox14: TDBCheckBox;
    TabMappa: TcxTabSheet;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    QrySoggNOTEPRIVATE: TMemoField;
    PanelNote: TPanel;
    Label16: TLabel;
    dbeNote: TDBMemo;
    dbeNotePrivateSoggetto: TDBMemo;
    PanelCheckNotePrivateSoggetto: TPanel;
    cbVediNotePrivateSoggetto: TcxCheckBox;
    TimerBlink: TTimer;
    Label335: TLabel;
    Palazzina: TcxDBTextEdit;
    QrySoggPALAZZO: TStringField;
    QrySoggRITACCPERC: TIBOFloatField;
    Label56: TLabel;
    DBEdit6: TDBEdit;
    PanelComunicazioniAutomatiche: TPanel;
    Label57: TLabel;
    Label58: TLabel;
    dbeComSms: TcxDBCheckBox;
    dbeComEmail: TcxDBCheckBox;
    dbeComLettera: TcxDBCheckBox;
    QrySoggCOM_SMS: TStringField;
    QrySoggCOM_EMAIL: TStringField;
    QrySoggCOM_LETTERA: TStringField;
    PanelAltriDati: TPanel;
    Label59: TLabel;
    cxDBCheckBox2: TcxDBCheckBox;
    Label60: TLabel;
    dbeCodiceStatoEstero: TcxDBComboBox;
    dbeDescrizioneStatoEstero: TcxDBTextEdit;
    QrySoggESTERO: TStringField;
    QrySoggESTERO_CODICE: TStringField;
    QrySoggESTERO_DESCRIZIONE: TStringField;
    QrySoggESTERO_SIGLA: TStringField;
    dbeSiglaStatoEstero: TcxDBTextEdit;
    DBEDataNasc: TcxDBDateEdit;
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
    RxSpeedButtonSubSogg: TSpeedButton;
    QrySoggPA_CODICEDESTINATARIO: TStringField;
    QrySoggPA_RIFAMMINISTRAZIONE: TStringField;
    QrySoggNAZIONESIGLA: TStringField;
    QrySoggNOME: TStringField;
    QrySoggCOGNOME: TStringField;
    QrySoggTIPOPERSONA: TStringField;
    QrySoggCODICEEORI: TStringField;
    LabelNome: TLabel;
    Nome: TDBEdit;
    LabelCognome: TLabel;
    Cognome: TDBEdit;
    TipoPersona: TcxDBRadioGroup;
    LabelTipoPersona: TLabel;
    Shape4: TShape;
    PanelTitolo: TPanel;
    Label7: TLabel;
    DBEdit33: TDBEdit;
    Label45: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label67: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label68: TLabel;
    Label69: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label70: TLabel;
    Label71: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label73: TLabel;
    Label74: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    QrySoggESIGIBILITAIVA: TStringField;
    Shape3: TShape;
    QrySoggESTERO_UE: TStringField;
    dbeExtraUE: TcxDBRadioGroup;
    QrySoggPEC: TStringField;
    Label20: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label61: TLabel;
    QrySoggADG1_TIPODATO: TStringField;
    QrySoggADG1_RIFERIMENTOTESTO: TStringField;
    QrySoggADG1_RIFERIMENTONUMERO: TIBOFloatField;
    QrySoggADG1_RIFERIMENTODATA: TDateTimeField;
    QrySoggADG2_TIPODATO: TStringField;
    QrySoggADG2_RIFERIMENTOTESTO: TStringField;
    QrySoggADG2_RIFERIMENTONUMERO: TIBOFloatField;
    QrySoggADG2_RIFERIMENTODATA: TDateTimeField;
    PanelAltriDatiGestionaliRighiFE: TPanel;
    Label62: TLabel;
    Label75: TLabel;
    Shape1: TShape;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    dbeADG1_TipoDato: TcxDBTextEdit;
    dbeADG1_RiferimentoTesto: TcxDBTextEdit;
    dbeADG1_RiferimentoNumero: TcxDBTextEdit;
    dbeADG1_RiferimentoData: TcxDBTextEdit;
    dbeADG2_TipoDato: TcxDBTextEdit;
    dbeADG2_RiferimentoTesto: TcxDBTextEdit;
    dbeADG2_RiferimentoNumero: TcxDBTextEdit;
    dbeADG2_RiferimentoData: TcxDBTextEdit;
    dbeDisabilitaControllaCodFisc: TcxDBCheckBox;
    QrySoggDISABILITACONTROLLOCODFISC: TStringField;
    QrySoggDESCRIZIONEIVA: TStringField;
    DBEFOrzaIVA: TDBEdit;
    BitBtnForzaIva: TSpeedButtonRollOver;
    PopupMenuAzzeraAliquotaIVA: TPopupMenu;
    AzzeraAliquotaIVA1: TMenuItem;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    QrySoggREGIMEFISCALESIGLA: TStringField;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    Label63: TLabel;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CaricaLayout;
    procedure DBComboBoxTipoSoggettoChange(Sender: TObject);
    procedure DBComboBoxTipoSoggettoExit(Sender: TObject);
    procedure Schedaanagraficacliente1Click(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedButtonSubSoggClick(Sender: TObject);
    procedure Categ1DropDown(Sender: TObject);
    procedure BitBtnWWWClick(Sender: TObject);
    procedure BitBtnBancaClick(Sender: TObject);
    procedure BitBtnPagamentoClick(Sender: TObject);
    procedure BitBtnDestinazioneMerciClick(Sender: TObject);
    procedure BitBtnRiferimentoSoggettoClick(Sender: TObject);
    procedure QrySoggBeforePost(DataSet: TDataSet);
    procedure QrySoggCODICERIFChange(Sender: TField);
    procedure QrySoggCODICEDESTINAZMERCIChange(Sender: TField);
    procedure Stampaetichettecliente1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure QrySoggBeforeEdit(DataSet: TDataSet);
    procedure dbeAgenteKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure MainPageControlChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeAgentePropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgentePropertiesInitPopup(Sender: TObject);
    procedure dbeAgente2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente4PropertiesInitPopup(Sender: TObject);
    procedure cbVediNotePrivateSoggettoPropertiesChange(Sender: TObject);
    procedure TimerBlinkTimer(Sender: TObject);
    procedure QrySoggAfterOpen(DataSet: TDataSet);
    procedure dbeCodiceStatoEsteroPropertiesInitPopup(Sender: TObject);
    procedure dbeCodiceStatoEsteroPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxDBCheckBox2PropertiesChange(Sender: TObject);
    procedure TipoPersonaPropertiesChange(Sender: TObject);
    procedure CognomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBoxTipoSoggettoEnter(Sender: TObject);
    procedure BitBtnForzaIvaClick(Sender: TObject);
    procedure AzzeraAliquotaIVA1Click(Sender: TObject);
    procedure DBEFOrzaIVAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AzzeraStato1Click(Sender: TObject);
    procedure DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    // FOrm della mappa
    fMapForm: TGmapForm;

    PrecFornitoreConListino: Boolean;

    // Flag che decide se, nel caso di una persona giuridica, devono rimanere
    //  visibili anche Nome e Cognome oppure no (serve per gli RCEE...)
    FPersonaGiuridicaCognomeNome: Boolean;

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

    procedure CaricaTitoli;
    procedure EnableDisableToolsBtn;
    procedure DistruggiMappa;
    procedure ImpostaDimensioniPannelliNote;
    procedure ControllaEvidenziazioneNotePrivateImpianto;
    procedure SetNotePrivateSoggetto_Evidenzia(const Value: Boolean);
    procedure SetNotePrivateSoggetto_InEvidenza(const Value: Boolean);
    procedure AggiornaImpianti;
  public
    { Public declarations }
    // Queste contengono i riferimenti al record da visualizzare/editare
    CodiceCliente:Longint;
    // Eventuale tipo di soggetto per crearne uno nuovo
    TipoNuovoSoggetto: String;
    // Proprietà che punta alla form della mappa
    property MapForm:TGmapForm read fMapForm write fMapForm;

    // Proprietà che viene usata per far lampeggiare le prescrizioni se ci sono e che indica se in questo momento
    //  è in evidenza oppure no
    property NotePrivateSoggetto_InEvidenza:Boolean read fNotePrivateSoggetto_InEvidenza write SetNotePrivateSoggetto_InEvidenza;
    // Proprietà che indica se le prescrizioni sono presenti e quindi sono da evidenziare oppure no
    property NotePrivateSoggetto_Evidenzia:Boolean read fNotePrivateSoggetto_Evidenzia write SetNotePrivateSoggetto_Evidenzia;

  end;

var
   AnagCliForm: TAnagCliForm;

implementation

uses DataModule1, main, QRSchedaCliente,
  FormHelp, FormSubSogg, FormPagamenti,
  FormArchivioBanche, SchedaClienti, StrUtils, DataModule2, FormConfirm, system.Variants,
  FormAliquoteIVA;

{$R *.DFM}



// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che crea la form degli allegati se questa non esiste già e la
  //  apre, alla fine esegue l'interrogazione per mostrare gli allegati.
  procedure TAnagCliForm.Allegati_CreaForm;
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

  // Procedure che aggiorna i filtri di collegamento della form degli allegati
  //  con la form attuale
  procedure TAnagCliForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QrySoggCODICE.IsNull then fAllegatiForm.Filter_CodSogg := QrySoggCODICE.Value;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TAnagCliForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QrySogg.State = dsInsert) then begin
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






















procedure TAnagCliForm.CaricaTitoli;
begin
  // Caricamento titoli e etichette dei campi
  LabelAgente.Caption := DM1.GridsColumnAgenteCaption;
end;



procedure TAnagCliForm.CaricaLayout;     // Personale
const
  MARGIN_UP = 20;
var
   LO : TMemIniFile;
   Contatore, YY, Sep, YYY, SubYY, TmpInt: Integer;
   Sez, TmpStr, TitoloStr : String;
   TmpDBE : TDBEdit;
   TmpDBL : TPanel;
   TmpLabel, TmpTitolo : TLabel;
begin
   // Carica i titoli dei campi
   CaricaTitoli;
   // Inizializza YY in modo che non dia il warning
   YY := MARGIN_UP;

   // Apre il file che contiene i layouts di stampa e visualizzazione dei documenti.
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
      // Carica i tipi di soggetto nella combo-box relativa solo se la lista è vuota
      //  cioè solo la prima volta
      if DBComboBoxTipoSoggetto.Items.Count = 0 then begin
         TmpStr := LO.ReadString('FormAnagraficaClienti', 'TipoSoggetto', 'Soggetto');
         while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
            DBComboBoxTipoSoggetto.Items.Add(DM1.RitornaTestoPrimaDi('_', TmpStr, True));
         end;
      end;
      // Inizializza la stringa che contiene il nome delle sezione nel file *.INI dove sono
      //  contenuti i parametri che ci interessano
      Sez := DBComboBoxTipoSoggetto.Text;
      if Sez = '' then begin
         MainPanelDatiAnagrafici.Top := 10;
         MainPanelDatiAnagrafici.Height := 34;
      end else begin
         // Flag che decide se, nel caso di una persona giuridica, devono rimanere
         //  visibili anche Nome e Cognome oppure no (serve per gli RCEE...)
         FPersonaGiuridicaCognomeNome := LO.ReadBool(Sez, 'PersonaGiuridicaCognomeNome', False);
         TipoPersonaPropertiesChange(nil);
         // Abilita o meno il pulsante per accedere alla form SubSogg
         if LO.ReadString(Sez, 'ButtonSubSogg', '0') <> '0' then begin
            RxSpeedButtonSubSogg.Caption := LO.ReadString(Sez, 'ButtonSubSogg', '0');
            RxSpeedButtonSubSogg.Visible := True;
         end else begin
            RxSpeedButtonSubSogg.Visible := False;
         end;
         // Inizializza la variabile che contiene il valore della posizione attuale
         //  del pennello di  visualizzazione tramite il quale ci si regola per la visualizzazione
         //  dei componenti.
  //       YY := LO.ReadInteger(Sez, 'Top', 50);
         YY := MARGIN_UP;
         // Carica la separazione verticale tra i componenti su una variabile locale per comodità
         Sep := LO.ReadInteger(Sez, 'SeparazioneVerticale', 5);
         // ---------------------------------- MAIN PANEL DATI ANAGRAFICI ----------------------------------------
         // Il MainPanelDatiAnagrafici è sempre attivo.
            SubYY := SUBPANEL_TOP;
            // PANEL DATI ANAGRAFICI (Sempre attivo)
            PanelDatiAnagrafici.Top     := SubYY;
            PanelDatiAnagrafici.Visible := True;
            SubYY := SubYY + PanelDatiAnagrafici.Height;
            // PANEL TITOLO
            PanelTitolo.Visible := LO.ReadBool(Sez, 'PanelTitolo', True);
            // PANEL DATA NASCITA
            if LO.ReadBool(Sez, 'PanelDataNascita', False) then begin
               PanelDataNascita.Top     := SubYY;
               PanelDataNascita.Visible := True;
               SubYY := SubYY + PanelDataNascita.Height;
            end else PanelDataNascita.Visible       := False;
            // PANEL ATTIVITA SVOLTA
            if LO.ReadBool(Sez, 'PanelAttivitaSvolta', False) then begin
               PanelAttivitaSvolta.Top     := SubYY;
               PanelAttivitaSvolta.Visible := True;
               SubYY := SubYY + PanelAttivitaSvolta.Height;
            end else PanelAttivitaSvolta.Visible       := False;
            // PANEL IVA
            if LO.ReadBool(Sez, 'PanelPartitaIVA', False) then begin
               PanelPartitaIVA.Top     := SubYY;
               PanelPartitaIVA.Visible := True;
               SubYY := SubYY + PanelPartitaIVA.Height;
            end else PanelPartitaIVA.Visible       := False;
            // Attiva il MainPanel
  //          YY := YY + Sep;
            MainPanelDatiAnagrafici.Top     := YY;
            MainPanelDatiAnagrafici.Visible := True;
            MainPanelDatiAnagrafici.Height  := SubYY + SUBPANEL_FATTORE_CORREZIONE;
            YY := YY + MainPanelDatiAnagrafici.Height;
         // ---------------------------------------------------------------------------------------------------
         // ----- PANEL ALTRI DATI -----
         if LO.ReadBool(Sez, 'PanelAltriDati', True) then begin
            YY := YY + Sep;
            PanelAltriDati.Top     := YY;
            PanelAltriDati.Visible := True;
            YY := YY + PanelAltriDati.Height;
         end else PanelAltriDati.Visible       := False;
         // ----- PANEL NOTE -----
         if LO.ReadBool(Sez, 'PanelNote', False) then begin
            YY := YY + Sep;
            PanelNote.Top     := YY;
            PanelNote.Visible := True;
            YY := YY + PanelNote.Height;
         end else PanelNote.Visible       := False;
         // ---------------------------------- MAIN PANEL RECAPITI ----------------------------------------
         // Se almeno uno dei sottopannelli è attivato, rende visibile il MainPanel
         if (LO.ReadBool(Sez, 'PanelTelefono', False)) or (LO.ReadBool(Sez, 'PanelInternet', False)) or (LO.ReadBool(Sez, 'PanelChiedereDi', False)) then begin
            SubYY := SUBPANEL_TOP;
            // PANEL TELEFONO
            if LO.ReadBool(Sez, 'PanelTelefono', False) then begin
               PanelTelefono.Top     := SubYY;
               PanelTelefono.Visible := True;
               SubYY := SubYY + PanelTelefono.Height;
            end else PanelTelefono.Visible       := False;
            // PANEL INTERNET
            if LO.ReadBool(Sez, 'PanelInternet', False) then begin
               PanelInternet.Top     := SubYY;
               PanelInternet.Visible := True;
               SubYY := SubYY + PanelInternet.Height;
            end else PanelDataNascita.Visible       := False;
            // PANEL CHIEDERE DI
            if LO.ReadBool(Sez, 'PanelChiedereDi', False) then begin
               PanelChiedereDi.Top     := SubYY;
               PanelChiedereDi.Visible := True;
               SubYY := SubYY + PanelChiedereDi.Height;
            end else PanelChiedereDi.Visible       := False;
            // Attiva il MainPanel
            YY := YY + Sep;
            MainPanelRecapiti.Top     := YY;
            MainPanelRecapiti.Visible := True;
            MainPanelRecapiti.Height  := SubYY + SUBPANEL_FATTORE_CORREZIONE;
            YY := YY + MainPanelRecapiti.Height;
         end;
         // ---------------------------------------------------------------------------------------------------
         // ----- PANEL LISTINO SCONTO -----
         if LO.ReadBool(Sez, 'PanelListinoSconto', False) then begin
            YY := YY + Sep;
            PanelListinoSconto.Top     := YY;
            PanelListinoSconto.Visible := True;
            YY := YY + PanelListinoSconto.Height;
            // SubPanel Agenti
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
            PanelAgenti.Visible  := (LO.ReadBool(Sez, 'V_PanelAgenti', True))   and   (   dbeAgente.Visible or dbeAgente.Visible or dbeAgente.Visible or dbeAgente.Visible   );
            // Se il pannello agenti non deve essere visualizzato ridimensiona anche il MainPanel
            if not PanelAgenti.Visible then begin
              PanelListinoSconto.Height  := PanelListinoSconto.Height - PanelAgenti.Height;
            end;
         end else PanelListinoSconto.Visible       := False;
         // ----- PANEL BANCA PAGAMENTO -----
         if LO.ReadBool(Sez, 'PanelBancaPagamento', False) then begin
            YY := YY + Sep;
            PanelBancaPagamento.Top     := YY;
            PanelBancaPagamento.Visible := True;
            YY := YY + PanelBancaPagamento.Height;
         end else PanelBancaPagamento.Visible       := False;
         // ----- PANEL DESTINAZIONE MERCE -----
         if LO.ReadBool(Sez, 'PanelDestinazioneMerce', False) then begin
            YY := YY + Sep;
            PanelDestinazioneMerce.Top     := YY;
            PanelDestinazioneMerce.Visible := True;
            YY := YY + PanelDestinazioneMerce.Height;
         end else PanelDestinazioneMerce.Visible       := False;
         // ----- RIFERIMENTO SOGGETTO -----
         TmpStr := LO.ReadString(Sez, 'RiferimentoSoggetto', '0');
         if TmpStr <> '0' then begin
            LabelRiferimentoSoggetto.Caption := TmpStr;
            // Dimensiona, posiziona e visualizza il pannello
            YY := YY + Sep;
            PanelRiferimentoSoggetto.Top     := YY;
            PanelRiferimentoSoggetto.Visible := True;
            YY := YY + PanelRiferimentoSoggetto.Height;
         end else PanelRiferimentoSoggetto.Visible       := False;
         // ----- PANEL COMUNICAZIONI AUTOMATICHE -----
         if LO.ReadBool(Sez, 'PanelComunicazioniAutomatiche', True) then begin
            YY := YY + Sep;
            PanelComunicazioniAutomatiche.Top     := YY;
            PanelComunicazioniAutomatiche.Visible := True;
            YY := YY + PanelComunicazioniAutomatiche.Height;
         end else PanelComunicazioniAutomatiche.Visible       := False;
         // ----- CATEGORIE -----
         if LO.ReadString(Sez, 'Categoria1', '0') <> '0' then begin
            TmpInt := 1;
            YYY := -1;
            // Cicla per tutte le 6 possibili categorìe
            for Contatore := 1 to 6 do begin
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
                  // POsizione la Final Line
                  FinalLineCategorie.Top := PanelCategorie.Height - FinalLineCategorie.Height;
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
         // ----- CAMPI JOLLY -----
         if LO.ReadString(Sez, 'Jolly1', '0') <> '0' then begin
            TmpInt := 1;
            YYY := -1;
            // Cicla per tutte i 50 possibili campi jolly
            for Contatore := 1 to 50 do begin
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
                  // POsizione la Final Line
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
         // ----- PANEL FORNITORE CON LISTINO -----
         if LO.ReadBool(Sez, 'PanelFornitoreConListino', True) then begin
            YY := YY + Sep;
            PanelListinoFornitore.Top     := YY;
            PanelListinoFornitore.Visible := True;
            YY := YY + PanelListinoFornitore.Height;
         end else PanelListinoFornitore.Visible       := False;
         // ----- PANEL ASLTRI DATI GESTIONALI RIGHI FE -----
         if LO.ReadBool(Sez, 'PanelAltriDatiGestionaliRighiFE', True) then begin
            YY := YY + Sep;
            PanelAltriDatiGestionaliRighiFE.Top     := YY;
            PanelAltriDatiGestionaliRighiFE.Visible := True;
            YY := YY + PanelAltriDatiGestionaliRighiFE.Height;
         end else PanelAltriDatiGestionaliRighiFE.Visible       := False;
     end;
     ClientArea.VertScrollBar.Range := YY + 5;

   finally
     LO.Free;
   end;

end;



procedure TAnagCliForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se nel main menù è selezionata la voce dei dati anagrafici del soggetto, torna
   //  al Tab predefinito a cui andare dopo la selezione del soggettoselezionato.
   //  Altrimenti chiude semplicemente la form
   Close;
   if MainForm.MMItemIsSelected(MainForm.SBSoggetto) then ClientiForm.VaiAlTabDopoSelezioneOggetto;
end;

procedure TAnagCliForm.FormCreate(Sender: TObject);
begin
   // Inizializzazione
   MainPageControl.ActivePage := TabAnagrafica;
   MainPageControlChange(MainPageControl);
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(AnagCliForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Anagrafica cliente)';
   ClientArea.ParentColor := True;
   // Salva l'icona del tipo documento precedente e carica la nuova
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
   // IN base alla selezione dimensiona il pannello Note
   ImpostaDimensioniPannelliNote;
end;

procedure TAnagCliForm.FormKeyUp(Sender: TObject; var Key: Word;
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
               RxSpeedButtonStampaClick(Self);
            end;
         end;
      end;
end;

procedure TAnagCliForm.FormShow(Sender: TObject);
begin
   ClientArea.VertScrollBar.Position := 0;
   DM1.FocusRefresh;
   // In base al valore di 'Tag' apre la form in diverse modalità...
   case Tag of
      // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
      1: begin
         // Imposta la query per carica il soggetto corrente
         QrySogg.Close;
         QrySogg.SQL.Clear;
         QrySogg.SQL.Add('SELECT * FROM CLIENTI WHERE CODICE = ' + IntTostr(CodiceCliente));
         QrySogg.Open;
         // Se non trova il soggetto
         if QrySogg.Eof then begin
            MessageDlg('Cliente non trovato !', mtError, [mbOK], 0);
         end;
      end;
      // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
      2: begin
         // Imposta una query che non deve trovare nulla
         QrySogg.Close;
         QrySogg.SQL.Clear;
         QrySogg.SQL.Add('SELECT * FROM CLIENTI WHERE CODICE = -9999');
         QrySogg.Open;
         // Fà l'append del nuovo record
         QrySogg.Append;
         // Imposta alcuni valori di default
         if Trim(TipoNuovoSoggetto) <> ''
         then QrySoggCLIENTEFORNITORE.Value := TipoNuovoSoggetto;
         QrySoggTIPOPERSONA.Value           := 'F';
         QrySoggLISTINO.Value               := 1;   
         QrySoggADDEBITASPESE.Value         := 'F';
         QrySoggSALTAMESE1.Value            := 'F';
         QrySoggSALTAMESE2.Value            := 'F';
         QrySoggSALTAMESE3.Value            := 'F';
         QrySoggSALTAMESE4.Value            := 'F';
         QrySoggSALTAMESE5.Value            := 'F';
         QrySoggSALTAMESE6.Value            := 'F';
         QrySoggSALTAMESE7.Value            := 'F';
         QrySoggSALTAMESE8.Value            := 'F';
         QrySoggSALTAMESE9.Value            := 'F';
         QrySoggSALTAMESE10.Value           := 'F';
         QrySoggSALTAMESE11.Value           := 'F';
         QrySoggSALTAMESE12.Value           := 'F';
         QrySoggSALTAMESESPOSTAALGIORNO.Value := 0;
         QrySoggSPOSTASCADALGIORNO.Value    := 0;
         QrySoggCOM_SMS.Value               := 'T';
         QrySoggCOM_EMAIL.Value             := 'T';
         QrySoggCOM_LETTERA.Value           := 'T';
         QrySoggESTERO.Value                := 'F';
         QrySoggESTERO_UE.Value             := 'U';
         QrySoggNAZIONESIGLA.Value          := 'IT';
         QrySoggDISABILITACONTROLLOCODFISC.Value := 'F';
         // Imposta alcuni valir di default se specificato nel layouts.ini
         if DM1.CodicePagamentoDefault <> -1 then QrySoggPAGAMENTO.Value := DM1.CodicePagamentoDefault;
         if (DM1.BancaAbiDefault <> '') and (DM1.BancaCabDefault <> '') then begin
           QrySoggABI.Value := DM1.BancaAbiDefault;
           QrySoggCAB.Value := DM1.BancaCabDefault;
         end;
         // Pone il cliente in modifica
         RxSpeedModifica.Down := True;
         RxSpeedModificaClick(Self);
      end;
   end;
   // Carica il layout della form
   CaricaLayout;
   // Carica la descrizione pagamento
   if not QrySoggPagamento.IsNull then DM1.CaricaDescrizionePagamento(QrySoggPagamento.Value, DescrizionePagamento);
   // Carica i dati della banca
   if (not QrySoggABI.IsNull) and (not QrySoggCAB.IsNull) then DM1.CaricaDatiBanca(QrySoggABI.Value, QrySoggCAB.Value, Banca, ABI, CAB);

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if DM1.ModCtrl(MOD_CLIENTI) > 1 then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Focus (l'ho messo quì anche se così se vado su un'altra pagina e poi ritorno non lo ritrovo nella stessa posizione
   //  in cui era precedentemente; questo perhè altrimenti tooenevo che quando passavo a un'altra pagina e poi ritornavo
   //  comunque non veniva ripristinato il focus per niente.
   Indirizzo.SetFocus;
   if RagioneSociale.Visible then
     RagioneSociale.SetFocus
   else if Cognome.Visible then
     Cognome.SetFocus
   else TipoPersona.SetFocus;
   // Se però stiamo creando un nuovo soggetto prima mette il focus sul Tipo di soggetto
   //  NB: Se non siamo in FastSelectionMode
   if (Self.Tag = 2) and (not DM1.FastSelectionMode) then DBComboBoxTipoSoggetto.SetFocus;

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;
end;


// Procedure che determina quali pulsanti degli strumenti sono visibili o no
//  in base alla situazione.
procedure TAnagCliForm.EnableDisableToolsBtn;
begin
  // Uscita
  RxSpeedButtonUscita.Enabled     := not RxSpeedModifica.Down;
  // Nuovo/Crea
//  RxSpeedButtonNuovo.Enabled      := RxSpeedModifica.Down;
  // Elimina
//  RxSpeedButtonElimina.Enabled    := RxSpeedModifica.Down and (   (PageControlPagineDocumento.ActivePage = TabAllegati) or (PageControlPagineDocumento.ActivePage = TabOP)   );
  // Stampa
  RxSpeedButtonStampa.Enabled     := (not RxSpeedModifica.Down);
  // Apri/Visualizza
//  RxSpeedButtonVisualizza.Enabled := (not RxSpeedModifica.Down) and (   (PageControlPagineDocumento.ActivePage = TabAllegati)   );
end;




procedure TAnagCliForm.RxSpeedModificaClick(Sender: TObject);
var
   MR: TModalResult;
begin
     // Stato di attesa
     DM1.Attendere;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then begin
       // Prima di avviare la modifica controlla se il record è stato o meno creato da questa postazione e quindi
       //  se si è autorizzati alla sua modifica (se sincronizzazione attiva).
       if not DM1.ControlloSeModificabileDallaStazione(CodiceCliente) then begin RxSpeedModifica.Down := False; DM1.ChiudiAttendere; Exit; end;
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QrySogg.Edit;
          // Aggiunge un livello di bloccaggio dell'IconaDocTipo per disabilitare il MainMenu
          MainForm.BloccaIconaDocTipo(True, Name);
          // Modica i pulsanti e i colori dei campi per la modifica
          EnableDisableToolsBtn;
          RxSpeedButtonSubSogg.Enabled       := False;
          BitBtnWWW.Enabled                  := False;
          BitBtnRiferimentoSoggetto.Enabled  := True;
          BitBtnDestinazioneMerci.Enabled    := True;
          BitBtnPagamento.Enabled            := True;
          BitBtnBanca.Enabled                := True;
          BitBtnSelezioneStato.Enabled       := True;
          BitBtnForzaIva.Enabled              := True;
          if MainForm.SSChiudi.Visible then MainForm.SSChiudi.Enabled := False;
          DM1.ColoraTuttiCampi(AnagCliForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          //  Prima però lo sposta su un altro campo perchè altrimenti incasina l'evidenziazione del campo
          if MainPageControl.ActivePage = TabAnagrafica then begin
            DBComboBoxTipoSOggetto.SetFocus;
            if RagioneSociale.Visible then
              RagioneSociale.SetFocus
            else if Cognome.Visible then
              Cognome.SetFocus
            else TipoPersona.SetFocus;
          end;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end else begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
          QrySogg.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Porta il focus sul primo campo
               //  Prima però lo sposta su un altro campo perchè altrimenti incasina l'evidenziazione del campo
               if MainPageControl.ActivePage = TabAnagrafica then begin
                 DBComboBoxTipoSoggetto.SetFocus;
                 if RagioneSociale.Visible then
                   RagioneSociale.SetFocus
                 else if Cognome.Visible then
                   Cognome.SetFocus
                 else TipoPersona.SetFocus;
               end;
               // Controllo Codice FIscale e Partita IVA
               //  NB: Non controlla se cliente estero (partit IVA e Codice Fiscale sono diversi se esteri quindi fallirebbero tutti
               if not DM2.ControlloCodiceFiscalePartitaIva(QrySoggNOME.AsString, QrySoggCOGNOME.AsString, QrySoggCODICEFISCALE.AsString, QrySoggPARTITAIVA.AsString, QrySoggNAZIONESIGLA.AsString,
                 QrySoggTIPOPERSONA.AsString, False, (QrySoggDISABILITACONTROLLOCODFISC.AsString = 'T')) then
               begin
                 RxSpeedModifica.Down := True;
                 QrySogg.Edit;
                 DM1.ChiudiAttendere;
                 Exit;
               end;
               // Se il responsabile dell'impianto è una persona giuridica la Ragione Sociale
               //  è un campo obbligatorio
               if RagioneSociale.Focused then Self.SelectNext(RagioneSociale, True, True);  // Per essere sicuri che il dato sia confermato
               if (QrySoggTIPOPERSONA.AsString = 'G') and (Trim(QrySoggRAGIONESOCIALE.AsString) = '') then
                 raise Exception.Create('Campo obbligatorio ("Ragione Sociale")');
               // Se il codice cliente è nullo (nuovo cliente) ne assegna uno nuovo.
               if QrySoggCodice.IsNull then begin
                  QrySoggCodice.Value := DM1.ControllaSeBisognaAggiungereIlCodiceChiave(DM1.NextCodice('CLIENTI', 'CODICE'));
               end;
               CodiceCliente := QrySoggCodice.Value;
               QrySogg.Post;
               // Controlla se il codice e la partica IVA non sia già usato da un altro cliente
               //  nel qual caso blocca tutto e avverte della situazione
               if DM1.ClienteEsistente(QrySoggCodice.Value, QrySoggPartitaIVA.Value, QrySoggCODICEFISCALE.Value) then begin
                  if DM1.Messaggi('ATTENZIONE!'
                                 ,'Codice, Partita IVA oppure Codice Fiscale già utilizzato!'#13#13'Il soggetto potrebbe essere già esistente.'#13#13'Annullo la conferma?'
                                 ,'NB: E'' altamente sconsigliabile inserire più volte lo stesso soggetto.'#13#13'Cliccare su "SI" per annullare la conferma e quindi avere la possibilità di modificare i dati oppure di annullare l''inserimento.'
                                 ,[mbYes,mbNo]
                                 ,0
                                 , nil) = mrYes
                  then begin
                    RxSpeedModifica.Down := True;
                    QrySogg.Edit;
                    DM1.ChiudiAttendere;
                    Exit;
                  end;
               end;
               // Decide se gli allegati devono essere già visibili oppure no.
               Allegati_VerificaAbilitazione;
               // Distrugge la mappa in modo che se è cambiato l'indirizzo questa venga ricreata con quello nuovo
               DistruggiMappa;
               // Se si tratta di un nuovo soggetto appena inserito lo seleziona già
               //  come soggetto corrente in modo da poter subito inserire documenti per lui
               //  NB: Solo se siamo in FastSelectionMode
               if DM1.FastSelectionMode and (Self.Tag = 2) then begin
                 ClientiForm.SelezionaSoggettoPratica(QrySoggCODICE.AsInteger, 0);
               end;
          end else if MR = mrNo then begin
               // Se era un nuovo cliente...
               if QrySogg.State = dsInsert then begin
                  // Toglie un livello di bloccaggio dell'IconaDocTipo per riabilitare il MainMenu
                  // L'ho messo anche quì perchè visto che alla fine del blocco c'è l'Exit...
                  MainForm.BloccaIconaDocTipo(False, Name);
                  // Annulla il record ed esce
                  QrySogg.Cancel;
                  Close;
                  DM1.ChiudiAttendere;
                  Exit;
               end else begin
                  // Annulla il record
                  QrySogg.Cancel;
               end;
          end else begin
               RxSpeedModifica.Down := True;
               DM1.ChiudiAttendere;
               Exit;
          end;
          // Toglie un livello di bloccaggio dell'IconaDocTipo per riabilitare il MainMenu
          MainForm.BloccaIconaDocTipo(False, Name);
          // Ripristina i pulsanti e i colori dei campi
          EnableDisableToolsBtn;
          if RxSpeedButtonSubSogg.Visible then RxSpeedButtonSubSogg.Enabled := True;
          BitBtnWWW.Enabled                  := True;
          BitBtnRiferimentoSoggetto.Enabled  := False;
          BitBtnDestinazioneMerci.Enabled    := False;
          BitBtnPagamento.Enabled            := False;
          BitBtnBanca.Enabled                := False;
          BitBtnSelezioneStato.Enabled       := False;
          BitBtnForzaIva.Enabled             := False;
          if MainForm.SSChiudi.Visible then MainForm.SSChiudi.Enabled := True;
          DM1.ColoraTuttiCampi(AnagCliForm, COLOR_NORMALE);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QrySogg.Edit;
          end;
       end;
     end;
     // Chiude l'attesa
     DM1.ChiudiAttendere;
end;

procedure TAnagCliForm.DistruggiMappa;
begin
  if not Assigned(MapForm) then Exit;
  if  (MainPageControl.ActivePage = TabMappa)
  and (DM1.Messaggi('Levante', 'I dati potrebbero essere cambiati!'#13#13'Ricreare la mappa?', '', [mbYes,mbNo], 0, nil) = mrYes)
  then begin
    MapForm.Free;
    MapForm := nil;
    MainPageControlChange(MainPageControl);
  end;
end;

procedure TAnagCliForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Sblocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   // Ripristina l'iconaDocTipoPrecedente
   MainForm.RipristinaIconaDocTipo;

   // Mette manualmente a nil il valore del puntatore alla Form
   AnagCliForm := nil;

   // Se <> nil riseleziona la voce del main menù che era selezionata
   //  prima dell'apertura dell'anagrafica
   if MainForm.PrecSelectedMainMenuItem <> nil then MainForm.MMItemSetSelected(MainForm.PrecSelectedMainMenuItem);
end;

procedure TAnagCliForm.DBComboBoxTipoSoggettoEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TAnagCliForm.DBComboBoxTipoSoggettoExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TAnagCliForm.DBComboBoxTipoSoggettoChange(Sender: TObject);
begin
   // Carica il layout della form
   CaricaLayout;
end;

procedure TAnagCliForm.Schedaanagraficacliente1Click(Sender: TObject);
begin
   // Stampa sulla stampante
   Application.CreateForm(TSchedaClienteQR, SchedaClienteQR);
//   DM1.SettaStampante(SchedaClienteQR, 1);
   if MenuStampe.Tag = 1 then SchedaClienteQR.Print else SchedaClienteQR.Preview;
   SchedaClienteQR.Free;
end;

procedure TAnagCliForm.RxSpeedButtonStampaClick(Sender: TObject);
var
   ClientPoint, ScreenPoint: TPoint;
begin
   // Se siamo nella mappa la stampa ed esce
   if MainPageControl.ActivePage = TabMappa then begin
      MapForm.PrintPreview;
      Exit;
   end;
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

procedure TAnagCliForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   ClientPoint, ScreenPoint: TPoint;
begin
   // *************************************************************************
   //   NB: FACENDO CLICK COL DX RICHIAMA IL MENU' DI STAMPA
   // *************************************************************************
   if Button = mbRight then begin
      // Se siamo nella mappa la stampaed esce
      if MainPageControl.ActivePage = TabMappa then begin
         MapForm.PrintPreview;
         Exit;
      end;
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

procedure TAnagCliForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('SOGGETTI');
end;

procedure TAnagCliForm.RxSpeedButtonSubSoggClick(Sender: TObject);
begin
   Application.CreateForm(TSubSoggForm, SubSoggForm);
   SubSoggForm.Parent := MainForm;
   SubSoggForm.CurrSogg := CodiceCliente;
   SubSoggForm.Show;
end;

procedure TAnagCliForm.Categ1DropDown(Sender: TObject);
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

procedure TAnagCliForm.BitBtnWWWClick(Sender: TObject);
var
   lpszFileExe : array[0..250] of AnsiChar;
   ExecStr: String;
   P:TMemIniFile;
begin
   // Apre il file dei parametri
   P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
    ExecStr := P.ReadString('INTERNET', 'WebBrowser', 'c:\progra~1\intern~1\iexplore.exe') + ' ' + QrySoggSitoInternet.Value;
   P.Free;
   StrPCopy( lpszFileExe, ExecStr);
   WinExec(lpszFileExe, SW_SHOW);
end;

procedure TAnagCliForm.BitBtnBancaClick(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TArchivioBancheForm, ArchivioBancheForm);
      ArchivioBancheForm.Parent := MainForm;
      ArchivioBancheForm.Tag := 999;   // Abilita la selezione
      ArchivioBancheForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagCliForm.BitBtnPagamentoClick(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TPagamentiForm, PagamentiForm);
      PagamentiForm.Parent := MainForm;
      PagamentiForm.Tag := 999;   // Abilita la selezione
      PagamentiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TAnagCliForm.BitBtnDestinazioneMerciClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QrySoggCodiceDestinazMerci, nil, nil, '');
end;

procedure TAnagCliForm.BitBtnForzaIvaClick(Sender: TObject);
begin
  try
    DM1.Attendere;
    // Visualizza la form che permette di selezionare l'aliquota IVA da inserire come
    // aliqouta IVA forzata del documento
    Application.CreateForm(TAliquoteIVAForm, AliquoteIVAForm);
    MainForm.SetParentComponent(AliquoteIVAForm);
    AliquoteIVAForm.Tag := 996; // Abilita la seleziona dell'aliquota IVA
    AliquoteIVAForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TAnagCliForm.BitBtnRiferimentoSoggettoClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QrySoggCodiceRif, nil, nil, '');
end;

procedure TAnagCliForm.QrySoggBeforePost(DataSet: TDataSet);
begin
   // Marca il record come modificato
   DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
   // Se i dati relativi anche agli impianti sono cambiati chiede se si devono aggiornare anche negli impianti oppure no.
   AggiornaImpianti;
end;

procedure TAnagCliForm.AggiornaImpianti;
var
  LID: String;
  LModified: Boolean;
  Qry:TIB_Cursor;
begin
  // Crea, imposta  ed esegue l'oggetto query
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Verifica se si sono modificati alcuni dati che sono presenti anche negli impianti
    LModified := (Trim(QrySoggRAGIONESOCIALE.Value) <> Trim(VarToStr(QrySoggRAGIONESOCIALE.OldValue)))
      or (Trim(QrySoggCITTA.Value) <> Trim(VarToStr(QrySoggCITTA.OldValue)))
      or (Trim(QrySoggCAP.Value) <> Trim(VarToStr(QrySoggCAP.OldValue)))
      or (Trim(QrySoggPROVINCIA.Value) <> Trim(VarToStr(QrySoggPROVINCIA.OldValue)))
      or (Trim(QrySoggINDIRIZZO.Value) <> Trim(VarToStr(QrySoggINDIRIZZO.OldValue)))
      or (Trim(QrySoggNUMCIVICO.Value) <> Trim(VarToStr(QrySoggNUMCIVICO.OldValue)))
      or (Trim(QrySoggTELEFONO.Value) <> Trim(VarToStr(QrySoggTELEFONO.OldValue)))
      or (Trim(QrySoggCELLULARE.Value) <> Trim(VarToStr(QrySoggCELLULARE.OldValue)))
      or (Trim(QrySoggCODICEFISCALE.Value) <> Trim(VarToStr(QrySoggCODICEFISCALE.OldValue)))
      or (Trim(QrySoggPARTITAIVA.Value) <> Trim(VarToStr(QrySoggPARTITAIVA.OldValue)))
      or (Trim(QrySoggTIPOPERSONA.Value) <> Trim(VarToStr(QrySoggTIPOPERSONA.OldValue)));
    if not LModified then
      Exit;
    // Verifica se il soggetto è Presente in qualche impianto in qualche modo
    LID := QrySoggCODICE.AsString;
    Qry.SQL.Add('SELECT FIRST 1 ID FROM PRATICHE WHERE TIPO = ''A'' AND');
    Qry.SQL.Add('(CLIENTE = '+LID+' OR CODICEUT = '+LID+' OR CODICEINST = '+LID+' OR CODICERESPIMP = '+LID+')');
    Qry.Open;
    if Qry.Eof then
      Exit;
    // Chiede conferma
    if not TConfirmForm.ConfirmationRequest('Aggiorna gli impianti', 'Per aggiornare gli impianti con i nuovi dati digita "aggiorna" qui sotto, poi clicca sul bottone "Conferma".', 'aggiorna') then
        Exit;
    // Sostituisce dati proprietario
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE PRATICHE SET');
    Qry.SQL.Add(' RAGSOCCLI = ' + QuotedStr(QrySoggRAGIONESOCIALE.AsString));
    Qry.SQL.Add(',CITTACLI = ' + QuotedStr(QrySoggCITTA.AsString));
    Qry.SQL.Add(',CAPCLI = ' + QuotedStr(QrySoggCAP.AsString));
    Qry.SQL.Add(',PROVINCIACLI = ' + QuotedStr(QrySoggPROVINCIA.AsString));
    Qry.SQL.Add(',INDIRIZZOCLI = ' + QuotedStr(QrySoggINDIRIZZO.AsString));
    Qry.SQL.Add(',NUMCIVICOCLI = ' + QuotedStr(QrySoggNUMCIVICO.AsString));
    Qry.SQL.Add(',TELEFONOCLI = ' + QuotedStr(QrySoggTELEFONO.AsString));
    Qry.SQL.Add(',CELLULARECLI = ' + QuotedStr(QrySoggCELLULARE.AsString));
    Qry.SQL.Add(',CODICEFISCALECLI = ' + QuotedStr(QrySoggCODICEFISCALE.AsString));
    Qry.SQL.Add('WHERE CLIENTE = ' + LID + ' AND TIPO = ''A''');
    Qry.ExecSQL;
    // Sostituisce dati utente/occupante
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE PRATICHE SET');
    Qry.SQL.Add(' RAGSOCUT = ' + QuotedStr(QrySoggRAGIONESOCIALE.AsString));
    Qry.SQL.Add(',CITTAUT = ' + QuotedStr(QrySoggCITTA.AsString));
    Qry.SQL.Add(',CAPUT = ' + QuotedStr(QrySoggCAP.AsString));
    Qry.SQL.Add(',PROVINCIAUT = ' + QuotedStr(QrySoggPROVINCIA.AsString));
    Qry.SQL.Add(',INDIRIZZOUT = ' + QuotedStr(QrySoggINDIRIZZO.AsString));
    Qry.SQL.Add(',NUMCIVICOUT = ' + QuotedStr(QrySoggNUMCIVICO.AsString));
    Qry.SQL.Add(',TELEFONOUT = ' + QuotedStr(QrySoggTELEFONO.AsString));
    Qry.SQL.Add(',CELLULAREUT = ' + QuotedStr(QrySoggCELLULARE.AsString));
    Qry.SQL.Add(',CODICEFISCALEUT = ' + QuotedStr(QrySoggCODICEFISCALE.AsString));
    Qry.SQL.Add('WHERE CODICEUT = ' + LID + ' AND TIPO = ''A''');
    Qry.ExecSQL;
    // Sostituisce dati amministratore
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE PRATICHE SET');
    Qry.SQL.Add(' RAGSOCINST = ' + QuotedStr(QrySoggRAGIONESOCIALE.AsString));
    Qry.SQL.Add(',CITTAINST = ' + QuotedStr(QrySoggCITTA.AsString));
    Qry.SQL.Add(',CAPINST = ' + QuotedStr(QrySoggCAP.AsString));
    Qry.SQL.Add(',PROVINCIAINST = ' + QuotedStr(QrySoggPROVINCIA.AsString));
    Qry.SQL.Add(',INDIRIZZOINST = ' + QuotedStr(QrySoggINDIRIZZO.AsString));
    Qry.SQL.Add(',NUMCIVICOINST = ' + QuotedStr(QrySoggNUMCIVICO.AsString));
    Qry.SQL.Add(',TELEFONOINST = ' + QuotedStr(QrySoggTELEFONO.AsString));
    Qry.SQL.Add(',CELLULAREINST = ' + QuotedStr(QrySoggCELLULARE.AsString));
    Qry.SQL.Add(',CODICEFISCALEINST = ' + QuotedStr(QrySoggCODICEFISCALE.AsString));
    Qry.SQL.Add('WHERE CODICEINST = ' + LID + ' AND TIPO = ''A''');
    Qry.ExecSQL;
    // Sostituisce dati responsabile dell'impianto
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE PRATICHE SET');
    Qry.SQL.Add(' RAGSOCRESPIMP = ' + QuotedStr(QrySoggRAGIONESOCIALE.AsString));
    Qry.SQL.Add(',CITTARESPIMP = ' + QuotedStr(QrySoggCITTA.AsString));
    Qry.SQL.Add(',CAPRESPIMP = ' + QuotedStr(QrySoggCAP.AsString));
    Qry.SQL.Add(',PROVINCIARESPIMP = ' + QuotedStr(QrySoggPROVINCIA.AsString));
    Qry.SQL.Add(',INDIRIZZORESPIMP = ' + QuotedStr(QrySoggINDIRIZZO.AsString));
    Qry.SQL.Add(',NUMCIVICORESPIMP = ' + QuotedStr(QrySoggNUMCIVICO.AsString));
    Qry.SQL.Add(',TELEFONORESPIMP = ' + QuotedStr(QrySoggTELEFONO.AsString));
    Qry.SQL.Add(',CELLULARERESPIMP = ' + QuotedStr(QrySoggCELLULARE.AsString));
    Qry.SQL.Add(',CODICEFISCALERESPIMP = ' + QuotedStr(QrySoggCODICEFISCALE.AsString));
    Qry.SQL.Add(',PARTITAIVARESPIMP = ' + QuotedStr(QrySoggPARTITAIVA.AsString));
    Qry.SQL.Add(',NATURAGIURIDICARESPIMP = ' + QuotedStr(QrySoggTIPOPERSONA.AsString));
    Qry.SQL.Add('WHERE CODICERESPIMP = ' + LID + ' AND TIPO = ''A''');
    Qry.ExecSQL;

    ShowMessage('Tutti gli impianti del cliente sono stati aggiornati.');
  finally
    Qry.Free;
  end;
end;

procedure TAnagCliForm.QrySoggCODICERIFChange(Sender: TField);
var
   Qry:TIB_Cursor;
begin
   // Crea, imposta  ed esegue l'oggetto query
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia');
      Qry.SQL.Add('FROM Clienti');
      Qry.SQL.Add('WHERE Codice = ' + IntToStr(QrySoggCodiceRif.Value));
      Qry.Open;
      // Importa i valori del soggetto scelto nei campi del riferimento
      if Qry.FieldByName('RagioneSociale').IsNull then QrySoggRagSocRif.Value := ''    else QrySoggRagSocRif.Value := Qry.FieldByName('RagioneSociale').Value;
      if Qry.FieldByName('Indirizzo').IsNull      then QrySoggIndirizzoRif.Value := '' else QrySoggIndirizzoRif.Value := Qry.FieldByName('Indirizzo').Value;
      if Qry.FieldByName('NumCivico').IsNull      then QrySoggNumCivicoRif.Value := '' else QrySoggNumCivicoRif.Value := Qry.FieldByName('NumCivico').Value;
      if Qry.FieldByName('Citta').IsNull          then QrySoggCittaRif.Value := ''     else QrySoggCittaRif.Value := Qry.FieldByName('Citta').Value;
      if Qry.FieldByName('CAP').IsNull            then QrySoggCAPRif.Value := ''       else QrySoggCAPRif.Value := Qry.FieldByName('CAP').Value;
      if Qry.FieldByName('Provincia').IsNull      then QrySoggProvinciaRif.Value := '' else QrySoggProvinciaRif.Value := Qry.FieldByName('Provincia').Value;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;

procedure TAnagCliForm.QrySoggCODICEDESTINAZMERCIChange(Sender: TField);
var
   Qry:TIB_Cursor;
begin
   // Crea, imposta  ed esegue l'oggetto query
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia');
      Qry.SQL.Add('FROM Clienti');
      Qry.SQL.Add('WHERE Codice = ' + IntToStr(QrySoggCodiceDestinazMerci.Value));
      Qry.Open;
      // Importa i valori del soggetto scelto nei campi del riferimento
      QrySoggRagSocDestinazMerci.Value      := Qry.FieldByName('RagioneSociale').AsString;
      QrySoggIndirizzoDestinazMerci.Value   := Qry.FieldByName('Indirizzo').AsString;
      QrySoggNumCivicoDestinazMerci.Value   := Qry.FieldByName('NumCivico').AsString;
      QrySoggCittaDestinazMerci.Value       := Qry.FieldByName('Citta').AsString;
      QrySoggCAPDestinazMerci.Value         := Qry.FieldByName('CAP').AsString;
      QrySoggProvinciaDestinazMerci.Value   := Qry.FieldByName('Provincia').AsString;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;

procedure TAnagCliForm.Stampaetichettecliente1Click(Sender: TObject);
var
   Qry: TIB_Cursor;
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
      Qry.SQL.Add('INSERT INTO LABSOGG (CODICESTAZIONE,PROGRIGO,Codice,RagioneSociale,Indirizzo,NumCivico,Citta,CAP,Provincia,JOLLY1)');
      Qry.SQL.Add('SELECT ' + QuotedStr(DM1.CodiceUtente) + ' AS CODICESTAZIONE, 0 AS PROGRIGO, Codice, RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia, Titolo');
      Qry.SQL.Add('FROM CLIENTI');
      Qry.SQL.Add('WHERE Codice = ' + IntToStr(CodiceCliente));
      Qry.ExecSQL;
      // -----------------------------------------------------------------------------------------------------------------------------------
      // Crea e avvia la form per la stampa delle etichette
      DM2.StampaEtichettaSilent((MenuStampe.Tag = 0), DM1.TableProgressiviDEFAULTLABELOPERATOREFILENAME.AsString, DM1.DefaultLabelPrinterName);
   finally
      DM1.ChiudiAttendere;
      if Assigned(Qry) then Qry.Free;
   end;
end;

procedure TAnagCliForm.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TAnagCliForm.DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TAnagCliForm.DBEFOrzaIVAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraAliquotaIVA1Click(AzzeraAliquotaIVA1);
end;

procedure TAnagCliForm.AzzeraAliquotaIVA1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera aliquota IVA', 'Confermi di voler azzerare l''aliquota IVA?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    QrySoggCODICEIVA.Clear;
    DBECodiceFiscale.SetFocus;
    DBEFOrzaIVA.SetFocus;
  end;
end;

procedure TAnagCliForm.AzzeraStato1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    QrySoggSTATODESCRIZIONE.Clear;
    QrySoggSTATOFOREGROUND.Clear;
    QrySoggSTATOBACKGROUND.Clear;
    DBComboBoxTipoSoggetto.SetFocus;
    DBEditStatoDocumento.SetFocus;
  end;
end;

procedure TAnagCliForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
   // Richiama la selezione dello stato del documento
   DM1.SelezionaStato('Soggetti', QrySogg, 0);
end;

procedure TAnagCliForm.QrySoggBeforeEdit(DataSet: TDataSet);
begin
  PrecFornitoreConListino := (QrySoggFORNITORECONLISTINO.AsString = 'T');
end;

procedure TAnagCliForm.dbeAgenteKeyPress(Sender: TObject; var Key: Char);
begin
  // Fa in modo che non accetti caratter dalla tastiera in modo che l'utente non
  //  possa nemmeno accidentalmente alterare il dato
  Key := #0;
end;

procedure TAnagCliForm.FormResize(Sender: TObject);
begin
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, FormMainPanel, False);
   // Posizione Anagrafica ClientArea
   ClientArea.Left := Trunc((TabAnagrafica.ClientWidth - ClientArea.Width) / 2);
   if ClientArea.Left < 0 then ClientArea.Left := 0;
end;

procedure TAnagCliForm.MainPageControlChange(Sender: TObject);
var
  TmpStr: String;
begin
  // Impostazione dei tools button in base alla situazione
  EnableDisableToolsBtn;

  // ===========================================================================
  // VISUALIZZAZIONE MAPPA
  // ---------------------------------------------------------------------------
  // Se siamo nella pagina della mappa crea l'apposita form all'interno del Tab
  //  NB: Ovviamente se non esiste già
  if (MainPageControl.ActivePage = TabMappa) and not Assigned(MapForm) then begin
    // Crea la form della mappa
    MapForm := GMap_CreateInParent(TabMappa);
    // Show della form della mappa
    MapForm.Show;
    // Visualizza la mappa
    MapForm.CreaMappa(QrySoggPROVINCIA.AsString
                     ,QrySoggCITTA.AsString
                     ,QrySoggCAP.AsString
                     ,QrySoggINDIRIZZO.AsString
                     ,QrySoggNUMCIVICO.AsString
                     );
  end;
  // ===========================================================================
end;

procedure TAnagCliForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

procedure TAnagCliForm.dbeAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QrySogg.State = dsEdit) or (QrySogg.State = dsInsert) then DM1.AgenteChanged(1, dbeAgente2);
end;

procedure TAnagCliForm.dbeAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QrySogg.State = dsEdit) or (QrySogg.State = dsInsert) then DM1.AgenteChanged(2, dbeAgente3);
end;

procedure TAnagCliForm.dbeAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QrySogg.State = dsEdit) or (QrySogg.State = dsInsert) then DM1.AgenteChanged(3, dbeAgente4);
end;

procedure TAnagCliForm.dbeAgentePropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente.Properties.Items, 1, '');
end;

procedure TAnagCliForm.dbeAgente2PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente2.Properties.Items, 2, dbeAgente.Text);
end;

procedure TAnagCliForm.dbeAgente3PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente3.Properties.Items, 3, dbeAgente2.Text);
end;

procedure TAnagCliForm.dbeAgente4PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente4.Properties.Items, 4, dbeAgente3.Text);
end;






// Imposta le dimensioni dei pannelli delle note
procedure TAnagCliForm.ImpostaDimensioniPannelliNote;
begin
  // Note impianto
  if cbVediNotePrivateSoggetto.Checked
    then PanelNote.Height := dbeNotePrivateSoggetto.Top + dbeNotePrivateSoggetto.Height + 5
    else PanelNote.Height := dbeNotePrivateSoggetto.Top;
end;






procedure TAnagCliForm.cbVediNotePrivateSoggettoPropertiesChange(
  Sender: TObject);
begin
  // IN base alla selezione dimensiona il pannello Note
  ImpostaDimensioniPannelliNote;
  // RIchiama il calcolo del layout per ridisporre i Pannelli successivi
  CaricaLayout;
end;

















// =============================================================================
// INIZIO PARTE PER EVIDENZIAZIONE LAMPEGGIANTE (PRESCRIZIONI, NOTE ECC.)
// -----------------------------------------------------------------------------
// Verifica se deve essere avviato il lampeddio (evidenziaizione) del campo
procedure TAnagCliForm.CognomeKeyPress(Sender: TObject; var Key: Char);
begin
  // La somma del cognome + nome (compreso lo spazio che li separa)
  //  non deve superare i 60 caratteri, altrimenti potrebbe generare
  //  errori (StringTruncation) oppure venire troncati.
  //  NB: Se il focus è sul cognome o sul nome lo sposta in modo da
  //       essere sicuro che il valore sia postato al campo
  if ((Length(Cognome.Text + ' ' + Nome.Text)) >= 60)
  and (Ord(Key) <> 8)  // BackSpace (altrimenti il backspace non funzionava più una volta raggiunta le dimensione massima
  then
    Key := #0;
end;

procedure TAnagCliForm.ControllaEvidenziazioneNotePrivateImpianto;
begin
  NotePrivateSoggetto_Evidenzia := (Trim(QrySoggNOTEPRIVATE.AsString) <> '');
end;




procedure TAnagCliForm.TimerBlinkTimer(Sender: TObject);
begin
  // Fa lampeggiare le prescrizioni
  if NotePrivateSoggetto_Evidenzia then NotePrivateSoggetto_InEvidenza := not NotePrivateSoggetto_InEvidenza;
end;




procedure TAnagCliForm.TipoPersonaPropertiesChange(Sender: TObject);
begin
  // All invisible
  LabelCognome.Caption    := 'Cognome o Rag.Soc.';
  LabelRagioneSociale.Visible := False;
  LabelNome.Visible           := False;
  LabelCognome.Visible        := False;
  RagioneSociale.Visible      := False;
  Cognome.Visible             := False;
  Nome.Visible                := False;
  // Show depending....
  case TipoPersona.ItemIndex of
    // Persona fisica
    0: begin
      // Posizionamento verticale
      LabelNome.Top       := RESPIMP_MIDDLE;
      LabelCognome.Top    := RESPIMP_MIDDLE;
      Nome.Top            := RESPIMP_MIDDLE;
      Cognome.Top         := RESPIMP_MIDDLE;
      // Abilita
      LabelNome.Visible       := True;
      LabelCognome.Visible    := True;
      Nome.Visible            := True;
      Cognome.Visible         := True;
    end;
    // Persona giuridica o Pubblica Amministrazione
    //  anche cognome e nome visibili (se abilitato e se non è una PA)
    else
    begin
      // Posizionamento verticale
      if FPersonaGiuridicaCognomeNome and (TipoPersona.ItemIndex <> 2) then
      begin
        LabelCognome.Caption    := 'Cognome';
        LabelRagioneSociale.Top := RESPIMP_TOP;
        LabelNome.Top           := RESPIMP_BOTTOM;
        LabelCognome.Top        := RESPIMP_BOTTOM;
        RagioneSociale.Top      := RESPIMP_TOP;
        Nome.Top                := RESPIMP_BOTTOM;
        Cognome.Top             := RESPIMP_BOTTOM;
      end
      else
      begin
        LabelRagioneSociale.Top := RESPIMP_MIDDLE;
        RagioneSociale.Top      := RESPIMP_MIDDLE;
      end;
      // Abilita
      LabelRagioneSociale.Visible := True;
      LabelNome.Visible           := FPersonaGiuridicaCognomeNome;
      LabelCognome.Visible        := FPersonaGiuridicaCognomeNome;
      RagioneSociale.Visible      := True;
      Nome.Visible                := FPersonaGiuridicaCognomeNome;
      Cognome.Visible             := FPersonaGiuridicaCognomeNome;
    end;
  end;
end;

// --------------------------
procedure TAnagCliForm.SetNotePrivateSoggetto_Evidenzia(
  const Value: Boolean);
begin
  fNotePrivateSoggetto_Evidenzia := Value;
  // Resetta l'aspetto se il lammpeggio viene interrotto.
  if not Value then NotePrivateSoggetto_InEvidenza := False;
end;
// --------------------------




// --------------------------
procedure TAnagCliForm.SetNotePrivateSoggetto_InEvidenza(
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
// -----------------------------------------------------------------------------
// FINE PARTE PER EVIDENZIAZIONE LAMPEGGIANTE (PRESCRIZIONI, NOTE ECC.)
// =============================================================================


procedure TAnagCliForm.QrySoggAfterOpen(DataSet: TDataSet);
begin
  // Verifica se deve essere avviato il lampeddio (evidenziaizione) del campo
  ControllaEvidenziazioneNotePrivateImpianto;
end;

procedure TAnagCliForm.dbeCodiceStatoEsteroPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(ESTERO_CODICE), ESTERO_DESCRIZIONE, ESTERO_SIGLA FROM CLIENTI WHERE COALESCE(ESTERO_CODICE,'''') <> ''''');
      Qry.Open;
      dbeCodiceStatoEstero.Properties.Items.Clear;
      dbeCodiceStatoEstero.Properties.Items.Add('');
      while not Qry.Eof do begin
         dbeCodiceStatoEstero.Properties.Items.Add(   Uppercase(Trim(Qry.FieldByName('ESTERO_DESCRIZIONE').AsString)) + ' (' + Trim(Qry.FieldByName('ESTERO_SIGLA').AsString) + ')  -  ' + Trim(Qry.FieldByName('ESTERO_CODICE').AsString)   );
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAnagCliForm.dbeCodiceStatoEsteroPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
   Qry : TIB_Cursor;
   SeparatorPosition: Integer;
   Selezionato: String;
begin
//   Sender.OnValidate := nil;
   try
      // Se è stata una selezione dalla lista deve eliminare la descrizione della stato e
      //  prendere solo il codice
      Selezionato := Trim(DisplayValue);
      SeparatorPosition := Pos('  -  ', Selezionato);
      // Preleva solo il codice e lo riassegna al campo stesso depurandolo
      if SeparatorPosition > 0 then Selezionato := Trim(RightStr(Selezionato, Length(Selezionato)-SeparatorPosition-4));
      Selezionato := Trim(Selezionato);
      DisplayValue := Selezionato;
      // carica la descrizione dello stato dal database
      Qry := TIB_Cursor.Create(Self);
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT FIRST 1 ESTERO_DESCRIZIONE, ESTERO_SIGLA FROM CLIENTI WHERE ESTERO_CODICE = ' + QuotedStr(Selezionato));
      Qry.Open;
      if not Qry.Eof then begin
        dbeDescrizioneStatoEstero.Text  := Qry.Fields[0].AsString;
        dbeSiglaStatoEstero.Text        := Qry.Fields[1].AsString;
      end else begin
        dbeDescrizioneStatoEstero.Text  := '';
        dbeSiglaStatoEstero.Text        := '';
      end;
      Qry.Close;
   finally
//      Sender.OnValidate := QrySoggESTERO_CODICEValidate;
      if Assigned(Qry) then Qry.Free;
   end;
end;

procedure TAnagCliForm.cxDBCheckBox2PropertiesChange(Sender: TObject);
begin
  // Abilita o disabilita l'editing del codice e della descrizione dello stato estero
  //  in base alla spunta o meno del flag che indica appunto che è un soggetto estero.
  if QrySoggESTERO.AsString = 'T' then begin
    dbeExtraUE.Enabled                := True;
    dbeCodiceStatoEstero.Enabled      := True;
    dbeDescrizioneStatoEstero.Enabled := True;
    dbeSiglaStatoEstero.Enabled       := True;
  end else begin
    dbeExtraUE.Enabled                := False;
    dbeCodiceStatoEstero.Enabled      := False;
    dbeDescrizioneStatoEstero.Enabled := False;
    dbeSiglaStatoEstero.Enabled       := False;
  end;
end;

end.
