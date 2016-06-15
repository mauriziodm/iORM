program PhoneContacts_Interfaces_MVVM_mapper;

{$R *.dres}

uses
  System.StartUpCopy,
//  FMX.MobilePreview,
  FMX.Forms,
  V.Main in 'View\V.Main.pas' {ViewMain},
  M.Model in 'Model\M.Model.pas',
  System.IOUtils,
  iORM,
  SampleData in 'SampleData.pas',
  RegisterClassesUnit in 'RegisterClassesUnit.pas',
  M.AnotherModel in 'Model\M.AnotherModel.pas',
  iORM.MVVM.ViewModelBase in '..\..\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  VM.Main in 'ViewModel\VM.Main.pas' {ViewModelMain: TDataModule},
  VM.Person in 'ViewModel\VM.Person.pas',
  V.Person in 'View\V.Person.pas' {ViewPerson: TFrame},
  Factory in 'Factory\Factory.pas',
  V.Employee in 'View\V.Employee.pas' {ViewEmployee: TFrame},
  V.Interfaces in 'View\V.Interfaces.pas',
  VM.Interfaces in 'ViewModel\VM.Interfaces.pas',
  M.Interfaces in 'Model\M.Interfaces.pas',
  V.Customer in 'View\V.Customer.pas' {ViewCustomer: TFrame},
  V.VipCustomer in 'View\V.VipCustomer.pas' {ViewVipCustomer: TFrame};

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
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
