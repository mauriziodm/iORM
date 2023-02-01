{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.MVVM.VMActionContainer;

interface

{$I ioGlobalDef.inc}   // io global definitions

uses
  System.Classes, System.Generics.Collections, iORM.MVVM.Interfaces,
  iORM.StdActions.Interfaces;

type

  TioVMActionContainer = class(TInterfacedObject, IioVMActionContainer)
  strict private
    FContainer: TDictionary<String, IioVMAction>;
    [weak] FViewModel: IioViewModelInternal;
    FBSCloseQueryAction: IioBSCloseQueryVMAction;
    procedure _InternalLoadVMActions(const AViewModel: TComponent);
  public
    constructor Create(const AViewModel: IioViewModelInternal);
    destructor Destroy; override;
    procedure Add(const AVMAction: IioVMAction);
    procedure Remove(AName: String);
    function Get(const AName: String; const ANoException: Boolean = False): IioVMAction;
    function Contains(const AName: String): Boolean;
    procedure CopyVMActions(const ADestVMActionContainer: IioVMActionContainer);
    procedure CopyVMAction(const AName: String; const ADestVMActionContainer: IioVMActionContainer);
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure BindView(const AView: TComponent);
    function BSCloseQueryAction: IioBSCloseQueryVMAction;
    function BSCloseQueryActionExists: Boolean;
  end;

implementation

uses
  System.SysUtils, iORM.Exceptions;

{ TioVMNotifyContainer }

procedure TioVMActionContainer.Add(const AVMAction: IioVMAction);
var
  LName: String;
begin
  LName := Uppercase(AVMAction.Name);
  if Contains(LName) then
    raise EioException.Create(Self.ClassName, 'Add',
      Format('You are trying to register the VMAction named "%s" (owned by "%s") on the ViewModel "%s" but an action with the same name already exists (owned by "%s").'
      + #13#13'Have you considered the possibility of prefixing the name of the action with the name of the object that owns it? (ex: ''VMCustomer.acSave'')',
      [AVMAction.Name, AVMAction.Owner.Name, (FViewModel as TComponent).Name, Get(LName).Owner.Name]));
  FContainer.Add(LName, AVMAction);
end;

procedure TioVMActionContainer.BindViewAction(const AViewAction: IioViewAction);
begin
  if Contains(AViewAction.VMActionName) then
    Get(AViewAction.VMActionName).BindViewAction(AViewAction)
  else
    raise EioException.Create(ClassName, 'BindViewAction',
      Format('Sorry, I can''t bind ViewAction "%s" with corresponding VMAction "%s" because I can''t find any VMAction with this name on ViewModel "%s".',
      [AViewAction.Name, AViewAction.VMActionName, (FViewModel as TComponent).Name]));
end;

function TioVMActionContainer.BSCloseQueryAction: IioBSCloseQueryVMAction;
begin
  Result := FBSCloseQueryAction;
end;

function TioVMActionContainer.BSCloseQueryActionExists: Boolean;
begin
  Result := Assigned(FBSCloseQueryAction);
end;

procedure TioVMActionContainer.CopyVMAction(const AName: String; const ADestVMActionContainer: IioVMActionContainer);
begin
  ADestVMActionContainer.Add(Get(Uppercase(AName), True)); // Note: raise exception if VMAction not found
end;

procedure TioVMActionContainer.CopyVMActions(const ADestVMActionContainer: IioVMActionContainer);
var
  LName: String;
begin
  for LName in FContainer.Keys do
    CopyVMAction(LName, ADestVMActionContainer);
end;

constructor TioVMActionContainer.Create(const AViewModel: IioViewModelInternal);
begin
  inherited Create;
  FBSCloseQueryAction := nil;
  FViewModel := AViewModel;
  // Create the internal container
  FContainer := TDictionary<String, IioVMAction>.Create;
end;

procedure TioVMActionContainer.Remove(AName: String);
begin
  AName := Uppercase(AName);
  FContainer.Remove(AName);
end;

destructor TioVMActionContainer.Destroy;
begin
  FContainer.Free;
  inherited;
end;

function TioVMActionContainer.Contains(const AName: String): Boolean;
begin
  Result := FContainer.ContainsKey(Uppercase(AName));
end;

function TioVMActionContainer.Get(const AName: String; const ANoException: Boolean): IioVMAction;
begin
  Result := nil;
  if FContainer.TryGetValue(Uppercase(AName), Result) or ANoException then
    Exit;
  raise EioException.Create(Self.ClassName, 'Get', Format('I''m sorry, I can''t find any VMAction named "%s" on ViewModel "%s".', [AName, (FViewModel as TComponent).Name]));
end;

procedure TioVMActionContainer._InternalLoadVMActions(const AViewModel: TComponent);
var
  I: Integer;
  LVMAction: IioVMAction;
  LBSCloseQueryAction: IioBSCloseQueryVMAction;
begin
  for I := 0 to AViewModel.ComponentCount - 1 do
  begin
    // Register the current VMAction
    if Supports(AViewModel.Components[i], IioVMAction, LVMAction) then
      Add(LVMAction);

    // If the current VMAction is a IioBSCloseQueryAction...
    if Supports(AViewModel.Components[i], IioBSCloseQueryAction, LBSCloseQueryAction) then
    begin
      if Assigned(FBSCloseQueryAction) then
        raise EioException.Create(ClassName, '_InternalLoadVMActions', Format('Hi, I''m iORM.' +
          #13#13'On ViewModel "%s" there can be only one "TioVMActionBSCloseQuery" action.' +
          #13#13'Please make sure there''s only one left and you''ll see that everything will be fine.',
          [(FViewModel as TComponent).Name]));
      LBSCloseQueryAction.SetViewModel(FViewModel as TComponent);
      LBSCloseQueryAction._InjectEventHandlerOnViewModel(FViewModel as TComponent); // Inject its OnCloseQuery event handler on ViewModel
      FBSCloseQueryAction := LBSCloseQueryAction; // Take e direct reference
    end;
  end;
end;

procedure TioVMActionContainer.BindView(const AView: TComponent);
var
  I: Integer;
  LViewAction: IioViewAction;
begin
  // Bind any ViewAction to the related VMAction registered on the ViewModel
  for I := 0 to AView.ComponentCount - 1 do
    if Supports(AView.Components[i], IioViewAction, LViewAction) then
      BindViewAction(LViewAction);
  // If a BSCloseQueryAction exists then inject its OnCloseQuery event handler on the View
  if Assigned(FBSCloseQueryAction) then
    FBSCloseQueryAction._InjectEventHandlerOnView(AView);
end;

end.
