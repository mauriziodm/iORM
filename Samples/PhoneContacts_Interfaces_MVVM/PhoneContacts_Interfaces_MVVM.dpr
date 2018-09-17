program PhoneContacts_Interfaces_MVVM;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FStart in 'FStart.pas' {StartForm},
  M.AnotherModel in 'Model\M.AnotherModel.pas',
  M.Interfaces in 'Model\M.Interfaces.pas',
  M.Model in 'Model\M.Model.pas',
  FMX.Controls,
  V.Customer in 'View\V.Customer.pas' {ViewCustomer: TFrame},
  V.Employee in 'View\V.Employee.pas' {ViewEmployee: TFrame},
  V.Person in 'View\V.Person.pas' {ViewPerson: TFrame},
  V.VipCustomer in 'View\V.VipCustomer.pas' {ViewVipCustomer: TFrame},
  VM.Interfaces in 'ViewModel\VM.Interfaces.pas',
  VM.Main in 'ViewModel\VM.Main.pas' {ViewModelMain: TDataModule},
  System.IOUtils,
  V.Main in 'View\V.Main.pas' {ViewMain: TFrame},
  FViewContext in 'FViewContext.pas' {ViewContextForm},
  FWait in 'FWait.pas' {WaitForm},
  iORM.MVVM.ViewModelBase in '..\..\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  VM.Person in 'ViewModel\VM.Person.pas' {PersonViewModel: TDataModule},
  SampleData in 'SampleData.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
