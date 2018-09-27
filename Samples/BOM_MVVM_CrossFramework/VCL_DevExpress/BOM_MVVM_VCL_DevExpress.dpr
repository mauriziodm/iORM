program BOM_MVVM_VCL_DevExpress;







uses
  Vcl.Forms,
  FormStart in 'FormStart.pas' {StartForm},
  Model.Process in '..\Commons\Model\Model.Process.pas',
  Model.Material in '..\Commons\Model\Model.Material.pas',
  Model.Interfaces in '..\Commons\Model\Model.Interfaces.pas',
  Model.Base in '..\Commons\Model\Model.Base.pas',
  VM.ArticleList in '..\Commons\ViewModel\VM.ArticleList.pas' {ArticleListVM: TDataModule},
  VM.Article in '..\Commons\ViewModel\VM.Article.pas' {ArticleViewModel: TDataModule},
  FormViewContext in 'FormViewContext.pas' {ViewContextForm},
  V.ArticleList in 'View\V.ArticleList.pas' {ArticleListView: TFrame},
  V.Material in 'View\V.Material.pas' {MaterialView: TFrame},
  V.Process in 'View\V.Process.pas' {ProcessView: TFrame},
  iORM.MVVM.ViewModelBase in '..\..\..\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  Model.BOMItems in '..\Commons\Model\Model.BOMItems.pas',
  Model.Product in '..\Commons\Model\Model.Product.pas',
  VM.BOMItem in '..\Commons\ViewModel\VM.BOMItem.pas',
  VM.Product in '..\Commons\ViewModel\VM.Product.pas',
  U.SampleData in '..\Commons\U.SampleData.pas',
  V.Micro.Process in 'View\V.Micro.Process.pas',
  V.Micro.Product in 'View\V.Micro.Product.pas',
  V.Micro.Material in 'View\V.Micro.Material.pas',
  V.Product.Horizontal in 'View\V.Product.Horizontal.pas',
  V.Product in 'View\V.Product.pas',
  V.Product.Vertical in 'View\V.Product.Vertical.pas';

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
