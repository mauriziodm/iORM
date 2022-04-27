{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.Utilities;

interface

uses
  iORM.CommonTypes, System.Rtti, System.Classes, iORM.Exceptions,
  System.TypInfo, iORM.MVVM.Interfaces, System.Types;

type

  TioUtilities = class
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
    class function ResolveRttiTypeToClassRef(const ARttiType: TRttiType): TClass; static;
    class function ResolveRttiTypeToRttiType(const ARttiType: TRttiType): TRttiType;
    class function ExtractOID(const AObj: Tobject): Integer; overload; static;
    class function ExtractOID(const AIntf: IInterface): Integer; overload; static;
    class function EnumToString<T>(const AEnumValue:T): String;
    class function GetThreadID: TThreadID; static;
    class function ExtractItemRttiType<T>: TRttiType;
    class function TryGetMemberAttribute<T: class>(ARTTIMember: TRttiMember; out OAttribute: TCustomAttribute): boolean; static;
    class function HasAttribute<T: class>(ARTTIType: TRttiType): boolean; static;
    class function ClassNameToClassRef(const AClassName: String): TioClassRef;
    class procedure ClearList(const AList: TObject);
    class function CloneObject(const ASourceObj: TObject): TObject;
  end;

implementation

uses
  System.SysUtils, iORM.RttiContext.Factory, System.StrUtils, iORM, iORM.DependencyInjection.Implementers,
  iORM.Context.Interfaces, iORM.Context.Map.Interfaces, iORM.Context.Container,
  iORM.DuckTyped.Factory;

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
  Result := TioMapCOntainer.GetMap(AClassName).GetClassRef;
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
  LSourceJSON := io.Mapper.From(ASourceObj).byFields.TypeAnnotationsON.ToString;
  Result := io.Mapper.FromJSON(LSourceJSON).byFields.TypeAnnotationsON.ToObject;
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

class function TioUtilities.EnumToString<T>(const AEnumValue: T): String;
begin
  Result := TRttiEnumerationType.GetName<T>(AEnumValue);
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

class function TioUtilities.ExtractOID(const AIntf: IInterface): Integer;
begin
  if Assigned(AIntf) then
    raise EioException.Create(ClassName, 'ExtractOID', '"AIntf" cannot be nil.');
  Result := ExtractOID(AIntf as Tobject);
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

class function TioUtilities.HasAttribute<T>(ARTTIType: TRttiType): boolean;
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

class function TioUtilities.TryGetMemberAttribute<T>(ARTTIMember: TRttiMember; out OAttribute: TCustomAttribute): boolean;
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

class function TioUtilities.ResolveRttiTypeToClassRef(const ARttiType: TRttiType): TClass;
var
  LResolvedRttiType: TRttiType;
begin
  LResolvedRttiType := ResolveRttiTypeToRttiType(ARttiType);
  Result := LResolvedRttiType.AsInstance.MetaclassType; // Note: the resolved type is always a TRttiInstamceType
end;

class function TioUtilities.ResolveRttiTypeToRttiType(const ARttiType: TRttiType): TRttiType;
var
  LContainerImplementersItem: TioDIContainerImplementersItem;
begin
  if ARttiType.IsInstance then
    Exit(ARttiType)
  else if ARttiType is TRttiInterfaceType then
  begin
    LContainerImplementersItem := io.di.Locate(ARttiType.Name).GetItem;
    Exit(LContainerImplementersItem.RttiType);
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

class function TioUtilities.IsAnInterface<T>: Boolean;
begin
  // Result is True if T si an interface
  // Result := (   TioRttiContextFactory.RttiContext.GetType(TypeInfo(T)) is TRttiInterfaceType   );
  Result := PTypeInfo(TypeInfo(T)).Kind = tkInterface;
end;

end.
