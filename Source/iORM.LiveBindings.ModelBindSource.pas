unit iORM.LiveBindings.ModelBindSource;

interface

uses
  Data.Bind.ObjectScope, iORM.MVVM.Components.ViewModelBridge, System.Classes,
  iORM.Components.Common.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.MVVM.Components.ModelPresenter;

type

  TioModelBindSource = class (TPrototypeBindSource, IioVMBridgeClientComponent, IioCrossViewMasterSource)
  private
    FViewModelBridge: TioViewModelBridge;
    FModelPresenter: String;
    FCrossView_MasterBindSource: IioCrossViewMasterSource;
    FCrossView_MasterPropertyName: String;
    // FioLoaded flag for iORM DoCreateAdapter internal use only just before
    //  the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
    FioLoaded: Boolean;
    procedure PreventBindSourceAdapterDestruction;
  protected
    procedure Loaded; override;
    procedure DoCreateAdapter(var ADataObject: TBindSourceAdapter); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetModelPresenterInstance: TioModelPresenter;
    // ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge:TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
    // InternalActiveAdapter
    function GetInternalActiveAdapter: IioActiveBindSourceAdapter;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ViewModelBridge: TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
    property ModelPresenter:String read FModelPresenter write FModelPresenter;
    property CrossView_MasterBindSource: IioCrossViewMasterSource read FCrossView_MasterBindSource write FCrossView_MasterBindSource;
    property CrossView_MasterPropertyName: String read FCrossView_MasterPropertyName write FCrossView_MasterPropertyName;
    property InternalActiveAdapter: IioActiveBindSourceAdapter read GetInternalActiveAdapter;  // Must be ReadOnly
  end;

implementation

uses
  System.SysUtils, iORM.Components.Common,
  iORM.LiveBindings.ActiveListBindSourceAdapter, iORM.LiveBindings.Factory,
  iORM.Exceptions, System.Rtti, iORM.RttiContext.Factory;

{ TioModelBindSource }

constructor TioModelBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FioLoaded := False;
  FViewModelBridge := nil;
  FCrossView_MasterBindSource := nil;
  FCrossView_MasterPropertyName := '';
  if (csDesigning in ComponentState) and not Assigned(FViewModelBridge) then
    TioComponentsCommon.ViewModelBridgeAutosetting(Self, Owner);
end;

destructor TioModelBindSource.Destroy;
begin
  PreventBindSourceAdapterDestruction;
  inherited;
end;

procedure TioModelBindSource.DoCreateAdapter(
  var ADataObject: TBindSourceAdapter);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Inherited
  inherited;
  // If in DesignTime then Exit
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  //  the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  if (csDesigning in ComponentState)
  or (not FioLoaded)
    then Exit;
  // Get the BindSourceAdapter from the ModelPresenter from the ViewModel
  //  NB: If the 'CrossViewMasterSource' property is assigned the BindSourceAdapter
  //       from it (for cross view with microviews)
  if (not ModelPresenter.IsEmpty)
  and Assigned(ViewModelBridge)
  and ViewModelBridge.ViewModelIsAssigned
  then
  begin
    if Assigned(FCrossView_MasterBindSource) then
    begin
      // Get the BSA from the MasterModelPresenter
      LActiveBSA := TioLiveBindingsFactory.GetBSAfromMasterModelPresenter(Self, FCrossView_MasterBindSource.GetModelPresenterInstance, FCrossView_MasterPropertyName, nil);
      // Set the retrieved BSA as adapter for this Presenter
      ViewModelBridge.Presenter[ModelPresenter].BindSourceAdapter := LActiveBSA;
    end
    else
      // Get the BSA from the presenter
      LActiveBSA := ViewModelBridge.Presenter[ModelPresenter].BindSourceAdapter;
    // Assign the BindSourceAdapter
    ADataObject := LActiveBSA as TBindSourceAdapter;
  end;
end;

function TioModelBindSource.GetInternalActiveAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if CheckAdapter then
    Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result);
end;

function TioModelBindSource.GetModelPresenterInstance: TioModelPresenter;
begin
  Result := ViewModelBridge.Presenter[ModelPresenter];
end;

function TioModelBindSource.GetViewModelBridge: TioViewModelBridge;
begin
  Result := FViewModelBridge;
end;

procedure TioModelBindSource.Loaded;
var
  LAdapter: TBindSourceAdapter;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not (csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // VIEWMODELBRIDGE - CHECK FOR VIEWMODEL IF NOT ALREADY EXECUTED
  //  (ALWAYS BEFORE DOCREATEADAPTER CALL)
  // ===========================================================================
  if Assigned(ViewModelBridge) and not (csDesigning in ComponentState) then
    ViewModelBridge.CheckForViewModel;
  // ===========================================================================

  // DOCREATEADAPTER CALL MUST BE BEFORE THE INHERITED LINE !!!!!!
  // ===========================================================================
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  //  the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  // ---------------------------------------------------------------------------
  FioLoaded := True;
  if not Assigned(Self.OnCreateAdapter) then
  begin
    Self.DoCreateAdapter(LAdapter);
    if LAdapter <> nil then
      SetRuntimeAdapter(LAdapter);
  end;
  // ===========================================================================

  // INHERITED MUST BE AFTER THE DOCREATEADAPTER CALL !!!!!!
  inherited;
end;

procedure TioModelBindSource.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FViewModelBridge)
    then FViewModelBridge := nil;
end;

procedure TioModelBindSource.PreventBindSourceAdapterDestruction;
var
  LInstanceType: TRttiInstanceType;
  LField: TRttiField;
begin
  LInstanceType := TioRttiContextFactory.RttiContext.GetType(Self.ClassInfo).AsInstance;
  LField := LInstanceType.GetField('FRuntimeAdapter');
  LField.SetValue(Self, TValue.Empty);
end;

procedure TioModelBindSource.SetViewModelBridge(
  const AVMBridge: TioViewModelBridge);
begin
  FViewModelBridge := AVMBridge;
  if AVMBridge <> nil then AVMBridge.FreeNotification(Self);
end;

end.
