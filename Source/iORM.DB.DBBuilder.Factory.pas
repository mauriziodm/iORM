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


unit iORM.DB.DBBuilder.Factory;

interface

uses
  System.TypInfo,
  System.Rtti,
  System.Classes,
  iORM.DB.DBBuilder.Interfaces,
  iORM.DB.Interfaces,
  iORM.Context.Properties.Interfaces,
  Data.DB;

type
  TioDBBuilderFactory = class
  public
    class function NewSqlGenerator: IioDBBuilderSqlGenerator;
    class function NewBuilder: IioDBBuilder;
  end;

implementation

uses
  System.SysUtils,
  iORM.Exceptions,
  iORM.Attributes,
  iORM.DB.ConnectionContainer,
  iORM.DB.DBBuilder.Engine,
  iORM.DB.DBBuilder.MSSqlServer.SqlGenerator;

{ TioDBBuilderFactory }

class function TioDBBuilderFactory.NewBuilder: IioDBBuilder;
begin
  Result := TioDBBuilder.Create;
end;

class function TioDBBuilderFactory.NewSqlGenerator: IioDBBuilderSqlGenerator;
begin
  case TioConnectionManager.GetConnectionInfo.ConnectionType of
    //cdtFirebird:  Result := TioSqlDataConverterFirebird;
    //cdtSQLite:    Result := TioDBBuilderSqLiteServerSqlGenerator;
    cdtSQLServer: Result := TioDBBuilderMSSqlServerSqlGenerator.Create;
  else
    raise EioException.Create(Self.ClassName, 'NewSqlService', 'Connection type not found.');
  end;
end;

end.



