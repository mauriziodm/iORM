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

  // NB: The acronym SUD means "Smart Update Detection"
  TioBSNotificationType = (ntRefresh, ntScroll, ntSaveRevertPoint, ntCanReceiveSelection, ntCanInsertDetail, ntCanDeleteDetail, ntDeleteSmart, ntObjStatusSetDeleted,
    ntObjStatusSetDirty, ntSUD_RegisterObjOnEdit, ntSUD_RegisterObjOnPost, ntSUD_RegisterDetailPropertyPath);

  PioBSNotification = ^TioBSNotification;

  TioBSNotification = record
    NotificationType: TioBSNotificationType;
    DirectionRoot: Boolean;
    DirectionLeaves: Boolean;
    DeliverToMasterBS: Boolean;
    DeliverToDetailBS: Boolean;
    StopAtTheFirstMasterBS: Boolean;
    PayloadAsInteger: Integer;
    PayloadAsString: String;
    PayloadAsObject: TObject;
    Response: Boolean;
    constructor Create(const ANotificationType: TioBSNotificationType);
    constructor CreateDeleteSmartNotification(const ADeletedObj: TObject);
    constructor CreateSUDRegisterObjOnEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String);
    constructor CreateSUDRegisterObjOnPost(const ACurrentObj: TObject; const AMasterPropertyPath: String;
      const ADummyParamToAvoidDuplicateIdenticalParametersWarning: Boolean = False);
  end;

implementation

uses
  iORM.Utilities, iORM.Exceptions, System.SysUtils;

{ TioBSNotification }

constructor TioBSNotification.Create(const ANotificationType: TioBSNotificationType);
begin
  NotificationType := ANotificationType;
  Response := False;
  case ANotificationType of
    // NB: ntBrowse is used both for paging and for the ObjStateManager;
    // in both cases it applies only to the master BindSource and does not propagate
    ntScroll:
      begin
        DirectionRoot := False;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstMasterBS := True;
      end;
    // NB: ntRefresh is used to notify all BindSources to refresh;
    // it is applied both to the BindSource masters and to the details and it propagates in both directions until it reaches the root or leaves
    ntRefresh:
      begin
        DirectionRoot := True;
        DirectionLeaves := True;
        DeliverToMasterBS := True;
        DeliverToDetailBS := True;
        StopAtTheFirstMasterBS := False;
      end;
    // NB: ntSaveObjState is for the TBSPersist;
    // it only applies to BindSource masters and propagates from the details to the first master encountered
    ntSaveRevertPoint:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstMasterBS := True;
      end;
    // NB: ntCanReceiveSelection is for selectors;
    // in the Response field return True if the MasterBS (selection destination) has saved a revert point (or can save it aautomatically)
    ntCanReceiveSelection:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstMasterBS := True;
      end;
    // NB: ntCanDeleteDetail;
    // in the Response field return True if the MasterBS has saved a revert point (or can save it aautomatically)
    ntCanDeleteDetail:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstMasterBS := True;
      end;
    // NB: ntCanInsertDetail;
    // in the Response field return True if the MasterBS has saved a revert point (or can save it aautomatically)
    ntCanInsertDetail:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstMasterBS := True;
      end;
    // NB: ntObjStatusSetDeleted is for the CommonBSBehaviour:
    // Actually used for ActiveBindSourceAdapters delete purposes:
    // It return true (Response field of the notification) if the ObjStatus delete mode system is enabled on the MasterBS
    ntObjStatusSetDeleted:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstMasterBS := True;
      end;
    // NB: ntObjStatusSetDirty is for the CommonBSBehaviour:
    // Actually used for ActiveBindSourceAdapters insert/update purposes:
    // It return true (Response field of the notification) if the ObjStatus (dirty) mode system is enabled on the MasterBS
    ntObjStatusSetDirty:
      begin
        DirectionRoot := True;
        DirectionLeaves := False;
        DeliverToMasterBS := True;
        DeliverToDetailBS := False;
        StopAtTheFirstMasterBS := True;
      end;
  // Else raise exception
  else
    raise EioException.Create('TioBSNotification', 'Create',
      Format('Notification type not recognized (%s)'#13'It may be that you have to use a specific constructor.',
      [TioUtilities.EnumToString<TioBSNotificationType>(ANotificationType)]));
  end;
end;

constructor TioBSNotification.CreateDeleteSmartNotification(const ADeletedObj: TObject);
begin
  // Initialization
  NotificationType := ntDeleteSmart;
  Response := False;
  // Routing
  DirectionRoot := True;
  DirectionLeaves := False;
  DeliverToMasterBS := True;
  DeliverToDetailBS := False;
  StopAtTheFirstMasterBS := True;
  // Payload
  PayloadAsString := ADeletedObj.ClassName;
  PayloadAsInteger := TioUtilities.ExtractOID(ADeletedObj);
end;

constructor TioBSNotification.CreateSUDRegisterObjOnEdit(const ACurrentObj: TObject; const AMasterPropertyPath: String);
begin
  // Initialization
  NotificationType := ntSUD_RegisterObjOnEdit;
  Response := False;
  // Routing
  DirectionRoot := True;
  DirectionLeaves := False;
  DeliverToMasterBS := True;
  DeliverToDetailBS := False;
  StopAtTheFirstMasterBS := True;
  // Payload
  PayloadAsObject := ACurrentObj;
  PayloadAsString := AMasterPropertyPath;
end;

constructor TioBSNotification.CreateSUDRegisterObjOnPost(const ACurrentObj: TObject; const AMasterPropertyPath: String;
  const ADummyParamToAvoidDuplicateIdenticalParametersWarning: Boolean = False);
begin
  // Initialization
  NotificationType := ntSUD_RegisterObjOnPost;
  Response := False;
  // Routing
  DirectionRoot := True;
  DirectionLeaves := False;
  DeliverToMasterBS := True;
  DeliverToDetailBS := False;
  StopAtTheFirstMasterBS := True;
  // Payload
  PayloadAsObject := ACurrentObj;
  PayloadAsString := AMasterPropertyPath;
end;

end.
