{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.DB.Firebird.SqlGenerator;

interface

uses
  iORM.DB.SqLite.SqlGenerator, iORM.DB.Interfaces,
  iORM.Context.Interfaces, iORM.CommonTypes;

type

  // Classe che si occupa di generare il codice SQL delle varie query
  TioSqlGeneratorFirebird = class(TioSqlGenerator)
  protected
    class function BuildIndexName(const AContext: IioContext; const ACommaSepFieldList: String;
      const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String; override;
  public
    class procedure GenerateSqlCreateIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String;
      const ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean); override;
    class procedure GenerateSqlCurrentTimestamp(const AQuery: IioQuery); override;
    class procedure GenerateSqlDropIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String); override;
    class procedure GenerateSqlExists(const AQuery: IioQuery; const AContext: IioContext); override;
    class procedure GenerateSqlNextID(const AQuery: IioQuery; const AContext: IioContext); override;
    class procedure GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext); override;
  end;

implementation

uses
  System.Classes, System.SysUtils, iORM.SqlTranslator;

{ TioSqlGeneratorFirebird }

class function TioSqlGeneratorFirebird.BuildIndexName(const AContext: IioContext; const ACommaSepFieldList: String;
  const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String;
var
  // LFieldList: TStrings;
  // LField: String;
  LGuid: TGUID;
begin
  // M.M. 11/08/18 Non chiama la funzione ereditata perch� per FIREBIRD i nome degli indici hanno lunghezza massima 31 char

  // Build the indexname
  // Result := 'IDX_' + AContext.GetTable.TableName;
  // Field list
  // LFieldList := TStringList.Create;
  // try
  // LFieldList.Delimiter := ',';
  // LFieldList.DelimitedText := ACommaSepFieldList;
  // for LField in LFieldList do
  // Result := Result + '_' + LField.Substring(0,5).Trim;   // TODO: si pu� pensare anche ad un progressivo
  // finally
  // LFieldList.Free;
  // end;

  Result := 'IDX';
  // Prende gli ultimi 10 caratteri di un GUID
  CreateGUID(LGuid);
  Result := Result + '_' + LGuid.ToString.Replace('-', '', [rfReplaceAll]).Replace('}', '', [rfReplaceAll]).Substring(24);

  // Index orientation
  case AIndexOrientation of
    ioAscending:
      Result := Result + '_A';
    ioDescending:
      Result := Result + '_D';
  end;
  // Unique
  if AUnique then
    Result := Result + '_U';
  // Translate
  Result := TioSqlTranslator.Translate(Result, AContext.GetClassRef.ClassName, False);
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlCreateIndex(const AQuery: IioQuery; const AContext: IioContext;
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
      LIndexOrientationText := ' ASCENDING ';
    ioDescending:
      LIndexOrientationText := ' DESCENDING ';
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
  LQueryText := 'CREATE ' + LUniqueText + LIndexOrientationText + 'INDEX ' + AIndexName + ' ON ' + AContext.GetTable.TableName +
    ' (' + LQueryText + ')';
  // Translate the query text
  LQueryText := TioSqlTranslator.Translate(LQueryText, AContext.GetClassRef.ClassName, False);
  // Assign the query text
  AQuery.SQL.Add(LQueryText);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlCurrentTimestamp(const AQuery: IioQuery);
begin
  inherited;
  // Sembra che venga ritornato l'orario UTC e non del fuso orario locale
  AQuery.SQL.Add('SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE');
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlDropIndex(const AQuery: IioQuery; const AContext: IioContext;
  AIndexName: String);
begin
  // Index Name
  AIndexName := TioSqlTranslator.Translate(AIndexName, AContext.GetClassRef.ClassName, False);
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('DROP INDEX ' + AIndexName);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlExists(const AQuery: IioQuery; const AContext: IioContext);
begin
  // No inherited
  // inherited;
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT CASE WHEN (EXISTS(SELECT * FROM ' + AContext.GetTable.GetSql + ' WHERE ' +
    AContext.GetProperties.GetIdProperty.GetSqlQualifiedFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlWhereParamName +
    ')) THEN 1 ELSE 0 END FROM RDB$DATABASE');
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlNextID(const AQuery: IioQuery; const AContext: IioContext);
begin
  // No inherited
  // inherited;
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('SELECT GEN_ID(' + AContext.GetTable.GetKeyGenerator + ',1) FROM RDB$DATABASE');
  // -----------------------------------------------------------------
end;

class procedure TioSqlGeneratorFirebird.GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext);
begin
  inherited;
  // Limit
  if AContext.WhereExist and AContext.Where.LimitExists then
    AQuery.SQL[0] := Format('SELECT FIRST %d SKIP %d', [AContext.Where.GetLimitRows, AContext.Where.GetLimitOffset]);
  // -----------------------------------------------------------------
end;

end.
