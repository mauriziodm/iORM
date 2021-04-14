unit FormSynchro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, IB_Components, IB_Process,IniFiles,
  IB_DataScan, IB_Export, IB_Import, ComCtrls, Mask, FileCtrl,
  bmpPanel, ZLIBArchive, SACS, IB_Access;

const
  // COstati che indica il modo di apertura della form
  SYNCHRO_MODE_NORMAL                   = 0;
  SYNCHRO_MODE_AGGLIST                  = 1;
  SYNCHRO_MODE_ARCBASE                  = 2;
  SYNCHRO_MODE_ARCBASE_SILENT           = 3;

type
  TSynchroForm = class(TForm)
    Esporta: TIB_Export;
    Qry: TIB_Query;
    ZLB1: TZLBArchive;
    Importa: TIB_Import;
    ClientArea: TPanel;                                                                                                       
    PanelMezzo: TPanel;
    LabelMezzo: TLabel;
    RichEdit1: TRichEdit;
    MezzoInternet: TRadioButton;
    MezzoDisco: TRadioButton;
    Panel7: TPanel;
    AvantiMezzo: TSpeedButton;
    PanelImportExport: TPanel;
    LabelImportExport: TLabel;
    TREImportExport: TRichEdit;
    Panel8: TPanel;
    AvantiImportExport: TSpeedButton;
    PanelDrive: TPanel;
    LabelDrive: TLabel;
    Panel10: TPanel;
    AvantiDrive: TSpeedButton;
    PanelFine: TPanel;
    LabelFine: TLabel;
    RichEdit5: TRichEdit;
    Panel13: TPanel;
    IniziaFatturazione: TSpeedButton;
    Panel14: TPanel;
    Annulla: TSpeedButton;
    PanelSicurezza: TPanel;
    RichEdit6: TRichEdit;
    Panel15: TPanel;
    SiCopia: TSpeedButton;
    Panel16: TPanel;
    NoCopia: TSpeedButton;
    RichEdit3: TRichEdit;
    TabClienti: TCheckBox;
    TabArticoli: TCheckBox;
    TabDocumenti: TCheckBox;
    TabCondVend: TCheckBox;
    Esportare: TRadioButton;
    Importare: TRadioButton;
    Panel6: TPanel;
    Drive: TDriveComboBox;
    PanelCopriArchivi: TPanel;
    PanelAggiornaListino1: TPanel;
    LabelAggiornaListino1: TLabel;
    REAggList: TRichEdit;
    Panel3: TPanel;
    SBAvviaAggiornaListino: TSpeedButton;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    PanelAggiornaListino2: TPanel;
    LabelAggiornaListino2: TLabel;
    RichEdit4: TRichEdit;
    Panel9: TPanel;
    AvantiRIcarichi: TSpeedButton;
    Ricarico1: TEdit;
    Panel2: TPanel;
    UpDown1: TUpDown;
    Label1: TLabel;
    Ricarico2: TEdit;
    Panel11: TPanel;
    UpDown2: TUpDown;
    Label2: TLabel;
    Ricarico3: TEdit;
    Panel12: TPanel;
    UpDown3: TUpDown;
    Label3: TLabel;
    Ricarico4: TEdit;
    Panel17: TPanel;
    UpDown4: TUpDown;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    QDel: TIB_Cursor;
    ClientTopPanel: TbmpPanel;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function  CiSonoRecordDaEsportare(NomeTabella:String):Boolean;
    procedure EsportaTabellaPerSincronizzazione(NomeTabella:String);
    procedure DefaultizzaSinchro(NomeTabella:String);
    procedure ImportaFileSincronizzazione(NomeFileSNC:String);
    procedure SincronizzaTabellaInput(NomeFile:String);
    procedure ImportaNotifyCount(Sender: TObject; RecsRead, RecsCommented,
      RecsInserted: Integer; var UserAbort: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RefreshScreen;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure AvantiMezzoClick(Sender: TObject);
    procedure SiCopiaClick(Sender: TObject);
    procedure AnnullaClick(Sender: TObject);
    procedure IniziaFatturazioneClick(Sender: TObject);
    procedure EsportaDati;
    procedure ImportaDati;
    procedure SalvaParametri;
    procedure CaricaParametri;
    procedure SvuotaUpload;
    procedure CopiaFileSNCInCartellaDownload;
    procedure MarcaTabellaSincronizzata(NomeTabella:String);
    procedure SBAvviaAggiornaListinoClick(Sender: TObject);
    procedure NoCopiaClick(Sender: TObject);
    procedure AggiornaListino;
    procedure ImportaArcBase;
    procedure MezzoInternetEnter(Sender: TObject);
    procedure MezzoInternetExit(Sender: TObject);
    procedure ImportaDatiAggiornamentoListinoCSV(NomeFileAgg,NomeFileImp:String; R1,R2,R3,R4:Integer);
    procedure ImportaPrePost(Sender: TObject; ARow: TIB_Row;
      var OkToPost: Boolean);

  private
    { Private declarations }
    // Prefisso del nome tabella (COdice chiave + anno+ mese+giorno+ora+minuti+secondi
    FileNamePrefix:String;
    // Contiene l'indicazione del livello attivo al momento
    LivelloAttivo:Shortint;
    // Variabili che contengono il riferimento al documento di cui si stanno importando i righi
    LocTipoDoc,LocRegistro: String;
    LocNumDoc: Longint;
    LocDataDoc: TDate;
    procedure ImportaDatiAggiornamentoListinoLUL(NomeFileAgg: String; R1, R2, R3, R4: Integer);
  public
    { Public declarations }
    // Variabile che indica la modalità di apertura della FormImportazione
    //  - 0) Apertura normale per sincronizzazione generale
    //  - 1) Apertura per aggiornamento automatico listini
    //  - 2) Apertura per aggiornamento nuova versione degli archivi di base
    FormMode:Integer;
    // Variabile che contiene il titolo del messaggio che viene visualizzato sullo schermo durante l'operazione
    TitoloMessaggio:String;
  end;

var
  SynchroForm: TSynchroForm;

implementation

uses main, DataModule1, FormImportazione;

{$R *.DFM}


procedure TSynchroForm.CopiaFileSNCInCartellaDownload;
var
   SearchRec:TSearchRec;
begin
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Ricerca files di sincronizzazione');
   // Cicla per tutti i files di sincronizzazione presenti nella cartella di Download (*.SNC)
   if FindFirst(Drive.Drive + ':\*.SNC', faAnyFile, SearchRec) = 0 then begin
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Copia file sincronizzazione: ' + SearchRec.Name);
      // Solo se il file è stato generato da un'anltra stazione (controlla i primi 4 caratteri del nome file che contengono il cotice dalla chiave)
      if DM1.StrLeft(SearchRec.Name, 4) <> DM1.CodiceUtente then begin
         // Copia il file di sincronizzazione corrente
         DM1.CopiaFile(Drive.Drive+':\'+SearchRec.Name, DM1.DownloadDir+SearchRec.Name);
         // Elimina il file di sincronizzazione corrente dal disco
         DM1.EliminaFile(Drive.Drive+':\'+SearchRec.Name);
      end;
      // Cicla finchè vi sono files di sincronizzazione da elaborare
      while (FindNext(SearchRec) = 0) do begin
         // Aggiorna lo schermo
         DM1.ShowWait(TitoloMessaggio, 'Copia file sincronizzazione: ' + SearchRec.Name);
         // Solo se il file è stato generato da un'anltra stazione (controlla i primi 4 caratteri del nome file che contengono il cotice dalla chiave)
         if DM1.StrLeft(SearchRec.Name, 4) <> DM1.CodiceUtente then begin
            // Copia il file di sincronizzazione corrente
            DM1.CopiaFile(Drive.Drive+':\'+SearchRec.Name, DM1.DownloadDir+SearchRec.Name);
            // Elimina il file di sincronizzazione corrente dal disco
            DM1.EliminaFile(Drive.Drive+':\'+SearchRec.Name);
         end;
      end;
      FindClose(SearchRec);
   // Se non ci sono files di sincronizzazione da importare visualizza un messaggio sullo schermo
   end else begin
      MessageBeep(0);
      MessageDlg('Non sono stati individuati files di sincronizzazione.', mtInformation, [mbOk], 0);
   end;
end;



procedure TSynchroForm.SvuotaUpload;
var
   SearchRec:TSearchRec;
begin
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Eliminazione files Synchro precedenti.');
   // Cicla per tutti i files di sincronizzazione presenti nella cartella di Download (*.SNC)
   if FindFirst(DM1.UploadDir + '*.SNC', faAnyFile, SearchRec) = 0 then begin
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Eliminazione file: ' + SearchRec.Name);
      // Elimina il file corrente
      DM1.EliminaFile(DM1.UploadDir + SearchRec.Name);
      // Cicla finchè vi sono files di sincronizzazione da elaborare
      while (FindNext(SearchRec) = 0) do begin
         // Aggiorna lo schermo
         DM1.ShowWait(TitoloMessaggio, 'Eliminazione file: ' + SearchRec.Name);
         // Elimina il file corrente
         DM1.EliminaFile(DM1.UploadDir + SearchRec.Name);
      end;
      FindClose(SearchRec);
   end;
   // Dealloca SearchRec
   FindClose(SearchRec);
end;


procedure TSynchroForm.CaricaParametri;
var
   P, LO: TMemIniFile;
   StrDrive: String;
begin
   // Apre il file Param.ini
   P  := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
   LO := TMemIniFile.Create(DM1.CurrDir + 'agglist.ini');
   try
      // Carica i dati
      MezzoDisco.Checked        := P.ReadBool('SINCRONIZZAZIONE',   'MezzoDisco',     False);
      MezzoInternet.Checked     := P.ReadBool('SINCRONIZZAZIONE',   'MezzoInternet',  False);
      Importare.Checked         := P.ReadBool('SINCRONIZZAZIONE',   'Importare',      False);
      Esportare.Checked         := P.ReadBool('SINCRONIZZAZIONE',   'Esportare',      False);
      StrDrive                  := P.ReadString('SINCRONIZZAZIONE', 'Drive',          'A');
      Drive.Drive               := StrDrive[1];
      TabClienti.Checked        := P.ReadBool('SINCRONIZZAZIONE',   'TabClienti',     False);
      TabArticoli.Checked       := P.ReadBool('SINCRONIZZAZIONE',   'TabArticoli',    False);
      TabDocumenti.Checked      := P.ReadBool('SINCRONIZZAZIONE',   'TabDocumenti',   False);
      TabCondVend.Checked       := P.ReadBool('SINCRONIZZAZIONE',   'TabCondVend',    False);
      // Carica i dati dell'aggiornamento automatico
      Ricarico1.Text := LO.ReadString('LISTINO1', 'Ricarico1', '0');
      Ricarico2.Text := LO.ReadString('LISTINO1', 'Ricarico2', '0');
      Ricarico3.Text := LO.ReadString('LISTINO1', 'Ricarico3', '0');
      Ricarico4.Text := LO.ReadString('LISTINO1', 'Ricarico4', '0');
   finally
      // Distrugge P
      P.Free;
      LO.Free;
   end;
end;


procedure TSYnchroForm.SalvaParametri;
var
   P: TMemIniFile;
begin
   // Apre il file Param.ini
   P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
   try
      // Salva i dati
      P.WriteBool('SINCRONIZZAZIONE',   'MezzoInternet',  MezzoInternet.Checked);
      P.WriteBool('SINCRONIZZAZIONE',   'MezzoDisco',     MezzoDisco.Checked);
      P.WriteBool('SINCRONIZZAZIONE',   'Esportare',      Esportare.Checked);
      P.WriteBool('SINCRONIZZAZIONE',   'Importare',      Importare.Checked);
      P.WriteString('SINCRONIZZAZIONE', 'Drive',          Drive.Drive);
      P.WriteBool('SINCRONIZZAZIONE',   'TabClienti',     TabClienti.Checked);
      P.WriteBool('SINCRONIZZAZIONE',   'TabArticoli',    TabArticoli.Checked);
      P.WriteBool('SINCRONIZZAZIONE',   'TabDocumenti',   TabDocumenti.Checked);
      P.WriteBool('SINCRONIZZAZIONE',   'TabCondVend',    TabCondVend.Checked);
      // Scrive sul disco
      P.UpdateFile;
   finally
      // Distrugge P
      P.Free;
   end;
end;


procedure TSynchroForm.RefreshScreen;
begin
 // In base al valore di FormMode visualizza i pannelli nell'ordine opportuno
 case FormMode of

    // =================================================================================
    // Se è in modalità di sincronizzazione normale...
    // ---------------------------------------------------------------------------------
    SYNCHRO_MODE_NORMAL: begin
       // In base al livello attivo aggiorna lo schermo in modo appropriato
       case LivelloAttivo of
          // LIVELLO0
          0: begin
             MessageBeep(0);
             PanelSicurezza.Top := 40;
             PanelSicurezza.Visible := True;
             DM1.SetPanelState(0, PanelMezzo, LabelMezzo, LivelloAttivo);
             DM1.SetPanelState(0, PanelImportExport, LabelImportExport, LivelloAttivo);
             DM1.SetPanelState(0, PanelDrive, LabelDrive, LivelloAttivo);
             DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
          end;
          // LIVELLO1
          1: begin
             PanelSicurezza.Visible := False;
             DM1.SetPanelState(2, PanelMezzo, LabelMezzo, LivelloAttivo);
             DM1.SetPanelState(0, PanelImportExport, LabelImportExport, LivelloAttivo);
             DM1.SetPanelState(0, PanelDrive, LabelDrive, LivelloAttivo);
             DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
             if MezzoInternet.Checked then MezzoInternet.SetFocus else MezzoDisco.SetFocus;
          end;
          // LIVELLO2
          2: begin
             PanelSicurezza.Visible := False;
             // PanelMezzo disattivo
             DM1.SetPanelState(1, PanelMezzo, LabelMezzo, LivelloAttivo);
             // In base alla selezione del mezzo...
             if MezzoDisco.Checked then begin
                // A mezzo disco
                DM1.SetPanelState(2, PanelImportExport, LabelImportExport, LivelloAttivo);
                DM1.SetPanelState(0, PanelDrive, LabelDrive, LivelloAttivo);
                DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
                if Importare.Checked then Importare.SetFocus else Esportare.SetFocus;
             end else if MezzoInternet.Checked then begin
                // A mezzo internet
                // NON ANCORA FATTO
             end;
          end;
          // LIVELLO3
          3: begin
             PanelSicurezza.Visible := False;
             // PanelMezzo disattivo
             DM1.SetPanelState(1, PanelMezzo, LabelMezzo, LivelloAttivo);
             // In base alla selezione del mezzo...
             if MezzoDisco.Checked then begin
                // A mezzo disco
                DM1.SetPanelState(1, PanelImportExport, LabelImportExport, LivelloAttivo);
                DM1.SetPanelState(2, PanelDrive, LabelDrive, LivelloAttivo);
                DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
                Drive.SetFocus;
             end else if MezzoInternet.Checked then begin
                // A mezzo internet
                // NON ANCORA FATTO
             end;
          end;
          // LIVELLO4
          4: begin
             PanelSicurezza.Visible := False;
             // Panel mezzo disattivo
             DM1.SetPanelState(1, PanelMezzo, LabelMezzo, LivelloAttivo);
             // In base alla selezione del mezzo
             if MezzoDisco.Checked then begin
                // A mezzo disco
                DM1.SetPanelState(1, PanelImportExport, LabelImportExport, LivelloAttivo);
                DM1.SetPanelState(1, PanelDrive, LabelDrive, LivelloAttivo);
                DM1.SetPanelState(2, PanelFine, LabelFine, LivelloAttivo);
             end else if MezzoInternet.Checked then begin
                // A mezzo internet
                // NON ANCORA FATTO
             end;
          end;
       end;
       // Se si stà esportando, visualizza anche la selezione di quali archivi esportare, altrimenti copre tutto con un panel
       if Esportare.Checked then PanelCopriArchivi.Visible := False else begin PanelCopriArchivi.Visible := True; PanelCopriArchivi.Color := PanelDrive.Color; PanelCopriArchivi.BringToFront; end;
    end;
    // =================================================================================

    // =================================================================================
    // Se è in modalità di aggiornamento automatico listino...
    // ---------------------------------------------------------------------------------
    SYNCHRO_MODE_AGGLIST: begin
       // In base al livello attivo aggiorna lo schermo in modo appropriato
       case LivelloAttivo of
          // LIVELLO0
          0: begin
             MessageBeep(0);
             PanelSicurezza.Top := 40;
             PanelSicurezza.Visible := True;
             DM1.SetPanelState(0, PanelMezzo, LabelMezzo, LivelloAttivo);
             DM1.SetPanelState(0, PanelImportExport, LabelImportExport, LivelloAttivo);
             DM1.SetPanelState(0, PanelDrive, LabelDrive, LivelloAttivo);
             DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
             DM1.SetPanelState(0, PanelAggiornaListino2, LabelAggiornaListino2, LivelloAttivo);
             DM1.SetPanelState(0, PanelAggiornaListino1, LabelAggiornaListino1, LivelloAttivo);
          end;
          // LIVELLO1
          1: begin
             PanelSicurezza.Visible := False;
             DM1.SetPanelState(2, PanelAggiornaListino2, LabelAggiornaListino2, LivelloAttivo);
             DM1.SetPanelState(0, PanelAggiornaListino1, LabelAggiornaListino1, LivelloAttivo);
             Ricarico1.SetFocus;
          end;
          // LIVELLO2
          2: begin
             PanelSicurezza.Visible := False;
             DM1.SetPanelState(1, PanelAggiornaListino2, LabelAggiornaListino2, LivelloAttivo);
             DM1.SetPanelState(2, PanelAggiornaListino1, LabelAggiornaListino1, LivelloAttivo);
          end;
       end;
    end;
    // =================================================================================

    // =================================================================================
    // Se è in modalità di aggiornamento degli archivi di base...
    // ---------------------------------------------------------------------------------
    SYNCHRO_MODE_ARCBASE: begin
       DM1.SetPanelState(0, PanelMezzo, LabelMezzo, LivelloAttivo);
       DM1.SetPanelState(0, PanelImportExport, LabelImportExport, LivelloAttivo);
       DM1.SetPanelState(0, PanelDrive, LabelDrive, LivelloAttivo);
       DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
       DM1.SetPanelState(0, PanelAggiornaListino2, LabelAggiornaListino2, LivelloAttivo);
       DM1.SetPanelState(0, PanelAggiornaListino1, LabelAggiornaListino1, LivelloAttivo);
       // Non esiste il livello zero per questa funzione quindi lo forza a 1
       LivelloAttivo := 1;
       // In base al livello attivo aggiorna lo schermo in modo appropriato
       case LivelloAttivo of
          // LIVELLO0
          1: begin
             // Modifica il testo del messaggio del pannello e il pulsante di avvio dell'operazione
             REAggList.Lines.Clear;
             REAggList.Lines.Add('Ora Lev@nte avvierà la procedura per l''aggiornamento automatico degli ARCHIVI DI BASE.  Per iniziare cliccare sul pulsante "Inizia aggiornamento automatico ARCHIVI DI BASE".');
             SBAvviaAggiornaListino.Caption := 'Inizia aggiornamento automatico ARCHIVI DI BASE';
             // Abilita il pannello corretto
             PanelSicurezza.Visible := False;
             DM1.SetPanelState(2, PanelAggiornaListino1, LabelAggiornaListino1, LivelloAttivo);
          end;
       end;
    end;
    // =================================================================================

 end;

   // Forza il painting della form
   Update;
end;


procedure TSynchroForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(SynchroForm, COLOR_MODIFICA);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Sincronizzazione)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
end;

procedure TSynchroForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // Sblocca l'azienda
   DM1.UnLockDatabaseAccess;

   // Ripristina l'iconaDocTipoPrecedente
   //  NB: ho messo la condizione perchè questa form viene creata anche per il precaricamento
   //  degli archivi di base quando si crea una nuova azienda e in qesto caso la form viene
   //  creata ma non viene visualizzata e allora, visto che l'IconaDocTipo non viene caricata
   //  in quanto l'evento onShow non viene eseguito non deve nemmeno ripristinare l'IconaDocTipo
   //  precedente altrimenti darebbe un errore.
   if Visible then begin
      // Rende invisibile la LabelTipoDocumento e il relativo pulsante
      // e ripristina la IconaDocTipo precedente
      //  Prima ovviamente sblocca l'IconaDocTipo
      MainForm.BloccaIconaDocTipo(False, Name);
      MainForm.RipristinaIconaDocTipo;
   end;

   // Chiude tutto
   Action := caFree;
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBUtilita.Down := False;
   // Il puntatore alla form := nil
   SynchroForm := nil;
end;

procedure TSynchroForm.FormShow(Sender: TObject);
begin
   // Inizializza alcune variabili
   LocTipoDoc := 'X)X)X)X)X)';
   LocRegistro := '§';
   LocNumDoc := -999999;
   LocDataDoc := StrToDate('31/12/2100');
   // Imposta la connessione
   QDel.IB_Connection := DM1.DBAzienda;
   // Inizializzazione form
   LivelloAttivo := 0;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Utilita');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);

   // Aggiorna lo schermo
   RefreshScreen;
   DM1.FocusRefresh;
end;

procedure TSynchroForm.EsportaDati;
var
   Year, Month, Day, Hour, Min, Sec, MSec: Word;
   NomeTabella:String;
   Present: TDateTime;
   ElencoTabelle: TStrings;
   i:Integer;
   SearchRec:TSearchRec;
begin
   // Blocca il database dell'azienda (server un accesso esclusivo per l'importazione degli archivi).
   if not DM1.LockDatabaseAccess then Exit;
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Inizializzazione per l''esportazione...');
   // Carica l'elenco delle tabelle da sincronizzare
   ElencoTabelle := TStringList.Create;
   // In base ai check del tipo di archivi da esportare, immette nell'elenco delle tabelle da esportare le relative tabelle
   if TabClienti.Checked then begin
      ElencoTabelle.Add('CLIENTI');
      ElencoTabelle.Add('SUBSOGG');
      ElencoTabelle.Add('PAGAM');
      ElencoTabelle.Add('BANCHE');
   end;
   if TabArticoli.Checked then begin
      ElencoTabelle.Add('ARTICOLI');
      ElencoTabelle.Add('MAGAZZINI');
      ElencoTabelle.Add('ANAGMAGA');
      ElencoTabelle.Add('GRUPPI');
      ElencoTabelle.Add('ALIQIVA');
   end;
   if TabDocumenti.Checked then begin
      ElencoTabelle.Add('PRATICHE');
      ElencoTabelle.Add('APPARECCHI');
      ElencoTabelle.Add('CONFORM');
      ElencoTabelle.Add('RIGHICONF');
      ElencoTabelle.Add('PRVORDCL');
      ElencoTabelle.Add('RIGHIPRV');
      ElencoTabelle.Add('CAUSALI');
      ElencoTabelle.Add('CAUSALICANTIERI');
      ElencoTabelle.Add('STATI');
   end;
   if TabCondVend.Checked then begin
      ElencoTabelle.Add('CONDVEND');
   end;
   // Calcola il prefisso dei nomi dei files su cui saranno esportati i dati per la sincronizzazione
   Present := Now;
   DecodeDate(Present, Year, Month, Day);
   DecodeTime(Present, Hour, Min, Sec, MSec);
   FileNamePrefix := DM1.PadR(DM1.CodiceUtente, '0', 3)
                   + DM1.PadR(DM1.StrRight(IntToStr(Year), 2),   '0', 2)
                   + DM1.PadR(IntToStr(Month),  '0', 2)
                   + DM1.PadR(IntToStr(Day),    '0', 2)
                   + DM1.PadR(IntToStr(Hour),   '0', 2)
                   + DM1.PadR(IntToStr(Min),    '0', 2)
                   + DM1.PadR(IntToStr(Sec),    '0', 2);
   // Assegnazione della connessione
   Qry.IB_Connection            := DM1.DBAzienda;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ESPORTAZIONE
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   // Cicla per tutte le tabella da esportare
   for i := 0 to ElencoTabelle.Count - 1 do begin
      // Carica il nome della tabella corrente in questa variabile per comodità
      NomeTabella := ElencoTabelle[i];
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Esportazione archivio: ' + NomeTabella);
      // Tutti i records con il campo SINCHRO nullo devono essere defaultizzati a MODIFICATI
      DefaultizzaSinchro(NomeTabella);
      // Prima di tutto controlla se la tabella corrente ha dei record da esportare.
      if CiSonoRecordDaEsportare(NomeTabella) then begin
         // Effettua l'esportazione della tabella
         EsportaTabellaPerSincronizzazione(NomeTabella);
         // Marca i records esportati della tabella come sincronizzati
         MarcaTabellaSincronizzata(NomeTabella);
      end;
   end;
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// COMPRESSIONE
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Creazione archivio compresso.');
   // Creazione archivio compresso
   ZLB1.CreateArchive(DM1.UploadDir + FileNamePrefix + 'Synchro.SNC');
   try
      // Preleva tutti i files esportati (solo quelli della esportazione corrente) e li inserisce nell'archivio compresso
      if FindFirst(DM1.CartellaTmp + FileNamePrefix + '*.EXP', faAnyFile, SearchRec) = 0 then begin
         // Aggiorna lo schermo
         DM1.ShowWait(TitoloMessaggio, 'Compressione file : ' + SearchRec.Name);
         // Compressione file corrente
         ZLB1.AddFile(DM1.CartellaTmp + SearchRec.Name);
         while (FindNext(SearchRec) = 0) do begin
            // Aggiorna lo schermo
            DM1.ShowWait(TitoloMessaggio, 'Compressione file : ' + SearchRec.Name);
            // Compressione file corrente
            ZLB1.AddFile(DM1.CartellaTmp + SearchRec.Name);
         end;
      end;
   finally
      // Dealloca
      FindClose(SearchRec);
      // Chiude l'archivio compresso
      ZLB1.CloseArchive;
   end;
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// COPIA FILE COMPRESSO DI SINCRONIZZAZIONE SE E' STATA SELEZIONATA LA SINCRONIZZAZIONE CON DISCO
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   if MezzoDisco.Checked then begin
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Copia file synchro sul drive: "' + Drive.Drive + '"');
      // Copia il file di sincronizzazione sul disco selezionato
      DM1.CopiaFile(DM1.UploadDir+FileNamePrefix+'Synchro.SNC', Drive.Drive+':\'+FileNamePrefix+'Synchro.SNC');
   end;
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end;


procedure TSynchroForm.DefaultizzaSinchro(NomeTabella:String);
var
   Qry:TIB_Query;
begin
   // Crea la query
   Qry := TIB_Query.Create(Self);
   try
      // Inizializza la connessione della query
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Per default tutti i record con il campo SINCHRO nullo (i vecchi records) diventano modificati
      Qry.SQL.Add('UPDATE ' + NomeTabella + ' SET SINCHRO = ''' + RECORD_MODIFIED + ''' WHERE SINCHRO IS NULL');
      Qry.ExecSQL;
   finally
      // Distrugge al query
      Qry.Free;
   end;
end;


function  TSynchroForm.CiSonoRecordDaEsportare(NomeTabella:String):Boolean;
var
   Qry:TIB_Query;
begin
   Result := False;
   // Crea la query
   Qry := TIB_Query.Create(Self);
   try
      // Inizializza la connessione della query
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT COUNT(*) AS QUANTI FROM ' + NomeTabella + ' WHERE SINCHRO <> ''' + RECORD_SYNCHRONIZED + '''');
      Qry.Open;
      // Se trova almeno un record da esportare ritorna True
      Result := (Qry.FieldByName('QUANTI').AsInteger > 0);
   finally
      // Distrugge al query
      Qry.Close;
      Qry.Free;
   end;
end;


procedure  TSynchroForm.MarcaTabellaSincronizzata(NomeTabella:String);
var
   Qry:TIB_Query;
begin
   // Crea la query
   Qry := TIB_Query.Create(Self);
   try
      // Inizializza la connessione della query
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('UPDATE ' + NomeTabella + ' SET SINCHRO = ''' + RECORD_SYNCHRONIZED + ''' WHERE SINCHRO <> ''' + RECORD_SYNCHRONIZED + '''');
      Qry.ExecSQL;
   finally
      // Distrugge al query
      Qry.Free;
   end;
end;


procedure TSynchroForm.EsportaTabellaPerSincronizzazione(NomeTabella:String);
begin
   try
      // Aggiorna la queri che alimenta il motore per l'esportazione con i righi della tabella corente modificati
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT * FROM ' + NomeTabella + ' WHERE SINCHRO <> ''' + RECORD_SYNCHRONIZED + '''');
      // Imposta il nome del file ASCII su cui verranno esportati i dati
      Esporta.FileName := DM1.CartellaTmp + FileNamePrefix + NomeTabella + '.EXP';
      // Esegue l'esportazione
      Esporta.Execute;
   except
      // Visualizza un errore per informare l'utente
      on E: Exception do begin
         MessageBeep(0);
         MessageDlg('A T T E N Z I O N E !!!'#13#13'Errore durante l''esportazione della tabella "' + NomeTabella + '".'#13#13'CONTROLLARE BENE i dati della tabella dopo aver completato la sincronizzazione'#13'per verificare che non vi siano state PERDITE DI DATI.'#13#13'Error: ' + E.Message, mtError, [mbOk], 0);
      end;
   end;
end;


procedure TSynchroForm.ImportaFileSincronizzazione(NomeFileSNC:String);
var
   i:Integer;
begin
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Apertura archivio compresso...');
   // Apre l'archivio compresso
   ZLB1.OpenArchive(DM1.DownloadDir + NomeFileSNC);
   try
      // Cicla per tutti i file contenuti nell'archivio compresso
      for i := 0 to ZLB1.FileCount - 1 do begin
         // Aggiorna lo schermo
         DM1.ShowWait(TitoloMessaggio, 'Decompressione file: ' + ZLB1.Files[i].name);
         // Espande il file corrente nella cartella di Download
         ZLB1.ExtractFileByIndex(DM1.CartellaTmp, i);
         // Aggiorna lo schermo
         DM1.ShowWait(TitoloMessaggio, 'Sincronizzazione file: ' + ZLB1.Files[i].name);
         // Importa il file appena estratto dall'archivio compresso
         SincronizzaTabellaInput(ZLB1.Files[i].name);
      end;
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Elimina file di sincronizzazione.');
      // Dopo averlo importato, elimina il file di sincronizzazione dalla cartella DOwnload
      DM1.EliminaFile(DM1.DownloadDir + NomeFileSNC);
   finally
      // Chiude l'archivio compresso
      ZLB1.CloseArchive;
   end;
end;


procedure TSynchroForm.SincronizzaTabellaInput(NomeFile:String);
begin
   // Imposta il componente per l'importazione del file
   Importa.IB_Connection        := DM1.DBAzienda;               // IMposta la connessione
   Importa.DestTable            := DM1.StrRight(NomeFile, Length(NomeFile)-16);                 // Prima depura il nome file dalla parte iniziale con data e ora
   Importa.DestTable            := DM1.StrLeft(Importa.DestTable, Length(Importa.DestTable)-4); // Poi lo depura anche dall'estensione (ottenendo così il nome della tabella bersaglio)
   Importa.InputFile            := DM1.CartellaTmp + NomeFile;  // Imposta il nome del file ASCII da importare
   // Avvia lìimportazione
   Importa.Execute;
end;

procedure TSynchroForm.ImportaNotifyCount(Sender: TObject; RecsRead,
  RecsCommented, RecsInserted: Integer; var UserAbort: Boolean);
begin
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Sincronizzazione archivio: ' + Importa.DestTable + ' (Rec: ' + IntToStr(RecsRead) + ')');
end;

procedure TSynchroForm.ImportaPrePost(Sender: TObject; ARow: TIB_Row;
  var OkToPost: Boolean);
var
   PrzAcq: Real;
   Ric1, Ric2, Ric3, Ric4: Real;
begin
   // INizializzazione
   Ric1 := StrToFloat(Ricarico1.Text);
   Ric2 := StrToFloat(Ricarico2.Text);
   Ric3 := StrToFloat(Ricarico3.Text);
   Ric4 := StrToFloat(Ricarico4.Text);

   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   // IL RECORD CHE SI STA' IMPORTANDO VIENE MARCATO COME SINCRONIZZATO
   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   ARow.SetColumnValue('SINCHRO', RECORD_SYNCHRONIZED);
   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------

   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   // IN QUESTA FUNZIONE VIENE ELIMINATO IL RECORD DA AGGIORNARE IN MODO CHE NON DIA KEY VIOLATION ERROR
   //----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   // Aggiorna lo schermo
//   DM1.ShowWait(TitoloMessaggio, 'Cancellaz. record da aggiornare su: ' + Importa.DestTable);
   // Azzera la query
   QDel.Close;
   QDel.SQL.Clear;
   // Imposta la parte iniziale della query
   QDel.SQL.Add('DELETE FROM ' + Importa.DestTable + ' WHERE');
   // In base a quale tabella si stà importando applica la corretta query che elimina il record con la stessa chiave eventualmente già presente
   //  nella tabella.
   if          Importa.DestTable = 'ALIQIVA'    then begin
      QDel.SQL.Add('CODICEIVA = ' + ARow.Columns[0].AsString);
   end else if Importa.DestTable = 'ANAGMAGA'   then begin
      QDel.SQL.Add('CODICE = ' + ARow.Columns[0].AsString);
   end else if Importa.DestTable = 'ARTICOLI'   then begin
      QDel.SQL.Add('CODICEARTICOLO = ''' + ARow.Columns[0].AsString + '''');
      // Calcola i listini di vendita in base ai ricarichi inseriti dall'utente prima di inserire il record nella tabella
      // NB: SOLO IN MODALITA' DI AGGIORNAMENTO AUTOMATICO LISTINI
      if FormMode = SYNCHRO_MODE_AGGLIST then begin
         PrzAcq := ARow.GetColumnValue('ULTIMOPRZACQUISTO');                                               // Prezzo di acquisto memorizzato in questa variabile per comodità
         ARow.SetColumnValue('PREZZODILISTINO', PrzAcq);                                                   // Prezzo di listino = UltimoPrzAcquisto
         ARow.SetCOlumnValue('PREZZODILISTINOIVACOMP', PrzAcq * 1.2);                                      // Prezzo di listino IVA compresa (IVA FISSA 20%)
         ARow.SetColumnValue('SCONTODIACQUISTO', 0);                                                       // Sconto di acquisto
         ARow.SetColumnValue('PREZZODIVENDITA',  PrzAcq * (Ric1 / 100 + 1));                               // Prezzo di vendita 1
         ARow.SetColumnValue('PREZZODIVENDITA2', PrzAcq * (Ric2 / 100 + 1));                               // Prezzo di vendita 2
         ARow.SetColumnValue('PREZZODIVENDITA3', PrzAcq * (Ric3 / 100 + 1));                               // Prezzo di vendita 3
         ARow.SetColumnValue('PREZZODIVENDITA4', PrzAcq * (Ric4 / 100 + 1));                               // Prezzo di vendita 4
         ARow.SetColumnValue('PRZVENDIVACOMP1', ARow.GetColumnValue('PREZZODIVENDITA') * 1.2 );            // Prezzo di vendita IVA compresa 20%
         ARow.SetColumnValue('PRZVENDIVACOMP2', ARow.GetColumnValue('PREZZODIVENDITA2') * 1.2 );           // Prezzo di vendita IVA compresa 20%
         ARow.SetColumnValue('PRZVENDIVACOMP3', ARow.GetColumnValue('PREZZODIVENDITA3') * 1.2 );           // Prezzo di vendita IVA compresa 20%
         ARow.SetColumnValue('PRZVENDIVACOMP4', ARow.GetColumnValue('PREZZODIVENDITA4') * 1.2 );           // Prezzo di vendita IVA compresa 20%
         ARow.SetColumnValue('RICARICO',  Ric1);                                                           // Ricarico 1
         ARow.SetColumnValue('RICARICO2', Ric2);                                                           // Ricarico 2
         ARow.SetColumnValue('RICARICO3', Ric3);                                                           // Ricarico 3
         ARow.SetColumnValue('RICARICO4', Ric4);                                                           // Ricarico 4
         ARow.SetColumnValue('IMPORTORICARICO',  ARow.GetColumnValue('PREZZODIVENDITA') - PrzAcq);         // Importo ricarico 1
         ARow.SetColumnValue('IMPORTORICARICO2', ARow.GetColumnValue('PREZZODIVENDITA2') - PrzAcq);        // Importo ricarico 2
         ARow.SetColumnValue('IMPORTORICARICO3', ARow.GetColumnValue('PREZZODIVENDITA3') - PrzAcq);        // Importo ricarico 3
         ARow.SetColumnValue('IMPORTORICARICO4', ARow.GetColumnValue('PREZZODIVENDITA4') - PrzAcq);        // Importo ricarico 4
         // IN base al flag imposta per default l'articolo movimentabile di conseguenza
         if DM1.DefaultAbilitaMovMag then ARow.SetColumnValue('ABILITAMOVMAG', 'T') else ARow.SetColumnValue('ABILITAMOVMAG', 'F');
      end;
   end else if Importa.DestTable = 'BANCHE'     then begin
      QDel.SQL.Add('ABI = ''' + ARow.Columns[0].AsString + ''' AND CAB = ''' + ARow.Columns[1].AsString + '''');
   end else if Importa.DestTable = 'CAUSALI'    then begin
      QDel.SQL.Add('DESCRIZIONE = ''' + ARow.Columns[0].AsString + '''');
   end else if Importa.DestTable = 'CLIENTI'    then begin
      QDel.SQL.Add('CODICE = ' + ARow.Columns[0].AsString);
   end else if Importa.DestTable = 'CONDVEND'   then begin
      QDel.SQL.Add('    TIPO = ''' + ARow.Columns[0].AsString + '''');
      QDel.SQL.Add('AND CODICESOGGETTO = ' + ARow.Columns[1].AsString);
      QDel.SQL.Add('AND CODICEARTICOLO = ''' + ARow.Columns[2].AsString + '''');
      QDel.SQL.Add('AND CODICEGRUPPO1 = ' + ARow.Columns[3].AsString);
      QDel.SQL.Add('AND CODICEGRUPPO2 = ' + ARow.Columns[4].AsString);
      QDel.SQL.Add('AND CODICEGRUPPO3 = ' + ARow.Columns[5].AsString);
   end else if Importa.DestTable = 'GRUPPI'     then begin
      QDel.SQL.Add('    CODICE1 = ' + ARow.Columns[0].AsString);
      QDel.SQL.Add('AND CODICE2 = ' + ARow.Columns[1].AsString);
      QDel.SQL.Add('AND CODICE3 = ' + ARow.Columns[2].AsString);
   end else if Importa.DestTable = 'MAGAZZINI'  then begin
      QDel.SQL.Add('    CODICEARTICOLO = ''' + ARow.Columns[0].AsString + '''');
      QDel.SQL.Add('AND CODICEMAGAZZINO = ' + ARow.Columns[1].AsString);
   end else if Importa.DestTable = 'PAGAM'      then begin
      QDel.SQL.Add('CODICE = ' + ARow.Columns[0].AsString);
   end else if Importa.DestTable = 'PRATICHE'   then begin
      QDel.SQL.Add('    CODICE = ' + ARow.Columns[0].AsString);
      QDel.SQL.Add('AND DATAAPERTURA = ''' + FormatDateTime('mm/dd/yyyy', ARow.Columns[1].AsDate) + '''');
   end else if Importa.DestTable = 'PRVORDCL'   then begin
      QDel.SQL.Add('    TIPODOCUMENTO = ''' + ARow.Columns[0].AsString + '''');
      QDel.SQL.Add('AND REGISTRO = ''' + ARow.Columns[1].AsString + '''');
      QDel.SQL.Add('AND NUMORDPREV = ' + ARow.Columns[2].AsString);
      QDel.SQL.Add('AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', ARow.Columns[3].AsDate) + '''');
   end else if Importa.DestTable = 'RIGHIPRV'   then begin
      // Esegue la query che elimina tutti i righi del documento corrente
      if (LocTipoDoc <> ARow.Columns[0].AsString) or (LocRegistro <> ARow.Columns[1].AsString) or (LocNumDoc <> ARow.Columns[2].AsInteger) or (LocDataDoc <> ARow.Columns[3].AsDate) then begin
         // Aggiorna le variabili temporanee che mantengono il riferimento al documento corrente
         LocTipoDoc     := ARow.Columns[0].AsString;
         LocRegistro    := ARow.Columns[1].AsString;
         LocNumDoc      := ARow.Columns[2].AsInteger;
         LocDataDoc     := ARow.Columns[3].AsDate;
         // IMposta la query
         QDel.SQL.Add('    TIPODOCUMENTO = ''' + ARow.Columns[0].AsString + '''');
         QDel.SQL.Add('AND REGISTRO = ''' + ARow.Columns[1].AsString + '''');
         QDel.SQL.Add('AND NUMORDPREV = ' + ARow.Columns[2].AsString);
         QDel.SQL.Add('AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', ARow.Columns[3].AsDate) + '''');
      end;
   end else if Importa.DestTable = 'SUBSOGG'    then begin
      QDel.SQL.Add('CODICE = ' + ARow.Columns[0].AsString);
   end;
   // Esegue la query (NB: Solo se lo statement ha più di una riga, altrimenti significa che la query è vuota e quindi non la esegue)
   if QDel.SQL.Count > 1 then QDel.ExecSQL;
end;

procedure TSynchroForm.ImportaDati;
var
   SearchRec:TSearchRec;
begin
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Ricerca files di sincronizzazione');
   // Cicla per tutti i files di sincronizzazione presenti nella cartella di Download (*.SNC)
   if FindFirst(DM1.DownloadDir + '*.SNC', faAnyFile, SearchRec) = 0 then begin
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Avvio sincronizzazione file: ' + SearchRec.Name);
      // Importa il file di sincronizzazione corrente - NB: Importa solo file generati da altre stazioni (Controlla i primi 4 caratteri del nome file che contengono il codice chiave)
      if DM1.StrLeft(SearchRec.Name, 4) <> DM1.CodiceUtente then  ImportaFileSincronizzazione(SearchRec.Name);
      // Cicla finchè vi sono files di sincronizzazione da elaborare
      while (FindNext(SearchRec) = 0) do begin
         // Aggiorna lo schermo
         DM1.ShowWait(TitoloMessaggio, 'Avvio sincronizzazione file: ' + SearchRec.Name);
         // Importa il file di sincronizzazione corrente - NB: Importa solo file generati da altre stazioni (Controlla i primi 4 caratteri del nome file che contengono il codice chiave)
         if DM1.StrLeft(SearchRec.Name, 4) <> DM1.CodiceUtente then  ImportaFileSincronizzazione(SearchRec.Name);
      end;
      FindClose(SearchRec);
   // Se non ci sono files di sincronizzazione da importare visualizza un messaggio sullo schermo
   end else begin
      MessageBeep(0);
      MessageDlg('Non ci sono files di sincronizzazione da elaborare.', mtInformation, [mbOk], 0);
   end;
end;



procedure TSynchroForm.ImportaDatiAggiornamentoListinoLUL(NomeFileAgg:String; R1,R2,R3,R4:Integer);
var
   i:Integer;
begin
   // Controlla che il file di aggiornamento sia presente, altrimenti solleva una eccezione
   if not FileExists(DM1.DownloadDir + NomeFileAgg) then raise Exception.Create('File di aggiornamento listino (LUL) non trovato.'#13#13'L''operazione è stata interrotta.');

   // ==========================================================================
   // Decompressione del file di aggiornamento
   // --------------------------------------------------------------------------
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Apertura archivio compresso.');
   // Apre l'archivio del backup da decomprimere
   ZLB1.OpenArchive(DM1.DownloadDir + NomeFileAgg);
   try
     // Estrazione dei file contenuti
     DM1.ShowWait(TitoloMessaggio, 'Decompressione ARTICOLI.');
     ZLB1.ExtractFileByName(DM1.CartellaTmp, 'LUL_ARTICOLI.CSV');
     DM1.ShowWait(TitoloMessaggio, 'Decompressione GRUPPI.');
     ZLB1.ExtractFileByName(DM1.CartellaTmp, 'LUL_GRUPPI.CSV');
     DM1.ShowWait(TitoloMessaggio, 'Decompressione DIBATESTATE.');
     ZLB1.ExtractFileByName(DM1.CartellaTmp, 'LUL_DIBATESTATE.CSV');
     DM1.ShowWait(TitoloMessaggio, 'Decompressione DIBARIGHI.');
     ZLB1.ExtractFileByName(DM1.CartellaTmp, 'LUL_DIBARIGHI.CSV');
     // Estrazione dei filtri di importazione.
     DM1.ShowWait(TitoloMessaggio, 'Decompressione filtro ARTICOLI.');
     ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'LUL_FILTRO_ARTICOLI.imp');
     DM1.ShowWait(TitoloMessaggio, 'Decompressione filtro Gruppi.');
     ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'LUL_FILTRO_GRUPPI.imp');
     DM1.ShowWait(TitoloMessaggio, 'Decompressione filtro DIBATESTATE.');
     ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'LUL_FILTRO_DIBATESTATE.imp');
     DM1.ShowWait(TitoloMessaggio, 'Decompressione filtro DIBARIGHI.');
     ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'LUL_FILTRO_DIBARIGHI.imp');
   finally
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Chiusura archivio compresso.');
      // Chiude l'archivio compresso
      ZLB1.CloseArchive;
   end;
   // ==========================================================================

   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Preparazione all''importazione automatica dell''aggiornamento del listino.');

   // Ora crea e visualizza la form di importatione archivi
   if ImportazioneForm <> nil then raise Exception.Create('Errore durante la creazione della form di importazione.'#13#13'L''operazione è stata interrotta.');
   Application.CreateForm(TImportazioneForm, ImportazioneForm);
   try try
      // Visualizza la form
      ImportazioneForm.FormStyle := fsStayOnTop;
      ImportazioneForm.Show;
      // Imposta la modalità Silent
      ImportazioneForm.SilentMode := True;

      // =======================================================================
      // IMPORTAZIONE ARTICOLI
      // -----------------------------------------------------------------------
      // Carica automaticamente il nome del filtro da utilizzare
      ImportazioneForm.ComboTipoImportazione.Text := 'LUL_FILTRO_ARTICOLI';
      ImportazioneForm.ComboTipoImportazioneChange(ImportazioneForm.ComboTipoImportazione);
      ImportazioneForm.ComboTipoImportazione.Enabled := False;
      // Imposta il nome del file da importare
      ImportazioneForm.FileNameEdit.Text := DM1.CartellaTmp + 'LUL_ARTICOLI.CSV';
      ImportazioneForm.FilenameEdit.Enabled := False;
      // Avvia l'importazione
      ImportazioneForm.ButtonAvvia.Enabled := True;
      ImportazioneForm.ButtonAvviaClick(ImportazioneForm.ButtonAvvia);
      // Ricalcola i listini alla fine dell'aggiornamento automatico del listino in modalità CSV
      //  NB: L'ho messo quì così anche se arriva un errore almeno mi ricalcola i prezzi degli articoli
      //       aggiornati fino all'errore (almeno spero) senza casini
      DM1.EseguiQueryCalcolaListini;
      // =======================================================================

      // =======================================================================
      // IMPORTAZIONE GRUPPI
      // -----------------------------------------------------------------------
      // Carica automaticamente il nome del filtro da utilizzare
      ImportazioneForm.ComboTipoImportazione.Text := 'LUL_FILTRO_GRUPPI';
      ImportazioneForm.ComboTipoImportazioneChange(ImportazioneForm.ComboTipoImportazione);
      ImportazioneForm.ComboTipoImportazione.Enabled := False;
      // Imposta il nome del file da importare
      ImportazioneForm.FileNameEdit.Text := DM1.CartellaTmp + 'LUL_GRUPPI.CSV';
      ImportazioneForm.FilenameEdit.Enabled := False;
      // Avvia l'importazione
      ImportazioneForm.ButtonAvvia.Enabled := True;
      ImportazioneForm.ButtonAvviaClick(ImportazioneForm.ButtonAvvia);
      // =======================================================================

      // =======================================================================
      // IMPORTAZIONE DIBATESTATE
      // -----------------------------------------------------------------------
      // Carica automaticamente il nome del filtro da utilizzare
      ImportazioneForm.ComboTipoImportazione.Text := 'LUL_FILTRO_DIBATESTATE';
      ImportazioneForm.ComboTipoImportazioneChange(ImportazioneForm.ComboTipoImportazione);
      ImportazioneForm.ComboTipoImportazione.Enabled := False;
      // Imposta il nome del file da importare
      ImportazioneForm.FileNameEdit.Text := DM1.CartellaTmp + 'LUL_DIBATESTATE.CSV';
      ImportazioneForm.FilenameEdit.Enabled := False;
      // Avvia l'importazione
      ImportazioneForm.ButtonAvvia.Enabled := True;
      ImportazioneForm.ButtonAvviaClick(ImportazioneForm.ButtonAvvia);
      // =======================================================================

      // =======================================================================
      // IMPORTAZIONE DIBARIGHI
      // -----------------------------------------------------------------------
      // Carica automaticamente il nome del filtro da utilizzare
      ImportazioneForm.ComboTipoImportazione.Text := 'LUL_FILTRO_DIBARIGHI';
      ImportazioneForm.ComboTipoImportazioneChange(ImportazioneForm.ComboTipoImportazione);
      ImportazioneForm.ComboTipoImportazione.Enabled := False;
      // Imposta il nome del file da importare
      ImportazioneForm.FileNameEdit.Text := DM1.CartellaTmp + 'LUL_DIBARIGHI.CSV';
      ImportazioneForm.FilenameEdit.Enabled := False;
      // Avvia l'importazione
      ImportazioneForm.ButtonAvvia.Enabled := True;
      ImportazioneForm.ButtonAvviaClick(ImportazioneForm.ButtonAvvia);
      // =======================================================================

      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Elimina file di aggiornamento listino.');
      // Dopo averlo importato, elimina il file di sincronizzazione dalla cartella DOwnload
      DM1.EliminaFile(DM1.DownloadDir + NomeFileAgg);
   finally
      // Distrugge la form importazione
      ImportazioneForm.Close;
   end;
   except
      // Ricalcola i listini alla fine dell'aggiornamento automatico del listino in modalità CSV
      //  NB: L'ho messo quì così anche se arriva un errore almeno mi ricalcola i prezzi degli articoli
      //       aggiornati fino all'errore (almeno spero) senza casini
      DM1.EseguiQueryCalcolaListini;
      // Distrugge la form importazione
      ImportazioneForm.Close;
   end;
end;

procedure TSynchroForm.ImportaDatiAggiornamentoListinoCSV(NomeFileAgg,NomeFileImp:String; R1,R2,R3,R4:Integer);
var
   i:Integer;
   NomeFileAggExe:String;
begin
   // Controlla che il file di aggiornamento sia presente, altrimenti solleva una eccezione
   if not FileExists(DM1.DownloadDir + NomeFileAgg) then raise Exception.Create('File di aggiornamento listino (CSV) non trovato.'#13#13'L''operazione è stata interrotta.');
   // Costruisce su questa variabile il nome del file come eseguibile da lanciare
   NomeFileAggExe := ChangeFileExt((DM1.DownloadDir + NomeFileAgg), '.EXE');

   // Rinomina il file compresso di aggiornamento appena scaricato cambiandone l'estensione da SNC a EXE altrimenti
   //  non viene eseguito.
   if not RenameFile((DM1.DownloadDir + NomeFileAgg), NomeFileAggExe) then raise Exception.Create('Non è stato possibile rinominare il file di aggiornamento del listino.'#13#13'L''operazione è stata interrotta.');

   // Avvia l'autoscompattante del file di aggiornamento che si scompatterà nella cartella temporanea di Levante
   DM1.WinExecAndWait32(NomeFileAggExe, SW_SHOW);
   // Fà in modo che venga aggiornato subito lo schermo per evitare che rimangano zone di schermo non a posto
   Update;
   Application.ProcessMessages;

   // Ora crea e visualizza la form di importatione archivi
   DM1.ImportaFileListinoArticoli(DM1.CartellaTmp+NomeFileAgg, NomeFileImp, True, R1, R2, R3, R4);
{
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Preparazione all''importazione automatica dell''aggiornamento del listino.');

   // Ora crea e visualizza la form di importatione archivi
   if ImportazioneForm <> nil then raise Exception.Create('Errore durante la creazione della form di importazione.'#13#13'L''operazione è stata interrotta.');
   Application.CreateForm(TImportazioneForm, ImportazioneForm);
   try try
      // Visualizza la form
      ImportazioneForm.FormStyle := fsStayOnTop;
      ImportazioneForm.Show;
      // Imposta la modalità Silent
      ImportazioneForm.SilentMode := True;
      // Carica automaticamente il nome del filtro da utilizzare
      ImportazioneForm.ComboTipoImportazione.Text := NomeFileImp;
      ImportazioneForm.ComboTipoImportazioneChange(ImportazioneForm.ComboTipoImportazione);
      ImportazioneForm.ComboTipoImportazione.Enabled := False;
      // Imposta il nome del file da importare
      ImportazioneForm.FileNameEdit1.Text := DM1.CartellaTmp + NomeFileAgg;
      ImportazioneForm.FilenameEdit1.Enabled := False;
      // Avvia l'importazione
      ImportazioneForm.ButtonAvvia.Enabled := True;
      ImportazioneForm.ButtonAvviaClick(ImportazioneForm.ButtonAvvia);
      // Ricalcola i listini alla fine dell'aggiornamento automatico del listino in modalità CSV
      //  NB: L'ho messo quì così anche se arriva un errore almeno mi ricalcola i prezzi degli articoli
      //       aggiornati fino all'errore (almeno spero) senza casini
      ImportazioneForm.EseguiQueryCalcolaListini(R1, R2, R3, R4);
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Elimina file di aggiornamento listino.');
      // Dopo averlo importato, elimina il file di sincronizzazione dalla cartella DOwnload
      DM1.EliminaFile(NomeFileAggExe);
   finally
      // Distrugge la form importazione
      ImportazioneForm.Close;
   end;
   except
      // Ricalcola i listini alla fine dell'aggiornamento automatico del listino in modalità CSV
      //  NB: L'ho messo quì così anche se arriva un errore almeno mi ricalcola i prezzi degli articoli
      //       aggiornati fino all'errore (almeno spero) senza casini
      ImportazioneForm.EseguiQueryCalcolaListini(R1, R2, R3, R4);
      // Distrugge la form importazione
      ImportazioneForm.Close;
   end;
}
end;



procedure TSynchroForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TSynchroForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   if LivelloAttivo <= 1 then begin
      Close;
   end else begin
      Dec(LivelloAttivo);
      RefreshScreen;
   end;
end;

procedure TSynchroForm.AvantiMezzoClick(Sender: TObject);
begin
   // Incrementa il livello attivo
   Inc(LivelloAttivo);
   // Aggiorna lo schermo
   RefreshScreen;
end;

procedure TSynchroForm.SiCopiaClick(Sender: TObject);
var
   MR : TModalResult;
begin
   // Invia il messaggio di richiesta di esecuzione del backup al Guardian
   MR := SendBackupRequest;
   if MR = mrOk then NoCopiaClick(Self);
end;

procedure TSynchroForm.AnnullaClick(Sender: TObject);
begin
   Close;
end;

procedure TSynchroForm.IniziaFatturazioneClick(Sender: TObject);
begin
   DM1.Attendere;
   // IMposta il titolo dei messaggi a video durante l'operazione
   TitoloMessaggio := 'Sincronizzazione';
   // Aggiorna lo schermo
   DM1.ShowWait(TitoloMessaggio, 'Inizio sincronizzazione');
   // Salva i parametri utilizzati
   SalvaParametri;
   try
      // IN base al mezzo e se si è selezionato di importare o esportare i dati, agisce di conseguenza.
      // A MEZZO DISCO
      if MezzoDisco.Checked then begin
         // Importa
         if Importare.Checked then begin
            // Se si è selezionata la sincronizzazione attraverso un disco individua i files *.SNC presenti sul
            //  disco e li copia nella cartella Download
            if MezzoDisco.Checked then CopiaFileSNCInCartellaDownload;
            // Avvia l'importazione dei dati
            ImportaDati;
         // Esporta
         end else if Esportare.Checked then begin
            // Se si è selezionata la sincronizzazione attraverso un disco elimina i files *.SNC eventualmente contenuti
            //  nella cartella Upload
            if MezzoDisco.Checked then SvuotaUpload;
            // Avvia l'esportazione dei dati
            EsportaDati;
         end;
      // A MEZZO INTERNET
      end else if MezzoInternet.Checked then begin
         // NON ANCORA FATTO
      end;
   finally
      DM1.ChiudiAttendere;
      // CHiude la form dei messaggi
      DM1.CloseWait;
      // FAtturazione terminata
      MessageBeep(0);
      MessageDlg('SINCRONIZZAZIONE TERMINATA!'#13#13'Cliccare su OK.', mtInformation, [mbOk], 0);
      Close;
   end;
end;

procedure TSynchroForm.SBAvviaAggiornaListinoClick(Sender: TObject);
begin
   // IN base alla modalità della form richiama la procedura corretta
   case FormMode of
      // MOdalità di aggiornamento automatico listini
      SYNCHRO_MODE_AGGLIST: AggiornaListino;
      // Modalità di importazione degli archivi di base
      SYNCHRO_MODE_ARCBASE: ImportaArcBase;
      // Modalità di importazione degli archivi di base SILENT
      SYNCHRO_MODE_ARCBASE_SILENT: ImportaArcBase;
   end;
end;


procedure TSynchroForm.AggiornaListino;
var
   SL: TMemIniFile;
   NomeFileImp : String;   // Nome del filtro di importazione da utilizzare per l'aggiornamento automatico del listino
                           //  nella modalità di importazione da file CSV (NO Sincronizzazione).
   FileToDownload : String; // Nome del file da scaricare dal server
begin
   DM1.Attendere;
   // IMpostazione del titolo messaggio
   TitoloMessaggio := 'Aggiornamento automatico articoli';
   // Apre il file AggList.ini
   SL := TMemIniFile.Create(DM1.CurrDir + 'AggList.ini');
   try
      // Carica l'eventuale nome del file di importazione da utilizzare per l'importazione del listino
      //  in caso di modalità di aggirnamento listino automatico da file di testo CSV (NO Sincronizzazione)
      //  NB: Se questo nome è '' l'importazione si intente con la modalità della sincronizzazione altrimenti
      //       con la modalità di importazione diretta da file CSV (Testo).
      NomeFileImp := SL.ReadString('LISTINO1', 'FiltroImportazione', '');
      // Carica su questa variabile il nome del file da scaricare dal server completo di estensione e percorso
      FileToDownload := SL.ReadString('LISTINO1', 'FileToDownLoad', '') + '.SNC';
      // Aggiorna i ricarichi nei parametri e progressivi
      DM1.TableProgressivi.Edit;
      try try
        if Trim(Ricarico1.Text) = '' then Ricarico1.Text := '0';
        if Trim(Ricarico2.Text) = '' then Ricarico2.Text := '0';
        if Trim(Ricarico3.Text) = '' then Ricarico3.Text := '0';
        if Trim(Ricarico4.Text) = '' then Ricarico4.Text := '0';
        DM1.TableProgressiviRICARICOLISTINO1.Value := StrToFloat(Ricarico1.Text);
        DM1.TableProgressiviRICARICOLISTINO2.Value := StrToFloat(Ricarico2.Text);
        DM1.TableProgressiviRICARICOLISTINO3.Value := StrToFloat(Ricarico3.Text);
        DM1.TableProgressiviRICARICOLISTINO4.Value := StrToFloat(Ricarico4.Text);
      except
        DM1.TableProgressivi.Cancel;
      end;
      finally
        DM1.TableProgressivi.Post;
      end;
      // Nel caso esista già provvede ad eliminare il file con lo stesso nome del file di cui
      //  fare il download, altrimenti non lo sovrascrive.
      if FileExists(DM1.DownloadDir + FileToDownload) then if not DeleteFile(DM1.DownloadDir + FileToDownload) then raise Exception.Create('Il file esiste già e non è stato possibile sovrascriverlo.'#13#13'L''operazione è stata interrotta.');
      // Avvia lo scaricamento del listino aggiornato attraverso O.R.A.
      DM1.WinExecAndWait32('c:\programmi\dcom\ora\ServiceDialer.exe /SL:' + SL.ReadString('LISTINO1', 'FileToDownLoad', '') + ',' + SL.ReadString('LISTINO1', 'OnScreenMessage', ''), SW_SHOW);
      // Fà in modo che venga aggiornato subito lo schermo, altrimenti rimaneva un riquadro bianco dove c'era l'ORA
      //  fino alla fine dell'operazione.
      Update;
      Application.ProcessMessages;
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Avvio importazione listino...');
      // Avvia l'importazione dei dati in base al tipo di importazione...
      if NomeFileImp <> '' then begin
         // Se è specificato un filtro di importazione significa che si è in modalità
         //  di aggiornamento automcatico listino utilizzando l'importazione diretta da file CSV quindi
         //  il file appena ricevuto contiene un file di testo delimitato o FixedWidth e quindi avvia
         //  l'importazione del listino appena ricevuto in questa modalità
         //  NB: Se il NomeFileImp = 'LUL' significa che il file che si stà importando
         //       è stato creato dal programma di esportazione automatica del listino direttamente da Levante.
         //       LUL = "Levante Upload Listino"
         if NomeFileImp = 'LUL' then begin
           ImportaDatiAggiornamentoListinoLUL(FileToDownload, StrToInt(Ricarico1.Text), StrToInt(Ricarico2.Text), StrToInt(Ricarico3.Text), StrToInt(Ricarico4.Text));
         end else begin
           ImportaDatiAggiornamentoListinoCSV(FileToDownload, NomeFileImp, StrToInt(Ricarico1.Text), StrToInt(Ricarico2.Text), StrToInt(Ricarico3.Text), StrToInt(Ricarico4.Text));
         end;
      end else begin
         // Se non è specificato alcun nome di filtro di importazione significa che si è in modalità
         //  di aggiornamento automcatico listino utilizzando il motore di sincronizzazione e quindi avvia
         //  l'importazione del listino appena ricevuto in questa modalità
         ImportaDati;
      end;
   finally
      SL.Free;
      DM1.ChiudiAttendere;
      // CHiude la form dei messaggi
      DM1.CloseWait;
      // A operazione terminata visualizza un messaggio ed esce dall'aplicazione
      DM1.Messaggi(TitoloMessaggio, 'Operazione terminata.'#13#13#13'Ora il programma si chiuderà automaticamente.', '', [mbOk], 0, nil);
      Application.Terminate;
   end;
end;



procedure TSynchroForm.ImportaArcBase;
var
   ArcBaseFile:String;
   Qry:TIB_Cursor;
begin
   DM1.Attendere;
   // IMposta il titolo dei messaggi a video durante l'operazione
   TitoloMessaggio := 'Precaricamento archivi di base';
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   try
      // Aggiorna lo schermo
      DM1.ShowWait(TitoloMessaggio, 'Ricerca file *.SNC');
      // Carica nella variabile il nome del file di importazione degli archivi di base più recente
      ArcBaseFile := DM1.ArcBaseTrovaUltimaVersione;
      // Se non trova il nome della versione più recente del file di precaricamento degli archivi di base...
      if ArcBaseFile <> '' then begin
         // Copia il file nella cartella DownLoad
         DM1.CopiaFile(DM1.ArcBaseDir+ArcBaseFile, DM1.DownloadDir+ArcBaseFile);
         // Aggiorna lo schermo
         DM1.ShowWait(TitoloMessaggio, 'Avvio importazione Archivi Base.');
         // Avvia l'importazione dei dati
         ImportaDati;
         // Aggiorna il marcatore della versione correntemente utilizzata dagli archivi dell'azienda
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         Qry.SQL.Add('UPDATE PROGRESS SET VERSIONEARCBASE = ' + DM1.StrLeft(ArcBaseFile,3));
         Qry.ExecSQL;
      end else begin
         // Se non ci sono files da importare visualizza un messaggio
         MessageBeep(0);
         MessageDlg('File ARCBASE non trovato!', mtError, [mbOk], 0);
      end;
   finally
      Qry.Free;
      DM1.ChiudiAttendere;
      // CHiude la form dei messaggi
      DM1.CloseWait;
      // Operazione completata
      if FormMode <> SYNCHRO_MODE_ARCBASE_SILENT then begin
         MessageBeep(0);
         MessageDlg('IMPORTAZIONE ARCHIVI BASE TERMINATA!'#13#13'Cliccare su OK.', mtInformation, [mbOk], 0);
      end;
      // Chiude la form
      Close;
   end;
end;

procedure TSynchroForm.NoCopiaClick(Sender: TObject);
begin
   // Incrementa il livello attivo
   Inc(LivelloAttivo);
   // Aggiorna lo schermo
   RefreshScreen;
   // Carica gli ultimi parametri usati
   CaricaParametri;
end;

procedure TSynchroForm.MezzoInternetEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlEnter(Sender);
end;

procedure TSynchroForm.MezzoInternetExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlExit(Sender);
end;

end.
