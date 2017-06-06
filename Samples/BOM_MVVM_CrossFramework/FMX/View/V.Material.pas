unit V.Material;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Base, iORM.MVVM.Components.ViewModelBridge, FMX.Controls.Presentation,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource,
  Data.Bind.GenData, Fmx.Bind.GenData, FMX.ListBox, FMX.Layouts, FMX.Edit,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, iORM.Attributes, V.Interfaces, FMX.Objects;

type

  [diImplements(IArticleView, 'TMaterial')]
  TMaterialView = class(TBaseView, IArticleView)

    [ioBindAction('acPost')]
    ButtonPost: TSpeedButton;

    MBSArticle: TioModelBindSource;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    EditCode: TEdit;
    ListBoxItem2: TListBoxItem;
    EditDescription: TEdit;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    EditUM: TEdit;
    EditCost: TEdit;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MaterialView: TMaterialView;

implementation

{$R *.fmx}

end.
