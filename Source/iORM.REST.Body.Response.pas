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
  iORM.REST.Interfaces, System.JSON;

type

  TioRESTResponseBody = class(TInterfacedObject, IioRESTResponseBody)
  private
    FDataObject: TObject;
    FJSONDataValue: TJSONValue;
    function GetDataObject: TObject;
    function GetJSONDataValue: TJSONValue;
    procedure SetDataObject(const Value: TObject);
    procedure SetJSONDataValue(const Value: TJSONValue);
    function ToJSONObject:TJSONObject;
  public
    constructor Create; overload;
    constructor Create(const AJSONObject:TJSONObject); overload;
    constructor Create(const AJSONString:String); overload;
    destructor Destroy; override;
  end;

implementation

uses
  iORM;

{ TioRESTResponseBody }

constructor TioRESTResponseBody.Create;
begin
  inherited;
  FDataObject := nil;
  FJSONDataValue := nil;
end;

constructor TioRESTResponseBody.Create(const AJSONObject: TJSONObject);
var
  LJSONValue: TJSONValue;
begin
  Self.Create;
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
end;

constructor TioRESTResponseBody.Create(const AJSONString: String);
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

destructor TioRESTResponseBody.Destroy;
begin
  // Clean up
  if Assigned(FJSONDataValue) then
    FJSONDataValue.Free;
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
end;

end.
