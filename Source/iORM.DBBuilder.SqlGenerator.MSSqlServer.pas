unit iORM.DBBuilder.SqlGenerator.MSSqlServer;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces, iORM.Attributes;

const
  CONNECTION_NAME_MSSQL_MASTER = 'MSSQL_MASTER';

  INVALID_FIELDTYPE_CONVERSIONS = '[datetime->decimal][datetime->numeric][datetime->int][date->decimal][date->numeric][date->int]' +
    '[time->numeric][time->decimal][time->int][varchar->decimal][varchar->int][varchar->date][varchar->time][varchar->datetime]' +
    '[nvarchar->decimal][nvarchar->int][nvarchar->date][nvarchar->time][nvarchar->datetime] [char->decimal][char->int][char->date]+' +
    '[char->time][char->datetime][nchar->decimal][nchar->int][nchar->date][nchar->time][nchar->datetime]';

type

  TioDBBuilderSqlGenFirebird = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGenerator)
  private
    function TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
    function TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
  protected
    procedure InitializeScript; override;
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
    procedure CreateField(const AField: IioDBBuilderSchemaField; AComma: Char);
    procedure CreateClassInfoField(AComma: Char);
    procedure AddField(const AField: IioDBBuilderSchemaField; AComma: Char);
    procedure AlterField(const AField: IioDBBuilderSchemaField; AComma: Char);
    // PrimaryKey & other indexes
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
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
  iORM, iORM.Context.Properties.Interfaces, System.SysUtils, System.StrUtils, iORM.DB.Interfaces, iORM.CommonTypes;

{ TioDBBuilderSqlGenFirebird }

procedure TioDBBuilderSqlGenFirebird.AddField(const AField: IioDBBuilderSchemaField; AComma: Char);
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

procedure TioDBBuilderSqlGenFirebird.AlterField(const AField: IioDBBuilderSchemaField; AComma: Char);
begin

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

procedure TioDBBuilderSqlGenFirebird.CreateClassInfoField(AComma: Char);
begin
  ScriptAdd(Format('%s[%s] [VARCHAR] (%s) NULL', [AComma, IO_CLASSFROMFIELD_FIELDNAME, IO_CLASSFROMFIELD_FIELDLENGTH]));
end;

procedure TioDBBuilderSqlGenFirebird.CreateDatabase;
begin
  ExecuteQuery(CONNECTION_NAME_MSSQL_MASTER, Format('CREATE DATABASE [%s]', [FSchema.DatabaseFileName]));
end;

procedure TioDBBuilderSqlGenFirebird.CreateField(const AField: IioDBBuilderSchemaField; AComma: Char);
begin
  ScriptAdd(Format('%s%s', [AComma, InternalCreateField(AField)]));
end;

function TioDBBuilderSqlGenFirebird.DatabaseExists: boolean;
var
  LDefaultConnectionDef: IIoConnectionDef;
  LQuery: IioQuery;
begin
  LDefaultConnectionDef := io.Connections.GetDefaultConnectionDef;
  // Create a new connection in database master
  io.Connections.NewSQLServerConnectionDef(LDefaultConnectionDef.AsString['Server'], 'master', LDefaultConnectionDef.Params.UserName,
    LDefaultConnectionDef.Params.Password, False, False, False, CONNECTION_NAME_MSSQL_MASTER);
  // Create the query to retrieve if DB exists
  LQuery := OpenQuery(CONNECTION_NAME_MSSQL_MASTER, Format('select db_id(%s)', [FSchema.DatabaseFileName]));
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
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

function TioDBBuilderSqlGenFirebird.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('exec sp_columns ''%s''', [ATable.TableName]));
  while not LQuery.Eof do
  begin
    if LQuery.Fields.FieldByName('column_name').AsString.ToLower = AField.FieldName.ToLower then
      Exit(True);
    LQuery.Next;
  end;
  Result := False;
end;

function TioDBBuilderSqlGenFirebird.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField)
  : boolean;
var
  LQuery: IioQuery;

  LNewFieldName: string;
  LNewFieldType: string;
  LNewFieldLength: Smallint;
  LNewFieldPrecision: Smallint;
  LNewFieldDecimals: Smallint;

  LOldFieldName: string;
  LOldFieldType: string;
  LOldFieldLength: Smallint;
  LOldFieldDecimals: Smallint;
  LOldFieldNotNull: boolean;
begin
  Result := False;
  LQuery := OpenQuery(Format('exec sp_columns ''%s''', [ATable.TableName]));
  while not LQuery.Eof do
  begin
    LOldFieldName := LQuery.Fields.FieldByName('column_name').AsString;
    LNewFieldName := AField.FieldName;
    // Find the field
    if SameText(LOldFieldName, LNewFieldName) then
    begin
      // Load some new field informations
      LNewFieldType := TranslateFieldTypeForModified(AField);
      LNewFieldLength := AField.GetContextProperty.GetMetadata_FieldLength;
      LNewFieldPrecision := AField.GetContextProperty.GetMetadata_FieldPrecision;
      LNewFieldDecimals := AField.GetContextProperty.GetMetadata_FieldScale;

      // Load some old field informations
      LOldFieldType := LQuery.Fields.FieldByName('type_name').AsString.Replace('identity', '', [rfReplaceAll]).Trim;
      LOldFieldDecimals := LQuery.Fields.FieldByName('scale').AsInteger;
      LOldFieldNotNull := LQuery.Fields.FieldByName('nullable').AsInteger = 0;
      if 'decimal,numeric,varchar,nvarchar,char,nchar'.Contains(LOldFieldType.ToLower) then
        LOldFieldLength := LQuery.Fields.FieldByName('Precision').AsInteger
      else
        LOldFieldLength := LQuery.Fields.FieldByName('Length').AsInteger;

      // Verify if fieldType has been changed and check type affinity
      Result := Result or IsFieldTypeChanged(LOldFieldType, LNewFieldType, AField, ATable, INVALID_FIELDTYPE_CONVERSIONS);

      // Verify if FieldLength is changed
      if 'varchar,nvarchar,char,nchar'.Contains(LOldFieldType.ToLower) then
        Result := Result or IsFieldLengthChanged(LOldFieldLength, LNewFieldLength, AField, ATable);

      if 'decimal,numeric'.Contains(LOldFieldType.ToLower) then
      begin
        // Verify if something has been changed in FieldPrecision
        Result := Result or IsFieldPrecisionChanged(LOldFieldLength, LNewFieldPrecision, AField, ATable);
        // Verify if something has been changed in FieldDecimals (scale)
        Result := Result or IsFieldDecimalsChanged(LOldFieldDecimals, LNewFieldDecimals, AField, ATable);
      end;

      // Verify if DEFAULT setting of the field is changed
      // NOTE: I have not found a way to retrieve the current DEFAULT
      // so it is not possible to verify if it has changed.

      // Verify if NotNull is changed
      Result := Result or IsFieldNotNullChanged(LOldFieldNotNull, AField.NotNull, AField, ATable, True);

      // Exit
      Exit;
    end;
    LQuery.Next;
  end;
end;

procedure TioDBBuilderSqlGenFirebird.InitializeScript;
begin
  inherited;
  ScriptAddSeparator;
  ScriptAdd('GO');
  ScriptAdd(Format('USE [%s]', [FSchema.DatabaseFileName]));
  ScriptAddSeparator;
end;

function TioDBBuilderSqlGenFirebird.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // If primary key...
  if AField.PrimaryKey then
    Exit(Format('%s [INT] IDENTITY(1,1) NOT NULL', [AField.FieldName]));
  // ...then continue
  LDefault := ExtractFieldDefaultValue(AField);
  LNotNull := IfThen(AField.NotNull, 'NOT NULL', 'NULL');
  Result := Format('%s [%s] %s %s', [AField.FieldName, TranslateFieldTypeForCreate(AField), LDefault, LNotNull]).Trim;
end;

function TioDBBuilderSqlGenFirebird.TableExists(const ATable: IioDBBuilderSchemaTable): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('select object_id(%s)', [ATable.TableName]));
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
begin
  Result := TranslateFieldTypeForModified(AField);
  case AField.GetContextProperty.GetMetadata_FieldType of
    ioMdVarchar, ioMdChar:
      Result := Format('%s(%d)', [Result, AField.GetContextProperty.GetMetadata_FieldLength]);
    ioMdDecimal, ioMdNumeric:
      Result := Format('%s(%d,%d)', [Result, AField.GetContextProperty.GetMetadata_FieldPrecision,
        AField.GetContextProperty.GetMetadata_FieldScale]);
  end;
end;

function TioDBBuilderSqlGenFirebird.TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.GetContextProperty.GetMetadata_FieldType of
    ioMdVarchar:
      if AField.GetContextProperty.GetMetadata_FieldUnicode then
        Result := 'VARCHAR'
      else
        Result := 'NVARCHAR';
    ioMdChar:
      if AField.GetContextProperty.GetMetadata_FieldUnicode then
        Result := 'CHAR'
      else
        Result := 'NCHAR';
    ioMdInteger:
      Result := 'INT';
    ioMdFloat:
      Result := 'FLOAT';
    ioMdDate:
      Result := 'DATE';
    ioMdTime:
      Result := 'TIME';
    ioMdDateTime:
      Result := 'DATETIME';
    ioMdDecimal:
      Result := 'DECIMAL';
    ioMdNumeric:
      Result := 'NUMERIC';
    ioMdBoolean:
      Result := 'BIT';
    ioMdBinary: // ##### Sentire con Marco, per me bisogna rivedere anche qui il discorso subtype (già modificato il Firebird e SQLite)
      begin
        if AField.GetContextProperty.GetMetadata_FieldSubType.IsEmpty then
        begin
          if AField.GetContextProperty.GetMetadata_FieldUnicode then
            Result := 'BINARY'
          else
            Result := 'NBINARY';
        end
        else
          Result := AField.GetContextProperty.GetMetadata_FieldSubType;
      end;
    ioMdCustomFieldType:
      Result := AField.GetContextProperty.GetMetadata_CustomFieldType;
  end;
end;

end.
