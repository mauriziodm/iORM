unit iORM.DB.DataSet.Master;

interface

uses
  iORM.DB.DataSet.Custom, iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.BSPersistence, System.Classes, iORM.CommonTypes;

type

  TioDataSetMaster = class(TioDataSetCustom, IioBSPersistenceClient)
  private
    FPersistence: TioBSPersistence;
    FOnDeleteAction: TioBSOnDeleteAction;
    FOnEditAction: TioBSOnEditAction;
    FOnUpdateAction: TioBSOnUpdateAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    FOnInsertAction: TioOnInsertAction;
    // SourceDataSet
    function GetSourceDataSet: TioDataSetCustom;
    procedure SetSourceDataSet(const Value: TioDataSetCustom);
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
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
    procedure DoBeforeOpen; override;  // In TioPrototypeBindSourceMaster is SetActive but here is DoBeforeOpen, DoAfterOpen and DoBeforeClose
    procedure DoBeforeScroll; override;  // In TioPrototypeBindSourceMaster is PosChanging but here is DoBeforeScroll
    // LoadType
    procedure SetLoadType(const Value: TioLoadType); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Where;
    property ItemCount;
    // Added properties
    property Persistence: TioBSPersistence read GetPersistence;
  published
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
    property SourceDataSet: TioDataSetCustom read GetSourceDataSet write SetSourceDataSet;
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
  System.SysUtils, iORM.LiveBindings.BSPersistence.SmartUpdateDetection,
  iORM.LiveBindings.Notification, iORM.LiveBindings.CommonBSBehavior;

{ TioDataSetMaster }

constructor TioDataSetMaster.Create(AOwner: TComponent);
begin
  inherited;
  LoadType := ltAuto;
  FOnDeleteAction := daSetSmartDeleteSystem;
  FOnEditAction := eaSaveRevertPoint;
  FOnUpdateAction := uaSetSmartUpdateStateLess;
  FOnInsertAction := iaSaveRevertPoint;
  FOnRecordChangeAction := rcPersistIfChanged;
  FPersistence := TioBSPersistence.Create(Self);
end;

destructor TioDataSetMaster.Destroy;
begin
  FPersistence.Free;
  inherited;
end;

procedure TioDataSetMaster.DoBeforeOpen;
begin
  inherited;
  // Clear the BSPersistence status
  Persistence.Clear(False);
end;

procedure TioDataSetMaster.DoBeforeScroll;
begin
  inherited;
  Persistence.NotifyBeforeScroll;
end;

function TioDataSetMaster.GetPersistence: TioBSPersistence;
begin
  Result := FPersistence;
end;

function TioDataSetMaster.GetOnDeleteAction: TioBSOnDeleteAction;
begin
  Result := FOnDeleteAction;
end;

function TioDataSetMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioDataSetMaster.GetOnInsertAction: TioOnInsertAction;
begin
  Result := FOnInsertAction;
end;

function TioDataSetMaster.GetOnUpdateAction: TioBSOnUpdateAction;
begin
  Result := FOnUpdateAction;
end;

function TioDataSetMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioDataSetMaster.GetSourceDataSet: TioDataSetCustom;
begin
  Result := MasterDataSet;
end;

function TioDataSetMaster.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

function TioDataSetMaster.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

procedure TioDataSetMaster.SetLoadType(const Value: TioLoadType);
begin
  TioCommonBSBehavior.CheckForSetLoadType(Self, SourceDataSet, Value);
  inherited;
end;

procedure TioDataSetMaster.SetOnDeleteAction(const Value: TioBSOnDeleteAction);
begin
  FOnDeleteAction := Value;
end;

procedure TioDataSetMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioDataSetMaster.SetOnInsertAction(const Value: TioOnInsertAction);
begin
  FOnInsertAction := Value;
end;

procedure TioDataSetMaster.SetOnUpdateAction(const Value: TioBSOnUpdateAction);
begin
  if Value <> FOnUpdateAction then
  begin
    FOnUpdateAction := Value;
    FPersistence.SmartUpdateDetection := TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(FOnUpdateAction = uaSetSmartUpdateStateFull);
  end
end;

procedure TioDataSetMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioDataSetMaster.SetSourceDataSet(const Value: TioDataSetCustom);
begin
  if Value = SourceDataSet then
    Exit;
  TioCommonBSBehavior.CheckForSetSourceBS(Self, Value, Self.LoadType);
  MasterDataSet := Value;
end;

end.
