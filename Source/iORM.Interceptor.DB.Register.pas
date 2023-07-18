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
unit iORM.Interceptor.DB.Register;

interface

uses
  iORM.Interceptor.DB, System.Generics.Collections,
  iORM.Context.Interfaces, iORM.DB.Interfaces;

type

  TDBInterceptorArray = TArray<TioDBInterceptorRef>;
  PDBInterceptorArray = ^TDBInterceptorArray;

  TiDBInterceptorRegisterRef = class of TioDBInterceptorRegister;

  TioDBInterceptorRegister = class
  private
    class var FInternalContainer: TDictionary<String, PDBInterceptorArray>;
    class procedure Build;
    class procedure Clean;
  public
    class procedure RegisterInterceptor(const ATypeName: String; const ADBInterceptor: TioDBInterceptorRef);
    class procedure UnregisterInterceptor(const ATypeName: String; const ADBInterceptor: TioDBInterceptorRef);
    // Obj load
    class procedure BeforeLoad(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterCreate(const AContext: IioContext; const AQuery: IioQuery);
    // Obj insert
    class procedure BeforeInsert(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterInsert(const AContext: IioContext; const AQuery: IioQuery);
    // Obj update
    class procedure BeforeUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterUpdate(const AContext: IioContext; const AQuery: IioQuery);
    // Obj delete
    class procedure BeforeDelete(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterDelete(const AContext: IioContext; const AQuery: IioQuery);
  end;


implementation

uses
  System.SysUtils;

{ TioObjCrudInterceptorRegister }

class procedure TioDBInterceptorRegister.AfterCreate(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterLoad(AContext, AQuery);
end;

class procedure TioDBInterceptorRegister.AfterDelete(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterDelete(AContext, AQuery);
end;

class procedure TioDBInterceptorRegister.AfterInsert(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterInsert(AContext, AQuery);
end;

class procedure TioDBInterceptorRegister.AfterUpdate(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterUpdate(AContext, AQuery);
end;

class procedure TioDBInterceptorRegister.BeforeLoad(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeLoad(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioDBInterceptorRegister.BeforeDelete(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeDelete(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioDBInterceptorRegister.BeforeInsert(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeInsert(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioDBInterceptorRegister.BeforeUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioDBInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeUpdate(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioDBInterceptorRegister.Build;
begin
  FInternalContainer := TDictionary<String, PDBInterceptorArray>.Create;
end;

class procedure TioDBInterceptorRegister.Clean;
begin
  if Assigned(FInternalContainer) then
    FreeAndNil(FInternalContainer);
end;

class procedure TioDBInterceptorRegister.RegisterInterceptor(const ATypeName: String; const ADBInterceptor: TioDBInterceptorRef);
var
  LInterceptorArray: TDBInterceptorArray;
  LInterceptorArrayPointer: PDBInterceptorArray;
  LNewInterceptorIndex: Byte;
begin
  // If the internal container is not assigned then create it
  if not Assigned(FInternalContainer) then
    Build;
  // If the current type name isn't registered into the internal container (there isn't previously registerd interceptors for that type) then add it
  if not FInternalContainer.ContainsKey(ATypeName) then
    FInternalContainer.Add(ATypeName, @LInterceptorArray); // Add an empty interceptor array
  // Add the current interceptor to the array that contains interceptors for this type
  // Note: I know that this way there may be a reallocation of memory every time I add an element but the interceptors will be very few.
  LInterceptorArrayPointer := FInternalContainer.Items[ATypeName];
  LInterceptorArray := LInterceptorArrayPointer^;
  LNewInterceptorIndex := Length(LInterceptorArray);
  SetLength(LInterceptorArray, LNewInterceptorIndex + 1);
  LInterceptorArray[LNewInterceptorIndex] := ADBInterceptor;
end;

class procedure TioDBInterceptorRegister.UnregisterInterceptor(const ATypeName: String; const ADBInterceptor: TioDBInterceptorRef);
var
  I: Integer;
  LInterceptorArray: TDBInterceptorArray;
  LInterceptorArrayPointer: PDBInterceptorArray;
begin
  // Only if the current type name is registered (the is almost one interceptor registered for this type)
  if FInternalContainer.ContainsKey(ATypeName) then
  begin
    // Remove the interceptor
    LInterceptorArrayPointer := FInternalContainer.Items[ATypeName];
    LInterceptorArray := LInterceptorArrayPointer^;
    for I := High(LInterceptorArray) downto Low(LInterceptorArray) do
      if LInterceptorArray[I] = ADBInterceptor then
        Delete(LInterceptorArray, I, 1);
    // If the interceptor array for this type is empty then remove also this type from the internal container
    if Length(LInterceptorArray) = 0 then
      FInternalContainer.Remove(ATypeName);
    // If the internal container is empty then free it
    if FInternalContainer.Count = 0 then
      Clean;
  end;
end;

initialization

finalization

TioDBInterceptorRegister.Clean;

end.
