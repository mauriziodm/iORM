unit FormChiusuraMagazzino;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPannelliWizard, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, bmpPanel, MAURI_SB, DB, IBODataset, IB_Components,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxCore, cxDateUtils;

type
  TChiusuraMagazzinoForm = class(TModelPannelliWizardForm)
    Panel12: TPanel;
    AvviaChiusura: TSpeedButton;
    QryDelMag: TIB_Cursor;
    QrySetRighiChiusi: TIB_Cursor;
    QryCopyMag: TIB_Cursor;
    QryDelMagTemp: TIB_Cursor;
    QryNewMag: TIB_Cursor;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    fMagazzino: TcxComboBox;
    fData: TcxDateEdit;
    StoredProc1: TIBOStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AvviaChiusuraClick(Sender: TObject);
    procedure EffettuaChiusuraMagazzino(DataChiusura: TDateTime);
    procedure fMagazzinoPropertiesInitPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  ChiusuraMagazzinoForm: TChiusuraMagazzinoForm;

implementation

uses DataModule1, DateUtils, StrUtils;

{$R *.dfm}

procedure TChiusuraMagazzinoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ChiusuraMagazzinoForm := nil;
end;

procedure TChiusuraMagazzinoForm.EffettuaChiusuraMagazzino(DataChiusura:TDateTime);
begin
  // Verifica che non ci siano già transazioni in atto e se ci sono lancia un allarme
  DM1.CheckForAlreadyInTransaction;
  try
    DM1.ShowWait('Chiusura Magazzino (Consolidamento)', 'Inizializzazione...');
    // Prima di tutto elabora il parametro contenente la Data di chiusura desiderata e fa
    //  in modo che diventi all'inizio del giorno dopo, questo perchè poi nelle query utilizzate
    //  nella clausa WHERE faccio '< DataChiusura' in modo da includere anche i documenti
    //  del giorno di chiusura stesso.
    DataChiusura := StartOfTheDay(IncDay(DataChiusura, 1));
    // Avvia la transazione
    DM1.ShowWait('', 'Inizio transazione...');
    DM1.DBAzienda.StartTransaction;
    try
      // Pulizia della tabella MAGAZZINI_TEMP
      DM1.ShowWait('', 'Azzeramento MAGAZZINI_TEMP...');
      QryDelMagTemp.ExecSQL;
      // Esegue la query che calcola le giacenze di ciascun articolo e ne copia
      //  il risultato sulla tabella MAGAZZINI_TEMP
      DM1.ShowWait('', 'Calcolo giacenze a tutto il giorno di chiusura...');
      if not QryCopyMag.Prepared then QryCopyMag.Prepare;
      QryCopyMag.Params.ParamByName('P_DATACHIUSURA').AsDateTime := DataChiusura;
      QryCopyMag.ExecSQL;
      // Query che svuota la tabella MAGAZZINI
      DM1.ShowWait('', 'Azzeramento magazzini...');
      QryDelMag.ExecSQL;
      // Query che ricostruisce le giacenze nella tabella MAGAZZINI
      DM1.ShowWait('', 'Ricostruzione magazzini...');
      QryNewMag.ExecSQL;
      // Query che marca come chiusi tutti i righi oggetto della chiusura stessa
      DM1.ShowWait('', 'Chiusura documenti...');
      if not QrySetRighiChiusi.Prepared then QrySetRighiChiusi.Prepare;
      QrySetRighiChiusi.Params.ParamByName('P_DATACHIUSURA').AsDateTime := DataChiusura;
      QrySetRighiChiusi.ExecSQL;
      // Pulizia finale della tabella MAGAZZINI_TEMP
      DM1.ShowWait('', 'Azzeramento MAGAZZINI_TEMP...');
      QryDelMagTemp.ExecSQL;
      // Commit finale se tutto è andato bene
      DM1.ShowWait('', 'Conferma transazione...');
      DM1.DBAzienda.Commit;
    except
      DM1.ShowWait('', 'Annullamento transazione...');
      DM1.DBAzienda.Rollback;
    end;
  finally
    DM1.CloseWait;
    // Messaggio finale.
    if Self.Visible
    then DM1.Messaggi('Chiusura Magazzino (Consolidamento)', 'Operazione terminata.', '', [mbOk], 0, nil);
  end;
end;

procedure TChiusuraMagazzinoForm.AvviaChiusuraClick(Sender: TObject);
var
  CodMag: Integer;
  NewDataChiusura: TDate;
begin
  inherited;
  // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
  DM1.CheckForAlreadyInTransaction;
  // L'operazione può continuare solo se abbiamo accesso esclusivo al database (per sicurezza)
  //  NB: Al messaggio che avverte se ci son altri utenti collegati ci pensa già
  //      la funzione "LockDatabaseAccess".
  if not DM1.LockDatabaseAccess then Exit;
  try
    // Verifica i campi necessari siano valorizzati
    if Trim(fData.EditText)         = ''  then raise Exception.Create('Data non inserita.');
    if fMagazzino.ItemIndex         = -1  then raise Exception.Create('Magazzino non selezionato.');
    // Richiede conferma all'utente
    if DM1.Messaggi('Chiusura magazzino (consolidamento)', 'ATTENZIONE !!!'#13#13'L''effetto di questa operazione sarà irreversibile e azzererà tutte le giacenze di magazzino precedenti alla data impostata.'#13#13 +
                    'Se non si conoscono gli effetti di questa procedura si consiglia di NON CONTINUARE e chiamare il CENTRO SERVIZI LEVANTE.'#13#13'Continuare?', '', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
    if DM1.Messaggi('Chiusura magazzino (consolidamento)', 'L''operazione POTREBBE RICHIEDERE MOLTO TEMPO durante il quale il programma sembrerà come bloccato.'#13#13'Continuare ugualmente?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    if DM1.Messaggi('Chiusura magazzino (consolidamento)', 'CONFERMA FINALE'#13#13#13'Questa è l''ultima possibilità di annullare l''operazione.'#13#13'Sei veramente sicuro/a di voler continuare?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;

    // Ricava il codice del magazzino selezionato
    // NB: Faccio così perchè se il dato non è a posto almeno mi ritorna un errore prima di continuare.
    CodMag := StrToInt(LeftStr(fMagazzino.Properties.Items[fMagazzino.ItemIndex]   , 2));
    // RIcava la data di chiusura richiesta
    // NB: Faccio così perchè se il dato non è a posto almeno mi ritorna un errore prima di continuare.
    NewDataChiusura := fData.Date;

    // Avvia la transazione
    DM1.DBAzienda.StartTransaction;
    try try
      // Avverte l'utente di quello che sta facendo.
      DM1.ShowWait('Chiusura (consolidamento) magazzino', 'Operazione in corso...');
      // Imposta i parametri della stored procedure
      if not StoredProc1.Prepared then StoredProc1.Prepare;
      StoredProc1.Params.ParamByName('IN_UTENTE').AsString        := DM1.IDOperatoreCorrente;
      StoredProc1.Params.ParamByName('IN_COD_MAG').AsInteger      := CodMag;
      StoredProc1.Params.ParamByName('IN_DATA_RICHIESTA').AsDate  := NewDataChiusura;
      // Esegue la stored procedure
      StoredProc1.ExecProc;
      // Se tutto è andato bene esegue il commit
      DM1.DBAzienda.Commit;
      // Se tutto è andato bene esce...
      DM1.CloseWait;
    except
      // Se invece ci sono stati problemi annulla tutto
      DM1.DBAzienda.Rollback;
      // Rilanca l'eccezione che altrimenti rimarrebbe invisibile all'utente.
      raise;
    end;
    finally
      // Chiude eventuali messaggi sospesi
      DM1.CloseWait;
    end;

  finally
    // SI assicura di sbloccare il database
    DM1.UnLockDatabaseAccess;
  end;

  // Messaggio di operazione terminata
  DM1.Messaggi('Chiusura (consolidamento) magazzino', 'Operazione terminata!', '', [mbOk], 0, nil);
  Close;

end;

procedure TChiusuraMagazzinoForm.fMagazzinoPropertiesInitPopup(
  Sender: TObject);
var
  Q: TIB_Cursor;
  Codice, Descrizione: String;
begin
  inherited;
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT CODICE, DESCRIZIONE FROM ANAGMAGA ORDER BY CODICE');
    Q.Open;
    fMagazzino.Properties.Items.Clear;
    while not Q.Eof do begin
      Codice      := DM1.PadR(Q.FieldByName('CODICE').AsString, '0', 2);
      Descrizione := Trim(Q.FieldByName('DESCRIZIONE').AsString);
      fMagazzino.Properties.Items.Add(Codice + ' - ' + Descrizione);
      Q.Next;
    end;
    Q.Close;
    // Se c'è un solo magazzino lo selezione per default
    if fMagazzino.Properties.Items.Count = 1 then fMagazzino.ItemIndex := 0;
  finally
    Q.Free;
  end;
end;

procedure TChiusuraMagazzinoForm.FormShow(Sender: TObject);
begin
  inherited;
  // Forza la chiamata al gestore di evento onInitPopup del compobox
  //  che indica il magazzino su cui operare in modo da caricare le
  //  possibili scelte e fare in modo che se c'è un solo magazzino questo
  //  sia selezionato di default.
  fMagazzinoPropertiesInitPopup(fMagazzino);
end;

end.
