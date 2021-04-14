unit FormMultiregistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics,
  cxEdit, DB, cxDBData, cxTextEdit, IB_Components,
  IBODataset, bmpPanel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, IniFiles,
  cxGridCustomView, cxGrid, Buttons, Mask, DBCtrls, StdCtrls, ComCtrls,
  ExtCtrls, MAURI_SB, cxCalendar, cxTimeEdit, cxCurrencyEdit, cxCheckBox,
  cxMemo, cxCheckComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TMultiregistroForm = class(TForm)
    ClientArea: TPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    DBEditRegistro: TDBEdit;
    PanelGriglia: TPanel;
    Panel1: TPanel;
    GridList: TcxGrid;
    tvList: TcxGridDBTableView;
    lvList: TcxGridLevel;
    ClientTopPanel: TbmpPanel;
    QryReg: TIBOQuery;
    SourceReg: TDataSource;
    tvListRegistro: TcxGridDBColumn;
    tvListNote: TcxGridDBColumn;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    RichEdit2: TRichEdit;
    DBEditNote: TDBEdit;
    SBPredefinito: TSpeedButtonRollOver;
    Label3: TLabel;
    QryRegREGISTRO: TStringField;
    QryRegPROGPREV: TIntegerField;
    QryRegPROGORDCLI: TIntegerField;
    QryRegPROGORDFORN: TIntegerField;
    QryRegPROGDDT: TIntegerField;
    QryRegPROGSAL: TIntegerField;
    QryRegPROGFATT: TIntegerField;
    QryRegPROGBOLLEENTRATA: TIntegerField;
    QryRegPROGFATTUREACQUISTO: TIntegerField;
    QryRegPROGRICEVUTEFISCALI: TIntegerField;
    QryRegPROGNOTEACCREDITO: TIntegerField;
    QryRegPROGBUONICONSEGNA: TIntegerField;
    QryRegNOTE: TStringField;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    QryRegEXPORT_CODICE: TStringField;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure EseguiQueryRegistri;
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvListCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvListKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditRegistroEnter(Sender: TObject);
    procedure DBEditRegistroExit(Sender: TObject);
    procedure SBPredefinitoClick(Sender: TObject);
    procedure CaricaFormLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MultiregistroForm: TMultiregistroForm;

implementation

uses FormHelp, DataModule1, main, SchedaClienti;

{$R *.dfm}

procedure TMultiregistroForm.CaricaFormLayout;
begin
   // ------ CARICAMENTO PULSANTI E BOTTONI
   SBPredefinito.Glyph.LoadFromFile(DM1.TemaDir + 'btn_predefinito.bmp');
end;


procedure TMultiregistroForm.EseguiQueryRegistri;
begin
   // Esegue la query
   if QryReg.Active then QryReg.Close;
   QryReg.Open;
end;

procedure TMultiregistroForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if PanelGriglia.Visible then begin
      Close;
   end else begin
      // Griglia visibile che copre il resto
      PanelGriglia.Visible                     := True;
      // Risistema i pulsanti per la fase di elenco
      RxSpeedModifica.Enabled           := False;
      RxSpeedButtonNuovo.Enabled        := True;
      RxSpeedButtonElimina.Enabled      := True;
      RxSpeedButtonVisualizza.Enabled   := True;
   end;
end;

procedure TMultiregistroForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

procedure TMultiregistroForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Se la query non è attiva esce
     if not QryReg.Active then begin
        RxSpeedModifica.Down := False;
        Exit;
     end;
     // Se il registro che si sta tentando di modificare/confermare è il
     //  registro dei documenti esterni, annulla l'operazione per sicurezza
     if QryReg.FieldByName('REGISTRO').AsString = EXT_DOC_REGISTRO then begin
        RxSpeedModifica.Down := not RxSpeedModifica.Down;
        DM1.Messaggi('Multiregistro', 'Il registro "' + EXT_DOC_REGISTRO + '" non è modificabile.', '', [mbOk], 0, nil);
        Exit;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryReg.Edit;
          RxSpeedButtonUscita.Enabled    := False;
          PanelGriglia.Enabled           := False;
          DM1.ColoraTuttiCampi(MultiregistroForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          DBEditNote.SetFocus;
          DBEditRegistro.SetFocus;
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
          QryReg.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
             // Esegue degli spostamenti del focus perchè altrimenti se
             //  l'utente non è uscito dal campo, quest'ultimo non è ancora
             //  stato aggiornato.
             DBEditRegistro.SetFocus;
             DBEditNote.SetFocus;
             DBEditRegistro.SetFocus;
             // Se il registro che si stà confermando contiene degli spazi, ritorna un errore
             //  e annulla la conferma
             if Pos(' ', QryReg.FieldByName('REGISTRO').AsString) <> 0 then begin
                RxSpeedModifica.Down := not RxSpeedModifica.Down;
                DM1.Messaggi('Multiregistro', 'Il registro "' + QryReg.FieldByName('REGISTRO').AsString + '" contiene uno o più SPAZI.'#13#13'Gli spazi NON sono ammessi.', '', [mbOk], 0, nil);
                Exit;
             end;
             QryReg.Post;
             QryReg.ApplyUpdates;
             QryReg.CommitUpdates;
          end else if MR = mrNo then begin
             QryReg.Cancel;
             QryReg.CommitUpdates;
          end else begin
             RxSpeedModifica.Down := True;
             Exit;
          end;

          RxSpeedButtonUscita.Enabled := True;
          PanelGriglia.Enabled        := True;
          DM1.ColoraTuttiCampi(MultiregistroForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DBEditNote.SetFocus;
          DBEditRegistro.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryReg.Edit;
          end;
       end;
     end;
end;

procedure TMultiregistroForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);

   DBEditRegistro.SetFocus;                    // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)

   // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
   if not QryReg.Active then begin
      QryReg.Close;
      QryReg.SQL.Clear;
      QryReg.SQL.Add('SELECT *');
      QryReg.SQL.Add('FROM PROGREG');
      QryReg.SQL.Add('WHERE REGISTRO = ''XYXYX''');
      QryReg.Open;
   end;

   QryReg.Append;
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TMultiregistroForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Chiede prima conferma
  if DM1.Messaggi('Elimina Registro', 'Vuoi veramente eliminare il registro ?', 'NB: Prima di continuare si consiglia di effettuare una copia di sicurezza dell''azienda.', [mbYes,mbNo], 0, nil) = mrYes then begin
     if DM1.Messaggi('Elimina Registro', 'Sicuro/a ?', 'NB: Prima di continuare si consiglia di effettuare una copia di sicurezza dell''azienda.', [mbYes,mbNo], 0, nil) = mrYes then begin
        // Elimina l'articolo corrente
        QryReg.Delete;
        QryReg.ApplyUpdates;
        QryReg.CommitUpdates;
     end;
  end;
end;

procedure TMultiregistroForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   EseguiQueryRegistri;
   GridList.SetFocus;
   DM1.ChiudiAttendere;
end;

procedure TMultiregistroForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
   // Aggiorna l'aspetto della form per farla passare alla modalità Anagrafica
   // ------------------------------------------------------------------------
   // Griglia invisibile
   PanelGriglia.Visible := False;
   // Aggiorna lo stato dei pulsanti per la modalità Anagrafica
   RxSpeedModifica.Enabled           := True;
   RxSpeedButtonNuovo.Enabled        := False;
   RxSpeedButtonElimina.Enabled      := False;
   RxSpeedButtonVisualizza.Enabled   := False;
end;

procedure TMultiregistroForm.RxSpeedButtonVisualizzaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := False;
   // Cerca di riconoscere il mittente per accettare o meno l'operazione
   // ------------------------------------------------------------------
   // Se il mittente proviene da una TcxGrid o TcxView...
   //  Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
   //  che le griglie DevExpress passano surante il DragAndDrop.
   if Source is TcxDragControlObject then begin
      // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
      if TcxDragControlObject(Source).Control is TcxGridSite then begin
         // La vista diventa il controllo predefinito per comodità
         with TcxGridSite(TcxDragControlObject(Source).Control).GridView do begin
            // Controlla se la vista è tra quelle da riconoscere
            if (Name = 'tvList')
            then accept := True;
         end;
      end;
   end;
end;

procedure TMultiregistroForm.FormClose(Sender: TObject;
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
   MultiregistroForm := nil;
end;

procedure TMultiregistroForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(MultiregistroForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Multiregistro)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TMultiregistroForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TMultiregistroForm.FormShow(Sender: TObject);
begin
   // Rende visibile solo la griglia e nascosti i campi
   PanelGriglia.Visible := True;
   PanelGriglia.Align := alClient;
   // Carica il layout della form
   CaricaFormLayout;

   DM1.FocusRefresh;
   RxSpeedButtonTrovaClick(Self);
end;

procedure TMultiregistroForm.tvListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   // Fà in modo che nel magazzino predefinito compaia la scritta (Predefinito) dopo il
   //  nome del magazzino stesso.
   // ---------------------------------------------------------------------------------
   // Se il record attuale è il magazzino predefinito...
   if AViewInfo.GridRecord.Values[tvListRegistro.Index] = DM1.RegistroDefault then begin
      // Sfondo
      ACanvas.FillRect(AViewInfo.Bounds);
      // La riga predefinita la scrive in Bold
      ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
      // Se si stà visualizzando proprio la colonna della descrizione aggiunge
      //  il testo 'Predefinito'...
      if AViewInfo.Item.Index = tvListRegistro.Index then begin
         ACanvas.DrawText(AViewInfo.Text + '   (Predefinito)', AViewInfo.TextAreaBounds, cxAlignHCenter or cxAlignVCenter);
      // ... Altrimenti no
      end else begin
         ACanvas.DrawText(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignVCenter);
      end;
      // Disabilita il visualizzazione di default.
      ADone := True;
   end;
end;

procedure TMultiregistroForm.tvListCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TMultiregistroForm.tvListDblClick(Sender: TObject);
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: SCHEDA CLIENTI FORM (Cambio registro documetni selezionati)
      999: begin
              ClientiForm.SetRegistroDocumentiSelezionati(QryReg.FieldByName('REGISTRO').Value);
              // CHiude la form del registro
              Close;
              ClientiForm.GridDoc.SetFocus;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TMultiregistroForm.tvListEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
      // In base al bersagio attiva la funzione corretta.
      if Target is TSpeedButton then begin
         TSpeedButton(Target).OnClick(Self);
      end;
   end;
end;

procedure TMultiregistroForm.tvListKeyPress(Sender: TObject;
  var Key: Char);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TMultiregistroForm.DBEditRegistroEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TMultiregistroForm.DBEditRegistroExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TMultiregistroForm.SBPredefinitoClick(Sender: TObject);
var
   P:TMemIniFile;
begin
   P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
   try
      // Chiede prima conferma
      if DM1.Messaggi('Registro Predefinito', 'Impostare il Registro selezionato come predefinito per questa stazione?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
         // Salva il magazzino di default della stazione
         DM1.RegistroDefault := tvList.Controller.FocusedRecord.Values[tvListRegistro.Index];
         P.WriteString('MULTIREGISTRO', 'RegistroDefault', DM1.RegistroDefault);
         // Aggiorna lo schermo
         tvList.DataController.RefreshExternalData;
      end;
   finally
      P.UpdateFile;
      P.Free;
   end;
end;

end.

