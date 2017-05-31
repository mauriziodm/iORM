unit V.Customer.Micro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, iORM.MVVM.Components.ViewModelBridge,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, iORM.Attributes;

type

  [diRegister]
  TCustomerMicroView = class(TFrame)
    VMBCustomerMicro: TioViewModelBridge;
    MBSCustomer: TioModelBindSource;
    EditID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditFirstName: TEdit;
    Label3: TLabel;
    EditLastName: TEdit;
    BindingsList1: TBindingsList;
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
