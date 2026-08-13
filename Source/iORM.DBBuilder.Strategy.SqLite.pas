unit iORM.DBBuilder.Strategy.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.WithoutAlterTable

  ;


type
  TioDBBuilderStrategySqLite = class(TioDBBuilderStrategyWithoutAlterTable)
  protected
    // ==========================================================
    // CONSTRAINT DEFERRAL HOOKS
    // ----------------------------------------------------------
    procedure ScriptWrite_BeginDeferConstraints; override;
    procedure ScriptWrite_EndDeferConstraints; override;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable); override;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function Check_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function Check_FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;

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
  public

  end;


implementation

uses
  System.SysUtils,

  iORM.DB.Interfaces,
  iORM.DB.QueryEngine,
  iORM.CommonTypes

  ;


{ TioDBBuilderSqLite }

procedure TioDBBuilderStrategySqLite.ScriptWrite_BeginDeferConstraints;
begin
  Context.Script.Body.AddEmpty;
  Context.Script.Body.AddComment('Before we start: defer foreign key checks to avoid errors during table rebuild');
  Context.Script.Body.Add('PRAGMA defer_foreign_keys=on;');
end;

procedure TioDBBuilderStrategySqLite.ScriptWrite_EndDeferConstraints;
begin
  Context.Script.Body.AddEmpty;
  Context.Script.Body.AddComment('At the end: restore normal foreign key checks');
  Context.Script.Body.Add('PRAGMA defer_foreign_keys=off;');
  Context.Script.Body.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_BeginCreateTable(ATable));
  Context.Script.Body.IncIndent;

  // Inline field creation
  LComma := '  ';
  for LField in ATable.Fields do
  begin
    Context.Script.Body.AddLine(LComma + Context.SqlGenerator.BuildSQL_FieldDefinition(ATable, LField));
    LComma := ', ';
  end;

  // Note: for SQLite, FKs are inline in the CREATE TABLE statement.
  // ifmEnabled and ifmEnabledStrict behave identically here.
  if Context.Reconciliation.MappedSchema.ForeignKeysMode <> ifmDisabled then
    ScriptWrite_CreateTableForeignKeys(ATable);

  Context.Script.Body.DecIndent;
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_EndCreateTable(ATable));
end;

function TioDBBuilderStrategySqLite.Check_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  // SQLite limitation: PRAGMA table_info returns ALL columns - must filter manually
  // Execute query (returns all fields from the table)
  Result := False;
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FieldExists(ATable, AField), True);

  // Manual filtering: loop through all columns and find matching field name
  while not LQuery.Eof do
  begin
    if SameText(LQuery.Fields.FieldByName('name').AsString, AField.FieldName) then
      Exit(True);

    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.Check_FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
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
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FieldList(ATable.Name), True);

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
      LNewFieldType := Context.SqlGenerator.Translate_SchemaField_To_FieldType(AField, False);

      // Verify if fieldType has been changed and check type affinity
      Result := Result or Check_FieldTypeChanged(ATable, AField, LOldFieldType, LNewFieldType);

      // Verify if NotNull is changed
      Result := Result or Check_FieldNotNullChanged(ATable, AField, LOldFieldNotNull, AField.FieldNotNull, True);

      // Exit
      Exit;
    end;
    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.Check_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_IndexExists(ATable, AIndex), True);
  Result := not LQuery.Eof;
end;

function TioDBBuilderStrategySqLite.Check_IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
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
  LIndexName := Context.SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);

  // Query sqlite_master for index info including SQL definition
  // Extract unique and orientation from the CREATE INDEX statement in sqlite_master.sql
  // We parse the SQL definition because PRAGMA index_list doesn't provide orientation info
  // Note: iORM applies the same orientation to all fields (no mixed ASC/DESC per field)
  // Example SQL: "CREATE UNIQUE INDEX idx_name ON table (field1 DESC, field2 DESC)"
  LQueryIndexList := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_IndexList(ATable.Name), True);

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
      LQueryIndexDetails := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_IndexDetails(LIndexName), True);
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

function TioDBBuilderStrategySqLite.Check_ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  // SQLite limitation: PRAGMA foreign_key_list cannot filter by FK name
  // We pass only the table name - BuildSQL_FKList returns ALL FKs for the table
  // PRAGMA foreign_key_list returns: id, seq, table, from, to, on_update, on_delete, match
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FKList(ATable.Name), True);

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

function TioDBBuilderStrategySqLite.Check_ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
  LOldOnUpdate, LOldOnDelete: string;
  LNewOnUpdate, LNewOnDelete: string;
begin
  // SQLite limitation: PRAGMA foreign_key_list cannot filter by FK name
  // We pass only the table name - BuildSQL_FKList returns ALL FKs for the table
  // PRAGMA foreign_key_list returns: id, seq, table, from, to, on_update, on_delete, match
  LQuery := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, Context.SqlGenerator.BuildSQL_FKList(ATable.Name), True);

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
      LNewOnUpdate := Context.SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnUpdateAction).ToUpper;
      if not SameText(LOldOnUpdate, LNewOnUpdate) then
        Exit(True);

      // Check ON DELETE action
      // Note: PRAGMA foreign_key_list returns actions as: NO ACTION, RESTRICT, CASCADE, SET NULL, SET DEFAULT
      LOldOnDelete := LQuery.Fields.FieldByName('on_delete').AsString.ToUpper;
      LNewOnDelete := Context.SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnDeleteAction).ToUpper;
      if not SameText(LOldOnDelete, LNewOnDelete) then
        Exit(True);

      Exit(False); // FK exists and is not modified
    end;
    LQuery.Next;
  end;

  // FK not found - shouldn't happen if Check_ForeignKeyExists was called first
  Result := False;
end;

end.
