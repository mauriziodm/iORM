unit SchedaTesti;

interface
                                                                                                                                                                    
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  Buttons, Menus, bmpPanel, MAURI_SB, DB,
  Variants, cxControls, cxSplitter, FormAllegati, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TTestiForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    FormMainPanel: TPanel;
    ClientArea: TPanel;
    PanelNumDataDocumento: TPanel;
    Shape1: TShape;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit12: TDBEdit;
    PanelDestinatario: TPanel;
    Label16: TLabel;
    BitBtnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    DBText1: TDBText;
    DBERagSocCli: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit2: TDBEdit;
    PanelCorpo: TPanel;
    Label48: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    OpenButton: TSpeedButton;
    SaveButton: TSpeedButton;
    CutButton: TSpeedButton;
    CopyButton: TSpeedButton;
    PasteButton: TSpeedButton;
    LeftAlign: TSpeedButton;
    CenterAlign: TSpeedButton;
    RightAlign: TSpeedButton;
    SBFont: TSpeedButton;
    DBEOggetto: TDBEdit;
    DBENote: TDBEdit;
    RichEdit1: TRichEdit;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    DBEDataDoc: TcxDBDateEdit;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    PanelCantiere: TPanel;
    LabelCantiere: TLabel;
    BitBtnPratica1: TSpeedButtonRollOver;
    DbeDescrizioneCantiere: TcxTextEdit;
    Panel5: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    LabelPanelPraticheCaption: TLabel;
    BitBtnPratica1_Old: TSpeedButtonRollOver;
    BitBtnPratica2: TSpeedButtonRollOver;
    BitBtnPratica3: TSpeedButtonRollOver;
    Label32: TLabel;
    Label33: TLabel;
    Label38: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    EditDescrizionePratica1: TEdit;
    EditDescrizionePratica2: TEdit;
    EditDescrizionePratica3: TEdit;
    LabelStatoDocumento: TLabel;
    DBEditStatoDocumento: TDBEdit;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    PopupMenuAzzeraCantiereImpianto: TPopupMenu;
    Deselezionacantiereimpianto1: TMenuItem;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure CenterAlignClick(Sender: TObject);
    procedure RightAlignClick(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure BitBtnPratica2Click(Sender: TObject);
    procedure BitBtnPratica3Click(Sender: TObject);
    procedure DBEditStatoDocumentoChange(Sender: TObject);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure VisualizzaTesto;
    procedure SalvaTesto;
    procedure DBEdit12Enter(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure SBFontClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure BitBtnClienteClick(Sender: TObject);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PanelAllegatiResize(Sender: TObject);
    procedure EditDescrizionePratica1Change(Sender: TObject);
    procedure DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
    procedure Deselezionacantiereimpianto1Click(Sender: TObject);
    procedure AzzeraStato1Click(Sender: TObject);
    procedure DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    TextPath:String;

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    // Puntatore alla form degli Allegati relativa a questa form stessa
    fAllegatiForm: TAllegatiForm;
    procedure Allegati_AggiornaDatiFiltri;
    procedure Allegati_CreaForm;
    procedure Allegati_VerificaAbilitazione;
    // =========================================================================
    procedure CaricaTitoli;
  public
    { Public declarations }
     GoCambioAttributi: Boolean;
     // Queste contengono i riferimenti al record da visualizzare/editare
     CodiceTesto:Longint;
     DataTesto:TDate;
     CodiceCliente,CodicePratica,DataPratica : String;

     procedure CaricaCantiere;
  end;

var
  TestiForm: TTestiForm;

implementation

uses DataModule1, QRTesti, main, FormHelp, DataModule2;

{$R *.DFM}




// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che crea la form degli allegati se questa non esiste già e la
  //  apre, alla fine esegue l'interrogazione per mostrare gli allegati.
  procedure TTestiForm.Allegati_CreaForm;
  begin
    // Se la form degli allegati non è stata ancora creata la crea.
    if not Assigned(fAllegatiForm) then begin
      // Crea la form degli allegati
      fAllegatiForm := MainForm.Allegati_CreaForm(PanelAllegati);
      // Passa lo Splitter alla finestra degli allegati
      fAllegatiForm.Splitter := SplitterAllegati;
      // Parte con lo splitter chiuso
//      SplitterAllegati.CloseSplitter;
    end;
    // Imposta i filtri
    Allegati_AggiornaDatiFiltri;
  end;

  // Procedure che aggiorna i filtri di collegamento della form degli allegati
  //  con la form attuale
  procedure TTestiForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not DM1.TableTestiCLIENTE.IsNull then fAllegatiForm.Filter_CodSogg := DM1.TableTestiCLIENTE.Value;

    // Codice Pratica
    if not DM1.TableTestiPRATICA.IsNull then fAllegatiForm.Filter_CodPrat := DM1.TableTestiPRATICA.Value;
    // Data Pratica
    if not DM1.TableTestiDATAPRATICA1.IsNull then fAllegatiForm.Filter_DataPrat := DM1.TableTestiDATAPRATICA1.Value;

    // Tipo Documento
    fAllegatiForm.Filter_TipoDoc := 'Lettera';
    // Registro Documento
    //  NB: LA dichiarazione di conformità non ha registro
    fAllegatiForm.Filter_RegDoc := '';
    // Numero documento
    if not DM1.TableTestiCODICE.IsNull then fAllegatiForm.Filter_NumDoc := DM1.TableTestiCODICE.Value;
    // Data documento
    if not DM1.TableTestiDATA.IsNull then fAllegatiForm.Filter_DataDoc := DM1.TableTestiDATA.Value;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TTestiForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (DM1.TableTesti.State = dsInsert) then begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end else begin
      Allegati_CreaForm;
      SplitterAllegati.Enabled := True;
    end;
  end;

procedure TTestiForm.AzzeraStato1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    DM1.TableTestiSTATODESCRIZIONE.Clear;
    DM1.TableTestiSTATOFOREGROUND.Clear;
    DM1.TableTestiSTATOBACKGROUND.Clear;
    DBEOggetto.SetFocus;
    DBEditStatoDocumento.SetFocus;
  end;
end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================












procedure TTestiForm.VisualizzaTesto;
var
   ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  DM1.TableTestiTextFile.SaveToStream(ms);
  ms.Position := 0;
  RichEdit1.Lines.LoadFromStream(ms);
  ms.Free;
end;

procedure TTestiForm.SalvaTesto;
var
   ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  RichEdit1.Lines.SaveToStream(ms);
  ms.Position := 0;
  DM1.TableTestiTextFile.LoadFromStream(ms);
  ms.Free;
end;



procedure TTestiForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TTestiForm.RxSpeedModificaClick(Sender: TObject);
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
          // Richiama questa funzione per rivisualizzare il file di testo
          //  aggiornato nel caso qualcuno lo avesse modificato.
          VisualizzaTesto;
          // Abilita la modifica dei campi
          DM1.TableTesti.Edit;
          RxSpeedButtonStampa.Enabled        := False;
          RxSpeedButtonFax.Enabled           := False;
          RxSpeedButtonUscita.Enabled        := False;
          BitBtnSelezioneStato.Enabled       := True;
          BitBtnPratica1.Enabled             := True;
          BitBtnCliente.Enabled              := True;
          DM1.ColoraTuttiCampi(TestiForm, COLOR_MODIFICA);
          // Disabilita i pulsanti del word processor
          SBFont.Enabled                     := True;
          OpenButton.Enabled                 := True;
          SaveButton.Enabled                 := True;
          CutButton.Enabled                  := True;
          CopyButton.Enabled                 := True;
          PasteButton.Enabled                := True;
          LeftAlign.Enabled                  := True;
          CenterAlign.Enabled                := True;
          RightAlign.Enabled                 := True;
          // Focus sul primo campo editabile
          DBENote.SetFocus;
          DBEOggetto.SetFocus;
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
          DM1.TableTesti.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice è nullo gli assegna il successivo
               if DM1.TableTestiCodice.IsNull then begin
                  DM1.TableTestiCodice.Value := DM1.NextCodice('TESTI', 'CODICE');
               end;
               // Salva il file del testo
               SalvaTesto;
               DM1.TableTesti.Post;

               // Decide se gli allegati devono essere già visibili oppure no.
               Allegati_VerificaAbilitazione;

          end else if MR = mrNo then begin
             if DM1.TableTesti.State = dsInsert then begin
                DM1.TableTesti.Cancel;
                Close;   // Altrimenti dà dei problemi
                Exit;
             end else begin
                DM1.TableTesti.Cancel;
             end;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          // Se il codice è nullo lo elimina
          if DM1.TableTestiCodice.IsNull then DM1.TableTesti.Delete;
          // Rimette a posto pulsanti e campi
          RxSpeedButtonStampa.Enabled        := True;
          RxSpeedButtonFax.Enabled           := True;
          RxSpeedButtonUscita.Enabled        := True;
          BitBtnSelezioneStato.Enabled       := False;
          BitBtnPratica1.Enabled             := False;
          BitBtnCliente.Enabled              := False;
          DM1.ColoraTuttiCampi(TestiForm, COLOR_NORMALE);
          // Riabilita i pulsanti del word processor
          SBFont.Enabled                     := False;
          OpenButton.Enabled                 := False;
          SaveButton.Enabled                 := False;
          CutButton.Enabled                  := False;
          CopyButton.Enabled                 := False;
          PasteButton.Enabled                := False;
          LeftAlign.Enabled                  := False;
          CenterAlign.Enabled                := False;
          RightAlign.Enabled                 := False;
          // Focus sul primo campo editabile
          DBENote.SetFocus;
          DBEOggetto.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               DM1.TableTesti.Edit;
          end;
       end;
     end;
end;


procedure TTestiForm.OpenButtonClick(Sender: TObject);
begin
  DM1.OpenDialog1.InitialDir := DM1.CurrDir;
  DM1.OpenDialog1.Filter := 'Rich Text Files (*.RTF)|*.RTF';
  if DM1.OpenDialog1.Execute then
  begin
    RichEdit1.Lines.LoadFromFile(DM1.OpenDialog1.FileName);
    RichEdit1.SetFocus;
  end;
end;

procedure TTestiForm.SaveButtonClick(Sender: TObject);
begin
  if DM1.SaveDialog1.Execute then
  begin
    if FileExists(DM1.SaveDialog1.FileName) then
      if MessageDlg(Format('File esistente; sovrascrivere %s', [DM1.SaveDialog1.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    RichEdit1.Lines.SaveToFile(DM1.SaveDialog1.FileName);
  end;
end;

procedure TTestiForm.CutButtonClick(Sender: TObject);
begin
  RichEdit1.CutToClipboard;
end;

procedure TTestiForm.CopyButtonClick(Sender: TObject);
begin
  RichEdit1.CopyToClipboard;
end;

procedure TTestiForm.PasteButtonClick(Sender: TObject);
begin
  RichEdit1.PasteFromClipboard;
end;

procedure TTestiForm.LeftAlignClick(Sender: TObject);
begin
   // Se p abilitato il cambio degli attributi del testo selezionato...
   if GoCambioAttributi then RichEdit1.Paragraph.Alignment := taLeftJustify;
end;

procedure TTestiForm.CaricaCantiere;
begin
   // Carica la descrizione della pratica
   if (not DM1.TableTestiPRATICA.IsNull)  and (not DM1.TableTestiDATAPRATICA1.IsNull) then
     DM1.CaricaDescrizionePratica(DM1.TableTestiPRATICA.Value,  DM1.TableTestiDATAPRATICA1.Value, EditDescrizionePratica1);
end;

procedure TTestiForm.CaricaTitoli;
begin
  // Caricamento titoli e etichette dei campi
  LabelCantiere.Caption   := DM1.DatiDocumento_LabelPratica;
end;

procedure TTestiForm.CenterAlignClick(Sender: TObject);
begin
   // Se p abilitato il cambio degli attributi del testo selezionato...
   if GoCambioAttributi then RichEdit1.Paragraph.Alignment := taCenter;
end;

procedure TTestiForm.RightAlignClick(Sender: TObject);
begin
   // Se p abilitato il cambio degli attributi del testo selezionato...
   if GoCambioAttributi then RichEdit1.Paragraph.Alignment := taRightJustify;
end;

procedure TTestiForm.RxSpeedButtonStampaClick(Sender: TObject);
begin
   // Stampa sulla stampante
   DM1.Attendere;
   Application.CreateForm(TTestiQR, TestiQR);
   TestiQR.FaxPrinting := False; 
   try
      TestiQR.StampaTesto(DM1.TableTestiCodice.Value, DM1.TableTestiData.Value);
      if DM1.SettaStampante(TestiQR, 0) then begin
         // IMposta il numero di pagine del report
         //  NB: Per fare questo effettua un altro prepare (uno viene fatto anche dalla
         //       funzione SettaStampante e il tutto è piuttosto inefficente, ma per il momento
         //       faccio così per maggior semplicità
         try
            TestiQR.Prepare;
            TestiQR.TotPag := TestiQR.QRPrinter.PageCount;
         finally
            TestiQR.QRPrinter.Free;
            TestiQR.QRPrinter := nil;
         end;
         // Stampa
         TestiQR.Print;
      end;
   finally
      TestiQR.Free;
      DM1.ChiudiAttendere;
   end;
end;

procedure TTestiForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(TestiForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Lettera)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
   // Calcola la dimensione massima del pannello del corpo della lettera
   PanelCorpo.Height := ClientArea.Height - PanelCorpo.Top - 3;
   RichEdit1.Height := PanelCorpo.Height - RichEdit1.Top - 5;

   // Setta il flag che abilita il cambio degli attributi del testo selezionato
   //  alla variazione dei controlli relativi.
   GoCambioAttributi := True;
   // Setta il percorso del file di testo a stringa nulla
   TextPath := '';
   // Carica l'icona del tipo documento visualizzato
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TTestiForm.FormKeyUp(Sender: TObject; var Key: Word;
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
      // F7 = Stampa
      118: begin
         if RxSpeedButtonStampa.Enabled then begin
            RxSpeedButtonStampa.Down := not RxSpeedButtonStampa.Down;
            RxSpeedButtonStampaClick(Self);
         end;
      end;

   end;
end;

procedure TTestiForm.FormShow(Sender: TObject);
begin
      DM1.FocusRefresh;
      // In base al valore di 'Tag' apre la form in diverse modalità...
      case Tag of
         // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
         1: begin
            DM1.TableTesti.Refresh;
            if DM1.TableTesti.Locate('Codice;Data', VarArrayOf([CodiceTesto,DataTesto]), []) then begin
               VisualizzaTesto;
            end else begin
               MessageDlg('Testo non trovata !', mtError, [mbOK], 0)
            end;
         end;
         // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
         2: begin
            DM1.TableTesti.Append;
             DM1.TableTestiData.Value         := Date;
             DM1.TableTestiCliente.Value      := StrToInt(CodiceCliente);
             if CodicePratica <> '' then DM1.TableTestiPratica.Value      := StrToInt(CodicePratica);
             if DataPratica <> ''   then DM1.TableTestiDataPratica1.Value := StrToDate(DataPratica);
             // Forza il carattere a quello che voglio io
             RichEdit1.DefAttributes.Name  := 'Times New Roman';
             RichEdit1.DefAttributes.Size  := 10;
             RichEdit1.DefAttributes.Style := [];
             RichEdit1.DefAttributes.Color := clBlack;
             // Clicca il pulsante modifica
             RxSpeedModifica.Down := True;
             RxSpeedModificaClick(Self);
         end;
      end;

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if DM1.ModCtrl(MOD_TESTI) > 1 then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;

   // Carica la descrizione della pratica
   CaricaCantiere;
end;

procedure TTestiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
end;

procedure TTestiForm.BitBtnPratica1Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(DM1.TableTestiPratica,
                        DM1.TableTestiDataPratica1,
                        nil,
                        DM1.TableTestiCliente,
                        DM1.TableTestiCliente.Value,
                        3);
end;

procedure TTestiForm.BitBtnPratica2Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(DM1.TableTestiPratica2,
                        DM1.TableTestiDataPratica2,
                        nil,
                        DM1.TableTestiCliente,
                        DM1.TableTestiCliente.Value,
                        3);
end;

procedure TTestiForm.BitBtnPratica3Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(DM1.TableTestiPratica3,
                        DM1.TableTestiDataPratica3,
                        nil,
                        DM1.TableTestiCliente,
                        DM1.TableTestiCliente.Value,
                        3);
end;

procedure TTestiForm.DBEditStatoDocumentoChange(Sender: TObject);
begin
   DBEditStatoDocumento.Font.Color := DM1.StrToColor(DM1.TableTestiStatoForeground.Value, clBlack);
   DBEditStatoDocumento.Color      := DM1.StrToColor(DM1.TableTestiStatoBackground.Value, clSilver);
end;

procedure TTestiForm.DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TTestiForm.Deselezionacantiereimpianto1Click(Sender: TObject);
begin
  if RxSpeedModifica.Down then
    DM2.ClearCantiereDoc(DM1.TableTestiPratica, DM1.TableTestiDataPratica1, DbeDescrizioneCantiere)
  else
    DM1.Messaggi('Levante', 'Il documento deve essere in modalità di modifica', '', [mbOk], 0, nil);
end;

procedure TTestiForm.EditDescrizionePratica1Change(Sender: TObject);
begin
  if DM1.TableTestiPRATICA.AsInteger > 0 then begin
    DbeDescrizioneCantiere.Text := DM1.TableTestiPRATICA.AsString + ' - ' + DM1.TableTestiDATAPRATICA1.AsString + ' - ' + EditDescrizionePratica1.Text;
  end else begin
    DbeDescrizioneCantiere.Text := '- - -';
  end;
end;

procedure TTestiForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
   // Richiama la selezione dello stato del documento
   DM1.SelezionaStato('Lettere', DM1.TableTesti, 0);
   DBEditStatoDocumento.Font.Color := DM1.StrToColor(DM1.TableTestiStatoForeground.Value, clBlack);
   DBEditStatoDocumento.Color      := DM1.StrToColor(DM1.TableTestiStatoBackground.Value, clSilver);
end;

procedure TTestiForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if Button = mbRight then begin
      // Anteprima di stampa
      Application.CreateForm(TTestiQR, TestiQR);
      try
         TestiQR.StampaTesto(DM1.TableTestiCodice.Value, DM1.TableTestiData.Value);
         // IMposta il numero di pagine del report
         //  NB: Per fare questo effettua un altro prepare (uno viene fatto anche dalla
         //       funzione SettaStampante e il tutto è piuttosto inefficente, ma per il momento
         //       faccio così per maggior semplicità
         try
            TestiQR.Prepare;
            TestiQR.TotPag := TestiQR.QRPrinter.PageCount;
         finally
            TestiQR.QRPrinter.Free;
            TestiQR.QRPrinter := nil;
         end;
         // Effettua la Preview
         TestiQR.Preview;
      finally
         TestiQR.Free;
      end;
   end;
end;

procedure TTestiForm.DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
begin
  if RxSpeedModifica.Down
  and (  (Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)  )
  then
    DM2.ClearCantiereDoc(DM1.TableTestiPRATICA, DM1.TableTestiDATAPRATICA1, DbeDescrizioneCantiere);
end;

procedure TTestiForm.DBEdit12Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TTestiForm.DBEdit12Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TTestiForm.SBFontClick(Sender: TObject);
begin
   DM1.FontDialog1.Font.Name := RichEdit1.SelAttributes.Name;
   DM1.FontDialog1.Font.Size := RichEdit1.SelAttributes.Size;
   DM1.FontDialog1.Font.Style := RichEdit1.SelAttributes.Style;
   DM1.FontDialog1.Font.Height := RichEdit1.SelAttributes.Height;
   DM1.FontDialog1.Font.Pitch := RichEdit1.SelAttributes.Pitch;
   DM1.FontDialog1.Font.Color := RichEdit1.SelAttributes.Color;
   If DM1.FontDialog1.Execute then begin
      RichEdit1.SelAttributes.Name    := DM1.FontDialog1.Font.Name;
      RichEdit1.SelAttributes.Size    := DM1.FontDialog1.Font.Size;
      RichEdit1.SelAttributes.Style   := DM1.FontDialog1.Font.Style;
      RichEdit1.SelAttributes.Height  := DM1.FontDialog1.Font.Height;
      RichEdit1.SelAttributes.Pitch   := DM1.FontDialog1.Font.Pitch;
      RichEdit1.SelAttributes.Color   := DM1.FontDialog1.Font.Color;
   end;
end;



procedure TTestiForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('LETTERE');
end;

procedure TTestiForm.BitBtnClienteClick(Sender: TObject);
begin
   DM1.SelezionaCliente(DM1.TableTestiCliente, DM1.TableTestiPRATICA, DM1.TableTestiDATAPRATICA1, '');
end;

procedure TTestiForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(DM1.TableTestiCliente.Value);
end;

procedure TTestiForm.FormResize(Sender: TObject);
begin
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(Self, FormMainPanel, ClientArea, SplitterAllegati, True, True);
   // Ricalcola la dimensione verticale del pannello del testo
   PanelCorpo.Height := ClientArea.Height - PanelCorpo.Top;
   RichEdit1.Height  := PanelCorpo.Height - RichEdit1.Top - 5; 
end;

procedure TTestiForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

procedure TTestiForm.PanelAllegatiResize(Sender: TObject);
begin
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(Self, FormMainPanel, ClientArea, SplitterAllegati, True, True);
end;

end.
