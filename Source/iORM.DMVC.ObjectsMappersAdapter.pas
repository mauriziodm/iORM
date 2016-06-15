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



unit iORM.DMVC.ObjectsMappersAdapter;

interface

uses
  iORM.DuckTyped.Interfaces;

type

  // DuckTypedStreamObject interface
  IWrappedObject = interface(IioDuckTypedStreamObject)
    ['{37EA7CB5-1673-4701-9585-E6BBB74E1E58}']
  end;

function WrapAsObject(const AObject: TObject): IWrappedObject;

implementation

uses
  iORM.DuckTyped.Factory, System.SysUtils;

function WrapAsObject(const AObject: TObject): IWrappedObject;
var
  AWrappedObj: TObject;
begin
  AWrappedObj := TioDuckTypedFactory.DuckTypedStreamObject(AObject) as TObject;
  Supports(AWrappedObj, IWrappedObject, Result);
end;


end.
