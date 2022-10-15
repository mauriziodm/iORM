unit Form.Order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBCGrids, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, iORM.DB.DataSet.Detail,
  iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, Vcl.DBActns, Model.Order, MicroView.Customer, iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider;

type

  [diSimpleViewFor(TOrder)]
  TOrderForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    PanelPizzas: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBTextName: TDBText;
    DBTextPrice: TDBText;
    DBImage: TDBImage;
    DSPizzas: TioDataSetMaster;
    DSPizzasName: TStringField;
    DSPizzasPrice: TCurrencyField;
    DSPizzasImage: TGraphicField;
    SourcePizzas: TDataSource;
    Label1: TLabel;
    DBEditID: TDBEdit;
    DBEditDate: TDBEdit;
    Label2: TLabel;
    DBEditNote: TDBEdit;
    Label6: TLabel;
    DBEditGrandTotal: TDBEdit;
    DSOrder: TioDataSetMaster;
    DSOrderID: TIntegerField;
    DSOrderOrderDate: TDateField;
    DSOrderNote: TStringField;
    DSOrderGrandTotal: TCurrencyField;
    SourceOrder: TDataSource;
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acBack: TAction;
    acRevert: TioBSPersistenceRevertOrDelete;
    ButtonAdd: TSpeedButton;
    acSelectPizza: TioBSSelectCurrent;
    MicroViewCustomer1: TMicroViewCustomer;
    ScrollBoxRows: TScrollBox;
    VCProviderOrderRows: TioViewContextProvider;
    DSRows: TioDataSetDetail;
    procedure DSOrderSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure DBCtrlGrid1DblClick(Sender: TObject);
    procedure acSelectPizza2Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VCProviderOrderRowsRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderOrderRowsAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure DSRowsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrderForm: TOrderForm;

implementation

uses
  Model.Pizza, Form.Customers;

{$R *.dfm}

procedure TOrderForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TOrderForm.acSelectPizza2Execute(Sender: TObject);
begin
  DSPizzas.SelectCurrent;
end;

procedure TOrderForm.DBCtrlGrid1DblClick(Sender: TObject);
begin
  acSelectPizza.Execute;
end;

procedure TOrderForm.DSOrderSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
//  DSOrder.CurrentAs<TOrder>.AddPizza(ASelected as TPizza);
//  DSOrder.Refresh;
//  ADone := True;
end;

procedure TOrderForm.DSRowsAfterOpen(DataSet: TDataSet);
begin
  DSRows.ShowEach('', 'VCProviderOrderRows');
end;

procedure TOrderForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrderForm.FormShow(Sender: TObject);
begin
  DSPizzas.Open;
end;

procedure TOrderForm.VCProviderOrderRowsAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TControl).Align := alTop;
  (AView as TControl).Name := String.Empty;
end;

procedure TOrderForm.VCProviderOrderRowsRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := ScrollBoxRows;
end;

end.
