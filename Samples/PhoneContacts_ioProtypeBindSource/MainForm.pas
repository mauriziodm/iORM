unit MainForm;

interface

uses FMX.ListView.Types, Data.Bind.Controls, System.Rtti, Data.Bind.GenData,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Bindings.Outputs,
  Fmx.Bind.Editors, Fmx.Bind.Grid, FMX.TabControl, System.Classes,
  System.Actions, FMX.ActnList, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.Grid, Fmx.Bind.Navigator, FMX.ListView,
  FMX.Controls, FMX.Types, FMX.Forms, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid.Style;

type

  TForm1 = class(TForm)
    MasterBS: TioPrototypeBindSource;
    DetailBS: TioPrototypeBindSource;
    BindingsList1: TBindingsList;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ToolBar1: TToolBar;
    MasterListView: TListView;
    Label1: TLabel;
    DetailListView: TListView;
    LinkListControlToField5: TLinkListControlToField;
    LinkListControlToField6: TLinkListControlToField;
    Label2: TLabel;
    ToolBar2: TToolBar;
    DetailBindNavigator: TBindNavigator;
    ActionList1: TActionList;
    Button1: TButton;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    ToolBar3: TToolBar;
    Button2: TButton;
    Grid1: TGrid;
    LinkGridToDataSourceDetailBS: TLinkGridToDataSource;
    Panel1: TPanel;
    MasterBindNavigator: TBindNavigator;
    EditID: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditFirstname: TEdit;
    Label5: TLabel;
    EditLastname: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    Label6: TLabel;
    EditFidelityCardCode: TEdit;
    Label7: TLabel;
    EditVipCard: TEdit;
    Label8: TLabel;
    EditBranchOffice: TEdit;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
