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
