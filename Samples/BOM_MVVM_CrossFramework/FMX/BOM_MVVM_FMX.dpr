program BOM_MVVM_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormStart in 'FormStart.pas' {StartForm},
  V.Interfaces in '..\Commons\View\V.Interfaces.pas',
  V.ArticleList in 'View\V.ArticleList.pas' {ArticleListView: TFrame},
  V.Material in 'View\V.Material.pas' {MaterialView: TFrame},
  V.Process in 'View\V.Process.pas' {ProcessView: TFrame},
  V.Product in 'View\V.Product.pas' {ProductView: TFrame},
  V.Micro.Material in 'View\V.Micro.Material.pas' {MicroMaterialView: TFrame},
  V.Micro.Process in 'View\V.Micro.Process.pas' {MicroProcessView: TFrame},
  V.Micro.Product in 'View\V.Micro.Product.pas' {MicroProductView: TFrame},
  iORM.MVVM.ViewModelBase in 'C:\Delphi\Tools\iORM\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  Model.Product in '..\Commons\Model\Model.Product.pas',
  Model.Process in '..\Commons\Model\Model.Process.pas',
  Model.Material in '..\Commons\Model\Model.Material.pas',
  Model.Interfaces in '..\Commons\Model\Model.Interfaces.pas',
  Model.BOMItems in '..\Commons\Model\Model.BOMItems.pas',
  Model.Base in '..\Commons\Model\Model.Base.pas',
  VM.Product in '..\Commons\ViewModel\VM.Product.pas' {ProductViewModel: TDataModule},
  VM.Interfaces in '..\Commons\ViewModel\VM.Interfaces.pas',
  VM.BOMItem in '..\Commons\ViewModel\VM.BOMItem.pas' {BOMItemVM: TDataModule},
  VM.ArticleList in '..\Commons\ViewModel\VM.ArticleList.pas' {ArticleListVM: TDataModule},
  VM.Article in '..\Commons\ViewModel\VM.Article.pas' {ArticleViewModel: TDataModule},
  U.SampleData in '..\Commons\U.SampleData.pas';

{$R *.res}

{$STRONGLINKTYPES ON}

begin
//  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
