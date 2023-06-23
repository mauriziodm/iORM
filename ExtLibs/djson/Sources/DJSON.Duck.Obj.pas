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
unit DJSON.Duck.Obj;

interface

uses
  DJSON.Duck.Interfaces, System.Rtti, System.Classes;

type

  TdjDuckStreamable = class(TInterfacedObject, IdjDuckStreamable)
  strict protected
    FObjAsDuck: TObject;
    FLoadFromStreamMethod: TRttiMethod;
    FSaveToStreamMethod: TRttiMethod;
    FIsEmptyMethod: TRttiMethod;
    FCountProperty: TRttiProperty;
    FSizeProperty: TRttiProperty;
  public
    class function TryCreate(const AObjAsDuck:TObject): IdjDuckStreamable;
    constructor Create(const AObjAsDuck:TObject; const ALoadFromStreamMethod,ASaveToStreamMethod,AIsEmptyMethod:TRTTIMethod; const ACountProperty, ASizeProperty:TRTTIProperty);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToStream(AStream: TStream);
    procedure SetObject(const AObj:TObject);
    function IsEmpty: Boolean;
    function DuckObjQualifiedName: String;
  end;

implementation

uses
  DJSON.Utils.RTTI;

{ TdjDuckStreamable }

constructor TdjDuckStreamable.Create(const AObjAsDuck:TObject; const ALoadFromStreamMethod,ASaveToStreamMethod,AIsEmptyMethod:TRTTIMethod; const ACountProperty, ASizeProperty:TRTTIProperty);
begin
  inherited Create;
  FObjAsDuck := AObjAsDuck;
  FLoadFromStreamMethod := ALoadFromStreamMethod;
  FSaveToStreamMethod := ASaveToStreamMethod;
  FIsEmptyMethod := AIsEmptyMethod;
  FCountProperty := ACountProperty;
  FSizeProperty := ASizeProperty;
end;

function TdjDuckStreamable.DuckObjQualifiedName: String;
begin
  Result := FObjAsDuck.QualifiedClassName;
end;

function TdjDuckStreamable.IsEmpty: Boolean;
begin
  if Assigned(FIsEmptyMethod) then
    Result := FIsEmptyMethod.Invoke(FObjAsDuck, []).AsBoolean
  else
  if Assigned(FCountProperty) then
    Result := (FCountProperty.GetValue(FObjAsDuck).AsInteger = 0)
  else
  if Assigned(FSizeProperty) then
    Result := (FSizeProperty.GetValue(FObjAsDuck).AsInteger = 0)
  else Result := False;
end;

procedure TdjDuckStreamable.LoadFromStream(AStream: TStream);
begin
  if AStream.Size <> 0 then
    FLoadFromStreamMethod.Invoke(FObjAsDuck, [AStream]);
end;

procedure TdjDuckStreamable.SaveToStream(AStream: TStream);
begin
  if not IsEmpty then
    FSaveToStreamMethod.Invoke(FObjAsDuck, [AStream]);
end;

procedure TdjDuckStreamable.SetObject(const AObj: TObject);
begin
  FObjAsDuck := AObj;
end;

class function TdjDuckStreamable.TryCreate(
  const AObjAsDuck: TObject): IdjDuckStreamable;
var
  LType: TRttiType;
  LLoadFromStreamMethod: TRttiMethod;
  LSaveToStreamMethod: TRttiMethod;
  LIsEmptyMethod: TRttiMethod;
  LCountProperty: TRttiProperty;
  LSizeProperty: TRttiProperty;
begin
  // Check received object
  if not Assigned(AObjAsDuck) then Exit(nil);
  // Init Rtti
  LType := TdjRTTI.Ctx.GetType(AObjAsDuck.ClassInfo);
  if not Assigned(LType) then Exit(nil);
  // LoadFromStream method
  LLoadFromStreamMethod := LType.GetMethod('LoadFromStream');
  if not Assigned(LLoadFromStreamMethod) then Exit(nil);
  // SaveToStream method
  LSaveToStreamMethod := LType.GetMethod('SaveToStream');
  if not Assigned(LSaveToStreamMethod) then Exit(nil);
  // IsEmpty method
  LIsEmptyMethod := LType.GetMethod('IsEmpty');
  if not Assigned(LIsEmptyMethod) then
    LIsEmptyMethod := LType.GetMethod('Empty');
  // Count Property
  LCountProperty := LType.GetProperty('Count');
  // Size Property
  LSizeProperty := LType.GetProperty('Size');
  // If everithing is OK then create the Duck
  Result := Self.Create(AObjAsDuck, LLoadFromStreamMethod, LSaveToStreamMethod, LIsEmptyMethod, LCountProperty, LSizeProperty);
end;

end.
