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

unit iORM.Strategy.Factory;

interface

uses
  iORM.DB.Interfaces, iORM.Strategy.Interfaces;

type
  TioStrategyFactory = class
  public
    class function GetStrategy(const AConnectionName: String): TioStrategyRef;
    class function ConnectionTypeToStrategy(const AConnectionType: TioConnectionType): TioStrategyRef;
  end;

implementation

uses
  iORM.Strategy.DB, iORM.DB.ConnectionContainer, iORM.Strategy.REST;

{ TioStrategyFactory }

class function TioStrategyFactory.ConnectionTypeToStrategy(
  const AConnectionType: TioConnectionType): TioStrategyRef;
begin
  case AConnectionType of
    TioConnectionType.cdtREST:
      Result := TioStrategyREST;
  else
    Result := TioStrategyDB;
  end;
end;

class function TioStrategyFactory.GetStrategy(
  const AConnectionName: String): TioStrategyRef;
begin
  Result := TioConnectionManager.GetConnectionInfo(AConnectionName).Strategy;
end;

end.
