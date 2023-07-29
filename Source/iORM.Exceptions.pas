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
unit iORM.Exceptions;

interface

uses
  System.SysUtils, iORM.Context.Interfaces,
  iORM.LiveBindings.BSPersistence;

type

  EioException = class(Exception)
  public
    constructor Create(const AClassName, AMethodName, AMsg: string); overload;
    constructor Create(const AClassName, AMsg: string); overload;
  end;

  EioConcurrencyConflictException = class(EioException)
  public
    constructor Create(const AClassName, AMethodName: string; const AContext: IioContext); overload;
  end;

  EioBindSourceObjStateException = class(EioException)
  end;

  EioEtmException = class(EioException)
  end;


implementation

{ EioException }

constructor EioException.Create(const AClassName, AMethodName, AMsg: string);
begin
  inherited Create(Format(#13'iORM exception on "%s.%s":'#13#13'%s', [AClassName, AMethodName, AMsg]));
end;

constructor EioException.Create(const AClassName, AMsg: string);
begin
  inherited Create(Format(#13'iORM exception on "%s":'#13#13'%s', [AClassName, AMsg]));
end;

{ EioConcurrencyConflictException }

constructor EioConcurrencyConflictException.Create(const AClassName, AMethodName: string; const AContext: IioContext);
var
  LMsg: String;
begin
  if AContext.GetProperties.ObjVersionPropertyExist then
    LMsg := Format('Concurrency conflict persisting a "%s" entity with ID = %d, ObjVersion = %d on table "%s" using "%s" connection.',
      [AContext.GetClassRef.ClassName, AContext.GetID, AContext.ObjVersion, AContext.GetTable.TableName, AContext.GetTable.GetConnectionDefName])
  else
    LMsg := Format('Concurrency conflict persisting a "%s" entity with ID = %d on table "%s" using "%s" connection.',
      [AContext.GetClassRef.ClassName, AContext.GetID, AContext.GetTable.TableName, AContext.GetTable.GetConnectionDefName]);
  inherited Create(AClassName, AMethodName, LMsg);
end;

end.
