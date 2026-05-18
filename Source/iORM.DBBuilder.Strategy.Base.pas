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
    // Database
    procedure CreateDatabase; virtual;
    function DatabaseExists: Boolean; virtual;
    // Tables
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateOrAlterTables; virtual;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); virtual;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    // Fields
    procedure CreateOrAlterFields(const ATable: IioDBBuilderSchemaTable); virtual;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual; abstract;
    // Field change detection methods (common to all databases)
    function GetInvalidFieldTypeConversions: string; virtual; abstract;
    function IsFieldTypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldType, ANewFieldType: String): Boolean; virtual;
    function IsFieldNotNullChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AIsPermitted: Boolean): Boolean; virtual;
    function IsFieldBlobSubtypeChanged(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const AOldBlobSubtype, ANewBlobSubtype: String; const AIsPermitted: Boolean): Boolean; virtual;




    // Indexes

    procedure CreateOrAlterIndexes; virtual;

    procedure CreateIndexes; virtual;

    procedure CreateOrAlterTableIndexes(const ATable: IioDBBuilderSchemaTable); virtual;

    procedure DropIndexes; virtual;
    procedure DropTableIndexes(const ATable: IioDBBuilderSchemaTable); virtual;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; overload; virtual; abstract;
    function IndexExists(const AIndexName: string): boolean; overload; virtual;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; virtual; abstract;




    // Sequences
    function SequenceExists(const ASequenceName: string): Boolean; virtual;
    procedure CreateTableSequence(const ATable: IioDBBuilderSchemaTable); virtual;
    // ForeignKeys
    procedure CreateOrAlterForeignKeys; virtual;
    procedure CreateForeignKeys; overload; virtual;
    procedure CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure DropForeignKeys; virtual;
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
  if ASequenceName.IsEmpty then
    raise EioInvalidArgumentException.Create(ClassName, 'SequenceExists', 'ASequenceName is not specified.');

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_SequenceExists(ASequenceName), True);
  Result := LQuery.Fields[0].AsInteger > 0;
end;

procedure TioDBBuilderStrategyBase.CreateTableSequence(const ATable: IioDBBuilderSchemaTable);
begin
  if not ATable.UsesSequenceForKeyGeneration then
    Exit;

  if ATable.GetSequenceName.IsEmpty then
    Exit;

  if (Schema.Status = stCreate) or not SequenceExists(ATable.GetSequenceName) then
    Script.Body.Add(SqlGenerator.BuildSQL_CreateSequence(ATable.GetSequenceName));
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
  LFK: IioDBBuilderSchemaFK;
begin
  for LTable in Schema.Tables.Values do
  begin
    if taForeignKeys in LTable.Changes then
    begin
      Script.Body.AddTitle(Format('Foreign keys for table ''%s''', [LTable.Name]));

      for LFK in LTable.ForeignKeys.Values do
      begin
        case LFK.Status of
          stCreate:
            begin
              Script.Body.Add(SqlGenerator.BuildSQL_CreateFK(LTable, LFK));
            end;
          stUpdate:
            begin
              Script.Body.Add(SqlGenerator.BuildSQL_DropFK(LTable, LFK));
              Script.Body.Add(SqlGenerator.BuildSQL_CreateFK(LTable, LFK));
            end;
        end;
      end;
    end;
  end;
end;

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

procedure TioDBBuilderStrategyBase.CreateForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Creating foreign keys');

  for LTable in Schema.Tables.Values do
    CreateTableForeignKeys(LTable);
end;

procedure TioDBBuilderStrategyBase.CreateTableForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  for LForeignKey in ATable.ForeignKeys.Values do
    Script.Body.Add(SqlGenerator.BuildSQL_CreateFK(ATable, LForeignKey));
end;

procedure TioDBBuilderStrategyBase.CreateIndexes;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Creating indexes');

  Script.Body.IncIndent;

  for LTable in Schema.Tables.Values do
    CreateOrAlterTableIndexes(LTable);

  Script.Body.DecIndent;
end;

/// <summary>
/// Generates the SQL statements to create or recreate the indexes of a single table.
/// When the table is new (stCreate), all its indexes are created unconditionally.
/// When the table already exists, only indexes marked as stCreate or stUpdate are
/// processed; updated indexes are dropped first and then recreated.
/// </summary>
procedure TioDBBuilderStrategyBase.CreateOrAlterTableIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LIndex in ATable.Indexes.Values do
  begin
    // Drop the old index first when it needs to be recreated with changes
    if LIndex.Status = stUpdate then
      Script.Body.Add(SqlGenerator.BuildSQL_DropIndex(ATable, LIndex));
    // Create the index: unconditionally for new tables, or only for new/modified indexes on existing tables
    if (ATable.Status = stCreate) or (LIndex.Status in [stCreate, stUpdate]) then
      Script.Body.Add(SqlGenerator.BuildSQL_CreateIndex(ATable, LIndex));
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

procedure TioDBBuilderStrategyBase.DropForeignKeys;
begin
  if Schema.Status = stCreate then
    Exit;

  Script.Body.AddTitle('Dropping foreign keys');
end;

procedure TioDBBuilderStrategyBase.DropIndexes;
begin
  if Schema.Status = stCreate then
    Exit;

  Script.Body.AddTitle('Dropping indexes');
end;

procedure TioDBBuilderStrategyBase.DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LIndex in ATable.Indexes.Values do
    Script.Body.Add(SqlGenerator.BuildSQL_DropIndex(ATable, LIndex));
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

function TioDBBuilderStrategyBase.IndexExists(const AIndexName: string): boolean;
begin
  Result := False;

  if AIndexName.IsEmpty then
    Exit;

  Result := _ExecuteExistsQuery(SqlGenerator.BuildSQL_IndexExistsByName(AIndexName));
end;

end.
