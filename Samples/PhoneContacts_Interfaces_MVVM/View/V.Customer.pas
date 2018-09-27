unit V.Customer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Person, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Data.Bind.Controls, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, System.Actions, FMX.ActnList,
  Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.Layouts, Fmx.Bind.Navigator,
  FMX.ListView, FMX.Edit, FMX.Controls.Presentation, iORM.Attributes, M.Model,
  iORM.MVVM.Components.ViewModelBridge, iORM.LiveBindings.ModelBindSource;

type
  [diViewFor(TCustomer)]
  TViewCustomer = class(TViewPerson)
    Label7: TLabel;
    EditFidelityCardCode: TEdit;
    LinkControlToField7: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
