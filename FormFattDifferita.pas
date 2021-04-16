unit FormFattDifferita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IB_Components, IBODataset, Db, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ComCtrls, Buttons, bmpPanel,
  MAURI_SB, SACS, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxCore, cxDateUtils, cxButtonEdit;

type
  TFattDifferitaForm = class(TForm)
    ClientArea: TPanel;
    PanelModo: TPanel;
    LabelModo: TLabel;
    PanelMeseCompetenza: TPanel;
    LabelMeseCompetenza: TLabel;
    PanelDate: TPanel;
    LabelDate: TLabel;
    PanelCopie: TPanel;
    LabelCopie: TLabel;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    ModoCompetenza: TRadioButton;
    ModoDate: TRadioButton;
    ModoManuale: TRadioButton;
    Copie: TEdit;
    Panel5: TPanel;
    ScadSi: TRadioButton;
    ScadNo: TRadioButton;
    Panel6: TPanel;
    AvantiDate: TSpeedButton;
    Panel7: TPanel;
    AvantiModo: TSpeedButton;
    Panel8: TPanel;
    AvantiCompetenza: TSpeedButton;
    Panel9: TPanel;
    AvantiCopie: TSpeedButton;
    PanelFine: TPanel;
    LabelFine: TLabel;
    RichEdit5: TRichEdit;
    Panel12: TPanel;
    IniziaFatturazione: TSpeedButton;
    Panel11: TPanel;
    UpDown1: TUpDown;
    CompGen: TCheckBox;
    CompFeb: TCheckBox;
    CompMar: TCheckBox;
    CompApr: TCheckBox;
    CompMag: TCheckBox;
    CompGiu: TCheckBox;
    CompLug: TCheckBox;
    CompAgo: TCheckBox;
    CompSet: TCheckBox;
    CompOtt: TCheckBox;
    CompNov: TCheckBox;
    CompDic: TCheckBox;
    Annulla: TSpeedButton;
    PanelSicurezza: TPanel;
    RichEdit6: TRichEdit;
    Panel13: TPanel;
    SiCopia: TSpeedButton;
    Panel14: TPanel;
    NoCopia: TSpeedButton;
    ClientTopPanel: TbmpPanel;
    FattDal: TcxDateEdit;
    FattAl: TcxDateEdit;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DataFatturazione: TcxDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    Causale: TcxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RefreshScreen;
    procedure AvantiModoClick(Sender: TObject);
    procedure AnnullaClick(Sender: TObject);
    procedure EsportaDocumentiDaFatturarePerData;
    procedure EsportaDocumentiDaFatturarePerCOmpetenza;
    procedure IniziaFatturazioneClick(Sender: TObject);
    procedure AvviaFatturazione;
    procedure NoCopiaClick(Sender: TObject);
    procedure SiCopiaClick(Sender: TObject);
    procedure CausalePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
    // Contiene l'indicazione del livello attivo al momento
    LivelloAttivo:Shortint;
  public
    { Public declarations }
  end;

var
  FattDifferitaForm: TFattDifferitaForm;

implementation

uses main, DataModule1, SchedaPreventiviOrdini, FormCausali;

{$R *.DFM}

procedure TFattDifferitaForm.AvviaFatturazione;
var
   Pratica:Integer;
   DataPratica:String;
   SeparaPerPratica:Boolean;
   Qry:TIBOQuery;
begin
   // Crea e imposta Qry
   Qry := TIBOQuery.Create(Self);
   Qry.DatabaseName := DM1.GenDBFile;
   Qry.IB_Connection := DM1.DBGenerale;
   Qry.MaxRows := 1;   // In questo modo si fà mandare solo il primo record diminuendo il traffico di rete.
   // Crea e visualizza form dei docuemnti fiscali perchè la funzione che crea i nuovi
   //  documento non lo fà automaticamente.
   Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
   PreventiviOrdiniForm.TipoDoc := 'Fattura';
   PreventiviOrdiniForm.Parent := MainForm;
   PreventiviOrdiniForm.Tag    := MODE_FATTURAZIONE_DIFFERITA;
   PreventiviOrdiniForm.Show;
   try
      // Visualizza la form di attesa con messaggi
      DM1.ShowWait('Fatturazione Differita', 'Prelevamento primo documento da fatturare.');
      // Imposta la query che preleverà l'elenco dei documenti da fatturare
      Qry.SQL.Add('SELECT DISTINCT TIPODOCUMENTO,REGISTRO,NUMORDPREV,DATADOCUMENTO,CODICECLIENTE FROM TMPRIGHI');
      Qry.SQL.Add('WHERE STATION_ID = ' + DM1.CodiceUtente);
      Qry.SQL.Add('ORDER BY DATADOCUMENTO,REGISTRO,NUMORDPREV,TIPODOCUMENTO');
      // Cicla fino a quando il file dei righi temporanei da importare è vuoto
      Qry.Open;
      while not Qry.Eof do
      begin
// PER IL MOMENTO NON SPUò FATTURARE SEPARATAMENTE PER PRATICA
// ==============================================================================================================================================================================
         // In base alla selezione o meno della check box che indica se generare una fattura separata
         //  per ogni pratica, imposta il parametro 'Pratica' con cui richiamare la funzione
         //  che genererà la fattura differita.
//         if CheckBox2.Checked then begin
//            Pratica          := DM1.TableTmpRighiPratica.Value;
//            DataPratica      := DateToStr(Dm1.TableTmpRighiDataPratica.Value);
//            SeparaPerPratica := True;
//         end else begin
            Pratica          := 0;
            DataPratica      := '';
            SeparaPerPratica := False;
//         end;
// ==============================================================================================================================================================================
         // Visualizza la form di attesa con messaggi
         DM1.ShowWait('Fatturazione Differita', 'Fatturazione dei documenti del soggetto: ' + Qry.FieldByName('CodiceCliente').AsString);
         // Richiama la funzione che genera il nuovo documento
         //  e in base alla selezione o meno della funzione di generazione delle scadenze
         //  la richiama con i parametri corretti.
         if ScadSi.Checked then begin
            // Genera anche le scadenze
            DM1.NuovoDocFisc('Fattura', Qry.FieldByName('REGISTRO').AsString, Qry.FieldByName('CodiceCliente').Value, Pratica,DataPratica, 3, StrToInt(Copie.Text), True, SeparaPerPratica, DataFatturazione.Date, Causale.Text);
         end else begin
            // Non genera le scadenze
            DM1.NuovoDocFisc('Fattura', Qry.FieldByName('REGISTRO').AsString, Qry.FieldByName('CodiceCliente').Value, Pratica,DataPratica, 2, StrToInt(Copie.Text), True, SeparaPerPratica, DataFatturazione.Date, Causale.Text);
         end;
         // Riavvia la query per aggiornarla
         Qry.Close;
         Qry.Open;
      end;
   finally
      // Visualizza la form di attesa con messaggi
      DM1.ShowWait('Fatturazione Differita', 'Chiusura fatturazione differita');
      // Distrugge la query
      Qry.Close;
      Qry.Free;
      // Distrugge la form dei documenti fiscali.
      PreventiviOrdiniForm.Close;
      // Aggiorna lo schermo
      MainForm.AggiornaDocumentiEsportati;
   end;
end;


procedure TFattDifferitaForm.CausalePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  DM1.Attendere;
  try
    // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
    Application.CreateForm(TCausaliForm, CausaliForm);
    MainForm.SetParentComponent(CausaliForm);
    CausaliForm.Tag := 996; // Abilita la selezione
    CausaliForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TFattDifferitaForm.EsportaDocumentiDaFatturarePerData;
var
   Qry: TIBOQuery;
begin
   Qry := TIBOQuery.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Query che trova tutti i documenti da fatturare nell'intervallo di date specificate
      Qry.SQL.Add('SELECT TipoDocumento,Registro,NumOrdPrev,DataDocumento FROM PrvOrdCl');
      Qry.SQL.Add('WHERE (DAFATTURARE = ''F'' OR SELEZIONATO = ''F'')');   // NB: Il controllo su SELEZIONATO è rimasto per compatibilità
      if FattDal.EditText <> '' then Qry.SQL.Add('AND DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy', StrToDate(FattDal.EditText)) + '''');
      if FattAl.EditText  <> '' then Qry.SQL.Add('AND DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy', StrToDate(FattAl.EditText)) + '''');
      Qry.SQL.Add('ORDER BY DataDocumento, NumOrdPrev, Registro');
      // Visualizza la form di attesa con messaggi
      DM1.ShowWait('Fatturazione Differita', 'Ricerca dei documenti da fatturare.');
      // Apre la query
      Qry.Open;
      // Cicla per tutti i documenti trovati e li esporta nella bacheca e aggiorna lo schermoi
      while not Qry.Eof do begin
         // Visualizza la form di attesa con messaggi
         DM1.ShowWait('Fatturazione Differita', 'Esportazione in bacheca del documento:'#13#13'(' + Qry.FieldByName('TIPODOCUMENTO').AsString + ' n° ' + Qry.FieldByName('NUMORDPREV').AsString + Qry.FieldByName('REGISTRO').AsString + ' del ' + Qry.FieldByName('DATADOCUMENTO').AsString + ')');
         // Esporta il documento
         DM1.EsportaDocFisc(Qry.FieldByName('TIPODOCUMENTO').AsString, Qry.FieldByName('REGISTRO').AsString, Qry.FieldByName('NUMORDPREV').AsInteger, Qry.FieldByName('DATADOCUMENTO').AsDateTime);
         // Và al prossimo documento
         Qry.Next;
      end;
      // Visualizza la form di attesa con messaggi
      DM1.ShowWait('Fatturazione Differita', 'Aggiornamento schermo.');
      MainForm.AggiornaDocumentiEsportati;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;


procedure TFattDifferitaForm.EsportaDocumentiDaFatturarePerCompetenza;
var
   Qry: TIBOQuery;
   Year, Month, Day: Word;
begin
   // Preleva l'anno
   DecodeDate(Now, Year, Month, Day);
   // Crea la query
   Qry := TIBOQuery.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Query che trova tutti i documenti da fatturare nell'intervallo di date specificate
      Qry.SQL.Add('SELECT TipoDocumento,Registro,NumOrdPrev,DataDocumento FROM PrvOrdCl');
      Qry.SQL.Add('WHERE (DAFATTURARE = ''F'' OR SELEZIONATO = ''F'')');   // NB: Il controllo su SELEZIONATO è rimasto per compatibilità
      Qry.SQL.Add('AND DATADOCUMENTO >= ''01/01/' + IntToStr(Year) + '''');
      Qry.SQL.Add('AND DATADOCUMENTO <= ''12/31/' + IntToStr(Year) + '''');
      // Filtra in base ai mesi di competenza selezionati
      Qry.SQL.Add('AND(');
      if CompGen.Checked then Qry.SQL.Add('MESECOMPETENZA = 1 OR');
      if CompFeb.Checked then Qry.SQL.Add('MESECOMPETENZA = 2 OR');
      if CompMar.Checked then Qry.SQL.Add('MESECOMPETENZA = 3 OR');
      if CompApr.Checked then Qry.SQL.Add('MESECOMPETENZA = 4 OR');
      if CompMag.Checked then Qry.SQL.Add('MESECOMPETENZA = 5 OR');
      if CompGiu.Checked then Qry.SQL.Add('MESECOMPETENZA = 6 OR');
      if CompLug.Checked then Qry.SQL.Add('MESECOMPETENZA = 7 OR');
      if CompAgo.Checked then Qry.SQL.Add('MESECOMPETENZA = 8 OR');
      if CompSet.Checked then Qry.SQL.Add('MESECOMPETENZA = 9 OR');
      if CompOtt.Checked then Qry.SQL.Add('MESECOMPETENZA = 10 OR');
      if CompNov.Checked then Qry.SQL.Add('MESECOMPETENZA = 11 OR');
      if CompDic.Checked then Qry.SQL.Add('MESECOMPETENZA = 12 OR');
      // Elimina l'ultimo or
      Qry.SQL[Qry.SQL.Count-1] := DM1.StrLeft(Qry.SQL[Qry.SQL.Count-1], Length(Qry.SQL[Qry.SQL.Count-1]) -3);
      // Chiude la parentesi
      Qry.SQL.Add(')');
      // Ordinamento
      Qry.SQL.Add('ORDER BY DataDocumento, NumOrdPrev, Registro');
      // Visualizza la form di attesa con messaggi
      DM1.ShowWait('Fatturazione Differita', 'Ricerca dei documenti da fatturare.');
      // Apre la query
      Qry.Open;
      // Cicla per tutti i documenti trovati e li esporta nella bacheca e aggiorna lo schermoi
      while not Qry.Eof do begin
         // Visualizza la form di attesa con messaggi
         DM1.ShowWait('Fatturazione Differita', 'Esportazione in bacheca del documento:'#13#13'(' + Qry.FieldByName('TIPODOCUMENTO').AsString + ' n° ' + Qry.FieldByName('NUMORDPREV').AsString + Qry.FieldByName('REGISTRO').AsString + ' del ' + Qry.FieldByName('DATADOCUMENTO').AsString + ')');
         // Esporta il documento
         DM1.EsportaDocFisc(Qry.FieldByName('TIPODOCUMENTO').AsString, Qry.FieldByName('REGISTRO').AsString, Qry.FieldByName('NUMORDPREV').AsInteger, Qry.FieldByName('DATADOCUMENTO').AsDateTime);
         // Và al prossimo documento
         Qry.Next;
      end;
      // Visualizza la form di attesa con messaggi
      DM1.ShowWait('Fatturazione Differita', 'Aggiornamento schermo.');
      MainForm.AggiornaDocumentiEsportati;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;


procedure TFattDifferitaForm.RefreshScreen;
var
   Year, Month, Day: Word;
begin
   // In base al livello attivo aggiorna lo schermo in modo appropriato
   // =================================================================
   case LivelloAttivo of
      // LIVELLO0
      0: begin
         MessageBeep(0);
         PanelSicurezza.Top := 40;
         PanelSicurezza.Visible := True;
         DM1.SetPanelState(0, PanelModo, LabelModo, LivelloAttivo);
         DM1.SetPanelState(0, PanelMeseCompetenza, LabelMeseCompetenza, LivelloAttivo);
         DM1.SetPanelState(0, PanelDate, LabelDate, LivelloAttivo);
         DM1.SetPanelState(0, PanelCopie, LabelCopie, LivelloAttivo);
         DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
      end;
      // LIVELLO1
      1: begin
         PanelSicurezza.Visible := False;
         DM1.SetPanelState(2, PanelModo, LabelModo, LivelloAttivo);
         DM1.SetPanelState(0, PanelMeseCompetenza, LabelMeseCompetenza, LivelloAttivo);
         DM1.SetPanelState(0, PanelDate, LabelDate, LivelloAttivo);
         DM1.SetPanelState(0, PanelCopie, LabelCopie, LivelloAttivo);
         DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
         ModoCompetenza.SetFocus;
      end;
      // LIVELLO2
      2: begin
         PanelSicurezza.Visible := False;
         // PanelModo disattivo
         DM1.SetPanelState(1, PanelModo, LabelModo, LivelloAttivo);
         // In base alla selezione del modo...
         if ModoCompetenza.Checked then begin
            // Se Per mese di competenza
            DM1.SetPanelState(2, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(0, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(0, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
            // Inizializza il mese di competenza
            DecodeDate(Now, Year, Month, Day);
            case Month of
               1:  CompGen.SetFocus;
               2:  CompFeb.SetFocus;
               3:  CompMar.SetFocus;
               4:  CompApr.SetFocus;
               5:  CompMag.SetFocus;
               6:  CompGiu.SetFocus;
               7:  CompLug.SetFocus;
               8:  CompAgo.SetFocus;
               9:  CompSet.SetFocus;
               10: CompOtt.SetFocus;
               11: CompNov.SetFocus;
               12: CompDic.SetFocus;
            end;
         end else if ModoDate.Checked then begin
            // Se per intervallo di date
            DM1.SetPanelState(0, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(2, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(0, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
            FattDal.SetFocus;
         end else if ModoManuale.Checked then begin
            // Se manuale
            DM1.SetPanelState(0, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(0, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(2, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
            Copie.SetFocus
         end;
      end;
      // LIVELLO3
      3: begin
         PanelSicurezza.Visible := False;
         // PanelModo disattivo
         DM1.SetPanelState(1, PanelModo, LabelModo, LivelloAttivo);
         // In base alla selezione del modo...
         if ModoCompetenza.Checked then begin
            // Se Per mese di competenza
            DM1.SetPanelState(1, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(0, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(2, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
            Copie.SetFocus;
         end else if ModoDate.Checked then begin
            // Se per intervallo di date
            DM1.SetPanelState(0, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(1, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(2, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
            Copie.SetFocus;
         end else if ModoManuale.Checked then begin
            // Se manuale
            DM1.SetPanelState(0, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(0, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(1, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(2, PanelFine, LabelFine, LivelloAttivo);
         end;
      end;
      // LIVELLO4
      4: begin
         PanelSicurezza.Visible := False;
         // PanelModo disattivo
         DM1.SetPanelState(1, PanelModo, LabelModo, LivelloAttivo);
         // In base alla selezione del modo...
         if ModoCompetenza.Checked then begin
            // Se Per mese di competenza
            DM1.SetPanelState(1, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(0, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(1, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(2, PanelFine, LabelFine, LivelloAttivo);
         end else if ModoDate.Checked then begin
            // Se per intervallo di date
            DM1.SetPanelState(0, PanelMeseCompetenza, LAbelMeseCompetenza, LivelloAttivo);
            DM1.SetPanelState(1, PanelDate, LabelDate, LivelloAttivo);
            DM1.SetPanelState(1, PanelCopie, LabelCopie, LivelloAttivo);
            DM1.SetPanelState(2, PanelFine, LabelFine, LivelloAttivo);
         end else if ModoManuale.Checked then begin
            // Se manuale
            // QUI NON ARRIVA
         end;
      end;
   end;
   // Forza il painting della form
   Update;
end;


procedure TFattDifferitaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;

   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBUtilita.Down := False;
   // Il puntatore alla form := nil
   FattDifferitaForm := nil;
end;

procedure TFattDifferitaForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(FattDifferitaForm, COLOR_MODIFICA);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Fatturazione differita in 3 passi)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Utilita');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TFattDifferitaForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

   end;
end;

procedure TFattDifferitaForm.FormShow(Sender: TObject);
var
   Year, Month, Day: Word;
begin
   // Inizializzazione form
   LivelloAttivo := 0;
   // Inizializza la data di fatturazione
   DataFatturazione.Date := Date;
   // Inizializza date Dal Al dei documenti da fatturare
   DecodeDate(Now, Year, Month, Day);
   FattDal.EditText := ' 01/' + IntToStr(Month) + '/' + IntToStr(Year);
   DecodeDate(EncodeDate(Year, Month, DM1.FineMese(Day, Month)), Year, Month, Day);
   FattAl.EditText  := ' ' + IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year);
   // Inizializza il mese di competenza
   DecodeDate(Now, Year, Month, Day);
   case Month of
      1:  CompGen.Checked := True;
      2:  CompFeb.Checked := True;
      3:  CompMar.Checked := True;
      4:  CompApr.Checked := True;
      5:  CompMag.Checked := True;
      6:  CompGiu.Checked := True;
      7:  CompLug.Checked := True;
      8:  CompAgo.Checked := True;
      9:  CompSet.Checked := True;
      10: CompOtt.Checked := True;
      11: CompNov.Checked := True;
      12: CompDic.Checked := True;
   end;

   RefreshScreen;
   DM1.FocusRefresh;
end;

procedure TFattDifferitaForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   if LivelloAttivo <= 1 then begin
      Close;
   end else begin
      Dec(LivelloAttivo);
      RefreshScreen;
   end;
end;

procedure TFattDifferitaForm.AvantiModoClick(Sender: TObject);
begin
   // Incrementa il livello attivo
   Inc(LivelloAttivo);
   // Aggiorna lo schermo
   RefreshScreen;
end;

procedure TFattDifferitaForm.AnnullaClick(Sender: TObject);
begin
   Close;
end;

procedure TFattDifferitaForm.IniziaFatturazioneClick(Sender: TObject);
begin
   DM1.Attendere;
   // Visualizza la form di attesa con messaggi
   DM1.ShowWait('Fatturazione Differita', 'Inizio fatturazione differita');
   try
      // IN base al tipo di fatturazione scelta, agisce di conseguenza
      // PER MESE DI COMPETENZA
      if ModoCompetenza.Checked then begin
         DM1.AzzeraBacheca;
         EsportaDocumentiDaFatturarePerCompetenza;
         AvviaFatturazione;
      // PER DATE
      end else if ModoDate.Checked then begin
         DM1.AzzeraBacheca;
         EsportaDocumentiDaFatturarePerData;
         AvviaFatturazione;
      // MANUALE
      end else if ModoManuale.Checked then begin
         AvviaFatturazione;
      end;
   finally
      DM1.ChiudiAttendere;
      // CHiude la form dei messaggi
      DM1.CloseWait;
      // FAtturazione terminata
      DM1.Messaggi('Fatturazione Differita', 'FATTURAZIONE DIFFERITA TERMINATA!'#13#13#13'Cliccare su OK.', 'NB: Dopo aver terminato l''operazione si consiglia di riavviare il programma.', [mbOK], 0, nil);
      // Chiude la form della fatturazione differita
      Close;
   end;
end;

procedure TFattDifferitaForm.NoCopiaClick(Sender: TObject);
begin
   // Incrementa il livello attivo
   Inc(LivelloAttivo);
   // Aggiorna lo schermo
   RefreshScreen;
end;

procedure TFattDifferitaForm.SiCopiaClick(Sender: TObject);
var
   MR : TModalResult;
begin
   // Invia il messaggio di richiesta di esecuzione del backup al Guardian
   MR := SendBackupRequest;
   if MR = mrOk then NoCopiaClick(Self);
end;

end.
