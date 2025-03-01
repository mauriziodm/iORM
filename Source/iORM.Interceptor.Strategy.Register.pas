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
  iORM.Interceptor.Strategy, iORM.PersistenceStrategy.Interfaces,
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
    // note: Result = True is like ADone := True
    class function BeforeLoadObject(const APSRequest: IioPersistenceStrategyRequest): Boolean;
    class procedure AfterLoadObject(const APSRequest: IioPersistenceStrategyRequest);
    // LoadList
    // note: Result = True is like ADone := True
    class function BeforeLoadList(const APSRequest: IioPersistenceStrategyRequest): Boolean;
    class procedure AfterLoadList(const APSRequest: IioPersistenceStrategyRequest);
    // PersistObject
    // note: Result = True is like ADone := True
    class function BeforePersistObject(const APSRequest: IioPersistenceStrategyRequest): Boolean;
    class procedure AfterPersistObject(const APSRequest: IioPersistenceStrategyRequest);
    // PersistList
    // note: Result = True is like ADone := True
    class function BeforePersistList(const APSRequest: IioPersistenceStrategyRequest): Boolean;
    class procedure AfterPersistList(const APSRequest: IioPersistenceStrategyRequest);
    // DeleteObject
    // note: Result = True is like ADone := True
    class function BeforeDeleteObject(const APSRequest: IioPersistenceStrategyRequest): Boolean;
    class procedure AfterDeleteObject(const APSRequest: IioPersistenceStrategyRequest);
    // DeleteList
    // note: Result = True is like ADone := True
    class function BeforeDeleteList(const APSRequest: IioPersistenceStrategyRequest): Boolean;
    class procedure AfterDeleteList(const APSRequest: IioPersistenceStrategyRequest);
  end;

implementation

uses
  iORM.Utilities, System.SysUtils;

{ TioStrategyInterceptorRegister }

class procedure TioStrategyInterceptorRegister.AfterDeleteList(const APSRequest: IioPersistenceStrategyRequest);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(APSRequest.DataObj).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterDeleteList(APSRequest);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterDeleteObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.DataObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterDeleteObject(APSRequest);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterLoadList(const APSRequest: IioPersistenceStrategyRequest);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.Where.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterLoadList(APSRequest);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterLoadObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.Where.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterLoadObject(APSRequest);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterPersistList(const APSRequest: IioPersistenceStrategyRequest);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(APSRequest.DataObj).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterPersistList(APSRequest);
  end;
end;

class procedure TioStrategyInterceptorRegister.AfterPersistObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.DataObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
      for LInterceptor in FInternalContainer.Items[LTypeName] do
        LInterceptor.AfterPersistObject(APSRequest);
  end;
end;

class function TioStrategyInterceptorRegister.BeforeDeleteList(const APSRequest: IioPersistenceStrategyRequest): Boolean;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(APSRequest.DataObj).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforeDeleteList(APSRequest, LDone);
        if LDone then
          Exit(True);
//          Result := True; <--- OLD CODE (se ADone = true esegue comunque tutti i before di tutti gli eventuali interceptors
      end;
    end;
  end;
end;

class function TioStrategyInterceptorRegister.BeforeDeleteObject(const APSRequest: IioPersistenceStrategyRequest): Boolean;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.DataObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforeDeleteObject(APSRequest, LDone);
        if LDone then
          Exit(True);
//          Result := True; <--- OLD CODE (se ADone = true esegue comunque tutti i before di tutti gli eventuali interceptors
      end;
    end;
  end;
end;

class function TioStrategyInterceptorRegister.BeforeLoadList(const APSRequest: IioPersistenceStrategyRequest): Boolean;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.Where.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforeLoadList(APSRequest, LDone);
        if LDone then
          Exit(True);
//          Result := True; <--- OLD CODE (se ADone = true esegue comunque tutti i before di tutti gli eventuali interceptors
      end;
    end;
  end;
end;

class function TioStrategyInterceptorRegister.BeforeLoadObject(const APSRequest: IioPersistenceStrategyRequest): Boolean;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.Where.TypeName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforeLoadObject(APSRequest, LDone);
        if LDone then
          Exit(True);
//          Result := True; <--- OLD CODE (se ADone = true esegue comunque tutti i before di tutti gli eventuali interceptors
      end;
    end;
  end;
end;

class function TioStrategyInterceptorRegister.BeforePersistList(const APSRequest: IioPersistenceStrategyRequest): Boolean;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := TioUtilities.ExtractItemRttiTypeFromList(APSRequest.DataObj).Name;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforePersistList(APSRequest, LDone);
        if LDone then
          Exit(True);
//          Result := True; <--- OLD CODE (se ADone = true esegue comunque tutti i before di tutti gli eventuali interceptors
      end;
    end;
  end;
end;

class function TioStrategyInterceptorRegister.BeforePersistObject(const APSRequest: IioPersistenceStrategyRequest): Boolean;
var
  LDone: Boolean;
  LTypeName: String;
  LInterceptor: TioStrategyInterceptorRef;
begin
  if Assigned(FInternalContainer) then
  begin
    LTypeName := APSRequest.DataObj.ClassName;
    if FInternalContainer.ContainsKey(LTypeName) then
    begin
      for LInterceptor in FInternalContainer.Items[LTypeName] do
      begin
        LDone := False;
        LInterceptor.BeforePersistObject(APSRequest, LDone);
        if LDone then
          Exit(True);
//          Result := True; <--- OLD CODE (se ADone = true esegue comunque tutti i before di tutti gli eventuali interceptors
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
