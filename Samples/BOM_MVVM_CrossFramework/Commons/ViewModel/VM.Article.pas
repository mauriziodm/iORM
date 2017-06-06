unit VM.Article;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, System.Actions,
  VM.Interfaces, iORM.Attributes;

type

  [diImplements(IArticleVM)]
  TArticleViewModel = class(TioViewModel, IArticleVM)
    MPArticle: TioModelPresenter;

    [ioAction('acBack', OnExecute)]
    procedure acBackExecute(Sender: TObject);

    [ioAction('acPost', OnExecute)]
    procedure acPostExecute(Sender: TObject);
    [ioAction('acPost', OnUpdate)]
    procedure acPostUpdate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

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
