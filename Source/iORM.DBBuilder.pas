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
unit iORM.DBBuilder;

interface

uses
  System.Classes,

  iORM.CommonTypes,
  iORM.Context.Table.Interfaces,
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Script

  ;

type

  TioDBBuilder = class(TInterfacedObject, IioDBBuilder)
  private
    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function Prepare_ForceCreateDB(const AConnectionDefName: String;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderMode): IioDBBuilderContext;
    function Prepare_SyncDBStruct(const AConnectionDefName: String;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderMode): IioDBBuilderContext;
    procedure Warning_MultipleFKsOnSameField(const AContext: IioDBBuilderContext);
  protected
  public
  end;

implementation

uses
  System.Generics.Collections,
  System.SysUtils,

  iORM.DBBuilder.Factory

  ;

{ TioDBBuilder }

// A relation whose child type resolves to more than one table (e.g. a BelongsTo towards an interface
// or a base class implemented by several classes mapped on distinct tables) produces one FK per
// resolved table, all on the same field. On most DBMS this means the field value should exist in ALL
// the referenced tables at the same time, which almost never works correctly at runtime. The script
// is generated anyway but the user is warned (with the escape hatches) instead of failing or staying
// silent. Detection is a post-scan of the (data-only) schema so the SchemaBuilder stays untouched.
procedure TioDBBuilder.Warning_MultipleFKsOnSameField(const AContext: IioDBBuilderContext);
var
  LFieldKey: String;
  LFKsByField: TObjectDictionary<String, TStringList>; // dependent "Table.Field" -> referenced table names
  LForeignKey: IioDBBuilderSchemaFK;
  LReferencedTables: TStringList;
  LTable: IioDBBuilderSchemaTable;
begin
  LFKsByField := TObjectDictionary<String, TStringList>.Create([doOwnsValues]);
  try
    for LTable in AContext.Reconciliation.MappedSchema.Tables.Values do
      for LForeignKey in LTable.ForeignKeys.Values do
      begin
        LFieldKey := Format('%s.%s', [LForeignKey.DependentTableName, LForeignKey.DependentFieldName]);
        if not LFKsByField.TryGetValue(LFieldKey, LReferencedTables) then
        begin
          LReferencedTables := TStringList.Create;
          LFKsByField.Add(LFieldKey, LReferencedTables);
        end;
        LReferencedTables.Add(LForeignKey.ReferenceTableName);
      end;
    for LFieldKey in LFKsByField.Keys do
      if LFKsByField[LFieldKey].Count > 1 then
        AContext.Script.Warnings.AddLine(Format('Field "%s" has %d foreign key constraints, one for each of the referenced tables (%s). ' +
          'This usually happens when a BelongsTo relation points to a type mapped on more than one table (e.g. an interface or a base class): ' +
          'referential integrity constraints to multiple tables at once almost never work correctly because the field value should exist ' +
          'in all the referenced tables at the same time. You can disable the creation of the foreign key for the single property by ' +
          'decorating it with the attribute "[ioForeignKey(fkDoNotCreate)]", or completely disable the automatic creation of foreign keys ' +
          'by setting the property "AutoCreateDB.ForeignKeys" to False in the ConnectionDef component.',
          [LFieldKey, LFKsByField[LFieldKey].Count, LFKsByField[LFieldKey].CommaText]));
  finally
    LFKsByField.Free;
  end;
end;

function TioDBBuilder.Prepare_ForceCreateDB(const AConnectionDefName: String;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderMode): IioDBBuilderContext;
var
  LContext: IioDBBuilderContext;
  LPlanBuilder: IioDBBuilderPlanBuilder;
  LStrategy: IioDBBuilderStrategy;
begin
  LContext := TioDBBuilderFactory.NewContext(AConnectionDefName, AIndexesMode, AForeignKeysMode);
  LStrategy := TioDBBuilderFactory.NewStrategy(LContext);
  LPlanBuilder := TioDBBuilderFactory.NewPlanBuilder(LContext);

  // Self-contained: LContext.Reconciliation.MappedSchema is already fully populated from the class/entity maps (NewSchema
  // -> BuildSchema, no DB access). Force the whole tree to stCreate (the create-from-scratch path, as
  // when the target DB does not exist), and flag the result so Context.Execute refuses to run it unless the
  // caller explicitly passes AForce = True: it must NOT be executed against an existing database.
  LContext.Script.Warnings.AddLine('ATTENTION: This script was generated in FORCE-CREATE mode, the actual state ' +
    'of the target database was NOT analyzed and is ignored. Review it carefully before running it against an ' +
    'existing database.');
  Warning_MultipleFKsOnSameField(LContext);
  LContext.Reconciliation.MappedSchema.ForceCreateStatus;
  // Build the Plan of all-create operations (Physical schema left nil, so everything is "new") for the
  // op-driven WithAlterTable generation. WithoutAlterTable ignores the Plan and works off the forced Status.
  LPlanBuilder.BuildPlan;
  LStrategy.GenerateScript;
  Result := LContext;
end;

function TioDBBuilder.Prepare_SyncDBStruct(const AConnectionDefName: String;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderMode): IioDBBuilderContext;
var
  LContext: IioDBBuilderContext;
  LPlanBuilder: IioDBBuilderPlanBuilder;
  LStrategy: IioDBBuilderStrategy;
begin
  LContext := TioDBBuilderFactory.NewContext(AConnectionDefName, AIndexesMode, AForeignKeysMode);
  LPlanBuilder := TioDBBuilderFactory.NewPlanBuilder(LContext);

  Warning_MultipleFKsOnSameField(LContext);

  // Built once and shared: only the eventual script generation needs this dialect-specific Strategy for
  // this Context (the Introspector asks Context.SqlGenerator directly for Check_DatabaseExists).
  LStrategy := TioDBBuilderFactory.NewStrategy(LContext);

  // Reconciliation: when the DB exists, introspect it into the Physical schema; when it does not, force a
  // full create-from-scratch (Physical stays nil). Then build the Plan from the diff (which also stamps
  // the nodes' Status, the coarse view WithoutAlterTable reads) - with a nil Physical everything is a
  // create, so the fresh-DB case produces an all-create Plan.
  if not LStrategy.Check_DatabaseExists then
    LContext.Reconciliation.MappedSchema.ForceCreateStatus
  else
    LContext.Reconciliation.PhysicalSchema := TioDBBuilderFactory.NewIntrospector(LContext).Introspect;

  LPlanBuilder.BuildPlan;

  LStrategy.GenerateScript;
  Result := LContext;
end;

end.
