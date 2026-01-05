unit iORM.DBBuilder.DBAnalyzer.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.DBAnalyzer

  ;


type
  TioDBBuilderDBAnalyzerSqLite = class(TioDBBuilderDBAnalyzer)
  private
    // If even one table is to be altered then all of them are to be altered
    //  (even those that have not actually changed). Instead those that are new
    //  (to be created) obviously remain to be created.
    procedure SQLite_AllOrNothingPostProcess;
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
  // Loop for all tables
  for LTable in Schema.Tables.Values do
  begin
    // Analyze the table and set it's status
    // Note: If the schema status is dbsCreate then all the tables must be dbsCreate (obviously)
    if (Schema.Status = stCreate) or not Strategy.TableExists(LTable) then
      LTable.Status := stCreate
    else
      AnalyzeFields(LTable);

    // If the table status is not stClean (and DB status is not stCreate) then the schema status became stUpdate
    if (LTable.Status > stClean) and (Schema.Status <> stCreate) then
      Schema.Status := stUpdate;
  end;

  // If even one table is to be altered then all of them are to be altered
  //  (even those that have not actually changed). Instead those that are new
  //  (to be created) obviously remain to be created.
  SQLite_AllOrNothingPostProcess;
end;

procedure TioDBBuilderDBAnalyzerSqLite.SQLite_AllOrNothingPostProcess;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // If even one table is to be altered then all of them are to be altered
  //  (even those that have not actually changed). Instead those that are new
  //  (to be created) obviously remain to be created.
  if Schema.Status = stUpdate then
    for LTable in Schema.Tables.Values do
      if LTable.Status = stClean then
        LTable.Status := stUpdate;
end;


end.
