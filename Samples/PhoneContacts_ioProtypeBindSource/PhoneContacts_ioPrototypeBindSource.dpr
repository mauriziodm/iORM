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


  // ============ IupOrm initialization ====================
  io.Connections.NewSQLiteConnectionDef(TPath.Combine(TPath.GetDocumentsPath, 'ContactsObj.db')).Apply;
//  io.Connections.NewSQLiteConnectionDef(TPath.GetFullPath('..\..\..\SamplesData\ContactsObj.db')).Apply;
//  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\SamplesData\ContactsObj.FDB'), 'SYSDBA', 'masterkey', '').Apply;

  // AutoCreation and AutoUpdate of the database
  io.AutoCreateDatabase(False);

  // Check for sample data creation
  TSampleData.CheckForSampleDataCreation;
  // ============ IupOrm initialization ====================


  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
