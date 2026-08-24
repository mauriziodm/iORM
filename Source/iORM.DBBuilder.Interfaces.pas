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
  System.Generics.Collections, iORM.Context.Properties.Interfaces, System.Classes,
  iORM.Context.Map.Interfaces, iORM.Attributes, System.Rtti, iORM.CommonTypes, iORM.DB.Interfaces;

type

  TioDBBuilderFieldChange = (fcType, fcDefault, fcNotNull, fcPrecisionIncreased, fcPrecisionDecreased, fcLengthIncreased, fcLengthDecreased);
  TioDBBuilderFieldChanges = set of TioDBBuilderFieldChange;
  TioDBBuilderIndexChange = (icFields, icOrientation, icUnique);
  TioDBBuilderIndexChanges = set of TioDBBuilderIndexChange;

  /// <summary>
  ///  The Plan operation vocabulary: the dialect-independent *intent* of a single schema change,
  ///  produced by the PlanBuilder from the Desired-vs-Actual diff and realized into SQL by each
  ///  Strategy/SqlGenerator. Names mirror the existing ScriptWrite_/BuildSQL_ translator families
  ///  (e.g. opCreateTable -> ScriptWrite_CreateTable). opDropTable and opDropField are the destructive
  ///  ops: they target an orphan table/field (present in the DB but not in the ORM maps) and are always
  ///  realized as a commented, non-executed statement plus a warning - iORM never silently drops a
  ///  table or a field.
  ///  The last two are the rename-create-copy rebuild ops, produced only by the PlanBuilder's rebuild
  ///  shape (Build_Rebuild) and consumed only by WithoutAlterTable dialects (e.g. SQLite), which cannot
  ///  ALTER a table in place: opRenameTableToOld renames a table to its "_old" shadow, opCopyData copies
  ///  the rows from that shadow into the freshly recreated table. opDropIndex (dropping a physical index
  ///  by its actual catalog name) is shared by both PlanBuilder shapes - the rebuild shape uses it too,
  ///  unconditionally, to free every physical index of a rebuilt table before recreating it. Orphan fields
  ///  need no dedicated op there: the rebuild recreates the table from the mapped fields only, so an
  ///  unmapped column is simply not carried over.
  /// </summary>
  TioDBBuilderPlanOpKind = (opCreateTable, opDropTable, opCreateField, opAlterField, opDropField, opCreateIndex,
    opDropIndex, opCreateForeignKey, opDropForeignKey, opCreateSequence, opDropSequence,
    opRenameTableToOld, opCopyData);

  // irmDropAndRecreateForAllTables (safe, default), irmDropAndRecreateForModifiedTablesOnly (faster), irmIgnoreIndexes (disabled, fully manual)
  TioDBBuilderIndexRebuildMode = (irmDropAndRecreateForAllTables, irmDropAndRecreateForModifiedTablesOnly, irmIgnoreIndexes);

  /// <summary>
  ///  An element's position relative to the OTHER schema branch (Mapped vs Physical), stamped by the
  ///  PlanBuilder: stCreate = only in Mapped (must be created), stDrop = only in Physical (orphan, must
  ///  be dropped), stUpdate = in both but differing, stClean = in both and identical.
  /// </summary>
  TioDBBuilderStatus = (stClean, stUpdate, stCreate, stDrop);

  /// <summary>
  /// Shared off/conservative/exhaustive tri-state, reused by unrelated DBBuilder settings that happen to
  /// follow the same progression. Each property using it documents its own meaning for the three values:
  ///   - Reconciliation.IndexesMode / ForeignKeysMode: how indexes/FKs are managed.
  ///       ifmDisabled: not managed at all (not created, not dropped).
  ///       ifmEnabled: conservative — creates new and updates modified indexes/FKs, but does NOT remove
  ///         orphaned ones (those present in the DB but not in the schema). Protects manually added
  ///         indexes/FKs (e.g. client-specific optimizations).
  ///       ifmEnabledStrict: drops ALL existing indexes/FKs from the DB for updated tables and recreates
  ///         them from the schema. The schema is authoritative; any index/FK not in the schema is removed.
  ///       Note: for WithoutAlterTable databases (e.g. SQLite), ifmEnabled and ifmEnabledStrict behave
  ///       identically because the rename-create-copy pattern already recreates everything from scratch.
  ///       The distinction only matters for WithAlterTable databases (Firebird, MSSql).
  ///   - Script.PlanRenderMode: whether/how the script's PLAN section (a human-readable, non-executed
  ///     comment listing of the Plan's operations) is rendered.
  ///       ifmDisabled: no PLAN section at all.
  ///       ifmEnabled: lists every operation EXCEPT the index/FK creations that belong to a table being
  ///         created from scratch (Status = stCreate) - "Create table X" already implies them, so listing
  ///         each one adds noise without new information.
  ///       ifmEnabledStrict: lists every operation of the Plan, unfiltered.
  /// </summary>
  TioDBBuilderMode = (ifmDisabled, ifmEnabled, ifmEnabledStrict);

  // Forward declarations
  IioDBBuilderContext = interface;
  IioDBBuilderScript = interface;
  IioDBBuilderSchemaRDBMSInfo = interface;
  IioDBBuilderSqlGenerator = interface;
  IioDBBuilderSqlText = interface;

  IioDBBuilderSchemaRDBMSInfo = interface
    ['{A7D3E8F1-B2C4-4D5E-9F6A-1B2C3D4E5F6A}']
    function GetMajorVersion: Integer;
    function GetMinorVersion: Integer;
    function GetName: String;
    function GetRaw: String;
    function GetVersion: String;
    function IsAtLeast(const AMajor, AMinor: Integer): Boolean;
    function ToString: String;

    property MajorVersion: Integer read GetMajorVersion;
    property MinorVersion: Integer read GetMinorVersion;
    property Name: String read GetName;
    property Raw: String read GetRaw;
    property Version: String read GetVersion;
  end;

  IioDBBuilderSchemaFK = interface
    ['{1F653F52-570B-4381-930D-FB3945025DA2}']
    function GetDependentFieldName: String;
    function GetDependentTableName: String;
    function GetName: String;
    function GetOnDeleteAction: TioFKAction;
    function GetOnUpdateAction: TioFKAction;
    function GetReferenceFieldName: String;
    function GetReferenceTableName: String;
    function GetSqlDependentFieldName: String;
    function GetSqlDependentTableName: String;
    function GetSqlReferenceFieldName: String;
    function GetSqlReferenceTableName: String;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    property DependentFieldName: String read GetDependentFieldName;
    property DependentTableName: String read GetDependentTableName;
    property Name: String read GetName;
    property OnDeleteAction: TioFKAction read GetOnDeleteAction;
    property OnUpdateAction: TioFKAction read GetOnUpdateAction;
    property ReferenceFieldName: String read GetReferenceFieldName;
    property ReferenceTableName: String read GetReferenceTableName;
    property SqlDependentFieldName: String read GetSqlDependentFieldName;
    property SqlDependentTableName: String read GetSqlDependentTableName;
    property SqlReferenceFieldName: String read GetSqlReferenceFieldName;
    property SqlReferenceTableName: String read GetSqlReferenceTableName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  IioDBBuilderSchemaField = interface
    ['{D06F09FD-7252-46E3-A955-E6C2A3095E77}']
    procedure AddAltered(const AAltered: TioDBBuilderFieldChange);
    function GetFieldCustomType: string;
    function GetFieldDefault: TValue;
    function GetFieldDefaultExists: Boolean;
    // Raw default expression as it would appear in this dialect's DDL - the (1) comparison basis:
    // frozen at construction on every branch (Mapped renders itself via the SqlGenerator, Physical
    // stores the raw catalog string, ClassInfo has none so it stays ''). See TioDBBuilderSchemaField's
    // class doc comment for why the Mapped/ClassInfo freeze happens in the Factory, not the constructor.
    function GetFieldDefaultRaw: String;
    function GetFieldLength: integer;
    function GetFieldName: String;
    function GetFieldNotNull: boolean;
    function GetFieldPrecision: integer;
    function GetFieldScale: integer;
    function GetFieldSubtype: string;
    function GetFieldType: TioMetadataFieldType;
    // Raw type string as it would appear in this dialect's DDL (e.g. 'VARCHAR', 'INTEGER') - the (1)
    // comparison basis. Same freeze story as GetFieldDefaultRaw.
    function GetFieldTypeRaw: String;
    function GetFieldUnicode: boolean;
    function GetIsAltered: Boolean;
    function GetIsFieldDefaultAltered: Boolean;
    function GetIsFieldLengthAltered: Boolean;
    function GetIsFieldLengthDecreased: Boolean;
    function GetIsFieldLengthIncreased: Boolean;
    function GetIsFieldNotNullAltered: Boolean;
    function GetIsFieldPrecisionAltered: Boolean;
    function GetIsFieldPrecisionDecreased: Boolean;
    function GetIsFieldPrecisionIncreased: Boolean;
    function GetIsFieldTypeAltered: Boolean;
    function GetPrimaryKey: boolean;
    function GetSqlFieldName: String;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    property FieldCustomType: string read GetFieldCustomType;
    property FieldDefault: TValue read GetFieldDefault;
    property FieldDefaultExists: Boolean read GetFieldDefaultExists;
    property FieldDefaultRaw: String read GetFieldDefaultRaw;
    property FieldLength: integer read GetFieldLength;
    property FieldName: String read GetFieldName;
    property FieldNotNull: boolean read GetFieldNotNull;
    property FieldPrecision: integer read GetFieldPrecision;
    property FieldScale: integer read GetFieldScale;
    property FieldSubtype: string read GetFieldSubtype;
    property FieldType: TioMetadataFieldType read GetFieldType;
    property FieldTypeRaw: String read GetFieldTypeRaw;
    property FieldUnicode: boolean read GetFieldUnicode;
    property IsAltered: Boolean read GetIsAltered;
    property IsFieldDefaultAltered: Boolean read GetIsFieldDefaultAltered;
    property IsFieldLengthAltered: Boolean read GetIsFieldLengthAltered;
    property IsFieldLengthDecreased: Boolean read GetIsFieldLengthDecreased;
    property IsFieldLengthIncreased: Boolean read GetIsFieldLengthIncreased;
    property IsFieldNotNullAltered: Boolean read GetIsFieldNotNullAltered;
    property IsFieldPrecisionAltered: Boolean read GetIsFieldPrecisionAltered;
    property IsFieldPrecisionDecreased: Boolean read GetIsFieldPrecisionDecreased;
    property IsFieldPrecisionIncreased: Boolean read GetIsFieldPrecisionIncreased;
    property IsFieldTypeAltered: Boolean read GetIsFieldTypeAltered;
    property PrimaryKey: boolean read GetPrimaryKey;
    property SqlFieldName: String read GetSqlFieldName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  IioDBBuilderSchemaIndex = interface
    ['{35DBA528-3DE3-4515-B809-5FE42ABF1CBB}']
    procedure AddChange(const AChange: TioDBBuilderIndexChange);
    function GetChanges: TioDBBuilderIndexChanges;
    function GetCommaSepFieldList: String;
    function GetHasExplicitName: boolean;
    function GetName: String;
    function GetOrientation: TioIndexOrientation;
    function GetSqlCommaSepFieldList: String;
    function GetStatus: TioDBBuilderStatus;
    function GetUnique: Boolean;
    procedure SetStatus(const Value: TioDBBuilderStatus);

    property Changes: TioDBBuilderIndexChanges read GetChanges;
    property CommaSepFieldList: String read GetCommaSepFieldList;
    property HasExplicitName: boolean read GetHasExplicitName;
    property Name: String read GetName;
    property Orientation: TioIndexOrientation read GetOrientation;
    property SqlCommaSepFieldList: String read GetSqlCommaSepFieldList;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Unique: Boolean read GetUnique;
  end;

  TioDBBuilderSchemaFields = TList<IioDBBuilderSchemaField>;
  TioDBBuilderSchemaIndexes = TDictionary<String, IioDBBuilderSchemaIndex>;
//  TioDBBuilderSchemaIndexes = TioIndexList;
  TioDBBuilderSchemaForeignKeys = TDictionary<String, IioDBBuilderSchemaFK>;

  IioDBBuilderSchemaTable = interface
    ['{2AFBE991-7E33-42DB-892E-01F8C98A5B8F}']

    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    /// <summary>
    ///  Case-insensitive lookup of a field of this table by name, or nil if absent.
    /// </summary>
    function FindField(const AFieldName: String): IioDBBuilderSchemaField;
    /// <summary>
    ///  Forces this table, its fields, its indexes and its foreign keys to stCreate, overriding
    ///  whatever the entity-map-vs-DB comparison would have produced. Delegates to
    ///  ForceFieldsCreateStatus/ForceIndexesCreateStatus/ForceForeignKeysCreateStatus.
    /// </summary>
    procedure ForceCreateStatus;
    /// <summary>
    ///  Forces every field of this table to stCreate, overriding whatever the entity-map-vs-DB
    ///  comparison would have produced. Used as part of ForceCreateStatus's table-wide cascade.
    /// </summary>
    procedure ForceFieldsCreateStatus;
    /// <summary>
    ///  Forces every foreign key of this table to stCreate, overriding whatever the entity-map-vs-DB
    ///  comparison would have produced. Used as part of ForceCreateStatus's table-wide cascade.
    /// </summary>
    procedure ForceForeignKeysCreateStatus;
    /// <summary>
    ///  Forces every index of this table to stCreate, overriding whatever the entity-map-vs-DB
    ///  comparison would have produced. Used as part of ForceCreateStatus's table-wide cascade.
    /// </summary>
    procedure ForceIndexesCreateStatus;
    // The IioTable.ClassName the Mapped branch was built from, frozen at construction; '' on the
    // Physical branch (not applicable - a catalog table has no ORM class). Kept as a plain string
    // (not the live IioTable) so SqlGenerator/PlanBuilder never reach into the ORM object itself.
    function GetContextClassName: String;
    function GetFields: TioDBBuilderSchemaFields;
    function GetForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetIndexes: TioDBBuilderSchemaIndexes;
    function GetIsTrueClass: boolean;
    function GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetName: String;
    function GetPrimaryKeyField: IioDBBuilderSchemaField;
    // Returns the strategy the entity originally requested (before Resolve_KeyGenerationStrategy
    // applied any DBMS-specific fallback). GetKeyGenerationStrategy returns the *resolved* one.
    function GetRequestedKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetSequenceName: String;
    function GetSqlName: String;
    function GetStatus: TioDBBuilderStatus;
    /// <summary>
    ///  True if at least one field of this table has a pending change (Status &gt; stClean), i.e. it
    ///  must be created or altered. Replaces the former taFields flag of the removed table-level
    ///  Changes set: field Status is the single source of truth.
    /// </summary>
    function HasFieldChanges: Boolean;
    function IsKeyGenerationStrategyFallback: Boolean;
    procedure SetIsTrueClass(const AValue: boolean);
    procedure SetStatus(const AValue: TioDBBuilderStatus);
    function UsesIdentityForKeyGeneration: Boolean;
    function UsesSequenceForKeyGeneration: Boolean;

    property ContextClassName: String read GetContextClassName;
    property Fields: TioDBBuilderSchemaFields read GetFields;
    property ForeignKeys: TioDBBuilderSchemaForeignKeys read GetForeignKeys;
    property Indexes: TioDBBuilderSchemaIndexes read GetIndexes;
    property IsTrueClass: boolean read GetIsTrueClass write SetIsTrueClass;
    property KeyGenerationStrategy: TioKeyGenerationStrategyType read GetKeyGenerationStrategy;
    property Name: string read GetName;
    property PrimaryKeyField: IioDBBuilderSchemaField read GetPrimaryKeyField;
    property RequestedKeyGenerationStrategy: TioKeyGenerationStrategyType read GetRequestedKeyGenerationStrategy;
    property SequenceName: string read GetSequenceName;
    property SqlName: string read GetSqlName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaTables = TDictionary<String, IioDBBuilderSchemaTable>;
  TioDBBuilderSchemaSequences = TStringList;

  IioDBBuilderSchema = interface
    ['{1AEDB134-1ECB-490E-A53A-973BEDE509E5}']
    /// <summary>
    ///  Inserts an already-built table node into the schema, keyed by its Name. Used by the Introspector
    ///  to populate the Physical branch with catalog-backed table nodes (the Mapped branch is built the
    ///  ORM-driven way via FindOrCreateTable instead).
    /// </summary>
    procedure AddTable(const ATable: IioDBBuilderSchemaTable);
    function FindOrCreateTable(const AMap: IioMap; const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
    /// <summary>
    ///  Forces the whole schema tree (schema, tables, fields, indexes and foreign keys) to stCreate,
    ///  overriding whatever the entity-map-vs-DB comparison would have produced (the create-from-scratch
    ///  path, as when the target database does not exist). Used to force a coherent full "create from
    ///  scratch" script regardless of the actual database state. Delegates to each table's own
    ///  ForceCreateStatus.
    /// </summary>
    procedure ForceCreateStatus;
    function GetSequences: TioDBBuilderSchemaSequences;
    function GetStatus: TioDBBuilderStatus;
    function GetTables: TioDBBuilderSchemaTables;
    procedure SequenceAddIfNotExists(const ASequenceName: String);
    procedure SetStatus(const Value: TioDBBuilderStatus);

    property Sequences: TioDBBuilderSchemaSequences read GetSequences;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Tables: TioDBBuilderSchemaTables read GetTables;
  end;

  /// <summary>
  ///  A single schema-change operation: a plain data record of *what* must change, carrying references
  ///  to the Schema node(s) it concerns and (for opAlterField) the set of altered attributes. It holds
  ///  no knowledge of *how* to render itself - that is the dialect's job. Built only through
  ///  IioDBBuilderPlan's typed factories, so its slots are always coherent with its Kind. Which branch a
  ///  slot holds depends on the Kind: "create" ops carry the Mapped element, "drop" ops the Physical one;
  ///  only opAlterField carries both branches of the field (SchemaField_Mapped + SchemaField_Physical).
  /// </summary>
  IioDBBuilderPlanOperation = interface
    ['{6E2C9A17-3D4B-4F8A-9C1E-7B6F5A2D3C41}']
    function GetDescription: String;
    function GetKind: TioDBBuilderPlanOpKind;
    function GetSchemaField_Changes: TioDBBuilderFieldChanges;
    function GetSchemaField_Mapped: IioDBBuilderSchemaField;
    function GetSchemaField_Physical: IioDBBuilderSchemaField;
    function GetSchemaForeignKey: IioDBBuilderSchemaFK;
    function GetSchemaIndex: IioDBBuilderSchemaIndex;
    function GetSchemaTable: IioDBBuilderSchemaTable;
    function GetSequenceName: String;

    /// <summary>Human-readable, dialect-independent summary of the operation (for logs/UI grids), e.g. "Add field 'AGE' to 'CLIENTI'".</summary>
    property Description: String read GetDescription;
    property Kind: TioDBBuilderPlanOpKind read GetKind;
    property SchemaField_Changes: TioDBBuilderFieldChanges read GetSchemaField_Changes;
    property SchemaField_Mapped: IioDBBuilderSchemaField read GetSchemaField_Mapped;
    /// <summary>The physical (old/actual) field, carried by opAlterField so translation (C4) can render the
    /// old->new warnings; nil for every other op kind.</summary>
    property SchemaField_Physical: IioDBBuilderSchemaField read GetSchemaField_Physical;
    property SchemaForeignKey: IioDBBuilderSchemaFK read GetSchemaForeignKey;
    property SchemaIndex: IioDBBuilderSchemaIndex read GetSchemaIndex;
    property SchemaTable: IioDBBuilderSchemaTable read GetSchemaTable;
    property SequenceName: String read GetSequenceName;
  end;

  TioDBBuilderPlanOperations = TList<IioDBBuilderPlanOperation>;

  /// <summary>
  ///  The ordered, dialect-independent list of schema-change operations: the "Plan" of the
  ///  Desired/Actual/Plan reconciliation. Operations are appended through typed factory methods (the
  ///  ONLY way to add them - callers never touch the raw operation slots, so a malformed operation
  ///  cannot be constructed). Insertion order IS execution order; producing that order (dependency
  ///  sequencing) is the PlanBuilder's responsibility, not this container's.
  /// </summary>
  IioDBBuilderPlan = interface
    ['{C4D5E6F7-8A9B-4C0D-B1E2-3F4A5B6C7D82}']
    // Layout: grouped under domain banners, alphabetical within each group (project-wide convention).
    // TABLE
    function AddCopyData(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    function AddCreateTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    function AddDropTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    function AddRenameTableToOld(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    // FIELD
    function AddAlterField(const ATable: IioDBBuilderSchemaTable; const AMappedField, APhysicalField: IioDBBuilderSchemaField;
      const ASchemaField_Changes: TioDBBuilderFieldChanges): IioDBBuilderPlanOperation;
    function AddCreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
    function AddDropField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
    // INDEX
    function AddCreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
    // Drops a physical index by its actual catalog name (AIndex is a Physical node, e.g. as found by
    // Match_PhysicalIndex or enumerated wholesale in strict/rebuild mode).
    function AddDropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
    // FOREIGN KEY
    function AddCreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
    function AddDropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
    // SEQUENCE
    function AddCreateSequence(const ASequenceName: String): IioDBBuilderPlanOperation;
    function AddDropSequence(const ASequenceName: String): IioDBBuilderPlanOperation;
    // PLAN-WIDE
    procedure Clear;
    function GetCount: Integer;
    function GetIsEmpty: Boolean;
    function GetOperations: TioDBBuilderPlanOperations;
    /// <summary>Renders this Plan's operations as human-readable, non-executed comment lines into ASink,
    /// filtered per AMode (see TioDBBuilderMode). Dialect-independent: uses each operation's
    /// own Description, never touches the SqlGenerator.</summary>
    procedure Render(const ASink: IioDBBuilderSqlText; const AMode: TioDBBuilderMode);

    property Count: Integer read GetCount;
    property IsEmpty: Boolean read GetIsEmpty;
    property Operations: TioDBBuilderPlanOperations read GetOperations;
  end;

  /// <summary>
  ///  The container of the Desired/Actual/Plan reconciliation: Mapped (schema built from the ORM
  ///  entity maps), Physical (schema introspected from the live DB), and Plan (the ordered operations
  ///  that converge Physical to Mapped). Physical is filled by the Introspector, so it may be nil
  ///  until then.
  /// </summary>
  IioDBBuilderReconciliation = interface
    ['{3F5A9C21-7E4D-4B6A-9F12-8C3D5E7A1B60}']
    function GetForeignKeysMode: TioDBBuilderMode;
    function GetIndexesMode: TioDBBuilderMode;
    function GetMappedSchema: IioDBBuilderSchema;
    function GetPhysicalSchema: IioDBBuilderSchema;
    function GetPlan: IioDBBuilderPlan;
    procedure SetPhysicalSchema(const AValue: IioDBBuilderSchema);

    property ForeignKeysMode: TioDBBuilderMode read GetForeignKeysMode;
    property IndexesMode: TioDBBuilderMode read GetIndexesMode;
    property MappedSchema: IioDBBuilderSchema read GetMappedSchema;
    property PhysicalSchema: IioDBBuilderSchema read GetPhysicalSchema write SetPhysicalSchema;
    property Plan: IioDBBuilderPlan read GetPlan;
  end;

  IioDBBuilderSqlText = interface
    ['{DF2D64EF-3576-49CF-B803-3D10D7A93816}']
    function Add(const AText: String): IioDBBuilderSqlText; // Append inline to last line
    function AddComment(const AText: String): IioDBBuilderSqlText;
    function AddEmpty: IioDBBuilderSqlText;
    function AddLine(const AText: string): IioDBBuilderSqlText;
    function AddSeparator: IioDBBuilderSqlText;
    function AddTitle(const AText: String): IioDBBuilderSqlText;
    procedure Clear;
    function DecIndent: IioDBBuilderSqlText;
    function GetIsEmpty: Boolean;
    function GetLines: TStringList;
    function GetText: string;
    function IncIndent: IioDBBuilderSqlText;

    property IsEmpty: Boolean read GetIsEmpty;
    property Lines: TStringList read GetLines;
    property Text: string read GetText;
  end;


  IioDBBuilderScript = interface
    ['{714A36B3-A44C-4D1D-A046-BC6222DCE2B7}']

    procedure Clear;
    function GetBody: IioDBBuilderSqlText;
    function GetFooter: IioDBBuilderSqlText;
    function GetHeader: IioDBBuilderSqlText;
    function GetHints: IioDBBuilderSqlText;
    function GetLines: TStringList;
    function GetPlan: IioDBBuilderSqlText;
    function GetPlanRenderMode: TioDBBuilderMode;
    function GetWarnings: IioDBBuilderSqlText;
    procedure SaveToFile(const AFileName: string);
    // This method works on header section
    procedure ScriptBegin(const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderMode);
    // This method works on footer section
    procedure ScriptEnd;
    procedure SetPlanRenderMode(const AValue: TioDBBuilderMode);

    property Body: IioDBBuilderSqlText read GetBody;
    property Footer: IioDBBuilderSqlText read GetFooter;
    property Header: IioDBBuilderSqlText read GetHeader;
    property Hints: IioDBBuilderSqlText read GetHints;
    property Lines: TStringList read GetLines;
    /// <summary>The PLAN section: a human-readable, non-executed comment listing of the Plan's
    /// operations, filtered per PlanRenderMode. Populated by Strategy.Base.GenerateScript, the single
    /// shared point that sees both the Plan and PlanRenderMode.</summary>
    property Plan: IioDBBuilderSqlText read GetPlan;
    property PlanRenderMode: TioDBBuilderMode read GetPlanRenderMode write SetPlanRenderMode;
    property Warnings: IioDBBuilderSqlText read GetWarnings;
  end;

  /// <summary>
  ///  Collects everything a single DBBuilder operation needs and produces: the ConnectionDefName,
  ///  SqlGenerator and Schema it was built with, and the Script it writes into. Strategy, Introspector
  ///  and PlanBuilder read from a Context (constructor-injected, then unpacked into their own fields -
  ///  they do not hold a live Context reference); Context itself never references them back.
  ///  Status is a flattened shortcut to Schema.Status for the external caller, which only ever sees
  ///  this object as an opaque handle.
  /// </summary>
  IioDBBuilderContext = interface
    ['{7C1E9A44-3B27-4F6D-8E1A-5D2C9B4A6F31}']

    /// <summary>
    ///  Executes the script against the database identified by ConnectionDefName.
    /// </summary>
    /// <remarks>
    ///  If Status = stCreate, the database itself is physically created first (file created for
    ///  SQLite, "CREATE DATABASE"-equivalent for Firebird) before the script lines run, reusing the
    ///  SqlGenerator this Context was built with. Raises EioDBBuilderException if Warnings is not
    ///  empty, unless AForce = True.
    /// </remarks>
    procedure Execute(const AForce: Boolean = False);
    function GetConnectionDefName: string;
    function GetHints: IioDBBuilderSqlText;
    function GetLines: TStringList;
    function GetReconciliation: IioDBBuilderReconciliation;
    function GetScript: IioDBBuilderScript;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    function GetStatus: TioDBBuilderStatus;
    function GetWarnings: IioDBBuilderSqlText;

    property ConnectionDefName: string read GetConnectionDefName;
    property Hints: IioDBBuilderSqlText read GetHints;
    property Lines: TStringList read GetLines;
    property Reconciliation: IioDBBuilderReconciliation read GetReconciliation;
    property Script: IioDBBuilderScript read GetScript;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
    property Status: TioDBBuilderStatus read GetStatus;
    property Warnings: IioDBBuilderSqlText read GetWarnings;
  end;

  IioDBBuilderSchemaBuilder = interface
    ['{CDA1FF92-9166-48E5-BEE1-3D26EF895424}']
    procedure BuildSchema;
  end;

  IioDBBuilderSqlGenerator = interface
    ['{9B5DE886-BE08-4422-9D6C-A92ABF948CD9}']

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>Checks if database exists</summary>
    function Check_DatabaseExists: Boolean;
    /// <summary>Creates the database</summary>
    procedure Command_CreateDatabase;

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
    /// <summary>
    /// Generates SQL to list all user tables (system tables excluded).
    /// Used by the Introspector to enumerate the physical schema.
    /// </summary>
    function BuildSQL_TableList: string;

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
    /// <summary>
    /// Generates SQL to retrieve detailed field metadata from the database.
    /// </summary>
    /// <param name="ATableName">Table name (required) - returns all fields for that table</param>
    /// <param name="AFieldName">Optional field name to retrieve details for a specific field only</param>
    /// <returns>SQL query to fetch field metadata (type, length, precision, scale, default value, etc.)</returns>
    function BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string;
    /// <summary>
    /// Compares a mapped field (desired) against its physical counterpart (actual) and returns the set of
    /// attributes that differ. Pure (no node mutation, no warnings - those are emitted at translation time
    /// from the returned change-set). Per-dialect: the comparison policy differs by DBMS (e.g. SQLite
    /// ignores length/precision because of type affinity). Empty set = the field is unchanged.
    /// </summary>
    function Compare_Field(const AMappedField, APhysicalField: IioDBBuilderSchemaField): TioDBBuilderFieldChanges;
    /// <summary>
    /// Translates a schema field's default value to its SQL representation.
    /// </summary>
    /// <param name="AField">The field schema containing the default value</param>
    /// <returns>SQL representation of the default value, or empty string if no default exists</returns>
    function Translate_SchemaField_To_DefaultValue(const AField: IioDBBuilderSchemaField): String;
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
    /// <summary>
    /// Returns SQL to retrieve the list of indexes with basic info (name, unique, orientation).
    /// CONTRACT: it must return ONLY the standalone indexes that iORM manages and that can be dropped
    /// with a plain DROP INDEX - it must EXCLUDE the indexes that back a PK/UNIQUE/FK constraint (those
    /// cannot be dropped directly on most DBMS and are removed together with their constraint). Each
    /// dialect expresses the exclusion in its own catalog terms (SQLite: sql IS NOT NULL; Firebird:
    /// NOT EXISTS on RDB$RELATION_CONSTRAINTS; etc.). The Introspector (which populates the physical
    /// index nodes the rebuild drops by name) and Check_TableHasIndexesInDB rely on this.
    /// </summary>
    /// <param name="ATableName">
    /// Optional table name filter. If empty, returns all indexes from DB.
    /// If specified, returns indexes for that table only.
    /// </param>
    /// <returns>SQL query to retrieve index list</returns>
    function BuildSQL_IndexList(const ATableName: string = ''): string;
    /// <summary>
    /// Compares a mapped index (desired) against its physical counterpart (actual) and returns the set of
    /// attributes that differ (unique / orientation / field list). Generic across dialects: the physical
    /// index has already been normalized into a node by the Introspector, so this is a plain node-vs-node
    /// comparison. Empty set = the index is unchanged.
    /// </summary>
    function Compare_Index(const AMappedIndex, APhysicalIndex: IioDBBuilderSchemaIndex): TioDBBuilderIndexChanges;
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
    /// Translates a foreign key action enum to its SQL representation.
    /// </summary>
    /// <param name="AForeignKey">The foreign key schema</param>
    /// <param name="AFKAction">The FK action (ON DELETE/ON UPDATE)</param>
    /// <returns>SQL action string (e.g., "CASCADE", "SET NULL", "NO ACTION")</returns>
    /// <exception cref="EioGenericException">Raised if AFKAction has an unexpected value</exception>
    function Translate_SchemaFK_To_FKvalue(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;
    /// <summary>
    /// Generates the foreign key constraint name from table and FK schema information.
    /// </summary>
    /// <param name="ATable">The table schema (must not be nil)</param>
    /// <param name="AForeignKey">The foreign key schema (must not be nil)</param>
    /// <returns>The FK constraint name (uppercase)</returns>
    /// <exception cref="EioGenericException">Raised if ATable or AForeignKey is nil</exception>
    function Translate_SchemaTableAndFK_To_FKName(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;

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
    /// <summary>
    /// Inspects the resolved schema and emits key-generation-strategy diagnostics into
    /// AScript (informational, non-blocking Hints) about fallbacks already applied by
    /// Resolve_KeyGenerationStrategy at schema-build time. Lives here (not on the Strategy) because
    /// compatibility is a DBMS-capability concern, which is exactly what the SqlGenerator + DBMSInfo
    /// already model.
    /// </summary>
    procedure Hint_KeyGenerationCompatibility(const ASchema: IioDBBuilderSchema; const AScript: IioDBBuilderScript);
    /// <summary>
    /// Resolves the requested key generation strategy to an effective strategy.
    /// If ARequestedStrategy is kgsAuto, returns the DBMS-specific default strategy.
    /// Otherwise, returns ARequestedStrategy unchanged.
    /// </summary>
    function Resolve_KeyGenerationStrategy(const ARequestedStrategy: TioKeyGenerationStrategyType): TioKeyGenerationStrategyType;
    /// <summary>Returns True if the database supports IDENTITY columns</summary>
    function Supports_Identity: Boolean;
    /// <summary>Returns True if the database supports SEQUENCE objects</summary>
    function Supports_Sequence: Boolean;

    // ==========================================================
    // ALTER TABLE CAPABILITY METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Returns the DBMS-specific list of forbidden field-type conversions, formatted as
    /// '[old->new]' tokens (e.g. '[varchar->integer]'). Empty when the DBMS declares none.
    /// This is a DBMS trait: it belongs to the SqlGenerator, alongside the other Supports_*/
    /// capability data. Consumed by Strategy.Base.Warning_UnsafeTypeConversion.
    /// </summary>
    function GetInvalidFieldTypeConversions: string;
    /// <summary>Returns True if the database permits BLOB subtype changes via ALTER COLUMN</summary>
    function Supports_AlterBlobSubtype: Boolean;
    /// <summary>Returns True if the database supports ALTER COLUMN SET/DROP NOT NULL</summary>
    function Supports_AlterNotNull: Boolean;
    /// <summary>
    /// True if the DBMS can restructure a table in place with ALTER TABLE (Firebird, MS SQL Server, ...);
    /// False if it cannot and needs the rename-create-copy rebuild for any structural change (SQLite).
    /// This is the DBMS-capability axis that selects the PlanBuilder shape (incremental vs rebuild) and
    /// mirrors the WithAlterTable/WithoutAlterTable Strategy split.
    /// </summary>
    function Supports_AlterTable: Boolean;

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
    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function Check_DatabaseExists: Boolean;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable);

    // ==========================================================
    // ENTRY POINTS
    // ----------------------------------------------------------
    /// <summary>
    ///  The single public entry point: wraps GenerateScript_Body between Context.Script.ScriptBegin
    ///  and Context.Script.ScriptEnd. Trusts Context.Reconciliation.MappedSchema.Status as given - it neither forces it
    ///  nor emits any mode-related warning. Mode selection (forcing the whole schema to stCreate for
    ///  a documentation/baseline script, flagging the result so Context.Execute refuses to run it
    ///  without AForce = True) is the DBBuilder's job, done on Context before this is called.
    /// </summary>
    procedure GenerateScript;
  end;

  /// <summary>
  ///  Reads the live database catalog and builds the Physical branch of the reconciliation: a schema
  ///  whose table/field/index/foreign-key nodes mirror what actually exists in the database (never the
  ///  ORM maps). It stamps no Status - that is the PlanBuilder's job (single-writer). If the database
  ///  does not exist yet the returned schema is empty. Per-dialect (SQLite, Firebird).
  /// </summary>
  IioDBBuilderIntrospector = interface
    ['{2B7E9C64-1A3D-4E58-9F0B-6D2C5A8E4F13}']
    function Introspect: IioDBBuilderSchema;
  end;

  /// <summary>
  ///  Diffs the MappedSchema (desired) against the PhysicalSchema (actual) and produces the Plan: the
  ///  ordered list of operations that converge the database to the ORM maps. Sole writer of the nodes'
  ///  Status (informational: stCreate/stDrop/stUpdate/stClean), but the Plan - not the Status - is what
  ///  the Strategy consumes. Reads only the two in-memory schemas plus the SqlGenerator (for the dialect
  ///  name computations and the Supports_AlterTable capability), never the database, so it is testable
  ///  without a live connection. An abstract base (TioDBBuilderPlanBuilderBase, holding the shared diff
  ///  primitives Find_*/Check_ForeignKeyModified) with two concrete shapes selected by Supports_AlterTable,
  ///  mirroring the WithAlterTable/WithoutAlterTable Strategy split: the INCREMENTAL shape emits fine-grained
  ///  ops (create/alter field, create/drop index, ...) for DBMS that can ALTER a table in place; the REBUILD
  ///  shape emits rename-create-copy ops for DBMS that cannot (SQLite).
  /// </summary>
  IioDBBuilderPlanBuilder = interface
    ['{7A1D3E52-9C4B-4F60-8A2D-5E6F1B3C9D74}']
    function Build: IioDBBuilderPlan;
  end;

  IioDBBuilder = interface
    ['{6B1F3A0D-6C6E-4E1A-9F0C-2A6B7E0F9C2D}']

    { Naming convention (DBBuilder entry point - mirrors the SqlGenerator/Strategy families documented
      in CLAUDE.md and in the banners of iORM.DBBuilder.SqlGenerator.Base / iORM.DBBuilder.Strategy.Base):
        Prepare_*       the DBBuilder's only public entry points. Each is fully self-contained and
                         stateless: it builds a fresh SqlGenerator, Schema and Script locally from
                         the ConnectionDefName/mode parameters passed in, wraps them in a Context
                         and returns it (Script not-yet-executed). Context.Status reflects the
                         outcome. The DBBuilder itself holds no per-call state and instances may be
                         reused/discarded freely.
      Execute/guard behavior (warnings guard, physical database creation, actual execution) lives on
      IioDBBuilderContext.Execute, not here - see its doc comment.
      Layout: grouped under domain banners, alphabetical within each group (project-wide convention). }

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>
    ///  Builds a full "create from scratch" SQL script regardless of actual database state, for
    ///  documentation/baseline purposes. Self-contained: does not introspect the database (only the
    ///  lazy DBMSInfo version query touches the DB). The resulting script must NOT be executed
    ///  against an existing database.
    /// </summary>
    function Prepare_ForceCreateDB(const AConnectionDefName: String;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderMode): IioDBBuilderContext;
    /// <summary>
    ///  Self-contained: builds the schema from the entity maps, analyzes it against the live
    ///  database catalog, and produces a create-or-update SQL script driven by the resulting
    ///  status. The returned Context's Status reflects the outcome.
    /// </summary>
    function Prepare_SyncDBStruct(const AConnectionDefName: String;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderMode): IioDBBuilderContext;

    // ==========================================================
    // INDEX RELATED METHODS  (backlog - placeholder only, not implemented yet)
    // ----------------------------------------------------------
    // function Prepare_ForceAddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderScript;
    // function Prepare_ForceDropIndex(const ATable: IioDBBuilderSchemaTable; const AIndexName: String): IioDBBuilderScript;
    // NOTE: SqlGenerator.BuildSQL_CreateIndex/BuildSQL_DropIndexByName are unimplemented for
    //       MSSqlServer (raise "not implemented") - this backlog item needs SqlGenerator.MSSqlServer
    //       work too, not just a DBBuilder-level addition.
  end;


implementation

end.



