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
  iORM.Context.Interfaces, System.Classes;

type

  IioSynchroStrategy_Client = interface
    ['{2295C6BF-1A5B-475B-BBC5-CF1A1C90B5B4}']
    function GenerateLocalID(const AContext: IioContext): Integer;
    procedure FreeNotification(AComponent: TComponent);
    procedure RemoveFreeNotification(AComponent: TComponent);
  end;

  IioSynchroStrategy_Server = interface
    ['{6FD4DECC-1989-4838-8368-78F0F3C95427}']
    function GetPayload: String;
    procedure LoadPayload;
    procedure PersistPayload;
  end;

  IioSynchroStrategy_TargetConnectionDef = interface
    ['{7CCD8D05-60F3-4AAF-AEA8-91DCA5E80D5B}']
    function DoSynchronization(const APayload: String): String;
    procedure FreeNotification(AComponent: TComponent);
    procedure RemoveFreeNotification(AComponent: TComponent);
  end;

  IioSynchroStrategy_LogItem = interface
    ['{34A39FEB-FAF8-4B71-9F1F-0D03BF3CE0E7}']
    // ID
    function GetID: Integer;
    property ID: Integer read GetID;
    // DateAndTime_Start
    function GetDateAndTime_Start: TDateTime;
    property DateAndTime_Start: TDateTime read GetDateAndTime_Start;
    // DateAndTime_End
    function GetDateAndTime_End: TDateTime;
    property DateAndTime_End: TDateTime read GetDateAndTime_End;
    // DateAndTime_ElapsedSec
    function GetDateAndTime_ElapsedSec: Integer;
    property DateAndTime_ElapsedSec: Integer read GetDateAndTime_ElapsedSec;
    // UserID
    function GetUserID: Integer;
    property UserID: Integer read GetUserID;
    // UserName
    function GetUserName: String;
    property UserName: String read GetUserName;
  end;

implementation

end.
