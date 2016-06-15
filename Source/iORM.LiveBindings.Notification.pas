{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.LiveBindings.Notification;

interface

uses
  iORM.LiveBindings.Interfaces;

type

  TioBSANotificationEvent = procedure(Sender:TObject; const ANotification:IioBSANotification) of object;

  TioBSANotification = class(TInterfacedObject, IioBSANotification)
  strict protected
    FSender: TObject;
    FSubject: TObject;
    FNotificationType: TioBSANotificationType;
  public
    constructor Create(ASender:TObject; ASubject:TObject; ANotificationType:TioBSANotificationType); overload;
    function Sender: TObject;
    function Subject: TObject;
    function NotificationType: TioBSANotificationType;
  end;

implementation

{ TioBSANotification }

constructor TioBSANotification.Create(ASender, ASubject: TObject;
  ANotificationType: TioBSANotificationType);
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

end.
