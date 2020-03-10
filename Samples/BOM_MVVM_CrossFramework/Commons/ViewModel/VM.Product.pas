unit VM.Product;

interface

uses
  System.SysUtils, System.Classes, VM.Article, Model.Product,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes;

type

  [diViewModelFor(TProduct)]
  TProductViewModel = class(TArticleViewModel)
    MPBOMItemList: TioModelPresenter;
  private
    { Private declarations }
  public
    { Public declarations }
    [ioAction('acPopulateItemList', OnExecute)]
    procedure acPopulateItemListExecute(Sender: TObject);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  iORM;

{$R *.dfm}

{ TProductViewModel }

procedure TProductViewModel.acPopulateItemListExecute(Sender: TObject);
begin
  MPBOMItemList.CheckAdapter(True);
  MPBOMItemList.ShowEach('', 'BOMVCProvider');
end;

end.
