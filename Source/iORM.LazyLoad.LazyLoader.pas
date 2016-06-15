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
  if Self.FioRelationChildPropertyName = ''
    then
    begin
      FInternalObj := T.Create;
      TioDuckTypedFactory.DuckTypedList(FInternalObj).OwnsObjects := FOwnsObjects;
    end
    else FInternalObj := io.Load(FioRelationChildTypeName, FioRelationChildTypeAlias)
                                ._PropertyEqualsTo(FioRelationChildPropertyName, FioRelationChildID)
                                ._And(   FioRelationChildWhere   )  // Eventuale detail where
                                ._OrderBy(   Self.GetOrderByInstanceNilAsDefault   )  // Eventuale OrderBy
                                .ToGenericList.OfType<T>('', Self.FOwnsObjects);
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
