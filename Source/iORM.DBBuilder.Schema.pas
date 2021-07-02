unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, System.Classes, iORM.Context.Map.Interfaces;

type

  TioDBBuilderSchema = class(TInterfacedObject, IioDBBuilderSchema)
  private
    FConnectionDefName: String;
    FIndexesEnabled, FForeignKeysEnabled: Boolean;
    FSequences: TioDBBuilderSchemaSequences;
    FScript: TStrings;
    FStatus: TioDBBuilderStatus;
    FTables: TioDBBuilderSchemaTables;
    FWarnings: TStrings;
    // DBExists
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
  public
    constructor Create(const AConnectionDefName: String; const AIndexesEnabled, AForeignKeysEnabled: Boolean);
    destructor Destroy; override;
    function ConnectionDefName: String;
    function DatabaseFileName: String;
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function ForeignKeysEnabled: Boolean;
    function IndexesEnabled: Boolean;
    procedure SequenceAddIfNotExists(const ASequenceName: String);
    function Sequences: TioDBBuilderSchemaSequences;
    function Script: TStrings;
    function ScriptIsEmpty: Boolean;
    function Warnings: TStrings;
    function WarningExists: Boolean;
    function Tables: TioDBBuilderSchemaTables;

    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  iORM.DBBuilder.Factory, iORM.Exceptions, System.SysUtils, iORM.DB.ConnectionContainer, iORM.DB.Factory;

{ TioDBBuilderSchema }

function TioDBBuilderSchema.ConnectionDefName: String;
begin
  Result := FConnectionDefName;
end;

constructor TioDBBuilderSchema.Create(const AConnectionDefName: String; const AIndexesEnabled, AForeignKeysEnabled: Boolean);
begin
  FScript := TStringList.Create;
  FSequences := TioDBBuilderSchemaSequences.Create;
  FIndexesEnabled := AIndexesEnabled;
  FForeignKeysEnabled := AForeignKeysEnabled;
  FStatus := stClean;
  FConnectionDefName := TioDBFActory.ConnectionManager.GetCurrentConnectionNameIfEmpty(AConnectionDefName);
  FWarnings := TStringList.Create;
  FTables := TioDBBuilderSchemaTables.Create;
end;

function TioDBBuilderSchema.DatabaseFileName: String;
begin
  Result := TioConnectionManager.GetDatabaseFileName(FConnectionDefName);
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FWarnings.Free;
  FTables.Free;
  FSequences.Free;
  FScript.Free;
  inherited;
end;

function TioDBBuilderSchema.FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
var
  LTableName: String;
begin
  LTableName := AMap.GetTable.TableName;
  if not FTables.ContainsKey(LTableName) then
    FTables.Add(LTableName, TioDBBuilderFactory.NewSchemaTable(AMap.GetTable));
  Result := FTables.Items[LTableName];
  // NB: Se anche una sola classe mappata su questa tabella è TrueClass allora IsTrueClass deve essere true
  // (vedi setter nella classe)
  Result.IsTrueClass := AMap.GetTable.IsTrueClass;
end;

function TioDBBuilderSchema.FindTable(const ATableName: String): IioDBBuilderSchemaTable;
begin
  if not FTables.ContainsKey(ATableName) then
    raise EioException.Create(ClassName, 'FindTable', Format('Table "%s" not found on "%s" connection def.',
      [ATableName, FConnectionDefName]));
  Result := FTables.Items[ATableName];
end;

function TioDBBuilderSchema.ForeignKeysEnabled: Boolean;
begin
  Result := FForeignKeysEnabled;
end;

function TioDBBuilderSchema.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchema.IndexesEnabled: Boolean;
begin
  Result := FIndexesEnabled;
end;

procedure TioDBBuilderSchema.SequenceAddIfNotExists(const ASequenceName: String);
begin
  if ASequenceName.Trim.IsEmpty then
    raise EioException.Create(ClassName, 'SequenceAddIfNotExists', Format('Invalid sequence name "%s"', [ASequenceName]));
  if FSequences.IndexOf(ASequenceName) = -1 then
    FSequences.Add(ASequenceName);
end;

function TioDBBuilderSchema.Sequences: TioDBBuilderSchemaSequences;
begin
  Result := FSequences;
end;

procedure TioDBBuilderSchema.SetStatus(const AValue: TioDBBuilderStatus);
begin
  if AValue > FStatus then
    FStatus := AValue;
end;

function TioDBBuilderSchema.Script: TStrings;
begin
  Result := FScript;
end;

function TioDBBuilderSchema.ScriptIsEmpty: Boolean;
begin
  Result := FScript.Count = 0;
end;

function TioDBBuilderSchema.Tables: TioDBBuilderSchemaTables;
begin
  Result := FTables;
end;

function TioDBBuilderSchema.Warnings: TStrings;
begin
  Result := FWarnings;
end;

function TioDBBuilderSchema.WarningExists: Boolean;
begin
  Result := FWarnings.Count > 0;
end;

end.
