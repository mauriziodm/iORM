unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.Abstraction.VCL, Vcl.ActnList, iORM.StdActions.Vcl, System.Actions;

type

  TMainForm = class(TForm)
    ImagePizza: TImage;
    LabelTitlePizz: TLabel;
    LabelTitleAmore: TLabel;
    Shape1: TShape;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ButtonQuit: TButton;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure ButtonQuitClick(Sender: TObject);
    procedure ButtonOrdersClick(Sender: TObject);
    procedure ButtonCustomersClick(Sender: TObject);
    procedure ButtonPizzasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  Utils.SampleData, Model.Customer, Model.Order, Model.Pizza;

{$R *.dfm}

procedure TMainForm.ButtonCustomersClick(Sender: TObject);
begin
  io.Show<TCustomer>(nil, 'LIST');
end;

procedure TMainForm.ButtonOrdersClick(Sender: TObject);
begin
  io.Show<TOrder>(nil, 'LIST');
end;

procedure TMainForm.ButtonPizzasClick(Sender: TObject);
begin
  io.Show<TPizza>(nil, 'LIST');
end;

procedure TMainForm.ButtonQuitClick(Sender: TObject);
begin
  io.TerminateApplication;
end;

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

end.
