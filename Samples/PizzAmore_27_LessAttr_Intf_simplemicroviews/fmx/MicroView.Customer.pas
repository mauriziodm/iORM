unit MicroView.Customer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, System.Actions, FMX.ActnList,
  iORM.StdActions.Fmx, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource,
  iORM.MVVM.ViewModelBridge, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.Objects,
  iORM.Where.Interfaces, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Detail, Model.Interfaces;

type

  TMicroViewCustomer = class(TFrame)
    EditCustName: TEdit;
    Label3: TLabel;
    EditCustAddress: TEdit;
    ActionListCustMView: TActionList;
    BindingsListCustMView: TBindingsList;
    RectanglebackgroundRowMView: TRectangle;
    ButtonSelectCustomer: TSpeedButton;
    ButtonShowCustomer: TSpeedButton;
    BSCustomer: TioPrototypeBindSourceDetail;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    acShowCustomer: TAction;
    acSelectCustomer: TAction;
    procedure acShowCustomerExecute(Sender: TObject);
    procedure acSelectCustomerExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TMicroViewCustomer.acSelectCustomerExecute(Sender: TObject);
begin
  io.ShowAsSelector<IGenericCustomer>(BSCustomer, nil);
end;

procedure TMicroViewCustomer.acShowCustomerExecute(Sender: TObject);
begin
  BSCustomer.ShowCurrent(nil);
end;

end.
