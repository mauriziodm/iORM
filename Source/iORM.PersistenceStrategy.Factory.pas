{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.PersistenceStrategy.Factory;

interface

uses
  iORM.DB.Interfaces, iORM.PersistenceStrategy.Interfaces;

type

  TioPersistenceStrategyFactory = class
  public
    class function GetStrategy(const AConnectionName: String): TioPersistenceStrategyRef;
    class function ConnectionTypeToStrategy(const AConnectionType: TioConnectionType): TioPersistenceStrategyRef;
  end;

implementation

uses
  iORM.PersistenceStrategy.DB, iORM.PersistenceStrategy.Http, iORM.DB.ConnectionContainer;

{ TioStrategyFactory }

class function TioPersistenceStrategyFactory.ConnectionTypeToStrategy(const AConnectionType: TioConnectionType): TioPersistenceStrategyRef;
begin
  case AConnectionType of
    TioConnectionType.ctHTTP:
      Result := TioPersistenceStrategyHttp;
  else
    Result := TioPersistenceStrategyDB;
  end;
end;

class function TioPersistenceStrategyFactory.GetStrategy(const AConnectionName: String): TioPersistenceStrategyRef;
begin
  Result := TioConnectionManager.GetConnectionInfo(AConnectionName).Strategy;
end;

end.
