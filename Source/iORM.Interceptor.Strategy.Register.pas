{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.Interceptor.Strategy.Register;

interface

uses
  iORM.Interceptor.Strategy, iORM.Where.Interfaces,
  System.Generics.Collections;

type

  TStrategyInterceptorArray = TArray<TioStrategyInterceptorRef>;
  PStrategyInterceptorArray = ^TStrategyInterceptorArray;

  TioStrategyInterceptorRegisterRef = class of TioStrategyInterceptorRegister;

  TioStrategyInterceptorRegister = class
  private
    class var FEnabled: Boolean;
    class var FInternalContainer: TDictionary<String, PStrategyInterceptorArray>;
    class procedure Build;
    class procedure Clean;
  public
    class procedure RegisterInterceptor(const ATypeName: String; const AStrategyInterceptor: TioStrategyInterceptorRef);
    class procedure UnregisterInterceptor(const ATypeName: String; const AStrategyInterceptor: TioStrategyInterceptorRef);
    // LoadObject
    class function BeforeLoadObject(const AWhere: IioWhere; const AObj: TObject; var ADone: Boolean): TObject;
    class function AfterLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject; virtual;
    // LoadList
    class procedure BeforeLoadList(const AWhere: IioWhere; const AList: TObject; var ADone: Boolean);
    class procedure AfterLoadList(const AWhere: IioWhere; const AList: TObject);
    // PersistObject
    class procedure BeforePersistObject(const AObj: TObject; var ADone: Boolean);
    class procedure AfterPersistObject(const AObj: TObject);
    // PersistList
    class procedure BeforePersistList(const AList: TObject; var ADone: Boolean);
    class procedure AfterPersistList(const AList: TObject);
    // DeleteObject
    class procedure BeforeDeleteObject(const AObj: TObject; var ADone: Boolean);
    class procedure AfterDeleteObject(const AObj: TObject);
    // DeleteList
    class procedure BeforeDeleteList(const AList: TObject; var ADone: Boolean);
    class procedure AfterDeleteList(const AList: TObject);
  end;

implementation

uses
  iORM.Utilities;

{ TioStrategyInterceptorRegister }

class procedure TioStrategyInterceptorRegister.AfterDeleteList(const AList: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName]^ do
        LInterceptor.AfterDeleteList(AList);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterDeleteObject(const AObj: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName]^ do
        LInterceptor.AfterDeleteObject(AObj);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterLoadList(const AWhere: IioWhere; const AList: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AWhere.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName]^ do
        LInterceptor.AfterLoadList(AWhere, AList);
  end;
end;

class function TioStrategyInterceptorRegister.AfterLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AWhere.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName]^ do
        LInterceptor.AfterLoadObject(AWhere, AObj);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterPersistList(const AList: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName]^ do
        LInterceptor.AfterPersistList(AList);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterPersistObject(const AObj: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName]^ do
        LInterceptor.AfterPersistObject(AObj);
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeDeleteList(const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    for LInterceptor in FInternalContainer.Items[LTypeName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeDeleteList(AList, LDone);
      if LDone then
        ADone := True;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeDeleteObject(const AObj: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AObj.ClassName;
    for LInterceptor in FInternalContainer.Items[LTypeName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeDeleteObject(AObj, LDone);
      if LDone then
        ADone := True;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeLoadList(const AWhere: IioWhere; const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AWhere.TypeName;
    for LInterceptor in FInternalContainer.Items[LTypeName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeLoadList(AWhere, AList, LDone);
      if LDone then
        ADone := True;
    end;
  end;
end;

class function TioStrategyInterceptorRegister.BeforeLoadObject(const AWhere: IioWhere; const AObj: TObject; var ADone: Boolean): TObject;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AWhere.TypeName;
    for LInterceptor in FInternalContainer.Items[LTypeName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeLoadObject(AWhere, AObj, LDone);
      if LDone then
        ADone := True;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforePersistList(const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    for LInterceptor in FInternalContainer.Items[LTypeName]^ do
    begin
      LDone := False;
      LInterceptor.BeforePersistList(AList, LDone);
      if LDone then
        ADone := True;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforePersistObject(const AObj: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if FEnabled then
  begin
    LTypeName := AObj.ClassName;
    for LInterceptor in FInternalContainer.Items[LTypeName]^ do
    begin
      LDone := False;
      LInterceptor.BeforePersistObject(AObj, LDone);
      if LDone then
        ADone := True;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.Build;
begin
  FInternalContainer := TDictionary<String, PStrategyInterceptorArray>.Create;
end;

class procedure TioStrategyInterceptorRegister.Clean;
begin
  FInternalContainer.Free;
end;

class procedure TioStrategyInterceptorRegister.RegisterInterceptor(const ATypeName: String; const AStrategyInterceptor: TioStrategyInterceptorRef);
var
  LInterceptorArray: TStrategyInterceptorArray;
  LInterceptorArrayPointer: PStrategyInterceptorArray;
  LNewInterceptorIndex: Byte;
begin
  // If the current type name isn't registered into the internal container (there isn't previously registerd interceptors for that type) then add it
  if not FInternalContainer.ContainsKey(ATypeName) then
    FInternalContainer.Add(ATypeName, @LInterceptorArray); // Add an empty interceptor array
  // Add the current interceptor to the array that contains interceptors for this type
  // Note: I know that this way there may be a reallocation of memory every time I add an element but the interceptors will be very few.
  LInterceptorArrayPointer := FInternalContainer.Items[ATypeName];
  LInterceptorArray := LInterceptorArrayPointer^;
  LNewInterceptorIndex := Length(LInterceptorArray);
  SetLength(LInterceptorArray, LNewInterceptorIndex + 1);
  LInterceptorArray[LNewInterceptorIndex] := AStrategyInterceptor;
  // Se the enabled flag
  FEnabled := FInternalContainer.Count > 1;
end;

class procedure TioStrategyInterceptorRegister.UnregisterInterceptor(const ATypeName: String; const AStrategyInterceptor: TioStrategyInterceptorRef);
var
  I: Integer;
  LInterceptorArray: TStrategyInterceptorArray;
  LInterceptorArrayPointer: PStrategyInterceptorArray;
begin
  if FInternalContainer.ContainsKey(ATypeName) then
  begin
    LInterceptorArrayPointer := FInternalContainer.Items[ATypeName];
    LInterceptorArray := LInterceptorArrayPointer^;
    for I := High(LInterceptorArray) downto Low(LInterceptorArray) do
      if LInterceptorArray[I] = AStrategyInterceptor then
        Delete(LInterceptorArray, I, 1);
  end;
end;

initialization

TioStrategyInterceptorRegister.Build;

finalization

TioStrategyInterceptorRegister.Clean;

end.
