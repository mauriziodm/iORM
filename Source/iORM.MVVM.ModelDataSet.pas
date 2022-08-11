unit iORM.MVVM.ModelDataSet;

interface

uses
  iORM.DB.DataSet.Base, iORM.MVVM.ViewModelBridge, System.Classes,
  iORM.Components.Common.Interfaces, iORM.MVVM.ModelPresenter.Custom;

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
    destructor Destroy; override;
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

destructor TioModelDataSet.Destroy;
begin
  // UNREGISTER ITSELF AS MODELDATASET/MODELBINDSOURCE CONNECTED TO A MODELPRESENTER
  //  FOR REMOTED OPEN/CLOSE  BY MODELPRESETER
  // ===========================================================================
  if Assigned(ViewModelBridge) and not(csDesigning in ComponentState) then
  begin
    ViewModelBridge.CheckForViewModel;
    // Register itself as ModelDataSet/ModelBindSource (IioVMBridgeClientComponent)
    //  connected to a ModelPresenter for remoted open/close by ModelPresenter
    GetModelPresenterInstance.UnregisterViewBindSource(Self);
  end;
  // ===========================================================================

  inherited;
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
var
  LBindSource: IioNotifiableBindSource;
begin
  Result := nil;
  LBindSource := ViewModelBridge.Presenter[ModelPresenter];
  if LBindSource is TioModelPresenterCustom then
    Result := LBindSource as TioModelPresenterCustom
  else
    EioException.Create(ClassName, 'GetModelPresenterInstance', 'The requested BindSource is not a ModelPresenter');
end;

function TioModelDataSet.GetViewModelBridge: TioViewModelBridge;
begin
  Result := FViewModelBridge;
end;

procedure TioModelDataSet.InternalPreOpen;
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Checks
  if not Assigned(FViewModelBridge) then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModelBridge not assigned.');
  if not FViewModelBridge.ViewModelIsAssigned then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModel not assigned.');
  if FModelPresenter.IsEmpty then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'Model presenter not specified.');

// ----- OLD CODE -----
//  // Get the BindSourceAdapter from ViewModel and open it
//  // NB: If the 'CrossViewMasterSource' property is assigned the BindSourceAdapter
//  // from it (for cross view with microviews)
//  if Assigned(FCrossView_MasterBindSource) then
//    GetModelPresenterInstance.SetActiveBindSourceAdapter(  TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(Name ,Self,
//      FCrossView_MasterBindSource.GetModelPresenterInstance, FCrossView_MasterPropertyName, nil)  );
//  SetActiveBindSourceAdapter(  GetModelPresenterInstance.GetActiveBindSourceAdapter  );
//  if GetActiveBindSourceAdapter <> nil then
//    GetActiveBindSourceAdapter.Active := True;
// ----- OLD CODE -----

  // Get the BindSourceAdapter from ViewModel and open it
  // Note: If the 'CrossViewMasterSource' property is assigned then get the BindSourceAdapter
  // from it (for cross view with microviews)
  if Assigned(FCrossView_MasterBindSource) then
  begin
    // If here it means that it's a detail (crossview detail)
    if GetModelPresenterInstance.IsDetailBS then
      LActiveBSA := TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(Self, Name, FCrossView_MasterBindSource.GetModelPresenterInstance, FCrossView_MasterPropertyName, nil)
    else
      LActiveBSA := TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(Self, Name, FCrossView_MasterBindSource.GetModelPresenterInstance);
    // Set the retrieved BSA as adapter in the connected ModelPresenter
    GetModelPresenterInstance.SetActiveBindSourceAdapter(LActiveBSA);
  end;
  // Get the BSA for this ModelDataSet from the connected ModelPresenter
  SetActiveBindSourceAdapter(  GetModelPresenterInstance.GetActiveBindSourceAdapter  );

  // Inherit
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
  begin
    ViewModelBridge.CheckForViewModel;
    // Register itself as ModelDataSet/ModelBindSource (IioVMBridgeClientComponent)
    //  connected to a ModelPresenter for remoted open/close by ModelPresenter
    GetModelPresenterInstance.RegisterViewBindSource(Self);
    // open itself if the ModelPresenter is already active
    Active := ViewModelBridge.Presenter[ModelPresenter].IsActive;
  end;
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
