unit V.Person;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.GenData,
  Vcl.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, iORM.MVVM.Components.ViewModelBridge,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Data.Bind.Controls,
  Vcl.Bind.Navigator, Vcl.Grids, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid,
  M.Model, M.AnotherModel, Data.Bind.Grid, iORM.Attributes;

type

  [diViewFor(TPerson), diViewFor(TAnotherPerson)]
  TViewPerson = class(TFrame)

    [ioBindAction('acClose')]
    ButtonBack: TSpeedButton;

    [ioBindAction('acPost')]
    ButtonPost: TSpeedButton;

    VMBridge: TioViewModelBridge;
    PersonModelBindSource: TioModelBindSource;
    PhonesModelBindSource: TioModelBindSource;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    EditClassName: TLabeledEdit;
    Panel3: TPanel;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    BindNavigator1: TBindNavigator;
    Panel4: TPanel;
    EditID: TLabeledEdit;
    EditFirstName: TLabeledEdit;
    EditLastName: TLabeledEdit;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkGridToDataSourcePhonesModelBindSource: TLinkGridToDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
