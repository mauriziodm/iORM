{***************************************************************************}
{                                                                           }
{           DJSON - (Delphi JSON library)                                   }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/DSON.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of DJSON (Delphi JSON library).                        }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  DJSON is free software: you can redistribute it and/or modify            }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  DJSON is distributed in the hope that it will be useful,                 }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with DJSON.  If not, see <http://www.gnu.org/licenses/>.           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This project is based off of the ObjectsMappers unit included with the   }
{  Delphi MVC Framework project by Daniele Teti and the DMVCFramework Team. }
{                                                                           }
{***************************************************************************}





unit DJSON.Engine.Stream.BSON;

interface

uses
{$REGION 'System'}
  System.Rtti,
  System.Classes,
{$ENDREGION}
{$REGION 'DJSON'}
  DJSON.Engine.Stream,
  DJSON.Params
{$ENDREGION}
;

type

  TdjEngineStreamBSON = class(TdjEngineStream)
  public
    class function Serialize(const AValue: TValue; const APropField: TRttiNamedObject; const AParams: IdjParams; const AEnableCustomSerializers:Boolean=True): TBytesStream; reintroduce;
    class function Deserialize(const AByteStream:TStream; const AValueType: TRttiType; const APropField: TRttiNamedObject; const AMaster: TValue; const AParams: IdjParams): TValue; reintroduce;
  end;

implementation

uses
{$REGION 'System'}
  System.JSON.BSON,
  System.JSON.Types,
  System.TypInfo,
{$ENDREGION}
{$REGION 'DJSON'}
  DJSON.Exceptions
{$ENDREGION}
  ;

{ TdjEngineStreamBSON }

class function TdjEngineStreamBSON.Deserialize(const AByteStream: TStream;
  const AValueType: TRttiType; const APropField: TRttiNamedObject;
  const AMaster: TValue; const AParams: IdjParams): TValue;
var
  LBSONReader: TBSONReader;
begin
  Result := TValue.Empty;
  AByteStream.Position := 0;
  LBSONReader := TBSONReader.Create(AByteStream);
  try
    if AParams.BsonRoot then
    begin
      LBSONReader.Read;
      if not (LBSONReader.Read and (LBSONReader.TokenType = TJsonToken.PropertyName) and (LBSONReader.Value.AsString = AParams.BsonRootLabel)) then
        raise EdjEngineError.Create('BSON engine: Root object label expected (' + AParams.BsonRootLabel + ')');
    end;
    if LBSONReader.Read then
      Result := DeserializePropField(LBSONReader, AValueType, APropField, AMaster, AParams);
  finally
    LBSONReader.Free;
  end;
end;

class function TdjEngineStreamBSON.Serialize(const AValue: TValue;
  const APropField: TRttiNamedObject; const AParams: IdjParams;
  const AEnableCustomSerializers: Boolean): TBytesStream;
var
  LBSONWriter: TBsonWriter;
begin
  Result := TBytesStream.Create;
  LBSONWriter := TBsonWriter.Create(Result);
  try
    if AParams.BsonRoot then
    begin
      LBSONWriter.WriteStartObject;
      LBSONWriter.WritePropertyName(AParams.BsonRootLabel);
    end;
    SerializePropField(LBSONWriter, AValue, APropField, AParams, AEnableCustomSerializers);
    if AParams.BsonRoot then
      LBSONWriter.WriteEndObject;
    Result.Position := 0;
  finally
    LBSONWriter.Free;
  end;
end;

end.
