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
unit iORM.Http.Body.Request;

interface

uses
  iORM.Where.Interfaces, System.JSON, iORM.CommonTypes, iORM.Http.Interfaces,
  iORM.DB.Interfaces, iORM, iORM.Auth.Interfaces;

type

  // TODO: Servono proprio i nullable? Si potrebbe toglierli e tornare a tipi normali?
  TioHttpRequestBody = class(TInterfacedObject, IioHttpRequestBody)
  private
    // session
    FUserID: Integer;
    FUserName: String;
    // auth
    FAuthIntention: TioAuthIntention;
    FAuthScope: String;
    FAuthToken: String;
    // others
    FBlindLevel: Byte;
    FIntentType: TioPersistenceIntentType;
    FJSONDataValue: TJSONValue;
    FMethodName: String;
    FRelationOID: Integer;
    FRelationPropertyName: String;
    FSQLDestination: IioSQLDestination;
    FWhere: IioWhere;
    // methods
    procedure Clear;
    function GetAuthIntention: TioAuthIntention;
    function GetAuthScope: String;
    function GetAuthToken: String;
    function GetBlindLevel: Byte;
    function GetIntentType: TioPersistenceIntentType;
    function GetJSONDataValue: TJSONValue;
    function GetJSONDataValueAsObject: TObject;
    function GetMethodName: String;
    function GetRelationOID: Integer;
    function GetRelationPropertyName: String;
    function GetSQLDestination: IioSQLDestination;
    function GetUserID: Integer;
    function GetUserName: String;
    function GetWhere: IioWhere;
    procedure SetAuthIntention(const Value: TioAuthIntention);
    procedure SetAuthScope(const Value: String);
    procedure SetAuthToken(const Value: String);
    procedure SetBlindLevel(const Value: Byte);
    procedure SetIntentType(const Value: TioPersistenceIntentType);
    procedure SetJSONDataValue(const Value: TJSONValue);
    procedure SetJSONDataValueAsObject(const AObj: TObject);
    procedure SetMethodName(const Value: String);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropertyName(const Value: String);
    procedure SetSQLDestination(const Value: IioSQLDestination);
    procedure SetUserID(const Value: Integer);
    procedure SetUserName(const Value: String);
    procedure SetWhere(const Value: IioWhere);
    function ToJSONText: String;
  public
    constructor Create;
    constructor CreateByJSONString(const AJSONString:String);
  end;

implementation

uses
  System.SysUtils, DJSON;

{ TioHttpRequestBody }

constructor TioHttpRequestBody.Create;
begin
  inherited Create;
  Clear;
end;

constructor TioHttpRequestBody.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  Self.Create;
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    // ---------- session ----------
    // UserID
    LJSONValue := LJSONObject.GetValue(KEY_SESSION_USERID);
    if Assigned(LJSONValue) then
      FUserID := (LJSONValue as TJSONNumber).AsInt;
    // UserName
    LJSONValue := LJSONObject.GetValue(KEY_SESSION_USERNAME);
    if Assigned(LJSONValue) then
      FUserName := LJSONValue.Value;
    // ---------- auth ----------
    // AuthIntention
    LJSONValue := LJSONObject.GetValue(KEY_AUTH_INTENTION);
    if Assigned(LJSONValue) then
      FAuthIntention := TioAuthIntention((LJSONValue as TJSONNumber).AsInt);
    // AuthScope
    LJSONValue := LJSONObject.GetValue(KEY_AUTH_SCOPE);
    if Assigned(LJSONValue) then
      FAuthScope := LJSONValue.Value;
    // AuthToken
    LJSONValue := LJSONObject.GetValue(KEY_AUTH_TOKEN);
    if Assigned(LJSONValue) then
      FAuthToken := LJSONValue.Value;
    // ---------- others ----------
    // BlindLevel
    LJSONValue := LJSONObject.GetValue(KEY_BLINDLEVEL);
    if Assigned(LJSONValue) then
      FBlindLevel := dj.FromJSON(LJSONValue).&To<Byte>;
    // IntentType
    LJSONValue := LJSONObject.GetValue(KEY_INTENTTYPE);
    if Assigned(LJSONValue) then
      FIntentType := TioPersistenceIntentType((LJSONValue as TJSONNumber).AsInt);
    // JSONDataValue
    LJSONValue := LJSONObject.GetValue(KEY_JSONDATAVALUE);
    if Assigned(LJSONValue) then
      FJSONDataValue := LJSONValue.Clone as TJSONValue;
    // MethodName
    LJSONValue := LJSONObject.GetValue(KEY_METHODNAME);
    if Assigned(LJSONValue) then
      FMethodName := LJSONValue.Value;
    // RelationOID
    LJSONValue := LJSONObject.GetValue(KEY_RELATIONOID);
    if Assigned(LJSONValue) then
      FRelationOID := dj.FromJSON(LJSONValue).&To<Integer>;
    // RelationPropertyName
    LJSONValue := LJSONObject.GetValue(KEY_RELATIONPROPERTYNAME);
    if Assigned(LJSONValue) then
      FRelationPropertyName := dj.FromJSON(LJSONValue).&To<String>;
    // SQLDestination
    LJSONValue := LJSONObject.GetValue(KEY_SQLDESTINATION);
    if Assigned(LJSONValue) then
    begin
      FSQLDestination := io.GlobalFactory.DBFactory.SQLDestination('');
      dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FSQLDestination);
    end;
    // Where
    LJSONValue := LJSONObject.GetValue(KEY_WHERE);
    if Assigned(LJSONValue) then
    begin
      FWhere := io.GlobalFactory.WhereFactory.NewWhere;
      dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FWhere);
    end;
    // ---------- end ----------
  finally
    LJSONObject.Free;
  end;
end;

procedure TioHttpRequestBody.Clear;
begin
  // session
  FUserID := IO_INTEGER_NULL_VALUE;
  FUserName := IO_STRING_NULL_VALUE;
  // auth
  FAuthIntention := aiRead;
  FAuthScope := IO_STRING_NULL_VALUE;
  FAuthToken := IO_STRING_NULL_VALUE;
  // fields
  FBlindLevel := IO_INTEGER_NULL_VALUE;
  FIntentType := itRegular;
  FJSONDataValue := nil;
  FMethodName := IO_STRING_NULL_VALUE;
  FRelationOID := IO_INTEGER_NULL_VALUE;
  FRelationPropertyName := IO_STRING_NULL_VALUE;
  FSQLDestination := nil;
  FWhere := nil;
end;

function TioHttpRequestBody.GetAuthIntention: TioAuthIntention;
begin
  Result := FAuthIntention;
end;

function TioHttpRequestBody.GetAuthScope: String;
begin
  Result := FAuthScope;
end;

function TioHttpRequestBody.GetAuthToken: String;
begin
  Result := FAuthToken;
end;

function TioHttpRequestBody.GetBlindLevel: Byte;
begin
  Result := FBlindLevel;
end;

function TioHttpRequestBody.GetIntentType: TioPersistenceIntentType;
begin
  Result := FIntentType;
end;

function TioHttpRequestBody.GetJSONDataValue: TJSONValue;
begin
  Result := FJSONDataValue;
end;

function TioHttpRequestBody.GetJSONDataValueAsObject: TObject;
begin
  if Assigned(FJSONDataValue) then
    Result := dj.FromJSON(FJSONDataValue).OpType(ssHTTP).byFields.TypeAnnotationsON.ToObject
  else
    Result := nil;
end;

function TioHttpRequestBody.GetMethodName: String;
begin
  Result := FMethodName;
end;

function TioHttpRequestBody.GetRelationOID: Integer;
begin
  Result := FRelationOID;
end;

function TioHttpRequestBody.GetRelationPropertyName: String;
begin
  Result := FRelationPropertyName;
end;

function TioHttpRequestBody.GetSQLDestination: IioSQLDestination;
begin
  Result := FSQLDestination;
end;

function TioHttpRequestBody.GetUserID: Integer;
begin
  Result := FUserID;
end;

function TioHttpRequestBody.GetUserName: String;
begin
  Result := FUserName;
end;

function TioHttpRequestBody.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

procedure TioHttpRequestBody.SetAuthIntention(const Value: TioAuthIntention);
begin
  FAuthIntention := Value;
end;

procedure TioHttpRequestBody.SetAuthScope(const Value: String);
begin
  FAuthScope := Value;
end;

procedure TioHttpRequestBody.SetAuthToken(const Value: String);
begin
  FAuthToken := Value;
end;

procedure TioHttpRequestBody.SetBlindLevel(const Value: Byte);
begin
  FBlindLevel := Value;
end;

procedure TioHttpRequestBody.SetIntentType(const Value: TioPersistenceIntentType);
begin
  FIntentType := Value;
end;

procedure TioHttpRequestBody.SetJSONDataValue(const Value: TJSONValue);
begin
  FJSONDataValue := Value;
end;

procedure TioHttpRequestBody.SetJSONDataValueAsObject(const AObj: TObject);
begin
  if Assigned(FJSONDataValue) then
    FreeAndNil(FJSONDataValue);
  if Assigned(AObj) then
    FJSONDataValue := dj.From(AObj).OpType(ssHTTP).byFields.TypeAnnotationsON.ToJsonValue;
end;

procedure TioHttpRequestBody.SetMethodName(const Value: String);
begin
  FMethodName := Value;
end;

procedure TioHttpRequestBody.SetRelationOID(const Value: Integer);
begin
  FRelationOID := Value;
end;

procedure TioHttpRequestBody.SetRelationPropertyName(const Value: String);
begin
  FRelationPropertyName := Value;
end;

procedure TioHttpRequestBody.SetSQLDestination(const Value: IioSQLDestination);
begin
  FSQLDestination := Value;
end;

procedure TioHttpRequestBody.SetUserID(const Value: Integer);
begin
  FUserID := Value;
end;

procedure TioHttpRequestBody.SetUserName(const Value: String);
begin
  FUserName := Value;
end;

procedure TioHttpRequestBody.SetWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

function TioHttpRequestBody.ToJSONText: String;
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  LJSONObject := TJSONObject.Create;
  try
    // ---------- session ----------
    // UserID
    LJSONObject.AddPair(KEY_SESSION_USERID, FUserID);
    // UserName
    LJSONObject.AddPair(KEY_SESSION_USERNAME, FUserName);
    // ---------- auth ----------
    // AuthIntention
    LJSONObject.AddPair(KEY_AUTH_INTENTION, Ord(FAuthIntention));
    // AuthScope
    LJSONObject.AddPair(KEY_AUTH_SCOPE, FAuthScope);
    // AuthToken
    LJSONObject.AddPair(KEY_AUTH_TOKEN, FAuthToken);
    // ---------- others ----------
    // BlindLevel
    LJSONObject.AddPair(KEY_BLINDLEVEL, FBlindLevel);
    // IntentType
    LJSONObject.AddPair(KEY_INTENTTYPE, Ord(FIntentType));
    // JSONDataValue
    LJSONObject.AddPair(KEY_JSONDATAVALUE, FJSONDataValue);
    // MethodName
    LJSONObject.AddPair(KEY_METHODNAME, FMethodName);
    // RelationOID
    LJSONObject.AddPair(KEY_RELATIONOID, FRelationOID);
    // RelationPropertyName
    LJSONObject.AddPair(KEY_RELATIONPROPERTYNAME, FRelationPropertyName);
    // SQLDestination
    LJSONObject.AddPair(KEY_SQLDESTINATION, dj.From(FSQLDestination).byFields.TypeAnnotationsON.ToJsonValue);
    // Where
    LJSONObject.AddPair(KEY_WHERE, dj.From(FWhere).byFields.TypeAnnotationsON.ToJsonValue);
    // ---------- end ----------
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

end.
