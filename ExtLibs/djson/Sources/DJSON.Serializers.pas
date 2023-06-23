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
unit DJSON.Serializers;

interface

uses
  System.Rtti,
  System.JSON,
  System.JSON.Writers,
  System.JSON.Readers;

type
  TdjDOMCustomSerializerRef = class of TdjDOMCustomSerializer;

  TdjDOMCustomSerializer = class abstract
  public
    class function Serialize(const AValue: TValue): TJSONValue; virtual;
    class function Deserialize(const AJSONValue: TJSONValue; const AExistingValue: TValue): TValue; virtual;
    class function isTypeNotificationCompatible: Boolean; virtual;
  end;

  TdjStreamCustomSerializerRef = class of TdjStreamCustomSerializer;

  TdjStreamCustomSerializer = class abstract
  public
    class procedure Serialize(const AJSONWriter: TJSONWriter; const AValue: TValue); virtual;
    class function Deserialize(const AJSONReader: TJSONReader; const AExistingValue: TValue): TValue; virtual;
    class function isTypeNotificationCompatible: Boolean; virtual;
  end;

//  TdjXMLCustomSerializerRef = class of TdjXMLCustomSerializer;
//  TdjXMLCustomSerializer = class abstract
//  public
//    class function Serialize(const AXMLNode:IXMLDOMNode; const AValue:TValue): TJSONValue; virtual;
//    class function Deserialize(const AXMLNode:IXMLDOMNode; const AExistingValue:TValue): TValue; virtual;
//    class function isTypeNotificationCompatible: Boolean; virtual;
//  end;

implementation

{ TdjCustomSerializer }

class function TdjDOMCustomSerializer.Deserialize(const AJSONValue: TJSONValue; const AExistingValue: TValue): TValue;
begin
  // None
  Result := nil;
end;

class function TdjDOMCustomSerializer.isTypeNotificationCompatible: Boolean;
begin
  // TypeNotification not compatible by default
  Result := False;
end;

class function TdjDOMCustomSerializer.Serialize(
  const AValue: TValue): TJSONValue;
begin
  // None
  Result := nil;
end;

{ TdjStreamCustomSerializer }

class function TdjStreamCustomSerializer.Deserialize(const AJSONReader: TJSONReader; const AExistingValue: TValue): TValue;
begin
  // None
  Result := nil;
end;

class function TdjStreamCustomSerializer.isTypeNotificationCompatible: Boolean;
begin
  // TypeNotification not compatible by default
  Result := False;
end;

class procedure TdjStreamCustomSerializer.Serialize(const AJSONWriter: TJSONWriter; const AValue: TValue);
begin
  // None
end;

end.

