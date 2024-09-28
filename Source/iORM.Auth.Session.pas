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
    // tokens
    FUserAuthorizationToken: String;
    FAppAuthorizationToken: String;
    FAccessToken: String;
    // connection
    FConnectionName: String;
    // methods
    function GetAccessToken: String;
    function GetAppAuthorizationToken: String;
    function GetConnectionName: String;
    function GetUserAuthorizationToken: String;
    function GetUserID: Integer;
    function GetUserName: String;
    procedure SetAccessToken(const Value: String);
    procedure SetAppAuthorizationToken(const Value: String);
    procedure SetConnectionName(const Value: String);
    procedure SetUserAuthorizationToken(const Value: String);
    procedure SetUserID(const Value: Integer);
    procedure SetUserName(const Value: String);
  public
    // user
    property UserID: Integer read GetUserID write SetUserID;
    property UserName: String read GetUserName write SetUserName;
    // tokens
    property UserAuthorizationToken: String read GetUserAuthorizationToken write SetUserAuthorizationToken;
    property AppAuthorizationToken: String read GetAppAuthorizationToken write SetAppAuthorizationToken;
    property AccessToken: String read GetAccessToken write SetAccessToken;
    // connection
    property ConnectionName: String read GetConnectionName write SetConnectionName;
  end;

implementation

{ TioAuthSession }

function TioAuthSession.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioAuthSession.GetAppAuthorizationToken: String;
begin
  Result := FAppAuthorizationToken;
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
