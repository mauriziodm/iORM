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
  iORM.DB.Interfaces;

type

  TioHttpRequestBody = class(TInterfacedObject, IioHttpRequestBody)
  private
    FWhere: IioWhere;
    FSQLDestination: IioSQLDestination;
    FDataObject: TObject;
    FOwnDataObject: Boolean;
    FRelationPropertyName: TioNullableString;
    FRelationOID: TioNullableInteger;
    FBlindInsert: TioNullableBoolean;
    function GetBlindInsert: Boolean;
    function GetDataObject: TObject;
    function GetRelationOID: Integer;
    function GetRelationPropertyName: String;
    function GetWhere: IioWhere;
    function GetSQLDestination: IioSQLDestination;
    procedure SetBlindInsert(const Value: Boolean);
    procedure SetDataObject(const Value: TObject);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropertyName(const Value: String);
    procedure SetWhere(const Value: IioWhere);
    procedure SetSQLDestination(const Value: IioSQLDestination);
    function ToJSONObject:TJSONObject;
    procedure Clear;
  public
    constructor Create(const AOwnDataObject:Boolean); overload;
    constructor Create(const AJSONObject:TJSONObject; const AOwnDataObject:Boolean); overload;
    constructor Create(const AJSONString:String; const AOwnDataObject:Boolean); overload;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils, iORM, DJSON;

{ TioHttpRequestBody }

constructor TioHttpRequestBody.Create(const AOwnDataObject:Boolean);
begin
  inherited Create;
  Self.Clear;
  FOwnDataObject := AOwnDataObject;
end;

constructor TioHttpRequestBody.Create(const AJSONObject: TJSONObject; const AOwnDataObject:Boolean);
var
  LJSONValue: TJSONValue;
begin
  Self.Create(AOwnDataObject);
  // RelationPropertyName
  LJSONValue := AJSONObject.GetValue(KEY_RELATIONPROPERTYNAME);
  if Assigned(LJSONValue) then
    FRelationPropertyName.Value := dj.FromJSON(LJSONValue).&To<String>;
  // RelationOID
  LJSONValue := AJSONObject.GetValue(KEY_RELATIONOID);
  if Assigned(LJSONValue) then
    FRelationOID.Value := dj.FromJSON(LJSONValue).&To<Integer>;
  // BlindInsert
  LJSONValue := AJSONObject.GetValue(KEY_BLINDINSERT);
  if Assigned(LJSONValue) then
    FBlindInsert.Value := dj.FromJSON(LJSONValue).&To<Boolean>;
  // IioWhere
  LJSONValue := AJSONObject.GetValue(KEY_WHERE);
  if Assigned(LJSONValue) then
  begin
    FWhere := io.GlobalFactory.WhereFactory.NewWhere;
    dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FWhere);
  end;
  // IioSQLDestination
  LJSONValue := AJSONObject.GetValue(KEY_SQLDESTINATION);
  if Assigned(LJSONValue) then
  begin
    FSQLDestination := io.GlobalFactory.DBFactory.SQLDestination('');
    dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FSQLDestination);
  end;
  // DataObject
  LJSONValue := AJSONObject.GetValue(KEY_DATAOBJECT);
  if Assigned(LJSONValue) then
    FDataObject := dj.FromJSON(LJSONValue).OpType(ssHTTP).byFields.TypeAnnotationsON.ToObject;
end;

procedure TioHttpRequestBody.Clear;
begin
  FWhere := nil;
  FSQLDestination := nil;
  FDataObject := nil;
end;

constructor TioHttpRequestBody.Create(const AJSONString: String; const AOwnDataObject:Boolean);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    Self.Create(LJSONObject, AOwnDataObject);
  finally
    LJSONObject.Free;
  end;
end;

destructor TioHttpRequestBody.Destroy;
begin
  // Clean up
  if FOwnDataObject and Assigned(FDataObject) then
    FDataObject.Free;
  inherited;
end;

function TioHttpRequestBody.GetBlindInsert: Boolean;
begin
  Result := FBlindInsert.Value;
end;

function TioHttpRequestBody.GetDataObject: TObject;
begin
  Result := FDataObject;
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

function TioHttpRequestBody.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

procedure TioHttpRequestBody.SetBlindInsert(const Value: Boolean);
begin
  FBlindInsert.Value := Value;
end;

procedure TioHttpRequestBody.SetDataObject(const Value: TObject);
begin
  FDataObject := Value;
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

procedure TioHttpRequestBody.SetWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

function TioHttpRequestBody.ToJSONObject: TJSONObject;
var
  LJSONValue: TJSONValue;
begin
  Result := TJSONObject.Create;
  // RelationPropertyName
  if FRelationPropertyName.HasValue then
  begin
    LJSONValue := TJSONString.Create(FRelationPropertyName.Value);
    Result.AddPair(KEY_RELATIONPROPERTYNAME, LJSONValue);
  end;
  // RelationOID
  if FRelationOID.HasValue then
  begin
    LJSONValue := TJSONNumber.Create(FRelationOID.Value);
    Result.AddPair(KEY_RELATIONOID, LJSONValue);
  end;
  // BlindInsert
  if FBlindInsert.HasValue then
  begin
    LJSONValue := TJSONBool.Create(FBlindInsert.Value);
    Result.AddPair(KEY_BLINDINSERT, LJSONValue);
  end;
  // IioWhere
  if Assigned(FWhere) then
  begin
    LJSONValue := dj.From(FWhere).byFields.TypeAnnotationsON.ToJsonValue;
    Result.AddPair(KEY_WHERE, LJSONValue);
  end;
  // SQLDestination
  if Assigned(FSQLDestination) then
  begin
    LJSONValue := dj.From(FSQLDestination).byFields.TypeAnnotationsON.ToJsonValue;
    Result.AddPair(KEY_SQLDESTINATION, LJSONValue);
  end;
  // DataOject
  if Assigned(FDataObject) then
  begin
    LJSONValue := dj.From(FDataObject).OpType(ssHTTP).byFields.TypeAnnotationsON.ToJsonValue;
    Result.AddPair(KEY_DATAOBJECT, LJSONValue);
  end;
end;

end.
