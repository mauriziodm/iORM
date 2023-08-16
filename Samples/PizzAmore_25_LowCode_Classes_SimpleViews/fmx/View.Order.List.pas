unit View.Order.List;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, Fmx.Bind.Navigator, System.Actions, FMX.ActnList, FMX.ListView,
  FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Model.Order, iORM.StdActions.Fmx, FMX.Edit, FMX.ListBox, FMX.DateTimeCtrls;

type

  // Register the form into the dependency injection container as SimpleView for TOrder objects
  //  (alias "LIST" to avoid an ambiguity with the one registered for a single order)
  [diSimpleViewFor(TOrder, 'LIST')]
  TViewOrderList = class(TViewBaseForList)
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Label1: TLabel;
    EditWhereNote: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    ComboBoxWhereState: TComboBox;
    DateEditWhereFromDate: TDateEdit;
    Label4: TLabel;
    DateEditToDate: TDateEdit;
    Line1: TLine;
    LinkControlToField1: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    ButtonWhereHistory: TSpeedButton;
    acWhereShowHistory: TioBSShowOrSelect;
    acWherePersist: TioBSPersistencePersist;
    procedure BSWhereAfterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

{ TViewOrders }

procedure TViewOrderList.BSWhereAfterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  BSWhere.BuildWhere;
end;

constructor TViewOrderList.Create(AOwner: TComponent);
begin
  inherited;
  io.Enums.FillStrings<TOrderState>(ComboBoxWhereState.Items);
end;

end.
