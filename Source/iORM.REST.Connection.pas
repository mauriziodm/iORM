{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.REST.Connection;

interface

uses
  iORM.DB.Connection, iORM.DB.Interfaces, REST.Client, iORM.REST.Interfaces;

type

  // This is the specialized class for REST connections
  TioConnectionREST = class(TioConnectionBase, IioConnectionREST)
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRESTRequestBody: IioRESTRequestBody;
    FRESTResponseBody: IioRESTResponseBody;
    procedure Execute(const AResource:String);
  public
    constructor Create(const AConnectionInfo:TioConnectionInfo);
    destructor Destroy; override;
    function AsRESTConnection: IioConnectionREST; override;
    // ioRequestBody property
    function GetRequestBody:IioRESTRequestBody;
    // ioResponseBody property
    function GetResponseBody:IioRESTResponseBody;
  end;

implementation

uses
  iORM.REST.Factory, REST.Types, IPPeerClient;

{ TioConnectionREST }

function TioConnectionREST.AsRESTConnection: IioConnectionREST;
begin
  inherited;
  Result := Self;
end;

constructor TioConnectionREST.Create(const AConnectionInfo: TioConnectionInfo);
begin
  inherited Create(AConnectionInfo);
  // Create the RESTClient
  FRESTClient := TRESTClient.Create(AConnectionInfo.BaseURL);
  // Create the RESTResponse
  FRESTResponse := TRESTResponse.Create(nil);
  // Create & et the RESTRequest
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Method := TRESTRequestMethod.rmPUT;
  FRESTRequest.Response := FRESTResponse;
  // create request body (not the response body)
  FRESTRequestBody := TioRESTFactory.NewRequestBody;
end;

destructor TioConnectionREST.Destroy;
begin
  FRESTResponse.Free;
  FRESTRequest.Free;
  FRESTClient.Free;
  inherited;
end;

procedure TioConnectionREST.Execute(const AResource:String);
begin
  // Set the requesta & execute it
  FRESTRequest.Resource := AResource;
  FRESTRequest.ClearBody;
  FRESTRequest.AddBody(FRESTRequestBody.ToJSONObject);
  FRESTRequest.Execute;
  // Create and set the ioRESTResponseBody
  FRESTResponseBody := TioRESTFactory.NewResponseBody(FRESTResponse.Content);
end;

function TioConnectionREST.GetRequestBody: IioRESTRequestBody;
begin
  Result := FRESTRequestBody;
end;

function TioConnectionREST.GetResponseBody: IioRESTResponseBody;
begin
  Result := FRESTResponseBody;
end;


end.
