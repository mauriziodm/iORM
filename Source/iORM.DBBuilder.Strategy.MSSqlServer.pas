unit iORM.DBBuilder.Strategy.MSSqlServer;

interface

uses
  iORM.DBBuilder.Strategy.WithAlterTable;

type

  TioDBBuilderStrategyMSSqlServer = class(TioDBBuilderStrategyWithAlterTable)
  protected
    function GetInvalidFieldTypeConversions: string; override;
  end;

implementation

const
  INVALID_FIELDTYPE_CONVERSIONS =
    '[datetime->decimal][datetime->numeric][datetime->int][date->decimal][date->numeric][date->int]' +
    '[time->numeric][time->decimal][time->int][varchar->decimal][varchar->int][varchar->date][varchar->time][varchar->datetime]' +
    '[nvarchar->decimal][nvarchar->int][nvarchar->date][nvarchar->time][nvarchar->datetime][char->decimal][char->int][char->date]' +
    '[char->time][char->datetime][nchar->decimal][nchar->int][nchar->date][nchar->time][nchar->datetime]';

{ TioDBBuilderStrategyMSSqlServer }

function TioDBBuilderStrategyMSSqlServer.GetInvalidFieldTypeConversions: string;
begin
  Result := INVALID_FIELDTYPE_CONVERSIONS;
end;

end.
