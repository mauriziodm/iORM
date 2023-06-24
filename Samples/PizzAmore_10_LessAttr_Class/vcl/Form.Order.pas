unit Form.Order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBCGrids, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, iORM.DB.DataSet.Detail,
  iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, Vcl.DBActns, Model.Order;

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
    DBCtrlGridPizzas: TDBCtrlGrid;
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
    Label3: TLabel;
    DBEditCustID: TDBEdit;
    DBEditCustName: TDBEdit;
    Label4: TLabel;
    DBEditCustAddress: TDBEdit;
    Label5: TLabel;
    DBECustPhone: TDBEdit;
    ButtonSelectCustomer: TSpeedButton;
    GridRows: TDBGrid;
    Label6: TLabel;
    DBEditGrandTotal: TDBEdit;
    DSOrder: TioDataSetMaster;
    DSOrderID: TIntegerField;
    DSOrderOrderDate: TDateField;
    DSOrderNote: TStringField;
    DSOrderGrandTotal: TCurrencyField;
    SourceOrder: TDataSource;
    DSCustomer: TioDataSetDetail;
    DSCustomerID: TIntegerField;
    DSCustomerName: TStringField;
    DSCustomerPhoneNumber: TStringField;
    SourceCustomer: TDataSource;
    DSRows: TioDataSetDetail;
    DSRowsDescription: TStringField;
    DSRowsPrice: TCurrencyField;
    DSRowsQty: TIntegerField;
    DSRowsRowTotal: TCurrencyField;
    SourceRows: TDataSource;
    DSCustomerFullAddress: TStringField;
    ButtonSelectPizza: TSpeedButton;
    ButtonDeleteRow: TSpeedButton;
    DSOrderState: TStringField;
    DBComboBoxOrderState: TDBComboBox;
    Label7: TLabel;
    DSOrderOrderState: TStringField;
    procedure acBackExecute(Sender: TObject);
    procedure DSOrderSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonSelectCustomerClick(Sender: TObject);
    procedure ButtonSelectPizzaClick(Sender: TObject);
    procedure ButtonPersistClick(Sender: TObject);
    procedure ButtonDeleteRowClick(Sender: TObject);
    procedure ButtonRevertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// *** Note: the lines below have been deleted ***
// var
// CustomerForm: TCustomerForm;

implementation

uses
  Model.OrderRow, Model.Pizza, Model.Customer;

{$R *.dfm}

procedure TOrderForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrderForm.FormCreate(Sender: TObject);
begin
  io.Enums.FillStrings<TOrderState>(DBComboBoxOrderState.Items);
  DSPizzas.Open;
end;

procedure TOrderForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TOrderForm.ButtonDeleteRowClick(Sender: TObject);
begin
  DSRows.Delete;
end;

procedure TOrderForm.ButtonPersistClick(Sender: TObject);
begin
  DSOrder.Persistence.Persist;
end;

procedure TOrderForm.ButtonRevertClick(Sender: TObject);
var
  LIsInserting: Boolean;
begin
  LIsInserting := DSOrder.Persistence.IsInserting;
  DSOrder.Persistence.RevertOrDelete;
  if LIsInserting then
    Close;
end;

procedure TOrderForm.ButtonSelectCustomerClick(Sender: TObject);
begin
  io.ShowAsSelector<TCustomer>(DSCustomer, nil, 'LIST');
end;

procedure TOrderForm.ButtonSelectPizzaClick(Sender: TObject);
begin
  DSPizzas.SelectCurrent;
end;

procedure TOrderForm.DSOrderSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  DSOrder.CurrentAs<TOrder>.AddPizza(ASelected as TPizza);
  DSOrder.Refresh;
  ADone := True;
end;

end.
