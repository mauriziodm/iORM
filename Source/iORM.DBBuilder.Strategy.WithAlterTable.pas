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
  iORM.Attributes,
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base

  ;


type
  TioDBBuilderStrategyWithAlterTable = class(TioDBBuilderStrategyBase)
  protected
    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable); override;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function Check_FieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function Check_FieldDefaultChanged(const AOldFieldDefault, ANewFieldDefault: String; const AField: IioDBBuilderSchemaField): Boolean; virtual;
    function Check_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function Check_FieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function Check_FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function Check_FieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    function Check_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    function Check_IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function Check_ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    function Check_ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;

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

uses
  System.SysUtils,
  System.StrUtils,

  iORM.CommonTypes,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine

  ;


{ TioDBBuilderStrategyWithAlterTable }

procedure TioDBBuilderStrategyWithAlterTable.ScriptWrite_AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  if ATable.HasFieldChanges then
    Process_Fields(ATable);
end;

procedure TioDBBuilderStrategyWithAlterTable.ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  inherited;

  // Add sequence only if the table uses Sequence for key generation
  if ATable.UsesSequenceForKeyGeneration then
    ScriptWrite_CreateTableSequence(ATable);

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

function TioDBBuilderStrategyWithAlterTable.Check_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FieldExists(ATable, AField), True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyWithAlterTable.Check_FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;

  LNewFieldType: string;
  LNewFieldSubtype: string;
  LNewFieldLength: Smallint;
  LNewFieldPrecision: Smallint;
  LNewFieldDecimals: Smallint;

  LOldFieldType: string;
  LOldFieldSubtype: string;
  LOldFieldLength: Smallint;
  LOldFieldPrecision: Smallint;
  LOldFieldDecimals: Smallint;
  LOldFieldNotNull: boolean;
  LOldFieldDefault: string;
  LNewFieldDefault: string;

  function IsDecimalOrNumeric: boolean;
  begin
    // The query now returns 'DECIMAL' or 'NUMERIC' directly for decimal types
    Result := (LOldFieldType = 'DECIMAL') or (LOldFieldType = 'NUMERIC');
  end;

begin
  Result := False;
  // Load some new field informations
  LNewFieldType := Context.SqlGenerator.Translate_SchemaField_To_FieldType(AField, False);  // False = do NOT include attributes (only base type)
  LNewFieldSubtype := IfThen(AField.FieldSubtype.IsEmpty, '0', AField.FieldSubtype);
  LNewFieldLength := AField.FieldLength;
  LNewFieldPrecision := AField.FieldPrecision;
  LNewFieldDecimals := AField.FieldScale;
  LNewFieldDefault := Context.SqlGenerator.Translate_SchemaField_To_DefaultValue(AField);

  // Create and open the query for old field informations
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FieldList(ATable.Name, AField.FieldName), True);

  // Field not found
  if LQuery.Eof then
    Exit(False);

  // Load some old field informations
  LOldFieldType := LQuery.Fields.FieldByName('field_type').AsString;
  LOldFieldSubtype := LQuery.Fields.FieldByName('field_subtype').AsString;
  LOldFieldDecimals := Abs(LQuery.Fields.FieldByName('field_scale').AsInteger);
  LOldFieldNotNull := LQuery.Fields.FieldByName('field_not_null').AsInteger = 1;
  LOldFieldLength := LQuery.Fields.FieldByName('field_length').AsInteger;
  LOldFieldPrecision := LQuery.Fields.FieldByName('field_precision').AsInteger;
  LOldFieldDefault := LQuery.Fields.FieldByName('field_default').AsString.Trim;
  if LOldFieldDefault.ToUpper.StartsWith('DEFAULT ') then
    LOldFieldDefault := LOldFieldDefault.Substring(8).Trim;

  // Verify if fieldType has been changed and check type affinity
  Result := Result or Check_FieldTypeChanged(ATable, AField, LOldFieldType, LNewFieldType);

  // Verify if FieldLength is changed
  if 'VARCHAR,CHAR'.Contains(LNewFieldType) or 'VARCHAR,CHAR'.Contains(LOldFieldType) then
    Result := Result or Check_FieldLengthChanged(LOldFieldLength, LNewFieldLength, AField, ATable);

  if IsDecimalOrNumeric then
  begin
    // Verify if something has been changed in FieldPrecision
    Result := Result or Check_FieldPrecisionChanged(LOldFieldPrecision, LNewFieldPrecision, AField, ATable);
    // Verify if something has been changed in FieldDecimals (scale)
    Result := Result or Check_FieldDecimalsChanged(LOldFieldDecimals, LNewFieldDecimals, AField, ATable);
  end;

  // Verify if DEFAULT setting of the field is changed
  Result := Result or Check_FieldDefaultChanged(LOldFieldDefault, LNewFieldDefault, AField);

  // Verify if NotNull is changed
  // Check if NOT NULL changes are supported by this RDBMS version
  Result := Result or Check_FieldNotNullChanged(ATable, AField, LOldFieldNotNull, AField.FieldNotNull, Context.SqlGenerator.Supports_AlterNotNull);

  // Verify if blob subtype is changed
  // Check if BLOB subtype changes are permitted by this RDBMS
  if LNewFieldType.StartsWith('BLOB') then
    Result := Result or Check_FieldBlobSubtypeChanged(ATable, AField, LOldFieldSubtype, LNewFieldSubtype, Context.SqlGenerator.Supports_AlterBlobSubtype);
end;

function TioDBBuilderStrategyWithAlterTable.Check_ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  // BuildSQL_FKList returns only the specific FK (or empty result if not exists)
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName,
    Context.SqlGenerator.BuildSQL_FKList(ATable.Name,
    Context.SqlGenerator.Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey)),
    True);
  Result := not LQuery.Eof;
end;

function TioDBBuilderStrategyWithAlterTable.Check_ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
  LFKName: string;
  LOldOnUpdate, LNewOnUpdate: string;
  LOldOnDelete, LNewOnDelete: string;
begin
  // Note: We only check ON UPDATE and ON DELETE actions here.
  // The structural properties (DependentFieldName, ReferenceTableName, ReferenceFieldName)
  // are encoded in the FK name, so if the FK exists with this name, those properties already match.
  // This also works when the FK name is shortened using a hash, because the hash is deterministic:
  // same input properties always produce the same hash, so a different hash means different properties.
  Result := False;

  // Build FK name using Context.SqlGenerator's method
  LFKName := Context.SqlGenerator.Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey);

  // Query by FK name: if no record is found, the FK name changed (meaning the structural
  // properties changed), so we exit and let Check_ForeignKeyExists handle it as a new FK.
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FKList(ATable.Name, LFKName), True);
  if LQuery.Eof then
    Exit;

  // Check ON UPDATE action
  LOldOnUpdate := LQuery.Fields.FieldByName('on_update').AsString.Trim.ToUpper;
  LNewOnUpdate := Context.SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnUpdateAction).ToUpper;
  if not SameText(LOldOnUpdate, LNewOnUpdate) then
    Exit(True);

  // Check ON DELETE action
  LOldOnDelete := LQuery.Fields.FieldByName('on_delete').AsString.Trim.ToUpper;
  LNewOnDelete := Context.SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnDeleteAction).ToUpper;
  if not SameText(LOldOnDelete, LNewOnDelete) then
    Exit(True);
end;

procedure TioDBBuilderStrategyWithAlterTable.GenerateScript_Body;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Check key generation strategy compatibility with RDBMS version.
  // The diagnostic lives on the Context.SqlGenerator (DBMS-capability axis), not on the Strategy.
  Context.SqlGenerator.CheckKeyGenerationCompatibility(Context.Schema, Context.Script);

  // Strict mode (indexes): drop every index from the DB for each stUpdate table.
  // This removes orphaned indexes (including manually-added ones) and ensures
  // a clean slate before the schema-driven recreation.
  // We call the Force* mechanic directly instead of routing through the
  // mode-aware public Process_DropTableIndexes: the sync flow already knows by
  // construction that the desired behavior here is the FromDB drop, so going
  // through the dispatcher would be redundant indirection. The Force* naming
  // makes the bypass intent explicit. Indexes and FKs are kept in two distinct
  // blocks because they are independent concerns (separate mode parameter for
  // each), and the separation keeps each path immediately readable.
  if Context.Schema.IndexesMode = ifmEnabledStrict then
  begin
    Context.Script.Body.AddTitle('Dropping indexes (strict mode)');
    for LTable in Context.Schema.Tables.Values do
      if LTable.Status = stUpdate then
        Force_DropTableIndexesFromDB(LTable);
  end;

  // Strict mode (foreign keys): same approach as the indexes block above,
  // independent because ForeignKeysMode is a separate parameter.
  if Context.Schema.ForeignKeysMode = ifmEnabledStrict then
  begin
    Context.Script.Body.AddTitle('Dropping foreign keys (strict mode)');
    for LTable in Context.Schema.Tables.Values do
      if LTable.Status = stUpdate then
        Force_DropTableForeignKeysFromDB(LTable);
  end;

  // Create new tables or alter existing ones (fields and sequences only)
  Process_Tables;

  // Indexes: create/alter based on mode (skipped if disabled)
  if Context.Schema.IndexesMode >= ifmEnabled then
    Process_Indexes;

  // Foreign keys are processed last so all referenced tables are already created.
  if Context.Schema.ForeignKeysMode >= ifmEnabled then
    Process_ForeignKeys;
end;

function TioDBBuilderStrategyWithAlterTable.Check_IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQueryIndexList: IioQuery;
  LQueryIndexDetails: IioQuery;
  LIndexName: string;
  LOldFieldList: string;
  LNewFieldList: string;
begin
  Result := False;
  LIndexName := Context.SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);

  // Get basic info (unique flag, orientation) for all indexes in the table
  LQueryIndexList := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_IndexList(ATable.Name), True);

  // Find the specific index in the result set
  while not LQueryIndexList.Eof do
  begin
    if SameText(LQueryIndexList.Fields.FieldByName('RDB$INDEX_NAME').AsString.Trim, LIndexName) then
    begin
      // Check unique flag
      if LQueryIndexList.Fields.FieldByName('RDB$UNIQUE_FLAG').AsInteger <> AIndex.Unique.ToInteger then
        AIndex.AddChange(icUnique);

      // Check orientation
      // Note: Firebird index type can be 0 = Ascending, 1 = Descending.
      // iORM orientation actually uses same values, but in the future, changes must be made carefully.
      if LQueryIndexList.Fields.FieldByName('RDB$INDEX_TYPE').AsInteger <> Ord(AIndex.Orientation) then
        AIndex.AddChange(icOrientation);

      Break; // Found the index, exit loop
    end;
    LQueryIndexList.Next;
  end;

  // If index not found, exit
  if LQueryIndexList.Eof then
    Exit;

  // Get fields info
  LQueryIndexDetails := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_IndexDetails(LIndexName), True);

  // Build old field list from database
  LOldFieldList := '';
  while not LQueryIndexDetails.Eof do
  begin
    if not LOldFieldList.IsEmpty then
      LOldFieldList := LOldFieldList + ',';
    LOldFieldList := LOldFieldList + LQueryIndexDetails.Fields.FieldByName('RDB$FIELD_NAME').AsString.Trim.ToUpper;
    LQueryIndexDetails.Next;
  end;

  // Compare field lists
  LNewFieldList := AIndex.CommaSepFieldList.ToUpper.Replace(' ', '');
  LOldFieldList := LOldFieldList.Replace(' ', '');
  if not SameText(LOldFieldList, LNewFieldList) then
    AIndex.AddChange(icFields);

  Result := AIndex.Changes <> [];
end;

function TioDBBuilderStrategyWithAlterTable.Check_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_IndexExists(ATable, AIndex), True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyWithAlterTable.Check_FieldDefaultChanged(const AOldFieldDefault, ANewFieldDefault: String;
  const AField: IioDBBuilderSchemaField): Boolean;
begin
  Result := not SameText(AOldFieldDefault, ANewFieldDefault);
  if Result then
    AField.AddAltered(fcDefault);
end;

function TioDBBuilderStrategyWithAlterTable.Check_FieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := AOldFieldDecimals <> ANewFieldDecimals;
  if Result then
  begin
    AField.AddAltered(fcType);
    Warning_PotentialDataTruncation('field DECIMALS', AOldFieldDecimals, ANewFieldDecimals, AField, ATable);
  end;
end;

function TioDBBuilderStrategyWithAlterTable.Check_FieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := ANewFieldLength <> AOldFieldLength;
  if Result then
  begin
    if ANewFieldLength > AOldFieldLength then
      AField.AddAltered(fcLengthIncreased)
    else
    begin
      AField.AddAltered(fcLengthDecreased);
      Warning_PotentialDataTruncation('field LENGTH', AOldFieldLength, ANewFieldLength, AField, ATable);
    end;
  end;
end;

function TioDBBuilderStrategyWithAlterTable.Check_FieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := AOldFieldPrecision <> ANewFieldPrecision;
  if Result then
  begin
    if ANewFieldPrecision > AOldFieldPrecision then
      AField.AddAltered(fcPrecisionIncreased)
    else
      AField.AddAltered(fcPrecisionDecreased);

    Warning_PotentialDataTruncation('field PRECISION', AOldFieldPrecision, ANewFieldPrecision, AField, ATable);
  end;
end;

end.
