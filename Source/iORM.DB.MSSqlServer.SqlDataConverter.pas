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
unit iORM.DB.MSSqlServer.SqlDataConverter;

interface

uses
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, System.Rtti,
  iORM.Context.Interfaces, iORM.DB.Firebird.SqlDataConverter;

type

  // Classe che si occupa di convertire i dati per la compilazione
  // dell'SQL
  TioSqlDataConverterMSSqlServer = class(TioSqlDataConverterFirebird) // (TioSqlDataConverter)
  strict protected
  public
    class function TValueToSql(const AValue: TValue): String; override;
    class function FieldNameToSqlFieldName(const AFieldName: string): string; override;
  end;

implementation

uses
  System.TypInfo, System.SysUtils, Data.DB, iORM.CommonTypes;

{ TioSqlDataConverterMSSqlServer }

class function TioSqlDataConverterMSSqlServer.FieldNameToSqlFieldName(const AFieldName: string): string;
begin
  Result := '[' + AFieldName + ']';
end;

class function TioSqlDataConverterMSSqlServer.TValueToSql(const AValue: TValue): String;
begin
  // Usa il risultato della classe antenata e ne modifica il risultato solo in
  // caso di DateTime
  Result := inherited TValueToSql(AValue);
  // If the value is of type TDateTime...
  if (AValue.TypeInfo.Kind = tkFloat) then
    if (AValue.TypeInfo = System.TypeInfo(TDate)) then
      Result := QuotedStr(FormatDateTime('yyyymmdd', AValue.AsExtended))
    else if (AValue.TypeInfo = System.TypeInfo(TTime)) then
      Result := QuotedStr(FormatDateTime('hh:nn:ss', AValue.AsExtended))
    else if (AValue.TypeInfo = System.TypeInfo(TDateTime)) or (AValue.TypeInfo = System.TypeInfo(TioObjUpdated)) or (AValue.TypeInfo = System.TypeInfo(TioObjCreated)) then
      Result := QuotedStr(FormatDateTime('yyyymmdd hh:nn:ss', AValue.AsExtended));
end;

end.
