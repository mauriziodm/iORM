unit V.Micro.Process;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Micro.Material, Data.Bind.GenData, Fmx.Bind.GenData, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, iORM.MVVM.Components.ViewModelBridge, Model.BOMItems,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, FMX.Edit,
  FMX.EditBox, FMX.SpinBox, FMX.Controls.Presentation, iORM.Attributes,
  FMX.Objects, FMX.Layouts;

type

  [diViewFor(TBOMItemProcess)]
  TMicroProcessView = class(TMicroMaterialView)
    LabelTime: TLabel;
    Label4: TLabel;
    LinkPropertyToFieldText5: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
