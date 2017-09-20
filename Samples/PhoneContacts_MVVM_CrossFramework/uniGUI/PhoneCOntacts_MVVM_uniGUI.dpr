program PhoneCOntacts_MVVM_uniGUI;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  M.Model in '..\Commons\Model\M.Model.pas',
  M.Interfaces in '..\Commons\Model\M.Interfaces.pas',
  M.AnotherModel in '..\Commons\Model\M.AnotherModel.pas',
  V.Interfaces in '..\Commons\View\V.Interfaces.pas',
  VM.Person in '..\Commons\ViewModel\VM.Person.pas' {PersonViewModel: TDataModule},
  VM.Main in '..\Commons\ViewModel\VM.Main.pas' {ViewModelMain: TDataModule},
  VM.Interfaces in '..\Commons\ViewModel\VM.Interfaces.pas',
  SampleData in '..\Commons\SampleData.pas',
  RegisterClassesUnit in '..\Commons\RegisterClassesUnit.pas',
  uniFormViewContext in 'uniFormViewContext.pas' {uniViewContextForm: TUniForm},
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
