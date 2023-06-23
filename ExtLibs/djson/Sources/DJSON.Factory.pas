{
  ****************************************************************************
  *                                                                          *
  *           DJSON - (Delphi JSON library)                                  *
  *                                                                          *
  *           Copyright (C) 2016-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/DSON.git                         *
  *                                                                          *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of DJSON (Delphi JSON library).                        *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  * you may not use this file except in compliance with the License.         *
  *                                                                          *
  * DJSON is free software: you can redistribute it and/or modify            *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * DJSON is distributed in the hope that it will be useful,                 *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with DJSON.  If not, see <http://www.gnu.org/licenses/>.           *
  *                                                                          *
  ****************************************************************************
}
unit DJSON.Factory;

interface

uses
  DJSON.Params, DJSON.Duck.Interfaces;

type

  TdjFactory = class
  public
    class function NewParams: IdjParams;
    class function GetEngine(const AEngineType:TdjEngine): TdjEngineRef;
    class function TryWrapAsDuckStreamable(const AObjAsDuck: TObject; out ResultDuckStreamable:IdjDuckStreamable): Boolean;
    class function TryWrapAsDuckList(const AObjAsDuck: TObject; out ResultDuckList:IdjDuckList): Boolean;
    class function TryWrapAsDuckDictionary(const AObjAsDuck: TObject; out ResultDuckDictionary:IdjDuckDictionary): Boolean;
  end;

implementation

uses
  DJSON.Duck.Dictionary, DJSON.Duck.List, DJSON.Duck.Obj, DJSON.Engine.Stream,
  DJSON.Engine.DOM, DJSON.Exceptions;

{ TdjFactory }

class function TdjFactory.GetEngine(
  const AEngineType: TdjEngine): TdjEngineRef;
begin
  case AEngineType of
    TdjEngine.eDelphiStream:  Result := TdjEngineStream;
    TdjEngine.eDelphiDOM:     Result := TdjEngineDOM;
  else
    raise EdjException.Create('TdjFactory: Wrong engine type.');
  end;
end;

class function TdjFactory.NewParams: IdjParams;
begin
  Result := TdjParams.Create;
end;

class function TdjFactory.TryWrapAsDuckDictionary(const AObjAsDuck: TObject;
  out ResultDuckDictionary: IdjDuckDictionary): Boolean;
begin
  ResultDuckDictionary := TdjDuckDictionary.TryCreate(AObjAsDuck);
  Result := Assigned(ResultDuckDictionary);
end;

class function TdjFactory.TryWrapAsDuckList(const AObjAsDuck: TObject;
  out ResultDuckList: IdjDuckList): Boolean;
begin
  ResultDuckList := TdjDuckList.TryCreate(AObjAsDuck);
  Result := Assigned(ResultDuckList);
end;

class function TdjFactory.TryWrapAsDuckStreamable(const AObjAsDuck: TObject;
  out ResultDuckStreamable: IdjDuckStreamable): Boolean;
begin
  ResultDuckStreamable := TdjDuckStreamable.TryCreate(AObjAsDuck);
  Result := Assigned(ResultDuckStreamable);
end;

end.
