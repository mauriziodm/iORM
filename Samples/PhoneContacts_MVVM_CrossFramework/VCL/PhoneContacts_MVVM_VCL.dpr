program PhoneContacts_MVVM_VCL;



uses
  Vcl.Forms,
  FormStart in 'FormStart.pas' {StartForm},
  RegisterClassesUnit in '..\Commons\RegisterClassesUnit.pas',
  SampleData in '..\Commons\SampleData.pas',
  M.AnotherModel in '..\Commons\Model\M.AnotherModel.pas',
  M.Interfaces in '..\Commons\Model\M.Interfaces.pas',
  M.Model in '..\Commons\Model\M.Model.pas',
  VM.Main in '..\Commons\ViewModel\VM.Main.pas' {ViewModelMain: TDataModule},
  VM.Person in '..\Commons\ViewModel\VM.Person.pas' {PersonViewModel: TDataModule},
  V.Main in 'View\V.Main.pas' {ViewMain: TFrame},
  FormViewContext in 'FormViewContext.pas' {ViewContextForm},
  V.Person in 'View\V.Person.pas' {ViewPerson: TFrame},
  V.Customer in 'View\V.Customer.pas' {ViewCustomer: TFrame},
  V.VipCustomer in 'View\V.VipCustomer.pas' {ViewVipCustomer: TFrame},
  V.Employee in 'View\V.Employee.pas' {ViewEmployee: TFrame};

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
