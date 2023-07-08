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
unit iORM.ETM.Engine;

interface

type

  // Esempi di chiamate:

  // io.etm.TimeTravelFor<TCustomer>(const AID: Integer; const AWhere: IioWhere = nil): TList<IioEtmTimeSlot>;
  // io.etm.TimeTravelFor(const AObj: TObject; const AWhere: IioWhere = nil): TList<IioEtmTimeSlot>; // Where per filtrare per date o versioni ad esempio
  // io.etm.TimeTravelFor(const AIntf: IInterface; const AWhere: IioWhere = nil): TList<IioEtmTimeSlot>;
  // io.etm.TimeTravelFor<>().ToList.OfType<TList<IioEtmTimeSlot>>;
  // io.etm.TimeTravelFor<>().ToList(const AList: TObject);
  // io.etm.TimeTravelFor<>().ToList(const AList: IInterface);

  TIoEtmEngine = class
  public
    // function TimeTravelFor(const AObj: TObject; const AWhere: IioWhere): TList<IioEtmTimeSlot>;
  end;

implementation

end.
