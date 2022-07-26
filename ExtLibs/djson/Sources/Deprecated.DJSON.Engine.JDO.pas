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





unit DJSON.Engine.JDO;

interface

uses
  JsonDataObjects, System.Rtti, DJSON.Params, DJSON.Duck.Interfaces;

type

  TJSONBox = TJSONObject;

  TdjEngineJDO = class(TdjEngineIntf)
  private
    class function IsJsonNull(const AJSONValue: PJsonDataValue): Boolean;
  protected
    // Serializers
    class procedure SerializePropField(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True); static;
    class procedure SerializeFloat(const AResult:PJsonDataValue; const AValue: TValue; const AParams:IdjParams); static;
    class procedure SerializeEnumeration(const AResult:PJsonDataValue; const AValue: TValue); static;
    class procedure SerializeString(const AResult:PJsonDataValue; const AValue: TValue; const AParams: IdjParams); static;
    class procedure SerializeChar(const AResult:PJsonDataValue; const AValue: TValue; const AParams: IdjParams); static;
    class procedure SerializeRecord(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeArray(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeClass(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeInterface(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class function SerializeObject(const AObject: TObject; const AParams: IdjParams): TJSONBox; overload; static;
    class function SerializeObject(const AInterfacedObject: IInterface; const AParams: IdjParams): TJSONBox; overload; static;
    class procedure SerializeTValue(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeList(const AResult:PJsonDataValue; const ADuckList: IdjDuckList; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeDictionary(const AResult:PJsonDataValue; const ADuckDictionary: IdjDuckDictionary; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure SerializeStreamableObject(const AResult:PJsonDataValue; const ADuckStreamable:IdjDuckStreamable; const APropField: TRttiNamedObject); static;
    class procedure SerializeStream(const AResult:PJsonDataValue; const AStream: TObject; const APropField: TRttiNamedObject); static;
    class function SerializeCustom(const AResult:PJsonDataValue; AValue:TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): Boolean; static;
    // Deserializers
    class function DeserializePropField(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: Tvalue; const AParams: IdjParams): TValue; static;
    class function DeserializeInt(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): TValue; static;
    class function DeserializeFloat(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): TValue; static;
    class function DeserializeEnumeration(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): TValue; static;
    class function DeserializeString(const AJSONValue: PJsonDataValue): TValue; static;
    class function DeserializeChar(const AJSONValue: PJsonDataValue): TValue; static;
    class function DeserializeRecord(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
    class function DeserializeArray(const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; static;
    class procedure DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class function DeserializeClass(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
    class function DeserializeInterface(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
    class function DeserializeObject(const AJSONBox: TJSONBox; AObject:TObject; const AParams: IdjParams): TObject; static;
    class function DeserializeTValue(const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
    class procedure DeserializeList(const ADuckList: IdjDuckList; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeStreamableObject(const ADuckStreamable:IdjDuckStreamable; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject); static;
    class procedure DeserializeStream(AStream: TObject; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject); static;
    class function DeserializeCustom(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMasterObj: TObject; const AParams: IdjParams; out ResultValue:TValue): Boolean; static;
  public
    class function Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True): String; override;
    class function Deserialize(const AJSONText:String; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; override;
  end;

implementation

uses
{$REGION 'System'}
  System.SysUtils,
  System.Classes,
  System.NetEncoding,
{$ENDREGION}
{$REGION 'DJSON'}
  DJSON.Duck.PropField,
  DJSON.Utils.RTTI,
  DJSON.Exceptions,
  DJSON.Serializers,
  DJSON.Attributes,
  DJSON.Constants,
  DJSON.Factory,
  DJSON.Utils,
  DJSON.TypeInfoCache;
{$ENDREGION}

class function TdjEngineJDO.Deserialize(const AJSONText: String;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMaster: TValue; const AParams: IdjParams): TValue;
var
  LTmpJSONArray: TJsonArray;
  LJSONValue: PJsonDataValue;
begin
  //  NB: Non ho trovato un modo per generare un JSONValue singolo che non sia
  //       all'interno di un JSONObject oppure JSONArray, per cui faccio fare
  //       il Parse forzatamente su un JSONArray e poi ne prelevo il JSONValue contenuto.
  LTmpJSONArray := TJSONArray(TJSONArray.Parse(   '['+AJSONText+']'   ));
  try
    LJSONValue   := LTmpJSONArray.Items[0];
    Result := DeserializePropField(LJSONValue, AValueType, APropField, AMaster, AParams);
  finally
    LTmpJSONArray.Free;
  end;
end;

class function TdjEngineJDO.DeserializeArray(const AJSONValue: PJsonDataValue;
  const APropField: TRttiNamedObject; const AMaster: TValue;
  const AParams: IdjParams): TValue;
var
  LValueQualifiedTypeName: String;
  LValueRTTIType: TRttiType;
  LJSONObject: TJSONObject;
  LJSONValue, LValueJSONValue: PJsonDataValue;
  LJSONArray: TJSONArray;
  LIndex: Integer;
  LValue: TValue;
  PArray: Pointer;
  LArrayLen: Longint;
begin
  // Checks
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  then
    Exit;
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
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if AJSONValue.Typ <> TJsonDataType.jdtObject then
      raise EdjEngineError.Create('Wrong serialization for array.');
    LJSONObject := AJSONValue.ObjectValue;
    // Get the value type name
    LValueQualifiedTypeName := LJSONObject.S[DJ_VALUE];
    // Get the items array
    LJSONValue := LJSONObject.Items[LJSONObject.IndexOf('items')];
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if LJSONValue.Typ <> TJsonDataType.jdtArray then
    raise EdjEngineError.Create('Cannot restore the list because the related JSONValue is not an array');
  LJSONArray := LJSONValue.ArrayValue;
  // Get values RttiType, if the RttiType is not found then check for
  //  "MapperItemsClassType"  or "MapperItemsType" attribute or from PARAMS
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);

  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := TdjRTTI.GetItemsQualifiedTypeNameFromArrayTypeInfo(Result.TypeInfo);

  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);

  if (not Assigned(LValueRTTIType)) and (LJSONArray.Count > 0) then
    raise EdjEngineError.Create('Value type not found deserializing a List');
  // ------------
  // If it is a dynamic array set the length
  if Result.Kind = tkDynArray then
  begin
    PArray := Result.GetReferenceToRawData;
    LArrayLen := LJSONArray.Count;
    DynArraySetLength(PPointer(PArray)^, Result.TypeInfo, 1, @LArrayLen);  // Monodimensional array only (1)
  end;
  // Loop
  for LIndex := 0 to LJSONArray.Count - 1 do
  begin
    // Extract the current element
    LValueJSONValue := LJSONArray.Items[LIndex];
    // Deserialize the current element
    LValue := DeserializePropField(LValueJSONValue, LValueRttiType, APropField, nil, AParams);
    // Add to the array
    Result.SetArrayElement(LIndex, LValue);
  end;
end;

class function TdjEngineJDO.DeserializeChar(
  const AJSONValue: PJsonDataValue): TValue;
begin
  // If JSONValue not assigned or NULL
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  or (AJSONValue.Typ = TJsonDataType.jdtObject)  // The type is jdtObject when NULL
  or (AJSONValue.Value.IsEmpty)  // Empty value
  then
    Exit(#0);
  Result := AJSONValue.Value;
end;

class function TdjEngineJDO.DeserializeClass(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
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
  DeserializeClassCommon(LChildObj, AJSONValue, APropField, AParams);
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

class procedure TdjEngineJDO.DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: PJsonDataValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LTypeInfoCacheItem: TdjTypeInfoCacheItem;
begin
  LTypeInfoCacheItem := AParams.TypeInfoCache.Get(AChildObj);
  case LTypeInfoCacheItem.DuckType of
    dtNone:
    begin
      // If the JSONValue is a TJSONNull (Mauri 19/04/2020: Non fa più il FreeAndNil perchè in alcuni casi era un problema)
      if (AJSONValue = nil) or (AJSONValue.Typ = TJsonDataType.jdtNone) then
//        FreeAndNil(AChildObj)
      else if AJSONValue.Typ = TJsonDataType.jdtObject then
        AChildObj := DeserializeObject(AJSONValue.ObjectValue, AChildObj, AParams)
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

class function TdjEngineJDO.DeserializeCustom(const AJSONValue: PJsonDataValue;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMasterObj: TObject; const AParams: IdjParams;
  out ResultValue: TValue): Boolean;
var
  LSerializer: TdjJDOCustomSerializerRef;
  LMapperCustomSerializer: djSerializerJDOAttribute;
  LExistingValue: TValue;
  LJSONValue: PJsonDataValue;
  LJSONObject: TJsonObject;
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
  if AParams.Serializers.Exists_JDO(AValueType.Handle) then
    LSerializer := AParams.Serializers._GetSerializerItem(AValueType.Handle).JDOSerializer
  else
  if TdjRTTI.HasAttribute<djSerializerJDOAttribute>(TdjRTTI.TypeInfoToRttiType(AValueType.Handle), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit;
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  //  in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
  begin
    LJSONObject := AJSONValue.ObjectValue;
    LJSONValue := LJSONObject.Items[LJSONObject.IndexOf(DJ_VALUE)];
  end
  else
    LJSONValue := AJSONValue;
  // Serialize (if a custom serializer exists)
  ResultValue := LSerializer.Deserialize(LJSONValue, LExistingValue);
  // All Ok
  Result := True;
end;

class procedure TdjEngineJDO.DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary; const AJSONValue: PJsonDataValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LKeyQualifiedTypeName, LValueQualifiedTypeName, LDictionaryTypeName: String;
  LKeyRttiType, LValueRTTIType: TRttiType;
  LJSONValue, LKeyJSONValue, LValueJSONValue: PJsonDataValue;
  LJObj: TJSONObject;
  LJSONArray, LTmpKeyJSONArray: TJSONArray;
  LKey, LValue: TValue;
begin
//  LKeyJSONValue := nil;  // Hint prevention
//  LValueJSONValue := nil;  // Hint prevention
  LTmpKeyJSONArray := nil;
  // Checks
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  then
    Exit;
  // Defaults
  LDictionaryTypeName     := '';
  LKeyQualifiedTypeName   := '';
  LValueQualifiedTypeName := '';
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if AJSONValue.Typ <> TJsonDataType.jdtObject then
      raise EdjEngineError.Create('Wrong serialization for ' + ADuckDictionary.DuckObjQualifiedName);
    LJObj := AJSONValue.ObjectValue;
    // Get the Dictionary, Key and Value type names
    LDictionaryTypeName := LJObj.S[DJ_TYPENAME];
    LKeyQualifiedTypeName := LJObj.S[DJ_KEY];
    LValueQualifiedTypeName := LJObj.S[DJ_VALUE];
    // Get the items array
    LJSONValue := LJObj.Items[LJObj.IndexOf('items')];
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if LJSONValue.Typ <> TJsonDataType.jdtArray then
    raise EdjEngineError.Create('Cannot restore the dictionary because the related JSONValue is not an array');
  LJSONArray := LJSONValue.ArrayValue;
  // Get values RttiType, if the RttiType is not found then check for dsonTypeAttribute
  // ------------
  TdjUtils.GetItemsTypeNameIfEmpty(APropField, AParams, LKeyQualifiedTypeName, LValueQualifiedTypeName);

  if LKeyQualifiedTypeName.IsEmpty then
    LKeyQualifiedTypeName := ADuckDictionary.GetKeyQualifiedTypeName;
  if LValueQualifiedTypeName.IsEmpty then
    LValueQualifiedTypeName := ADuckDictionary.GetValueQualifiedTypeName;

  LKeyRttiType   := TdjRTTI.QualifiedTypeNameToRttiType(LKeyQualifiedTypeName);
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
  for LJObj in LJSONArray do
  begin
    // Get the key anche value JSONValue
    case AParams.SerializationMode of
      smJavaScript:
      begin
        // Key can be any value (string, objects etc).
        //  NB: Non ho trovato un modo per generare un JSONValue singolo che non sia
        //       all'interno di un JSONObject oppure JSONArray, per cui faccio fare
        //       il Parse forzatamente su un JSONArray e poi ne prelevo il JSONValue contenuto.
        LTmpKeyJSONArray := TJSONArray(TJSONArray.Parse(   '['+LJObj.Names[0]+']'   ));
        LKeyJSONValue   := LTmpKeyJSONArray.Items[0];
        LValueJSONValue := LJObj.Items[0];
      end;
      smDataContract:
      begin
        LKeyJSONValue   := LJObj.Items[LJObj.IndexOf(DJ_KEY)];
        LValueJSONValue   := LJObj.Items[LJObj.IndexOf(DJ_VALUE)];
      end;
    else
      raise Exception.Create('TdjEngineJDO.DeserializeDictionary: Unknown AParams.SerializationMode');
    end;
    // Deserialization key and value
    LKey   := DeserializePropField(LKeyJSONValue, LKeyRttiType, APropField, nil, AParams);
    LValue := DeserializePropField(LValueJSONValue, LValueRttiType, APropField, nil, AParams);
    // If the SerializationMode equals to smJavaScript then Free the LKeyJSONValue
    //  becaouse not owned by anyone
    if AParams.SerializationMode = smJavaScript then
      FreeAndNil(LTmpKeyJSONArray);
    // Add to the dictionary
    ADuckDictionary.Add(LKey, LValue);
  end;
  // If everething OK!
end;

class function TdjEngineJDO.DeserializeEnumeration(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): TValue;
begin
  if AValueType.QualifiedName = 'System.Boolean' then
  begin
    // If JSONValue not assigned or NULL
    if (not Assigned(AJSONValue))
    or (AJSONValue.Typ = TJsonDataType.jdtNone)
    or (AJSONValue.Typ = TJsonDataType.jdtObject)  // The type is jdtObject when NULL
    or (AJSONValue.Typ <> TJsonDataType.jdtBool)  // The type is not a JSON boolean type
    then
      Exit(False);
    Result := AJSONValue.BoolValue
  end
  else // it is an enumerated value but it's not a boolean.
    TValue.Make(AJSONValue.IntValue, AValueType.Handle, Result);
end;

class function TdjEngineJDO.DeserializeFloat(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): TValue;
var
  LQualifiedTypeName: String;
begin
  // Get the type name
  LQualifiedTypeName := AValueType.QualifiedName;
  // If JSONValue not assigned or NULL
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  or (AJSONValue.Typ = TJsonDataType.jdtObject)  // The type is jdtObject when NULL
  then
    Exit(0);
  // TDate (string expected)
  if (LQualifiedTypeName = 'System.TDate') then
    Exit(   TValue.From<TDate>(AJSONValue.DateTimeValue)   );
  // TDateTime (string expected)
  if (LQualifiedTypeName = 'System.TDateTime') then
    Exit(   TValue.From<TDateTime>(AJSONValue.DateTimeValue)   );
  // TTime (string expected)
  if (LQualifiedTypeName = 'System.TTime') then
    Exit(   TValue.From<TTime>(AJSONValue.DateTimeValue)   );
  // Normal float value (Float expected)
  if (AJSONValue.Typ = TJsonDataType.jdtFloat) then
    Exit(AJSONValue.FloatValue);
  // Integer value (Float expected)
  if (AJSONValue.Typ = TJsonDataType.jdtInt) then
    Exit(AJSONValue.IntValue);
  // Otherwise (raise)
  raise EdjEngineError.Create('Cannot deserialize float value.');
end;

class function TdjEngineJDO.DeserializeInt(const AJSONValue: PJsonDataValue;
  const AValueType: TRttiType): TValue;
begin
  // If JSONValue not assigned or NULL
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  or (AJSONValue.Typ = TJsonDataType.jdtObject)  // The type is jdtObject when NULL
  then
    Exit(0);
  Result := AJSONValue.IntValue;
end;

class function TdjEngineJDO.DeserializeInterface(const AJSONValue: PJsonDataValue; const AValueType: TRttiType;
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
  DeserializeClassCommon(LChildObj, AJSONValue, APropField, AParams);
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

class procedure TdjEngineJDO.DeserializeList(const ADuckList: IdjDuckList; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LListTypeName, LValueQualifiedTypeName: String;
  LJSONObject: TJSONObject;
  LJSONValue, LValueJSONValue: PJsonDataValue;
  LJSONArray: TJSONArray;
  LValueRTTIType: TRttiType;
  LValue: TValue;
  I: Integer;
begin
  // Checks
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  then
    Exit;
  // Defaults
  LListTypeName           := '';
  LValueQualifiedTypeName := '';
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if AJSONValue.Typ <> TJsonDataType.jdtObject then
      raise EdjEngineError.Create('Wrong serialization for ' + ADuckList.DuckObjQualifiedName);
    LJSONObject := AJSONValue.ObjectValue;
    // Get the collection anche the value type name
    LListTypeName := LJSONObject.S[DJ_TYPENAME];
    // If JSONValue not assigned or NULL (the DataType is jdtOvject when the value is null)
    if not ((LJSONObject.Types[DJ_VALUE] = TJsonDataType.jdtNone) or (LJSONObject.Types[DJ_VALUE] = TJsonDataType.jdtObject)) then
      LValueQualifiedTypeName := LJSONObject.S[DJ_VALUE];
    // Get the items array
    LJSONValue := LJSONObject.Items[LJSONObject.IndexOf('items')];
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if LJSONValue.Typ <> TJsonDataType.jdtArray then
    raise EdjEngineError.Create('Cannot restore the list because the related JSONValue is not an array');
  LJSONArray := LJSONValue.ArrayValue;
  // Get values RttiType, if the RttiType is not found then check for
  //  "MapperItemsClassType"  or "MapperItemsType" attribute or from PARAMS
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
    LValue := DeserializePropField(LValueJSONValue, LValueRttiType, APropField, nil, AParams);
    // Add to the list
    ADuckList.AddValue(LValue);
  end;
end;

class function TdjEngineJDO.DeserializePropField(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMaster: TValue; const AParams: IdjParams): TValue;
var
  LValueQualifiedTypeName: String;
  LValueType: TRttiType;
  LdsonTypeAttribute: djTypeAttribute;
begin
  // Init
  Result := TValue.Empty;
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
    // Cerca il ValueType in una eventuale JSONAnnotation
    if AParams.TypeAnnotations
    and (AJSONValue.Typ = TJsonDataType.jdtObject)
    and not IsJsonNull(AJSONValue)
    then
      LValueQualifiedTypeName := AJSONValue.ObjectValue.S[DJ_TYPENAME];
    // Se ancora non è stato determinato il ValueType prova anche a vedere se  stato specificato
    //  l'attributo dsonTypeAttribute
    if LValueQualifiedTypeName.IsEmpty and Assigned(APropField)
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
  and DeserializeCustom(AJSONValue, LValueType, APropField, AMaster.AsObject, AParams, Result)
  then
    Exit;
  // Deserialize by TypeKind
  case LValueType.TypeKind of
    tkEnumeration:
      Result := DeserializeEnumeration(AJSONValue, LValueType);
    tkInteger, tkInt64:
      Result := DeserializeInt(AJSONValue, LValueType);
    tkFloat:
      Result := DeserializeFloat(AJSONValue, LValueType);
    tkString, tkLString, tkWString, tkUString:
      Result := DeserializeString(AJSONValue);
//      Result := AJSONValue.Value;
    tkChar, tkWChar:
      Result := DeserializeChar(AJSONValue);
    tkRecord:
      Result := DeserializeRecord(AJSONValue, LValueType, APropField, AParams);
    tkClass:
      Result := DeserializeClass(
        AJSONValue,
        LValueType,
        APropField,
        AMaster.AsObject,
        AParams
        );
    tkInterface:
      Result := DeserializeInterface(
        AJSONValue,
        LValueType,
        APropField,
        AMaster.AsObject,
        AParams
        );
    tkArray, tkDynArray:
      Result := DeserializeArray(AJSONValue, APropField, AMaster, AParams);
  end;
end;

class function TdjEngineJDO.DeserializeRecord(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue;
var
  LQualifiedTypeName: string;
begin
  // Get the type name
  LQualifiedTypeName := AValueType.QualifiedName;
  // TDate (integer expected)
  if (LQualifiedTypeName = 'System.SysUtils.TTimeStamp') then
  begin
    // If JSONValue not assigned or NULL
    if (not Assigned(AJSONValue))
    or (AJSONValue.Typ = TJsonDataType.jdtNone)
    or (AJSONValue.Typ = TJsonDataType.jdtObject)  // The type is jdtObject when NULL
    then
      Exit(  TValue.From<TTimeStamp>(MSecsToTimeStamp(0))  );
    Result := TValue.From<TTimeStamp>(MSecsToTimeStamp(AJSONValue.IntValue));
  end
  // TValue
  else if LQualifiedTypeName = 'System.Rtti.TValue' then
    Result := DeserializeTValue(AJSONValue, APropField, AParams)
  else
   raise Exception.Create('TdjEngineJDO.DeserializeRecord: Unknown LQualifiedTypeName.');
end;

class procedure TdjEngineJDO.DeserializeStream(AStream: TObject;
  const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject);
var
  LStreamASString: string;
  LdsonEncodingAttribute: djEncodingAttribute;
  LEncoding: TEncoding;
  LStringStream: TStringStream;
  LStreamWriter: TStreamWriter;
begin
  // Checks
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  or not (Assigned(AStream) and (AStream is TStream))
  then
    Exit;
  // Get the stream as string from the JSONValue
  if AJSONValue.Typ <> TJsonDataType.jdtString then
    raise EdjEngineError.Create('Deserialize stream: JSONString expected.');
  LStreamASString := AJSONValue.Value;
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

class procedure TdjEngineJDO.DeserializeStreamableObject(const ADuckStreamable:IdjDuckStreamable;
  const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject);
var
  LValueAsString: string;
  LStringStream: TStringStream;
  LMemoryStream: TMemoryStream;
begin
  // Checks
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  then
    Exit;
  // Init
  LValueAsString := AJSONValue.Value;
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

class function TdjEngineJDO.DeserializeString(
  const AJSONValue: PJsonDataValue): TValue;
begin
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtObject)
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  then
    Exit('');
  Result := AJSONValue.Value;
end;

class function TdjEngineJDO.DeserializeTValue(const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams:IdjParams): TValue;
var
  LJObj: TJSONObject;
  LValueQualifiedTypeName: String;
  LValueRTTIType: TRttiType;
  LJSONValue: PJsonDataValue;
begin
  // Defaults
  LValueQualifiedTypeName := '';
  // If JSONValue not assigned
  if (not Assigned(AJSONValue)) or IsJsonNull(AJSONValue) then
    Exit(TValue.Empty);
  // If TypeAnnotations is true then get the "items" JSONArray containing che containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if (AJSONValue.Typ <> TJsonDataType.jdtObject) then
      raise EdjEngineError.Create('Wrong serialization for TValue');
    // Extract the JSONObject from the received JSONValue
    LJObj := AJSONValue.ObjectValue;
    // Get the value type name
    LValueQualifiedTypeName := LJObj.S[DJ_TYPENAME];
    // Extract the contained TValue value
    LJSONValue := LJObj.Items[LJObj.IndexOf(DJ_VALUE)];
  end
  else
    LJSONValue := AJSONValue;
  // Get values RttiType, if the RttiType is not found then check for
  //  "dsonType" attribute
  TdjUtils.GetTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);
  LValueRTTIType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if not Assigned(LValueRTTIType) then
    raise EdjEngineError.Create('Value type not found deserializing a TValue');
  // Durante la serializzazione del TVAlue, se questo conteneva un oggetto/interfaccia
  //  il serializzatore lo ha serializzato con il parametro "AUSeClassName = False" perchè
  //  siccome la serializzazione del TValue inserisce anch'essa il QualifiedTypeName del
  //  valore si sarebbe venuto a creare un doppione.
  //  Per questo motivo ora inietto il QualifiedTypeName dell'oggetto da deserializzare
  //  (se si tratta di un oggetto) nel JSONObject come se fosse stato originariamente inserito
  //  dal "SerializeObject" in modo che il "DeserializeObject" lo possa trovare e utilizzare.
  if  AParams.TypeAnnotations
  and (   (LValueRTTIType.TypeKind = tkClass) or (LValueRTTIType.TypeKind = tkInterface)   )
  then
    LJSONValue.ObjectValue.S[DJ_TYPENAME] := LValueQualifiedTypeName;
  // Deserialize the value
  Result := DeserializePropField(LJSONValue, LValueRTTIType, APropField, nil, AParams);
end;

class function TdjEngineJDO.IsJsonNull(
  const AJSONValue: PJsonDataValue): Boolean;
begin
  Result := (AJSONValue.Typ = TJsonDataType.jdtObject) and not Assigned(AJSONValue.ObjectValue);
end;

class function TdjEngineJDO.Serialize(const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean): String;
var
  LJSONValue: TJsonDataValue;
begin
  SerializePropField(@LJSONValue, AValue, APropField, AParams, AEnableCustomSerializers);
  case LJSONValue.Typ of
    TJsonDataType.jdtObject:
    begin
      Result := LJSONValue.ObjectValue.ToJSON(NOT AParams.PrettyPrint);
      LJSONValue.ObjectValue.Free;
    end;
    TJsonDataType.jdtArray:
    begin
      Result := LJSONValue.ArrayValue.ToJSON(NOT AParams.PrettyPrint);
      LJSONValue.ArrayValue.Free;
    end
  else
    Result := LJSONValue.Value;
  end;
end;

class procedure TdjEngineJDO.SerializeArray(const AResult: PJsonDataValue;
  const AValue: TValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams);
var
  LValueQualifiedTypeName: String;
  LJSONArray: TJSONArray;
  LFirst: Boolean;
  LIndex: Integer;
  LValue: TValue;
  LJSONValue: PJsonDataValue;
  LResultJSONObj: TJSONObject;
begin
  // Init
  LValueQualifiedTypeName := '';
  // Create the Items JSON array
  LJSONArray := TJSONArray.Create;
  // Loop for all objects in the list (now compatible with interfaces)
  LFirst := True;
  LJSONArray.Count := AValue.GetArrayLength;
  for LIndex := 0 to AValue.GetArrayLength-1 do
  begin
    // Get the current elemente of the array as TValue
    LValue := AValue.GetArrayElement(LIndex);
    // Create the new PJsonDataValue
    LJSONValue := LJSONArray.Items[LIndex];
    // Serialize values
    SerializePropField(LJSONValue, LValue, APropField, AParams);
    // If first loop then add the type infos
    if AParams.TypeAnnotations and LFirst then
    begin
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
      LFirst := False;
    end;
  end;
  // If TypeAnnotations is enabled then return a JSONObject with ClassName and a JSONArray containing the list items
  //  else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    LResultJSONObj := TJSONObject.Create;
    if not LValueQualifiedTypeName.IsEmpty then
      LResultJSONObj.S[DJ_VALUE] := LValueQualifiedTypeName;
    LResultJSONObj.A['items'] := LJSONArray;
    AResult.ObjectValue := LResultJSONObj;
  end
  else
    AResult.ArrayValue := LJSONArray;
end;

class procedure TdjEngineJDO.SerializeChar(const AResult: PJsonDataValue;
  const AValue: TValue; const AParams: IdjParams);
begin
  if AValue.AsString = #0 then
  begin
    if AParams.EmptyCharAsNull then
      AResult.ObjectValue := nil  // Set as NULL
    else
      AResult.Value := '';
  end
  else
    AResult.Value := AValue.AsString;
end;

class procedure TdjEngineJDO.SerializeClass(const AResult:PJsonDataValue; const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  AChildObj: TObject;
  LTypeInfoCacheItem: TdjTypeInfoCacheItem;
begin
  AChildObj := AValue.AsObject;
  if not Assigned(AChildObj) then
    Exit;
  LTypeInfoCacheItem := AParams.TypeInfoCache.Get(AValue.AsObject);
  case LTypeInfoCacheItem.DuckType of
    dtNone:
      AResult.ObjectValue := SerializeObject(AChildObj, AParams);
    dtList:
      SerializeList(AResult, LTypeInfoCacheItem.DuckListWrapper, APropField, AParams);
    dtStreamable:
      SerializeStreamableObject(AResult, LTypeInfoCacheItem.DuckStreamableWrapper, APropField);
    dtDictionary:
      SerializeDictionary(AResult, LTypeInfoCacheItem.DuckDictionaryWrapper, APropField, AParams);
    dtStream:
      SerializeStream(AResult, AChildObj, APropField);
  end;
end;

class function TdjEngineJDO.SerializeCustom(const AResult: PJsonDataValue;
  AValue: TValue; const APropField: TRttiNamedObject;
  const AParams: IdjParams): Boolean;
var
  LSerializer: TdjJDOCustomSerializerRef;
  LMapperCustomSerializer: djSerializerJDOAttribute;
  LJSONValue: PJsonDataValue;
  LJSONObj: TJSONObject;
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
  if AParams.Serializers.Exists_JDO(AValue.TypeInfo) then
    LSerializer := AParams.Serializers._GetSerializerItem(AValue.TypeInfo).JDOSerializer
  else
  if TdjRTTI.HasAttribute<djSerializerJDOAttribute>(TdjRTTI.TypeInfoToRttiType(AValue.TypeInfo), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit;
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  //  in a JSONObject with the type information
  if AParams.TypeAnnotations and LSerializer.isTypeNotificationCompatible then
  begin
    LJSONObj := TJSONObject.Create;
    // Create & set the TypeName
    LJSONObj.S[DJ_TYPENAME] := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
    // Create & get the value JSONValue
    LJSONObj[DJ_VALUE] := nil;
    LJSONValue := LJSONObj.Items[LJSONObj.IndexOf(DJ_VALUE)];
    // Serialize value
    LSerializer.Serialize(LJSONValue, AValue);
    // Add the JSONObject to the result
    AResult.ObjectValue := LJSONObj;
  end
  else
    // Serialize
    LSerializer.Serialize(AResult, AValue);
  // All OK
  Result := True;
end;

class procedure TdjEngineJDO.SerializeDictionary(const AResult:PJsonDataValue; const ADuckDictionary: IdjDuckDictionary;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LJSONArray: TJSONArray;
  LResultJSONObj, CurrJSONObj: TJSONObject;
  LJSONKey, LJSONValue: PJsonDataValue;
  LFirst: Boolean;
  LKey, LValue: TValue;
  TmpKeyStr, LKeyQualifiedTypeName, LValueQualifiedTypeName: String;
begin
  // Init
  LKeyQualifiedTypeName   := '';
  LValueQualifiedTypeName := '';
//  LJSONValue := nil;  NB: Hint prevention
  // Create the Items JSON array
  LJSONArray := TJSONArray.Create;
  // Loop
  LFirst := True;
  while ADuckDictionary.MoveNext do
  begin
    // Read values
    LKey   := ADuckDictionary.GetCurrentKey;
    LValue := ADuckDictionary.GetCurrentValue;
    // Create the JSONObject for the current element (to add to the array)
    //  and create/get the empties JSONValues
    CurrJSONObj := TJSONObject.Create;
    try
      CurrJSONObj[DJ_KEY] := nil;
      LJSONKey := CurrJSONObj.Items[CurrJSONObj.IndexOf(DJ_KEY)];
      // Serialize values
      SerializePropField(LJSONKey, LKey, APropField, AParams);
      // If first loop then add the type infos
      if AParams.TypeAnnotations and LFirst then
      begin
        LKeyQualifiedTypeName   := TdjRTTI.TypeInfoToQualifiedTypeName(LKey.TypeInfo);
        LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
        LFirst := False;
      end;
      // Add the current element to the JSONArray
      case AParams.SerializationMode of
        smJavaScript:
        begin
          // Create/Get the value JSONValue and serialize it
          TmpKeyStr := LJSONKey.Value;
          CurrJSONObj.Remove(DJ_KEY);
          CurrJSONObj[TmpKeyStr] := nil;
          LJSONValue := CurrJSONObj.Items[CurrJSONObj.IndexOf(TmpKeyStr)];
        end;
        smDataContract:
        begin
          // Create/Get the value JSONValue and serialize it
          CurrJSONObj[DJ_VALUE] := nil;
          LJSONValue := CurrJSONObj.Items[CurrJSONObj.IndexOf(DJ_VALUE)];
        end;
      else raise Exception.Create('TdjEngineJDO.SerializeDictionary: Unknown AParams.SerializationMode');
      end;
      // Serialize the value
      SerializePropField(LJSONValue, LValue, APropField, AParams);
      // Add to the jsonarray
      LJSONArray.Add(CurrJSONObj);
    except
      CurrJSONObj.Free;
      raise;
    end;
  end;
  // If AUseClassName is true then return a JSONObject with ClassName and a JSONArray containing the list items
  //  else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    LResultJSONObj := TJSONObject.Create;
    LResultJSONObj.S[DJ_TYPENAME] := ADuckDictionary.DuckObjQualifiedName;
    if not LKeyQualifiedTypeName.IsEmpty then
      LResultJSONObj.S[DJ_KEY] := LKeyQualifiedTypeName;
    if not LValueQualifiedTypeName.IsEmpty then
      LResultJSONObj.S[DJ_VALUE] := LValueQualifiedTypeName;
    LResultJSONObj.A['items'] := LJSONArray;
    AResult.ObjectValue := LResultJSONObj;
  end
  else
    AResult.ArrayValue := LJSONArray;
end;

class procedure TdjEngineJDO.SerializeEnumeration(const AResult:PJsonDataValue;
  const AValue: TValue);
var
  LQualifiedTypeName: String;
begin
  // Get the type name
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  // Boolean
  if LQualifiedTypeName = 'System.Boolean' then
    AResult.BoolValue := AValue.AsBoolean
  // Other enumeration
  else
    AResult.IntValue := AValue.AsOrdinal;
end;

class procedure TdjEngineJDO.SerializeFloat(const AResult:PJsonDataValue;
  const AValue: TValue; const AParams:IdjParams);
var
  LQualifiedTypeName: String;
begin
  // Get the type name
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  // TDate
  if LQualifiedTypeName = 'System.TDate' then
  begin
    if AValue.AsExtended <> 0 then
      AResult.Value := TdjUtils.ISODateToString(AValue.AsExtended, AParams);
  end
  // TDateTime
  else if LQualifiedTypeName = 'System.TDateTime' then
  begin
    if AValue.AsExtended <> 0 then
      AResult.Value := TdjUtils.ISODateTimeToString(AValue.AsExtended, AParams);
  end
  // TTime
  else if LQualifiedTypeName = 'System.TTime' then
   AResult.Value := TdjUtils.ISOTimeToString(AValue.AsExtended, AParams)
  // Float
  else
   AResult.FloatValue := AValue.AsExtended;
end;

class procedure TdjEngineJDO.SerializeInterface(const AResult:PJsonDataValue; const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  AChildInterface: IInterface;
  AChildObj: TObject;
begin
  AChildInterface := AValue.AsInterface;
  AChildObj := AChildInterface as TObject;
  SerializeClass(AResult, AChildObj, APropField, AParams);
end;

class procedure TdjEngineJDO.SerializeList(const AResult:PJsonDataValue; const ADuckList: IdjDuckList;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LValueQualifiedTypeName: String;
  LJSONArray: TJSONArray;
  I: Integer;
  LValue: TValue;
  LJSONValue: PJsonDataValue;
  LFirst: Boolean;
  LResultJSONObj: TJSONObject;
begin
  // Init
  LValueQualifiedTypeName := '';
  // Create the Items JSON array
  LJSONArray := TJSONArray.Create;
  // Loop for all objects in the list (now compatible with interfaces)
  LFirst := True;
  LJSONArray.Count := ADuckList.Count;
  for I := 0 to ADuckList.Count-1 do
  begin
    // Read values
    LValue := ADuckList.GetItemValue(I);
    // Create the new PJsonDataValue
    LJSONValue := LJSONArray.Items[I];
    // Serialize values
    SerializePropField(LJSONValue, LValue, APropField, AParams);
    // If first loop then add the type infos
    if AParams.TypeAnnotations and LFirst then
    begin
      LValueQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(LValue.TypeInfo);
      LFirst := False;
    end;
  end;
  // If TypeAnnotations is enabled then return a JSONObject with ClassName and a JSONArray containing the list items
  //  else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    LResultJSONObj := TJSONObject.Create;
    LResultJSONObj.S[DJ_TYPENAME] := ADuckList.DuckObjQualifiedName;  // List typename
    LResultJSONObj.S[DJ_VALUE] := LValueQualifiedTypeName;  // Items typename
    LResultJSONObj.A['items'] := LJSONArray;
    AResult.ObjectValue := LResultJSONObj;
  end
  else
    AResult.ArrayValue := LJSONArray;
end;

class function TdjEngineJDO.SerializeObject(const AInterfacedObject: IInterface;
  const AParams: IdjParams): TJSONBox;
begin
  Result := SerializeObject(AInterfacedObject as TObject, AParams);
end;

class procedure TdjEngineJDO.SerializePropField(const AResult:PJsonDataValue; const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean);
begin
  // If a custom serializer exists for the current type then use it
  if AEnableCustomSerializers and AParams.EnableCustomSerializers and SerializeCustom(AResult, AValue, APropField, AParams) then
    Exit;
  // Standard serialization by TypeKind
  case AValue.Kind of
    tkInteger, tkInt64:
      AResult.IntValue := AValue.AsInteger;
    tkFloat:
      SerializeFloat(AResult, AValue, AParams);
    tkString, tkLString, tkWString, tkUString:
      SerializeString(AResult, AValue, AParams);
    tkChar, tkWChar:
      SerializeChar(AResult, AValue, AParams);
    tkEnumeration:
      SerializeEnumeration(AResult, AValue);
    tkRecord:
      SerializeRecord(AResult, AValue, APropField, AParams);
    tkClass:
      SerializeClass(AResult, AValue, APropField, AParams);
    tkInterface:
      SerializeInterface(AResult, AValue, APropField, AParams);
    tkArray, tkDynArray:
      SerializeArray(AResult, AValue, APropField, AParams);
  end;
end;

class function TdjEngineJDO.SerializeObject(const AObject: TObject;
  const AParams: IdjParams): TJSONBox;
var
  LPropField: System.Rtti.TRttiNamedObject;
  LPropsFields: TArray<System.Rtti.TRttiNamedObject>;
  LKeyName: String;
  LJSONValue: PJsonDataValue;
  LValue: TValue;
begin
  Result := TJSONBox.Create;
  try
    // add the $dmvc.classname property to allows a strict deserialization
    if AParams.TypeAnnotations then
      Result.S[DJ_TYPENAME] := AObject.QualifiedClassName;
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
      if (LPropField.Name = 'FRefCount')
      or (LPropField.Name = 'RefCount')
      or TdjRTTI.HasAttribute<djSkipAttribute>(LPropField)
      or TdjUtils.IsPropertyToBeIgnored(LPropField, AParams)
      then
        Continue;
      // Get the KeyName
      LKeyName := TdjUtils.GetKeyName(LPropField, AParams);
      // Get the current property value
      LValue := TdjDuckPropField.GetValue(AObject, LPropField);
      // Get the key
      Result[LKeyName] := nil;
      // Create/Get the JSONValue
      LJSONValue := Result.Items[Result.IndexOf(LKeyName)];
      // Serialize the current property
      SerializePropField(LJSONValue, LValue, LPropField, AParams);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TdjEngineJDO.DeserializeObject(const AJSONBox: TJSONBox; AObject: TObject;
  const AParams: IdjParams): TObject;
var
  LJSONValue: PJsonDataValue;
  LPropField: System.Rtti.TRttiNamedObject;
  LPropsFields: TArray<System.Rtti.TRttiNamedObject>;
  LKeyName: String;
  LValue: TValue;
begin
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
    if (not TdjDuckPropField.IsWritable(LPropField) and (TdjDuckPropField.RttiType(LPropField).TypeKind <> tkClass) and (TdjDuckPropField.RttiType(LPropField).TypeKind <> tkInterface))
    or (LPropField.Name = 'FRefCount')
    or (LPropField.Name = 'RefCount')
    or TdjUtils.IsPropertyToBeIgnored(LPropField, AParams)
    or (TdjRTTI.HasAttribute<djSkipAttribute>(LPropField))
    then
      Continue;
    // Get the JSONPair KeyName
    LKeyName := TdjUtils.GetKeyName(LPropField, AParams);
    // Check if JSONPair exists
    if AJSONBox.Contains(LKeyName) then
      LJSONValue := AJSONBox.Items[AJSONBox.IndexOf(LKeyName)]
    else
      LJSONValue := nil;
    // Deserialize the currente member and assign it to the object member
    LValue := DeserializePropField(LJSONValue, TdjDuckPropField.RttiType(LPropField), LPropField, AObject, AParams);
    if not LValue.IsEmpty then
      TdjDuckPropField.SetValue(AObject, LPropField, LValue, AParams);
  end;
  Result := AObject;
end;


class procedure TdjEngineJDO.SerializeRecord(const AResult:PJsonDataValue; const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LQualifiedTypeName: String;
  LTimeStamp: TTimeStamp;
begin
  // Get the type name
  LQualifiedTypeName := TdjRTTI.TypeInfoToQualifiedTypeName(AValue.TypeInfo);
  // TimeStamp
  if LQualifiedTypeName = 'System.SysUtils.TTimeStamp' then
  begin
    LTimeStamp := AValue.AsType<System.SysUtils.TTimeStamp>;
    AResult.FloatValue := TimeStampToMsecs(LTimeStamp);
  end
  // TValue
  else if LQualifiedTypeName = 'System.Rtti.TValue' then
  begin
    SerializeTValue(AResult, AValue.AsType<TValue>, APropField, AParams);
  end;
end;

class procedure TdjEngineJDO.SerializeStream(const AResult:PJsonDataValue; const AStream: TObject;
  const APropField: TRttiNamedObject);
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
      AResult.Value := LStringStream.DataString;
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
      AResult.Value := LStringStream.DataString;
    finally
      LStringStream.Free;
    end;
    // -------------------------------------------------------------------------
  end;
end;

class procedure TdjEngineJDO.SerializeStreamableObject(const AResult:PJsonDataValue; const ADuckStreamable:IdjDuckStreamable;
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
    AResult.Value := LStringStream.DataString;
  finally
    LMemoryStream.Free;
    LStringStream.Free;
  end;
end;

class procedure TdjEngineJDO.SerializeString(const AResult: PJsonDataValue;
  const AValue: TValue; const AParams: IdjParams);
begin
  if AValue.AsString.IsEmpty and AParams.EmptyStringAsNull then
    AResult.ObjectValue := nil  // Set as NULL
  else
    AResult.Value := AValue.AsString;
end;

class procedure TdjEngineJDO.SerializeTValue(const AResult:PJsonDataValue; const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LJSONObject: TJSONObject;
  LTypeJSONValue, LJSONValue: PJsonDataValue;
  LRttiType: TRttiType;
begin
  // If the TValue is empty then return a TJSONNull and exit
  if AValue.IsEmpty then
    Exit;
  // Init
  LRttiType := TdjRTTI.TypeInfoToRttiType(AValue.TypeInfo);
  // Add the qualified type name if enabled
  if AParams.TypeAnnotations then
  begin
    // Prepare an empty JSONObject;
    LJSONObject := TJSONObject.Create;
    AResult.ObjectValue := LJSONObject;
    // Create a new JSONValue for the type name
    LJSONObject[DJ_TYPENAME] := nil;
    LTypeJSONValue := LJSONObject.Items[LJSONObject.IndexOf(DJ_TYPENAME)];
    // Create a new JSONValue for the value
    LJSONObject[DJ_VALUE] := nil;
    LJSONValue := LJSONObject.Items[LJSONObject.IndexOf(DJ_VALUE)];
    // Deserialize the value
    SerializePropField(LJSONValue, AValue, APropField, AParams);
    // Extract the qualified type name of the value
    if (LRttiType.TypeKind = tkClass) or (LRttiType.TypeKind = tkInterface) then
    begin
      LTypeJSONValue.Value := LJSONValue.ObjectValue.S[DJ_TYPENAME];
      LJSONValue.ObjectValue.Remove(DJ_TYPENAME);
    end
    else
      LTypeJSONValue.Value := LRttiType.QualifiedName;
  end
  // else if TypeAnnotations disabled...
  else
    SerializePropField(AResult, AValue, APropField, AParams);
end;

end.
