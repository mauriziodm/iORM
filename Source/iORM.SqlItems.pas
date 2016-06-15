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



unit iORM.SqlItems;

interface

uses
  iORM.Interfaces, System.Rtti;

type

  // Base per tuttle SqlItems basate su un valore costante
  //  Derivare una classe specificando solo il valore costante.
  TioSqlItem = class (TInterfacedObject, IioSqlItem)
  strict protected
    FSqlText: String;
  public
    constructor Create(const ASqlText:String); virtual;
    function GetSql: String; virtual;
  end;

implementation

{ TiuSqlItem }

constructor TioSqlItem.Create(const ASqlText: String);
begin
  FSqlText := ASqlText;
end;

function TioSqlItem.GetSql: String;
begin
  Result := FSqlText;
end;

end.
