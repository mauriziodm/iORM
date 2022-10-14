program PizzAmore_27_LessAttr_Intf_simplemicroview_vcl_desktop;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {MainForm},
  Form.Customers in 'Form.Customers.pas' {CustomersForm},
  Form.CustomerPrivate in 'Form.CustomerPrivate.pas' {PrivateCustomerForm},
  Form.Pizzas in 'Form.Pizzas.pas' {PizzasForm},
  Form.Pizza in 'Form.Pizza.pas' {PizzaForm},
  Form.Orders in 'Form.Orders.pas' {OrdersForm},
  Form.Order in 'Form.Order.pas' {OrderForm},
  Form.ViewContext in 'Form.ViewContext.pas' {ViewContextForm},
  Model.BaseBO in '..\common_model\Model.BaseBO.pas',
  Model.Customers in '..\common_model\Model.Customers.pas',
  Model.Interfaces in '..\common_model\Model.Interfaces.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Form.CustomerBusiness in 'Form.CustomerBusiness.pas' {BusinessCustomerForm};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
