unit iORM.DBBuilder.DBAnalyzer.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.DBAnalyzer

  ;


type
  TioDBBuilderDBAnalyzerSqLite = class(TioDBBuilderDBAnalyzer)
  protected
    procedure AnalyzeTables; override;
  end;

implementation

uses
  iORM,
  iORM.DB.Interfaces

  ;


{ TioDBBuilderDBAnalyzerSqLite }

procedure TioDBBuilderDBAnalyzerSqLite.AnalyzeTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Loop through all tables in the schema
  for LTable in Schema.Tables.Values do
  begin
    // Analyze the table and set its status
    // Note: If schema status is stCreate then all tables must be stCreate
    if (Schema.Status = stCreate) or not Strategy.TableExists(LTable) then
      LTable.Status := stCreate
    else
    begin
      AnalyzeFields(LTable);
      AnalyzeIndexes(LTable);
      AnalyzeForeignKeys(LTable);
    end;

    // If table status is not stClean (and DB status is not stCreate)
    // then the schema status becomes stUpdate
    if (LTable.Status > stClean) and (Schema.Status <> stCreate) then
      Schema.Status := stUpdate;
  end;

  // Note: The old SQLite_AllOrNothingPostProcess is no longer needed
  // because now the Strategy only drops indexes of tables being rebuilt,
  // not all indexes in the database. This allows rebuilding only
  // the tables that were actually modified, improving performance.
end;

end.
