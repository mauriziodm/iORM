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



unit iORM.DuckTyped.Factory;

interface

uses
  iORM.DuckTyped.Interfaces;

type

  // Concrete factory for DuckTyped objects
  TioDuckTypedFactory = class
    class function DuckTypedStreamObject(AObj: TObject): IioDuckTypedStreamObject;
    class function DuckTypedList(AListObject: TObject): IioDuckTypedList;
  end;

implementation

uses
  iORM.DuckTyped.List, iORM;

{ TioDuckTypeFactory }


{ TioDuckTypeFactory }

class function TioDuckTypedFactory.DuckTypedList(
  AListObject: TObject): IioDuckTypedList;
begin
  Result := TioDuckTypedList.Create(AListObject);
end;

class function TioDuckTypedFactory.DuckTypedStreamObject(
  AObj: TObject): IioDuckTypedStreamObject;
var
  AAlias: String;
begin
  // Init
  AAlias := AObj.ClassName;
  // If a custom implementation of the DuckTypedStreamObject (for the class of AObj; ClassName as Alias) is present in the
  //  dependency injection cantainer then use it, else retrieve the standard implementation (no Alias)
  if not io.di.Locate<IioDuckTypedStreamObject>.Alias(AAlias).Exist then
    AAlias := '';
  // Return the result
  Result := io.di.Locate<IioDuckTypedStreamObject>
                                       .Alias(AAlias)
                                       .ConstructorParams([AObj])
                                       .Get;
end;

end.

