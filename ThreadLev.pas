unit ThreadLev;

interface

uses
  Classes, Windows, Graphics, SysUtils, Controls, Forms;

const
  // Intervallo in ms del Thread
  THR_INTERVAL                  = 1000;    // In millisecondi (Tanto al momento viene usato solo per  aggiornare a viedo il contatore delle comunicazioni automatiche pronte)
  // Parametri degli Hints
  HINT_MOUSE_MOVE_TOLERANCE     = 25;     // L'hint sparisce se l'utente sposta il mouse oltre questa soglia
  // Parametri del Menù Utilita
  UTI_MOUSE_MOVE_TOLERANCE      = 25;     // Il Menù sparisce se l'utente sposta il mouse oltre questa soglia
  // Offset di visualizzazione dell'Hint rispetto al controllo
  HINT_X_OFFSET                 = 15;
  HINT_Y_OFFSET                 = 15;
  // Determina ogni quanti passaggi (secondi) eseguire l'aggiornamento delle comunicazioni
  //  automatiche presenti nel main menù
  COMAUTO_DELAY                 = 30;

type
  LevThread = class(TThread)
  private
    { Private declarations }
    // Variabili che contengono il nome e l'owner del componente sotto al puntatore del mouse
    //  al passaggio precedente del thread
    LastOwner, LastName:String;
    LastMouseX, LastMouseY:Integer;
    // Contatore del n° di passaggi del thread con lo stesso control sotto al puntatore del mouse
    //  (Se Contatore > HINT_DELAY visualizza l'HINT)
    HintCounter:Integer;

    // COntatore del numero di passaggi del thread per poi decidere quando è
    //  ora di aggiornare il conteggio di comunicazioni automatiche
    ComAuto_Passaggi: Integer;
    // Proprietà che contiene il numero di comunicazioni automatiche
    //  pronte per essere inviate presenti nell'azienda
    ComAuto_Count: Integer;
    MainFormHandle: HWND;

    procedure CheckMenuUtilita;
    procedure CheckListTipoDoc;
    procedure EnableMainMenu;
    procedure DisableMainMenu;
    procedure CheckHint;
    procedure ComAuto_Check;

  protected
    procedure Execute; override;
  public
    constructor Create;
  end;

implementation

uses Main, FormHint, DataModule1, IBODataset, IB_Components;

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure BlinkThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ LevThread }


constructor LevThread.Create;
begin
  FreeOnTerminate := True;
  inherited Create(True);
  Priority := tpLower;
  // Inizializzazione variabili
  HintCounter := 0;
  MainFormHandle := MainForm.Handle;
  ComAuto_Passaggi := 999999; // Coìal primo passaggio lo esegue subito  poi prosegue normalmente
end;



procedure LevThread.Execute;
{
var
   CurrForm: String;
}
begin
  { Place thread code here }
   while (not Terminated) do begin
{
      // Se la forma attiva è una delle seguenti il MainManù rimane attivo altrimenti no:
      //  'ClientiForm', 'PrimanotaForm' (Solo griglia elenco)
      // --------------------------------------------------------------------------------
      // Per comodità salva il nome della form corrente su questa variabile
      CurrForm := MainForm.Controls[MainForm.ControlCount-1].Name;
      // Abilita o disabilita il MainMenu in base alla situazione
      //  NB: IN futuro si potrebbe disabilitare il menu principale semplicemente quando
      //       è bloccato l'aggiornamento dell'IconaDocTipo senza usare più il Thread che sarebbe meglio.
      if (CurrForm = 'ClientiForm')
      or ((PrimanotaForm <> nil) and (CurrForm = 'PrimanotaForm') and (PrimanotaForm.PanelGriglia.Visible))
      or ((CurrForm = 'AnagCliForm') and (not AnagCliForm.RxSpeedModifica.Down) and (MainForm.IconaDocTipoBloccata <= 1))
      or ((CurrForm = 'PraticaForm') and (not PraticaForm.RxSpeedModifica.Down) and (MainForm.IconaDocTipoBloccata <= 1))
      then begin
         if not MainForm.IsMainMenuEnabled then Synchronize(EnableMainMenu);
      end else begin
         if MainForm.IsMainMenuEnabled then Synchronize(DisableMainMenu);
      end;
}
      // -------------------------------------------------------------------------------
      // Se uno dei menu Utilità oppure Impostazioni è aperto, controlla gli spostamenti del mouse
      //  in modo che se l'utente esce più di tanto dalla zona del menù stesso lo disabilita.
//      if MainForm.PanelMenuUtilita.Visible and (not Application.Terminated) and (not Terminated) then Synchronize(CheckMenuUtilita);
      // Se il calendario è aperto, controlla gli spostamenti del mouse
      //  in modo che se l'utente esce più di tanto dalla zona lo disabilita.
//      if (CalendarioForm <> nil) and (not Application.Terminated) and (not Terminated) then Synchronize(CheckCalendario);
      // Se la selezione del tipo documento è aperto, controlla gli spostamenti del mouse
      //  in modo che se l'utente esce più di tanto dalla zona lo disabilita.
//      if MainForm.ListBoxNomeDoc.Visible and (not Application.Terminated) and (not Terminated) then Synchronize(CheckListTipoDoc);
      // Controlla per vedere se deve visualizzare un hint
//      if DM1.HINT_ENABLED and (not Application.Terminated) and (not Terminated) then CheckHint;


      // =======================================================================
      // Aggiornamento del numero di comunicazioni automatiche presenti
      // -----------------------------------------------------------------------
      // Verifica se è ora di aggiornare il dato (ogni tot. secondi/passaggi)
      if (ComAuto_Passaggi > COMAUTO_DELAY) then begin
        // Aggiorna il dato
        ComAuto_Check;
        // Azzera il contatore del numerod i passaggi
        ComAuto_Passaggi := 0;
      // Altrimenti incrementa il contatore di passaggi e basta
      end else inc(ComAuto_Passaggi);
      // =======================================================================

      // Attesa
      Sleep(THR_INTERVAL);
   end;
end;


// =============================================================================
// INIZIO: PARTE PER GESTIONE DELLE COMUNICAZIONI AUTOMATICHE
// -----------------------------------------------------------------------------
// RIcava il numero di nuove comunicazioni automatiche ci sono da inviare
procedure LevThread.ComAuto_Check;
var
  DBC: TIBODatabase;
  Qry: TIB_Cursor;
begin
  // Prima tutto se non siamo connessi ad alcuna azienda esce subito.
  if (not DM1.DBAzienda.Connected) then Exit;
  try try
    // Crea la connessione al database per il thread, la imposta e si connette
    DBC := TIBODatabase.Create(nil);
    DBC.Protocol := DM1.DBAzienda.Protocol;
    DBC.Path     := DM1.DBAzienda.Path;
    DBC.Username := DM1.DBAzienda.Username;
    DBC.Password := DM1.DBAzienda.Password;
    DBC.Connect;
    // Crea ed esegue una query che ricava l'informazione
    Qry := TIB_Cursor.Create(nil);
    Qry.IB_Connection   := DBC;
    Qry.SQL.Add('SELECT COUNT(*) FROM COM_LIST_PROC');
    Qry.Open;
    // Aggiorna la main form solo se è cambiata
    if Qry.Fields[0].AsInteger <> ComAuto_Count then begin
      ComAuto_Count := Qry.Fields[0].AsInteger;
      SendMessage(MainFormHandle, MsgLevComAutoCountUpdate, 0, ComAuto_Count);
    end;
    // Chiude la connessione al DB
    Qry.Close;
    DBC.Disconnect;
  except  // Così anche se da errore non rompe, non funzia ma non rompe.
  end;
  finally
    if Assigned(Qry)  then Qry.Free;
    if Assigned(DBC)  then DBC.Free;
  end;
end;

// -----------------------------------------------------------------------------
// FINE: PARTE PER GESTIONE DELLE COMUNICAZIONI AUTOMATICHE
// =============================================================================


procedure LevThread.EnableMainMenu;
begin
   MainForm.AbilitaMainMenu;
end;

procedure LevThread.DisableMainMenu;
begin
   MainForm.DisabilitaMainMenu(MainForm.Controls[MainForm.ControlCount-1].Name = MainForm.Name);
end;


procedure LevThread.CheckListTipoDoc;
var
   X, Y: Integer;
   P:TPoint;
begin
   X := Mouse.CursorPos.X;
   Y := Mouse.CursorPos.Y;
   P := MainForm.ListBoxNomeDoc.ClientToScreen(Point(0,0));
   // Se il mouse si è spostato oltre una certa distanza dal menu lo chiude automaticamente
   if (X < P.X - UTI_MOUSE_MOVE_TOLERANCE)
   or (X > P.X + MainForm.ListBoxNomeDoc.Width + UTI_MOUSE_MOVE_TOLERANCE)
   or (Y < P.Y - UTI_MOUSE_MOVE_TOLERANCE - 25)
   or (Y > P.Y + MainForm.ListBoxNomeDoc.Height + UTI_MOUSE_MOVE_TOLERANCE)
   then begin
      // Chiude
      MainForm.SBTipoDocumento.Down := False;
      MainForm.SBTipoDocumentoClick(Self);
   end;
end;



procedure LevThread.CheckMenuUtilita;
var
   X, Y: Integer;
begin
   X := Mouse.CursorPos.X;
   Y := Mouse.CursorPos.Y;
   // Se il mouse si è spostato oltre una certa distanza dal menu lo chiude automaticamente
   if (X < MainForm.PanelMenuUtilita.ClientToScreen(Point(MainForm.SU.Left, 0)).X - UTI_MOUSE_MOVE_TOLERANCE)
   or (X > MainForm.PanelMenuUtilita.ClientToScreen(Point(MainForm.SU.Left+MainForm.SU.Width, 0)).X + UTI_MOUSE_MOVE_TOLERANCE)
   or (Y < MainForm.PanelMenuUtilita.ClientToScreen(Point(0, MainForm.SU.Top)).Y - UTI_MOUSE_MOVE_TOLERANCE)
   or (Y > MainForm.PanelMenuUtilita.ClientToScreen(Point(0, MainForm.SU.Top+MainForm.SU.Height)).Y + UTI_MOUSE_MOVE_TOLERANCE + 25)
   then begin
      // Chiude il menu
      case MainForm.MenuUtilita.Tag of
         0: begin MainForm.SBUtilita.Down := False; MainForm.SBUtilitaClick(Self); end;
         1: begin MainForm.SBImpostazioni.Down := False; MainForm.SBIMpostazioniClick(Self); end;
      end;
   end;
end;



procedure LevThread.CheckHint;
var
   CurrentOwner, CurrentName, HintFileName: String;
   Comp:TControl;
   HintPos:TPoint;
begin
   Comp := FindDragTarget(Mouse.CursorPos, True);
   if (Comp <> nil) and (Comp.Visible) then begin
      // Carica nelle variabili i dati del controllo situato sotto il puntatore del mouse
      CurrentOwner := Comp.Owner.Name;
      CurrentName  := Comp.Name;
      // Se l'hint è attualmente visualizzato...
      if HintForm.Visible then begin
         // Controlla se il mouse è ancora sul controllo che attivato l'hint
         //  e se non lo è più, chiude l'hint. Controlla anche se l'utente ha spostato il mouse mentre
         //  l'hint è visibile e se lo ha spostato oltre una certa soglia fà sparire l'hint.
         if (CurrentOwner <> 'HintForm') and ((CurrentName <> LastName) or (CurrentOwner <> LastOwner) or (Abs(Mouse.CUrsorPos.X - LastMouseX) > HINT_MOUSE_MOVE_TOLERANCE) or (Abs(Mouse.CUrsorPos.Y - LastMouseY) > HINT_MOUSE_MOVE_TOLERANCE)) then begin
            // Chiude l'hint
            HintForm.Close;
            // Azzera il contatore
            HintCounter := 0;
         end;
      // Se invece l'hint non è visualizzato
      end else begin
         // Se il puntatore del mouse è ancora sullo stesso controllo rispetto al passaggio precedente...
         //  e se l'operatore non ha spostato per niente il mouse...
         if (CurrentName = LastName) and (CurrentOwner = LastOwner) and (Mouse.CursorPos.X = LastMouseX) and (Mouse.CursorPos.Y = LastMouseY) then begin
            // Se il contatore dei passaggi ha già superato il valore della costante HINT_DELAY
            //  visualizza l'hint, altrimenti incrementa il contatore
            if HintCounter > DM1.HINT_DELAY then begin
               // Carica il testo dell'hint solo se il relativo file esiste
               HintFileName := DM1.HintsDir + CurrentOwner + '_' + CurrentName + '.hnt';
               if FileExists(HintFileName) then begin
                  // Carica il testo dell'hint
                  HintForm.HintMemo.Lines.Clear;
                  HintForm.HintMemo.Lines.LoadFromFile(HintFileName);
                  // Imposta le dimensioni verticali in base al testo caricato.
                  HintForm.CalcolaDimensioniVerticali;
                  // Determina la posizione del controllo e quindi la posizione della form
                  HintPos := Comp.ClientToScreen(Point(0,0));
                  // Fà in modo che l'hint non sia mai visualizzato al di fuori della form principale sull'asse X
                  if HintPos.X + (HINT_X_OFFSET*2) + HintForm.Width > MainForm.ClientToScreen(Point(MainForm.Width, MainForm.Height)).X then begin
                     HintPos.X := HintPos.X - HintForm.Width;
                  end else begin
                     HintPos.X := HintPos.X + HINT_X_OFFSET;
                  end;
                  // Fà in modo che l'hint non sia mai visualizzato al di fuori della form principale sull'asse Y
                  if HintPos.Y + (HINT_Y_OFFSET*2) + HintForm.Height > MainForm.ClientToScreen(Point(MainForm.Width, MainForm.Height)).Y then begin
                     HintPos.Y := HintPos.Y - HintForm.Height;
                  end else begin
                     HintPos.Y := HintPos.Y + HINT_Y_OFFSET;
                  end;
                  // Visualizza l'hint con la form trasparente
                  HintForm.ShowTransparent(HintPos.X, HintPos.Y);
               end;
            end else begin
               Inc(HintCounter, THR_INTERVAL);
            end;
         // Altrimenti azzera il contatore e aggiorna le variabili Last
         end else begin
            HintCounter := 0;
            LastOwner           := CurrentOwner;
            LastName            := CurrentName;
            LastMouseX          := Mouse.CursorPos.X;
            LastMouseY          := Mouse.CursorPos.Y;
         end;
      end;
   end;
end;

end.
