unit FormExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelAnagrafica, DB, IBODataset, ExtCtrls, bmpPanel,
  
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, cxShellCommon, cxDropDownEdit, cxShellComboBox,
  cxContainer, cxTextEdit, cxMaskEdit, StdCtrls, cxPC, cxCalendar, Buttons,
  cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  dxCore, cxDateUtils, Data.DBXMySQL, Data.FMTBcd, Data.SqlExpr, eCommerceImport_Loaders,
  cxCheckBox;

type
  // Struttura che contiene eventuali parametri da passare alla query
  TQueryParams = record
    ParamName: String;
    ParamValue: Variant;
  end;

  TExportForm = class(TModelAnagraficaForm)
    Qry: TIBOQuery;
    SourceQry: TDataSource;
    PageControl: TcxPageControl;
    TabGenerico: TcxTabSheet;
    TabMulti: TcxTabSheet;
    Panel1: TPanel;
    Label68: TLabel;
    ComboTipoEsportazione: TcxComboBox;
    Button1: TButton;
    G: TcxGrid;
    tvG: TcxGridDBTableView;
    lvG: TcxGridLevel;
    PanelModo: TPanel;
    LabelModo: TLabel;
    Label1: TLabel;
    RichEdit1: TRichEdit;
    MultiDallaData: TcxDateEdit;
    Label2: TLabel;
    MultiAllaData: TcxDateEdit;
    QryMulti: TIBOQuery;
    QryMultiTIPODOCUMENTO: TStringField;
    QryMultiREGISTRO: TStringField;
    QryMultiNUMORDPREV: TIntegerField;
    QryMultiDATADOCUMENTO: TDateTimeField;
    QryMultiCODICECLIENTE: TIntegerField;
    QryMultiSELEZIONATO: TStringField;
    QryMultiSCONTOALIQUOTA1: TIBOFloatField;
    QryMultiSCONTOALIQUOTA2: TIBOFloatField;
    QryMultiSCONTOALIQUOTA3: TIBOFloatField;
    QryMultiSCONTOALIQUOTA4: TIBOFloatField;
    QryMultiTOTALEMARGINE: TIBOFloatField;
    QryMultiTOTALERIGHI1: TIBOFloatField;
    QryMultiTOTALERIGHI2: TIBOFloatField;
    QryMultiTOTALERIGHI3: TIBOFloatField;
    QryMultiTOTALERIGHI4: TIBOFloatField;
    QryMultiIMPORTOIVA1: TIBOFloatField;
    QryMultiIMPORTOIVA2: TIBOFloatField;
    QryMultiIMPORTOIVA3: TIBOFloatField;
    QryMultiIMPORTOIVA4: TIBOFloatField;
    QryMultiTOTALEIMPONIBILE1: TIBOFloatField;
    QryMultiTOTALEIMPONIBILE2: TIBOFloatField;
    QryMultiTOTALEIMPONIBILE3: TIBOFloatField;
    QryMultiTOTALEIMPONIBILE4: TIBOFloatField;
    QryMultiTOTALEDOCUMENTO: TIBOFloatField;
    QryMultiCAUSALE: TStringField;
    QryMultiSEGNOOPERAZIONE: TStringField;
    QryMultiDAFATTURARE: TStringField;
    QryMultiCAUSALECANTIERE: TStringField;
    QryMultiSEGNOOPERAZIONECANTIERE: TStringField;
    QryMultiTRASPORTOACURA: TStringField;
    QryMultiDATIVETTORE: TStringField;
    QryMultiLISTINO: TSmallintField;
    QryMultiPRATICA: TIntegerField;
    QryMultiPAGAMENTO: TIntegerField;
    QryMultiINDIRIZZODESTMERCI: TStringField;
    QryMultiNUMCIVICODESTMERCI: TStringField;
    QryMultiCAPDESTMERCI: TStringField;
    QryMultiCODICEISTATCOMUNEDESTMERCI: TStringField;
    QryMultiCITTADESTMERCI: TStringField;
    QryMultiPROVINCIADESTMERCI: TStringField;
    QryMultiCODICEIVA1: TIntegerField;
    QryMultiCODICEIVA2: TIntegerField;
    QryMultiCODICEIVA3: TIntegerField;
    QryMultiCODICEIVA4: TIntegerField;
    QryMultiPRATICA2: TIntegerField;
    QryMultiPRATICA3: TIntegerField;
    QryMultiDATAPRATICA1: TDateTimeField;
    QryMultiDATAPRATICA2: TDateTimeField;
    QryMultiDATAPRATICA3: TDateTimeField;
    QryMultiSTATODESCRIZIONE: TStringField;
    QryMultiSTATOFOREGROUND: TStringField;
    QryMultiSTATOBACKGROUND: TStringField;
    QryMultiARGOMENTO: TStringField;
    QryMultiAGENTE: TStringField;
    QryMultiAGENTE2: TStringField;
    QryMultiAGENTE3: TStringField;
    QryMultiAGENTE4: TStringField;
    QryMultiABBUONO: TIBOFloatField;
    QryMultiTOTALEDAPAGARE: TIBOFloatField;
    QryMultiNOTE: TMemoField;
    QryMultiMESSAGGI: TMemoField;
    QryMultiCODICEDESTMERCI: TIntegerField;
    QryMultiRAGSOCCLI: TStringField;
    QryMultiINDIRIZZOCLI: TStringField;
    QryMultiNUMCIVICOCLI: TStringField;
    QryMultiCODICEISTATCOMUNECLI: TStringField;
    QryMultiCITTACLI: TStringField;
    QryMultiCAPCLI: TStringField;
    QryMultiPROVINCIACLI: TStringField;
    QryMultiPARTITAIVACLI: TStringField;
    QryMultiCODICEFISCALECLI: TStringField;
    QryMultiABI: TStringField;
    QryMultiCAB: TStringField;
    QryMultiDATASCAD1: TDateTimeField;
    QryMultiDATASCAD2: TDateTimeField;
    QryMultiDATASCAD3: TDateTimeField;
    QryMultiDATASCAD4: TDateTimeField;
    QryMultiDATASCAD5: TDateTimeField;
    QryMultiIMPORTOSCAD1: TIBOFloatField;
    QryMultiIMPORTOSCAD2: TIBOFloatField;
    QryMultiIMPORTOSCAD3: TIBOFloatField;
    QryMultiIMPORTOSCAD4: TIBOFloatField;
    QryMultiIMPORTOSCAD5: TIBOFloatField;
    QryMultiRAGSOCDESTMERCI: TStringField;
    QryMultiDATATRASP: TStringField;
    QryMultiORATRASP: TStringField;
    QryMultiCODICESUBSOGG: TIntegerField;
    QryMultiSUBSOGGCAMPO1: TStringField;
    QryMultiSUBSOGGCAMPO2: TStringField;
    QryMultiSUBSOGGCAMPO3: TStringField;
    QryMultiTIPODOCUMENTOESTESO: TStringField;
    QryMultiCODICEMAGAZZINO: TSmallintField;
    QryMultiMESECOMPETENZA: TSmallintField;
    QryMultiOPERATORE: TStringField;
    QryMultiVALIDITADOCUMENTO: TStringField;
    QryMultiCONSEGNA: TStringField;
    QryMultiNUMCOLLI: TStringField;
    QryMultiASPETTOESTERIOREBENI: TStringField;
    QryMultiPORTO: TStringField;
    QryMultiSINCHRO: TStringField;
    QryMultiTOTALEMERCE: TIBOFloatField;
    QryMultiTOTALESCONTI: TIBOFloatField;
    QryMultiTOTALENETTOMERCE: TIBOFloatField;
    QryMultiSPESE: TIBOFloatField;
    QryMultiTOTALEIMPONIBILE: TIBOFloatField;
    QryMultiTOTALEIVA: TIBOFloatField;
    QryMultiPRZUNITOPERA: TIBOFloatField;
    QryMultiCODICEIVAFORZATA: TIntegerField;
    QryMultiDESCRIZIONEIVAFORZATA: TStringField;
    QryMultiALIQUOTAIVAFORZATA: TIBOFloatField;
    QryMultiSTARTMEMO: TMemoField;
    QryMultiENDMEMO: TMemoField;
    QryMultiVALIDITAGG: TSmallintField;
    QryMultiVALIDITADATA: TDateTimeField;
    QryMultiCONSEGNAGG: TSmallintField;
    QryMultiCONSEGNADATA: TDateTimeField;
    QryMultiCONSEGNATO: TStringField;
    QryMultiRITACCPERC: TIBOFloatField;
    QryMultiRITACC: TIBOFloatField;
    QryMultiORDINECHIUSO: TStringField;
    QryMultiRITACCPERCIMPONIBILE: TIBOFloatField;
    QryMultiBARCODE: TStringField;
    QryMultiRIFSOGG1_CODICE: TIntegerField;
    QryMultiRIFSOGG1_TIPO: TStringField;
    QryMultiRIFSOGG1_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG2_CODICE: TIntegerField;
    QryMultiRIFSOGG2_TIPO: TStringField;
    QryMultiRIFSOGG2_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG3_CODICE: TIntegerField;
    QryMultiRIFSOGG3_TIPO: TStringField;
    QryMultiRIFSOGG3_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG4_CODICE: TIntegerField;
    QryMultiRIFSOGG4_TIPO: TStringField;
    QryMultiRIFSOGG4_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG5_CODICE: TIntegerField;
    QryMultiRIFSOGG5_TIPO: TStringField;
    QryMultiRIFSOGG5_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG6_CODICE: TIntegerField;
    QryMultiRIFSOGG6_TIPO: TStringField;
    QryMultiRIFSOGG6_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG7_CODICE: TIntegerField;
    QryMultiRIFSOGG7_TIPO: TStringField;
    QryMultiRIFSOGG7_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG8_CODICE: TIntegerField;
    QryMultiRIFSOGG8_TIPO: TStringField;
    QryMultiRIFSOGG8_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG9_CODICE: TIntegerField;
    QryMultiRIFSOGG9_TIPO: TStringField;
    QryMultiRIFSOGG9_RAGIONESOCIALE: TStringField;
    QryMultiRIFSOGG10_CODICE: TIntegerField;
    QryMultiRIFSOGG10_TIPO: TStringField;
    QryMultiRIFSOGG10_RAGIONESOCIALE: TStringField;
    QryMultiPRZUNITOPERA1: TIBOFloatField;
    QryMultiPRZUNITOPERA2: TIBOFloatField;
    QryMultiPRZUNITOPERA3: TIBOFloatField;
    QryMultiPRZUNITOPERA4: TIBOFloatField;
    QryMultiSTMPREF: TBlobField;
    QryMultiEXPORTED: TStringField;
    QryMultiPROTOCOLLO: TIntegerField;
    QryMultiRITACCSUPERCIMP: TStringField;
    QryMultiRITACCSUIMPORTOIMP: TStringField;
    QryMultiRITACCIMPONIBILE: TIBOFloatField;
    QryMultiCODICEMAGAZZINO2: TSmallintField;
    QryMultiRIFDOC_TIPO: TStringField;
    QryMultiRIFDOC_NUM: TIntegerField;
    QryMultiRIFDOC_REG: TStringField;
    QryMultiRIFDOC_DATA: TDateTimeField;
    QryMultiRIFDOC_CORRISPNOPAG: TStringField;
    QryMultiALIQUOTAIVA1: TFloatField;
    QryMultiALIQUOTAIVA2: TFloatField;
    QryMultiALIQUOTAIVA3: TFloatField;
    QryMultiALIQUOTAIVA4: TFloatField;
    QryMultiTIPOPERSONA: TStringField;
    QryMultiESTERO_CODICE: TStringField;
    QryMultiESTERO_DESCRIZIONE: TStringField;
    QryMultiESTERO: TStringField;
    QryMultiESTERO_SIGLA: TStringField;
    TabECommerce: TcxTabSheet;
    Panel3: TPanel;
    Label6: TLabel;
    RichEdit3: TRichEdit;
    Panel4: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RichEdit4: TRichEdit;
    ecNomeServer: TcxTextEdit;
    ecNomeDatabase: TcxTextEdit;
    Panel5: TPanel;
    SpeedButton4: TSpeedButton;
    Panel6: TPanel;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    ecNomeUtente: TcxTextEdit;
    ecPassword: TcxTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GridEC: TcxGrid;
    lvEC: TcxGridLevel;
    tvEC: TcxGridTableView;
    tvECIndex: TcxGridColumn;
    tvECDesc: TcxGridColumn;
    tvECWhere: TcxGridColumn;
    tvECDetailsWhere: TcxGridColumn;
    ecEsportazioneMulti: TcxCheckBox;
    MultiEsportaFatture: TcxCheckBox;
    MultiEsportaPrimanota: TcxCheckBox;
    LabelLastExport: TLabel;
    QryMultiBOLLOIMPORTO: TIBOFloatField;
    QryMultiRAGIONESOCIALE: TStringField;
    QryMultiCOGNOME: TStringField;
    QryMultiNOME: TStringField;
    QryMultiPrimanota: TIBOQuery;
    QryMultiPrimanotaCODICE: TIntegerField;
    QryMultiPrimanotaDATA: TDateTimeField;
    QryMultiPrimanotaDESCRIZIONE: TStringField;
    QryMultiPrimanotaCASSAENTRATE: TIBOFloatField;
    QryMultiPrimanotaCASSAUSCITE: TIBOFloatField;
    QryMultiPrimanotaFUORIENTRATE: TIBOFloatField;
    QryMultiPrimanotaFUORIUSCITE: TIBOFloatField;
    QryMultiPrimanotaDESCFUORI: TStringField;
    QryMultiPrimanotaABBUONIATTIVI: TIBOFloatField;
    QryMultiPrimanotaABBUONIPASSIVI: TIBOFloatField;
    QryMultiPrimanotaNOTE: TStringField;
    QryMultiPrimanotaCLIENTE: TIntegerField;
    QryMultiPrimanotaPRATICA: TIntegerField;
    QryMultiPrimanotaPRATICA2: TIntegerField;
    QryMultiPrimanotaPRATICA3: TIntegerField;
    QryMultiPrimanotaDATAPRATICA1: TDateTimeField;
    QryMultiPrimanotaDATAPRATICA2: TDateTimeField;
    QryMultiPrimanotaDATAPRATICA3: TDateTimeField;
    QryMultiPrimanotaSTATODESCRIZIONE: TStringField;
    QryMultiPrimanotaSTATOFOREGROUND: TStringField;
    QryMultiPrimanotaSTATOBACKGROUND: TStringField;
    QryMultiPrimanotaAGENTE: TStringField;
    QryMultiPrimanotaAGENTE2: TStringField;
    QryMultiPrimanotaAGENTE3: TStringField;
    QryMultiPrimanotaAGENTE4: TStringField;
    QryMultiPrimanotaTIPOPERSONA: TStringField;
    QryMultiPrimanotaRAGIONESOCIALE: TStringField;
    QryMultiPrimanotaCOGNOME: TStringField;
    QryMultiPrimanotaNOME: TStringField;
    QryMultiPrimanotaESTERO: TStringField;
    QryMultiPrimanotaESTERO_CODICE: TStringField;
    QryMultiPrimanotaESTERO_DESCRIZIONE: TStringField;
    QryMultiPrimanotaESTERO_SIGLA: TStringField;
    Panel7: TPanel;
    Label16: TLabel;
    RichEdit5: TRichEdit;
    Panel12: TPanel;
    IniziaFatturazione: TSpeedButton;
    MultiSoloNonEsportati: TcxCheckBox;
    MultiMarcaDocEsportati: TcxCheckBox;
    QryMultiPrimanotaEXPORTED: TStringField;
    QryMultiPrimanotaINDIRIZZO: TStringField;
    QryMultiPrimanotaNUMCIVICO: TStringField;
    QryMultiPrimanotaCAP: TStringField;
    QryMultiPrimanotaCITTA: TStringField;
    QryMultiPrimanotaPROVINCIA: TStringField;
    QryMultiPrimanotaCODICEFISCALE: TStringField;
    QryMultiPrimanotaPARTITAIVA: TStringField;
    QryMultiPrimanotaBANCA_CONTO: TStringField;
    QryMultiPrimanotaCLIENTEFORNITORE: TStringField;
    MultiNoExportCI1IfZero: TcxCheckBox;
    QryMultiCAUSALE_EXPORT_CONTO: TStringField;
    procedure FormResize(Sender: TObject);
    procedure TipoEsportazionePropertiesInitPopup(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure IniziaFatturazioneClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    fTipoFileDestinazione: String;
    fNomeFileDestinazione: String;
    ftxt_Separator, ftxt_StartDelimiter, ftxt_EndDelimiter: String;
    fQueryParams: array of TQueryParams;
    fDestinationFileNameNoExt: String;
    fAvvertiQuandoTerminato: Boolean;
    procedure RicalcolaDimensioni;
    procedure CaricaParametriFiltro(FilterFileName: String);
    procedure EsportaTesto;
    procedure EsportaExcel;
    function GetFilterFileName: String;
    procedure SetFilterFileName(const Value: String);



    function  Multi_Esporta_Fatture(const SL: TStrings): Integer;
    procedure Multi_OpenQuery_Fatture;
    procedure Multi_CloseQuery_Fatture;
    function  Multi_EsportaRecord_Fattura: String;
    procedure Multi_MarkAsExported_Fatture(DocTipo, DocReg: String; DocNum: Integer; DocData: TDatetime);
    procedure Multi_MarkAllAsExported_Fatture;

    function  Multi_Esporta_Primanota(const SL: TStrings): Integer;
    procedure Multi_OpenQuery_Primanota;
    procedure Multi_CloseQuery_Primanota;
    function  Multi_EsportaRecord_Primanota: String;
    procedure Multi_MarkAsExported_Primanota(Codice: Integer; Data: TDatetime);
    procedure Multi_MarkAllAsExported_Primanota;

    procedure Multi_Esporta;
    function  Multi_ConvertiData(D: TDateTime): String;
    function  Multi_AlphaToInteger(V: String): Int64;
    procedure Multi_SalvaParametri;
    procedure Multi_CaricaParametri;

    procedure SaveStringListWithoutLastLineBreak(const ASL: TStringList; const AFileName: String);

    procedure eCommerce_CaricaParametri;
    procedure eCommerce_SalvaParametri;
    function eCommerce_CreateAndInit: TecLoaderShoppyInvoices;
    procedure eCommerce_PrepareImportList;
    procedure eCommerce_LoadImportListOnGrid(ecLoader: TecLoader);
    procedure eCommerce_ImportAll;
  { Private declarations }
  public
    { Public declarations }
    property FilterFileName:String read GetFilterFileName write SetFilterFileName;
    property DestinationFileNameNoExt:String read fDestinationFileNameNoExt write fDestinationFileNameNoExt;
    property AvvertiQuandoTerminato:Boolean read fAvvertiQuandoTerminato write fAvvertiQuandoTerminato;
    procedure ClearQueryParams;
    procedure AddQueryParams(ParamName:String; ParamValue:Variant);
    procedure AvviaEsportazione;
  end;

var
  ExportForm: TExportForm;

implementation

uses DataModule1, StrUtils, IniFiles, cxGridExportLink, DateUtils,
  IB_Components;

{$R *.dfm}


// =============================================================================
// INIZIO: IMPORTAZIONE DA E-COMMERCE
// -----------------------------------------------------------------------------
procedure TExportForm.eCommerce_ImportAll;
var
  fecLoader: TecLoader;
begin
  inherited;
  // Crea e inizializza il loader
  fecLoader := eCommerce_CreateAndInit;
  try
    // Carica la lista delle voci da importare
    fecLoader.PrepareImportList;
    // Carica le voci trovate nella griglia
    eCommerce_LoadImportListOnGrid(fecLoader);
    DM1.CloseWait;
    // Chiede prima conferma all'utente
    if DM1.Messaggi('Levante', 'Importare le ' + IntToStr(fecLoader.ImportList.Count) + ' voci presenti?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    // Effettua l'importazione di tutte le voci
    fecLoader.ImportItems;
  finally
    DM1.CloseWait;
    fecLoader.Free;
    if not ecEsportazioneMulti.Checked
      then DM1.Messaggi('Levante', 'Operazione terminata.', '', [mbOk], 0, nil);
  end;
end;

procedure TExportForm.eCommerce_PrepareImportList;
var
  fecLoader: TecLoader;
begin
  inherited;
  // Crea e inizializza il loader
  fecLoader := eCommerce_CreateAndInit;
  try
    // Carica la lista delle voci da importare
    fecLoader.PrepareImportList;
    // Carica le voci trovate nella griglia
    eCommerce_LoadImportListOnGrid(fecLoader);
  finally
    DM1.CloseWait;
    fecLoader.Free;
  end;
end;

procedure TExportForm.eCommerce_LoadImportListOnGrid(ecLoader: TecLoader);
var
  DC: TcxCustomDataController;
  i: Integer;
  RI: Integer;
begin
  DC := tvEC.DataController;
  tvEC.BeginUpdate;
  try
    DC.RecordCount := 0;
    for i := 0 to ecLoader.ImportList.Count -1 do
    begin
      RI := DC.AppendRecord;
      DC.Values[RI,tvECIndex.Index]         := ecLoader.ImportList[i].ItemIndex;
      DC.Values[RI,tvECDesc.Index]          := ecLoader.ImportList[i].ItemDescription;
      DC.Values[RI,tvECWhere.Index]         := ecLoader.ImportList[i].ItemSqlWhere;
      DC.Values[RI,tvECDetailsWhere.Index]  := ecLoader.ImportList[i].ItemDetailsSqlWhere;
    end;
  finally
    tvEC.EndUpdate;
  end;
end;

function TExportForm.eCommerce_CreateAndInit: TecLoaderShoppyInvoices;
begin
  inherited;
  // Salva i parametri
  eCommerce_SalvaParametri;
  // Crea e inizializza il loader
  Result := TecLoaderShoppyInvoices.Create(ecNomeServer.Text
                                          ,ecNomeDatabase.Text
                                          ,ecNomeUtente.Text
                                          ,ecPassword.Text
                                          ,DM1.DBAzienda
                                          );
  // Gli assegna un anonimous method per visualizzare i waitings messages
  Result.ShowWaitMessageProcedure := procedure(Messaggio:String)
  begin
    DM1.ShowWait('Levante', Messaggio);
  end;
end;

// Salva i parametri
procedure TExportForm.eCommerce_SalvaParametri;
var
  P: TMemIniFile;
  Sez: String;
begin
  Sez := 'E-COMMERCE';
  P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
  try
    P.WriteString(Sez, 'NomeServer', ecNomeServer.Text);
    P.WriteString(Sez, 'NomeDatabase', ecNomeDatabase.Text);
    P.WriteString(Sez, 'NomeUtente', ecNomeUtente.Text);
    P.WriteString(Sez, 'Password', ecPassword.Text);
    P.WriteBool(Sez, 'EsportazioneMulti', ecEsportazioneMulti.Checked);
    P.UpdateFile;
  finally
    P.Free;
  end;
end;

// Carica i parametri
procedure TExportForm.eCommerce_CaricaParametri;
var
  P: TMemIniFile;
  Sez: String;
begin
  Sez := 'E-COMMERCE';
  P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
  try
    ecNomeServer.Text := P.ReadString(Sez, 'NomeServer', '');
    ecNomeDatabase.Text := P.ReadString(Sez, 'NomeDatabase', '');
    ecNomeUtente.Text := P.ReadString(Sez, 'NomeUtente', '');
    ecPassword.Text := P.ReadString(Sez, 'Password', '');
    ecEsportazioneMulti.Checked := P.ReadBool(Sez, 'EsportazioneMulti', False);
  finally
    P.Free;
  end;
end;

// -----------------------------------------------------------------------------
// FINE: IMPORTAZIONE DA E-COMMERCE
// =============================================================================



// =============================================================================
// INIZIO: ESPORTAZIONE TEAMSYSTEM MULTI
// -----------------------------------------------------------------------------
// Function che esporta e restituisce il numero di documenti esportati (fatture)
function TExportForm.Multi_Esporta_Fatture(const SL: TStrings): Integer;
var
  CurrLine: String;
begin
  // Inizializzazione
  Result := 0;
  try
    // Apre la  query che preleva i dati
    Multi_OpenQuery_Fatture;
    // Cicla per tutti i records
    while not QryMulti.Eof do begin
      // Elabora il record corrente
      CurrLine := '';
      CurrLine := Multi_EsportaRecord_Fattura;
      // Aggiunge il record corrente alla stringlist
      SL.Add(CurrLine);
      // NB: Dopo un aggiornamento di TeamSystem è necessaria una seconda riga (TARC1)
      //      con il 7° carattere = 1 invece che 0
      CurrLine[7] := '1';
      SL.Add(CurrLine);
      // Aggiorna lo schermo
      inc(Result);
      DM1.ShowWait('Levante', 'Esportazione fatture verso Multi (TeamSystem)'#13#13 + IntToStr(Result) + ' records elaborati...');
      // Avanti il prossimo
      QryMulti.Next;
    end;
    // Marca i documenti esportati come "EXPORTED"
    if MultiMarcaDocEsportati.Checked then
    begin
      DM1.ShowWait('Levante', 'Marco i documenti come "EXPORTED".');
      Multi_MarkAllAsExported_Fatture;
    end;
  finally
    // Pulizie finali
    DM1.CloseWait;
    Multi_CloseQuery_Fatture;
  end;
end;

// Function che esporta e restituisce il numero di documenti esportati (primanota)
function TExportForm.Multi_Esporta_Primanota(const SL: TStrings): Integer;
var
  CurrLine: String;
begin
  // Inizializzazione
  Result := 0;
  try
    // Apre la  query che preleva i dati
    Multi_OpenQuery_Primanota;
    // Cicla per tutti i records
    while not QryMultiPrimanota.Eof do begin
      // Elabora il record corrente
      CurrLine := '';
      CurrLine := Multi_EsportaRecord_Primanota;
      // Aggiunge il record corrente alla stringlist
      SL.Add(CurrLine);
      // Aggiorna lo schermo
      inc(Result);
      DM1.ShowWait('Levante', 'Esportazione primanota verso Multi (TeamSystem)'#13#13 + IntToStr(Result) + ' records elaborati...');
      // Avanti il prossimo
      QryMultiPrimanota.Next;
    end;
    // Marca i documenti esportati come "EXPORTED"
    if MultiMarcaDocEsportati.Checked then
    begin
      DM1.ShowWait('Levante', 'Marco i movimenti di primanota come "EXPORTED".');
      Multi_MarkAllAsExported_Primanota;
    end;
  finally
    // Pulizie finali
    DM1.CloseWait;
    Multi_CloseQuery_Primanota;
  end;
end;

// Procedure che imposta la query per l'estrazione dei dati (fatture)
procedure TExportForm.Multi_OpenQuery_Fatture;
begin
  // Imposta ed apre la query
  if QryMulti.Active then QryMulti.Close;
  QryMulti.SQL.Clear;
  QryMulti.SQL.Add('SELECT T.*, C.TIPOPERSONA, C.RAGIONESOCIALE, C.COGNOME, C.NOME, C.ESTERO, C.ESTERO_CODICE, C.ESTERO_DESCRIZIONE, C.ESTERO_SIGLA, COALESCE(CAU.EXPORT_CONTO,'''') AS CAUSALE_EXPORT_CONTO');
  QryMulti.SQL.Add('FROM PRVORDCL T');
  QryMulti.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE = T.CODICECLIENTE)');
  QryMulti.SQL.Add('LEFT JOIN CAUSALI CAU ON (CAU.DESCRIZIONE = T.CAUSALE)');
  QryMulti.SQL.Add('WHERE T.TIPODOCUMENTO = ' + QuotedStr('Fattura'));
  if MultiDallaData.Text <> ''
    then QryMulti.SQL.Add('AND T.DATADOCUMENTO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StartOfTheDay(MultiDallaData.Date))));
  if MultiAllaData.Text <> ''
    then QryMulti.SQL.Add('AND T.DATADOCUMENTO <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', EndOfTheDay(MultiAllaData.Date))));
  if MultiSoloNonEsportati.Checked then
    QryMulti.SQL.Add('AND COALESCE(T.EXPORTED,''F'') <> ''T''');
  QryMulti.SQL.Add('ORDER BY T.NUMORDPREV');
//QryMulti.SQL.SaveToFile('c:\sql.sql');
  QryMulti.Open;
end;

// Procedure che imposta la query per l'estrazione dei dati (primanota)
procedure TExportForm.Multi_OpenQuery_Primanota;
begin
  // Imposta ed apre la query
  if QryMultiPrimanota.Active then QryMultiPrimanota.Close;
  QryMultiPrimanota.SQL.Clear;
  QryMultiPrimanota.SQL.Add('SELECT P.*, C.TIPOPERSONA, C.RAGIONESOCIALE, C.COGNOME, C.NOME, C.ESTERO, C.ESTERO_CODICE, C.ESTERO_DESCRIZIONE, C.ESTERO_SIGLA,');
  QryMultiPrimanota.SQL.Add('  C.INDIRIZZO, C.NUMCIVICO, C.CAP, C.CITTA, C.PROVINCIA, C.CODICEFISCALE, C.PARTITAIVA, B.EXPORT_CONTO AS BANCA_CONTO, C.CLIENTEFORNITORE');
  QryMultiPrimanota.SQL.Add('FROM PRIMANOT P');
  QryMultiPrimanota.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE = P.CLIENTE)');
  QryMultiPrimanota.SQL.Add('LEFT JOIN BANCHE B ON (B.DESCBREVE = P.DESCFUORI)');
  QryMultiPrimanota.SQL.Add('WHERE 1=1');
  if MultiDallaData.Text <> ''
    then QryMultiPrimanota.SQL.Add('AND P.DATA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StartOfTheDay(MultiDallaData.Date))));
  if MultiAllaData.Text <> ''
    then QryMultiPrimanota.SQL.Add('AND P.DATA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', EndOfTheDay(MultiAllaData.Date))));
  if MultiSoloNonEsportati.Checked then
    QryMultiPrimanota.SQL.Add('AND COALESCE(P.EXPORTED,''F'') <> ''T''');
  QryMultiPrimanota.SQL.Add('ORDER BY P.CODICE');
  QryMultiPrimanota.Open;
end;

// Procedure che marca tutti i documenti esportati come tali
procedure TExportForm.Multi_MarkAllAsExported_Fatture;
begin
  QryMulti.First;
  while not QryMulti.Eof do
  begin
    Multi_MarkAsExported_Fatture(QryMulti.FieldByName('TIPODOCUMENTO').AsString
                        ,QryMulti.FieldByName('REGISTRO').AsString
                        ,QryMulti.FieldByName('NUMORDPREV').AsInteger
                        ,QryMulti.FieldByName('DATADOCUMENTO').AsDateTime
                        );
    QryMulti.Next;
  end;
end;

procedure TExportForm.Multi_MarkAllAsExported_Primanota;
begin
  QryMultiPrimanota.First;
  while not QryMultiPrimanota.Eof do
  begin
    Multi_MarkAsExported_Primanota(QryMultiPrimanota.FieldByName('CODICE').AsInteger, QryMultiPrimanota.FieldByName('DATA').AsDateTime);
    QryMultiPrimanota.Next;
  end;
end;

// Procedure che marca il documento come esportato
procedure TExportForm.Multi_MarkAsExported_Fatture(DocTipo, DocReg: String; DocNum: Integer; DocData:TDatetime);
var
  Qry: TIBOQuery;
begin
  Qry := TIBOQuery.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE PRVORDCL T SET T.EXPORTED = ''T''');
    Qry.SQL.Add('WHERE T.TIPODOCUMENTO = ' + QuotedStr(DocTipo));
    Qry.SQL.Add('  AND T.REGISTRO = ' + QuotedStr(DocReg));
    Qry.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(DocNum));
    Qry.SQL.Add('  AND T.DATADOCUMENTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DocData)));
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TExportForm.Multi_MarkAsExported_Primanota(Codice: Integer;
  Data: TDatetime);
var
  Qry: TIBOQuery;
begin
  Qry := TIBOQuery.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE PRIMANOT P SET P.EXPORTED = ''T''');
    Qry.SQL.Add('WHERE P.CODICE = ' + IntToStr(Codice));
    Qry.SQL.Add('  AND P.DATA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Data)));
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

// Procedure che chiude la query (Fatture)
procedure TExportForm.Multi_CloseQuery_Fatture;
begin
  // Imposta ed apre la query
  if QryMulti.Active then QryMulti.Close;
end;
// Procedure che chiude la query (primanota)
procedure TExportForm.Multi_CloseQuery_Primanota;
begin
  // Imposta ed apre la query
  if QryMultiPrimanota.Active then QryMultiPrimanota.Close;
end;

// Conversione date per multi
function TExportForm.Multi_ConvertiData(D:TDateTime): String;
begin
  Result := FormatDateTime('ddmmyyyy', D);
end;

// COnversione di campi alfanumerici per levante ma numerici per Multi
function TExportForm.Multi_AlphaToInteger(V:String): Int64;
var
  i: Integer;
  SoloCifre: Boolean;
begin
  SoloCifre := True;
  V := Trim(V);
  if V = '' then begin
    Result := 0;
    Exit;
  end;
  for i := 1 to Length(V) do begin
    if (Ord(V[i]) < 48) or (Ord(V[i]) > 57) then begin
      SoloCifre := False;
      Break;
    end;
  end;
  if not SoloCifre then begin
    Result := 0;
  end;
  Result := StrToInt64(V);
end; 

// Procedure che esporta il record corrente (fattura)
function TExportForm.Multi_EsportaRecord_Fattura: String;
var
  L: String;
  LRagioneSociale, LPersonaFisica, LDivide: String;
  LImportoContoReddito, LImportoContoBollo, LImportoContoSpese: Double;
  LEmptyContiRicavoCount: Integer;
  ImportoTmp: Double;
begin
  L := L + DM1.PadR(Trim(DM1.TableDatiAziendaEXPORT_CODICEDITTA.AsString), '0', 5);   // TRF-DITTA
  L := L + '3';   // TRF-VERSIONE
  L := L + '0';   // TRF-TARC
  // IN base al tipo di persona (fisica o giuridica) determina alcuni valori
  //  su variabili locali
  if (QryMultiTIPOPERSONA.AsString = 'F') then
  begin
    LPersonaFisica := 'S';
    LRagioneSociale := Trim(QryMultiCOGNOME.AsString) + ' ';
    LDivide := IntToStr(Length(LRagioneSociale));
    LRagioneSociale := LRagioneSociale + Trim(QryMultiNOME.AsString);
  end
  else if (QryMultiTIPOPERSONA.AsString = 'G') or (QryMultiTIPOPERSONA.AsString = 'P') then
  begin
    LPersonaFisica := 'N';
    LRagioneSociale := Trim(QryMultiRAGIONESOCIALE.AsString);
    LDivide := '';
  end
  else
    raise Exception.Create(Self.ClassName + ': TipoPersona non corretto (' + QryMultiCODICECLIENTE.AsString + ' - ' + QryMultiRAGSOCCLI.AsString + ')');
  // Dati cliente / fornitore
  L := L + '00000';   // TRF-COD-CLIFOR
  L := L + DM1.Csv_Alpha_LeftAlign(LRagioneSociale, 32);   // TRF-RASO
  L := L + DM1.Csv_Alpha_LeftAlign(   Trim(QryMultiINDIRIZZOCLI.AsString + ' ' + QryMultiNUMCIVICOCLI.AsString)   , 30);   // TRF-IND
  L := L + DM1.Csv_Alpha_RightAlign(QryMultiCAPCLI.AsString, 5);   // TRF-CAP
  L := L + DM1.Csv_Alpha_LeftAlign(QryMultiCITTACLI.AsString, 25);   // TRF-CITTA
  L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPROVINCIACLI.AsString, 2);   // TRF-PROV
  // Se però è un cliente estero non mette qui il COdice fiscale e la partita IVA
  //  ma più in basso
  if QryMultiESTERO.AsString = 'T' then begin
    L := L + DM1.Csv_Alpha_LeftAlign('', 16);   // TRF-COFI
    L := L + DM1.PadR('', ' ', 11);   // TRF-PIVA
  end else begin
    L := L + DM1.Csv_Alpha_LeftAlign(QryMultiCODICEFISCALECLI.AsString, 16);   // TRF-COFI
    L := L + DM1.Csv_Alpha_RightAlign(QryMultiPARTITAIVACLI.AsString, 11);   // TRF-PIVA
  end;
  // Persona fisica o giuridica + divide (posizione dello spazio che divide il cognome dal nome)
  L := L + DM1.Csv_Alpha_LeftAlign(LPersonaFisica, 1);   // TRF-PF
  L := L + DM1.Csv_Alpha_RightAlign(LDivide, 2);   // TRF-DIVIDE
  // Se è un cliente estero mette qui il COdice fiscale e la partita IVA
  //  (invece che più su) e imposta anche il codice del paese estero
  //  altrimenti li lascia tutti vuoti
  if QryMultiESTERO.AsString = 'T' then begin
    L := L + DM1.PadR(QryMultiESTERO_CODICE.AsString, ' ', 4);   // TRF-PAESE
    L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPARTITAIVACLI.AsString, 12);   // TRF-PIVA-ESTERO
    L := L + DM1.Csv_Alpha_LeftAlign(QryMultiCODICEFISCALECLI.AsString, 20);   // TRF-COFI-ESTERO
  end else begin
    L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-PAESE
    L := L + DM1.Csv_Alpha_LeftAlign('', 12);   // TRF-PIVA-ESTERO
    L := L + DM1.Csv_Alpha_LeftAlign('', 20);   // TRF-COFI-ESTERO
  end;

  // Dati di nascita
  L := L + DM1.Csv_Alpha_LeftAlign('', 1);   // TRF-SESSO
  L := L + DM1.Csv_Alpha_LeftAlign('', 8);   // TRF-DTNAS
  L := L + DM1.Csv_Alpha_LeftAlign('', 25);   // TRF-COMNA
  L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-PRVNA
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-PREF
  L := L + DM1.Csv_Alpha_LeftAlign('', 20);   // TRF-NTELE-NUM
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-FAX-PREF
  L := L + DM1.Csv_Alpha_LeftAlign('', 9);   // TRF-FAX-NUM
  L := L + DM1.Csv_Alpha_LeftAlign('', 7);   // TRF-CFCONTO
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-CFCODPAG
  L := L + DM1.Csv_Alpha_LeftAlign('', 5);   // TRF-CFBANCA
  L := L + DM1.Csv_Alpha_LeftAlign('', 5);   // TRF-AGENZIA
  L := L + DM1.Csv_Alpha_LeftAlign('', 1);   // TRF-CFINTERM

  // Dati fattura
  L := L + DM1.Csv_Alpha_LeftAlign('001', 3);   // TRF-CAUSALE
  L := L + DM1.Csv_Alpha_LeftAlign('Fatt.di vendita', 15);   // TRF-CAU-DES
  L := L + DM1.Csv_Alpha_LeftAlign('', 18);   // TRF-CAU-AGG
  L := L + DM1.Csv_Alpha_LeftAlign('', 34);   // TRF-CAU-AGG-1
  L := L + DM1.Csv_Alpha_LeftAlign('', 34);   // TRF-CAU-AGG-2
  L := L + DM1.Csv_Alpha_LeftAlign(Multi_ConvertiData(QryMultiDATADOCUMENTO.AsDateTime), 8);   // TRF-DATA-REGISTRAZIONE
  L := L + DM1.Csv_Alpha_LeftAlign(Multi_ConvertiData(QryMultiDATADOCUMENTO.AsDateTime), 8);   // TRF-DATA-DOC
  L := L + DM1.Csv_Alpha_LeftAlign('', 8);   // TRF-NUM-DOC-FOR
  L := L + DM1.Csv_Num_RightAlign(QryMultiNUMORDPREV.AsInteger, 0, 5);   // TRF-NDOC
  L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-SERIE (Tabella di conversione? Perchè su Multi sono max 2 caratteri ed è numerico)
  L := L + DM1.Csv_Alpha_LeftAlign('', 6);   // TRF-EC-PARTITA
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-EC-PARTITA-ANNO
  L := L + DM1.Csv_Alpha_LeftAlign('', 3);   // TRF-EC-COD-VAL
  L := L + DM1.Csv_Alpha_LeftAlign('', 13);   // TRF-EC-CAMBIO
  L := L + DM1.Csv_Alpha_LeftAlign('', 8);   // TRF-EC-DATA-CAMBIO
  L := L + DM1.Csv_Alpha_LeftAlign('', 16);   // TRF-EC-TOT-DOC-VAL
  L := L + DM1.Csv_Alpha_LeftAlign('', 16);   // TRF-EC-TOT-IVA-VAL
  L := L + DM1.Csv_Alpha_LeftAlign('', 6);   // TRF-PLAFOND

  // Dati IVA
  // (1)
  ImportoTmp := DM1.Arrotonda(QryMultiTOTALEIMPONIBILE1.AsFloat,2);
  if (ImportoTmp = 0) and (QryMultiCODICEIVA1.AsInteger = 1) and MultiNoExportCI1IfZero.Checked then
    L := L + DM1.Csv_Alpha_LeftAlign('', 31)
  else
  begin
    L := L + DM1.Csv_Num_RightAlign(ImportoTmp, 100, 12);   // TRF-IMPONIB
    L := L + DM1.PadR(DM1.AliquotaIva_GetCodiceExport(QryMultiCODICEIVA1.AsInteger), ' ', 3);   // TRF-ALIQ
    L := L + DM1.Csv_Alpha_LeftAlign('', 3);   // TRF-ALIQ-AGRICOLA
    L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-IVA11
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(QryMultiIMPORTOIVA1.AsFloat,2), 100, 11);   // TRF-IMPOSTA
  end;
  // (2)
  ImportoTmp := DM1.Arrotonda(QryMultiTOTALEIMPONIBILE2.AsFloat,2);
  if (ImportoTmp = 0) and (QryMultiCODICEIVA2.AsInteger = 1) and MultiNoExportCI1IfZero.Checked then
    L := L + DM1.Csv_Alpha_LeftAlign('', 31)
  else
  begin
    L := L + DM1.Csv_Num_RightAlign(ImportoTmp, 100, 12);   // TRF-IMPONIB
    L := L + DM1.PadR(DM1.AliquotaIva_GetCodiceExport(QryMultiCODICEIVA2.AsInteger), ' ', 3);   // TRF-ALIQ
    L := L + DM1.Csv_Alpha_LeftAlign('', 3);   // TRF-ALIQ-AGRICOLA
    L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-IVA11
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(QryMultiIMPORTOIVA2.AsFloat,2), 100, 11);   // TRF-IMPOSTA
  end;
  // (3)
  ImportoTmp := DM1.Arrotonda(QryMultiTOTALEIMPONIBILE3.AsFloat,2);
  if (ImportoTmp = 0) and (QryMultiCODICEIVA3.AsInteger = 1) and MultiNoExportCI1IfZero.Checked then
    L := L + DM1.Csv_Alpha_LeftAlign('', 31)
  else
  begin
    L := L + DM1.Csv_Num_RightAlign(ImportoTmp, 100, 12);   // TRF-IMPONIB
    L := L + DM1.PadR(DM1.AliquotaIva_GetCodiceExport(QryMultiCODICEIVA3.AsInteger), ' ', 3);   // TRF-ALIQ
    L := L + DM1.Csv_Alpha_LeftAlign('', 3);   // TRF-ALIQ-AGRICOLA
    L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-IVA11
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(QryMultiIMPORTOIVA3.AsFloat,2), 100, 11);   // TRF-IMPOSTA
  end;
  // (4)
  ImportoTmp := DM1.Arrotonda(QryMultiTOTALEIMPONIBILE4.AsFloat,2);
  if (ImportoTmp = 0) and (QryMultiCODICEIVA4.AsInteger = 1) and MultiNoExportCI1IfZero.Checked then
    L := L + DM1.Csv_Alpha_LeftAlign('', 31)
  else
  begin
    L := L + DM1.Csv_Num_RightAlign(ImportoTmp, 100, 12);   // TRF-IMPONIB
    L := L + DM1.PadR(DM1.AliquotaIva_GetCodiceExport(QryMultiCODICEIVA4.AsInteger), ' ', 3);   // TRF-ALIQ
    L := L + DM1.Csv_Alpha_LeftAlign('', 3);   // TRF-ALIQ-AGRICOLA
    L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-IVA11
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(QryMultiIMPORTOIVA4.AsFloat,2), 100, 11);   // TRF-IMPOSTA
  end;
  // (5,6,7,8)  NB: Ogni elemento è lungo 31 caratteri
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (5)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (6)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (7)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (8)

  // Totale fattura
  L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(QryMultiTOTALEDOCUMENTO.AsFloat,2), 100, 12);   // TRF-TOT-FATT

  // ---------------------------------------------------------------------------
  // Conti di ricavo/costo    (NB: sono 8 elementi di 19 car. ciascuno)
  //  Prima determina alcuni valori in base alla situazione
  LEmptyContiRicavoCount := 7; //8 conti in totale meno uno perchè almeno un conto di reddito c'è sempre)
  //  (Conto Bollo - Se è specificato un conto apposito per il bollo lo separa altrimenti lo lascia tutto nel conto di reddito)
  LImportoContoBollo := 0;
  if Trim(DM1.TableDatiAziendaEXPORT_CONTOBOLLO.AsString) <> '' then
    LImportoContoBollo := DM1.Arrotonda(QryMultiBOLLOIMPORTO.AsFloat,2);
  //  (Conto Spese - Se è specificato un conto apposito per le spese lo separa altrimenti lo lascia tutto nel conto di reddito)
  LImportoContoSpese := 0;
  if Trim(DM1.TableDatiAziendaEXPORT_CONTOSPESE.AsString) <> '' then
    LImportoContoSpese := DM1.Arrotonda(QryMultiSPESE.AsFloat,2);
  //  (Conto di reddito (al netto di bolli e spese se sono stati specificati appositi conti)
  LImportoContoReddito := DM1.Arrotonda(QryMultiTOTALEIMPONIBILE.AsFloat,2) - LImportoContoBollo - LImportoContoSpese;
  // (1)
  // TRF-CONTO-RIC
  if (QryMultiRITACCPERC.AsFloat <> 0) then
    L := L + DM1.Csv_Alpha_RightAlign(Trim(DM1.TableDatiAziendaEXPORT_CONTORICAVOCOSTORITACC.AsString), 7)   // TRF-CONTO-RIC
  else if (QryMultiCAUSALE_EXPORT_CONTO.AsString <> '') then
     L := L + DM1.Csv_Alpha_RightAlign(Trim(QryMultiCAUSALE_EXPORT_CONTO.AsString), 7)// TRF-CONTO-RIC
  else
     L := L + DM1.Csv_Alpha_RightAlign(Trim(DM1.TableDatiAziendaEXPORT_CONTORICAVOCOSTO.AsString), 7);        // TRF-CONTO-RIC
  L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(LImportoContoReddito,2), 100, 12); // TRF-IMP-RIC
  // (2)
  // BOLLO (se presente)
  if LImportoContoBollo <> 0 then
  begin
    L := L + DM1.Csv_Alpha_RightAlign(Trim(DM1.TableDatiAziendaEXPORT_CONTOBOLLO.AsString), 7);   // TRF-CONTO-RIC
    L := L + DM1.Csv_Num_RightAlign(LImportoContoBollo, 100, 12); // TRF-IMP-RIC
    LEmptyContiRicavoCount := LEmptyContiRicavoCount - 1;  // Decrementa il numero di conti vuoti da aggiungere alla fine per raggiungere il numero totale di 8 conti di reddito come da tracciato
  end;
  // (3)
  // SPESE (se presente)
  if LImportoContoSpese <> 0 then
  begin
    L := L + DM1.Csv_Alpha_RightAlign(Trim(DM1.TableDatiAziendaEXPORT_CONTOSPESE.AsString), 7);   // TRF-CONTO-RIC
    L := L + DM1.Csv_Num_RightAlign(LImportoContoSpese, 100, 12); // TRF-IMP-RIC
    LEmptyContiRicavoCount := LEmptyContiRicavoCount - 1;  // Decrementa il numero di conti vuoti da aggiungere alla fine per raggiungere il numero totale di 8 conti di reddito come da tracciato
  end;
  // (2,3,4,5,6,7,8 - quelli relativi a spese e bollo se presenti)
  while (LEmptyContiRicavoCount > 0) do
  begin
    L := L + DM1.Csv_Alpha_LeftAlign('', 19);
    LEmptyContiRicavoCount := LEmptyContiRicavoCount - 1;  // Decrementa il numero di conti vuoti da aggiungere alla fine per raggiungere il numero totale di 8 conti di reddito come da tracciato
  end;
  // ---------------------------------------------------------------------------


//### AGGIUNGERE QUI IL NUOVO CAMPO PER GRAZIANO
  // Filler fino alla posizione del campo/flag "TRF-XNUM-ORI-20", "Numero documento originale alfanumerico da 20 caratteri"
  //  Il campo  è alla posizione 5924
  L := DM1.Csv_Alpha_LeftAlign(L, 5923);
  // Nuovo campo con il numero documento originale aggiunto perchè altrimenti i software TeamSystem non importavano più
  //  le fatture (dopo la fattura elettronica)
  L := L + DM1.Csv_Num_RightAlign(QryMultiNUMORDPREV.AsInteger, 0, 20);   // "TRF-XNUM-ORI-20" ex "TRF-NDOC"



  // Filler fino alla posizione del campo/flag "TRF-AN-OMONIMI", "Considera
  //  omonimo (S/N) (S significa che la partita iva identifica univocamente
  //  l'anagrafica)"
  //  il campo è alla posizione 6289
  L := DM1.Csv_Alpha_LeftAlign(L, 6288);
  // Imposta fisso a 'S' il flag relativo "TRF-AN-OMONIMI"
  L := L + 'S';   // TRF-AN-OMONIMI

  // Filler fino alla posizione della descrizione stato estero
  //  il campo è alla posizione 6973
  L := DM1.Csv_Alpha_LeftAlign(L, 6972);
  // Descrizione Stato Estero
  L := L + DM1.Csv_Alpha_LeftAlign(QryMultiESTERO_DESCRIZIONE.AsString, 20);   // TRF-CONTEA-ESTERO
  // Imposta fisso a 'S' il flag relativo all'art. 21 dell'anagrafica
  L := L + 'S';   // TRF-ART21-ANAG

  // Filler fino alla fine (7000 caratteri)
  L := DM1.Csv_Alpha_LeftAlign(L, 7000);

  // Ritorna la riga
  Result := L;
end;

// Procedure che esporta il record corrente (primanota)
function TExportForm.Multi_EsportaRecord_Primanota: String;
var
  L: String;
  LRagioneSociale, LPersonaFisica, LDivide: String;
  LImportoContoReddito, LImportoContoBollo, LImportoContoSpese: Double;
  LCassaDare: Extended;
  LCassaAvere: Extended;
  LFuoriEntrate: string;
  LFuoriDare: Extended;
  LFuoriAvere: Extended;
  LFuoriDescriz: string;
  LCurrValue, LSaldo: Double;
  LEmptyCount: Integer;
  LContoBanca: String;
  LContoAbbuoniAttivi, LContoAbbuoniPassivi: String;
begin

  // Determina i conti abbuoni attivi
  LContoAbbuoniAttivi := Trim(DM1.TableDatiAziendaEXPORT_CONTOABBUONIATTIVI.AsString);
  if LContoAbbuoniAttivi = '' then
    LContoAbbuoniAttivi := Trim(DM1.TableDatiAziendaEXPORT_CONTORICAVOCOSTO.AsString);
  // Determina i conti abbuoni passivi
  LContoAbbuoniPassivi := Trim(DM1.TableDatiAziendaEXPORT_CONTOABBUONIPASSIVI.AsString);
  if LContoAbbuoniPassivi = '' then
    LContoAbbuoniPassivi := Trim(DM1.TableDatiAziendaEXPORT_CONTORICAVOCOSTO.AsString);

  // Inizio esportazione
  L := L + DM1.PadR(Trim(DM1.TableDatiAziendaEXPORT_CODICEDITTA.AsString), '0', 5);   // TRF-DITTA
  L := L + '3';   // TRF-VERSIONE
  L := L + '0';   // TRF-TARC

  // IN base al tipo di persona (fisica o giuridica) determina alcuni valori
  //  su variabili locali
  if (QryMultiPrimanotaTIPOPERSONA.AsString = 'F') then
  begin
    LPersonaFisica := 'S';
    LRagioneSociale := Trim(QryMultiPrimanotaCOGNOME.AsString) + ' ';
    LDivide := IntToStr(Length(LRagioneSociale));
    LRagioneSociale := LRagioneSociale + Trim(QryMultiPrimanotaNOME.AsString);
  end
  else if (QryMultiPrimanotaTIPOPERSONA.AsString = 'G') or (QryMultiTIPOPERSONA.AsString = 'P') then
  begin
    LPersonaFisica := 'N';
    LRagioneSociale := Trim(QryMultiPrimanotaRAGIONESOCIALE.AsString);
    LDivide := '';
  end
  else
    raise Exception.Create(Self.ClassName + ': TipoPersona non corretto (' + QryMultiPrimanotaCLIENTE.AsString + ' - ' + QryMultiPrimanotaRAGIONESOCIALE.AsString + ')');

  // Caricamento importi e saldi
  LCassaDare      := QryMultiPrimanotaCASSAENTRATE.AsExtended;
  LCassaAvere     := QryMultiPrimanotaCASSAUSCITE.AsExtended;
  LFuoriDare      := QryMultiPrimanotaFUORIENTRATE.AsExtended;
  LFuoriAvere     := QryMultiPrimanotaFUORIUSCITE.AsExtended;
  LFuoriDescriz   := QryMultiPrimanotaDESCFUORI.AsString;

  // Dati cliente / fornitore
  L := L + '00000';   // TRF-COD-CLIFOR
  L := L + DM1.Csv_Alpha_LeftAlign(LRagioneSociale, 32);   // TRF-RASO
  L := L + DM1.Csv_Alpha_LeftAlign(   Trim(QryMultiPrimanotaINDIRIZZO.AsString + ' ' + QryMultiPrimanotaNUMCIVICO.AsString)   , 30);   // TRF-IND
  L := L + DM1.Csv_Alpha_RightAlign(QryMultiPrimanotaCAP.AsString, 5);   // TRF-CAP
  L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPrimanotaCITTA.AsString, 25);   // TRF-CITTA
  L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPrimanotaPROVINCIA.AsString, 2);   // TRF-PROV
  // Se però è un cliente estero non mette qui il COdice fiscale e la partita IVA
  //  ma più in basso
  if QryMultiPrimanotaESTERO.AsString = 'T' then begin
    L := L + DM1.Csv_Alpha_LeftAlign('', 16);   // TRF-COFI
    L := L + DM1.PadR('', ' ', 11);   // TRF-PIVA
  end else begin
    L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPrimanotaCODICEFISCALE.AsString, 16);   // TRF-COFI
    L := L + DM1.Csv_Alpha_RightAlign(QryMultiPrimanotaPARTITAIVA.AsString, 11);   // TRF-PIVA
  end;
  // Persona fisica o giuridica + divide (posizione dello spazio che divide il cognome dal nome)
  L := L + DM1.Csv_Alpha_LeftAlign(LPersonaFisica, 1);   // TRF-PF
  L := L + DM1.Csv_Alpha_RightAlign(LDivide, 2);   // TRF-DIVIDE
  // Se è un cliente estero mette qui il COdice fiscale e la partita IVA
  //  (invece che più su) e imposta anche il codice del paese estero
  //  altrimenti li lascia tutti vuoti
  if QryMultiPrimanotaESTERO.AsString = 'T' then begin
    L := L + DM1.PadR(QryMultiPrimanotaESTERO_CODICE.AsString, ' ', 4);   // TRF-PAESE
    L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPrimanotaPARTITAIVA.AsString, 12);   // TRF-PIVA-ESTERO
    L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPrimanotaCODICEFISCALE.AsString, 20);   // TRF-COFI-ESTERO
  end else begin
    L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-PAESE
    L := L + DM1.Csv_Alpha_LeftAlign('', 12);   // TRF-PIVA-ESTERO
    L := L + DM1.Csv_Alpha_LeftAlign('', 20);   // TRF-COFI-ESTERO
  end;

  // Dati di nascita
  L := L + DM1.Csv_Alpha_LeftAlign('', 1);   // TRF-SESSO
  L := L + DM1.Csv_Alpha_LeftAlign('', 8);   // TRF-DTNAS
  L := L + DM1.Csv_Alpha_LeftAlign('', 25);   // TRF-COMNA
  L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-PRVNA
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-PREF
  L := L + DM1.Csv_Alpha_LeftAlign('', 20);   // TRF-NTELE-NUM
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-FAX-PREF
  L := L + DM1.Csv_Alpha_LeftAlign('', 9);   // TRF-FAX-NUM
  L := L + DM1.Csv_Alpha_LeftAlign('', 7);   // TRF-CFCONTO
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-CFCODPAG
  L := L + DM1.Csv_Alpha_LeftAlign('', 5);   // TRF-CFBANCA
  L := L + DM1.Csv_Alpha_LeftAlign('', 5);   // TRF-AGENZIA
  L := L + DM1.Csv_Alpha_LeftAlign('', 1);   // TRF-CFINTERM

  // Dati fattura
  L := L + DM1.Csv_Alpha_LeftAlign(DM1.TableDatiAziendaEXPORT_CODICECAUSALEPRIMANOTA.AsString, 3);   // TRF-CAUSALE (Movimenti diversi a diversi)
  L := L + DM1.Csv_Alpha_LeftAlign(DM1.TableDatiAziendaEXPORT_DESCCAUSALEPRIMANOTA.AsString, 15);   // TRF-CAU-DES
  L := L + DM1.Csv_Alpha_LeftAlign('', 18);   // TRF-CAU-AGG
  L := L + DM1.Csv_Alpha_LeftAlign('', 34);   // TRF-CAU-AGG-1
  L := L + DM1.Csv_Alpha_LeftAlign('', 34);   // TRF-CAU-AGG-2
  L := L + DM1.Csv_Alpha_LeftAlign(Multi_ConvertiData(QryMultiPrimanotaDATA.AsDateTime), 8);   // TRF-DATA-REGISTRAZIONE
  L := L + DM1.Csv_Alpha_LeftAlign('', 8);   // TRF-DATA-DOC
  L := L + DM1.Csv_Alpha_LeftAlign('', 8);   // TRF-NUM-DOC-FOR
  L := L + DM1.Csv_Alpha_LeftAlign('', 5);   // TRF-NDOC
  L := L + DM1.Csv_Alpha_LeftAlign('', 2);   // TRF-SERIE (Tabella di conversione? Perchè su Multi sono max 2 caratteri ed è numerico)
  L := L + DM1.Csv_Alpha_LeftAlign('', 6);   // TRF-EC-PARTITA
  L := L + DM1.Csv_Alpha_LeftAlign('', 4);   // TRF-EC-PARTITA-ANNO
  L := L + DM1.Csv_Alpha_LeftAlign('', 3);   // TRF-EC-COD-VAL
  L := L + DM1.Csv_Alpha_LeftAlign('', 13);   // TRF-EC-CAMBIO
  L := L + DM1.Csv_Alpha_LeftAlign('', 8);   // TRF-EC-DATA-CAMBIO
  L := L + DM1.Csv_Alpha_LeftAlign('', 16);   // TRF-EC-TOT-DOC-VAL
  L := L + DM1.Csv_Alpha_LeftAlign('', 16);   // TRF-EC-TOT-IVA-VAL
  L := L + DM1.Csv_Alpha_LeftAlign('', 6);   // TRF-PLAFOND

  // Dati IVA    (NB: sono 8 elementi di 31 car. ciascuno)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (1)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (2)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (3)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (4)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (5)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (6)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (7)
  L := L + DM1.Csv_Alpha_LeftAlign('', 31);   // (8)

  // Totale fattura
  L := L + DM1.Csv_Alpha_LeftAlign('', 12);   // TRF-TOT-FATT

  // Conti di ricavo/costo    (NB: sono 8 elementi di 19 car. ciascuno)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (1)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (2)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (3)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (4)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (5)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (6)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (7)
  L := L + DM1.Csv_Alpha_LeftAlign('', 19);   // (8)

  //Dati eventuale pagamento fattura o movimenti diversi
  L := L + DM1.Csv_Alpha_LeftAlign('', 3);    // TRF-CAU-PAGAM
  L := L + DM1.Csv_Alpha_LeftAlign('', 15);   // TRF-CAU-DES-PAGAM
  L := L + DM1.Csv_Alpha_LeftAlign('', 34);   // TRF-CAU-AGG-1-PAGAM
  L := L + DM1.Csv_Alpha_LeftAlign('', 34);   // TRF-CAU-AGG-2-PAGAM
  // ---------------------------------------------------------------------------
  // In tutto sono 80 elementi
  LEmptyCount := 80;
  LSaldo := 0;
  // Cassa entrate (Dare)
  LCurrValue := QryMultiPrimanotaCASSAENTRATE.AsFloat;
  if LCurrValue <> 0 then
  begin
    Dec(LEmptyCount);
    LSaldo := LSaldo + LCurrValue; // (va in dare quindi somma)
    L := L + DM1.Csv_Alpha_RightAlign(Trim(DM1.TableDatiAziendaEXPORT_CONTOCASSA.AsString), 7); // TRF-CONTO
    L := L + DM1.Csv_Alpha_LeftAlign('D', 1); // TRF-DA
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(LCurrValue,2), 100, 12); // TRF-IMPORTO
    L := L + DM1.Csv_Alpha_LeftAlign('', 18); // TRF-CAU-AGGIUNT
    L := L + DM1.Csv_Alpha_LeftAlign('', 6); // TRF-EC-PARTITA-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 4); // TRF-EC-PARTITA-ANNO-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 16); // TRF-EC-IMP-VAL
  end;
  // Cassa uscite (Avere)
  LCurrValue := QryMultiPrimanotaCASSAUSCITE.AsFloat;
  if LCurrValue <> 0 then
  begin
    Dec(LEmptyCount);
    LSaldo := LSaldo - LCurrValue; // (va in avere quindi sottrae)
    L := L + DM1.Csv_Alpha_RightAlign(Trim(DM1.TableDatiAziendaEXPORT_CONTOCASSA.AsString), 7); // TRF-CONTO
    L := L + DM1.Csv_Alpha_LeftAlign('A', 1); // TRF-DA
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(LCurrValue,2), 100, 12); // TRF-IMPORTO
    L := L + DM1.Csv_Alpha_LeftAlign('', 18); // TRF-CAU-AGGIUNT
    L := L + DM1.Csv_Alpha_LeftAlign('', 6); // TRF-EC-PARTITA-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 4); // TRF-EC-PARTITA-ANNO-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 16); // TRF-EC-IMP-VAL
  end;
  // Banca entrate (Dare)
  LCurrValue := QryMultiPrimanotaFUORIENTRATE.AsFloat;
  if LCurrValue <> 0 then
  begin
    // Controlla conto banca
    LContoBanca := Trim(QryMultiPrimanotaBANCA_CONTO.AsString);
    if (Trim(QryMultiPrimanotaDESCFUORI.AsString) = '') or (LContoBanca = '') then
      raise Exception.Create(Self.ClassName + ': Conto banca non valido (cod. ' + QryMultiPrimanotaCODICE.AsString + ' del ' + QryMultiPrimanotaDATA.AsString + ' "' + QryMultiPrimanotaDESCFUORI.AsString + '")');
    Dec(LEmptyCount);
    LSaldo := LSaldo + LCurrValue; // (va in dare quindi somma)
    L := L + DM1.Csv_Alpha_RightAlign(Trim(QryMultiPrimanotaBANCA_CONTO.AsString), 7); // TRF-CONTO
    L := L + DM1.Csv_Alpha_LeftAlign('D', 1); // TRF-DA
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(LCurrValue,2), 100, 12); // TRF-IMPORTO
    L := L + DM1.Csv_Alpha_LeftAlign('', 18); // TRF-CAU-AGGIUNT
    L := L + DM1.Csv_Alpha_LeftAlign('', 6); // TRF-EC-PARTITA-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 4); // TRF-EC-PARTITA-ANNO-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 16); // TRF-EC-IMP-VAL
  end;
  // Banca entrate (Avere)
  LCurrValue := QryMultiPrimanotaFUORIUSCITE.AsFloat;
  if LCurrValue <> 0 then
  begin
    // Controlla conto banca
    LContoBanca := Trim(QryMultiPrimanotaBANCA_CONTO.AsString);
    if (Trim(QryMultiPrimanotaDESCFUORI.AsString) = '') or (LContoBanca = '') then
      raise Exception.Create(Self.ClassName + ': Conto banca non valido (cod. ' + QryMultiPrimanotaCODICE.AsString + ' del ' + QryMultiPrimanotaDATA.AsString + ' "' + QryMultiPrimanotaDESCFUORI.AsString + '")');
    Dec(LEmptyCount);
    LSaldo := LSaldo - LCurrValue; // (va in avere quindi sottrae)
    L := L + DM1.Csv_Alpha_RightAlign(Trim(QryMultiPrimanotaBANCA_CONTO.AsString), 7); // TRF-CONTO
    L := L + DM1.Csv_Alpha_LeftAlign('A', 1); // TRF-DA
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(LCurrValue,2), 100, 12); // TRF-IMPORTO
    L := L + DM1.Csv_Alpha_LeftAlign('', 18); // TRF-CAU-AGGIUNT
    L := L + DM1.Csv_Alpha_LeftAlign('', 6); // TRF-EC-PARTITA-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 4); // TRF-EC-PARTITA-ANNO-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 16); // TRF-EC-IMP-VAL
  end;
  // Abbbuoni passivi (Avere)
  LCurrValue := QryMultiPrimanotaABBUONIPASSIVI.AsFloat;
  if LCurrValue <> 0 then
  begin
    Dec(LEmptyCount);
    LSaldo := LSaldo + LCurrValue; // (va in dare quindi soma)
    L := L + DM1.Csv_Alpha_RightAlign(LContoAbbuoniPassivi, 7); // TRF-CONTO
    L := L + DM1.Csv_Alpha_LeftAlign('D', 1); // TRF-DA
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(LCurrValue,2), 100, 12); // TRF-IMPORTO
    L := L + DM1.Csv_Alpha_LeftAlign('', 18); // TRF-CAU-AGGIUNT
    L := L + DM1.Csv_Alpha_LeftAlign('', 6); // TRF-EC-PARTITA-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 4); // TRF-EC-PARTITA-ANNO-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 16); // TRF-EC-IMP-VAL
  end;
  // Abbbuoni attivi (Dare)
  LCurrValue := QryMultiPrimanotaABBUONIATTIVI.AsFloat;
  if LCurrValue <> 0 then
  begin
    Dec(LEmptyCount);
    LSaldo := LSaldo - LCurrValue; // (va in avere quindi sottrae)
    L := L + DM1.Csv_Alpha_RightAlign(LContoAbbuoniAttivi, 7); // TRF-CONTO
    L := L + DM1.Csv_Alpha_LeftAlign('A', 1); // TRF-DA
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(LCurrValue,2), 100, 12); // TRF-IMPORTO
    L := L + DM1.Csv_Alpha_LeftAlign('', 18); // TRF-CAU-AGGIUNT
    L := L + DM1.Csv_Alpha_LeftAlign('', 6); // TRF-EC-PARTITA-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 4); // TRF-EC-PARTITA-ANNO-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 16); // TRF-EC-IMP-VAL
  end;
  // A questo punto se è assegnato un soggetto e in base al fatto che il saldo sia dare o avere
  //  e diverso da zero aggiunge anche il conto relativo al cliente/fornitore e in dare o avere
  //  in base al saldo positivo o negativo.
  if (QryMultiPrimanotaCLIENTE.AsInteger > 0) and (LSaldo <> 0) then
  begin
    Dec(LEmptyCount);
    // Se è un fornitore imposta il conto come fornitore altrimenti come cliente
    if Uppercase(QryMultiPrimanotaCLIENTEFORNITORE.AsString) = 'FORNITORE' then
      L := L + DM1.Csv_Alpha_RightAlign('9999998', 7)  // TRF-CONTO (Fornitore dai dati anagrafici sopra)
    else
      L := L + DM1.Csv_Alpha_RightAlign('9999999', 7); // TRF-CONTO (Cliente dai dati anagrafici sopra)
    // Se il saldo è positivo (saldo dare) lo registra in avere
    if LSaldo > 0 then
      L := L + DM1.Csv_Alpha_LeftAlign('A', 1)  // TRF-DA
    else
      L := L + DM1.Csv_Alpha_LeftAlign('D', 1); // TRF-DA
    // Importo
    L := L + DM1.Csv_Num_RightAlign(DM1.Arrotonda(Abs(LSaldo),2), 100, 12); // TRF-IMPORTO
    // Altro
    L := L + DM1.Csv_Alpha_LeftAlign('', 18); // TRF-CAU-AGGIUNT
    L := L + DM1.Csv_Alpha_LeftAlign('', 6); // TRF-EC-PARTITA-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 4); // TRF-EC-PARTITA-ANNO-PAG
    L := L + DM1.Csv_Alpha_LeftAlign('', 16); // TRF-EC-IMP-VAL
  end;
  // (tutti i successivi conti fino al..80, in tutto ogni blocco occupa 64 caratteri)
  while (LEmptyCount > 0) do
  begin
    Dec(LEmptyCount);  // Decrementa il numero di conti vuoti da aggiungere alla fine per raggiungere il numero totale di 8 conti di reddito come da tracciato
    L := L + DM1.Csv_Alpha_LeftAlign('', 64);
  end;
  // ---------------------------------------------------------------------------

  // Filler fino alla posizione della descrizione stato estero
  //  il campo è alla posizione 6973
  L := DM1.Csv_Alpha_LeftAlign(L, 6972);
  // Descrizione Stato Estero
  L := L + DM1.Csv_Alpha_LeftAlign(QryMultiPrimanotaESTERO_DESCRIZIONE.AsString, 20);   // TRF-CONTEA-ESTERO
  // Imposta fisso a 'S' il flag relativo all'art. 21 dell'anagrafica
  L := L + 'S';   // TRF-ART21-ANAG

  // Filler fino alla fine (7000 caratteri)
  L := DM1.Csv_Alpha_LeftAlign(L, 7000);

  // Ritorna la riga
  Result := L;
end;

// Procedure che esporta le fatture di vendita verso multi della teamsystem
procedure TExportForm.Multi_Esporta;
var
  FullPathFileName: String;
  SL: TStringList;
  ContatoreFatture, ContatorePrimanota: Integer;
  LastLine: String;
begin
  // Init
  ContatoreFatture := 0;
  ContatorePrimanota := 0;
  // Salva i paramtri impostati
  Multi_SalvaParametri;
  // Richiede all'utente il nome del file
  if not DM1.TxtSaveDialog.Execute then Exit;
  // Ricava i nome del file dalla Dialog
  // Se esiste già chiede se sovrascrivere
  FullPathFileName := DM1.TxtSaveDialog.FileName;
  if FileExists(FullPathFileName) then begin
    if DM1.Messaggi('Levante', 'Un file con lo stesso nome è già presente.'#13#13'Procedo ugualmente?', 'NB: Se si procede ugualmente i dati del vecchio file già eststente saranno perduti.', [mbYes,mbNo], 0, nil) <> mrYes
    then Exit;
  end;
  // Avvia la transazione
  DM1.DBAzienda.StartTransaction;
  try try
    // Crea la string list su cui construire l'esportazione
    SL := TStringList.Create;
    // Esportazione FATTURE
    if MultiEsportaFatture.Checked then
      ContatoreFatture := Multi_Esporta_Fatture(SL);
    // Esportazione PRIMANOTA
    if MultiEsportaPrimanota.Checked then
      ContatorePrimanota := Multi_Esporta_Primanota(SL);
    // Elimina l'ultimo LineBrack
    LastLine := SL.Text;
    LastLine := LeftStr(LastLine, Length(LastLine)-2);
    SL.Text := LastLine;
    // Salva la StringList
    //  NB: Se non ha l'estensione la mette lui a .csv
    DM1.ShowWait('Levante', 'Chiudo il file...');
    if ExtractFileExt(FullPathFileName) = '' then FullPathFileName := FullPathFileName + '.csv';
    SaveStringListWithoutLastLineBreak(SL, FullPathFileName);
//    SL.SaveToFile(FullPathFileName);
    // Commit
    DM1.DBAzienda.Commit;
    DM1.Messaggi('Levante', 'Esportazione terminata.'#13#13 + IntToStr(ContatoreFatture) + ' fatture di vendita'#13 + IntToStr(ContatorePrimanota) + ' movimenti di primanota', '', [mbOk], 0, nil);
  except
    // Rollback
    DM1.DBAzienda.Rollback;
    raise;
  end;
  finally
    // Pulizie finali
    DM1.CloseWait;
    if Assigned(SL) then SL.Free;
  end;
end;

// Salva i parametri dell'esportazione verso Multi
procedure TExportForm.Multi_SalvaParametri;
var
  Q:TIB_Cursor;
begin
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che preleverà l'indirizzo email memorizzato
    //  nella scheda anagrafica del soggetto
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE DATIAZIE SET');
    Q.SQL.Add(' EXPORT_ULTIMAEXP = :P_ULTIMAEXP');
    Q.SQL.Add(',EXPORT_ULTIMAEXP_DAL = :P_ULTIMAEXP_DAL');
    Q.SQL.Add(',EXPORT_ULTIMAEXP_AL = :P_ULTIMAEXP_AL');
    Q.SQL.Add(',EXPORT_ULTIMAEXP_FATTURE = :P_ULTIMAEXP_FATTURE');
    Q.SQL.Add(',EXPORT_ULTIMAEXP_PRIMANOTA = :P_ULTIMAEXP_PRIMANOTA');
    Q.SQL.Add(',EXPORT_NONESPORTACI1SEZERO = :P_NONESPORTACI1SEZERO');
    Q.Prepare;
    Q.Params.ParamByName('P_ULTIMAEXP').AsDateTime := Now;
    Q.Params.ParamByName('P_ULTIMAEXP_DAL').AsDateTime := MultiDallaData.Date;
    Q.Params.ParamByName('P_ULTIMAEXP_AL').AsDateTime := MultiAllaData.Date;;
    Q.Params.ParamByName('P_ULTIMAEXP_FATTURE').AsString := MultiEsportaFatture.EditValue;
    Q.Params.ParamByName('P_ULTIMAEXP_PRIMANOTA').AsString :=  MultiEsportaPrimanota.EditValue;
    Q.Params.ParamByName('P_NONESPORTACI1SEZERO').AsString :=  MultiNoExportCI1IfZero.EditValue;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Carica i parametri dell'esportazione verso Multi
procedure TExportForm.Multi_CaricaParametri;
var
  TmpStr: String;
  LastExport, LastExportFrom, LastExportTo: TDateTime;
begin
  MultiNoExportCI1IfZero.EditValue := DM1.TableDatiAziendaEXPORT_NONESPORTACI1SEZERO.AsString;
  // Carica alcune informazioni sull'ultimo tentativo di esportazione effettuato
  LastExport := DM1.TableDatiAziendaEXPORT_ULTIMAEXP.AsDateTime;
  LastExportFrom := DM1.TableDatiAziendaEXPORT_ULTIMAEXP_DAL.AsDateTime;
  LastExportTo := DM1.TableDatiAziendaEXPORT_ULTIMAEXP_AL.AsDateTime;
  if LastExport = 0 then
    TmpStr := '- - -'
  else
  begin
    if (DM1.TableDatiAziendaEXPORT_ULTIMAEXP_FATTURE.AsString = 'T') and (DM1.TableDatiAziendaEXPORT_ULTIMAEXP_PRIMANOTA.AsString = 'T') then
      TmpStr := 'fatture e primanota'
    else if (DM1.TableDatiAziendaEXPORT_ULTIMAEXP_FATTURE.AsString = 'T') and (DM1.TableDatiAziendaEXPORT_ULTIMAEXP_PRIMANOTA.AsString <> 'T') then
      TmpStr := 'solo fatture'
    else if (DM1.TableDatiAziendaEXPORT_ULTIMAEXP_FATTURE.AsString <> 'T') and (DM1.TableDatiAziendaEXPORT_ULTIMAEXP_PRIMANOTA.AsString = 'T') then
      TmpStr := 'solo primanota'
    else
      TmpStr := '';
    TmpStr := 'Ultimo tentativo di esportazione il ' + FormatDateTime('dd/mm/yyyy', LastExport) + ' alle ' + FormatDateTime('hh:nn', LastExport) + '   (' + TmpStr;
    if LastExportFrom > 0 then
      TmpStr := TmpStr + ' dal ' + FormatDateTime('dd/mm/yyyy', LastExportFrom);
    if LastExportTo > 0 then
      TmpStr := TmpStr + ' fino al ' + FormatDateTime('dd/mm/yyyy', LastExportTo);
  end;
  LabelLastExport.Caption := TmpStr + ')';
end;
// -----------------------------------------------------------------------------
// FINE: ESPORTAZIONE TEAMSYSTEM MULTI
// =============================================================================







procedure TExportForm.Button1Click(Sender: TObject);
var
  FullPathFiltro: String;
begin
  inherited;
  // Controllo
  if Trim(ComboTipoEsportazione.Text) = '' then raise Exception.Create('Filtro di esportazione non selezionato.'); 
  // Inizializzazione
  FullPathFiltro := Dm1.ExportFiltersDir + ComboTipoEsportazione.Text + '.EXP';
  // Caricamento parametri
  CaricaParametriFiltro(FullPathFiltro);
  // Se si tratta di una esportazione a file di testo...
  if (fTipoFileDestinazione = 'TXT') or (fTipoFileDestinazione = 'TESTO') or (fTipoFileDestinazione = 'TEXT') then begin
    EsportaTesto;
  // Se si tratta di una esportazione a file di Excel...
  end else if (fTipoFileDestinazione = 'XLS') or (fTipoFileDestinazione = 'EXCEL') then begin
    EsportaExcel;
  // Se il tipo di esportazione non è valido.
  end else begin
    raise Exception.Create('Tipo di esportazione non valido.');
  end;
end;


procedure TExportForm.EsportaExcel;
var
  FileNameNoExt: String;
  i: Integer;
begin
  // Prima defaultizza il nome del file se ne è specificato uno del filtro
  DM1.ExcelSaveDialog.FileName := '';
  DM1.ExcelSaveDialog.FileName := fNomeFileDestinazione;
  // Se però è stata impostata la proprietà DestinationFileNameNoExt usa questo nome
  //  questa proprietà è normalmente impostata dalla procedura che fa l'esportazione automatica di un documento
  if Trim(DestinationFileNameNoExt) <> '' then DM1.ExcelSaveDialog.FileName := Trim(DestinationFileNameNoExt);
  // Richiede all'utente il nome del file
  if DM1.ExcelSaveDialog.Execute then begin
    // Calcola il nome del file destinazione senza estensione finale
    FileNameNoExt := LeftStr(DM1.ExcelSaveDialog.FileName, (Length(DM1.ExcelSaveDialog.FileName) - Length(ExtractFileExt(DM1.ExcelSaveDialog.FileName))));
    // Verifica che il file non esista già, e se esiste chiede se lo si vuole sovrascrivere
    if FileExists(FileNameNoExt + '.xls') then begin
      if DM1.Messaggi('Esportazione', 'File già esistente !!!'#13#13'Devo proseguire e sovrascrivere il file?', 'NB: Rispondendo "SI" e quindi sovrascrivendo il file esistente i dati in esso contenuti saranno perduti.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    end;
    // Informa l'utente
    DM1.ShowWait('Esportazione XLS', 'Inizializzazione...');
    try
      // Esegue il prepare della query per poter impostare i parametri
      DM1.ShowWait('', 'Caricamento parametri...');
      Qry.Prepare;
      // Cicla per tutti gli eventuali parametri da passare alla query e li
      //  passa alla query (lo uso per esportare i documenti singoli).
      for i := 0 to Length(fQueryParams) -1 do begin
        if not VarIsNull(fQueryParams[i].ParamValue)
          then Qry.Params.ParamByName(fQueryParams[i].ParamName).Value := fQueryParams[i].ParamValue
          else Qry.Params.ParamByName(fQueryParams[i].ParamName).Clear;
      end;
      // Avvia la query per prelevare i dati da esportare
      DM1.ShowWait('', 'Caricamento dati...');
      Qry.SQL.SaveToFile(DM1.CartellaTmp + 'LastExport.SQL');
      Qry.Open;
      // Chiede alla griglia di dattarsi ai trovati dalla query
      DM1.ShowWait('', 'Adattamento griglia...');
      tvG.ClearItems;
      tvG.DataController.CreateAllItems(False);
      // Effettua l'esportazione
      G.BeginUpdate;
      // Avvia l'esportazione
      DM1.ShowWait('', 'Esportazione in corso...');
      ExportGridToExcel(
                       FileNameNoExt,                 // FileName senza estensione
                       G,                             // cxGrid
                       True,                          // AExpand
                       True,                          // ASaveAll
                       True,
                       'xls'                          // AFileExt
                      );
    finally
      // Pulizie finali
      DM1.CloseWait;
      if G.UpdateLocked then G.EndUpdate;
      if Qry.Active then Qry.Close;
      // Messaggio finale
      if AvvertiQuandoTerminato then DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;


procedure TExportForm.EsportaTesto;
var
  FileNameNoExt: String;
  i: Integer;
begin
  // Prima defaultizza il nome del file se ne è specificato uno del filtro
  DM1.TxtSaveDialog.FileName := '';
  DM1.TxtSaveDialog.FileName := fNomeFileDestinazione;
  // Se però è stata impostata la proprietà DestinationFileNameNoExt usa questo nome
  //  questa proprietà è normalmente impostata dalla procedura che fa l'esportazione automatica di un documento
  if Trim(DestinationFileNameNoExt) <> '' then DM1.TxtSaveDialog.FileName := Trim(DestinationFileNameNoExt);
  // Richiede all'utente il nome del file
  if DM1.TxtSaveDialog.Execute then begin
    // Calcola il nome del file destinazione senza estensione finale
    FileNameNoExt := LeftStr(DM1.TxtSaveDialog.FileName, (Length(DM1.TxtSaveDialog.FileName) - Length(ExtractFileExt(DM1.TxtSaveDialog.FileName))));
    // Verifica che il file non esista già, e se esiste chiede se lo si vuole sovrascrivere
    if FileExists(FileNameNoExt + '.txt') then begin
      if DM1.Messaggi('Esportazione', 'File già esistente !!!'#13#13'Devo proseguire e sovrascrivere il file?', 'NB: Rispondendo "SI" e quindi sovrascrivendo il file esistente i dati in esso contenuti saranno perduti.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    end;
    // Informa l'utente
    DM1.ShowWait('Esportazione Testo', 'Inizializzazione...');
    try
      // Esegue il prepare della query per poter impostare i parametri
      DM1.ShowWait('', 'Caricamento parametri...');
      Qry.Prepare;
      // Cicla per tutti gli eventuali parametri da passare alla query e li
      //  passa alla query (lo uso per esportare i documenti singoli).
      for i := 0 to Length(fQueryParams) -1 do begin
        if not VarIsNull(fQueryParams[i].ParamValue)
          then Qry.Params.ParamByName(fQueryParams[i].ParamName).Value := fQueryParams[i].ParamValue
          else Qry.Params.ParamByName(fQueryParams[i].ParamName).Clear;
      end;
      // Avvia la query per prelevare i dati da esportare
      DM1.ShowWait('', 'Caricamento dati...');
      Qry.SQL.SaveToFile(DM1.CartellaTmp + 'LastExport.SQL');
      Qry.Open;
      // Chiede alla griglia di dattarsi ai trovati dalla query
      DM1.ShowWait('', 'Adattamento griglia...');
      tvG.ClearItems;
      tvG.DataController.CreateAllItems(False);
      // Effettua l'esportazione
      G.BeginUpdate;
      // Avvia l'esportazione
      DM1.ShowWait('', 'Esportazione in corso...');
      ExportGridToText(FileNameNoExt,                 // FileName senza estensione
                       G,                             // cxGrid
                       True,                          // AExpand
                       True,                          // ASaveAll
                       ftxt_Separator,                // Separator
                       ftxt_StartDelimiter,           // Start field delimiter
                       ftxt_EndDelimiter              // End field delimiter
                      );
    finally
      // Pulizie finali
      DM1.CloseWait;
      if G.UpdateLocked then G.EndUpdate;
      if Qry.Active then Qry.Close;
      // Messaggio finale
      if AvvertiQuandoTerminato then DM1.Messaggi('Levante - Esportazione dati', 'Operazione terminata.', '', [mbOk], 0, nil);
    end;
  end;
end;


procedure TExportForm.CaricaParametriFiltro(FilterFileName:String);
var
   C :TMemIniFile;              // Puntatore al file INI del filtro
begin
   // Apre il file del filtro per il successivo caricamento dei parametri
   C := TMemIniFile.Create(FilterFileName);
   try
     // Controlla la presenza delle sezioni necessarie
     if not C.SectionExists('Params') then raise Exception.Create('Sezione "Params" non presente nel filtro di esportazione.');
     if not C.SectionExists('SQL') then raise Exception.Create('Sezione "SQL" non presente nel filtro di esportazione.');
     // Caricamento dei parametri
     fTipoFileDestinazione  := Uppercase(C.ReadString('Params', 'TipoFileDestinazione', 'txt'));
     fNomeFileDestinazione  := Uppercase(C.ReadString('Params', 'NomeFileDestinazione', ''));
     // Parametri per esportazione su file di testo
     ftxt_Separator         := Uppercase(C.ReadString('Params', 'txt_Separator', ''));
     ftxt_StartDelimiter    := Uppercase(C.ReadString('Params', 'txt_StartDelimiter', ''));
     ftxt_EndDelimiter      := Uppercase(C.ReadString('Params', 'EndDelimiter', ''));
     // Se il txt_Separator = '9' lo converte nel TAB
     if ftxt_Separator = '9' then ftxt_Separator := #9;
     // Caricamento della query
     Qry.Close;
     Qry.SQL.Clear;
     C.ReadSectionValues('SQL', Qry.SQL);
   finally
    C.Free;
   end;
end;



procedure TExportForm.RicalcolaDimensioni;
const
   LEFT_BORDER                  = 13;
   RIGHT_BORDER                 = 15;
   TOP_BORDER                   = 15;
   BOTTOM_BORDER                = 33;
begin
   // Imposta le dimensioni del PageControl in modo che spariscano alla vista sia
   //  i Tabs che i bordi.
   ClientArea.Left    := LEFT_BORDER;
   ClientArea.Top     := ClientTopPanel.Top + ClientTopPanel.Height + TOP_BORDER;
   ClientArea.Width   := Self.Width - LEFT_BORDER - RIGHT_BORDER;
   ClientArea.Height  := Self.Height - ClientArea.Top - BOTTOM_BORDER;
end;


procedure TExportForm.FormResize(Sender: TObject);
begin
  inherited;
  RicalcolaDimensioni;
end;

procedure TExportForm.TipoEsportazionePropertiesInitPopup(Sender: TObject);
var
   SearchRec:TSearchRec;
   NomeFile : String;
begin
   // Carica la lista dei filtri di importazione disponibili nel ComboBox
   // --------------------------------------------------
   // Inizializzazione
   ComboTipoEsportazione.Properties.Items.Clear;
   // Prima di tutto controlla che la cartella esista
   if DirectoryExists(DM1.ExportFiltersDir) then begin
      // Poi cerca il primo file
      if FindFirst(DM1.ExportFiltersDir + '*.exp', faAnyFile, SearchRec) = 0 then begin
         // Se lo trova lo aggiunge depurandolo dell'estensione
         NomeFile := SearchRec.Name;
         NomeFile := LeftStr(NomeFile, Length(NomeFile)-4);
         ComboTipoEsportazione.Properties.Items.Add(NomeFile);
         // Trova anche gli eventuali altri files dello stesso tipo e li aggiunge
         while (FindNext(SearchRec) = 0) do begin
            NomeFile := SearchRec.Name;
            NomeFile := LeftStr(NomeFile, Length(NomeFile)-4);
            ComboTipoEsportazione.Properties.Items.Add(NomeFile);
         end;
      end;
      // Distrugge SearchRec
      FindClose(SearchRec);
   end;
end;


procedure TExportForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TExportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  ExportForm := nil;
end;

procedure TExportForm.AddQueryParams(ParamName: String; ParamValue: Variant);
var
  i: Integer;
begin
  // Aggiunge un parametro all'array dei parametri da passare alla query.
  i := Length(fQueryParams);
  SetLength(fQueryParams, i + 1);
  fQueryParams[i].ParamName := ParamName;
  fQueryParams[i].ParamValue := ParamValue;
end;

procedure TExportForm.ClearQueryParams;
begin
  // Svuota l'array dei parametri da passare alla query.
  SetLength(fQueryParams, 0);
end;

procedure TExportForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  fAvvertiQuandoTerminato := True;
  PageControl.ActivePage := TabGenerico;
  // Azzera l'array che contiene gli eventuali parametri da passare
  //  alla query.
  Self.ClearQueryParams;
end;

function TExportForm.GetFilterFileName: String;
begin
  Result := ComboTipoEsportazione.EditText;
end;

procedure TExportForm.SaveStringListWithoutLastLineBreak(const ASL: TStringList; const AFileName: String);
var
  LStringValue: String;
  LFileStream: TFileStream;
  LStringStream: TStringStream;
begin
  LStringValue := ASL.Text;
//  Delete(LStringValue, Length(LStringValue)-1, 2);
  LStringStream := TStringStream.Create(LStringValue);
  LFileStream := TFileStream.Create(AFileName, fmCreate or fmOpenWrite);
  try
    LFileStream.CopyFrom(LStringStream, LStringStream.Size -2);
  finally
    LStringStream.Free;
    LFileStream.Free;
  end;
end;

procedure TExportForm.SetFilterFileName(const Value: String);
begin
  ComboTipoEsportazione.EditText := Value;
end;

procedure TExportForm.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  eCommerce_PrepareImportList;
end;

procedure TExportForm.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  eCommerce_ImportAll;
  if ecEsportazioneMulti.Checked then Multi_Esporta;
end;

procedure TExportForm.AvviaEsportazione;
begin
  Button1Click(Button1);
end;


procedure TExportForm.IniziaFatturazioneClick(Sender: TObject);
begin
  inherited;
  // Avvia l'esportazione
  MultiAllaData.SetFocus;
  MultiDallaData.SetFocus;
  Multi_Esporta;
end;

procedure TExportForm.FormShow(Sender: TObject);
begin
  inherited;
  // Carica i paramtri impostati
  Multi_CaricaParametri;
  eCommerce_CaricaParametri;
end;

end.
