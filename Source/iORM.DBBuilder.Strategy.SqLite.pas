unit iORM.DBBuilder.Strategy.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.WithoutAlterTable

  ;


type
  TioDBBuilderStrategySqLite = class(TioDBBuilderStrategyWithoutAlterTable)
  protected
    // ==========================================================
    // CONSTRAINT DEFERRAL HOOKS
    // ----------------------------------------------------------
    procedure ScriptWrite_BeginDeferConstraints; override;
    procedure ScriptWrite_EndDeferConstraints; override;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    procedure ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable); override;
  public

  end;


implementation


{ TioDBBuilderSqLite }

procedure TioDBBuilderStrategySqLite.ScriptWrite_BeginDeferConstraints;
begin
  FContext.Script.Body.AddEmpty;
  FContext.Script.Body.AddComment('Before we start: defer foreign key checks to avoid errors during table rebuild');
  FContext.Script.Body.Add('PRAGMA defer_foreign_keys=on;');
end;

procedure TioDBBuilderStrategySqLite.ScriptWrite_EndDeferConstraints;
begin
  FContext.Script.Body.AddEmpty;
  FContext.Script.Body.AddComment('At the end: restore normal foreign key checks');
  FContext.Script.Body.Add('PRAGMA defer_foreign_keys=off;');
  FContext.Script.Body.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  FContext.Script.Body.Add(FContext.SqlGenerator.BuildSQL_BeginCreateTable(ATable));
  FContext.Script.Body.IncIndent;

  // Inline field creation
  LComma := '  ';
  for LField in ATable.Fields do
  begin
    FContext.Script.Body.AddLine(LComma + FContext.SqlGenerator.BuildSQL_FieldDefinition(ATable, LField));
    LComma := ', ';
  end;

  // Note: for SQLite, FKs are inline in the CREATE TABLE statement.
  // ifmEnabled and ifmEnabledStrict behave identically here.
  if FContext.Reconciliation.MappedSchema.ForeignKeysMode <> ifmDisabled then
    ScriptWrite_CreateTableForeignKeys(ATable);

  FContext.Script.Body.DecIndent;
  FContext.Script.Body.Add(FContext.SqlGenerator.BuildSQL_EndCreateTable(ATable));
end;

end.
