unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.Gestures, FMX.Edit, FMX.ListView.Types, Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.ListView, Fmx.Bind.GenData,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, Data.Bind.Controls, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, FMX.Layouts, Fmx.Bind.Navigator, Fmx.Bind.Grid, iORM.DB.Components.ConnectionDef, iORM.AbstractionLayer.Framework.FMX,
  iORM.DB.Components.BindSourceObjState.StdActions.FMX, FMX.StdActns;

type
  TMainForm = class(TForm)
    GestureManager1: TGestureManager;
    BSMaster: TioPrototypeBindSource;
    BindingsList1: TBindingsList;
    BSDetail: TioPrototypeBindSource;
    TabControl2: TTabControl;
    TabItem5: TTabItem;
    ToolBar1: TToolBar;
    TabItem6: TTabItem;
    ToolBar2: TToolBar;
    MasterListView: TListView;
    Label1: TLabel;
    DetailListView: TListView;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    Button1: TButton;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    Button2: TButton;
    Panel1: TPanel;
    MasterBindNavigator: TBindNavigator;
    EditID: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditFirstname: TEdit;
    Label5: TLabel;
    EditLastname: TEdit;
    Label6: TLabel;
    EditFidelityCardCode: TEdit;
    Label7: TLabel;
    EditVipCard: TEdit;
    Label8: TLabel;
    EditBranchOffice: TEdit;
    Label2: TLabel;
    DetailBindNavigator: TBindNavigator;
    Grid1: TGrid;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    Label9: TLabel;
    EditClassName: TEdit;
    LinkControlToField3: TLinkControlToField;
    LinkGridToDataSourceBSDetail: TLinkGridToDataSource;
    SQLiteConn: TioSQLiteConnectionDef;
    ioFMX1: TioFMX;
    BindExpression1: TBindExpression;
    LinkControlToField4: TLinkControlToField;
    Button3: TButton;
    Button4: TButton;
    ioTestActionFMX1: TioTestActionFMX;
    procedure SQLiteConnAfterRegister(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  SampleData, iORM.AbstractionLayer.Framework;

{$R *.fmx}

procedure TMainForm.Button4Click(Sender: TObject);
begin
  Button3.Action := ioTestActionFMX1;
end;

procedure TMainForm.SQLiteConnAfterRegister(Sender: TObject);
begin
  // Check for sample data creation
  TSampleData.CheckForSampleDataCreation;
end;

end.
