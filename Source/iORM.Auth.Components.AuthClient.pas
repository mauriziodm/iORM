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
    // authorize events
    FAfterAuthorizeAccess: TioAfterAuthorizeAccessEvent;
    FAfterAuthorizeApp: TioAfterAuthorizeAppEvent;
    FAfterAuthorizeUser: TioAfterAuthorizeUserEvent;
    FBeforeAuthorizeAccess: TioBeforeAuthorizeAccessEvent;
    FBeforeAuthorizeApp: TioBeforeAuthorizeAppEvent;
    FBeforeAuthorizeUser: TioBeforeAuthorizeUserEvent;
    FOnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthCodeEvent;
    // need refresh events
    FAfterNeedRefresh: TioAfterNeedRefreshEvent;
    FBeforeNeedRefresh: TioBeforeNeedRefreshEvent;
    // token is expired events
    FAfterAccessTokenIsExpired: TioAfterTokenIsExpired;
    FAfterAppTokenIsExpired: TioAfterTokenIsExpired;
    FAfterRefreshTokenIsExpired: TioAfterTokenIsExpired;
    FAfterUserTokenIsExpired: TioAfterTokenIsExpired;
    FBeforeAccessTokenIsExpired: TioBeforeTokenIsExpired;
    FBeforeAppTokenIsExpired: TioBeforeTokenIsExpired;
    FBeforeRefreshTokenIsExpired: TioBeforeTokenIsExpired;
    FBeforeUserTokenIsExpired: TioBeforeTokenIsExpired;
    // is logged on events
    FBeforeIsLoggedOn: TioBeforeIsLoggedOn;
    FAfterIsLoggedOn: TioAfterIsLoggedOn;
    // on exception events
    FonUserLoginException: TioOnUserLoginException;
    // methods
    procedure CheckActive;
    function GetAccessTokenIsExpired: Boolean;
    function GetIsLoggedOn: Boolean;
    function GetNeedRefresh: Boolean;
    function GetRefreshTokenIsExpired: Boolean;
    function Get_Version: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TioAuthClient; static;
    function AuthorizeUser(const AUserCredentials: IioAuthUserCredentials): Boolean; // user login (user authorization)
    function AuthorizeApp(const AAppCredentials: IioAuthAppCredentials): Boolean; // app login (app authorization)
    function AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean; // request authorization to access a resource (scope)
    procedure NewAccessToken(const AAuthorizationToken: String); // request a new access token
    procedure RefreshAccessToken; // refresh the access token

    function UserLogin(const AUserCredentials: IioAuthUserCredentials): Boolean;

    property AccessTokenIsExpired: Boolean read GetRefreshTokenIsExpired;
    property IsLoggedOn: Boolean read GetIsLoggedOn;
    property NeedRefresh: Boolean read GetNeedRefresh;
    property RefreshTokenIsExpired: Boolean read GetRefreshTokenIsExpired;
  published
    // properties
    property Active: Boolean read FActive write FActive;
    property ConnectionName: String read FConnectionName write FConnectionName;
    property _Version: String read Get_Version;
    // authorize events
    property AfterAuthorizeAccess: TioAfterAuthorizeAccessEvent read FAfterAuthorizeAccess write FAfterAuthorizeAccess;
    property AfterAuthorizeApp: TioAfterAuthorizeAppEvent read FAfterAuthorizeApp write FAfterAuthorizeApp;
    property AfterAuthorizeUser: TioAfterAuthorizeUserEvent read FAfterAuthorizeUser write FAfterAuthorizeUser;
    property BeforeAuthorizeAccess: TioBeforeAuthorizeAccessEvent read FBeforeAuthorizeAccess write FBeforeAuthorizeAccess;
    property BeforeAuthorizeApp: TioBeforeAuthorizeAppEvent read FBeforeAuthorizeApp write FBeforeAuthorizeApp;
    property BeforeAuthorizeUser: TioBeforeAuthorizeUserEvent read FBeforeAuthorizeUser write FBeforeAuthorizeUser;
    property OnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthCodeEvent read FOnAuthorizeAppGetUserAuthCode write FOnAuthorizeAppGetUserAuthCode;
    // need refresh events
    property AfterNeedRefresh: TioAfterNeedRefreshEvent read FAfterNeedRefresh write FAfterNeedRefresh;
    property BeforeNeedRefresh: TioBeforeNeedRefreshEvent read FBeforeNeedRefresh write FBeforeNeedRefresh;
    // token is expired events
    property AfterAccessTokenIsExpired: TioAfterTokenIsExpired read FAfterAccessTokenIsExpired write FAfterAccessTokenIsExpired;
    property AfterAppTokenIsExpired: TioAfterTokenIsExpired read FAfterAppTokenIsExpired write FAfterAppTokenIsExpired;
    property AfterRefreshTokenIsExpired: TioAfterTokenIsExpired read FAfterRefreshTokenIsExpired write FAfterRefreshTokenIsExpired;
    property AfterUserTokenIsExpired: TioAfterTokenIsExpired read FAfterUserTokenIsExpired write FAfterUserTokenIsExpired;
    property BeforeAccessTokenIsExpired: TioBeforeTokenIsExpired read FBeforeAccessTokenIsExpired write FBeforeAccessTokenIsExpired;
    property BeforeAppTokenIsExpired: TioBeforeTokenIsExpired read FBeforeAppTokenIsExpired write FBeforeAppTokenIsExpired;
    property BeforeRefreshTokenIsExpired: TioBeforeTokenIsExpired read FBeforeRefreshTokenIsExpired write FBeforeRefreshTokenIsExpired;
    property BeforeUserTokenIsExpired: TioBeforeTokenIsExpired read FBeforeUserTokenIsExpired write FBeforeUserTokenIsExpired;
    // is logged on events
    property BeforeIsLoggedOn: TioBeforeIsLoggedOn read FBeforeIsLoggedOn write FBeforeIsLoggedOn;
    property AfterIsLoggedOn: TioAfterIsLoggedOn read FAfterIsLoggedOn write FAfterIsLoggedOn;
    // on exception events
    property onUserLoginException: TioOnUserLoginException read FonUserLoginException;
  end;

implementation

uses
  iORM, System.SysUtils, iORM.PersistenceStrategy.Factory, iORM.Abstraction,
  iORM.Utilities, iORM.Exceptions, iORM.CommonTypes, iORM.Auth.Factory;

{ TioAuthorizationClient }

function TioAuthClient.GetNeedRefresh: Boolean;
var
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  Result := False;
  LSession := TioApplication.Session;
  // First check if the component is enabled
  CheckActive;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeNeedRefresh) then
    FBeforeNeedRefresh(Self, LSession.AccessToken, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := LSession.NeedRefresh;
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterNeedRefresh) then
    FAfterNeedRefresh(Self, LSession.AccessToken, Result);
end;

function TioAuthClient.GetRefreshTokenIsExpired: Boolean;
var
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  Result := False;
  LSession := TioApplication.Session;
  // First check if the component is enabled
  CheckActive;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeRefreshTokenIsExpired) then
    FBeforeRefreshTokenIsExpired(Self, LSession.RefreshToken, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := LSession.RefreshTokenIsExpired;
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterRefreshTokenIsExpired) then
    FAfterRefreshTokenIsExpired(Self, LSession.RefreshToken, Result);
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
  CheckActive;
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
  if not LAuthResponse.IsAuth then
    raise EioAuthForbiddenException_403.Create(Format('Access forbidden to scope (%s)', [AScope]));
  //  return true
  Result := True;
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
  CheckActive;
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
  if LAuthResponse.IsAuth and LAuthResponse.HasAppTkn then
  begin
    LSession := TioApplication.Session;
    Lsession.AppToken := LAuthResponse.AppTkn;
    LSession.AppTokenExp := LAuthResponse.AppExp;
    Lsession.App := LAuthResponse.App;
    Lsession.AppOID := LAuthResponse.AppOID;
    LSession.UserToken := LAuthResponse.UsrTkn;
    LSession.UserTokenExp := LAuthResponse.UsrExp;
    LSession.User := LAuthResponse.Usr;
    LSession.UserOID := LAuthResponse.UsrOID;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid app credentials');
  //  return true
  Result := True;
end;

function TioAuthClient.AuthorizeUser(const AUserCredentials: IioAuthUserCredentials): Boolean;
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  Result := False;
  // first check if the component is enabled
  CheckActive;
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
  if LAuthResponse.IsAuth and LAuthResponse.HasUsrTkn then
  begin
    LSession := TioApplication.Session;
    LSession.UserToken := LAuthResponse.UsrTkn;
    LSession.UserTokenExp := LAuthResponse.UsrExp;
    LSession.User := LAuthResponse.Usr;
    LSession.UserOID := LAuthResponse.UsrOID;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid user credentials');
  //  return true
  Result := True;
end;

procedure TioAuthClient.CheckActive;
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

function TioAuthClient.GetAccessTokenIsExpired: Boolean;
var
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  Result := False;
  LSession := TioApplication.Session;
  // First check if the component is enabled
  CheckActive;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeAccessTokenIsExpired) then
    FBeforeRefreshTokenIsExpired(Self, LSession.AccessToken, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := LSession.AccessTokenIsExpired;
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterAccessTokenIsExpired) then
    FAfterAccessTokenIsExpired(Self, LSession.AccessToken, Result);
end;

class function TioAuthClient.GetInstance: TioAuthClient;
begin
  Result := TioAuthClient.FInstance;
end;

function TioAuthClient.GetIsLoggedOn: Boolean;
var
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  Result := False;
  LSession := TioApplication.Session;
  // First check if the component is enabled
  CheckActive;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeIsLoggedOn) then
    FBeforeIsLoggedOn(Self, LSession, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := (LSession.HasAccessToken and not AccessTokenIsExpired) or (LSession.HasRefreshToken and not RefreshTokenIsExpired);
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterIsLoggedOn) then
    FAfterIsLoggedOn(Self, LSession, Result);
end;

function TioAuthClient.Get_Version: String;
begin
  Result := io.Version;
end;

procedure TioAuthClient.NewAccessToken(const AAuthorizationToken: String);
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  // first check if the component is enabled
  CheckActive;
  LDone := False;
  // invoke BeforeNewAccessToken if assigned
//  if Assigned(FBeforeNewAccessToken) then
//  begin
//    LAuthResponse := TioAuthFactory.NewAuthResponse;
//    FBeforeNewAccessToken(Self, AUserCredentials, LAuthResponse, LDone);
//  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).Auth_NewAccessToken(FConnectionName, AAuthorizationToken);
  // invoke AfterNewAccessToken if assigned
//  if Assigned(FAfterNewAccessToken) then
//    FAfterNewAccessToken(Self, AUserCredentials, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuth and LAuthResponse.HasAccTkn then
  begin
    LSession := TioApplication.Session;
    LSession.AccessToken := LAuthResponse.AccTkn;
    LSession.AccessTokenExp := LAuthResponse.AccExp;
    LSession.RefreshAfter := LAuthResponse.RefAft;
    if LAuthResponse.HasRefTkn then
    begin
      LSession.RefreshToken := LAuthResponse.RefTkn;
      LSession.RefreshTokenExp := LAuthResponse.RefExp;
    end;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid user or app authorization token');
end;

procedure TioAuthClient.RefreshAccessToken;
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
  LSession: IioAuthSession;
begin
  LSession := TioApplication.Session;
  // first check if the component is enabled
  CheckActive;
  LDone := False;
  // invoke BeforeRefreshAccessToken if assigned
//  if Assigned(FBeforeRefreshAccessToken) then
//  begin
//    LAuthResponse := TioAuthFactory.NewAuthResponse;
//    FBeforeRefreshAccessToken(Self, AUserCredentials, LAuthResponse, LDone);
//  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).Auth_RefreshAccessToken(FConnectionName, LSession.RefreshToken);
  // invoke AfterRefreshAccessToken if assigned
//  if Assigned(FAfterRefreshAccessToken) then
//    FAfterRefreshAccessToken(Self, AUserCredentials, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuth and LAuthResponse.HasAccTkn then
  begin
    LSession.AccessToken := LAuthResponse.AccTkn;
    LSession.AccessTokenExp := LAuthResponse.AccExp;
    LSession.RefreshAfter := LAuthResponse.RefAft;
    if LAuthResponse.HasRefTkn then
    begin
      LSession.RefreshToken := LAuthResponse.RefTkn;
      LSession.RefreshTokenExp := LAuthResponse.RefExp;
    end;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid refresh token');
end;

function TioAuthClient.UserLogin(const AUserCredentials: IioAuthUserCredentials): Boolean;
var
  LException: Exception;
begin
  Result := False;
  // first check if the component is enabled
  CheckActive;
  // executes the operation inside a try-finally block to be able to invoke the onException... event if there is one
  try
    // step 1 - authorize user
    AuthorizeUser(AUserCredentials);
    // step 2 - gwt new access token (and refresh token usually)
    NewAccessToken(TioApplication.Session.UserToken);
    // return true if success
    Result := True;
  except
    // if an onException event handler is assigned then invoke it else re-raise the exception
    if Assigned(FonUserLoginException) then
    begin
      LException := AcquireExceptionObject as Exception;
      try
        FonUserLoginException(Self, AUserCredentials, TioApplication.Session, LException);
      finally
        LException.Free;
      end;
    end
    else
      raise(LException);
  end;
end;

end.
