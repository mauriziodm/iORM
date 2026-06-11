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
    function GetInvalidFieldTypeConversions: string; virtual; abstract;
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




    // Sequences
    function SequenceExists(const ASequenceName: string): Boolean; virtual;
    procedure CreateTableSequence(const ATable: IioDBBuilderSchemaTable); virtual;



    // ForeignKeys
    procedure CreateOrAlterForeignKeys; virtual;
    procedure CreateOrAlterTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable); virtual;
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
    // Warnings
    procedure WarningInvalidFieldTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldType, ANewFieldType: String; const AInvalidTypeConversions: string); virtual;
    procedure WarningValueChanged(const AValueName, AOldValue, ANewValue: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    // Hook methods
    /// <summary>
    /// Hook method called during script generation to notify the user about key generation
    /// strategy fallbacks. If an entity explicitly requests a strategy (e.g. kgsSequence) that
    /// this DBMS does not support, the fallback was already applied silently by
    /// Resolve_KeyGenerationStrategy during schema building. This method detects such cases
    /// via IsKeyGenerationStrategyFallback and emits an informative hint (not a warning,
    /// which would block script execution).
    /// Override in derived classes to add DBMS-specific warnings (e.g. Firebird checks
    /// Identity support based on server version).
    /// </summary>
    procedure DoCheckKeyGenerationCompatibility; virtual;

    procedure GenerateDatabaseObjects; virtual; abstract;

    property ConnectionDefName: string read GetConnectionDefName;
    property Schema: IioDBBuilderSchema read GetSchema;
    property Script: IioDBBuilderSqlScript read GetScript;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);

    procedure GenerateCreateDatabaseScript; virtual;
    procedure GenerateUpdateDatabaseScript; virtual;
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
  if not ATable.UsesSequenceForKeyGeneration then
    Exit;

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
      Script.Body.Add(SqlGenerator.BuildSQL_DropFK(ATable, LFK));
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
    Script.Body.Add(SqlGenerator.BuildSQL_DropFKbyName(ATable.Name, LQuery.Fields[1].AsString.Trim));
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
      Script.Body.Add(SqlGenerator.BuildSQL_DropFK(ATable, LFK));
    // Create the FK (both for new and modified ones)
    Script.Body.Add(SqlGenerator.BuildSQL_CreateFK(ATable, LFK));
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
    Script.Body.Add(SqlGenerator.BuildSQL_CreateFK(ATable, LForeignKey));
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
        // are always handled separately in GenerateDatabaseObjects.
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

procedure TioDBBuilderStrategyBase.GenerateCreateDatabaseScript;
begin
  Schema.Status := stCreate;

  Script.ScriptBegin(ConnectionDefName, SqlGenerator.DBMSInfo);

  GenerateDatabaseObjects;

  Script.ScriptEnd;
end;

procedure TioDBBuilderStrategyBase.GenerateUpdateDatabaseScript;
begin
  Schema.Status := stUpdate;

  Script.ScriptBegin(ConnectionDefName, SqlGenerator.DBMSInfo);

  GenerateDatabaseObjects;

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

procedure TioDBBuilderStrategyBase.WarningInvalidFieldTypeConversion(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldType, ANewFieldType: String; const AInvalidTypeConversions: string);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
  if ContainsText(AInvalidTypeConversions, LRequiredConversion) then
    Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''',
      [ATable.Name, AField.FieldName, AOldFieldType, ANewFieldType]));
end;

procedure TioDBBuilderStrategyBase.WarningValueChanged(const AValueName, AOldValue, ANewValue: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue <> AOldValue then
    Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyBase.DoCheckKeyGenerationCompatibility;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
    if LTable.IsKeyGenerationStrategyFallback then
      Script.Hints.Add(Format(
        'Table ''%s'' requests %s key generation but this DBMS does not support it. Using %s instead.',
        [LTable.Name,
         TioUtilities.EnumToString<TioKeyGenerationStrategyType>(LTable.GetContextTable.GetKeyGenerationStrategy),
         TioUtilities.EnumToString<TioKeyGenerationStrategyType>(LTable.KeyGenerationStrategy)]));
end;

function TioDBBuilderStrategyBase.IsFieldTypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const AOldFieldType, ANewFieldType: String): Boolean;
begin
  Result := not SameText(AOldFieldType, ANewFieldType); // case-insensitive comparison
  if Result then
  begin
    AField.AddAltered(alFieldType);
    WarningInvalidFieldTypeConversion(ATable, AField, AOldFieldType, ANewFieldType, GetInvalidFieldTypeConversions);
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
        Script.Hints.Add
          (Format('Table ''%s'' field ''%s'' --> The not null setting is changed from FALSE to TRUE and a DEFAULT value has not been specified',
          [ATable.Name, AField.FieldName]));
    end
    else
      // If the NOT NULL change is not permitted, add a warning to indicate it cannot be automatically changed
      Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The NOT NULL setting cannot be changed automatically', [ATable.Name, AField.FieldName]));
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
      WarningValueChanged('blob sub-type', AOldBlobSubtype, ANewBlobSubtype, AField, ATable);
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
