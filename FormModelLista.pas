unit FormModelLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel,
  cxGraphics, cxEdit, DB,
  cxDBData, IBODataset, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, Buttons, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator;

type
  TModelListaForm = class(TModelBaseForm)
    PanelFiltri: TPanel;
    Shape6: TShape;
    Label8: TLabel;
    GridQ: TcxGrid;
    tvQ: TcxGridDBTableView;
    lvQ: TcxGridLevel;
    Q: TIBOQuery;
    DSQ: TDataSource;
    Panel5: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvQCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvQCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvQCustomDrawPartBackground(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
      var ADone: Boolean);
    procedure tvQDblClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject); Virtual;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    FAnagFormClass: TFormClass;
    FCallerCode:Integer;
    { Private declarations }
  protected
    procedure EseguiQuery; virtual;
  public
    { Public declarations }
    property AnagFormClass:TFormClass read FAnagFormClass write FAnagFormClass;
    property CallerCode:Integer read FCallerCode write FCallerCode;
  end;

var
  ModelListaForm: TModelListaForm;

implementation

uses FormHelp, DataModule1;

{$R *.dfm}

procedure TModelListaForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
     close;
end;

procedure TModelListaForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
  inherited;
   HelpForm.Aiuto('');
end;

procedure TModelListaForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  inherited;
  MessageBeep(0);
  tvQ.Controller.DeleteSelection;
end;

procedure TModelListaForm.EseguiQuery;
begin
  if Q.Active then Q.Close;
  if not Q.Prepared then Q.Prepare;
  Q.Open;
  GridQ.SetFocus;
end;

procedure TModelListaForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
  inherited;
  EseguiQuery;
end;

procedure TModelListaForm.FormShow(Sender: TObject);
begin
  inherited;
  EseguiQuery;
end;

procedure TModelListaForm.tvQCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TModelListaForm.tvQCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TModelListaForm.tvQCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TModelListaForm.tvQDblClick(Sender: TObject);
begin
  inherited;
   // Visualizza il documento
   RxSpeedButtonVisualizzaClick(Self);
end;

procedure TModelListaForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
  inherited;
  // Non toglierlo perchè altrimenti nella gestione dell'evento onDoubleClick
  //  della griglia lo righiama e da un errore.
end;

procedure TModelListaForm.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  tvQ.ViewData.Collapse(True);
end;

procedure TModelListaForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  CallerCode := 0;
end;

procedure TModelListaForm.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  tvQ.ViewData.Expand(True);
end;

end.
