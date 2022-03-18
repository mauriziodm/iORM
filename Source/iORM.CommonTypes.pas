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
  System.Rtti, System.Generics.Collections, System.SysUtils;

const
  // M.M. 11/08/18 Se non vengono specificati gli attributi portiamo a 50 la lunghezza perchè Firebird ha un limite nella generazione degli indici su campi lunghi 255;
  // Mauri 04/08/20: Vero ma con un PageSize = 4096 (il più diffuso) il limite massimo sarebbe 253
  IO_DEFAULT_FIELD_LENGTH = 250;
  IO_DEFAULT_FIELD_PRECISION = 10;
  IO_DEFAULT_FIELD_SCALE = 3;

  IO_TRUECLASS_FIELDNAME = 'ClassInfo';
  IO_TRUECLASS_FIELDLENGTH = 250;

  IO_CONNECTIONDEF_DEFAULTNAME = 'NO_NAME';
  IO_INTEGER_NULL_VALUE = 0;

  IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME = 'Master___ID';

type

  // Compare operators
  TioCompareOp = (coEqual, coNotEqual, coGreater, coLower, coGreaterOrEqual, coLowerOrEqual, coLike, coNotLike, coIsNull, coIsNotNull);

  // Logic relations
  TioLogicOp = (loAnd, loOr, loNot, loOpenPar, loClosePar);

  // Object Status
  TioObjStatus = (osDirty = 0, osClean, osDeleted);

  // Object version
  TioObjVersion = type TDateTime;

  // Common ClassRef
  TioClassRef = class of TObject;

  // Orientation of  DB index
  TioIndexOrientation = (ioAscending = 0, ioDescending);

  // FD monitor and trace mode
  TioMonitorMode = (mmDisabled = 0, mmRemote, mmFlatFile);

  // Anonimous methods for ShowWait & CloseWait
  TioShowWaitProc = reference to procedure;
  TioHideWaitProc = reference to procedure;

  TioViewDataType = (dtSingleObject, dtListOfObjects);

  // Selection Type (for selector ActiveBindSourceAdapters)
  TioSelectionType = (stAppend, stInsert);

  // LoadType property for BindSources
  TioLoadType = (ltSetDataObject, ltFromBSAsIs, ltFromBSReload, ltFromBSReloadNewInstance, ltByTypeName, ltAuto);

  // Some pointers to TValue
  PValue = ^TValue;

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


end.

