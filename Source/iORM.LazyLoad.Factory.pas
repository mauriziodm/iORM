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
