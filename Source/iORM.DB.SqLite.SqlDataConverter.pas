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



unit iORM.DB.SqLite.SqlDataConverter;

interface

uses
{$REGION 'System'}
  System.Rtti,
{$ENDREGION}
{$REGION 'iORM'}
  iORM.DB.Interfaces,
  iORM.Context.Properties.Interfaces,
  iORM.CommonTypes,
  iORM.Context.Interfaces
{$ENDREGION}
;

type

  // Classe che si occupa di convertire i dati per la compilazione
  //  dell'SQL
  TioSqlDataConverterSqLite = class(TioSqlDataConverter)
  strict protected
  public
    class function StringToSQL(const AString:String): String; override;
    class function FloatToSQL(const AFloat:Extended): String; override;
//    class function PropertyToFieldType(const AProp:IioContextProperty): String; override;
    class function TValueToSql(const AValue:TValue): String; override;
    class function QueryToTValue(const AQuery:IioQuery; const AProperty:IioContextProperty): TValue; override;
    class procedure SetQueryParamByContext(const AQuery:IioQuery; const AProp:IioContextProperty;const AContext:IioContext); override;
  end;

implementation

uses
{$REGION 'System'}
  System.SysUtils,
  System.StrUtils,
  System.TypInfo,
{$ENDREGION}
{$REGION 'Data'}
  Data.DB,
{$ENDREGION}
{$REGION 'FireDAC'}
  FireDAC.Stan.Param,
{$ENDREGION}
{$REGION 'iORM'}
  iORM.Attributes
{$ENDREGION}
;




{ TioSqlConverterSqLite }

class function TioSqlDataConverterSqLite.FloatToSQL(const AFloat: Extended): String;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings := TFormatSettings.Create;
  Result := AFloat.ToString;
  Result := ReplaceText(Result, FormatSettings.ThousandSeparator, #0);
  Result := ReplaceText(Result, FormatSettings.DecimalSeparator, Char('.'));
end;

//class function TioSqlDataConverterSqLite.PropertyToFieldType(
//  const AProp: IioContextProperty): String;
//begin
//  // According to the RelationType of the property...
//  case AProp.GetRelationType of
//    // Normal property, no relation, field type is by TypeKind of the property itself
//    ioRTNone: begin
//      case AProp.GetRttiType.TypeKind of
//        tkInt64, tkInteger, tkEnumeration: Result := 'INTEGER';
//        tkFloat: Result := 'REAL';
//        tkString, tkUString, tkWChar, tkLString, tkWString, tkChar: Result := 'TEXT';
//        tkClass, tkInterface: Result := 'BLOB';
//      end;
//    end;
//    // If it is an ioRTEmbedded property then the feld type is always BLOB
//    ioRTEmbeddedHasMany, ioRTEmbeddedHasOne: Result := 'BLOB';
//    // If it's a BelongsTo relation property then field type is always INTEGER
//    //  because the ID fields always are INTEGERS values
//    ioRTBelongsTo: Result := 'INTEGER';
//    // Otherwise return NULL field type
//    else Result := 'NULL';
//  end;
//end;

class function TioSqlDataConverterSqLite.QueryToTValue(const AQuery: IioQuery; const AProperty: IioContextProperty): TValue;
begin
  // If the field is null
  // HO levato questo controllo perch� nel caso in cui il campo fosse NULL mi dava un errore
  //  'Invalid Type cast' dovuto al fatto che il TValue da ritornare non veniva
  //  valorizzato per niente (nemmeno a NULL)
//  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull
//    then Exit;
  // Convert the field value to a TValue by TypeKind
  case AProperty.GetRttiType.TypeKind of
    tkInt64, tkInteger:
      Result := AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsInteger;
    tkFloat:
      Result := AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsFloat;
    tkString, tkUString, tkWChar, tkLString, tkWString, tkChar:
      Result := AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsString;
    tkEnumeration:
      Result := TValue.FromOrdinal(
                                    AProperty.GetRttiType.Handle,  // This is the PTypeInfo of the PropertyType
                                    AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsInteger  // This is the ordinal value
                                  );
  end;
end;

class procedure TioSqlDataConverterSqLite.SetQueryParamByContext(
  const AQuery: IioQuery; const AProp: IioContextProperty;
  const AContext: IioContext);
begin
  inherited;
  // If the property is of type TDateTime or TDate or TTime and the value is equal to
  //  zero then set che ParamValue to NULL
  if(   (AProp.GetTypeInfo = System.TypeInfo(TDateTime)) or (AProp.GetTypeInfo = System.TypeInfo(TDate)) or (AProp.GetTypeInfo = System.TypeInfo(TTime))   )
  and (AProp.GetValue(AContext.DataObject).AsExtended = 0)
  then
  begin
    AQuery.ParamByProp(AProp).Clear;
    AQuery.ParamByProp(AProp).DataType := TFieldType.ftFloat;
  end
  else
    AQuery.ParamByProp(AProp).Value := AProp.GetValue(AContext.DataObject).AsVariant;
end;

class function TioSqlDataConverterSqLite.StringToSQL(const AString: String): String;
begin
  Result := QuotedStr(AString);
end;

class function TioSqlDataConverterSqLite.TValueToSql(const AValue: TValue): String;
begin
  inherited;
  // Default
  Result := 'NULL';
  // In base al tipo
  case AValue.TypeInfo.Kind of
    // String
    tkString, tkChar, tkWChar, tkLString, tkWString, tkUString: Result := QuotedStr(AValue.ToString);
    // Integer
    tkInteger, tkInt64: Result := AValue.ToString;
    // Enumerated (boolean also)
    tkEnumeration: Result := AValue.AsOrdinal.ToString;
    // Se Float cerca di capire se � una data o similare, devo fare
    //  cos� perch� i TValue le date le esprimono come Float.
    tkFloat: begin
      if AValue.TypeInfo = System.TypeInfo(TDateTime)
        then Result := Self.FloatToSQL(AValue.AsExtended)
        else Result := Self.FloatToSQL(AValue.AsExtended);
    end;
  end;
{
NB: Tipi non ancora mappati
TTypeKind = (tkUnknown, tkSet, tkClass, tkMethod,
    tkVariant, tkArray, tkRecord, tkInterface, tkDynArray,
    tkClassRef, tkPointer, tkProcedure);
}
end;

end.
