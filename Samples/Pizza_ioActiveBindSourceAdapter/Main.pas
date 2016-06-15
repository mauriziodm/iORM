unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Graphics, FMX.TabControl, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Objects, FMX.Edit, System.Actions, FMX.ActnList,
  FMX.ListView.Types, FMX.ListView, System.Generics.Collections, Model,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation;

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
    btLoad: TButton;
    lblID: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    edName: TEdit;
    LinkControlToField1: TLinkControlToField;
    btPost: TButton;
    btNew: TButton;
    OpenDialog1: TOpenDialog;
    Button6: TButton;
    acDelete: TAction;
    acNew: TAction;
    btDelete: TButton;
    acRefresh: TAction;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure PrototypeBindSource1CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure btPostClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acNewExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForml: TMainForml;

implementation

uses iORM, iORM.DB.DBCreator.Factory, iORM.CommonTypes;


{$R *.fmx}

procedure TMainForml.acDeleteExecute(Sender: TObject);
begin
  PrototypeBindSource1.Delete;
end;

procedure TMainForml.acNewExecute(Sender: TObject);
begin
  PrototypeBindSource1.Append;
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
{$IFDEF ANDROID}
  { This hides the toolbar back button on Android }
  BackButton.Visible := False;
{$ENDIF}
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

procedure TMainForml.btPostClick(Sender: TObject);
begin
  PrototypeBindSource1.Post;
end;

procedure TMainForml.PrototypeBindSource1CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  // Directly get the BindSourceAdapter from IupOrm
  ABindSourceAdapter := io.Load<TPizza>.ToActiveListBindSourceAdapter(PrototypeBindSource1);
end;

end.
