unit iORM.DB.Components.DataSet.DataSetMaster;

interface

uses
  iORM.DB.Components.DataSet.CustomDataSet, iORM.LiveBindings.Interfaces,
  iORM.DB.Components.BindSourceObjState, System.Classes;

type

  TioDataSetMaster = class(TioCustomDataSet, IioBindSourceObjStateClient)
  private
    FObjState: TioBindSourceObjStateManager;
    FOnEditAction: TioBSOnEditAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    function GetSourceDataSet: TioCustomDataSet;
    procedure SetSourceDataSet(const Value: TioCustomDataSet);
    // Added methods
    function GetObjState: TioBindSourceObjStateManager;
    // OnEditAction property
    function GetOnEditAction: TioBSOnEditAction;
    procedure SetOnEditAction(const Value: TioBSOnEditAction);
    // OnRecordChangeAction property
    function GetOnRecordChangeAction: TioBSOnRecordChangeAction;
    procedure SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
    procedure DoBeforeOpen; override;
    procedure DoBeforeScroll; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Where;
    property ItemCount;
    // Added properties
    property ObjState: TioBindSourceObjStateManager read GetObjState;
  published
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
    property SourceDataSet: TioCustomDataSet read GetSourceDataSet write SetSourceDataSet;
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

{ TioDataSetMaster }

constructor TioDataSetMaster.Create(AOwner: TComponent);
begin
  inherited;
  FObjState := TioBindSourceObjStateManager.Create(Self);
  FOnEditAction := eSaveObjState;
  FOnRecordChangeAction := rcPersistIfChanged;
end;

destructor TioDataSetMaster.Destroy;
begin
  FObjState.Free;
  inherited;
end;

procedure TioDataSetMaster.DoBeforeOpen;
begin
  inherited;
  ObjState.Clear(False);
end;

procedure TioDataSetMaster.DoBeforeScroll;
begin
  inherited;
  ObjState.NotifyBeforeScroll;
end;

function TioDataSetMaster.GetObjState: TioBindSourceObjStateManager;
begin
  Result := FObjState;
end;

function TioDataSetMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioDataSetMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioDataSetMaster.GetSourceDataSet: TioCustomDataSet;
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

procedure TioDataSetMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioDataSetMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioDataSetMaster.SetSourceDataSet(const Value: TioCustomDataSet);
begin
  MasterDataSet := Value;
end;

end.
