program Pizza_ioPrototypeBS;

uses
  System.StartUpCopy,
//  FMX.MobilePreview,
  FMX.Forms,
  Main in 'Main.pas' {MainForml},
  Model in 'Model.pas',
  iORM,
  System.IOUtils;

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  // ============ IupOrm initialization ====================
  // Set connection for SQLite (under the Documents folder better for mobile use)
//  io.Connections.NewSQLiteConnectionDef(TPath.Combine(TPath.GetDocumentsPath, 'Pizza.db.db')).Apply;
  io.Connections.NewSQLiteConnectionDef(TPath.GetFullPath('..\..\..\SamplesData\Pizza.db')).Apply;
//  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\SamplesData\Pizza.FDB'), 'SYSDBA', 'masterkey', '').Apply;
  // AutoCreation and AutoUpdate of the database
  io.AutoCreateDatabase(False);
  // ============ IupOrm initialization ====================

  Application.Initialize;
  Application.CreateForm(TMainForml, MainForml);
  Application.Run;
end.
