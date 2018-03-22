unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Graphics, FMX.TabControl, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Edit, System.Actions, FMX.ActnList,
  FMX.ListView.Types, FMX.ListView, System.Generics.Collections, Model,
  iORM.LiveBindings.PrototypeBindSource, FMX.Objects,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, iORM.DB.Components.ConnectionDef;

type

  TMainForml = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    MasterToolbar: TToolBar;
    MasterLabel: TLabel;
    DetailToolbar: TToolBar;
    DetailLabel: TLabel;
    PrototypeBindSource1: TioPrototypeBindSource;
    BindingsList1: TBindingsList;
    lblName: TLabel;
    imgContact: TImage;
    BackButton: TSpeedButton;
    ListView1: TListView;
    LinkListControlToField2: TLinkListControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    btLoad: TButton;
    lblID: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    btPersist: TButton;
    edName: TEdit;
    LinkControlToField1: TLinkControlToField;
    btOk: TButton;
    btNew: TButton;
    OpenDialog1: TOpenDialog;
    Button6: TButton;
    btDelete: TButton;
    ActionList1: TActionList;
    acRefresh: TAction;
    acPersist: TAction;
    ChangeTabPrior: TChangeTabAction;
    ChangeTabNext: TChangeTabAction;
    acNew: TAction;
    acPost: TAction;
    acDelete: TAction;
    RESTConn: TioRESTConnectionDef;
    procedure FormCreate(Sender: TObject);
    procedure acPersistExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acNewExecute(Sender: TObject);
    procedure acPostExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForml: TMainForml;

implementation

uses iORM, iORM.DB.DBCreator.Factory, iORM.CommonTypes, System.IOUtils;


{$R *.fmx}

procedure TMainForml.acDeleteExecute(Sender: TObject);
begin
  try
    PrototypeBindSource1.Delete;
  finally
    ShowMessage('The property "ObjStatus" of the object now have "osDeleted" value.'#13#13'Click over the "Persist" button to persist changes to the database');
  end;
end;

procedure TMainForml.acNewExecute(Sender: TObject);
begin
  PrototypeBindSource1.Insert;
  ChangeTabNext.ExecuteTarget(Self);
end;

procedure TMainForml.acPersistExecute(Sender: TObject);
begin
  PrototypeBindSource1.PersistAll;
  ShowMessage('Changes persisted to the database');
end;

procedure TMainForml.acPostExecute(Sender: TObject);
begin
  PrototypeBindSource1.Post;
  ShowMessage('The property "ObjStatus" of the object now have "osDirty" value.'#13#13'Click over the "Persist" button to persist changes to the database');
end;

procedure TMainForml.acRefreshExecute(Sender: TObject);
begin
  PrototypeBindSource1.Refresh;
end;

procedure TMainForml.Button6Click(Sender: TObject);
begin
  if not OpenDialog1.Execute
    then Exit;
  if PrototypeBindSource1.InternalAdapter.State = seBrowse
    then PrototypeBindSource1.InternalAdapter.Edit;
  (PrototypeBindSource1.InternalAdapter.Current as TPizza).Img.LoadFromFile(OpenDialog1.FileName);
end;

procedure TMainForml.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
end;

procedure TMainForml.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  ChangeTabNext.ExecuteTarget(Self);
end;

end.
