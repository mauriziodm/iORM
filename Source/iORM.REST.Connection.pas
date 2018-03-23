{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



unit iORM.REST.Connection;

interface

uses
  iORM.DB.Connection, iORM.DB.Interfaces, REST.Client, iORM.REST.Interfaces;

type
(*
//&&&& inizio
  TioRestMapper = class(TioMapper)
  public
    class Function IsDBConnection:Boolean; override;
    class Function IsRestConnection:Boolean; override;
  end;
//&&&& fine
*)

  // This is the specialized class for REST connections
  TioConnectionREST = class(TioConnectionBase, IioConnectionREST)
  strict private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRESTRequestBody: IioRESTRequestBody;
    FRESTResponseBody: IioRESTResponseBody;
    procedure Execute(const AResource:String);
  strict protected
    procedure DoStartTransaction; override;
    procedure DoCommitTransaction; override;
    procedure DoRollbackTransaction; override;
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
  iORM.REST.Factory, REST.Types, IPPeerClient, System.JSON;

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
  FRESTRequestBody := TioRESTFactory.NewRequestBody(False);
end;

destructor TioConnectionREST.Destroy;
begin
  FRESTResponse.Free;
  FRESTRequest.Free;
  FRESTClient.Free;
  inherited;
end;

procedure TioConnectionREST.DoCommitTransaction;
begin
  inherited;
  // Nothing
end;

procedure TioConnectionREST.DoRollbackTransaction;
begin
  inherited;
  // Nothing
end;

procedure TioConnectionREST.DoStartTransaction;
begin
  inherited;
  // Nothing
end;

procedure TioConnectionREST.Execute(const AResource:String);
var
  RequestBodyJSONObject: TJSONObject;
begin
  // Set the requesta & execute it
  FRESTRequest.Resource := AResource;
  FRESTRequest.ClearBody;
  RequestBodyJSONObject := FRESTRequestBody.ToJSONObject;
  try
    FRESTRequest.AddBody(RequestBodyJSONObject);
    FRESTRequest.Execute;
  finally
    RequestBodyJSONObject.Free;
  end;
  // Create and set the ioRESTResponseBody
  FRESTResponseBody := TioRESTFactory.NewResponseBody(FRESTResponse.Content, False);
end;

function TioConnectionREST.GetRequestBody: IioRESTRequestBody;
begin
  Result := FRESTRequestBody;
end;

function TioConnectionREST.GetResponseBody: IioRESTResponseBody;
begin
  Result := FRESTResponseBody;
end;

(*
//&&&& inizio
{ TioRestMapper }

class function TioRestMapper.IsDBConnection: Boolean;
begin
  Result:=False;
end;

class function TioRestMapper.IsRestConnection: Boolean;
begin
  Result:=True;
end;
//&&&& fine
*)

end.
