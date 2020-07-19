unit iORM.DBBuilder.SqlGenerator.Base;

interface

uses
  System.Classes, iORM.DBBuilder.Interfaces, iORM.DB.Interfaces;

const
  SCRIPT_SEPARATOR_LENGTH = 40;
  SCRIPT_INDENTATION_WIDTH = 2;

type

  TioDBBuilderSqlGenBase = class(TInterfacedObject)
  private
    FFSchema: IioDBBuilderSchema;
    FIndentationLevel: Byte;
  protected
    function FSchema: IioDBBuilderSchema;

    function NewQuery: IioQuery;
    function OpenQuery(const ASQL: String): IioQuery;
    procedure ExecuteQuery(const ASQL: String);

    procedure DecIndentationLevel;
    procedure IncIndentationLevel;
    function GetIndentation: String;

    procedure ScriptAdd(const AText: String); virtual;
    procedure ScriptAddComment(const AText: String); virtual;
    procedure ScriptAddEmpty; virtual;
    procedure ScriptAddSeparator; virtual;
    procedure ScriptAddTitle(const AText: String); virtual;
    procedure ScriptAddWarning(const AText: String); virtual;

    procedure AddWarning(const AText: String); virtual;

    procedure InitializeScript(const AInitialization: TStrings); virtual;
    procedure FinalizeScript(const AFinalization: TStrings); virtual;

    procedure CheckTypeAffinity(const AOldFieldType, ANewFieldType, ANewFieldName, ANewTableName, AInvalidTypeConversions: string); virtual;
    procedure CheckIfNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
      const ATable: IioDBBuilderSchemaTable); virtual;
  public
    constructor Create(const ASchema: IioDBBuilderSchema);

    procedure DoInitializeScript; virtual;
    procedure DoFinalizeScript; virtual;

  end;

implementation

uses
  iORM.DB.Factory, iORM.DB.ConnectionContainer, System.SysUtils, System.StrUtils;

{ TioDBBuilderSqlGenBase }

procedure TioDBBuilderSqlGenBase.ScriptAddComment(const AText: String);
begin
  FSchema.SqlScript.Add('-- ' + AText);
end;

procedure TioDBBuilderSqlGenBase.ScriptAddEmpty;
begin
  FSchema.SqlScript.Add('');
end;

procedure TioDBBuilderSqlGenBase.ScriptAddSeparator;
begin
  FSchema.SqlScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
end;

procedure TioDBBuilderSqlGenBase.ScriptAddTitle(const AText: String);
begin
  ScriptAddEmpty;
  ScriptAddSeparator;
  FSchema.SqlScript.Add(AText);
  ScriptAddSeparator;
end;

procedure TioDBBuilderSqlGenBase.ScriptAddWarning(const AText: String);
begin
  FSchema.SqlScript.Add('-- Warning: ' + AText);
end;

procedure TioDBBuilderSqlGenBase.AddWarning(const AText: String);
begin
  FSchema.Warnings.Add(GetIndentation + AText);
end;

procedure TioDBBuilderSqlGenBase.CheckIfNullBecomesNotNull(const AOldFieldNotNull: Boolean; const AField: IioDBBuilderSchemaField;
  const ATable: IioDBBuilderSchemaTable);
begin
  if AField.NotNull and (not AOldFieldNotNull) and (not AField.PrimaryKey) then
    AddWarning
      (Format('The "NotNull" flag changes from false to true and a default value has not been specified (field ''%s'', table ''%s'')',
      [AField.FieldName, ATable.TableName]));
end;

procedure TioDBBuilderSqlGenBase.CheckTypeAffinity(const AOldFieldType, ANewFieldType, ANewFieldName, ANewTableName, AInvalidTypeConversions: string);
var
  LRequiredConversion: String;
begin
  LRequiredConversion := Format('[%s->%s]', [AOldFieldType, ANewFieldType]);
  if ContainsText(AInvalidTypeConversions, LRequiredConversion) then
    AddWarning(Format('Invalid conversion ''%s'' to ''%s'' (field ''%s'', table ''%s'')', [AOldFieldType, ANewFieldType, ANewFieldName,
      ANewTableName]));
end;

constructor TioDBBuilderSqlGenBase.Create(const ASchema: IioDBBuilderSchema);
begin
  FFSchema := ASchema;
  FIndentationLevel := 0;
end;

function TioDBBuilderSqlGenBase.NewQuery: IioQuery;
begin
  Result := TioDbFactory.Query(FSchema.ConnectionDefName);
end;

function TioDBBuilderSqlGenBase.OpenQuery(const ASQL: String): IioQuery;
begin
  Result := NewQuery;
  Result.SQL.Text := ASQL;
  Result.Open;
end;

procedure TioDBBuilderSqlGenBase.ScriptAdd(const AText: String);
begin
  FSchema.SqlScript.Add(GetIndentation + AText);
end;

procedure TioDBBuilderSqlGenBase.DecIndentationLevel;
begin
  Dec(FIndentationLevel, SCRIPT_INDENTATION_WIDTH);
end;

procedure TioDBBuilderSqlGenBase.DoFinalizeScript;
var
  LFinalization: TStrings;
begin
  LFinalization := TStringList.Create;
  try
    FinalizeScript(LFinalization);
    FSchema.SqlScript.AddStrings(LFinalization);
  finally
    LFinalization.Free;
  end;
end;

procedure TioDBBuilderSqlGenBase.DoInitializeScript;
var
  LInitialization: TStrings;
  I: Integer;
begin
  LInitialization := TStringList.Create;
  try
    InitializeScript(LInitialization);
    for I := LInitialization.Count - 1 downto 0 do
      FSchema.SqlScript.Insert(0, LInitialization[I]);
  finally
    LInitialization.Free;
  end;
end;

procedure TioDBBuilderSqlGenBase.ExecuteQuery(const ASQL: String);
var
  LQuery: IioQuery;
begin
  LQuery := NewQuery;
  LQuery.SQL.Text := ASQL;
  LQuery.ExecSQL;
end;

procedure TioDBBuilderSqlGenBase.FinalizeScript(const AFinalization: TStrings);
begin
  ScriptAddEmpty;
  ScriptAddSeparator;
  ScriptAddComment('End of the script generated by iORM');
  ScriptAddSeparator;
end;

function TioDBBuilderSqlGenBase.FSchema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

function TioDBBuilderSqlGenBase.GetIndentation: String;
begin
  Result := StringOfChar(' ', FIndentationLevel * SCRIPT_INDENTATION_WIDTH);
end;

procedure TioDBBuilderSqlGenBase.IncIndentationLevel;
begin
  Inc(FIndentationLevel, SCRIPT_INDENTATION_WIDTH);
end;

procedure TioDBBuilderSqlGenBase.InitializeScript(const AInitialization: TStrings);
begin
  ScriptAddSeparator;
  ScriptAddComment('Start of the script generated by iORM');
  ScriptAddSeparator;
  ScriptAddComment('Date - time....: ' + FormatDateTime('d mmm yyyy - hh:nn:ss', Now));
  ScriptAddComment('Connection name: ' + FSchema.ConnectionDefName);
  ScriptAddComment('Database file..: ' + FSchema.DatabaseFileName);
  ScriptAddComment('DBMS...........: ' + TioConnectionManager.GetConnectionDefByName(FSchema.ConnectionDefName).Params.DriverID);
  ScriptAddSeparator;
end;

end.
