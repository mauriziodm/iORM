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
//  **************************************************************************
//  * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
//  **************************************************************************
unit iORM.Interceptor.CRUD.Register;

interface

uses
  iORM.Interceptor.CRUD, System.Generics.Collections,
  iORM.Context.Interfaces, iORM.DB.Interfaces;

type

  TCRUDInterceptorArray = TArray<TioCRUDInterceptorRef>;
  PCRUDInterceptorArray = ^TCRUDInterceptorArray;

  TioCRUDInterceptorRegisterRef = class of TioCRUDInterceptorRegister;

  TioCRUDInterceptorRegister = class
  private
    class var FInternalContainer: TDictionary<String, PCRUDInterceptorArray>;
    class procedure Build;
    class procedure Clean;
  public
    class procedure RegisterInterceptor(const ATypeName: String; const ACRUDInterceptor: TioCRUDInterceptorRef);
    class procedure UnregisterInterceptor(const ATypeName: String; const ACRUDInterceptor: TioCRUDInterceptorRef);
    // Obj load
    class function BeforeLoad(const AContext: IioContext; const AObj: TObject; const AQuery: IioQuery; var ADone: Boolean): TObject;
    class function AfterLoad(const AContext: IioContext; const AObj: TObject; const AQuery: IioQuery): TObject;
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

class function TioCRUDInterceptorRegister.AfterLoad(const AContext: IioContext; const AObj: TObject; const AQuery: IioQuery): TObject;
var
  LInterceptor: TioCRUDInterceptorRef;
begin
  Result := AObj;
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      Result := LInterceptor.AfterLoad(AContext, AObj, AQuery);
end;

class procedure TioCRUDInterceptorRegister.AfterDelete(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioCRUDInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterDelete(AContext, AQuery);
end;

class procedure TioCRUDInterceptorRegister.AfterInsert(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioCRUDInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterInsert(AContext, AQuery);
end;

class procedure TioCRUDInterceptorRegister.AfterUpdate(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioCRUDInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterUpdate(AContext, AQuery);
end;

class function TioCRUDInterceptorRegister.BeforeLoad(const AContext: IioContext; const AObj: TObject; const AQuery: IioQuery; var ADone: Boolean): TObject;
var
  LDone: Boolean;
  LInterceptor: TioCRUDInterceptorRef;
begin
  Result := AObj;
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      Result := LInterceptor.BeforeLoad(AContext, AObj, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioCRUDInterceptorRegister.BeforeDelete(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioCRUDInterceptorRef;
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

class procedure TioCRUDInterceptorRegister.BeforeInsert(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioCRUDInterceptorRef;
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

class procedure TioCRUDInterceptorRegister.BeforeUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioCRUDInterceptorRef;
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

class procedure TioCRUDInterceptorRegister.Build;
begin
  FInternalContainer := TDictionary<String, PCRUDInterceptorArray>.Create;
end;

class procedure TioCRUDInterceptorRegister.Clean;
begin
  if Assigned(FInternalContainer) then
    FreeAndNil(FInternalContainer);
end;

class procedure TioCRUDInterceptorRegister.RegisterInterceptor(const ATypeName: String; const ACRUDInterceptor: TioCRUDInterceptorRef);
var
  LInterceptorArray: TCRUDInterceptorArray;
  LInterceptorArrayPointer: PCRUDInterceptorArray;
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
  LInterceptorArray[LNewInterceptorIndex] := ACRUDInterceptor;
end;

class procedure TioCRUDInterceptorRegister.UnregisterInterceptor(const ATypeName: String; const ACRUDInterceptor: TioCRUDInterceptorRef);
var
  I: Integer;
  LInterceptorArray: TCRUDInterceptorArray;
  LInterceptorArrayPointer: PCRUDInterceptorArray;
begin
  // Only if the current type name is registered (the is almost one interceptor registered for this type)
  if FInternalContainer.ContainsKey(ATypeName) then
  begin
    // Remove the interceptor
    LInterceptorArrayPointer := FInternalContainer.Items[ATypeName];
    LInterceptorArray := LInterceptorArrayPointer^;
    for I := High(LInterceptorArray) downto Low(LInterceptorArray) do
      if LInterceptorArray[I] = ACRUDInterceptor then
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

TioCRUDInterceptorRegister.Clean;

end.
