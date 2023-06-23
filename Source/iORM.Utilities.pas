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
unit iORM.Utilities;

interface

uses
  System.Classes, System.TypInfo, System.Rtti, iORM.CommonTypes, iORM.MVVM.Interfaces,
  iORM.LiveBindings.Interfaces, iORM.Context.Interfaces;

type

  TioUtilities = class
  private
    class function _ExtractAttributeInfoSign(const ARttiInstanceType: TRttiInstanceType): String;
  public
    class function ObjectAsIInterface(const AObj: Tobject): IInterface; static;
    class function ObjectAsIioViewModel(const AObj: Tobject): IioViewModel; static;
    class function IsAnInterface<T>: Boolean; static;
    class function IsAnInterfaceTypeName(const ATypeName: String): Boolean; static;
    class function CastObjectToGeneric<T>(const AObj: Tobject): T; overload; static;
    class function CastObjectToGeneric<T>(const AObj: Tobject; IID: TGUID): T; overload; static;
    class function GenericToString<T>(const AQualified: Boolean = False): String; static;
    class function ClassRefToRttiType(const AClassRef: TioClassRef): TRttiInstanceType; static;
    class function GetRttiProperty(const AClassRef: TioClassRef; APropName: String): TRttiProperty; static;
    class function ResolveChildPropertyPath(const ARootObj: Tobject; const AChildPropertyPath: TStrings): Tobject; static;
    class function TypeInfoToTypeName(const ATypeInfo: PTypeInfo; const AQualified: Boolean = False): String; static;
    class function SameObject(const AObj1, AObj2: Tobject): Boolean; static;
    class function GetImplementedInterfaceName(const AClassType: TRttiInstanceType; const IID: TGUID): String; static;
    class function TValueToObject(const AValue: TValue; const ASilentException: Boolean = True): Tobject; static;
    class function TObjectFrom<T>(const AInstancePointer: Pointer): Tobject;
    class function TypeInfoToGUID(const ATypeInfo: PTypeInfo): TGUID; static;
    class function GUIDtoTypeInfo(const IID: TGUID): PTypeInfo; static;
    class function GUIDtoInterfaceName(const IID: TGUID): String; static;
    class function GetQualifiedTypeName(const ATypeInfo: Pointer): String; static;
    class function ExtractPropertyName(const AFullPathPropertyName: String): String;
    class function ResolveRttiTypeToRttiType(const ARttiType: TRttiType): TRttiType;
    class function ExtractOID(const AObj: Tobject): Integer; overload; static;
    class function ExtractOID(const AIntf: IInterface): Integer; overload; static;
    class function EnumToString<T>(const AEnumValue:T): String;
    class function StringToEnum<T>(const AStringValue: String): T;
    class function GetThreadID: TThreadID; static;
    class function ExtractItemRttiType<T>: TRttiType;
    class function TryGetMemberAttribute<T: class>(const ARTTIMember: TRttiMember; out OAttribute: TCustomAttribute): boolean; static;
    class function HasAttribute<T: TCustomAttribute>(const ARTTIType: TRttiType): boolean; static;
    class function HasAttributes<T1, T2: TCustomAttribute>(const ARTTIType: TRttiType): boolean; static;
    class function ClassNameToClassRef(const AClassName: String): TioClassRef;
    class function IsList(const AObj: TObject): Boolean;
    class procedure ClearList(const AList: TObject);
    class procedure TrimStrings(const AStrings: TStrings);
    class function CloneObject(const ASourceObj: TObject): TObject;
    /// Ricava la classe più in alto nella gerarchia (quello più vicina a TObject) che implementa la stessa interfaccia
    /// Questo serve a impostare correttamente la query select in modo che filtri correttamente in base anche
    ///  ai vincoli di ereditarietà.
    class function GetFarAncestorClassImplementingInterface(ARttiInstanceType: TRttiInstanceType; const IID: TGUID): TRttiInstanceType;
    class function GetFarAncestorEntityImplementingInterfaceSameTableAndConnection(ARttiInstanceType: TRttiInstanceType; const IID: TGUID): TRttiInstanceType;
    class function GetFarAncestorEntityWithSameTableAndConnection(AStartRttiInstanceType: TRttiInstanceType): TRttiInstanceType;
    class function GetDefaultBindSource(const AViewOrViewModel: TComponent): IioNotifiableBindSource;
    class function GetBindSource(const AViewOrViewModel: TComponent; const AName: String): IioNotifiableBindSource;
    // Funzioni che implementano verifiche riguardo l'essere Entità
    class function isEntityType(const ARTTIType: TRttiType): Boolean;
    class function isEntityAttribute(const AAttribute: TCustomAttribute): Boolean;
  end;

implementation

uses
  System.SysUtils, System.Types, iORM, iORM.Exceptions, iORM.Context.Container, iORM.RttiContext.Factory, iORM.DuckTyped.Factory, iORM.Context.Map.Interfaces,
  iORM.DependencyInjection.Implementers, DJSON, iORM.Resolver.Factory,
  iORM.Resolver.Interfaces, iORM.DependencyInjection, iORM.MVVM.ViewModel,
  iORM.Attributes;

{ TioRttiUtilities }

class function TioUtilities.CastObjectToGeneric<T>(const AObj: Tobject; IID: TGUID): T;
begin
  if not Assigned(AObj) then
    Exit(TValue.Empty.AsType<T>);
  if IsAnInterface<T> then
  begin
    if IID = GUID_NULL then
    begin
      IID := TypeInfoToGUID(TypeInfo(T));
      if IID = GUID_NULL then
        raise EioException.Create('TioRttiUtilities.CastObjectToGeneric: The interface does not have the GUID.');
    end;
    if not Supports(AObj, IID, Result) then
      raise EioException.Create('TioRttiUtilities.CastObjectToGeneric: Interface not supported.');
  end
  else
    Result := TValue.From<Tobject>(AObj).AsType<T>;
end;

class function TioUtilities.CastObjectToGeneric<T>(const AObj: Tobject): T;
begin
  Result := CastObjectToGeneric<T>(AObj, GUID_NULL);
end;

class function TioUtilities.ClassNameToClassRef(const AClassName: String): TioClassRef;
begin
  Result := TioMapContainer.GetMap(AClassName).GetClassRef;
end;

class function TioUtilities.ClassRefToRttiType(const AClassRef: TioClassRef): TRttiInstanceType;
begin
  Result := TioRttiFactory.GetRttiContext.GetType(AClassRef).AsInstance;
end;

class function TioUtilities.GetRttiProperty(const AClassRef: TioClassRef; APropName: String): TRttiProperty;
begin
  Result := TioRttiFactory.GetRttiContext.GetType(AClassRef).AsInstance.GetProperty(APropName);
end;

class procedure TioUtilities.ClearList(const AList: TObject);
begin
  if not Assigned(AList) then
    raise EioException.Create(ClassName, 'ClearList', '"AList" parameter not assigned');
  TioDuckTypedFactory.DuckTypedList(AList).Clear;
end;

class function TioUtilities.CloneObject(const ASourceObj: TObject): TObject;
var
  LSourceJSON: String;
begin
  LSourceJSON := dj.From(ASourceObj).byFields.TypeAnnotationsON.ToJSON;
  Result := dj.FromJSON(LSourceJSON).byFields.TypeAnnotationsON.ToObject;
// ----- OLD CODE -----
//  Result := io.Load(ASourceObj.ClassName).ByID(TioUtilities.ExtractOID(ASourceObj)).ToObject;
// ----- OLD CODE -----
end;

class function TioUtilities.ExtractOID(const AObj: Tobject): Integer;
var
  LMap: IioMap;
begin
  if not Assigned(AObj) then
    raise EioException.Create(ClassName, 'ExtractOID', '"AObj" parameter not assigned');
  LMap := TioMapContainer.GetMap(AObj.ClassName);
  Result := LMap.GetProperties.GetIdProperty.GetValue(AObj).AsInteger;
end;

class function TioUtilities.ExtractOID(const AIntf: IInterface): Integer;
begin
  if not Assigned(AIntf) then
    raise EioException.Create(ClassName, 'ExtractOID', '"AIntf" cannot be nil.');
  Result := ExtractOID(AIntf as Tobject);
end;

class function TioUtilities.EnumToString<T>(const AEnumValue: T): String;
begin
  Result := TRttiEnumerationType.GetName<T>(AEnumValue);
end;

class function TioUtilities.StringToEnum<T>(const AStringValue: String): T;
begin
  Result := TRttiEnumerationType.GetValue<T>(AStringValue);
end;

class function TioUtilities.ExtractItemRttiType<T>: TRttiType;
var
  LType: TRttiType;
  LGetItemMethod: TRttiMethod;
begin
  LType := TioRttiFactory.GetRttiContext.GetType(TypeInfo(T));
  LGetItemMethod := LType.GetMethod('GetItem');
  if Assigned(LGetItemMethod) then
    Result := LGetItemMethod.ReturnType
  else
    raise EioException.Create(Self.ClassName, 'ExtractItemRttiType', Format('Method "GetItem" not found in "%s" type.', [GenericToString<T>]));
end;

class function TioUtilities.ExtractPropertyName(const AFullPathPropertyName: String): String;
var
  LDotPos: Integer;
begin
  Result := AFullPathPropertyName;
  LDotPos := Pos('.', Result);
  while LDotPos > 0 do
  begin
    Result := Result.Remove(0, LDotPos);
    LDotPos := Pos('.', Result);
  end;
end;

class function TioUtilities.GenericToString<T>(const AQualified: Boolean = False): String;
begin
  Result := TypeInfoToTypeName(TypeInfo(T), AQualified);
end;

class function TioUtilities.GetBindSource(const AViewOrViewModel: TComponent; const AName: String): IioNotifiableBindSource;
  function _GetSimpleViewBindSource: IioNotifiableBindSource;
  var
    LComponent: TComponent;
  begin
    // If the AName param is empty then return de default presenter
    if AName.IsEmpty then
      Exit(GetDefaultBindSource(AViewOrViewModel));
    LComponent := AViewOrViewModel.FindComponent(AName);
    if Assigned(LComponent) and Supports(LComponent, IioNotifiableBindSource, Result) then
      Exit
    else
      raise EioException.Create(ClassName, 'GetBindSource', Format('BindSource named "%s" not found.', [AName]));
  end;
begin
  if AViewOrViewModel is TioViewModel then
  begin
    // If the AName param is empty then return de default presenter
    if AName.IsEmpty then
      Result := TioViewModel(AViewOrViewModel).DefaultPresenter
    else
      Result := TioViewModel(AViewOrViewModel).Presenter[AName];
  end
  else
    Result := _GetSimpleViewBindSource;
end;

class function TioUtilities.GetDefaultBindSource(const AViewOrViewModel: TComponent): IioNotifiableBindSource;
  function _GetSimpleViewDefaultBindSource: IioNotifiableBindSource;
  var
    I: Integer;
  begin
    for I := 0 to AViewOrViewModel.ComponentCount - 1 do
      if Supports(AViewOrViewModel.Components[I], IioNotifiableBindSource, Result) and Result.AsDefault then
        Exit;
    Result := nil;
  end;
begin
  if AViewOrViewModel is TioViewModel then
    Result := TioViewModel(AViewOrViewModel).DefaultPresenter
  else
    Result := _GetSimpleViewDefaultBindSource;
end;

class function TioUtilities.GetImplementedInterfaceName(const AClassType: TRttiInstanceType; const IID: TGUID): String;
var
  LRttiInterfaceType: TRttiInterfaceType;
begin
  for LRttiInterfaceType in AClassType.GetImplementedInterfaces do
    if LRttiInterfaceType.GUID = IID then
      Exit(LRttiInterfaceType.Name);
  raise EioException.Create('TioRttiUtilities.GetImplementedInterfaceName: Interface non implemented by the class.');
end;

class function TioUtilities.GetQualifiedTypeName(const ATypeInfo: Pointer): String;
begin
  Result := TioRttiFactory.GetRttiContext.GetType(ATypeInfo).QualifiedName;
end;

class function TioUtilities.GetFarAncestorClassImplementingInterface(ARttiInstanceType: TRttiInstanceType; const IID: TGUID): TRttiInstanceType;
begin
  Result := ARttiInstanceType;
  while (ARttiInstanceType <> nil) and Supports(ARttiInstanceType.MetaclassType, IID) do
  begin
    Result := ARttiInstanceType;
    ARttiInstanceType := ARttiInstanceType.BaseType;
  end;
end;

class function TioUtilities.GetFarAncestorEntityImplementingInterfaceSameTableAndConnection(ARttiInstanceType: TRttiInstanceType;
  const IID: TGUID): TRttiInstanceType;
var
  LCurrentTableAndConnection, LOriginalTableAndConnection: String;
begin
  Result := ARttiInstanceType;
  LOriginalTableAndConnection := _ExtractAttributeInfoSign(ARttiInstanceType);
  while (ARttiInstanceType <> nil) and Supports(ARttiInstanceType.MetaclassType, IID) do
  begin
    LCurrentTableAndConnection := _ExtractAttributeInfoSign(ARttiInstanceType);
    if (LCurrentTableAndConnection = LOriginalTableAndConnection) then
      Result := ARttiInstanceType;
    ARttiInstanceType := ARttiInstanceType.BaseType;
  end;
end;

class function TioUtilities.GetFarAncestorEntityWithSameTableAndConnection(AStartRttiInstanceType: TRttiInstanceType): TRttiInstanceType;
var
  LCurrentTableAndConnection, LOriginalTableAndConnection: String;
begin
  Result := AStartRttiInstanceType;
  LOriginalTableAndConnection := _ExtractAttributeInfoSign(AStartRttiInstanceType);
  while (AStartRttiInstanceType <> nil) do
  begin
    LCurrentTableAndConnection := _ExtractAttributeInfoSign(AStartRttiInstanceType);
    if (LCurrentTableAndConnection = LOriginalTableAndConnection) then
      Result := AStartRttiInstanceType;
    AStartRttiInstanceType := AStartRttiInstanceType.BaseType;
  end;
end;

class function TioUtilities.GetThreadID: TThreadID;
begin
  Result := System.Classes.TThread.CurrentThread.ThreadID;
end;

class function TioUtilities.GUIDtoInterfaceName(const IID: TGUID): String;
var
  LType: TRttiType;
begin
  for LType in TioRttiFactory.GetRttiContext.GetTypes do
    if LType is TRttiInterfaceType and (TRttiInterfaceType(LType).GUID = IID) then
      Exit(TRttiInterfaceType(LType).Name);
  raise EioException.Create('TioRttiUtilities.GUIDtoInterfaceName: IID is not an interface.');
end;

class function TioUtilities.GUIDtoTypeInfo(const IID: TGUID): PTypeInfo;
var
  LType: TRttiType;
begin
  for LType in TioRttiFactory.GetRttiContext.GetTypes do
    if LType is TRttiInterfaceType and (TRttiInterfaceType(LType).GUID = IID) then
      Exit(TRttiInterfaceType(LType).Handle);
  raise EioException.Create('TioRttiUtilities.GUIDtoTypeInfo: IID is not an interface.');
end;

class function TioUtilities.HasAttributes<T1, T2>(const ARTTIType: TRttiType): boolean;
var
  LAttributes: TArray<TCustomAttribute>;
  LAttribute: TCustomAttribute;
begin
  Result := False;
  LAttributes := ARTTIType.GetAttributes;
  for LAttribute in LAttributes do
    if (LAttribute is T1) or (LAttribute is T2) then
      Exit(true);
end;

class function TioUtilities.isEntityAttribute(const AAttribute: TCustomAttribute): Boolean;
begin
  Result := (AAttribute is ioEntity) or (AAttribute is ioNotPersistedEntity);
end;

class function TioUtilities.isEntityType(const ARTTIType: TRttiType): Boolean;
begin
  Result := HasAttributes<ioEntity, ioNotPersistedEntity>(ARTTIType);
end;

class function TioUtilities.HasAttribute<T>(const ARTTIType: TRttiType): boolean;
var
  LAttributes: TArray<TCustomAttribute>;
  LAttribute: TCustomAttribute;
begin
  Result := False;
  LAttributes := ARTTIType.GetAttributes;
  for LAttribute in LAttributes do
    if LAttribute is T then
      Exit(true);
end;

class procedure TioUtilities.TrimStrings(const AStrings: TStrings);
var
  I: Integer;
begin
  // Trim all lines
  for I := 0 to AStrings.Count-1 do
    AStrings[I] := AStrings[I].Trim;
end;

class function TioUtilities.TryGetMemberAttribute<T>(const ARTTIMember: TRttiMember; out OAttribute: TCustomAttribute): boolean;
var
  LAttributes: TArray<TCustomAttribute>;
  LAttribute: TCustomAttribute;
begin
  OAttribute := nil;
  Result := False;
  LAttributes := ARTTIMember.GetAttributes;
  for LAttribute in LAttributes do
    if LAttribute is T then
    begin
      OAttribute := LAttribute;
      Exit(true);
    end;
end;

class function TioUtilities.IsAnInterfaceTypeName(const ATypeName: String): Boolean;
begin
  Result := ATypeName.StartsWith('I');
end;

class function TioUtilities.IsList(const AObj: TObject): Boolean;
begin
  Result := TioDuckTypedFactory.IsList(AObj);
end;

class function TioUtilities.ObjectAsIInterface(const AObj: Tobject): IInterface;
begin
  if not Supports(AObj, IInterface, Result) then
    raise EioException.Create('TioRttiUtilities: IInterface not implemented by the object (' + AObj.ClassName + ').');
end;

class function TioUtilities.ObjectAsIioViewModel(const AObj: Tobject): IioViewModel;
begin
  if not Supports(AObj, IioViewModel, Result) then
    raise EioException.Create('TioRttiUtilities: IioViewModel not implemented by the object (' + AObj.ClassName + ').');
end;

// Questa funzione, a partire dal RootObject, restituisce l'oggetto a relativo al ChildPropertyPath navigando le proprietà
// dei vari livelli di oggetti.
class function TioUtilities.ResolveChildPropertyPath(const ARootObj: Tobject; const AChildPropertyPath: TStrings): Tobject;
var
  Ctx: TRttiContext;
  ACurrPropName: String;
  function GetChildObject(const AMasterObj: Tobject; const AMasterPropertyName: String): Tobject;
  var
    Typ: TRttiType;
    Prop: TRttiProperty;
    AValue: TValue;
  begin
    // Get the object RttiType
    Typ := Ctx.GetType(AMasterObj.ClassType);
    // Get the RttiProperty
    Prop := Typ.GetProperty(AMasterPropertyName);
    // Extract the object/interface (it must be an object or an interface)
    AValue := Prop.GetValue(AMasterObj);
    // Return the resolved child object
    Result := TValueToObject(AValue, True);
  end;

begin
  // Init
  Result := ARootObj;
  // If the AChildPropertyPath is not assigned then Exit
  if not Assigned(AChildPropertyPath) then
    Exit;
  // Get the RttiContext
  Ctx := TioRttiFactory.GetRttiContext;
  // Loop for properties on the path
  for ACurrPropName in AChildPropertyPath do
  begin
    if not Assigned(Result) then
      Exit;
    Result := GetChildObject(Result, ACurrPropName);
  end;
end;

class function TioUtilities.ResolveRttiTypeToRttiType(const ARttiType: TRttiType): TRttiType;
//var
//  LContainerImplementersItem: TioDIContainerImplementersItem;
begin
  if ARttiType.IsInstance then
    Result := ARttiType
  else if ARttiType is TRttiInterfaceType then
  begin
//    LContainerImplementersItem := io.di.Locate(ARttiType.Name).GetItem;
//    Exit(LContainerImplementersItem.RttiType);
    Result := TioResolverFactory.GetResolver(rsByDependencyInjection).ResolveInaccurateAsRttiType(ARttiType.Name, '');
  end
  else
    raise EioException.Create(Self.ClassName, 'RttiTypeToClassRef', '"ARttiType" parameter must be a TRttiInstanceType or TRttiInterfaceType.');
end;

class function TioUtilities.SameObject(const AObj1, AObj2: Tobject): Boolean;
begin
  Result := (@AObj1 = @AObj2);
end;

class function TioUtilities.TObjectFrom<T>(const AInstancePointer: Pointer): Tobject;
var
  LValue: TValue;
begin
  TValue.Make(@AInstancePointer, TypeInfo(T), LValue);
  Result := Self.TValueToObject(LValue, False);
end;

class function TioUtilities.TValueToObject(const AValue: TValue; const ASilentException: Boolean): Tobject;
begin
  Result := nil;
  // 2023-01-17 Carlo Marona
  if AValue.IsEmpty then
    exit;
  case AValue.TypeInfo.Kind of
    tkInterface:
      Result := AValue.AsInterface As Tobject;
    tkClass:
      Result := AValue.AsObject;
  else
    if not ASilentException then
      raise EioException.Create('TioRttiUtilities.TValueToObject: The TValue does not contain an object or interfaced object.');
  end;
end;

class function TioUtilities.TypeInfoToGUID(const ATypeInfo: PTypeInfo): TGUID;
var
  LTyp: TRttiType;
begin
  if ATypeInfo.Kind <> tkInterface then
    raise EioException.Create('TioRttiUtilities.TypeInfoToGUID: ATypeInfo is not relative to an interface.');
  LTyp := TioRttiFactory.GetRttiContext.GetType(ATypeInfo);
  if not Assigned(LTyp) then
    raise EioException.Create
      ('TioRttiUtilities.TypeInfoToGUID: RTTI type info not found, derive it from IInvokable or insert the {M+} directive before its declaration to solve the problem.');
  Result := TRttiInterfaceType(LTyp).GUID;
end;

class function TioUtilities.TypeInfoToTypeName(const ATypeInfo: PTypeInfo; const AQualified: Boolean = False): String;
begin
  // From XE7
{$IFDEF NEXTGEN}
  // Get the type name
  Result := ATypeInfo.NameFld.ToString;
  // If a qualifiedname is required...
  if AQualified then
  begin
    // If it is an interface then link the Interface unit to the TypeName
    if ATypeInfo.Kind = tkInterface then
      Result := ATypeInfo.TypeData.IntfUnitFld.ToString + '.' + Result
      // else (class) link the class unit to the TypeName
    else
      Result := ATypeInfo.TypeData.UnitNameFld.ToString + '.' + Result;
  end;
  // Before XE7
{$ELSE  NEXTGEN}
  Result := String(ATypeInfo.Name);
{$ENDIF NEXTGEN}
end;

class function TioUtilities._ExtractAttributeInfoSign(const ARttiInstanceType: TRttiInstanceType): String;
var
  LAttribute: TCustomAttribute;
  LAttributes: TArray<TCustomAttribute>;
  LTableName: String;
  LConnectionDefName: String;
begin
  LTableName := ARttiInstanceType.MetaclassType.ClassName.Substring(1); // Exclude first character (usually "T")
  LConnectionDefName := '';
  LAttributes := ARttiInstanceType.GetAttributes;
  for LAttribute in LAttributes do
  begin
    if LAttribute is ioEntity then
      LTableName := ioEntity(LAttribute).TableName
    else
    if LAttribute is ioNotPersistedEntity then
      LTableName := ioNotPersistedEntity(LAttribute).TableName
    else
    if LAttribute is ioConnectionDefName then
      LConnectionDefName := ioConnectionDefName(LAttribute).Value;
  end;
  // Se Table è vuota singifica che la classe attuale non è una entità (non è marcata con
  //  l'attributo ioEntity), in questo caso restituisce una stringa vuota.
  if not LTableName.IsEmpty then
    Result := LTableName + ',' + LConnectionDefName
  else
    Result := '';
end;

class function TioUtilities.IsAnInterface<T>: Boolean;
begin
  // Result is True if T si an interface
  // Result := (   TioRttiContextFactory.RttiContext.GetType(TypeInfo(T)) is TRttiInterfaceType   );
  Result := PTypeInfo(TypeInfo(T)).Kind = tkInterface;
end;

end.
