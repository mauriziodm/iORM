program PizzAmore_25_LessAttr_Class_simpleview_fmx_mobile;

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
  View.Customers in 'View.Customers.pas' {CustomersView: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
