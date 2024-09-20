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
    // auth fields
    FAuthIntention: TioAuthIntention;
    FAuthScope: String;
    FAuthToken: String;
    // fields
    FBlindLevel: TioNullableByte;
    FIntentType: TioPersistenceIntentType;
    FJSONDataValue: TJSONValue;
    FMethodName: TioNullableString;
    FRelationOID: TioNullableInteger;
    FRelationPropertyName: TioNullableString;
    FSQLDestination: IioSQLDestination;
    FWhere: IioWhere;
    // TODO: AUTH - FUserID, FUserName, FUserToken da eliminare visto che adesso ci sono i nuovi Auth...?
    FUserID: TioNullableInteger;
    FUserName: TioNullableString;
    FUserToken: TioNullableString;
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
    function GetUserToken: String;
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
    procedure SetUserToken(const Value: String);
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
    // BlindLevel
    LJSONValue := LJSONObject.GetValue(KEY_BLINDLEVEL);
    if Assigned(LJSONValue) then
      FBlindLevel.Value := dj.FromJSON(LJSONValue).&To<Byte>;
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
      FMethodName.Value := LJSONValue.Value;
    // RelationOID
    LJSONValue := LJSONObject.GetValue(KEY_RELATIONOID);
    if Assigned(LJSONValue) then
      FRelationOID.Value := dj.FromJSON(LJSONValue).&To<Integer>;
    // RelationPropertyName
    LJSONValue := LJSONObject.GetValue(KEY_RELATIONPROPERTYNAME);
    if Assigned(LJSONValue) then
      FRelationPropertyName.Value := dj.FromJSON(LJSONValue).&To<String>;
    // SQLDestination
    LJSONValue := LJSONObject.GetValue(KEY_SQLDESTINATION);
    if Assigned(LJSONValue) then
    begin
      FSQLDestination := io.GlobalFactory.DBFactory.SQLDestination('');
      dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FSQLDestination);
    end;
    // UserID
    LJSONValue := LJSONObject.GetValue(KEY_USERID);
    if Assigned(LJSONValue) then
      FUserID.Value := (LJSONValue as TJSONNumber).AsInt;
    // UserName
    LJSONValue := LJSONObject.GetValue(KEY_USERNAME);
    if Assigned(LJSONValue) then
      FUserName.Value := LJSONValue.Value;
    // UserToken
    LJSONValue := LJSONObject.GetValue(KEY_USERTOKEN);
    if Assigned(LJSONValue) then
      FUserToken.Value := LJSONValue.Value;
    // Where
    LJSONValue := LJSONObject.GetValue(KEY_WHERE);
    if Assigned(LJSONValue) then
    begin
      FWhere := io.GlobalFactory.WhereFactory.NewWhere;
      dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FWhere);
    end;
  finally
    LJSONObject.Free;
  end;
end;

procedure TioHttpRequestBody.Clear;
begin
  FBlindLevel.Clear;
  FIntentType := itRegular;
  FJSONDataValue := nil;
  FMethodName.Clear;
  FRelationOID.Clear;
  FRelationPropertyName.Clear;
  FSQLDestination := nil;
  FUserID.Clear;
  FUserName.Clear;
  FUserToken.Clear;
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
  Result := FBlindLevel.Value;
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
  Result := FMethodName.Value;
end;

function TioHttpRequestBody.GetRelationOID: Integer;
begin
  Result := FRelationOID.Value;
end;

function TioHttpRequestBody.GetRelationPropertyName: String;
begin
  Result := FRelationPropertyName.Value;
end;

function TioHttpRequestBody.GetSQLDestination: IioSQLDestination;
begin
  Result := FSQLDestination;
end;

function TioHttpRequestBody.GetUserID: Integer;
begin
  Result := FUserID.Value;
end;

function TioHttpRequestBody.GetUserName: String;
begin
  Result := FUserName.Value;
end;

function TioHttpRequestBody.GetUserToken: String;
begin
  Result := FUserToken.Value;
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
  FBlindLevel.Value := Value;
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
  FMethodName.Value := Value;
end;

procedure TioHttpRequestBody.SetRelationOID(const Value: Integer);
begin
  FRelationOID.Value := Value;
end;

procedure TioHttpRequestBody.SetRelationPropertyName(const Value: String);
begin
  FRelationPropertyName.Value := Value;
end;

procedure TioHttpRequestBody.SetSQLDestination(const Value: IioSQLDestination);
begin
  FSQLDestination := Value;
end;

procedure TioHttpRequestBody.SetUserID(const Value: Integer);
begin
  FUserID.Value := Value;
end;

procedure TioHttpRequestBody.SetUserName(const Value: String);
begin
  FUserName.Value := Value;
end;

procedure TioHttpRequestBody.SetUserToken(const Value: String);
begin
  FUserToken.Value := Value;
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
    // BlindLevel
    if FBlindLevel.HasValue then
    begin
      LJSONValue := TJSONNumber.Create(FBlindLevel.Value);
      LJSONObject.AddPair(KEY_BLINDLEVEL, LJSONValue);
    end;
    // IntentType
    LJSONValue := TJSONNumber.Create(Ord(FIntentType));
    LJSONObject.AddPair(KEY_INTENTTYPE, LJSONValue);
    // JSONDataValue
    LJSONObject.AddPair(KEY_JSONDATAVALUE, FJSONDataValue);
    // MethodName
    if FMethodName.HasValue then
    begin
      LJSONValue := TJSONString.Create(FMethodName.Value);
      LJSONObject.AddPair(KEY_METHODNAME, LJSONValue);
    end;
    // RelationOID
    if FRelationOID.HasValue then
    begin
      LJSONValue := TJSONNumber.Create(FRelationOID.Value);
      LJSONObject.AddPair(KEY_RELATIONOID, LJSONValue);
    end;
    // RelationPropertyName
    if FRelationPropertyName.HasValue then
    begin
      LJSONValue := TJSONString.Create(FRelationPropertyName.Value);
      LJSONObject.AddPair(KEY_RELATIONPROPERTYNAME, LJSONValue);
    end;
    // SQLDestination
    if Assigned(FSQLDestination) then
    begin
      LJSONValue := dj.From(FSQLDestination).byFields.TypeAnnotationsON.ToJsonValue;
      LJSONObject.AddPair(KEY_SQLDESTINATION, LJSONValue);
    end;
    // UserID
    if FUserID.HasValue then
    begin
      LJSONValue := TJSONNumber.Create(FUserID.Value);
      LJSONObject.AddPair(KEY_USERID, LJSONValue);
    end;
    // UserName
    if FUserName.HasValue then
    begin
      LJSONValue := TJSONString.Create(FUserName.Value);
      LJSONObject.AddPair(KEY_USERNAME, LJSONValue);
    end;
    // UserToken
    if FUserToken.HasValue then
    begin
      LJSONValue := TJSONString.Create(FUserToken.Value);
      LJSONObject.AddPair(KEY_USERTOKEN, LJSONValue);
    end;
    // Where
    if Assigned(FWhere) then
    begin
      LJSONValue := dj.From(FWhere).byFields.TypeAnnotationsON.ToJsonValue;
      LJSONObject.AddPair(KEY_WHERE, LJSONValue);
    end;
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

end.
