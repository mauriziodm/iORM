unit VM.Product;

interface

uses
  System.SysUtils, System.Classes, VM.Article,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes, VM.Interfaces;

type

//  [diImplements(IArticleVM, 'TProduct')]
  [diViewModelFor('TProduct')]
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

{$R *.dfm}

{ TProductViewModel }

procedure TProductViewModel.acPopulateItemListExecute(Sender: TObject);
begin
  MPBOMItemList.CheckAdapter(True);
  io.di.LocateViewVMfor(MPBOMItemList).VCProvider('BOMVCProvider').ShowEach;
end;

end.
