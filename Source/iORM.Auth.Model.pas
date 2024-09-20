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
unit iORM.Auth.Model;

interface

uses
  System.Generics.Collections, iORM.Auth.Interfaces, iORM.Attributes;

type

  TioAuthCustomCredentials = class(TInterfacedObject, IioAuthCustomCredentials)
  public
    function GetClassName: String;
    // ---------- to be ovverrided ----------
    function CanAuthorize(const ALoginPassword: String): Boolean; virtual;
    function IsActive: Boolean; virtual;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property ClassName: String read GetClassName;
  end;

  TioAuthUserCredentials = class(TioAuthCustomCredentials, IioAuthUserCredentials)
  strict private
    [ioSkip]
    FLoginPassword: String;
    [ioIndex]
    FLoginUserName: String;
  private
    function GetLoginPassword: String;
    function GetLoginUserName: String;
    procedure SetLoginPassword(const Value: String);
    procedure SetLoginUserName(const Value: String);
  public
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
    property LoginUserName: String read GetLoginUserName write SetLoginUserName;
  end;

  TioAuthAppCredentials = class(TioAuthCustomCredentials, IioAuthAppCredentials)
  strict private
    FAppID: String;
    FAppScope: String;
    FAppSecret: String;
  private
    function GetAppID: String;
    function GetAppScope: String;
    function GetAppSecret: String;
    procedure SetAppID(const Value: String);
    procedure SetAppScope(const Value: String);
    procedure SetAppSecret(const Value: String);
  public
    property AppID: String read GetAppID write SetAppID;
    property AppScope: String read GetAppScope write SetAppScope;
    property AppSecret: String read GetAppSecret write SetAppSecret;
  end;

  TioAuthPermission = class(TInterfacedObject, IioAuthPermission)
  strict private
    FID: Integer;
    FScope: String;
    FPermissionLevel: TioAuthPermissionLevel;
    function GetID: Integer;
    function GetPermissionLevel: TioAuthPermissionLevel;
    function GetScope: String;
    procedure SetPermissionLevel(const Value: TioAuthPermissionLevel);
    procedure SetScope(const Value: String);
  public
    property ID: Integer read GetID;
    property PermissionLevel: TioAuthPermissionLevel read GetPermissionLevel write SetPermissionLevel;
    property Scope: String read GetScope write SetScope;
  end;

  TioAuthRole = class(TInterfacedObject, IioAuthRole)
  strict private
    FID: Integer;
    FName: String;
    FPermissions: TioPermissionList;
    function GetID: Integer;
    function GetName: String;
    function GetPermissions: TioPermissionList;
    procedure SetName(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
    property ID: Integer read GetID;
    property Name: String read GetName write SetName;
    property Permissions: TioPermissionList read GetPermissions;
  end;

  TioAuthApp = class(TioAuthAppCredentials, IioAuthApp)
  strict private
    FID: Integer;
    function GetID: Integer;
  public
    property ID: Integer read FID;
  end;

  TioAuthUser = class(TioAuthUserCredentials, IioAuthUser)
  strict private
    FApps: TioAuthAppList;
    FEncryptedPassword: String;
    FExpiration: TDateTime;
    FID: Integer;
    FPermissions: TioPermissionList;
    FRoles: TioAuthRoleList;
    FStatus: TioAuthUserStatusType;
    function _IsExpired: Boolean; inline;
    function _IsValidPassword(const ALoginPassword: String): Boolean; inline;
    function _IsActiveStatus: Boolean; inline;
    function _IsActive: Boolean; inline;
    function GetApps: TioAuthAppList;
    function GetID: Integer;
    function GetPermissiones: TioPermissionList;
    function GetRoles: TioAuthRoleList;
    function GetStatus: TioAuthUserStatusType;
    procedure SetStatus(const Value: TioAuthUserStatusType);
  protected
    // ---------- to be ovverrided ----------
    function EncryptPassword(const APassword: String): String; virtual;
    // ---------- to be ovverrided ----------
  public
    constructor Create;
    destructor Destroy; override;
    // ---------- to be ovverrided ----------
    function CanAuthorize(const ALoginPassword: String): Boolean; override;
    function IsActive: Boolean; override;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel; override;
    // ---------- to be ovverrided ----------
    property Apps: TioAuthAppList read FApps;
    property ID: Integer read FID;
    property Permissions: TioPermissionList read FPermissions;
    property Roles: TioAuthRoleList read GetRoles;
    property Status: TioAuthUserStatusType read GetStatus write SetStatus;
  end;

implementation

uses System.SysUtils, iORM.Exceptions, iORM.CommonTypes;

{ TioAuthPermission }

function TioAuthPermission.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthPermission.GetPermissionLevel: TioAuthPermissionLevel;
begin
  Result := FPermissionLevel;
end;

function TioAuthPermission.GetScope: String;
begin
  Result := FScope;
end;

procedure TioAuthPermission.SetPermissionLevel(const Value: TioAuthPermissionLevel);
begin
  FPermissionLevel := Value;
end;

procedure TioAuthPermission.SetScope(const Value: String);
begin
  FScope := Value.ToLower;
end;

{ TioAuthRole }

constructor TioAuthRole.Create;
begin
  FPermissions := TioPermissionList.Create;
end;

destructor TioAuthRole.Destroy;
begin
  FPermissions.Free;
  inherited;
end;

function TioAuthRole.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthRole.GetName: String;
begin
  Result := FName;
end;

function TioAuthRole.PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
var
  LPermission: IioAuthPermission;
begin
  AScope := AScope.ToLower;
  for LPermission in FPermissions do
    if LPermission.Scope = AScope then
      Exit(LPermission.PermissionLevel);
  Result := ptUnauthorized
end;

function TioAuthRole.GetPermissions: TioPermissionList;
begin
  Result := FPermissions;
end;

procedure TioAuthRole.SetName(const Value: String);
begin
  FName := Value;
end;

{ TioAuthUser }

function TioAuthUser.IsActive: Boolean;
begin
  Result := _IsActive;
end;

function TioAuthUser.CanAuthorize(const ALoginPassword: String): Boolean;
begin
  Result := False;
  // Check password
  if not _IsValidPassword(ALoginPassword) then
    raise EioAuthInvalidCredentialsException_401.Create('Invalid credentials');
  // check if active
  Result := _IsActive;
end;

function TioAuthUser._IsExpired: Boolean;
begin
  Result := (FExpiration <> IO_DATETIME_NULL_VALUE) and (Now > FExpiration);
end;

function TioAuthUser._IsValidPassword(const ALoginPassword: String): Boolean;
begin
  Result := EncryptPassword(ALoginPassword) = FEncryptedPassword;
end;

function TioAuthUser._IsActive: Boolean;
begin
  Result := False;
  // Check status
  if not _IsActiveStatus then
    raise EioAuthInactiveUserException_401.Create(Format('User "%s" has been deactivated', [LoginUserName]));
  // Check expiration
  if _IsExpired then
    raise EioAuthUserExpiredException_401.Create(Format('User "%s" has expired', [LoginUserName]));
  Result := True;
end;

function TioAuthUser._IsActiveStatus: Boolean;
begin
  Result := FStatus = usActive;
end;

constructor TioAuthUser.Create;
begin
  FApps := TioAuthAppList.Create;
  FID := IO_INTEGER_NULL_VALUE;
  FExpiration := IO_DATETIME_NULL_VALUE;
  FPermissions := TioPermissionList.Create;
  FRoles := TioAuthRoleList.Create;
  FStatus := usInactive;
end;

destructor TioAuthUser.Destroy;
begin
  FApps.Free;
  FPermissions.Free;
  FRoles.Free;
  inherited;
end;

function TioAuthUser.EncryptPassword(const APassword: String): String;
begin
  // TODO: AUTH - fare una implementazione di base ma che cifra veramente?
  // System.Hash.THashMD5.GetHashString
  Result := APassword;
end;

function TioAuthUser.PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
var
  LPermissionLevel: TioAuthPermissionLevel;
  LPermission: IioAuthPermission;
  LAuthUserRoleItem: TioAuthRoleItem;
begin
  AScope := AScope.ToLower;
  LPermissionLevel := ptUnauthorized;
  Result := ptUnauthorized;
  // Roles
  for LAuthUserRoleItem in FRoles do
  begin
    LPermissionLevel := LAuthUserRoleItem.Role.PermissionLevelFor(AScope, AIntention);
    if LPermissionLevel > Result then
      Result := LPermissionLevel;
  end;
  // User specific permissions
  for LPermission in FPermissions do
  begin
    if LPermission.Scope = AScope then
      if LPermission.PermissionLevel > Result then
        Result := LPermissionLevel;
  end;
end;

function TioAuthUser.GetApps: TioAuthAppList;
begin
  Result := FApps;
end;

function TioAuthUser.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthUser.GetPermissiones: TioPermissionList;
begin
  Result := FPermissions;
end;

function TioAuthUser.GetRoles: TioAuthRoleList;
begin
  Result := FRoles;
end;

function TioAuthUser.GetStatus: TioAuthUserStatusType;
begin
  Result := FStatus;
end;

procedure TioAuthUser.SetStatus(const Value: TioAuthUserStatusType);
begin
  FStatus := Value;
end;


{ TioAuthCredentials }

function TioAuthUserCredentials.GetLoginPassword: String;
begin
  Result := FLoginPassword;
end;

function TioAuthUserCredentials.GetLoginUserName: String;
begin
  Result := FLoginUserName;
end;

procedure TioAuthUserCredentials.SetLoginPassword(const Value: String);
begin
  FLoginPassword := Value;
end;

procedure TioAuthUserCredentials.SetLoginUserName(const Value: String);
begin
  FLoginUserName := Value;
end;

{ TioAuthBaseCredentials }

function TioAuthCustomCredentials.CanAuthorize(const ALoginPassword: String): Boolean;
begin
  Result := False;
end;

function TioAuthCustomCredentials.GetClassName: String;
begin
  Result := inherited ClassName;
end;

function TioAuthCustomCredentials.IsActive: Boolean;
begin
  Result := False;
end;

function TioAuthCustomCredentials.PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
begin
  Result := ptUnauthorized;
end;

{ TioAuthAppCredentials }

function TioAuthAppCredentials.GetAppID: String;
begin
  Result := FAppID;
end;

function TioAuthAppCredentials.GetAppScope: String;
begin
  Result := FAppScope;
end;

function TioAuthAppCredentials.GetAppSecret: String;
begin
  Result := FAppSecret;
end;

procedure TioAuthAppCredentials.SetAppID(const Value: String);
begin
  FAppID := Value;
end;

procedure TioAuthAppCredentials.SetAppScope(const Value: String);
begin
  FAppScope := Value;
end;

procedure TioAuthAppCredentials.SetAppSecret(const Value: String);
begin
  FAppSecret := Value;
end;

{ TioAuthApp }

function TioAuthApp.GetID: Integer;
begin
  Result := FID;
end;

end.
