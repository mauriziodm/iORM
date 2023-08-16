unit View.Customer.List;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, Fmx.Bind.Navigator, System.Actions, FMX.ActnList, FMX.ListView,
  FMX.Controls.Presentation, FMX.Objects, Model.Customer, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, iORM.StdActions.Fmx, FMX.Edit;

type

  // Register the form into the dependency injection container as SimpleView for TCustomer objects
  //  (alias "LIST" to avoid an ambiguity with the one registered for a single customer)
  [diSimpleViewFor(TCustomer, 'LIST')]
  TViewCustomerList = class(TViewBaseForList)
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ButtonPgDown: TSpeedButton;
    ButtonPgUp: TSpeedButton;
    LabelPage: TLabel;
    acNextPage: TioBSNextPage;
    acPrevPage: TioBSPrevPage;
    LinkPropertyToFieldText: TLinkPropertyToField;
    EditWhereID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditWhereCity: TEdit;
    Label3: TLabel;
    EditWhereName: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
  private
  public
  end;

implementation

{$R *.fmx}

end.
