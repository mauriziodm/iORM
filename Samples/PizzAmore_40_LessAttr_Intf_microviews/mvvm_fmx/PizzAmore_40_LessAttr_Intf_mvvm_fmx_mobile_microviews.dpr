program PizzAmore_40_LessAttr_Intf_mvvm_fmx_mobile_microviews;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
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
  View.CustomerPrivate in 'View.CustomerPrivate.pas' {ViewCustomerPrivate: TFrame},
  View.Pizzas in 'View.Pizzas.pas' {ViewPizzas: TFrame},
  RegisterClasses in 'RegisterClasses.pas',
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TFrame},
  View.Orders in 'View.Orders.pas' {ViewOrders: TFrame},
  View.Order in 'View.Order.pas' {ViewOrder: TFrame},
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  Model.Customers in '..\common_model\Model.Customers.pas',
  Model.BaseBO in '..\common_model\Model.BaseBO.pas',
  View.CustomerBusiness in 'View.CustomerBusiness.pas' {ViewCustomerBusiness: TFrame},
  MicroVM.Customer in '..\mvvm_common_vm\MicroVM.Customer.pas' {MicroVMCustomer: TioViewModel},
  MicroVM.OrderRowCustom in '..\mvvm_common_vm\MicroVM.OrderRowCustom.pas' {MicroVMOrderRowCustom: TioViewModel},
  MicroVM.OrderRowPizza in '..\mvvm_common_vm\MicroVM.OrderRowPizza.pas' {MicroVMOrderRowPizza: TioViewModel},
  MicroView.Customer in 'MicroView.Customer.pas' {MicroViewCustomer: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
