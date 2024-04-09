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
unit iORM.Http.Server.DMVC.Controller;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.JSONRPC;

type

  [MVCPath('/iorm')]
  TioDMVCController = class(TMVCController)
  public
    [MVCPath('/execute_action'), MVCHTTPMethod([httpPUT]), MVCProduce('application/json'), MVCConsumes('application/json')]
    [MVCDoc('Execute an iORM action using DMVC framework as http transport layer.')]
    procedure Execute;
    [MVCPath('/test'), MVCHTTPMethod([httpGET])]
    [MVCDoc('Execute a connection test.')]
    procedure Test;
  end;

  TioDmvcJsonRpcController = class(TMVCJSONRPCController)
  public
    function Execute(const AioRequestBodyAsString: String): String;
    function Test: String;
  end;

implementation

uses
  iORM.Http.Server.Executor;

{ TioDMVCController }

procedure TioDMVCController.Execute;
var
  LResponse: String;
begin
  LResponse := TioHttpServerExecutor.Execute(Context.Request.Body);
  Render(LResponse);
end;

procedure TioDMVCController.Test;
var
  LResponse: String;
begin
  LResponse := TioHttpServerExecutor.Test;
  Render(LResponse);
end;

{ TioDmvcJsonRpcController }

function TioDmvcJsonRpcController.execute(const AioRequestBodyAsString: String): String;
begin
  Result := TioHttpServerExecutor.Execute(AioRequestBodyAsString);
end;

function TioDmvcJsonRpcController.test: String;
begin
  Result := TioHttpServerExecutor.Test;
end;

end.
