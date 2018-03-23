///%%%%% Tutto nuovo!!! (Preso da SqlServer)

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



unit iORM.DB.Peculiarity.Oracle.SqlGenerator;

interface

uses
  iORM.DB.Peculiarity.Generic.SqlGenerator, iORM.DB.Interfaces, iORM.Context.Interfaces;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorOracle = class(TioSqlGeneratorStructured)
  public
    class procedure GenerateSqlInsert(const AQuery: IioQuery; const AContext: IioContext); override;
    class procedure GenerateSqlNextIDBeforeInsert(const AQuery:IioQuery; const AContext:IioContext); override;
    class procedure GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext); override;
  end;

implementation

{ TioSqlGeneratorOracle }

class procedure TioSqlGeneratorOracle.GenerateSqlForExists(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT COUNT(*) FROM '
    + AContext.GetTable.GetSql
    + ' WHERE '
    + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName
  );
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorOracle.GenerateSqlInsert(const AQuery: IioQuery;
  const AContext: IioContext);
begin
  inherited;
// Passare per il Connection Manager o fare in modo che abbia tramite parametri il DbPeculiarity???
  If HasAutoIncrementIDRetrieveWithInsertQuery(AContext) Then
    AQuery.SQL.Add('RETURNING ' + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + ' INTO :'+AContext.GetProperties.GetIdProperty.GetSqlParamName);
end;

class procedure TioSqlGeneratorOracle.GenerateSqlNextIDBeforeInsert(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  AQuery.SQL.Add('SELECT '+ AContext.GetTable.GetKeyGenerator + '.Nextval FROM Dual');
end;

end.

