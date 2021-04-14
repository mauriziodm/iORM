unit FrameChart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, Data.DB,
  cxDBData, cxGridCustomView, cxGridChartView, cxGridDBChartView, cxClasses,
  cxGridLevel, cxGrid, cxGridTableView, cxGridDBBandedTableView,
  cxGridDBTableView, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, dxPScxPivotGridLnk, dxPScxSchedulerLnk, cxLocalization,
  Vcl.ExtCtrls, cxContainer, cxEdit, cxCheckBox;

type
  TChartFrame = class(TFrame)
    lvChart: TcxGridLevel;
    ChartGrid: TcxGrid;
    cvChart: TcxGridDBChartView;
    dxPrinter: TdxComponentPrinter;
    ChartPrinterLink: TdxGridReportLink;
    ChartStyleRepository1: TcxStyleRepository;
    ChartLegenda: TcxStyle;
    PanelTop: TPanel;
    CBShowValue: TcxCheckBox;
    procedure dxPrinterCustomDrawPageFooter(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
      var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
      ADefaultDrawBackground: Boolean);
    procedure dxPrinterCustomDrawPageHeader(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
      var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
      ADefaultDrawBackground: Boolean);
    procedure cvChartActiveDiagramChanged(Sender: TcxGridChartView;
      ADiagram: TcxGridChartDiagram);
    procedure CBShowValuePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FTableView: TcxGridTableView;
    procedure LoadDataGroups;
    procedure SetShowValues(const AShow:Boolean);
  public
    { Public declarations }
    constructor Create(AOwnerParent: TWinControl; const ATableView: TcxGridTableView; const ADataSource: TDataSource); overload;
    procedure SetReportTitle(const ATitle:String);
    procedure SetCategories(const AColumn: TcxGridDBColumn; const ACaption:String=''); overload;
    procedure SetCategories(const AColumn: TcxGridDBBandedColumn; const ACaption:String=''); overload;
    procedure AddSerie(const AColumn: TcxGridDBColumn; const ACaption:String=''); overload;
    procedure AddSerie(const AColumn: TcxGridDBBandedColumn; const ACaption:String=''); overload;
    procedure AddSerieIfVisible(const AColumn: TcxGridDBColumn; const ACaption:String=''); overload;
    procedure AddSerieIfVisible(const AColumn: TcxGridDBBandedColumn; const ACaption:String=''); overload;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Print;
    procedure PrintPreview;
  end;

implementation

uses
  cxGridDBDataDefinitions, DataModule1;

{$R *.dfm}

{ TChartFrame }

procedure TChartFrame.AddSerie(const AColumn: TcxGridDBBandedColumn; const ACaption:String);
var
  LNewSeries: TcxGridDBChartSeries;
begin
  inherited;
  LNewSeries := cvChart.CreateSeries;
  LNewSeries.Name := 'Serie_' + AColumn.Name;
  LNewSeries.GroupSummaryKind := AColumn.Summary.GroupKind;
  LNewSeries.DataBinding.FieldName := AColumn.DataBinding.FieldName;
  LNewSeries.SortOrder := AColumn.SortOrder;
  if ACaption = '' then
    LNewSeries.DisplayText := AColumn.Caption
  else
    LNewSeries.DisplayText := ACaption;
end;

procedure TChartFrame.AddSerieIfVisible(const AColumn: TcxGridDBColumn;
  const ACaption: String);
begin
  if AColumn.Visible then
    AddSerie(AColumn, ACaption);
end;

procedure TChartFrame.AddSerie(const AColumn: TcxGridDBColumn;
  const ACaption: String);
var
  LNewSeries: TcxGridDBChartSeries;
begin
  inherited;
  LNewSeries := cvChart.CreateSeries;
  LNewSeries.Name := 'Serie_' + AColumn.Name;
  LNewSeries.GroupSummaryKind := AColumn.Summary.GroupKind;
  LNewSeries.DataBinding.FieldName := AColumn.DataBinding.FieldName;
  LNewSeries.SortOrder := AColumn.SortOrder;
  if ACaption = '' then
    LNewSeries.DisplayText := AColumn.Caption
  else
    LNewSeries.DisplayText := ACaption;
end;

procedure TChartFrame.AddSerieIfVisible(const AColumn: TcxGridDBBandedColumn;
  const ACaption: String);
begin
  if AColumn.Visible then
    AddSerie(AColumn, ACaption);
end;

procedure TChartFrame.BeginUpdate;
begin
  cvChart.BeginUpdate;
end;

procedure TChartFrame.CBShowValuePropertiesChange(Sender: TObject);
begin
  SetShowValues((Sender as TcxCheckBox).Checked);
end;

constructor TChartFrame.Create(AOwnerParent: TWinControl;
  const ATableView: TcxGridTableView; const ADataSource: TDataSource);
begin
  inherited Create(AOwnerParent);
  Self.Align := alClient;
  Self.Parent := AOwnerParent;
  FTableView := ATableView;
  // Set some chart params
  BeginUpdate;
  try
    cvChart.DataController.DataSource := ADataSource;
    LoadDataGroups;
    SetShowValues(CBShowValue.Checked);
  finally
    EndUpdate;
  end;
end;

procedure TChartFrame.cvChartActiveDiagramChanged(Sender: TcxGridChartView;
  ADiagram: TcxGridChartDiagram);
begin
  Sender.OptionsView.TransparentCaptions := not (
       (ADiagram is TcxGridChartAreaDiagram)
    or (ADiagram is TcxGridChartLineDiagram)
    or (ADiagram is TcxGridChartStackedAreaDiagram)
    or (ADiagram is TcxGridChartStackedBarDiagram)
    or (ADiagram is TcxGridChartStackedColumnDiagram)
    );
end;

procedure TChartFrame.dxPrinterCustomDrawPageFooter(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
   DM1.dxPrinterDefaultDrawPageFooter(AReportLink, ACanvas, APageIndex, ARect, ANom, ADenom, False);
end;

procedure TChartFrame.dxPrinterCustomDrawPageHeader(Sender: TObject;
  AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer;
  var ARect: TRect; ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
begin
   DM1.dxPrinterDefaultDrawPageHeader(AReportLink, ACanvas, ARect, ANom, ADenom, False);
end;

procedure TChartFrame.EndUpdate;
begin
  cvChart.EndUpdate;
end;

procedure TChartFrame.LoadDataGroups;
var
  I: Integer;
  LNewDataGroup: TcxGridDBChartDataGroup;
begin
  for I := 0 to FTableView.GroupedItemCount-1 do
  begin
    LNewDataGroup := cvChart.CreateDataGroup;
    LNewDataGroup.DataBinding.FieldName := (FTableView.GroupedItems[I].DataBinding as TcxGridItemDBDataBinding).FieldName;
    LNewDataGroup.SortOrder := FTableView.GroupedItems[I].SortOrder;
    LNewDataGroup.Name := 'DataGroup_' + FTableView.GroupedItems[I].Name;
    LNewDataGroup.DisplayText := FTableView.GroupedItems[I].Caption;
  end;
end;

procedure TChartFrame.Print;
begin
  dxPrinter.Print(True, nil, ChartPrinterLink);
end;

procedure TChartFrame.PrintPreview;
begin
  dxPrinter.Preview(True, ChartPrinterLink);
end;

procedure TChartFrame.SetCategories(const AColumn: TcxGridDBBandedColumn;
  const ACaption: String);
begin
  inherited;
  cvChart.Categories.DataBinding.FieldName := AColumn.DataBinding.FieldName;
  cvChart.Categories.SortOrder := AColumn.SortOrder;
  if ACaption = '' then
    cvChart.Categories.DisplayText := AColumn.Caption
  else
    cvChart.Categories.DisplayText := ACaption;
end;

procedure TChartFrame.SetCategories(const AColumn: TcxGridDBColumn;
  const ACaption: String);
begin
  inherited;
  cvChart.Categories.DataBinding.FieldName := AColumn.DataBinding.FieldName;
  cvChart.Categories.SortOrder := AColumn.SortOrder;
  if ACaption = '' then
    cvChart.Categories.DisplayText := AColumn.Caption
  else
    cvChart.Categories.DisplayText := ACaption;
end;

procedure TChartFrame.SetReportTitle(const ATitle: String);
begin
  ChartPrinterLink.ReportTitle.Text := ATitle;
end;

procedure TChartFrame.SetShowValues(const AShow: Boolean);
begin
  cvChartActiveDiagramChanged(cvChart, cvChart.ActiveDiagram);
  if AShow then
  begin
    // DiagramArea
    cvChart.DiagramArea.Values.CaptionPosition := ldvcpAboveRight;
    cvChart.DiagramArea.Values.MarkerStyle := cmsSquare;
    // DiagramBar
    cvChart.DiagramBar.Values.CaptionPosition := cdvcpOutsideEnd;
    // DiagramColumn
    cvChart.DiagramColumn.Values.CaptionPosition := cdvcpOutsideEnd;
    // DiagramLine
    cvChart.DiagramLine.Values.CaptionPosition := ldvcpAboveRight;
    cvChart.DiagramLine.Values.MarkerStyle := cmsSquare;
    // DiagramPie
    cvChart.DiagramPie.Values.CaptionPosition := pdvcpOutsideEndWithLeaderLines;
    // DiagramStackedArea
    cvChart.DiagramStackedArea.Values.CaptionPosition := ldvcpAboveRight;
    cvChart.DiagramStackedArea.Values.MarkerStyle := cmsSquare;
    // DiagramStackedBar
    cvChart.DiagramStackedBar.Values.CaptionPosition := cdvcpCenter;
    // DiagramStackedColumn
    cvChart.DiagramStackedColumn.Values.CaptionPosition := cdvcpCenter;
  end
  else
  begin
    // DiagramArea
    cvChart.DiagramArea.Values.CaptionPosition := ldvcpNone;
//    cvChart.DiagramArea.Values.MarkerStyle := cmsNone;
    // DiagramBar
    cvChart.DiagramBar.Values.CaptionPosition := cdvcpNone;
    // DiagramColumn
    cvChart.DiagramColumn.Values.CaptionPosition := cdvcpNone;
    // DiagramLine
    cvChart.DiagramLine.Values.CaptionPosition := ldvcpNone;
//    cvChart.DiagramLine.Values.MarkerStyle := cmsNone;
    // DiagramPie
    cvChart.DiagramPie.Values.CaptionPosition := pdvcpNone;
    // DiagramStackedArea
    cvChart.DiagramStackedArea.Values.CaptionPosition := ldvcpNone;
//    cvChart.DiagramStackedArea.Values.MarkerStyle := cmsNone;
    // DiagramStackedBar
    cvChart.DiagramStackedBar.Values.CaptionPosition := cdvcpNone;
    // DiagramStackedColumn
    cvChart.DiagramStackedColumn.Values.CaptionPosition := cdvcpNone;
  end;
end;

end.
