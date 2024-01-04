unit View.Customer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, iORM.StdActions.Fmx,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects, Model.Customer, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Edit, FMX.ListBox, FMX.Layouts;

type

  // Register the form into the dependency injection container as SimpleView for TCustomer objects
  [diSimpleViewFor(TCustomer)]
  TCustomerView = class(TViewBaseForForm)
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TCustomerView.Button1Click(Sender: TObject);
var
  LCustomer: TCustomer;
begin
//  BSMaster.Close;
  BSMaster.SourceBS := nil;
  BSMaster.LoadType := ltManual;
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'XXXXXXX';
  BSMaster.SetDataObject(LCustomer);
//  BSMaster.Open;
end;

procedure TCustomerView.Button2Click(Sender: TObject);
begin
//  BSMaster.SetDataObject(nil);
  BSMaster.ClearDataObject;
end;

end.
