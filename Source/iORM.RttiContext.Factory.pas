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





unit iORM.RttiContext.Factory;

interface

uses
  System.Rtti;

type

  TioRttiFactory = class
  public
    class function GetRttiContext: TRttiContext;
    class function GetRttiType(const AClass: TClass): TRttiType;
    class function GetRttiProperty(const AClass: TClass; const APropertyName: String): TRttiProperty;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils;

var ARttiContext: TRttiContext;

{ TioRttiContextFactory }

class function TioRttiFactory.GetRttiContext: TRttiContext;
begin
  Result := ARttiContext;
end;

class function TioRttiFactory.GetRttiType(const AClass: TClass): TRttiType;
begin
  Result := ARttiContext.GetType(AClass);
  if Result = nil then
    raise EioException.Create(ClassName, 'GetRttiType', Format('RttiType not found for "%s" class', [AClass.ClassName]));
end;

class function TioRttiFactory.GetRttiProperty(const AClass: TClass; const APropertyName: String): TRttiProperty;
begin
  Result := GetRttiType(AClass).GetProperty(APropertyName);
  if Result = nil then
    raise EioException.Create(ClassName, 'GetRttiProperty', Format('RttiProperty named "%s" not found for "%s" class', [APropertyName, AClass.ClassName]));
end;

initialization
  // Create the unique global instance of RttiContext
  ARttiContext := TRttiContext.Create;
  ARttiContext.FindType(''); // Workaround for thread safe: https://quality.embarcadero.com/browse/RSP-9815

finalization
  // GlobalRttiContext cleanup
  ARttiContext.Free;
end.


