unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.Gestures, FMX.Layouts, FMX.ListView.Types,
  Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource, FMX.ListView,
  FMX.ListBox, FMX.Edit, FMX.DateTimeCtrls, iORM.LiveBindings.Interfaces,
  System.Generics.Collections, Model.Travel, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Controls.Presentation, iORM.DB.Components.ConnectionDef, iORM.AbstractionLayer.Framework.FMX;

type
  TMainForm = class(TForm)
    TabControlMain: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    ActionList1: TActionList;
    TabControlTravelCosts: TTabControl;
    TabItemTravelList: TTabItem;
    TabItemCostTypeList: TTabItem;
    ChangeTabActionToCostTypeList: TChangeTabAction;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    lblTitle3: TLabel;
    ToolBar4: TToolBar;
    lblTitle4: TLabel;
    ToolBar5: TToolBar;
    lblTitle5: TLabel;
    ChangeTabActionToTravelList: TChangeTabAction;
    btnBack: TSpeedButton;
    GestureManager1: TGestureManager;
    BindingsList1: TBindingsList;
    TabItemCostList: TTabItem;
    LIstViewCosts: TListView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ChangeTabActionToCostList: TChangeTabAction;
    ListViewCostTypes: TListView;
    ListViewTravels: TListView;
    BSTravels: TioPrototypeBindSource;
    BSCostTypes: TioPrototypeBindSource;
    BSCosts: TioPrototypeBindSource;
    LinkListControlToField3: TLinkListControlToField;
    ToolBarTravelList: TToolBar;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    acTravelAdd: TAction;
    TabItemTravel: TTabItem;
    ToolBar6: TToolBar;
    Label3: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    eTravelDescrizione: TEdit;
    ListBoxGroupHeaderKM: TListBoxGroupHeader;
    ListBoxGroupHeaderDates: TListBoxGroupHeader;
    ListBoxItemDataPartenza: TListBoxItem;
    ListBoxItemDataArrivo: TListBoxItem;
    ListBoxItemKMPartenza: TListBoxItem;
    ListBoxItemKMArrivo: TListBoxItem;
    eTravelKmPartenza: TEdit;
    eTravelKmArrivo: TEdit;
    ChangeTabActionToTravelEdit: TChangeTabAction;
    acTravelPost: TAction;
    acTravelCancel: TAction;
    acTravelEdit: TAction;
    SBTravelBack: TSpeedButton;
    SBTravelEdit: TSpeedButton;
    SBTravelPost: TSpeedButton;
    SBTravelCancel: TSpeedButton;
    LinkListControlToField1: TLinkListControlToField;
    SpeedButton7: TSpeedButton;
    Layout1: TLayout;
    lblTravelTitle: TLabel;
    lblTravelSubTitle: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkListControlToField2: TLinkListControlToField;
    TabItemCost: TTabItem;
    ChangeTabActionToCostEdit: TChangeTabAction;
    BSCostTypesSelection: TioPrototypeBindSource;
    ListViewCostTypeSel: TTabItem;
    ToolBar7: TToolBar;
    SpeedButton3: TSpeedButton;
    Layout2: TLayout;
    Label4: TLabel;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    ListViewCostTypeListSelection: TListView;
    LinkListControlToField4: TLinkListControlToField;
    ChangeTabActionToCostTypeSelection: TChangeTabAction;
    SpeedButton4: TSpeedButton;
    acCostAdd: TAction;
    acCostShow: TAction;
    SpeedButton5: TSpeedButton;
    acCostDelete: TAction;
    eTravelDatePartenza: TEdit;
    eTravelDateArrivo: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    SQLiteConn: TioSQLiteConnectionDef;
    ioFMX1: TioFMX;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure TabControlMainGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure ListViewTravelsItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewCostTypesItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure acTravelAddExecute(Sender: TObject);
    procedure acTravelPostExecute(Sender: TObject);
    procedure acTravelCancelExecute(Sender: TObject);
    procedure acTravelEditExecute(Sender: TObject);
    procedure BSTravelsioOnNotify(Sender: TObject;
      const ANotification: IioBSANotification);
    procedure acCostAddExecute(Sender: TObject);
    procedure acCostShowExecute(Sender: TObject);
    procedure ListViewCostTypeListSelectionItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure LIstViewCostsItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure acCostDeleteExecute(Sender: TObject);
    procedure SQLiteConnAfterRegister(Sender: TObject);
  private
    { Private declarations }
    FTravelList: TObjectList<TTravel>;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  GlobalFactory, iORM, Model.TravelWithCostTypeList,
  iORM.LazyLoad.Generics.ObjectList, iORM.LazyLoad.Interfaces,
  iORM.LiveBindings.ActiveListBindSourceAdapter,
  Model.Factory, Model.BaseConst, Model.CostType, View.CostGeneric,
  Service.DefaultData;

{$R *.fmx}

procedure TMainForm.acCostAddExecute(Sender: TObject);
begin
  BSCosts.Append(TModelFactory.Cost(
                                     (BSTravels.Current as TTravel).ID,
                                     (BSCostTypesSelection.Current as TCostType),
                                     Now
                                   ));
  TGlobalFactory.View.CostView(nil, BSCosts.Current, VMEdit).Parent := TabItemCost;
  ChangeTabActionToCostEdit.ExecuteTarget(TabItemCost);
end;

procedure TMainForm.acCostDeleteExecute(Sender: TObject);
begin
  BSCosts.Delete;
end;

procedure TMainForm.acCostShowExecute(Sender: TObject);
begin
  TGlobalFactory.View.CostView(Self, BSCosts.Current).Parent := TabItemCost;
  ChangeTabActionToCostEdit.ExecuteTarget(TabItemCost);
end;

procedure TMainForm.acTravelAddExecute(Sender: TObject);
begin
  acTravelPost.Visible := True;
  acTravelCancel.Visible := True;
  acTravelEdit.Visible := False;
  ChangeTabActionToTravelList.Visible := False;
  SBTravelBack.Action := ChangeTabActionToTravelList;
  ChangeTabActionToTravelEdit.ExecuteTarget(TabItemTravel);
end;

procedure TMainForm.acTravelCancelExecute(Sender: TObject);
begin
  BSTravels.Cancel;
  acTravelPost.Visible := False;
  acTravelCancel.Visible := False;
  acTravelEdit.Visible := Visible;
  (SBTravelBack.Action as TChangeTabAction).Visible := True;
end;

procedure TMainForm.acTravelEditExecute(Sender: TObject);
begin
  BSTravels.Edit;
  acTravelPost.Visible := True;
  acTravelCancel.Visible := True;
  acTravelEdit.Visible := False;
  ChangeTabActionToCostTypeList.Visible := False;
  SBTravelBack.Action := ChangeTabActionToCostTypeList;
  ChangeTabActionToTravelEdit.ExecuteTarget(TabItemTravel);
end;

procedure TMainForm.acTravelPostExecute(Sender: TObject);
begin
  BSTravels.Post;
  acTravelPost.Visible := False;
  acTravelCancel.Visible := False;
  acTravelEdit.Visible := Visible;
  (SBTravelBack.Action as TChangeTabAction).Visible := True;
end;

procedure TMainForm.BSTravelsioOnNotify(Sender: TObject;
  const ANotification: IioBSANotification);
var
  Obj: TObject;
begin
  // Refresh/Recalc totals
  Obj := (Sender as TioPrototypeBindSource).Current;
  if Obj <> nil then
    (Obj as TTravelWithCostTypeList).RefreshTotals;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControlMain.ActiveTab := TabItem1;
  TabControlTravelCosts.TabPosition := TTabPosition.None;
  TabControlTravelCosts.ActiveTab := TabItemTravelList;
//  LayOut1.AddObject(TGlobalFactory.GetTravelsView(Layout1));
{$IFDEF ANDROID}
  { This hides the toolbar back button on Android }
  btnBack.Visible := False;
{$ENDIF}
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if (TabControlMain.ActiveTab = TabItem1) and (TabControlMain.ActiveTab = TabItemCostTypeList) then
    begin
//      ChangeTabAction2.Tab := TabItem5;
//      ChangeTabAction2.ExecuteTarget(Self);
//      ChangeTabAction2.Tab := TabItem6;
//      Key := 0;             TabControlMain
    end;
  end;
end;

procedure TMainForm.LIstViewCostsItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  acCostShow.Execute;
end;

procedure TMainForm.ListViewCostTypeListSelectionItemClick(
  const Sender: TObject; const AItem: TListViewItem);
begin
  acCostAdd.Execute;
end;

procedure TMainForm.ListViewCostTypesItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabActionToCostList.ExecuteTarget(TabItemCostList);
end;

procedure TMainForm.ListViewTravelsItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabActionToCostTypeList.ExecuteTarget(TabItemCostTypeList);
end;

procedure TMainForm.SQLiteConnAfterRegister(Sender: TObject);
begin
  // Check for default data
  TDefaultData.CheckForDefaultData;
end;

procedure TMainForm.TabControlMainGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

end.
