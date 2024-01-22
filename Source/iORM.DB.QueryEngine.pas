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
    /// This method compose the query identity string, if the query is not cachecable then return an empty string
    /// (an empty string disable the cacheability of a query)
    class function ComposeQueryIdentity(const AContext: IioContext; const AIdentity: String; const AForceCacheable: Boolean): String;
  public
    class function GetQueryCount(const AContext: IioContext): IioQuery;
    class function GetQueryCreateIndex(const AContext: IioContext; const AIndexName: String; const ACommaSepFieldList: String;
      const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): IioQuery;
    class function GetQueryCurrentTimestamp(const AConnectionDefName: String): IioQuery;
    class function GetQueryDelete(const AContext: IioContext; const AForceCacheable: Boolean): IioQuery;
    class function GetQueryDropIndex(const AContext: IioContext; const AIndexName: String): IioQuery;
    class function GetQueryExists(const AContext: IioContext): IioQuery;
    class function GetQueryInsert(const AContext: IioContext): IioQuery;
    class function GetQueryNextID(const AContext: IioContext): IioQuery;
    class function GetQuerySelectList(const AContext: IioContext): IioQuery;
    class function GetQuerySelectObject(const AContext: IioContext): IioQuery;
    class function GetQuerySelectLastObjVersionFromEntity(const AContext: IioContext): IioQuery;
    class function GetQuerySelectLastObjVersionFromEtm(const AObjContext: IioContext): IioQuery;
    class function GetQueryUpdate(const AContext: IioContext): IioQuery;
  end;

implementation

uses
  iORM.DB.Factory, FireDac.Stan.Param, System.Rtti,
  iORM.Attributes, Data.DB, iORM.Interfaces, SysUtils,
  iORM.Where.SqlItems.Interfaces, iORM.DB.ConnectionContainer,
  System.ioUtils, iORM.Exceptions, iORM.Context.Factory;

{ TioQueryEngine }

// This method compose the query identity string, if the query is not cachecable then return an empty string
// (an empty string disable the cacheability of a query)
class function TioQueryEngine.ComposeQueryIdentity(const AContext: IioContext; const AIdentity: String; const AForceCacheable: Boolean): String;
begin
  if (AContext.WhereExist and AContext.Where.IsCacheable) or AForceCacheable then
    Result := AContext.GetClassRef.QualifiedClassName + ':' + AIdentity
  else
    Result := String.Empty;
end;

class function TioQueryEngine.GetQueryDelete(const AContext: IioContext; const AForceCacheable: Boolean): IioQuery;
var
  LQueryIdentity: String;
  LQuery: IioQuery;
begin
  // Compose the query identity
  LQueryIdentity := ComposeQueryIdentity(AContext, 'DEL', AForceCacheable);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlDelete(LQuery, AContext);
  // Where
  if AContext.WhereExist then
    // Where condition to delete by type, without obj instance (NO ETM)
    LQuery.FillQueryWhereParams(AContext)
  else
  begin
    // Where conditions for obj instance delete (with ObjVersion if exists for this entity type)
    LQuery.WhereParamObjID_SetValue(AContext);
    if AContext.GetProperties.ObjVersionPropertyExist then
      LQuery.WhereParamObjVersion_SetValue(AContext);
  end;
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
  LQueryIdentity: String;
  LQuery: IioQuery;
begin
  // Compose query identity
  LQueryIdentity := ComposeQueryIdentity(AContext, 'EXIST', True);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlExists(LQuery, AContext);
  // If a Where exist then the query is an external query else
  // is an internal query.
  LQuery.WhereParamObjID_SetValue(AContext);
end;

class function TioQueryEngine.GetQueryInsert(const AContext: IioContext): IioQuery;
var
  LProp: IioProperty;
  LQuery: IioQuery;
  LIDIsNull: Boolean;
  LQueryIdentity: String;
begin
  LIDIsNull := AContext.IdIsNull;
  // Compose query identity
  if LIDIsNull then
    LQueryIdentity := ComposeQueryIdentity(AContext, 'INS', True)
  else
    LQueryIdentity := ComposeQueryIdentity(AContext, 'INS_ID', True);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlInsert(LQuery, AContext);
  // Iterate for all properties
  for LProp in AContext.GetProperties do
  begin
    // If the current property is compliant then set the value (by property role) else skip it
    if LProp.IsSqlInsertRequestCompliant(LIDIsNull) then
    begin
      case LProp.PropertyRole of
        prRegular, prObjID:
          begin
            case LProp.GetRelationType of
              rtNone, rtEmbeddedHasMany, rtEmbeddedHasOne:
                LQuery.ParamByProp_SetValueByContext(LProp, AContext);
              rtBelongsTo:
                LQuery.ParamByProp_SetValueAsIntegerNullIfZero(LProp, LProp.GetRelationChildObjectID(AContext.DataObject));
            end;
          end;
        prObjVersion:
          LQuery.ParamObjVersion_SetValue(AContext);
        prObjUpdated:
          LQuery.ParamObjUpdated_SetValue(AContext);
        prObjUpdatedUserID:
          LQuery.ParamObjUpdatedUserID_SetValue(AContext);
        prObjUpdatedUserName:
          LQuery.ParamObjUpdatedUserName_SetValue(AContext);
        prObjCreated:
          LQuery.ParamObjCreated_SetValue(AContext);
        prObjCreatedUserID:
          LQuery.ParamObjCreatedUserID_SetValue(AContext);
        prObjCreatedUserName:
          LQuery.ParamObjCreatedUserName_SetValue(AContext);
      end;
    end;
  end;
  // Add the TrueClass value if enabled
  if AContext.IsTrueClass then
    LQuery.ParamByName_SetValue(AContext.GetTrueClass.GetSqlParamName, AContext.GetTrueClass.GetValue);
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
  Result := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName); // NoQueryIdentity
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
  LQueryIdentity: String;
  LQuery: IioQuery;
begin
  // Compose query identity
  LQueryIdentity := ComposeQueryIdentity(AContext, 'SELCNT', False);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlCount(LQuery, AContext);
  // Where
  if AContext.WhereExist then
    LQuery.FillQueryWhereParams(AContext)
  else
    LQuery.WhereParamObjID_SetValue(AContext);
end;

class function TioQueryEngine.GetQuerySelectList(const AContext: IioContext): IioQuery;
var
  LQueryIdentity: String;
  LQuery: IioQuery;
begin
  // Compose query identity
  LQueryIdentity := ComposeQueryIdentity(AContext, 'SELLST', False);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlSelect(LQuery, AContext);
  // Where
  if AContext.WhereExist then
    LQuery.FillQueryWhereParams(AContext)
  else
    LQuery.WhereParamObjID_SetValue(AContext);
end;

class function TioQueryEngine.GetQuerySelectObject(const AContext: IioContext): IioQuery;
var
  LQueryIdentity: String;
  LQuery: IioQuery;
begin
  // Compose query identity
  LQueryIdentity := ComposeQueryIdentity(AContext, 'SELOBJ', False);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlSelect(LQuery, AContext);
  // Where
  if AContext.WhereExist then
    LQuery.FillQueryWhereParams(AContext)
  else
    LQuery.WhereParamObjID_SetValue(AContext);
end;

class function TioQueryEngine.GetQuerySelectLastObjVersionFromEntity(const AContext: IioContext): IioQuery;
var
  LQueryIdentity: String;
  LQuery: IioQuery;
begin
  // Compose query identity
  LQueryIdentity := ComposeQueryIdentity(AContext, 'SELVERETY', True);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlSelectLastObjVersionFromEntity(LQuery, AContext);
  // Where
  LQuery.WhereParamObjID_SetValue(AContext);
end;

class function TioQueryEngine.GetQuerySelectLastObjVersionFromEtm(const AObjContext: IioContext): IioQuery;
var
  LEtmContext: IioContext;
  LQueryIdentity: String;
  LQuery: IioQuery;
begin
  // Get the context for the ETM TimeSlotClass
  LEtmContext := TioContextFactory.Context(AObjContext.GetTable.EtmTimeSlotClass.ClassName, nil, nil, nil, '', '');
  // Compose query identity
  LQueryIdentity := ComposeQueryIdentity(LEtmContext, 'SELVERETM', True);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(LEtmContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(LEtmContext.GetTable.GetConnectionDefName).GenerateSqlSelectLastObjVersionFromETM(LQuery, LEtmContext);
  // Where
  LQuery.WhereParamByProp_SetValue(LEtmContext.GetProperties.GetPropertyByName('EntityClassName'), AObjContext.Map.GetClassName);
  LQuery.WhereParamByProp_SetValue(LEtmContext.GetProperties.GetPropertyByName('EntityID'), AObjContext.GetID);
end;

class function TioQueryEngine.GetQueryUpdate(const AContext: IioContext): IioQuery;
var
  LQueryIdentity: String;
  LProp: IioProperty;
  LQuery: IioQuery;
begin
  // Compose query identity
  LQueryIdentity := ComposeQueryIdentity(AContext, 'UPD', True);
  // Get the query object and if does not contain an SQL text (come from QueryContainer)
  // then call the sql query generator
  LQuery := TioDbFactory.Query(AContext.GetTable.GetConnectionDefName, LQueryIdentity);
  Result := LQuery;
  if LQuery.IsSqlEmpty then
    TioDbFactory.SqlGenerator(AContext.GetTable.GetConnectionDefName).GenerateSqlUpdate(LQuery, AContext);
  // Iterate for all properties
  for LProp in AContext.GetProperties do
  begin
    // If the current property is compliant then set the value (by property role) else skip it
    //  NB: No prObjCreated... on updated query
    if LProp.IsSqlUpdateRequestCompliant then
    begin
      case LProp.PropertyRole of
        prRegular, prObjID:
          begin
            case LProp.GetRelationType of
              rtNone, rtEmbeddedHasMany, rtEmbeddedHasOne:
                LQuery.ParamByProp_SetValueByContext(LProp, AContext);
              rtBelongsTo:
                LQuery.ParamByProp_SetValueAsIntegerNullIfZero(LProp, LProp.GetRelationChildObjectID(AContext.DataObject));
            end;
          end;
        prObjVersion:
          LQuery.ParamObjVersion_SetValue(AContext);
        prObjUpdated:
          LQuery.ParamObjUpdated_SetValue(AContext);
        prObjUpdatedUserID:
          LQuery.ParamObjUpdatedUserID_SetValue(AContext);
        prObjUpdatedUserName:
          LQuery.ParamObjUpdatedUserName_SetValue(AContext);
      end;
    end;
  end;
  // Add the TrueClass value if enabled
  if AContext.IsTrueClass then
    LQuery.ParamByName_SetValue(AContext.GetTrueClass.GetSqlParamName, AContext.GetTrueClass.GetValue);
  // Where conditions (with ObjVersion if exists for this entity type)
  LQuery.WhereParamObjID_SetValue(AContext);
  if AContext.GetProperties.ObjVersionPropertyExist then
    LQuery.WhereParamObjVersion_SetValue(AContext);
end;

end.
