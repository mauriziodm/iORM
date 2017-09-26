unit V.Micro.Material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxDBLabel,
  iORM.MVVM.Components.ViewModelBridge, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit, iORM.Attributes, V.Interfaces;

type

  [diImplements(IMicroArticleView, 'TBOMItemMaterial')]
  [diViewFor('TBOMItemMaterial')]
  TMicroMaterialView = class(TFrame, IMicroArticleView)

    [ioBindAction('acEditArticle')]
    ButtonShow: TcxButton;

    [ioBindAction('acPost')]
    ButtonPost: TcxButton;

    ClientArea: TPanel;
    Panel1: TPanel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel1: TcxDBLabel;
    PanelProcessCost: TPanel;
    PanelMaterialCost: TPanel;
    PanelTime: TPanel;
    PanelCost: TPanel;
    cxDBLabel3: TcxDBLabel;
    Label1: TLabel;
    MicroVMBridge: TioViewModelBridge;
    MDSItem: TioModelDataSet;
    MDSArticle: TioModelDataSet;
    MDSItemQty: TFloatField;
    MDSArticleCode: TStringField;
    MDSArticleDescription: TStringField;
    MDSArticleUM: TStringField;
    MDSArticleCost: TCurrencyField;
    DSItem: TDataSource;
    DSArticle: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBLabel4: TcxDBLabel;
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

implementation

{$R *.dfm}

{ TMicroMaterialView }

constructor TMicroMaterialView.Create(AOwner: TComponent);
begin
  inherited;
  MDSItem.Open;
  MDSArticle.Open;
end;

procedure TMicroMaterialView.Label2Click(Sender: TObject);
begin
  MicroVMBridge.Command['acClose'].Execute;
end;

end.
