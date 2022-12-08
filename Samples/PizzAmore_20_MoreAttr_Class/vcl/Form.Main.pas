unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.Abstraction.VCL, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl;

type
  TMainForm = class(TForm)
    ImagePizza: TImage;
    LabelTitlePizz: TLabel;
    LabelTitleAmore: TLabel;
    Shape1: TShape;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    FirebirdConn: TioFirebirdConnectionDef;
    RemoteConn: TioRemoteConnectionDef;
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ButtonQuit: TButton;
    ActionList1: TActionList;
    acQuit: TioBSCloseQuery;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings; var AAbort: Boolean);
    procedure ButtonCustomersClick(Sender: TObject);
    procedure ButtonPizzasClick(Sender: TObject);
    procedure ButtonOrdersClick(Sender: TObject);
    procedure FirebirdConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings; var AAbort: Boolean);
    procedure acQuitCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.IOUtils, Utils.SampleData, Form.Customers, Form.Pizzas, Form.Orders;

{$R *.dfm}

procedure TMainForm.acQuitCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('Close the application?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk;
end;

procedure TMainForm.ButtonCustomersClick(Sender: TObject);
begin
  Application.CreateForm(TCustomersForm, CustomersForm);
  CustomersForm.Show;
end;

procedure TMainForm.ButtonOrdersClick(Sender: TObject);
begin
  Application.CreateForm(TOrdersForm, OrdersForm);
  OrdersForm.Show;
end;

procedure TMainForm.ButtonPizzasClick(Sender: TObject);
begin
  Application.CreateForm(TPizzasForm, PizzasForm);
  PizzasForm.Show;
end;

procedure TMainForm.FirebirdConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings; var AAbort: Boolean);
begin
  AScript.SaveToFile(TPath.Combine(TPath.GetDocumentsPath, 'iORM_Script_Firebird.txt'));
end;

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TMainForm.SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings; var AAbort: Boolean);
begin
  AScript.SaveToFile(TPath.Combine(TPath.GetDocumentsPath, 'iORM_Script_SQLite.txt'));
end;

end.
