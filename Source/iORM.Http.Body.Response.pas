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
  System.Classes, iORM.DB.Interfaces, System.JSON;

type

  TioHttpResponseBody = class(TInterfacedObject, IioHttpResponseBody)
  private
    // exceptions
    FExceptionClassName: String;
    FExceptionMessage: String;
    // results
    FJSONDataValue: TJSONValue;
    FStream: TStream;
    // methods
    function ExceptionOccurred: Boolean;
    function GetExceptionClassName: String;
    function GetExceptionMessage: String;
    function GetJSONDataValue: TJSONValue;
    function GetJSONDataValueAsInteger: Integer;
    function GetJSONDataValueAsObject: TObject;
    function GetStream: TStream;
    procedure SetExceptionClassName(const Value: String);
    procedure SetExceptionMessage(const Value: String);
    procedure SetJSONDataValue(const Value: TJSONValue);
    procedure SetJSONDataValueAsInteger(const Value: Integer);
    procedure SetJSONDataValueAsObject(const AObj: TObject);
  public
    constructor Create;
    constructor CreateByJSONString(const AJSONString: String);
    destructor Destroy; override;
    function AsString: String;
    // properties
    property ExceptionClassName: String read GetExceptionClassName write SetExceptionClassName;
    property ExceptionMessage: String read GetExceptionMessage write SetExceptionMessage;
    property JSONDataValue: TJSONValue read GetJSONDataValue write SetJSONDataValue;
    property JSONDataValueAsInteger: Integer read GetJSONDataValueAsInteger write SetJSONDataValueAsInteger;
    property JSONDataValueAsObject: TObject read GetJSONDataValueAsObject write SetJSONDataValueAsObject;
    property Stream: TStream read GetStream;
  end;

implementation

uses
  iORM, System.NetEncoding, iORM.Exceptions, DJSON, System.SysUtils;

{ TioHttpResponseBody }

constructor TioHttpResponseBody.Create;
begin
  inherited Create;
  // exceptions
  FExceptionClassName := IO_STRING_NULL_VALUE;
  FExceptionMessage := IO_STRING_NULL_VALUE;
  // results
  FJSONDataValue := nil;
  FStream := nil;
end;

constructor TioHttpResponseBody.CreateByJSONString(const AJSONString: String);
var
  LJSONObject: TJSONObject;
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
  LJSONObject := TJSONObject.ParseJSONValue(AJSONString) as TJSONObject;
  try
    // ExceptionClassName
    LJSONValue := LJSONObject.GetValue(BR_EXCEPTIONCLASSNAME);
    if Assigned(LJSONValue) then
      FExceptionClassName := LJSONValue.Value;
    // ExceptionClassMessage
    LJSONValue := LJSONObject.GetValue(BR_EXCEPTIONMESSAGE);
    if Assigned(LJSONValue) then
      FExceptionMessage := LJSONValue.Value;
    // JSONDataValue
    LJSONValue := LJSONObject.GetValue(BR_JSONDATAVALUE);
    if Assigned(LJSONValue) then
      FJSONDataValue := LJSONValue.Clone as TJSONValue;
    // Stream
    LJSONValue := LJSONObject.GetValue(BR_STREAM);
    if Assigned(LJSONValue) then
      _LoadStream;
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

function TioHttpResponseBody.ExceptionOccurred: Boolean;
begin
  Result := not (FExceptionClassName.IsEmpty and FExceptionMessage.IsEmpty);
end;

function TioHttpResponseBody.GetExceptionClassName: String;
begin
 Result := FExceptionClassName;
end;

function TioHttpResponseBody.GetExceptionMessage: String;
begin
 Result := FExceptionMessage;
end;

function TioHttpResponseBody.GetJSONDataValue: TJSONValue;
begin
  Result := FJSONDataValue;
end;

function TioHttpResponseBody.GetJSONDataValueAsInteger: Integer;
begin
  Result := FJSONDataValue.AsType<Integer>;
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

procedure TioHttpResponseBody.SetExceptionClassName(const Value: String);
begin
  FExceptionClassName := Value;
end;

procedure TioHttpResponseBody.SetExceptionMessage(const Value: String);
begin
  FExceptionMessage := Value;
end;

procedure TioHttpResponseBody.SetJSONDataValue(const Value: TJSONValue);
begin
  FJSONDataValue := Value;
end;

procedure TioHttpResponseBody.SetJSONDataValueAsInteger(const Value: Integer);
begin
  FJSONDataValue := TJSONNumber.Create(Value);
end;

procedure TioHttpResponseBody.SetJSONDataValueAsObject(const AObj: TObject);
begin
  if Assigned(FJSONDataValue) then
    FreeAndNil(FJSONDataValue);
  if Assigned(AObj) then
    FJSONDataValue := dj.From(AObj).OpType(ssHTTP).byFields.TypeAnnotationsON.ToJsonValue;
end;

function TioHttpResponseBody.AsString: String;
var
  LJSONObject: TJSONObject;
  procedure _SaveStream;
  var
    LStringStream: TStringStream;
  begin
    LStringStream := TStringStream.Create;
    try
      FStream.Position := 0;
      TNetEncoding.Base64.Encode(FStream, LStringStream);
      LStringStream.Position := 0;
      LJSONObject.AddPair(BR_STREAM, LStringStream.DataString);
    finally
      LStringStream.Free;
    end;
  end;
begin
  LJSONObject := TJSONObject.Create;
  try
    // ExceptionClassName
    if FExceptionClassName <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(BR_EXCEPTIONCLASSNAME, FExceptionClassName);
    // ExceptionClassMessage
    if FExceptionMessage <> IO_STRING_NULL_VALUE then
      LJSONObject.AddPair(BR_EXCEPTIONMESSAGE, FExceptionMessage);
    // JSONDataValue
    if Assigned(FJSONDataValue) then
      LJSONObject.AddPair(BR_JSONDATAVALUE, FJSONDataValue.Clone as TJSONValue);
    // Stream
    if Assigned(FStream) then
      _SaveStream;
    // ---------- end ----------
    // Result JSONObject as string
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

end.
