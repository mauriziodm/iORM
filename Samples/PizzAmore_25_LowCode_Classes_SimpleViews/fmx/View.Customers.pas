unit View.Customers;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, Fmx.Bind.Navigator, System.Actions, FMX.ActnList, FMX.ListView,
  FMX.Controls.Presentation, FMX.Objects, Model.Customer, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, iORM.StdActions.Fmx, FMX.Edit;

type

  [diSimpleViewFor(TCustomer, 'LIST')]
  TViewCustomers = class(TViewBaseForList)
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
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
