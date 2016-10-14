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

procedure TioLazyObject.SetRelationInfo(const ARelationChildTypeName,
  ARelationChildTypeAlias, ARelationChildPropertyName: String;
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
