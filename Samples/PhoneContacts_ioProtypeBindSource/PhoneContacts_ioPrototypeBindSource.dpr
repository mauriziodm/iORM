program PhoneContacts_ioPrototypeBindSource;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form1},
  Model in 'Model.pas',
  SampleData in 'SampleData.pas',
  System.IOUtils,
  iORM,
  iORM.CommonTypes;

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
