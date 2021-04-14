unit FormOperazioniPianificate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag,
  cxEdit, DB, cxDBData, Menus, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, cxMemo, cxCheckBox, cxDBEdit, cxContainer,
  cxMaskEdit, cxDropDownEdit, Mask, DBCtrls, StdCtrls, ComCtrls,
  IB_Components, cxPC, cxCalendar, cxGridBandedTableView,
  cxGridDBBandedTableView, cxCurrencyEdit, cxGroupBox, cxCheckGroup,
  cxCheckComboBox, cxDBCheckComboBox, cxRadioGroup, Buttons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxLookAndFeelPainters,
  cxLookAndFeels, cxNavigator, cxPCdxBarPopupMenu,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  cxSpinEdit, dxDateRanges, dxScrollbarAnnotations, dxPScxPivotGridLnk,
  dxPScxSchedulerLnk, dxBarBuiltInMenu;

type
  TOperazioniPianificateForm = class(TLevanteListAnagForm)
    QCODICE: TStringField;
    QDESCRIZIONE: TStringField;
    QNOTE: TMemoField;
    QPERIODICITA: TIntegerField;
    QMINUTIPREVISTI: TIntegerField;
    QAGGNUOVOIMPIANTO: TStringField;
    tvListCODICE: TcxGridDBColumn;
    tvListDESCRIZIONE: TcxGridDBColumn;
    tvListNOTE: TcxGridDBColumn;
    tvListPERIODICITA: TcxGridDBColumn;
    tvListMINUTIPREVISTI: TcxGridDBColumn;
    tvListAGGNUOVOIMPIANTO: TcxGridDBColumn;
    QSINCHRO: TStringField;
    MainPageControl: TcxPageControl;
    TabOP: TcxTabSheet;
    TabOpDet: TcxTabSheet;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    RichEdit1: TRichEdit;
    DbeCodice: TDBEdit;
    DbeDescrizione: TDBEdit;
    DbePeriodicita: TcxDBComboBox;
    DbeMinutiPrevisti: TDBEdit;
    PanelGruppo2: TPanel;
    Label6: TLabel;
    RichEdit2: TRichEdit;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    RichEdit3: TRichEdit;
    cxDBMemo1: TcxDBMemo;
    PanelOP: TPanel;
    Bevel18: TBevel;
    GridOPDet: TcxGrid;
    btvOPDet: TcxGridDBBandedTableView;
    btvOPDetIDOP: TcxGridDBBandedColumn;
    btvOPDetDESCRIZIONE: TcxGridDBBandedColumn;
    btvOPDetIDAPPARECCHIOPRAT: TcxGridDBBandedColumn;
    btvOPDetMINUTIPREVISTI: TcxGridDBBandedColumn;
    btvOPDetPERIODICITA: TcxGridDBBandedColumn;
    btvOPDetULTIMA: TcxGridDBBandedColumn;
    btvOPDetPROSSIMA: TcxGridDBBandedColumn;
    btvOPDetNOTE: TcxGridDBBandedColumn;
    btvOPDetID: TcxGridDBBandedColumn;
    btvOPDetIDPRATICA: TcxGridDBBandedColumn;
    lvOPDet: TcxGridLevel;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    RichEdit4: TRichEdit;
    LabelTitoloAggApparecchio1: TLabel;
    dbeAggApparecchio1: TcxDBComboBox;
    LabelTitoloAggApparecchio2: TLabel;
    dbeAggApparecchio2: TcxDBComboBox;
    LabelTitoloAggApparecchio3: TLabel;
    dbeAggApparecchio3: TcxDBComboBox;
    LabelTitoloAggApparecchio4: TLabel;
    dbeAggApparecchio4: TcxDBComboBox;
    LabelTitoloAggApparecchio5: TLabel;
    dbeAggApparecchio5: TcxDBComboBox;
    LabelTitoloAggApparecchio6: TLabel;
    dbeAggApparecchio6: TcxDBComboBox;
    LabelTitoloAggApparecchio7: TLabel;
    dbeAggApparecchio7: TcxDBComboBox;
    LabelTitoloAggApparecchio8: TLabel;
    dbeAggApparecchio8: TcxDBComboBox;
    LabelTitoloAggApparecchio9: TLabel;
    dbeAggApparecchio9: TcxDBComboBox;
    LabelTitoloAggApparecchio10: TLabel;
    dbeAggApparecchio10: TcxDBComboBox;
    QAUTOLOAD1: TStringField;
    QAUTOLOAD2: TStringField;
    QAUTOLOAD3: TStringField;
    QAUTOLOAD4: TStringField;
    QAUTOLOAD5: TStringField;
    QAUTOLOAD6: TStringField;
    QAUTOLOAD7: TStringField;
    QAUTOLOAD8: TStringField;
    QAUTOLOAD9: TStringField;
    QAUTOLOAD10: TStringField;
    QPRZUNIT: TIBOFloatField;
    QGG_AUTOSEL: TSmallintField;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    QTIPO: TStringField;
    dbeApplicabile: TcxDBCheckComboBox;
    dbeAggAutoOP: TcxDBRadioGroup;
    ShapeAggApp1: TShape;
    ShapeAggApp2: TShape;
    LabelTitoloAggApparecchi: TLabel;
    ShapeAggApp4: TShape;
    ShapeAggApp3: TShape;
    Panel1: TPanel;
    Label8: TLabel;
    tvListAUTOLOAD1: TcxGridDBColumn;
    tvListAUTOLOAD2: TcxGridDBColumn;
    tvListAUTOLOAD3: TcxGridDBColumn;
    tvListAUTOLOAD4: TcxGridDBColumn;
    tvListAUTOLOAD5: TcxGridDBColumn;
    tvListAUTOLOAD6: TcxGridDBColumn;
    tvListAUTOLOAD7: TcxGridDBColumn;
    tvListAUTOLOAD8: TcxGridDBColumn;
    tvListAUTOLOAD9: TcxGridDBColumn;
    tvListAUTOLOAD10: TcxGridDBColumn;
    tvListPRZUNIT: TcxGridDBColumn;
    tvListGG_AUTOSEL: TcxGridDBColumn;
    tvListTIPO: TcxGridDBColumn;
    Button1: TButton;
    Panel11: TPanel;
    sbAggiungiOpTutti: TSpeedButton;
    spAddOpToImpianti: TIBOStoredProc;
    N1: TMenuItem;
    Aggiungitutteleoperazionipianificateatuttigliimpianti1: TMenuItem;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    QINABBONAMENTO: TStringField;
    QADDEBITA: TStringField;
    tvListADDEBITA: TcxGridDBColumn;
    tvListINABBONAMENTO: TcxGridDBColumn;
    Label7: TLabel;
    dbePrezzoUnitario: TcxDBCurrencyEdit;
    Label9: TLabel;
    dbeSconto1: TcxDBCurrencyEdit;
    dbeSconto2: TcxDBCurrencyEdit;
    Label10: TLabel;
    dbeSconto3: TcxDBCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    dbePrzUnitNetto: TcxDBCurrencyEdit;
    Label13: TLabel;
    dbeCodiceIVA: TcxDBLookupComboBox;
    Label14: TLabel;
    dbePrzUnitNettoIvaComp: TcxDBCurrencyEdit;
    QSCONTO1: TIBOFloatField;
    QSCONTO2: TIBOFloatField;
    QSCONTO3: TIBOFloatField;
    QPRZUNITNETTO: TIBOFloatField;
    QCODICEIVA: TIntegerField;
    QPRZUNITIVACOMP: TIBOFloatField;
    QPRZUNITNETTOIVACOMP: TIBOFloatField;
    QSYSTEM: TStringField;
    QALIQUOTAIVA: TFloatField;
    QCOPIE: TIntegerField;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label15: TLabel;
    QryIva: TIBOQuery;
    DSIva: TDataSource;
    QryIvaCODICEIVA: TIntegerField;
    QryIvaDESCRIZIONEIVA: TStringField;
    QryIvaALIQUOTAIVA: TIBOFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbePeriodicitaPropertiesInitPopup(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject); override;
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure cxDBRadioGroup1PropertiesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbAggiungiOpTuttiClick(Sender: TObject);
    procedure Aggiungitutteleoperazionipianificateatuttigliimpianti1Click(
      Sender: TObject);
    procedure AggiungiOpAttualePerTuttiGliImpianti(Silent:Boolean);
    procedure AggiungiTutteLeOpPerTuttiGliImpianti(Silent: Boolean);
    procedure QPRZUNITValidate(Sender: TField);
    procedure QPRZUNITNETTOIVACOMPValidate(Sender: TField);
  private
    fCampoPerFiltroSelezione: String;
    fIdApparecchio: Integer;
    fCalcoloInCorso: Boolean;
    procedure SetCampoPerFiltroSelezione(const Value: String);
    procedure EnableAggApparecchio(Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property CampoPerFiltroSelezione:String read fCampoPerFiltroSelezione write SetCampoPerFiltroSelezione;
    property IdApparecchio:Integer read fIdApparecchio write fIdApparecchio;
  end;

var
  OperazioniPianificateForm: TOperazioniPianificateForm;

implementation

uses DataModule1, FormPratica;

{$R *.dfm}

procedure TOperazioniPianificateForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  OperazioniPianificateForm := nil;
end;

procedure TOperazioniPianificateForm.DbePeriodicitaPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
   S : TcxDBComboBox;
begin
   // S punta al chiamante
   S := (Sender as TcxDBComboBox);
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(' + S.DataBinding.Field.FieldName + ') FROM OP');
      Qry.Open;
      S.Properties.Items.Clear;
      while not Qry.Eof do begin
         S.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TOperazioniPianificateForm.tvListDblClick(Sender: TObject);
begin
  inherited;
  // Se è in modalità archivio esce subito
  if Self.DblClickMode = DblClickModeArchive then Exit;

  // ===========================================================================
  // Se invece è in modalità di selezione...
  // ---------------------------------------------------------------------------
  // RIGO OPERAZIONI PIANIFICATE IN PRATICA
  if Self.CallerCode = 1 then begin
    PraticaForm.NuovoRigoOP(QCODICE.AsString, AM_Append, IdApparecchio);

  end;
  // ===========================================================================

  // Chiude la form per formare alla form chiamante
  Self.Close;
end;

procedure TOperazioniPianificateForm.SetCampoPerFiltroSelezione(
  const Value: String);
begin
  fCampoPerFiltroSelezione := Value;
  // Se viene impostato un nome campo per filtrare solo le operazioni
  //  selezionabili da uno specifico tipo di impianto...
  if Trim(Value) <> '' then begin
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM OP WHERE TIPO LIKE ' + QuotedStr('%'+Value+'%'));
  // Altrimenti le visualizza tutte
  end else begin
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM OP');
  end;
end;

procedure TOperazioniPianificateForm.FormShow(Sender: TObject);
begin
  inherited;
  TabOpDet.TabVisible := False;
  //  Se siamo in modalità di selezione fa sparire alcune colonne che non servono
  if DblClickMode = DblClickModeSelection then begin
    tvListAGGNUOVOIMPIANTO.Visible := False;
  end;
  // Apre la auery di lookup per le aliquote iva
  QryIva.Open;
end;

procedure TOperazioniPianificateForm.RxSpeedButtonUscitaClick(
  Sender: TObject);
begin
  inherited;
  // Se stiamo tornando indietro dall'anagrafica all'elenco...
  if not PanelGriglia.Visible then begin
    ClientArea.VertScrollBar.Range := 0;
    // Riattiva il pulsante ResetQuery
    RxSpeedButtonResetQuery.Enabled := True;
  end;
end;

procedure TOperazioniPianificateForm.RxSpeedButtonVisualizzaClick(
  Sender: TObject);
begin
  inherited;
  // Attiva lo scrolling
  ClientArea.VertScrollBar.Range := PanelGruppo4.Top + PanelGruppo4.Height + 50;
  // Disattiva il pulsante ResetQuery
  RxSpeedButtonResetQuery.Enabled := False;
end;

procedure TOperazioniPianificateForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  // Inizializzazione
  IdApparecchio := -1;
  fCalcoloInCorso := False;
  // Disabilita lo scrolling
  ClientArea.VertScrollBar.Range := 0;

  for i := 0 to dbeApplicabile.Properties.Items.Count -1 do begin
    (tvListTIPO.Properties as TcxCheckComboBoxProperties).Assign(dbeApplicabile.Properties);
//    (tvListTIPO.Properties as TcxCheckComboBoxProperties).Items.AddCheckItem((dbeApplicabile.Properties.Items[i] as TcxCheckComboBoxItem));
  end;
end;

procedure TOperazioniPianificateForm.RxSpeedButtonNuovoClick(
  Sender: TObject);
begin
  inherited;
  // Defaultizza alcuni valori
  QAGGNUOVOIMPIANTO.Value := 'N';
  QGG_AUTOSEL.Value       := 60;
  QCODICEIVA.Value        := 1;
  QADDEBITA.Value         := 'T';
  QINABBONAMENTO.Value    := 'F';
  QCOPIE.Value            := DM1.TableProgressiviDEFAULTALLEGATIFGCOPIE.Value;
end;

// Abilita/Disabilita la parte che indica a quale tipo di apparecchio aggiungere l'operazione pianificata
procedure TOperazioniPianificateForm.EnableAggApparecchio(Value:Boolean);
var
  ShapeColor: TColor;
begin
  // Etichette
  LabelTitoloAggApparecchi.Enabled    := Value;
  LabelTitoloAggApparecchio1.Enabled  := Value;
  LabelTitoloAggApparecchio2.Enabled  := Value;
  LabelTitoloAggApparecchio3.Enabled  := Value;
  LabelTitoloAggApparecchio4.Enabled  := Value;
  LabelTitoloAggApparecchio5.Enabled  := Value;
  LabelTitoloAggApparecchio6.Enabled  := Value;
  LabelTitoloAggApparecchio7.Enabled  := Value;
  LabelTitoloAggApparecchio8.Enabled  := Value;
  LabelTitoloAggApparecchio9.Enabled  := Value;
  LabelTitoloAggApparecchio10.Enabled := Value;
  // Campi
  dbeAggApparecchio1.Enabled    := Value;
  dbeAggApparecchio2.Enabled    := Value;
  dbeAggApparecchio3.Enabled    := Value;
  dbeAggApparecchio4.Enabled    := Value;
  dbeAggApparecchio5.Enabled    := Value;
  dbeAggApparecchio6.Enabled    := Value;
  dbeAggApparecchio7.Enabled    := Value;
  dbeAggApparecchio8.Enabled    := Value;
  dbeAggApparecchio9.Enabled    := Value;
  dbeAggApparecchio10.Enabled   := Value;
  // Shape
  if Value then ShapeColor := clBlack else ShapeColor := clGray;
  ShapeAggApp1.Pen.Color := ShapeColor;
  ShapeAggApp2.Pen.Color := ShapeColor;
  ShapeAggApp3.Pen.Color := ShapeColor;
  ShapeAggApp4.Pen.Color := ShapeColor;
end;

procedure TOperazioniPianificateForm.cxDBRadioGroup1PropertiesChange(
  Sender: TObject);
begin
  inherited;
  EnableAggApparecchio(dbeAggAutoOP.ItemIndex = 2);
end;

procedure TOperazioniPianificateForm.Button1Click(Sender: TObject);
var
  i: Integer;
  TmpStr: String;
begin
  inherited;
  TmpStr := 'Start:';
  for i := 0 to dbeApplicabile.Properties.Items.Count -1 do begin
    if dbeApplicabile.GetItemState(i) = cbsChecked
    then TmpStr := TmpStr + #13 + dbeApplicabile.Properties.Items[i].Description;
  end;
  ShowMessage(TmpStr);
end;

procedure TOperazioniPianificateForm.sbAggiungiOpTuttiClick(Sender: TObject);
begin
  inherited;
  AggiungiOpAttualePerTuttiGliImpianti(False);
end;

procedure TOperazioniPianificateForm.Aggiungitutteleoperazionipianificateatuttigliimpianti1Click(
  Sender: TObject);
begin
  inherited;
  AggiungiTutteLeOpPerTuttiGliImpianti(False);
end;

// Procedure che aggiunge tutte le OP a tutti gli impianti e/o apparecchi interessati
procedure TOperazioniPianificateForm.AggiungiTutteLeOpPerTuttiGliImpianti(Silent:Boolean);
begin
  inherited;
  // Conferme (se non è silent)
  if not Silent then begin
    if (DM1.Messaggi('Operazioni Pianificate', 'Aggiungere tutte le O.P. a tutti gli impianti esistenti?', 'NB: Questa procedura aggiungerà le O.P. a tutti gli impianti e/o apparecchi compatibili.', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;
    if (DM1.Messaggi('Operazioni Pianificate', 'Sicuro?', '', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;
  end;
  try
    // Si posiziona all'inizio del dataset
    Q.First;
    // Cicla per tutte le operazioni pianificate presenti
    while not Q.Eof do begin
      // Per sicurezza
      Application.ProcessMessages;
      // Avvia la creazione dell'operazione pianificata attuale su tutti gli impianti interessati
      AggiungiOpAttualePerTuttiGliImpianti(True);
      // Avanti il prossimo
      Q.Next;
    end;
  finally
    // Fine operazioni
    if not Silent then DM1.Messaggi('Levante', 'Operazione terminata.', '', [mbOK], 0, nil);
  end;
end;

// Procedure che aggiunge l'OP attuale a tutti gli impianti e/o apparecchi interessati
procedure TOperazioniPianificateForm.AggiungiOpAttualePerTuttiGliImpianti(Silent:Boolean);
var
  i, ii: Integer;
  TipoImpianto, TipoApparecchio, AutoloadFieldName: String;
begin
  inherited;
  // L'OP deve essere impostata come generica per l'impianto oppure specifica per apparecchio
  if (QAGGNUOVOIMPIANTO.AsString <> 'I') and (QAGGNUOVOIMPIANTO.AsString <> 'A') then begin
    if not Silent then DM1.Messaggi('Levante', 'L''operazione pianificata deve essere impostata come generica per l''impianto oppure specifica per apparecchio.'#13#13'Operazione annullata!', '', [mbOk], 0, nil);
    Exit;
  end;
  // Conferme (se non è silent)
  if not Silent then begin
    if (DM1.Messaggi('Operazioni Pianificate', 'Aggiungere l''O.P. a tutti gli impianti esistenti?', 'NB: Questa procedura aggiungerà l''O.P. a tutti gli impianti e/o apparecchi compatibili con le impostazioni dell''O.P. stessa.', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;
    if (DM1.Messaggi('Operazioni Pianificate', 'Sicuro?', '', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;
  end;

  try

    // Cicla per tutte le tipologie di impianto elencate nell'apposito controllo della form con il quale
    //  si indicano i tipi di impianto ai quali l'OP è destinata.
    for i := 0 to dbeApplicabile.Properties.Items.Count -1 do begin
      // Se il tipo di impianto attuale è selezionato...
      if (dbeApplicabile.GetItemState(i) = cbsChecked) then begin
        // Estrae il Tipo di impianto
        TipoImpianto := dbeApplicabile.Properties.Items[i].Description;
        // Se è indicato che l'OP attuale è generica per impianto provvede ad aggiungerla come tale
        //  al tipo di impianto attuale.
        if QAGGNUOVOIMPIANTO.AsString = 'I' then begin
          DM1.ShowWait('Aggiungo O.P.', 'O.P.: "' + QDESCRIZIONE.AsString + ' (' + QCODICE.AsString + ')'#13'Tipo impianto: "' + TipoImpianto + '"');
          // Imposta la Stored Procedure e la esegue
          spAddOpToImpianti.Prepare;
          spAddOpToImpianti.Params.ParamByName('IDOP').AsString := QCODICE.AsString;
          spAddOpToImpianti.Params.ParamByName('TIPOIMPIANTO').AsString := TipoImpianto;
          spAddOpToImpianti.Params.ParamByName('TIPOAPPARECCHIO').AsString := '';
          spAddOpToImpianti.ExecProc;
        // Se invece è indicato che l'OP attuale è specifica per apparecchio provvede ad aggiungerla
        //  come tale ai singoli apparecchi in base anche al tipo di apparecchio oltre che al tipo di impianto.
        end else if QAGGNUOVOIMPIANTO.AsString = 'A' then begin
          // Cicla per tutti i 10 campi AUTOLOAD1..10 che indica a quali tipi ai apparecchio si applica l'OP attuale
          for ii := 1 to 10 do begin
            // Calcola il nome del campo AUTOLOAD attuale
            AutoloadFieldName := 'AUTOLOAD' + IntToStr(ii);
            // Estrae il tipo di apparecchio attuale
            TipoApparecchio := Trim(Q.FieldByName(AutoloadFieldName).AsString);
            // Se il tipo di apparecchio (AUTOLOAD) attuale è specificato...
            if TipoApparecchio <> '' then begin
              DM1.ShowWait('Aggiungo O.P.', 'O.P.: "' + QDESCRIZIONE.AsString + ' (' + QCODICE.AsString + ')'#13'Tipo impianto: "' + TipoImpianto + '"'#13'Tipo apparecchio: "' + TipoApparecchio + '"');
              // Imposta la Stored Procedure e la esegue
              spAddOpToImpianti.Prepare;
              spAddOpToImpianti.Params.ParamByName('IDOP').AsString := QCODICE.AsString;
              spAddOpToImpianti.Params.ParamByName('TIPOIMPIANTO').AsString := TipoImpianto;
              spAddOpToImpianti.Params.ParamByName('TIPOAPPARECCHIO').AsString := TipoApparecchio;
              spAddOpToImpianti.ExecProc;
            end;
          end;
        end;
      end;
    end;

  finally
    DM1.CloseWait;
    if not Silent then DM1.Messaggi('Levante', 'Operazione terminata.', '', [mbOK], 0, nil);
  end;
end;





procedure TOperazioniPianificateForm.QPRZUNITValidate(Sender: TField);
begin
  inherited;
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il prezzo netto scontato
    QPRZUNITNETTO.Value := DM1.CalcolaImportoScontato(QPRZUNIT.AsFloat, QSCONTO1.AsFloat, QSCONTO2.AsFloat, QSCONTO3.AsFloat, DM1.DecMicroPrz);
    // Calcola il prezzo lordo iva compresa
    QPRZUNITIVACOMP.Value := DM1.Arrotonda(    QPRZUNIT.AsFloat * ((100+QALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
    // Calcola il netto iva compresa
    QPRZUNITNETTOIVACOMP.Value := DM1.Arrotonda(    QPRZUNITNETTO.AsFloat * ((100+QALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

procedure TOperazioniPianificateForm.QPRZUNITNETTOIVACOMPValidate(
  Sender: TField);
begin
  inherited;
  // Se non siamo già in fase di calcolo
  if fCalcoloInCorso then Exit;
  // Imposta il flag che indica che siamo in fase di calcolo
  fCalcoloInCorso := True;
  try
    // Ricalcola il lordo IVA compresa considerando tutti gli sconti = 0
    QPRZUNIT.Value      := DM1.Arrotonda(    QPRZUNITNETTOIVACOMP.AsFloat / ((100 + QALIQUOTAIVA.AsFloat) / 100)   , DM1.DecMicroPrz);
    QSCONTO1.Value      := 0;
    QSCONTO2.Value      := 0;
    QSCONTO3.Value      := 0;
    QPRZUNITNETTO.Value := QPRZUNIT.AsFloat;
    // Anche il lordi IVA compresa
    QPRZUNITIVACOMP.Value := QPRZUNITNETTOIVACOMP.AsFloat;
  finally
    // Ripristina il flag di calcolo in corso
    fCalcoloInCorso := False;
  end;
end;

end.
