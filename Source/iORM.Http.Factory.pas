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
    class function NewRequestBody(const AOwnDataObject:Boolean=True): IioHttpRequestBody; overload;
    class function NewRequestBody(const AJSONString:String; const AOwnDataObject:Boolean=True): IioHttpRequestBody; overload;
    class function NewResponseBody(const AOwnDataObject:Boolean=True): IioHttpResponseBody; overload;
    class function NewResponseBody(const AJSONString:String; const AOwnDataObject:Boolean=True): IioHttpResponseBody; overload;
  end;

implementation

uses
  iORM.Http.Body.Request, iORM.Http.Body.Response;

{ TioHttpFactory }

class function TioHttpFactory.NewRequestBody(const AOwnDataObject:Boolean): IioHttpRequestBody;
begin
  Result := TioHttpRequestBody.Create(AOwnDataObject);
end;

class function TioHttpFactory.NewRequestBody(
  const AJSONString: String; const AOwnDataObject:Boolean): IioHttpRequestBody;
begin
  Result := TioHttpRequestBody.Create(AJSONString, AOwnDataObject);
end;

class function TioHttpFactory.NewResponseBody(const AOwnDataObject:Boolean): IioHttpResponseBody;
begin
  Result := TioHttpResponseBody.Create(AOwnDataObject);
end;

class function TioHttpFactory.NewResponseBody(
  const AJSONString: String; const AOwnDataObject:Boolean): IioHttpResponseBody;
begin
  Result := TioHttpResponseBody.Create(AJSONString, AOwnDataObject);
end;

end.
