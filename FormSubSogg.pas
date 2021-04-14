unit FormSubSogg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxButtonEdit, DB, cxDBData, cxGridDBTableView,
  cxGridLevel, cxGridCardView, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, IB_Components,
  IBODataset, bmpPanel, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, cxGridCustomLayoutView;

type
  TSubSoggForm = class(TForm)
    QuerySubSogg: TIBOQuery;
    SourceSubSogg: TDataSource;
    QuerySubSoggCodice: TIntegerField;
    QuerySubSoggCodiceSoggetto: TIntegerField;
    QuerySubSoggCampo1: TStringField;
    QuerySubSoggCampo2: TStringField;
    QuerySubSoggCampo3: TStringField;
    QuerySubSoggCampo4: TDateField;
    QuerySubSoggSINCHRO: TStringField;
    ClientArea: TPanel;
    ClientTopPanel: TbmpPanel;
    PanelCategoria: TPanel;
    LabelTitolo1: TLabel;
    LabelTitolo2: TLabel;
    DBECampo1: TDBEdit;
    DBECampo2: TDBEdit;
    DBECampo3: TDBEdit;
    DBECampo4: TDBEdit;
    LabelCampo1: TLabel;
    LabelCampo2: TLabel;
    LabelCampo3: TLabel;
    LabelCampo4: TLabel;
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
    tvListCampo1: TcxGridDBColumn;
    tvListCampo2: TcxGridDBColumn;
    tvListCampo3: TcxGridDBColumn;
    tvListCampo4: TcxGridDBColumn;
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
    procedure CaricaLayout;
    procedure DBECampo1Enter(Sender: TObject);
    procedure DBECampo1Exit(Sender: TObject);
    procedure QuerySubSoggBeforePost(DataSet: TDataSet);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);     // Personale
  private
    procedure EseguiquerySubSogg;
    { Private declarations }
  public
    { Public declarations }
    // Contiene il codice del soggetto selezionato che filtrerà le voci da visualizzare
    CurrSogg: Longint;
  end;

var
  SubSoggForm: TSubSoggForm;

implementation

uses DataModule1, main, FormHelp, SchedaPreventiviOrdini, IniFiles;

{$R *.DFM}

procedure TSubSoggForm.EseguiquerySubSogg;     // Personale
begin
     // Esegue la query per avere l'elenco
     if QuerySubSogg.Active then QuerySubSogg.Close;
     QuerySubSogg.SQL.Clear;
     QuerySubSogg.SQL.Add('SELECT * FROM subsogg WHERE CodiceSoggetto = ' + IntToStr(CurrSogg));
     QuerySubSogg.Open;
end;

procedure TSubSoggForm.CaricaLayout;     // Personale
var
   LO : TMemIniFile;
   Contatore, YYY, TmpInt: Integer;
   Sez, TmpStr, TitoloStr : String;
   TmpDBE : TDBEdit;
   TmpLabel, TmpTitolo : TLabel;
begin
   // Inizializza la stringa che contiene il nome delle sezione nel file *.INI dove sono
   //  contenuti i parametri che ci interessano
   Sez := 'SubSogg';
   // Apre il file che contiene i layouts di stampa e visualizzazione dei documenti.
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);

    // ----- CAMPI JOLLY -----
    if LO.ReadString(Sez, 'Campo1', '0') <> '0' then begin
       TmpInt := 1;
       YYY := -1;
       // Cicla per tutte i 4 possibili campi
       for Contatore := 1 to 4 do begin
          // Rimappa su variabili locali i componenti Label e DBEdit che si
          //  stanno impostando.
          TmpDBE   := (FindComponent('DBECampo'+IntToStr(Contatore)) as TDBEdit);
          TmpLabel := (FindComponent('LabelCampo'+IntToStr(Contatore)) as TLabel);
          // Carica in TmpStr la riga del file *.INI da elaborare e se è <> 0 la elabora,
          TmpStr := LO.ReadString(Sez, 'Campo'+IntToStr(Contatore), '0');
          if TmpStr <> '0' then begin
             // Cicla finchè non vi siano più eventuali titoli da visualizzare contenuti nella
             //  riga del file *.INI attuale (titoli da visualizzare prima del campo attuale stesso.
             while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
                // Prende la prima label di titolo disponibile, la imposta, la visualizza
                TitoloStr := DM1.RitornaTestoPrimaDi('_', TmpStr, True);
                TmpTitolo := (FindComponent('LabelTitolo'+IntToStr(TmpInt)) as TLabel);
                TmpInt := TmpInt + 1;
                TmpTitolo.Caption := DM1.StrRight(TitoloStr, Length(TitoloStr)-3);
                if TitoloStr[1] = 'L' then TmpTitolo.Alignment := taLeftJustify
                 else if TitoloStr[1] = 'C' then TmpTitolo.Alignment := taCenter
                 else if TitoloStr[1] = 'R' then TmpTitolo.Alignment := taRightJustify;
                if TitoloStr[2] = 'N' then TmpTitolo.Font.Style := []
                else if TitoloStr[2] = 'B' then TmpTitolo.Font.Style := [fsBold];
                TmpTitolo.Top := YYY+1;
                TmpTitolo.Visible := True;
                YYY := YYY + TmpTitolo.Height;
             end;
             // Imposta il campo attuale e lo rende visibile
             Inc(YYY, 3);
             TmpLabel.Caption := TmpStr + ' ';
             TmpLabel.Top := YYY;
             TmpLabel.Visible := True;
             TmpDBE.Top := YYY;
             TmpDBE.Visible := True;
             YYY := YYY + TmpLabel.Height;
             // Rende visibile la relativa colonna dell'elenco
             tvList.Items[Contatore-1].Caption := TmpStr;
             tvList.Items[Contatore-1].Visible := True;
             // Dimensiona il pannello opportunamente
             PanelCategoria.Height := YYY+6;
          end else begin
             // Se invece il campo attuale è disabilitato lo rende invisibile
             TmpLabel.Visible := False;
             TmpDBE.Visible := False;
          end;
       end;
       PanelCategoria.Visible := True;
    end else begin
       DBECampo2.Visible := False;
       DBECampo3.Visible := False;
       DBECampo4.Visible := False;
       PanelCategoria.Height := 17;
    end;
    // ------------------------------
   LO.Free;
end;




procedure TSubSoggForm.FormClose(Sender: TObject;
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
   SubSoggForm := nil;
end;

procedure TSubSoggForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(SubSoggForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (SubSogg)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);

   // IMposta il percorso delle query del componente UpdateSQL
//   UpdateSubSogg.DeleteSQL[0] := 'delete from subsogg';
//   UpdateSubSogg.InsertSQL[0] := 'insert into subsogg';
//   UpdateSubSogg.ModifySQL[0] := 'update subsogg';
end;

procedure TSubSoggForm.FormKeyUp(Sender: TObject; var Key: Word;
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
               RxSpeedButtonEliminaClick(Self);
            end;
         end;

      end;
end;

procedure TSubSoggForm.FormShow(Sender: TObject);
begin
     CaricaLayout;
     // Rende visibile solo la griglia e nascosti i campi
     GridList.Visible := True;
     GridList.Align := alClient;

     DM1.FocusRefresh;
     // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
     if DM1.ModCtrl(MOD_CLIENTI) > 1 then begin
        RxSpeedModifica.Enabled := True;
        if not RxSpeedModifica.Down then RxSpeedButtonNuovo.Enabled := True;
     end else begin
        RxSpeedModifica.Enabled := False;
        RxSpeedButtonNuovo.Enabled := False;
     end;

     RxSpeedButtonTrovaClick(Self);
end;

procedure TSubSoggForm.DBECampo1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TSubSoggForm.DBECampo1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TSubSoggForm.QuerySubSoggBeforePost(DataSet: TDataSet);
begin
   // Marca il record come modificato
   DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
end;

procedure TSubSoggForm.RxSpeedButtonUscitaClick(Sender: TObject);
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

procedure TSubSoggForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

procedure TSubSoggForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Se la query non è attiva esce
     if not QuerySubSogg.Active then begin
        RxSpeedModifica.Down := False;
        Exit;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Prima di avviare la modifica controlla se il record è stato o meno creato da questa postazione e quindi
       //  se si è autorizzati alla sua modifica (se sincronizzazione attiva).
       if not DM1.ControlloSeModificabileDallaStazione(QuerySubSoggCodice.AsInteger) then begin RxSpeedModifica.Down := False; DM1.ChiudiAttendere; Exit; end;
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QuerySubSogg.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          GridList.Enabled                  := False;
          DM1.ColoraTuttiCampi(SubSoggForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          DBECampo2.SetFocus;
          DBECampo1.SetFocus;
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
          QuerySubSogg.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice non c'è lo assegna automaticamente
               if Trim(QuerySubSogg.FieldByName('CODICE').AsString) = '' then begin
                  QuerySubSogg.FieldByName('CODICE').Value := DM1.NextCodice('SUBSOGG', 'CODICE');
               end;
               QuerySubSogg.Post;
               QuerySubSogg.ApplyUpdates;
               QuerySubSogg.CommitUpdates;
          end else if MR = mrNo then begin
               QuerySubSogg.Cancel;
               QuerySubSogg.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled        := True;
          GridList.Enabled                  := True;
          DM1.ColoraTuttiCampi(SubSoggForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DBECampo2.SetFocus;
          DBECampo1.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QuerySubSogg.Edit;
          end;
       end;
     end;
end;

procedure TSubSoggForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);

   DBECampo1.SetFocus;                    // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)

   // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
   if not QuerySubSogg.Active then begin
      QuerySubSogg.Close;
      QuerySubSogg.SQL.Clear;
      QuerySubSogg.SQL.Add('SELECT *');
      QuerySubSogg.SQL.Add('FROM SUBSOGG');
      QuerySubSogg.SQL.Add('WHERE CODICE = -9999');
      QuerySubSogg.Open;
   end;

   QuerySubSogg.Append;
   QuerySubSoggCodiceSoggetto.Value := CurrSogg;  // Se non c'è questa riga non funziona bene e non ho capito perchè
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TSubSoggForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Chiede prima conferma
  MessageBeep(0);
  if MessageDlg('Vuoi veramente eliminare ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
     MessageBeep(0);
     if MessageDlg('Sei sicuro/a ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
        // Elimina l'articolo corrente
        QuerySubSogg.Delete;
        QuerySubSogg.ApplyUpdates;
        QuerySubSogg.CommitUpdates;
     end;
  end;
end;

procedure TSubSoggForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   try
     EseguiQuerySubSogg;
     GridList.SetFocus;
   finally
     DM1.ChiudiAttendere;
   end;
end;

procedure TSubSoggForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
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

procedure TSubSoggForm.tvListDblClick(Sender: TObject);
begin
   // Se la proprietà Tag della form = 999 significa che la form è stata chiamata dall'interno
   //  di un documento e quindi con il doppio click si deve aggiornare i campi SubSogg1,2,3 del
   //  documento.
   if Tag = 999 then begin
      // Inserisce il nuovo rigo nel documento.
      PreventiviOrdiniForm.QryDocumentoCODICESUBSOGG.Value := QuerySubSoggCodice.AsInteger;
      PreventiviOrdiniForm.QryDocumentoSubSoggCampo1.Value := QuerySubSoggCampo1.AsString;
      PreventiviOrdiniForm.QryDocumentoSubSoggCampo2.Value := QuerySubSoggCampo2.AsString;
      PreventiviOrdiniForm.QryDocumentoSubSoggCampo3.Value := QuerySubSoggCampo3.AsString;
      Close;
      PreventiviOrdiniForm.GridCorpo.SetFocus;
   end else begin
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TSubSoggForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(tvList);
end;

end.
