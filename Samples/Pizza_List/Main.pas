unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Graphics, FMX.TabControl, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Objects, FMX.Edit, System.Actions, FMX.ActnList,
  FMX.ListView.Types, FMX.ListView, FMX.ListView.Appearances, System.Generics.Collections, Model,
  FMX.ListView.Adapters.Base, FMX.Controls.Presentation, iORM.AbstractionLayer.Framework.FMX;
type

  TPizzaList = TObjectList<TPizza>;

  TMainForml = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    MasterToolbar: TToolBar;
    MasterLabel: TLabel;
    DetailToolbar: TToolBar;
    DetailLabel: TLabel;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    lblName: TLabel;
    imgContact: TImage;
    BackButton: TSpeedButton;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ListView1: TListView;
    LinkListControlToField2: TLinkListControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    acLoad: TAction;
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
    acDelete: TAction;
    acNew: TAction;
    acPersist: TAction;
    btDelete: TButton;
    acIupOrmInit: TAction;
    ioFMX1: TioFMX;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure PrototypeBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure FormDestroy(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acNewExecute(Sender: TObject);
    procedure acPersistExecute(Sender: TObject);
    procedure acLoadExecute(Sender: TObject);
    procedure acIupOrmInitExecute(Sender: TObject);
    procedure acNewUpdate(Sender: TObject);
  private
    { Private declarations }
    FPizzaList: TPizzaList;
    FPizzaListAdapter: TListBindSourceAdapter<TPizza>;
  public
    { Public declarations }
  end;

var
  MainForml: TMainForml;

implementation

uses iORM, iORM.DB.DBCreator.Factory, iORM.CommonTypes, IOUtils;


{$R *.fmx}

procedure TMainForml.acDeleteExecute(Sender: TObject);
begin
  (FPizzaListAdapter.Current as TPizza).ObjStatus := osDeleted;
  ShowMessage('The item is marked for deletion.'#13#13'Click on the "Persist" button.');
end;

procedure TMainForml.acIupOrmInitExecute(Sender: TObject);
begin
  // ============ IupOrm initialization ====================
  // Set connection for SQLite (under the Documents folder better for mobile use)
//  io.Connections.NewSQLiteConnectionDef(TPath.Combine(TPath.GetDocumentsPath, 'Pizza.db')).Apply;
//  io.Connections.NewSQLiteConnectionDef(TPath.GetFullPath('..\..\..\SamplesData\Pizza.db')).Apply;
  // Set connection for Firebird SQL
  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\SamplesData\Pizza.FDB'), 'SYSDBA', 'masterkey', '').Apply;
  // AutoCreation and AutoUpdate of the database
  io.AutoCreateDatabase(False);
  // ============ IupOrm initialization ====================
end;

procedure TMainForml.acLoadExecute(Sender: TObject);
begin
  FPizzaListAdapter.First; //Bug
  if Assigned(FPizzaList) then FPizzaList.Free;

  // IupOrm call
  FPizzaList := io.Load<TPizza>.ToGenericList.OfType<TPizzaList>;

  FPizzaListAdapter.SetList(FPizzaList, False);
  FPizzaListAdapter.Active := True;
end;

procedure TMainForml.acNewExecute(Sender: TObject);
var
  NewPizza: TPizza;
begin
  NewPizza := TPizza.Create;
  FPizzaListAdapter.List.Add(NewPizza);
  FPizzaListAdapter.Refresh;
//  ChangeTabAction1.Tab := TabItem2;
//  ChangeTabAction1.ExecuteTarget(Self);
end;

procedure TMainForml.acNewUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FPizzaListAdapter.Active;
end;

procedure TMainForml.acPersistExecute(Sender: TObject);
begin
  io.PersistCollection(FPizzaList);
  ShowMessage('Persisted!');
end;

procedure TMainForml.Button6Click(Sender: TObject);
begin
  if not OpenDialog1.Execute
    then Exit;
  if FPizzaListAdapter.State = seBrowse
    then FPizzaListAdapter.Edit;
  (FPizzaListAdapter.Current as TPizza).Img.LoadFromFile(OpenDialog1.FileName);
//  imgContact.Bitmap.LoadFromFile(OpenDialog1.FileName);
end;

procedure TMainForml.FormCreate(Sender: TObject);
begin
  // IupOrm init
  acIupOrmInit.Execute;
  // Load data
  acLoad.Execute;

  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
{$IFDEF ANDROID}
  { This hides the toolbar back button on Android }
  BackButton.Visible := False;
{$ENDIF}
end;

procedure TMainForml.FormDestroy(Sender: TObject);
begin
  if Assigned(FPizzaList) then FPizzaList.Free;
end;

procedure TMainForml.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if TabControl1.ActiveTab = TabItem2 then
    begin
      ChangeTabAction1.Tab := TabItem1;
      ChangeTabAction1.ExecuteTarget(Self);
      Key := 0;
    end;
  end;
end;

procedure TMainForml.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
{ This triggers the slide animation }
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(Self);
  ChangeTabAction1.Tab := TabItem1;
end;

procedure TMainForml.btOkClick(Sender: TObject);
begin
  PrototypeBindSource1.Post;
  (FPizzaListAdapter.Current as TPizza).ObjStatus := osDirty;
  ChangeTabAction2.ExecuteTarget(ChangeTabAction2.Target);
end;

procedure TMainForml.PrototypeBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  FPizzaListAdapter := TListBindSourceAdapter<TPizza>.Create(PrototypeBindSource1);
  ABindSourceAdapter := FPizzaListAdapter;
end;

end.
