unit V.Order;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Base, iORM.MVVM.Components.ViewModelBridge, FMX.Controls.Presentation,
  Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, V.Customer.Micro,
  FMX.Edit, iORM.Attributes;

type

  [diRegister]
  TOrderView = class(TBaseView)
    EditDate: TEdit;
    CustomerMicroView1: TCustomerMicroView;
    MBSOrder: TioModelBindSource;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;

    [ioBindAction('acPost')]
    ButtonPost: TSpeedButton;
    LinkPropertyToFieldText: TLinkPropertyToField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
