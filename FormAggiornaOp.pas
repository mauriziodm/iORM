unit FormAggiornaOp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, cxStyles,
  cxCustomData, cxGraphics,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxClasses, cxGridLevel, cxGrid, StdCtrls, Buttons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DB, cxCheckBox,
  IB_Components, cxRadioGroup, ExtCtrls, cxDBLookupComboBox, Menus,
  cxLookAndFeelPainters, cxButtons, cxFilter, cxData, cxDataStorage,
  cxLookAndFeels, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxDateRanges, dxScrollbarAnnotations;

type
  TAggiornaOpForm = class(TForm)
    cxLabel1: TcxLabel;
    lvOP: TcxGridLevel;
    GridOP: TcxGrid;
    btvOP: TcxGridBandedTableView;
    btvOPIDPRATICA: TcxGridBandedColumn;
    btvOPIDOPPRATICA: TcxGridBandedColumn;
    btvOPIDOP: TcxGridBandedColumn;
    btvOPDESCRIZIONE: TcxGridBandedColumn;
    btvOPDAEFFETTUARE: TcxGridBandedColumn;
    btvOPEFFETTUATA: TcxGridBandedColumn;
    btvOPMINUTIPREVISTI: TcxGridBandedColumn;
    btvOPPERIODICITA: TcxGridBandedColumn;
    btvOPULTIMA: TcxGridBandedColumn;
    btvOPPROSSIMA: TcxGridBandedColumn;
    btvOPNEXT_ULTIMA: TcxGridBandedColumn;
    btvOPNEXT_PROSSIMA: TcxGridBandedColumn;
    btvOPIDAPPARECCHIOPRAT: TcxGridBandedColumn;
    dbeProxVisita: TcxDateEdit;
    BtnSI: TBitBtn;
    BtnAnnulla: TBitBtn;
    Label2: TLabel;
    BtnNO: TBitBtn;
    rbProxVisita_OP: TcxRadioButton;
    rbProxVisita_Impianto: TcxRadioButton;
    rbProxVisita_Contratto: TcxRadioButton;
    rbProxVisita_Altro: TcxRadioButton;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape5: TShape;
    SourcePratApp: TDataSource;
    btvOPTIPOAPPARECCHIO: TcxGridBandedColumn;
    btvOPCOSTRUTTORE: TcxGridBandedColumn;
    btvOPMODELLO: TcxGridBandedColumn;
    btvOPMATRICOLA: TcxGridBandedColumn;
    btvOPUBICAZIONE: TcxGridBandedColumn;
    rbProxVisita_NonAggiornare: TcxRadioButton;
    cxButton1: TcxButton;
    cbTutteLeOP: TcxCheckBox;
    procedure btvOPULTIMAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure BtnSIClick(Sender: TObject);
    procedure BtnAnnullaClick(Sender: TObject);
    procedure BtnNOClick(Sender: TObject);
    procedure dbeProxVisitaPropertiesChange(Sender: TObject);
    procedure rbProxVisita_AltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btvOPCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure btvOPCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cbTutteLeOPPropertiesChange(Sender: TObject);
    procedure btvOPPERIODICITAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    // Flag che indica se siamo in modalità di chiusura automatica ell'impegno
    FChiusuraAutomatica: Boolean;
    fPratApparecchiDataSet: TDataSet;
    FNearestScadOP: TDateTime;
    FCalcProxVisitaConsideraSoloOpFatte: Boolean;

    procedure CaricaOP;
    procedure SetFilterOP;
    procedure CaricaParametri;
    procedure AggiornaOpPraticaFatte;
    procedure AggiornaSingolaOpPratica(IdOpPratica: Integer;
      DataUltima: TDateTime; Periodicita: Integer;
      ForzaDataProssima: TDateTime = 0);
    procedure AggiornaAnagraficaImpianto;
    procedure CalcolaElencoDateProxVisita;
    procedure SetDefaultDataProxVisita;
    procedure SetPratApparecchiDataSet(const Value: TDataSet);
    function GetDataRiferimentoPerCalcoloProxRicorrenza: TDateTime;
    procedure CheckDataOraIntervento;
    function GetRifImpianto: String;
    { Private declarations }
  public
    { Public declarations }
    ImpDataSet: TDataSet;
    SourceDataSet: TDataSet;
    PratDataSet: TDataSet;
    procedure Prepare(const AChiusuraAutomatica: Boolean);
    // Proprietà che punta al Dataset dei dati degli apparecchi
    property PratApparecchiDataSet: TDataSet read fPratApparecchiDataSet write SetPratApparecchiDataSet;
  end;

var
  AggiornaOpForm: TAggiornaOpForm;

implementation

uses DataModule1, FormImpegni, DataModuleStyles, DataModule2, System.IniFiles;

{$R *.dfm}

// Procedure che carica sulla griglia le operazioni pianificate da aggiornare
procedure TAggiornaOpForm.CaricaOP;
var
  PrecPos: TBookmark;
  DC: TcxCustomDataController;
  RI: Integer;
  LDataDiRiferimento: TDateTime;
  LOpFatta: Boolean;
  procedure CheckForProxScadOP;
  var
    LLTmpScad: TDateTime;
  begin
    LLTmpScad := 0;
    // FCalcProxVisitaConsideraSoloOpFatte determina se, nel calcolo della prossima visita,
    // debbano essere prese in considerazione solo le OP "fatte" oppure tutte
    if LOpFatta or not FCalcProxVisitaConsideraSoloOpFatte then
    begin
      // Se la OP ha la periodicità <> 0 allora considera come ProxEntro la data
      // dell'intervento attuale + la periodicità della OP stessa...
      // Se invece la periodicità = 0 significa che è una OP con una gestione del
      // ProxEntro non automatica quindi la considera solo se NON FATTA, altrimenti
      // se facesse come le altre rimetterebbe come ProxVisita entro la data dell'intervento
      // stesso (così va bene anche per le garanzie di Pianeta Ascensori)
      if LOpFatta and (SourceDataSet.FieldByName('PERIODICITA').AsInteger <> 0)
      then
        LLTmpScad := LDataDiRiferimento + SourceDataSet.FieldByName('PERIODICITA').AsInteger
      else if not LOpFatta then
        LLTmpScad := SourceDataSet.FieldByName('PROSSIMA').AsDateTime;
      // Se la data calcolata per la OP corrente è precedente allora diventa la nuova data
      // ProxEntro relativo alle OP
      if (LLTmpScad > 0) and ((LLTmpScad < FNearestScadOP) or (FNearestScadOP = 0)) then
        FNearestScadOP := LLTmpScad;
    end;
  end;
  procedure SetProxScadOP;
  begin
    // Aggiorna la data di prox scadenza relativa alle OP
    // NB: La proprietà Tag  del radio button contiene la parte intera
    // delle data calcolata e viene usato per fare poi il confronto
    // e decidere quale data è selezionata di default.
    if FNearestScadOP > 0 then
    begin
      rbProxVisita_OP.Tag := Trunc(FNearestScadOP);
      rbProxVisita_OP.Caption := FormatDateTime('dd/mm/yyyy', rbProxVisita_OP.Tag);
      rbProxVisita_OP.Enabled := True;
    end
    else
    begin
      rbProxVisita_OP.Tag := 0;
      rbProxVisita_OP.Caption := '- - -';
      rbProxVisita_OP.Enabled := False;
    end;
  end;

begin
  // Inizializzazione
  LDataDiRiferimento := GetDataRiferimentoPerCalcoloProxRicorrenza;
  FNearestScadOP := 0;
  DC := btvOP.DataController;
  PrecPos := SourceDataSet.GetBookmark;
  try
    SourceDataSet.DisableControls;
    SourceDataSet.First;
    // Cicla per tutte le OP e le carica nella griglia locale
    while not SourceDataSet.Eof do
    begin
      // Per coodità
      LOpFatta := (SourceDataSet.FieldByName('EFFETTUATA').AsString = 'T');
      // Controlla se la OP corrente, considerando anche la periodicità se è una OP "fatta",
      // ha la scadenza (ProxEntro) più vicina tra tutte le OP per determinare le date da proporre
      // quale ProxVisita dell'impianto.
      CheckForProxScadOP;
      // Crea il nuovo record
      RI := DC.AppendRecord;
      // CArica i valori
      DC.Values[RI, btvOPIDPRATICA.Index] := SourceDataSet.FieldByName('IDPRATICA').AsInteger;
      DC.Values[RI, btvOPIDOPPRATICA.Index] := SourceDataSet.FieldByName('IDOPPRATICA').AsInteger;
      DC.Values[RI, btvOPIDOP.Index] := SourceDataSet.FieldByName('IDOP').AsString;
      DC.Values[RI, btvOPDESCRIZIONE.Index] := SourceDataSet.FieldByName('DESCRIZIONE').AsString;
      DC.Values[RI, btvOPDAEFFETTUARE.Index] := SourceDataSet.FieldByName('DAEFFETTUARE').AsString;
      DC.Values[RI, btvOPEFFETTUATA.Index] := SourceDataSet.FieldByName('EFFETTUATA').AsString;
      DC.Values[RI, btvOPMINUTIPREVISTI.Index] := SourceDataSet.FieldByName('MINUTIPREVISTI').AsInteger;
      DC.Values[RI, btvOPPERIODICITA.Index] := SourceDataSet.FieldByName('PERIODICITA').AsInteger;
      DC.Values[RI, btvOPULTIMA.Index] := SourceDataSet.FieldByName('ULTIMA').AsDateTime;
      DC.Values[RI, btvOPPROSSIMA.Index] := SourceDataSet.FieldByName('PROSSIMA').AsDateTime;
      DC.Values[RI, btvOPNEXT_ULTIMA.Index] := SourceDataSet.FieldByName('ULTIMA').AsDateTime;
      DC.Values[RI, btvOPNEXT_PROSSIMA.Index] := SourceDataSet.FieldByName('PROSSIMA').AsDateTime;
      DC.Values[RI, btvOPIDAPPARECCHIOPRAT.Index] := SourceDataSet.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
      DC.Values[RI, btvOPTIPOAPPARECCHIO.Index] := SourceDataSet.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
      DC.Values[RI, btvOPCOSTRUTTORE.Index] := SourceDataSet.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
      DC.Values[RI, btvOPMODELLO.Index] := SourceDataSet.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
      DC.Values[RI, btvOPMATRICOLA.Index] := SourceDataSet.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
      DC.Values[RI, btvOPUBICAZIONE.Index] := SourceDataSet.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
      // Solo se è una OP eseguita
      if LOpFatta then
      begin
        // Calcola il prossimo intervento
        DC.Values[RI, btvOPNEXT_ULTIMA.Index] := LDataDiRiferimento;
        // Calcola la prox scadenza solo se la periodicità <> 0
        if SourceDataSet.FieldByName('PERIODICITA').AsInteger <> 0 then
          DC.Values[RI, btvOPNEXT_PROSSIMA.Index] := LDataDiRiferimento + SourceDataSet.FieldByName('PERIODICITA').AsInteger
        else
          DC.Values[RI, btvOPNEXT_PROSSIMA.Index] := 0;
      end;
      // Avanti il prossimo
      SourceDataSet.Next;
    end;
    // Aggiorna la data di prox scadenza relativa alle OP
    // NB: La proprietà Tag  del radio button contiene la parte intera
    // delle data calcolata e viene usato per fare poi il confronto
    // e decidere quale data è selezionata di default.
    SetProxScadOP;
    // CAlcola anche le date di prox. visita da proporre all'utente in base
    // alla periodicità della scheda impianto e alla scademza del contratto
    CalcolaElencoDateProxVisita;
    // Determina quale data, tra quewlle calcolate dalla riga precedente, è selezionata di default
    SetDefaultDataProxVisita;
  finally
    SourceDataSet.GotoBookmark(PrecPos);
    SourceDataSet.FreeBookmark(PrecPos);
    SourceDataSet.EnableControls;
  end;
end;

procedure TAggiornaOpForm.CaricaParametri;
var
  LO: TMemIniFile;
begin
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    FCalcProxVisitaConsideraSoloOpFatte := LO.ReadBool('Appuntamenti',
      'CalcProxVisitaConsideraSoloOpFatte', True)
  finally
    LO.Free;
  end;
end;

// Procedure che imposta le date previste per la prox. visita
// NB: La data relativa alle OP viene calcolata nella procedure "CaricaOP"
procedure TAggiornaOpForm.CalcolaElencoDateProxVisita;
var
  LDataDiRiferimento: TDateTime;
begin
  CheckDataOraIntervento;
  // Per comodità
  LDataDiRiferimento := GetDataRiferimentoPerCalcoloProxRicorrenza;
  // Se la periodicità della ProxVisita impianto è inserita calcola la prox visita in
  // base a questo valore
  // NB: La proprietà Tag  del radio button contiene la parte intera
  // delle data calcolata e viene usato per fare poi il confronto
  // e decidere quale data è selezionata di default.
  if PratDataSet.FieldByName('PERIODICITA').AsInteger <> 0 then
  begin
    rbProxVisita_Impianto.Tag := Trunc(LDataDiRiferimento + PratDataSet.FieldByName('PERIODICITA').AsInteger);
    rbProxVisita_Impianto.Caption := FormatDateTime('dd/mm/yyyy', rbProxVisita_Impianto.Tag);
    rbProxVisita_Impianto.Enabled := True;
  end
  else
  begin
    rbProxVisita_Impianto.Tag := 0;
    rbProxVisita_Impianto.Caption := '- - -';
    rbProxVisita_Impianto.Enabled := False;
  end;
  // Se il campo che indica la data di fine contratto è inserita...
  // NB: La proprietà Tag  del radio button contiene la parte intera
  // delle data calcolata e viene usato per fare poi il confronto
  // e decidere quale data è selezionata di default.
  if (not PratDataSet.FieldByName('CONTRATTO_VALIDITA_FINE').IsNull) and
    (PratDataSet.FieldByName('CONTRATTO_VALIDITA_FINE').AsDateTime <> 0) and
    (PratDataSet.FieldByName('CONTRATTO_VALIDITA_FINE').AsDateTime <>
    StrToDate('01/01/1900')) then
  begin
    rbProxVisita_Contratto.Tag := Trunc(PratDataSet.FieldByName('CONTRATTO_VALIDITA_FINE').AsDateTime);
    rbProxVisita_Contratto.Caption := FormatDateTime('dd/mm/yyyy', rbProxVisita_Contratto.Tag);
    rbProxVisita_Contratto.Enabled := True;
  end
  else
  begin
    rbProxVisita_Contratto.Tag := 0;
    rbProxVisita_Contratto.Caption := '- - -';
    rbProxVisita_Contratto.Enabled := False;
  end;
end;

function TAggiornaOpForm.GetDataRiferimentoPerCalcoloProxRicorrenza: TDateTime;
begin
  // Se è selezionata la PROXVISITAENTRO dell'impianto ma questa è vuota allora usa cmq la DATAORAINTERVENTO
  if (PratDataSet.FieldByName('PRM_PROXVISITA_ADDPERIODSU').AsString = 'Data prevista visita prec.')
  and (not PratDataSet.FieldByName('PROXVISITAENTRO').IsNull) and (PratDataSet.FieldByName('PROXVISITAENTRO').AsDateTime <> 0) then
    Exit(PratDataSet.FieldByName('PROXVISITAENTRO').AsDateTime);
  // Se la DATAORAINTERVENTO è valida...
  if (not ImpDataSet.FieldByName('DATAORAINTERVENTO').IsNull) and (ImpDataSet.FieldByName('DATAORAINTERVENTO').AsDateTime <> 0) then
    Exit(ImpDataSet.FieldByName('DATAORAINTERVENTO').AsDateTime);
  // Altrimenti eccezione
  raise Exception.Create('La data di riferimento per il calcolo della prossima ricorrenza non è valida.');
end;

function TAggiornaOpForm.GetRifImpianto: String;
begin
  Result := Format('Impianto: %s (n° %s del %s)', [PratDataSet.FieldByName('DESCRIZIONE').AsString, PratDataSet.FieldByName('CODICE').AsInteger,
    PratDataSet.FieldByName('DATAAPERTURA').AsString]);
end;

procedure TAggiornaOpForm.Prepare(const AChiusuraAutomatica: Boolean);
begin
  FChiusuraAutomatica := AChiusuraAutomatica;
  // Carica i dati
  CaricaParametri;
  CaricaOP;
  SetFilterOP;
  // se siamo in chiusura automatica seleziona da solo
  if FChiusuraAutomatica then
    BtnSIClick(BtnSI);
end;

procedure TAggiornaOpForm.btvOPULTIMAGetDisplayText
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // Se il campo è 0 restituisce una stringa vuota altrimenti
  // mi visualizzava una data del 1899 perchè il valore del campo
  // Datetime = 0
  if (VarIsNull(ARecord.Values[Sender.Index])) or
    (ARecord.Values[Sender.Index] = 0) then
    AText := '- - -';
end;

// Procedure che esegue l'aggiornamento delle OP della pratica che sono state
// marcate ome effettuate.
procedure TAggiornaOpForm.AggiornaOpPraticaFatte;
var
  i: Integer;
  DC: TcxCustomDataController;
  LDataDiRiferimento: TDateTime;
begin
  // Inizializzazione
  LDataDiRiferimento := GetDataRiferimentoPerCalcoloProxRicorrenza;
  // Inizializzazione
  DC := btvOP.DataController;
  // Cicla per tutti i records e ne esegue l'aggiornamento
  for i := 0 to DC.RecordCount - 1 do
  begin
    if (DM1.NoNullStringValue(DC, i, btvOPEFFETTUATA.Index) = 'T')
    // and (DM1.NoNullIntValue(DC,i,btvOPPERIODICITA.Index) <> 0)
      and (DM1.NoNullIntValue(DC, i, btvOPIDOPPRATICA.Index) <> 0) then
      AggiornaSingolaOpPratica(DM1.NoNullIntValue(DC, i, btvOPIDOPPRATICA.
        Index), LDataDiRiferimento, DM1.NoNullIntValue(DC, i,
        btvOPPERIODICITA.Index));
  end;
end;

// Procedure che aggiorna l'anagrafica dell'impianto per impostatre la data della prox visita prevista
// e altro
procedure TAggiornaOpForm.AggiornaAnagraficaImpianto;
var
  Q: TIB_Cursor;
begin
  // Controlli
  if VarIsNull(dbeProxVisita.EditValue) or (dbeProxVisita.Date = 0) then
    raise Exception.Create('Data prossima visita prevista non valida.');
  if ImpDataSet.FieldByName('IDPRATICA').AsInteger = 0 then
    raise Exception.Create('Campo IDPRATICA non valido.');
  // Imposta la query che eseguirà l'operazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà i dati dell'operazione pianificata
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PRATICHE P SET');
    Q.SQL.Add('P.PROXVISITAENTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', dbeProxVisita.Date)));
    Q.SQL.Add('WHERE P.ID = ' + IntToStr(ImpDataSet.FieldByName('IDPRATICA')
      .AsInteger));
    // Esegue la query
    Q.ExecSQL;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;

// Procedura che effettua l'aggiornamento dell'operazione pianificata
procedure TAggiornaOpForm.AggiornaSingolaOpPratica(IdOpPratica: Integer;
  DataUltima: TDateTime; Periodicita: Integer;
  ForzaDataProssima: TDateTime = 0);
var
  Q: TIB_Cursor;
begin
  // Esegue alcuni controlli
  if IdOpPratica = 0 then
    raise Exception.Create('Campo "IdOpPratica" non valido.');
  if DataUltima = 0 then
    raise Exception.Create('Data ultima esecuzione O.P. non valida.');
  // Se il parametro "ForzaDataProssima" = 0 significa che l'utente non ha richiesto di impostare una
  // data di scadenza specifica e forzata, in questo caso la calcola automaticamente
  if (ForzaDataProssima = 0) and (Periodicita <> 0) then
    ForzaDataProssima := DataUltima + Periodicita;
  // Imposta la query che eseguirà l'operazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà i dati dell'operazione pianificata
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE OPPRATICA OPP SET');
    Q.SQL.Add('OPP.ULTIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DataUltima)) + ',');
    Q.SQL.Add('OPP.PROSSIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', ForzaDataProssima)) + ',');
    Q.SQL.Add('OPP.PERIODICITA = ' + IntToStr(Periodicita));
    Q.SQL.Add('WHERE OPP.ID = ' + IntToStr(IdOpPratica));
    // Esegue la query
    Q.ExecSQL;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;

procedure TAggiornaOpForm.BtnSIClick(Sender: TObject);
begin
  // Verifica la validità dell'IDPRATICA, altrimenti non può andare avanti
  if (ImpDataSet.FieldByName('IDPRATICA').AsInteger = 0) then
    raise Exception.Create('Campo IDPRATICA non valido.');
  // ---------------------------------------------------------------------------
  // Se l'utente ha scelto di aggiornare la data della prox. visita provvede a farlo
  if not rbProxVisita_NonAggiornare.Checked then
  begin
    // Verifica la correttezza della data impostata
    //  NB: Probabilmente questa riga non serve più
//    CheckDataOraIntervento;
    // Procedure che aggiorna l'anagrafica dell'impianto per impostatre la data della prox visita prevista
    // e altro
    AggiornaAnagraficaImpianto;
  end;
  // ---------------------------------------------------------------------------
  // Aggiorna la situazione delle operazioni pianificate
  // dell'impianto
  AggiornaOpPraticaFatte;
  // ---------------------------------------------------------------------------
  // Chiude la form
  ModalResult := mrYes;
end;

procedure TAggiornaOpForm.BtnAnnullaClick(Sender: TObject);
begin
  // Chiude la form
  ModalResult := mrAbort;
end;

procedure TAggiornaOpForm.BtnNOClick(Sender: TObject);
begin
  // Chiude la form
  ModalResult := mrNO;
end;

procedure TAggiornaOpForm.dbeProxVisitaPropertiesChange(Sender: TObject);
begin
  // Attiva o disattiva il controllo in base a quale voce è selezionata
  dbeProxVisita.Enabled := rbProxVisita_Altro.Checked;
end;

procedure TAggiornaOpForm.rbProxVisita_AltroClick(Sender: TObject);
begin
  // In base alla seleziona carica la data
  if (Sender as TcxRadioButton).Tag <> 0 then
    dbeProxVisita.Date := (Sender as TcxRadioButton).Tag;
  // Attiva o disattiva il controllo in base a quale voce è selezionata
  dbeProxVisitaPropertiesChange(nil);
end;

procedure TAggiornaOpForm.FormCreate(Sender: TObject);
begin
  Width := 741;
  Height := 600;
end;

procedure TAggiornaOpForm.btvOPCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[btvOPEFFETTUATA.Index] = 'T' then
  begin
    ACanvas.Font.Color := clBlack;
    ACanvas.Font.Style := [fsBold];
  end;

  if (AViewInfo.Item = btvOPNEXT_PROSSIMA) then
  begin
    ACanvas.Font.Size := 8; // Perchè il fotn predefinito sarebbe più piccolo
    if AViewInfo.GridRecord.Values[btvOPNEXT_PROSSIMA.Index] = FNearestScadOP
    then
      ACanvas.Font.Color := $000000C4;
  end;
end;

procedure TAggiornaOpForm.btvOPCustomDrawGroupCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
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
  if AViewInfo.Selected then
    CurrColor := Sender.Styles.Selection.Color
  else
    CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AViewInfo.Bounds, clWhite, CurrColor,
    30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Se questo grup non è relativo a nessun apparecchio lo disegna diverso
  if VarIsNull(AViewInfo.GridRecord.Values[btvOPIDAPPARECCHIOPRAT.Index]) or
    (AViewInfo.GridRecord.Values[btvOPIDAPPARECCHIOPRAT.Index] = 0) then
  begin
    TmpStr := 'Generiche per tutto l''impianto';
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignHCenter or cxAlignBottom);
    Exit;
  end;

  // Tipo apparecchio
  TmpStr := '   ' + Sender.DataController.DisplayTexts
    [AViewInfo.GridRecord.RecordIndex, btvOPTIPOAPPARECCHIO.Index] + ':';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Apparecchio
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,
    btvOPCOSTRUTTORE.Index] + '   ' + Sender.DataController.DisplayTexts
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
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,
    btvOPMATRICOLA.Index];
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
  TmpStr := Sender.DataController.DisplayTexts[AViewInfo.GridRecord.RecordIndex,
    btvOPUBICAZIONE.Index];
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
end;

procedure TAggiornaOpForm.btvOPPERIODICITAGetDisplayText
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if (VarIsNull(ARecord.Values[Sender.Index])) or
    (ARecord.Values[Sender.Index] = 0) then
    AText := '';
end;

procedure TAggiornaOpForm.SetDefaultDataProxVisita;
var
  LDataDiRiferimento: TDateTime;
  LDefaultProxVisitaInBaseA: String;
  procedure SetDefaultDataProxVisita_ByParam;
  begin
    // Se Prima OP a scadenza...
    if (LDefaultProxVisitaInBaseA = 'Prima OP a scadere') then
    begin
      if rbProxVisita_OP.Enabled then
      begin
        dbeProxVisita.Tag := rbProxVisita_OP.Tag;
        dbeProxVisita.Date := rbProxVisita_OP.Tag;
        rbProxVisita_OP.Checked := True;
      end
      else
        DM1.Messaggi('Levante', 'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13 +
          'Data "rbProxVisita_OP" non valida o periodicità non specificata.'#13#13 + GetRifImpianto,
          'NB: La procedura prosegue ma occorrerà verificare e correggere manualmente le date della prossima visita/OP', [mbOk], 0, nil);
    end
    else
    // Se ProxVisitaImpianto...
    if LDefaultProxVisitaInBaseA = 'Prox visita impianto' then
    begin
      if rbProxVisita_Impianto.Enabled then
      begin
        dbeProxVisita.Tag := rbProxVisita_Impianto.Tag;
        dbeProxVisita.Date := rbProxVisita_Impianto.Tag;
        rbProxVisita_Impianto.Checked := True;
      end
      else
        DM1.Messaggi('Levante', 'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13 +
          'Data "rbProxVisita_Impianto" non valida o periodicità non specificata.'#13#13 + GetRifImpianto,
          'NB: La procedura prosegue ma occorrerà verificare e correggere manualmente le date della prossima visita/OP', [mbOk], 0, nil);
    end
    else
    // Se scadenza contratto...
    if LDefaultProxVisitaInBaseA = 'Scadenza contratto' then
    begin
      if rbProxVisita_Contratto.Enabled then
      begin
        dbeProxVisita.Tag := rbProxVisita_Contratto.Tag;
        dbeProxVisita.Date := rbProxVisita_Contratto.Tag;
        rbProxVisita_Contratto.Checked := True;
      end
      else
        DM1.Messaggi('Levante', 'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13 +
          'Data "rbProxVisita_Contratto" non valida.'#13#13 + GetRifImpianto,
          'NB: La procedura prosegue ma occorrerà verificare e correggere manualmente le date della prossima visita/OP', [mbOk], 0, nil);
    end
    // Exception
    else
      raise Exception.Create('Valore di "LDefaultProxVisitaInBaseA" non valido.');
  end;
  procedure SetDefaultDataProxVisita_Auto;
  begin
    // Operazioni pianificate: Se la data calcolata è minore...
    if rbProxVisita_OP.Enabled and ((rbProxVisita_OP.Tag <= dbeProxVisita.Tag) or (dbeProxVisita.Tag = 0)) then
    begin
      dbeProxVisita.Tag := rbProxVisita_OP.Tag;
      dbeProxVisita.Date := rbProxVisita_OP.Tag;
      rbProxVisita_OP.Checked := True;
    end;
    // Periodicità impianto: Se la data calcolata è minore...
    if rbProxVisita_Impianto.Enabled and ((rbProxVisita_Impianto.Tag <= dbeProxVisita.Tag) or (dbeProxVisita.Tag = 0))
    then
    begin
      dbeProxVisita.Tag := rbProxVisita_Impianto.Tag;
      dbeProxVisita.Date := rbProxVisita_Impianto.Tag;
      rbProxVisita_Impianto.Checked := True;
    end;
    // Scadenza contratto: Se la data calcolata è minore...
    // NB: Per il momento la tolgo perchè potrebbe essere pericolosa in quanto la
    //      data di scadenza del contratto penso non venga quasi mai sempre tenuta aggiornata
    //      (tacito rinnovo) quindi selezionerebbe sempre quella.
//    if rbProxVisita_Contratto.Enabled and
//      ((rbProxVisita_Contratto.Tag <= dbeProxVisita.Tag) or
//      (dbeProxVisita.Tag = 0)) then
//    begin
//      dbeProxVisita.Tag := rbProxVisita_Contratto.Tag;
//      dbeProxVisita.Date := rbProxVisita_Contratto.Tag;
//      rbProxVisita_Contratto.Checked := True;
//    end;
  end;
begin
  LDataDiRiferimento := GetDataRiferimentoPerCalcoloProxRicorrenza;
  // Altra data (manuale)
  // Ovviamente non ha senzo specificare una data precedente allo stesso intervento
  dbeProxVisita.Properties.MinDate := LDataDiRiferimento;
  dbeProxVisita.Tag := 0;
  dbeProxVisita.Clear;
  // Parte con la data da specificare manualmente
  rbProxVisita_Altro.Checked := True;
  // IN base all'apposito parametro presente nell'impianto decide quale data, tra quelle presentate,
  //  sarà quella di default (per la data prox visita).
  LDefaultProxVisitaInBaseA := PratDataSet.FieldByName('PRM_PROXVISITA_INBASEA').AsString;
  if LDefaultProxVisitaInBaseA = 'Automatico' then
    SetDefaultDataProxVisita_Auto
  else
    SetDefaultDataProxVisita_ByParam;
end;

procedure TAggiornaOpForm.SetFilterOP;
var
  DC: TcxCustomDataController;
begin
  DC := btvOP.DataController;
  DC.Filter.BeginUpdate;
  try
    DC.Filter.Root.Clear;
    DC.Filter.Root.BoolOperatorKind := fboOr;
    DC.Filter.Root.AddItem(btvOPEFFETTUATA, foEqual, 'T', 'Fatta');
    DC.Filter.Root.AddItem(btvOPNEXT_PROSSIMA, foEqual, FNearestScadOP,
      'Prox.entro');
  finally
    DC.Filter.EndUpdate;
    DC.Filter.Active := not cbTutteLeOP.Checked;
  end;
end;

procedure TAggiornaOpForm.SetPratApparecchiDataSet(const Value: TDataSet);
begin
  fPratApparecchiDataSet := Value;
  SourcePratApp.DataSet := Value;
end;

procedure TAggiornaOpForm.cbTutteLeOPPropertiesChange(Sender: TObject);
begin
  btvOP.DataController.Filter.Active := not cbTutteLeOP.Checked;
end;

procedure TAggiornaOpForm.CheckDataOraIntervento;
begin
  if ImpDataSet.FieldByName('DATAORAINTERVENTO').IsNull or (ImpDataSet.FieldByName('DATAORAINTERVENTO').AsDateTime = 0) then
    raise Exception.Create('Campo DATAORAINTERVENTO non valido.');
end;

procedure TAggiornaOpForm.cxButton1Click(Sender: TObject);
begin
  // RIchiede ed esegue il rinnovo del contratto
  DM2.Contratto_Rinnova(ImpegnoForm.QryAssCONTRATTO_VALIDITA_FINE, ImpegnoForm.QryAssCONTRATTO_MESI_RINNOVO, ImpegnoForm.QryAssCONTRATTO_STATO,
    ImpegnoForm.QryAssCONTRATTO_DISDETTA_RICEVUTA);
  // Aggiorna le date che propone a video
  CalcolaElencoDateProxVisita;
end;

end.
