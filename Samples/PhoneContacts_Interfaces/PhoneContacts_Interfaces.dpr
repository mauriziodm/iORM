program PhoneContacts_Interfaces;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {MainForm},
  Model in 'Model.pas',
  System.IOUtils,
  iORM,
  SampleData in 'SampleData.pas',
  Interfaces in 'Interfaces.pas',
  RegisterClassesUnit in 'RegisterClassesUnit.pas',
  AnotherModel in 'AnotherModel.pas',
  iORM.CommonTypes;

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
