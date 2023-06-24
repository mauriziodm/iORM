unit Form.Orders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master, Model.Order, Vcl.Mask;

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
    GridOrders: TDBGrid;
    DSOrders: TioDataSetMaster;
    DSOrdersID: TIntegerField;
    SourceOrders: TDataSource;
    DSOrdersOrderDate: TDateField;
    DSOrdersCustomerName: TStringField;
    DSOrdersGrandTotal: TCurrencyField;
    DSOrdersOrderState: TStringField;
    PanelWhere: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    ButtonHistory: TSpeedButton;
    Label6: TLabel;
    DBEditWhereID: TDBEdit;
    DBEditWhereFromDate: TDBEdit;
    DBEditWhereToDate: TDBEdit;
    DBComboBoxWhereOrderState: TDBComboBox;
    DBEditWhereNote: TDBEdit;
    DBEditWhereCustName: TDBEdit;
    DSWhere: TioDataSetMaster;
    DSWhereOrderID: TIntegerField;
    DSWhereOrderState: TStringField;
    DSWhereNote: TStringField;
    DSWhereFromDate: TDateField;
    DSWhereToDate: TDateField;
    DSWhereCustomerName: TStringField;
    SourceWhere: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonSelectClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure GridOrdersDblClick(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonHistoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // *** Note: the lines below have been deleted ***
  // var
  // OrdersForm: TOrdersForm;

implementation

{$R *.dfm}

procedure TOrdersForm.ButtonAddClick(Sender: TObject);
begin
  DSOrders.Persistence.Append;
  DSOrders.ShowCurrent(nil);
end;

procedure TOrdersForm.ButtonDeleteClick(Sender: TObject);
begin
  DSOrders.Persistence.Delete;
end;

procedure TOrdersForm.ButtonHistoryClick(Sender: TObject);
begin
  DSWhere.WhereClear(True);
end;

procedure TOrdersForm.ButtonSearchClick(Sender: TObject);
begin
  DSWhere.WhereBuild(true);
end;

procedure TOrdersForm.ButtonSelectClick(Sender: TObject);
begin
  DSOrders.ShowCurrent(nil);
end;

procedure TOrdersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrdersForm.FormCreate(Sender: TObject);
begin
  io.Enums.FillStrings<TOrderState>(DBComboBoxWhereOrderState.Items);
  DSOrders.Open;
  DSWhere.Open;
end;

procedure TOrdersForm.GridOrdersDblClick(Sender: TObject);
begin
  ButtonSelectClick(ButtonSelect);
end;

procedure TOrdersForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

end.
