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
  iORM.Abstraction.Interfaces;

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
    // id token
    FIDToken: String;
    FIDTokenExp: TDateTime;
    // access token
    FAccessToken: String;
    FAccessTokenExp: TDateTime;
    FAccessTokenRefreshAfter: TDateTime;
    // refresh token
    FRefreshToken: String;
    FRefreshTokenExp: TDateTime;
    // methods
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenIsExpired: Boolean;
    function GetAccessTokenRefreshAfter: TDateTime;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetHasAccessToken: Boolean;
    function GetHasApp: Boolean;
    function GetHasAppOID: Boolean;
    function GetHasConnection: Boolean;
    function GetHasConnectionRemote: Boolean;
    function GetHasIDToken: Boolean;
    function GetHasLicense: Boolean;
    function GetHasLicenseOID: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetHasUser: Boolean;
    function GetHasUserOID: Boolean;
    function GetIDToken: String;
    function GetIDTokenExp: TDateTime;
    function GetIDTokenIsExpired: Boolean;
    function GetLicense: String;
    function GetLicenseOID: Integer;
    function GetNeedRefresh: Boolean;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetRefreshTokenIsExpired: Boolean;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetAccessTokenRefreshAfter(const Value: TDateTime);
    procedure SetConnection(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetIDToken(const Value: String);
    procedure SetIDTokenExp(const Value: TDateTime);
    procedure SetLicense(const Value: String);
    procedure SetLicenseOID(const Value: Integer);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
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
    // id token
    property IDToken: String read GetIDToken write SetIDToken;
    property IDTokenExp: TDateTime read GetIDTokenExp write SetIDTokenExp;
    property IDTokenIsExpired: Boolean read GetIDTokenIsExpired;
    property HasIDToken: Boolean read GetHasIDToken;
    // refresh token
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenExp: TDateTime read GetRefreshTokenExp write SetRefreshTokenExp;
    property RefreshTokenIsExpired: Boolean read GetRefreshTokenIsExpired;
    property HasRefreshToken: Boolean read GetHasRefreshToken;
    // access token
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AccessTokenExp: TDateTime read GetAccessTokenExp write SetAccessTokenExp;
    property AccessTokenIsExpired: Boolean read GetAccessTokenIsExpired;
    property AccessTokenRefreshAfter: TDateTime read GetAccessTokenRefreshAfter write SetAccessTokenRefreshAfter;
    property HasAccessToken: Boolean read GetHasAccessToken;
    property NeedRefresh: Boolean read GetNeedRefresh;
  end;

implementation

uses iORM.CommonTypes, iORM.Utilities, iORM.Auth.Factory, DJSON,
  System.SysUtils, System.JSON, iORM.Abstraction.Factory;

{ TioAuthSession }

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
  // id token
  FIDToken := IO_STRING_NULL_VALUE;
  FIDTokenExp := IO_DATETIME_NULL_VALUE;
  // refresh
  FRefreshToken := IO_STRING_NULL_VALUE;
  FRefreshTokenExp := IO_DATETIME_NULL_VALUE;
  // access
  FAccessToken := IO_STRING_NULL_VALUE;
  FAccessTokenExp := IO_DATETIME_NULL_VALUE;
  FAccessTokenRefreshAfter := IO_DATETIME_NULL_VALUE;
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
  // id token
  Result.IDToken := FIDToken;
  Result.IDTokenExp := FIDTokenExp;
  // refresh token
  Result.RefreshToken := FRefreshToken;
  Result.RefreshTokenExp := FRefreshTokenExp;
  // access token
  Result.AccessToken := FAccessToken;
  Result.AccessTokenExp := FAccessTokenExp;
  Result.AccessTokenRefreshAfter := FAccessTokenRefreshAfter;
end;

constructor TioSessionData.Create;
begin
  inherited;
  Clear;
end;

function TioSessionData.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioSessionData.GetAccessTokenExp: TDateTime;
begin
  Result := FAccessTokenExp;
end;

function TioSessionData.GetAccessTokenIsExpired: Boolean;
begin
  Result := ((FAccessTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FAccessTokenExp)) or (FAccessToken = IO_STRING_NULL_VALUE);
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

function TioSessionData.GetNeedRefresh: Boolean;
begin
  Result := ((FAccessTokenRefreshAfter <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FAccessTokenRefreshAfter)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioSessionData.GetHasAccessToken: Boolean;
begin
  Result := FAccessToken <> IO_STRING_NULL_VALUE;
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

function TioSessionData.GetHasIDToken: Boolean;
begin
  Result := FIDToken <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasLicense: Boolean;
begin
  Result := FLicense <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasLicenseOID: Boolean;
begin
  Result := FLicenseOID <> IO_INTEGER_NULL_VALUE;
end;

function TioSessionData.GetHasRefreshToken: Boolean;
begin
  Result := FRefreshToken <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasUser: Boolean;
begin
  Result := FUser <> IO_STRING_NULL_VALUE;
end;

function TioSessionData.GetHasUserOID: Boolean;
begin
  Result := FUserOID <> IO_INTEGER_NULL_VALUE;
end;

function TioSessionData.GetIDToken: String;
begin
  Result := FIDToken;
end;

function TioSessionData.GetIDTokenExp: TDateTime;
begin
  Result := FIDTokenExp;
end;

function TioSessionData.GetIDTokenIsExpired: Boolean;
begin
  Result := ((FIDTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FIDTokenExp)) or (FIDToken = IO_STRING_NULL_VALUE);
end;

function TioSessionData.GetLicense: String;
begin
  Result := FLicense;
end;

function TioSessionData.GetLicenseOID: Integer;
begin
  Result := FLicenseOID;
end;

function TioSessionData.GetAccessTokenRefreshAfter: TDateTime;
begin
  Result := FAccessTokenRefreshAfter;
end;

function TioSessionData.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioSessionData.GetRefreshTokenExp: TDateTime;
begin
  Result := FRefreshTokenExp;
end;

function TioSessionData.GetRefreshTokenIsExpired: Boolean;
begin
  Result := ((FRefreshTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FRefreshTokenExp)) or (FRefreshToken = IO_STRING_NULL_VALUE);
end;

function TioSessionData.GetUser: String;
begin
  Result := FUser;
end;

function TioSessionData.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

procedure TioSessionData.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioSessionData.SetAccessTokenExp(const Value: TDateTime);
begin
  FAccessTokenExp := Value;
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

procedure TioSessionData.SetIDToken(const Value: String);
begin
  FIDToken := Value;
end;

procedure TioSessionData.SetIDTokenExp(const Value: TDateTime);
begin
  FIDTokenExp := Value;
end;

procedure TioSessionData.SetLicense(const Value: String);
begin
  FLicense := Value;
end;

procedure TioSessionData.SetLicenseOID(const Value: Integer);
begin
  FLicenseOID := Value;
end;

procedure TioSessionData.SetAccessTokenRefreshAfter(const Value: TDateTime);
begin
  FAccessTokenRefreshAfter := Value;
end;

procedure TioSessionData.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

procedure TioSessionData.SetRefreshTokenExp(const Value: TDateTime);
begin
  FRefreshTokenExp := Value;
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
