unit iORM.REST.Connection;

interface

uses
  iORM.DB.Connection, iORM.REST.Interfaces, iORM.DB.Interfaces, REST.Client;

type

  // This is the specialized class for REST connections
  TioConnectionREST = class(TioConnectionBase, IioConnectionREST)
  strict private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
  public
    constructor Create(const AConnectionInfo:TioConnectionInfo);
    destructor Destroy; override;
  end;

implementation

{ TioConnectionREST }

constructor TioConnectionREST.Create(const AConnectionInfo: TioConnectionInfo);
begin
  inherited Create(AConnectionInfo);
  FRESTClient := TRESTClient.Create(AConnectionInfo.BaseURL);
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
end;

destructor TioConnectionREST.Destroy;
begin
  FRESTResponse.Free;
  FRESTRequest.Free;
  FRESTClient.Free;
  inherited;
end;

end.
