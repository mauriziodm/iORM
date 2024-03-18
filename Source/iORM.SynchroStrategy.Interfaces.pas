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
unit iORM.SynchroStrategy.Interfaces;

interface

uses
  iORM.Context.Interfaces, System.Classes, System.Generics.Collections;

type

  TioSynchroLevel = (slIncremental, slFull);

  TioSynchroStatus = (ssInitialization, ssLoadFromClient, ssPersistToServer, ssReloadFromServer, ssPersistToClient, ssFinalization, ssCompleted);

  TioSynchroStrategy_ClassList = TList<String>;

  IioSynchroStrategy_Client = interface
    ['{2295C6BF-1A5B-475B-BBC5-CF1A1C90B5B4}']
    function IsToBeSynchronized(const AContext: IioContext): Boolean;
    function GenerateLocalID(const AContext: IioContext): Integer;
    procedure FreeNotification(AComponent: TComponent);
    procedure RemoveFreeNotification(AComponent: TComponent);
    // EtmTimeSlot_Delete_SentToServer
    procedure SetEtmTimeSlot_Delete_SentToServer(const Value: Boolean);
    function GetEtmTimeSlot_Delete_SentToServer: Boolean;
    property EtmTimeSlot_Delete_SentToServer: Boolean read GetEtmTimeSlot_Delete_SentToServer write SetEtmTimeSlot_Delete_SentToServer;
    // EtmTimeSlot_Persist_Received
    procedure SetEtmTimeSlot_Persist_ReceivedFromServer(const Value: Boolean);
    function GetEtmTimeSlot_Persist_ReceivedFromServer: Boolean;
    property EtmTimeSlot_Persist_ReceivedFromServer: Boolean read GetEtmTimeSlot_Persist_ReceivedFromServer write SetEtmTimeSlot_Persist_ReceivedFromServer;
    // EtmTimeSlot_Persist_Regular
    procedure SetEtmTimeSlot_Persist_Regular(const Value: Boolean);
    function GetEtmTimeSlot_Persist_Regular: Boolean;
    property EtmTimeSlot_Persist_Regular: Boolean read GetEtmTimeSlot_Persist_Regular write SetEtmTimeSlot_Persist_Regular;
    // EtmTimeSlot_Persist_ToBeSynchronized
    procedure SetEtmTimeSlot_Persist_ToBeSynchronized(const Value: Boolean);
    function GetEtmTimeSlot_Persist_ToBeSynchronized: Boolean;
    property EtmTimeSlot_Persist_ToBeSynchronized: Boolean read GetEtmTimeSlot_Persist_ToBeSynchronized write SetEtmTimeSlot_Persist_ToBeSynchronized;
    // EtmTimeSlot_Update_SentToServer
    procedure SetEtmTimeSlot_Update_SentToServer(const Value: Boolean);
    function GetEtmTimeSlot_Update_SentToServer: Boolean;
    property EtmTimeSlot_Update_SentToServer: Boolean read GetEtmTimeSlot_Update_SentToServer write SetEtmTimeSlot_Update_SentToServer;
  end;

  IioSynchroStrategy_TargetConnectionDef = interface
    ['{7CCD8D05-60F3-4AAF-AEA8-91DCA5E80D5B}']
    function GetName: String;
    procedure FreeNotification(AComponent: TComponent);
    procedure RemoveFreeNotification(AComponent: TComponent);
  end;

implementation

end.
