unit FormPagamenti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  
  cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxButtonEdit, DB, cxDBData, IB_Components,
  IBODataset, bmpPanel, cxGridLevel, cxGridDBTableView,
  cxGridCardView, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, ExtCtrls, DBCtrls, Mask,
  ComCtrls, Buttons, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  cxGridCustomLayoutView, cxContainer, cxMaskEdit, cxLookupEdit, cxDBLookupEdit;

type
  TPagamentiForm = class(TForm)
    ClientArea: TPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    Descrizione: TDBEdit;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    RichEdit2: TRichEdit;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    RichEdit3: TRichEdit;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    RichEdit4: TRichEdit;
    PanelInizio: TPanel;
    DBComboBox1: TDBComboBox;
    PanelIntervallo: TPanel;
    DBComboBox2: TDBComboBox;
    Spese: TDBEdit;
    DBText1: TDBText;
    QryPagam: TIBOQuery;
    SourcePagam: TDataSource;
    QryPagamCODICE: TIntegerField;
    QryPagamDESCRIZIONE: TStringField;
    QryPagamRATE: TSmallintField;
    QryPagamRICEVUTABANCARIA: TStringField;
    QryPagamINIZIOSCADGG: TSmallintField;
    QryPagamINIZIOSCADFM: TStringField;
    QryPagamINTERVALLOSCADGG: TSmallintField;
    QryPagamSPESE: TIBOFloatField;
    QryPagamTIPOPAGIVA: TSmallintField;
    QryPagamSINCHRO: TStringField;
    PanelRate: TPanel;
    DBComboBox3: TDBComboBox;
    PanelIVA: TPanel;
    DBRadioGroup3: TDBRadioGroup;
    PanelFineMese: TPanel;
    DBRadioGroup5: TDBRadioGroup;
    ClientTopPanel: TbmpPanel;
    PanelRicevutaBancaria: TPanel;
    DBRadioGroup4: TDBRadioGroup;
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
    PanelGruppo5: TPanel;
    LabelGruppo5: TLabel;
    RichEdit5: TRichEdit;
    QryPagamPA_CONDIZIONIPAGAMENTOSIGLA: TStringField;
    QryPagamPA_MODALITAPAGAMENTOSICLA: TStringField;
    QryPagamDATICONTOINFATTURA: TStringField;
    Label1: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label2: TLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    QryPagamEXPORT_CODICE: TStringField;
    PanelGruppo6: TPanel;
    LabelGruppo6: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    RichEdit6: TRichEdit;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBCheckBox2Enter(Sender: TObject);
    procedure DBCheckBox2Exit(Sender: TObject);
    procedure DBRadioGroup2Enter(Sender: TObject);
    procedure DBRadioGroup2Exit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure Grid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure DescrizioneEnter(Sender: TObject);
    procedure DescrizioneExit(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagamentiForm: TPagamentiForm;

implementation

uses DataModule1, main, FormHelp, FormAnagCli, SchedaPreventiviOrdini,
  FormCheckIn;

{$R *.DFM}

procedure TPagamentiForm.RxSpeedButtonUscitaClick(Sender: TObject);
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

procedure TPagamentiForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     DM1.Attendere;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then begin
       // Prima di avviare la modifica controlla se il record è stato o meno creato da questa postazione e quindi
       //  se si è autorizzati alla sua modifica (se sincronizzazione attiva).
       if not DM1.ControlloSeModificabileDallaStazione(QryPagamCodice.AsInteger) then begin RxSpeedModifica.Down := False; DM1.ChiudiAttendere; Exit; end;
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryPagam.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          GridList.Enabled                  := False;
          DM1.ColoraTuttiCampi(PagamentiForm, COLOR_MODIFICA);
          // Focus sul primo campo editabile
          Spese.SetFocus;
          Descrizione.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end else begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
          QryPagam.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice è nullo (NUOVO) ne assegna uno nuovo.
               if QryPagamCodice.IsNull then begin
                  QryPagamCodice.Value := DM1.ControllaSeBisognaAggiungereIlCodiceChiave(DM1.NextCodice('PAGAM', 'CODICE'));
               end;
               QryPagam.Post;
               QryPagam.ApplyUpdates;
               QryPagam.CommitUpdates;
          end else if MR = mrNo then begin
               QryPagam.Cancel;
               QryPagam.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               DM1.ChiudiAttendere;
               Exit;
          end;
          // Sincronizza i controlli a video con la situazione reali degli archivi

          RxSpeedButtonUscita.Enabled        := True;
          GridList.Enabled                  := True;
          DM1.ColoraTuttiCampi(PagamentiForm, COLOR_NORMALE);
          // Focus sul primo campo editabile
          Spese.SetFocus;
          Descrizione.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryPagam.Edit;
          end;
       end;
     end;
     DM1.ChiudiAttendere;
end;

procedure TPagamentiForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);
   Descrizione.SetFocus;   // Altrimenti non si comporta correttamente
   QryPagam.Append;
   QryPagamDATICONTOINFATTURA.Value := 'F';
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TPagamentiForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Chiede prima conferma
  if MessageDlg('Vuoi veramente cancellare il pagamento ?', mtWarning, [mbOk, mbNo], 0) = mrOk then
  begin
       // Elimina l'articolo corrente
       QryPagam.Delete;
       QryPagam.ApplyUpdates;
       QryPagam.CommitUpdates;
  end;
end;

procedure TPagamentiForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(PagamentiForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Modalità di pagamento)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;
   PanelGruppo3.Color := COLOR_SUBPANEL_BG;
   PanelGruppo4.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo3.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo4.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo3.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo4.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TPagamentiForm.FormShow(Sender: TObject);
begin
     // Rende visibile solo la griglia e nascosti i campi
     GridList.Visible := True;
     GridList.Align := alClient;

     DM1.FocusRefresh;
     // Attiva la query
     QryPagam.Open;
end;

procedure TPagamentiForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TPagamentiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBImpostazioni.Down := False;
   // Il puntatore alla form := nil
   PagamentiForm := nil;
end;

procedure TPagamentiForm.DBEdit1Enter(Sender: TObject);
begin
   if Sender is TDBEdit then begin
      if (Sender as TDBEdit).Color = clWhite then (Sender as TDBEdit).Color := clYellow;
   end else if Sender is TDBCheckBox then begin
      if (Sender as TDBCheckBox).Color = clWhite then (Sender as TDBCheckBox).Color := clYellow;
   end;
end;

procedure TPagamentiForm.DBEdit1Exit(Sender: TObject);
begin
   if Sender is TDBEdit then begin
      if (Sender as TDBEdit).Color = clYellow then (Sender as TDBEdit).ParentColor := True;
   end else if Sender is TDBCheckBox then begin
      if (Sender as TDBCheckBox).Color = clYellow then (Sender as TDBCheckBox).ParentColor := True;
   end;
end;

procedure TPagamentiForm.DBEdit4Enter(Sender: TObject);
begin
   if (Sender as TDBEdit).Color = clWhite then (Sender as TDBEdit).Color := clYellow;
end;

procedure TPagamentiForm.DBEdit4Exit(Sender: TObject);
begin
   if (Sender as TDBEdit).Color = clYellow then (Sender as TDBEdit).Color := clWhite;
end;

procedure TPagamentiForm.DBCheckBox2Enter(Sender: TObject);
begin
   if RxSpeedModifica.Down then begin
      (Sender as TDBCheckbox).Color      := clYellow;
      (Sender as TDBCheckbox).Font.Color := clBlack;
   end;
end;

procedure TPagamentiForm.DBCheckBox2Exit(Sender: TObject);
begin
   if RxSpeedModifica.Down then begin
      (Sender as TDBCheckbox).Color     := clOlive;
      (Sender as TDBCheckbox).Font.Color := clYellow;
   end;
end;

procedure TPagamentiForm.DBRadioGroup2Enter(Sender: TObject);
begin
   if RxSpeedModifica.Down then begin
      (Sender as TDBRadioGroup).Color      := clYellow;
      (Sender as TDBRadioGroup).Font.Color := clBlack;
   end;
end;

procedure TPagamentiForm.DBRadioGroup2Exit(Sender: TObject);
begin
   if RxSpeedModifica.Down then begin
      (Sender as TDBRadioGroup).Color      := clOlive;
      (Sender as TDBRadioGroup).Font.Color := clYellow;
   end;
end;

procedure TPagamentiForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('MODALITA DI PAGAMENTO');
end;

procedure TPagamentiForm.Grid1DblClick(Sender: TObject);
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: ANAGCLI (AnagCliForm) ---> Angrafica soggetti
      999: begin
              AnagCliForm.QrySoggPagamento.Value    := QryPagamCodice.AsInteger;
              AnagCliForm.DescrizionePagamento.Text := QryPagamDescrizione.AsString;
              Close;
              AnagCliForm.DescrizionePagamento.SetFocus;
           end;
      // Form chiamante: DOCUMENTO (PreventiviOrdiniForm) --->
      998: begin
              PreventiviOrdiniForm.QryDocumentoPagamento.Value := QryPagamCodice.AsInteger;
              PreventiviOrdiniForm.DescrizionePagamento.Text := QryPagamDescrizione.AsString;
              Close;
              PreventiviOrdiniForm.DescrizionePagamento.SetFocus;
           end;
      // Form chiamante: CHECKIN (CheckInForm) --->
      997: begin
              PreventiviOrdiniForm.QryDocumento.Edit;
              PreventiviOrdiniForm.QryDocumentoPagamento.Value := QryPagamCodice.AsInteger;
              PreventiviOrdiniForm.QryDocumento.Post;
              PreventiviOrdiniForm.DescrizionePagamento.Text := QryPagamDescrizione.AsString;
              ChekInForm.EditPagamento.Text := QryPagamDescrizione.AsString;
              Close;
              ChekInForm.EditPagamento.SetFocus;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TPagamentiForm.Grid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then Grid1DblClick(Self);
end;

procedure TPagamentiForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
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

procedure TPagamentiForm.DescrizioneEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TPagamentiForm.DescrizioneExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TPagamentiForm.tvListDblClick(Sender: TObject);
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: ANAGCLI (AnagCliForm) ---> Angrafica soggetti
      999: begin
              AnagCliForm.QrySoggPagamento.Value    := QryPagamCodice.AsInteger;
              AnagCliForm.DescrizionePagamento.Text := QryPagamDescrizione.AsString;
              Close;
              AnagCliForm.DescrizionePagamento.SetFocus;
           end;
      // Form chiamante: DOCUMENTO (PreventiviOrdiniForm) --->
      998: begin
              PreventiviOrdiniForm.QryDocumentoPagamento.Value := QryPagamCodice.AsInteger;
              PreventiviOrdiniForm.DescrizionePagamento.Text := QryPagamDescrizione.AsString;
              Close;
              PreventiviOrdiniForm.DescrizionePagamento.SetFocus;
           end;
      // Form chiamante: CHECKIN (CheckInForm) --->
      997: begin
              PreventiviOrdiniForm.QryDocumento.Edit;
              PreventiviOrdiniForm.QryDocumentoPagamento.Value := QryPagamCodice.AsInteger;
              PreventiviOrdiniForm.QryDocumento.Post;
              PreventiviOrdiniForm.DescrizionePagamento.Text := QryPagamDescrizione.AsString;
              ChekInForm.EditPagamento.Text := QryPagamDescrizione.AsString;
              Close;
              ChekInForm.EditPagamento.SetFocus;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TPagamentiForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(tvList);
end;

end.
