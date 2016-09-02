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
  iORM.DB.Interfaces;

type

  TioRESTFactory = class
  public
    class function NewRequestBody(const AOwnDataObject:Boolean=True): IioRESTRequestBody; overload;
    class function NewRequestBody(const AJSONString:String; const AOwnDataObject:Boolean=True): IioRESTRequestBody; overload;
    class function NewResponseBody(const AOwnDataObject:Boolean=True): IioRESTResponseBody; overload;
    class function NewResponseBody(const AJSONString:String; const AOwnDataObject:Boolean=True): IioRESTResponseBody; overload;
  end;

implementation

uses
  iORM.REST.Body.Request, iORM.REST.Body.Response;

{ TioRESTFactory }

class function TioRESTFactory.NewRequestBody(const AOwnDataObject:Boolean): IioRESTREquestBody;
begin
  Result := TioRESTRequestBody.Create(AOwnDataObject);
end;

class function TioRESTFactory.NewRequestBody(
  const AJSONString: String; const AOwnDataObject:Boolean): IioRESTREquestBody;
begin
  Result := TioRESTRequestBody.Create(AJSONString, AOwnDataObject);
end;

class function TioRESTFactory.NewResponseBody(const AOwnDataObject:Boolean): IioRESTResponseBody;
begin
  Result := TioRESTResponseBody.Create(AOwnDataObject);
end;

class function TioRESTFactory.NewResponseBody(
  const AJSONString: String; const AOwnDataObject:Boolean): IioRESTResponseBody;
begin
  Result := TioRESTResponseBody.Create(AJSONString, AOwnDataObject);
end;

end.
