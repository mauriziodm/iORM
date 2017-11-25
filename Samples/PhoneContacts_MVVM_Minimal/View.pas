unit View;

interface

uses FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.GenData, Fmx.Bind.GenData,
  iORM.MVVM.Components.ViewModelBridge, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, FMX.ListView,
  FMX.Layouts, FMX.StdCtrls, System.Classes, FMX.Types, FMX.Controls,
  FMX.Controls.Presentation, FMX.Forms, Interfaces, iORM.Attributes, FMX.Edit,
  Data.Bind.Controls, Fmx.Bind.Navigator;

type

  [diImplements(IPersonsView)]
  TViewMain = class(TFrame, IPersonsView)

    [ioBindAction('acExit')]
    ButtonTerminate: TSpeedButton;

    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    BindingsList1: TBindingsList;
    PersonsModelBindSource: TioModelBindSource;
    PhonesModelBindSource: TioModelBindSource;
    VMBridge: TioViewModelBridge;
    LayoutMaster: TLayout;
    Panel1: TPanel;
    LayoutDetail: TLayout;
    Label3: TLabel;
    DetailListView: TListView;
    Label2: TLabel;
    MasterListView: TListView;
    Panel2: TPanel;
    Label1: TLabel;
    Layout1: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditFirstName: TEdit;
    EditLastName: TEdit;
    Label7: TLabel;
    EditType: TEdit;
    Label8: TLabel;
    EditNumber: TEdit;
    BindNavigator1: TBindNavigator;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    BindNavigator2: TBindNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
