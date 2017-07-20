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

unit iORM.Resolver.ByDependencyInjection;

interface

uses
  iORM.Resolver.Interfaces, System.Rtti;

type

  // Service Locator Class
  TioResolverByDependencyInjection = class(TioResolver)
  public
    // ResolveInaccurate in pratica per cercare almeno una classe che implementa l'interfaccia.
    //  Se l'alias è vuoto e non c'è una classe registrata che implementa l'interfaccia senza Alias (ma
    //  ne esiste almeno una registrata anche se con un alias) ritorna quella.
    class function ResolveInaccurateAsRttiType(const ATypeName:String; const AAlias:String): TRttiType; override;
    class function Resolve(const ATypeName:String; const AAlias:String=''; const AResolverMode:TioResolverMode=rmAll): IioResolvedTypeList; override;
  end;

implementation

uses
  iORM.DependencyInjection;

{ TioResolverByDependencyInjection }

class function TioResolverByDependencyInjection.Resolve(const ATypeName:String; const AAlias: String; const AResolverMode:TioResolverMode): IioResolvedTypeList;
begin
  inherited;
  Result := TioDependencyInjectionResolverBase.Resolve(ATypeName, AAlias, AResolverMode);
end;

class function TioResolverByDependencyInjection.ResolveInaccurateAsRttiType(
  const ATypeName, AAlias: String): TRttiType;
begin
  inherited;
  Result := TioDependencyInjectionResolverBase.ResolveInaccurateAsRttiType(ATypeName, AAlias);
end;

end.
