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



unit iORM.CommonTypes;

interface

uses
  System.Rtti, System.Generics.Collections, System.SysUtils, Winapi.Windows;

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

  TioLocker = record
  private
    FCriticalSection: TRTLCriticalSection;
  public
    Padding: array[0..6] of TVarData;  // Only to fix CPU cache line dimension problem
    procedure Init;
    procedure Done;
    procedure Lock;
    procedure UnLock;
  end;

  IioThreadSafe<T> = interface(TFunc<T>)
    ['{353443F7-0352-48E3-978C-56D32E8E9EE9}']
    procedure Invoke(const value: T); overload;
  end;

  TioThreadSafe<T> = class(TInterfacedObject, IioThreadSafe<T>)
  strict private
    FInternalValue: T;
    FLocker: TioLocker;
    FOwnObj: Boolean;
  public
    constructor Create(const AValue:T; const AOwnObj:Boolean=True);
    destructor Destroy; override;
    procedure Invoke(const AValue: T); overload;
    function Invoke: T; overload;
  end;

implementation

uses
  iORM.Exceptions, System.TypInfo;

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

constructor TioThreadSafe<T>.Create(const AValue: T; const AOwnObj: Boolean);
var
  LTypeInfo: PTypeInfo;
begin
  inherited Create;
  FLocker.Init;
  FInternalValue := AValue;
  // Own the value only if it is a class object
  FOwnObj := AOwnObj;
  LTypeInfo := TypeInfo(T);
  FOwnObj := AOwnObj and (LTypeInfo.Kind = tkClass);
end;

procedure TioThreadSafe<T>.Invoke(const AValue: T);
begin
  FLocker.Lock;
  try
    FInternalValue := AValue;
  finally
    FLocker.UnLock;
  end;
end;

destructor TioThreadSafe<T>.Destroy;
var
  LObj: TObject;
begin
  // Own class object value
  if FOwnObj then
  begin
    LObj := TObject(@FInternalValue);
    if Assigned(LObj) then
      LObj.Free;
  end;
  // Clean the Locker
  FLocker.Done;
  inherited;
end;

function TioThreadSafe<T>.Invoke: T;
begin
  FLocker.Lock;
  try
    Result := FInternalValue;
  finally
    FLocker.UnLock;
  end;
end;

{ TioLocker }

procedure TioLocker.Done;
begin
  DeleteCriticalSection(FCriticalSection);
end;

procedure TioLocker.Init;
begin
  InitializeCriticalSection(FCriticalSection);
end;

procedure TioLocker.Lock;
begin
  EnterCriticalSection(FCriticalSection);
end;

procedure TioLocker.UnLock;
begin
  LeaveCriticalSection(FCriticalSection);
end;

end.

