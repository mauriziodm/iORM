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
    FContext: IioDBBuilderContext;

    function GetContext: IioDBBuilderContext;
    // Helper method for existence queries (common pattern)
    function _ExecuteExistsQuery(const ASql: string): Boolean;
  protected
    { Naming convention (role-based prefixes, mirrors the Context.SqlGenerator family - see
      iORM.DBBuilder.Context.SqlGenerator.Base). A method's prefix encodes its ROLE within the
      DB-sync workflow, independently of whether it is exposed on IioDBBuilderStrategy:
        GenerateScript_*     public entry point (Sync / ForceCreate)
        Process_*            orchestration: iterates the schema or dispatches by mode
        ScriptWrite_*        emits a single DDL/DML statement into Context.Script.Body
        Force_*              forces a Status value on schema elements directly, overriding
                              whatever the entity-map-vs-DB comparison would have produced
                              (here always paired with a drop mechanic that also bypasses
                              the configured Indexes/FK mode)
        Check_*              interrogates the DB catalog / detects a change, returns Boolean
        Warning_* / Hint_*   diagnostics appended to Context.Script.Warnings / Context.Script.Hints
      Plain accessors and private helpers are sanctioned exceptions and keep plain Delphi
      verb naming (Get*, _ExecuteExistsQuery). Interface membership is orthogonal to the prefix.
      Layout (mirrors the Context.SqlGenerator family): methods are grouped under domain banners
      (DATABASE / TABLE / FIELD / INDEX / SEQUENCE / FOREIGN KEY / ...) and kept alphabetical
      within each group. This applies to the declarations (IioDBBuilderStrategy + every class
      section: derived strategies use the same banners); implementations are not ordered.
      The same "Force = imposed Status, not derived" concept is reused, in plain-verb form
      (no underscore prefix, matching that unit's own style), by IioDBBuilderSchema/
      IioDBBuilderSchemaTable's ForceCreateStatus/ForceIndexesCreateStatus/
      ForceForeignKeysCreateStatus. }

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function Check_DatabaseExists: Boolean; virtual;
    procedure ScriptWrite_CreateDatabase; virtual;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    function Check_TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    procedure Process_Tables; virtual;
    procedure ScriptWrite_AlterTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable); virtual;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function Check_FieldBlobSubtypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldBlobSubtype, ANewBlobSubtype: String; const AIsPermitted: Boolean): Boolean; virtual;
    function Check_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function Check_FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function Check_FieldNotNullChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AIsPermitted: Boolean): Boolean; virtual;
    function Check_FieldTypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldType, ANewFieldType: String): Boolean; virtual;
    procedure Process_Fields(const ATable: IioDBBuilderSchemaTable); virtual;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    function Check_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; virtual; abstract;
    function Check_IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; virtual; abstract;
    /// <summary>
    /// Drops the indexes of a single table by querying the actual DB catalog
    /// and marks all schema indexes for the table as stCreate so they get
    /// recreated by Process_Indexes.
    /// Force variant: this method does NOT consult Context.Schema.IndexesMode — it
    /// always operates. Every index physically present on the table is dropped,
    /// including orphans (no longer in the schema) and manually added ones.
    /// </summary>
    procedure Force_DropTableIndexesFromDB(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Drops the indexes of a single table based on the schema definitions
    /// (only indexes still present in the schema are dropped) and marks them
    /// as stCreate so they get recreated by Process_Indexes.
    /// Force variant: this method does NOT consult Context.Schema.IndexesMode — it
    /// always operates. Orphans (indexes in DB but not in schema) and manually
    /// added indexes are left untouched.
    /// </summary>
    procedure Force_DropTableIndexesFromSchema(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Mode-aware drop of all indexes of a single table.
    /// Dispatches to the appropriate Force* mechanic based on Context.Schema.IndexesMode:
    ///   ifmDisabled: raises EioDBBuilderException — index management is disabled
    ///     by configuration, an explicit drop request is a configuration conflict.
    ///   ifmEnabled (conservative): calls Force_DropTableIndexesFromSchema —
    ///     drops only indexes still defined in the schema, leaves orphans untouched.
    ///   ifmEnabledStrict: calls Force_DropTableIndexesFromDB —
    ///     drops every index physically present in the DB for this table,
    ///     including orphans and manually-added ones.
    /// Intended as the public API for callers that want the configured mode to
    /// govern the operation. Internal sync flows that know which mechanic they
    /// need can call the Force* methods directly instead.
    /// </summary>
    procedure Process_DropTableIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Generates index SQL for all tables that have index changes (taIndexes in Changes).
    /// This covers both new tables (whose indexes are set to stCreate by the analyzer)
    /// and existing tables with new or modified indexes.
    /// </summary>
    procedure Process_Indexes; virtual;
    /// <summary>
    /// Generates the SQL statements to create or recreate the indexes of a single table.
    /// Only indexes marked as stCreate or stUpdate are processed; modified indexes (stUpdate)
    /// are dropped first and then recreated. Indexes of new tables already have stCreate
    /// status because the analyzer sets it without querying the DB.
    /// </summary>
    procedure Process_TableIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure ScriptWrite_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex); virtual;
    procedure ScriptWrite_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex); virtual;
    procedure ScriptWrite_DropIndexByName(const AIndexName: string); virtual;

    // ==========================================================
    // SEQUENCE RELATED METHODS
    // ----------------------------------------------------------
    function Check_SequenceExists(const ASequenceName: string): Boolean; virtual;
    procedure ScriptWrite_CreateTableSequence(const ATable: IioDBBuilderSchemaTable); virtual;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function Check_ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;
    function Check_ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; virtual; abstract;
    /// <summary>
    /// Drops the FKs of a single table by querying the actual DB catalog and
    /// marks all schema FKs for the table as stCreate so they get recreated
    /// by Process_ForeignKeys.
    /// Force variant: this method does NOT consult Context.Schema.ForeignKeysMode — it
    /// always operates. Every FK physically present on the table is dropped,
    /// including orphans (FKs whose structural properties changed and produced
    /// a new hash name) and manually added ones.
    /// </summary>
    procedure Force_DropTableForeignKeysFromDB(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Drops the FKs of a single table based on the schema definitions
    /// (only FKs still present in the schema are dropped) and marks them as
    /// stCreate so they get recreated by Process_ForeignKeys.
    /// Force variant: this method does NOT consult Context.Schema.ForeignKeysMode — it
    /// always operates. Orphans (FKs in DB but not in schema) and manually
    /// added FKs are left untouched.
    /// </summary>
    procedure Force_DropTableForeignKeysFromSchema(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>
    /// Mode-aware drop of all foreign keys of a single table.
    /// Dispatches to the appropriate Force* mechanic based on Context.Schema.ForeignKeysMode:
    ///   ifmDisabled: raises EioDBBuilderException — FK management is disabled
    ///     by configuration, an explicit drop request is a configuration conflict.
    ///   ifmEnabled (conservative): calls Force_DropTableForeignKeysFromSchema —
    ///     drops only FKs still defined in the schema, leaves orphans untouched.
    ///   ifmEnabledStrict: calls Force_DropTableForeignKeysFromDB —
    ///     drops every FK physically present in the DB for this table,
    ///     including orphans and manually-added ones.
    /// Intended as the public API for callers that want the configured mode to
    /// govern the operation. Internal sync flows that know which mechanic they
    /// need can call the Force* methods directly instead.
    /// </summary>
    procedure Process_DropTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure Process_ForeignKeys; virtual;
    /// <summary>
    /// Generates the SQL statements to create or recreate the foreign keys of a single table.
    /// Only FKs marked as stCreate or stUpdate are processed; modified FKs (stUpdate) are
    /// dropped first and then recreated. FKs of new tables already have stCreate status
    /// because the analyzer sets it without querying the DB.
    /// </summary>
    procedure Process_TableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure ScriptWrite_CreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK); virtual;
    procedure ScriptWrite_CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure ScriptWrite_DropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK); virtual;
    procedure ScriptWrite_DropForeignKeyByName(const ATableName, AForeignKeyName: string); virtual;

    // ==========================================================
    // HINTS RELATED METHODS
    // ----------------------------------------------------------
    // These helpers append a human-readable message to Context.Script.Hints during the
    // DBBuilder analysis phase. Hints are purely informational and non-blocking:
    // they surface a schema change that iORM detected and WILL apply, but whose
    // side effects (e.g. a fallback key generation strategy, a potential impact
    // on existing data) the developer should be aware of. They are the
    // counterpart of Context.Script.Warnings (which flag changes NOT applied
    // automatically) and are always emitted through these methods to keep the
    // message wording consistent across every RDBMS strategy.
    /// <summary>
    /// Emits a hint noting that a field's NOT NULL setting changed from FALSE to
    /// TRUE without a DEFAULT value being specified, which may impact existing
    /// data. Called by Check_FieldNotNullChanged.
    /// </summary>
    procedure Hint_NotNullPotentialDataImpact(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);

    // ==========================================================
    // WARNINGS RELATED METHODS
    // ----------------------------------------------------------
    // These helpers append a human-readable message to Context.Script.Warnings during
    // the DBBuilder analysis phase. Warnings are non-blocking: they surface a
    // schema change that iORM detected but will NOT (or cannot) apply
    // automatically, so the developer can review/handle it manually before the
    // create-or-alter script is run. They are the counterpart of Context.Script.Hints
    // (purely informational) and are always emitted through these methods to
    // keep the message wording consistent across every RDBMS strategy.
    /// <summary>
    /// Emits a warning stating that a field attribute (named by AValueName, e.g.
    /// 'blob sub-type') changed from AOldValue to ANewValue but the change is NOT
    /// allowed and will not be applied automatically. This is the generic
    /// "attribute cannot be altered" notice; the caller decides when the change
    /// is disallowed (e.g. Check_FieldBlobSubtypeChanged when AIsPermitted is False).
    /// </summary>
    procedure Warning_ChangeNotAllowed(const AValueName, AOldValue, ANewValue: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
    /// <summary>
    /// Emits a warning stating that a field's NOT NULL setting changed but the
    /// change cannot be applied automatically by this RDBMS strategy. Called by
    /// Check_FieldNotNullChanged when the change is not permitted (AIsPermitted False).
    /// </summary>
    procedure Warning_NotNullChangeNotAllowed(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
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
    /// Emits a warning stating that the whole script was generated in force-create
    /// mode (GenerateScript_ForceCreate), i.e. without consulting the actual state
    /// of the target database. Unlike the other Warning_* helpers, this one is not
    /// tied to a single table/field or to an analysis finding: it is emitted
    /// unconditionally, once per force-create script, so that Context.Execute's
    /// HasWarnings guard blocks a stray run unless the caller explicitly passes
    /// AForce = True.
    /// </summary>
    procedure Warning_ScriptIgnoresActualDBState;
    /// <summary>
    /// Emits a warning when a field's type is changing from AOldFieldType to
    /// ANewFieldType AND that specific conversion is blacklisted by the current
    /// RDBMS. The list of forbidden conversions (formatted as '[old->new]' tokens)
    /// is obtained from Context.SqlGenerator.GetInvalidFieldTypeConversions; the warning is added only
    /// when the '[AOldFieldType->ANewFieldType]' token is found in that list,
    /// signalling a conversion the database cannot perform safely/automatically.
    /// Called by Check_FieldTypeChanged.
    /// </summary>
    procedure Warning_UnsafeTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldType, ANewFieldType: String);

    // ==========================================================
    // MAIN GENERATION
    // ----------------------------------------------------------
    procedure GenerateScript; virtual; abstract;

    // ==========================================================
    // PROPERTIES
    // ----------------------------------------------------------
    property Context: IioDBBuilderContext read GetContext;
  public
    constructor Create(const AContext: IioDBBuilderContext);

    // ==========================================================
    // ENTRY POINTS
    // ----------------------------------------------------------
    procedure GenerateScript_ForceCreate;
    procedure GenerateScript_Sync;
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

function TioDBBuilderStrategyBase.Check_SequenceExists(const ASequenceName: string): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_SequenceExists(ASequenceName), True);
  Result := LQuery.Fields[0].AsInteger > 0;
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateTableSequence(const ATable: IioDBBuilderSchemaTable);
begin
  // Precondition: ATable.UsesSequenceForKeyGeneration must be True. The caller
  // is responsible for that check — consistent with how BuildSchemaTable in
  // Context.Schema.Builder gates SequenceAddIfNotExists. Calling this method on an
  // Identity-keyed table would raise EioDBBuilderException via GetSequenceName.
  //
  // When the whole DB is being created from scratch (Context.Schema.Status = stCreate: either a brand-new
  // empty DB or a force-create documentation/baseline script via Context.Schema.ForceCreateStatus) the sequence
  // cannot pre-exist, so emit it unconditionally: this keeps the create-from-scratch script complete
  // AND avoids a pointless catalog round-trip. The Check_SequenceExists guard is only needed on the
  // incremental path (Context.Schema.Status = stUpdate: a new table added to an already existing DB), where
  // a sequence with the same name might already be present.
  if (Context.Schema.Status = stCreate) or not Check_SequenceExists(ATable.GetSequenceName) then
    Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreateSequence(ATable.GetSequenceName));
end;

procedure TioDBBuilderStrategyBase.Process_ForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Context.Schema.Tables.Values do
  begin
    if taForeignKeys in LTable.Changes then
      Process_TableForeignKeys(LTable);
  end;
end;

procedure TioDBBuilderStrategyBase.Process_DropTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
begin
  // Mode-aware dispatcher: routes to the Force* mechanic appropriate for the
  // current Context.Schema.ForeignKeysMode. The Force* methods bypass mode checks and
  // do the actual work; this entry point preserves the contract that the mode
  // configured on TioDBBuilderProperty governs externally visible behavior.
  case Context.Schema.ForeignKeysMode of
    ifmDisabled:
      // Drop is incompatible with the configured intent ("do not manage FKs").
      // Raise rather than silently no-op so the caller gets immediate feedback.
      raise EioDBBuilderException.Create(ClassName, 'Process_DropTableForeignKeys',
        'Foreign key management is disabled (ForeignKeysMode = ifmDisabled), ' +
        'cannot perform Process_DropTableForeignKeys on table ''' + ATable.Name + '''.');
    ifmEnabled:
      Force_DropTableForeignKeysFromSchema(ATable);
    ifmEnabledStrict:
      Force_DropTableForeignKeysFromDB(ATable);
  end;
end;

procedure TioDBBuilderStrategyBase.Force_DropTableForeignKeysFromSchema(const ATable: IioDBBuilderSchemaTable);
var
  LFK: IioDBBuilderSchemaFK;
begin
  // Bypass of ForeignKeysMode: this method always operates. Drops only the FKs
  // that are still defined in the schema; orphans (FKs in DB but not in schema)
  // and manually added FKs are left untouched — that is the conservative
  // semantic when this mechanic is selected.
  for LFK in ATable.ForeignKeys.Values do
  begin
    if Check_ForeignKeyExists(ATable, LFK) then
    begin
      ScriptWrite_DropForeignKey(ATable, LFK);
      // Mark dropped FKs as stCreate so Process_ForeignKeys recreates them.
      LFK.Status := stCreate;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.Force_DropTableForeignKeysFromDB(const ATable: IioDBBuilderSchemaTable);
var
  LQuery: IioQuery;
begin
  // Bypass of ForeignKeysMode: this method always operates. Queries the DB
  // catalog for every FK currently defined on this table, then drops them all
  // by their actual DB name. Catches orphans (FKs whose structural properties
  // changed and produced a new hash name) and manually added FKs as well.
  // BuildSQL_FKList columns: [0]=table_name, [1]=constraint_name,
  // [2]=on_update, [3]=on_delete. .Trim handles RDBMS that right-pad CHAR
  // columns (e.g. Firebird).
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FKList(ATable.Name), True);
  while not LQuery.Eof do
  begin
    ScriptWrite_DropForeignKeyByName(ATable.Name, LQuery.Fields[1].AsString.Trim);
    LQuery.Next;
  end;

  // Force all schema FKs to stCreate so they get recreated by Process_ForeignKeys.
  ATable.ForceForeignKeysCreateStatus;
end;

procedure TioDBBuilderStrategyBase.Process_TableForeignKeys(const ATable: IioDBBuilderSchemaTable);
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
      ScriptWrite_DropForeignKey(ATable, LFK);
    // Create the FK (both for new and modified ones)
    ScriptWrite_CreateForeignKey(ATable, LFK);
  end;
end;

procedure TioDBBuilderStrategyBase.Process_Indexes;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Context.Schema.Tables.Values do
  begin
    if taIndexes in LTable.Changes then
      Process_TableIndexes(LTable);
  end;
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  Context.Script.Body.AddTitle(Format('Altering table ''%s''', [ATable.Name]));
end;

constructor TioDBBuilderStrategyBase.Create(const AContext: IioDBBuilderContext);
begin
  if not Assigned(AContext) then
    raise EioInvalidArgumentException.Create(ClassName, 'Create', 'AContext is not assigned.');

  FContext := AContext;
end;

function TioDBBuilderStrategyBase.GetContext: IioDBBuilderContext;
begin
  Result := FContext;
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateDatabase;
begin
  Context.SqlGenerator.Command_CreateDatabase;
end;

function TioDBBuilderStrategyBase.Check_DatabaseExists: Boolean;
begin
  Result := Context.SqlGenerator.Check_DatabaseExists;
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  for LForeignKey in ATable.ForeignKeys.Values do
    ScriptWrite_CreateForeignKey(ATable, LForeignKey);
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreateFK(ATable, AForeignKey));
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_DropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_DropFK(ATable, AForeignKey));
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_DropForeignKeyByName(const ATableName, AForeignKeyName: string);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_DropFKbyName(ATableName, AForeignKeyName));
end;

procedure TioDBBuilderStrategyBase.Process_TableIndexes(const ATable: IioDBBuilderSchemaTable);
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
      ScriptWrite_DropIndex(ATable, LIndex);
    // Create the index (both for new and modified ones)
    ScriptWrite_CreateIndex(ATable, LIndex);
  end;
end;

procedure TioDBBuilderStrategyBase.Process_Fields(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  for LField in ATable.Fields do
  begin
    case LField.Status of
      stCreate:
        Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreateField(ATable, LField));
      stUpdate:
        Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_AlterField(ATable, LField));
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.Process_Tables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Context.Schema.Tables.Values do
  begin
    case LTable.Status of
      stCreate:
        ScriptWrite_CreateTable(LTable);
      stUpdate:
        // Index-only and FK-only changes are skipped: indexes and foreign keys
        // are always handled separately in GenerateScript.
        if not (LTable.Changes <= [taIndexes, taForeignKeys]) then
          ScriptWrite_AlterTable(LTable);
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  Context.Script.Body.AddTitle(Format('Creating table ''%s''', [ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreateIndex(ATable, AIndex));
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex);
begin
  ScriptWrite_DropIndexByName(Context.SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex));
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_DropIndexByName(const AIndexName: string);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_DropIndexByName(AIndexName));
end;

procedure TioDBBuilderStrategyBase.Process_DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
begin
  // Mode-aware dispatcher: routes to the Force* mechanic appropriate for the
  // current Context.Schema.IndexesMode. The Force* methods bypass mode checks and do
  // the actual work; this entry point preserves the contract that the mode
  // configured on TioDBBuilderProperty governs externally visible behavior.
  case Context.Schema.IndexesMode of
    ifmDisabled:
      // Drop is incompatible with the configured intent ("do not manage indexes").
      // Raise rather than silently no-op so the caller gets immediate feedback.
      raise EioDBBuilderException.Create(ClassName, 'Process_DropTableIndexes',
        'Index management is disabled (IndexesMode = ifmDisabled), ' +
        'cannot perform Process_DropTableIndexes on table ''' + ATable.Name + '''.');
    ifmEnabled:
      Force_DropTableIndexesFromSchema(ATable);
    ifmEnabledStrict:
      Force_DropTableIndexesFromDB(ATable);
  end;
end;

procedure TioDBBuilderStrategyBase.Force_DropTableIndexesFromSchema(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  // Bypass of IndexesMode: this method always operates. Drops only the indexes
  // that are still defined in the schema; orphans (indexes in DB but not in
  // schema) and manually added indexes are left untouched — that is the
  // conservative semantic when this mechanic is selected.
  for LIndex in ATable.Indexes.Values do
  begin
    if Check_IndexExists(ATable, LIndex) then
    begin
      ScriptWrite_DropIndex(ATable, LIndex);
      // Mark dropped indexes as stCreate so Process_Indexes recreates them.
      LIndex.Status := stCreate;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.Force_DropTableIndexesFromDB(const ATable: IioDBBuilderSchemaTable);
var
  LQuery: IioQuery;
begin
  // Bypass of IndexesMode: this method always operates. Queries the DB catalog
  // for every index currently defined on this table, then drops them all by
  // their actual DB name. Catches orphans (indexes whose [ioIndex] attribute
  // was removed) and manually added indexes alike.
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_IndexList(ATable.Name), True);
  while not LQuery.Eof do
  begin
    ScriptWrite_DropIndexByName(LQuery.Fields[0].AsString);
    LQuery.Next;
  end;

  // Force all schema indexes to stCreate so they get recreated by Process_Indexes.
  ATable.ForceIndexesCreateStatus;
end;

procedure TioDBBuilderStrategyBase.GenerateScript_Sync;
begin
  // Status-driven: does NOT touch Context.Schema.Status, it trusts what the DBAnalyzer determined
  // (stCreate for a brand-new DB, stUpdate for an existing one with changes). GenerateScript
  // branches internally on Context.Schema.Status, so this single entry point covers both cases.
  Context.Script.ScriptBegin(Context.SqlGenerator.DBMSInfo);
  GenerateScript;
  Context.Script.ScriptEnd;
end;

procedure TioDBBuilderStrategyBase.GenerateScript_ForceCreate;
begin
  // Force variant: ignores the analyzed status and produces a coherent full "create from scratch"
  // script by marking the whole schema tree (schema + tables + fields + indexes + FKs) as stCreate,
  // mirroring what the DBAnalyzer does on a non-existent DB. The resulting script must NOT be
  // executed against an existing database: Warning_ScriptIgnoresActualDBState flags this so
  // Context.Execute refuses to run it unless the caller explicitly passes AForce = True.
  Warning_ScriptIgnoresActualDBState;
  Context.Schema.ForceCreateStatus;
  Context.Script.ScriptBegin(Context.SqlGenerator.DBMSInfo);
  GenerateScript;
  Context.Script.ScriptEnd;
end;

procedure TioDBBuilderStrategyBase.Warning_ScriptIgnoresActualDBState;
begin
  Context.Script.Warnings.Add('ATTENTION: This script was generated in FORCE-CREATE mode, the actual state ' +
    'of the target database was NOT analyzed and is ignored. Review it carefully before running it against an ' +
    'existing database.');
end;

procedure TioDBBuilderStrategyBase.Warning_UnsafeTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldType, ANewFieldType: String);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
  if ContainsText(Context.SqlGenerator.GetInvalidFieldTypeConversions, LRequiredConversion) then
    Context.Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''',
      [ATable.Name, AField.FieldName, AOldFieldType, ANewFieldType]));
end;

procedure TioDBBuilderStrategyBase.Warning_ChangeNotAllowed(const AValueName, AOldValue, ANewValue: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  Context.Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
    [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyBase.Warning_PotentialDataTruncation(const AValueName: String; const AOldValue, ANewValue: Integer;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue < AOldValue then
    Context.Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The new %s value becomes smaller than the old one (old = %d, new = %d)',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyBase.Warning_NotNullChangeNotAllowed(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Context.Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The NOT NULL setting cannot be changed automatically', [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategyBase.Hint_NotNullPotentialDataImpact(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Context.Script.Hints.Add(Format('Table ''%s'' field ''%s'' --> The not null setting is changed from FALSE to TRUE and a DEFAULT value has not been specified',
    [ATable.Name, AField.FieldName]));
end;

function TioDBBuilderStrategyBase.Check_FieldTypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldType, ANewFieldType: String): Boolean;
begin
  Result := not SameText(AOldFieldType, ANewFieldType); // case-insensitive comparison
  if Result then
  begin
    AField.AddAltered(alFieldType);
    Warning_UnsafeTypeConversion(ATable, AField, AOldFieldType, ANewFieldType);
  end;
end;

function TioDBBuilderStrategyBase.Check_FieldNotNullChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
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

function TioDBBuilderStrategyBase.Check_FieldBlobSubtypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
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
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, ASql, True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyBase.Check_TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := _ExecuteExistsQuery(Context.SqlGenerator.BuildSQL_TableExists(ATable.Name));
end;

end.
