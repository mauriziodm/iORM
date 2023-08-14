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
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ButtonQuit: TButton;
    ActionList1: TActionList;
    acQuit: TioBSCloseQuery;
    HttpConn: TioHttpConnectionDef;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure ButtonCustomersClick(Sender: TObject);
    procedure ButtonPizzasClick(Sender: TObject);
    procedure ButtonOrdersClick(Sender: TObject);
    procedure acQuitConfirmationRequest(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.IOUtils, System.UITypes, Utils.SampleData, Form.Customers, Form.Pizzas, Form.Orders;

{$R *.dfm}

procedure TMainForm.acQuitConfirmationRequest(Sender: TObject; var CanClose: Boolean);
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

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

end.
