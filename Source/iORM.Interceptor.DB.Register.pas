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
