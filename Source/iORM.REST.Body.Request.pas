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





unit iORM.REST.Body.Request;

interface

uses
  iORM.Where.Interfaces, System.JSON, iORM.CommonTypes, iORM.REST.Interfaces,
  iORM.DB.Interfaces;

type

  TioRESTRequestBody = class(TInterfacedObject, IioRESTRequestBody)
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
  System.SysUtils, iORM;

{ TioRESTRequestBody }

constructor TioRESTRequestBody.Create(const AOwnDataObject:Boolean);
begin
  inherited Create;
  Self.Clear;
  FOwnDataObject := AOwnDataObject;
end;

constructor TioRESTRequestBody.Create(const AJSONObject: TJSONObject; const AOwnDataObject:Boolean);
var
  LJSONValue: TJSONValue;
begin
  Self.Create(AOwnDataObject);
  // RelationPropertyName
  LJSONValue := AJSONObject.GetValue(KEY_RELATIONPROPERTYNAME);
  if Assigned(LJSONValue) then
    FRelationPropertyName.Value := io.Mapper.FromJSON(LJSONValue).&To<String>;
  // RelationOID
  LJSONValue := AJSONObject.GetValue(KEY_RELATIONOID);
  if Assigned(LJSONValue) then
    FRelationOID.Value := io.Mapper.FromJSON(LJSONValue).&To<Integer>;
  // BlindInsert
  LJSONValue := AJSONObject.GetValue(KEY_BLINDINSERT);
  if Assigned(LJSONValue) then
    FBlindInsert.Value := io.Mapper.FromJSON(LJSONValue).&To<Boolean>;
  // IioWhere
  LJSONValue := AJSONObject.GetValue(KEY_WHERE);
  if Assigned(LJSONValue) then
  begin
    FWhere := io.GlobalFactory.WhereFactory.NewWhere;
    io.Mapper.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FWhere);
  end;
  // IioSQLDestination
  LJSONValue := AJSONObject.GetValue(KEY_SQLDESTINATION);
  if Assigned(LJSONValue) then
  begin
    FSQLDestination := io.GlobalFactory.DBFactory.SQLDestination('');
    io.Mapper.FromJSON(LJSONValue).byFields.TypeAnnotationsON.&To(FSQLDestination);
  end;
  // DataObject
  LJSONValue := AJSONObject.GetValue(KEY_DATAOBJECT);
  if Assigned(LJSONValue) then
    FDataObject := io.Mapper.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
end;

procedure TioRESTRequestBody.Clear;
begin
  FWhere := nil;
  FSQLDestination := nil;
  FDataObject := nil;
end;

constructor TioRESTRequestBody.Create(const AJSONString: String; const AOwnDataObject:Boolean);
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

destructor TioRESTRequestBody.Destroy;
begin
  // Clean up
  if FOwnDataObject and Assigned(FDataObject) then
    FDataObject.Free;
  inherited;
end;

function TioRESTRequestBody.GetBlindInsert: Boolean;
begin
  Result := FBlindInsert.Value;
end;

function TioRESTRequestBody.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioRESTRequestBody.GetRelationOID: Integer;
begin
  Result := FRelationOID.Value;
end;

function TioRESTRequestBody.GetRelationPropertyName: String;
begin
  Result := FRelationPropertyName.Value;
end;

function TioRESTRequestBody.GetSQLDestination: IioSQLDestination;
begin
  Result := FSQLDestination;
end;

function TioRESTRequestBody.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

procedure TioRESTRequestBody.SetBlindInsert(const Value: Boolean);
begin
  FBlindInsert.Value := Value;
end;

procedure TioRESTRequestBody.SetDataObject(const Value: TObject);
begin
  FDataObject := Value;
end;

procedure TioRESTRequestBody.SetRelationOID(const Value: Integer);
begin
  FRelationOID.Value := Value;
end;

procedure TioRESTRequestBody.SetRelationPropertyName(const Value: String);
begin
  FRelationPropertyName.Value := Value;
end;

procedure TioRESTRequestBody.SetSQLDestination(const Value: IioSQLDestination);
begin
  FSQLDestination := Value;
end;

procedure TioRESTRequestBody.SetWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

function TioRESTRequestBody.ToJSONObject: TJSONObject;
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
    LJSONValue := io.Mapper.From(FWhere).byFields.TypeAnnotationsON.ToJSON;
    Result.AddPair(KEY_WHERE, LJSONValue);
  end;
  // SQLDestination
  if Assigned(FSQLDestination) then
  begin
    LJSONValue := io.Mapper.From(FSQLDestination).byFields.TypeAnnotationsON.ToJSON;
    Result.AddPair(KEY_SQLDESTINATION, LJSONValue);
  end;
  // DataOject
  if Assigned(FDataObject) then
  begin
    LJSONValue := io.Mapper.From(FDataObject).byFields.TypeAnnotationsON.ToJSON;
    Result.AddPair(KEY_DATAOBJECT, LJSONValue);
  end;
end;

end.
