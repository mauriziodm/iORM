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



unit iORM.LazyLoad.LazyLoadObject;

interface

uses
  System.Rtti, iORM.Where.Interfaces, System.TypInfo,
  iORM.LazyLoad.Interfaces;

type

  TioLazyObject = class(TVirtualInterface, IioLazyLoadable)
  private
    FFirstTimeRefCountToZero: Boolean;
    FInternalObj: TObject;
    FRelationChildTypeName: String;
    FRelationChildTypeAlias: String;
    FRelationChildPropertyName: String;
    FRelationChildID: Integer;
    FRelationChildWhere: IioWhere;
    procedure DoInvoke(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
    procedure CreateInternalObj;
  protected
    function _Release: Integer; override; stdcall;
  public
    constructor Create(PIID: PTypeInfo);
    destructor Destroy; override;
    procedure SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName:String; const ARelationChildID:Integer; const ARelationChildWhere:IioWhere);
    function GetInternalObject: TObject;
  end;

implementation

uses
  iORM, iORM.Where.Factory, System.SysUtils, iORM.Exceptions,
  iORM.RttiContext.Factory;

{ TioLazyObject }

constructor TioLazyObject.Create(PIID: PTypeInfo);
begin
 inherited Create(PIID, DoInvoke);
 FFirstTimeRefCountToZero := True;
end;

procedure TioLazyObject.CreateInternalObj;
begin
  if not Assigned(FRelationChildWhere) then
    FRelationChildWhere := TioWhereFactory.NewWhere;
  if not FRelationChildPropertyName.IsEmpty then
    FRelationChildWhere._PropertyEqualsTo(FRelationChildPropertyName, FRelationChildID);
  // Load the instance
  FInternalObj := io.Load(FRelationChildTypeName, FRelationChildTypeAlias)
                         ._Where(   FRelationChildWhere   )
                         .ToObject;
end;

destructor TioLazyObject.Destroy;
begin
  if Assigned(FInternalObj) then
    FInternalObj.Free;
  inherited;
end;

procedure TioLazyObject.DoInvoke(Method: TRttiMethod;
  const Args: TArray<TValue>; out Result: TValue);
var
  LDestMethod: TRttiMethod;
  LArgs: TArray<TValue>;
begin
  // Get the destination RttiMethod
  LDestMethod := TioRttiContextFactory.RttiContext.GetType(GetInternalObject.ClassInfo).GetMethod(Method.Name);
  // Do not consider the first element of Args
  LArgs := Copy(Args, 1, Length(Args));
  // Invoke the method
  Result := LDestMethod.Invoke(GetInternalObject, LArgs);
end;

function TioLazyObject.GetInternalObject: TObject;
begin
  if not Assigned(FInternalObj)
    then Self.CreateInternalObj;
  Result := FInternalObj;
end;

procedure TioLazyObject.SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String;
  const ARelationChildID: Integer; const ARelationChildWhere: IioWhere);
begin
  FRelationChildTypeName := ARelationChildTypeName;
  FRelationChildTypeAlias := ARelationChildTypeAlias;
  FRelationChildPropertyName := ARelationChildPropertyName;
  FRelationChildID := ARelationChildID;
  FRelationChildWhere := ARelationChildWhere;
end;

function TioLazyObject._Release: Integer;
begin
// Ritorno il risultato come TObject e questo farebbe si che verrebbe distrutto se non avessi
//  alterato artificiosamente la gestione del RefCount. In pratica l'override del metodo _Release
//  fa si che la prima volta che il RefCount diventa zero questo venga ignorato (il comportamento
//  ritorna normale successivamente).
{$IFNDEF AUTOREFCOUNT}
  if FFirstTimeRefCountToZero then
  begin
    Result := AtomicDecrement(FRefCount);
    if Result = 0 then
      FFirstTimeRefCountToZero := False;
  end
  else
    Result := Inherited;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;

end.
