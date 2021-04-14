unit FormModelPivotDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomData, cxGraphics, 
  cxEdit, Buttons, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, cxCustomPivotGrid, cxDBPivotGrid, DB, cxDBData, cxCalendar,
  cxTextEdit, cxCurrencyEdit, cxMemo, cxGridDBTableView, cxStyles,
  cxFilter, cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator;

type
  TModelPivotDetailForm = class(TForm)
    GPD: TcxGrid;
    tvGPD: TcxGridTableView;
    lvGPD: TcxGridLevel;
    PanelClose: TPanel;
    SBClose: TSpeedButton;
    procedure SBCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvGPDCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvGPDCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvGPDCustomDrawPartBackground(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
      var ADone: Boolean);
    procedure tvGPDDblClick(Sender: TObject);
  private
    { Private declarations }
    fDetailCustomDataSource: TcxCustomDataSource;
    procedure CopiaProprietaGriglia(ACrossCell:TcxPivotGridCrossCell; ASourceView:TcxGridDBTableView; ADestView:TcxGridTableView);
  public
    { Public declarations }
    constructor Create(Owner: TComponent; Parent:TWinControl; ACrossCell: TcxPivotGridCrossCell; ASourceView: TcxGridDBTableView);
  end;

var
  ModelPivotDetailForm: TModelPivotDetailForm;

implementation

uses DataModule1, SchedaClienti;

{$R *.dfm}

constructor TModelPivotDetailForm.Create(Owner: TComponent; Parent:TWinControl; ACrossCell: TcxPivotGridCrossCell; ASourceView: TcxGridDBTableView);
begin
  inherited Create(Owner);
  Self.Parent := Parent;
  Self.Align := alClient;
  CopiaProprietaGriglia(ACrossCell, ASourceView, tvGPD);
end;



// Creates a drilldown data source for a particular cross cell and displays its data in a form.
procedure TModelPivotDetailForm.CopiaProprietaGriglia(ACrossCell:TcxPivotGridCrossCell; ASourceView:TcxGridDBTableView; ADestView:TcxGridTableView);

  // Creates columns in the grid’s TableView for all the pivot grid fields.
  procedure CreateColumns(APivotGrid: TcxCustomPivotGrid; ASourceView:TcxGridDBTableView; ADestView: TcxGridTableView);
  var
    I: Integer;
    AField: TcxPivotGridField;
    AtvColumn: TcxGridDBColumn;
  begin
    ADestView.OptionsCustomize.Assign(ASourceView.OptionsCustomize);
    ADestView.OptionsBehavior.Assign(ASourceView.OptionsBehavior);
    ADestView.OptionsData.Assign(ASourceView.OptionsData);
    ADestView.OptionsSelection.Assign(ASourceView.OptionsSelection);
    ADestView.OptionsView.Assign(ASourceView.OptionsView);
    ADestView.Styles.Assign(ASourceView.Styles);
    for I := 0 to APivotGrid.FieldCount - 1 do
    begin
      AField := APivotGrid.Fields[I];
      with ADestView.CreateColumn do
      begin
        AtvColumn := ASourceView.GetColumnByFieldName((APivotGrid.Fields[I] as TcxDBPivotGridField).DataBinding.FieldName);
        if not Assigned(AtvColumn) then
          Continue;
        Assign(AtvColumn);
        Index := AtvColumn.Index;
      end;
    end;
  end;

begin
    // Crea le colonne e ne copia le proprietà dalla griglia sorgente
    CreateColumns(ACrossCell.PivotGrid, ASourceView, ADestView);
    // Estrae il DataSource con i dati di dettaglio e lo assegna alla griglia
    //  destinazione.
    fDetailCustomDataSource := ACrossCell.CreateDrillDownDataSource;
    ADestView.DataController.CustomDataSource := fDetailCustomDataSource;
end;


procedure TModelPivotDetailForm.SBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TModelPivotDetailForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TModelPivotDetailForm.tvGPDCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TModelPivotDetailForm.tvGPDCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TModelPivotDetailForm.tvGPDCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TModelPivotDetailForm.tvGPDDblClick(Sender: TObject);
begin
   // Visualizza il documento
   ClientiForm.RxSpeedButtonVisualizzaClick(Self);
end;

end.
