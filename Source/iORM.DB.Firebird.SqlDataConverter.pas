{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



unit iORM.DB.Firebird.SqlDataConverter;

interface

uses
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, System.Rtti,
  iORM.DB.SqLite.SqlDataConverter, iORM.Context.Interfaces;

type

  // Classe che si occupa di convertire i dati per la compilazione
  //  dell'SQL
  TioSqlDataConverterFirebird = class(TioSqlDataConverterSqLite)  // (TioSqlDataConverter)
  strict protected
  public
    class function TValueToSql(const AValue:TValue): String; override;
    class procedure SetQueryParamByContext(const AQuery:IioQuery; const AProp:IioContextProperty;const AContext:IioContext); override;
  end;

implementation

uses
  System.TypInfo, System.SysUtils, Data.DB;

{ TioSqlDataConverterFirebird }

class procedure TioSqlDataConverterFirebird.SetQueryParamByContext(
  const AQuery: IioQuery; const AProp: IioContextProperty;
  const AContext: IioContext);
begin
  // TDateTime (NULL is zero)
  if (AProp.GetTypeInfo = System.TypeInfo(TDateTime)) then
  begin
    AQuery.ParamByProp(AProp).AsDateTime := AProp.GetValue(AContext.DataObject).AsType<TDateTime>;
    if AQuery.ParamByProp(AProp).AsExtended = 0 then
    begin
      AQuery.ParamByProp(AProp).Clear;
      AQuery.ParamByProp(AProp).DataType := TFieldType.ftDateTime;
    end;
  end
  // TDate (NULL is zero)
  else
  if (AProp.GetTypeInfo = System.TypeInfo(TDate)) then
  begin
    AQuery.ParamByProp(AProp).AsDate := AProp.GetValue(AContext.DataObject).AsType<TDate>;
    if AQuery.ParamByProp(AProp).AsExtended = 0 then
    begin
      AQuery.ParamByProp(AProp).Clear;
      AQuery.ParamByProp(AProp).DataType := TFieldType.ftDate;
    end;
  end
  // TTime (NULL is zero)
  else
  if (AProp.GetTypeInfo = System.TypeInfo(TTime)) then
  begin
    AQuery.ParamByProp(AProp).AsTime := AProp.GetValue(AContext.DataObject).AsType<TTime>;
    if AQuery.ParamByProp(AProp).AsExtended = 0 then
    begin
      AQuery.ParamByProp(AProp).Clear;
      AQuery.ParamByProp(AProp).DataType := TFieldType.ftTime;
    end;
  end
  // Other value types inherits from ancestor
  else
    inherited;
end;

class function TioSqlDataConverterFirebird.TValueToSql(const AValue: TValue): String;
begin
  // Usa il risultato della classe antenata e ne modifica il risultato solo in
  // caso di DateTime
  Result := inherited TValueToSql(AValue);
  // If the value is of type TDateTime...
  if (AValue.TypeInfo.Kind = tkFloat) then
    if (AValue.TypeInfo = System.TypeInfo(TDate)) then
      Result := QuotedStr(FormatDateTime('mm/dd/yyyy', AValue.AsExtended))
    else if (AValue.TypeInfo = System.TypeInfo(TTime)) then
      Result := QuotedStr(FormatDateTime('hh:nn:ss', AValue.AsExtended))
    else if (AValue.TypeInfo = System.TypeInfo(TDateTime)) then
      Result := QuotedStr(FormatDateTime('mm/dd/yyyy hh:nn:ss', AValue.AsExtended));
end;

end.
