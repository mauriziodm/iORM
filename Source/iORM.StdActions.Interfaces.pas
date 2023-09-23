{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.StdActions.Interfaces;

interface

uses
  System.Classes, iORM.CommonTypes, System.Generics.Collections;

type

  TioActionShowMode = (smBSCurrent, smBSEach, smEntityTypeName, smEntityTypeNameAsSelector, smBSTypeNameAsSelector, smEntityTypeNameAsWhereBuilder, smBSTypeNameAsWhereBuilder, smEntityTypeNameAsETM, smBSTypeNameAsETM);
  TioActionViewContextBy = (vcByDefaultViewContextProvider, vcByViewContextProviderName, vcByViewContextProvider, vcByViewContext);//, vcNone);

  TioActionExecutionMode = (emActive, emPassive);

  IioBSSlaveAction = interface
    ['{2755E391-FB7A-47D2-8A24-93C2F2EF8654}']
    function _IsEnabled: Boolean;
    procedure _SetTargetBindSource(const AObj: TObject);
    function Execute: Boolean;
    // ExecutionMode
    function GetExecutionMode: TioActionExecutionMode;
    procedure SetExecutionMode(const Value: TioActionExecutionMode);
    property ExecutionMode: TioActionExecutionMode read GetExecutionMode write SetExecutionMode;
  end;

  IioBSCloseQueryAction = interface
    ['{BFBCB5A6-2406-435A-8C31-91593BDD9D63}']
    function _CanClose: Boolean;
    function _IsChildOf(const ATargetQueryAction: IioBSCloseQueryAction): Boolean;
    function _IsEnabled: Boolean;
    function Execute: Boolean;
    function Executing: Boolean;
    // ExecutionMode
    function GetExecutionMode: TioActionExecutionMode;
    procedure SetExecutionMode(const Value: TioActionExecutionMode);
    property ExecutionMode: TioActionExecutionMode read GetExecutionMode write SetExecutionMode;
    // ParentCloseQueryAction
    function GetAction_ParentCloseQueryAction: IioBSCloseQueryAction;
    procedure SetAction_ParentCloseQueryAction(const Value: IioBSCloseQueryAction);
    property Action_ParentCloseQueryAction: IioBSCloseQueryAction read GetAction_ParentCloseQueryAction write SetAction_ParentCloseQueryAction;
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
    if AQueryingCloseQueryAction.Action_ParentCloseQueryAction = ATargetCloseQueryAction then
      Exit(True)
    else
      AQueryingCloseQueryAction := AQueryingCloseQueryAction.Action_ParentCloseQueryAction;
end;

end.
