unit iORM.DBBuilder.Strategy.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base

  ;


type
  TioDBBuilderStrategySqLite = class(TioDBBuilderStrategyBase)
  private
    procedure CopyDataFromOldToNewTables;
    procedure CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
    procedure RenameAllTablesToOld; // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
  protected
    // Tables
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateOrAlterTables; override;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
    // Fields
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    // Field change detection methods
    function GetInvalidTypeConversions: string; override;
    // Indexes
    procedure DropIndexes; override;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    // ForeignKeys
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;

    procedure GenerateDatabaseObjects(const Create: boolean); override;
  public

  end;


implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.Attributes,
  iORM.DB.Interfaces,
  iORM.DB.ConnectionContainer,
  iORM.DB.QueryEngine, iORM.CommonTypes, iORM.Exceptions

  ;


const
  INVALID_FIELDTYPE_CONVERSIONS =
    '[text->integer][text->real][text->numeric][text->blob][real->integer][real->blob]' +
    '[numeric->integer][numeric->blob][blob->real][blob->numeric][blob->integer][blob->text]';



{ TioDBBuilderSqLite }

function TioDBBuilderStrategySqLite.GetInvalidTypeConversions: string;
begin
  Result := INVALID_FIELDTYPE_CONVERSIONS;
end;

procedure TioDBBuilderStrategySqLite.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  // Note: This method should NEVER be called for SQLite.
  // SQLite does not support ALTER TABLE in the traditional sense.
  // Instead, CreateOrAlterTables override always calls CreateTable for both stCreate and stUpdate.
  // This method exists only to satisfy the virtual method contract from the base class.
  // If this exception is raised, it indicates a logic error in the Strategy layer.
  raise EioDBBuilderException.Create(ClassName, 'AlterTable',
    'SQLite does not support ALTER TABLE. '#13#13 +
    'Table modifications require the rename-create-copy pattern, which is handled by CreateOrAlterTables override.');
end;

procedure TioDBBuilderStrategySqLite.CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: string;
begin
  Script.Body.AddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.Name]));
  // Insert into
  Script.Body.Add(Format('INSERT INTO %s (', [ATable.Name]));
  Script.Body.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Script.Body.DecIndentationLevel;

  // Select from
  Script.Body.Add(') SELECT');
  Script.Body.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    Script.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  Script.Body.DecIndentationLevel;

  Script.Body.Add(Format('FROM %s', [Table2OldTableName(ATable)]));
  Script.Body.Add(';');
  Script.Body.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.CopyDataFromOldToNewTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Copying data from "_old" tables.');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    CopyDataFromOldToNewTable(LTable);
  end;
end;

procedure TioDBBuilderStrategySqLite.CreateOrAlterTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // SQLite does not support ALTER TABLE like other databases.
  // Instead, it always recreates tables using the rename-create-copy pattern
  // (see GenerateDatabaseObjects method for the full workflow).
  // Therefore, both stCreate and stUpdate use CreateTable.
  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status in [stCreate, stUpdate] then
      CreateTable(LTable);
  end;
end;

procedure TioDBBuilderStrategySqLite.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  Script.Body.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  Script.Body.IncIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildSQL_CreateFields(ATable, Script.Body.CurrentIndentation), False);

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(ATable);

  Script.Body.DecIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
end;

procedure TioDBBuilderStrategySqLite.DropIndexes;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Drop only indexes of tables that need to be rebuilt (stUpdate)
  // Don't drop indexes of tables that remain unchanged (stClean) or are new (stCreate)
  Script.Body.AddTitle('Dropping indexes for tables to be rebuilt');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    DropTableIndexes(LTable);
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
      // OLD: LNewFieldType := SqlGenerator.Translate_SchemaField_To_FieldType(AField, True);  // True = exclude attributes (only base type)
      LNewFieldType := SqlGenerator.Translate_SchemaField_To_FieldType(AField, False);  // False = do NOT include attributes (only base type)

      // Verify if fieldType has been changed and check type affinity
      Result := Result or IsFieldTypeChanged(LOldFieldType, LNewFieldType, AField, ATable);

      // Verify if NotNull is changed
      Result := Result or IsFieldNotNullChanged(LOldFieldNotNull, AField.FieldNotNull, AField, ATable, True);

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

procedure TioDBBuilderStrategySqLite.GenerateDatabaseObjects(const Create: boolean);
begin
  Script.Body.AddEmpty;
  Script.Body.AddComment('Before we start: defer foreign key checks to avoid errors during table rebuild');
  Script.Body.Add('PRAGMA defer_foreign_keys=on;');

  if Create then
  begin
    CreateTables;

    if Schema.IndexesEnabled then
      CreateIndexes;
  end
  else
  begin
    DropIndexes;

    if Schema.Status = stUpdate then
      RenameAllTablesToOld;

    CreateOrAlterTables;

    if Schema.IndexesEnabled then
      CreateIndexes;

    if Schema.Status = stUpdate then
      CopyDataFromOldToNewTables;
  end;

  Script.Body.AddEmpty;
  Script.Body.AddComment('At the end: restore normal foreign key checks');
  Script.Body.Add('PRAGMA defer_foreign_keys=off;');
  Script.Body.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.RenameAllTablesToOld;
var
  LTable: IioDBBuilderSchemaTable;
begin
  Script.Body.AddTitle('Renaming table names to "_old"');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    Script.Body.AddComment(Format('Renaming from "%s" to "%s"', [LTable.Name, Table2OldTableName(LTable)]));
    Script.Body.Add(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(LTable)]));
    Script.Body.Add(Format('ALTER TABLE %s RENAME TO %s;', [LTable.Name, Table2OldTableName(LTable)]));
    Script.Body.AddEmpty;
  end;
end;

function TioDBBuilderStrategySqLite.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.Name.ToLower]);
end;

end.
