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

  TioAuthSessionThreadSafeWrapper = class(TInterfacedObject, IioAuthSessionThreadSafeWrapper)
  private
    FSession: IioAuthSession;
  public
    constructor Create;
    procedure Clear;
    function Acquire: IioAuthSession;
    procedure Release;
  end;

  TioAuthSession = class(TInterfacedObject, IioAuthSession)
  private
  private
    // app
    FApp: String;
    FAppOID: Integer;
    // user
    FUser: String;
    FUserOID: Integer;
    // connection
    FConnectionDefault: String;
    FConnectionLocal: String;
    FConnectionRemote: String;
    // refresh token
    FRefreshToken: String;
    FRefreshTokenExp: TDateTime;
    // access token
    FAccessToken: String;
    FAccessTokenExp: TDateTime;
    FRefreshAfter: TDateTime;
    // methods
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenIsExpired: Boolean;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetConnectionDefault: String;
    function GetConnectionLocal: String;
    function GetConnectionRemote: String;
    function GetHasAccessToken: Boolean;
    function GetHasApp: Boolean;
    function GetHasAppOID: Boolean;
    function GetHasConnectionName: Boolean;
    function GetHasConnectionNameRemote: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetHasUser: Boolean;
    function GetHasUserOID: Boolean;
    function GetNeedRefresh: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetRefreshTokenIsExpired: Boolean;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetConnectionDefault(const Value: String);
    procedure SetConnectionLocal(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    constructor Create;
    procedure Clear;
    // app
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property HasApp: Boolean read GetHasApp;
    property HasAppOID: Boolean read GetHasAppOID;
    // connection
    property ConnectionDefault: String read GetConnectionDefault write SetConnectionDefault;
    property ConnectionLocal: String read GetConnectionLocal write SetConnectionLocal;
    property ConnectionRemote: String read GetConnectionRemote write SetConnectionRemote;
    property HasConnectionName: Boolean read GetHasConnectionName;
    property HasConnectionNameRemote: Boolean read GetHasConnectionNameRemote;
    // user
    property HasUser: Boolean read GetHasUser;
    property HasUserOID: Boolean read GetHasUserOID;
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
    // refresh token
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenExp: TDateTime read GetRefreshTokenExp write SetRefreshTokenExp;
    property RefreshTokenIsExpired: Boolean read GetRefreshTokenIsExpired;
    property HasRefreshToken: Boolean read GetHasRefreshToken;
    // access token
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AccessTokenExp: TDateTime read GetAccessTokenExp write SetAccessTokenExp;
    property AccessTokenIsExpired: Boolean read GetAccessTokenIsExpired;
    property HasAccessToken: Boolean read GetHasAccessToken;
    property RefreshAfter: TDateTime read GetRefreshAfter write SetRefreshAfter;
    property NeedRefresh: Boolean read GetNeedRefresh;
  end;

implementation

uses iORM.CommonTypes, iORM.Utilities, iORM.Auth.Factory, DJSON,
  System.SysUtils, System.JSON;

{ TioAuthSession }

procedure TioAuthSession.Clear;
begin
  // app
  FApp := IO_STRING_NULL_VALUE;
  FAppOID := IO_INTEGER_NULL_VALUE;
  // connection (note: do not clear the default connection)
  FConnectionLocal := IO_STRING_NULL_VALUE;
  FConnectionRemote := IO_STRING_NULL_VALUE;
  // user
  FUser := IO_STRING_NULL_VALUE;
  FUserOID := IO_INTEGER_NULL_VALUE;
  // refresh
  FRefreshToken := IO_STRING_NULL_VALUE;
  FRefreshTokenExp := IO_DATETIME_NULL_VALUE;
  // access
  FAccessToken := IO_STRING_NULL_VALUE;
  FAccessTokenExp := IO_DATETIME_NULL_VALUE;
  FRefreshAfter := IO_DATETIME_NULL_VALUE;
end;

constructor TioAuthSession.Create;
begin
  inherited;
  Clear;
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

function TioAuthSession.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthSession.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioAuthSession.GetConnectionDefault: String;
begin
  Result := FConnectionDefault;
end;

function TioAuthSession.GetConnectionLocal: String;
begin
  Result := FConnectionLocal;
end;

function TioAuthSession.GetConnectionRemote: String;
begin
  Result := FConnectionRemote;
end;

function TioAuthSession.GetNeedRefresh: Boolean;
begin
  Result := ((FRefreshAfter <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FRefreshAfter)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetHasAccessToken: Boolean;
begin
  Result := FAccessToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasApp: Boolean;
begin
  Result := FApp <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasAppOID: Boolean;
begin
  Result := FAppOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSession.GetHasConnectionName: Boolean;
begin
  Result := FConnectionLocal <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasConnectionNameRemote: Boolean;
begin
  Result := FConnectionRemote <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasRefreshToken: Boolean;
begin
  Result := FRefreshToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasUser: Boolean;
begin
  Result := FUser <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasUserOID: Boolean;
begin
  Result := FUserOID <> IO_INTEGER_NULL_VALUE;
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

function TioAuthSession.GetUser: String;
begin
  Result := FUser;
end;

function TioAuthSession.GetUserOID: Integer;
begin
  Result := FUserOID;
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

procedure TioAuthSession.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthSession.SetConnectionDefault(const Value: String);
begin
  Result := FConnectionDefault;
end;

procedure TioAuthSession.SetConnectionLocal(const Value: String);
begin
  FConnectionLocal := Value;
end;

procedure TioAuthSession.SetConnectionRemote(const Value: String);
begin
  FConnectionRemote := Value;
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

procedure TioAuthSession.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TioAuthSession.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

{ TioAuthSessionThreadSafeWrapper }

function TioAuthSessionThreadSafeWrapper.Acquire: IioAuthSession;
begin
  TMonitor.Enter(Self);
  Result := FSession;
end;

procedure TioAuthSessionThreadSafeWrapper.Clear;
begin
  Acquire;
  try
    FSession := TioAuthFactory.NewAuthSession;
  finally
    Release;
  end;
end;

constructor TioAuthSessionThreadSafeWrapper.Create;
begin
  inherited;
  Clear;
end;

procedure TioAuthSessionThreadSafeWrapper.Release;
begin
  TMonitor.Exit(Self);
end;

end.
