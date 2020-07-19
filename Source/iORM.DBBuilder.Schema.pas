unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, System.Classes, iORM.Context.Map.Interfaces;

type

  TioDBBuilderSchema = class(TInterfacedObject, IioDBBuilderSchema)
  private
    FConnectionDefName: String;
    FErrorMsg: String;
    FDBExists: Boolean;
    FSqlScript: TStringList;
    FWarnings: TStringList;
    FTables: TioDBBuilderSchemaTables;
    // DBExists
    function GetDBExists: Boolean;
    procedure SetDBExists(const Value: Boolean);
  public
    constructor Create(const AConnectionDefName: String);
    destructor Destroy; override;
    function ConnectionDefName: String;
    function DatabaseFileName: String;
    function ErrorMsg: String;
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function SqlScript: TStringList;
    function SqlScriptEmpty: Boolean;
    function Warnings: TStringList;
    function WarningsEmpty: Boolean;
    function Tables: TioDBBuilderSchemaTables;

    property DBExists: Boolean read GetDBExists write SetDBExists;
  end;

implementation

uses
  iORM.DBBuilder.Factory, iORM.Exceptions, System.SysUtils, iORM.DB.ConnectionContainer;

{ TioDBBuilderSchema }

function TioDBBuilderSchema.ConnectionDefName: String;
begin
  Result := FConnectionDefName;
end;

constructor TioDBBuilderSchema.Create(const AConnectionDefName: String);
begin
  FConnectionDefName := AConnectionDefName;
  FSqlScript := TStringList.Create;
  FWarnings := TStringList.Create;
  FTables := TioDBBuilderSchemaTables.Create;
end;

function TioDBBuilderSchema.DatabaseFileName: String;
begin
  Result := TioConnectionManager.GetDatabaseFileName(FConnectionDefName);
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FSqlScript.Free;
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

function TioDBBuilderSchema.GetDBExists: Boolean;
begin
  Result := FDBExists;
end;

procedure TioDBBuilderSchema.SetDBExists(const Value: Boolean);
begin
  FDBExists := Value;
end;

function TioDBBuilderSchema.SqlScript: TStringList;
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

function TioDBBuilderSchema.Warnings: TStringList;
begin
  Result := FWarnings;
end;

function TioDBBuilderSchema.WarningsEmpty: Boolean;
begin
  Result := FWarnings.Count = 0;
end;

end.
