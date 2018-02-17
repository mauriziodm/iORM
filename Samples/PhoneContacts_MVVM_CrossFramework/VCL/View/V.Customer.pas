unit V.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Person, Data.Bind.Controls,
  Data.Bind.GenData, Vcl.Bind.GenData, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Vcl.Bind.Grid,
  Data.Bind.Grid, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, iORM.MVVM.Components.ViewModelBridge,
  Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  M.Model, iORM.Attributes;

type

  [diViewFor(TCustomer)]
  TViewCustomer = class(TViewPerson)
    EditFidelityCard: TLabeledEdit;
    LinkControlToField5: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCustomer: TViewCustomer;

implementation

{$R *.dfm}

end.
