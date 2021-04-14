unit FrameStart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, bmpPanel, Buttons, StdCtrls, MAURI_SB, OleCtrls, SHDocVw, 
  DBCtrls;

Const
  // COstanti per la visualizzazione dei sottopannelli
  SB_LEFT       = 515;
  SB_TOP        = 110;
  SB_WIDTH      = 495;
  SB_HEIGHT     = 455;

type
  TStartFrame = class(TFrame)
    PanelBackGround: TPanel;
    SBottom: TShape;
    SBExit: TSpeedButtonRollOver;
    STop: TShape;
    Logo: TImage;
    LabelExit: TLabel;
    PanelLoginData: TPanel;
    Shape4: TShape;
    Shape3: TShape;
    SpeedButtonRollOver2: TSpeedButtonRollOver;
    Label2: TLabel;
    LabelUID: TLabel;
    LabelPassword: TLabel;
    ButtonAvvio: TSpeedButtonRollOver;
    SpeedButtonRollOver4: TSpeedButtonRollOver;
    Label1: TLabel;
    Panel1: TPanel;
    CBAzienda: TComboBox;
    EditUID: TEdit;
    EditPassword: TEdit;
    PanelMenuOpzioni: TPanel;
    Shape6: TShape;
    Shape1: TShape;
    Shape2: TShape;
    SBCreaAzienda: TSpeedButtonRollOver;
    SBModificaAzienda: TSpeedButtonRollOver;
    SBEliminaAzienda: TSpeedButtonRollOver;
    SBCreaUtente: TSpeedButtonRollOver;
    SBModificaUtente: TSpeedButtonRollOver;
    SBEliminaUtente: TSpeedButtonRollOver;
    SBOpzioniNetwork: TSpeedButtonRollOver;
    LabelModificaAzienda: TLabel;
    LabelEliminaAzienda: TLabel;
    LabelCreaAzienda: TLabel;
    LabelCreaUtente: TLabel;
    LabelModificaUtente: TLabel;
    LabelEliminaUtente: TLabel;
    LabelOpzioniNetwork: TLabel;
    Label3: TLabel;
    SBExitOpzioni: TSpeedButtonRollOver;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    PanelCover: TPanel;
    WebBrowser: TWebBrowser;
    PanelDatiUtenteLevanteLight: TPanel;
    Label14: TLabel;
    SpeedButtonRollOver10: TSpeedButtonRollOver;
    Label7: TLabel;
    Shape7: TShape;
    LabelNomeAzienda: TLabel;
    Label16: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Shape5: TShape;
    Label15: TLabel;
    Label17: TLabel;
    Label11: TLabel;
    SBGridOK: TSpeedButtonRollOver;
    EditRagSoc: TEdit;
    EditPIVA: TEdit;
    EditNomeUtente: TEdit;
    EditPswd: TEdit;
    EditPID: TEdit;
    EditCodiceAttivazione: TEdit;
    procedure ButtonAvvioClick(Sender: TObject);
    procedure SBExitClick(Sender: TObject);
    procedure EditUIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditUIDEnter(Sender: TObject);
    procedure EditUIDExit(Sender: TObject);
    procedure CBAziendaDropDown(Sender: TObject);
    procedure SpeedButtonRollOver4Click(Sender: TObject);
    procedure SBCreaAziendaClick(Sender: TObject);
    procedure SBModificaAziendaClick(Sender: TObject);
    procedure SBEliminaAziendaClick(Sender: TObject);
    procedure SBCreaUtenteClick(Sender: TObject);
    procedure SBModificaUtenteClick(Sender: TObject);
    procedure SBEliminaUtenteClick(Sender: TObject);
    procedure SBOpzioniNetworkClick(Sender: TObject);
    procedure SBExitOpzioniClick(Sender: TObject);
    procedure LabelCreaAziendaMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelMenuOpzioniMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure LabelExitClick(Sender: TObject);
    procedure SBottomMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ShowCover(Show:Boolean);
    procedure FrameResize(Sender: TObject);
    procedure SBGridOKClick(Sender: TObject);
    procedure SpeedButtonRollOver10Click(Sender: TObject);
    procedure WebBrowserNavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
  private
    fAziendeWidth: Integer;
    fAziendeHeight: Integer;
    fAziendeTop: Integer;
    fAziendeLeft: Integer;
    { Private declarations }
    procedure ResizeNormal;
    procedure ResizeMobileRDP;
  public
    { Public declarations }
    procedure PosizionaSottopannelli(F: TForm);
    procedure EntraInAzienda(const AVerificaPassword: Boolean);
  end;

implementation

uses DataModule1, main, SchedaClienti, FormAziende, FormSecurity,
  FormNetDir, FormScambioDoc, System.IniFiles, FormAssistenzeMobileMain;

{$R *.DFM}

procedure TStartFrame.ButtonAvvioClick(Sender: TObject);
begin
  EntraInAzienda(True);
end;

procedure TStartFrame.SBExitClick(Sender: TObject);
begin
   LabelExit.Font.Style := [];
   MainForm.Close;
end;

procedure TStartFrame.EditUIDKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il pulsante Invio...
   if Key = Chr(13) then begin
      ButtonAvvioClick(Self);
      // Altrimenti non so perchè ripassa di qui 2 volte e fà casino
      //  (Ho guardato anche su alcuni Newgroup e sembra essere un bug di Delphi)
      Key := #0;
   end;
end;

procedure TStartFrame.EntraInAzienda(const AVerificaPassword: Boolean);
var
  GoLevante: Boolean;
  LoginUser: String;
begin
     // Se siamo in modalità manutenzioni RDP remote e se non è richiesta la verifica della password
     //  (questo dovrebbe capidare in modalità manutenzioni RDP e solo al primo avvio) usa l'IDOperatoreCOrremte
     //  come utente (in pratica l'ultimo USerName che si è loggato in precedenza) altrimenti usa quello
     //  che l'utente deve aver scritto
     if AVerificaPassword then
       LoginUser := EditUID.Text
     else
       LoginUser := DM1.IDOperatoreCorrente;
     // Se siamo in modalità LevanteLight...
     if MainForm.IsLevanteLight then
       // NB: Se siamo in modalità LevannteLight la verifica del nome utente e password è diversa da quella classica
       GoLevante := MainForm.LevanteSacs_UIDCheck(LoginUser, EditPassword.Text)
     // Se siamoin modalità normale...
     else
       // Controlla il nome utente e password e se sono corretti va avanti, altrimenti no.
       // Va avanti anche se il modulo password non è abilitato.
       GoLevante := DM1.UIDCheck(LoginUser, EditPassword.Text, AVerificaPassword) or (StrToInt(DM1.SKeyData[MOD_PASSWORD]) = 0);

//     // Se siamo in modalità LevanteLight...
//     if MainForm.IsLevanteLight then
//       // NB: Se siamo in modalità LevannteLight la verifica del nome utente e password è diversa da quella classica
//       GoLevante := MainForm.LevanteSacs_UIDCheck(EditUID.Text, EditPassword.Text)
//     else
//     // Se siamo in modalità ModeAssistenzaRDP (mobile) allora entra senza come ultimo utente
//     //  utilizzato in precedenza (no UDICheck)
//     if MainForm.ModoAssistenzeRDP and AEntraSenzaVerificaUtentePassword then
//       GoLevante := True
//     // Se siamoin modalità normale...
//     else
//       // Controlla il nome utente e password e se sono corretti va avanti, altrimenti no.
//       // Va avanti anche se il modulo password non è abilitato.
//       GoLevante := DM1.UIDCheck(EditUID.Text, EditPassword.Text) or (StrToInt(DM1.SKeyData[MOD_PASSWORD]) = 0);

     // Se l'autenticazione ha avuto successo fa avanti, atrimenti visualizza il messaggio di utente non riconosciuto
     if GoLevante then
     begin
        // Fadeout della main form in modo da nascondere il ritracciamento
        MainForm.FormFadeOut(MainForm);
        // L'azienda corrente è quella specificata in CBAzienda
        DM1.AziendaCorrente := CBAzienda.Text;
        // Visualizza vari messaggi (anche i seguito)
        DM1.ShowWait('Levante', 'Connessione al database');
        // Aggiorna la barra di stato con l'azienda corrente e la data attuale
        MainForm.LabelDataOdierna.Caption := DateToStr(Date);
        MainForm.LabelAziendaCorrente.Caption := DM1.AziendaCorrente;
        MainForm.LabelOperatoreCorrente.Caption := DM1.IDOperatoreCorrente;
        // Attiva il Database e le tabelle dell'azienda
        DM1.AttivaTabelle(False, False);
        // Pone come CodiceUtente l'ID che ho aggiunto appositamente
        //  alla tabella security per fare in modo di risolvere il problema
        //  che senza chiavetta di protezione la bacheca era diventata comune
        //  tra tutti gli utenti perchè non c'era più il codice della chiavetta
        if LEVARCO_MODE and not MainForm.ModoAssistenzeRDP then
          DM1.SetCodiceUtenteBySecurityIdOrByParams;
        // Carica i dati della Manodopera
        DM1.CaricaParametriProgressivi;
        // Copia i codici di attivazione del teletrasporto nel file
        //  Param.ini in modo che siano disponibili anche per
        // il Guardian
        DM1.CopiaCodiciAttivazionePerGuardian;
        // Solo se è il server esegue fax server');
//        DM1.ImpostaFax;
        // Aggiorna la visualizzazione dei documenti esportati
        if not MainForm.ModoAssistenzeRDP then
        begin
          DM1.ShowWait('', 'Caricamento bacheca');
          MainForm.AggiornaDocumentiEsportati;
          DM1.ShowWait('', 'Caricamento bacheca completato');
        end;
{
        // Disattiva la StartPage
        MainForm.CloseStartFrame;
        MainForm.Update;
        Application.ProcessMessages;
        // Crea la ClientiForm e la visualizza
        Application.CreateForm(TClientiForm, ClientiForm);
        ClientiForm.Parent := MainForm;
        ClientiForm.Show;
}



        // Disattiva la StartPage
        LockWindowUpdate(MainForm.Handle);
        try
          // Se siamo in modalità assistenze mobile RDP visualizza subito l'apposita
          //  form con l'elenco degli appuntamenti del tecnico attuale...
          if MainForm.ModoAssistenzeRDP then
          begin
            // Crea la MainForm per la modalità assistenze mobile
            //  NB: Ho messo anche il dimensionamento manuale della form
            //       in base allo schermo perchè così sembra dare meno problemi.
            Application.CreateForm(TAssistenzeMobileMainForm, AssistenzeMobileMainForm);
            AssistenzeMobileMainForm.Left := 0;
            AssistenzeMobileMainForm.Top := 0;
            AssistenzeMobileMainForm.Width := Screen.Width;
            AssistenzeMobileMainForm.Height := Screen.Height;
            AssistenzeMobileMainForm.WindowState := wsMaximized;
            AssistenzeMobileMainForm.Show;
            DM1.CloseWait;
          end
          // Se invece siamo i modalità normale lancia la SchedaCLienti normale.
          else
          begin
            MainForm.CloseStartFrame;
            // Crea la ClientiForm e la visualizza
            Application.CreateForm(TClientiForm, ClientiForm);
            ClientiForm.Parent := MainForm;
            ClientiForm.Show;
          end;
        finally
          LockWindowUpdate(0);
          // Fadeout della main form in modo da nascondere il ritracciamento
          // NB: Non più necessario da quando la MainForm è a tutta grandezza
          MainForm.FormFadeIn(MainForm);
        end;





        // Se siamo in modalità MagKioskMode attiva subito la vendita al banco
        Application.ProcessMessages;
        if MainForm.MagKioskMode then
          MainForm.GoVenditaAlBanco;

        // Se siamo in modalità LevanteLight avvia la ricerca iniziale sul
        //  teletrasporto.
        //  NB: Verifica anche che ci sia una connessione ad internet disponibile
        if MainForm.IsLevanteLight
        and (DM1.Messaggi('Levante - Teletrasporto', 'Scaricare nuovi documenti?', 'NB: Rispondendo "SI" Levante si collegherà al server e scaricherà tutti gli eventuali nuovi documenti/listini disponibili.', [mbYes,mbNo], 0, nil) = mrYes)
        then begin
          // Verifica se si è connessi ad internet
          if DM1.InternetIsConnected then begin
            // Apre il teletrasporto
            MainForm.ApriTeletrasporto;
            try
              // Avvia l'importazione automatica di tutti i documenti
              ScambioDocForm.LevanteLight_RiceviTuttiDoc;
            finally
              ScambioDocForm.SBChiudiTeletrasportoClick(ScambioDocForm.SBChiudiTeletrasporto);
            end;
          // Se non c'è alcuna connessione internet visualizza un messaggio
          end else begin
            DM1.Messaggi('Levante - Teletrasporto', 'Connessione internet non disponibile.'#13#13'Nessun nuovo documento è stato scaricato.', '', [mbOk], 0, nil);
          end;
        end;
     end
     else
     begin
        EditUID.SetFocus;
     end;
end;

procedure TStartFrame.EditUIDEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlEnter(Sender);
end;

procedure TStartFrame.EditUIDExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlExit(Sender);
end;

procedure TStartFrame.CBAziendaDropDown(Sender: TObject);
begin
   // Carica l'elenco delle aziende
   //  (lo carico anche da quì per avere sempre l'elenco più
   //  aggiornato anche nel caso che qualche altra stazione
   //  abbia aggiunto altre aziende).
   MainForm.CaricaElencoAziende;
end;

procedure TStartFrame.SpeedButtonRollOver4Click(Sender: TObject);
begin
     // Se siamo in modalità Levante Light e il nome utente e password sono corretti
     //  visualizza la form per l'impostazione dei dati dell'utente e poi esce per non
     //  interferire con la modalità normale.
     if MainForm.IsLevanteLight then begin
       if (EditNomeUtente.Text=EditUID.Text) and (EditPswd.Text=EditPassword.Text) then begin
         // imposta il frame dei dati utente levante light
         SpeedButtonRollOver10.Visible       := True;
         SBGridOK.Visible                    := True;
         PanelDatiUtenteLevanteLight.Visible := True;
         EditRagSoc.SetFocus;
       end else begin
         MessageBeep(0);
         MessageDlg('U T E N T E   N O N   R I C O N O S C I U T O   !!!', mtWarning, [mbOk], 0);
       end;
       Exit;
     end;

     // Controlla il nome utente e password e se sono corretti va avanti, altrimenti no.
     // Va avanti anche se il modulo password non è abilitato.
     if (DM1.UIDCheck(EditUID.Text, EditPassword.Text, True))or(StrToInt(DM1.SKeyData[MOD_PASSWORD]) = 0) then begin
        // POsiziona e dimensiona il pannello delle opzioni e lo visualizza
        PanelMenuOpzioni.Color       := COLOR_LOGIN_OPZIONI;
        PanelMenuOPzioni.Visible     := True;
        // In base ai permessi abilita o disabilita i pulsanti per creare/modificare/eliminare le aziende
        if (DM1.ModCtrl(MOD_MULTIAZIENDALE) > 1) and (DM1.IsServer) then begin
           SBCreaAzienda.Enabled     := True;
           SBModificaAzienda.Enabled := True;
           SBEliminaAzienda.Enabled  := True;
           LabelCreaAzienda.Enabled     := True;
           LabelModificaAzienda.Enabled := True;
           LabelEliminaAzienda.Enabled  := True;
        end else begin
           SBCreaAzienda.Enabled     := False;
           SBModificaAzienda.Enabled := False;
           SBEliminaAzienda.Enabled  := False;
           LabelCreaAzienda.Enabled     := False;
           LabelModificaAzienda.Enabled := False;
           LabelEliminaAzienda.Enabled  := False;
        end;
        // In base ai permessi abilita o disabilita i pulsanti per creare/modificare/eliminare gli utenti
        if (DM1.ModCtrl(MOD_PASSWORD) > 1) and (DM1.IsServer) then begin
           SBCreaUtente.Enabled     := True;
           SBModificaUtente.Enabled := True;
           SBEliminaUtente.Enabled  := True;
           LabelCreaUtente.Enabled     := True;
           LabelModificaUtente.Enabled := True;
           LabelEliminaUtente.Enabled  := True;
        end else begin
           SBCreaUtente.Enabled     := False;
           SBModificaUtente.Enabled := False;
           SBEliminaUtente.Enabled  := False;
           LabelCreaUtente.Enabled     := False;
           LabelModificaUtente.Enabled := False;
           LabelEliminaUtente.Enabled  := False;
        end;
     end;
end;

procedure TStartFrame.WebBrowserNavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  LockWindowUpdate(0);
  MainForm.FormFadeIn(MainForm);
end;

procedure TStartFrame.SBCreaAziendaClick(Sender: TObject);
begin
     Application.CreateForm(TAziendeForm, AziendeForm);
     AziendeForm.Parent         := MainForm;
     AziendeForm.Mode           := AZIENDE_NUOVA;
     AziendeForm.Show;
end;

procedure TStartFrame.SBModificaAziendaClick(Sender: TObject);
begin
     Application.CreateForm(TAziendeForm, AziendeForm);
     AziendeForm.Parent         := MainForm;
     AziendeForm.Mode           := AZIENDE_MODIFICA;
     AziendeForm.TitoloGrid.Caption := 'Seleziona l''azienda da modificare...';
     AziendeForm.Show;
end;

procedure TStartFrame.SBEliminaAziendaClick(Sender: TObject);
begin
     Application.CreateForm(TAziendeForm, AziendeForm);
     AziendeForm.Parent         := MainForm;
     AziendeForm.Mode           := AZIENDE_ELIMINA;
     AziendeForm.TitoloGrid.Caption := 'Seleziona l''azienda da eliminare...';
     AziendeForm.Show;
end;

procedure TStartFrame.SBCreaUtenteClick(Sender: TObject);
begin
     Application.CreateForm(TSecurityForm, SecurityForm);
     SecurityForm.Parent := MainForm;
     SecurityForm.Mode   := USERS_NUOVA;
     SecurityForm.Show;
end;

procedure TStartFrame.SBModificaUtenteClick(Sender: TObject);
begin
     Application.CreateForm(TSecurityForm, SecurityForm);
     SecurityForm.Parent := MainForm;
     SecurityForm.Mode   := USERS_MODIFICA;
     SecurityForm.TitoloGrid.Caption := 'Seleziona l''utente da modificare...';
     SecurityForm.Show;
end;

procedure TStartFrame.SBEliminaUtenteClick(Sender: TObject);
begin
     Application.CreateForm(TSecurityForm, SecurityForm);
     SecurityForm.Parent := MainForm;
     SecurityForm.Mode   := USERS_ELIMINA;
     SecurityForm.TitoloGrid.Caption := 'Seleziona l''utente da eliminare...';
     SecurityForm.Show;
end;

procedure TStartFrame.SBOpzioniNetworkClick(Sender: TObject);
begin
     Application.CreateForm(TNetDirForm, NetDirForm);
     NetDirForm.Parent := MainForm;
     NetDirForm.Show;
end;

procedure TStartFrame.SBExitOpzioniClick(Sender: TObject);
begin
   PanelMenuOpzioni.Visible := False;
   // Azzera i campo
   EditUID.Text := '';
   EditPassword.Text := '';
   if EditUID.Enabled then begin
      EditPassword.SetFocus;
      EditUID.SetFocus;
   end else begin
      CBAzienda.SetFocus;
   end;
end;

procedure TStartFrame.LabelCreaAziendaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   // Visualizza la label sotto il mouse sottolineata
   TLabel(Sender).Font.Style := [fsUnderline];
end;

procedure TStartFrame.PanelMenuOpzioniMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   i:Integer;
begin
   // Toglie il sottolineato da tutte la label
   for i := 0 to PanelMenuOpzioni.ControlCount -1 do begin
      if (PanelMenuOpzioni.Controls[i] is TLabel) and (TLabel(PanelMenuOpzioni.Controls[i]).Tag = 1) then TLabel(PanelMenuOpzioni.Controls[i]).Font.Style := [];
   end;
end;

procedure TStartFrame.LabelExitClick(Sender: TObject);
begin
   SBExitClick(Self);
end;

procedure TStartFrame.SBottomMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   LabelExit.Font.Style := [];
end;

procedure TStartFrame.ShowCover(Show:Boolean);
const
  DISABLED_COVER = 'DISABLED';
var
  PIVA, CodiceAttivazione: String;
  LO: TMemIniFile;
  LCoverURL: String;
  LIsEnabled: Boolean;
begin
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // Questa procedure visualizza la cover iniziale
    // NB: LASCIARE STARE LA SEQUENZA DELLE OPERAZIONI ALTRIMENTI FLICKERA
    // --------------------------------------------------------------------------
    // Carcia la URL della pagina cover e se nel parametro trova "DISABLED" fa in modo che non
    //  venga visualizzato nulla
    LCoverURL := Trim(LO.ReadString('Cover', 'URL', ''));
    if LCoverURL = '' then
      LCoverURL := 'http://www.levantesw.it/Levante-Informa.htm';
    LIsEnabled := (UpperCase(LCoverURL) <> DISABLED_COVER) and (not DM1.ModoRistrutturazioneArchivi) and (not MainForm.ModoAssistenzeRDP);
    // Se è stato specificata una precisa pagina web da visualizzare nell'apposito
    //  parametro del layout.ini
//    if Trim(LO.ReadString('Cover', 'URL', 'http://www.levantesw.it/Levante-Informa.htm')) <> '' then
    if (LCoverURL <> '') and LIsEnabled then
    begin
      LockWindowUpdate(MainForm.Handle);
      // ========================================================================
      // Richiama la pagina web di benvenuto
      // ------------------------------------------------------------------------
      WebBrowser.Visible := True;
      // Se siamo connessi ad internet, visualizza la pagina personalizzata per l'utente
      WebBrowser.Navigate(LCoverURL);
      // ========================================================================
      // Rende visibile il pannello
      //  NB: Se lo metto alla fine non và bene
      PanelCover.Visible := True; // Riga commentata per non far apparire il messagio di utente non riconosciuto
      // Posiziona il pannello che contiene il WebBrowser
      PanelCover.Top     := 0;
      PanelCover.Left    := 0;
      PanelCover.Width   := Trunc(ClientWidth / 2);
      PanelCover.Height  := ClientHeight;
      // Posiziona il WebBrowser vero e proprio all'interno del pannello
      WebBrowser.Left    := -2;
      WebBrowser.Top     := -2;
      WebBrowser.Width   := Trunc(ClientWidth / 2) + 4;
      WebBrowser.Height  := ClientHeight + 4;
      if MainForm.IsLevanteLight then begin
        PanelCover.Left  := PanelCover.Left + 10;
        PanelCover.Top   := PanelCover.Top + 15;
        PanelCover.Width := PanelCover.Width - 20;
        WebBrowser.Width := WebBrowser.Width + 20;
      end;
    end
//    // altrimenti se c'è il file cover.mht...
//    else
//    if Show and DirectoryExists(DM1.CoverDir) and FileExists(DM1.CoverDir + 'cover.mht') and LIsEnabled then
//    begin
//      LockWindowUpdate(MainForm.Handle);
//      // ========================================================================
//      // Richiama la pagina web di benvenuto
//      // ------------------------------------------------------------------------
//      WebBrowser.Visible := True;
//      // Se siamo connessi ad internet, visualizza la pagina personalizzata per l'utente
//      WebBrowser.Navigate(DM1.CoverDir + 'cover.mht');
//      // ========================================================================
//      // Rende visibile il pannello
//      //  NB: Se lo metto alla fine non và bene
//      PanelCover.Visible := True; // Riga commentata per non far apparire il messagio di utente non riconosciuto
//      // Posiziona il pannello che contiene il WebBrowser
//      PanelCover.Top     := 0;
//      PanelCover.Left    := 0;
//      PanelCover.Width   := Trunc(ClientWidth / 2);
//      PanelCover.Height  := ClientHeight;
//      // Posiziona il WebBrowser vero e proprio all'interno del pannello
//      WebBrowser.Left    := -2;
//      WebBrowser.Top     := -2;
//      WebBrowser.Width   := Trunc(ClientWidth / 2) + 4;
//      WebBrowser.Height  := ClientHeight + 4;
//      if MainForm.IsLevanteLight then begin
//        PanelCover.Left  := PanelCover.Left + 10;
//        PanelCover.Top   := PanelCover.Top + 15;
//        PanelCover.Width := PanelCover.Width - 20;
//        WebBrowser.Width := WebBrowser.Width + 20;
//      end;
//    end
    // Altrimenti ancora non fa vedere nulla
    else
    begin
      // Se non deve visualizzare il browser lo rende invisibile
      WebBrowser.Visible := False;
      PanelCover.Visible := False;
      // E poi rivisualizza la MainFOrm che nel frattempo era stata resa trasparente
      //  per evitare
      LockWindowUpdate(0);
      MainForm.FormFadeIn(MainForm);
    end;
  finally
    LO.Free;
  end;
end;


procedure TStartFrame.FrameResize(Sender: TObject);
begin
  if MainForm.ModoAssistenzeRDP then
    ResizeMobileRDP
  else
    ResizeNormal;
end;

procedure TStartFrame.PosizionaSottopannelli(F:TForm);
begin
   // Calcola la posizione dell'eventuale form dell'elenco aziende
   fAziendeLeft       := STop.Left + Round((STop.Width - SB_WIDTH) /2);
   fAziendeTop        := Round((ClientHeight - SB_HEIGHT) /2);
   fAziendeWidth      := SB_WIDTH;
   fAziendeHeight     := SB_HEIGHT;
   // Aggiorna la posizione e il dimensionamento delle eventuali form di impostazione
   //  generale aperte
   F.Left   := fAziendeLeft;
   F.Top    := fAziendeTop;
   F.Width  := fAziendeWidth;
   F.Height := fAziendeHeight;
   F.Update;
end;


procedure TStartFrame.ResizeMobileRDP;
begin
   // Dimensionamento pannello fascia blu in alto
   STop.Top          := 0;
   STop.Left         := 0;
   STop.Width        := ClientWidth;
   STop.Height       := 100;
   // Dimensionamento pannello fascia blu in basso
   SBottom.Height    := 110;
   SBottom.Top       := ClientHeight - SBottom.Height;
   SBottom.Left      := 0;
   SBottom.Width     := ClientWidth;
   // Posizionamento del logo di levante in alto
   Logo.Top          := Round(STop.Height/2) - Round(Logo.Height/2);
   Logo.Left         := STop.Left + Round(ClientWidth/2) - Round(Logo.Width/2);
   // POsizionamento del pannello con i dati di login
   // NB: Se siamo in modalità Levante Light effettua alcuni adattamenti
   PanelLoginData.Top   := Round((ClientHeight - PanelLoginData.Height) /2);
   PanelLoginData.Left  := STop.Left + Round((STop.Width - PanelLoginData.Width) /2);
   if MainForm.IsLevanteLight then begin
     Label2.Visible     := False;
     Panel1.Visible     := False;
     LabelUID.Top       := 80;
     EditUID.Top        := 80;
     LabelPassword.Top  := LabelUID.Top + 40;
     EditPassword.Top   := LabelUID.Top + 40;
   end;
   // Posizionamento del pulsante di uscita dal programma
   SBExit.Width         := 35;
   SBExit.Height        := 35;
   SBExit.Top           := SBottom.Top + Round((SBottom.Height - SBExit.Height) /2);
   SBExit.Left          := SBottom.Left + SBottom.Width - SBExit.Width - 20;
   LabelExit.Width      := 140;
   LabelExit.Height     := 24;
   LabelExit.Top        := SBottom.Top + Round((SBottom.Height - LabelExit.Height) /2);
   LabelExit.Left       := SBExit.Left - LabelExit.Width - 10;
end;

procedure TStartFrame.ResizeNormal;
begin
   // Dimensionamento pannello fascia blu in alto
   STop.Top          := 0;
   STop.Left         := Trunc(ClientWidth / 2);
   STop.Width        := Trunc(ClientWidth / 2);
   STop.Height       := 100;
   // Dimensionamento pannello fascia blu in basso
   SBottom.Height    := 110;
   SBottom.Top       := ClientHeight - SBottom.Height;
   SBottom.Left      := Trunc(ClientWidth / 2);
   SBottom.Width     := Trunc(ClientWidth / 2);
   // Posizionamento del logo di levante in alto
   Logo.Top          := Round(STop.Height/2) - Round(Logo.Height/2);
   Logo.Left         := STop.Left + Round(ClientWidth/4) - Round(Logo.Width/2);
   // POsizionamento del pannello con i dati di login
   // NB: Se siamo in modalità Levante Light effettua alcuni adattamenti
   PanelLoginData.Top   := Round((ClientHeight - PanelLoginData.Height) /2);
   PanelLoginData.Left  := STop.Left + Round((STop.Width - PanelLoginData.Width) /2);
   if MainForm.IsLevanteLight then begin
     Label2.Visible     := False;
     Panel1.Visible     := False;
     LabelUID.Top       := 80;
     EditUID.Top        := 80;
     LabelPassword.Top  := LabelUID.Top + 40;
     EditPassword.Top   := LabelUID.Top + 40;
   end;
   // Posizionamento del pulsante di uscita dal programma
   SBExit.Width         := 35;
   SBExit.Height        := 35;
   SBExit.Top           := SBottom.Top + Round((SBottom.Height - SBExit.Height) /2);
   SBExit.Left          := SBottom.Left + SBottom.Width - SBExit.Width - 20;
   LabelExit.Width      := 140;
   LabelExit.Height     := 24;
   LabelExit.Top        := SBottom.Top + Round((SBottom.Height - LabelExit.Height) /2);
   LabelExit.Left       := SBExit.Left - LabelExit.Width - 10;
   // Posiziona il pannello che contiene il WebBrowser
   PanelCover.Top     := 0;
   PanelCover.Left    := 0;
   PanelCover.Width   := Trunc(ClientWidth / 2);
   PanelCover.Height  := ClientHeight;
   // Posiziona il WebBrowser vero e proprio all'interno del pannello
   WebBrowser.Left    := -2;
   WebBrowser.Top     := -2;
   WebBrowser.Width   := Trunc(ClientWidth / 2) + 4;
   WebBrowser.Height  := ClientHeight + 4;
   if MainForm.IsLevanteLight then begin
     PanelCover.Left  := PanelCover.Left + 10;
     PanelCover.Top   := PanelCover.Top + 20;
     PanelCover.Width := PanelCover.Width - 20;
     WebBrowser.Width := WebBrowser.Width + 20;
   end;
   // Calcola la posizione dell'eventuale form dell'elenco aziende
   fAziendeLeft       := STop.Left + Round((STop.Width - SB_WIDTH) /2);
   fAziendeTop        := Round((ClientHeight - SB_HEIGHT) /2);
   fAziendeWidth      := SB_WIDTH;
   fAziendeHeight     := SB_HEIGHT;
   // Posizione pannello opzioni
   PanelMenuOpzioni.Left    := fAziendeLeft;
   PanelMenuOpzioni.Top     := fAziendeTop;
   PanelMenuOpzioni.Width   := fAziendeWidth;
   PanelMenuOpzioni.Height  := fAziendeHeight;
   // Posizione dati utente Levante Light
   PanelDatiUtenteLevanteLight.Left    := fAziendeLeft;
   PanelDatiUtenteLevanteLight.Top     := fAziendeTop;
   PanelDatiUtenteLevanteLight.Width   := fAziendeWidth;
   PanelDatiUtenteLevanteLight.Height  := fAziendeHeight;
   // Aggiorna la posizione e il dimensionamento degli eventuali sottopannelli (form)
   if AziendeForm <>  nil then PosizionaSottopannelli(AziendeForm);
   if NetDirForm <>   nil then PosizionaSottopannelli(NetDirForm);
   if SecurityForm <> nil then PosizionaSottopannelli(SecurityForm);
end;

procedure TStartFrame.SBGridOKClick(Sender: TObject);
begin
  if MainForm.LevanteLight_DatiUtenteCorretti then begin
    // Salva i dati dell'utente
    MainForm.LevanteLight_SalvaDatiUtente;
    // Chiude il pannello di inserimento dei dati utente
    SpeedButtonRollOver10Click(SpeedButtonRollOver10);
  end else begin
    // Visualizza un messaggio di errore
    raise Exception.Create('Dati incompleti o errati!');
  end;
end;

procedure TStartFrame.SpeedButtonRollOver10Click(Sender: TObject);
begin
    // Chiude il pannello di inserimento dei dati utente
    PanelDatiUtenteLevanteLight.Hide;
    // Azzera i dati e pone il focus sul nomte utente
    EditUID.Text      := '';
    EditPassword.Text := '';
    EditUID.SetFocus;
end;

end.
