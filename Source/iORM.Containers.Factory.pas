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



unit iORM.Containers.Factory;

interface

uses
  iORM.Containers.Interfaces;

type

  TioContainersFactory = class
  public
    class function GetInterfacedList<T>: IioList<T>;
    class function GetInterfacedObjectList<T: class>(AOwnsObjects:Boolean=True): IioList<T>;
  end;

implementation

uses
  iORM.Containers.List, iORM.Containers.ObjectList;

{ TioContainersFactory }

class function TioContainersFactory.GetInterfacedList<T>: IioList<T>;
begin
  Result := TioInterfacedList<T>.Create;
end;

class function TioContainersFactory.GetInterfacedObjectList<T>(AOwnsObjects: Boolean): IioList<T>;
begin
  Result := TioInterfacedObjectList<T>.Create(AOwnsObjects);
end;

end.
