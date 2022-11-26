unit View.BaseForList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Master, Fmx.Bind.Navigator, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master;

type
  TViewBaseForList = class(TFrame)
    Rectangle1: TRectangle;
    ButtonDelete: TSpeedButton;
    ButtonAdd: TSpeedButton;
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonBack: TSpeedButton;
    ButtonSelect: TSpeedButton;
    ListView: TListView;
    ActionList1: TActionList;
    acAdd: TAction;
    acShowOrSelect: TAction;
    acDelete: TioBSPersistenceDelete;
    BSMaster: TioPrototypeBindSourceMaster;
    acBack: TioBSCloseQuery;
    procedure acAddExecute(Sender: TObject);
    procedure acShowOrSelectExecute(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure acShowOrSelectUpdate(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

procedure TViewBaseForList.acAddExecute(Sender: TObject);
begin
  BSMaster.Persistence.Append;
  acShowOrSelect.Execute;
end;

procedure TViewBaseForList.acBackExecute(Sender: TObject);
begin
  Free;
end;

procedure TViewBaseForList.acShowOrSelectExecute(Sender: TObject);
begin
  if Assigned(BSMaster.SelectorFor) then
  begin
    BSMaster.SelectCurrent;
    io.AnonymousTimer(100,
      function: boolean
      begin
        acBack.Execute;
      end
    );
  end
  else
    BSMaster.ShowCurrent;
end;

procedure TViewBaseForList.acShowOrSelectUpdate(Sender: TObject);
begin
  if Assigned(BSMaster.SelectorFor) then
    acShowOrSelect.Caption := 'Select'
  else
    acShowOrSelect.Caption := 'Show';
end;

constructor TViewBaseForList.Create(AOwner: TComponent);
begin
  inherited;
  BSMaster.Open;
end;

procedure TViewBaseForList.ListViewDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.

