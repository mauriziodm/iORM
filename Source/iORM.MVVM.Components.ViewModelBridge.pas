unit iORM.MVVM.Components.ViewModelBridge;

interface

uses
  System.Classes, iORM.MVVM.Interfaces;

type

  TioViewModelBridge = class;

  TioNeedViewModelEvent = procedure(Sender: TioViewModelBridge; var AViewModel: IioViewModel) of object;

  TioViewModelBridge = class (TComponent)
  private
    FViewModel: IioViewModel;
    FViewID: Byte;
    FMarker: String;
    // Events
    FOnNeedViewModel: TioNeedViewModelEvent;
  protected
    procedure Loaded; override;
    procedure DoNeedViewModel;
    function GetCommand(const ACmdName: String): IioCommandsContainerItem;
    procedure SetCommand(const ACmdName: String;
      const Value: IioCommandsContainerItem);
  public
    constructor Create;
    destructor Destroy; override;
    procedure CheckForViewModel;
    function ViewModelIsAssigned: Boolean;
    function ViewModelAs<T: IInterface>: T;
    // Properties
    property ViewModel:IioViewModel read FViewModel;
    property Command[const ACmdName:String]:IioCommandsContainerItem read GetCommand write SetCommand; default;
  published
    // Events
    property OnNeedViewModel:TioNeedViewModelEvent read FOnNeedViewModel write FOnNeedViewModel;
    // Properties
    property Marker:String read FMarker write FMarker;
  end;

implementation

uses
  iORM.DependencyInjection.ViewModelShuttleContainer, iORM.Rtti.Utilities,
  System.SysUtils, iORM.Exceptions;


{ TioViewModelBridge }

procedure TioViewModelBridge.CheckForViewModel;
begin
  if (csDesigning in ComponentState) then
    Exit;
  // If a ViewModel is already assigned then exit
  if Assigned(FViewModel) then Exit;
  // ===============================================================================================================================
  // LOCKED VIEW MODEL ALREADY CREATED IN THE DEPENDENCY INJECTION CONTAINER  (an external prepared ViewModel)
  // -------------------------------------------------------------------------------------------------------------------------------
  // If a LockedViewModel is present in the DIContainer (an external prepared ViewModel) and the BindSource is not
  //  a detail (is Master) then Get that ViewModel  , assign it to itself (and to the View later during its creating),
  //  and get the BindSourceAdapter from it.
  FViewModel := TioViewModelShuttleContainer.GetViewModel(FMarker);
  // onNeedViewModel just after it has be assigned (for any changes/additions to the ViewModel itself)
  //  or for retrieve an external created ViewModel
  Self.DoNeedViewModel;
end;

constructor TioViewModelBridge.Create;
begin
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
  inherited;
end;

procedure TioViewModelBridge.DoNeedViewModel;
begin
  if Assigned(FOnNeedViewModel) then
    FOnNeedViewModel(Self, FViewModel);
end;

function TioViewModelBridge.GetCommand(
  const ACmdName: String): IioCommandsContainerItem;
begin
  if Assigned(FViewModel) then
    Result := FViewModel.Command[ACmdName]
  else
    raise EioException.Create(Self.Name, 'GetCommand', '"FViewModel" not assigned.');
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
  // If the ViewModel is assigned then try
  //  to Bind the View (Owner) components to ViewModel's actions
  //  and register the view into the VMVoews container of the VM
  // ---------------------------------------------------------------------------
  if Assigned(FViewModel) then
    FViewID := FViewModel.BindView(Self.Owner);
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
