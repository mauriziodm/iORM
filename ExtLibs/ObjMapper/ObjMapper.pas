{ *******************************************************************************
   Unit added by Maurizio Del Magno to the ObjectsMappers of Daniele Teti
  ******************************************************************************** }

unit ObjMapper;

interface

uses
  ObjMapper.Engine, System.TypInfo, System.Rtti, System.JSON;

type

  TomValueDestination = class;
  TomJSONDestination  = class;

  omRef = class of om;
  om = class
  public
    // Parameters
    class function Default: IomParams;
    class function DefaultByProperty: IomParams;
    class function DefaultByFields: IomParams;
    // Froms
    class function From(const AValue:TValue; const AParams:IomParams=nil): TomValueDestination; overload;
    class function From(const AObject:TObject; const AParams:IomParams=nil): TomValueDestination; overload;
    class function From(const AInterface:IInterface; const AParams:IomParams=nil): TomValueDestination; overload;
    class function FromJSON(const AJSONValue:TJSONValue; const AParams:IomParams=nil): TomJSONDestination; overload;
    class function FromJSON(const AJSONString:String; const AParams:IomParams=nil): TomJSONDestination; overload;
  end;

  TomValueDestination = class
  strict private
    FValue: TValue;
    FParams: IomParams;
  public
    constructor Create(const AValue: TValue; const AParams:IomParams);
    // Destinations
    function ToJSON: TJSONValue;
    function ToString: String;
    // Params
    function Params(const AParams:IomParams): TomValueDestination;
    function ItemsOfType(const AValueType: PTypeInfo): TomValueDestination; overload;
    function ItemsOfType(const AKeyType, AValueType: PTypeInfo): TomValueDestination; overload;
    function ItemsOfType<Value>: TomValueDestination; overload;
    function ItemsOfType<Key,Value>: TomValueDestination; overload;
    function JavaScriptMode: TomValueDestination;
    function DataContractMode: TomValueDestination;
    function byProperties: TomValueDestination;
    function byFields: TomValueDestination;
    function TypeAnnotationsON: TomValueDestination;
    function TypeAnnotationsOFF: TomValueDestination;
    function CustomSerializersON: TomValueDestination;
    function CustomSerializersOFF: TomValueDestination;
    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil): TomValueDestination; overload;
    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil): TomValueDestination; overload;
    function CustomSerializer<Target>(const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil): TomValueDestination; overload;
    function CustomSerializer<Target; Serializer:TomCustomSerializer>(const AParams:IomParams=nil): TomValueDestination; overload;
  end;

  TomJSONDestination = class
  strict private
    FValue: TJSONValue;
    FOwnJSONValue_Transient: Boolean;  // Usato da "FromJSON" con parametro stringa
    FParams: IomParams;
  public
    constructor Create(const AValue: TJSONValue; const AParams:IomParams);
    destructor Destroy; override;
    // Destinations
    function ToValue(const ATypeValue:PTypeInfo): TValue;
    function ToObject: TObject;
    function &To<T>: T; overload;
    procedure &To(const AObject: TObject); overload;
    procedure &To(const AInterface: IInterface); overload;
    // Params
    function Params(const AParams:IomParams): TomJSONDestination;
    function ItemsOfType(const AValueType: PTypeInfo): TomJSONDestination; overload;
    function ItemsOfType(const AKeyType, AValueType: PTypeInfo): TomJSONDestination; overload;
    function ItemsOfType<Value>: TomJSONDestination; overload;
    function ItemsOfType<Key,Value>: TomJSONDestination; overload;
    function JavaScriptMode: TomJSONDestination;
    function DataContractMode: TomJSONDestination;
    function byProperties: TomJSONDestination;
    function byFields: TomJSONDestination;
    function TypeAnnotationsON: TomJSONDestination;
    function TypeAnnotationsOFF: TomJSONDestination;
    function CustomSerializersON: TomJSONDestination;
    function CustomSerializersOFF: TomJSONDestination;
    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil): TomJSONDestination; overload;
    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil): TomJSONDestination; overload;
    function CustomSerializer<Target>(const ASerializer:TomCustomSerializerRef; const AParams:IomParams=nil): TomJSONDestination; overload;
    function CustomSerializer<Target; Serializer:TomCustomSerializer>(const AParams:IomParams=nil): TomJSONDestination; overload;
    function OwnJSONValue(const AOwnJSONValue: Boolean = True): TomJSONDestination;
  end;

implementation

uses
  ObjMapper.RTTIUtils, System.SysUtils;

{ om }

class function om.Default: IomParams;
begin
  Result := DefaultByProperty;
end;

class function om.DefaultByFields: IomParams;
begin
  Result := omEngine.DefaultByFields;
end;

class function om.DefaultByProperty: IomParams;
begin
  Result := omEngine.DefaultByProperty;
end;

class function om.FromJSON(const AJSONValue:TJSONValue; const AParams:IomParams=nil): TomJSONDestination;
begin
  Result := TomJSONDestination.Create(AJSONValue, AParams);
end;

class function om.From(const AValue: TValue;
  const AParams: IomParams): TomValueDestination;
begin
  Result := TomValueDestination.Create(AValue, AParams);
end;

class function om.From(const AObject: TObject;
  const AParams: IomParams): TomValueDestination;
var
  LValue: TValue;
begin
  TValue.Make(@AObject, AObject.ClassInfo, LValue);
  Result := Self.From(LValue, AParams);
end;

class function om.From(const AInterface: IInterface;
  const AParams: IomParams): TomValueDestination;
begin
  Result := Self.From(AInterface as TObject, AParams);
end;

class function om.FromJSON(const AJSONString: String;
  const AParams: IomParams): TomJSONDestination;
begin
  Result := Self.FromJSON(TJSONObject.ParseJSONValue(AJSONString), AParams);
  Result.OwnJSONValue(True);
end;

{ TomJSONDestination }

procedure TomJSONDestination.&To(const AObject: TObject);
var
  LRttiType: TRttiType;
begin
  try
    LRttiType := omEngine.TypeInfoToRttiType(AObject.ClassInfo);
    omEngine.DeserializePropField(FValue, LRttiType, nil, AObject, FParams);
  finally
    Self.Free;
  end;
end;

procedure TomJSONDestination.&To(const AInterface: IInterface);
begin
  Self.&To(AInterface as TObject);
end;

function TomJSONDestination.byFields: TomJSONDestination;
begin
  FParams.SerializationType := stFields;
  Result := Self;
end;

function TomJSONDestination.byProperties: TomJSONDestination;
begin
  FParams.SerializationType := stProperties;
  Result := Self;
end;

constructor TomJSONDestination.Create(const AValue: TJSONValue; const AParams:IomParams);
begin
  inherited Create;
  FValue := AValue;
  FOwnJSONValue_Transient := False; // JSONValue is not owned by default
  if Assigned(AParams) then
    FParams := AParams
  else
    FParams := om.Default;
end;

function TomJSONDestination.ToValue(const ATypeValue: PTypeInfo): TValue;
var
  LRttiType: TRttiType;
begin
  try
    LRttiType := omEngine.TypeInfoToRttiType(ATypeValue);
    Result := omEngine.DeserializePropField(FValue, LRttiType, nil, nil, FParams);
  finally
    Self.Free;
  end;
end;

function TomJSONDestination.TypeAnnotationsOFF: TomJSONDestination;
begin
  FParams.TypeAnnotations := False;
  Result := Self;
end;

function TomJSONDestination.TypeAnnotationsON: TomJSONDestination;
begin
  FParams.TypeAnnotations := True;
  Result := Self;
end;

function TomJSONDestination.ItemsOfType(
  const AValueType: PTypeInfo): TomJSONDestination;
begin
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TomJSONDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TomCustomSerializerRef;
  const AParams: IomParams): TomJSONDestination;
begin
  FParams.Serializers.Register(ATargetTypeInfo, ASerializer, AParams);
  Result := Self;
end;

function TomJSONDestination.CustomSerializer(const ATargetClass: TClass;
  const ASerializer: TomCustomSerializerRef;
  const AParams: IomParams): TomJSONDestination;
begin
  FParams.Serializers.Register(ATargetClass, ASerializer, AParams);
  Result := Self;
end;

function TomJSONDestination.CustomSerializer<Target; Serializer>(
  const AParams: IomParams): TomJSONDestination;
begin
  FParams.Serializers.Register<Target, Serializer>(AParams);
  Result := Self;
end;

function TomJSONDestination.CustomSerializer<Target>(
  const ASerializer: TomCustomSerializerRef;
  const AParams: IomParams): TomJSONDestination;
begin
  FParams.Serializers.Register<Target>(ASerializer, AParams);
  Result := Self;
end;

function TomJSONDestination.CustomSerializersOFF: TomJSONDestination;
begin
  FParams.EnableCustomSerializers := False;
  Result := Self;
end;

function TomJSONDestination.CustomSerializersON: TomJSONDestination;
begin
  FParams.EnableCustomSerializers := True;
  Result := Self;
end;

function TomJSONDestination.DataContractMode: TomJSONDestination;
begin
  FParams.SerializationMode := smDataContract;
  Result := Self;
end;

destructor TomJSONDestination.Destroy;
begin
  // Destroy the JSONValue if owned
  if (FParams.OwnJSONValue or FOwnJSONValue_Transient) and Assigned(FValue) then
    FValue.Free;
  inherited;
end;

function TomJSONDestination.ItemsOfType(const AKeyType,
  AValueType: PTypeInfo): TomJSONDestination;
begin
  FParams.ItemsKeyDefaultTypeInfo := AKeyType;
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TomJSONDestination.ItemsOfType<Key, Value>: TomJSONDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Key), TypeInfo(Value));
end;

function TomJSONDestination.ItemsOfType<Value>: TomJSONDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Value));
end;

function TomJSONDestination.JavaScriptMode: TomJSONDestination;
begin
  FParams.SerializationMode := smJavaScript;
  Result := Self;
end;

function TomJSONDestination.OwnJSONValue(
  const AOwnJSONValue: Boolean): TomJSONDestination;
begin
  FOwnJSONValue_Transient := AOwnJSONValue;
  Result := Self;
end;

function TomJSONDestination.Params(
  const AParams: IomParams): TomJSONDestination;
begin
  Self.FParams := AParams;
  Result := Self;
end;

function TomJSONDestination.&To<T>: T;
begin
  Result := Self.ToValue(TypeInfo(T)).AsType<T>;
end;

function TomJSONDestination.ToObject: TObject;
var
  LRttiType: TRttiType;
  ResultValue: TValue;
  LTypeJSONValue: TJSONValue;
begin
  try
    // Init
    LRttiType := nil;
    // Load types informations from the JSON
    if (FValue is TJSONObject) then begin
      // Retrieve the value type if embedded in JSON
      LTypeJSONValue := TJSONObject(FValue).GetValue(DMVC_TYPENAME);
      if Assigned(LTypeJSONValue) then
        LRttiType := omEngine.QualifiedTypeNameToRttiType(LTypeJSONValue.Value);
    end;
    // Check for desination Rtti validity
    if not Assigned(LRttiType) then
      raise EMapperException.Create('Deserialize ToObject: Type informations not found.');
    // Deserialize
    ResultValue := omEngine.DeserializePropField(FValue, LRttiType, nil, nil, FParams);
    Result := ResultValue.AsObject;
  finally
    Self.Free;
  end;
end;

{ TomValueDestination }

function TomValueDestination.byFields: TomValueDestination;
begin
  FParams.SerializationType := stFields;
  Result := Self;
end;

function TomValueDestination.byProperties: TomValueDestination;
begin
  FParams.SerializationType := stProperties;
  Result := Self;
end;

constructor TomValueDestination.Create(const AValue: TValue;
  const AParams: IomParams);
begin
  inherited Create;
  FValue := AValue;
  if Assigned(AParams) then
    FParams := AParams
  else
    FParams := om.Default;
end;

function TomValueDestination.CustomSerializer(const ATargetClass: TClass;
  const ASerializer: TomCustomSerializerRef;
  const AParams: IomParams): TomValueDestination;
begin
  FParams.Serializers.Register(ATargetClass, ASerializer, AParams);
  Result := Self;
end;

function TomValueDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TomCustomSerializerRef;
  const AParams: IomParams): TomValueDestination;
begin
  FParams.Serializers.Register(ATargetTypeInfo, ASerializer, AParams);
  Result := Self;
end;

function TomValueDestination.CustomSerializer<Target, Serializer>(
  const AParams: IomParams): TomValueDestination;
begin
  FParams.Serializers.Register<Target, Serializer>(AParams);
  Result := Self;
end;

function TomValueDestination.CustomSerializer<Target>(
  const ASerializer: TomCustomSerializerRef;
  const AParams: IomParams): TomValueDestination;
begin
  FParams.Serializers.Register<Target>(ASerializer, AParams);
  Result := Self;
end;

function TomValueDestination.CustomSerializersOFF: TomValueDestination;
begin
  FParams.EnableCustomSerializers := False;
  Result := Self;
end;

function TomValueDestination.CustomSerializersON: TomValueDestination;
begin
  FParams.EnableCustomSerializers := True;
  Result := Self;
end;

function TomValueDestination.DataContractMode: TomValueDestination;
begin
  FParams.SerializationMode := smDataContract;
  Result := Self;
end;

function TomValueDestination.ItemsOfType(
  const AValueType: PTypeInfo): TomValueDestination;
begin
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TomValueDestination.ItemsOfType(const AKeyType,
  AValueType: PTypeInfo): TomValueDestination;
begin
  FParams.ItemsKeyDefaultTypeInfo := AKeyType;
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TomValueDestination.ItemsOfType<Key, Value>: TomValueDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Key), TypeInfo(Value));
end;

function TomValueDestination.ItemsOfType<Value>: TomValueDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Value));
end;

function TomValueDestination.JavaScriptMode: TomValueDestination;
begin
  FParams.SerializationMode := smJavaScript;
  Result := Self;
end;

function TomValueDestination.Params(
  const AParams: IomParams): TomValueDestination;
begin
  Self.FParams := AParams;
  Result := Self;
end;

function TomValueDestination.ToJSON: TJSONValue;
var
  LRttiType: TRttiType;
begin
  try
    Result := omEngine.SerializePropField(FValue, nil, FParams);
  finally
    Self.Free;
  end;
end;

function TomValueDestination.ToString: String;
var
  LJSONValue: TJSONValue;
begin
  LJSONValue := Self.ToJSON;
  try
    Result := LJSONValue.ToString;
  finally
    LJSONValue.Free;
  end;
end;

function TomValueDestination.TypeAnnotationsOFF: TomValueDestination;
begin
  FParams.TypeAnnotations := False;
  Result := Self;
end;

function TomValueDestination.TypeAnnotationsON: TomValueDestination;
begin
  FParams.TypeAnnotations := True;
  Result := Self;
end;

end.
