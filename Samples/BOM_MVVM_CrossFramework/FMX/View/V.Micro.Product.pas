unit V.Micro.Product;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Micro.Process, Data.Bind.GenData, Fmx.Bind.GenData, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, iORM.MVVM.Components.ViewModelBridge,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, FMX.Edit,
  FMX.EditBox, FMX.SpinBox, FMX.Controls.Presentation, iORM.Attributes,
  V.Interfaces, FMX.Objects, FMX.Layouts;

type

//  [diImplements(IMicroArticleView, 'TBOMItemProduct')]
  [diViewFor('TBOMItemProduct')]
  TMicroProductView = class(TMicroProcessView)
    Label3: TLabel;
    LabelCostMaterial: TLabel;
    Label5: TLabel;
    LabelCostProcess: TLabel;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
