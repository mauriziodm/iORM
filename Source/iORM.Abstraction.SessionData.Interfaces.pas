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
unit iORM.Abstraction.SessionData.Interfaces;

interface

type

  IioSessionData = interface
    ['{DE6E7EDA-BEE0-4F8A-A12F-2A99E63D8EC5}']
    procedure Clear;
    function Clone: IioSessionData;
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
    // ----- properties -----
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

end.
