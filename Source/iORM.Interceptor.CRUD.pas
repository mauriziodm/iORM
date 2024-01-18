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
//  **************************************************************************
//  * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
//  * NOTE: {$DEFINE ioCRUDInterceptorsOff} to disable strategy interceptors *
//  **************************************************************************
unit iORM.Interceptor.CRUD;

interface

uses
  iORM.Context.Interfaces, System.SysUtils;

type

  TioCRUDInterceptorRef = class of TioCustomCRUDInterceptor;

  // Note: The DB interceptor is registered for specific classes and executed for every single entity instance
  TioCustomCRUDInterceptor = class
  public
    // Obj load
    class function BeforeLoad(const AContext: IioContext; const AObj: TObject; var ADone: Boolean): TObject; virtual;
    class function AfterLoad(const AContext: IioContext; const AObj: TObject): TObject; virtual;
    class function OnLoadException(const AContext: IioContext; const AException: Exception): Boolean; virtual;
    // Obj insert
    class procedure BeforeInsert(const AContext: IioContext; var ADone: Boolean); virtual;
    class procedure AfterInsert(const AContext: IioContext); virtual;
    class function OnInsertException(const AContext: IioContext; const AException: Exception): Boolean; virtual;
    // Obj update
    class procedure BeforeUpdate(const AContext: IioContext; var ADone: Boolean); virtual;
    class procedure AfterUpdate(const AContext: IioContext); virtual;
    class function OnUpdateException(const AContext: IioContext; const AException: Exception): Boolean; virtual;
    // Obj delete
    class procedure BeforeDelete(const AContext: IioContext; var ADone: Boolean); virtual;
    class procedure AfterDelete(const AContext: IioContext); virtual;
    class function OnDeleteException(const AContext: IioContext; const AException: Exception): Boolean; virtual;
  end;

implementation

{ TioCustomObjCrudIncerceptor }

class function TioCustomCRUDInterceptor.AfterLoad(const AContext: IioContext; const AObj: TObject): TObject;
begin
  Result := AObj;
end;

class procedure TioCustomCRUDInterceptor.AfterDelete(const AContext: IioContext);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomCRUDInterceptor.AfterInsert(const AContext: IioContext);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomCRUDInterceptor.AfterUpdate(const AContext: IioContext);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class function TioCustomCRUDInterceptor.BeforeLoad(const AContext: IioContext; const AObj: TObject; var ADone: Boolean): TObject;
begin
  Result := AObj;
end;

class procedure TioCustomCRUDInterceptor.BeforeDelete(const AContext: IioContext; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomCRUDInterceptor.BeforeInsert(const AContext: IioContext; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class procedure TioCustomCRUDInterceptor.BeforeUpdate(const AContext: IioContext; var ADone: Boolean);
begin
  // Nothing to do here (It must be implemented by the descendant classes)
end;

class function TioCustomCRUDInterceptor.OnDeleteException(const AContext: IioContext; const AException: Exception): Boolean;
begin
  // Return true if the exception must be re-raised
  Result := True;
end;

class function TioCustomCRUDInterceptor.OnInsertException(const AContext: IioContext; const AException: Exception): Boolean;
begin
  // Return true if the exception must be re-raised
  Result := True;
end;

class function TioCustomCRUDInterceptor.OnLoadException(const AContext: IioContext; const AException: Exception): Boolean;
begin
  // Return true if the exception must be re-raised
  Result := True;
end;

class function TioCustomCRUDInterceptor.OnUpdateException(const AContext: IioContext; const AException: Exception): Boolean;
begin
  // Return true if the exception must be re-raised
  Result := True;
end;

end.
