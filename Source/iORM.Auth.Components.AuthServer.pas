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
unit iORM.Auth.Components.AuthServer;

interface

uses
  System.Classes, iORM.Auth.Interfaces, iORM.Auth.JWT, iORM,
  System.Generics.Collections;

const
  TOKEN_TYPE_AUTHORIZATION = 'auth';
  TOKEN_TYPE_REFRESH = 'ref';
  TOKEN_TYPE_ACCESS = 'acc';

  TOKEN_AUDIENCE = 'iorm';

  USER_CACHE_EXPIRATION_MINS = 10; // default is 10 minutes
type
  TioAuthUserCache = class;

  TioAuthServer = class(TComponent)
  strict private
    // singleton class fields
    class var FInstance: TioAuthServer;
  strict private
    // fields
    FActive: Boolean;
    FTokenIssuer: String; // proprietà non thread safe ma per il momento provo a mantenerla non protetta per migliorare le prestazioni, al max poi richiederà di nuovo un login
    FTokenSecret: String; // proprietà non thread safe ma per il momento provo a mantenerla non protetta per migliorare le prestazioni, al max poi richiederà di nuovo un login
    FUserCache: TioAuthUserCache;
    FUserCacheExpirationMins: Integer;
    FUserOTPDurationMins: Integer;
    FUserPswDurationDays: Integer;
    // events
    FOnAccessTokenNeedRefresh: TioOnAccessTokenNeedRefreshEvent;
    FOnAuthorizeApp: TioOnAuthorizeAppEvent;
    FOnAuthorizeUser: TioOnAuthorizeUserEvent;
    FOnAuthorizeAccess: TioOnAuthorizeAccessEvent;
    FOnNewAccessToken: TioOnNewAccessTokenEvent;
    FOnRefreshAccessToken: TioOnRefreshAccessTokenEvent;
    // methods
    procedure CheckIfEnabled;
    function Get_Version: String;
    procedure SetUserCacheExpirationMins(const Value: Integer);
    // jwt builders
    function _BuildAuthorizationToken(const AUser: String; const AUserID: Integer = IO_INTEGER_NULL_VALUE; const AApp: String = IO_STRING_NULL_VALUE; const AAppID: Integer = IO_INTEGER_NULL_VALUE): String; inline; // this token is released after the initial user/app authorization request
    function _BuildAccessToken(const ALoginUser: String; const AAppID: String = IO_STRING_NULL_VALUE): String; inline; // this token permit to acces to resources
    function _BuildRefreshToken(const ALoginUser: String; const AAppID: String = IO_STRING_NULL_VALUE): String; inline; // this token is released after the request of the first access+request token (just after the login/autorization request) or at every access token refresh request
    // jwt checks
    procedure _CheckToken(const AJWT: TioJWT; const ATokenType: String); inline;
    procedure _CheckAuthorizationToken(const AAuthorizationToken: String; out ResultUser, ResultApp: String; out ResultUserID, ResultAppID: Integer); inline;
    procedure _CheckAccessToken(const AAccessToken: String; out ResultUser, ResultApp: String); inline;
    procedure _CheckRefreshToken(const ARefreshToken: String; out ResultUser, ResultApp: String); inline;
    function _CheckAccessTokenNeedRefresh(const AAccessToken: String): Boolean; inline;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TioAuthServer; static;
    function AuthorizeUser(const AUserCredentials: IioAuthUserCredentials; out ResultUserAuthorizationToken: String; out ResultUserID: Integer): Boolean; // return a user identity token
    function AuthorizeApp(AAppCredentials: IioAuthAppCredentials; AUserAuthorizationToken: String; out ResultAppAuthorizationToken: String; out ResultAppID: Integer): Boolean; // return an app authorization token
    function AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): Boolean; // return true or false depending the access to the requested result is permitted
    function NewAccessToken(const AAuthorizationToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean; // return a new acces token and also a new refresh token just after the authorization (login)
    function RefreshAccessToken(const ARefreshToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean; // return a new acces token and also a new refresh token
    function AccessTokenNeedRefresh(const AAccessToken: String): Boolean;
  published
    // properties
    property Active: Boolean read FActive write FActive;
    property TokenIssuer: String read FTokenIssuer write FTokenIssuer; // proprietà non thread safe ma per il momento provo a mantenerna non protetta per migliorare le prestazioni, al max poi richiederà di nuovo un login
    property TokenSecret: String read FTokenSecret write FTokenSecret; // proprietà non thread safe ma per il momento provo a mantenerna non protetta per migliorare le prestazioni, al max poi richiederà di nuovo un login
    property UserCacheExpirationMins: Integer read FUserCacheExpirationMins write SetUserCacheExpirationMins default USER_CACHE_EXPIRATION_MINS;
    property UserOTPDurationMins: Integer read FUserOTPDurationMins write FUserOTPDurationMins;
    property UserPswDurationDays: Integer read FUserPswDurationDays write FUserPswDurationDays;
    property _Version: String read Get_Version;
    // events
    property OnAccessTokenNeedRefresh: TioOnAccessTokenNeedRefreshEvent read FOnAccessTokenNeedRefresh write FOnAccessTokenNeedRefresh;
    property OnAuthorizeApp: TioOnAuthorizeAppEvent read FOnAuthorizeApp write FOnAuthorizeApp;
    property OnAuthorizeAccess: TioOnAuthorizeAccessEvent read FOnAuthorizeAccess write FOnAuthorizeAccess;
    property OnAuthorizeUser: TioOnAuthorizeUserEvent read FOnAuthorizeUser write FOnAuthorizeUser;
    property OnNewAccessToken: TioOnNewAccessTokenEvent read FOnNewAccessToken write FOnNewAccessToken;
    property OnRefreshAccessToken: TioOnRefreshAccessTokenEvent read FOnRefreshAccessToken write FOnRefreshAccessToken;
  end;

  TioAuthUserCacheItem = class
  strict private
    FExpiration: TDateTime;
    FUser: IioAuthUser;
  public
    constructor Create(const AUser: IioAuthUser; const AExpirationMinutes: Integer);
    function IsExpired: Boolean; inline;
    property Expiration: TDateTime read FExpiration;
    property User: IioAuthUser read FUser write FUser;
  end;

  TioAuthUserCache_InternalContainer = TObjectDictionary<String, TioAuthUserCacheItem>;

  TioAuthUserCache = class
  strict private
    FExpirationMinutes: Integer;
    FInternalContainer: TioAuthUserCache_InternalContainer;
    procedure _Lock; inline;
    procedure _Unlock; inline;
    function GetExpirationMinutes: Integer;
    procedure SetExpirationMinutes(const Value: Integer);
  public
    constructor Create(const AExpirationMinutes: Integer);
    destructor Destroy; override;
    function GetUser(const ALoginUser: String; const AForceReload: Boolean = False): IioAuthUser;
    procedure Remove(const ALoginUser: String);
    property ExpirationMinutes: Integer read GetExpirationMinutes write SetExpirationMinutes;
  end;

implementation

uses
  iORM.CommonTypes, iORM.Utilities, iORM.Exceptions,
  System.SysUtils, System.DateUtils, System.IOUtils;

{ TioAuthServer }

procedure TioAuthServer.CheckIfEnabled;
begin
  if not FActive then
    raise EioAuthServerComponentNotEnabled_404.Create(Format('Component "%s" not found', [Name]));
end;

constructor TioAuthServer.Create(AOwner: TComponent);
begin
  inherited;
  FActive := True;
  FTokenSecret := 'change me as soon as possible';
  FTokenIssuer := IO_STRING_NULL_VALUE;
  FUserCache := TioAuthUserCache.Create(FUserCacheExpirationMins);
  FUserCacheExpirationMins := USER_CACHE_EXPIRATION_MINS; // default is 10 minutes
  FUserOTPDurationMins := AUTH_OTP_DURATION_MIN;
  FUserPswDurationDays := AUTH_PSW_DURATION_DAYS;
  if not (csDesigning in ComponentState) then
    FTokenIssuer := TPath.GetFileNameWithoutExtension(ParamStr(0));
  // Set the singleton internal reference to itself (one only auth server at a time)
  TioAuthServer.FInstance := Self;
end;

destructor TioAuthServer.Destroy;
begin
  FInstance := nil;
  if Assigned(FUserCache) then
    FreeAndNil(FUserCache);
  inherited;
end;

class function TioAuthServer.GetInstance: TioAuthServer;
begin
  Result := TioAuthServer.FInstance;
  if not Assigned(Result) then
    raise EioAuthServerComponentNotFound_404.Create('"TioAuthServer" singleton component not found');
end;

function TioAuthServer.Get_Version: String;
begin
  Result := io.Version;
end;

function TioAuthServer.NewAccessToken(const AAuthorizationToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean;
var
  LDone: Boolean;
  LUser, LApp: String;
  LUserID, LAppID: Integer;
begin
  Result := False;
  AResultAccessToken := IO_AUTH_NULL_JWT;
  AResultRefreshToken := IO_AUTH_NULL_JWT;
  // First check if the component is enabled
  CheckIfEnabled;
  // invoke OnNewAccessToken event if assigned
  LDone := False;
  if Assigned(FOnNewAccessToken) then
    FOnNewAccessToken(Self, AAuthorizationToken, AResultAccessToken, AResultRefreshToken, Result, LDone);
  // if the creation of the token was not handled then return the default one
  if not LDone then
  begin
    // check authorization token
    _CheckAuthorizationToken(AAuthorizationToken, LUser, LApp, LUserID, LAppID);
    // check if the user is still active
    FUserCache.GetUser(LUser).CheckIfActive(True);
    // build the result access and refresh tokens
    AResultAccessToken := _BuildAccessToken(LUser, LApp);
    AResultRefreshToken := _BuildRefreshToken(LUser, LApp);
    // final check, if the result token is null the raise exception
    if (AResultAccessToken = IO_AUTH_NULL_JWT) or (AResultRefreshToken = IO_AUTH_NULL_JWT) then
      raise EioAuthInvalidAuthorizationToken_401.Create('Invalid authorization token/code');
    // Return true if all is ok
    Result := True;
  end;
end;

function TioAuthServer.RefreshAccessToken(const ARefreshToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean;
var
  LDone: Boolean;
  LLoginUser, LAppID: String;
begin
  Result := False;
  AResultAccessToken := IO_AUTH_NULL_JWT;
  AResultRefreshToken := IO_AUTH_NULL_JWT;
  // First check if the component is enabled
  CheckIfEnabled;
  // invoke OnNewAccessToken event if assigned
  LDone := False;
  if Assigned(FOnRefreshAccessToken) then
    FOnRefreshAccessToken(Self, ARefreshToken, AResultAccessToken, AResultRefreshToken, Result, LDone);
  // if the creation of the token was not handled then return the default one
  if not LDone then
  begin
    // check authorization token
    _CheckRefreshToken(ARefreshToken, LLoginUser, LAppID);
    // check if the user and app is still active
    FUserCache.GetUser(LLoginUser).CheckIfActive(True);
    // build the result access and refresh tokens
    AResultAccessToken := _BuildAccessToken(LLoginUser, LAppID);
    AResultRefreshToken := _BuildRefreshToken(LLoginUser, LAppID);
    // final check, if the result token is null the raise exception
    if (AResultAccessToken = IO_AUTH_NULL_JWT) or (AResultRefreshToken = IO_AUTH_NULL_JWT) then
      raise EioAuthInvalidRefreshToken_401.Create('Invalid refresh token');
    // Return true if all is ok
    Result := True;
  end;
end;

procedure TioAuthServer.SetUserCacheExpirationMins(const Value: Integer);
begin
  if Value >= 1 then
  begin
    FUserCacheExpirationMins := Value;
    FUserCache.ExpirationMinutes := Value;
  end
  else
    raise EioGenericException.Create(ClassName, 'SetUserCacheExpirationMins', 'The minimum value is 1');
end;

function TioAuthServer.AuthorizeUser(const AUserCredentials: IioAuthUserCredentials; out ResultUserAuthorizationToken: String; out ResultUserID: Integer): Boolean;
var
  LDone: Boolean;
  LUser: IioAuthUser;
begin
  Result := False;
  ResultUserAuthorizationToken := IO_AUTH_NULL_JWT;
  ResultUserID := IO_INTEGER_NULL_VALUE;
  // First check if the component is enabled
  CheckIfEnabled;
  // invoke OnAuthorizeUser event if assigned
  LDone := False;
  if Assigned(FOnAuthorizeUser) then
    FOnAuthorizeUser(Self, AUserCredentials, ResultUserAuthorizationToken, ResultUserID, Result, LDone);
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
  begin
    // check LoginUserName and LoginUserPassword
    LUser := FUserCache.GetUser(AUserCredentials.LoginUser, True);
    if not LUser.CanAuthorizeCredentials then
      raise EioAuthInvalidCredentialsException_401.Create('Invalid user credentials');
    // if all is ok then build the result user authorization token
    ResultUserAuthorizationToken := _BuildAuthorizationToken(LUser.LoginPassword);
    ResultUserID := LUser.ID;
    // final check, if the result token is null the raise exception
    if ResultUserAuthorizationToken = IO_AUTH_NULL_JWT then
      raise EioAuthInvalidCredentialsException_401.Create('Invalid user credentials');
    // Return true if all is ok
    Result := True;
  end;
end;

function TioAuthServer.AuthorizeApp(AAppCredentials: IioAuthAppCredentials; AUserAuthorizationToken: String; out ResultAppAuthorizationToken: String; out ResultAppID: Integer): Boolean;
var
  LAppInstance: IioAuthApp;
  LDone: Boolean;
  LUser, LApp: String;
  LUserID, LAppID: Integer;
begin
  Result := False;
  ResultAppAuthorizationToken := IO_AUTH_NULL_JWT;
  // First check if the component is enabled
  CheckIfEnabled;
  // invoke OnAuthorizeApp event if assigned
  LDone := False;
  if Assigned(FOnAuthorizeApp) then
    FOnAuthorizeApp(Self, AAppCredentials, AUserAuthorizationToken, ResultAppAuthorizationToken, Result, LDone);
  // if the creation of the token was not handled then use the internal implementation
  if not LDone then
  begin
    // check user token
    _CheckAuthorizationToken(AUserAuthorizationToken, LUser, LApp, LUserID, LAppID);
    if LApp <> IO_STRING_NULL_VALUE then
      raise EioAuthUserAuthorizationTokenExpected_401.Create('A user authorization token/code was expected, but an application authorization token/code was received instead.');
    // load app entity (if it is a persisted entity)
    if TioUtilities.IsPersistedEntity((AAppCredentials as TObject).ClassName) then
      LAppInstance := io.Load<IioAuthApp>._Where('AppID', coEquals, AAppCredentials.AppID).ToObject;
    // if not authorized then raise an exception
    if not LAppInstance.CanAuthorizeCredentials then
      raise EioAuthInvalidCredentialsException_401.Create('Invalid app credentials');
    // Build token
    ResultAppAuthorizationToken := _BuildAuthorizationToken(LUser, LUserID, LAppInstance.AppID, LAppInstance.ID);
    ResultAppID := LAppInstance.ID;
    // final check, if the result token is null the raise exception
    if ResultAppAuthorizationToken = IO_AUTH_NULL_JWT then
      raise EioAuthInvalidCredentialsException_401.Create('Invalid app credentials');
    // Return true if all is ok
    Result := True;
  end;
end;

function TioAuthServer.AccessTokenNeedRefresh(const AAccessToken: String): Boolean;
var
  LDone: Boolean;
begin
  Result := False;
  // First check if the component is enabled
  CheckIfEnabled;
  // invoke OnLogin event if assigned
  LDone := False;
  if Assigned(FOnAccessTokenNeedRefresh) then
    FOnAccessTokenNeedRefresh(Self, AAccessToken, Result, LDone);
  // if the check of the token was not handled then use the internal implementation
  if not LDone then
    Result := _CheckAccessTokenNeedRefresh(AAccessToken);
end;

function TioAuthServer.AuthorizeAccess(const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): Boolean;
var
  LDone: Boolean;
  LLoginUser, LAppID: String;
  LUser: IioAuthUser;
  LPermissionLevel: TioAuthPermissionLevel;
begin
  Result := False;
  // First check if the component is enabled
  CheckIfEnabled;
  // invoke OnLogin event if assigned
  LDone := False;
  if Assigned(FOnAuthorizeAccess) then
    FOnAuthorizeAccess(Self, AScope, AAuthIntention, AAccessToken, Result, LDone);
  // if the creation of the token was not handled then return the default one
  if not LDone then
  begin
    // check user token
    _CheckAccessToken(AAccessToken, LLoginUser, LAppID);
    // check permissions
    LUser := FUserCache.GetUser(LLoginUser);
    LPermissionLevel := LUser.GetPermissionLevelFor(AScope, LAppID);
    Result := (Ord(LPermissionLevel) > Ord(AAuthIntention));
    if not Result then
      raise EioAuthForbiddenException_403.Create(Format('Unhauthorized access to scope (%s)', [AScope]));
  end;
end;

function TioAuthServer._BuildAccessToken(const ALoginUser: String; const AAppID: String = IO_STRING_NULL_VALUE): String;
var
  LToken: TioJWT;
  LNow: TDateTime;
begin
  LNow := TioUtilities.NowUTC;
  LToken := TioJWT.Create;
  try
    LToken.App := AAppID;
    LToken.Audience := TOKEN_AUDIENCE;
    LToken.Expiration := IncDay(LNow); // expires after 1 day by default
    LToken.IssueAtTime := LNow; // issued now by default
    LToken.Issuer := FTokenIssuer;
    LToken.NotBefore := IncMinute(LNow, -5); // not before 5 minutes before now to avoid problems with unsynchronized times between computers
    LToken.User := ALoginUser;
    LToken.TokenType := TOKEN_TYPE_ACCESS;
    Result := LToken.TokenAsString(FTokenSecret);
  finally
    LToken.Free;
  end;
end;

function TioAuthServer._BuildAuthorizationToken(const AUser: String; const AUserID: Integer = IO_INTEGER_NULL_VALUE; const AApp: String = IO_STRING_NULL_VALUE; const AAppID: Integer = IO_INTEGER_NULL_VALUE): String;
var
  LToken: TioJWT;
  LNow: TDateTime;
begin
  LNow := TioUtilities.NowUTC;
  LToken := TioJWT.Create;
  try
    LToken.App := AApp;
    LToken.AppID := AAppID;
    LToken.Audience := TOKEN_AUDIENCE;
    LToken.Expiration := IncMinute(LNow, 1); // expires after 1 minute by default (for first access/refresh token request only)
    LToken.IssueAtTime := LNow; // issued now by default
    LToken.Issuer := FTokenIssuer;
    LToken.NotBefore := IncMinute(LNow, -5); // not before 5 minutes before now to avoid problems with unsynchronized times between computers
    LToken.User := AUser;
    LToken.UserID := AUserID;
    LToken.TokenType := TOKEN_TYPE_AUTHORIZATION;
    Result := LToken.TokenAsString(FTokenSecret);
  finally
    LToken.Free;
  end;
end;

function TioAuthServer._BuildRefreshToken(const ALoginUser: String; const AAppID: String = IO_STRING_NULL_VALUE): String;
var
  LToken: TioJWT;
  LNow: TDateTime;
begin
  LNow := TioUtilities.NowUTC;
  LToken := TioJWT.Create;
  try
    LToken.App := AAppID;
    LToken.Audience := TOKEN_AUDIENCE;
    LToken.Expiration := IncDay(LNow, 30); // expires after 30 days by default (remind me)
    LToken.IssueAtTime := LNow; // issued now by default
    LToken.Issuer := FTokenIssuer;
    LToken.NotBefore := IncMinute(LNow, -5); // not before 5 minutes before now to avoid problems with unsynchronized times between computers
    LToken.User := ALoginUser;
    LToken.TokenType := TOKEN_TYPE_REFRESH;
    Result := LToken.TokenAsString(FTokenSecret);
  finally
    LToken.Free;
  end;
end;

procedure TioAuthServer._CheckToken(const AJWT: TioJWT; const ATokenType: String);
var
  LNow: TDateTime;
begin
  LNow := TioUtilities.NowUTC;
  // Check if it's verified
  if AJWT.IsVerified then
     raise EioTokenSignatureException_401.Create(Format('Token signature not verified (%s)', [ATokenType]));
  // Check the audience
  if AJWT.Audience <> TOKEN_AUDIENCE then
     raise EioTokenAudienceException_401.Create(Format('Invalid token audience (%s)', [ATokenType]));
  // Check issuer
  if AJWT.Issuer <> FTokenIssuer then
     raise EioTokenIssuerException_401.Create(Format('Invalid token issuer (%s)', [ATokenType]));
  // Check expiration
  if AJWT.IsExpired(LNow) then
     raise EioTokenExpirationException_401.Create(Format('Token expired (%s)', [ATokenType]));
  // Check token not yet valid
  if AJWT.IsNotYetValid(LNow) then
     raise EioTokenNotYetValidException_401.Create(Format('Token not yet valid (%s)', [ATokenType]));
end;

procedure TioAuthServer._CheckAuthorizationToken(const AAuthorizationToken: String; out ResultUser, ResultApp: String; out ResultUserID, ResultAppID: Integer);
var
  LJWT: TioJWT;
begin
  LJWT := TioJWT.CreateByToken(AAuthorizationToken, FTokenSecret);
  try
    // Check token
    _CheckToken(LJWT, TOKEN_TYPE_AUTHORIZATION);
    // Check token type
    if LJWT.TokenType <> TOKEN_TYPE_AUTHORIZATION then
       raise EioTokenTypeException_401.Create(Format('Invalid token type (%s)', [TOKEN_TYPE_AUTHORIZATION]));
    // Extract user & app
    ResultUser := LJWT.User;
    ResultUserID := LJWT.UserID;
    ResultApp := LJWT.App;
    ResultAppID := LJWT.AppID;
  finally
    LJWT.Free;
  end;
end;

procedure TioAuthServer._CheckAccessToken(const AAccessToken: String; out ResultUser, ResultApp: String);
var
  LJWT: TioJWT;
begin
  LJWT := TioJWT.CreateByToken(AAccessToken, FTokenSecret);
  try
    // Check token
    _CheckToken(LJWT, TOKEN_TYPE_ACCESS);
    // Check token type
    if LJWT.TokenType <> TOKEN_TYPE_ACCESS then
       raise EioTokenTypeException_401.Create(Format('Invalid token type (%s)', [TOKEN_TYPE_ACCESS]));
    // Extract user & app
    ResultUser := LJWT.User;
    ResultApp := LJWT.App;
  finally
    LJWT.Free;
  end;
end;

function TioAuthServer._CheckAccessTokenNeedRefresh(const AAccessToken: String): Boolean;
var
  LJWT: TioJWT;
  LNow: TDateTime;
begin
  LJWT := TioJWT.CreateByToken(AAccessToken, FTokenSecret);
  try
    LNow := TioUtilities.NowUTC;
    Result := LJWT.IsToBeRefreshed(LNow) or LJWT.IsExpired(LNow);
  finally
    LJWT.Free;
  end;
end;

procedure TioAuthServer._CheckRefreshToken(const ARefreshToken: String; out ResultUser, ResultApp: String);
var
  LJWT: TioJWT;
begin
  LJWT := TioJWT.CreateByToken(ARefreshToken, FTokenSecret);
  try
    // Check token
    _CheckToken(LJWT, TOKEN_TYPE_REFRESH);
    // Check token type
    if LJWT.TokenType <> TOKEN_TYPE_REFRESH then
       raise EioTokenTypeException_401.Create(Format('Invalid token type (%s)', [TOKEN_TYPE_REFRESH]));
    // Extract user & app
    ResultUser := LJWT.User;
    ResultApp := LJWT.App;
  finally
    LJWT.Free;
  end;
end;

{ TioAuthUserCache }

constructor TioAuthUserCache.Create(const AExpirationMinutes: Integer);
begin
  inherited Create;
  FExpirationMinutes := AExpirationMinutes;
  FInternalContainer := TioAuthUserCache_InternalContainer.Create([doOwnsValues]);
end;

destructor TioAuthUserCache.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioAuthUserCache.GetExpirationMinutes: Integer;
begin
  _Lock;
  try
    Result := FExpirationMinutes;
  finally
    _Unlock;
  end;
end;

function TioAuthUserCache.GetUser(const ALoginUser: String; const AForceReload: Boolean = False): IioAuthUser;
var
  LUserCacheItem: TioAuthUserCacheItem;
begin
  _Lock;
  try
    if FInternalContainer.TryGetValue(ALoginUser, LUserCacheItem) and (not LUserCacheItem.IsExpired) and (not AForceReload) then
      Result := LUserCacheItem.User
    else
    begin
      Result := io.Load<IioAuthUser>._Where('LoginUser', coEquals, ALoginUser).ToObject;
      if not Assigned(Result) then
      begin
        FInternalContainer.Remove(ALoginUser);
        raise EioAuthInvalidCredentialsException_401.Create('Invalid user credentials');
      end;
      if Assigned(LUserCacheItem) then
        LUserCacheItem.User := Result
      else
        FInternalContainer.Add(ALoginUser, TioAuthUserCacheItem.Create(Result, FExpirationMinutes));
    end;
  finally
    _Unlock;
  end;
end;

procedure TioAuthUserCache.Remove(const ALoginUser: String);
begin
  _Lock;
  try
    FInternalContainer.Remove(ALoginUser);
  finally
    _Unlock;
  end;
end;

procedure TioAuthUserCache.SetExpirationMinutes(const Value: Integer);
begin
  _Lock;
  try
    FExpirationMinutes := Value;
  finally
    _Unlock;
  end;
end;

procedure TioAuthUserCache._Lock;
begin
  TMonitor.Enter(FInternalContainer);
end;

procedure TioAuthUserCache._Unlock;
begin
  TMonitor.Exit(FInternalContainer);
end;

{ TioAuthUserCacheItem }

constructor TioAuthUserCacheItem.Create(const AUser: IioAuthUser; const AExpirationMinutes: Integer);
begin
  FUser := AUser;
  FExpiration := IncMinute(TioUtilities.NowUTC, AExpirationMinutes);
end;

function TioAuthUserCacheItem.IsExpired: Boolean;
begin
  Result := TioUtilities.NowUTC > Expiration;
end;

end.
