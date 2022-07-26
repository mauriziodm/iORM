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





unit DJSON.TypeInfoCache;

interface

uses
  DJSON.Duck.Interfaces, System.Generics.Collections;

type

  TdjDuckType = (dtNone=0, dtList, dtStreamable, dtDictionary, dtStream);

  TdjTypeInfoCacheItem = class
  public
    DuckType: TdjDuckType;
    DuckListWrapper: IdjDuckList;
    DuckStreamableWrapper: IdjDuckStreamable;
    DuckDictionaryWrapper: IdjDuckDictionary;
  end;

  TdjTypeInfoCacheInternalContainer = TObjectDictionary<String, TdjTypeInfoCacheItem>;
  TdjTypeInfoCache = class
  private
    FInternatContainer: TdjTypeInfoCacheInternalContainer;
    FEnabled: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(const AObj:TObject): TdjTypeInfoCacheItem;
    property Enabled:Boolean read FEnabled write FEnabled;
  end;

implementation

uses
  DJSON.Factory, System.Classes;

{ TdjTypeInfoCache }

constructor TdjTypeInfoCache.Create;
begin
  inherited;
  FEnabled := True;
  FInternatContainer := TdjTypeInfoCacheInternalContainer.Create([doOwnsValues]);
end;

destructor TdjTypeInfoCache.Destroy;
begin
  FInternatContainer.Free;
  inherited;
end;

function TdjTypeInfoCache.Get(const AObj: TObject): TdjTypeInfoCacheItem;
begin
  if FEnabled and FInternatContainer.TryGetValue(AObj.ClassName, Result) then
  begin
    case Result.DuckType of
      dtList: Result.DuckListWrapper.SetObject(AObj);
      dtStreamable: Result.DuckStreamableWrapper.SetObject(AObj);
      dtDictionary: Result.DuckDictionaryWrapper.SetObject(AObj);
      dtStream:;
      dtNone:;
    end;
  end
  else
  begin
    Result := TdjTypeInfoCacheItem.Create;
    if AObj is TStream then
      Result.DuckType := TdjDuckType.dtStream
    else
    if TdjFactory.TryWrapAsDuckDictionary(AObj, Result.DuckDictionaryWrapper) then
      Result.DuckType := TdjDuckType.dtDictionary
    else
    if TdjFactory.TryWrapAsDuckList(AObj, Result.DuckListWrapper) then
      Result.DuckType := TdjDuckType.dtList
    else
    if TdjFactory.TryWrapAsDuckStreamable(AObj, Result.DuckStreamableWrapper) then
      Result.DuckType := TdjDuckType.dtStreamable
    else
      Result.DuckType := TdjDuckType.dtNone;
    // Add to the container if enabled
    if FEnabled then
      FInternatContainer.Add(AObj.ClassName, Result);
  end;
end;

end.
