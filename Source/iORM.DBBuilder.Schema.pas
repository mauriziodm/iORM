unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, System.Classes, iORM.Context.Map.Interfaces;

type

  TioDBBuilderSchema = class(TInterfacedObject, IioDBBuilderSchema)
  private
    FConnectionDefName: String;
    FErrorList: TStringList;
    FSqlScript: TStringList;
    FTableList: TioDBBuilderSchemaTableList;
  public
    constructor Create(const AConnectionDefName: String);
    destructor Destroy; override;
    function ConnectionDefName: String;
    function ErrorList: TStringList;
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function SqlScript: TStringList;
    function TableList: TioDBBuilderSchemaTableList;
  end;

implementation

uses
  iORM.DBBuilder.Factory, iORM.Exceptions, System.SysUtils;

{ TioDBBuilderSchema }

function TioDBBuilderSchema.ConnectionDefName: String;
begin
  Result := FConnectionDefName;
end;

constructor TioDBBuilderSchema.Create(const AConnectionDefName: String);
begin
  FConnectionDefName := AConnectionDefName;
  FErrorList := TStringList.Create;
  FSqlScript := TStringList.Create;
  FTableList := TioDBBuilderSchemaTableList.Create;
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FSqlScript.Free;
  FErrorList.Free;
  FTableList.Free;
  inherited;
end;

function TioDBBuilderSchema.ErrorList: TStringList;
begin
  Result := FErrorList;
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

function TioDBBuilderSchema.SqlScript: TStringList;
begin
  Result := FSqlScript;
end;

function TioDBBuilderSchema.TableList: TioDBBuilderSchemaTableList;
begin
  Result := FTableList;
end;

end.
