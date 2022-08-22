unit iORM.DBBuilder.DBAnalyzer;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderDBAnalyzer = class(TInterfacedObject, IioDBBuilderDBAnalyzer)
  private
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    procedure AnalyzeFields(const ATable: IioDBBuilderSchemaTable);
    // If even one table is to be altered then all of them are to be altered
    //  (even those that have not actually changed). Instead those that are new
    //  (to be created) obviously remain to be created.
    procedure SQLite_AllOrNothingPostProcess;
  public
    constructor Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
    procedure Analyze;
  end;

implementation

uses
  iORM, iORM.DB.Factory, iORM.DB.Interfaces, iORM.DB.ConnectionContainer;

{ TioDBBuilderDBAnalyzer }

constructor TioDBBuilderDBAnalyzer.Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
end;

procedure TioDBBuilderDBAnalyzer.SQLite_AllOrNothingPostProcess;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Only for SQLite connection
  if TioConnectionManager.GetConnectionInfo(FSchema.ConnectionDefName).ConnectionType <> cdtSQLite then
    Exit;
  // If even one table is to be altered then all of them are to be altered
  //  (even those that have not actually changed). Instead those that are new
  //  (to be created) obviously remain to be created.
  if FSchema.Status = stAlter then
    for LTable in FSchema.Tables.Values do
      if LTable.Status = stClean then
        LTable.Status := stAlter;
end;

procedure TioDBBuilderDBAnalyzer.Analyze;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Analyze if the database exists and set  it's status
  if not FSqlGenerator.DatabaseExists then
    FSchema.Status := stCreate;
  // Start the transaction (if the DB already exists otherwise an error would occur)
  if FSchema.Status <> stCreate then
    io.StartTransaction(FSchema.ConnectionDefName);
  try
    // Loop for all tables
    for LTable in FSchema.Tables.Values do
    begin
      // Analyze the table and set it's status
      // Note: If the schema status is dbsCreate then all the tables must be dbsCreate (obviously)
      if (FSchema.Status = stCreate) or not FSqlGenerator.TableExists(LTable) then
        LTable.Status := stCreate
      else
        AnalyzeFields(LTable);
      // If the table status is not dbsClean then schema status became dbsAlter
      if LTable.Status > stClean then
        FSchema.Status := stAlter;
    end;
    // If even one table is to be altered then all of them are to be altered
    //  (even those that have not actually changed). Instead those that are new
    //  (to be created) obviously remain to be created.
    //TODO: MM 12/06/21
    SQLite_AllOrNothingPostProcess;
    // Commit or rollback the transaction (if in transaction)
    if FSchema.Status <> stCreate then
      io.CommitTransaction(FSchema.ConnectionDefName);
  except
    // Commit or rollback the transaction (if in transaction)
    if FSchema.Status <> stCreate then
      io.RollbackTransaction(FSchema.ConnectionDefName);
  end;
end;

procedure TioDBBuilderDBAnalyzer.AnalyzeFields(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  // Loop for all fields in the table
  for LField in ATable.Fields do
  begin
    // Analyze the field and set it's status
    if not FSqlGenerator.FieldExists(ATable, LField) then
      LField.Status := stCreate
    else
    if FSqlGenerator.FieldModified(ATable, LField) then
      LField.Status := stAlter;
    // If the field status is not dbsClean (field modified) then
    //  table status became dbsAlter
    if LField.Status > stClean then
      ATable.Status := stAlter;
  end;
end;

end.
