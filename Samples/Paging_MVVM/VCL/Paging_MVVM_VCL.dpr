program Paging_MVVM_VCL;

uses
  Vcl.Forms,
  Form.Start in 'Form.Start.pas' {StartForm},
  Model in '..\Common\Model.pas',
  SampleData in '..\Common\SampleData.pas',
  iORM.MVVM.ViewModelBase in '..\..\..\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  ViewModel in '..\Common\ViewModel.pas' {VM: TDataModule},
  View.Dataset.Base in 'View.Dataset.Base.pas' {ViewDatasetBase: TFrame},
  View.Dataset.Grid in 'View.Dataset.Grid.pas' {ViewDatasetGrid: TFrame},
  View.BindSource.Base in 'View.BindSource.Base.pas' {ViewBindSourceBase: TFrame},
  View.BindSource.Grid in 'View.BindSource.Grid.pas' {ViewBindSourceGrid: TFrame};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
