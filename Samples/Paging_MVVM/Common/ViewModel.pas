unit ViewModel;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModel, iORM.Attributes,
  Model;

type

  [diViewModelFor(TArticle)]
  TVM = class(TioViewModel)
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
//  MPArticles.Paging.NextPage;
end;

procedure TVM.acPrevPageExecute(Sender: TObject);
begin
//  MPArticles.Paging.PrevPage;
end;

end.
