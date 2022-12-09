unit iORM.StdActions.Interfaces;

interface

uses
  System.Classes, iORM.CommonTypes;

type

  TioCloseQueryActionExecutionMode = (emActive, emPassive);

  IioBSCloseQueryAction = interface
    ['{BFBCB5A6-2406-435A-8C31-91593BDD9D63}']
    function _CanClose(const Sender: IioBSCloseQueryAction): Boolean;
    procedure _BSCloseQueryActionExecute(const Sender: IioBSCloseQueryAction);
    // InternalExecutionMode
    function GetInternalExecutionMode: TioCloseQueryActionExecutionMode;
    procedure SetInternalExecutionMode(const Value: TioCloseQueryActionExecutionMode);
    property InternalExecutionMode: TioCloseQueryActionExecutionMode read GetInternalExecutionMode write SetInternalExecutionMode;
  end;

  IioBSCloseQueryVMAction = interface(IioBSCloseQueryAction)
    ['{159EB42D-DBD9-44FA-A0C2-79E000634E20}']
    procedure SetViewModel(const AViewModelAsTComponent: TComponent);
    procedure _InjectEventHandlerOnView(const AView: TComponent);
    procedure _InjectEventHandlerOnViewModel(const AViewModelAsComponent: TComponent); // TComponent to avoid circular reference
  end;

  TioBSCloseQueryCommonBehaviour = class
  public
    class function CanClose_Owned(const Sender: IioBSCloseQueryAction; const AView: TComponent; const ARecursive, ADisableIfChildExists: Boolean): Boolean;
    class procedure Execute_Owned(const Sender: IioBSCloseQueryAction; const AView: TComponent; const ARecursive: Boolean);
    class function ExtractBSCloseQueryStdAction(const AView: TComponent): IioBSCloseQueryAction;
    class procedure InjectOnCloseQueryEventHandler(const ATarget: TComponent; const AMethod: TMethod; const ARaiseIfOnCloseQueryEventNotExists: Boolean);
    class function ExtractFirstBSCloseQueryActionFound(const AView: TComponent; const ARecursive: Boolean): IioBSCloseQueryAction;
  end;

implementation

uses
  System.SysUtils, System.Rtti, iORM.RttiContext.Factory, Vcl.Forms,
  iORM.Exceptions, iORM.MVVM.ViewModelBridge,
  iORM.StdActions.CloseQueryActionRegister;

{ TioBSCloseQueryCommonBehaviour }

class function TioBSCloseQueryCommonBehaviour.CanClose_Owned(const Sender: IioBSCloseQueryAction; const AView: TComponent;
  const ARecursive, ADisableIfChildExists: Boolean): Boolean;
var
  I: Integer;
  LBSCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := True;
  for I := 0 to AView.ComponentCount - 1 do
  begin
    // Se il componente è un ViewModelBridge
    if AView.Components[I] is TioViewModelBridge then
      Result := (not(ADisableIfChildExists and TioViewModelBridge(AView.Components[I]).ViewModel._BSCloseQueryAssigned)) or
        TioViewModelBridge(AView.Components[I]).ViewModel._CanClose(Sender)
    else
      // Se il componente è una CloseQueryAction
      if Supports(AView.Components[I], IioBSCloseQueryAction, LBSCloseQueryAction) then
        Result := (not(ADisableIfChildExists and TioViewModelBridge(AView.Components[I]).ViewModel._BSCloseQueryAssigned)) or
          LBSCloseQueryAction._CanClose(Sender)
      else
        // Se il componente possiede altri componenti a sua volta richiama ricorsivamente se stessa
        if ARecursive and (AView.Components[I].ComponentCount > 0) then
          Result := CanClose_Owned(Sender, AView.Components[I], ARecursive, ADisableIfChildExists);
    // Appena Result = false esce
    if not Result then
      Exit;
  end;
end;

class procedure TioBSCloseQueryCommonBehaviour.Execute_Owned(const Sender: IioBSCloseQueryAction; const AView: TComponent; const ARecursive: Boolean);
var
  I: Integer;
  LBSCloseQueryAction: IioBSCloseQueryAction;
begin
  for I := 0 to AView.ComponentCount - 1 do
  begin
    // Se il componente è un ViewModelBridge
    if AView.Components[I] is TioViewModelBridge then
      TioViewModelBridge(AView.Components[I]).ViewModel._BSCloseQueryActionExecute(Sender)
    else
    // Se il componente è una CloseQueryAction
    if Supports(AView.Components[I], IioBSCloseQueryAction, LBSCloseQueryAction) then
      LBSCloseQueryAction._BSCloseQueryActionExecute(Sender)
    else
      // Se il componente possiede altri componenti a sua volta richiama ricorsivamente se stessa
      if ARecursive and (AView.Components[I].ComponentCount > 0) then
        Execute_Owned(Sender, AView.Components[I], ARecursive);
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

class function TioBSCloseQueryCommonBehaviour.ExtractFirstBSCloseQueryActionFound(const AView: TComponent; const ARecursive: Boolean): IioBSCloseQueryAction;
var
  I: Integer;
  LBSCloseQueryAction: IioBSCloseQueryAction;
begin
  Result := nil;
  for I := 0 to AView.ComponentCount - 1 do
  begin
    // Se il componente è un ViewModelBridge
    if (AView.Components[I] is TioViewModelBridge) and TioViewModelBridge(AView.Components[I]).ViewModel._BSCloseQueryAssigned then
      Exit(TioViewModelBridge(AView.Components[I]).ViewModel._GetBSCloseQuery)
    else
      // Se il componente è una CloseQueryAction
      if Supports(AView.Components[I], IioBSCloseQueryAction, LBSCloseQueryAction) then
        Exit(LBSCloseQueryAction)
      else
        // Se il componente possiede altri componenti a sua volta richiama ricorsivamente se stessa
        if ARecursive and (AView.Components[I].ComponentCount > 0) then
          Result := ExtractFirstBSCloseQueryActionFound(AView.Components[I], ARecursive);
    // Appena Result <> nil esce
    if Result <> nil then
      Exit(Result);
  end;
end;

class procedure TioBSCloseQueryCommonBehaviour.InjectOnCloseQueryEventHandler(const ATarget: TComponent; const AMethod: TMethod;
  const ARaiseIfOnCloseQueryEventNotExists: Boolean);
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
