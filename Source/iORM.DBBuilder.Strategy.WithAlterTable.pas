unit iORM.DBBuilder.Strategy.WithAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Strategy.Base;

type

  TioDBBuilderStrategyWithAlter = class(TioDBBuilderStrategyBase)
  protected
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
  public
    procedure GenerateScript; override;
  end;

implementation

{ TioDBBuilderStrategyWithAlter }

procedure TioDBBuilderStrategyWithAlter.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;
  SqlGenerator.BeginAlterTable(ATable);
  AddOrAlterFields(ATable);
  SqlGenerator.EndAlterTable(ATable);
end;

procedure TioDBBuilderStrategyWithAlter.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;
  SqlGenerator.BeginCreateTable(ATable);
  CreateFields(ATable);
  SqlGenerator.EndCreateTable(ATable);
  SqlGenerator.ScriptAddEmpty;
  SqlGenerator.AddPrimaryKey(ATable);
end;

procedure TioDBBuilderStrategyWithAlter.GenerateScript;
begin
  inherited;
  SqlGenerator.ScriptBegin;
  DropForeignKeys;
  DropIndexes;
  CreateOrAlterTables;
  CreateSequences;
  if Schema.IndexesEnabled then
    CreateIndexes;
  if Schema.ForeignKeysEnabled then
    CreateForeignKeys;
  SqlGenerator.ScriptEnd;;
end;

end.
