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
//  ******************************************************************************
//  * NOTE: {$DEFINE ioStrategyInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioStrategyInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioStrategyInterceptorsOff} to disable strategy interceptors *
//  ******************************************************************************
unit iORM.Interceptor.Strategy;

interface

uses
  iORM.Where.Interfaces, iORM.PersistenceStrategy.Interfaces;

type

  TioStrategyInterceptorRef = class of TioCustomStrategyInterceptor;

  TioCustomStrategyInterceptor = class
  public
    // LoadObject
    class procedure BeforeLoadObject(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean); virtual;
    class procedure AfterLoadObject(const APSRequest: IioPersistenceStrategyRequest); virtual;
    // LoadList
    class procedure BeforeLoadList(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean); virtual;
    class procedure AfterLoadList(const APSRequest: IioPersistenceStrategyRequest); virtual;
    // PersistObject
    class procedure BeforePersistObject(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean); virtual;
    class procedure AfterPersistObject(const APSRequest: IioPersistenceStrategyRequest); virtual;
    // PersistList
    class procedure BeforePersistList(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean); virtual;
    class procedure AfterPersistList(const APSRequest: IioPersistenceStrategyRequest); virtual;
    // DeleteObject
    class procedure BeforeDeleteObject(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean); virtual;
    class procedure AfterDeleteObject(const APSRequest: IioPersistenceStrategyRequest); virtual;
    // DeleteList
    class procedure BeforeDeleteList(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean); virtual;
    class procedure AfterDeleteList(const APSRequest: IioPersistenceStrategyRequest); virtual;
  end;

implementation

{ TioStrategyIncerceptor }

class procedure TioCustomStrategyInterceptor.AfterDeleteList(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.AfterDeleteObject(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.AfterLoadList(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.AfterLoadObject(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;


class procedure TioCustomStrategyInterceptor.AfterPersistList(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.AfterPersistObject(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforeDeleteList(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforeDeleteObject(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforeLoadList(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforeLoadObject(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforePersistList(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforePersistObject(const APSRequest: IioPersistenceStrategyRequest; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

end.
