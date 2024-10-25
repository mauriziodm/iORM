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
    FAfterAuthorizeAccess: TioAfterAuthorizeAccessEvent;
    FAfterAuthorizeApp: TioAfterAuthorizeAppEvent;
    FAfterAuthorizeUser: TioAfterAuthorizeUserEvent;
    FBeforeAuthorizeAccess: TioBeforeAuthorizeAccessEvent;
    FBeforeAuthorizeApp: TioBeforeAuthorizeAppEvent;
    FBeforeAuthorizeUser: TioBeforeAuthorizeUserEvent;
    FOnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthCodeEvent;


    FOnAccessTokenNeedRefresh: TioOnAccessTokenNeedRefreshEvent;
    // methods
    procedure CheckIfEnabled;
    function Get_Version: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TioAuthClient; static;
    function AccessTokenNeedRefresh(const AAccessToken: String): Boolean;
    function AuthorizeUser(const AUserCredentials: IioAuthUserCredentials): Boolean; // user login (user authorization)
    function AuthorizeApp(const AAppCredentials: IioAuthAppCredentials): Boolean; // app login (app authorization)
    function AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean; // request authorization to access a resource (scope)
  published
    // properties
    property Active: Boolean read FActive write FActive;
    property ConnectionName: String read FConnectionName write FConnectionName;
    property _Version: String read Get_Version;
    // events
    property OnAccessTokenNeedRefresh: TioOnAccessTokenNeedRefreshEvent read FOnAccessTokenNeedRefresh write FOnAccessTokenNeedRefresh;

    property AfterAuthorizeAccess: TioAfterAuthorizeAccessEvent read FAfterAuthorizeAccess write FAfterAuthorizeAccess;
    property AfterAuthorizeApp: TioAfterAuthorizeAppEvent read FAfterAuthorizeApp write FAfterAuthorizeApp;
    property AfterAuthorizeUser: TioAfterAuthorizeUserEvent read FAfterAuthorizeUser write FAfterAuthorizeUser;
    property BeforeAuthorizeAccess: TioBeforeAuthorizeAccessEvent read FBeforeAuthorizeAccess write FBeforeAuthorizeAccess;
    property BeforeAuthorizeApp: TioBeforeAuthorizeAppEvent read FBeforeAuthorizeApp write FBeforeAuthorizeApp;
    property BeforeAuthorizeUser: TioBeforeAuthorizeUserEvent read FBeforeAuthorizeUser write FBeforeAuthorizeUser;
    property OnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthCodeEvent read FOnAuthorizeAppGetUserAuthCode write FOnAuthorizeAppGetUserAuthCode;
  end;


implementation

uses
  iORM, System.SysUtils, iORM.PersistenceStrategy.Factory, iORM.Abstraction,
  iORM.Utilities, iORM.Exceptions, iORM.CommonTypes, iORM.Auth.Factory;

{ TioAuthorizationClient }

function TioAuthClient.AccessTokenNeedRefresh(const AAccessToken: String): Boolean;
var
  LDone: Boolean;
begin
//  Result := False;
//  // First check if the component is enabled
//  CheckIfEnabled;
//  // invoke OnLogin event if assigned
//  LDone := False;
//  if Assigned(FOnAccessTokenNeedRefresh) then
//    FOnAccessTokenNeedRefresh(Self, AAccessToken, Result, LDone);
//  // if the check of the token was not handled then use the internal implementation
//  if not LDone then
//    Result := TioApplication.Session.NeedRefresh;
end;

function TioAuthClient.AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean;
var
  LDone: Boolean;
  LAccessToken: String;
  LAuthResponse: IioAuthResponse;
begin
  Result := False;
  LAccessToken := TioApplication.Session.AccessToken;
  // first check if the component is enabled
  CheckIfEnabled;
  // invoke BeforeAuthorizeAccess if assigned
  LDone := False;
  if Assigned(FBeforeAuthorizeAccess) then
  begin
    LAuthResponse := TioAuthFactory.NewAuthResponse;
    FBeforeAuthorizeAccess(Self, AScope, AAuthIntention, LAccessToken, LAuthResponse, LDone);
  end;
  // if the access request was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeAccess(FConnectionName, AScope, AAuthIntention, LAccessToken);
  // invoke AfterAuthorizeAccess if assigned
  if Assigned(FAfterAuthorizeAccess) then
    FAfterAuthorizeAccess(Self, AScope, AAuthIntention, LAccessToken, LAuthResponse);
  // if not authorized  raise an exception (non ci sarebbe bisogno perchè la solleva già il AuthServer ma per ulteriore sicurezza)
  if not LAuthResponse.IsAuthorized then
    raise EioAuthForbiddenException_403.Create(Format('Access forbidden to scope (%s)', [AScope]));
end;

function TioAuthClient.AuthorizeApp(const AAppCredentials: IioAuthAppCredentials): Boolean;
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
  LSession: IioAuthSession;
  LUserAuthorizationToken: String;
begin
  Result := False;
  LUserAuthorizationToken := IO_AUTH_NULL_JWT;
  // first check if the component is enabled
  CheckIfEnabled;
  // invoke OnAuthorizeAppGetUserAuthCode event to retrieve the user authorization code/token
  if Assigned(FOnAuthorizeAppGetUserAuthCode) then
  begin
    FOnAuthorizeAppGetUserAuthCode(Self, AAppCredentials, LUserAuthorizationToken, Result);
    if not Result then
      raise EioAuthInvalidCredentialsException_401.Create('Unable to retrieve a valid user authorization token');
  end;
  // invoke BeforeAuthorizeApp if assigned
  LDone := False;
  if Assigned(FBeforeAuthorizeApp) then
  begin
    LAuthResponse := TioAuthFactory.NewAuthResponse;
    FBeforeAuthorizeApp(Self, AAppCredentials, LUserAuthorizationToken, LAuthResponse, LDone);
  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeApp(FConnectionName, AAppCredentials, LUserAuthorizationToken);
  // invoke AfterAuthorizeApp if assigned
  if Assigned(FAfterAuthorizeApp) then
    FAfterAuthorizeApp(Self, AAppCredentials, LUserAuthorizationToken, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuthorized and LAuthResponse.HasAppAuthToken then
  begin
    LSession := TioApplication.Session;
    Lsession.AppAuthorizationToken := LAuthResponse.AppAuthToken;
    Lsession.AppOID := LAuthResponse.AppOID;
    Lsession.App := LAuthResponse.App;
    LSession.UserAuthorizationToken := LAuthResponse.UserAuthToken;
    LSession.UserOID := LAuthResponse.UserOID;
    LSession.User := LAuthResponse.User;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid app credentials');
end;

function TioAuthClient.AuthorizeUser(const AUserCredentials: IioAuthUserCredentials): Boolean;
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  Result := False;
  // first check if the component is enabled
  CheckIfEnabled;
  // invoke BeforeAuthorizeUser if assigned
  LDone := False;
  if Assigned(FBeforeAuthorizeUser) then
  begin
    LAuthResponse := TioAuthFactory.NewAuthResponse;
    FBeforeAuthorizeUser(Self, AUserCredentials, LAuthResponse, LDone);
  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeUser(FConnectionName, AUserCredentials);
  // invoke AfterAuthorizeUser if assigned
  if Assigned(FAfterAuthorizeUser) then
    FAfterAuthorizeUser(Self, AUserCredentials, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuthorized and LAuthResponse.HasUserAuthToken then
  begin
    LSession := TioApplication.Session;
    LSession.UserAuthorizationToken := LAuthResponse.UserAuthToken;
    LSession.UserOID := LAuthResponse.UserOID;
    LSession.User := LAuthResponse.User;
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
