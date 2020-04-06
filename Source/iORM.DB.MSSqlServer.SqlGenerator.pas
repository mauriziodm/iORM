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
  System.Classes,
  System.SysUtils,
  iORM.DB.SqLite.SqlGenerator, iORM.DB.Interfaces, iORM.Context.Interfaces,
  iORM.CommonTypes;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorMSSqlServer = class(TioSqlGeneratorSqLite)
  public
    class procedure GenerateSqlNextID(const AQuery:IioQuery; const AContext:IioContext); override;
    class procedure GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext); override;
    class procedure GenerateSqlForCreateIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String; const ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation; const AUnique:Boolean); override;
  end;

implementation

uses
  iORM.SqlTranslator;

{ TioSqlGeneratorMSSqlServer }

class procedure TioSqlGeneratorMSSqlServer.GenerateSqlForExists(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT CAST(CASE WHEN EXISTS (SELECT * FROM '
    + AContext.GetTable.GetSql(AContext.GetConnectionDefName)
    + ' WHERE '
    + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName(AContext.GetConnectionDefName) + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName
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

class procedure TioSqlGeneratorMSSqlServer.GenerateSqlForCreateIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String; const ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation; const AUnique:Boolean);
var
  LFieldList: TStrings;
  LQueryText, LIndexOrientationText, LField, LUniqueText: String;
begin
  // Index Name
  if AIndexName.IsEmpty then
    AIndexName := Self.BuildIndexName(AContext, ACommaSepFieldList, AIndexOrientation, AUnique)
  else
    AIndexName := TioSqlTranslator.Translate(AIndexName, AContext.GetConnectionDefName, AContext.GetClassRef.ClassName, False);
  // Index orientation
  case AIndexOrientation of
    ioAscending: LIndexOrientationText := ' ASC';
    ioDescending:  LIndexOrientationText := ' DESC';
  end;
  // Unique
  if AUnique then
    LUniqueText := 'UNIQUE '
  else
    LUniqueText := '';
  // Field list
  LFieldList := TStringList.Create;
  try
    LFieldList.Delimiter := ',';
    LFieldList.DelimitedText := ACommaSepFieldList;
    LQueryText := '';
    for LField in LFieldList do
    begin
      if not LQueryText.IsEmpty then
        LQueryText := LQueryText + ', ';
      LQueryText := LQueryText + LField + LIndexOrientationText;
    end;
  finally
    LFieldList.Free;
  end;
  // Build the query text
  // -----------------------------------------------------------------
  // compose the query text
//  LQueryText := 'IF OBJECT_ID('+ QuotedStr(AIndexName)+') IS NOT NULL '+sLineBreak  // Prevents Error if Index not exists
//              + 'BEGIN ' + sLineBreak
//              + '  DROP '
//              + LUniqueText
//              + 'INDEX '
//              + AIndexName + ' ON ' + AContext.GetTable.TableName + ' ' + sLineBreak
//              + '  CREATE '
//              + LUniqueText
//              + 'INDEX '
//              + AIndexName + ' ON ' + AContext.GetTable.TableName
//              + ' (' + LQueryText + ')' + sLineBreak + ' '
//              + 'END '+ sLineBreak
//              + 'ELSE ' + sLineBreak
//              + '  CREATE '
//              + LUniqueText
//              + 'INDEX '
//              + AIndexName + ' ON ' + AContext.GetTable.TableName
//              + ' (' + LQueryText + ')';

  LQueryText := '  CREATE '
              + LUniqueText
              + 'INDEX '
              + AIndexName + ' ON ' + AContext.GetTable.TableName
              + ' (' + LQueryText + ')';

  // Translate the query text
  LQueryText := TioSqlTranslator.Translate(LQueryText, AContext.GetConnectionDefName, AContext.GetClassRef.ClassName, False);
  // Assign the query text
  AQuery.SQL.Add(LQueryText);
  // -----------------------------------------------------------------
end;


end.
