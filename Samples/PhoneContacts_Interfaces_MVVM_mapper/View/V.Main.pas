unit V.Main;

interface

uses
  FMX.Forms, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Data.Bind.GenData, Fmx.Bind.GenData,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.ActnList, FMX.TabControl,
  System.Classes, System.Actions, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls,
  FMX.ListView, FMX.Controls.Presentation, FMX.Controls, FMX.Types,
  iORM.Attributes;

type
  TViewMain = class(TForm)
    ActionList1: TActionList;
    BSMaster: TioPrototypeBindSource;
    BindingsList1: TBindingsList;
    BSDetail: TioPrototypeBindSource;
    TabControl1: TTabControl;
    TabItemPersons: TTabItem;
    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    DetailListView: TListView;
    MasterListView: TListView;
    Panel1: TPanel;
    Memo1: TMemo;
    TabItemPerson: TTabItem;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    acNext: TNextTabAction;
    acBack: TPreviousTabAction;
    acRefreshMemo: TAction;

    [ioBindAction('acEditPerson')]
    ButtonNext: TSpeedButton;

    [ioBindAction('acLoadData')]
    ButtonLoadFromDB: TButton;

    [ioBindAction('acClearData')]
    ButtonClearData: TButton;

    [ioBindAction('acClearJSON')]
    ButtonClearMemo: TButton;

    [ioBindAction('acSerializeToJSON')]
    ButtonSerializeToMemo: TButton;

    [ioBindAction('acDeserializeFromJSON')]
    ButtonDeserializeFromMemo: TButton;

    [ioBindAction('acSaveJSONtoFile')]
    ButtonSaveJSONToFile: TButton;

    [ioBindAction('acLoadJSONfromFile')]
    ButtonLoadJSONFromFile: TButton;

    [ioBindAction('acTerminate')]
    ButtonTerminate: TSpeedButton;

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure acRefreshMemoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewMain: TViewMain;

implementation

uses
  FMX.Styles, System.Types, VM.Interfaces;

{$R *.fmx}

procedure TViewMain.acRefreshMemoExecute(Sender: TObject);
begin
  Memo1.Lines.Text := BSMaster.ioViewModelAs<IPersonsViewModel>.JSON;
end;

procedure TViewMain.FormCreate(Sender: TObject);
var
  Style : TFMXObject;
begin
  Style := TStyleStreaming.LoadFromResource(hinstance, 'DiamondStyle', RT_RCDATA);
  TStyleManager.SetStyle(Style);
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItemPersons;
end;

end.
