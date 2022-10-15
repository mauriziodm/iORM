unit View.Order;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, iORM.StdActions.Fmx,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.Layouts,
  Data.Bind.GenData, iORM.LiveBindings.PrototypeBindSource.Detail, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, Data.Bind.Grid, Model.Order, Fmx.Bind.Navigator, iORM.MVVM.Interfaces, iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge;

type

  [diSimpleViewFor(TOrder)]
  TViewOrder = class(TViewBaseForForm)
    LayoutCustomer: TLayout;
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
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    acShowPizzaSelector: TAction;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    procedure acShowPizzaSelectorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{$R *.fmx}

procedure TViewOrder.acShowPizzaSelectorExecute(Sender: TObject);
begin
  inherited;
  io.ShowAsSelector<IPizza>(BSMaster);
end;

end.
