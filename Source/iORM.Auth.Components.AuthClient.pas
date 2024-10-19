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
unit iORM.Auth.Components.AuthClient;

interface

uses
  System.Classes, iORM.Auth.Interfaces;

type

  TioAuthClient = class(TComponent)
  private
    // singleton class fields
    class var FInstance: TioAuthClient;
  private
    // fields
    FActive: Boolean;
    FConnectionName: String;
    // events
    FOnAuthorizeApp: TioOnAuthorizeAppEvent;
    FOnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthCodeEvent;
    FOnAuthorizeUser: TioOnAuthorizeUserEvent;
    // methods
    procedure CheckIfEnabled;
    function Get_Version: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TioAuthClient; static;
    function AuthorizeUser(const AUserCredentials: IioAuthUserCredentials): Boolean; // user login (user authorization)


    function AuthorizeApp(const AAppCredentials: IioAuthAppCredentials): Boolean; // app login (app authorization)
    function AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean; // request authorization to access a resource (scope)


  published
    // properties
    property Active: Boolean read FActive write FActive;
    property ConnectionName: String read FConnectionName write FConnectionName;
    property _Version: String read Get_Version;
    // events
    property OnAuthorizeApp: TioOnAuthorizeAppEvent read FOnAuthorizeApp write FOnAuthorizeApp;
    property OnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthCodeEvent read FOnAuthorizeAppGetUserAuthCode write FOnAuthorizeAppGetUserAuthCode;
    property OnAuthorizeUser: TioOnAuthorizeUserEvent read FOnAuthorizeUser write FOnAuthorizeUser;
  end;


implementation

uses
  iORM, System.SysUtils, iORM.PersistenceStrategy.Factory, iORM.Abstraction,
  iORM.Utilities, iORM.Exceptions, iORM.CommonTypes;

{ TioAuthorizationClient }

function TioAuthClient.AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean;
var
  LAccessToken: String;
  LSession: IioAuthSession;
begin
  LSession := TioApplication.Session;
  LAccessToken := LSession.AccessToken;
  Result := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeAccess(FConnectionName, AScope, AAuthIntention, LAccessToken)
end;

function TioAuthClient.AuthorizeApp(const AAppCredentials: IioAuthAppCredentials): Boolean;
var
  LDone: Boolean;
  LResultAppAuthorizationToken: String;
  LResultAppID: Integer;
  LSession: IioAuthSession;
  LUserID: Integer;
  LUserName: String;
  LUserAuthorizationToken: String;
begin
  Result := False;
  LResultAppAuthorizationToken := IO_AUTH_NULL_JWT;
  LUserAuthorizationToken := IO_AUTH_NULL_JWT;
  // first check if the component is enabled
  CheckIfEnabled;
  // invoke OnAuthorizeAppGetUserAuthCode event to retrieve the user authorization code/token
  if Assigned(FOnAuthorizeAppGetUserAuthCode) then
  begin
    FOnAuthorizeAppGetUserAuthCode(Self, AAppCredentials, LUserAuthorizationToken, LUserName, LUserID, Result);
    if not Result then
      raise EioAuthInvalidCredentialsException_401.Create('Unable to retrieve a valid user authorization token');
  end;
  // invoke OnAuthorizeApp event if assigned
  LDone := False;
  if Assigned(FOnAuthorizeApp) then
    FOnAuthorizeApp(Self, AAppCredentials, LUserAuthorizationToken, LResultAppAuthorizationToken, Result, LDone);
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    Result := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeApp(FConnectionName, AAppCredentials, LUserAuthorizationToken, LResultAppAuthorizationToken, LResultAppID);
  // if authorized then update session props (else raise an exception)
  if Result and (LResultAppAuthorizationToken <> IO_AUTH_NULL_JWT) then
  begin
    LSession := TioApplication.Session;
    LSession.UserID := LUserID;
    LSession.UserName := LUserName;
    LSession.UserAuthorizationToken := LUserAuthorizationToken;
    LSession.AppID := LResultAppID;
    LSession.AppAuthorizationToken := LResultAppAuthorizationToken;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid app credentials');
end;

function TioAuthClient.AuthorizeUser(const AUserCredentials: IioAuthUserCredentials): Boolean;
var
  LDone: Boolean;
  LResultUserAuthorizationToken: String;
  LResultUserID: Integer;
  LSession: IioAuthSession;
begin
  Result := False;
  LResultUserAuthorizationToken := IO_AUTH_NULL_JWT;
  // first check if the component is enabled
  CheckIfEnabled;
  // invoke OnAuthorizeUser event if assigned
  LDone := False;
  if Assigned(FOnAuthorizeUser) then
    FOnAuthorizeUser(Self, AUserCredentials, LResultUserAuthorizationToken, LResultUserID, Result, LDone);
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    Result := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeUser(FConnectionName, AUserCredentials, LResultUserAuthorizationToken, LResultUserID);
  // if authorized then update session props (else raise an exception)
  if Result and (LResultUserAuthorizationToken <> IO_AUTH_NULL_JWT) then
  begin
    LSession := TioApplication.Session;
    LSession.UserID := LResultUserID;
    LSession.UserName := AUserCredentials.LoginUser;
    LSession.UserAuthorizationToken := LResultUserAuthorizationToken;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid user credentials');
end;

procedure TioAuthClient.CheckIfEnabled;
begin
  if not FActive then
    raise EioAuthServerComponentNotEnabled_404.Create(Format('Component "%s" is not active', [Name]));
end;

constructor TioAuthClient.Create(AOwner: TComponent);
begin
  inherited;
  FActive := True;
  FConnectionName := String.Empty;
  // Set the singleton internal reference to itself (one only auth server at a time)
  TioAuthClient.FInstance := Self;
end;

destructor TioAuthClient.Destroy;
begin
  FInstance := nil;
  inherited;
end;

class function TioAuthClient.GetInstance: TioAuthClient;
begin
  Result := TioAuthClient.FInstance;
end;

function TioAuthClient.Get_Version: String;
begin
  Result := io.Version;
end;

end.
