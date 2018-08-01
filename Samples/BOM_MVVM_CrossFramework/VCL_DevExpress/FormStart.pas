unit FormStart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  iORM.MVVM.Components.ViewContextProvider, iORM.DB.Components.ConnectionDef,
  Vcl.Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, cxGroupBox, cxRadioGroup, Vcl.ComCtrls, iORM.AbstractionLayer.Framework.VCL, Vcl.StdCtrls;

type
  TStartForm = class(TForm)
    SQLIteConn: TioSQLiteConnectionDef;
    WindowsVCProvider: TioViewContextProvider;
    PanelTools: TPanel;
    ProductDetailLayout: TcxRadioGroup;
    ViewsLayout: TcxRadioGroup;
    PagesVCProviders: TioViewContextProvider;
    ioVCL1: TioVCL;
    procedure SQLIteConnAfterRegister(Sender: TObject);
    procedure WindowsVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure FormCreate(Sender: TObject);
    procedure cxRadioGroupProductsPropertiesChange(Sender: TObject);
    procedure PagesVCProvidersioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure ViewsLayoutPropertiesChange(Sender: TObject);
    procedure WindowsVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure PagesVCProvidersioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
 FormViewContext, iORM, U.SampleData, V.Interfaces, V.ArticleList,
 V.Product.Vertical, V.Product.Horizontal, V.Product,
 VM.Interfaces;

{$R *.dfm}

procedure TStartForm.cxRadioGroupProductsPropertiesChange(Sender: TObject);
begin
  case ProductDetailLayout.ItemIndex of
    0: io.di.RegisterClass<TProductView>.AsViewFor('TProduct').Execute;
    1: io.di.RegisterClass<TProductViewVertical>.AsViewFor('TProduct').Execute;
    2: io.di.RegisterClass<TProductViewHorizontal>.AsViewFor('TProduct').Execute;
  end;
end;

procedure TStartForm.FormCreate(Sender: TObject);
begin
  // Set the default Views layout
  ViewsLayoutPropertiesChange(ViewsLayout);
  // Set the default ProductDetail layout
  cxRadioGroupProductsPropertiesChange(ProductDetailLayout);
  // Get the main view
  io.di.LocateView<IArticleListView>.SetViewContext(Self).Show;
end;

procedure TStartForm.PagesVCProvidersioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.PagesVCProvidersioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
var
  LNewPanel: TPanel;
begin
  inherited;
  LNewPanel := TPanel.Create(nil);
  LNewPanel.Parent := Self;
  LNewPanel.Align := alClient;
  ResultViewContext := LNewPanel;
end;

procedure TStartForm.SQLIteConnAfterRegister(Sender: TObject);
begin
  TSampleData.CheckForSampleData;
end;

procedure TStartForm.ViewsLayoutPropertiesChange(Sender: TObject);
begin
  case ViewsLayout.ItemIndex of
    0: WindowsVCProvider.SetAsDefault;
    1: PagesVCProviders.SetAsDefault;
  end;
end;

procedure TStartForm.WindowsVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.WindowsVCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(Self);
end;

end.
