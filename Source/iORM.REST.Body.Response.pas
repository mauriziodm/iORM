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



unit iORM.REST.Body.Response;

interface

uses
  System.JSON, System.Classes, iORM.DB.Interfaces;

type

  TioRESTResponseBody = class(TInterfacedObject, IioRESTResponseBody)
  private
    FDataObject: TObject;
    FOwnDataObject: Boolean;
    FJSONDataValue: TJSONValue;
    FStream: TStream;
    function GetDataObject: TObject;
    function GetJSONDataValue: TJSONValue;
    function GetStream: TStream;
    procedure SetDataObject(const Value: TObject);
    procedure SetJSONDataValue(const Value: TJSONValue);
    function ToJSONObject:TJSONObject;
  public
    constructor Create(const AOwnDataObject:Boolean); overload;
    constructor Create(const AJSONObject:TJSONObject; const AOwnDataObject:Boolean); overload;
    constructor Create(const AJSONString:String; const AOwnDataObject:Boolean); overload;
    destructor Destroy; override;
  end;

implementation

uses
  iORM, Soap.EncdDecd, iORM.Exceptions;

{ TioRESTResponseBody }

constructor TioRESTResponseBody.Create(const AOwnDataObject:Boolean);
begin
  inherited Create;
  FDataObject := nil;
  FJSONDataValue := nil;
  FStream := nil;
  FOwnDataObject := AOwnDataObject;
end;

constructor TioRESTResponseBody.Create(const AJSONObject: TJSONObject; const AOwnDataObject:Boolean);
var
  LJSONValue: TJSONValue;
  LStreamWriter: TStreamWriter;
begin
  Self.Create(AOwnDataObject);
  // DataObject
  LJSONValue := AJSONObject.GetValue(KEY_DATAOBJECT);
  if Assigned(LJSONValue) then
    FDataObject := io.Mapper.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
  // JSONDataValue
  LJSONValue := AJSONObject.GetValue(KEY_JSONDATAVALUE);
  if Assigned(LJSONValue) then
  begin
    LJSONValue := AJSONObject.GetValue(KEY_JSONDATAVALUE);
    FJSONDataValue := TJSONValue(LJSONValue.Clone);
  end;
  // Sream
  LJSONValue := AJSONObject.GetValue(KEY_STREAM);
  if Assigned(LJSONValue) then
  begin
    FStream.Position := 0;
    LStreamWriter := TStreamWriter.Create(FStream);
    try
      LStreamWriter.Write(DecodeString(LJSONValue.Value));
    finally
      LStreamWriter.Free;
    end;
  end;
end;

constructor TioRESTResponseBody.Create(const AJSONString: String; const AOwnDataObject:Boolean);
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

destructor TioRESTResponseBody.Destroy;
begin
  // Clean up
  if Assigned(FJSONDataValue) then
    FJSONDataValue.Free;
  if FOwnDataObject and Assigned(FDataObject) then
    FDataObject.Free;
  inherited;
end;

function TioRESTResponseBody.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioRESTResponseBody.GetJSONDataValue: TJSONValue;
begin
  Result := FJSONDataValue;
end;

function TioRESTResponseBody.GetStream: TStream;
begin
  if not Assigned(FStream) then
    FStream := TMemoryStream.Create;
  Result := FStream;
end;

procedure TioRESTResponseBody.SetDataObject(const Value: TObject);
begin
  FDataObject := Value;
end;

procedure TioRESTResponseBody.SetJSONDataValue(const Value: TJSONValue);
begin
  FJSONDataValue := Value;
end;

function TioRESTResponseBody.ToJSONObject: TJSONObject;
var
  LJSONValue: TJSONValue;
  LStringStream: TStringStream;
begin
  Result := TJSONObject.Create;
  // JSONDataValue
  if Assigned(FJSONDataValue) then
    Result.AddPair(KEY_JSONDATAVALUE, FJSONDataValue);
  // DataOject
  if Assigned(FDataObject) then
  begin
    LJSONValue := io.Mapper.From(FDataObject).byFields.TypeAnnotationsON.ToJSON;
    Result.AddPair(KEY_DATAOBJECT, LJSONValue);
  end;
  // Stream
  if Assigned(FStream) then
  begin
    LStringStream := TStringStream.Create;
    try
      FStream.Position := 0;
      EncodeStream(FStream, LStringStream);
      Result.AddPair(KEY_STREAM, LStringStream.DataString);
    finally
      LStringStream.Free;
    end;
  end;
end;

end.
