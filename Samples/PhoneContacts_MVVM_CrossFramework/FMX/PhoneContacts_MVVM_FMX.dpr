program PhoneContacts_MVVM_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormStart in 'FormStart.pas' {Form1},
  SampleData in '..\Commons\SampleData.pas',
  M.AnotherModel in '..\Commons\Model\M.AnotherModel.pas',
  M.Interfaces in '..\Commons\Model\M.Interfaces.pas',
  M.Model in '..\Commons\Model\M.Model.pas',
  RegisterClassesUnit in '..\Commons\RegisterClassesUnit.pas' {$R *.res},
  VM.Main in '..\Commons\ViewModel\VM.Main.pas' {ViewModelMain: TDataModule},
  VM.Person in '..\Commons\ViewModel\VM.Person.pas' {PersonViewModel: TDataModule},
  V.Main in 'View\V.Main.pas' {ViewMain: TFrame},
  V.Person in 'View\V.Person.pas' {ViewPerson: TFrame},
  V.Customer in 'View\V.Customer.pas' {ViewCustomer: TFrame},
  V.Employee in 'View\V.Employee.pas' {ViewEmployee: TFrame},
  V.VipCustomer in 'View\V.VipCustomer.pas' {ViewVipCustomer: TFrame};

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
