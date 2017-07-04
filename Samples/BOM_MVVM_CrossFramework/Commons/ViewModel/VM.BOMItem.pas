unit VM.BOMItem;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, VM.Interfaces, iORM.Attributes;

type

//  [diImplements(IBOMItemVM)]
  [diViewModelFor('TBOMItemMaterial')]
  [diViewModelFor('TBOMItemProcess')]
  [diViewModelFor('TBOMItemProduct')]
  TBOMItemVM = class(TioViewModel, IBOMItemVM)
    MPBOMItem: TioModelPresenter;
    MPBOMArticle: TioModelPresenter;
  private
    { Private declarations }
  public
    { Public declarations }
    [ioAction('acEditArticle', OnExecute)]
    procedure acEditArticleExecute(Sender: TObject);

    [ioAction('acPost', OnExecute)]
    procedure acPostExecute(Sender: TObject);
    [ioAction('acPost', OnUpdate)]
    procedure acPostUpdate(Sender: TObject);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  iORM, V.Interfaces;


{$R *.dfm}

{ TBOMItemVM }

procedure TBOMItemVM.acEditArticleExecute(Sender: TObject);
//var
//  LAlias: String;
begin
  inherited;


  io.di.LocateViewVMfor(MPBOMArticle.Current)
    .SetPresenter('MPArticle', MPBOMArticle)
    .Show;


//  LAlias := MPBOMArticle.Current.ClassName;
//  io.di.LocateViewVM<IArticleView,IArticleVM>(LAlias, LAlias).SetPresenter('MPArticle', MPBOMArticle).Show;
end;

procedure TBOMItemVM.acPostExecute(Sender: TObject);
begin
  if MPBOMItem.Editing then
    MPBOMItem.Post;
end;

procedure TBOMItemVM.acPostUpdate(Sender: TObject);
begin
  Command['acPost'].Enabled :=  MPBOMItem.Editing;
end;

end.
