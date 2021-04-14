unit FormComModelli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ModelFormBandListFilterAnag, cxStyles, cxCustomData, cxGraphics,
  cxEdit, DB, cxDBData, IBODataset,
  bmpPanel, Buttons, ExtCtrls, StdCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, cxPC, cxTimeEdit,
  cxTextEdit, cxCheckBox, cxDBEdit, MAURI_SB, ComCtrls, ToolWin,
  cxContainer, cxMemo, cxRichEdit, cxDBRichEdit, Mask, DBCtrls, cxMaskEdit,
  cxDropDownEdit, ImgList, cxSpinEdit, cxFilter, cxData, cxDataStorage,
  cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations, System.ImageList;

type
  TComModelliForm = class(TBandListFilterAnagFormModel)
    QID: TIntegerField;
    QRIF_DATO: TStringField;
    QRIF_TIMEOFFSET_DAYS: TIntegerField;
    QMSGTYPE_LETTER: TStringField;
    QMSGTYPE_EMAIL: TStringField;
    QMSGTYPE_SMS: TStringField;
    QMSG_OGGETTO: TStringField;
    QMSG_TEXT_SMS: TMemoField;
    QMSG_TEXT_EMAIL: TMemoField;
    QMSG_TEXT_LETTERA: TMemoField;
    btvListID: TcxGridDBBandedColumn;
    btvListRIF_DATO: TcxGridDBBandedColumn;
    btvListRIF_TIMEOFFSET_DAYS: TcxGridDBBandedColumn;
    btvListMSGTYPE_LETTER: TcxGridDBBandedColumn;
    btvListMSGTYPE_EMAIL: TcxGridDBBandedColumn;
    btvListMSGTYPE_SMS: TcxGridDBBandedColumn;
    btvListMSG_OGGETTO: TcxGridDBBandedColumn;
    QCOMPUTED_MSG_ENABLED: TBooleanField;
    btvListCOMPUTED_MSG_ENABLED: TcxGridDBBandedColumn;
    LabelComAutoCount: TLabel;
    PanelOggetto: TPanel;
    Label226: TLabel;
    Label228: TLabel;
    dbeOggetto: TDBEdit;
    PageControlCorpo: TcxPageControl;
    TabLettera: TcxTabSheet;
    PanelCorpo: TPanel;
    Label29: TLabel;
    Editor: TcxDBRichEdit;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    ToolButton5: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    TabEmail: TcxTabSheet;
    Panel1: TPanel;
    Label5: TLabel;
    dbeEmailCorpo: TcxDBMemo;
    TabSms: TcxTabSheet;
    Panel3: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    LabelSmsCaratteriDisponibili: TLabel;
    dbeSmsCorpo: TcxDBMemo;
    TabStorico: TcxTabSheet;
    Panel8: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PanelImpostazioni: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    GridSto: TcxGrid;
    btvSto: TcxGridDBBandedTableView;
    btvStoDATAORAINVIO: TcxGridDBBandedColumn;
    btvStoDESTINAZIONE: TcxGridDBBandedColumn;
    btvStoOPERATORE: TcxGridDBBandedColumn;
    btvStoID: TcxGridDBBandedColumn;
    btvStoID_MSG: TcxGridDBBandedColumn;
    lvSto: TcxGridLevel;
    dbeDatoDiRiferimento: TcxDBComboBox;
    Label16: TLabel;
    LabelNoteInvio: TLabel;
    dbeCheckSms: TcxDBCheckBox;
    dbeCheckEmail: TcxDBCheckBox;
    dbeCheckLettera: TcxDBCheckBox;
    Shape3: TShape;
    Label18: TLabel;
    ToolbarImages: TImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    FontDialog1: TFontDialog;
    dbeOffsetDays: TcxDBSpinEdit;
    BtnSegnapostoLettera: TSpeedButton;
    BtnSegnapostoEmail: TSpeedButton;
    BtnSegnapostoSms: TSpeedButton;
    QRIF_EXPIRATION_DAYS: TIntegerField;
    QRIF_NOAPPUNTAMENTO: TStringField;
    Label1: TLabel;
    LabelExpiration: TLabel;
    dbeExpirationDays: TcxDBSpinEdit;
    dbeNoAppuntamento: TcxDBCheckBox;
    procedure btvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btvListCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvListDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure QBeforePost(DataSet: TDataSet);
    procedure QAfterInsert(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure CenterAlignClick(Sender: TObject);
    procedure RightAlignClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure EditorPropertiesSelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeSmsCorpoPropertiesChange(Sender: TObject);
    procedure BtnSegnapostoLetteraClick(Sender: TObject);
    procedure BtnSegnapostoEmailClick(Sender: TObject);
    procedure BtnSegnapostoSmsClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject); Override;
    procedure FormShow(Sender: TObject);
    procedure dbeOffsetDaysPropertiesChange(Sender: TObject);
    procedure dbeExpirationDaysPropertiesChange(Sender: TObject);
  private

    FUpdating: Boolean;

    procedure PerformFileOpen(const AFileName: string);
    procedure FileSaveAs(Sender: TObject);
    function CurrText: TTextAttributes;
    procedure GetFontNames;
    function SelezionaSegnaposto: String;
    function GetSMS_CaratteriDisponibili: Integer;
    { Private declarations }
  public
    { Public declarations }
    property SMS_CaratteriDisponibili:Integer read GetSMS_CaratteriDisponibili;
  end;

var
  ComModelliForm: TComModelliForm;

implementation

uses DataModuleStyles, DataModule1, FormComSegnaposto;

resourcestring
  sSaveChanges = 'Save changes to %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'Untitled';
  sModified = 'Modified';
  sColRowInfo = 'Line: %3d   Col: %3d';

{$R *.dfm}

procedure TComModelliForm.btvListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Era troppo piccolo
  ACanvas.Font.Name   := 'Tahoma';
  ACanvas.Font.Size   := 9;
  // Decide il colore in base all'abilitazione o meno della riga corrente
  if AViewInfo.GridRecord.Values[btvListCOMPUTED_MSG_ENABLED.Index]
  then ACanvas.Font.Color := $00009700    // Verde
  else ACanvas.Font.Color := $000000D7;   // Rosso
end;

procedure TComModelliForm.QCalcFields(DataSet: TDataSet);
begin
  inherited;
  QCOMPUTED_MSG_ENABLED.Value := (  (QMSGTYPE_LETTER.AsString = 'T') or (QMSGTYPE_EMAIL.AsString = 'T') or (QMSGTYPE_SMS.AsString = 'T')   );
end;

procedure TComModelliForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  ComModelliForm := nil;
end;

procedure TComModelliForm.btvListCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
  CurrColor: TColor;
  CurrItem: TcxCustomGridTableItem;
  RI: Integer;
  AValues: PVariant;
  AItems: TcxDataSummaryItems;
begin

  // Inizializzazione
  ADone := True;

  R := AViewInfo.TextAreaBounds;
  R.Bottom := R.Bottom - 3;

  ACanvas.Font.Name := 'Tahoma';

  // Colonna corrente
  CurrItem := Sender.GroupedItems[AViewInfo.GridRecord.Level];
  // Record Index Corrente
  RI := AViewInfo.GridRecord.RecordIndex;

  // RIcava i dati dei summaries del Group Corrente
  Sender.DataController.Summary.GetGroupSummaryInfo(AViewInfo.GridRecord.Index, AItems, AValues);

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Comunicazioni relative a
  TmpStr := '  Comunicazioni per:';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;

  // Campo
  TmpStr := AviewInfo.Text;
  ACanvas.Font.Size := 10;
  DM1.RitornaTestoPrimaDi(':', TmpStr, True);
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);

  // Impianti presenti
//  R.Right := 650;
  TmpStr := VarToStr(Variant(AValues^)[0]) + '  modelli presenti  ';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);

end;

procedure TComModelliForm.btvListDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  inherited;
  // Visualizza i totali
  LabelComAutoCount.Caption := '(' + ASender.FooterSummaryTexts[0] + ' modelli in tutto)';
end;

procedure TComModelliForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_COM_IMPOSTAZIONI');
end;

procedure TComModelliForm.QAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Defaultizzazione
  if QMSGTYPE_LETTER.IsNull       then QMSGTYPE_LETTER.Value      := 'F';
  if QMSGTYPE_EMAIL.IsNull        then QMSGTYPE_EMAIL.Value       := 'F';
  if QMSGTYPE_SMS.IsNull          then QMSGTYPE_SMS.Value         := 'F';
  if QRIF_TIMEOFFSET_DAYS.IsNull  then QRIF_TIMEOFFSET_DAYS.Value := 0;
  if QRIF_EXPIRATION_DAYS.IsNull  then QRIF_EXPIRATION_DAYS.Value := 0;
  if QRIF_NOAPPUNTAMENTO.IsNull   then QRIF_NOAPPUNTAMENTO.Value  := 'F';
end;

procedure TComModelliForm.ToolButton1Click(Sender: TObject);
begin
  inherited;
  Editor.Lines.Clear;
end;

procedure TComModelliForm.OpenButtonClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
  end;
end;

procedure TComModelliForm.SaveButtonClick(Sender: TObject);
begin
  inherited;
  FileSaveAs(Sender)
end;

procedure TComModelliForm.PerformFileOpen(const AFileName: string);
begin
  Editor.SetFocus;
  Editor.Lines.LoadFromFile(AFileName);
end;


procedure TComModelliForm.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Editor.Lines.SaveToFile(SaveDialog.FileName);
  end;
end;





procedure TComModelliForm.CutButtonClick(Sender: TObject);
begin
  inherited;
  Editor.CutToClipboard;
end;

procedure TComModelliForm.CopyButtonClick(Sender: TObject);
begin
  inherited;
  Editor.CopyToClipboard;
end;

procedure TComModelliForm.PasteButtonClick(Sender: TObject);
begin
  inherited;
  Editor.PasteFromClipboard;
end;

procedure TComModelliForm.UndoButtonClick(Sender: TObject);
begin
  inherited;
  with Editor do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TComModelliForm.FontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

function TComModelliForm.CurrText: TTextAttributes;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;


procedure TComModelliForm.FontSizeChange(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TComModelliForm.BoldButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TComModelliForm.ItalicButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TComModelliForm.UnderlineButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TComModelliForm.LeftAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TComModelliForm.CenterAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TComModelliForm.RightAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TComModelliForm.BulletsButtonClick(Sender: TObject);
begin
  inherited;
  if FUpdating then Exit;
  Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);
end;

procedure TComModelliForm.EditorPropertiesSelectionChange(Sender: TObject);
begin
  inherited;
  with Editor.Paragraph do
  try
    FUpdating := True;
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
  finally
    FUpdating := False;
  end;
end;

procedure TComModelliForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Al momento lo storico non sarà visibile
  TabStorico.TabVisible := False;
  // Primo tab selezionato
  PageControlCorpo.ActivePage := TabSms;
  // Inizializzazione editor lettera
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  GetFontNames;
  EditorPropertiesSelectionChange(Self);
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TComModelliForm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;






// Function che ritorna il segnaposto selezionato oppure una stringa nulla
function TComModelliForm.SelezionaSegnaposto: String;
begin
  // Controlla che non sia già esistente
  if ComSegnapostoForm <> nil then Exit;
  // Crea la form e la visualizza come Modale
  try
    Application.CreateForm(TComSegnapostoForm, ComSegnapostoForm);
    ComSegnapostoForm.ShowModal;
    Result := ComSegnapostoForm.SelectedText;
  finally
    // Pulizie finali
    if Assigned(ComSegnapostoForm) then FreeAndNil(ComSegnapostoForm);
  end;
end;


procedure TComModelliForm.dbeSmsCorpoPropertiesChange(Sender: TObject);
begin
  inherited;
  // Aggiorna il contatore dei caratteri rimanenti
  LabelSmsCaratteriDisponibili.Caption := IntToStr(SMS_CaratteriDisponibili);
end;

function TComModelliForm.GetSMS_CaratteriDisponibili: Integer;
begin
  Result := 160 - Length(dbeSmsCorpo.EditingText);
end;

procedure TComModelliForm.BtnSegnapostoLetteraClick(Sender: TObject);
begin
  inherited;
  Editor.SelText := SelezionaSegnaposto;
end;

procedure TComModelliForm.BtnSegnapostoEmailClick(Sender: TObject);
begin
  inherited;
  dbeEmailCorpo.SelText := SelezionaSegnaposto;
end;

procedure TComModelliForm.BtnSegnapostoSmsClick(Sender: TObject);
begin
  inherited;
  dbeSmsCorpo.SelText := SelezionaSegnaposto;
end;

procedure TComModelliForm.RxSpeedModificaClick(Sender: TObject);
begin
  inherited;
  if RxSpeedModifica.Down then begin
    StandardToolBar.Enabled       := True;
    BtnSegnapostoLettera.Enabled  := True;
    BtnSegnapostoEmail.Enabled    := True;
    BtnSegnapostoSms.Enabled      := True;
  end else begin
    StandardToolBar.Enabled       := False;
    BtnSegnapostoLettera.Enabled  := False;
    BtnSegnapostoEmail.Enabled    := False;
    BtnSegnapostoSms.Enabled      := False;
  end;
end;

procedure TComModelliForm.FormShow(Sender: TObject);
begin
  inherited;
  // Disabilita la toolbar
  //  NB: Se la imposto già disabilitata a design time poi non si attiva più nemmeno da codice.
  StandardToolBar.Enabled := False;
end;

procedure TComModelliForm.dbeOffsetDaysPropertiesChange(Sender: TObject);
var
  TmpStr: String;
  Giorni: Integer;
begin
  inherited;

  if VarIsNull(dbeOffsetDays.Value)
  then Giorni := 0
  else Giorni := dbeOffsetDays.Value;

  if Giorni = 0 then begin
    TmpStr := '(Invio il giorno stesso della data di riferimento)';
  end else if Giorni < 0 then begin
    TmpStr := '(Invio  ' + FloatToStr(Abs(Giorni)) + '  giorni prima della data di riferimento)';
  end else begin
    TmpStr := '(Invio  ' + VarToStr(Giorni) + '  giorni dopo la data di riferimento)';
  end;

  LabelNoteInvio.Caption := TmpStr;
end;

procedure TComModelliForm.dbeExpirationDaysPropertiesChange(
  Sender: TObject);
var
  TmpStr: String;
  Giorni: Integer;
begin
  inherited;

  if VarIsNull(dbeExpirationDays.Value)
  then Giorni := 0
  else Giorni := dbeExpirationDays.Value;

  // Non accetta i negativi, eventualmente li rimette a zero
  if Giorni < 0 then begin
    dbeExpirationDays.Value := 0;
    Giorni := 0;
  end;

  if Giorni = 0 then begin
    TmpStr := '(Lo segnala da inviare per sempre o finchè non viene inviato)';
  end else begin
    TmpStr := '(Lo segnala da inviare per  ' + FloatToStr(Abs(Giorni)) + '  giorni o finchè non viene inviato)';
  end;

  LabelExpiration.Caption := TmpStr;
end;

end.
