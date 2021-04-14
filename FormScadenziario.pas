unit FormScadenziario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, DB, IBODataset,
  IB_Components, bmpPanel, MAURI_SB, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, 
  cxSplitter, FormAllegati, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.Menus;
                                                                                                    
type
  TScadenzeForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    QryScad: TIBOQuery;
    QryScadTIPO: TStringField;
    QryScadCODICE: TIntegerField;
    QryScadDATASCADENZA: TDateTimeField;
    QryScadCLIENTE: TIntegerField;
    QryScadTIPODOC: TStringField;
    QryScadNUMDOC: TIntegerField;
    QryScadREGISTRO: TStringField;
    QryScadDATADOC: TDateTimeField;
    QryScadIMPORTO: TIBOFloatField;
    QryScadIMPORTOPAGATO: TIBOFloatField;
    QryScadPRATICA: TIntegerField;
    QryScadNOTE: TStringField;
    QryScadPRATICA2: TIntegerField;
    QryScadPRATICA3: TIntegerField;
    QryScadDATAPRATICA1: TDateTimeField;
    QryScadDATAPRATICA2: TDateTimeField;
    QryScadDATAPRATICA3: TDateTimeField;
    QryScadRICEVUTABANCARIA: TStringField;
    QryScadABI: TStringField;
    QryScadCAB: TStringField;
    QryScadPRESENTATA: TStringField;
    QryScadPARTITAIVACLI: TStringField;
    QryScadDEBITORESIDUO: TCurrencyField;
    QryScadDESCPRATICA1: TStringField;
    QryScadDESCPRATICA2: TStringField;
    QryScadDESCPRATICA3: TStringField;
    SourceScad: TDataSource;
    QryScadINSOLUTO: TStringField;
    QryScadSPESEPROTESTO: TIBOFloatField;
    QryScadAGENTE: TStringField;
    QryScadDATAPAGAMENTO: TDateTimeField;
    QryScadSTATODESCRIZIONE: TStringField;
    QryScadAGENTE2: TStringField;
    QryScadAGENTE3: TStringField;
    QryScadAGENTE4: TStringField;
    FormMainPanel: TPanel;
    ClientArea: TPanel;
    PanelNumDataDocumento: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    LabelDocumento: TLabel;
    Label15: TLabel;
    BitBtnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    Shape6: TShape;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBEdit9: TDBEdit;
    PanelCantiere: TPanel;
    LabelCantiere: TLabel;
    BitBtnPratica1: TSpeedButtonRollOver;
    DbeDescrizioneCantiere: TcxTextEdit;
    DBERagSocCli: TEdit;
    PanelRiferimenti: TPanel;
    Label43: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    PanelAgenti: TPanel;
    LabelAgente: TLabel;
    LabelAgente2: TLabel;
    LabelAgente3: TLabel;
    LabelAgente4: TLabel;
    dbeAgente: TcxDBComboBox;
    dbeAgente2: TcxDBComboBox;
    dbeAgente3: TcxDBComboBox;
    dbeAgente4: TcxDBComboBox;
    Panel3: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    BitBtnBanca: TSpeedButtonRollOver;
    Label47: TLabel;
    Label9: TLabel;
    LabelStatoDocumento: TLabel;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Banca: TEdit;
    ABI: TEdit;
    CAB: TEdit;
    DBEdit15: TDBEdit;
    DBEditStatoDocumento: TDBEdit;
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
    Panel1: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label16: TLabel;
    Shape5: TShape;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DbeDataPagamento: TcxDBDateEdit;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    DBEDataScadenza: TcxDBDateEdit;
    cxDBDateEdit1: TcxDBDateEdit;
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
    dbeDocReg: TcxDBComboBox;
    BitBtnOpenDoc: TSpeedButtonRollOver;
    QryScadPRESENTATABANCA: TStringField;
    dbePresentataBanca: TcxDBComboBox;
    Label18: TLabel;
    Panel2: TPanel;
    Label22: TLabel;
    Label19: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label20: TLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    QryScadIBAN: TStringField;
    QryScadPA_CONDIZIONIPAGAMENTOSIGLA: TStringField;
    QryScadPA_MODALITAPAGAMENTOSICLA: TStringField;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    BIC: TEdit;
    QryScadID: TIntegerField;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure BitBtnClienteClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure QryScadCalcFields(DataSet: TDataSet);
    procedure QryScadBeforePost(DataSet: TDataSet);
    procedure BitBtnBancaClick(Sender: TObject);
    procedure BitBtnPratica1_OldClick(Sender: TObject);
    procedure BitBtnPratica2Click(Sender: TObject);
    procedure BitBtnPratica3Click(Sender: TObject);
    procedure SpeedButtonRollOver1Click(Sender: TObject);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure QryScadCLIENTEChange(Sender: TField);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure EditDescrizionePratica1Change(Sender: TObject);
    procedure QryScadPRATICAChange(Sender: TField);
    procedure QryScadPRATICA2Change(Sender: TField);
    procedure QryScadPRATICA3Change(Sender: TField);
    procedure dbeAgentePropertiesInitPopup(Sender: TObject);
    procedure dbeAgente2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente4PropertiesInitPopup(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeAgentePropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBComboBox1PropertiesInitPopup(Sender: TObject);
    procedure BitBtnOpenDocClick(Sender: TObject);
    procedure dbePresentataBancaPropertiesInitPopup(Sender: TObject);
    procedure DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
    procedure AzzeraStato1Click(Sender: TObject);
    procedure DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

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
    procedure CaricaFormLayout;
    { Private declarations }
  public
    { Public declarations }
     // Queste contengono i riferimenti al record da visualizzare/editare
     CodiceScadenza,RifNumDoc:Longint;
     RifTipoDoc,CodiceCliente,CodicePratica,DataPratica,TipoScadenza:String;
     RifDataDoc, DataScadenza:TDate;
  end;

var
  ScadenzeForm: TScadenzeForm;

implementation

uses DataModule1, DataModule2, main, FormHelp, FormArchivioBanche, SchedaClienti;

{$R *.DFM}


// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che crea la form degli allegati se questa non esiste già e la
  //  apre, alla fine esegue l'interrogazione per mostrare gli allegati.
  procedure TScadenzeForm.Allegati_CreaForm;
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
  procedure TScadenzeForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QryScadCLIENTE.IsNull then fAllegatiForm.Filter_CodSogg := QryScadCLIENTE.Value;

    // Codice Pratica
    if not QryScadPRATICA.IsNull then fAllegatiForm.Filter_CodPrat := QryScadPRATICA.Value;
    // Data Pratica
    if not QryScadDATAPRATICA1.IsNull then fAllegatiForm.Filter_DataPrat := QryScadDATAPRATICA1.Value;

    // NB: Se la scadenza è legata ad un documento imposta i dati di questo documento per gli allegati
    //      in modo che nella scadenza siano visibili gli allegati del documento stesso e gli allegati
    //      inseriti nella scadenza siano visibili anche nel documento (proprio perchè in realtà diventano
    //      del documento).
    if (not QryScadTIPODOC.IsNull) and (not QryScadNUMDOC.IsNull) and (not QryScadDATADOC.IsNull) then begin
      // Tipo Documento
      fAllegatiForm.Filter_TipoDoc := QryScadTIPODOC.Value;
      // Registro Documento
      if not QryScadREGISTRO.IsNull then fAllegatiForm.Filter_RegDoc := QryScadREGISTRO.Value;
      // Numero documento
      fAllegatiForm.Filter_NumDoc := QryScadNUMDOC.Value;
      // Data documento
      fAllegatiForm.Filter_DataDoc := QryScadDATADOC.Value;
    // Se invece la scadenza non è legata ad alcun documento...
    end else begin
      // Tipo Documento
      if not QryScadTIPO.IsNull then fAllegatiForm.Filter_TipoDoc := QryScadTIPO.Value;
      // Registro Documento
      //  NB: Le scadenze non ha registro
      fAllegatiForm.Filter_RegDoc := '';
      // Numero documento
      if not QryScadCODICE.IsNull then fAllegatiForm.Filter_NumDoc := QryScadCODICE.Value;
      // Data documento
      if not QryScadDATASCADENZA.IsNull then fAllegatiForm.Filter_DataDoc := QryScadDATASCADENZA.Value;
    end;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TScadenzeForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QryScad.State = dsInsert) then begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end else begin
      Allegati_CreaForm;
      SplitterAllegati.Enabled := True;
    end;
  end;

procedure TScadenzeForm.AzzeraStato1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    QryScadSTATODESCRIZIONE.Clear;
    DBEdit1.SetFocus;
    DBEditStatoDocumento.SetFocus;
  end;
end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================














procedure TScadenzeForm.CaricaTitoli;
begin
  // Caricamento titoli e etichette dei campi
  LabelCantiere.Caption   := DM1.DatiDocumento_LabelPratica;
end;

procedure TScadenzeForm.cxDBComboBox1PropertiesInitPopup(Sender: TObject);
var
   Qry:TIBOQuery;
begin
   // Crea la query che fornirà l'elenco dei registri disponibili
   Qry := TIBOQuery.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   Qry.SQL.Add('SELECT Registro FROM ProgReg');
   Qry.Open;
   // Carica i registri nelle items del componente
   dbeDocReg.Properties.Items.Clear;
   while not Qry.Eof do begin
      dbeDocReg.Properties.Items.Add(Qry.FieldByName('Registro').Value);
      Qry.Next;
   end;
   Qry.Close;
   Qry.Free;
end;

procedure TScadenzeForm.CaricaFormLayout;
begin
  // ===========================================================================
  // AGENTI
  // ---------------------------------------------------------------------------
  // Agente 1
  LabelAgente.Caption  := DM1.GridsColumnAgenteCaption;
  dbeAgente.Visible    := (DM1.GridsColumnAgenteCaption <> '');
  if DM1.AgenteEditable then dbeAgente.Properties.DropDownListStyle := lsEditList else dbeAgente.Properties.DropDownListStyle := lsEditFixedList;
  // Agente 2
  LabelAgente2.Caption := DM1.GridsColumnAgente2Caption;
  dbeAgente2.Visible   := (DM1.GridsColumnAgente2Caption <> '');
  if DM1.Agente2Editable then dbeAgente2.Properties.DropDownListStyle := lsEditList else dbeAgente2.Properties.DropDownListStyle := lsEditFixedList;
  // Agente 3
  LabelAgente3.Caption := DM1.GridsColumnAgente3Caption;
  dbeAgente3.Visible   := (DM1.GridsColumnAgente3Caption <> '');
  if DM1.Agente3Editable then dbeAgente3.Properties.DropDownListStyle := lsEditList else dbeAgente3.Properties.DropDownListStyle := lsEditFixedList;
  // Agente 4
  LabelAgente4.Caption := DM1.GridsColumnAgente4Caption;
  dbeAgente4.Visible   := (DM1.GridsColumnAgente4Caption <> '');
  if DM1.Agente4Editable then dbeAgente4.Properties.DropDownListStyle := lsEditList else dbeAgente4.Properties.DropDownListStyle := lsEditFixedList;
  // ===========================================================================
end;



procedure TScadenzeForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Anagrafica scadenza)';
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(sCADENZEForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
   // Carica i titoli
   CaricaTitoli;
end;

procedure TScadenzeForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     DM1.Attendere;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryScad.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          BitBtnPratica1.Enabled             := True;
          BitBtnPratica2.Enabled             := True;
          BitBtnPratica3.Enabled             := True;
          BitBtnCliente.Enabled              := True;
          BitBtnBanca.Enabled                := True;
          BitBtnSelezioneStato.Enabled       := True;
          BitBtnOpenDoc.Enabled              := False;
          DM1.ColoraTuttiCampi(ScadenzeForm, COLOR_MODIFICA);
          // Focus sul primo campo editabile
          DBEDataScadenza.SetFocus;
          DBEdit1.SetFocus;
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
          QryScad.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice cliente è nullo (nuovo cliente) ne assegna uno nuovo.
               if QryScadCodice.IsNull then begin
                  QryScadCodice.Value := DM1.NextCodice('SCADENZ', 'CODICE');
               end;
               // Se l'importo pagato è nullo lo pone := 0 (altrimenti non funziona correttamente)
               if QryScadImportoPagato.IsNull then QryScadImportoPagato.Value := 0;
               QryScad.Post;
               QryScad.ApplyUpdates;
               QryScad.CommitUpdates;

               // Decide se gli allegati devono essere già visibili oppure no.
               Allegati_VerificaAbilitazione;

          end else if MR = mrNo then begin
             if QryScad.State = dsInsert then begin
                QryScad.Cancel;
                QryScad.CommitUpdates;
                DM1.ChiudiAttendere;
                Close;
                Exit;
             end else begin
                QryScad.Cancel;
                QryScad.CommitUpdates;
             end;
          end else begin
               RxSpeedModifica.Down := True;
               DM1.ChiudiAttendere;
               Exit;
          end;
          // Rimette a posto pulsanti e campi
          RxSpeedButtonUscita.Enabled        := True;
          BitBtnPratica1.Enabled             := False;
          BitBtnPratica2.Enabled             := False;
          BitBtnPratica3.Enabled             := False;
          BitBtnCliente.Enabled              := False;
          BitBtnBanca.Enabled                := False;
          BitBtnSelezioneStato.Enabled       := False;
          BitBtnOpenDoc.Enabled              := True;
          DM1.ColoraTuttiCampi(ScadenzeForm, COLOR_NORMALE);
          // Focus sul primo campo editabile
          DBEDataScadenza.SetFocus;
          DBEdit2.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryScad.Edit;
          end;
       end;
     end;
     DM1.ChiudiAttendere;
end;

procedure TScadenzeForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TScadenzeForm.FormShow(Sender: TObject);
begin
      DM1.FocusRefresh;
      // In base al valore di 'Tag' apre la form in diverse modalità...
      case Tag of
         // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
         1: begin
            // IMposta la query per richiamare il record da modificare
            QryScad.Close;
            QryScad.SQL.Clear;
            QryScad.SQL.Add('SELECT * FROM SCADENZ WHERE TIPO = ''' + TipoScadenza + ''' AND CODICE = ' + IntToStr(CodiceScadenza) + ' AND DATASCADENZA = ''' + FormatDateTime('mm/dd/yyyy', DataScadenza) + '''');
            QryScad.Open;
            // Se trova il record procede, altrimenti visualizza un errore ed esce dalla form
            if QryScad.Eof then begin
               MessageDlg('Scadenza non trovata!', mtError, [mbOK], 0);
               ScadenzeForm.Close;
               Exit;
            end;
         end;
         // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
         2: begin
            // Se non è aperta, apre la query vuota in modo da poter inserire un nuovo record
            if not QryScad.Active then begin QryScad.SQL.Clear; QryScad.SQL.Add('SELECT * FROM SCADENZ WHERE TIPO = ''ZXZXZX'''); QryScad.Open; end;
            // Agiungle il nuovo record
            QryScad.Append;
             QryScadTipo.Value                  := TipoScadenza;
             QryScadDataScadenza.Value          := Date;
             QryScadCliente.Value               := StrToInt(CodiceCliente);
             QryScadRICEVUTABANCARIA.Value      := 'F';
             QryScadPresentata.Value            := '/';
             QryScadINSOLUTO.Value              := 'F';
             if CodicePratica <> ''                     then QryScadPratica.Value       := StrToInt(CodicePratica);
             if DataPratica <> ''                       then QryScadDataPratica1.Value  := StrToDate(DataPratica);
             if RifTipoDoc <> ''                        then QryScadTipoDoc.Value       := RifTipoDoc;
             if RifNumDoc > 0                           then QryScadNumDoc.Value        := RifNumDoc;
             if RifDataDoc > StrToDate('30/12/1899')    then QryScadDataDoc.Value       := RifDataDoc;
            //  Pone la form direttamente in modalità di modifica
            RxSpeedModifica.Down := True;
            RxSpeedModificaClick(Self);
         end;
      end;

      // Imposta il Layout del documento
      CaricaFormLayout;

      // Carica i dati del cliente
      if not QryScadCliente.IsNull then DM1.CaricaRagSocCli(QryScadCliente.Value, DBERagSocCli);
      // Carica la descrizione della pratica
      if (not QryScadPRATICA.IsNull)  and (not QryScadDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QryScadPRATICA.Value,  QryScadDATAPRATICA1.Value, EditDescrizionePratica1);
      if (not QryScadPRATICA2.IsNull) and (not QryScadDATAPRATICA2.IsNull) then DM1.CaricaDescrizionePratica(QryScadPRATICA2.Value, QryScadDATAPRATICA2.Value, EditDescrizionePratica2);
      if (not QryScadPRATICA3.IsNull) and (not QryScadDATAPRATICA3.IsNull) then DM1.CaricaDescrizionePratica(QryScadPRATICA3.Value, QryScadDATAPRATICA3.Value, EditDescrizionePratica3);
      // Carica i dati della banca
      if (not QryScadABI.IsNull) and (not QryScadCAB.IsNull)  then DM1.CaricaDatiBanca(QryScadABI.Value, QryScadCAB.Value, Banca, ABI, CAB, BIC);

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if ((QryScadTipo.Value = 'Scad.attiv')and(DM1.ModCtrl(MOD_SCADENZARIO) > 1))or((QryScadTipo.Value = 'Scad.passi')and(DM1.ModCtrl(MOD_SCADENZARIO_PASSIVO) > 1)) then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Imposta le captions di campi/griglie relative alle pratiche
   LabelPanelPraticheCaption.Caption := ' ' + DM1.DocumentiPanelPraticaCaption;
   // Sposta il focus sul primo campo editabile
   DBEdit2.SetFocus;

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;
end;

procedure TScadenzeForm.FormKeyUp(Sender: TObject; var Key: Word;
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

   end;
end;

procedure TScadenzeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
end;

procedure TScadenzeForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
   // Richiama la selezione dello stato del documento
   DM1.SelezionaStato('Scadenze', QryScad, 0);
end;

procedure TScadenzeForm.BitBtnClienteClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryScadCliente, QryScadPRATICA, QryScadDATAPRATICA1, '');
end;

procedure TScadenzeForm.DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
begin
  if RxSpeedModifica.Down
  and (  (Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)  )
  then
    DM2.ClearCantiereDoc(QryScadPRATICA, QryScadDATAPRATICA1, DbeDescrizioneCantiere);
end;

procedure TScadenzeForm.DBEdit1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TScadenzeForm.DBEdit1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TScadenzeForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('SCADENZARIO');
end;

procedure TScadenzeForm.QryScadCalcFields(DataSet: TDataSet);
begin
   QryScadDEBITORESIDUO.Value := QryScadIMPORTO.AsCurrency - QryScadIMPORTOPAGATO.AsCurrency + QryScadSPESEPROTESTO.AsCurrency;
end;

procedure TScadenzeForm.QryScadBeforePost(DataSet: TDataSet);
begin
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then
    DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_SCADENZE');
  // Se il campo PRESENTATA non è = 'P' lo forza a '/' (Non presentata)
  if QryScadPresentata.Value <> 'P' then QryScadPresentata.Value := '/';
  // Si assicura che gli importi non siano nulli
  if QryScadIMPORTO.IsNull       then QryScadIMPORTO.Value       := 0;
  if QryScadSPESEPROTESTO.IsNull then QryScadSPESEPROTESTO.Value := 0;
  if QryScadIMPORTOPAGATO.IsNull then QryScadIMPORTOPAGATO.Value := 0;
end;

procedure TScadenzeForm.BitBtnBancaClick(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TArchivioBancheForm, ArchivioBancheForm);
      ArchivioBancheForm.Parent := MainForm;
      ArchivioBancheForm.Tag := 997;   // Abilita la selezione
      ArchivioBancheForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TScadenzeForm.BitBtnPratica1_OldClick(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QryScadPratica,
                        QryScadDataPratica1,
                        nil,
                        QryScadCLIENTE,
                        QryScadCliente.Value);
end;

procedure TScadenzeForm.BitBtnPratica2Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QryScadPratica2,
                        QryScadDataPratica2,
                        nil,
                        nil,
                        QryScadCliente.Value);
end;

procedure TScadenzeForm.BitBtnPratica3Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QryScadPratica3,
                        QryScadDataPratica3,
                        nil,
                        nil,
                        QryScadCliente.Value);
end;

procedure TScadenzeForm.SpeedButtonRollOver1Click(Sender: TObject);
begin
   DM1.SelezionaCliente(QryScadCliente, QryScadPRATICA, QryScadDATAPRATICA1, '');
end;

procedure TScadenzeForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryScadCliente.Value);
end;

procedure TScadenzeForm.BitBtnOpenDocClick(Sender: TObject);
begin
  ClientiForm.ApriDocumento(QryScadTIPODOC.AsString, QryScadNUMDOC.AsInteger, QryScadREGISTRO.AsString, QryScadDATADOC.AsDateTime, 0);
end;

procedure TScadenzeForm.QryScadCLIENTEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   if not QryScadCliente.IsNull then DM1.CaricaRagSocCli(QryScadCliente.Value, DBERagSocCli);
   // Carica gli agenti
   DM1.SetAgenti(QryScad, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');
end;



procedure TScadenzeForm.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TScadenzeForm.DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TScadenzeForm.dbePresentataBancaPropertiesInitPopup(Sender: TObject);
var
   Qry:TIBOQuery;
begin
   // Crea l'oggetto query
   Qry := TIBOQuery.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   // IMposta l'interrogazione e la esegue (elenca le proprie banche appoggio)
   Qry.SQL.Add('SELECT DescBreve');
   Qry.SQL.Add('FROM Banche');
   Qry.SQL.Add('WHERE MiaBanca = ''T''');
   Qry.SQL.Add('ORDER BY DescBreve');
   Qry.Open;
   // Ora carica tutte le nostre proprie banche appoggio nella combo box
   dbePresentataBanca.Properties.Items.Clear;
   dbePresentataBanca.Properties.Items.Add('');
   while not Qry.EOF do begin
      if not Qry.FieldByName('DescBreve').IsNull then dbePresentataBanca.Properties.Items.Add(Qry.FieldByName('DescBreve').Value);
      Qry.Next;
   end;
   // Distrugge la query
   Qry.Free;
end;

procedure TScadenzeForm.EditDescrizionePratica1Change(Sender: TObject);
begin
  if QryScadPRATICA.AsInteger > 0 then begin
    DbeDescrizioneCantiere.Text := QryScadPRATICA.AsString + ' - ' + QryScadDATAPRATICA1.AsString + ' - ' + EditDescrizionePratica1.Text;
  end else begin
    DbeDescrizioneCantiere.Text := '- - -';
  end;
end;

procedure TScadenzeForm.QryScadPRATICAChange(Sender: TField);
begin
  // Carica la descrizione della pratica
  if (not QryScadPRATICA.IsNull)  and (not QryScadDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QryScadPRATICA.Value,  QryScadDATAPRATICA1.Value, EditDescrizionePratica1);
  // Carica gli agenti
  DM1.SetAgenti(QryScad, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');
end;

procedure TScadenzeForm.QryScadPRATICA2Change(Sender: TField);
begin
  // Carica la descrizione della pratica
  if (not QryScadPRATICA2.IsNull)  and (not QryScadDATAPRATICA2.IsNull) then DM1.CaricaDescrizionePratica(QryScadPRATICA2.Value,  QryScadDATAPRATICA2.Value, EditDescrizionePratica2);
end;

procedure TScadenzeForm.QryScadPRATICA3Change(Sender: TField);
begin
  // Carica la descrizione della pratica
  if (not QryScadPRATICA3.IsNull)  and (not QryScadDATAPRATICA3.IsNull) then DM1.CaricaDescrizionePratica(QryScadPRATICA3.Value,  QryScadDATAPRATICA3.Value, EditDescrizionePratica3);
end;

procedure TScadenzeForm.dbeAgentePropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente.Properties.Items, 1, '');
end;

procedure TScadenzeForm.dbeAgente2PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente2.Properties.Items, 2, dbeAgente.Text);
end;

procedure TScadenzeForm.dbeAgente3PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente3.Properties.Items, 3, dbeAgente2.Text);
end;

procedure TScadenzeForm.dbeAgente4PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente4.Properties.Items, 4, dbeAgente3.Text);
end;

procedure TScadenzeForm.FormResize(Sender: TObject);
begin
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(Self, FormMainPanel, ClientArea, SplitterAllegati, True, True);
end;

procedure TScadenzeForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

procedure TScadenzeForm.dbeAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryScad.State = dsEdit) or (QryScad.State = dsInsert) then DM1.AgenteChanged(1, dbeAgente2);
end;

procedure TScadenzeForm.dbeAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryScad.State = dsEdit) or (QryScad.State = dsInsert) then DM1.AgenteChanged(2, dbeAgente3);
end;

procedure TScadenzeForm.dbeAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryScad.State = dsEdit) or (QryScad.State = dsInsert) then DM1.AgenteChanged(3, dbeAgente4);
end;

end.
