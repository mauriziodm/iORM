unit FormArchivioBanche;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxButtonEdit, DB, cxDBData, cxGridDBTableView,
  cxGridLevel, cxGridCardView, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, IBODataset,
  bmpPanel, StdCtrls, CheckLst, ExtCtrls, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, cxGridCustomLayoutView;

type
  TArchivioBancheForm = class(TForm)
    ClientArea: TPanel;
    PanelFiltri: TPanel;
    StaticText16: TStaticText;
    NomeBanca: TEdit;
    StaticText1: TStaticText;
    ABI: TEdit;
    QryBanche: TIBOQuery;
    StaticText2: TStaticText;
    CAB: TEdit;
    BancaAppoggio: TCheckListBox;
    StaticText3: TStaticText;
    DataSourceBanche: TDataSource;
    ClientTopPanel: TbmpPanel;
    Shape6: TShape;
    Label8: TLabel;
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
    QryBancheBANCA: TStringField;
    QryBancheABI: TStringField;
    QryBancheCAB: TStringField;
    tvListBANCA: TcxGridDBColumn;
    tvListABI: TcxGridDBColumn;
    tvListCAB: TcxGridDBColumn;
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
    QryBancheBANCABIC: TStringField;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure EseguiQueryBanche;
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ABIKeyPress(Sender: TObject; var Key: Char);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArchivioBancheForm: TArchivioBancheForm;

implementation

uses FormHelp, DataModule1, main, FormBanche, FormAnagCli,
  SchedaPreventiviOrdini, FormScadenziario;

{$R *.DFM}

procedure TArchivioBancheForm.EseguiQueryBanche;
begin
   //---------------------------------------------
   // In base alle condizioni di filtraggio inserite dall'utente costruisce
   //  il testo dell'interrogazione SQL.
   //---------------------------------------------
   // Chiude la query, la azzera e inserisce le prime righe
   QryBanche.Close;
   QryBanche.SQL.Clear;
   QryBanche.SQL.Add('SELECT BANCA, ABI, CAB, BANCABIC FROM BANCHE');
   // In base al contenuto dei campi di filtraggio in fondo alla form costruisce
   //  le condizioni della query.
   if NomeBanca.Text <> ''      then begin
      DM1.AddSQL(QryBanche, 'AND', '(');
      DM1.AggiungiRicercaCampo(QryBanche.SQL, 'BANCA', NomeBanca.Text, False);
      QryBanche.SQL.Add('OR');
      DM1.AggiungiRicercaCampo(QryBanche.SQL, 'DESCBREVE', NomeBanca.Text, False);
      QryBanche.SQL.Add(')');
   end;
   if ABI.Text <> ''            then DM1.AddSQL(QryBanche, 'AND', 'ABI LIKE ''' + DM1.AddJollyChar(ABI.Text) + '''');
   if CAB.Text <> ''            then DM1.AddSQL(QryBanche, 'AND', 'CAB LIKE ''' + DM1.AddJollyChar(CAB.Text) + '''');
   if BancaAppoggio.Checked[0]  then DM1.AddSQL(QryBanche, 'AND', 'MIABANCA = ''T''');
   // Ordinamento risultato
   QryBanche.SQL.Add('ORDER BY BANCA');
   // Attiva la Query
   QryBanche.Open;
end;


procedure TArchivioBancheForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     close;
end;

procedure TArchivioBancheForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('BANCHE');
end;

procedure TArchivioBancheForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   try
     EseguiQueryBanche;
   finally
     DM1.ChiudiAttendere;
   end;
end;

procedure TArchivioBancheForm.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
   DM1.Attendere;
   try
     NomeBanca.Text               := '';
     ABI.Text                     := '';
     CAB.Text                     := '';
     BancaAppoggio.Checked[0]     := False;
   finally
     DM1.ChiudiAttendere;
   end;
end;

procedure TArchivioBancheForm.FormClose(Sender: TObject;
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
   ArchivioBancheForm := nil;
end;

procedure TArchivioBancheForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Schedario banche)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TArchivioBancheForm.FormShow(Sender: TObject);
begin
   DM1.FocusRefresh;
   ABI.SetFocus;
end;

procedure TArchivioBancheForm.RxSpeedButtonEliminaClick(Sender: TObject);
var
   Messaggio : String;
   NumDocSel, Contatore : Integer;
begin
      NumDocSel := tvList.Controller.SelectedRecordCount;
      // Solo se vi è almeno un documento selezionato
      if NumDocSel > 0 then begin
         Messaggio := 'ATTENZIONE!!! - Vuoi eliminare la banca selezionata?';
         // Chiede prima conferma
         MessageBeep(0);
         if MessageDlg(Messaggio, mtWarning, [mbOk, mbNo], 0) = mrOk then
         begin
            MessageBeep(0);
            if MessageDlg('Sei sicuro/a ?', mtWarning, [mbOk, mbNo], 0) = mrOk then
            begin
               DM1.Attendere;
               try
                  // Se il codice è nullo chiama la funzione che elimina
                  //  passando come codice cliente il valore 'NULL' che indica appunto
                  //  che in realtà il codice è nullo.
                  DM1.EliminabANCA(QryBanche.FieldByName('ABI').Value, QryBanche.FieldByName('CAB').Value);
               finally
                  RxSpeedButtonTrovaClick(Self);
                  DM1.ChiudiAttendere;
               end;
            end;
         end;
      end;
end;

procedure TArchivioBancheForm.RxSpeedButtonVisualizzaClick(
  Sender: TObject);
begin
     DM1.Attendere;
     try
       Application.CreateForm(TBancheForm, BancheForm);
       BancheForm.Parent := MainForm;
       BancheForm.Abi := QryBanche.FieldByName('ABI').AsString;
       BancheForm.Cab := QryBanche.FieldByName('CAB').AsString;
       BancheForm.Tag := 1;
       BancheForm.Show;
     finally
       DM1.ChiudiAttendere;
     end;
end;

procedure TArchivioBancheForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
     DM1.Attendere;
     try
       Application.CreateForm(TBancheForm, BancheForm);
       BancheForm.Parent := MainForm;
       BancheForm.Tag := 2;
       BancheForm.Show;
     finally
       DM1.ChiudiAttendere;
     end;
end;

procedure TArchivioBancheForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case key of

         // ESC
         27 : begin
            if RxSpeedButtonUscita.Enabled then begin
               RxSpeedButtonUscitaClick(Self);
            end;
         end;

         // F3 = Nuovo
         114: begin
            if RxSpeedButtonNuovo.Enabled then begin
               RxSpeedButtonNuovoClick(Self);
            end;
         end;

         // F4 = Elimina
         115: begin
            if RxSpeedButtonElimina.Enabled then begin
               RxSpeedButtonEliminaClick(Self);
            end;
         end;

         // F5 = Trova
         116: begin
            if RxSpeedButtonTrova.Enabled then begin
               RxSpeedButtonTrovaClick(Self);
            end;
         end;

         // F6 = Azzera condizioni ricerca
         117: begin
            if RxSpeedButtonResetQuery.Enabled then begin
               RxSpeedButtonResetQueryClick(Self);
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

procedure TArchivioBancheForm.ABIKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
end;

procedure TArchivioBancheForm.tvListDblClick(Sender: TObject);
begin

   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: ANAGCLI (AnagCliForm) ---> Angrafica soggetti
      999: begin
              AnagCliForm.QrySoggABI.Value      := QryBanche.FieldByName('ABI').AsString;
              AnagCliForm.QrySoggCAB.Value      := QryBanche.FieldByName('CAB').AsString;
              AnagCliForm.Banca.Text            := QryBanche.FieldByName('BANCA').AsString;
              AnagCliForm.ABI.Text              := QryBanche.FieldByName('ABI').AsString;
              AnagCliForm.CAB.Text              := QryBanche.FieldByName('CAB').AsString;
              Close;
              AnagCliForm.Banca.SetFocus;
           end;
      // Form chiamante: DOCUMENTO (PreventiviOrdiniForm) ---> 
      998: begin
              PreventiviOrdiniForm.QryDocumentoABI.Value := QryBanche.FieldByName('ABI').AsString;
              PreventiviOrdiniForm.QryDocumentoCAB.Value := QryBanche.FieldByName('CAB').AsString;
              PreventiviOrdiniForm.Banca.Text            := QryBanche.FieldByName('BANCA').AsString;
              PreventiviOrdiniForm.ABI.Text              := QryBanche.FieldByName('ABI').AsString;
              PreventiviOrdiniForm.CAB.Text              := QryBanche.FieldByName('CAB').AsString;
              PreventiviOrdiniForm.BIC.Text              := QryBanche.FieldByName('BANCABIC').AsString;
              Close;
              PreventiviOrdiniForm.Banca.SetFocus;
           end;
      // Form chiamante: SCADENZE (ScadenzeForm) ---> Angrafica soggetti
      997: begin
              ScadenzeForm.QryScadABI.Value      := QryBanche.FieldByName('ABI').AsString;
              ScadenzeForm.QryScadCAB.Value      := QryBanche.FieldByName('CAB').AsString;
              ScadenzeForm.Banca.Text            := QryBanche.FieldByName('BANCA').AsString;
              ScadenzeForm.ABI.Text              := QryBanche.FieldByName('ABI').AsString;
              ScadenzeForm.CAB.Text              := QryBanche.FieldByName('CAB').AsString;
              ScadenzeForm.BIC.Text              := QryBanche.FieldByName('BANCABIC').AsString;
              Close;
              ScadenzeForm.Banca.SetFocus;
           end;
   // Altrimenti richiama l'anagrafica della banca selezionata
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TArchivioBancheForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(tvList);
end;

end.
