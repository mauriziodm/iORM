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
    /// <summary>The PK is a separate statement after CREATE TABLE (BuildSQL_CreatePK).</summary>
    procedure ScriptWrite_CreateTableSeparateConstraints(const ATable: IioDBBuilderSchemaTable); override;

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
    /// <summary>
    /// Translates the ops only this shape's Plan adds on top of the base's shared dispatch
    /// (ScriptWrite_PlanOperation): sequences, in-place field create/alter, and explicit FK create/drop
    /// (the rebuild shape recreates tables wholesale and keeps FKs inline in CREATE TABLE).
    /// Everything else chains to inherited.
    /// </summary>
    procedure ScriptWrite_PlanOperation(const AOp: IioDBBuilderPlanOperation); override;

  public

  end;


implementation


{ TioDBBuilderStrategyWithAlterTable }

// opCreateTable translation sub-fragment (separate-constraints slot of the base template): the PK is a
// separate statement after CREATE TABLE (BuildSQL_CreatePK).
procedure TioDBBuilderStrategyWithAlterTable.ScriptWrite_CreateTableSeparateConstraints(const ATable: IioDBBuilderSchemaTable);
begin
  Context.Script.Body.AddEmpty;
  Context.Script.Body.AddToCurrentLine(Context.SqlGenerator.BuildSQL_CreatePK(ATable));
end;

procedure TioDBBuilderStrategyWithAlterTable.GenerateScript_Body;
begin
  // Plan-driven: the PlanBuilder already produced the operations in a create-safe order (strict drops ->
  // tables+fields -> indexes -> foreign keys -> orphan drops) and already applied the index/FK modes, so
  // the shared ScriptWrite_Plan is a straight translate-each-op loop - the dialect lives in the
  // ScriptWrite_/BuildSQL_ each op dispatches to. WithoutAlterTable dialects override this with the
  // rebuild flow instead.
  ScriptWrite_Plan;
end;

// The ops this shape adds on top of the base's shared dispatch (ScriptWrite_PlanOperation): the WithAlterTable
// PlanBuilder shape is the only one that emits sequence ops, in-place field create/alter, and explicit FK
// create/drop (the rebuild shape recreates tables wholesale and keeps FKs inline in CREATE TABLE).
procedure TioDBBuilderStrategyWithAlterTable.ScriptWrite_PlanOperation(const AOp: IioDBBuilderPlanOperation);
begin
  case AOp.Kind of
    opCreateSequence:   ScriptWrite_CreateSequence(AOp.SequenceName);
    opCreateField:      ScriptWrite_CreateField(AOp.SchemaTable, AOp.SchemaField_Mapped);
    opAlterField:       ScriptWrite_AlterField(AOp.SchemaTable, AOp.SchemaField_Mapped, AOp.SchemaField_Physical, AOp.SchemaField_Changes);
    opCreateForeignKey: ScriptWrite_CreateForeignKey(AOp.SchemaTable, AOp.SchemaForeignKey);
    opDropForeignKey:   ScriptWrite_DropForeignKey(AOp.SchemaTable, AOp.SchemaForeignKey);
  else
    inherited;
  end;
end;

end.
