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
  System.Generics.Collections;

type

  TioAuthAppList = class;
  TioAuthRoleList = class;

  TioAuthUserStatus = (usInactive, usBanned, usSuspended, usActive);
  TioAuthIntention = (aiRead, aiWrite, aiDelete);
  TioAuthPermissionLevel = (plUnauthorized, plRead, plReadWrite, plReadWriteDelete);
  TioAuthAccessTokenNeedRefreshCheckMode = (nrNever, nrByClient, nrByServer);

  IioAuthSession = interface
    ['{AEC7DF37-A5C0-44E3-9D64-32216758506B}']
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
    // user props
    property UserID: Integer read GetUserID write SetUserID;
    property UserName: String read GetUserName write SetUserName;
    // tokens props
    property UserAuthorizationToken: String read GetUserAuthorizationToken write SetUserAuthorizationToken;
    property AppAuthorizationToken: String read GetAppAuthorizationToken write SetAppAuthorizationToken;
    property AccessToken: String read GetAccessToken write SetAccessToken;
    // connection props
    property ConnectionName: String read GetConnectionName write SetConnectionName;
  end;

  IioAuthBase = interface
    ['{BC126881-5EEA-43B2-B491-5BA51542FA17}']
    function ClassName: String;
    function GetExpiration: TDateTime;
    function GetStatus: TioAuthUserStatus;
    function IsActive(const RaiseExceptions: Boolean): Boolean;
    function IsExpired: Boolean;
    procedure SetExpiration(const Value: TDateTime);
    procedure SetStatus(const Value: TioAuthUserStatus);
    // properties
    property Expiration: TDateTime read GetExpiration write SetExpiration;
    property Status: TioAuthUserStatus read GetStatus write SetStatus;
  end;

  IioAuthCredentials = interface(IioAuthBase)
    ['{BC126881-5EEA-43B2-B491-5BA51542FA17}']
    // ---------- to be ovverrided (on classes) ----------
    function CanAuthorize: Boolean;
    function GeneratePasswordDigest(const APassword: String): String;
    function ValidatePassword(const APassword: String): Boolean;
    // ---------- to be ovverrided (on classes) ----------
    function GetLoginName: String;
    function GetLoginOldPassword: String;
    function GetLoginPassword: String;
    function GetLoginPasswordConfirm: String;
    procedure SetLoginName(const Value: String);
    procedure SetLoginOldPassword(const Value: String);
    procedure SetLoginPassword(const Value: String);
    procedure SetLoginPasswordConfirm(const Value: String);
    // properties
    property LoginName: String read GetLoginName write SetLoginName;
    property LoginOldPassword: String read GetLoginOldPassword write SetLoginOldPassword;
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
    property LoginPasswordConfirm: String read GetLoginPasswordConfirm write SetLoginPasswordConfirm;
  end;

  IioAuthPermission = interface
    ['{AE1B9764-ED68-4B46-AC5B-1861CE9B0E23}']
    function GetID: Integer;
    function GetPermissionLevel: TioAuthPermissionLevel;
    function GetScope: String;
    procedure SetPermissionLevel(const Value: TioAuthPermissionLevel);
    procedure SetScope(const Value: String);
    // properties
    property ID: Integer read GetID;
    property PermissionLevel: TioAuthPermissionLevel read GetPermissionLevel write SetPermissionLevel;
    property Scope: String read GetScope write SetScope;
  end;

  IioAuthRole = interface(IioAuthBase)
    ['{3E8DE4D8-6089-41B5-85DD-1425947CE21A}']
    function GetID: Integer;
    function GetName: String;
    function GetPermissions: TList<IioAuthPermission>;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    procedure SetName(const Value: String);
    // properties
    property ID: Integer read GetID;
    property Name: String read GetName write SetName;
    property Permissions: TList<IioAuthPermission> read GetPermissions;
  end;

  TioPermissionList = TList<IioAuthPermission>;

  IioAuthPermissionsHolder = interface(IioAuthCredentials)
    ['{2FBEE228-159C-4049-AD29-E5DFB4D67336}']
    function GetID: Integer;
    function GetPermissions: TioPermissionList;
    function GetRoles: TioAuthRoleList;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    // properties
    property ID: Integer read GetID;
    property Permissions: TioPermissionList read GetPermissions;
    property Roles: TioAuthRoleList read GetRoles;
  end;

  IioAuthUser = interface(IioAuthPermissionsHolder)
    ['{2FBEE228-159C-4049-AD29-E5DFB4D67336}']
    function GetApps: TioAuthAppList;
    function PermissionLevelFor(AAppID, AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    // properties
    property Apps: TioAuthAppList read GetApps;
  end;

  IioAuthApp = interface(IioAuthPermissionsHolder)
    ['{82D56816-0FC6-42B7-9EF8-AB339ECBEE00}']
    function GetScopes: String;
    procedure SetScopes(const Value: String);
    // properties
    property Scopes: String read GetScopes write SetScopes;
  end;

  IioAuthRoleItem = interface(IioAuthBase)
    ['{ECD3CA79-45EC-4EE9-9D89-1E7A8C24E328}']
    function GetID: Integer;
    function GetRole: IioAuthRole;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    // properties
    property ID: integer read GetID;
    property Role: IioAuthRole read GetRole;
  end;

  TioAuthRoleList = class(TList<IioAuthRoleItem>)
  public
    function Add(const ARole: IioAuthRole): Integer;
  end;

  IioAuthAppItem = interface(IioAuthBase)
    ['{E4492721-4954-4CD0-B38D-50828314A640}']
    function GetApp: IioAuthApp;
    function GetID: Integer;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    // properties
    property App: IioAuthApp read GetApp;
    property ID: integer read GetID;
  end;

  TioAuthAppList = class(TList<IioAuthAppItem>)
  public
    function Add(const AApp: IioAuthApp): Integer;
  end;

  TioOnAuthorizeAccessEvent = procedure(const Sender: TObject; const AScope: String; const AIntention: TioAuthIntention; const AAccessToken: String; var ResultIsAuthorized, Done: Boolean) of object;
  TioOnAuthorizeUserEvent = procedure(const Sender: TObject; const AUserCredentials: IioAuthCredentials; out ResultUserAuthorizationToken: String; var ResultIsAuthorized, Done: Boolean) of object;
  TioOnAuthorizeAppEvent = procedure(const Sender: TObject; const AAppCredentials: IioAuthCredentials; var AUserAuthorizationToken: String; out ResultAppAuthorizationToken: String; var ResultIsAuthorized, Done: Boolean) of object;
  TioOnAuthorizeAppGetUserAuthCodeEvent = procedure(const Sender: TObject; const AAppCredentials: IioAuthCredentials; var AResultUserAuthorizationToken: String; var ResultIsAuthorized: Boolean) of object;
  TioOnNewAccessTokenEvent = procedure(const Sender: TObject; const AAuthorizationToken: String; out ResultAccessToken, ResultRefreshToken: String; var ResultIsAuthorized, Done: Boolean) of object;
  TioOnRefreshAccessTokenEvent = procedure(const Sender: TObject; const ARefreshToken: String; out ResultAccessToken, ResultRefreshToken: String; var ResultIsAuthorized, Done: Boolean) of object;
  TioOnAccessTokenNeedRefreshEvent = procedure(const Sender: TObject; const AAccessToken: String; var ResultNeedRefresh, Done: Boolean) of object;

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
