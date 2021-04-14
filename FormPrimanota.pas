unit FormPrimanota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls,
  Buttons, Db, IBODataset, Menus, IniFiles,
  IB_Components, bmpPanel, MAURI_SB, 
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, 
  cxControls, cxGridCustomView, cxGrid, 
  cxEdit, cxDBData, cxCalendar,
  cxTextEdit, cxCurrencyEdit, cxTimeEdit, cxCheckBox, cxMemo, cxRadioGroup,
  cxCheckComboBox, cxDropDownEdit, cxContainer, cxMaskEdit,
  cxDBEdit, cxSplitter, FormAllegati, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TPrimanotaForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    QueryPrimanota: TIBOQuery;
    SourcePrimanota: TDataSource;
    QueryPrimanotaCODICE: TIntegerField;
    QueryPrimanotaDATA: TDateTimeField;
    QueryPrimanotaDESCRIZIONE: TStringField;
    QueryPrimanotaCASSAENTRATE: TIBOFloatField;
    QueryPrimanotaCASSAUSCITE: TIBOFloatField;
    QueryPrimanotaFUORIENTRATE: TIBOFloatField;
    QueryPrimanotaFUORIUSCITE: TIBOFloatField;
    QueryPrimanotaDESCFUORI: TStringField;
    QueryPrimanotaABBUONIATTIVI: TIBOFloatField;
    QueryPrimanotaABBUONIPASSIVI: TIBOFloatField;
    QueryPrimanotaNOTE: TStringField;
    QueryPrimanotaCLIENTE: TIntegerField;
    QueryPrimanotaPRATICA: TIntegerField;
    QueryPrimanotaPRATICA2: TIntegerField;
    QueryPrimanotaPRATICA3: TIntegerField;
    QueryPrimanotaDATAPRATICA1: TDateTimeField;
    QueryPrimanotaDATAPRATICA2: TDateTimeField;
    QueryPrimanotaDATAPRATICA3: TDateTimeField;
    QueryPrimanotaSTATODESCRIZIONE: TStringField;
    QueryPrimanotaSTATOFOREGROUND: TStringField;
    QueryPrimanotaSTATOBACKGROUND: TStringField;
    QueryPrimanotaAGENTE: TStringField;
    QueryPrimanotaAGENTE2: TStringField;
    QueryPrimanotaAGENTE3: TStringField;
    QueryPrimanotaAGENTE4: TStringField;
    FormMainPanel: TPanel;
    ClientArea: TPanel;
    PanelCassa: TPanel;
    Label4: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    PanelFuoriCassa: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    PanelBanca: TPanel;
    DBComboBanca: TDBComboBox;
    PanelAbbuoni: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    PanelOperazione: TPanel;
    Label44: TLabel;
    Label1: TLabel;
    Label23: TLabel;
    LabelStatoDocumento: TLabel;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    DbeNote: TDBEdit;
    Panel1: TPanel;
    Descrizione: TDBComboBox;
    DBEditStatoDocumento: TDBEdit;
    PanelAgenti: TPanel;
    LabelAgente: TLabel;
    LabelAgente2: TLabel;
    LabelAgente3: TLabel;
    LabelAgente4: TLabel;
    dbeAgente: TcxDBComboBox;
    dbeAgente2: TcxDBComboBox;
    dbeAgente3: TcxDBComboBox;
    dbeAgente4: TcxDBComboBox;
    PanelPratiche: TPanel;
    Label29: TLabel;
    LabelPanelPraticheCaption: TLabel;
    BitBtnPratica1_Old: TSpeedButtonRollOver;
    Label32: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    DBECodicePratica1: TDBEdit;
    DBEdit2: TDBEdit;
    EditDescrizionePratica1: TEdit;
    PanelNumDataDocumento: TPanel;
    Shape1: TShape;
    LabelDocumento: TLabel;
    Label17: TLabel;
    Shape6: TShape;
    DBText1: TDBText;
    Label7: TLabel;
    BitBtnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    PanelCantiere: TPanel;
    LabelCantiere: TLabel;
    BitBtnPratica1: TSpeedButtonRollOver;
    DbeDescrizioneCantiere: TcxTextEdit;
    DBEdit1: TDBEdit;
    DBERagSocCli: TEdit;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    DBEDataMovimento: TcxDBDateEdit;
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
    QueryPrimanotaEXPORTED: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    QueryPrimanotaRELATIVOFATTACQUI: TStringField;
    cxDBCheckBox2: TcxDBCheckBox;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure DBComboBancaDropDown(Sender: TObject);
    procedure DescrizioneDropDown(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure BitBtnClienteClick(Sender: TObject);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure QueryPrimanota2CLIENTEChange(Sender: TField);
    procedure RxSpeedButtonEliminaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure BitBtnPratica1_OldClick(Sender: TObject);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure QueryPrimanotaPRATICAChange(Sender: TField);
    procedure EditDescrizionePratica1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeAgentePropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgentePropertiesInitPopup(Sender: TObject);
    procedure dbeAgente2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente4PropertiesInitPopup(Sender: TObject);
    procedure DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
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
    CodToOpen: Longint;
    DataToOpen: TDate;
  end;

const
   BG0  = $00D0CCCC;
   BG0N = $00E2D29A;
   BG1  = $00AAD2D1;
   BG1N = $00B0CCB1;

var
  PrimanotaForm: TPrimanotaForm;

implementation

uses main, DataModule1, DataModule2, FormHelp, SchedaClienti;

{$R *.DFM}




// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che crea la form degli allegati se questa non esiste già e la
  //  apre, alla fine esegue l'interrogazione per mostrare gli allegati.
  procedure TPrimanotaForm.Allegati_CreaForm;
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
  procedure TPrimanotaForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QueryPrimanotaCLIENTE.IsNull then fAllegatiForm.Filter_CodSogg := QueryPrimanotaCLIENTE.Value;

    // Codice Pratica
    if not QueryPrimanotaPRATICA.IsNull then fAllegatiForm.Filter_CodPrat := QueryPrimanotaPRATICA.Value;
    // Data Pratica
    if not QueryPrimanotaDATAPRATICA1.IsNull then fAllegatiForm.Filter_DataPrat := QueryPrimanotaDATAPRATICA1.Value;

    // Tipo Documento
    fAllegatiForm.Filter_TipoDoc := 'Primanota';
    // Registro Documento
    //  NB: LA primanota non ha registro
    fAllegatiForm.Filter_RegDoc := '';
    // Numero documento
    if not QueryPrimanotaCODICE.IsNull then fAllegatiForm.Filter_NumDoc := QueryPrimanotaCODICE.Value;
    // Data documento
    if not QueryPrimanotaDATA.IsNull then fAllegatiForm.Filter_DataDoc := QueryPrimanotaDATA.Value;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TPrimanotaForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QueryPrimanota.State = dsInsert) then begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end else begin
      Allegati_CreaForm;
      SplitterAllegati.Enabled := True;
    end;
  end;

procedure TPrimanotaForm.AzzeraStato1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    QueryPrimanotaSTATODESCRIZIONE.Clear;
    QueryPrimanotaSTATOFOREGROUND.Clear;
    QueryPrimanotaSTATOBACKGROUND.Clear;
    Descrizione.SetFocus;
    DBEditStatoDocumento.SetFocus;
  end;
end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================











procedure TPrimanotaForm.CaricaTitoli;
begin
  // Caricamento titoli e etichette dei campi
  LabelCantiere.Caption   := DM1.DatiDocumento_LabelPratica;
end;

procedure TPrimanotaForm.CaricaFormLayout;
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


procedure TPrimanotaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;

   // Il puntatore alla form viene azzerato
   PrimanotaForm := nil;
end;

procedure TPrimanotaForm.FormCreate(Sender: TObject);
begin
   // Inizializzazione
   CodToOpen := 0;
   DataToOpen := StrToDate('01/01/1900');
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(PrimanotaForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Primanota)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
   // Carica l'icona del tipo documento visualizzato
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
   // CArica i titoli delle etichette dei campi
   CaricaTitoli;
end;

procedure TPrimanotaForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TPrimanotaForm.FormShow(Sender: TObject);
begin
      DM1.FocusRefresh;
      // In base al valore di 'Tag' apre la form in diverse modalità...
      case Tag of
         // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
         1: begin
            // IMposta la query per richiamare il record da modificare
            if QueryPrimanota.Active then QueryPrimanota.Close;
            if not QueryPrimanota.Prepared then QueryPrimanota.Prepare;
            QueryPrimanota.Params.ParamByName('P_CODICE').AsInteger := CodToOpen;
            QueryPrimanota.Params.ParamByName('P_DATA').AsDate := DataToOpen;
            QueryPrimanota.Open;
            // Se trova il record procede, altrimenti visualizza un errore ed esce dalla form
            if QueryPrimanota.Eof then begin
               MessageDlg('Movimento di primanota non trovato!', mtError, [mbOK], 0);
               PrimanotaForm.Close;
               Exit;
            end;
         end;
         // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
         2: begin
            // Se non è aperta, apre la query vuota in modo da poter inserire un nuovo record
            if not QueryPrimanota.Active then begin
               QueryPrimanota.Close;
               QueryPrimanota.Params.ParamByName('P_CODICE').AsInteger := -999;
               QueryPrimanota.Params.ParamByName('P_DATA').AsDate := StrToDate('01/01/1900');
               QueryPrimanota.Open;
            end;
            // Agiungle il nuovo record
            QueryPrimanota.Append;
               // IMpostazione valori predefiniti nei campi
               QueryPrimanotaDATA.Value := Date;
               QueryPrimanotaCLIENTE.Value := 0;
               if ClientiForm.ClienteCorrente <> '' then begin
                 QueryPrimanotaCLIENTE.Value := StrToInt(ClientiForm.ClienteCorrente);
               end;
               if ClientiForm.PraticaCorrente <> '' then QueryPrimanotaPratica.Value := StrToInt(ClientiForm.PraticaCorrente);
               if ClientiForm.DataPraticaCorrente <> ''   then QueryPrimanotaDataPratica1.Value  := StrToDate(ClientiForm.DataPraticaCorrente);
               QueryPrimanotaRELATIVOFATTACQUI.Value := 'F';
            //  Pone la form direttamente in modalità di modifica
            RxSpeedModifica.Down := True;
            RxSpeedModificaClick(Self);
         end;
      end;

      // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
      RxSpeedModifica.Enabled := (DM1.ModCtrl(MOD_PRIMANOTA) > 1);

      // IMposta la lunghezza max del TDBMemo relativo al campo NOTE
      DbeNote.MaxLength := QueryPrimanotaNOTE.Size;

      // Imposta l'aspetto della form
      CaricaFormLayout;

      // Carica la descrizione pagamento
      if not QueryPrimanotaCliente.IsNull then DM1.CaricaRagSocCli(QueryPrimanotaCliente.Value, DBERagSocCli);
      // Carica la descrizione della pratica
      if (not QueryPrimanotaPRATICA.IsNull)  and (not QueryPrimanotaDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QueryPrimanotaPRATICA.Value,  QueryPrimanotaDATAPRATICA1.Value, EditDescrizionePratica1);
      // Carica la descrizione delle pratiche
      if (not QueryPrimanotaPRATICA.IsNull)  and (not QueryPrimanotaDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QueryPrimanotaPRATICA.Value,  QueryPrimanotaDATAPRATICA1.Value, EditDescrizionePratica1);

      // Decide se gli allegati devono essere già visibili oppure no.
      Allegati_VerificaAbilitazione;
end;

procedure TPrimanotaForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TPrimanotaForm.RxSpeedModificaClick(Sender: TObject);
var
   MR: TModalResult;
begin
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QueryPrimanota.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          BitBtnCliente.Enabled              := True;
          BitBtnPratica1.Enabled             := True;
          BitBtnSelezioneStato.Enabled       := True;
          DM1.ColoraTuttiCampi(PrimanotaForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          Descrizione.SetFocus;
          DBEDataMOvimento.SetFocus;
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
          QueryPrimanota.Edit;
          // ---------------------------------------------------------------------------------------------
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice è nullo (NUOVO) ne assegna uno nuovo.
               if QueryPrimanotaCodice.IsNull then begin
                  QueryPrimanotaCodice.Value := DM1.NextCodice('PRIMANOT', 'CODICE');
               end;
               QueryPrimanota.Post;
//               QueryPrimanota.ApplyUpdates;
//               QueryPrimanota.CommitUpdates;

               // Decide se gli allegati devono essere già visibili oppure no.
               Allegati_VerificaAbilitazione;

          end else if MR = mrNo then begin
             if QueryPrimanota.State = dsInsert then begin
                QueryPrimanota.Cancel;
//                QueryPrimanota.CommitUpdates;
                Close;
                Exit;
             end else begin
                QueryPrimanota.Cancel;
//                QueryPrimanota.CommitUpdates;
             end;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          // ---------------------------------------------------------------------------------------------

          RxSpeedButtonUscita.Enabled        := True;
          BitBtnCliente.Enabled              := False;
          BitBtnPratica1.Enabled             := False;
          BitBtnSelezioneStato.Enabled       := False;
          DM1.ColoraTuttiCampi(PrimanotaForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DbeNote.SetFocus;
          Descrizione.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QueryPrimanota.Edit;
          end;
       end;
     end;
end;

procedure TPrimanotaForm.DBComboBancaDropDown(Sender: TObject);
var
   Qry:TIBOQuery;
begin
   // Crea l'oggetto query
   Qry := TIBOQuery.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;
   // IMposta l'interrogazione e la esegue (elenca le proprie banche appoggio)
   Qry.SQL.Add('SELECT DescBreve');
   Qry.SQL.Add('FROM BANCHE');
   Qry.SQL.Add('WHERE MiaBanca = ''T''');
   Qry.SQL.Add('ORDER BY DescBreve');
   Qry.Open;
   // Ora carica tutte le nostre proprie banche appoggio nella combo box
   DBComboBanca.Items.Clear;
   while not Qry.EOF do begin
      if not Qry.FieldByName('DescBreve').IsNull then DBComboBanca.Items.Add(Qry.FieldByName('DescBreve').Value);
      Qry.Next;
   end;
   // Distrugge la query
   Qry.Free;
end;

procedure TPrimanotaForm.DescrizioneDropDown(Sender: TObject);
var
   LO:TMemIniFile;
   Chiavi:TStrings;
   Contatore:Integer;
begin
   Chiavi := TStringList.Create;
   Descrizione.Items.Clear;
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
      LO.ReadSection('DescMovPrimanota', Chiavi);
      for Contatore := 0 to (Chiavi.Count - 1) do begin
         Descrizione.Items.Add(LO.ReadString('DescMovPrimanota', Chiavi[Contatore], ''));
      end;
   finally
      LO.Free;
      Chiavi.Free;
   end;
end;

procedure TPrimanotaForm.DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
begin
  if RxSpeedModifica.Down
  and (  (Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)  )
  then
    DM2.ClearCantiereDoc(QueryPrimanotaPRATICA, QueryPrimanotaDATAPRATICA1, DbeDescrizioneCantiere);
end;

procedure TPrimanotaForm.DBEdit1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TPrimanotaForm.DBEdit1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TPrimanotaForm.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
end;

procedure TPrimanotaForm.DBEditStatoDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TPrimanotaForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('PRIMANOTA');
end;

procedure TPrimanotaForm.BitBtnClienteClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QueryPrimanotaCliente, QueryPrimanotaPRATICA, QueryPrimanotaDATAPRATICA1, '');
end;

procedure TPrimanotaForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QueryPrimanotaCliente.Value);
end;

procedure TPrimanotaForm.QueryPrimanota2CLIENTEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   if not QueryPrimanotaCliente.IsNull then DM1.CaricaRagSocCli(QueryPrimanotaCliente.Value, DBERagSocCli);
   // Carica gli agenti
   DM1.SetAgenti(QueryPrimanota, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');
end;

procedure TPrimanotaForm.RxSpeedButtonEliminaDragOver(Sender,
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
            if (Name = 'tvPrimanota')
            then accept := True;
         end;
      end;
   end;
end;

procedure TPrimanotaForm.BitBtnPratica1_OldClick(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QueryPrimanotaPratica,
                        QueryPrimanotaDataPratica1,
                        nil,
                        QueryPrimanotaCLIENTE,
                        QueryPrimanotaCliente.Value);
end;

procedure TPrimanotaForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
   // Richiama la selezione dello stato del documento
   DM1.SelezionaStato('Primanota', QueryPrimanota, 0);
end;

procedure TPrimanotaForm.BitBtnPratica1Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QueryPrimanotaPratica,
                        QueryPrimanotaDataPratica1,
                        nil,
                        QueryPrimanotaCLIENTE,
                        QueryPrimanotaCliente.Value);
end;

procedure TPrimanotaForm.QueryPrimanotaPRATICAChange(Sender: TField);
begin
  // Carica la descrizione della pratica
  if (not QueryPrimanotaPRATICA.IsNull)  and (not QueryPrimanotaDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QueryPrimanotaPRATICA.Value,  QueryPrimanotaDATAPRATICA1.Value, EditDescrizionePratica1);
  // Carica gli agenti
  DM1.SetAgenti(QueryPrimanota, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');
end;

procedure TPrimanotaForm.EditDescrizionePratica1Change(Sender: TObject);
begin
  if QueryPrimanotaPRATICA.AsInteger > 0 then begin
    DbeDescrizioneCantiere.Text := QueryPrimanotaPRATICA.AsString + ' - ' + QueryPrimanotaDATAPRATICA1.AsString + ' - ' + EditDescrizionePratica1.Text;
  end else begin
    DbeDescrizioneCantiere.Text := '- - -';
  end;
end;

procedure TPrimanotaForm.FormResize(Sender: TObject);
begin
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(Self, FormMainPanel, ClientArea, SplitterAllegati, True, True);
end;

procedure TPrimanotaForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

procedure TPrimanotaForm.dbeAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QueryPrimanota.State = dsEdit) or (QueryPrimanota.State = dsInsert) then DM1.AgenteChanged(1, dbeAgente2);
end;

procedure TPrimanotaForm.dbeAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QueryPrimanota.State = dsEdit) or (QueryPrimanota.State = dsInsert) then DM1.AgenteChanged(2, dbeAgente3);
end;

procedure TPrimanotaForm.dbeAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QueryPrimanota.State = dsEdit) or (QueryPrimanota.State = dsInsert) then DM1.AgenteChanged(3, dbeAgente4);
end;

procedure TPrimanotaForm.dbeAgentePropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente.Properties.Items, 1, '');
end;

procedure TPrimanotaForm.dbeAgente2PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente2.Properties.Items, 2, dbeAgente.Text);
end;

procedure TPrimanotaForm.dbeAgente3PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente3.Properties.Items, 3, dbeAgente2.Text);
end;

procedure TPrimanotaForm.dbeAgente4PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente4.Properties.Items, 4, dbeAgente3.Text);
end;

end.
