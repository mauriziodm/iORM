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
unit iORM.ConflictStrategy.RaiseManual;

interface

uses
  iORM.ConflictStrategy.Interfaces, iORM.Context.Interfaces;

type

  TioRaiseManualConflictStrategy = class(TioCustomConflictStrategy)
  public
    class procedure CheckConflict(const AContext: IioContext; var AConflictDetected: Boolean); override;
    class procedure ResolveConflict(const AContext: IioContext); override;
  end;


implementation

uses
  iORM.Exceptions;

{ TioRaiseManualConflictStrategy }

class procedure TioRaiseManualConflictStrategy.CheckConflict(const AContext: IioContext; var AConflictDetected: Boolean);
begin
  inherited;
  // To be implemented
end;

class procedure TioRaiseManualConflictStrategy.ResolveConflict(const AContext: IioContext);
begin
  raise EioConcurrencyConflictException.Create(ClassName, 'ResolveConflict', AContext);
end;

end.