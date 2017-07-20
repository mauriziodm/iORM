{ *******************************************************************************
   Unit added by Maurizio Del Magno to the ObjectsMappers of Daniele Teti
  ******************************************************************************** }

unit ObjMapper.Attributes;

interface

uses
  System.TypInfo, ObjMapper.Engine;

type

  TJSONNameCase = (JSONNameUpperCase, JSONNameLowerCase);

  StreamableAttribute = class(TCustomAttribute)
  end;
  MapperStreamable = StreamableAttribute;

  MapperTransientAttribute = class(TCustomAttribute)
  end;

  DoNotSerializeAttribute = class(TCustomAttribute)
  end;

  MapperJSONNaming = class(TCustomAttribute)
  private
    FJSONKeyCase: TJSONNameCase;
    function GetKeyCase: TJSONNameCase;

  public
    constructor Create(JSONKeyCase: TJSONNameCase);
    property KeyCase: TJSONNameCase read GetKeyCase;
  end;

  MapperJSONSer = class(TCustomAttribute)
  private
    FName: string;
    function GetName: string;

  public
    constructor Create(AName: string);
    property name: string read GetName;
  end;

  MapperSerializeAsString = class(TCustomAttribute)
  strict private
    FEncoding: string;
    procedure SetEncoding(const Value: string);

  const
    DefaultEncoding = 'utf-8';
  public
    constructor Create(AEncoding: string = DefaultEncoding);
    property Encoding: string read FEncoding write SetEncoding;
  end;

  MapperItemsClassType = class(TCustomAttribute)
  private
    FKeyQualifiedName: String;
    FValueQualifiedName: String;
    procedure SetValue(const Value: TClass);
    function GetValue: TClass;
  public
    constructor Create; overload;  // For initialization
    constructor Create(const Value: TClass); overload;  // Use with lists (for compatibility)
    constructor Create(const AValueTypeInfo: PTypeInfo); overload;  // Use with lists
    constructor Create(const AKeyTypeInfo, AValueTypeInfo: PTypeInfo); overload;  // Use with TDIctionary
    property Value: TClass read GetValue write SetValue;
    property KeyQualifiedName: String read FKeyQualifiedName;
    property ValueQualifiedName: String read FValueQualifiedName;
  end;
  MapperListOf = MapperItemsClassType; // just to be more similar to DORM
  MapperItemsType = MapperItemsClassType;  // Preferred new attribute name

  MapperCustomSerializer = class(TCustomAttribute)
  private
    FSerializer: TomCustomSerializerRef;
  public
    constructor Create(const ASerializer:TomCustomSerializerRef);
    property Serializer:TomCustomSerializerRef read FSerializer;
  end;


implementation

uses System.SysUtils, System.Rtti;

{ MapperSerializeAsString }

constructor MapperSerializeAsString.Create(AEncoding: string);
begin
  inherited Create;
  if AEncoding.IsEmpty then
    FEncoding := DefaultEncoding
  else
    FEncoding := AEncoding;
end;

procedure MapperSerializeAsString.SetEncoding(const Value: string);
begin
  FEncoding := Value;
end;

{ JSONSer }

constructor MapperJSONSer.Create(AName: string);
begin
  inherited Create;
  FName := AName;
end;

function MapperJSONSer.GetName: string;
begin
  Result := FName;
end;

{ JSONNaming }

constructor MapperJSONNaming.Create(JSONKeyCase: TJSONNameCase);
begin
  inherited Create;
  FJSONKeyCase := JSONKeyCase;
end;

function MapperJSONNaming.GetKeyCase: TJSONNameCase;
begin
  Result := FJSONKeyCase;
end;


{ MapperItemsClassType }

constructor MapperItemsClassType.Create(const Value: TClass);
begin
  Self.Create(Value.ClassInfo);
end;

constructor MapperItemsClassType.Create;
begin
  inherited Create;
  // Init
  FKeyQualifiedName   := '';
  FValueQualifiedName := '';
end;

constructor MapperItemsClassType.Create(const AValueTypeInfo: PTypeInfo);
var
  typ: TRttiType;
begin
  Self.Create;
  // Extract the qualified type name for the values
  typ := omEngine.TypeInfoToRttiType(AValueTypeInfo);
  if Assigned(typ) then
    FValueQualifiedName := typ.QualifiedName;
end;

constructor MapperItemsClassType.Create(const AKeyTypeInfo,
  AValueTypeInfo: PTypeInfo);
var
  typ: TRttiType;
begin
  // Extract the qualified type name for the values
  Self.Create(AValueTypeInfo);
  // Extract the qualified type name for the Keys
  typ := omEngine.TypeInfoToRttiType(AKeyTypeInfo);
  if Assigned(typ) then
    FKeyQualifiedName := typ.QualifiedName;
end;

function MapperItemsClassType.GetValue: TClass;
var
  typ: TRttiType;
begin
  inherited;
  Result := nil;
  typ := omEngine.QualifiedTypeNameToRttiType(FValueQualifiedName);
  if Assigned(typ) and typ.IsInstance then
    Result := typ.AsInstance.MetaclassType;
end;

procedure MapperItemsClassType.SetValue(const Value: TClass);
begin
  FValueQualifiedName := Value.QualifiedClassName;
end;

{ MapperCustomSerializer }

constructor MapperCustomSerializer.Create(
  const ASerializer: TomCustomSerializerRef);
begin
  Inherited Create;
  FSerializer := ASerializer;
end;

end.

