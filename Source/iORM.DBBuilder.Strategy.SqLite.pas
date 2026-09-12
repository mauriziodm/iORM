unit iORM.DBBuilder.Strategy.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.WithoutAlterTable

  ;


type
  TioDBBuilderStrategySqLite = class(TioDBBuilderStrategyWithoutAlterTable)
  private
  protected
    // ==========================================================
    // CONSTRAINT DEFERRAL HOOKS
    // ----------------------------------------------------------
    procedure ScriptWrite_BeginDeferConstraints; override;
    procedure ScriptWrite_EndDeferConstraints; override;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>FKs are inline in the CREATE TABLE statement (SQLite has no ALTER TABLE ADD CONSTRAINT).</summary>
    procedure ScriptWrite_CreateTableInlineConstraints(const ATable: IioDBBuilderSchemaTable); override;
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

// opCreateTable translation sub-fragment (inline-constraints slot of the base template): SQLite bakes
// FKs inline in the CREATE TABLE statement (no ALTER TABLE ADD CONSTRAINT). ifmEnabled and
// ifmEnabledStrict behave identically here; ifmDisabled skips them.
procedure TioDBBuilderStrategySqLite.ScriptWrite_CreateTableInlineConstraints(const ATable: IioDBBuilderSchemaTable);
begin
  if Context.Reconciliation.ForeignKeysMode <> ifmDisabled then
    ScriptWrite_CreateTableForeignKeys(ATable);
end;

end.
