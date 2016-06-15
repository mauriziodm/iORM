unit View.CostFuel;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  View.CostGeneric, Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, System.Actions,
  FMX.ActnList, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.Edit, FMX.DateTimeCtrls,
  FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation;

type
  TViewCostFuel = class(TViewCostGeneric)
    GroupDettagli: TListBoxGroupHeader;
    ListBoxItem4: TListBoxItem;
    eKMTraveled: TEdit;
    LinkControlToField4: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCostFuel: TViewCostFuel;

implementation

{$R *.fmx}

end.
