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



unit iORM.DuckTyped.StreamObject;

interface

uses
  iORM.DuckTyped.Interfaces, System.Classes, System.Rtti,
  iORM.DMVC.ObjectsMappersAdapter, iORM.Attributes;

type

  // DuckTypedStreamObject
  //  NB: IWrappedObject interface is for DMVC ObjectsMappers adapter
  TioDuckTypedStreamObject = class(TInterfacedObject, IioDuckTypedStreamObject, IWrappedObject)
  strict protected
    FObj: TObject;
    FLoadFromStreamMethod: TRttiMethod;
    FSaveToStreamMethod: TRttiMethod;
    FIsEmptyMethod: TRttiMethod;
    FCountProperty: TRttiProperty;
  public
    constructor Create(AObj: TObject);
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    function IsEmpty: Boolean; virtual;
  end;

implementation

uses
  iORM.RttiContext.Factory, iORM.Exceptions, iORM;

{ TioDuckTypedStreamObject }

constructor TioDuckTypedStreamObject.Create(AObj: TObject);
var
  Ctx: TRttiContext;
  Typ: TRttiType;
begin
  inherited Create;
  FObj := AObj;
  // Init Rtti
  Ctx := TioRttiContextFactory.RttiContext;
  Typ := Ctx.GetType(AObj.ClassInfo);
  // LoadFromStreamMethod method
  FLoadFromStreamMethod := Typ.GetMethod('LoadFromStream');
  if not Assigned(FLoadFromStreamMethod) then EioException.Create('DuckTypedStreamObject: "LoadFromStream" method not found in the object');
  // SaveFromStreamMethod method
  FSaveToStreamMethod := Typ.GetMethod('SaveToStream');
  if not Assigned(FSaveToStreamMethod) then EioException.Create('DuckTypedStreamObject: "SaveToStream" method not found in the object');
  // IsEmpty method
  FIsEmptyMethod := Typ.GetMethod('IsEmpty');
  // Count property method
  FCountProperty := Typ.GetProperty('Count');
end;

function TioDuckTypedStreamObject.IsEmpty: Boolean;
begin
  // FIsEmptyMethod method assigned
  if Assigned(FIsEmptyMethod)
    then Result := FIsEmptyMethod.Invoke(FObj, []).AsBoolean
  // FCountProperty method assigned
  else if Assigned(FCountProperty)
    then Result := (FCountProperty.GetValue(FObj).AsInteger = 0)
  // Otherwise return False
  else Result := False;
end;

procedure TioDuckTypedStreamObject.LoadFromStream(Stream: TStream);
begin
  FLoadFromStreamMethod.Invoke(FObj, [Stream]);
end;

procedure TioDuckTypedStreamObject.SaveToStream(Stream: TStream);
begin
  FSaveToStreamMethod.Invoke(FObj, [Stream]);
end;

end.
