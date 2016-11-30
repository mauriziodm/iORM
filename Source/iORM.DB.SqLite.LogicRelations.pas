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



unit iORM.DB.SqLite.LogicRelations;

interface

uses
  iORM.DB.Interfaces,
  iORM.Interfaces;

type
  TioLogicRelationSqLite = class(TioLogicRelation)
    class function _And: IioSqlItem; override;
    class function _Or: IioSqlItem; override;
    class function _Not: IioSqlItem; override;
    class function _OpenPar: IioSqlItem; override;
    class function _ClosePar: IioSqlItem; override;
  end;

implementation

uses
  iORM.SqlItems;

{ TioLrFactory }

class function TioLogicRelationSqLite._And: IioSqlItem;
begin
  Result := TioSqlItem.Create(' AND ');
end;

class function TioLogicRelationSqLite._ClosePar: IioSqlItem;
begin
  Result := TioSqlItem.Create(')');
end;

class function TioLogicRelationSqLite._Not: IioSqlItem;
begin
  Result := TioSqlItem.Create(' NOT ');
end;

class function TioLogicRelationSqLite._OpenPar: IioSqlItem;
begin
  Result := TioSqlItem.Create('(');
end;

class function TioLogicRelationSqLite._Or: IioSqlItem;
begin
  Result := TioSqlItem.Create(' OR ');
end;

end.
