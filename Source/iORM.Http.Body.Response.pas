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
    // auth
    FAuthResult1: String;
    FAuthResult2: String;
    // others
    FExceptionClassName: String;
    FExceptionMessage: String;
    FJSONDataValue: TJSONValue;
    FStream: TStream;
    // methods
    function ExceptionOccurred: Boolean;
    function GetAuthResult1: String;
    function GetAuthResult2: String;
    function GetExceptionClassName: String;
    function GetExceptionMessage: String;
    function GetJSONDataValue: TJSONValue;
    function GetJSONDataValueAsObject: TObject;
    function GetStream: TStream;
    procedure SetAuthResult1(const Value: String);
    procedure SetAuthResult2(const Value: String);
    procedure SetExceptionClassName(const Value: String);
    procedure SetExceptionMessage(const Value: String);
    procedure SetJSONDataValue(const Value: TJSONValue);
    procedure SetJSONDataValueAsObject(const AObj: TObject);
    function ToJSONText: String;
  public
    constructor Create;
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
  // auth
  FAuthResult1 := IO_STRING_NULL_VALUE;
  FAuthResult2 := IO_STRING_NULL_VALUE;
  // others
  FExceptionClassName := IO_STRING_NULL_VALUE;
  FExceptionMessage := IO_STRING_NULL_VALUE;
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
    // ---------- session ----------
    // AuthResult1
    LJSONValue := LJSONObject.GetValue(KEY_AUTH_RESULT1);
    if Assigned(LJSONValue) then
      FAuthResult1 := LJSONValue.Value;
    // AuthResult2
    LJSONValue := LJSONObject.GetValue(KEY_AUTH_RESULT2);
    if Assigned(LJSONValue) then
      FAuthResult2 := LJSONValue.Value;
    // ---------- others ----------
    // ExceptionClassName
    LJSONValue := LJSONObject.GetValue(KEY_EXCEPTIONCLASSNAME);
    if Assigned(LJSONValue) then
      FExceptionClassName := LJSONValue.Value;
    // ExceptionClassMessage
    LJSONValue := LJSONObject.GetValue(KEY_EXCEPTIONMESSAGE);
    if Assigned(LJSONValue) then
      FExceptionMessage := LJSONValue.Value;
    // JSONDataValue
    LJSONValue := LJSONObject.GetValue(KEY_JSONDATAVALUE);
    if Assigned(LJSONValue) then
      FJSONDataValue := LJSONValue.Clone as TJSONValue;
    // Stream
    LJSONValue := LJSONObject.GetValue(KEY_STREAM);
    if Assigned(LJSONValue) then
      _LoadStream;
    // ---------- end ----------
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

function TioHttpResponseBody.GetAuthResult1: String;
begin
  Result := FAuthResult1;
end;

function TioHttpResponseBody.GetAuthResult2: String;
begin
  Result := FAuthResult2;
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

procedure TioHttpResponseBody.SetAuthResult1(const Value: String);
begin
  FAuthResult1 := Value;
end;

procedure TioHttpResponseBody.SetAuthResult2(const Value: String);
begin
  FAuthResult2 := Value;
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
    // ---------- session ----------
    // AuthResult1
    LJSONObject.AddPair(KEY_AUTH_RESULT1, FAuthResult1);
    // AuthResult2
    LJSONObject.AddPair(KEY_AUTH_RESULT2, FAuthResult2);
    // ---------- others ----------
    // ExceptionClassName
    LJSONObject.AddPair(KEY_EXCEPTIONCLASSNAME, FExceptionClassName);
    // ExceptionClassMessage
    LJSONObject.AddPair(KEY_EXCEPTIONMESSAGE, FExceptionMessage);
    // JSONDataValue
    if Assigned(FJSONDataValue) then
      LJSONObject.AddPair(KEY_JSONDATAVALUE, FJSONDataValue.Clone as TJSONValue);
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
