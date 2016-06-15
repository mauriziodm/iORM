unit V.Person;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, FMX.Controls.Presentation, FMX.Edit,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, iORM.Attributes, System.Actions, FMX.ActnList,
  Fmx.Bind.GenData, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.Controls, FMX.Layouts,
  Fmx.Bind.Navigator, V.Interfaces;

type
  TViewPerson = class(TFrame, IPersonView)
    BSPerson: TioPrototypeBindSource;
    BindingsList1: TBindingsList;
    ToolBar2: TToolBar;
    lblTitle2: TLabel;

    [ioBindAction('acClose')]
    ButtonBack: TSpeedButton;

    [ioBindAction('acPost')]
    ButtonPost: TSpeedButton;

    ActionList1: TActionList;
    acFree: TAction;
    Panel1: TPanel;
    EditID: TEdit;
    Label1: TLabel;
    EditFirstName: TEdit;
    Label2: TLabel;
    EditLastName: TEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    EditClassName: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    PanelPhones: TPanel;
    BSPhones: TioPrototypeBindSource;
    DetailListView: TListView;
    LinkListControlToField1: TLinkListControlToField;
    Label5: TLabel;
    Label6: TLabel;
    EditPhoneNumber: TEdit;
    EditNumberType: TEdit;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    BindNavigator1: TBindNavigator;
    procedure acFreeExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TViewPerson.acFreeExecute(Sender: TObject);
begin
  Self.Free;
end;

end.
