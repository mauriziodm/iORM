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





unit iORM.Where.Factory;

interface

uses
  iORM.Where.Interfaces, iORM.Where, iORM.LiveBindings.CommonBSAPaging;

type

  TioWhereFactory = class
  public
    class function NewWhere: IioWhere; overload;
    class function NewWhere<T>: IioWhere<T>; overload;
    class function NewWhereWithPaging(const APaging: TioCommonBSAPageManager): IioWhere; overload;
    class function NewWhereItems: IWhereItems;
    class function NewDetailsContainer: IioWhereDetailsContainer;
  end;

implementation

uses
  iORM.Where.DetailsContainer, iORM.Containers.List, iORM.Interfaces;

{ TioWhereFactory }

class function TioWhereFactory.NewDetailsContainer: IioWhereDetailsContainer;
begin
  Result := TioWhereDetailsContainer.Create;
end;

class function TioWhereFactory.NewWhere: IioWhere;
begin
  Result := TioWhere.Create;
end;

class function TioWhereFactory.NewWhere<T>: IioWhere<T>;
begin
  Result := TioWhere<T>.Create;
end;

class function TioWhereFactory.NewWhereItems: IWhereItems;
begin
  Result := TioInterfacedList<IioSqlItem>.Create;
end;

class function TioWhereFactory.NewWhereWithPaging(const APaging: TioCommonBSAPageManager): IioWhere;
begin
  Result := TioWhere.Create;
  Result.SetPagingObj(APaging);
end;

end.
