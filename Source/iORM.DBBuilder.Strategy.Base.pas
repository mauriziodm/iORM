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
unit iORM.DBBuilder.Strategy.Base;

interface

uses
  iORM.Attributes,
  iORM.DBBuilder.Interfaces,
  iORM.DB.Interfaces;

type

  TioDBBuilderStrategyBase = class(TInterfacedObject, IioDBBuilderStrategy)
  private
    FConnectionDefName: string;
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;

    function GetConnectionDefName: string;
    function GetSchema: IioDBBuilderSchema;
    function GetScript: IioDBBuilderSqlScript;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    // Helper method for existence queries (common pattern)
    function _ExecuteExistsQuery(const ASql: string): Boolean;
  protected
    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    procedure CreateDatabase; virtual;
    function DatabaseExists: Boolean; virtual;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateOrAlterTables; virtual;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); virtual;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; virtual;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    procedure CreateOrAlterFields(const ATable: IioDBBuilderSchemaTable); virtual;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    // Field change detection methods (common to all databases)
    function IsFieldTypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldType, ANewFieldType: String): Boolean; virtual;
    function IsFieldNotNullChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AIsPermitted: Boolean): Boolean; virtual;
    function IsFieldBlobSubtypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldBlobSubtype, ANewBlobSubtype: String; const AIsPermitted: Boolean): Boolean; virtual;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    procedure CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex); virtual;
    procedure CreateOrAlterIndexes; virtual;
    procedure CreateOrAlterTableIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Mode-aware drop of all indexes of a single table.
    /// Dispatches to the appropriate Force* mechanic based on Schema.IndexesMode:
    ///   ifmDisabled: raises EioDBBuilderException — index management is disabled
    ///     by configuration, an explicit drop request is a configuration conflict.
    ///   ifmEnabled (conservative): calls ForceDropTableIndexesFromSchema —
    ///     drops only indexes still defined in the schema, leaves orphans untouched.
    ///   ifmEnabledStrict: calls ForceDropTableIndexesFromDB —
    ///     drops every index physically present in the DB for this table,
    ///     including orphans and manually-added ones.
    /// Intended as the public API for callers that want the configured mode to
    /// govern the operation. Internal sync flows that know which mechanic they
    /// need can call the Force* methods directly instead.
    /// </summary>
    procedure DropTableIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex); virtual;
    procedure DropIndexByName(const AIndexName: string); virtual;
    /// <summary>
    /// Drops the indexes of a single table based on the schema definitions
    /// (only indexes still present in the schema are dropped) and marks them
    /// as stCreate so they get recreated by CreateOrAlterIndexes.
    /// Force variant: this method does NOT consult Schema.IndexesMode — it
    /// always operates. Orphans (indexes in DB but not in schema) and manually
    /// added indexes are left untouched.
    /// </summary>
    procedure ForceDropTableIndexesFromSchema(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Drops the indexes of a single table by querying the actual DB catalog
    /// and marks all schema indexes for the table as stCreate so they get
    /// recreated by CreateOrAlterIndexes.
    /// Force variant: this method does NOT consult Schema.IndexesMode — it
    /// always operates. Every index physically present on the table is dropped,
    /// including orphans (no longer in the schema) and manually added ones.
    /// </summary>
    procedure ForceDropTableIndexesFromDB(const ATable: IioDBBuilderSchemaTable); virtual;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; virtual; abstract;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; virtual; abstract;

    // ==========================================================
    // SEQUENCE RELATED METHODS
    // ----------------------------------------------------------
    function SequenceExists(const ASequenceName: string): Boolean; virtual;
    procedure CreateTableSequence(const ATable: IioDBBuilderSchemaTable); virtual;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    procedure CreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK); virtual;
    procedure CreateOrAlterForeignKeys; virtual;
    procedure CreateOrAlterTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure DropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK); virtual;
    procedure DropForeignKeyByName(const ATableName, AForeignKeyName: string); virtual;
    /// <summary>
    /// Mode-aware drop of all foreign keys of a single table.
    /// Dispatches to the appropriate Force* mechanic based on Schema.ForeignKeysMode:
    ///   ifmDisabled: raises EioDBBuilderException — FK management is disabled
    ///     by configuration, an explicit drop request is a configuration conflict.
    ///   ifmEnabled (conservative): calls ForceDropTableForeignKeysFromSchema —
    ///     drops only FKs still defined in the schema, leaves orphans untouched.
    ///   ifmEnabledStrict: calls ForceDropTableForeignKeysFromDB —
    ///     drops every FK physically present in the DB for this table,
    ///     including orphans and manually-added ones.
    /// Intended as the public API for callers that want the configured mode to
    /// govern the operation. Internal sync flows that know which mechanic they
    /// need can call the Force* methods directly instead.
    /// </summary>
    procedure DropTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Drops the FKs of a single table based on the schema definitions
    /// (only FKs still present in the schema are dropped) and marks them as
    /// stCreate so they get recreated by CreateOrAlterForeignKeys.
    /// Force variant: this method does NOT consult Schema.ForeignKeysMode — it
    /// always operates. Orphans (FKs in DB but not in schema) and manually
    /// added FKs are left untouched.
    /// </summary>
    procedure ForceDropTableForeignKeysFromSchema(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Drops the FKs of a single table by querying the actual DB catalog and
    /// marks all schema FKs for the table as stCreate so they get recreated
    /// by CreateOrAlterForeignKeys.
    /// Force variant: this method does NOT consult Schema.ForeignKeysMode — it
    /// always operates. Every FK physically present on the table is dropped,
    /// including orphans (FKs whose structural properties changed and produced
    /// a new hash name) and manually added ones.
    /// </summary>
    procedure ForceDropTableForeignKeysFromDB(const ATable: IioDBBuilderSchemaTable); virtual;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;

    // ==========================================================
    // HINTS RELATED METHODS
    // ----------------------------------------------------------
    // These helpers append a human-readable message to Script.Hints during the
    // DBBuilder analysis phase. Hints are purely informational and non-blocking:
    // they surface a schema change that iORM detected and WILL apply, but whose
    // side effects (e.g. a fallback key generation strategy, a potential impact
    // on existing data) the developer should be aware of. They are the
    // counterpart of Script.Warnings (which flag changes NOT applied
    // automatically) and are always emitted through these methods to keep the
    // message wording consistent across every RDBMS strategy.
    /// <summary>
    /// Emits a hint noting that a field's NOT NULL setting changed from FALSE to
    /// TRUE without a DEFAULT value being specified, which may impact existing
    /// data. Called by IsFieldNotNullChanged.
    /// </summary>
    procedure Hint_NotNullPotentialDataImpact(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);

    // ==========================================================
    // WARNINGS RELATED METHODS
    // ----------------------------------------------------------
    // These helpers append a human-readable message to Script.Warnings during
    // the DBBuilder analysis phase. Warnings are non-blocking: they surface a
    // schema change that iORM detected but will NOT (or cannot) apply
    // automatically, so the developer can review/handle it manually before the
    // create-or-alter script is run. They are the counterpart of Script.Hints
    // (purely informational) and are always emitted through these methods to
    // keep the message wording consistent across every RDBMS strategy.
    /// <summary>
    /// Emits a warning stating that a field attribute (named by AValueName, e.g.
    /// 'blob sub-type') changed from AOldValue to ANewValue but the change is NOT
    /// allowed and will not be applied automatically. This is the generic
    /// "attribute cannot be altered" notice; the caller decides when the change
    /// is disallowed (e.g. IsFieldBlobSubtypeChanged when AIsPermitted is False).
    /// </summary>
    procedure Warning_ChangeNotAllowed(const AValueName, AOldValue, ANewValue: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
    /// <summary>
    /// Emits a warning when a numeric field attribute (identified by AValueName,
    /// e.g. 'field LENGTH', 'field PRECISION', 'field DECIMALS') is being shrunk,
    /// i.e. ANewValue &lt; AOldValue. A reduction risks data truncation, so the
    /// change is flagged for manual review; nothing is added when the value grows
    /// or stays the same. Called by the field length/precision/decimals checks in
    /// the WithAlterTable strategy.
    /// </summary>
    procedure Warning_PotentialDataTruncation(const AValueName: String; const AOldValue, ANewValue: Integer; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
    /// <summary>
    /// Emits a warning when a field's type is changing from AOldFieldType to
    /// ANewFieldType AND that specific conversion is blacklisted by the current
    /// RDBMS. The list of forbidden conversions (formatted as '[old->new]' tokens)
    /// is obtained from SqlGenerator.GetInvalidFieldTypeConversions; the warning is added only
    /// when the '[AOldFieldType->ANewFieldType]' token is found in that list,
    /// signalling a conversion the database cannot perform safely/automatically.
    /// Called by IsFieldTypeChanged.
    /// </summary>
    procedure Warning_UnsafeTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldType, ANewFieldType: String);
    /// <summary>
    /// Emits a warning stating that a field's NOT NULL setting changed but the
    /// change cannot be applied automatically by this RDBMS strategy. Called by
    /// IsFieldNotNullChanged when the change is not permitted (AIsPermitted False).
    /// </summary>
    procedure Warning_NotNullChangeNotAllowed(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);

    procedure GenerateScript; virtual; abstract;

    property ConnectionDefName: string read GetConnectionDefName;
    property Schema: IioDBBuilderSchema read GetSchema;
    property Script: IioDBBuilderSqlScript read GetScript;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);

    procedure GenerateDatabaseScript; virtual;
    procedure ForceGenerateCreateDatabaseScript; virtual;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,

  iORM.Exceptions,
  iORM.Utilities,
  iORM.CommonTypes,
  iORM.DB.ConnectionContainer,
  iORM.DB.QueryEngine

  ;

{ TioDBBuilderStrategyBase }

function TioDBBuilderStrategyBase.SequenceExists(const ASequenceName: string): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_SequenceExists(ASequenceName), True);
  Result := LQuery.Fields[0].AsInteger > 0;
end;

procedure TioDBBuilderStrategyBase.CreateTableSequence(const ATable: IioDBBuilderSchemaTable);
begin
  // Precondition: ATable.UsesSequenceForKeyGeneration must be True. The caller
  // is responsible for that check — consistent with how BuildSchemaTable in
  // Schema.Builder gates SequenceAddIfNotExists. Calling this method on an
  // Identity-keyed table would raise EioDBBuilderException via GetSequenceName.
  if not SequenceExists(ATable.GetSequenceName) then
    Script.Body.Add(SqlGenerator.BuildSQL_CreateSequence(ATable.GetSequenceName));
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
  begin
    if taForeignKeys in LTable.Changes then
      CreateOrAlterTableForeignKeys(LTable);
  end;
end;

procedure TioDBBuilderStrategyBase.DropTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
begin
  // Mode-aware dispatcher: routes to the Force* mechanic appropriate for the
  // current Schema.ForeignKeysMode. The Force* methods bypass mode checks and
  // do the actual work; this entry point preserves the contract that the mode
  // configured on TioDBBuilderProperty governs externally visible behavior.
  case Schema.ForeignKeysMode of
    ifmDisabled:
      // Drop is incompatible with the configured intent ("do not manage FKs").
      // Raise rather than silently no-op so the caller gets immediate feedback.
      raise EioDBBuilderException.Create(ClassName, 'DropTableForeignKeys',
        'Foreign key management is disabled (ForeignKeysMode = ifmDisabled), ' +
        'cannot perform DropTableForeignKeys on table ''' + ATable.Name + '''.');
    ifmEnabled:
      ForceDropTableForeignKeysFromSchema(ATable);
    ifmEnabledStrict:
      ForceDropTableForeignKeysFromDB(ATable);
  end;
end;

procedure TioDBBuilderStrategyBase.ForceDropTableForeignKeysFromSchema(const ATable: IioDBBuilderSchemaTable);
var
  LFK: IioDBBuilderSchemaFK;
begin
  // Bypass of ForeignKeysMode: this method always operates. Drops only the FKs
  // that are still defined in the schema; orphans (FKs in DB but not in schema)
  // and manually added FKs are left untouched — that is the conservative
  // semantic when this mechanic is selected.
  for LFK in ATable.ForeignKeys.Values do
  begin
    if ForeignKeyExists(ATable, LFK) then
    begin
      DropForeignKey(ATable, LFK);
      // Mark dropped FKs as stCreate so CreateOrAlterForeignKeys recreates them.
      LFK.Status := stCreate;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.ForceDropTableForeignKeysFromDB(const ATable: IioDBBuilderSchemaTable);
var
  LQuery: IioQuery;
  LFK: IioDBBuilderSchemaFK;
begin
  // Bypass of ForeignKeysMode: this method always operates. Queries the DB
  // catalog for every FK currently defined on this table, then drops them all
  // by their actual DB name. Catches orphans (FKs whose structural properties
  // changed and produced a new hash name) and manually added FKs as well.
  // BuildSQL_FKList columns: [0]=table_name, [1]=constraint_name,
  // [2]=on_update, [3]=on_delete. .Trim handles RDBMS that right-pad CHAR
  // columns (e.g. Firebird).
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FKList(ATable.Name), True);
  while not LQuery.Eof do
  begin
    DropForeignKeyByName(ATable.Name, LQuery.Fields[1].AsString.Trim);
    LQuery.Next;
  end;

  // Mark all schema FKs as stCreate so they get recreated by CreateOrAlterForeignKeys.
  for LFK in ATable.ForeignKeys.Values do
    LFK.Status := stCreate;
end;

/// <summary>
/// Generates the SQL statements to create or recreate the foreign keys of a single table.
/// Only FKs marked as stCreate or stUpdate are processed; modified FKs (stUpdate) are
/// dropped first and then recreated. FKs of new tables already have stCreate status
/// because the analyzer sets it without querying the DB.
/// </summary>
procedure TioDBBuilderStrategyBase.CreateOrAlterTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LFK: IioDBBuilderSchemaFK;
begin
  for LFK in ATable.ForeignKeys.Values do
  begin
    // Skip unchanged FKs
    if LFK.Status = stClean then
      Continue;
    // Drop the existing FK first when it needs to be recreated with changes
    if LFK.Status = stUpdate then
      DropForeignKey(ATable, LFK);
    // Create the FK (both for new and modified ones)
    CreateForeignKey(ATable, LFK);
  end;
end;

/// <summary>
/// Generates index SQL for all tables that have index changes (taIndexes in Changes).
/// This covers both new tables (whose indexes are set to stCreate by the analyzer)
/// and existing tables with new or modified indexes.
/// </summary>
procedure TioDBBuilderStrategyBase.CreateOrAlterIndexes;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
  begin
    if taIndexes in LTable.Changes then
      CreateOrAlterTableIndexes(LTable);
  end;
end;

procedure TioDBBuilderStrategyBase.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  Script.Body.AddTitle(Format('Altering table ''%s''', [ATable.Name]));
end;

constructor TioDBBuilderStrategyBase.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema;
  const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  if not Assigned(ASchema) then
    raise EioInvalidArgumentException.Create(ClassName, 'Create', 'ASchema is not assigned.');

  if not Assigned(ASqlGenerator) then
    raise EioInvalidArgumentException.Create(ClassName, 'Create', 'ASqlGenerator is not assigned.');

  FConnectionDefName := AConnectionDefName;
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
end;

function TioDBBuilderStrategyBase.GetScript: IioDBBuilderSqlScript;
begin
  Result := Schema.Script;
end;

procedure TioDBBuilderStrategyBase.CreateDatabase;
begin
  SqlGenerator.Command_CreateDatabase;
end;

function TioDBBuilderStrategyBase.DatabaseExists: Boolean;
begin
  Result := SqlGenerator.Command_DatabaseExists;
end;

procedure TioDBBuilderStrategyBase.CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  for LForeignKey in ATable.ForeignKeys.Values do
    CreateForeignKey(ATable, LForeignKey);
end;

procedure TioDBBuilderStrategyBase.CreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK);
begin
  Script.Body.Add(SqlGenerator.BuildSQL_CreateFK(ATable, AForeignKey));
end;

procedure TioDBBuilderStrategyBase.DropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK);
begin
  Script.Body.Add(SqlGenerator.BuildSQL_DropFK(ATable, AForeignKey));
end;

procedure TioDBBuilderStrategyBase.DropForeignKeyByName(const ATableName, AForeignKeyName: string);
begin
  Script.Body.Add(SqlGenerator.BuildSQL_DropFKbyName(ATableName, AForeignKeyName));
end;

/// <summary>
/// Generates the SQL statements to create or recreate the indexes of a single table.
/// Only indexes marked as stCreate or stUpdate are processed; modified indexes (stUpdate)
/// are dropped first and then recreated. Indexes of new tables already have stCreate
/// status because the analyzer sets it without querying the DB.
/// </summary>
procedure TioDBBuilderStrategyBase.CreateOrAlterTableIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LIndex in ATable.Indexes.Values do
  begin
    // Skip unchanged indexes
    if LIndex.Status = stClean then
      Continue;
    // Drop the existing index first when it needs to be recreated with changes
    if LIndex.Status = stUpdate then
      DropIndex(ATable, LIndex);
    // Create the index (both for new and modified ones)
    CreateIndex(ATable, LIndex);
  end;
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterFields(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  for LField in ATable.Fields do
  begin
    case LField.Status of
      stCreate:
        Script.Body.Add(SqlGenerator.BuildSQL_CreateField(ATable, LField));
      stUpdate:
        Script.Body.Add(SqlGenerator.BuildSQL_AlterField(ATable, LField));
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
  begin
    case LTable.Status of
      stCreate:
        CreateTable(LTable);
      stUpdate:
        // Index-only and FK-only changes are skipped: indexes and foreign keys
        // are always handled separately in GenerateScript.
        if not (LTable.Changes <= [taIndexes, taForeignKeys]) then
          AlterTable(LTable);
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  Script.Body.AddTitle(Format('Creating table ''%s''', [ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex);
begin
  Script.Body.Add(SqlGenerator.BuildSQL_CreateIndex(ATable, AIndex));
end;

procedure TioDBBuilderStrategyBase.DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex);
begin
  DropIndexByName(SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex));
end;

procedure TioDBBuilderStrategyBase.DropIndexByName(const AIndexName: string);
begin
  Script.Body.Add(SqlGenerator.BuildSQL_DropIndexByName(AIndexName));
end;

procedure TioDBBuilderStrategyBase.DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
begin
  // Mode-aware dispatcher: routes to the Force* mechanic appropriate for the
  // current Schema.IndexesMode. The Force* methods bypass mode checks and do
  // the actual work; this entry point preserves the contract that the mode
  // configured on TioDBBuilderProperty governs externally visible behavior.
  case Schema.IndexesMode of
    ifmDisabled:
      // Drop is incompatible with the configured intent ("do not manage indexes").
      // Raise rather than silently no-op so the caller gets immediate feedback.
      raise EioDBBuilderException.Create(ClassName, 'DropTableIndexes',
        'Index management is disabled (IndexesMode = ifmDisabled), ' +
        'cannot perform DropTableIndexes on table ''' + ATable.Name + '''.');
    ifmEnabled:
      ForceDropTableIndexesFromSchema(ATable);
    ifmEnabledStrict:
      ForceDropTableIndexesFromDB(ATable);
  end;
end;

procedure TioDBBuilderStrategyBase.ForceDropTableIndexesFromSchema(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  // Bypass of IndexesMode: this method always operates. Drops only the indexes
  // that are still defined in the schema; orphans (indexes in DB but not in
  // schema) and manually added indexes are left untouched — that is the
  // conservative semantic when this mechanic is selected.
  for LIndex in ATable.Indexes.Values do
  begin
    if IndexExists(ATable, LIndex) then
    begin
      DropIndex(ATable, LIndex);
      // Mark dropped indexes as stCreate so CreateOrAlterIndexes recreates them.
      LIndex.Status := stCreate;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.ForceDropTableIndexesFromDB(const ATable: IioDBBuilderSchemaTable);
var
  LQuery: IioQuery;
  LIndex: IioDBBuilderSchemaIndex;
begin
  // Bypass of IndexesMode: this method always operates. Queries the DB catalog
  // for every index currently defined on this table, then drops them all by
  // their actual DB name. Catches orphans (indexes whose [ioIndex] attribute
  // was removed) and manually added indexes alike.
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(ATable.Name), True);
  while not LQuery.Eof do
  begin
    DropIndexByName(LQuery.Fields[0].AsString);
    LQuery.Next;
  end;

  // Mark all schema indexes as stCreate so they get recreated by CreateOrAlterIndexes.
  for LIndex in ATable.Indexes.Values do
    LIndex.Status := stCreate;
end;

procedure TioDBBuilderStrategyBase.GenerateDatabaseScript;
begin
  // Status-driven: does NOT touch Schema.Status, it trusts what the DBAnalyzer determined
  // (stCreate for a brand-new DB, stUpdate for an existing one with changes). GenerateScript
  // branches internally on Schema.Status, so this single entry point covers both cases.
  Script.ScriptBegin(ConnectionDefName, SqlGenerator.DBMSInfo);

  GenerateScript;

  Script.ScriptEnd;
end;

procedure TioDBBuilderStrategyBase.ForceGenerateCreateDatabaseScript;
begin
  // Force variant: ignores the analyzed status and produces a coherent full "create from scratch"
  // script by marking the whole schema tree (schema + tables + fields + indexes + FKs) as stCreate,
  // mirroring what the DBAnalyzer does on a non-existent DB. For documentation/baseline only: the
  // resulting script must NOT be executed against an existing database.
  Schema.MarkAllForCreation;

  Script.ScriptBegin(ConnectionDefName, SqlGenerator.DBMSInfo);

  GenerateScript;

  Script.ScriptEnd;
end;

function TioDBBuilderStrategyBase.GetConnectionDefName: string;
begin
  Result := FConnectionDefName;
end;

function TioDBBuilderStrategyBase.GetSchema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

function TioDBBuilderStrategyBase.GetSqlGenerator: IioDBBuilderSqlGenerator;
begin
  Result := FSqlGenerator;
end;

procedure TioDBBuilderStrategyBase.Warning_UnsafeTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldType, ANewFieldType: String);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
  if ContainsText(SqlGenerator.GetInvalidFieldTypeConversions, LRequiredConversion) then
    Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''',
      [ATable.Name, AField.FieldName, AOldFieldType, ANewFieldType]));
end;

procedure TioDBBuilderStrategyBase.Warning_ChangeNotAllowed(const AValueName, AOldValue, ANewValue: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
    [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyBase.Warning_PotentialDataTruncation(const AValueName: String; const AOldValue, ANewValue: Integer;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue < AOldValue then
    Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The new %s value becomes smaller than the old one (old = %d, new = %d)',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyBase.Warning_NotNullChangeNotAllowed(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The NOT NULL setting cannot be changed automatically', [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategyBase.Hint_NotNullPotentialDataImpact(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Script.Hints.Add(Format('Table ''%s'' field ''%s'' --> The not null setting is changed from FALSE to TRUE and a DEFAULT value has not been specified',
    [ATable.Name, AField.FieldName]));
end;

function TioDBBuilderStrategyBase.IsFieldTypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldType, ANewFieldType: String): Boolean;
begin
  Result := not SameText(AOldFieldType, ANewFieldType); // case-insensitive comparison
  if Result then
  begin
    AField.AddAltered(alFieldType);
    Warning_UnsafeTypeConversion(ATable, AField, AOldFieldType, ANewFieldType);
  end;
end;

function TioDBBuilderStrategyBase.IsFieldNotNullChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AIsPermitted: Boolean): Boolean;
begin
  // Check if the NOT NULL constraint has changed between the old and new field definitions
  Result := AOldFieldNotNull <> ANewFieldNotNull;
  if Result then
  begin
    // Mark the field as having its NOT NULL constraint altered
    AField.AddAltered(alFieldNotNull);
    if AIsPermitted then
    begin
      // If the field is now NOT NULL but wasn't before, and no default value is specified,
      // add a hint to alert the user about the potential data impact
      if ANewFieldNotNull and not AField.FieldDefaultExists then
        Hint_NotNullPotentialDataImpact(ATable, AField);
    end
    else
      // If the NOT NULL change is not permitted, add a warning to indicate it cannot be automatically changed
      Warning_NotNullChangeNotAllowed(ATable, AField);
  end;
end;

function TioDBBuilderStrategyBase.IsFieldBlobSubtypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldBlobSubtype, ANewBlobSubtype: String; const AIsPermitted: Boolean): Boolean;
begin
  Result := not SameText(AOldBlobSubtype, ANewBlobSubtype); // case-insensitive comparison
  if Result then
  begin
    AField.AddAltered(alFieldType);
    if not AIsPermitted then
      Warning_ChangeNotAllowed('blob sub-type', AOldBlobSubtype, ANewBlobSubtype, AField, ATable);
  end;
end;

function TioDBBuilderStrategyBase._ExecuteExistsQuery(const ASql: string): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, ASql, True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyBase.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := _ExecuteExistsQuery(SqlGenerator.BuildSQL_TableExists(ATable.Name));
end;

end.
