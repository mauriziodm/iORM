unit FormSelezionaImpianto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelLista, cxGraphics, 
  cxEdit, DB, cxDBData, IBODataset, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls,
  bmpPanel, Buttons, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  CheckLst, Mask, MAURI_SB, IB_Components, cxCalendar, cxCheckBox,
  cxCurrencyEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TSelezionaImpiantoForm = class(TModelListaForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    QTIPO: TStringField;
    QCODICE: TIntegerField;
    QDATAAPERTURA: TDateTimeField;
    QRAGIONESOCIALE: TStringField;
    QTELEFONO: TStringField;
    QCELLULARE: TStringField;
    QCOSTRUTTORE: TStringField;
    QMODELLO: TStringField;
    QDATAINSTALLAZIONE: TDateTimeField;
    QCOMUNEIMM: TStringField;
    QCAPIMM: TStringField;
    QABBONATO: TStringField;
    QTIPOCONTRATTO: TStringField;
    QIMPORTOCONTRATTO: TIBOFloatField;
    QTIPOIMPIANTO: TStringField;
    QPERIODICITA: TIntegerField;
    QBREVEDESCRIZIONECALDAIA: TStringField;
    QMATRICOLA: TStringField;
    QDATAULTIMAPULIZIA: TDateTimeField;
    QDATAULTIMAPROVACOMBUSTIONE: TDateTimeField;
    QPROSSIMOINTERVENTOPREVISTO: TDateTimeField;
    QDATAORAPROSSIMOAPPUNTAMENTO: TDateTimeField;
    QRAGSOCUT: TStringField;
    QSTATO: TStringField;
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
    BitBtnAssDal: TSpeedButtonRollOver;
    BitBtnAssAl: TSpeedButtonRollOver;
    StaticText32: TStaticText;
    StaticText29: TStaticText;
    AssAl: TMaskEdit;
    AssDal: TMaskEdit;
    StaticText20: TStaticText;
    FilterAbbonati: TCheckListBox;
    StaticText27: TStaticText;
    FilterInScadenza: TCheckListBox;
    StaticText28: TStaticText;
    FilterCostruttore: TcxComboBox;
    FilterModello: TcxComboBox;
    FilterLocalita: TcxComboBox;
    StaticText36: TStaticText;
    StaticText39: TStaticText;
    StaticText42: TStaticText;
    FilterTipoImpianto: TcxComboBox;
    FilterPeriodicita: TcxComboBox;
    StaticText23: TStaticText;
    FilterTipoData: TcxComboBox;
    FilterCAP: TcxComboBox;
    StaticText57: TStaticText;
    StaticText58: TStaticText;
    FilterIndirizzo: TEdit;
    FilterNumCivico: TEdit;
    StaticText69: TStaticText;
    FilterTipoContratto: TcxComboBox;
    tvQRAGIONESOCIALE: TcxGridDBColumn;
    tvQTELEFONO: TcxGridDBColumn;
    tvQCELLULARE: TcxGridDBColumn;
    tvQCOSTRUTTORE: TcxGridDBColumn;
    tvQMODELLO: TcxGridDBColumn;
    tvQDATAINSTALLAZIONE: TcxGridDBColumn;
    tvQCOMUNEIMM: TcxGridDBColumn;
    tvQCAPIMM: TcxGridDBColumn;
    tvQABBONATO: TcxGridDBColumn;
    tvQTIPOCONTRATTO: TcxGridDBColumn;
    tvQIMPORTOCONTRATTO: TcxGridDBColumn;
    tvQTIPOIMPIANTO: TcxGridDBColumn;
    tvQPERIODICITA: TcxGridDBColumn;
    tvQBREVEDESCRIZIONECALDAIA: TcxGridDBColumn;
    tvQMATRICOLA: TcxGridDBColumn;
    tvQDATAULTIMAPULIZIA: TcxGridDBColumn;
    tvQDATAULTIMAPROVACOMBUSTIONE: TcxGridDBColumn;
    tvQPROSSIMOINTERVENTOPREVISTO: TcxGridDBColumn;
    tvQDATAORAPROSSIMOAPPUNTAMENTO: TcxGridDBColumn;
    tvQRAGSOCUT: TcxGridDBColumn;
    tvQSTATO: TcxGridDBColumn;
    QCLIENTE: TIntegerField;
    procedure QCalcFields(DataSet: TDataSet);
    procedure tvQCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FilterPeriodicitaPropertiesInitPopup(Sender: TObject);
    procedure FilterTipoContrattoPropertiesInitPopup(Sender: TObject);
    procedure FilterCostruttorePropertiesInitPopup(Sender: TObject);
    procedure FilterModelloPropertiesInitPopup(Sender: TObject);
    procedure FilterLocalitaPropertiesInitPopup(Sender: TObject);
    procedure FilterCAPPropertiesInitPopup(Sender: TObject);
    procedure FilterAbbonatiClickCheck(Sender: TObject);
    procedure FilterAbbonatiExit(Sender: TObject);
    procedure FilterAbbonatiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterIndirizzoKeyPress(Sender: TObject; var Key: Char);
    procedure AssMesiTuttiClick(Sender: TObject);
    procedure AssMesiTuttiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AssMesiNessunoClick(Sender: TObject);
    procedure AssMesiNessunoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AssGenClick(Sender: TObject);
    procedure AssGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvQEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvQDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvQDataControllerGroupingChanged(Sender: TObject);
    procedure tvQDataControllerSortingChanged(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure EseguiQuery; override;
  public
    { Public declarations }
    // Punta al componente Field in cui inserire il codice della pratica
    //  selezionata e la data.
    FieldPratica,FieldDataPratica,FieldCliente : TField;
    EditPratica,EditDataPratica,EditDescrizionePratica : TEdit;
    ClienteSelezionato : String;
  end;

var
  SelezionaImpiantoForm: TSelezionaImpiantoForm;

implementation

uses DataModule1, DateUtils, SchedaClienti, FormPratica, main;

{$R *.dfm}

procedure TSelezionaImpiantoForm.EseguiQuery;
begin
      // Se i check di alcuni gruppi di filtri sono tutti NON CHECCKATI li checcka automaticamente tutti
      //  perchè altrimenti non visualizzerebbe nulla
      if not (FilterAbbonati.Checked[0] or FilterAbbonati.Checked[1]) then begin
         FilterAbbonati.Checked[0] := True;
         FilterAbbonati.Checked[1] := True;
      end;
      // Creazione query di ricerca
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT P.TIPO, P.CODICE, P.DATAAPERTURA, CAST(C.RAGIONESOCIALE || ''  ('' || P.CLIENTE || '')'' AS VARCHAR(80) )  AS RAGIONESOCIALE,');
      Q.SQL.Add(' C.Telefono, C.Cellulare, P.Costruttore, P.Modello, P.DataInstallazione, P.ComuneIMM, P.CAPImm, P.Abbonato, P.TipoContratto, P.ImportoContratto,');
      Q.SQL.Add(' P.TipoImpianto, P.Periodicita, P.BREVEDESCRIZIONECALDAIA, P.RAGSOCUT, P.MATRICOLA,');

      Q.SQL.Add(' (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento''');
      Q.SQL.Add('     AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'' OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) AS DataUltimaPulizia,');

      Q.SQL.Add(' (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento''');
      Q.SQL.Add('     AND (I.TIPOINTERVENTO LIKE ''%Prova combustione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'')) AS DataUltimaProvaCombustione,');

      Q.SQL.Add(' (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
      Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) + P.PERIODICITA AS ProssimoInterventoPrevisto,');

      Q.SQL.Add(' (SELECT MIN(I.START_EVENT) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Appuntam.'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
      Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) AS DataOraProssimoAppuntamento,');

      Q.SQL.Add(' P.CLIENTE');

      Q.SQL.Add('FROM PRATICHE P');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON C.CODICE = P.CLIENTE');
      // Aggiunge una clausola WHERE finta in modo che non dia errore se non viene specificata nessuna condizione
      Q.SQL.Add('WHERE');
      Q.SQL.Add('P.TIPO = ''A''');

      // Tutte le installazioni del cliente come primo intestatario e compunque anche quelle dove compare come
      //  altro soggetto.
      if ClientiForm.ClienteCorrente <> '' then begin
        Q.SQL.Add('AND ((P.CLIENTE = ' + ClientiForm.ClienteCorrente + ') OR (P.CODICEUT = ' + ClientiForm.ClienteCorrente + ') OR (P.CODICEINST = ' + ClientiForm.ClienteCorrente + '))');
      end;
      // In base al tipo impianto e alla periodicità
      if FilterTipoImpianto.Text <> '' then Q.SQL.Add('AND P.TIPOIMPIANTO LIKE ''%' + FilterTipoImpianto.Text + '%''');
      if FilterPeriodicita.Text <> '' then Q.SQL.Add('AND P.PERIODICITA = ' + FilterPeriodicita.Text);
      if FilterTipoContratto.Text <> '' then Q.SQL.Add('AND P.TIPOCONTRATTO LIKE ''%' + FilterTipoContratto.Text + '%''');
      // In base a se l'impianto è in abbonamento oppure no
      if not FilterAbbonati.Checked[0]  then Q.SQL.Add('AND P.ABBONATO <> ''T''');
      if not FilterAbbonati.Checked[1]  then Q.SQL.Add('AND P.ABBONATO = ''T''');
      // In base a se l'impianto è in scadenza (come manutenzione) oppure no.
      if FilterInScadenza.Checked[0] then Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA=P.CODICE AND I.DATAPRATICA1=P.DATAAPERTURA AND I.TIPOIMPEGNO=''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'')) + P.Periodicita<=''' + FormatDateTime('mm/dd/yyyy', Date+30) + '''');
      // In base a se viene specificato un costruttore oppure un modello oppure una località
      if FilterCostruttore.Text <> '' then Q.SQL.Add('AND P.COSTRUTTORE LIKE ''%' + FilterCostruttore.Text + '%''');
      if FilterModello.Text <> '' then Q.SQL.Add('AND P.MODELLO LIKE ''%' + FilterModello.Text + '%''');
      if FilterLocalita.Text <> '' then Q.SQL.Add('AND P.COMUNEIMM LIKE ''%' + FilterLocalita.Text + '%''');
      if FilterCAP.Text <> '' then Q.SQL.Add('AND P.CAPIMM LIKE ''' + FilterCAP.Text + '%''');
      if FilterIndirizzo.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.INDIRIZZOIMM', FilterIndirizzo.Text, True);
      if FilterNumCivico.Text <> '' then Q.SQL.Add('AND P.NUMCIVICOIMM LIKE ''' + FilterNumCivico.Text + '''');

      // IN base a quale data su cui effettuare la ricerca, effettua appunta la ricerca sulla data selezionata
      if FilterTipoData.Text = 'Prossimo intervento' then begin
        // Date (Controllo sulla data del PROSSIMOINTERVENTOPREVISTO
        if DM1.ControllaDataStr(AssDal.Text) then begin
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) + P.PERIODICITA >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.Text)) + '''');
        end;
        if DM1.ControllaDataStr(AssAl.Text)  then begin
           //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
           //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
           //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) + P.PERIODICITA < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.Text)+1) + '''');
        end;

      end else if FilterTipoData.Text = 'Ultimo intervento' then begin
        // Date (Controllo sulla data dell'ultimo intervento eseguito
        if DM1.ControllaDataStr(AssDal.Text) then begin
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.Text)) + '''');
        end;
        if DM1.ControllaDataStr(AssAl.Text)  then begin
           //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
           //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
           //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.Text)+1) + '''');
        end;
      end;

  // Nell'inherited eseguq la query
  inherited;
end;

procedure TSelezionaImpiantoForm.QCalcFields(DataSet: TDataSet);
var
   QuantoMancaAlProssimoIntervento : Integer;
begin
  inherited;
   // IN base allo stato dell'abbonamento dell'impianto setta il colore con
   //  cui visualizzare la riga.
   // --------------------------------------------------------------------------
      // Solo se l'impianto è in abbonamento
      if QABBONATO.AsString = 'T' then begin
         // Variabile che contiene i giorni mancanti all'ultimo giorno
         if not QPROSSIMOINTERVENTOPREVISTO.IsNull then begin
            QuantoMancaAlProssimoIntervento := Trunc((QPROSSIMOINTERVENTOPREVISTO.AsDateTime - Now));
         end else begin
            QuantoMancaAlProssimoIntervento := 300;  // Valore di default se non può calcolarlo
         end;
         // Se è già stato preso un appuntamento per la manutenzione programma visualizza la riga in blu
         if not QDATAORAPROSSIMOAPPUNTAMENTO.IsNull then begin
            QSTATO.Value := 'App.preso';
         // Se il prossimo intervento previsto cade entro 15 gg da oggi, visualizza tutto rosso
         end else if QuantoMancaAlProssimoIntervento <= 15 then begin
           QSTATO.Value := 'URGENTE';
         // Se il prossimo intervento previsto cade tra 15 e 30 gg da oggi, visualizza tutto arancione
         end else if QuantoMancaAlProssimoIntervento <= 30 then begin
           QSTATO.Value := 'IN_SCAD';
         // Se il prossimo intervento previsto cade oltre i 30 gg da oggi, visualizza tutto verde
         end else begin
           QSTATO.Value := 'Ok';
         end;
      // Se invece l'abbonamento è stato sospeso, lo visualizza in grigio
      end else if QABBONATO.AsString = 'S' then begin
         QSTATO.Value := 'Sospeso';
      // Se invece non è abbonato per niente
      end else begin
         QSTATO.Value := '';
      end;

end;

procedure TSelezionaImpiantoForm.tvQCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
   QuantoMancaAlProssimoIntervento : Integer;
begin
  inherited;
   // IN base allo stato dell'abbonamento dell'impianto setta il colore con
   //  cui visualizzare la riga.
   // --------------------------------------------------------------------------
   // Solo se non è selezionata
   if not AViewInfo.Selected then begin
      // Solo se l'impianto è in abbonamento
      if AViewInfo.GridRecord.Values[tvQ.GetColumnByFieldName('ABBONATO').Index] = 'T' then begin
         // Variabile che contiene i giorni mancanti all'ultimo giorno
         if not VarIsNull(AViewInfo.GridRecord.Values[tvQ.GetColumnByFieldName('PROSSIMOINTERVENTOPREVISTO').Index]) then begin
            QuantoMancaAlProssimoIntervento := (AViewInfo.GridRecord.Values[tvQ.GetColumnByFieldName('PROSSIMOINTERVENTOPREVISTO').Index] - now);
         end else begin
            QuantoMancaAlProssimoIntervento := 300;  // Valore di default se non può calcolarlo
         end;
         // Se è già stato preso un appuntamento per la manutenzione programma visualizza la riga in blu
         if not VarIsNull(AViewInfo.GridRecord.Values[tvQ.GetColumnByFieldName('DATAORAPROSSIMOAPPUNTAMENTO').Index]) then begin
            ACanvas.Font.Color := clBlue;
         // Se il prossimo intervento previsto cade entro 15 gg da oggi, visualizza tutto rosso
         end else if QuantoMancaAlProssimoIntervento <= 15 then begin
            ACanvas.Font.Color := clWhite;   // Rosso
            ACanvas.Brush.Color := clRed;
         // Se il prossimo intervento previsto cade tra 15 e 30 gg da oggi, visualizza tutto arancione
         end else if QuantoMancaAlProssimoIntervento <= 30 then begin
            ACanvas.Font.Color := clRed;   // Arancione
         // Se il prossimo intervento previsto cade oltre i 30 gg da oggi, visualizza tutto verde
         end else begin
            ACanvas.Font.Color := $0000D200;  // Verde
         end;
      // Se invece l'abbonamento è stato sospeso, lo visualizza in grigio
      end else if AViewInfo.GridRecord.Values[tvQ.GetColumnByFieldName('ABBONATO').Index] = 'S' then begin
         ACanvas.Brush.Color := $00A7A7A7;  // Grigio scuro
         ACanvas.Font.Color := $00E6E6E6;   // Grigio Chiaro
      end;
   end;
end;

procedure TSelezionaImpiantoForm.FilterPeriodicitaPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(PERIODICITA) FROM PRATICHE');
      Qry.Open;
      FilterPeriodicita.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterPeriodicita.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;

end;

procedure TSelezionaImpiantoForm.FilterTipoContrattoPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(TIPOCONTRATTO) FROM PRATICHE');
      Qry.Open;
      FilterTipoContratto.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterTipoContratto.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;

end;

procedure TSelezionaImpiantoForm.FilterCostruttorePropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(COSTRUTTORE) FROM PRATICHE');
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

procedure TSelezionaImpiantoForm.FilterModelloPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(MODELLO) FROM PRATICHE WHERE COSTRUTTORE LIKE ''%' + FilterCostruttore.Text + '%''');
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

procedure TSelezionaImpiantoForm.FilterLocalitaPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
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

procedure TSelezionaImpiantoForm.FilterCAPPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(CAPIMM) FROM PRATICHE');
      Qry.Open;
      FilterCAP.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterCAP.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezionaImpiantoForm.FilterAbbonatiClickCheck(Sender: TObject);
begin
  inherited;
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TSelezionaImpiantoForm.FilterAbbonatiExit(Sender: TObject);
begin
  inherited;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

procedure TSelezionaImpiantoForm.FilterAbbonatiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   CheckIndex, i:Integer;
   CurrCheckListBox:TCheckListBox;
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
      // Se c'era una voce cambia il suo stato
      if CheckIndex <> -1 then begin
         if CurrCheckListBox.Tag = 0 then CurrCheckListBox.Checked[CheckIndex] := not CurrCheckListBox.Checked[CheckIndex];
         // Rimette la Proprietà Tag del componente = 0
         CurrCheckListBox.Tag := 0;
      end;
      // Esegue la ricerca
      RxSpeedButtonTrovaClick(Self);
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CurrCheckListBox.ItemIndex := -1;
   // ----------------------------------------------------------------------------------------------------
end;

procedure TSelezionaImpiantoForm.FilterIndirizzoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
end;

procedure TSelezionaImpiantoForm.AssMesiTuttiClick(Sender: TObject);
var
   GG, MM, AA: Word;
begin
   DecodeDate(Date, AA, MM, GG);
   AssDal.EditText := ' 01/01/' + IntToStr(AA);
   AssAl.EditText  := ' 31/12/' + IntToStr(AA);
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
      AssGen.Down   := True;
      AssFeb.Down   := True;
      AssMar.Down   := True;
      AssApr.Down   := True;
      AssMag.Down   := True;
      AssGiu.Down   := True;
      AssLug.Down   := True;
      AssAgo.Down   := True;
      AssSet.Down   := True;
      AssOtt.Down   := True;
      AssNov.Down   := True;
      AssDic.Down   := True;
//   end else begin
      // Rimette il Tag del pulsante = 0
      AssMesiTutti.Tag := 0;
//   end;
end;

procedure TSelezionaImpiantoForm.AssMesiTuttiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiTuttiClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaImpiantoForm.AssMesiNessunoClick(Sender: TObject);
begin
   AssDal.EditText := '   /  /20  ';
   AssAl.EditText  := '   /  /20  ';
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

procedure TSelezionaImpiantoForm.AssMesiNessunoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiNessunoClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaImpiantoForm.AssGenClick(Sender: TObject);
var
   GG, MM, AA: Word;
   Mese:Shortint;
begin
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

procedure TSelezionaImpiantoForm.AssGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      AssGenClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaImpiantoForm.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
  inherited;
      FilterAbbonati.Checked[0]     := True;
      FilterAbbonati.Checked[1]     := True;
      FilterInScadenza.Checked[0]   := False;
      FilterCostruttore.Text        := '';
      FilterModello.Text            := '';
      FilterLocalita.Text           := '';
      FilterIndirizzo.Text          := '';
      FilterNumCivico.Text          := '';
      FilterCAP.Text                := '';
      AssDal.Text                   := '';
      AssAl.Text                    := '';
      FilterTipoImpianto.Text       := '';
      FilterPeriodicita.Text        := '';
      FilterTipoData.Text           := 'Prossimo intervento';
      FilterTipoContratto.Text      := '';
      // Senza filtro per date che in questo caso è meglio
      AssMesiNessunoClick(AssMesiNessuno);
      // Azzera la query
      if RxSpeedButtonResetQuery.Tag = 1 then Q.Close;
end;

procedure TSelezionaImpiantoForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  inherited;
 DM1.Attendere;
 try
   Application.CreateForm(TPraticaForm, PraticaForm);
   PraticaForm.Mode := MODE_ASSISTENZE;
   PraticaForm.Parent := MainForm;
   PraticaForm.CodiceCliente := '0';
   if ClientiForm.ClienteCorrente <> '' then PraticaForm.CodiceCliente  := ClientiForm.ClienteCorrente;
   PraticaForm.Tag := 2;
   PraticaForm.Show;
 finally
   DM1.ChiudiAttendere;
 end;
end;

procedure TSelezionaImpiantoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SelezionaImpiantoForm := nil;
end;

procedure TSelezionaImpiantoForm.tvQEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  inherited;
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
      // In base al bersagio attiva la funzione corretta.
      if Target is TSpeedButton then begin
         TSpeedButton(Target).OnClick(Self);
      // Se invece il Target è il pannellino del soggetto selezionato, seleziona il soggetto
      //  NB: Le labels che indicano i dati del soggetto selezionato hanno il nome che comincia ssmper con 'SS'
      end else if Target is TbmpPanel then begin
//         if TbmpPanel(Target).Name = 'MainLeftPanel' then RxSpeedButtonVisualizzaClick(Self);
      end else if Target is TPaintBox then begin
//         if DM1.StrLeft(TPaintBox(Target).Name, 2) = 'SB' then RxSpeedButtonVisualizzaClick(Self);
      end;
   end;
end;

procedure TSelezionaImpiantoForm.tvQDblClick(Sender: TObject);
begin
  // Se non c'è alcun rigo selezionato non fa nulla
  if (tvQ.Controller.SelectedRecordCount = 0) or (tvQ.Controller.FocusedRecord = nil) or (not tvQ.Controller.FocusedRecord.IsData) then exit;
  // In base al codice del chiamante...
  case CallerCode of

    // Se non c'è il chiamante ma sono stati impostati direttamente i campi
    //  da aggiornare alla selezione di una pratica...
    0:
    begin
       // Effettua la selezione assegnando il codice della pratica selezionata  e la data
       //  ai campi appropriati puntati da 'FieldPratica' e 'FieldDataPratica'
       if Assigned(FieldDataPratica) then FieldDataPratica.Value := Q.FieldByName('DataApertura').Value;
       if Assigned(FieldPratica) then FieldPratica.Value     := Q.FieldByName('Codice').Value;
       if Assigned(EditDataPratica) then EditDataPratica.Text     := Q.FieldByName('DataApertura').AsString;
       if Assigned(EditPratica) then EditPratica.Text     := Q.FieldByName('Codice').AsString;
       if Assigned(EditDescrizionePratica) then EditDescrizionePratica.Text     := Q.FieldByName('Descrizione').AsString;

       if Assigned(FieldCliente) and (   (FieldCliente.IsNull) or (FieldCliente.AsInteger = 0)   )
       then FieldCliente.Value := Q.FieldByName('CLIENTE').Value;
    end;

  end;
  // Chiude la form di selezione
  Close;
end;

procedure TSelezionaImpiantoForm.FormShow(Sender: TObject);
begin
  inherited;
  // Caricamento delle impostazioni di visualizzazione delle griglie
  DM1.RipristinaDevExpress(GridQ, '', False, 'GridAssistenze', 'tvAssistenze');
end;

procedure TSelezionaImpiantoForm.tvQDataControllerGroupingChanged(
  Sender: TObject);
begin
  inherited;
   if tvQ.GroupedColumnCount > 0 then tvQ.OptionsView.GridLines := glBoth else tvQ.OptionsView.GridLines := glVertical;
end;

procedure TSelezionaImpiantoForm.tvQDataControllerSortingChanged(
  Sender: TObject);
begin
  inherited;
   // Fà rifare l'interrogazione con il nuovo ordinamento
   // NB: Solo se non c'è alcun raggruppamento
   if tvQ.DataController.DataModeController.GridMode and (tvQ.GroupedColumnCount = 0) then RxSpeedButtonTrovaClick(Self);
   tvQ.Controller.GoToFirst(False);

end;

end.
