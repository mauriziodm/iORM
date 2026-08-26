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
/// <summary>
/// Base strategy class for RDBMS that do NOT support ALTER TABLE column operations.
/// These databases require the rename-create-copy pattern to modify table structure:
/// 1. Drop indexes
/// 2. Rename existing tables to "_old"
/// 3. Create new tables with the updated schema
/// 4. Recreate indexes
/// 5. Copy data from old tables to new ones
/// Like WithAlterTable, this is now Plan-driven: the PlanBuilder's rebuild shape (Build_Rebuild) emits the
/// rebuild ops in a rebuild-safe order and GenerateScript_Body is a straight translate-each-op loop,
/// wrapped by the constraint-deferral prologue/epilogue. SQLite inherits from this class.
/// </summary>
unit iORM.DBBuilder.Strategy.WithoutAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base

  ;


type
  TioDBBuilderStrategyWithoutAlterTable = class(TioDBBuilderStrategyBase)
  private
  protected
    // ==========================================================
    // RENAME-CREATE-COPY PATTERN HELPERS (Plan-op translators)
    // ----------------------------------------------------------
    /// <summary>Translates opCopyData: INSERT INTO the rebuilt table SELECT-ing every field that already
    /// existed (Status &lt;&gt; stCreate) from its "_old" shadow.</summary>
    procedure ScriptWrite_CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable); virtual;
    /// <summary>Translates opRenameTableToOld: rename the table to its "_old" shadow. Also emits the
    /// rebuild-loss warnings here (index/FK management disabled) since this is the op that starts the
    /// rebuild that would drop them.</summary>
    procedure ScriptWrite_RenameTableToOld(const ATable: IioDBBuilderSchemaTable); virtual;
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String; virtual;

    // ==========================================================
    // CONSTRAINT DEFERRAL HOOKS
    // ----------------------------------------------------------
    // Override in derived classes for DBMS-specific syntax.
    procedure ScriptWrite_BeginDeferConstraints; virtual;
    procedure ScriptWrite_EndDeferConstraints; virtual;

    // ==========================================================
    // VERSION-GATED FIELD DROP
    // ----------------------------------------------------------
    // The inherited ScriptWrite_DropField's commented ALTER TABLE ... DROP COLUMN is only valid SQLite
    // syntax from 3.35.0 onward (older engines have no lightweight way to drop a single column - the
    // PlanBuilder deliberately never forces the full rebuild just for an orphan field, see the orphan
    // fields step in TioDBBuilderPlanBuilderWithoutAlterTable.Build). Checked against the actually
    // connected engine (Context.SqlGenerator.DBMSInfo), not a compile-time assumption, so the offered
    // statement is never misleading.
    procedure ScriptWrite_DropField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField); override;

    // ==========================================================
    // MAIN GENERATION
    // ----------------------------------------------------------
    /// <summary>
    /// Generates the full database update script for RDBMS without ALTER TABLE support. Plan-driven: the
    /// PlanBuilder's rebuild shape (Build_Rebuild) already produced the ops in a rebuild-safe order
    /// (drop indexes from DB -> rename to "_old" -> create tables -> create indexes -> copy data), so this
    /// is a straight translate-each-op loop wrapped by the constraint-deferral prologue/epilogue. The
    /// key-generation-compatibility diagnostic is emitted first (same as WithAlterTable). Foreign keys are
    /// inline in CREATE TABLE for these dialects, so there are no FK ops. Note: ifmEnabled and
    /// ifmEnabledStrict behave identically here (the rebuild recreates everything from scratch); only
    /// ifmDisabled prevents index recreation on the new tables (the PlanBuilder omits the create-index ops).
    /// </summary>
    procedure GenerateScript_Body; override;
  public
  end;


implementation

uses
  System.SysUtils

  ;


{ TioDBBuilderStrategyWithoutAlterTable }

procedure TioDBBuilderStrategyWithoutAlterTable.GenerateScript_Body;
var
  LOp: IioDBBuilderPlanOperation;
begin
  // Check key generation strategy compatibility with DBMS.
  // The diagnostic lives on the Context.SqlGenerator (DBMS-capability axis), not on the Strategy.
  Context.SqlGenerator.Hint_KeyGenerationCompatibility(Context.Reconciliation.MappedSchema, Context.Script);

  // Dialect prologue: defer the constraints for the whole rebuild (see derived strategies).
  ScriptWrite_BeginDeferConstraints;

  // Plan-driven: the PlanBuilder's rebuild shape already produced the ops in a rebuild-safe order
  // (drop indexes from DB -> rename to "_old" -> create tables -> create indexes -> copy data), so this is
  // a straight translate-each-op loop. The dialect lives in the ScriptWrite_/BuildSQL_ each op dispatches
  // to. FKs are inline in CREATE TABLE for these dialects, so there are no FK ops here.
  for LOp in Context.Reconciliation.Plan.Operations do
    case LOp.Kind of
      opDropIndex:        ScriptWrite_DropIndex(LOp.SchemaTable, LOp.SchemaIndex);
      opDropOrphanIndex:  ScriptWrite_DropOrphanIndex(LOp.SchemaTable, LOp.SchemaIndex);
      opRenameTableToOld: ScriptWrite_RenameTableToOld(LOp.SchemaTable);
      opCreateTable:      ScriptWrite_CreateTable(LOp.SchemaTable);
      opCreateIndex:      ScriptWrite_CreateIndex(LOp.SchemaTable, LOp.SchemaIndex);
      opCopyData:         ScriptWrite_CopyDataFromOldToNewTable(LOp.SchemaTable);
      opDropTable:        ScriptWrite_DropTable(LOp.SchemaTable);
      opDropField:        ScriptWrite_DropField(LOp.SchemaTable, LOp.SchemaField_Physical);
    end;

  // Dialect epilogue: restore normal constraint checking.
  ScriptWrite_EndDeferConstraints;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_BeginDeferConstraints;
begin
  // Default: no-op. Override in derived classes for DBMS-specific constraint deferral.
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_EndDeferConstraints;
begin
  // Default: no-op. Override in derived classes for DBMS-specific constraint deferral.
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_RenameTableToOld(const ATable: IioDBBuilderSchemaTable);
begin
  // Rebuild-loss warnings: emitted here, on the op that starts the rebuild. When index/FK management is
  // disabled the rebuilt table loses its existing indexes/FKs (dropped/not recreated), so warn - but only
  // if the table actually has such objects in the DB (the Warning_* helpers self-filter).
  if Context.Reconciliation.IndexesMode = ifmDisabled then
    Warning_RebuildDropsUnmanagedIndexes(ATable);
  if Context.Reconciliation.ForeignKeysMode = ifmDisabled then
    Warning_RebuildDropsUnmanagedForeignKeys(ATable);

  Context.Script.Body.AddComment(Format('Renaming from "%s" to "%s"', [ATable.Name, Table2OldTableName(ATable)]));
  Context.Script.Body.Add(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(ATable)]));
  Context.Script.Body.Add(Format('ALTER TABLE %s RENAME TO %s;', [ATable.Name, Table2OldTableName(ATable)]));
  Context.Script.Body.AddEmpty;
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: string;
begin
  Context.Script.Body.AddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.Name]));
  // Insert into
  Context.Script.Body.Add(Format('INSERT INTO %s (', [ATable.Name]));
  Context.Script.Body.IncIndent;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Context.Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Context.Script.Body.DecIndent;

  // Select from
  Context.Script.Body.Add(') SELECT');
  Context.Script.Body.IncIndent;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Context.Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Context.Script.Body.DecIndent;

  Context.Script.Body.Add(Format('FROM %s', [Table2OldTableName(ATable)]));
  Context.Script.Body.Add(';');
  Context.Script.Body.AddEmpty;
end;

function TioDBBuilderStrategyWithoutAlterTable.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.Name.ToLower]);
end;

procedure TioDBBuilderStrategyWithoutAlterTable.ScriptWrite_DropField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField);
begin
  if Context.SqlGenerator.DBMSInfo.IsAtLeast(3, 35) then
    inherited
  else
  begin
    Context.Script.Body.AddEmpty;
    Context.Script.Body.AddComment(Format('Orphan field ''%s'' on table ''%s'' (exists in the DB, not mapped): this SQLite engine (%s) does not ' +
      'support ALTER TABLE DROP COLUMN (requires 3.35.0+) - remove it manually via a full table rebuild if intended.',
      [AField.FieldName, ATable.Name, Context.SqlGenerator.DBMSInfo.Version]));
    Context.Script.Warnings.AddLine(Format('Field ''%s'' on table ''%s'' exists in the database but is not mapped by any entity: no DROP COLUMN ' +
      'statement was offered because this SQLite engine (%s) is older than 3.35.0. Removing it requires rebuilding the table manually.',
      [AField.FieldName, ATable.Name, Context.SqlGenerator.DBMSInfo.Version]));
  end;
end;

end.
