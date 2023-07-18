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
unit iORM.Interceptor.ObjCrud;

interface

uses
  iORM.Context.Interfaces, iORM.DB.Interfaces;

type

  TioObjCrudInterceptorRef = class of TioCustomObjCrudInterceptor;

  // Note: The CRUD interceptor is registered for specific classes (on the entity class map)
  TioCustomObjCrudInterceptor = class
  public
    // ObjCreate
    class procedure BeforeObjCreate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjCreate(const AContext: IioContext; const AQuery: IioQuery);
    // ObjInsert
    class procedure BeforeObjInsert(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjInsert(const AContext: IioContext; const AQuery: IioQuery);
    // ObjUpdate
    class procedure BeforeObjUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjUpdate(const AContext: IioContext; const AQuery: IioQuery);
    // ObjDelete
    class procedure BeforeObjDelete(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
    class procedure AfterObjDelete(const AContext: IioContext; const AQuery: IioQuery);
  end;

implementation

{ TioCustomObjCrudIncerceptor }

class procedure TioCustomObjCrudInterceptor.AfterObjCreate(const AContext: IioContext; const AQuery: IioQuery);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomObjCrudInterceptor.AfterObjDelete(const AContext: IioContext; const AQuery: IioQuery);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomObjCrudInterceptor.AfterObjInsert(const AContext: IioContext; const AQuery: IioQuery);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomObjCrudInterceptor.AfterObjUpdate(const AContext: IioContext; const AQuery: IioQuery);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomObjCrudInterceptor.BeforeObjCreate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomObjCrudInterceptor.BeforeObjDelete(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomObjCrudInterceptor.BeforeObjInsert(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomObjCrudInterceptor.BeforeObjUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

end.
