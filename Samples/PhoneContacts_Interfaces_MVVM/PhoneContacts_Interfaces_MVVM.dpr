program PhoneContacts_Interfaces_MVVM;













{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FStart in 'FStart.pas' {StartForm},
  M.AnotherModel in 'Model\M.AnotherModel.pas',
  M.Interfaces in 'Model\M.Interfaces.pas',
  M.Model in 'Model\M.Model.pas',
  RegisterClassesUnit in 'RegisterClassesUnit.pas',
  SampleData in 'SampleData.pas',
  FMX.Controls,
  V.Customer in 'View\V.Customer.pas' {ViewCustomer: TFrame},
  V.Employee in 'View\V.Employee.pas' {ViewEmployee: TFrame},
  V.Interfaces in 'View\V.Interfaces.pas',
  V.Person in 'View\V.Person.pas' {ViewPerson: TFrame},
  V.VipCustomer in 'View\V.VipCustomer.pas' {ViewVipCustomer: TFrame},
  VM.Interfaces in 'ViewModel\VM.Interfaces.pas',
  VM.Main in 'ViewModel\VM.Main.pas' {ViewModelMain: TDataModule},
  VM.Person in 'ViewModel\VM.Person.pas',
  System.IOUtils,
  iORM,
  V.Main in 'View\V.Main.pas' {ViewMain: TFrame},
  FViewContext in 'FViewContext.pas' {ViewContextForm};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;


  // ============ IupOrm initialization ====================
  // Set connection for SQLite (under the Documents folder better for mobile use)
  io.Connections.NewSQLiteConnectionDef(TPath.GetFullPath('..\..\..\SamplesData\ContactsIntfMVVM.db')).Apply;
  // Set connection for Firebird SQL
//  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\SamplesData\ContactsIntfMVVM.FDB'), 'SYSDBA', 'masterkey', '').Apply;
  // AutoCreation and AutoUpdate of the database
  io.AutoCreateDatabase(False);
  // Check for sample data creation
  TSampleData.CheckForSampleDataCreation;
  // ============ IupOrm initialization ====================


  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
