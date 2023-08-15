program PizzAmore_25_LowCode_Classes_SimpleViews_Vcl;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {MainForm},
  Model.Customer in '..\common_model\Model.Customer.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Form.Customer.List in 'Form.Customer.List.pas' {CustomerListForm},
  Form.Customer in 'Form.Customer.pas' {CustomerForm},
  Form.Pizza.List in 'Form.Pizza.List.pas' {PizzaListForm},
  Form.Pizza in 'Form.Pizza.pas' {PizzaForm},
  Form.Order.List in 'Form.Order.List.pas' {OrderListForm},
  Form.Order in 'Form.Order.pas' {OrderForm},
  Where.Order in '..\common_model\Where.Order.pas',
  Where.Pizza in '..\common_model\Where.Pizza.pas',
  Form.Where.OrderHistory in 'Form.Where.OrderHistory.pas' {OrderWhereHistoryForm};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
