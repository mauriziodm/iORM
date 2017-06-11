unit V.ArticleList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  iORM.MVVM.Components.ViewModelBridge, iORM.DB.Components.DataSet.Base,
  iORM.DB.Components.DataSet.ModelDataSet, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Buttons, Vcl.Menus, iORM.Attributes, V.Interfaces, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, cxContainer, cxTextEdit, cxDBEdit, cxButtons,
  cxRadioGroup;

type

  [diImplements(IArticleListView)]
  TArticleListView = class(TFrame, IArticleListView)

    [ioBindAction('acClose')]
    ButtonClose: TSpeedButton;

    [ioBindAction('acNewMaterial')]
    ButtonNewMaterial: TcxButton;

    [ioBindAction('acNewProcess')]
    ButtonNewProcess: TcxButton;

    [ioBindAction('acNewProduct')]
    ButtonNewProduct: TcxButton;

    [ioBindAction('acFilterAll')]
    RadioButtonFilterAll: TcxRadioButton;

    [ioBindAction('acFilterMaterial')]
    RadioButtonFilterMaterials: TcxRadioButton;

    [ioBindAction('acFilterProcess')]
    RadioButtonFilterProcesses: TcxRadioButton;

    [ioBindAction('acFilterProduct')]
    RadioButtonFilterProducts: TcxRadioButton;

    [ioBindAction('acApplyFilters')]
    ButtonSearch: TcxButton;

    PanelTools: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    VMBridge: TioViewModelBridge;
    MDSArticleList: TioModelDataSet;
    MDSArticleListID: TIntegerField;
    MDSArticleListCode: TStringField;
    MDSArticleListDescription: TStringField;
    MDSArticleListUM: TStringField;
    MDSArticleListCreationDateTime: TDateTimeField;
    MDSArticleListArticleType: TStringField;
    DSArticleList: TDataSource;
    MDSFilters: TioModelDataSet;
    MDSFiltersCode: TStringField;
    MDSFiltersDescription: TStringField;
    DSFilters: TDataSource;
    MainMenu: TMainMenu;
    Articles1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Material1: TMenuItem;
    Process1: TMenuItem;
    Product1: TMenuItem;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1Code: TcxGridDBColumn;
    cxGrid1DBTableView1Description: TcxGridDBColumn;
    cxGrid1DBTableView1UM: TcxGridDBColumn;
    cxGrid1DBTableView1CreationDateTime: TcxGridDBColumn;
    cxGrid1DBTableView1ArticleType: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    DBEditFilterCode: TcxDBTextEdit;
    DBEditFiilterDescription: TcxDBTextEdit;
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
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

procedure TArticleListView.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  VMBridge.Command['acEditArticle'].Execute;
end;

end.
