program MapperPhonebookExample;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {MainForm},
  Model in 'Model.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
