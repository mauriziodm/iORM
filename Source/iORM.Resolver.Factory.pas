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





unit iORM.Resolver.Factory;

interface

uses
  iORM.Resolver.Interfaces;

type

  TioResolverFactory = class
  public
    class function GetResolvedTypeList: IioResolvedTypeList;
    class function GetResolver(const AResolverMode:TioResolverStrategy): TioResolverRef;
  end;

implementation

uses
  iORM.Containers.List, iORM.Resolver.ByDependencyInjection, iORM.Exceptions;

{ TioResolverFactory }

class function TioResolverFactory.GetResolvedTypeList: IioResolvedTypeList;
begin
  Result := TioInterfacedList<String>.Create;
end;

class function TioResolverFactory.GetResolver(const AResolverMode: TioResolverStrategy): TioResolverRef;
begin
  case AResolverMode of
    rsByDependencyInjection: Result := TioResolverByDependencyInjection;
    rsByRtti: raise EioException.Create(Self.ClassName + ': "rtByRtti" resolver mode not yet implemented.');
    rsByMaps: raise EioException.Create(Self.ClassName + ': "rtByMaps" resolver mode not yet implemented.');
  else
    raise EioException.Create(Self.ClassName + '.GetResolver: Invalid AResolverMode.');
  end;
end;

end.
