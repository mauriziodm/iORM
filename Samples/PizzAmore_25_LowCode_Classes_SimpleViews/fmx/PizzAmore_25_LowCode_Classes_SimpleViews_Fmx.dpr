program PizzAmore_25_LowCode_Classes_SimpleViews_Fmx;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Customer in '..\common_model\Model.Customer.pas',
  View.BaseForList in 'View.BaseForList.pas' {ViewBaseForList: TFrame},
  View.Customer.List in 'View.Customer.List.pas' {ViewCustomerList: TFrame},
  View.BaseForForm in 'View.BaseForForm.pas' {ViewBaseForForm: TFrame},
  View.Customer in 'View.Customer.pas' {CustomerView: TFrame},
  View.Pizza.List in 'View.Pizza.List.pas' {ViewPizzaList: TFrame},
  View.Pizza in 'View.Pizza.pas' {ViewPizza: TFrame},
  View.Order in 'View.Order.pas' {ViewOrder: TFrame},
  View.Order.List in 'View.Order.List.pas' {ViewOrderList: TFrame},
  View.Where.OrderHistory in 'View.Where.OrderHistory.pas' {ViewOrderHistory: TFrame},
  Where.Order in '..\common_model\Where.Order.pas',
  Where.Pizza in '..\common_model\Where.Pizza.pas',
  ETM.Repository in '..\common_model\ETM.Repository.pas',
  View.ETM in 'View.ETM.pas' {EtmView: TFrame},
  Model.Pizza.IngredientRow in '..\common_model\Model.Pizza.IngredientRow.pas',
  Model.Ingredient in '..\common_model\Model.Ingredient.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
