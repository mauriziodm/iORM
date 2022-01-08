unit iORM.LiveBindings.PrototypeBindSource.Master;

interface

uses
  iORM.DB.Components.BindSourceObjState, iORM.LiveBindings.PrototypeBindSource,
  System.Classes, iORM.LiveBindings.Interfaces, Data.Bind.Components;

type

  TioPrototypeBindSourceMaster = class(TioPrototypeBindSource, IioBindSourceObjStateClient)
  private
    FObjState: TioBindSourceObjStateManager;
    FOnEditAction: TioBSOnEditAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    function GetSourcePBS: TioPrototypeBindSource;
    procedure SetSourcePBS(const Value: TioPrototypeBindSource);
    // Added methods
    function GetObjState: TioBindSourceObjStateManager;
    // OnEditAction property
    function GetOnEditAction: TioBSOnEditAction;
    procedure SetOnEditAction(const Value: TioBSOnEditAction);
    // OnRecordChangeAction property
    function GetOnRecordChangeAction: TioBSOnRecordChangeAction;
    procedure SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
    // procedure DoBeforeOpen; // In TioDataSetMaster is DoBeforeOpen but here is SetActive
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
    procedure SetActive(const Value: Boolean); override; // In TioDataSetMaster is DoBeforeOpen but here is SetActive
//    procedure DoBeforeScroll; override;
    procedure PosChanging(ABindComp: TBasicBindComponent); override; // In TioDataSetMaster is DoBeforeScroll but here is PosChanging
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Where;
    property ItemCount;
    // Added properties
    property ObjState: TioBindSourceObjStateManager read GetObjState;
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
    property AutoLoadData default True;
    property ViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr; // published: Master
    property OrderBy;
    property AutoRefreshOnNotification default TioAutoRefreshType.arEnabledNoReload;
    // Published properties: selectors
    property SelectorFor;
    // Published properties: paging
    property Paging;
    // Added properties
    property OnEditAction: TioBSOnEditAction read GetOnEditAction write SetOnEditAction default eSaveObjState;
    property OnRecordChangeAction: TioBSOnRecordChangeAction read GetOnRecordChangeAction write SetOnRecordChangeAction default rcPersistIfChanged;
    property SourcePBS: TioPrototypeBindSource read GetSourcePBS write SetSourcePBS;
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
  System.SysUtils;

{ TioPrototypeBindSourceMaster }

constructor TioPrototypeBindSourceMaster.Create(AOwner: TComponent);
begin
  inherited;
  FObjState := TioBindSourceObjStateManager.Create(Self);
  FOnEditAction := eSaveObjState;
  FOnRecordChangeAction := rcPersistIfChanged;
end;

destructor TioPrototypeBindSourceMaster.Destroy;
begin
  FObjState.Free;
  inherited;
end;

function TioPrototypeBindSourceMaster.GetObjState: TioBindSourceObjStateManager;
begin
  Result := FObjState;
end;

function TioPrototypeBindSourceMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioPrototypeBindSourceMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioPrototypeBindSourceMaster.GetSourcePBS: TioPrototypeBindSource;
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
  ObjState.NotifyBeforeScroll;
end;

procedure TioPrototypeBindSourceMaster.SetActive(const Value: Boolean);
begin
  inherited;
  ObjState.Clear(False);
end;

procedure TioPrototypeBindSourceMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioPrototypeBindSourceMaster.SetSourcePBS(const Value: TioPrototypeBindSource);
begin
  MasterBindSource := Value;
end;

end.
