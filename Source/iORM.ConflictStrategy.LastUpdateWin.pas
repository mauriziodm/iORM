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
unit iORM.ConflictStrategy.LastUpdateWin;

interface

uses
  iORM.ConflictStrategy.Interfaces, iORM.Context.Interfaces;

type

  TioLastUpdateWin = class(TioCustomConflictStrategy)
  private
    class function ConflictConfirmed(const AContext: IioContext): Boolean;
  public
    // If a conflict is detected then this method is called from the persistence strategy to try to resolve the conflict
    // Note: the conflict strategy MUST RESOLVE the conflict or raise an exception
    class procedure ResolveDeleteConflict(const AContext: IioContext); override;
    class procedure ResolveUpdateConflict(const AContext: IioContext); override;
  end;

implementation

uses
  iORM, iORM.Where.Interfaces, iORM.Where.Factory, iORM.CommonTypes;

{ TioLastUpdateWin }

class function TioLastUpdateWin.ConflictConfirmed(const AContext: IioContext): Boolean;
begin
  // If the obj in the DB is newer than the one being persisted then the conflict is confirmed, otherwise the conflict is considered resolved
  Result := io.Exists(AContext.Map.GetClassName, io.Where(AContext.GetProperties.GetIdProperty.GetName, coEquals, AContext.GetID)
    ._And(AContext.GetProperties.ObjUpdatedProperty.GetName, coGreater, AContext.ObjUpdated));
end;

class procedure TioLastUpdateWin.ResolveDeleteConflict(const AContext: IioContext);
begin
  AContext.PersistenceConflictDetected := ConflictConfirmed(AContext);
  if AContext.PersistenceConflictDetected then
    inherited;
end;

class procedure TioLastUpdateWin.ResolveUpdateConflict(const AContext: IioContext);
begin
  AContext.PersistenceConflictDetected := ConflictConfirmed(AContext);
  if AContext.PersistenceConflictDetected then
    inherited;
end;

end.
