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
unit iORM.ETM.Factory;

interface

uses
  iORM.ETM.Interfaces, DJSON.Params;

type

  TioEtmFactory = class
  private
    class var FdjParamsDiff: IdjParams;
    class var FdjParamsEngine: IdjParams;
    class procedure Build;
  public
    class function djParamsDiff: IdjParams;
    class function djParamsEngine: IdjParams;
    class function Diff(const ADiffMode: TioEtmDiffMode = dmOneway): TioEtmDiffRef;
  end;

implementation

uses
  iORM.ETM.Diff.Oneway, iORM.Exceptions, DJSON;

{ TioEtmFactory }

class procedure TioEtmFactory.Build;
begin
  // djParams for etm engine operations
  FdjParamsEngine := dj.Default;
  FdjParamsEngine.OpType := TdjSkipScope.ssETM;
  FdjParamsEngine.SerializationType := stFields;
  FdjParamsEngine.SerializationMode := smJavaScript;
  FdjParamsEngine.TypeAnnotations := True;
  FdjParamsEngine.ClearCollection := True;
  FdjParamsEngine.TimeMillisec := False;
  FdjParamsEngine.TimePrefix := '';
  FdjParamsEngine.TimeZulu := '';
  // djParams for etm diff operations
  FdjParamsDiff := dj.Default;
  FdjParamsDiff.OpType := TdjSkipScope.ssETM;
  FdjParamsDiff.SerializationType := stFields;
  FdjParamsDiff.SerializationMode := smJavaScript;
  FdjParamsDiff.TypeAnnotations := False;
  FdjParamsDiff.ClearCollection := False;
  FdjParamsDiff.TimeMillisec := False;
  FdjParamsDiff.TimePrefix := '';
  FdjParamsDiff.TimeZulu := '';
end;

class function TioEtmFactory.Diff(const ADiffMode: TioEtmDiffMode): TioEtmDiffRef;
begin
  case ADiffMode of
    dmOneway:
      Result := TioEtmOnewayDiff;
//    dmTwoway:
//      ;
    else
      raise EioEtmException.Create(ClassName, 'Diff', 'Invalid DiffMode.');
  end;
end;

class function TioEtmFactory.djParamsDiff: IdjParams;
begin
  Result := FdjParamsDiff;
end;

class function TioEtmFactory.djParamsEngine: IdjParams;
begin
  Result := FdjParamsEngine;
end;

initialization

  TioEtmFactory.Build;

end.
