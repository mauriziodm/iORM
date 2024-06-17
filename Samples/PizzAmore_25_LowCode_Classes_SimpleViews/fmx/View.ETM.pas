unit View.ETM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, System.Rtti, FMX.Grid.Style, FMX.Grid, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master, Data.Bind.GenData, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid, ETM.Repository, System.Actions, FMX.ActnList, iORM.StdActions.Fmx;

type

  // Register the form into the dependency injection container as SimpleView for TEtmRepository objects
  [diSimpleViewFor(TEtmRepository)]
  TEtmView = class(TFrame)
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonRevert: TSpeedButton;
    ButtonBack: TSpeedButton;
    Rectangle1: TRectangle;
    Label1: TLabel;
    LabelTimeLineFor: TLabel;
    LabelID: TLabel;
    Label3: TLabel;
    LayoutDiff: TLayout;
    Label2: TLabel;
    DiffMemo: TMemo;
    GridETM: TStringGrid;
    BS_ETM: TioPrototypeBindSourceMaster;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBS_ETM: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    ActionList1: TActionList;
    acBack: TioBSCloseQuery;
    acEtmRevertToVersion: TioBS_ETM_RevertToBindSource;
    acRevertToObject: TioBS_ETM_RevertToObject;
    procedure acRevertToObjectAfterRevert(const ASender, ARevertedObj: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TEtmView.acRevertToObjectAfterRevert(const ASender, ARevertedObj: TObject);
begin
  io.Show(ARevertedObj, acBack);
end;

end.
