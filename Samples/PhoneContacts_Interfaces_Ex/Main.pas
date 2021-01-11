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
  iORM.DB.Components.ConnectionDef, iORM.AbstractionLayer.Framework.FMX,
  iORM.DBBuilder.Interfaces;

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
    SQLiteConn: TioSQLiteConnectionDef;
    FirebirdConn: TioFirebirdConnectionDef;
    ioSQLMonitor1: TioSQLMonitor;
    RBSQLite: TRadioButton;
    RBFirebird: TRadioButton;
    Button3: TButton;
    Button4: TButton;
    Label10: TLabel;
    EditDateOfBirth: TEdit;
    LinkControlToField5: TLinkControlToField;
    ioFMX1: TioFMX;
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure RBSQLiteChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
      const AScript, AWarnings: TStrings);
    procedure FirebirdConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
      const AScript, AWarnings: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.Generics.Collections, iORM, Interfaces, SampleData;



{$R *.fmx}

procedure TMainForm.Button12Click(Sender: TObject);
begin
  BSDetail.ioWhereStr.Clear;
  BSDetail.ioWhereStr.Add('[.PhoneType] <> ''Mobile''');
  BSDetail.ioOrderBy := '[.PhoneType] desc';
  BSDetail.Refresh(True);
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  BSMaster.Refresh(True);
end;

procedure TMainForm.Button4Click(Sender: TObject);
var
  LPerson: IPerson;
  LList: TList<IInterface>;
begin
  LPerson := io.Create<IPerson>;
//  BSMaster.Append(LPerson);
//  NextTabAction1.Execute;


  LPerson.FirstName := 'XXXXXXXXXX';
  LPerson.LastName := 'OOOOOOOOOO';
  LList := BSMaster.DataObjectAs<TList<IInterface>>;
  LList.Add(LPerson);
  BSMaster.GetActiveBindSourceAdapter.Refresh(False);
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
  BSMaster.ClearDataObject;
end;

procedure TMainForm.Button9Click(Sender: TObject);
var
  AList: TList<IPerson>;
begin
  AList := io.Load<IPerson>.ToList;
  BSMaster.SetDataObject(AList);
end;

procedure TMainForm.FirebirdConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef;
  const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings);
begin
//  TSampleData.CheckForSampleDataCreation(Sender.Name);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  BSMaster.Active := True;
  BSDetail.Active := True;
end;

procedure TMainForm.RBSQLiteChange(Sender: TObject);
begin
  if RBSQLite.IsChecked then
    SQLiteConn.DefaultConnection := True
  else
    FirebirdConn.DefaultConnection := True;
end;

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
  const AScript, AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation(Sender.Name);
end;

end.
