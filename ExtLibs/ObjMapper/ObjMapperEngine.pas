{ *******************************************************************************
   Unit added by Maurizio Del Magno to the ObjectsMappers of Daniele Teti
  ******************************************************************************** }

unit ObjMapperEngine;

interface

uses
  System.Rtti, System.JSON, DuckPropFieldU,
  System.SysUtils, System.Generics.Collections, System.TypInfo;

const
  DMVC_TYPENAME = '$dmvc_type';
  DMVC_KEY = '$dmvc_key';
  DMVC_VALUE = '$dmvc_value';

type

  TSerializationMode = (smJavaScript, smDataContract);

  TSerializationType = (stProperties, stFields);

  TJSONBox = TJSONObject;

  TJSONObjectActionProc = reference to procedure(const AJSONObject: TJSONObject);

  TIgnoredProperties = array of string;

  TomCustomSerializerRef = class of TomCustomSerializer;

  TomSerializersContainer = class;

  IomParams = interface
    ['{347611D7-F62B-49DB-B08A-E158D466F8AE}']
    // SerializationMode
    procedure SetSerializationMode(const AValue: TSerializationMode);
    function GetSerializationMode: TSerializationMode;
    property SerializationMode: TSerializationMode read GetSerializationMode write SetSerializationMode;
    // SerializationType
    procedure SetSerializationType(const AValue: TSerializationType);
    function GetSerializationType: TSerializationType;
    property SerializationType: TSerializationType read GetSerializationType write SetSerializationType;
    // TypeAnnotations
    procedure SetTypeAnnotations(const AValue: Boolean);
    function GetTypeAnnotations: Boolean;
    property TypeAnnotations: Boolean read GetTypeAnnotations write SetTypeAnnotations;
    // IgnoredProperties
    procedure SetIgnoredProperties(const AValue: TIgnoredProperties);
    function GetIgnoredProperties: TIgnoredProperties;
    property IgnoredProperties: TIgnoredProperties read GetIgnoredProperties write SetIgnoredProperties;
    // EnableCustomSerializers
    procedure SetEnableCustomSerializers(const AValue: Boolean);
    function GetEnableCustomSerializers: Boolean;
    property EnableCustomSerializers: Boolean read GetEnableCustomSerializers write SetEnableCustomSerializers;
    // Serializers
    function GetSerializers: TomSerializersContainer;
    property Serializers: TomSerializersContainer read GetSerializers;
    // ItemsKeyDefaultQualifiedName
    procedure SetItemsKeyDefaultQualifiedName(const AValue:String);
    function GetItemsKeyDefaultQualifiedName: String;
    property ItemsKeyDefaultQualifiedName: String read GetItemsKeyDefaultQualifiedName write SetItemsKeyDefaultQualifiedName;
    // ItemsValueDefaultQualifiedName
    procedure SetItemsValueDefaultQualifiedName(const AValue:String);
    function GetItemsValueDefaultQualifiedName: String;
    property ItemsValueDefaultQualifiedName: String read GetItemsValueDefaultQualifiedName write SetItemsValueDefaultQualifiedName;
    // ItemsKeyDefaultTypeInfo
    procedure SetItemsKeyDefaultTypeInfo(const AValue:PTypeInfo);
    function GetItemsKeyDefaultTypeInfo: PTypeInfo;
    property ItemsKeyDefaultTypeInfo: PTypeInfo read GetItemsKeyDefaultTypeInfo write SetItemsKeyDefaultTypeInfo;
    // ItemsValueDefaultTypeInfo
    procedure SetItemsValueDefaultTypeInfo(const AValue:PTypeInfo);
    function GetItemsValueDefaultTypeInfo: PTypeInfo;
    property ItemsValueDefaultTypeInfo: PTypeInfo read GetItemsValueDefaultTypeInfo write SetItemsValueDefaultTypeInfo;
  end;

  IomSerializersContainerItem = interface
    ['{E1632F5E-5DB8-4215-8C18-FA8B36E54225}']
    // Serializer
    function GetSerializer: TomCustomSerializerRef;
    procedure SetSerializer(const Value: TomCustomSerializerRef);
    property Serializer: TomCustomSerializerRef read GetSerializer write SetSerializer;
    // Params
    function GetParams: IomParams;
    procedure SetParams(const Value: IomParams);
    property Params: IomParams read GetParams write SetParams;
  end;

  TomCustomSerializer = class abstract
  public
    class function Serialize(const AValue:TValue; const AParams:IomParams; var ADone:Boolean): TJSONValue; virtual;
    class function Deserialize(const AJSONValue:TJSONValue; const AExistingValue:TValue; const AParams:IomParams; var ADone:Boolean): TValue; virtual;
  end;

  TomSerializersContainer = class
  strict private
    FSerializersContainer: TDictionary<String, IomSerializersContainerItem>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure &Register(const ATargetTypeInfo:PTypeInfo; const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil); overload;
    procedure &Register(const ATargetClass:TClass; const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil); overload;
    procedure &Register<Target>(const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil); overload;
    procedure &Register<Target; Serializer:TomCustomSerializer>(const AParams:IomParams=nil); overload;
    procedure Unregister(const ATargetTypeInfo:PTypeInfo); overload;
    procedure Unregister(const ATargetClass:TClass); overload;
    procedure Unregister<T>; overload;
    function _GetSerializerItem(const ATargetTypeInfo:PTypeInfo): IomSerializersContainerItem;
    function _Exists(const ATargetTypeInfo:PTypeInfo): Boolean;
    function Exists(const ATargetTypeInfo:PTypeInfo): Boolean; overload;
    function Exists(const ATargetClass:TClass): Boolean; overload;
    function Exists<T>: Boolean; overload;
  end;

  omEngine = class
  private
    class var ctx: TRttiContext;
    class function IsPropertyToBeIgnored(const APropField: TRttiNamedObject; const AParams: IomParams): Boolean; static;
    class function HasAttribute<T: class>(const ARTTIMember: TRttiNamedObject): boolean; overload;
    class function HasAttribute<T: class>(const ARTTIMember: TRttiNamedObject; out AAttribute: T): boolean; overload; static;
    class function GetKeyName(const ARttiMember: TRttiNamedObject; const AType: TRttiType): string; static;
    class function GetQualifiedTypeName(const ATypeInfo: Pointer): String; static;
    class function TValueToTObject(const AValue:TValue): TObject;
    class procedure GetItemsTypeNameIfEmpty(const APropField: TRttiNamedObject; const AParams:IomParams; var AValueTypeName: String); overload; static;
    class procedure GetItemsTypeNameIfEmpty(const APropField: TRttiNamedObject; const AParams:IomParams; var AKeyTypeName, AValueTypeName: String); overload; static;
  public
    class procedure Initialize; static;
    class function GetCtx: TRttiContext; static;
    class function TypeInfoToRttiType(const ATypeInfo: Pointer): TRttiType; static;
    class function QualifiedTypeNameToRttiType(const AQualifiedTypeName:String): TRttiType; static;
    // Parameters
    class function DefaultByProperty: IomParams; static;
    class function DefaultByFields: IomParams; static;
    // Serializers
    class function SerializePropField(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams; const AEnableCustomSerializers:Boolean=True): TJSONValue; static;
    class function SerializeFloat(const AValue: TValue): TJSONValue; static;
    class function SerializeEnumeration(const AValue: TValue): TJSONValue; static;
    class function SerializeInteger(const AValue: TValue): TJSONValue; static;
    class function SerializeString(const AValue: TValue): TJSONValue; static;
    class function SerializeRecord(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue; static;
    class function SerializeClass(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue; static;
    class function SerializeInterface(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue; static;
    class function SerializeObject(const AObject: TObject; const AParams: IomParams): TJSONBox; overload; static;
    class function SerializeObject(const AInterfacedObject: IInterface; const AParams: IomParams): TJSONBox; overload; static;
    class function SerializeObjectList(const AList:TObjectList<TObject>; const AParams: IomParams; AOwnsInstance: boolean; AForEach: TJSONObjectActionProc): TJSONBox; static;
    class function SerializeList(const AList: TObject; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue; static;
    class function SerializeTValue(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue; static;
    class function SerializeDictionary(const ADictionary: TObject; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue; static;
    class function SerializeCustom(AValue:TValue; const APropField: TRttiNamedObject; const AParams: IomParams; out ResultJSONValue:TJSONValue): Boolean; static;
    // Deserializers
    class function DeserializePropField(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMasterObj: TObject; const AParams: IomParams): TValue; static;
    class function DeserializeFloat(const AJSONValue: TJSONValue; const AValueType: TRttiType): TValue; static;
    class function DeserializeEnumeration(const AJSONValue: TJSONValue; const AValueType: TRttiType): TValue; static;
    class function DeserializeInteger(const AJSONValue: TJSONValue): TValue; static;
    class function DeserializeString(const AJSONValue: TJSONValue): TValue; static;
    class function DeserializeRecord(const AJSONValue: TJSONValue; const AValueType: TRttiType; const AParams: IomParams): TValue; static;
    class procedure DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IomParams); static;
    class function DeserializeClass(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IomParams): TValue; static;
    class function DeserializeInterface(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; AMasterObj: TObject; const AParams: IomParams): TValue; static;
    class function DeserializeObjectByClass(const AJSONBox: TJSONBox; const AClassName: String; const AParams: IomParams): TObject; static;
    class function DeserializeObject(const AJSONBox: TJSONBox; AObject:TObject; const AParams: IomParams): TObject; static;
    class procedure DeserializeObjectList<T: class, constructor>(const AJSONBox: TJSONBox; AList: TObjectList<T>; const AParams: IomParams); static;
    class function DeserializeList(AList: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IomParams): TValue; static;
    class function DeserializeTValue(const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IomParams): TValue; static;
    class function DeserializeDictionary(ADictionary: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams: IomParams): TValue; static;
    class function DeserializeCustom(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMasterObj: TObject; const AParams: IomParams; out ResultValue:TValue): Boolean; static;
  end;

  EMapperException = class(Exception)

  end;



function ISODateTimeToString(ADateTime: TDateTime): string;
function ISODateToString(ADate: TDateTime): string;
function ISOTimeToString(ATime: TTime): string;

function ISOStrToDateTime(DateTimeAsString: string): TDateTime;
function ISOStrToDate(DateAsString: string): TDate;
function ISOStrToTime(TimeAsString: string): TTime;

implementation

uses
{$IFDEF ioPresent}
  iORM.DMVC.ObjectsMappersAdapter,
{$ELSE}
  DuckObjU,
{$ENDIF}
  DuckListU, System.Classes, Soap.EncdDecd,
  RTTIUtilsU, ObjMapperAttributes, System.DateUtils, DuckDictionaryU;


type

  TomSerializersContainerItem = class(TInterfacedObject, IomSerializersContainerItem)
  strict private
    FParams: IomParams;
    FSerializer: TomCustomSerializerRef;
  private
    function GetSerializer: TomCustomSerializerRef;
    procedure SetSerializer(const Value: TomCustomSerializerRef);
    function GetParams: IomParams;
    procedure SetParams(const Value: IomParams);
  public
    constructor Create(const ASerializer:TomCustomSerializerRef; const AParams:IomParams); overload;
    property Serializer: TomCustomSerializerRef read GetSerializer write SetSerializer;
    property Params: IomParams read GetParams write SetParams;
  end;

  TomParams = class(TInterfacedObject, IomParams)
  strict private
    FSerializationMode: TSerializationMode;
    FSerializationType: TSerializationType;
    FTypeAnnotations: Boolean;
    FIgnoredProperties: TIgnoredProperties;
    FEnableCustomSerializers: Boolean;
    FSerializers: TomSerializersContainer;
    FItemsKeyDefaultQualifiedName: String;
    FItemsValueDefaultQualifiedName: String;
    // SerializationMode
    procedure SetSerializationMode(const AValue: TSerializationMode);
    function GetSerializationMode: TSerializationMode;
    // SerializationType
    procedure SetSerializationType(const AValue: TSerializationType);
    function GetSerializationType: TSerializationType;
    // DataTypesAnnotation
    procedure SetTypeAnnotations(const AValue: Boolean);
    function GetTypeAnnotations: Boolean;
    // IgnoredProperties
    procedure SetIgnoredProperties(const AValue: TIgnoredProperties);
    function GetIgnoredProperties: TIgnoredProperties;
    // EnableCustomSerializers
    procedure SetEnableCustomSerializers(const AValue: Boolean);
    function GetEnableCustomSerializers: Boolean;
    // Serializers
    function GetSerializers: TomSerializersContainer;
    // ItemsKeyDefaultQualifiedName
    procedure SetItemsKeyDefaultQualifiedName(const AValue:String);
    function GetItemsKeyDefaultQualifiedName: String;
    // ItemsValueDefaultQualifiedName
    procedure SetItemsValueDefaultQualifiedName(const AValue:String);
    function GetItemsValueDefaultQualifiedName: String;
    // ItemsKeyDefaultTypeInfo
    procedure SetItemsKeyDefaultTypeInfo(const AValue:PTypeInfo);
    function GetItemsKeyDefaultTypeInfo: PTypeInfo;
    // ItemsValueDefaultTypeInfo
    procedure SetItemsValueDefaultTypeInfo(const AValue:PTypeInfo);
    function GetItemsValueDefaultTypeInfo: PTypeInfo;
  public
    constructor Create;
    destructor Destroy; override;
  end;


function ISOTimeToString(ATime: TTime): string;
var
  fs: TFormatSettings;
begin
  fs.TimeSeparator := ':';
  Result := FormatDateTime('hh:nn:ss', ATime, fs);
end;

function ISODateToString(ADate: TDateTime): string;
begin
  Result := FormatDateTime('YYYY-MM-DD', ADate);
end;

function ISODateTimeToString(ADateTime: TDateTime): string;
var
  fs: TFormatSettings;
begin
  fs.TimeSeparator := ':';
  Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', ADateTime, fs);
end;

function ISOStrToDateTime(DateTimeAsString: string): TDateTime;
begin
  Result := EncodeDateTime(StrToInt(Copy(DateTimeAsString, 1, 4)),
    StrToInt(Copy(DateTimeAsString, 6, 2)), StrToInt(Copy(DateTimeAsString, 9, 2)),
    StrToInt(Copy(DateTimeAsString, 12, 2)), StrToInt(Copy(DateTimeAsString, 15, 2)),
    StrToInt(Copy(DateTimeAsString, 18, 2)), 0);
end;

function ISOStrToTime(TimeAsString: string): TTime;
begin
  Result := EncodeTime(StrToInt(Copy(TimeAsString, 1, 2)), StrToInt(Copy(TimeAsString, 4, 2)),
    StrToInt(Copy(TimeAsString, 7, 2)), 0);
end;

function ISOStrToDate(DateAsString: string): TDate;
begin
  Result := EncodeDate(StrToInt(Copy(DateAsString, 1, 4)), StrToInt(Copy(DateAsString, 6, 2)),
    StrToInt(Copy(DateAsString, 9, 2)));
  // , StrToInt
  // (Copy(DateAsString, 12, 2)), StrToInt(Copy(DateAsString, 15, 2)),
  // StrToInt(Copy(DateAsString, 18, 2)), 0);
end;


// function ISODateToStr(const ADate: TDate): String;
// begin
// Result := FormatDateTime('YYYY-MM-DD', ADate);
// end;
//
// function ISOTimeToStr(const ATime: TTime): String;
// begin
// Result := FormatDateTime('HH:nn:ss', ATime);
// end;


{ Serializer }

class function omEngine.DefaultByFields: IomParams;
begin
  Result := TomParams.Create;
  Result.SerializationMode := smDataContract;
  Result.SerializationType := stFields;
  Result.TypeAnnotations := True;
end;

class function omEngine.DefaultByProperty: IomParams;
begin
  Result := TomParams.Create;
  Result.SerializationMode := smJavaScript;
  Result.SerializationType := stProperties;
  Result.TypeAnnotations := False;
end;

class function omEngine.DeserializeClass(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
  AMasterObj: TObject; const AParams: IomParams): TValue;
var
  LChildObj: TObject;
begin
  // Init
  LChildObj := nil;
  // If the Property/Field is valid then try to get the value (Object) from the
  //  master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TDuckPropField.IsValidPropField(APropField) then
      LChildObj := TDuckPropField.GetValue(AMasterObj, APropField).AsObject
    else
      LChildObj := AMasterObj;
  // If the LChildObj is not assigned and the AValueType is assigned then
  //  create the LChildObj of the type specified by the AValueType parameter,
  //  PS: normally used by DeserializeList or other collection deserialization
  if Assigned(AValueType) and (not Assigned(LChildObj)) then // and (not AParams.TypeAnnotations) then
    LChildObj := TRTTIUtils.CreateObject(AValueType.QualifiedName);
  // Deserialize
  DeserializeClassCommon(LChildObj, AJSONValue, APropField, AParams);
  // Make the result TValue
  //  NB: If the MasterObj is assigned return an empty TValue because if the
  //       deserialized object is a detail of a MasterObject the creation of the
  //       child object is responsibility of the Master object itself, so the
  //       child object is already assigned to the master object property.
  if Assigned(AMasterObj) then
    Result := TValue.Empty
  else
    TValue.Make(@LChildObj, LChildObj.ClassInfo, Result);
end;

class procedure omEngine.DeserializeClassCommon(var AChildObj: TObject; const AJSONValue: TJSONValue;
  const APropField: TRttiNamedObject; const AParams: IomParams);
var
  _attrser: MapperSerializeAsString;
  SerStreamASString: string;
  SerEnc: TEncoding;
  SS: TStringStream;
  sw: TStreamWriter;
  MS: TMemoryStream;
  LClassName: string;
  Arr: TJSONArray;
  list: IWrappedList;
  I: Integer;
  wObj: IWrappedObject;
  MapperClassTypeAttribute: MapperItemsClassType;
  ClassRef: TClass;
begin
  if not Assigned(AJSONValue) then   // JSONKey not present
  begin
//    if Assigned(AChildObj) then   // WHY???
//      FreeAndNil(AChildObj);      // WHY???
      Exit;
  end;

  // ---------- Stream ----------
  if Assigned(AChildObj) and (AChildObj is TStream) then
  begin
    if AJSONValue is TJSONString then
    begin
      SerStreamASString := TJSONString(AJSONValue).Value;
    end
    else
      raise EMapperException.Create('Deserialize Class: Expected JSONString in the received JSONValue.');

    if HasAttribute<MapperSerializeAsString>(APropField, _attrser) then
    begin
      // serialize the stream as a normal string...
      TStream(AChildObj).Position := 0;
      SerEnc := TEncoding.GetEncoding(_attrser.Encoding);
      SS := TStringStream.Create(SerStreamASString, SerEnc);
      try
        SS.Position := 0;
        TStream(AChildObj).CopyFrom(SS, SS.Size);
      finally
        SS.Free;
      end;
    end
    else
    begin
      // deserialize the stream as Base64 encoded string...
      TStream(AChildObj).Position := 0;
      sw := TStreamWriter.Create(TStream(AChildObj));
      try
        sw.Write(DecodeString(SerStreamASString));
      finally
        sw.Free;
      end;
    end;
  end
  // ---------- End Stream ----------
  // ---------- Dictionary ----------
  else if Assigned(AChildObj) and (TDuckTypedDictionary.CanBeWrappedAsDictionary(AChildObj)) then
  begin // restore collection                        s
    DeserializeDictionary(AChildObj, AJSONValue, APropField, AParams);
  end
  // ---------- End Dictionary ----------
  // ---------- List ----------
  else if Assigned(AChildObj) and (TDuckTypedList.CanBeWrappedAsList(AChildObj)) then
  begin // restore collection
    DeserializeList(AChildObj, AJSONValue, APropField, AParams);
  end
  // ---------- End List ----------
  // ---------- StreamableObject ----------
  else if Assigned(AChildObj) and (HasAttribute<StreamableAttribute>(APropField)) then
  begin
    SerStreamASString := (AJSONValue as TJSONString).Value;
    SS := TSTringStream.Create;
    MS := TMemoryStream.Create;
    try
      SS.WriteString(SerStreamASString);
      SS.Position := 0;
      DecodeStream(SS, MS);
      MS.Position := 0;
      wObj := WrapAsObject(AChildObj);
      if Assigned(wObj) then
        wObj.LoadFromStream(MS);
    finally
      MS.Free;
      SS.Free;
    end;
  end
  // ---------- End StreamableObject ----------
  // ---------- Other type of object ----------
  else // try to deserialize into the property... but the json MUST be an object
  begin
    if AJSONValue is TJSONObject then
    begin
      AChildObj := DeserializeObject(TJSONObject(AJSONValue), AChildObj, AParams);
    end
    else if AJSONValue is TJSONNull then
      FreeAndNil(AChildObj)
    else
      raise EMapperException.Create('Deserialize Class: Cannot deserialize as object.');
  end;
  // ---------- End Other type of object ----------
end;

class function omEngine.DeserializeCustom(const AJSONValue: TJSONValue;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMasterObj: TObject; const AParams: IomParams;
  out ResultValue: TValue): Boolean;
var
  LSerializerItem: IomSerializersContainerItem;
  LSerializer: TomCustomSerializerRef;
  LMapperCustomSerializer: MapperCustomSerializer;
  LParams: IomParams;
  LDone: Boolean;
  LValueType: TRttiType;
  LJSONObj: TJSONObject;
  LQualifiedName: String;
  LExistingValue: TValue;
  LTypeJSONValue: TJSONValue;
  LJSONValue: TJSONValue;
  LObj: TObject;
  function DeserializeCustomByInternalClassMethod(const AJSONValue:TJSONValue; const AValueType:TRttiType; const AExistingValue:TValue; out ResultValue: TValue): Boolean;
  var
    LMethod: TRttiMethod;
    LObj: TObject;
  begin
    Result := False;
    LMethod := AValueType.GetMethod('FromJSON');
    if not Assigned(LMethod) then
      Exit;
    if AExistingValue.IsEmpty then
    begin
      LObj := TRTTIUtils.CreateObject(AValueType.QualifiedName);
      TValue.Make(@LObj, LObj.ClassInfo, ResultValue);
    end
    else
    begin
      LObj := AExistingValue.AsObject;
      ResultValue := AExistingValue;
    end;
    LMethod.Invoke(LObj, [AJSONValue]);
    Result := True;
  end;
begin
  // Init
  Result := True;
  LDone := False;
  LQualifiedName := '';
  LSerializer := nil;
  LExistingValue := nil;
  LParams := AParams;
  // Check if CustomSerializers are enabled
  if not AParams.EnableCustomSerializers then
    Exit(False);
  // If the Property/Field is valid then try to get the value (Object) from the
  //  master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TDuckPropField.IsValidPropField(APropField) then
      LExistingValue := TDuckPropField.GetValue(AMasterObj, APropField)
    else
      TValue.Make(@AMasterObj, AMasterObj.ClassInfo, LExistingValue);
  // Check if a value type is embedded in the JSON and extract it (if exists)
  //  else use the received value type.
  //  If the value type is embedded in the JSON (TypeAnnotations = True) then extract
  //   then contained value too as JSONValue and pass it to the custom serializer
  LValueType := AValueType;
  LJSONValue := AJSONValue;
  if (AJSONValue is TJSONObject) then begin
    // Retrieve the value type if embedded in JSON
    LTypeJSONValue := TJSONObject(AJSONValue).GetValue(DMVC_TYPENAME);
    if Assigned(LTypeJSONValue) then
      LValueType := QualifiedTypeNameToRttiType(LTypeJSONValue.Value);
    if not Assigned(LValueType) then
      LValueType := AValueType;
    // Retreve the JSONValue to deserializa if embedded in JSON
    LJSONValue := TJSONObject(AJSONValue).GetValue(DMVC_VALUE);
  end;
  // ---------- Custom serialization method in the class ----------
  // If the Value is an Interface type then convert it to real object class
  //  type implementing the interface
  if (LValueType.TypeKind = tkInterface) and not LExistingValue.IsEmpty then
  begin
    LObj := LExistingValue.AsInterface as TObject;
    TValue.Make(@LObj, LObj.ClassInfo, LExistingValue);
  end;
  // If the value is an object and a Serializer method is present directly in the class
  if (LValueType.TypeKind = tkClass)
  and DeserializeCustomByInternalClassMethod(LJSONValue, LValueType, LExistingValue, ResultValue)
  then
    LDone := True
  else
  // ---------- End: Custom serialization method in the class ----------
  // Get custom serializer if exists
  if AParams.Serializers._Exists(LValueType.Handle) then
  begin
    LSerializerItem := AParams.Serializers._GetSerializerItem(LValueType.Handle);
    LSerializer := LSerializerItem.Serializer;
    // Get the custom Params
    if Assigned(LSerializerItem.Params) then
      LParams := LSerializerItem.Params;
  end
  else
  if HasAttribute<MapperCustomSerializer>(TypeInfoToRttiType(LValueType.Handle), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit(False);
  // Serialize (if a custom serializer exists)
  if Assigned(LSerializer) then
    ResultValue := LSerializer.Deserialize(
      LJSONValue,
      LExistingValue,
      LParams,
      LDone
      );
  // if the work has not been done by the custom serializer then
  //  call the standard serializers with custom params (if exists)
  if not LDone then
    ResultValue := DeserializePropField(LJSONValue, LValueType, APropField, AMasterObj, AParams);
end;

class function omEngine.DeserializeDictionary(ADictionary: TObject; const AJSONValue: TJSONValue;
  const APropField: TRttiNamedObject; const AParams: IomParams): TValue;
var
  LDuckDictionary: IWrappedDictionary;
  LKeyQualifiedTypeName, LValueQualifiedTypeName, LDictionaryTypeName: String;
  LKeyRttiType, LValueRTTIType: TRttiType;
  LJSONValue, LKeyJSONValue, LValueJSONValue: TJSONValue;
  LJObj: TJSONObject;
  LJSONArray: TJSONArray;
  LKey, LValue: TValue;
  I: Integer;
begin
  // If JSONValue not assigned
  if not Assigned(AJSONValue) then
    Exit(TValue.Empty);
  // Defaults
  LDictionaryTypeName     := '';
  LKeyQualifiedTypeName   := '';
  LValueQualifiedTypeName := '';
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if not (AJSONValue is TJSONObject) then
      raise EMapperException.Create('Wrong serialization for ' + ADictionary.QualifiedClassName);
    LJObj := AJSONValue as TJSONObject;
    // Get the Dictionary class
    LJSONValue := LJObj.GetValue(DMVC_TYPENAME);
    if Assigned(LJSONValue) then
      LDictionaryTypeName := LJSONValue.Value;
    // Get the key type name
    LJSONValue := LJObj.GetValue(DMVC_KEY);
    if Assigned(LJSONValue) then
      LKeyQualifiedTypeName := LJSONValue.Value;
    // Get the value type name
    LJSONValue := LJObj.GetValue(DMVC_VALUE);
    if Assigned(LJSONValue) then
      LValueQualifiedTypeName := LJSONValue.Value;
    // Create the dictionary if needed
    if ADictionary = nil then // recreate  the object as it should be
      ADictionary := TRTTIUtils.CreateObject(LDictionaryTypeName);
    // Get the items array
    LJSONValue := LJObj.Get('items').JsonValue;
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if not (LJSONValue is TJSONArray) then
    raise EMapperException.Create('Cannot restore the dictionary because the related JSONValue is not an array');
  LJSONArray := TJSONArray(LJSONValue);
  // Get values RttiType, if the RttiType is not found then check for
  //  "MapperItemsClassType"  or "MapperItemsType" attribute
  GetItemsTypeNameIfEmpty(APropField, AParams, LKeyQualifiedTypeName, LValueQualifiedTypeName);
  LKeyRttiType   := QualifiedTypeNameToRttiType(LKeyQualifiedTypeName);
  LValueRTTIType := QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if LJSONArray.Count > 0 then
  begin
    if not Assigned(LKeyRttiType) then
      raise EMapperException.Create('Key type not found deserializing a Dictionary');
    if not Assigned(LValueRTTIType) then
      raise EMapperException.Create('Value type not found deserializing a Dictionary');
  end;
  // Wrap the dictionary in the DuckObject
  LDuckDictionary := WrapAsDictionary(ADictionary);
  // Loop
  for I := 0 to LJSONArray.Count - 1 do
  begin
    LJObj := LJSONArray.Get(I) as TJSONObject;
    // Get the key anche value JSONValue
    case AParams.SerializationMode of
      smJavaScript:
      begin
        LKeyJSONValue   := LJObj.Pairs[0].JsonString;
        LValueJSONValue := LJObj.Pairs[0].JsonValue;
      end;
      smDataContract:
      begin
        LKeyJSONValue   := LJObj.GetValue(DMVC_KEY);
        LValueJSONValue := LJObj.GetValue(DMVC_VALUE);
      end;
    end;
    // Deserialization key and value
    LKey   := DeserializePropField(LKeyJSONValue, LKeyRttiType, APropField, nil, AParams);
    LValue := DeserializePropField(LValueJSONValue, LValueRttiType, APropField, nil, AParams);
    // Add to the dictionary
    LDuckDictionary.Add(LKey, LValue);
  end;
  // Return the dictionary
  Result := ADictionary;
end;

class function omEngine.DeserializeEnumeration(const AJSONValue: TJSONValue; const AValueType: TRttiType): TValue;
begin
//  if not Assigned(AJSONValue) then   // JSONKey not present
//    raise EMapperException.Create(APropField.Name + ' key field is not present in the JSONObject');

  if AValueType.QualifiedName = 'System.Boolean' then
  begin
    if AJSONValue is TJSONTrue then
       Result := True
    else if AJSONValue is TJSONFalse then
       Result := False
    else
      raise EMapperException.Create('Invalid value for boolean value ');
  end
  else // it is an enumerated value but it's not a boolean.
    TValue.Make((AJSONValue as TJSONNumber).AsInt, AValueType.Handle, Result);
end;

class function omEngine.DeserializeFloat(const AJSONValue: TJSONValue; const AValueType: TRttiType): TValue;
var
  LQualifiedTypeName: String;
begin
  if not Assigned(AJSONValue) then   // JSONKey not present
    Result := 0
  else
  begin
    LQualifiedTypeName := AValueType.QualifiedName;
    if LQualifiedTypeName = 'System.TDate' then
    begin
      if AJSONValue is TJSONNull then
        Result := 0
      else
        Result := TValue.From<TDate>(ISOStrToDateTime(AJSONValue.Value + ' 00:00:00'));
    end
    else if LQualifiedTypeName = 'System.TDateTime' then
    begin
      if AJSONValue is TJSONNull then
        Result := 0
      else
        Result := TValue.From<TDateTime>(ISOStrToDateTime(AJSONValue.Value));
    end
    else if LQualifiedTypeName = 'System.TTime' then
    begin
      if AJSONValue is TJSONString then
        Result := TValue.From<TTime>(ISOStrToTime(AJSONValue.Value))
      else
        raise EMapperException.CreateFmt('Cannot deserialize TTime value, expected [%s] got [%s]',
          ['TJSONString', AJSONValue.ClassName]);
    end
    else { if APropFieldRttiType.QualifiedName = 'System.Currency' then }
    begin
      if AJSONValue is TJSONNumber then
        Result := TJSONNumber(AJSONValue).AsDouble
      else
        raise EMapperException.CreateFmt('Cannot deserialize float value, expected [%s] got [%s]',
          ['TJSONNumber', AJSONValue.ClassName]);
    end;
  end;
end;

class function omEngine.DeserializeInteger(const AJSONValue: TJSONValue): TValue;
begin
  if not Assigned(AJSONValue) then  // JSONKey not present
    Result := 0
  else
    Result := StrToIntDef(AJSONValue.Value, 0);
end;

class function omEngine.DeserializeInterface(const AJSONValue: TJSONValue; const AValueType: TRttiType;
  const APropField: TRttiNamedObject; AMasterObj: TObject;
  const AParams: IomParams): TValue;
var
  LChildObj: TObject;

begin
  // Init
  LChildObj := nil;
  // If the Property/Field is valid then try to get the value (Object) from the
  //  master object else the MasterObject itself is the destination of the deserialization
  if Assigned(AMasterObj) then
    if TDuckPropField.IsValidPropField(APropField) then
      LChildObj := TValueToTObject(TDuckPropField.GetValue(AMasterObj, APropField))
    else
      LChildObj := AMasterObj;
  // If the LChildObj is not assigned and the AValueType is assigned then
  //  create the LChildObj of the type specified by the AValueType parameter,
  //  PS: normally used by DeserializeList or other collection deserialization
  if Assigned(AValueType) and (not Assigned(LChildObj)) and (not AParams.TypeAnnotations) then
    LChildObj := TRTTIUtils.CreateObject(AValueType.QualifiedName);
  // Deserialize
  DeserializeClassCommon(LChildObj, AJSONValue, APropField, AParams);
  // Make the result TValue
  //  NB: If the MasterObj is assigned return an empty TValue because if the
  //       deserialized object is a detail of a MasterObject the creation of the
  //       child object is responsibility of the Master object itself, so the
  //       child object is already assigned to the master object property.
  if Assigned(AMasterObj) then
    Result := TValue.Empty
  else
    TValue.Make(@LChildObj, LChildObj.ClassInfo, Result);
end;

class function omEngine.DeserializeList(AList: TObject; const AJSONValue: TJSONValue; const APropField: TRttiNamedObject;
  const AParams: IomParams): TValue;
var
  LListTypeName, LValueQualifiedTypeName: String;
  LJObj: TJSONObject;
  LJSONValue, LValueJSONValue: TJSONValue;
  LJSONArray: TJSONArray;
  LValueRTTIType: TRttiType;
  LDuckList: IWrappedList;
  I: Integer;
  LValue: TValue;
begin
  // If JSONValue not assigned
  if not Assigned(AJSONValue) then
    Exit(TValue.Empty);
  // Defaults
  LValueRTTIType          := nil;
  LListTypeName           := '';
  LValueQualifiedTypeName := '';
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if not (AJSONValue is TJSONObject) then
      raise EMapperException.Create('Wrong serialization for ' + AList.QualifiedClassName);
    LJObj := AJSONValue as TJSONObject;
    // Get the collection class
    LJSONValue := LJObj.GetValue(DMVC_TYPENAME);
    if Assigned(LJSONValue) then
      LListTypeName := LJSONValue.Value;
    // Create the collection if needed
    if AList = nil then // recreate the object as it should be
      AList := TRTTIUtils.CreateObject(LListTypeName);
    // Get the value type name
    LJSONValue := LJObj.GetValue(DMVC_VALUE);
    if Assigned(LJSONValue) then
      LValueQualifiedTypeName := LJSONValue.Value;
    // Get the items array
    LJSONValue := LJObj.Get('items').JsonValue;
  end
  else
    LJSONValue := AJSONValue;
  // Check and extract the JSONArray
  if not (LJSONValue is TJSONArray) then
    raise EMapperException.Create('Cannot restore the list because the related JSONValue is not an array');
  LJSONArray := TJSONArray(LJSONValue);
  // Get values RttiType, if the RttiType is not found then check for
  //  "MapperItemsClassType"  or "MapperItemsType" attribute or from PARAMS
  GetItemsTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);
  LValueRTTIType := QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if (not Assigned(LValueRTTIType)) and (LJSONArray.Count > 0) then
    raise EMapperException.Create('Value type not found deserializing a List');
  // Wrap the dictionary in the DuckObject
  LDuckList := WrapAsList(AList);
  // Loop
  for I := 0 to LJSONArray.Count - 1 do
  begin
    // Extract the current element
    LValueJSONValue := LJSONArray.Get(I);
    // Deserialize the current element
    LValue := DeserializePropField(LValueJSONValue, LValueRttiType, APropField, nil, AParams);
    // Add to the list
    LDuckList.AddValue(LValue);
  end;
  // Return the dictionary
  Result := AList;
end;

class function omEngine.DeserializePropField(const AJSONValue: TJSONValue; const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMasterObj: TObject; const AParams: IomParams): TValue;
begin
  // Init
  Result := TValue.Empty;
  // If a custom serializer exists for the current type then use it
  if DeserializeCustom(AJSONValue, AValueType, APropField, AMasterObj, AParams, Result) then
    Exit;
  // Deserialize by TypeKind
//  case TDuckPropField.TypeKind(APropField) of
  case AValueType.TypeKind of
    tkEnumeration:
      Result := DeserializeEnumeration(AJSONValue, AValueType);
    tkInteger, tkInt64:
      Result := DeserializeInteger(AJSONValue);
    tkFloat:
      Result := DeserializeFloat(AJSONValue, AValueType);
    tkString, tkLString, tkWString, tkUString:
      Result := DeserializeString(AJSONValue);
    tkRecord:
      Result := DeserializeRecord(AJSONValue, AValueType, AParams);
    tkClass:
      Result := DeserializeClass(
        AJSONValue,
        AValueType,
        APropField,
        AMasterObj,
        AParams
        );
    tkInterface:
      Result := DeserializeInterface(
        AJSONValue,
        AValueType,
        APropField,
        AMasterObj,
        AParams
        );
  end;
end;

class function omEngine.DeserializeRecord(const AJSONValue: TJSONValue; const AValueType: TRttiType; const AParams: IomParams): TValue;
var
  LQualifiedTypeName: String;
begin
  LQualifiedTypeName := AValueType.QualifiedName;
  // TTimeStamp
  if LQualifiedTypeName = 'System.SysUtils.TTimeStamp' then
  begin
    if not Assigned(AJSONValue) then  // JSONKey not present
      Result := TValue.From<TTimeStamp>(MSecsToTimeStamp(0))
    else
      Result := TValue.From<TTimeStamp>(MSecsToTimeStamp(   (AJSONValue as TJSONNumber).AsInt64   ));
  end
  // TValue
  else if LQualifiedTypeName = 'System.Rtti.TValue' then
  begin
    Result := DeserializeTValue(AJSONValue, AValueType, AParams);
  end;
end;

class function omEngine.DeserializeString(const AJSONValue: TJSONValue): TValue;
begin
  if not Assigned(AJSONValue) then  // JSONKey not present
    Result := ''
  else
    Result := AJSONValue.Value;
end;

class function omEngine.DeserializeTValue(const AJSONValue: TJSONValue; const APropField: TRttiNamedObject; const AParams:IomParams): TValue;
var
  LJObj: TJSONObject;
  LValueQualifiedTypeName: String;
  LValueRTTIType: TRttiType;
  LJSONValue: TJSONValue;
//  LObj: TObject;
//  LIntf: IInterface;
begin
  // Defaults
  LValueQualifiedTypeName := '';
  // If JSONValue not assigned
  if not Assigned(AJSONValue) then
    Exit(TValue.Empty);
  // If AUseClassName is true then get the "items" JSONArray containing che containing the list items
  //  else AJSONValue is the JSONArray containing che containing the list items
  if AParams.TypeAnnotations then
  begin
    if not (AJSONValue is TJSONObject) then
      raise EMapperException.Create('Wrong serialization for TValue');
    // Extract the JSONObject from the received JSONValue
    LJObj := (AJSONValue as TJSONObject);
    // Get the value type name
    LJSONValue := LJObj.GetValue(DMVC_TYPENAME);
    if Assigned(LJSONValue) then
      LValueQualifiedTypeName := LJSONValue.Value;
    // Extract the contained TValue value
    LJSONValue := LJObj.GetValue(DMVC_VALUE);
  end
  else
    LJSONValue := AJSONValue;
  // Get values RttiType, if the RttiType is not found then check for
  //  "MapperItemsClassType"  or "MapperItemsType" attribute
  GetItemsTypeNameIfEmpty(APropField, AParams, LValueQualifiedTypeName);
  LValueRTTIType := QualifiedTypeNameToRttiType(LValueQualifiedTypeName);
  if not Assigned(LValueRTTIType) then
    raise EMapperException.Create('Value type not found deserializing a TValue');
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
    (LJSONValue as TJSONObject).AddPair(DMVC_TYPENAME, LValueQualifiedTypeName);
  // Deserialize the value
  Result := DeserializePropField(LJSONValue, LValueRTTIType, APropField, nil, AParams);
end;

class function omEngine.DeserializeObject(const AJSONBox: TJSONBox; AObject: TObject;
  const AParams: IomParams): TObject;
var
  PropField: System.Rtti.TRttiNamedObject;
  PropsFields: TArray<System.Rtti.TRttiNamedObject>;
  KeyName: String;
  lJClassName: TJSONString;
  JValue: TJSONValue;
  _type: TRttiType;
  AObjectIsValid: Boolean;
  LValue: TValue;
begin
  AObjectIsValid := Assigned(AObject);
  // If the AObject is not assigned then try to create the Object using the DMVC_ClassName value in the
  //  JSONBox
  if not AObjectIsValid then
  begin
{$IF CompilerVersion <= 26}
    if Assigned(AJSONBox.Get(DMVC_CLASSNAME)) then
    begin
      lJClassName := AJSONBox.Get(DMVC_CLASSNAME).JsonValue as TJSONString;
    end
    else
      raise EMapperException.Create('No $classname property in the JSON object');
{$ELSE}
    if not AJSONBox.TryGetValue<TJSONString>(DMVC_TYPENAME, lJClassName) then
      raise EMapperException.Create('No $classname property in the JSON object');
{$ENDIF}
    AObject := TRTTIUtils.CreateObject(lJClassName.Value);
  end;

  JValue := nil;
  _type := GetCtx.GetType(AObject.ClassInfo);

  try
    // Get members list
    case AParams.SerializationType of
      stProperties:
        PropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(GetCtx.GetType(AObject.ClassInfo).AsInstance.GetProperties));
      stFields:
        PropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(GetCtx.GetType(AObject.ClassInfo).AsInstance.GetFields));
    end;
    // Loop for all members
    for PropField in PropsFields do
    begin
      // Check to continue or not
      if (not TDuckPropField.IsWritable(PropField) and (TDuckPropField.RttiType(PropField).TypeKind <> tkClass))
      or (HasAttribute<MapperTransientAttribute>(PropField))
      or (PropField.Name = 'FRefCount')
      or (PropField.Name = 'RefCount')
      or IsPropertyToBeIgnored(PropField, AParams)
      then
        Continue;
      // Get the JSONPair KeyName
      KeyName := GetKeyName(PropField, _type);
      // Check if JSONPair exists
      if Assigned(AJSONBox.Get(KeyName)) then
        JValue := AJSONBox.Get(KeyName).JsonValue // as LJSONKeyIsNotPresent := False
      else
        JValue := nil; // as LJSONKeyIsNotPresent := True
      // Deserialize the currente member and assign it to the object member
      LValue := DeserializePropField(JValue, TDuckPropField.RttiType(PropField), PropField, AObject, AParams);
      if not LValue.IsEmpty then
        TDuckPropField.SetValue(AObject, PropField, LValue);
    end;
    Result := AObject;
  except
    if not AObjectIsValid then
      FreeAndNil(AObject);
    raise;
  end;
end;

class function omEngine.DeserializeObjectByClass(const AJSONBox: TJSONBox; const AClassName: String;
  const AParams: IomParams): TObject;
var
  AObject: TObject;
  _rttiType: TRttiType;
begin
  // Init (NB: NON TOGLIERE)
  AObject := nil;
  // If AUseClassName parameter is not passed then create a new object of the generic passed
  //  type, else (if AUseClassName = True) the creation of a new object of the right class
  //  is made by the "DeserializeObject" function using the informations contained in the JSON.
  if not AParams.TypeAnnotations then
  begin
    _rttiType := omEngine.GetCtx.FindType(AClassName);
    if Assigned(_rttiType) then
      AObject := TRTTIUtils.CreateObject(_rttiType)
    else
      raise EMapperException.CreateFmt('Class not found [%s]', [AClassName]);
  end;
  // Deserialize
  try
    AObject := DeserializeObject(AJSONBox, AObject, AParams);
    Result := AObject;
  except
    AObject.Free;
    raise;
  end;
end;

class procedure omEngine.DeserializeObjectList<T>(const AJSONBox: TJSONBox; AList: TObjectList<T>;
  const AParams: IomParams);
var
  I: Integer;
  JChildObj: TJSONObject;
begin
  if Assigned(AJSONBox) then
  begin
    for I := 0 to AJSONBox.Count - 1 do
    begin
      JChildObj := AJSONBox.Pairs[I].JsonValue as TJSONObject;
//      AList.Add(Mapper.JSONObjectToObject<T>(AJSONArray.Get(I) as TJSONObject));

//    ***** NB: DA FINIRE *****

    end;
  end;
end;

class function omEngine.GetCtx: TRttiContext;
begin
  Result := Ctx;
end;

class procedure omEngine.GetItemsTypeNameIfEmpty(
  const APropField: TRttiNamedObject; const AParams:IomParams; var AValueTypeName: String);
var
  LKeyTypeNameDummy: String;
begin
  GetItemsTypeNameIfEmpty(APropField, AParams, LKeyTypeNameDummy, AValueTypeName);
end;

class procedure omEngine.GetItemsTypeNameIfEmpty(
  const APropField: TRttiNamedObject; const AParams:IomParams; var AKeyTypeName, AValueTypeName: String);
var
  MapperItemsClassTypeAttribute: MapperItemsClassType;
begin
  // init
  MapperItemsClassTypeAttribute := nil;
  // Only if needed
  if (not AKeyTypeName.IsEmpty) and (not AValueTypeName.IsEmpty) then
    Exit;
  // Get the attribute if exists
  if not HasAttribute<MapperItemsClassType>(APropField, MapperItemsClassTypeAttribute) then
    HasAttribute<MapperItemsClassType>(TDuckPropField.RttiType(APropField), MapperItemsClassTypeAttribute);
  // If the KeyType received as parameter is empty then get the type from
  //  the attribute and if also the attribute key type name is empty then
  //  get the default specified in the params
  if AKeyTypeName.IsEmpty then
    if Assigned(MapperItemsClassTypeAttribute) and not MapperItemsClassTypeAttribute.KeyQualifiedName.IsEmpty then
      AKeyTypeName := MapperItemsClassTypeAttribute.KeyQualifiedName
    else
      AKeyTypeName := AParams.ItemsKeyDefaultQualifiedName;
  // If the ValueType received as parameter is empty then get the type from
  //  the attribute and if also the attribute value type name is empty then
  //  get the default specified in the params
  if AValueTypeName.IsEmpty then
    if Assigned(MapperItemsClassTypeAttribute) and not MapperItemsClassTypeAttribute.ValueQualifiedName.IsEmpty then
      AValueTypeName := MapperItemsClassTypeAttribute.ValueQualifiedName
    else
      AValueTypeName := AParams.ItemsValueDefaultQualifiedName;
end;

class function omEngine.GetKeyName(const ARttiMember: TRttiNamedObject; const AType: TRttiType): string;
var
  attrs: TArray<TCustomAttribute>;
  attr: TCustomAttribute;
begin
  // JSONSer property attribute handling
  attrs := ARttiMember.GetAttributes;
  for attr in attrs do
  begin
    if attr is MapperJSONSer then
      Exit(MapperJSONSer(attr).Name);
  end;

  // JSONNaming class attribute handling
  attrs := AType.GetAttributes;
  for attr in attrs do
  begin
    if attr is MapperJSONNaming then
    begin
      case MapperJSONNaming(attr).KeyCase of
        JSONNameUpperCase:
          begin
            Exit(UpperCase(ARttiMember.Name));
          end;
        JSONNameLowerCase:
          begin
            Exit(LowerCase(ARttiMember.Name));
          end;
      end;
    end;
  end;

  // Default
  Result := ARttiMember.Name;
end;

class function omEngine.GetQualifiedTypeName(const ATypeInfo: Pointer): String;
begin
  Result := GetCtx.GetType(ATypeInfo).QualifiedName;
end;

class function omEngine.HasAttribute<T>(const ARTTIMember: TRttiNamedObject): boolean;
var
  AAttribute: TCustomAttribute;
begin
  Result := HasAttribute<T>(ARTTIMember, AAttribute);
end;

class function omEngine.HasAttribute<T>(const ARTTIMember: TRttiNamedObject; out AAttribute: T): boolean;
var
  attrs: TArray<TCustomAttribute>;
  attr: TCustomAttribute;
begin
  if not Assigned(ARTTIMember) then
    Exit(False);
  AAttribute := nil;
  Result := false;
  attrs := ARTTIMember.GetAttributes;
  for attr in attrs do
    if attr is T then
    begin
      AAttribute := T(attr);
      Exit(True);
    end;
end;

class procedure omEngine.Initialize;
begin
  Ctx := TRttiContext.Create;
end;

class function omEngine.IsPropertyToBeIgnored(
  const APropField: TRttiNamedObject; const AParams: IomParams): Boolean;
var
  I: Integer;
begin
  Result := False;
  if Length(AParams.IgnoredProperties) = 0 then
    Exit;
  for I := low(AParams.IgnoredProperties) to high(AParams.IgnoredProperties) do
    if SameText(APropField.Name, AParams.IgnoredProperties[I]) then
      Exit(True);
end;

class function omEngine.QualifiedTypeNameToRttiType(
  const AQualifiedTypeName: String): TRttiType;
begin
  Result := nil;
  Result := GetCtx.FindType(AQualifiedTypeName);
end;

class function omEngine.SerializeInterface(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue;
var
  AChildInterface: IInterface;
  AChildObj: TObject;
begin
  AChildInterface := AValue.AsInterface;
  AChildObj := AChildInterface as TObject;
  Result := SerializeClass(AChildObj, APropField, AParams);
end;

class function omEngine.SerializeList(const AList: TObject; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue;
var
  LListTypeName, LValueQualifiedTypeName: String;
  LDuckList: IWrappedList;
  LJSONArray: TJSONArray;
  I: Integer;
  LValue: TValue;
  LJSONValue: TJSONValue;
  First: Boolean;
  ResultJSONObj: TJSONObject;
begin
  // Init
  LListTypeName           := '';
  LValueQualifiedTypeName := '';
  // Wrap the dictionary in the DuckObject
  LDuckList := WrapAsList(AList);
  // Create the Items JSON array
  LJSONArray := TJSONArray.Create;
  // Loop for all objects in the list (now compatible with interfaces)
  First := True;
  for I := 0 to LDuckList.Count-1 do
  begin
    // Read values
    LValue := LDuckList.GetItemValue(I);
    // Serialize values
    LJSONValue := SerializePropField(LValue, APropField, AParams);
    // If first loop then add the type infos
    if AParams.TypeAnnotations and First then
    begin
      LValueQualifiedTypeName := GetQualifiedTypeName(LValue.TypeInfo);
      First := False;
    end;
    // Add the current element to the JSONArray
    LJSONArray.AddElement(LJSONValue);
  end;
  // If AUseClassName is true then return a JSONObject with ClassName and a JSONArray containing the list items
  //  else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    ResultJSONObj := TJSONObject.Create;
    ResultJSONObj.AddPair(DMVC_TYPENAME, AList.QualifiedClassName);
    if not LValueQualifiedTypeName.IsEmpty then
      ResultJSONObj.AddPair(DMVC_VALUE, LValueQualifiedTypeName);
    ResultJSONObj.AddPair('items', LJSONArray);
    Result := ResultJSONObj;
  end
  else
    Result := LJSONArray;
end;

class function omEngine.SerializeClass(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue;
var
  AChildObj, Obj: TObject;
  list: IWrappedList;
  wObj: IWrappedObject;
  Arr: TJSONArray;
  ResultObj: TJSONObject;
  _attrser: MapperSerializeAsString;
  SerEnc: TEncoding;
  sr: TStringStream;
  SS: TStringStream;
  MS: TMemoryStream;
  EncBytes: TBytes;
  I: Integer;
begin
  AChildObj := AValue.AsObject;
  if Assigned(AChildObj) then
  begin
    // ---------- Dictionary ----------
    if TDuckTypedDictionary.CanBeWrappedAsDictionary(AChildObj) then
    begin
      Result := SerializeDictionary(AChildObj, APropField, AParams);
    end
    // ---------- End Dictionary ----------
    // ---------- List ----------
    else if TDuckTypedList.CanBeWrappedAsList(AChildObj) then
    begin
      Result := SerializeList(AChildObj, APropField, AParams);
    end
    // ---------- End List ----------
    // ---------- Stream ----------
    else if AChildObj is TStream then
    begin
      if HasAttribute<MapperSerializeAsString>(APropField, _attrser) then
      begin
        // serialize the stream as a normal string...
        TStream(AChildObj).Position := 0;
        SerEnc := TEncoding.GetEncoding(_attrser.Encoding);
        sr := TStringStream.Create('', SerEnc);
        try
          sr.LoadFromStream(TStream(AChildObj));
          Result := TJSONString.Create(sr.DataString);
        finally
          sr.Free;
        end;
      end
      else
      begin
        // serialize the stream as Base64 encoded string...
        TStream(AChildObj).Position := 0;
        SS := TStringStream.Create;
        try
          EncodeStream(TStream(AChildObj), SS);
          Result := TJSONString.Create(SS.DataString);
        finally
          SS.Free;
        end;
      end;
    end
    // ---------- End Stream ----------
    // ---------- StreamableObject ----------
    else if HasAttribute<StreamableAttribute>(APropField) then
    begin
      wObj := WrapAsObject(AChildObj);
      if Assigned(wObj) then
      begin
        MS := TMemoryStream.Create;
        SS := TStringStream.Create;
        try
          wObj.SaveToStream(MS);
          MS.Position := 0;
          EncodeStream(MS, SS);
          Result := TJSONString.Create(SS.DataString);
        finally
          MS.Free;
          SS.Free;
        end;
      end;
    end
    // ---------- End StreamableObject ----------
    // ---------- Other type of object ----------
    else
    begin
      Result := SerializeObject(AChildObj, AParams);
    end;
    // ---------- End other type of object ----------
  // Object (o) not assigned
  end
  else
  begin
    if HasAttribute<MapperSerializeAsString>(APropField) then
      Result := TJSONString.Create('')
    else
      Result := TJSONNull.Create;
  end;
end;

class function omEngine.SerializeCustom(AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IomParams;
  out ResultJSONValue: TJSONValue): Boolean;
var
  LSerializerItem: IomSerializersContainerItem;
  LSerializer: TomCustomSerializerRef;
  LMapperCustomSerializer: MapperCustomSerializer;
  LJSONValue: TJSONValue;
  LJSONObj: TJSONObject;
  LParams: IomParams;
  LDone: Boolean;
  LObj: TObject;
  function SerializeCustomByInternalClassMethod(const AValue:TValue; out ResultJSONValue: TJSONValue): Boolean;
  var
    LType: TRttiType;
    LMethod: TRttiMethod;
  begin
    Result := False;
    LType := TypeInfoToRttiType(AValue.TypeInfo);
    if not Assigned(LType) then
      Exit;
    LMethod := LType.GetMethod('ToJSON');
    if not Assigned(LMethod) then
      Exit;
    ResultJSONValue := LMethod.Invoke(AValue.AsObject, []).AsObject as TJSONValue;
    Result := True;
  end;
begin
  // Init
  Result := True;
  LDone := False;
  LSerializer := nil;
  LParams := AParams;
  // Check if CustomSerializers are enabled
  if not AParams.EnableCustomSerializers then
    Exit(False);
  // ---------- Custom serialization method in the class ----------
  // If the Value is an Interface type then convert it to real object class
  //  type implementing the interface
  if AValue.Kind = tkInterface then
  begin
    LObj := AValue.AsInterface as TObject;
    TValue.Make(@LObj, LObj.ClassInfo, AValue);
  end;
  // If the value is an object and a Serializer method is present directly in the class
  if (AValue.Kind = tkClass)
  and SerializeCustomByInternalClassMethod(AValue, LJSONValue)
  then
    LDone := True
  else
  // ---------- End: Custom serialization method in the class ----------
  // Get custom serializer if exists
  if AParams.Serializers._Exists(AValue.TypeInfo) then
  begin
    LSerializerItem := AParams.Serializers._GetSerializerItem(AValue.TypeInfo);
    LSerializer := LSerializerItem.Serializer;
    // Get the custom Params
    if Assigned(LSerializerItem.Params) then
      LParams := LSerializerItem.Params;
  end
  else
  if HasAttribute<MapperCustomSerializer>(TypeInfoToRttiType(AValue.TypeInfo), LMapperCustomSerializer) then
    LSerializer := LMapperCustomSerializer.Serializer
  else
    Exit(False);
  // Serialize (if a custom serializer exists)
  if Assigned(LSerializer) then
    LJSONValue := LSerializer.Serialize(
      AValue,
      LParams,
      LDone
      );
  // if the work has not been done by the custom serializer then
  //  call the standard serializers with custom params (if exists)
  //  NB: Custom serializers are disabled
  if not LDone then
    LJSONValue := SerializePropField(AValue, APropField, LParams, False);
  // If DataTypeAnnotation is enabled then wrap the resutling JSONValue
  //  in a JSONObject with the type information
  if LParams.TypeAnnotations then
  begin
    if LJSONValue is TJSONObject then
    begin
      LJSONObj := TJSONObject(LJSONValue);
      LJSONObj.AddPair(DMVC_TYPENAME, GetQualifiedTypeName(AValue.TypeInfo));
    end
    else
    begin
      LJSONObj := TJSONObject.Create;
      LJSONObj.AddPair(DMVC_TYPENAME, GetQualifiedTypeName(AValue.TypeInfo));
      LJSONObj.AddPair(DMVC_VALUE, LJSONValue);
    end;
    ResultJSONValue := LJSONObj;
  end
  else
    ResultJSONValue := LJSONValue;
end;

class function omEngine.SerializeDictionary(
  const ADictionary: TObject; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue;
var
  LDuckDictionary: IWrappedDictionary;
  LJSONArray: TJSONArray;
  ResultJSONObj, CurrJSONObj: TJSONObject;
  LJSONKey, LJSONValue: TJSONValue;
  First: Boolean;
  LKey, LValue: TValue;
  LKeyQualifiedTypeName, LValueQualifiedTypeName: String;
begin
  // Init
  LKeyQualifiedTypeName   := '';
  LValueQualifiedTypeName := '';
  // Wrap the dictionary in the DuckObject
  LDuckDictionary := WrapAsDictionary(ADictionary);
  // Create the Items JSON array
  LJSONArray := TJSONArray.Create;
  // Loop
  First := True;
  while LDuckDictionary.MoveNext do
  begin
    // Read values
    LKey   := LDuckDictionary.GetCurrentKey;
    LValue := LDuckDictionary.GetCurrentValue;
    // Serialize values
    LJSONKey   := SerializePropField(LKey,   APropField, AParams);
    LJSONValue := SerializePropField(LValue, APropField, AParams);
    // If first loop then add the type infos
    if AParams.TypeAnnotations and First then
    begin
      LKeyQualifiedTypeName   := GetQualifiedTypeName(LKey.TypeInfo);
      LValueQualifiedTypeName := GetQualifiedTypeName(LValue.TypeInfo);
      First := False;
    end;
    // Add the current element to the JSONArray
    CurrJSONObj := TJSONObject.Create;
    case AParams.SerializationMode of
      smJavaScript:
        CurrJSONObj.AddPair(LJSONKey.ToString, LJSONValue);
      smDataContract:
      begin
        CurrJSONObj.AddPair(DMVC_KEY,   LJSONKey);
        CurrJSONObj.AddPair(DMVC_VALUE, LJSONValue)
      end;
    end;
    LJSONArray.AddElement(CurrJSONObj);
  end;
  // If AUseClassName is true then return a JSONObject with ClassName and a JSONArray containing the list items
  //  else return only the JSONArray containing the list items
  if AParams.TypeAnnotations then
  begin
    ResultJSONObj := TJSONObject.Create;
    ResultJSONObj.AddPair(DMVC_TYPENAME, ADictionary.QualifiedClassName);
    if not LKeyQualifiedTypeName.IsEmpty then
      ResultJSONObj.AddPair(DMVC_KEY, LKeyQualifiedTypeName);
    if not LValueQualifiedTypeName.IsEmpty then
      ResultJSONObj.AddPair(DMVC_VALUE, LValueQualifiedTypeName);
    ResultJSONObj.AddPair('items', LJSONArray);
    Result := ResultJSONObj;
  end
  else
    Result := LJSONArray;
end;

class function omEngine.SerializeEnumeration(const AValue: TValue): TJSONValue;
var
  LQualifiedTypeName: String;
begin
//  AQualifiedTypeName := TDuckPropField.QualifiedName(ARttiType);
  LQualifiedTypeName := GetQualifiedTypeName(AValue.TypeInfo);
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

class function omEngine.SerializeFloat(const AValue: TValue): TJSONValue;
var
  LQualifiedTypeName: String;
begin
//  AQualifiedTypeName := TDuckPropField.QualifiedName(ARttiType);
  LQualifiedTypeName := GetQualifiedTypeName(AValue.TypeInfo);
  if LQualifiedTypeName = 'System.TDate' then
  begin
    if AValue.AsExtended = 0 then
      Result := TJSONNull.Create
    else
      Result := TJSONString.Create(ISODateToString(AValue.AsExtended))
  end
  else if LQualifiedTypeName = 'System.TDateTime' then
  begin
    if AValue.AsExtended = 0 then
      Result := TJSONNull.Create
    else
      Result := TJSONString.Create(ISODateTimeToString(AValue.AsExtended))
  end
  else if LQualifiedTypeName = 'System.TTime' then
   Result := TJSONString.Create(ISOTimeToString(AValue.AsExtended))
  else
    Result := TJSONNumber.Create(AValue.AsExtended);
end;

class function omEngine.SerializeInteger(const AValue: TValue): TJSONValue;
begin
  Result := TJSONNumber.Create(AValue.AsInteger)
end;

class function omEngine.SerializeObject(const AObject: TObject; const AParams: IomParams): TJSONBox;
var
  PropField: System.Rtti.TRttiNamedObject;
  PropsFields: TArray<System.Rtti.TRttiNamedObject>;
  ThereAreIgnoredProperties: boolean;
  DoNotSerializeThis: boolean;
  KeyName: String;
  _type: TRttiType;
  I: Integer;
  JValue: TJSONValue;
  Value: TValue;
begin
  ThereAreIgnoredProperties := Length(AParams.IgnoredProperties) > 0;
  Result := TJSONBox.Create;
  try
    _type := GetCtx.GetType(AObject.ClassInfo);
    // add the $dmvc.classname property to allows a strict deserialization
    if AParams.TypeAnnotations then
      Result.AddPair(DMVC_TYPENAME, AObject.QualifiedClassName);
    // Get members list
    case AParams.SerializationType of
      stProperties:
        PropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(GetCtx.GetType(AObject.ClassInfo).AsInstance.GetProperties));
      stFields:
        PropsFields := TArray<System.Rtti.TRttiNamedObject>(TObject(GetCtx.GetType(AObject.ClassInfo).AsInstance.GetFields));
    end;
    // Loop for all members
    for PropField in PropsFields do
    begin
      // Skip the RefCount
      if (PropField.Name = 'FRefCount') or (PropField.Name = 'RefCount') then Continue;
      // f := LowerCase(_property.Name);
      KeyName := GetKeyName(PropField, _type);
      // Check if there is properties to ignore
      if IsPropertyToBeIgnored(PropField, AParams) then
      // Check for "DoNotSerializeAttribute"
      if HasAttribute<DoNotSerializeAttribute>(PropField) then
        Continue;
      // Serialize the currente member and add it to the JSONBox
      Value := TDuckPropField.GetValue(AObject, PropField);
      JValue := SerializePropField(Value, PropField, AParams);
      Result.AddPair(KeyName, JValue);
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function omEngine.SerializeObject(const AInterfacedObject: IInterface; const AParams: IomParams): TJSONBox;
begin
  Result := SerializeObject(AInterfacedObject as TObject, AParams);
end;

class function omEngine.SerializeObjectList(const AList: TObjectList<TObject>; const AParams: IomParams; AOwnsInstance: boolean; AForEach: TJSONObjectActionProc): TJSONBox;
var
  I: Integer;
  JV: TJSONObject;
  KeyName: String;
begin
  Result := TJSONBox.Create;
  if Assigned(AList) then
    for I := 0 to AList.Count - 1 do
    begin
      JV := SerializeObject(AList[I], AParams);
      if Assigned(AForEach) then
        AForEach(JV);
      KeyName := 'Item ' + I.ToString;
      Result.AddPair(KeyName, JV);
    end;
  if AOwnsInstance then
    AList.Free;
end;

class function omEngine.SerializePropField(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams; const AEnableCustomSerializers:Boolean): TJSONValue;
begin
  // If a custom serializer exists for the current type then use it
  if AEnableCustomSerializers and AParams.EnableCustomSerializers and SerializeCustom(AValue, APropField, AParams, Result) then
    Exit;
  // Standard serialization by TypeKind
//  case TDuckPropField.TypeKind(ARttiType) of
  case AValue.Kind of
    tkInteger, tkInt64:
      Result := SerializeInteger(AValue);
    tkFloat:
      Result := SerializeFloat(AValue);
    tkString, tkLString, tkWString, tkUString:
      Result := SerializeString(AValue);
    tkEnumeration:
      Result := SerializeEnumeration(AValue);
    tkRecord:
      Result := SerializeRecord(AValue, APropField, AParams);
    tkClass:
      Result := SerializeClass(AValue, APropField, AParams);
    tkInterface:
      Result := SerializeInterface(AValue, APropField, AParams);
  end;
end;

class function omEngine.SerializeRecord(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue;
var
  ts: TTimeStamp;
  LQualifiedTypeName: String;
begin
//  LQualifiedTypeName := TDuckPropField.QualifiedName(APropField);
  LQualifiedTypeName := GetQualifiedTypeName(AValue.TypeInfo);
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

class function omEngine.SerializeString(const AValue: TValue): TJSONValue;
begin
  Result := TJSONString.Create(AValue.AsString);
end;




class function omEngine.SerializeTValue(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IomParams): TJSONValue;
var
  LTypeJSONValue, LJSONValue: TJSONValue;
  JObj: TJSONObject;
  LRttiType: TRttiType;
begin
  // If the TValue is empty then return a TJSONNull and exit
  if AValue.IsEmpty then
    Exit(TJSONNull.Create);
  // Init
  LRttiType := TypeInfoToRttiType(AValue.TypeInfo);
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
      LTypeJSONValue := (LJSONValue as TJSONObject).RemovePair(DMVC_TYPENAME).JsonValue
    else
      LTypeJSONValue := SerializeString(LRttiType.QualifiedName);
    // Set the TValue qualified type name
    JObj.AddPair(DMVC_TYPENAME, LTypeJSONValue);
    // Set the TValue value
    JObj.AddPair(DMVC_VALUE, LJSONValue);
  end
  else
    // Set the TValue value
    Result := LJSONValue;
end;

class function omEngine.TValueToTObject(const AValue: TValue): TObject;
begin
  Result := nil;
  case AValue.Kind of
    tkClass: Result := AValue.AsObject;
    tkInterface: Result := AValue.AsInterface as TObject;
  end;
end;

class function omEngine.TypeInfoToRttiType(const ATypeInfo: Pointer): TRttiType;
begin
  Result := nil;
  Result := GetCtx.GetType(ATypeInfo);
end;

{ TomParams }

constructor TomParams.Create;
begin
  inherited;
  FSerializers := TomSerializersContainer.Create;
  FTypeAnnotations := False;
  FEnableCustomSerializers := False;
  FItemsKeyDefaultQualifiedName := 'System.String';
  FItemsValueDefaultQualifiedName := '';
end;

destructor TomParams.Destroy;
begin
  FSerializers.Free;
  inherited;
end;

function TomParams.GetTypeAnnotations: Boolean;
begin
  Result := FTypeAnnotations;
end;

function TomParams.GetEnableCustomSerializers: Boolean;
begin
  Result := FEnableCustomSerializers;
end;

function TomParams.GetIgnoredProperties: TIgnoredProperties;
begin
  Result := FIgnoredProperties;
end;

function TomParams.GetItemsKeyDefaultQualifiedName: String;
begin
  Result := FItemsKeyDefaultQualifiedName;
end;

function TomParams.GetItemsKeyDefaultTypeInfo: PTypeInfo;
begin
  Result := omEngine.QualifiedTypeNameToRttiType(FItemsKeyDefaultQualifiedName).Handle;
end;

function TomParams.GetItemsValueDefaultQualifiedName: String;
begin
  Result := FItemsValueDefaultQualifiedName;
end;

function TomParams.GetItemsValueDefaultTypeInfo: PTypeInfo;
begin
  Result := omEngine.QualifiedTypeNameToRttiType(FItemsValueDefaultQualifiedName).Handle;
end;

function TomParams.GetSerializationMode: TSerializationMode;
begin
  Result := FSerializationMode;
end;

function TomParams.GetSerializationType: TSerializationType;
begin
  Result := FSerializationType;
end;

function TomParams.GetSerializers: TomSerializersContainer;
begin
  Result := FSerializers;
end;

procedure TomParams.SetTypeAnnotations(const AValue: Boolean);
begin
  FTypeAnnotations := AValue;
end;

procedure TomParams.SetEnableCustomSerializers(const AValue: Boolean);
begin
 FEnableCustomSerializers := AValue;
end;

procedure TomParams.SetIgnoredProperties(const AValue: TIgnoredProperties);
begin
  FIgnoredProperties := AValue;
end;

procedure TomParams.SetItemsKeyDefaultQualifiedName(const AValue: String);
begin
  FItemsKeyDefaultQualifiedName := AValue;
end;

procedure TomParams.SetItemsKeyDefaultTypeInfo(const AValue: PTypeInfo);
begin
  FItemsKeyDefaultQualifiedName := omEngine.TypeInfoToRttiType(AValue).QualifiedName;
end;

procedure TomParams.SetItemsValueDefaultQualifiedName(const AValue: String);
begin
  FItemsValueDefaultQualifiedName := AValue;
end;

procedure TomParams.SetItemsValueDefaultTypeInfo(const AValue: PTypeInfo);
begin
  FItemsValueDefaultQualifiedName := omEngine.TypeInfoToRttiType(AValue).QualifiedName;
end;

procedure TomParams.SetSerializationMode(const AValue: TSerializationMode);
begin
  FSerializationMode := AValue;
end;

procedure TomParams.SetSerializationType(const AValue: TSerializationType);
begin
  FSerializationType := AValue;
end;

{ TomCustomSerializersItem }

constructor TomSerializersContainerItem.Create(
  const ASerializer: TomCustomSerializerRef; const AParams: IomParams);
begin
  inherited Create;
  FSerializer := ASerializer;
  FParams := AParams;
end;

{ TomSerializersContainer }

constructor TomSerializersContainer.Create;
begin
  inherited;
  FSerializersContainer := TDictionary<String, IomSerializersContainerItem>.Create;
end;

destructor TomSerializersContainer.Destroy;
begin
  FSerializersContainer.Free;
  inherited;
end;

function TomSerializersContainer.Exists(const ATargetClass: TClass): Boolean;
begin
  Result := Self._Exists(ATargetClass.ClassInfo);
end;

function TomSerializersContainer.Exists(
  const ATargetTypeInfo: PTypeInfo): Boolean;
begin
  Result := Self._Exists(ATargetTypeInfo);
end;

function TomSerializersContainer.Exists<T>: Boolean;
begin
  Result := Self._Exists(TypeInfo(T));
end;

procedure TomSerializersContainer.Register(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TomCustomSerializerRef; const AParams: IomParams);
begin
  FSerializersContainer.Add(
    omEngine.GetQualifiedTypeName(ATargetTypeInfo),
    TomSerializersContainerItem.Create(ASerializer, AParams)
    );
end;

procedure TomSerializersContainer.Register(const ATargetClass: TClass;
  const ASerializer: TomCustomSerializerRef; const AParams: IomParams);
begin
  Self.Register(ATargetClass.ClassInfo, ASerializer, AParams);
end;

procedure TomSerializersContainer.Register<Target>(
  const ASerializer: TomCustomSerializerRef; const AParams: IomParams);
begin
  Self.Register(TypeInfo(Target), ASerializer, AParams);
end;

procedure TomSerializersContainer.Register<Target; Serializer>(
  const AParams: IomParams);
begin
  Self.Register(TypeInfo(Target), Serializer, AParams);
end;

procedure TomSerializersContainer.Unregister(const ATargetTypeInfo: PTypeInfo);
begin
  FSerializersContainer.Remove(omEngine.GetQualifiedTypeName(ATargetTypeInfo));
end;

procedure TomSerializersContainer.Unregister(const ATargetClass: TClass);
begin
  Self.Unregister(ATargetClass.ClassInfo);
end;

procedure TomSerializersContainer.Unregister<T>;
begin
  Self.Unregister(TypeInfo(T));
end;

function TomSerializersContainer._Exists(
  const ATargetTypeInfo: PTypeInfo): Boolean;
begin
  Result := FSerializersContainer.ContainsKey(omEngine.GetQualifiedTypeName(ATargetTypeInfo));
end;

function TomSerializersContainer._GetSerializerItem(
  const ATargetTypeInfo:PTypeInfo): IomSerializersContainerItem;
begin
  Result := FSerializersContainer.Items[omEngine.GetQualifiedTypeName(ATargetTypeInfo)];
end;

function TomSerializersContainerItem.GetParams: IomParams;
begin
  Result := FParams;
end;

function TomSerializersContainerItem.GetSerializer: TomCustomSerializerRef;
begin
  Result := FSerializer;
end;

procedure TomSerializersContainerItem.SetParams(const Value: IomParams);
begin
  FParams := Value;
end;

procedure TomSerializersContainerItem.SetSerializer(
  const Value: TomCustomSerializerRef);
begin
  FSerializer := Value;
end;

{ TomCustomSerializer }

class function TomCustomSerializer.Deserialize(const AJSONValue:TJSONValue;
  const AExistingValue:TValue; const AParams:IomParams;
  var ADone:Boolean): TValue;
begin
  // None
end;

class function TomCustomSerializer.Serialize(const AValue: TValue;
  const AParams: IomParams; var ADone: Boolean): TJSONValue;
begin
  // None
end;

initialization

  omEngine.Initialize;

end.
