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
unit iORM.Auth.Interfaces;

interface

uses
  iORM.CommonTypes, System.Generics.Collections;

const
  AUTH_OTP_DURATION_MIN = 20;
  AUTH_PSW_DURATION_DAYS = 180;

type

  TioAuthUserStatus = (usInactive, usBanned, usSuspended, usActive);
  TioAuthIntention = (aiRead, aiWrite, aiDelete);
  TioAuthPermissionLevel = (plUnauthorized, plRead, plReadWrite, plReadWriteDelete);
  TioAuthAccessTokenNeedRefreshCheckMode = (nrNever, nrByClient, nrByServer);
  TioAuthCredentialsMode = (cmLogin, cmSetPassword, cmChangePassword);
  TioAuthCredentialsClearMode = (cmAll, cmSecretsOnly);

  IioAuthResponse = interface
    ['{BB322BD7-DD1C-49B2-A55D-F323749B8D32}']
    function GetAccTkn: String;
    function GetAccExp: TDateTime;
    function GetApp: String;
    function GetAppTkn: String;
    function GetAppExp: TDateTime;
    function GetAppOID: Integer;
    function GetIsAuth: Boolean;
    function GetRefAft: TDateTime;
    function GetRefTkn: String;
    function GetRefExp: TDateTime;
    function GetUsr: String;
    function GetUsrTkn: String;
    function GetUsrExp: TDateTime;
    function GetUsrOID: Integer;
    procedure SetAccTkn(const Value: String);
    procedure SetAccExp(const Value: TDateTime);
    procedure SetApp(const Value: String);
    procedure SetAppTkn(const Value: String);
    procedure SetAppExp(const Value: TDateTime);
    procedure SetAppOID(const Value: Integer);
    procedure SetIsAuth(const Value: Boolean);
    procedure SetRefAft(const Value: TDateTime);
    procedure SetRefTkn(const Value: String);
    procedure SetRefExp(const Value: TDateTime);
    procedure SetUsr(const Value: String);
    procedure SetUsrTkn(const Value: String);
    procedure SetUsrExp(const Value: TDateTime);
    procedure SetUsrOID(const Value: Integer);
    // methods
    function HasUsrTkn: Boolean;
    function HasAppTkn: Boolean;
    function HasRefTkn: Boolean;
    function HasAccTkn: Boolean;
    function AsString: String;
    // properties
    property IsAuth: Boolean read GetIsAuth write SetIsAuth;
    // user
    property UsrTkn: String read GetUsrTkn write SetUsrTkn;
    property UsrExp: TDateTime read GetUsrExp write SetUsrExp;
    property Usr: String read GetUsr write SetUsr;
    property UsrOID: Integer read GetUsrOID write SetUsrOID;
    // app
    property AppTkn: String read GetAppTkn write SetAppTkn;
    property AppExp: TDateTime read GetAppExp write SetAppExp;
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    // refresh
    property RefTkn: String read GetRefTkn write SetRefTkn;
    property RefExp: TDateTime read GetRefExp write SetRefExp;
    // access
    property AccTkn: String read GetAccTkn write SetAccTkn;
    property AccExp: TDateTime read GetAccExp write SetAccExp;
    property RefAft: TDateTime read GetRefAft write SetRefAft;
  end;

  IioAuthSession = interface
    ['{AEC7DF37-A5C0-44E3-9D64-32216758506B}']
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenIsExpired: Boolean;
    function GetAppToken: String;
    function GetAppTokenExp: TDateTime;
    function GetAppTokenIsExpired: Boolean;
    function GetAppOID: Integer;
    function GetApp: String;
    function GetConnectionName: String;
    function GetHasAccessToken: Boolean;
    function GetHasAppToken: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetHasUserToken: Boolean;
    function GetNeedRefresh: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetRefreshTokenIsExpired: Boolean;
    function GetUserToken: String;
    function GetUserTokenExp: TDateTime;
    function GetUserTokenIsExpired: Boolean;
    function GetUserOID: Integer;
    function GetUser: String;
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetAppToken(const Value: String);
    procedure SetAppTokenExp(const Value: TDateTime);
    procedure SetAppOID(const Value: Integer);
    procedure SetApp(const Value: String);
    procedure SetConnectionName(const Value: String);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
    procedure SetUserToken(const Value: String);
    procedure SetUserTokenExp(const Value: TDateTime);
    procedure SetUserOID(const Value: Integer);
    procedure SetUser(const Value: String);
    // user
    property UserToken: String read GetUserToken write SetUserToken;
    property UserTokenExp: TDateTime read GetUserTokenExp write SetUserTokenExp;
    property UserTokenIsExpired: Boolean read GetUserTokenIsExpired;
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
    property HasUserToken: Boolean read GetHasUserToken;
    // app
    property AppToken: String read GetAppToken write SetAppToken;
    property AppTokenExp: TDateTime read GetAppTokenExp write SetAppTokenExp;
    property AppTokenIsExpired: Boolean read GetAppTokenIsExpired;
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property HasAppToken: Boolean read GetHasAppToken;
    // refresh
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenExp: TDateTime read GetRefreshTokenExp write SetRefreshTokenExp;
    property RefreshTokenIsExpired: Boolean read GetRefreshTokenIsExpired;
    property HasRefreshToken: Boolean read GetHasRefreshToken;
    // access
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AccessTokenExp: TDateTime read GetAccessTokenExp write SetAccessTokenExp;
    property AccessTokenIsExpired: Boolean read GetAccessTokenIsExpired;
    property HasAccessToken: Boolean read GetHasAccessToken;
    property RefreshAfter: TDateTime read GetRefreshAfter write SetRefreshAfter;
    property NeedRefresh: Boolean read GetNeedRefresh;
    // connection
    property ConnectionName: String read GetConnectionName write SetConnectionName;
  end;

  IioAuthUserCredentials = interface
    ['{2B8348E3-188F-477D-ACFD-C32C22BB342C}']
    function GetLoginPassword: String;
    function GetLoginUser: String;
    procedure SetLoginUser(const Value: String);
    procedure SetLoginPassword(const Value: String);
    // properties
    property LoginUser: String read GetLoginUser write SetLoginUser;
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
  end;

  IioAuthAppCredentials = interface
    ['{1714A188-B473-4114-8648-8EF6D4CBE084}']
    function GetAppID: String;
    function GetAppName: String;
    function GetAppSecret: String;
    procedure SetAppID(const Value: String);
    procedure SetAppName(const Value: String);
    procedure SetAppSecret(const Value: String);
    // properties
    property AppName: String read GetAppName write SetAppName;
    property AppID: String read GetAppID write SetAppID;
    property AppSecret: String read GetAppSecret write SetAppSecret;
  end;

  IioAuthExpirable = interface
    ['{56DF39B5-683D-4DC2-9B28-12896DDF16D0}']
    function CheckIfActive(const RaiseExceptions: Boolean): Boolean;
    function ClassName: String;
    function GetExpiration: TDateTime;
    function GetID: Integer;
    function GetIsActive: Boolean;
    function GetIsExpired: Boolean;
    function GetStatus: TioAuthUserStatus;
    procedure SetExpiration(const Value: TDateTime);
    procedure SetStatus(const Value: TioAuthUserStatus);
    // properties
    property ID: Integer read GetID;
    property Expiration: TDateTime read GetExpiration write SetExpiration;
    property IsActive: Boolean read GetIsActive;
    property IsExpired: Boolean read GetIsExpired;
    property Status: TioAuthUserStatus read GetStatus write SetStatus;
  end;

  IioAuthPermission = interface(IioAuthExpirable)
    ['{EE381F4C-CA31-4FEE-86C7-1AF76D819333}']
    function GetPermissionLevel: TioAuthPermissionLevel;
    function GetScope: String;
    procedure SetPermissionLevel(const Value: TioAuthPermissionLevel);
    procedure SetScope(const Value: String);
    // properties
    property PermissionLevel: TioAuthPermissionLevel read GetPermissionLevel write SetPermissionLevel;
    property Scope: String read GetScope write SetScope;
  end;

  TioPermissionList = TList<IioAuthPermission>;

  IioAuthRole = interface(IioAuthExpirable)
    ['{B4298095-FABC-4F8A-8064-A47DD7F04F31}']
    function GetName: String;
    function GetPermissions: TioPermissionList;
    function GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel;
    procedure SetName(const Value: String);
    // properties
    property Name: String read GetName write SetName;
    property Permissions: TioPermissionList read GetPermissions;
  end;

  IioAuthRoleItem = interface(IioAuthExpirable)
    ['{908FF0F9-37CC-4CD5-A7AC-960979B992E7}']
    function GetRole: IioAuthRole;
    function GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel;
    // properties
    property Role: IioAuthRole read GetRole;
  end;

  TioAuthRoleList = class(TList<IioAuthRoleItem>)
  public
    function Add(const ARole: IioAuthRole): Integer;
  end;

  IioAuthRolesHolder = interface(IioAuthExpirable)
    ['{52EEC60D-2F3F-4868-9D91-8CCA08B260B3}']
    function GetRoles: TioAuthRoleList;
    function GetPermissionLevelFor(AScope: String; const AAppID: String = IO_STRING_NULL_VALUE): TioAuthPermissionLevel;
    // properties
    property Roles: TioAuthRoleList read GetRoles;
  end;

  IioAuthUser = interface(IioAuthRolesHolder)
    ['{567AE82C-34AA-40F7-9A68-989CD79DDB4D}']
    // ---------- can be ovverrided ----------
    function CanAuthorizeCredentials: Boolean;
    procedure ConfirmCredentials;
    function ResetCredentials(const AGenerateOTP: Boolean = True; const AOTPDurationMins: Integer = AUTH_OTP_DURATION_MIN): String;
    // ---------- can be ovverrided ----------
    function GetCredentialMode: TioAuthCredentialsMode;
    function GetLoginPassword: String;
    function GetLoginUser: String;
    function GetNewPassword1: String;
    function GetNewPassword2: String;
    function GetPswExp: TDateTime;
    procedure SetCredentialMode(const Value: TioAuthCredentialsMode);
    procedure SetLoginPassword(const Value: String);
    procedure SetLoginUser(const Value: String);
    procedure SetNewPassword1(const Value: String);
    procedure SetNewPassword2(const Value: String);
    procedure SetPswExp(const Value: TDateTime);
    // login related properties
    property LoginUser: String read GetLoginUser write SetLoginUser;
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
    // set/reset/change password related properties
    property CredentialMode: TioAuthCredentialsMode read GetCredentialMode write SetCredentialMode;
    property NewPassword1: String read GetNewPassword1 write SetNewPassword1;
    property NewPassword2: String read GetNewPassword2 write SetNewPassword2;
    property PswExp: TDateTime read GetPswExp write SetPswExp;
  end;

  IioAuthApp = interface(IioAuthRolesHolder)
    ['{BADE216F-5A30-4255-A73E-6E40ED4A5C9F}']
    // ---------- can be ovverrided ----------
    function CanAuthorizeCredentials: Boolean;
    procedure ConfirmCredentials;
    function ResetCredentials(const AGenerateOTP: Boolean = True; const AOTPDurationMins: Integer = AUTH_OTP_DURATION_MIN): String;
    // ---------- can be ovverrided ----------
    function GetAppID: String;
    function GetAppName: String;
    function GetAppSecret: String;
    procedure SetAppID(const Value: String);
    procedure SetAppName(const Value: String);
    procedure SetAppSecret(const Value: String);
    // properties
    property AppName: String read GetAppName write SetAppName;
    property AppID: String read GetAppID write SetAppID;
    property AppSecret: String read GetAppSecret write SetAppSecret;
  end;

  IioAuthAppItem = interface(IioAuthExpirable)
    ['{EF077FB5-8931-4C30-9161-0CD3D19E23B2}']
    function GetApp: IioAuthApp;
    function GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel;
    // properties
    property App: IioAuthApp read GetApp;
  end;

  TioAuthAppList = class(TList<IioAuthAppItem>)
  public
    function Add(const AApp: IioAuthApp): Integer;
  end;

  IioAuthUserWithApps = interface(IioAuthUser)
    function GetApps: TioAuthAppList;
    // properties
    property Apps: TioAuthAppList read GetApps;
  end;

  TioOnAuthorizeAccessEvent = procedure(const Sender: TObject; const AScope: String; const AIntention: TioAuthIntention; const AAccessToken: String; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;

  // TioAuthServer events
  TioOnAuthorizeUserEvent = procedure(const Sender: TObject; const AUserCredentials: IioAuthUserCredentials; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;
  TioOnAuthorizeAppEvent = procedure(const Sender: TObject; const AAppCredentials: IioAuthAppCredentials; var AUserAuthorizationToken: String; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;
  TioOnNewAccessTokenEvent = procedure(const Sender: TObject; const AAuthorizationToken: String; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;
  TioOnRefreshAccessTokenEvent = procedure(const Sender: TObject; const ARefreshToken: String; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;

  // TioAuthClient events
  TioAfterAuthorizeAccessEvent =  procedure(const Sender: TObject; const AScope: String; const AIntention: TioAuthIntention; var AAccessToken: String; const AAuthResponse: IioAuthResponse) of object;
  TioAfterAuthorizeAppEvent = procedure(const Sender: TObject; const AAppCredentials: IioAuthAppCredentials; var AUserAuthorizationToken: String; const AAuthResponse: IioAuthResponse) of object;
  TioAfterAuthorizeUserEvent = procedure(const Sender: TObject; const AUserCredentials: IioAuthUserCredentials; const AAuthResponse: IioAuthResponse) of object;
  TioAfterNeedRefreshEvent = procedure(const Sender: TObject; const AAccessToken: String; var ResultNeedRefresh: Boolean) of object;
  TioBeforeAuthorizeAccessEvent = procedure(const Sender: TObject; const AScope: String; const AIntention: TioAuthIntention; var AAccessToken: String; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;
  TioBeforeAuthorizeAppEvent = procedure(const Sender: TObject; const AAppCredentials: IioAuthAppCredentials; var AUserAuthorizationToken: String; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;
  TioBeforeAuthorizeUserEvent = procedure(const Sender: TObject; const AUserCredentials: IioAuthUserCredentials; const AAuthResponse: IioAuthResponse; var Done: Boolean) of object;
  TioBeforeNeedRefreshEvent = procedure(const Sender: TObject; const AAccessToken: String; var ResultNeedRefresh, Done: Boolean) of object;
  TioOnAuthorizeAppGetUserAuthCodeEvent = procedure(const Sender: TObject; const AAppCredentials: IioAuthAppCredentials; var ResultUserAuthorizationToken: String; var ResultIsAuthorized: Boolean) of object;

  TioBeforeTokenIsExpired = procedure(const Sender: TObject; const AToken: String; var ResultIsExpired, Done: Boolean) of object;
  TioAfterTokenIsExpired = procedure(const Sender: TObject; const AToken: String; var ResultIsExpired: Boolean) of object;

  TioBeforeIsLoggedOn = procedure(const Sender: TObject; const ASession: IioAuthSession; var ResultIsExpired, Done: Boolean) of object;
  TioAfterIsLoggedOn = procedure(const Sender: TObject; const ASession: IioAuthSession; var ResultIsExpired: Boolean) of object;

implementation

uses iORM.Auth.Factory;

{ TioAuthAppList }

function TioAuthAppList.Add(const AApp: IioAuthApp): Integer;
begin
  Result := (Self as TList<IioAuthAppItem>).Add(TioAuthFactory.NewAuthUserAppItem(AApp));
end;

{ TioAuthRoleList }

function TioAuthRoleList.Add(const ARole: IioAuthRole): Integer;
begin
  Result := (Self as TList<IioAuthRoleItem>).Add(TioAuthFactory.NewAuthRoleItem(ARole));
end;

end.
