{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
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
