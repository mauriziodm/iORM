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
/// Base strategy class for RDBMS that support ALTER TABLE operations.
/// This class contains the common logic shared by Firebird, MS SQL Server, PostgreSQL, etc.
/// SQLite does NOT inherit from this class because it requires the rename-create-copy pattern.
/// </summary>
unit iORM.DBBuilder.Strategy.WithAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base

  ;


type
  TioDBBuilderStrategyWithAlterTable = class(TioDBBuilderStrategyBase)
  private
  protected
    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable); override;

    // ==========================================================
    // MAIN GENERATION
    // ----------------------------------------------------------
    /// <summary>
    /// Generates the full database update script for RDBMS that support ALTER TABLE.
    /// The generation flow depends on the IndexesMode and ForeignKeysMode settings:
    ///   ifmDisabled: indexes/FKs are not managed at all.
    ///   ifmEnabled (conservative): creates new and updates modified indexes/FKs only.
    ///     Orphaned indexes/FKs (present in DB but not in schema) are left untouched.
    ///   ifmEnabledStrict: for every updated table, drops ALL existing indexes/FKs from the
    ///     DB by querying the catalog, then recreates them from the schema.
    ///     The schema becomes authoritative and orphans are removed.
    /// Foreign keys are always processed last to ensure all referenced tables already exist.
    /// </summary>
    procedure GenerateScript_Body; override;

  public

  end;


implementation


{ TioDBBuilderStrategyWithAlterTable }

procedure TioDBBuilderStrategyWithAlterTable.ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  inherited;

  // Note: the sequence is a separate opCreateSequence in the Plan (emitted before this opCreateTable), so
  // it is NOT created here anymore - that would double-create it.
  Context.Script.Body.AddEmpty;
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_BeginCreateTable(ATable));
  Context.Script.Body.IncIndent;

  // Inline field creation
  LComma := '  ';
  for LField in ATable.Fields do
  begin
    Context.Script.Body.AddLine(LComma + Context.SqlGenerator.BuildSQL_FieldDefinition(ATable, LField));
    LComma := ', ';
  end;

  Context.Script.Body.DecIndent;
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_EndCreateTable(ATable));
  Context.Script.Body.AddEmpty;
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_CreatePK(ATable));
end;

procedure TioDBBuilderStrategyWithAlterTable.GenerateScript_Body;
var
  LOp: IioDBBuilderPlanOperation;
begin
  // Check key generation strategy compatibility with RDBMS version (diagnostic on the SqlGenerator).
  Context.SqlGenerator.Hint_KeyGenerationCompatibility(Context.Reconciliation.MappedSchema, Context.Script);

  // Plan-driven: the PlanBuilder already produced the operations in a create-safe order (strict drops ->
  // tables+fields -> indexes -> foreign keys -> orphan drops) and already applied the index/FK modes, so
  // this is a straight translate-each-op loop. The dialect lives in the ScriptWrite_/BuildSQL_ each op
  // dispatches to. WithoutAlterTable dialects override this with the rebuild flow instead.
  for LOp in Context.Reconciliation.Plan.Operations do
    case LOp.Kind of
      opCreateSequence:       ScriptWrite_CreateSequence(LOp.SequenceName);
      opCreateTable:          ScriptWrite_CreateTable(LOp.SchemaTable);
      opCreateField:          ScriptWrite_CreateField(LOp.SchemaTable, LOp.SchemaField_Mapped);
      opAlterField:           ScriptWrite_AlterField(LOp.SchemaTable, LOp.SchemaField_Mapped, LOp.SchemaField_Physical, LOp.SchemaField_Changes);
      opDropField:            ScriptWrite_DropField(LOp.SchemaTable, LOp.SchemaField_Physical);
      opCreateIndex:          ScriptWrite_CreateIndex(LOp.SchemaTable, LOp.SchemaIndex);
      opDropIndex:            ScriptWrite_DropIndex(LOp.SchemaTable, LOp.SchemaIndex);
      opDropOrphanIndex:      ScriptWrite_DropOrphanIndex(LOp.SchemaTable, LOp.SchemaIndex);
      opCreateForeignKey:     ScriptWrite_CreateForeignKey(LOp.SchemaTable, LOp.SchemaForeignKey);
      opDropForeignKey:       ScriptWrite_DropForeignKey(LOp.SchemaTable, LOp.SchemaForeignKey);
      opDropOrphanForeignKey: ScriptWrite_DropOrphanForeignKey(LOp.SchemaTable, LOp.SchemaForeignKey);
      opDropTable:            ScriptWrite_DropTable(LOp.SchemaTable);
    end;
end;

end.
