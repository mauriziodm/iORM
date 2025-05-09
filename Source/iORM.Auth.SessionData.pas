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
unit iORM.Auth.SessionData;

interface

uses
  iORM.Auth.Interfaces;

type

  TioAuthSessionData = class(TInterfacedObject, IioAuthSessionData)
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
    function GetHasLicense: Boolean;
    function GetHasLicenseOID: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetHasUser: Boolean;
    function GetHasUserOID: Boolean;
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
    procedure SetLicense(const Value: String);
    procedure SetLicenseOID(const Value: Integer);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    constructor Create;
    procedure Clear;
    function Clone: IioAuthSessionData;
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
  System.SysUtils, System.JSON;

{ TioAuthSession }

procedure TioAuthSessionData.Clear;
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
  // refresh
  FRefreshToken := IO_STRING_NULL_VALUE;
  FRefreshTokenExp := IO_DATETIME_NULL_VALUE;
  // access
  FAccessToken := IO_STRING_NULL_VALUE;
  FAccessTokenExp := IO_DATETIME_NULL_VALUE;
  FAccessTokenRefreshAfter := IO_DATETIME_NULL_VALUE;
end;

function TioAuthSessionData.Clone: IioAuthSessionData;
begin
  Result := TioAuthFactory.NewAuthSessionData;
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
  // refresh token
  Result.RefreshToken := FRefreshToken;
  Result.RefreshTokenExp := FRefreshTokenExp;
  // access token
  Result.AccessToken := FAccessToken;
  Result.AccessTokenExp := FAccessTokenExp;
  Result.AccessTokenRefreshAfter := FAccessTokenRefreshAfter;
end;

constructor TioAuthSessionData.Create;
begin
  inherited;
  Clear;
end;

function TioAuthSessionData.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioAuthSessionData.GetAccessTokenExp: TDateTime;
begin
  Result := FAccessTokenExp;
end;

function TioAuthSessionData.GetAccessTokenIsExpired: Boolean;
begin
  Result := ((FAccessTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FAccessTokenExp)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSessionData.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthSessionData.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioAuthSessionData.GetConnection: String;
begin
  Result := FConnection;
end;

function TioAuthSessionData.GetConnectionRemote: String;
begin
  Result := FConnectionRemote;
end;

function TioAuthSessionData.GetNeedRefresh: Boolean;
begin
  Result := ((FAccessTokenRefreshAfter <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FAccessTokenRefreshAfter)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSessionData.GetHasAccessToken: Boolean;
begin
  Result := FAccessToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasApp: Boolean;
begin
  Result := FApp <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasAppOID: Boolean;
begin
  Result := FAppOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionData.GetHasConnection: Boolean;
begin
  Result := FConnection <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasConnectionRemote: Boolean;
begin
  Result := FConnectionRemote <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasLicense: Boolean;
begin
  Result := FLicense <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasLicenseOID: Boolean;
begin
  Result := FLicenseOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionData.GetHasRefreshToken: Boolean;
begin
  Result := FRefreshToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasUser: Boolean;
begin
  Result := FUser <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasUserOID: Boolean;
begin
  Result := FUserOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionData.GetLicense: String;
begin
  Result := FLicense;
end;

function TioAuthSessionData.GetLicenseOID: Integer;
begin
  Result := FLicenseOID;
end;

function TioAuthSessionData.GetAccessTokenRefreshAfter: TDateTime;
begin
  Result := FAccessTokenRefreshAfter;
end;

function TioAuthSessionData.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioAuthSessionData.GetRefreshTokenExp: TDateTime;
begin
  Result := FRefreshTokenExp;
end;

function TioAuthSessionData.GetRefreshTokenIsExpired: Boolean;
begin
  Result := ((FRefreshTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FRefreshTokenExp)) or (FRefreshToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSessionData.GetUser: String;
begin
  Result := FUser;
end;

function TioAuthSessionData.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

procedure TioAuthSessionData.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioAuthSessionData.SetAccessTokenExp(const Value: TDateTime);
begin
  FAccessTokenExp := Value;
end;

procedure TioAuthSessionData.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioAuthSessionData.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthSessionData.SetConnection(const Value: String);
begin
  FConnection := Value;
end;

procedure TioAuthSessionData.SetConnectionRemote(const Value: String);
begin
  FConnectionRemote := Value;
end;

procedure TioAuthSessionData.SetLicense(const Value: String);
begin
  FLicense := Value;
end;

procedure TioAuthSessionData.SetLicenseOID(const Value: Integer);
begin
  FLicenseOID := Value;
end;

procedure TioAuthSessionData.SetAccessTokenRefreshAfter(const Value: TDateTime);
begin
  FAccessTokenRefreshAfter := Value;
end;

procedure TioAuthSessionData.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

procedure TioAuthSessionData.SetRefreshTokenExp(const Value: TDateTime);
begin
  FRefreshTokenExp := Value;
end;

procedure TioAuthSessionData.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TioAuthSessionData.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

end.
