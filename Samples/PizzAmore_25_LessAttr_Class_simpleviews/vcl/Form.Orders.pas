unit Form.Orders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master, Model.Order;

type

  [diSimpleViewFor(TOrder, 'LIST')]
  TOrdersForm = class(TForm)
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    GridCustomers: TDBGrid;
    DSOrders: TioDataSetMaster;
    DSOrdersID: TIntegerField;
    SourceOrders: TDataSource;
    ActionList1: TActionList;
    acDelete: TioBSPersistenceDelete;
    acShow: TAction;
    acAdd: TAction;
    DSOrdersOrderDate: TDateField;
    DSOrdersCustomerName: TStringField;
    DSOrdersGrandTotal: TCurrencyField;
    acBack: TioBSCloseQuery;
    procedure FormCreate(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure GridCustomersDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TOrdersForm.acAddExecute(Sender: TObject);
begin
  DSOrders.Append;
  acShow.Execute;
end;

procedure TOrdersForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TOrdersForm.acShowExecute(Sender: TObject);
begin
  DSOrders.ShowCurrent(acBack);
end;

procedure TOrdersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrdersForm.FormCreate(Sender: TObject);
begin
  DSOrders.Open;
end;

procedure TOrdersForm.GridCustomersDblClick(Sender: TObject);
begin
  acShow.Execute;
end;

end.
