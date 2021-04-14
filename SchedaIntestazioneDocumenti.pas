unit SchedaIntestazioneDocumenti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Clipbrd, StdCtrls, IniFiles, DBCtrls,
  bmpPanel, ComCtrls, Buttons;

type
  TIntestazioneDocumentiForm = class(TForm)
    ClientArea: TPanel;
    ClientTopPanel: TbmpPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    PanelTipoDocumento: TPanel;
    CBTipoDocumento: TComboBox;
    Panel5: TPanel;
    CBLayout: TComboBox;
    Label6: TLabel;
    Label5: TLabel;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    PanelTesta: TPanel;
    ImageIntestazione: TImage;
    EditLarghezzaTesta: TEdit;
    EditAltezzaTesta: TEdit;
    RBStampaIntestaz: TRadioButton;
    RBNoStampaIntestaz: TRadioButton;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    Label4: TLabel;
    PanelPiede: TPanel;
    ImagePiede: TImage;
    EditLarghezzaPiede: TEdit;
    EditAltezzaPiede: TEdit;
    RBStampaPiede: TRadioButton;
    RBNoStampaPiede: TRadioButton;
    RichEdit2: TRichEdit;
    RxSpeedButton5: TSpeedButton;
    RxSpeedButton4: TSpeedButton;
    RxSpeedButton8: TSpeedButton;
    RxSpeedButton1: TSpeedButton;
    RxSpeedButton3: TSpeedButton;
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
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    SpeedButton1: TSpeedButton;
    procedure RxSpeedButton4Click(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton8Click(Sender: TObject);
    procedure EditLarghezzaTestaChange(Sender: TObject);
    procedure EditAltezzaTestaChange(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure CBTipoDocumentoChange(Sender: TObject);
    procedure RxSpeedButton3Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure EditLarghezzaPiedeChange(Sender: TObject);
    procedure EditAltezzaPiedeChange(Sender: TObject);
    procedure CBTipoDocumentoEnter(Sender: TObject);
    procedure CBTipoDocumentoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SalvaIntestazione(const LO: TMemIniFile; const ATipoDoc: String; const AIndiceLogo, AIntestazWidth, AIntestazHeight, APiedeWidth, APiedeHeight: Integer; const AAbilitaIntestaz,
      AAbilitaPiede, ASalvaLoghi: Boolean);
  public
    { Public declarations }
    FileBmp, Sezione : String;
  end;

var
  IntestazioneDocumentiForm: TIntestazioneDocumentiForm;

implementation

uses DataModule1, main, FormHelp;

{$R *.DFM}

procedure TIntestazioneDocumentiForm.RxSpeedButton4Click(Sender: TObject);
begin
     if Clipboard.HasFormat(CF_BITMAP) then	{ check to see if there is a picture }
     begin
          ImageIntestazione.Picture.BitMap.Assign(Clipboard);	{get the bitmap off the clipboard using Assign}
     end;
end;

procedure TIntestazioneDocumentiForm.RxSpeedButtonUscitaClick(
  Sender: TObject);
begin
     close;
end;

procedure TIntestazioneDocumentiForm.SalvaIntestazione(const LO: TMemIniFile;
  const ATipoDoc: String; const AIndiceLogo, AIntestazWidth, AIntestazHeight,
  APiedeWidth, APiedeHeight: Integer; const AAbilitaIntestaz, AAbilitaPiede,
  ASalvaLoghi: Boolean);
var
   NomeFileIntestaz, NomeFilePiede:String;
begin
  // Salva il layout scelto per il documento
  LO.WriteInteger(ATipoDoc, 'LayoutDocumento', AIndiceLogo);
  // COmpone il nome del file da salvare
  NomeFileIntestaz := 'intestaz' + CBLayout.Text + '.bmp';
  NomeFilePiede    := 'piede' + CBLayout.Text + '.bmp';
  // Salva la bitmap dell'intestazione con il nome appropriato in base al layout scelto per il documento
  if ASalvaLoghi then
  begin
    ImageIntestazione.Picture.SaveToFile(DM1.Repository_Loghi.AziendaDir + NomeFileIntestaz);
    ImagePiede.Picture.SaveToFile(DM1.Repository_Loghi.AziendaDir + NomeFilePiede);
  end;
  // Salva le dimensioni del logo
  LO.WriteInteger(ATipoDoc, 'LargIntestazione', AIntestazWidth);
  LO.WriteInteger(ATipoDoc, 'AltIntestazione', AIntestazHeight);
  LO.WriteInteger(ATipoDoc, 'LargPiede', APiedeWidth);
  LO.WriteInteger(ATipoDoc, 'AltPiede', APiedeHeight);
  // Salva l'abilitazione o meno alla stampa dell'intestazione del documento
  LO.WriteBool(ATipoDoc, 'AbilitaStampaIntestazione', AAbilitaIntestaz);
  LO.WriteBool(ATipoDoc, 'AbilitaStampaPiede', AAbilitaPiede);
end;

procedure TIntestazioneDocumentiForm.SpeedButton1Click(Sender: TObject);
var
  i: Integer;
  LO : TMemIniFile;
begin
  // Chiede prima conferma
  MessageBeep(0);
  if (MessageDlg('Sei sicuro/a ?', mtWarning, [mbOk, mbNo], 0) <> mrOk)
  or (MessageDlg('L''operazione avrà effetto su tutti i tipi di documento.'#13#13'Proseguire?', mtWarning, [mbOk, mbNo], 0) <> mrOk) then
    Exit;

  LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
  try
    DM1.ShowWait('Levante', 'Salvo intestazione documenti');
    for i := 0 to CBTipoDocumento.Items.Count-1 do
    begin
      SalvaIntestazione(
        LO,
        CBTipoDocumento.Items[i],
        StrToInt(CBLayout.Text),
        StrToInt(EditLarghezzaTesta.Text),
        StrToInt(EditAltezzaTesta.Text),
        StrToInt(EditLarghezzaPiede.Text),
        StrToInt(EditAltezzaPiede.Text),
        RBStampaIntestaz.Checked,
        RBStampaPiede.Checked,
        (i=0));
    end;
    LO.UpdateFile;
    DM1.Repository_Loghi.UploadLocalFileToRepository;
  finally
    DM1.CloseWait;
    LO.Free;
  end;
  ShowMessage('Operazione completata.');
end;

procedure TIntestazioneDocumentiForm.RxSpeedButton5Click(Sender: TObject);
var
  LO : TMemIniFile;
begin
  // Chiede prima conferma
  MessageBeep(0);
  if MessageDlg('Sei sicuro/a ?', mtWarning, [mbOk, mbNo], 0) = mrOk then
  begin
    LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
    try
      DM1.ShowWait('Levante', 'Salvo intestazione documento');
      SalvaIntestazione(
        LO,
        CBTipoDocumento.Text,
        StrToInt(CBLayout.Text),
        StrToInt(EditLarghezzaTesta.Text),
        StrToInt(EditAltezzaTesta.Text),
        StrToInt(EditLarghezzaPiede.Text),
        StrToInt(EditAltezzaPiede.Text),
        RBStampaIntestaz.Checked,
        RBStampaPiede.Checked,
        True);
      LO.UpdateFile;
      DM1.Repository_Loghi.UploadLocalFileToRepository;
    finally
      DM1.CloseWait;
      LO.Free;
    end;
    ShowMessage('Operazione completata.');
  end;
end;

procedure TIntestazioneDocumentiForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(IntestazioneDocumentiForm, COLOR_MODIFICA);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Intestazione documenti)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;
   PanelGruppo3.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo3.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo3.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TIntestazioneDocumentiForm.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure TIntestazioneDocumentiForm.FormClose(Sender: TObject;
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
   IntestazioneDocumentiForm := nil;
end;

procedure TIntestazioneDocumentiForm.FormShow(Sender: TObject);
begin
   DM1.FocusRefresh;
   // Carica di default le impostazioni del preventivo
   CBTipoDocumento.Text := 'Fattura';
   CBTipoDocumentoChange(Self);
   // Focus
   CBTipoDocumento.SetFocus;
end;

procedure TIntestazioneDocumentiForm.RxSpeedButton8Click(Sender: TObject);
begin
  DM1.OpenDialog1.InitialDir := 'c:\';
  DM1.OpenDialog1.Filter := 'Windows BitMap (*.BMP)|*.BMP';
  if DM1.OpenDialog1.Execute then
  begin
     ImageIntestazione.Picture.BitMap.LoadFromFile(DM1.OpenDialog1.FileName);
  end;
end;

procedure TIntestazioneDocumentiForm.EditLarghezzaTestaChange(
  Sender: TObject);
begin
   try
      PanelTesta.Width := StrToInt(EditLarghezzaTesta.Text) + 2;
      EditLarghezzaTesta.Text := IntToStr(ImageIntestazione.Width);
   except
   end;
end;

procedure TIntestazioneDocumentiForm.EditAltezzaTestaChange(
  Sender: TObject);
begin
   try
      PanelTesta.Height := StrToInt(EditAltezzaTesta.Text) + 2;
      EditAltezzaTesta.Text := IntToStr(ImageIntestazione.Height);
   except
   end;
end;

procedure TIntestazioneDocumentiForm.RxSpeedButtonHelpClick(
  Sender: TObject);
begin
   HelpForm.Aiuto('IMPOSTAZIONI');
end;

procedure TIntestazioneDocumentiForm.CBTipoDocumentoChange(
  Sender: TObject);
var
   LO:TMemIniFile;
begin
   // In base al tipo di documento selezionato carica i parametri relativi e li visualizza.
   LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
   // Carica nel rispettivo combo box il layout del documento
   CBLayout.Text := IntToStr(LO.ReadInteger(CBTipoDocumento.Text, 'LayoutDocumento', 1));
   // In base al tipo di layouts scelto carica la bitmap appropriata, ovviemente se il file esiste altrimenti niente
   if FileExists(DM1.Repository_Loghi.AziendaDir + 'intestaz' + CBLayout.Text + '.bmp') then begin
      ImageIntestazione.Picture.LoadFromFile(DM1.Repository_Loghi.AziendaDir + 'intestaz' + CBLayout.Text + '.bmp');
   end;
   if FileExists(DM1.Repository_Loghi.AziendaDir + 'piede' + CBLayout.Text + '.bmp') then begin
      ImagePiede.Picture.LoadFromFile(DM1.Repository_Loghi.AziendaDir + 'piede' + CBLayout.Text + '.bmp');
   end;
   // Carica le dimensione del logo
   EditLarghezzaTesta.Text := IntToStr(LO.ReadInteger(CBTipoDocumento.Text, 'LargIntestazione', 383));
   EditAltezzaTesta.Text   := IntToStr(LO.ReadInteger(CBTipoDocumento.Text, 'AltIntestazione', 168));
   EditLarghezzaTestaChange(Self);
   EditAltezzaTestaChange(Self);
   EditLarghezzaPiede.Text := IntToStr(LO.ReadInteger(CBTipoDocumento.Text, 'LargPiede', 30));
   EditAltezzaPiede.Text   := IntToStr(LO.ReadInteger(CBTipoDocumento.Text, 'AltPiede', 30));
   EditLarghezzaPiedeChange(Self);
   EditAltezzaPiedeChange(Self);
   // Carica l'abilitazione o meno alla stampa del logo
   if LO.ReadBool(CBTipoDocumento.Text, 'AbilitaStampaIntestazione', True) then RBStampaIntestaz.Checked := True else RBNoStampaIntestaz.Checked := True;
   if LO.ReadBool(CBTipoDocumento.Text, 'AbilitaStampaPiede', True) then RBStampaPiede.Checked := True else RBNoStampaPiede.Checked := True;
   // Distrugge l'oggetto IniFile
   LO.Free;
end;

procedure TIntestazioneDocumentiForm.RxSpeedButton3Click(Sender: TObject);
begin
  DM1.OpenDialog1.InitialDir := 'c:\';
  DM1.OpenDialog1.Filter := 'Windows BitMap (*.BMP)|*.BMP';
  if DM1.OpenDialog1.Execute then
  begin
     ImagePiede.Picture.BitMap.LoadFromFile(DM1.OpenDialog1.FileName);
  end;
end;

procedure TIntestazioneDocumentiForm.RxSpeedButton1Click(Sender: TObject);
begin
     if Clipboard.HasFormat(CF_BITMAP) then	{ check to see if there is a picture }
     begin
          ImagePiede.Picture.BitMap.Assign(Clipboard);	{get the bitmap off the clipboard using Assign}
     end;
end;

procedure TIntestazioneDocumentiForm.EditLarghezzaPiedeChange(
  Sender: TObject);
begin
   try
      PanelPiede.Width := StrToInt(EditLarghezzaPiede.Text) + 2;
      EditLarghezzaPiede.Text := IntToStr(ImagePiede.Width);
   except
   end;
end;

procedure TIntestazioneDocumentiForm.EditAltezzaPiedeChange(
  Sender: TObject);
begin
   try
      PanelPiede.Height := StrToInt(EditAltezzaPiede.Text) + 2;
      EditAltezzaPiede.Text := IntToStr(ImagePiede.Height);
   except
   end;
end;

procedure TIntestazioneDocumentiForm.CBTipoDocumentoEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlEnter(Sender);
end;

procedure TIntestazioneDocumentiForm.CBTipoDocumentoExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlExit(Sender);
end;

end.
