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
  SqlGenerator.BeginAlterTable(ATable);
  CreateFields(ATable);
  SqlGenerator.EndAlterTable(ATable);
end;

procedure TioDBBuilderStrategyWithAlter.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  SqlGenerator.BeginCreateTable(ATable);
  CreateFields(ATable);
  SqlGenerator.EndCreateTable(ATable);
end;

procedure TioDBBuilderStrategyWithAlter.GenerateScript;
begin
  inherited;
  SqlGenerator.ScriptBegin;
  DropForeignKeys;
  DropIndexes;
  CreateOrAlterTables;
  CreateIndexes;
  CreateForeignKeys;
  SqlGenerator.ScriptEnd;;
end;

end.
