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

  TioDBBuilderFieldAlterStatus = (alFieldType, alFieldDefault, alFieldNotNull, alFieldPrecisionIncreased, alFieldPrecisionDecreased, alFieldLengthIncreased, alFieldLengthDecreased);
  TioDBBuilderFieldAlter = set of TioDBBuilderFieldAlterStatus;
  TioDBBuilderIndexChange = (icFields, icOrientation, icUnique);
  TioDBBuilderIndexChanges = set of TioDBBuilderIndexChange;
  // irmDropAndRecreateAllTables (safe, default), irmDropAndRecreateModifiedTablesOnly (faster), irmIgnoreIndexes (disabled, fully manual)
  TioDBBuilderIndexRebuildMode = (irmDropAndRecreateForAllTables, irmDropAndRecreateForModifiedTablesOnly, irmIgnoreIndexes);
  TioDBBuilderStatus = (stClean, stUpdate, stCreate);
  TioDBBuilderTableChange = (taFields, taIndexes, taForeignKeys);
  TioDBBuilderTableChanges = set of TioDBBuilderTableChange;

  IioDBBuilderSchemaFK = interface
    ['{1F653F52-570B-4381-930D-FB3945025DA2}']
    function GetName: String;
    function GetReferenceTableName: String;
    function GetReferenceFieldName: String;
    function GetDependentTableName: String;
    function GetDependentFieldName: String;
    function GetOnDeleteAction: TioFKAction;
    function GetOnUpdateAction: TioFKAction;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    property DependentTableName: String read GetDependentTableName;
    property DependentFieldName: String read GetDependentFieldName;
    property Name: String read GetName;
    property OnDeleteAction: TioFKAction read GetOnDeleteAction;
    property OnUpdateAction: TioFKAction read GetOnUpdateAction;
    property ReferenceTableName: String read GetReferenceTableName;
    property ReferenceFieldName: String read GetReferenceFieldName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  IioDBBuilderSchemaField = interface
    ['{D06F09FD-7252-46E3-A955-E6C2A3095E77}']
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
    function Altered: TioDBBuilderFieldAlter;

    function GetFieldCustomType: string;
    function GetFieldDefault: TValue;
    function GetFieldDefaultExists: Boolean;
    function GetFieldLength: integer;
    function GetFieldName{(const AClearDelimiters: Boolean = False)}: String;
    function GetFieldPrecision: integer;
    function GetFieldScale: integer;
    function GetFieldSubType: string;
    function GetFieldType: TioMetadataFieldType;
    function GetFieldUnicode: boolean;
    function GetFieldNotNull: boolean;
    function GetPrimaryKey: boolean;

    property FieldCustomType: string read GetFieldCustomType;
    property FieldDefault: TValue read GetFieldDefault;
    property FieldDefaultExists: Boolean read GetFieldDefaultExists;
    property FieldLength: integer read GetFieldLength;
    property FieldName: String read GetFieldName;
    property FieldPrecision: integer read GetFieldPrecision;
    property FieldScale: integer read GetFieldScale;
    property FieldSubType: string read GetFieldSubType;
    property FieldType: TioMetadataFieldType read GetFieldType;
    property FieldUnicode: boolean read GetFieldUnicode;
    property FieldNotNull: boolean read GetFieldNotNull;
    property PrimaryKey: boolean read GetPrimaryKey;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  IioDBBuilderSchemaIndex = interface
    ['{35DBA528-3DE3-4515-B809-5FE42ABF1CBB}']

    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    function GetChanges: TioDBBuilderIndexChanges;
    function GetCommaSepFieldList: String;
    function GetExplicitName: boolean;
    function GetName: String;
    function GetIndexOrientation: TioIndexOrientation;
    function GetUnique: Boolean;

    procedure AddChange(const AChange: TioDBBuilderIndexChange);

    property Changes: TioDBBuilderIndexChanges read GetChanges;
    property CommaSepFieldList: String read GetCommaSepFieldList;
    property ExplicitName: boolean read GetExplicitName;
    property Name: String read GetName;
    property IndexOrientation: TioIndexOrientation read GetIndexOrientation;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Unique: Boolean read GetUnique;
  end;

  TioDBBuilderSchemaFields = TList<IioDBBuilderSchemaField>;
  TioDBBuilderSchemaIndexes = TDictionary<String, IioDBBuilderSchemaIndex>;
//  TioDBBuilderSchemaIndexes = TioIndexList;
  TioDBBuilderSchemaForeignKeys = TDictionary<String, IioDBBuilderSchemaFK>;

  IioDBBuilderSchemaTable = interface
    ['{2AFBE991-7E33-42DB-892E-01F8C98A5B8F}']

    function GetChanges: TioDBBuilderTableChanges;
    function GetFields: TioDBBuilderSchemaFields;
    function GetForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetContextTable: IioTable;
    function GetSequenceName: String;
    // function IDField: IioDBBuilderSchemaField;
    function GetIndexes: TioDBBuilderSchemaIndexes;
    function GetPrimaryKeyField: IioDBBuilderSchemaField;
    function GetName: String;
    // IsTrueClass
    procedure SetIsTrueClass(const AValue: boolean);
    function GetIsTrueClass: boolean;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);

    procedure AddChange(const AChange: TioDBBuilderTableChange);
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);

    property ContextTable: IioTable read GetContextTable;
    property Changes: TioDBBuilderTableChanges read GetChanges;
    property Fields: TioDBBuilderSchemaFields read GetFields;
    property ForeignKeys: TioDBBuilderSchemaForeignKeys read GetForeignKeys;
    property Indexes: TioDBBuilderSchemaIndexes read GetIndexes;
    property IsTrueClass: boolean read GetIsTrueClass write SetIsTrueClass;
    property Name: string read GetName;
    property PrimaryKeyField: IioDBBuilderSchemaField read GetPrimaryKeyField;
    property SequenceName: string read GetSequenceName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaTables = TDictionary<String, IioDBBuilderSchemaTable>;
  TioDBBuilderSchemaSequences = TStringList;

  IioDBBuilderSchema = interface
    ['{1AEDB134-1ECB-490E-A53A-973BEDE509E5}']
    function GetForeignKeysEnabled: boolean;
    function GetIndexesEnabled: boolean;
    function GetSequences: TioDBBuilderSchemaSequences;
    function GetWarnings: TStrings;
    function GetWarningExists: boolean;
    function GetTables: TioDBBuilderSchemaTables;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
    procedure SequenceAddIfNotExists(const ASequenceName: String);

    property ForeignKeysEnabled: boolean read GetForeignKeysEnabled;
    property IndexesEnabled: boolean read GetIndexesEnabled;
    property Sequences: TioDBBuilderSchemaSequences read GetSequences;
    property Warnings: TStrings read GetWarnings;
    property WarningExists: boolean read GetWarningExists;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Tables: TioDBBuilderSchemaTables read GetTables;
  end;

  IioDBBuilderSqlScriptSection = interface
    ['{DF2D64EF-3576-49CF-B803-3D10D7A93816}']

    function GetCurrentIndentation: TioIndentation;
    function GetSQL: TStringList;

    procedure Add(const AText: String; const UseIndent: boolean = True);
    procedure AddComment(const AText: String);
    procedure AddEmpty;
    procedure AddSeparator;
    procedure AddTitle(const AText: String);
    procedure AddWarning(const AText: String);
    procedure AddWarnings(const WarningsList: TStrings);
    procedure Clear;

    procedure DecIndentationLevel;
    procedure IncIndentationLevel;

    property CurrentIndentation: TioIndentation read GetCurrentIndentation;
    property SQL: TStringList read GetSQL;
  end;


  IioDBBuilderSqlScript = interface
    ['{714A36B3-A44C-4D1D-A046-BC6222DCE2B7}']

    function GetBody: IioDBBuilderSqlScriptSection;
    function GetFooter: IioDBBuilderSqlScriptSection;
    function GetHeader: IioDBBuilderSqlScriptSection;
    function GetSQL: TStringList;

    // Full script clear
    procedure Clear;
    procedure SaveToFile(const AFileName: string);
    // This method works on header section
    procedure ScriptBegin(const AConnectionDefName, ADriverID: string);
    // This method works on footer section
    procedure ScriptEnd;

    property Body: IioDBBuilderSqlScriptSection read GetBody;
    property Footer: IioDBBuilderSqlScriptSection read GetFooter;
    property Header: IioDBBuilderSqlScriptSection read GetHeader;
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

    // Database operations (execute directly, don't return SQL)
    procedure CreateDatabase;
    function DatabaseExists: Boolean;

    // Tables related methods
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildCreateTableSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
    function BuildTableExistsSql(const ATableName: string): string;
    // Fields related methods
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string;
    function BuildAlterFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string;
    function BuildCreateFieldsSql(const ATable: IioDBBuilderSchemaTable; const AIndentation: TioIndentation): string;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const AExcludeTypeAttributes: boolean): String;
    // PrimaryKeys related methods
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string;
    // Indexes related methods
    function BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
    function BuildSQL_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
    function BuildSQL_DropIndexByName(const AIndexName: string): string;
    function BuildSQL_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string;
    function BuildSQL_IndexListForTable(const ATableName: string = ''): string;
    function BuildSQL_IndexDetails(const AIndexName: string): string;
    function Translate_SchemaTableAndIndex_To_IndexName(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): String;
    function BuildRecreateFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    // Foreign keys
    function BuildAddForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
    function BuildDropForeignKeySql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; overload;
    function BuildDropForeignKeySql(const ATableName, AForeignKeyName: string): string; overload;
    function BuildListAllForeignKeysSql: string;
    function BuildForeignKeyExistsSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
    function BuildForeignKeyModifiedSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
    function BuildForeignKeyNameSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK;
      const UpperCase: boolean = True): string;
    function BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string;
    function TranslateFKAction(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;

    function SqlIdentifierExeedMaxLength(const AIdentifierName: string): boolean;
    function SqlIdentifierBehindMinLength(const AIdentifierName: string): boolean;
  end;

  IioDBBuilderStrategy = interface
    ['{4187C897-A5C6-4807-87D0-C466D3EE34CE}']
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable);
    procedure CreateDatabase;
    procedure CreateForeignKeys;
    procedure CreateIndexes;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure CreateTableIndexes(const ATable: IioDBBuilderSchemaTable);
    procedure CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
    function DatabaseExists: Boolean;
    procedure DropForeignKeys;
    procedure DropIndexes;
    procedure DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; overload;
    function IndexExists(const AIndexName: string): boolean; overload;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;

    procedure GenerateCreateDatabaseScript;
    procedure GenerateUpdateDatabaseScript;
  end;

  IioDBBuilderDBAnalyzer = interface
    ['{8F82C20B-5D51-42FE-80D2-96F818F3B555}']
    procedure Analyze;
  end;

  IioDBBuilderEngine = interface
    ['{E7BC9176-4C71-48CA-A92F-37DE99E0AC3A}']
    function GetAnalyzed: boolean;
    function GetSchema: IioDBBuilderSchema;
    function GetWarnings: TStrings;

    /// <summary>
    ///  Analyzes the schema generated by entities mapping and current database schema updating the schema status.
    ///  It must be called before CreateOrAlterDB, BuildCreateDBSqlScript, BuildUpdateDBSqlScript or BuildCreateOrAlterDBSqlScript methods.
    /// <param name="ForceCreate">Forces the analyzer to act if the database should be created</param>
    /// <remarks>
    ///  If the ForceCreate parameter is true, the analyzer behaves like the database doesn't exists and should be created even if it already exists.
    ///  If the ForceCreate parameter is false, the analyzer behaves like normal, acting as if the database doesn't exists if not exists or updated it if already exists.
    /// </remarks>
    /// <returns>
    ///  The status of the analyzed schema
    /// </returns>
    /// </summary>
    function Analyze(const ForceCreate: boolean = false): TioDBBuilderStatus;
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

    procedure BuildDropIndexesSqlScript(const AScript: IioDBBuilderSqlScript);

    procedure BuildDropForeignKeysSqlScript(const AScript: IioDBBuilderSqlScript);
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
    /// <summary>
    ///  Creates or update the the table depending on the actual schema status.
    /// <param name="ATable">Schema of the table to be created/updated.</param>
    /// <param name="AddIndexes">Enable/Disable the creation table indexes.</param>
    /// <param name="AddForeignKeys">Enabled/Disable the creation of table foreign keys.</param>
    /// </summary>
    procedure CreateOrUpdateTable(const ATable: IioDBBuilderSchemaTable; const AddIndexes: Boolean = True;
      const AddForeignKeys: Boolean = True);
    /// <summary>
    ///  Creates the table using the schema passed.
    /// <param name="ATable">Schema of the table to be created/updated.</param>
    /// <param name="AddIndexes">Enable/Disable the creation table indexes.</param>
    /// <param name="AddForeignKeys">Enabled/Disable the creation of table foreign keys.</param>
    /// </summary>
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable; const AddIndexes: Boolean = True;
      const AddForeignKeys: Boolean = True);
    /// <summary>
    ///  Updates the table using the schema passed.
    /// <param name="ATable">Schema of the table to be created/updated.</param>
    /// <param name="AddIndexes">Enable/Disable the creation table indexes.</param>
    /// <param name="AddForeignKeys">Enabled/Disable the creation of table foreign keys.</param>
    /// </summary>
    procedure UpdateTable(const ATable: IioDBBuilderSchemaTable; const AddIndexes: Boolean = True;
      const AddForeignKeys: Boolean = True);

    property Analyzed: boolean read GetAnalyzed;
    property Schema: IioDBBuilderSchema read GetSchema;
    property Warnings: TStrings read GetWarnings;
  end;


implementation

end.



