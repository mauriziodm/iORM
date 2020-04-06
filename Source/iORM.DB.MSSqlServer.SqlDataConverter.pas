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
  System.TypInfo, System.SysUtils, Data.DB;

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
    else if (AValue.TypeInfo = System.TypeInfo(TDateTime)) then
      Result := QuotedStr(FormatDateTime('yyyymmdd hh:nn:ss', AValue.AsExtended));
end;

end.
