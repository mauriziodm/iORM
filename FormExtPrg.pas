unit FormExtPrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  
  cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxButtonEdit, DB, cxDBData, cxGridDBTableView,
  cxGridLevel, cxGridCardView, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, IB_Components,
  IBODataset, bmpPanel, StdCtrls, Buttons, Mask, DBCtrls,
  ComCtrls, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  cxGridCustomLayoutView;

type
  TExtPrgForm = class(TForm)
    ClientArea: TPanel;
    ClientTopPanel: TbmpPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    DBText1: TDBText;
    Label5: TLabel;
    NomeProgramma: TDBEdit;
    Label6: TLabel;
    Label8: TLabel;
    CommandLine: TDBEdit;
    ExtensioneFile: TDBEdit;
    ButtonImportaFileVuoto: TBitBtn;
    QryExtPrg: TIBOQuery;
    SourceExtPrg: TDataSource;
    QryExtPrgCODICE: TIntegerField;
    QryExtPrgDESCRIZIONE: TStringField;
    QryExtPrgCMDLINE: TStringField;
    QryExtPrgESTENSIONE: TStringField;
    QryExtPrgBLANKFILE: TMemoField;
    QryExtPrgREGISTRO: TStringField;
    Label1: TLabel;
    Registro: TDBEdit;
    GridList: TcxGrid;
    tvDiBa: TcxGridTableView;
    tvDiBaMOVMAG: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO2: TcxGridColumn;
    tvDiBaCODICEARTICOLO: TcxGridColumn;
    tvDiBaCODICEARTICOLOSTM: TcxGridColumn;
    tvDiBaDESCRIZIONE: TcxGridColumn;
    tvDiBaPREZZOUNITARIO: TcxGridColumn;
    tvDiBaPREZZOUNITARIOIVACOMPRESA: TcxGridColumn;
    tvDiBaPRZUNITNETTO: TcxGridColumn;
    tvDiBaUNITADIMISURA: TcxGridColumn;
    tvDiBaQTA: TcxGridColumn;
    tvDiBaQTAINEVASIONE: TcxGridColumn;
    tvDiBaQTAEVASA: TcxGridColumn;
    tvDiBaQTADAEVADERE: TcxGridColumn;
    tvDiBaSCONTORIGO: TcxGridColumn;
    tvDiBaSCONTORIGO2: TcxGridColumn;
    tvDiBaSCONTORIGO3: TcxGridColumn;
    tvDiBaIMPORTORIGO: TcxGridColumn;
    tvDiBaIMPORTORIGOIVACOMPRESA: TcxGridColumn;
    tvDiBaCODICEIVA: TcxGridColumn;
    tvDiBaDESCRIZIONEIVA: TcxGridColumn;
    tvDiBaALIQUOTAIVA: TcxGridColumn;
    tvDiBaNOTERIGO: TcxGridColumn;
    tvDiBaPREZZOACQUISTOARTICOLO: TcxGridColumn;
    tvDiBaMARGINE: TcxGridColumn;
    tvDiBaIMPORTOMARGINE: TcxGridColumn;
    tvDiBaPRZUNITOPERA: TcxGridColumn;
    tvDiBaQTAOPERA: TcxGridColumn;
    tvDiBaIMPORTOOPERA: TcxGridColumn;
    tvDiBaIMPORTOCOMPONENTI: TcxGridColumn;
    tvDiBaSELEZIONATO: TcxGridColumn;
    tvDiBaMINUTIPREVISTI: TcxGridColumn;
    tvDiBaSOTTOCANTIERE1: TcxGridColumn;
    tvDiBaSOTTOCANTIERE2: TcxGridColumn;
    tvDiBaSOTTOCANTIERE3: TcxGridColumn;
    tvDiBaSOTTOCANTIERE4: TcxGridColumn;
    tvDiBaSOTTOCANTIERE5: TcxGridColumn;
    tvDiBaSOTTOCANTIERE6: TcxGridColumn;
    tvDiBaS3RIF: TcxGridColumn;
    tvDiBaS3UBICAZIONE: TcxGridColumn;
    tvDiBaS3COMPONENTE: TcxGridColumn;
    tvDiBaS3MATERIALE: TcxGridColumn;
    tvDiBaS3QTA: TcxGridColumn;
    tvDiBaS3DIAMETRO: TcxGridColumn;
    tvDiBaS3LUNGHEZZA: TcxGridColumn;
    tvDiBaS3INSTALLAZIONE: TcxGridColumn;
    tvDiBaS3CERTIFICAZIONE: TcxGridColumn;
    tvDiBaS3VENTILAZIONE: TcxGridColumn;
    tvDiBaS3SCARICO: TcxGridColumn;
    tvDiBaS3TIPO: TcxGridColumn;
    tvDiBaS3MODELLO: TcxGridColumn;
    tvDiBaS3PORTATATERMICA: TcxGridColumn;
    tvDiBaS3TIPOCOLLEGAMENTO: TcxGridColumn;
    tvDiBaS3INSTALLATOINSTALLABILE: TcxGridColumn;
    tvDiBaS3MATERIALEAPPARECCHIO: TcxGridColumn;
    tvDiBaTIPO1: TcxGridColumn;
    tvDiBaTIPO2: TcxGridColumn;
    tvDiBaTIPO3: TcxGridColumn;
    tvDiBaTIPO4: TcxGridColumn;
    tvDiBaTIPO5: TcxGridColumn;
    tvDiBaTIPO6: TcxGridColumn;
    tvDiBaTODELETE: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvDiBaGC_RICARICO_MOD: TcxGridColumn;
    tvDiBaGC_RICARICO: TcxGridColumn;
    tvDiBaGC_QTA_MOD: TcxGridColumn;
    tvDiBaGC_QTA: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE: TcxGridColumn;
    tvDiBaGUID: TcxGridColumn;
    tvDiBaGUID_REF: TcxGridColumn;
    tvDiBaGUID_ANCESTOR: TcxGridColumn;
    tvDiBaORDER: TcxGridColumn;
    tvDiBaIDAPPARECCHIO: TcxGridColumn;
    tvDiBaIDOPIMPEGNO: TcxGridColumn;
    cvTot: TcxGridCardView;
    cvTotCOMPONENTI: TcxGridCardViewRow;
    cvTotMARGINE: TcxGridCardViewRow;
    cvTotIMPORTOMARGINE: TcxGridCardViewRow;
    cvTotTOTALECOMPONENTI: TcxGridCardViewRow;
    cvTotPRZUNITOPERA: TcxGridCardViewRow;
    cvTotQTAOPERA: TcxGridCardViewRow;
    cvTotIMPORTOOPERA: TcxGridCardViewRow;
    cvTotTOTALE: TcxGridCardViewRow;
    tvOre: TcxGridTableView;
    tvOreCODDIPENDENTE: TcxGridColumn;
    tvOreDESCRIZDIPENDENTE: TcxGridColumn;
    tvOreQTA: TcxGridColumn;
    tvOreNOTE: TcxGridColumn;
    tvOreSOTTOCANTIERE1: TcxGridColumn;
    tvOreSOTTOCANTIERE2: TcxGridColumn;
    tvOreSOTTOCANTIERE3: TcxGridColumn;
    tvOreTIPOORE1: TcxGridColumn;
    tvOreTIPOORE2: TcxGridColumn;
    tvOreTIPOORE3: TcxGridColumn;
    tvOrePRZUNITVEND: TcxGridColumn;
    tvOreIMPORTOVEND: TcxGridColumn;
    tvOreCOSTOORARIO: TcxGridColumn;
    tvOreIMPORTOCOSTOORARIO: TcxGridColumn;
    tvOreOPERAINDEX: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvOreGC_RICARICO_MOD: TcxGridColumn;
    tvOreGC_RICARICO: TcxGridColumn;
    tvOreGC_QTA_MOD: TcxGridColumn;
    tvOreGC_QTA: TcxGridColumn;
    tvOreGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvOreGC_DESCRIZIONE: TcxGridColumn;
    tvOreGUID: TcxGridColumn;
    tvOreGUID_REF: TcxGridColumn;
    tvOreGUID_ANCESTOR: TcxGridColumn;
    tvList: TcxGridDBTableView;
    lvList: TcxGridLevel;
    tvListCODICE: TcxGridDBColumn;
    tvListDESCRIZIONE: TcxGridDBColumn;
    tvListESTENSIONE: TcxGridDBColumn;
    tvListREGISTRO: TcxGridDBColumn;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure ButtonImportaFileVuotoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RegistroEnter(Sender: TObject);
    procedure RegistroExit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure EseguiQueryExtPrg;
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    // Punta al componente Field in cui inserire il codice del cliente
    FieldCodiceExtPrg : TField;
  end;

var
  ExtPrgForm: TExtPrgForm;

implementation

uses DataModule1, main, FormHelp, FormMenuAggiungi;

{$R *.DFM}

procedure TExtPrgForm.EseguiQueryExtPrg;
begin
   // Esegue la query
   if QryExtPrg.Active then QryExtPrg.Close;
   QryExtPrg.Open;
end;


procedure TExtPrgForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(ExtPrgForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Collegamento a programmi esterni)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);

   // Default per il puntatore al campo da modificare nel caso di chiamata per la selezione del
   //  collegamento a programma esterno
   FieldCodiceExtPrg := nil;
end;

procedure TExtPrgForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

      // F2 = Modifica
      113: begin
         if RxSpeedModifica.Enabled then begin
            RxSpeedModifica.Down := not RxSpeedModifica.Down;
            RxSpeedModificaClick(Self);
         end;
      end;

      // F3 = Nuovo
      114: begin
         if RxSpeedButtonNuovo.Enabled then begin
            RxSpeedButtonNuovo.Down := not RxSpeedButtonNuovo.Down;
            RxSpeedButtonNuovoClick(Self);
         end;
      end;

      // F4 = Elimina
      115: begin
         if RxSpeedButtonElimina.Enabled then begin
            RxSpeedButtonElimina.Down := not RxSpeedButtonElimina.Down;
            RxSpeedButtonEliminaClick(Self);
         end;
      end;

   end;
end;

procedure TExtPrgForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if GridList.Visible then begin
      Close;
   end else begin
      // Griglia visibile che copre il resto
      GridList.Visible                     := True;
      // Risistema i pulsanti per la fase di elenco
      RxSpeedModifica.Enabled           := False;
      RxSpeedButtonNuovo.Enabled        := True;
      RxSpeedButtonElimina.Enabled      := True;
      RxSpeedButtonVisualizza.Enabled   := True;
   end;
end;

procedure TExtPrgForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryExtPrg.Edit;
          RxSpeedButtonUscita.Enabled         := False;
          GridList.Enabled                       := False;
          ButtonImportaFileVuoto.Enabled      := True;
          DM1.ColoraTuttiCampi(ExtPrgForm, COLOR_MODIFICA);
          // Focus sul primo campo editabile
          CommandLine.SetFocus;
          NomeProgramma.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end
     else
     begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
         QryExtPrg.Edit;
          // Se il focus è sul pulsante di caricamenteo del file vuoto lo sposta
          //  perchè altrimenti da un errore.
          if ButtonImportaFileVuoto.Focused then CommandLine.SetFocus;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice è nullo (NUOVO) ne assegna uno nuovo.
               if QryExtPrgCODICE.IsNull then begin
                  QryExtPrgCODICE.Value := DM1.NextCodice('EXTPRG', 'CODICE');
               end;
               // Posta il tutto
               QryExtPrg.Post;
          end else if MR = mrNo then begin
               // Esegue il cancel
               QryExtPrg.Cancel;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          RxSpeedButtonUscita.Enabled        := True;
          GridList.Enabled                      := True;
          ButtonImportaFileVuoto.Enabled     := False;
          DM1.ColoraTuttiCampi(ExtPrgForm, COLOR_NORMALE);
          // Focus sul primo campo editabile
          CommandLine.SetFocus;
          NomeProgramma.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryExtPrg.Edit;
          end;
       end;
     end;
end;

procedure TExtPrgForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);
   NomeProgramma.SetFocus;     // Altrimenti non fà l'append ma modifica il record corrente (non so perchè ma è così)
   QryExtPrg.Append;
   QryExtPrgREGISTRO.Value := '-';
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TExtPrgForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Chiede prima conferma
  MessageBeep(0);
  if MessageDlg('Vuoi veramente cancellare il programma esterno ?', mtWarning, [mbOk, mbNo], 0) = mrOk then
  begin
       // Elimina l'articolo corrente
       QryExtPrg.Delete;
       QryExtPrg.ApplyUpdates;
       QryExtPrg.CommitUpdates;
  end;
end;

procedure TExtPrgForm.ButtonImportaFileVuotoClick(Sender: TObject);
begin
   // Importa il file selezionato dalla dialog box di apertura files
   //  come file vuoto per il programma esterno attualmente selezionato.
   if DM1.OpenDialog1.Execute then QryExtPrgBlankFile.LoadFromFile(DM1.OpenDialog1.FileName);
end;

procedure TExtPrgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;

   // Aggiorna il menù aggiungi
   MenuAggiungiForm.CaricaLinkItemsExtDoc;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
   
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBImpostazioni.Down := False;
   // Il puntatore alla form := nil
   ExtPrgForm := nil;
end;

procedure TExtPrgForm.FormShow(Sender: TObject);
begin
   // Rende visibile solo la griglia e nascosti i campi
   GridList.Visible := True;
   GridList.Align := alClient;

   DM1.FocusRefresh;
   RxSpeedButtonTrovaClick(Self);
end;

procedure TExtPrgForm.RegistroEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TExtPrgForm.RegistroExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TExtPrgForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('IMPOSTAZIONI');
end;

procedure TExtPrgForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
   // Aggiorna l'aspetto della form per farla passare alla modalità Anagrafica
   // ------------------------------------------------------------------------
   // Griglia invisibile
   GridList.Visible := False;
   // Aggiorna lo stato dei pulsanti per la modalità Anagrafica
   RxSpeedModifica.Enabled           := True;
   RxSpeedButtonNuovo.Enabled        := False;
   RxSpeedButtonElimina.Enabled      := False;
   RxSpeedButtonVisualizza.Enabled   := False;
end;

procedure TExtPrgForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   EseguiQueryExtPrg;
   GridList.SetFocus;
   DM1.ChiudiAttendere;
end;

procedure TExtPrgForm.tvListDblClick(Sender: TObject);
begin
   // Se la variabile 'FieldCodiceExtPrg' = nil significa che la form è stata richiamata in modo normale, altirmenti
   //  significa che è stata richiamata per la selezione di un collegamento a programma esterno
   //  e in questo caso se l'utente fà doppio-click la considera una selezione.
   if FieldCodiceExtPrg = nil then begin
      RxSpeedButtonVisualizzaClick(Self);
   end else begin
      FieldCodiceExtPrg.Value := QryExtPrgCODICE.Value;
      Close;
   end;
end;


procedure TExtPrgForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(tvList);
end;

end.

