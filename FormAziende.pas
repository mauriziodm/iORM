unit FormAziende;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxCheckBox, cxTextEdit, DB, cxDBData, cxGridDBTableView,
  IB_Components, IBODataset, ExtCtrls, StdCtrls, Mask, DBCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, Buttons, MAURI_SB, ComCtrls,
  ShlObj, cxShellCommon, cxContainer, cxMaskEdit, cxDropDownEdit,
  cxShellComboBox, cxDBShellComboBox, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations;

Const
  // Cosstanti per identificare il modo di apertura della form
  AZIENDE_NUOVA         = 0;
  AZIENDE_MODIFICA      = 1;
  AZIENDE_ELIMINA       = 2;
  AZIENDE_RISTRUTTURA   = 3;
  AZIENDE_AGGIORNATO    = 4;

type
  TAziendeForm = class(TForm)
    PanelGrid: TPanel;
    TimerRistrutturazioneAutomatica: TTimer;
    QryAziende: TIBOQuery;
    DataSourceAziende: TDataSource;
    ButtonRistruttura: TBitBtn;
    ButtonRistrutturaTutto: TBitBtn;
    SBGridCancel: TSpeedButtonRollOver;
    SBGridOK: TSpeedButtonRollOver;
    TitoloGrid: TLabel;
    SBCorreggiProgRigo: TSpeedButton;
    CBNoBanche: TCheckBox;
    CBNoChiusura: TCheckBox;
    GridAzi: TcxGrid;
    tvAzi: TcxGridTableView;
    tvAziEXCLUSIVE: TcxGridColumn;
    tvAziAZIENDA: TcxGridColumn;
    lvAzi: TcxGridLevel;
    tvAziPERCORSO: TcxGridColumn;
    ButtonVerifica: TBitBtn;
    CBNoRiparazione: TCheckBox;
    LogMemo: TMemo;
    CBNoRistrutturazione: TCheckBox;
    GridAziende: TcxGrid;
    lvAziende: TcxGridLevel;
    tvAziende: TcxGridDBTableView;
    QryAziendeAZIENDA: TStringField;
    QryAziendePERCORSO: TStringField;
    QryAziendeEXCLUSIVEDATABASEACCESS: TStringField;
    tvAziendeAZIENDA: TcxGridDBColumn;
    PanelAzienda: TPanel;
    Shape2: TShape;
    LabelNomeAzienda: TLabel;
    LabelPercorso: TLabel;
    SBAziendaCancel: TSpeedButtonRollOver;
    SBAziendaOK: TSpeedButtonRollOver;
    TitoloAzienda: TLabel;
    DBENomeAzienda: TDBEdit;
    Edit1: TEdit;
    DBEPercorso: TcxDBShellComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBENomeAziendaEnter(Sender: TObject);
    procedure DBENomeAziendaExit(Sender: TObject);
    procedure ButtonRistrutturaClick(Sender: TObject);
    procedure ButtonRistrutturaTuttoClick(Sender: TObject);
    procedure TimerRistrutturazioneAutomaticaTimer(Sender: TObject);
    procedure RistrutturaTutteLeAziende;
    procedure SBGridCancelClick(Sender: TObject);
    procedure SBGridOKClick(Sender: TObject);
    procedure SBAziendaCancelClick(Sender: TObject);
    procedure SBAziendaOKClick(Sender: TObject);
    procedure CorreggiProgRigo;
    procedure SBCorreggiProgRigoClick(Sender: TObject);
    function  NomeAziendaValido(N:String):Boolean;
    procedure ButtonVerificaClick(Sender: TObject);
    procedure tvAziEXCLUSIVEPropertiesEditValueChanged(Sender: TObject);
    procedure tvAziendeDblClick(Sender: TObject);
    procedure tvAziendeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    // Flag che indica se si è appena inserita una nuova azienda per fare in modo che questa
    //  venga automaticamente selezionata e quindi ne vengano create automaticamente tutte le tabelle.
    NuovaAzienda : Boolean;
    procedure LoadAziendeToGrid;
  public
    { Public declarations }
    Mode:Byte;
  end;

var
  AziendeForm: TAziendeForm;

implementation

uses DataModule1, main, FormHelp, FormBackup, FrameStart, UnitRistruttura, IniFiles, Levante.Version.InterfacesAndFactory;

{$R *.DFM}

procedure TAziendeForm.FormCreate(Sender: TObject);
begin
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Multiaziendale)';
   // Imposta il flag che indica se si è appena inserita una nuova azienda a False
   NuovaAzienda := False;
   // Rende il TEdit invisibile
   Edit1.ParentColor := True;
   // Nel caso il flag indichi di non caricare le banche dagli archivi di base
//   CBNoBanche.Checked := MainForm.NoBancheArcBase;
   // Posiziona e dimensione la finestra
   MainForm.StartFrame.PosizionaSottopannelli(Self);
end;


procedure TAziendeForm.LoadAziendeToGrid;
var
  y: Integer;
begin
  with tvAzi.DataController do begin
    RecordCount := 0;
    QryAziende.First;
    while not QryAziende.Eof do begin
      y := AppendRecord;

      if QryAziende.FieldByName('EXCLUSIVEDATABASEACCESS').IsNull
        then Values[y,tvAziEXCLUSIVE.Index]:= 0
        else Values[y,tvAziEXCLUSIVE.Index]  := QryAziende.FieldByName('EXCLUSIVEDATABASEACCESS').AsInteger;

      Values[y,tvAziAZIENDA.Index]    := QryAziende.FieldByName('AZIENDA').AsString;
      Values[y,tvAziPERCORSO.Index]   := QryAziende.FieldByName('PERCORSO').AsString;
      QryAziende.Next;
    end;
  end;
end;


procedure TAziendeForm.FormShow(Sender: TObject);
begin
  DM1.FocusRefresh;

  // Apre la query
  QryAziende.Open;
  // Carica l'elenco delle aziende
  LoadAziendeToGrid;

   // Imposta i colori dello sfondo della form
   PanelGrid.Color      := COLOR_LOGIN_OPZIONI;
   PanelGrid.Align      := alClient;
   PanelAzienda.Color   := COLOR_LOGIN_OPZIONI;
   PanelAzienda.Align   := alClient;

   case Mode of
      // Se si è in modalità CREA NUOVA AZIENDA
      // ------------------------------------------------------------------------------
      AZIENDE_NUOVA: begin
         try
            PanelGrid.Visible := False;
            PanelAzienda.Visible := True;
            PanelAzienda.BringToFront;
            QryAziende.Append;
            DBEPercorso.SetFocus;
            DBENomeAzienda.SetFocus;
            LabelPercorso.Visible := False;
            DBEPercorso.Visible := False;
            LabelNomeAzienda.Top := LabelNomeAzienda.Top + 20;
            DBENomeAzienda.Top := DBENomeAzienda.Top + 20;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna alla modifica
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 Close;
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      AZIENDE_MODIFICA: begin
         PanelAzienda.Visible := False;
         PanelGrid.Visible := True;
         PanelGrid.BringToFront;
         GridAziende.SetFocus;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità ELIMINA
      // ------------------------------------------------------------------------------
      AZIENDE_ELIMINA: begin
         PanelAzienda.Visible := False;
         PanelGrid.Visible := True;
         PanelGrid.BringToFront;
         GridAziende.SetFocus;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità RISTRUTTURA
      // ------------------------------------------------------------------------------
      AZIENDE_RISTRUTTURA: begin
         PanelAzienda.Visible := False;
         PanelGrid.Visible := True;
         PanelGrid.BringToFront;
         SBGridCancel.Visible := False;
         SBGridOK.Visible := False;
         ButtonVerifica.Visible := True;
         ButtonRistruttura.Visible     := True;
         ButtonRistrutturaTutto.Visible := True;
         SBCorreggiProgRigo.Visible := True;
         CBNoBanche.Visible := True;
         CBNoRiparazione.Visible := True;
         CBNoRistrutturazione.Visible := True;
         CBNoChiusura.Visible := True;
         // Rende invisibile la griglia vecchia
         TitoloGrid.Caption       := 'Ristrutturazione aziende...';
         GridAziende.Visible      := False;
         GridAzi.Visible          := True;
         GridAzi.SetFocus;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità DOPO AGGIORNAMENTO
      // ------------------------------------------------------------------------------
      AZIENDE_AGGIORNATO: begin
         PanelAzienda.Visible := False;
         PanelGrid.Visible := True;
         PanelGrid.BringToFront;
         SBGridCancel.Visible := False;
         SBGridOK.Visible := False;
         // Avvia il timer che poi avvierà la ristrutturazione automatica (altrimenti veniva eseguita, l'operazione
         //  senza che la form venisse visualizzata)
         TimerRistrutturazioneAutomatica.Enabled := True;
         // Rende invisibile la griglia vecchia
         TitoloGrid.Caption       := 'Ristrutturazione aziende...';
         GridAziende.Visible      := False;
         GridAzi.Visible          := True;
         GridAzi.SetFocus;
      end;
      // ------------------------------------------------------------------------------
   end;
end;

procedure TAziendeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   AziendeForm := nil;
end;

procedure TAziendeForm.DBENomeAziendaEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlEnter(Sender);
end;

procedure TAziendeForm.DBENomeAziendaExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlExit(Sender);
end;

procedure TAziendeForm.ButtonRistrutturaClick(Sender: TObject);
var
   P: TMemIniFile;
begin
  if tvAzi.Controller.FocusedRecordIndex = -1 then raise Exception.Create('Nessun azienda selezionata!');

  // Cambia l'azienda corrente per poi ristrutturarne gli archivi
  DM1.AziendaCorrente := tvAzi.Controller.FocusedRecord.Values[tvAziAZIENDA.Index];

  // Controlla se il database è bloccato per manutenzione e se lo è si rifiuta di continuare ed esce
  if DM1.LockedDatabase then
  begin
    DM1.Messaggi('ATTENZIONE !!!', 'L''accesso all''azienda ''' + DM1.AziendaCorrente +
      ''' è BLOCCATO per manutenzione.', 'NB: Se il problema persiste chiamare il centro di assistenza.',
      [mbOk], 0, nil);
    Exit;
  end;

  // Conferme
  if DM1.Messaggi('Verifica Integrità Archivi', 'ATTENZIONE!!!'#13#13'Assicurarsi che non ci siano postazioni con Levante aperto!'#13#13'Continuare?', '', [mbOk,mbCancel], 0, nil) <> mrOk then
    Exit;
  if MessageDlg('Confermi aggiornamento e ristrutturazione archivi ?', mtWarning, [mbOk, mbNo], 0) <> mrOk then
    Exit;
  if MessageDlg('Sei sicuro/a ?  -  Si consiglia di chiamare il centro di assistenza prima di effettuare l''operazione in quanto gli archivi potrebbero venirne danneggiati irreparabilmente.', mtWarning, [mbOk, mbNo], 0) <> mrOk then
    Exit;

  // Esecuzione dell'operazione
  try
    // Aggiorna il pannello sullo status dell'operazione
    DM1.ShowWait('Ristrutturazione archivi', 'Ristrutturazione azienda: "' + DM1.AziendaCorrente + '"');
    // Aggiorna il file param.ini con l'indicazione dell'azienda corrente
    P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
     P.WriteString('ARCPATH', 'AziendaCorrente', DM1.AziendaCorrente);
     P.UpdateFile;
    P.Free;
    // Aggiorna la data e l'azienda corrente sullo schermo
    MainForm.LabelAziendaCorrente.Caption := DM1.AziendaCorrente;
    // Esegue l'apertura delle tabelle con il flag a True per
    //  eseguire una completa ristrutturazione delle tabelle
    DM1.AttivaTabelle(False, True);

    // Se il pulsante per il controllo dei ProgRigo è Down avvia il controllo relativo
    if SBCorreggiProgRigo.Down then CorreggiProgRigo;

    // Visualizza un messaggio di operazione terminata
    DM1.Messaggi('', 'Ristrutturazione dell''azienda "' + DM1.AziendaCorrente + '" terminata.', '', [mbOK], 0, nil);
  finally
    // Chiude il pannello con lo status dell'operazione
    DM1.CloseWait;
  end;
end;


// Questa procedura corregge il problema che affliggeva la versione 308 (e forse anche alcune precedenti) e cioè
//  che durante la ristrutturazione i righi 0 (zero) di ogni documento veniva modificato con un numero molto alto dalla
//  procedura che controlla che non vi siano righi con ProgRigo nullo e quindi il primo rigo diventava l'ultimo e gli
//  altri scalavano in su di 1.
procedure TAziendeForm.CorreggiProgRigo;
var
   QryDoc, Qry:TIB_Cursor;
   Tabella : String;
   Primo, Ultimo, NumRighi : Integer;
begin
   Qry                  := TIB_Cursor.Create(Self);
   Qry.DatabaseName     := DM1.ArcDBFile;
   Qry.IB_Connection    := DM1.DBAzienda;
   QryDoc               := TIB_Cursor.Create(Self);
   QryDoc.DatabaseName  := DM1.ArcDBFile;
   QryDoc.IB_Connection := DM1.DBAzienda;
   try
      // Prima di tutto ottengo l'elenco dei documenti dall'archivio PRVORDCL
      DM1.ShowWait('', 'Controllo ProgRigo, caricamento elenco documenti.');
      QryDoc.SQL.Add('SELECT TIPODOCUMENTO, REGISTRO, NUMORDPREV, DATADOCUMENTO FROM PRVORDCL');
      QryDoc.Open;
      // Poi ciclo per ogni documento per effettuare il controllo che il campo
      //  ProgRigo dell'ultimo rigo non sia tropo alto nel qual caso significherebbe
      //  che il documento ha subito il problema. Se rileva questa provvede a modificare
      //  il campo ProgRigo del rigo stesso ponendolo = 0 (zero) che è il suo
      //  giusto valore, così il rigo ridiventa il primo.
      while not QryDoc.EOF do begin
         DM1.ShowWait('Correzione ProgRigo', 'Controllo ' + QryDoc.FieldByName('TIPODOCUMENTO').AsString + 'N° ' + QryDoc.FieldByName('NUMORDPREV').AsString + QryDoc.FieldByName('REGISTRO').AsString + ' del ' + QryDoc.FieldByName('DATADOCUMENTO').AsString);
         // Query che preleva il Valore del ProgRigo del primo rigo dell'ultimo e il numero dei righi
         Qry.SQL.Clear;
         Qry.SQL.Add('SELECT MIN(PROGRIGO) AS PRIMO, MAX(PROGRIGO) AS ULTIMO, COUNT(*) AS NUMRIGHI FROM RIGHIPRV');
         Qry.SQL.Add('WHERE TIPODOCUMENTO = ''' + QryDoc.FieldByName('TIPODOCUMENTO').AsString + '''');
         Qry.SQL.Add('  AND REGISTRO = ''' + QryDoc.FieldByName('REGISTRO').AsString + '''');
         Qry.SQL.Add('  AND NUMORDPREV = ' + QryDoc.FieldByName('NUMORDPREV').AsString);
         Qry.SQL.Add('  AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', QryDoc.FieldByName('DATADOCUMENTO').AsDateTime) + '''');
         Qry.Open;
         Primo       := Qry.FieldByName('PRIMO').AsInteger;
         Ultimo      := Qry.FieldByName('ULTIMO').AsInteger;
         NumRighi    := Qry.FieldByName('NUMRIGHI').AsInteger;
         Qry.Close;
         // Effettua il controllo per verificare che l'ultimo rigo non contenga un valore di ProgRigo esagerato
         if (Ultimo > (Primo + NumRighi - 1)) and (NumRighi > 0) then begin
            // Se è esagerato lo rimette a zero
            Qry.SQL.Clear;
            Qry.SQL.Add('UPDATE RIGHIPRV SET PROGRIGO = 0');
            Qry.SQL.Add('WHERE TIPODOCUMENTO = ''' + QryDoc.FieldByName('TIPODOCUMENTO').AsString + '''');
            Qry.SQL.Add('  AND REGISTRO = ''' + QryDoc.FieldByName('REGISTRO').AsString + '''');
            Qry.SQL.Add('  AND NUMORDPREV = ' + QryDoc.FieldByName('NUMORDPREV').AsString);
            Qry.SQL.Add('  AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', QryDoc.FieldByName('DATADOCUMENTO').AsDateTime) + '''');
            Qry.SQL.Add('  AND PROGRIGO = ' + IntToStr(Ultimo));
            Qry.ExecSQL;
         end;
         // Avanti il prossimo
         QryDoc.Next;
      end;
   finally
      Qry.Close;
      Qry.Free;
      QryDoc.Close;
      QryDoc.Free;
   end;
end;


procedure TAziendeForm.RistrutturaTutteLeAziende;
var
   PrecAzienda:String;
   P: TMemIniFile;
   i: Integer;
begin
   // Salva l'azienda corrente
   P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
   PrecAzienda := P.ReadString('ARCPATH', 'AziendaCorrente', 'PROVA');
   try
      // Aggiorna il pannello sullo status dell'operazione
      DM1.ShowWait('Ristrutturazione archivi', 'Preparazione ristrutturazione aziende');

      // Ciale per tutte le aziende
      for i := 0 to tvAzi.DataController.RecordCount -1 do begin
        // Cambia l'azienda corrente per poi ristrutturarne gli archivi
        tvAzi.Controller.FocusedRecordIndex := i;
        Update;
        Application.ProcessMessages;
        DM1.AziendaCorrente := tvAzi.DataController.Values[i,tvAziAZIENDA.Index];
        // Controlla se il database è bloccato per manutenzione e se lo è si rifiuta di continuare e
        //  passa alla prossima azienda
        if DM1.LockedDatabase then
        begin
          DM1.Messaggi('ATTENZIONE !!!', 'L''accesso all''azienda ''' + DM1.AziendaCorrente +
            ''' è BLOCCATO per manutenzione.', 'NB: Se il problema persiste chiamare il centro di assistenza.',
            [mbOk], 0, nil);
          Continue;
        end;
        // Aggiorna il pannello sullo status dell'operazione
        DM1.ShowWait('', 'Ristrutturazione azienda: "' + DM1.AziendaCorrente + '"');
        // Varia l'azienda corrente
        P.WriteString('ARCPATH', 'AziendaCorrente', DM1.AziendaCorrente);
        P.UpdateFile;
        // Esegue l'apertura delle tabelle con il flag a True per
        //  eseguire una completa ristrutturazione delle tabelle
        DM1.AttivaTabelle(False, True);
      end;

      // Visualizza un messaggio di operazione terminata
      DM1.Messaggi('', 'Ristrutturazione terminata.', '', [mbOK], 0, nil);
   finally
     DM1.CloseWait;
     // Ripristina l'azienda in uso prima dell'operazione
     P.WriteString('ARCPATH', 'AziendaCorrente', PrecAzienda);
     P.UpdateFile;
     P.Free;
   end;
end;


procedure TAziendeForm.ButtonRistrutturaTuttoClick(Sender: TObject);
begin
   MessageBeep(0);
   if MessageDlg('Confermi aggiornamento e ristrutturazione archivi ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
      MessageBeep(0);
      if MessageDlg('Sei sicuro/a ?  -  Si consiglia di chiamare il centro di assistenza prima di effettuare l''operazione in quanto gli archivi potrebbero venirne danneggiati irreparabilmente.', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
         DM1.Attendere;

         RistrutturaTutteLeAziende;

         DM1.ChiudiAttendere;
      end;
   end;
end;

procedure TAziendeForm.TimerRistrutturazioneAutomaticaTimer(
  Sender: TObject);
begin
  // Avvia la ristrutturazione
  TimerRistrutturazioneAutomatica.Enabled := False;
  DM1.Attendere;
  try
    RistrutturaTutteLeAziende;
  finally
    DM1.ChiudiAttendere;
  end;

  // Aggiorna la versione del DB
  TLevDBVersionFactory.NewDBVersionCheck.UpdateDBVer(MainForm.PrgVersion);

  // Visualizza un messaggio che indica che l'operazione è terminata
  DM1.Messaggi('Lev@nte - Aggiornamento',
               'R I S T R U T T U R A Z I O N E    T E R M I N A T A'#13#13'Ora il programma si chiuderà automaticamente.'#13#13'Potrà iniziare ad utilizzare la nuova versione di Lev@nte semplicemente avviandolo di nuovo.'#13#13#13'Grazie per la collaborazione da tutto lo staff di Lev@nte.',
               'NB: Per proseguire cliccare su "OK" e poi riavviare il programma normalmente.',
               [mbOK], 0, nil);

  // Chiude l'applicazione
  Application.Terminate;
end;

procedure TAziendeForm.SBGridCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TAziendeForm.SBGridOKClick(Sender: TObject);
begin
   case Mode of
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      AZIENDE_MODIFICA: begin
         // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
         //  tutto a posto.
         try
            // Visualizza il Pannello
            PanelAzienda.Visible := True;
            PanelAzienda.BringToFront;
            // IMposta il percorso dell'azienda (Il componente usato non è DBAware
            DBEPercorso.Text := QryAziende.FieldByName('PERCORSO').AsString;
            // Abilita la modifica dei campi
            QryAziende.Edit;
            // Sposta il focus sul primo campo editabile
            DBEPercorso.SetFocus;
            DBENomeAzienda.SetFocus;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna al pannello precedente
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 PanelAzienda.Visible := False;
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità ELIMINA
      // ------------------------------------------------------------------------------
      AZIENDE_ELIMINA: begin
         try
            // Chiede prima conferma
            MessageBeep(0);
            if MessageDlg('Vuoi veramente eliminare l''azienda ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
               // Elimina l'articolo corrente
               QryAziende.Delete;
               QryAziende.ApplyUpdates;
               QryAziende.CommitUpdates;
            end;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna al pannello precedente
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
   end;
end;

procedure TAziendeForm.SBAziendaCancelClick(Sender: TObject);
begin
   case Mode of
      // Se si è in modalità NUOVA AZIENDA
      // ------------------------------------------------------------------------------
      AZIENDE_NUOVA: begin
         // Annulla gli eventuali inserimenti
         QryAziende.Cancel;
         QryAziende.CommitUpdates;
         // Esce direttamente dalla form
         Close;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      AZIENDE_MODIFICA: begin
         // Annulla gli eventuali inserimenti
         QryAziende.Cancel;
         QryAziende.CommitUpdates;
         // Esce dall'azienda per tornare all'elenco
         PanelAzienda.Visible := False;
         // Focus sulla griglia
         GridAziende.SetFocus;
      end;
      // ------------------------------------------------------------------------------
   end;
end;


// Effettua il controllo per verificare che l'utente abbia inserito solo
//  i caratteri ammessi.
function TAziendeForm.NomeAziendaValido(N:String):Boolean;
var
   i:Integer;
   C:Byte;
begin
   // Se è vuoto non è valido
   Result := False;
   if Trim(N) = '' then Exit;
   // Cicla per controllare tutti i caratteri della stringa
   for i := 1 to Length(N) do begin
      // Prima carica su C il codice ascii del carattere corrente
      C := Ord(N[i]);
      // Poi controlla che sia una lettera o un numero (gli unici caratteri ammessi)
      Result := ((C >= 48)and(C <= 57)) or ((C >= 65)and(C <= 90)) or ((C >= 97)and(C <= 122));
      // Se il carattere corrente non è valido esce subito
      if not Result then Exit;
   end;
end;


procedure TAziendeForm.SBAziendaOKClick(Sender: TObject);
begin
   // Sposta ripetutamente il focus perchè altrimenti se l'utente non ha
   //  spostato il focus su un altro campo, il dato potrebbe non essere stato
   //  aggiornato sul dataset.
   DBENomeAzienda.SetFocus;
   Edit1.SetFocus;
   DBENomeAzienda.SetFocus;
   // Controlla che il nome dell'azienda sia valido, cioè che contenga solo
   //  lettere e/o numeri.
   if not NomeAziendaValido(QryAziende.FieldByName('AZIENDA').AsString) then begin
      DM1.Messaggi('Aziende', 'Nome dell''azienda non valido.', 'NB: Il nome dell''azienda deve essere composto solo da lettere e numeri e non deve essere vuoto, è vietato qualunque altro carattere.', [mbOk], 0, nil);
      Exit;
   end;

   case Mode of
      // Se si è in modalità NUOVA AZIENDA
      // ------------------------------------------------------------------------------
      AZIENDE_NUOVA: begin
         try
            // Applica le modifiche effettuate
            QryAziende.Post;
            // Controlla che il percorso non sia nullo, nel qual caso
            //  lo assegna automaticamente.
            if QryAziende.FieldByName('PERCORSO').IsNull then begin
               QryAziende.Edit;
               QryAziende.FieldByName('PERCORSO').Value := DM1.SlashFinale(DM1.CurrDir + QryAziende.FieldByName('AZIENDA').AsString);
               QryAziende.Post;
            end;
            // Rende effettive le modifiche
            QryAziende.ApplyUpdates;
            QryAziende.CommitUpdates;
            // Esce direttamente dalla form
            Close;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna alla modifica
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      AZIENDE_MODIFICA: begin
         try
            // Immette il percorso nel campo (Il componente usato non è DBAware)
            if DBEPercorso.Text <> '' then QryAziende.FieldByname('PERCORSO').Value := DBEPercorso.Text;
            // Controlla che il percorso non sia nullo, nel qual caso
            //  lo assegna automaticamente.
            if QryAziende.FieldByName('PERCORSO').IsNull then begin
               QryAziende.FieldByName('PERCORSO').Value := DM1.SlashFinale(DM1.CurrDir + QryAziende.FieldByName('AZIENDA').AsString);
            end;
            // Applica le modifiche effettuate
            QryAziende.Post;
            QryAziende.ApplyUpdates;
            QryAziende.CommitUpdates;
            // Torna al pannello precedente
            PanelAzienda.Visible := False;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna alla modifica
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 QryAziende.Edit;
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
   end;
end;

procedure TAziendeForm.SBCorreggiProgRigoClick(Sender: TObject);
begin
   if SBCorreggiProgRigo.Down then begin
      DM1.Messaggi('ATTENZIONE !!!', 'Correzione ProgRigo ATTIVATA.', 'NB: Questa funzione è disponibile solamente con la "Ristrutturazione Azienda Selezionata".'#13#13'(Non con la ristrutturazione di tutte le aziende).', [mbOK], 0, nil);
   end else begin
      DM1.Messaggi('ATTENZIONE !!!', 'Correzione ProgRigo DISATTIVATA.', '', [mbOK], 0, nil);
   end;
end;

procedure TAziendeForm.ButtonVerificaClick(Sender: TObject);
var
   P: TMemIniFile;
begin
  if tvAzi.Controller.FocusedRecordIndex = -1 then raise Exception.Create('Nessun azienda selezionata!');

  if DM1.Messaggi('Verifica Integrità Archivi', 'ATTENZIONE!!!'#13#13'Assicurarsi che non ci siano postazioni con Levante aperto!'#13#13'Continuare?', '', [mbOk,mbCancel], 0, nil) <> mrOk then Exit;
  try
    // Si disconnette dal LEVGEN
    DM1.ShowWait('', 'Disconnessione dal LEVGEN');
    DM1.DBGenerale.Disconnect;
    try
      try
        // Ferma il database server
        DM1.ShowWait('', 'Stop database server...');
        StopDatabaseServer(DM1.FirebirdBinDir);
        DM1.MyProcessMessages;
        Sleep(3000);
        DM1.MyProcessMessages;
      finally
        // Riavvia il database server
        DM1.ShowWait('', 'Start database server...');
        StartDatabaseServer(DM1.FirebirdBinDir);
        DM1.MyProcessMessages;
        Sleep(3000);
        DM1.MyProcessMessages;
      end;
      // Effettua la verifica
      DM1.ShowWait('Verifica integrità archivi', 'Operazione in corso...');
      CheckDatabaseIntegrity(DM1.IBUser, DM1.IBPswd, DM1.SlashFinale(tvAzi.Controller.FocusedRecord.Values[tvAziPERCORSO.Index]) + tvAzi.Controller.FocusedRecord.Values[tvAziAZIENDA.Index] + '.GDB', DM1.FirebirdBinDir);
    finally
      // Si Riconnette al LEVGEN
      DM1.ShowWait('', 'Connessione al LEVGEN');
      DM1.DBGenerale.Connect;
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TAziendeForm.tvAziEXCLUSIVEPropertiesEditValueChanged(
  Sender: TObject);
var
  Qry: TIB_Cursor;
  PrecFocused: Integer;
begin
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Qry := TIB_Cursor.Create(Self);
    try
      Qry.DatabaseName := DM1.GenDBFile;
      Qry.IB_Connection := DM1.DBGenerale;
      Qry.SQL.Add('UPDATE AZIENDE SET');
      if (Sender as TcxCheckBox).Checked
      then Qry.SQL.Add('EXCLUSIVEDATABASEACCESS = 1')
      else Qry.SQL.Add('EXCLUSIVEDATABASEACCESS = 0');
      Qry.SQL.Add('WHERE UPPER(AZIENDA) = ''' + Uppercase(tvAzi.Controller.FocusedRecord.Values[tvAziAZIENDA.Index]) + '''');
      Qry.ExecSQL;
      // Effettua il refresh altrimenti non aggiorna lo schermo
      QryAziende.Refresh;
      // Ricarica l'elenco delle aziende
      PrecFocused := tvAzi.DataController.FocusedRecordIndex;
      LoadAziendeToGrid;
      tvAzi.DataController.FocusedRecordIndex := PrecFocused;
    finally
      Qry.Free;
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TAziendeForm.tvAziendeDblClick(Sender: TObject);
begin
   if SBGridOK.Enabled then SBGridOKClick(Self);
end;

procedure TAziendeForm.tvAziendeKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if SBGridOK.Enabled then begin
      if key = Chr(13) then SBGridOKClick(Self);
   end;
end;

end.
