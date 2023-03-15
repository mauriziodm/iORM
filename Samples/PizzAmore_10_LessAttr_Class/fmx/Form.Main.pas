unit Form.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, System.Actions, FMX.ActnList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces,
  iORM.Abstraction.FMX, iORM.DB.ConnectionDef, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.GenData,
  iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.GenData, FMX.Edit, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, iORM.LiveBindings.PrototypeBindSource.Detail, Fmx.Bind.Grid, Data.Bind.Grid, iORM.StdActions.Fmx, FMX.ListBox;

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
    acOrderPersist: TioBSPersistencePersist;
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
    acCustomerPersist: TioBSPersistencePersist;
    acCustomerRevertOrDelete: TioBSPersistenceRevertOrDelete;
    acMoveToCustomerTabItem: TChangeTabAction;
    acMoveToPizzaTabItem: TChangeTabAction;
    Label12: TLabel;
    ButtonOrderRevert: TSpeedButton;
    acOrderRevertOrDelete: TioBSPersistenceRevertOrDelete;
    acPizzaRevertOrDelete: TioBSPersistenceRevertOrDelete;
    acPizzaPersist: TioBSPersistencePersist;
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
    acOrderDelete: TioBSPersistenceDelete;
    acCustomerDelete: TioBSPersistenceDelete;
    acPizzaDelete: TioBSPersistenceDelete;
    ButtonCustomerPageDown: TSpeedButton;
    ButtonCustomerPageUp: TSpeedButton;
    acCustomersNextPage: TioBSNextPage;
    acCustomersPrevPage: TioBSPrevPage;
    LabelCustomerPage: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    acCustomerAdd: TAction;
    acOrderAdd: TAction;
    acPizzaAdd: TAction;
    EditState: TEdit;
    LinkControlToField18: TLinkControlToField;
    ComboBoxState: TComboBox;
    LinkFillControlToField1: TLinkFillControlToField;
    ListBoxState: TListBox;
    LinkFillControlToField2: TLinkFillControlToField;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure FormCreate(Sender: TObject);
    procedure BSOrdersSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure acCustomerAddExecute(Sender: TObject);
    procedure acOrderAddExecute(Sender: TObject);
    procedure acPizzaAddExecute(Sender: TObject);
    procedure ListViewPizzasItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewOrdersItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewCustomersItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure EditOrderNoteChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.IOUtils, Utils.SampleData, Model.Order, Model.Pizza, Model.OrderRow;

{$R *.fmx}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  io.FillWithEnumStringValues<TOrderState>(ComboBoxState.Items, False);
  io.FillWithEnumStringValues<TOrderState>(ListBoxState.Items, False);
  // Set TabControls
  TabControlMain.TabPosition := TTabPosition.None;
  TabControlMain.ActiveTab := TabItemStart;
  TabControlLists.ActiveTab := TabItemOrders;
  // Open bind sources
  BSOrders.Open;
  BSCustomers.Open;
  BSPizzas.Open;
end;

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TMainForm.acCustomerAddExecute(Sender: TObject);
begin
  BSCustomers.Persistence.Append;
  acMoveToCustomerTabItem.Execute;
end;

procedure TMainForm.acOrderAddExecute(Sender: TObject);
begin
  BSOrders.Persistence.Append;
  acMoveToOrderTabItem.Execute;
end;

procedure TMainForm.acPizzaAddExecute(Sender: TObject);
begin
  BSPizzas.Persistence.Append;
  acMoveToPizzaTabItem.Execute;
end;

procedure TMainForm.BSOrdersSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  BSOrders.CurrentAs<TOrder>.AddPizza(ASelected as TPizza);
  BSOrders.Refresh;
  ADone := True;
end;

procedure TMainForm.EditOrderNoteChangeTracking(Sender: TObject);
begin
//  TLinkObservers.ControlChanged(Tcontrol(Sender));
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
