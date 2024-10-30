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
unit iORM.Auth.Session;

interface

uses
  iORM.Auth.Interfaces;

type

  TioAuthSession = class(TInterfacedObject, IioAuthSession)
  private
    // user
    FUserToken: String;
    FUserTokenExp: TDateTime;
    FUser: String;
    FUserOID: Integer;
    // app
    FAppToken: String;
    FAppTokenExp: TDateTime;
    FApp: String;
    FAppOID: Integer;
    // refresh
    FRefreshToken: String;
    FRefreshTokenExp: TDateTime;
    // access
    FAccessToken: String;
    FAccessTokenExp: TDateTime;
    FRefreshAfter: TDateTime;
    // connection
    FConnectionName: String;
    // methods
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenIsExpired: Boolean;
    function GetAppToken: String;
    function GetAppTokenExp: TDateTime;
    function GetAppTokenIsExpired: Boolean;
    function GetAppOID: Integer;
    function GetApp: String;
    function GetConnectionName: String;
    function GetHasAccessToken: Boolean;
    function GetHasAppToken: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetHasUserToken: Boolean;
    function GetIsLoggedOn: Boolean;
    function GetNeedRefresh: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetRefreshTokenIsExpired: Boolean;
    function GetUserToken: String;
    function GetUserTokenExp: TDateTime;
    function GetUserTokenIsExpired: Boolean;
    function GetUserOID: Integer;
    function GetUser: String;
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetAppToken(const Value: String);
    procedure SetAppTokenExp(const Value: TDateTime);
    procedure SetAppOID(const Value: Integer);
    procedure SetApp(const Value: String);
    procedure SetConnectionName(const Value: String);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
    procedure SetUserToken(const Value: String);
    procedure SetUserTokenExp(const Value: TDateTime);
    procedure SetUserOID(const Value: Integer);
    procedure SetUser(const Value: String);
  public
    constructor Create;
    // user
    property UserToken: String read GetUserToken write SetUserToken;
    property UserTokenExp: TDateTime read GetUserTokenExp write SetUserTokenExp;
    property UserTokenIsExpired: Boolean read GetUserTokenIsExpired;
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
    property HasUserToken: Boolean read GetHasUserToken;
    // app
    property AppToken: String read GetAppToken write SetAppToken;
    property AppTokenExp: TDateTime read GetAppTokenExp write SetAppTokenExp;
    property AppTokenIsExpired: Boolean read GetAppTokenIsExpired;
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property HasAppToken: Boolean read GetHasAppToken;
    // refresh
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenExp: TDateTime read GetRefreshTokenExp write SetRefreshTokenExp;
    property RefreshTokenIsExpired: Boolean read GetRefreshTokenIsExpired;
    property HasRefreshToken: Boolean read GetHasRefreshToken;
    // access
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AccessTokenExp: TDateTime read GetAccessTokenExp write SetAccessTokenExp;
    property AccessTokenIsExpired: Boolean read GetAccessTokenIsExpired;
    property HasAccessToken: Boolean read GetHasAccessToken;
    property RefreshAfter: TDateTime read GetRefreshAfter write SetRefreshAfter;
    property NeedRefresh: Boolean read GetNeedRefresh;
    // is logged on
    property IsLoggedOn: Boolean read GetisLoggedOn;
    // connection
    property ConnectionName: String read GetConnectionName write SetConnectionName;
  end;

implementation

uses iORM.CommonTypes, iORM.Utilities;

{ TioAuthSession }

constructor TioAuthSession.Create;
begin
  inherited;
  // user
  FUserOID := IO_INTEGER_NULL_VALUE;
  FUser := IO_STRING_NULL_VALUE;
  // app
  FAppOID := IO_INTEGER_NULL_VALUE;
  FApp := IO_STRING_NULL_VALUE;
  // tokens
  FAccessToken := IO_STRING_NULL_VALUE;
  FAppToken := IO_STRING_NULL_VALUE;
  FRefreshAfter := IO_DATETIME_NULL_VALUE;
  FRefreshToken := IO_STRING_NULL_VALUE;
  FUserToken := IO_STRING_NULL_VALUE;
  // connection
  FConnectionName := IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioAuthSession.GetAccessTokenExp: TDateTime;
begin
  Result := FAccessTokenExp;
end;

function TioAuthSession.GetAccessTokenIsExpired: Boolean;
begin
  Result := ((FAccessTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FAccessTokenExp)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetNeedRefresh: Boolean;
begin
  Result := ((FRefreshAfter <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FRefreshAfter)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthSession.GetAppToken: String;
begin
  Result := FAppToken;
end;

function TioAuthSession.GetAppTokenExp: TDateTime;
begin
  Result := FAppTokenExp;
end;

function TioAuthSession.GetAppTokenIsExpired: Boolean;
begin
  Result := ((FAppTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FAppTokenExp)) or (FAppToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioAuthSession.GetConnectionName: String;
begin
  Result := FConnectionName;
end;

function TioAuthSession.GetHasAccessToken: Boolean;
begin
  Result := FAccessToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasAppToken: Boolean;
begin
  Result := FAppToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasRefreshToken: Boolean;
begin
  Result := FRefreshToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasUserToken: Boolean;
begin
  Result := FUserToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetIsLoggedOn: Boolean;
begin
  Result := (HasAccessToken and not AccessTokenIsExpired) or (HasRefreshToken and not RefreshTokenIsExpired);
end;

function TioAuthSession.GetRefreshAfter: TDateTime;
begin
  Result := FRefreshAfter;
end;

function TioAuthSession.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioAuthSession.GetRefreshTokenExp: TDateTime;
begin
  Result := FRefreshTokenExp;
end;

function TioAuthSession.GetRefreshTokenIsExpired: Boolean;
begin
  Result := ((FRefreshTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FRefreshTokenExp)) or (FRefreshToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetUserToken: String;
begin
  Result := FUserToken;
end;

function TioAuthSession.GetUserTokenExp: TDateTime;
begin
  Result := FUserTokenExp;
end;

function TioAuthSession.GetUserTokenIsExpired: Boolean;
begin
  Result := ((FUserTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FUserTokenExp)) or (FUserToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

function TioAuthSession.GetUser: String;
begin
  Result := FUser;
end;

procedure TioAuthSession.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioAuthSession.SetAccessTokenExp(const Value: TDateTime);
begin
  FAccessTokenExp := Value;
end;

procedure TioAuthSession.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioAuthSession.SetAppToken(const Value: String);
begin
  FAppToken := Value;
end;

procedure TioAuthSession.SetAppTokenExp(const Value: TDateTime);
begin
  FAppTokenExp := Value;
end;

procedure TioAuthSession.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthSession.SetConnectionName(const Value: String);
begin
  FConnectionName := Value;
end;

procedure TioAuthSession.SetRefreshAfter(const Value: TDateTime);
begin
  FRefreshAfter := Value;
end;

procedure TioAuthSession.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

procedure TioAuthSession.SetRefreshTokenExp(const Value: TDateTime);
begin
  FRefreshTokenExp := Value;
end;

procedure TioAuthSession.SetUserToken(const Value: String);
begin
  FUserToken := Value;
end;

procedure TioAuthSession.SetUserTokenExp(const Value: TDateTime);
begin
  FUserTokenExp := Value;
end;

procedure TioAuthSession.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

procedure TioAuthSession.SetUser(const Value: String);
begin
  FUser := Value;
end;

end.
