{
  ****************************************************************************
  *                                                                          *
  *           DJSON - (Delphi JSON library)                                  *
  *                                                                          *
  *           Copyright (C) 2016-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/DSON.git                         *
  *                                                                          *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of DJSON (Delphi JSON library).                        *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  * you may not use this file except in compliance with the License.         *
  *                                                                          *
  * DJSON is free software: you can redistribute it and/or modify            *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * DJSON is distributed in the hope that it will be useful,                 *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with DJSON.  If not, see <http://www.gnu.org/licenses/>.           *
  *                                                                          *
  ****************************************************************************
}
unit DJSON.Engine.DOM;

interface

uses
  System.JSON,
  System.Rtti,
  System.Generics.Collections,
  DJSON.Params,
  DJSON.Duck.Interfaces;

type

  TdjEngineDOM = class(TdjEngineIntf)
  protected
    // Serializers
    class function SerializePropField(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers: Boolean = True): TJSONValue; static;
    class function SerializeFloat(const AValue: TValue; const AParams: IdjParams): TJSONValue; static;
    class function SerializeEnumeration(const AValue: TValue): TJSONValue; static;
    class function SerializeInteger(const AValue: TValue): TJSONValue; static;
    class function SerializeString(const AValue: TValue; const AParams: IdjParams): TJSONValue; static;
    class function SerializeChar(const AValue: TValue; const AParams: IdjParams): TJSONValue; static;
    class function SerializeRecord(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue; static;
    class function SerializeArray(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue; static;
    class function SerializeClass(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue; static;
    class function SerializeInterface(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue; static;
    class function SerializeObject(const AObject: TObject; const AParams: IdjParams): TJSONObject; overload; static;
    class function SerializeObject(const AInterfacedObject: IInterface; const AParams: IdjParams): TJSONObject; overload; static;
    class function SerializeTValue(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue; static;
    class procedure SerializeList(const ADuckList: IdjDuckList; const APropField: TRttiNamedObject; const AParams: IdjParams; out ResultJSONValue: TJSONValue); static;
    class procedure SerializeDictionary(const ADuckDictionary: IdjDuckDictionary; const APropField: TRttiNamedObject; const AParams: IdjParams; out ResultJSONValue: TJSONValue); static;
    class procedure SerializeStreamableObject(const ADuckStreamable: IdjDuckStreamable; const APropField: TRttiNamedObject; out ResultJSONValue: TJSONValue); static;
    class procedure SerializeStream(const AStream: TObject; const APropField: TRttiNamedObject; out ResultJSONValue: TJSONValue); static;
    class function SerializeCustom(AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; out ResultJSONValue: TJSONValue): Boolean; static;
    // Deserializers
    class function DeserializePropField(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; static;
    class function DeserializeFloat(const AJSONValue: TJSONValue; const AValueType: TRttiType; const AParams: IdjParams): TValue; static;
    class function DeserializeEnumeration(const AJSONValue: TJSONValue; const AValueType: TRttiType): TValue; static;
    class function DeserializeInteger(const AJSONValue: TJSONValue): TValue; static;
    class function DeserializeString(const AJSONValue: TJSONValue): TValue; static;
    class function DeserializeChar(const AJSONValue: TJSONValue): TValue; static;
    class function DeserializeRecord(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
    class function DeserializeArray(const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; static;
    class procedure DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class function DeserializeClass(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
    class function DeserializeInterface(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
    class function DeserializeObject(const AJSONBox: TJSONObject; AObject: TObject; const AParams: IdjParams): TObject; static;
    class function DeserializeTValue(const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
    class procedure DeserializeList(const ADuckList: IdjDuckList; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeStreamableObject(const ADuckStreamable: IdjDuckStreamable; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject); static;
    class procedure DeserializeStream(AStream: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject); static;
    class function DeserializeCustom(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams; out ResultValue: TValue): Boolean; static;
  public
    class function Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers: Boolean = True): String; override;
    class function Deserialize(const AJSONText: String; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; override;
    // Added for iORM purposes
    class function SerializeToJsonValue(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers: Boolean = True): TJSONValue;
  end;

implementation

uses
{$REGION 'System'}
  System.SysUtils,
  System.DateUtils,
  System.NetEncoding,
  System.Classes,
  System.TypInfo,
{$ENDREGION}
{$REGION 'DJSON'}
  DJSON.Duck.PropField,
  DJSON.Utils.Rtti,
  DJSON.Exceptions,
  DJSON.Serializers,
  DJSON.Constants,
  DJSON.Attributes,
  DJSON.Factory,
  DJSON.Utils,
  DJSON.TypeInfoCache
{$ENDREGION}
    ;

class function TdjEngineDOM.Deserialize(const AJSONText: String; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue;
  const AParams: IdjParams): TValue;
var
  LJSONValue: TJSONValue;
begin
  LJSONValue := TJSONObject.ParseJSONValue(AJSONText);
  if not Assigned(LJSONValue) then
    raise EdjEngineError.Create('Wrong JSON text.');
  try
    Result := DeserializePropField(LJSONValue, AValueType, APropField, AMaster, AParams);
  finally
    LJSONValue.Free;
  end;
end;

class function TdjEngineDOM.DeserializeArray(const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AMaster: TValue;
  const AParams: IdjParams): TValue;
var
  LValueQualifiedTypeName: String;
  LJSONValue, LValueJSONValue: TJSONValue;
  LJSONArray: TJSONArray;
  LValueRTTIType: TRttiType;
  I: Integer;
  LValue: TValue;
  PArray: Pointer;
  LArrayLen: Longint;
begin
  // Checks
  if (not Assigned(AJSONValue)) or (AJSONValue is TJSONNull) then
    Exit;
  // Defaults
  LValueQualifiedTypeName := '';
  // If the Property/Field is valid then try to get the value (Object) from the
  // master object else the MasterObject itself is the destination of the deserialization
  Result := nil;
  if (not AMaster.IsEmpty) and AMaster.IsObject and TdjDuckPropField.IsValidPropField(APropField) then
    Result := TdjDuckPropField.GetValue(AMaster.AsObject, APropField)
  else
    Result := AMaster;
  // If TypeAnnotations is true then get the "items" JSONArray containing che containing the list items
  // else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if not(AJSONValue is TJSONObject) then
      raise EdjEngineError.Create('Wrong serialization for the array.');
    // Get the value type name
    LJSONValue := TJSONObject(AJSONValue).GetValue(DJ_VALUE);
    if Assigned(LJSONValue) then
      LValueQualifiedTypeName := LJSONValue.Value;
    // Get the items array
    LJSONValue := TJSONObject(AJSONValue).Get('items').JsonValue;
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if not(LJSONValue is TJSONArray) then
    raise EdjEngineError.Create('Cannot restore the list because the related JSONValue is not an array');
  LJSONArray := TJSONArray(LJSONValue);
  // Get values RttiType, if the RttiType is not found then check for
  // "djItemsType" attribute or from PARAMS, If it still has not been found
  // then get the type directly from the DuckTypedList
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);

  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := TdjRTTI.GetItemsQualifiedTypeNameFromArrayTypeInfo(Result.TypeInfo);

  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if (not Assigned(LValueRTTIType)) and (LJSONArray.Count > 0) then
    raise EdjEngineError.Create('Value type not found deserializing an array');
  // ------------
  // If it is a dynamic array set the length
  if Result.Kind = tkDynArray then
  begin
    PArray := Result.GetReferenceToRawData;
    LArrayLen := LJSONArray.Count;
    DynArraySetLength(PPointer(PArray)^, Result.TypeInfo, 1, @LArrayLen); // Monodimensional array only (1)
  end;
  // Loop
  for I := 0 to LJSONArray.Count - 1 do
  begin
    // Extract the current element
    LValueJSONValue := LJSONArray.Items[I];
    // Deserialize the current element
    LValue := DeserializePropField(LValueJSONValue, LValueRTTIType, APropField, nil, AParams);
    // Add to the array
    Result.SetArrayElement(I, LValue);
  end;
end;

class function TdjEngineDOM.DeserializeChar(const AJSONValue: TJSONValue): TValue;
begin
  // If JSONNull or JSON non assigned then return 0
  if (not Assigned(AJSONValue)) // JSONKey not present
    or (AJSONValue is TJSONNull) // JSONNull
    or (AJSONValue.Value.IsEmpty) then
    Exit(#0);
  Result := AJSONValue.Value;
end;

class function TdjEngineDOM.DeserializeClass(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject;
  const AParams: IdjParams): TValue;
var
  LChildObj: TObject;
  LJustCreated: Boolean;
begin
  // Init
  LChildObj := nil;
  LJustCreated := False;
  // If the Property/Field is valid then try to get the value (Object) from the
  // master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TdjDuckPropField.IsValidPropField(APropField) then
      LChildObj := TdjRTTI.TValueToObject(TdjDuckPropField.GetValue(AMasterObj, APropField))
    else
      LChildObj := AMasterObj;
  // If the LChildObj is not assigned and the AValueType is assigned then
  // create the LChildObj of the type specified by the AValueType parameter,
  // PS: normally used by DeserializeList or other collection deserialization
  if Assigned(AValueType) and (not Assigned(LChildObj)) then // and (not AParams.TypeAnnotations) then
  begin
    LChildObj := TdjRTTI.CreateObject(AValueType);
    LJustCreated := True;
  end;
  // Deserialize
  DeserializeClassCommon(LChildObj, AJSONValue, APropField, AParams);
  // Make the result TValue
  // NB: If the MasterObj is assigned return an empty TValue because if the
  // deserialized object is a detail of a MasterObject the creation of the
  // child object is responsibility of the Master object itself, so the
  // child object is already assigned to the master object property.
  // if Assigned(AMasterObj) then
  // Code modified to resolve the issue of Maxim Sysoev when trying to deserialize
  // an instance of a class like TMyClass<T> where T maybe every type (no constraint)
  // and the class don't create itself the internal field of type <T> (when T is a class).
  if (Assigned(AMasterObj) and not Assigned(LChildObj)) or not LJustCreated then
    Result := TValue.Empty
  else
    TValue.Make(@LChildObj, LChildObj.ClassInfo, Result);
end;

class procedure TdjEngineDOM.DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LTypeInfoCacheItem: TdjTypeInfoCacheItem;
begin
  // Some checks
  if (AJSONValue = nil) or (AJSONValue is TJSONNull) then
    Exit;
  // Get the TypeInfoCache for the current object then deserialize it property
  LTypeInfoCacheItem := AParams.TypeInfoCache.Get(AChildObj);
  case LTypeInfoCacheItem.DuckType of
    dtNone:
      begin
        if AJSONValue is TJSONObject then
          AChildObj := DeserializeObject(TJSONObject(AJSONValue), AChildObj, AParams)
          // If the JSONValue is a TJSONNull (Mauri 19/04/2020: Non fa più il FreeAndNil perchè in alcuni casi era un problema)
        else if (AJSONValue = nil) or (AJSONValue is TJSONNull) then
          // FreeAndNil(AChildObj)
          // Raise an exception
        else
          raise EdjEngineError.Create('Deserialize Class: Cannot deserialize as object.');
      end;
    dtList:
      DeserializeList(LTypeInfoCacheItem.DuckListWrapper, AJSONValue, APropField, AParams);
    dtStreamable:
      DeserializeStreamableObject(LTypeInfoCacheItem.DuckStreamableWrapper, AJSONValue, APropField);
    dtDictionary:
      DeserializeDictionary(LTypeInfoCacheItem.DuckDictionaryWrapper, AJSONValue, APropField, AParams);
    dtStream:
      DeserializeStream(AChildObj, AJSONValue, APropField);
  end;
end;

class function TdjEngineDOM.DeserializeCustom(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMaster: TValue; const AParams: IdjParams; out ResultValue: TValue): Boolean;
var
  LSerializer: TdjDOMCustomSerializerRef;
  LMapperCustomSerializer: djSerializerDOMAttribute;
  LExistingValue: TValue;
  LJSONValue: TJSONValue;
  LObj: TObject;
begin
  // Init
  Result := False;
  LExistingValue := nil;
  // If the Property/Field is valid then try to get the value (Object) from the
  // master object else the MasterObject (or the array) itself is the destination
  // of the deserialization
  if not AMaster.IsEmpty then
  begin
    if AMaster.IsObject and TdjDuckPropField.IsValidPropField(APropField) then
      LExistingValue := TdjDuckPropField.GetValue(AMaster.AsObject, APropField)
    else
      LExistingValue := AMaster;
  end;
  // If the Value is an Interface type then convert it to real object class
  // type implementing the interface
  if (AValueType.TypeKind = tkInterface) and not LExistingValue.IsEmpty then
  begin
    LObj := LExistingValue.AsInterface as TObject;
    TValue.Make(@LObj, LObj.ClassInfo, LExistingValue);
  end;
  // Get custom serializer if exists
  if AParams.Serializers.Exists_DOM(AValueType.Handle) then
    LSerializer := AParams.Serializers._GetSerializerItem(AValueType.Handle).DOMSerializer
  else if TdjRTTI.HasAttribute<djSerializerDOMAttribute>(TdjRTTI.TypeInfoToRttiType(AValueType.Handle), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit;
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  // in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
    LJSONValue := (AJSONValue as TJSONObject).GetValue(DJ_VALUE)
  else
    LJSONValue := AJSONValue;
  // Serialize (if a custom serializer exists)
  ResultValue := LSerializer.Deserialize(LJSONValue, LExistingValue);
  // All Ok
  Result := True;
end;

class procedure TdjEngineDOM.DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LKeyQualifiedTypeName, LValueQualifiedTypeName, LDictionaryTypeName: String;
  LKeyRttiType, LValueRTTIType: TRttiType;
  LJSONValue, LKeyJSONValue, LValueJSONValue: TJSONValue;
  LJObj: TJSONObject;
  LJSONArray: TJSONArray;
  LKey, LValue: TValue;
  I: Integer;
begin
  // Checks
  if (not Assigned(AJSONValue)) or (AJSONValue is TJSONNull) then
    Exit;
  // Defaults
  LDictionaryTypeName := '';
  LKeyQualifiedTypeName := '';
  LValueQualifiedTypeName := '';
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  // else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if not(AJSONValue is TJSONObject) then
      raise EdjEngineError.Create('Wrong serialization for ' + ADuckDictionary.DuckObjQualifiedName);
    LJObj := AJSONValue as TJSONObject;
    // Get the Dictionary class
    LJSONValue := LJObj.GetValue(DJ_TYPENAME);
    if Assigned(LJSONValue) then
      LDictionaryTypeName := LJSONValue.Value;
    // Get the key type name
    LJSONValue := LJObj.GetValue(DJ_KEY);
    if Assigned(LJSONValue) then
      LKeyQualifiedTypeName := LJSONValue.Value;
    // Get the value type name
    LJSONValue := LJObj.GetValue(DJ_VALUE);
    if Assigned(LJSONValue) then
      LValueQualifiedTypeName := LJSONValue.Value;
    // Get the items array
    LJSONValue := LJObj.Get('items').JsonValue;
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if not(LJSONValue is TJSONArray) then
    raise EdjEngineError.Create('Cannot restore the dictionary because the related JSONValue is not an array');
  LJSONArray := TJSONArray(LJSONValue);
  // Get values RttiType, if the RttiType is not found then check for dsonTypeAttribute
  // or get from the Dictionary as last chance, If it still has not been found
  // then get the type directly from the DuckTypedList
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LKeyQualifiedTypeName, LValueQualifiedTypeName);

  if LKeyQualifiedTypeName.IsEmpty then
    LKeyQualifiedTypeName := ADuckDictionary.GetKeyQualifiedTypeName;
  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := ADuckDictionary.GetValueQualifiedTypeName;

  LKeyRttiType := TdjRTTI.QualifiedTypeNameToRttiType(LKeyQualifiedTypeName);
  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);

  if LJSONArray.Count > 0 then
  begin
    if not Assigned(LKeyRttiType) then
      raise EdjEngineError.Create('Key type not found deserializing a Dictionary');
    if not Assigned(LValueRTTIType) then
      raise EdjEngineError.Create('Value type not found deserializing a Dictionary');
  end;
  // ------------
  // Loop
  for I := 0 to LJSONArray.Count - 1 do
  begin
    LJObj := LJSONArray.Items[I] as TJSONObject;
    // Get the key anche value JSONValue
    case AParams.SerializationMode of
      smJavaScript:
        begin
          // Key can be any value (string, objects etc).
          LKeyJSONValue := TJSONObject.ParseJSONValue(LJObj.Pairs[0].JsonString.ToJSON);
          LValueJSONValue := LJObj.Pairs[0].JsonValue;
        end;
      smDataContract:
        begin
          LKeyJSONValue := LJObj.GetValue(DJ_KEY);
          LValueJSONValue := LJObj.GetValue(DJ_VALUE);
        end;
    else
      raise Exception.Create('TdjEngineDOM.DeserializeDictionary: The AParams.SerializationMode contain unknown parameter.');
    end;
    // Deserialization key and value
    LKey := DeserializePropField(LKeyJSONValue, LKeyRttiType, APropField, nil, AParams);
    LValue := DeserializePropField(LValueJSONValue, LValueRTTIType, APropField, nil, AParams);
    // If the SerializationMode equals to smJavaScript then Free the LKeyJSONValue
    // becaouse not owned by anyone
    if AParams.SerializationMode = smJavaScript then
      LKeyJSONValue.Free;
    // Add to the dictionary
    ADuckDictionary.Add(LKey, LValue);
  end;
end;

class function TdjEngineDOM.DeserializeEnumeration(const AJSONValue: TJSONValue; const AValueType: TRttiType): TValue;
begin
  if Assigned(AJSONValue) then
  begin
    if AValueType.QualifiedName = 'System.Boolean' then
    begin
      if AJSONValue is TJSONTrue then
        Result := True
      else if (AJSONValue = nil) or (AJSONValue is TJSONFalse) then
        Result := False
      else
        raise EdjEngineError.Create('Invalid value for boolean value ');
    end
    else // it is an enumerated value but it's not a boolean.
      TValue.Make((AJSONValue as TJSONNumber).AsInt, AValueType.Handle, Result);
  end
  else
    Result := TValue.Empty;
end;

class function TdjEngineDOM.DeserializeFloat(const AJSONValue: TJSONValue; const AValueType: TRttiType; const AParams: IdjParams): TValue;
var
  LQualifiedTypeName: String;
begin
  // If JSONNull or JSON non assigned then return 0
  if (not Assigned(AJSONValue)) // JSONKey not present
    or (AJSONValue is TJSONNull) // JSONNull
  then
    Exit(0);
  // Else...
  LQualifiedTypeName := AValueType.QualifiedName;
  if LQualifiedTypeName = 'System.TDate' then
    Result := TValue.From<TDate>(TdjUtils.ISOStrToDateTime(AJSONValue.Value, AParams))
  else if LQualifiedTypeName = 'System.TDateTime' then
    Result := TValue.From<TDateTime>(TdjUtils.ISOStrToDateTime(AJSONValue.Value, AParams))
  else if LQualifiedTypeName = 'System.TTime' then
  begin
    if not(AJSONValue is TJSONString) then
      raise EdjEngineError.CreateFmt('Cannot deserialize TTime value, expected [%s] got [%s]', ['TJSONString', AJSONValue.ClassName]);
    Result := TValue.From<TTime>(TdjUtils.ISOStrToTime(AJSONValue.Value, AParams))
  end
  else { if APropFieldRttiType.QualifiedName = 'System.Currency' then }
  begin
    if not(AJSONValue is TJSONNumber) then
      raise EdjEngineError.CreateFmt('Cannot deserialize float value, expected [%s] got [%s]', ['TJSONNumber', AJSONValue.ClassName]);
    Result := TJSONNumber(AJSONValue).AsDouble
  end;
end;

class function TdjEngineDOM.DeserializeInteger(const AJSONValue: TJSONValue): TValue;
begin
  // If JSONNull or JSON non assigned then return 0
  if (not Assigned(AJSONValue)) // JSONKey not present
    or (AJSONValue is TJSONNull) // JSONNull
  then
    Exit(0);
  Result := StrToIntDef(AJSONValue.Value, 0);
end;

class function TdjEngineDOM.DeserializeInterface(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
  AMasterObj: TObject; const AParams: IdjParams): TValue;
var
  LChildObj: TObject;
  LJustCreated: Boolean;
begin
  // Init
  LChildObj := nil;
  LJustCreated := False;
  // If the Property/Field is valid then try to get the value (Object) from the
  // master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TdjDuckPropField.IsValidPropField(APropField) then
      LChildObj := TdjRTTI.TValueToObject(TdjDuckPropField.GetValue(AMasterObj, APropField))
    else
      LChildObj := AMasterObj;
  // If the LChildObj is not assigned and the AValueType is assigned then
  // create the LChildObj of the type specified by the AValueType parameter,
  // PS: normally used by DeserializeList or other collection deserialization
  if Assigned(AValueType) and (not Assigned(LChildObj)) and (not AParams.TypeAnnotations) then
  begin
    LChildObj := TdjRTTI.CreateObject(AValueType.QualifiedName);
    LJustCreated := True;
  end;
  // Deserialize
  DeserializeClassCommon(LChildObj, AJSONValue, APropField, AParams);
  // Make the result TValue
  // NB: If the MasterObj is assigned return an empty TValue because if the
  // deserialized object is a detail of a MasterObject the creation of the
  // child object is responsibility of the Master object itself, so the
  // child object is already assigned to the master object property.
  // if Assigned(AMasterObj) then
  // Code modified to resolve the issue of Maxim Sysoev when trying to deserialize
  // an instance of a class like TMyClass<T> where T maybe every type (no constraint)
  // and the class don't create itself the internal field of type <T> (when T is a class).
  if (Assigned(AMasterObj) and not Assigned(LChildObj)) or not LJustCreated then
    Result := TValue.Empty
  else
    TValue.Make(@LChildObj, LChildObj.ClassInfo, Result);
end;

class procedure TdjEngineDOM.DeserializeList(const ADuckList: IdjDuckList; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LListTypeName, LValueQualifiedTypeName: String;
  LJSONObject: TJSONObject;
  LJSONValue, LValueJSONValue: TJSONValue;
  LJSONArray: TJSONArray;
  LValueRTTIType: TRttiType;
  I: Integer;
  LValue: TValue;
begin
  // Checks
  if (not Assigned(AJSONValue)) or (AJSONValue is TJSONNull) then
    Exit;
  // Defaults
  LListTypeName := '';
  LValueQualifiedTypeName := '';
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  // else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if not(AJSONValue is TJSONObject) then
      raise EdjEngineError.Create('Wrong serialization for ' + ADuckList.DuckObjQualifiedName);
    LJSONObject := AJSONValue as TJSONObject;
    // Get the collection class
    LJSONValue := LJSONObject.GetValue(DJ_TYPENAME);
    if Assigned(LJSONValue) then
      LListTypeName := LJSONValue.Value;
    // Get the value type name
    LJSONValue := LJSONObject.GetValue(DJ_VALUE);
    if Assigned(LJSONValue) then
      LValueQualifiedTypeName := LJSONValue.Value;
    // Get the items array
    LJSONValue := LJSONObject.Get('items').JsonValue;
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if not(LJSONValue is TJSONArray) then
    raise EdjEngineError.Create('Cannot restore the list because the related JSONValue is not an array');
  LJSONArray := TJSONArray(LJSONValue);
  // Get values RttiType, if the RttiType is not found then check for
  // "djItemsType" attribute or from PARAMS, If it still has not been found
  // then get the type directly from the DuckTypedList
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);

  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := ADuckList.GetItemQualifiedTypeName;

  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);

  if (not Assigned(LValueRTTIType)) and (LJSONArray.Count > 0) then
    raise EdjEngineError.Create('Value type not found deserializing a List');
  // ------------
  // Clear the collection
  if AParams.ClearCollection then
    ADuckList.Clear;
  // Loop
  for I := 0 to LJSONArray.Count - 1 do
  begin
    // Extract the current element
    LValueJSONValue := LJSONArray.Items[I];
    // Deserialize the current element
    LValue := DeserializePropField(LValueJSONValue, LValueRTTIType, APropField, nil, AParams);
    // Add to the list
    ADuckList.AddValue(LValue);
  end;
end;

class function TdjEngineDOM.DeserializePropField(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMaster: TValue; const AParams: IdjParams): TValue;
var
  LJSONValue: TJSONValue;
  LValueQualifiedTypeName: String;
  LValueType: TRttiType;
  LdsonTypeAttribute: djTypeAttribute;
begin
  // Init
  Result := TValue.Empty;
  // ---------------------------------------------------------------------------
  // Determina il ValueType del valore/oggetto corrente
  // NB: If TypeAnnotations is enabled and a TypeAnnotation is present in the AJSONValue for the current
  // value/object then load and use it as AValueType
  // NB: Ho aggiunto questa parte perchè altrimenti in caso di una lista di interfacce (es: TList<IPerson>)
  // NB. Se alla fine del blocco non trova un ValueTypeValido allora usa quello ricevuto come parametro
  LValueQualifiedTypeName := String.Empty;
  // Non deve considerare i TValue
  if not(Assigned(AValueType) and (AValueType.Name = 'TValue')) then
  begin
    // Cerca il ValueType in una eventuale JSONAnnotation
    if AParams.TypeAnnotations and (AJSONValue is TJSONObject) then
    begin
      LJSONValue := TJSONObject(AJSONValue).GetValue(DJ_TYPENAME);
      if Assigned(LJSONValue) then
        LValueQualifiedTypeName := LJSONValue.Value;
    end;
    // Se ancora non è stato determinato il ValueType prova anche a vedere se  stato specificato
    // l'attributo dsonTypeAttribute
    if LValueQualifiedTypeName.IsEmpty and Assigned(APropField) and TdjDuckPropField.IsNotAnArray(APropField)
    // Evita gli array altrimenti da un errore la condizione successiva perchà il qualified degli array non va bene
      and (TdjDuckPropField.QualifiedName(APropField) = AValueType.QualifiedName)
    // Questo per evitare che nel caso delle liste anche le items vedano l'attributo dsonTypeAttribute della proprietà a cui ri riferisce la lista stessa
      and TdjRTTI.HasAttribute<djTypeAttribute>(APropField, LdsonTypeAttribute) then
      LValueQualifiedTypeName := LdsonTypeAttribute.QualifiedName;
  end;
  // NB. Se alla fine del blocco non trova un ValueTypeValido allora usa quello ricevuto come parametro
  if LValueQualifiedTypeName.IsEmpty then
    LValueType := AValueType
  else
    LValueType := TdjRTTI.QualifiedTypeNameToRttiTypeWithDefault(LValueQualifiedTypeName, AValueType);
  // ---------------------------------------------------------------------------
  // If a custom serializer exists for the current type then use it
  if AParams.EnableCustomSerializers and DeserializeCustom(AJSONValue, LValueType, APropField, AMaster, AParams, Result) then
    Exit;
  // Deserialize by TypeKind
  case LValueType.TypeKind of
    tkEnumeration:
      Result := DeserializeEnumeration(AJSONValue, LValueType);
    tkInteger, tkInt64:
      Result := DeserializeInteger(AJSONValue);
    tkFloat:
      Result := DeserializeFloat(AJSONValue, LValueType, AParams);
    tkString, tkLString, tkWString, tkUString:
      Result := DeserializeString(AJSONValue);
    tkChar, tkWChar:
      Result := DeserializeChar(AJSONValue);
    tkRecord:
      Result := DeserializeRecord(AJSONValue, LValueType, APropField, AParams);
    tkClass:
      Result := DeserializeClass(AJSONValue, LValueType, APropField, AMaster.AsObject, AParams);
    tkInterface:
      Result := DeserializeInterface(AJSONValue, LValueType, APropField, AMaster.AsObject, AParams);
    tkArray, tkDynArray:
      Result := DeserializeArray(AJSONValue, APropField, AMaster, AParams);
  end;
end;

class function TdjEngineDOM.DeserializeRecord(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AParams: IdjParams): TValue;
var
  LQualifiedTypeName: String;
begin
  LQualifiedTypeName := AValueType.QualifiedName;
  // TTimeStamp
  if LQualifiedTypeName = 'System.SysUtils.TTimeStamp' then
  begin
    if (not Assigned(AJSONValue)) or (AJSONValue is TJSONNull) then // JSONKey not present
      Exit(TValue.From<TTimeStamp>(MSecsToTimeStamp(0)));
    Result := TValue.From<TTimeStamp>(MSecsToTimeStamp((AJSONValue as TJSONNumber).AsInt64));
  end
  // TValue
  else if LQualifiedTypeName = 'System.Rtti.TValue' then
  begin
    Result := DeserializeTValue(AJSONValue, APropField, AParams);
  end
  else
  begin
    raise Exception.Create('TdjEngineDOM.DeserializeRecord: Unknown LQualifiedTypeName.');
  end;
end;

class procedure TdjEngineDOM.DeserializeStream(AStream: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject);
var
  LStreamASString: string;
  LdsonEncodingAttribute: djEncodingAttribute;
  LEncoding: TEncoding;
  LStringStream: TStringStream;
  LStreamWriter: TStreamWriter;
begin
  // Checks
  if (not Assigned(AJSONValue)) or (AJSONValue is TJSONNull) then
    Exit;
  // Get the stream as string from the JSONValue
  if AJSONValue is TJSONString then
    LStreamASString := TJSONString(AJSONValue).Value
  else
    raise EdjEngineError.Create('Deserialize Class: Expected JSONString in the received JSONValue.');
  // If the "dsonEncodingAtribute" is specified then use that encoding
  if TdjRTTI.HasAttribute<djEncodingAttribute>(APropField, LdsonEncodingAttribute) then
  begin
    // -------------------------------------------------------------------------
    TStream(AStream).Position := 0;
    LEncoding := TEncoding.GetEncoding(LdsonEncodingAttribute.Encoding);
    LStringStream := TStringStream.Create(LStreamASString, LEncoding);
    try
      LStringStream.Position := 0;
      TStream(AStream).CopyFrom(LStringStream, LStringStream.Size);
    finally
      LStringStream.Free;
    end;
    // -------------------------------------------------------------------------
  end
  // Else if the atribute is not present then deserialize as base64 by default
  else
  begin
    // -------------------------------------------------------------------------
    TStream(AStream).Position := 0;
    LStreamWriter := TStreamWriter.Create(TStream(AStream));
    try
      LStreamWriter.Write(TNetEncoding.Base64.Decode(LStreamASString));
    finally
      LStreamWriter.Free;
    end;
    // -------------------------------------------------------------------------
  end;
end;

class procedure TdjEngineDOM.DeserializeStreamableObject(const ADuckStreamable: IdjDuckStreamable; const AJSONValue: TJSONValue;
  const APropField: TRttiNamedObject);
var
  LValueAsString: string;
  LStringStream: TStringStream;
  LMemoryStream: TMemoryStream;
begin
  // Checks
  if (not Assigned(AJSONValue)) or (AJSONValue is TJSONNull) then
    Exit;
  // Init
  LValueAsString := (AJSONValue as TJSONString).Value;
  LStringStream := TStringStream.Create;
  LMemoryStream := TMemoryStream.Create;
  try
    LStringStream.WriteString(LValueAsString);
    LStringStream.Position := 0;
    TNetEncoding.Base64.Decode(LStringStream, LMemoryStream);
    LMemoryStream.Position := 0;
    ADuckStreamable.LoadFromStream(LMemoryStream);
  finally
    LMemoryStream.Free;
    LStringStream.Free;
  end;
end;

class function TdjEngineDOM.DeserializeString(const AJSONValue: TJSONValue): TValue;
begin
  // If JSONNull or JSON non assigned then return 0
  if (not Assigned(AJSONValue)) // JSONKey not present
    or (AJSONValue is TJSONNull) // JSONNull
  then
    Exit('');
  Result := AJSONValue.Value;
end;

class function TdjEngineDOM.DeserializeTValue(const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue;
var
  LJObj: TJSONObject;
  LValueQualifiedTypeName: String;
  LValueRTTIType: TRttiType;
  LJSONValue: TJSONValue;
begin
  // Defaults
  LValueQualifiedTypeName := '';
  // If JSONValue not assigned
  if (not Assigned(AJSONValue)) or AJSONValue.Null then
    Exit(TValue.Empty);
  // If TypeAnnotations is true then get the "items" JSONArray containing che containing the list items
  // else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if not(AJSONValue is TJSONObject) then
      raise EdjEngineError.Create('Wrong serialization for TValue');
    // Extract the JSONObject from the received JSONValue
    LJObj := (AJSONValue as TJSONObject);
    // Get the value type name
    LJSONValue := LJObj.GetValue(DJ_TYPENAME);
    if Assigned(LJSONValue) then
      LValueQualifiedTypeName := LJSONValue.Value;
    // Extract the contained TValue value
    LJSONValue := LJObj.GetValue(DJ_VALUE);
  end
  else
    LJSONValue := AJSONValue;
  // Get values RttiType, if the RttiType is not found then check for
  // "dsonType" attribute
  TdjUtils.GetTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);
  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if not Assigned(LValueRTTIType) then
    raise EdjEngineError.Create('Value type not found deserializing a TValue');
  // Durante la serializzazione del TVAlue, se questo conteneva un oggetto/interfaccia
  // il serializzatore lo ha serializzato con il parametro "AUSeClassName = False" perchè
  // siccome la serializzazione del TValue inserisce anch'essa il QualifiedTypeName del
  // valore si sarebbe venuto a creare un doppione.
  // Per questo motivo ora inietto il QualifiedTypeName dell'oggetto da deserializzare
  // (se si tratta di un oggetto) nel JSONObject come se fosse stato originariamente inserito
  // dal "SerializeObject" in modo che il "DeserializeObject" lo possa trovare e utilizzare.
  if AParams.TypeAnnotations and ((LValueRTTIType.TypeKind = tkClass) or (LValueRTTIType.TypeKind = tkInterface)) then
    (LJSONValue as TJSONObject).AddPair(DJ_TYPENAME, LValueQualifiedTypeName);
  // Deserialize the value
  Result := DeserializePropField(LJSONValue, LValueRTTIType, APropField, nil, AParams);
end;

class function TdjEngineDOM.DeserializeObject(const AJSONBox: TJSONObject; AObject: TObject; const AParams: IdjParams): TObject;
var
  LPropField: System.Rtti.TRttiNamedObject;
  LPropsFields: TArray<System.Rtti.TRttiNamedObject>;
  LKeyName: String;
  LJSONClassName: TJSONString;
  LJSONValue: TJSONValue;
  LObjectIsValid: Boolean;
  LValue: TValue;
begin
  LObjectIsValid := Assigned(AObject);
  // If the AObject is not assigned then try to create the Object using the DMVC_ClassName value in the
  // JSONBox
  if not LObjectIsValid then
  begin
{$IF CompilerVersion <= 26}
    if Assigned(AJSONBox.Get(DSON_TYPENAME)) then
      LJSONClassName := AJSONBox.Get(DSON_TYPENAME).JsonValue as TJSONString
    else
      raise EdsonEngineError.CreateFmt('No $s property in the JSON object', [DSON_TYPENAME]);
{$ELSE}
    if not AJSONBox.TryGetValue<TJSONString>(DJ_TYPENAME, LJSONClassName) then
      raise EdjEngineError.CreateFmt('No $s property in the JSON object', [DJ_TYPENAME]);
{$ENDIF}
    AObject := TdjRTTI.CreateObject(LJSONClassName.Value);
  end;
  try
    // Get members list
    case AParams.SerializationType of
      stProperties:
        LPropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance.GetProperties));
      stFields:
        LPropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance.GetFields));
    end;
    // Loop for all members
    for LPropField in LPropsFields do
    begin
      // Check to continue or not
      if (not TdjDuckPropField.IsWritable(LPropField) and (TdjDuckPropField.RttiType(LPropField).TypeKind <> tkClass) and
        (TdjDuckPropField.RttiType(LPropField).TypeKind <> tkInterface)) or (AParams.IsToSkip(LPropField)) or
        (LPropField.Name = 'FRefCount') or (LPropField.Name = 'RefCount') or TdjUtils.IsPropertyToBeIgnored(LPropField, AParams) then
        Continue;
      // Get the JSONPair KeyName
      LKeyName := TdjUtils.GetKeyName(LPropField, AParams);
      // Check if JSONPair exists
      if Assigned(AJSONBox.Get(LKeyName)) then
        LJSONValue := AJSONBox.Get(LKeyName).JsonValue // as LJSONKeyIsNotPresent := False
      else
        LJSONValue := nil; // as LJSONKeyIsNotPresent := True
      // Deserialize the currente member and assign it to the object member
      LValue := DeserializePropField(LJSONValue, TdjDuckPropField.RttiType(LPropField), LPropField, AObject, AParams);
      if not LValue.IsEmpty then
        TdjDuckPropField.SetValue(AObject, LPropField, LValue, AParams);
    end;
    Result := AObject;
  except
    if not LObjectIsValid then
      FreeAndNil(AObject);
    raise;
  end;
end;

class function TdjEngineDOM.SerializeInterface(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue;
var
  AChildInterface: IInterface;
  AChildObj: TObject;
begin
  AChildInterface := AValue.AsInterface;
  AChildObj := AChildInterface as TObject;
  Result := SerializeClass(AChildObj, APropField, AParams);
end;

class procedure TdjEngineDOM.SerializeList(const ADuckList: IdjDuckList; const APropField: TRttiNamedObject; const AParams: IdjParams;
  out ResultJSONValue: TJSONValue);
var
  LValueQualifiedTypeName: String;
  LJSONArray: TJSONArray;
  I: Integer;
  LValue: TValue;
  LJSONValue: TJSONValue;
  LFirst: Boolean;
  LResultJSONObj: TJSONObject;
begin
  // Init
  LValueQualifiedTypeName := '';
  // Create the Items JSON array
  LJSONArray := TJSONArray.Create;
  // Loop for all objects in the list (now compatible with interfaces)
  LFirst := True;
  for I := 0 to ADuckList.Count - 1 do
  begin
    // Read values
    LValue := ADuckList.GetItemValue(I);
    // Serialize values
    LJSONValue := SerializePropField(LValue, APropField, AParams);
    // If first loop then add the type infos
    if AParams.TypeAnnotations and LFirst then
    begin
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
      LFirst := False;
    end;
    // Add the current element to the JSONArray
    LJSONArray.AddElement(LJSONValue);
  end;
  // If TypeAnnotations is enabled then return a JSONObject with ClassName and a JSONArray containing the list items
  // else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    LResultJSONObj := TJSONObject.Create;
    LResultJSONObj.AddPair(DJ_TYPENAME, ADuckList.DuckObjQualifiedName); // List typename
    LResultJSONObj.AddPair(DJ_VALUE, LValueQualifiedTypeName); // Items typename
    LResultJSONObj.AddPair('items', LJSONArray);
    ResultJSONValue := LResultJSONObj;
  end
  else
    ResultJSONValue := LJSONArray;
end;

class function TdjEngineDOM.Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean): String;
var
  LJSONValue: TJSONValue;
begin
  Result := '';
  LJSONValue := SerializePropField(AValue, APropField, AParams, AEnableCustomSerializers);
  try
    if Assigned(LJSONValue) then
      Result := LJSONValue.ToJSON
    else
      raise Exception.Create('Record type not (yet) supported');
  finally
    LJSONValue.Free;
  end;
end;

class function TdjEngineDOM.SerializeToJsonValue(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean): TJSONValue;
begin
  Result := SerializePropField(AValue, APropField, AParams, AEnableCustomSerializers);
end;

class function TdjEngineDOM.SerializeArray(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue;
var
  LValueQualifiedTypeName: String;
  LIndex: Integer;
  LValue: TValue;
  LJSONValue: TJSONValue;
  LJSONArray: TJSONArray;
  LFirst: Boolean;
  LResultJSONObj: TJSONObject;
begin
  // Init
  LJSONArray := TJSONArray.Create;
  // Loop for all array elements
  LFirst := True;
  for LIndex := 0 to AValue.GetArrayLength - 1 do
  begin
    // Get the current elemente of the array as TValue
    LValue := AValue.GetArrayElement(LIndex);
    // Serialize the current elemente
    LJSONValue := SerializePropField(LValue, APropField, AParams);
    // If first loop then add the type infos
    if AParams.TypeAnnotations and LFirst then
    begin
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
      LFirst := False;
    end;
    // Add the current element to the JSONArray
    LJSONArray.AddElement(LJSONValue);
  end;
  // If TypeAnnotations is enabled then return a JSONObject with ClassName and a JSONArray containing the list items
  // else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    LResultJSONObj := TJSONObject.Create;
    if not LValueQualifiedTypeName.IsEmpty then
      LResultJSONObj.AddPair(DJ_VALUE, LValueQualifiedTypeName);
    LResultJSONObj.AddPair('items', LJSONArray);
    Result := LResultJSONObj;
  end
  else
    Result := LJSONArray;
end;

class function TdjEngineDOM.SerializeChar(const AValue: TValue; const AParams: IdjParams): TJSONValue;
begin
  if AValue.AsString = #0 then
  begin
    if AParams.EmptyCharAsNull then
      Result := TJSONNull.Create
    else
      Result := TJSONString.Create('');
  end
  else
    Result := TJSONString.Create(AValue.AsString);
end;

class function TdjEngineDOM.SerializeClass(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue;
var
  AChildObj: TObject;
  LTypeInfoCacheItem: TdjTypeInfoCacheItem;
begin
  AChildObj := AValue.AsObject;
  if not Assigned(AChildObj) then
    Exit(TJSONNull.Create);
  LTypeInfoCacheItem := AParams.TypeInfoCache.Get(AValue.AsObject);
  case LTypeInfoCacheItem.DuckType of
    dtNone:
      begin
        if Assigned(AChildObj) then
          Result := SerializeObject(AChildObj, AParams);
      end;
    dtList:
      SerializeList(LTypeInfoCacheItem.DuckListWrapper, APropField, AParams, Result);
    dtStreamable:
      SerializeStreamableObject(LTypeInfoCacheItem.DuckStreamableWrapper, APropField, Result);
    dtDictionary:
      SerializeDictionary(LTypeInfoCacheItem.DuckDictionaryWrapper, APropField, AParams, Result);
    dtStream:
      SerializeStream(AChildObj, APropField, Result);
  end;
end;

class function TdjEngineDOM.SerializeCustom(AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams;
  out ResultJSONValue: TJSONValue): Boolean;
var
  LSerializer: TdjDOMCustomSerializerRef;
  LMapperCustomSerializer: djSerializerDOMAttribute;
  LJSONValue: TJSONValue;
  LJSONObj: TJSONObject;
  LObj: TObject;
begin
  // Init
  Result := False;
  // If the Value is an Interface type then convert it to real object class
  // type implementing the interface
  if AValue.Kind = tkInterface then
  begin
    LObj := AValue.AsInterface as TObject;
    TValue.Make(@LObj, LObj.ClassInfo, AValue);
  end;
  // Get custom serializer if exists else exit
  if AParams.Serializers.Exists_DOM(AValue.TypeInfo) then
    LSerializer := AParams.Serializers._GetSerializerItem(AValue.TypeInfo).DOMSerializer
  else if TdjRTTI.HasAttribute<djSerializerDOMAttribute>(TdjRTTI.TypeInfoToRttiType(AValue.TypeInfo), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit;
  // Serialize
  LJSONValue := LSerializer.Serialize(AValue);
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  // in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
  begin
    LJSONObj := TJSONObject.Create;
    LJSONObj.AddPair(DJ_TYPENAME, TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo));
    LJSONObj.AddPair(DJ_VALUE, LJSONValue);
    ResultJSONValue := LJSONObj;
  end
  else
    ResultJSONValue := LJSONValue;
  // All OK
  Result := True;
end;

class procedure TdjEngineDOM.SerializeDictionary(const ADuckDictionary: IdjDuckDictionary; const APropField: TRttiNamedObject; const AParams: IdjParams;
  out ResultJSONValue: TJSONValue);
var
  LJSONArray: TJSONArray;
  LResultJSONObj, CurrJSONObj: TJSONObject;
  LJSONKey, LJSONValue: TJSONValue;
  LFirst: Boolean;
  LKey, LValue: TValue;
  LKeyQualifiedTypeName, LValueQualifiedTypeName: String;
begin
  // Init
  LKeyQualifiedTypeName := '';
  LValueQualifiedTypeName := '';
  // Create the Items JSON array
  LJSONArray := TJSONArray.Create;
  // Loop
  LFirst := True;
  while ADuckDictionary.MoveNext do
  begin
    // Read values
    LKey := ADuckDictionary.GetCurrentKey;
    LValue := ADuckDictionary.GetCurrentValue;
    // Serialize values
    LJSONKey := SerializePropField(LKey, APropField, AParams);
    LJSONValue := SerializePropField(LValue, APropField, AParams);
    // If first loop then add the type infos
    if AParams.TypeAnnotations and LFirst then
    begin
      LKeyQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LKey.TypeInfo);
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
      LFirst := False;
    end;
    // Add the current element to the JSONArray
    CurrJSONObj := TJSONObject.Create;
    case AParams.SerializationMode of
      smJavaScript:
        begin
          if LJSONKey is TJSONString then
            CurrJSONObj.AddPair(LJSONKey.Value, LJSONValue)
          else
            CurrJSONObj.AddPair(LJSONKey.ToJSON, LJSONValue);
          LJSONKey.Free; // To avoid a memory leak
        end;
      smDataContract:
        begin
          CurrJSONObj.AddPair(DJ_KEY, LJSONKey);
          CurrJSONObj.AddPair(DJ_VALUE, LJSONValue)
        end;
    end;
    LJSONArray.AddElement(CurrJSONObj);
  end;
  // If AUseClassName is true then return a JSONObject with ClassName and a JSONArray containing the list items
  // else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    LResultJSONObj := TJSONObject.Create;
    LResultJSONObj.AddPair(DJ_TYPENAME, ADuckDictionary.DuckObjQualifiedName);
    if not LKeyQualifiedTypeName.IsEmpty then
      LResultJSONObj.AddPair(DJ_KEY, LKeyQualifiedTypeName);
    if not LValueQualifiedTypeName.IsEmpty then
      LResultJSONObj.AddPair(DJ_VALUE, LValueQualifiedTypeName);
    LResultJSONObj.AddPair('items', LJSONArray);
    ResultJSONValue := LResultJSONObj;
  end
  else
    ResultJSONValue := LJSONArray;
end;

class function TdjEngineDOM.SerializeEnumeration(const AValue: TValue): TJSONValue;
var
  LQualifiedTypeName: String;
begin
  // AQualifiedTypeName := TDuckPropField.QualifiedName(ARttiType);
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  if LQualifiedTypeName = 'System.Boolean' then
  begin
    if AValue.AsBoolean then
      Result := TJSONTrue.Create
    else
      Result := TJSONFalse.Create;
  end
  else
  begin
    Result := TJSONNumber.Create(AValue.AsOrdinal);
  end;
end;

class function TdjEngineDOM.SerializeFloat(const AValue: TValue; const AParams: IdjParams): TJSONValue;
var
  LQualifiedTypeName: String;
begin
  // AQualifiedTypeName := TDuckPropField.QualifiedName(ARttiType);
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  if LQualifiedTypeName = 'System.TDate' then
  begin
    if AValue.AsExtended = 0 then
      Result := TJSONNull.Create
    else
      Result := TJSONString.Create(TdjUtils.ISODateToString(AValue.AsExtended, AParams))
  end
  else if LQualifiedTypeName = 'System.TDateTime' then
  begin
    if AValue.AsExtended = 0 then
      Result := TJSONNull.Create
    else
      Result := TJSONString.Create(TdjUtils.ISODateTimeToString(AValue.AsExtended, AParams))
  end
  else if LQualifiedTypeName = 'System.TTime' then
    Result := TJSONString.Create(TdjUtils.ISOTimeToString(AValue.AsExtended, AParams))
  else
    Result := TJSONNumber.Create(AValue.AsExtended);
end;

class function TdjEngineDOM.SerializeInteger(const AValue: TValue): TJSONValue;
begin
  Result := TJSONNumber.Create(AValue.AsInteger)
end;

class function TdjEngineDOM.SerializeObject(const AObject: TObject; const AParams: IdjParams): TJSONObject;
var
  LPropField: System.Rtti.TRttiNamedObject;
  LPropsFields: TArray<System.Rtti.TRttiNamedObject>;
  LKeyName: String;
  LJSONValue: TJSONValue;
  LValue: TValue;
begin
  Result := TJSONObject.Create;
  try
    // add the $dmvc.classname property to allows a strict deserialization
    if AParams.TypeAnnotations then
      Result.AddPair(DJ_TYPENAME, AObject.QualifiedClassName);
    // Get members list
    case AParams.SerializationType of
      stProperties:
        LPropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance.GetProperties));
      stFields:
        LPropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance.GetFields));
    end;
    // Loop for all members
    for LPropField in LPropsFields do
    begin
      // Skip the RefCount
      if (LPropField.Name = 'FRefCount') or (LPropField.Name = 'RefCount') then
        Continue;
      // f := LowerCase(_property.Name);
      LKeyName := TdjUtils.GetKeyName(LPropField, AParams);
      // Check for "DoNotSerializeAttribute" or property to ignore
      if (AParams.IsToSkip(LPropField)) or TdjUtils.IsPropertyToBeIgnored(LPropField, AParams) then
        Continue;
      // Serialize the currente member and add it to the JSONBox
      LValue := TdjDuckPropField.GetValue(AObject, LPropField);
      LJSONValue := SerializePropField(LValue, LPropField, AParams);
      Result.AddPair(LKeyName, LJSONValue);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TdjEngineDOM.SerializeObject(const AInterfacedObject: IInterface; const AParams: IdjParams): TJSONObject;
begin
  Result := SerializeObject(AInterfacedObject as TObject, AParams);
end;

class function TdjEngineDOM.SerializePropField(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean): TJSONValue;
begin
  // If a custom serializer exists for the current type then use it
  if AEnableCustomSerializers and AParams.EnableCustomSerializers and SerializeCustom(AValue, APropField, AParams, Result) then
    Exit;
  // Standard serialization by TypeKind
  // case TDuckPropField.TypeKind(ARttiType) of
  case AValue.Kind of
    tkInteger, tkInt64:
      Result := SerializeInteger(AValue);
    tkFloat:
      Result := SerializeFloat(AValue, AParams);
    tkString, tkLString, tkWString, tkUString:
      Result := SerializeString(AValue, AParams);
    tkChar, tkWChar:
      Result := SerializeChar(AValue, AParams);
    tkEnumeration:
      Result := SerializeEnumeration(AValue);
    tkRecord:
      Result := SerializeRecord(AValue, APropField, AParams);
    tkClass:
      Result := SerializeClass(AValue, APropField, AParams);
    tkInterface:
      Result := SerializeInterface(AValue, APropField, AParams);
    tkArray, tkDynArray:
      Result := SerializeArray(AValue, APropField, AParams);
  end;
end;

class function TdjEngineDOM.SerializeRecord(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue;
var
  ts: TTimeStamp;
  LQualifiedTypeName: String;
begin
  Result := nil;
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  // TTimeStamp
  if LQualifiedTypeName = 'System.SysUtils.TTimeStamp' then
  begin
    ts := AValue.AsType<System.SysUtils.TTimeStamp>;
    Result := TJSONNumber.Create(TimeStampToMsecs(ts));
  end
  // TValue
  else if LQualifiedTypeName = 'System.Rtti.TValue' then
  begin
    Result := SerializeTValue(AValue.AsType<TValue>, APropField, AParams);
  end;
end;

class procedure TdjEngineDOM.SerializeStream(const AStream: TObject; const APropField: TRttiNamedObject; out ResultJSONValue: TJSONValue);
var
  LdsonEncodingAttribute: djEncodingAttribute;
  LEncoding: TEncoding;
  LStringStream: TStringStream;
begin
  // If the "dsonEncodingAtribute" is specified then use that encoding
  if TdjRTTI.HasAttribute<djEncodingAttribute>(APropField, LdsonEncodingAttribute) then
  begin
    // -------------------------------------------------------------------------
    TStream(AStream).Position := 0;
    LEncoding := TEncoding.GetEncoding(LdsonEncodingAttribute.Encoding);
    LStringStream := TStringStream.Create('', LEncoding);
    try
      LStringStream.LoadFromStream(TStream(AStream));
      ResultJSONValue := TJSONString.Create(LStringStream.DataString);
    finally
      LStringStream.Free;
    end;
    // -------------------------------------------------------------------------
  end
  // Else if the atribute is not present then serialize as base64 by default
  else
  begin
    // -------------------------------------------------------------------------
    TStream(AStream).Position := 0;
    LStringStream := TStringStream.Create;
    try
      TNetEncoding.Base64.Encode(TStream(AStream), LStringStream);
      ResultJSONValue := TJSONString.Create(LStringStream.DataString);
    finally
      LStringStream.Free;
    end;
    // -------------------------------------------------------------------------
  end;
end;

class procedure TdjEngineDOM.SerializeStreamableObject(const ADuckStreamable: IdjDuckStreamable; const APropField: TRttiNamedObject;
  out ResultJSONValue: TJSONValue);
var
  LMemoryStream: TMemoryStream;
  LStringStream: TStringStream;
begin
  // Init
  LMemoryStream := TMemoryStream.Create;
  LStringStream := TStringStream.Create;
  try
    ADuckStreamable.SaveToStream(LMemoryStream);
    LMemoryStream.Position := 0;
    TNetEncoding.Base64.Encode(LMemoryStream, LStringStream);
    ResultJSONValue := TJSONString.Create(LStringStream.DataString);
  finally
    LMemoryStream.Free;
    LStringStream.Free;
  end;
end;

class function TdjEngineDOM.SerializeString(const AValue: TValue; const AParams: IdjParams): TJSONValue;
begin
  if AValue.AsString.IsEmpty and AParams.EmptyStringAsNull then
    Result := TJSONNull.Create
  else
    Result := TJSONString.Create(AValue.AsString);
end;

class function TdjEngineDOM.SerializeTValue(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TJSONValue;
var
  LTypeJSONValue, LJSONValue: TJSONValue;
  JObj: TJSONObject;
  LRttiType: TRttiType;
begin
  // If the TValue is empty then return a TJSONNull and exit
  if AValue.IsEmpty then
    Exit(TJSONNull.Create);
  // Init
  LRttiType := TdjRTTI.TypeInfoToRttiType(AValue.TypeInfo);
  // Serialize the value
  LJSONValue := SerializePropField(AValue, APropField, AParams);
  // Add the qualified type name if enabled
  if AParams.TypeAnnotations then
  begin
    // Prepare an empty JSONObject;
    JObj := TJSONObject.Create;
    Result := JObj;
    // Extract the qualified type name of the value
    if (LRttiType.TypeKind = tkClass) or (LRttiType.TypeKind = tkInterface) then
      LTypeJSONValue := (LJSONValue as TJSONObject).RemovePair(DJ_TYPENAME).JsonValue
    else
      LTypeJSONValue := SerializeString(LRttiType.QualifiedName, AParams);
    // Set the TValue qualified type name
    JObj.AddPair(DJ_TYPENAME, LTypeJSONValue);
    // Set the TValue value
    JObj.AddPair(DJ_VALUE, LJSONValue);
  end
  else
    // Set the TValue value
    Result := LJSONValue;
end;

end.
