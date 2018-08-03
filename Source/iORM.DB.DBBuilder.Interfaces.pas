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


unit iORM.DB.DBBuilder.Interfaces;

interface

uses
  System.Generics.Collections, System.Rtti, System.Classes,
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Context.Map.Interfaces, iORM.Context.Table.Interfaces,
  iORM.Context.Interfaces, iORM.CommonTypes;

type

  //TioDBBuilderTableState = (tsOk, tsNew, tsModified);

  IioDBBuilderField = interface;
  IioDBBuilderTable = interface;
  TioDBBuilderFieldList = TDictionary<String,IioDBBuilderField>;
  TioDBBuilderTableList = TDictionary<String,IioDBBuilderTable>;

  IioDBBuilderField = interface
    ['{45B1CD52-FBDA-460A-B0D4-C558960F8257}']
    // FieldName
    function GetFieldName: String;
    property FieldName:String read GetFieldName;
    // IsKeyField
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
    // IsSqlField
    function GetIsSqlField: Boolean;
    property IsSqlField:Boolean read GetIsSqlField;
  end;

  IioDBBuilderTable = interface
    ['{B8CB16FA-96F5-4858-918B-610DADCE40A1}']
    function FieldExists(AFieldName:String): Boolean;
    function GetMap: IioMap;
    // TableName
    function GetTableName: String;
    Procedure SetTableName(AValue:String);
    property TableName:String read GetTableName write SetTableName;
    // Fields
    function GetFields: TioDBBuilderFieldList;
    property Fields:TioDBBuilderFieldList read GetFields;
    // IndexList
    function GetIndexList: TioIndexList;
    property IndexList:TioIndexList read GetIndexList;
    // TableState
    //function TableState: TioDBBuilderTableState;
    // IsClassFromField
    function IsClassFromField: Boolean;
    procedure SetClassFromField(const AValue: Boolean);
    // IDField
    function IDField: IioDBBuilderField;
  end;

  IioDBBuilderSqlGenerator = interface
  ['{52A8F7F2-3DDC-4782-9C1D-717B541D291B}']
    function DatabaseExists(const ADbName: string): Boolean;
    function CreateDatabase(const ADbName: string): String;
    function UseDatabase(const ADbName: string): String;

    function TableExists(const ADbName: String; const ATableName:String): Boolean;
    function BeginCreateTable(const ATableName:String): String;
    function EndCreateTable: String;
    function BeginAlterTable(const ARemark: String; const ATableName:String): String;
    function EndAlterTable: String;
    function GetRemark(const AWarnings: Boolean): String;

    function FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
    function FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty; out OWarnings: Boolean): Boolean;
    function CreateField(const AProperty:IioContextProperty): String;
    function CreateClassInfoField: String;
    function AddField(const AProperty:IioContextProperty): String;
    function AlterField(const AProperty:IioContextProperty): String;

    function AddPrimaryKey(const ATableName: String; const AIDProperty: IioContextProperty): String;
    function AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String): String;
    function AddIndex(const AContext: IioContext; const AIndexName, ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String;

    function DropAllForeignKey: String;
    function DropAllIndex: String;
  end;

  IioDBBuilder = interface
  ['{0D8F8F8F-12FA-4C7B-9CB8-3A4A5EAD7C43}']
    function GenerateDB(AOnlyCreateScript: Boolean; out OOutputScript: String; out OErrorMessage: String): Boolean;
  end;

implementation

begin
end.



