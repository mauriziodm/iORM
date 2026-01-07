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
    procedure DropAllIndexes;
    procedure RenameAllTablesToOld; // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
  protected
    // Tables
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
    // Fields
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    // Field change detection methods
    function GetInvalidTypeConversions: string; override;
    // Indexes
    procedure DropIndexes; override;
    procedure DropTableIndexes(const ATable: IioDBBuilderSchemaTable); override;
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
  iORM.DB.QueryEngine

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
  Script.Body.Add(SqlGenerator.BuildBeginAlterTableSql(ATable));
  Script.Body.IncIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildCreateFieldsSql(ATable, Script.Body.CurrentIndentation));

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(ATable);

  Script.Body.DecIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildEndAlterTableSql(ATable));
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

procedure TioDBBuilderStrategySqLite.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  Script.Body.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  Script.Body.IncIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildCreateFieldsSql(ATable, Script.Body.CurrentIndentation), False);

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(ATable);

  Script.Body.DecIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
end;

procedure TioDBBuilderStrategySqLite.DropAllIndexes;
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

  // For SQLite, if DB needs to be modified, rename affected tables with "_old" suffix
  if Schema.Status = stUpdate then
    RenameAllTablesToOld;
end;

procedure TioDBBuilderStrategySqLite.DropIndexes;
begin
  inherited;

  DropAllIndexes;
end;

procedure TioDBBuilderStrategySqLite.DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LQuery: IioQuery;
begin
  // Carlo Marona (2025-10-16): ref to https://stackoverflow.com/questions/13426006/how-do-i-get-a-list-of-indexed-columns-for-a-given-table
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildListTableIndexesSql(ATable), True);

  while not LQuery.Eof do
  begin
    Script.Body.Add(Format('DROP INDEX %s;', [LQuery.Fields.FieldByName('name').AsString]));
    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildFieldExistsSql(ATable, AField), True);

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
  Result := False;
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildFieldModifiedSql(ATable, nil), True);

  while not LQuery.Eof do
  begin
    LOldFieldName := LQuery.Fields.FieldByName('name').AsString;
    LNewFieldName := AField.FieldName;

    // Find the field
    if SameText(LOldFieldName, LNewFieldName) then
    begin
      LOldFieldType := LQuery.Fields.FieldByName('type').AsString;
      LOldFieldNotNull := (LQuery.Fields.FieldByName('notnull').AsInteger <> 0);
      LNewFieldType := SqlGenerator.TranslateFieldType(AField, True);

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
  LIndexName: string;
begin
  Result := False;
  LIndexName := SqlGenerator.BuildIndexNameSql(ATable, AIndex);

  // PRAGMA index_list returns all indexes for a table
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildListTableIndexesSql(ATable), True);

  while not LQuery.Eof do
  begin
    if SameText(LQuery.Fields.FieldByName('name').AsString, LIndexName) then
      Exit(True);

    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
  LQueryInfo: IioQuery;
  LIndexName: string;
  LOldUnique: Boolean;
  LOldFieldList: string;
  LNewFieldList: string;
begin
  Result := False;
  LIndexName := SqlGenerator.BuildIndexNameSql(ATable, AIndex);

  // First, get index info from index_list to check uniqueness
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildListTableIndexesSql(ATable), True);

  while not LQuery.Eof do
  begin
    if SameText(LQuery.Fields.FieldByName('name').AsString, LIndexName) then
    begin
      // Check uniqueness (unique field in PRAGMA index_list)
      LOldUnique := LQuery.Fields.FieldByName('unique').AsInteger <> 0;
      if LOldUnique <> AIndex.Unique then
      begin
        AIndex.AddChange(icUnique);
        Result := True;
      end;

      // Now get the field list using PRAGMA index_info
      LQueryInfo := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildIndexModifiedSql(ATable, AIndex), True);
      LOldFieldList := '';

      while not LQueryInfo.Eof do
      begin
        if not LOldFieldList.IsEmpty then
          LOldFieldList := LOldFieldList + ',';
        LOldFieldList := LOldFieldList + LQueryInfo.Fields.FieldByName('name').AsString.ToUpper;
        LQueryInfo.Next;
      end;

      // Compare field lists (case-insensitive)
      LNewFieldList := AIndex.CommaSepFieldList.ToUpper.Replace(' ', '');
      LOldFieldList := LOldFieldList.Replace(' ', '');
      if not SameText(LOldFieldList, LNewFieldList) then
      begin
        AIndex.AddChange(icFields);
        Result := True;
      end;

      // Note: SQLite doesn't store index orientation (ASC/DESC) in a queryable way
      // for all indexes. The ordering is stored in the index definition itself.
      // We skip orientation check for SQLite.

      Exit;
    end;
    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  // PRAGMA foreign_key_list returns: id, seq, table, from, to, on_update, on_delete, match
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildForeignKeyExistsSql(ATable, AForeignKey), True);

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

  // PRAGMA foreign_key_list returns: id, seq, table, from, to, on_update, on_delete, match
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildForeignKeyModifiedSql(ATable, AForeignKey), True);

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
      LNewOnUpdate := SqlGenerator.TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction).ToUpper;
      if not SameText(LOldOnUpdate, LNewOnUpdate) then
        Exit(True);

      // Check ON DELETE action
      // Note: PRAGMA foreign_key_list returns actions as: NO ACTION, RESTRICT, CASCADE, SET NULL, SET DEFAULT
      LOldOnDelete := LQuery.Fields.FieldByName('on_delete').AsString.ToUpper;
      LNewOnDelete := SqlGenerator.TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction).ToUpper;
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
    CreateOrAlterTables;

    if Schema.IndexesEnabled then
      CreateIndexes;

    if Schema.Status = tioDBBuilderStatus.stUpdate then
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
