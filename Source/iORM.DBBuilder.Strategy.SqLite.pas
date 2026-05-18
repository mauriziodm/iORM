unit iORM.DBBuilder.Strategy.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.WithoutAlterTable

  ;


type
  TioDBBuilderStrategySqLite = class(TioDBBuilderStrategyWithoutAlterTable)
  protected
    // Constraint deferral hooks
    procedure BeginDeferConstraints; override;
    procedure EndDeferConstraints; override;
    // Tables
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
    // Fields
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    // Field change detection methods
    function GetInvalidFieldTypeConversions: string; override;
    // Indexes
    procedure DropIndexes; override;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    // ForeignKeys
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
  public

  end;


implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.Attributes,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine,
  iORM.CommonTypes

  ;


const
  INVALID_FIELDTYPE_CONVERSIONS =
    '[text->integer][text->real][text->numeric][text->blob][real->integer][real->blob]' +
    '[numeric->integer][numeric->blob][blob->real][blob->numeric][blob->integer][blob->text]';



{ TioDBBuilderSqLite }

procedure TioDBBuilderStrategySqLite.BeginDeferConstraints;
begin
  Script.Body.AddEmpty;
  Script.Body.AddComment('Before we start: defer foreign key checks to avoid errors during table rebuild');
  Script.Body.Add('PRAGMA defer_foreign_keys=on;');
end;

procedure TioDBBuilderStrategySqLite.EndDeferConstraints;
begin
  Script.Body.AddEmpty;
  Script.Body.AddComment('At the end: restore normal foreign key checks');
  Script.Body.Add('PRAGMA defer_foreign_keys=off;');
  Script.Body.AddEmpty;
end;

function TioDBBuilderStrategySqLite.GetInvalidFieldTypeConversions: string;
begin
  Result := INVALID_FIELDTYPE_CONVERSIONS;
end;

procedure TioDBBuilderStrategySqLite.CreateTable(const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  Script.Body.Add(SqlGenerator.BuildSQL_BeginCreateTable(ATable));
  Script.Body.IncIndent;

  // Inline field creation
  LComma := '  ';
  for LField in ATable.Fields do
  begin
    Script.Body.AddLine(LComma + SqlGenerator.BuildSQL_FieldDefinition(ATable, LField));
    LComma := ', ';
  end;

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(ATable);

  Script.Body.DecIndent;
  Script.Body.Add(SqlGenerator.BuildSQL_EndCreateTable(ATable));
end;

/// <summary>
/// Drops all indexes for tables that need to be rebuilt (stUpdate).
/// Unlike iterating schema indexes (which would miss indexes removed from the schema),
/// this method queries the actual database via BuildSQL_IndexList to discover all
/// existing indexes per table. This ensures that orphaned indexes (e.g. an index whose
/// [ioIndex] attribute was removed from an entity) are also dropped and don't remain
/// indefinitely in the database.
/// Tables that are unchanged (stClean) or new (stCreate) are skipped.
/// Note: tables are not dropped when absent from the schema because that would cause
/// data loss; indexes, being derived objects, can safely be dropped and recreated.
/// </summary>
procedure TioDBBuilderStrategySqLite.DropIndexes;
var
  LTable: IioDBBuilderSchemaTable;
  LQuery: IioQuery;
begin
  inherited;

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    // Query the database for all real indexes on this table, not the schema,
    // so that indexes no longer defined in the schema are also dropped.
    LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(LTable.Name), True);
    while not LQuery.Eof do
    begin
      Script.Body.Add(SqlGenerator.BuildSQL_DropIndexByName(LQuery.Fields[0].AsString));
      LQuery.Next;
    end;
  end;
end;

function TioDBBuilderStrategySqLite.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  // SQLite limitation: PRAGMA table_info returns ALL columns - must filter manually
  // Execute query (returns all fields from the table)
  Result := False;
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FieldExists(ATable, AField), True);

  // Manual filtering: loop through all columns and find matching field name
  while not LQuery.Eof do
  begin
    if SameText(LQuery.Fields.FieldByName('name').AsString, AField.FieldName) then
      Exit(True);

    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
  LNewFieldName: string;
  LNewFieldType: string;
  LOldFieldName: string;
  LOldFieldType: string;
  LOldFieldNotNull: Boolean;
begin
  // SQLite limitation: PRAGMA table_info returns ALL columns - must filter manually
  // Execute query (returns all fields from the table)
  Result := False;
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FieldList(ATable.Name), True);

  // Manual filtering: loop through all columns to find the target field
  while not LQuery.Eof do
  begin
    LOldFieldName := LQuery.Fields.FieldByName('name').AsString;
    LNewFieldName := AField.FieldName;

    // Find the field
    if SameText(LOldFieldName, LNewFieldName) then
    begin
      LOldFieldType := LQuery.Fields.FieldByName('type').AsString;
      LOldFieldNotNull := (LQuery.Fields.FieldByName('notnull').AsInteger <> 0);
      // Note: For SQLite, the second parameter is irrelevant (SQLite doesn't support type attributes like length/precision/scale)
      LNewFieldType := SqlGenerator.Translate_SchemaField_To_FieldType(AField, False);

      // Verify if fieldType has been changed and check type affinity
      Result := Result or IsFieldTypeChanged(ATable, AField, LOldFieldType, LNewFieldType);

      // Verify if NotNull is changed
      Result := Result or IsFieldNotNullChanged(ATable, AField, LOldFieldNotNull, AField.FieldNotNull, True);

      // Exit
      Exit;
    end;
    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexExists(ATable, AIndex), True);
  Result := not LQuery.Eof;
end;

function TioDBBuilderStrategySqLite.IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQueryIndexList: IioQuery;
  LQueryIndexDetails: IioQuery;
  LIndexName: string;
  LOldUnique: Boolean;
  LOldFieldList: string;
  LNewFieldList: string;
  LSqlDefinition: string;
  LOldOrientation: TioIndexOrientation;
begin
  Result := False;
  LIndexName := SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);

  // Query sqlite_master for index info including SQL definition
  // Extract unique and orientation from the CREATE INDEX statement in sqlite_master.sql
  // We parse the SQL definition because PRAGMA index_list doesn't provide orientation info
  // Note: iORM applies the same orientation to all fields (no mixed ASC/DESC per field)
  // Example SQL: "CREATE UNIQUE INDEX idx_name ON table (field1 DESC, field2 DESC)"
  LQueryIndexList := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(ATable.Name), True);

  while not LQueryIndexList.Eof do
  begin
    if SameText(LQueryIndexList.Fields.FieldByName('name').AsString, LIndexName) then
    begin
      LSqlDefinition := LQueryIndexList.Fields.FieldByName('sql').AsString.ToUpper;

      // Check uniqueness from SQL definition
      LOldUnique := LSqlDefinition.Contains('UNIQUE INDEX');
      if LOldUnique <> AIndex.Unique then
        AIndex.AddChange(icUnique);

      // Check orientation from SQL definition
      if LSqlDefinition.Contains(' DESC') then
        LOldOrientation := ioDescending
      else
        LOldOrientation := ioAscending;
      if LOldOrientation <> AIndex.Orientation then
        AIndex.AddChange(icOrientation);

      // Get field list using BuildSQL_IndexDetails (PRAGMA index_info)
      LQueryIndexDetails := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexDetails(LIndexName), True);
      LOldFieldList := '';

      // Note: PRAGMA index_info guarantees results ordered by seqno (field position in index)
      while not LQueryIndexDetails.Eof do
      begin
        if not LOldFieldList.IsEmpty then
          LOldFieldList := LOldFieldList + ',';
        LOldFieldList := LOldFieldList + LQueryIndexDetails.Fields.FieldByName('name').AsString.ToUpper;
        LQueryIndexDetails.Next;
      end;

      // Compare field lists
      LNewFieldList := AIndex.CommaSepFieldList.ToUpper.Replace(' ', '');
      LOldFieldList := LOldFieldList.Replace(' ', '');
      if not SameText(LOldFieldList, LNewFieldList) then
        AIndex.AddChange(icFields);

      Result := AIndex.Changes <> [];
      Exit;
    end;
    LQueryIndexList.Next;
  end;
end;

function TioDBBuilderStrategySqLite.ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  // SQLite limitation: PRAGMA foreign_key_list cannot filter by FK name
  // We pass only the table name - BuildSQL_FKList returns ALL FKs for the table
  // PRAGMA foreign_key_list returns: id, seq, table, from, to, on_update, on_delete, match
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FKList(ATable.Name), True);

  // Manual filtering: loop through all FKs and match by dependent field + reference table
  while not LQuery.Eof do
  begin
    // Match by dependent field (from) and reference table
    if SameText(LQuery.Fields.FieldByName('from').AsString, AForeignKey.DependentFieldName) and
       SameText(LQuery.Fields.FieldByName('table').AsString, AForeignKey.ReferenceTableName) then
      Exit(True);

    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
  LOldOnUpdate, LOldOnDelete: string;
  LNewOnUpdate, LNewOnDelete: string;
begin
  Result := False;

  // SQLite limitation: PRAGMA foreign_key_list cannot filter by FK name
  // We pass only the table name - BuildSQL_FKList returns ALL FKs for the table
  // PRAGMA foreign_key_list returns: id, seq, table, from, to, on_update, on_delete, match
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FKList(ATable.Name), True);

  // Manual filtering: loop through all FKs and find the matching one
  while not LQuery.Eof do
  begin
    // Find the matching FK by dependent field and reference table
    if SameText(LQuery.Fields.FieldByName('from').AsString, AForeignKey.DependentFieldName) and
       SameText(LQuery.Fields.FieldByName('table').AsString, AForeignKey.ReferenceTableName) then
    begin
      // Check reference field
      if not SameText(LQuery.Fields.FieldByName('to').AsString, AForeignKey.ReferenceFieldName) then
        Exit(True);

      // Check ON UPDATE action
      // Note: PRAGMA foreign_key_list returns actions as: NO ACTION, RESTRICT, CASCADE, SET NULL, SET DEFAULT
      LOldOnUpdate := LQuery.Fields.FieldByName('on_update').AsString.ToUpper;
      LNewOnUpdate := SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnUpdateAction).ToUpper;
      if not SameText(LOldOnUpdate, LNewOnUpdate) then
        Exit(True);

      // Check ON DELETE action
      // Note: PRAGMA foreign_key_list returns actions as: NO ACTION, RESTRICT, CASCADE, SET NULL, SET DEFAULT
      LOldOnDelete := LQuery.Fields.FieldByName('on_delete').AsString.ToUpper;
      LNewOnDelete := SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnDeleteAction).ToUpper;
      if not SameText(LOldOnDelete, LNewOnDelete) then
        Exit(True);

      Exit(False); // FK exists and is not modified
    end;
    LQuery.Next;
  end;

  // FK not found - shouldn't happen if ForeignKeyExists was called first
  Result := False;
end;

end.
