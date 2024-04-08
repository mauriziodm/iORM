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
unit iORM.Http.Factory;

interface

uses
  iORM.DB.Interfaces;

type

  TioHttpFactory = class
  public
    class function NewRequestBody: IioHttpRequestBody; static;
    class function NewRequestBodyByJSONString(const AJSONString:String): IioHttpRequestBody; static;
    class function NewResponseBody: IioHttpResponseBody; static;
    class function NewResponseBodyByJSONString(const AJSONString:String): IioHttpResponseBody; static;
  end;

implementation

uses
  iORM.Http.Body.Request, iORM.Http.Body.Response;

{ TioHttpFactory }

class function TioHttpFactory.NewRequestBody: IioHttpRequestBody;
begin
  Result := TioHttpRequestBody.Create;
end;

class function TioHttpFactory.NewRequestBodyByJSONString(const AJSONString: String): IioHttpRequestBody;
begin
  Result := TioHttpRequestBody.CreateByJSONString(AJSONString);
end;

class function TioHttpFactory.NewResponseBody: IioHttpResponseBody;
begin
  Result := TioHttpResponseBody.Create;
end;

class function TioHttpFactory.NewResponseBodyByJSONString(const AJSONString: String): IioHttpResponseBody;
begin
  Result := TioHttpResponseBody.CreateByJSONString(AJSONString);
end;

end.
