unit FormSostArt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bmpPanel, ComCtrls, StdCtrls, MAURI_SB, Buttons,
  ExtCtrls, IB_Components;

const
    MODO_TUTTI        = 1;
    MODO_SELEZIONATI  = 2;
    MODO_DOCUMENTO    = 3;

type
  TSostArtForm = class(TForm)
    ClientArea: TPanel;
    PanelArticoloDaSostituire: TPanel;
    LabelArticoloDaSostituire: TLabel;
    RichEdit1: TRichEdit;
    Panel7: TPanel;
    AvantiArticoloDaSostituire: TSpeedButton;
    PanelArticoloSostituto: TPanel;
    LabelArticoloSostituto: TLabel;
    RichEdit2: TRichEdit;
    Panel8: TPanel;
    AvantiArticoloSostituto: TSpeedButton;
    PanelFine: TPanel;
    LabelFine: TLabel;
    RichEdit5: TRichEdit;
    Panel12: TPanel;
    IniziaSostituzioneArticolo: TSpeedButton;
    Panel11: TPanel;
    Annulla: TSpeedButton;
    PanelSicurezza: TPanel;
    RichEdit6: TRichEdit;
    Panel13: TPanel;
    SiCopia: TSpeedButton;
    Panel14: TPanel;
    NoCopia: TSpeedButton;
    ClientTopPanel: TbmpPanel;
    TECodiceArticoloDaSostituire: TEdit;
    TEDescrizioneArticoloDaSostituire: TEdit;
    BitBtnSubSogg: TSpeedButtonRollOver;
    Label1: TLabel;
    TECodiceArticoloSostituto: TEdit;
    TEDescrizioneArticoloSostituto: TEdit;
    SpeedButtonRollOver1: TSpeedButtonRollOver;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RefreshScreen;
    procedure TECodiceArticoloDaSostituireEnter(Sender: TObject);
    procedure NoCopiaClick(Sender: TObject);
    procedure SiCopiaClick(Sender: TObject);
    procedure AvantiArticoloDaSostituireClick(Sender: TObject);
    procedure AnnullaClick(Sender: TObject);
    procedure BitBtnSubSoggClick(Sender: TObject);
    procedure SpeedButtonRollOver1Click(Sender: TObject);
    procedure TECodiceArticoloDaSostituireExit(Sender: TObject);
    procedure AvantiArticoloSostitutoClick(Sender: TObject);
    procedure IniziaSostituzioneArticoloClick(Sender: TObject);
    procedure SostituzioneArticolo(CodDaSostituire, CodSostituto:String; SoloSelezionati:Boolean);
  private
    { Private declarations }
    // Contiene l'indicazione del livello attivo al momento
    LivelloAttivo:Shortint;
  public
    { Public declarations }
    // Flag che indica in che modalità dovrà operare la form
    //    1 = MOdalità di sostituzione del sottoarticolo in tutti gli articoli che lo contengono
    //    2 = Sostituzione del sottoarticolo solo negli articoli selezionati
    //    3 = Sostituzione dell'articolo all'interno di un documento
    Modalita:Byte;
  end;

var
  SostArtForm: TSostArtForm;

implementation

uses main, DataModule1, FormBackup, SchedaArticoli1, SchedaClienti;

{$R *.dfm}


procedure TSostArtForm.SostituzioneArticolo(CodDaSostituire, CodSostituto:String; SoloSelezionati:Boolean);
var
   Qry:TIB_Cursor;
   i, SelCount:Integer;
   orStr:String;
begin
   // SelCount contiene il numero di articoli selezionati
   SelCount := ClientiForm.tvArt.Controller.SelectedRecordCount;
   // Prima di tutto controlla che l'utente abbia selezionato almeno un record
   //  se il parametro SoloSlezionati = True.
   if SoloSelezionati and (SelCount = 0) then begin
      DM1.Messaggi('Sostituzione articolo', 'Nessun articolo selezionato.', '', [mbOK], 0, nil);
      Exit;
   end;
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   DM1.ShowWait('Sostituzione articolo', 'Sostituzione dell''articolo ''' + CodDaSostituire + ''' in corso.');
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('UPDATE DIBARIGHI SET CODICEARTICOLO = ''' + CodSostituto + ''' WHERE CODICEARTICOLO = ''' + CodDaSostituire + '''');
      // Se il parametro 'SoloSelezionati' = True aggiunge le condizioni affinchè la sostituzione avvenga solo per gli articoli
      //  slezionati nell'elenco degli articoli
      if SoloSelezionati and (SelCount > 0) then begin
         Qry.SQL.Add('AND (');
         // Inizializza questa variabile in modo che al primo passaggio non metta l'OR
         orStr := '';
         // Cicla per tutti i righi selezionati per inserire i codici nelle condizioni
         for i := 0 to SelCount -1 do begin
            // Inserisce il codice dell'articolo nella lista delle condizioni
            Qry.SQL.Add(orStr + 'TIPODOCUMENTO = ''' + ClientiForm.tvArt.DataController.Values[i,ClientiForm.tvArtCODICEARTICOLO.Index] + '''');
            // Nei passaggi successivi invece deve mettere l'OR
            orStr := 'OR ';
         end;
         // Chiude la parentesi
         Qry.SQL.Add(')');
      end;
      // Esegue la query
      Qry.ExecSQL;
   finally
      Qry.Free;
      DM1.CloseWait;
      // Visualizza il messaggio di fine operazione
      if DM1.Messaggi('Sostituzione articolo',
      'Operazione terminata.'#13#13#13'Si desidera sostituire un altro articolo?',
      '', [mbYes,mbNo], 0, nil) = mrYes then begin
         // Riazzera il tutto per iniziare una nuova sostituzione
         TECodiceArticoloDaSostituire.Text      := '';
         TEDescrizioneArticoloDaSostituire.Text := '';
         TECodiceArticoloSostituto.Text         := '';
         TEDescrizioneArticoloSostituto.Text    := '';
         LivelloAttivo := 1;
         RefreshScreen;
      end else begin
         // Chiude tutto
         Close;
      end;
   end;
end;



procedure TSostArtForm.RefreshScreen;
begin
   // In base al livello attivo aggiorna lo schermo in modo appropriato
   // =================================================================
   case LivelloAttivo of
      // LIVELLO0
      0: begin
         MessageBeep(0);
         PanelSicurezza.Top := 40;
         PanelSicurezza.Visible := True;
         DM1.SetPanelState(0, PanelArticoloDaSostituire, LabelArticoloDaSostituire, LivelloAttivo);
         DM1.SetPanelState(0, PanelArticoloSostituto, LabelArticoloSostituto, LivelloAttivo);
         DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
      end;
      // LIVELLO1
      1: begin
         PanelSicurezza.Visible := False;
         DM1.SetPanelState(2, PanelArticoloDaSostituire, LabelArticoloDaSostituire, LivelloAttivo);
         DM1.SetPanelState(0, PanelArticoloSostituto, LabelArticoloSostituto, LivelloAttivo);
         DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
         TECodiceArticoloDaSostituire.SetFocus;
      end;
      // LIVELLO2
      2: begin
         PanelSicurezza.Visible := False;
         DM1.SetPanelState(1, PanelArticoloDaSostituire, LabelArticoloDaSostituire, LivelloAttivo);
         DM1.SetPanelState(2, PanelArticoloSostituto, LabelArticoloSostituto, LivelloAttivo);
         DM1.SetPanelState(0, PanelFine, LabelFine, LivelloAttivo);
         TECodiceArticoloSostituto.SetFocus;
      end;
      // LIVELLO3
      3: begin
         PanelSicurezza.Visible := False;
         DM1.SetPanelState(1, PanelArticoloDaSostituire, LabelArticoloDaSostituire, LivelloAttivo);
         DM1.SetPanelState(1, PanelArticoloSostituto, LabelArticoloSostituto, LivelloAttivo);
         DM1.SetPanelState(2, PanelFine, LabelFine, LivelloAttivo);
      end;
   end;
   // Forza il painting della form
   Update;
end;


procedure TSostArtForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
//   MainForm.RipristinaIconaDocTipo;

   // Il pulsante Impostazioni deve tornare NON PREMUTO
//   MainForm.SBUtilita.Down := False;
   // Il puntatore alla form := nil
   SostArtForm := nil;
end;

procedure TSostArtForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(SostArtForm, COLOR_MODIFICA);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Sostituzione articolo)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
//   MainForm.SalvaIconaDocTipo;
//   MainForm.CaricaIconaDocTipo(DT_UTILITA);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TSostArtForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TSostArtForm.FormShow(Sender: TObject);
begin
   // Inizializzazione form
   LivelloAttivo := 0;

   RefreshScreen;
   DM1.FocusRefresh;
end;

procedure TSostArtForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   if LivelloAttivo <= 1 then begin
      Close;
   end else begin
      Dec(LivelloAttivo);
      RefreshScreen;
   end;
end;

procedure TSostArtForm.TECodiceArticoloDaSostituireEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlEnter(Sender);
end;

procedure TSostArtForm.NoCopiaClick(Sender: TObject);
begin
   // Incrementa il livello attivo
   Inc(LivelloAttivo);
   // Aggiorna lo schermo
   RefreshScreen;
end;

procedure TSostArtForm.SiCopiaClick(Sender: TObject);
begin
   // Backup
   Application.CreateForm(TBackupForm, BackupForm);
   BackupForm.ShowModal;
   // Và avanti
   NoCopiaClick(Self);
end;

procedure TSostArtForm.AvantiArticoloDaSostituireClick(Sender: TObject);
begin
   // Prima di permettere di continuare verifica che sia stato inserito un articolo
   if TEDescrizioneArticoloDaSostituire.Text <> '- - -' then begin
      // Incrementa il livello attivo
      Inc(LivelloAttivo);
      // Aggiorna lo schermo
      RefreshScreen;
   end else begin
      DM1.Messaggi('Sostituzione articolo', 'Per continuare è necessario specificare l''articolo da sostituire.', '', [mbOk], 0, nil);
   end;
end;

procedure TSostArtForm.AnnullaClick(Sender: TObject);
begin
   Close;
end;

procedure TSostArtForm.BitBtnSubSoggClick(Sender: TObject);
begin
   DM1.Attendere;

   // Visualizza la form che permette di selezionare l'articolo da inserire
   //  nel documento.
   Application.CreateForm(TArticoliForm, ArticoliForm);
   ArticoliForm.Parent := MainForm;
   ArticoliForm.Tag := 994;       // Abilita la selezione dell'articolo
   ArticoliForm.Show;

   DM1.ChiudiAttendere;
end;

procedure TSostArtForm.SpeedButtonRollOver1Click(Sender: TObject);
begin
   DM1.Attendere;

   // Visualizza la form che permette di selezionare l'articolo da inserire
   //  nel documento.
   Application.CreateForm(TArticoliForm, ArticoliForm);
   ArticoliForm.Parent := MainForm;
   ArticoliForm.Tag := 993;       // Abilita la selezione dell'articolo
   ArticoliForm.Show;

   DM1.ChiudiAttendere;
end;

procedure TSostArtForm.TECodiceArticoloDaSostituireExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlExit(Sender);
end;

procedure TSostArtForm.AvantiArticoloSostitutoClick(Sender: TObject);
begin
   // Prima di permettere di continuare verifica che sia stato inserito un articolo
   if TEDescrizioneArticoloSostituto.Text <> '- - -' then begin
      // Incrementa il livello attivo
      Inc(LivelloAttivo);
      // Aggiorna lo schermo
      RefreshScreen;
   end else begin
      DM1.Messaggi('Sostituzione articolo', 'Per continuare è necessario specificare l''articolo sostituto.', '', [mbOk], 0, nil);
   end;
end;

procedure TSostArtForm.IniziaSostituzioneArticoloClick(Sender: TObject);
begin
   // Chiede conferma all'utente delle intenzioni
   if DM1.Messaggi('Sostituzione articolo',
   'Confermi di voler veramente avviare la sostituzione dell''articolo?',
   'NB: Prima di continuare è CONSIGLIATO effettuare una copia di sicurezza degli archivi per poter riparare ad eventuali errori o malfunzionamenti.',
   [mbYes,mbNo], 0, nil) = mrYes then begin
      // In base alla modalità di apertura della FORM avvia la corretta procedura
      case Modalita of
         MODO_TUTTI:        SostituzioneArticolo(TECodiceArticoloDaSostituire.Text, TECodiceArticoloSostituto.Text, False);
         MODO_SELEZIONATI:  SostituzioneArticolo(TECodiceArticoloDaSostituire.Text, TECodiceArticoloSostituto.Text, True);
//         MODO_DOCUMENTO:
      end;
   end;
end;

end.
