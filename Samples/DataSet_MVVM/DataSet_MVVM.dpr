program DataSet_MVVM;

uses
  Vcl.Forms,
  FormStart in 'FormStart.pas' {StartForm},
  UModel in 'UModel.pas',
  iORM.MVVM.ViewModel in '..\..\Source\iORM.MVVM.ViewModel.pas' {ioViewModel: TDataModule},
  UViewModel in 'UViewModel.pas' {ViewModel: TDataModule},
  FormViewContext in 'FormViewContext.pas' {ViewContextForm},
  UViewLiveBindings in 'UViewLiveBindings.pas' {LiveBindingsView},
  UViewDataSet in 'UViewDataSet.pas' {DataSetView};

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
