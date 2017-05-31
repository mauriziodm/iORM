unit V.OrderList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Base, iORM.MVVM.Components.ViewModelBridge, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, Data.Bind.GenData,
  iORM.Attributes, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt;

type

  [diRegister]
  TOrderListView = class(TBaseView)
    ListView1: TListView;
    MBSOrderList: TioModelBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TOrderListView.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  VMBridge.Command['acEditOrder'].Execute;
end;

end.
