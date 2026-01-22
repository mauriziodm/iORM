unit iORM.DBBuilder.Strategy.Firebird;

interface

uses
  iORM.Attributes,
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base,
  iORM.DBBuilder.SqlGenerator.Firebird.Interfaces, iORM.Exceptions

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
    function IsFieldDefaultChanged(const AOldFieldDefault, ANewFieldDefault: String; const AField: IioDBBuilderSchemaField): Boolean; virtual;
    // Indexes
    procedure DropIndexes; override;
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

  if (Schema.Status = stCreate) or not SequenceExists(ATable.GetSequenceName) then
    CreateTableSequence(ATable);

  Script.Body.AddEmpty;
  Script.Body.Add(SqlGenerator.BuildSQL_BeginCreateTable(ATable));
  Script.Body.IncIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildSQL_CreateFields(ATable, Script.Body.CurrentIndentation));
  Script.Body.DecIndentationLevel;
  Script.Body.Add(SqlGenerator.BuildSQL_EndCreateTable(ATable));
  Script.Body.AddEmpty;
  Script.Body.Add(SqlGenerator.BuildSQL_AddPK(ATable));

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
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FKList, True);

  while not LQuery.Eof do
  begin
    Script.Body.Add(SqlGenerator.BuildSQL_DropFKbyName(LQuery.Fields.FieldByName('table_name').AsString,
      LQuery.Fields.FieldByName('constraint_name').AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyFirebird.DropIndexes;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(''), True);

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

function TioDBBuilderStrategyFirebird.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FieldExists(ATable, AField), True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyFirebird.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;

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
  LOldFieldDefault: string;
  LNewFieldDefault: string;

  function IsDecimalOrNumeric: boolean;
  begin
    // The query now returns 'DECIMAL' or 'NUMERIC' directly for decimal types
    Result := (LOldFieldType = 'DECIMAL') or (LOldFieldType = 'NUMERIC');
  end;

begin
  Result := False;
  // Load some new field informations
  LNewFieldType := SqlGenerator.Translate_SchemaField_To_FieldType(AField, False);  // False = do NOT include attributes (only base type)
  LNewFieldSubType := IfThen(AField.FieldSubType.IsEmpty, '0', AField.FieldSubType);
  LNewFieldLength := AField.FieldLength;
  LNewFieldPrecision := AField.FieldPrecision;
  LNewFieldDecimals := AField.FieldScale;
  LNewFieldDefault := SqlGenerator.Translate_SchemaField_To_DefaultValue(AField);

  // Create and open the query for old field informations
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FieldList(ATable.Name, AField.FieldName), True);

  // Field not found
  if LQuery.Eof then
    Exit(False);

  // Load some old field informations
  LOldFieldType := LQuery.Fields.FieldByName('field_type').AsString;
  LOldFieldSubType := LQuery.Fields.FieldByName('field_subtype').AsString;
  LOldFieldDecimals := Abs(LQuery.Fields.FieldByName('field_scale').AsInteger);
  LOldFieldNotNull := LQuery.Fields.FieldByName('field_not_null').AsInteger = 1;
  LOldFieldLength := LQuery.Fields.FieldByName('field_length').AsInteger;
  LOldFieldPrecision := LQuery.Fields.FieldByName('field_precision').AsInteger;
  LOldFieldDefault := LQuery.Fields.FieldByName('field_default').AsString.Trim;
  if LOldFieldDefault.ToUpper.StartsWith('DEFAULT ') then
    LOldFieldDefault := LOldFieldDefault.Substring(8).Trim;

  // Verify if fieldType has been changed and check type affinity
  Result := Result or IsFieldTypeChanged(ATable, AField, LOldFieldType, LNewFieldType);

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
  Result := Result or IsFieldDefaultChanged(LOldFieldDefault, LNewFieldDefault, AField);

  // Verify if NotNull is changed
  // Note: The last parameter indicates whether NOT NULL changes are supported.
  // We check this dynamically based on Firebird version (SET NOT NULL / DROP NOT NULL
  // is only supported from Firebird 3.0+). This controls whether blocking warnings are generated.
  Result := Result or IsFieldNotNullChanged(ATable, AField, LOldFieldNotNull, AField.FieldNotNull, FBSqlGenerator.SupportsSetDropNotNull);

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

  // BuildSQL_FKList returns only the specific FK (or empty result if not exists)
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName,
    SqlGenerator.BuildSQL_FKList(ATable.Name,
    SqlGenerator.Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey)),
    True);
  Result := not LQuery.Eof;
end;

function TioDBBuilderStrategyFirebird.ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
  LFKName: string;
  LOldOnUpdate, LNewOnUpdate: string;
  LOldOnDelete, LNewOnDelete: string;
begin
  // Note: We only check ON UPDATE and ON DELETE actions here.
  // The structural properties (DependentFieldName, ReferenceTableName, ReferenceFieldName)
  // are encoded in the FK name, so if the FK exists with this name, those properties already match.
  // This also works when the FK name is shortened using a hash, because the hash is deterministic:
  // same input properties always produce the same hash, so a different hash means different properties.
  Result := False;

  // Build FK name using SqlGenerator's method
  LFKName := SqlGenerator.Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey);

  // Query by FK name: if no record is found, the FK name changed (meaning the structural
  // properties changed), so we exit and let ForeignKeyExists handle it as a new FK.
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FKList(ATable.Name, LFKName), True);
  if LQuery.Eof then
    Exit;

  // Check ON UPDATE action
  LOldOnUpdate := LQuery.Fields.FieldByName('on_update').AsString.Trim.ToUpper;
  LNewOnUpdate := SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnUpdateAction).ToUpper;
  if not SameText(LOldOnUpdate, LNewOnUpdate) then
    Exit(True);

  // Check ON DELETE action
  LOldOnDelete := LQuery.Fields.FieldByName('on_delete').AsString.Trim.ToUpper;
  LNewOnDelete := SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnDeleteAction).ToUpper;
  if not SameText(LOldOnDelete, LNewOnDelete) then
    Exit(True);
end;

procedure TioDBBuilderStrategyFirebird.GenerateDatabaseObjects(const Create: boolean);
begin
  // Add Firebird version detection info as script comment (not warning, to avoid blocking execution)
  // Note: Accessing FirebirdVersion property triggers automatic version detection (lazy initialization)
  Script.Body.AddEmpty;
  Script.Header.AddComment(Format('Firebird version detected: %s (Major: %d, Minor: %d)',
    [FBSqlGenerator.FirebirdVersion, FBSqlGenerator.FirebirdMajorVersion, FBSqlGenerator.FirebirdMinorVersion]));

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
    raise EioDBBuilderException.Create(ClassName, 'GetFBSqlGenerator', 'SqlGenerator doesn''t support IioDBBuilderSqlGeneratorFirebird interface.');
end;

function TioDBBuilderStrategyFirebird.IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQueryIndexList: IioQuery;
  LQueryIndexDetails: IioQuery;
  LIndexName: string;
  LOldFieldList: string;
  LNewFieldList: string;
begin
  Result := False;
  LIndexName := SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);

  // Get basic info (unique flag, orientation) for all indexes in the table
  LQueryIndexList := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(ATable.Name), True);

  // Find the specific index in the result set
  while not LQueryIndexList.Eof do
  begin
    if SameText(LQueryIndexList.Fields.FieldByName('RDB$INDEX_NAME').AsString.Trim, LIndexName) then
    begin
      // Check unique flag
      if LQueryIndexList.Fields.FieldByName('RDB$UNIQUE_FLAG').AsInteger <> AIndex.Unique.ToInteger then
        AIndex.AddChange(icUnique);

      // Check orientation
      // Carlo Marona: Firebird index type can be 0 = Ascending, 1 = Descending. iORM orientation actually uses same values, but in the future, changes must be made carefully,
      //               because this condition could be broken.
      if LQueryIndexList.Fields.FieldByName('RDB$INDEX_TYPE').AsInteger <> Ord(AIndex.Orientation) then
        AIndex.AddChange(icOrientation);

      Break; // Found the index, exit loop
    end;
    LQueryIndexList.Next;
  end;

  // If index not found, exit
  if LQueryIndexList.Eof then
    Exit;

  // Get fields info
  LQueryIndexDetails := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexDetails(LIndexName), True);

  // Build old field list from database
  LOldFieldList := '';
  while not LQueryIndexDetails.Eof do
  begin
    if not LOldFieldList.IsEmpty then
      LOldFieldList := LOldFieldList + ',';
    LOldFieldList := LOldFieldList + LQueryIndexDetails.Fields.FieldByName('RDB$FIELD_NAME').AsString.Trim.ToUpper;
    LQueryIndexDetails.Next;
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

function TioDBBuilderStrategyFirebird.IsFieldDefaultChanged(const AOldFieldDefault, ANewFieldDefault: String;
  const AField: IioDBBuilderSchemaField): Boolean;
begin
  Result := not SameText(AOldFieldDefault, ANewFieldDefault);
  if Result then
    AField.AddAltered(alFieldDefault);
end;

function TioDBBuilderStrategyFirebird.IsFieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := AOldFieldDecimals <> ANewFieldDecimals;
  if Result then
  begin
    AField.AddAltered(alFieldType);
    WarningNewValueLessThanTheOldOne('field DECIMALS', AOldFieldDecimals, ANewFieldDecimals, AField, ATable);
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
    begin
      AField.AddAltered(alFieldLengthDecreased);
      WarningNewValueLessThanTheOldOne('field LENGTH', AOldFieldLength, ANewFieldLength, AField, ATable);
    end;
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

    WarningNewValueLessThanTheOldOne('field PRECISION', AOldFieldPrecision, ANewFieldPrecision, AField, ATable);
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
    Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The new %s value becomes smaller than the old one (old = %d, new = %d)',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

procedure TioDBBuilderStrategyFirebird.WarningValueChanged(const AValueName, AOldValue, ANewValue: String;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue <> AOldValue then
    Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Changing the %s is not allowed (old = ''%s'', new = ''%s'')',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

end.
