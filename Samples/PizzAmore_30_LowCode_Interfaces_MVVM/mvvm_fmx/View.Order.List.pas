unit View.Order.List;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, FMX.ListView, FMX.Controls.Presentation, FMX.Objects,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.Interfaces,
  FMX.Edit, FMX.DateTimeCtrls, FMX.ListBox;

type

  [diViewFor(IOrder)]
  TViewOrderList = class(TViewBaseForList)
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ButtonWhereHistory: TSpeedButton;
    Label2: TLabel;
    ComboBoxWhereState: TComboBox;
    Label1: TLabel;
    EditWhereNote: TEdit;
    Line1: TLine;
    Label3: TLabel;
    DateEditWhereFromDate: TDateEdit;
    Label4: TLabel;
    DateEditToDate: TDateEdit;
    acWhereShowHistory: TioViewAction;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

{ TViewOrders }

constructor TViewOrderList.Create(AOwner: TComponent);
begin
  inherited;
  io.Enums.FillStrings<TOrderState>(ComboBoxWhereState.Items);
end;

end.
