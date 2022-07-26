program MapperPhonebookDictionaryExample;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {MainForm},
  Model in 'Model.pas',
  Interfaces in 'Interfaces.pas',
  Serializers in 'Serializers.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
