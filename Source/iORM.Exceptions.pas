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



unit iORM.Exceptions;

interface

uses
  System.SysUtils;

type

  EioException = class(Exception)
  public
    constructor Create(const AClassName, AMethodName, AMsg: string); overload;
    constructor Create(const AClassName, AMsg: string); overload;
  end;

  EioConcurrencyConflictException = class(EioException)
  end;

implementation

{ EioException }

constructor EioException.Create(const AClassName, AMethodName, AMsg: string);
begin
  inherited Create(Format('iORM exception on "%s.%s":'#13#13'%s', [AClassName, AMethodName, AMsg]));
end;

constructor EioException.Create(const AClassName, AMsg: string);
begin
   inherited Create(Format('iORM exception on "%s":'#13#13'%s', [AClassName, AMsg]));
end;

end.


