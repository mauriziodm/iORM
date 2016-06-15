{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.Where.DetailsContainer;

interface

uses
  iORM.Where.Interfaces, iORM.Where;

type

  TioWhereDetailsContainer = class(TInterfacedObject, IioWhereDetailsContainer)
  private
    FInternalContainer_NoDirectAccess: TioWhereDetailsContainerInternalInstance;
    function GetInternalContainerCreateIfNoAssigned: TioWhereDetailsContainerInternalInstance;
    procedure AddOrUpdate(const AMasterPropertyName: string; const AWhere: IioWhere);
    procedure Delete(const AMasterPropertyName: string);
    function Exists(const AMasterPropertyName:String): Boolean;
    function Get(const AMasterPropertyName: string): IioWhere;
    function Count: Integer;
    procedure Clear;
  public
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
    Result := nil;
end;

function TioWhereDetailsContainer.GetInternalContainerCreateIfNoAssigned: TioWhereDetailsContainerInternalInstance;
begin
  if not Assigned(FInternalContainer_NoDirectAccess) then
    FInternalContainer_NoDirectAccess := TioWhereDetailsContainerInternalInstance.Create;
  Result := FInternalContainer_NoDirectAccess
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
