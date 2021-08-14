unit iORM.DB.Components.DataSet.DataSet;

interface

uses
  iORM.DB.Components.DataSet.Base, iORM.CommonTypes, System.Classes,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.CommonBSAPaging, iORM.Where.Interfaces,
  Data.Bind.ObjectScope;

type

  TioDataSet = class;

  TioMasterDataSet = TioDataSet;

  TioDataSet = class(TioBSADataSet)
  private
    FTypeName: String;
    FTypeAlias: String;
    FAutoLoadData: Boolean;
    FAsync: Boolean;
    FAutoPersist: Boolean;
    FViewDataType: TioViewDataType;
    FMasterDataSet: TioMasterDataSet;
    FMasterPropertyName: String;
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FAutoRefreshOnNotification: TioAutoRefreshType;
    FonNotify: TioBSANotificationEvent;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    // Selectors
    FSelectorFor: TioDataSet;
    FOnReceiveSelectionAutoEdit: Boolean;
    FOnReceiveSelectionAutoPost: Boolean;
    FOnReceiveSelectionAutoPersist: Boolean;
    // Edit/Insert/Post/Cancel propagation
    FPropagateEdit: Boolean;
    FPropagatePost: Boolean;
    FPropagatePersist: Boolean;
    // FLoaded flag for iORM DoCreateAdapter internal use only just before
    // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
    FLoaded: Boolean;
    // Selection related events
    FonBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FonAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FonAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
    // Async
    procedure SetAsync(const Value: Boolean);
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    // AutoPersist
    procedure SetAutoPersist(const Value: Boolean);
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    // IsDetail
    function GetIsDetail: Boolean;
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    // ItemCount
    function GetCount: Integer;
    // OrderBy property
    procedure SetOrderBy(const Value: String);
    // State
    function GetState: TBindSourceAdapterState;
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    // TypeName
    procedure SetTypeName(const Value: String);
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    // WhereDetailsFromDetailAdapters
    procedure SetWhereDetailsFromDetailAdapters(const Value: Boolean);
    // WhereStr
    procedure SetWhereStr(const Value: TStrings);
    procedure WhereOnChangeEventHandler(Sender: TObject);
  protected
  public
    // ----------------------------------------------------------------------------------------------------------------------------
    // Properties
    property Where: IioWhere read GetWhere write SetWhere;
    property State: TBindSourceAdapterState read GetState;
    property ItemCount: Integer read GetCount;
    property IsDetail: Boolean read GetIsDetail;
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting;
  published
    // Events
    property OnNotify: TioBSANotificationEvent read FonNotify write FonNotify;
    property OnBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonBeforeSelectionObject write FonBeforeSelectionObject;
    property OnSelectionObject: TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property OnAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonAfterSelectionObject write FonAfterSelectionObject;
    property OnBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonBeforeSelectionInterface write FonBeforeSelectionInterface;
    property OnSelectionInterface: TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property OnAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonAfterSelectionInterface write FonAfterSelectionInterface;
    // Properties
    property TypeName: String read FTypeName write SetTypeName;
    property TypeAlias: String read FTypeAlias write SetTypeAlias;
    property Async: Boolean read FAsync write SetAsync;
    property AutoLoadData: Boolean read FAutoLoadData write SetAutoLoadData;
    property AutoPersist: Boolean read FAutoPersist write SetAutoPersist;
    property ViewDataType: TioViewDataType read FViewDataType write FViewDataType;
    property WhereStr: TStrings read FWhereStr write SetWhereStr;
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters;
    property OrderBy: String read FOrderBy Write SetOrderBy;
    property MasterDataSet: TioMasterDataSet read FMasterDataSet write FMasterDataSet;
    property MasterPropertyName: String read FMasterPropertyName write FMasterPropertyName;
    property AutoRefreshOnNotification: TioAutoRefreshType read FAutoRefreshOnNotification write FAutoRefreshOnNotification;
    property AutoPost: Boolean read GetAutoPost write SetAutoPost;
    // Selectors
    property SelectorFor: TioDataSet read FSelectorFor write FSelectorFor;
    property OnReceiveSelectionAutoEdit: Boolean read FOnReceiveSelectionAutoEdit write FOnReceiveSelectionAutoEdit;
    property OnReceiveSelectionAutoPost: Boolean read FOnReceiveSelectionAutoPost write FOnReceiveSelectionAutoPost;
    property OnReceiveSelectionAutoPersist: Boolean read FOnReceiveSelectionAutoPersist write FOnReceiveSelectionAutoPersist;
    // Edit/Insert/Post/Cancel propagation
    property PropagateEdit: Boolean read FPropagateEdit write FPropagateEdit;
    property PropagatePost: Boolean read FPropagatePost write FPropagatePost;
    property PropagatePersist: Boolean read FPropagatePersist write FPropagatePersist;
    // Paging
    property Paging: TioCommonBSAPageManager read FPaging write FPaging;
  end;

implementation

uses
  System.SysUtils, iORM.Utilities, iORM.Where.Factory, iORM.Exceptions,
  iORM.LiveBindings.Factory;

{ TioDataSet }

function TioDataSet.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := InternalAdapter.AutoPost
  else
    Result := FAutoPost;
end;

function TioDataSet.GetCount: Integer;
begin
  if CheckAdapter then
    Result := InternalActiveAdapter.ItemCount
  else
    Result := 0;
end;

function TioDataSet.GetIsDetail: Boolean;
begin
  Result := Assigned(FMasterDataSet);
end;

function TioDataSet.GetIsInterfacePresenting: Boolean;
begin
  if CheckAdapter then
    Result := InternalActiveAdapter.IsInterfaceBSA
  else
    Result := TioUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioDataSet.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := InternalActiveAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

function TioDataSet.GetWhere: IioWhere;
begin
  if CheckAdapter then
    Result := InternalActiveAdapter.ioWhere
  else
    Result := nil;
end;

procedure TioDataSet.SetAsync(const Value: Boolean);
begin
  FAsync := Value;
  // Update the adapter
  if CheckAdapter then
    InternalActiveAdapter.ioAsync := Value;
end;

procedure TioDataSet.SetAutoLoadData(const Value: Boolean);
begin
  FAsync := Value;
  // Update the adapter
  if CheckAdapter then
    InternalActiveAdapter.ioAsync := Value;
end;

procedure TioDataSet.SetAutoPersist(const Value: Boolean);
begin
  FAutoPersist := Value;
  // Update the adapter
  if CheckAdapter then
    InternalActiveAdapter.ioAutoPersist := Value;
end;

procedure TioDataSet.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    InternalAdapter.AutoPost := Value;
end;

procedure TioDataSet.SetOrderBy(const Value: String);
begin
  FOrderBy := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    InternalActiveAdapter.ioWhere.SetOrderBySql(Value);
end;

procedure TioDataSet.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    InternalActiveAdapter.ioTypeAlias := Value;
end;

procedure TioDataSet.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    InternalActiveAdapter.ioTypeName := Value;
end;

procedure TioDataSet.SetWhere(const AWhere: IioWhere);
begin
  // Update the adapter where
  if CheckAdapter then
  begin
    AWhere.SetPagingObj(FPaging); // Inject paging object spscified in BindSource or ModelPresenter
    InternalActiveAdapter.ioWhere := AWhere;
  end;
end;

procedure TioDataSet.SetWhereDetailsFromDetailAdapters(const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckAdapter then
    InternalActiveAdapter.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioDataSet.SetWhereStr(const Value: TStrings);
begin
  FWhereStr.Assign(Value);
  // If in DesignTime then Exit
  // NB: Mettendo questa linea di codice ho risolto il problema che i ioPBS
  // anche se erano con "AutoActivate=False" quando veniva aperta (caricata)
  // la form che li conteneva a design time apparivano cmq con i dati finti di
  // prova anzichè rimanere vuoti.
  if (csDesigning in ComponentState) then
    Exit;
  // Set the onChange event handler
  (FWhereStr as TStringList).OnChange := WhereOnChangeEventHandler;
  // Update the adapter where property
  WhereOnChangeEventHandler(Self);
end;

procedure TioDataSet.WhereOnChangeEventHandler(Sender: TObject);
begin
  SetWhere(TioWhereFactory.NewWhereWithPaging(FPaging).Add(FWhereStr.Text));
end;

procedure TioDataSet._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If an adapter already exists then raise an exception
  if CheckAdapter then
    raise EioException.Create(Self.ClassName, '_CreateAdapter',
      'Active bind source adapter already exists.');
  // if the TypeName is empty then set it
  if TypeName.IsEmpty then
    raise EioException.Create(Self.ClassName, 'SetDataObject',
      'ModelPresenter.TypeName value is not valid.');
  // If the property MasterModelPresenter is assigned then retrieve
  // the DetailBindSourceAdapter from it
  if Assigned(MasterDataSet) then
    // Get the BindSourceAdapter
//    SetInternalAdapter(TioLiveBindingsFactory.GetBSAfromMasterModelPresenter(nil, MasterDataSet, MasterPropertyName))
    // else create the BSA from TypeName & TypeAlias
  else
  begin
    // Get the ActiveBindSourceAdapter
//    SetBindSourceAdapter(TioLiveBindingsFactory.GetBSA(nil, TypeName, TypeAlias,
//      Where, ViewDataType, AutoLoadData, ADataObject, AOwnsObject));
    // Force the creation of all the detail adapters (if exists)
    // NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
    // funzionavano perchè al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
    // stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
    // del Master.
//    ForceDetailAdaptersCreation;
  end;
  // Init the BSA
//  FBindSourceAdapter.ioAutoPost := FAutoPost;
end;

end.
