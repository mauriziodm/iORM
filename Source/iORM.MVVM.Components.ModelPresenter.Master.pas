unit iORM.MVVM.Components.ModelPresenter.Master;

interface

uses
  iORM.MVVM.Components.ModelPresenter.Custom, iORM.LiveBindings.BSPersistence,
  System.Classes, iORM.LiveBindings.Interfaces;

type

  TioModelPresenterMaster = class(TioModelPresenter, IioBSPersistenceClient)
  private
    FObjState: TioBSPersistence;
    FOnEditAction: TioBSOnEditAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    // SourceModelPresenter
    function GetSourceModelPresenter: TioModelPresenter;
    procedure SetSourceModelPresenter(const Value: TioModelPresenter);
    // Added methods
    function GetPersistence: TioBSPersistence;
    // OnEditAction property
    function GetOnEditAction: TioBSOnEditAction;
    procedure SetOnEditAction(const Value: TioBSOnEditAction);
    // OnRecordChangeAction property
    function GetOnRecordChangeAction: TioBSOnRecordChangeAction;
    procedure SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
    procedure DoBeforeOpen;
    procedure DoBeforeScroll;
  protected
    function IsMasterBS: boolean; override;
    function IsDetailBS: boolean; override;
//    procedure DoBeforeOpen; override; // NB: Gestire DoBeforeOpen sul BindSource della view e poi passarlo al ModelPresenter
//    procedure DoBeforeScroll; override; // NB: Gestire DoBeforeOpen sul BindSource della view e poi passarlo al ModelPresenter
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
    property OnEditAction: TioBSOnEditAction read GetOnEditAction write SetOnEditAction default eSaveRevertPoint;
    property OnRecordChangeAction: TioBSOnRecordChangeAction read GetOnRecordChangeAction write SetOnRecordChangeAction default rcPersistIfChanged;
    property SourceModelPresenter: TioModelPresenter read GetSourceModelPresenter write SetSourceModelPresenter;
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

{ TioModelPresenterMaster }

constructor TioModelPresenterMaster.Create(AOwner: TComponent);
begin
  inherited;
  FObjState := TioBSPersistence.Create(Self);
  FOnEditAction := eSaveRevertPoint;
  FOnRecordChangeAction := rcPersistIfChanged;
end;

destructor TioModelPresenterMaster.Destroy;
begin
  FObjState.Free;
  inherited;
end;

procedure TioModelPresenterMaster.DoBeforeOpen;
begin
  inherited;
  Persistence.Clear(False);
end;

procedure TioModelPresenterMaster.DoBeforeScroll;
begin
  inherited;
  Persistence.NotifyBeforeScroll;
end;

function TioModelPresenterMaster.GetOnEditAction: TioBSOnEditAction;
begin
  Result := FOnEditAction;
end;

function TioModelPresenterMaster.GetOnRecordChangeAction: TioBSOnRecordChangeAction;
begin
  Result := FOnRecordChangeAction;
end;

function TioModelPresenterMaster.GetPersistence: TioBSPersistence;
begin
  Result := FObjState;
end;

function TioModelPresenterMaster.GetSourceModelPresenter: TioModelPresenter;
begin
  Result := MasterPresenter;
end;

function TioModelPresenterMaster.IsDetailBS: boolean;
begin
  // Do not inherit
  Result := False;
end;

function TioModelPresenterMaster.IsMasterBS: boolean;
begin
  // Do not inherit
  Result := True;
end;

procedure TioModelPresenterMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioModelPresenterMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioModelPresenterMaster.SetSourceModelPresenter(const Value: TioModelPresenter);
begin
  MasterPresenter := Value;
end;

end.
