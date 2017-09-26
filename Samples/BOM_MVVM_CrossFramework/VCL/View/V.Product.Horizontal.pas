unit V.Product.Horizontal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Product, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, Data.DB,
  iORM.MVVM.Components.ViewModelBridge, iORM.DB.Components.DataSet.Base,
  iORM.DB.Components.DataSet.ModelDataSet, cxCurrencyEdit, cxDBEdit, cxLabel,
  cxTextEdit, Vcl.StdCtrls, cxButtons, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  iORM.MVVM.Components.ViewContextProvider;

type

  TProductViewHorizontal = class(TProductView)
    ScrollBox1: TScrollBox;
    BOMVCProvider: TioViewContextProvider;
    procedure BOMVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure BOMVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure BOMVCProviderioOnAfterRequest(const Sender: TObject; const AView,
      AViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

var
  ProductViewHorizontal: TProductViewHorizontal;

implementation

{$R *.dfm}

procedure TProductViewHorizontal.BOMVCProviderioOnAfterRequest(
  const Sender: TObject; const AView, AViewContext: TComponent);
begin
  inherited;
  TControl(AViewContext).Width := TControl(AView).Width;
  TControl(AView).Align := alClient;
  ScrollBox1.HorzScrollBar.Range := ScrollBox1.HorzScrollBar.Range + TControl(AViewContext).Width;
end;

procedure TProductViewHorizontal.BOMVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  inherited;
  AViewContext.Free;
end;

procedure TProductViewHorizontal.BOMVCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
var
  LNewPanel: TPanel;
begin
  inherited;
  LNewPanel := TPanel.Create(nil);
  LNewPanel.Parent := ScrollBox1;
  LNewPanel.Align := alLeft;
  ResultViewContext := LNewPanel;
end;

constructor TProductViewHorizontal.Create(AOwner: TComponent);
begin
  inherited;
  VMBridge.Command['acPopulateItemList'].Execute;
end;

end.
