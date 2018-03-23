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



unit iORM.DB.Peculiarity.Postgres.SqlGenerator;

interface

uses
  iORM.DB.Peculiarity.Generic.SqlGenerator, iORM.DB.Interfaces, iORM.Context.Interfaces;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorPostgres = class(TioSqlGeneratorStructured)
  private
    class procedure GenerateSqlInsert(const AQuery: IioQuery; const AContext: IioContext); override;
//    class procedure GenerateSqlNextID(const AQuery:IioQuery; const AContext:IioContext); override;
    class procedure GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext); override;
  end;

implementation

{ TioSqlGeneratorPosrgres }

class procedure TioSqlGeneratorPostgres.GenerateSqlForExists(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT CASE WHEN (EXISTS(SELECT * FROM '
    + AContext.GetTable.GetSql
    + ' WHERE '
    + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName
    + ')) THEN 1 ELSE 0 END'
  );
  // -----------------------------------------------------------------
end;

(*
class procedure TioSqlGeneratorPostgres.GenerateSqlNextID(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  AQuery.SQL.Add('SELECT CURRVAL(''' + AContext.GetTable.GetKeyGenerator + '_id_seq'')');
//%%%% NON MI PIACE!!! non posso variare il suffisso '_id_seq' al KeyGenerator in nessun modo da attributi!!!
end;
*)

class procedure TioSqlGeneratorPostgres.GenerateSqlInsert(const AQuery:IioQuery; const AContext:IioContext);
begin
  Inherited;
  AQuery.SQL.Add('RETURNING ' + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + ' as ' + AContext.GetProperties.GetIdProperty.GetSqlParamName);
end;

end.

