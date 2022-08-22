unit iORM.DBBuilder.Strategy.Base;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderStrategyBase = class(TInterfacedObject, IioDBBuilderStrategy)
  private
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
  protected
    procedure AddOrAlterFields(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateFields(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure CreateForeignKeys; overload; virtual;
    procedure CreateForeignKeys(const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure CreateIndexes; overload; virtual;
    procedure CreateIndexes(const ATable: IioDBBuilderSchemaTable); overload; virtual;
    procedure CreateOrAlterTables; virtual;
    procedure CreateSequences; virtual;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); virtual;
    procedure DropForeignKeys; virtual;
    procedure DropIndexes; virtual;
    function Schema: IioDBBuilderSchema;
    function SqlGenerator: IioDBBuilderSqlGenerator;
  public
    constructor Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
    procedure GenerateScript; virtual; abstract;
  end;

implementation

uses
  System.SysUtils, iORM.Attributes, System.Classes;

{ TioDBBuilderStrategyBase }

procedure TioDBBuilderStrategyBase.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  SqlGenerator.ScriptAddTitle(Format('Altering table ''%s''', [ATable.TableName]));
end;

constructor TioDBBuilderStrategyBase.Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
end;

procedure TioDBBuilderStrategyBase.CreateFields(const ATable: IioDBBuilderSchemaTable);
var
  LComma: Char;
  LField: IioDBBuilderSchemaField;
begin
  LComma := ' ';
  for LField in ATable.Fields do
  begin
    FSqlGenerator.CreateField(LField, LComma);
    LComma := ',';
  end;
end;

procedure TioDBBuilderStrategyBase.CreateForeignKeys;
var
  LTable: IioDBBuilderSchemaTable;
begin
  SqlGenerator.ScriptAddTitle('Creating foreign keys');
  for LTable in FSchema.Tables.Values do
    CreateForeignKeys(LTable);
end;

procedure TioDBBuilderStrategyBase.CreateForeignKeys(const ATable: IioDBBuilderSchemaTable);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  for LForeignKey in ATable.ForeignKeys.Values do
    FSqlGenerator.AddForeignKey(LForeignKey);
end;

procedure TioDBBuilderStrategyBase.CreateIndexes;
var
  LTable: IioDBBuilderSchemaTable;
begin
  SqlGenerator.ScriptAddTitle('Creating indexes');
  for LTable in FSchema.Tables.Values do
    CreateIndexes(LTable);
end;

procedure TioDBBuilderStrategyBase.CreateIndexes(const ATable: IioDBBuilderSchemaTable);
var
  LIndex: ioIndex;
begin
  for LIndex in ATable.Indexes do
    FSqlGenerator.AddIndex(ATable, LIndex);
end;

procedure TioDBBuilderStrategyBase.AddOrAlterFields(const ATable: IioDBBuilderSchemaTable);
var
  LComma: Char;
  LField: IioDBBuilderSchemaField;
begin
  LComma := ' ';
  for LField in ATable.Fields do
  begin
    case LField.Status of
      stCreate:
        begin
          FSqlGenerator.AddField(LField, LComma);
          LComma := ',';
        end;
      stAlter:
        begin
          FSqlGenerator.AlterField(LField, LComma);
          LComma := ',';
        end;
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateOrAlterTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in FSchema.Tables.Values do
  begin
    case LTable.Status of
      stCreate:
        CreateTable(LTable);
      stAlter:
        AlterTable(LTable);
    end;
  end;
end;

procedure TioDBBuilderStrategyBase.CreateSequences;
var
  LSequence: String;
begin
  if FSchema.Sequences.Count = 0 then
    Exit;
  SqlGenerator.ScriptAddTitle('Creating sequences (if empty, no sequence needs to be created)');
  for LSequence in FSchema.Sequences do
    SqlGenerator.AddSequence(LSequence, FSchema.Status = stCreate);
end;

procedure TioDBBuilderStrategyBase.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  SqlGenerator.ScriptAddTitle(Format('Creating table ''%s''', [ATable.TableName]));
end;

procedure TioDBBuilderStrategyBase.DropForeignKeys;
begin
  if FSchema.Status = stCreate then
    Exit;
  FSqlGenerator.ScriptAddTitle('Dropping foreign keys');
  FSqlGenerator.DropAllForeignKeys;
end;

procedure TioDBBuilderStrategyBase.DropIndexes;
begin
  if FSchema.Status = stCreate then
    Exit;
  SqlGenerator.ScriptAddTitle('Dropping indexes');
  SqlGenerator.DropAllIndexes;
end;

function TioDBBuilderStrategyBase.Schema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

function TioDBBuilderStrategyBase.SqlGenerator: IioDBBuilderSqlGenerator;
begin
  Result := FSqlGenerator;
end;

end.
