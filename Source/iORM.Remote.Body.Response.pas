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





unit iORM.Remote.Body.Response;

interface

uses
  System.JSON, System.Classes, iORM.DB.Interfaces;

type

  TioRemoteResponseBody = class(TInterfacedObject, IioRemoteResponseBody)
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
  iORM, System.NetEncoding, iORM.Exceptions, DJSON;

{ TioRemoteResponseBody }

constructor TioRemoteResponseBody.Create(const AOwnDataObject:Boolean);
begin
  inherited Create;
  FDataObject := nil;
  FJSONDataValue := nil;
  FStream := TMemoryStream.Create;
  FOwnDataObject := AOwnDataObject;
end;

constructor TioRemoteResponseBody.Create(const AJSONObject: TJSONObject; const AOwnDataObject:Boolean);
var
  LJSONValue: TJSONValue;
  LStreamWriter: TStreamWriter;
begin
  Self.Create(AOwnDataObject);
  // DataObject
  LJSONValue := AJSONObject.GetValue(KEY_DATAOBJECT);
  if Assigned(LJSONValue) then
    FDataObject := dj.FromJSON(LJSONValue).byFields.TypeAnnotationsON.ToObject;
  // JSONDataValue
  LJSONValue := AJSONObject.GetValue(KEY_JSONDATAVALUE);
  if Assigned(LJSONValue) then
  begin
    LJSONValue := AJSONObject.GetValue(KEY_JSONDATAVALUE);
    FJSONDataValue := TJSONValue(LJSONValue.Clone);
  end;
  // Stream
  LJSONValue := AJSONObject.GetValue(KEY_STREAM);
  if Assigned(LJSONValue) then
  begin
    FStream.Position := 0;
    LStreamWriter := TStreamWriter.Create(FStream);
    try
//      LStreamWriter.Write(DecodeString(LJSONValue.Value));
      LStreamWriter.Write(   TNetEncoding.Base64.Decode(LJSONValue.Value)   );
      FStream.Position := 0;
    finally
      LStreamWriter.Free;
    end;
  end;
end;

constructor TioRemoteResponseBody.Create(const AJSONString: String; const AOwnDataObject:Boolean);
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

destructor TioRemoteResponseBody.Destroy;
begin
  // Clean up
  FStream.Free;
  if Assigned(FJSONDataValue) then
    FJSONDataValue.Free;
  if FOwnDataObject and Assigned(FDataObject) then
    FDataObject.Free;
  inherited;
end;

function TioRemoteResponseBody.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioRemoteResponseBody.GetJSONDataValue: TJSONValue;
begin
  Result := FJSONDataValue;
end;

function TioRemoteResponseBody.GetStream: TStream;
begin
  Result := FStream;
end;

procedure TioRemoteResponseBody.SetDataObject(const Value: TObject);
begin
  FDataObject := Value;
end;

procedure TioRemoteResponseBody.SetJSONDataValue(const Value: TJSONValue);
begin
  FJSONDataValue := Value;
end;

function TioRemoteResponseBody.ToJSONObject: TJSONObject;
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
    LJSONValue := dj.From(FDataObject).byFields.TypeAnnotationsON.ToJsonValue;
    Result.AddPair(KEY_DATAOBJECT, LJSONValue);
  end;
  // Stream
  if Assigned(FStream) then
  begin
    LStringStream := TStringStream.Create;
    try
      FStream.Position := 0;
      TNetEncoding.Base64.Encode(FStream, LStringStream);
      LStringStream.Position := 0;
      Result.AddPair(KEY_STREAM, LStringStream.DataString);
    finally
      LStringStream.Free;
    end;
  end;
end;

end.
