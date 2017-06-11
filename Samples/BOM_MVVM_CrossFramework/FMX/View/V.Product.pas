unit V.Product;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Process, Fmx.Bind.GenData, Data.Bind.GenData, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, iORM.MVVM.Components.ViewModelBridge,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, FMX.Edit,
  FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects,
  V.Interfaces, iORM.Attributes, iORM.MVVM.Components.ViewContextProvider;

type

  [diImplements(IArticleView, 'TProduct')]
  TProductView = class(TProcessView)
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    EditMaterialCost: TEdit;
    EditProcessCost: TEdit;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    BOMVCProvider: TioViewContextProvider;
    procedure BOMVCProviderioOnRequest(const Sender: TObject;
      const AView: TComponent; out ResultViewContext: TComponent);
    procedure ListBoxGroupHeader1Click(Sender: TObject);
    procedure BOMVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TProductView.BOMVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  inherited;
  Sleep(100);
end;

procedure TProductView.BOMVCProviderioOnRequest(const Sender: TObject;
  const AView: TComponent; out ResultViewContext: TComponent);
begin
  inherited;
  ResultViewContext := TListBoxItem.Create(ListBox1);
  (ResultViewContext as TListBoxItem).Height := 96;
  ListBox1.AddObject(ResultViewContext as TListBoxItem);
end;

procedure TProductView.ListBoxGroupHeader1Click(Sender: TObject);
begin
  inherited;
  VMBridge.Command['acPopulateItemList'].Execute;
end;

end.
