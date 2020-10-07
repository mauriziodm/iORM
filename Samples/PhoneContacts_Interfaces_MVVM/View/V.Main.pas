unit V.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.GenData, Fmx.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  FMX.ActnList, FMX.TabControl, System.Actions, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.ScrollBox, FMX.Memo, FMX.ListView,
  FMX.Controls.Presentation, iORM.Attributes, M.Interfaces,
  iORM.MVVM.Components.ViewModelBridge, iORM.LiveBindings.ModelBindSource, FMX.Edit, FMX.Memo.Types;

type

  [diViewFor(IPerson)]
  TViewMain = class(TFrame)

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

    [ioBindAction('acRefresh')]
    ButtonRefresh: TSpeedButton;

    [ioBindAction('acTerminate')]
    ButtonTerminate: TSpeedButton;

    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    Panel1: TPanel;
    MasterListView: TListView;
    Label3: TLabel;
    DetailListView: TListView;
    Label1: TLabel;
    Memo1: TMemo;
    ActionList1: TActionList;
    acRefreshMemo: TAction;
    BindingsList1: TBindingsList;
    LinkListControlToField2: TLinkListControlToField;
    PersonsModelBindSource: TioModelBindSource;
    PhonesModelBindSource: TioModelBindSource;
    VMBridge: TioViewModelBridge;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkListControlToField1: TLinkListControlToField;
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
  Memo1.Lines.Text :=  VMBridge.ViewModelAs<IPersonsViewModel>.JSON;
end;

end.
