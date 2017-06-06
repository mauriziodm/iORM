unit VM.ArticleList;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes, VM.Interfaces,
  System.Actions;

type

  [ioEntity, ioDisableAutoCreateDB]
  TArticleListFilter = class
  private
    FCode: String;
    FTypeAll: Boolean;
    FTypeMaterials: Boolean;
    FTypeProducts: Boolean;
    FDescription: String;
    FTypeProcesses: Boolean;
  public
    constructor Create;
    property TypeAll:Boolean read FTypeAll write FTypeAll;
    property TypeMaterials:Boolean read FTypeMaterials write FTypeMaterials;
    property TypeProcesses:Boolean read FTypeProcesses write FTypeProcesses;
    property TypeProducts:Boolean read FTypeProducts write FTypeProducts;
    property Code:String read FCode write FCode;
    property Description:String read FDescription write FDescription;
  end;

  [diImplements(IArticleListVM)]
  TArticleListVM = class(TioViewModel, IArticleListVM)
    MPArticleList: TioModelPresenter;
    MPFilters: TioModelPresenter;
    procedure DataModuleCreate(Sender: TObject);

    [ioAction('acFilterAll', OnExecute), ioGroupIndex(1000), ioChecked]
    procedure acFilterAllExecute(Sender: TObject);

    [ioAction('acFilterMaterial', OnExecute), ioGroupIndex(1000)]
    procedure acFilterMaterialExecute(Sender: TObject);

    [ioAction('acFilterProcess', OnExecute), ioGroupIndex(1000)]
    procedure acFilterProcessExecute(Sender: TObject);

    [ioAction('acFilterProduct', OnExecute), ioGroupIndex(1000)]
    procedure acFilterProductExecute(Sender: TObject);

    [ioAction('acBack', OnExecute)]
    procedure acBackExecute(Sender: TObject);

    [ioAction('acApplyFilters', OnExecute)]
    procedure acApplyFiltersExecute(Sender: TObject);

    [ioAction('acEditArticle', OnExecute)]
    procedure acEditArticleExecute(Sender: TObject);

    [ioAction('acNewMaterial', OnExecute)]
    procedure acNewMaterialExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  iORM, iORM.Where.Interfaces, V.Interfaces, Model.Interfaces;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TArticleListVM.acApplyFiltersExecute(Sender: TObject);
var
  LWhere: IioWhere;
  LFilter: TArticleListFilter;
begin
  inherited;
  if MPFilters.Editing then
    MPFilters.Post;
  LFilter := MPFilters.CurrentAs<TArticleListFilter>;
  LWhere := io.Where;
  if not LFilter.Code.IsEmpty then
    LWhere._And._Property('Code')._LikeTo('%' + LFilter.Code + '%');
  if not LFilter.Description.IsEmpty then
    LWhere._And._Property('Description')._LikeTo('%' + LFilter.Description + '%');
  MPArticleList.Where := LWhere;
  MPArticleList.Refresh(True);
end;

procedure TArticleListVM.acBackExecute(Sender: TObject);
begin
  inherited;
  io.TerminateApplication;
end;

procedure TArticleListVM.acEditArticleExecute(Sender: TObject);
var
  LAlias: String;
begin
  inherited;
  LAlias := MPArticleList.Current.ClassName;
  io.di.LocateView<IArticleView,IArticleVM>(LAlias).SetPresenter('MPArticle', MPArticleList).Show;
end;

procedure TArticleListVM.acFilterAllExecute(Sender: TObject);
begin
  inherited;
  MPArticleList.TypeName := 'IBase';
  MPArticleList.Refresh(True);
end;

procedure TArticleListVM.acFilterMaterialExecute(Sender: TObject);
begin
  inherited;
  MPArticleList.TypeName := 'IMaterial';
  MPArticleList.Refresh(True);
end;

procedure TArticleListVM.acFilterProcessExecute(Sender: TObject);
begin
  inherited;
  MPArticleList.TypeName := 'IProcess';
  MPArticleList.Refresh(True);
end;

procedure TArticleListVM.acFilterProductExecute(Sender: TObject);
begin
  inherited;
  MPArticleList.TypeName := 'IProduct';
  MPArticleList.Refresh(True);
end;

procedure TArticleListVM.acNewMaterialExecute(Sender: TObject);
var
  LMaterial: IMaterial;
begin
  inherited;
  LMaterial := io.di.Locate<IMaterial>.Get;
  MPArticleList.Append(LMaterial as TObject);
  Command['acEditArticle'].Execute;
end;

procedure TArticleListVM.DataModuleCreate(Sender: TObject);
var
  LFilters: TArticleListFilter;
begin
  inherited;
  LFilters := TArticleListFilter.Create;
  MPFilters.SetDataObject(LFilters);
end;

{ TArticleListFilter }

constructor TArticleListFilter.Create;
begin
  FTypeAll := True;
  FTypeMaterials := False;
  FTypeProcesses := False;
  FTypeProducts := False;
  FCode := '';
  FDescription := '';
end;

end.
