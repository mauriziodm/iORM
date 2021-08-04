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
    class procedure SetObjVersionQueryParam(const AContext: IioContext; const AProp: IioContextProperty; const AQuery: IioQuery);
    class procedure SetObjVersionQueryWhereParam(const AContext: IioContext; const AQuery: IioQuery);
    class procedure SetIntegerToQueryParamNullIfZero(const AParam: TioParam; const AValue: Integer);
    class function ComposeQueryIdentity(const AContext: IioContext; const APreIdentity: String; const AIdentity: String = ''): String;
    class procedure FillQueryWhereParams(const AContext: IioContext; const AQuery: IioQuery);
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
  AQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  AQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'DEL'));
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlDelete(AQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    Self.FillQueryWhereParams(AContext, AQuery)
  else
    AQuery.WhereParamByProp(AContext.GetProperties.GetIdProperty).Value := AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant;
end;

class procedure TioQueryEngine.FillQueryWhereParams(const AContext: IioContext; const AQuery: IioQuery);
var
  ASqlItem: IioSqlItem;
  ASqlItemWhere: IioSqlItemWhere;
begin
  for ASqlItem in AContext.Where.GetWhereItems do
  begin
    if Supports(ASqlItem, IioSqlItemWhere, ASqlItemWhere) and ASqlItemWhere.HasParameter then
      AQuery.ParamByName(ASqlItemWhere.GetSqlParamName(AContext.Map)).Value := ASqlItemWhere.GetValue(AContext.Map).AsVariant;
  end;
  if AContext.IsTrueClass then
    AQuery.ParamByName(AContext.TrueClass.GetSqlParamName).Value := '%' + AContext.TrueClass.GetClassName + '%';
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
  AQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  AQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'EXIST'));
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlExists(AQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  AQuery.WhereParamByProp(AContext.GetProperties.GetIdProperty).Value := AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant;
end;

class function TioQueryEngine.GetQueryInsert(const AContext: IioContext): IioQuery;
var
  LProp: IioContextProperty;
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
      SetObjVersionQueryParam(AContext, LProp, LQuery);
      Continue;
    end;
    // Relation type
    case LProp.GetRelationType of
      // If RelationType = ioRTNone save the current property value normally
      // If RelationType = ioRTEmbedded save the current property value normally (serialization is into the called method)
      ioRTNone, ioRTEmbeddedHasMany, ioRTEmbeddedHasOne:
        LQuery.SetParamValueByContext(LProp, AContext);
      // else if RelationType = ioRTBelongsTo then save the ID
      ioRTBelongsTo:
        Self.SetIntegerToQueryParamNullIfZero(LQuery.ParamByProp(LProp), LProp.GetRelationChildObjectID(AContext.DataObject));
      // else if RelationType = ioRTHasOne
      ioRTHasOne: { Nothing }
        ;
      // else if RelationType = ioRTHasMany
      ioRTHasMany: { Nothing }
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
  AQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  AQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'SELCNT'));
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlCount(AQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    Self.FillQueryWhereParams(AContext, AQuery)
  else
    AQuery.WhereParamByProp(AContext.GetProperties.GetIdProperty).Value := AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant;
end;

class function TioQueryEngine.GetQuerySelectList(const AContext: IioContext): IioQuery;
var
  AQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  AQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'SELLST'));
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlSelect(AQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    Self.FillQueryWhereParams(AContext, AQuery)
  else
    AQuery.WhereParamByProp(AContext.GetProperties.GetIdProperty).Value := AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant;
end;

class function TioQueryEngine.GetQuerySelectObject(const AContext: IioContext): IioQuery;
var
  AQuery: IioQuery;
begin
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  AQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, ComposeQueryIdentity(AContext, 'SELOBJ'));
  Result := AQuery;
  if AQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlSelect(AQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    Self.FillQueryWhereParams(AContext, AQuery)
  else
    AQuery.WhereParamByProp(AContext.GetProperties.GetIdProperty).Value := AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant;
end;

class function TioQueryEngine.GetQueryUpdate(const AContext: IioContext): IioQuery;
var
  LProp: IioContextProperty;
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
      SetObjVersionQueryParam(AContext, LProp, LQuery);
      Continue;
    end;
    // Relation type
    case LProp.GetRelationType of
      // If RelationType = ioRTNone save the current property value normally
      // If RelationType = ioRTEmbedded save the current property value normally (serialization is into the called method)
      ioRTNone, ioRTEmbeddedHasMany, ioRTEmbeddedHasOne:
        LQuery.SetParamValueByContext(LProp, AContext);
      // else if RelationType = ioRTBelongsTo then save the ID
      ioRTBelongsTo:
        SetIntegerToQueryParamNullIfZero(LQuery.ParamByProp(LProp), LProp.GetRelationChildObjectID(AContext.DataObject));
      // else if RelationType = ioRTHasOne
      ioRTHasOne: { Nothing }
        ;
      // else if RelationType = ioRTHasMany
      ioRTHasMany: { Nothing }
        ;
    end;
  end;
  // Add the TrueClass value if enabled
  if AContext.IsTrueClass then
    LQuery.ParamByName(AContext.TrueClass.GetSqlParamName).Value := AContext.TrueClass.GetValue;
  // Where conditions (with ObjVersion if exists for this entity type)
  LQuery.WhereParamByProp(AContext.GetProperties.GetIdProperty).Value := AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant;
  if AContext.ObjVersionExist then
    SetObjVersionQueryWhereParam(AContext, LQuery);
end;

class procedure TioQueryEngine.SetIntegerToQueryParamNullIfZero(const AParam: TioParam; const AValue: Integer);
begin
  if AValue <> 0 then
    AParam.Value := AValue
  else
    AParam.Value := Null; // Thanks to Marco Mottadelli
end;

class procedure TioQueryEngine.SetObjVersionQueryParam(const AContext: IioContext; const AProp: IioContextProperty; const AQuery: IioQuery);
begin
  // NB: SQLite NON supporta nativamente i TDateTime quindi li salvo come numeri reali
  if AQuery.Connection.GetConnectionInfo.ConnectionType = TioConnectionType.cdtSQLite then
    AQuery.ParamByProp(AProp).AsFloat := AContext.TransactionTimestamp
  else
    AQuery.ParamByProp(AProp).AsDateTime := AContext.TransactionTimestamp;
end;

class procedure TioQueryEngine.SetObjVersionQueryWhereParam(const AContext: IioContext; const AQuery: IioQuery);
var
  LProp: IioContextProperty;
begin
  LProp := AContext.GetProperties.ObjVersionProperty;
  // NB: SQLite NON supporta nativamente i TDateTime quindi li salvo come numeri reali
  if AQuery.Connection.GetConnectionInfo.ConnectionType = TioConnectionType.cdtSQLite then
    AQuery.WhereParamByProp(LProp).AsFloat := LProp.GetValue(AContext.DataObject).AsVariant
  else
    AQuery.WhereParamByProp(LProp).AsDateTime := LProp.GetValue(AContext.DataObject).AsVariant;
end;

end.
