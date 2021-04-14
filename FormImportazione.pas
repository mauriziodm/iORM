unit FormImportazione;
                                                                                                                                                                 

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, IniFiles,
  DB, IB_Import, IB_Components, StrUtils, ComCtrls, ShlObj,
  cxShellCommon, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxShellComboBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

const
   // Determina quante query aggiuntive possono essere inserite nel filtro
   MAX_QUERY_AGGIUNTIVE = 30;
   // Nomi delle sezioni del file conv.ini
   SEZ_PARAMS           = 'Params';           // Sezione dei parametri di importazione
   SEZ_ASCII_FIELD_LIST = 'AsciiFieldList';   // Sezione della lista dei campi del file ASCII
   SEZ_DB_FIELD_LIST    = 'DbFieldList';      // Sezione della lista dei campi del DB
   SEZ_MACRO_LIST       = 'MacroList';        // Sezione della lista delle Macro
   // Tipi di dato disponibili
   FIELD_TYPE_STRING = 'STRING';
   FIELD_TYPE_NUMBER = 'NUMBER';
   FIELD_TYPE_BOOLEAN = 'BOOLEAN';
   FIELD_TYPE_DATE = 'DATE';
   FIELD_TYPE_DATETIME = 'DATETIME';

type
  // Struttura che contiene tutti i parametri necessari per l'importazione del file ASCII
  TImportParams = record
     T: TextFile;                         // Puntatore al file ASCII sorgente
     FieldSeparat : String[1];            // Carattere separatore dei campi nel file ASCII nei tipi di files CharDelimited (Non FixedWidth)
     DestTable : String;                  // Tabella destinazione nel DB
     SourceFile : String;                 // File ASCII sorgente da cui importare i dati
     FixedWidth : Boolean;                // Flag che indica se il file da importare è FixedWidth oppure CharDelimited
     NotifyCount : Integer;               // Aggiorna lo schermo con lo stato di progressione dell'importazione ogni X records elaborati

     SkipLineStartingWith : String;       // Salta tutte li righe del file ASCII che iniziano con...
     ImportOnlyLineStartingWith : String; // Importa solo le riche del file ASCII che iniziano con...

     AsciiDecimalSeparat : String[1];     // Carattere separatore dei decimali nel file ASCII
     AsciiThousandsSeparat : String[1];   // Carattere separatore delle migliaia nel file ASCII
     AsciiDateFormat : String[3];         // Formato delle date nel file ASCII
     AsciiDateSeparat : String[1];        // Carattere separatore delle date del file ASCII
     AsciiDateTimeSeparat : String[1];    // Carattere separatore tra data e ora del file ASCII
     AsciiTimeSeparat : String[1];        // Carattere separatore tra parti dell'ora del file ASCII

     DbDecimalSeparat : String[1];        // Carattere separatore dei decimali nel DB
     DbThousandsSeparat : String[1];      // Carattere separatore delle migliaia nel file DB
     DbDateFormat : String[3];            // Formato della date nel Db
     DbDateSeparat : String[1];           // Carattere separatore delle date nel DB
     DbDateTimeSeparat : String[1];       // Carattere separatore tra data e ora nel DB
     DbTimeSeparat : String[1];           // Carattere separatore tra parti dell'ora nel DB

     KeyFieldsCount : Byte;               // Indica il numero di campi che formano la chiave primaria
  end;
  // Struttura che contiene i parametri sulla progressione dell'operazione
  TProgressStatus = record
     LineCounter : Integer;               // Contatore delle linee già elaborate
     AppendedRecs : Integer;              // Contatore dei records aggiunti
     UpdatedRecs : Integer;               // Contatore dei records modificati
     Errors : Integer;                    // Contatore degli errori
     LinesCount : Integer;                // Totale delle linee da importare presenti nel file ASCII
     NotifyCounter : Integer;             
  end;
  // Struttura che contiene le informazioni sdi ogni singolo campo così come viene prelevato dal
  //  file Ascii di provenienza.
  TAsciiFieldListItem = record
     FieldName : String;
     FieldType : String;
     FieldLength : Integer;
     MaxLength : Integer;
     DefaultValue : String;
     Value : String;
  end;
  // Struttura che contiene le informazioni di come devono essere inserite nella tabella destinazione
  //  i valori prelevati dal file ascii di provenienza.
  TDbFieldListItem = record
     FieldName : String;
//     FieldType : String;
     MaxLength : Integer;
     IsKeyField : Boolean;
     Value : String;
     FieldSQL : String;
  end;
  // Struttura che contiene le informazioni sulle Macro (Define), praticamente il programma
  //  prima di eseguire l'importazione analizza il testo del filtro di importazione e sostituisce
  //  il segnaposto delle macro con il relativo valore:
  //  NB: Le macro hanno il segnaposto cosi strutturato '#NomeMacro#'.
  TMacroListItem = record
     MacroName : String;            // Nome della macro
     MacroDefine : String;          // Contenuto della macro che sarà inserito nel testo al posto del segnaposto.
  end;

  TImportazioneForm = class(TForm)
    PanelInformazioni: TPanel;
    ComboTipoImportazione: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LabelLinesProcessed: TLabel;
    LabelAppended: TLabel;
    LabelUpdated: TLabel;
    LabelErrors: TLabel;
    Panel1: TPanel;
    BackgroundProgressBar: TPanel;
    ProgressBar: TPanel;
    LabelProgress1: TLabel;
    LabelProgress2: TLabel;
    LabelDestination: TLabel;
    Label8: TLabel;
    LabelCurrLine: TLabel;
    Panel3: TPanel;
    ButtonAvvia: TSpeedButton;
    ButtonStop: TSpeedButton;
    Panel4: TPanel;
    ButtonEsci: TSpeedButton;
    Panel2: TPanel;
    LabelStatus: TLabel;
    Edit1: TEdit;
    TimerBlink: TTimer;
    Qry: TIB_Cursor;
    LbTitolo: TLabel;
    RxLabel2: TLabel;
    RxLabel1: TLabel;
    FileNameEdit: TcxShellComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function  StrToChar(StrIn:String): Char;
    function  CharToStr(ChrIn:Char): String;
    function  ConvertiModo(StrIn:String): TImportMode;
    procedure FormCreate(Sender: TObject);
    procedure ImportaRiga(Line: String);
    function  AddStringField(Str, DefaultValue:String; MaxLength:Integer): String;
    function  AddNumericField(Str, DefaultValue:String): String;
    function  AddBooleanField(Str, DefaultValue:String): String;
    function  AddDateField(Str, DefaultValue:String): String;
    function  AddDateTimeField(Str, DefaultValue:String): String;
    function  ItemExist: Boolean;
    procedure ResetStatus;
    procedure ButtonAvviaClick(Sender: TObject);
    procedure ButtonEsciClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure EseguiQueryAggiuntive;
    procedure TimerBlinkTimer(Sender: TObject);
    function  GetAsciiFieldValue(NomeCampo:String) : String;
    function  SostituisciSegnaposto(IV:String) : String;
    procedure CostruisceQueryInsert;
    procedure CostruisceQueryUpdate;
    procedure ComboTipoImportazioneDropDown(Sender: TObject);
    procedure CaricaParametriFiltro(FilterFileName:String);
    procedure ComboTipoImportazioneChange(Sender: TObject);
    function  AggiungiCaratteriDelimitatori(Line:String) : String;
    procedure CaricaMacro(Filtro:String);
    procedure EspandiMacro(FiltroIN, FiltroOUT:String);
    procedure AggiornaErrorLog(L:String);
    procedure AggiornaInsertedLog(L: String);
    procedure AggiornaUpdatedLog(L: String);
    procedure cxShellComboBox1PropertiesEditValueChanged(Sender: TObject);

  private
    { Private declarations }
    // Puntatore al testo da importare
    T: TextFile;
    // Puntatori ai files di log
    ErrorsLogFile: TextFile;
    UpdatedLogFile: TextFile;
    InsertedLogFile: TextFile;
    // Variabili che contengono i parametri necessari all'importazione
    Terminate: Boolean;
    MaxValueProgressBar: Integer;                   // Larghezza massima in pixels della barrra di progressione da visualizzare
    // Definizione delle strutture (Vedi dichiarazione di tipo)
    AsciiFieldList    : array of TAsciiFieldListItem;
    DbFieldList       : array of TDbFieldListItem;
    MacroList         : array of TMacroListItem;
    ImportParams      : TImportParams;
    ProgressStatus    : TProgressStatus;
    // Nome del file del filtro
    NomeFileFiltro : String;
    procedure EseguiQueryAggiuntiveConProtezioneDalleEccezioni;
  public
    { Public declarations }
    SilentMode : Boolean;   // Flag che indica se la form deve richiedere tutte le varia conferme all'inizio
                            //  e alla fine dell'operazione oppure no.
    NomeCampoDaNonModificareSeEsistente:String;
  end;

var
  ImportazioneForm: TImportazioneForm;

implementation

uses main, DataModule1;

{$R *.DFM}


procedure TImportazioneForm.AggiornaErrorLog(L:String);
begin
   Writeln(ErrorsLogFile, L);
end;
procedure TImportazioneForm.AggiornaUpdatedLog(L:String);
begin
   Writeln(UpdatedLogFile, L);
end;
procedure TImportazioneForm.AggiornaInsertedLog(L:String);
begin
   Writeln(InsertedLogFile, L);
end;

procedure TImportazioneForm.EspandiMacro(FiltroIN, FiltroOUT:String);
var
   IT, OT : TextFile;
   CL : String;
   I : Integer;
begin
   // Espande le macro contenute nel file specificato in 'FiltroIN' e genera quindi
   //  il file specificato in 'FiltroOUT' con le macro espanse.
   // -----------------------------------------------------------------------------
   // Carica i dati delle Macro
   CaricaMacro(FiltroIN);
   // Apre il file sorgente e si posiziona all'inizio del file
   AssignFile(IT, FiltroIN);
   Reset(IT);
   // Apre il file destinazione
   AssignFile(OT, FiltroOUT);
   Rewrite(OT);
   // Cicla per tutte le righe del file sorgente
   while not Eof(IT) do begin
      // CL contiene la linea corrente del file sorgente
      Readln(IT, CL);
      // Cicla per tutte le macro che sono caricate nell'apposita struttura
      for I := Length(MacroList)-1 downto 0 do begin
         // Espande la macro corrente
         CL := StringReplace(CL, MacroList[I].MacroName, MacroList[I].MacroDefine, [rfReplaceAll]);
      end;
      // Salva la riga con le macro espanse nel file destinazione
      Writeln(OT, CL);
   end;
   // Chiude il file sorgente
   CloseFile(IT);
   // Chiude il file destinazione scaricando prima il biffer
   Flush(OT);
   CloseFile(OT);
end;

procedure TImportazioneForm.CaricaMacro(Filtro:String);
var
   C :TMemIniFile;                 // Puntatore al file INI del filtro
   FL : TStrings;               // StringList usata per
   i :Integer;                  // Indice per i loops
   LFI : Integer;               // LastFieldIndex indica l'indice dell'ultimo elemento aggiunto all'array dei campi
   CL : String;                 // Contiene la linea corrente
   CurrentParStr : String;      // Contiene la stringa del parametro corrente
   CurrentParName : String;     // Contiene il nome del parametro corrente
   CurrentParValue : String;    // Contiene il valore del parametro corrente
begin
    // Questa procedura elabora il file di filtro specificato dal parametro 'FiltroIN' espandendo
    //  tutte le macro che trova e generando quindi il file specificato in 'FiltroOUT' con il
    //  risultato.
    // ------------------------------------------------------------------------------------------
    // Azzera la struttura che contiene i dati delle macro
    SetLength(MacroList, 0);
    // Inizializza variabili
    FL := TStringList.Create;
    // Apre il filtro per caricare le Macro
    C := TMemIniFile.Create(Filtro);
    try
       // ================================================================================================================
       // CARICAMENTO DELLA LISTA DELLE MACRO
       // ----------------------------------------------------------------------------------------------------------------
       // Carica tutto il contenuto della sezione nella StringList 'FL' per la successiva elaborazione
       FL.Clear;
       C.ReadSectionValues(SEZ_MACRO_LIST, FL);
       // Cicla per tutti i campi da importare contenuti in FL
       for i := 0 to FL.Count - 1 do begin
          // CL punta alla linea del campo corrente
          CL := FL[i];
          // Aggiorna la variabile che contiene l'indice dell'ultimo Field aggiunto alla lista dei campi
          //  NB: Bisognerebbe ridurlo di 1 ma siccome aggiungo subito dopo un altro elemento va bene così)
          LFI := Length(MacroList);
          // Aggiunge un elemento all'array che contiene la lista dei campi
          SetLength(MacroList, LFI+1);
          // Carica il nome della macro attuale inserendo anche il carattere # all'inizio e alla fine
          MacroList[LFI].MacroName := '#' + Trim(DM1.RitornaTestoPrimaDi('=', CL, True)) + '#';
          // Inizializza il Define campo vuoto
          MacroList[LFI].MacroDefine := '';
          // Cicla per il caricamento dei parametri finchè ve ne sono
          //  NB: Praticamente cerca se ci sono dei ';' che separano i vari parametri
          //  NB: BISOGNA METTERE IL ; ANCHE ALLA FINE DELLA RIGA
          while Pos(';', CL) > 0 do begin
             // Carica i dati del parametro corrente nelle apposite variabili temporanee per comodità
             //  NB: Lo schema è: "NomeParametro:ValoreParametro;"
             CurrentParStr     := Trim(DM1.RitornaTestoPrimaDi(';', CL, True));
             CurrentParName    := Uppercase(Trim(DM1.RitornaTestoPrimaDi(':', CurrentParStr, True)));
             CurrentParValue   := Trim(CurrentParStr);
             // IN base al tipo di parametro, lo carica negli appositi campi della struttura
             if CurrentParName = 'DEFINE' then begin                 // Definizione della Macro
                MacroList[LFI].MacroDefine := CurrentParValue;
             end;
          end;
       end;
       // ================================================================================================================
    finally
       C.Free;
    end;
end;


procedure TImportazioneForm.ButtonAvviaClick(Sender: TObject);
var
   Line: String;           // COntiene la linea attuale del file ASCII da importare
   C:TMemIniFile;             // Puntatore al file INI del filtro
   CloseAct:TCloseAction;
begin
   // Blocca il database dell'azienda (server un accesso esclusivo per l'importazione degli archivi).
//   if not DM1.LockDatabaseAccess then Exit;
// NB: TOLTO IL BLOCCAGGIO DELL'AZIENDA PERCHE' DA' UN ERRORE QUANDO LEGGO LA PROPRIETA'
//      Users.Count DEL COMPONENTE DATABASE. IL PROBLEMA ME LO DA' SOLO QUI E NON NELLE ALTRE PARTI
//      DEL PROGRAMMA. lA FUNZIONE CHE D ERRORE E' CONETNUTA IN DM1.LockDatabaseAccess.
//      QUINDI HO DOVUTO TOGLIERE I LOCK E GLI UNLOCK DEL DATABASE ANCHE IN ALTRE PARTI DELLA FORM ED
//      ESATTAMENTE ALLA FINE DI QUESTA FUNZIONE E NELL'EVENTO ONCLOSE DELLA FORMIMPORTAZIONE.
//      HO QUINDI MESSO UN SEMPLICE MESSAGGIO PER AVVERTIRE L'UTENTE CHE NON DEVONO ESSERCI ALTRI UTENTI
//      DURANTE L'OPERAZIONE.
   if not SilentMode then if DM1.Messaggi('Importazione Archivi', 'A T T E N Z I O N E !!!'#13#13#13'E'' assolutamente indispensabile che non vi siano altri utenti connessi durante l''operazione.'#13#13'Assicurarsi quindi che tutte le eventuali altre stazioni non abbiano il programma in esecuzione.'#13#13#13'Continuare?', 'NB: E'' consigliabile fare una COPIA DI SICUREZZA degli archivi prima di continuare.', [mbYes, mbNo], 0, nil) = mrNo then Exit;
   // Inizializza variabili
   ProgressStatus.NotifyCounter        := 0;
   ProgressStatus.LineCounter          := 0;
   ProgressStatus.LinesCount           := 0;
   ProgressStatus.AppendedRecs         := 0;
   ProgressStatus.UpdatedRecs          := 0;
   ProgressStatus.Errors               := 0;
   // Inizializza il flag che indica che l'utente ha cliccato per terminare l'operazione
   Terminate                           := False;
   // Sposta il focus per problemi di visualizzazione
   Edit1.SetFocus;
   // Aggiorna lo schermo
   LabelStatus.Caption := 'Preparazione per l''importazione.';
   LabelLinesProcessed.Caption  := '0';
   LabelErrors.Caption          := '0';
   LabelAppended.Caption        := '0';
   LabelUpdated.Caption         := '0';
   Update;
   // Preleva il nome del file da importare
   ImportParams.SourceFile := FileNameEdit.Text;
   // Toglie ogni genere di apici all'inizio e alla fine
   //  NB: Nel comando DELETE il primo carattere è il n° 1 non lo 0.
   if (DM1.StrLeft(ImportParams.SourceFile, 1) = '''')or(DM1.StrLeft(ImportParams.SourceFile, 1) = '"') then Delete(ImportParams.SourceFile, 1, 1);
   if (DM1.StrRight(ImportParams.SourceFile, 1) = '''')or(DM1.StrRight(ImportParams.SourceFile, 1) = '"') then Delete(ImportParams.SourceFile, Length(ImportParams.SourceFile), 1);
   // Salva il nome del file da importare nel file INI in modo che all'importazione successiva riproponga automaticamente l'ultimo usato
   C := TMemIniFile.Create(DM1.ImportFiltersDir + NomeFileFiltro);
    C.WriteString(SEZ_PARAMS, 'AsciiFile', ImportParams.SourceFile);
    C.UpdateFile;
   C.Free;
   // Aggiorna lo schermo
   LabelStatus.Caption := 'Apertura file da importare.';
   Update;
   // Apre il file di testo da importare e si posiziona all'inizio
   AssignFile(T, ImportParams.SourceFile);
   Reset(T);
   // Apre il file di testo che funge da ErrorLog
   AssignFile(ErrorsLogFile, DM1.CartellaTmp+'Import_Errors.log');
   Rewrite(ErrorsLogFile);
   // Apre il file di testo che funge da UpdatedLog
   AssignFile(UpdatedLogFile, DM1.CartellaTmp+'Import_Updated.log');
   Rewrite(UpdatedLogFile);
   // Apre il file di testo che funge da InsertedLog
   AssignFile(InsertedLogFile, DM1.CartellaTmp+'Import_Inserted.log');
   Rewrite(InsertedLogFile);
   try
      // Aggiorna lo schermo
      ButtonAvvia.Enabled := False;
      ButtonStop.Enabled := True;
      ButtonEsci.Enabled := False;
      Update;
      // Conta quante righe da importare ci sono nel file e mette il totale in 'LinesCount'
      while (not SeekEof(T)) and (not Terminate) do begin
         Readln(T, Line);
         Inc(ProgressStatus.LinesCount);
         // INcrementa il contatore del notify
         Inc(ProgressStatus.NotifyCounter);
         // Se il notifycounter ha raggiunto il parametro NotifyCOunt...
         if ProgressStatus.NotifyCounter = ImportParams.NotifyCount then begin
            // Riporta a 0 il contatore
            ProgressStatus.NotifyCounter := 0;
            // Aggiorna lo schermo
            LabelLinesProcessed.Caption := IntToStr(ProgressStatus.LinesCount);
            LabelLinesProcessed.Update;
         end;
         // Altrimenti non sente l'eventuale Click sul pulsante STOP
         Application.ProcessMessages;
      end;
      // Ritorna all'inizio del file
      Reset(T);
      // Aggiorna lo schermo
      LabelStatus.Caption := 'Importazione in corso...';
      LabelStatus.Update;
      // Riazzera il NotifyCounter
      ProgressStatus.NotifyCounter := 0;

      // Avvia la transazioe
      DM1.DBAzienda.StartTransaction;
      try
        // Cicla per tutto il file per effettuare l'importazione
        while (not SeekEof(T)) and (not Terminate) do begin
           // Preleva la riga da elaborare e incrementa il contatore di linee
           Readln(T, Line);
           // Incrementa il contatore delle linee elaborate
           Inc(ProgressStatus.LineCounter);
           // INcrementa il contatore del notify
           Inc(ProgressStatus.NotifyCounter);
           // Se il notifycounter ha raggiunto il parametro NotifyCOunt...
           //  NB: Alla fine le ultime 3 righe da importare aggiorna sempre lo schermo
           if (ProgressStatus.NotifyCounter = ImportParams.NotifyCount)
           or (ProgressStatus.LineCounter = (ProgressStatus.LinesCount - 3))
           then begin
              // Riporta a 0 il contatore
              ProgressStatus.NotifyCounter := 0;
              // Aggiorna lop schermo
              LabelCurrLine.Caption := Line;
              LabelUpdated.Caption         := IntToStr(ProgressStatus.UpdatedRecs);
              LabelAppended.Caption        := IntToStr(ProgressStatus.AppendedRecs);
              LabelLinesProcessed.Caption  := IntToStr(ProgressStatus.LineCounter) + ' su ' + IntToStr(ProgressStatus.LinesCount);
              LabelErrors.Caption          := IntToStr(ProgressStatus.Errors);
              // Aggiorna la progress bar
              ProgressBar.Width := Round(ProgressStatus.LineCounter * MaxValueProgressBar / ProgressStatus.LinesCount);
              LabelProgress1.Caption := IntToStr(Round(ProgressStatus.LineCounter * 100 / ProgressStatus.LinesCount)) + '%';
              LabelProgress2.Caption := LabelProgress1.Caption;
              PanelInformazioni.Update;
           end;
           // Evita di importare le linee che iniziano con la sequenza di caratteri specificati in 'SkipLineStartingWith' (se tale variabile
           //  <> da '')
           if ((ImportParams.SkipLineStartingWith = '')or(DM1.StrLeft(Line, Length(ImportParams.SkipLineStartingWith)) <> ImportParams.SkipLineStartingWith)) and
              ((ImportParams.ImportOnlyLineStartingWith = '')or(DM1.StrLeft(Line, Length(ImportParams.ImportOnlyLineStartingWith)) = ImportParams.ImportOnlyLineStartingWith)) then begin
              // Importa la riga
              //  NB: Solo se la riga non è vuota
              ImportaRiga(Line);
              // Altrimenti non sente l'eventuale Click sul pulsante STOP
              Application.ProcessMessages;
           end;
        end;
        // Avvia l'eventuale esecuzione delle query aggiuntive
        if not Terminate then EseguiQueryAggiuntive;
        // Avvia l'eventuale esecuzione delle query aggiuntive che devono
        //  essere eseguite protette da eventuali eccezioni, in modo che anche
        //  se si verifica un errore la procedura di importazione (listino) non
        //  si interrompe.
        if not Terminate then EseguiQueryAggiuntiveConProtezioneDalleEccezioni;
        // Se tutto è andato bene fa il commit
        DM1.DBAzienda.Commit;
      except
        // Se qualcosa è andato storto...
        ShowMessage('Rollback');
        DM1.DBAzienda.Rollback;
      end;
   finally
      // Sblocca l'azienda
//      DM1.UnLockDatabaseAccess;
      // Aggiorna lo schermo
      ButtonAvvia.Enabled := True;
      ButtonStop.Enabled := False;
      ButtonEsci.Enabled := True;
      LabelStatus.Caption := 'Importazione terminata. Cliccare su ''Esci'' per uscire.';
      Update;
      // Chiuse il file
      CloseFile(T);
      // Chiude il file degli errori
      Flush(ErrorsLogFile);
      CloseFile(ErrorsLogFile);
      // Chiude il file degli updates
      Flush(UpdatedLogFile);
      CloseFile(UpdatedLogFile);
      // Chiude il file degli inserted
      Flush(InsertedLogFile);
      CloseFile(InsertedLogFile);
      // Se in silentMode sopprime tutte le conferme
      if not SilentMode then begin
         // Messaggio di fine operazione, chiede se si vuole fare una nuova importazione, se no chiude la form.
         if DM1.Messaggi('Importazione Archivi', 'Operazione completata.'#13#13#13'Desideri importare altri archivi?', 'NB: Dopo aver terminato tutte le importazioni sarà necessario RIAVVIARE IL PROGRAMMA.', [mbYes, mbNo], 0, nil) = mrNo then begin
            DM1.Messaggi('Importazione Archivi', 'Per completare l''operazione il programma dovrà essere riavviato!'#13#13#13'Cliccare su ''OK'' per avviare la chiusura di Lev@nte', '', [mbOK], 0, nil);
            CloseAct := caNone;
            MainForm.FormClose(MainForm, CloseAct);
         end;
      end;
   end;
end;


// Controlla se ci sono degli articoli nel listino marcati come appartentnei al listino
//  del gruppo arcobaleno che hanno il codice con meno di 6 caratteri (mancano gli zeri iniziali)
//  e se ci sono aggiunge gli zeri iniziali mancanti.
procedure TImportazioneForm.ResetStatus;
begin
   MaxValueProgressBar := BackgroundProgressBar.Width - 2;

   SetLength(AsciiFieldList, 0);
   SetLength(DbFieldList, 0);

   with ProgressStatus do begin
      LineCounter          := 0;
      Errors               := 0;
      AppendedRecs         := 0;
      UpdatedRecs          := 0;
      LinesCount           := 0;
   end;

   LabelStatus.Caption := '';
   LabelDestination.Caption := '';
   LabelCurrLine.Caption := '';
   LabelLinesProcessed.Caption := '';
   LabelErrors.Caption := '';
   LabelAppended.Caption := '';
   LabelUpdated.Caption := '';

   LabelProgress1.Caption := '0%';
   LabelProgress2.Caption := '0%';
   ProgressBar.Width := 0;

   PanelInformazioni.update;
end;


function  TImportazioneForm.ConvertiModo(StrIn:String): TImportMode;
begin
   Result := mAppend;
   if      StrIn = 'mAppend'       then Result := mAppend
//   else if StrIn = 'mAppendUpdate' then Result := mAppendUpdate
   else if StrIn = 'mCopy'         then Result := mCopy;
//   else if StrIn = 'mUpdate'       then Result := mUpdate;
end;


function  TImportazioneForm.StrToChar(StrIn:String): Char;
begin
   Result := StrIn[1];
end;

function  TImportazioneForm.CharToStr(ChrIn:Char): String;
begin
   Result := '' + ChrIn;
end;

procedure TImportazioneForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // Sblocca l'azienda
//   DM1.UnLockDatabaseAccess;
   
   Action := caFree;
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBUtilita.Down := False;
   // Il puntatore alla form := nil
   ImportazioneForm := nil;
end;

procedure TImportazioneForm.FormShow(Sender: TObject);
begin
   // Reset dello schermo e delle variabili
   ResetStatus;
   // Aggiorna lo schermo
   LabelStatus.Caption := 'Selezionare il tipo di importazione desiderato.';
   Update;   
end;

procedure TImportazioneForm.CaricaParametriFiltro(FilterFileName:String);
var
   C :TMemIniFile;                 // Puntatore al file INI del filtro
   FL : TStrings;               // StringList usata per
   i :Integer;                  // Indice per i loops
   LFI : Integer;               // LastFieldIndex indica l'indice dell'ultimo elemento aggiunto all'array dei campi
   CL : String;                 // Contiene la linea corrente
   CurrentParStr : String;      // Contiene la stringa del parametro corrente
   CurrentParName : String;     // Contiene il nome del parametro corrente
   CurrentParValue : String;    // Contiene il valore del parametro corrente
begin
   // Resetta tutto e aggiorna lo schermo
   ResetStatus;
   LabelStatus.Caption := 'Caricamento parametri.';
   // Inizializza variabili
   FL := TStringList.Create;
   // Carica tutti i parametri della conversione
   C := TMemIniFile.Create(FilterFileName);
   try
    // ================================================================================================================
    // IMPORTAZIONE DEI PARAMETRI DELL'IMPORTAZIONE
    // ----------------------------------------------------------------------------------------------------------------
    // Controlla se la sezione dei parametri esiste
    if not C.SectionExists(SEZ_PARAMS) then begin
       MessageBeep(0);
       MessageDlg('Sezione ''' + SEZ_PARAMS + '''del filtro di importazione NON PRESENTE.', mtError, [mbOk], 0);
       Exit;
    end;
    // Caricamento dei parametri nella struttura apposita
    ImportParams.AsciiDecimalSeparat         :=     C.ReadString(SEZ_PARAMS, 'AsciiDecimalSeparat', ',');
    ImportParams.DBDecimalSeparat            :=     C.ReadString(SEZ_PARAMS, 'DBDecimalSeparat', '');
    ImportParams.AsciiThousandsSeparat       :=     C.ReadString(SEZ_PARAMS, 'AsciiThousandsSeparat', '.');
    ImportParams.DBThousandsSeparat          :=     C.ReadString(SEZ_PARAMS, 'DBThousandsSeparat', '');
    ImportParams.AsciiDateFormat             :=     C.ReadString(SEZ_PARAMS, 'AsciiDateFormat', 'GMA');
    ImportParams.DBDateFormat                :=     C.ReadString(SEZ_PARAMS, 'DBDateFormat', 'MGA');

    ImportParams.AsciiDateSeparat            :=     C.ReadString(SEZ_PARAMS, 'AsciiDateSeparat', '');
    ImportParams.AsciiDateTimeSeparat        :=     C.ReadString(SEZ_PARAMS, 'AsciiDateTimeSeparat', ' ');
    ImportParams.AsciiTimeSeparat            :=     C.ReadString(SEZ_PARAMS, 'AsciiTimeSeparat', '');

    ImportParams.DBDateSeparat               :=     C.ReadString(SEZ_PARAMS, 'DBDateSeparat', '/');
    ImportParams.DBDateTimeSeparat           :=     C.ReadString(SEZ_PARAMS, 'DBDateTimeSeparat', ' ');
    ImportParams.DBTimeSeparat               :=     C.ReadString(SEZ_PARAMS, 'DBTimeSeparat', ':');

    ImportParams.FieldSeparat                := chr(C.ReadInteger(SEZ_PARAMS, 'Separator', 9));
    ImportParams.FixedWidth                  :=     C.ReadBool(SEZ_PARAMS, 'FixedWidth', True);
    ImportParams.SkipLineStartingWith        :=     C.ReadString(SEZ_PARAMS, 'SkipLineStartingWith', '');
    ImportParams.ImportOnlyLineStartingWith  :=     C.ReadString(SEZ_PARAMS, 'ImportOnlyLineStartingWith', '');
    ImportParams.NotifyCount                 :=     C.ReadInteger(SEZ_PARAMS, 'NotifyCount', 1);
    // Aggiorna la label della tabella destinazione
    ImportParams.DestTable                   :=     C.ReadString(SEZ_PARAMS, 'Destination', '');
    LabelDestination.Caption                 :=     ImportParams.DestTable;
    // Se la tabella di destinazione è una tabella del LEVGEN.GDB allora imposta quest'ultimo come database destinazione
    if Uppercase(ImportParams.DestTable) = 'TMPRIGHI' then
      Qry.IB_Connection := DM1.DBGenerale
    else
      Qry.IB_Connection := DM1.DBAzienda;

    // Aggiorna il percorso e il nome del file da importare
    ImportParams.SourceFile                  :=     C.ReadString(SEZ_PARAMS, 'AsciiFile', '');
    FileNameEdit.Text                       :=     ImportParams.SourceFile;
    // Controlla che il formato delle date sia tra quelli ammessi e se lo sono bene, altrimenti blocca tutto
    if not(((ImportParams.AsciiDateFormat = 'GMA') or (ImportParams.AsciiDateFormat = 'MGA') or (ImportParams.AsciiDateFormat = 'AMG')) and ((ImportParams.DBDateFormat = 'GMA') or (ImportParams.DBDateFormat = 'MGA') or (ImportParams.DBDateFormat = 'AMG'))) then begin
       MessageBeep(0);
       MessageDlg('A T T E N Z I O N E !!!'#13#13'Il formato delle date specificato nel filtro non è valido.', mtError, [mbOk], 0);
       Exit;
    end;
    // ================================================================================================================

    // ================================================================================================================
    // CARICAMENTO DELLA LISTA DEI CAMPI DEL FILE ASCII SORGENTE
    // ----------------------------------------------------------------------------------------------------------------
    // Controlla se la sezione esiste
    if not C.SectionExists(SEZ_ASCII_FIELD_LIST) then begin
       MessageBeep(0);
       MessageDlg('Sezione ''' + SEZ_ASCII_FIELD_LIST + '''del filtro di importazione NON PRESENTE.', mtError, [mbOk], 0);
       Exit;
    end;
    // Carica tutto il contenuto della sezione nella StringList 'FL' per la successiva elaborazione
    FL.Clear;
    C.ReadSectionValues(SEZ_ASCII_FIELD_LIST, FL);
    // Cicla per tutti i campi da importare contenuti in FL
    for i := 0 to FL.Count - 1 do begin
       // CL punta alla linea del campo corrente
       CL := FL[i];
       // Aggiorna la variabile che contiene l'indice dell'ultimo Field aggiunto alla lista dei campi
       //  NB: Bisognerebbe ridurlo di 1 ma siccome aggiungo subito dopo un altro elemento va bene così)
       LFI := Length(AsciiFieldList);
       // Aggiunge un elemento all'array che contiene la lista dei campi
       SetLength(AsciiFieldList, LFI+1);
       // Carica il nome del campo attuale
       AsciiFieldList[LFI].FieldName := Uppercase(Trim(DM1.RitornaTestoPrimaDi('=', CL, True)));
       // Inizializza il tipo do campo vuoto
       AsciiFieldList[LFI].FieldType := '';
       // Inizializza il valore di default vuoto (in modo che se non viene specificato...)
       AsciiFieldList[LFI].DefaultValue := 'NO_DEFAULT_VALUE';
       // Inizializza la lunghezza del campo di default (Solo per FixedWidth)
       AsciiFieldLIst[LFI].FieldLength := 0;
       // Inizializza la lunghezza max del campo oltre la quale deve essere troncato (facoltativo)
       AsciiFieldLIst[LFI].MaxLength := 0;
       // Cicla per il caricamento dei parametri finchè ve ne sono
       //  NB: Praticamente cerca se ci sono dei ';' che separano i vari parametri
       //  NB: BISOGNA METTERE IL ; ANCHE ALLA FINE DELLA RIGA
       while Pos(';', CL) > 0 do begin
          // Carica i dati del parametro corrente nelle apposite variabili temporanee per comodità
          //  NB: Lo schema è: "NomeParametro:ValoreParametro;"
          CurrentParStr     := Trim(DM1.RitornaTestoPrimaDi(';', CL, True));
          CurrentParName    := Uppercase(Trim(DM1.RitornaTestoPrimaDi(':', CurrentParStr, True)));
          CurrentParValue   := Trim(CurrentParStr);
          // IN base al tipo di parametro, lo carica negli appositi campi della struttura
          if CurrentParName = 'FIELDTYPE' then begin                 // Tipo del campo (STRING, NUMBER, BOOLEAN, DATE)
             // Controllo di validità del tipo
             CurrentParValue := Uppercase(CurrentParValue);
             if (CurrentParValue <> FIELD_TYPE_STRING) and (CurrentParValue <> FIELD_TYPE_NUMBER) and (CurrentParValue <> FIELD_TYPE_BOOLEAN) and (CurrentParValue <> FIELD_TYPE_DATE) and (CurrentParValue <> FIELD_TYPE_DATETIME) then
               raise Exception.Create('Tipo di dato non valido.');
             AsciiFieldList[LFI].FieldType := CurrentParValue;
          end else if CurrentParName = 'FIELDLENGTH' then begin      // Lunghezza del campo (da usarsi solo per importazioni FixedWidth)
             AsciiFieldList[LFI].FieldLength := StrToInt(CurrentParValue);
          end else if CurrentParName = 'MAXLENGTH' then begin      // Lunghezza massima del campo oltre la quale deve essere troncato (facoltativo)
             AsciiFieldList[LFI].MaxLength := StrToInt(CurrentParValue);
          end else if CurrentParName = 'DEFAULTVALUE' then begin     // Valore di default da assegnare al campo
             AsciiFieldList[LFI].DefaultValue := CurrentParValue;
          end;
       end;
       // Se qualche parametro non è stato specificato, solleva un'eccezione
       if AsciiFieldList[LFI].FieldName      = '' then raise Exception.Create('''FieldName'' non valido o non specificato.');
       if AsciiFieldList[LFI].FieldType      = '' then raise Exception.Create('''FieldType'' non valido o non specificato.');
       if (AsciiFieldList[LFI].FieldLength = 0) and (ImportParams.FixedWidth = True) then raise Exception.Create('''FieldLength'' non valida o non specificata');
    end;
    // ================================================================================================================


    // ================================================================================================================
    // CARICAMENTO DELLA LISTA DEI CAMPI DEL DATABASE DESTINAZIONE
    // ----------------------------------------------------------------------------------------------------------------
    // Controlla se la sezione esiste
    if not C.SectionExists(SEZ_DB_FIELD_LIST) then begin
       MessageBeep(0);
       MessageDlg('Sezione ''' + SEZ_DB_FIELD_LIST + '''del filtro di importazione NON PRESENTE.', mtError, [mbOk], 0);
       Exit;
    end;
    // Carica tutto il contenuto della sezione nella StringList 'FL' per la successiva elaborazione
    FL.Clear;
    C.ReadSectionValues(SEZ_DB_FIELD_LIST, FL);
    // Cicla per tutti i campi da importare contenuti in FL
    for i := 0 to FL.Count - 1 do begin
       // CL punta alla linea del campo corrente
       CL := FL[i];
       // Aggiorna la variabile che contiene l'indice dell'ultimo Field aggiunto alla lista dei campi
       //  NB: Bisognerebbe ridurlo di 1 ma siccome aggiungo subito dopo un altro elemento va bene così)
       LFI := Length(DbFieldList);
       // Aggiunge un elemento all'array che contiene la lista dei campi
       SetLength(DbFieldList, LFI+1);
       // Carica il nome del campo attuale
       DbFieldList[LFI].FieldName := Uppercase(Trim(DM1.RitornaTestoPrimaDi('=', CL, True)));
       // Inizializza il tipo do campo vuoto
//       DbFieldList[LFI].FieldType := '';
       // Inizializza la lunghezza massima di default del campo
       DbFieldList[LFI].MaxLength := 0;
       // Inizializza il flag che indica se il campo attuale fà parte della chiave primaria oppure no
       DBFieldList[LFI].IsKeyField := False;
       // Inizializza il valore del campo a stringa nulla per default
       DBFieldList[LFI].Value := '';
       // Cicla per il caricamento dei parametri finchè ve ne sono
       //  NB: Praticamente cerca se ci sono dei ';' che separano i vari parametri
       //  NB: BISOGNA METTERE IL ; ANCHE ALLA FINE DELLA RIGA
       while Pos(';', CL) > 0 do begin
          // Carica i dati del parametro corrente nelle apposite variabili temporanee per comodità
          //  NB: Lo schema è: "NomeParametro:ValoreParametro;"
          CurrentParStr     := Trim(DM1.RitornaTestoPrimaDi(';', CL, True));
          CurrentParName    := Uppercase(Trim(DM1.RitornaTestoPrimaDi(':', CurrentParStr, True)));
          CurrentParValue   := Trim(CurrentParStr);
          // IN base al tipo di parametro, lo carica negli appositi campi della struttura
          if          CurrentParName = 'MAXLENGTH' then begin      // Lunghezza max del campo (oltre verrà troncata)
             DbFieldList[LFI].MaxLength := StrToInt(CurrentParValue);
          end else if CurrentParName = 'ISKEYFIELD' then begin     // Flag che indica se il campo fà parte della chiave primaria o no
             CurrentParValue := Uppercase(CurrentParValue);
             if CurrentParValue = 'YES' then DbFieldList[LFI].IsKeyField := True;   // NB: Se non è specificato YES lo lascia a false (Default)
             // Aggiorna il contatore dei campi che fanno parte della chiave primaria
             Inc(ImportParams.KeyFieldsCount, 1);
          end else if CurrentParName = 'VALUE' then begin          // Script che rappresenta il valore da assegnare al campo
             DbFieldList[LFI].Value := CurrentParValue;
//          end else if CurrentParName = 'FIELDTYPE' then begin                 // Tipo del campo (STRING, NUMBER, BOOLEAN, DATE)
//             // Controllo di validità del tipo
//             CurrentParValue := Uppercase(CurrentParValue);
//             if (CurrentParValue <> FIELD_TYPE_STRING) and (CurrentParValue <> FIELD_TYPE_NUMBER) and (CurrentParValue <> FIELD_TYPE_BOOLEAN) and (CurrentParValue <> FIELD_TYPE_DATE) then raise Exception.Create('Tipo di dato non valido.');
//             DbFieldList[LFI].FieldType := CurrentParValue;
          end;
          // Se qualche parametro non è stato specificato, solleva un'eccezione
          if DbFieldList[LFI].FieldName     = '' then raise Exception.Create('''FieldName'' non valido o non specificato.');
//          if DbFieldList[LFI].FieldType     = '' then raise Exception.Create('''FieldType'' non valido o non specificato.');
          if DbFieldList[LFI].Value         = '' then raise Exception.Create('''Value'' non valido o non specificato.');
       end;
    end;
    // ================================================================================================================
   finally
    C.Free;
   end;
   // Solo alla fine abilita il controllo del nome del file e se questo non è vuoto anche il pulsante di avvio dell'importazione
   FileNameEdit.Enabled := True;
   if Trim(FileNameEdit.Text) <> '' then begin
      ButtonAvvia.Enabled := True;
   end;
   // Visualizza istruzioni per il passo successivo
   LabelStatus.Caption := 'Selezionare il file da importare e cliccare su ''Avvia importazione''';
   // Forza l'aggiornamento dello schermo
   Update;
end;
procedure TImportazioneForm.FormCreate(Sender: TObject);
begin
   // FIssa le dimensioni
   Self.Height := 520;
   Self.Width  := 565;
   // Inizializzazione
   SilentMode := False;
   NomeCampoDaNonModificareSeEsistente := '';
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Importazione)';
end;


function TImportazioneForm.GetAsciiFieldValue(NomeCampo:String) : String;
var
   I : Integer;
begin
   // Questa funzione ritorna il campo Value del campo in ingresso contenuto nella
   //  struttura AsciiFieldList a cui è stato assegnato il nome (alias) corrispondente
   //  al parametro NomeCampo
   // --------------------------------------------------------------------------------
   Result := '';
   for I := 0 to Length(AsciiFieldList)-1 do begin
      if AsciiFieldList[I].FieldName = Uppercase(NomeCampo) then begin
         Result := AsciiFieldList[I].Value;
         Exit;
      end;
   end;
   raise Exception.Create(Format('Campo non trovato "%s"', [NomeCampo]));
end;

function TImportazioneForm.SostituisciSegnaposto(IV:String) : String;
var
   SS, SE : Integer;          // Indici che contengono l'indice del carattere di inizio del segnaposto
                              //  del campo e del carattere di fine del segnaposto
                              //  NB: SS = Segnaposto Start; SE = Segnaposto End.
   Segnaposto : String;       // Contiene il segnaposto corrente
begin
   // Questa funzione so pccupa di sostituire tutti i segnaposto di campo con il rispoettivo
   //  valore del campo corrispondente
   // --------------------------------------------------------------------------------------
   // Inizializzazione
   Result := '';
   // Le due variabili successive verificano se esiste un segnaposto di campo
   SS := Pos('<', IV);
   SE := Pos('>', IV);
   // Cicla fintantochè trova una coppia di marcatori di inizio e fine di un segnaposto di
   //  un campo.
   while (SS > 0) and (SE > 0) do begin
      // La variabile Segnaposto contiene il valore del segnaposto
      Segnaposto := MidStr(IV, SS+1, SE-SS-1);   // +1 e -1 per evitare che ci siano anche i caratteri <> che delimitano i segnaposto
      // Effettua la sostituzione del valore del campo al posto del segnaposto
      IV := StringReplace(IV, '<'+Segnaposto+'>', GetAsciiFieldValue(Segnaposto), []);
      // Le due variabili successive verificano se esiste un altro segnaposto di campo
      SS := Pos('<', IV);
      SE := Pos('>', IV);
   end;
   // Ritorna il valore
   Result := IV;
end;

procedure TImportazioneForm.CostruisceQueryInsert;
var
   I : Integer;
begin
   // Azzera la query
   Qry.SQL.Clear;
   // INizia la creazione della query
   Qry.SQL.Add('INSERT INTO ' + ImportParams.DestTable);
   // Apre la parantesi
   Qry.SQL.Add('(');
   // Cicla per l'inserimento dei nomi di tutti i campi destinazione
   for I := 0 to Length(DbFieldList)-1 do begin
      // Aggiunge il campo corrente
      Qry.SQL.Add(DbFieldList[I].FieldName + ',');
   end;
   // Elimina il carattere ',' dall'ultima riga inserita
   Qry.SQL[Qry.SQL.Count-1] := DM1.StrLeft(Qry.SQL[Qry.SQL.Count-1], Length(Qry.SQL[Qry.SQL.Count-1])-1);
   // Chiude la parantesi dell'elenco dei campi e la riapre per l'inserimento dei valori
   Qry.SQL.Add(') VALUES (');
   // Cicla per tutti i campi per inserire i relativi valori
   for I := 0 to Length(DbFieldList)-1 do begin
      // Aggiunge il campo corrente
      Qry.SQL.Add(DbFieldList[I].FieldSQL + ',');
   end;
   // Elimina il carattere ',' dall'ultima riga inserita
   Qry.SQL[Qry.SQL.Count-1] := DM1.StrLeft(Qry.SQL[Qry.SQL.Count-1], Length(Qry.SQL[Qry.SQL.Count-1])-1);
   // Chiude la parantesi finale
   Qry.SQL.Add(')');
end;

procedure TImportazioneForm.CostruisceQueryUpdate;
var
   I : Integer;
begin
   // Azzera la query
   Qry.SQL.Clear;
   // Inizia a creare la query UPDATE
   Qry.SQL.Add('UPDATE ' + ImportParams.DestTable + ' SET');
   // Cicla per inserire i vari fields (nome=valore) nella query UPDATE
   for I := 0 to Length(DbFieldList)-1 do begin
      // Se il campo attuale non è tra quelli da non aggiornare lo aggiunge altrimenti no
      if Uppercase(DbFieldList[I].FieldName) <> Uppercase(NomeCampoDaNonModificareSeEsistente) then begin
        // Inserisce il campo corrente nella query
        Qry.SQL.Add(DbFieldList[I].FieldName + '=' + DbFieldList[I].FieldSQL + ',');
      end;
   end;
   // Elimina il carattere ',' dall'ultima riga inserita
   Qry.SQL[Qry.SQL.Count-1] := DM1.StrLeft(Qry.SQL[Qry.SQL.Count-1], Length(Qry.SQL[Qry.SQL.Count-1])-1);
   // Aggiunge la clausala WHERE
   Qry.SQL.Add('WHERE');
   // Cicla per aggiungere i campi della clausola WHERE
   for I := 0 to Length(DbFieldList)-1 do begin
      // Se il campo corrente fà parte della chiave primaria...
      if DbFieldList[I].IsKeyField then begin
         // Inserisce il campo corrente nella clausola WHERE
         Qry.SQL.Add(DbFieldList[I].FieldName + '=' + DbFieldList[I].FieldSQL + ' AND');
      end;
   end;
   // Elimina il carattere ' AND' dall'ultima riga inserita
   Qry.SQL[Qry.SQL.Count-1] := DM1.StrLeft(Qry.SQL[Qry.SQL.Count-1], Length(Qry.SQL[Qry.SQL.Count-1])-4);
end;


function TImportazioneForm.AggiungiCaratteriDelimitatori(Line:String) : String;
var
   I, CDPos : Integer;
begin
   // Inizializzazione
   CDPos := 0;            // CDPos contiene la posizione dell'ultimo delimitatore inserito
   // Cicla per tutti i campi del file ASCII di ingresso e aggiunge il CharDelimiter tra
   //  un campo e l'altro.
   // NB: Cicla 1 volta in meno del numero dei campi perchè alla fine della riga non deve
   //      aggiungere alcun delimitatore
   for I := 0 to Length(AsciiFieldList)-2 do begin
      // Calcola la posizione del prossimo delimitatore
      CDPos := CDPos + AsciiFieldList[I].FieldLength + 1;
      // Agiunge il delimitatore
      Insert(ImportParams.FieldSeparat, Line, CDPos);
   end;
   // Ritorna il risultato
   Result := Line;
end;

procedure TImportazioneForm.ImportaRiga(Line: String);
var
   I : Integer;               // COntatore per loops
   CFV : String;              // CurrentFieldValue
   InitialLineValue : String; // Mantiene il valore originario della stringa
begin
   // Salva il valore iniziale del parametro Line
   InitialLineValue := Line;
   // Racchiude il tutto in Try-Except per poter aggiornare il contatore degli errori
   //  e per non far comparire sempre il messaggio di errore
   try
      // ========================================================================================
      // SEZIONE CHE TRASFORMA LA LINEA RICEVUTA DA FIXED_WIDTH A CHAR_DELIMITED AGGIUNGENDO
      //  DEI CARATTERI DELIMITATORI IN BASE ALLA LUNGHEZZA DICHIARATA DI CIASCUN CAMPO NEL FILTRO.
      //  IN QUESTO MODO POI L'IMPORTAZIONE PROSEGUIRA' CON IL METODO CHAR_DELIMITED.
      //  NB: OVVIAMENTE SOLO PER I FILTRI DI IMPORTAZIONE FIXED_WIDTH
      // ----------------------------------------------------------------------------------------
      if ImportParams.FixedWidth then Line := AggiungiCaratteriDelimitatori(Line);
      // ========================================================================================

      // ========================================================================================
      // SEZIONE CHE PRELEVA I VALORI DEI CAMPI DA IMPORTARE DALLA RIGA CORRENTE DEL FILE ASCII
      //  DA IMPORTARE E CARICA I VALORI NEL CAMPO 'VALUE' DELLA STRUTTURA 'AsciiFieldList'
      //  GIA' CONVERTITI A ADATTATI PER IL SUCCESSIVO INSERIMENTO NELLA QUERY INSERT O UPDATE.
      //  NB: L'IMPORTAZIONE VIENE SEMPRE ESEGUITA COL METODO CHAR_SEPARATOR IN QUANTO ANCHE
      //       SE L'IMPORTAZIONE FOSSE DI TIPO FIXED_WIDTH UNA PROCEDURA PRECEDENTE AVRA'
      //       PROVVEDUTO AD INSERIRE DEI CARATTERI SEPARATORI TRA I CAMPI IN MODO CHE POI
      //       L'IMPORTAZIONE VERRA' EFFETTUATA SEMPRE E COMUNQUE COME CHAR_DELIMITED
      // ----------------------------------------------------------------------------------------
      // Cicla per tutti i campi
      for I := 0 to Length(AsciiFieldList) -1 do begin
         // Preleva il valore del campo corrente. Se c'è un carattere di separazione significa che non è l'ultimo campo
         //  altrimenti è l'ultimo e prende quallo che c'è
         if Pos(ImportParams.FieldSeparat, Line) > 0 then begin
            CFV := Trim(DM1.RitornaTestoPrimaDi(ImportParams.FieldSeparat, Line, True));
         end else begin
            CFV := Trim(Line);
         end;
         // in base al tipo di campo richiama l'opportuno procedura che inserirà il campo attuale
         //  nel campo VALUE del campo corrente nell'opportuno formato in base al tipo.
         if          AsciiFieldList[I].FieldType = FIELD_TYPE_STRING then begin
            AsciiFieldList[I].Value := AddStringField(CFV, AsciiFieldList[I].DefaultValue, AsciiFieldList[I].MaxLength);
         end else if AsciiFieldList[I].FieldType = FIELD_TYPE_NUMBER then begin
            AsciiFieldList[I].Value := AddNumericField(CFV, AsciiFieldList[I].DefaultValue);
         end else if AsciiFieldList[I].FieldType = FIELD_TYPE_BOOLEAN then begin
            AsciiFieldList[I].Value := AddBooleanField(CFV, AsciiFieldList[I].DefaultValue);
         end else if AsciiFieldList[I].FieldType = FIELD_TYPE_DATE then begin
            AsciiFieldList[I].Value := AddDateField(CFV, AsciiFieldList[I].DefaultValue);
         end else if AsciiFieldList[I].FieldType = FIELD_TYPE_DATETIME then begin
            AsciiFieldList[I].Value := AddDateTimeField(CFV, AsciiFieldList[I].DefaultValue);
         end;
      end;
      // ========================================================================================

      // ========================================================================================
      // SEZIONE CHE COSTRUISCE NEL CAMPO FIELDSQL DELLA STRUTTURA 'DbFieldList' LA RIGA SQL
      //  CHE VERRA' UTILIZZATA PER SUCCESSIVO INSERIMENTO DEL RECORD NELLA TABELLA DEL DATABASE
      //  SOSTITUENDO I CONTRASSEGNI DEI CAMPI CON IL VALORE DEI CAMPI STESSI PRELEVATI DAL
      //  FILE ASCII SORGENTE.
      // ----------------------------------------------------------------------------------------
      // Cicla per tutti i campi destinazione
      for I := 0 to Length(DbFieldList) -1 do begin
         // Inizializzazione
         DbFieldList[I].FieldSQL := '';
         // Sostituisce i segnaposto dei campi contenuti nel campo Value e assegna la riga di query
         //  così ottenuta al campo FieldSQL che verrà poi usato per comporre la query di inserimento
         DbFieldList[I].FieldSQL := SostituisciSegnaposto(DbFieldList[I].Value);
         //  NB: Se è specificata una linghezza massima del campo e il campo supera
         //       la lunghezza del campo stesso lo tronca.
         if (DbFieldList[I].MaxLength > 0) and (Length(DbFieldList[I].FieldSQL) > DbFieldList[I].MaxLength) then begin
            DbFieldList[I].FieldSQL := LeftStr(DbFieldList[I].FieldSQL, DbFieldList[I].MaxLength);
         end;
      end;
      // ========================================================================================

      // ========================================================================================
      // SEZIONE CHE COSTRUISCE LA QUERY DI INSERIMENTO O MODIFICA PER IL CARICAMENTO DEL RECORD
      //  CORRENTE.
      // ----------------------------------------------------------------------------------------
      // Verifica se un record con la stessa chiave è già presente nella tabella:
      //  se è presente effettuerà poi un UPDATE,
      //  se non è presente effettuerà un INSERT.
      //  NB: Ovviamente effettua il controllo solo se vi è almeno un campo chiave
      //       nella tabella destinazione.
      if (ImportParams.KeyFieldsCount > 0) and (ItemExist) then begin
         // Costruisce la query UPDATE
         CostruisceQueryUpdate;
         // Ora esegue la query
         Qry.ExecSQL;
         // Aggiorna il log del record updated
         AggiornaUpdatedLog(InitialLineValue);
         // Aggiorna lo status dell'operazione
         Inc(ProgressStatus.UpdatedRecs);
      end else begin
         // Costruisce la query INSERT
         CostruisceQueryInsert;
         // Ora esegue la query
         Qry.ExecSQL;
         // Aggiorna il log del record inserted
         AggiornaInsertedLog(InitialLineValue);
         // Aggiorna lo status dell'operazione
         Inc(ProgressStatus.AppendedRecs);
      end;
      // ========================================================================================
   // Se c'è stato un errore aggiorna il contatore degli errori e aggiorna lo schermo
   except
      Inc(ProgressStatus.Errors);
      AggiornaErrorLog(InitialLineValue);
      Qry.SQL.SaveToFile(DM1.CartellaTmp + 'Import_SQL_Query_Last_Error.txt');
   end;
end;


function TImportazioneForm.AddStringField(Str, DefaultValue:String; MaxLength:Integer): String;
var
   Nullo : Boolean;
   Tmp: String;
begin
   // INIZIO ELIMINAZIONE CARATTERI CHE POSSONO CAUSARE ERRORI NELLE QUERY INTERBASE
   // ---------------------------------------------------------------------------------------------------------------------
   // Inizializzazione
   Nullo := False;
   // Toglie ogni genere di apici all'inizio e alla fine del campo
   //  NB: Nel comando DELETE il primo carattere è il n° 1 non lo 0.
   if (DM1.StrLeft(Str, 1) = '''')or(DM1.StrLeft(Str, 1) = '"') then Delete(Str, 1, 1);
   if (DM1.StrRight(Str, 1) = '''')or(DM1.StrRight(Str, 1) = '"') then Delete(Str, Length(Str), 1);
   // Prima di tutto converto i doppi '""' in un carattere '"' solo
   Str := StringReplace(Str, '""', '"', [rfReplaceAll]);
   // ---------------------------------------------------------------------------------------------------------------------
   // Se a questo punto la stringa da inserire è nulla ed è impostato  un valore di default per questo campo,
   //  inserisce appunto il valore di default, altrimenti lascia tutto così
   Nullo := (Str = '') and (DefaultValue <> 'NO_DEFAULT_VALUE');
   if Nullo then Str := DefaultValue;
   // Se MaxLength > 0 si assicura che il campo non superi tale lunghezza
   if MaxLength > 0 then Str := LeftStr(Str, MaxLength);
   // Se il valore non era nullo aggiunge gli apici
   if not Nullo then Str := QuotedStr(Str);
   // Questa funzione inserisce in CurrRec il valore del campo ricevuto con Str già pronto per essere
   //  inserito nella query (con i doppi apici all'inizio e alla fine e tutti gli apici in mezzo raddoppiati).
   Result := Str;
end;

function TImportazioneForm.AddNumericField(Str, DefaultValue:String): String;
begin
   // Sostituisce il separatore delle migliaia
   Str := StringReplace(Str, ImportParams.AsciiThousandsSeparat, ImportParams.DBThousandsSeparat, [rfReplaceAll]);
   // Sostituisce il separatore dei decimali
   Str := StringReplace(Str, ImportParams.AsciiDecimalSeparat, ImportParams.DBDecimalSeparat, [rfReplaceAll]);
   // Se il campo = Stringa nulla lo fà diventare NULL
   if Str = '' then Str := 'NULL';
   // Se però a questo punto è impostato  un valore di default per questo campo,
   //  inserisce appunto il valore di default, altrimenti lascia tutto così
   if (Str = 'NULL') and (DefaultValue <> 'NO_DEFAULT_VALUE') then Str := DefaultValue;
   // RItorna il valore del campo
   Result := Str;
end;

function TImportazioneForm.AddBooleanField(Str, DefaultValue:String): String;
begin
   // Purifica il dato da eventuali spazi vuoti all'inizio e allla fine
   Str := Trim(Str);
   // Se la stringa ricevuta = 'True' scritto maiuscolo o minuscolo, oppure = 1 pone il campo = 'T' altrimenti = 'F'
   if (Uppercase(Str) = 'TRUE') or (Str = '1') or (Uppercase(Str) = 'T') then Str := 'T' else Str := 'F';
   // Questa funzione inserisce in CurrRec il valore del campo ricevuto con Str già pronto per essere
   //  inserito nella query (con i doppi apici all'inizio e alla fine e tutti gli apici in mezzo raddoppiati).
   Result := QuotedStr(Str);
   // ==================================================================================================================
   // NB: Viene ignorato il valore di default perchè inutile visto che il valore è sicuramente 'F' se non è specificato
   //      '1' oppure 'T' nel valore da importare.
   // ==================================================================================================================
end;

function TImportazioneForm.AddDateField(Str, DefaultValue:String): String;
var
  GG, MM, AA, Formato: String;
  GGpos, MMpos, AApos: Byte;
begin
  // Purifica il dato da eventuali spazi vuoti all'inizio e alla fine
  Str := Trim(Str);

  // Se il carattere separatore per le date nel file ASCII non è specificato (è vuoto)
  //  provvede alla importazione per posizione assoluta considerando sempre l'anno di 4 caratteri.
  if ImportParams.AsciiDateSeparat = '' then
  begin
   if ImportParams.AsciiDateFormat = 'GMA' then
   begin
     GGpos := 1;
     MMpos := 3;
     AApos := 5;
   end
   else
   if ImportParams.AsciiDateFormat = 'MGA' then
   begin
     GGpos := 3;
     MMpos := 1;
     AApos := 5;
   end
   else
   if ImportParams.AsciiDateFormat = 'AMG' then
   begin
     GGpos := 7;
     MMpos := 5;
     AApos := 1;
   end;
  end
  // Se invece il carattere separatore delle date è stato specifiato allora tiene conto anche di quello
  else
  begin
   if ImportParams.AsciiDateFormat = 'GMA' then
   begin
     GGpos := 1;
     MMpos := 4;
     AApos := 7;
   end
   else
   if ImportParams.AsciiDateFormat = 'MGA' then
   begin
     MMpos := 1;
     GGpos := 4;
     AApos := 7;
   end
   else
   if ImportParams.AsciiDateFormat = 'AMG' then
   begin
     AApos := 1;
     MMpos := 6;
     GGpos := 9;
   end;
  end;

  // Estrae giorno, mese e anno in base alle posizioni rilevate
  GG := MidStr(Str, GGpos, 2);
  MM := MidStr(Str, MMpos, 2);
  AA := MidStr(Str, AApos, 4);

  // IN base ai parametri del filtro provvede alla costruzione della stringa del formato da usare poi con FormatDateTime
  if      ImportParams.DBDateFormat = 'GMA' then
   Formato := 'dd' + ImportParams.DBDateSeparat + 'mm' + ImportParams.DBDateSeparat + 'yyyy'
  else
  if ImportParams.DBDateFormat = 'MGA' then
   Formato := 'mm' + ImportParams.DBDateSeparat + 'dd' + ImportParams.DBDateSeparat + 'yyyy'
  else
  if ImportParams.DBDateFormat = 'AMG' then
   Formato := 'yyyy' + ImportParams.DBDateSeparat + 'mm' + ImportParams.DBDateSeparat + 'dd';

  // Ora che levariabili locali contengono il giorno mese e anno, provvede alla conversione nel formato di uscita dalla funzione
  //  in base ai parametri contenuti nel filtro.
  // nb: Ovviamente solo se è una data valida
  if Str <> '' then
  begin
    Str := FormatDateTime(Formato, StrToDate(GG+'/'+MM+'/'+AA));
    // Questa funzione inserisce in CurrRec il valore del campo ricevuto con Str già pronto per essere
    //  inserito nella query (con i doppi apici all'inizio e alla fine e tutti gli apici in mezzo raddoppiati).
    Result := QuotedStr(Str);
  end
  else
  begin
    // RItorna NULL
    Result := 'NULL';
    // Se però a questo punto è impostato  un valore di default per questo campo,
    //  inserisce appunto il valore di default, altrimenti lascia tutto così
    if (Result = 'NULL') and (DefaultValue <> 'NO_DEFAULT_VALUE') then
      Result := DefaultValue;
  end;
end;

function TImportazioneForm.AddDateTimeField(Str, DefaultValue: String): String;
var
  GG, MM, AA, HH, NN, Formato: String;
  GGpos, MMpos, AApos, HHpos, NNpos: Byte;
begin
  // Purifica il dato da eventuali spazi vuoti all'inizio e alla fine
  Str := Trim(Str);

  // Se il carattere separatore per le date nel file ASCII non è specificato (è vuoto)
  //  provvede alla importazione per posizione assoluta considerando sempre l'anno di 4 caratteri.
  if ImportParams.AsciiDateSeparat = '' then
  begin
   if ImportParams.AsciiDateFormat = 'GMA' then
   begin
     GGpos := 1;
     MMpos := 3;
     AApos := 5;
   end
   else
   if ImportParams.AsciiDateFormat = 'MGA' then
   begin
     GGpos := 3;
     MMpos := 1;
     AApos := 5;
   end
   else
   if ImportParams.AsciiDateFormat = 'AMG' then
   begin
     GGpos := 7;
     MMpos := 5;
     AApos := 1;
   end;
  end
  // Se invece il carattere separatore delle date è stato specifiato allora tiene conto anche di quello
  else
  begin
   if ImportParams.AsciiDateFormat = 'GMA' then
   begin
     GGpos := 1;
     MMpos := 4;
     AApos := 7;
   end
   else
   if ImportParams.AsciiDateFormat = 'MGA' then
   begin
     MMpos := 1;
     GGpos := 4;
     AApos := 7;
   end
   else
   if ImportParams.AsciiDateFormat = 'AMG' then
   begin
     AApos := 1;
     MMpos := 6;
     GGpos := 9;
   end;
  end;

  // Determina la posizione della parti che compongono l'orario, in un primo momento considerando
  //  che non sia sstato specificao un separatore per le date e nessun separatore tra data e ora
  HHpos := 9;
  NNpos := 11;
  // Se è stato specificato un separatore tra mese giorno e anno..
  if ImportParams.AsciiDateTimeSeparat <> '' then
  begin
    inc(HHpos, 2);
    inc(NNpos, 2);
  end;
  // Se è stato invece specificato un separatore tra data e ora...
  if ImportParams.AsciiDateTimeSeparat <> '' then
  begin
    inc(HHpos);
    inc(NNpos);
  end;
  // Se è stato specificato un separatore tra le ore e i minuti
  if ImportParams.AsciiTimeSeparat <> '' then
    inc(NNpos);

  // Estrae i dati base alle posizioni rilevate
  GG := MidStr(Str, GGpos, 2);
  MM := MidStr(Str, MMpos, 2);
  AA := MidStr(Str, AApos, 4);
  HH := MidStr(Str, HHpos, 2);
  NN := MidStr(Str, NNpos, 2);

  // IN base ai parametri del filtro provvede alla costruzione della stringa del formato da usare poi con FormatDateTime
  if      ImportParams.DBDateFormat = 'GMA' then
   Formato := 'dd' + ImportParams.DBDateSeparat + 'mm' + ImportParams.DBDateSeparat + 'yyyy'
  else
  if ImportParams.DBDateFormat = 'MGA' then
   Formato := 'mm' + ImportParams.DBDateSeparat + 'dd' + ImportParams.DBDateSeparat + 'yyyy'
  else
  if ImportParams.DBDateFormat = 'AMG' then
   Formato := 'yyyy' + ImportParams.DBDateSeparat + 'mm' + ImportParams.DBDateSeparat + 'dd';
  // Aggiunge l'ora alla stringa del formato
  Formato := Formato + ImportParams.DbDateTimeSeparat + 'hh' + ImportParams.DbTimeSeparat + 'nn';

  // Ora che levariabili locali contengono il giorno mese e anno, provvede alla conversione nel formato di uscita dalla funzione
  //  in base ai parametri contenuti nel filtro.
  // nb: Ovviamente solo se è una data valida
  if Str <> '' then
  begin
    Str := FormatDateTime(Formato, StrToDateTime(GG+FormatSettings.DateSeparator+MM+FormatSettings.DateSeparator+AA+' '+HH+FormatSettings.TimeSeparator+NN));
    // Questa funzione inserisce in CurrRec il valore del campo ricevuto con Str già pronto per essere
    //  inserito nella query (con i doppi apici all'inizio e alla fine e tutti gli apici in mezzo raddoppiati).
    Result := QuotedStr(Str);
  end
  else
  begin
    // RItorna NULL
    Result := 'NULL';
    // Se però a questo punto è impostato  un valore di default per questo campo,
    //  inserisce appunto il valore di default, altrimenti lascia tutto così
    if (Result = 'NULL') and (DefaultValue <> 'NO_DEFAULT_VALUE') then
      Result := DefaultValue;
  end;
end;

function TImportazioneForm.ItemExist: Boolean;
var
   Q:TIB_Cursor;
   i, x: Integer;
begin
   // Questa funzione verifica la presenza o meno di un record nella DestTable con la stessa chiave
   Q := TIB_Cursor.Create(Self);
   try
      Q.DatabaseName := Qry.DatabaseName;
      Q.IB_Connection := Qry.IB_Connection;
      Q.SQL.Add('SELECT COUNT(*) AS NUMITEM FROM ' + ImportParams.DestTable);
      Q.SQL.Add('WHERE');
      // Cicla per tutti i campi destinazione...
      for I := 0 to Length(DbFieldList)-1 do begin
         // Se il campo attuale fà parte della chiave primaria...
         if DbFieldList[I].IsKeyField then begin
            // Inserisce il campo attuale nella query che controllerà se il record con òo stesso
            //  valore di chiave esiste già e quindi deve essere aggiornato oppure no (e quindi deve essere inserito EX-NOVO)
            Q.SQL.Add(DbFieldList[I].FieldName + '=' + DbFieldList[I].FieldSQL + ' AND');
         end;
      end;
      // Elimina il carattere ' AND' dall'ultima riga inserita
      Q.SQL[Q.SQL.Count-1] := DM1.StrLeft(Q.SQL[Q.SQL.Count-1], Length(Q.SQL[Q.SQL.Count-1])-4);
      // Ora la query è pronta per essere eseguita
      Q.Open;
      // Se ne ha trovato almeno uno restituisce True, altrimenti False;
      Result := (Q.FieldByName('NUMITEM').Value > 0);
   finally
      // Distrugge Qry
      Q.Free;
   end;
end;

procedure TImportazioneForm.EseguiQueryAggiuntive;
var
   C:TMemIniFile;
   SezSQL:String;
   Contatore, i:Integer;
begin
   // Visualizza la form dei messaggi
   DM1.ShowWait('', 'Controllo esistenza query aggiuntive.');
   // Esegue le eventuali istruzioni SQL se ci sono
   // Aggiorna il file INI con il nome del file importato
   C := TMemIniFile.Create(DM1.CartellaTmp + 'Macro_' + NomeFileFiltro);
   try
      // Cicla per il controllo e l'eventuale esecuzione delle query aggiuntive
      for i := 1 to MAX_QUERY_AGGIUNTIVE do begin
         // Carica nella variabile 'SezSQL' il nome della sezione del file INI che contiene
         //  il testo della query da eseguire.
         SezSQL := C.ReadString('Params', 'SQLSection' + IntToStr(i), 'NONE');
         // Se il nome della sezione assegnato alla query aggiuntive corrente <> NONE
         if  SezSQL <> 'NONE' then
         begin
            // Aggiorna lo schermo
            DM1.ShowWait('', 'Esecuzione query:  ''' + SezSQL + '''');
            Application.ProcessMessages;
            Sleep(3000);
            // Carica la query
            Qry.Close;
            Qry.SQL.Clear;
            C.ReadSectionValues(SezSQL, Qry.SQL);
            // Elimina i primi 3 caratteri da tutte le voci
            for Contatore := 0 to Qry.SQL.Count - 1 do Qry.SQL[Contatore] := DM1.StrRight(Qry.SQL[Contatore], Length(Qry.SQL[Contatore]) -3);
            Qry.ExecSQL;
         end;
      end;
   finally
      DM1.CloseWait;
      C.Free;
   end;
end;



procedure TImportazioneForm.EseguiQueryAggiuntiveConProtezioneDalleEccezioni;
var
   C:TMemIniFile;
   SezSQL:String;
   Contatore, i:Integer;
begin
   // Visualizza la form dei messaggi
   DM1.ShowWait('', 'Controllo esistenza query aggiuntive EXCEPTION PROTECTED.');
   // Esegue le eventuali istruzioni SQL se ci sono
   // Aggiorna il file INI con il nome del file importato
   C := TMemIniFile.Create(DM1.CartellaTmp + 'Macro_' + NomeFileFiltro);
   try
      // Cicla per il controllo e l'eventuale esecuzione delle query aggiuntive
      for i := 1 to MAX_QUERY_AGGIUNTIVE do begin
         // Carica nella variabile 'SezSQL' il nome della sezione del file INI che contiene
         //  il testo della query da eseguire.
         SezSQL := C.ReadString('Params', 'ExceptionProtected_SQLSection' + IntToStr(i), 'NONE');
         // Se il nome della sezione assegnato alla query aggiuntive corrente <> NONE
         if  SezSQL <> 'NONE' then begin
            // Aggiorna lo schermo
            DM1.ShowWait('', 'Esecuzione query:  ''' + SezSQL + '''');
            // Carica la query
            Qry.Close;
            Qry.SQL.Clear;
            C.ReadSectionValues(SezSQL, Qry.SQL);
            // Elimina i primi 3 caratteri da tutte le voci
            for Contatore := 0 to Qry.SQL.Count - 1 do Qry.SQL[Contatore] := DM1.StrRight(Qry.SQL[Contatore], Length(Qry.SQL[Contatore]) -3);
            // Esegue la query attuale in un blocco try-except per trappare eventuali eccezioni
            try
              Qry.ExecSQL;
            except
            end;
         end;
      end;
   finally
      DM1.CloseWait;
      C.Free;
   end;
end;






procedure TImportazioneForm.ButtonEsciClick(Sender: TObject);
begin
   Close;
end;

procedure TImportazioneForm.ButtonStopClick(Sender: TObject);
begin
   // Blocca l'importazione
   Terminate := True;
end;

procedure TImportazioneForm.TimerBlinkTimer(Sender: TObject);
begin
   // Mette in evidenza la status dell'operazione
   if LabelStatus.Tag = 0 then begin
      TimerBlink.Interval       := 50;
      LabelStatus.Tag           := 1;
      LabelStatus.Font.Color    := clWhite;
      LabelStatus.Update;
   end else begin
      TimerBlink.Interval       := 2000;
      LabelStatus.Tag           := 0;
      LabelStatus.Font.Color    := clRed;
      LabelStatus.Update;
   end;
end;

procedure TImportazioneForm.ComboTipoImportazioneDropDown(Sender: TObject);
var
   SearchRec:TSearchRec;
   NomeFile : String;
begin
   // Carica la lista dei filtri di importazione disponibili nel ComboBox
   // --------------------------------------------------
   // Inizializzazione
   ComboTipoImportazione.Items.Clear;
   // Prima di tutto controlla che la cartella esista
   if DirectoryExists(DM1.ImportFiltersDir) then begin
      // Poi cerca il primo file
      if FindFirst(DM1.ImportFiltersDir + '*.imp', faAnyFile, SearchRec) = 0 then begin
         // Se lo trova lo aggiunge depurandolo dell'estensione
         NomeFile := SearchRec.Name;
         NomeFile := LeftStr(NomeFile, Length(NomeFile)-4);
         ComboTipoImportazione.Items.Add(NomeFile);
         // Trova anche gli eventuali altri files dello stesso tipo e li aggiunge
         while (FindNext(SearchRec) = 0) do begin
            NomeFile := SearchRec.Name;
            NomeFile := LeftStr(NomeFile, Length(NomeFile)-4);
            ComboTipoImportazione.Items.Add(NomeFile);
         end;
      end;
      // Distrugge SearchRec
      FindClose(SearchRec);
   end;
end;

procedure TImportazioneForm.ComboTipoImportazioneChange(Sender: TObject);
var
   C:TMemIniFile;
   Contatore:Integer;
begin
   // Carica il nome esatto del file del filtro nell'apposita variabile globale
   NomeFileFiltro := ComboTipoImportazione.Text + '.imp';
   // Prima di tutto ricopia il file CONV.INI dove sono specificati tutti i filtri di importazione
   //  dalla cartella di esecuzione di levante alla cartella  temporanea di levante sostituendo
   //  contestualmente ogni ricorrenza del carattere TAB (#9) contenuto in tale file con  un
   //  carattere nullo e poi usa quest'ultimo file come filtro di importazione.
   // NB: Tale operazione si è resa necessaria perchè altrimenti con windows 95/98/ME dava un errore in quanto
   //      la funzione ReadString  degli ini files ritornava solo quanto precedeva IL tab e per non modificare il file
   //      CONV.INI  togliendo appunto tale carattere (che è troppo comodo per renderlo più leggibile) si è deciso di fare così.
   DM1.CopiaFileConSostituzioneCarattere(DM1.ImportFiltersDir + NomeFileFiltro, DM1.CartellaTmp + NomeFileFiltro, #9, Char(' '));
   // Prima di caricare il filtro di importazione ne espande le Macro eventualmente contenute
   EspandiMacro(DM1.CartellaTmp + NomeFileFiltro, DM1.CartellaTmp + 'Macro_' + NomeFileFiltro);
   // Carica i parametri del filtro
   CaricaParametriFiltro(DM1.CartellaTmp + 'Macro_' + NomeFileFiltro);
end;

procedure TImportazioneForm.cxShellComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
   // Se c'è inserito qualcosa attiva il pulsante di Avvio Importazione
   if Trim(FileNameEdit.Text) <> '' then begin
      // Aggiorna i parametri
      ImportParams.SourceFile := FileNameEdit.Text;
      // Abilita il pulsante di avvio dell'operazione
      ButtonAvvia.Enabled := True;
   end else begin
      // Altrimenti
      ImportParams.SourceFile := '';
      ButtonAvvia.Enabled := False;
   end;
   Update;
end;

end.
