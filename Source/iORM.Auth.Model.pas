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
  System.Generics.Collections, iORM.Auth.Interfaces, iORM.Attributes,
  iORM.CommonTypes;

type

  TioAuthBase = class(TInterfacedObject, IioAuthBase)
  strict private
    FExpiration: TDateTime;
    FStatus: TioAuthUserStatus;
    function GetExpiration: TDateTime;
    function GetStatus: TioAuthUserStatus;
    procedure SetExpiration(const Value: TDateTime);
    procedure SetStatus(const Value: TioAuthUserStatus);
  strict protected
    function GetExceptionEntityName: String; virtual;
    function GetExceptionSubjectName: String; virtual;
  public
    constructor Create;
    function ClassName: String;
    // ---------- to be ovverrided ----------
    function IsActive(const RaiseExceptions: Boolean): Boolean; virtual;
    function IsExpired: Boolean; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property Expiration: TDateTime read GetExpiration write SetExpiration;
    property Status: TioAuthUserStatus read GetStatus write SetStatus;
  end;

  TioAuthCredentials = class(TioAuthBase, IioAuthCredentials)
  strict private
    [ioIndex]
    FLoginName: String;
    [ioSkip([ssMap, ssETM])]
    FLoginOldPassword: String;
    [ioSkip([ssMap, ssETM])]
    FLoginPassword: String;
    [ioSkip([ssMap, ssETM])]
    FLoginPasswordConfirm: String;
    FPswDigest: String;
    function GetLoginName: String;
    function GetLoginOldPassword: String;
    function GetLoginPassword: String;
    function GetLoginPasswordConfirm: String;
    procedure SetLoginName(const Value: String);
    procedure SetLoginOldPassword(const Value: String);
    procedure SetLoginPassword(const Value: String);
    procedure SetLoginPasswordConfirm(const Value: String);
  strict protected
    function GetExceptionSubjectName: String; override;
  public
    constructor Create;
    // ---------- to be ovverrided ----------
    function CanAuthorize: Boolean; virtual;
    function GeneratePasswordDigest(const APassword: String): String; virtual;
    function ValidatePassword(const APassword: String): Boolean; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property LoginName: String read GetLoginName write SetLoginName;
    property LoginOldPassword: String read GetLoginOldPassword write SetLoginOldPassword;
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
    property LoginPasswordConfirm: String read GetLoginPasswordConfirm write SetLoginPasswordConfirm;
  end;

// TODO: Dividere in due classi: TioAuthPermissionsHolder solo per i permessi e TioAuthRolseHolder per permessi e ruoli (deriva dalla prima)
  TioAuthPermissionsHolder = class(TioAuthCredentials, IioAuthPermissionsHolder)
    FID: Integer;
    FPermissions: TioPermissionList;
    FRoles: TioAuthRoleList;
    function GetID: Integer;
    function GetPermissions: TioPermissionList;
    function GetRoles: TioAuthRoleList;
  strict protected
    function GetExceptionEntityName: String; override;
  public
    constructor Create;
    destructor Destroy; override;
    // ---------- to be ovverrided ----------
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property ID: Integer read GetID;
    property Permissions: TioPermissionList read GetPermissions;
    property Roles: TioAuthRoleList read GetRoles;
  end;

  TioAuthUser = class(TioAuthPermissionsHolder, IioAuthUser)
  strict private
    FApps: TioAuthAppList;
    function GetApps: TioAuthAppList;
  public
    constructor Create;
    destructor Destroy; override;
    // ---------- to be ovverrided ----------
    function PermissionLevelFor(AAppID, AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel; reintroduce; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property Apps: TioAuthAppList read GetApps;
  end;

  TioAuthApp = class(TioAuthPermissionsHolder, IioAuthApp)
  strict private
    FScopes: String;
    function GetScopes: String;
    procedure SetScopes(const Value: String);
  strict protected
    function GetExceptionEntityName: String; override;
  public
    constructor Create;
    // properties
    property Scopes: String read GetScopes write SetScopes;
  end;

// TODO: Fare un container di scopes che viene caricato durante il mapping delle classi in base agli attributi [ioAuthScope('...')] presenti nelle entità e quando si crea un oggetto TioAuthPermission (constructor) verificare che lo scope sia presente nel container, altrimento solleva una eccezione
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
    // properties
    property ID: Integer read GetID;
    property PermissionLevel: TioAuthPermissionLevel read GetPermissionLevel write SetPermissionLevel;
    property Scope: String read GetScope write SetScope;
  end;

  TioAuthRole = class(TioAuthBase, IioAuthRole)
  strict private
    FID: Integer;
    FName: String;
    FPermissions: TioPermissionList;
    function GetID: Integer;
    function GetName: String;
    function GetPermissions: TioPermissionList;
    procedure SetName(const Value: String);
  strict protected
    function GetExceptionEntityName: String; override;
    function GetExceptionSubjectName: String; override;
  public
    constructor Create;
    destructor Destroy; override;
    // ---------- to be ovverrided ----------
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property ID: Integer read GetID;
    property Name: String read GetName write SetName;
    property Permissions: TioPermissionList read GetPermissions;
  end;

  TioAuthRoleItem = class(TioAuthBase, IioAuthRoleItem)
  strict private
    FID: Integer;
    FRole: IioAuthRole;
    function GetID: Integer;
    function GetRole: IioAuthRole;
  public
    constructor Create(const ARole: IioAuthRole);
    // ---------- to be ovverrided ----------
    function IsActive(const RaiseExceptions: Boolean): Boolean; override;
    function IsExpired: Boolean; override;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property ID: integer read GetID;
    property Role: IioAuthRole read GetRole;
  end;

  TioAuthAppItem = class(TioAuthBase, IioAuthAppItem)
  strict private
    FApp: IioAuthApp;
    FID: Integer;
    function GetApp: IioAuthApp;
    function GetID: Integer;
  public
    constructor Create(const AApp: IioAuthApp);
    // ---------- to be ovverrided ----------
    function IsActive(const RaiseExceptions: Boolean): Boolean; override;
    function IsExpired: Boolean; override;
    function PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property App: IioAuthApp read GetApp;
    property ID: integer read GetID;
  end;

implementation

uses System.SysUtils, System.Hash, iORM.Exceptions, iORM.Utilities;

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
  inherited Create;
  FID := IO_INTEGER_NULL_VALUE;
  FName := IO_STRING_NULL_VALUE;
  FPermissions := TioPermissionList.Create;
end;

destructor TioAuthRole.Destroy;
begin
  FPermissions.Free;
  inherited;
end;

function TioAuthRole.GetExceptionEntityName: String;
begin
  Result := 'Role';
end;

function TioAuthRole.GetExceptionSubjectName: String;
begin
  Result := FName;
end;

function TioAuthRole.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthRole.GetName: String;
begin
  Result := FName;
end;

function TioAuthRole.GetPermissions: TioPermissionList;
begin
  Result := FPermissions;
end;

function TioAuthRole.PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
var
  LPermission: IioAuthPermission;
begin
  AScope := AScope.ToLower;
  if IsActive(False) then
    for LPermission in FPermissions do
      if LPermission.Scope = AScope then
        Exit(LPermission.PermissionLevel);
  Result := plUnauthorized;
end;

procedure TioAuthRole.SetName(const Value: String);
begin
  FName := Value;
end;

{ TioAuthUser }

constructor TioAuthUser.Create;
begin
  inherited Create;
  FApps := TioAuthAppList.Create;
end;

destructor TioAuthUser.Destroy;
begin
  FApps.Free;
  inherited;
end;

function TioAuthUser.PermissionLevelFor(AAppID, AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
var
  LAuthUserAppItem: IioAuthAppItem;
  LPermissionLevel: TioAuthPermissionLevel;
begin
  Result := inherited PermissionLevelFor(AScope, AIntention);
  // App permissions
  // note: if there are no apps or if the apps have no permission or role assigned then use those of the user otherwise use those of the app
  if AAppID <> IO_STRING_NULL_VALUE then
  begin
    LPermissionLevel := plUnauthorized;
    for LAuthUserAppItem in FApps do
      if LAuthUserAppItem.App.LoginName = AAppID then
        LPermissionLevel := LAuthUserAppItem.App.PermissionLevelFor(AScope, AIntention);
    if LPermissionLevel < Result then
      Result := LPermissionLevel;
  end;
end;

function TioAuthUser.GetApps: TioAuthAppList;
begin
  Result := FApps;
end;

{ TioAuthBaseCredentials }

function TioAuthCredentials.CanAuthorize: Boolean;
begin
  // Check password
  if not ValidatePassword(LoginPassword) then
    raise EioAuthInvalidCredentialsException_401.Create(Format('Invalid %s credentials', [GetExceptionEntityName.ToLower]));
  // check if active
  Result := IsActive(True);
end;

constructor TioAuthCredentials.Create;
begin
  inherited Create;
  FLoginName := IO_STRING_NULL_VALUE;
  FLoginOldPassword := IO_STRING_NULL_VALUE;
  FLoginPassword := IO_STRING_NULL_VALUE;
  FLoginPasswordConfirm := IO_STRING_NULL_VALUE;
  FPswDigest := IO_STRING_NULL_VALUE;
end;

function TioAuthCredentials.GetExceptionSubjectName: String;
begin
  Result := LoginName;
end;

function TioAuthCredentials.GetLoginName: String;
begin
  Result := FLoginName;
end;

function TioAuthCredentials.GetLoginOldPassword: String;
begin
  Result := FLoginOldPassword;
end;

function TioAuthCredentials.GetLoginPassword: String;
begin
  Result := FLoginPassword;
end;

function TioAuthCredentials.GetLoginPasswordConfirm: String;
begin
  Result := FLoginPasswordConfirm;
end;

function TioAuthCredentials.ValidatePassword(const APassword: String): Boolean;
begin
  Result := GeneratePasswordDigest(APassword) = FPswDigest;
end;

procedure TioAuthCredentials.SetLoginName(const Value: String);
begin
  FLoginName := Value;
end;

procedure TioAuthCredentials.SetLoginOldPassword(const Value: String);
begin
  FLoginOldPassword := Value;
end;

procedure TioAuthCredentials.SetLoginPassword(const Value: String);
begin
  FLoginPassword := Value;
end;

procedure TioAuthCredentials.SetLoginPasswordConfirm(const Value: String);
begin
  FLoginPasswordConfirm := Value;
end;

function TioAuthCredentials.GeneratePasswordDigest(const APassword: String): String;
begin
  Result := THashSHA2.GetHashString(APassword);
end;

{ TioAuthApp }

constructor TioAuthApp.Create;
begin
  inherited Create;
  FScopes := IO_STRING_NULL_VALUE;
end;

function TioAuthApp.GetExceptionEntityName: String;
begin
  Result := 'App';
end;

function TioAuthApp.GetScopes: String;
begin
  Result := FScopes;
end;

procedure TioAuthApp.SetScopes(const Value: String);
begin
  FScopes := Value;
end;

{ TioAuthAppItem }

constructor TioAuthAppItem.Create(const AApp: IioAuthApp);
begin
  inherited Create;
  FApp := AApp;
  FID := IO_INTEGER_NULL_VALUE;
end;

function TioAuthAppItem.GetApp: IioAuthApp;
begin
  Result := FApp;
end;

function TioAuthAppItem.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthAppItem.IsActive(const RaiseExceptions: Boolean): Boolean;
begin
  Result := inherited IsActive(RaiseExceptions) or FApp.IsActive(RaiseExceptions);
end;

function TioAuthAppItem.IsExpired: Boolean;
begin
  Result := inherited IsExpired or FApp.IsExpired;
end;

function TioAuthAppItem.PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
begin
  if IsActive(False) then
    Result := FApp.PermissionLevelFor(AScope, AIntention)
  else
    Result := plUnauthorized;
end;

{ TioAuthRoleItem }

constructor TioAuthRoleItem.Create(const ARole: IioAuthRole);
begin
  inherited Create;
  FID := IO_INTEGER_NULL_VALUE;
  FRole := ARole;
end;

function TioAuthRoleItem.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthRoleItem.GetRole: IioAuthRole;
begin
  Result := FRole;
end;

function TioAuthRoleItem.IsActive(const RaiseExceptions: Boolean): Boolean;
begin
  Result := inherited IsActive(RaiseExceptions) or FRole.IsActive(RaiseExceptions);
end;

function TioAuthRoleItem.IsExpired: Boolean;
begin
  Result := inherited IsExpired or FRole.IsExpired;
end;

function TioAuthRoleItem.PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
begin
  if IsActive(False) then
    Result := FRole.PermissionLevelFor(AScope, AIntention)
  else
    Result := plUnauthorized;
end;

{ TioAuthBaseEntity }

constructor TioAuthBase.Create;
begin
  inherited Create;
  FExpiration := IO_DATETIME_NULL_VALUE;
  FStatus := usInactive;
end;

function TioAuthBase.ClassName: String;
begin
  Result := inherited ClassName;
end;

function TioAuthBase.GetExceptionEntityName: String;
begin
  Result := ClassName;
end;

function TioAuthBase.GetExceptionSubjectName: String;
begin
  Result := Format('%s.Subject', [ClassName]);
end;

function TioAuthBase.GetExpiration: TDateTime;
begin
  Result := FExpiration;
end;

function TioAuthBase.GetStatus: TioAuthUserStatus;
begin
  Result := FStatus;
end;

function TioAuthBase.IsActive(const RaiseExceptions: Boolean): Boolean;
var
  LIsExpired: Boolean;
begin
  // Check status
  Result := IsActive(False);
  if RaiseExceptions and not Result then
    raise EioAuthInactiveUserException_401.Create(Format('%s "%s" has been deactivated', [GetExceptionEntityName, GetExceptionSubjectName]));
  // Check expiration
  LIsExpired := IsExpired;
  if RaiseExceptions and not LIsExpired then
    raise EioAuthUserExpiredException_401.Create(Format('%s "%s" has been expired', [GetExceptionEntityName, GetExceptionSubjectName]));
  Result := Result and LIsExpired;
end;

function TioAuthBase.IsExpired: Boolean;
begin
  Result := (FExpiration <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FExpiration);
end;

procedure TioAuthBase.SetExpiration(const Value: TDateTime);
begin
  FExpiration := Value;
end;

procedure TioAuthBase.SetStatus(const Value: TioAuthUserStatus);
begin
  FStatus := Value;
end;

{ TioAuthCustomUser }

constructor TioAuthPermissionsHolder.Create;
begin
  inherited Create;
  FID := IO_INTEGER_NULL_VALUE;
  FPermissions := TioPermissionList.Create;
  FRoles := TioAuthRoleList.Create;
end;

destructor TioAuthPermissionsHolder.Destroy;
begin
  FPermissions.Free;
  FRoles.Free;
  inherited;
end;

function TioAuthPermissionsHolder.GetExceptionEntityName: String;
begin
  Result := 'User';
end;

function TioAuthPermissionsHolder.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthPermissionsHolder.GetPermissions: TioPermissionList;
begin
  Result := FPermissions;
end;

function TioAuthPermissionsHolder.GetRoles: TioAuthRoleList;
begin
  Result := FRoles;
end;

function TioAuthPermissionsHolder.PermissionLevelFor(AScope: String; const AIntention: TioAuthIntention): TioAuthPermissionLevel;
var
  LAuthUserRoleItem: IioAuthRoleItem;
  LPermission: IioAuthPermission;
  LPermissionLevel: TioAuthPermissionLevel;
begin
  AScope := AScope.ToLower;
  Result := plUnauthorized;
  // User specific permissions
  for LPermission in FPermissions do
    if LPermission.Scope = AScope then
      Exit(LPermission.PermissionLevel);
  // Roles
  for LAuthUserRoleItem in FRoles do
  begin
    LPermissionLevel := LAuthUserRoleItem.Role.PermissionLevelFor(AScope, AIntention);
    if LPermissionLevel > Result then
      Result := LPermissionLevel;
  end;
end;

end.
