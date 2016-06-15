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
