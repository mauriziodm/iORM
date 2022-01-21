unit iORM.MVVM.ModelPresenter.Master;

interface

uses
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.BSPersistence,
  System.Classes, iORM.LiveBindings.Interfaces;

type

  TioModelPresenterMaster = class(TioModelPresenterCustom, IioBSPersistenceClient)
  private
    FPersistence: TioBSPersistence;
    FOnDeleteAction: TioBSOnDeleteAction;
    FOnEditAction: TioBSOnEditAction;
    FOnRecordChangeAction: TioBSOnRecordChangeAction;
    function IsActive: Boolean;
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
    // OnRecordChangeAction property
    function GetOnRecordChangeAction: TioBSOnRecordChangeAction;
    procedure SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
  protected
    function IsMasterBS: Boolean; override;
    function IsDetailBS: Boolean; override;
//    procedure DoBeforeOpen; override; // NB: Gestire DoBeforeOpen sul ModelDataSet/ModelBindSource della view e poi passarlo al ModelPresenter
//    procedure DoBeforeScroll; override; // NB: Gestire DoBeforeOpen sul ModelDataSet/ModelBindSource della view e poi passarlo al ModelPresenter
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
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
    property AutoLoadData default True;
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
    property OnEditAction: TioBSOnEditAction read GetOnEditAction write SetOnEditAction default eSaveRevertPoint;
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

{ TioModelPresenterMaster }

constructor TioModelPresenterMaster.Create(AOwner: TComponent);
begin
  inherited;
  FPersistence := TioBSPersistence.Create(Self);
  FOnDeleteAction := daSetSmartDeleteSystem;
  FOnEditAction := eSaveRevertPoint;
  FOnRecordChangeAction := rcPersistIfChanged;
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

function TioModelPresenterMaster.IsActive: Boolean;
begin
  Result := Active;
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

procedure TioModelPresenterMaster.SetOnDeleteAction(const Value: TioBSOnDeleteAction);
begin
  FOnDeleteAction := Value;
end;

procedure TioModelPresenterMaster.SetOnEditAction(const Value: TioBSOnEditAction);
begin
  FOnEditAction := Value;
end;

procedure TioModelPresenterMaster.SetOnRecordChangeAction(const Value: TioBSOnRecordChangeAction);
begin
  FOnRecordChangeAction := Value;
end;

procedure TioModelPresenterMaster.SetSourcePresenter(const Value: TioModelPresenterCustom);
begin
  MasterPresenter := Value;
end;

end.
