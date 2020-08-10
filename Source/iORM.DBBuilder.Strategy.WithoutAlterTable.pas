unit iORM.DBBuilder.Strategy.WithoutAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Strategy.Base;

type

  TioDBBuilderStrategyWithoutAlter = class(TioDBBuilderStrategyBase)
  protected
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
  public
    procedure GenerateScript; override;
  end;

implementation

{ TioDBBuilderStrategyWithoutAlter }

procedure TioDBBuilderStrategyWithoutAlter.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;
  SqlGenerator.BeginAlterTable(ATable);
  CreateFields(ATable);
  if Schema.ForeignKeysEnabled then
    CreateForeignKeys(ATable);
  SqlGenerator.EndAlterTable(ATable);
end;

procedure TioDBBuilderStrategyWithoutAlter.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;
  SqlGenerator.BeginCreateTable(ATable);
  CreateFields(ATable);
  if Schema.ForeignKeysEnabled then
    CreateForeignKeys(ATable);
  SqlGenerator.EndCreateTable(ATable);
end;

procedure TioDBBuilderStrategyWithoutAlter.GenerateScript;
begin
  inherited;
  SqlGenerator.ScriptBegin;
  DropIndexes;
  CreateOrAlterTables;
  if Schema.IndexesEnabled then
    CreateIndexes;
  SqlGenerator.ScriptEnd;;
end;

end.
