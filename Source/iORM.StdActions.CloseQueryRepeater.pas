unit iORM.StdActions.CloseQueryRepeater;

interface

uses
  System.Classes, iORM.MVVM.ViewModelBridge;

type

  TioCloseQueryRepeater = class (TComponent)
  private
    procedure _InjectOnCloseEventHandler;
    function _ExtractViewModelBridgeFromSubComponents: TioViewModelBridge;
  protected
    procedure Loaded; override;
  public
  published
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
  end;


implementation

uses
  System.Rtti, iORM.RttiContext.Factory, Vcl.Forms, iORM.Exceptions,
  System.SysUtils;

{ TioCloseQueryRepeater }

procedure TioCloseQueryRepeater.Loaded;
begin
  inherited;
  _InjectOnCloseEventHandler;
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
  // Prima cerca se c'è un ViewModelBridge su se stesso
  LViewModelBridge := TioViewModelBridge.ExtractVMBridge(Self);
  // Poi se non lo ho ha anccora trovato lo cerca tra i suoi components (solo 1 livello)
  if not Assigned(LViewModelBridge) then
    LViewModelBridge := _ExtractViewModelBridgeFromSubComponents;
  // Se ha trovato...
  if Assigned(LViewModelBridge) then
    CanClose := LViewModelBridge.ViewModel.CloseQuery;
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
  LEventProperty := TioRttiFactory.GetRttiPropertyByClass(Owner.ClassType, 'OnCloseQuery');
  if not Assigned(LEventProperty) then
    Exit;
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
        #13#13'Concurrent use of "%s" action and the "OnCloseQuery" event handler is not allowed.',
        [Owner.ClassName, ClassName]));
end;

end.
