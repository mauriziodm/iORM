program PizzAmore_30_LowCode_Interfaces_mvvm_uniGUI;

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
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  VM.BaseForForm in '..\mvvm_common_vm\VM.BaseForForm.pas' {VMBaseForForm: TioViewModel},
  VM.BaseForList in '..\mvvm_common_vm\VM.BaseForList.pas' {VMBaseForList: TioViewModel},
  VM.Customer in '..\mvvm_common_vm\VM.Customer.pas' {VMCustomer: TioViewModel},
  VM.Interfaces in '..\mvvm_common_vm\VM.Interfaces.pas',
  VM.Order in '..\mvvm_common_vm\VM.Order.pas' {VMOrder: TioViewModel},
  VM.Order.PizzaSel in '..\mvvm_common_vm\VM.Order.PizzaSel.pas' {VMOrderPizzaSel: TioViewModel},
  VM.Pizza in '..\mvvm_common_vm\VM.Pizza.pas' {VMPizza: TioViewModel},
  VM.Start in '..\mvvm_common_vm\VM.Start.pas' {VMStart: TioViewModel},
  VM.Where.OrderHistory in '..\mvvm_common_vm\VM.Where.OrderHistory.pas' {VMWhereOrderHistory: TioViewModel},
  Form.ViewContext in 'Form.ViewContext.pas' {ViewContextForm: TUniForm},
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TUniFrame},
  View.Customer.List in 'View.Customer.List.pas' {ViewCustomers: TUniFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TUniFrame},
  View.Customer in 'View.Customer.pas' {ViewCustomer: TUniFrame},
  View.Pizza.List in 'View.Pizza.List.pas' {ViewPizzas: TUniFrame},
  RegisterClasses in 'RegisterClasses.pas',
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TUniFrame},
  View.Order.List in 'View.Order.List.pas' {ViewOrders: TUniFrame},
  View.Order in 'View.Order.pas' {ViewOrder: TUniFrame},
  View.Where.OrderHistory in 'View.Where.OrderHistory.pas' {ViewWhereOrderHistory: TFrame},
  VM.Customer.List in '..\mvvm_common_vm\VM.Customer.List.pas' {VMCustomerList: TioViewModel},
  VM.Order.List in '..\mvvm_common_vm\VM.Order.List.pas' {VMOrderList: TioViewModel},
  VM.Pizza.List in '..\mvvm_common_vm\VM.Pizza.List.pas' {VMPizzaList: TioViewModel},
  Where.Interfaces in '..\common_model\Where.Interfaces.pas',
  Where.Order in '..\common_model\Where.Order.pas',
  Where.Pizza in '..\common_model\Where.Pizza.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
