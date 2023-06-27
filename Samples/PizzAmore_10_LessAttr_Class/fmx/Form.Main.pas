unit Form.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, System.Actions, FMX.ActnList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces,
  iORM.Abstraction.FMX, iORM.DB.ConnectionDef, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.GenData, FMX.Edit, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, iORM.LiveBindings.PrototypeBindSource.Detail, Fmx.Bind.Grid, Data.Bind.Grid, iORM.StdActions.Fmx, FMX.ListBox, iORM.Where.Interfaces;

type
  TMainForm = class(TForm)
    ActionList1: TActionList;
    SQLiteConn: TioSQLiteConnectionDef;
    ioFMX1: TioFMX;
    BSCustomers: TioPrototypeBindSourceMaster;
    BindingsList1: TBindingsList;
    BSPizzas: TioPrototypeBindSourceMaster;
    BSOrders: TioPrototypeBindSourceMaster;
    ScaledLayoutMain: TScaledLayout;
    TabControlMain: TTabControl;
    TabItemStart: TTabItem;
    Layout3D1: TLayout3D;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    ImageLogo: TImage;
    Rectangle1: TRectangle;
    TabItemOrder: TTabItem;
    ToolBarOrder: TToolBar;
    ButtonOrderBack: TSpeedButton;
    ButtonOrderPersist: TSpeedButton;
    LabelOrderTitle: TLabel;
    Label3: TLabel;
    EditOrderID: TEdit;
    EditOrderDate: TEdit;
    TabItemCustomer: TTabItem;
    ToolBarCustomer: TToolBar;
    ButtonCustomerBack: TSpeedButton;
    ButtonCustomerPersist: TSpeedButton;
    LabelCustomerTitle: TLabel;
    TabItemPizza: TTabItem;
    ToolBarPizza: TToolBar;
    ButtonPizzaBack: TSpeedButton;
    ButtonPizzaPersist: TSpeedButton;
    LabelPizzaTitle: TLabel;
    TabControlLists: TTabControl;
    TabItemOrders: TTabItem;
    Rectangle5: TRectangle;
    ButtonOrderDelete: TSpeedButton;
    ButtonOrderAdd: TSpeedButton;
    ListViewOrders: TListView;
    TabItemCustomers: TTabItem;
    Rectangle3: TRectangle;
    ButtonCustomerDelete: TSpeedButton;
    ButtonCustomerAdd: TSpeedButton;
    ListViewCustomers: TListView;
    TabItemPIzzas: TTabItem;
    Rectangle4: TRectangle;
    ButtonPizzaDelete: TSpeedButton;
    ButtonPizzaAdd: TSpeedButton;
    ListViewPizzas: TListView;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    LinkListControlToField3: TLinkListControlToField;
    EditOrderNote: TEdit;
    Label4: TLabel;
    EditOrderCustID: TEdit;
    EditOrderCustName: TEdit;
    EditOrderCustPhone: TEdit;
    EditOrderCustAddress: TEdit;
    GridOrderRows: TStringGrid;
    Label5: TLabel;
    Rectangle6: TRectangle;
    Label6: TLabel;
    EditOrderGrandTotal: TEdit;
    BSOrderCustomer: TioPrototypeBindSourceDetail;
    BSOrderRows: TioPrototypeBindSourceDetail;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkGridToDataSourceBSOrderRows: TLinkGridToDataSource;
    acMoveToStartTabItem: TChangeTabAction;
    acMoveToOrderTabItem: TChangeTabAction;
    Label7: TLabel;
    EditCustID: TEdit;
    Label8: TLabel;
    EditCustName: TEdit;
    Label9: TLabel;
    EditCustPhone: TEdit;
    Label10: TLabel;
    EditCustCity: TEdit;
    Label11: TLabel;
    EditCustAddress: TEdit;
    Rectangle7: TRectangle;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    LinkControlToField13: TLinkControlToField;
    ButtonCustomerRevert: TSpeedButton;
    acMoveToCustomerTabItem: TChangeTabAction;
    acMoveToPizzaTabItem: TChangeTabAction;
    Label12: TLabel;
    ButtonOrderRevert: TSpeedButton;
    Label13: TLabel;
    EditPizzaID: TEdit;
    Label14: TLabel;
    EditPizzaName: TEdit;
    Label15: TLabel;
    EditPizzaPrice: TEdit;
    Label16: TLabel;
    ImagePizza: TImage;
    RectanglePizzaImage: TRectangle;
    ButtonPizzaRevert: TSpeedButton;
    LinkControlToField14: TLinkControlToField;
    LinkControlToField15: TLinkControlToField;
    LinkControlToField16: TLinkControlToField;
    LinkControlToField17: TLinkControlToField;
    ToolBar1: TToolBar;
    Label17: TLabel;
    Rectangle8: TRectangle;
    ButtonCustomerPageDown: TSpeedButton;
    ButtonCustomerPageUp: TSpeedButton;
    LabelCustomerPage: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    ComboBoxState: TComboBox;
    PanelCustomerFilter: TPanel;
    BSWhereCustomer: TioPrototypeBindSourceMaster;
    Label18: TLabel;
    Label19: TLabel;
    EditSearchCustID: TEdit;
    ButtonCustomerWhereBuild: TButton;
    ButtonCustomerWhereClear: TButton;
    LinkFillControlToField1: TLinkFillControlToField;
    Label20: TLabel;
    EditSearchCustName: TEdit;
    Label21: TLabel;
    EditSearchCustCity: TEdit;
    LinkControlToField18: TLinkControlToField;
    LinkControlToField19: TLinkControlToField;
    LinkControlToField20: TLinkControlToField;
    BSWherePizzas: TioPrototypeBindSourceMaster;
    Panel1: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    EditWherePizzaID: TEdit;
    ButtonPizzaWhereBuild: TButton;
    ButtonPizzaWhereClear: TButton;
    Label24: TLabel;
    EditWherePizzaName: TEdit;
    Label25: TLabel;
    EditWherePizzaFromPrice: TEdit;
    Label26: TLabel;
    EditWherePizzaToPrice: TEdit;
    LinkControlToField21: TLinkControlToField;
    LinkControlToField22: TLinkControlToField;
    LinkControlToField23: TLinkControlToField;
    LinkControlToField24: TLinkControlToField;
    BSWhereOrders: TioPrototypeBindSourceMaster;
    Panel2: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    EditWhereOrderID: TEdit;
    ButtonOrderWhereBuild: TButton;
    ButtonOrderWhereClear: TButton;
    Label29: TLabel;
    EditWhereOrderNote: TEdit;
    Label30: TLabel;
    EditWhereOrderFromDate: TEdit;
    ComboBoxWhereOrderStatus: TComboBox;
    Label31: TLabel;
    Label32: TLabel;
    EditWhereOrderToDate: TEdit;
    Label33: TLabel;
    EditWhereOrderCustomerName: TEdit;
    Label34: TLabel;
    EditWhereOrderRowDescription: TEdit;
    LinkControlToField25: TLinkControlToField;
    LinkControlToField26: TLinkControlToField;
    LinkControlToField27: TLinkControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkControlToField28: TLinkControlToField;
    LinkControlToField29: TLinkControlToField;
    LinkControlToField30: TLinkControlToField;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure FormCreate(Sender: TObject);
    procedure BSOrdersSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure ListViewPizzasItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewOrdersItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewCustomersItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ButtonCustomerAddClick(Sender: TObject);
    procedure ButtonCustomerPageDownClick(Sender: TObject);
    procedure ButtonCustomerPageUpClick(Sender: TObject);
    procedure ButtonCustomerDeleteClick(Sender: TObject);
    procedure ButtonCustomerPersistClick(Sender: TObject);
    procedure ButtonCustomerRevertClick(Sender: TObject);
    procedure ButtonSearchCustomerClick(Sender: TObject);
    procedure ButtonFilterClearClick(Sender: TObject);
    procedure ButtonPizzaAddClick(Sender: TObject);
    procedure ButtonPizzaDeleteClick(Sender: TObject);
    procedure ButtonPizzaPersistClick(Sender: TObject);
    procedure ButtonPizzaRevertClick(Sender: TObject);
    procedure ButtonOrderAddClick(Sender: TObject);
    procedure ButtonOrderDeleteClick(Sender: TObject);
    procedure ButtonOrderPersistClick(Sender: TObject);
    procedure ButtonOrderRevertClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonPizzaWhereBuildClick(Sender: TObject);
    procedure ButtonPizzaWhereClearClick(Sender: TObject);
    procedure ButtonCustomerWhereBuildClick(Sender: TObject);
    procedure ButtonCustomerWhereClearClick(Sender: TObject);
    procedure ButtonOrderWhereBuildClick(Sender: TObject);
    procedure ButtonOrderWhereClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.IOUtils, Utils.SampleData, Model.Order, Model.Pizza, Model.OrderRow,
  Model.Customer;

{$R *.fmx}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  io.Enums.FillStrings<TOrderState>(ComboBoxState.Items);
  io.Enums.FillStrings<TOrderState>(ComboBoxWhereOrderStatus.Items);
  // Set TabControls
  TabControlMain.TabPosition := TTabPosition.None;
  TabControlMain.ActiveTab := TabItemStart;
  TabControlLists.ActiveTab := TabItemOrders;
  // Open bind sources
  BSOrders.Open;
  BSCustomers.Open;
  BSPizzas.Open;
  // Open where bind sources
  BSWhereCustomer.Open;
  BSWherePizzas.Open;
  BSWhereOrders.Open;
end;

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TMainForm.BSOrdersSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  BSOrders.CurrentAs<TOrder>.AddPizza(ASelected as TPizza);
  BSOrders.Refresh;
  ADone := True;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  BSWherePizzas.BuildWhere(True);
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  BSWherePizzas.ClearWhere(True);
end;

procedure TMainForm.ButtonCustomerAddClick(Sender: TObject);
begin
  BSCustomers.Persistence.Append;
  acMoveToCustomerTabItem.Execute;
end;

procedure TMainForm.ButtonCustomerDeleteClick(Sender: TObject);
begin
  BSCustomers.Persistence.Delete;
end;

procedure TMainForm.ButtonCustomerPageDownClick(Sender: TObject);
begin
  BSCustomers.Paging.PrevPage;
end;

procedure TMainForm.ButtonCustomerPageUpClick(Sender: TObject);
begin
  BSCustomers.Paging.NextPage;
end;

procedure TMainForm.ButtonCustomerPersistClick(Sender: TObject);
begin
  BSCustomers.Persistence.Persist;
end;

procedure TMainForm.ButtonCustomerRevertClick(Sender: TObject);
var
  LIsInserting: Boolean;
begin
  LIsInserting := BSCustomers.Persistence.IsInserting;
  BSCustomers.Persistence.RevertOrDelete;
  if LIsInserting then
    acMoveToOrderTabItem.Execute;
end;

procedure TMainForm.ButtonCustomerWhereBuildClick(Sender: TObject);
begin
  BSWhereCustomer.BuildWhere(True);
end;

procedure TMainForm.ButtonCustomerWhereClearClick(Sender: TObject);
begin
  BSWhereCustomer.ClearWhere(True);
end;

procedure TMainForm.ButtonFilterClearClick(Sender: TObject);
begin
  BSWhereCustomer.ClearWhere(True);
end;

procedure TMainForm.ButtonOrderAddClick(Sender: TObject);
begin
  BSOrders.Persistence.Append;
  acMoveToOrderTabItem.Execute;
end;

procedure TMainForm.ButtonOrderDeleteClick(Sender: TObject);
begin
  BSOrders.Persistence.Delete;
end;

procedure TMainForm.ButtonOrderPersistClick(Sender: TObject);
begin
  BSOrders.Persistence.Persist;
end;

procedure TMainForm.ButtonOrderRevertClick(Sender: TObject);
var
  LIsInserting: Boolean;
begin
  LIsInserting := BSOrders.Persistence.IsInserting;
  BSOrders.Persistence.RevertOrDelete;
  if LIsInserting then
    acMoveToStartTabItem.Execute;
end;

procedure TMainForm.ButtonOrderWhereBuildClick(Sender: TObject);
begin
  BSWhereOrders.BuildWhere(True);
end;

procedure TMainForm.ButtonOrderWhereClearClick(Sender: TObject);
begin
  BSWhereOrders.ClearWhere(True);
end;

procedure TMainForm.ButtonPizzaAddClick(Sender: TObject);
begin
  BSPizzas.Persistence.Append;
  acMoveToPizzaTabItem.Execute;
end;

procedure TMainForm.ButtonPizzaDeleteClick(Sender: TObject);
begin
  BSPizzas.Persistence.Delete;
end;

procedure TMainForm.ButtonPizzaPersistClick(Sender: TObject);
begin
  BSPizzas.Persistence.Persist;
end;

procedure TMainForm.ButtonPizzaRevertClick(Sender: TObject);
var
  LIsInserting: Boolean;
begin
  LIsInserting := BSPizzas.Persistence.IsInserting;
  BSPizzas.Persistence.RevertOrDelete;
  if LIsInserting then
    acMoveToPizzaTabItem.Execute;
end;

procedure TMainForm.ButtonPizzaWhereBuildClick(Sender: TObject);
begin
  BSWherePizzas.BuildWhere(True);
end;

procedure TMainForm.ButtonPizzaWhereClearClick(Sender: TObject);
begin
  BSWherePizzas.ClearWhere(True);
end;

procedure TMainForm.ButtonSearchCustomerClick(Sender: TObject);
begin
  BSWhereCustomer.BuildWhere(True);
end;

procedure TMainForm.ListViewCustomersItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if TabControlMain.ActiveTab = TabItemOrder then
    BSCustomers.SelectCurrent
  else
    acMoveToCustomerTabItem.Execute
end;

procedure TMainForm.ListViewOrdersItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  acMoveToOrderTabItem.Execute
end;

procedure TMainForm.ListViewPizzasItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if TabControlMain.ActiveTab = TabItemOrder then
    BSPizzas.SelectCurrent
  else
    acMoveToPizzaTabItem.Execute
end;

end.
