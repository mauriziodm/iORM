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
unit iORM.DBBuilder.Strategy.Firebird;

interface

uses
  iORM.DBBuilder.Strategy.WithAlterTable;

type

  /// <summary>
  /// Firebird-specific DBBuilder strategy. Inherits the common ALTER TABLE DDL mechanics from
  /// TioDBBuilderStrategyWithAlterTable and adds nothing of its own: every Firebird-specific trait
  /// (invalid field-type conversions, key-generation compatibility) lives on the SqlGenerator axis
  /// (TioDBBuilderSqlGenFirebird), where DBMS capability knowledge belongs. Kept as an empty, named
  /// placeholder for symmetry with the other per-DBMS strategies and as the seam to reintroduce
  /// should Firebird ever need DDL-mechanic-specific behavior.
  /// </summary>
  TioDBBuilderStrategyFirebird = class(TioDBBuilderStrategyWithAlterTable)
  end;

implementation

end.
