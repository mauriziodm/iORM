unit V.Main;

interface

uses
  FMX.Forms, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.GenData,
  Fmx.Bind.GenData, FMX.Layouts, iORM.MVVM.Components.ViewModelBridge,
  Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, FMX.ListView, FMX.StdCtrls, System.Classes,
  FMX.Types, FMX.Controls, FMX.Controls.Presentation, V.Interfaces,
  iORM.Attributes;

type

  [diImplements(IMainView)]
  TViewMain = class(TFrame, IMainView)

    [ioBindAction('acEditPerson')]
    ButtonNext: TSpeedButton;

    [ioBindAction('acLoadData')]
    ButtonLoadFromDB: TButton;

    [ioBindAction('acClearData')]
    ButtonClearData: TButton;

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
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    PersonsModelBindSource: TioModelBindSource;
    PhonesModelBindSource: TioModelBindSource;
    VMBridge: TioViewModelBridge;
    LayoutMaster: TLayout;
    LayoutDetail: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
