unit Form.Start;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  System.Actions, FMX.ActnList, iORM.Abstraction.FMX, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider, iORM.StdActions.Fmx, Data.Bind.GenData, Fmx.Bind.GenData, iORM.Where.Interfaces, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master,
  FireDAC.Phys.SQLiteWrapper.Stat, FMX.Edit, iORM.SynchroStrategy.Interfaces, System.Generics.Collections, iORM.SynchroStrategy.Custom,
  iORM.SynchroStrategy.EtmBased;

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
    SynchroAnim: TAniIndicator;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure ImageLogoDblClick(Sender: TObject);
    procedure ioFMX1ShowWait(Sender: TObject);
    procedure ioFMX1HideWait(Sender: TObject);
    procedure SynchroStrategyBeforeSynchronization(const ASender: TObject; var AShowHideGlobalWait: Boolean);
    procedure SynchroStrategyAfterSynchronization(const ASender: TObject; var AShowHideGlobalWait: Boolean);
  private
  public
  end;

var
  StartForm: TStartForm;

implementation

uses
  Utils.SampleData, Wait;

{$R *.fmx}

procedure TStartForm.ImageLogoDblClick(Sender: TObject);
begin
  SynchroStrategy.DoSynchronization(TioSynchroLevel.slIncremental);
end;

procedure TStartForm.ioFMX1HideWait(Sender: TObject);
begin
  TViewWait.HideWait;
end;

procedure TStartForm.ioFMX1ShowWait(Sender: TObject);
begin
  TViewWait.ShowWait(Self);
end;

procedure TStartForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
//  TSampleData.CheckForSampleDataCreation;
end;

procedure TStartForm.SynchroStrategyAfterSynchronization(const ASender: TObject; var AShowHideGlobalWait: Boolean);
begin
  SynchroAnim.Enabled := False;
  AShowHideGlobalWait := False;
end;

procedure TStartForm.SynchroStrategyBeforeSynchronization(const ASender: TObject; var AShowHideGlobalWait: Boolean);
begin
  SynchroAnim.Enabled := True;
  AShowHideGlobalWait := False;
end;

procedure TStartForm.VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TabControlStart.Add;
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
