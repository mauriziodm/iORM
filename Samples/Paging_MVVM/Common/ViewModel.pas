unit ViewModel;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModel, iORM.Attributes,
  Model, iORM, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master;

type

  [diViewModelFor(TArticle)]
  TVM = class(TioViewModel)
    MPArticles: TioModelPresenterMaster;
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
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
  MPArticles.Paging.NextPage;
end;

procedure TVM.acPrevPageExecute(Sender: TObject);
begin
  MPArticles.Paging.PrevPage;
end;

procedure TVM.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  inherited;
  MPArticles.Open;
end;

end.
