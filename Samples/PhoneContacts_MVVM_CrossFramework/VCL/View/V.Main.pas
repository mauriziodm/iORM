unit V.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Interfaces, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.Menus, iORM.Attributes, iORM.MVVM.Components.ViewModelBridge,
  Vcl.ExtCtrls, Vcl.Buttons, Data.Bind.GenData, Vcl.Bind.GenData,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource,
  Vcl.Grids, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid, Vcl.StdCtrls,
  Data.DB, Vcl.DBGrids, iORM.DB.Components.DataSet.Base,
  iORM.DB.Components.DataSet.ModelDataSet, Vcl.Mask, Vcl.DBCtrls;

type
  [diImplements(IMainView)]
  TViewMain = class(TFrame, IMainView)

    [ioBindAction('acClearData')]
    ButtonClearData: TSpeedButton;

    [ioBindAction('acLoadData')]
    ButtonLoadFromDB: TSpeedButton;

    [ioBindAction('acEditPerson')]
    ButtonEdit: TSpeedButton;

    [ioBindAction('acRefresh')]
    ButtonRefresh: TSpeedButton;

    VMBridge: TioViewModelBridge;
    Panel1: TPanel;
    PersonsModelBindSource: TioModelBindSource;
    PhonesModelBindSource: TioModelBindSource;
    MasterGrid: TStringGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePersonsModelBindSource: TLinkGridToDataSource;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    LinkGridToDataSourcePhonesModelBindSource: TLinkGridToDataSource;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    PersonsModelDataSet: TioModelDataSet;
    PersonsDataSource: TDataSource;
    ButtonOpenDataSet: TSpeedButton;
    DBEdit1: TDBEdit;
    PersonsModelDataSetID: TIntegerField;
    PersonsModelDataSetFirstName: TWideStringField;
    PersonsModelDataSetLastName: TStringField;
    procedure MasterGridDblClick(Sender: TObject);
    procedure ButtonOpenDataSetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TViewMain.ButtonOpenDataSetClick(Sender: TObject);
begin
  PersonsModelDataSet.Active := not PersonsModelDataSet.Active;
end;

procedure TViewMain.MasterGridDblClick(Sender: TObject);
begin
  VMBridge['acEditPerson'].Execute;
end;

end.
