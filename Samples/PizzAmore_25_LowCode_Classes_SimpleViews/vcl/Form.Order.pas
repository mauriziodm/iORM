unit Form.Order;

interface

uses
  Vcl.Forms, Data.DB, iORM, iORM.Attributes, iORM.CommonTypes, iORM.StdActions.Vcl, Vcl.ActnList, System.Classes,
  System.Actions, iORM.DB.DataSet.Detail, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Controls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.DBGrids, Vcl.DBCGrids, Vcl.ExtCtrls, Vcl.Buttons, Model.Order, iORM.Where.Interfaces, iORM.DB.DataSet.Base, Vcl.Grids, Vcl.Mask, Datasnap.DBClient;

type

  // Register the form into the dependency injection container as SimpleView for TOrder objects
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
    ButtonShowCustomer: TSpeedButton;
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
    DSRowsPizzaPrice: TCurrencyField;
    DSRowsQty: TIntegerField;
    DSRowsRowTotal: TCurrencyField;
    SourceRows: TDataSource;
    DSCustomerFullAddress: TStringField;
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acRevertOrDelete: TioBSPersistenceRevertOrDelete;
    ButtonAdd: TSpeedButton;
    acSelectPizza: TioBSSelectCurrent;
    btnDeleteRow: TSpeedButton;
    acBack: TioBSCloseQuery;
    acShowCustomerSelector: TioBSShowOrSelect;
    Label7: TLabel;
    DBComboBoxOrderState: TDBComboBox;
    DSOrderOrderState: TStringField;
    SpeedButton1: TSpeedButton;
    acShowCustomer: TioBSShowOrSelect;
    acShowETM: TioBSShowOrSelect;
    ButtonETM: TSpeedButton;
    DSRowsPizzaName: TStringField;
    acDeleteRow: TioBSDelete;
    DBLookupComboBox1: TDBLookupComboBox;
    DSCustomers: TioDataSetMaster;
    SourceCustomers: TDataSource;
    DSCustomersID: TIntegerField;
    DSCustomersName: TStringField;
    ClientDataSet1: TClientDataSet;
    DSOrderCustomer: TIntegerField;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBCtrlGridPizzasDblClick(Sender: TObject);
    procedure DSOrderReceiveSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
  private
  public
  end;

implementation

uses
  Model.Pizza;

{$R *.dfm}

procedure TOrderForm.DBCtrlGridPizzasDblClick(Sender: TObject);
begin
  acSelectPizza.Execute;
end;

procedure TOrderForm.DSOrderReceiveSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if ASelected is TPizza then
  begin
    DSOrder.CurrentAs<TOrder>.AddPizza(ASelected as TPizza);
    DSOrder.Refresh;
    ADone := True;
  end;
end;

procedure TOrderForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrderForm.FormShow(Sender: TObject);
begin
  io.Enums.FillStrings<TOrderState>(DBComboBoxOrderState.Items);
  DSPizzas.Open;
  DSCustomers.Open;
end;

end.
