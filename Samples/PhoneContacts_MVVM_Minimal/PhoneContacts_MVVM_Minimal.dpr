program PhoneContacts_MVVM_Minimal;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormStart in 'FormStart.pas' {StartForm},
  Model in 'Model.pas',
  ViewModel in 'ViewModel.pas' {ViewModelMain: TDataModule},
  Interfaces in 'Interfaces.pas',
  View in 'View.pas' {ViewMain: TFrame},
  iORM.MVVM.ViewModel in '..\..\Source\iORM.MVVM.ViewModel.pas' {ioViewModel: TDataModule},
  SampleData in 'SampleData.pas';

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
