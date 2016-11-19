unit V.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, V.Interfaces,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.GenData, Fmx.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  FMX.ActnList, FMX.TabControl, System.Actions, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.ScrollBox, FMX.Memo, FMX.ListView,
  FMX.Controls.Presentation, iORM.Attributes;

type

  [diImplements(IMainView)]
  TViewMain = class(TFrame, IMainView)

    [ioBindAction('acEditPerson')]
    ButtonNext: TSpeedButton;

    [ioBindAction('acLoadData')]
    ButtonLoadFromDB: TButton;

    [ioBindAction('acClearData')]
    ButtonClearData: TButton;

    [ioBindAction('acSerializeToJSON')]
    ButtonSerializeToMemo: TButton;

    [ioBindAction('acDeserializeFromJSON')]
    ButtonDeserializeFromMemo: TButton;

    [ioBindAction('acClearJSON')]
    ButtonClearMemo: TButton;

    [ioBindAction('acSaveJSONtoFile')]
    ButtonSaveJSONToFile: TButton;

    [ioBindAction('acLoadJSONfromFile')]
    ButtonLoadJSONFromFile: TButton;

    [ioBindAction('acTerminate')]
    ButtonTerminate: TSpeedButton;

    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    MasterListView: TListView;
    Label3: TLabel;
    DetailListView: TListView;
    Label1: TLabel;
    Memo1: TMemo;
    BSMaster: TioPrototypeBindSource;
    BSDetail: TioPrototypeBindSource;
    ActionList1: TActionList;
    acRefreshMemo: TAction;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    procedure acRefreshMemoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  VM.Interfaces;

{$R *.fmx}

procedure TViewMain.acRefreshMemoExecute(Sender: TObject);
begin
  Memo1.Lines.Text := BSMaster.ioViewModelAs<IPersonsViewModel>.JSON;
end;

end.
