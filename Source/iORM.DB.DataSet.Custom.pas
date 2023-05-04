unit iORM.DB.DataSet.Custom;

interface

uses
  iORM.DB.DataSet.Base, iORM.CommonTypes, System.Classes,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.CommonBSAPaging, iORM.Where.Interfaces,
  Data.Bind.ObjectScope, System.Generics.Collections,
  iORM.MVVM.ViewContextProvider, iORM.StdActions.Interfaces;

type

  TioDataSetCustom = class abstract(TioBSABaseDataSet, IioNotifiableBindSource, IioStdActionTargetBindSource)
  private
    FAsDefault: Boolean;
    FTypeName: String;
    FTypeAlias: String;
    FLoadType: TioLoadType;
    FLazy: Boolean;
    FLazyProps: String;
    FAsync: Boolean;
    FTypeOfCollection: TioTypeOfCollection; // Renderlo automatico??? (rilevamento se è una lista con DuckTyping)
    FMasterBindSource: IioNotifiableBindSource;
    FMasterPropertyName: String;
    FWhere: IioWhere; // Istanza temporanea solo fintanto che non c'è il BSA
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FAutoRefreshOnNotification: Boolean;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    FVirtualFields: Boolean;
    // Selectors
    FSelectorFor: IioNotifiableBindSource;
    FOnReceiveSelectionCloneObject: Boolean;
    FOnReceiveSelectionFreeObject: Boolean;
    // Questà è una collezione dove eventuali DataSet di dettaglio
    // si registrano per rendere nota la loro esistenza al Master. Sarà poi
    // usata dal Master per fare in modo che, quando viene richiesta la creazione
    // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
    // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
    // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
    // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
    // Ad esempio capitava che i filtri dei presenters di dettaglio impostati a
    // DesignTime (WhereStr property) non funzionassero per questo motivo.
    FDetailBindSourceContainer: TList<IioNotifiableBindSource>;
    // Selection related events
    FonBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FonAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FonAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
    function IsActive: Boolean; // IioStdActionTargetBindSource
    procedure OpenCLoseDetails(const AActive: Boolean);
    // AsDefault
    function GetAsDefault: Boolean;
    procedure SetAsDefault(const Value: Boolean);
    procedure InitAsDefaultOnCreate;
    // Async
    procedure SetAsync(const Value: Boolean);
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
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    // MasterDataSet
    procedure SetMasterBindSource(const Value: IioNotifiableBindSource); virtual;
    // MasterPropertyName
    procedure SetMasterPropertyName(const Value: String);
    function GetMasterPropertyName: String;
    // OnReceiveSelectionCloneObject
    function GetOnReceiveSelectionCloneObject: Boolean;
    procedure SetOnReceiveSelectionCloneObject(const Value: Boolean);
    // GetOnReceiveSelectionFreeObject
    function GetOnReceiveSelectionFreeObject: Boolean;
    procedure SetOnReceiveSelectionFreeObject(const Value: Boolean);
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
    function GetTypeName: String;
    // TypeOfCollection
    function GetTypeOfCollection: TioTypeOfCollection;
    procedure SetTypeOfCollection(const Value: TioTypeOfCollection);
    // VirtualFields
    function GetVirtualFields: Boolean;
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    // WhereDetailsFromDetailAdapters
    procedure SetWhereDetailsFromDetailAdapters(const Value: Boolean);
    // WhereStr
    procedure SetWhereStr(const Value: TStrings);
    procedure WhereOnChangeEventHandler(Sender: TObject);
    // SelectorFor
    function GetSelectorFor: IioNotifiableBindSource;
    procedure SetSelectorFor(const ATargetBindSource: IioNotifiableBindSource);
  protected
    procedure Loaded; override;
    function GetName: String;
    procedure DoAfterOpen; override;
    procedure DoBeforeClose; override;
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
    // LoadType
    procedure SetLoadType(const Value: TioLoadType); virtual;
    function GetLoadType: TioLoadType;
    // Public properties
    property Editing: Boolean read GetEditing; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    property ItemIndex: Integer read GetItemIndex write SetItemIndex; // Public: Master+Detail
    // Published properties
    property AsDefault: Boolean read GetAsDefault write SetAsDefault; // Published: Master  // non mettere default
    property TypeName: String read GetTypeName write SetTypeName; // published: Master
    property TypeAlias: String read FTypeAlias write SetTypeAlias; // published: Master
    property Async: Boolean read FAsync write SetAsync default False; // published: Master
    property LoadType: TioLoadType read GetLoadType write SetLoadType default ltManual; // published: Master
    property Lazy: Boolean read FLazy write SetLazy default False; // published: Master
    property LazyProps: String read FLazyProps write SetLazyProps; // published: Master
    property TypeOfCollection: TioTypeOfCollection read GetTypeOfCollection write SetTypeOfCollection default tcList;
    property VirtualFields: Boolean read GetVirtualFields write FVirtualFields default False;
    // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr: TStrings read FWhereStr write SetWhereStr; // published: Master
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters default False;
    // published: Nascondere e default = false
    property OrderBy: String read FOrderBy Write SetOrderBy; // published: Master
    property MasterBindSource: IioNotifiableBindSource read FMasterBindSource write SetMasterBindSource; // published: Detail
    property MasterPropertyName: String read GetMasterPropertyName write SetMasterPropertyName; // published: Detail
    property AutoRefreshOnNotification: Boolean read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification default True; // published: Master+Detail
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
    // Published properties: selectors
    property SelectorFor: IioNotifiableBindSource read GetSelectorFor write SetSelectorFor; // published: Master
    // Published properties: paging
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging; // published: Master
    // Published properties: selectors
    property OnReceiveSelectionCloneObject: Boolean read GetOnReceiveSelectionCloneObject write SetOnReceiveSelectionCloneObject default True;
    // published: Master+Detail
    property OnReceiveSelectionFreeObject: Boolean read GetOnReceiveSelectionFreeObject write SetOnReceiveSelectionFreeObject default True;
    // published: Master+Detail
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
    function IsMasterBS: Boolean; virtual; abstract;
    function IsDetailBS: Boolean; virtual; abstract;
    function IsFromBSLoadType: Boolean;
    function CheckAdapter: Boolean; overload;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean; overload;
    function CheckActiveAdapter: Boolean;
    procedure RegisterDetailBindSource(const ADetailBindSource: IioNotifiableBindSource);
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
    function CanDoSelection: Boolean;
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // Show current record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const AVVMAlias: String = ''); overload;
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show each record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
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

procedure TioDataSetCustom.CancelIfEditing;
begin
  if CheckAdapter and Editing then
    Cancel;
end;

function TioDataSetCustom.CanDoSelection: Boolean;
begin
  Result := IsActive and (Current <> nil) and Assigned(FSelectorFor) and FSelectorFor.IsActive and
    FSelectorFor.GetActiveBindSourceAdapter.Notify(Self, TioBSNotification.Create(TioBSNotificationType.ntCanReceiveSelection));
end;

function TioDataSetCustom.CheckAdapter: Boolean;
begin
  Result := CheckAdapter(False);
end;

function TioDataSetCustom.CheckActiveAdapter: Boolean;
begin
  Result := GetActiveBindSourceAdapter <> nil;
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
  FLoadType := ltManual;
  FLazy := False;
  FLazyProps := '';
  FTypeOfCollection := TioTypeOfCollection.tcList;
  FWhere := nil;
  FWhereDetailsFromDetailAdapters := False;
  FVirtualFields := False;
  // Selectors
  FSelectorFor := nil;
  FOnReceiveSelectionCloneObject := True;
  FOnReceiveSelectionFreeObject := True;
  // Questà è una collezione dove eventuali DataSet di dettaglio
  // si registrano per rendere nota la loro esistenza al Master. Sarà poi
  // usata dal Master per fare in modo che, quando viene richiesta la creazione
  // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
  // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
  // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
  // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
  // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
  // DesignTime (WhereStr property) non funzionassero per questo motivo.
  FDetailBindSourceContainer := nil;
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  InitAsDefaultOnCreate;
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
  // If the DetailDataSetContainer was created then destroy it
  if Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer.Free;
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

procedure TioDataSetCustom.DoAfterOpen;
begin
  inherited;
  OpenCLoseDetails(True);
end;

procedure TioDataSetCustom.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionInterface) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoBeforeClose;
begin
  inherited;
  OpenCLoseDetails(False);
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
begin
  if Assigned(FonSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
end;

procedure TioDataSetCustom.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioDataSetCustom.ForceDetailAdaptersCreation;
var
  LDetailBindSource: IioNotifiableBindSource;
begin
  if Assigned(FDetailBindSourceContainer) then
    for LDetailBindSource in FDetailBindSourceContainer do
      LDetailBindSource.CheckAdapter(True);
end;

function TioDataSetCustom.GetAsDefault: Boolean;
begin
  Result := FAsDefault;
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

function TioDataSetCustom.GetItemIndex: Integer;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.ItemIndex
  else
    Result := 0;
end;

function TioDataSetCustom.GetLoadType: TioLoadType;
begin
  Result := FLoadType;
end;

function TioDataSetCustom.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioDataSetCustom.GetName: String;
begin
  Result := Name;
end;

function TioDataSetCustom.GetOnReceiveSelectionCloneObject: Boolean;
begin
  Result := FOnReceiveSelectionCloneObject;
end;

function TioDataSetCustom.GetOnReceiveSelectionFreeObject: Boolean;
begin
  Result := FOnReceiveSelectionFreeObject;
end;

function TioDataSetCustom.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioDataSetCustom.GetSelectorFor: IioNotifiableBindSource;
begin
  Result := FSelectorFor;
end;

function TioDataSetCustom.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

function TioDataSetCustom.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioDataSetCustom.GetTypeOfCollection: TioTypeOfCollection;
begin
  Result := FTypeOfCollection;
end;

function TioDataSetCustom.GetVirtualFields: Boolean;
begin
  Result := FVirtualFields;
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

procedure TioDataSetCustom.InitAsDefaultOnCreate;
begin
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  // NB: The second parameter is FAsDefault private field to avoid deadlock
  TioCommonBSBehavior.InitAsDefaultOnCreate(Self, FAsDefault);
end;

procedure TioDataSetCustom.InternalPreOpen;
begin
  // Check if the operation (Open) is allowed
  TioCommonBSBehavior.CheckForOpen(Self, LoadType);
  if not CheckAdapter(True) then
    raise EioException.Create(ClassName, 'InternalPreOpen', 'There was some problem creating the ActiveBindSourceAdapter');
  GetActiveBindSourceAdapter.Active := True;
  inherited;
end;

function TioDataSetCustom.IsActive: Boolean;
begin
  Result := Active;
end;

function TioDataSetCustom.IsFromBSLoadType: Boolean;
begin
  Result := TioCommonBSBehavior.CheckIfLoadTypeIsFromBS(FLoadType);
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
  if IsDetailBS and not(csDesigning in ComponentState) then
  begin
    if Assigned(MasterBindSource) then
      MasterBindSource.RegisterDetailBindSource(Self);
    // ----- OLD CODE -----
    // if not Assigned(FMasterBindSource) then
    // raise EioException.Create(ClassName, 'Loaded', Format('The "MasterDataSet" property has not been set in the component "%s".' +
    // #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the property and try again.', [Name]));
    // ----- OLD CODE -----
  end;
  // ===========================================================================

  inherited;
end;

procedure TioDataSetCustom.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  TioCommonBSBehavior.Notify(Sender, Self, ANotification);
end;

procedure TioDataSetCustom.OpenCLoseDetails(const AActive: Boolean);
var
  LBindSource: IioNotifiableBindSource;
begin
  if Assigned(FDetailBindSourceContainer) then
    for LBindSource in FDetailBindSourceContainer do
      if AActive then
        LBindSource.Open
      else
        LBindSource.Close;
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

procedure TioDataSetCustom.RegisterDetailBindSource(const ADetailBindSource: IioNotifiableBindSource);
begin
  if not Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer := TList<IioNotifiableBindSource>.Create;
  FDetailBindSourceContainer.Add(ADetailBindSource);
end;

procedure TioDataSetCustom.SelectCurrent(ASelectionType: TioSelectionType);
begin
  // C'era un problema se il target è un BS che espone un singolo oggetto e in
  // precedenza era stato impostato il suo dataObject a nil perchè in questo caso negli
  // ObjectBSA il ABSA si disattiva (Active = False) e quindi poi quando faceva
  // il SetDataObject sul TargetBSA dava un errore perchè non era attivo.
  if not FSelectorFor.IsActive then
    FSelectorFor.Open;
  if IsInterfacePresenting then
    TioCommonBSBehavior.Select<IInterface>(Self, FSelectorFor, CurrentAs<IInterface>, ASelectionType)
  else
    TioCommonBSBehavior.Select<TObject>(Self, FSelectorFor, Current, ASelectionType);
end;

procedure TioDataSetCustom.SetAsDefault(const Value: Boolean);
begin
  TioCommonBSBehavior.SetAsDefaultPropertyOfAllBindSourcesToFalse(Owner, Value);
  FAsDefault := Value;
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
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.Lazy := Value;
end;

procedure TioDataSetCustom.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.LazyProps := Value;
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
  // Check if the operation (SetDataObject) is allowed
  TioCommonBSBehavior.CheckForSetDataObject(Self, LoadType, ADataObject);
  // If the BS is active then set the DataObject
  if IsActive then
  begin
    // If the new Dataobject is nil then clear it into the BSA and close the BindSource
    if not Assigned(ADataObject) then
      ClearDataObject;
    // Get che ABSA
    if not CheckAdapter then
      _CreateAdapter(ADataObject, AOwnsObject)
    else
      GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
  end
  // If the BindSource is not active it checks if the new DataObject is assigned,
  //  if it is assigned then automatically activated the BindSource otherwise exits immediately
  //  because it does not need to do anything (the BindSource is already closed and if the new
  //  DataObject is being set to nil...)
  // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse già) perchè
  //  altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
  // NB: Se il BS non è mai stato attivo prima allora crea anche il relativo ActiveBindSourceAdapter
  else
  begin
    if Assigned(ADataObject) then
    begin
      if GetActiveBindSourceAdapter = nil then
        _CreateAdapter(ADataObject, AOwnsObject);
      Open;
    end;
  end;
// ----- OLD CODE FROM 22/04/2023 -----
//  // If the BindSource is not active it checks if the new DataObject is assigned,
//  // if it is assigned then automatically activated the BindSource otherwise exits immediately
//  // because it does not need to do anything (the BindSource is already closed and if the new
//  // DataObject is being set to nil...)
//  // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse già) perchè
//  // altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
//  if not IsActive then
//    if Assigned(ADataObject) then
//      Open
//    else
//      Exit;
//  // Some checks
//  TioCommonBSBehavior.CheckForSetDataObject(Self, LoadType, ADataObject);
//  // If the new Dataobject is nil then clear it into the BSA and close the BindSource
//  if not Assigned(ADataObject) then
//    ClearDataObject;
//  // if the adapter is not already assigned then create it
//  if not CheckAdapter then
//    // Create the BSA
//    _CreateAdapter(ADataObject, AOwnsObject)
//  else
//    // Set the data object into the BSA
//    GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
// ----- OLD CODE FROM 22/04/2023 -----
end;

procedure TioDataSetCustom.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  // Check if the operation (SetDataObject) is allowed
  TioCommonBSBehavior.CheckForSetDataObject(Self, LoadType, ADataObject as TObject);
  // If the BS is active then set the DataObject
  if IsActive then
  begin
    // If the new Dataobject is nil then clear it into the BSA and close the BindSource
    if not Assigned(ADataObject) then
      ClearDataObject;
    // Get che ABSA
    if not CheckAdapter then
      _CreateAdapter(ADataObject as TObject, AOwnsObject)
    else
      GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
  end
  // If the BindSource is not active it checks if the new DataObject is assigned,
  //  if it is assigned then automatically activated the BindSource otherwise exits immediately
  //  because it does not need to do anything (the BindSource is already closed and if the new
  //  DataObject is being set to nil...)
  // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse già) perchè
  //  altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
  // NB: Se il BS non è mai stato attivo prima allora crea anche il relativo ActiveBindSourceAdapter
  else
  begin
    if Assigned(ADataObject) then
    begin
      if GetActiveBindSourceAdapter = nil then
        _CreateAdapter(ADataObject as TObject, AOwnsObject);
      Open;
    end;
  end;
// ----- OLD CODE FROM 22/04/2023 -----
//  // If the BindSource is not active it checks if the new DataObject is assigned,
//  // if it is assigned then automatically activated the BindSource otherwise exits immediately
//  // because it does not need to do anything (the BindSource is already closed and if the new
//  // DataObject is being set to nil...)
//  // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse già) perchè
//  // altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
//  if not IsActive then
//    if Assigned(ADataObject) then
//      Open
//    else
//      Exit;
//  // Some checks
//  TioCommonBSBehavior.CheckForSetDataObject(Self, LoadType, ADataObject as TObject);
//  // If the new Dataobject is nil then clear it into the BSA and close the BindSource
//  if not Assigned(ADataObject) then
//    ClearDataObject;
//  // if the adapter is not already assigned then create it
//  if not CheckAdapter then
//    // Create the BSA
//    // NB: Nel caso in cui si sita impostando il DataObject ma il BSA non era ancora creato lo crea (il BSA)
//    // usando il ClassName dell'oggetto; in questo modo siamo sicuri che abbiamo il BSA più
//    // adatto e non uno che magari è più generico e a cui mancano alcune proprietà (è successo).
//    _CreateAdapter(ADataObject as TObject, AOwnsObject)
//  else
//    // Set the data object into the BSA
//    GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
// ----- OLD CODE FROM 22/04/2023 -----
end;

procedure TioDataSetCustom.SetItemIndex(const Value: Integer);
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.ItemIndex := Value
  else
    raise EioException.Create(Self.ClassName, 'SetItemindex', 'Unassigned BindSourceAdapter');
end;

procedure TioDataSetCustom.SetMasterBindSource(const Value: IioNotifiableBindSource);
begin
  FMasterBindSource := Value;
end;

procedure TioDataSetCustom.SetMasterPropertyName(const Value: String);
begin
  FMasterPropertyName := Trim(Value);
end;

procedure TioDataSetCustom.SetActiveBindSourceAdapter(const AActiveBindSourceAdpter: IioActiveBindSourceAdapter);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  inherited;
  LActiveBSA := GetActiveBindSourceAdapter;
  // Init the BSA
  LActiveBSA.ioAsync := FAsync;
  LActiveBSA.ioAutoPost := FAutoPost;
  LActiveBSA.LoadType := FLoadType;
  LActiveBSA.Lazy := FLazy;
  LActiveBSA.LazyProps := FLazyProps;
  LActiveBSA.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
  LActiveBSA.ioWhere := GetWhere; // Do not directly access to the FWhere field here
  // LActiveBSA.ioWhere := FWhere;
  // Register itself for notifications from BindSourceAdapter
  LActiveBSA.SetBindSource(Self);
  FTypeOfCollection := LActiveBSA.TypeOfCollection;
end;

procedure TioDataSetCustom.SetOnReceiveSelectionCloneObject(const Value: Boolean);
begin
  FOnReceiveSelectionCloneObject := Value;
end;

procedure TioDataSetCustom.SetOnReceiveSelectionFreeObject(const Value: Boolean);
begin
  FOnReceiveSelectionFreeObject := Value;
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
  // then it no longer writes me the values of the sub-properties in the DFM file.
  // So I also put the set method where, however, I raise an exception if someone
  // tries to set a value.
  raise EioException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioDataSetCustom.SetSelectorFor(const ATargetBindSource: IioNotifiableBindSource);
begin
  FSelectorFor := ATargetBindSource;
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

procedure TioDataSetCustom.SetTypeOfCollection(const Value: TioTypeOfCollection);
begin
  FTypeOfCollection := Value;
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

procedure TioDataSetCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AViewContext, AVVMAlias);
end;

procedure TioDataSetCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AVVMAlias);
end;

procedure TioDataSetCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AVCProvider, AVVMAlias);
end;

procedure TioDataSetCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AViewContext, AVVMAlias);
end;

procedure TioDataSetCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AVVMAlias);
end;

procedure TioDataSetCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AVCProvider, AVVMAlias);
end;

procedure TioDataSetCustom.WhereOnChangeEventHandler(Sender: TObject);
begin
  SetWhere(TioWhereFactory.NewWhereWithPaging(FPaging).Add(FWhereStr.Text));
end;

procedure TioDataSetCustom._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If an adapter already exists then raise an exception
  if CheckAdapter then
    raise EioException.Create(ClassName, '_CreateAdapter', Format('ActiveBindSourceAdapter already exists in component "%s".', [Name]));
  // If it is a detail bind source then get the detail BSA from the master bind source,
  // else if it is a master bind source but load type property is set to ltFromBSAsIs, ltFromBSReload or ltFromBSReloadNewInstance
  // then get the natural BSA from the source bind source else it is a master bind source then get the normal BSA.
  if IsDetailBS and not MasterPropertyName.IsEmpty then
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(nil, Name, MasterBindSource, MasterPropertyName))
  else if IsFromBSLoadType or (IsDetailBS and MasterPropertyName.IsEmpty) then
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(nil, Name, MasterBindSource))
  else
  begin
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetBSA(nil, Name, TypeName, TypeAlias, TioWhereFactory.NewWhereWithPaging(FPaging).Add(WhereStr.Text)
      ._OrderBy(FOrderBy), TypeOfCollection, ADataObject, AOwnsObject));
    // Force the creation of all the detail adapters (if exists)
    // NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
    // funzionavano perchè al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
    // stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
    // del Master.
    ForceDetailAdaptersCreation;
  end;
end;

end.
