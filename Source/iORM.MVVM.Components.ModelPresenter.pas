unit iORM.MVVM.Components.ModelPresenter;

interface

uses
  System.Classes, iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.ObjectScope,
  System.Generics.Collections;

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
    // Methods
    procedure DoNotify(ANotification:IioBSANotification);
    procedure WhereOnChangeEventHandler(Sender:TObject);
    procedure SetAutoLoadData(const Value: Boolean);
  protected
    procedure Loaded; override;
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
    // Editing
    function GetEditing: Boolean;
    // ItemCount
    function GetCount: Integer;
    // Async
    procedure SetAsync(const Value: Boolean);
    // AutoPersist
    procedure SetAutoPersist(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CheckAdapter(const ACreateIfNotAssigned:Boolean = False): Boolean;
    procedure Notify(const Sender:TObject; const ANotification:IioBSANotification);
//    procedure SetMasterBindSourceAdapter(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String='');
    procedure RegisterDetailPresenter(const ADetailPresenter:TioModelPresenter);
    procedure ForceDetailAdaptersCreation;
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    procedure Next;
    procedure Prior;
    procedure First;
    procedure Last;
    procedure Edit(AForce: Boolean = False);
    procedure Post;
    function Current: TObject;
    function CurrentAs<T>: T;
    procedure Refresh(const AReloadData:Boolean); overload;
    procedure Persist(const AReloadData:Boolean=False);
    procedure Append; overload;
    procedure Append(AObject:TObject); overload;
    procedure Insert; overload;
    procedure Insert(AObject:TObject); overload;
    procedure Delete;
    procedure Cancel;
    function GetDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
    function GetNaturalObjectBindSourceAdapter(const AOwner:TComponent): IioActiveBindSourceAdapter;
    // ----------------------------------------------------------------------------------------------------------------------------
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const Value:TObject; const AOwnsObject:Boolean=True);
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
  published
    // Events
    property OnNotify:TioBSANotificationEvent read FonNotify write FonNotify;
    // Properties
    property AsDefault:Boolean read FAsDefault write SetAsDefault;
    property Async:Boolean read FAsync write SetAsync;
    property AutoLoadData:Boolean read FAutoLoadData write SetAutoLoadData;
    property AutoPersist:Boolean read FAutoPersist write SetAutoPersist;
    property AutoRefreshOnNotification:TioAutoRefreshType read FAutoRefreshOnNotification write FAutoRefreshOnNotification;
    property MasterPresenter:TioModelPresenter read FMasterPresenter write FMasterPresenter;
    property MasterPropertyName:String read FMasterPropertyName write FMasterPropertyName;
    property OrderBy:String read FOrderBy Write SetOrderBy;
    property TypeAlias:String read FTypeAlias write SetTypeAlias;
    property TypeName:String read FTypeName write SetTypeName;
    property ViewDataType:TioViewDataType read FViewDataType write FViewDataType;
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters;
    property WhereStr:TStrings read FWhereStr write SetWhereStr;
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
    BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenter.Append;
begin
  if CheckAdapter then
    (BindSourceAdapter as TBindSourceAdapter).Append;
end;

procedure TioModelPresenter.Cancel;
begin
  if CheckAdapter then
    BindSourceAdapter.Cancel;
end;

function TioModelPresenter.CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean;
begin
  // if the adapter is not already assigned then create it
  if ACreateIfNotAssigned and not Assigned(FBindSourceAdapter) then
  begin
    // If the property MasterModelPresenter is assigned then retrieve
    //  the DetailBindSourceAdapter from it
    if Assigned(MasterPresenter) then
      // Get the BindSourceAdapter
      SetBindSourceAdapter(   TioLiveBindingsFactory.GetBSAfromMasterModelPresenter(nil, MasterPresenter, MasterPropertyName)  )
    // else create the BSA from TypeName & TypeAlias
    else
    begin
      // Get the ActiveBindSourceAdapter
      SetBindSourceAdapter(   TioLiveBindingsFactory.GetBSAByTypeName(TypeName, TypeAlias, Where, ViewDataType, AutoLoadData, nil)   );
      // Force the creation of all the detail adapters (if exists)
      //  NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
      //       funzionavano perchè al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
      //       stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
      //       del Master.
      ForceDetailAdaptersCreation;
    end;
  end;
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
  FAutoRefreshOnNotification := TioAutoRefreshType.arEnabledNoReload;
  FAsync := False;
  FAutoLoadData := True;
  FAutoPersist := True;
  FViewDataType := TioViewDataType.dtList;
  FWhere := nil;
  FWhereDetailsFromDetailAdapters := False;
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

procedure TioModelPresenter.DoNotify(ANotification: IioBSANotification);
begin
  // If assigned execute the event handler
  if Assigned(FonNotify)
    then OnNotify(Self, ANotification);
  // If enabled perform an AutoRefresh operation
  if Self.AutoRefreshOnNotification > arDisabled
    then Self.Refresh(Self.AutoRefreshOnNotification = TioAutoRefreshType.arEnabledReload);
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
    BindSourceAdapter.Refresh(False);
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

procedure TioModelPresenter.Persist(const AReloadData: Boolean);
begin
  if CheckAdapter then
    BindSourceAdapter.Persist(AReloadData);
end;

procedure TioModelPresenter.Post;
begin
  if CheckAdapter then
    BindSourceAdapter.Post;
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

procedure TioModelPresenter.SetBindSourceAdapter(
  const Value: IioActiveBindSourceAdapter);
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

procedure TioModelPresenter.SetBindSourceAdapter(
  const Value: TBindSourceAdapter);
var
  LActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  if Supports(Value, IioActiveBindSourceAdapter, LActiveBindSourceAdapter) then
    Self.SetBindSourceAdapter(LActiveBindSourceAdapter)
  else
    raise EioException.Create(TioModelPresenter.ClassName + '.SetBindSourceAdapter: IioActiveBindSourceAdapter interface not implemented by object.');
end;

procedure TioModelPresenter.SetDataObject(const Value: TObject; const AOwnsObject:Boolean);
begin
  if not Assigned(Value) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
  begin
    // if the TypeName is empty then set it
    if TypeName.IsEmpty then
    begin
      TypeName := Value.ClassName;
      TypeAlias := EmptyStr;
    end;
    // Create the BSA
    SetBindSourceAdapter(   TioLiveBindingsFactory.GetBSAByTypeName(TypeName, TypeAlias, Where, ViewDataType, AutoLoadData, nil)  );
  end;
  // Set the data object into the BSA
  BindSourceAdapter.SetDataObject(Value, AOwnsObject)
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

procedure TioModelPresenter.WhereOnChangeEventHandler(Sender: TObject);
begin
  // Delete all previous criteria (_Where) and add the new criteria text
  Where._Where(FWhereStr.Text);
  // OLD_CODE
//  Self.SetWhere(TioWhereFactory.NewWhere.Add(FWhereStr.Text));
end;

end.
