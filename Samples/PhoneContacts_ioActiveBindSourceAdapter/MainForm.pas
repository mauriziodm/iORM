unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.TabControl,Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator,
  System.Actions, FMX.ActnList, Fmx.Bind.Grid, Data.Bind.Grid, FMX.Grid,
  FMX.Edit, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid.Style;

type
  TForm1 = class(TForm)
    MasterBS: TPrototypeBindSource;
    DetailBS: TPrototypeBindSource;
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
    procedure MasterBSCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure DetailBSCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Model, iORM, iORM.LiveBindings.Interfaces, iORM.LiveBindings.ActiveListBindSourceAdapter;

{$R *.fmx}

procedure TForm1.MasterBSCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  // Get the master active bind source adapter directly from IupOrm
  ABindSourceAdapter := io.Load<TPerson>.ToActiveListBindSourceAdapter(MasterBS);
end;

procedure TForm1.DetailBSCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  // Get the detail bind source adapter (active) directly from PrototypeBindSource (via IupOrm class helper)
  ABindSourceAdapter := (MasterBS.InternalAdapter as IioActiveBindSourceAdapter).NewDetailBindSourceAdapter(DetailBS, 'Phones', nil);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem1;
end;

end.
