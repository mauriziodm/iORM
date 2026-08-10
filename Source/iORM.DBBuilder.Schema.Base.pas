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
unit iORM.DBBuilder.Schema.Base;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  /// <summary>
  ///  Common ancestor for every schema element that carries a build Status (Schema, Table, Field,
  ///  FK, Index). It owns the monotonic Status invariant in ONE place so the rule cannot drift
  ///  across entities: Status only ever escalates (stClean -> stUpdate -> stCreate) and never
  ///  downgrades. This is load-bearing for tables in particular - a new table (stCreate) is set
  ///  Status := stUpdate once per changed member by the analyzer, and without the guard that would
  ///  downgrade it to stUpdate and it would be ALTERed instead of CREATEd. The GetStatus/SetStatus
  ///  are protected: they satisfy the Status member of each concrete IioDBBuilderSchema* interface
  ///  by inheritance.
  /// </summary>
  TioDBBuilderSchemaBaseObject = class(TInterfacedObject)
  protected
    FStatus: TioDBBuilderStatus;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
  end;

implementation

{ TioDBBuilderSchemaBaseObject }

function TioDBBuilderSchemaBaseObject.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

procedure TioDBBuilderSchemaBaseObject.SetStatus(const AValue: TioDBBuilderStatus);
begin
  // Monotonic: Status only escalates (stClean -> stUpdate -> stCreate), never downgrades. See the
  // class doc comment for why this is load-bearing (new-table stCreate must not be downgraded).
  if AValue > FStatus then
    FStatus := AValue;
end;

end.
