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
unit iORM.DB.Query.FireDAC;

interface

uses
  FireDAC.Comp.Client, iORM.Context.Properties.Interfaces,
  FireDAC.Stan.Param, iORM.Context.Interfaces, System.Rtti, iORM.DB.Interfaces,
  System.Classes, Data.DB;

type

  TioFDQuery = class(TInterfacedObject, IioQuery)
  private
    FSqlConnection: IioConnectionDB;
    FSqlQuery: TFDQuery;
    function _ParamByName(const AParamName: String): TFDParam;
    function _ParamByProp(const AProp: IioProperty): TFDParam;
    function _WhereParamByProp(const AProp: IioProperty): TFDParam;
    function GetConnection: IioConnectionDB;
    function GetSQL: TStrings;
  public
    constructor Create(const AConnection: IioConnectionDB);
    destructor Destroy; override;
    function GetQuery: TioInternalSqlQuery;
    procedure Next;
    function Eof: Boolean;
    function GetValue(const AProperty: IioProperty; const AContext: IioContext): TValue;
    /// Extract the name of the class from the ClassInfo field if the AContext is
    ///  with TrueClass else return the AContext.Map.ClassName
    function ExtractTrueClassName(const AContext: IioContext): String;
    procedure Open;
    procedure Close;
    function IsEmpty: Boolean;
    function IsSqlEmpty: Boolean;
    function IsActive: Boolean;
    function ExecSQL: integer;
    function Fields: TioFields;
    procedure FillQueryWhereParams(const AContext: IioContext);
    function CreateBlobStream(const AProperty: IioProperty; const Mode: TBlobStreamMode): TStream;
    procedure CleanConnectionRef;

    procedure ParamByName_SetValue(const AParamName: String; const AValue: Variant);
    procedure ParamByProp_Clear(const AProp: IioProperty; const ADataType: TFieldType);
    procedure ParamByProp_SetValue(const AProp: IioProperty; const AValue: Variant);
    procedure ParamByProp_SetValueAsString(const AProp: IioProperty; const AValue: String);
    procedure ParamByProp_SetValueAsDateTime(const AProp: IioProperty; const AValue: TDateTime);
    procedure ParamByProp_SetValueAsDate(const AProp: IioProperty; const AValue: TDate);
    procedure ParamByProp_SetValueAsTime(const AProp: IioProperty; const AValue: TTime);
    procedure ParamByProp_SetValueAsFloat(const AProp: IioProperty; const AValue: Double);
    procedure ParamByProp_SetValueByContext(const AProp: IioProperty; const AContext: IioContext);
    procedure ParamByProp_SetValueAsInteger(const AProp: IioProperty; const AValue: Integer);
    procedure ParamByProp_SetValueAsIntegerNullIfZero(const AProp: IioProperty; const AValue: Integer);
    procedure ParamByProp_LoadAsStreamObj(const AObj: TObject; const AProperty: IioProperty);
    procedure ParamObjVersion_SetValue(const AContext: IioContext);
    procedure ParamObjCreated_SetValue(const AContext: IioContext);
    procedure ParamObjCreatedUserID_SetValue(const AContext: IioContext);
    procedure ParamObjCreatedUserName_SetValue(const AContext: IioContext);
    procedure ParamObjUpdated_SetValue(const AContext: IioContext);
    procedure ParamObjUpdatedUserID_SetValue(const AContext: IioContext);
    procedure ParamObjUpdatedUserName_SetValue(const AContext: IioContext);
    procedure WhereParamByProp_SetValue(const AProp: IioProperty; const AValue: Variant);
    procedure WhereParamByProp_SetValueAsDateTime(const AProp: IioProperty; const AValue: TDateTime);
    procedure WhereParamByProp_SetValueAsFloat(const AProp: IioProperty; const AValue: Double);
    procedure WhereParamObjID_SetValue(const AContext: IioContext);
    procedure WhereParamObjVersion_SetValue(const AContext: IioContext);

    property Connection: IioConnectionDB read GetConnection;
    property SQL: TStrings read GetSQL;
  end;

implementation

uses
  iORM.Attributes, iORM.DB.Factory, iORM.Interfaces,
  iORM.Where.SqlItems.Interfaces, System.SysUtils, iORM.DuckTyped.Interfaces,
  iORM.Exceptions, iORM.DuckTyped.Factory, System.JSON, iORM.Utilities,
  iORM.ObjectsForge.Factory, DJSON, iORM.DependencyInjection, iORM,
  iORM.DB.ConnectionContainer;

{ TioFDQuery }

procedure TioFDQuery.CleanConnectionRef;
begin
  // Remove the reference to the connection
  // NB: Viene richiamato alla distruzione di una connessione perchè altrimenti avrei un riferimento incrociato
  // tra la connessione che, attraverso il proprio QueryContainer, manteine un riferimento a tutte le query
  // che sono state preparate ela query che mantiene un riferimento alla connessione al suo interno; in pratica
  // questo causava molti memory leaks perchè questi oggetti rimanevano in vita perenne in quanto si sostenevano
  // a vicenda e rendevano inefficace il Reference Count
  FSqlConnection := nil;
end;

procedure TioFDQuery.Close;
begin
  FSqlQuery.Close;
end;

constructor TioFDQuery.Create(const AConnection: IioConnectionDB);
begin
  inherited Create;
  FSqlQuery := TFDQuery.Create(nil);
  FSqlConnection := AConnection; // For reference counting
  if Assigned(AConnection) and AConnection.IsDBConnection then
    FSqlQuery.Connection := AConnection.AsDBConnection.GetConnection;
end;

function TioFDQuery.CreateBlobStream(const AProperty: IioProperty; const Mode: TBlobStreamMode): TStream;
begin
  Result := FSqlQuery.CreateBlobStream(Fields.FieldByName(AProperty.GetSqlFieldAlias), Mode);
end;

destructor TioFDQuery.Destroy;
begin
  if FSqlQuery.Active then
    FSqlQuery.Close;
  FSqlQuery.Free;
  inherited;
end;

function TioFDQuery.Eof: Boolean;
begin
  Result := FSqlQuery.Eof;
end;

function TioFDQuery.ExecSQL: integer;
begin
  FSqlQuery.ExecSQL;
  Result := FSqlQuery.RowsAffected;
end;

/// Extract the name of the class from the ClassInfo field if the AContext is
///  with TrueClass else return the AContext.Map.ClassName
function TioFDQuery.ExtractTrueClassName(const AContext: IioContext): String;
begin
  if AContext.IsTrueClass then
  begin
    Result := FSqlQuery.FieldByName(AContext.GetTrueClass.GetFieldName).Value;
    Result := AContext.GetTrueClass.ClassNameFromClassInfoFieldValue(Result);
  end
  else
    Result := AContext.Map.GetClassName;
end;

function TioFDQuery.Fields: TioFields;
begin
  Result := FSqlQuery.Fields;
end;

procedure TioFDQuery.FillQueryWhereParams(const AContext: IioContext);
var
  ASqlItem: IioSqlItem;
  ASqlItemWhere: IioSqlItemWhere;
  LOriginalClassName, LFarAncestorClassName: String;
begin
  for ASqlItem in AContext.Where.GetWhereItems do
  begin
    if Supports(ASqlItem, IioSqlItemWhere, ASqlItemWhere) and ASqlItemWhere.HasParameter then
      ParamByName_SetValue(ASqlItemWhere.GetSqlParamName(AContext.Map), ASqlItemWhere.GetValue(AContext.Map).AsVariant);
  end;
  if AContext.IsTrueClass then
  begin
    LOriginalClassName := AContext.OriginalNonTrueClassMap.GetClassName;
    LFarAncestorClassName := io.di.Locate(AContext.OriginalNonTrueClassMap.GetClassName).GetItem.FarAncestorClazzSameInterfaceAndTableAndConnection;
    if TioUtilities.IsAnInterfaceTypeName(AContext.Where.TypeName) or (LOriginalClassName = LFarAncestorClassName) then
      ParamByName_SetValue(AContext.GetTrueClass.GetSqlParamName, '%' + LOriginalClassName + '%')
    else
      ParamByName_SetValue(AContext.GetTrueClass.GetSqlParamName, '%' + AContext.Where.TypeName + '%');
  end;
end;

function TioFDQuery.GetConnection: IioConnectionDB;
begin
  Result := FSqlConnection;
end;

function TioFDQuery.GetQuery: TioInternalSqlQuery;
begin
  Result := FSqlQuery;
end;

function TioFDQuery.GetSQL: TStrings;
begin
  Result := FSqlQuery.SQL;
end;

function TioFDQuery.GetValue(const AProperty: IioProperty; const AContext: IioContext): TValue;
begin
  // If the property is a BelongsTo relation then return data as Integer
  // (the type for ID)
  if AProperty.GetRelationType = rtBelongsTo then
    Exit(FSqlQuery.FieldByName(AProperty.GetSqlFieldAlias).AsInteger);

  // Else return the value for the field related to the AProperty as TValue
  Result := TioDBFactory.SqlDataConverter(AContext.GetTable.GetConnectionDefName).QueryToTValue(Self, AProperty);
end;

function TioFDQuery.IsActive: Boolean;
begin
  Result := FSqlQuery.Active;
end;

function TioFDQuery.IsEmpty: Boolean;
begin
  Result := FSqlQuery.IsEmpty;
end;

function TioFDQuery.IsSqlEmpty: Boolean;
begin
  Result := (FSqlQuery.SQL.Count = 0);
end;

procedure TioFDQuery.Next;
begin
  FSqlQuery.Next;
end;

procedure TioFDQuery.Open;
begin
  FSqlQuery.Open;
end;

procedure TioFDQuery.ParamByName_SetValue(const AParamName: String; const AValue: Variant);
begin
  _ParamByName(AParamName).Value := AValue;
end;

procedure TioFDQuery.ParamByProp_Clear(const AProp: IioProperty; const ADataType: TFieldType);
begin
  _ParamByProp(AProp).Clear;
  _ParamByProp(AProp).DataType := ADataType;
end;

procedure TioFDQuery.ParamByProp_SetValue(const AProp: IioProperty; const AValue: Variant);
begin
  _ParamByProp(AProp).Value := AValue;
end;

procedure TioFDQuery.ParamByProp_SetValueAsDate(const AProp: IioProperty; const AValue: TDate);
begin
  _ParamByProp(AProp).AsDate := AValue;
end;

procedure TioFDQuery.ParamByProp_SetValueAsDateTime(const AProp: IioProperty; const AValue: TDateTime);
begin
  _ParamByProp(AProp).AsDateTime := AValue;
end;

procedure TioFDQuery.ParamByProp_SetValueAsFloat(const AProp: IioProperty; const AValue: Double);
begin
  _ParamByProp(AProp).AsFloat := AValue;
end;

procedure TioFDQuery.ParamByProp_SetValueAsString(const AProp: IioProperty; const AValue: String);
begin
  _ParamByProp(AProp).AsString := AValue;
end;

procedure TioFDQuery.ParamByProp_SetValueAsTime(const AProp: IioProperty; const AValue: TTime);
begin
  _ParamByProp(AProp).AsTime := AValue;
end;

procedure TioFDQuery.ParamByProp_LoadAsStreamObj(const AObj: TObject; const AProperty: IioProperty);
var
  AParam: TioParam;
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
  AStream: TStream;
begin
  // First prepare the query in it is not
  // Self.FSqlQuery.Prepare;
  // Get the param
  AParam := Self.FSqlQuery.ParamByName(AProperty.GetSqlParamName);
//  AParam := (FSqlQuery as IProviderSupportNG).PSGetParams.ParamByName(AProperty.GetSqlParamName);
  if not Assigned(AParam) then
    raise EioGenericException.Create(Self.ClassName + ': ' + AProperty.GetSqlParamName + ' Sql parameter not found');

  // If AObj is a TStream then use it directly else wrap it with a
  // DuckTypedSTreamObject wrapper, extract the stream and then use it.
  // -------------------------------------------------------------------------------------------------------------------------------
  // TStream or descendant
  // -------------------------------------------------------------------------------------------------------------------------------
  if AObj is TStream then
  begin
    AStream := TStream(AObj);
    // If the Stream is empty or nil then set the Param value to NULL and exit
    if (not Assigned(AStream)) or (AStream.Size = 0) then
    begin
      AParam.DataType := ftBlob;
      AParam.Clear;
      Exit;
    end;
    // Load the stream content into the Param
    AParam.LoadFromStream(AStream, ftBlob);
  end
  // -------------------------------------------------------------------------------------------------------------------------------
  // NOT TStream or descendant, wrap into a DuckTypedStreamObject
  // -------------------------------------------------------------------------------------------------------------------------------
  else
  begin
    // Wrap the object into a DuckTypedStreamObject
    ADuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(AObj);
    // If the wrapped object IsEmpty set the Param value to NULL then exit
    if ADuckTypedStreamObject.IsEmpty then
    begin
      AParam.DataType := ftBlob;
      AParam.Clear;
      Exit;
    end;
    // Create the MemoryStream
    AStream := TMemoryStream.Create;
    try
      // Save the object content into the stream
      ADuckTypedStreamObject.SaveToStream(AStream);
      // Load the stream content into the Param
      AParam.LoadFromStream(AStream, ftBlob);
    finally
      // CleanUp
      AStream.Free;
    end;
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
end;

procedure TioFDQuery.ParamByProp_SetValueAsInteger(const AProp: IioProperty; const AValue: Integer);
begin
  _ParamByProp(AProp).AsInteger := AValue;
end;

procedure TioFDQuery.ParamByProp_SetValueAsIntegerNullIfZero(const AProp: IioProperty; const AValue: Integer);
begin
  if AValue <> 0 then
    ParamByProp_SetValue(AProp, AValue)
  else
    ParamByProp_Clear(AProp, ftInteger);
end;

procedure TioFDQuery.WhereParamObjID_SetValue(const AContext: IioContext);
begin
  WhereParamByProp_SetValue(AContext.GetProperties.GetIdProperty, AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsVariant);
end;

procedure TioFDQuery.ParamObjCreated_SetValue(const AContext: IioContext);
var
  LProp: IioProperty;
begin
  LProp := AContext.GetProperties.ObjCreatedProperty;
  // NB: SQLite NON supporta nativamente i TDateTime quindi li salvo come numeri reali
  if FSqlConnection.GetConnectionInfo.ConnectionType = TioConnectionType.ctSQLite then
    ParamByProp_SetValueAsFloat(LProp, Connection.LastTransactionTimestamp)
  else
    ParamByProp_SetValueAsDateTime(LProp, Connection.LastTransactionTimestamp);
end;

procedure TioFDQuery.ParamObjCreatedUserID_SetValue(const AContext: IioContext);
begin
  ParamByProp_SetValue(AContext.GetProperties.ObjCreatedUserIDProperty, TioConnectionManager.GetCurrentSession.UserID);
end;

procedure TioFDQuery.ParamObjCreatedUserName_SetValue(const AContext: IioContext);
begin
  ParamByProp_SetValue(AContext.GetProperties.ObjCreatedUserNameProperty, TioConnectionManager.GetCurrentSession.UserName);
end;

procedure TioFDQuery.ParamObjUpdatedUserID_SetValue(const AContext: IioContext);
begin
  ParamByProp_SetValue(AContext.GetProperties.ObjUpdatedUserIDProperty, TioConnectionManager.GetCurrentSession.UserID);
end;

procedure TioFDQuery.ParamObjUpdatedUserName_SetValue(const AContext: IioContext);
begin
  ParamByProp_SetValue(AContext.GetProperties.ObjUpdatedUserNameProperty, TioConnectionManager.GetCurrentSession.UserName);
end;

procedure TioFDQuery.ParamObjUpdated_SetValue(const AContext: IioContext);
var
  LProp: IioProperty;
begin
  LProp := AContext.GetProperties.ObjUpdatedProperty;
  // NB: SQLite NON supporta nativamente i TDateTime quindi li salvo come numeri reali
  if FSqlConnection.GetConnectionInfo.ConnectionType = TioConnectionType.ctSQLite then
    ParamByProp_SetValueAsFloat(LProp, Connection.LastTransactionTimestamp)
  else
    ParamByProp_SetValueAsDateTime(LProp, Connection.LastTransactionTimestamp);
end;

procedure TioFDQuery.ParamObjVersion_SetValue(const AContext: IioContext);
var
  LProp: IioProperty;
begin
  LProp := AContext.GetProperties.ObjVersionProperty;
  ParamByProp_SetValueAsIntegerNullIfZero(LProp, AContext.ObjNextVersion);
end;

procedure TioFDQuery.WhereParamObjVersion_SetValue(const AContext: IioContext);
var
  LProp: IioProperty;
begin
  LProp := AContext.GetProperties.ObjVersionProperty;
  WhereParamByProp_SetValue(LProp, Abs(LProp.GetValue(AContext.DataObject).AsVariant));
end;

procedure TioFDQuery.ParamByProp_SetValueByContext(const AProp: IioProperty; const AContext: IioContext);
var
  LObj: TObject;
  LDuckTypedStreamObject: IioDuckTypedStreamObject;
  LStream: TStream;
  LJsonString: String;
begin
  // AObj := nil;
  // -------------------------------------------------------------------------------------------------------------------------------
  // Normal property type (NO BLOB)
  // -------------------------------------------------------------------------------------------------------------------------------
  if not AProp.IsBlob then
  begin
    TioDBFactory.SqlDataConverter(AContext.GetTable.GetConnectionDefName).SetQueryParamByContext(Self, AProp, AContext);
    Exit;
  end;
  // At this point the property refer to a blob field (and to an Object) type then
  // check if the Object is assigned and if it isn't clear
  // the parameter
  // If a RelationChildPropertyPath is assigned then resolve it
  LObj := AProp.GetValueAsObject(AContext.DataObject);
  if AProp.RelationChildPropertyPathAssigned then
    LObj := TioUtilities.ResolveChildPropertyPath_GetFinalObj(LObj, AProp.GetRelationChildPropertyPath);
  if not Assigned(LObj) then
  begin
    ParamByProp_Clear(AProp, ftBlob);
    Exit;
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
  // Embedded property (ioRTEmbeddedHasMany & ioRTEmbeddedHasOne relation type)
  // -------------------------------------------------------------------------------------------------------------------------------
  if AProp.GetRelationType in [rtEmbeddedHasMany, rtEmbeddedHasOne] then
  begin
    // Serialize
    LJsonString := dj.From(LObj).OpType(ssEmbeddeRelation).byFields.TypeAnnotationsON.ToJson.Trim;
    // Set the param
    if LJsonString.IsEmpty then
      ParamByProp_Clear(AProp, ftBlob)
    else
      ParamByProp_SetValueAsString(AProp, LJsonString);
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
  // TStream or descendant (BLOB)
  // -------------------------------------------------------------------------------------------------------------------------------
  if AProp.IsStream then
  begin
    LStream := TStream(LObj);
    // If the Stream is empty or nil then set the Param value to NULL and exit
    if (not Assigned(LStream)) or (LStream.Size = 0) then
    begin
      ParamByProp_Clear(AProp, ftBlob);
      Exit;
    end;
    // Load the stream content into the Param
    _ParamByProp(AProp).LoadFromStream(LStream, ftBlob);
    Exit;
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
  // NOT TStream or descendant, wrap into a DuckTypedStreamObject  (BLOB)
  // -------------------------------------------------------------------------------------------------------------------------------
  // Wrap the object into a DuckTypedStreamObject
  LDuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(LObj);
  // If the wrapped object IsEmpty set the Param value to NULL then exit
  if LDuckTypedStreamObject.IsEmpty then
  begin
    ParamByProp_Clear(AProp, ftBlob);
    Exit;
  end;
  // Create the MemoryStream
  LStream := TMemoryStream.Create;
  try
    // Save the object content into the stream
    LDuckTypedStreamObject.SaveToStream(LStream);
    // Load the stream content into the Param
    _ParamByProp(AProp).LoadFromStream(LStream, ftBlob);
  finally
    // CleanUp
    LStream.Free;
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
end;

procedure TioFDQuery.WhereParamByProp_SetValue(const AProp: IioProperty; const AValue: Variant);
begin
  _WhereParamByProp(AProp).Value := AValue;
end;

procedure TioFDQuery.WhereParamByProp_SetValueAsDateTime(const AProp: IioProperty; const AValue: TDateTime);
begin
  _WhereParamByProp(AProp).AsDateTime := AValue;
end;

procedure TioFDQuery.WhereParamByProp_SetValueAsFloat(const AProp: IioProperty; const AValue: Double);
begin
  _WhereParamByProp(AProp).AsFloat := AValue;
end;

function TioFDQuery._ParamByName(const AParamName: String): TFDParam;
begin
  Result := FSqlQuery.ParamByName(AParamName);
end;

function TioFDQuery._ParamByProp(const AProp: IioProperty): TFDParam;
begin
  Result := FSqlQuery.ParamByName(AProp.GetSqlParamName);
end;

function TioFDQuery._WhereParamByProp(const AProp: IioProperty): TFDParam;
begin
  Result := FSqlQuery.ParamByName(AProp.GetSqlWhereParamName);
end;

end.

