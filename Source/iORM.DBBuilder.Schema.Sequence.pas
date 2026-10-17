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
unit iORM.DBBuilder.Schema.Sequence;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Schema.Base;

type

  /// <summary>
  ///  A sequence (generator) node of either branch of the schema diff: one class, one constructor, since a
  ///  Mapped sequence (offered by a table that uses kgsSequence) and a Physical one (read from the catalog)
  ///  carry exactly the same data - just a name. Name/SqlName are frozen at construction through the
  ///  connection's NormalizeSqlIdentifier, the same normalization TioDBBuilderSchemaTable.CreatePhysical
  ///  applies, so both branches compare like-for-like.
  ///  The name is deliberately NEVER shortened to fit the dialect's identifier length limit: the runtime
  ///  asks for the sequence by its original name (Firebird: SELECT GEN_ID(<IioTable.GetKeyGenerator>, 1)),
  ///  so a shortened sequence would exist in the DB but never be found at INSERT time. It is treated like a
  ///  table name instead - and the default sequence name IS the table name (IioTable.GetKeyGenerator), so it
  ///  has the same limit: only an explicit [ioKeySequence] can exceed it, and then the DB itself rejects the
  ///  CREATE SEQUENCE, exactly as it rejects an over-long table name.
  /// </summary>
  TioDBBuilderSchemaSequence = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaSequence)
  private
    FName: String;
    FSqlName: String;

    function GetName: String;
    function GetSqlName: String;
  protected
  public
    constructor Create(const AConnectionDefName, AName: String);
  end;

implementation

uses
  System.SysUtils, iORM.DB.Factory, iORM.Exceptions;

{ TioDBBuilderSchemaSequence }

constructor TioDBBuilderSchemaSequence.Create(const AConnectionDefName, AName: String);
begin
  inherited Create;
  if AName.Trim.IsEmpty then
    raise EioDBBuilderException.Create(ClassName, 'Create', Format('Invalid sequence name "%s"', [AName]));
  FName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AName, False);  // Case normalized, no delimiters
  FSqlName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AName, True);  // Case normalized + delimiters
end;

function TioDBBuilderSchemaSequence.GetName: String;
begin
  Result := FName;
end;

function TioDBBuilderSchemaSequence.GetSqlName: String;
begin
  Result := FSqlName;
end;

end.
