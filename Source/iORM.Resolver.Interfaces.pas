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





unit iORM.Resolver.Interfaces;

interface

uses
  iORM.Containers.Interfaces;

type

  // Resolver mode
  TioResolverMode = (rmAll, rmSingle);

  // Resolver strategy
  TioResolverStrategy = (rsByDependencyInjection, rsByRtti, rsByMaps);

  // Interface for the resolved type list
  IioResolvedTypeList = IioList<String>;

  // Interface for the resolvers
  TioResolverRef = class of TioResolver;
  TioResolver = class abstract
  public
    class function Resolve(const ATypeName:String; const AAlias:String=''; const AResolverMode:TioResolverMode=rmAll): IioResolvedTypeList; virtual; abstract;
  end;

implementation

uses SysUtils;

{ TioResolver }

end.
