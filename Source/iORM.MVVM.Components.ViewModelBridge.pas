unit iORM.MVVM.Components.ViewModelBridge;

interface

uses
  System.Classes, iORM.MVVM.Interfaces;

type

  TioViewModelBridge = class;

  TioNeedViewModelEvent = procedure(Sender: TioViewModelBridge; var AViewModel: IioViewModel) of object;

  TioViewModelBridge = class (TComponent)
  private
    FVM_TypeName, FVM_Alias, FVM_Marker: String;
    FMasterVM_TypeName, FMasterVM_Alias, FMasterVM_MasterPropName: String;
    FViewModel: IioViewModel;
    FViewID: Byte;
    FTypeDataSource: IioVMBridgeTypeDataSource;
    // Events
    FOnNeedViewModel: TioNeedViewModelEvent;
  protected
    procedure Loaded; override;
    procedure DoNeedViewModel;
    procedure CheckForTypeDataSource;
    function TypeDataSourceExist: Boolean;
    function GetLinkedBindSource: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetLinkedBindSource(const ATypeDataSource:TObject);
    procedure CheckForViewModel;
    function ViewModelAs<T: IInterface>: T;
    property ViewModel:IioViewModel read FViewModel;
  published
    // Events
    property OnNeedViewModel:TioNeedViewModelEvent read FOnNeedViewModel write FOnNeedViewModel;
    // Propertyes
    property VM_TypeName:String read FVM_TypeName write FVM_TypeName;
    property VM_Alias:String read FVM_Alias write FVM_Alias;
    property VM_Marker:String read FVM_Marker write FVM_Marker;
    property MasterVM_TypeName:String read FMasterVM_TypeName write FMasterVM_TypeName;
    property MasterVM_Alias:String read FMasterVM_Alias write FMasterVM_Alias;
    property MasterVM_MasterPropName:String read FMasterVM_MasterPropName write FMasterVM_MasterPropName;
    property LinkedBindSource:String read GetLinkedBindSource;
  end;

implementation

uses
  System.SysUtils, System.Rtti,
  iORM.DependencyInjection.ViewModelShuttleContainer, iORM.DependencyInjection,
  iORM.Rtti.Utilities, Winapi.Windows, iORM.Where.Interfaces,
  iORM.Where.Factory, iORM.CommonTypes, iORM.Exceptions;

{ TioViewModelBridge }

procedure TioViewModelBridge.CheckForTypeDataSource;
var
  I: Integer;
  LVMBridgeTypeDataSource: IioVMBridgeTypeDataSource;
begin
  if Assigned(FTypeDataSource) then
    Exit;
  // Loop for Owner's components
  for I := 0 to Owner.ComponentCount-1 do
    // If the current component implements the IioVMBridgeTypeDataSource interface
    //  and it's linked to Self then set it as the current TypeDataSource
    if  Supports(Owner.Components[I], IioVMBridgeTypeDataSource, LVMBridgeTypeDataSource)
    and LVMBridgeTypeDataSource.IsLinkedTo(Self)
    then
      FTypeDataSource := LVMBridgeTypeDataSource;
end;

procedure TioViewModelBridge.CheckForViewModel;
var
  LWhereValue: TValue;
  LObj: TObject;
begin
  if (csDesigning in ComponentState) then
    Exit;
  // If a ViewModel is already assigned then exit
  if Assigned(FViewModel) then Exit;
  // If the VMBridge is "Loaded" before che linked BindSource or LiveMemTable
  //  then find che linked TypeDataSource to continue
  CheckForTypeDataSource;
  // ===============================================================================================================================
  // LOCKED VIEW MODEL ALREADY CREATED IN THE DEPENDENCY INJECTION CONTAINER  (an external prepared ViewModel)
  // -------------------------------------------------------------------------------------------------------------------------------
  // If a LockedViewModel is present in the DIContainer (an external prepared ViewModel) and the BindSource is not
  //  a detail (is Master) then Get that ViewModel  , assign it to itself (and to the View later during its creating),
  //  and get the BindSourceAdapter from it.
  if TioViewModelShuttleContainer.TryGet(FViewModel, FVM_Marker)
  then
     // Nothing (non fa nulla)
  // ===============================================================================================================================
  // ===============================================================================================================================
  // VIEW MODEL FROM THE DEPENDENCY INJECTION CONTAINER
  // -------------------------------------------------------------------------------------------------------------------------------
  // If a VM_Interface is specified then get the proper ViewModel from the Dependency Injection Container
  else if not FVM_TypeName.IsEmpty then
  begin
    // ViewModel with a MasterViewModel
    if TypeDataSourceExist and not FMasterVM_TypeName.IsEmpty then
      LObj := TioDependencyInjection.Locate(FVM_TypeName).Alias(FVM_Alias)
        .ConstructorMarker('CreateByMasterViewModelFromDependencyInjection')
        .ConstructorParams([FMasterVM_TypeName, FMasterVM_Alias, FMasterVM_MasterPropName])
        .Get
    // ViewModel with a MasterBindSource
    // NB: Eliminato perchè credo non servisse a nulla
//    else if TypeDataSourceExist and Assigned(FioMasterBindSource) then
//      LObj := TioDependencyInjection.Locate(FVM_Type).Alias(FVM_Alias)
//        .ConstructorMarker('CreateByMasterBindSource')
//        .ConstructorParams([FioMasterBindSource, FioMasterPropertyName])
//        .Get
    // ViewModel with TypeName+TypeAlias+Where BindSourceAdapterCreation
    else if TypeDataSourceExist and not FTypeDataSource.GetTypeName.IsEmpty then
    begin
      LWhereValue := TValue.From<IioWhere>(TioWhereFactory.NewWhere.Add(FTypeDataSource.GetWhereStr.Text)._OrderBy(FTypeDataSource.GetOrderBy));
      LObj := TioDependencyInjection.Locate(FVM_TypeName).Alias(FVM_Alias)
        .ConstructorMarker('CreateByTypeName')
        .ConstructorParams([FTypeDataSource.GetTypeName, FTypeDataSource.GetTypeAlias, LWhereValue, TValue.From<TioViewDataType>(FTypeDataSource.GetViewDataType), FTypeDataSource.GetAutoLoadData])
        .Get;
    end
    // Otherwise ViewModel only by ViewModelInterface and ViewModelAlias
    //  NB: Even if the "ioVM_UseBSPropsOnCreate" property is False
    else
      LObj := TioDependencyInjection.Locate(FVM_TypeName).Alias(FVM_Alias).Get;
    // Set the result
    FViewModel := TioRttiUtilities.ObjectAsIioViewModel(LObj);
  end;
  // ===============================================================================================================================
  // onNeedViewModel just after it has be assigned (for any changes/additions to the ViewModel itself)
  //  or for retrieve an external created ViewModel
  Self.DoNeedViewModel;
end;

constructor TioViewModelBridge.Create;
begin
  FTypeDataSource := nil;
  FViewModel := nil;
end;

destructor TioViewModelBridge.Destroy;
begin
  // ===========================================================================
  // If the ViewModel is assigned then unbind the view
  // ---------------------------------------------------------------------------
  if Assigned(FViewModel) then
    FViewModel.UnbindView(FViewID);
  // ===========================================================================
  if Assigned(FTypeDataSource) then
    FTypeDataSource.ClearViewModelBridge;
  inherited;
end;

procedure TioViewModelBridge.DoNeedViewModel;
begin
  if Assigned(FOnNeedViewModel) then
    FOnNeedViewModel(Self, FViewModel);
end;

function TioViewModelBridge.GetLinkedBindSource: String;
begin
  if TypeDataSourceExist then
    Result := FTypeDataSource.GetName
  else
    Result := '';
end;

function TioViewModelBridge.ViewModelAs<T>: T;
var
  LIID: TGUID;
begin
  Result := nil;
  LIID := TioRttiUtilities.TypeInfoToGUID(TypeInfo(T));
  if not Supports(FViewModel, LIID, Result) then
    raise EioException.Create(Self.ClassName + ': Interface not implemented by the ViewModel.');
end;

procedure TioViewModelBridge.Loaded;
begin
  inherited;
  // If the ViewModel is not already loaded then load it
  CheckForViewModel;
  // ===========================================================================
  // If the ViewModel is assigned then try
  //  to Bind the View (Owner) components to ViewModel's actions
  //  and register the view into the VMVoews container of the VM
  // ---------------------------------------------------------------------------
  if Assigned(FViewModel) then
    FViewID := FViewModel.BindView(Self.Owner);
  // ===========================================================================
end;

procedure TioViewModelBridge.SetLinkedBindSource(
  const ATypeDataSource: TObject);
var
  LVMBridgeTypeDataSource: IioVMBridgeTypeDataSource;
begin
  FTypeDataSource := nil;
  if  Assigned(ATypeDataSource)
  and not Supports(ATypeDataSource, IioVMBridgeTypeDataSource, FTypeDataSource) then
    raise EioException.Create(Self.ClassName + '.SetLinkedBindSource: IioVMBridgeTypeDataSource interface not implemented by object.');
end;

function TioViewModelBridge.TypeDataSourceExist: Boolean;
begin
  Result := Assigned(FTypeDataSource);
end;


end.
