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
unit iORM.ETM.TimeSlot;

interface

uses
  iORM.ETM.Interfaces, iORM.CommonTypes, iORM.Attributes, iORM.Context.Interfaces;

type

  [ioEntity('IO_ETM')]
  TioEtmTimeSlot = class(TInterfacedObject, IioEtmTimeSlot)
  private
    FID: Integer;
    FDateAndTime: TioObjCreated;
    FUserName: TioObjCreatedUserName;
    FUserID: TioObjCreatedUserID;
    FEntityClassName: String;
    FEntityID: Integer;
    FEntityVersion: Integer;
    FEntityState: String;
    FEntityStateRemote: String;
    FTimeSlotType: TioEtmTimeSlotType;
    FConflictType: TioEtmConflictType;
    function GetID: Integer;
    function GetDateAndTime: TDateTime;
    function GetTimeSlotType: TioEtmTimeSlotType;
    function GetEntityClassName: String;
    function GetEntityID: Integer;
    function GetEntityVersion: Integer;
    function GetEntityState: String;
    function GetRemoteEntityState: String;
    function GetConflictType: TioEtmConflictType;
    function GetUserID: Integer;
    function GetUserName: String;
  public
    constructor Create(const AContext: IioContext; const ATimeSlotType: TioEtmTimeSlotType; const AConflictType: TioEtmConflictType);
    property ID: Integer read GetID;
    property DateAndTime: TDateTime read GetDateAndTime;
    property TimeSlotType: TioEtmTimeSlotType read GetTimeSlotType;
    property EntityClassName: String read GetEntityClassName;
    property EntityID: Integer read GetEntityID;
    property EntityVersion: Integer read GetEntityVersion;
    property EntityState: String read GetEntityState;
    property RemoteEntityState: String read GetRemoteEntityState;
    property ConflictType: TioEtmConflictType read GetConflictType;
    property UserName: String read GetUserName;
    property UserID: Integer read GetUserID;
  end;

implementation

uses
  iORM, DJSON, iORM.Exceptions, System.SysUtils;

{ TioEtmTimeSlot }

constructor TioEtmTimeSlot.Create(const AContext: IioContext; const ATimeSlotType: TioEtmTimeSlotType; const AConflictType: TioEtmConflictType);
var
  LPreviousStateObj: TObject;
begin
  FTimeSlotType := ATimeSlotType;
  FConflictType := AConflictType;
  FEntityClassName := AContext.DataObject.ClassName;
  FEntityID := AContext.GetID;
  FEntityVersion := AContext.ObjVersion;
  FEntityStateRemote := '';
  // State serialization depends on timeslot type
  case ATimeSlotType of
    tsUpdate:
      begin
        LPreviousStateObj := io.Load(FEntityClassName).ByID(FEntityID).ToObject;
        if Assigned(LPreviousStateObj) then
          FEntityState := dj.From(LPreviousStateObj).ToJson
        else
          raise EioException.Create(ClassName, 'Create', Format('The load of the previous state of the object of type "%s" with ID %s failed.', [FEntityClassName, FEntityID]));
      end;
    tsDelete:
      FEntityState := dj.From(AContext.DataObject).ToJson;
  else
    FEntityState := '';
  end;
end;

function TioEtmTimeSlot.GetConflictType: TioEtmConflictType;
begin
  Result := FConflictType;
end;

function TioEtmTimeSlot.GetDateAndTime: TDateTime;
begin
  Result := FDateAndTime;
end;

function TioEtmTimeSlot.GetEntityClassName: String;
begin
  Result := FEntityClassName;
end;

function TioEtmTimeSlot.GetEntityID: Integer;
begin
  Result := FEntityID;
end;

function TioEtmTimeSlot.GetEntityState: String;
begin
  Result := FEntityState;
end;

function TioEtmTimeSlot.GetRemoteEntityState: String;
begin
  Result := FEntityStateRemote;
end;

function TioEtmTimeSlot.GetEntityVersion: Integer;
begin
  Result := FEntityVersion;
end;

function TioEtmTimeSlot.GetUserID: Integer;
begin
  Result := FUserID;
end;

function TioEtmTimeSlot.GetUserName: String;
begin
  Result := FUserName;
end;

function TioEtmTimeSlot.GetID: Integer;
begin
  Result := FID;
end;

function TioEtmTimeSlot.GetTimeSlotType: TioEtmTimeSlotType;
begin
  Result := FTimeSlotType;
end;

end.
