unit iORM.MVVM.Components.ModelPresenter;

interface

uses
  System.Classes, iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.ObjectScope,
  System.Generics.Collections, iORM.MVVM.Components.ViewContextProvider,
  System.Rtti;

type

  TioModelPresenter = class(TComponent, IioNotifiableBindSource)
  private
    FAsDefault: Boolean;
    FonNotify: TioBSANotificationEvent;
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    FTypeName, FTypeAlias: String;
    FAsync: Boolean;
    FAutoLoadData: Boolean;
    FAutoPersist: Boolean;
    FViewDataType: TioViewDataType;
    FWhere: IioWhere;  // Istanza temporanea solo fintanto che non c'è il BSA
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FMasterPresenter: TioModelPresenter;
    FMasterPropertyName: String;
    FAutoRefreshOnNotification: TioAutoRefreshType;
    FAutoPost: Boolean;
    FSelectorFor: TioModelPresenter;
    // Questà è una collezione dove eventuali ModelPresenters di dettaglio
    //  si registrano per rendere nota la loro esistenza al Master. Sarà poi
    //  usata dal Master per fare in modo che, quando viene richiesta la creazione
    //  del suo BindSourceAdapter (del master), venga scatenata anche la creazione
    //  anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
    //  registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
    //  al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
    //  Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
    //  DesignTime (WhereStr property) non funzionassero per questo motivo.
    FDetailPresentersContainer: TList<TioModelPresenter>;
    // Questo è un riferimento di tipo interfaccia e serve solo per
    //  mantenere in vita l'oggetto
    FDummyInterfaceRef: IInterface;
    // Selection related events
    FonBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FonAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FonAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    // Methods
    procedure _CreateAdapter(const ADataObject:TObject);
    procedure DoNotify(ANotification:IioBSANotification);
    procedure WhereOnChangeEventHandler(Sender:TObject);
    procedure SetAutoLoadData(const Value: Boolean);
  protected
    procedure Loaded; override;
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected:TObject; var ASelectionType:TioSelectionType); overload;
    procedure DoSelection(var ASelected:TObject; var ASelectionType:TioSelectionType; var ADone:Boolean); overload;
    procedure DoAfterSelection(var ASelected:TObject; var ASelectionType:TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected:IInterface; var ASelectionType:TioSelectionType); overload;
    procedure DoSelection(var ASelected:IInterface; var ASelectionType:TioSelectionType; var ADone:Boolean); overload;
    procedure DoAfterSelection(var ASelected:IInterface; var ASelectionType:TioSelectionType); overload;
    // AsDefault
    procedure SetAsDefault(const Value: Boolean);
    procedure InitAsDefaultOnCreate;
    // TypeName
    procedure SetTypeName(const Value: String);
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    // BindSourceAdapter
    procedure SetBindSourceAdapter(const Value: TBindSourceAdapter); overload;
    procedure SetBindSourceAdapter(const Value: IioActiveBindSourceAdapter); overload;
    function GetBindSourceAdapter: IioActiveBindSourceAdapter;
    // OrderBy
    procedure SetOrderBy(const Value: String);
    // Where
    procedure SetWhere(const Value: IioWhere);
    function GetWhere: IioWhere;
    // WhereDetailsFromDetailAdapters
    procedure SetWhereDetailsFromDetailAdapters(const Value: Boolean);
    // WhereStr
    procedure SetWhereStr(const Value: TStrings);
    // State
    function GetState: TBindSourceAdapterState;
    // IsDetail
    function GetIsDetail: Boolean;
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    // Editing
    function GetEditing: Boolean;
    // ItemCount
    function GetCount: Integer;
    // Async
    procedure SetAsync(const Value: Boolean);
    // AutoPersist
    procedure SetAutoPersist(const Value: Boolean);
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function IsValidForDependencyInjectionLocator(const AModelPresenter:TioModelPresenter; const ARaiseExceptions:Boolean): Boolean;
    function CheckAdapter(const ACreateIfNotAssigned:Boolean = False): Boolean;
    procedure Notify(const Sender:TObject; const ANotification:IioBSANotification);
//    procedure SetMasterBindSourceAdapter(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String='');
    procedure RegisterDetailPresenter(const ADetailPresenter:TioModelPresenter);
    procedure ForceDetailAdaptersCreation;
    procedure DeleteListViewItem(const AItemIndex:Integer; const ADelayMilliseconds:integer=100);
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    procedure Next;
    procedure Prior;
    procedure First;
    procedure Last;
    procedure Edit(AForce: Boolean = False);
    procedure Post;
    procedure PostIfEditing;
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    procedure Refresh(const AReloadData:Boolean); overload;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure Append; overload;
    procedure Append(AObject:TObject); overload;
    procedure Append(AObject:IInterface); overload;
    procedure Insert; overload;
    procedure Insert(AObject:TObject); overload;
    procedure Insert(AObject:IInterface); overload;
    procedure Delete;
    procedure Cancel;
    procedure CancelIfEditing;
    function GetDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
    function GetNaturalObjectBindSourceAdapter(const AOwner:TComponent): IioActiveBindSourceAdapter;
    procedure Select<T>(AInstance:T; ASelectionType:TioSelectionType=TioSelectionType.stAppend);
    procedure SelectCurrent<T>(ASelectionType:TioSelectionType=TioSelectionType.stAppend);
    // Show current record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowCurrent(const AAlias:String=''; const AVCProviderName:String=''); overload;
    procedure ShowCurrent(const AVCProvider:TioViewContextProvider; const AAlias:String=''); overload;
    procedure ShowCurrent(const AViewContext:TComponent; const AAlias:String=''); overload;
    // Show each record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowEach(const AAlias:String=''; const AVCProviderName:String=''); overload;
    procedure ShowEach(const AVCProvider:TioViewContextProvider; const AAlias:String=''); overload;
    procedure ShowEach(const AViewContext:TComponent; const AAlias:String=''); overload;
    // ----------------------------------------------------------------------------------------------------------------------------
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    procedure SetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    function DataObjectAssigned: Boolean;
    // Properties
    property BindSourceAdapter:IioActiveBindSourceAdapter read GetBindSourceAdapter write SetBindSourceAdapter;
    property Where:IioWhere read GetWhere write SetWhere;
    property State: TBindSourceAdapterState read GetState;
    property ItemCount: Integer read GetCount;
    property Editing:Boolean read GetEditing;
    property IsDetail:Boolean read GetIsDetail;
    property IsInterfacePresenting:Boolean read GetIsInterfacePresenting;
  published
    // Events
    property OnNotify:TioBSANotificationEvent read FonNotify write FonNotify;
    property OnBeforeSelectionObject:TioBSABeforeAfterSelectionObjectEvent read FonBeforeSelectionObject write FonBeforeSelectionObject;
    property OnSelectionObject:TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property OnAfterSelectionObject:TioBSABeforeAfterSelectionObjectEvent read FonAfterSelectionObject write FonAfterSelectionObject;
    property OnBeforeSelectionInterface:TioBSABeforeAfterSelectionInterfaceEvent read FonBeforeSelectionInterface write FonBeforeSelectionInterface;
    property OnSelectionInterface:TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property OnAfterSelectionInterface:TioBSABeforeAfterSelectionInterfaceEvent read FonAfterSelectionInterface write FonAfterSelectionInterface;
    // Properties
    property AsDefault:Boolean read FAsDefault write SetAsDefault;
    property Async:Boolean read FAsync write SetAsync;
    property AutoLoadData:Boolean read FAutoLoadData write SetAutoLoadData;
    property AutoPersist:Boolean read FAutoPersist write SetAutoPersist;
    property AutoPost: Boolean read GetAutoPost write SetAutoPost;
    property AutoRefreshOnNotification:TioAutoRefreshType read FAutoRefreshOnNotification write FAutoRefreshOnNotification;
    property MasterPresenter:TioModelPresenter read FMasterPresenter write FMasterPresenter;
    property MasterPropertyName:String read FMasterPropertyName write FMasterPropertyName;
    property OrderBy:String read FOrderBy Write SetOrderBy;
    property TypeAlias:String read FTypeAlias write SetTypeAlias;
    property TypeName:String read FTypeName write SetTypeName;
    property ViewDataType:TioViewDataType read FViewDataType write FViewDataType;
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters;
    property WhereStr:TStrings read FWhereStr write SetWhereStr;
    property SelectorFor: TioModelPresenter read FSelectorFor write FSelectorFor;
  end;

implementation

uses
  System.SysUtils, iORM.Where.Factory, iORM.LiveBindings.Factory,
  iORM.Exceptions, iORM.Rtti.Utilities, iORM, iORM.Components.Common;

{ TioModelProvider }

procedure TioModelPresenter.Append(AObject: TObject);
begin
  if CheckAdapter then
  begin
    BindSourceAdapter.Append(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenter.Append;
begin
  if CheckAdapter then
    (BindSourceAdapter as TBindSourceAdapter).Append;
end;

procedure TioModelPresenter.Append(AObject: IInterface);
begin
  if CheckAdapter then
  begin
    BindSourceAdapter.Append(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenter.Cancel;
begin
  if CheckAdapter and Editing then
    BindSourceAdapter.Cancel;
end;

procedure TioModelPresenter.CancelIfEditing;
begin
  if CheckAdapter and Editing then
    Self.Cancel;
end;

function TioModelPresenter.CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean;
begin
  // if the adapter is not already assigned then create it
  if ACreateIfNotAssigned and not Assigned(FBindSourceAdapter) then
    _CreateAdapter(nil);
  // Result
  Result := Assigned(FBindSourceAdapter);
end;

procedure TioModelPresenter.ClearDataObject;
begin
  if CheckAdapter then
    BindSourceAdapter.ClearDataObject;
end;

constructor TioModelPresenter.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := False;
  FAutoRefreshOnNotification := TioAutoRefreshType.arEnabledNoReload;
  FAsync := False;
  FAutoLoadData := True;
  FAutoPersist := True;
  FViewDataType := TioViewDataType.dtList;
  FWhere := nil;
  FWhereDetailsFromDetailAdapters := False;
  FSelectorFor := nil;
  // Set even an onChange event handler
  FWhereStr := TStringList.Create;
  SetWhereStr(FWhereStr);  // set TStringList.onChange event handler
  // Questà è una collezione dove eventuali ModelPresenters di dettaglio
  //  si registrano per rendere nota la loro esistenza al Master. Sarà poi
  //  usata dal Master per fare in modo che, quando viene richiesta la creazione
  //  del suo BindSourceAdapter (del master), venga scatenata anche la creazione
  //  anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
  //  registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
  //  al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
  //  Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
  //  DesignTime (WhereStr property) non funzionassero per questo motivo.
  FDetailPresentersContainer := nil;
  // At DesignTime initialize the "AsDefault" property at True if it is the
  //  first ModelPresenter inserted (no other presenters presents).
  //  NB: At Runtime set False as initial value (load real value from dfm file)
  InitAsDefaultOnCreate;
end;

function TioModelPresenter.Current: TObject;
begin
  if CheckAdapter then
    Result := BindSourceAdapter.Current
  else
    Result := nil;
end;

function TioModelPresenter.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioRttiUtilities.CastObjectToGeneric<T>(LCurrent);
end;

procedure TioModelPresenter.Delete;
begin
  if CheckAdapter then
    BindSourceAdapter.Delete;
end;

procedure TioModelPresenter.DeleteListViewItem(const AItemIndex,
  ADelayMilliseconds: integer);
begin
  GetBindSourceAdapter.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

destructor TioModelPresenter.Destroy;
begin
  FWhereStr.Free;
  // Destroy the BindSourceAdapter was created then destroy it
  if CheckAdapter then
    FBindSourceAdapter.Free;
  // If the DetailPresenterContainer was created then destroy it
  if Assigned(FDetailPresentersContainer) then
    FDetailPresentersContainer.Free;
  inherited;
end;

procedure TioModelPresenter.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionInterface) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionInterface) then
    FonBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoNotify(ANotification: IioBSANotification);
begin
  // If assigned execute the event handler
  if Assigned(FonNotify)
    then OnNotify(Self, ANotification);
  // If enabled perform an AutoRefresh operation
  if Self.AutoRefreshOnNotification > arDisabled
    then Self.Refresh(Self.AutoRefreshOnNotification = TioAutoRefreshType.arEnabledReload);
end;

procedure TioModelPresenter.DoSelection(var ASelected: TObject;var  ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonAfterSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
end;

procedure TioModelPresenter.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioModelPresenter.Edit(AForce: Boolean);
begin
  if CheckAdapter then
    BindSourceAdapter.Edit(AForce);
end;

procedure TioModelPresenter.First;
begin
  if CheckAdapter then
    BindSourceAdapter.First;
end;

procedure TioModelPresenter.ForceDetailAdaptersCreation;
var
  LPresenter: TioModelPresenter;
begin
  if Assigned(FDetailPresentersContainer) then
    for LPresenter in FDetailPresentersContainer do
      LPresenter.CheckAdapter(True);
end;

function TioModelPresenter.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := Self.BindSourceAdapter.ioAutoPost
  else
    Result := FAutoPost;
end;

function TioModelPresenter.GetBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  // If the BindSourceAdapter is not assigned then create it
  if CheckAdapter(True) then
    Result := FBindSourceAdapter;
end;

function TioModelPresenter.GetCount: Integer;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioModelPresenter.DataObject: TObject;
begin
  Result := nil;
  Result := BindSourceAdapter.DataObject;
end;

function TioModelPresenter.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioRttiUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioModelPresenter.DataObjectAssigned: Boolean;
begin
  if CheckAdapter then
    Result := Assigned(BindSourceAdapter.DataObject)
  else
    Result := False;
end;

function TioModelPresenter.GetDetailBindSourceAdapter(const AOwner: TComponent;
  const AMasterPropertyName: String;
  const AWhere: IioWhere): IioActiveBindSourceAdapter;
begin
  if not Supports(GetBindSourceAdapter.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere), IioActiveBindSourceAdapter, Result)
    then Result := nil;
end;

function TioModelPresenter.GetEditing: Boolean;
begin
  if CheckAdapter then
    Result := BindSourceAdapter.State in seEditModes
  else
    Result := False
end;

function TioModelPresenter.GetIsDetail: Boolean;
begin
  if CheckAdapter then
   Result := BindSourceAdapter.IsDetail
  else
   Result := Assigned(MasterPresenter);
end;

function TioModelPresenter.GetIsInterfacePresenting: Boolean;
begin
  if CheckAdapter then
   Result := BindSourceAdapter.IsInterfaceBSA
  else
   Result := TioRttiUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioModelPresenter.GetNaturalObjectBindSourceAdapter(
  const AOwner: TComponent): IioActiveBindSourceAdapter;
begin
  if not Supports(GetBindSourceAdapter.NewNaturalObjectBindSourceAdapter(AOwner), IioActiveBindSourceAdapter, Result) then
    Result := nil;
end;

function TioModelPresenter.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := BindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

function TioModelPresenter.GetWhere: IioWhere;
begin
  // If the adapter exist the return the property of the adapter
  //  else return the Self.FWhere
  if CheckAdapter then
  begin
    Result := FBindSourceAdapter.ioWhere;
    Exit;
  end;
  // if not already assigned then create it (così lo crea solo se serve
  //  davvero altrimenti no)
  if not Assigned(FWhere) then
    FWhere := TioWhereFactory.NewWhere;
  // Return the Where instance
  Result := FWhere;
end;

procedure TioModelPresenter.Insert;
begin
  if CheckAdapter then
    (BindSourceAdapter as TBindSourceAdapter).Insert;
end;

procedure TioModelPresenter.InitAsDefaultOnCreate;
var
  I: Integer;
begin
  // At DesignTime initialize the "AsDefault" property at True if it is the
  //  first ModelPresenter inserted (no other presenters presents).
  //  NB: At Runtime set False as initial value (load real value from dfm file)
  if (csDesigning in ComponentState) then
  begin
    FAsDefault := True;
    for I := 0 to Owner.ComponentCount-1 do
      if (Owner.Components[I] is TioModelPresenter)
      and (Owner.Components[I] <> Self)
      then
      begin
        FAsDefault := False;
        Exit;
      end;
  end
  else
    FAsDefault := False;
end;

procedure TioModelPresenter.Insert(AObject: TObject);
begin
  if CheckAdapter then
  begin
    BindSourceAdapter.Insert(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenter.Last;
begin
  if CheckAdapter then
    BindSourceAdapter.Last;
end;

procedure TioModelPresenter.Loaded;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not (csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // REGISTER ITSELF AS DETAIL MODEL PRESENTER (IF IT IS A DETAIL) INTO THE MASTER PRESENTER
  // ===========================================================================
  if Self.IsDetail then
    MasterPresenter.RegisterDetailPresenter(Self);
  // ===========================================================================

  inherited;
end;

procedure TioModelPresenter.Select<T>(AInstance: T; ASelectionType: TioSelectionType);
var
  LDestBSA: IioActiveBindSourceAdapter;
  LValue: TValue;
begin
  // Some checks
  if not Assigned(FSelectorFor) then
    raise EioException.Create(Self.ClassName, 'MakeSelection', '"SelectorFor" property not assigned.');
  if not FSelectorFor.CheckAdapter then
    raise EioException.Create(Self.ClassName, 'MakeSelection', 'Selection destination ActiveBindSourceAdapter, non present.');
  // Get the selection destination BindSourceAdapter
  LDestBSA := FSelectorFor.BindSourceAdapter;
  // Encapsulate the SelectedInstance into a TValue then assign it
  //  as selection in a proper way
  //  NB: Lasciare assolutamente così perchè ho già provato in vari modi ma mi dava sempre un errore
  //       facendo cos' invece (cioè passando per un TValue) funziona correttamente.
  LValue := TValue.From<T>(AInstance);
  if LValue.Kind = TTypeKind.tkInterface then
    LDestBSA.ReceiveSelection(LValue.AsInterface, ASelectionType)
  else
  if LValue.Kind = TTypeKind.tkClass then
    LDestBSA.ReceiveSelection(LValue.AsObject, ASelectionType)
  else
    raise EioException.Create(Self.ClassName, 'Select<T>', 'Wrong LValue kind.');
end;

procedure TioModelPresenter.SelectCurrent<T>(ASelectionType: TioSelectionType);
begin
  // Some checks
  if not CheckAdapter then
    raise EioException.Create(Self.ClassName, 'MakeSelection', 'ActiveBindSourceAdapter, non present.');
  // Make the selection of current
  Select<T>(CurrentAs<T>, ASelectionType);
end;

function TioModelPresenter.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetail then
    Result := BindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioModelPresenter.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioRttiUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

procedure TioModelPresenter.Next;
begin
  if CheckAdapter then
    BindSourceAdapter.Next;
end;

procedure TioModelPresenter.Notify(const Sender: TObject;
  const ANotification: IioBSANotification);
begin
  DoNotify(ANotification);
end;

procedure TioModelPresenter.PersistAll;
begin
  if CheckAdapter then
    BindSourceAdapter.PersistAll;
end;

procedure TioModelPresenter.PersistCurrent;
begin
  if CheckAdapter then
    BindSourceAdapter.PersistCurrent;
end;

procedure TioModelPresenter.Post;
begin
  if CheckAdapter and Editing then
    BindSourceAdapter.Post;
end;

procedure TioModelPresenter.PostIfEditing;
begin
  if CheckAdapter and Editing then
    Self.Post;
end;

procedure TioModelPresenter.Prior;
begin
  if CheckAdapter then
    BindSourceAdapter.Prior;
end;

procedure TioModelPresenter.Refresh(const AReloadData: Boolean);
begin
  if CheckAdapter then
    FBindSourceAdapter.Refresh(AReloadData);
end;

procedure TioModelPresenter.RegisterDetailPresenter(
  const ADetailPresenter: TioModelPresenter);
begin
  if not Assigned(FDetailPresentersContainer) then
    FDetailPresentersContainer := TList<TioModelPresenter>.Create;
  FDetailPresentersContainer.Add(ADetailPresenter);
end;

procedure TioModelPresenter.SetAsDefault(const Value: Boolean);
var
  I: Integer;
begin
  // Uncheck AsDefault property for all presenters
  if Value then
    for I := 0 to Owner.ComponentCount-1 do
      if (Owner.Components[I] is TioModelPresenter) then
        TioModelPresenter(Owner.Components[I]).AsDefault := False;
  // Set the value
  FAsDefault := Value;
end;

procedure TioModelPresenter.SetAsync(const Value: Boolean);
begin
  FAsync := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioAsync := Value;
end;

procedure TioModelPresenter.SetAutoLoadData(const Value: Boolean);
begin
  FAutoLoadData := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioAutoLoadData := Value;
end;

procedure TioModelPresenter.SetBindSourceAdapter(const Value: IioActiveBindSourceAdapter);
begin
  if Value = FBindSourceAdapter then
    Exit;
  FBindSourceAdapter := Value;
  // Set some properties
  FBindSourceAdapter.ioAsync := FAsync;
  FBindSourceAdapter.ioAutoPersist := FAutoPersist;
  FBindSourceAdapter.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
  FBindSourceAdapter.ioWhere := FWhere;
  // Register itself for notifications from BindSourceAdapter
  FBindSourceAdapter.SetBindSource(Self);
end;

procedure TioModelPresenter.SetBindSourceAdapter(const Value: TBindSourceAdapter);
var
  LActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  if Supports(Value, IioActiveBindSourceAdapter, LActiveBindSourceAdapter) then
    Self.SetBindSourceAdapter(LActiveBindSourceAdapter)
  else
    raise EioException.Create(TioModelPresenter.ClassName + '.SetBindSourceAdapter: IioActiveBindSourceAdapter interface not implemented by object.');
end;

//procedure TioModelPresenter.SetMasterBindSourceAdapter(
//  const AMasterBindSourceAdapter: IioActiveBindSourceAdapter;
//  const AMasterPropertyName: String);
//var
//  LBindSourceAdapter: TBindSourceAdapter;
//begin
//  // Get the BSAdapter from the MasterBindSourceAdapter and register Self for
//  //  notifications
//  LBindSourceAdapter := TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(
//    Self,
//    AMasterBindSourceAdapter,
//    AMasterPropertyName,
//    FWhere
//    );
//  Self.SetBindSourceAdapter(LBindSourceAdapter);
//end;

procedure TioModelPresenter.SetDataObject(const ADataObject: TObject; const AOwnsObject:Boolean);
begin
  if not Assigned(ADataObject) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
    // Create the BSA
    _CreateAdapter(ADataObject);
  // Set the data object into the BSA
  BindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
end;

procedure TioModelPresenter.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  if not Assigned(ADataObject) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
    // Create the BSA
    //  NB: Nel caso in cui si sita impostando il DataObject ma il BSA non era ancora creato lo crea (il BSA)
    //       usando il ClassName dell'oggetto; in questo modo siamo sicuri che abbiamo il BSA più
    //       adatto e non uno che magari è più generico e a cui mancano alcune proprietà (è successo).
    _CreateAdapter(ADataObject as TObject);
  // Set the data object into the BSA
  BindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
end;

procedure TioModelPresenter.SetOrderBy(const Value: String);
begin
  // Set the OrderBy in the Where object (questo ha veramnete effetto, FOrderBY
  //  contiene il testo solo per pubblicarne il valore come proprietà editabile
  //  a design-time sul componente.
  FOrderBy := Value;
  Where.SetOrderBySQL(Value);
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioWhere.SetOrderBySql(Value);
end;

procedure TioModelPresenter.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioModelPresenter.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioTypeName := Value;
end;

procedure TioModelPresenter.SetAutoPersist(const Value: Boolean);
begin
  FAutoPersist := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioAutoPersist := Value;
end;

procedure TioModelPresenter.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    Self.BindSourceAdapter.ioAutoPost := Value;
end;

procedure TioModelPresenter.SetWhere(const Value: IioWhere);
begin
  FWhere := Value;
  // Update the adapter where in the BSAdapter if exist
  if CheckAdapter then
    FBindSourceAdapter.ioWhere := Value;
end;

procedure TioModelPresenter.SetWhereDetailsFromDetailAdapters(
  const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckAdapter then
    FBindSourceAdapter.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioModelPresenter.SetWhereStr(const Value: TStrings);
begin
  FWhereStr.Assign(Value);
  // If in DesignTime then Exit
  //  NB: Mettendo questa linea di codice ho risolto il problema che i ioPBS
  //       anche se erano con "AutoActivate=False" quando veniva aperta (caricata)
  //       la form che li conteneva a design time apparivano cmq con i dati finti di
  //       prova anzichè rimanere vuoti.
  if (csDesigning in ComponentState) then
    Exit;
  // Set the onChange event handler
  (FWhereStr as TStringList).OnChange := WhereOnChangeEventHandler;
  // Update the adapter where property
  WhereOnChangeEventHandler(Self);
end;

procedure TioModelPresenter.ShowCurrent(const AViewContext: TComponent; const AAlias: String);
begin
  io.ShowCurrent(Self, AViewContext, AAlias);
end;

procedure TioModelPresenter.ShowCurrent(const AVCProvider: TioViewContextProvider; const AAlias: String);
begin
  io.ShowCurrent(Self, AVCProvider, AAlias);
end;

procedure TioModelPresenter.ShowCurrent(const AAlias: String; const AVCProviderName:String);
begin
  io.ShowCurrent(Self, AAlias, AVCProviderName);
end;

procedure TioModelPresenter.ShowEach(const AViewContext: TComponent; const AAlias: String);
begin
  io.ShowEach(Self, AViewContext, AAlias);
end;

procedure TioModelPresenter.ShowEach(const AVCProvider: TioViewContextProvider; const AAlias: String);
begin
  io.ShowEach(Self, AVCProvider, AAlias);
end;

procedure TioModelPresenter.ShowEach(const AAlias: String; const AVCProviderName:String);
begin
  io.ShowEach(Self, AAlias, AVCProviderName);
end;

procedure TioModelPresenter.WhereOnChangeEventHandler(Sender: TObject);
begin
  // Delete all previous criteria (_Where) and add the new criteria text
  Where._Where(FWhereStr.Text);
  // OLD_CODE
//  Self.SetWhere(TioWhereFactory.NewWhere.Add(FWhereStr.Text));
end;

procedure TioModelPresenter._CreateAdapter(const ADataObject:TObject);
begin
  // If an adapter already exists then raise an exception
  if Assigned(FBindSourceAdapter) then
    raise EioException.Create(Self.ClassName, '_CreateAdapter', 'Active bind source adapter already exists.');
  // if the TypeName is empty then set it
  if TypeName.IsEmpty then
    raise EioException.Create(Self.ClassName, 'SetDataObject', 'ModelPresenter.TypeName value is not valid.');
  // If the property MasterModelPresenter is assigned then retrieve
  //  the DetailBindSourceAdapter from it
  if Assigned(MasterPresenter) then
    // Get the BindSourceAdapter
    SetBindSourceAdapter(   TioLiveBindingsFactory.GetBSAfromMasterModelPresenter(nil, MasterPresenter, MasterPropertyName)  )
  // else create the BSA from TypeName & TypeAlias
  else
  begin
    // Get the ActiveBindSourceAdapter
    SetBindSourceAdapter(   TioLiveBindingsFactory.GetBSA(nil, TypeName, TypeAlias, Where, ViewDataType, AutoLoadData, ADataObject)   );
    // Force the creation of all the detail adapters (if exists)
    //  NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
    //       funzionavano perchè al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
    //       stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
    //       del Master.
    ForceDetailAdaptersCreation;
  end;
  // Init the BSA
  FBindSourceAdapter.ioAutoPost := FAutoPost;
end;

procedure TioModelPresenter.Insert(AObject: IInterface);
begin
  if CheckAdapter then
  begin
    BindSourceAdapter.Insert(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    BindSourceAdapter.Refresh(False);
  end;
end;

class function TioModelPresenter.IsValidForDependencyInjectionLocator(const AModelPresenter: TioModelPresenter; const ARaiseExceptions:Boolean): Boolean;
begin
  // Init
  Result := True;
  // Check the ModelPresenter
  Result := Result and Assigned(AModelPresenter);
  if ARaiseExceptions and not Result then
    raise EioException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', 'Parameter "AModelPresenter" not assigned.');
  // Check the bind source adapter
  Result := Result and AModelPresenter.CheckAdapter;
  if ARaiseExceptions and not Result then
    raise EioException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', 'ActiveBindSourceAdapter not assigned in the "AModelPresenter" parameter.');
  // Check the ModelPresenter.Current object
  Result := Result and (AModelPresenter.Current <> nil);
  if ARaiseExceptions and not Result then
    raise EioException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', '"Current" object of the ModelPresenter not assigned.');
end;

end.
