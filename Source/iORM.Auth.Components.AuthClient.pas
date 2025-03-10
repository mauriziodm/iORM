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
  System.Classes, iORM.Auth.Interfaces, iORM.CommonTypes;

type

  TioAuthClient = class(TComponent)
  private
    // singleton class fields
    class var FInstance: TioAuthClient;
  private
    // fields
    FActive: Boolean;
    FAsync: Boolean;
    FConnectionName: String;
    // authorize events
    FAfterAuthorizeAccess: TioAfterAuthorizeAccessEvent;
    FAfterAuthorizeApp: TioAfterAuthorizeAppEvent;
    FAfterAuthorizeUser: TioAfterAuthorizeUserEvent;
    FBeforeAuthorizeAccess: TioBeforeAuthorizeAccessEvent;
    FBeforeAuthorizeApp: TioBeforeAuthorizeAppEvent;
    FBeforeAuthorizeUser: TioBeforeAuthorizeUserEvent;
    FOnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthGrantEvent;
    // access token generation or refresh events
    FAfterNewAccessToken: TioAfterNewAccessTokenEvent;
    FAfterNeedRefresh: TioAfterNeedRefreshEvent;
    FAfterRefreshAccessToken: TioAfterRefreshAccessTokenEvent;
    FBeforeNewAccessToken: TioBeforeNewAccessTokenEvent;
    FBeforeNeedRefresh: TioBeforeNeedRefreshEvent;
    FBeforeRefreshAccessToken: TioBeforeRefreshAccessTokenEvent;
    // token is expired events
    FAfterAccessTokenIsExpired: TioAfterTokenIsExpiredEvent;
    FAfterAppTokenIsExpired: TioAfterTokenIsExpiredEvent;
    FAfterRefreshTokenIsExpired: TioAfterTokenIsExpiredEvent;
    FAfterUserTokenIsExpired: TioAfterTokenIsExpiredEvent;
    FBeforeAccessTokenIsExpired: TioBeforeTokenIsExpiredEvent;
    FBeforeAppTokenIsExpired: TioBeforeTokenIsExpiredEvent;
    FBeforeRefreshTokenIsExpired: TioBeforeTokenIsExpiredEvent;
    FBeforeUserTokenIsExpired: TioBeforeTokenIsExpiredEvent;
    // is logged on events
    FBeforeIsLoggedOn: TioBeforeIsLoggedOnEvent;
    FAfterIsLoggedOn: TioAfterIsLoggedOnEvent;
    // on exception events
    FonAppLoginException: TioOnAppLoginExceptionEvent;
    FonAuthorizeAccessException: TioOnAuthorizeAccessExceptionEvent;
    FonIsLoggedOnException: TioOnAuthExceptionEvent;
    FonLogoutException: TioOnAuthExceptionEvent;
    FonUserLoginException: TioOnUserLoginExceptionEvent;
    // methods
    function Get_Version: String;
    function _AccessTokenIsExpired(const ASession: IioAuthSessionData): Boolean;
    procedure _AuthorizeUser(const AUserCredentials: IioAuthUserCredentials; const ASession: IioAuthSessionData);
    procedure _AuthorizeApp_RequestUserAuthGrant(const AAppCredentials: IioAuthAppCredentials);
    function _AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): IioAuthResponse;
    procedure _CheckActive; inline;
    procedure _FillSessionData(const ASession: IioAuthSessionData; const AAuthResponse: IioAuthResponse);
    function _IsLoggedOn(const ASession: IioAuthSessionData): Boolean;
    procedure _RaiseAlreadyLoggedOnException(const ASession: IioAuthSessionData);
    function _NeedRefresh(const ASession: IioAuthSessionData): Boolean;
    procedure _NewAccessToken(const ACredentials: IioAuthCredentials; const AAuthGrant: String = IO_STRING_NULL_VALUE);
    procedure _RefreshAccessToken(const ARefreshToken: String); // Da completare
    function _RefreshTokenIsExpired(const ASession: IioAuthSessionData): Boolean;
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
    property Active: Boolean read FActive write FActive default True;
    property Async: Boolean read FAsync write FAsync default False;
    property ConnectionName: String read FConnectionName write FConnectionName;
    property _Version: String read Get_Version;
    // authorize events
    property AfterAuthorizeAccess: TioAfterAuthorizeAccessEvent read FAfterAuthorizeAccess write FAfterAuthorizeAccess;
    property AfterAuthorizeApp: TioAfterAuthorizeAppEvent read FAfterAuthorizeApp write FAfterAuthorizeApp;
    property AfterAuthorizeUser: TioAfterAuthorizeUserEvent read FAfterAuthorizeUser write FAfterAuthorizeUser;
    property BeforeAuthorizeAccess: TioBeforeAuthorizeAccessEvent read FBeforeAuthorizeAccess write FBeforeAuthorizeAccess;
    property BeforeAuthorizeApp: TioBeforeAuthorizeAppEvent read FBeforeAuthorizeApp write FBeforeAuthorizeApp;
    property BeforeAuthorizeUser: TioBeforeAuthorizeUserEvent read FBeforeAuthorizeUser write FBeforeAuthorizeUser;
    property OnAuthorizeAppGetUserAuthCode: TioOnAuthorizeAppGetUserAuthGrantEvent read FOnAuthorizeAppGetUserAuthCode write FOnAuthorizeAppGetUserAuthCode;
    // access token generation or refresh events
    property AfterNewAccessToken: TioAfterNewAccessTokenEvent read FAfterNewAccessToken write FAfterNewAccessToken;
    property AfterNeedRefresh: TioAfterNeedRefreshEvent read FAfterNeedRefresh write FAfterNeedRefresh;
    property AfterRefreshAccessToken: TioAfterRefreshAccessTokenEvent read FAfterRefreshAccessToken write FAfterRefreshAccessToken;
    property BeforeNewAccessToken: TioBeforeNewAccessTokenEvent read FBeforeNewAccessToken write FBeforeNewAccessToken;
    property BeforeNeedRefresh: TioBeforeNeedRefreshEvent read FBeforeNeedRefresh write FBeforeNeedRefresh;
    property BeforeRefreshAccessToken: TioBeforeRefreshAccessTokenEvent read FBeforeRefreshAccessToken write FBeforeRefreshAccessToken;
    // token is expired events
    property AfterAccessTokenIsExpired: TioAfterTokenIsExpiredEvent read FAfterAccessTokenIsExpired write FAfterAccessTokenIsExpired;
    property AfterAppTokenIsExpired: TioAfterTokenIsExpiredEvent read FAfterAppTokenIsExpired write FAfterAppTokenIsExpired;
    property AfterRefreshTokenIsExpired: TioAfterTokenIsExpiredEvent read FAfterRefreshTokenIsExpired write FAfterRefreshTokenIsExpired;
    property AfterUserTokenIsExpired: TioAfterTokenIsExpiredEvent read FAfterUserTokenIsExpired write FAfterUserTokenIsExpired;
    property BeforeAccessTokenIsExpired: TioBeforeTokenIsExpiredEvent read FBeforeAccessTokenIsExpired write FBeforeAccessTokenIsExpired;
    property BeforeAppTokenIsExpired: TioBeforeTokenIsExpiredEvent read FBeforeAppTokenIsExpired write FBeforeAppTokenIsExpired;
    property BeforeRefreshTokenIsExpired: TioBeforeTokenIsExpiredEvent read FBeforeRefreshTokenIsExpired write FBeforeRefreshTokenIsExpired;
    property BeforeUserTokenIsExpired: TioBeforeTokenIsExpiredEvent read FBeforeUserTokenIsExpired write FBeforeUserTokenIsExpired;
    // is logged on events
    property AfterIsLoggedOn: TioAfterIsLoggedOnEvent read FAfterIsLoggedOn write FAfterIsLoggedOn;
    property BeforeIsLoggedOn: TioBeforeIsLoggedOnEvent read FBeforeIsLoggedOn write FBeforeIsLoggedOn;
    // on exception events
    property onAppLoginException: TioOnAppLoginExceptionEvent read FonAppLoginException write FonAppLoginException;
    property onAuthorizeAccessException: TioOnAuthorizeAccessExceptionEvent read FonAuthorizeAccessException write FonAuthorizeAccessException;
    property onIsLoggedOnException: TioOnAuthExceptionEvent read FonIsLoggedOnException write FonIsLoggedOnException;
    property onLogoutException: TioOnAuthExceptionEvent read FonLogoutException write FonLogoutException;
    property onUserLoginException: TioOnUserLoginExceptionEvent read FonUserLoginException write FonUserLoginException;
  end;

implementation

uses
  iORM, System.SysUtils, iORM.PersistenceStrategy.Factory, iORM.Abstraction,
  iORM.Utilities, iORM.Exceptions, iORM.Auth.Factory;

{ TioAuthorizationClient }

function TioAuthClient._NeedRefresh(const ASession: IioAuthSessionData): Boolean;
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

function TioAuthClient._RefreshTokenIsExpired(const ASession: IioAuthSessionData): Boolean;
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
    Result := ASession.RefreshTokenIsExpired;
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterRefreshTokenIsExpired) then
    FAfterRefreshTokenIsExpired(Self, ASession, Result);
end;

function TioAuthClient._AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): IioAuthResponse;
var
  LDone: Boolean;
begin
  // invoke BeforeAuthorizeAccess if assigned
  LDone := False;
  if Assigned(FBeforeAuthorizeAccess) then
  begin
    Result := TioAuthFactory.NewAuthResponse;
    FBeforeAuthorizeAccess(Self, AScope, AAuthIntention, AAccessToken, Result, LDone);
  end;
  // if the access request was not handled then use the internal implementation
  if not LDone then
    Result := TioPersistenceStrategyFactory.GetStrategy_ByConnectionName(FConnectionName).Auth_Access(FConnectionName, AScope, AAuthIntention, AAccessToken);
  // invoke AfterAuthorizeAccess if assigned
  if Assigned(FAfterAuthorizeAccess) then
    FAfterAuthorizeAccess(Self, AScope, AAuthIntention, AAccessToken, Result);
  // if not authorized  raise an exception (non ci sarebbe bisogno perchè la solleva già il AuthServer ma per ulteriore sicurezza)
  if not Result.IsAuth then
    raise EioAuthForbiddenException_403.Create(Format('Access forbidden to scope (%s)', [AScope]));
end;

procedure TioAuthClient._AuthorizeApp_RequestUserAuthGrant(const AAppCredentials: IioAuthAppCredentials);
var
  LGetUserAuthGrantResponseMethod: TioGetUserAuthGrantEventResponseMethod;
begin
  // set the user auth code event reponse
  // TODO: AUTH: forse è meglio che il metodo anonimo riceva direttamente lìAuthResponse? Verificare!!!
  LGetUserAuthGrantResponseMethod := procedure(const AIsAuthorized: Boolean; const AUserAuthGrant: String = IO_AUTH_NULL_JWT)
  var
    LDone: Boolean;
    LException: Exception;
  begin
    // executes the operation inside a try-finally block to be able to invoke the onException... event if there is one
    try
      // step 3 - check if authorized
      if not AIsAuthorized then
        raise EioAuthForbiddenException_403.Create('Access authorization denied by the user');
      // step 4 - get new access token (and refresh token usually)
      _NewAccessToken(AAppCredentials, AUserAuthGrant);
      // return true if success
    except
      // if an onException event handler is assigned then invoke it else re-raise the exception
      if Assigned(FonUserLoginException) then
      begin
        LException := AcquireExceptionObject as Exception;
        try
          FonAppLoginException(Self, AAppCredentials, LException);
        finally
          LException.Free;
        end;
      end
      else
        raise(LException);
    end;
  end;
  // invoke OnAuthorizeAppGetUserAuthCode event to retrieve the user authorization code/token
  if Assigned(FOnAuthorizeAppGetUserAuthCode) then
    FOnAuthorizeAppGetUserAuthCode(Self, AAppCredentials, LGetUserAuthGrantResponseMethod)
  else
    raise EioAuthException.Create(Format('"OnAuthorizeAppGetUserAuthCode" handler isn''t assigned on TioAuthClient component named "%s"', [Name]));
end;

procedure TioAuthClient._AuthorizeUser(const AUserCredentials: IioAuthUserCredentials; const ASession: IioAuthSessionData);
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
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy_ByConnectionName(FConnectionName).Auth_User(FConnectionName, AUserCredentials);
  // invoke AfterAuthorizeUser if assigned
  if Assigned(FAfterAuthorizeUser) then
    FAfterAuthorizeUser(Self, AUserCredentials, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  //  note: it might be that the auth server immediately provides the access token
  //        (and also the refresh token) without providing any user token/authcode
  if LAuthResponse.IsAuth then
  begin
    ASession.Clear;
    _FillSessionData(ASession, LAuthResponse);
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid user credentials');
end;

procedure TioAuthClient._CheckActive;
begin
  if not FActive then
    raise EioAuthComponentNotEnabled_404.Create(Format('Component "%s" is not active', [Name]));
end;

procedure TioAuthClient._FillSessionData(const ASession: IioAuthSessionData; const AAuthResponse: IioAuthResponse);
begin
  // update the session subjects data
  if not AAuthResponse.Subjects.IsEmpty then
    ASession.Subjects.Assign(AAuthResponse.Subjects);
  // update session data with the access token data if exists
  if AAuthResponse.HasAccTkn then
  begin
    ASession.AccessToken := AAuthResponse.AccTkn;
    ASession.AccessTokenExp := AAuthResponse.AccExp;
    ASession.RefreshAfter := AAuthResponse.RefAft;
  end;
  // update session data with the refresh token data if exists
  if AAuthResponse.HasRefTkn then
  begin
    ASession.RefreshToken := AAuthResponse.RefTkn;
    ASession.RefreshTokenExp := AAuthResponse.RefExp;
  end;
end;

function TioAuthClient.AppLogin(const AAppCredentials: IioAuthAppCredentials): Boolean;
var
  LException: Exception;
  LSession: IioAuthSessionData;
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
          FonAppLoginException(Self, AAppCredentials, LException);
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
  _AuthorizeApp_RequestUserAuthGrant(AAppCredentials);
  // return true if success
  Result := True;
end;

function TioAuthClient.AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention): Boolean;
var
  LAccessToken: String;
  LAuthResponse: IioAuthResponse;
  LException: Exception;
  LSession: IioAuthSessionData;
begin
  Result := False;
  // first check if the component is enabled
  _CheckActive;
  // executes the operation inside a try-except block to be able to invoke the onException... event if there is one
  try
    // --------------------
    // acquire the session to check if it is logged on and if need refresh
    LSession := TioApplication.AcquireSession;
    try
      // step 1 - check if logged on
      if not _IsLoggedOn(LSession) then
        raise EioAuthNotLoggedOnException_401.Create('User or App is not logged on');
      // step 2 - check if the access token need to be refreshed
      if _NeedRefresh(LSession) then
        _RefreshAccessToken(LSession);
      // set the access token to a local variable (thread-safe)
      LAccessToken := LSession.AccessToken;
    finally
      TioApplication.ReleaseSession;
    end;
    // --------------------
    // step 3 - authorize access (outside session lock to minimize session lock time when not necessary)
    LAuthResponse := _AuthorizeAccess(AScope, AAuthIntention, LAccessToken);
    Result := LAuthResponse.IsAuth;
    // --------------------
    // if there is a new access token (refresh token maintained by auth server compatibility)
    //  then update the session object
    if Result and LAuthResponse.HasAccTkn then
    begin
      LSession := TioApplication.AcquireSession;
      try
        LSession.AccessToken := LAuthResponse.AccTkn;
        LSession.AccessTokenExp := LAuthResponse.AccExp;
        LSession.RefreshAfter := LAuthResponse.RefAft;
        if LAuthResponse.HasRefTkn then
        begin
          LSession.RefreshToken := LAuthResponse.RefTkn;
          LSession.RefreshTokenExp := LAuthResponse.RefExp;
        end;
      finally
        TioApplication.ReleaseSession;
      end;
    end;
    // --------------------
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
end;

constructor TioAuthClient.Create(AOwner: TComponent);
begin
  inherited;
  FActive := True;
  FAsync := False;
  FConnectionName := String.Empty;
  // Set the singleton internal reference to itself (one only auth server at a time)
  TioAuthClient.FInstance := Self;
end;

destructor TioAuthClient.Destroy;
begin
  FInstance := nil;
  inherited;
end;

function TioAuthClient._AccessTokenIsExpired(const ASession: IioAuthSessionData): Boolean;
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
    Result := ASession.AccessTokenIsExpired;
  // invoke AfterNeedRefresh event if assigned
  if Assigned(FAfterAccessTokenIsExpired) then
    FAfterAccessTokenIsExpired(Self, ASession, Result);
end;

class function TioAuthClient.GetInstance: TioAuthClient;
begin
  Result := TioAuthClient.FInstance;
end;

function TioAuthClient._IsLoggedOn(const ASession: IioAuthSessionData): Boolean;
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
var
  LException: Exception;
  LSession: IioAuthSessionData;
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
      Result := _IsLoggedOn(LSession);
    except
      // if an onException event handler is assigned then invoke it else re-raise the exception
      if Assigned(FonIsLoggedOnException) then
      begin
        LException := AcquireExceptionObject as Exception;
        try
          FonIsLoggedOnException(Self, LSession, LException);
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

function TioAuthClient.Logout: Boolean;
var
  LException: Exception;
  LSession: IioAuthSessionData;
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

procedure TioAuthClient._NewAccessToken(const ACredentials: IioAuthCredentials; const AAuthGrant: String = IO_STRING_NULL_VALUE);
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
  LSession: IioAuthSessionData;
begin
  LDone := False;
  // invoke BeforeNewAccessToken if assigned
  if Assigned(FBeforeNewAccessToken) then
  begin
    LAuthResponse := TioAuthFactory.NewAuthResponse;
    FBeforeNewAccessToken(Self, ACredentials, LAuthResponse, LDone);
  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy_ByConnectionName(FConnectionName).Auth_NewAccessToken(FConnectionName, AAuthGrant, ACredentials.CodeVerifier);
  // invoke AfterNewAccessToken if assigned
  if Assigned(FAfterNewAccessToken) then
    FAfterNewAccessToken(Self, ACredentials, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuth then
  begin
    // acquire session data
    LSession := TioApplication.AcquireSession;
    try
      // fill session data
      _FillSessionData(LSession, LAuthResponse);
    finally
      // release session data
      TioApplication.ReleaseSession;
    end;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('User or App credentials or authorization grant code are not valid');
end;

procedure TioAuthClient._RaiseAlreadyLoggedOnException(const ASession: IioAuthSessionData);
begin
  if ASession.Subjects.HasApp then
    raise EioAuthAlreadyLoggedOnException_401.Create(Format('Already logged on as app "%s", user "%s"', [ASession.Subjects.App, ASession.Subjects.User]))
  else
  if ASession.Subjects.HasUser then
    raise EioAuthAlreadyLoggedOnException_401.Create(Format('Already logged on as user "%s"', [ASession.Subjects.User]))
  else
    raise EioAuthAlreadyLoggedOnException_401.Create(Format('Already logged on', [ASession.Subjects.User]))
end;

procedure TioAuthClient._RefreshAccessToken(const ARefreshToken: String);
var
  LAuthResponse: IioAuthResponse;
  LDone: Boolean;
  LSession: IioAuthSessionData;
begin
  LDone := False;
  // invoke BeforeRefreshAccessToken if assigned
  if Assigned(FBeforeRefreshAccessToken) then
  begin
    LAuthResponse := TioAuthFactory.NewAuthResponse;
    FBeforeRefreshAccessToken(Self, ARefreshToken, LAuthResponse, LDone);
  end;
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
    LAuthResponse := TioPersistenceStrategyFactory.GetStrategy_ByConnectionName(FConnectionName).Auth_RefreshAccessToken(FConnectionName, ASession.RefreshToken);
  // invoke AfterRefreshAccessToken if assigned
  if Assigned(FAfterRefreshAccessToken) then
    FAfterRefreshAccessToken(Self, ARefreshToken, LAuthResponse);
  // if authorized then update session props (else raise an exception)
  if LAuthResponse.IsAuth then
  begin
    // acquire session data
    LSession := TioApplication.AcquireSession;
    try
      // fill session data
      _FillSessionData(LSession, LAuthResponse);
    finally
      // release session data
      TioApplication.ReleaseSession;
    end;
  end
  else
    raise EioAuthInvalidCredentialsException_401.Create('Invalid or expired refresh token');
end;

function TioAuthClient.UserLogin(const AUserCredentials: IioAuthUserCredentials): Boolean;
var
  LException: Exception;
  LSession: IioAuthSessionData;
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
      _NewAccessToken(LSession);
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
