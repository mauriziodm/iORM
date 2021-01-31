unit iORM.DBBuilder.SqlGenerator.Firebird;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces, iORM.Attributes;

const
  INVALID_FIELDTYPE_CONVERSIONS = '[timestamp->decimal][timestamp->numeric][timestamp->integer][date->decimal][date - > numeric]' +
    '[date->integer][time->numeric][time->decimal][time->integer][varchar->decimal][varchar->integer][varchar->date][varchar->time]' +
    '[varchar->datetime][char->decimal][char->integer][char->date][char->time][char->datetime]';

type

  TioDBBuilderSqlGenFirebird = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGenerator)
  private
    function AdaptIndexOrFKName(const APrefix, AName: String): String;
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
    function SequenceExists(const ASequenceName: String): boolean;
    function TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
    function TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
  public
    // Database related methods
    function DatabaseExists: boolean;
    procedure CreateDatabase;
    // Tables related methods
    function TableExists(const ATable: IioDBBuilderSchemaTable): boolean;
    procedure BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndAlterTable(const ATable: IioDBBuilderSchemaTable);
    // Fields related methods
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    procedure CreateField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    procedure AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    procedure AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    // PrimaryKey & other indexes
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
    procedure AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
    procedure DropAllIndexes;
    // Foreign keys
    procedure AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
    procedure DropAllForeignKeys;
    // Sequences
    procedure AddSequence(const ASequenceName: String; const ACreatingNewDatabase: boolean);
  end;

implementation

uses
  iORM.Context.Properties.Interfaces, iORM.Exceptions, System.SysUtils, iORM.DB.Factory, iORM.DB.Interfaces, System.StrUtils,
  iORM.CommonTypes, iORM.SqlTranslator;

{ TioDBBuilderSqlGenFirebird }

procedure TioDBBuilderSqlGenFirebird.AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  ScriptAdd(Format('%sADD %s', [ACommaBefore, InternalCreateField(AField)]));
end;

procedure TioDBBuilderSqlGenFirebird.AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
var
  LFKName: string;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
  LFKName := AdaptIndexOrFKName('FK_', AForeignKey.Name);
  ScriptAdd(Format('ALTER TABLE %s', [AForeignKey.DependentTableName]));
  IncIndentationLevel;
  ScriptAdd(Format(' ADD CONSTRAINT %s', [LFKName]));
  IncIndentationLevel;
  ScriptAdd(Format('FOREIGN KEY (%s)', [AForeignKey.DependentFieldName]));
  ScriptAdd(Format('REFERENCES  %s (%s)', [AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]));
  if AForeignKey.OnUpdateAction > fkUnspecified then
    ScriptAdd(Format('ON UPDATE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction)]));
  if AForeignKey.OnDeleteAction > fkUnspecified then
    ScriptAdd(Format('ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]));
  DecIndentationLevel;
  DecIndentationLevel;
  ScriptAdd(';');
end;

procedure TioDBBuilderSqlGenFirebird.AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
var
  LQuery, LIndexName, LFieldList, LUnique, LIndexOrientation: String;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
  LIndexName := AdaptIndexOrFKName('IDX_', BuildIndexName(ATable, AIndex));
  LIndexOrientation := BuildIndexOrientation(ATable, AIndex, LIndexName);
  LUnique := BuildIndexUnique(AIndex);
  LFieldList := BuildIndexFieldList(ATable, AIndex, LIndexName, False);
  // Compose the create index query text
  LQuery := Format('CREATE %s %s INDEX %s ON %s (%s);', [LUnique, LIndexOrientation, LIndexName, ATable.TableName, LFieldList]);
  LQuery := TioSqlTranslator.Translate(LQuery, ATable.GetContextTable.GetClassName, False);
  ScriptAdd(LQuery);
end;

procedure TioDBBuilderSqlGenFirebird.AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('ALTER TABLE %s ADD CONSTRAINT PK_%s PRIMARY KEY (%s);', [ATable.TableName, ATable.TableName,
    ATable.PrimaryKeyField.FieldName]));
end;

procedure TioDBBuilderSqlGenFirebird.AddSequence(const ASequenceName: String; const ACreatingNewDatabase: boolean);
begin
  if ACreatingNewDatabase or not SequenceExists(ASequenceName) then
    ScriptAdd(Format('CREATE SEQUENCE %s;', [ASequenceName.ToUpper]));
end;

procedure TioDBBuilderSqlGenFirebird.AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
var
  LDefault: string;
begin
  // Type
  if alFieldType in AField.Altered then
  begin
    ScriptAdd(Format('%sALTER COLUMN %s TYPE %s', [ACommaBefore, AField.FieldName, TranslateFieldTypeForCreate(AField)]));
    ACommaBefore := ',';
  end;
  // Default
  if alFieldDefault in AField.Altered then
  begin
    LDefault := ExtractFieldDefaultValue(AField);
    if LDefault.IsEmpty then
      ScriptAdd(Format('%sALTER COLUMN %s DROP DEFAULT', [ACommaBefore, AField.FieldName]))
    else
      ScriptAdd(Format('%sALTER COLUMN %s SET DEFAULT %s', [ACommaBefore, AField.FieldName, LDefault]));
    ACommaBefore := ',';
  end;
  // NotNull
  // Note: SET NOT NUL & DROP BOT NULL available only from firebird 3
  if alFieldNotNull in AField.Altered then
    ScriptAdd(Format('%sALTER COLUMN %s %s NOT NULL', [ACommaBefore, AField.FieldName, IfThen(AField.FieldNotNull, 'SET', 'DROP')]));
end;

procedure TioDBBuilderSqlGenFirebird.BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('ALTER TABLE %s', [ATable.TableName]));
  IncIndentationLevel;
end;

procedure TioDBBuilderSqlGenFirebird.BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('CREATE TABLE %s (', [ATable.TableName]));
  IncIndentationLevel;
end;

function TioDBBuilderSqlGenFirebird.AdaptIndexOrFKName(const APrefix, AName: String): String;
var
  LGuid: TGuid;
begin
  // N.B. Viene calcolato un nome random (quindi non uso l'apposito metodo dell'antenato se eccessivo)
  // perchè in FB c'e' un limite a 30 caratteri di lunghezza per i nomi dei constraint
  If Length(AName) <= 30 then
    Exit(AName);
  CreateGUID(LGuid);
  Result := APrefix + LGuid.ToString.Replace('-', '', [rfReplaceAll]).Replace('}', '', [rfReplaceAll]).Substring(24);
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

procedure TioDBBuilderSqlGenFirebird.CreateField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  ScriptAdd(Format('%s%s', [ACommaBefore, InternalCreateField(AField)]));
end;

function TioDBBuilderSqlGenFirebird.DatabaseExists: boolean;
begin
  // Create the query to retrieve if DB exists
  //  NB: This code also works with ALIAS, the old one doesnt
  try
    OpenQuery('SELECT * FROM RDB$DATABASE');
    Result := True;
  except
    Result := False;
  end;
  // OLD_CODE
  // Result := FileExists(FSchema.DatabaseFileName);
end;

procedure TioDBBuilderSqlGenFirebird.DropAllForeignKeys;
var
  LQuery: IioQuery;
begin
  LQuery := NewQuery;
  LQuery.SQL.Add('select rdb$relation_name as table_name, rdb$constraint_name as constraint_name');
  LQuery.SQL.Add('from rdb$relation_constraints');
  LQuery.SQL.Add('where rdb$constraint_type = ''FOREIGN KEY''');
  LQuery.SQL.Add('  and rdb$constraint_name like ''FK_%''');
  LQuery.Open;
  while not LQuery.Eof do
  begin
    ScriptAdd(Format('ALTER TABLE %s DROP CONSTRAINT %s;', [LQuery.Fields.FieldByName('table_name').AsString,
      LQuery.Fields.FieldByName('constraint_name').AsString]));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderSqlGenFirebird.DropAllIndexes;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery('select RDB$INDEX_NAME from rdb$indices where RDB$INDEX_NAME like ''IDX_%''');
  while not LQuery.Eof do
  begin
    ScriptAdd(Format('DROP INDEX %s;', [LQuery.Fields[0].AsString]));
    LQuery.Next;
  end;
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

function TioDBBuilderSqlGenFirebird.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('select rdb$field_name from rdb$relation_fields where rdb$relation_name=''%s'' and rdb$field_name=''%s''',
    [ATable.TableName.ToUpper, AField.FieldName.ToUpper]));
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderSqlGenFirebird.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField)
  : boolean;
var
  LQuery: IioQuery;
  LTableName: string;
  LFieldName: string;

  LNewFieldType: string;
  LNewFieldSubType: string;
  LNewFieldLength: Smallint;
  LNewFieldPrecision: Smallint;
  LNewFieldDecimals: Smallint;

  LOldFieldType: string;
  LOldFieldSubType: string;
  LOldFieldLength: Smallint;
  LOldFieldPrecision: Smallint;
  LOldFieldDecimals: Smallint;
  LOldFieldNotNull: boolean;

  function IsDecimalOrNumeric: boolean;
  begin
    Result := (LOldFieldType = 'INT64') and ((LOldFieldSubType = '1') or (LOldFieldSubType = '2'));
  end;

begin
  Result := False;
  // Load some new field informations
  LTableName := ATable.TableName.ToUpper;
  LFieldName := AField.FieldName.ToUpper;
  LNewFieldType := TranslateFieldTypeForModified(AField);
  LNewFieldSubType := IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType);
  LNewFieldLength := AField.FieldLength;
  LNewFieldPrecision := AField.FieldPrecision;
  LNewFieldDecimals := AField.FieldScale;

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
  LQuery.SQL.Add(Format('WHERE r.RDB$RELATION_NAME = ''%s''', [LTableName]));
  LQuery.SQL.Add(Format('  AND r.RDB$FIELD_NAME = ''%s''', [LFieldName]));
  // LQuery.SQL.Add('ORDER BY r.RDB$FIELD_POSITION');
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
  Result := Result or IsFieldTypeChanged(LOldFieldType, LNewFieldType, AField, ATable, INVALID_FIELDTYPE_CONVERSIONS);

  // Verify if FieldLength is changed
  if 'VARCHAR,CHAR'.Contains(LNewFieldType) or 'VARCHAR,CHAR'.Contains(LOldFieldType) then
    Result := Result or IsFieldLengthChanged(LOldFieldLength, LNewFieldLength, AField, ATable);

  if IsDecimalOrNumeric then
  begin
    // Verify if something has been changed in FieldPrecision
    Result := Result or IsFieldPrecisionChanged(LOldFieldPrecision, LNewFieldPrecision, AField, ATable);
    // Verify if something has been changed in FieldDecimals (scale)
    Result := Result or IsFieldDecimalsChanged(LOldFieldDecimals, LNewFieldDecimals, AField, ATable);
  end;

  // Verify if DEFAULT setting of the field is changed
  // NOTE: I have not found a way to retrieve the current DEFAULT
  // setting from the DB (it is encoded in a binary representation called BLR)
  // so it is not possible to verify if it has changed.

  // Verify if NotNull is changed (warning cannot change not null value with firebird)
  // Note: The last parameter set the NotNull change as permitted (firebird's alter table
  // with SET NOT NULL or DROP NOT NULL is supported from version 3)
  Result := Result or IsFieldNotNullChanged(LOldFieldNotNull, AField.FieldNotNull, AField, ATable, True);

  // Verify if blob subtype is changed
  // Note: The last parameter set the blob sub-type change as NOT permitted in firebrd RDBMS
  if LNewFieldType.StartsWith('BLOB') then
    Result := Result or IsBlobSubTypeChanged(LOldFieldSubType, LNewFieldSubType, AField, ATable, False);
end;

function TioDBBuilderSqlGenFirebird.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // Extract the default value if exists
  LDefault := ExtractFieldDefaultValue(AField);
  // If primary key...
  if AField.PrimaryKey then
    Exit(Format('%s INTEGER %s NOT NULL', [AField.FieldName, LDefault]));
  // ...then continue
  LNotNull := IfThen(AField.FieldNotNull, 'NOT NULL', '');
  Result := Format('%s %s %s %s', [AField.FieldName, TranslateFieldTypeForCreate(AField), LDefault, LNotNull]).Trim;
end;

function TioDBBuilderSqlGenFirebird.SequenceExists(const ASequenceName: String): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('select count(*) from rdb$generators where rdb$generator_name = ''%s''', [ASequenceName.ToUpper]));
  Result := LQuery.Fields[0].AsInteger > 0;
end;

function TioDBBuilderSqlGenFirebird.TableExists(const ATable: IioDBBuilderSchemaTable): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('select rdb$relation_name from rdb$relations where rdb$relation_name = ''%s''',
    [ATable.TableName.ToUpper]));
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.FieldType of
    ioMdVarchar:
      Result := Format('VARCHAR(%d)', [AField.FieldLength]);
    ioMdChar:
      Result := Format('CHAR(%d)', [AField.FieldLength]);
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
      Result := Format('DECIMAL(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    ioMdNumeric:
      Result := Format('NUMERIC(%d,%d)', [AField.FieldPrecision, AField.FieldScale]);
    ioMdBoolean:
      Result := 'INTEGER';
    ioMdBinary:
      Result := Format('BLOB SUB_TYPE %s', [IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType)]);
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  end;
end;

function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.FieldType of
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
      Result := AField.FieldCustomType;
  else
    raise EioException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
  end;
end;

end.
