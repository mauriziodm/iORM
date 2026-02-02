unit iORM.Test.DBBuilder.SqlGenerator.Firebird;

interface

uses
  DUnitX.TestFramework,
  iORM.DBBuilder.Interfaces,
  iORM.CommonTypes,
  iORM.Attributes,
  iORM.Context.Properties.Interfaces;

type
  /// <summary>
  /// Test fixture for TioDBBuilderSqlGenFirebird class.
  /// Tests Firebird-specific SQL generation without requiring a real database connection.
  /// </summary>
  [TestFixture]
  TioTestSqlGeneratorFirebird = class
  private
    // Helper methods
    function CreateMockTable(const AName: String): IioDBBuilderSchemaTable;
    function CreateMockField(const AName: String; AFieldType: TioMetadataFieldType): IioDBBuilderSchemaField;
    function CreateMockIndex(const AName, AFieldList: String): IioDBBuilderSchemaIndex;
    function CreateMockFK(const AName, ADepTable, ADepField, ARefTable, ARefField: String): IioDBBuilderSchemaFK;
    function CreateMockRDBMSInfo(const AMajor, AMinor: Integer): IioDBBuilderSchemaRDBMSInfo;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    // ==========================================================================
    // Test: Identifier length constraints
    // ==========================================================================
    [Test]
    procedure MaxIdentifierLength_Returns_31;
    [Test]
    procedure MinIdentifierLength_Returns_4;

    // ==========================================================================
    // Test: BuildSQL_BeginCreateTable / BuildSQL_EndCreateTable
    // ==========================================================================
    [Test]
    procedure BeginCreateTable_Returns_CreateTableStatement;
    [Test]
    procedure EndCreateTable_Returns_ClosingParenthesis;

    // ==========================================================================
    // Test: BuildSQL_BeginAlterTable / BuildSQL_EndAlterTable
    // ==========================================================================
    [Test]
    procedure BeginAlterTable_Returns_AlterTableStatement;
    [Test]
    procedure EndAlterTable_Returns_Semicolon;

    // ==========================================================================
    // Test: BuildSQL_TableExists
    // ==========================================================================
    [Test]
    procedure TableExists_Returns_RDBRelationsQuery;
    [Test]
    procedure TableExists_ExcludesSystemTables;
    [Test]
    procedure TableExists_EscapesQuotes;

    // ==========================================================================
    // Test: BuildSQL_CreateField / BuildSQL_AddField
    // ==========================================================================
    [Test]
    procedure CreateField_PrimaryKey_Returns_IntegerNotNull;
    [Test]
    procedure CreateField_Varchar_IncludesLength;
    [Test]
    procedure CreateField_Decimal_IncludesPrecisionAndScale;
    [Test]
    procedure CreateField_NotNull_IncludesNotNull;
    [Test]
    procedure AddField_Returns_AddClause;

    // ==========================================================================
    // Test: Translate_SchemaField_To_FieldType
    // ==========================================================================
    [Test]
    procedure FieldType_Varchar_WithAttrs_IncludesLength;
    [Test]
    procedure FieldType_Varchar_WithoutAttrs_NoLength;
    [Test]
    procedure FieldType_Char_WithAttrs_IncludesLength;
    [Test]
    procedure FieldType_Integer_Returns_INTEGER;
    [Test]
    procedure FieldType_Float_Returns_FLOAT;
    [Test]
    procedure FieldType_Date_Returns_DATE;
    [Test]
    procedure FieldType_Time_Returns_TIME;
    [Test]
    procedure FieldType_DateTime_Returns_TIMESTAMP;
    [Test]
    procedure FieldType_Decimal_WithAttrs_IncludesPrecisionScale;
    [Test]
    procedure FieldType_Numeric_WithAttrs_IncludesPrecisionScale;
    [Test]
    procedure FieldType_Boolean_Returns_INTEGER;
    [Test]
    procedure FieldType_Binary_WithAttrs_IncludesSubType;
    [Test]
    procedure FieldType_Binary_DefaultSubType_Is_0;
    [Test]
    procedure FieldType_CustomType_Returns_CustomValue;

    // ==========================================================================
    // Test: BuildSQL_AlterField
    // ==========================================================================
    [Test]
    procedure AlterField_TypeChanged_Returns_AlterColumnType;
    [Test]
    procedure AlterField_DefaultChanged_Returns_SetDefault;
    [Test]
    procedure AlterField_DefaultRemoved_Returns_DropDefault;
    [Test]
    procedure AlterField_NotNullChanged_FB30_Returns_SetNotNull;
    [Test]
    procedure AlterField_NotNullChanged_FB25_RaisesException;

    // ==========================================================================
    // Test: BuildSQL_AddIndex
    // ==========================================================================
    [Test]
    procedure AddIndex_Simple_Returns_CreateIndexStatement;
    [Test]
    procedure AddIndex_Unique_IncludesUniqueKeyword;
    [Test]
    procedure AddIndex_Ascending_IncludesASC;
    [Test]
    procedure AddIndex_Descending_IncludesDESC;

    // ==========================================================================
    // Test: BuildSQL_AddPK
    // ==========================================================================
    [Test]
    procedure AddPK_Returns_AlterTableAddConstraint;

    // ==========================================================================
    // Test: BuildSQL_DropIndexByName
    // ==========================================================================
    [Test]
    procedure DropIndexByName_Returns_DropIndexStatement;

    // ==========================================================================
    // Test: BuildSQL_IndexExistsByName
    // ==========================================================================
    [Test]
    procedure IndexExistsByName_Returns_RDBIndicesQuery;

    // ==========================================================================
    // Test: BuildSQL_IndexList
    // ==========================================================================
    [Test]
    procedure IndexList_NoTable_Returns_AllIndexes;
    [Test]
    procedure IndexList_WithTable_FiltersbyTableName;
    [Test]
    procedure IndexList_ExcludesSystemIndexes;

    // ==========================================================================
    // Test: BuildSQL_IndexDetails
    // ==========================================================================
    [Test]
    procedure IndexDetails_Returns_RDBIndexSegmentsQuery;

    // ==========================================================================
    // Test: BuildSQL_AddFK
    // ==========================================================================
    [Test]
    procedure AddFK_Returns_AlterTableAddConstraint;
    [Test]
    procedure AddFK_WithCascade_IncludesOnDeleteCascade;

    // ==========================================================================
    // Test: BuildSQL_DropFKbyName
    // ==========================================================================
    [Test]
    procedure DropFKbyName_Returns_DropConstraint;

    // ==========================================================================
    // Test: BuildSQL_FKList
    // ==========================================================================
    [Test]
    procedure FKList_NoTable_Returns_AllFKs;
    [Test]
    procedure FKList_WithTable_FiltersbyTableName;
    [Test]
    procedure FKList_WithFKName_FiltersByFKName;

    // ==========================================================================
    // Test: BuildSQL_FieldExists
    // ==========================================================================
    [Test]
    procedure FieldExists_Returns_RDBRelationFieldsQuery;

    // ==========================================================================
    // Test: BuildSQL_FieldList
    // ==========================================================================
    [Test]
    procedure FieldList_Returns_ComplexJoinQuery;
    [Test]
    procedure FieldList_WithFieldName_FiltersbyFieldName;

    // ==========================================================================
    // Test: Sequence operations
    // ==========================================================================
    [Test]
    procedure AddSequence_Returns_CreateSequence;
    [Test]
    procedure DropSequence_Returns_DropSequence;
    [Test]
    procedure SequenceExists_Returns_GeneratorsQuery;

    // ==========================================================================
    // Test: Translate_SchemaIndex_To_CommaSepListOfFieldNames (Firebird override)
    // ==========================================================================
    [Test]
    procedure IndexFieldList_RemovesAscDesc;
  end;

implementation

uses
  System.SysUtils,
  iORM.Test.DBBuilder.Mocks,
  iORM.DBBuilder.SqlGenerator.Firebird,
  iORM.DBBuilder.SqlGenerator.Firebird.Interfaces,
  iORM.Exceptions;

type
  /// <summary>
  /// Test wrapper for Firebird SqlGenerator that bypasses database connection.
  /// </summary>
  TTestSqlGenFirebird = class(TioDBBuilderSqlGenFirebird)
  protected
    function Translate_SchemaField_To_DefaultValue(const AField: IioDBBuilderSchemaField): string; override;
  public
    constructor Create; reintroduce;
    // Expose protected methods for testing
    function Test_GetMaxSqlIdentifierLength: Integer;
    function Test_GetMinSqlIdentifierLength: Integer;
    function Test_BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string;
    function Test_BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string;
    function Test_BuildSQL_BeginAlterTable(const ATable: IioDBBuilderSchemaTable): string;
    function Test_BuildSQL_EndAlterTable(const ATable: IioDBBuilderSchemaTable): string;
    function Test_BuildSQL_TableExists(const ATableName: string): string;
    function Test_BuildSQL_CreateField(const AField: IioDBBuilderSchemaField): string;
    function Test_BuildSQL_AddField(const AField: IioDBBuilderSchemaField): string;
    function Test_BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo): string;
    function Test_BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
    function Test_BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string;
    function Test_Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String;
    function Test_BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
    function Test_BuildSQL_AddPK(const ATable: IioDBBuilderSchemaTable): string;
    function Test_BuildSQL_DropIndexByName(const AIndexName: string): string;
    function Test_BuildSQL_IndexExistsByName(const AIndexName: string): string;
    function Test_BuildSQL_IndexList(const ATableName: string = ''): string;
    function Test_BuildSQL_IndexDetails(const AIndexName: string): string;
    function Test_BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
    function Test_BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string;
    function Test_BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string;
    function Test_BuildSQL_AddSequence(const ASequenceName: String): string;
    function Test_BuildSQL_DropSequence(const ASequenceName: string): string;
    function Test_BuildSQL_SequenceExists(const ASequenceName: string): string;
    function Test_Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String;
  end;

{ TTestSqlGenFirebird }

constructor TTestSqlGenFirebird.Create;
begin
  // Don't call inherited - bypass connection infrastructure entirely
  // Delphi zeroes memory on allocation, so all fields are nil/0/empty
end;

function TTestSqlGenFirebird.Translate_SchemaField_To_DefaultValue(const AField: IioDBBuilderSchemaField): string;
begin
  // Simple conversion for testing - no DataConverter needed
  if AField.FieldDefault.IsEmpty then
    Result := ''
  else
    Result := AField.FieldDefault.ToString;
end;

function TTestSqlGenFirebird.Test_GetMaxSqlIdentifierLength: Integer;
begin
  Result := GetMaxSqlIdentifierLength;
end;

function TTestSqlGenFirebird.Test_GetMinSqlIdentifierLength: Integer;
begin
  Result := GetMinSqlIdentifierLength;
end;

function TTestSqlGenFirebird.Test_BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildSQL_BeginCreateTable(ATable);
end;

function TTestSqlGenFirebird.Test_BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildSQL_EndCreateTable(ATable);
end;

function TTestSqlGenFirebird.Test_BuildSQL_BeginAlterTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildSQL_BeginAlterTable(ATable);
end;

function TTestSqlGenFirebird.Test_BuildSQL_EndAlterTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildSQL_EndAlterTable(ATable);
end;

function TTestSqlGenFirebird.Test_BuildSQL_TableExists(const ATableName: string): string;
begin
  Result := BuildSQL_TableExists(ATableName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_CreateField(const AField: IioDBBuilderSchemaField): string;
begin
  Result := BuildSQL_CreateField(AField);
end;

function TTestSqlGenFirebird.Test_BuildSQL_AddField(const AField: IioDBBuilderSchemaField): string;
begin
  Result := BuildSQL_AddField(AField);
end;

function TTestSqlGenFirebird.Test_BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField; const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo): string;
begin
  Result := BuildSQL_AlterField(ATable, AField, ARDBMSInfo);
end;

function TTestSqlGenFirebird.Test_BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): string;
begin
  Result := BuildSQL_FieldExists(ATable, AField);
end;

function TTestSqlGenFirebird.Test_BuildSQL_FieldList(const ATableName: string; const AFieldName: string): string;
begin
  Result := BuildSQL_FieldList(ATableName, AFieldName);
end;

function TTestSqlGenFirebird.Test_Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField;
  const AIncludeTypeAttributes: boolean): String;
begin
  Result := Translate_SchemaField_To_FieldType(AField, AIncludeTypeAttributes);
end;

function TTestSqlGenFirebird.Test_BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): string;
begin
  Result := BuildSQL_AddIndex(ATable, AIndex);
end;

function TTestSqlGenFirebird.Test_BuildSQL_AddPK(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildSQL_AddPK(ATable);
end;

function TTestSqlGenFirebird.Test_BuildSQL_DropIndexByName(const AIndexName: string): string;
begin
  Result := BuildSQL_DropIndexByName(AIndexName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_IndexExistsByName(const AIndexName: string): string;
begin
  Result := BuildSQL_IndexExistsByName(AIndexName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_IndexList(const ATableName: string): string;
begin
  Result := BuildSQL_IndexList(ATableName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_IndexDetails(const AIndexName: string): string;
begin
  Result := BuildSQL_IndexDetails(AIndexName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): string;
begin
  Result := BuildSQL_AddFK(ATable, AForeignKey);
end;

function TTestSqlGenFirebird.Test_BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string;
begin
  Result := BuildSQL_DropFKbyName(ATableName, AForeignKeyName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_FKList(const ATableName: string; const AFKName: string): string;
begin
  Result := BuildSQL_FKList(ATableName, AFKName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_AddSequence(const ASequenceName: String): string;
begin
  Result := BuildSQL_AddSequence(ASequenceName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_DropSequence(const ASequenceName: string): string;
begin
  Result := BuildSQL_DropSequence(ASequenceName);
end;

function TTestSqlGenFirebird.Test_BuildSQL_SequenceExists(const ASequenceName: string): string;
begin
  Result := BuildSQL_SequenceExists(ASequenceName);
end;

function TTestSqlGenFirebird.Test_Translate_SchemaIndex_To_CommaSepListOfFieldNames(
  const AIndex: IioDBBuilderSchemaIndex): String;
begin
  Result := Translate_SchemaIndex_To_CommaSepListOfFieldNames(AIndex);
end;

{ TioTestSqlGeneratorFirebird }

procedure TioTestSqlGeneratorFirebird.Setup;
begin
  // Setup code if needed
end;

procedure TioTestSqlGeneratorFirebird.TearDown;
begin
  // Cleanup code if needed
end;

function TioTestSqlGeneratorFirebird.CreateMockTable(const AName: String): IioDBBuilderSchemaTable;
begin
  Result := TioMockSchemaTable.Create(AName);
end;

function TioTestSqlGeneratorFirebird.CreateMockField(const AName: String;
  AFieldType: TioMetadataFieldType): IioDBBuilderSchemaField;
begin
  Result := TioMockSchemaField.Create(AName, AFieldType);
end;

function TioTestSqlGeneratorFirebird.CreateMockIndex(const AName, AFieldList: String): IioDBBuilderSchemaIndex;
begin
  Result := TioMockSchemaIndex.Create(AName, AFieldList);
end;

function TioTestSqlGeneratorFirebird.CreateMockFK(const AName, ADepTable, ADepField,
  ARefTable, ARefField: String): IioDBBuilderSchemaFK;
begin
  Result := TioMockSchemaFK.Create(AName, ADepTable, ADepField, ARefTable, ARefField);
end;

function TioTestSqlGeneratorFirebird.CreateMockRDBMSInfo(const AMajor, AMinor: Integer): IioDBBuilderSchemaRDBMSInfo;
begin
  Result := TioMockRDBMSInfo.Create('Firebird', Format('%d.%d.0', [AMajor, AMinor]),
    Format('%d.%d.0', [AMajor, AMinor]), AMajor, AMinor);
end;

// ==========================================================================
// Test: Identifier length constraints
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.MaxIdentifierLength_Returns_31;
var
  LSqlGen: TTestSqlGenFirebird;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    Assert.AreEqual(31, LSqlGen.Test_GetMaxSqlIdentifierLength);
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.MinIdentifierLength_Returns_4;
var
  LSqlGen: TTestSqlGenFirebird;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    Assert.AreEqual(4, LSqlGen.Test_GetMinSqlIdentifierLength);
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_BeginCreateTable / BuildSQL_EndCreateTable
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.BeginCreateTable_Returns_CreateTableStatement;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LSql := LSqlGen.Test_BuildSQL_BeginCreateTable(LTable);
    Assert.Contains(LSql, 'CREATE TABLE');
    Assert.Contains(LSql, '[CUSTOMERS]');
    Assert.Contains(LSql, '(');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.EndCreateTable_Returns_ClosingParenthesis;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LSql := LSqlGen.Test_BuildSQL_EndCreateTable(LTable);
    Assert.AreEqual(');', LSql);
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_BeginAlterTable / BuildSQL_EndAlterTable
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.BeginAlterTable_Returns_AlterTableStatement;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LSql := LSqlGen.Test_BuildSQL_BeginAlterTable(LTable);
    Assert.Contains(LSql, 'ALTER TABLE');
    Assert.Contains(LSql, '[CUSTOMERS]');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.EndAlterTable_Returns_Semicolon;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LSql := LSqlGen.Test_BuildSQL_EndAlterTable(LTable);
    Assert.AreEqual(';', LSql);
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_TableExists
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.TableExists_Returns_RDBRelationsQuery;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_TableExists('CUSTOMERS');
    Assert.Contains(LSql.ToUpper, 'RDB$RELATIONS');
    Assert.Contains(LSql.ToUpper, 'RDB$RELATION_NAME');
    Assert.Contains(LSql.ToUpper, 'CUSTOMERS');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.TableExists_ExcludesSystemTables;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_TableExists('CUSTOMERS');
    Assert.Contains(LSql.ToUpper, 'RDB$SYSTEM_FLAG');
    Assert.Contains(LSql, '0');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.TableExists_EscapesQuotes;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_TableExists('TABLE''S');
    Assert.Contains(LSql, 'TABLE''''S');  // Escaped
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_CreateField / BuildSQL_AddField
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.CreateField_PrimaryKey_Returns_IntegerNotNull;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('ID', ioMdInteger).WithPrimaryKey(True);
    LSql := LSqlGen.Test_BuildSQL_CreateField(LField);
    Assert.Contains(LSql, 'INTEGER');
    Assert.Contains(LSql, 'NOT NULL');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.CreateField_Varchar_IncludesLength;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Name', ioMdVarchar).WithLength(100);
    LSql := LSqlGen.Test_BuildSQL_CreateField(LField);
    Assert.Contains(LSql, 'VARCHAR');
    Assert.Contains(LSql, '(100)');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.CreateField_Decimal_IncludesPrecisionAndScale;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Amount', ioMdDecimal).WithPrecision(10).WithScale(2);
    LSql := LSqlGen.Test_BuildSQL_CreateField(LField);
    Assert.Contains(LSql, 'DECIMAL');
    Assert.Contains(LSql, '(10,2)');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.CreateField_NotNull_IncludesNotNull;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Name', ioMdVarchar).WithNotNull(True).WithLength(50);
    LSql := LSqlGen.Test_BuildSQL_CreateField(LField);
    Assert.Contains(LSql, 'NOT NULL');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AddField_Returns_AddClause;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('NewField', ioMdVarchar).WithLength(50);
    LSql := LSqlGen.Test_BuildSQL_AddField(LField);
    Assert.Contains(LSql, 'ADD');
    Assert.Contains(LSql, 'VARCHAR(50)');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: Translate_SchemaField_To_FieldType
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.FieldType_Varchar_WithAttrs_IncludesLength;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Name', ioMdVarchar).WithLength(100);
    Assert.AreEqual('VARCHAR(100)', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Varchar_WithoutAttrs_NoLength;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Name', ioMdVarchar).WithLength(100);
    Assert.AreEqual('VARCHAR', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, False));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Char_WithAttrs_IncludesLength;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Code', ioMdChar).WithLength(10);
    Assert.AreEqual('CHAR(10)', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Integer_Returns_INTEGER;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := CreateMockField('Qty', ioMdInteger);
    Assert.AreEqual('INTEGER', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Float_Returns_FLOAT;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := CreateMockField('Price', ioMdFloat);
    Assert.AreEqual('FLOAT', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Date_Returns_DATE;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := CreateMockField('BirthDate', ioMdDate);
    Assert.AreEqual('DATE', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Time_Returns_TIME;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := CreateMockField('StartTime', ioMdTime);
    Assert.AreEqual('TIME', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_DateTime_Returns_TIMESTAMP;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := CreateMockField('CreatedAt', ioMdDateTime);
    Assert.AreEqual('TIMESTAMP', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Decimal_WithAttrs_IncludesPrecisionScale;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Amount', ioMdDecimal).WithPrecision(10).WithScale(2);
    Assert.AreEqual('DECIMAL(10,2)', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Numeric_WithAttrs_IncludesPrecisionScale;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Total', ioMdNumeric).WithPrecision(15).WithScale(4);
    Assert.AreEqual('NUMERIC(15,4)', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Boolean_Returns_INTEGER;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := CreateMockField('Active', ioMdBoolean);
    Assert.AreEqual('INTEGER', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Binary_WithAttrs_IncludesSubType;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Data', ioMdBinary).WithSubType('1');
    Assert.AreEqual('BLOB SUB_TYPE 1', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_Binary_DefaultSubType_Is_0;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := CreateMockField('Data', ioMdBinary);  // No subtype specified
    Assert.AreEqual('BLOB SUB_TYPE 0', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldType_CustomType_Returns_CustomValue;
var
  LSqlGen: TTestSqlGenFirebird;
  LField: IioDBBuilderSchemaField;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LField := TioMockSchemaField.Create('Special', ioMdCustomFieldType).WithCustomType('CUSTOM_DOMAIN');
    Assert.AreEqual('CUSTOM_DOMAIN', LSqlGen.Test_Translate_SchemaField_To_FieldType(LField, True));
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_AlterField
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.AlterField_TypeChanged_Returns_AlterColumnType;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LField: IioDBBuilderSchemaField;
  LRDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LField := TioMockSchemaField.Create('Name', ioMdVarchar)
      .WithLength(100)
      .WithAltered([alFieldType]);
    LRDBMSInfo := CreateMockRDBMSInfo(3, 0);
    LSql := LSqlGen.Test_BuildSQL_AlterField(LTable, LField, LRDBMSInfo);
    Assert.Contains(LSql, 'ALTER TABLE');
    Assert.Contains(LSql, 'ALTER COLUMN');
    Assert.Contains(LSql, 'TYPE');
    Assert.Contains(LSql, 'VARCHAR(100)');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AlterField_DefaultChanged_Returns_SetDefault;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LField: IioDBBuilderSchemaField;
  LRDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LField := TioMockSchemaField.Create('Status', ioMdInteger)
      .WithDefault(1)
      .WithAltered([alFieldDefault]);
    LRDBMSInfo := CreateMockRDBMSInfo(3, 0);
    LSql := LSqlGen.Test_BuildSQL_AlterField(LTable, LField, LRDBMSInfo);
    Assert.Contains(LSql, 'SET DEFAULT');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AlterField_DefaultRemoved_Returns_DropDefault;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LField: IioDBBuilderSchemaField;
  LRDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LField := TioMockSchemaField.Create('Status', ioMdInteger)
      .WithAltered([alFieldDefault]);  // No default value = removed
    LRDBMSInfo := CreateMockRDBMSInfo(3, 0);
    LSql := LSqlGen.Test_BuildSQL_AlterField(LTable, LField, LRDBMSInfo);
    Assert.Contains(LSql, 'DROP DEFAULT');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AlterField_NotNullChanged_FB30_Returns_SetNotNull;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LField: IioDBBuilderSchemaField;
  LRDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LField := TioMockSchemaField.Create('Name', ioMdVarchar)
      .WithLength(50)
      .WithNotNull(True)
      .WithAltered([alFieldNotNull]);
    LRDBMSInfo := CreateMockRDBMSInfo(3, 0);  // Firebird 3.0+
    LSql := LSqlGen.Test_BuildSQL_AlterField(LTable, LField, LRDBMSInfo);
    Assert.Contains(LSql, 'SET NOT NULL');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AlterField_NotNullChanged_FB25_RaisesException;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LField: IioDBBuilderSchemaField;
  LRDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LField := TioMockSchemaField.Create('Name', ioMdVarchar)
      .WithLength(50)
      .WithNotNull(True)
      .WithAltered([alFieldNotNull]);
    LRDBMSInfo := CreateMockRDBMSInfo(2, 5);  // Firebird 2.5 - doesn't support SET NOT NULL
    Assert.WillRaise(
      procedure
      begin
        LSqlGen.Test_BuildSQL_AlterField(LTable, LField, LRDBMSInfo);
      end,
      EioDBBuilderException
    );
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_AddIndex
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.AddIndex_Simple_Returns_CreateIndexStatement;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LIndex: IioDBBuilderSchemaIndex;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LIndex := CreateMockIndex('IDX_CUSTOMERS_NAME', 'Name');
    LSql := LSqlGen.Test_BuildSQL_AddIndex(LTable, LIndex);
    Assert.Contains(LSql, 'CREATE');
    Assert.Contains(LSql, 'INDEX');
    Assert.Contains(LSql, 'ON');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AddIndex_Unique_IncludesUniqueKeyword;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LIndex: IioDBBuilderSchemaIndex;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LIndex := TioMockSchemaIndex.Create('IDX_CUSTOMERS_EMAIL', 'Email').WithUnique(True);
    LSql := LSqlGen.Test_BuildSQL_AddIndex(LTable, LIndex);
    Assert.Contains(LSql, 'UNIQUE');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AddIndex_Ascending_IncludesASC;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LIndex: IioDBBuilderSchemaIndex;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LIndex := TioMockSchemaIndex.Create('IDX_TEST', 'Field1').WithOrientation(ioAscending);
    LSql := LSqlGen.Test_BuildSQL_AddIndex(LTable, LIndex);
    Assert.Contains(LSql, ' ASC ');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AddIndex_Descending_IncludesDESC;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LIndex: IioDBBuilderSchemaIndex;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LIndex := TioMockSchemaIndex.Create('IDX_TEST', 'Field1').WithOrientation(ioDescending);
    LSql := LSqlGen.Test_BuildSQL_AddIndex(LTable, LIndex);
    Assert.Contains(LSql, ' DESC ');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_AddPK
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.AddPK_Returns_AlterTableAddConstraint;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LPKField: IioDBBuilderSchemaField;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LPKField := TioMockSchemaField.Create('ID', ioMdInteger).WithPrimaryKey(True);
    LTable := TioMockSchemaTable.Create('CUSTOMERS').WithPrimaryKeyField(LPKField);
    LSql := LSqlGen.Test_BuildSQL_AddPK(LTable);
    Assert.Contains(LSql, 'ALTER TABLE');
    Assert.Contains(LSql, 'ADD CONSTRAINT');
    Assert.Contains(LSql, 'PRIMARY KEY');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_DropIndexByName
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.DropIndexByName_Returns_DropIndexStatement;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_DropIndexByName('IDX_TEST');
    Assert.Contains(LSql, 'DROP INDEX');
    Assert.Contains(LSql, 'IDX_TEST');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_IndexExistsByName
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.IndexExistsByName_Returns_RDBIndicesQuery;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_IndexExistsByName('IDX_TEST');
    Assert.Contains(LSql.ToUpper, 'RDB$INDICES');
    Assert.Contains(LSql.ToUpper, 'RDB$INDEX_NAME');
    Assert.Contains(LSql, 'IDX_TEST');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_IndexList
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.IndexList_NoTable_Returns_AllIndexes;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_IndexList('');
    Assert.Contains(LSql.ToUpper, 'RDB$INDICES');
    Assert.DoesNotContain(LSql.ToUpper, 'RDB$RELATION_NAME =');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.IndexList_WithTable_FiltersbyTableName;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_IndexList('CUSTOMERS');
    Assert.Contains(LSql.ToUpper, 'RDB$RELATION_NAME');
    Assert.Contains(LSql.ToUpper, 'CUSTOMERS');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.IndexList_ExcludesSystemIndexes;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_IndexList('');
    Assert.Contains(LSql.ToUpper, 'RDB$SYSTEM_FLAG');
    Assert.Contains(LSql, '0');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_IndexDetails
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.IndexDetails_Returns_RDBIndexSegmentsQuery;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_IndexDetails('IDX_TEST');
    Assert.Contains(LSql.ToUpper, 'RDB$INDEX_SEGMENTS');
    Assert.Contains(LSql.ToUpper, 'RDB$FIELD_NAME');
    Assert.Contains(LSql.ToUpper, 'RDB$FIELD_POSITION');
    Assert.Contains(LSql, 'IDX_TEST');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_AddFK
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.AddFK_Returns_AlterTableAddConstraint;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LFK: IioDBBuilderSchemaFK;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('ORDERS');
    LFK := CreateMockFK('FK_ORDERS_CUSTOMERS', 'ORDERS', 'CustomerID', 'CUSTOMERS', 'ID');
    LSql := LSqlGen.Test_BuildSQL_AddFK(LTable, LFK);
    Assert.Contains(LSql, 'ALTER TABLE');
    Assert.Contains(LSql, 'ADD CONSTRAINT');
    Assert.Contains(LSql, 'FOREIGN KEY');
    Assert.Contains(LSql, 'REFERENCES');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.AddFK_WithCascade_IncludesOnDeleteCascade;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LFK: IioDBBuilderSchemaFK;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('ORDERS');
    LFK := TioMockSchemaFK.Create('FK_TEST', 'ORDERS', 'CustomerID', 'CUSTOMERS', 'ID')
      .WithOnDeleteAction(fkCascade);
    LSql := LSqlGen.Test_BuildSQL_AddFK(LTable, LFK);
    Assert.Contains(LSql, 'ON DELETE CASCADE');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_DropFKbyName
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.DropFKbyName_Returns_DropConstraint;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_DropFKbyName('ORDERS', 'FK_TEST');
    Assert.Contains(LSql, 'ALTER TABLE');
    Assert.Contains(LSql, 'DROP CONSTRAINT');
    Assert.Contains(LSql, 'ORDERS');
    Assert.Contains(LSql, 'FK_TEST');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_FKList
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.FKList_NoTable_Returns_AllFKs;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_FKList('', '');
    Assert.Contains(LSql.ToUpper, 'RDB$RELATION_CONSTRAINTS');
    Assert.Contains(LSql.ToUpper, '''FOREIGN KEY''');
    Assert.DoesNotContain(LSql.ToUpper, 'RDB$RELATION_NAME =');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FKList_WithTable_FiltersbyTableName;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_FKList('ORDERS', '');
    Assert.Contains(LSql.ToUpper, 'RDB$RELATION_NAME');
    Assert.Contains(LSql.ToUpper, 'ORDERS');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FKList_WithFKName_FiltersByFKName;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_FKList('ORDERS', 'FK_TEST');
    Assert.Contains(LSql.ToUpper, 'RDB$CONSTRAINT_NAME');
    Assert.Contains(LSql.ToUpper, 'FK_TEST');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_FieldExists
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.FieldExists_Returns_RDBRelationFieldsQuery;
var
  LSqlGen: TTestSqlGenFirebird;
  LTable: IioDBBuilderSchemaTable;
  LField: IioDBBuilderSchemaField;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LTable := CreateMockTable('CUSTOMERS');
    LField := CreateMockField('Name', ioMdVarchar);
    LSql := LSqlGen.Test_BuildSQL_FieldExists(LTable, LField);
    Assert.Contains(LSql.ToUpper, 'RDB$RELATION_FIELDS');
    Assert.Contains(LSql.ToUpper, 'RDB$RELATION_NAME');
    Assert.Contains(LSql.ToUpper, 'RDB$FIELD_NAME');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: BuildSQL_FieldList
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.FieldList_Returns_ComplexJoinQuery;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_FieldList('CUSTOMERS', '');
    Assert.Contains(LSql.ToUpper, 'RDB$RELATION_FIELDS');
    Assert.Contains(LSql.ToUpper, 'RDB$FIELDS');
    Assert.Contains(LSql.ToUpper, 'JOIN');
    Assert.Contains(LSql.ToUpper, 'FIELD_TYPE');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.FieldList_WithFieldName_FiltersbyFieldName;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_FieldList('CUSTOMERS', 'Name');
    Assert.Contains(LSql.ToUpper, 'RDB$FIELD_NAME');
    Assert.Contains(LSql.ToUpper, 'NAME');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: Sequence operations
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.AddSequence_Returns_CreateSequence;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_AddSequence('GEN_CUSTOMERS_ID');
    Assert.Contains(LSql, 'CREATE SEQUENCE');
    Assert.Contains(LSql, 'GEN_CUSTOMERS_ID');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.DropSequence_Returns_DropSequence;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_DropSequence('GEN_CUSTOMERS_ID');
    Assert.Contains(LSql, 'DROP SEQUENCE');
    Assert.Contains(LSql, 'GEN_CUSTOMERS_ID');
  finally
    LSqlGen.Free;
  end;
end;

procedure TioTestSqlGeneratorFirebird.SequenceExists_Returns_GeneratorsQuery;
var
  LSqlGen: TTestSqlGenFirebird;
  LSql: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LSql := LSqlGen.Test_BuildSQL_SequenceExists('GEN_CUSTOMERS_ID');
    Assert.Contains(LSql.ToLower, 'rdb$generators');
    Assert.Contains(LSql.ToLower, 'rdb$generator_name');
    Assert.Contains(LSql, 'GEN_CUSTOMERS_ID');
  finally
    LSqlGen.Free;
  end;
end;

// ==========================================================================
// Test: Translate_SchemaIndex_To_CommaSepListOfFieldNames (Firebird override)
// ==========================================================================

procedure TioTestSqlGeneratorFirebird.IndexFieldList_RemovesAscDesc;
var
  LSqlGen: TTestSqlGenFirebird;
  LIndex: IioDBBuilderSchemaIndex;
  LResult: String;
begin
  LSqlGen := TTestSqlGenFirebird.Create;
  try
    LIndex := TioMockSchemaIndex.Create('IDX_TEST', 'Field1, Field2')
      .WithSqlCommaSepFieldList('[Field1], [Field2]')
      .WithOrientation(ioAscending);
    LResult := LSqlGen.Test_Translate_SchemaIndex_To_CommaSepListOfFieldNames(LIndex);
    // Firebird removes ASC/DESC from field list
    Assert.DoesNotContain(LResult, ' ASC');
    Assert.DoesNotContain(LResult, ' DESC');
  finally
    LSqlGen.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TioTestSqlGeneratorFirebird);

end.
