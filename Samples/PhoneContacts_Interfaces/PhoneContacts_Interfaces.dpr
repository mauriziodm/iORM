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


  // ============ IupOrm initialization ====================
  // Set connection for SQLite (under the Documents folder better for mobile use)
  io.Connections.NewSQLiteConnectionDef(TPath.Combine(TPath.GetDocumentsPath, 'ContactsIntf.db')).Apply;
//  io.Connections.NewSQLiteConnectionDef(TPath.GetFullPath('..\..\..\SamplesData\ContactsIntf.db')).Apply;
//  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\SamplesData\ContactsIntf.FDB'), 'SYSDBA', 'masterkey', '').Apply;

  // MSQL monitor
  io.Connections.Monitor.Mode := mmRemote;

  // AutoCreation and AutoUpdate of the database
  io.AutoCreateDatabase(False);

  // Check for sample data creation
  TSampleData.CheckForSampleDataCreation;
  // ============ IupOrm initialization ====================


  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
