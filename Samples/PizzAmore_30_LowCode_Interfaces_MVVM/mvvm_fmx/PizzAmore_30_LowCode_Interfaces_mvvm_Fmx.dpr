program PizzAmore_30_LowCode_Interfaces_mvvm_Fmx;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TFrame},
  View.Customer.List in 'View.Customer.List.pas' {ViewCustomerList: TFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TFrame},
  View.Customer in 'View.Customer.pas' {ViewCustomer: TFrame},
  RegisterClasses in 'RegisterClasses.pas',
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TFrame},
  View.Order.List in 'View.Order.List.pas' {ViewOrderList: TFrame},
  View.Order in 'View.Order.pas' {ViewOrder: TFrame},
  View.Where.OrderHistory in 'View.Where.OrderHistory.pas' {ViewWhereOrderHistory: TFrame},
  View.ETM.List in 'View.ETM.List.pas' {ViewEtmList: TFrame},
  Where.Pizza in '..\common_model\Where.Pizza.pas',
  Where.Order in '..\common_model\Where.Order.pas',
  Where.Interfaces in '..\common_model\Where.Interfaces.pas',
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.Pizza.IngredientRow in '..\common_model\Model.Pizza.IngredientRow.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  Model.Ingredient in '..\common_model\Model.Ingredient.pas',
  Model.Customer in '..\common_model\Model.Customer.pas',
  Etm.Repository in '..\common_model\Etm.Repository.pas',
  VM.Where.OrderHistory in '..\mvvm_common_vm\VM.Where.OrderHistory.pas' {VMWhereOrderHistory: TioViewModel},
  VM.SynchroLog.List in '..\mvvm_common_vm\VM.SynchroLog.List.pas' {VMSynchroLogList: TioViewModel},
  VM.Start in '..\mvvm_common_vm\VM.Start.pas' {VMStart: TioViewModel},
  VM.Pizza in '..\mvvm_common_vm\VM.Pizza.pas' {VMPizza: TioViewModel},
  VM.Pizza.List in '..\mvvm_common_vm\VM.Pizza.List.pas' {VMPizzaList: TioViewModel},
  VM.Order.PizzaSel in '..\mvvm_common_vm\VM.Order.PizzaSel.pas' {VMOrderPizzaSel: TioViewModel},
  VM.Order in '..\mvvm_common_vm\VM.Order.pas' {VMOrder: TioViewModel},
  VM.Order.List in '..\mvvm_common_vm\VM.Order.List.pas' {VMOrderList: TioViewModel},
  VM.Interfaces in '..\mvvm_common_vm\VM.Interfaces.pas',
  VM.Ingredient in '..\mvvm_common_vm\VM.Ingredient.pas' {VMIngredient: TioViewModel},
  VM.Ingredient.List in '..\mvvm_common_vm\VM.Ingredient.List.pas' {VMIngredientList: TioViewModel},
  VM.Etm in '..\mvvm_common_vm\VM.Etm.pas' {VMEtm: TioViewModel},
  VM.Etm.List in '..\mvvm_common_vm\VM.Etm.List.pas' {VMEtmList: TioViewModel},
  VM.Customer in '..\mvvm_common_vm\VM.Customer.pas' {VMCustomer: TioViewModel},
  VM.Customer.List in '..\mvvm_common_vm\VM.Customer.List.pas' {VMCustomerList: TioViewModel},
  VM.BaseForList in '..\mvvm_common_vm\VM.BaseForList.pas' {VMBaseForList: TioViewModel},
  VM.BaseForForm in '..\mvvm_common_vm\VM.BaseForForm.pas' {VMBaseForForm: TioViewModel},
  View.Pizza.List in 'View.Pizza.List.pas' {ViewPizzaList: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
