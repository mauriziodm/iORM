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
    procedure CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField): String;
  public
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
    procedure CreateClassInfoField(ACommaBefore: Char);
    procedure AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char); // Not implented
    procedure AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char); // Not implented
    // PrimaryKey & other indexes
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable); // Not implented
    procedure AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
    procedure DropAllIndex;
    // Foreign keys
    procedure AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
    procedure DropAllForeignKeys; // Not implented
    // Sequences
    procedure AddSequence(const ATable: IioDBBuilderSchemaTable); // Not implented
  end;

implementation

uses
  System.SysUtils, iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, iORM.Exceptions, System.StrUtils, iORM.CommonTypes,
  System.Classes, iORM.SqlTranslator;

{ TioDBBuilderSqlGenSQLite }

procedure TioDBBuilderSqlGenSQLite.CreateClassInfoField(ACommaBefore: Char);
begin
  ScriptAdd(Format('%s%s TEXT NULL', [ACommaBefore, IO_CLASSFROMFIELD_FIELDNAME]));
end;

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
  CopyDataFromOldToNewTable(ATable);
end;

procedure TioDBBuilderSqlGenSQLite.EndCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  DecIndentationLevel;
  ScriptAdd(');');
end;

function TioDBBuilderSqlGenSQLite.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): Boolean;
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

function TioDBBuilderSqlGenSQLite.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): Boolean;
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
      Result := Result or IsFieldNotNullChanged(LOldFieldNotNull, AField.NotNull, AField, ATable, True);

      // Exit
      Exit;
    end;
    LQuery.Next;
  end;
end;

function TioDBBuilderSqlGenSQLite.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LNotNull: string;
begin
  // If primary key...
  if AField.PrimaryKey then
    Exit(Format('"%s" INTEGER PRIMARY KEY NOT NULL', [AField.FieldName])); // Add AUTOINCREMENT keyword???
  // ...then continue
  LNotNull := IfThen(AField.NotNull, 'NOT NULL', 'NULL');
  Result := Format('"%s" %s %s', [AField.FieldName, TranslateFieldType(AField), LNotNull]).Trim;
end;

procedure TioDBBuilderSqlGenSQLite.CopyDataFromOldToNewTable(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: Char;
begin
  // Insert into
  ScriptAdd(Format('INSERT INTO %s (', [ATable.TableName]));
  IncIndentationLevel;
  LComma := ' ';
  for LField in ATable.FieldList.Values do
  begin
    ScriptAdd(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ',';
  end;
  if ATable.IsClassFromField then
    ScriptAdd(Format('%s%s', [LComma, IO_CLASSFROMFIELD_FIELDNAME]));
  // Select from
  ScriptAdd(') SELECT');
  IncIndentationLevel;
  LComma := ' ';
  for LField in ATable.FieldList.Values do
  begin
    ScriptAdd(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ',';
  end;
  if ATable.IsClassFromField then
    ScriptAdd(Format('%s%s', [LComma, IO_CLASSFROMFIELD_FIELDNAME]));
  DecIndentationLevel;
  ScriptAdd(Format('FROM %s (', [Table2OldTableName(ATable)]));
  DecIndentationLevel;
  ScriptAdd(';');
end;

function TioDBBuilderSqlGenSQLite.TranslateFieldType(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.GetContextProperty.GetMetadata_FieldType of
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
      Result := AField.GetContextProperty.GetMetadata_CustomFieldType;
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

function TioDBBuilderSqlGenSQLite.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old0', [ATable.TableName.ToLower]);
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
  IncIndentationLevel;
  ScriptAdd(Format('FOREIGN KEY ("%s")', [AForeignKey.DependentFieldName]));
  ScriptAdd(Format('REFERENCES  "%s" ("%s")', [AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]));
  if AForeignKey.OnUpdateAction > fkUnspecified then
    ScriptAdd(Format('ON UPDATE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction)]));
  if AForeignKey.OnDeleteAction > fkUnspecified then
    ScriptAdd(Format('ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]));
  ScriptAdd('DEFERRABLE INITIALLY DEFERRED');
  DecIndentationLevel;
  DecIndentationLevel;
end;

procedure TioDBBuilderSqlGenSQLite.AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AddPrimaryKey', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.AddSequence(const ATable: IioDBBuilderSchemaTable);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AddSequence', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AlterField', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(ATable)]));
  ScriptAdd(Format('ALTER TABLE %s RENAME TO %s;', [ATable.TableName, Table2OldTableName(ATable)]));
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
  // Nothing to do
  raise EioException.Create(ClassName, 'DropAllForeignKeys', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.DropAllIndex;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery('SELECT * FROM sqlite_master WHERE type = ''index''');
  while not LQuery.Eof do
  begin
    ScriptAdd(Format('DROP INDEX %s;', [LQuery.Fields.FieldByName('name').AsString]));
    LQuery.Next;
  end;
end;

end.
