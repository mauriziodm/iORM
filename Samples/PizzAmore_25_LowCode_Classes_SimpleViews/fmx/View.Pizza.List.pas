unit View.Pizza.List;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, Fmx.Bind.Navigator, System.Actions, FMX.ActnList, FMX.ListView,
  FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Model.Pizza, iORM.StdActions.Fmx, FMX.Edit;

type

  // Register the form into the dependency injection container as SimpleView for TPizza objects
  //  (alias "LIST" to avoid an ambiguity with the one registered for a single pizza)
  [diSimpleViewFor(TPizza, 'LIST')]
  TViewPizzaList = class(TViewBaseForList)
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Label1: TLabel;
    EditWhereID: TEdit;
    Label3: TLabel;
    EditWhereName: TEdit;
    Label2: TLabel;
    EditWhereFromPrice: TEdit;
    Label4: TLabel;
    EditWhereToPrice: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
  private
  public
  end;

implementation

{$R *.fmx}

end.
