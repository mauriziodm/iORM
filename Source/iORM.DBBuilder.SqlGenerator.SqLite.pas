unit iORM.DBBuilder.SqlGenerator.SqLite;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces;

const
  INVALID_FIELDTYPE_CONVERSIONS = '[text->integer]' + '[text->real]' + '[text->numeric]' + '[text->blob]' + '[real->integer]' +
    '[real->blob]' + '[numeric->integer]' + '[numeric->blob]' + '[blob->real]' + '[blob->numeric]' + '[blob->integer]' + '[blob->text]';
  MSG_METHOD_NOT_IMPLEMENTED = 'Method not implemented by this class.';

type

  TioDBBuilderSqlGenSQLite = class(TioDBBuilderSqlGenBase)
  private
    function TranslateFieldType(const AField: IioDBBuilderSchemaField): String;
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
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
    procedure CreateField(const AField: IioDBBuilderSchemaField);
    procedure CreateClassInfoField;
    procedure AddField(const AField: IioDBBuilderSchemaField); // Not implented
    procedure AlterField(const AField: IioDBBuilderSchemaField); // Not implented
    // PrimaryKey & other indexes
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
//    function AddIndex(const AContext: IioContext; const AIndexName, ACommaSepFieldList: String;
//      const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String;
    // Foreign keys
    procedure AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
    // Sequences
    procedure AddSequence(const ATable: IioDBBuilderSchemaTable);

  end;

implementation

uses
  System.SysUtils, iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, iORM.Exceptions, System.StrUtils, iORM.CommonTypes;

{ TioDBBuilderSqlGenSQLite }

procedure TioDBBuilderSqlGenSQLite.CreateClassInfoField;
begin
  ScriptAdd(Format('"%s" TEXT NULL', [IO_CLASSFROMFIELD_FIELDNAME]));
end;

procedure TioDBBuilderSqlGenSQLite.CreateDatabase;
begin
  OpenQuery('SELECT 1=1');
end;

procedure TioDBBuilderSqlGenSQLite.CreateField(const AField: IioDBBuilderSchemaField);
begin
  ScriptAdd(InternalCreateField(AField));
end;

procedure TioDBBuilderSqlGenSQLite.EndAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  DecIndentationLevel;
  ScriptAdd(');');
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
      Result := (not SameText(LOldFieldType, LNewFieldType));
      CheckTypeAffinity(LOldFieldType, LNewFieldType, LNewFieldName, ATable.TableName, INVALID_FIELDTYPE_CONVERSIONS);
      // Verify if NotNull is changed
      Result := Result or (LOldFieldNotNull <> AField.NotNull);
      CheckIfNullBecomesNotNull(LOldFieldNotNull, AField, ATable);
      // Exit
      Exit(True);
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
    Exit(Format('"%s" INTEGER PRIMARY KEY NOT NULL', [AField.FieldName]));
  // ...then continue
  LNotNull := IfThen(AField.NotNull, 'NOT NULL', 'NULL');
  Result := Format('"%s" %s %s', [AField.FieldName, TranslateFieldType(AField), LNotNull]).Trim;
end;

function TioDBBuilderSqlGenSQLite.TranslateFieldType(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.GetProperty.GetMetadata_FieldType of
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
      Result := AField.GetProperty.GetMetadata_CustomFieldType;
  else
    raise EioException.Create(ClassName, 'SchemaFieldToDBFieldType', 'Wrong Metadata_FieldType');
  end;
end;

function TioDBBuilderSqlGenSQLite.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('SELECT count(*) FROM sqlite_master WHERE type=''table'' AND name=''%s''', [ATable.TableName]));
  Result := LQuery.Fields[0].AsInteger > 0;
end;

procedure TioDBBuilderSqlGenSQLite.AddField(const AField: IioDBBuilderSchemaField);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AddField', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AddForeignKey', MSG_METHOD_NOT_IMPLEMENTED);
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

procedure TioDBBuilderSqlGenSQLite.AlterField(const AField: IioDBBuilderSchemaField);
begin
  // Nothing to do
  raise EioException.Create(ClassName, 'AlterField', MSG_METHOD_NOT_IMPLEMENTED);
end;

procedure TioDBBuilderSqlGenSQLite.BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('DROP TABLE IF EXISTS _%s_old;', [ATable.TableName]));
  ScriptAdd(Format('ALTER TABLE %s RENAME TO _%s_old;', [ATable.TableName, ATable.TableName]));
  ScriptAdd(Format('CREATE TABLE %s (', [ATable.TableName]));
  IncIndentationLevel;
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

end.
