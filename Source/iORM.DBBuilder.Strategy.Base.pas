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
  iORM.DBBuilder.Interfaces,
  iORM.DB.Interfaces;

type

  /// <summary>
  ///  Segregates the Context reference: FContext is private to this class alone, so none of
  ///  TioDBBuilderStrategyBase's own methods (and it has dozens, across five files) can ever touch it
  ///  directly, bypassing the Context property - only this class's own GetContext does. See the
  ///  "Field visibility" note in CLAUDE.md: worth the extra class specifically because
  ///  TioDBBuilderStrategyBase is large and gets edited often, so a stray FContext.X typed by habit
  ///  would compile silently if the field were merely protected instead.
  /// </summary>
  TioDBBuilderStrategySegregation = class(TInterfacedObject)
  strict private
    // strict private, not plain private: plain private in Delphi is unit-scoped, so any other class
    // declared in this same unit (TioDBBuilderStrategyBase included) would still see FContext/GetContext
    // directly - defeating the whole point of this class. strict private is scoped to this exact class.
    FContext: IioDBBuilderContext;

    function GetContext: IioDBBuilderContext;
  strict protected
    property Context: IioDBBuilderContext read GetContext;
  public
    constructor Create(const AContext: IioDBBuilderContext);
  end;

  TioDBBuilderStrategyBase = class(TioDBBuilderStrategySegregation, IioDBBuilderStrategy)
  private
    // ==========================================================
    // ENTRY POINTS (local only: no descendant calls this directly)
    // ----------------------------------------------------------
    procedure GenerateScript;

    // ==========================================================
    // HINTS / WARNINGS RELATED METHODS (local only: no descendant calls these directly)
    // ----------------------------------------------------------
    // These helpers append a human-readable message to Context.Script.Hints/Warnings during the
    // DBBuilder analysis phase - see the naming-convention banner on the protected section below for
    // the Hint_/Warning_ distinction. Not virtual: kept at the lowest class that owns the behaviour.
    /// <summary>
    /// Emits a hint noting that a field's NOT NULL setting changed from FALSE to
    /// TRUE without a DEFAULT value being specified, which may impact existing
    /// data. Called by Warning_FieldAlterations.
    /// </summary>
    procedure Hint_NotNullPotentialDataImpact(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
    /// <summary>
    /// Emits a warning stating that a field attribute (named by AValueName, e.g.
    /// 'blob sub-type') changed from AOldValue to ANewValue but the change is NOT
    /// allowed and will not be applied automatically. This is the generic
    /// "attribute cannot be altered" notice; the caller decides when the change
    /// is disallowed (e.g. a blob sub-type change the RDBMS cannot apply).
    /// </summary>
    procedure Warning_ChangeNotAllowed(const AValueName, AOldValue, ANewValue: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
    /// <summary>
    /// Re-derives and emits all the alter-field warnings/hints (unsafe type conversion, potential
    /// truncation on length/precision/scale, NOT NULL, blob sub-type) by comparing the physical (old) and
    /// mapped (new) field. Called at translation time by ScriptWrite_AlterField: the collapsed change-set
    /// cannot distinguish type/scale/blob, so the warnings are re-derived from the actual old/new values.
    /// </summary>
    procedure Warning_FieldAlterations(const ATable: IioDBBuilderSchemaTable; const AMappedField, APhysicalField: IioDBBuilderSchemaField);
    /// <summary>
    /// Emits a warning stating that a field's NOT NULL setting changed but the
    /// change cannot be applied automatically by this RDBMS strategy. Called by
    /// Warning_FieldAlterations when the RDBMS cannot alter the NOT NULL setting.
    /// </summary>
    procedure Warning_NotNullChangeNotAllowed(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
    /// <summary>
    /// Emits a warning when a numeric field attribute (identified by AValueName,
    /// e.g. 'field LENGTH', 'field PRECISION', 'field DECIMALS') is being shrunk,
    /// i.e. ANewValue &lt; AOldValue. A reduction risks data truncation, so the
    /// change is flagged for manual review; nothing is added when the value grows
    /// or stays the same. Called by Warning_FieldAlterations for length/precision/scale reductions.
    /// </summary>
    procedure Warning_PotentialDataTruncation(const AValueName: String; const AOldValue, ANewValue: Integer; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
    /// <summary>
    /// Emits a warning when a field's type is changing from AOldFieldType to
    /// ANewFieldType AND that specific conversion is blacklisted by the current
    /// RDBMS. The list of forbidden conversions (formatted as '[old->new]' tokens)
    /// is obtained from Context.SqlGenerator.GetInvalidFieldTypeConversions; the warning is added only
    /// when the '[AOldFieldType->ANewFieldType]' token is found in that list,
    /// signalling a conversion the database cannot perform safely/automatically.
    /// Called by Warning_FieldAlterations.
    /// </summary>
    procedure Warning_UnsafeTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldType, ANewFieldType: String);
  protected
    { Naming convention (role-based prefixes, mirrors the SqlGenerator family - see
      iORM.DBBuilder.SqlGenerator.Base). A method's prefix encodes its ROLE within the
      DB-sync workflow, independently of whether it is exposed on IioDBBuilderStrategy:
        GenerateScript       the single entry point (the only IioDBBuilderStrategy member, private -
                             called exclusively via the interface): wraps GenerateScript_Body between
                             Context.Script.ScriptBegin/ScriptEnd. Mode selection (forcing the whole
                             schema to stCreate, emitting the force-create warning) is an Engine-level
                             orchestration decision, made on Context before this is called - neither
                             this method nor GenerateScript_Body branch on it.
        GenerateScript_Body  protected abstract: the actual dialect-specific generation flow,
                             implemented by each concrete Strategy (WithAlterTable/WithoutAlterTable).
                             Now Plan-driven in both: a translate-each-op loop over Context.Reconciliation.Plan.
        ScriptWrite_*        translates a single Plan operation into DDL/DML on Context.Script.Body
        Check_*              interrogates the (introspected) physical schema / detects a change, returns Boolean
        Warning_* / Hint_*   diagnostics appended to Context.Script.Warnings / Context.Script.Hints
      Plain accessors and private helpers are sanctioned exceptions and keep plain Delphi
      verb naming (Get*). Interface membership is orthogonal to the prefix.
      Layout (mirrors the SqlGenerator family): methods are grouped under domain banners
      (DATABASE / TABLE / FIELD / INDEX / SEQUENCE / FOREIGN KEY / ...) and kept alphabetical
      within each group. This applies to the declarations (IioDBBuilderStrategy + every class
      section: derived strategies use the same banners); implementations are not ordered.
      The "Force = imposed Status, not derived" concept lives (in plain-verb form, no underscore
      prefix) on IioDBBuilderSchema/IioDBBuilderSchemaTable's ForceCreateStatus/
      ForceIndexesCreateStatus/ForceForeignKeysCreateStatus, used by the fresh-DB create path. }

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function Check_DatabaseExists: Boolean; virtual;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure ScriptWrite_DropTable(const ATable: IioDBBuilderSchemaTable); virtual;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_AlterField(const ATable: IioDBBuilderSchemaTable; const AMappedField, APhysicalField: IioDBBuilderSchemaField; const AChanges: TioDBBuilderFieldChanges); virtual;
    procedure ScriptWrite_CreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField); virtual;
    procedure ScriptWrite_DropField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField); virtual;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// True if the DB catalog reports at least one (explicit) index on the given table. Used to warn -
    /// only when there really are indexes - before a rename-create-copy rebuild that will drop them
    /// without recreating them (IndexesMode = ifmDisabled).
    /// </summary>
    function Check_TableHasIndexesInDB(const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    procedure ScriptWrite_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex); virtual;
    procedure ScriptWrite_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex); virtual;
    procedure ScriptWrite_DropIndexByName(const AIndexName: string); virtual;

    // ==========================================================
    // SEQUENCE RELATED METHODS
    // ----------------------------------------------------------
    function Check_SequenceExists(const ASequenceName: string): Boolean; virtual;
    procedure ScriptWrite_CreateSequence(const ASequenceName: String); virtual;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// True if the DB catalog reports at least one foreign key on the given table. Used to warn - only
    /// when there really are FKs - before a rename-create-copy rebuild that recreates the table without
    /// its foreign keys (ForeignKeysMode = ifmDisabled).
    /// </summary>
    function Check_TableHasForeignKeysInDB(const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    procedure ScriptWrite_CreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK); virtual;
    procedure ScriptWrite_CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure ScriptWrite_DropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK); virtual;

    // ==========================================================
    // WARNINGS RELATED METHODS (used by a descendant - see WithoutAlterTable)
    // ----------------------------------------------------------
    /// <summary>
    /// Emits a warning (only if the table actually has FKs in the DB) that a rename-create-copy rebuild
    /// recreates the table WITHOUT its existing foreign keys because ForeignKeysMode = ifmDisabled, so
    /// they are silently lost unless recreated manually / FK management is enabled.
    /// </summary>
    procedure Warning_RebuildDropsUnmanagedForeignKeys(const ATable: IioDBBuilderSchemaTable);
    /// <summary>
    /// Emits a warning (only if the table actually has indexes in the DB) that a rename-create-copy
    /// rebuild drops its existing indexes WITHOUT recreating them because IndexesMode = ifmDisabled, so
    /// they are silently lost unless recreated manually / index management is enabled.
    /// </summary>
    procedure Warning_RebuildDropsUnmanagedIndexes(const ATable: IioDBBuilderSchemaTable);

    // ==========================================================
    // MAIN GENERATION
    // ----------------------------------------------------------
    procedure GenerateScript_Body; virtual; abstract;
  public
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.Exceptions,
  iORM.DB.QueryEngine

  ;

{ TioDBBuilderStrategySegregation }

constructor TioDBBuilderStrategySegregation.Create(const AContext: IioDBBuilderContext);
begin
  inherited Create;

  if not Assigned(AContext) then
    raise EioInvalidArgumentException.Create(ClassName, 'Create', 'AContext is not assigned.');

  FContext := AContext;
end;

function TioDBBuilderStrategySegregation.GetContext: IioDBBuilderContext;
begin
  Result := FContext;
end;

{ TioDBBuilderStrategyBase }

function TioDBBuilderStrategyBase.Check_SequenceExists(const ASequenceName: string): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_SequenceExists(ASequenceName), True);
  Result := LQuery.Fields[0].AsInteger > 0;
end;

function TioDBBuilderStrategyBase.Check_TableHasIndexesInDB(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LPhysicalTable: IioDBBuilderSchemaTable;
begin
  // "In the DB" is now read from the introspected PhysicalSchema (no live catalog query).
  Result := False;
  if Context.Reconciliation.PhysicalSchema = nil then
    Exit;
  LPhysicalTable := Context.Reconciliation.PhysicalSchema.FindTable(ATable.Name, False);
  Result := (LPhysicalTable <> nil) and (LPhysicalTable.Indexes.Count > 0);
end;

function TioDBBuilderStrategyBase.Check_TableHasForeignKeysInDB(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LPhysicalTable: IioDBBuilderSchemaTable;
begin
  // "In the DB" is now read from the introspected PhysicalSchema (no live catalog query).
  Result := False;
  if Context.Reconciliation.PhysicalSchema = nil then
    Exit;
  LPhysicalTable := Context.Reconciliation.PhysicalSchema.FindTable(ATable.Name, False);
  Result := (LPhysicalTable <> nil) and (LPhysicalTable.ForeignKeys.Count > 0);
end;

// Plan-op translator (opCreateSequence): create a sequence by name. On a create-from-scratch (schema
// stCreate) the sequence cannot pre-exist AND the DB may not exist yet (skip the catalog query); on the
// incremental path guard against an already-present sequence.
procedure TioDBBuilderStrategyBase.ScriptWrite_CreateSequence(const ASequenceName: String);
begin
  if (Context.Reconciliation.MappedSchema.Status = stCreate) or not Check_SequenceExists(ASequenceName) then
    Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreateSequence(ASequenceName));
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

// Plan-op translator (opCreateField): add a single column to an existing table.
procedure TioDBBuilderStrategyBase.ScriptWrite_CreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreateField(ATable, AField));
end;

// Plan-op translator (opAlterField): alter a single column and, at translation time, emit the old->new
// warnings. The op carries the change-set, which drives the ALTER SQL; the warnings are re-derived from
// the old (physical) / new (mapped) values (see Warning_FieldAlterations).
procedure TioDBBuilderStrategyBase.ScriptWrite_AlterField(const ATable: IioDBBuilderSchemaTable;
  const AMappedField, APhysicalField: IioDBBuilderSchemaField; const AChanges: TioDBBuilderFieldChanges);
var
  LChange: TioDBBuilderFieldChange;
begin
  // Stamp the change-set onto the mapped field so BuildSQL_AlterField (which reads the Is*Altered flags)
  // emits the right ALTER statements.
  for LChange in AChanges do
    AMappedField.AddAltered(LChange);
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_AlterField(ATable, AMappedField));
  Warning_FieldAlterations(ATable, AMappedField, APhysicalField);
end;

// Plan-op translator (opDropField): an orphan field (in the DB, not mapped) is NEVER dropped
// automatically - the DROP is emitted as a comment (not executed) plus a warning, so the developer can
// run it manually if that is really the intent.
procedure TioDBBuilderStrategyBase.ScriptWrite_DropField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Context.Script.Body.AddEmpty;
  Context.Script.Body.AddComment(Format('Orphan field ''%s'' on table ''%s'' (exists in the DB, not mapped) - drop it manually if intended:', [AField.FieldName, ATable.Name]));
  Context.Script.Body.AddComment(Format('ALTER TABLE %s DROP COLUMN %s;', [ATable.SqlName, AField.SqlFieldName]));
  Context.Script.Warnings.AddLine(Format('Field ''%s'' on table ''%s'' exists in the database but is not mapped by any entity: an ALTER TABLE ' +
    'DROP COLUMN statement was generated as a comment (NOT executed). Review and run it manually if you want to remove it.', [AField.FieldName, ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  Context.Script.Body.AddTitle(Format('Creating table ''%s''', [ATable.Name]));
end;

// Plan-op translator (opDropTable): an orphan table (in the DB, not mapped) is NEVER dropped
// automatically - the DROP is emitted as a comment (not executed) plus a warning, so the developer can
// run it manually if that is really the intent.
procedure TioDBBuilderStrategyBase.ScriptWrite_DropTable(const ATable: IioDBBuilderSchemaTable);
begin
  Context.Script.Body.AddEmpty;
  Context.Script.Body.AddComment(Format('Orphan table ''%s'' (exists in the DB, not mapped) - drop it manually if intended:', [ATable.Name]));
  Context.Script.Body.AddComment(Format('DROP TABLE %s;', [ATable.SqlName]));
  Context.Script.Warnings.AddLine(Format('Table ''%s'' exists in the database but is not mapped by any entity: a DROP TABLE ' +
    'statement was generated as a comment (NOT executed). Review and run it manually if you want to remove it.', [ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreateIndex(ATable, AIndex));
end;

// AIndex here is always a Physical node (read by the Introspector via Match_PhysicalIndex or, in strict
// mode, enumerated directly): its Name is already the real catalog name, so drop by that name directly -
// recomputing it via Translate_SchemaTableAndIndex_To_IndexName would force an uppercase iORM-convention
// name onto an index iORM may not have created (e.g. a manually-added one dropped wholesale in strict
// mode), which can silently target a name that does not exist. Also used by WithoutAlterTable's rebuild
// shape to free every physical index of a rebuilt table unconditionally, before recreating it.
procedure TioDBBuilderStrategyBase.ScriptWrite_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex);
begin
  ScriptWrite_DropIndexByName(AIndex.Name);
end;

procedure TioDBBuilderStrategyBase.ScriptWrite_DropIndexByName(const AIndexName: string);
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_DropIndexByName(AIndexName));
end;

procedure TioDBBuilderStrategyBase.GenerateScript;
begin
  // Status-driven: does NOT touch Context.Reconciliation.MappedSchema.Status, trusts it as given by the caller (Engine),
  // whether reconciled from the introspected physical schema or forced via Context.Reconciliation.MappedSchema.ForceCreateStatus.
  // GenerateScript_Body branches internally on Context.Reconciliation.MappedSchema.Status, so this single entry point
  // covers both the sync and the force-create case.
  Context.Script.ScriptBegin(Context.SqlGenerator.DBMSInfo);
  GenerateScript_Body;
  Context.Script.ScriptEnd;
end;

procedure TioDBBuilderStrategyBase.Warning_UnsafeTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldType, ANewFieldType: String);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
  if ContainsText(Context.SqlGenerator.GetInvalidFieldTypeConversions, LRequiredConversion) then
    Context.Script.Warnings.AddLine(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''',
      [ATable.Name, AField.FieldName, AOldFieldType, ANewFieldType]));
end;

procedure TioDBBuilderStrategyBase.Warning_FieldAlterations(const ATable: IioDBBuilderSchemaTable;
  const AMappedField, APhysicalField: IioDBBuilderSchemaField);
var
  LOldType, LNewType, LNewSubtype: String;
begin
  // Re-derives the alter warnings from the actual old/new values (the change-set collapses type/scale/blob
  // into fcType, so it cannot drive them). Faithful port of the warning half of the former
  // Check_FieldModified. FieldTypeRaw is frozen on both sides at construction (see
  // TioDBBuilderSchemaField), so no cast to the concrete node is needed.
  LOldType := APhysicalField.FieldTypeRaw;
  LNewType := AMappedField.FieldTypeRaw;

  // Type: unsafe (blacklisted) conversion. Self-filters (only warns when old->new is in the invalid list),
  // so a scale/blob-only change - where old type = new type - produces no spurious warning.
  if not SameText(LOldType, LNewType) then
    Warning_UnsafeTypeConversion(ATable, AMappedField, LOldType, LNewType);

  // Length (VARCHAR/CHAR): Warning_PotentialDataTruncation self-filters (warns only when new < old).
  if 'VARCHAR,CHAR'.Contains(LNewType) or 'VARCHAR,CHAR'.Contains(LOldType) then
    Warning_PotentialDataTruncation('field LENGTH', APhysicalField.FieldLength, AMappedField.FieldLength, AMappedField, ATable);

  // Precision + scale (DECIMAL/NUMERIC): both self-filter.
  if (LOldType = 'DECIMAL') or (LOldType = 'NUMERIC') then
  begin
    Warning_PotentialDataTruncation('field PRECISION', APhysicalField.FieldPrecision, AMappedField.FieldPrecision, AMappedField, ATable);
    Warning_PotentialDataTruncation('field DECIMALS', APhysicalField.FieldScale, AMappedField.FieldScale, AMappedField, ATable);
  end;

  // NOT NULL: a Hint if it becomes NOT NULL without a default; a Warning if the DBMS cannot alter it.
  if APhysicalField.FieldNotNull <> AMappedField.FieldNotNull then
  begin
    if Context.SqlGenerator.Supports_AlterNotNull then
    begin
      if AMappedField.FieldNotNull and not AMappedField.FieldDefaultExists then
        Hint_NotNullPotentialDataImpact(ATable, AMappedField);
    end
    else
      Warning_NotNullChangeNotAllowed(ATable, AMappedField);
  end;

  // BLOB sub-type: warn if it changed and the DBMS cannot alter it.
  if LNewType.StartsWith('BLOB') and not Context.SqlGenerator.Supports_AlterBlobSubtype then
  begin
    LNewSubtype := IfThen(AMappedField.FieldSubtype.IsEmpty, '0', AMappedField.FieldSubtype);
    if not SameText(APhysicalField.FieldSubtype, LNewSubtype) then
      Warning_ChangeNotAllowed('blob sub-type', APhysicalField.FieldSubtype, LNewSubtype, AMappedField, ATable);
  end;
end;

procedure TioDBBuilderStrategyBase.Warning_ChangeNotAllowed(const AValueName, AOldValue, ANewValue: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  Context.Script.Warnings.AddLine(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
    [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyBase.Warning_PotentialDataTruncation(const AValueName: String; const AOldValue, ANewValue: Integer;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue < AOldValue then
    Context.Script.Warnings.AddLine(Format('Table ''%s'' field ''%s'' --> The new %s value becomes smaller than the old one (old = %d, new = %d)',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyBase.Warning_RebuildDropsUnmanagedForeignKeys(const ATable: IioDBBuilderSchemaTable);
begin
  if Check_TableHasForeignKeysInDB(ATable) then
    Context.Script.Warnings.AddLine(Format('Table ''%s'' must be rebuilt (structural change) but ForeignKeysMode = ifmDisabled: ' +
      'the rebuilt table is recreated WITHOUT its existing foreign keys, which are therefore lost. ' +
      'Recreate them manually or enable foreign key management.', [ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.Warning_RebuildDropsUnmanagedIndexes(const ATable: IioDBBuilderSchemaTable);
begin
  if Check_TableHasIndexesInDB(ATable) then
    Context.Script.Warnings.AddLine(Format('Table ''%s'' must be rebuilt (structural change) but IndexesMode = ifmDisabled: ' +
      'its existing indexes are dropped and NOT recreated, and are therefore lost. ' +
      'Recreate them manually or enable index management.', [ATable.Name]));
end;

procedure TioDBBuilderStrategyBase.Warning_NotNullChangeNotAllowed(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Context.Script.Warnings.AddLine(Format('Table ''%s'' field ''%s'' --> The NOT NULL setting cannot be changed automatically', [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategyBase.Hint_NotNullPotentialDataImpact(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  Context.Script.Hints.AddLine(Format('Table ''%s'' field ''%s'' --> The not null setting is changed from FALSE to TRUE and a DEFAULT value has not been specified',
    [ATable.Name, AField.FieldName]));
end;

end.
