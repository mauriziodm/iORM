unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.Gestures, FMX.Edit, FMX.ListView.Types, Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.ListView, Fmx.Bind.GenData,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, System.Classes, Data.Bind.Controls, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.Layouts, Fmx.Bind.Navigator, Fmx.Bind.Grid,
  iORM.DB.Components.ConnectionDef;

type
  TMainForm = class(TForm)
    GestureManager1: TGestureManager;
    BSMaster: TioPrototypeBindSource;
    BindingsList1: TBindingsList;
    BSDetail: TioPrototypeBindSource;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    TabControl2: TTabControl;
    TabItem5: TTabItem;
    ToolBar1: TToolBar;
    Button8: TButton;
    Button9: TButton;
    Button12: TButton;
    Button1: TButton;
    TabItem6: TTabItem;
    ToolBar2: TToolBar;
    Button2: TButton;
    MasterListView: TListView;
    Label1: TLabel;
    DetailListView: TListView;
    LinkListControlToField3: TLinkListControlToField;
    LinkListControlToField4: TLinkListControlToField;
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
    Label9: TLabel;
    EditClassName: TEdit;
    Label2: TLabel;
    DetailBindNavigator: TBindNavigator;
    Grid1: TGrid;
    LinkGridToDataSourceBSDetail: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    RESTConn: TioRESTConnectionDef;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.Generics.Collections, iORM, Interfaces;



{$R *.fmx}

procedure TMainForm.Button12Click(Sender: TObject);
begin
  // Master filter
  BSMaster.ioWhereStr.Clear;
  BSMaster.ioWhereStr.Add('[.ID] < 5');
  // Detail filter
  BSDetail.ioWhereStr.Clear;
  BSDetail.ioWhereStr.Add('[.PhoneType] <> ''Mobile''');
  BSDetail.ioOrderBy := '[.PhoneType] desc';
  // Refresh
  BSMaster.Refresh(True);
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  BSMaster.Refresh(True);
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
  BSMaster.ClearDataObject;
end;

procedure TMainForm.Button9Click(Sender: TObject);
var
  AList: TList<IPerson>;
begin
  AList := io.Load<IPerson>.ToGenericList.OfType<TList<IPerson>>;
  BSMaster.SetDataObject(AList);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  BSMaster.Active := True;
  BSDetail.Active := True;
end;

end.
