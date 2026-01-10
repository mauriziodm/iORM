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
    // Sequences
    procedure CreateSequences;
    procedure CreateTableSequence(const ATable: IioDBBuilderSchemaTable);
    procedure DropSequence(const ASequenceName: string);
    function SequenceExists(const ASequenceName: string): boolean;

    function GetFBSqlGenerator: IioDBBuilderSqlGeneratorFirebird;

    property FBSqlGenerator: IioDBBuilderSqlGeneratorFirebird read GetFBSqlGenerator;
  protected
    // Tables
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
    // Fields
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    // Field change detection methods
    function GetInvalidTypeConversions: string; override;
    function IsFieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsBlobSubTypeChanged(const AOldBlobSubType, ANewBlobSubType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable; const AIsPermitted: Boolean): Boolean; virtual;
    // Indexes
    procedure DropIndexes; override;
    procedure DropTableIndexes(const ATable: IioDBBuilderSchemaTable); override;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    // ForeignKeys
    procedure DropForeignKeys; override;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    // Warnings
    procedure WarningNewValueLessThanTheOldOne(const AValueName: String; const AOldValue, ANewValue: Integer; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    procedure WarningValueChanged(const AValueName, AOldValue, ANewValue: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;

    procedure GenerateDatabaseObjects(const Create: boolean); override;
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
  iORM.DB.QueryEngine

  ;


const
  INVALID_FIELDTYPE_CONVERSIONS =
    '[timestamp->decimal][timestamp->numeric][timestamp->integer][date->decimal][date->numeric]' +
    '[date->integer][time->numeric][time->decimal][time->integer][varchar->decimal][varchar->integer][varchar->date][varchar->time]' +
    '[varchar->datetime][char->decimal][char->integer][char->date][char->time][char->datetime]';



{ TioDBBuilderFirebird }

function TioDBBuilderStrategyFirebird.GetInvalidTypeConversions: string;
begin
  Result := INVALID_FIELDTYPE_CONVERSIONS;
end;

procedure TioDBBuilderStrategyFirebird.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  if taFields in ATable.Changes then
  begin
    AddOrAlterFields(ATable);
  end;

  if Schema.IndexesEnabled and (taIndexes in ATable.Changes) then
  begin
    Script.Body.AddEmpty;
    AddOrAlterIndexes(ATable);
    Script.Body.AddEmpty;
  end;
end;

procedure TioDBBuilderStrategyFirebird.CreateSequences;
var
  LSequence: String;
begin
  if Schema.Sequences.Count = 0 then
    Exit;

  Script.Body.AddTitle('Creating sequences (if empty, no sequence needs to be created)');

  for LSequence in Schema.Sequences do
  begin
    // Check if sequence exists, then create it
    if (Schema.Status = stCreate) or (not SequenceExists(LSequence)) then
      Script.Body.Add(FBSqlGenerator.BuildAddSequenceSql(LSequence, Schema.Status = stCreate));
  end;
end;

procedure TioDBBuilderStrategyFirebird.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'CreateTable', 'ATable is not assigned.');

  Script.Body.AddTitle(Format('Creating table ''%s''', [ATable.Name]));

  if (Schema.Status = stCreate) or not SequenceExists(ATable.GetSequenceName) then
    CreateTableSequence(ATable);

  Script.Body.AddEmpty;
  Script.Body.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  Script.Body.IncIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildCreateFieldsSql(ATable, Script.Body.CurrentIndentation), False);
  Script.Body.DecIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
  Script.Body.AddEmpty;
  Script.Body.Add(SqlGenerator.BuildAddPrimaryKeySql(ATable));

  if Schema.IndexesEnabled then
  begin
    Script.Body.AddEmpty;
    CreateTableIndexes(ATable);
  end;
end;

procedure TioDBBuilderStrategyFirebird.CreateTableSequence(const ATable: IioDBBuilderSchemaTable);
begin
  if not Assigned(ATable) then
    raise EioInvalidArgumentException.Create(ClassName, 'CreateTableSequence', 'ATable is not assigned.');

  if ATable.GetSequenceName.IsEmpty then
    Exit;

  // Check if sequence exists, then create it
  if (ATable.Status = stCreate) or (not SequenceExists(ATable.GetSequenceName)) then
    Script.Body.Add(FBSqlGenerator.BuildAddSequenceSql(ATable.GetSequenceName, ATable.Status = stCreate));
end;

procedure TioDBBuilderStrategyFirebird.DropForeignKeys;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildListAllForeignKeysSql, True);

  while not LQuery.Eof do
  begin
    Script.Body.Add(SqlGenerator.BuildDropForeignKeySql(LQuery.Fields.FieldByName('table_name').AsString,
      LQuery.Fields.FieldByName('constraint_name').AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyFirebird.DropIndexes;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexListForTable(''), True);

  while not LQuery.Eof do
  begin
    Script.Body.Add(SqlGenerator.BuildSQL_DropIndexByName(LQuery.Fields[0].AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyFirebird.DropSequence(const ASequenceName: string);
var
  LQuery: IioQuery;
begin
  if ASequenceName.IsEmpty then
    raise EioInvalidArgumentException.Create(ClassName, 'DropSequence', 'ASequenceName is not specified.');

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, FBSqlGenerator.BuildDropSequenceSql(ASequenceName), True);
end;

procedure TioDBBuilderStrategyFirebird.DropTableIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: IioDBBuilderSchemaIndex;
begin
  for LIndex in ATable.Indexes.Values do
    Script.Body.Add(SqlGenerator.BuildSQL_DropIndex(ATable, LIndex));
end;

function TioDBBuilderStrategyFirebird.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildFieldExistsSql(ATable, AField), True);
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
  LNewFieldType := SqlGenerator.TranslateFieldType(AField, True);
  LNewFieldSubType := IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType);
  LNewFieldLength := AField.FieldLength;
  LNewFieldPrecision := AField.FieldPrecision;
  LNewFieldDecimals := AField.FieldScale;

  // Create and open the query for old field informations
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, '', False);
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

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildForeignKeyExistsSql(ATable, AForeignKey), True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyFirebird.ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildForeignKeyModifiedSql(ATable, AForeignKey), True);

  while not (LQuery.Eof or Result) do
  begin
    Result :=
      (AForeignKey.DependentFieldName.ToUpper <> LQuery.Fields.FieldByName('Field_Name').AsString.ToUpper) or
      (AForeignKey.ReferenceFieldName.ToUpper <> LQuery.Fields.FieldByName('FK_Field').AsString.ToUpper) or
      (AForeignKey.ReferenceTableName.ToUpper <> LQuery.Fields.FieldByName('Reference_Table').AsString.ToUpper);
    if Result then
      Break;
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyFirebird.GenerateDatabaseObjects(const Create: boolean);
begin
  if Create then
  begin
    CreateTables;
    // CreateSequences;  // Carlo Marona: Create sequence was moved in CreateTable method so the create table method creates all table components

    //if Schema.IndexesEnabled then  // Carlo Marona: Create indexes was moved in CreateTable method so the create table method creates all table components
    //  CreateIndexes;

    // Foreignkeys are created at the end so all referenced tables are already created
    if Schema.ForeignKeysEnabled then
      CreateForeignKeys;
  end
  else
  begin
    // DropForeignKeys;  // Carlo Marona (2025-10-20): Removed because now the analisys was updated to take in account foreign keys changes
    Script.Body.AddEmpty;
    //DropIndexes;  // Carlo Marona: Create index method was updated to check if index exists before create so there's no need to remove all indexes blindly
    CreateOrAlterTables;
    Script.Body.AddEmpty;
    // CreateSequences;  // Carlo Marona: Create sequence was moved in CreateTable method so the create table method creates all table components

    //if Schema.IndexesEnabled then  // Carlo Marona: Create indexes was moved in CreateTable method so the create table method creates all table components
    //  CreateIndexes;

    // Foreignkeys are created at the end so all referenced tables are already created
    if Schema.ForeignKeysEnabled then
      AddOrAlterForeignKeys;
  end;
end;

function TioDBBuilderStrategyFirebird.GetFBSqlGenerator: IioDBBuilderSqlGeneratorFirebird;
begin
  if not Supports(SqlGenerator, IioDBBuilderSqlGeneratorFirebird, Result) then
    raise EioGenericException.Create(ClassName, 'GetFBSqlGenerator', 'SqlGenerator doesn''t support IioDBBuilderSqlGeneratorFirebird interface.');
end;

function TioDBBuilderStrategyFirebird.IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQueryBasic: IioQuery;
  LQueryFields: IioQuery;
  LIndexName: string;
  LOldFieldList: string;
  LNewFieldList: string;
begin
  Result := False;
  LIndexName := SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);

  // Get basic info (unique flag, orientation) for all indexes in the table
  LQueryBasic := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexListForTable(ATable.Name), True);

  // Find the specific index in the result set
  while not LQueryBasic.Eof do
  begin
    if SameText(LQueryBasic.Fields.FieldByName('RDB$INDEX_NAME').AsString.Trim, LIndexName) then
    begin
      // Check unique flag
      if LQueryBasic.Fields.FieldByName('RDB$UNIQUE_FLAG').AsInteger <> AIndex.Unique.ToInteger then
        AIndex.AddChange(icUnique);

      // Check orientation
      // Carlo Marona: Firebird index type can be 0 = Ascending, 1 = Descending. iORM orientation actually uses same values, but in the future, changes must be made carefully,
      //               because this condition could be broken.
      if LQueryBasic.Fields.FieldByName('RDB$INDEX_TYPE').AsInteger <> Ord(AIndex.IndexOrientation) then
        AIndex.AddChange(icOrientation);

      Break; // Found the index, exit loop
    end;
    LQueryBasic.Next;
  end;

  // If index not found, exit
  if LQueryBasic.Eof then
    Exit;

  // Get fields info
  LQueryFields := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexDetails(LIndexName), True);

  // Build old field list from database
  LOldFieldList := '';
  while not LQueryFields.Eof do
  begin
    if not LOldFieldList.IsEmpty then
      LOldFieldList := LOldFieldList + ',';
    LOldFieldList := LOldFieldList + LQueryFields.Fields.FieldByName('RDB$FIELD_NAME').AsString.Trim.ToUpper;
    LQueryFields.Next;
  end;

  // Compare field lists
  LNewFieldList := AIndex.CommaSepFieldList.ToUpper.Replace(' ', '');
  LOldFieldList := LOldFieldList.Replace(' ', '');
  if not SameText(LOldFieldList, LNewFieldList) then
    AIndex.AddChange(icFields);

  Result := AIndex.Changes <> [];
end;

function TioDBBuilderStrategyFirebird.IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexExists(ATable, AIndex), True);
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

function TioDBBuilderStrategyFirebird.SequenceExists(const ASequenceName: string): boolean;
var
  LQuery: IioQuery;
begin
  if ASequenceName.IsEmpty then
    raise EioInvalidArgumentException.Create(ClassName, 'SequenceExists', 'ASequenceName is not specified.');

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, FBSqlGenerator.BuildSequenceExistsSql(ASequenceName), True);
  Result := LQuery.Fields[0].AsInteger > 0;
end;

procedure TioDBBuilderStrategyFirebird.WarningNewValueLessThanTheOldOne(const AValueName: String; const AOldValue, ANewValue: Integer;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue < AOldValue then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The new %s cannot be less than the old one (old = %d, new = %d)',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyFirebird.WarningValueChanged(const AValueName, AOldValue, ANewValue: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue <> AOldValue then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

end.
