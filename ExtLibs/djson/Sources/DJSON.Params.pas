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
unit DJSON.Params;

interface

uses
  System.TypInfo, DJSON.Serializers, System.Generics.Collections, System.Rtti,
  DJSON.TypeInfoCache, DJSON.ISO8601Processor;

type

//  TdjEngine = (eDelphiDOM, eDelphiStream, eJDO, eTurboJDO);
  TdjEngine = (eDelphiDOM, eDelphiStream);

  TdjNameCase = (ncUndefinedCase, ncUpperCase, ncLowerCase);

  TdjSerializationMode = (smJavaScript, smDataContract);

  TdjSerializationType = (stProperties, stFields);

  TdjIgnoredProperties = array of string;

  TdjSerializersContainer = class;

  TdjPropInfoCache = class;

  TdjDateTimeFormat = (dfISO8601, dfDMVCFramework, dfUnix);

  IdjParams = interface;

  TdjEngineRef = class of TdjEngineIntf;
  TdjEngineIntf = class abstract
  public
    class function Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True): String; virtual; abstract;
    class function Deserialize(const AJSONText:String; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; virtual; abstract;
  end;

  IdjParams = interface
    ['{347611D7-F62B-49DB-B08A-E158D466F8AE}']
    // Engine (No property)
    function GetEngineClass: TdjEngineRef;
    // EngineType
    procedure SetEngine(const AValue: TdjEngine);
    function GetEngine: TdjEngine;
    property Engine: TdjEngine read GetEngine write SetEngine;
    // SerializationMode
    procedure SetSerializationMode(const AValue: TdjSerializationMode);
    function GetSerializationMode: TdjSerializationMode;
    property SerializationMode: TdjSerializationMode read GetSerializationMode write SetSerializationMode;
    // SerializationType
    procedure SetSerializationType(const AValue: TdjSerializationType);
    function GetSerializationType: TdjSerializationType;
    property SerializationType: TdjSerializationType read GetSerializationType write SetSerializationType;
    // Pretty-Print
    procedure SetPrettyPrint(const AValue: Boolean);
    function GetPrettyPrint: Boolean;
    property PrettyPrint: Boolean read GetPrettyPrint write SetPrettyPrint;
    // TypeAnnotations
    procedure SetTypeAnnotations(const AValue: Boolean);
    function GetTypeAnnotations: Boolean;
    property TypeAnnotations: Boolean read GetTypeAnnotations write SetTypeAnnotations;
    // IgnoreObjStatus
    procedure SetIgnoreObjStatus(const AValue: Boolean);
    function GetIgnoreObjStatus: Boolean;
    property IgnoreObjStatus: Boolean read GetIgnoreObjStatus write SetIgnoreObjStatus;
    // IgnoredProperties
    procedure SetIgnoredProperties(const AValue: TdjIgnoredProperties);
    function GetIgnoredProperties: TdjIgnoredProperties;
    property IgnoredProperties: TdjIgnoredProperties read GetIgnoredProperties write SetIgnoredProperties;
    // EnableCustomSerializers
    procedure SetEnableCustomSerializers(const AValue: Boolean);
    function GetEnableCustomSerializers: Boolean;
    property EnableCustomSerializers: Boolean read GetEnableCustomSerializers write SetEnableCustomSerializers;
    // Serializers
    function GetSerializers: TdjSerializersContainer;
    property Serializers: TdjSerializersContainer read GetSerializers;
    // TypeInfoCache
    function TypeInfoCache: TdjTypeInfoCache;
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
    // OwnJSONValue
    procedure SetOwnJSONValue(const AValue:Boolean);
    function GetOwnJSONValue: Boolean;
    property OwnJSONValue: Boolean read GetOwnJSONValue write SetOwnJSONValue;
    // NameCase
    procedure SetNameCase(const AValue:TdjNameCase);
    function GetNameCase: TdjNameCase;
    property NameCase: TdjNameCase read GetNameCase write SetNameCase;
    // BsonRoot
    procedure SetBsonRoot(const AValue:Boolean);
    function GetBsonRoot: Boolean;
    property BsonRoot: Boolean read GetBsonRoot write SetBsonRoot;
    // BsonRootLabel
    procedure SetBsonRootLabel(const AValue:String);
    function GetBsonRootLabel: String;
    property BsonRootLabel: String read GetBsonRootLabel write SetBsonRootLabel;
    // EmptyStringAsNull
    procedure SetEmptyStringAsNull(const AValue:Boolean);
    function GetEmptyStringAsNull: Boolean;
    property EmptyStringAsNull:Boolean read GetEmptyStringAsNull write SetEmptyStringAsNull;
    // EmptyCharAsNull
    procedure SetEmptyCharAsNull(const AValue:Boolean);
    function GetEmptyCharAsNull: Boolean;
    property EmptyCharAsNull:Boolean read GetEmptyCharAsNull write SetEmptyCharAsNull;
    // DateTimeFormat
    procedure SetDateTimeFormat(const AValue:TdjDateTimeFormat);
    function GetDateTimeFormat: TdjDateTimeFormat;
    property DateTimeFormat:TdjDateTimeFormat read GetDateTimeFormat write SetDateTimeFormat;
    // ISO8601Params
    function GetISO8601Processor: PdjISO8601Processor;
    property ISO8601Processor:PdjISO8601Processor read GetISO8601Processor;
    // DateSeparator
    procedure SetDateSeparator(const AValue:string);
    function GetDateSeparator: string;
    property DateSeparator:string read GetDateSeparator write SetDateSeparator;
    // TimeUTC
    procedure SetTimeUTC(const AValue:boolean);
    function GetTimeUTC: boolean;
    property TimeUTC:boolean read GetTimeUTC write SetTimeUTC;
    // TimePrefix
    procedure SetTimePrefix(const AValue:string);
    function GetTimePrefix: string;
    property TimePrefix:string read GetTimePrefix write SetTimePrefix;
    // TimeSeparator
    procedure SetTimeSeparator(const AValue:string);
    function GetTimeSeparator: string;
    property TimeSeparator:string read GetTimeSeparator write SetTimeSeparator;
    // TimeZulu
    procedure SetTimeZulu(const AValue:string);
    function GetTimeZulu: string;
    property TimeZulu:string read GetTimeZulu write SetTimeZulu;
    // TimeMillisecSeparator
    procedure SetTimeMillisecSeparator(const AValue:string);
    function GetTimeMillisecSeparator: string;
    property TimeMillisecSeparator:string read GetTimeMillisecSeparator write SetTimeMillisecSeparator;
    // TimeSeconds
    procedure SetTimeSeconds(const AValue:boolean);
    function GetTimeSeconds: boolean;
    property TimeSeconds:boolean read GetTimeSeconds write SetTimeSeconds;
    // TimeMillisec
    procedure SetTimeMillisec(const AValue:boolean);
    function GetTimeMillisec: boolean;
    property TimeMillisec:boolean read GetTimeMillisec write SetTimeMillisec;
    // TimezonePrefix
    procedure SetTimezonePrefix(const AValue:string);
    function GetTimezonePrefix: string;
    property TimezonePrefix:string read GetTimezonePrefix write SetTimezonePrefix;
    // TimezoneSeparator
    procedure SetTimezoneSeparator(const AValue:string);
    function GetTimezoneSeparator: string;
    property TimezoneSeparator:string read GetTimezoneSeparator write SetTimezoneSeparator;
    // TimezoneIgnore
    procedure SetTimezoneIgnore(const AValue:boolean);
    function GetTimezoneIgnore: boolean;
    property TimezoneIgnore:boolean read GetTimezoneIgnore write SetTimezoneIgnore;
    // ClearCollection
    procedure SetClearCollection(const AValue:boolean);
    function GetClearCollection: boolean;
    property ClearCollection:boolean read GetClearCollection write SetClearCollection;
    // PropInfoCache
    function PropInfoCache: TdjPropInfoCache;
  end;

  TdjParams = class(TInterfacedObject, IdjParams)
  strict private
    FEngineClass: TdjEngineRef;
    FEngineType: TdjEngine;
    FSerializationMode: TdjSerializationMode;
    FSerializationType: TdjSerializationType;
    FPrettyPrint: Boolean;
    FTypeAnnotations: Boolean;
    FIgnoredProperties: TdjIgnoredProperties;
    FEnableCustomSerializers: Boolean;
    FSerializers: TdjSerializersContainer;
    FItemsKeyDefaultQualifiedName: String;
    FItemsValueDefaultQualifiedName: String;
    FOwnJSONValue: Boolean;
    FNameCase: TdjNameCase;
    FTypeInfoCache: TdjTypeInfoCache;
    FBsonRoot: Boolean;
    FBsonRootLabel: String;
    FEmptyStringAsNull: Boolean;
    FEmptyCharAsNull: Boolean;
    FDateTimeFormat: TdjDateTimeFormat;
    FISO8601Processor: TdjISO8601Processor;
    FClearCollection: Boolean;
    FPropInfoCache: TdjPropInfoCache;
    FIgnoreObjStatus: Boolean;
    // Engine (No property)
    function GetEngineClass: TdjEngineRef;
    // EngineType
    procedure SetEngine(const AValue: TdjEngine);
    function GetEngine: TdjEngine;
    // SerializationMode
    procedure SetSerializationMode(const AValue: TdjSerializationMode);
    function GetSerializationMode: TdjSerializationMode;
    // SerializationType
    procedure SetSerializationType(const AValue: TdjSerializationType);
    function GetSerializationType: TdjSerializationType;
    // Pretty-Print
    procedure SetPrettyPrint(const AValue: Boolean);
    function GetPrettyPrint: Boolean;
    // DataTypesAnnotation
    procedure SetTypeAnnotations(const AValue: Boolean);
    function GetTypeAnnotations: Boolean;
    // IgnoreObjStatus
    procedure SetIgnoreObjStatus(const AValue: Boolean);
    function GetIgnoreObjStatus: Boolean;
    // IgnoredProperties
    procedure SetIgnoredProperties(const AValue: TdjIgnoredProperties);
    function GetIgnoredProperties: TdjIgnoredProperties;
    // EnableCustomSerializers
    procedure SetEnableCustomSerializers(const AValue: Boolean);
    function GetEnableCustomSerializers: Boolean;
    // Serializers
    function GetSerializers: TdjSerializersContainer;
    // TypeInfoCache
    function TypeInfoCache: TdjTypeInfoCache;
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
    // OwnJSONValue
    procedure SetOwnJSONValue(const AValue:Boolean);
    function GetOwnJSONValue: Boolean;
    // NameCase
    procedure SetNameCase(const AValue:TdjNameCase);
    function GetNameCase: TdjNameCase;
    // BsonRoot
    procedure SetBsonRoot(const AValue:Boolean);
    function GetBsonRoot: Boolean;
    // BsonRootLabel
    procedure SetBsonRootLabel(const AValue:String);
    function GetBsonRootLabel: String;
    // EmptyStringAsNull
    procedure SetEmptyStringAsNull(const AValue:Boolean);
    function GetEmptyStringAsNull: Boolean;
    // EmptyCharAsNull
    procedure SetEmptyCharAsNull(const AValue:Boolean);
    function GetEmptyCharAsNull: Boolean;
    // DateTimeFormat
    procedure SetDateTimeFormat(const AValue:TdjDateTimeFormat);
    function GetDateTimeFormat: TdjDateTimeFormat;
    // ISO8601Processor
    function GetISO8601Processor: PdjISO8601Processor;
    // DateSeparator
    procedure SetDateSeparator(const AValue:string);
    function GetDateSeparator: string;
    // TimeUTC
    procedure SetTimeUTC(const AValue:boolean);
    function GetTimeUTC: boolean;
    // TimePrefix
    procedure SetTimePrefix(const AValue:string);
    function GetTimePrefix: string;
    // TimeSeparator
    procedure SetTimeSeparator(const AValue:string);
    function GetTimeSeparator: string;
    // TimeZulu
    procedure SetTimeZulu(const AValue:string);
    function GetTimeZulu: string;
    // TimeMillisecSeparator
    procedure SetTimeMillisecSeparator(const AValue:string);
    function GetTimeMillisecSeparator: string;
    // TimeSeconds
    procedure SetTimeSeconds(const AValue:boolean);
    function GetTimeSeconds: boolean;
    // TimeMillisec
    procedure SetTimeMillisec(const AValue:boolean);
    function GetTimeMillisec: boolean;
    // TimezonePrefix
    procedure SetTimezonePrefix(const AValue:string);
    function GetTimezonePrefix: string;
    // TimezoneSeparator
    procedure SetTimezoneSeparator(const AValue:string);
    function GetTimezoneSeparator: string;
    // TimezoneIgnore
    procedure SetTimezoneIgnore(const AValue:boolean);
    function GetTimezoneIgnore: boolean;
    // ClearCollection
    procedure SetClearCollection(const AValue:boolean);
    function GetClearCollection: boolean;
    // PropInfoCache
    function PropInfoCache: TdjPropInfoCache;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TdjSerializersContainerItem = class
  strict private
    FDOMSerializer: TdjDOMCustomSerializerRef;
//    FXMLSerializer: TdjXMLCustomSerializerRef;
    FStreamSerializer: TdjStreamCustomSerializerRef;
  public
    constructor Create;
    property DOMSerializer:TdjDOMCustomSerializerRef read FDOMSerializer write FDOMSerializer;
//    property XMLSerializer:TdjXMLCustomSerializerRef read FXMLSerializer write FXMLSerializer;
    property StreamSerializer:TdjStreamCustomSerializerRef read FStreamSerializer write FStreamSerializer;
  end;

  TdjSerializersContainer = class
  strict private
    FSerializersContainer: TObjectDictionary<String, TdjSerializersContainerItem>;
    function _GetOrCreateSerializersContainerItem(const ATargetTypeInfo:PTypeInfo): TdjSerializersContainerItem;
  public
    constructor Create;
    destructor Destroy; override;
    procedure &Register(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjDOMCustomSerializerRef); overload;
//    procedure &Register(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjXMLCustomSerializerRef); overload;
    procedure &Register(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjStreamCustomSerializerRef); overload;
    procedure &Register(const ATargetClass:TClass; const ASerializer:TdjDOMCustomSerializerRef); overload;
//    procedure &Register(const ATargetClass:TClass; const ASerializer:TdjXMLCustomSerializerRef); overload;
    procedure &Register(const ATargetClass:TClass; const ASerializer:TdjStreamCustomSerializerRef); overload;
    procedure &Register<Target>(const ASerializer:TdjDOMCustomSerializerRef); overload;
//    procedure &Register<Target>(const ASerializer:TdjXMLCustomSerializerRef); overload;
    procedure &Register<Target>(const ASerializer:TdjStreamCustomSerializerRef); overload;
    procedure Unregister(const ATargetTypeInfo:PTypeInfo); overload;
    procedure Unregister(const ATargetClass:TClass); overload;
    procedure Unregister<T>; overload;
    function _GetSerializerItem(const ATargetTypeInfo:PTypeInfo): TdjSerializersContainerItem;
    function _Exists(const ATargetTypeInfo:PTypeInfo): Boolean;
    function Exists_DOM(const ATargetTypeInfo:PTypeInfo): Boolean; overload;
//    function Exists_XML(const ATargetTypeInfo:PTypeInfo): Boolean; overload;
    function Exists_Stream(const ATargetTypeInfo:PTypeInfo): Boolean; overload;
    function Exists_DOM(const ATargetClass:TClass): Boolean; overload;
//    function Exists_XML(const ATargetClass:TClass): Boolean; overload;
    function Exists_Stream(const ATargetClass:TClass): Boolean; overload;
    function Exists_DOM<T>: Boolean; overload;
//    function Exists_XML<T>: Boolean; overload;
    function Exists_Stream<T>: Boolean; overload;
  end;

  TdjPropInfoCache = class
  strict private
    FPropInfoCollection: TDictionary<Pointer,PPropInfo>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetPropInfo(const AProperty:TRttiNamedObject): PPropInfo;
  end;

implementation

uses
  DJSON.Utils.RTTI, DJSON.Factory;

{ TdjParams }

constructor TdjParams.Create;
begin
  inherited;
  // Set the default engine
//  SetEngine(TdjEngine.eDelphiDOM);
  SetEngine(TdjEngine.eDelphiStream);

  FTypeInfoCache := TdjTypeInfoCache.Create;
  FSerializers := TdjSerializersContainer.Create;
  FTypeAnnotations := False;
  FEnableCustomSerializers := False;
  FItemsKeyDefaultQualifiedName := 'System.String';
  FItemsValueDefaultQualifiedName := '';
  FOwnJSONValue := False; // JSONValue is not owned by default
  FNameCase := ncUndefinedCase;
  FBsonRoot := True;
  FBsonRootLabel := 'root';
  FEmptyStringAsNull := False;
  FEmptyCharAsNull := False;
  SetDateTimeFormat(TdjDateTimeFormat.dfISO8601);  // Use the setter
  FClearCollection := False;
  FPropInfoCache := TdjPropInfoCache.Create;
  FIgnoreObjStatus := False;
end;

destructor TdjParams.Destroy;
begin
  FTypeInfoCache.Free;
  FSerializers.Free;
  FPropInfoCache.Free;
  inherited;
end;

function TdjParams.GetTimeMillisec: boolean;
begin
  Result := FISO8601Processor.Millisec;
end;

function TdjParams.GetTimeMillisecSeparator: string;
begin
  Result := FISO8601Processor.MillisecSeparator;
end;

function TdjParams.GetTimePrefix: string;
begin
  Result := FISO8601Processor.TimePrefix;
end;

function TdjParams.GetTimeSeconds: boolean;
begin
  Result := FISO8601Processor.Seconds;
end;

function TdjParams.GetTimeSeparator: string;
begin
  Result := FISO8601Processor.TimeSeparator;
end;

function TdjParams.GetTimeUTC: boolean;
begin
  Result := FISO8601Processor.UTCTime;
end;

function TdjParams.GetTimezoneIgnore: boolean;
begin
  Result := FISO8601Processor.TimezoneIgnore;
end;

function TdjParams.GetTimezonePrefix: string;
begin
  Result := FISO8601Processor.TimezonePrefix;
end;

function TdjParams.GetTimezoneSeparator: string;
begin
  Result := FISO8601Processor.TimezoneSeparator;
end;

function TdjParams.GetTimeZulu: string;
begin
  Result := FISO8601Processor.Zulu;
end;

function TdjParams.GetTypeAnnotations: Boolean;
begin
  Result := FTypeAnnotations;
end;

function TdjParams.PropInfoCache: TdjPropInfoCache;
begin
  Result := FPropInfoCache;
end;

function TdjParams.GetBsonRoot: Boolean;
begin
  Result := FBsonRoot;
end;

function TdjParams.GetBsonRootLabel: String;
begin
  Result := FBsonRootLabel;
end;

function TdjParams.GetClearCollection: boolean;
begin
  result := FClearCollection;
end;

function TdjParams.GetDateSeparator: string;
begin
  Result := FISO8601Processor.DateSeparator;
end;

function TdjParams.GetDateTimeFormat: TdjDateTimeFormat;
begin
  Result := FDateTimeFormat;
end;

function TdjParams.GetEmptyCharAsNull: Boolean;
begin
  Result := FEmptyCharAsNull;
end;

function TdjParams.GetEmptyStringAsNull: Boolean;
begin
  Result := FEmptyStringAsNull;
end;

function TdjParams.GetEnableCustomSerializers: Boolean;
begin
  Result := FEnableCustomSerializers;
end;

function TdjParams.GetEngineClass: TdjEngineRef;
begin
  Result := FEngineClass;
end;

function TdjParams.GetEngine: TdjEngine;
begin
  Result := FEngineType;
end;

function TdjParams.GetIgnoredProperties: TdjIgnoredProperties;
begin
  Result := FIgnoredProperties;
end;

function TdjParams.GetIgnoreObjStatus: Boolean;
begin
  Result := FIgnoreObjStatus;
end;

function TdjParams.GetISO8601Processor: PdjISO8601Processor;
begin
  Result := @FISO8601Processor;
end;

function TdjParams.GetItemsKeyDefaultQualifiedName: String;
begin
  Result := FItemsKeyDefaultQualifiedName;
end;

function TdjParams.GetItemsKeyDefaultTypeInfo: PTypeInfo;
begin
  Result := TdjRTTI.QualifiedTypeNameToRttiType(FItemsKeyDefaultQualifiedName).Handle;
end;

function TdjParams.GetItemsValueDefaultQualifiedName: String;
begin
  Result := FItemsValueDefaultQualifiedName;
end;

function TdjParams.GetItemsValueDefaultTypeInfo: PTypeInfo;
begin
  Result := TdjRTTI.QualifiedTypeNameToRttiType(FItemsValueDefaultQualifiedName).Handle;
end;

function TdjParams.GetNameCase: TdjNameCase;
begin
  Result := FNameCase;
end;

function TdjParams.GetOwnJSONValue: Boolean;
begin
  Result := FOwnJSONValue;
end;

function TdjParams.GetPrettyPrint: Boolean;
begin
  Result := FPrettyPrint;
end;

function TdjParams.GetSerializationMode: TdjSerializationMode;
begin
  Result := FSerializationMode;
end;

function TdjParams.GetSerializationType: TdjSerializationType;
begin
  Result := FSerializationType;
end;

function TdjParams.GetSerializers: TdjSerializersContainer;
begin
  Result := FSerializers;
end;

procedure TdjParams.SetTimeMillisec(const AValue: boolean);
begin
  FISO8601Processor.Millisec := AValue;
end;

procedure TdjParams.SetTimeMillisecSeparator(const AValue: string);
begin
  FISO8601Processor.MillisecSeparator := AValue;
end;

procedure TdjParams.SetTimePrefix(const AValue: string);
begin
  FISO8601Processor.TimePrefix := AValue;
end;

procedure TdjParams.SetTimeSeconds(const AValue: boolean);
begin
  FISO8601Processor.Seconds := AValue;
end;

procedure TdjParams.SetTimeSeparator(const AValue: string);
begin
  FISO8601Processor.TimeSeparator := AValue;
end;

procedure TdjParams.SetTimeUTC(const AValue: boolean);
begin
  FISO8601Processor.UTCTime := AValue;
end;

procedure TdjParams.SetTimezoneIgnore(const AValue: boolean);
begin
  FISO8601Processor.TimezoneIgnore := AValue;
end;

procedure TdjParams.SetTimezonePrefix(const AValue: string);
begin
  FISO8601Processor.TimezonePrefix := AValue;
end;

procedure TdjParams.SetTimezoneSeparator(const AValue: string);
begin
  FISO8601Processor.TimezoneSeparator := AValue;
end;

procedure TdjParams.SetTimeZulu(const AValue: string);
begin
  FISO8601Processor.Zulu := AValue;
end;

procedure TdjParams.SetTypeAnnotations(const AValue: Boolean);
begin
  FTypeAnnotations := AValue;
end;

function TdjParams.TypeInfoCache: TdjTypeInfoCache;
begin
  Result := FTypeInfoCache;
end;

procedure TdjParams.SetBsonRoot(const AValue: Boolean);
begin
  FBsonRoot := AValue;
end;

procedure TdjParams.SetBsonRootLabel(const AValue: String);
begin
  FBsonRootLabel := AValue;
end;

procedure TdjParams.SetClearCollection(const AValue: boolean);
begin
  FClearCollection := AValue;
end;

procedure TdjParams.SetDateSeparator(const AValue: string);
begin
  FISO8601Processor.DateSeparator := AValue;
end;

procedure TdjParams.SetDateTimeFormat(const AValue: TdjDateTimeFormat);
begin
  FDateTimeFormat := AValue;
  case FDateTimeFormat of
    dfISO8601:
      FISO8601Processor.ResetToDefault;
    dfUnix:
      FISO8601Processor.ResetToDefault;
    dfDMVCFramework:begin
      FISO8601Processor.ResetToDefault;
      FISO8601Processor.TimePrefix := ' ';
      FISO8601Processor.Seconds := True;
      FISO8601Processor.Millisec := False;
      FISO8601Processor.Zulu := '';
    end;
  end;
end;

procedure TdjParams.SetEmptyCharAsNull(const AValue: Boolean);
begin
  FEmptyCharAsNull := AValue;
end;

procedure TdjParams.SetEmptyStringAsNull(const AValue: Boolean);
begin
  FEmptyStringAsNull := AValue;
end;

procedure TdjParams.SetEnableCustomSerializers(const AValue: Boolean);
begin
 FEnableCustomSerializers := AValue;
end;

procedure TdjParams.SetEngine(const AValue: TdjEngine);
begin
  FEngineType := AValue;
  // Set the engine
  FEngineClass := TdjFactory.GetEngine(AValue);
end;

procedure TdjParams.SetIgnoredProperties(const AValue: TdjIgnoredProperties);
begin
  FIgnoredProperties := AValue;
end;

procedure TdjParams.SetIgnoreObjStatus(const AValue: Boolean);
begin
  FIgnoreObjStatus := AValue;
end;

procedure TdjParams.SetItemsKeyDefaultQualifiedName(const AValue: String);
begin
  FItemsKeyDefaultQualifiedName := AValue;
end;

procedure TdjParams.SetItemsKeyDefaultTypeInfo(const AValue: PTypeInfo);
begin
  FItemsKeyDefaultQualifiedName := TdjRTTI.TypeInfoToRttiType(AValue).QualifiedName;
end;

procedure TdjParams.SetItemsValueDefaultQualifiedName(const AValue: String);
begin
  FItemsValueDefaultQualifiedName := AValue;
end;

procedure TdjParams.SetItemsValueDefaultTypeInfo(const AValue: PTypeInfo);
begin
  FItemsValueDefaultQualifiedName := TdjRTTI.TypeInfoToRttiType(AValue).QualifiedName;
end;

procedure TdjParams.SetNameCase(const AValue: TdjNameCase);
begin
  FNameCase := AValue;
end;

procedure TdjParams.SetOwnJSONValue(const AValue: Boolean);
begin
  FOwnJSONValue := AValue;
end;

procedure TdjParams.SetPrettyPrint(const AValue: Boolean);
begin
  FPrettyPrint := AValue;
end;

procedure TdjParams.SetSerializationMode(const AValue: TdjSerializationMode);
begin
  FSerializationMode := AValue;
end;

procedure TdjParams.SetSerializationType(const AValue: TdjSerializationType);
begin
  FSerializationType := AValue;
end;

{ TdjSerializersContainerItem }

constructor TdjSerializersContainerItem.Create;
begin
  inherited Create;
  FDOMSerializer := nil;
//  FXMLSerializer := nil;
  FStreamSerializer := nil;
end;

{ TdjSerializersContainer }

constructor TdjSerializersContainer.Create;
begin
  inherited;
  FSerializersContainer := TObjectDictionary<String, TdjSerializersContainerItem>.Create([doOwnsValues]);
end;

destructor TdjSerializersContainer.Destroy;
begin
  FSerializersContainer.Free;
  inherited;
end;

function TdjSerializersContainer.Exists_DOM(const ATargetClass: TClass): Boolean;
begin
  Result := Self.Exists_DOM(ATargetClass.ClassInfo);
end;

function TdjSerializersContainer.Exists_DOM(
  const ATargetTypeInfo: PTypeInfo): Boolean;
begin
  Result := _Exists(ATargetTypeInfo) and Assigned(_GetSerializerItem(ATargetTypeInfo).DOMSerializer);
end;

function TdjSerializersContainer.Exists_DOM<T>: Boolean;
begin
  Result := Self.Exists_DOM(TypeInfo(T));
end;

function TdjSerializersContainer.Exists_Stream(
  const ATargetClass: TClass): Boolean;
begin
  Result := Self.Exists_Stream(ATargetClass.ClassInfo);
end;

function TdjSerializersContainer.Exists_Stream(
  const ATargetTypeInfo: PTypeInfo): Boolean;
begin
  Result := _Exists(ATargetTypeInfo) and Assigned(_GetSerializerItem(ATargetTypeInfo).StreamSerializer);
end;

function TdjSerializersContainer.Exists_Stream<T>: Boolean;
begin
  Result := Self.Exists_Stream(TypeInfo(T));
end;

//function TdjSerializersContainer.Exists_XML(
//  const ATargetClass: TClass): Boolean;
//begin
//  Result := Self.Exists_XML(ATargetClass.ClassInfo);
//end;

//function TdjSerializersContainer.Exists_XML(
//  const ATargetTypeInfo: PTypeInfo): Boolean;
//begin
//  Result := _Exists(ATargetTypeInfo) and Assigned(_GetSerializerItem(ATargetTypeInfo).XMLSerializer);
//end;

//function TdjSerializersContainer.Exists_XML<T>: Boolean;
//begin
//  Result := Self.Exists_XML(TypeInfo(T));
//end;

procedure TdjSerializersContainer.Register(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TdjDOMCustomSerializerRef);
begin
  Self._GetOrCreateSerializersContainerItem(ATargetTypeInfo).DOMSerializer := ASerializer;
end;

procedure TdjSerializersContainer.Register(const ATargetClass: TClass;
  const ASerializer: TdjDOMCustomSerializerRef);
begin
  Self.Register(ATargetClass.ClassInfo, ASerializer);
end;

procedure TdjSerializersContainer.Unregister(const ATargetTypeInfo: PTypeInfo);
begin
  FSerializersContainer.Remove(TdjRTTI.TypeInfoToQualifiedTypeName(ATargetTypeInfo));
end;

procedure TdjSerializersContainer.Unregister(const ATargetClass: TClass);
begin
  Self.Unregister(ATargetClass.ClassInfo);
end;

procedure TdjSerializersContainer.Unregister<T>;
begin
  Self.Unregister(TypeInfo(T));
end;

function TdjSerializersContainer._Exists(
  const ATargetTypeInfo: PTypeInfo): Boolean;
begin
  Result := FSerializersContainer.ContainsKey(TdjRTTI.TypeInfoToQualifiedTypeName(ATargetTypeInfo));
end;

function TdjSerializersContainer._GetOrCreateSerializersContainerItem(
  const ATargetTypeInfo: PTypeInfo): TdjSerializersContainerItem;
begin
  if not Self._Exists(ATargetTypeInfo) then
    FSerializersContainer.Add(TdjRTTI.TypeInfoToQualifiedTypeName(ATargetTypeInfo), TdjSerializersContainerItem.Create);
  Result := Self._GetSerializerItem(ATargetTypeInfo);
end;

function TdjSerializersContainer._GetSerializerItem(
  const ATargetTypeInfo:PTypeInfo): TdjSerializersContainerItem;
begin
  Result := FSerializersContainer.Items[TdjRTTI.TypeInfoToQualifiedTypeName(ATargetTypeInfo)];
end;

//procedure TdjSerializersContainer.Register(const ATargetTypeInfo: PTypeInfo;
//  const ASerializer: TdjXMLCustomSerializerRef);
//begin
//  Self._GetOrCreateSerializersContainerItem(ATargetTypeInfo).XMLSerializer := ASerializer;
//end;

procedure TdjSerializersContainer.Register(const ATargetClass: TClass;
  const ASerializer: TdjStreamCustomSerializerRef);
begin
  Self.Register(ATargetClass.ClassInfo, ASerializer);
end;

//procedure TdjSerializersContainer.Register<Target>(
//  const ASerializer: TdjXMLCustomSerializerRef);
//begin
//  Self.Register(TypeInfo(Target), ASerializer);
//end;

procedure TdjSerializersContainer.Register<Target>(
  const ASerializer: TdjStreamCustomSerializerRef);
begin
  Self.Register(TypeInfo(Target), ASerializer);
end;

procedure TdjSerializersContainer.Register<Target>(
  const ASerializer: TdjDOMCustomSerializerRef);
begin
  Self.Register(TypeInfo(Target), ASerializer);
end;

procedure TdjSerializersContainer.Register(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TdjStreamCustomSerializerRef);
begin
  Self._GetOrCreateSerializersContainerItem(ATargetTypeInfo).StreamSerializer := ASerializer;
end;

//procedure TdjSerializersContainer.Register(const ATargetClass: TClass;
//  const ASerializer: TdjXMLCustomSerializerRef);
//begin
//  Self.Register(ATargetClass.ClassInfo, ASerializer);
//end;

{ TdjPropInfoCache }

constructor TdjPropInfoCache.Create;
begin
  inherited;
  FPropInfoCollection := TDictionary<Pointer,PPropInfo>.Create;
end;

destructor TdjPropInfoCache.Destroy;
begin
  FPropInfoCollection.Free;
  inherited;
end;

function TdjPropInfoCache.GetPropInfo(const AProperty: TRttiNamedObject): PPropInfo;
begin
  if not FPropInfoCollection.ContainsKey(AProperty) then
    FPropInfoCollection.Add(AProperty, TRttiInstanceProperty(AProperty).PropInfo);
  Result := FPropInfoCollection.Items[AProperty];
end;

end.

