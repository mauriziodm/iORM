program PizzAmore_27_LessAttr_Intf_simplemicroview_fmx_mobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TFrame},
  View.Customers in 'View.Customers.pas' {ViewCustomers: TFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TFrame},
  View.CustomerPrivate in 'View.CustomerPrivate.pas' {ViewCustomerPrivate: TFrame},
  View.Pizzas in 'View.Pizzas.pas' {ViewPizzas: TFrame},
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TFrame},
  View.Order in 'View.Order.pas' {ViewOrder: TFrame},
  View.Orders in 'View.Orders.pas' {ViewOrders: TFrame},
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  Model.Customers in '..\common_model\Model.Customers.pas',
  Model.BaseBO in '..\common_model\Model.BaseBO.pas',
  View.CustomerBusiness in 'View.CustomerBusiness.pas' {ViewCustomerBusiness: TFrame},
  MicroView.Customer in 'MicroView.Customer.pas' {MicroViewCustomer: TFrame},
  MicroView.OrderRowCustom in 'MicroView.OrderRowCustom.pas' {MicroViewOrderRowCustom: TFrame},
  MicroView.OrderRowPizza in 'MicroView.OrderRowPizza.pas' {MicroViewOrderRowPizza: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
