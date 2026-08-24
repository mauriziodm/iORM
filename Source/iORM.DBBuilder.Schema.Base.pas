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
  ///  downgrade it to stUpdate and it would be ALTERed instead of CREATEd. FStatus is private: the
  ///  guard would be bypassable if a descendant could write the field directly, so even descendants
  ///  go exclusively through the protected Status property. The GetStatus/SetStatus are protected:
  ///  they also satisfy the Status member of each concrete IioDBBuilderSchema* interface by
  ///  inheritance. The initial value (stClean) is set here too, in the constructor, rather than
  ///  left to each descendant to repeat (or, worse, to the zero-initialization of FStatus's
  ///  underlying ordinal happening to coincide with stClean) - every descendant constructor must
  ///  call "inherited Create" to get it.
  /// </summary>
  TioDBBuilderSchemaBaseObject = class(TInterfacedObject)
  private
    FStatus: TioDBBuilderStatus;
  protected
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);

    // Protected, not public: this does NOT mirror any descendant's own public interface (it is
    // declared once here, for the whole family, purely for internal/descendant convenience - see
    // the "Interface & Class Conventions" note in CLAUDE.md). Descendants use it as Status := X /
    // X := Status instead of calling GetStatus/SetStatus directly.
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  public
    constructor Create;
  end;

implementation

{ TioDBBuilderSchemaBaseObject }

constructor TioDBBuilderSchemaBaseObject.Create;
begin
  inherited Create;
  FStatus := stClean;
end;

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
