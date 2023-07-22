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
unit iORM.ETM.Interfaces;

interface

uses
  iORM.Attributes, iORM.CommonTypes, System.Classes;

type

  [ioEnumerated('Insert, Update, Delete, Synchronization')]
  TioEtmTimeSlotType = (tsInsert, tsUpdate, tsDelete, tsSynchronization);

  [ioEnumerated('No conflict detected, Master version win, Slave version win, Last updated win, Manual conflict resolution')]
  TioEtmConflictType = (ctNoConflict, ctMasterWin, ctSlaveWin, ctLastUpdatedWin, ctManual);

  IioEtmTimeSlot = interface
    ['{09B35E52-AF12-4F66-A8CF-D58A1CF41C7D}']
    // ID
    function GetID: Integer;
    property ID: Integer read GetID;
    // DateAndTime
    function GetDateAndTime: TDateTime;
    property DateAndTime: TDateTime read GetDateAndTime;
    // TimeSlotType
    function GetTimeSlotType: TioEtmTimeSlotType;
    property TimeSlotType: TioEtmTimeSlotType read GetTimeSlotType;
    // EntityClassName
    function GetEntityClassName: String;
    property EntityClassName: String read GetEntityClassName;
    // EntityID
    function GetEntityID: Integer;
    property EntityID: Integer read GetEntityID;
    // EntityVersion
    function GetEntityVersion: TioObjVersion;
    property EntityVersion: TioObjVersion read GetEntityVersion;
    // EntityState
    function GetEntityState: String;
    property EntityState: String read GetEntityState;
    // RemoteEntityState
    function GetRemoteEntityState: String;
    property RemoteEntityState: String read GetRemoteEntityState;
    // ConflictResolutionType
    function GetConflictType: TioEtmConflictType;
    property ConflictType: TioEtmConflictType read GetConflictType;
  end;

implementation

end.
