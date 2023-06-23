{
  ****************************************************************************
  *                                                                          *
  *           DJSON - (Delphi JSON library)                                  *
  *                                                                          *
  *           Copyright (C) 2016-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/DSON.git                         *
  *                                                                          *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of DJSON (Delphi JSON library).                        *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  * you may not use this file except in compliance with the License.         *
  *                                                                          *
  * DJSON is free software: you can redistribute it and/or modify            *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * DJSON is distributed in the hope that it will be useful,                 *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with DJSON.  If not, see <http://www.gnu.org/licenses/>.           *
  *                                                                          *
  ****************************************************************************
}
unit DJSON.Duck.Dictionary;

interface

uses
  System.Rtti, DJSON.Duck.Interfaces, System.TypInfo;

type

  TdjDuckDictionaryEnumerator = class
  strict private
    FObjectAsDuck: TObject;
    FMoveNextMethod: TRttiMethod;
    FCurrentProperty: TRttiProperty;
  public
    constructor Create(AObjectAsDuck: TObject);
    destructor Destroy; override;
    function Current: TValue;
    function MoveNext: Boolean;
  end;

  TdjDuckDictionary = class(TInterfacedObject, IdjDuckDictionary)
  strict private
    FObjAsDuck: TObject;
    FAddMethod: TRttiMethod;
    FKeysProperty: TRttiProperty;
    FValuesProperty: TRttiProperty;
    FCountProperty: TRttiProperty;
    FKeysEnumerator: TdjDuckDictionaryEnumerator;
    FValuesEnumerator: TdjDuckDictionaryEnumerator;
    procedure ExtractEnumerator;
    procedure FreeEnumerator;
  public
    class function TryCreate(const AObjAsDuck: TObject): IdjDuckDictionary;
    constructor Create(AObjAsDuck: TObject; const AKeysProperty, AValuesProperty, ACountProperty: TRttiProperty; const AAddMethod: TRttiMethod;
      const AKeysEnumerator, AValuesEnumerator: TdjDuckDictionaryEnumerator);
    destructor Destroy; override;
    procedure Add(const AKey, AValue: TValue);
    procedure SetObject(const AObj: TObject);
    function GetCurrentKey: TValue;
    function GetCurrentValue: TValue;
    function MoveNext: Boolean;
    function Count: Integer;
    function DuckObjQualifiedName: String;
    function GetKeyTypeInfo: PTypeInfo;
    function GetKeyTypeName: String;
    function GetKeyQualifiedTypeName: String;
    function GetValueTypeInfo: PTypeInfo;
    function GetValueTypeName: String;
    function GetValueQualifiedTypeName: String;
  end;

implementation

uses
  DJSON.Utils.Rtti, DJSON.Exceptions;

{ TdjDuckDictionary }

procedure TdjDuckDictionary.Add(const AKey, AValue: TValue);
begin
  FAddMethod.Invoke(FObjAsDuck, [AKey, AValue]);
end;

function TdjDuckDictionary.Count: Integer;
begin
  Result := FCountProperty.GetValue(FObjAsDuck).AsInteger;
end;

constructor TdjDuckDictionary.Create(AObjAsDuck: TObject; const AKeysProperty, AValuesProperty, ACountProperty: TRttiProperty; const AAddMethod: TRttiMethod;
  const AKeysEnumerator, AValuesEnumerator: TdjDuckDictionaryEnumerator);
begin
  inherited Create;
  FObjAsDuck := AObjAsDuck;
  FKeysProperty := AKeysProperty;
  FValuesProperty := AValuesProperty;
  FCountProperty := ACountProperty;
  FAddMethod := AAddMethod;
  FKeysEnumerator := AKeysEnumerator;
  FValuesEnumerator := AValuesEnumerator;
end;

destructor TdjDuckDictionary.Destroy;
begin
  FreeEnumerator;
  inherited;
end;

function TdjDuckDictionary.DuckObjQualifiedName: String;
begin
  Result := FObjAsDuck.QualifiedClassName;
end;

procedure TdjDuckDictionary.ExtractEnumerator;
var
  LObj: TObject;
begin
  // Keys enumerator
  LObj := FKeysProperty.GetValue(FObjAsDuck).AsObject;
  LObj := TdjRTTI.Ctx.GetType(LObj.ClassInfo).GetMethod('GetEnumerator').Invoke(LObj, []).AsObject;
  FKeysEnumerator := TdjDuckDictionaryEnumerator.Create(LObj);
  // Values enumerator
  LObj := FValuesProperty.GetValue(FObjAsDuck).AsObject;
  LObj := TdjRTTI.Ctx.GetType(LObj.ClassInfo).GetMethod('GetEnumerator').Invoke(LObj, []).AsObject;
  FValuesEnumerator := TdjDuckDictionaryEnumerator.Create(LObj);
end;

procedure TdjDuckDictionary.FreeEnumerator;
begin
  if assigned(FKeysEnumerator) then
    FKeysEnumerator.Free;
  if assigned(FValuesEnumerator) then
    FValuesEnumerator.Free;
end;

function TdjDuckDictionary.GetCurrentKey: TValue;
begin
  Result := FKeysEnumerator.Current;
end;

function TdjDuckDictionary.GetCurrentValue: TValue;
begin
  Result := FValuesEnumerator.Current;
end;

function TdjDuckDictionary.GetKeyQualifiedTypeName: String;
begin
  Result := TdjRTTI.TypeInfoToQualifiedTypeName(Self.GetKeyTypeInfo);
end;

function TdjDuckDictionary.GetKeyTypeInfo: PTypeInfo;
begin
  // Get the parameters array of the "Add" method
  // NB: The "Add" method of a TDictionary has 2 parameters,
  // The first parameter (Index=0) is the "Key" parameters
  // The second parameter (Index=1) is the "Value" parameters
  Result := FAddMethod.GetParameters[0].ParamType.Handle;
end;

function TdjDuckDictionary.GetKeyTypeName: String;
begin
  Result := TdjRTTI.TypeInfoToTypeName(Self.GetKeyTypeInfo, False);
end;

function TdjDuckDictionary.GetValueQualifiedTypeName: String;
begin
  Result := TdjRTTI.TypeInfoToQualifiedTypeName(Self.GetValueTypeInfo);
end;

function TdjDuckDictionary.GetValueTypeInfo: PTypeInfo;
begin
  // Get the parameters array of the "Add" method
  // NB: The "Add" method of a TDictionary has 2 parameters,
  // The first parameter (Index=0) is the "Key" parameters
  // The second parameter (Index=1) is the "Value" parameters
  Result := FAddMethod.GetParameters[1].ParamType.Handle;
end;

function TdjDuckDictionary.GetValueTypeName: String;
begin
  Result := TdjRTTI.TypeInfoToTypeName(Self.GetValueTypeInfo, False);
end;

function TdjDuckDictionary.MoveNext: Boolean;
begin
  Result := (FKeysEnumerator.MoveNext and FValuesEnumerator.MoveNext);
end;

procedure TdjDuckDictionary.SetObject(const AObj: TObject);
begin
  FreeEnumerator;
  FObjAsDuck := AObj;
  ExtractEnumerator;
end;

class function TdjDuckDictionary.TryCreate(const AObjAsDuck: TObject): IdjDuckDictionary;
var
  LType: TRttiType;
  LKeysProperty: TRttiProperty;
  LValuesProperty: TRttiProperty;
  LCountProperty: TRttiProperty;
  LAddMethod: TRttiMethod;
  LKeysEnumerator: TdjDuckDictionaryEnumerator;
  LValuesEnumerator: TdjDuckDictionaryEnumerator;
  LObj: TObject;
begin
  // Check received object
  if not assigned(AObjAsDuck) then
    Exit(nil);
  // Init Rtti
  LType := TdjRTTI.Ctx.GetType(AObjAsDuck.ClassInfo);
  if not assigned(LType) then
    Exit(nil);
  // Keys Property
  LKeysProperty := LType.GetProperty('Keys');
  if not assigned(LKeysProperty) then
    Exit(nil);
  // Values Property
  LValuesProperty := LType.GetProperty('Values');
  if not assigned(LValuesProperty) then
    Exit(nil);
  // Keys Property
  LCountProperty := LType.GetProperty('Count');
  if not assigned(LCountProperty) then
    Exit(nil);
  // Add method
  LAddMethod := LType.GetMethod('Add');
  if not assigned(LAddMethod) then
    Exit(nil);
  // Keys enumerator
  LObj := LKeysProperty.GetValue(AObjAsDuck).AsObject;
  LObj := TdjRTTI.Ctx.GetType(LObj.ClassInfo).GetMethod('GetEnumerator').Invoke(LObj, []).AsObject;
  LKeysEnumerator := TdjDuckDictionaryEnumerator.Create(LObj);
  // Values enumerator
  LObj := LValuesProperty.GetValue(AObjAsDuck).AsObject;
  LObj := TdjRTTI.Ctx.GetType(LObj.ClassInfo).GetMethod('GetEnumerator').Invoke(LObj, []).AsObject;
  LValuesEnumerator := TdjDuckDictionaryEnumerator.Create(LObj);
  // If everithing is OK then create the Duck
  Result := Self.Create(AObjAsDuck, LKeysProperty, LValuesProperty, LCountProperty, LAddMethod, LKeysEnumerator, LValuesEnumerator);
end;

{ TdjDuckDictionaryEnumerator }

constructor TdjDuckDictionaryEnumerator.Create(AObjectAsDuck: TObject);
begin
  inherited Create;
  FObjectAsDuck := AObjectAsDuck;
  // GetCurrent method
  FCurrentProperty := TdjRTTI.Ctx.GetType(AObjectAsDuck.ClassInfo).GetProperty('Current');
  if not assigned(FCurrentProperty) then
    raise EdsonDuckException.Create('Cannot find property "Current" in the duck object');
  // MoveNext method
  FMoveNextMethod := TdjRTTI.Ctx.GetType(AObjectAsDuck.ClassInfo).GetMethod('MoveNext');
  if not assigned(FMoveNextMethod) then
    raise EdsonDuckException.Create('Cannot find method "MoveNext" in the duck object');
end;

function TdjDuckDictionaryEnumerator.Current: TValue;
begin
  Result := FCurrentProperty.GetValue(FObjectAsDuck);
end;

destructor TdjDuckDictionaryEnumerator.Destroy;
begin
  FObjectAsDuck.Free;
  inherited;
end;

function TdjDuckDictionaryEnumerator.MoveNext: Boolean;
begin
  Result := FMoveNextMethod.Invoke(FObjectAsDuck, []).AsBoolean;
end;

end.
