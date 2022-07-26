{***************************************************************************}
{                                                                           }
{           DJSON - (Delphi JSON library)                                   }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/DSON.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of DJSON (Delphi JSON library).                        }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  DJSON is free software: you can redistribute it and/or modify            }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  DJSON is distributed in the hope that it will be useful,                 }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with DJSON.  If not, see <http://www.gnu.org/licenses/>.           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This project is based off of the ObjectsMappers unit included with the   }
{  Delphi MVC Framework project by Daniele Teti and the DMVCFramework Team. }
{                                                                           }
{***************************************************************************}





unit DJSON.Engine.Stream;

interface

uses
{$REGION 'System'}
  System.Rtti,
  System.Classes,
  System.JSON.Readers,
  System.JSON.Writers,
{$ENDREGION}
{$REGION 'DJSON'}
  DJSON.Params,
  DJSON.Duck.Interfaces
{$ENDREGION}
;

type

  TdjEngineStream = class(TdjEngineIntf)
  protected
    // Serializers
    class procedure SerializePropField(const AJSONWriter: TJSONWriter; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True); static;
    class procedure SerializeFloat(const AJSONWriter: TJSONWriter; const AValue: TValue; const AParams: IdjParams); static;
    class procedure SerializeEnumeration(const AJSONWriter: TJSONWriter; const AValue: TValue); static;
    class procedure SerializeString(const AJSONWriter: TJSONWriter; const AValue: TValue; const AParams: IdjParams); static;
    class procedure SerializeChar(const AJSONWriter: TJSONWriter; const AValue: TValue; const AParams: IdjParams); static;
    class procedure SerializeRecord(const AJSONWriter: TJSONWriter; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeArray(const AJSONWriter: TJSONWriter; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeClass(const AJSONWriter: TJSONWriter; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeInterface(const AJSONWriter: TJSONWriter; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeObject(const AJSONWriter: TJSONWriter; const AObject: TObject; const AParams: IdjParams); overload; static;
    class procedure SerializeObject(const AJSONWriter: TJSONWriter; const AInterfacedObject: IInterface; const AParams: IdjParams); overload; static;
    class procedure SerializeTValue(const AJSONWriter: TJSONWriter; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeList(const AJSONWriter: TJSONWriter; const ADuckList: IdjDuckList; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeDictionary(const AJSONWriter: TJSONWriter; const ADuckDictionary: IdjDuckDictionary; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeStreamableObject(const AJSONWriter: TJSONWriter; const ADuckStreamable:IdjDuckStreamable; const APropField: TRttiNamedObject); static;
    class procedure SerializeStream(const AJSONWriter: TJSONWriter; const AStream: TObject; const APropField: TRttiNamedObject); static;
    class function SerializeCustom(const AJSONWriter: TJSONWriter; AValue:TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): Boolean; static;
    // Deserializers
    class function DeserializePropField(const AJSONReader: TJSONReader; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; static;
    class function DeserializeFloat(const AJSONReader: TJSONReader; const AValueType: TRttiType; const AParams:IdjParams): TValue; static;
    class function DeserializeEnumeration(const AJSONReader: TJSONReader; const AValueType: TRttiType): TValue; static;
    class function DeserializeChar(const AJSONReader: TJSONReader): TValue; static;
    class function DeserializeRecord(const AJSONReader: TJSONReader; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
    class function DeserializeArray(const AJSONReader: TJSONReader; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; static;
    class procedure DeserializeClassCommon(var AChildObj: TObject; const AJSONReader: TJSONReader; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class function DeserializeClass(const AJSONReader: TJSONReader; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
    class function DeserializeInterface(const AJSONReader: TJSONReader; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
    class procedure DeserializeObject(const AJSONReader: TJSONReader; AObject:TObject; const AParams: IdjParams); static;
    class function DeserializeTValue(const AJSONReader: TJSONReader; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
    class procedure DeserializeList(const ADuckList: IdjDuckList; const AJSONReader: TJSONReader; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary; const AJSONReader: TJSONReader; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeStreamableObject(const ADuckStreamable:IdjDuckStreamable; const AJSONReader: TJSONReader; const APropField: TRttiNamedObject); static;
    class procedure DeserializeStream(AStream: TObject; const AJSONReader: TJSONReader; const APropField: TRttiNamedObject); static;
    class function DeserializeCustom(const AJSONReader: TJSONReader; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMasterObj: TObject; const AParams: IdjParams; out ResultValue:TValue): Boolean; static;
    // Other
    class function TryGetTypeAnnotation(const AJSONReader: TJSONReader; const ATypeAnnotationName:String; var ResultTypeAnnotationValue:String): Boolean;
    class function CheckForEndObjectCharIfTypeAnnotations(const AJSONReader: TJSONReader; const AParams: IdjParams): Boolean;
  public
    class function Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True): String; override;
    class function Deserialize(const AJSONText:String; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; override;
  end;

implementation

uses
{$REGION 'System'}
  System.SysUtils,
  System.JSON.Types,
  System.JSON.BSON,
  System.NetEncoding,
{$ENDREGION}
{$REGION 'DJSON'}
  DJSON.Constants,
  DJSON.Duck.PropField,
  DJSON.Utils.RTTI,
  DJSON.Attributes,
  DJSON.Exceptions,
  DJSON.Utils,
  DJSON.Factory,
  DJSON.TypeInfoCache,
  DJSON.Serializers;
{$ENDREGION}

{ TdjEngineStream }

class function TdjEngineStream.CheckForEndObjectCharIfTypeAnnotations(
  const AJSONReader: TJSONReader; const AParams: IdjParams): Boolean;
begin
  Result := False;
  if AParams.TypeAnnotations then
  begin
    AJSONReader.Read;
    if AJSONReader.TokenType = TJsonToken.EndObject then
    begin
    { TODO : Risistemare }
    //      AJSONReader.Read
    end
    else
      Exit(True);
  end;
end;

class function TdjEngineStream.Deserialize(const AJSONText: String;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMaster: TValue; const AParams: IdjParams): TValue;
var
  LStringReader: TStringReader;
  LJSONReader: TJSONTextReader;
begin
  inherited;
  Result := TValue.Empty;
  LStringReader := TStringReader.Create(AJSONText);
  LJSONReader := TJsonTextReader.Create(LStringReader);
  try
    if LJSONReader.Read then
      Result := DeserializePropField(LJSONReader, AValueType, APropField, AMaster, AParams);
  finally
    LJSONReader.Free;
    LStringReader.Free;
  end;
end;

class function TdjEngineStream.DeserializeArray(const AJSONReader: TJSONReader;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMaster: TValue; const AParams: IdjParams): TValue;
var
  LValueQualifiedTypeName: String;
  LValueRTTIType: TRttiType;
  LValue: TValue;
  I: Integer;
  IsDynArray: Boolean;
  PArray: Pointer;
begin
  // Defaults
  LValueQualifiedTypeName := '';
  // If the Property/Field is valid then try to get the value (Object) from the
  //  master object else the MasterObject itself is the destination of the deserialization
  Result := nil;
  if (not AMaster.IsEmpty)
  and AMaster.IsObject
  and TdjDuckPropField.IsValidPropField(APropField) then
    Result := TdjDuckPropField.GetValue(AMaster.AsObject, APropField)
  else
    Result := AMaster;
  // If TypeAnnotations is enabled then get the "items" JSONArray containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    // Get the value type name (collection TypeName already retrieved by DeserializePropField)
    TryGetTypeAnnotation(AJSONReader, DJ_VALUE, LValueQualifiedTypeName);
    // The current token must be a property name named 'items'
    if not ((AJSONReader.TokenType = TJSONToken.PropertyName) and (AJSONReader.Value.AsString = 'items')) then
      raise EdjEngineError.Create('"items" property expected(TypeAnnotations enabled).');
    AJSONReader.Read;
  end;
  // Now a JSONArray must be present
  if AJSONReader.TokenType <> TJsonToken.StartArray then
    raise EdjEngineError.Create('JSONArray expected.');
  AJSONReader.Read;
  // Get values RttiType, if the RttiType is not found then check for
  //  "djItemsType" attribute or from PARAMS, If it still has not been found
  //  then get the type directly from the DuckTypedList
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);

  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := TdjRTTI.GetItemsQualifiedTypeNameFromArrayTypeInfo(Result.TypeInfo);

  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if (not Assigned(LValueRTTIType)) and (AJSONReader.TokenType <> TJsonToken.EndArray) then
    raise EdjEngineError.Create('Value type not found deserializing an array');
  // ------------
  // Loop
  IsDynArray := (Result.Kind = tkDynArray);
  I := 1;
  repeat
    // If the current JSONToken is an EndArray token then exit from the loop
    if (AJSONReader.TokenType = TJSONToken.EndArray) then
      Break;
    // Deserialize the current element
    LValue := DeserializePropField(AJSONReader, LValueRttiType, APropField, nil, AParams);
    // If it is a dynamic array set the length (one by one)
    if IsDynArray then
    begin
      PArray := Result.GetReferenceToRawData;
      DynArraySetLength(PPointer(PArray)^, Result.TypeInfo, 1, @I);  // Monodimensional array only (1)
    end;
    // Add to the array
    Result.SetArrayElement(I-1, LValue);
    // Increment the index
    inc(I);
  until not AJSONReader.Read;
  // If TypeAnnotations is enabled then e "CloseObject" char is expected
  if CheckForEndObjectCharIfTypeAnnotations(AJSONReader, AParams) then
    raise EdjEngineError.Create('EndObject char expected (TypeAnnotations enabled).');
end;

class function TdjEngineStream.DeserializeChar(
  const AJSONReader: TJSONReader): TValue;
begin
  // If Null or empty value
  if (AJSONReader.TokenType = TJsonToken.Null)
  or (AJSONReader.Value.AsString.IsEmpty)
  then
    Exit(#0);
  Result := AJSONReader.Value;
end;

class function TdjEngineStream.DeserializeClass(const AJSONReader: TJSONReader;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  AMasterObj: TObject; const AParams: IdjParams): TValue;
var
  LChildObj: TObject;
  LJustCreated: Boolean;
begin
  // Init
  LChildObj := nil;
  LJustCreated := False;
  // If the Property/Field is valid then try to get the value (Object) from the
  //  master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TdjDuckPropField.IsValidPropField(APropField) then
      LChildObj := TdjRTTI.TValueToObject(   TdjDuckPropField.GetValue(AMasterObj, APropField)   )
    else
      LChildObj := AMasterObj;
  // If the LChildObj is not assigned and the AValueType is assigned then
  //  create the LChildObj of the type specified by the AValueType parameter,
  //  PS: normally used by DeserializeList or other collection deserialization
  if Assigned(AValueType) and (not Assigned(LChildObj)) then // and (not AParams.TypeAnnotations) then
  begin
    LChildObj := TdjRTTI.CreateObject(AValueType);
    LJustCreated := True;
  end;
  // Deserialize
  DeserializeClassCommon(LChildObj, AJSONReader, APropField, AParams);
  // Make the result TValue
  //  NB: If the MasterObj is assigned return an empty TValue because if the
  //       deserialized object is a detail of a MasterObject the creation of the
  //       child object is responsibility of the Master object itself, so the
  //       child object is already assigned to the master object property.
//  if Assigned(AMasterObj) then
  // Code modified to resolve the issue of Maxim Sysoev when trying to deserialize
  //  an instance of a class like TMyClass<T> where T maybe every type (no constraint)
  //  and the class don't create itself the internal field of type <T> (when T is a class).
  if (Assigned(AMasterObj) and not Assigned(LChildObj))
  or not LJustCreated
  then
    Result := TValue.Empty
  else
    TValue.Make(@LChildObj, LChildObj.ClassInfo, Result);
end;

class procedure TdjEngineStream.DeserializeClassCommon(var AChildObj: TObject;
  const AJSONReader: TJSONReader; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LTypeInfoCacheItem: TdjTypeInfoCacheItem;
begin
  // Some checks
//  if (AJSONValue = nil) or (AJSONValue is TJSONNull) then
  if (AJSONReader.TokenType = TJsonToken.Null) then
    Exit;
  // Get the TypeInfoCache for the current object then deserialize it property
  LTypeInfoCacheItem := AParams.TypeInfoCache.Get(AChildObj);
  case LTypeInfoCacheItem.DuckType of
    dtNone:
    begin
      if (AJSONReader.TokenType <> TJsonToken.Null) then
        DeserializeObject(AJSONReader, AChildObj, AParams)
      // If the JSONValue is a TJSONNull (Mauri 19/04/2020: Non fa più il FreeAndNil perchè in alcuni casi era un problema)
      else if (AJSONReader.TokenType = TJsonToken.Null) then
//        FreeAndNil(AChildObj)
      // Raise an exception
      else
        raise EdjEngineError.Create('Deserialize Class: Cannot deserialize as object.');
    end;
    dtList:
      DeserializeList(LTypeInfoCacheItem.DuckListWrapper, AJSONReader, APropField, AParams);
    dtStreamable:
      DeserializeStreamableObject(LTypeInfoCacheItem.DuckStreamableWrapper, AJSONReader, APropField);
    dtDictionary:
      DeserializeDictionary(LTypeInfoCacheItem.DuckDictionaryWrapper, AJSONReader, APropField, AParams);
    dtStream:
      DeserializeStream(AChildObj, AJSONReader, APropField);
  end;
end;

class function TdjEngineStream.DeserializeCustom(const AJSONReader: TJSONReader;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMasterObj: TObject; const AParams: IdjParams;
  out ResultValue: TValue): Boolean;
var
  LSerializer: TdjStreamCustomSerializerRef;
  LMapperCustomSerializer: djSerializerStreamAttribute;
  LExistingValue: TValue;
  LObj: TObject;
begin
  // Init
  Result := False;
  LExistingValue := nil;
  // If the Property/Field is valid then try to get the value (Object) from the
  //  master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TdjDuckPropField.IsValidPropField(APropField) then
      LExistingValue := TdjDuckPropField.GetValue(AMasterObj, APropField)
    else
      TValue.Make(@AMasterObj, AMasterObj.ClassInfo, LExistingValue);
  // If the Value is an Interface type then convert it to real object class
  //  type implementing the interface
  if (AValueType.TypeKind = tkInterface) and not LExistingValue.IsEmpty then
  begin
    LObj := LExistingValue.AsInterface as TObject;
    TValue.Make(@LObj, LObj.ClassInfo, LExistingValue);
  end;
  // Get custom serializer if exists
  if AParams.Serializers.Exists_Stream(AValueType.Handle) then
    LSerializer := AParams.Serializers._GetSerializerItem(AValueType.Handle).StreamSerializer
  else
  if TdjRTTI.HasAttribute<djSerializerStreamAttribute>(TdjRTTI.TypeInfoToRttiType(AValueType.Handle), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit;
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  //  in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
  begin
    if not ((AJSONReader.TokenType = TJsonToken.PropertyName) and (AJSONReader.Value.AsString = DJ_VALUE) and AJSONReader.Read) then
      raise EdjEngineError.Create('TdjEngineStream: "' + DJ_VALUE + '" property name expected (DeserializeCustom, TypesAnnotationsON).');
  end;
  // Deserialize
  ResultValue := LSerializer.Deserialize(AJSONReader, LExistingValue);
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  //  in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
    AJSONReader.Read;  // Skip the EndObject
  // All Ok
  Result := True;
end;

class procedure TdjEngineStream.DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary;
  const AJSONReader: TJSONReader; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LKeyQualifiedTypeName, LValueQualifiedTypeName: String;
  LKeyRttiType, LValueRTTIType: TRttiType;
  LKey, LValue: TValue;
begin
  // Defaults
  LKeyQualifiedTypeName   := '';
  LValueQualifiedTypeName := '';
  // If TypeAnnotations is enabled then get the "items" JSONArray containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    // Get the key type name (collection TypeName already retrieved by DeserializePropField)
    TryGetTypeAnnotation(AJSONReader, DJ_KEY, LKeyQualifiedTypeName);
    // Get the value type name
    TryGetTypeAnnotation(AJSONReader, DJ_VALUE, LValueQualifiedTypeName);
    // The current token must be a property name named 'items'
    if not ((AJSONReader.TokenType = TJSONToken.PropertyName) and (AJSONReader.Value.AsString = 'items')) then
      raise EdjEngineError.Create('"items" property expected for (TypeAnnotations enabled).');
    AJSONReader.Read;
  end;
  // Now a JSONArray must be present
  if AJSONReader.TokenType <> TJsonToken.StartArray then
    raise EdjEngineError.Create('JSONArray expected.');
  AJSONReader.Read;
  // Get values RttiType, if the RttiType is not found then check for
  //  "MapperItemsClassType"  or "MapperItemsType" attribute or from PARAMS
  //  PS: If the current JSONToken is EndArray then the collection is empty
  //       and then then ValueTypeChecknot is not necessary.
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LKeyQualifiedTypeName, LValueQualifiedTypeName);

  if LKeyQualifiedTypeName.IsEmpty then
    LKeyQualifiedTypeName := ADuckDictionary.GetKeyQualifiedTypeName;
  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := ADuckDictionary.GetValueQualifiedTypeName;

  LKeyRttiType   := TdjRTTI.QualifiedTypeNameToRttiType(LKeyQualifiedTypeName);
  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);

  if AJSONReader.TokenType <> TJsonToken.EndArray then
  begin
    if not Assigned(LKeyRttiType) then
      raise EdjEngineError.Create('Key type not found deserializing a Dictionary');
    if not Assigned(LValueRTTIType) then
      raise EdjEngineError.Create('Value type not found deserializing a Dictionary');
  end;
  // ------------
  // Loop
  repeat
    // If the current JSONToken is an EndArray token then exit from the loop
    if AJSONReader.TokenType = TJSONToken.EndArray then
      Break;
    // Every item of the JSONDictionary must begin with a StartObject char
    if (AJSONReader.TokenType <> TJSONToken.StartObject) then
      raise EdjEngineError.Create('StartObject char expected deserializing an item.');
    AJSONReader.Read;
    // Get the key anche value JSONValue
    case AParams.SerializationMode of
      // In this mode the property name represent the key and the value represent the value
      smJavaScript:
      begin
        // Key
        if (AJSONReader.TokenType <> TJSONToken.PropertyName) then
          raise EdjEngineError.Create('Property name expected deserializing the key of an item.');
        LKey := DeserializePropField(AJSONReader, LKeyRttiType, APropField, nil, AParams);
        AJSONReader.Read;
        // Value
        LValue := DeserializePropField(AJSONReader, LValueRTTIType, APropField, nil, AParams);
      end;
      // In this mode there are two properties, one for the key and one for the value
      smDataContract:
      begin
        // Key
        if not((AJSONReader.TokenType = TJSONToken.PropertyName) and (AJSONReader.Value.AsString = DJ_KEY)) then
          raise EdjEngineError.Create('Property name expected deserializing the key of an item.');
        if not AJSONReader.Read then
          raise EdjEngineError.Create('Value expected deserializing the key of an item.');
        LKey := DeserializePropField(AJSONReader, LKeyRttiType, APropField, nil, AParams);
        AJSONReader.Read;
        // Value
        if not((AJSONReader.TokenType = TJSONToken.PropertyName) and (AJSONReader.Value.AsString = DJ_VALUE)) then
          raise EdjEngineError.Create('Property name expected deserializing the value of an item.');
        if not AJSONReader.Read then
          raise EdjEngineError.Create('Value expected deserializing the value of an item.');
        LValue := DeserializePropField(AJSONReader, LValueRTTIType, APropField, nil, AParams);
      end;
    end;
    AJSONReader.Read;
    // Add to the dictionary
    ADuckDictionary.Add(LKey, LValue);
  until not AJSONReader.Read;
  // If TypeAnnotations is enabled then e "CloseObject" char is expected
  if CheckForEndObjectCharIfTypeAnnotations(AJSONReader, AParams) then
    raise EdjEngineError.Create('EndObject char expected  (TipeAnnotations enabled)');
end;

class function TdjEngineStream.DeserializeEnumeration(
  const AJSONReader: TJSONReader; const AValueType: TRttiType): TValue;
begin
{ TODO : Controllare se è possibile assegnare AJSONReader.Value direttamente. }
  // Boolean
  if AValueType.QualifiedName = 'System.Boolean' then
  begin
    // If Null value
    if AJSONReader.TokenType = TJsonToken.Null then
      Exit(False);
    Result := AJSONReader.Value.AsBoolean
  end
  // Other enumerated type
  else
    TValue.Make(AJSONReader.Value.AsInteger, AValueType.Handle, Result);
end;

class function TdjEngineStream.DeserializeFloat(const AJSONReader: TJSONReader;
  const AValueType: TRttiType; const AParams:IdjParams): TValue;
var
  LQualifiedTypeName: String;
begin
  // Get the type name
  LQualifiedTypeName := AValueType.QualifiedName;
  // If Null or empty value
  if (AJSONReader.TokenType = TJsonToken.Null) // NB: Da errore con JSONNull
  or (  (AJSONReader.Value.Kind = tkString) and (AJSONReader.Value.AsString.IsEmpty)  )  // NB: Da errore con JSONNull
  then
    Result := 0
  else
  // TDate (string expected)
  if (LQualifiedTypeName = 'System.TDate') and (AJSONReader.TokenType = TJsonToken.String) then
    Result := TValue.From<TDate>(TdjUtils.ISOStrToDate(AJSONReader.Value.AsString, AParams))
  else
  // TDateTime (string expected)
  if (LQualifiedTypeName = 'System.TDateTime') and (AJSONReader.TokenType = TJsonToken.String) then
    Result := TValue.From<TDateTime>(TdjUtils.ISOStrToDateTime(AJSONReader.Value.AsString, AParams))
  else
  // TTime (string expected)
  if (LQualifiedTypeName = 'System.TTime') and (AJSONReader.TokenType = TJsonToken.String) then
    Result := TValue.From<TTime>(TdjUtils.ISOStrToTime(AJSONReader.Value.AsString, AParams))
  else
  // Normal float value (Float expected)
  if (AJSONReader.TokenType = TJsonToken.Float) then
    Result := AJSONReader.Value.AsExtended
  else
  // Integer value (Float expected)
  if (AJSONReader.TokenType = TJsonToken.Integer) then
    Result := AJSONReader.Value.AsInteger
  else
  // Otherwise (raise)
    raise EdjEngineError.Create('Cannot deserialize float value.');
end;

class function TdjEngineStream.DeserializeInterface(
  const AJSONReader: TJSONReader; const AValueType: TRttiType;
  const APropField: TRttiNamedObject; AMasterObj: TObject;
  const AParams: IdjParams): TValue;
var
  LChildObj: TObject;
  LJustCreated: Boolean;
begin
  // Init
  LChildObj := nil;
  LJustCreated := False;
  // If the Property/Field is valid then try to get the value (Object) from the
  //  master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TdjDuckPropField.IsValidPropField(APropField) then
      LChildObj := TdjRTTI.TValueToObject(TdjDuckPropField.GetValue(AMasterObj, APropField))
    else
      LChildObj := AMasterObj;
  // If the LChildObj is not assigned and the AValueType is assigned then
  //  create the LChildObj of the type specified by the AValueType parameter,
  //  PS: normally used by DeserializeList or other collection deserialization
  if Assigned(AValueType) and (not Assigned(LChildObj)) and (not AParams.TypeAnnotations) then
  begin
    LChildObj := TdjRTTI.CreateObject(AValueType.QualifiedName);
    LJustCreated := True;
  end;
  // Deserialize
  DeserializeClassCommon(LChildObj, AJSONReader, APropField, AParams);
  // Make the result TValue
  //  NB: If the MasterObj is assigned return an empty TValue because if the
  //       deserialized object is a detail of a MasterObject the creation of the
  //       child object is responsibility of the Master object itself, so the
  //       child object is already assigned to the master object property.
//  if Assigned(AMasterObj) then
  // Code modified to resolve the issue of Maxim Sysoev when trying to deserialize
  //  an instance of a class like TMyClass<T> where T maybe every type (no constraint)
  //  and the class don't create itself the internal field of type <T> (when T is a class).
  if (Assigned(AMasterObj) and not Assigned(LChildObj))
  or not LJustCreated
  then
    Result := TValue.Empty
  else
    TValue.Make(@LChildObj, LChildObj.ClassInfo, Result);
end;

class procedure TdjEngineStream.DeserializeList(const ADuckList: IdjDuckList;
  const AJSONReader: TJSONReader; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LValueQualifiedTypeName: String;
  LValueRTTIType: TRttiType;
  LValue: TValue;
begin
  // Defaults
  LValueQualifiedTypeName := '';
  // If TypeAnnotations is enabled then get the "items" JSONArray containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    // Get the value type name (collection TypeName already retrieved by DeserializePropField)
    TryGetTypeAnnotation(AJSONReader, DJ_VALUE, LValueQualifiedTypeName);
    // The current token must be a property name named 'items'
    if not ((AJSONReader.TokenType = TJSONToken.PropertyName) and (AJSONReader.Value.AsString = 'items')) then
      raise EdjEngineError.Create('"items" property expected(TypeAnnotations enabled).');
    AJSONReader.Read;
  end;
  // Now a JSONArray must be present
  if AJSONReader.TokenType <> TJsonToken.StartArray then
    raise EdjEngineError.Create('JSONArray expected.');
  AJSONReader.Read;
  // Get values RttiType, if the RttiType is not found then check for
  //  "MapperItemsClassType"  or "MapperItemsType" attribute or from PARAMS
  //  PS: If the current JSONToken is EndArray then the collection is empty
  //       and then then ValueTypeChecknot is not necessary.
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);

  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := ADuckList.GetItemQualifiedTypeName;

  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);

  if (not Assigned(LValueRTTIType)) and (AJSONReader.TokenType <> TJsonToken.EndArray) then
    raise EdjEngineError.Create('Value type not found deserializing a List');
  // ------------
  // Clear the collection
  if AParams.ClearCollection then
    ADuckList.Clear;
  // Loop
  repeat
    // If the current JSONToken is an EndArray token then exit from the loop
    if (AJSONReader.TokenType = TJSONToken.EndArray) then
      Break;
    // Deserialize the current element
    LValue := DeserializePropField(AJSONReader, LValueRttiType, APropField, nil, AParams);
    // Add to the list
    ADuckList.AddValue(LValue);
  until not AJSONReader.Read;
  // If TypeAnnotations is enabled then e "CloseObject" char is expected
  if CheckForEndObjectCharIfTypeAnnotations(AJSONReader, AParams) then
    raise EdjEngineError.Create('EndObject char expected (TypeAnnotations enabled).');
end;


class procedure TdjEngineStream.DeserializeObject(const AJSONReader: TJSONReader;
  AObject: TObject; const AParams: IdjParams);
var
  LPropFieldKey: String;
  LPropsFields: TArray<System.Rtti.TRttiNamedObject>;
  LPropField: System.Rtti.TRttiNamedObject;
  LRTTIType: TRTTIInstanceType;
  LValue: TValue;
  procedure GetPropFieldByKey;
  var
    LNameAttribute: djNameAttribute;
    LPropFieldInternal: System.Rtti.TRttiNamedObject;
  begin
    // Get the PropField by Key
    case AParams.SerializationType of
      stProperties: LPropField := LRTTIType.GetProperty(LPropFieldKey);
      stFields: LPropField := LRTTIType.GetField(LPropFieldKey);
    end;
    // If found then exit else continue find considering even the djNameAttribute
    if Assigned(LPropField) then Exit;
    // Get members list if not already assigned
    if not Assigned(LPropsFields) then
    begin
      case AParams.SerializationType of
        stProperties:
          LPropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance.GetProperties));
        stFields:
          LPropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance.GetFields));
      end;
    end;
    // Loop and find
    for LPropFieldInternal in LPropsFields do
      if TdjRTTI.HasAttribute<djNameAttribute>(LPropFieldInternal, LNameAttribute) and (LNameAttribute.Name = LPropFieldKey) then
      begin
        LPropField := LPropFieldInternal;
        Exit;
      end;
    // If not found then set the result to nil
    LPropField := nil;
  end;
begin
  // Init
  LRTTIType := TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance;
  // Loop for all JSONTokens (all properties of the object)
  repeat
    // If the current JSONToken is an EndObject token then exit from the loop
    if (AJSONReader.TokenType = TJSONToken.EndObject) then
      Break;
    // The current token must be a property name
    if (AJSONReader.TokenType <> TJSONToken.PropertyName) then
      raise EdjEngineError.Create('DeserializeObject: PropertyName token type expected.');
    // Get the current prop/field name
    case AParams.SerializationType of
      TdjSerializationType.stProperties: LPropFieldKey := AJSONReader.Value.AsString;
      TdjSerializationType.stFields: LPropFieldKey := 'F' + AJSONReader.Value.AsString;
    end;
      AJSONReader.Read;
    // Get the PropField by Key
{ TODO : Ottimizzazione: ho provato sulla richiesta nome chiave ma il risultato era nullo }
    GetPropFieldByKey;
    // Check to continue or not
{ TODO : Possibile punto per ottimizzazione }
    if (not Assigned(LPropField))
    or (LPropField.Name = 'FRefCount')
    or (LPropField.Name = 'RefCount')
    or (not TdjDuckPropField.IsWritable(LPropField) and (TdjDuckPropField.RttiType(LPropField).TypeKind <> tkClass) and (TdjDuckPropField.RttiType(LPropField).TypeKind <> tkInterface))
    or (TdjRTTI.HasAttribute<djSkipAttribute>(LPropField))
    or TdjUtils.IsPropertyToBeIgnored(LPropField, AParams)
    then
      Continue;
    // Deserialize the currente member and assign it to the object member
    LValue := DeserializePropField(AJSONReader, TdjDuckPropField.RttiType(LPropField), LPropField, AObject, AParams);
    if not LValue.IsEmpty then
      TdjDuckPropField.SetValue(AObject, LPropField, LValue, AParams);
  until (not AJSONReader.Read);
end;

class function TdjEngineStream.DeserializePropField(
  const AJSONReader: TJSONReader; const AValueType: TRttiType;
  const APropField: TRttiNamedObject; const AMaster: TValue;
  const AParams: IdjParams): TValue;
var
  LValueQualifiedTypeName: String;
  LValueType: TRttiType;
  LdsonTypeAttribute: djTypeAttribute;
begin
  // Init
  Result := TValue.Empty;
  // If the current token is a "StartObject" the move to the next token...
  if (AJSONReader.TokenType = TJsonToken.StartObject) then
     AJSONReader.Read;
  // ---------------------------------------------------------------------------
  // Determina il ValueType del valore/oggetto corrente
  //  NB: If TypeAnnotations is enabled and a TypeAnnotation is present in the AJSONValue for the current
  //  value/object then load and use it as AValueType
  //  NB: Ho aggiunto questa parte perchè altrimenti in caso di una lista di interfacce (es: TList<IPerson>)
  //  NB. Se alla fine del blocco non trova un ValueTypeValido allora usa quello ricevuto come parametro
  LValueQualifiedTypeName := String.Empty;
  // Non deve considerare i TValue
  if not(   Assigned(AValueType) and (AValueType.Name = 'TValue')   ) then
  begin
    // Cerca il ValueType in una eventuale JSONAnnotation e se non la trova
    //  cerca anche un eventuale attributo LValueQualifiedTypeName
    if not TryGetTypeAnnotation(AJSONReader, DJ_TYPENAME, LValueQualifiedTypeName) then
      if Assigned(APropField)
      and (TdjDuckPropField.QualifiedName(APropField) = AValueType.QualifiedName)  // Questo per evitare che nel caso delle liste anche le items vedano l'attributo dsonTypeAttribute della proprietà a cui ri riferisce la lista stessa
      and TdjRTTI.HasAttribute<djTypeAttribute>(APropField, LdsonTypeAttribute)
      then
        LValueQualifiedTypeName := LdsonTypeAttribute.QualifiedName;
  end;
  //  NB. Se alla fine del blocco non trova un ValueTypeValido allora usa quello ricevuto come parametro
  if LValueQualifiedTypeName.IsEmpty then
    LValueType := AValueType
  else
    LValueType := TdjRTTI.QualifiedTypeNameToRttiTypeWithDefault(LValueQualifiedTypeName, AValueType);
  // ---------------------------------------------------------------------------
  // If a custom serializer exists for the current type then use it
  if  AParams.EnableCustomSerializers
  and DeserializeCustom(AJSONReader, LValueType, APropField, AMaster.AsObject, AParams, Result)
  then
    Exit;
  // Deserialize by TypeKind
  case LValueType.TypeKind of
    tkEnumeration:
      Result := DeserializeEnumeration(AJSONReader, LValueType);
    tkInteger, tkInt64:
      Result := AJSONReader.Value;
    tkFloat:
      Result := DeserializeFloat(AJSONReader, AValueType, AParams);
    tkString, tkLString, tkWString, tkUString:
      Result := AJSONReader.Value;
    tkChar, tkWChar:
      Result := DeserializeChar(AJSONReader);
    tkRecord:
      Result := DeserializeRecord(AJSONReader, LValueType, APropField, AParams);
    tkClass:
      Result := DeserializeClass(
        AJSONReader,
        LValueType,
        APropField,
        AMaster.AsObject,
        AParams
        );
    tkInterface:
      Result := DeserializeInterface(
        AJSONReader,
        LValueType,
        APropField,
        AMaster.AsObject,
        AParams
        );
    tkArray, tkDynArray:
      Result := DeserializeArray(AJSONReader, LValueType, APropField, AMaster, AParams);
  end;
end;

class function TdjEngineStream.DeserializeRecord(const AJSONReader: TJSONReader;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AParams: IdjParams): TValue;
var
  LQualifiedTypeName: String;
begin
  LQualifiedTypeName := AValueType.QualifiedName;
  // TTimeStamp
  if LQualifiedTypeName = 'System.SysUtils.TTimeStamp' then
  begin
    // If Null or empty value
    if (AJSONReader.TokenType = TJsonToken.Null)
    or (AJSONReader.Value.AsString.IsEmpty)
    then
      Exit(  TValue.From<TTimeStamp>(MSecsToTimeStamp(0))  );
    Result := TValue.From<TTimeStamp>(MSecsToTimeStamp(AJSONReader.Value.AsInt64));
  end
  // TValue
  else if LQualifiedTypeName = 'System.Rtti.TValue' then
    Result := DeserializeTValue(AJSONReader, APropField, AParams)
  else
    raise Exception.Create('TdjEngineStream.DeserializeRecord: Unknown LQualifiedTypeName.');
end;

class procedure TdjEngineStream.DeserializeStream(AStream: TObject;
  const AJSONReader: TJSONReader; const APropField: TRttiNamedObject);
var
  LStreamASString: string;
  LdsonEncodingAttribute: djEncodingAttribute;
  LEncoding: TEncoding;
  LStringStream: TStringStream;
  LStreamWriter: TStreamWriter;
begin
  // The JSONToken must be a string type
  if AJSONReader.TokenType <> TJsonToken.String then
    raise EdjEngineError.Create('Wrong JSON token type deserializing a stream.');
  // Load the string representation of the stream from the JSON then
  //  load it into the object
  LStreamASString := AJSONReader.Value.AsString;
  AJSONReader.Read;
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

class procedure TdjEngineStream.DeserializeStreamableObject(const ADuckStreamable:IdjDuckStreamable;
  const AJSONReader: TJSONReader; const APropField: TRttiNamedObject);
var
  LValueAsString: string;
  LStringStream: TStringStream;
  LMemoryStream: TMemoryStream;
begin
  // The JSONToken must be a string type
  if AJSONReader.TokenType <> TJsonToken.String then
    raise EdjEngineError.Create('Wrong JSON token type deserializing a streamable object.');
  // Load the string representation of the stream from the JSON then
  //  load it into the object
  LValueAsString := AJSONReader.Value.AsString;
  { TODO : Risistemare }
//  AJSONReader.Read;
  LStringStream := TSTringStream.Create;
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

class function TdjEngineStream.DeserializeTValue(const AJSONReader: TJSONReader;
  const APropField: TRttiNamedObject; const AParams: IdjParams): TValue;
var
  LValueQualifiedTypeName: string;
  LValueRTTIType: TRttiType;
begin
  // Defaults
  LValueQualifiedTypeName := '';
  // If the JSONValue is a TJSONNull
  if (AJSONReader.TokenType = TJsonToken.Null) then
    Exit(TValue.Empty);
  // If TypeAnnotations is enabled then get the "items" JSONArray containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    // Get the value type name (collection TypeName already retrieved by DeserializePropField)
    TryGetTypeAnnotation(AJSONReader, DJ_TYPENAME, LValueQualifiedTypeName);
    // The current token must be a property name named "DJ_VALUE" (it is a constant)
    //  NB: If the original TValue is empty then the property DJ_VALUE not exixts
    if (AJSONReader.TokenType = TJSONToken.PropertyName) and (AJSONReader.Value.AsString = DJ_VALUE) then
      AJSONReader.Read;
  end;
  // Get values RttiType, if the RttiType is not found then check for
  //  "dsonType" attribute
  TdjUtils.GetTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);
  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if not Assigned(LValueRTTIType) then
    raise EdjEngineError.Create('Value type not found deserializing a TValue');
  // Deserialize the value
  Result := DeserializePropField(AJSONReader, LValueRTTIType, APropField, nil, AParams);
  // If TypeAnnotations is enabled then a "CloseObject" char is expected
  if CheckForEndObjectCharIfTypeAnnotations(AJSONReader, AParams) then
    raise EdjEngineError.Create('EndObject char expected for TValue (TypeAnnotations enabled).');
end;

class function TdjEngineStream.Serialize(const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean): String;
var
  LStringWriter: TStringWriter;
  LJSONWriter: TJSONTextWriter;
begin
  inherited;
  LStringWriter := TStringWriter.Create;
  LJSONWriter := TJsonTextWriter.Create(LStringWriter);
  try
    SerializePropField(LJSONWriter, AValue, APropField, AParams, AEnableCustomSerializers);
    Result := LStringWriter.ToString;
  finally
    LJSONWriter.Free;
    LStringWriter.Free;
  end;
end;

class procedure TdjEngineStream.SerializeArray(const AJSONWriter: TJSONWriter;
  const AValue: TValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LValueQualifiedTypeName: String;
  LIndex: Integer;
  LValue: TValue;
begin
  // Init
  LValueQualifiedTypeName := '';

  // If TypeAnnotations enabled...
  if AParams.TypeAnnotations then
  begin
    AJSONWriter.WriteStartObject;
    // Get the first element type name (for non class/interface list contents)
    if AValue.GetArrayLength > 0 then
    begin
      LValue := AValue.GetArrayElement(0);
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
    end;
    // Add the items TypeName (base on the first element of the list only
    if  (not LValueQualifiedTypeName.IsEmpty) then
    begin
      AJSONWriter.WritePropertyName(DJ_VALUE);
      AJSONWriter.WriteValue(LValueQualifiedTypeName);
    end;
    // Add the "items" property
    AJSONWriter.WritePropertyName('items');
  end;

  // Items array start
  AJSONWriter.WriteStartArray;

  // Loop for all items in the list and serialize it
  for LIndex := 0 to AValue.GetArrayLength-1 do
  begin
    // Read values
    LValue := AValue.GetArrayElement(LIndex);
    // Serialize values
    SerializePropField(AJSONWriter, LValue, APropField, AParams);
  end;

  // Items array end
  AJSONWriter.WriteEndArray;
  // If TypeAnnotations enabled...
  if AParams.TypeAnnotations then
    AJSONWriter.WriteEndObject;
end;

class procedure TdjEngineStream.SerializeChar(const AJSONWriter: TJSONWriter;
  const AValue: TValue; const AParams: IdjParams);
begin
  if AValue.AsString = #0 then
  begin
    if AParams.EmptyCharAsNull then
      AJSONWriter.WriteNull
    else
      AJSONWriter.WriteValue('');
  end
  else
    AJSONWriter.WriteValue(AValue.AsString);
end;

class procedure TdjEngineStream.SerializeClass(const AJSONWriter: TJSONWriter;
  const AValue: TValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  AChildObj: TObject;
  LTypeInfoCacheItem: TdjTypeInfoCacheItem;
begin
  AChildObj := AValue.AsObject;
  if not Assigned(AChildObj) then
  begin
    AJSONWriter.WriteNull;
    Exit;
  end;
  LTypeInfoCacheItem := AParams.TypeInfoCache.Get(AValue.AsObject);
  case LTypeInfoCacheItem.DuckType of
    dtNone:
    begin
      if Assigned(AChildObj) then
        SerializeObject(AJSONWriter, AChildObj, AParams);
    end;
    dtList:
      SerializeList(AJSONWriter, LTypeInfoCacheItem.DuckListWrapper, APropField, AParams);
    dtStreamable:
      SerializeStreamableObject(AJSONWriter, LTypeInfoCacheItem.DuckStreamableWrapper, APropField);
    dtDictionary:
      SerializeDictionary(AJSONWriter, LTypeInfoCacheItem.DuckDictionaryWrapper, APropField, AParams);
    dtStream:
      SerializeStream(AJSONWriter, AChildObj, APropField);
  end;
end;

class function TdjEngineStream.SerializeCustom(const AJSONWriter: TJSONWriter;
  AValue: TValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams): Boolean;
var
  LSerializer: TdjStreamCustomSerializerRef;
  LMapperCustomSerializer: djSerializerStreamAttribute;
  LObj: TObject;
begin
  // Init
  Result := False;
  // If the Value is an Interface type then convert it to real object class
  //  type implementing the interface
  if AValue.Kind = tkInterface then
  begin
    LObj := AValue.AsInterface as TObject;
    TValue.Make(@LObj, LObj.ClassInfo, AValue);
  end;
  // Get custom serializer if exists else exit
  if AParams.Serializers.Exists_Stream(AValue.TypeInfo) then
    LSerializer := AParams.Serializers._GetSerializerItem(AValue.TypeInfo).StreamSerializer
  else
  if TdjRTTI.HasAttribute<djSerializerStreamAttribute>(TdjRTTI.TypeInfoToRttiType(AValue.TypeInfo), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit;
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  //  in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
  begin
    AJSONWriter.WriteStartObject;
    AJSONWriter.WritePropertyName(DJ_TYPENAME);
    AJSONWriter.WriteValue(TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo));
    AJSONWriter.WritePropertyName(DJ_VALUE);
  end;
  // Serialize the value
  LSerializer.Serialize(AJSONWriter, AValue);
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  //  in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
    AJSONWriter.WriteEndObject;
  // All OK
  Result := True;
end;

class procedure TdjEngineStream.SerializeDictionary(
  const AJSONWriter: TJSONWriter; const ADuckDictionary: IdjDuckDictionary;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LKey, LValue: TValue;
  LKeyQualifiedTypeName, LValueQualifiedTypeName: String;
  LSkipFirst: Boolean;
begin
  // Init
  LSkipFirst := False;
  LKeyQualifiedTypeName   := '';
  LValueQualifiedTypeName := '';

  // If TypeAnnotations enabled...
  if AParams.TypeAnnotations then
  begin
    AJSONWriter.WriteStartObject;
    // Add the List TypeName
    AJSONWriter.WritePropertyName(DJ_TYPENAME);
    AJSONWriter.WriteValue(ADuckDictionary.DuckObjQualifiedName);
    // Get the first element type name
    if ADuckDictionary.MoveNext then
    begin
      LSkipFirst := True;
      LKey   := ADuckDictionary.GetCurrentKey;
      LValue := ADuckDictionary.GetCurrentValue;
      LKeyQualifiedTypeName   := TdjRTTI.TypeInfoToQualifiedTypeName(LKey.TypeInfo);
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
    end;
    // Add the items TypeName (base on the first element of the list only)
    if  (not LKeyQualifiedTypeName.IsEmpty) then
    begin
      AJSONWriter.WritePropertyName(DJ_KEY);
      AJSONWriter.WriteValue(LKeyQualifiedTypeName);
    end;
    if  (not LValueQualifiedTypeName.IsEmpty) then
    begin
      AJSONWriter.WritePropertyName(DJ_VALUE);
      AJSONWriter.WriteValue(LValueQualifiedTypeName);
    end;
    // Add the "items" property
    AJSONWriter.WritePropertyName('items');
  end;

  // Items array start
  AJSONWriter.WriteStartArray;

  // Loop
  while LSkipFirst or ADuckDictionary.MoveNext do
  begin
    LSkipFirst := False;
    AJSONWriter.WriteStartObject;
    // Read values
    LKey   := ADuckDictionary.GetCurrentKey;
    LValue := ADuckDictionary.GetCurrentValue;
    // Serialize values
    case AParams.SerializationMode of
      smJavaScript:
      begin
        // Key
        // NB: In JavaScript mode le chiavi posso essere solo stringhe o interi
        case LKey.Kind of
          tkString,tkUString,tkLString,tkWString: AJSONWriter.WritePropertyName(LKey.AsString);
          tkInteger,tkInt64:  AJSONWriter.WritePropertyName(LKey.AsString);
        else
          raise EdjEngineError.Create('TdjEngineStream: In this engine only string or integer key type is allowed.');
        end;
        // Value
        SerializePropField(AJSONWriter, LValue, APropField, AParams);
      end;
      smDataContract:
      begin
        // Key
        AJSONWriter.WritePropertyName(DJ_KEY);
        SerializePropField(AJSONWriter, LKey, APropField, AParams);
        // Value
        AJSONWriter.WritePropertyName(DJ_VALUE);
        SerializePropField(AJSONWriter, LValue, APropField, AParams);
      end;
    end;
    AJSONWriter.WriteEndObject;
  end;

  // Items array end
  AJSONWriter.WriteEndArray;
  // If TypeAnnotations enabled...
  if AParams.TypeAnnotations then
    AJSONWriter.WriteEndObject;
end;

class procedure TdjEngineStream.SerializeEnumeration(
  const AJSONWriter: TJSONWriter; const AValue: TValue);
var
  LQualifiedTypeName: String;
begin
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  // Boolean
  if LQualifiedTypeName = 'System.Boolean' then
    AJSONWriter.WriteValue(AValue.AsBoolean)
  // Other enumeration
  else
    AJSONWriter.WriteValue(AValue.AsOrdinal);
end;

class procedure TdjEngineStream.SerializeFloat(const AJSONWriter: TJSONWriter;
  const AValue: TValue; const AParams: IdjParams);
var
  LQualifiedTypeName: String;
begin
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  if LQualifiedTypeName = 'System.TDate' then
  begin
    if AValue.AsExtended = 0 then
      AJSONWriter.WriteNull
    else
      AJSONWriter.WriteValue(TdjUtils.ISODateToString(AValue.AsExtended, AParams));
  end
  else if LQualifiedTypeName = 'System.TDateTime' then
  begin
    if AValue.AsExtended = 0 then
      AJSONWriter.WriteNull
    else
      AJSONWriter.WriteValue(TdjUtils.ISODateTimeToString(AValue.AsExtended, AParams));
  end
  else if LQualifiedTypeName = 'System.TTime' then
   AJSONWriter.WriteValue(TdjUtils.ISOTimeToString(AValue.AsExtended, AParams))
  else
    AJSONWriter.WriteValue(AValue.AsExtended);
end;

class procedure TdjEngineStream.SerializeInterface(
  const AJSONWriter: TJSONWriter; const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  AChildInterface: IInterface;
  AChildObj: TObject;
begin
  AChildInterface := AValue.AsInterface;
  AChildObj := AChildInterface as TObject;
  SerializeClass(AJSONWriter, AChildObj, APropField, AParams);
end;

class procedure TdjEngineStream.SerializeList(const AJSONWriter: TJSONWriter;
  const ADuckList: IdjDuckList; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LValueQualifiedTypeName: String;
  I: Integer;
  LValue: TValue;
begin
  // Init
  LValueQualifiedTypeName := '';

  // If TypeAnnotations enabled...
  if AParams.TypeAnnotations then
  begin
    AJSONWriter.WriteStartObject;
    // Add the List TypeName
    AJSONWriter.WritePropertyName(DJ_TYPENAME);
    AJSONWriter.WriteValue(ADuckList.DuckObjQualifiedName);
    // Get the first element type name (for non class/interface list contents)
    if ADuckList.Count > 0 then
    begin
      LValue := ADuckList.GetItemValue(0);
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
    end;
    // Add the Items TypeName
    AJSONWriter.WritePropertyName(DJ_VALUE);
    AJSONWriter.WriteValue(LValueQualifiedTypeName);
    // Add the "items" property
    AJSONWriter.WritePropertyName('items');
  end;

  // Items array start
  AJSONWriter.WriteStartArray;

  // Loop for all items in the list and serialize it
  for I := 0 to ADuckList.Count-1 do
  begin
    // Read values
    LValue := ADuckList.GetItemValue(I);
    // Serialize values
    SerializePropField(AJSONWriter, LValue, APropField, AParams);
  end;

  // Items array end
  AJSONWriter.WriteEndArray;
  // If TypeAnnotations enabled...
  if AParams.TypeAnnotations then
    AJSONWriter.WriteEndObject;
end;

class procedure TdjEngineStream.SerializeObject(const AJSONWriter: TJSONWriter;
  const AInterfacedObject: IInterface; const AParams: IdjParams);
begin
  SerializeObject(AJSONWriter, AInterfacedObject as TObject, AParams);
end;

class procedure TdjEngineStream.SerializeObject(const AJSONWriter: TJSONWriter;
  const AObject: TObject; const AParams: IdjParams);
var
  LPropField: System.Rtti.TRttiNamedObject;
  LPropsFields: TArray<System.Rtti.TRttiNamedObject>;
  LKeyName: String;
  LValue: TValue;
begin
  AJSONWriter.WriteStartObject;
  // add the $dmvc.classname property to allows a strict deserialization
  if AParams.TypeAnnotations then
  begin
    AJSONWriter.WritePropertyName(DJ_TYPENAME);
    AJSONWriter.WriteValue(AObject.QualifiedClassName);
  end;
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
    // Check for "DoNotSerializeAttribute" or property to ignore
    if (LPropField.Name = 'FRefCount')
    or (LPropField.Name = 'RefCount')
    or TdjRTTI.HasAttribute<djSkipAttribute>(LPropField)
    or TdjUtils.IsPropertyToBeIgnored(LPropField, AParams)
    then
      Continue;
    // Get KeyName
    LKeyName := TdjUtils.GetKeyName(LPropField, AParams);
    // Write the property name
    AJSONWriter.WritePropertyName(LKeyName);
    // Write/serialize the property value
    LValue := TdjDuckPropField.GetValue(AObject, LPropField);
    SerializePropField(AJSONWriter, LValue, LPropField, AParams);
  end;
  AJSONWriter.WriteEndObject;
end;

class procedure TdjEngineStream.SerializePropField(
  const AJSONWriter: TJSONWriter; const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean);
begin
  // If a custom serializer exists for the current type then use it
  if AEnableCustomSerializers and AParams.EnableCustomSerializers and SerializeCustom(AJSONWriter, AValue, APropField, AParams) then
    Exit;
  // Standard serialization by TypeKind
  case AValue.Kind of
    tkInteger, tkInt64:
      AJSONWriter.WriteValue(AValue.AsInteger);
    tkFloat:
      SerializeFloat(AJSONWriter, AValue, AParams);
    tkString, tkLString, tkWString, tkUString:
      SerializeString(AJSONWriter, AValue, AParams);
    tkChar, tkWChar:
      SerializeChar(AJSONWriter, AValue, AParams);
    tkEnumeration:
      SerializeEnumeration(AJSONWriter, AValue);
    tkRecord:
      SerializeRecord(AJSONWriter, AValue, APropField, AParams);
    tkClass:
      SerializeClass(AJSONWriter, AValue, APropField, AParams);
    tkInterface:
      SerializeInterface(AJSONWriter, AValue, APropField, AParams);
    tkArray, tkDynArray:
      SerializeArray(AJSONWriter, AValue, APropField, AParams);
  end;
end;

class procedure TdjEngineStream.SerializeRecord(const AJSONWriter: TJSONWriter;
  const AValue: TValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LTimeStamp: TTimeStamp;
  LQualifiedTypeName: String;
begin
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  // TTimeStamp
  if LQualifiedTypeName = 'System.SysUtils.TTimeStamp' then
  begin
    LTimeStamp := AValue.AsType<System.SysUtils.TTimeStamp>;
    AJSONWriter.WriteValue(TimeStampToMsecs(LTimeStamp));
  end
  // TValue
  else if LQualifiedTypeName = 'System.Rtti.TValue' then
    SerializeTValue(AJSONWriter, AValue.AsType<TValue>, APropField, AParams);
end;

class procedure TdjEngineStream.SerializeStream(const AJSONWriter: TJSONWriter;
  const AStream: TObject; const APropField: TRttiNamedObject);
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
      AJSONWriter.WriteValue(LStringStream.DataString);
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
      AJSONWriter.WriteValue(LStringStream.DataString);
    finally
      LStringStream.Free;
    end;
    // -------------------------------------------------------------------------
  end;
end;

class procedure TdjEngineStream.SerializeStreamableObject(
  const AJSONWriter: TJSONWriter; const ADuckStreamable:IdjDuckStreamable;
  const APropField: TRttiNamedObject);
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
    AJSONWriter.WriteValue(LStringStream.DataString);
  finally
    LMemoryStream.Free;
    LStringStream.Free;
  end;
end;

class procedure TdjEngineStream.SerializeString(const AJSONWriter: TJSONWriter;
  const AValue: TValue; const AParams: IdjParams);
begin
  if AValue.AsString.IsEmpty and AParams.EmptyStringAsNull then
    AJSONWriter.WriteNull
  else
    AJSONWriter.WriteValue(AValue.AsString);
end;

class procedure TdjEngineStream.SerializeTValue(const AJSONWriter: TJSONWriter;
  const AValue: TValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LRttiType: TRttiType;
begin
  // If the TValue is empty then return a TJSONNull and exit
  if AValue.IsEmpty then
  begin
    AJSONWriter.WriteNull;
    Exit;
  end;
  // Init
  LRttiType := TdjRTTI.TypeInfoToRttiType(AValue.TypeInfo);
  // Add the qualified type name if enabled
  if AParams.TypeAnnotations then
  begin
    AJSONWriter.WriteStartObject;
    AJSONWriter.WritePropertyName(DJ_TYPENAME);
    AJSONWriter.WriteValue(LRttiType.QualifiedName);
    AJSONWriter.WritePropertyName(DJ_VALUE);
  end;
  // Add the JSONValue
  SerializePropField(AJSONWriter, AValue, APropField, AParams);
  // Close type annotations if enabled
  if AParams.TypeAnnotations then
    AJSONWriter.WriteEndObject;
end;

class function TdjEngineStream.TryGetTypeAnnotation(
  const AJSONReader: TJSONReader; const ATypeAnnotationName: String;
  var ResultTypeAnnotationValue: String): Boolean;
begin
  Result := False;
  if (AJSONReader.TokenType = TJsonToken.PropertyName) and (AJSONReader.Value.AsString = ATypeAnnotationName) then
  begin
    if not AJSONReader.Read then
      raise EdjEngineError.Create('Value expected deserializing a type annotation (' + ATypeAnnotationName + ')');
    ResultTypeAnnotationValue := AJSONReader.Value.AsString;
    AJSONReader.Read;
    Result := True;
  end;
end;

end.
