unit VM.ArticleList;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes, VM.Interfaces,
  System.Actions, Model.Interfaces;

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

    [ioAction('acFilterAll', 'All', OnExecute), ioGroupIndex(1000), ioChecked]
    procedure acFilterAllExecute(Sender: TObject);

    [ioAction('acFilterMaterial', 'Materials', OnExecute), ioGroupIndex(1000)]
    procedure acFilterMaterialExecute(Sender: TObject);

    [ioAction('acFilterProcess', 'Processes', OnExecute), ioGroupIndex(1000)]
    procedure acFilterProcessExecute(Sender: TObject);

    [ioAction('acFilterProduct','Products', OnExecute), ioGroupIndex(1000)]
    procedure acFilterProductExecute(Sender: TObject);

    [ioAction('acClose', 'Exit', OnExecute)]
    procedure acCloseExecute(Sender: TObject);

    [ioAction('acApplyFilters', 'Find', OnExecute)]
    procedure acApplyFiltersExecute(Sender: TObject);

    [ioAction('acEditArticle', OnExecute)]
    procedure acEditArticleExecute(Sender: TObject);

    [ioAction('acDelete', 'Delete', OnExecute)]
    procedure acDeleteExecute(Sender: TObject);

    [ioAction('acRefresh', 'Refresh', OnExecute)]
    procedure acRefreshExecute(Sender: TObject);

    [ioAction('acNewMaterial', 'New material', OnExecute)]
    procedure acNewMaterialExecute(Sender: TObject);
    [ioAction('acNewProcess', 'New process', OnExecute)]
    procedure acNewProcessExecute(Sender: TObject);
    [ioAction('acNewProduct', 'New product', OnExecute)]
    procedure acNewProductExecute(Sender: TObject);
  private
    { Private declarations }
    procedure NewArticle<T:IBase>;
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  iORM, iORM.Where.Interfaces, V.Interfaces, System.Generics.Collections;

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

procedure TArticleListVM.acCloseExecute(Sender: TObject);
begin
  inherited;
  io.TerminateApplication;
end;

procedure TArticleListVM.acDeleteExecute(Sender: TObject);
begin
  MPArticleList.Delete;
end;

procedure TArticleListVM.acEditArticleExecute(Sender: TObject);
begin
  inherited;
  io.di.LocateViewVMfor(MPArticleList).ShowCurrent;
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
begin
  inherited;
  NewArticle<IMaterial>;
end;

procedure TArticleListVM.acNewProcessExecute(Sender: TObject);
begin
  NewArticle<IProcess>;
end;

procedure TArticleListVM.acNewProductExecute(Sender: TObject);
begin
  NewArticle<IProduct>;
end;

procedure TArticleListVM.acRefreshExecute(Sender: TObject);
begin
  MPArticleList.Refresh(True);
end;

procedure TArticleListVM.DataModuleCreate(Sender: TObject);
var
  LFilters: TArticleListFilter;
begin
  inherited;
  LFilters := TArticleListFilter.Create;
  MPFilters.SetDataObject(LFilters);
end;

procedure TArticleListVM.NewArticle<T>;
var
  LArticle: T;
begin
  inherited;
  LArticle := io.di.Locate<T>.Get;
  MPArticleList.Append(LArticle as TObject);
  Command['acEditArticle'].Execute;
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
