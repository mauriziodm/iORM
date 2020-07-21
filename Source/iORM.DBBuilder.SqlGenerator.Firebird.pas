unit iORM.DBBuilder.SqlGenerator.Firebird;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces, iORM.Attributes;

const
  INVALID_FIELDTYPE_CONVERSIONS = '[timestamp->decimal]' + '[timestamp->numeric]' + '[timestamp->integer]' + '[date->decimal]' +
    '[date->numeric]' + '[date->integer]' + '[time->numeric]' + '[time->decimal]' + '[time->integer]' + '[varchar->decimal]' +
    '[varchar->integer]' + '[varchar->date]' + '[varchar->time]' + '[varchar->datetime]' + '[char->decimal]' + '[char->integer]' +
    '[char->date]' + '[char->time]' + '[char->datetime]';

type

  TioDBBuilderSqlGenFirebird = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGenerator)
  private
    function TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
    function TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
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
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable); // Not implented
    procedure AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
    procedure DropAllIndex;
    // Foreign keys
    procedure AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK); // Not implented
    procedure DropAllForeignKeys; // Not implented
    // Sequences
    procedure AddSequence(const ATable: IioDBBuilderSchemaTable); // Not implented
  end;

implementation

uses
  iORM.Context.Properties.Interfaces, iORM.Exceptions, System.SysUtils, iORM.DB.Factory, iORM.DB.Interfaces, System.StrUtils;

{ TioDBBuilderSqlGenFirebird }

procedure TioDBBuilderSqlGenFirebird.AddField(const AField: IioDBBuilderSchemaField);
begin

end;

procedure TioDBBuilderSqlGenFirebird.AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
begin

end;

procedure TioDBBuilderSqlGenFirebird.AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
begin

end;

procedure TioDBBuilderSqlGenFirebird.AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
begin

end;

procedure TioDBBuilderSqlGenFirebird.AddSequence(const ATable: IioDBBuilderSchemaTable);
begin

end;

procedure TioDBBuilderSqlGenFirebird.AlterField(const AField: IioDBBuilderSchemaField);
begin

end;

procedure TioDBBuilderSqlGenFirebird.BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('ALTER TABLE %s (', [ATable.TableName]));
  IncIndentationLevel;
end;

procedure TioDBBuilderSqlGenFirebird.BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('CREATE TABLE %s (', [ATable.TableName]));
  IncIndentationLevel;
end;

procedure TioDBBuilderSqlGenFirebird.CreateClassInfoField;
begin

end;

procedure TioDBBuilderSqlGenFirebird.CreateDatabase;
begin
  // N.B. Sfrutta un parametro di Firedac per autocreare il db se non esiste
  TioDbFactory.ConnectionManager.GetConnectionDefByName(FSchema.ConnectionDefName).Params.Values['CreateDatabase'] :=
    BoolToStr(True, True);
  // N.B. Apriamo una connessione solo per fargli creare il db.
  TioDbFactory.Connection(FSchema.ConnectionDefName);
  // N.B. Rimuoviamo il parametro di Firedac per autocreare il db se non esiste
  TioDbFactory.ConnectionManager.GetConnectionDefByName(FSchema.ConnectionDefName).Params.Values['CreateDatabase'] :=
    BoolToStr(False, True);
end;

procedure TioDBBuilderSqlGenFirebird.CreateField(const AField: IioDBBuilderSchemaField);
begin
  ScriptAdd(InternalCreateField(AField));
end;

function TioDBBuilderSqlGenFirebird.DatabaseExists: Boolean;
begin
  Result := FileExists(FSchema.DatabaseFileName);
end;

procedure TioDBBuilderSqlGenFirebird.DropAllForeignKeys;
begin

end;

procedure TioDBBuilderSqlGenFirebird.DropAllIndex;
begin

end;

procedure TioDBBuilderSqlGenFirebird.EndAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  DecIndentationLevel;
  ScriptAdd(';');
end;

procedure TioDBBuilderSqlGenFirebird.EndCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  DecIndentationLevel;
  ScriptAdd(');');
end;

function TioDBBuilderSqlGenFirebird.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('select rdb$field_name from rdb$relation_fields where rdb$relation_name=''%s'' and rdb$field_name=''%s''',
    [ATable.TableName, AField.FieldName]));
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderSqlGenFirebird.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField)
  : Boolean;
var
  LQuery: IioQuery;
  LTableName: string;
  LFieldName: string;
  LNewFieldType: string;
  LNewFieldSubType: string;
  LNewFieldLength: Smallint;
  LNewFieldPrecision: Smallint;
  LNewFieldDecimals: Smallint;
  LOldFieldName: string;
  LOldFieldType: string;
  LOldFieldSubType: string;
  LOldFieldLength: Smallint;
  LOldFieldPrecision: Smallint;
  LOldFieldDecimals: Smallint;
  LOldFieldNotNull: Boolean;
  function IsDecimalOrNumeric: Boolean;
  begin
    Result := (LOldFieldType = 'INT64') and ((LOldFieldSubType = '1') or (LOldFieldSubType = '2'));
  end;

begin
  // Load some new field informations
  LTableName := ATable.TableName;
  LFieldName := AField.FieldName;
  LNewFieldType := TranslateFieldTypeForModified(AField);
  LNewFieldSubType := AField.GetContextProperty.GetMetadata_FieldSubType;
  LNewFieldLength := AField.GetContextProperty.GetMetadata_FieldLength;
  LNewFieldPrecision := AField.GetContextProperty.GetMetadata_FieldPrecision;
  LNewFieldDecimals := AField.GetContextProperty.GetMetadata_FieldScale;

  // Create and open the query for old field informations
  LQuery := NewQuery;
  LQuery.SQL.Add('SELECT r.RDB$FIELD_NAME AS field_name,');
  LQuery.SQL.Add('  r.RDB$DEFAULT_VALUE AS field_default_value,');
  LQuery.SQL.Add('  r.RDB$NULL_FLAG AS field_not_null,');
  LQuery.SQL.Add('  f.RDB$CHARACTER_LENGTH AS field_length,');
  LQuery.SQL.Add('  f.RDB$FIELD_PRECISION AS field_precision,');
  LQuery.SQL.Add('  f.RDB$FIELD_SCALE AS field_scale,');
  LQuery.SQL.Add('  CASE f.RDB$FIELD_TYPE ');
  LQuery.SQL.Add('    WHEN 261 THEN ''BLOB''');
  LQuery.SQL.Add('    WHEN 37 THEN ''VARCHAR''');
  LQuery.SQL.Add('    WHEN 14 THEN ''CHAR''');
  LQuery.SQL.Add('    WHEN 8 THEN ''INTEGER''');
  LQuery.SQL.Add('    WHEN 7 THEN ''SMALLINT''');
  LQuery.SQL.Add('    WHEN 16 THEN ''INT64'''); // --> DECIMAL field_subtype 2, NUMERIC field_subtype 1, BIGINT field_subtype 0
  LQuery.SQL.Add('    WHEN 27 THEN ''DOUBLE''');
  LQuery.SQL.Add('    WHEN 10 THEN ''FLOAT''');
  LQuery.SQL.Add('    WHEN 12 THEN ''DATE''');
  LQuery.SQL.Add('    WHEN 13 THEN ''TIME''');
  LQuery.SQL.Add('    WHEN 35 THEN ''TIMESTAMP''');
  LQuery.SQL.Add('    ELSE ''UNKNOWN''');
  LQuery.SQL.Add('  END AS field_type_name,');
  LQuery.SQL.Add('  f.RDB$FIELD_SUB_TYPE AS field_subtype');
  LQuery.SQL.Add('FROM RDB$RELATION_FIELDS r');
  LQuery.SQL.Add('LEFT JOIN RDB$FIELDS f ON r.RDB$FIELD_SOURCE = f.RDB$FIELD_NAME');
  LQuery.SQL.Add(Format('WHERE r.RDB$RELATION_NAME = %s', [LTableName]));
  LQuery.SQL.Add(Format('  AND r.RDB$FIELD_NAME = &s', [LFieldName]));
  LQuery.SQL.Add('ORDER BY r.RDB$FIELD_POSITION');
  LQuery.Open;

  // Field not found
  if LQuery.Eof then
    Exit(False);

  // Load some old field informations
  LOldFieldType := LQuery.Fields.FieldByName('field_type_name').AsString;
  LOldFieldSubType := LQuery.Fields.FieldByName('field_subtype').AsString;
  LOldFieldDecimals := Abs(LQuery.Fields.FieldByName('field_scale').AsInteger);
  LOldFieldNotNull := LQuery.Fields.FieldByName('field_not_null').AsInteger = 1;
  LOldFieldLength := LQuery.Fields.FieldByName('field_length').AsInteger;
  LOldFieldPrecision := LQuery.Fields.FieldByName('field_precision').AsInteger;

  // Verify if fieldType has been changed and check type affinity
  Result := (not SameText(LOldFieldType, LNewFieldType));
  WarningTypeAffinity(LOldFieldType, LNewFieldType, LFieldName, LTableName, INVALID_FIELDTYPE_CONVERSIONS);

  // Verify if FieldLength is changed
  if 'VARCHAR,CHAR'.Contains(LNewFieldType) or 'VARCHAR,CHAR'.Contains(LOldFieldType) then
  begin
    Result := Result or (LNewFieldLength <> LOldFieldLength);
    WarningNewValueLessThanTheOldOne('field length', LOldFieldLength, LNewFieldLength, LFieldName, LTableName);
  end;

  if IsDecimalOrNumeric then
  begin
    // Verify if something has been changed in FieldPrecision
    Result := Result or (LNewFieldPrecision <> LOldFieldPrecision);
    WarningNewValueLessThanTheOldOne('field precision', LOldFieldPrecision, LNewFieldPrecision, LFieldName, LTableName);

    // Verify if something has been changed in FieldDecimals (scale)
    Result := Result or (LNewFieldDecimals <> LOldFieldDecimals);
    WarningNewValueLessThanTheOldOne('field decimals', LOldFieldDecimals, LNewFieldDecimals, LFieldName, LTableName);
  end;

  // Verify if NotNull is changed
  Result := Result or (LOldFieldNotNull <> AField.NotNull);
  WarningNullBecomesNotNull(LOldFieldNotNull, AField, ATable);

  // Verify if blob subtype is changed
  if LNewFieldType = 'BLOB' then
  begin
    Result := Result or (LNewFieldSubType <> LOldFieldSubType);
    WarningValueChanged('blob subtype', LOldFieldSubType, LNewFieldSubType, LFieldName, LTableName);
  end;
end;

function TioDBBuilderSqlGenFirebird.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LNotNull: string;
begin
  // If primary key...
  if AField.PrimaryKey then
    Exit(Format('"%s" INTEGER NOT NULL', [AField.FieldName]));
  // ...then continue
  LNotNull := IfThen(AField.NotNull, 'NOT NULL', '');
  Result := Format('"%s" %s %s', [AField.FieldName, TranslateFieldTypeForCreate(AField), LNotNull]).Trim;
end;

function TioDBBuilderSqlGenFirebird.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery('select rdb$relation_name from rdb$relations where rdb$relation_name');
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.GetContextProperty.GetMetadata_FieldType of
    ioMdVarchar:
      Result := Format('VARCHAR(%d)', [AField.GetContextProperty.GetMetadata_FieldLength]);
    ioMdChar:
      Result := Format('CHAR(%d)', [AField.GetContextProperty.GetMetadata_FieldLength]);
    ioMdInteger:
      Result := 'INTEGER';
    ioMdFloat:
      Result := 'FLOAT';
    ioMdDate:
      Result := 'DATE';
    ioMdTime:
      Result := 'TIME';
    ioMdDateTime:
      Result := 'TIMESTAMP';
    ioMdDecimal:
      Result := Format('DECIMAL(%d,%d)', [AField.GetContextProperty.GetMetadata_FieldPrecision,
        AField.GetContextProperty.GetMetadata_FieldScale]);
    ioMdNumeric:
      Result := Format('NUMERIC(%d,%d)', [AField.GetContextProperty.GetMetadata_FieldPrecision,
        AField.GetContextProperty.GetMetadata_FieldScale]);
    ioMdBoolean:
      Result := 'INTEGER';
    ioMdBinary:
      Result := Format('BLOB SUB_TYPE %s', [ifthen(AField.GetContextProperty.GetMetadata_FieldSubType.IsEmpty, '0',
        AField.GetContextProperty.GetMetadata_FieldSubType)]);
    ioMdCustomFieldType:
      Result := AField.GetContextProperty.GetMetadata_CustomFieldType;
  end;
end;

function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.GetContextProperty.GetMetadata_FieldType of
    ioMdVarchar:
      Result := 'VARCHAR';
    ioMdChar:
      Result := 'CHAR';
    ioMdInteger:
      Result := 'INTEGER';
    ioMdFloat:
      Result := 'FLOAT';
    ioMdDate:
      Result := 'DATE';
    ioMdTime:
      Result := 'TIME';
    ioMdDateTime:
      Result := 'TIMESTAMP';
    ioMdDecimal:
      Result := 'INT64'; // Firebird use subtype for NUMERIC or DECIMALS
    ioMdNumeric:
      Result := 'INT64'; // Firebird use subtype NUMERIC or DECIMALS
    ioMdBoolean:
      Result := 'INTEGER';
    ioMdBinary:
      Result := 'BLOB';
    ioMdCustomFieldType:
      Result := AField.GetContextProperty.GetMetadata_CustomFieldType;
  else
    raise EioException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
  end;
end;

end.
