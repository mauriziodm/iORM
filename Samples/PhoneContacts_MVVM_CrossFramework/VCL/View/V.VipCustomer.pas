unit V.VipCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Customer, Data.Bind.Controls,
  Data.Bind.GenData, Vcl.Bind.GenData, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Vcl.Bind.Grid,
  Data.Bind.Grid, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, iORM.MVVM.Components.ViewModelBridge,
  Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  iORM.Attributes, V.Interfaces;

type

  [diImplements(IPersonView, 'TVipCustomer')]
  TViewVipCustomer = class(TViewCustomer)
    EditVipCardCode: TLabeledEdit;
    LinkControlToField6: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewVipCustomer: TViewVipCustomer;

implementation

{$R *.dfm}

end.
