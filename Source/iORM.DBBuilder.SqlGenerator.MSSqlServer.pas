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
unit iORM.DBBuilder.SqlGenerator.MSSqlServer;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces, iORM.Attributes;

const
  CONNECTION_NAME_MSSQL_MASTER = 'MSSQL_MASTER';

  INVALID_FIELDTYPE_CONVERSIONS = '[datetime->decimal][datetime->numeric][datetime->int][date->decimal][date->numeric][date->int]' +
    '[time->numeric][time->decimal][time->int][varchar->decimal][varchar->int][varchar->date][varchar->time][varchar->datetime]' +
    '[nvarchar->decimal][nvarchar->int][nvarchar->date][nvarchar->time][nvarchar->datetime] [char->decimal][char->int][char->date]+' +
    '[char->time][char->datetime][nchar->decimal][nchar->int][nchar->date][nchar->time][nchar->datetime]';

type

  TioDBBuilderSqlGenMSSqlServer = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGenerator)
    // To be implemented
  end;

implementation

end.
