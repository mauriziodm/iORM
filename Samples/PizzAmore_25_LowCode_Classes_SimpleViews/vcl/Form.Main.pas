unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, iORM.CommonTypes,
  System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, iORM.SynchroStrategy.EtmBased, iORM,
  iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef, iORM.Abstraction, iORM.Abstraction.VCL, iORM.Attributes;

type

  TMainForm = class(TForm)
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ImagePizza: TImage;
    LabelTitlePizz: TLabel;
    LabelTitleAmore: TLabel;
    Shape1: TShape;
    ActionList1: TActionList;
    acQuit: TioBSCloseQuery;
    ButtonQuit: TButton;
    acShowCustomers: TioBSShowOrSelect;
    acShowPizzas: TioBSShowOrSelect;
    acShowOrders: TioBSShowOrSelect;
    ButtonIngredients: TButton;
    acShowIngredients: TioBSShowOrSelect;
    ButtonSynchroLogs: TButton;
    acShowSynchroLogs: TioBSShowOrSelect;
    FBConn: TioFirebirdConnectionDef;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    ButtonAuthorization: TButton;
    HttpConn: TioHttpConnectionDef;
    Button1: TButton;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAuthorizationClick(Sender: TObject);
  private
  public
  end;

var
  MainForm: TMainForm;

implementation

uses
  Utils.SampleData, Model.Order, System.Rtti,
  Form.Authorization, Model.Customer;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
  LSessionData: IioSessionData;
begin
  // Set session data
  LSessionData := TioApplication.SessionDataStore.AcquireMainSessionData;
  try
    LSessionData.App := 'Pizz''Amore VCL';
    LSessionData.AppOID := 1;
    LSessionData.License := 'iORM demo';
    LSessionData.LicenseOID := 1;
    LSessionData.User := 'MaurizioDM';
    LSessionData.UserOID := 1;
  finally
    TioApplication.SessionDataStore.Release;
  end;

  // Set auth methods
  io.SetAuthMethods(
    // anonymous method returning the access-token
    function: String
    begin
      Result := 'This is the access-token or whatever you want!';
    end,
    // anonymous method returning the authorization-decision
    function(AAuthDecisionRequest: IioAuthDecisionRequest): TioAuthDecisionResult
    begin
      Result := AuthorizationForm.Authorize(AAuthDecisionRequest);
    end
  );
end;

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TMainForm.ButtonAuthorizationClick(Sender: TObject);
begin
  AuthorizationForm.Show;
end;

end.
