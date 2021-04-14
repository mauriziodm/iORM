unit FormExtFile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask,
  ExtCtrls, Buttons, Variants,
  bmpPanel, MAURI_SB, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, IB_Components, IBODataset, DB,
  cxSplitter, FormAllegati, cxCalendar, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus;

type
  TExtFileForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    QryExtFile: TIBOQuery;
    SourceExtFile: TDataSource;
    QryExtFileCODICE: TIntegerField;
    QryExtFileDATA: TDateTimeField;
    QryExtFileCLIENTE: TIntegerField;
    QryExtFileOGGETTO: TStringField;
    QryExtFilePRGASSOCIATO: TIntegerField;
    QryExtFilePRATICA: TIntegerField;
    QryExtFileNOTE: TStringField;
    QryExtFilePRATICA2: TIntegerField;
    QryExtFilePRATICA3: TIntegerField;
    QryExtFileARGOMENTO: TStringField;
    QryExtFilePROVENIENZA: TStringField;
    QryExtFileDATAPRATICA1: TDateTimeField;
    QryExtFileDATAPRATICA2: TDateTimeField;
    QryExtFileDATAPRATICA3: TDateTimeField;
    QryExtFileSTATODESCRIZIONE: TStringField;
    QryExtFileSTATOFOREGROUND: TStringField;
    QryExtFileSTATOBACKGROUND: TStringField;
    QryExtFileRAGSOCCLI: TStringField;
    QryExtFileINDIRIZZOCLI: TStringField;
    QryExtFileCITTACLI: TStringField;
    QryExtFileCAPCLI: TStringField;
    QryExtFilePROVINCIACLI: TStringField;
    QryExtFileFILEBLOB: TMemoField;
    TimerOpenDelay: TTimer;
    QryExtFileNUMCIVICOCLI: TStringField;
    QryExtFileREGISTRO: TStringField;
    BitBtn1: TBitBtn;
    FormMainPanel: TPanel;
    ClientArea: TPanel;
    SBVisualizzaDocumento: TSpeedButtonRollOver;
    PanelNumeroData: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    PanelSoggetto: TPanel;
    Label43: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    DBText1: TDBText;
    BitBtnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    BitBtnSelezioneStato: TSpeedButtonRollOver;
    BitBtnTipoDocumento: TSpeedButtonRollOver;
    Stato: TDBEdit;
    RagioneSociale: TEdit;
    TipoDocumento: TEdit;
    PanelOggetto: TPanel;
    Label31: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Oggetto: TDBEdit;
    PanelPratiche: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label16: TLabel;
    BitBtnPratica1: TSpeedButtonRollOver;
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
    Bevel1: TBevel;
    CodPrat1: TDBEdit;
    CodPrat2: TDBEdit;
    CodPrat3: TDBEdit;
    DataPrat1: TDBEdit;
    DataPrat2: TDBEdit;
    DataPrat3: TDBEdit;
    DescPrat2: TDBEdit;
    DescPrat3: TDBEdit;
    EditDescrizionePratica1: TEdit;
    SplitterAllegati: TcxSplitter;
    PanelAllegati: TPanel;
    LabelDocumento: TLabel;
    NumDoc: TcxDBTextEdit;
    Registro: TcxDBComboBox;
    DataDoc: TcxDBDateEdit;
    ShapeDocumento: TShape;
    PanelCantiere: TPanel;
    LabelCantiere: TLabel;
    SBPratica1: TSpeedButtonRollOver;
    DbeDescrizioneCantiere: TcxTextEdit;
    PanelAgenti: TPanel;
    LabelAgente: TLabel;
    dbeAgente: TcxDBComboBox;
    LabelAgente2: TLabel;
    dbeAgente2: TcxDBComboBox;
    LabelAgente3: TLabel;
    dbeAgente3: TcxDBComboBox;
    LabelAgente4: TLabel;
    dbeAgente4: TcxDBComboBox;
    PanelOperatore: TPanel;
    Label56: TLabel;
    Label30: TLabel;
    DBText90: TDBText;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label114: TLabel;
    DBEConsegnaGG: TDBEdit;
    DBEValiditaGG: TDBEdit;
    DBEConsegnato: TDBCheckBox;
    PanelAltriSoggetti: TPanel;
    Label70: TLabel;
    Label21: TLabel;
    Label71: TLabel;
    Label125: TLabel;
    SbRifSogg2: TSpeedButtonRollOver;
    SbRifSogg3: TSpeedButtonRollOver;
    SbRifSogg1: TSpeedButtonRollOver;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    SbRifSogg5: TSpeedButtonRollOver;
    SbRifSogg6: TSpeedButtonRollOver;
    SbRifSogg4: TSpeedButtonRollOver;
    DbeRifSogg1Tipo: TDBEdit;
    DbeRifSogg2Tipo: TDBEdit;
    DbeRifSogg3Tipo: TDBEdit;
    DbeRifSogg4Tipo: TDBEdit;
    DbeRifSogg5Tipo: TDBEdit;
    DbeRifSogg6Tipo: TDBEdit;
    DbeRifSogg1Codice: TDBEdit;
    DbeRifSogg2Codice: TDBEdit;
    DbeRifSogg3Codice: TDBEdit;
    DbeRifSogg4Codice: TDBEdit;
    DbeRifSogg5Codice: TDBEdit;
    DbeRifSogg6Codice: TDBEdit;
    DbeRifSogg1RagSoc: TDBEdit;
    DbeRifSogg2RagSoc: TDBEdit;
    DbeRifSogg3RagSoc: TDBEdit;
    DbeRifSogg4RagSoc: TDBEdit;
    DbeRifSogg5RagSoc: TDBEdit;
    DbeRifSogg6RagSoc: TDBEdit;
    Label6: TLabel;
    SbRifSogg7: TSpeedButtonRollOver;
    DbeRifSogg7Tipo: TDBEdit;
    DbeRifSogg7Codice: TDBEdit;
    DbeRifSogg7RagSoc: TDBEdit;
    Label7: TLabel;
    SbRifSogg8: TSpeedButtonRollOver;
    DbeRifSogg8Tipo: TDBEdit;
    DbeRifSogg8Codice: TDBEdit;
    DbeRifSogg8RagSoc: TDBEdit;
    Label8: TLabel;
    SbRifSogg9: TSpeedButtonRollOver;
    DbeRifSogg9Tipo: TDBEdit;
    DbeRifSogg9Codice: TDBEdit;
    DbeRifSogg9RagSoc: TDBEdit;
    Label10: TLabel;
    SbRifSogg10: TSpeedButtonRollOver;
    DbeRifSogg10Tipo: TDBEdit;
    DbeRifSogg10Codice: TDBEdit;
    DbeRifSogg10RagSoc: TDBEdit;
    QryExtFileAGENTE: TStringField;
    QryExtFileAGENTE2: TStringField;
    QryExtFileAGENTE3: TStringField;
    QryExtFileAGENTE4: TStringField;
    QryExtFileCONSEGNAGG: TSmallintField;
    QryExtFileCONSEGNADATA: TDateTimeField;
    QryExtFileCONSEGNATO: TStringField;
    QryExtFileVALIDITAGG: TSmallintField;
    QryExtFileVALIDITADATA: TDateTimeField;
    QryExtFileOPERATORE: TStringField;
    QryExtFileRIFSOGG1_TIPO: TStringField;
    QryExtFileRIFSOGG1_CODICE: TIntegerField;
    QryExtFileRIFSOGG1_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG2_TIPO: TStringField;
    QryExtFileRIFSOGG2_CODICE: TIntegerField;
    QryExtFileRIFSOGG2_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG3_TIPO: TStringField;
    QryExtFileRIFSOGG3_CODICE: TIntegerField;
    QryExtFileRIFSOGG3_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG4_TIPO: TStringField;
    QryExtFileRIFSOGG4_CODICE: TIntegerField;
    QryExtFileRIFSOGG4_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG5_TIPO: TStringField;
    QryExtFileRIFSOGG5_CODICE: TIntegerField;
    QryExtFileRIFSOGG5_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG6_TIPO: TStringField;
    QryExtFileRIFSOGG6_CODICE: TIntegerField;
    QryExtFileRIFSOGG6_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG7_TIPO: TStringField;
    QryExtFileRIFSOGG7_CODICE: TIntegerField;
    QryExtFileRIFSOGG7_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG8_TIPO: TStringField;
    QryExtFileRIFSOGG8_CODICE: TIntegerField;
    QryExtFileRIFSOGG8_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG9_TIPO: TStringField;
    QryExtFileRIFSOGG9_CODICE: TIntegerField;
    QryExtFileRIFSOGG9_RAGIONESOCIALE: TStringField;
    QryExtFileRIFSOGG10_TIPO: TStringField;
    QryExtFileRIFSOGG10_CODICE: TIntegerField;
    QryExtFileRIFSOGG10_RAGIONESOCIALE: TStringField;
    Note: TDBMemo;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
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
    QryExtPrg: TIBOQuery;
    QryExtPrgCMDLINE: TStringField;
    QryExtPrgESTENSIONE: TStringField;
    QryExtPrgBLANKFILE: TBlobField;
    PopupMenuAzzeraCantiereImpianto: TPopupMenu;
    Deselezionacantiereimpianto1: TMenuItem;
    PopupMenuAzzeramentoStato: TPopupMenu;
    AzzeraStato1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RegistroEnter(Sender: TObject);
    procedure RegistroExit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure BitBtnClienteClick(Sender: TObject);
    procedure BitBtnPratica2Click(Sender: TObject);
    procedure BitBtnPratica3Click(Sender: TObject);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure QryExtFileCLIENTEChange(Sender: TField);
    procedure QryExtFilePRGASSOCIATOChange(Sender: TField);
    procedure BitBtnTipoDocumentoClick(Sender: TObject);
    procedure TimerOpenDelayTimer(Sender: TObject);
    procedure OpenExtFileDelay;
    procedure SBVisualizzaDocumentoClick(Sender: TObject);
    procedure CaricaFormLayout;
    procedure QryExtFilePRATICAChange(Sender: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure SplitterAllegatiBeforeOpen(Sender: TObject;
      var NewSize: Integer; var AllowOpen: Boolean);
    procedure QryExtFileAfterPost(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure SplitterAllegatiMoved(Sender: TObject);
    procedure DBComboRegistroPropertiesInitPopup(Sender: TObject);
    procedure SBPratica1Click(Sender: TObject);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure SbRifSogg1Click(Sender: TObject);
    procedure SbRifSogg2Click(Sender: TObject);
    procedure SbRifSogg3Click(Sender: TObject);
    procedure SbRifSogg4Click(Sender: TObject);
    procedure SbRifSogg5Click(Sender: TObject);
    procedure SbRifSogg6Click(Sender: TObject);
    procedure SbRifSogg7Click(Sender: TObject);
    procedure SbRifSogg8Click(Sender: TObject);
    procedure SbRifSogg9Click(Sender: TObject);
    procedure SbRifSogg10Click(Sender: TObject);
    procedure QryExtFileRIFSOGG1_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG2_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG3_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG4_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG5_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG6_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG7_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG8_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG9_CODICEChange(Sender: TField);
    procedure QryExtFileRIFSOGG10_CODICEChange(Sender: TField);
    procedure QryExtFileCONSEGNAGGChange(Sender: TField);
    procedure QryExtFileCONSEGNADATAChange(Sender: TField);
    procedure QryExtFileVALIDITAGGChange(Sender: TField);
    procedure QryExtFileVALIDITADATAChange(Sender: TField);
    procedure QryExtFileDATAChange(Sender: TField);
    procedure EditDescrizionePratica1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeAgentePropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure dbeAgentePropertiesInitPopup(Sender: TObject);
    procedure dbeAgente2PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente3PropertiesInitPopup(Sender: TObject);
    procedure dbeAgente4PropertiesInitPopup(Sender: TObject);
    procedure DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
    procedure Deselezionacantiereimpianto1Click(Sender: TObject);
    procedure AzzeraStato1Click(Sender: TObject);
    procedure StatoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    NomeExtFile: String;     // Contiene il nome del file esterno da usare in questa sessione

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    // Puntatore alla form degli Allegati relativa a questa form stessa
    fAllegatiForm: TAllegatiForm;
    procedure Allegati_CreaForm;
    procedure Allegati_AggiornaDatiFiltri;
    procedure Allegati_VerificaAbilitazione;
    // =========================================================================

    procedure RicalcolaDimensioni;
    function GetCollegamentoExtPrg: Boolean;
  public
    { Public declarations }
     // Queste contengono i riferimenti al record da visualizzare/editare
     CodiceExtFile:Longint;
     RegistroExtFile:String;
     DataExtFile:TDate;
     CodiceCliente,CodicePratica,DataPratica : String;
     CodiceExtPrg: Integer;
     property CollegamentoExtPrg:Boolean read GetCollegamentoExtPrg;
  end;

var
  ExtFileForm: TExtFileForm;

implementation

uses DataModule1, DataModule2, main, FormHelp, IniFiles;

{$R *.DFM}



// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che crea la form degli allegati se questa non esiste già e la
  //  apre, alla fine esegue l'interrogazione per mostrare gli allegati.
  procedure TExtFileForm.Allegati_CreaForm;
  begin
    // Se la form degli allegati non è stata ancora creata la crea.
    if not Assigned(fAllegatiForm) then begin
      // Crea la form degli allegati
      fAllegatiForm := MainForm.Allegati_CreaForm(PanelAllegati);
      fAllegatiForm.Mode := amExtFile;
    end;
    // Passa lo Splitter alla finestra degli allegati
    fAllegatiForm.Splitter := SplitterAllegati;
    // Imposta i filtri
    Allegati_AggiornaDatiFiltri;
  end;

  // Procedure che aggiorna i filtri di collegamento della form degli allegati
  //  con la form attuale
  procedure TExtFileForm.Allegati_AggiornaDatiFiltri;
  begin
    // Ovviamente se la form degli allegati è chiusa esce subito
    if fAllegatiForm = nil then Exit;

    // Azzeramento filtri
    fAllegatiForm.AzzeraFiltri;

    // Codice soggetto
    if not QryExtFileCLIENTE.IsNull then fAllegatiForm.Filter_CodSogg := QryExtFileCLIENTE.Value;

    // Codice Pratica
    if not QryExtFilePRATICA.IsNull then fAllegatiForm.Filter_CodPrat := QryExtFilePRATICA.Value;
    // Data Pratica
    if not QryExtFileDATAPRATICA1.IsNull then fAllegatiForm.Filter_DataPrat := QryExtFileDATAPRATICA1.Value;

    // Tipo Documento
    fAllegatiForm.Filter_TipoDoc := 'Doc.esterno';
    // Registro Documento
    if not QryExtFileREGISTRO.IsNull then fAllegatiForm.Filter_RegDoc := QryExtFileREGISTRO.Value;
    // Numero documento
    if not QryExtFileCODICE.IsNull then fAllegatiForm.Filter_NumDoc := QryExtFileCODICE.Value;
    // Data documento
    if not QryExtFileDATA.IsNull then fAllegatiForm.Filter_DataDoc := QryExtFileDATA.Value;

    // Imposta i filtri
    fAllegatiForm.ImpostaFiltri;

    // Effettua l'interrogazione
    fAllegatiForm.EseguiQuery;
  end;

  // Procedure che determina se la form degli allegati debba essere aperta oppure no e inoltre
  //  determina anche se l'utente ha la possibilità di aprirla manualmente oppure no.
  procedure TExtFileForm.Allegati_VerificaAbilitazione;
  begin
    // Se siamo in un inserimento ex-novo di un nuovo documento e il dataset del documento
    //  stesso è in stato dsInsert non rende ne visibile ne apribile la form degli allegati
    //  perchè abbiamo scelto che non si possono inserire allegati in documento in fase
    //  di creazione finchè non è stato confermato almeno la prima volta.
    if (QryExtFile.State = dsInsert) or CollegamentoExtPrg then begin
      SplitterAllegati.CloseSplitter;
      SplitterAllegati.Enabled := False;
    end else begin
      Allegati_CreaForm;
      RicalcolaDimensioni;   // Lasciarlo perchè altrimenti scazza
      SplitterAllegati.OpenSplitter;
      SplitterAllegati.Enabled := True;
    end;
  end;

procedure TExtFileForm.AzzeraStato1Click(Sender: TObject);
begin
  if not RxSpeedModifica.Down then
  begin
    DM1.Messaggi('Levante', 'Devi essere in modalità di modifica', '', [mbOk], 0, nil);
    Exit;
  end;

  if DM1.Messaggi('Azzera stato', 'Confermi di voler azzerare lo stato?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    QryExtFileSTATODESCRIZIONE.Clear;
    QryExtFileSTATOFOREGROUND.Clear;
    QryExtFileSTATOBACKGROUND.Clear;
    NumDoc.SetFocus;
    Stato.SetFocus;
  end;
end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================



procedure TExtFileForm.FormCreate(Sender: TObject);
begin
   // Chiude il pannello relativo agli allegati
   SplitterAllegati.CloseSplitter;
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Documenti esterni)';
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(ExtFileForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, FormMainPanel, True);
   ClientArea.ParentColor := True;
   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
   // Crea il nome del file esterno da utilizzare in questa sessione (deve essere composto da 'Levante_' + HHMMSS + '.XXX' in modo che più copie
   //  del programma usino sempre un nome di file diverso senza collisioni)
   // NB: Il nome deve essere senza estensione perchè a questo punto non si sà ancora qual'è, l'estensione verrà aggiunta in seguito.
   NomeExtFile := DM1.CartellaTmp + 'Levante_' + FormatDateTime('hhmmss', Now) + '.';
end;

procedure TExtFileForm.FormKeyUp(Sender: TObject; var Key: Word;
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

      // F10 = Visualizza
      121: begin
         if RxSpeedButtonVisualizza.Enabled then begin
            RxSpeedButtonVisualizzaClick(Self);
         end;
      end;

   end;
end;

procedure TExtFileForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TExtFileForm.RxSpeedModificaClick(Sender: TObject);
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
          QryExtFile.Edit;
          RxSpeedButtonVisualizza.Enabled    := False;
          RxSpeedButtonUscita.Enabled        := False;
          BitBtnSelezioneStato.Enabled       := True;
          SBPratica1.Enabled                 := True;
          BitBtnPratica1.Enabled             := True;
          BitBtnPratica2.Enabled             := True;
          BitBtnPratica3.Enabled             := True;
          BitBtnCliente.Enabled              := True;
          BitBtnTipoDocumento.Enabled        := True;
          BitBtnSelezioneStato.Enabled       := True;
          SbRifSogg1.Enabled                 := True;
          SbRifSogg2.Enabled                 := True;
          SbRifSogg3.Enabled                 := True;
          SbRifSogg4.Enabled                 := True;
          SbRifSogg5.Enabled                 := True;
          SbRifSogg6.Enabled                 := True;
          SbRifSogg7.Enabled                 := True;
          SbRifSogg8.Enabled                 := True;
          SbRifSogg9.Enabled                 := True;
          SbRifSogg10.Enabled                := True;
          SBVisualizzaDocumento.Enabled  := False;
          DM1.ColoraTuttiCampi(ExtFileForm, COLOR_MODIFICA);
          // focus sul primo campo editabile
          NumDoc.SetFocus;
          TipoDocumento.SetFocus;
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
          QryExtFile.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice è nullo (nuovo) ne assegna uno.
               if QryExtFileCodice.IsNull then begin
                  QryExtFileCodice.Value := DM1.NextNumRegistroData('EXTFILE', 'CODICE', 'DATA', QryExtFileREGISTRO.AsString, QryExtFileDATA.AsDateTime);
               end;
               QryExtFile.Post;
               QryExtFile.ApplyUpdates;
               QryExtFile.CommitUpdates;
               // Se la form è stata richiamata per creare un nuovo documento, apre automaticamente
               //  il documento esterno
               if (Tag = 2) and CollegamentoExtPrg then OpenExtFileDelay;
          end else if MR = mrNo then begin
             if QryExtFile.State = dsInsert then begin
                QryExtFile.Cancel;
                QryExtFile.CommitUpdates;
                DM1.ChiudiAttendere;
                Close;
                Exit;
             end else begin
                QryExtFile.Cancel;
                QryExtFile.CommitUpdates;
             end;
          end else begin
               RxSpeedModifica.Down := True;
               DM1.ChiudiAttendere;
               Exit;
          end;
          // Ripristina i pulsanti e i campi
          RxSpeedButtonVisualizza.Enabled    := True;
          RxSpeedButtonUscita.Enabled        := True;
          BitBtnSelezioneStato.Enabled       := False;
          SBPratica1.Enabled                 := False;
          BitBtnPratica1.Enabled             := False;
          BitBtnPratica2.Enabled             := False;
          BitBtnPratica3.Enabled             := False;
          BitBtnCliente.Enabled              := False;
          BitBtnTipoDocumento.Enabled        := False;
          BitBtnSelezioneStato.Enabled       := False;
          SbRifSogg1.Enabled                 := False;
          SbRifSogg2.Enabled                 := False;
          SbRifSogg3.Enabled                 := False;
          SbRifSogg4.Enabled                 := False;
          SbRifSogg5.Enabled                 := False;
          SbRifSogg6.Enabled                 := False;
          SbRifSogg7.Enabled                 := False;
          SbRifSogg8.Enabled                 := False;
          SbRifSogg9.Enabled                 := False;
          SbRifSogg10.Enabled                := False;
          SBVisualizzaDocumento.Enabled  := True;
          DM1.ColoraTuttiCampi(ExtFileForm, COLOR_NORMALE);
          // focus sul primo campo editabile
          NumDoc.SetFocus;
          TipoDocumento.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryExtFile.Edit;
          end;
       end;
     end;
     DM1.ChiudiAttendere;
end;

{
procedure TExtFileForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
var
   Qry:TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(Self);
   DM1.Attendere;
   try
      // Controlla che sia stato scelto un collegamento a programma esterno
      if not QryExtFilePRGASSOCIATO.IsNull then begin
         // Crea la query che
         // Si sposta sul record relativo al programma associato al file
         //  che si vuole aprire.
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         Qry.SQL.Add('SELECT CMDLINE, ESTENSIONE, BLANKFILE FROM EXTPRG WHERE CODICE = ' + QryExtFilePRGASSOCIATO.AsString);
         Qry.Open;
         if not Qry.Eof then begin
            // Se non è in modifica pone la tabella in EDITING in modo da bloccare il record
            //  altrimenti altri utenti potrebbero modificare il documento esterno contemporaneamente visto che
            //  ognuno opererebbe su una propria copia locale del file, così invece non possono
            //  perchè se il record è già bloccato dà un errore e non lo faccio continuare
            if not RxSpeedModifica.Down then QryExtFile.Edit;
            // Se non è stato ancora associato un file del programma relativo al record corrente
            //  provvede a farlo (quindi gli assegna il nome appropriato e il percorso); altrimenti
            //  se ha già un file associato lo apre con il programma appropriato.
            if QryExtFileFileBlob.IsNull then begin
               // Preleva dalla tabella dei collegamenti ai programmi esterni il file blank di default del collegamento
               //  e lo salva nella cartella temporanea per poi aprirlo con il programma prescelto
               Qry.FieldByName('BLANKFILE').SaveToFile(NomeExtFile + Qry.FieldByName('ESTENSIONE').AsString);
            // Se invece non è nullo lo preleva dal blob del record del documento corrente
            end else begin
               //  e lo salva nella cartella temporanea per poi aprirlo con il programma prescelto
               QryExtFileFileBlob.SaveToFile(NomeExtFile + Qry.FieldByName('ESTENSIONE').AsString);
            end;

            // Apre il programma collegato con il file
//            DM1.WinExecAndWait32(Qry.FieldByName('CMDLINE').AsString + ' ' + NomeExtFile + Qry.FieldByName('ESTENSIONE').AsString, SW_MAXIMIZE);
            DM1.RunAndWaitShell(NomeExtFile + Qry.FieldByName('ESTENSIONE').AsString, '', Self.Handle, SW_MAXIMIZE);

            // Una volta chiuso il file esterno lo risalva nel blob per salvare le modofiche effettuate
            QryExtFileFileBlob.LoadFromFile(NomeExtFile + Qry.FieldByName('ESTENSIONE').AsString);
            // Sblocca il record (vedi sopra)
            if not RxSpeedModifica.Down then QryExtFile.Post;
         end else begin
            DM1.Messaggi('Documenti Esterni', 'Programma associato al file non trovato nell''archivio dei programmi esterni.', '', [mbOK], 0, nil);
         end;
      end else begin
         DM1.Messaggi('Documenti Esterni', 'Tipo documento esterno non selezionato.'#13#13#13'Non è possibile aprire il documento esterno', '', [mbOK], 0, nil);
      end;
   finally
      Qry.Close;
      Qry.Free;
      DM1.ChiudiAttendere;
   end;
end;
}
procedure TExtFileForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
   DM1.Attendere;
   try
      // Controlla che sia stato scelto un collegamento a programma esterno
      if not QryExtFilePRGASSOCIATO.IsNull then begin
         // Crea la query che
         // Si sposta sul record relativo al programma associato al file
         //  che si vuole aprire.
         QryExtPrg.Close;
         QryExtPrg.SQL.Clear;
         QryExtPrg.SQL.Add('SELECT CMDLINE, ESTENSIONE, BLANKFILE FROM EXTPRG WHERE CODICE = ' + QryExtFilePRGASSOCIATO.AsString);
         QryExtPrg.Open;
         if not QryExtPrg.Eof then begin
            // Se non è in modifica pone la tabella in EDITING in modo da bloccare il record
            //  altrimenti altri utenti potrebbero modificare il documento esterno contemporaneamente visto che
            //  ognuno opererebbe su una propria copia locale del file, così invece non possono
            //  perchè se il record è già bloccato dà un errore e non lo faccio continuare
            if not RxSpeedModifica.Down then QryExtFile.Edit;
            // Se non è stato ancora associato un file del programma relativo al record corrente
            //  provvede a farlo (quindi gli assegna il nome appropriato e il percorso); altrimenti
            //  se ha già un file associato lo apre con il programma appropriato.
            if QryExtFileFileBlob.IsNull then begin
               // Preleva dalla tabella dei collegamenti ai programmi esterni il file blank di default del collegamento
               //  e lo salva nella cartella temporanea per poi aprirlo con il programma prescelto
               QryExtPrgBLANKFILE.SaveToFile(NomeExtFile + QryExtPrgESTENSIONE.AsString);
            // Se invece non è nullo lo preleva dal blob del record del documento corrente
            end else begin
               //  e lo salva nella cartella temporanea per poi aprirlo con il programma prescelto
               QryExtFileFileBlob.SaveToFile(NomeExtFile + QryExtPrg.FieldByName('ESTENSIONE').AsString);
            end;

            // Apre il programma collegato con il file
//            DM1.WinExecAndWait32(Qry.FieldByName('CMDLINE').AsString + ' ' + NomeExtFile + Qry.FieldByName('ESTENSIONE').AsString, SW_MAXIMIZE);
            DM1.RunAndWaitShell(NomeExtFile + QryExtPrgESTENSIONE.AsString, '', Self.Handle, SW_MAXIMIZE);

            // Una volta chiuso il file esterno lo risalva nel blob per salvare le modofiche effettuate
            QryExtFileFileBlob.LoadFromFile(NomeExtFile + QryExtPrgESTENSIONE.AsString);
            // Sblocca il record (vedi sopra)
            if not RxSpeedModifica.Down then QryExtFile.Post;
         end else begin
            DM1.Messaggi('Documenti Esterni', 'Programma associato al file non trovato nell''archivio dei programmi esterni.', '', [mbOK], 0, nil);
         end;
      end else begin
         DM1.Messaggi('Documenti Esterni', 'Tipo documento esterno non selezionato.'#13#13#13'Non è possibile aprire il documento esterno', '', [mbOK], 0, nil);
      end;
   finally
      DM1.ChiudiAttendere;
   end;
end;



procedure TExtFileForm.CaricaFormLayout;
var
  LO : TMemIniFile;
  Sezione: String;
  Sep, YY: Integer;
begin
   // ------ CARICAMENTO PULSANTI E BOTTONI
   SBVisualizzaDocumento.Glyph.LoadFromFile(DM1.TemaDir + 'btn_visualizza_doc.bmp');

   // Apre il file che contiene i layouts di stampa e visualizzazione dei documenti.
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try

     // ==========================================================================
     // ABILITA/DISABILITA PANNELLI
     // --------------------------------------------------------------------------

     // Inizializzazione
     Sezione := 'ExtFileForm';
     YY := 0;
     Sep := LO.ReadInteger(Sezione, 'SeparazioneVerticale', 5) * 2;

     // PanelNumeroData
     if (LO.ReadBool(Sezione, 'V_PanelNumData', True)) then begin
       PanelNumeroData.Top := YY;
       PanelNumeroData.Visible := True;
       YY := YY + PanelNumeroData.Height;
     end else PanelNumeroData.Visible := False;

     // PanelSoggetto
     if (LO.ReadBool(Sezione, 'V_PanelSoggetto', True)) then begin
       YY := YY + Sep;
       PanelSoggetto.Top := YY;
       PanelSoggetto.Visible := True;
       // SubPanel Agenti
       // Agente 1
       LabelAgente.Caption  := DM1.GridsColumnAgenteCaption;
       dbeAgente.Visible    := (DM1.GridsColumnAgenteCaption <> '');
       // Agente 2
       LabelAgente2.Caption := DM1.GridsColumnAgente2Caption;
       dbeAgente2.Visible   := (DM1.GridsColumnAgente2Caption <> '');
       // Agente 3
       LabelAgente3.Caption := DM1.GridsColumnAgente3Caption;
       dbeAgente3.Visible   := (DM1.GridsColumnAgente3Caption <> '');
       // Agente 4
       LabelAgente4.Caption := DM1.GridsColumnAgente4Caption;
       dbeAgente4.Visible   := (DM1.GridsColumnAgente4Caption <> '');
       // Se almeno uno dei campi agente è attivo e se il pannello è autorizzato a visualizzarsi, si visualizza
       PanelAgenti.Visible  := (LO.ReadBool(Sezione, 'V_PanelAgenti', True))   and   (   dbeAgente.Visible or dbeAgente2.Visible or dbeAgente3.Visible or dbeAgente4.Visible   );
       // Se il pannello agenti non deve essere visualizzato ridimensiona anche il MainPanel
       if not PanelAgenti.Visible then begin
         PanelSoggetto.Height  := PanelSoggetto.Height - PanelAgenti.Height;
       end;
       // Aggiorna i parametri
       YY := YY + PanelSoggetto.Height;
     end else PanelSoggetto.Visible := False;

     // PanelOggetto
     if (LO.ReadBool(Sezione, 'V_PanelOggetto', True)) then begin
       YY := YY + Sep;
       PanelOggetto.Top := YY;
       PanelOggetto.Visible := True;
       YY := YY + PanelOggetto.Height;
     end else PanelOggetto.Visible := False;

     // PanelOperatore
     if (LO.ReadBool(Sezione, 'V_PanelOperatore', True)) then begin
       YY := YY + Sep;
       PanelOperatore.Top := YY;
       PanelOperatore.Visible := True;
       YY := YY + PanelOperatore.Height;
     end else PanelOperatore.Visible := False;

     // PanelAltriSoggetti
     if (LO.ReadBool(Sezione, 'V_PanelAltriSoggetti', True)) then begin
       YY := YY + Sep;
       PanelAltriSoggetti.Top := YY;
       PanelAltriSoggetti.Visible := True;
       YY := YY + PanelAltriSoggetti.Height;
     end else PanelAltriSoggetti.Visible := False;

     // SBVisualizzaDocumento
     if CollegamentoExtPrg then begin
       YY := YY + (Sep * 4);
       SBVisualizzaDocumento.Top := YY;
       SBVisualizzaDocumento.Visible := True;
       YY := YY + SBVisualizzaDocumento.Height;
     end;


     // Dimensiona la ClientArea
     ClientArea.Height := YY + 1;
     // ==========================================================================

   finally
     // Pulizie finali
     LO.Free;
   end;
end;



procedure TExtFileForm.FormShow(Sender: TObject);
begin
      // Carica il layout della form
      CaricaFormLayout;

      DM1.FocusRefresh;
      // In base al valore di 'Tag' apre la form in diverse modalità...
      case Tag of
         // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
         1: begin
            // IMposta la query per richiamare il record da modificare
            QryExtFile.Close;
            QryExtFile.SQL.Clear;
            QryExtFile.SQL.Add('SELECT * FROM EXTFILE WHERE CODICE = ' + IntToStr(CodiceExtFile) + ' AND REGISTRO = ''' + RegistroExtFile + ''' AND DATA = ''' + FormatDateTime('mm/dd/yyyy', DataExtFile) + '''');
            QryExtFile.Open;
            // Se trova il record procede, altrimenti visualizza un errore ed esce dalla form
            if QryExtFile.Eof then begin
               MessageDlg('Documento non trovato!', mtError, [mbOK], 0);
               Close;
               Exit;
            end;
         end;
         // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
         2: begin
            // Se non è aperta, apre la query vuota in modo da poter inserire un nuovo record
            if not QryExtFile.Active then begin QryExtFile.SQL.Clear; QryExtFile.SQL.Add('SELECT * FROM EXTFILE WHERE CODICE = -9999'); QryExtFile.Open; end;
            // Agiungle il nuovo record
            QryExtFile.Append;
             QryExtFileData.Value     := Date;
             QryExtFileCliente.Value  := StrToInt(CodiceCliente);
             QryExtFilePRGASSOCIATO.Value := CodiceExtPrg;
             QryExtFileCONSEGNATO.Value := 'F';
             if CodicePratica <> '' then QryExtFilePratica.Value       := StrToInt(CodicePratica);
             if DataPratica <> ''   then QryExtFileDataPratica1.Value  := StrToDate(DataPratica);
            //  Pone la form direttamente in modalità di modifica
            RxSpeedModifica.Down := True;
            RxSpeedModificaClick(Self);
         end;
      end;

      // Carica i dati del cliente
      if not QryExtFileCliente.IsNull then DM1.CaricaRagSocCli(QryExtFileCliente.Value, RagioneSociale);

      // Carica la descrizione del programma esterno
      if not QryExtFilePRGASSOCIATO.IsNull then DM1.CaricaTipoExtFile(QryExtFilePRGASSOCIATO.Value, TipoDocumento, nil);

      // Carica la descrizione delle pratiche
      if (not QryExtFilePRATICA.IsNull)  and (not QryExtFileDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QryExtFilePRATICA.Value,  QryExtFileDATAPRATICA1.Value, EditDescrizionePratica1);

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if DM1.ModCtrl(MOD_EXT_FILE) > 1 then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;

   // Sposta il focus sul primo campo editabile
   NumDoc.SetFocus;
   Oggetto.SetFocus;

   // Decide se gli allegati devono essere già visibili oppure no.
   Allegati_VerificaAbilitazione;

   // Se siamo in un DOcumento esterno con collegamento e ExtPrg (in pratica il tipo vecchio) il pulsante di apertura
   //  del file setreno sarà visibile altrimenti no
   SBVisualizzaDocumento.Visible  := CollegamentoExtPrg;
   SplitterAllegati.Visible       := not CollegamentoExtPrg;
   // Se la form è stata richiamata per visualizzare un documento già esistenze, apre automaticamente
   //  il documento esterno
   if CollegamentoExtPrg and (Tag = 1) then OpenExtFileDelay;
end;

procedure TExtFileForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
end;

procedure TExtFileForm.RegistroEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TExtFileForm.RegistroExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TExtFileForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('FILES ESTERNI');
end;

procedure TExtFileForm.BitBtnClienteClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryExtFileCliente, QryExtFilePRATICA, QryExtFileDATAPRATICA1, '');
end;

procedure TExtFileForm.BitBtnPratica2Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QryExtFilePratica2,
                        QryExtFileDataPratica2,
                        nil,
                        nil,
                        QryExtFileCliente.Value);
end;

procedure TExtFileForm.BitBtnPratica3Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(QryExtFilePratica3,
                        QryExtFileDataPratica3,
                        nil,
                        nil,
                        QryExtFileCliente.Value);
end;

procedure TExtFileForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
   // Richiama la selezione dello stato del documento
   DM1.SelezionaStato('Files est.', QryExtFile, 0);
end;

procedure TExtFileForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryExtFileCliente.Value);
end;

procedure TExtFileForm.QryExtFileCLIENTEChange(Sender: TField);
begin
   // Carica la descrizione pagamento
   if not QryExtFileCliente.IsNull then DM1.CaricaRagSocCli(QryExtFileCliente.Value, RagioneSociale);
   // Carica gli agenti
   DM1.SetAgenti(QryExtFile, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');
end;

procedure TExtFileForm.QryExtFilePRGASSOCIATOChange(Sender: TField);
begin
   // Carica la descrizione del programma esterno collegato
   if not QryExtFilePRGASSOCIATO.IsNull then DM1.CaricaTipoExtFile(QryExtFilePRGASSOCIATO.Value, TipoDocumento, QryExtFileREGISTRO);
end;

procedure TExtFileForm.BitBtnTipoDocumentoClick(Sender: TObject);
begin
   // Richiama la form per la selezione del tipo di documento esterno che si vuole creare
   DM1.SelezionaTipoExtFile(QryExtFilePRGASSOCIATO);
end;



procedure TExtFileForm.OpenExtFileDelay;
begin
   // Questa funzione avvia il timer per lìavvio ritardato
   //  dell'applicazione esterna con il documento esterno
   //  aperto.
   // ----------------------------------------------------
   DM1.ShowWait('Documenti esterni', 'Apertura documento esterno in corso...');
   TimerOpenDelay.Enabled := True;
end;

procedure TExtFileForm.TimerOpenDelayTimer(Sender: TObject);
begin
   // Prima di tutto disattiva il timer
   TimerOpenDelay.Enabled := False;
   // Chiude il messaggio di attesa aperto precedentemente dalla
   //  procedura che avvia il timer per l'apertura ritardata del
   //  documento esterno
   DM1.CloseWait;
   // Si assicura che la form sia aggiornata altrimenti scazza un pò la visualizzazione
   Update;
   Application.ProcessMessages;
   // Lancia l'applicazione esterna con il file aperto
   RxSpeedButtonVisualizzaClick(RxSpeedButtonVisualizza);
end;

procedure TExtFileForm.SBVisualizzaDocumentoClick(Sender: TObject);
begin
   // Apre il documento esterno
   RxSpeedButtonVisualizzaClick(RxSpeedButtonVisualizza);
end;

procedure TExtFileForm.QryExtFilePRATICAChange(Sender: TField);
begin
   // Carica la descrizione delle pratiche
   if (not QryExtFilePRATICA.IsNull)  and (not QryExtFileDATAPRATICA1.IsNull) then DM1.CaricaDescrizionePratica(QryExtFilePRATICA.Value,  QryExtFileDATAPRATICA1.Value, EditDescrizionePratica1);
   // Carica gli agenti
   DM1.SetAgenti(QryExtFile, 'CLIENTE', 'PRATICA', 'DATAPRATICA1');
end;

procedure TExtFileForm.BitBtn1Click(Sender: TObject);
begin
  ShowMessage(DM1.GetExeByExtension('.txt'));
end;

procedure TExtFileForm.SplitterAllegatiBeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
  AllowOpen := True;
end;

procedure TExtFileForm.QryExtFileAfterPost(DataSet: TDataSet);
begin
  // Decide se gli allegati devono essere già visibili oppure no.
  Allegati_VerificaAbilitazione;
end;

procedure TExtFileForm.RicalcolaDimensioni;
const
   LEFT_BORDER                  = 16;
   RIGHT_BORDER                 = 16;
   TOP_BORDER                   = 84;
   BOTTOM_BORDER                = 5;
begin
   // Imposta le dimensioni del pannello principale
   FormMainPanel.Left    := LEFT_BORDER;
   FormMainPanel.Top     := TOP_BORDER;
   FormMainPanel.Width   := Self.Width - LEFT_BORDER - RIGHT_BORDER;
   FormMainPanel.Height  := Self.Height - TOP_BORDER - BOTTOM_BORDER;
   // IMposta le dimensioni e la posizione della ClientArea
   ClientArea.Top     := 0;
   ClientArea.Left    := Trunc((FormMainPanel.ClientWidth - ClientArea.Width) / 2);
   if ClientArea.Left < 0 then ClientArea.Left := 0; 
//   ClientArea.Height  := FormMainPanel.ClientHeight - (FormMainPanel.ClientHeight - SplitterAllegati.Top) - 5;
   // IMposta la dimensione automatica dello splitter aperto.
   SplitterAllegati.PositionAfterOpen := FormMainPanel.ClientHeight - ClientArea.Height - SplitterAllegati.Height - 10;
   // RIcalcolal'altezza del pannello Allegati in modo che si adatti automaticamente alla nuova dimensione
   //  della form.
   if SplitterAllegati.State = ssOpened then SplitterAllegati.Control.Height := SplitterAllegati.PositionAfterOpen;
   // Forza l'aggiornamento dello schermo
   Self.Update;
end;



procedure TExtFileForm.FormResize(Sender: TObject);
begin
  RicalcolaDimensioni;
end;

procedure TExtFileForm.SplitterAllegatiMoved(Sender: TObject);
begin
  RicalcolaDimensioni;
end;

procedure TExtFileForm.StatoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if RxSpeedModifica.Down and ((Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)) then
    AzzeraStato1Click(AzzeraStato1);
end;

procedure TExtFileForm.DBComboRegistroPropertiesInitPopup(Sender: TObject);
var
   Qry:TIB_Cursor;
begin
   // Crea la query che fornirà l'elenco dei registri disponibili
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT Registro FROM ProgReg');
      Qry.Open;
      // Carica i registri nelle items del componente
      Registro.Properties.Items.Clear;
      while not Qry.Eof do begin
         Registro.Properties.Items.Add(Qry.FieldByName('Registro').Value);
         Qry.Next;
      end;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

procedure TExtFileForm.SBPratica1Click(Sender: TObject);
begin
  DM1.SelezionaCantiereImpianto(QryExtFilePRATICA,
                                QryExtFileDATAPRATICA1,
                                nil,
                                nil,
                                QryExtFileCliente.Value);
end;

procedure TExtFileForm.BitBtnPratica1Click(Sender: TObject);
begin
  DM1.SelezionaCantiereImpianto(QryExtFilePRATICA,
                                QryExtFileDataPratica1,
                                nil,
                                nil,
                                QryExtFileCliente.Value);
end;

procedure TExtFileForm.SbRifSogg1Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG1_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg2Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG2_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg3Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG3_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg4Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG4_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg5Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG5_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg6Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG6_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg7Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG7_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg8Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG8_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg9Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG9_CODICE, nil, nil, '');
end;

procedure TExtFileForm.SbRifSogg10Click(Sender: TObject);
begin
  DM1.SelezionaCliente(QryExtFileRIFSOGG10_CODICE, nil, nil, '');
end;

procedure TExtFileForm.QryExtFileRIFSOGG1_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG1_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG1_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG1_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG2_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG2_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG2_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG2_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG3_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG3_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG3_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG3_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG4_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG4_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG4_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG4_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG5_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG5_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG5_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG5_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG6_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG6_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG6_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG6_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG7_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG7_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG7_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG7_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG8_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG8_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG8_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG8_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG9_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG9_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG9_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG9_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileRIFSOGG10_CODICEChange(Sender: TField);
var
   QryCli: TIB_Cursor;
begin
   // Carica i dati del cliente
   QryCli := TIB_Cursor.Create(Self);
   try
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT RagioneSociale, ClienteFornitore FROM CLIENTI WHERE CODICE = ' + QryExtFileRIFSOGG10_CODICE.AsString);
      QryCli.Open;
      if not QryCli.Eof then begin
        QryExtFileRIFSOGG10_TIPO.Value             := QryCli.FieldByName('CLIENTEFORNITORE').AsString;
        QryExtFileRIFSOGG10_RAGIONESOCIALE.Value   := QryCli.FieldByName('RAGIONESOCIALE').AsString;
      end;
   finally
      QryCli.Close;
      QryCli.Free;
   end;
end;

procedure TExtFileForm.QryExtFileCONSEGNAGGChange(Sender: TField);
begin
  // Ricalcola i campi ValiditaData e ConsegnaData se sono stati inseriti
  //  i campi ValiditaGG e ConsegnaGG rispettivamente e la data del documento
  QryExtFileConsegnaData.OnChange := nil;
  if (not QryExtFileData.IsNull) and (not QryExtFileConsegnaGG.IsNull) and (QryExtFileConsegnaGG.AsInteger > 0) then begin
    QryExtFileConsegnaData.Value := QryExtFileData.Value + QryExtFileConsegnaGG.AsInteger;
  end else begin
    QryExtFileConsegnaData.Clear;
  end;
  QryExtFileConsegnaData.OnChange := QryExtFileConsegnaDataChange;
end;

procedure TExtFileForm.QryExtFileCONSEGNADATAChange(Sender: TField);
begin
  // Ricalcola i campi ValiditaGG e ConsegnaGG se sono stati inseriti
  //  i campi ValiditaData e ConsegnaData rispettivamente e la data del documento
  QryExtFileConsegnaGG.OnChange := nil;
  if (not QryExtFileData.IsNull) and (not QryExtFileConsegnaData.IsNull) then begin
    QryExtFileConsegnaGG.Value := Trunc(QryExtFileConsegnaData.Value - QryExtFileData.Value);
  end else begin
    QryExtFileConsegnaGG.Clear;
  end;
  QryExtFileConsegnaGG.OnChange := QryExtFileConsegnaGGChange;
end;

procedure TExtFileForm.QryExtFileVALIDITAGGChange(Sender: TField);
begin
  // Ricalcola i campi ValiditaData e ConsegnaData se sono stati inseriti
  //  i campi ValiditaGG e ConsegnaGG rispettivamente e la data del documento
  QryExtFileValiditaData.OnChange := nil;
  if (not QryExtFileData.IsNull) and (not QryExtFileValiditaGG.IsNull) and (QryExtFileValiditaGG.AsInteger > 0) then begin
    QryExtFileValiditaData.Value := QryExtFileData.Value + QryExtFileValiditaGG.AsInteger;
  end else begin
    QryExtFileValiditaData.Clear;
  end;
  QryExtFileValiditaData.OnChange := QryExtFileValiditaDataChange;
end;

procedure TExtFileForm.QryExtFileVALIDITADATAChange(Sender: TField);
begin
  // Ricalcola i campi ValiditaGG e ConsegnaGG se sono stati inseriti
  //  i campi ValiditaData e ConsegnaData rispettivamente e la data del documento
  QryExtFileValiditaGG.OnChange := nil;
  if (not QryExtFileData.IsNull) and (not QryExtFileValiditaData.IsNull) then begin
    QryExtFileValiditaGG.Value := Trunc(QryExtFileValiditaData.Value - QryExtFileData.Value);
  end else begin
    QryExtFileValiditaGG.Clear;
  end;
  QryExtFileValiditaGG.OnChange := QryExtFileValiditaGGChange;
end;

procedure TExtFileForm.QryExtFileDATAChange(Sender: TField);
begin
  // Ricalcola i campi ValiditaData e ConsegnaData se sono stati inseriti
  //  i campi ValiditaGG e ConsegnaGG rispettivamente.
  if not QryExtFileDATA.IsNull then begin
    // =========================================================================
    // VALIDITADATA
    // -------------------------------------------------------------------------
    // Disabilita il gestore dell'evento OnChange
    QryExtFileValiditaData.OnChange := nil;
    try
      // Se la ValiditaGG non è nullo provvede ad calcolare automaticamente
      //  la Validità del documneto
      if (not QryExtFileValiditaGG.IsNull) and (QryExtFileValiditaGG.AsInteger > 0) then begin
        QryExtFileValiditaData.Value := QryExtFileData.Value + QryExtFileValiditaGG.AsInteger;
      end else begin
        QryExtFileValiditaData.Clear;
      end;
    finally
      // Ripristina il gestore dell.evento
      QryExtFileValiditaData.OnChange := QryExtFileVALIDITADATAChange;
    end;
    // =========================================================================

    // =========================================================================
    // CONSEGNADATA
    // -------------------------------------------------------------------------
    // Disabilita il gestore dell'evento OnChange
    QryExtFileConsegnaData.OnChange := nil;
    try
      // Se la cONSEGNAGG non è nullo provvede ad calcolare automaticamente
      //  la Validità del documneto
      if (not QryExtFileConsegnaGG.IsNull) and (QryExtFileConsegnaGG.AsInteger > 0) then begin
        QryExtFileConsegnaData.Value := QryExtFileData.Value + QryExtFileConsegnaGG.AsInteger;
      end else begin
        QryExtFileConsegnaData.Clear;
      end;
    finally
      // Ripristina il gestore dell.evento
      QryExtFileConsegnaData.OnChange := QryExtFileCONSEGNADATAChange;
    end;
    // =========================================================================

  end;
end;

procedure TExtFileForm.EditDescrizionePratica1Change(Sender: TObject);
begin
  if QryExtFilePRATICA.AsInteger > 0 then begin
    DbeDescrizioneCantiere.Text := QryExtFilePRATICA.AsString + ' - ' + QryExtFileDATAPRATICA1.AsString + ' - ' + EditDescrizionePratica1.Text;
  end else begin
    DbeDescrizioneCantiere.Text := '- - -';
  end;
end;

function TExtFileForm.GetCollegamentoExtPrg: Boolean;
begin
  Result := (not QryExtFilePRGASSOCIATO.IsNull) and (QryExtFilePRGASSOCIATO.AsInteger > 0);
end;

procedure TExtFileForm.FormDestroy(Sender: TObject);
begin
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

procedure TExtFileForm.dbeAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryExtFile.State = dsEdit) or (QryExtFile.State = dsInsert) then DM1.AgenteChanged(1, dbeAgente2);
end;

procedure TExtFileForm.dbeAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryExtFile.State = dsEdit) or (QryExtFile.State = dsInsert) then DM1.AgenteChanged(2, dbeAgente3);
end;

procedure TExtFileForm.dbeAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  if (QryExtFile.State = dsEdit) or (QryExtFile.State = dsInsert) then DM1.AgenteChanged(3, dbeAgente4);
end;

procedure TExtFileForm.dbeAgentePropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente.Properties.Items, 1, '');
end;

procedure TExtFileForm.DbeDescrizioneCantiereKeyPress(Sender: TObject; var Key: Char);
begin
  if RxSpeedModifica.Down
  and (  (Ord(Key) = VK_BACK) or (Ord(Key) = VK_DELETE)  )
  then
    DM2.ClearCantiereDoc(QryExtFilePRATICA, QryExtFileDATAPRATICA1, DbeDescrizioneCantiere);
end;

procedure TExtFileForm.Deselezionacantiereimpianto1Click(Sender: TObject);
begin
  if RxSpeedModifica.Down then
    DM2.ClearCantiereDoc(DM1.TableTestiPratica, DM1.TableTestiDataPratica1, DbeDescrizioneCantiere)
  else
    DM1.Messaggi('Levante', 'Il documento deve essere in modalità di modifica', '', [mbOk], 0, nil);

end;

procedure TExtFileForm.dbeAgente2PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente2.Properties.Items, 2, dbeAgente.Text);
end;

procedure TExtFileForm.dbeAgente3PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente3.Properties.Items, 3, dbeAgente2.Text);
end;

procedure TExtFileForm.dbeAgente4PropertiesInitPopup(Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(dbeAgente4.Properties.Items, 4, dbeAgente3.Text);
end;

end.
