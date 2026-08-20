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
unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Schema.Base, System.Classes, iORM.Context.Map.Interfaces, iORM.CommonTypes;

type

  TioDBBuilderSchema = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchema)
  private
    FForeignKeysMode, FIndexesMode: TioDBBuilderIndexesAndFKMode;
    FSequences: TioDBBuilderSchemaSequences;
    FTables: TioDBBuilderSchemaTables;
    function GetForeignKeysMode: TioDBBuilderIndexesAndFKMode;
    function GetIndexesMode: TioDBBuilderIndexesAndFKMode;
    function GetSequences: TioDBBuilderSchemaSequences;
    function GetTables: TioDBBuilderSchemaTables;
  public
    constructor Create(const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);
    destructor Destroy; override;
    procedure AddTable(const ATable: IioDBBuilderSchemaTable);
    function FindOrCreateTable(const AMap: IioMap; const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
    procedure ForceCreateStatus;
    procedure SequenceAddIfNotExists(const ASequenceName: String);
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, iORM.DBBuilder.Factory;

{ TioDBBuilderSchema }

// Inserts an already-built table node into the schema, keyed by its Name (used by the Introspector to
// populate the Physical branch). Unlike FindOrCreateTable it does not consult the ORM: the node is taken
// as-is. Raises if a table with the same name is already present (the catalog never lists duplicates).
procedure TioDBBuilderSchema.AddTable(const ATable: IioDBBuilderSchemaTable);
begin
  if FTables.ContainsKey(ATable.Name) then
    raise EioDBBuilderException.Create(ClassName, 'AddTable', Format('SchemaTable "%s" already exists.', [ATable.Name]));
  FTables.Add(ATable.Name, ATable);
end;

constructor TioDBBuilderSchema.Create(const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);
begin
  FSequences := TioDBBuilderSchemaSequences.Create;
  FIndexesMode := AIndexesMode;
  FForeignKeysMode := AForeignKeysMode;
  Status := stClean;
  FTables := TioDBBuilderSchemaTables.Create;
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FTables.Free;
  FSequences.Free;
  inherited;
end;

// This method implements a "find or create" (lazy registry) pattern on the FTables dictionary.
// It is called once per mapped class during schema building: each class contributes its fields,
// indexes and foreign keys to the corresponding SchemaTable object.
// When multiple classes share the same physical table (e.g. single-table inheritance / TrueClass),
// the first call creates the SchemaTable entry; subsequent calls for other classes mapped to the
// same table simply retrieve the existing entry and enrich it.
function TioDBBuilderSchema.FindOrCreateTable(const AMap: IioMap; const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
var
  LTableName: String;
begin
  LTableName := AMap.GetTable.TableName;
  if not FTables.ContainsKey(LTableName) then
    // The table does not exist yet in the schema: create it. The key generation strategy has
    // already been resolved by the SchemaBuilder (which owns the SqlGenerator): if the map declared
    // kgsAuto it has been translated into the concrete DBMS-specific strategy (e.g. Autoincrement for
    // SQLite, Identity/Sequence for Firebird 3+, etc.).
    FTables.Add(LTableName, TioDBBuilderFactory.NewSchemaTable(AMap.GetTable, AKeyGenerationStrategy));
  Result := FTables.Items[LTableName];
  // Update the IsTrueClass flag on the SchemaTable.
  // In single-table inheritance multiple classes share the same table, but only the
  // "true" class (the one that owns the discriminator field) has IsTrueClass = True.
  // The setter uses an OR-like logic: once set to True it never goes back to False,
  // so if at least one of the mapped classes is the TrueClass the flag stays True.
  Result.IsTrueClass := AMap.GetTable.IsTrueClass;
end;

function TioDBBuilderSchema.FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
begin
  if FTables.ContainsKey(ATableName) then
    Result := FTables.Items[ATableName]
  else
  begin
    if ARaiseIfNotFound then
      raise EioDBBuilderException.Create(ClassName, 'GetTableStatus', Format('SchemaTable not found "%s".', [ATableName]))
    else
      Result := nil;
  end;
end;

function TioDBBuilderSchema.GetForeignKeysMode: TioDBBuilderIndexesAndFKMode;
begin
  Result := FForeignKeysMode;
end;

function TioDBBuilderSchema.GetIndexesMode: TioDBBuilderIndexesAndFKMode;
begin
  Result := FIndexesMode;
end;

// The create-from-scratch path (as when the target database does not exist): forces the whole schema tree to
// stCreate so GenerateScript emits a coherent full "create from scratch" script regardless of the
// actual database state. For documentation/baseline only. Delegates the per-table cascade (fields,
// indexes, FKs) to each SchemaTable instead of reaching into its internal composition from here.
procedure TioDBBuilderSchema.ForceCreateStatus;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Status := stCreate;
  for LTable in FTables.Values do
    LTable.ForceCreateStatus;
end;

procedure TioDBBuilderSchema.SequenceAddIfNotExists(const ASequenceName: String);
begin
  if ASequenceName.Trim.IsEmpty then
    raise EioDBBuilderException.Create(ClassName, 'SequenceAddIfNotExists', Format('Invalid sequence name "%s"', [ASequenceName]));
  if FSequences.IndexOf(ASequenceName) = -1 then
    FSequences.Add(ASequenceName);
end;

function TioDBBuilderSchema.GetSequences: TioDBBuilderSchemaSequences;
begin
  Result := FSequences;
end;

function TioDBBuilderSchema.GetTables: TioDBBuilderSchemaTables;
begin
  Result := FTables;
end;

end.
