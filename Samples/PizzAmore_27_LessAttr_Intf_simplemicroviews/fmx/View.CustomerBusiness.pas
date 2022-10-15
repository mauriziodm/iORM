unit View.CustomerBusiness;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, iORM.StdActions.Fmx,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Edit, FMX.ListBox, FMX.Layouts, iORM.MVVM.Interfaces, iORM.MVVM.ModelBindSource,
  iORM.MVVM.ViewModelBridge, Model.Customers;

type

  [diSimpleViewFor(TBusinessCustomer)]
  TViewCustomerBusiness = class(TViewBaseForForm)
    ListBox: TListBox;
    ListBoxItemName: TListBoxItem;
    EditID: TEdit;
    Label1: TLabel;
    ListBoxItemPhoneNumber: TListBoxItem;
    EditPhoneNumber: TEdit;
    Label3: TLabel;
    ListBoxItemCity: TListBoxItem;
    EditCity: TEdit;
    Label4: TLabel;
    ListBoxItemAddress: TListBoxItem;
    EditAddress: TEdit;
    Label5: TLabel;
    EditFirstName: TEdit;
    Label2: TLabel;
    ListBoxItemVAT: TListBoxItem;
    EditVAT: TEdit;
    Label6: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
