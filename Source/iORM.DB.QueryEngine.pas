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

unit iORM.DB.QueryEngine;

interface

uses
  iORM.Context.Interfaces, iORM.DB.Interfaces, iORM.Where,
  iORM.CommonTypes, iORM.Context.Properties.Interfaces;

type

  TioQueryEngineRef = class of TioQueryEngine;

  // INterfaccia per le classi che devono generare i vari tipi di query
  // Select/Update/Insert/Delete
  TioQueryEngine = class
  private
  protected
    class function ComposeQueryIdentity(const AContext: IioContext; const APreIdentity: String; const AIdentity: String = ''): String;
    // class procedure PersistRelationChildObject(AMasterContext: IioContext;
    // AMasterProperty: IioContextProperty);
  public
    class function GetQueryCount(const AContext: IioContext): IioQuery;
    class function GetQueryCreateIndex(const AContext: IioContext; const AIndexName: String; const ACommaSepFieldList: String;
      const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): IioQuery;
    class function GetQueryCurrentTimestamp(const AConnectionDefName: String): IioQuery;
    class function GetQueryDelete(const AContext: IioContext): IioQuery;
    class function GetQueryDropIndex(const AContext: IioContext; const AIndexName: String): IioQuery;
    class function GetQueryExists(const AContext: IioContext): IioQuery;
    class function GetQueryInsert(const AContext: IioContext): IioQuery;
    class function GetQueryNextID(const AContext: IioContext): IioQuery;
    class function GetQuerySelectList(const AContext: IioContext): IioQuery;
    class function GetQuerySelectObject(const AContext: IioContext): IioQuery;
    class function GetQueryUpdate(const AContext: IioContext): IioQuery;
  end;

implementation

uses
  iORM.DB.Factory, FireDac.Stan.Param,
  iORM.Attributes, Data.DB, iORM.Interfaces, SysUtils,
  iORM.Where.SqlItems.Interfaces, iORM.DB.ConnectionContainer;

{ TioQueryEngine }

class function TioQueryEngine.ComposeQueryIdentity(const AContext: IioContext; const APreIdentity: String; const AIdentity: String = ''): String;
begin
  Result := AContext.GetClassRef.QualifiedClassName + ':' + APreIdentity + ':' + AIdentity;
end;

class function TioQueryEngine.GetQueryDelete(const AContext: IioContext): IioQuery;
var
  LQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'DEL'));
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlDelete(LQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    LQuery.FillQueryWhereParams(AContext)
  else
    LQuery.SetObjIDWhereParam(AContext);
end;

class function TioQueryEngine.GetQueryCreateIndex(const AContext: IioContext; const AIndexName, ACommaSepFieldList: String;
  const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): IioQuery;
var
  AQuery: IioQuery;
begin
  // Get the query object, the query is always empty because without query identity
  AQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName);
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlCreateIndex(AQuery, AContext, AIndexName, ACommaSepFieldList,
      AIndexOrientation, AUnique);
end;

class function TioQueryEngine.GetQueryDropIndex(const AContext: IioContext; const AIndexName: String): IioQuery;
var
  AQuery: IioQuery;
begin
  // Get the query object, the query is always empty because without query identity
  AQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName);
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlDropIndex(AQuery, AContext, AIndexName);
end;

class function TioQueryEngine.GetQueryExists(const AContext: IioContext): IioQuery;
var
  LQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'EXIST'));
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlExists(LQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  LQuery.SetObjIDWhereParam(AContext);
end;

class function TioQueryEngine.GetQueryInsert(const AContext: IioContext): IioQuery;
var
  LProp: IioProperty;
  LQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'INS'));
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlInsert(LQuery, AContext);
  // Iterate for all properties
  for LProp in AContext.GetProperties do
  begin
    // If the current property is ReadOnly then skip it
    if not LProp.IsSqlRequestCompliant(ioInsert) then
      Continue;
    // If current property is the ID property and its value is null (0)
    // then skip its value (always NULL)
    if LProp.IsID and AContext.IDIsNull then
    begin
      LQuery.SetParamValueToNull(LProp, ftLargeInt);
      Continue;
    end;
    // If the current property is the ObjVersionProperty and versioning is enabled for this entity type
    if AContext.ObjVersionExist and AContext.IsObjVersionProperty(LProp) then
    begin
      LQuery.SetObjVersionParam(AContext);
      Continue;
    end;
    // Relation type
    case LProp.GetRelationType of
      // If RelationType = ioRTNone save the current property value normally
      // If RelationType = ioRTEmbedded save the current property value normally (serialization is into the called method)
      rtNone, rtEmbeddedHasMany, rtEmbeddedHasOne:
        LQuery.SetParamValueByContext(LProp, AContext);
      // else if RelationType = ioRTBelongsTo then save the ID
      rtBelongsTo:
        LQuery.SetIntegerParamNullIfZero(LProp, LProp.GetRelationChildObjectID(AContext.DataObject));
      // else if RelationType = ioRTHasOne
      rtHasOne: { Nothing }
        ;
      // else if RelationType = ioRTHasMany
      rtHasMany: { Nothing }
        ;
    end;
  end;
  // Add the TrueClass value if enabled
  if AContext.IsTrueClass then
    LQuery.ParamByName(AContext.TrueClass.GetSqlParamName).Value := AContext.TrueClass.GetValue;
end;

class function TioQueryEngine.GetQueryNextID(const AContext: IioContext): IioQuery;
begin
  // NB: Ho dovuto togliere la QueryIdentity (messa = '' prima era = 'LID') perchè la query per farsi
  // dare il prossimo ID dal genertore (firebird) e di questo tipo "SELECT GEN_ID(GeneratorName, 1) FROM RDB$DATABASE"
  // dove "GeneratorName" non può essere un parametro perchè da un errore (ci ho provato) e quindi ho dovuto fare
  // che il generatore di SQL genera la query con il nome del generatore hard-coded. Per quanto sopra scritto ho quindi
  // dovuto eliminare la QueryIdentity e quindi per questa query non usa il QueryContainer e viene "preparata" ogni volta
  // senza parametri.
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  // Result := TioDbFactory.Query(AContext.GetConnectionDefName, ComposeQueryIdentity(AContext, 'LID'));
  Result := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, '')); // NoQueryIdentity
  if Result.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlNextID(Result, AContext);
end;

class function TioQueryEngine.GetQueryCurrentTimestamp(const AConnectionDefName: String): IioQuery;
var
  AQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  AQuery := TioDbFactory.Query(AConnectionDefName, 'TTIMESTAMP');
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AConnectionDefName).GenerateSqlCurrentTimestamp(AQuery);
end;

class function TioQueryEngine.GetQueryCount(const AContext: IioContext): IioQuery;
var
  LQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'SELCNT'));
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlCount(LQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    LQuery.FillQueryWhereParams(AContext)
  else
    LQuery.SetObjIDWhereParam(AContext);
end;

class function TioQueryEngine.GetQuerySelectList(const AContext: IioContext): IioQuery;
var
  LQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'SELLST'));
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlSelect(LQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    LQuery.FillQueryWhereParams(AContext)
  else
    LQuery.SetObjIDWhereParam(AContext);
end;

class function TioQueryEngine.GetQuerySelectObject(const AContext: IioContext): IioQuery;
var
  LQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'SELOBJ'));
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlSelect(LQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    LQuery.FillQueryWhereParams(AContext)
  else
    LQuery.SetObjIDWhereParam(AContext);
end;

class function TioQueryEngine.GetQueryUpdate(const AContext: IioContext): IioQuery;
var
  LProp: IioProperty;
  LQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'UPD'));
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlUpdate(LQuery, AContext);
  // Iterate for all properties
  for LProp in AContext.GetProperties do
  begin
    // If the current property is ReadOnly then skip it
    if not LProp.IsSqlRequestCompliant(ioUpdate) then
      Continue;
    // If the current property is the ObjVersionProperty and versioning is enabled for this entity type
    if AContext.ObjVersionExist and AContext.IsObjVersionProperty(LProp) then
    begin
      LQuery.SetObjVersionParam(AContext);
      Continue;
    end;
    // Relation type
    case LProp.GetRelationType of
      // If RelationType = ioRTNone save the current property value normally
      // If RelationType = ioRTEmbedded save the current property value normally (serialization is into the called method)
      rtNone, rtEmbeddedHasMany, rtEmbeddedHasOne:
        LQuery.SetParamValueByContext(LProp, AContext);
      // else if RelationType = ioRTBelongsTo then save the ID
      rtBelongsTo:
        LQuery.SetIntegerParamNullIfZero(LProp, LProp.GetRelationChildObjectID(AContext.DataObject));
      // else if RelationType = ioRTHasOne
      rtHasOne: { Nothing }
        ;
      // else if RelationType = ioRTHasMany
      rtHasMany: { Nothing }
        ;
    end;
  end;
  // Add the TrueClass value if enabled
  if AContext.IsTrueClass then
    LQuery.ParamByName(AContext.TrueClass.GetSqlParamName).Value := AContext.TrueClass.GetValue;
  // Where conditions (with ObjVersion if exists for this entity type)
  LQuery.SetObjIDWhereParam(AContext);
  LQuery.WhereParamByProp(AContext.GetProperties.GetIdProperty).Value := AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant;
  if AContext.ObjVersionExist then
    LQuery.SetObjVersionWhereParam(AContext);
end;

end.
