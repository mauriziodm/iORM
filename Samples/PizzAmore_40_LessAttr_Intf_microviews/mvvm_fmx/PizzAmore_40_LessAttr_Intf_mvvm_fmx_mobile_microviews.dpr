program PizzAmore_40_LessAttr_Intf_mvvm_fmx_mobile_microviews;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  Model.Customer in '..\common_model\Model.Customer.pas',
  VM.Start in '..\mvvm_common_vm\VM.Start.pas' {VMStart: TioViewModel},
  VM.Pizzas in '..\mvvm_common_vm\VM.Pizzas.pas' {VMPizzas: TioViewModel},
  VM.Pizza in '..\mvvm_common_vm\VM.Pizza.pas' {VMPizza: TioViewModel},
  VM.Orders in '..\mvvm_common_vm\VM.Orders.pas' {VMOrders: TioViewModel},
  VM.Order.PizzaSel in '..\mvvm_common_vm\VM.Order.PizzaSel.pas' {VMOrderPizzaSel: TioViewModel},
  VM.Order in '..\mvvm_common_vm\VM.Order.pas' {VMOrder: TioViewModel},
  VM.Interfaces in '..\mvvm_common_vm\VM.Interfaces.pas',
  VM.Customers in '..\mvvm_common_vm\VM.Customers.pas' {VMCustomers: TioViewModel},
  VM.Customer in '..\mvvm_common_vm\VM.Customer.pas' {VMCustomer: TioViewModel},
  VM.BaseForList in '..\mvvm_common_vm\VM.BaseForList.pas' {VMBaseForList: TioViewModel},
  VM.BaseForForm in '..\mvvm_common_vm\VM.BaseForForm.pas' {VMBaseForForm: TioViewModel},
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TFrame},
  View.Customers in 'View.Customers.pas' {ViewCustomers: TFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TFrame},
  View.Customer in 'View.Customer.pas' {ViewCustomer: TFrame},
  View.Pizzas in 'View.Pizzas.pas' {ViewPizzas: TFrame},
  RegisterClasses in 'RegisterClasses.pas',
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TFrame},
  View.Orders in 'View.Orders.pas' {ViewOrders: TFrame},
  View.Order in 'View.Order.pas' {ViewOrder: TFrame},
  View.Customer.Vip in 'View.Customer.Vip.pas' {ViewVipCustomer: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
