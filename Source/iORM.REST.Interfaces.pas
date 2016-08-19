{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.REST.Interfaces;

interface

uses
  iORM.Where.Interfaces, System.JSON;

  const
    KEY_WHERE = 'Where';
    KEY_DATAOBJECT = 'DataObj';
    KEY_JSONDATAVALUE = 'JSONDataValue';
    KEY_RELATIONPROPERTYNAME = 'RelPropName';
    KEY_RELATIONOID = 'RelOID';
    KEY_BLINDINSERT = 'Blind';

type

  IioRESTRequestBody = interface
    ['{83DE9ECE-47EA-4814-B40E-3E39FAA210A2}']
    function ToJSONObject:TJSONObject;
    // Where
    procedure SetWhere(const Value: IioWhere);
    function GetWhere: IioWhere;
    property Where:IioWhere read GetWhere write SetWhere;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
    // RelationPropertyName
    procedure SetRelationPropertyName(const Value: String);
    function GetRelationPropertyName: String;
    property RelationPropertyName:String read GetRelationPropertyName write SetRelationPropertyName;
    // RelationOID
    procedure SetRelationOID(const Value: Integer);
    function GetRelationOID: Integer;
    property RelationOID:Integer read GetRelationOID write SetRelationOID;
    // BlindInsert
    procedure SetBlindInsert(const Value: Boolean);
    function GetBlindInsert: Boolean;
    property BlindInsert:Boolean read GetBlindInsert write SetBlindInsert;
  end;

  IioRESTResponseBody = interface
    ['{E5A14525-308F-4877-99B7-C270D691FC6D}']
    function ToJSONObject:TJSONObject;
    // JSONDataValue
    procedure SetJSONDataValue(const Value: TJSONValue);
    function GetJSONDataValue: TJSONValue;
    property JSONDataValue:TJSONValue read GetJSONDataValue write SetJSONDataValue;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
  end;

implementation

end.
