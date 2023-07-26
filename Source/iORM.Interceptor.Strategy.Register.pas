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
//  ******************************************************************************
//  * NOTE: {$DEFINE ioStrategyInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioStrategyInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioStrategyInterceptorsOff} to disable strategy interceptors *
//  ******************************************************************************
unit iORM.Interceptor.Strategy.Register;

interface

uses
  iORM.Interceptor.Strategy, iORM.Where.Interfaces,
  System.Generics.Collections;

type

  TioStrategyInterceptorList = TList<TioStrategyInterceptorRef>;

  TioStrategyInterceptorRegisterRef = class of TioStrategyInterceptorRegister;

  TioStrategyInterceptorRegister = class
  private
    class var FInternalContainer: TDictionary<String, TioStrategyInterceptorList>;
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
  iORM.Utilities, System.SysUtils;

{ TioStrategyInterceptorRegister }

class procedure TioStrategyInterceptorRegister.AfterDeleteList(const AList: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterDeleteList(AList);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterDeleteObject(const AObj: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterDeleteObject(AObj);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterLoadList(const AWhere: IioWhere; const AList: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AWhere.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterLoadList(AWhere, AList);
  end;
end;

class function TioStrategyInterceptorRegister.AfterLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  Result := AObj;
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AWhere.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        Result := LInterceptor.AfterLoadObject(AWhere, Result);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterPersistList(const AList: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterPersistList(AList);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterPersistObject(const AObj: TObject);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterPersistObject(AObj);
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeDeleteList(const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforeDeleteList(AList, LDone);
        if LDone then
          ADone := True;
      end;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeDeleteObject(const AObj: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforeDeleteObject(AObj, LDone);
        if LDone then
          ADone := True;
      end;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeLoadList(const AWhere: IioWhere; const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AWhere.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforeLoadList(AWhere, AList, LDone);
        if LDone then
          ADone := True;
      end;
    end;
  end;
end;

class function TioStrategyInterceptorRegister.BeforeLoadObject(const AWhere: IioWhere; const AObj: TObject; var ADone: Boolean): TObject;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  Result := AObj;
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AWhere.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        Result := LInterceptor.BeforeLoadObject(AWhere, Result, LDone);
        if LDone then
          ADone := True;
      end;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforePersistList(const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforePersistList(AList, LDone);
        if LDone then
          ADone := True;
      end;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforePersistObject(const AObj: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := AObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforePersistObject(AObj, LDone);
        if LDone then
          ADone := True;
      end;
    end;
  end;
end;

class procedure TioStrategyInterceptorRegister.Build;
begin
  FInternalContainer := TDictionary<String, TioStrategyInterceptorList>.Create;
end;

class procedure TioStrategyInterceptorRegister.Clean;
begin
  if Assigned(FInternalContainer) then
    FreeAndNil(FInternalContainer);
end;

class procedure TioStrategyInterceptorRegister.RegisterInterceptor(const ATypeName: String; const AStrategyInterceptor: TioStrategyInterceptorRef);
var
  LInterceptorList: TioStrategyInterceptorList;
  LInterceptorItem: TioStrategyInterceptorRef;
begin
  // If the internal container is not assigned then create it
  if not Assigned(FInternalContainer) then
    Build;
  // If the current type name isn't registered into the internal container (there isn't previously registerd interceptors for that type) then add it
  if not FInternalContainer.ContainsKey(ATypeName) then
  begin
    LInterceptorList := TioStrategyInterceptorList.Create;
    LInterceptorList.Capacity := 0;
    FInternalContainer.Add(ATypeName, LInterceptorList);
  end;
  // Extract the intercaptor list for the requested TypeName
  LInterceptorList := FInternalContainer.Items[ATypeName];
  // Check if an interceptor for the same class and connection name is already registered then exit to avoid duplicate
  for LInterceptorItem in LInterceptorList do
    if LInterceptorItem = AStrategyInterceptor then
      Exit;
  // Add the current interceptor to the array that contains interceptors for this type
  // Note: I know that this way there may be a reallocation of memory every time I add an element but the interceptors will be very few.
  LInterceptorList.Capacity := LInterceptorList.Capacity + 1;
  LInterceptorList.Add(AStrategyInterceptor);
end;

class procedure TioStrategyInterceptorRegister.UnregisterInterceptor(const ATypeName: String; const AStrategyInterceptor: TioStrategyInterceptorRef);
var
  I: Integer;
  LInterceptorList: TioStrategyInterceptorList;
begin
  // Only if the current type name is registered (the is almost one interceptor registered for this type)
  if not FInternalContainer.ContainsKey(ATypeName) then
    Exit;
  // Extract the interceptor list for the Type, loop for all the contained interceptors and delete the soecified one
  LInterceptorList := FInternalContainer.Items[ATypeName];
  for I := LInterceptorList.Count-1 downto 0 do
  begin
    if LInterceptorList[I] = AStrategyInterceptor then
    begin
      LInterceptorList.Delete(I);
      // If the interceptor array for this type is empty then remove also this type from the internal container
      if LInterceptorList.Count = 0 then
        FInternalContainer.Remove(ATypeName);
      // If the internal container is empty then free it
      if FInternalContainer.Count = 0 then
        Clean;
    end;
  end;
end;

initialization

finalization

TioStrategyInterceptorRegister.Clean;

end.
