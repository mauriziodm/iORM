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

    procedure GenerateDatabaseObjects(const Create: boolean); override;
  public

  end;


implementation

uses
  System.SysUtils,
  System.StrUtils,

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
  LQuery: IioQuery;
begin
  // Drop all indexes part
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildListAllIndexesSql, True);

  while not LQuery.Eof do
  begin
    Script.Body.Add(Format('DROP INDEX %s;', [LQuery.Fields[0].AsString]));
    LQuery.Next;
  end;

  // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
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

procedure TioDBBuilderStrategySqLite.GenerateDatabaseObjects(const Create: boolean);
begin
  Script.Body.AddEmpty;
  Script.Body.AddComment('Before we start...');
  Script.Body.Add('PRAGMA defer_foreign_keys=off;');

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
  Script.Body.AddComment('At the end...');
  Script.Body.Add('PRAGMA defer_foreign_keys=on;');
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
