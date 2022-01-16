{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.LiveBindings.Notification;

interface

type

  TioBSNotificationType = (ntRefresh, ntScroll, ntSaveRevertPoint, ntCanDoSelection);

  PioBSNotification = ^TioBSNotification;

  TioBSNotification = record
    NotificationType: TioBSNotificationType;
    DirectionRoot: Boolean;
    DirectionLeaves: Boolean;
    DeliverToMasterBS: Boolean;
    DeliverToDetailBS: Boolean;
    StopAtTheFirstDestination: Boolean;
    Response: Boolean;
    constructor Create(const ANotificationType: TioBSNotificationType);
  end;

implementation

{ TioBSNotification }

constructor TioBSNotification.Create(const ANotificationType: TioBSNotificationType);
begin
  NotificationType := ANotificationType;
  Response := True;
  case ANotificationType of
    // NB: ntBrowse is used both for paging and for the ObjStateManager;
    //     in both cases it applies only to the master BindSource and does not propagate
    ntScroll:
      begin
        DirectionRoot := False;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstDestination := True;
      end;
    // NB: ntRefresh is used to notify all BindSources to refresh;
    //     it is applied both to the BindSource masters and to the details and it propagates in both directions until it reaches the root or leaves
    ntRefresh:
      begin
        DirectionRoot := True;
        DirectionLeaves := True;
        DeliverToMasterBS := True;
        DeliverToDetailBS := True;
        StopAtTheFirstDestination := False;
      end;
    // NB: ntSaveObjState is for the ObjStateManager;
    //     it only applies to BindSource masters and propagates from the details to the first master encountered
    ntSaveRevertPoint:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstDestination := True;
      end;
    // NB: ntCanDoSelection is for selectors;
    //     in the Response field return True if the MasterBS has saved a revert point (or can save it aautomatically)
    ntCanDoSelection:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstDestination := True;
      end;
  end;
end;

end.
