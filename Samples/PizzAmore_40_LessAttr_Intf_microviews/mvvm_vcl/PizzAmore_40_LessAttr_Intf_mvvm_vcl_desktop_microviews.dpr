program PizzAmore_40_LessAttr_Intf_mvvm_vcl_desktop_microviews;

uses
  Vcl.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  Form.ViewContext in 'Form.ViewContext.pas' {ViewContextForm},
  VM.Interfaces in '..\mvvm_common_vm\VM.Interfaces.pas',
  VM.Start in '..\mvvm_common_vm\VM.Start.pas' {VMStart: TioViewModel},
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TFrame},
  VM.BaseForList in '..\mvvm_common_vm\VM.BaseForList.pas' {VMBaseForList: TioViewModel},
  VM.Customers in '..\mvvm_common_vm\VM.Customers.pas' {VMCustomers: TioViewModel},
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Customer in '..\common_model\Model.Customer.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  View.Customers in 'View.Customers.pas' {ViewCustomers: TFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TFrame},
  VM.BaseForForm in '..\mvvm_common_vm\VM.BaseForForm.pas' {VMBaseForForm: TioViewModel},
  View.Customer in 'View.Customer.pas' {ViewCustomer: TFrame},
  VM.Customer in '..\mvvm_common_vm\VM.Customer.pas' {VMCustomer: TioViewModel},
  View.Pizzas in 'View.Pizzas.pas' {ViewPizzas: TFrame},
  VM.Pizzas in '..\mvvm_common_vm\VM.Pizzas.pas' {VMPizzas: TioViewModel},
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TFrame},
  VM.Pizza in '..\mvvm_common_vm\VM.Pizza.pas' {VMPizza: TioViewModel},
  View.Orders in 'View.Orders.pas' {ViewOrders: TFrame},
  VM.Orders in '..\mvvm_common_vm\VM.Orders.pas' {VMOrders: TioViewModel},
  View.Order in 'View.Order.pas' {ViewOrder: TFrame},
  VM.Order in '..\mvvm_common_vm\VM.Order.pas' {VMOrder: TioViewModel},
  RegisterClasses in 'RegisterClasses.pas',
  VM.Order.PizzaSel in '..\mvvm_common_vm\VM.Order.PizzaSel.pas' {VMOrderPizzaSel: TioViewModel},
  MicroView.Customer in 'MicroView.Customer.pas' {MicroViewCustomer: TFrame},
  MicroVM.Customer in 'MicroVM.Customer.pas' {tiovmac: TioViewModel};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
