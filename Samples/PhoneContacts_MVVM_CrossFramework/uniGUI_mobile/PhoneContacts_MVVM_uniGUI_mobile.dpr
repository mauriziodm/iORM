program PhoneContacts_MVVM_uniGUI_mobile;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  FormStart in 'FormStart.pas' {StartForm: TUnimForm},
  FormVC in 'FormVC.pas' {VCForm: TUnimForm},
  M.Model in '..\Commons\Model\M.Model.pas',
  M.Interfaces in '..\Commons\Model\M.Interfaces.pas',
  M.AnotherModel in '..\Commons\Model\M.AnotherModel.pas',
  V.Interfaces in '..\Commons\View\V.Interfaces.pas',
  VM.Person in '..\Commons\ViewModel\VM.Person.pas' {PersonViewModel: TDataModule},
  VM.Main in '..\Commons\ViewModel\VM.Main.pas' {ViewModelMain: TDataModule},
  VM.Interfaces in '..\Commons\ViewModel\VM.Interfaces.pas',
  SampleData in '..\Commons\SampleData.pas',
  RegisterClassesUnit in '..\Commons\RegisterClassesUnit.pas',
  V.Main in 'View\V.Main.pas' {ViewMain: TUniFrame},
  V.Person in 'View\V.Person.pas' {ViewPerson: TUniFrame};

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
