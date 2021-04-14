unit FormAssistenzeMobileMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Buttons, Vcl.ExtCtrls, MAURI_SB, Data.DB, IBODataset, IB_Components,
  cxControls, cxStyles, cxCustomData, cxDBData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxLayoutContainer, cxGridCustomView, cxGridCustomTableView, cxGridCustomLayoutView,
  cxGridLayoutView, cxGridDBLayoutView, cxClasses, cxGridLevel, cxGrid, cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxMemo, cxTextEdit, cxPCdxBarPopupMenu, cxPC, Vcl.MPlayer,
  bmpPanel, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxSpinEdit, cxSpinButton;

type
  TAssistenzeMobileMainForm = class(TForm)
    TransImp: TIB_Transaction;
    QryImp: TIBOQuery;
    QryImpTIPOIMPEGNO: TStringField;
    QryImpEVENTMESSAGE: TStringField;
    QryImpSTART_EVENT: TDateTimeField;
    QryImpLOCATION: TStringField;
    QryImpRAGIONESOCIALE: TStringField;
    QryImpID: TIntegerField;
    QryImpPARENTID: TIntegerField;
    QryImpTIPOINTERVENTO: TStringField;
    QryImpTECNICO: TStringField;
    QryImpDATAORACHIAMATA: TDateTimeField;
    QryImpDATAORAINTERVENTO: TDateTimeField;
    QryImpREGISTRO: TStringField;
    QryImpRIFPRATICA: TStringField;
    QryImpAGENTE: TStringField;
    QryImpCODICEARTICOLO: TStringField;
    QryImpDESCRIZIONEARTICOLO: TStringField;
    QryImpAGENTE2: TStringField;
    QryImpAGENTE3: TStringField;
    QryImpAGENTE4: TStringField;
    QryImpEXISTS_PRESCRIZIONI: TStringField;
    QryImpEXISTS_CHIAMATE: TStringField;
    QryImpEXISTS_URGENTI: TStringField;
    QryImpEXISTS_CORRISPNOPAG: TStringField;
    QryImpEXISTS_STAMPATO: TStringField;
    QryImpPRATICA: TIntegerField;
    QryImpDATAPRATICA1: TDateTimeField;
    QryImpRELAZIONEINTERVENTO: TMemoField;
    QryImpRESOURCEID: TIntegerField;
    QryImpFATTO: TStringField;
    SourceImp: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    ImpegniGrid_Odd: TcxStyle;
    ImpegniGrid_Even: TcxStyle;
    MainPageControl: TcxPageControl;
    TabImpegni: TcxTabSheet;
    TabImpegno: TcxTabSheet;
    GridImpegni: TcxGrid;
    btvImpegni: TcxGridDBBandedTableView;
    btvImpegniSTART_EVENT: TcxGridDBBandedColumn;
    btvImpegniTIPOIMPEGNO: TcxGridDBBandedColumn;
    btvImpegniEVENTMESSAGE: TcxGridDBBandedColumn;
    btvImpegniLOCATION: TcxGridDBBandedColumn;
    btvImpegniRAGIONESOCIALE: TcxGridDBBandedColumn;
    btvImpegniID: TcxGridDBBandedColumn;
    btvImpegniPARENTID: TcxGridDBBandedColumn;
    btvImpegniTIPOINTERVENTO: TcxGridDBBandedColumn;
    btvImpegniTECNICO: TcxGridDBBandedColumn;
    btvImpegniDATAORACHIAMATA: TcxGridDBBandedColumn;
    btvImpegniDATAORAINTERVENTO: TcxGridDBBandedColumn;
    btvImpegniREGISTRO: TcxGridDBBandedColumn;
    btvImpegniRIFPRATICA: TcxGridDBBandedColumn;
    btvImpegniAGENTE: TcxGridDBBandedColumn;
    btvImpegniCODICEARTICOLO: TcxGridDBBandedColumn;
    btvImpegniDESCRIZIONEARTICOLO: TcxGridDBBandedColumn;
    btvImpegniAGENTE2: TcxGridDBBandedColumn;
    btvImpegniAGENTE3: TcxGridDBBandedColumn;
    btvImpegniAGENTE4: TcxGridDBBandedColumn;
    btvImpegniEXISTS_PRESCRIZIONI: TcxGridDBBandedColumn;
    btvImpegniEXISTS_CHIAMATE: TcxGridDBBandedColumn;
    btvImpegniEXISTS_URGENTI: TcxGridDBBandedColumn;
    btvImpegniEXISTS_CORRISPNOPAG: TcxGridDBBandedColumn;
    btvImpegniEXISTS_STAMPATO: TcxGridDBBandedColumn;
    btvImpegniPRATICA: TcxGridDBBandedColumn;
    btvImpegniDATAPRATICA1: TcxGridDBBandedColumn;
    btvImpegniRELAZIONEINTERVENTO: TcxGridDBBandedColumn;
    btvImpegniRESOURCEID: TcxGridDBBandedColumn;
    btvImpegniFATTO: TcxGridDBBandedColumn;
    lvImpegni: TcxGridLevel;
    QryImpChiCheCosa: TStringField;
    btvImpegniChiCheCosa: TcxGridDBBandedColumn;
    QryImpQuando: TTimeField;
    QryImpSIMPLE_RAGSOCCLI: TStringField;
    QryImpSIMPLE_DESCPRAT: TStringField;
    ImpegniGrid_Selection: TcxStyle;
    Image1: TImage;
    MainTopPanel: TbmpPanel;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    MediaPlayer1: TMediaPlayer;
    Image2: TImage;
    MainTopPanel2: TbmpPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    MediaPlayer2: TMediaPlayer;
    PanelFilters: TPanel;
    Shape1: TShape;
    PanelFilterData: TPanel;
    cxButton2: TcxButton;
    EditFilterData: TcxDateEdit;
    cxButton1: TcxButton;
    EditFilterTecnico: TcxComboBox;
    ButtonDown: TcxButton;
    ButtonUp: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabelExitMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure QryImpCalcFields(DataSet: TDataSet);
    procedure btvImpegniEVENTMESSAGECustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btvImpegniSTART_EVENTGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure btvImpegniSTART_EVENTCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvImpegniChiCheCosaCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvImpegniLOCATIONCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvImpegniCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure ButtonDownClick(Sender: TObject);
    procedure ButtonUpClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditFilterTecnicoPropertiesChange(Sender: TObject);
    procedure PanelFiltersResize(Sender: TObject);
  private
    { Private declarations }
    FLoaded: Boolean;
    procedure ResetFocus;
    procedure CaricaListaTecnici;
    procedure EseguiQuery;
  public
    { Public declarations }
  end;

var
  AssistenzeMobileMainForm: TAssistenzeMobileMainForm;

implementation

uses
  DateUtils, DataModule1, main;

{$R *.dfm}

procedure TAssistenzeMobileMainForm.btvImpegniCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
  var AHandled: Boolean);
begin
  RxSpeedButtonVisualizzaClick(RxSpeedButtonVisualizza);
end;

procedure TAssistenzeMobileMainForm.btvImpegniChiCheCosaCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Size := 18;
  ACanvas.Font.Style := [fsBold];
end;

procedure TAssistenzeMobileMainForm.btvImpegniEVENTMESSAGECustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Size := 14;
  ACanvas.Font.Style := [];
end;

procedure TAssistenzeMobileMainForm.btvImpegniLOCATIONCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Size := 18;
  ACanvas.Font.Style := [];
end;

procedure TAssistenzeMobileMainForm.btvImpegniSTART_EVENTCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.Font.Size := 32;
  ACanvas.Font.Style := [fsBold];
end;

procedure TAssistenzeMobileMainForm.btvImpegniSTART_EVENTGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  if FormatDateTime('hhnn', ARecord.Values[Sender.Index]) = '0000' then
    AText := ''
  else
    AText := FormatDateTime('h:nn', ARecord.Values[Sender.Index]);
end;

procedure TAssistenzeMobileMainForm.ButtonDownClick(Sender: TObject);
begin
  if btvImpegni.DataController.FocusedRecordIndex > -1 then
    btvImpegni.Controller.GoToNext(False)
  else
    btvImpegni.Controller.FocusedRecordIndex := 0;
end;

procedure TAssistenzeMobileMainForm.ButtonUpClick(Sender: TObject);
begin
  btvImpegni.Controller.GoToPrev(False);
end;

procedure TAssistenzeMobileMainForm.CaricaListaTecnici;
var
   Qry : TIB_Cursor;
   LCurrentIndex: Integer;
   LResourceID: Integer;
   LResourceName: String;
   LOperatoreCorrelato: String;
begin
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Carica l'elenco dei tecnici
      Qry.SQL.Add('SELECT RESOURCEID, RESOURCENAME, OPERATORECORRELATO FROM TECNICI ORDER BY RESOURCENAME');
      Qry.Open;
      EditFilterTecnico.Properties.Items.Clear;
      while not Qry.Eof do
      begin
         LResourceID := Qry.FieldByName('RESOURCEID').AsInteger;
         LResourceName := Trim(Qry.FieldByName('RESOURCENAME').AsString);
         LOperatoreCorrelato := Trim(Qry.FieldByName('OPERATORECORRELATO').AsString);
         LCurrentIndex := EditFilterTecnico.Properties.Items.AddObject(LResourceName, TObject(LResourceID));
         if (LOperatoreCorrelato <> '') and (LOperatoreCorrelato = DM1.IDOperatoreCorrente) then
           EditFilterTecnico.ItemIndex := LCurrentIndex;
         Qry.Next;
      end;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;

procedure TAssistenzeMobileMainForm.cxButton1Click(Sender: TObject);
begin
  EditFilterData.Date := EditFilterData.Date + 1;
end;

procedure TAssistenzeMobileMainForm.cxButton2Click(Sender: TObject);
begin
  EditFilterData.Date := EditFilterData.Date - 1;
end;

procedure TAssistenzeMobileMainForm.EditFilterTecnicoPropertiesChange(Sender: TObject);
begin
  if FLoaded then
    EseguiQuery;
end;

procedure TAssistenzeMobileMainForm.EseguiQuery;
var
  LResourceID: Integer;
begin
  DM1.ShowWait('Levante', 'Caricamento...');
  try
    if QryImp.Active then
      QryImp.Close;
    if not QryImp.Prepared then
      QryImp.Prepare;
    // Filtro per giorno
    QryImp.ParamByName('P_INIZIOGIORNO').Value := StartOfTheDay(EditFilterData.Date);
    QryImp.ParamByName('P_FINEGIORNO').Value := EndOfTheDay(EditFilterData.Date);
    // Filtro per tecnico
    LResourceID := -1;
    if EditFilterTecnico.ItemIndex > -1 then
      LResourceID := Integer(EditFilterTecnico.Properties.Items.Objects[EditFilterTecnico.ItemIndex]);
    QryImp.ParamByName('P_RESOURCEID').Value := LResourceID;
    // Esegue la query
    QryImp.Open;
    FLoaded := True;
    btvImpegni.Controller.FocusedRowIndex := 0;
    GridImpegni.SetFocus;
  finally
    DM1.CloseWait;
  end;
end;

procedure TAssistenzeMobileMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAssistenzeMobileMainForm.FormCreate(Sender: TObject);
begin
  FLoaded := False;
  MainPageControl.ActivePage := TabImpegni;
  MainPageControl.HideTabs := True;
  btvImpegni.OptionsView.BandHeaders := False;
  btvImpegni.OptionsView.Header := False;
  // Set filters
  PanelFilters.Color := clWhite;
  EditFilterData.Date := Date;
  CaricaListaTecnici;
end;

procedure TAssistenzeMobileMainForm.FormResize(Sender: TObject);
begin
  MainTopPanel.Left := Trunc((Width - MainTopPanel.Width) / 2);
  MainTopPanel2.Left := MainTopPanel.Left;
  Update;
  Application.ProcessMessages;
end;

procedure TAssistenzeMobileMainForm.FormShow(Sender: TObject);
begin
  // Eseguiquery
  EseguiQuery;
end;

procedure TAssistenzeMobileMainForm.LabelExitMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   // Visualizza la label sotto il mouse sottolineata
   TLabel(Sender).Font.Style := [fsUnderline];
end;

procedure TAssistenzeMobileMainForm.PanelFiltersResize(Sender: TObject);
begin
  PanelFilterData.Left := Trunc((PanelFilters.Width - PanelFilterData.Width) / 2);
end;

procedure TAssistenzeMobileMainForm.QryImpCalcFields(DataSet: TDataSet);
begin
  QryImpQuando.Value := QryImpSTART_EVENT.Value;
  QryImpChiCheCosa.Value := Format('%s  (%s)', [QryImpSIMPLE_RAGSOCCLI.AsString, QryImpSIMPLE_DESCPRAT.AsString]);
end;

procedure TAssistenzeMobileMainForm.ResetFocus;
begin
  GridImpegni.SetFocus;
end;

procedure TAssistenzeMobileMainForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
//  Application.Terminate;
  MainForm.VisualizzaAvvio(True);
  Hide;
end;

procedure TAssistenzeMobileMainForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
  if btvImpegni.Controller.FocusedRecord.IsData then
  begin
    DM1.ShowWait('Levante', 'Un momento...');
    try
      DM1.ApriImpegno(QryImp.FieldByName('ID').AsInteger, False);
    finally
      DM1.CloseWait;
    end;
  end
end;

end.
