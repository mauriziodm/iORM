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
  iORM.LiveBindings.Interfaces, iORM.Context.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.RttiContext.Factory;

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
    class function ObjToID(const AObj: Tobject): Integer; static;
    class function IntfToID(const AIntf: IInterface): Integer; static;
    class function IsNullOID(const AObj: Tobject): Boolean; static;
    class function ExtractObjVersion(const AObj: Tobject): Integer; static;
    class function EnumToString<T>(const AEnumValue:T): String;
    class function StringToEnum<T>(const AStringValue: String): T;
    class function GetThreadID: TThreadID; static;
    class function ExtractItemRttiTypeByGeneric<T>: TRttiType;
    class function ExtractItemRttiTypeFromList(const AList: TObject): TRttiType;
    class function TryGetMemberAttribute<T: class>(const ARTTIMember: TRttiMember; out OAttribute: TCustomAttribute): boolean; static;
    class function ClassNameToClassRef(const AClassName: String): TioClassRef;
    class function IsList(const AObj: TObject): Boolean;
    class procedure ClearList(const AList: TObject);
    class procedure TrimStrings(const AStrings: TStrings);
    class function CloneObject(const ASourceObj: TObject): TObject;
    class procedure StopLinkerRemoval(const AClass: TClass);
    class function Now(const UTC: Boolean = False; const ForceDayLight: Boolean = False): TDateTime; static; inline;
    /// Ricava la classe pi� in alto nella gerarchia (quello pi� vicina a TObject) che implementa la stessa interfaccia
    /// Questo serve a impostare correttamente la query select in modo che filtri correttamente in base anche
    ///  ai vincoli di ereditariet�.
    class function GetFarAncestorClassImplementingInterface(ARttiInstanceType: TRttiInstanceType; const IID: TGUID): TRttiInstanceType;
    class function GetFarAncestorEntityImplementingInterfaceSameTableAndConnection(ARttiInstanceType: TRttiInstanceType; const IID: TGUID): TRttiInstanceType;
    class function GetFarAncestorEntityWithSameTableAndConnection(AStartRttiInstanceType: TRttiInstanceType): TRttiInstanceType;
    class function GetDefaultBindSource(const AViewOrViewModel: TComponent): IioBindSource;
    class function GetBindSource(const AViewOrViewModel: TComponent; const AName: String): IioBindSource;
    // Metodi per per i CustomAttributes
    class function GetAttribute(const ARTTIType: TRttiType; const AAttrClass: TCustomAttributeRef): TCustomAttribute; static;
    class function HasAttribute(const ARTTIType: TRttiType; const AAttrClass: TCustomAttributeRef): boolean; static;
    class function HasAttributes(const ARTTIType: TRttiType; const AAttrClass1, AAttrClass2: TCustomAttributeRef): boolean; static;
    // Funzioni che implementano verifiche riguardo l'essere Entit�
    class function isEntityType(const ARTTIType: TRttiType): Boolean; inline;
    class function isEntityAttribute(const AAttribute: TCustomAttribute): Boolean; inline;
    class function IsNotPersistedEntity(const AClassName: String): Boolean; inline;
    class function IsPersistedEntity(const AClassName: String): Boolean; inline;
    // ResolvePropertyPath
    class procedure ResolveChildPropertyPath_SplitPropNameAndPath(const AQualifiedPropertyPath: String; out OPath: TStrings; out OPropName: String); static;
    class function ResolveChildPropertyPath_GetFinalObj(const ARootObj: Tobject; const AChildObjPath: TStrings): Tobject; static;
    class function ResolveChildPropertySplitPath_GetValue(const ARootObj: Tobject; const AChildObjPath: TStrings; const AFinalPropName: String): TValue; static;
    class procedure ResolveChildPropertySplitPath_SetValue(const ARootObj: Tobject; const AChildObjPath: TStrings; const AFinalPropName: String; const AValue: TValue); static;
    class function ResolveChildPropertyPath_GetValue(const ARootObj: Tobject; AQualifiedPropertyPath: String): TValue; static;
    class procedure ResolveChildPropertyPath_SetValue(const ARootObj: Tobject; AQualifiedPropertyPath: String; const AValue: TValue); static;
    // BlindLevel helper methods
    class function BlindLevel_Do_DetectObjExists(const ABlindLevel: Byte): boolean; static;
    class function BlindLevel_Do_AutoUpdateProps(const ABlindLevel: Byte): boolean; static;
    class function BlindLevel_Do_DetectConflicts(const ABlindLevel: Byte): boolean; static;
  end;

implementation

uses
  System.SysUtils, System.Types, iORM, iORM.Exceptions, iORM.Context.Container, iORM.DuckTyped.Factory, iORM.Context.Map.Interfaces,
  iORM.DependencyInjection.Implementers, DJSON, iORM.Resolver.Factory,
  iORM.Resolver.Interfaces, iORM.DependencyInjection, iORM.MVVM.ViewModel,
  System.DateUtils;

{ TioRttiUtilities }

class function TioUtilities.BlindLevel_Do_AutoUpdateProps(const ABlindLevel: Byte): boolean;
begin
  Result := (ABlindLevel AND BL_BIT_AUTO_UPDATE_PROPS) <> 0;
end;

class function TioUtilities.BlindLevel_Do_DetectConflicts(const ABlindLevel: Byte): boolean;
begin
  Result := (ABlindLevel AND BL_BIT_DETECT_CONFLICTS) <> 0;
end;

class function TioUtilities.BlindLevel_Do_DetectObjExists(const ABlindLevel: Byte): boolean;
begin
  Result := (ABlindLevel AND BL_BIT_DETECT_OBJ_EXISTS) <> 0;
end;

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
        raise EioGenericException.Create('TioRttiUtilities.CastObjectToGeneric: The interface does not have the GUID.');
    end;
    if not Supports(AObj, IID, Result) then
      raise EioGenericException.Create('TioRttiUtilities.CastObjectToGeneric: Interface not supported.');
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
    raise EioGenericException.Create(ClassName, 'ClearList', '"AList" parameter not assigned');
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

class function TioUtilities.ObjToID(const AObj: Tobject): Integer;
var
  LMap: IioMap;
begin
  if not Assigned(AObj) then
    raise EioGenericException.Create(ClassName, 'ExtractOID', '"AObj" parameter not assigned');
  LMap := TioMapContainer.GetMap(AObj.ClassName);
  Result := LMap.GetProperties.GetIdProperty.GetValue(AObj).AsInteger;
end;

class function TioUtilities.IntfToID(const AIntf: IInterface): Integer;
begin
  if not Assigned(AIntf) then
    raise EioGenericException.Create(ClassName, 'ExtractOID', '"AIntf" cannot be nil.');
  Result := ObjToID(AIntf as Tobject);
end;

class function TioUtilities.ExtractObjVersion(const AObj: Tobject): Integer;
var
  LMap: IioMap;
begin
  if not Assigned(AObj) then
    raise EioGenericException.Create(ClassName, 'ExtractObjVersion', '"AObj" parameter not assigned');
  LMap := TioMapContainer.GetMap(AObj.ClassName);
  Result := LMap.GetProperties.GetObjVersionProperty.GetValue(AObj).AsInteger;
end;

class function TioUtilities.EnumToString<T>(const AEnumValue: T): String;
begin
  Result := TRttiEnumerationType.GetName<T>(AEnumValue);
end;

class procedure TioUtilities.StopLinkerRemoval(const AClass: TClass);
begin
  // This method does nothing, it only serves to ensure that the linker
  //  does not remove the class whose pointer is received and therefore
  //  that the RTTI information is generated even for classes for which
  //  there is no reference in the code.
end;

class function TioUtilities.StringToEnum<T>(const AStringValue: String): T;
begin
  Result := TRttiEnumerationType.GetValue<T>(AStringValue);
end;

class function TioUtilities.ExtractItemRttiTypeFromList(const AList: TObject): TRttiType;
var
  LType: TRttiType;
  LGetItemMethod: TRttiMethod;
begin
  LType := TioRttiFactory.GetRttiContext.GetType(AList.ClassInfo);
  LGetItemMethod := LType.GetMethod('GetItem');
  if Assigned(LGetItemMethod) then
    Result := LGetItemMethod.ReturnType
  else
    raise EioGenericException.Create(Self.ClassName, 'ExtractItemRttiType', Format('Method "GetItem" not found in "%s" type.', [AList.ClassName]));
end;

class function TioUtilities.ExtractItemRttiTypeByGeneric<T>: TRttiType;
var
  LType: TRttiType;
  LGetItemMethod: TRttiMethod;
begin
  LType := TioRttiFactory.GetRttiContext.GetType(TypeInfo(T));
  LGetItemMethod := LType.GetMethod('GetItem');
  if Assigned(LGetItemMethod) then
    Result := LGetItemMethod.ReturnType
  else
    raise EioGenericException.Create(Self.ClassName, 'ExtractItemRttiTypeByGeneric<T>', Format('Method "GetItem" not found in "%s" type.', [GenericToString<T>]));
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

class function TioUtilities.GetAttribute(const ARTTIType: TRttiType; const AAttrClass: TCustomAttributeRef): TCustomAttribute;
var
  LAttr: TCustomAttribute;
begin
  for LAttr in ARTTIType.GetAttributes do
    if LAttr is AAttrClass then
      Exit(LAttr);
  Result := nil;
end;

class function TioUtilities.HasAttribute(const ARTTIType: TRttiType; const AAttrClass: TCustomAttributeRef): boolean;
var
  LAttr: TCustomAttribute;
begin
  for LAttr in ARTTIType.GetAttributes do
    if LAttr is AAttrClass then
      Exit(True);
  Result := False;
end;

class function TioUtilities.HasAttributes(const ARTTIType: TRttiType; const AAttrClass1, AAttrClass2: TCustomAttributeRef): boolean;
var
  LAttr: TCustomAttribute;
begin
  for LAttr in ARTTIType.GetAttributes do
    if (LAttr is AAttrClass1) or (LAttr is AAttrClass2) then
      Exit(True);
  Result := False;
end;

class function TioUtilities.GetBindSource(const AViewOrViewModel: TComponent; const AName: String): IioBindSource;
  function _GetSimpleViewBindSource: IioBindSource;
  var
    LComponent: TComponent;
  begin
    // If the AName param is empty then return de default presenter
    if AName.IsEmpty then
      Exit(GetDefaultBindSource(AViewOrViewModel));
    LComponent := AViewOrViewModel.FindComponent(AName);
    if Assigned(LComponent) and Supports(LComponent, IioBindSource, Result) then
      Exit
    else
      raise EioGenericException.Create(ClassName, 'GetBindSource', Format('BindSource named "%s" not found.', [AName]));
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

class function TioUtilities.GetDefaultBindSource(const AViewOrViewModel: TComponent): IioBindSource;
  function _GetSimpleViewDefaultBindSource: IioBindSource;
  var
    I: Integer;
  begin
    for I := 0 to AViewOrViewModel.ComponentCount - 1 do
      if Supports(AViewOrViewModel.Components[I], IioBindSource, Result) and Result.AsDefault then
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
  raise EioGenericException.Create('TioRttiUtilities.GetImplementedInterfaceName: Interface non implemented by the class.');
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
  raise EioGenericException.Create('TioRttiUtilities.GUIDtoInterfaceName: IID is not an interface.');
end;

class function TioUtilities.GUIDtoTypeInfo(const IID: TGUID): PTypeInfo;
var
  LType: TRttiType;
begin
  for LType in TioRttiFactory.GetRttiContext.GetTypes do
    if LType is TRttiInterfaceType and (TRttiInterfaceType(LType).GUID = IID) then
      Exit(TRttiInterfaceType(LType).Handle);
  raise EioGenericException.Create('TioRttiUtilities.GUIDtoTypeInfo: IID is not an interface.');
end;

class function TioUtilities.isEntityAttribute(const AAttribute: TCustomAttribute): Boolean;
begin
  Result := (AAttribute is ioEntity) or (AAttribute is ioNotPersistedEntity);
end;

class function TioUtilities.isEntityType(const ARTTIType: TRttiType): Boolean;
begin
  Result := HasAttributes(ARTTIType, ioEntity, ioNotPersistedEntity);
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

class function TioUtilities.IsNotPersistedEntity(const AClassName: String): Boolean;
begin
  Result := TioMapContainer.GetMap(AClassName).GetTable.IsNotPersistedEntity;
end;

class function TioUtilities.IsPersistedEntity(const AClassName: String): Boolean;
begin
  Result := TioMapContainer.GetMap(AClassName).GetTable.IsPersistedEntity;
end;

class function TioUtilities.IsNullOID(const AObj: Tobject): Boolean;
begin
  Result := TioMapContainer.GetMap(AObj.ClassName).GetProperties.GetIdProperty.GetValue(AObj).AsInteger = IO_INTEGER_NULL_VALUE;
end;

class function TioUtilities.ObjectAsIInterface(const AObj: Tobject): IInterface;
begin
  if not Supports(AObj, IInterface, Result) then
    raise EioGenericException.Create('TioRttiUtilities: IInterface not implemented by the object (' + AObj.ClassName + ').');
end;

class function TioUtilities.ObjectAsIioViewModel(const AObj: Tobject): IioViewModel;
begin
  if not Supports(AObj, IioViewModel, Result) then
    raise EioGenericException.Create('TioRttiUtilities: IioViewModel not implemented by the object (' + AObj.ClassName + ').');
end;

// Questa funzione, a partire dal RootObject, restituisce l'oggetto a relativo al ChildPropertyPath navigando le propriet�
// dei vari livelli di oggetti.
class function TioUtilities.ResolveChildPropertyPath_GetFinalObj(const ARootObj: Tobject; const AChildObjPath: TStrings): Tobject;
var
  LCtx: TRttiContext;
  LCurrPropName: String;
  function _GetChildObject(const AMasterObj: Tobject; const AMasterPropertyName: String): Tobject;
  var
    LTyp: TRttiType;
    LProp: TRttiProperty;
    LValue: TValue;
  begin
    // Get the object RttiType
    LTyp := LCtx.GetType(AMasterObj.ClassType);
    // Get the RttiProperty
    LProp := LTyp.GetProperty(AMasterPropertyName);
    // Extract the object/interface (it must be an object or an interface)
    LValue := LProp.GetValue(AMasterObj);
    // Return the resolved child object
    Result := TValueToObject(LValue, True);
  end;

begin
  // Init
  Result := ARootObj;
  // If the AChildPropertyPath is not assigned then Exit
  if not Assigned(AChildObjPath) then
    Exit;
  // Get the RttiContext
  LCtx := TioRttiFactory.GetRttiContext;
  // Loop for properties on the path
  for LCurrPropName in AChildObjPath do
  begin
    // If the current child object is not assigned then return nil because I couldn't reach the goal
    if not Assigned(Result) then
      Exit(nil);
    Result := _GetChildObject(Result, LCurrPropName);
  end;
end;

class function TioUtilities.ResolveChildPropertyPath_GetValue(const ARootObj: Tobject; AQualifiedPropertyPath: String): TValue;
var
  LChildObjPath: TStrings;
  LFinalPropName: String;
begin
  ResolveChildPropertyPath_SplitPropNameAndPath(AQualifiedPropertyPath, LChildObjPath, LFinalPropName);
  Result := ResolveChildPropertySplitPath_GetValue(ARootObj, LChildObjPath, LFinalPropName);
end;

class procedure TioUtilities.ResolveChildPropertyPath_SetValue(const ARootObj: Tobject; AQualifiedPropertyPath: String; const AValue: TValue);
var
  LChildObjPath: TStrings;
  LFinalPropName: String;
begin
  ResolveChildPropertyPath_SplitPropNameAndPath(AQualifiedPropertyPath, LChildObjPath, LFinalPropName);
  ResolveChildPropertySplitPath_SetValue(ARootObj, LChildObjPath, LFinalPropName, AValue);
end;

class procedure TioUtilities.ResolveChildPropertyPath_SplitPropNameAndPath(const AQualifiedPropertyPath: String; out OPath: TStrings; out OPropName: String);
begin
  // Init
  OPropName := String.Empty;
  OPath := nil;
  // If the AQualifiedChildPropertyName is empty then exit
  if AQualifiedPropertyPath.IsEmpty then
    raise EioGenericException.Create(ClassName, 'ResolveChildPropertyPath_SplitPropNameAndPath', '"AQualifiedPropertyPath" is empty.');
  // Create the StringList, set the Delimiter and DelimitedText
  OPath := TStringList.Create;
  OPath.Delimiter := '.';
  OPath.DelimitedText := AQualifiedPropertyPath;
  // The last element is the ChildPropertyName
  OPropName := OPath[OPath.Count - 1];
  // Remove the last element
  OPath.Delete(OPath.Count - 1);
  // If the remaining list is empty then free it (optimization)
  if OPath.Count = 0 then
    FreeAndNil(OPath);
end;

class function TioUtilities.ResolveChildPropertySplitPath_GetValue(const ARootObj: Tobject; const AChildObjPath: TStrings; const AFinalPropName: String): TValue;
var
  LFinalChildObj: TObject;
  LFinalProp: TRttiProperty;
begin
  // Get the instance on which to extract the property value
  if Assigned(AChildObjPath) then
    LFinalChildObj := ResolveChildPropertyPath_GetFinalObj(ARootObj, AChildObjPath)
  else
    LFinalChildObj := ARootObj;
  // Extract the property value
  if Assigned(LFinalChildObj) then
  begin
    LFinalProp := TioRttiFactory.GetRttiPropertyByClass(LFinalChildObj.ClassType, AFinalPropName, True);
    Result := LFinalProp.GetValue(LFinalChildObj);
  end
  else
    Result := TValue.Empty;
end;

class procedure TioUtilities.ResolveChildPropertySplitPath_SetValue(const ARootObj: Tobject; const AChildObjPath: TStrings; const AFinalPropName: String; const AValue: TValue);
var
  LFinalChildObj: TObject;
  LFinalProp: TRttiProperty;
begin
  // Get the instance on which to extract the property value
  if Assigned(AChildObjPath) then
    LFinalChildObj := ResolveChildPropertyPath_GetFinalObj(ARootObj, AChildObjPath)
  else
    LFinalChildObj := ARootObj;
  // Extract the property value
  if Assigned(LFinalChildObj) then
  begin
    LFinalProp := TioRttiFactory.GetRttiPropertyByClass(LFinalChildObj.ClassType, AFinalPropName, True);
    LFinalProp.SetValue(LFinalChildObj, AValue);
  end
  else
    raise EioGenericException.Create(ClassName, 'ResolveChildPropertyPath_SetValue', '"FinalChildObj" is not assigned.');
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
    raise EioGenericException.Create(Self.ClassName, 'RttiTypeToClassRef', '"ARttiType" parameter must be a TRttiInstanceType or TRttiInterfaceType.');
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
      raise EioGenericException.Create('TioRttiUtilities.TValueToObject: The TValue does not contain an object or interfaced object.');
  end;
end;

class function TioUtilities.TypeInfoToGUID(const ATypeInfo: PTypeInfo): TGUID;
var
  LTyp: TRttiType;
begin
  if ATypeInfo.Kind <> tkInterface then
    raise EioGenericException.Create('TioRttiUtilities.TypeInfoToGUID: ATypeInfo is not relative to an interface.');
  LTyp := TioRttiFactory.GetRttiContext.GetType(ATypeInfo);
  if not Assigned(LTyp) then
    raise EioGenericException.Create
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

class function TioUtilities.Now(const UTC: Boolean = False; const ForceDayLight: Boolean = False): TDateTime;
begin
  if UTC then
    Result := TTimeZone.Local.ToUniversalTime(Now, ForceDayLight)
  else
    Result := Now;
end;

class function TioUtilities._ExtractAttributeInfoSign(const ARttiInstanceType: TRttiInstanceType): String;
var
  LAttribute: TCustomAttribute;
  LAttributes: TArray<TCustomAttribute>;
  LTableName: String;
  LConnectionName: String;
begin
  LTableName := ARttiInstanceType.MetaclassType.ClassName.Substring(1); // Exclude first character (usually "T")
  LConnectionName := '';
  LAttributes := ARttiInstanceType.GetAttributes;
  for LAttribute in LAttributes do
  begin
    if LAttribute is ioEntity then
      LTableName := ioEntity(LAttribute).TableName
    else
    if LAttribute is ioNotPersistedEntity then
      LTableName := ioNotPersistedEntity(LAttribute).TableName
    else
    if LAttribute is ioConnection then
      LConnectionName := ioConnection(LAttribute).ConnectionName;
  end;
  // Se Table � vuota singifica che la classe attuale non � una entit� (non � marcata con
  //  l'attributo ioEntity), in questo caso restituisce una stringa vuota.
  if not LTableName.IsEmpty then
    Result := LTableName + ',' + LConnectionName
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
