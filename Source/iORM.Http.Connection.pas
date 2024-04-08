{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.Http.Connection;

interface

uses
  iORM.DB.Connection, iORM.DB.Interfaces, REST.Client, iORM.Http.Interfaces;

type

  // This is the specialized class for http connections
  TioConnectionHttp = class(TioConnectionBase, IioConnectionHttp)
  strict private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FioHttpRequestBody: IioHttpRequestBody;
    FioHttpResponseBody: IioHttpResponseBody;
    FAsJsonRpc: Boolean;
    procedure Execute(const AMethodName:String);
    function WrapBodyAsJsonRpcRequest(const AJSONText: String): String;
  strict protected
    procedure DoStartTransaction; override;
    procedure DoCommitTransaction; override;
    procedure DoRollbackTransaction; override;
    property AsJsonRpc: Boolean read FAsJsonRpc write FAsJsonRpc default False;
  public
    constructor Create(const AConnectionInfo:TioConnectionInfo);
    destructor Destroy; override;
    function AsHttpConnection: IioConnectionHttp; override;
    function InTransaction: Boolean; override;
    // ioRequestBody property
    function GetioRequestBody:IioHttpRequestBody;
    // ioResponseBody property
    function GetioResponseBody:IioHttpResponseBody;
  end;

implementation

uses
  iORM.Http.Factory, REST.Types, IPPeerClient, System.JSON, System.SysUtils;

{ TioConnectionHttp }

function TioConnectionHttp.AsHttpConnection: IioConnectionHttp;
begin
  inherited;
  Result := Self;
end;

constructor TioConnectionHttp.Create(const AConnectionInfo: TioConnectionInfo);
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
  FRESTRequest.Resource := '/';
  FRESTRequest.Response := FRESTResponse;
  // create request body (not the response body)
  FioHttpRequestBody := TioHttpFactory.NewRequestBody;
  // Set the flag indicating if the request must be wrapped into a jsonrpc request type
  FAsJsonRpc := False;
end;

destructor TioConnectionHttp.Destroy;
begin
  FRESTResponse.Free;
  FRESTRequest.Free;
  FRESTClient.Free;
  inherited;
end;

procedure TioConnectionHttp.Execute(const AMethodName:String);
begin
  // Set the request & execute it
  FRESTRequest.ClearBody;
  FioHttpRequestBody.MethodName := AMethodName;
  if FAsJsonRpc then
    FRESTRequest.AddBody(WrapBodyAsJsonRpcRequest(FioHttpRequestBody.ToJSONText), ctAPPLICATION_JSON)
  else
    FRESTRequest.AddBody(FioHttpRequestBody.ToJSONText, ctAPPLICATION_JSON);
  FRESTRequest.Execute;
  // Create and set the ioRESTResponseBody
  FioHttpResponseBody := TioHttpFactory.NewResponseBodyByJSONString(FRESTResponse.Content);
end;

procedure TioConnectionHttp.DoCommitTransaction;
begin
  inherited;
  // Nothing
end;

procedure TioConnectionHttp.DoRollbackTransaction;
begin
  inherited;
  // Nothing
end;

procedure TioConnectionHttp.DoStartTransaction;
begin
  inherited;
  // Nothing
end;

function TioConnectionHttp.GetioRequestBody: IioHttpRequestBody;
begin
  Result := FioHttpRequestBody;
end;

function TioConnectionHttp.GetioResponseBody: IioHttpResponseBody;
begin
  Result := FioHttpResponseBody;
end;


function TioConnectionHttp.InTransaction: Boolean;
begin
  inherited;
  Result := False;
end;

function TioConnectionHttp.WrapBodyAsJsonRpcRequest(const AJSONText: String): String;
begin
  Result := Format('{"jsonrpc": "2.0", "method": "execute", "params": ["%s"], "id": %d}', [FioHttpRequestBody.ToJSONText, Random(1000)]);
end;

end.
