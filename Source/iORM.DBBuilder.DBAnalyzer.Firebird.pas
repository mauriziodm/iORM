unit iORM.DBBuilder.DBAnalyzer.Firebird;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.DBAnalyzer

  ;


type
  TioDBBuilderDBAnalyzerFirebird = class(TioDBBuilderDBAnalyzer)
  protected
    procedure AnalyzeTables; override;
  end;

implementation

uses
  iORM,
  iORM.DB.Interfaces

  ;

{ TioDBBuilderDBAnalyzerFirebird }

procedure TioDBBuilderDBAnalyzerFirebird.AnalyzeTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Loop for all tables
  for LTable in Schema.Tables.Values do
  begin
    // Analyze the table and set its status
    // Note: If the schema status is stCreate then all the tables must be stCreate (obviously)
    if (Schema.Status = stCreate) or not Strategy.TableExists(LTable) then
      LTable.Status := stCreate;
    // Always called — handle stCreate tables internally without DB queries
    AnalyzeFields(LTable);
    AnalyzeIndexes(LTable);
    AnalyzeForeignKeys(LTable);

    // If the table status is not stClean (and DB status is not stCreate) then the schema status became stUpdate
    if (LTable.Status > stClean) and (Schema.Status <> stCreate) then
      Schema.Status := stUpdate;
  end;
end;


end.
