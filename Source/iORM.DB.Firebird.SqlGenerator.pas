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



unit iORM.DB.Firebird.SqlGenerator;

interface

uses
  iORM.DB.SqLite.SqlGenerator, iORM.DB.Interfaces,
  iORM.Context.Interfaces, iORM.CommonTypes;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorFirebird = class(TioSqlGeneratorSqLite)
  public
    class procedure GenerateSqlNextID(const AQuery:IioQuery; const AContext:IioContext); override;
    class procedure GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext); override;
    class procedure GenerateSqlForCreateIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String; const ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation; const AUnique:Boolean); override;
    class procedure GenerateSqlForDropIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String); override;
  end;

implementation

uses
  System.Classes, System.SysUtils, iORM.SqlTranslator;

{ TioSqlGeneratorFirebird }

class procedure TioSqlGeneratorFirebird.GenerateSqlForCreateIndex(
  const AQuery: IioQuery; const AContext:IioContext; AIndexName:String;
  const ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation;
  const AUnique: Boolean);
var
  LFieldList: TStrings;
  LQueryText, LIndexOrientationText, LField, LUniqueText: String;
begin
  // Index Name
  if AIndexName.IsEmpty then
    AIndexName := Self.BuildIndexName(AContext, ACommaSepFieldList, AIndexOrientation, AUnique)
  else
    AIndexName := TioSqlTranslator.Translate(AIndexName, AContext.GetClassRef.ClassName, False);
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
      LQueryText := LQueryText + LField;
    end;
  finally
    LFieldList.Free;
  end;
  // Build the query text
  // -----------------------------------------------------------------
  // compose the query text
  LQueryText := 'CREATE '
              + LUniqueText
              + LIndexOrientationText
              + 'INDEX '
              + AIndexName + ' ON ' + AContext.GetTable.TableName
              + ' (' + LQueryText + ')';
  // Translate the query text
  LQueryText := TioSqlTranslator.Translate(LQueryText, AContext.GetClassRef.ClassName, False);
  // Assign the query text
  AQuery.SQL.Add(LQueryText);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlForDropIndex(
  const AQuery: IioQuery; const AContext:IioContext; AIndexName: String);
begin
  // Index Name
  AIndexName := TioSqlTranslator.Translate(AIndexName, AContext.GetClassRef.ClassName, False);
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('DROP INDEX ' + AIndexName);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlForExists(const AQuery: IioQuery; const AContext: IioContext);
begin
// No inherited
//  inherited;
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT CASE WHEN (EXISTS(SELECT * FROM ' + AContext.GetTable.GetSql
    + ' WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + '=:'
    + AContext.GetProperties.GetIdProperty.GetSqlParamName
    + ')) THEN 1 ELSE 0 END FROM RDB$DATABASE');
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlNextID(const AQuery: IioQuery; const AContext: IioContext);
begin
// No inherited
//  inherited;
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT GEN_ID(' + AContext.GetTable.GetKeyGenerator + ',1) FROM RDB$DATABASE');
  // -----------------------------------------------------------------
end;

end.
