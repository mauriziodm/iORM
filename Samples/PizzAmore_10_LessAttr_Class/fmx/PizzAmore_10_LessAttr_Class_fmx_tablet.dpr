program PizzAmore_10_LessAttr_Class_fmx_tablet;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Main in 'Form.Main.pas' {MainForm},
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Customer in '..\common_model\Model.Customer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
