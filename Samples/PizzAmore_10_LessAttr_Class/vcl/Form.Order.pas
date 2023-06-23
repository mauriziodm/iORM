unit Form.Order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBCGrids, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, iORM.DB.DataSet.Detail,
  iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, Vcl.DBActns;

type
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
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acBack: TAction;
    acRevert: TioBSPersistenceRevertOrDelete;
    ButtonAdd: TSpeedButton;
    acSelectCustomer: TAction;
    acSelectPizza: TioBSSelectCurrent;
    ButtonDeleteRow: TSpeedButton;
    acDeleteRow: TDataSetDelete;
    DBEditState: TDBEdit;
    DBComboBoxState: TDBComboBox;
    DBListBoxState: TDBListBox;
    DBRadioGroupState: TDBRadioGroup;
    DSOrderState: TStringField;
    procedure FormShow(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure DBCtrlGridPizzasDblClick(Sender: TObject);
    procedure acSelectCustomerExecute(Sender: TObject);
    procedure DSOrderSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrderForm: TOrderForm;

implementation

uses
  Model.Order, Model.OrderRow, Model.Pizza, Form.Customers;

{$R *.dfm}

procedure TOrderForm.FormCreate(Sender: TObject);
begin
  io.Enums.FillStrings<TOrderState>(DBComboBoxState.Items);
  io.Enums.FillStrings<TOrderState>(DBListBoxState.Items);
  io.Enums.FillStrings<TOrderState>(DBRadioGroupState.Items);
  io.Enums.FillStrings<TOrderState>(DBRadioGroupState.Values);
end;

procedure TOrderForm.FormShow(Sender: TObject);
begin
  DSOrder.Open;
  DSPizzas.Open;
end;

procedure TOrderForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TOrderForm.acSelectCustomerExecute(Sender: TObject);
begin
//  Application.CreateForm(TCustomersForm, CustomersForm);
//  CustomersForm.DSCustomers.SelectorFor := DSCustomer;
//  CustomersForm.Show;
end;

procedure TOrderForm.DBCtrlGridPizzasDblClick(Sender: TObject);
begin
  acSelectPizza.Execute;
end;

procedure TOrderForm.DSOrderSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  DSOrder.CurrentAs<TOrder>.AddPizza(ASelected as TPizza);
  DSOrder.Refresh;
  ADone := True;
end;

end.
