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



unit iORM.DB.DBCreator.Interfaces;

interface

uses
  System.Generics.Collections, System.Rtti, System.Classes,
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Context.Map.Interfaces, iORM.Context.Table.Interfaces;

type

  TioDBCreatorTableState = (tsOk, tsNew, tsModified);

  IioDBCreatorField = interface;
  IioDBCreatorTable = interface;
  TioDBCreatorFieldList = TDictionary<String,IioDBCreatorField>;
  TioDBCreatorTableList = TDictionary<String,IioDBCreatorTable>;

  IioDBCreatorField = interface
    ['{45B1CD52-FBDA-460A-B0D4-C558960F8257}']
    // FieldName
    function GetFieldName: String;
    property FieldName:String read GetFieldName;
    // IsKeyFeld
    function GetIsKeyField: Boolean;
    property IsKeyField:Boolean read GetIsKeyField;
    // FieldType (contains field type description with length if necessary)
    function GetFieldType: String;
    property FieldType:String read GetFieldType;
    // Rtti property reference
    function GetProperty: IioContextProperty;
    // DBFieldExists
    procedure SetDBFieldExist(AValue:Boolean);
    function GetDBFieldExist: Boolean;
    property DBFieldExist:Boolean read GetDBFieldExist write SetDBFieldExist;
    // DBFieldSameType
    procedure SetDBFieldSameType(AValue:Boolean);
    function GetDBFieldSameType: Boolean;
    property DBFieldSameType:Boolean read GetDBFieldSameType write SetDBFieldSameType;
    // IsClassFromFIeld
    function GetIsClassFromField: Boolean;
    property IsClassFromField:Boolean read GetIsClassFromField;
  end;

  IioDBCreatorTable = interface
    ['{B8CB16FA-96F5-4858-918B-610DADCE40A1}']
    function FieldExists(AFieldName:String): Boolean;
    function GetMap: IioMap;
    // TableName
    function GetTableName: String;
    Procedure SetTableName(AValue:String);
    property TableName:String read GetTableName write SetTableName;
    // Fields
    function GetFields: TioDBCreatorFieldList;
    property Fields:TioDBCreatorFieldList read GetFields;
    // IndexList
    function GetIndexList: TioIndexList;
    property IndexList:TioIndexList read GetIndexList;
    // TableState
    function TableState: TioDBCreatorTableState;
    // IsClassFromField
    function IsClassFromField: Boolean;
    // IDField
    function IDField: IioDBCreatorField;
  end;

  IioDBCreator = interface
    ['{BE91C118-CF4A-495C-94B5-638149AED5DC}']
    procedure AutoCreateDatabase(const AAutoCreateIndexesByAttributes:Boolean=True; const AAutoCreateIndexesByRelations:Boolean=True);
    function Tables: TioDBCreatorTableList;
  end;

  IioDBCreatorSqlGenerator = interface
    ['{8E138570-0918-495C-845A-A65D3FEF4961}']
    function TableExists(ATable:IioDBCreatorTable): Boolean;
    procedure LoadFieldsState(ATable:IioDBCreatorTable);
    procedure AutoCreateDatabase(ADBCreator: IioDBCreator);
    function GetClassFromFieldColumnType: String;
  end;

implementation

end.
