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
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings; var AAbort: Boolean);
    procedure ButtonCustomersClick(Sender: TObject);
    procedure ButtonPizzasClick(Sender: TObject);
    procedure ButtonOrdersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.IOUtils, Utils.SampleData, Form.Customers, Form.Pizzas, Form.Orders, Model.Interfaces,
  Form.ViewContext;

{$R *.dfm}

procedure TMainForm.ButtonCustomersClick(Sender: TObject);
begin
  io.Show<IGenericCustomer>;
end;

procedure TMainForm.ButtonOrdersClick(Sender: TObject);
begin
  io.Show<IOrder>;
end;

procedure TMainForm.ButtonPizzasClick(Sender: TObject);
begin
  io.Show<IPizza>;
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
