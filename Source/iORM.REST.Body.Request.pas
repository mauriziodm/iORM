{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.REST.Body.Request;

interface

uses
  iORM.Where.Interfaces, System.JSON, iORM.CommonTypes, iORM.REST.Interfaces;

type

  TioRESTRequestBody = class(TInterfacedObject, IioRESTRequestBody)
  private
    FWhere: IioWhere;
    FDataObject: TObject;
    FRelationPropertyName: TioNullableString;
    FRelationOID: TioNullableInteger;
    FBlindInsert: TioNullableBoolean;
    function GetBlindInsert: Boolean;
    function GetDataObject: TObject;
    function GetRelationOID: Integer;
    function GetRelationPropertyName: String;
    function GetWhere: IioWhere;
    procedure SetBlindInsert(const Value: Boolean);
    procedure SetDataObject(const Value: TObject);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropertyName(const Value: String);
    procedure SetWhere(const Value: IioWhere);
    function ToJSONObject:TJSONObject;
  public
    constructor Create; overload;
    constructor Create(const AJSONObject:TJSONObject); overload;
    constructor Create(const AJSONString:String); overload;
  end;

implementation

uses
  System.SysUtils, iORM;

{ TioRESTRequestBody }

constructor TioRESTRequestBody.Create;
begin
  inherited;
  FWhere := nil;
  FDataObject := nil;
end;

constructor TioRESTRequestBody.Create(const AJSONObject: TJSONObject);
var
  LJSONValue: TJSONValue;
begin
  Self.Create;
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
  // DataObject
  LJSONValue := AJSONObject.GetValue(KEY_DATAOBJECT);
  if Assigned(LJSONValue) then
    FDataObject := io.Mapper.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
end;

constructor TioRESTRequestBody.Create(const AJSONString: String);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    Self.Create(LJSONObject);
  finally
    LJSONObject.Free;
  end;
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
  // DataOject
  if Assigned(FDataObject) then
  begin
    LJSONValue := io.Mapper.From(FDataObject).byFields.TypeAnnotationsON.ToJSON;
    Result.AddPair(KEY_DATAOBJECT, LJSONValue);
  end;
end;

end.
