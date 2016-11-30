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



unit iORM.Containers.ObjectList;

interface

uses
  System.Generics.Collections, iORM.Containers.Interfaces;

type

  TioInterfacedObjectList<T: class> = class(TObjectList<T>, IioList<T>, IInterface)
  protected
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    [Volatile] FRefCount: Integer;
{$ENDIF}
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
// ---------------- End: section added for IInterface support ---------------
  public
// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
    property RefCount: Integer read FRefCount;
{$ENDIF}
// ---------------- End: section added for IInterface support ---------------
    function GetCapacity: Integer;
    procedure SetCapacity(const Value: Integer);
    function GetCount: Integer;
    procedure SetCount(const Value: Integer);
    function GetItem(Index: Integer): T;
    procedure SetItem(Index: Integer; const Value: T);
  end;
// ---------------- Start: section added for IInterface support ---------------
  {$IFNDEF SYSTEM_HPP_DEFINES_OBJECTS}
//  {$NODEFINE TInterfacedObject}         { defined in systobj.h }
  {$ENDIF}
// ---------------- End: section added for IInterface support ---------------

implementation

{ TioInterfacedList<T> }

// ---------------- Start: section added for IInterface support ---------------
{$IFNDEF AUTOREFCOUNT}
class function TioInterfacedObjectList<T>.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TioInterfacedObjectList<T>(Result).FRefCount := 1;
end;

procedure TioInterfacedObjectList<T>.AfterConstruction;
begin
// Release the constructor's implicit refcount
  AtomicDecrement(FRefCount);
end;

procedure TioInterfacedObjectList<T>.BeforeDestruction;
begin
  if RefCount <> 0 then
    System.Error(reInvalidPtr);
end;
{$ENDIF}
// ---------------- End: section added for IInterface support ---------------

function TioInterfacedObjectList<T>.GetCapacity: Integer;
begin
  Result := inherited Capacity;
end;

function TioInterfacedObjectList<T>.GetCount: Integer;
begin
  Result := inherited Count;
end;

function TioInterfacedObjectList<T>.GetItem(Index: Integer): T;
begin
  Result := inherited Items[Index];
end;

function TioInterfacedObjectList<T>.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioInterfacedObjectList<T>.SetCapacity(const Value: Integer);
begin
  inherited Capacity := Value;
end;

procedure TioInterfacedObjectList<T>.SetCount(const Value: Integer);
begin
  inherited Count := Value;
end;

procedure TioInterfacedObjectList<T>.SetItem(Index: Integer; const Value: T);
begin
   inherited Items[Index] := Value;
end;

function TioInterfacedObjectList<T>._AddRef: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicIncrement(FRefCount);
{$ELSE}
  Result := __ObjAddRef;
{$ENDIF}
end;

function TioInterfacedObjectList<T>._Release: Integer;
begin
{$IFNDEF AUTOREFCOUNT}
  Result := AtomicDecrement(FRefCount);
  if Result = 0 then
    Destroy;
{$ELSE}
  Result := __ObjRelease;
{$ENDIF}
end;

end.
