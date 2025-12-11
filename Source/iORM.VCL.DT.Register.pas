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
unit iORM.VCL.DT.Register;

interface

procedure Register;

implementation

uses
  System.Classes,
  System.Actions,

  iORM.Abstraction.VCL,
  iORM.StdActions.VCL

  ;




procedure Register;
begin
  // Abstraction layer components
  RegisterComponents('iORM - Abstraction layer', [TioVCL]);

  // VCL standard actions
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSSelectCurrent], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSShowOrSelect], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSCloseQuery], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSAppend], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSPersistenceClear], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSDelete], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSInsert], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSPersistencePersist], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSPersistenceReload], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSPersistenceRevert], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSPersistenceRevertOrDelete], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Vcl.TioBS_ETM_RevertToObject], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Vcl.TioBS_ETM_RevertToBindSource], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Vcl.TioBSNextPage], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Vcl.TioBSPrevPage], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Vcl.TioBSBuildWhere], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Vcl.TioBSClearWhere], nil);
  RegisterActions('iORM - MVVM', [iORM.StdActions.Vcl.TioViewAction], nil);
  RegisterActions('iORM - Synchronization', [iORM.StdActions.Vcl.TioDoSynchronization], nil);
//  // VCL standard actions
//  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSSelectCurrent], nil);
//  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSShowOrSelect], nil);
//  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSCloseQuery], nil);
//  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Vcl.TioBS_ETM_RevertToObject], nil);
//  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Vcl.TioBS_ETM_RevertToBindSource], nil);
//  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Vcl.TioBSNextPage], nil);
//  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Vcl.TioBSPrevPage], nil);
//  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Vcl.TioBSBuildWhere], nil);
//  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Vcl.TioBSClearWhere], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceAppend], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceClear], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceDelete], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceInsert], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistencePersist], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceReload], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceRevert], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceRevertOrDelete], nil);
//  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceSaveRevertPoint], nil);
//  RegisterActions('iORM - MVVM', [iORM.StdActions.Vcl.TioViewAction], nil);
//  RegisterActions('iORM - Synchronization', [iORM.StdActions.Vcl.TioDoSynchronization], nil);
end;

end.
