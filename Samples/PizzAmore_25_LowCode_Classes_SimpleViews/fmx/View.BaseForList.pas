unit View.BaseForList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Master, Fmx.Bind.Navigator;

type

  // Base class flr all list views
  TViewBaseForList = class(TFrame)
    RectangleBottom: TRectangle;
    ButtonDelete: TSpeedButton;
    ButtonAdd: TSpeedButton;
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonBack: TSpeedButton;
    ButtonSelect: TSpeedButton;
    ListView: TListView;
    ActionList1: TActionList;
    BSMaster: TioPrototypeBindSourceMaster;
    acDelete: TioBSPersistenceDelete;
    acBack: TioBSCloseQuery;
    acShowOrSelect: TioBSShowOrSelect;
    acSelectCurrent: TioBSSelectCurrent;
    acAdd: TioBSPersistenceAppend;
    RectangleWhere: TRectangle;
    RectangleWhereButtons: TRectangle;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    BSWhere: TioPrototypeBindSourceMaster;
    acBuildWhere: TioBSBuildWhere;
    acClearWhere: TioBSClearWhere;
    procedure ListViewDblClick(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

constructor TViewBaseForList.Create(AOwner: TComponent);
begin
  inherited;
  BSMaster.Open;
  BSWhere.Open;
end;

procedure TViewBaseForList.ListViewDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.

