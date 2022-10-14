unit View.Order;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx,
  FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Navigator, FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.Layouts, Fmx.Bind.Grid, Data.Bind.Grid, Model.Order,
  MicroView.Customer, iORM.MVVM.ViewContextProvider;

type

  [diViewFor(TOrder)]
  TViewOrder = class(TViewBaseForForm)
    MBSRows: TioModelBindSource;
    LayoutOrderData: TLayout;
    EditID: TEdit;
    Label1: TLabel;
    EditDate: TEdit;
    Label2: TLabel;
    EditNote: TEdit;
    Label6: TLabel;
    LayoutGrandTotal: TLayout;
    EditGrandTotal: TEdit;
    Label4: TLabel;
    BindingsList1: TBindingsList;
    LayoutRows: TLayout;
    Label5: TLabel;
    ButtonSelectPizza: TSpeedButton;
    LayoutCustomerData: TLayout;
    MicroViewCustomer1: TMicroViewCustomer;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    VCProviderOrderRows: TioViewContextProvider;
    ScrollBoxOrderRows: TScrollBox;
    acAddPizza: TioViewAction;
    SpeedButton1: TSpeedButton;
    acAddCustomPizza: TioViewAction;
    procedure VCProviderOrderRowsRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderOrderRowsAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TViewOrder.VCProviderOrderRowsAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  inherited;
  (AView as TControl).Align := TAlignLayout.Top;
  (AView as TControl).Name := String.Empty;
end;

procedure TViewOrder.VCProviderOrderRowsRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  inherited;
  ResultViewContext := ScrollBoxOrderRows;
end;

end.
