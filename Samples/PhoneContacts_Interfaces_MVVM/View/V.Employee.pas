unit V.Employee;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Data.Bind.Controls, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, System.Actions, FMX.ActnList,
  Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.Layouts, Fmx.Bind.Navigator,
  FMX.ListView, FMX.Edit, FMX.Controls.Presentation, V.Person, iORM.Attributes,
  V.Interfaces;

type
  [diImplements(IPersonView, 'TEmployee')]
  TViewEmployee = class(TViewPerson)
    EditBranchOffice: TEdit;
    Label7: TLabel;
    LinkControlToField7: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
