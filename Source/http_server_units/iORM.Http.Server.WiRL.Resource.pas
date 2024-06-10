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
unit iORM.Http.Server.WiRL.Resource;

{$I WiRL.inc}

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Comp.Client,

  WiRL.Core.Engine,
  WiRL.Core.Attributes,
  WiRL.http.Accept.MediaType,
  WiRL.Core.MessageBody.Default,
  WiRL.Data.MessageBody.Default,
  WiRL.Data.FireDAC.MessageBody.Default,
  WiRL.Core.JSON;

type
  [Path('iorm')]
  TioWiRLResource = class
  public
    [PUT]
    [Path('execute_action')]
    [Consumes(TMediaType.APPLICATION_JSON)]
    [Produces(TMediaType.APPLICATION_JSON)]
    function ExecuteAction([BodyParam] const AioRequest: String): string;
    [GET]
    [Path('test')]
    [Produces(TMediaType.APPLICATION_JSON)]
    function Test: string;
  end;

implementation

uses
  System.IOUtils, Datasnap.DBClient,
  WiRL.Core.Registry, iORM.Http.Server.Executor;

{ TioWiRLResource }

function TioWiRLResource.ExecuteAction(const AioRequest: String): string;
begin
  Result := TioHttpServerExecutor.Execute(AioRequest);
end;

function TioWiRLResource.Test: string;
begin
  Result := TioHttpServerExecutor.Test;
end;

initialization
  TWiRLResourceRegistry.Instance.RegisterResource<TioWiRLResource>;

end.
