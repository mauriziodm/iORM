unit FormForzaGiacenzeMagazzino;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxCheckBox,
  Buttons, IB_Components, DB, IBODataset, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TArticoloDaForzare = record
    Codice: String;
    Descrizione: String;
  end;

  TForzaGiacenzeMagazzinoForm = class(TForm)
    Label5: TLabel;
    LabelArticolo: TLabel;
    Label2: TLabel;
    fGiacenza: TcxCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    fImpegnato: TcxCurrencyEdit;
    Label6: TLabel;
    fOrdinato: TcxCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    fData: TcxDateEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    fMagazzino: TcxComboBox;
    Label10: TLabel;
    Label11: TLabel;
    cxCheckBox1: TcxCheckBox;
    Label12: TLabel;
    StoredProc1: TIBOStoredProc;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fMagazzinoPropertiesInitPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxCheckBox1PropertiesEditValueChanged(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Articoli: Array of TArticoloDaForzare;
    procedure VisualizzaDatiArticolo;
    { Private declarations }
  public
    { Public declarations }
    procedure AddArticolo(Codice, Descrizione: String);
  end;

var
  ForzaGiacenzeMagazzinoForm: TForzaGiacenzeMagazzinoForm;

implementation

uses DataModule1, StrUtils;

{$R *.dfm}


procedure TForzaGiacenzeMagazzinoForm.FormShow(Sender: TObject);
begin
  // Visualizza i dati dell'articolo
  VisualizzaDatiArticolo;
  // Forza la chiamata al gestore di evento onInitPopup del compobox
  //  che indica il magazzino su cui operare in modo da caricare le
  //  possibili scelte e fare in modo che se c'è un solo magazzino questo
  //  sia selezionato di default.
  fMagazzinoPropertiesInitPopup(fMagazzino);
  // Focus sul primo cmpo editabile
  fData.SetFocus;
  MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TForzaGiacenzeMagazzinoForm.VisualizzaDatiArticolo;
begin
  // Inizializzazione
  LabelArticolo.Caption := 'ATTENZIONE !!! - Nessun articolo selezionato!';
  // Se è presente un solo articolo...
  if Length(Articoli) = 1 then begin
    LabelArticolo.Caption := 'Articolo:   ' + Articoli[0].Codice + ' - ' + Articoli[0].Descrizione;
  // Se invece sono presenti più di un articolo
  end else if Length(Articoli) > 1 then begin
    LabelArticolo.Caption := IntToStr(Length(Articoli)) + '  Articoli selezionati.';
  end;
end;

procedure TForzaGiacenzeMagazzinoForm.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then begin
    Key := 0;
    Close;
  end;
end;

procedure TForzaGiacenzeMagazzinoForm.fMagazzinoPropertiesInitPopup(
  Sender: TObject);
var
  Q: TIB_Cursor;
  Codice, Descrizione: String;
begin
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

procedure TForzaGiacenzeMagazzinoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Alla chiusura distrugge la form e reimposta a nil il suo puntatore
  Action := caFree;
  ForzaGiacenzeMagazzinoForm := nil;
end;

procedure TForzaGiacenzeMagazzinoForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForzaGiacenzeMagazzinoForm.AddArticolo(Codice,Descrizione: String);
var
  i: Integer;
begin
  // Aggiunge l'articolo all'elenco degli articoli da elaborare
  // ----------------------------------------------------------
  i := Length(Articoli);
  SetLength(Articoli, i+1);
  Articoli[i].Codice := Codice;
  Articoli[i].Descrizione := LeftStr(Descrizione, 60);
end;

procedure TForzaGiacenzeMagazzinoForm.FormCreate(Sender: TObject);
begin
  // Inizializzazione
  SetLength(Articoli,0);
end;

procedure TForzaGiacenzeMagazzinoForm.cxCheckBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  // Se è checckato avvisa l'utente delle conseguenze.
  if (Sender as TcxCheckBox).Checked then begin
    // 1° avviso
    if DM1.Messaggi('Forza giacenze magazzino', 'A T T E N Z I O N E !!!'#13#13#13'Con questa scelta la giacenza dell''articolo verrà fissata (consolidata) alla data richiesta e I DOCUMENTI PRECEDENTI NON VERRANNO PIU'' CONSIDERATI.'#13#13 +
                    'Inoltre eventuali chiusure precedenti saranno eliminate e quindi l''operazione sarà IRREVERSIBILE.'#13#13 +
                    'Per i motivi sopra esposti, in seguito,  NON SARA'' POSSIBILE RICHIEDERE LA GIACENZA AD UNA DATA PRECEDENTE.'#13#13 +
                    'Quindi NON SARA'' POSSIBILE NEMMENO FARE UN INVENTARIO AD UNA DATA ANTECEDENTE ALLA DATA RICHIESTA.'#13#13#13 +
                    'Continuare con questa scelta?'
                    , 'NB: Se si sceglie "NO" la spunta su questa opzione verrà tolta automaticamente.'
                    , [mbYes, mbNo], 0, nil) <> mrYes
    then begin
      cxCheckBox1.Checked := False;
      Exit;
    end;
    // 2° avviso
    if DM1.Messaggi('Forza giacenze magazzino', 'Sei sicuro/a?'#13#13'Se hai dei dubbi chiama il centro servizi Levante per un consulto.'#13#13#13 +
                    'Continuare con questa scelta?'
                    , 'NB: Se si sceglie "NO" la spunta su questa opzione verrà tolta automaticamente.'
                    , [mbYes, mbNo], 0, nil) <> mrYes
    then begin
      cxCheckBox1.Checked := False;
      Exit;
    end;
  end;
end;

procedure TForzaGiacenzeMagazzinoForm.BitBtn1Click(Sender: TObject);
var
  CodMag: Integer;
  i: Integer;
  NewDataChiusura: TDate;
  NewGiacenza, NewImpegnato, NewOrdinato: Double;
  ForzaChiusuraArticolo: Char;
begin
  // Verifica che non ci siano già transazioni in atto
  // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
  DM1.CheckForAlreadyInTransaction;
  // Verifica i campi necessari siano valorizzati
  if Trim(fData.EditText)         = ''  then raise Exception.Create('Data non inserita.');
  if fMagazzino.ItemIndex         = -1  then raise Exception.Create('Magazzino non selezionato.');
  if Trim(fGiacenza.EditingText)  = ''  then raise Exception.Create('Giacenza non inserita.');
  if Trim(fImpegnato.EditingText) = ''  then raise Exception.Create('Quantità impegnata non inserita.');
  if Trim(fOrdinato.EditingText)  = ''  then raise Exception.Create('Quantità ordinata non inserita.');

  // Prima di proseguire chiede conferma
  if DM1.Messaggi('Forza giacenza articolo', 'Confermi di voler continuare con l''operazione?', 'NB: In caso di dubbi chiamare il centro servizi Levante per un consulto.', [mbYes, mbNo], 0, nil) <> mrYes then begin
    Exit;
  end;

  // Ricava il codice del magazzino selezionato
  // NB: Faccio così perchè se il dato non è a posto almeno mi ritorna un errore prima di continuare.
  CodMag := StrToInt(LeftStr(fMagazzino.Properties.Items[fMagazzino.ItemIndex]   , 2));
  // RIcava la data di chiusura richiesta
  // NB: Faccio così perchè se il dato non è a posto almeno mi ritorna un errore prima di continuare.
  NewDataChiusura := fData.Date;
  // RIcava le giacenze
  // NB: Faccio così perchè se il dato non è a posto almeno mi ritorna un errore prima di continuare.
  NewGiacenza   := fGiacenza.Value;
  NewImpegnato  := fImpegnato.Value;
  NewOrdinato   := fOrdinato.Value;
  // IMposta il char che determina se deve effettuare anche una chiusura alla data richiesta
  //  e quindi ignorare, da ora in poi, i documenti precedenti.
  if cxCheckBox1.Checked then ForzaChiusuraArticolo := 'T' else ForzaChiusuraArticolo := 'F';

  // Avvia la transazione
  DM1.DBAzienda.StartTransaction;
  try try
    // Cicla per tutti gli articoli da elaborare
    for i := 0 to Length(Articoli) -1 do begin
      // Avverte l'utente di quello che sta facendo.
      DM1.ShowWait('Levante', 'Impostazione giacenza articolo:   ' + Articoli[i].Codice + ' - ' + Articoli[i].Descrizione);
      // Verifica che il codice articolo non sia  vuoto
      if Trim(Articoli[i].Codice) = '' then raise Exception.Create('Codice articolo non valido (vuoto o spazi).');
      // Imposta i parametri della stored procedure
      if not StoredProc1.Prepared then StoredProc1.Prepare;
      StoredProc1.Params.ParamByName('IN_UTENTE').AsString        := DM1.IDOperatoreCorrente;
      StoredProc1.Params.ParamByName('IN_COD_ART').AsString       := Articoli[i].Codice;
      StoredProc1.Params.ParamByName('IN_COD_MAG').AsInteger      := CodMag;
      StoredProc1.Params.ParamByName('IN_GIACENZA').AsFloat       := NewGiacenza;
      StoredProc1.Params.ParamByName('IN_IMPEGNATO').AsFloat      := NewImpegnato;
      StoredProc1.Params.ParamByName('IN_ORDINATO').AsFloat       := NewOrdinato;
      StoredProc1.Params.ParamByName('IN_DATA_RICHIESTA').AsDate  := NewDataChiusura;
      StoredProc1.Params.ParamByName('IN_EFFETTUA_CHIUSURA').AsString := ForzaChiusuraArticolo;
      // Esegue la stored procedure
      StoredProc1.ExecProc;
    end;
    // Se tutto è andato bene esegue il commit
    DM1.DBAzienda.Commit;
    // Se tutto è andato bene esce dalla form
    DM1.CloseWait;
    Close;
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

end;

end.
