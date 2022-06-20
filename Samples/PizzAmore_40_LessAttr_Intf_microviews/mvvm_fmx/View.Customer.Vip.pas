unit View.Customer.Vip;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.Customer, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, FMX.Edit, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Objects, Model.Customer;

type

  [diViewFor(TVipCustomer)]
  TViewVipCustomer = class(TViewCustomer)
    ListBoxItemVipCardCode: TListBoxItem;
    EditVipCardCode: TEdit;
    Label6: TLabel;
    LinkControlToField6: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
