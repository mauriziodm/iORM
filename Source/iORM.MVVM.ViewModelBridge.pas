unit iORM.MVVM.ViewModelBridge;

interface

uses
  System.Classes, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.Interfaces;

type

  TioViewModelBridge = class;

  TioNeedViewModelEvent = procedure(Sender: TioViewModelBridge; var AViewModel: IioViewModel) of object;

  TioViewModelBridge = class (TComponent)
  private
    FViewModel: IioViewModel;
    FDI_VMAlias: String;
    FDI_VMInterface: String;
    FDI_VMMarker: String;
    // Events
    FOnNeedViewModel: TioNeedViewModelEvent;
    procedure AutoSetClientComponentsOnCreate;
    procedure DoNeedViewModel;
    // Commands
    function GetCommands: IioCommandsContainer;
    // Command
    function GetCommand(const ACmdName: String): IioCommandsContainerItem;
    procedure SetCommand(const ACmdName: String; const Value: IioCommandsContainerItem);
    // Default presenter
    function GetDefaultPresenter: TioModelPresenterCustom;
    // Presenter
    function GetPresenter(const AName: String): TioModelPresenterCustom;
    // ViewModel
    function GetViewModel: IioViewModel;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function ExtractVMBridge(const AView:TComponent): TioViewModelBridge;
    procedure CheckForViewModel;
    function ViewModelIsAssigned: Boolean;
    function ViewModelAs<T: IInterface>: T;
    // Properties
    property ViewModel:IioViewModel read GetViewModel;
    property Commands:IioCommandsContainer read GetCommands;
    property Command[const ACmdName:String]:IioCommandsContainerItem read GetCommand write SetCommand; default;
    property DefaultPresenter:TioModelPresenterCustom read GetDefaultPresenter;
    property Presenter[const AName:String]:TioModelPresenterCustom read GetPresenter;
  published
    // Events
    property OnNeedViewModel:TioNeedViewModelEvent read FOnNeedViewModel write FOnNeedViewModel;
    // Properties
    property DI_VMInterface:String read FDI_VMInterface write FDI_VMInterface;
    property DI_VMAlias:String read FDI_VMAlias write FDI_VMAlias;
    property DI_VMMarker:String read FDI_VMMarker write FDI_VMMarker;
  end;

implementation

uses
  iORM.DependencyInjection.ViewModelShuttleContainer, iORM.Utilities,
  System.SysUtils, iORM.Exceptions, iORM.Components.Common.Interfaces, iORM;


{ TioViewModelBridge }

procedure TioViewModelBridge.AutoSetClientComponentsOnCreate;
var
  I: Integer;
  LVMBridgeClientComponent: IioVMBridgeClientComponent;
begin
  // Loop for Owner's components
  for I := 0 to Owner.ComponentCount-1 do
    // If the current component is a ConnectionDef then register it
    //  if not already registered.
    if Supports(Owner.Components[I], IioVMBridgeClientComponent, LVMBridgeClientComponent)
    and not Assigned(LVMBridgeClientComponent.ViewModelBridge)
    then
      LVMBridgeClientComponent.ViewModelBridge := Self;
end;

procedure TioViewModelBridge.CheckForViewModel;
var
  LObj: TObject;
begin
  if (csDesigning in ComponentState) then
    Exit;
  // If a ViewModel is already assigned then exit
  if Assigned(FViewModel) then Exit;
  // ===============================================================================================================================
  // VIEW MODEL CREATION BY DI_VMINterface & DI_VMAlias property if not already created
  // -------------------------------------------------------------------------------------------------------------------------------
  if not FDI_VMInterface.IsEmpty then
  begin
    LObj := io.di.LocateVM(FDI_VMInterface, FDI_VMAlias).Get;
    if not Supports(LObj, IioViewModel, FViewModel) then
      raise EioException.Create(Self.ClassName, 'CheckForViewModel', '"IioViewModel" interface not implemented by object.');
  end;
  // ===============================================================================================================================
  // LOCKED VIEW MODEL ALREADY CREATED IN THE DEPENDENCY INJECTION CONTAINER  (an external prepared ViewModel)
  // -------------------------------------------------------------------------------------------------------------------------------
  // If a LockedViewModel is present in the DIContainer (an external prepared ViewModel) and the BindSource is not
  //  a detail (is Master) then Get that ViewModel  , assign it to itself (and to the View later during its creating),
  //  and get the BindSourceAdapter from it.
  if  (not Assigned(FViewModel)) then
    FViewModel := TioViewModelShuttleContainer.GetViewModel(FDI_VMMarker);
  // ===============================================================================================================================
  // onNeedViewModel just after it has be assigned (for any changes/additions to the ViewModel itself)
  //  or for retrieve an external created ViewModel
  Self.DoNeedViewModel;
end;

constructor TioViewModelBridge.Create(AOwner: TComponent);
begin
  inherited;
  // Init
  FViewModel := nil;
  // ===========================================================================
  // Auto set itself as ViewModelBridge in the ModelBindSource and ModelDataSet
  //   components
  // ---------------------------------------------------------------------------
  if (csDesigning in ComponentState) then
    AutoSetClientComponentsOnCreate;
  // ===========================================================================
end;

destructor TioViewModelBridge.Destroy;
begin

  inherited;
end;

procedure TioViewModelBridge.DoNeedViewModel;
begin
  if Assigned(FOnNeedViewModel) then
    FOnNeedViewModel(Self, FViewModel);
end;

class function TioViewModelBridge.ExtractVMBridge(
  const AView: TComponent): TioViewModelBridge;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AView.ComponentCount-1 do
    if AView.Components[I] is TioViewModelBridge then
      Exit(TioViewModelBridge(AView.Components[I]));
end;

function TioViewModelBridge.GetCommand(
  const ACmdName: String): IioCommandsContainerItem;
begin
  if Assigned(FViewModel) then
    Result := FViewModel.Command[ACmdName]
  else
    raise EioException.Create(Self.Name, 'GetCommand', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.GetCommands: IioCommandsContainer;
begin
  if Assigned(FViewModel) then
    Result := FViewModel.Commands
  else
    raise EioException.Create(Self.Name, 'GetCommands', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.GetDefaultPresenter: TioModelPresenterCustom;
begin
  CheckForViewModel;
  if Assigned(FViewModel) then
    Result := FViewModel.DefaultPresenter
  else
    raise EioException.Create(Self.Name, 'GetDefaultPresenter', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.GetPresenter(
  const AName: String): TioModelPresenterCustom;
begin
  CheckForViewModel;
  if Assigned(FViewModel) then
    Result := FViewModel.Presenter[AName]
  else
    raise EioException.Create(Self.Name, 'GetPresenter', '"FViewModel" not assigned.');
end;

function TioViewModelBridge.GetViewModel: IioViewModel;
begin
  if not Assigned(FViewModel) then
    raise EioException.Create(Self.ClassName, 'GetViewModel', 'ViewModel not assigned.');
  Result := FViewModel;
end;

function TioViewModelBridge.ViewModelAs<T>: T;
var
  LIID: TGUID;
begin
  Result := nil;
  LIID := TioUtilities.TypeInfoToGUID(TypeInfo(T));
  if not Supports(FViewModel, LIID, Result) then
    raise EioException.Create(Self.ClassName + ': Interface not implemented by the ViewModel.');
end;

function TioViewModelBridge.ViewModelIsAssigned: Boolean;
begin
  Result := Assigned(FViewModel);
end;

procedure TioViewModelBridge.Loaded;
begin
  inherited;
  // If the ViewModel is not already loaded then load it
  CheckForViewModel;
  // ===========================================================================
  // Auto set itself as ViewModelBridge in the ModelBindSource and ModelDataSet
  //   components
  // ---------------------------------------------------------------------------
  if (csDesigning in ComponentState) then
    AutoSetClientComponentsOnCreate;
  // ===========================================================================
  // ===========================================================================
  // If the ViewModel is assigned then try
  //  to Bind the View (Owner) components to ViewModel's actions
  //  and register the view into the VMVoews container of the VM
  // ---------------------------------------------------------------------------
  if Assigned(FViewModel) then
    FViewModel.Commands.BindView(Self.Owner);
  // ===========================================================================
end;




procedure TioViewModelBridge.SetCommand(const ACmdName: String;
  const Value: IioCommandsContainerItem);
begin
  if Assigned(FViewModel) then
    FViewModel.SetCommand(ACmdName, Value)
  else
    raise EioException.Create(Self.Name, 'SetCommand', '"FViewModel" not assigned.');
end;

end.
