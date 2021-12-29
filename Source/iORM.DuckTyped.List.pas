{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

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
    procedure SetOwnsObjects(AValue: Boolean);
    function GetOwnsObjects: Boolean;
  public
    class function TryGetHasManyRelationChildTypeName(const ARttiType: TRttiType): String;
    constructor Create(AListObject: TObject);
    procedure Add(AObject: TObject);
    procedure Clear;
    procedure Delete(Index: Integer);
    function Count: Integer;
    function GetItem(Index: Integer): TObject;
    function GetItemTypeName: String;
    function GetItemTypeInfo: PTypeInfo;
    function GetEnumerator: IEnumerator;
    property OwnsObjects: Boolean read GetOwnsObjects write SetOwnsObjects;
  end;

  // DuckTypedListEnumerator
  TioDuckTypedListEnumerator = class(TInterfacedObject, IEnumerator)
  strict protected
    FPosition: Integer;
    FDuckTypedList: IioDuckTypedList;
  public
    constructor Create(ADuckTypedList: IioDuckTypedList);
    procedure Reset;
    function MoveNext: Boolean;
    function GetCurrent: TObject;
    property Current: TObject read GetCurrent;
  end;

implementation

uses
  iORM.Exceptions, iORM.RttiContext.Factory, iORM.Utilities, iORM.Attributes;

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
  LRttiType: TRttiType;
  LItemsProperty: TRttiIndexedProperty;
begin
  inherited Create;
  FListObject := AListObject;
  // Init Rtti
  LRttiType := TioRttiFactory.GetRttiContext.GetType(AListObject.ClassInfo);
  // OwnsObjects Property (No exception if not exist)
  FOwnsObjectsProperty := nil;
  FOwnsObjectsProperty := LRttiType.GetProperty('OwnsObjects');
  // Count Property
  FCountProperty := LRttiType.GetProperty('Count');
  if not Assigned(FCountProperty) then
    raise EioException.Create('DuckTypedList: "Count" property not found in the object');
  // Add method
  FAddMethod := LRttiType.GetMethod('Add');
  if not Assigned(FAddMethod) then
    raise EioException.Create('DuckTypedList: "Add" method not found in the object');
  // Clear
  FClearMethod := LRttiType.GetMethod('Clear');
  if not Assigned(FClearMethod) then
    raise EioException.Create('DuckTypedList: "Clear" method not found in the object');
  // Delete
  FDelete := LRttiType.GetMethod('Delete');
  if not Assigned(FDelete) then
    raise EioException.Create('DuckTypedList: "Delete" method not found in the object');
  // GetItem method
  LItemsProperty := LRttiType.GetIndexedProperty('Items');
  if not Assigned(LItemsProperty) then
    raise EioException.Create('DuckTypedList: "Items" indexed property not found in the object');
  FGetItemMethod := LItemsProperty.ReadMethod;
  if not Assigned(FGetItemMethod) then
    raise EioException.Create(Self.ClassName + ': "GetItem" method not found in the object');
end;

procedure TioDuckTypedList.Delete(Index: Integer);
begin
  FClearMethod.Invoke(FDelete, [Index]);
end;

function TioDuckTypedList.GetEnumerator: IEnumerator;
begin
  Result := TioDuckTypedListEnumerator.Create(Self);
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
    Result := nil;
  end;
end;

function TioDuckTypedList.GetItemTypeInfo: PTypeInfo;
begin
  Result := FGetItemMethod.ReturnType.Handle;
end;

function TioDuckTypedList.GetItemTypeName: String;
begin
  Result := FGetItemMethod.ReturnType.ToString;
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

class function TioDuckTypedList.TryGetHasManyRelationChildTypeName(const ARttiType: TRttiType): String;
var
  LItemsProperty: TRttiIndexedProperty;
begin
  // Get Items indexed property
  LItemsProperty := ARttiType.GetIndexedProperty('Items');
  // Get the result
  // NB: In questo punto qualunque relazione con una interfaccia come child passa (poi viene controllata se relativa
  // ad una entità sarà più avanti
  if (LItemsProperty <> nil) and ((LItemsProperty.PropertyType.IsInstance and TioUtilities.HasAttribute<ioEntity>(LItemsProperty.PropertyType)) or
    (LItemsProperty.PropertyType is TRttiInterfaceType)) and (ARttiType.GetProperty('Count') <> nil) and (ARttiType.GetMethod('Add') <> nil) and
    (ARttiType.GetMethod('Clear') <> nil) and (ARttiType.GetMethod('Delete') <> nil) then
    Result := LItemsProperty.PropertyType.Name
  else
    Result := '';
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

function TioDuckTypedListEnumerator.MoveNext: Boolean;
begin
  if FPosition < FDuckTypedList.Count - 1 then
  begin
    Inc(FPosition);
    Result := True;
  end
  else
    Result := False;
end;

procedure TioDuckTypedListEnumerator.Reset;
begin
  // Nothing but necessary
end;

end.
