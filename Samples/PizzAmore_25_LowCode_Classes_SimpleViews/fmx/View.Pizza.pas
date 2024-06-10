unit View.Pizza;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, iORM.StdActions.Fmx,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects, FMX.Edit, FMX.ListBox, FMX.Layouts, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.Pizza,
  iORM.MVVM.Interfaces, iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  iORM.LiveBindings.PrototypeBindSource.Detail, Fmx.Bind.Grid, Data.Bind.Grid;

type

  // Register the form into the dependency injection container as SimpleView for TPizza objects
  [diSimpleViewFor(TPizza)]
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
    ListBoxItemIngredients: TListBoxItem;
    Label5: TLabel;
    Grid1: TGrid;
    BSIngredients: TioPrototypeBindSourceDetail;
    LinkGridToDataSourceBSIngredients: TLinkGridToDataSource;
  private
  public
  end;

implementation

{$R *.fmx}

end.
