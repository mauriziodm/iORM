unit iORM.DBBuilder.Strategy.MSSqlServer;

interface

uses
  iORM.DBBuilder.Strategy.WithAlterTable;

type

  /// <summary>
  /// MS SQL Server-specific DBBuilder strategy. Inherits the common ALTER TABLE DDL mechanics from
  /// TioDBBuilderStrategyWithAlterTable and adds nothing of its own: every MS SQL Server-specific
  /// trait (invalid field-type conversions, key-generation compatibility) lives on the SqlGenerator
  /// axis (TioDBBuilderSqlGenMSSqlServer), where DBMS capability knowledge belongs. Kept as an empty,
  /// named placeholder for symmetry with the other per-DBMS strategies and as the seam to reintroduce
  /// should MS SQL Server ever need DDL-mechanic-specific behavior.
  /// </summary>
  TioDBBuilderStrategyMSSqlServer = class(TioDBBuilderStrategyWithAlterTable)
  end;

implementation

end.
