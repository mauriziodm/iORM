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





unit iORM.Remote.Factory;

interface

uses
  iORM.DB.Interfaces;

type

  TioRemoteFactory = class
  public
    class function NewRequestBody(const AOwnDataObject:Boolean=True): IioRemoteRequestBody; overload;
    class function NewRequestBody(const AJSONString:String; const AOwnDataObject:Boolean=True): IioRemoteRequestBody; overload;
    class function NewResponseBody(const AOwnDataObject:Boolean=True): IioRemoteResponseBody; overload;
    class function NewResponseBody(const AJSONString:String; const AOwnDataObject:Boolean=True): IioRemoteResponseBody; overload;
  end;

implementation

uses
  iORM.Remote.Body.Request, iORM.Remote.Body.Response;

{ TioRemoteFactory }

class function TioRemoteFactory.NewRequestBody(const AOwnDataObject:Boolean): IioRemoteRequestBody;
begin
  Result := TioRemoteRequestBody.Create(AOwnDataObject);
end;

class function TioRemoteFactory.NewRequestBody(
  const AJSONString: String; const AOwnDataObject:Boolean): IioRemoteRequestBody;
begin
  Result := TioRemoteRequestBody.Create(AJSONString, AOwnDataObject);
end;

class function TioRemoteFactory.NewResponseBody(const AOwnDataObject:Boolean): IioRemoteResponseBody;
begin
  Result := TioRemoteResponseBody.Create(AOwnDataObject);
end;

class function TioRemoteFactory.NewResponseBody(
  const AJSONString: String; const AOwnDataObject:Boolean): IioRemoteResponseBody;
begin
  Result := TioRemoteResponseBody.Create(AJSONString, AOwnDataObject);
end;

end.
