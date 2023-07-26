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
unit iORM.ETM.Repository;

interface

uses
  iORM.CommonTypes, iORM.Attributes;

type

  TioEtmCustomRepositoryRef = class of TioEtmCustomRepository;

  // Base class for ell ETM repositories
  TioEtmCustomRepository = class
  private
    FID: Integer;
    FDateAndTime: TioObjCreated;
    [ioVarChar(30)]
    FUserName: TioObjCreatedUserName;
    FUserID: TioObjCreatedUserID;
    [ioVarChar(100)]
    FEntityClassName: String;
    FEntityID: Integer;
    FEntityVersion: Integer;
    FEntityState: String;
    FRemoteEntityState: String;
    FEventType: TioEtmEventType;
    FConflictType: TioEtmConflictType;
  public
    constructor Create(const AEventType: TioEtmEventType; const AConflictType: TioEtmConflictType; const AEntityID: Integer; const AEntityClassName: String;
      const AEntityObjVersion: Integer; const AEntityState, ARemoteEntityState: String);
    property ID: Integer read FID;
    property DateAndTime: TioObjCreated read FDateAndTime;
    property EventType: TioEtmEventType read FEventType;
    property EntityClassName: String read FEntityClassName;
    property EntityID: Integer read FEntityID;
    property EntityVersion: Integer read FEntityVersion;
    property EntityState: String read FEntityState;
    property RemoteEntityState: String read FRemoteEntityState;
    property ConflictType: TioEtmConflictType read FConflictType;
    property UserName: TioObjCreatedUserName read FUserName;
    property UserID: TioObjCreatedUserID read FUserID;
  end;

implementation

{ TioEtmTimeSlot }

constructor TioEtmCustomRepository.Create(const AEventType: TioEtmEventType; const AConflictType: TioEtmConflictType; const AEntityID: Integer; const AEntityClassName: String;
      const AEntityObjVersion: Integer; const AEntityState, ARemoteEntityState: String);
begin
  FEventType := AEventType;
  FConflictType := AConflictType;
  FEntityClassName := AEntityClassName;
  FEntityID := AEntityID;
  FEntityVersion := AEntityObjVersion;
  FEntityState := AEntityState;
  FRemoteEntityState := ARemoteEntityState;
end;

end.
