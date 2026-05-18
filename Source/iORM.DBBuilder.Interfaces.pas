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



//  TioDBBuilderIndexRebuildMode = (irmDropAndRecreateIndexes, irmAlterIndexes, irmIgnoreIndexes);
  TioDBBuilderIndexRebuildMode = (irmDropAndRecreateForAllTables, irmDropAndRecreateForModifiedTablesOnly, irmIgnoreIndexes);



  TioDBBuilderStatus = (stClean, stUpdate, stCreate);
  TioDBBuilderTableChange = (taFields, taIndexes, taForeignKeys);
  TioDBBuilderTableChanges = set of TioDBBuilderTableChange;

  // Forward declarations
  IioDBBuilderSqlScript = interface;
  IioDBBuilderSchemaRDBMSInfo = interface;
  IioDBBuilderSqlGenerator = interface;

  IioDBBuilderSchemaRDBMSInfo = interface
    ['{A7D3E8F1-B2C4-4D5E-9F6A-1B2C3D4E5F6A}']
    function GetName: String;
    function GetRaw: String;
    function GetVersion: String;
    function GetMajorVersion: Integer;
    function GetMinorVersion: Integer;
    function IsAtLeast(const AMajor, AMinor: Integer): Boolean;
    function ToString: String;

    property Name: String read GetName;
    property Raw: String read GetRaw;
    property Version: String read GetVersion;
    property MajorVersion: Integer read GetMajorVersion;
    property MinorVersion: Integer read GetMinorVersion;
  end;

  IioDBBuilderSchemaFK = interface
    ['{1F653F52-570B-4381-930D-FB3945025DA2}']
    // Raw names (case normalized, no delimiters) - for FK name construction
    function GetName: String;
    function GetReferenceTableName: String;
    function GetReferenceFieldName: String;
    function GetDependentTableName: String;
    function GetDependentFieldName: String;
    // SQL names (case normalized + delimiters) - for SQL generation
    function GetSqlName: String;
    function GetSqlReferenceTableName: String;
    function GetSqlReferenceFieldName: String;
    function GetSqlDependentTableName: String;
    function GetSqlDependentFieldName: String;
    // Other
    function GetOnDeleteAction: TioFKAction;
    function GetOnUpdateAction: TioFKAction;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    // Raw properties
    property DependentTableName: String read GetDependentTableName;
    property DependentFieldName: String read GetDependentFieldName;
    property Name: String read GetName;
    property ReferenceTableName: String read GetReferenceTableName;
    property ReferenceFieldName: String read GetReferenceFieldName;
    // SQL properties
    property SqlName: String read GetSqlName;
    property SqlDependentTableName: String read GetSqlDependentTableName;
    property SqlDependentFieldName: String read GetSqlDependentFieldName;
    property SqlReferenceTableName: String read GetSqlReferenceTableName;
    property SqlReferenceFieldName: String read GetSqlReferenceFieldName;
    // Other properties
    property OnDeleteAction: TioFKAction read GetOnDeleteAction;
    property OnUpdateAction: TioFKAction read GetOnUpdateAction;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  IioDBBuilderSchemaField = interface
    ['{D06F09FD-7252-46E3-A955-E6C2A3095E77}']
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
    // Alteration status getters
    function GetIsAltered: Boolean;
    function GetIsFieldTypeAltered: Boolean;
    function GetIsFieldDefaultAltered: Boolean;
    function GetIsFieldNotNullAltered: Boolean;
    function GetIsFieldLengthAltered: Boolean;
    function GetIsFieldLengthIncreased: Boolean;
    function GetIsFieldLengthDecreased: Boolean;
    function GetIsFieldPrecisionAltered: Boolean;
    function GetIsFieldPrecisionIncreased: Boolean;
    function GetIsFieldPrecisionDecreased: Boolean;

    function GetFieldCustomType: string;
    function GetFieldDefault: TValue;
    function GetFieldDefaultExists: Boolean;
    function GetFieldLength: integer;
    function GetFieldName: String;
    function GetSqlFieldName: String;
    function GetFieldPrecision: integer;
    function GetFieldScale: integer;
    function GetFieldSubtype: string;
    function GetFieldType: TioMetadataFieldType;
    function GetFieldUnicode: boolean;
    function GetFieldNotNull: boolean;
    function GetPrimaryKey: boolean;

    property FieldCustomType: string read GetFieldCustomType;
    property FieldDefault: TValue read GetFieldDefault;
    property FieldDefaultExists: Boolean read GetFieldDefaultExists;
    property FieldLength: integer read GetFieldLength;
    property FieldName: String read GetFieldName;
    property SqlFieldName: String read GetSqlFieldName;
    property FieldPrecision: integer read GetFieldPrecision;
    property FieldScale: integer read GetFieldScale;
    property FieldSubtype: string read GetFieldSubtype;
    property FieldType: TioMetadataFieldType read GetFieldType;
    property FieldUnicode: boolean read GetFieldUnicode;
    property FieldNotNull: boolean read GetFieldNotNull;
    property PrimaryKey: boolean read GetPrimaryKey;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    // Alteration status properties
    property IsAltered: Boolean read GetIsAltered;
    property IsFieldTypeAltered: Boolean read GetIsFieldTypeAltered;
    property IsFieldDefaultAltered: Boolean read GetIsFieldDefaultAltered;
    property IsFieldNotNullAltered: Boolean read GetIsFieldNotNullAltered;
    property IsFieldLengthAltered: Boolean read GetIsFieldLengthAltered;
    property IsFieldLengthIncreased: Boolean read GetIsFieldLengthIncreased;
    property IsFieldLengthDecreased: Boolean read GetIsFieldLengthDecreased;
    property IsFieldPrecisionAltered: Boolean read GetIsFieldPrecisionAltered;
    property IsFieldPrecisionIncreased: Boolean read GetIsFieldPrecisionIncreased;
    property IsFieldPrecisionDecreased: Boolean read GetIsFieldPrecisionDecreased;
  end;

  IioDBBuilderSchemaIndex = interface
    ['{35DBA528-3DE3-4515-B809-5FE42ABF1CBB}']
    procedure AddChange(const AChange: TioDBBuilderIndexChange);

    function GetChanges: TioDBBuilderIndexChanges;
    // Raw names (case normalized, no delimiters)
    function GetCommaSepFieldList: String;
    function GetName: String;
    // SQL names (case normalized + delimiters)
    function GetSqlCommaSepFieldList: String;
    function GetSqlName: String;
    // Other
    function GetHasExplicitName: boolean;
    function GetOrientation: TioIndexOrientation;
    function GetStatus: TioDBBuilderStatus;
    function GetUnique: Boolean;

    procedure SetStatus(const Value: TioDBBuilderStatus);

    property Changes: TioDBBuilderIndexChanges read GetChanges;
    property CommaSepFieldList: String read GetCommaSepFieldList;
    property SqlCommaSepFieldList: String read GetSqlCommaSepFieldList;
    property HasExplicitName: boolean read GetHasExplicitName;
    property Orientation: TioIndexOrientation read GetOrientation;
    property Name: String read GetName;
    property SqlName: String read GetSqlName;
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
    function GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetSequenceName: String;
    function UsesSequenceForKeyGeneration: Boolean;
    function UsesIdentityForKeyGeneration: Boolean;
    function IsKeyGenerationStrategyFallback: Boolean;
    // function IDField: IioDBBuilderSchemaField;
    function GetIndexes: TioDBBuilderSchemaIndexes;
    function GetPrimaryKeyField: IioDBBuilderSchemaField;
    function GetName: String;
    function GetSqlName: String;
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
    property SqlName: string read GetSqlName;
    property KeyGenerationStrategy: TioKeyGenerationStrategyType read GetKeyGenerationStrategy;
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
    function GetScript: IioDBBuilderSqlScript;
    function GetSequences: TioDBBuilderSchemaSequences;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    function GetTables: TioDBBuilderSchemaTables;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
    procedure SequenceAddIfNotExists(const ASequenceName: String);

    property ForeignKeysEnabled: boolean read GetForeignKeysEnabled;
    property IndexesEnabled: boolean read GetIndexesEnabled;
    property Script: IioDBBuilderSqlScript read GetScript;
    property Sequences: TioDBBuilderSchemaSequences read GetSequences;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Tables: TioDBBuilderSchemaTables read GetTables;
  end;

  IioDBBuilderSqlText = interface
    ['{DF2D64EF-3576-49CF-B803-3D10D7A93816}']
    procedure Clear;
    function GetLines: TStringList;
    function GetText: string;

    // Fluent interface methods (return Self)
    function Add(const AText: String): IioDBBuilderSqlText; // Append inline to last line
    function AddComment(const AText: String): IioDBBuilderSqlText;
    function AddEmpty: IioDBBuilderSqlText;
    function AddLine(const AText: string): IioDBBuilderSqlText;
    function AddSeparator: IioDBBuilderSqlText;
    function AddTitle(const AText: String): IioDBBuilderSqlText;
    function DecIndent: IioDBBuilderSqlText;
    function IncIndent: IioDBBuilderSqlText;

    property Lines: TStringList read GetLines;
    property Text: string read GetText;
  end;


  IioDBBuilderSqlScript = interface
    ['{714A36B3-A44C-4D1D-A046-BC6222DCE2B7}']

    function GetBody: IioDBBuilderSqlText;
    function GetFooter: IioDBBuilderSqlText;
    function GetHeader: IioDBBuilderSqlText;
    function GetHints: IioDBBuilderSqlText;
    function GetLines: TStringList;
    function GetWarnings: IioDBBuilderSqlText;

    // Full script clear
    procedure Clear;
    procedure SaveToFile(const AFileName: string);
    // This method works on header section
    procedure ScriptBegin(const AConnectionDefName: string; const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo);
    // This method works on footer section
    procedure ScriptEnd;

    property Body: IioDBBuilderSqlText read GetBody;
    property Footer: IioDBBuilderSqlText read GetFooter;
    property Header: IioDBBuilderSqlText read GetHeader;
    property Hints: IioDBBuilderSqlText read GetHints;
    property Lines: TStringList read GetLines;
    property Warnings: IioDBBuilderSqlText read GetWarnings;
  end;

  // DBBuilder reference
  TioDBBuilderSchemaBuilderRef = class of TioDBBuilderSchemaBuilderIntf;

  TioDBBuilderSchemaBuilderIntf = class abstract
  public
    class procedure BuildSchema(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema); virtual; abstract;
  end;

  IioDBBuilderSqlGenerator = interface
    ['{9B5DE886-BE08-4422-9D6C-A92ABF948CD9}']

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>Creates the database</summary>
    procedure Command_CreateDatabase;
    /// <summary>Checks if database exists</summary>
    function Command_DatabaseExists: Boolean;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Generates the opening SQL statement for CREATE TABLE command.
    /// </summary>
    /// <param name="ATable">The table schema to create</param>
    /// <returns>Opening SQL fragment (e.g., "CREATE TABLE tablename (")</returns>
    function BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string;
    /// <summary>
    /// Generates the closing SQL statement for CREATE TABLE command.
    /// </summary>
    /// <param name="ATable">The table schema being created</param>
    /// <returns>Closing SQL fragment (e.g., ")")</returns>
    function BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string;
    /// <summary>Generates SQL to check if a table exists</summary>
    function BuildSQL_TableExists(const ATableName: string): string;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Generates SQL to alter an existing field based on detected changes.
    /// Uses DBMSInfo property internally for version-specific behavior.
    /// </summary>
    /// <param name="ATable">Table containing the field</param>
    /// <param name="AField">Field to alter with change flags set</param>
    /// <returns>ALTER TABLE SQL statement</returns>
    function BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    /// <summary>Generates SQL to create a field in ALTER TABLE context</summary>
    function BuildSQL_CreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    /// <summary>Generates SQL fragment to define a field in CREATE TABLE context</summary>
    function BuildSQL_FieldDefinition(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    /// <summary>Generates SQL to check if a specific field exists in a table</summary>
    function BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    /// <summary>
    /// Generates SQL to retrieve detailed field metadata from the database.
    /// </summary>
    /// <param name="ATableName">Table name (required) - returns all fields for that table</param>
    /// <param name="AFieldName">Optional field name to retrieve details for a specific field only</param>
    /// <returns>SQL query to fetch field metadata (type, length, precision, scale, default value, etc.)</returns>
    function BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string;
    /// <summary>
    /// Translates an iORM field type to the database-specific SQL type name.
    /// </summary>
    /// <param name="AField">The field metadata to translate.</param>
    /// <param name="AIncludeTypeAttributes">
    /// When True: Returns full type specification with attributes (e.g., "VARCHAR(50)", "DECIMAL(10,2)", "BLOB SUB_TYPE 0")
    /// When False: Returns only base type name (e.g., "VARCHAR", "DECIMAL", "BLOB")
    /// Use True for SQL generation (CREATE/ALTER statements), False for schema comparison.
    /// </param>
    /// <returns>The database-specific type name or full type specification.</returns>
    function Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String;
    /// <summary>
    /// Translates a schema field's default value to its SQL representation.
    /// </summary>
    /// <param name="AField">The field schema containing the default value</param>
    /// <returns>SQL representation of the default value, or empty string if no default exists</returns>
    function Translate_SchemaField_To_DefaultValue(const AField: IioDBBuilderSchemaField): String;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Generates SQL to create an index on a table.
    /// </summary>
    /// <param name="ATable">The table schema</param>
    /// <param name="AIndex">The index schema with field list and options</param>
    /// <returns>CREATE INDEX SQL statement</returns>
    function BuildSQL_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
    /// <summary>Generates SQL to create primary key constraint on a table</summary>
    function BuildSQL_CreatePK(const ATable: IioDBBuilderSchemaTable): string;
    /// <summary>
    /// Generates SQL to drop an index from a table.
    /// </summary>
    /// <param name="ATable">The table schema</param>
    /// <param name="AIndex">The index schema to drop</param>
    /// <returns>DROP INDEX SQL statement</returns>
    function BuildSQL_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
    /// <summary>Generates SQL to drop an index by name</summary>
    function BuildSQL_DropIndexByName(const AIndexName: string): string;
    /// <summary>
    /// Returns SQL to retrieve detailed info about an index (list of fields with position/order).
    /// </summary>
    /// <param name="AIndexName">The index name to get details for</param>
    /// <returns>SQL query to retrieve index details</returns>
    function BuildSQL_IndexDetails(const AIndexName: string): string;
    /// <summary>Generates SQL to check if an index exists on a table</summary>
    function BuildSQL_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
    /// <summary>Generates SQL to check if an index exists by name</summary>
    function BuildSQL_IndexExistsByName(const AIndexName: string): string;
    /// <summary>
    /// Returns SQL to retrieve list of indexes with basic info (name, unique, orientation).
    /// </summary>
    /// <param name="ATableName">
    /// Optional table name filter. If empty, returns all indexes from DB.
    /// If specified, returns indexes for that table only.
    /// </param>
    /// <returns>SQL query to retrieve index list</returns>
    function BuildSQL_IndexList(const ATableName: string = ''): string;
    /// <summary>
    /// Generates the index name from table and index schema information.
    /// Handles both explicit names and auto-generated names with prefixes/suffixes.
    /// </summary>
    /// <param name="ATable">The table schema (must not be nil)</param>
    /// <param name="AIndex">The index schema (must not be nil)</param>
    /// <returns>The index name (uppercase)</returns>
    /// <exception cref="EioGenericException">Raised if ATable or AIndex is nil</exception>
    function Translate_SchemaTableAndIndex_To_IndexName(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): String;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_CreateFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
    /// <summary>
    /// Generates SQL to drop a foreign key constraint.
    /// </summary>
    /// <param name="ATable">The table schema (must not be nil)</param>
    /// <param name="AForeignKey">The foreign key schema (must not be nil)</param>
    /// <returns>SQL statement to drop the foreign key</returns>
    function BuildSQL_DropFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
    /// <summary>Generates SQL to drop a foreign key constraint by name</summary>
    function BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string;
    /// <summary>
    /// Generates SQL to retrieve foreign key constraints from database.
    /// </summary>
    /// <param name="ATableName">Optional table name filter. If empty, returns all FKs</param>
    /// <param name="AFKName">Optional FK name filter. If empty, returns all FKs for the table</param>
    /// <returns>SQL query to retrieve FK list with full details</returns>
    function BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string;
    /// <summary>
    /// Generates the foreign key constraint name from table and FK schema information.
    /// </summary>
    /// <param name="ATable">The table schema (must not be nil)</param>
    /// <param name="AForeignKey">The foreign key schema (must not be nil)</param>
    /// <returns>The FK constraint name (uppercase)</returns>
    /// <exception cref="EioGenericException">Raised if ATable or AForeignKey is nil</exception>
    function Translate_SchemaTableAndFK_To_FKName(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
    /// <summary>
    /// Translates a foreign key action enum to its SQL representation.
    /// </summary>
    /// <param name="AForeignKey">The foreign key schema</param>
    /// <param name="AFKAction">The FK action (ON DELETE/ON UPDATE)</param>
    /// <returns>SQL action string (e.g., "CASCADE", "SET NULL", "NO ACTION")</returns>
    /// <exception cref="EioGenericException">Raised if AFKAction has an unexpected value</exception>
    function Translate_SchemaFK_To_FKvalue(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;

    // ==========================================================
    // DBMS INFO METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Returns DBMS version information with lazy loading (loaded on first access).
    /// </summary>
    /// <returns>DBMS info object with name, version, and comparison methods</returns>
    function GetDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
    /// <summary>
    /// Retrieves database system name and version information from the connected database.
    /// Called internally by GetDBMSInfo for lazy loading.
    /// </summary>
    /// <returns>RDBMS info object with name, version, and comparison methods</returns>
    function LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
    /// <summary>
    /// DBMS version information with lazy loading (loaded on first access).
    /// Use this property instead of LoadDBMSInfo for cached access.
    /// </summary>
    property DBMSInfo: IioDBBuilderSchemaRDBMSInfo read GetDBMSInfo;

    // ==========================================================
    // KEY GENERATION CAPABILITY METHODS
    // ----------------------------------------------------------
    /// <summary>Returns True if the database supports IDENTITY columns</summary>
    function Supports_Identity: Boolean;
    /// <summary>Returns True if the database supports SEQUENCE objects</summary>
    function Supports_Sequence: Boolean;
    /// <summary>
    /// Resolves the requested key generation strategy to an effective strategy.
    /// If ARequestedStrategy is kgsAuto, returns the DBMS-specific default strategy.
    /// Otherwise, returns ARequestedStrategy unchanged.
    /// </summary>
    function Resolve_KeyGenerationStrategy(const ARequestedStrategy: TioKeyGenerationStrategyType): TioKeyGenerationStrategyType;

    // ==========================================================
    // ALTER TABLE CAPABILITY METHODS
    // ----------------------------------------------------------
    /// <summary>Returns True if the database supports ALTER COLUMN SET/DROP NOT NULL</summary>
    function Supports_AlterNotNull: Boolean;
    /// <summary>Returns True if the database permits BLOB subtype changes via ALTER COLUMN</summary>
    function Supports_AlterBlobSubtype: Boolean;

    // ==========================================================
    // SEQUENCE RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>Generates SQL to create a sequence</summary>
    function BuildSQL_CreateSequence(const ASequenceName: String): string;
    /// <summary>Generates SQL to drop a sequence</summary>
    function BuildSQL_DropSequence(const ASequenceName: string): string;
    /// <summary>Generates SQL to check if a sequence exists</summary>
    function BuildSQL_SequenceExists(const ASequenceName: string): string;
    // ==========================================================
  end;

  IioDBBuilderStrategy = interface
    ['{4187C897-A5C6-4807-87D0-C466D3EE34CE}']
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable);
    procedure CreateDatabase;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure CreateOrAlterTableIndexes(const ATable: IioDBBuilderSchemaTable);
    procedure CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
    function DatabaseExists: Boolean;
    procedure DropForeignKeys;
    procedure DropIndexes;
    procedure DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
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
    /// <returns>The status of the analyzed schema</returns>
    /// </summary>
    function Analyze: TioDBBuilderStatus;
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



