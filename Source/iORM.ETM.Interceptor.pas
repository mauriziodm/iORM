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
unit iORM.ETM.Interceptor;

interface

uses
  iORM.Interceptor.CRUD, iORM.Context.Interfaces, iORM.DB.Interfaces;

type

  TioEtmInterceptor = class(TioCustomCRUDInterceptor)
  public
    class procedure AfterInsert(const AContext: IioContext; const AQuery: IioQuery); override;
    class procedure AfterUpdate(const AContext: IioContext; const AQuery: IioQuery); override;
    class procedure AfterDelete(const AContext: IioContext; const AQuery: IioQuery); override;
  end;

implementation

uses
  iORM, iORM.ETM.Interfaces, iORM.ETM.Factory;

{ TioEtmInterceptor }

class procedure TioEtmInterceptor.AfterDelete(const AContext: IioContext; const AQuery: IioQuery);
begin
  io.Persist(TioETMFactory.NewDeleteTimeSlot(AContext));
end;

class procedure TioEtmInterceptor.AfterInsert(const AContext: IioContext; const AQuery: IioQuery);
begin
  io.Persist(TioETMFactory.NewInsertTimeSlot(AContext));
end;

class procedure TioEtmInterceptor.AfterUpdate(const AContext: IioContext; const AQuery: IioQuery);
begin
  io.Persist(TioETMFactory.NewUpdateTimeSlot(AContext));
end;

end.
