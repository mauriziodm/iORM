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



unit iORM.Where.Factory;

interface

uses
  iORM.Where.Interfaces, iORM.Where;

type

  TioWhereFactory = class
  public
    class function NewWhere: IioWhere; overload;
    class function NewWhere<T>: IioWhere<T>; overload;
    class function NewWhereItems: IWhereItems;
    class function NewDetailsContainer: IioWhereDetailsContainer;
  end;

implementation

uses
  iORM.Where.DetailsContainer, iORM.Containers.List, iORM.Interfaces;

{ TioWhereFactory }

class function TioWhereFactory.NewDetailsContainer: IioWhereDetailsContainer;
begin
  Result := TioWhereDetailsContainer.Create;
end;

class function TioWhereFactory.NewWhere: IioWhere;
begin
  Result := TioWhere.Create;
end;

class function TioWhereFactory.NewWhere<T>: IioWhere<T>;
begin
  Result := TioWhere<T>.Create;
end;

class function TioWhereFactory.NewWhereItems: IWhereItems;
begin
  Result := TioInterfacedList<IioSqlItem>.Create;
end;

end.
