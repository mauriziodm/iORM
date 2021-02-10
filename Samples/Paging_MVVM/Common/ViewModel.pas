unit ViewModel;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase, iORM.MVVM.Components.ModelPresenter, iORM.Attributes,
  Model;

type

  [diViewModelFor(TArticle)]
  TVM = class(TioViewModel)
    MPArticles: TioModelPresenter;
  private
    { Private declarations }
  public
    { Public declarations }
    [ioAction('acNextPage', 'Next page', TioActionEvent.OnExecute)]
    procedure acNextPageExecute(Sender: TObject);
    [ioAction('acPrevPage', 'Prev page', TioActionEvent.OnExecute)]
    procedure acPrevPageExecute(Sender: TObject);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TVM }

procedure TVM.acNextPageExecute(Sender: TObject);
begin
  MPArticles.ioPaging.NextPage;
end;

procedure TVM.acPrevPageExecute(Sender: TObject);
begin
  MPArticles.ioPaging.PrevPage;
end;

end.
