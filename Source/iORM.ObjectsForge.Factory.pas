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



unit iORM.ObjectsForge.Factory;

interface

uses
  iORM.ObjectsForge.Interfaces, iORM.ObjectsForge.ObjectMapper;

type

  TioObjectMakerFactory = class
  public
    class function GetObjectMaker(ClassFromField:Boolean): TioObjectMakerRef;
    class function GetObjectMapper: TioObjectMapperRef;
  end;

implementation

uses
  iORM.ObjectsForge.ObjectMakerClassFromField,
  iORM.ObjectsForge.ObjectMaker;

{ TioObjectMakerFactory }

class function TioObjectMakerFactory.GetObjectMaker(ClassFromField:Boolean): TioObjectMakerRef;
begin
  if ClassFromField
    then Result := TioObjectMakerClassFromField
    else Result := TioObjectMaker;
end;

class function TioObjectMakerFactory.GetObjectMapper: TioObjectMapperRef;
begin
  Result := TioObjectMapperIntf;
end;

end.                                                                                                                                s
