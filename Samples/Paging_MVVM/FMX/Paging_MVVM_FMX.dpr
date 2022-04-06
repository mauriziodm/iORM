program Paging_MVVM_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  iORM.MVVM.ViewModel in '..\..\..\Source\iORM.MVVM.ViewModel.pas' {ioViewModel: TDataModule},
  ViewModel in '..\Common\ViewModel.pas' {VM: TDataModule},
  SampleData in '..\Common\SampleData.pas',
  Model in '..\Common\Model.pas',
  View.BindSource.Grid.Fmx in 'View.BindSource.Grid.Fmx.pas' {ViewBindSourceGridFmx: TFrame},
  View.BindSource.ListView.Fmx in 'View.BindSource.ListView.Fmx.pas' {ViewBindSourceListViewFmx: TFrame},
  View.BindSource.ListBox.Fmx in 'View.BindSource.ListBox.Fmx.pas' {ViewBindSourceListBoxFmx: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
