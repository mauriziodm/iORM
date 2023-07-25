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
unit iORM.ETM.Interceptor;

interface

uses
  iORM.Interceptor.CRUD, iORM.Context.Interfaces, iORM.DB.Interfaces;

type

  TioEtmInterceptor = class(TioCustomCRUDInterceptor)
  public
    // Insert
    class procedure AfterInsert(const AContext: IioContext; const AQuery: IioQuery); override;
    // Update
    class procedure BeforeUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean); override;
    class procedure AfterUpdate(const AContext: IioContext; const AQuery: IioQuery); override;
    // Delete
    class procedure AfterDelete(const AContext: IioContext; const AQuery: IioQuery); override;
  end;

implementation

uses
  iORM, DJSON, iORM.ETM.Repository, iORM.CommonTypes;

{ TioEtmInterceptor }

class procedure TioEtmInterceptor.AfterInsert(const AContext: IioContext; const AQuery: IioQuery);
var
  LRepository: TioEtmCustomRepository;
begin
  // Create the repository item, persist it and finally free it
  LRepository := AContext.Map.GetTable.GetEtmRepositoryClass.Create(etInsert, ctNoConflict, AContext.GetID, AContext.DataObject.ClassName, 0, '', '');
  try
    io.Persist(LRepository);
  finally
    LRepository.Free;
  end;
end;

class procedure TioEtmInterceptor.BeforeUpdate(const AContext: IioContext; const AQuery: IioQuery; var ADone: Boolean);
var
  LPreviousStateObj: TObject;
begin
  // Gather the previous state of the entity (before update query)
  LPreviousStateObj := io.Load(AContext.DataObject.ClassName).ByID(AContext.GetID).ToObject; // Load the previous version obj
  AContext.EtmBeforeUpdateEntityState := dj.From(LPreviousStateObj).ToJson;
end;

class procedure TioEtmInterceptor.AfterUpdate(const AContext: IioContext; const AQuery: IioQuery);
var
  LRepository: TioEtmCustomRepository;
begin
  // Create the repository item, persist it and finally free it
  LRepository := AContext.Map.GetTable.GetEtmRepositoryClass.Create(etUpdate, ctNoConflict, AContext.GetID, AContext.DataObject.ClassName, AContext.ObjVersion-1, AContext.EtmBeforeUpdateEntityState, '');
  try
    io.Persist(LRepository);
  finally
    LRepository.Free;
  end;
end;

class procedure TioEtmInterceptor.AfterDelete(const AContext: IioContext; const AQuery: IioQuery);
var
  LEntityState: String;
  LRepository: TioEtmCustomRepository;
begin
  // Get the state (JSON) of the entity just before delete it
  LEntityState := dj.From(AContext.DataObject).ToJson;
  // Create the repository item, persist it and finally free it
  LRepository := AContext.Map.GetTable.GetEtmRepositoryClass.Create(etDelete, ctNoConflict, AContext.GetID, AContext.DataObject.ClassName, AContext.ObjVersion,
    LEntityState, '');
  try
    io.Persist(LRepository);
  finally
    LRepository.Free;
  end;
end;

end.
