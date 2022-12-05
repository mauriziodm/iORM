unit iORM.StdActions.Interfaces;

interface

uses
  System.Classes, iORM.CommonTypes;

type

  IioBSCloseQueryAction = interface
    ['{BFBCB5A6-2406-435A-8C31-91593BDD9D63}']
    function _CanClose(const Sender: IioBSCloseQueryAction): Boolean;
  end;

  IioBSCloseQueryVMAction = interface(IioBSCloseQueryAction)
    ['{159EB42D-DBD9-44FA-A0C2-79E000634E20}']
    procedure SetViewModel(const AViewModelAsTComponent: TComponent);
    procedure _InjectEventHandlerOnView(const AView: TComponent);
    procedure _InjectEventHandlerOnViewModel(const AViewModelAsComponent: TComponent); // TComponent to avoid circular reference
  end;

  TioBSCloseQueryCommonBehaviour = class
  public
    class function CanClose(const Sender: IioBSCloseQueryAction; const AView: TComponent; const AScope: TioBSCloseQueryActionUpdateScope): Boolean;
    class function CanClose_Owned(const Sender: IioBSCloseQueryAction; const AView: TComponent; const ARecursive: Boolean): Boolean;
    class function ExtractBSCloseQueryStdAction(const AView: TComponent): IioBSCloseQueryAction;
    class procedure InjectOnCloseQueryEventHandler(const ATarget: TComponent; const AMethod: TMethod; const ARaiseIfOnCloseQueryEventNotExists: Boolean);
  end;

implementation

uses
  System.SysUtils, System.Rtti, iORM.RttiContext.Factory, Vcl.Forms,
  iORM.Exceptions, iORM.MVVM.ViewModelBridge,
  iORM.StdActions.CloseQueryActionRegister;

{ TioBSCloseQueryCommonBehaviour }

class function TioBSCloseQueryCommonBehaviour.CanClose(const Sender: IioBSCloseQueryAction; const AView: TComponent; const AScope: TioBSCloseQueryActionUpdateScope): Boolean;
begin
  Result := True;
  case AScope of
    usOwnedStrictly:
      Result := CanClose_Owned(Sender, AView, False);
    usOwnedRecursive:
      Result := CanClose_Owned(Sender, AView, True);
    usGlobal:
      Result := TioBSCloseQueryActionRegister.CanClose(Sender);
  end;
end;

class function TioBSCloseQueryCommonBehaviour.CanClose_Owned(const Sender: IioBSCloseQueryAction; const AView: TComponent; const ARecursive: Boolean): Boolean;
var
  I: Integer;
  LBSCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := True;
  for I := 0 to AView.ComponentCount-1 do
  begin
    // Se il componente � un ViewModelBridge
    if AView.Components[I] is TioViewModelBridge then
      Result := TioViewModelBridge(AView.Components[I]).ViewModel._CanClose(Sender)
    else
    // Se il componente � una CloseQueryAction
    if Supports(AView.Components[I], IioBSCloseQueryAction, LBSCloseQueryAction) then
      Result := LBSCloseQueryAction._CanClose(Sender)
    else
    // Se il componente possiede altri componenti a sua volta richiama ricorsivamente se stessa
    if ARecursive and (AView.Components[I].ComponentCount > 0) then
      Result := CanClose_Owned(Sender, AView.Components[I], ARecursive);
    // Appena Result = false esce
    if not Result then
      Exit;
  end;
end;

class function TioBSCloseQueryCommonBehaviour.ExtractBSCloseQueryStdAction(const AView: TComponent): IioBSCloseQueryAction;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AView.ComponentCount - 1 do
    if Supports(AView.Components[I], IioBSCloseQueryAction, Result) then
      Exit;
end;

class procedure TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(const ATarget: TComponent; const AMethod: TMethod; const ARaiseIfOnCloseQueryEventNotExists: Boolean);
var
  LEventProperty: TRttiProperty;
  LEventHandlerAsTValue: TValue;
begin
  LEventProperty := TioRttiFactory.GetRttiPropertyByClass(ATarget.ClassType, 'OnCloseQuery', ARaiseIfOnCloseQueryEventNotExists);
  if not Assigned(LEventProperty) then
    Exit;
  if LEventProperty.GetValue(ATarget).IsEmpty then
  begin
    TValue.Make(@AMethod, LEventProperty.PropertyType.Handle, LEventHandlerAsTValue); // Do not use the generic TValue.From<T> method
    LEventProperty.SetValue(ATarget, LEventHandlerAsTValue);
  end
  else
    raise EioException.Create(ClassName, '_InjectOnCloseEventHandler',
      Format('An "OnCloseQuery" event handler is already present in the class "%s".' +
        #13#13'Concurrent use of "%s" action and the "OnCloseQuery" event handler is not allowed.' +
        #13#13'If you need to both handle the "OnCloseQuery" event and have the standard action "%s" then you can handle the "OnCloseQuery" event on the action itself instead of the one on the class "%s".',
        [ATarget.ClassName, ClassName, ClassName, ATarget.ClassName]));
end;

end.