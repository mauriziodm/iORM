program PhoneContacts_DMVC_Client_ByCode;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {MainForm},
  System.IOUtils,
  iORM,
  SampleData in 'SampleData.pas',
  iORM.CommonTypes,
  RegisterClassesUnit in '..\Commons\RegisterClassesUnit.pas',
  Model in '..\Commons\Model.pas',
  Interfaces in '..\Commons\Interfaces.pas',
  AnotherModel in '..\Commons\AnotherModel.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;


  // ============ IupOrm initialization ====================
  // Set connection for SQLite (under the Documents folder better for mobile use)
//  io.Connections.NewRESTConnection('http://localhost:8080');
  // ============ IupOrm initialization ====================


  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
