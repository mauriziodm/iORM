unit FormAliquoteIVA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls,
  bmpPanel, ComCtrls, cxCustomData, 
  cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit,
  cxDropDownEdit, cxCheckBox, cxDBLookupComboBox, cxButtonEdit,
  cxGridLevel, cxGridCardView, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, DB, cxDBData, cxGridDBTableView,
  Buttons, cxStyles, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, cxGridCustomLayoutView,
  cxContainer, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBEdit, Vcl.ImgList;

type
  TAliquoteIVAForm = class(TForm)
    ClientArea: TPanel;
    ClientTopPanel: TbmpPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    RichEdit2: TRichEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
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
    lvList: TcxGridLevel;
    tvList: TcxGridDBTableView;
    tvListCODICEIVA: TcxGridDBColumn;
    tvListDESCRIZIONEIVA: TcxGridDBColumn;
    tvListALIQUOTAIVA: TcxGridDBColumn;
    tvListEXPORT_CODICE: TcxGridDBColumn;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    Label8: TLabel;
    cxDBLookupComboBoxNaturaIVA: TcxDBLookupComboBox;
    Label9: TLabel;
    tvListPA_NATURA: TcxGridDBColumn;
    cxDBCheckBox1: TcxDBCheckBox;
    tvListENABLED: TcxGridDBColumn;
    ImageList1: TImageList;
    cbAttiva: TcxDBCheckBox;
    Label31: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvListENABLEDGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    procedure FiltraSoloAttive;
  public
  end;

var
  AliquoteIVAForm: TAliquoteIVAForm;

implementation

uses main, DataModule1, FormHelp, SchedaPreventiviOrdini, FormAnagCli, FormConfirm;

{$R *.DFM}

procedure TAliquoteIVAForm.FormClose(Sender: TObject;
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
   AliquoteIVAForm := nil;
end;

procedure TAliquoteIVAForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(AliquoteIVAForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Aliquote IVA)';
   // Imposta la ClientArea
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
end;

procedure TAliquoteIVAForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TAliquoteIVAForm.FiltraSoloAttive;
var
  DC: TcxCustomDataController;
begin
  DC := tvList.DataController;
  DC.Filter.BeginUpdate;
  try
    DC.Filter.Root.Clear;
    DC.Filter.Root.AddItem(tvListENABLED, foNotEqual, 'F', 'Non attive');
  finally
    DC.Filter.EndUpdate;
    DC.Filter.Active := True;
  end;
end;

procedure TAliquoteIVAForm.FormShow(Sender: TObject);
begin
     // Rende visibile solo la griglia e nascosti i campi
     GridList.Visible := True;
     GridList.Align := alClient;

     if Tag <> 0 then
       FiltraSoloAttive;

     DM1.FocusRefresh;
     GridList.SetFocus;
     tvList.DataController.GotoFirst;
end;

procedure TAliquoteIVAForm.RxSpeedButtonUscitaClick(Sender: TObject);
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

procedure TAliquoteIVAForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // -----------------------------------------------------------------
       // Le aliquote NON SONO MODIFICABILI DALL'UTENTE (1° e 2° messaggio)
       //  NB: La prima condizione serve per l'"aggiungi"
       if (not (DM1.TableAliquoteIVA.State in [dsInsert])) and (not TConfirmForm.AuthorizationRequest) then
       begin
         RxSpeedModifica.Down := False;
         Exit;
       end;
       // -----------------------------------------------------------------
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          DM1.TableAliquoteIVA.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          GridList.Enabled                  := False;
          DM1.ColoraTuttiCampi(AliquoteIVAForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          DBEdit2.SetFocus;
          DBEdit1.SetFocus;
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
          DM1.TableAliquoteIVA.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Spoista il focus in modo che anche il campo attualmente in editing venga confermato
               DBEdit2.SetFocus;
               DBEdit1.SetFocus;
               // Alcuni controlli
               if  DM1.TableAliquoteIVACODICEIVA.IsNull then raise Exception.Create('Codice IVA non inserito.');
               if  DM1.TableAliquoteIVACODICEIVA.AsInteger = 0 then raise Exception.Create('Codice IVA non valido');
               if  DM1.TableAliquoteIVAALIQUOTAIVA.IsNull then DM1.TableAliquoteIVAALIQUOTAIVA.Value := 0;
               // COnferma del record
               DM1.TableAliquoteIVASINCHRO.Value := RECORD_MODIFIED;
               DM1.TableAliquoteIVA.Post;
          end else if MR = mrNo then begin
               DM1.TableAliquoteIVA.Cancel;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled        := True;
          GridList.Enabled                  := True;
          DM1.ColoraTuttiCampi(AliquoteIVAForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DBEdit2.SetFocus;
          DBEdit1.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               DM1.TableAliquoteIVA.Edit;
          end;
       end;
     end;
end;

procedure TAliquoteIVAForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // -----------------------------------------------------------------
   // Le aliquote NON SONO MODIFICABILI DALL'UTENTE (1° e 2° messaggio)
   //  NB: La prima condizione serve per l'"aggiungi"
   if not TConfirmForm.AuthorizationRequest then
     Exit;
   // -----------------------------------------------------------------
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);
   DBEdit1.SetFocus;                    // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)
   DM1.TableAliquoteIVA.Append;
   DM1.TableAliquoteIVAENABLED.Value := 'T';
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TAliquoteIVAForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  DM1.TableAliquoteIVA.Delete;
end;

procedure TAliquoteIVAForm.DBEdit1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TAliquoteIVAForm.DBEdit1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TAliquoteIVAForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('ALIQUOTE IVA');
end;

procedure TAliquoteIVAForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
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

procedure TAliquoteIVAForm.FormResize(Sender: TObject);
begin
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
end;

procedure TAliquoteIVAForm.tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il record attuale è disabilitato..
  if AViewInfo.GridRecord.DisplayTexts[tvListENABLED.Index] <> 'T' then
  begin
    // Imposta un colore da secondo piano
    ACanvas.Font.Color := clGray;
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clSilver;
    // Se stiamo proprio traccianto la colonna ENABLED...
    if AViewInfo.Item.Index = tvListENABLED.Index then begin
      // Disegna il rettangolo di sfondo
      ACanvas.FillRect(AViewInfo.Bounds);
      // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
      ACanvas.DrawImage(ImageList1, (AViewInfo.Bounds.Left + AViewInfo.Bounds.Right - ImageList1.Width) div 2, (AViewInfo.Bounds.Top + AViewInfo.Bounds.Bottom - ImageList1.Height) div 2, 0);
      // Custom Draw
      ADone := True;
    end;
  end
  // Se invece è una riga normale (abilitata) forso il colore dello sfondo
  //  perchè altrimenti sarebbe con lettura facilitata ma siccome ho aggiunto il grigio scuro per
  //  le righe disabilitate mi sembravano troppi colori
  else
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clWhite;
end;

procedure TAliquoteIVAForm.tvListDblClick(Sender: TObject);
var
  i, RI, PrecFocusedRecordIndex, SelRec: Integer;
  TV: TcxGridTableView;
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini - Rigo)
      999: begin
              // Importa l'aliquotaIVA nel rigo corrente
//              PreventiviOrdiniForm.tvCorpo.DataController.BeginUpdate;
              PreventiviOrdiniForm.BeginUpdate;
              DM1.ShowWait('Levante', 'Operazione in corso');
              try
                // Continua solo se la View selezionata della GridCorpo è una TableView
                if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then
                begin
                  // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
                  TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
                  // Salva l'indice del focused record attuale
                  PrecFocusedRecordIndex := TV.DataController.FocusedRecordIndex;
                  // cicla per tutti i records selezionati
                  SelRec := TV.Controller.SelectedRecordCount;
                  for i := 0 to SelRec -1 do
                  begin
                    // Aggiorna lo schermo
                    DM1.ShowWait('Levante', Format('Operazione in corso (riga %d su %d)', [i, SelRec]));
                    // Rende focused il record selezionato attuale
                    TV.Controller.SelectedRecords[i].Focused := True;
                    // Se è un rigo di riferimento lo salta
                    if (   (DM1.NoNullIntValue(TV.DataController,TV.DataController.FocusedRecordIndex,PreventiviOrdiniForm.tvCorpoCODICEIVA.Index) <> -9)
                    and (DM1.StrLeft(DM1.NoNullStringValue(TV.DataController,TV.DataController.FocusedRecordIndex,PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index), 4) <> '--->')   )
                    then
                    begin
                      // Aggiorna i valori dei campi
                      with TV.DataController do begin
                         Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEIVA.Index]      := DM1.TableAliquoteIVACodiceIVA.Value;
                         Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoALIQUOTAIVA.Index]    := DM1.TableAliquoteIVAAliquotaIVA.Value;
                         Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Index] := DM1.TableAliquoteIVADescrizioneIVA.Value;
                      end;
  //                    PreventiviOrdiniForm.CalcolaPerModificaPrezzoUnitario(TV.DataController.FocusedRecordIndex, TV.DataController);
  //                    PreventiviOrdiniForm.CalcolaImportoRigo(TV.DataController, TV.DataController.FocusedRecordIndex);
                      // Aggiorna il documento con il nuovo valore
                      PreventiviOrdiniForm.tvCorpoEditValueChanged(TV, TV.Columns[PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Index]);
                    end;
                  end;
                  // Ripristina il selected record index
                  TV.DataController.FocusedRecordIndex := PrecFocusedRecordIndex;
                end;
              finally
                DM1.CloseWait;
                PreventiviOrdiniForm.EndUpdate;
              end;
              // CHiude la form dell'IVA
              Close;
              PreventiviOrdiniForm.GridCorpo.SetFocus;
           end;

      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini - Tutto il documento)
      998: begin
              // Carica l'aliquota iva selezionata come aliquota IVA forzata del documento
              PreventiviOrdiniForm.QryDocumentoCODICEIVAFORZATA.Value := DM1.TableAliquoteIVACodiceIVA.Value;
              // CHiude la form dell'IVA
              Close;
              PreventiviOrdiniForm.DBEForzaIVA.SetFocus;
           end;
      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini - Selezione cumulativa partita IVA righi selezionati)
      997: begin
              // CHiede prima conferma
              if DM1.Messaggi('Selezione cumulativa aliquota IVA', 'Confermi di voler assegnare l''aliquota IVA scelti ai tutti i righi selezionati del documento?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
              // Assegna a tutti i righi selezionati del documento i sottocantieri scelti
              //  nell'apposito pannello di scelta cumulativa.
              try
                PreventiviOrdiniForm.tvCorpo.DataController.BeginUpdate;
                // Cicla per tutti i righi selezionati
                for i := 0 to PreventiviOrdiniForm.tvCorpo.Controller.SelectedRecordCount -1 do
                begin
                  RI := PreventiviOrdiniForm.tvCorpo.Controller.SelectedRecords[i].RecordIndex;
                  with PreventiviOrdiniForm.tvCorpo.DataController do begin
                     Values[RI, PreventiviOrdiniForm.tvCorpoCODICEIVA.Index]      := DM1.TableAliquoteIVACodiceIVA.Value;
                     Values[RI, PreventiviOrdiniForm.tvCorpoALIQUOTAIVA.Index]    := DM1.TableAliquoteIVAAliquotaIVA.Value;
                     Values[RI, PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Index] := DM1.TableAliquoteIVADescrizioneIVA.Value;
                  end;
                  PreventiviOrdiniForm.CalcolaPerModificaPrezzoUnitario(RI, PreventiviOrdiniForm.tvCorpo.DataController);
                  PreventiviOrdiniForm.CalcolaImportoRigo(PreventiviOrdiniForm.tvCorpo.DataController, RI);
                end;
                // Se abilitato e necessario ricalcola i totali del documento
                PreventiviOrdiniForm.CalcolaTotali(False);
              finally
                PreventiviOrdiniForm.tvCorpo.EndUpdate;
                // CHiude la form dell'IVA
                Close;
                PreventiviOrdiniForm.DBEForzaIVA.SetFocus;
              end;
           end;
      // Form chiamante: ANAGRAFICA SOGGETTO
      996: begin
              // Carica l'aliquota iva selezionata come aliquota IVA forzata del documento
              AnagCliForm.QrySoggCODICEIVA.Value := DM1.TableAliquoteIVACodiceIVA.Value;
              // CHiude la form dell'IVA
              Close;
              AnagCliForm.DBEForzaIVA.SetFocus;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TAliquoteIVAForm.tvListENABLEDGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure TAliquoteIVAForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(tvList);
end;

end.
