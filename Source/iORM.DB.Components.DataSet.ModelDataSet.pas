unit iORM.DB.Components.DataSet.ModelDataSet;

interface

uses
  iORM.DB.Components.DataSet.Base, iORM.MVVM.Components.ViewModelBridge, System.Classes,
  iORM.Components.Common.Interfaces, iORM.MVVM.Components.ModelPresenter.Custom;

type

  TioModelDataSet = class(TioBSABaseDataSet, IioVMBridgeClientComponent, IioCrossViewMasterSource)
  private
    FViewModelBridge: TioViewModelBridge;
    FModelPresenter: String;
    FCrossView_MasterBindSource: IioCrossViewMasterSource;
    FCrossView_MasterPropertyName: String;
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetModelPresenterInstance: TioModelPresenterCustom;
    // These methods handle the "Persistence" property which is actually located on the ModelPresenter
    procedure DoBeforeOpen; override;
    procedure DoBeforeScroll; override;
    // dataset virtual methods
    procedure InternalPreOpen; override;
    /// ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge: TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
  published
    property ViewModelBridge: TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
    property ModelPresenter: String read FModelPresenter write FModelPresenter;
    property CrossView_MasterBindSource: IioCrossViewMasterSource read FCrossView_MasterBindSource write FCrossView_MasterBindSource;
    property CrossView_MasterPropertyName: String read FCrossView_MasterPropertyName write FCrossView_MasterPropertyName;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Components.Common,
  Data.Bind.ObjectScope, iORM.LiveBindings.Factory,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.BSPersistence;

{ TioModelDataSet }

constructor TioModelDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FViewModelBridge := nil;
  FCrossView_MasterBindSource := nil;
  FCrossView_MasterPropertyName := '';
  if (csDesigning in ComponentState) and not Assigned(FViewModelBridge) then
    TioComponentsCommon.ViewModelBridgeAutosetting(Self, Owner);
end;

procedure TioModelDataSet.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  GetModelPresenterInstance.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

procedure TioModelDataSet.DoBeforeOpen;
var
  LBSPersistenceClient: IioBSPersistenceClient;
begin
  inherited;
  if Supports(GetModelPresenterInstance, IioBSPersistenceClient, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.Clear(False);
end;

procedure TioModelDataSet.DoBeforeScroll;
var
  LBSPersistenceClient: IioBSPersistenceClient;
begin
  inherited;
  if Supports(GetModelPresenterInstance, IioBSPersistenceClient, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.NotifyBeforeScroll;
end;

function TioModelDataSet.GetModelPresenterInstance: TioModelPresenterCustom;
begin
  Result := ViewModelBridge.Presenter[ModelPresenter];
end;

function TioModelDataSet.GetViewModelBridge: TioViewModelBridge;
begin
  Result := FViewModelBridge;
end;

procedure TioModelDataSet.InternalPreOpen;
begin
  // Checks
  if not Assigned(FViewModelBridge) then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModelBridge not assigned.');
  if not FViewModelBridge.ViewModelIsAssigned then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModel not assigned.');
  if FModelPresenter.IsEmpty then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'Model presenter not specified.');
  // Get the BindSourceAdapter from ViewModel and open it
  // NB: If the 'CrossViewMasterSource' property is assigned the BindSourceAdapter
  // from it (for cross view with microviews)
  if Assigned(FCrossView_MasterBindSource) then
    GetModelPresenterInstance.SetActiveBindSourceAdapter(  TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(Self,
      FCrossView_MasterBindSource.GetActiveBindSourceAdapter, FCrossView_MasterPropertyName, nil)  );
  SetActiveBindSourceAdapter(  GetModelPresenterInstance.GetActiveBindSourceAdapter  );
  if (GetActiveBindSourceAdapter <> nil) then
    GetActiveBindSourceAdapter.Active := True;
  inherited;
end;

procedure TioModelDataSet.Loaded;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not(csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // VIEWMODELBRIDGE - CHECK FOR VIEWMODEL IF NOT ALREADY EXECUTED
  // (ALWAYS BEFORE DOCREATEADAPTER CALL)
  // ===========================================================================
  if Assigned(ViewModelBridge) and not(csDesigning in ComponentState) then
    ViewModelBridge.CheckForViewModel;
  // ===========================================================================

  inherited;
end;

procedure TioModelDataSet.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FViewModelBridge) then
    FViewModelBridge := nil;
end;

procedure TioModelDataSet.SetViewModelBridge(const AVMBridge: TioViewModelBridge);
begin
  FViewModelBridge := AVMBridge;
  if AVMBridge <> nil then
    AVMBridge.FreeNotification(Self);
end;

end.
