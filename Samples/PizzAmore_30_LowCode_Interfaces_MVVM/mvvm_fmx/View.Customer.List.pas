unit View.Customer.List;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, View.BaseForList, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, FMX.ListView, FMX.Controls.Presentation, FMX.Objects,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.Interfaces,
  iORM.Where.Interfaces, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Master, FMX.Edit;

type

  [diViewFor(ICustomer)]
  TViewCustomerList = class(TViewBaseForList)
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ButtonPrevPage: TSpeedButton;
    ButtonNextPage: TSpeedButton;
    LabelPageOf: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    acNextPage: TioViewAction;
    acPrevPage: TioViewAction;
    Label1: TLabel;
    EditWhereID: TEdit;
    Label3: TLabel;
    EditWhereName: TEdit;
    Label2: TLabel;
    EditWhereCity: TEdit;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField1: TLinkControlToField;
  private
  public
  end;

implementation

{$R *.fmx}

end.
