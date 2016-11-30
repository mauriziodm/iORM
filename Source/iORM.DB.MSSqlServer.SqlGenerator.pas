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



unit iORM.DB.MSSqlServer.SqlGenerator;

interface

uses
  iORM.DB.SqLite.SqlGenerator, iORM.DB.Interfaces, iORM.Context.Interfaces;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorMSSqlServer = class(TioSqlGeneratorSqLite)
  public
    class procedure GenerateSqlNextID(const AQuery:IioQuery; const AContext:IioContext); override;
    class procedure GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext); override;
  end;

implementation

{ TioSqlGeneratorMSSqlServer }

class procedure TioSqlGeneratorMSSqlServer.GenerateSqlForExists(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT CAST(CASE WHEN EXISTS (SELECT * FROM '
    + AContext.GetTable.GetSql
    + ' WHERE '
    + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName
    + ') THEN 1 ELSE 0 END AS INTEGER)'
  );
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorMSSqlServer.GenerateSqlNextID(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  AQuery.SQL.Add('select @@IDENTITY');
end;

end.
