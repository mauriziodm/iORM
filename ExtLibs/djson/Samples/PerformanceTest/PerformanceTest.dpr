program PerformanceTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormMain in 'FormMain.pas' {MainForm},
  Model in 'Model.pas',
  DeserializeStreamU in 'DeserializeStreamU.pas',
  DeserializeDOMU in 'DeserializeDOMU.pas',
  DeserializeJDOU in 'DeserializeJDOU.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
