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

  // Register the form into the dependency injection container as SimpleView for TOrder objects
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
    acShowCustomerSelector: TioBSShowOrSelect;
    acShowPizzaSelector: TioBSShowOrSelect;
    procedure BSMasterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
  private
  public
  end;

implementation

uses
  Model.Pizza;

{$R *.fmx}

procedure TViewOrder.BSMasterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  inherited;
  BSMaster.CurrentAs<TOrder>.AddPizza(ASelected as TPizza);
  BSMaster.Refresh;
  ADone := True;
end;

end.
