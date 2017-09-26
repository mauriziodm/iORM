unit V.Micro.Product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Micro.Process, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, Vcl.Menus, Data.DB, iORM.DB.Components.DataSet.Base,
  iORM.DB.Components.DataSet.ModelDataSet, iORM.MVVM.Components.ViewModelBridge,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit, Vcl.StdCtrls, cxButtons,
  cxLabel, cxDBLabel, Vcl.ExtCtrls, iORM.Attributes, V.Interfaces;

type

  [diImplements(IMicroArticleView, 'TBOMItemProduct')]
  [diViewFor('TBOMItemProduct')]
  TMicroProductView = class(TMicroProcessView)
    Label4: TLabel;
    cxDBLabel6: TcxDBLabel;
    Label5: TLabel;
    cxDBLabel7: TcxDBLabel;
    MDSArticleMaterialCost: TCurrencyField;
    MDSArticleProcessCost: TCurrencyField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MicroProductView: TMicroProductView;

implementation

{$R *.dfm}

end.
