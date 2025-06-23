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
unit iORM.FMX.DT.Register;

interface

procedure Register;

implementation

uses
  System.Classes,
  System.Actions,

  iORM.Abstraction.FMX,
  iORM.StdActions.FMX


  ;




procedure Register;
begin
  // Abstraction layer components
  RegisterComponents('iORM - Abstraction layer', [TioFMX]);

  // FMX standard actions
  RegisterActions('iORM - BS', [iORM.StdActions.Fmx.TioBSSelectCurrent], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Fmx.TioBSShowOrSelect], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Fmx.TioBSCloseQuery], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Fmx.TioBS_ETM_RevertToObject], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Fmx.TioBS_ETM_RevertToBindSource], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Fmx.TioBSNextPage], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Fmx.TioBSPrevPage], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Fmx.TioBSBuildWhere], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Fmx.TioBSClearWhere], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceAppend], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceClear], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceDelete], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceInsert], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistencePersist], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceReload], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceRevert], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceRevertOrDelete], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM - MVVM', [iORM.StdActions.Fmx.TioViewAction], nil);
  RegisterActions('iORM - Synchronization', [iORM.StdActions.Fmx.TioDoSynchronization], nil);
end;

end.
