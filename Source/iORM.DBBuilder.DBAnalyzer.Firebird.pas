unit iORM.DBBuilder.DBAnalyzer.Firebird;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.DBAnalyzer

  ;


type
  TioDBBuilderDBAnalyzerFirebird = class(TioDBBuilderDBAnalyzer)
  public
    procedure Analyze(const ForceCreate: boolean = false); override;
  end;

implementation

uses
  iORM,
  iORM.DB.Interfaces,
  iORM.DBBuilder.QueryEngine

  ;

{ TioDBBuilderDBAnalyzerFirebird }

procedure TioDBBuilderDBAnalyzerFirebird.Analyze(const ForceCreate: boolean = false);
var
  LTable: IioDBBuilderSchemaTable;
begin
  inherited;

  // Carlo Marona (2025-10-20): What's the need of a transaction????? I think it can be removed because no changes should be made by the analyzer on the db.
  // Start the transaction (if the DB already exists otherwise an error would occur)
  if Schema.Status <> stCreate then
    io.StartTransaction(ConnectionDefName);

  try
    // Loop for all tables
    for LTable in Schema.Tables.Values do
    begin
      // Analyze the table and set it's status
      // Note: If the schema status is dbsCreate then all the tables must be dbsCreate (obviously)
      if (Schema.Status = stCreate) or not TableExists(LTable) then
        LTable.Status := stCreate
      else
      begin
        AnalyzeFields(LTable);
        AnalyzeIndexes(LTable);
        AnalyzeForeignKeys(LTable);
      end;

      // If the table status is not dbsClean then schema status became dbsAlter
      if LTable.Status > stClean then
        Schema.Status := stUpdate;
    end;

    // Commit or rollback the transaction (if in transaction)
    if Schema.Status <> stCreate then
      io.CommitTransaction(ConnectionDefName);
  except
    // Commit or rollback the transaction (if in transaction)
    if Schema.Status <> stCreate then
      io.RollbackTransaction(ConnectionDefName);
  end;
end;


end.
