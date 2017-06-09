unit VM.BOMItem;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, VM.Interfaces, iORM.Attributes;

type

  [diImplements(IBOMItemVM)]
  TBOMItemVM = class(TioViewModel, IBOMItemVM)
    MPBOMItem: TioModelPresenter;
    MPBOMArticle: TioModelPresenter;
  private
    { Private declarations }
  public
    { Public declarations }
    [ioAction('acEditArticle', OnExecute)]
    procedure acEditArticleExecute(Sender: TObject);
  end;

implementation

uses
  iORM, V.Interfaces;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TBOMItemVM }

procedure TBOMItemVM.acEditArticleExecute(Sender: TObject);
var
  LAlias: String;
begin
  inherited;
  LAlias := MPBOMArticle.Current.ClassName;
  io.di.LocateView<IArticleView,IArticleVM>(LAlias, LAlias).SetPresenter('MPArticle', MPBOMArticle).Show;
end;

end.
