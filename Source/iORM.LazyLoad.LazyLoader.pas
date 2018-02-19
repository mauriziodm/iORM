{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



unit iORM.LazyLoad.LazyLoader;

interface

uses
  iORM.CommonTypes, iORM.LazyLoad.Interfaces,
  iORM.LiveBindings.Interfaces, iORM.Where.Interfaces,
  iORM.Where.SqlItems.Interfaces;

type

  TioLazyLoader<T:class,constructor> = class(TInterfacedObject, IioLazyLoader<T>)
  strict private
    FInternalObj: T;
    FOwnsObjects: Boolean;
    FioRelationChildTypeName: String;
    FioRelationChildTypeAlias: String;
    FioRelationChildPropertyName: String;
    FioRelationChildID: Integer;
    FioRelationChildWhere: IioWhere;
  strict protected
    procedure CreateInternalObj;
    function GetOrderByInstanceNilAsDefault: IioSqlItemWhere;
  public
    constructor Create(AOwnsObjects:Boolean=True); overload;
    destructor Destroy; override;
    procedure SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName:String; const ARelationChildID:Integer; const ARelationChildWhere:IioWhere);
    function GetInternalObj: T;
    // OwnsObject property
    procedure SetOwnsObjects(Value: Boolean);
    function GetOwnsObjects: Boolean;
  end;

implementation

uses
  iORM, iORM.DuckTyped.Interfaces, iORM.DuckTyped.Factory;

{ TioLazyLoader<T> }

constructor TioLazyLoader<T>.Create(AOwnsObjects: Boolean);
begin
  inherited Create;
  FOwnsObjects := AOwnsObjects;
  FInternalObj := nil;
end;

procedure TioLazyLoader<T>.CreateInternalObj;
begin
  if Self.FioRelationChildPropertyName = '' then
  begin
      FInternalObj := T.Create;
      TioDuckTypedFactory.DuckTypedList(FInternalObj).OwnsObjects := FOwnsObjects;
  end
  else
  begin
    io.ShowWait;
    try
      FInternalObj := io.Load(FioRelationChildTypeName, FioRelationChildTypeAlias)
        ._PropertyEqualsTo(FioRelationChildPropertyName, FioRelationChildID)
        ._And(   FioRelationChildWhere   )  // Eventuale detail where
        ._OrderBy(   Self.GetOrderByInstanceNilAsDefault   )  // Eventuale OrderBy
        .ToGenericList.OfType<T>('', Self.FOwnsObjects);
    finally
      io.HideWait;
    end;
  end;
end;

destructor TioLazyLoader<T>.Destroy;
begin
  if Assigned(FInternalObj) then FInternalObj.Free;
  inherited;
end;

function TioLazyLoader<T>.GetInternalObj: T;
begin
  if not Assigned(FInternalObj)
    then Self.CreateInternalObj;
  Result := FInternalObj;
end;

function TioLazyLoader<T>.GetOrderByInstanceNilAsDefault: IioSqlItemWhere;
begin
  if Assigned(FioRelationChildWhere) then
    Result := FioRelationChildWhere.GetOrderByInstance
  else
    Result := nil;
end;

function TioLazyLoader<T>.GetOwnsObjects: Boolean;
begin
  Result := FOwnsObjects;
end;

procedure TioLazyLoader<T>.SetOwnsObjects(Value: Boolean);
begin
  FOwnsObjects := Value;
end;

procedure TioLazyLoader<T>.SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias,
  ARelationChildPropertyName: String; const ARelationChildID: Integer; const ARelationChildWhere:IioWhere);
begin
  FioRelationChildTypeName := ARelationChildTypeName;
  FioRelationChildTypeAlias := ARelationChildTypeAlias;
  FioRelationChildPropertyName := ARelationChildPropertyName;
  FioRelationChildID := ARelationChildID;
  FioRelationChildWhere := ARelationChildWhere;
end;

end.
