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
unit iORM.Abstraction.SessionData;

interface

uses
  iORM.Abstraction.SessionData.Interfaces;

type

  TioSessionData = class(TInterfacedObject, IioSessionData)
  private
    // app
    FApp: String;
    FAppOID: Integer;
    // user
    FUser: String;
    FUserOID: Integer;
    // license
    FLicense: String;
    FLicenseOID: Integer;
    // connection
    FConnection: String;
    FConnectionRemote: String;
    // methods
    function GetApp: String;
    function GetAppOID: Integer;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetHasApp: Boolean;
    function GetHasAppOID: Boolean;
    function GetHasConnection: Boolean;
    function GetHasConnectionRemote: Boolean;
    function GetHasLicense: Boolean;
    function GetHasLicenseOID: Boolean;
    function GetHasUser: Boolean;
    function GetHasUserOID: Boolean;
    function GetLicense: String;
    function GetLicenseOID: Integer;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetConnection(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetLicense(const Value: String);
    procedure SetLicenseOID(const Value: Integer);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    constructor Create;
    procedure Clear;
    function Clone: IioSessionData;
    // app
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property HasApp: Boolean read GetHasApp;
    property HasAppOID: Boolean read GetHasAppOID;
    // user
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
    property HasUser: Boolean read GetHasUser;
    property HasUserOID: Boolean read GetHasUserOID;
    // license
    property License: String read GetLicense write SetLicense;
    property LicenseOID: Integer read GetLicenseOID write SetLicenseOID;
    property HasLicense: Boolean read GetHasLicense;
    property HasLicenseOID: Boolean read GetHasLicenseOID;
    // connection
    property Connection: String read GetConnection write SetConnection;
    property ConnectionRemote: String read GetConnectionRemote write SetConnectionRemote;
    property HasConnection: Boolean read GetHasConnection;
    property HasConnectionRemote: Boolean read GetHasConnectionRemote;
  end;

implementation

uses iORM.CommonTypes, iORM.Utilities, DJSON, System.SysUtils, System.JSON, iORM.Abstraction.Factory;

{ TioSession }

procedure TioSessionData.Clear;
begin
  // app
  FApp := IO_STRING_NULL_VALUE;
  FAppOID := IO_INTEGER_NULL_VALUE;
  // user
  FUser := IO_STRING_NULL_VALUE;
  FUserOID := IO_INTEGER_NULL_VALUE;
  // license
  FLicense := IO_STRING_NULL_VALUE;
  FLicenseOID := IO_INTEGER_NULL_VALUE;
  // connection
  FConnection := IO_STRING_NULL_VALUE;
  FConnectionRemote := IO_STRING_NULL_VALUE;
end;

function TioSessionData.Clone: IioSessionData;
begin
  Result := TioAbstractionFactory.NewSessionData;
  // app
  Result.App := FApp;
  Result.AppOID := FAppOID;
  // user
  Result.User := FUser;
  Result.UserOID := FUserOID;
  // license
  Result.License := FLicense;
  Result.LicenseOID := FLicenseOID;
  // connection
  Result.Connection := FConnection;
  Result.ConnectionRemote := FConnectionRemote;
end;

constructor TioSessionData.Create;
begin
  inherited;
  Clear;
end;

function TioSessionData.GetApp: String;
begin
  Result := FApp;
end;

function TioSessionData.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioSessionData.GetConnection: String;
begin
  Result := FConnection;
end;

function TioSessionData.GetConnectionRemote: String;
begin
  Result := FConnectionRemote;
end;

function TioSessionData.GetHasApp: Boolean;
begin
  Result := FApp <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasAppOID: Boolean;
begin
  Result := FAppOID <> IO_INTEGER_NULL_VALUE;
end;

function TioSessionData.GetHasConnection: Boolean;
begin
  Result := FConnection <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasConnectionRemote: Boolean;
begin
  Result := FConnectionRemote <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasLicense: Boolean;
begin
  Result := FLicense <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasLicenseOID: Boolean;
begin
  Result := FLicenseOID <> IO_INTEGER_NULL_VALUE;
end;

function TioSessionData.GetHasUser: Boolean;
begin
  Result := FUser <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasUserOID: Boolean;
begin
  Result := FUserOID <> IO_INTEGER_NULL_VALUE;
end;

function TioSessionData.GetLicense: String;
begin
  Result := FLicense;
end;

function TioSessionData.GetLicenseOID: Integer;
begin
  Result := FLicenseOID;
end;

function TioSessionData.GetUser: String;
begin
  Result := FUser;
end;

function TioSessionData.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

procedure TioSessionData.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioSessionData.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioSessionData.SetConnection(const Value: String);
begin
  FConnection := Value;
end;

procedure TioSessionData.SetConnectionRemote(const Value: String);
begin
  FConnectionRemote := Value;
end;

procedure TioSessionData.SetLicense(const Value: String);
begin
  FLicense := Value;
end;

procedure TioSessionData.SetLicenseOID(const Value: Integer);
begin
  FLicenseOID := Value;
end;

procedure TioSessionData.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TioSessionData.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

end.
