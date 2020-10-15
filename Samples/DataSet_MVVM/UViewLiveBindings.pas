unit UViewLiveBindings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM.Attributes, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource,
  iORM.MVVM.Components.ViewModelBridge, Vcl.Grids, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Grid, Data.Bind.GenData, Data.Bind.Controls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Bind.GenData, Vcl.Imaging.pngimage;

type

  [diRegister]
  TLiveBindingsView = class(TForm)
    ioViewModelBridge1: TioViewModelBridge;
    MasterModelBindSource: TioModelBindSource;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceMasterModelBindSource: TLinkGridToDataSource;
    BindNavigator1: TBindNavigator;
    ScrollBox1: TScrollBox;
    EditDescrizione: TEdit;
    LinkControlToField2: TLinkControlToField;
    Label1: TLabel;
    StringGrid2: TStringGrid;
    BindNavigator2: TBindNavigator;
    Label2: TLabel;
    DetailModelBindSource: TioModelBindSource;
    LinkGridToDataSourceDetailModelBindSource: TLinkGridToDataSource;
    EditID: TEdit;
    LinkControlToField1: TLinkControlToField;
    Image1: TImage;
    LinkControlToField3: TLinkControlToField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TLiveBindingsView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
