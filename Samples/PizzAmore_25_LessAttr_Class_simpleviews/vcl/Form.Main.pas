unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.Abstraction.VCL, iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider;

type
  TMainForm = class(TForm)
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ImagePizza: TImage;
    LabelTitlePizz: TLabel;
    LabelTitleAmore: TLabel;
    Shape1: TShape;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    Button1: TButton;
    VCProviderForm: TioViewContextProvider;
    Button2: TButton;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings; var AAbort: Boolean);
    procedure ButtonCustomersClick(Sender: TObject);
    procedure ButtonPizzasClick(Sender: TObject);
    procedure ButtonOrdersClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.IOUtils, Utils.SampleData, Form.Customers, Form.Pizzas, Form.Orders, Model.Customer,
  Form.ViewContext;

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
var
  LView: IInterface;
begin

//  io.Show<IInterface>;
//  io.Show<TCustomer>;

//  LView := io.di.LocateSimpleView<IInterface>.SetViewContext(Self).Get;
//  LView := io.di.LocateSimpleView<IInterface>.Show;

  LView := io.di.LocateSimpleViewFor<TCustomer>('LIST').Show;

end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  LCustomer: TCustomer;
begin
  LCustomer := TCustomer.Create;
  LCustomer.Name := 'Carlo Marona';
  LCustomer.City := 'Rieti';
  io.di.LocateSimpleViewFor(LCustomer).Show;
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

procedure TMainForm.SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings; var AAbort: Boolean);
begin
  AScript.SaveToFile(TPath.Combine(TPath.GetDocumentsPath, 'iORM_Script_SQLite.txt'));
end;

procedure TMainForm.VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  TControl(AView).Align := alClient;
end;

procedure TMainForm.VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TMainForm.VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(Self);
end;

end.
