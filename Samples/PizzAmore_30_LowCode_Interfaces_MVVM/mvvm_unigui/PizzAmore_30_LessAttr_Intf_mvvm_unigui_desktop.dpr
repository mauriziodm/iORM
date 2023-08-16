program PizzAmore_30_LessAttr_Intf_mvvm_unigui_desktop;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Form.Start in 'Form.Start.pas' {StartForm: TUniForm},
  Model.Customer in '..\common_model\Model.Customer.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.Where.Interfaces in '..\common_model\Model.Where.Interfaces.pas',
  Model.Where.Order in '..\common_model\Model.Where.Order.pas',
  Model.Where.Pizza in '..\common_model\Model.Where.Pizza.pas',
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  VM.BaseForForm in '..\mvvm_common_vm\VM.BaseForForm.pas' {VMBaseForForm: TioViewModel},
  VM.BaseForList in '..\mvvm_common_vm\VM.BaseForList.pas' {VMBaseForList: TioViewModel},
  VM.Customer in '..\mvvm_common_vm\VM.Customer.pas' {VMCustomer: TioViewModel},
  VM.Customers in '..\mvvm_common_vm\VM.Customers.pas' {VMCustomers: TioViewModel},
  VM.Interfaces in '..\mvvm_common_vm\VM.Interfaces.pas',
  VM.Order in '..\mvvm_common_vm\VM.Order.pas' {VMOrder: TioViewModel},
  VM.Order.PizzaSel in '..\mvvm_common_vm\VM.Order.PizzaSel.pas' {VMOrderPizzaSel: TioViewModel},
  VM.Orders in '..\mvvm_common_vm\VM.Orders.pas' {VMOrders: TioViewModel},
  VM.Pizza in '..\mvvm_common_vm\VM.Pizza.pas' {VMPizza: TioViewModel},
  VM.Pizzas in '..\mvvm_common_vm\VM.Pizzas.pas' {VMPizzas: TioViewModel},
  VM.Start in '..\mvvm_common_vm\VM.Start.pas' {VMStart: TioViewModel},
  VM.Where.OrderHistory in '..\mvvm_common_vm\VM.Where.OrderHistory.pas' {VMWhereOrderHistory: TioViewModel},
  Form.ViewContext in 'Form.ViewContext.pas' {ViewContextForm: TUniForm},
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TUniFrame},
  View.Customers in 'View.Customers.pas' {ViewCustomers: TUniFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TUniFrame},
  View.Customer in 'View.Customer.pas' {ViewCustomer: TUniFrame},
  View.Pizzas in 'View.Pizzas.pas' {ViewPizzas: TUniFrame},
  RegisterClasses in 'RegisterClasses.pas',
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TUniFrame},
  View.Orders in 'View.Orders.pas' {ViewOrders: TUniFrame},
  View.Order in 'View.Order.pas' {ViewOrder: TUniFrame},
  View.Where.OrderHistory in 'View.Where.OrderHistory.pas' {ViewWhereOrderHistory: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
