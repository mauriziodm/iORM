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
  System.Classes, System.Generics.Collections, iORM.MVVM.Interfaces;

type

  TioVMActionContainer = class(TInterfacedObject, IioVMActionContainer)
  strict private
    FContainer: TDictionary<String, IioVMAction>;
    FOwner: TComponent;
    procedure LoadVMActionsFromView(const AView: TComponent);
  public
    constructor Create(const AOwner: TComponent);
    destructor Destroy; override;
    procedure Add(const AVMAction: IioVMAction);
    procedure Remove(AName: String);
    function Get(const AName: String; const ANoException: Boolean = False): IioVMAction;
    function Contains(const AName: String): Boolean;
    procedure CopyVMActions(const ADestVMActionContainer: IioVMActionContainer);
    procedure CopyVMAction(const AName: String; const ADestVMActionContainer: IioVMActionContainer);
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure BindView(const AView: TComponent);
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
      [AVMAction.Name, AVMAction.Owner.Name, FOwner.Name, Get(LName).Owner.Name]));
  FContainer.Add(LName, AVMAction);
end;

procedure TioVMActionContainer.BindViewAction(const AViewAction: IioViewAction);
begin
  if Contains(AViewAction.VMActionName) then
    Get(AViewAction.VMActionName).BindViewAction(AViewAction)
  else
    raise EioException.Create(ClassName, 'BindViewAction',
      Format('Sorry, I can''t bind ViewAction "%s" with corresponding VMAction "%s" because I can''t find any VMAction with this name on ViewModel "%s".',
      [AViewAction.Name, AViewAction.VMActionName, FOwner.Name]));
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

constructor TioVMActionContainer.Create(const AOwner: TComponent);
begin
  inherited Create;
  FOwner := AOwner;
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
  raise EioException.Create(Self.ClassName, 'Get', Format('I''m sorry, I can''t find any VMAction named "%s" on ViewModel "%s".', [AName, FOwner.Name]));
end;

procedure TioVMActionContainer.LoadVMActionsFromView(const AView: TComponent);
var
  I: Integer;
  LVMAction: IioVMAction;
begin
  for I := 0 to AView.ComponentCount - 1 do
    if Supports(AView.Components[i], IioVMAction, LVMAction) then
      Add(LVMAction);
end;

procedure TioVMActionContainer.BindView(const AView: TComponent);
var
  I: Integer;
  LViewAction: IioViewAction;
begin
  // Capture any VMAction present in the view.
  LoadVMActionsFromView(AView);
  // Bind any ViewAction to the related VMAction registered on the ViewModel
  for I := 0 to AView.ComponentCount - 1 do
    if Supports(AView.Components[i], IioViewAction, LViewAction) then
      BindViewAction(LViewAction);
end;

end.
