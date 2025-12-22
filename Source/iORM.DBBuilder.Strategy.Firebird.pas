unit iORM.DBBuilder.Strategy.Firebird;

interface

uses
  iORM.Attributes,
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base,
  iORM.DBBuilder.SqlGenerator.Firebird.Interfaces

  ;


type
  TioDBBuilderStrategyFirebird = class(TioDBBuilderStrategyBase)
  private
    function SequenceExists(const ASequenceName: string): boolean;
    procedure CreateSequences(const AScript: IioDBBuilderSqlScript);
    procedure CreateTableSequence(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
    procedure DropSequence(const ASequenceName: string);
    function GetFBSqlGenerator: IioDBBuilderSqlGeneratorFirebird;

    property FBSqlGenerator: IioDBBuilderSqlGeneratorFirebird read GetFBSqlGenerator;
  protected
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateDatabase; override;
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    function DatabaseExists: Boolean; override;
    procedure DropForeignKeys(const AScript: IioDBBuilderSqlScript); override;
    procedure DropIndexes(const AScript: IioDBBuilderSqlScript); override;
    procedure DropTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;

    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); override;

    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    function IndexExists(const AIndexName: string): boolean; override;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; override;

    function IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean; virtual;
    function IsBlobSubTypeChanged(const AOldBlobSubType, ANewBlobSubType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean; virtual;

    procedure WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string); virtual;
    procedure WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure WarningNewValueLessThanTheOldOne(const AValueName: String; const AOldValue, ANewValue: Integer; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure WarningValueChanged(const AValueName, AOldValue, ANewValue: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
  public

  end;


implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.CommonTypes,
  iORM.Exceptions,
  iORM.DB.Factory,
  iORM.DB.Interfaces,
  iORM.DBBuilder.QueryEngine

  ;


const
  INVALID_FIELDTYPE_CONVERSIONS =
    '[timestamp->decimal][timestamp->numeric][timestamp->integer][date->decimal][date - > numeric]' +
    '[date->integer][time->numeric][time->decimal][time->integer][varchar->decimal][varchar->integer][varchar->date][varchar->time]' +
    '[varchar->datetime][char->decimal][char->integer][char->date][char->time][char->datetime]';



{ TioDBBuilderFirebird }

procedure TioDBBuilderStrategyFirebird.AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  if taFields in ATable.Changes then
  begin
    AddOrAlterFields(AScript, ATable);
  end;

  if Schema.IndexesEnabled and (taIndexes in ATable.Changes) then
  begin
    AScript.Body.AddEmpty;
    AddOrAlterIndexes(AScript, ATable);
    AScript.Body.AddEmpty;
  end;
end;

procedure TioDBBuilderStrategyFirebird.CreateDatabase;
begin
  // N.B. Sfrutta un parametro di Firedac per autocreare il db se non esiste
  TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := 'Create';
  // N.B. Apriamo una connessione solo per fargli creare il db.
  TioDbFactory.Connection(ConnectionDefName);
  // N.B. Rimuoviamo il parametro di Firedac per autocreare il db se non esiste
  TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := 'Open';
end;

procedure TioDBBuilderStrategyFirebird.CreateSequences(const AScript: IioDBBuilderSqlScript);
var
  LSequence: String;
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateSequences', 'AScript is not assigned.');

  if Schema.Sequences.Count = 0 then
    Exit;

  AScript.Body.AddTitle('Creating sequences (if empty, no sequence needs to be created)');

  if not Assigned(FBSqlGenerator) then
    raise EioGenericException.Create(ClassName, 'CreateSequences', 'SqlGenerator doesn''t support IioDBBuilderSqlGeneratorFirebird interface.');

  for LSequence in Schema.Sequences do
  begin
    // Check if sequence exists, then create it
    if (Schema.Status = stCreate) or (not SequenceExists(LSequence)) then
      AScript.Body.Add(FBSqlGenerator.BuildAddSequenceSql(LSequence, Schema.Status = stCreate));
  end;
end;

procedure TioDBBuilderStrategyFirebird.CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LSqlGen: IioDBBuilderSqlGeneratorFirebird;
begin
  inherited;

  // Carlo Marona (2025-10-16): don't call inherited, it rewrites the method from scratch
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateTable', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'CreateTable', 'ATable is not assigned.');

  AScript.Body.AddTitle(Format('Creating table ''%s''', [ATable.Name]));

  if (Schema.Status = stCreate) or not SequenceExists(ATable.GetSequenceName) then
    CreateTableSequence(AScript, ATable);

  AScript.Body.AddEmpty;
  AScript.Body.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  Ascript.Body.IncIndentationLevel;
  AScript.Body.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.Body.CurrentIndentation), False);
  AScript.Body.DecIndentationLevel;
  AScript.Body.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
  AScript.Body.AddEmpty;
  AScript.Body.Add(SqlGenerator.BuildAddPrimaryKeySql(ATable));

  if Schema.IndexesEnabled then
  begin
    AScript.Body.AddEmpty;
    CreateTableIndexes(AScript, ATable);
  end;
end;

procedure TioDBBuilderStrategyFirebird.CreateTableSequence(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  if not Assigned(AScript) then
    raise EioArgumentNilException.Create(ClassName, 'CreateTableSequence', 'AScript is not assigned.');

  if not Assigned(ATable) then
    raise EioArgumentNilException.Create(ClassName, 'CreateTableSequence', 'ATable is not assigned.');

  if ATable.GetSequenceName.IsEmpty then
    Exit;

  if not Assigned(FBSqlGenerator) then
    raise EioGenericException.Create(ClassName, 'CreateTableSequence', 'SqlGenerator doesn''t support IioDBBuilderSqlGeneratorFirebird interface.');

  // Check if sequence exists, then create it
  if (ATable.Status = stCreate) or (not SequenceExists(ATable.GetSequenceName)) then
    AScript.Body.Add(FBSqlGenerator.BuildAddSequenceSql(ATable.GetSequenceName, ATable.Status = stCreate));
end;

function TioDBBuilderStrategyFirebird.DatabaseExists: Boolean;
var
  LOldOpenMode: string;
begin
  // NB: This code also works with ALIAS, the old one doesnt
  // Carlo Marona (2025-10-10): Opening a query here implies opening the connection and if OpenMode param is set to OpenOrCreate or Create
  //               (old code calls it CreateDatabase) in FireDac component the database will be created, so the method returns
  //               always true
  try
    // Carlo Marona (2025-10-10): Saves old OpenMode FireDac option to restore later
    LOldOpenMode := TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'];

    try
      // Carlo Marona (2025-10-10): disables FireDac database creation option in the connection (OpenMode = Open)
      TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := 'Open';

      TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, 'SELECT * FROM RDB$DATABASE');
      Result := True;
    except
      Result := False;
    end;
  finally
    // Carlo Marona (2025-10-10): Restores old OpenMode value
    TioDbFactory.ConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.Values['OpenMode'] := LOldOpenMode;
  end;
end;

procedure TioDBBuilderStrategyFirebird.DropForeignKeys(const AScript: IioDBBuilderSqlScript);
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.NewQuery(ConnectionDefName);
  LQuery.SQL.Text := SqlGenerator.BuildListAllForeignKeysSql;
  LQuery.Open;

  while not LQuery.Eof do
  begin
    AScript.Body.Add(SqlGenerator.BuildDropForeignKeySql(LQuery.Fields.FieldByName('table_name').AsString,
      LQuery.Fields.FieldByName('constraint_name').AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyFirebird.DropIndexes(const AScript: IioDBBuilderSqlScript);
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildListAllIndexesSql);

  while not LQuery.Eof do
  begin
    AScript.Body.Add(SqlGenerator.BuildDropIndexSql(LQuery.Fields[0].AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyFirebird.DropSequence(const ASequenceName: string);
var
  LQuery: IioQuery;
begin
  if ASequenceName.IsEmpty then
    raise EioArgumentNilException.Create(ClassName, 'SequenceExists', 'ASequenceName is not specified.');

  if not Assigned(FBSqlGenerator) then
    raise EioGenericException.Create(ClassName, 'SequenceExists', 'SqlGenerator doesn''t support IioDBBuilderSqlGeneratorFirebird interface.');

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, FBSqlGenerator.BuildDropSequenceSql(ASequenceName));
end;

procedure TioDBBuilderStrategyFirebird.DropTableIndexes(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildListTableIndexesSql(ATable));

  while not LQuery.Eof do
  begin
    AScript.Body.Add(SqlGenerator.BuildDropIndexSql(LQuery.Fields[0].AsString));
    LQuery.Next;
  end;
end;

function TioDBBuilderStrategyFirebird.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildFieldExistsSql(ATable, AField));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyFirebird.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
  LTableName: string;
  LFieldName: string;

  LNewFieldType: string;
  LNewFieldSubType: string;
  LNewFieldLength: Smallint;
  LNewFieldPrecision: Smallint;
  LNewFieldDecimals: Smallint;
  LFieldTypeChanged,
  LFieldLengthChanged: boolean;

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
  LTableName := ATable.Name.ToUpper;
  LFieldName := AField.FieldName.ToUpper;
  LNewFieldType := SqlGenerator.TranslateFieldType(AField); //TranslateFieldTypeForModified(AField);
  LNewFieldSubType := IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType);
  LNewFieldLength := AField.FieldLength;
  LNewFieldPrecision := AField.FieldPrecision;
  LNewFieldDecimals := AField.FieldScale;

  // Create and open the query for old field informations
  LQuery := TioDBBuilderQueryEngine.NewQuery(ConnectionDefName);
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
  Result := Result or IsFieldTypeChanged(LOldFieldType, LNewFieldType, AField, ATable);

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

function TioDBBuilderStrategyFirebird.ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildForeignKeyExistsSql(ATable, AForeignKey));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyFirebird.ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildForeignKeyModifiedSql(ATable, AForeignKey));

  while not (LQuery.Eof or Result) do
  begin
    Result :=
      (AForeignKey.DependentFieldName.ToUpper <> LQuery.Fields.FieldByName('Field_Name').AsString.ToUpper) or
      (AForeignKey.ReferenceFieldName.ToUpper <> LQuery.Fields.FieldByName('FK_Field').AsString.ToUpper) or
      (AForeignKey.ReferenceTableName.ToUpper <> LQuery.Fields.FieldByName('Reference_Table').AsString.ToUpper);
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyFirebird.GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean);
begin
  if Create then
  begin
    CreateTables(AScript);
    // CreateSequences(AScript);  // Carlo Marona: Create sequence was moved in CreateTable method so the create table method creates all table components

    //if Schema.IndexesEnabled then  // Carlo Marona: Create indexes was moved in CreateTable method so the create table method creates all table components
    //  CreateIndexes(AScript);

    // Foreignkeys are created at the end so all referenced tables are already created
    if Schema.ForeignKeysEnabled then
      CreateForeignKeys(AScript);
  end
  else
  begin
    // DropForeignKeys(AScript);  // Carlo Marona (2025-10-20): Removed because now the analisys was updated to take in account foreign keys changes
    AScript.Body.AddEmpty;
    //DropIndexes(AScript);  // Carlo Marona: Create index method was updated to check if index exists before create so there's no need to remove all indexes blindly
    CreateOrAlterTables(AScript);
    AScript.Body.AddEmpty;
    // CreateSequences(AScript);  // Carlo Marona: Create sequence was moved in CreateTable method so the create table method creates all table components

    //if Schema.IndexesEnabled then  // Carlo Marona: Create indexes was moved in CreateTable method so the create table method creates all table components
    //  CreateIndexes(AScript);

    // Foreignkeys are created at the end so all referenced tables are already created
    if Schema.ForeignKeysEnabled then
      AddOrAlterForeignKeys(AScript);
  end;
end;

function TioDBBuilderStrategyFirebird.GetFBSqlGenerator: IioDBBuilderSqlGeneratorFirebird;
begin
  Result := nil;

  Supports(SqlGenerator, IioDBBuilderSqlGeneratorFirebird, Result);
end;

function TioDBBuilderStrategyFirebird.IndexExists(const AIndexName: string): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  if AIndexName.IsEmpty then
    Exit;

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildIndexExistsSql(AIndexName));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyFirebird.IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
  LNewIndexOrientation: TioIndexOrientation;
begin
  Result := False;

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildIndexModifiedSql(ATable, AIndex));

  while not LQuery.Eof do
  begin
    if not AIndex.CommaSepFieldList.ToUpper.Contains(LQuery.Fields.FieldByName('FieldName').AsString.ToUpper) then
      AIndex.AddChange(icFields);

    if LQuery.Fields.FieldByName('UniqueFlag').AsInteger <> AIndex.Unique.ToInteger then
      AIndex.AddChange(icUnique);

    // Carlo Marona: Firebird index type can be 0 = Ascending, 1 = Descending. iORM orientation actually uses same values, but in the future, changes must be made carefully,
    //               because this condition could be broken.
    if LQuery.Fields.FieldByName('IndexType').AsInteger <> Ord(AIndex.IndexOrientation) then
      AIndex.AddChange(icOrientation);

    LQuery.Next;
  end;

  Result := AIndex.Changes <> [];
end;

function TioDBBuilderStrategyFirebird.IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildIndexExistsSql(ATable, AIndex));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyFirebird.IsBlobSubTypeChanged(const AOldBlobSubType, ANewBlobSubType: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean;
begin
  Result := AOldBlobSubType <> ANewBlobSubType;

  if Result then
  begin
    AField.AddAltered(alFieldType);
    if not AIsPermitted then
      WarningValueChanged('blob sub-type', AOldBlobSubType, ANewBlobSubType, AField, ATable);
  end;
end;

function TioDBBuilderStrategyFirebird.IsFieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := AOldFieldDecimals <> ANewFieldDecimals;
  if Result then
  begin
    AField.AddAltered(alFieldType);
    WarningNewValueLessThanTheOldOne('field decimals', AOldFieldDecimals, ANewFieldDecimals, AField, ATable);
  end;
end;

function TioDBBuilderStrategyFirebird.IsFieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := ANewFieldLength <> AOldFieldLength;
  if Result then
  begin
    if ANewFieldLength > AOldFieldLength then
      AField.AddAltered(alFieldLengthIncreased)
    else
      AField.AddAltered(alFieldLengthDecreased);

    WarningNewValueLessThanTheOldOne('field length', AOldFieldLength, ANewFieldLength, AField, ATable);
  end;
end;

function TioDBBuilderStrategyFirebird.IsFieldNotNullChanged(const AOldFieldNotNull, ANewFieldNotNull: Boolean;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean;
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

function TioDBBuilderStrategyFirebird.IsFieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := AOldFieldPrecision <> ANewFieldPrecision;
  if Result then
  begin
    if ANewFieldPrecision > AOldFieldPrecision then
      AField.AddAltered(alFieldPrecisionIncreased)
    else
      AField.AddAltered(alFieldPrecisionDecreased);

    WarningNewValueLessThanTheOldOne('field precision', AOldFieldPrecision, ANewFieldPrecision, AField, ATable);
  end;
end;

function TioDBBuilderStrategyFirebird.IsFieldTypeChanged(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField;
  const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := not SameText(AOldFieldType, ANewFieldType);
  if Result then
  begin
    AField.AddAltered(alFieldType);
    WarningTypeAffinity(AOldFieldType, ANewFieldType, AField, ATable, INVALID_FIELDTYPE_CONVERSIONS);
  end;
end;

function TioDBBuilderStrategyFirebird.SequenceExists(const ASequenceName: string): boolean;
var
  LQuery: IioQuery;
  LSqlGen: IioDBBuilderSqlGeneratorFirebird;
begin
  if ASequenceName.IsEmpty then
    raise EioArgumentNilException.Create(ClassName, 'SequenceExists', 'ASequenceName is not specified.');

  if not Supports(SqlGenerator, IioDBBuilderSqlGeneratorFirebird, LSqlGen) then
    raise EioGenericException.Create(ClassName, 'SequenceExists', 'SqlGenerator doesn''t support IioDBBuilderSqlGeneratorFirebird interface.');

  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, LSqlGen.BuildSequenceExistsSql(ASequenceName));
  Result := LQuery.Fields[0].AsInteger > 0;
end;

function TioDBBuilderStrategyFirebird.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildTableExistsSql(ATable.Name));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

procedure TioDBBuilderStrategyFirebird.WarningNewValueLessThanTheOldOne(const AValueName: String; const AOldValue, ANewValue: Integer;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue < AOldValue then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The new %s cannot be less than the old one (old = %d, new = %d)',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyFirebird.WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
  const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull <> AOldFieldNotNull then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The not null setting cannot be changed automatically',
      [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategyFirebird.WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
  const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull and (not AOldFieldNotNull) and (not AField.FieldDefaultExists) then
    Schema.Warnings.Add
      (Format('Table ''%s'' field ''%s'' --> The not null setting is changed from false to true and a default value has not been specified',
      [ATable.Name, AField.FieldName]));
end;

procedure TioDBBuilderStrategyFirebird.WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField;
  const ATable: IioDBBuilderSchemaTable; const AInvalidTypeConversions: string);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
  if ContainsText(AInvalidTypeConversions, LRequiredConversion) then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''', [ATable.Name, AField.FieldName,
      AOldFieldType, ANewFieldType]));
end;

procedure TioDBBuilderStrategyFirebird.WarningValueChanged(const AValueName, AOldValue, ANewValue: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue <> AOldValue then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

end.
