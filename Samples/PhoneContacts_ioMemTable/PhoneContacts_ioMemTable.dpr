program PhoneContacts_ioMemTable;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {MainForm},
  System.IOUtils,
  iORM,
  Model in 'Model.pas',
  SampleData in 'SampleData.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
