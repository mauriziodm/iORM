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



unit iORM.CommonTypes;

interface

uses
  System.Rtti, System.Generics.Collections, System.SysUtils;

const
  IO_CLASSFROMFIELD_FIELDNAME = 'ClassInfo';
  IO_CONNECTIONDEF_DEFAULTNAME = 'NO_NAME';
  IO_INTEGER_NULL_VALUE = 0;

type

  // Object Status
  TioObjectStatus = (osDirty = 0, osClean, osDeleted);

  // Common ClassRef
  TioClassRef = class of TObject;

  // Orientation of  DB index
  TioIndexOrientation = (ioAscending = 0, ioDescending);

  // FD monitor and trace mode
  TioMonitorMode = (mmDisabled = 0, mmRemote, mmFlatFile);

  // Nullables
  TioNullable<T> = record
  const
    ISNULL_VALUE = '$';
  private
    FValue: T;
    FIsNull: String;
    function GetValue: T;
    procedure SetValue(const Value: T);
    function GetHasValue: Boolean;
    function GetIsNull: Boolean;
  public
    procedure Clear;
    property Value:T read GetValue write SetValue;
    property IsNull:Boolean read GetIsNull;
    property HasValue:Boolean read GetHasValue;
  end;
  TioNullableString = TioNullable<String>;
  TioNullableInteger = TioNullable<Integer>;
  TioNullableFloat = TioNullable<Extended>;
  TioNullableBoolean = TioNullable<Boolean>;
  TioNullableDateTime = TioNullable<TDateTime>;

  IioThreadSafe<T:class> = interface(TFunc<T>)
    ['{353443F7-0352-48E3-978C-56D32E8E9EE9}']
    procedure Invoke(const value: T); overload;
  end;

  TioThreadSafe<T:class> = class(TInterfacedObject, IioThreadSafe<T>)
  strict private
    FObj: T;
    FOwnObj: Boolean;
  public
    constructor Create(const AObj:T; const AOwnObj:Boolean=True);
    destructor Destroy; override;
    procedure Invoke(const AValue: T); overload;
    function Invoke: T; overload;
  end;

implementation

uses
  iORM.Exceptions;

{ ioNullable<T> }

procedure TioNullable<T>.Clear;
begin
  FIsNull := String.Empty;
end;

function TioNullable<T>.GetHasValue: Boolean;
begin
  result := (not IsNull);
end;

function TioNullable<T>.GetIsNull: Boolean;
begin
  Result := (Length(FIsNull) = 0);
end;

function TioNullable<T>.GetValue: T;
begin
  if IsNull then
    raise EioException.Create('ioNullable: The value is null.');
  Result := FValue;
end;

procedure TioNullable<T>.SetValue(const Value: T);
begin
  FValue := Value;
  FIsNull := ISNULL_VALUE;
end;

{ TioThreadSafe<T> }

constructor TioThreadSafe<T>.Create(const AObj: T; const AOwnObj: Boolean);
begin
  inherited Create;
  FObj := AObj;
  FOwnObj := AOwnObj;
end;

procedure TioThreadSafe<T>.Invoke(const AValue: T);
begin
  TMonitor.Enter(FObj);
  try
    FObj := AValue;
  finally
    TMonitor.Exit(FObj);
  end;
end;

destructor TioThreadSafe<T>.Destroy;
begin
  if FOwnObj and Assigned(FObj) then
    FObj.Free;
  inherited;
end;

function TioThreadSafe<T>.Invoke: T;
begin
  TMonitor.Enter(FObj);
  try
    Result := FObj;
  finally
    TMonitor.Exit(FObj);
  end;
end;

end.

