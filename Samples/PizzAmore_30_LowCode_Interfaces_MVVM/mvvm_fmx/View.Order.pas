unit View.Order;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx,
  FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Navigator, FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.Layouts, Fmx.Bind.Grid, Data.Bind.Grid, Model.Order;

type

  [diViewFor(TOrder)]
  TViewOrder = class(TViewBaseForForm)
    BSCustomer: TioModelBindSource;
    BSRows: TioModelBindSource;
    LayoutOrderData: TLayout;
    EditID: TEdit;
    Label1: TLabel;
    EditDate: TEdit;
    Label2: TLabel;
    EditNote: TEdit;
    Label6: TLabel;
    LayoutCustomer: TLayout;
    EditCustName: TEdit;
    Label3: TLabel;
    EditCustAddress: TEdit;
    ButtonSelectCustomer: TSpeedButton;
    LayoutGrandTotal: TLayout;
    EditGrandTotal: TEdit;
    Label4: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LayoutRows: TLayout;
    Label5: TLabel;
    ButtonSelectPizza: TSpeedButton;
    ButtonDeleteRow: TSpeedButton;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceMBSRows: TLinkGridToDataSource;
    acShowCustomerSelector: TioViewAction;
    acShowPizzaSelector: TioViewAction;
    acDeleteRow: TioViewAction;
  private
  public
  end;

implementation

{$R *.fmx}

end.
