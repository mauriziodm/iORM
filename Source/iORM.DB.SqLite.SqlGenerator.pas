{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.DB.SqLite.SqlGenerator;

interface

uses
  iORM.Context.Interfaces,
  iORM.DB.Interfaces, iORM.Context.Table.Interfaces, iORM.CommonTypes;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorSqLite = class(TioSqlGenerator)
  public
    class procedure GenerateSqlCreateIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String;
      const ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean); override;
    class procedure GenerateSqlCurrentTimestamp(const AQuery: IioQuery; const AContext: IioContext); override;
    class procedure GenerateSqlDropIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String); override;
    class procedure GenerateSqlExists(const AQuery: IioQuery; const AContext: IioContext); override;
    class procedure GenerateSqlNextID(const AQuery: IioQuery; const AContext: IioContext); override;
    class procedure GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext); override;
  end;

implementation

uses
  System.Classes, iORM.DB.Factory, iORM.Context.Properties.Interfaces,
  iORM.Attributes, iORM.Exceptions, System.IOUtils, System.SysUtils,
  iORM.SqlTranslator;

{ TioSqlGeneratorSqLite }

class procedure TioSqlGeneratorSqLite.GenerateSqlCreateIndex(const AQuery: IioQuery; const AContext: IioContext;
  AIndexName: String; const ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
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
    ioAscending:
      LIndexOrientationText := ' ASC';
    ioDescending:
      LIndexOrientationText := ' DESC';
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
  LQueryText := 'CREATE ' + LUniqueText + 'INDEX IF NOT EXISTS ' + AIndexName + ' ON ' + AContext.GetTable.TableName + ' (' +
    LQueryText + ')';
  // Translate the query text
  LQueryText := TioSqlTranslator.Translate(LQueryText, AContext.GetClassRef.ClassName, False);
  // Assign the query text
  AQuery.SQL.Add(LQueryText);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorSqLite.GenerateSqlCurrentTimestamp(const AQuery: IioQuery; const AContext: IioContext);
begin
  AQuery.SQL.Add('SELECT STRFTIME("%Y-%m-%d %H:%M:%f", "now")');
end;

class procedure TioSqlGeneratorSqLite.GenerateSqlDropIndex(const AQuery: IioQuery; const AContext: IioContext;
  AIndexName: String);
begin
  AIndexName := TioSqlTranslator.Translate(AIndexName, AContext.GetClassRef.ClassName, False);
  AQuery.SQL.Add('DROP INDEX IF EXISTS ' + AIndexName);
end;

class procedure TioSqlGeneratorSqLite.GenerateSqlExists(const AQuery: IioQuery; const AContext: IioContext);
begin
  AQuery.SQL.Add('SELECT EXISTS(SELECT * FROM ' + AContext.GetTable.GetSql + ' WHERE ' +
    AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + '=:' +
    AContext.GetProperties.GetIdProperty.GetSqlParamName + ')');
end;

class procedure TioSqlGeneratorSqLite.GenerateSqlNextID(const AQuery: IioQuery; const AContext: IioContext);
begin
  AQuery.SQL.Add('SELECT last_insert_rowid()');
end;

class procedure TioSqlGeneratorSqLite.GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext);
begin
  inherited;
  // Limit
  if AContext.WhereExist and AContext.Where.LimitExists then
    AQuery.SQL.Add(Format('LIMIT %d OFFSET %d', [AContext.Where.GetLimitRows, AContext.Where.GetLimitOffset]));
end;

end.
