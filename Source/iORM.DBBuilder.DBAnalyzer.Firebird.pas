unit iORM.DBBuilder.DBAnalyzer.Firebird;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.DBAnalyzer

  ;


type
  TioDBBuilderDBAnalyzerFirebird = class(TioDBBuilderDBAnalyzer)
  public
    procedure Analyze; override;
  end;

implementation

uses
  iORM,
  iORM.DB.Interfaces,
  iORM.DBBuilder.QueryEngine

  ;

{ TioDBBuilderDBAnalyzerFirebird }

procedure TioDBBuilderDBAnalyzerFirebird.Analyze;
var
  LTable: IioDBBuilderSchemaTable;
begin
  inherited;

  // Start the transaction (if the DB already exists otherwise an error would occur)
  // note: Maintain the transaction because the lifecycle of the physical connection
  //        to the DB coincides with the lifecycle of the transaction, thus avoiding
  //        the continuous creation and destruction of the connection
  if Schema.Status <> stCreate then
    io.StartTransaction(ConnectionDefName);

  try
    // Loop for all tables
    for LTable in Schema.Tables.Values do
    begin
      // Analyze the table and set it's status
      // Note: If the schema status is dbsCreate then all the tables must be dbsCreate (obviously)
      if (Schema.Status = stCreate) or not Strategy.TableExists(LTable) then
        LTable.Status := stCreate
      else
      begin
        AnalyzeFields(LTable);
        AnalyzeIndexes(LTable);
        AnalyzeForeignKeys(LTable);
      end;

      // If the table status is not stClean (and DB status is not stCreate) then the schema status became stUpdate
      if (LTable.Status > stClean) and (Schema.Status <> stCreate) then
        Schema.Status := stUpdate;
    end;

    // Commit or rollback the transaction (if in transaction)
    if Schema.Status <> stCreate then
      io.CommitTransaction(ConnectionDefName);
  except
    // Commit or rollback the transaction (if in transaction)
    if Schema.Status <> stCreate then
      io.RollbackTransaction(ConnectionDefName);
    raise;
  end;
end;


end.
