unit FormDipendenti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag, cxCustomData, 
  cxEdit, DB, cxDBData, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, DBCtrls, Mask, StdCtrls, ComCtrls, Menus,
  cxCheckComboBox, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxGroupBox, cxRadioGroup, cxStyles, cxGraphics,
  cxFilter, cxData, cxDataStorage, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  dxPScxPivotGridLnk, dxPScxSchedulerLnk, cxCheckBox, Vcl.ImgList, dxDateRanges, dxScrollbarAnnotations, System.ImageList;

type
  TDipendentiForm = class(TLevanteListAnagForm)
    QCODICE: TIntegerField;
    QCOGNOME: TStringField;
    QNOME: TStringField;
    QINDIRIZZO: TStringField;
    QNUMCIVICO: TStringField;
    QCITTA: TStringField;
    QCAP: TStringField;
    QPROVINCIA: TStringField;
    QTELEFONO: TStringField;
    QCELLULARE: TStringField;
    QCODICEFISCALE: TStringField;
    QDATANASCITA: TDateTimeField;
    QLUOGONASCITA: TStringField;
    QEMAIL: TStringField;
    QNOTE: TMemoField;
    tvListCODICE: TcxGridDBColumn;
    tvListCOGNOME: TcxGridDBColumn;
    tvListNOME: TcxGridDBColumn;
    tvListINDIRIZZO: TcxGridDBColumn;
    tvListNUMCIVICO: TcxGridDBColumn;
    tvListCITTA: TcxGridDBColumn;
    tvListCAP: TcxGridDBColumn;
    tvListPROVINCIA: TcxGridDBColumn;
    tvListTELEFONO: TcxGridDBColumn;
    tvListCELLULARE: TcxGridDBColumn;
    tvListCODICEFISCALE: TcxGridDBColumn;
    tvListDATANASCITA: TcxGridDBColumn;
    tvListLUOGONASCITA: TcxGridDBColumn;
    tvListEMAIL: TcxGridDBColumn;
    tvListNOTE: TcxGridDBColumn;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RichEdit1: TRichEdit;
    DBECognome: TDBEdit;
    DBENome: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    PanelGruppo2: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RichEdit2: TRichEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    PanelGruppo5: TPanel;
    Label14: TLabel;
    RichEdit3: TRichEdit;
    DBMemo1: TDBMemo;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    QSINCHRO: TStringField;
    DBText1: TDBText;
    PanelGruppo3: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    RichEdit4: TRichEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    QHCONTRATTO: TIBOFloatField;
    QHFERIE: TIBOFloatField;
    QHPERMESSI: TIBOFloatField;
    QCOSTOORARIO: TIBOFloatField;
    QPRZVENDORARIO: TIBOFloatField;
    QCOSTOSTR: TIBOFloatField;
    QPRZVENDORARIOSTR: TIBOFloatField;
    Label20: TLabel;
    DBEdit15: TDBEdit;
    Label21: TLabel;
    DBEdit16: TDBEdit;
    Label22: TLabel;
    DBEdit17: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit18: TDBEdit;
    Label25: TLabel;
    DBEdit19: TDBEdit;
    Label26: TLabel;
    DBEdit20: TDBEdit;
    Label27: TLabel;
    QRICARICOSTR: TFloatField;
    QRICARICO: TFloatField;
    QCOSTOPERMESSI: TIBOFloatField;
    QCOSTOFERIE: TIBOFloatField;
    QCOSTOTRASFERTE: TIBOFloatField;
    Label28: TLabel;
    DBEdit21: TDBEdit;
    Label29: TLabel;
    DBEdit22: TDBEdit;
    Label30: TLabel;
    DBEdit23: TDBEdit;
    QOPERAINDEX: TIntegerField;
    DbeTipoManodopera: TcxDBRadioGroup;
    QENABLED: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    Label31: TLabel;
    ImageList1: TImageList;
    tvListENABLED: TcxGridDBColumn;
    PanelGruppo4: TPanel;
    Label32: TLabel;
    RichEdit5: TRichEdit;
    dbeTipoOre1: TcxDBComboBox;
    Label33: TLabel;
    Label34: TLabel;
    dbeTipoOre2: TcxDBComboBox;
    Label35: TLabel;
    dbeTipoOre3: TcxDBComboBox;
    QTIPOORE1: TStringField;
    QTIPOORE2: TStringField;
    QTIPOORE3: TStringField;
    procedure QBeforePost(DataSet: TDataSet);
    procedure tvListDblClick(Sender: TObject);
    procedure QCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QNewRecord(DataSet: TDataSet);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvListENABLEDGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure QBeforeDelete(DataSet: TDataSet);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure dbeTipoOre1PropertiesInitPopup(Sender: TObject);
    procedure dbeTipoOre2PropertiesInitPopup(Sender: TObject);
    procedure dbeTipoOre3PropertiesInitPopup(Sender: TObject);
    procedure tvListDataControllerSortingChanged(Sender: TObject);
  private
    fSoloManodoperaTipo: Integer;
    FSoloAttivi: Boolean;
    procedure CaricaDescrizioniManodopera;
    { Private declarations }
  protected
    procedure EseguiQuery; override;
  public
    { Public declarations }
    property SoloManodoperaTipo: Integer read fSoloManodoperaTipo write fSoloManodoperaTipo;
    property SoloAttivi: Boolean read FSoloAttivi write FSoloAttivi;
  end;

var
  DipendentiForm: TDipendentiForm;

implementation

uses DataModule1, FormRappGiorn, SchedaClienti, SchedaPreventiviOrdini,
  FormTabGC, FormConfirm, IB_Components, dxCore;

{$R *.dfm}

procedure TDipendentiForm.QBeforeDelete(DataSet: TDataSet);
var
  LMessage: string;
begin
  inherited;
  // Operazione non autorizzata
  if not TConfirmForm.AuthorizationRequest then
    Abort;
//  // 1° conferma
//  if not TConfirmForm.ConfirmationRequest(
//    Format('Elimina %s %s', [QNOME.AsString, QCOGNOME.AsString]),
//    Format('Per confermare digita "elimina %s %s", poi clicca sul bottone "Conferma".', [QNOME.AsString, QCOGNOME.AsString]),
//    Format('elimina %s %s', [QNOME.AsString, QCOGNOME.AsString]),
//    800, 300)
//    then
//      Abort;
  // 2° conferma con raccomandazioni
  LMessage := 'A T T E N Z I O N E !!!'#13#13'L''operazione potrebbe causare problemi se la persona è presente in documenti emessi in precedenza.'#13#13 +
    'I documenti potrebbero non essere più accessibili.'#13#13 +
    'CONSULTARE IL SERVIZIO DI ASSISTENZA prima di proseguire.'#13#13 +
    'Se vuoi proseguire ugualmente digita "ignora le raccomandazioni", poi clicca su "Conferma".';
  if not TConfirmForm.ConfirmationRequest(Format('Elimina %s %s', [QNOME.AsString, QCOGNOME.AsString]), LMessage, 'ignora le raccomandazioni', 800, 450) then
    Abort;
end;

procedure TDipendentiForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Se il codice non c'è lo assegna automaticamente
  if Trim(Q.FieldByName('CODICE').AsString) = '' then begin
    Q.FieldByName('CODICE').Value := DM1.NextCodice('DIPENDENTI', 'CODICE');
  end;
end;

procedure TDipendentiForm.tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il record attuale è disabilitato..
  if AViewInfo.GridRecord.DisplayTexts[tvListENABLED.Index] <> 'T' then
  begin
    // Imposta un colore da secondo piano
    ACanvas.Font.Color := clGray;
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clSilver;
    // Se stiamo proprio traccianto la colonna ENABLED...
    if AViewInfo.Item.Index = tvListENABLED.Index then begin
      // Disegna il rettangolo di sfondo
      ACanvas.FillRect(AViewInfo.Bounds);
      // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
      ACanvas.DrawImage(ImageList1, (AViewInfo.Bounds.Left + AViewInfo.Bounds.Right - ImageList1.Width) div 2, (AViewInfo.Bounds.Top + AViewInfo.Bounds.Bottom - ImageList1.Height) div 2, 0);
      // Custom Draw
      ADone := True;
    end;
  end
  // Se invece è una riga normale (abilitata) forso il colore dello sfondo
  //  perchè altrimenti sarebbe con lettura facilitata ma siccome ho aggiunto il grigio scuro per
  //  le righe disabilitate mi sembravano troppi colori
  else
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clWhite;
end;

procedure TDipendentiForm.tvListDataControllerSortingChanged(Sender: TObject);
begin
  inherited;
  tvListENABLED.SortOrder := TdxSortOrder.soDescending;
  tvListENABLED.SortIndex := 0;
end;

procedure TDipendentiForm.tvListDblClick(Sender: TObject);
var
   CognomeNome: String;
begin
  inherited;
  // Prima di tutto costruisce il Nome+Cognome su una variabile locale
  CognomeNome := '';
  if not QNOME.IsNull then CognomeNome := Trim(QNOME.AsString);
  if not QCOGNOME.IsNull then begin
    if Length(Trim(CognomeNome)) > 0 then CognomeNome := CognomeNome + ' ';
    CognomeNome := CognomeNome + Trim(QCOGNOME.AsString);
  end;
  // Se è in modalità archivio esce subito
  if Self.DblClickMode = DblClickModeArchive then Exit;
  // ===========================================================================
  // Se invece è in modalità di selezione...
  // ---------------------------------------------------------------------------
  // RIGO RAPPORTO GIORNALIERO
  if Self.CallerCode = 1 then begin
    with RappGiornForm.tvOre.DataController do begin
      // Imposta valori ottenuti
      Values[FocusedRecordIndex, RappGiornForm.tvOreCODDIPENDENTE.Index] := QCODICE.AsInteger;
      Values[FocusedRecordIndex, RappGiornForm.tvOreDESCRIZDIPENDENTE.Index] := CognomeNome;
      Values[FocusedRecordIndex, RappGiornForm.tvOreTIPOORE1.Index] := QTIPOORE1.AsString;
      Values[FocusedRecordIndex, RappGiornForm.tvOreTIPOORE2.Index] := QTIPOORE2.AsString;
      Values[FocusedRecordIndex, RappGiornForm.tvOreTIPOORE3.Index] := QTIPOORE3.AsString;
      if not QCOSTOORARIO.IsNull        then Values[FocusedRecordIndex, RappGiornForm.tvOreCOSTOORARIO.Index] := QCOSTOORARIO.AsCurrency;
      if not QCOSTOSTR.IsNull           then Values[FocusedRecordIndex, RappGiornForm.tvOreCOSTOSTRAORDINARIO.Index] := QCOSTOSTR.AsCurrency;
      if not QCOSTOPERMESSI.IsNull      then Values[FocusedRecordIndex, RappGiornForm.tvOreCOSTOPERMESSI.Index] := QCOSTOPERMESSI.AsCurrency;
      if not QCOSTOFERIE.IsNull         then Values[FocusedRecordIndex, RappGiornForm.tvOreCOSTOFERIE.Index] := QCOSTOFERIE.AsCurrency;
      if not QCOSTOTRASFERTE.IsNull     then Values[FocusedRecordIndex, RappGiornForm.tvOreCOSTOTRASFERTE.Index] := QCOSTOTRASFERTE.AsCurrency;
      if not QHCONTRATTO.IsNull         then Values[FocusedRecordIndex, RappGiornForm.tvOreOREBASE.Index] := QHCONTRATTO.AsCurrency;
      if not QOPERAINDEX.IsNull         then Values[FocusedRecordIndex, RappGiornForm.tvOreOPERAINDEX.Index] := QOPERAINDEX.AsInteger;
      // Imposta il prezzo di vendita di default del tipo di panodopera a cui il dipendente appartiene
      Values[FocusedRecordIndex, RappGiornForm.tvOrePRZVEND.Index] := DM1.Manodopera[QOPERAINDEX.AsInteger].PrezzoUnitario1;
      // Se la Qta e anche il costo orario non sono nulli provvede a calcolare
      //  l'importo.
      RappGiornForm.CalcolaImportoOrario(FocusedRecordIndex);
    end;

  // RIGO RAPPORTO GIORNALIERO SPESE
  end else if Self.CallerCode = 2 then begin
    with RappGiornForm.tvSpese.DataController do begin
      // Imposta valori ottenuti
      Values[FocusedRecordIndex, RappGiornForm.tvSpeseCODDIPENDENTE.Index] := QCODICE.AsInteger;
      Values[FocusedRecordIndex, RappGiornForm.tvSpeseDESCRIZDIPENDENTE.Index] := CognomeNome;
    end;

  // PULSANTE NUOVO DEL RAPPORTO GIORNALIERO DIPENDENTI
  end else if Self.CallerCode = 3 then begin
    RappGiornForm.NuovoRigoOre(QCODICE.AsInteger, AM_Append);

  // PULSANTE NUOVO DEL RAPPORTO GIORNALIERO SPESE
  end else if Self.CallerCode = 4 then begin
    RappGiornForm.NuovoRigoSpese(QCODICE.AsInteger, AM_Append);

  // FILTRO GOS ORE
  end else if Self.CallerCode = 5 then begin
    ClientiForm.FilterGosCodiceDipendente.Text := QCODICE.AsString;
    ClientiForm.FilterGosDescrizDipendente.Text := CognomeNome;

  // FILTRO GOS SPESE
  end else if Self.CallerCode = 6 then begin
    ClientiForm.FilterGosSpeseCodiceDipendente.Text := QCODICE.AsString;
    ClientiForm.FilterGosSpeseDescrizDipendente.Text := CognomeNome;

  // PULSANTE NUOVO DEL DOCUMENTO (Manodopera)
  end else if Self.CallerCode = 7 then begin
    PreventiviOrdiniForm.NuovoRigoOre(QCODICE.AsInteger, AM_Append);

  end else if Self.CallerCode = 8 then begin
    with PreventiviOrdiniForm.GridCorpo.FocusedView.DataController do begin
      // Imposta valori ottenuti
      Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOreCODDIPENDENTE.Index] := QCODICE.AsInteger;
      Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOreDESCRIZDIPENDENTE.Index] := CognomeNome;
      Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOreTIPOORE1.Index] := QTIPOORE1.AsString;
      Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOreTIPOORE2.Index] := QTIPOORE2.AsString;
      Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOreTIPOORE3.Index] := QTIPOORE3.AsString;
      if not QCOSTOORARIO.IsNull then Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOreCOSTOORARIO.Index] := QCOSTOORARIO.AsCurrency;
      // Il prezzo di vendita deve essere quello del rigo principale
      Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOrePRZUNITVEND.Index] := DM1.NoNullFloatValue(PreventiviOrdiniForm.tvCorpo.DataController, GetMasterRecordIndex, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Index);
      // Imposta l'operaindex
      if not QOPERAINDEX.IsNull then Values[FocusedRecordIndex, PreventiviOrdiniForm.tvOreOPERAINDEX.Index] := QOPERAINDEX.AsCurrency;
      // Se la Qta e anche il costo orario non sono nulli provvede a calcolare
      //  l'importo.
      PreventiviOrdiniForm.CalcolaImportoOrario(PreventiviOrdiniForm.GridCorpo.FocusedView.DataController, FocusedRecordIndex);
    end;

  // PULSANTE NUOVO DEL GIARNALE DI CANTIERE (Manodopera)
  end else if Self.CallerCode = 9 then begin
    DM1.ShowWait('Levante', 'Operazione in corso...');
    try
      TabGCForm.NuovoRigoOre(QCODICE.AsInteger, AM_Append);
    finally
      DM1.CloseWait;
    end;

  end;
  // ===========================================================================
  // Chiude la form per formare alla form chiamante
  Self.Close;
end;

procedure TDipendentiForm.tvListENABLEDGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure TDipendentiForm.QCalcFields(DataSet: TDataSet);
var
  G: Double;
begin
  inherited;
  if (not QPRZVENDORARIO.IsNull) and (not QCOSTOORARIO.IsNull) then begin
    G := DM1.Arrotonda(QPRZVENDORARIO.AsCurrency - QCOSTOORARIO.AsCurrency, DM1.DecMicroPrz);
    QRICARICO.Value := DM1.Arrotonda((G * 100 / QCOSTOORARIO.AsCurrency), 2);
  end else QRICARICO.Clear;

  if (not QPRZVENDORARIO.IsNull) and (not QCOSTOSTR.IsNull) then begin
    G := DM1.Arrotonda(QPRZVENDORARIO.AsCurrency - QCOSTOSTR.AsCurrency, DM1.DecMicroPrz);
    QRICARICOSTR.Value := DM1.Arrotonda((G * 100 / QCOSTOSTR.AsCurrency), 2);
  end else QRICARICOSTR.Clear;
end;

procedure TDipendentiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DipendentiForm := nil;
end;


procedure TDIpendentiForm.CaricaDescrizioniManodopera;
var
  i: Integer;
begin
  // Inizializzazione
  i := 0;
  // Azzera tutto
  DbeTipoManodopera.Properties.Items.Clear;
  // Cicla finchè c'è una manodopera con codice valido e finchè non si arriva alla fine
  //  dell'array che contiene le manodopere.
  while (Trim(DM1.Manodopera[i].Codice) <> '') and (i < Length(DM1.Manodopera)) do begin
    with DbeTipoManodopera.Properties.Items.Add do begin
      Caption := DM1.Manodopera[i].Descrizione;
      Value := i;
    end;
    Inc(i);
  end;
end;

procedure TDipendentiForm.FormShow(Sender: TObject);
begin
  // Carica la manodopera
  CaricaDescrizioniManodopera;
  // Lasciarlo dopo il caricamento delle descrizioni della manodopera
  //  altrimenti non imposta il tipo di manodopera del dipendente
  //  finchè non si cambia record 
  inherited;
end;

procedure TDipendentiForm.dbeTipoOre1PropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI WHERE TIPO = ''OREDIP1''');
    Qry.Open;
    dbeTipoOre1.Properties.Items.Clear;
    while not Qry.Eof do
    begin
      dbeTipoOre1.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDipendentiForm.dbeTipoOre2PropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI WHERE TIPO = ''OREDIP2''');
    Qry.Open;
    dbeTipoOre2.Properties.Items.Clear;
    while not Qry.Eof do
    begin
      dbeTipoOre2.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDipendentiForm.dbeTipoOre3PropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Carica l'elenco dei costruttori
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM TIPIOREDIPENDENTI WHERE TIPO = ''OREDIP3''');
    Qry.Open;
    dbeTipoOre3.Properties.Items.Clear;
    while not Qry.Eof do
    begin
      dbeTipoOre3.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDipendentiForm.EseguiQuery;
begin
  // Prima di aprire la query con l'elenco dei dipendenti, imposta la query in modo
  //  da visualizzare solo i dipendenti del tipo di manodopera voluta.
  if SoloManodoperaTipo = -1 then begin
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM DIPENDENTI');
    if SoloAttivi then
      Q.SQL.Add('WHERE ENABLED = ''T''');
  end else begin
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM DIPENDENTI WHERE OPERAINDEX = ' + IntToStr(SoloManodoperaTipo));
    if SoloAttivi then
      Q.SQL.Add('AND ENABLED = ''T''');
  end;
  // Esegue il codice dell'antenato che sostanzialmente apre semplicemente la query
  inherited;
end;

procedure TDipendentiForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  SoloManodoperaTipo := -1;
end;

procedure TDipendentiForm.QNewRecord(DataSet: TDataSet);
begin
  inherited;
  // Inizializzazione default di alcuni campi
  QOPERAINDEX.Value := 0;
end;

procedure TDipendentiForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
//  inherited;
  Q.Delete;
end;

procedure TDipendentiForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  inherited;
  Q.FieldByName('ENABLED').Value := 'T';
end;

end.
