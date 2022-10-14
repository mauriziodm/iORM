unit MicroView.Customer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, System.Actions, FMX.ActnList,
  iORM.StdActions.Fmx, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource,
  iORM.MVVM.ViewModelBridge, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Objects;

type

  TMicroViewCustomer = class(TFrame)
    EditCustName: TEdit;
    Label3: TLabel;
    EditCustAddress: TEdit;
    ActionListCustMView: TActionList;
    acSelectCustomer: TioViewAction;
    VMBridgeCustMView: TioViewModelBridge;
    MBSCustomer: TioModelBindSource;
    BindingsListCustMView: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    RectanglebackgroundRowMView: TRectangle;
    ButtonSelectCustomer: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
