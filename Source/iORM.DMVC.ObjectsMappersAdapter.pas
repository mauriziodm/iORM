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
