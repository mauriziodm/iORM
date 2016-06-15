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



unit iORM.LazyLoad.Factory;

interface

uses
  iORM.LazyLoad.LazyLoader, iORM.LazyLoad.Interfaces,
  iORM.Where.Interfaces, System.TypInfo;

type

  TioLazyLoadFactory = class
  public
    class function LazyLoader<T:class,constructor>(AOwnsObjects:Boolean=True): IioLazyLoader<T>;
    class function LazyLoadObject(const ATypeInfo:PTypeInfo; const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName:String; const ARelationChildID:Integer; const ARelationChildWhere:IioWhere): TObject;
  end;

implementation

uses
  iORM.LazyLoad.LazyLoadObject, iORM.Rtti.Utilities, iORM.Exceptions;

{ TioLazyLoadFactory }

class function TioLazyLoadFactory.LazyLoader<T>(
  AOwnsObjects: Boolean): IioLazyLoader<T>;
begin
  Result := TioLazyLoader<T>.Create(AOwnsObjects);
end;

class function TioLazyLoadFactory.LazyLoadObject(const ATypeInfo:PTypeInfo; const ARelationChildTypeName,
  ARelationChildTypeAlias, ARelationChildPropertyName: String;
  const ARelationChildID: Integer;
  const ARelationChildWhere: IioWhere): TObject;
var
  LLazyLadable: IioLazyLoadable;
begin
  LLazyLadable := TioLazyObject.Create(ATypeInfo);
  LLazyLadable.SetRelationInfo(ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationChildID, ARelationChildWhere);
  // Ritorno il risultato come TObject e questo farebbe si che verrebbe distrutto se non avessi
  //  alterato artificiosamente la gestione del RefCount. In pratica l'override del metodo _Release
  //  fa si che la prima volta che il RefCount diventa zero questo venga ignorato (il comportamento
  //  ritorna normale successivamente).
  Result := LLazyLadable as TObject;
end;

end.
