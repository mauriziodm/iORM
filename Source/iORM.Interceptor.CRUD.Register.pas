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
// **************************************************************************
// * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
// * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
// * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
// **************************************************************************
unit iORM.Interceptor.CRUD.Register;

interface

uses
  iORM.Interceptor.CRUD,
  iORM.Context.Interfaces, System.Generics.Collections, System.SysUtils;

type

  TioCRUDInterceptorItem = class
  private
    FInterceptor: TioCRUDInterceptorRef;
    FConnectionName: String;
  public
    constructor Create(const AInterceptor: TioCRUDInterceptorRef; const AConnectionName: String);
    property Interceptor: TioCRUDInterceptorRef read FInterceptor;
    property ConnectionName: String read FConnectionName;
  end;

  TioCRUDInterceptorList = TObjectList<TioCRUDInterceptorItem>;

  TioCRUDInterceptorRegisterRef = class of TioCRUDInterceptorRegister;

  TioCRUDInterceptorRegister = class
  private
    class procedure Build;
    class procedure Clean;
  public
    class var FInternalContainer: TObjectDictionary<String, TioCRUDInterceptorList>;
    class procedure RegisterInterceptor(const ACRUDInterceptor: TioCRUDInterceptorRef; const ATypeName: String; const AInterceptOnlyOnConnectionName: String = '');
    class procedure UnregisterInterceptor(const ACRUDInterceptor: TioCRUDInterceptorRef; const ATypeName: String; const AInterceptOnlyOnConnectionName: String = '');
    // Obj load
    class function BeforeLoad(const AContext: IioContext; const AObj: TObject; var ADone: Boolean): TObject;
    class function AfterLoad(const AContext: IioContext; const AObj: TObject): TObject;
    class function OnLoadException(const AContext: IioContext; const AException: Exception): Boolean;
    // Obj insert
    class procedure BeforeInsert(const AContext: IioContext; var ADone: Boolean);
    class procedure AfterInsert(const AContext: IioContext);
    class function OnInsertException(const AContext: IioContext; const AException: Exception): Boolean;
    // Obj update
    class procedure BeforeUpdate(const AContext: IioContext; var ADone: Boolean);
    class procedure AfterUpdate(const AContext: IioContext);
    class function OnUpdateException(const AContext: IioContext; const AException: Exception): Boolean;
    // Obj delete
    class procedure BeforeDelete(const AContext: IioContext; var ADone: Boolean);
    class procedure AfterDelete(const AContext: IioContext);
    class function OnDeleteException(const AContext: IioContext; const AException: Exception): Boolean;
  end;

implementation

{ TioObjCrudInterceptorRegister }

class procedure TioCRUDInterceptorRegister.RegisterInterceptor(const ACRUDInterceptor: TioCRUDInterceptorRef; const ATypeName: String;
  const AInterceptOnlyOnConnectionName: String = '');
var
  LInterceptorList: TioCRUDInterceptorList;
  LInterceptorItem: TioCRUDInterceptorItem;
begin
  // If the internal container is not assigned then create it
  if not Assigned(FInternalContainer) then
    Build;
  // If the current type name isn't registered into the internal container (there isn't previously registerd interceptors for that type) then add it
  if not FInternalContainer.ContainsKey(ATypeName) then
  begin
    LInterceptorList := TioCRUDInterceptorList.Create;
    LInterceptorList.Capacity := 0;
    FInternalContainer.Add(ATypeName, LInterceptorList);
  end;
  // Extract the intercaptor list for the requested TypeName
  LInterceptorList := FInternalContainer.Items[ATypeName];
  // Check if an interceptor for the same class and connection name is already registered then exit to avoid duplicate
  for LInterceptorItem in LInterceptorList do
    if (LInterceptorItem.Interceptor = ACRUDInterceptor) and (LInterceptorItem.ConnectionName = AInterceptOnlyOnConnectionName) then
      Exit;
  // Add the current interceptor to the array that contains interceptors for this type
  // Note: I know that this way there may be a reallocation of memory every time I add an element but the interceptors will be very few.
  LInterceptorItem := TioCRUDInterceptorItem.Create(ACRUDInterceptor, AInterceptOnlyOnConnectionName);
  LInterceptorList.Capacity := LInterceptorList.Capacity + 1;
  LInterceptorList.Add(LInterceptorItem);
end;

class procedure TioCRUDInterceptorRegister.UnregisterInterceptor(const ACRUDInterceptor: TioCRUDInterceptorRef; const ATypeName: String;
  const AInterceptOnlyOnConnectionName: String = '');
var
  I: Integer;
  LInterceptorList: TioCRUDInterceptorList;
begin
  // Only if the current type name is registered (the is almost one interceptor registered for this type)
  if not FInternalContainer.ContainsKey(ATypeName) then
    Exit;
  // Extract the interceptor list for the Type, loop for all the contained interceptors and delete the soecified one
  LInterceptorList := FInternalContainer.Items[ATypeName];
  for I := LInterceptorList.Count-1 downto 0 do
  begin
    if (LInterceptorList[I].Interceptor = ACRUDInterceptor) and (LInterceptorList[I].ConnectionName = AInterceptOnlyOnConnectionName) then
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

class function TioCRUDInterceptorRegister.AfterLoad(const AContext: IioContext; const AObj: TObject): TObject;
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  Result := AObj;
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        Result := LItem.Interceptor.AfterLoad(AContext, AObj);
  end;
end;

class procedure TioCRUDInterceptorRegister.AfterDelete(const AContext: IioContext);
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        LItem.Interceptor.AfterDelete(AContext);
  end;
end;

class procedure TioCRUDInterceptorRegister.AfterInsert(const AContext: IioContext);
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        LItem.Interceptor.AfterInsert(AContext);
  end;
end;

class procedure TioCRUDInterceptorRegister.AfterUpdate(const AContext: IioContext);
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        LItem.Interceptor.AfterUpdate(AContext);
  end;
end;

class function TioCRUDInterceptorRegister.BeforeLoad(const AContext: IioContext; const AObj: TObject; var ADone: Boolean): TObject;
var
  LDone: Boolean;
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  Result := AObj;
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
      begin
        LDone := False;
        Result := LItem.Interceptor.BeforeLoad(AContext, AObj, LDone);
        if LDone then
          ADone := True;
      end;
  end;
end;

class procedure TioCRUDInterceptorRegister.BeforeDelete(const AContext: IioContext; var ADone: Boolean);
var
  LDone: Boolean;
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
      begin
        LDone := False;
        LItem.Interceptor.BeforeDelete(AContext, LDone);
        if LDone then
          ADone := True;
      end;
  end;
end;

class procedure TioCRUDInterceptorRegister.BeforeInsert(const AContext: IioContext; var ADone: Boolean);
var
  LDone: Boolean;
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
      begin
        LDone := False;
        LItem.Interceptor.BeforeInsert(AContext, LDone);
        if LDone then
          ADone := True;
      end;
  end;
end;

class procedure TioCRUDInterceptorRegister.BeforeUpdate(const AContext: IioContext; var ADone: Boolean);
var
  LDone: Boolean;
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
      begin
        LDone := False;
        LItem.Interceptor.BeforeUpdate(AContext, LDone);
        if LDone then
          ADone := True;
      end;
  end;
end;

class procedure TioCRUDInterceptorRegister.Build;
begin
  FInternalContainer := TObjectDictionary<String, TioCRUDInterceptorList>.Create([doOwnsValues], 3);
end;

class procedure TioCRUDInterceptorRegister.Clean;
begin
  if Assigned(FInternalContainer) then
    FreeAndNil(FInternalContainer);
end;

class function TioCRUDInterceptorRegister.OnLoadException(const AContext: IioContext; const AException: Exception): Boolean;
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // In caso di più interceptor registrati basta che uno solo ritorni True che il risultato sarà True
    Result := False;
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    // Cicla per tutti gli interceptor registrati per la classe e li invoca
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        Result := Result or LItem.Interceptor.OnLoadException(AContext, AException);
  end
  // Se non ci sono interceptor registrati per questa classe ritorna true in modo che venga fatto il re-raise
  else
    Result := True;
end;

class function TioCRUDInterceptorRegister.OnDeleteException(const AContext: IioContext; const AException: Exception): Boolean;
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // In caso di più interceptor registrati basta che uno solo ritorni True che il risultato sarà True
    Result := False;
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    // Cicla per tutti gli interceptor registrati per la classe e li invoca
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        Result := Result or LItem.Interceptor.OnDeleteException(AContext, AException);
  end
  // Se non ci sono interceptor registrati per questa classe ritorna true in modo che venga fatto il re-raise
  else
    Result := True;
end;

class function TioCRUDInterceptorRegister.OnInsertException(const AContext: IioContext; const AException: Exception): Boolean;
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // In caso di più interceptor registrati basta che uno solo ritorni True che il risultato sarà True
    Result := False;
    // Cicla per tutti gli interceptor registrati per la classe e li invoca
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        Result := Result or LItem.Interceptor.OnInsertException(AContext, AException);
  end
  // Se non ci sono interceptor registrati per questa classe ritorna true in modo che venga fatto il re-raise
  else
    Result := True;
end;

class function TioCRUDInterceptorRegister.OnUpdateException(const AContext: IioContext; const AException: Exception): Boolean;
var
  LItem: TioCRUDInterceptorItem;
  LCurrConnectionName: String;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
  begin
    // In caso di più interceptor registrati basta che uno solo ritorni True che il risultato sarà True
    Result := False;
    // Ottimizzazione perchè internamente poi accede al ConnectionManager che è threadsafe (Locked)
    LCurrConnectionName := AContext.Map.GetTable.GetConnectionDefName;
    // Cicla per tutti gli interceptor registrati per la classe e li invoca
    for LItem in FInternalContainer.Items[AContext.Map.GetClassName] do
      if LItem.ConnectionName.IsEmpty or (LItem.ConnectionName = LCurrConnectionName) then
        Result := Result or LItem.Interceptor.OnUpdateException(AContext, AException);
  end
  // Se non ci sono interceptor registrati per questa classe ritorna true in modo che venga fatto il re-raise
  else
    Result := True;
end;

{ TioCRUDInterceptorItem }

constructor TioCRUDInterceptorItem.Create(const AInterceptor: TioCRUDInterceptorRef; const AConnectionName: String);
begin
  FInterceptor := AInterceptor;
  FConnectionName := AConnectionName;
end;

initialization

finalization

TioCRUDInterceptorRegister.Clean;

end.
