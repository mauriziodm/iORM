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



unit iORM.DB.Peculiarity.Generic.SqlCompareOperators;

interface

uses
  iORM.DB.Interfaces,
  iORM.Interfaces;

type
  TioSqlCompareOperatorGeneric = class(TioSqlCompareOperator)
    class function _Equal: IioSqlItem; override;
    class function _Greater: IioSqlItem; override;
    class function _Lower: IioSqlItem; override;
    class function _GreaterOrEqual: IioSqlItem; override;
    class function _LowerOrEqual: IioSqlItem; override;
    class function _NotEqual: IioSqlItem; override;
    class function _Like: IioSqlItem; override;
    class function _IsNull: IioSqlItem; override;
    class function _IsNotNull: IioSqlItem; override;
  end;

implementation

uses
  iORM.SqlItems;


class function TioSqlCompareOperatorGeneric._Equal: IioSqlItem;
begin
  Result := TioSqlItem.Create(' = ');
end;

class function TioSqlCompareOperatorGeneric._GreaterOrEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' >= ');
end;

class function TioSqlCompareOperatorGeneric._Greater: IioSqlItem;
begin
  Result := TioSqlItem.Create(' > ');
end;

class function TioSqlCompareOperatorGeneric._IsNotNull: IioSqlItem;
begin
  Result := TioSqlItem.Create(' IS NOT NULL ');
end;

class function TioSqlCompareOperatorGeneric._IsNull: IioSqlItem;
begin
  Result := TioSqlItem.Create(' IS NULL ');
end;

class function TioSqlCompareOperatorGeneric._Like: IioSqlItem;
begin
  Result := TioSqlItem.Create(' LIKE ');
end;

class function TioSqlCompareOperatorGeneric._LowerOrEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' <= ');
end;

class function TioSqlCompareOperatorGeneric._Lower: IioSqlItem;
begin
  Result := TioSqlItem.Create(' < ');
end;

class function TioSqlCompareOperatorGeneric._NotEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' <> ');
end;

end.
