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
  System.Rtti, System.Classes,
  iORM.Attributes,
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Context.Map.Interfaces, iORM.Context.Table.Interfaces,
  iORM.Context.Interfaces, iORM.CommonTypes,
  System.Generics.Collections;

type

  //TioDBBuilderTableState = (tsOk, tsNew, tsModified);

  IioDBBuilderField = interface;
  IioDBBuilderTable = interface;
  IioDBBuilderFKDefinition = interface;

  TioDBBuilderFieldList = TDictionary<String,IioDBBuilderField>;
  TioDBBuilderTableList = TDictionary<String,IioDBBuilderTable>;
  TioDBBuilderFKList = class(TDictionary<String, IioDBBuilderFKDefinition>)
  end;

  IioDBBuilderFKDefinition = interface
    function GetDestinationFieldName: string;
    function GetDestinationTableName: string;
    function GetSourceFieldName: string;
    function GetSourceTableName: string;
    function GetRelationType: TioRelationType;
    property SourceTableName: string read GetSourceTableName;
    property SourceFieldName: string read GetSourceFieldName;
    property DestinationTableName: string read GetDestinationTableName;
    property DestinationFieldName: string read GetDestinationFieldName;
    property RelationType: TioRelationType read GetRelationType;
  end;

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
    procedure SetIsSqlField(AValue: Boolean);
    property IsSqlField:Boolean read GetIsSqlField write SetIsSqlField;
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
    // ForeignKeyList
    function GetForeignKeyList: TioDBBuilderFKList;
    property ForeignKeyList:TioDBBuilderFKList read GetForeignKeyList;
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
    function EndAlterTable(const APropertyIsID: Boolean): String;
    function GetRemark(const AWarnings: Boolean): String;

    function FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
    function FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty; out OWarnings: Boolean): Boolean;
    function CreateField(const AProperty:IioContextProperty; const AAddNullableSyntax: boolean = True; const AAddType: boolean = False): String;
    function CreateClassInfoField(ATable: IioDBBuilderTable): String;
    function AddField(const AProperty:IioContextProperty): String;
    function AlterField(const AProperty:IioContextProperty): String;

    function AddPrimaryKey(const ATableName: String; const AIDProperty: IioContextProperty): String;
    function AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String): String;
    function AddSequences(const ATableName: String; const AIDProperty: IioContextProperty): String;
    function AddIndex(const AContext: IioContext; const AIndexName, ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String;

    function DropAllForeignKey(const ATableList: TioDBBuilderTableList): String;
    function DropAllIndex: String;

    function AddForeignKeyInCreate(const ABuilderTable: IioDBBuilderTable): String;
    function RestructureTable(const ATableList: TioDBBuilderTableList): String;

    procedure ExecuteSql(const ASql: string; const AMultipleSQL: boolean = False);
  end;

  IioDBBuilder = interface
  ['{0D8F8F8F-12FA-4C7B-9CB8-3A4A5EAD7C43}']
    procedure SetCreateIndexes(const Value: Boolean);
    procedure SetCreateReferentialIntegrityConstraints(const Value: Boolean);
    procedure SetCreateScriptOnly(const Value: Boolean);
    function GetCreateIndexes: Boolean;
    function GetCreateReferentialIntegrityConstraints: Boolean;
    function GetCreateScriptOnly: Boolean;
    function GenerateDB(out OOutputScript: String; out OErrorMessage: String): Boolean;
    property CreateScriptOnly: Boolean read GetCreateScriptOnly write SetCreateScriptOnly;
    property CreateReferentialIntegrityConstraints: Boolean read GetCreateReferentialIntegrityConstraints write SetCreateReferentialIntegrityConstraints;
    property CreateIndexes: Boolean read GetCreateIndexes write SetCreateIndexes;
  end;

implementation

begin
end.



