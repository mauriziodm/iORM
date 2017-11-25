unit V.Product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Process, Data.DB, Model.Product,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniGUIClasses, uniEdit, uniDBEdit,
  uniLabel, uniDBText, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniPanel, iORM.Attributes, uniScrollBox, iORM.MVVM.Components.ViewContextProvider;

type

  [ioUniBindAction('ButtonClose', 'acBack')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  [diViewFor(TProduct)]
  TProductView = class(TProcessView)
    UniLabel6: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    MDSArticleMaterialCost: TCurrencyField;
    MDSArticleProcessCost: TCurrencyField;
    UniScrollBox1: TUniScrollBox;
    BOMVCProvider: TioViewContextProvider;
    procedure BOMVCProviderRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure BOMVCProviderAfterRequest(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure BOMVCProviderRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

implementation

uses
  uniGUIFrame, uniGUITypes;

{$R *.dfm}

procedure TProductView.BOMVCProviderAfterRequest(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  inherited;
  TUniPanel(AViewContext).Height := TUniFrame(AView).Height;
  TUniFrame(AView).Align := alClient;
end;

procedure TProductView.BOMVCProviderRelease(const Sender: TObject; const AView,
  AViewContext: TComponent);
begin
  inherited;
  AViewContext.Free;
end;

procedure TProductView.BOMVCProviderRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
var
  LNewPanel: TUniPanel;
begin
  inherited;
  LNewPanel := TUniPanel.Create(Self);
  LNewPanel.Parent := UniScrollBox1;
  LNewPanel.Align := alTop;
  LNewPanel.BorderStyle := ubsNone;
  ResultViewContext := LNewPanel;
end;

constructor TProductView.Create(AOwner: TComponent);
begin
  inherited;
  VMBridge.Command['acPopulateItemList'].Execute;
end;

end.
