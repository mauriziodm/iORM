unit Form.Orders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master;

type
  TOrdersForm = class(TForm)
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    GridOrders: TDBGrid;
    DSOrders: TioDataSetMaster;
    DSOrdersID: TIntegerField;
    SourceOrders: TDataSource;
    ActionList1: TActionList;
    acBack: TAction;
    acDelete: TioBSPersistenceDelete;
    acShow: TAction;
    acAdd: TAction;
    DSOrdersOrderDate: TDateField;
    DSOrdersCustomerName: TStringField;
    DSOrdersGrandTotal: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure GridOrdersDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

uses
  Form.Order;

{$R *.dfm}

procedure TOrdersForm.FormCreate(Sender: TObject);
begin
  DSOrders.Open;
end;

procedure TOrdersForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TOrdersForm.acAddExecute(Sender: TObject);
begin
  DSOrders.Persistence.Append;
  acShow.Execute;
end;

procedure TOrdersForm.acShowExecute(Sender: TObject);
begin
    Application.CreateForm(TOrderForm, OrderForm);
    OrderForm.DSOrder.SourceDataSet := DSOrders;
    OrderForm.Show;
end;

procedure TOrdersForm.GridOrdersDblClick(Sender: TObject);
begin
  acShow.Execute;
end;

end.
