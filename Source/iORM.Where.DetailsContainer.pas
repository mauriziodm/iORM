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
unit iORM.Where.DetailsContainer;

interface

uses
  iORM.Where.Interfaces, iORM.Where;

type

  TioWhereDetailsContainer = class(TInterfacedObject, IioWhereDetailsContainer)
  private
    FInternalContainer_NoDirectAccess: TioWhereDetailsContainerInternalInstance;
    FConnectionName: String;
    procedure AddOrUpdate(const AMasterPropertyName: string; const AWhere: IioWhere);
    procedure Clear;
    function Count: Integer;
    procedure Delete(const AMasterPropertyName: string);
    function Exists(const AMasterPropertyName:String): Boolean;
    function Get(const AMasterPropertyName: string): IioWhere;
    function GetInternalContainerCreateIfNoAssigned: TioWhereDetailsContainerInternalInstance;
    function GetKeyList: String;
    function IsEmpty: Boolean;
    procedure SetConnectionName(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TioWhereDetailsContainer }

function TioWhereDetailsContainer.Exists(
  const AMasterPropertyName: String): Boolean;
begin
  if Assigned(FInternalContainer_NoDirectAccess) then
    Result := FInternalContainer_NoDirectAccess.ContainsKey(AMasterPropertyName)
  else
    Result := False;
end;

function TioWhereDetailsContainer.Get(const AMasterPropertyName: string): IioWhere;
begin
  if not (Self.Exists(AMasterPropertyName))
  or not (Supports(FInternalContainer_NoDirectAccess.Items[AMasterPropertyName], IioWhere, Result))
  then
    Exit(nil);
end;

function TioWhereDetailsContainer.GetInternalContainerCreateIfNoAssigned: TioWhereDetailsContainerInternalInstance;
begin
  if not Assigned(FInternalContainer_NoDirectAccess) then
    FInternalContainer_NoDirectAccess := TioWhereDetailsContainerInternalInstance.Create;
  Result := FInternalContainer_NoDirectAccess
end;

function TioWhereDetailsContainer.GetKeyList: String;
var
  LKey: String;
begin
  Result := '';
  for LKey in FInternalContainer_NoDirectAccess.Keys do
    Result := Result + LKey + '; ';
end;

function TioWhereDetailsContainer.IsEmpty: Boolean;
begin
  Result := (Count = 0);
end;

procedure TioWhereDetailsContainer.SetConnectionName(const Value: String);
begin
  FConnectionName := Value;
end;

procedure TioWhereDetailsContainer.AddOrUpdate(const AMasterPropertyName: string;
  const AWhere: IioWhere);
begin
  // AWhere is assigned
  if Assigned(AWhere) then
    GetInternalContainerCreateIfNoAssigned.AddOrSetValue(AMasterPropertyName, AWhere)
  else
    // AWhere isn't assigned then remove it if exists
    if Assigned(FInternalContainer_NoDirectAccess) then
      Delete(AMasterPropertyName);
end;

procedure TioWhereDetailsContainer.Clear;
begin
  if Assigned(FInternalContainer_NoDirectAccess) then
    FInternalContainer_NoDirectAccess.Clear;
end;

function TioWhereDetailsContainer.Count: Integer;
begin
  if Assigned(FInternalContainer_NoDirectAccess) then
    Result := FInternalContainer_NoDirectAccess.Count
  else
    Result := 0;
end;

constructor TioWhereDetailsContainer.Create;
begin
  inherited;
  FInternalContainer_NoDirectAccess := TioWhereDetailsContainerInternalInstance.Create;
end;

procedure TioWhereDetailsContainer.Delete(const AMasterPropertyName: string);
begin
  if Assigned(FInternalContainer_NoDirectAccess) then
    FInternalContainer_NoDirectAccess.Remove(AMasterPropertyName);
end;

destructor TioWhereDetailsContainer.Destroy;
begin
  if Assigned(FInternalContainer_NoDirectAccess) then
    FInternalContainer_NoDirectAccess.Free;
  inherited;
end;

end.
