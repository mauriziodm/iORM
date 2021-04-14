unit FormCheckIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bmpPanel, StdCtrls, ExtCtrls, DBCtrls, Mask, ComCtrls,
  Buttons, MAURI_SB, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TChekInForm = class(TForm)
    ClientArea: TPanel;
    PanelCheckIn: TPanel;
    LabelCheckIn: TLabel;
    RichEdit1: TRichEdit;
    PanelCausale: TPanel;
    LabelCausale: TLabel;
    RichEdit2: TRichEdit;
    PanelPagamento: TPanel;
    LabelPagamento: TLabel;
    RichEdit3: TRichEdit;
    PanelRiepilogo: TPanel;
    LabelRiepilogo: TLabel;
    ClientTopPanel: TbmpPanel;
    RichEdit4: TRichEdit;
    LabelDocumento: TLabel;
    Panel12: TPanel;
    IniziaFatturazione: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    EditPagamento: TEdit;
    BitBtnPagamento: TSpeedButtonRollOver;
    Label1: TLabel;
    LabelRagSocCli: TLabel;
    LabelIndirizzoCli: TLabel;
    LabelCAPCli: TLabel;
    LabelCittaCli: TLabel;
    LabelProvinciaCli: TLabel;
    RBScadenzeSI: TRadioButton;
    RBScadenzeNO: TRadioButton;
    PanelPratica: TPanel;
    LabelPratica: TLabel;
    RichEdit5: TRichEdit;
    Label2: TLabel;
    Label22: TLabel;
    Label23: TLabel;
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
    EditDescrizionePratica1: TEdit;
    EditDescrizionePratica2: TEdit;
    EditDescrizionePratica3: TEdit;
    EditCodicePratica1: TEdit;
    EditCodicePratica2: TEdit;
    EditCodicePratica3: TEdit;
    EditDataPratica1: TEdit;
    EditDataPratica2: TEdit;
    EditDataPratica3: TEdit;
    LabelNumCivicoCli: TLabel;
    DbeAzioneMagazzino: TcxComboBox;
    DBEditSegnoOperazione: TDBEdit;
    DbeAzioneCantiere: TcxComboBox;
    DBEdit27: TDBEdit;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnPagamentoClick(Sender: TObject);
    procedure IniziaFatturazioneClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure BitBtnPratica2Click(Sender: TObject);
    procedure BitBtnPratica3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChekInForm: TChekInForm;

implementation

uses main, DataModule1, FormPagamenti, 
  SchedaPreventiviOrdini;

{$R *.dfm}

procedure TChekInForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   // Il puntatore alla form := nil
   ChekInForm := nil;
end;

procedure TChekInForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(ChekInForm, COLOR_MODIFICA);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Check-In documento)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelCheckIn.Color   := COLOR_SUBPANEL_BG;
   PanelCausale.Color   := COLOR_SUBPANEL_BG;
   PanelPagamento.Color := COLOR_SUBPANEL_BG;
   PanelPratica.Color   := COLOR_SUBPANEL_BG;
   PanelRiepilogo.Color := COLOR_SUBPANEL_BG;

   LabelCheckIn.Color   := COLOR_SUBPANEL_STEP_BG;
   LabelCausale.Color   := COLOR_SUBPANEL_STEP_BG;
   LabelPagamento.Color := COLOR_SUBPANEL_STEP_BG;
   LabelPratica.Color   := COLOR_SUBPANEL_STEP_BG;
   LabelRiepilogo.Color := COLOR_SUBPANEL_STEP_BG;

   LabelCheckIn.Font.Color    := COLOR_SUBPANEL_STEP_FONT;
   LabelCausale.Font.Color    := COLOR_SUBPANEL_STEP_FONT;
   LabelPagamento.Font.Color  := COLOR_SUBPANEL_STEP_FONT;
   LabelPratica.Font.Color    := COLOR_SUBPANEL_STEP_FONT;
   LabelRiepilogo.Font.Color  := COLOR_SUBPANEL_STEP_FONT;

   // Se il documento non ha il pannello delle modalità di pagamento
   //  lo fà sparire anche nel CheckIn
   if (not PreventiviOrdiniForm.MainPanelPagamento.Visible) or (not PreventiviordiniForm.PanelPagamento.Visible) then begin
      PanelPagamento.Visible := False;
      PanelRiepilogo.Top := PanelPratica.Top;
      LabelRiepilogo.Caption := '4';
      PanelPratica.Top := PanelPagamento.Top;
      LabelPratica.Caption := '3';
   end;
end;

procedure TChekInForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

   end;
end;

procedure TChekInForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   PreventiviOrdiniForm.ModalResultConferma := mrCancel;
   Close;
end;

procedure TChekInForm.FormShow(Sender: TObject);
begin
   // Carica i dati del documento
   LabelDocumento.Caption := PreventiviOrdiniForm.QryDocumentoTIPODOCUMENTO.AsString
                             + '  n° ' + PreventiviOrdiniForm.QryDocumentoNUMORDPREV.AsString + PreventiviOrdiniForm.QryDocumentoREGISTRO.AsString
                             + '  del ' + PreventiviOrdiniForm.QryDocumentoDATADOCUMENTO.AsString;
   // Carica i dati del mittente
   LabelRagSocCli.Caption     := PreventiviOrdiniForm.QryDocumentoRAGSOCCLI.AsString;
   LabelIndirizzoCli.Caption  := PreventiviOrdiniForm.QryDocumentoINDIRIZZOCLI.AsString;
   LabelNumCivicoCli.Caption  := PreventiviOrdiniForm.QryDocumentoNUMCIVICOCLI.AsString;
   LabelCAPCli.Caption        := PreventiviOrdiniForm.QryDocumentoCAPCLI.AsString;
   LabelCittaCli.Caption      := PreventiviOrdiniForm.QryDocumentoCITTACLI.AsString;
   LabelProvinciaCli.Caption  := PreventiviOrdiniForm.QryDocumentoPROVINCIACLI.AsString;
   // Carica i dati della Causale
   DbeAzioneMagazzino.Text := PreventiviOrdiniForm.DbeAzioneMagazzino.Text;
   DbeAzioneCantiere.Text := PreventiviOrdiniForm.DbeAzioneCantiere.Text;
   // Carica i dati della modalità di pagamento
   EditPagamento.Text         := PreventiviOrdiniForm.DescrizionePagamento.Text;
   // Carica i dati delle pratiche nel check-in
   EditCodicePratica1.Text      := PreventiviOrdiniForm.QryDocumentoPRATICA.AsString;
   EditCodicePratica2.Text      := PreventiviOrdiniForm.QryDocumentoPRATICA2.AsString;
   EditCodicePratica3.Text      := PreventiviOrdiniForm.QryDocumentoPRATICA3.AsString;
   EditDataPratica1.Text        := PreventiviOrdiniForm.QryDocumentoDATAPRATICA1.AsString;
   EditDataPratica2.Text        := PreventiviOrdiniForm.QryDocumentoDATAPRATICA2.AsString;
   EditDataPratica3.Text        := PreventiviOrdiniForm.QryDocumentoDATAPRATICA3.AsString;
   EditDescrizionePratica1.Text := PreventiviOrdiniForm.EditDescrizionePratica1.Text;
   EditDescrizionePratica2.Text := PreventiviOrdiniForm.EditDescrizionePratica2.Text;
   EditDescrizionePratica3.Text := PreventiviOrdiniForm.EditDescrizionePratica3.Text;
   // Riutilizza i gestori di evento dei combo box del documento relativi
   //  alla selezione delle azioni che il documento deve compiere
   DbeAzioneMagazzino.Properties.OnChange := PreventiviOrdiniForm.DbeAzioneMagazzinoPropertiesChange;
   DbeAzioneCantiere.Properties.OnChange := PreventiviOrdiniForm.DbeAzioneCantierePropertiesChange;
end;

procedure TChekInForm.BitBtnPagamentoClick(Sender: TObject);
begin
      DM1.Attendere;
      try
         // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
         Application.CreateForm(TPagamentiForm, PagamentiForm);
         PagamentiForm.Parent := MainForm;
         PagamentiForm.Tag := 997;   // Abilita la selezione
         PagamentiForm.Show;
      finally
         DM1.ChiudiAttendere;
      end;
end;

procedure TChekInForm.IniziaFatturazioneClick(Sender: TObject);
begin
   PreventiviOrdiniForm.QryDocumento.Edit;
   // Se indicate, imposta le pratiche
   if (Trim(EditCodicePratica1.Text) <> '') and (Trim(EditDATAPratica1.Text) <> '') then begin
      PreventiviOrdiniForm.QryDocumentoPRATICA.Value := StrToInt(EditCodicePratica1.Text);
      PreventiviOrdiniForm.QryDocumentoDATAPRATICA1.Value := StrToDate(EditDataPratica1.Text);
   end;
   // Se indicate, imposta le pratiche
   if (Trim(EditCodicePratica2.Text) <> '') and (Trim(EditDATAPratica2.Text) <> '') then begin
      PreventiviOrdiniForm.QryDocumentoPRATICA2.Value := StrToInt(EditCodicePratica2.Text);
      PreventiviOrdiniForm.QryDocumentoDATAPRATICA2.Value := StrToDate(EditDataPratica2.Text);
   end;
   // Se indicate, imposta le pratiche
   if (Trim(EditCodicePratica3.Text) <> '') and (Trim(EditDATAPratica3.Text) <> '') then begin
      PreventiviOrdiniForm.QryDocumentoPRATICA3.Value := StrToInt(EditCodicePratica3.Text);
      PreventiviOrdiniForm.QryDocumentoDATAPRATICA3.Value := StrToDate(EditDataPratica3.Text);
   end;
   PreventiviOrdiniForm.QryDocumento.Post;
   // IMposta i ModalResult da ritornare
   PreventiviOrdiniForm.ModalResultConferma := mrYes;
   if RBScadenzeSI.Checked
     then PreventiviOrdiniForm.ModalResultCreaScad := mrYes
     else PreventiviOrdiniForm.ModalResultCreaScad := mrNo;
   // Chiude
   Close;
end;

procedure TChekInForm.SpeedButton1Click(Sender: TObject);
begin
   // IMposta i ModalResult da ritornare
   PreventiviOrdiniForm.ModalResultConferma := mrNo;
   // Chiude
   Close;
end;

procedure TChekInForm.BitBtnPratica1Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(EditCodicePratica1, EditDataPratica1, EditDescrizionePratica1, PreventiviOrdiniForm.QryDocumentoCodiceCliente.Value);
end;

procedure TChekInForm.BitBtnPratica2Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(EditCodicePratica2, EditDataPratica2, EditDescrizionePratica2, PreventiviOrdiniForm.QryDocumentoCodiceCliente.Value);
end;

procedure TChekInForm.BitBtnPratica3Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(EditCodicePratica3, EditDataPratica3, EditDescrizionePratica3, PreventiviOrdiniForm.QryDocumentoCodiceCliente.Value);
end;

end.
