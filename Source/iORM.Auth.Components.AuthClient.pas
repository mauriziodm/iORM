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
    FonAppLoginException: TioOnAppLoginException;
    FonAuthorizeAccessException: TioOnAuthorizeAccessException;
    FonLogoutException: TioOnLogoutException;
    FonUserLoginException: TioOnUserLoginException;
    // methods
    function Get_Version: String;
    function _AccessTokenIsExpired(const ASession: IioAuthSession): Boolean;
    procedure _AuthorizeUser(const AUserCredentials: IioAuthUserCredentials; const ASession: IioAuthSession);
    procedure _AuthorizeApp(const AAppCredentials: IioAuthAppCredentials; const AUserAuthorizationCode: String; const ASession: IioAuthSession);
    procedure _AuthorizeAppRequestUserAuthCode(const AAppCredentials: IioAuthAppCredentials);
    function _AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): Boolean;
    procedure _CheckActive; inline;
    function _IsLoggedOn(const ASession: IioAuthSession): Boolean;
    procedure _RaiseAlreadyLoggedOnException(const ASession: IioAuthSession);
    function _NeedRefresh(const ASession: IioAuthSession): Boolean;
    procedure _NewAccessToken(const AAuthorizationToken: String; const ASession: IioAuthSession);
    procedure _RefreshAccessToken(const ASession: IioAuthSession);
    function _RefreshTokenIsExpired(const ASession: IioAuthSession): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TioAuthClient; static;
    function AppLogin(const AAppCredentials: IioAuthAppCredentials): Boolean;
    function AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean;
    function IsLoggedOn: Boolean;
    function Logout: Boolean;
    function UserLogin(const AUserCredentials: IioAuthUserCredentials): Boolean;
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
    property AfterIsLoggedOn: TioAfterIsLoggedOn read FAfterIsLoggedOn write FAfterIsLoggedOn;
    property BeforeIsLoggedOn: TioBeforeIsLoggedOn read FBeforeIsLoggedOn write FBeforeIsLoggedOn;
    // on exception events
    property onAppLoginException: TioOnAppLoginException read FonAppLoginException;
    property onAuthorizeAccessException: TioOnAuthorizeAccessException read FonAuthorizeAccessException;
    property onLogoutException: TioOnLogoutException read FonLogoutException;
    property onUserLoginException: TioOnUserLoginException read FonUserLoginException;
  end;

implementation

uses
  iORM, System.SysUtils, iORM.PersistenceStrategy.Factory, iORM.Abstraction,
  iORM.Utilities, iORM.Exceptions, iORM.CommonTypes, iORM.Auth.Factory;

{ TioAuthorizationClient }

function TioAuthClient._NeedRefresh(const ASession: IioAuthSession): Boolean;
var
  LDone: Boolean;
begin
  Result := False;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeNeedRefresh) then
    FBeforeNeedRefresh(Self, ASession, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := ASession.NeedRefresh;
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterNeedRefresh) then
    FAfterNeedRefresh(Self, ASession, Result);
end;

function TioAuthClient._RefreshTokenIsExpired(const ASession: IioAuthSession): Boolean;
var
  LDone: Boolean;
begin
  Result := False;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeRefreshTokenIsExpired) then
    FBeforeRefreshTokenIsExpired(Self, ASession, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := ((ASession.RefreshTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > ASession.RefreshTokenExp)) or (ASession.RefreshToken = IO_STRING_NULL_VALUE);
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterRefreshTokenIsExpired) then
    FAfterRefreshTokenIsExpired(Self, ASession, Result);
end;

function TioAuthClient._AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): Boolean;
var
  LDone: Boolean;
  LAuthResponse: IioAuthResponse;
begin
  Result := False;
  // invoke BeforeAuthorizeAccess if assigned
  LDone := False;
  if Assigned(FBeforeAuthorizeAccess) then
  begin
    LAuthResponse := TioAuthFactory.NewAuthResponse;
    FBeforeAuthorizeAccess(Self, AScope, AAuthIntention, AAccessToken, LAuthResponse, LDone);
  end;
  // if the access request was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeAccess(FConnectionName, AScope, AAuthIntention, AAccessToken);
  // invoke AfterAuthorizeAccess if assigned
  if Assigned(FAfterAuthorizeAccess) then
    FAfterAuthorizeAccess(Self, AScope, AAuthIntention, AAccessToken, LAuthResponse);
  // if not authorized  raise an exception (non ci sarebbe bisogno perchè la solleva già il AuthServer ma per ulteriore sicurezza)
  if not LAuthResponse.IsAuth then
    raise EioAuthForbiddenException_403.Create(Format('Access forbidden to scope (%s)', [AScope]));
  //  return true
  Result := True;
end;

procedure TioAuthClient._AuthorizeApp(const AAppCredentials: IioAuthAppCredentials; const AUserAuthorizationCode: String; const ASession: IioAuthSession);
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
begin
  // invoke BeforeAuthorizeApp if assigned
  LDone := False;
  if Assigned(FBeforeAuthorizeApp) then
  begin
    LAuthResponse := TioAuthFactory.NewAuthResponse;
    FBeforeAuthorizeApp(Self, AAppCredentials, AUserAuthorizationCode, LAuthResponse, LDone);
  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).AuthorizeApp(FConnectionName, AAppCredentials, AUserAuthorizationCode);
  // invoke AfterAuthorizeApp if assigned
  if Assigned(FAfterAuthorizeApp) then
    FAfterAuthorizeApp(Self, AAppCredentials, AUserAuthorizationCode, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuth and LAuthResponse.HasAppTkn then
  begin
    ASession.Clear;
    ASession.AppToken := LAuthResponse.AppTkn;
    ASession.AppTokenExp := LAuthResponse.AppExp;
    ASession.App := LAuthResponse.App;
    ASession.AppOID := LAuthResponse.AppOID;
    ASession.UserToken := LAuthResponse.UsrTkn;
    ASession.UserTokenExp := LAuthResponse.UsrExp;
    ASession.User := LAuthResponse.Usr;
    ASession.UserOID := LAuthResponse.UsrOID;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid app credentials');
end;

procedure TioAuthClient._AuthorizeAppRequestUserAuthCode(const AAppCredentials: IioAuthAppCredentials);
var
  LGetUserAuthCodeEventResponseMethod: TioGetUserAuthCodeEventResponseMethod;
begin
  // set the user auth code event reponse
  LGetUserAuthCodeEventResponseMethod := procedure(const AIsAuthorized: Boolean; const AUserAuthorizationCode: String = IO_AUTH_NULL_JWT; const AUser: String = IO_STRING_NULL_VALUE; const AUserOID: Integer = IO_INTEGER_NULL_VALUE; const AExpiration: TDateTime = IO_DATETIME_NULL_VALUE)
  var
    LDone: Boolean;
    LException: Exception;
    LSession: IioAuthSession;
  begin
    // acquire the session
    LSession := TioApplication.AcquireSession;
    try
      // executes the operation inside a try-finally block to be able to invoke the onException... event if there is one
      try
        // step 3 - authorize app
        _AuthorizeApp(AAppCredentials, AUserAuthorizationCode, LSession);
        // step 4 - get new access token (and refresh token usually)
        _NewAccessToken(LSession.AppToken, LSession);
        // return true if success
      except
        // if an onException event handler is assigned then invoke it else re-raise the exception
        if Assigned(FonUserLoginException) then
        begin
          LException := AcquireExceptionObject as Exception;
          try
            FonAppLoginException(Self, AAppCredentials, LSession, LException);
          finally
            LException.Free;
          end;
        end
        else
          raise(LException);
      end;
    finally
      TioApplication.ReleaseSession;
    end;
  end;
  // invoke OnAuthorizeAppGetUserAuthCode event to retrieve the user authorization code/token
  if Assigned(FOnAuthorizeAppGetUserAuthCode) then
    FOnAuthorizeAppGetUserAuthCode(Self, AAppCredentials, LGetUserAuthCodeEventResponseMethod)
  else
    raise EioAuthException.Create(Format('"OnAuthorizeAppGetUserAuthCode" handler isn''t assigned on TioAuthClient component named "%s"', [Name]));
end;

procedure TioAuthClient._AuthorizeUser(const AUserCredentials: IioAuthUserCredentials; const ASession: IioAuthSession);
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
begin
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
    ASession.Clear;
    ASession.UserToken := LAuthResponse.UsrTkn;
    ASession.UserTokenExp := LAuthResponse.UsrExp;
    ASession.User := LAuthResponse.Usr;
    ASession.UserOID := LAuthResponse.UsrOID;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid user credentials');
end;

procedure TioAuthClient._CheckActive;
begin
  if not FActive then
    raise EioAuthComponentNotEnabled_404.Create(Format('Component "%s" is not active', [Name]));
end;

function TioAuthClient.AppLogin(const AAppCredentials: IioAuthAppCredentials): Boolean;
var
  LException: Exception;
  LSession: IioAuthSession;
begin
  Result := False;
  // first check if the component is enabled
  _CheckActive;
  // -------------------- check if already logged on --------------------
  // acquire the session
  LSession := TioApplication.AcquireSession;
  try
    // executes the operation inside a try-finally block to be able to invoke the onException... event if there is one
    try
      // step 1 - check if already logged on
      if _IsLoggedOn(LSession) then
        _RaiseAlreadyLoggedOnException(LSession);
    except
      // if an onException event handler is assigned then invoke it else re-raise the exception
      if Assigned(FonUserLoginException) then
      begin
        LException := AcquireExceptionObject as Exception;
        try
          FonAppLoginException(Self, AAppCredentials, LSession, LException);
        finally
          LException.Free;
        end;
      end
      else
        raise(LException);
    end;
  finally
    TioApplication.ReleaseSession;
  end;
  // -------------------- check if already logged on --------------------
  // step 2 - requeste the user authorization code (steps 3 & 4 are in the "_AuthorizeAppRequestUserAuthCode" method
  _AuthorizeAppRequestUserAuthCode(AAppCredentials);
  // return true if success
  Result := True;
end;

function TioAuthClient.AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean;
var
  LException: Exception;
  LSession: IioAuthSession;
begin
  Result := False;
  // first check if the component is enabled
  _CheckActive;
  // acquire the session
  LSession := TioApplication.AcquireSession;
  try
    // executes the operation inside a try-finally block to be able to invoke the onException... event if there is one
    try
      // step 1 - check if logged on
      if not _IsLoggedOn(LSession) then
        raise EioAuthNotLoggedOnException_401.Create('User or App is not logged on');
      // step 2 - check if the access token need to be refreshed
      if _NeedRefresh(LSession) then
        _RefreshAccessToken(LSession);
      // step 3 - authorize access
      Result := _AuthorizeAccess(AScope, AAuthIntention, LSession.AccessToken);
    except
      // if an onException event handler is assigned then invoke it else re-raise the exception
      if Assigned(FonUserLoginException) then
      begin
        LException := AcquireExceptionObject as Exception;
        try
          FonAuthorizeAccessException(Self, AScope, AAuthIntention, LSession, LException);
        finally
          LException.Free;
        end;
      end
      else
        raise(LException);
    end;
  finally
    TioApplication.ReleaseSession;
  end;
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

function TioAuthClient._AccessTokenIsExpired(const ASession: IioAuthSession): Boolean;
var
  LDone: Boolean;
begin
  Result := False;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeAccessTokenIsExpired) then
    FBeforeRefreshTokenIsExpired(Self, ASession, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := ((ASession.AccessTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > ASession.AccessTokenExp)) or (ASession.AccessToken = IO_STRING_NULL_VALUE);
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterAccessTokenIsExpired) then
    FAfterAccessTokenIsExpired(Self, ASession, Result);
end;

class function TioAuthClient.GetInstance: TioAuthClient;
begin
  Result := TioAuthClient.FInstance;
end;

function TioAuthClient._IsLoggedOn(const ASession: IioAuthSession): Boolean;
var
  LDone: Boolean;
begin
  Result := False;
  // invoke BeforeNeedRefresh event if assigned
  LDone := False;
  if Assigned(FBeforeIsLoggedOn) then
    FBeforeIsLoggedOn(Self, ASession, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := (ASession.HasAccessToken and not _AccessTokenIsExpired(ASession)) or (ASession.HasRefreshToken and not _RefreshTokenIsExpired(ASession));
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterIsLoggedOn) then
    FAfterIsLoggedOn(Self, ASession, Result);
end;

function TioAuthClient.Get_Version: String;
begin
  Result := io.Version;
end;

function TioAuthClient.IsLoggedOn: Boolean;
begin

end;

function TioAuthClient.Logout: Boolean;
var
  LException: Exception;
  LSession: IioAuthSession;
begin
  Result := False;
  // first check if the component is enabled
  _CheckActive;
  // acquire the session
  LSession := TioApplication.AcquireSession;
  try
    // executes the operation inside a try-finally block to be able to invoke the onException... event if there is one
    try
      // step 1 - clear the session data
      LSession.Clear;
      // return true if success
      Result := True;
    except
      // if an onException event handler is assigned then invoke it else re-raise the exception
      if Assigned(FonUserLoginException) then
      begin
        LException := AcquireExceptionObject as Exception;
        try
          FonLogoutException(Self, LSession, LException);
        finally
          LException.Free;
        end;
      end
      else
        raise(LException);
    end;
  finally
    TioApplication.ReleaseSession;
  end;
end;

procedure TioAuthClient._NewAccessToken(const AAuthorizationToken: String; const ASession: IioAuthSession);
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
begin
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
    ASession.AccessToken := LAuthResponse.AccTkn;
    ASession.AccessTokenExp := LAuthResponse.AccExp;
    ASession.RefreshAfter := LAuthResponse.RefAft;
    if LAuthResponse.HasRefTkn then
    begin
      ASession.RefreshToken := LAuthResponse.RefTkn;
      ASession.RefreshTokenExp := LAuthResponse.RefExp;
    end;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid user or app authorization token');
end;

procedure TioAuthClient._RaiseAlreadyLoggedOnException(const ASession: IioAuthSession);
begin
  if ASession.HasAppToken then
    raise EioAuthAlreadyLoggedOnException_401.Create(Format('Already logged on as app "%s", user "%s"', [ASession.App, ASession.User]))
  else
    raise EioAuthAlreadyLoggedOnException_401.Create(Format('Already logged on as user "%s"', [ASession.User]));
end;

procedure TioAuthClient._RefreshAccessToken(const ASession: IioAuthSession);
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
begin
  LDone := False;
  // invoke BeforeRefreshAccessToken if assigned
//  if Assigned(FBeforeRefreshAccessToken) then
//  begin
//    LAuthResponse := TioAuthFactory.NewAuthResponse;
//    FBeforeRefreshAccessToken(Self, AUserCredentials, LAuthResponse, LDone);
//  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy(FConnectionName).Auth_RefreshAccessToken(FConnectionName, ASession.RefreshToken);
  // invoke AfterRefreshAccessToken if assigned
//  if Assigned(FAfterRefreshAccessToken) then
//    FAfterRefreshAccessToken(Self, AUserCredentials, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuth and LAuthResponse.HasAccTkn then
  begin
    ASession.AccessToken := LAuthResponse.AccTkn;
    ASession.AccessTokenExp := LAuthResponse.AccExp;
    ASession.RefreshAfter := LAuthResponse.RefAft;
    if LAuthResponse.HasRefTkn then
    begin
      ASession.RefreshToken := LAuthResponse.RefTkn;
      ASession.RefreshTokenExp := LAuthResponse.RefExp;
    end;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid refresh token');
end;

function TioAuthClient.UserLogin(const AUserCredentials: IioAuthUserCredentials): Boolean;
var
  LException: Exception;
  LSession: IioAuthSession;
begin
  Result := False;
  // first check if the component is enabled
  _CheckActive;
  // acquire the session
  LSession := TioApplication.AcquireSession;
  try
    // executes the operation inside a try-finally block to be able to invoke the onException... event if there is one
    try
      // step 1 - check if already logged on
      if _IsLoggedOn(LSession) then
        _RaiseAlreadyLoggedOnException(LSession);
      // step 2 - authorize user
      _AuthorizeUser(AUserCredentials, LSession);
      // step 3 - get new access token (and refresh token usually)
      _NewAccessToken(LSession.UserToken, LSession);
      // return true if success
      Result := True;
    except
      // if an onException event handler is assigned then invoke it else re-raise the exception
      if Assigned(FonUserLoginException) then
      begin
        LException := AcquireExceptionObject as Exception;
        try
          FonUserLoginException(Self, AUserCredentials, LSession, LException);
        finally
          LException.Free;
        end;
      end
      else
        raise(LException);
    end;
  finally
    TioApplication.ReleaseSession;
  end;
end;

end.
