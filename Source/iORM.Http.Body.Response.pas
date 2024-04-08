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
unit iORM.Http.Body.Response;

interface

uses
  System.JSON, System.Classes, iORM.DB.Interfaces;

type

  TioHttpResponseBody = class(TInterfacedObject, IioHttpResponseBody)
  private
    FJSONDataValue: TJSONValue;
    FStream: TStream;
    function GetJSONDataValue: TJSONValue;
    function GetJSONDataValueAsObject: TObject;
    function GetStream: TStream;
    procedure SetJSONDataValue(const Value: TJSONValue);
    procedure SetJSONDataValueAsObject(const AObj: TObject);
    function ToJSONText: String;
  public
    constructor Create;
    constructor CreateByJSONObject(const AJSONObject: TJSONObject);
    constructor CreateByJSONString(const AJSONString: String);
    destructor Destroy; override;
  end;

implementation

uses
  iORM, System.NetEncoding, iORM.Exceptions, DJSON, System.SysUtils;

{ TioHttpResponseBody }

constructor TioHttpResponseBody.Create;
begin
  inherited Create;
  FJSONDataValue := nil;
  FStream := nil;
end;

constructor TioHttpResponseBody.CreateByJSONObject(const AJSONObject: TJSONObject);
var
  LJSONValue: TJSONValue;
  procedure _LoadStream;
  var
    LStreamWriter: TStreamWriter;
  begin
    GetStream.Position := 0; // note: GetStream instead of FStream to create the stream instance if necessary
    LStreamWriter := TStreamWriter.Create(FStream);
    try
      LStreamWriter.Write(TNetEncoding.Base64.Decode(LJSONValue.Value));
      FStream.Position := 0;
    finally
      LStreamWriter.Free;
    end;
  end;

begin
  Self.Create;
  // JSONDataValue
  FJSONDataValue := AJSONObject.GetValue(KEY_JSONDATAVALUE);
  // Stream
  LJSONValue := AJSONObject.GetValue(KEY_STREAM);
  if Assigned(LJSONValue) then
    _LoadStream;
end;

constructor TioHttpResponseBody.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    Self.CreateByJSONObject(LJSONObject);
  finally
    LJSONObject.Free;
  end;
end;

destructor TioHttpResponseBody.Destroy;
begin
  if Assigned(FJSONDataValue) then
    FJSONDataValue.Free;
  if Assigned(FStream) then
    FStream.Free;
  inherited;
end;

function TioHttpResponseBody.GetJSONDataValue: TJSONValue;
begin
  Result := FJSONDataValue;
end;

function TioHttpResponseBody.GetJSONDataValueAsObject: TObject;
begin
  if Assigned(FJSONDataValue) then
    Result := dj.FromJSON(FJSONDataValue).OpType(ssHTTP).byFields.TypeAnnotationsON.ToObject
  else
    Result := nil;
end;

function TioHttpResponseBody.GetStream: TStream;
begin
  if not Assigned(FStream) then
    FStream := TMemoryStream.Create;
  Result := FStream;
end;

procedure TioHttpResponseBody.SetJSONDataValue(const Value: TJSONValue);
begin
  FJSONDataValue := Value;
end;

procedure TioHttpResponseBody.SetJSONDataValueAsObject(const AObj: TObject);
begin
  if Assigned(FJSONDataValue) then
    FreeAndNil(FJSONDataValue);
  if Assigned(AObj) then
    FJSONDataValue := dj.From(AObj).OpType(ssHTTP).byFields.TypeAnnotationsON.ToJsonValue;
end;

function TioHttpResponseBody.ToJSONText: String;
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
  procedure _SaveStream;
  var
    LStringStream: TStringStream;
  begin
    LStringStream := TStringStream.Create;
    try
      FStream.Position := 0;
      TNetEncoding.Base64.Encode(FStream, LStringStream);
      LStringStream.Position := 0;
      LJSONObject.AddPair(KEY_STREAM, LStringStream.DataString);
    finally
      LStringStream.Free;
    end;
  end;

begin
  LJSONObject := TJSONObject.Create;
  try
    // JSONDataValue
    if Assigned(FJSONDataValue) then
      LJSONObject.AddPair(KEY_JSONDATAVALUE, FJSONDataValue);
    // Stream
    if Assigned(FStream) then
      _SaveStream;
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

end.
