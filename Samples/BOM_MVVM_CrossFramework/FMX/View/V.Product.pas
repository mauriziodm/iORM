unit V.Product;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Process, Fmx.Bind.GenData, Data.Bind.GenData, Data.Bind.EngExt, Model.Product,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, iORM.MVVM.Components.ViewModelBridge, Model.BOMItems,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, FMX.Edit,
  FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects,
  iORM.Attributes, iORM.MVVM.Components.ViewContextProvider;

type

  [diViewFor(TProduct)]
  TProductView = class(TProcessView)
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    EditMaterialCost: TEdit;
    EditProcessCost: TEdit;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    BOMVCProvider: TioViewContextProvider;
    procedure BOMVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure BOMVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

procedure TProductView.BOMVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  inherited;
  AViewContext.Free;
end;

procedure TProductView.BOMVCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  inherited;
  ResultViewContext := TListBoxItem.Create(ListBox1);
  (ResultViewContext as TListBoxItem).Height := 96;
  ListBox1.AddObject(ResultViewContext as TListBoxItem);
end;

constructor TProductView.Create(AOwner: TComponent);
begin
  inherited;
  VMBridge.Command['acPopulateItemList'].Execute;
end;

end.
