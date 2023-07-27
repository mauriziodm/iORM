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
unit DJSON.Attributes;

interface

uses
  System.TypInfo, DJSON.Serializers, System.Rtti, DJSON.Params;

type

  // djSkip
  djSkipAttribute = class(TCustomAttribute)
  strict private
    FScopes: TioSkipScopeSet;
  public
    constructor Create; overload;
    constructor Create(const AScopes: TioSkipScopeSet); overload;
    property Scopes: TioSkipScopeSet read FScopes;
  end;

  // djName
  djNameAttribute = class(TCustomAttribute)
  private
    FName: string;
    function GetName: string;
  public
    constructor Create(const AName: string);
    property Name: string read GetName;
  end;

  // djType
  djTypeAttribute = class(TCustomAttribute)
  private
    FQualifiedName: String;
  public
    constructor Create; overload; // For initialization
    constructor Create(const Value: TClass); overload;
    constructor Create(const ATypeInfo: PTypeInfo); overload;
    property QualifiedName: String read FQualifiedName;
  end;

  // djItemsType
  djItemsTypeAttribute = class(TCustomAttribute)
  private
    FKeyQualifiedName: String;
    FValueQualifiedName: String;
    procedure SetValue(const Value: TClass);
    function GetValue: TClass;
  public
    constructor Create; overload; // For initialization
    constructor Create(const Value: TClass); overload; // Use with lists (for compatibility)
    constructor Create(const AValueTypeInfo: PTypeInfo); overload; // Use with lists
    constructor Create(const AKeyTypeInfo, AValueTypeInfo: PTypeInfo); overload; // Use with TDIctionary
    property Value: TClass read GetValue write SetValue;
    property KeyQualifiedName: String read FKeyQualifiedName;
    property ValueQualifiedName: String read FValueQualifiedName;
  end;

  // djSerializer attributes
  djSerializerAttribute<T> = class(TCustomAttribute)
  private
    FSerializer: T;
  public
    constructor Create(const ASerializer: T);
    property Serializer: T read FSerializer;
  end;

  // djSerializerDOM
  djSerializerDOMAttribute = class(djSerializerAttribute<TdjDOMCustomSerializerRef>)
  end;

  // djSerializerXML
  // djSerializerXMLAttribute = class(djSerializerAttribute<TdjXMLCustomSerializerRef>)
  // end;
  // djSerializerStream
  // djSerializerXML
  djSerializerStreamAttribute = class(djSerializerAttribute<TdjStreamCustomSerializerRef>)
  end;

  // djEncoding
  djEncodingAttribute = class(TCustomAttribute)
  strict private
    FEncoding: string;
    procedure SetEncoding(const Value: string);

  const
    DefaultEncoding = 'utf-8';
  public
    constructor Create(const AEncoding: string = DefaultEncoding);
    property Encoding: string read FEncoding write SetEncoding;
  end;

implementation

uses
  System.SysUtils, DJSON.Utils.Rtti, System.Generics.Collections;

{ djEncodingAttribute }

constructor djEncodingAttribute.Create(const AEncoding: string);
begin
  inherited Create;
  if AEncoding.IsEmpty then
    FEncoding := DefaultEncoding
  else
    FEncoding := AEncoding;
end;

procedure djEncodingAttribute.SetEncoding(const Value: string);
begin
  FEncoding := Value;
end;

{ djNameAttribute }

constructor djNameAttribute.Create(const AName: string);
begin
  inherited Create;
  FName := AName;
end;

function djNameAttribute.GetName: string;
begin
  Result := FName;
end;

{ djItemsTypeAttribute }

constructor djItemsTypeAttribute.Create(const Value: TClass);
begin
  Self.Create(Value.ClassInfo);
end;

constructor djItemsTypeAttribute.Create;
begin
  inherited Create;
  // Init
  FKeyQualifiedName := '';
  FValueQualifiedName := '';
end;

constructor djItemsTypeAttribute.Create(const AValueTypeInfo: PTypeInfo);
begin
  Self.Create;
  // Extract the qualified type name for the values
  FValueQualifiedName := TdjRTTI.TypeInfoToQualifiedTypeName(AValueTypeInfo);
end;

constructor djItemsTypeAttribute.Create(const AKeyTypeInfo, AValueTypeInfo: PTypeInfo);
begin
  // Extract the qualified type name for the values
  Self.Create(AValueTypeInfo);
  // Extract the qualified type name for the Keys
  FKeyQualifiedName := TdjRTTI.TypeInfoToQualifiedTypeName(AKeyTypeInfo);
end;

function djItemsTypeAttribute.GetValue: TClass;
var
  typ: TRttiType;
begin
  inherited;
  Result := nil;
  typ := TdjRTTI.QualifiedTypeNameToRttiType(FValueQualifiedName);
  if Assigned(typ) and typ.IsInstance then
    Result := typ.AsInstance.MetaclassType;
end;

procedure djItemsTypeAttribute.SetValue(const Value: TClass);
begin
  FValueQualifiedName := Value.QualifiedClassName;
end;

{ djTypeAttribute }

constructor djTypeAttribute.Create;
begin
  inherited Create;
  // Init
  FQualifiedName := '';
end;

constructor djTypeAttribute.Create(const Value: TClass);
begin
  Self.Create(Value.ClassInfo);
end;

constructor djTypeAttribute.Create(const ATypeInfo: PTypeInfo);
begin
  Self.Create;
  // Extract the qualified type name for the values
  FQualifiedName := TdjRTTI.TypeInfoToQualifiedTypeName(ATypeInfo);
end;

{ djSerializerAttribute<T> }

constructor djSerializerAttribute<T>.Create(const ASerializer: T);
begin
  FSerializer := ASerializer;
end;

{ djSkipAttribute }

constructor djSkipAttribute.Create;
begin
  FScopes := [ooMap, ooETM, ooHTTP, ooEmbeddeRelation, ooSUD, ooSaveRevertPoint, ooDJSON];
end;

constructor djSkipAttribute.Create(const AScopes: TioSkipScopeSet);
begin
  FScopes := AScopes;
end;

end.
