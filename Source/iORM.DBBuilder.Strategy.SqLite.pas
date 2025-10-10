unit iORM.DBBuilder.Strategy.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.WithoutAlterTable

  ;


type
  TioDBBuilderStrategySqLite = class(TioDBBuilderStrategyWithoutAlter)
  private
    procedure DropAllIndexes(const AScript: IioDBBuilderSqlScript);
  protected
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

    procedure CreateDatabase; override;
    function DatabaseExists: Boolean; override;
    procedure DropIndexes(const AScript: IioDBBuilderSqlScript); override;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); override;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; override;
  public
//    procedure GenerateCreateOrAlterScript(const AScript: IioDBBuilderSqlScript); override;
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

procedure TioDBBuilderStrategySqLite.CreateDatabase;
begin
  TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, 'SELECT 1=1');
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
    AScript.Add(Format('DROP INDEX %s;', [LQuery.Fields.FieldByName('name').AsString]));
    LQuery.Next;
  end;

  // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
  if Schema.Status = stAlter then
    RenameAllTablesToOld(AScript);
end;

procedure TioDBBuilderStrategySqLite.DropIndexes(const AScript: IioDBBuilderSqlScript);
begin
  inherited;

  DropAllIndexes(AScript);
end;

function TioDBBuilderStrategySqLite.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, Format('pragma table_info(''%s'')', [ATable.TableName]));

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
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, Format('pragma table_info(''%s'')', [ATable.TableName]));

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
  AScript.AddEmpty;
  AScript.AddComment('Before we start...');
  AScript.Add('PRAGMA defer_foreign_keys=off;');

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

    if Schema.Status = tioDBBuilderStatus.stAlter then
      CopyDataFromOldToNewTables(AScript);
  end;

  AScript.AddEmpty;
  AScript.AddComment('At the end...');
  AScript.Add('PRAGMA defer_foreign_keys=on;');
  AScript.AddEmpty;
end;

//procedure TioDBBuilderStrategySqLite.GenerateCreateOrAlterScript(const AScript: IioDBBuilderSqlScript);
//begin
//  AScript.ScriptBegin(ConnectionDefName, TioConnectionManager.GetConnectionDefByName(ConnectionDefName).Params.DriverID);
//
//  AScript.AddEmpty;
//  AScript.AddComment('Before we start...');
//  AScript.Add('PRAGMA defer_foreign_keys=off;');
//
//  if Schema.WarningExists then
//    AScript.AddWarnings(Schema.Warnings);
//
//  DropIndexes(AScript);
//  CreateOrAlterTables(AScript);
//
//  if Schema.IndexesEnabled then
//    CreateIndexes(AScript);
//
//  if Schema.Status = tioDBBuilderStatus.stAlter then
//    CopyDataFromOldToNewTables(AScript);
//
//  AScript.AddEmpty;
//  AScript.AddComment('At the end...');
//  AScript.Add('PRAGMA defer_foreign_keys=on;');
//  AScript.AddEmpty;
//
//  AScript.ScriptEnd;
//end;

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

function TioDBBuilderStrategySqLite.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioDBBuilderQueryEngine.OpenQuery(ConnectionDefName, SqlGenerator.BuildTableExistsSql(ATable.TableName));
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

procedure TioDBBuilderStrategySqLite.WarningNotNullCannotBeChanged(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull <> AOldFieldNotNull then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The not null setting cannot be changed automatically',
      [ATable.TableName, AField.FieldName]));
end;

procedure TioDBBuilderStrategySqLite.WarningNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if AField.FieldNotNull and (not AOldFieldNotNull) and (not AField.FieldDefaultExists) then
    Schema.Warnings.Add
      (Format('Table ''%s'' field ''%s'' --> The not null setting is changed from false to true and a default value has not been specified',
      [ATable.TableName, AField.FieldName]));
end;

procedure TioDBBuilderStrategySqLite.WarningTypeAffinity(const AOldFieldType, ANewFieldType: String; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable;
  const AInvalidTypeConversions: string);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);

  if ContainsText(AInvalidTypeConversions, LRequiredConversion) then
    Schema.Warnings.Add(Format('Table ''%s'' field ''%s'' --> Invalid conversion from ''%s'' to ''%s''', [ATable.TableName, AField.FieldName,
      AOldFieldType, ANewFieldType]));
end;

end.
