unit VM.Article;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase, Model.Material, Model.Process,
  iORM.MVVM.Components.ModelPresenter, System.Actions, iORM.Attributes;

type

  [diViewModelFor(TMaterial), diViewModelFor(TProcess)]
  TArticleViewModel = class(TioViewModel)
    MPArticle: TioModelPresenter;
    [ioAction('acBack', 'Close', OnExecute)]
    procedure acBackExecute(Sender: TObject);
    [ioAction('acPost', 'Post', OnExecute)]
    procedure acPostExecute(Sender: TObject);
    [ioAction('acPost', OnUpdate)]
    procedure acPostUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TArticleViewModel.acBackExecute(Sender: TObject);
begin
  inherited;
  if MPArticle.Editing then
    MPArticle.Cancel;
  Self.FreeViews;
end;

procedure TArticleViewModel.acPostExecute(Sender: TObject);
begin
  inherited;
  if MPArticle.Editing then
    MPArticle.Post;
end;

procedure TArticleViewModel.acPostUpdate(Sender: TObject);
begin
  inherited;
  Command['acPost'].Enabled :=  MPArticle.Editing;
end;

end.
