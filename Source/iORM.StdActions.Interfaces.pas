unit iORM.StdActions.Interfaces;

interface

uses
  System.Classes, iORM.CommonTypes, System.Generics.Collections;

type

  TioShowBy = (byBSCurrent, byBSEach, byEntityTypeName, byVVMTypeName, byEntityTypeNameAsSelector, byVVMTypeNameAsSelector);
  TioViewContextBy = (vcByDefaultViewContextProvider, vcByViewContextProviderName, vcByViewContextProvider, vcByViewContext);//, vcNone);

  TioCloseQueryActionExecutionMode = (emActive, emPassive);

  IioBSCloseQueryAction = interface
    ['{BFBCB5A6-2406-435A-8C31-91593BDD9D63}']
    function _CanClose: Boolean;
    function _IsChildOf(const ATargetQueryAction: IioBSCloseQueryAction): Boolean;
    function Execute: Boolean;
    function Executing: Boolean;
    // InternalExecutionMode
    function GetInternalExecutionMode: TioCloseQueryActionExecutionMode;
    procedure SetInternalExecutionMode(const Value: TioCloseQueryActionExecutionMode);
    property InternalExecutionMode: TioCloseQueryActionExecutionMode read GetInternalExecutionMode write SetInternalExecutionMode;
    // ParentCloseQueryAction
    function GetParentCloseQueryAction: IioBSCloseQueryAction;
    procedure SetParentCloseQueryAction(const Value: IioBSCloseQueryAction);
    property ParentCloseQueryAction: IioBSCloseQueryAction read GetParentCloseQueryAction write SetParentCloseQueryAction;
  end;

  IioBSCloseQueryVMAction = interface(IioBSCloseQueryAction)
    ['{159EB42D-DBD9-44FA-A0C2-79E000634E20}']
    procedure _InjectEventHandlerOnView(const AView: TComponent);
    procedure _InjectEventHandlerOnViewModel(const AViewModelAsComponent: TComponent); // TComponent to avoid circular reference
  end;

  TioBSCloseQueryCommonBehaviour = class
  public
    class procedure InjectOnCloseQueryEventHandler(const ATarget: TComponent; const AMethod: TMethod; const ARaiseIfOnCloseQueryEventNotExists: Boolean);
    class function IsChildOf(AQueryingCloseQueryAction: IioBSCloseQueryAction; const ATargetCloseQueryAction: IioBSCloseQueryAction): Boolean;
    class function ExtractCloseQueryAction(const AView: TComponent): IioBSCloseQueryAction;
  end;

implementation

uses
  System.SysUtils, System.Rtti, iORM.RttiContext.Factory,
  iORM.Exceptions, iORM.MVVM.ViewModelBridge,
  iORM.StdActions.CloseQueryActionRegister,
  System.TypInfo;

{ TioBSCloseQueryCommonBehaviour }

class function TioBSCloseQueryCommonBehaviour.ExtractCloseQueryAction(const AView: TComponent): IioBSCloseQueryAction;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AView.ComponentCount - 1 do
    if Supports(AView.Components[I], IioBSCloseQueryAction, Result) then
      Exit;
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

class function TioBSCloseQueryCommonBehaviour.IsChildOf(AQueryingCloseQueryAction: IioBSCloseQueryAction; const ATargetCloseQueryAction: IioBSCloseQueryAction): Boolean;
begin
  Result := False;
  if not Assigned(ATargetCloseQueryAction) then
    raise EioException.Create(ClassName, 'IsChildOf', 'The "ATargetCloseQueryAction" parameter is unassigned.' +
      #13#13'This parameter cannot be left unassigned.');
  while Assigned(AQueryingCloseQueryAction) do
    if AQueryingCloseQueryAction.ParentCloseQueryAction = ATargetCloseQueryAction then
      Exit(True)
    else
      AQueryingCloseQueryAction := AQueryingCloseQueryAction.ParentCloseQueryAction;
end;

end.
