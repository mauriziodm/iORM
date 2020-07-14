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
    FTableList: TioDBBuilderSchemaTableList;
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
    function TableList: TioDBBuilderSchemaTableList;

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
  FTableList := TioDBBuilderSchemaTableList.Create;
end;

function TioDBBuilderSchema.DatabaseFileName: String;
begin
  Result := TioConnectionManager.GetDatabaseFileName(FConnectionDefName);
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FSqlScript.Free;
  FTableList.Free;
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
  if not FTableList.ContainsKey(LTableName) then
    FTableList.Add(LTableName, TioDBBuilderFactory.NewSchemaTable(AMap.GetTable));
  Result := FTableList.Items[LTableName];
  // NB: Se anche una sola classe mappata su questa tabella è ClassFromField allora IsClassFromField deve essere true
  // (vedi setter nella classe)
  Result.IsClassFromField := AMap.GetTable.IsClassFromField;
end;

function TioDBBuilderSchema.FindTable(const ATableName: String): IioDBBuilderSchemaTable;
begin
  if not FTableList.ContainsKey(ATableName) then
    raise EioException.Create(ClassName, 'FindTable', Format('Table "%s" not found on "%s" connection def.',
      [ATableName, FConnectionDefName]));
  Result := FTableList.Items[ATableName];
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

function TioDBBuilderSchema.TableList: TioDBBuilderSchemaTableList;
begin
  Result := FTableList;
end;

end.
