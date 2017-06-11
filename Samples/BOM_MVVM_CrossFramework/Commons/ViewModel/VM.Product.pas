unit VM.Product;

interface

uses
  System.SysUtils, System.Classes, VM.Article,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes, VM.Interfaces;

type

  [diImplements(IArticleVM, 'TProduct')]
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
  iORM, V.Interfaces;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TProductViewModel }

procedure TProductViewModel.acPopulateItemListExecute(Sender: TObject);
var
  I: Integer;
  LAlias: String;
begin
  MPBOMItemList.CheckAdapter(True);
  MPBOMItemList.First;
  for I := 1 to MPBOMItemList.ItemCount do
  begin
    LAlias := MPBOMItemList.Current.ClassName;
    io.di.LocateView<IMicroArticleView, IBOMItemVM>(LAlias)
      .SetPresenter('MPBOMItem', MPBOMItemList)
      .VCProvider('BOMVCProvider')
      .Show;
    MPBOMItemList.Next;
  end;
end;

end.
