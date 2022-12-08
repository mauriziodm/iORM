unit iORM.StdActions.CloseQueryRepeater;

interface

uses
  System.Classes, iORM.MVVM.ViewModelBridge, iORM.CommonTypes;

type

  TioCloseQueryRepeater = class (TComponent)
  private
    FOnUpdateScope: TioBSCloseQueryActionUpdateScope;
    procedure SetOnUpdateScope(const AOnUpdateScope: TioBSCloseQueryActionUpdateScope);
    procedure _InjectEventHandler;
    function _CanClose(const AView: TComponent; const AScope: TioBSCloseQueryActionUpdateScope): Boolean;
    function _CanCloseQueryingFirstBSCloseQueryActionFound(const AView: TComponent): Boolean;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
    // properties
    property OnUpdateScope: TioBSCloseQueryActionUpdateScope read FOnUpdateScope write SetOnUpdateScope default usLocal;
  end;


implementation

uses
  System.Rtti, iORM.RttiContext.Factory, iORM.Exceptions,
  System.SysUtils, iORM.StdActions.Interfaces, iORM.Utilities,
  iORM.StdActions.CloseQueryActionRegister;

{ TioCloseQueryRepeater }

constructor TioCloseQueryRepeater.Create(AOwner: TComponent);
begin
  inherited;
  FOnUpdateScope := usLocal;
end;

procedure TioCloseQueryRepeater.Loaded;
begin
  inherited;
  _InjectEventHandler;
end;

procedure TioCloseQueryRepeater.SetOnUpdateScope(const AOnUpdateScope: TioBSCloseQueryActionUpdateScope);
begin
//  if AOnUpdateScope in [usOwnedDisableIfChilds, usGlobalDisableIfChilds] then
//    raise EioException.Create(ClassName, 'SetOnUpdateScope',
//      Format('Attempt to set the invalid value "%s" to property "OnUpdateScope" of the component named "%s" owned by "%s".' +
//        #13#13'This component accepts values "usLocal", "usOwned" or "usGlobal" only.',
//        [TioUtilities.EnumToString(AOnUpdateScope), Name, Owner.Name]));
  FOnUpdateScope := AOnUpdateScope;
end;

function TioCloseQueryRepeater._CanClose(const AView: TComponent; const AScope: TioBSCloseQueryActionUpdateScope): Boolean;
begin
  Result := True;
  case AScope of
    usLocal:
      Result := TioBSCloseQueryCommonBehaviour.CanClose_Owned(nil, AView, False, False);
    usOwned:
      Result := TioBSCloseQueryCommonBehaviour.CanClose_Owned(nil, AView, True, False);
    usGlobal:
      Result := TioBSCloseQueryActionRegister.CanClose(nil, False);
    // NB: Nel caso del repeater se lo scope è uno dei due "...DisableIfChilds" non ho trovato altro modo se non quello di
    //      reperire la prima BSCloseQueryAction che si trova tra i suoi Owned e poi basare la risposta su questa.
    //      NB: Dovrebbe funzionare bene tranne forse nel caso raro in cui ci possono essere più viste collegate a un solo
    //           ViewModel, in questo caso usa la prima che trova, cmq è un caso raro.
    //      NB: Anche nel caso di applicazione non MVVM con MainForm che non ha altre viste owned, non può funzionare perchè
    //           il funzionamento si basa proprio sull'individuazione di una BSCloseQueryAction tra gli owned.
    usOwnedDisableIfChilds, usGlobalDisableIfChilds:
      Result := _CanCloseQueryingFirstBSCloseQueryActionFound(AView);
  end;
end;

function TioCloseQueryRepeater._CanCloseQueryingFirstBSCloseQueryActionFound(const AView: TComponent): Boolean;
var
  LCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := True;
  LCloseQueryAction := TioBSCloseQueryCommonBehaviour.ExtractFirstBSCloseQueryActionFound(AView, True);
  if Assigned(LCloseQueryAction) then
    Result := LCloseQueryAction._CanClose(nil);
end;

procedure TioCloseQueryRepeater._InjectEventHandler;
var
  LEventHandlerToInject: TMethod;
begin
  // On runtime only
  if (csDesigning in ComponentState) then
    Exit;
  // Set the TMethod Code and Data for the event handloer to be assigned to the View/ViewContext
  LEventHandlerToInject.Code := ClassType.MethodAddress('_OnCloseQueryEventHandler');
  LEventHandlerToInject.Data := Self;
  TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(Owner, LEventHandlerToInject, False);
end;

procedure TioCloseQueryRepeater._OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean);
var
  I: Integer;
  LSenderAsTComponent: TComponent;
begin
  CanClose := True;
  LSenderAsTComponent := Sender as TComponent;
  for I := 0 to LSenderAsTComponent.ComponentCount-1 do
  begin
    CanClose := CanClose and _CanClose(LSenderAsTComponent.Components[I], FOnUpdateScope);
    if not CanClose then
      Exit;
  end;
end;

end.
