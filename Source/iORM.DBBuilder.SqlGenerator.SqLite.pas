unit iORM.DBBuilder.SqlGenerator.SqLite;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces, iORM.Attributes;

const
  INVALID_FIELDTYPE_CONVERSIONS = '[text->integer][text->real][text->numeric][text->blob][real->integer][real->blob]' +
    '[numeric->integer][numeric->blob][blob->real][blob->numeric][blob->integer][blob->text]';

type

  TioDBBuilderSqlGenSQLite = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGenerator)
  private
    procedure CopyDataFromOldToNewTables;
    procedure CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
    procedure RenameAllTablesToOld; // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField): String;
  public
    procedure ScriptBegin; override;
    procedure ScriptEnd; override;
    // Database related methods
    function DatabaseExists: Boolean;
    procedure CreateDatabase;
    // Tables related methods
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
    procedure BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndAlterTable(const ATable: IioDBBuilderSchemaTable);
    // Fields related methods
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): Boolean;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): Boolean;
    procedure CreateField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    procedure AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char); // Not implented
    procedure AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char); // Not implented
    // PrimaryKey & other indexes
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable); // Not implented
    procedure AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
    procedure DropAllIndexes;
    // Foreign keys
    procedure AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
    procedure DropAllForeignKeys;
    // Sequences
    procedure AddSequence(const ASequenceName: String; const ACreatingNewDatabase: Boolean); // Not implented
  end;

implementation

uses
  System.SysUtils, iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, iORM.Exceptions, System.StrUtils, iORM.CommonTypes,
  System.Classes, iORM.SqlTranslator;

{ TioDBBuilderSqlGenSQLite }

procedure TioDBBuilderSqlGenSQLite.CreateDatabase;
begin
  OpenQuery('SELECT 1=1');
end;

procedure TioDBBuilderSqlGenSQLite.CreateField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  ScriptAdd(Format('%s%s', [ACommaBefore, InternalCreateField(AField)]));
end;

procedure TioDBBuilderSqlGenSQLite.AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
var
  LQuery, LIndexName, LFieldList, LUnique: String;
begin
  LIndexName := BuildIndexName(ATable, AIndex);
  LUnique := BuildIndexUnique(AIndex);
  LFieldList := BuildIndexFieldList(ATable, AIndex, LIndexName, True);
  // Compose the create index query text
  LQuery := Format('CREATE %s INDEX IF NOT EXISTS %s ON %s (%s);', [LUnique, LIndexName, ATable.TableName, LFieldList]);
  LQuery := TioSqlTranslator.Translate(LQuery, ATable.GetContextTable.GetClassName, False);
  ScriptAdd(LQuery);
end;

procedure TioDBBuilderSqlGenSQLite.EndAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  EndCreateTable(ATable);
end;

procedure TioDBBuilderSqlGenSQLite.EndCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  DecIndentationLevel;
  ScriptAdd(');');
end;

function TioDBBuilderSqlGenSQLite.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField)
  : Boolean;
var
  LQuery: IioQuery;
begin
  Result := False;
  LQuery := OpenQuery(Format('pragma table_info(''%s'')', [ATable.TableName]));
  while not LQuery.Eof do
  begin
    if SameText(LQuery.Fields.FieldByName('name').AsString, AField.FieldName) then
      Exit(True);
    LQuery.Next;
  end;
end;

function TioDBBuilderSqlGenSQLite.FieldModified(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): Boolean;
var
  LQuery: IioQuery;
  LNewFieldName: string;
  LNewFieldType: string;
  LOldFieldName: string;
  LOldFieldType: string;
  LOldFieldNotNull: Boolean;
begin
  Result := False;
  LQuery := OpenQuery(Format('pragma table_info(''%s'')', [ATable.TableName]));
  while not LQuery.Eof do
  begin
    LOldFieldName := LQuery.Fields.FieldByName('name').AsString;
    LNewFieldName := AField.FieldName;
    // Find the field
    if SameText(LOldFieldName, LNewFieldName) then
    begin
      LOldFieldType := LQuery.Fields.FieldByName('type').AsString;
      LOldFieldNotNull := (LQuery.Fields.FieldByName('notnull').AsInteger <> 0);
      LNewFieldType := TranslateFieldType(AField);

      // Verify if fieldType has been changed and check type affinity
      Result := Result or IsFieldTypeChanged(LOldFieldType, LNewFieldType, AField, ATable, INVALID_FIELDTYPE_CONVERSIONS);

      // Verify if NotNull is changed
      Result := Result or IsFieldNotNullChanged(LOldFieldNotNull, AField.FieldNotNull, AField, ATable, True);

      // Exit
      Exit;
    end;
    LQuery.Next;
  end;
end;

function TioDBBuilderSqlGenSQLite.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // Extract the default value if extsts
  LDefault := ExtractFieldDefaultValue(AField);
  // If primary key...
  if AField.PrimaryKey then
    Exit(Format('"%s" INTEGER %s PRIMARY KEY NOT NULL', [AField.FieldName, LDefault])); // Add AUTOINCREMENT keyword???
  // ...then continue
  LNotNull := IfThen(AField.FieldNotNull, 'NOT NULL', 'NULL');
  Result := Format('"%s" %s %s %s', [AField.FieldName, TranslateFieldType(AField), LNotNull, LDefault]).Trim;
end;

procedure TioDBBuilderSqlGenSQLite.RenameAllTablesToOld;
var
  LTable: IioDBBuilderSchemaTable;
begin
  ScriptAddTitle('Renaming table names to "_old"');
  for LTable in FSchema.Tables.Values do
  begin
    if LTable.Status <> stAlter then
      Continue;
    ScriptAddComment(Format('Renaming from "%s" to "%s"', [LTable.TableName, Table2OldTableName(LTable)]));
    ScriptAdd(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(LTable)]));
    ScriptAdd(Format('ALTER TABLE %s RENAME TO %s;', [LTable.TableName, Table2OldTableName(LTable)]));
    ScriptAddEmpty;
  end;
end;

procedure TioDBBuilderSqlGenSQLite.ScriptBegin;
begin
  inherited;
  ScriptAddEmpty;
  ScriptAddComment('Before we start...');
  ScriptAdd('PRAGMA defer_foreign_keys=off;');
//  ScriptAdd('BEGIN TRANSACTION;');
end;

procedure TioDBBuilderSqlGenSQLite.ScriptEnd;
begin
  if FSchema.Status = tioDBBuilderStatus.stAlter then
    CopyDataFromOldToNewTables;
  ScriptAddEmpty;
  ScriptAddComment('At the end...');
//  ScriptAdd('COMMIT;');
  ScriptAdd('PRAGMA defer_foreign_keys=on;');
  ScriptAddEmpty;
  inherited;
end;

procedure TioDBBuilderSqlGenSQLite.CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: Char;
begin
  ScriptAddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.TableName]));
  // Insert into
  ScriptAdd(Format('INSERT INTO %s (', [ATable.TableName]));
  IncIndentationLevel;
  LComma := ' ';
  for LField in ATable.Fields.Values do
  begin
    if LField.Status = stCreate then
      Continue;
    ScriptAdd(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ',';
  end;
  // Select from
  ScriptAdd(') SELECT');
  IncIndentationLevel;
  LComma := ' ';
  for LField in ATable.Fields.Values do
  begin
    if LField.Status = stCreate then
      Continue;
    ScriptAdd(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ',';
  end;
  ScriptAdd(Format('FROM %s', [Table2OldTableName(ATable)]));
  DecIndentationLevel;
  DecIndentationLevel;
  ScriptAdd(';');
  ScriptAddEmpty;
end;

procedure TioDBBuilderSqlGenSQLite.CopyDataFromOldToNewTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  ScriptAddTitle('Copying data from "_old" tables.');
  for LTable in FSchema.Tables.Values do
  begin
    if LTable.Status <> stAlter then
      Continue;
    CopyDataFromOldToNewTable(LTable);
  end;
end;

function TioDBBuilderSqlGenSQLite.TranslateFieldType(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.FieldType of
    ioMdVarchar:
      Result := 'TEXT';
    ioMdChar:
      Result := 'TEXT';
    ioMdInteger:
      Result := 'INTEGER';
    ioMdFloat:
      Result := 'REAL';
    ioMdDate:
      Result := 'NUMERIC';
    ioMdTime:
      Result := 'NUMERIC';
    ioMdDateTime:
      Result := 'NUMERIC';
    ioMdDecimal:
      Result := 'NUMERIC';
    ioMdNumeric:
      Result := 'NUMERIC';
    ioMdBoolean:
      Result := 'NUMERIC';
    ioMdBinary:
      Result := 'BLOB';
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
  end;
end;

function TioDBBuilderSqlGenSQLite.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('SELECT count(*) FROM sqlite_master WHERE type=''table'' AND name=''%s''', [ATable.TableName]));
  Result := LQuery.Fields[0].AsInteger > 0;
end;

// For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
function TioDBBuilderSqlGenSQLite.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.TableName.ToLower]);
end;

procedure TioDBBuilderSqlGenSQLite.AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AddField', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
begin
  ScriptAdd(Format(',CONSTRAINT "%s"', [AForeignKey.Name]));
  IncIndentationLevel;
  ScriptAdd(Format('FOREIGN KEY ("%s")', [AForeignKey.DependentFieldName]));
  ScriptAdd(Format('REFERENCES  "%s" ("%s")', [AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]));
  if AForeignKey.OnUpdateAction > fkUnspecified then
    ScriptAdd(Format('ON UPDATE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction)]));
  if AForeignKey.OnDeleteAction > fkUnspecified then
    ScriptAdd(Format('ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]));
  ScriptAdd('DEFERRABLE INITIALLY DEFERRED');
  DecIndentationLevel;
end;

procedure TioDBBuilderSqlGenSQLite.AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AddPrimaryKey', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.AddSequence(const ASequenceName: String; const ACreatingNewDatabase: Boolean);
begin
  // Nothing to do
end;

procedure TioDBBuilderSqlGenSQLite.AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AlterField', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  BeginCreateTable(ATable);
end;

procedure TioDBBuilderSqlGenSQLite.BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('CREATE TABLE %s (', [ATable.TableName]));
  IncIndentationLevel;
end;

function TioDBBuilderSqlGenSQLite.DatabaseExists: Boolean;
begin
  Result := FileExists(FSchema.DatabaseFileName);
end;

procedure TioDBBuilderSqlGenSQLite.DropAllForeignKeys;
begin
  ScriptAddComment('Not implemented by this SqlGenerator');
end;

procedure TioDBBuilderSqlGenSQLite.DropAllIndexes;
var
  LQuery: IioQuery;
begin
  // Drop all indexes part
  LQuery := OpenQuery('SELECT * FROM sqlite_master WHERE type = ''index''');
  while not LQuery.Eof do
  begin
    ScriptAdd(Format('DROP INDEX %s;', [LQuery.Fields.FieldByName('name').AsString]));
    LQuery.Next;
  end;
  // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
  if FSchema.Status = stAlter then
    RenameAllTablesToOld;
end;

end.
