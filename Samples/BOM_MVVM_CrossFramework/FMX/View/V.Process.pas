unit V.Process;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Material, Data.Bind.GenData, Fmx.Bind.GenData, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, iORM.MVVM.Components.ViewModelBridge,
  FMX.Edit, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, iORM.Attributes,
  V.Interfaces, FMX.Objects;

type

  [diImplements(IArticleView, 'TProcess')]
  TProcessView = class(TMaterialView)
    ListBoxItem5: TListBoxItem;
    EditTime: TEdit;
    LinkControlToField5: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
