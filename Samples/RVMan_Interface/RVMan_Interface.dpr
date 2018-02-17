program RVMan_Interface;

uses
  System.StartUpCopy,
//  FMX.MobilePreview,
  FMX.Forms,
  System.IOUtils,
  Main in 'Main.pas' {MainForm},
  GlobalFactory in 'GlobalFactory.pas',
  Model.BaseClasses in 'Model.BaseClasses.pas',
  Model.BaseConst in 'Model.BaseConst.pas',
  Model.Cost in 'Model.Cost.pas',
  Model.CostType in 'Model.CostType.pas',
  Model.CostTypeWithCostList in 'Model.CostTypeWithCostList.pas',
  Model.Travel in 'Model.Travel.pas',
  Model.TravelWithCostTypeList in 'Model.TravelWithCostTypeList.pas',
  Service.DefaultData in 'Service.DefaultData.pas',
  Model.Factory in 'Model.Factory.pas',
  View.CostGeneric in 'View.CostGeneric.pas' {ViewCostGeneric: TFrame},
  View.Factory in 'View.Factory.pas',
  View.CostFuel in 'View.CostFuel.pas' {ViewCostFuel: TFrame},
  iORM,
  Model.BaseClasses.Interfaces in 'Model.BaseClasses.Interfaces.pas',
  Model.Cost.Interfaces in 'Model.Cost.Interfaces.pas',
  Model.CostType.Interfaces in 'Model.CostType.Interfaces.pas',
  Model.CostTypeWithCostList.Interfaces in 'Model.CostTypeWithCostList.Interfaces.pas',
  Model.Travel.Interfaces in 'Model.Travel.Interfaces.pas',
  RegisterClasses in 'RegisterClasses.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
