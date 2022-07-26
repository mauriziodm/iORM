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





unit DJSON.Duck.PropField;

interface

uses
  System.Rtti, DJSON.Params;

type

  TdjDuckPropFieldType = (ptInvalid, ptProperty, ptField);

  TdjDuckPropField = class
  public
    class function IsValidPropField(const ARttiType: TRttiNamedObject): Boolean; static;
    class function GetPropFieldType(const ARttiType: TRttiNamedObject): TdjDuckPropFieldType; static;
    class function GetValue(const Instance: TObject; const ARttiType: TRttiNamedObject): TValue; static;
    class procedure SetValue(const Instance: TObject; const ARttiType: TRttiNamedObject; const AValue: TValue; const AParams:IdjParams); static;
    class function RttiType(const ARttiType: TRttiNamedObject): TRttiType; static;
    class function IsWritable(const ARttiType: TRttiNamedObject): Boolean; static;
    class function QualifiedName(const ARttiType: TRttiNamedObject): String; static;
    class function TypeKind(const ARttiType: TRttiNamedObject): TTypeKind; static;
    class function IsNotAnArray(const ARttiType: TRttiNamedObject): Boolean; static;
  end;

implementation

uses
  DJSON.Exceptions, System.TypInfo;

{ TdjDuckPropField }

class function TdjDuckPropField.GetPropFieldType(const ARttiType: TRttiNamedObject): TdjDuckPropFieldType;
begin
  if ARttiType is TRttiProperty then
    Result := ptProperty
  else if ARttiType is TRttiField then
    Result := ptField
  else
    Result := ptInvalid;
end;

class function TdjDuckPropField.GetValue(const Instance: TObject; const ARttiType: TRttiNamedObject): TValue;
begin
  case GetPropFieldType(ARttiType) of
    ptField:
      Result := TRttiField(ARttiType).GetValue(Instance);
    ptProperty:
      Result := TRttiProperty(ARttiType).GetValue(Instance);
  else
      raise EdsonDuckException.CreateFmt('Invalid prop/field type $s', [ARttiType.Name]);
  end;
end;

class function TdjDuckPropField.IsNotAnArray(
  const ARttiType: TRttiNamedObject): Boolean;
var
  LTypeKind: TTypeKind;
begin
  LTypeKind := RttiType(ARttiType).TypeKind;
  Result := (LTypeKind <> tkArray) and (LTypeKind <> tkDynArray);
end;

class function TdjDuckPropField.IsValidPropField(
  const ARttiType: TRttiNamedObject): Boolean;
begin
  Result := Assigned(ARttiType) and (GetPropFieldType(ARttiType) <> ptInvalid);
end;

class function TdjDuckPropField.IsWritable(const ARttiType: TRttiNamedObject): Boolean;
begin
  case GetPropFieldType(ARttiType) of
    ptField:
      Result := True;
    ptProperty:
      Result := TRttiProperty(ARttiType).IsWritable;
  else
    Result := False;
  end;
end;

class function TdjDuckPropField.QualifiedName(
  const ARttiType: TRttiNamedObject): String;
begin
  Result := RttiType(ARttiType).QualifiedName;
end;

class function TdjDuckPropField.RttiType(const ARttiType: TRttiNamedObject): TRttiType;
begin
  case GetPropFieldType(ARttiType) of
    ptField:
      Result := TRttiField(ARttiType).FieldType;
    ptProperty:
      Result := TRttiProperty(ARttiType).PropertyType;
  else
    Result := ARttiType as TRttiType;
  end;
end;

class procedure TdjDuckPropField.SetValue(const Instance: TObject; const ARttiType: TRttiNamedObject; const AValue: TValue; const AParams:IdjParams);
// --------------- TEST FOR OPTIMIZATION (for properties only, no fields) --------------------
//var
//  LPropInfo: PPropInfo;
// --------------- TEST FOR OPTIMIZATION (for properties only, no fields) --------------------
begin

  // NB: Il parametro AParams è stato aggiunto a questo metodo per fare delle prove di ottimizzazione in cui serviva
  //      ma normalmente non servirebbe quindi alla fine delle prove se non dovesse essere più necessario meglio
  //      eliminarlo



  case GetPropFieldType(ARttiType) of
    ptField:
      TRttiField(ARttiType).SetValue(Instance, AValue);
    ptProperty:
      TRttiProperty(ARttiType).SetValue(Instance, AValue);
  else
      raise EdsonDuckException.CreateFmt('Invalid prop/field type $s', [ARttiType.Name]);
  end;




// --------------- TEST FOR OPTIMIZATION (for properties only, no fields) --------------------
//  LPropInfo := TRttiInstanceProperty(ARttiType).PropInfo;
//  LPropInfo := AParams.PropInfoCache.GetPropInfo(ARttiType);
//  case LPropInfo.PropType^.Kind of
//    tkString, tkLString, tkWString, tkUString:
//      SetStrProp(Instance, LPropInfo, AValue.AsString);
//    tkInteger, tkInt64:
//      SetOrdProp(Instance, LPropInfo, AValue.AsOrdinal);
//      SetOrdProp(Instance, LPropInfo, 999);
//  end;
// --------------- TEST FOR OPTIMIZATION (for properties only, no fields) --------------------
end;

class function TdjDuckPropField.TypeKind(const ARttiType: TRttiNamedObject): TTypeKind;
begin
  Result := RttiType(ARttiType).TypeKind;
end;

end.
