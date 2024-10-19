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
    FUserOID: Integer;
    FUserName: String;
    // app
    FAppOID: Integer;
    // tokens
    FAccessToken: String;
    FAppAuthorizationToken: String;
    FRefreshToken: String;
    FUserAuthorizationToken: String;
    // connection
    FConnectionName: String;
    // methods
    function GetAccessToken: String;
    function GetAppAuthorizationToken: String;
    function GetAppOID: Integer;
    function GetConnectionName: String;
    function GetRefreshToken: String;
    function GetUserAuthorizationToken: String;
    function GetUserOID: Integer;
    function GetUserName: String;
    procedure SetAccessToken(const Value: String);
    procedure SetAppAuthorizationToken(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetConnectionName(const Value: String);
    procedure SetRefreshToken(const Value: String);
    procedure SetUserAuthorizationToken(const Value: String);
    procedure SetUserOID(const Value: Integer);
    procedure SetUserName(const Value: String);
  public
    constructor Create;
    // user
    property UserOID: Integer read GetUserOID write SetUserOID;
    property UserName: String read GetUserName write SetUserName;
    // app props
    property AppOID: Integer read GetAppOID write SetAppOID;
    // tokens
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AppAuthorizationToken: String read GetAppAuthorizationToken write SetAppAuthorizationToken;
    property RefreshTokenToken: String read GetRefreshToken write SetRefreshToken;
    property UserAuthorizationToken: String read GetUserAuthorizationToken write SetUserAuthorizationToken;
    // connection
    property ConnectionName: String read GetConnectionName write SetConnectionName;
  end;

implementation

uses iORM.CommonTypes;

{ TioAuthSession }

constructor TioAuthSession.Create;
begin
  inherited;
  // user
  FUserOID := IO_INTEGER_NULL_VALUE;
  FUserName := IO_STRING_NULL_VALUE;
  // app
  FAppOID := IO_INTEGER_NULL_VALUE;
  // tokens
  FAccessToken := IO_STRING_NULL_VALUE;
  FAppAuthorizationToken := IO_STRING_NULL_VALUE;
  FRefreshToken := IO_STRING_NULL_VALUE;
  FUserAuthorizationToken := IO_STRING_NULL_VALUE;
  // connection
  FConnectionName := IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioAuthSession.GetAppAuthorizationToken: String;
begin
  Result := FAppAuthorizationToken;
end;

function TioAuthSession.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioAuthSession.GetConnectionName: String;
begin
  Result := FConnectionName;
end;

function TioAuthSession.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioAuthSession.GetUserAuthorizationToken: String;
begin
  Result := FUserAuthorizationToken;
end;

function TioAuthSession.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

function TioAuthSession.GetUserName: String;
begin
  Result := FUserName;
end;

procedure TioAuthSession.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioAuthSession.SetAppAuthorizationToken(const Value: String);
begin
  FAppAuthorizationToken := Value;
end;

procedure TioAuthSession.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthSession.SetConnectionName(const Value: String);
begin
  FConnectionName := Value;
end;

procedure TioAuthSession.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

procedure TioAuthSession.SetUserAuthorizationToken(const Value: String);
begin
  FUserAuthorizationToken := Value;
end;

procedure TioAuthSession.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

procedure TioAuthSession.SetUserName(const Value: String);
begin
  FUserName := Value;
end;

end.
