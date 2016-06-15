{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.DB.Firebird.SqlDataConverter;

interface

uses
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, System.Rtti,
  iORM.DB.SqLite.SqlDataConverter;

type

  // Classe che si occupa di convertire i dati per la compilazione
  //  dell'SQL
  TioSqlDataConverterFirebird = class(TioSqlDataConverterSqLite)  // (TioSqlDataConverter)
  strict protected
  public
    class function TValueToSql(const AValue:TValue): String; override;
  end;

implementation

uses
  System.TypInfo, System.SysUtils;

{ TioSqlConverterSqLite }

class function TioSqlDataConverterFirebird.TValueToSql(const AValue: TValue): String;
begin
  // Usa il risultato della classe antenata e ne modifica il risultato solo in
  //  caso di DateTime
  Result := inherited TValueToSql(AValue);
  // If the value is of type TDateTime...
  if (AValue.TypeInfo.Kind = tkFloat) and (AValue.TypeInfo = System.TypeInfo(TDateTime)) then
    Result := FormatDateTime('mm/dd/yyyy hh:nn:ss', AValue.AsExtended);
end;

end.
