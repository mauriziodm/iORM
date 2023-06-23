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
unit DJSON;

interface

uses
  DJSON.Params, System.Rtti, System.JSON, System.TypInfo, DJSON.Serializers,
  System.SysUtils, System.Classes;

type

  TdjValueDestination = class;
  TdjJSONDestination  = class;
  TdjBSONDestination  = class;

  dj = class
  public
    // Parameters
    class function Default: IdjParams;
    class function DefaultByProperty: IdjParams;
    class function DefaultByFields: IdjParams;
    // Froms
    class function From(const AValue:TValue; const AParams:IdjParams=nil): TdjValueDestination; overload;
    class function From(const AObject:TObject; const AParams:IdjParams=nil): TdjValueDestination; overload;
    class function From(const AInterface:IInterface; const AParams:IdjParams=nil): TdjValueDestination; overload;
    class function From(const APointer: Pointer; const ATypeInfo: PTypeInfo; const AParams:IdjParams=nil): TdjValueDestination; overload;
    class function From<T>(const APointer: Pointer; const AParams:IdjParams=nil): TdjValueDestination; overload;
    class function FromJson(const AJSONText:String; const AParams:IdjParams=nil): TdjJSONDestination; overload;
    class function FromJson(const AJSONValue:TJSONValue; const AParams:IdjParams=nil): TdjJSONDestination; overload;
    class function FromBson(const ABytesStream:TStream; const AParams:IdjParams=nil): TdjBSONDestination; overload;
    class function FromBson(const ABytes:TBytes; const AParams:IdjParams=nil): TdjBSONDestination; overload;
    // Other
    class function Pretty(const AJSONText: String): String;
  end;

  TdjValueDestination = class
  strict private
    FValue: TValue;
    FParams: IdjParams;
  public
    constructor Create(const AValue: TValue; const AParams:IdjParams);
    // Destinations
    function ToJson: String;
    function ToJsonValue: TJSONValue;
    function ToBsonAsStream: TBytesStream;
    function ToBsonAsBytes: TBytes;
    // Params
    function Params(const AParams:IdjParams): TdjValueDestination;
    function IgnoreObjStatus: TdjValueDestination;
    function ItemsOfType(const AValueType: PTypeInfo): TdjValueDestination; overload;
    function ItemsOfType(const AKeyType, AValueType: PTypeInfo): TdjValueDestination; overload;
    function ItemsOfType<Value>: TdjValueDestination; overload;
    function ItemsOfType<Key,Value>: TdjValueDestination; overload;
    function JavaScriptMode: TdjValueDestination;
    function DataContractMode: TdjValueDestination;
    function PrettyPrint: TdjValueDestination;
    function byProperties: TdjValueDestination;
    function byFields: TdjValueDestination;
    function TypeAnnotationsON: TdjValueDestination;
    function TypeAnnotationsOFF: TdjValueDestination;
    function TypeInfoCacheON: TdjValueDestination;
    function TypeInfoCacheOFF: TdjValueDestination;
    function CustomSerializersON: TdjValueDestination;
    function CustomSerializersOFF: TdjValueDestination;
    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjDOMCustomSerializerRef): TdjValueDestination; overload;
//    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjXMLCustomSerializerRef): TdjValueDestination; overload;
    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjStreamCustomSerializerRef): TdjValueDestination; overload;
    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TdjDOMCustomSerializerRef): TdjValueDestination; overload;
//    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TdjXMLCustomSerializerRef): TdjValueDestination; overload;
    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TdjStreamCustomSerializerRef): TdjValueDestination; overload;
    function CustomSerializer<Target>(const ASerializer:TdjDOMCustomSerializerRef): TdjValueDestination; overload;
//    function CustomSerializer<Target>(const ASerializer:TdjXMLCustomSerializerRef): TdjValueDestination; overload;
    function CustomSerializer<Target>(const ASerializer:TdjStreamCustomSerializerRef): TdjValueDestination; overload;
    function UpperCase: TdjValueDestination;
    function LowerCase: TdjValueDestination;
    function Engine(const AEngine:TdjEngine): TdjValueDestination;
    function BsonRootOFF: TdjValueDestination;
    function BsonRootLabel(const AValue:String): TdjValueDestination;
    function EmptyStringAsNull: TdjValueDestination;
    function EmptyCharAsNull: TdjValueDestination;
    function DateTimeFormat(const ADateTimeFormat:TdjDateTimeFormat): TdjValueDestination;
    function DateSeparator(const AValue:String): TdjValueDestination;
    function TimeUTC(const AValue:Boolean): TdjValueDestination;
    function TimePrefix(const AValue:String): TdjValueDestination;
    function TimeSeparator(const AValue:String): TdjValueDestination;
    function TimeMillisecSeparator(const AValue:String): TdjValueDestination;
    function TimeZulu(const AValue:String): TdjValueDestination;
    function TimeSeconds(const AValue:Boolean): TdjValueDestination;
    function TimeMillisec(const AValue:Boolean): TdjValueDestination;
    function TimezonePrefix(const AValue:String): TdjValueDestination;
    function TimezoneSeparator(const AValue:String): TdjValueDestination;
    function TimeZoneIgnore(const AValue:Boolean): TdjValueDestination;
  end;

  TdjJSONDestination = class
  strict private
    FJSONText: String;
  strict protected
    FParams: IdjParams;
  public
    constructor Create(const AJSONText:String; const AParams:IdjParams);
    // Destinations
    function ToValue(const ATypeInfo:PTypeInfo): TValue; virtual;
    function ToObject: TObject; virtual;
    function &To<T>: T; overload;
    procedure &To(const AObject: TObject); overload;
    procedure &To(const AInterface: IInterface); overload;
    // Params
    function Params(const AParams:IdjParams): TdjJSONDestination;
    function IgnoreObjStatus: TdjJSONDestination;
    function ItemsOfType(const AValueType: PTypeInfo): TdjJSONDestination; overload;
    function ItemsOfType(const AKeyType, AValueType: PTypeInfo): TdjJSONDestination; overload;
    function ItemsOfType<Value>: TdjJSONDestination; overload;
    function ItemsOfType<Key,Value>: TdjJSONDestination; overload;
    function JavaScriptMode: TdjJSONDestination;
    function DataContractMode: TdjJSONDestination;
    function byProperties: TdjJSONDestination;
    function byFields: TdjJSONDestination;
    function ClearCollection: TdjJSONDestination;
    function TypeAnnotationsON: TdjJSONDestination;
    function TypeAnnotationsOFF: TdjJSONDestination;
    function TypeInfoCacheON: TdjJSONDestination;
    function TypeInfoCacheOFF: TdjJSONDestination;
    function CustomSerializersON: TdjJSONDestination;
    function CustomSerializersOFF: TdjJSONDestination;
    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjDOMCustomSerializerRef): TdjJSONDestination; overload;
//    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjXMLCustomSerializerRef): TdjJSONDestination; overload;
    function CustomSerializer(const ATargetTypeInfo:PTypeInfo; const ASerializer:TdjStreamCustomSerializerRef): TdjJSONDestination; overload;
    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TdjDOMCustomSerializerRef): TdjJSONDestination; overload;
//    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TdjXMLCustomSerializerRef): TdjJSONDestination; overload;
    function CustomSerializer(const ATargetClass:TClass; const ASerializer:TdjStreamCustomSerializerRef): TdjJSONDestination; overload;
    function CustomSerializer<Target>(const ASerializer:TdjDOMCustomSerializerRef): TdjJSONDestination; overload;
//    function CustomSerializer<Target>(const ASerializer:TdjXMLCustomSerializerRef): TdjJSONDestination; overload;
    function CustomSerializer<Target>(const ASerializer:TdjStreamCustomSerializerRef): TdjJSONDestination; overload;
    function Engine(const AEngine:TdjEngine): TdjJSONDestination;
    function EmptyStringAsNull: TdjJSONDestination;
    function EmptyCharAsNull: TdjJSONDestination;

    function DateTimeFormat(const ADateTimeFormat:TdjDateTimeFormat): TdjJSONDestination;
    function DateSeparator(const AValue:String): TdjJSONDestination;
    function TimeUTC(const AValue:Boolean): TdjJSONDestination;
    function TimePrefix(const AValue:String): TdjJSONDestination;
    function TimeSeparator(const AValue:String): TdjJSONDestination;
    function TimeMillisecSeparator(const AValue:String): TdjJSONDestination;
    function TimeZulu(const AValue:String): TdjJSONDestination;
    function TimeSeconds(const AValue:Boolean): TdjJSONDestination;
    function TimeMillisec(const AValue:Boolean): TdjJSONDestination;
    function TimezonePrefix(const AValue:String): TdjJSONDestination;
    function TimezoneSeparator(const AValue:String): TdjJSONDestination;
    function TimeZoneIgnore(const AValue:Boolean): TdjJSONDestination;
  end;

  TdjBSONDestination = class(TdjJSONDestination)
  strict private
    FBytesStream: TStream;
    FOwnStream: Boolean;
  public
    constructor Create(const ABytesStream:TStream; const AParams:IdjParams); overload;
    constructor Create(const ABytes:TBytes; const AParams:IdjParams); overload;
    destructor Destroy; override;
    // Destinations
    function ToValue(const ATypeInfo:PTypeInfo): TValue; override;
    function ToObject: TObject; override;
    procedure &To(const AObject: TObject); overload;
    // Params
    function BsonRootOFF: TdjBSONDestination;
    function BsonRootLabel(const AValue:String): TdjBSONDestination;
  end;

implementation

uses
  DJSON.Factory, DJSON.Utils.RTTI, DJSON.Engine.DOM, DJSON.Constants, DJSON.Exceptions,
  DJSON.Engine.Stream, DJSON.Engine.Stream.BSON, DJSON.Utils;

{ dj }

class function dj.Default: IdjParams;
begin
  Result := DefaultByProperty;
end;

class function dj.DefaultByFields: IdjParams;
begin
  Result := TdjFactory.NewParams;
  Result.SerializationMode := smJavaScript;
  Result.SerializationType := stFields;
  Result.TypeAnnotations := False;
end;

class function dj.DefaultByProperty: IdjParams;
begin
  Result := TdjFactory.NewParams;
  Result.SerializationMode := smJavaScript;
  Result.SerializationType := stProperties;
  Result.TypeAnnotations := False;
end;

class function dj.From(const AValue: TValue;
  const AParams: IdjParams): TdjValueDestination;
begin
  Result := TdjValueDestination.Create(AValue, AParams);
end;

class function dj.From(const AObject: TObject;
  const AParams: IdjParams): TdjValueDestination;
var
  LValue: TValue;
begin
  TValue.Make(@AObject, AObject.ClassInfo, LValue);
  Result := Self.From(LValue, AParams);
end;

class function dj.From(const AInterface: IInterface;
  const AParams: IdjParams): TdjValueDestination;
begin
  Result := Self.From(AInterface as TObject, AParams);
end;

class function dj.FromBson(const ABytesStream: TStream;
  const AParams: IdjParams): TdjBSONDestination;
begin
  Result := TdjBSONDestination.Create(ABytesStream, AParams);
end;

class function dj.FromBson(const ABytes: TBytes;
  const AParams: IdjParams): TdjBSONDestination;
begin
  Result := TdjBSONDestination.Create(ABytes, AParams);
end;

class function dj.FromJson(const AJSONValue: TJSONValue; const AParams: IdjParams): TdjJSONDestination;
begin
  Result := TdjJSONDestination.Create(AJSONValue.ToJSON, AParams);
end;

class function dj.FromJson(const AJSONText: String;
  const AParams: IdjParams): TdjJSONDestination;
begin
  Result := TdjJSONDestination.Create(AJSONText, AParams);
end;

class function dj.Pretty(const AJSONText: String): String;
begin
  Result := TdjUtils.Pretty(AJSONText);
end;

class function dj.From(const APointer: Pointer;
  const ATypeInfo: PTypeInfo; const AParams:IdjParams): TdjValueDestination;
var
  LValue: TValue;
begin
  TValue.Make(APointer, ATypeInfo, LValue);
  Result := Self.From(LValue, AParams);
end;

class function dj.From<T>(const APointer: Pointer;
  const AParams: IdjParams): TdjValueDestination;
begin
  Result := Self.From(APointer, TypeInfo(T), AParams);
end;

{ TdjJSONDestination }

procedure TdjJSONDestination.&To(const AObject: TObject);
var
  LRttiType: TRttiType;
begin
  try
    LRttiType := TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo);
    FParams.GetEngineClass.Deserialize(FJSONText, LRttiType, nil, AObject, FParams);
  finally
    Self.Free;
  end;
end;

function TdjJSONDestination.TimeMillisec(
  const AValue: Boolean): TdjJSONDestination;
begin
  FParams.TimeMillisec := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimeMillisecSeparator(
  const AValue: String): TdjJSONDestination;
begin
  FParams.TimeMillisecSeparator := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimePrefix(
  const AValue: String): TdjJSONDestination;
begin
  FParams.TimePrefix := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimeSeconds(
  const AValue: Boolean): TdjJSONDestination;
begin
  FParams.TimeSeconds := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimeSeparator(
  const AValue: String): TdjJSONDestination;
begin
  FParams.TimeSeparator := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimeUTC(const AValue: Boolean): TdjJSONDestination;
begin
  FParams.TimeUTC := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimeZoneIgnore(
  const AValue: Boolean): TdjJSONDestination;
begin
  FParams.TimezoneIgnore := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimezonePrefix(
  const AValue: String): TdjJSONDestination;
begin
  FParams.TimezonePrefix := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimezoneSeparator(
  const AValue: String): TdjJSONDestination;
begin
  FParams.TimezoneSeparator := AValue;
  Result := Self;
end;

function TdjJSONDestination.TimeZulu(const AValue: String): TdjJSONDestination;
begin
  FParams.TimeZulu := AValue;
  Result := Self;
end;

procedure TdjJSONDestination.&To(const AInterface: IInterface);
begin
  Self.&To(AInterface as TObject);
end;

function TdjJSONDestination.byFields: TdjJSONDestination;
begin
  FParams.SerializationType := stFields;
  Result := Self;
end;

function TdjJSONDestination.byProperties: TdjJSONDestination;
begin
  FParams.SerializationType := stProperties;
  Result := Self;
end;

function TdjJSONDestination.ClearCollection: TdjJSONDestination;
begin
  FParams.ClearCollection := True;
  Result := Self;
end;

constructor TdjJSONDestination.Create(const AJSONText:String; const AParams:IdjParams);
begin
  inherited Create;
  FJSONText := AJSONText;
  if Assigned(AParams) then
    FParams := AParams
  else
    FParams := dj.Default;
end;

function TdjJSONDestination.ToValue(const ATypeInfo: PTypeInfo): TValue;
var
  LRttiType: TRttiType;
  LMaster: TValue;
begin
  try
    LRttiType := TdjRTTI.TypeInfoToRttiType(ATypeInfo);
    TValue.Make(nil, ATypeInfo, LMaster);
    Result := FParams.GetEngineClass.Deserialize(FJSONText, LRttiType, nil, LMaster, FParams);
  finally
    Self.Free;
  end;
end;

function TdjJSONDestination.TypeAnnotationsOFF: TdjJSONDestination;
begin
  FParams.TypeAnnotations := False;
  Result := Self;
end;

function TdjJSONDestination.TypeAnnotationsON: TdjJSONDestination;
begin
  FParams.TypeAnnotations := True;
  Result := Self;
end;

function TdjJSONDestination.TypeInfoCacheOFF: TdjJSONDestination;
begin
  FParams.TypeInfoCache.Enabled := False;
  Result := Self;
end;

function TdjJSONDestination.TypeInfoCacheON: TdjJSONDestination;
begin
  FParams.TypeInfoCache.Enabled := True;
  Result := Self;
end;

function TdjJSONDestination.ItemsOfType(
  const AValueType: PTypeInfo): TdjJSONDestination;
begin
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TdjJSONDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TdjDOMCustomSerializerRef): TdjJSONDestination;
begin
  FParams.Serializers.Register(ATargetTypeInfo, ASerializer);
  Result := Self;
end;

function TdjJSONDestination.CustomSerializer(const ATargetClass: TClass;
  const ASerializer: TdjDOMCustomSerializerRef): TdjJSONDestination;
begin
  FParams.Serializers.Register(ATargetClass, ASerializer);
  Result := Self;
end;

function TdjJSONDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TdjStreamCustomSerializerRef): TdjJSONDestination;
begin
  FParams.Serializers.Register(ATargetTypeInfo, ASerializer);
  Result := Self;
end;

//function TdjJSONDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
//  const ASerializer: TdjXMLCustomSerializerRef): TdjJSONDestination;
//begin
//  FParams.Serializers.Register(ATargetTypeInfo, ASerializer);
//  Result := Self;
//end;

function TdjJSONDestination.CustomSerializer(const ATargetClass: TClass;
  const ASerializer: TdjStreamCustomSerializerRef): TdjJSONDestination;
begin
  FParams.Serializers.Register(ATargetClass, ASerializer);
  Result := Self;
end;

function TdjJSONDestination.CustomSerializer<Target>(
  const ASerializer: TdjDOMCustomSerializerRef): TdjJSONDestination;
begin
  FParams.Serializers.Register<Target>(ASerializer);
  Result := Self;
end;

function TdjJSONDestination.CustomSerializer<Target>(
  const ASerializer: TdjStreamCustomSerializerRef): TdjJSONDestination;
begin
  FParams.Serializers.Register<Target>(ASerializer);
  Result := Self;
end;

//function TdjJSONDestination.CustomSerializer<Target>(
//  const ASerializer: TdjXMLCustomSerializerRef): TdjJSONDestination;
//begin
//  FParams.Serializers.Register<Target>(ASerializer);
//  Result := Self;
//end;

//function TdjJSONDestination.CustomSerializer(const ATargetClass: TClass;
//  const ASerializer: TdjXMLCustomSerializerRef): TdjJSONDestination;
//begin
//  FParams.Serializers.Register(ATargetClass, ASerializer);
//  Result := Self;
//end;

function TdjJSONDestination.CustomSerializersOFF: TdjJSONDestination;
begin
  FParams.EnableCustomSerializers := False;
  Result := Self;
end;

function TdjJSONDestination.CustomSerializersON: TdjJSONDestination;
begin
  FParams.EnableCustomSerializers := True;
  Result := Self;
end;

function TdjJSONDestination.DataContractMode: TdjJSONDestination;
begin
  FParams.SerializationMode := smDataContract;
  Result := Self;
end;

function TdjJSONDestination.DateSeparator(
  const AValue: String): TdjJSONDestination;
begin
  FParams.DateSeparator := AValue;
  Result := Self;
end;

function TdjJSONDestination.DateTimeFormat(
  const ADateTimeFormat: TdjDateTimeFormat): TdjJSONDestination;
begin
  FParams.DateTimeFormat := ADateTimeFormat;
  Result := Self;
end;

function TdjJSONDestination.EmptyCharAsNull: TdjJSONDestination;
begin
  FParams.EmptyCharAsNull := True;
  Result := Self;
end;

function TdjJSONDestination.EmptyStringAsNull: TdjJSONDestination;
begin
  FParams.EmptyStringAsNull := True;
  Result := Self;
end;

function TdjJSONDestination.Engine(
  const AEngine: TdjEngine): TdjJSONDestination;
begin
  FParams.Engine := AEngine;
  Result := Self;
end;

function TdjJSONDestination.IgnoreObjStatus: TdjJSONDestination;
begin
  FParams.IgnoreObjStatus := True;
  Result := Self;
end;

function TdjJSONDestination.ItemsOfType(const AKeyType,
  AValueType: PTypeInfo): TdjJSONDestination;
begin
  FParams.ItemsKeyDefaultTypeInfo := AKeyType;
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TdjJSONDestination.ItemsOfType<Key, Value>: TdjJSONDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Key), TypeInfo(Value));
end;

function TdjJSONDestination.ItemsOfType<Value>: TdjJSONDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Value));
end;

function TdjJSONDestination.JavaScriptMode: TdjJSONDestination;
begin
  FParams.SerializationMode := smJavaScript;
  Result := Self;
end;

function TdjJSONDestination.Params(
  const AParams: IdjParams): TdjJSONDestination;
begin
  Self.FParams := AParams;
  Result := Self;
end;

function TdjJSONDestination.&To<T>: T;
begin
  Result := Self.ToValue(TypeInfo(T)).AsType<T>;
end;

function TdjJSONDestination.ToObject: TObject;
var
  ResultValue: TValue;
begin
  try
//    Result := nil;  NB: Hint prevention
    ResultValue := FParams.GetEngineClass.Deserialize(FJSONText, nil, nil, nil, FParams);
    Result := ResultValue.AsObject;
  finally
    Self.Free;
  end;
end;

{ TdjValueDestination }

function TdjValueDestination.BsonRootLabel(
  const AValue: String): TdjValueDestination;
begin
  FParams.BsonRootLabel := AValue;
  Result := Self;
end;

function TdjValueDestination.BsonRootOFF: TdjValueDestination;
begin
  FParams.BsonRoot := False;
  Result := Self;
end;

function TdjValueDestination.byFields: TdjValueDestination;
begin
  FParams.SerializationType := stFields;
  Result := Self;
end;

function TdjValueDestination.byProperties: TdjValueDestination;
begin
  FParams.SerializationType := stProperties;
  Result := Self;
end;

constructor TdjValueDestination.Create(const AValue: TValue;
  const AParams: IdjParams);
begin
  inherited Create;
  FValue := AValue;
  if Assigned(AParams) then
    FParams := AParams
  else
    FParams := dj.Default;
end;

function TdjValueDestination.CustomSerializer(const ATargetClass: TClass;
  const ASerializer: TdjDOMCustomSerializerRef): TdjValueDestination;
begin
  FParams.Serializers.Register(ATargetClass, ASerializer);
  Result := Self;
end;

function TdjValueDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TdjDOMCustomSerializerRef): TdjValueDestination;
begin
  FParams.Serializers.Register(ATargetTypeInfo, ASerializer);
  Result := Self;
end;

//function TdjValueDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
//  const ASerializer: TdjXMLCustomSerializerRef): TdjValueDestination;
//begin
//  FParams.Serializers.Register(ATargetTypeInfo, ASerializer);
//  Result := Self;
//end;

function TdjValueDestination.CustomSerializer(const ATargetTypeInfo: PTypeInfo;
  const ASerializer: TdjStreamCustomSerializerRef): TdjValueDestination;
begin
  FParams.Serializers.Register(ATargetTypeInfo, ASerializer);
  Result := Self;
end;

function TdjValueDestination.CustomSerializersOFF: TdjValueDestination;
begin
  FParams.EnableCustomSerializers := False;
  Result := Self;
end;

function TdjValueDestination.CustomSerializersON: TdjValueDestination;
begin
  FParams.EnableCustomSerializers := True;
  Result := Self;
end;

function TdjValueDestination.DataContractMode: TdjValueDestination;
begin
  FParams.SerializationMode := smDataContract;
  Result := Self;
end;

function TdjValueDestination.DateSeparator(
  const AValue: String): TdjValueDestination;
begin
  FParams.DateSeparator := AValue;
  Result := Self;
end;

function TdjValueDestination.DateTimeFormat(
  const ADateTimeFormat: TdjDateTimeFormat): TdjValueDestination;
begin
  FParams.DateTimeFormat := ADateTimeFormat;
  Result := Self;
end;

function TdjValueDestination.EmptyCharAsNull: TdjValueDestination;
begin
  FParams.EmptyCharAsNull := True;
  Result := Self;
end;

function TdjValueDestination.EmptyStringAsNull: TdjValueDestination;
begin
  FParams.EmptyStringAsNull := True;
  Result := Self;
end;

function TdjValueDestination.Engine(
  const AEngine: TdjEngine): TdjValueDestination;
begin
  FParams.Engine := AEngine;
  Result := Self;
end;

function TdjValueDestination.ItemsOfType(
  const AValueType: PTypeInfo): TdjValueDestination;
begin
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TdjValueDestination.IgnoreObjStatus: TdjValueDestination;
begin
  FParams.IgnoreObjStatus := True;
  Result := Self;
end;

function TdjValueDestination.ItemsOfType(const AKeyType,
  AValueType: PTypeInfo): TdjValueDestination;
begin
  FParams.ItemsKeyDefaultTypeInfo := AKeyType;
  FParams.ItemsValueDefaultTypeInfo := AValueType;
  Result := Self;
end;

function TdjValueDestination.ItemsOfType<Key, Value>: TdjValueDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Key), TypeInfo(Value));
end;

function TdjValueDestination.ItemsOfType<Value>: TdjValueDestination;
begin
  Result := Self.ItemsOfType(TypeInfo(Value));
end;

function TdjValueDestination.JavaScriptMode: TdjValueDestination;
begin
  FParams.SerializationMode := smJavaScript;
  Result := Self;
end;

function TdjValueDestination.LowerCase: TdjValueDestination;
begin
  Self.FParams.NameCase := TdjNameCase.ncLowerCase;
  Result := Self;
end;

function TdjValueDestination.Params(
  const AParams: IdjParams): TdjValueDestination;
begin
  Self.FParams := AParams;
  Result := Self;
end;

function TdjValueDestination.PrettyPrint: TdjValueDestination;
begin
  Self.FParams.PrettyPrint := True;
  Result := Self;
end;

function TdjValueDestination.TimeMillisec(
  const AValue: Boolean): TdjValueDestination;
begin
  FParams.TimeMillisec := AValue;
  Result := Self;
end;

function TdjValueDestination.TimeMillisecSeparator(
  const AValue: String): TdjValueDestination;
begin
  FParams.TimeMillisecSeparator := AValue;
  Result := Self;
end;

function TdjValueDestination.TimePrefix(
  const AValue: String): TdjValueDestination;
begin
  FParams.TimePrefix := AValue;
  Result := Self;
end;

function TdjValueDestination.TimeSeconds(
  const AValue: Boolean): TdjValueDestination;
begin
  FParams.TimeSeconds := AValue;
  Result := Self;
end;

function TdjValueDestination.TimeSeparator(
  const AValue: String): TdjValueDestination;
begin
  FParams.TimeSeparator := AValue;
  Result := Self;
end;

function TdjValueDestination.TimeUTC(
  const AValue: Boolean): TdjValueDestination;
begin
  FParams.TimeUTC := AValue;
  Result := Self;
end;

function TdjValueDestination.TimeZoneIgnore(
  const AValue: Boolean): TdjValueDestination;
begin
  FParams.TimezoneIgnore := AValue;
  Result := Self;
end;

function TdjValueDestination.TimezonePrefix(
  const AValue: String): TdjValueDestination;
begin
  FParams.TimezonePrefix := AValue;
  Result := Self;
end;

function TdjValueDestination.TimezoneSeparator(
  const AValue: String): TdjValueDestination;
begin
  FParams.TimezoneSeparator := AValue;
  Result := Self;
end;

function TdjValueDestination.TimeZulu(
  const AValue: String): TdjValueDestination;
begin
  FParams.TimeZulu := AValue;
  Result := Self;
end;

function TdjValueDestination.ToBsonAsBytes: TBytes;
var
  LBytesStream: TBytesStream;
begin
  LBytesStream := Self.ToBsonAsStream;
  try
    LBytesStream.Position := 0;
    Result := LBytesStream.Bytes;
    SetLength(Result, LBytesStream.Size);
  finally
    LBytesStream.Free;
  end;
end;

function TdjValueDestination.ToBsonAsStream: TBytesStream;
begin
  try
    Result := TdjEngineStreamBSON.Serialize(FValue, nil, FParams);
  finally
    Self.Free;
  end;
end;

function TdjValueDestination.ToJSON: String;
begin
  try
    Result := FParams.GetEngineClass.Serialize(FValue, nil, FParams);
  finally
    Self.Free;
  end;
end;

function TdjValueDestination.ToJsonValue: TJSONValue;
begin
  try
    // Note: this is compatible only with TdjEngineDOM
    Result := TdjEngineDOM.SerializeToJsonValue(FValue, nil, FParams);
  finally
    Self.Free;
  end;
end;

function TdjValueDestination.TypeAnnotationsOFF: TdjValueDestination;
begin
  FParams.TypeAnnotations := False;
  Result := Self;
end;

function TdjValueDestination.TypeAnnotationsON: TdjValueDestination;
begin
  FParams.TypeAnnotations := True;
  Result := Self;
end;

function TdjValueDestination.TypeInfoCacheOFF: TdjValueDestination;
begin
  FParams.TypeInfoCache.Enabled := False;
  Result := Self;
end;

function TdjValueDestination.TypeInfoCacheON: TdjValueDestination;
begin
  FParams.TypeInfoCache.Enabled := True;
  Result := Self;
end;

function TdjValueDestination.UpperCase: TdjValueDestination;
begin
  Self.FParams.NameCase := TdjNameCase.ncUpperCase;
  Result := Self;
end;

//function TdjValueDestination.CustomSerializer(const ATargetClass: TClass;
//  const ASerializer: TdjXMLCustomSerializerRef): TdjValueDestination;
//begin
//  FParams.Serializers.Register(ATargetClass, ASerializer);
//  Result := Self;
//end;

function TdjValueDestination.CustomSerializer(const ATargetClass: TClass;
  const ASerializer: TdjStreamCustomSerializerRef): TdjValueDestination;
begin
  FParams.Serializers.Register(ATargetClass, ASerializer);
  Result := Self;
end;

function TdjValueDestination.CustomSerializer<Target>(
  const ASerializer: TdjDOMCustomSerializerRef): TdjValueDestination;
begin
  FParams.Serializers.Register<Target>(ASerializer);
  Result := Self;
end;

function TdjValueDestination.CustomSerializer<Target>(
  const ASerializer: TdjStreamCustomSerializerRef): TdjValueDestination;
begin
  FParams.Serializers.Register<Target>(ASerializer);
  Result := Self;
end;

//function TdjValueDestination.CustomSerializer<Target>(
//  const ASerializer: TdjXMLCustomSerializerRef): TdjValueDestination;
//begin
//  FParams.Serializers.Register<Target>(ASerializer);
//  Result := Self;
//end;

{ TdjBSONDestination }

constructor TdjBSONDestination.Create(const ABytesStream: TStream;
  const AParams: IdjParams);
begin
  inherited Create('', AParams);
  FBytesStream := ABytesStream;
  FOwnStream := False;
end;

procedure TdjBSONDestination.&To(const AObject: TObject);
var
  LRttiType: TRttiType;
begin
  try
    LRttiType := TdjRTTI.TypeInfoToRttiType(AObject.ClassInfo);
    TdjEngineStreamBSON.Deserialize(FBytesStream, LRttiType, nil, AObject, FParams);
  finally
    Self.Free;
  end;
end;

function TdjBSONDestination.BsonRootLabel(
  const AValue: String): TdjBSONDestination;
begin
  FParams.BsonRootLabel := AValue;
  Result := Self;
end;

function TdjBSONDestination.BsonRootOFF: TdjBSONDestination;
begin
  FParams.BsonRoot := False;
  Result := Self;
end;

constructor TdjBSONDestination.Create(const ABytes: TBytes;
  const AParams: IdjParams);
begin
  inherited Create('', AParams);
  FBytesStream := TBytesStream.Create(ABytes);
  FOwnStream := True;
end;

destructor TdjBSONDestination.Destroy;
begin
  if FOwnStream and Assigned(FBytesStream) then
    FBytesStream.Free;
  inherited;
end;

function TdjBSONDestination.ToObject: TObject;
var
  ResultValue: TValue;
begin
  try
//    Result := nil;  NB: Hint prevention
    ResultValue := TdjEngineStreamBSON.Deserialize(FBytesStream, nil, nil, nil, FParams);
    Result := ResultValue.AsObject;
  finally
    Self.Free;
  end;
end;

function TdjBSONDestination.ToValue(const ATypeInfo: PTypeInfo): TValue;
var
  LRttiType: TRttiType;
  LMaster: TValue;
begin
  try
    LRttiType := TdjRTTI.TypeInfoToRttiType(ATypeInfo);
    TValue.Make(nil, ATypeInfo, LMaster);
    Result := TdjEngineStreamBSON.Deserialize(FBytesStream, LRttiType, nil, LMaster, FParams);
  finally
    Self.Free;
  end;
end;

end.
