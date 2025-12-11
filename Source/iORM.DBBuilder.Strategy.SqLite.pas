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
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;

    procedure CreateDatabase; override;

    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); override;

    function DatabaseExists: Boolean; override;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function IndexExists(const AIndexName: string): boolean; override;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; override;

    function IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField;
      const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
      const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean; virtual;

    procedure WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField;
      const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string); virtual;
    procedure WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
      const ATable: IioDBBuilderSchemaTable); virtual;
    procedure WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
      const ATable: IioDBBuilderSchemaTable); virtual;

    procedure DropIndexes(const AScript: IioDBBuilderSqlScript); override;
    procedure DropTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
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

procedure TioDBBuilderStrategySqLite.AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  AScript.Schema.Add(SqlGenerator.BuildBeginAlterTableSql(ATable));
  AScript.Schema.IncIndentationLevel;
  AScript.Schema.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.Schema.CurrentIndentation));

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(AScript, ATable);

  AScript.Schema.DecIndentationLevel;
  AScript.Schema.Add(SqlGenerator.BuildEndAlterTableSql(ATable));
end;

procedure TioDBBuilderStrategySqLite.CopyDataFromOldToNewTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: string;
begin
  AScript.Schema.AddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.Name]));
  // Insert into
  AScript.Schema.Add(Format('INSERT INTO %s (', [ATable.Name]));
  AScript.Schema.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    AScript.Schema.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  AScript.Schema.DecIndentationLevel;

  // Select from
  AScript.Schema.Add(') SELECT');
  AScript.Schema.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    AScript.Schema.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  AScript.Schema.DecIndentationLevel;

  AScript.Schema.Add(Format('FROM %s', [Table2OldTableName(ATable)]));
  AScript.Schema.Add(';');
  AScript.Schema.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.CopyDataFromOldToNewTables(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.Schema.AddTitle('Copying data from "_old" tables.');

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
  AScript.Schema.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  AScript.Schema.IncIndentationLevel;
  AScript.Schema.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.Schema.CurrentIndentation), False);

  if Schema.ForeignKeysEnabled then
    CreateTableForeignKeys(AScript, ATable);

  AScript.Schema.DecIndentationLevel;
  AScript.Schema.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
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
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, 'SELECT * FROM sqlite_master WHERE type = ''index''');

  while not LQuery.Eof do
  begin
    AScript.Schema.Add(Format('DROP INDEX %s;', [LQuery.Fields.FieldByName('name').AsString]));
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
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, Format('PRAGMA index_list(''%s''', [ATable.Name]));

  while not LQuery.Eof do
  begin
    AScript.Schema.Add(Format('DROP INDEX %s;', [LQuery.Fields.FieldByName('name').AsString]));
    LQuery.Next;
  end;
end;

function TioDBBuilderStrategySqLite.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, Format('pragma table_info(''%s'')', [ATable.Name]));

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
  AScript.Schema.AddEmpty;
  AScript.Schema.AddComment('Before we start...');
  AScript.Schema.Add('PRAGMA defer_foreign_keys=off;');

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

  AScript.Schema.AddEmpty;
  AScript.Schema.AddComment('At the end...');
  AScript.Schema.Add('PRAGMA defer_foreign_keys=on;');
  AScript.Schema.AddEmpty;
end;

function TioDBBuilderStrategySqLite.IndexExists(const AIndexName: string): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildIndexExistsSql(AIndexName));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategySqLite.IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
  const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean;
begin
  Result := AOldFieldNotNull <> ANewFieldNotNull;

  if Result then
  begin
    AField.AddAltered(alFieldNotNull);
    if AIsPermitted then
      WarningNullBecomesNotNull(AOldFieldNotNull, AField, ATable)
    else
      WarningNotNullCannotBeChanged(AOldFieldNotNull, AField, ATable);
  end;
end;

function TioDBBuilderStrategySqLite.IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField;
  const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := not SameText(AOldFieldType, ANewFieldType);
  if Result then
  begin
    AField.AddAltered(alFieldType);
    WarningTypeAffinity(AOldFieldType, ANewFieldType, AField, ATable, INVALID_FIELDTYPE_CONVERSIONS);
  end;
end;

procedure TioDBBuilderStrategySqLite.RenameAllTablesToOld(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.Schema.AddTitle('Renaming table names to "_old"');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stUpdate then
      Continue;

    AScript.Schema.AddComment(Format('Renaming from "%s" to "%s"', [LTable.Name, Table2OldTableName(LTable)]));
    AScript.Schema.Add(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(LTable)]));
    AScript.Schema.Add(Format('ALTER TABLE %s RENAME TO %s;', [LTable.Name, Table2OldTableName(LTable)]));
    AScript.Schema.AddEmpty;
  end;
end;

function TioDBBuilderStrategySqLite.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.Name.ToLower]);
end;

function TioDBBuilderStrategySqLite.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildTableExistsSql(ATable.Name));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

procedure TioDBBuilderStrategySqLite.WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull <> AOldFieldNotNull then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The not null setting cannot be changed automatically',
      [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategySqLite.WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull and (not AOldFieldNotNull) and (not AField.FieldDefaultExists) then
    Schema.Warnings.Add
      (Format('Table ''%s'' field ''%s'' --> The not null setting is changed from false to true and a default value has not been specified',
      [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategySqLite.WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable;
  const AInvalidTypeConversions: string);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);

  if ContainsText(AInvalidTypeConversions, LRequiredConversion) then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''', [ATable.Name, AField.FieldName,
      AOldFieldType, ANewFieldType]));
end;

end.
