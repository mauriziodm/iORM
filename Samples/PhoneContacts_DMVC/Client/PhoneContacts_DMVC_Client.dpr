program PhoneContacts_DMVC_Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {MainForm},
  System.IOUtils,
  iORM,
  iORM.CommonTypes,
  AnotherModel in '..\Commons\AnotherModel.pas',
  Interfaces in '..\Commons\Interfaces.pas',
  Model in '..\Commons\Model.pas',
  RegisterClassesUnit in '..\Commons\RegisterClassesUnit.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;


  // ============ IupOrm initialization ====================
  // Connection params
//  io.Connections.NewRESTConnection('http://localhost:8080', False);
//  io.Connections.NewSQLiteConnectionDef(TPath.Combine(TPath.GetDocumentsPath, 'ContactsIntf.db')).Apply;
  // Register classes in the dependency incjection container
  TDIClassRegister.RegisterClasses;
  // ============ IupOrm initialization ====================


  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
