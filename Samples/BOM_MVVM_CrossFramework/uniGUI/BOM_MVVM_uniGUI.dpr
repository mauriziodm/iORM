program BOM_MVVM_uniGUI;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  FormStart in 'FormStart.pas' {StartForm: TUniForm},
  V.Interfaces in '..\Commons\View\V.Interfaces.pas',
  FormVC in 'FormVC.pas' {VCForm: TUniForm},
  V.ArticleList in 'View\V.ArticleList.pas' {ArticleListView: TUniFrame},
  V.Material in 'View\V.Material.pas' {MaterialView: TUniFrame},
  V.Process in 'View\V.Process.pas' {ProcessView: TUniFrame},
  V.Product in 'View\V.Product.pas' {ProductView: TUniFrame},
  V.Micro.Material in 'View\V.Micro.Material.pas' {MicroMaterialView: TUniFrame},
  V.Micro.Process in 'View\V.Micro.Process.pas' {MicroProcessView: TUniFrame},
  V.Micro.Product in 'View\V.Micro.Product.pas' {MicroProductView: TUniFrame},
  iORM.MVVM.ViewModelBase in 'C:\Delphi\Tools\iORM\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  U.SampleData in '..\Commons\U.SampleData.pas',
  VM.Product in '..\Commons\ViewModel\VM.Product.pas' {ProductViewModel: TDataModule},
  VM.Interfaces in '..\Commons\ViewModel\VM.Interfaces.pas',
  VM.BOMItem in '..\Commons\ViewModel\VM.BOMItem.pas' {BOMItemVM: TDataModule},
  VM.ArticleList in '..\Commons\ViewModel\VM.ArticleList.pas' {ArticleListVM: TDataModule},
  VM.Article in '..\Commons\ViewModel\VM.Article.pas' {ArticleViewModel: TDataModule},
  Model.Product in '..\Commons\Model\Model.Product.pas',
  Model.Process in '..\Commons\Model\Model.Process.pas',
  Model.Material in '..\Commons\Model\Model.Material.pas',
  Model.Interfaces in '..\Commons\Model\Model.Interfaces.pas',
  Model.BOMItems in '..\Commons\Model\Model.BOMItems.pas',
  Model.Base in '..\Commons\Model\Model.Base.pas';

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
