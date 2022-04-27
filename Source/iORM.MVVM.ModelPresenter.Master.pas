unit iORM.MVVM.ModelPresenter.Master;

interface

uses
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.BSPersistence,
  System.Classes, iORM.LiveBindings.Interfaces, iORM.CommonTypes;

type

  TioModelPresenterMaster = class(TioModelPresenterCustom, IioBSPersistenceClient, IioStdActionTargetMasterBindSource)
  private
    FWannaBeActive: Boolean;
    FPersistence: TioBSPersistence;
    FOnDeleteAction: TioBSOnDeleteAction;
    FOnEditAction: TioBSOnEditAction;
    FOnUpdateAction: TioBSOnUpdateAction;
    FOnInsertAction: TioOnInsertAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    // SourceModelPresenter
    function GetSourcePresenter: TioModelPresenterCustom;
    procedure SetSourcePresenter(const Value: TioModelPresenterCustom);
    // Added methods
    function GetPersistence: TioBSPersistence;
    // OnDeleteAction property
    function GetOnDeleteAction: TioBSOnDeleteAction;
    procedure SetOnDeleteAction(const Value: TioBSOnDeleteAction);
    // OnEditAction property
    function GetOnEditAction: TioBSOnEditAction;
    procedure SetOnEditAction(const Value: TioBSOnEditAction);
    // OnInsertUpdateAction property
    function GetOnUpdateAction: TioBSOnUpdateAction;
    procedure SetOnUpdateAction(const Value: TioBSOnUpdateAction);
    // OnInsertAction property
    function GetOnInsertAction: TioOnInsertAction;
    procedure SetOnInsertAction(const Value: TioOnInsertAction);
    // OnRecordChangeAction property
    function GetOnRecordChangeAction: TioBSOnRecordChangeAction;
    procedure SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
  protected
    function PostPonedActivation_CanOpen(const ANewDataObject: TObject): Boolean;
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean); override;
    procedure SetActive(const Value: Boolean); override;
    // procedure DoBeforeOpen; override; // NB: Gestire DoBeforeOpen sul ModelDataSet/ModelBindSource della view e poi passarlo al ModelPresenter
    // procedure DoBeforeScroll; override; // NB: Gestire DoBeforeOpen sul ModelDataSet/ModelBindSource della view e poi passarlo al ModelPresenter
    // LoadType
    procedure SetLoadType(const Value: TioLoadType); override;
    // MasterPresenter
    procedure SetMasterPresenter(const Value: TioModelPresenterCustom); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open; override;
    procedure Close; override;
    function IsMasterBS: Boolean; override;
    function IsDetailBS: Boolean; override;
    property Active;
    property Where;
    property ItemCount;
    // Added properties
    property Persistence: TioBSPersistence read GetPersistence;
  published
    property AsDefault;
    property TypeName;
    property TypeAlias;
    property Async default False;
    property LoadType default ltAuto;
    property Lazy default False;
    property LazyProps;
    property TypeOfCollection; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr; // published: Master
    property OrderBy;
    property AutoRefreshOnNotification default True;
    property VirtualFields;
    // Published properties: selectors
    property SelectorFor;
    // Published properties: paging
    property Paging;
    // Added properties
    property OnDeleteAction: TioBSOnDeleteAction read GetOnDeleteAction write SetOnDeleteAction default daSetSmartDeleteSystem;
    property OnEditAction: TioBSOnEditAction read GetOnEditAction write SetOnEditAction default eaSaveRevertPoint;
    property OnUpdateAction: TioBSOnUpdateAction read GetOnUpdateAction write SetOnUpdateAction default uaSetSmartUpdateStateLess;
    property OnInsertAction: TioOnInsertAction read GetOnInsertAction write SetOnInsertAction default iaSaveRevertPoint;
    property OnRecordChangeAction: TioBSOnRecordChangeAction read GetOnRecordChangeAction write SetOnRecordChangeAction default rcPersistIfChanged;
    property SourcePresenter: TioModelPresenterCustom read GetSourcePresenter write SetSourcePresenter;
    // Published Events: selectors
    property OnBeforeSelectionObject;
    property OnSelectionObject;
    property OnAfterSelectionObject;
    property OnBeforeSelectionInterface;
    property OnSelectionInterface;
    property OnAfterSelectionInterface;
    // Published properties: selectors
    property OnReceiveSelectionCloneObject;
    property OnReceiveSelectionFreeObject;
  end;

implementation

uses
  iORM.LiveBindings.BSPersistence.SmartUpdateDetection,
  iORM.LiveBindings.CommonBSBehavior;

{ TioModelPresenterMaster }

procedure TioModelPresenterMaster.Close;
begin
  inherited;
  // Only to make the existing protected method public
end;

constructor TioModelPresenterMaster.Create(AOwner: TComponent);
begin
  inherited;
  FWannaBeActive := False;
  LoadType := ltAuto;
  FOnDeleteAction := daSetSmartDeleteSystem;
  FOnEditAction := eaSaveRevertPoint;
  FOnUpdateAction := uaSetSmartUpdateStateLess;
  FOnInsertAction := iaSaveRevertPoint;
  FOnRecordChangeAction := rcPersistIfChanged;
  FPersistence := TioBSPersistence.Create(Self);
end;

destructor TioModelPresenterMaster.Destroy;
begin
  FPersistence.Free;
  inherited;
end;

function TioModelPresenterMaster.GetOnDeleteAction: TioBSOnDeleteAction;
begin
  Result := FOnDeleteAction;
end;

function TioModelPresenterMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioModelPresenterMaster.GetOnInsertAction: TioOnInsertAction;
begin
  Result := FOnInsertAction;
end;

function TioModelPresenterMaster.GetOnUpdateAction: TioBSOnUpdateAction;
begin
  Result := FOnUpdateAction;
end;

function TioModelPresenterMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioModelPresenterMaster.GetPersistence: TioBSPersistence;
begin
  Result := FPersistence;
end;

function TioModelPresenterMaster.GetSourcePresenter: TioModelPresenterCustom;
begin
  Result := MasterPresenter;
end;

function TioModelPresenterMaster.IsDetailBS: Boolean;
begin
  // Do not inherit
  Result := False;
end;

function TioModelPresenterMaster.IsMasterBS: Boolean;
begin
  // Do not inherit
  Result := True;
end;

procedure TioModelPresenterMaster.Open;
begin
  inherited;
  // Only to make the existing protected method public
end;

function TioModelPresenterMaster.PostPonedActivation_CanOpen(const ANewDataObject: TObject): Boolean;
begin
  case LoadType of
    ltManual:
      Result := FWannaBeActive and ((DataObject <> nil) or (ANewDataObject <> nil));
    ltFromBSAsIs .. ltFromBSReloadNewInstance:
      Result := FWannaBeActive and Assigned(SourcePresenter);
  else
    Result := FWannaBeActive;
  end;
end;

procedure TioModelPresenterMaster.SetActive(const Value: Boolean);
begin
  FWannaBeActive := Value;
  inherited;
end;

procedure TioModelPresenterMaster.SetLoadType(const Value: TioLoadType);
begin
  TioCommonBSBehavior.CheckForSetLoadType(Self, SourcePresenter, Value);
  inherited;
end;

procedure TioModelPresenterMaster.SetMasterPresenter(const Value: TioModelPresenterCustom);
begin
  inherited;
  if FWannaBeActive and not Active then
    Open;
end;

procedure TioModelPresenterMaster.SetSourcePresenter(const Value: TioModelPresenterCustom);
begin
  if Value = SourcePresenter then
    Exit;
  TioCommonBSBehavior.CheckForSetSourceBS(Self, Value, Self.LoadType);
  MasterPresenter := Value;
end;

procedure TioModelPresenterMaster.SetOnDeleteAction(const Value: TioBSOnDeleteAction);
begin
  FOnDeleteAction := Value;
end;

procedure TioModelPresenterMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioModelPresenterMaster.SetOnInsertAction(const Value: TioOnInsertAction);
begin
  FOnInsertAction := Value;
end;

procedure TioModelPresenterMaster.SetOnUpdateAction(const Value: TioBSOnUpdateAction);
begin
  if Value <> FOnUpdateAction then
  begin
    FOnUpdateAction := Value;
    FPersistence.SmartUpdateDetection := TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(FOnUpdateAction = uaSetSmartUpdateStateFull);
  end
end;

procedure TioModelPresenterMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioModelPresenterMaster._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  if PostPonedActivation_CanOpen(ADataObject) then
    inherited;
end;

end.
