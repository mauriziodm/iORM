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
{
  ********************************************************************************************************************************
  * NOTE: TioEtmCustomTimeSlot base class for all EtmTimeSlots is declared in iORM.Attributes unit to avoid circular refeference *
  * NOTE: TioEtmCustomTimeSlot base class for all EtmTimeSlots is declared in iORM.Attributes unit to avoid circular refeference *
  * NOTE: TioEtmCustomTimeSlot base class for all EtmTimeSlots is declared in iORM.Attributes unit to avoid circular refeference *
  ********************************************************************************************************************************
}
unit iORM.ETM.Interceptor;

interface

uses
  iORM.Interceptor.CRUD, iORM.Context.Interfaces;

type

  TioEtmInterceptor = class(TioCustomCRUDInterceptor)
  public
    // Insert
    class procedure AfterInsert(const AContext: IioContext); override;
    // Update
    class procedure BeforeUpdate(const AContext: IioContext; var ADone: Boolean); override;
    class procedure AfterUpdate(const AContext: IioContext); override;
    // Delete
    class procedure AfterDelete(const AContext: IioContext); override;
  end;

implementation

uses
  iORM, DJSON, iORM.CommonTypes, iORM.Utilities, System.SysUtils,
  iORM.ETM.Factory;

{ TioEtmInterceptor }

class procedure TioEtmInterceptor.AfterInsert(const AContext: IioContext);
var
  LEntityState: String;
  LTimeSlot: TioEtmCustomTimeSlot;
begin
  // Get the state (JSON) of the entity
  LEntityState := dj.From(AContext.DataObject, TioEtmFactory.djParamsEngine).ToJson;
  // Create the TimeSlot, persist it and finally free it
  LTimeSlot := AContext.Map.GetTable.GetEtmTimeSlotClass.Create(etInsert, ctNoConflict, AContext.GetID, AContext.DataObject.ClassName, AContext.ObjVersion,
    0, LEntityState, '');
  try
    io.PersistObject(LTimeSlot);
  finally
    LTimeSlot.Free;
  end;
end;

class procedure TioEtmInterceptor.BeforeUpdate(const AContext: IioContext; var ADone: Boolean);
var
  LPreviousStateObj: TObject;
begin
  // Gather the previous state of the entity (before update query)
  LPreviousStateObj := io.Load(AContext.DataObject.ClassName).ByID(AContext.GetID).ToObject; // Load the previous version obj
  try
    // If the ObjVersion is negative it means that we are trying to restore a previous version
    if AContext.ObjVersion < 0 then
    begin
      AContext.EtmRevertedFromVersion := Abs(AContext.ObjVersion);
      AContext.ObjVersion := TioUtilities.ExtractObjVersion(LPreviousStateObj);
    end;
  finally
    LPreviousStateObj.Free;
  end;
end;

class procedure TioEtmInterceptor.AfterUpdate(const AContext: IioContext);
var
  LEntityState: String;
  LTimeSlot: TioEtmCustomTimeSlot;
begin
  // Get the state (JSON) of the entity
  LEntityState := dj.From(AContext.DataObject, TioEtmFactory.djParamsEngine).ToJson;
  // Create the TimeSlot, persist it and finally free it
  LTimeSlot := AContext.Map.GetTable.GetEtmTimeSlotClass.Create(etUpdate, ctNoConflict, AContext.GetID, AContext.DataObject.ClassName, AContext.ObjVersion,
    AContext.EtmRevertedFromVersion, LEntityState, '');
  try
    io.PersistObject(LTimeSlot);
  finally
    LTimeSlot.Free;
  end;
end;

class procedure TioEtmInterceptor.AfterDelete(const AContext: IioContext);
var
  LTimeSlot: TioEtmCustomTimeSlot;
begin
  // Create the TimeSlot, persist it and finally free it (no entity state on delete)
  LTimeSlot := AContext.Map.GetTable.GetEtmTimeSlotClass.Create(etDelete, ctNoConflict, AContext.GetID, AContext.DataObject.ClassName, AContext.ObjVersion,
    0, '', '');
  try
    io.PersistObject(LTimeSlot);
  finally
    LTimeSlot.Free;
  end;
end;

end.
