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



unit iORM.DuckTyped.List;

interface

uses
  iORM.DuckTyped.Interfaces,
  System.Rtti, System.TypInfo;

type

  // DuckTypedList
  TioDuckTypedList = class(TInterfacedObject, IioDuckTypedList)
  strict private
    FListObject: TObject;
    FCountProperty: TRttiProperty;
    FOwnsObjectsProperty: TRttiProperty;
    FAddMethod: TRttiMethod;
    FClearMethod: TRttiMethod;
    FGetItemMethod: TRttiMethod;
    FDelete: TRttiMethod;
  strict protected
    procedure SetOwnsObjects(AValue:Boolean);
    function GetOwnsObjects: Boolean;
  public
    constructor Create(AListObject: TObject);
    procedure Add(AObject: TObject);
    procedure Clear;
    procedure Delete(Index: Integer);
    function Count: Integer;
    function GetItem(Index: Integer): TObject;
    function GetItemTypeName: String;
    function GetItemTypeInfo: PTypeInfo;
    function GetEnumerator: IEnumerator;
    property OwnsObjects:Boolean read GetOwnsObjects write SetOwnsObjects;
  end;

  // DuckTypedListEnumerator
  TioDuckTypedListEnumerator = class(TInterfacedObject, IEnumerator)
  strict protected
    FPosition: Integer;
    FDuckTypedList: IioDuckTypedList;
  public
    constructor Create(ADuckTypedList: IioDuckTypedList);
    procedure Reset;
    function MoveNext: boolean;
    function GetCurrent: TObject;
    property Current: TObject read GetCurrent;
  end;

implementation

uses
  iORM.Exceptions, iORM.RttiContext.Factory, System.SysUtils;

{ TioDuckTypedList }

procedure TioDuckTypedList.Add(AObject: TObject);
begin
  FAddMethod.Invoke(FListObject, [AObject]);
end;

procedure TioDuckTypedList.Clear;
begin
  FClearMethod.Invoke(FListObject, []);
end;

function TioDuckTypedList.Count: Integer;
begin
  Result := FCountProperty.GetValue(FListObject).AsInteger;
end;

constructor TioDuckTypedList.Create(AListObject: TObject);
var
  Ctx: TRttiContext;
  Typ: TRttiType;
begin
  inherited Create;
  FListObject := AListObject;
  // Init Rtti
  Ctx := TioRttiContextFactory.RttiContext;
  Typ := Ctx.GetType(AListObject.ClassInfo);
  // OwnsObjects Property (No exception if not exist)
  FOwnsObjectsProperty := nil;
  FOwnsObjectsProperty := Typ.GetProperty('OwnsObjects');
  // Count Property
  FCountProperty := Typ.GetProperty('Count');
  if not Assigned(FCountProperty) then EioException.Create('DuckTypedList: "Count" property not found in the object');
  // Add method
  FAddMethod := Typ.GetMethod('Add');
  if not Assigned(FAddMethod) then EioException.Create('DuckTypedList: "Add" method not found in the object');
  // Clear
  FClearMethod := Typ.GetMethod('Clear');
  if not Assigned(FClearMethod) then EioException.Create('DuckTypedList: "Clear" method not found in the object');
  // Delete
  FDelete := Typ.GetMethod('Delete');
  if not Assigned(FDelete) then EioException.Create('DuckTypedList: "Delete" method not found in the object');
  // GetItem method
{$IF CompilerVersion >= 23}
  FGetItemMethod := Typ.GetIndexedProperty('Items').ReadMethod;
{$IFEND}
  if not Assigned(FGetItemMethod) then FGetItemMethod := Typ.GetMethod('GetItem');
  if not Assigned(FGetItemMethod) then FGetItemMethod := Typ.GetMethod('GetElement');
  if not Assigned(FGetItemMethod) then EioException.Create(Self.ClassName + ': "Items" property or "GetItem/GetElement" method not found in the object');
end;

procedure TioDuckTypedList.Delete(Index: Integer);
begin
  FClearMethod.Invoke(FDelete, [Index]);
end;

function TioDuckTypedList.GetEnumerator: IEnumerator;
begin
  Result := TioDuckTypedListEnumerator.Create(self);
end;

function TioDuckTypedList.GetItem(Index: Integer): TObject;
var
  AValue: TValue;
begin
  AValue := FGetItemMethod.Invoke(FListObject, [index]);
  case AValue.Kind of
    tkClass:
      Result := FGetItemMethod.Invoke(FListObject, [index]).AsObject;
    tkInterface:
      Result := FGetItemMethod.Invoke(FListObject, [index]).AsInterface as TObject;
  else
    raise Exception.Create('Invalid AValue.Kind');
  end;
end;

function TioDuckTypedList.GetItemTypeInfo: PTypeInfo;
begin
  Result := FGetItemMethod.ReturnType.Handle;
end;

function TioDuckTypedList.GetItemTypeName: String;
begin
  result := FGetItemMethod.ReturnType.ToString;
end;

function TioDuckTypedList.GetOwnsObjects: Boolean;
begin
  Result := False;
  if Assigned(FOwnsObjectsProperty) then
    Result := FOwnsObjectsProperty.GetValue(FListObject).AsBoolean;
end;

procedure TioDuckTypedList.SetOwnsObjects(AValue: Boolean);
begin
  if Assigned(FOwnsObjectsProperty) then
    FOwnsObjectsProperty.SetValue(FListObject, AValue);
end;

{ TioDuckTypedListEnumerator }

constructor TioDuckTypedListEnumerator.Create(ADuckTypedList: IioDuckTypedList);
begin
  inherited Create;
  FDuckTypedList := ADuckTypedList;
  FPosition := -1;
end;

function TioDuckTypedListEnumerator.GetCurrent: TObject;
begin
  if FPosition > -1 then
    Result := FDuckTypedList.GetItem(FPosition)
  else
    raise EioException.Create(Self.ClassName + ': Call MoveNext first');
end;

function TioDuckTypedListEnumerator.MoveNext: boolean;
begin
  if FPosition < FDuckTypedList.Count - 1 then
  begin
    Inc(FPosition);
    Result := True;
  end else Result := false;
end;

procedure TioDuckTypedListEnumerator.Reset;
begin
  // Nothing but necessary
end;

end.
