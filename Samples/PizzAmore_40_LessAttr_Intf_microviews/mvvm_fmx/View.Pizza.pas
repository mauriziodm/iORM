unit View.Pizza;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx,
  FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, Fmx.Bind.GenData, FMX.Edit, FMX.ListBox, FMX.Layouts, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.Pizza;

type

  [diViewFor(TPizza)]
  TViewPizza = class(TViewBaseForForm)
    ListBox: TListBox;
    ListBoxItemName: TListBoxItem;
    EditID: TEdit;
    Label1: TLabel;
    EditName: TEdit;
    Label2: TLabel;
    ListBoxItemPrice: TListBoxItem;
    EditUnitPrice: TEdit;
    Label3: TLabel;
    ListBoxItemImage: TListBoxItem;
    Image: TImage;
    Label4: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TViewPizza }

end.
