unit View.Customer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx,
  FMX.Controls.Presentation, FMX.Objects, FMX.Edit, FMX.ListBox, FMX.Layouts, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.Customer, iORM.Where.Interfaces, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Master;

type

  [diViewFor(TCustomer)]
  TViewCustomer = class(TViewBaseForForm)
    ListBox: TListBox;
    ListBoxItemName: TListBoxItem;
    EditID: TEdit;
    Label1: TLabel;
    EditName: TEdit;
    Label2: TLabel;
    ListBoxItemPhoneNumber: TListBoxItem;
    EditPhoneNumber: TEdit;
    Label3: TLabel;
    ListBoxItemCity: TListBoxItem;
    EditCity: TEdit;
    Label4: TLabel;
    ListBoxItemAddress: TListBoxItem;
    EditAddress: TEdit;
    Label5: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
  private
  public
  end;

implementation

{$R *.fmx}

end.
