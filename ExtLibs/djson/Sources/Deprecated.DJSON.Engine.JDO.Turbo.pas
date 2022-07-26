unit DJSON.Engine.JDO.Turbo;

interface

uses
  DJSON.Params, JsonDataObjects, System.Rtti, DJSON.Duck.Interfaces;

type

  TJSONBox = TJSONObject;

  TdjEngineTurboJDO = class(TdjEngineIntf)
  private
    class function IsJsonNull(const AJSONValue: PJsonDataValue): Boolean;
  protected
    // Serializers
//    class procedure SerializePropField(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True); static;
//    class procedure SerializeFloat(const AResult:PJsonDataValue; const AValue: TValue; const AParams:IdjParams); static;
//    class procedure SerializeEnumeration(const AResult:PJsonDataValue; const AValue: TValue); static;
//    class procedure SerializeString(const AResult:PJsonDataValue; const AValue: TValue; const AParams: IdjParams); static;
//    class procedure SerializeChar(const AResult:PJsonDataValue; const AValue: TValue; const AParams: IdjParams); static;
//    class procedure SerializeRecord(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
//    class procedure SerializeArray(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
//    class procedure SerializeClass(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
//    class procedure SerializeInterface(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
//    class function SerializeObject(const AObject: TObject; const AParams: IdjParams): TJSONBox; overload; static;
//    class function SerializeObject(const AInterfacedObject: IInterface; const AParams: IdjParams): TJSONBox; overload; static;
//    class procedure SerializeTValue(const AResult:PJsonDataValue; const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
//    class procedure SerializeList(const AResult:PJsonDataValue; const ADuckList: IdjDuckList; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
//    class procedure SerializeDictionary(const AResult:PJsonDataValue; const ADuckDictionary: IdjDuckDictionary; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
//    class procedure SerializeStreamableObject(const AResult:PJsonDataValue; const ADuckStreamable:IdjDuckStreamable; const APropField: TRttiNamedObject); static;
//    class procedure SerializeStream(const AResult:PJsonDataValue; const AStream: TObject; const APropField: TRttiNamedObject); static;
//    class function SerializeCustom(const AResult:PJsonDataValue; AValue:TValue; const APropField: TRttiNamedObject; const AParams: IdjParams): Boolean; static;
    // Deserializers
    class function DeserializePropField(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: Tvalue; const AParams: IdjParams): TValue; static;
    class function DeserializeInt(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): Integer; static;
//    class function DeserializeFloat(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): TValue; static;
//    class function DeserializeEnumeration(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): TValue; static;
    class function DeserializeString(const AJSONValue: PJsonDataValue): String; static;
//    class function DeserializeChar(const AJSONValue: PJsonDataValue): TValue; static;
//    class function DeserializeRecord(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
//    class function DeserializeArray(const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; static;
    class procedure DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class function DeserializeClass(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
//    class function DeserializeInterface(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue; static;
    class function DeserializeObject(const AJSONBox: TJSONBox; AObject:TObject; const AParams: IdjParams): TObject; static;
//    class function DeserializeTValue(const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams): TValue; static;
    class procedure DeserializeList(const ADuckList: IdjDuckList; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject; const AParams: IdjParams); static;
    class procedure DeserializeStreamableObject(const ADuckStreamable:IdjDuckStreamable; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject); static;
    class procedure DeserializeStream(AStream: TObject; const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject); static;
//    class function DeserializeCustom(const AJSONValue: PJsonDataValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMasterObj: TObject; const AParams: IdjParams; out ResultValue:TValue): Boolean; static;
  public
    class function Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True): String; override;
    class function Deserialize(const AJSONText:String; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; override;
  end;

implementation

uses
  DJSON.Attributes, DJSON.Constants, System.SysUtils, DJSON.Duck.PropField,
  DJSON.Utils.RTTI, DJSON.Utils, System.TypInfo, DJSON.TypeInfoCache,
  DJSON.Exceptions;

{ TdjEngineTurboJDO }

{ TdjEngineTurboJDO }

class function TdjEngineTurboJDO.Deserialize(const AJSONText: String; const AValueType: TRttiType; const APropField: TRttiNamedObject;
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

class function TdjEngineTurboJDO.DeserializeClass(const AJSONValue: PJsonDataValue; const AValueType: TRttiType;
  const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IdjParams): TValue;
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

class procedure TdjEngineTurboJDO.DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: PJsonDataValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
var
  LTypeInfoCacheItem: TdjTypeInfoCacheItem;
begin
  LTypeInfoCacheItem := AParams.TypeInfoCache.Get(AChildObj);
  case LTypeInfoCacheItem.DuckType of
    dtNone:
    begin
      if (AJSONValue = nil) or (AJSONValue.Typ = TJsonDataType.jdtNone) then
        FreeAndNil(AChildObj)
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

class procedure TdjEngineTurboJDO.DeserializeDictionary(const ADuckDictionary: IdjDuckDictionary; const AJSONValue: PJsonDataValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
begin

end;

class function TdjEngineTurboJDO.DeserializeInt(const AJSONValue: PJsonDataValue; const AValueType: TRttiType): Integer;
begin
  // If JSONValue not assigned or NULL
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  or (AJSONValue.Typ = TJsonDataType.jdtObject)  // The type is jdtObject when NULL
  then
    Exit(0);
  Result := AJSONValue.IntValue;
end;

class procedure TdjEngineTurboJDO.DeserializeList(const ADuckList: IdjDuckList; const AJSONValue: PJsonDataValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams);
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

class function TdjEngineTurboJDO.DeserializeObject(const AJSONBox: TJSONBox; AObject: TObject; const AParams: IdjParams): TObject;
var
  LJSONValue: PJsonDataValue;
  LProperty: System.Rtti.TRttiProperty;
  LProperties: TArray<System.Rtti.TRttiProperty>;
  LKeyName: String;
  LValue: TValue;
begin
  // Get members list
  LProperties := TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo).AsInstance.GetProperties;
  // Loop for all members
  for LProperty in LProperties do
  begin
    // Check to continue or not
    if (not TdjDuckPropField.IsWritable(LProperty) and (TdjDuckPropField.RttiType(LProperty).TypeKind <> tkClass) and (TdjDuckPropField.RttiType(LProperty).TypeKind <> tkInterface))
    or (LProperty.Name = 'FRefCount')
    or (LProperty.Name = 'RefCount')
    or TdjUtils.IsPropertyToBeIgnored(LProperty, AParams)
    or (TdjRTTI.HasAttribute<djSkipAttribute>(LProperty))
    then
      Continue;
    // Get the JSONPair KeyName
    LKeyName := TdjUtils.GetKeyName(LProperty, AParams);
    // Check if JSONPair exists
    if AJSONBox.Contains(LKeyName) then
      LJSONValue := AJSONBox.Items[AJSONBox.IndexOf(LKeyName)]
    else
      LJSONValue := nil;







    // Deserialize by TypeKind
    case LProperty.PropertyType.Handle.Kind of
      tkInteger, tkInt64:
        SetOrdProp(AObject, AParams.PropInfoCache.GetPropInfo(LProperty), DeserializeInt(LJSONValue, LProperty.PropertyType));
      tkString, tkLString, tkWString, tkUString:
        SetStrProp(AObject, AParams.PropInfoCache.GetPropInfo(LProperty), DeserializeString(LJSONValue));
    else
      // Deserialize the currente member and assign it to the object member
      LValue := DeserializePropField(LJSONValue, LProperty.PropertyType, LProperty, AObject, AParams);
      if not LValue.IsEmpty then
        TdjDuckPropField.SetValue(AObject, LProperty, LValue, AParams);
    end;



  end;
  Result := AObject;
end;

class function TdjEngineTurboJDO.DeserializePropField(const AJSONValue: PJsonDataValue; const AValueType: TRttiType;
  const APropField: TRttiNamedObject; const AMaster: Tvalue; const AParams: IdjParams): TValue;
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
    LValueType := TdjRTTI.QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  // ---------------------------------------------------------------------------
  // If a custom serializer exists for the current type then use it
//  if  AParams.EnableCustomSerializers
//  and DeserializeCustom(AJSONValue, LValueType, APropField, AMaster.AsObject, AParams, Result)
//  then
//    Exit;
  // Deserialize by TypeKind
  case LValueType.TypeKind of
//    tkEnumeration:
//      Result := DeserializeEnumeration(AJSONValue, LValueType);
    tkInteger, tkInt64:
      Result := DeserializeInt(AJSONValue, LValueType);
//    tkFloat:
//      Result := DeserializeFloat(AJSONValue, LValueType);
    tkString, tkLString, tkWString, tkUString:
      Result := DeserializeString(AJSONValue);
//    tkChar, tkWChar:
//      Result := DeserializeChar(AJSONValue);
//    tkRecord:
//      Result := DeserializeRecord(AJSONValue, LValueType, APropField, AParams);
    tkClass:
      Result := DeserializeClass(
        AJSONValue,
        LValueType,
        APropField,
        AMaster.AsObject,
        AParams
        );
//    tkInterface:
//      Result := DeserializeInterface(
//        AJSONValue,
//        LValueType,
//        APropField,
//        AMaster.AsObject,
//        AParams
//        );
//    tkArray, tkDynArray:
//      Result := DeserializeArray(AJSONValue, APropField, AMaster, AParams);
  end;
end;

class procedure TdjEngineTurboJDO.DeserializeStream(AStream: TObject; const AJSONValue: PJsonDataValue;
  const APropField: TRttiNamedObject);
begin

end;

class procedure TdjEngineTurboJDO.DeserializeStreamableObject(const ADuckStreamable: IdjDuckStreamable;
  const AJSONValue: PJsonDataValue; const APropField: TRttiNamedObject);
begin

end;

class function TdjEngineTurboJDO.DeserializeString(const AJSONValue: PJsonDataValue): String;
begin
  if (not Assigned(AJSONValue))
  or (AJSONValue.Typ = TJsonDataType.jdtObject)
  or (AJSONValue.Typ = TJsonDataType.jdtNone)
  then
    Exit('');
  Result := AJSONValue.Value;
end;

class function TdjEngineTurboJDO.IsJsonNull(const AJSONValue: PJsonDataValue): Boolean;
begin
  Result := (AJSONValue.Typ = TJsonDataType.jdtObject) and not Assigned(AJSONValue.ObjectValue);
end;

class function TdjEngineTurboJDO.Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean): String;
begin

end;

end.
