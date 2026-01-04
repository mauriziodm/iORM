unit iORM.DBBuilder.Strategy.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base

  ;


type
  TioDBBuilderStrategySqLite = class(TioDBBuilderStrategyBase)
  private
    procedure CopyDataFromOldToNewTables(const AScript: IioDBBuilderSqlScript);
    procedure CopyDataFromOldToNewTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
    procedure DropAllIndexes(const AScript: IioDBBuilderSqlScript);
    procedure RenameAllTablesToOld(const AScript: IioDBBuilderSqlScript); // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
  protected
    // Database
    procedure CreateDatabase; override;
    function DatabaseExists: Boolean; override;
    // Tables
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    // Fields
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    // Field change detection methods
    function GetInvalidTypeConversions: string; override;
    // Indexes
    procedure DropIndexes(const AScript: IioDBBuilderSqlScript); override;
    procedure DropTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;

    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); override;
  public

  end;


implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.DB.Interfaces,
  iORM.DB.ConnectionContainer,
  iORM.DBBuilder.QueryEngine

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

procedure TioDBBuilderStrategySqLite.AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  AScript.Body.Add(SqlGenerator.BuildBeginAlterTableSql(ATable));
  AScript.Body.IncIndentationLevel;
  AScript.Body.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.Body.CurrentIndentation));

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(AScript, ATable);

  AScript.Body.DecIndentationLevel;
  AScript.Body.Add(SqlGenerator.BuildEndAlterTableSql(ATable));
end;

procedure TioDBBuilderStrategySqLite.CopyDataFromOldToNewTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: string;
begin
  AScript.Body.AddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.Name]));
  // Insert into
  AScript.Body.Add(Format('INSERT INTO %s (', [ATable.Name]));
  AScript.Body.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    AScript.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  AScript.Body.DecIndentationLevel;

  // Select from
  AScript.Body.Add(') SELECT');
  AScript.Body.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    AScript.Body.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  AScript.Body.DecIndentationLevel;

  AScript.Body.Add(Format('FROM %s', [Table2OldTableName(ATable)]));
  AScript.Body.Add(';');
  AScript.Body.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.CopyDataFromOldToNewTables(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.Body.AddTitle('Copying data from "_old" tables.');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    CopyDataFromOldToNewTable(AScript, LTable);
  end;
end;

procedure TioDBBuilderStrategySqLite.CreateDatabase;
begin
  TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, 'SELECT 1=1');
end;

procedure TioDBBuilderStrategySqLite.CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  AScript.Body.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  AScript.Body.IncIndentationLevel;
  AScript.Body.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.Body.CurrentIndentation), False);

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(AScript, ATable);

  AScript.Body.DecIndentationLevel;
  AScript.Body.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
end;

function TioDBBuilderStrategySqLite.DatabaseExists: Boolean;
begin
  Result := FileExists(TioConnectionManager.GetDatabaseFileName(ConnectionDefName));
end;

procedure TioDBBuilderStrategySqLite.DropAllIndexes(const AScript: IioDBBuilderSqlScript);
var
  LQuery: IioQuery;
begin
  // Drop all indexes part
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildListAllIndexesSql);

  while not LQuery.Eof do
  begin
    AScript.Body.Add(Format('DROP INDEX %s;', [LQuery.Fields[0].AsString]));
    LQuery.Next;
  end;

  // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
  if Schema.Status = stUpdate then
    RenameAllTablesToOld(AScript);
end;

procedure TioDBBuilderStrategySqLite.DropIndexes(const AScript: IioDBBuilderSqlScript);
begin
  inherited;

  DropAllIndexes(AScript);
end;

procedure TioDBBuilderStrategySqLite.DropTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LQuery: IioQuery;
begin
  // Carlo Marona (2025-10-16): ref to https://stackoverflow.com/questions/13426006/how-do-i-get-a-list-of-indexed-columns-for-a-given-table
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildListTableIndexesSql(ATable));

  while not LQuery.Eof do
  begin
    AScript.Body.Add(Format('DROP INDEX %s;', [LQuery.Fields.FieldByName('name').AsString]));
    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildFieldExistsSql(ATable, AField));

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
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildFieldModifiedSql(ATable, nil));

  while not LQuery.Eof do
  begin
    LOldFieldName := LQuery.Fields.FieldByName('name').AsString;
    LNewFieldName := AField.FieldName;

    // Find the field
    if SameText(LOldFieldName, LNewFieldName) then
    begin
      LOldFieldType := LQuery.Fields.FieldByName('type').AsString;
      LOldFieldNotNull := (LQuery.Fields.FieldByName('notnull').AsInteger <> 0);
      LNewFieldType := SqlGenerator.TranslateFieldType(AField);

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

procedure TioDBBuilderStrategySqLite.GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean);
begin
  AScript.Body.AddEmpty;
  AScript.Body.AddComment('Before we start...');
  AScript.Body.Add('PRAGMA defer_foreign_keys=off;');

  if Create then
  begin
    CreateTables(AScript);

    if Schema.IndexesEnabled then
      CreateIndexes(AScript);
  end
  else
  begin
    DropIndexes(AScript);
    CreateOrAlterTables(AScript);

    if Schema.IndexesEnabled then
      CreateIndexes(AScript);

    if Schema.Status = tioDBBuilderStatus.stUpdate then
      CopyDataFromOldToNewTables(AScript);
  end;

  AScript.Body.AddEmpty;
  AScript.Body.AddComment('At the end...');
  AScript.Body.Add('PRAGMA defer_foreign_keys=on;');
  AScript.Body.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.RenameAllTablesToOld(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.Body.AddTitle('Renaming table names to "_old"');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    AScript.Body.AddComment(Format('Renaming from "%s" to "%s"', [LTable.Name, Table2OldTableName(LTable)]));
    AScript.Body.Add(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(LTable)]));
    AScript.Body.Add(Format('ALTER TABLE %s RENAME TO %s;', [LTable.Name, Table2OldTableName(LTable)]));
    AScript.Body.AddEmpty;
  end;
end;

function TioDBBuilderStrategySqLite.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.Name.ToLower]);
end;

end.
