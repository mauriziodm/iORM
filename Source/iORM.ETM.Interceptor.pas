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
  private
    class procedure CreateAndPersistNewTimeSlot_Internal(const AContext: IioContext); static; inline;
    class function SynchroCanPersistTimeSlot(const AContext: IioContext): Boolean; static; inline;
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
  iORM, iORM.CommonTypes, iORM.SynchroStrategy.Interfaces;

{ TioEtmInterceptor }

class function TioEtmInterceptor.SynchroCanPersistTimeSlot(const AContext: IioContext): Boolean;
//var
//  LSynchroStrategy_Client: IioEtmSynchroStrategy_Client;
begin
//  LSynchroStrategy_Client := AContext.SynchroStrategy_GetClient;


//  LSynchroStrategy_Client := nil;
//  Result := True;



//    function SynchroStrategy_Client: IioSynchroStrategy_Client; inline;

end;

class procedure TioEtmInterceptor.CreateAndPersistNewTimeSlot_Internal(const AContext: IioContext);
var
  LTimeSlot: TioEtmCustomTimeSlot;
begin
  LTimeSlot := AContext.Map.GetTable.GetEtmTimeSlotClass.Create(AContext);
  try
    io._PersistObject(LTimeSlot, itRegular, BL_ETM_PERSIST_TIMESLOT); // Intent is itRegular for the TimeSlot class and not depending from AContext
  finally
    LTimeSlot.Free;
  end;
end;

class procedure TioEtmInterceptor.BeforeUpdate(const AContext: IioContext; var ADone: Boolean);
begin
  // Save the before update ObjVersion of the object into the AContext (will use it in the constructor of TimeSlot class)
  AContext.EntityFromVersion := Abs(AContext.ObjVersion);
end;

class procedure TioEtmInterceptor.AfterUpdate(const AContext: IioContext);
begin
  CreateAndPersistNewTimeSlot_Internal(AContext);
end;

class procedure TioEtmInterceptor.AfterInsert(const AContext: IioContext);
begin
  CreateAndPersistNewTimeSlot_Internal(AContext);
end;

class procedure TioEtmInterceptor.AfterDelete(const AContext: IioContext);
begin
  CreateAndPersistNewTimeSlot_Internal(AContext);
end;

end.
