unit View.Order;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, iORM.StdActions.Fmx,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.Layouts,
  Data.Bind.GenData, iORM.LiveBindings.PrototypeBindSource.Detail, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, Data.Bind.Grid, Model.Order, Fmx.Bind.Navigator;

type

  [diSimpleViewFor(TOrder)]
  TViewOrder = class(TViewBaseForForm)
    LayoutCustomer: TLayout;
    EditCustName: TEdit;
    Label3: TLabel;
    EditCustAddress: TEdit;
    ButtonSelectCustomer: TSpeedButton;
    LayoutGrandTotal: TLayout;
    EditGrandTotal: TEdit;
    Label4: TLabel;
    LayoutOrderData: TLayout;
    EditID: TEdit;
    Label1: TLabel;
    EditDate: TEdit;
    Label2: TLabel;
    EditNote: TEdit;
    Label6: TLabel;
    LayoutRows: TLayout;
    Label5: TLabel;
    ButtonSelectPizza: TSpeedButton;
    ButtonDeleteRow: TSpeedButton;
    StringGrid1: TStringGrid;
    BSCustomer: TioPrototypeBindSourceDetail;
    BSRows: TioPrototypeBindSourceDetail;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkGridToDataSourceBSRows: TLinkGridToDataSource;
    acDeleteRow: TFMXBindNavigateDelete;
    scShowCustomerSelector: TAction;
    acShowPizzaSelector: TAction;
    procedure scShowCustomerSelectorExecute(Sender: TObject);
    procedure acShowPizzaSelectorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewOrder: TViewOrder;

implementation

{$R *.fmx}

procedure TViewOrder.acShowPizzaSelectorExecute(Sender: TObject);
begin
  inherited;
//  io.ShowAsSelector<TPizza>(BSMaster, 'LIST');
end;

procedure TViewOrder.scShowCustomerSelectorExecute(Sender: TObject);
begin
  inherited;
  io.ShowAsSelector<TCustomer>(BSCustomer, 'LIST');
end;

end.
