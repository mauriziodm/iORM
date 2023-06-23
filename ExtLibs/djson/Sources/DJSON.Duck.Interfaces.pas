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
unit DJSON.Duck.Interfaces;

interface

uses
  System.Classes, System.Rtti, System.TypInfo;

type

  IdjDuckStreamable = interface
    ['{D95AD3B5-02AC-49E6-B54E-2ECAA7D5B54B}']
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
    procedure SetObject(const AObj:TObject);
    function IsEmpty: Boolean;
    function DuckObjQualifiedName: String;
  end;

  IdjDuckList = interface
    ['{BD3A3AC2-A7C4-46D1-9BE6-5C32E17D871C}']
    procedure Add(AObject: TObject);
    procedure AddValue(const AValue: TValue);
    procedure Clear;
    procedure SetObject(const AObj:TObject);
    function Count: Integer;
    function GetEnumerator: IEnumerator;
    function GetItem(Index: Integer): TObject;
    function GetItemValue(const index: Integer): TValue;
    function GetItemTypeName: String;
    function GetItemQualifiedTypeName: String;
    function GetItemTypeInfo: PTypeInfo;
    function DuckObjQualifiedName: String;
    // OwnsObjects property
    procedure SetOwnsObjects(AValue:Boolean);
    function GetOwnsObjects: Boolean;
    property OwnsObjects:Boolean read GetOwnsObjects write SetOwnsObjects;
  end;

  IdjDuckDictionary = interface
    ['{CC1ED317-DB5D-43E5-B62E-2A0C11137534}']
    function Count: Integer;
    function GetCurrentKey: TValue;
    function GetCurrentValue: TValue;
    function MoveNext: Boolean;
    function DuckObjQualifiedName: String;
    procedure Add(const AKey, AValue: TValue);
    procedure SetObject(const AObj:TObject);
    function GetKeyTypeInfo: PTypeInfo;
    function GetKeyTypeName: String;
    function GetKeyQualifiedTypeName: String;
    function GetValueTypeInfo: PTypeInfo;
    function GetValueTypeName: String;
    function GetValueQualifiedTypeName: String;
  end;

implementation

end.
