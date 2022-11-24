unit iORM.StdActions.CloseQueryRepeater;

interface

uses
  System.Classes, iORM.MVVM.ViewModelBridge, iORM.StdActions.Interfaces,
  Vcl.Forms;

type

  TioCloseQueryRepeater = class (TComponent)
  private
    FOnCloseQuery: TCloseQueryEvent;
    procedure _InjectOnCloseEventHandler;
    function _ExtractViewModelBridgeFromSubComponents: TioViewModelBridge;
    function _ExtractBSCloseQuerySimpleViewStdActionFromSubComponents: IioBSCloseQuery;
    function _OnCloseQueryEventHandler_TryAsMVVM(Sender: TObject; var CanClose: Boolean): Boolean;
    procedure _OnCloseQueryEventHandler_AsSimpleView(Sender: TObject; var CanClose: Boolean);
  protected
    procedure Loaded; override;
  public
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    // Events
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
  end;


implementation

uses
  System.Rtti, iORM.RttiContext.Factory, iORM.Exceptions,
  System.SysUtils;

{ TioCloseQueryRepeater }

procedure TioCloseQueryRepeater.Loaded;
begin
  inherited;
  _InjectOnCloseEventHandler;
end;

function TioCloseQueryRepeater._ExtractBSCloseQuerySimpleViewStdActionFromSubComponents: IioBSCloseQuery;
var
  I: Integer;
  LBSCloseQueryAction: IioBSCloseQuery;
begin
  Result := nil;
  for I := 0 to Owner.ComponentCount - 1 do
  begin
    LBSCloseQueryAction := TioBSCloseQueryCommonBehaviour.ExtractBSCloseQueryStdAction(Owner.Components[I]);
    if Assigned(LBSCloseQueryAction) then
      Exit(LBSCloseQueryAction);
  end;
end;

function TioCloseQueryRepeater._ExtractViewModelBridgeFromSubComponents: TioViewModelBridge;
var
  I: Integer;
  LComponent: TComponent;
begin
  Result := nil;
  for I := 0 to Owner.ComponentCount - 1 do
  begin
    LComponent := TioViewModelBridge.ExtractVMBridge(Owner.Components[I]);
    if Assigned(LComponent) then
      Exit(TioViewModelBridge(LComponent));
  end;
end;

procedure TioCloseQueryRepeater._OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean);
var
  LViewModelBridge: TioViewModelBridge;
begin
  // Init
  CanClose := True;
  // Se viene rilevato un VMBridge lo gestisce come MVVM
  if not _OnCloseQueryEventHandler_TryAsMVVM(Sender, CanClose) then
    _OnCloseQueryEventHandler_AsSimpleView(Sender, CanClose);
  // Se è impostato l'evento "OnCloseQuery" del componente stesso...
  if Assigned(FOnCloseQuery) then
    FOnCloseQuery(Sender, CanClose);
end;

procedure TioCloseQueryRepeater._OnCloseQueryEventHandler_AsSimpleView(Sender: TObject; var CanClose: Boolean);
var
  LBSCloseQueryAction: IioBSCloseQuery;
begin
  // Cerca una IioBSCloseQuery
  // NB: La cerca tra tutti i components dell'owner (per ognuno di essi cerca se contiene l'azione cercata)
  // NB: Solo primo livello
  LBSCloseQueryAction := _ExtractBSCloseQuerySimpleViewStdActionFromSubComponents;
  // Se ha trovato la action chiede a lei se si può chiudere
  if Assigned(LBSCloseQueryAction) then
    LBSCloseQueryAction._OnCloseQueryEventHandler(Sender, CanClose);
end;

function TioCloseQueryRepeater._OnCloseQueryEventHandler_TryAsMVVM(Sender: TObject; var CanClose: Boolean): Boolean;
var
  LViewModelBridge: TioViewModelBridge;
begin
  Result := True;
  // Prima cerca se c'è un ViewModelBridge su se stesso
  LViewModelBridge := TioViewModelBridge.ExtractVMBridge(Self);
  // Poi se non lo ho ha anccora trovato lo cerca tra i suoi components (solo 1 livello)
  if not Assigned(LViewModelBridge) then
    LViewModelBridge := _ExtractViewModelBridgeFromSubComponents;
  // Se ha trovato...
  if Assigned(LViewModelBridge) then
    CanClose := LViewModelBridge.ViewModel.CloseQuery
  else
    Result := False;
end;

procedure TioCloseQueryRepeater._InjectOnCloseEventHandler;
var
  LEventHandlerToInject: TMethod;
  LEventProperty: TRttiProperty;
begin
  // On runtime only
  if (csDesigning in ComponentState) then
    Exit;
  // Extract and check the event handler property of the owner (that is the view or the ViewContext)
  LEventProperty := TioRttiFactory.GetRttiPropertyByClass(Owner.ClassType, 'OnCloseQuery', True);
  if LEventProperty.GetValue(Owner).IsEmpty then
  begin
    // Set the TMethod Code and Data for the event handloer to be assigned to the View/ViewContext
    LEventHandlerToInject.Code := ClassType.MethodAddress('_OnCloseQueryEventHandler');
    LEventHandlerToInject.Data := Self;
    LEventProperty.SetValue(Owner, TValue.From<TCloseQueryEvent>(TCloseQueryEvent(LEventHandlerToInject)));
  end
  else
    raise EioException.Create(ClassName, '_InjectOnCloseEventHandler',
      Format('An "OnCloseQuery" event handler is already present in the class "%s".' +
        #13#13'Concurrent use of "%s" component and the "OnCloseQuery" event handler is not allowed.' +
        #13#13'If you need to both handle the "OnCloseQuery" event and have the component "%s" then you can handle the "OnCloseQuery" event on the action itself instead of the one on the form.',
        [Owner.ClassName, ClassName, ClassName]));
end;

end.
