unit iORM.DBBuilder.Strategy.MSSqlServer;

interface

uses
  iORM.DBBuilder.Strategy.WithAlterTable;

type

  // All MS SQL Server DBMS traits (invalid field-type conversions, key-generation compatibility)
  // now live on the SqlGenerator axis (TioDBBuilderSqlGenMSSqlServer). This class has no overrides
  // of its own; kept as a named placeholder for symmetry with the Firebird/SQLite strategies.
  TioDBBuilderStrategyMSSqlServer = class(TioDBBuilderStrategyWithAlterTable)
  end;

implementation

end.
