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
  FMX.Controls.Presentation, Data.Bind.Controls, Fmx.Bind.Navigator,
  FMX.StdActns, iORM.DB.Components.ConnectionDef, iORM.AbstractionLayer.Framework.FMX;

type

  TMainForml = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    MasterToolbar: TToolBar;
    DetailToolbar: TToolBar;
    PrototypeBindSource1: TioPrototypeBindSource;
    BindingsList1: TBindingsList;
    lblName: TLabel;
    imgContact: TImage;
    BackButton: TSpeedButton;
    ListView1: TListView;
    LinkListControlToField2: TLinkListControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    lblID: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    edName: TEdit;
    LinkControlToField1: TLinkControlToField;
    btNext: TButton;
    OpenDialog1: TOpenDialog;
    Button6: TButton;
    ActionList1: TActionList;
    btClose: TButton;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    WindowClose1: TWindowClose;
    Button1: TButton;
    LiveBindingsBindNavigateInsert1: TFMXBindNavigateInsert;
    Button2: TButton;
    LiveBindingsBindNavigateDelete1: TFMXBindNavigateDelete;
    LiveBindingsBindNavigatePost1: TFMXBindNavigatePost;
    LiveBindingsBindNavigateDelete2: TFMXBindNavigateDelete;
    BindNavigator1: TBindNavigator;
    acLoadImage: TAction;
    LiveBindingsBindNavigateRefresh1: TFMXBindNavigateRefresh;
    Button3: TButton;
    RESTConn: TioRESTConnectionDef;
    ioFMX1: TioFMX;
    procedure acLoadImageExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForml: TMainForml;

implementation


{$R *.fmx}

procedure TMainForml.acLoadImageExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if PrototypeBindSource1.InternalAdapter.State = seBrowse then PrototypeBindSource1.Edit;
    (PrototypeBindSource1.Current as TPizza).Img.LoadFromFile(OpenDialog1.FileName);
    PrototypeBindSource1.Post;
  end;
end;

end.
