unit View.Pizzas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, Fmx.Bind.Navigator, System.Actions, FMX.ActnList, FMX.ListView,
  FMX.Controls.Presentation, FMX.Objects, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Model.Pizza, iORM.StdActions.Fmx, FMX.Edit;

type

  [diSimpleViewFor(TPizza, 'LIST')]
  TViewPizzas = class(TViewBaseForList)
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
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
