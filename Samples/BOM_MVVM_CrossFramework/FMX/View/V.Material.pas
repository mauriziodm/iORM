unit V.Material;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox, FMX.Edit,
  iORM.MVVM.Components.ViewModelBridge, Data.Bind.Components, Model.Material,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, Fmx.Bind.GenData,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, iORM.Attributes;

type

  [diViewFor(TMaterial)]
  TMaterialView = class(TFrame)

    [ioBindAction('acBack')]
    ButtonBack: TSpeedButton;

    [ioBindAction('acPost')]
    ButtonPost: TSpeedButton;

    RectangleTop: TRectangle;
    LabelTitle: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    EditCode: TEdit;
    EditDescription: TEdit;
    EditUM: TEdit;
    EditCost: TEdit;
    VMBridge: TioViewModelBridge;
    MBSArticle: TioModelBindSource;
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
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.fmx}

{ TMaterialView }

constructor TMaterialView.Create(Owner: TComponent);
begin
  inherited;

end;

destructor TMaterialView.Destroy;
begin

  inherited;
end;

end.
