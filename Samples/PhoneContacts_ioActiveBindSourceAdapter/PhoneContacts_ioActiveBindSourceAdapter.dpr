program PhoneContacts_ioActiveBindSourceAdapter;

uses
  System.StartUpCopy,
//  FMX.MobilePreview,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form1},
  Model in 'Model.pas',
  SampleData in 'SampleData.pas',
  System.IOUtils,
  iORM;

{$R *.res}
{$STRONGLINKTYPES ON}

begin

  // ============ IupOrm initialization ====================
  // Set connection for SQLite (under the Documents folder better for mobile use)
  io.Connections.NewSQLiteConnectionDef(TPath.Combine(TPath.GetDocumentsPath, 'ContactsObj.db')).Apply;
  // Set connection for Firebird SQL
//  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\SamplesData\ContactsObj.FDB'), 'SYSDBA', 'masterkey', '').Apply;
  // AutoCreation and AutoUpdate of the database
  io.GenerateDB(True, True, False);
  // Check for sample data creation
  TSampleData.CheckForSampleDataCreation;
  // ============ IupOrm initialization ====================

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
