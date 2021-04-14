unit FormAnagMaga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IB_Components, IBODataset, Db, StdCtrls, ExtCtrls, DBCtrls, Mask, 
  bmpPanel, ComCtrls, cxCustomData,
  cxGraphics, cxEdit, cxDBData,
  cxTextEdit, cxCalendar, cxTimeEdit, cxCurrencyEdit, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, IniFiles, Buttons,
  MAURI_SB, cxMemo, cxCheckComboBox, cxDropDownEdit, cxImageComboBox,
  cxStyles, cxFilter, cxData, cxDataStorage, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator;

type
  TAnagMagaForm = class(TForm)
    ClientArea: TPanel;
    QueryAnagMaga: TIBOQuery;
    SourceAnagMaga: TDataSource;
    ClientTopPanel: TbmpPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    DBEditDescrizione: TDBEdit;
    DBEditCodice: TDBEdit;
    PanelGriglia: TPanel;
    Panel1: TPanel;
    GridList: TcxGrid;
    tvList: TcxGridDBTableView;
    lvList: TcxGridLevel;
    tvListCodice: TcxGridDBColumn;
    tvListMagazzino: TcxGridDBColumn;
    SBPredefinito: TSpeedButtonRollOver;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure EseguiQueryAnagMaga;
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure DBEditDescrizioneEnter(Sender: TObject);
    procedure DBEditDescrizioneExit(Sender: TObject);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvListEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvListKeyPress(Sender: TObject; var Key: Char);
    procedure RxSpeedButtonVisualizzaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure SBPredefinitoClick(Sender: TObject);
    procedure CaricaFormLayout;
    procedure QueryAnagMagaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AnagMagaForm: TAnagMagaForm;

implementation

uses main, DataModule1, FormHelp, SchedaPreventiviOrdini, SchedaArticoli1,
  SchedaClienti, Variants;

{$R *.DFM}

procedure TAnagMagaForm.CaricaFormLayout;
begin
   // ------ CARICAMENTO PULSANTI E BOTTONI
   SBPredefinito.Glyph.LoadFromFile(DM1.TemaDir + 'btn_predefinito.bmp');
end;


procedure TAnagMagaForm.EseguiQueryAnagMaga;
begin
   // Esegue la query
   if QueryAnagMaga.Active then QueryAnagMaga.Close;
   QueryAnagMaga.Open;
end;


procedure TAnagMagaForm.FormClose(Sender: TObject;
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
   AnagMagaForm := nil;
end;

procedure TAnagMagaForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(AnagMagaForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Archivio magazzini)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TAnagMagaForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TAnagMagaForm.FormShow(Sender: TObject);
begin
   // Rende visibile solo la griglia e nascosti i campi
   PanelGriglia.Visible := True;
   PanelGriglia.Align := alClient;
   // Carica il layout della form
   CaricaFormLayout;

   DM1.FocusRefresh;
   RxSpeedButtonTrovaClick(Self);
end;

procedure TAnagMagaForm.RxSpeedButtonUscitaClick(Sender: TObject);
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

procedure TAnagMagaForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

procedure TAnagMagaForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Se la query non è attiva esce
     if not QueryAnagMaga.Active then begin
        RxSpeedModifica.Down := False;
        Exit;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then begin
       // Prima di avviare la modifica controlla se il record è stato o meno creato da questa postazione e quindi
       //  se si è autorizzati alla sua modifica (se sincronizzazione attiva).
       if not DM1.ControlloSeModificabileDallaStazione(QueryAnagMaga.FieldByName('Codice').AsInteger) then begin RxSpeedModifica.Down := False; DM1.ChiudiAttendere; Exit; end;
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QueryAnagMaga.Edit;
          RxSpeedButtonUscita.Enabled    := False;
          PanelGriglia.Enabled           := False;
          DM1.ColoraTuttiCampi(AnagMagaForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          DBEditDescrizione.SetFocus;
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
          QueryAnagMaga.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice magazzino non c'è lo assegna automaticamente
               if Trim(QueryAnagMaga.FieldByName('Codice').AsString) = '' then begin
                  QueryAnagMaga.FieldByName('Codice').Value := DM1.NextCodice('ANAGMAGA', 'CODICE');
               end;
               QueryAnagMaga.FieldByName('SINCHRO').Value := 'M';   // Marca il record come modificato
               QueryAnagMaga.Post;
               QueryAnagMaga.ApplyUpdates;
               QueryAnagMaga.CommitUpdates;
          end else if MR = mrNo then begin
               QueryAnagMaga.Cancel;
               QueryAnagMaga.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled := True;
          PanelGriglia.Enabled        := True;
          DM1.ColoraTuttiCampi(AnagMagaForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DBEditDescrizione.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QueryAnagMaga.Edit;
          end;
       end;
     end;
end;

procedure TAnagMagaForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);

   DBEditDescrizione.SetFocus;                    // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)

   // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
   if not QueryAnagMaga.Active then begin
      QueryAnagMaga.Close;
      QueryAnagMaga.SQL.Clear;
      QueryAnagMaga.SQL.Add('SELECT *');
      QueryAnagMaga.SQL.Add('FROM ANAGMAGA');
      QueryAnagMaga.SQL.Add('WHERE CODICE = ''Non deve trovare nulla''');
      QueryAnagMaga.Open;
   end;

   QueryAnagMaga.Append;
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TAnagMagaForm.RxSpeedButtonEliminaClick(Sender: TObject);
var
   CodMag:Longint;
begin
  // CodMag contiene il codice del magazzino da eliminare
  CodMag := QueryAnagMaga.FIeldByName('Codice').AsInteger;
  // Chiede prima conferma
  if DM1.Messaggi('Elimina Magazzino', 'Vuoi veramente eliminare il magazzino ?', 'NB: L''eliminazione del magazzino comporterà la PERDITA di tutte le relative giacenze.'#13#13'Prima di continuare si consiglia di effettuare una copia di sicurezza dell''azienda.', [mbYes,mbNo], 0, nil) = mrYes then begin
     if DM1.Messaggi('Elimina Magazzino', 'Sicuro/a ?', 'NB: L''eliminazione del magazzino comporterà la PERDITA di tutte le relative giacenze.'#13#13'Prima di continuare si consiglia di effettuare una copia di sicurezza dell''azienda.', [mbYes,mbNo], 0, nil) = mrYes then begin
        if DM1.Messaggi('Elimina Magazzino', 'A T T E N Z I O N E !!!'#13#13'L''eliminazione del magazzino comporterà la PERDITA di tutte le relative giacenze.'#13#13'Prima di continuare si consiglia di effettuare una copia di sicurezza dell''azienda.', '', [mbYes,mbNo], 0, nil) = mrYes then begin
           // Elimina l'articolo corrente
           QueryAnagMaga.Delete;
           QueryAnagMaga.ApplyUpdates;
           QueryAnagMaga.CommitUpdates;
           // Elimina il magazzino da tutti gli articoli
//           DM1.EliminaMagazzino(CodMag);
        end;
     end;
  end;
end;

procedure TAnagMagaForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   EseguiQueryAnagMaga;
   GridList.SetFocus;
   DM1.ChiudiAttendere;
end;

procedure TAnagMagaForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
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

procedure TAnagMagaForm.DBEditDescrizioneEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TAnagMagaForm.DBEditDescrizioneExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TAnagMagaForm.tvListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   // Fà in modo che nel magazzino predefinito compaia la scritta (Predefinito) dopo il
   //  nome del magazzino stesso.
   // ---------------------------------------------------------------------------------
   // Se il record attuale è il magazzino predefinito...
   if AViewInfo.GridRecord.Values[tvListCodice.Index] = DM1.MagazzinoDefault then begin
      // Sfondo
      ACanvas.FillRect(AViewInfo.Bounds);
      // La riga predefinita la scrive in Bold
      ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
      // Se si stà visualizzando proprio la colonna della descrizione aggiunge
      //  il testo 'Predefinito'...
      if AViewInfo.Item.Index = tvListMagazzino.Index then begin
         ACanvas.DrawText(AViewInfo.Text + '   (Predefinito)', AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignVCenter);
      // ... Altrimenti no
      end else begin
         ACanvas.DrawText(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignHCenter or cxAlignVCenter);
      end;
      // Disabilita il visualizzazione di default.
      ADone := True;
   end;
end;

procedure TAnagMagaForm.tvListDblClick(Sender: TObject);
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini) ---> Dal rigo corrente del documento
      999: begin
              // Importa l'aliquotaIVA nel rigo corrente
              PreventiviOrdiniForm.tvCorpo.DataController.BeginUpdate;
              try
                with PreventiviOrdiniForm.tvCorpo.DataController do begin
                   // Si assicura che il magazzino2 non sia lo stesso del magazzino1
                   if  (not VarIsNull(Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEMAGAZZINO2.Index]))
                   and (QueryAnagMaga.FieldByName('Codice').AsInteger = Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEMAGAZZINO2.Index])
                   then raise Exception.Create('I magazzini 1 e 2 non posso essere uguali.');
                   // Assegna il magazzino scelto.
                   Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEMAGAZZINO.Index] := QueryAnagMaga.FieldByName('Codice').Value;
                end;
              finally
                PreventiviOrdiniForm.tvCorpo.DataController.EndUpdate;
              end;
              Close;
              PreventiviOrdiniForm.GridCorpo.SetFocus;
           end;
      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini) ---> Dalla testata del documento
      998: begin
              // Si assicura che il magazzino2 non sia lo stesso del magazzino1
              if  (not PreventiviOrdiniForm.QryDocumentoCodiceMagazzino2.IsNull)
              and (QueryAnagMaga.FieldByName('Codice').AsInteger = PreventiviOrdiniForm.QryDocumentoCodiceMagazzino2.AsInteger)
              then raise Exception.Create('I magazzini 1 e 2 non posso essere uguali.');
              // Importa l'aliquotaIVA nel rigo corrente
              PreventiviOrdiniForm.QryDocumentoCodiceMagazzino.Value := QueryAnagMaga.FieldByName('Codice').AsInteger;
              Close;
              PreventiviOrdiniForm.DBEditMagazzino.SetFocus;
           end;
      // Form chiamante: GIORNALE DI MAGAZZINO (FormClienti) ---> Dalla Form Clienti
      997: begin
              // Importa l'aliquotaIVA nel rigo corrente
              ClientiForm.GMCodiceMagazzino.Text      := ' ' + QueryAnagMaga.FieldByName('Codice').AsString;
              ClientiForm.GMDescrizioneMagazzino.Text := ' ' + QueryAnagMaga.FieldByName('Descrizione').AsString;
              Close;
              ClientiForm.GMCodiceMagazzino.SetFocus;
           end;
      // Form chiamante: ARCHIVIO ARTICOLI (FormArticoli1) ---> Dalla Form ClientiForm
      996: begin
              // Importa l'aliquotaIVA nel rigo corrente
              ClientiForm.CodiceMagazzino.Text      := ' ' + QueryAnagMaga.FieldByName('Codice').AsString;
              ClientiForm.DescrizioneMagazzino.Text := ' ' + QueryAnagMaga.FieldByName('Descrizione').AsString;
              Close;
              ClientiForm.CodiceMagazzino.SetFocus;
           end;
      // Form chiamante: SELEZIONE ARTICOLI (FormArticoli1) ---> Dalla Form Articoli
      995: begin
              // Importa l'aliquotaIVA nel rigo corrente
              ArticoliForm.CodiceMagazzino.Text      := ' ' + QueryAnagMaga.FieldByName('Codice').AsString;
              ArticoliForm.DescrizioneMagazzino.Text := ' ' + QueryAnagMaga.FieldByName('Descrizione').AsString;
              Close;
              ArticoliForm.CodiceMagazzino.SetFocus;
           end;
      // Form chiamante: MAGAZZINO 2 - DOCUMENTO FISCALE (FormPreventiviOrdini) ---> Dal rigo corrente del documento
      994: begin
              // Importa l'aliquotaIVA nel rigo corrente
              PreventiviOrdiniForm.tvCorpo.DataController.BeginUpdate;
              try
                with PreventiviOrdiniForm.tvCorpo.DataController do begin
                   // Si assicura che il magazzino2 non sia lo stesso del magazzino1
                   if  (not VarIsNull(Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEMAGAZZINO.Index]))
                   and (QueryAnagMaga.FieldByName('Codice').AsInteger = Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEMAGAZZINO.Index])
                   then raise Exception.Create('I magazzini 1 e 2 non posso essere uguali.');
                   // Assegna il magazzino scelto.
                   Values[FocusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEMAGAZZINO2.Index] := QueryAnagMaga.FieldByName('Codice').Value;
                end;
              finally
                PreventiviOrdiniForm.tvCorpo.DataController.EndUpdate;
              end;
              Close;
              PreventiviOrdiniForm.GridCorpo.SetFocus;
           end;
      // Form chiamante: MAGAZZINO 2 - DOCUMENTO FISCALE (FormPreventiviOrdini) ---> Dalla testata del documento
      993: begin
              // Si assicura che il magazzino2 non sia lo stesso del magazzino1
              if  (not PreventiviOrdiniForm.QryDocumentoCodiceMagazzino.IsNull)
              and (QueryAnagMaga.FieldByName('Codice').AsInteger = PreventiviOrdiniForm.QryDocumentoCodiceMagazzino.AsInteger)
              then raise Exception.Create('I magazzini 1 e 2 non posso essere uguali.');
              // Importa l'aliquotaIVA nel rigo corrente
              PreventiviOrdiniForm.QryDocumentoCodiceMagazzino2.Value := QueryAnagMaga.FieldByName('Codice').AsInteger;
              Close;
              PreventiviOrdiniForm.DBEditMagazzino2.SetFocus;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TAnagMagaForm.tvListCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TAnagMagaForm.tvListEndDrag(Sender, Target: TObject; X,
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

procedure TAnagMagaForm.tvListKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TAnagMagaForm.RxSpeedButtonVisualizzaDragOver(Sender,
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

procedure TAnagMagaForm.SBPredefinitoClick(Sender: TObject);
var
   P:TMemIniFile;
begin
   P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
   try
      // Chiede prima conferma
      if DM1.Messaggi('Magazzino Predefinito', 'Impostare il Magazzino selezionato come predefinito per questa stazione?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
         // Salva il magazzino di default della stazione
         DM1.MagazzinoDefault := tvList.Controller.FocusedRecord.Values[tvListCodice.Index];
         P.WriteString('MULTIMAGAZZINO', 'MagazzinoDefault', DM1.MagazzinoDefault);
         // Aggiorna lo schermo
         tvList.DataController.RefreshExternalData;
      end;
   finally
      P.UpdateFile;
      P.Free;
   end;
end;

procedure TAnagMagaForm.QueryAnagMagaBeforePost(DataSet: TDataSet);
begin
  // Non deve accettare codice magazzino nullli o minori di 1
  if (DataSet.FieldByName('CODICE').IsNull) or (DataSet.FieldByName('CODICE').AsInteger < 1)
  then raise Exception.Create('Codice magazzino non valido.'#13#13'Il codice di magazzino deve essere superiore a 0.');
end;

end.

