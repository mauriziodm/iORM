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
unit iORM.Interceptor.Strategy;

interface

uses
  iORM.Where.Interfaces;

type

  TioStrategyInterceptorOpType = (siLoadObj, siLoadList, siPersistObj, siPersistList, siDeleteObj, siDeleteList, siStartTransaction);

  TioStrategyInterceptorRef = class of TioCustomStrategyInterceptor;

  // Note: The strategy interceptor is not registered for a specific class because it
  //  intercepts calls where the specified type may be an interface which must then be resolved.
  //  All strategy interceptors are registered on the "StrategyInterceptorRegister"
  TioCustomStrategyInterceptor = class
  public
    class function CanIntercept(const AType, AALias: String; const AOpType: TioStrategyInterceptorOpType): Boolean;
    // LoadObject
    class function BeforeLoadObject(const AWhere: IioWhere; const AObj: TObject; var ADone: Boolean): TObject; virtual;
    class function AfterLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject; virtual;
    // LoadList
    class procedure BeforeLoadList(const AWhere: IioWhere; const AList: TObject; var ADone: Boolean); virtual;
    class procedure AfterLoadList(const AWhere: IioWhere; const AList: TObject); virtual;
    // PersistObject
    class procedure BeforePersistObject(const AObj: TObject; var ADone: Boolean); virtual;
    class procedure AfterPersistObject(const AObj: TObject); virtual;
    // PersistList
    class procedure BeforePersistList(const AList: TObject; var ADone: Boolean); virtual;
    class procedure AfterPersistList(const AList: TObject); virtual;
    // DeleteObject
    class procedure BeforeDeleteObject(const AObj: TObject; var ADone: Boolean); virtual;
    class procedure AfterDeleteObject(const AObj: TObject); virtual;
    // DeleteList
    class procedure BeforeDeleteList(const AList: TObject; var ADone: Boolean); virtual;
    class procedure AfterDeleteList(const AList: TObject); virtual;
  end;

implementation

{ TioStrategyIncerceptor }

class procedure TioCustomStrategyInterceptor.AfterDeleteList(const AList: TObject);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.AfterDeleteObject(const AObj: TObject);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.AfterLoadList(const AWhere: IioWhere; const AList: TObject);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class function TioCustomStrategyInterceptor.AfterLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject;
begin
  Result := nil;
end;

class procedure TioCustomStrategyInterceptor.AfterPersistList(const AList: TObject);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.AfterPersistObject(const AObj: TObject);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforeDeleteList(const AList: TObject; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforeDeleteObject(const AObj: TObject; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforeLoadList(const AWhere: IioWhere; const AList: TObject; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class function TioCustomStrategyInterceptor.BeforeLoadObject(const AWhere: IioWhere; const AObj: TObject; var ADone: Boolean): TObject;
begin
  Result := nil;
end;

class procedure TioCustomStrategyInterceptor.BeforePersistList(const AList: TObject; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomStrategyInterceptor.BeforePersistObject(const AObj: TObject; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class function TioCustomStrategyInterceptor.CanIntercept(const AType, AALias: String; const AOpType: TioStrategyInterceptorOpType): Boolean;
begin
  Result := False;
end;

end.
