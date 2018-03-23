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



unit iORM.DB.Peculiarity.SqLite.SqlGenerator;

interface

uses
  iORM.Context.Interfaces,
  iORM.DB.Interfaces, iORM.Context.Table.Interfaces, iORM.CommonTypes,
  iORM.DB.Peculiarity.Generic.SqlGenerator;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorSqLite = class(TioSqlGeneratorGeneric)
  private
    class procedure GenerateSqlLastIDAfterInsert(const AQuery:IioQuery; const AContext:IioContext); override;
//    class procedure GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext); override;
//    class function GenerateSqlJoinSectionItem(const AJoinItem: IioJoinItem): String; override;
//    class procedure GenerateSqlForCreateIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String; const ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation; const AUnique:Boolean); override;
//    class procedure GenerateSqlForDropIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String); override;
  end;

implementation

uses
  System.Classes, iORM.DB.Factory, iORM.Context.Properties.Interfaces,
  iORM.Attributes, iORM.Exceptions, System.IOUtils, System.SysUtils,
  iORM.SqlTranslator
  ;

{ TioSqlGeneratorSqLite }

class procedure TioSqlGeneratorSqLite.GenerateSqlLastIDAfterInsert(const AQuery:IioQuery; const AContext:IioContext);
begin
  // Build the query text
  AQuery.SQL.Add('SELECT last_insert_rowid()');
end;

(*
class procedure TioSqlGeneratorGeneric.GenerateSqlForCreateIndex(
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
      LQueryText := LQueryText + LField + LIndexOrientationText;
    end;
  finally
    LFieldList.Free;
  end;
  // Build the query text
  // -----------------------------------------------------------------
  // compose the query text
  LQueryText := 'CREATE '
              + LUniqueText
              + 'INDEX IF NOT EXISTS '
              + AIndexName + ' ON ' + AContext.GetTable.TableName
              + ' (' + LQueryText + ')';
  // Translate the query text
  LQueryText := TioSqlTranslator.Translate(LQueryText, AContext.GetClassRef.ClassName, False);
  // Assign the query text
  AQuery.SQL.Add(LQueryText);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlDelete(const AQuery:IioQuery; const AContext:IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('DELETE FROM ' + AContext.GetTable.GetSql);
  // If a Where exist then the query is an external query else
  //  is an internal query.
  if AContext.WhereExist then
    AQuery.SQL.Add(AContext.Where.GetSql(AContext.Map))
  else
    AQuery.SQL.Add('WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlForDropIndex(
  const AQuery: IioQuery; const AContext:IioContext; AIndexName: String);
begin
  // Index Name
  AIndexName := TioSqlTranslator.Translate(AIndexName, AContext.GetClassRef.ClassName, False);
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('DROP INDEX IF EXISTS ' + AIndexName);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT EXISTS(SELECT * FROM '
    + AContext.GetTable.GetSql
    + ' WHERE '
    + AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName
    + ')'
  );
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlInsert(const AQuery:IioQuery; const AContext:IioContext);
var
  Comma: Char;
  Prop: IioContextProperty;
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('INSERT INTO ' + AContext.GetTable.GetSql);
  AQuery.SQL.Add('(');
  AQuery.SQL.Add(AContext.GetProperties.GetSql(ioInsert));
  // Add the ClassFromField if enabled
  if AContext.IsClassFromField
    then AQuery.SQL.Add(',' + AContext.ClassFromField.GetSqlFieldName);
  // -----------------------------------------------------------------
  AQuery.SQL.Add(') VALUES (');
  // -----------------------------------------------------------------
  // Iterate for all properties
  Comma := ' ';
  for Prop in AContext.GetProperties do
  begin
    // If the current property is ReadOnly then skip it
    // If the current property RelationType is HasMany then skip it
    if (not Prop.IsSqlRequestCompliant(ioInsert))
    or (Prop.GetRelationType = ioRTHasMany)
    or (Prop.GetRelationType = ioRTHasOne)
    then Continue;
    // Add the field param
    AQuery.SQL.Add(Comma + ':' + Prop.GetSqlParamName);
    Comma := ',';
  end;
  // Add the ClassFromField if enabled
  if AContext.IsClassFromField
  then AQuery.SQL.Add(',:' + AContext.ClassFromField.GetSqlParamName);
  AQuery.SQL.Add(')');
  // -----------------------------------------------------------------
end;

class function TioSqlGeneratorGeneric.GenerateSqlJoinSectionItem(
  const AJoinItem: IioJoinItem): String;
begin
  // Join
  case AJoinItem.GetJoinType of
    ioCross:      Result := 'CROSS JOIN ';
    ioInner:      Result := 'INNER JOIN ';
    ioLeftOuter:  Result := 'LEFT OUTER JOIN ';
    ioRightOuter: Result := 'RIGHT OUTER JOIN ';
    ioFullOuter:  Result := 'FULL OUTER JOIN ';
    else raise EioException.Create(Self.ClassName + ': Join type not valid.');
  end;
  // Joined table name
  Result := Result + '[' + AJoinItem.GetJoinClassRef.ClassName + ']';
  // Conditions
  if AJoinItem.GetJoinType <> ioCross
    then Result := Result + ' ON (' + AJoinItem.GetJoinCondition + ')';
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlLastIDAfter(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  //No default query
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlNextID(const AQuery:IioQuery; const AContext:IioContext);
begin
  //No default query
  // Build the query text
  AQuery.SQL.Add('SELECT last_insert_rowid()');
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlNextIDBefore(
  const AQuery: IioQuery; const AContext: IioContext);
begin
  inherited;

end;

class procedure TioSqlGeneratorGeneric.GenerateSqlSelect(const AQuery:IioQuery; const AContext:IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT ' + AContext.GetProperties.GetSql(ioSelect));
  if AContext.IsClassFromField
    then AQuery.SQL.Add(',' + AContext.ClassFromField.GetSqlFieldName);
  // From
  AQuery.SQL.Add('FROM ' + AContext.GetTable.GetSql);
  // Join
  AQuery.SQL.Add(AContext.GetJoin.GetSql(AContext.Map.GetTable.TableName));
  // If a Where exist then the query is an external query else
  //  is an internal query.
  if AContext.WhereExist then
    AQuery.SQL.Add(AContext.Where.GetSqlWithClassFromField(AContext.Map, AContext.IsClassFromField, AContext.ClassFromField))
  else
    AQuery.SQL.Add('WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName);
  // GroupBy
  AQuery.SQL.Add(AContext.GetGroupBySql);
  // OrderBy
  AQuery.SQL.Add(AContext.GetOrderBySql);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorGeneric.GenerateSqlUpdate(const AQuery:IioQuery; const AContext:IioContext);
var
  Comma: Char;
  Prop: IioContextProperty;
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('UPDATE ' + AContext.GetTable.GetSql + ' SET');
  // Iterate for all properties
  Comma := ' ';
  for Prop in AContext.GetProperties do
  begin
    // If the current property is ReadOnly then skip it
    // If the current property RelationType is HasMany then skip it
    if (not Prop.IsSqlRequestCompliant(ioInsert))
    or (Prop.GetRelationType = ioRTHasMany)
    or (Prop.GetRelationType = ioRTHasOne)
    then Continue;
    // Add the field param
    AQuery.SQL.Add(Comma + Prop.GetSqlFieldName + '=:' + Prop.GetSqlParamName);
    Comma := ',';
  end;
  // Add the ClassFromField if enabled
  if AContext.IsClassFromField
  then AQuery.SQL.Add(',' + AContext.ClassFromField.GetSqlFieldName + '=:' + AContext.ClassFromField.GetSqlParamName);
  // Where conditions
//  AQuery.SQL.Add(AContext.Where.GetSql);
  AQuery.SQL.Add('WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName);
  // -----------------------------------------------------------------
end;

*)

end.
