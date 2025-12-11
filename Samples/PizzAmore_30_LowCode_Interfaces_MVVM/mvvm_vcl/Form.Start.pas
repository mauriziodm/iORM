unit Form.Start;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, iORM.Abstraction.VCL, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef, iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider, iORM.MVVM.ViewModelBridge, System.Actions,
  Vcl.ActnList, iORM.StdActions.Vcl, Vcl.ExtActns, iORM.Abstraction,
  Form.Authorization;

type
  TStartForm = class(TForm)
    MainPageControl: TPageControl;
    PanelTop: TPanel;
    TabSheetMain: TTabSheet;
    PanelLogo: TPanel;
    LabelTitlePizz: TLabel;
    LabelTitleAmore: TLabel;
    ImagePizza: TImage;
    PanelMenu: TPanel;
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    VCProviderForm: TioViewContextProvider;
    VMBridge: TioViewModelBridge;
    ButtonQuit: TButton;
    ActionList1: TActionList;
    acQuit: TioViewAction;
    acShowOrders: TioViewAction;
    acShowCustomers: TioViewAction;
    acShowPizzas: TioViewAction;
    VCProviderTab: TioViewContextProvider;
    TabPreviousTab1: TPreviousTab;
    TabNextTab1: TNextTab;
    RadioButtonVCForm: TRadioButton;
    RadioButtonVCTab: TRadioButton;
    Label1: TLabel;
    ButtonIngredients: TButton;
    acShowIngredients: TioViewAction;
    ButtonSynchroLogs: TButton;
    acShowSynchroLog: TioViewAction;
    ButtonAuthorization: TButton;
    procedure VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderTabRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderTabRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderTabAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure RadioButtonVCFormClick(Sender: TObject);
    procedure ButtonAuthorizationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SQLiteConnAfterDBBuild(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderStatus; const AScript, AWarnings: TStrings);
  private
  public
  end;

var
  StartForm: TStartForm;

implementation

uses
  Form.ViewContext, Utils.SampleData, System.IOUtils, RegisterClasses,
  Model.Interfaces;

{$R *.dfm}

procedure TStartForm.ButtonAuthorizationClick(Sender: TObject);
begin
  AuthorizationForm.Show;
end;

procedure TStartForm.FormCreate(Sender: TObject);
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

procedure TStartForm.RadioButtonVCFormClick(Sender: TObject);
begin
  if RadioButtonVCTab.Checked then
    VCProviderTab.SetAsDefault
  else
    VCProviderForm.SetAsDefault;
end;

procedure TStartForm.SQLiteConnAfterDBBuild(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderStatus; const AScript, AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TStartForm.VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := alClient;
end;

procedure TStartForm.VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(Self);
end;

procedure TStartForm.VCProviderTabAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := alClient;
  TabNextTab1.Execute;
end;

procedure TStartForm.VCProviderTabRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  TabPreviousTab1.Execute;
  AViewContext.Free;
end;

procedure TStartForm.VCProviderTabRequest(const Sender: TObject; out ResultViewContext: TComponent);
var
  LTabSheet: TTabSheet;
begin
  LTabSheet := TTabSheet.Create(MainPageControl);
  LTabSheet.TabVisible := False;
  LTabSheet.PageControl := MainPageControl;
  ResultViewContext := LTabSheet;
end;

initialization

  TRegisterClasses.RegisterClasses;

end.
