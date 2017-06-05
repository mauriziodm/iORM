program BOM_MVVM_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormStart in 'FormStart.pas' {StartForm},
  Model.Interfaces in '..\Commons\Model\Model.Interfaces.pas',
  Model.Base in '..\Commons\Model\Model.Base.pas',
  Model.Material in '..\Commons\Model\Model.Material.pas',
  Model.Process in '..\Commons\Model\Model.Process.pas',
  Model.Product in '..\Commons\Model\Model.Product.pas',
  U.SampleData in '..\Commons\U.SampleData.pas',
  iORM.MVVM.ViewModelBase in '..\..\..\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  VM.ArticleList in '..\Commons\ViewModel\VM.ArticleList.pas' {ArticleListVM: TDataModule},
  VM.Interfaces in '..\Commons\ViewModel\VM.Interfaces.pas',
  V.Base in 'View\V.Base.pas' {BaseView: TFrame},
  V.ArticleList in 'View\V.ArticleList.pas' {ArticleLIstView: TFrame},
  V.Interfaces in '..\Commons\View\V.Interfaces.pas';

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
