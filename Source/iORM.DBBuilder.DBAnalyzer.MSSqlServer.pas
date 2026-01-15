unit iORM.DBBuilder.DBAnalyzer.MSSqlServer;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.DBAnalyzer

  ;


type
  TioDBBuilderDBAnalyzerMSSqlServer = class(TioDBBuilderDBAnalyzer)
  protected
    procedure AnalyzeTables; override;
  end;

implementation

{ TioDBBuilderDBAnalyzerMSSqlServer }

procedure TioDBBuilderDBAnalyzerMSSqlServer.AnalyzeTables;
begin
  // TODO: Implement table analysis for MS SQL Server
end;

end.
