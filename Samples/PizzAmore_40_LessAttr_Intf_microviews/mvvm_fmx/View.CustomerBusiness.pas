unit View.CustomerBusiness;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx,
  FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, FMX.Edit, FMX.ListBox, FMX.Layouts, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.Customers;

type

  [diViewFor(TBusinessCustomer)]
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
    ListBoxItemVAT: TListBoxItem;
    EditVAT: TEdit;
    Label6: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    EditBusinessName: TEdit;
    Label2: TLabel;
    LinkControlToField2: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCustomerBusiness: TViewCustomerBusiness;

implementation

{$R *.fmx}

end.
