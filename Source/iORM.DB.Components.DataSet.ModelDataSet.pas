unit iORM.DB.Components.DataSet.ModelDataSet;

interface

uses
  iORM.DB.Components.DataSet.Base, iORM.MVVM.Components.ViewModelBridge, System.Classes,
  iORM.Components.Common.Interfaces;

type

  TioModelDataSet = class(TMdListDataSet, IioVMBridgeClientComponent)
  private
    FViewModelBridge: TioViewModelBridge;
    FModelPresenter: String;
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    // dataset virtual methods
    procedure InternalPreOpen; override;
    /// ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge:TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ViewModelBridge: TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
    property ModelPresenter:String read FModelPresenter write FModelPresenter;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.Components.Common;

{ TioModelDataSet }

constructor TioModelDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FViewModelBridge := nil;
  if (csDesigning in ComponentState) and not Assigned(FViewModelBridge) then
    TioComponentsCommon.ViewModelBridgeAutosetting(Self, Owner);
end;

function TioModelDataSet.GetViewModelBridge: TioViewModelBridge;
begin
  Result := FViewModelBridge;
end;

procedure TioModelDataSet.InternalPreOpen;
begin
  // Checks
  if not Assigned(FViewModelBridge) then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModelBridge not assigned.');
  if not FViewModelBridge.ViewModelIsAssigned then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'ViewModel not assigned.');
  if FModelPresenter.IsEmpty then
    raise EioException.Create(Self.ClassName, 'InternalPreOpen', 'Model presenter not specified.');
  // Get the BindSourceAdapter from ViewModel
  SetInternalAdapter(   ViewModelBridge.ViewModel.Presenters[ModelPresenter].BindSourceAdapter   );
  inherited;
end;

procedure TioModelDataSet.Loaded;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not (csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // VIEWMODELBRIDGE - CHECK FOR VIEWMODEL IF NOT ALREADY EXECUTED
  //  (ALWAYS BEFORE DOCREATEADAPTER CALL)
  // ===========================================================================
  if Assigned(ViewModelBridge) and not (csDesigning in ComponentState) then
    ViewModelBridge.CheckForViewModel;
  // ===========================================================================

  inherited;
end;

procedure TioModelDataSet.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FViewModelBridge)
    then FViewModelBridge := nil;
end;

procedure TioModelDataSet.SetViewModelBridge(
  const AVMBridge: TioViewModelBridge);
begin
  FViewModelBridge := AVMBridge;
  if AVMBridge <> nil then AVMBridge.FreeNotification(Self);
end;

end.
