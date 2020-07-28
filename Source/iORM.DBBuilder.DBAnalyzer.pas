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
  public
    constructor Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
    procedure Analyze;
  end;

implementation

{ TioDBBuilderDBAnalyzer }

constructor TioDBBuilderDBAnalyzer.Create(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
end;

procedure TioDBBuilderDBAnalyzer.Analyze;
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Analyze if the database exists and set  it's status
  if not FSqlGenerator.DatabaseExists then
    FSchema.Status := dbsCreate;
  // Loop for all tables
  for LTable in FSchema.Tables.Values do
  begin
    // Analyze the table and set it's status
    // Note: If the schema status is dbsCreate then all the tables must be dbsCreate (obviously)
    if (FSchema.Status = dbsCreate) or not FSqlGenerator.TableExists(LTable) then
      LTable.Status := dbsCreate
    else
      AnalyzeFields(LTable);
  end;
end;

procedure TioDBBuilderDBAnalyzer.AnalyzeFields(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  // Loop for all fields in the table
  for LField in ATable.Fields.Values do
  begin
    // Analyze the field and set it's status
    if not FSqlGenerator.FieldExists(ATable, LField) then
      LField.Status := dbsCreate
    else
    if FSqlGenerator.FieldModified(ATable, LField) then
      LField.Status := dbsAlter;
    // If the field status is not dbsClean (field modified) then
    //  table status became dbsAlter
    if LField.Status > dbsClean then
      ATable.Status := dbsAlter;
  end;
end;

end.
