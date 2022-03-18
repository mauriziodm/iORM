unit iORM.DB.DataSet.Custom;

interface

uses
  iORM.DB.DataSet.Base, iORM.CommonTypes, System.Classes,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.CommonBSAPaging, iORM.Where.Interfaces,
  Data.Bind.ObjectScope, System.Generics.Collections;

type

  TioDataSetCustom = class;

  TioMasterDataSet = TioDataSetCustom;

  TioDataSetCustom = class abstract(TioBSABaseDataSet, IioNotifiableBindSource, IioStdActionTargetBindSource)
  private
    FTypeName: String;
    FTypeAlias: String;
    FLoadType: TioLoadType;
    FLazy: Boolean;
    FLazyProps: String;
    FAsync: Boolean;
    FViewDataType: TioViewDataType; // Renderlo automatico??? (rilevamento se è una lista con DuckTyping)
    FMasterDataSet: TioMasterDataSet;
    FMasterPropertyName: String;
    FWhere: IioWhere; // Istanza temporanea solo fintanto che non c'è il BSA
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FAutoRefreshOnNotification: Boolean;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    // Selectors
    FSelectorFor: TioDataSetCustom;
    FOnReceiveSelectionCloneObject: Boolean;
    FOnReceiveSelectionFreeObject: Boolean;
    // Questà è una collezione dove eventuali ModelPresenters di dettaglio
    // si registrano per rendere nota la loro esistenza al Master. Sarà poi
    // usata dal Master per fare in modo che, quando viene richiesta la creazione
    // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
    // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
    // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
    // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
    // Ad esempio capitava che i filtri dei presenters di dettaglio impostati a
    // DesignTime (WhereStr property) non funzionassero per questo motivo.
    FDetailDatasetContainer: TList<TioDataSetCustom>;
    // Selection related events
    FonBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FonAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FonAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
    function AdapterExists: Boolean; // IioNotifiableBindSource
    function IsActive: Boolean;
    // Async
    procedure SetAsync(const Value: Boolean);
    // LoadType
    procedure SetLoadType(const Value: TioLoadType);
    // Lazy
    procedure SetLazy(const Value: Boolean);
    // LazyProps
    procedure SetLazyProps(const Value: String);
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    // AutoRefreshOnotification
    function GetAutoRefreshOnNotification: Boolean;
    procedure SetAutoRefreshOnNotification(const Value: Boolean);
    // Editing
    function GetEditing: Boolean;
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    // ItemCount
    function GetCount: Integer;
    // MasterPropertyName
    procedure SetMasterPropertyName(const Value: String);
    function GetMasterPropertyName: String;
    // OrderBy
    procedure SetOrderBy(const Value: String);
    // Paging
    procedure SetPaging(const Value: TioCommonBSAPageManager);
    function GetPaging: TioCommonBSAPageManager;
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
    procedure Loaded; override;
    function IsMasterBS: boolean; virtual; abstract;
    function IsDetailBS: boolean; virtual; abstract;
    // InternalAdapter (there is a setter but the property must be ReadOnly)
    procedure SetActiveBindSourceAdapter(const AActiveBindSourceAdpter: IioActiveBindSourceAdapter); override;
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    // Override of some base methods
    procedure InternalPreOpen; override;
    // Public properties
    property Editing: Boolean read GetEditing; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    // Published properties
    property TypeName: String read FTypeName write SetTypeName; // published: Master
    property TypeAlias: String read FTypeAlias write SetTypeAlias; // published: Master
    property Async: Boolean read FAsync write SetAsync default False; // published: Master
    property LoadType: TioLoadType read FLoadType write SetLoadType default ltAuto; // published: Master
    property Lazy: Boolean read FLazy write SetLazy default False; // published: Master
    property LazyProps: String read FLazyProps write SetLazyProps; // published: Master
    property ViewDataType: TioViewDataType read FViewDataType write FViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr: TStrings read FWhereStr write SetWhereStr; // published: Master
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters default False; // published: Nascondere e default = false
    property OrderBy: String read FOrderBy Write SetOrderBy; // published: Master
    property MasterDataSet: TioMasterDataSet read FMasterDataSet write FMasterDataSet; // published: Detail
    property MasterPropertyName: String read GetMasterPropertyName write SetMasterPropertyName; // published: Detail
    property AutoRefreshOnNotification: Boolean read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification default True; // published: Master+Detail
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
    // Published properties: selectors
    property SelectorFor: TioDataSetCustom read FSelectorFor write FSelectorFor; // published: Master
    // Published properties: paging
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging; // published: Master
    // Published properties: selectors
    property OnReceiveSelectionCloneObject: Boolean read FOnReceiveSelectionCloneObject write FOnReceiveSelectionCloneObject default True; // published: Master+Detail
    property OnReceiveSelectionFreeObject: Boolean read FOnReceiveSelectionFreeObject write FOnReceiveSelectionFreeObject default True; // published: Master+Detail
    // Published Events: selectors
    property OnBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonBeforeSelectionObject write FonBeforeSelectionObject;
    property OnSelectionObject: TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property OnAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonAfterSelectionObject write FonAfterSelectionObject;
    property OnBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonBeforeSelectionInterface write FonBeforeSelectionInterface;
    property OnSelectionInterface: TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property OnAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonAfterSelectionInterface write FonAfterSelectionInterface;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean = False): Boolean;
    procedure RegisterDetailPresenter(const ADetailDataSet: TioDataSetCustom);
    procedure ForceDetailAdaptersCreation;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure PostIfEditing;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure CancelIfEditing;
    procedure Refresh(const ANotify: Boolean = True); overload;
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    function DataObjectAssigned: Boolean;
  end;

implementation

uses
  System.SysUtils, iORM.Utilities, iORM.Where.Factory, iORM.Exceptions,
  iORM.LiveBindings.Factory, iORM.Components.Common, System.Rtti, iORM,
  iORM.LiveBindings.CommonBSBehavior;

{ TioDataSet }

function TioDataSetCustom.AdapterExists: Boolean;
begin
  Result := CheckAdapter(False);
end;

procedure TioDataSetCustom.CancelIfEditing;
begin
  if CheckAdapter and Editing then
    Cancel;
end;

function TioDataSetCustom.CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean;
begin
  // if the adapter is not already assigned then create it
  if ACreateIfNotAssigned and (GetActiveBindSourceAdapter = nil) then
    _CreateAdapter(nil, True);
  // Result
  Result := (GetActiveBindSourceAdapter <> nil);
end;

procedure TioDataSetCustom.ClearDataObject;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.ClearDataObject;
end;

constructor TioDataSetCustom.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := True;
  FAutoRefreshOnNotification := True;
  FAsync := False;
  FLoadType := ltAuto;
  FLazy := False;
  FLazyProps := '';
  FViewDataType := TioViewDataType.dtListOfObjects;
  FWhere := nil;
  FWhereDetailsFromDetailAdapters := False;
  // Selectors
  FSelectorFor := nil;
  FOnReceiveSelectionCloneObject := True;
  FOnReceiveSelectionFreeObject := True;
  // Questà è una collezione dove eventuali ModelPresenters di dettaglio
  // si registrano per rendere nota la loro esistenza al Master. Sarà poi
  // usata dal Master per fare in modo che, quando viene richiesta la creazione
  // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
  // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
  // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
  // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
  // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
  // DesignTime (WhereStr property) non funzionassero per questo motivo.
  FDetailDatasetContainer := nil;
  // Page manager
  FPaging := TioCommonBSAPageManager.Create(
    procedure
    begin
      if CheckAdapter then
        GetActiveBindSourceAdapter.LoadPage;
    end);
  // Set even an onChange event handler (always after the creation of the PageManager)
  FWhereStr := TStringList.Create;
  SetWhereStr(FWhereStr); // set TStringList.onChange event handler
end;

function TioDataSetCustom.Current: TObject;
begin
  if CheckAdapter(True) then
    Result := GetActiveBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioDataSetCustom.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioUtilities.CastObjectToGeneric<T>(LCurrent);
end;

function TioDataSetCustom.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetailBS then
    Result := GetActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioDataSetCustom.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

function TioDataSetCustom.DataObject: TObject;
begin
  // Result := nil;
  Result := GetActiveBindSourceAdapter.DataObject;
end;

function TioDataSetCustom.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioDataSetCustom.DataObjectAssigned: Boolean;
begin
  if CheckAdapter then
    Result := Assigned(GetActiveBindSourceAdapter.DataObject)
  else
    Result := False;
end;

destructor TioDataSetCustom.Destroy;
begin
  FWhereStr.Free;
  // If the DetailPresenterContainer was created then destroy it
  if Assigned(FDetailDatasetContainer) then
    FDetailDatasetContainer.Free;
  // Destroy paging object
  FPaging.Free;
  // Destroy the internal adapter
  if GetActiveBindSourceAdapter <> nil then
    GetActiveBindSourceAdapter.Free;
  inherited;
end;

procedure TioDataSetCustom.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionInterface) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionInterface) then
    FonBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
var
  LPreviousCurrentObj: TObject;
begin
  LPreviousCurrentObj := Current;
  if FOnReceiveSelectionCloneObject then
    ASelected := io.Load(ASelected.ClassName).ByID(TioUtilities.ExtractOID(ASelected)).ToObject;
  if Assigned(FonSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
  if FOnReceiveSelectionFreeObject and (FViewDataType = TioViewDataType.dtSingleObject) and (LPreviousCurrentObj <> nil) then
    LPreviousCurrentObj.Free;
end;

procedure TioDataSetCustom.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioDataSetCustom.ForceDetailAdaptersCreation;
var
  LDetailDataSet: TioDataSetCustom;
begin
  if Assigned(FDetailDatasetContainer) then
    for LDetailDataSet in FDetailDatasetContainer do
      LDetailDataSet.CheckAdapter(True);
end;

function TioDataSetCustom.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.ioAutoPost
  else
    Result := FAutoPost;
end;

function TioDataSetCustom.GetAutoRefreshOnNotification: Boolean;
begin
  Result := FAutoRefreshOnNotification;
end;

function TioDataSetCustom.GetCount: Integer;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioDataSetCustom.GetEditing: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State in seEditModes
  else
    Result := False
end;

function TioDataSetCustom.GetIsInterfacePresenting: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.IsInterfaceBSA
  else
    Result := TioUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioDataSetCustom.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioDataSetCustom.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioDataSetCustom.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

function TioDataSetCustom.GetWhere: IioWhere;
begin
  // If the adapter exists the return the property of the adapter
  // else return the Self.FWhere
  if CheckAdapter then
  begin
    Result := GetActiveBindSourceAdapter.ioWhere;
    Exit;
  end;
  // if not already assigned then create it (così lo crea solo se serve
  // davvero altrimenti no)
  if not Assigned(FWhere) then
    FWhere := TioWhereFactory.NewWhereWithPaging(FPaging);
  // Return the Where instance
  Result := FWhere;
end;

procedure TioDataSetCustom.InternalPreOpen;
begin
  if not CheckAdapter(True) then
    raise EioException.Create(ClassName, 'InternalPreOpen', 'There was some problem creating the ActiveBindSourceAdapter');
  GetActiveBindSourceAdapter.Active := True;
  inherited;
end;

function TioDataSetCustom.IsActive: Boolean;
begin
  Result := Active;
end;

procedure TioDataSetCustom.Loaded;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not(csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // REGISTER ITSELF AS DETAIL MODEL PRESENTER (IF IT IS A DETAIL) INTO THE MASTER PRESENTER
  // ===========================================================================
  if IsDetailBS then
    MasterDataSet.RegisterDetailPresenter(Self);
  // ===========================================================================

  inherited;
end;

procedure TioDataSetCustom.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  TioCommonBSBehavior.Notify(Sender, Self, ANotification);
end;

procedure TioDataSetCustom.PersistAll;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistAll;
end;

procedure TioDataSetCustom.PersistCurrent;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistCurrent;
end;

procedure TioDataSetCustom.PostIfEditing;
begin
  if CheckAdapter and Editing then
    Post;
end;

procedure TioDataSetCustom.Refresh(const ANotify: Boolean = True);
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Refresh(ANotify);
end;

procedure TioDataSetCustom.RegisterDetailPresenter(const ADetailDataSet: TioDataSetCustom);
begin
  if not Assigned(FDetailDatasetContainer) then
    FDetailDatasetContainer := TList<TioDataSetCustom>.Create;
  FDetailDatasetContainer.Add(ADetailDataSet);
end;

procedure TioDataSetCustom.SelectCurrent(ASelectionType: TioSelectionType);
begin
  if IsInterfacePresenting then
    TioCommonBSBehavior.Select<IInterface>(Self, FSelectorFor, CurrentAs<IInterface>, ASelectionType)
  else
    TioCommonBSBehavior.Select<TObject>(Self, FSelectorFor, Current, ASelectionType);
end;

procedure TioDataSetCustom.SetAsync(const Value: Boolean);
begin
  FAsync := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioAsync := Value;
end;

procedure TioDataSetCustom.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
end;

procedure TioDataSetCustom.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
end;

procedure TioDataSetCustom.SetLoadType(const Value: TioLoadType);
begin
  FLoadType := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.LoadType := Value;
end;

procedure TioDataSetCustom.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioAutoPost := Value;
end;

procedure TioDataSetCustom.SetAutoRefreshOnNotification(const Value: Boolean);
begin
  FAutoRefreshOnNotification := Value;
end;

procedure TioDataSetCustom.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  if not Assigned(ADataObject) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
    // Create the BSA
    _CreateAdapter(ADataObject, AOwnsObject)
  else
    // Set the data object into the BSA
    GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
end;

procedure TioDataSetCustom.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  if not Assigned(ADataObject) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
    // Create the BSA
    // NB: Nel caso in cui si sita impostando il DataObject ma il BSA non era ancora creato lo crea (il BSA)
    // usando il ClassName dell'oggetto; in questo modo siamo sicuri che abbiamo il BSA più
    // adatto e non uno che magari è più generico e a cui mancano alcune proprietà (è successo).
    _CreateAdapter(ADataObject as TObject, AOwnsObject)
  else
    // Set the data object into the BSA
    GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
end;

procedure TioDataSetCustom.SetMasterPropertyName(const Value: String);
begin
  FMasterPropertyName := Trim(Value);
end;

procedure TioDataSetCustom.SetActiveBindSourceAdapter(const AActiveBindSourceAdpter: IioActiveBindSourceAdapter);
begin
  inherited;
  // Init the BSA
  GetActiveBindSourceAdapter.ioAsync := FAsync;
  GetActiveBindSourceAdapter.ioAutoPost := FAutoPost;
  GetActiveBindSourceAdapter.LoadType := FLoadType;
  GetActiveBindSourceAdapter.Lazy := FLazy;
  GetActiveBindSourceAdapter.LazyProps := FLazyProps;
  GetActiveBindSourceAdapter.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
  GetActiveBindSourceAdapter.ioWhere := FWhere;
  // Register itself for notifications from BindSourceAdapter
  GetActiveBindSourceAdapter.SetBindSource(Self);
end;

procedure TioDataSetCustom.SetOrderBy(const Value: String);
begin
  FOrderBy := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioWhere.SetOrderBySql(Value);
end;

procedure TioDataSetCustom.SetPaging(const Value: TioCommonBSAPageManager);
begin
  // In reality this property would be read-only but if I left it read-only
  //  then it no longer writes me the values of the sub-properties in the DFM file.
  //  So I also put the set method where, however, I raise an exception if someone
  //  tries to set a value.
  raise EioException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioDataSetCustom.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioDataSetCustom.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioTypeName := Value;
end;

procedure TioDataSetCustom.SetWhere(const AWhere: IioWhere);
begin
  AWhere.SetPagingObj(FPaging); // Inject paging object spscified in BindSource or ModelPresenter
  FWhere := AWhere;
  // Update the adapter where in the BSAdapter if exist
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioWhere := AWhere;
end;

procedure TioDataSetCustom.SetWhereDetailsFromDetailAdapters(const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioDataSetCustom.SetWhereStr(const Value: TStrings);
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

procedure TioDataSetCustom.WhereOnChangeEventHandler(Sender: TObject);
begin
  SetWhere(TioWhereFactory.NewWhereWithPaging(FPaging).Add(FWhereStr.Text));
end;

procedure TioDataSetCustom._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If an adapter already exists then raise an exception
  if CheckAdapter then
    raise EioException.Create(ClassName, '_CreateAdapter', 'ActiveBindSourceAdapter already exists.');
  // if the TypeName is empty then set it
//  if TypeName.IsEmpty then
//    raise EioException.Create(ClassName, '_CreateAdapter', '"TypeName" value is not valid.');
  // If the property MasterModelPresenter is assigned then retrieve
  // the DetailBindSourceAdapter from it
  if Assigned(MasterDataSet) then
    SetActiveBindSOurceAdapter(TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(nil, MasterDataSet.GetActiveBindSourceAdapter, MasterPropertyName))
    // else create the BSA from TypeName & TypeAlias
  else
  begin
    // Get the ActiveBindSourceAdapter
    SetActiveBindSOurceAdapter(TioLiveBindingsFactory.GetBSA(nil, TypeName, TypeAlias, Where, ViewDataType, ADataObject, AOwnsObject));
    // Force the creation of all the detail adapters (if exists)
    // NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
    // funzionavano perchè al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
    // stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
    // del Master.
    ForceDetailAdaptersCreation;
  end;
end;

end.
