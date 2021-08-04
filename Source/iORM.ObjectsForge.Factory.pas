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



unit iORM.ObjectsForge.Factory;

interface

uses
  iORM.ObjectsForge.Interfaces, iORM.ObjectsForge.ObjectMapper;

type

  TioObjectMakerFactory = class
  public
    class function GetObjectMaker(LTrueClass:Boolean): TioObjectMakerRef;
    class function GetObjectMapper: TioObjectMapperRef;
  end;

implementation

uses
  iORM.ObjectsForge.ObjectMakerTrueClass,
  iORM.ObjectsForge.ObjectMaker;

{ TioObjectMakerFactory }

class function TioObjectMakerFactory.GetObjectMaker(LTrueClass:Boolean): TioObjectMakerRef;
begin
  if LTrueClass
    then Result := TioObjectMakerTrueClass
    else Result := TioObjectMaker;
end;

class function TioObjectMakerFactory.GetObjectMapper: TioObjectMapperRef;
begin
  Result := TioObjectMapperIntf;
end;

end.
