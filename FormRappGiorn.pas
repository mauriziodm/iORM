unit FormRappGiorn;

interface
                                                                                                                       
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBaseAllegati, ExtCtrls, bmpPanel, StdCtrls, DBCtrls,
  Mask, Buttons, MAURI_SB, cxPC, cxControls, cxStyles, cxCustomData,
  cxGraphics, cxEdit, DB, cxDBData,
  cxTextEdit, cxDropDownEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  IBODataset, cxButtonEdit, cxCurrencyEdit, cxMemo, Main, IB_Components,
  FormLevanteListAnag, cxDBLookupComboBox, DataModule1, Menus, cxCalendar,
  cxDBEdit, cxContainer, cxMaskEdit, cxCheckBox, FormModelBase, cxSplitter,
  cxFilter, cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters,
  cxPCdxBarPopupMenu, cxNavigator, dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations;

type
  TRappGiornForm = class(TModelBaseAllegatiForm)
    cxPageControl1: TcxPageControl;
    TabDipendenti: TcxTabSheet;
    TabAltriCosti: TcxTabSheet;
    PanelCorpoDoc: TPanel;
    GridOre: TcxGrid;
    lvOre: TcxGridLevel;
    QryRG: TIBOQuery;
    SourceRG: TDataSource;
    QryRGNUMDOC: TIntegerField;
    QryRGDATADOC: TDateTimeField;
    QryRGREGISTRO: TStringField;
    QryRGNOTE: TMemoField;
    tvOre: TcxGridTableView;
    tvOreCODDIPENDENTE: TcxGridColumn;
    tvOreDESCRIZDIPENDENTE: TcxGridColumn;
    tvOreCODCANTIERE: TcxGridColumn;
    tvOreDATACANTIERE: TcxGridColumn;
    tvOreDESCRIZCANTIERE: TcxGridColumn;
    tvOreQTA: TcxGridColumn;
    tvOreCOSTOORARIO: TcxGridColumn;
    tvOreIMPORTOCOSTOORARIO: TcxGridColumn;
    tvOreCODSOGGETTO: TcxGridColumn;
    tvOreDESCRIZSOGGETTO: TcxGridColumn;
    tvOreNOTE: TcxGridColumn;
    tvOreTIPOORE1: TcxGridColumn;
    tvOreTIPOORE2: TcxGridColumn;
    tvOreTIPOORE3: TcxGridColumn;
    QTipoOre1: TIBOQuery;
    STipoOre1: TDataSource;
    QTipoOre1DESCRIZIONE: TStringField;
    QTipoOre2: TIBOQuery;
    StringField1: TStringField;
    STipoOre2: TDataSource;
    QTipoOre3: TIBOQuery;
    StringField2: TStringField;
    STipoOre3: TDataSource;
    tvOrePRZVEND: TcxGridColumn;
    tvOreIMPORTOVEND: TcxGridColumn;
    GridSpese: TcxGrid;
    tvSpese: TcxGridTableView;
    tvSpeseCODDIPENDENTE: TcxGridColumn;
    tvSpeseDESCRIZDIPENDENTE: TcxGridColumn;
    tvSpeseCODCANTIERE: TcxGridColumn;
    tvSpeseDATACANTIERE: TcxGridColumn;
    tvSpeseDESCRIZCANTIERE: TcxGridColumn;
    tvSpeseDESCRIZSOGGETTO: TcxGridColumn;
    tvSpeseIMPORTO: TcxGridColumn;
    tvSpeseCODSOGGETTO: TcxGridColumn;
    tvSpeseNOTE: TcxGridColumn;
    tvSpeseTIPOSPESA1: TcxGridColumn;
    tvSpeseTIPOSPESA2: TcxGridColumn;
    tvSpeseTIPOSPESA3: TcxGridColumn;
    lvSpese: TcxGridLevel;
    tvSpeseCODAUTOMEZZO: TcxGridColumn;
    tvSpeseDESCRIZAUTOMEZZO: TcxGridColumn;
    tvSpeseKM: TcxGridColumn;
    QTipoSpese1: TIBOQuery;
    StringField3: TStringField;
    STipoSpese1: TDataSource;
    QTipoSpese2: TIBOQuery;
    StringField4: TStringField;
    STipoSpese2: TDataSource;
    QTipoSpese3: TIBOQuery;
    StringField5: TStringField;
    STipoSpese3: TDataSource;
    MenuElenchi: TPopupMenu;
    Selezionavista1: TMenuItem;
    Salvaimpostazionicolonne1: TMenuItem;
    Ripristinacolonneeliminate1: TMenuItem;
    tvOreCOSTOSTRAORDINARIO: TcxGridColumn;
    tvOreQTASTRAORDINARIO: TcxGridColumn;
    tvOreIMPORTOSTRAORDINARIO: TcxGridColumn;
    tvOreCOSTOPERMESSI: TcxGridColumn;
    tvOreQTAPERMESSI: TcxGridColumn;
    tvOreIMPORTOPERMESSI: TcxGridColumn;
    tvOreCOSTOFERIE: TcxGridColumn;
    tvOreQTAFERIE: TcxGridColumn;
    tvOreIMPORTOFERIE: TcxGridColumn;
    tvOreCOSTOTRASFERTE: TcxGridColumn;
    tvOreQTATRASFERTE: TcxGridColumn;
    tvOreIMPORTOTRASFERTE: TcxGridColumn;
    tvOreOREBASE: TcxGridColumn;
    tvOreSOTTOCANTIERE1: TcxGridColumn;
    tvOreSOTTOCANTIERE2: TcxGridColumn;
    tvOreSOTTOCANTIERE3: TcxGridColumn;
    tvSpeseSOTTOCANTIERE1: TcxGridColumn;
    tvSpeseSOTTOCANTIERE2: TcxGridColumn;
    tvSpeseSOTTOCANTIERE3: TcxGridColumn;
    QSTC1: TIBOQuery;
    QSTC2: TIBOQuery;
    QSTC3: TIBOQuery;
    PanelNumDataDocumento: TPanel;
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelCantiere: TLabel;
    BitBtnPratica1: TSpeedButtonRollOver;
    DBEditNumDoc: TcxDBTextEdit;
    DBComboRegistro: TcxDBComboBox;
    DBEDataDoc: TcxDBDateEdit;
    PanelDestinatario: TPanel;
    Label27: TLabel;
    MittenteDestinatario: TLabel;
    BitBtnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    DBText1: TDBText;
    Label54: TLabel;
    DBERagSocCli: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    QryRGCODICECLIENTE: TIntegerField;
    QryRGRAGSOCCLI: TStringField;
    QryRGINDIRIZZOCLI: TStringField;
    QryRGNUMCIVICOCLI: TStringField;
    QryRGCITTACLI: TStringField;
    QryRGCAPCLI: TStringField;
    QryRGPROVINCIACLI: TStringField;
    QryRGPARTITAIVACLI: TStringField;
    QryRGCODICEFISCALECLI: TStringField;
    QryRGPRATICA: TIntegerField;
    QryRGDATAPRATICA1: TDateTimeField;
    PanelPratiche: TPanel;
    Label5: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    LabelPanelPraticheCaption: TLabel;
    BitBtnPratica2: TSpeedButtonRollOver;
    BitBtnPratica3: TSpeedButtonRollOver;
    Label32: TLabel;
    Label33: TLabel;
    Label38: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBECodicePratica1: TDBEdit;
    DBECodicePratica2: TDBEdit;
    DBECodicePratica3: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    EditDescrizionePratica1: TEdit;
    EditDescrizionePratica2: TEdit;
    EditDescrizionePratica3: TEdit;
    DbeDescrizioneCantiere: TcxTextEdit;
    QryRGVERSIONE: TIntegerField;
    PanelOpzioni: TPanel;
    Label7: TLabel;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    LabelStatoDocumento: TLabel;
    DBEditStatoDocumento: TDBEdit;
    QryRGSTATODESCRIZIONE: TStringField;
    QryRGSTATOFOREGROUND: TStringField;
    QryRGSTATOBACKGROUND: TStringField;
    tvOreOPERAINDEX: TcxGridColumn;
    ShapeAzioni: TShape;
    LabelAzioni: TLabel;
    LabelAzioneMagazzino: TLabel;
    LabelAzioneCantiere: TLabel;
    DbeAzioneMagazzino: TcxComboBox;
    DbeAzioneCantiere: TcxComboBox;
    DBEditSegnoOperazione: TDBEdit;
    DBEditSegnoOperazioneCantiere: TDBEdit;
    QryRGSEGNOOPERAZIONECANTIERE: TStringField;
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
    tvSpeseGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvSpeseGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvSpeseGC_RICARICO_MOD: TcxGridColumn;
    tvSpeseGC_RICARICO: TcxGridColumn;
    tvSpeseGC_QTA_MOD: TcxGridColumn;
    tvSpeseGC_QTA: TcxGridColumn;
    tvSpeseGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvSpeseGC_DESCRIZIONE: TcxGridColumn;
    tvSpeseGUID: TcxGridColumn;
    tvSpeseGUID_REF: TcxGridColumn;
    tvOreGUID_ANCESTOR: TcxGridColumn;
    tvSpeseGUID_ANCESTOR: TcxGridColumn;
    Label4: TLabel;
    N1: TMenuItem;
    Duplicarigo1: TMenuItem;
    tvOreTIPO1: TcxGridColumn;
    tvOreTIPO2: TcxGridColumn;
    tvOreTIPO3: TcxGridColumn;
    tvOreTIPO4: TcxGridColumn;
    tvOreTIPO5: TcxGridColumn;
    tvOreTIPO6: TcxGridColumn;
    tvSpeseTIPO1: TcxGridColumn;
    tvSpeseTIPO2: TcxGridColumn;
    tvSpeseTIPO3: TcxGridColumn;
    tvSpeseTIPO4: TcxGridColumn;
    tvSpeseTIPO5: TcxGridColumn;
    tvSpeseTIPO6: TcxGridColumn;
    PanelRiferimenti: TPanel;
    LabelAgente: TLabel;
    LabelAgente2: TLabel;
    LabelAgente3: TLabel;
    LabelAgente4: TLabel;
    dbeAgente: TcxDBComboBox;
    dbeAgente2: TcxDBComboBox;
    dbeAgente3: TcxDBComboBox;
    dbeAgente4: TcxDBComboBox;
    QryRGAGENTE: TStringField;
    QryRGAGENTE2: TStringField;
    QryRGAGENTE3: TStringField;
    QryRGAGENTE4: TStringField;
    PopupMenuAzzeraCantiereImpianto: TPopupMenu;
    Deselezionacantiereimpianto1: TMenuItem;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure tvOreDESCRIZDIPENDENTEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvOreCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvOreCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvOreCustomDrawPartBackground(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
      var ADone: Boolean);
    procedure tvOreFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvOreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvOreDESCRIZCANTIEREPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvOreDESCRIZSOGGETTOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvOreEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure tvSpeseFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvSpeseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvSpeseDESCRIZDIPENDENTEPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure tvSpeseDESCRIZCANTIEREPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvSpeseDESCRIZSOGGETTOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvSpeseDESCRIZAUTOMEZZOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvSpeseDblClick(Sender: TObject);
    procedure tvOreDblClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure Salvaimpostazionicolonne1Click(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Ripristinacolonneeliminate1Click(Sender: TObject);
    procedure MenuElenchiPopup(Sender: TObject);
    procedure tvOreSOTTOCANTIERE1PropertiesInitPopup(Sender: TObject);
    procedure tvSpeseSOTTOCANTIERE1PropertiesInitPopup(Sender: TObject);
    procedure tvOreSOTTOCANTIERE2PropertiesInitPopup(Sender: TObject);
    procedure tvOreSOTTOCANTIERE3PropertiesInitPopup(Sender: TObject);
    procedure tvSpeseSOTTOCANTIERE2PropertiesInitPopup(Sender: TObject);
    procedure tvSpeseSOTTOCANTIERE3PropertiesInitPopup(Sender: TObject);
    procedure cxDBComboBox1PropertiesInitPopup(Sender: TObject);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure BitBtnClienteClick(Sender: TObject);
    procedure QryRGPRATICAChange(Sender: TField);
    procedure QryRGCODICECLIENTEChange(Sender: TField);
    procedure EditDescrizionePratica1Change(Sender: TObject);
    procedure QryRGBeforePost(DataSet: TDataSet);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure tvOreOPERAINDEXGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure DbeAzioneCantierePropertiesChange(Sender: TObject);
    procedure QryRGSEGNOOPERAZIONECANTIEREChange(Sender: TField);
    function LocateGUID(Tipologia: String; GUIDToSearch: String): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure Duplicarigo1Click(Sender: TObject);
    procedure tvOreEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure dbeAgentePropertiesInitPopup(Sender: TObject);
    procedure dbeAgente2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente4PropertiesInitPopup(Sender: TObject);
    procedure dbeAgentePropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
    procedure Deselezionacantiereimpianto1Click(Sender: TObject);
    procedure AzzeraStato1Click(Sender: TObject);
    procedure DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FNumDoc: Integer;
    FDataDoc: TDate;
    FRegistro: String;

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    procedure Allegati_AggiornaDatiFiltri; override;
    procedure Allegati_VerificaAbilitazione; override;
    // =========================================================================

    procedure SalvaRigoOreDipendenti(Registro: String; NumDoc: Integer;
      DocData: TDate; RowIdx, ProgRigo: Integer;
      DC: TcxCustomDataController);
    procedure SalvaRighiOreDipendenti(DocReg:String; DocNum:Longint; DocData:TDate);
    procedure CaricaRighiDocumento(Registro: String; DocNum: Integer;
      DocData: TDate);
    procedure CaricaRighiSpeseDocumento(Registro: String; DocNum: Integer;
      DocData: TDate);
    procedure SalvaRigoSpese(Registro: String; NumDoc: Integer;
      DocData: TDate; RowIdx, ProgRigo: Integer;
      DC: TcxCustomDataController);
    procedure SalvaRighiSpese(DocReg:String; DocNum:Longint; DocData:TDate);
    function CiSonoQtaMancanti: Boolean;
    procedure CaricaTitoli;
    procedure CaricaItemsTipiRighi;
    procedure CaricaFormLayout;
  public
    { Public declarations }
    property NumDoc:Integer read FNumDoc write FNumDoc;
    property DataDoc:TDate read FDataDoc write FDataDoc;
    property Registro:String read FRegistro write FRegistro;
    function CalcolaImportoOrario(y:Integer): Double;
    procedure NuovoRigoOre(CodDip: Integer; Mode: TAddArtMode);
    procedure NuovoRigoSpese(CodDip: Integer; Mode: TAddArtMode);
  end;

var
  RappGiornForm: TRappGiornForm;

implementation

uses FormDipendenti, SchedaClienti, 
  FormSelezioneCliente, FormAutomezzi, StrUtils,
  FormSelezionaPraticheImpianti, FormBeforeNewDoc, IniFiles, DataModule2;

{$R *.dfm}




// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che aggiorna i filtri di collegamento della form degli allegati
  //  con la form attuale
  procedure TRappGiornForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QryRGCODICECLIENTE.IsNull then fAllegatiForm.Filter_CodSogg := QryRGCODICECLIENTE.Value;

    // Codice Pratica
    if not QryRGPRATICA.IsNull then fAllegatiForm.Filter_CodPrat := QryRGPRATICA.Value;
    // Data Pratica
    if not QryRGDATAPRATICA1.IsNull then fAllegatiForm.Filter_DataPrat := QryRGDATAPRATICA1.Value;

    // Tipo Documento
    fAllegatiForm.Filter_TipoDoc := 'Rapp.giorn.';
    // Registro Documento
    if not QryRGREGISTRO.IsNull then fAllegatiForm.Filter_RegDoc := QryRGREGISTRO.Value;
    // Numero documento
    if not QryRGNUMDOC.IsNull then fAllegatiForm.Filter_NumDoc := QryRGNUMDOC.Value;
    // Data documento
    if not QryRGDATADOC.IsNull then fAllegatiForm.Filter_DataDoc := QryRGDATADOC.Value;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TRappGiornForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QryRG.State = dsInsert) then begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end else begin
      Allegati_CreaForm;
      SplitterAllegati.Enabled := True;
    end;
  end;

procedure TRappGiornForm.AzzeraStato1Click(Sender: TObject);
begin
  inherited;
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    QryRGSTATODESCRIZIONE.Clear;
    QryRGSTATOFOREGROUND.Clear;
    QryRGSTATOBACKGROUND.Clear;
    DBEditNumDoc.SetFocus;
    DBEditStatoDocumento.SetFocus;
  end;
end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================









procedure TRappGiornForm.CaricaFormLayout;
begin
  // ===========================================================================
  // AGENTI
  // ---------------------------------------------------------------------------
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
  // ===========================================================================
end;


// Carica le caption dei vari campi
procedure TRappGiornForm.CaricaTitoli;
var
  M: TMemIniFile;
  Sez:String;
begin
  Sez := 'RappGiornForm';
  M := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    // Dati documento
    LabelCantiere.Caption := DM1.DatiDocumento_LabelPratica;
    LabelAzioneCantiere.Caption := DM1.DatiDocumento_LabelAzionePratica;
    // Tipi
    tvOreTIPO1.Caption := M.ReadString(Sez, 'Column_Tipo1', 'Tipo 1');
    tvOreTIPO2.Caption := M.ReadString(Sez, 'Column_Tipo2', 'Tipo 2');
    tvOreTIPO3.Caption := M.ReadString(Sez, 'Column_Tipo3', 'Tipo 3');
    tvOreTIPO4.Caption := M.ReadString(Sez, 'Column_Tipo4', 'Tipo 4');
    tvOreTIPO5.Caption := M.ReadString(Sez, 'Column_Tipo5', 'Tipo 5');
    tvOreTIPO6.Caption := M.ReadString(Sez, 'Column_Tipo6', 'Tipo 6');
    tvSpeseTIPO1.Caption := tvOreTIPO1.Caption;
    tvSpeseTIPO2.Caption := tvOreTIPO2.Caption;
    tvSpeseTIPO3.Caption := tvOreTIPO3.Caption;
    tvSpeseTIPO4.Caption := tvOreTIPO4.Caption;
    tvSpeseTIPO5.Caption := tvOreTIPO5.Caption;
    tvSpeseTIPO6.Caption := tvOreTIPO6.Caption;
  finally
    M.Free;
  end;
end;



function TRappGiornForm.LocateGUID(Tipologia:String; GUIDToSearch:String): Boolean;
var
  PrecUpdateLocked: Boolean;
  RI, GUIDItemIndex: Integer;
  CurrentGrid: TcxGrid;
  DC: TcxCustomDataController;
begin
  // Inizializzazione
  Result := False;
  RI := 0;
  // CurrentView punta alla vista delle ore o delle altre spese in base al parametro Tipologia
  if Tipologia = 'Altre spese' then begin
    cxPageControl1.ActivePage := TabAltriCosti;
    CurrentGrid := GridSpese;
    DC := tvSpese.DataController;
    GUIDItemIndex := tvSpeseGUID_REF.Index;
  end else begin
    cxPageControl1.ActivePage := TabDipendenti;
    CurrentGrid := GridOre;
    DC := tvOre.DataController;
    GUIDItemIndex := tvOreGUID_REF.Index;
  end;
  // Pone il focus sulla griglia corrente in modo che venga evidenziata
  CurrentGrid.SetFocus;
  // Ferma il tracciamento della griglia (se non è già bloccato)
  PrecUpdateLocked := CurrentGrid.UpdateLocked;
  if not PrecUpdateLocked then CurrentGrid.BeginUpdate;
  try
    // Cicla per tutti i righi del documento
    for RI := 0 to DC.RecordCount -1 do begin
      // Se il GUID_REF del rigo attuale è quello che cerchiamo pone il focus su questo record ed esce
      if (not VarIsNull(DC.Values[RI, GUIDItemIndex])) and (DC.DisplayTexts[RI, GUIDItemIndex] = GUIDToSearch) then begin
        DC.FocusedRecordIndex := RI;
        DC.SelectRows(RI, RI);
        Result := True;
        Exit;
      end;
    end;
  finally
    //  Ripristina il tracciamento de deve
    if not PrecUpdateLocked then CurrentGrid.EndUpdate;
  end;
end;


// Funzione che ritorna True se si sono dei righi che non hanno
//  specificata alcuna Qta di ore oppure la Qta = 0
function TRappGiornForm.CiSonoQtaMancanti: Boolean;
var
  DC: TcxCustomDataController;
  i: Integer;
  TotQtaRigo: Double;
begin
  // INizializzazione
  Result := False;
  DC := tvOre.DataController;
  // Ciccla per tutti i righi ed esegue il controllo
  for i := 0 to DC.RecordCount -1 do begin
    // Cacola il totale delle ore presenti sul rigo
    TotQtaRigo := DM1.NoNullFloatValue(DC, i, tvOreQTA.Index)
                + DM1.NoNullFloatValue(DC, i, tvOreQTASTRAORDINARIO.Index)
                + DM1.NoNullFloatValue(DC, i, tvOreQTAPERMESSI.Index)
                + DM1.NoNullFloatValue(DC, i, tvOreQTAFERIE.Index)
                + DM1.NoNullFloatValue(DC, i, tvOreQTA.Index);
    // Se la somma delle ore del rigo = 0 allora ritorna True ed esce subito
    if TotQtaRigo = 0 then begin
      Result := True;
      Exit;
    end;
  end;
end;


procedure TRappGiornForm.NuovoRigoSpese(CodDip:Integer; Mode:TAddArtMode);
var
   y : Integer;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   Tmp: String;
begin
   // DC Punta al DataController che attualmente ha il focus
   DC := tvSpese.DataController;
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
           AM_Append: y := DC.AppendRecord;
           AM_Insert: y := DC.InsertRecord(y);
        end;
        // Costruisce il Nome + COgnome
        // Construisce il Nome e cognome del dipendente
        Tmp := '';
        if not Qry.FieldByName('NOME').IsNull then Tmp := Trim(Qry.FieldByName('NOME').AsString);
        if not Qry.FieldByName('COGNOME').IsNull then begin
          if Length(Trim(Tmp)) > 0 then Tmp := Tmp + ' ';
          Tmp := Tmp + Trim(Qry.FieldByName('COGNOME').AsString);
        end;
        // CArica i valori
        DC.Values[y, tvSpeseCODDIPENDENTE.Index] := CodDip;
        DC.Values[y, tvSpeseDESCRIZDIPENDENTE.Index] := Tmp;
        // IMposta il valore di default del soggetto
        if VarIsNull(DC.Values[y, tvSpeseCODSOGGETTO.Index]) then begin
          if ClientiForm.ClienteCorrente = '' then begin
            DC.Values[y, tvSpeseCODSOGGETTO.Index] := 0;
            DC.Values[y, tvSpeseDESCRIZSOGGETTO.Index] := '';
          end else begin
            DC.Values[y, tvSpeseCODSOGGETTO.Index] := StrToInt(ClientiForm.ClienteCorrente);
            DC.Values[y, tvSpeseDESCRIZSOGGETTO.Index] := ClientiForm.RagSocCS;
          end;
        end;
        // IMposta il valore di default del cantiere
        if VarIsNull(DC.Values[y, tvSpeseCODCANTIERE.Index]) then begin
          if ClientiForm.PraticaCorrente <> '' then begin
            DC.Values[y, tvSpeseCODCANTIERE.Index] := StrToInt(ClientiForm.PraticaCorrente);
            DC.Values[y, tvSpeseDATACANTIERE.Index] := ClientiForm.DataPraticaCorrente;
            DC.Values[y, tvSpeseDESCRIZCANTIERE.Index] := ClientiForm.DescPraticaCorrente;
          end;
        end;



        // ========================================================================
        // TIPI RIGHI (CONTI, SOTTOCONTI ECC.)
        // ------------------------------------------------------------------------
        // Parte che carica i tipi di righi (conti) di default
        DC.Values[y, tvSpeseTIPO1.Index] := DM1.TableProgressiviTIPO1.AsString;
        DC.Values[y, tvSpeseTIPO2.Index] := DM1.TableProgressiviTIPO2.AsString;
        DC.Values[y, tvSpeseTIPO3.Index] := DM1.TableProgressiviTIPO3.AsString;
        DC.Values[y, tvSpeseTIPO4.Index] := DM1.TableProgressiviTIPO4.AsString;
        DC.Values[y, tvSpeseTIPO5.Index] := DM1.TableProgressiviTIPO5.AsString;
        DC.Values[y, tvSpeseTIPO6.Index] := DM1.TableProgressiviTIPO6.AsString;
       // ========================================================================



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



procedure TRappGiornForm.NuovoRigoOre(CodDip:Integer; Mode:TAddArtMode);
var
   y : Integer;
   Qry: TIB_Cursor;
   DC:TcxCustomDataController;
   Tmp: String;
begin
   // DC Punta al DataController che attualmente ha il focus
   DC := tvOre.DataController;
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
           AM_Append: y := DC.AppendRecord;
           AM_Insert: y := DC.InsertRecord(y);
        end;
        // Costruisce il Nome + COgnome
        // Construisce il Nome e cognome del dipendente
        Tmp := '';
        if not Qry.FieldByName('NOME').IsNull then Tmp := Trim(Qry.FieldByName('NOME').AsString);
        if not Qry.FieldByName('COGNOME').IsNull then begin
          if Length(Trim(Tmp)) > 0 then Tmp := Tmp + ' ';
          Tmp := Tmp + Trim(Qry.FieldByName('COGNOME').AsString);
        end;
        // CArica i valori
        DC.Values[y, tvOreCODDIPENDENTE.Index] := CodDip;
        DC.Values[y, tvOreDESCRIZDIPENDENTE.Index] := Tmp;
        DC.Values[y, tvOreTIPOORE1.Index] := Qry.FieldByName('TIPOORE1').AsString;
        DC.Values[y, tvOreTIPOORE2.Index] := Qry.FieldByName('TIPOORE2').AsString;
        DC.Values[y, tvOreTIPOORE3.Index] := Qry.FieldByName('TIPOORE3').AsString;
        if not Qry.FieldByName('COSTOORARIO').IsNull    then DC.Values[y, tvOreCOSTOORARIO.Index]         := Qry.FieldByName('COSTOORARIO').AsCurrency;
        if not Qry.FieldByName('PRZVENDORARIO').IsNull  then DC.Values[y, tvOrePRZVEND.Index]             := Qry.FieldByName('PRZVENDORARIO').AsCurrency;
        if not Qry.FieldByName('COSTOSTR').IsNull       then DC.Values[y, tvOreCOSTOSTRAORDINARIO.Index]  := Qry.FieldByName('COSTOSTR').AsCurrency;
        if not Qry.FieldByName('COSTOPERMESSI').IsNull  then DC.Values[y, tvOreCOSTOPERMESSI.Index]       := Qry.FieldByName('COSTOPERMESSI').AsCurrency;
        if not Qry.FieldByName('COSTOFERIE').IsNull     then DC.Values[y, tvOreCOSTOFERIE.Index]          := Qry.FieldByName('COSTOFERIE').AsCurrency;
        if not Qry.FieldByName('COSTOTRASFERTE').IsNull then DC.Values[y, tvOreCOSTOTRASFERTE.Index]      := Qry.FieldByName('COSTOTRASFERTE').AsCurrency;
        if not Qry.FieldByName('HCONTRATTO').IsNull     then DC.Values[y, tvOreOREBASE.Index]             := Qry.FieldByName('HCONTRATTO').AsFloat;
        if not Qry.FieldByName('OPERAINDEX').IsNull     then DC.Values[y, tvOreOPERAINDEX.Index]          := Qry.FieldByName('OPERAINDEX').AsInteger;
        // Imposta il prezzo di vendita di default del tipo di manodopera a cui il dipendente è associato
        DC.Values[y, tvOrePRZVEND.Index] := DM1.Manodopera[Qry.FieldByName('OPERAINDEX').AsInteger].PrezzoUnitario1;
        {
        // IMposta il valore di default del soggetto
        if VarIsNull(DC.Values[y,tvOreCODSOGGETTO.Index]) then begin
          if ClientiForm.ClienteCorrente = '' then begin
            DC.Values[y, tvOreCODSOGGETTO.Index] := 0;
            DC.Values[y, tvOreDESCRIZSOGGETTO.Index] := '';
          end else begin
            DC.Values[y, tvOreCODSOGGETTO.Index] := StrToInt(ClientiForm.ClienteCorrente);
            DC.Values[y, tvOreDESCRIZSOGGETTO.Index] := ClientiForm.RagSocCS;
          end;
        end;
        // IMposta il valore di default del cantiere
        if VarIsNull(DC.Values[y,tvOreCODCANTIERE.Index]) then begin
          if ClientiForm.PraticaCorrente <> '' then begin
            DC.Values[y, tvOreCODCANTIERE.Index] := StrToInt(ClientiForm.PraticaCorrente);
            DC.Values[y, tvOreDATACANTIERE.Index] := ClientiForm.DataPraticaCorrente;
            DC.Values[y, tvOreDESCRIZCANTIERE.Index] := ClientiForm.DescPraticaCorrente;
          end;
        end;
        }
        // IMposta il valore di default del soggetto
        if VarIsNull(DC.Values[y,tvOreCODSOGGETTO.Index]) then begin
          if (QryRGCODICECLIENTE.IsNull) or (QryRGCODICECLIENTE.AsInteger = 0) then begin
            DC.Values[y, tvOreCODSOGGETTO.Index] := 0;
            DC.Values[y, tvOreDESCRIZSOGGETTO.Index] := '';
          end else begin
            DC.Values[y, tvOreCODSOGGETTO.Index] := QryRGCODICECLIENTE.AsInteger;
            DC.Values[y, tvOreDESCRIZSOGGETTO.Index] := QryRGRAGSOCCLI.AsString;
          end;
        end;
        // IMposta il valore di default del cantiere
        if VarIsNull(DC.Values[y,tvOreCODCANTIERE.Index]) then begin
          if (not QryRGPRATICA.IsNull) and (QryRGPRATICA.AsInteger <> 0) then begin
            DC.Values[y, tvOreCODCANTIERE.Index] := QryRGPRATICA.AsInteger;
            DC.Values[y, tvOreDATACANTIERE.Index] := QryRGDATAPRATICA1.AsDateTime;
            DC.Values[y, tvOreDESCRIZCANTIERE.Index] := ClientiForm.DescPraticaCorrente;
          end;
        end;



        // ========================================================================
        // TIPI RIGHI (CONTI, SOTTOCONTI ECC.)
        // ------------------------------------------------------------------------
        // Parte che carica i tipi di righi (conti) di default
        DC.Values[y, tvOreTIPO1.Index] := DM1.TableProgressiviTIPO1.AsString;
        DC.Values[y, tvOreTIPO2.Index] := DM1.TableProgressiviTIPO2.AsString;
        DC.Values[y, tvOreTIPO3.Index] := DM1.TableProgressiviTIPO3.AsString;
        DC.Values[y, tvOreTIPO4.Index] := DM1.TableProgressiviTIPO4.AsString;
        DC.Values[y, tvOreTIPO5.Index] := DM1.TableProgressiviTIPO5.AsString;
        DC.Values[y, tvOreTIPO6.Index] := DM1.TableProgressiviTIPO6.AsString;
       // ========================================================================



        // Se la Qta e anche il costo orario non sono nulli provvede a calcolare
        //  l'importo.
        CalcolaImportoOrario(tvOre.DataController.FocusedRecordIndex);
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



procedure TRappGiornForm.CaricaRighiDocumento(Registro:String; DocNum:Longint; DocData:TDate);
var
   Qry:TIB_Cursor;
   y:Integer;
   MDC:TcxCustomDataController;
begin
   // Inizializzazione DC (punta al datacontroller della TableView principale
   MDC := tvOre.DataController;
   // Crea l'oggetto query e lo imposta per trovare tutti i righi del documento
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   // Svuota la TableView
   MDC.RecordCount := 0;
   // Inizia l'aggiornamento della griglia
   MDC.BeginUpdate;
   try
      DM1.ShowWait('Documento', 'Carica rigo ');
      // Imposta la query che richiama i righi del documento ordinandoli per PROGRIGO in modo da scongiurare
      //  pericoli di rimescolamento dei righi
      Qry.SQL.Add('SELECT * FROM RAPGIORNRIGHI WHERE');
      Qry.SQL.Add('    REGISTRO = ''' + Registro + '''');
      Qry.SQL.Add('AND NUMDOC = ' + IntToStr(DocNum));
      Qry.SQL.Add('AND DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DocData) + '''');
      Qry.SQL.Add('ORDER BY NUMRIGO');
      Qry.Open;
      // Cicla per tutti i records trovati dalla query
      while not Qry.Eof do begin
         // Effettua l'append del rigo da importare
         y := MDC.AppendRecord;
         // Aggiorna lo schermo
         DM1.ShowWait('', 'Carica rigo ' + IntToStr(y));
         // Carica il rigo
         MDC.Values[y, tvOreCODDIPENDENTE.Index]      := Qry.FieldByName('CODDIPENDENTE').Value;
         MDC.Values[y, tvOreDESCRIZDIPENDENTE.Index]  := Qry.FieldByName('DESCRIZDIPENDENTE').Value;
         MDC.Values[y, tvOreCODCANTIERE.Index]        := Qry.FieldByName('CODCANTIERE').Value;
         MDC.Values[y, tvOreDATACANTIERE.Index]       := Qry.FieldByName('DATACANTIERE').Value;
         MDC.Values[y, tvOreDESCRIZCANTIERE.Index]    := Qry.FieldByName('DESCRIZCANTIERE').Value;
         MDC.Values[y, tvOreCODSOGGETTO.Index]        := Qry.FieldByName('CODSOGGETTO').Value;
         MDC.Values[y, tvOreDESCRIZSOGGETTO.Index]    := Qry.FieldByName('DESCRIZSOGGETTO').Value;
         MDC.Values[y, tvOreQTA.Index]                := Qry.FieldByName('QTA').Value;
         MDC.Values[y, tvOreCOSTOORARIO.Index]        := Qry.FieldByName('COSTOORARIO').Value;
         MDC.Values[y, tvOreIMPORTOCOSTOORARIO.Index] := Qry.FieldByName('IMPORTOCOSTOORARIO').Value;
         MDC.Values[y, tvOreNOTE.Index]               := Qry.FieldByName('NOTE').Value;

         MDC.Values[y, tvOreTIPOORE1.Index]           := Qry.FieldByName('TIPOORE1').Value;
         MDC.Values[y, tvOreTIPOORE2.Index]           := Qry.FieldByName('TIPOORE2').Value;
         MDC.Values[y, tvOreTIPOORE3.Index]           := Qry.FieldByName('TIPOORE3').Value;

         MDC.Values[y, tvOreTIPO1.Index]              := Qry.FieldByName('TIPO1').Value;
         MDC.Values[y, tvOreTIPO2.Index]              := Qry.FieldByName('TIPO2').Value;
         MDC.Values[y, tvOreTIPO3.Index]              := Qry.FieldByName('TIPO3').Value;
         MDC.Values[y, tvOreTIPO4.Index]              := Qry.FieldByName('TIPO4').Value;
         MDC.Values[y, tvOreTIPO5.Index]              := Qry.FieldByName('TIPO5').Value;
         MDC.Values[y, tvOreTIPO6.Index]              := Qry.FieldByName('TIPO6').Value;

         MDC.Values[y, tvOrePRZVEND.Index]            := Qry.FieldByName('PRZVEND').Value;
         MDC.Values[y, tvOreIMPORTOVEND.Index]        := Qry.FieldByName('IMPORTOVEND').Value;
         MDC.Values[y, tvOreCOSTOSTRAORDINARIO.Index]   := Qry.FieldByName('COSTOSTRAORDINARIO').Value;
         MDC.Values[y, tvOreQTASTRAORDINARIO.Index]     := Qry.FieldByName('QTASTRAORDINARIO').Value;
         MDC.Values[y, tvOreIMPORTOSTRAORDINARIO.Index] := Qry.FieldByName('IMPORTOSTRAORDINARIO').Value;
         MDC.Values[y, tvOreCOSTOPERMESSI.Index]        := Qry.FieldByName('COSTOPERMESSI').Value;
         MDC.Values[y, tvOreQTAPERMESSI.Index]          := Qry.FieldByName('QTAPERMESSI').Value;
         MDC.Values[y, tvOreIMPORTOPERMESSI.Index]      := Qry.FieldByName('IMPORTOPERMESSI').Value;
         MDC.Values[y, tvOreCOSTOFERIE.Index]           := Qry.FieldByName('COSTOFERIE').Value;
         MDC.Values[y, tvOreQTAFERIE.Index]             := Qry.FieldByName('QTAFERIE').Value;
         MDC.Values[y, tvOreIMPORTOFERIE.Index]         := Qry.FieldByName('IMPORTOFERIE').Value;
         MDC.Values[y, tvOreCOSTOTRASFERTE.Index]       := Qry.FieldByName('COSTOTRASFERTE').Value;
         MDC.Values[y, tvOreQTATRASFERTE.Index]         := Qry.FieldByName('QTATRASFERTE').Value;
         MDC.Values[y, tvOreIMPORTOTRASFERTE.Index]     := Qry.FieldByName('IMPORTOTRASFERTE').Value;
         MDC.Values[y, tvOreOREBASE.Index]              := Qry.FieldByName('OREBASE').Value;
         MDC.Values[y, tvOreSOTTOCANTIERE1.Index]       := Qry.FieldByName('SOTTOCANTIERE1').Value;
         MDC.Values[y, tvOreSOTTOCANTIERE2.Index]       := Qry.FieldByName('SOTTOCANTIERE2').Value;
         MDC.Values[y, tvOreSOTTOCANTIERE3.Index]       := Qry.FieldByName('SOTTOCANTIERE3').Value;
         MDC.Values[y, tvOreOPERAINDEX.Index]           := Qry.FieldByName('OPERAINDEX').Value;

         MDC.Values[y, tvOreGC_COSTONETTOUNITARIO_MOD.Index]:= Qry.FieldByName('GC_COSTONETTOUNITARIO_MOD').Value;
         MDC.Values[y, tvOreGC_COSTONETTOUNITARIO.Index]    := Qry.FieldByName('GC_COSTONETTOUNITARIO').Value;
         MDC.Values[y, tvOreGC_RICARICO_MOD.Index]          := Qry.FieldByName('GC_RICARICO_MOD').Value;
         MDC.Values[y, tvOreGC_RICARICO.Index]              := Qry.FieldByName('GC_RICARICO').Value;
         MDC.Values[y, tvOreGC_QTA_MOD.Index]               := Qry.FieldByName('GC_QTA_MOD').Value;
         MDC.Values[y, tvOreGC_QTA.Index]                   := Qry.FieldByName('GC_QTA').Value;
         MDC.Values[y, tvOreGC_DESCRIZIONE_MOD.Index]       := Qry.FieldByName('GC_DESCRIZIONE_MOD').Value;
         MDC.Values[y, tvOreGC_DESCRIZIONE.Index]           := Qry.FieldByName('GC_DESCRIZIONE').Value;
         MDC.Values[y, tvOreGUID.Index]                     := Qry.FieldByName('GUID').Value;
         MDC.Values[y, tvOreGUID_REF.Index]                 := Qry.FieldByName('GUID_REF').Value;

         // Và al prossimo record
         Qry.Next;
      end;
   finally
      // Chiude gli eventuali messaggi di attesa
      DM1.CloseWait;
      // Termina l'aggiornamento della griglia
      MDC.EndUpdate;
      // Distrugge Qry
      Qry.Free;
   end;
end;


procedure TRappGiornForm.CaricaRighiSpeseDocumento(Registro:String; DocNum:Longint; DocData:TDate);
var
   Qry:TIB_Cursor;
   y:Integer;
   MDC:TcxCustomDataController;
begin
   // Inizializzazione DC (punta al datacontroller della TableView principale
   MDC := tvSpese.DataController;
   // Crea l'oggetto query e lo imposta per trovare tutti i righi del documento
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   // Svuota la TableView
   MDC.RecordCount := 0;
   // Inizia l'aggiornamento della griglia
   MDC.BeginUpdate;
   try
      DM1.ShowWait('Documento', 'Carica rigo ');
      // Imposta la query che richiama i righi del documento ordinandoli per PROGRIGO in modo da scongiurare
      //  pericoli di rimescolamento dei righi
      Qry.SQL.Add('SELECT * FROM RAPGIORNRIGHISPESE WHERE');
      Qry.SQL.Add('    REGISTRO = ''' + Registro + '''');
      Qry.SQL.Add('AND NUMDOC = ' + IntToStr(DocNum));
      Qry.SQL.Add('AND DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DocData) + '''');
      Qry.SQL.Add('ORDER BY NUMRIGO');
      Qry.Open;
      // Cicla per tutti i records trovati dalla query
      while not Qry.Eof do begin
         // Effettua l'append del rigo da importare
         y := MDC.AppendRecord;
         // Aggiorna lo schermo
         DM1.ShowWait('', 'Carica rigo ' + IntToStr(y));
         // Carica il rigo
         MDC.Values[y, tvSpeseCODAUTOMEZZO.Index]       := Qry.FieldByName('CODAUTOMEZZO').Value;
         MDC.Values[y, tvSpeseDESCRIZAUTOMEZZO.Index]   := Qry.FieldByName('DESCRIZAUTOMEZZO').Value;
         MDC.Values[y, tvSpeseKM.Index]                 := Qry.FieldByName('KM').Value;
         MDC.Values[y, tvSpeseCODDIPENDENTE.Index]      := Qry.FieldByName('CODDIPENDENTE').Value;
         MDC.Values[y, tvSpeseDESCRIZDIPENDENTE.Index]  := Qry.FieldByName('DESCRIZDIPENDENTE').Value;
         MDC.Values[y, tvSpeseCODCANTIERE.Index]        := Qry.FieldByName('CODCANTIERE').Value;
         MDC.Values[y, tvSpeseDATACANTIERE.Index]       := Qry.FieldByName('DATACANTIERE').Value;
         MDC.Values[y, tvSpeseDESCRIZCANTIERE.Index]    := Qry.FieldByName('DESCRIZCANTIERE').Value;
         MDC.Values[y, tvSpeseCODSOGGETTO.Index]        := Qry.FieldByName('CODSOGGETTO').Value;
         MDC.Values[y, tvSpeseDESCRIZSOGGETTO.Index]    := Qry.FieldByName('DESCRIZSOGGETTO').Value;
         MDC.Values[y, tvSpeseIMPORTO.Index]            := Qry.FieldByName('IMPORTO').Value;
         MDC.Values[y, tvSpeseNOTE.Index]               := Qry.FieldByName('NOTE').Value;

         MDC.Values[y, tvSpeseTIPOSPESA1.Index]         := Qry.FieldByName('TIPOCOSTO1').Value;
         MDC.Values[y, tvSpeseTIPOSPESA2.Index]         := Qry.FieldByName('TIPOCOSTO2').Value;
         MDC.Values[y, tvSpeseTIPOSPESA3.Index]         := Qry.FieldByName('TIPOCOSTO3').Value;

         MDC.Values[y, tvSpeseTIPO1.Index]              := Qry.FieldByName('TIPO1').Value;
         MDC.Values[y, tvSpeseTIPO2.Index]              := Qry.FieldByName('TIPO2').Value;
         MDC.Values[y, tvSpeseTIPO3.Index]              := Qry.FieldByName('TIPO3').Value;
         MDC.Values[y, tvSpeseTIPO4.Index]              := Qry.FieldByName('TIPO4').Value;
         MDC.Values[y, tvSpeseTIPO5.Index]              := Qry.FieldByName('TIPO5').Value;
         MDC.Values[y, tvSpeseTIPO6.Index]              := Qry.FieldByName('TIPO6').Value;

         MDC.Values[y, tvSpeseSOTTOCANTIERE1.Index]     := Qry.FieldByName('SOTTOCANTIERE1').Value;
         MDC.Values[y, tvSpeseSOTTOCANTIERE2.Index]     := Qry.FieldByName('SOTTOCANTIERE2').Value;
         MDC.Values[y, tvSpeseSOTTOCANTIERE3.Index]     := Qry.FieldByName('SOTTOCANTIERE3').Value;

         MDC.Values[y, tvSpeseGC_COSTONETTOUNITARIO_MOD.Index]:= Qry.FieldByName('GC_COSTONETTOUNITARIO_MOD').Value;
         MDC.Values[y, tvSpeseGC_COSTONETTOUNITARIO.Index]    := Qry.FieldByName('GC_COSTONETTOUNITARIO').Value;
         MDC.Values[y, tvSpeseGC_RICARICO_MOD.Index]          := Qry.FieldByName('GC_RICARICO_MOD').Value;
         MDC.Values[y, tvSpeseGC_RICARICO.Index]              := Qry.FieldByName('GC_RICARICO').Value;
         MDC.Values[y, tvSpeseGC_QTA_MOD.Index]               := Qry.FieldByName('GC_QTA_MOD').Value;
         MDC.Values[y, tvSpeseGC_QTA.Index]                   := Qry.FieldByName('GC_QTA').Value;
         MDC.Values[y, tvSpeseGC_DESCRIZIONE_MOD.Index]       := Qry.FieldByName('GC_DESCRIZIONE_MOD').Value;
         MDC.Values[y, tvSpeseGC_DESCRIZIONE.Index]           := Qry.FieldByName('GC_DESCRIZIONE').Value;
         MDC.Values[y, tvSpeseGUID.Index]                     := Qry.FieldByName('GUID').Value;
         MDC.Values[y, tvSpeseGUID_REF.Index]                 := Qry.FieldByName('GUID_REF').Value;

         // Và al prossimo record
         Qry.Next;
      end;
   finally
      // Chiude gli eventuali messaggi di attesa
      DM1.CloseWait;
      // Termina l'aggiornamento della griglia
      MDC.EndUpdate;
      // Distrugge Qry
      Qry.Free;
   end;
end;


procedure TRappGiornForm.SalvaRighiOreDipendenti(DocReg:String; DocNum:Longint; DocData:TDate);
var
   Qry:TIB_Cursor;
   i, ProgRigo: Integer;
   DC:TcxCustomDataController;
begin
   // Inizializzazione
   DC := tvOre.DataController;
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   try
      DC.BeginUpdate;
      // Prima di tutto elimina i righi vecchi del documento
      Qry.SQL.Add('DELETE FROM RAPGIORNRIGHI WHERE');
      // NB: Per eliminare i vecchi righi usa le variabili globali che indentificano il documento che
      //      a questo punto contengono i valori identificativi non aggiornati (nel caso si fossero cambiati uno dei
      //      dati della chiave del documento) e quindi permettono di eliminare i vecchi righi correttamente.
      Qry.SQL.Add('    REGISTRO = ''' + Registro + '''');
      Qry.SQL.Add('AND NUMDOC = ' + IntToStr(NumDoc));
      Qry.SQL.Add('AND DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
      Qry.ExecSQL;
      // Poi cicla per tutti i righi dell'elenco del materiale e salva rigo per rigo
      for i := 0 to DC.RecordCount -1 do begin
         // Aggiorna lo schermo
         DM1.ShowWait('', 'Salvataggio rigo ' + IntToStr(i));
         // Inizializzazione ProgRigo
         ProgRigo := i;
         // Salva il rigo principale attuale (NB: I righi principali hanno sempre ProgRigo2 := -1)
         SalvaRigoOreDipendenti(DocReg, DocNum, DocData, i, ProgRigo, DC);
         // --------------------------------------------------------
      end;
   finally
      DC.EndUpdate;
      // Chiude gli eventuali messaggi di attesa
      DM1.CloseWait;
      // Distrugge l'oggetto Qry
      Qry.Free;
   end;
end;



procedure TRappGiornForm.SalvaRighiSpese(DocReg:String; DocNum:Longint; DocData:TDate);
var
   Qry:TIB_Cursor;
   i, ProgRigo: Integer;
   DC:TcxCustomDataController;
begin
   // Inizializzazione
   DC := tvSpese.DataController;
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   try
      DC.BeginUpdate;
      // Prima di tutto elimina i righi vecchi del documento
      Qry.SQL.Add('DELETE FROM RAPGIORNRIGHISPESE WHERE');
      // NB: Per eliminare i vecchi righi usa le variabili globali che indentificano il documento che
      //      a questo punto contengono i valori identificativi non aggiornati (nel caso si fossero cambiati uno dei
      //      dati della chiave del documento) e quindi permettono di eliminare i vecchi righi correttamente.
      Qry.SQL.Add('    REGISTRO = ''' + Registro + '''');
      Qry.SQL.Add('AND NUMDOC = ' + IntToStr(NumDoc));
      Qry.SQL.Add('AND DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
      Qry.ExecSQL;
      // Poi cicla per tutti i righi dell'elenco del materiale e salva rigo per rigo
      for i := 0 to DC.RecordCount -1 do begin
         // Aggiorna lo schermo
         DM1.ShowWait('', 'Salvataggio rigo ' + IntToStr(i));
         // Inizializzazione ProgRigo
         ProgRigo := i;
         // Salva il rigo principale attuale (NB: I righi principali hanno sempre ProgRigo2 := -1)
         SalvaRigoSpese(DocReg, DocNum, DocData, i, ProgRigo, DC);
         // --------------------------------------------------------
      end;
   finally
      DC.EndUpdate;
      // Chiude gli eventuali messaggi di attesa
      DM1.CloseWait;
      // Distrugge l'oggetto Qry
      Qry.Free;
   end;
end;



procedure TRappGiornForm.SalvaRigoOreDipendenti(Registro:String; NumDoc:Longint; DocData:TDate; RowIdx, ProgRigo:Longint; DC:TcxCustomDataController);
var
   Qry: TIB_Cursor;
begin
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   try
      // Salva il rigo attuale
      Qry.SQL.Add('INSERT INTO RAPGIORNRIGHI (TIPODOC, NUMDOC, DATADOC, REGISTRO, NUMRIGO, CODDIPENDENTE, DESCRIZDIPENDENTE, CODCANTIERE,');
      Qry.SQL.Add(' DATACANTIERE, DESCRIZCANTIERE, CODSOGGETTO, DESCRIZSOGGETTO, QTA, COSTOORARIO, IMPORTOCOSTOORARIO, NOTE,');
      Qry.SQL.Add(' TIPOORE1, TIPOORE2, TIPOORE3, TIPO1, TIPO2, TIPO3, TIPO4, TIPO5, TIPO6,');
      Qry.SQL.Add(' PRZVEND, IMPORTOVEND, COSTOSTRAORDINARIO, QTASTRAORDINARIO, IMPORTOSTRAORDINARIO,');
      Qry.SQL.Add(' COSTOPERMESSI, QTAPERMESSI, IMPORTOPERMESSI, COSTOFERIE, QTAFERIE, IMPORTOFERIE, COSTOTRASFERTE, QTATRASFERTE, IMPORTOTRASFERTE,');
      Qry.SQL.Add(' OREBASE, SOTTOCANTIERE1, SOTTOCANTIERE2, SOTTOCANTIERE3, VERSIONE, OPERAINDEX, SEGNOOPERAZIONECANTIERE,');
      Qry.SQL.Add(' GC_COSTONETTOUNITARIO_MOD, GC_COSTONETTOUNITARIO, GC_RICARICO_MOD, GC_RICARICO, GC_QTA_MOD, GC_QTA, GC_DESCRIZIONE_MOD, GC_DESCRIZIONE,');
      Qry.SQL.Add(' GUID, GUID_REF');
      Qry.SQL.Add(') VALUES (');
      Qry.SQL.Add('''Rapp.giorn.'',');
      Qry.SQL.Add(IntToStr(NumDoc) + ',');
      Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DocData) + ''',');
      Qry.SQL.Add('''' + Registro + ''',');
      Qry.SQL.Add(IntToStr(ProgRigo) + ',');
      Qry.SQL.Add(DM1.IntVarToSQL(DC.Values[RowIdx,tvOreCODDIPENDENTE.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreDESCRIZDIPENDENTE.Index]) + ',');

      Qry.SQL.Add(IntToStr(QryRGPRATICA.AsInteger) + ',');
      Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', QryRGDATAPRATICA1.AsDateTime) + ''',');
      // NB: La riga sotto è stata sostituita perchè siccome DbeDescrizioneCantiere.Text contiene anche
      //      il numero e la data della pratica all'inizio queso faceva sforare la launghezza del campo
      //      apposito sul rigo, quindi lo prendo dalla vecchia descrizione della pratica che invece ha la sola
      //      descrizione e basta.
//      Qry.SQL.Add(QuotedStr(DbeDescrizioneCantiere.Text) + ',');
      Qry.SQL.Add(QuotedStr(EditDescrizionePratica1.Text) + ',');

      Qry.SQL.Add(IntToStr(QryRGCODICECLIENTE.AsInteger) + ',');
      Qry.SQL.Add(QuotedStr(QryRGRAGSOCCLI.AsString) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreQTA.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreCOSTOORARIO.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreIMPORTOCOSTOORARIO.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreNOTE.Index]) + ',');

      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPOORE1.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPOORE2.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPOORE3.Index]) + ',');

      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPO1.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPO2.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPO3.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPO4.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPO5.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreTIPO6.Index]) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOrePRZVEND.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreIMPORTOVEND.Index]) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreCOSTOSTRAORDINARIO.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreQTASTRAORDINARIO.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreIMPORTOSTRAORDINARIO.Index]) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreCOSTOPERMESSI.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreQTAPERMESSI.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreIMPORTOPERMESSI.Index]) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreCOSTOFERIE.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreQTAFERIE.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreIMPORTOFERIE.Index]) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreCOSTOTRASFERTE.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreQTATRASFERTE.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreIMPORTOTRASFERTE.Index]) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreOREBASE.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL_DefaultIfNull(DC.Values[RowIdx,tvOreSOTTOCANTIERE1.Index], '') + ',');
      Qry.SQL.Add(DM1.StrVarToSQL_DefaultIfNull(DC.Values[RowIdx,tvOreSOTTOCANTIERE2.Index], '') + ',');
      Qry.SQL.Add(DM1.StrVarToSQL_DefaultIfNull(DC.Values[RowIdx,tvOreSOTTOCANTIERE3.Index], '') + ',');
      Qry.SQL.Add(IntToStr(MainForm.PrgVersion) + ',');
      Qry.SQL.Add(DM1.IntVarToSQL(DC.Values[RowIdx,tvOreOPERAINDEX.Index]) + ',');

      Qry.SQL.Add(QuotedStr(QryRGSEGNOOPERAZIONECANTIERE.AsString) + ',');


      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreGC_COSTONETTOUNITARIO_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreGC_COSTONETTOUNITARIO.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreGC_RICARICO_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreGC_RICARICO.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreGC_QTA_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvOreGC_QTA.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreGC_DESCRIZIONE_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(Trim(DM1.StrLeft(DC.DisplayTexts[RowIdx,tvOreGC_DESCRIZIONE.Index], 1000))) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreGUID.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvOreGUID_REF.Index]));

      Qry.SQL.Add(')');
      Qry.ExecSQL;
   finally
      // Elimina l'oggetto Qry
      Qry.Free;
   end;
end;


procedure TRappGiornForm.SalvaRigoSpese(Registro:String; NumDoc:Longint; DocData:TDate; RowIdx, ProgRigo:Longint; DC:TcxCustomDataController);
var
   Qry: TIB_Cursor;
begin
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   try
      // Salva il rigo attuale
      Qry.SQL.Add('INSERT INTO RAPGIORNRIGHISPESE (TIPODOC, NUMDOC, DATADOC, REGISTRO, NUMRIGO, NUMRIGO2, CODDIPENDENTE, DESCRIZDIPENDENTE, CODCANTIERE,');
      Qry.SQL.Add(' DATACANTIERE, DESCRIZCANTIERE, CODSOGGETTO, DESCRIZSOGGETTO, IMPORTO, NOTE,');
      Qry.SQL.Add(' TIPOCOSTO1, TIPOCOSTO2, TIPOCOSTO3, TIPO1, TIPO2, TIPO3, TIPO4, TIPO5, TIPO6,');
      Qry.SQL.Add(' CODAUTOMEZZO, DESCRIZAUTOMEZZO, KM, SOTTOCANTIERE1, SOTTOCANTIERE2, SOTTOCANTIERE3, VERSIONE, SEGNOOPERAZIONECANTIERE,');
      Qry.SQL.Add(' GC_COSTONETTOUNITARIO_MOD, GC_COSTONETTOUNITARIO, GC_RICARICO_MOD, GC_RICARICO, GC_QTA_MOD, GC_QTA, GC_DESCRIZIONE_MOD, GC_DESCRIZIONE,');
      Qry.SQL.Add(' GUID, GUID_REF)');
      Qry.SQL.Add('VALUES (');
      Qry.SQL.Add('''Rapp.giorn.'',');
      Qry.SQL.Add(IntToStr(NumDoc) + ',');
      Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DocData) + ''',');
      Qry.SQL.Add('''' + Registro + ''',');
      Qry.SQL.Add(IntToStr(ProgRigo) + ',');
      Qry.SQL.Add('-9999,');
      Qry.SQL.Add(DM1.IntVarToSQL(DC.Values[RowIdx,tvSpeseCODDIPENDENTE.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseDESCRIZDIPENDENTE.Index]) + ',');

      Qry.SQL.Add(IntToStr(QryRGPRATICA.AsInteger) + ',');
      Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', QryRGDATAPRATICA1.AsDateTime) + ''',');
      // NB: La riga sotto è stata sostituita perchè siccome DbeDescrizioneCantiere.Text contiene anche
      //      il numero e la data della pratica all'inizio queso faceva sforare la launghezza del campo
      //      apposito sul rigo, quindi lo prendo dalla vecchia descrizione della pratica che invece ha la sola
      //      descrizione e basta.
//      Qry.SQL.Add(QuotedStr(DbeDescrizioneCantiere.Text) + ',');
      Qry.SQL.Add(QuotedStr(EditDescrizionePratica1.Text) + ',');

      Qry.SQL.Add(IntToStr(QryRGCODICECLIENTE.AsInteger) + ',');
      Qry.SQL.Add(QuotedStr(QryRGRAGSOCCLI.AsString) + ',');

      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvSpeseIMPORTO.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseNOTE.Index]) + ',');

      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPOSPESA1.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPOSPESA2.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPOSPESA3.Index]) + ',');

      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPO1.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPO2.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPO3.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPO4.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPO5.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseTIPO6.Index]) + ',');

      Qry.SQL.Add(DM1.IntVarToSQL(DC.Values[RowIdx,tvSpeseCODAUTOMEZZO.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseDESCRIZAUTOMEZZO.Index]) + ',');
      Qry.SQL.Add(DM1.IntVarToSQL(DC.Values[RowIdx,tvSpeseKM.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL_DefaultIfNull(DC.Values[RowIdx,tvSpeseSOTTOCANTIERE1.Index], '') + ',');
      Qry.SQL.Add(DM1.StrVarToSQL_DefaultIfNull(DC.Values[RowIdx,tvSpeseSOTTOCANTIERE2.Index], '') + ',');
      Qry.SQL.Add(DM1.StrVarToSQL_DefaultIfNull(DC.Values[RowIdx,tvSpeseSOTTOCANTIERE3.Index], '') + ',');
      Qry.SQL.Add(IntToStr(MainForm.PrgVersion) + ',');

      Qry.SQL.Add(QuotedStr(QryRGSEGNOOPERAZIONECANTIERE.AsString) + ',');


      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseGC_COSTONETTOUNITARIO_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvSpeseGC_COSTONETTOUNITARIO.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseGC_RICARICO_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvSpeseGC_RICARICO.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseGC_QTA_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.FloatVarToSQL(DC.Values[RowIdx,tvSpeseGC_QTA.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseGC_DESCRIZIONE_MOD.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(Trim(DM1.StrLeft(DC.DisplayTexts[RowIdx,tvSpeseGC_DESCRIZIONE.Index], 1000))) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseGUID.Index]) + ',');
      Qry.SQL.Add(DM1.StrVarToSQL(DC.Values[RowIdx,tvSpeseGUID_REF.Index]));


      Qry.SQL.Add(')');
      Qry.ExecSQL;
   finally
      // Elimina l'oggetto Qry
      Qry.Free;
   end;
end;


procedure TRappGiornForm.FormShow(Sender: TObject);
begin
  inherited;
   cxPageControl1.ActivePage := TabDipendenti;
   // In base al valore di 'Tag' apre la form in diverse modalità...
   case Tag of
      // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
      1: begin
        // IMposta i parametri delle query
        if QryRG.Active then QryRG.Close;
        QryRG.ParamByName('P_NUMDOC').AsInteger     := Self.NumDoc;
        QryRG.ParamByName('P_DATADOC').AsDate       := Self.DataDoc;
        QryRG.ParamByName('P_REGISTRO').AsString    := Self.Registro;
        QryRG.Open;
        // Se non trova il documento...
        if QryRG.Eof then begin
          MessageDlg('Documento non trovato!', mtError, [mbOK], 0);
          RappGiornForm.Close;
          Exit;
        end;
        // Carica i righi documento
        CaricaRighiDocumento(Self.Registro, Self.NumDoc, Self.DataDoc);
        CaricaRighiSpeseDocumento(Self.Registro, Self.NumDoc, Self.DataDoc);
        // Fa in modo che venga aggiornato la dicitura estesa dell'azione del cantiere
        QryRGSEGNOOPERAZIONECANTIEREChange(QryRGSEGNOOPERAZIONECANTIERE);
      end;

      // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
      2: begin
         // Se non è aperta, apre la query vuota in modo da poter inserire un nuovo record
         if not QryRG.Active then begin
           QryRG.ParamByName('P_NUMDOC').AsInteger     := -9999;
           QryRG.ParamByName('P_DATADOC').AsDate       := StrToDate('01/01/1900');
           QryRG.ParamByName('P_REGISTRO').AsString    := 'ASDF';
           QryRG.Open;
         end;
         // Aggiunge il nuovo record
         QryRG.Append;
          QryRGDATADOC.Value := Date;
          QryRGREGISTRO.Value := DM1.RegistroDefault;
          QryRGSEGNOOPERAZIONECANTIERE.Value := '+';
          if ClientiForm.ClienteCorrente <> '' then QryRGCODICECLIENTE.Value := StrToInt(ClientiForm.ClienteCorrente) else QryRGCODICECLIENTE.Value := 0;
          if ClientiForm.PraticaCorrente <> ''      then QryRGPratica.Value       := StrToInt(ClientiForm.PraticaCorrente);
          if ClientiForm.DataPraticaCorrente <> ''  then QryRGDataPratica1.Value  := StrToDate(ClientiForm.DataPraticaCorrente);
         //  Pone la form direttamente in modalità di modifica
         RxSpeedModifica.Down := True;
         RxSpeedModificaClick(Self);
      end;
   end;

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 1 then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Apre le query relative  alla selezione dei tipi ore
   QTipoOre1.Open;
   QTipoOre2.Open;
   QTipoOre3.Open;
   QTipoSpese1.Open;
   QTipoSpese2.Open;
   QTipoSpese3.Open;

   // Carica le impostazioni delle griglie
   DM1.RipristinaDevExpress(GridOre, '', False);
   DM1.RipristinaDevExpress(GridSpese, '', False);

   // Carica la descrizione della pratica
   if (not QryRGPRATICA.IsNull)  and (not QryRGDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QryRGPRATICA.Value,  QryRGDATAPRATICA1.Value, EditDescrizionePratica1);

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;

   // Carica layouut
   CaricaFormLayout;
   // CArica i tipi di richi nelle ComboBox delle colonne relative
   CaricaItemsTipiRighi;

end;




procedure TRappGiornForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     DM1.Attendere;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Avvia la transazione
          DM1.DBAzienda.StartTransaction;
          // Tabella in editing mode
          QryRG.Edit;
          // Modica i pulsanti e i colori dei campi per la modifica
          RxSpeedButtonNuovo.Enabled         := True;
          RxSpeedButtonElimina.Enabled       := True;
//          RxSpeedButtonStampa.Enabled        := False;
          RxSpeedButtonUscita.Enabled        := False;
          BitBtnPratica1.Enabled             := True;
          BitBtnCliente.Enabled              := True;
          BitBtnSelezioneStato.Enabled       := True;
          DbeAzioneCantiere.Enabled          := True;
          // Flag che se True fa in modo che sia possibili modificare il registro dei documento solo
          //  alla creazione del documento stesso e non lo consente più successivamente.
          DBComboRegistro.Enabled := not (DM1.ModificaRegistroSoloNuovoDocumento and (not QryRGNUMDOC.IsNull));
          // Colora tutti i campi per la modofica
          DM1.ColoraTuttiCampi(RappGiornForm, COLOR_MODIFICA);
          tvOre.Styles.Background         := DM1.tvBackgroundModifica;
          tvOre.Styles.ContentEven        := DM1.tvContentEvenModifica;
          tvOre.Styles.ContentOdd         := DM1.tvContentOddModifica;
          tvSpese.Styles.Background         := DM1.tvBackgroundModifica;
          tvSpese.Styles.ContentEven        := DM1.tvContentEvenModifica;
          tvSpese.Styles.ContentOdd         := DM1.tvContentOddModifica;
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
          // Disabilita la modifica dei campi
          QryRG.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Sposta il focus in modo da salvare il valore appena inserito anche se l'utente non ha onfermato con invio
               DBEDataDoc.SetFocus;
               DBEditNumDoc.SetFocus;
               // Verifica che non ci siano dei righi con Qta mancante oppure uguale a zero
               if CiSonoQtaMancanti then raise exception.Create('Mancano le ore in alcune righe...');
               // Visualizza il messaggio di operazione in corso
               DM1.ShowWait('Documento', 'Conferma documento');
               try
                 // Se il codice cliente è nullo (nuovo cliente) ne assegna uno nuovo.
//                 if QryRGNUMDOC.IsNull then  QryRGNUMDOC.Value := DM1.NextCodice('RAPGIORN', 'NUMDOC');
                 if QryRGNUMDOC.IsNull then  QryRGNUMDOC.Value := DM1.NextNumRegistroData('RAPGIORN', 'NUMDOC', 'DATADOC', QryRGREGISTRO.Value, QryRGDATADOC.Value);
                 // COnferma i dati
                 QryRG.Post;
                 // Salva i righi del documento
                 SalvaRighiOreDipendenti(QryRGREGISTRO.AsString, QryRGNUMDOC.AsInteger, QryRGDATADOC.AsDateTime);
                 SalvaRighiSpese(QryRGREGISTRO.AsString, QryRGNUMDOC.AsInteger, QryRGDATADOC.AsDateTime);
                 // Commit
                 DM1.DBAzienda.CommitRetaining;

                 // Decide se gli allegati devono essere già visibili oppure no.
                 Allegati_VerificaAbilitazione;

                 // Aggiorna le variebili globali che contengono il riferimento alla Dichiarazione di Conformità corrente
                 Self.NumDoc    := QryRGNUMDOC.Value;
                 Self.DataDoc   := QryRGDATADOC.Value;
                 Self.Registro  := QryRGREGISTRO.Value;
               finally
                 DM1.CloseWait;
               end;
          end else if MR = mrNo then begin
             if QryRG.State = dsInsert then begin
                QryRG.Cancel;
                // Rollback
                DM1.DBAzienda.RollbackRetaining;
                // Chiude il mesaggio di attesa
                DM1.ChiudiAttendere;
                Close;    // Chiude la form (altrimenti dà problemi)
                Exit;
             end else begin
                QryRG.Cancel;
                // Rollback
                DM1.DBAzienda.RollbackRetaining;
                // Carica i righi documento
                CaricaRighiDocumento(Self.Registro, Self.NumDoc, Self.DataDoc);
                CaricaRighiSpeseDocumento(Self.Registro, Self.NumDoc, Self.DataDoc);
            end;
          end else begin
               RxSpeedModifica.Down := True;
               DM1.ChiudiAttendere;
               Exit;
          end;
          // Ripristina i pulsanti e i colori dei campi
          RxSpeedButtonNuovo.Enabled         := False;
          RxSpeedButtonElimina.Enabled       := False;
//          RxSpeedButtonStampa.Enabled        := True;
          RxSpeedButtonUscita.Enabled        := True;
          BitBtnPratica1.Enabled             := False;
          BitBtnCliente.Enabled              := False;
          BitBtnSelezioneStato.Enabled       := False;
          DbeAzioneCantiere.Enabled          := False;
          // RImette i colori normali
          DM1.ColoraTuttiCampi(RappGiornForm, COLOR_NORMALE);
          tvOre.Styles.Background         := DM1.tvBackground;
          tvOre.Styles.ContentEven        := DM1.tvContentEven;
          tvOre.Styles.ContentOdd         := DM1.tvContentOdd;
          tvSpese.Styles.Background         := DM1.tvBackground;
          tvSpese.Styles.ContentEven        := DM1.tvContentEven;
          tvSpese.Styles.ContentOdd         := DM1.tvContentOdd;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryRG.Edit;
          end;
       end;
     end;
     DM1.ChiudiAttendere;
end;

procedure TRappGiornForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TRappGiornForm.tvOreDESCRIZDIPENDENTEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DM1.Attendere;
  try
    Application.CreateForm(TDipendentiForm, DipendentiForm);
    DipendentiForm.Parent := MainForm;
    DipendentiForm.DblClickMode := DblClickModeSelection;
    DipendentiForm.CallerCode := 1;
    DipendentiForm.SoloAttivi := True;
    DipendentiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TRappGiornForm.tvOreCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TRappGiornForm.tvOreCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TRappGiornForm.tvOreCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TRappGiornForm.tvOreFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   RI: Integer;  // RI=RecordIndex
   DC:TcxCustomDataController;
begin
  inherited;
   // DC Punta al Datacontroller corrente
   DC := Sender.DataController;
   //  Ho aggiunto la prima condizione perchè altrimenti dava errore quando eliminavo l'ultima riga in quando
   //  AFocusedRecord assumeva il valore nil e quindi dava errore di Access violation.
   if AFocusedRecord <> nil then begin  // NB: +1 perchèAFocused record è a base 0
      // RIcava il record index del rigo
      RI := AFocusedRecord.Index;
      // IMposta il valore di default del soggetto
      if VarIsNull(DC.Values[RI,tvOreCODSOGGETTO.Index]) then begin
        if ClientiForm.ClienteCorrente = '' then begin
          DC.Values[RI, tvOreCODSOGGETTO.Index] := 0;
          DC.Values[RI, tvOreDESCRIZSOGGETTO.Index] := '';
        end else begin
          DC.Values[RI, tvOreCODSOGGETTO.Index] := StrToInt(ClientiForm.ClienteCorrente);
          DC.Values[RI, tvOreDESCRIZSOGGETTO.Index] := ClientiForm.RagSocCS;
        end;
      end;
      // IMposta il valore di default del cantiere
      if VarIsNull(DC.Values[RI,tvOreCODCANTIERE.Index]) then begin
        if ClientiForm.PraticaCorrente <> '' then begin
          DC.Values[RI, tvOreCODCANTIERE.Index] := StrToInt(ClientiForm.PraticaCorrente);
          DC.Values[RI, tvOreDATACANTIERE.Index] := ClientiForm.DataPraticaCorrente;
          DC.Values[RI, tvOreDESCRIZCANTIERE.Index] := ClientiForm.DescPraticaCorrente;
        end;
      end;
   end;
end;

procedure TRappGiornForm.tvOreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  // ===========================================================================
  // DUPLICAZIONE RIGO (CTRL+D)
  // ---------------------------------------------------------------------------
  if (Key = 68) and  (ssCtrl in Shift) then begin
    Duplicarigo1Click(Duplicarigo1);
  end;
  // ===========================================================================

  Exit;  // Annulla il codice sottostante



  // ===========================================================================
  // PARTE CHE MODIFICA IL COMPORTAMENTO DELLA GRIGLIA QUANDO L'UTENTE PREME
  //  IL PULSANTE KEYDOWN SULLA TASTIERA MENTRE SI TROVA SULL'ULITMA RIGA
  //  PERCHE' IL COMPORTAMENTO NORMALE MI DAVA DEI PROBLEMI SUI RIGHI NUOVI
  //  QUANDO DA UN'ALTRA FORM DOVEVO IMPOSTARE I VALORI DI UN RIGO NUOVO EPPENA CREATO
  // ---------------------------------------------------------------------------
  // Key Down (Append)
  if  (Key = 40)
  and ((tvOre.DataController.FocusedRecordIndex+1) = tvOre.DataController.RecordCount)
  then begin
    tvOre.Controller.ClearSelection;
    tvOre.DataController.FocusedRecordIndex := tvOre.DataController.AppendRecord;
  // Ins (Insert)
  end else if (Key = 45) then begin
    tvOre.Controller.ClearSelection;
    if tvOre.DataController.FocusedRecordIndex = -1
    then tvOre.DataController.FocusedRecordIndex := tvOre.DataController.AppendRecord
    else tvOre.DataController.FocusedRecordIndex := tvOre.DataController.InsertRecord(tvOre.DataController.FocusedRecordIndex);
  end;
  // ===========================================================================
end;

procedure TRappGiornForm.tvOreDESCRIZCANTIEREPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DM1.Attendere;
  try
    Application.CreateForm(TSelezionaPraticheImpiantiForm, SelezionaPraticheImpiantiForm);
    SelezionaPraticheImpiantiForm.Parent := MainForm;
    SelezionaPraticheImpiantiForm.CallerCode := 1;
    SelezionaPraticheImpiantiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TRappGiornForm.tvOreDESCRIZSOGGETTOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DM1.Attendere;
  try
    Application.CreateForm(TSelezioneClienteForm, SelezioneClienteForm);
    SelezioneClienteForm.Parent := MainForm;
    SelezioneClienteForm.CallerCode := 1;
    SelezioneClienteForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

function TRappGiornForm.CalcolaImportoOrario(y:Integer): Double;
var
  DC: TcxCustomDataController;
  TotQtaVend: Double;
begin
  DC := tvOre.DataController;

  // Inizializza il valore da ritornare (il numero di ore ordinarie) che uso nella
  //  gestione dell'evento 'tvOreEditValueChanged' per modificare il numero di
  //  ore ordinarie nel rigo attraverso 'Sender.Controller.EditingController.Edit.EditValue'
  //  altrimenti non mi modifica il campo QTA.
  Result := 0;
  if  (not VarIsNull(DC.Values[y, tvOreQTA.Index])) then begin
    Result := DC.Values[y, tvOreQTA.Index];
  end;

  // Prima di tutto controlla se le ore ordinarie sono di più delle ore base
  //  e se lo sono scompone automaticamente il dato tra ore ordinarie e ore
  //  straordinarie
  if  (not VarIsNull(DC.Values[y, tvOreQTA.Index]))
  and (not VarIsNull(DC.Values[y, tvOreOREBASE.Index]))
  and (DC.Values[y, tvOreQTA.Index] > DC.Values[y, tvOreOREBASE.Index])
  then begin
    DC.Values[y, tvOreQTASTRAORDINARIO.Index] := DC.Values[y, tvOreQTA.Index] - DC.Values[y, tvOreOREBASE.Index];
    Result := DC.Values[y, tvOreOREBASE.Index];
  end;

  //  CALCOLO COSTO ORE ORDINARIE
  if  (not VarIsNull(DC.Values[y, tvOreQTA.Index]))
  and (not VarIsNull(DC.Values[y, tvOreCOSTOORARIO.Index]))
  then begin
    DC.Values[y, tvOreIMPORTOCOSTOORARIO.Index] := DM1.Arrotonda(   DC.Values[y, tvOreCOSTOORARIO.Index] * DC.Values[y, tvOreQTA.Index]   , DM1.DecMicroPrz);
  end;

  // CALCOLO ORE STRAORDINARIE
  if  (not VarIsNull(DC.Values[y, tvOreQTASTRAORDINARIO.Index]))
  and (not VarIsNull(DC.Values[y, tvOreCOSTOSTRAORDINARIO.Index]))
  then begin
    DC.Values[y, tvOreIMPORTOSTRAORDINARIO.Index] := DM1.Arrotonda(   DC.Values[y, tvOreCOSTOSTRAORDINARIO.Index] * DC.Values[y, tvOreQTASTRAORDINARIO.Index]   , DM1.DecMicroPrz);
  end;

  // CALCOLO ORE PERMESSI
  if  (not VarIsNull(DC.Values[y, tvOreQTAPERMESSI.Index]))
  and (not VarIsNull(DC.Values[y, tvOreCOSTOPERMESSI.Index]))
  then begin
    DC.Values[y, tvOreIMPORTOPERMESSI.Index] := DM1.Arrotonda(   DC.Values[y, tvOreCOSTOPERMESSI.Index] * DC.Values[y, tvOreQTAPERMESSI.Index]   , DM1.DecMicroPrz);
  end;

  // CALCOLO ORE FERIE
  if  (not VarIsNull(DC.Values[y, tvOreQTAFERIE.Index]))
  and (not VarIsNull(DC.Values[y, tvOreCOSTOFERIE.Index]))
  then begin
    DC.Values[y, tvOreIMPORTOFERIE.Index] := DM1.Arrotonda(   DC.Values[y, tvOreCOSTOFERIE.Index] * DC.Values[y, tvOreQTAFERIE.Index]   , DM1.DecMicroPrz);
  end;

  // CALCOLO ORE TRASFERTE
  if  (not VarIsNull(DC.Values[y, tvOreQTATRASFERTE.Index]))
  and (not VarIsNull(DC.Values[y, tvOreCOSTOTRASFERTE.Index]))
  then begin
    DC.Values[y, tvOreIMPORTOTRASFERTE.Index] := DM1.Arrotonda(   DC.Values[y, tvOreCOSTOTRASFERTE.Index] * DC.Values[y, tvOreQTATRASFERTE.Index]   , DM1.DecMicroPrz);
  end;

  //  CALCOLO VENDITA
  // Prima di tutto calcola le ore di vendita (Ore ordinarie + ore straordinarie)
  TotQtaVend := Result;  // Uso il valore di Result per evitare alcuni possibili problemi di aggiornamento del valore del campo
  if  (not VarIsNull(DC.Values[y, tvOreQTASTRAORDINARIO.Index])) then TotQtaVend := TotQtaVend + DC.Values[y, tvOreQTASTRAORDINARIO.Index];
//  if  (not VarIsNull(DC.Values[y, tvOreQTATRASFERTE.Index])) then TotQtaVend := TotQtaVend + DC.Values[y, tvOreQTATRASFERTE.Index];
  // Calcola l'importo di vendita
  if (not VarIsNull(DC.Values[y, tvOrePRZVEND.Index]))
  then begin
    DC.Values[y, tvOreIMPORTOVEND.Index] := DM1.Arrotonda(   DC.Values[y, tvOrePRZVEND.Index] * TotQtaVend   , DM1.DecMicroPrz);
  end;
end;

procedure TRappGiornForm.tvOreEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
   Row:Integer;
   DC: TcxCustomDataController;
begin
  inherited;
     // Per non so quale motivo, quando entro in editing di un campo (Descrizione) passa 2 o 3 volte di quà
     //  e anche quando lo confermo passa altre due o tre volte di quà.
     //  Però quando modificavo la descrizione (dopo aver messo il memo) premendo INVIO al secondo passaggio
     //  mi dava Access Violation Error e ho visto che AItem era nil. Quindi per risolvere
     //  ora controllo AItem e se è = nil esco subito.
     if AItem = nil then Exit;
     // Questa linea fa in modo che se il DataController ha la proprieta "EditState"
     //  di valore dceInsert senza anessun altro flag il programma esce senza fare nulla.
     //  Questo è stato necessario perchè se un utente si metteva sull'ultima riga, iniziava a
     //  editare il campo e poi premeva il tasto freccia giù, quanto inserito nel campo
     //  andava perso e il campo stesso rimaneva vuoto. Ho verificato che in questo caso
     //  questo evento veniva lanciato 2 volte, la prima volta in modo corretto, a seconda
     //  con valore NULL che azzerava il campo. Così è a posto.
     if Sender.DataController.EditState = [dceInsert] then Exit;
     // DC Punta al DataCOntroller della TableView puntata da Sender
     DC := Sender.DataController;
     // Inizializzazione
     Row := DC.FocusedRecordIndex;
     // Blocca il painting della griglia sullo schermo per velocizzare l'esecuzione dei calcoli
     DC.BeginUpdate;
     // Scollega il gestore dell'evento
     //  NB: Lo scollego perchè mi capitava che se nel codice seguente modificavo i valore di altuni campi
     //       il gestore di evento veniva subito richiamato un'altra volta ma con il valore
     //       di 'Sender.Controller.EditingController.Edit.EditValue' sempre = 0 e la cosa
     //       mi dava molti problemi. Cmq. poi lo ripristino alla fine.
     Sender.OnEditValueChanged := nil;
     try
        // Le righe quì sotto servono a risolvere l'errore quando un utente eliminava un precedente
        //  valore Qtà, praticamente ho visto che quando l'utente cancellava (BackSpace) la precedente
        //  Qtà il valore di 'Sender.Controller.EditingController.Edit.EditValue' che è un variant
        //  era una Stringa nulla e quindi il variant diventava di 'varString', allora ho fatto in
        //  modo che in questo caso reimposta il valore come 'NUll' e tutto sembra funzionare
        //  correttamente.
        if  (AItem.Index = tvOreQTA.Index)
        and (VarType(Sender.Controller.EditingController.Edit.EditValue) = varString)
        and (Sender.Controller.EditingController.Edit.EditValue = '')
        then Sender.Controller.EditingController.Edit.EditValue := Null;

        // Forza la scrittura del nuovo valore inserito dall'utente perchè altrimenti
        //  le righe successive lavoravano con il valore antecedente la modifica.
        DC.Values[Row, AItem.Index] := Sender.Controller.EditingController.Edit.EditValue;

        // =====================================================================
        // In base alla colonna modificata esegue gli eventuali calcoli per aggiornare ad es. il totale del rigo, i margini ecc.
        // ---------------------------------------------------------------------
        // QTA (Ore ordinarie)
        if (AItem.Index = tvOreQTA.Index) then begin
          // Azzera il numero di straordinarie perchè tanto se si sono
          //  modificate le ore ordinarie il CalcolaImportoOrario  ricalcola
          //  anche le straordinarie.
          DC.Values[Row, tvOreQTASTRAORDINARIO.Index] := 0;
          // Se la Qta e anche il costo orario non sono nulli provvede a calcolare
          //  l'importo.
          Sender.Controller.EditingController.Edit.EditValue := CalcolaImportoOrario(Row);
        end else begin
          CalcolaImportoOrario(Row);
        end;
        // =====================================================================
     finally
       // Ripristina il gestore di evento.
       Sender.OnEditValueChanged := tvOreEditValueChanged;
       // Riabilita il painting del componente forzando così l'aggiornamento dello schermo
       DC.EndUpdate;
     end;
end;

procedure TRappGiornForm.tvSpeseFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   RI: Integer;  // RI=RecordIndex
   DC:TcxCustomDataController;
begin
  inherited;
   // DC Punta al Datacontroller corrente
   DC := Sender.DataController;
   //  Ho aggiunto la prima condizione perchè altrimenti dava errore quando eliminavo l'ultima riga in quando
   //  AFocusedRecord assumeva il valore nil e quindi dava errore di Access violation.
   if AFocusedRecord <> nil then begin  // NB: +1 perchèAFocused record è a base 0
      // RIcava il record index del rigo
      RI := AFocusedRecord.Index;
      // IMposta il valore di default del soggetto
      if VarIsNull(DC.Values[RI,tvSpeseCODSOGGETTO.Index]) then begin
        if ClientiForm.ClienteCorrente = '' then begin
          DC.Values[RI, tvSpeseCODSOGGETTO.Index] := 0;
          DC.Values[RI, tvSpeseDESCRIZSOGGETTO.Index] := '';
        end else begin
          DC.Values[RI, tvSpeseCODSOGGETTO.Index] := StrToInt(ClientiForm.ClienteCorrente);
          DC.Values[RI, tvSpeseDESCRIZSOGGETTO.Index] := ClientiForm.RagSocCS;
        end;
      end;
      // IMposta il valore di default del cantiere
      if VarIsNull(DC.Values[RI,tvSpeseCODCANTIERE.Index]) then begin
        if ClientiForm.PraticaCorrente <> '' then begin
          DC.Values[RI, tvSpeseCODCANTIERE.Index] := StrToInt(ClientiForm.PraticaCorrente);
          DC.Values[RI, tvSpeseDATACANTIERE.Index] := ClientiForm.DataPraticaCorrente;
          DC.Values[RI, tvSpeseDESCRIZCANTIERE.Index] := ClientiForm.DescPraticaCorrente;
        end;
      end;
   end;
end;

procedure TRappGiornForm.tvSpeseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  // ===========================================================================
  // DUPLICAZIONE RIGO (CTRL+D)
  // ---------------------------------------------------------------------------
  if (Key = 68) and  (ssCtrl in Shift) then begin
    Duplicarigo1Click(Duplicarigo1);
  end;
  // ===========================================================================



  Exit;  // Annulla il codice sottostante



  // ===========================================================================
  // PARTE CHE MODIFICA IL COMPORTAMENTO DELLA GRIGLIA QUANDO L'UTENTE PREME
  //  IL PULSANTE KEYDOWN SULLA TASTIERA MENTRE SI TROVA SULL'ULITMA RIGA
  //  PERCHE' IL COMPORTAMENTO NORMALE MI DAVA DEI PROBLEMI SUI RIGHI NUOVI
  //  QUANDO DA UN'ALTRA FORM DOVEVO IMPOSTARE I VALORI DI UN RIGO NUOVO EPPENA CREATO
  // ---------------------------------------------------------------------------
  // Key Down (Append)
  if  (Key = 40)
  and ((tvSpese.DataController.FocusedRecordIndex+1) = tvSpese.DataController.RecordCount)
  then begin
    tvSpese.Controller.ClearSelection;
    tvSpese.DataController.FocusedRecordIndex := tvSpese.DataController.AppendRecord;
  // Ins (Insert)
  end else if (Key = 45) then begin
    tvSpese.Controller.ClearSelection;
    if tvSpese.DataController.FocusedRecordIndex = -1
    then tvSpese.DataController.FocusedRecordIndex := tvSpese.DataController.AppendRecord
    else tvSpese.DataController.FocusedRecordIndex := tvSpese.DataController.InsertRecord(tvSpese.DataController.FocusedRecordIndex);
  end;
  // ===========================================================================
end;

procedure TRappGiornForm.tvSpeseDESCRIZDIPENDENTEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DM1.Attendere;
  try
    Application.CreateForm(TDipendentiForm, DipendentiForm);
    DipendentiForm.Parent := MainForm;
    DipendentiForm.DblClickMode := DblClickModeSelection;
    DipendentiForm.CallerCode := 2;
    DipendentiForm.SoloAttivi := True;
    DipendentiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;

end;

procedure TRappGiornForm.tvSpeseDESCRIZCANTIEREPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DM1.Attendere;
  try
    Application.CreateForm(TSelezionaPraticheImpiantiForm, SelezionaPraticheImpiantiForm);
    SelezionaPraticheImpiantiForm.Parent := MainForm;
    SelezionaPraticheImpiantiForm.CallerCode := 2;
    SelezionaPraticheImpiantiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TRappGiornForm.tvSpeseDESCRIZSOGGETTOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DM1.Attendere;
  try
    Application.CreateForm(TSelezioneClienteForm, SelezioneClienteForm);
    SelezioneClienteForm.Parent := MainForm;
    SelezioneClienteForm.CallerCode := 2;
    SelezioneClienteForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TRappGiornForm.tvSpeseDESCRIZAUTOMEZZOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  DM1.Attendere;
  try
    Application.CreateForm(TAutomezziForm, AutomezziForm);
    AutomezziForm.Parent := MainForm;
    AutomezziForm.DblClickMode := DblClickModeSelection;
    AutomezziForm.CallerCode := 2;
    AutomezziForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TRappGiornForm.tvSpeseDblClick(Sender: TObject);
var
   c: Integer;
begin
   c := tvSpese.Controller.FocusedItem.Index;
   if      c = tvSpeseDESCRIZAUTOMEZZO.Index    then tvSpeseDESCRIZAUTOMEZZOPropertiesButtonClick(nil, 0)
   else if c = tvSpeseDESCRIZDIPENDENTE.Index   then tvSpeseDESCRIZDIPENDENTEPropertiesButtonClick(nil, 0)
   else if c = tvSpeseDESCRIZCANTIERE.Index     then tvSpeseDESCRIZCANTIEREPropertiesButtonClick(nil, 0)
   else if c = tvSpeseDESCRIZSOGGETTO.Index     then tvSpeseDESCRIZSOGGETTOPropertiesButtonClick(nil, 0);
end;

procedure TRappGiornForm.tvOreDblClick(Sender: TObject);
var
   c: Integer;
begin
   c := tvOre.Controller.FocusedItem.Index;
   if      c = tvOreDESCRIZDIPENDENTE.Index   then tvOreDESCRIZDIPENDENTEPropertiesButtonClick(nil, 0)
   else if c = tvOreDESCRIZCANTIERE.Index     then tvOreDESCRIZCANTIEREPropertiesButtonClick(nil, 0)
   else if c = tvOreDESCRIZSOGGETTO.Index     then tvOreDESCRIZSOGGETTOPropertiesButtonClick(nil, 0);
end;

procedure TRappGiornForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  inherited;
  // Richiama la form di selezione del dipendente
  if cxPageControl1.ActivePage = TabDipendenti then
  begin
    DM1.Attendere;
    try
      Application.CreateForm(TDipendentiForm, DipendentiForm);
      DipendentiForm.Parent := MainForm;
      DipendentiForm.DblClickMode := DblClickModeSelection;
      DipendentiForm.CallerCode := 3;
      DipendentiForm.SoloAttivi := True;
      DipendentiForm.Show;
    finally
      DM1.ChiudiAttendere;
    end;
  end
  else
  if cxPageControl1.ActivePage = TabAltriCosti then
  begin
    DM1.Attendere;
    try
      Application.CreateForm(TDipendentiForm, DipendentiForm);
      DipendentiForm.Parent := MainForm;
      DipendentiForm.DblClickMode := DblClickModeSelection;
      DipendentiForm.CallerCode := 4;
      DipendentiForm.SoloAttivi := True;
      DipendentiForm.Show;
    finally
      DM1.ChiudiAttendere;
    end;
  end;
end;

procedure TRappGiornForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Richiesta conferma
  MessageBeep(0);
  if MessageDlg('Eliminare tutti i righi selezionati?', mtInformation, [mbNo, mbOk], 0) = mrOk then begin
    // Cancellazione
    if cxPageControl1.ActivePage = TabDipendenti then tvOre.DataController.DeleteSelection
    else if cxPageControl1.ActivePage = TabAltriCosti then tvSpese.DataController.DeleteSelection;
  end;
end;

procedure TRappGiornForm.Salvaimpostazionicolonne1Click(Sender: TObject);
var
   Vista:String;
begin
      // Chiede il nome della vista
      if InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then begin
         // Controlla che la vista non sia nullo
         if Trim(Vista) = '' then raise Exception.Create('Il nome della vista non può essere vuoto.');
      end else begin
         // Se l'utente ha cliccato su Cancel annulla l'operazione
         Exit;
      end;
      // In base alla pagina selezionata...
      if cxPageControl1.ActivePage = TabDipendenti then begin
         // Salva le impostazioni delle colonne dei clienti
         DM1.SalvaGriglieDevExpress(GridOre, Vista, False);
      end else if cxPageControl1.ActivePage = TabAltriCosti then begin
         // Salva le impostazioni delle colonne dei clienti
         DM1.SalvaGriglieDevExpress(GridSpese, Vista, False);
      end;
end;

procedure TRappGiornForm.Selezionavista1Click(Sender: TObject);
var
   CurrGrid:TcxGrid;
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
   if cxPageControl1.ActivePage = TabDipendenti      then CurrGrid := GridOre
   else if cxPageControl1.ActivePage = TabAltriCosti then CurrGrid := GridSpese;
   // Carica la vista attuale
   DM1.RipristinaDevExpress(CurrGrid, CurrItemCaption, False);
end;

procedure TRappGiornForm.Ripristinacolonneeliminate1Click(Sender: TObject);
begin
   if cxPageControl1.ActivePage = TabDipendenti      then tvOre.Controller.Customization := True
   else if cxPageControl1.ActivePage = TabAltriCosti then tvSpese.Controller.Customization := True;
end;

procedure TRappGiornForm.MenuElenchiPopup(Sender: TObject);
var
   SearchRec:TSearchRec;
   TmpStr:String;
   CurrGrid:TcxGrid;
   CurrMenuItem:TMenuItem;
begin
   // Abilita disabilita le varie voci di menù
   Duplicarigo1.Enabled := RxSpeedModifica.Down;

   // ==========================================================================
   // Caricamento delle viste delle griglia attualmente visualizzata
   // --------------------------------------------------------------------------
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   if cxPageControl1.ActivePage = TabDipendenti       then CurrGrid := GridOre
   else if cxPageControl1.ActivePage = TabAltriCosti  then CurrGrid := GridSpese
   else begin
     // Rende invisibili le voci corrispondenti alle viste
     Selezionavista1.Visible              := False;
     Salvaimpostazionicolonne1.Visible    := False;
     Ripristinacolonneeliminate1.Visible  := False;
   end;
   // Rende visibili le voci corrispondenti alle viste
   Selezionavista1.Visible              := True;
   Salvaimpostazionicolonne1.Visible    := True;
   Ripristinacolonneeliminate1.Visible  := True;
   // Svuota l'elenco delle viste
   Selezionavista1.Clear;
   // Aggiunge la voce di selezione di nessuna vista
   CurrMenuItem := TMenuItem.Create(Self);
   CurrMenuItem.Caption := 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)';
   CurrMenuItem.Name := 'NessunaVista';
   CurrMenuItem.OnClick := Selezionavista1Click;
   Selezionavista1.Add(CurrMenuItem);
   // Prima di tutto controlla che la cartella esista
   if DirectoryExists(DM1.ImpGridsDir) then begin
      // Poi cerca il primo file
      if FindFirst(DM1.ImpGridsDir + CurrGrid.Name + '___*.ini', faAnyFile, SearchRec) = 0 then begin
         // Se lo trova inserisce il nome della vista nell'elenco
         TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name)-Length(CurrGrid.Name)-3);
         CurrMenuItem := TMenuItem.Create(Self);
         CurrMenuItem.Caption := LeftStr(TmpStr, Length(TmpStr)-4);
         CurrMenuItem.OnClick := Selezionavista1Click;
         Selezionavista1.Add(CurrMenuItem);
         // Trova anche gli eventuali altri files dello stesso tipo
         while (FindNext(SearchRec) = 0) do begin
            // Se lo trova inserisce il nome della vista nell'elenco
            TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name)-Length(CurrGrid.Name)-3);
            CurrMenuItem := TMenuItem.Create(Self);
            CurrMenuItem.Caption := LeftStr(TmpStr, Length(TmpStr)-4);
            CurrMenuItem.OnClick := Selezionavista1Click;
            Selezionavista1.Add(CurrMenuItem);
         end;
      end;
      // Distrugge SearchRec
      FindClose(SearchRec);
   end;
   // ==========================================================================
end;

procedure TRappGiornForm.tvOreSOTTOCANTIERE1PropertiesInitPopup(
  Sender: TObject);
var
  Q: TIBOQuery;
begin
  inherited;
  // Carica l'elenco dei sottocantieri
  with (Sender as TcxComboBox) do begin
    // Decide quale query utilizzare
    Q := QSTC1;
    // Elimina le voci esistenti
    Properties.Items.Clear;
    // Imposta la query
    if Q.Active then Q.Close;
    if not Q.Prepared then Q.Prepare;
    Q.ParamByName('P_CODICE_CANTIERE').AsInteger      := tvOre.DataController.Values[tvOre.DataController.FocusedRecordIndex, tvOreCODCANTIERE.Index];
    Q.ParamByName('P_DATA_APERTURA_CANTIERE').AsDate  := tvOre.DataController.Values[tvOre.DataController.FocusedRecordIndex, tvOreDATACANTIERE.Index];
    Q.Open;
    try
      while not Q.Eof do begin
        Properties.Items.Add(Q.Fields[0].AsString);
        Q.Next;
      end;
    finally
      Q.Close;
    end;
  end;
end;

procedure TRappGiornForm.tvSpeseSOTTOCANTIERE1PropertiesInitPopup(
  Sender: TObject);
var
  Q: TIBOQuery;
begin
  inherited;
  // Carica l'elenco dei sottocantieri
  with (Sender as TcxComboBox) do begin
    // Decide quale query utilizzare
    Q := QSTC1;
    // Elimina le voci esistenti
    Properties.Items.Clear;
    // Imposta la query
    if Q.Active then Q.Close;
    if not Q.Prepared then Q.Prepare;
    Q.ParamByName('P_CODICE_CANTIERE').AsInteger      := tvSpese.DataController.Values[tvSpese.DataController.FocusedRecordIndex, tvSpeseCODCANTIERE.Index];
    Q.ParamByName('P_DATA_APERTURA_CANTIERE').AsDate  := tvSpese.DataController.Values[tvSpese.DataController.FocusedRecordIndex, tvSpeseDATACANTIERE.Index];
    Q.Open;
    try
      while not Q.Eof do begin
        Properties.Items.Add(Q.Fields[0].AsString);
        Q.Next;
      end;
    finally
      Q.Close;
    end;
  end;
end;

procedure TRappGiornForm.tvOreSOTTOCANTIERE2PropertiesInitPopup(
  Sender: TObject);
var
  Q: TIBOQuery;
begin
  inherited;
  // Carica l'elenco dei sottocantieri
  with (Sender as TcxComboBox) do begin
    // Decide quale query utilizzare
    Q := QSTC2;
    // Elimina le voci esistenti
    Properties.Items.Clear;
    // Imposta la query
    if Q.Active then Q.Close;
    if not Q.Prepared then Q.Prepare;
    Q.ParamByName('P_CODICE_CANTIERE').AsInteger      := tvOre.DataController.Values[tvOre.DataController.FocusedRecordIndex, tvOreCODCANTIERE.Index];
    Q.ParamByName('P_DATA_APERTURA_CANTIERE').AsDate  := tvOre.DataController.Values[tvOre.DataController.FocusedRecordIndex, tvOreDATACANTIERE.Index];
    Q.Open;
    try
      while not Q.Eof do begin
        Properties.Items.Add(Q.Fields[0].AsString);
        Q.Next;
      end;
    finally
      Q.Close;
    end;
  end;

end;

procedure TRappGiornForm.tvOreSOTTOCANTIERE3PropertiesInitPopup(
  Sender: TObject);
var
  Q: TIBOQuery;
begin
  inherited;
  // Carica l'elenco dei sottocantieri
  with (Sender as TcxComboBox) do begin
    // Decide quale query utilizzare
    Q := QSTC3;
    // Elimina le voci esistenti
    Properties.Items.Clear;
    // Imposta la query
    if Q.Active then Q.Close;
    if not Q.Prepared then Q.Prepare;
    Q.ParamByName('P_CODICE_CANTIERE').AsInteger      := tvOre.DataController.Values[tvOre.DataController.FocusedRecordIndex, tvOreCODCANTIERE.Index];
    Q.ParamByName('P_DATA_APERTURA_CANTIERE').AsDate  := tvOre.DataController.Values[tvOre.DataController.FocusedRecordIndex, tvOreDATACANTIERE.Index];
    Q.Open;
    try
      while not Q.Eof do begin
        Properties.Items.Add(Q.Fields[0].AsString);
        Q.Next;
      end;
    finally
      Q.Close;
    end;
  end;
end;

procedure TRappGiornForm.tvSpeseSOTTOCANTIERE2PropertiesInitPopup(
  Sender: TObject);
var
  Q: TIBOQuery;
begin
  inherited;
  // Carica l'elenco dei sottocantieri
  with (Sender as TcxComboBox) do begin
    // Decide quale query utilizzare
    Q := QSTC2;
    // Elimina le voci esistenti
    Properties.Items.Clear;
    // Imposta la query
    if Q.Active then Q.Close;
    if not Q.Prepared then Q.Prepare;
    Q.ParamByName('P_CODICE_CANTIERE').AsInteger      := tvSpese.DataController.Values[tvSpese.DataController.FocusedRecordIndex, tvSpeseCODCANTIERE.Index];
    Q.ParamByName('P_DATA_APERTURA_CANTIERE').AsDate  := tvSpese.DataController.Values[tvSpese.DataController.FocusedRecordIndex, tvSpeseDATACANTIERE.Index];
    Q.Open;
    try
      while not Q.Eof do begin
        Properties.Items.Add(Q.Fields[0].AsString);
        Q.Next;
      end;
    finally
      Q.Close;
    end;
  end;
end;

procedure TRappGiornForm.tvSpeseSOTTOCANTIERE3PropertiesInitPopup(
  Sender: TObject);
var
  Q: TIBOQuery;
begin
  inherited;
  // Carica l'elenco dei sottocantieri
  with (Sender as TcxComboBox) do begin
    // Decide quale query utilizzare
    Q := QSTC3;
    // Elimina le voci esistenti
    Properties.Items.Clear;
    // Imposta la query
    if Q.Active then Q.Close;
    if not Q.Prepared then Q.Prepare;
    Q.ParamByName('P_CODICE_CANTIERE').AsInteger      := tvSpese.DataController.Values[tvSpese.DataController.FocusedRecordIndex, tvSpeseCODCANTIERE.Index];
    Q.ParamByName('P_DATA_APERTURA_CANTIERE').AsDate  := tvSpese.DataController.Values[tvSpese.DataController.FocusedRecordIndex, tvSpeseDATACANTIERE.Index];
    Q.Open;
    try
      while not Q.Eof do begin
        Properties.Items.Add(Q.Fields[0].AsString);
        Q.Next;
      end;
    finally
      Q.Close;
    end;
  end;
end;

procedure TRappGiornForm.cxDBComboBox1PropertiesInitPopup(Sender: TObject);
var
   Qry:TIB_Cursor;
begin
  inherited;
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

procedure TRappGiornForm.BitBtnPratica1Click(Sender: TObject);
begin
  inherited;
  DM1.SelezionaCantiereImpianto(QryRGPratica,
                                QryRGDataPratica1,
                                nil,
                                QryRGCODICECLIENTE,
                                QryRGCODICECLIENTE.Value);
end;

procedure TRappGiornForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
  inherited;
   DM1.VisualizzaCliente(QryRGCodiceCliente.Value);
end;

procedure TRappGiornForm.BitBtnClienteClick(Sender: TObject);
begin
  inherited;
   DM1.SelezionaCliente(QryRGCodiceCliente, QryRGPRATICA, QryRGDATAPRATICA1, '');
end;

procedure TRappGiornForm.QryRGPRATICAChange(Sender: TField);
begin
  inherited;
  if (not QryRGPRATICA.IsNull)  and (not QryRGDATAPRATICA1.IsNull) then BEGIN
    // Carica la descrizione delle pratiche
    DM1.CaricaDescrizionePratica(QryRGPRATICA.Value,  QryRGDATAPRATICA1.Value, EditDescrizionePratica1);
    // Carica gli agenti
    DM1.SetAgenti(QryRG, 'CODICECLIENTE', 'PRATICA', 'DATAPRATICA1');
  end;
end;

procedure TRappGiornForm.QryRGCODICECLIENTEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
  inherited;
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia, PartitaIVA, CodiceFiscale');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + QryRGCodiceCliente.AsString);
      QryCli.Open;
      // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
      if not QryCli.Eof then begin
          QryRGRagSocCli.Value          := QryCli.FieldByName('RagioneSociale').AsString;
          QryRGIndirizzoCli.Value       := QryCli.FieldByName('Indirizzo').AsString;
          QryRGNumCivicoCli.Value       := QryCli.FieldByName('NumCivico').AsString;
          QryRGCittaCli.Value           := QryCli.FieldByName('Citta').AsString;
          QryRGCAPCli.Value             := QryCli.FieldByName('CAP').AsString;
          QryRGProvinciaCli.Value       := QryCli.FieldByName('Provincia').AsString;
          QryRGPartitaIVACli.Value      := QryCli.FieldByName('PartitaIVA').AsString;
          QryRGCodiceFiscaleCli.Value   := QryCli.FieldByName('CodiceFIscale').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
   // Carica gli agenti
   DM1.SetAgenti(QryRG, 'CODICECLIENTE', 'PRATICA', 'DATAPRATICA1');
end;

procedure TRappGiornForm.EditDescrizionePratica1Change(Sender: TObject);
begin
  inherited;
  if QryRGPRATICA.AsInteger > 0 then begin
    DbeDescrizioneCantiere.Text := QryRGPRATICA.AsString + ' - ' + QryRGDATAPRATICA1.AsString + ' - ' + EditDescrizionePratica1.Text;
  end else begin
    DbeDescrizioneCantiere.Text := '- - -';
  end;
end;

procedure TRappGiornForm.QryRGBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Memorizza la versione del programma
  QryRGVERSIONE.AsInteger := MainForm.PrgVersion;
end;

procedure TRappGiornForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
   // Richiama la selezione dello stato del documento
   DM1.SelezionaStato('Rapp.giorn.', QryRG, 0);
end;

procedure TRappGiornForm.tvOreOPERAINDEXGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  AText := RightStr(AText, 1);  // IN questo modo funziona anche quando la colonna è raggruppata
  if AText = '' then Exit;
  AText := AText  + ' - ' + DM1.Manodopera[StrToInt(AText)].Descrizione;
  // NB: Mette tre spazio all'inizio perchè altrimenti non mi visualizza il numero iniziale
  //      praticamente è come se si mangiasse il primo carattere solo quando la colonna
  //      è raggruppata.
  if tvOreOPERAINDEX.GroupIndex <> -1 then AText := '   ' + AText;
end;

procedure TRappGiornForm.DbeAzioneCantierePropertiesChange(
  Sender: TObject);
begin
  inherited;
  QryRGSEGNOOPERAZIONECANTIERE.OnChange := nil;
  try
    with (Sender as TcxComboBox) do begin
      if      Text = 'Carico' then QryRGSEGNOOPERAZIONECANTIERE.Value := '+'
      else if Text = 'Scarico' then QryRGSEGNOOPERAZIONECANTIERE.Value := '-'
      else if Text = 'Commessa' then QryRGSEGNOOPERAZIONECANTIERE.Value := 'C'
      else if Text = 'Montaggio' then QryRGSEGNOOPERAZIONECANTIERE.Value := 'M'
      else if Text = 'Fattura' then QryRGSEGNOOPERAZIONECANTIERE.Value := 'F'
      else QryRGSEGNOOPERAZIONECANTIERE.Value := '=';

      DbeAzioneCantiere.Text := Text;
      if BeforeNewDocForm <> nil then BeforeNewDocForm.DbeAzioneCantiere.Text := Text;
    end;
  finally
    QryRGSEGNOOPERAZIONECANTIERE.OnChange := QryRGSEGNOOPERAZIONECANTIEREChange;
  end;
end;

procedure TRappGiornForm.DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
begin
  if RxSpeedModifica.Down
  and (  (Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)  )
  then
    DM2.ClearCantiereDoc(QryRGPRATICA, QryRGDATAPRATICA1, DbeDescrizioneCantiere);
end;

procedure TRappGiornForm.DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TRappGiornForm.Deselezionacantiereimpianto1Click(Sender: TObject);
begin
  inherited;
  if RxSpeedModifica.Down then
    DM2.ClearCantiereDoc(QryRGPratica, QryRGDataPratica1, DbeDescrizioneCantiere)
  else
    DM1.Messaggi('Levante', 'Il documento deve essere in modalità di modifica', '', [mbOk], 0, nil);
end;

procedure TRappGiornForm.QryRGSEGNOOPERAZIONECANTIEREChange(
  Sender: TField);
begin
  inherited;
  DbeAzioneCantiere.Properties.OnChange := nil;
  try
    if      Sender.AsString = '+' then DbeAzioneCantiere.Text := 'Carico'
    else if Sender.AsString = '-' then DbeAzioneCantiere.Text := 'Scarico'
    else if Sender.AsString = 'C' then DbeAzioneCantiere.Text := 'Commessa'
    else if Sender.AsString = 'M' then DbeAzioneCantiere.Text := 'Montaggio'
    else if Sender.AsString = 'F' then DbeAzioneCantiere.Text := 'Fattura'
    else if Sender.AsString = '=' then DbeAzioneCantiere.Text := '- - -'
    else DbeAzioneCantiere.Text := '- - -';
    if BeforeNewDocForm <> nil then BeforeNewDocForm.DbeAzioneCantiere.Text := DbeAzioneCantiere.Text;
  finally
    DbeAzioneCantiere.Properties.OnChange := DbeAzioneCantierePropertiesChange;
  end;
end;

procedure TRappGiornForm.FormCreate(Sender: TObject);
begin
  inherited;
  CaricaTitoli;
end;

procedure TRappGiornForm.Duplicarigo1Click(Sender: TObject);
var
  i, ii: Integer;
  FocusedRI, NewRI, CurrentRI: Integer;
  TV: TcxGridTableView;
  DC: TcxGridDataController;
  CurrCol: TcxGridColumn;
begin
  inherited;
  // Solo se è in modifica
  if not RxSpeedModifica.Down then Exit;
  // In base alla pagina selezionata abilita la funzione sulla griglia corretta
  if      cxPageControl1.ActivePage = TabDipendenti then TV := tvOre
  else if cxPageControl1.ActivePage = TabAltriCosti then TV := tvSpese
  else Exit;
  // Inizializzazione
  DC := TV.DataController;
  FocusedRI := DC.FocusedRecordIndex;
  // Disabilita l'agiornamento dello schermo
  TV.BeginUpdate;
  try

    // CIcla per tutti i record selezionati al momento
    for i := 0 to TV.Controller.SelectedRecordCount -1 do begin
      // Determina l'indice del record che si sta duplicando
      CurrentRI := TV.Controller.SelectedRecords[i].RecordIndex;
      // Crea il nuovo record e ne determina l'indice
      NewRI := DC.AppendRecord;
      // Copia tutti i campi duplicandolo
      for ii := 0 to TV.ColumnCount -1 do begin
        // CurrColumn punta alla colonna in elaborazione
        CurrCol := TV.Columns[ii];
        // Salta le colonne relative ai GUID
        if (Pos('GUID', CurrCol.Name) = 0) then begin
          // Copia il valore della colonna corrente
          DC.Values[NewRI,CurrCol.Index] := TV.Controller.SelectedRecords[i].Values[CurrCol.Index];
        end;
      end;
    end;

  finally
    // Disabilita l'agiornamento dello schermo
    TV.EndUpdate;
  end;
end;

procedure TRappGiornForm.tvOreEditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  // ===========================================================================
  // DUPLICAZIONE RIGO (CTRL+D)
  // ---------------------------------------------------------------------------
  if (Key = 68) and  (ssCtrl in Shift) then begin
    Duplicarigo1Click(Duplicarigo1);
  end;
  // ===========================================================================
end;



procedure TRappGiornForm.CaricaItemsTipiRighi;
var
  Qry: TIB_Cursor;
  i, CurrLev, PrecLev:Integer;
  CMP1, CMP2:TcxComboBoxProperties;
begin
  // Inizializzazione
  PrecLev := 0;
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta la query che ricaverà l'elenco dei tipi di rigo disponibili
    Qry.SQL.Add('SELECT DESCRIZIONE, LIVELLO FROM TIPIRIGHI WHERE ABILITATO <> ''F'' ORDER BY LIVELLO, DESCRIZIONE');
    Qry.Open;
    // Carica il livello del record prima di entrare nel ciclo
    CurrLev := Qry.FieldByName('LIVELLO').AsInteger;
    while (not Qry.Eof) do begin
      // Se il livello del record attuale è diverso dal livelo del record precedente
      //  imposta i riferimenti ai controlli del livello corretto e azzera
      //  le combobox
      if CurrLev <> PrecLev then begin
        // Trova le colonne giuste
        CMP1 := tvOre.FindItemByName('tvOreTIPO' + IntToStr(CurrLev)).Properties as TcxComboBoxProperties;
        CMP2 := tvSpese.FindItemByName('tvSpeseTIPO' + IntToStr(CurrLev)).Properties as TcxComboBoxProperties;
        // svuota le proprietà Items de combo box
        CMP1.Items.Clear;
        CMP2.Items.Clear;
        // Inserisce la possibilità di togliere il dato
        CMP1.Items.Add('');
        CMP2.Items.Add('');
        // Aggiorna la variabile che contiene il riferimento all'ultimo livello caricato
        PrecLev := CurrLev;
      end;
      // Carica il Tipo Rigo attuale
      CMP1.Items.Add(Trim(Qry.FieldByName('DESCRIZIONE').AsString));
      CMP2.Items.Add(Trim(Qry.FieldByName('DESCRIZIONE').AsString));
      // Avanti il prossimo record
      Qry.Next;
      // Carica il livello del prossimo record
      if not Qry.Eof then CurrLev := Qry.FieldByName('LIVELLO').AsInteger;
    end;
    // Chiude la query
    Qry.Close;
  finally
    Qry.Free;
  end;
end;



procedure TRappGiornForm.dbeAgentePropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente.Properties.Items, 1, '');
end;

procedure TRappGiornForm.dbeAgente2PropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente2.Properties.Items, 2, dbeAgente.Text);
end;

procedure TRappGiornForm.dbeAgente3PropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente3.Properties.Items, 3, dbeAgente2.Text);
end;

procedure TRappGiornForm.dbeAgente4PropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente4.Properties.Items, 4, dbeAgente3.Text);
end;

procedure TRappGiornForm.dbeAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryRG.State = dsEdit) or (QryRG.State = dsInsert) then DM1.AgenteChanged(1, dbeAgente2);
end;

procedure TRappGiornForm.dbeAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryRG.State = dsEdit) or (QryRG.State = dsInsert) then DM1.AgenteChanged(2, dbeAgente3);
end;

procedure TRappGiornForm.dbeAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryRG.State = dsEdit) or (QryRG.State = dsInsert) then DM1.AgenteChanged(3, dbeAgente4);
end;

end.
