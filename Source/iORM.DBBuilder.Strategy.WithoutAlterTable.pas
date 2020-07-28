unit iORM.DBBuilder.Strategy.WithoutAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderStrategyWithoutAlter = class(TInterfacedObject, IioDBBuilderStrategy)
  private
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
  protected
    procedure AddAllIndexes;
    procedure AddAllForeignKeys;
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable);
    procedure CreateFields(const ATable: IioDBBuilderSchemaTable);
    procedure CreateForeignKeys(const ATable: IioDBBuilderSchemaTable);
    procedure CreateOrAlterTables;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable);
  public
    constructor Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
    procedure GenerateScript;
  end;

implementation

uses
  System.SysUtils, iORM.Attributes;

{ TioDBBuilderStrategyWithoutAlter }

procedure TioDBBuilderStrategyWithoutAlter.AddAllForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
  LForeignKey: IioDBBuilderSchemaFK;
begin
  FSqlGenerator.ScriptAddTitle('Adding all foreign keys');
  for LTable in FSchema.Tables.Values do
    for LForeignKey in LTable.ForeignKeys.Values do
      FSqlGenerator.AddForeignKey(LForeignKey);
end;

procedure TioDBBuilderStrategyWithoutAlter.AddAllIndexes;
var
  LTable: IioDBBuilderSchemaTable;
  LIndex: ioIndex;
begin
  FSqlGenerator.ScriptAddTitle('Adding all indexes');
  for LTable in FSchema.Tables.Values do
    for LIndex in LTable.Indexes do
      FSqlGenerator.AddIndex(LTable, LIndex);
end;

procedure TioDBBuilderStrategyWithoutAlter.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  FSqlGenerator.ScriptAddTitle(Format('Altering table ''%s''', [ATable.TableName]));
  FSqlGenerator.BeginAlterTable(ATable);
  CreateFields(ATable);
  CreateForeignKeys(ATable);
  FSqlGenerator.EndAlterTable(ATable);
end;

constructor TioDBBuilderStrategyWithoutAlter.Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
end;

procedure TioDBBuilderStrategyWithoutAlter.CreateFields(const ATable: IioDBBuilderSchemaTable);
var
  LComma: Char;
  LField: IioDBBuilderSchemaField;
begin
  LComma := #0;
  for LField in ATable.Fields.Values do
  begin
    FSqlGenerator.CreateField(LField, LComma);
    LComma := ',';
  end;
  if ATable.IsClassFromField then
    FSqlGenerator.CreateClassInfoField(LComma);
end;

procedure TioDBBuilderStrategyWithoutAlter.CreateForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  for LForeignKey in ATable.ForeignKeys.Values do
    FSqlGenerator.AddForeignKey(LForeignKey);
end;

procedure TioDBBuilderStrategyWithoutAlter.CreateOrAlterTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in FSchema.Tables.Values do
  begin
    case LTable.Status of
      dbsCreate:
        CreateTable(LTable);
      dbsALter:
        AlterTable(LTable);
    end;
  end;
end;

procedure TioDBBuilderStrategyWithoutAlter.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  FSqlGenerator.ScriptAddTitle(Format('Creating table ''%s''', [ATable.TableName]));
  FSqlGenerator.BeginCreateTable(ATable);
  CreateFields(ATable);
  CreateForeignKeys(ATable);
  FSqlGenerator.EndCreateTable(ATable);
end;

procedure TioDBBuilderStrategyWithoutAlter.GenerateScript;
begin
  FSqlGenerator.ScriptBegin;
  // Drop all foreing keys & indexes
  FSqlGenerator.ScriptAddTitle('Dropping all foreign keys');
  FSqlGenerator.DropAllForeignKeys;
  FSqlGenerator.ScriptAddTitle('Dropping all indexes');
  FSqlGenerator.DropAllIndexes;
  // Create or alter tables
  CreateOrAlterTables;
  // Add all indexes & foreign keys
  AddAllIndexes;
  AddAllForeignKeys;
  FSqlGenerator.ScriptEnd;;
end;

end.
