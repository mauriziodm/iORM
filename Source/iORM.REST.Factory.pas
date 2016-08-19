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



unit iORM.REST.Factory;

interface

uses
  iORM.REST.Interfaces;

type

  TioRESTFactory = class
  public
    class function NewRequestBody: IioRESTRequestBody; overload;
    class function NewRequestBody(const AJSONString:String): IioRESTRequestBody; overload;
    class function NewResponseBody: IioRESTResponseBody; overload;
    class function NewResponseBody(const AJSONString:String): IioRESTResponseBody; overload;
  end;

implementation

uses
  iORM.REST.Body.Request, iORM.REST.Body.Response;

{ TioRESTFactory }

class function TioRESTFactory.NewRequestBody: IioRESTREquestBody;
begin
  Result := TioRESTRequestBody.Create;
end;

class function TioRESTFactory.NewRequestBody(
  const AJSONString: String): IioRESTREquestBody;
begin
  Result := TioRESTRequestBody.Create(AJSONString);
end;

class function TioRESTFactory.NewResponseBody: IioRESTResponseBody;
begin
  Result := TioRESTResponseBody.Create;
end;

class function TioRESTFactory.NewResponseBody(
  const AJSONString: String): IioRESTResponseBody;
begin
  Result := TioRESTResponseBody.Create(AJSONString);
end;

end.
