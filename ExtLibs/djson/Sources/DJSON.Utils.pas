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





unit DJSON.Utils;

interface

uses
  System.Rtti,
  System.SysUtils,
  DJSON.Params,
  DJSON.Duck.PropField;

type
  TdjUtils = class
  public
    class function IsPropertyToBeIgnored(const APropField: TRttiNamedObject; const AParams: IdjParams): Boolean; static;
    class function GetKeyName(const ARttiMember: TRttiNamedObject; const AParams:IdjParams): string; static;
    class function Bytes2String(const ABytes: TBytes): String;
    class procedure GetTypeNameIfEmpty(const APropField: TRttiNamedObject; const AParams:IdjParams; var ATypeName: String); static;
    class procedure GetItemsTypeNameIfEmpty(const APropField: TRttiNamedObject; const AParams:IdjParams; var AValueTypeName: String); overload; static;
    class procedure GetItemsTypeNameIfEmpty(const APropField: TRttiNamedObject; const AParams:IdjParams; var AKeyTypeName, AValueTypeName: String); overload; static;

    class function ISODateTimeToString(const ADateTime:TDateTime; const AParams:IdjParams): string;
    class function ISODateToString(const ADate:TDateTime; const AParams:IdjParams): string;
    class function ISOTimeToString(const ATime:TTime; const AParams:IdjParams): string;

    class function ISOStrToDateTime(const DateTimeAsString:string; const AParams:IdjParams): TDateTime;
    class function ISOStrToDate(const DateAsString:string; const AParams:IdjParams): TDate;
    class function ISOStrToTime(const TimeAsString:string; const AParams:IdjParams): TTime;

    class function Pretty(const AJSON: String): String;
  end;

implementation

uses
  System.DateUtils,
  System.TypInfo,
  DJSON.Attributes,
  DJSON.Utils.RTTI, System.JSON, REST.Json;

{ TdjUtils }

class procedure TdjUtils.GetItemsTypeNameIfEmpty(
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  var AValueTypeName: String);
var
  LKeyTypeNameDummy: String;
begin
  LKeyTypeNameDummy := 'DummyKeyTypeName';
  GetItemsTypeNameIfEmpty(APropField, AParams, LKeyTypeNameDummy, AValueTypeName);
end;

class function TdjUtils.Bytes2String(const ABytes: TBytes): String;
var
  I: Integer;
  Sep: String;
begin
  Result := EmptyStr;
  Sep := EmptyStr;
  for I:=low(ABytes) to high(ABytes) do
  begin
    Result := Result + Sep + IntToHex(ABytes[I], 2);
    if I=0 then Sep := '-';
  end;
end;

class procedure TdjUtils.GetItemsTypeNameIfEmpty(
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  var AKeyTypeName, AValueTypeName: String);
var
  LdjsonItemsTypeAttribute: djItemsTypeAttribute;
begin
  // init
  LdjsonItemsTypeAttribute := nil;
  // Only if needed
  if not (AKeyTypeName.IsEmpty or AValueTypeName.IsEmpty) then
    Exit;
  // Get the attribute if exists (On the property or in the RttiType)
  if not TdjRTTI.HasAttribute<djItemsTypeAttribute>(APropField, LdjsonItemsTypeAttribute) then
    TdjRTTI.HasAttribute<djItemsTypeAttribute>(TdjDuckPropField.RttiType(APropField), LdjsonItemsTypeAttribute);
  // If the KeyType received as parameter is empty then get the type from
  //  the attribute and if also the attribute key type name is empty then
  //  get the default specified in the params
  //  NB: Solo se APropField non è assegnato (lista deserializzata direttamente e non come
  //       proprietà di un oggetto) e se non ha trovato ancora il tipo allora ritorna
  //       il tipo specificato nell'oggetto dei prametri.
  if AKeyTypeName.IsEmpty then
  begin
    if Assigned(LdjsonItemsTypeAttribute) and not LdjsonItemsTypeAttribute.KeyQualifiedName.IsEmpty then
      AKeyTypeName := LdjsonItemsTypeAttribute.KeyQualifiedName
    else if not TdjDuckPropField.IsValidPropField(APropField) then
      AKeyTypeName := AParams.ItemsKeyDefaultQualifiedName;
  end;
  // If the ValueType received as parameter is empty then get the type from
  //  the attribute and if also the attribute value type name is empty then
  //  get the default specified in the params
  //  NB: Solo se APropField non è assegnato (lista deserializzata direttamente e non come
  //       proprietà di un oggetto) e se non ha trovato ancora il tipo allora ritorna
  //       il tipo specificato nell'oggetto dei prametri.
  if AValueTypeName.IsEmpty then
  begin
    if Assigned(LdjsonItemsTypeAttribute) and not LdjsonItemsTypeAttribute.ValueQualifiedName.IsEmpty then
      AValueTypeName := LdjsonItemsTypeAttribute.ValueQualifiedName
    else if not TdjDuckPropField.IsValidPropField(APropField) then
      AValueTypeName := AParams.ItemsValueDefaultQualifiedName;
  end;
end;

class function TdjUtils.GetKeyName(const ARttiMember: TRttiNamedObject;
  const AParams:IdjParams): string;
var
  LdsonNameAttribute: djNameAttribute;
begin
  // If a dsonNameAttribute is present then use it else return the name
  //  of the property/field
  if TdjRTTI.HasAttribute<djNameAttribute>(ARttiMember, LdsonNameAttribute) then
    Result := LdsonNameAttribute.Name
  else
  begin
    Result := ARttiMember.Name;
    // If SerializationType is by Fields then remove the first character if "F"
    if (AParams.SerializationType = TdjSerializationType.stFields) and
       (Result.StartsWith('F', True)) and
       (
          ((ARttiMember as  TRttiMember).Visibility = TMemberVisibility.mvPrivate)
       or
          ((ARttiMember as  TRttiMember).Visibility = TMemberVisibility.mvProtected)) then
    Result := Result.Substring(1);
  end;
  // If UpperCase or LowerCase names parama is specified...
  case AParams.NameCase of
    ncUpperCase: Result := UpperCase(ARttiMember.Name);
    ncLowerCase: Result := LowerCase(ARttiMember.Name);
  end;
end;

class procedure TdjUtils.GetTypeNameIfEmpty(
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  var ATypeName: String);
var
  LdsonTypeAttribute: djTypeAttribute;
begin
  // init
  LdsonTypeAttribute := nil;
  // Only if needed
  if (not ATypeName.IsEmpty) then
    Exit;
  // Get the attribute if exists (On the property or in the RttiType)
  if not TdjRTTI.HasAttribute<djTypeAttribute>(APropField, LdsonTypeAttribute) then
    TdjRTTI.HasAttribute<djTypeAttribute>(TdjDuckPropField.RttiType(APropField), LdsonTypeAttribute);
  // If a dsonTypeAttritbute is found then retrieve the TypeName from it
  if Assigned(LdsonTypeAttribute) and not LdsonTypeAttribute.QualifiedName.IsEmpty then
    ATypeName := LdsonTypeAttribute.QualifiedName
end;

class function TdjUtils.ISODateTimeToString(const ADateTime:TDateTime; const AParams:IdjParams): string;
begin
  case AParams.DateTimeFormat of
    TdjDateTimeFormat.dfISO8601..TdjDateTimeFormat.dfDMVCFramework:
      Result := AParams.ISO8601Processor.FromDateTimeToISO8601(ADateTime);
    TdjDateTimeFormat.dfUnix:
      Result := DateTimeToUnix(ADateTime, AParams.ISO8601Processor.UTCTime).ToString;
  end;
end;

class function TdjUtils.ISODateToString(const ADate:TDateTime; const AParams:IdjParams): string;
begin
  case AParams.DateTimeFormat of
    TdjDateTimeFormat.dfISO8601..TdjDateTimeFormat.dfDMVCFramework:
      Result := AParams.ISO8601Processor.FromDateToISO8601(ADate);
    TdjDateTimeFormat.dfUnix:
      Result := DateTimeToUnix(ADate, AParams.ISO8601Processor.UTCTime).ToString;
  end;
end;

class function TdjUtils.ISOStrToDate(const DateAsString:string; const AParams:IdjParams): TDate;
begin
  case AParams.DateTimeFormat of
    TdjDateTimeFormat.dfISO8601..TdjDateTimeFormat.dfDMVCFramework:
      Result := AParams.ISO8601Processor.FromISO8601ToDate(DateAsString);
    TdjDateTimeFormat.dfUnix:
      Result := UnixToDateTime(DateAsString.ToInt64, AParams.ISO8601Processor.UTCTime);
  else raise Exception.Create('TdjUtils.ISOStrToDate: The AParams.DateTimeFormat contain unknown parameter.');
  end;
end;

class function TdjUtils.ISOStrToDateTime(const DateTimeAsString:string; const AParams:IdjParams): TDateTime;
begin
  case AParams.DateTimeFormat of
    TdjDateTimeFormat.dfISO8601..TdjDateTimeFormat.dfDMVCFramework:
      Result := AParams.ISO8601Processor.FromISO8601ToDateTime(DateTimeAsString);
    TdjDateTimeFormat.dfUnix:
      Result := UnixToDateTime(DateTimeAsString.ToInt64, AParams.ISO8601Processor.UTCTime);
  else raise Exception.Create('TdjUtils.ISOStrToDateTime: The AParams.DateTimeFormat contain unknown parameter.');
  end;
end;

class function TdjUtils.ISOStrToTime(const TimeAsString:string; const AParams:IdjParams): TTime;
begin
  case AParams.DateTimeFormat of
    TdjDateTimeFormat.dfISO8601..TdjDateTimeFormat.dfDMVCFramework:
      Result := AParams.ISO8601Processor.FromISO8601ToTime(TimeAsString);
    TdjDateTimeFormat.dfUnix:
      Result := UnixToDateTime(TimeAsString.ToInt64, AParams.ISO8601Processor.UTCTime);
  else raise Exception.Create('TdjUtils.ISOStrToTime: The AParams.DateTimeFormat contain unknown parameter.');
  end;
end;

class function TdjUtils.ISOTimeToString(const ATime:TTime; const AParams:IdjParams): string;
begin
  case AParams.DateTimeFormat of
    TdjDateTimeFormat.dfISO8601..TdjDateTimeFormat.dfDMVCFramework:
      Result := AParams.ISO8601Processor.FromTimeToISO8601(ATime);
    TdjDateTimeFormat.dfUnix:
      Result := DateTimeToUnix(ATime, AParams.ISO8601Processor.UTCTime).ToString;
  else raise Exception.Create('TdjUtils.ISOTimeToString: The AParams.DateTimeFormat contain unknown parameter.');
  end;
end;

class function TdjUtils.IsPropertyToBeIgnored(
  const APropField: TRttiNamedObject; const AParams: IdjParams): Boolean;
var
  LIgnoredProperty: String;
begin
  if (TdjDuckPropField.RttiType(APropField).Name = 'TioObjStatus') and AParams.IgnoreObjStatus then
    Exit(True);
  if Length(AParams.IgnoredProperties) = 0 then
    Exit(False);
  for LIgnoredProperty in AParams.IgnoredProperties do
    if SameText(APropField.Name, LIgnoredProperty) then
      Exit(True);
  Exit(False);
end;

class function TdjUtils.Pretty(const AJSON: String): String;
var
  JVal: TJSONValue;
begin
  JVal := TJSONObject.ParseJSONValue(AJSON);
  try
//    Result := TJSON.Format(JVal); // NB: Deprecated
    Result := JVal.Format(2);
  finally
    JVal.Free;
  end;
end;

end.
