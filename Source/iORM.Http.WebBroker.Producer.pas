unit iORM.Http.WebBroker.Producer;

interface

uses
  Web.HTTPApp;

type

  TioWebBrokerProducer = class(TCustomContentProducer)
  public
    function Content: string; override;
  end;

implementation

uses
  iORM.Http.Server.Executor;

{ TioWebBrokerProducer }

function TioWebBrokerProducer.Content: string;
begin
  Result := TioHttpServerExecutor.Execute(Dispatcher.Request.Content);
end;

end.
