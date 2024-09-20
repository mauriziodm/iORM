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

  TioAuthAppItem = class;
  TioAuthAppList = class;
  TioAuthRoleItem = class;
  TioAuthRoleList = class;

  TioAuthUserStatusType = (usInactive, usBanned, usSuspended, usActive);
  TioAuthIntention = (aiRead, aiWrite, aiDelete);
  TioAuthPermissionLevel = (ptUnauthorized, ptRead, ptReadWrite, ptReadWriteDelete);

  IioAuthCustomCredentials = interface
    ['{BC126881-5EEA-43B2-B491-5BA51542FA17}']
    function CanAuthorize(const ALoginPassword: String): Boolean;
    function GetClassName: String;
    function IsActive: Boolean;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    // properties
    property ClassName: String read GetClassName;
  end;

  IioAuthUserCredentials = interface(IioAuthCustomCredentials)
    ['{109F0CC5-B887-4E37-89BB-6255C7AC89EB}']
    function GetLoginPassword: String;
    function GetLoginUserName: String;
    procedure SetLoginPassword(const Value: String);
    procedure SetLoginUserName(const Value: String);
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
    property LoginUserName: String read GetLoginUserName write SetLoginUserName;
  end;

  IioAuthAppCredentials = interface(IioAuthCustomCredentials)
    ['{DA399391-797D-4497-95CE-E7469B0E470E}']
    function GetAppID: String;
    function GetAppSecret: String;
    function GetAppScope: String;
    procedure SetAppID(const Value: String);
    procedure SetAppSecret(const Value: String);
    procedure SetAppScope(const Value: String);
    // properties
    property AppID: String read GetAppID write SetAppID; // like the user credential username
    property AppSecret: String read GetAppSecret write SetAppSecret; // like the user credentials password
    property AppScope: String read GetAppScope write SetAppScope; // applications or resources app want to access (space delimited)
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

  IioAuthRole = interface
    ['{3E8DE4D8-6089-41B5-85DD-1425947CE21A}']
    function GetID: Integer;
    function GetName: String;
    function GetPermissions: TList<IioAuthPermission>;
    function PermissionLevelFor(AResourceName: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    procedure SetName(const Value: String);
    // properties
    property ID: Integer read GetID;
    property Name: String read GetName write SetName;
    property Permissions: TList<IioAuthPermission> read GetPermissions;
  end;

  TioPermissionList = TList<IioAuthPermission>;

  IioAuthApp = interface(IioAuthAppCredentials)
    ['{82D56816-0FC6-42B7-9EF8-AB339ECBEE00}']
    function GetID: Integer;
    // properties
    property ID: Integer read GetID;
  end;

  IioAuthUser = interface(IioAuthUserCredentials)
    ['{2FBEE228-159C-4049-AD29-E5DFB4D67336}']
    function GetApps: TioAuthAppList;
    function GetID: Integer;
    function GetPermissiones: TioPermissionList;
    function GetRoles: TioAuthRoleList;
    function GetStatus: TioAuthUserStatusType;
    procedure SetStatus(const Value: TioAuthUserStatusType);
    // properties
    property Apps: TioAuthAppList read GetApps;
    property ID: Integer read GetID;
    property Permissions: TioPermissionList read GetPermissiones;
    property Roles: TioAuthRoleList read GetRoles;
    property Status: TioAuthUserStatusType read GetStatus write SetStatus;
  end;

  TioAuthRoleItem = class
  strict private
    FID: Integer;
    FRole: IioAuthRole;
  public
    constructor Create(const ARole: IioAuthRole);
    property ID: integer read FID;
    property Role: IioAuthRole read FRole write FRole;
  end;

  TioAuthRoleList = class(TObjectList<TioAuthRoleItem>)
  public
    function Add(const ARole: IioAuthRole): Integer;
  end;

  TioAuthAppItem = class
  strict private
    FID: Integer;
    FApp: IioAuthApp;
  public
    constructor Create(const AApp: IioAuthApp);
    property ID: integer read FID;
    property App: IioAuthApp read FApp write FApp;
  end;

  TioAuthAppList = class(TObjectList<TioAuthAppItem>)
  public
    function Add(const AApp: IioAuthApp): Integer;
  end;


implementation

{ TioAuthAppItem }

constructor TioAuthAppItem.Create(const AApp: IioAuthApp);
begin
  FApp := AApp;
end;

{ TioAuthAppList }

function TioAuthAppList.Add(const AApp: IioAuthApp): Integer;
begin
  Result := (Self as TObjectList<TioAuthAppItem>).Add(TioAuthAppItem.Create(AApp));
end;

{ TioAuthRoleItem }

constructor TioAuthRoleItem.Create(const ARole: IioAuthRole);
begin
  FRole := ARole;
end;

{ TioAuthRoleList }

function TioAuthRoleList.Add(const ARole: IioAuthRole): Integer;
begin
  Result := (Self as TObjectList<TioAuthRoleItem>).Add(TioAuthRoleItem.Create(ARole));
end;

end.
