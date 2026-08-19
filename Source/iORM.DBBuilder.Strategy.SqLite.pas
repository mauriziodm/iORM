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
  Context.Script.Body.AddEmpty;
  Context.Script.Body.AddComment('Before we start: defer foreign key checks to avoid errors during table rebuild');
  Context.Script.Body.Add('PRAGMA defer_foreign_keys=on;');
end;

procedure TioDBBuilderStrategySqLite.ScriptWrite_EndDeferConstraints;
begin
  Context.Script.Body.AddEmpty;
  Context.Script.Body.AddComment('At the end: restore normal foreign key checks');
  Context.Script.Body.Add('PRAGMA defer_foreign_keys=off;');
  Context.Script.Body.AddEmpty;
end;

procedure TioDBBuilderStrategySqLite.ScriptWrite_CreateTable(const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_BeginCreateTable(ATable));
  Context.Script.Body.IncIndent;

  // Inline field creation
  LComma := '  ';
  for LField in ATable.Fields do
  begin
    Context.Script.Body.AddLine(LComma + Context.SqlGenerator.BuildSQL_FieldDefinition(ATable, LField));
    LComma := ', ';
  end;

  // Note: for SQLite, FKs are inline in the CREATE TABLE statement.
  // ifmEnabled and ifmEnabledStrict behave identically here.
  if Context.Reconciliation.MappedSchema.ForeignKeysMode <> ifmDisabled then
    ScriptWrite_CreateTableForeignKeys(ATable);

  Context.Script.Body.DecIndent;
  Context.Script.Body.Add(Context.SqlGenerator.BuildSQL_EndCreateTable(ATable));
end;

end.
