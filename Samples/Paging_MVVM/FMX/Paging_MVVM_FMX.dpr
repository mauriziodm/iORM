program Paging_MVVM_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  iORM.MVVM.ViewModelBase in '..\..\..\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  ViewModel in '..\Common\ViewModel.pas' {VM: TDataModule},
  SampleData in '..\Common\SampleData.pas',
  Model in '..\Common\Model.pas',
  View.BindSource.Grid.Fmx in 'View.BindSource.Grid.Fmx.pas' {ViewBindSourceGridFmx: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
