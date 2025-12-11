unit Form.Start;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  System.Actions, FMX.ActnList, iORM.Abstraction.FMX, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider, iORM.StdActions.Fmx, Data.Bind.GenData, Fmx.Bind.GenData, iORM.Where.Interfaces, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master,
  FireDAC.Phys.SQLiteWrapper.Stat, FMX.Edit, iORM.SynchroStrategy.Interfaces, System.Generics.Collections, iORM.SynchroStrategy.Custom,
  iORM.SynchroStrategy.EtmBased, iORM.Abstraction, iORM;

type

  TStartForm = class(TForm)
    TabControlStart: TTabControl;
    TabItemStart: TTabItem;
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonQuit: TSpeedButton;
    ButtonGoToOrderList: TButton;
    ButtonGoToPizzaList: TButton;
    ButtonGoToCustomerList: TButton;
    LayoutMain: TLayout;
    Layout1: TLayout;
    Label2: TLabel;
    Z: TLabel;
    ImageLogo: TImage;
    ActionList1: TActionList;
    ioFMX1: TioFMX;
    SQLiteConn: TioSQLiteConnectionDef;
    VCProvider: TioViewContextProvider;
    acQuit: TioBSCloseQuery;
    acShowCustomers: TioBSShowOrSelect;
    acShowPizzas: TioBSShowOrSelect;
    acShowOrders: TioBSShowOrSelect;
    ServerConn: TioSQLiteConnectionDef;
    SynchroStrategy: TioEtmSynchroStrategy_Client;
    HttpConn: TioHttpConnectionDef;
    ButtonDoSynchronization: TButton;
    acDoSynchronization: TioDoSynchronization;
    procedure VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure FormCreate(Sender: TObject);
    procedure SQLiteConnAfterDBBuild(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderStatus; const AScript, AWarnings: TStrings);
  private
  public
  end;

var
  StartForm: TStartForm;

implementation

uses
  Utils.SampleData;

{$R *.fmx}

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
      Result.Authorized := True;
    end
  );
end;

procedure TStartForm.VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TabControlStart.Add;
end;

procedure TStartForm.SQLiteConnAfterDBBuild(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderStatus; const AScript, AWarnings: TStrings);
begin
//  TSampleData.CheckForSampleDataCreation;
end;

procedure TStartForm.VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := TAlignLayout.Client;
  TabControlStart.SetActiveTabWithTransitionAsync(AViewContext as TTabItem, TTabTransition.Slide, TTabTransitionDirection.Normal, nil);
end;

procedure TStartForm.VCProviderRelease(const Sender: TObject; const AView, AViewContext: TComponent);
var
  LTabItemToDestroy: TTabItem;
  LTabItemToReactivate: TTabItem;
begin
  LTabItemToDestroy := (AViewContext as TTabItem);
  LTabItemToReactivate := TabControlStart.Tabs[LTabItemToDestroy.Index-1];
  TabControlStart.SetActiveTabWithTransitionAsync(LTabItemToReactivate, TTabTransition.Slide, TTabTransitionDirection.Reversed,
    procedure
    begin
      LTabItemToDestroy.DisposeOf;
    end
  );
end;

end.
