unit FormTabResOrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPerTabPageControlPrincipale, cxGraphics, 
  cxCustomData, cxEdit, DB, cxDBData,
  cxTextEdit, cxCurrencyEdit, cxClasses, cxCustomPivotGrid, 
  StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxControls,
  cxGridCustomView, cxGrid, cxPC, cxContainer,
  cxMaskEdit, cxDropDownEdit, CheckLst, MAURI_SB, Buttons, ExtCtrls,
  DBClient, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, ZLIBArchive, IdFTPCommon, 
  cxCalendar, dxPSGlbl, dxPSUtl, dxBkgnd,
  dxWrap, dxPrnDev, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, dxPScxCommon, Menus, cxStyles, cxFilter,
  cxData, cxDataStorage, dxPSEngn, dxPrnPg, dxPSCompsProvider, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers,
  IdExplicitTLSClientServerBase, dxDateRanges, dxScrollbarAnnotations;

type
  TTagResOrdForm = class(TModelPerTabPageControlPrincipaleForm)
    PanelResOrd: TPanel;
    PanelFiltri: TPanel;
    Panel20: TPanel;
    SBCollapseGroups: TSpeedButton;
    SBExpandGroups: TSpeedButton;
    SourceResOrd: TDataSource;
    IdFTP1: TIdFTP;
    ZLB1: TZLBArchive;
    GridResOrd: TcxGrid;
    btvResOrd: TcxGridDBBandedTableView;
    btvResOrdRAGSOC: TcxGridDBBandedColumn;
    btvResOrdNUMDOC: TcxGridDBBandedColumn;
    btvResOrdDATADOC: TcxGridDBBandedColumn;
    btvResOrdCODICEARTICOLO: TcxGridDBBandedColumn;
    btvResOrdDESCRIZIONE: TcxGridDBBandedColumn;
    btvResOrdUM: TcxGridDBBandedColumn;
    btvResOrdQTA: TcxGridDBBandedColumn;
    btvResOrdPREZZUUNITARIO: TcxGridDBBandedColumn;
    btvResOrdSCONTORIGO1: TcxGridDBBandedColumn;
    btvResOrdSCONTORIGO2: TcxGridDBBandedColumn;
    btvResOrdSCONTORIGO3: TcxGridDBBandedColumn;
    btvResOrdIMPORTORIGO: TcxGridDBBandedColumn;
    btvResOrdDATACONSEGNA: TcxGridDBBandedColumn;
    btvResOrdPROGRIGO: TcxGridDBBandedColumn;
    lvResOrd: TcxGridLevel;
    SubPanelFiltri: TPanel;
    SBFilterOpenClose: TSpeedButtonRollOver;
    StaticText79: TStaticText;
    FilterTrova: TEdit;
    CdsResOrd: TClientDataSet;
    CdsResOrdNUMDOC: TIntegerField;
    CdsResOrdDATADOC: TDateField;
    CdsResOrdPROGRIGO: TIntegerField;
    CdsResOrdRAGSOC: TStringField;
    CdsResOrdCODICEARTICOLO: TStringField;
    CdsResOrdDESCRIZIONE: TStringField;
    CdsResOrdUM: TStringField;
    CdsResOrdQTA: TFloatField;
    CdsResOrdPREZZUUNITARIO: TFloatField;
    CdsResOrdSCONTORIGO1: TFloatField;
    CdsResOrdSCONTORIGO2: TFloatField;
    CdsResOrdSCONTORIGO3: TFloatField;
    CdsResOrdIMPORTORIGO: TFloatField;
    CdsResOrdDATACONSEGNA: TDateField;
    CdsResOrdQTAEASA: TFloatField;
    CdsResOrdGIACENZA: TFloatField;
    CdsResOrdRIFERIMENTO: TStringField;
    CdsResOrdOPERATORE: TStringField;
    CdsResOrdCODDESTMERCE: TStringField;
    CdsResOrdRAGSOCMERCE1: TStringField;
    CdsResOrdRAGSOCMERCE2: TStringField;
    CdsResOrdINDIRIZZOMERCE: TStringField;
    CdsResOrdCAPMERCE: TStringField;
    CdsResOrdLOCALITAMERCE: TStringField;
    CdsResOrdPROVINCIAMERCE: TStringField;
    CdsResOrdRESIDUO: TFloatField;
    btvResOrdQTAEASA: TcxGridDBBandedColumn;
    btvResOrdGIACENZA: TcxGridDBBandedColumn;
    btvResOrdRIFERIMENTO: TcxGridDBBandedColumn;
    btvResOrdOPERATORE: TcxGridDBBandedColumn;
    btvResOrdCODDESTMERCE: TcxGridDBBandedColumn;
    btvResOrdRAGSOCMERCE1: TcxGridDBBandedColumn;
    btvResOrdRAGSOCMERCE2: TcxGridDBBandedColumn;
    btvResOrdINDIRIZZOMERCE: TcxGridDBBandedColumn;
    btvResOrdCAPMERCE: TcxGridDBBandedColumn;
    btvResOrdLOCALITAMERCE: TcxGridDBBandedColumn;
    btvResOrdPROVINCIAMERCE: TcxGridDBBandedColumn;
    btvResOrdRESIDUO: TcxGridDBBandedColumn;
    CdsResOrdDISPONIBILE: TBooleanField;
    btvResOrdDISPONIBILE: TcxGridDBBandedColumn;
    CdsDocDisp: TClientDataSet;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    DateField2: TDateField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField9: TFloatField;
    BooleanField1: TBooleanField;
    CdsResOrdDOCDISP: TBooleanField;
    btvResOrdDOCDISP: TcxGridDBBandedColumn;
    CdsResOrdFORGROUP: TStringField;
    btvResOrdFORGROUP: TcxGridDBBandedColumn;
    ShapeDocDisp: TShape;
    ShapeDocNonDisp: TShape;
    LabelFontDisp: TLabel;
    LabelFontNonDisp: TLabel;
    LabelFontDisabled: TLabel;
    StaticText19: TStaticText;
    FilterCodice: TEdit;
    StaticText18: TStaticText;
    FilterDescrizione: TEdit;
    StaticText1: TStaticText;
    FilterRiferimento: TEdit;
    StaticText2: TStaticText;
    FilterNumDoc: TEdit;
    StaticText4: TStaticText;
    FilterDestinazione: TcxComboBox;
    StaticText3: TStaticText;
    FilterOperatore: TcxComboBox;
    LabelResOrd: TLabel;
    dxPrinter: TdxComponentPrinter;
    GridResOrdLink: TdxGridReportLink;
    PopupMenu1: TPopupMenu;
    Scaricalultimoaggiornamentodelresiduoordini1: TMenuItem;
    N1: TMenuItem;
    Selezionavista1: TMenuItem;
    Salvaimpostazionicolonne1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SBFilterOpenCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure FormShow(Sender: TObject);
    procedure btvResOrdCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btvResOrdCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvResOrdCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure btvResOrdNUMDOCGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure PanelFiltriResize(Sender: TObject);
    procedure SBCollapseGroupsClick(Sender: TObject);
    procedure SBExpandGroupsClick(Sender: TObject);
    procedure btvResOrdCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure CdsDocDispCalcFields(DataSet: TDataSet);
    procedure CdsResOrdCalcFields(DataSet: TDataSet);
    procedure btvResOrdQTAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvResOrdRESIDUOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FilterTrovaKeyPress(Sender: TObject; var Key: Char);
    procedure GridResOrdLinkCustomDrawCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AColumn: TcxGridColumn;
      AnItem: TAbstractdxReportCellData; var ADone: Boolean);
    procedure GridResOrdLinkCustomDrawHeaderCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridTableView; AColumn: TcxGridColumn;
      AnItem: TdxReportCellString; var ADone: Boolean);
    procedure GridResOrdLinkCustomDrawBandCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridBandedTableView; ABand: TcxGridBand;
      AnItem: TdxReportCellString; var ADone: Boolean);
    procedure dxPrinterCustomDrawPageHeader(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure dxPrinterCustomDrawPageFooter(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure Scaricalultimoaggiornamentodelresiduoordini1Click(
      Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Salvaimpostazionicolonne1Click(Sender: TObject);
  private
    fDataOraResOrdVisualizzato: TDateTime;
    procedure DownloadFileResOrd;
    procedure CaricaDatiFileResiduoOrdini(var NF:String; var TipoDoc:String; var FileDst:String; var FileMittRagSoc:String; var FileFil:String);
    procedure CaricaItemsDestinazione;
    procedure CaricaItemsOperatore;
    procedure ScaricaResiduoOrdini;
    { Private declarations }
  public
    { Public declarations }
    // Alcune variabili dove salvare i valori originali di alcune proprietà prima della stampa
    //  e da ripristinare poi alla fine della stampa stessa
    PrecGroupColor: TColor;
    // Override
    procedure TrovaButtonClick(Sender: TObject); override;
    procedure ResetQueryButtonClick(Sender: TObject); override;
  end;

var
  TagResOrdForm: TTagResOrdForm;

implementation

uses DataModule1, DataModuleStyles, main, StrUtils, SchedaClienti, Types;

{$R *.dfm}

// Procedura che scarica il file dal server FTP, e lo decomprime
procedure TTagResOrdForm.DownloadFileResOrd;
var
  Local_PIVA, Local_PID: String;
  RemoteFileName, CompressedFileName, FullPathCompressedFileName, FinalFileName, FullPathFinalFileName: String;
  LS: TStringList;       // StringList di appoggio dove sarà caricata la lista dei files esistenti nella directory remota
  i: Integer;
  TipoDoc, DestDoc, MittRagSocDoc, FilialeDoc: String;
begin
  // Crea la StringList che conterrà l'elenco dei files contenuti nella directory remota
  LS := TStringList.Create;
  // Calcola alcuni nomi di files
  CompressedFileName := 'CompressedResOrd.RSO';
  FullPathCompressedFileName := Dm1.DownloadDir + CompressedFileName;
  FinalFileName := 'ResOrd.XML';
  FullPathFinalFileName := DM1.DownloadDir + FinalFileName;
  // Imposta subito il nome del file nel ClientDataSet
  CdsResOrd.FileName := FullPathFinalFileName;
  CdsDocDisp.FileName := FullPathFinalFileName;
  // In base alla modalità carica i dati di identificazione appropriati
  if MainForm.IsLevanteLight then begin
    Local_PIVA := Trim(MainForm.StartFrame.EditPIVA.Text);
    Local_PID  := Trim(MainForm.StartFrame.EditPID.Text);
  end else begin
    Local_PIVA := Trim(DM1.TableDatiAziendaP_IVA.AsString);
    Local_PID  := Trim(DM1.TableDatiAziendaCA_PID.AsString);
  end;
  // Se il codice di attivazione non è valido esce subito
  if not DM1.VerificaCodiceAttivazioneTeletrasporto then begin
    raise Exception.Create('CODICE DI ATTIVAZIONE NON VALIDO !!!'#13#13'Chiamare il centro servizi.');
  end;
  // Se il PID = PROVA significa che siamo in una sessione di PROVA
  //  e quindi si connette alla cartella di prova
  if Uppercase(Local_PID) = 'PROVA' then begin
    IdFTP1.Username := 'testlevante';
  end else begin
    IdFTP1.Username := 'trasferimento';
  end;
  // Se il codice utente per il sistema di interscambio dei documento è '' chiude
  //  tutto perchè un codice valido deve esserci per forza, ovviamente
  if Local_PIVA = '' then begin
    // Solleva un'eccezione
    raise Exception.Create('Codice globale azienda non valido');
  end;

  try
    // Si connette al circuito
    DM1.ShowWait('Levante', 'Connessione al server...');
    IdFTP1.Connect;
    // Imposta il tipo trasferimento dei dati ASCII
    IdFTP1.TransferType := ftASCII;
    // Carica su LS la lista dei files contenuti nella directory remota
    DM1.ShowWait('Levante', 'Richiesta lista files...' + '*.RSO');
    LS.Clear;
    IdFTP1.List(LS, '-TYP-RESORD*.RSO', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
    DM1.ShowWait('Levante', 'Analisi files ricevuti...' + '*.RSO');
    // Cicla per tutti i files trovati...
    for i := 0 to LS.Count -1 do begin
      // Carica sulla variabile il nome del file remoto
      RemoteFileName := LS[i];
      // Carica alcuni dati contenuti nel nome del file in alcune variabili locali per comodità e
      //  per verificare se si tratta del file da visualizzare oppure no
      CaricaDatiFileResiduoOrdini(RemoteFileName, TipoDoc, DestDoc, MittRagSocDoc, FilialeDoc);
      DM1.ShowWait('Levante', 'Verifica file: "' + RemoteFileName + '"');
      // Se il file è veramente destinato a noi e proviene dalla filiale impostata nel PID...
      //  NB: IN realtà non controlla la provenienza da una certa filiale e quindi non controlla il
      //       PID, questo perchè tanto il residuo ordini è già destinato in base alla partita IVA
      //       inoltre, almeno al momento il caronte non esporta il PID o meglio come PID esporta
      //       sempre "NC".
      if (TipoDoc = 'RESORD') and (DestDoc = Local_PIVA) then begin
        // Esegue il Download del file del documento dal server
        DM1.ShowWait('Levante', 'Download file: "' + RemoteFileName + '"');
        IdFTP1.TransferType := ftBinary;
        IdFTP1.Get(RemoteFileName, FullPathCompressedFileName, True);
        // Decompressione file
        DM1.ShowWait('Levante', 'Decompressione file:  "' + CompressedFileName + '"');
        ZLB1.OpenArchive(FullPathCompressedFileName);
        DM1.ShowWait('Levante', 'Extract file  "' + FinalFileName + '"');
        ZLB1.ExtractFileByName(DM1.DownloadDir, FinalFileName);
        // Chiusura file compresso
        DM1.ShowWait('Levante', 'Chiusura archivio compresso...');
        ZLB1.CloseArchive;
        // Esce dal ciclo perchè ne deve caricare solo uno
        Break;
      end;
    end;
  finally
    DM1.CloseWait;
    LS.Free;
    // SI disconnette dal server FTP
    if IdFTP1.Connected then IdFTP1.Disconnect;
  end;
end;

// Questa procedura carica nella variabili passate come parametro i dati
//  del file residuo ordini
procedure TTagResOrdForm.CaricaDatiFileResiduoOrdini(var NF:String; var TipoDoc:String; var FileDst:String; var FileMittRagSoc:String; var FileFil:String);
var
  TmpNomeFile: String;
begin
   // Inizializzazione
   TmpNomeFile := NF;
   // Prima di tutto elimina la prima parte del nome file, la prima parte infatti
   // contiene i permessi la data di creazione del file e altri dati che non
   //  mi interessano, wuindi elimina tutto quello che c'è prima del TAG "-TDC-"
   DM1.RitornaTestoPrimaDi('-TYP-', TmpNomeFile, True);
   // Rimette a posto il "-" che il RitornaTestoPrimaDi gli ha tolto altrimenti
   //  ci potrebbero essere dei problemi successivamente.
   TmpNomeFile := '-'+TmpNomeFile;
   // Nome completo del file così come è, lo ritorna al chiamante per dargli il nome file pulito
   NF := TmpNomeFile;
   // Toglie il primo marcatore (i primi 4 caratteri contenenti "-TDC-")
   TmpNomeFile := RightStr(TmpNomeFile, Length(TmpNomeFile)-5);
   // Carica tutti gli altri dati eliminando ogni volta il restante marcatore all'inizio
   //  della stringa (cioè i primi 4 caratteri) perchè con il parametro True (l'ultimo)
   //  elimina solo il primo rigo e non tutta la stringa ricercata.
   TipoDoc              := DM1.RitornaTestoPrimaDi('-DST-', TmpNomeFile, True);
   TmpNomeFile          := RightStr(TmpNomeFile, Length(TmpNomeFile)-4);
   FileDst              := DM1.RitornaTestoPrimaDi('-MRS-', TmpNomeFile, True);
   TmpNomeFile          := RightStr(TmpNomeFile, Length(TmpNomeFile)-4);
   FileMittRagSoc       := DM1.RitornaTestoPrimaDi('-FIL-', TmpNomeFile, True);
   TmpNomeFile          := RightStr(TmpNomeFile, Length(TmpNomeFile)-4);
   FileFil              := DM1.RitornaTestoPrimaDi('.RSO', TmpNomeFile, True);
end;

procedure TTagResOrdForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  fDataOraResOrdVisualizzato := StrToDate('01/01/1900');
  // Impostazione componente FTP
  MainForm.CaricaParametriFTP(IdFTP1);

  PanelResOrd.Align := alClient;
  // I filtri devono essere già aperti
  OpenFilterPanel(PanelFiltri, SBFilterOpenClose);
end;

procedure TTagResOrdForm.SBFilterOpenCloseClick(Sender: TObject);
begin
  inherited;
  if PanelFiltri.Tag = 1
  then CloseFilterPanel(PanelFiltri, SBFilterOpenClose)
  else OpenFilterPanel(PanelFiltri, SBFilterOpenClose);
end;

procedure TTagResOrdForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TagResOrdForm := nil;
end;

procedure TTagResOrdForm.IdFTP1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
  inherited;
   // Aggiorna la stato dell'operazione
   DM1.ShowWait('', AStatusText);
end;




procedure TTagResOrdForm.FormShow(Sender: TObject);
begin
  inherited;
  // Controlla se il residuo ordini attualmente presente nel database (già scaricato
  //  dal teletrasporto) è di oggi oppure no.
  if DM1.ResOrd_CheckIfOld then begin
    // Effettua il download del residuo ordini dal teletrasporto
    ScaricaResiduoOrdini;
    // Chiude i Dataset in modo che scarichi il nuovo Residuo Ordini dal database
    if CdsResOrd.Active   then CdsResOrd.Close;
    if CdsDocDisp.Active  then CdsDocDisp.Close;
  end;

  // Verifica se l'eventuale residuo ordini attualmente visualizzato
  //  è il più recente disponibile nel database (già scaricato dal teletrasporto)
  //  e se non lo è avverte l'utente e gli chiede se vuole aggiornare lo schermo.
  //  NB: Effettua il controllo solo se i Datasets sono attivi e cioè se c'è un residuo
  //       ordini già visualizzato.
  if CdsResOrd.Active and DM1.ResOrd_CheckIfNewestAlreadyDownloaded(fDataOraResOrdVisualizzato) then begin
    // Chiude i Dataset in modo che scarichi il nuovo Residuo Ordini dal database
    if CdsResOrd.Active   then CdsResOrd.Close;
    if CdsDocDisp.Active  then CdsDocDisp.Close;
  end;

  // Caricamento delle impostazioni di visualizzazione delle griglie
  if not MainForm.IsLevanteLight then
    DM1.RipristinaDevExpress(GridResOrd, '', False);

  // Se i Dataset sono chiusi provvede a scaricare dal database il residuo ordini
  // e a visualizzarlo.
  if (not CdsResOrd.Active) then
  begin
    // Si assicura che anche l'altro Dataset sia chiuso
    if CdsDocDisp.Active  then
      CdsDocDisp.Close;
    // Preleva il file del residuo ordini dal database
    fDataOraResOrdVisualizzato := DM1.ResOrd_GetFromDatabase;
    // Verifica
    if fDataOraResOrdVisualizzato = StrToDate('01/01/1900') then
      raise Exception.Create('Errore durante l''apertura del residuo ordini.');
    // Reset dei filtri
    ClientiForm.RxSpeedButtonResetQueryClick(ClientiForm.RxSpeedButtonResetQuery);
    // Apre l'archivio
    ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
  end;

  // In ogni caso imposta la Label che riporta la data del residuo ordini attuale
  LabelResOrd.Caption := ' Residuo ordini del ' + FormatDateTime('dd/mm/yyyy', fDataOraResOrdVisualizzato);

  // Se il ResOrd è vecchio (non di oggi) avverte l'utente
{
  if (fDataOraResOrdVisualizzato < StartOfTheDay(Now)) then begin
    DM1.Messaggi('Levante', 'ATTENZIONE !!!'#13#13'Il residuo ordini visualizzato non è di oggi.', '', [mbOk], 0, nil);
  end;
}
end;

procedure TTagResOrdForm.btvResOrdCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TTagResOrdForm.btvResOrdCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
const
  TOP_MARGIN = 0;
  BOTTOM_MARGIN = 0;
  MID_SEP_MARGIN = 5;
  TEXT_SEP = 8;
  TEXT_INTERLINEA = 15;
var
  R: TRect;
  MidSep:Integer;
  ChildRows: TList;
  GroupIndex: Integer;
  DC: TcxCustomDataController;
  RowIdx: Integer;
  TxtToDraw, TmpStr: String;
  BrushColor, FontColor, LabelFontColor: TColor;
begin
  inherited;
  // Inizializzazione
  ADone := True;
  ACanvas.Font.Name := 'Arial';
  DC := Sender.DataController;
  R := AViewInfo.TextAreaBounds;
  MidSep := R.Right - 350;
  // Crea e carica nella TList i Childs Records del gruppo in modo da poter
  //  accedere a tutti i valori necessari e poi mette il RowIdx del primo rigo trovato
  //  in modo da poter accedere a tuti i suoi dati
  ChildRows := TList.Create;
  try
    GroupIndex := Sender.DataController.Groups.DataGroupIndexByRowIndex[AViewInfo.GridRecord.Index];
    Sender.DataController.Groups.LoadRecordIndexes(ChildRows, GroupIndex);
    RowIdx := integer(ChildRows[0]);
  finally
    ChildRows.Free;
  end;

  // Determinazione dei colori in base alla disponibilità o meno del documento
  if (not VarIsNull(DC.Values[RowIdx,btvResOrdDOCDISP.Index])) and DC.Values[RowIdx,btvResOrdDOCDISP.Index] then begin
    FontColor       := ShapeDocDisp.Pen.Color;
    BrushColor      := ShapeDocDisp.Brush.Color;
    LabelFontColor  := LabelFontDisp.Font.Color;
  end else begin
    FontColor       := ShapeDocNonDisp.Pen.Color;
    BrushColor      := ShapeDocNOnDisp.Brush.Color;
    LabelFontColor  := LabelFontNonDisp.Font.Color;
  end;

  // Disegna il rettangolo di sfondo
  ACanvas.Brush.Color := BrushColor;
  ACanvas.FillRect(AViewInfo.Bounds);

  // ===========================================================================
  //  Visualizza il riferimento al documento
  // ---------------------------------------------------------------------------
  R.Top := R.Top + TOP_MARGIN;
  R.Right := MidSep - MID_SEP_MARGIN;
  // Label "Ordine n°'
  TxtToDraw := 'Ordine n°';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := LabelFontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := 90;
  // Numero documento
  TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdNUMDOC.Index];
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := FontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + TEXT_SEP;
  // Label " del "
  TxtToDraw := 'del';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := LabelFontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + TEXT_SEP;
  // Data documento
  TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdDATADOC.Index];
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := FontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + TEXT_SEP;
  // ===========================================================================

  // ===========================================================================
  //  Visualizza il riferimento cliente
  // ---------------------------------------------------------------------------
  R.Left := AViewInfo.TextAreaBounds.Left;
  R.Top := R.Top + TEXT_INTERLINEA;
  R.Right := MidSep - MID_SEP_MARGIN;
  // Label "Riferimento"
  TxtToDraw := 'Riferimento';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := LabelFontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := 90;
  // Campo riferimento cliente
  TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdRIFERIMENTO.Index];
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Color := FontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + TEXT_SEP;
  // ===========================================================================

  // ===========================================================================
  //  Visualizza l'Operatore
  // ---------------------------------------------------------------------------
  R.Left := AViewInfo.TextAreaBounds.Left;
  R.Top := R.Top + TEXT_INTERLINEA;
  R.Right := MidSep - MID_SEP_MARGIN;
  // Label "Operatore"
  TxtToDraw := 'Operatore';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := LabelFontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := 90;
  // Campo riferimento cliente
  TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdOPERATORE.Index];
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := FontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + TEXT_SEP;
  // ===========================================================================

  // ===========================================================================
  //  Visualizza la Destinazione della Merce
  // ---------------------------------------------------------------------------
  R.Left := MidSep + MID_SEP_MARGIN;
  R.Top := AViewInfo.TextAreaBounds.Top + TOP_MARGIN;
  R.Right := AViewInfo.TextAreaBounds.Right;
  R.Bottom := AViewInfo.TextAreaBounds.Bottom - BOTTOM_MARGIN;
  // Stampa Label "Destinazione"
  TxtToDraw := 'Destinazione';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := LabelFontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + TEXT_SEP;
  // Costruzione della RagSocMerce che è composta in realtà da due campi
  TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdRAGSOCMERCE1.Index] + ' ' + DC.DisplayTexts[RowIdx,btvResOrdRAGSOCMERCE2.Index];
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Color := FontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  R.Top := R.Top + TEXT_INTERLINEA;
  // Campo Indirizzo merce
  TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdINDIRIZZOMERCE.Index];
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := FontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  // CAP + Località + Provincia
  TmpStr := Trim(DC.DisplayTexts[RowIdx,btvResOrdCAPMERCE.Index]);
  if TmpStr <> '' then TxtToDraw := TmpStr + ' - ';
  ACanvas.Font.Color := FontColor;
  TxtToDraw := TxtToDraw + Trim(DC.DisplayTexts[RowIdx,btvResOrdLOCALITAMERCE.Index]);
  TmpStr := Trim(DC.DisplayTexts[RowIdx,btvResOrdPROVINCIAMERCE.Index]);
  if TmpStr <> '' then TxtToDraw := TxtToDraw + ' (' + TmpStr + ')';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.Font.Color := FontColor;
  ACanvas.DrawTexT(TxtToDraw, R, cxSingleLine);
  // ===========================================================================
end;

procedure TTagResOrdForm.btvResOrdCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TTagResOrdForm.btvResOrdNUMDOCGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  AText := '   Ordine n°   ' + IntToStr(ARecord.Values[btvResOrdNUMDOC.Index]) + '   del   ' + DateToStr(ARecord.Values[btvResOrdDATADOC.Index]);
end;

procedure TTagResOrdForm.PanelFiltriResize(Sender: TObject);
begin
  inherited;
  ClientiForm.CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TTagResOrdForm.PopupMenu1Popup(Sender: TObject);
var
  CurrMenuItem: TMenuItem;
  I: Integer;
  ListaViste: TStrings;
begin
  inherited;
  // Rende visibili le voci corrispondenti alle viste
  Selezionavista1.Visible := (not MainForm.IsLevanteLight);
  Salvaimpostazionicolonne1.Visible := (not MainForm.IsLevanteLight);
  // Carica l'elenco delle viste disponibili per questa griglia
  // in una StringList
  ListaViste := TStringList.Create;
  try
    DM1.ListaVisteGriglia(GridResOrd.Name, ListaViste);
    // Svuota l'elenco delle viste
    Selezionavista1.Clear;
    // Aggiunge la voce di selezione di nessuna vista
    CurrMenuItem := TMenuItem.Create(Self);
    CurrMenuItem.Caption := 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)';
    CurrMenuItem.Name := 'NessunaVista';
    CurrMenuItem.OnClick := Selezionavista1Click;
    Selezionavista1.Add(CurrMenuItem);
    // Aggiunge le altre eventuali viste presenti
    for I := 0 to ListaViste.Count - 1 do
    begin
      CurrMenuItem := TMenuItem.Create(Self);
      CurrMenuItem.Caption := ListaViste.Strings[I];
      CurrMenuItem.OnClick := Selezionavista1Click;
      Selezionavista1.Add(CurrMenuItem);
    end;
  finally
    ListaViste.Free;
  end;
end;

procedure TTagResOrdForm.Salvaimpostazionicolonne1Click(Sender: TObject);
var
  Vista: String;
  CurrGrid: TcxControl;
begin
  // Chiede il nome della vista
  if InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then
  begin
    // Controlla che la vista non sia nullo
    if Trim(Vista) = '' then
      raise Exception.Create('Il nome della vista non può essere vuoto.');
  end
  else
  begin
    // Se l'utente ha cliccato su Cancel annulla l'operazione
    Exit;
  end;
  // Salva la vista attuale
  DM1.SalvaGriglieDevExpress(GridResOrd, Vista, False);
end;

procedure TTagResOrdForm.SBCollapseGroupsClick(Sender: TObject);
begin
  inherited;
  btvResOrd.ViewData.Collapse(True);
end;

procedure TTagResOrdForm.SBExpandGroupsClick(Sender: TObject);
begin
  inherited;
  btvResOrd.ViewData.Expand(True);
end;

procedure TTagResOrdForm.btvResOrdCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  //  In base alla disponibilità o meno decide il colore
  if VarIsNull(AViewInfo.GridRecord.Values[btvResOrdQTA.Index]) or (AViewInfo.GridRecord.Values[btvResOrdQTA.Index] <= 0)
    then ACanvas.Font.Color := LabelFontDisabled.Font.Color
  else if (not VarIsNull(AViewInfo.GridRecord.Values[btvResOrdDISPONIBILE.Index])) and (AViewInfo.GridRecord.Values[btvResOrdDISPONIBILE.Index])
    then ACanvas.Font.Color := clGreen
    else ACanvas.Font.Color := clRed;
end;

procedure TTagResOrdForm.CdsDocDispCalcFields(DataSet: TDataSet);
begin
  inherited;
  // Calcola la Qtà residua
  if (not DataSet.FieldByName('QTA').IsNull) and (not DataSet.FieldByName('QTAEASA').IsNull) then begin
    DataSet.FieldByName('RESIDUO').Value := DataSet.FieldByName('QTA').AsFloat - DataSet.FieldByName('QTAEASA').AsFloat;
  end else begin
    DataSet.FieldByName('RESIDUO').Clear;
  end;
  // Calcola se l'articolo è disponibile in magazzino
  if (not DataSet.FieldByName('GIACENZA').IsNull) then begin
    DataSet.FieldByName('DISPONIBILE').Value := (DataSet.FieldByName('GIACENZA').AsFloat > 0) and (not DataSet.FieldByName('QTA').IsNull) and (DataSet.FieldByName('QTA').AsFloat > 0);
  end else begin
    DataSet.FieldByName('DISPONIBILE').Clear;
  end;
end;

procedure TTagResOrdForm.CdsResOrdCalcFields(DataSet: TDataSet);
var
  DocDisp:Boolean;
  TmpStr:String;
begin
  inherited;
//  CdsDocDispCalcFields(DataSet);
//
//  // ===========================================================================
//  // Calcola la disponibilità o meno dell'intero documento del rigo
//  // ---------------------------------------------------------------------------
//  if not CdsDocDisp.Active then Exit;
//  CdsDocDisp.Filter := 'NUMDOC = ' + CdsResOrdNUMDOC.AsString + ' AND DATADOC = ''' + FormatDateTime('dd/mm/yyyy', CdsResOrdDATADOC.AsDateTime) + '''';
//  CdsDocDisp.Filtered := True;
//  DocDisp := False;
//  CdsDocDisp.First;
//  while (not DocDisp) and (not CdsDocDisp.Eof) do begin
//    if not CdsDocDisp.FieldByName('DISPONIBILE').IsNull then DocDisp := CdsDocDisp.FieldByName('DISPONIBILE').Value;
//    CdsDocDisp.Next;
//  end;
//  CdsResOrdDOCDISP.Value := DocDisp;
//  // ===========================================================================
//
//  // ===========================================================================
//  // Calcola il campo che sarà usato per il raggruppamento e per fare in modo
//  //  che gli ordini disponibili appaiano per primi
//  // ---------------------------------------------------------------------------
//  CdsResOrdFORGROUP.Clear;
//  if (not CdsResOrdNUMDOC.IsNull) and (not CdsResOrdDATADOC.IsNull) then begin
//    // Costruisce su una variabile il valore del campo mettento come primo carattere
//    //  'T' o 'F' in base alla disponibilità del documento e poi la data in formato
//    //  inverso in modo da essere giusto per l'ordinamento e infine il numero del documento
//    //  alineato a dx a 10 caratteri
//    if DocDisp then TmpStr := 'T-' else TmpStr := 'F-';
//    TmpStr := TmpStr + FormatDateTime('yyyymmdd', CdsResOrdDATADOC.AsDateTime) + '-' + DM1.PadR(CdsResOrdNUMDOC.AsString, '0', 10);
//    CdsResOrdFORGROUP.Value := TmpStr;
//  end;
//  // ===========================================================================
end;

procedure TTagResOrdForm.btvResOrdQTAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
//  if AText = '0' then AText := '';
  try
    if AText.ToDouble = 0 then
      AText := '';
  except

  end;
end;

procedure TTagResOrdForm.btvResOrdRESIDUOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style := [fsBold];
end;

procedure TTagResOrdForm.ResetQueryButtonClick(Sender: TObject);
begin
  inherited;
  FilterTrova.Text := '';
  FilterCodice.Text := '';
  FilterDescrizione.Text := '';
  FilterNumDoc.Text := '';
  FilterRiferimento.Text := '';
  FilterDestinazione.Text := '';
  FilterOperatore.Text := '';
end;

procedure TTagResOrdForm.TrovaButtonClick(Sender: TObject);
var
  FilterString: String;
begin
  inherited;
  // Inizializzazione
  FilterString := '';
  // Riparte sempre con i filtri disabilitati
  CdsResOrd.Filter    := '';
  CdsResOrd.Filtered  := False;
  // SI assicura che i ClientDataSet siano chiusi
  if CdsDocDisp.Active then CdsDocDisp.Close;
  if CdsResOrd.Active then CdsResOrd.Close;
  // IMposta il percorso e il nome del file da aprire
  CdsResOrd.FileName := DM1.CartellaTmp + 'ResOrd_' + DM1.AziendaCorrente + '.XML';
  CdsDocDisp.FileName := CdsResOrd.FileName;
  // Apre il client data set
  CdsDocDisp.Open;
  CdsResOrd.Open;
  // Carica i valori di alcuni combo box dei filtri prima che il
  //  ClientDataSet venga filtrato
  CaricaItemsDestinazione;
  CaricaItemsOperatore;ShowMessage('6');
  // ===========================================================================
  // FILTRI
  // ---------------------------------------------------------------------------
  // Codice articolo
  if Trim(FilterCodice.Text) <> '' then begin
    if Length(FilterString) > 0 then FilterString := FilterString + ' AND ';
    FilterString := FilterString + 'CODICEARTICOLO = ' + QuotedStr(Trim(FilterCodice.Text));
  end;
  // Descrizione articolo
  if Trim(FilterDescrizione.Text) <> '' then begin
    if Length(FilterString) > 0 then FilterString := FilterString + ' AND ';
    FilterString := FilterString + DM1.AggiungiRicercaCampoClientDataSet('DESCRIZIONE', Trim(FilterDescrizione.Text));
  end;
  // Numero documento
  if Trim(FilterNumDoc.Text) <> '' then begin
    if Length(FilterString) > 0 then FilterString := FilterString + ' AND ';
    FilterString := FilterString + 'NUMDOC = ' + Trim(FilterNumDoc.Text);
  end;
  // Riferimento
  if Trim(FilterRiferimento.Text) <> '' then begin
    if Length(FilterString) > 0 then FilterString := FilterString + ' AND ';
    FilterString := FilterString + DM1.AggiungiRicercaCampoClientDataSet('RIFERIMENTO', Trim(FilterRiferimento.Text));
  end;
  // Destinazione
  if Trim(FilterDestinazione.Text) <> '' then begin
    if Length(FilterString) > 0 then FilterString := FilterString + ' AND ';
    FilterString := FilterString + DM1.AggiungiRicercaCampoClientDataSet('RAGSOCMERCE1', Trim(FilterDestinazione.Text));
  end;
  // Operatore
  if Trim(FilterOperatore.Text) <> '' then begin
    if Length(FilterString) > 0 then FilterString := FilterString + ' AND ';
    FilterString := FilterString + DM1.AggiungiRicercaCampoClientDataSet('OPERATORE', Trim(FilterOperatore.Text));
  end;
  // Attiva il filtraggio se è il caso
  if (FilterString <> '') then begin
    CdsResOrd.Filter    := FilterString;
    CdsResOrd.Filtered  := True;
  end else begin
    CdsResOrd.Filter    := '';
    CdsResOrd.Filtered  := False;
  end;
  // ===========================================================================
  // Per default i gruppi sono tutti collassati
  SBExpandGroupsClick(SBExpandGroups);
  // Si posiziona all'inizio
  btvResOrd.Controller.GoToFirst;
end;


// Procedura che carica le voci nella ComboBox della destinazione merce
procedure TTagResOrdForm.CaricaItemsDestinazione;
var
  CurrVal: String;
begin
  CdsResOrd.DisableControls;
  CdsResOrd.First;
  FilterDestinazione.Properties.Items.Clear;
  FilterDestinazione.Properties.Items.Add('');
  try
    while not CdsResOrd.Eof do begin
      if (not CdsResOrdRAGSOCMERCE1.IsNull) then begin
        CurrVal := Trim(CdsResOrdRAGSOCMERCE1.AsString);
        if (CurrVal <> '') and (FilterDestinazione.Properties.Items.IndexOf(CurrVal) = -1) then begin
          FilterDestinazione.Properties.Items.Add(CurrVal);
        end;
      end;
      CdsResOrd.Next;
    end;
  finally
    CdsResOrd.First;
    CdsResOrd.EnableControls;
  end;
end;

// Procedura che carica le voci nella ComboBox dell'operatore
procedure TTagResOrdForm.CaricaItemsOperatore;
var
  CurrVal: String;
begin
  CdsResOrd.DisableControls;
  CdsResOrd.First;
  FilterOperatore.Properties.Items.Clear;
  FilterOperatore.Properties.Items.Add('');
  try
    while not CdsResOrd.Eof do begin
      if (not CdsResOrdOPERATORE.IsNull) then begin
        CurrVal := Trim(CdsResOrdOPERATORE.AsString);
        if (CurrVal <> '') and (FilterOperatore.Properties.Items.IndexOf(CurrVal) = -1) then begin
          FilterOperatore.Properties.Items.Add(CurrVal);
        end;
      end;
      CdsResOrd.Next;
    end;
  finally
    CdsResOrd.First;
    CdsResOrd.EnableControls;
  end;
end;


procedure TTagResOrdForm.FilterTrovaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;

procedure TTagResOrdForm.GridResOrdLinkCustomDrawCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas;
  AView: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AColumn: TcxGridColumn; AnItem: TAbstractdxReportCellData;
  var ADone: Boolean);
const
  TOP_MARGIN = 0;
  BOTTOM_MARGIN = 0;
  MID_SEP_MARGIN = 5;
  TEXT_SEP = 8;
  TEXT_INTERLINEA = 15;
var
  AFont: TFont;
  R: TRect;
  MidSep:Integer;
  ChildRows: TList;
  GroupIndex: Integer;
  DC: TcxCustomDataController;
  RowIdx: Integer;
  TxtToDraw, TmpStr: String;
  BrushColor, FontColor, LabelFontColor: TColor;
  AScale: Integer;
  HorizontalAlign: TcxTextAlignX;
begin
  inherited;
  // Calcolo del fattore di scala
  AScale := Sender.RealScaleFactor div 2;
  // Inizializzazione font
  AFont := TFont.Create;
  try
    // Imposta il font
    AFont.Assign(AnItem.Font);
    // =========================================================================
    // Se è un GROUP HEADER
    // -------------------------------------------------------------------------
    if not ARecord.IsData then begin
      // Inizializzazione
      ADone := True;
      ACanvas.Font.Name := 'Arial';
      DC := btvResOrd.DataController;
      // Impostazione del Rectangle
      R.Left    := AnItem.BoundsRect.Left;
      R.Top     := AnItem.BoundsRect.Top;
      R.Right   := AnItem.BoundsRect.Right;
      R.Bottom  := AnItem.BoundsRect.Bottom;

      MidSep := R.Right - (350 * AScale);
      // Crea e carica nella TList i Childs Records del gruppo in modo da poter
      //  accedere a tutti i valori necessari e poi mette il RowIdx del primo rigo trovato
      //  in modo da poter accedere a tuti i suoi dati
      ChildRows := TList.Create;
      try
        GroupIndex := DC.Groups.DataGroupIndexByRowIndex[ARecord.Index];
        DC.Groups.LoadRecordIndexes(ChildRows, GroupIndex);
        RowIdx := integer(ChildRows[0]);
      finally
        ChildRows.Free;
      end;

      // Determinazione dei colori in base alla disponibilità o meno del documento
      if (not VarIsNull(DC.Values[RowIdx,btvResOrdDOCDISP.Index])) and DC.Values[RowIdx,btvResOrdDOCDISP.Index] then begin
        FontColor       := ShapeDocDisp.Pen.Color;
        BrushColor      := ShapeDocDisp.Brush.Color;
        LabelFontColor  := LabelFontDisp.Font.Color;
      end else begin
        FontColor       := ShapeDocNonDisp.Pen.Color;
        BrushColor      := ShapeDocNOnDisp.Brush.Color;
        LabelFontColor  := LabelFontNonDisp.Font.Color;
      end;

      // Disegna il rettangolo di sfondo
      Sender.DrawRectangle(ACanvas, R, BrushColor, clWhite, TdxPSSolidFillPattern, BrushColor);
//ShowMessage(IntToStr(R.Left) + ' - ' + IntToStr(R.Right) + ' - ' + IntToStr(R.Top) + ' - ' + IntToStr(R.Bottom));

      // ===========================================================================
      //  Visualizza il riferimento al documento
      // ---------------------------------------------------------------------------
      R.Left := AnItem.BoundsRect.Left;
      R.Top := R.Top + (TOP_MARGIN * AScale);
      R.Right := MidSep - (MID_SEP_MARGIN * AScale);
      // Label "Ordine n°'
      TxtToDraw := 'Ordine n°';
      AFont.Size := (7 * AScale);
      AFont.Style := [];
      AFont.Color := LabelFontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := R.Left + (90 * AScale);
      // Numero documento
      TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdNUMDOC.Index];
      AFont.Size := (8 * AScale);
      AFont.Style := [];
      AFont.Color := FontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + (TEXT_SEP * AScale);
      // Label " del "
      TxtToDraw := 'del';
      AFont.Size := (7 * AScale);
      AFont.Style := [];
      AFont.Color := LabelFontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + (TEXT_SEP * AScale);
      // Data documento
      TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdDATADOC.Index];
      AFont.Size := (8 * AScale);
      AFont.Style := [];
      AFont.Color := FontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + (TEXT_SEP * AScale);
      // ===========================================================================

      // ===========================================================================
      //  Visualizza il riferimento cliente
      // ---------------------------------------------------------------------------
      R.Left := AnItem.BoundsRect.Left;
      R.Top := R.Top + (TEXT_INTERLINEA * AScale);
      R.Right := MidSep - (MID_SEP_MARGIN * AScale);
      // Label "Riferimento"
      TxtToDraw := 'Riferimento';
      AFont.Size := (7 * AScale);
      AFont.Style := [];
      AFont.Color := LabelFontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := (90 * AScale);
      // Campo riferimento cliente
      TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdRIFERIMENTO.Index];
      AFont.Size := (8 * AScale);
      AFont.Style := [fsBold];
      AFont.Color := FontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + (TEXT_SEP * AScale);
      // ===========================================================================

      // ===========================================================================
      //  Visualizza l'Operatore
      // ---------------------------------------------------------------------------
      R.Left := AnItem.BoundsRect.Left;
      R.Top := R.Top + (TEXT_INTERLINEA * AScale);
      R.Right := MidSep - (MID_SEP_MARGIN * AScale);
      // Label "Operatore"
      TxtToDraw := 'Operatore';
      AFont.Size := (7 * AScale);
      AFont.Style := [];
      AFont.Color := LabelFontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := (90 * AScale);
      // Campo riferimento cliente
      TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdOPERATORE.Index];
      AFont.Size := (8 * AScale);
      AFont.Style := [];
      AFont.Color := FontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + (TEXT_SEP * AScale);
      // ===========================================================================

      // ===========================================================================
      //  Visualizza la Destinazione della Merce
      // ---------------------------------------------------------------------------
      R.Left := MidSep + (MID_SEP_MARGIN * AScale);
      R.Top := AnItem.BoundsRect.Top + (TOP_MARGIN * AScale);
      R.Right := AnItem.BoundsRect.Right;
      R.Bottom := AnItem.BoundsRect.Bottom - (BOTTOM_MARGIN * AScale);
      // Stampa Label "Destinazione"
      TxtToDraw := 'Destinazione';
      AFont.Size := (7 * AScale);
      AFont.Style := [];
      AFont.Color := LabelFontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Left := R.Left + ACanvas.TextWidth(TxtToDraw) + (TEXT_SEP * AScale);
      // Costruzione della RagSocMerce che è composta in realtà da due campi
      TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdRAGSOCMERCE1.Index] + ' ' + DC.DisplayTexts[RowIdx,btvResOrdRAGSOCMERCE2.Index];
      AFont.Size := (8 * AScale);
      AFont.Style := [fsBold];
      AFont.Color := FontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      R.Top := R.Top + (TEXT_INTERLINEA * AScale);
      // Campo Indirizzo merce
      TxtToDraw := DC.DisplayTexts[RowIdx,btvResOrdINDIRIZZOMERCE.Index];
      AFont.Size := (8 * AScale);
      AFont.Style := [];
      AFont.Color := FontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
      // CAP + Località + Provincia
      TmpStr := Trim(DC.DisplayTexts[RowIdx,btvResOrdCAPMERCE.Index]);
      if TmpStr <> '' then TxtToDraw := TmpStr + ' - ';
      ACanvas.Font.Color := FontColor;
      TxtToDraw := TxtToDraw + Trim(DC.DisplayTexts[RowIdx,btvResOrdLOCALITAMERCE.Index]);
      TmpStr := Trim(DC.DisplayTexts[RowIdx,btvResOrdPROVINCIAMERCE.Index]);
      if TmpStr <> '' then TxtToDraw := TxtToDraw + ' (' + TmpStr + ')';
      AFont.Size := (8 * AScale);
      AFont.Style := [];
      AFont.Color := FontColor;
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, BrushColor, taLeft, taTop, True, False, False);
    // ===========================================================================

    // =========================================================================
    // Se è una CELLA NORMALE
    // -------------------------------------------------------------------------
    end else begin
      ADone := True;
      // Determinazione dell'allineamento orizzontale da utilizzare
      if      AColumn.Properties.Alignment.Horz = taLeftJustify   then HorizontalAlign := taLeft
      else if AColumn.Properties.Alignment.Horz = taRightJustify  then HorizontalAlign := taRight
      else if AColumn.Properties.Alignment.Horz = taCenter        then HorizontalAlign := taCenterX;
      //  In base alla disponibilità o meno decide il colore
      if VarIsNull(ARecord.Values[btvResOrdQTA.Index]) or (ARecord.Values[btvResOrdQTA.Index] <= 0)
        then FontColor := LabelFontDisabled.Font.Color
      else if (not VarIsNull(ARecord.Values[btvResOrdDISPONIBILE.Index])) and (ARecord.Values[btvResOrdDISPONIBILE.Index])
        then FontColor := clGreen
        else FontColor := clRed;
      // Impostazione del Rectangle
      R.Left    := AnItem.BoundsRect.Left;
      R.Top     := AnItem.BoundsRect.Top;
      R.Right   := AnItem.BoundsRect.Right;
      R.Bottom  := AnItem.BoundsRect.Bottom;
      // Imposta il font
      AFont.Assign(AnItem.Font);
      AFont.Name := 'Arial';
      AFont.Color := FontColor;
      // Determinazione del testo da stampare e stampa del medesimo
      TxtToDraw := ARecord.DisplayTexts[AColumn.Index];
      Sender.drawText(ACanvas, R, 0, TxtToDraw, AFont, clWhite, HorizontalAlign, taTop, True, False, False);  // NB: clWhite è il colore di sfondo
    end;
    // =========================================================================
  finally
    AFont.Free;
  end;
end;

procedure TTagResOrdForm.GridResOrdLinkCustomDrawHeaderCell(
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

procedure TTagResOrdForm.GridResOrdLinkCustomDrawBandCell(
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

procedure TTagResOrdForm.dxPrinterCustomDrawPageHeader(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
  inherited;
  DM1.dxPrinterDefaultDrawPageHeader(AReportLink, ACanvas, ARect, ANom, ADenom, False);
end;

procedure TTagResOrdForm.dxPrinterCustomDrawPageFooter(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
  inherited;
   DM1.dxPrinterDefaultDrawPageFooter(AReportLink, ACanvas, APageIndex, ARect, ANom, ADenom);
end;

procedure TTagResOrdForm.Scaricalultimoaggiornamentodelresiduoordini1Click(
  Sender: TObject);
begin
  inherited;
  // Ovviamente chiede prima una conferma
  if DM1.Messaggi('Aggiornamento residuo ordini', 'Vuoi scaricare l''ultimo aggiornamento del residuo ordini?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  // Procedura che scarica il residuo ordini
  ScaricaResiduoOrdini;
  // Avverte l'utente che l'operazione è giunta a termine.
  DM1.Messaggi('Aggiornamento residuo ordini', 'Operazione completata.', '', [mbOk], 0, nil);
end;


// Procedura che scarica il residuo ordini
procedure TTagResOrdForm.ScaricaResiduoOrdini;
var
  DataUltimoResOrd: TDateTime;
begin
  // Scarica l'ultimo aggiornamento del residuo ordini
  DM1.ResOrd_DownloadFromTeletrasporto(True);
  // Se i CliendDataSet sono aperti lo chiude prima di continuare
  if CdsDocDisp.Active then CdsDocDisp.Close;
  if CdsResOrd.Active then CdsResOrd.Close;
  // IMposta il nome del file
  CdsDocDisp.FileName := DM1.CartellaTmp + 'ResOrd_' + DM1.AziendaCorrente + '.xml';
  CdsResOrd.FileName := DM1.CartellaTmp + 'ResOrd_' + DM1.AziendaCorrente + '.xml';
  // Preleva il file del residuo ordini dal database
  DataUltimoResOrd := DM1.ResOrd_GetFromDatabase;
  // Verifica
  if DataUltimoResOrd = StrToDate('01/01/1900') then
    raise Exception.Create('Errore durante l''apertura del residuo ordini.');
  // Reset dei filtri
  ClientiForm.RxSpeedButtonResetQueryClick(ClientiForm.RxSpeedButtonResetQuery);
  // Apre l'archivio
  ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
  // In ogni caso imposta la Label che riporta la data del residuo ordini attuale
  LabelResOrd.Caption := ' Residuo ordini del ' + FormatDateTime('dd/mm/yyyy', DataUltimoResOrd);
end;


procedure TTagResOrdForm.Selezionavista1Click(Sender: TObject);
var
  CurrItemCaption: String;
begin
  // Caption della voce selezionata
  CurrItemCaption := (Sender as TMenuItem).Caption;
  // Se la Caption della voce selezionata contiene il carattere & (incasina tutto)
  // lo toglie.
  CurrItemCaption := StringReplace(CurrItemCaption, '&', '', [rfReplaceAll]);
  // Se la voce attuale è la radice del menu di selezione viste esce subito
  if (Sender as TMenuItem).Name = 'Selezionavista1' then
    Exit;
  // Carica la vista attuale
  DM1.RipristinaDevExpress(GridResOrd, CurrItemCaption, False);
end;

end.

