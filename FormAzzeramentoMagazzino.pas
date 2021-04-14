unit FormAzzeramentoMagazzino;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPannelliWizard, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, bmpPanel, IB_Components, DB,
  IBODataset, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxCore,
  cxDateUtils;

type
  TAzzeramentoMagazzinoForm = class(TModelPannelliWizardForm)
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    fMagazzino: TcxComboBox;
    fData: TcxDateEdit;
    Panel12: TPanel;
    AvviaChiusura: TSpeedButton;
    StoredProc1: TIBOStoredProc;
    procedure fMagazzinoPropertiesInitPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AvviaChiusuraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AzzeramentoMagazzinoForm: TAzzeramentoMagazzinoForm;

implementation

uses DataModule1, StrUtils;

{$R *.dfm}

procedure TAzzeramentoMagazzinoForm.fMagazzinoPropertiesInitPopup(
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

procedure TAzzeramentoMagazzinoForm.FormShow(Sender: TObject);
begin
  inherited;
  // Forza la chiamata al gestore di evento onInitPopup del compobox
  //  che indica il magazzino su cui operare in modo da caricare le
  //  possibili scelte e fare in modo che se c'è un solo magazzino questo
  //  sia selezionato di default.
  fMagazzinoPropertiesInitPopup(fMagazzino);
end;

procedure TAzzeramentoMagazzinoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AzzeramentoMagazzinoForm := nil;
end;

procedure TAzzeramentoMagazzinoForm.AvviaChiusuraClick(Sender: TObject);
var
  CodMag: Integer;
  NewDataChiusura: TDate;
begin
  inherited;
  // Verifica che non ci siano già transazioni in atto e se ci sono lancia un allarme
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
    if DM1.Messaggi('Azzeramento giacenze di magazzino', 'ATTENZIONE !!!'#13#13'L''effetto di questa operazione sarà irreversibile e azzererà tutte le giacenze di magazzino precedenti alla data impostata.'#13#13 +
                    'Se non si conoscono gli effetti di questa procedura si consiglia di NON CONTINUARE e chiamare il CENTRO SERVIZI LEVANTE.'#13#13'Continuare?', '', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
    if DM1.Messaggi('Azzeramento giacenze di magazzino', 'L''operazione POTREBBE RICHIEDERE MOLTO TEMPO durante il quale il programma sembrerà come bloccato.'#13#13'Continuare ugualmente?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
    if DM1.Messaggi('Azzeramento giacenze di magazzino', 'CONFERMA FINALE'#13#13#13'Questa è l''ultima possibilità di annullare l''operazione.'#13#13'Sei veramente sicuro/a di voler continuare?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;

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
      DM1.ShowWait('Azzeramento giacenze di magazzino', 'Operazione in corso...');
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
  DM1.Messaggi('Azzeramento giacenze di magazzino', 'Operazione terminata!', '', [mbOk], 0, nil);
  Close;
end;

end.
