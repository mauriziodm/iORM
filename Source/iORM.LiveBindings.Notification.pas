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

uses
  iORM.LiveBindings.Interfaces;

type

  TioBSANotificationEvent = procedure(Sender: TObject; const ANotification: IioBSANotification) of object;

  TioBSANotification = class(TInterfacedObject, IioBSANotification)
  strict protected
    FSender: TObject;
    FSubject: TObject;
    FNotificationType: TioBSANotificationType;
  public
    constructor Create(ASender: TObject; ASubject: TObject; ANotificationType: TioBSANotificationType); overload;
    function Sender: TObject;
    function Subject: TObject;
    function NotificationType: TioBSANotificationType;
  end;

  TioBSNotification = record
    Sender: TObject;
    Subject: TObject;
    NotificationType: TioBSNotificationType;
    ArgumentInt: Integer;
    constructor Create(const ASender, ASubject: TObject; const ANotificationType: TioBSNotificationType); overload;
    constructor Create(const ASender, ASubject: TObject; const ANotificationType: TioBSNotificationType; const AArgumentInteger: Integer); overload;
  end;

  PioBSNotification = ^TioBSNotification;

implementation

{ TioBSANotification }

constructor TioBSANotification.Create(ASender, ASubject: TObject; ANotificationType: TioBSANotificationType);
begin
  inherited Create;
  Self.FSender := ASender;
  Self.FSubject := ASubject;
  Self.FNotificationType := ANotificationType;
end;

function TioBSANotification.NotificationType: TioBSANotificationType;
begin
  Result := Self.FNotificationType;
end;

function TioBSANotification.Sender: TObject;
begin
  Result := Self.FSender;
end;

function TioBSANotification.Subject: TObject;
begin
  Result := Self.FSubject;
end;

{ TioBSNotification }

constructor TioBSNotification.Create(const ASender, ASubject: TObject; const ANotificationType: TioBSNotificationType; const AArgumentInteger: Integer);
begin
  Sender := ASender;
  Subject := ASubject;
  NotificationType := ANotificationType;
  ArgumentInt := AArgumentInteger;
end;

constructor TioBSNotification.Create(const ASender, ASubject: TObject; const ANotificationType: TioBSNotificationType);
begin
  Sender := ASender;
  Subject := ASubject;
  NotificationType := ANotificationType;
end;

end.
