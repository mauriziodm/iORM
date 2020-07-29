unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, System.Classes, iORM.Context.Map.Interfaces;

type

  TioDBBuilderSchema = class(TInterfacedObject, IioDBBuilderSchema)
  private
    FConnectionDefName: String;
    FIndexesEnabled, FForeignKeysEnabled: Boolean;
    FErrorMsg: String;
    FStatus: TioDBBuilderStatus;
    FSqlScript: TStrings;
    FWarnings: TStrings;
    FTables: TioDBBuilderSchemaTables;
    // DBExists
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
  public
    constructor Create(const ASqlScriptToFill: TStrings; const AConnectionDefName: String;
      const AIndexesEnabled, AForeignKeysEnabled: Boolean);
    destructor Destroy; override;
    function ConnectionDefName: String;
    function DatabaseFileName: String;
    function ErrorMsg: String;
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function ForeignKeysEnabled: Boolean;
    function IndexesEnabled: Boolean;
    function SqlScript: TStrings;
    function SqlScriptEmpty: Boolean;
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

constructor TioDBBuilderSchema.Create(const ASqlScriptToFill: TStrings; const AConnectionDefName: String;
  const AIndexesEnabled, AForeignKeysEnabled: Boolean);
begin
  FSqlScript := ASqlScriptToFill;
  FIndexesEnabled := AIndexesEnabled;
  FForeignKeysEnabled := AForeignKeysEnabled;
  FStatus := dbsClean;
  FConnectionDefName := TioDBFActory.ConnectionManager.GetDefaultConnectionNameIfEmpty(AConnectionDefName);
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
  inherited;
end;

function TioDBBuilderSchema.ErrorMsg: String;
begin
  Result := FErrorMsg;
end;

function TioDBBuilderSchema.FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
var
  LTableName: String;
begin
  LTableName := AMap.GetTable.TableName;
  if not FTables.ContainsKey(LTableName) then
    FTables.Add(LTableName, TioDBBuilderFactory.NewSchemaTable(AMap.GetTable));
  Result := FTables.Items[LTableName];
  // NB: Se anche una sola classe mappata su questa tabella è ClassFromField allora IsClassFromField deve essere true
  // (vedi setter nella classe)
  Result.IsClassFromField := AMap.GetTable.IsClassFromField;
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

procedure TioDBBuilderSchema.SetStatus(const AValue: TioDBBuilderStatus);
begin
  FStatus := AValue;
end;

function TioDBBuilderSchema.SqlScript: TStrings;
begin
  Result := FSqlScript;
end;

function TioDBBuilderSchema.SqlScriptEmpty: Boolean;
begin
  Result := FSqlScript.Count = 0;
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
