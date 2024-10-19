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
    FUserID: Integer;
    FUserName: String;
    // app
    FAppID: Integer;
    // tokens
    FUserAuthorizationToken: String;
    FAppAuthorizationToken: String;
    FAccessToken: String;
    // connection
    FConnectionName: String;
    // methods
    function GetAccessToken: String;
    function GetAppAuthorizationToken: String;
    function GetAppID: Integer;
    function GetConnectionName: String;
    function GetUserAuthorizationToken: String;
    function GetUserID: Integer;
    function GetUserName: String;
    procedure SetAccessToken(const Value: String);
    procedure SetAppAuthorizationToken(const Value: String);
    procedure SetAppID(const Value: Integer);
    procedure SetConnectionName(const Value: String);
    procedure SetUserAuthorizationToken(const Value: String);
    procedure SetUserID(const Value: Integer);
    procedure SetUserName(const Value: String);
  public
    constructor Create;
    // user
    property UserID: Integer read GetUserID write SetUserID;
    property UserName: String read GetUserName write SetUserName;
    // app props
    property AppID: Integer read GetAppID write SetAppID;
    // tokens
    property UserAuthorizationToken: String read GetUserAuthorizationToken write SetUserAuthorizationToken;
    property AppAuthorizationToken: String read GetAppAuthorizationToken write SetAppAuthorizationToken;
    property AccessToken: String read GetAccessToken write SetAccessToken;
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
  FUserID := IO_INTEGER_NULL_VALUE;
  FUserName := IO_STRING_NULL_VALUE;
  // app
  FAppID := IO_INTEGER_NULL_VALUE;
  // tokens
  FUserAuthorizationToken := IO_STRING_NULL_VALUE;
  FAppAuthorizationToken := IO_STRING_NULL_VALUE;
  FAccessToken := IO_STRING_NULL_VALUE;
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

function TioAuthSession.GetAppID: Integer;
begin
  Result := FAppID;
end;

function TioAuthSession.GetConnectionName: String;
begin
  Result := FConnectionName;
end;

function TioAuthSession.GetUserAuthorizationToken: String;
begin
  Result := FUserAuthorizationToken;
end;

function TioAuthSession.GetUserID: Integer;
begin
  Result := FUserID;
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

procedure TioAuthSession.SetAppID(const Value: Integer);
begin
  FAppID := Value;
end;

procedure TioAuthSession.SetConnectionName(const Value: String);
begin
  FConnectionName := Value;
end;

procedure TioAuthSession.SetUserAuthorizationToken(const Value: String);
begin
  FUserAuthorizationToken := Value;
end;

procedure TioAuthSession.SetUserID(const Value: Integer);
begin
  FUserID := Value;
end;

procedure TioAuthSession.SetUserName(const Value: String);
begin
  FUserName := Value;
end;

end.
