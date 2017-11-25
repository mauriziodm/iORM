unit V.ArticleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, iORM.Attributes, V.Interfaces, uniGUIBaseClasses,
  uniPanel, uniButton, uniBitBtn, uniSpeedButton, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniBasicGrid, uniDBGrid, uniRadioButton,
  uniEdit, uniLabel, uniDBEdit;

type

  [ioUniBindAction('ButtonNewMaterial', 'acNewMaterial')]
  [ioUniBindAction('ButtonNewProcess', 'acNewProcess')]
  [ioUniBindAction('ButtonNewProduct', 'acNewProduct')]

  [ioUniBindAction('ButtonSearch', 'acApplyFilters')]
  [ioUniBindAction('ButtonRefresh', 'acRefresh')]

  [ioUniBindAction('RadioButtonFilterAll', 'acFilterAll')]
  [ioUniBindAction('RadioButtonFilterMaterials', 'acFilterMaterial')]
  [ioUniBindAction('RadioButtonFilterProcesses', 'acFilterProcess')]
  [ioUniBindAction('RadioButtonFilterProducts', 'acFilterProduct')]

  [diImplements(IArticleListView)]
  TArticleListView = class(TUniFrame, IArticleListView)
    ButtonNewMaterial: TUniButton;
    ButtonNewProcess: TUniButton;
    ButtonNewProduct: TUniButton;
    ButtonSearch: TUniButton;
    ButtonRefresh: TUniButton;
    RadioButtonFilterAll: TUniRadioButton;
    RadioButtonFilterMaterials: TUniRadioButton;
    RadioButtonFilterProcesses: TUniRadioButton;
    RadioButtonFilterProducts: TUniRadioButton;
    PanelTools: TUniPanel;
    PanelFilters: TUniPanel;
    VMBridge: TioViewModelBridge;
    MDSArticleList: TioModelDataSet;
    MDSArticleListID: TIntegerField;
    MDSArticleListCode: TStringField;
    MDSArticleListDescription: TStringField;
    MDSArticleListUM: TStringField;
    MDSArticleListCreationDateTime: TDateTimeField;
    MDSArticleListArticleType: TStringField;
    MDSFilters: TioModelDataSet;
    MDSFiltersCode: TStringField;
    MDSFiltersDescription: TStringField;
    DSArticleList: TDataSource;
    DSFilters: TDataSource;
    UniDBGrid1: TUniDBGrid;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    DBEditFilterCode: TUniDBEdit;
    DBEditFilterDescription: TUniDBEdit;
    procedure UniDBGrid1BodyDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}



{ TArticleListView }

constructor TArticleListView.Create(AOwner: TComponent);
begin
  inherited;
  MDSArticleList.Open;
  MDSFilters.Open;
end;

procedure TArticleListView.UniDBGrid1BodyDblClick(Sender: TObject);
begin
  VMBridge.Command['acEditArticle'].Execute;
end;

end.
