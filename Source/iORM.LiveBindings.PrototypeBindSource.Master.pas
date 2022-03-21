unit iORM.LiveBindings.PrototypeBindSource.Master;

interface

uses
  iORM.LiveBindings.BSPersistence, iORM.LiveBindings.PrototypeBindSource.Custom,
  System.Classes, iORM.LiveBindings.Interfaces, Data.Bind.Components, iORM.CommonTypes;

type

  TioPrototypeBindSourceMaster = class(TioPrototypeBindSourceCustom, IioBSPersistenceClient)
  private
    FPersistence: TioBSPersistence;
    FOnDeleteAction: TioBSOnDeleteAction;
    FOnEditAction: TioBSOnEditAction;
    FOnUpdateAction: TioBSOnUpdateAction;
    FOnInsertAction: TioOnInsertAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    // SourcePrototypeBindSource
    function GetSourcePBS: TioPrototypeBindSourceCustom;
    procedure SetSourcePBS(const Value: TioPrototypeBindSourceCustom);
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
    // procedure DoBeforeOpen; // In TioDataSetMaster is DoBeforeOpen but here is SetActive
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
    procedure SetActive(const Value: Boolean); override; // In TioDataSetMaster is DoBeforeOpen/DoAfterOpen/DoBeforeClose but here is SetActive
    procedure PosChanging(ABindComp: TBasicBindComponent); override; // In TioDataSetMaster is DoBeforeScroll but here is PosChanging
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Where;
    property ItemCount;
    // Added properties
    property Persistence: TioBSPersistence read GetPersistence;
  published
    // properties redeclared from TioCustomPrototypeBindSource
    property AutoActivate;
//    property AutoEdit;
//    property AutoPost;
//    property RecordCount;
//    property FieldDefs;
//    property ScopeMappings;
//    property OnCreateAdapter;
    // properties redeclared from TioCUstomPrototypeBindSource
    property TypeName;
    property TypeAlias;
    property Async default False;
    property LoadType default ltAuto;
    property Lazy default False;
    property LazyProps;
    property ViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
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
    property SourcePBS: TioPrototypeBindSourceCustom read GetSourcePBS write SetSourcePBS;
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
  iORM.LiveBindings.Notification;

{ TioPrototypeBindSourceMaster }

constructor TioPrototypeBindSourceMaster.Create(AOwner: TComponent);
begin
  inherited;
  FOnDeleteAction := daSetSmartDeleteSystem;
  FOnEditAction := eaSaveRevertPoint;
  FOnUpdateAction := uaSetSmartUpdateStateLess;
  FOnInsertAction := iaSaveRevertPoint;
  FOnRecordChangeAction := rcPersistIfChanged;
  FPersistence := TioBSPersistence.Create(Self);
end;

destructor TioPrototypeBindSourceMaster.Destroy;
begin
  FPersistence.Free;
  inherited;
end;

function TioPrototypeBindSourceMaster.GetPersistence: TioBSPersistence;
begin
  Result := FPersistence;
end;

function TioPrototypeBindSourceMaster.GetOnDeleteAction: TioBSOnDeleteAction;
begin
  Result := FOnDeleteAction;
end;

function TioPrototypeBindSourceMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioPrototypeBindSourceMaster.GetOnInsertAction: TioOnInsertAction;
begin
  Result := FOnInsertAction;
end;

function TioPrototypeBindSourceMaster.GetOnUpdateAction: TioBSOnUpdateAction;
begin
  Result := FOnUpdateAction;
end;

function TioPrototypeBindSourceMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioPrototypeBindSourceMaster.GetSourcePBS: TioPrototypeBindSourceCustom;
begin
  Result := MasterBindSource;
end;

function TioPrototypeBindSourceMaster.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

function TioPrototypeBindSourceMaster.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

procedure TioPrototypeBindSourceMaster.PosChanging(ABindComp: TBasicBindComponent);
begin
  inherited;
  Persistence.NotifyBeforeScroll;
end;

procedure TioPrototypeBindSourceMaster.SetActive(const Value: Boolean);
begin
  inherited;
  // Clear the BSPersistence status
  if Value then
    Persistence.Clear(False);
end;

procedure TioPrototypeBindSourceMaster.SetOnDeleteAction(const Value: TioBSOnDeleteAction);
begin
  FOnDeleteAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetOnInsertAction(const Value: TioOnInsertAction);
begin
  FOnInsertAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetOnUpdateAction(const Value: TioBSOnUpdateAction);
begin
  if Value <> FOnUpdateAction then
  begin
    FOnUpdateAction := Value;
    FPersistence.SmartUpdateDetection := TioSmartUpdateDetectionFaxtory.NewSmartUpdateDetectionSystem(FOnUpdateAction = uaSetSmartUpdateStateFull);
  end
end;

procedure TioPrototypeBindSourceMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetSourcePBS(const Value: TioPrototypeBindSourceCustom);
begin
  MasterBindSource := Value;
end;

end.
