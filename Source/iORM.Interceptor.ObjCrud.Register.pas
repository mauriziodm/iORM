unit iORM.Interceptor.ObjCrud.Register;

interface

uses
  iORM.Interceptor.ObjCrud, System.Generics.Collections,
  iORM.Context.Interfaces, iORM.DB.Interfaces;

type

  TObjCrudInterceptorArray = TArray<TioObjCrudInterceptorRef>;
  PObjCrudInterceptorArray = ^TObjCrudInterceptorArray;

  TioObjCrudInterceptorRegisterRef = class of TioObjCrudInterceptorRegister;

  TioObjCrudInterceptorRegister = class
  private
    class var FInternalContainer: TDictionary<String, PObjCrudInterceptorArray>;
    class procedure Build;
    class procedure Clean;
  public
    class procedure RegisterInterceptor(const ATypeName: String; const AObjCrudInterceptor: TioObjCrudInterceptorRef);
    class procedure UnregisterInterceptor(const ATypeName: String; const AObjCrudInterceptor: TioObjCrudInterceptorRef);
    // ObjCreate
    class procedure BeforeObjCreate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjCreate(const AContext: IioContext; const AQuery: IioQuery);
    // ObjInsert
    class procedure BeforeObjInsert(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjInsert(const AContext: IioContext; const AQuery: IioQuery);
    // ObjUpdate
    class procedure BeforeObjUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjUpdate(const AContext: IioContext; const AQuery: IioQuery);
    // ObjDelete
    class procedure BeforeObjDelete(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjDelete(const AContext: IioContext; const AQuery: IioQuery);
  end;


implementation

uses
  System.SysUtils;

{ TioObjCrudInterceptorRegister }

class procedure TioObjCrudInterceptorRegister.AfterObjCreate(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterObjCreate(AContext, AQuery);
end;

class procedure TioObjCrudInterceptorRegister.AfterObjDelete(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterObjDelete(AContext, AQuery);
end;

class procedure TioObjCrudInterceptorRegister.AfterObjInsert(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterObjInsert(AContext, AQuery);
end;

class procedure TioObjCrudInterceptorRegister.AfterObjUpdate(const AContext: IioContext; const AQuery: IioQuery);
var
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
      LInterceptor.AfterObjUpdate(AContext, AQuery);
end;

class procedure TioObjCrudInterceptorRegister.BeforeObjCreate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeObjCreate(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioObjCrudInterceptorRegister.BeforeObjDelete(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeObjDelete(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioObjCrudInterceptorRegister.BeforeObjInsert(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeObjInsert(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioObjCrudInterceptorRegister.BeforeObjUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioObjCrudInterceptorRef;
begin
  if Assigned(FInternalContainer) and FInternalContainer.ContainsKey(AContext.Map.GetClassName) then
    for LInterceptor in FInternalContainer.Items[AContext.Map.GetClassName]^ do
    begin
      LDone := False;
      LInterceptor.BeforeObjUpdate(AContext, AQuery, LDone);
      if LDone then
        ADone := True;
    end;
end;

class procedure TioObjCrudInterceptorRegister.Build;
begin
  FInternalContainer := TDictionary<String, PObjCrudInterceptorArray>.Create;
end;

class procedure TioObjCrudInterceptorRegister.Clean;
begin
  if Assigned(FInternalContainer) then
    FreeAndNil(FInternalContainer);
end;

class procedure TioObjCrudInterceptorRegister.RegisterInterceptor(const ATypeName: String; const AObjCrudInterceptor: TioObjCrudInterceptorRef);
var
  LInterceptorArray: TObjCrudInterceptorArray;
  LInterceptorArrayPointer: PObjCrudInterceptorArray;
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
  LInterceptorArray[LNewInterceptorIndex] := AObjCrudInterceptor;
end;

class procedure TioObjCrudInterceptorRegister.UnregisterInterceptor(const ATypeName: String; const AObjCrudInterceptor: TioObjCrudInterceptorRef);
var
  I: Integer;
  LInterceptorArray: TObjCrudInterceptorArray;
  LInterceptorArrayPointer: PObjCrudInterceptorArray;
begin
  // Only if the current type name is registered (the is almost one interceptor registered for this type)
  if FInternalContainer.ContainsKey(ATypeName) then
  begin
    // Remove the interceptor
    LInterceptorArrayPointer := FInternalContainer.Items[ATypeName];
    LInterceptorArray := LInterceptorArrayPointer^;
    for I := High(LInterceptorArray) downto Low(LInterceptorArray) do
      if LInterceptorArray[I] = AObjCrudInterceptor then
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

TioObjCrudInterceptorRegister.Clean;

end.
