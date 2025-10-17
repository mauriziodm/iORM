{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.DBBuilder.Interfaces;

interface

uses
  System.Generics.Collections, iORM.Context.Table.Interfaces, iORM.Context.Properties.Interfaces, System.Classes,
  iORM.Context.Map.Interfaces, iORM.Attributes, System.Rtti, iORM.CommonTypes, iORM.DB.Interfaces;

type

  TioDBBuilderEngineStatus = (dbToBeAnalyzed, dbUptodate, dbNotExists, dbUpdatesNeeded, dbWarningExists);
  TioDBBuilderStatus = (stClean, stUpdate, stCreate);
  TioDBBuilderFieldAlterStatus = (alFieldType, alFieldDefault, alFieldNotNull, alFieldPrecision, alFieldLength);
  TioDBBuilderFieldAlter = set of TioDBBuilderFieldAlterStatus;

  IioDBBuilderSchemaFK = interface
    ['{1F653F52-570B-4381-930D-FB3945025DA2}']
    function Name: String;
    function ReferenceTableName: String;
    function ReferenceFieldName: String;
    function DependentTableName: String;
    function DependentFieldName: String;
    function OnDeleteAction: TioFKAction;
    function OnUpdateAction: TioFKAction;
  end;

  IioDBBuilderSchemaField = interface
    ['{D06F09FD-7252-46E3-A955-E6C2A3095E77}']
    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
    function Altered: TioDBBuilderFieldAlter;
    function FieldCustomType: string;
    function FieldDefault: TValue;
    function FieldDefaultExists: Boolean;
    function FieldLength: integer;
    function FieldName(const AClearDelimiters: Boolean = False): String;
    function FieldPrecision: integer;
    function FieldScale: integer;
    function FieldSubType: string;
    function FieldType: TioMetadataFieldType;
    function FieldUnicode: boolean;
    function FieldNotNull: boolean;
    function PrimaryKey: boolean;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaFields = TList<IioDBBuilderSchemaField>;
  TioDBBuilderSchemaIndexes = TioIndexList;
  TioDBBuilderSchemaForeignKeys = TDictionary<String, IioDBBuilderSchemaFK>;

  IioDBBuilderSchemaTable = interface
    ['{2AFBE991-7E33-42DB-892E-01F8C98A5B8F}']
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function Fields: TioDBBuilderSchemaFields;
    function ForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetContextTable: IioTable;
    function GetSequenceName: String;
    // function IDField: IioDBBuilderSchemaField;
    function Indexes: TioDBBuilderSchemaIndexes;
    function PrimaryKeyField: IioDBBuilderSchemaField;
    function TableName: String;
    // IsTrueClass
    procedure SetIsTrueClass(const AValue: boolean);
    function GetIsTrueClass: boolean;
    property IsTrueClass: boolean read GetIsTrueClass write SetIsTrueClass;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaTables = TDictionary<String, IioDBBuilderSchemaTable>;
  TioDBBuilderSchemaSequences = TStringList;

  IioDBBuilderSchema = interface
    ['{1AEDB134-1ECB-490E-A53A-973BEDE509E5}']
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function ForeignKeysEnabled: boolean;
    function IndexesEnabled: boolean;
    procedure SequenceAddIfNotExists(const ASequenceName: String);
    function Sequences: TioDBBuilderSchemaSequences;
    function Warnings: TStrings;
    function WarningExists: boolean;
    function Tables: TioDBBuilderSchemaTables;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  IioDBBuilderSqlScript = interface
    ['{714A36B3-A44C-4D1D-A046-BC6222DCE2B7}']

    function GetCurrentIndentation: TioIndentation;
    function GetSQL: TStringList;

    procedure Add(const AText: String; const UseIndent: boolean = True);
    procedure AddComment(const AText: String);
    procedure AddEmpty;
    procedure AddSeparator;
    procedure AddTitle(const AText: String);
    procedure AddWarning(const AText: String);
    procedure AddWarnings(const WarningsList: TStrings);

    procedure ScriptBegin(const AConnectionDefName, ADriverID: string);
    procedure ScriptEnd;

    procedure DecIndentationLevel;
    procedure IncIndentationLevel;

    property CurrentIndentation: TioIndentation read GetCurrentIndentation;
    property SQL: TStringList read GetSQL;
  end;

  // DBBuilder reference
  TioDBBuilderSchemaBuilderRef = class of TioDBBuilderSchemaBuilderIntf;

  TioDBBuilderSchemaBuilderIntf = class abstract
  public
    class procedure BuildSchema(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema); virtual; abstract;
  end;

  IioDBBuilderSqlGenerator = interface
    ['{9B5DE886-BE08-4422-9D6C-A92ABF948CD9}']

    // Tables related methods
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildTableExistsSql(const ATableName: string): string;
    // Fields related methods
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string;
    function BuildAlterFieldSql(const AField: IioDBBuilderSchemaField): string;
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string;
    function BuildCreateFieldsSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const ReturnTypeNameOnly: boolean = true): String;
    // PrimaryKeys related methods
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string;
    // Indexes related methods
    function BuildAddIndexSql(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): string;
    function BuildDropIndexSql(const AIndexName: string): string;
    function BuildIndexExistsSql(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): string; overload;
    function BuildIndexExistsSql(const AIndexName: string): string; overload;
    function BuildListAllIndexesSql: string;
    function BuildListTableIndexesSql(const ATable: IioDBBuilderSchemaTable): string;
    // Foreign keys
    function BuildAddForeignKeySql(const AForeignKey: IioDBBuilderSchemaFK): string;
    function BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string;
    function BuildListAllForeignKeysSql: string;
    function BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string;
  end;

  IioDBBuilderStrategy = interface
    ['{4187C897-A5C6-4807-87D0-C466D3EE34CE}']
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
    procedure CreateDatabase;
    procedure CreateForeignKeys(const AScript: IioDBBuilderSqlScript);
    procedure CreateIndexes(const AScript: IioDBBuilderSqlScript);
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
    procedure CreateTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
    procedure CreateTableForeignKeys(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
    function DatabaseExists: Boolean;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex): boolean; overload;
    function IndexExists(const AIndexName: string): boolean; overload;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;

    procedure GenerateCreateDatabaseScript(const AScript: IioDBBuilderSqlScript);
    procedure GenerateUpdateDatabaseScript(const AScript: IioDBBuilderSqlScript);
  end;

  IioDBBuilderDBAnalyzer = interface
    ['{8F82C20B-5D51-42FE-80D2-96F818F3B555}']
    procedure Analyze(const ForceCreate: boolean = false);
  end;

  IioDBBuilderEngine = interface
    ['{E7BC9176-4C71-48CA-A92F-37DE99E0AC3A}']
    function GetStatus: TioDBBuilderEngineStatus;
    function GetWarnings: TStrings;

    /// <summary>
    ///  Analyzes the schema generated by entities mapping and current database schema updating the schema status.
    ///  It must be called before CreateOrAlterDB, BuildCreateDBSqlScript, BuildUpdateDBSqlScript or BuildCreateOrAlterDBSqlScript methods.
    /// <param name="ForceCreate">Forces the analyzer to act if the database should be created</param>
    /// <remarks>
    ///  If the ForceCreate parameter is true, the analyzer behaves like the database doesn't exists and should be created even if it already exists.
    ///  If the ForceCreate parameter is false, the analyzer behaves like normal, acting as if the database doesn't exists if not exists or updated it if already exists.
    /// </remarks>
    /// </summary>
    procedure Analyze(const ForceCreate: boolean = false);
    /// <summary>
    ///  Build Creates or Alter database SQL script based on schema status.
    /// <param name="AScript">The script where sql instructions will be returned.</param>
    /// </summary>
    procedure BuildCreateOrUpdateDBSqlScript(const AScript: IioDBBuilderSqlScript);
    /// <summary>
    ///  Build Creates database SQL script regardless of schema status.
    /// <param name="AScript">The script where sql instructions will be returned.</param>
    /// </summary>
    procedure BuildCreateDBSqlScript(const AScript: IioDBBuilderSqlScript);
    /// <summary>
    ///  Build update database SQL script regardless of schema status.
    /// <param name="AScript">The script where sql instructions will be returned.</param>
    /// </summary>
    procedure BuildUpdateDBSqlScript(const AScript: IioDBBuilderSqlScript);
    /// <summary>
    ///  Creates or update the database depending on the actual schema/database status.
    ///  No need to call Analyze because it is called internally.
    /// <param name="Force">Forces the execution regardless of the schema status.</param>
    /// </summary>
    procedure CreateOrUpdateDB(const Force: Boolean = False; const AScript: IioDBBuilderSqlScript = nil);

    property Status: TioDBBuilderEngineStatus read GetStatus;
    property Warnings: TStrings read GetWarnings;
  end;


implementation

end.



