program PizzAmore_30_LowCode_Interfaces_mvvm_Vcl;

uses
  Vcl.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  Form.ViewContext in 'Form.ViewContext.pas' {ViewContextForm},
  VM.Interfaces in '..\mvvm_common_vm\VM.Interfaces.pas',
  VM.Start in '..\mvvm_common_vm\VM.Start.pas' {VMStart: TioViewModel},
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TFrame},
  VM.BaseForList in '..\mvvm_common_vm\VM.BaseForList.pas' {VMBaseForList: TioViewModel},
  VM.Customer.List in '..\mvvm_common_vm\VM.Customer.List.pas' {VMCustomerList: TioViewModel},
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Customer in '..\common_model\Model.Customer.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  View.Customer.List in 'View.Customer.List.pas' {ViewCustomerList: TFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TFrame},
  VM.BaseForForm in '..\mvvm_common_vm\VM.BaseForForm.pas' {VMBaseForForm: TioViewModel},
  View.Customer in 'View.Customer.pas' {ViewCustomer: TFrame},
  VM.Customer in '..\mvvm_common_vm\VM.Customer.pas' {VMCustomer: TioViewModel},
  View.Pizza.List in 'View.Pizza.List.pas' {ViewPizzaList: TFrame},
  VM.Pizza.List in '..\mvvm_common_vm\VM.Pizza.List.pas' {VMPizzaList: TioViewModel},
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TFrame},
  VM.Pizza in '..\mvvm_common_vm\VM.Pizza.pas' {VMPizza: TioViewModel},
  View.Order.List in 'View.Order.List.pas' {ViewOrderList: TFrame},
  VM.Order.List in '..\mvvm_common_vm\VM.Order.List.pas' {VMOrderList: TioViewModel},
  View.Order in 'View.Order.pas' {ViewOrder: TFrame},
  VM.Order in '..\mvvm_common_vm\VM.Order.pas' {VMOrder: TioViewModel},
  RegisterClasses in 'RegisterClasses.pas',
  VM.Order.PizzaSel in '..\mvvm_common_vm\VM.Order.PizzaSel.pas' {VMOrderPizzaSel: TioViewModel},
  Where.Interfaces in '..\common_model\Where.Interfaces.pas',
  Where.Order in '..\common_model\Where.Order.pas',
  Where.Pizza in '..\common_model\Where.Pizza.pas',
  VM.Where.OrderHistory in '..\mvvm_common_vm\VM.Where.OrderHistory.pas' {VMWhereOrderHistory: TioViewModel},
  View.Where.OrderHistory in 'View.Where.OrderHistory.pas' {ViewWhereOrderHistory: TFrame},
  ETM.Repository in '..\common_model\ETM.Repository.pas',
  VM.ETM in '..\mvvm_common_vm\VM.ETM.pas' {VM_ETM: TioViewModel},
  View.ETM in 'View.ETM.pas' {ViewETM: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
