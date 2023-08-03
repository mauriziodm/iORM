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
  iORM.ETM.Interfaces;

type

  TioEtmFactory = class
  public
    class function Diff(const ADiffMode: TioEtmDiffMode = dmOneway): TioEtmDiffRef;
  end;

implementation

uses
  iORM.ETM.Diff.Oneway, iORM.Exceptions;

{ TioEtmFactory }

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

end.
