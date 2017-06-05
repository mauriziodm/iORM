unit VM.ArticleList;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes, VM.Interfaces,
  System.Actions, FMX.ActnList, Vcl.ActnList;

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
    ActionList1: TActionList;
    acBack: TAction;
    acFilterAll: TAction;
    acFilterMaterial: TAction;
    MPFilters: TioModelPresenter;
    acApplyFilters: TAction;
    acFilterProcess: TAction;
    acFilterProduct: TAction;
    procedure acFilterAllExecute(Sender: TObject);
    procedure acFilterMaterialExecute(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure acFilterProcessExecute(Sender: TObject);
    procedure acFilterProductExecute(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure acApplyFiltersExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  iORM, iORM.Where.Interfaces;

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
