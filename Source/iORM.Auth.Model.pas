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
  iORM.Auth.Interfaces, iORM.Attributes, iORM.CommonTypes;

type

  TioAuthUserCredentials = class(TInterfacedObject, IioAuthUserCredentials)
  strict private
    FLoginUser: String;
    FLoginPassword: String;
    function GetLoginPassword: String;
    function GetLoginUser: String;
    procedure SetLoginUser(const Value: String);
    procedure SetLoginPassword(const Value: String);
  public
    constructor Create; virtual;
    // login related properties
    property LoginUser: String read GetLoginUser write SetLoginUser;
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
  end;

  TioAuthAppCredentials = class(TInterfacedObject, IioAuthAppCredentials)
  strict private
    FAppName: String;
    FAppID: String;
    FAppSecret: String;
    function GetAppID: String;
    function GetAppName: String;
    function GetAppSecret: String;
    procedure SetAppID(const Value: String);
    procedure SetAppName(const Value: String);
    procedure SetAppSecret(const Value: String);
  public
    constructor Create; virtual;
    // app authorization related properties
    property AppName: String read GetAppName write SetAppName;
    property AppID: String read GetAppID write SetAppID;
    property AppSecret: String read GetAppSecret write SetAppSecret;
  end;

  TioAuthExpirable = class(TInterfacedObject, IioAuthExpirable)
  strict private
    FID: Integer;
    FExpiration: TDateTime;
    FStatus: TioAuthUserStatus;
    function GetExpiration: TDateTime;
    function GetID: Integer;
    function GetIsActive: Boolean;
    function GetStatus: TioAuthUserStatus;
    procedure SetExpiration(const Value: TDateTime);
    procedure SetStatus(const Value: TioAuthUserStatus);
  strict protected
    // ---------- can be ovverrided ----------
    function GetExceptionEntityName: String; virtual;
    function GetExceptionSubjectName: String; virtual;
    function GetIsExpired: Boolean; virtual;
    // ---------- can be ovverrided ----------
  public
    constructor Create; virtual;
    function ClassName: String;
    // ---------- can be ovverrided ----------
    function CheckIfActive(const RaiseExceptions: Boolean): Boolean; virtual;
    // ---------- can be ovverrided ----------
    // properties
    property ID: Integer read GetID;
    property Expiration: TDateTime read GetExpiration write SetExpiration;
    property IsActive: Boolean read GetIsActive;
    property IsExpired: Boolean read GetIsExpired;
    property Status: TioAuthUserStatus read GetStatus write SetStatus;
  end;

  // TODO: Fare un container di scopes che viene caricato durante il mapping delle classi in base agli attributi [ioAuthScope('...')] presenti nelle entità e quando si crea un oggetto TioAuthPermission (constructor) verificare che lo scope sia presente nel container, altrimento solleva una eccezione
  TioAuthPermission = class(TioAuthExpirable, IioAuthPermission)
  strict private
    FScope: String;
    FPermissionLevel: TioAuthPermissionLevel;
    function GetPermissionLevel: TioAuthPermissionLevel;
    function GetScope: String;
    procedure SetPermissionLevel(const Value: TioAuthPermissionLevel);
    procedure SetScope(const Value: String);
  strict protected
    // ---------- can be ovverrided ----------
    function GetExceptionEntityName: String; override;
    function GetExceptionSubjectName: String; override;
    function GetPermissionLevelFor: TioAuthPermissionLevel; virtual;
    // ---------- can be ovverrided ----------
  public
    constructor Create; virtual;
    // properties
    property PermissionLevel: TioAuthPermissionLevel read GetPermissionLevel write SetPermissionLevel;
    property Scope: String read GetScope write SetScope;
  end;

  TioAuthRole = class(TioAuthExpirable, IioAuthRole)
  strict private
    FName: String;
    FPermissions: TioPermissionList;
    function GetName: String;
    function GetPermissions: TioPermissionList;
    procedure SetName(const Value: String);
  strict protected
    // ---------- can be ovverrided ----------
    function GetExceptionEntityName: String; override;
    function GetExceptionSubjectName: String; override;
    function GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel; virtual;
    // ---------- can be ovverrided ----------
  public
    constructor Create; override;
    destructor Destroy; override;
    // properties
    property Name: String read GetName write SetName;
    property Permissions: TioPermissionList read GetPermissions;
  end;

  TioAuthRoleItem = class(TioAuthExpirable, IioAuthRoleItem)
  strict private
    FRole: IioAuthRole;
    function GetRole: IioAuthRole;
  strict protected
    // ---------- can be ovverrided ----------
    function CheckIfActive(const RaiseExceptions: Boolean): Boolean; override;
    function GetExceptionEntityName: String; override;
    function GetExceptionSubjectName: String; override;
    function GetIsExpired: Boolean; override;
    function GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel; virtual;
    // ---------- can be ovverrided ----------
  public
    constructor Create(const ARole: IioAuthRole); overload;
    // properties
    property Role: IioAuthRole read GetRole;
  end;

  TioAuthRolesHolder = class(TioAuthExpirable, IioAuthRolesHolder)
  strict private
    FRoles: TioAuthRoleList;
    function GetRoles: TioAuthRoleList;
  strict protected
    // ---------- can be ovverrided ----------
    function GetPermissionLevelFor(AScope: String; const AAppID: String = IO_STRING_NULL_VALUE): TioAuthPermissionLevel; virtual;
    // ---------- can be ovverrided ----------
  public
    constructor Create; override;
    destructor Destroy; override;
    // properties
    property Roles: TioAuthRoleList read GetRoles;
  end;

  TioAuthUser = class(TioAuthRolesHolder, IioAuthUser, IioAuthUserCredentials)
  strict private
    // login related fields
    [ioIndex(ioAscending, True), ioNotNull] // unique & required
    FLoginUser: String;
    [ioSkip([ssMap, ssETM])]
    FLoginPassword: String;
    // set/reset/change password related fields
    FCredentialMode: TioAuthCredentialsMode;
    [ioSkip([ssMap, ssETM])]
    FNewPassword1: String;
    [ioSkip([ssMap, ssETM])]
    FNewPassword2: String;
    FPswDigest: String;
    FPswExp: TDateTime;
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
  strict protected
    // ---------- can be ovverrided ----------
    procedure Clear(const AClearMode: TioAuthCredentialsClearMode);
    function GeneratePasswordDigest(const APassword: String): String; virtual;
    function GenerateOTP: String; virtual;
    function GetExceptionEntityName: String; override;
    function GetExceptionSubjectName: String; override;
    function IsAValidPassword(const APassword: String): Boolean; virtual;
    function ValidatePassword(const APassword: String): Boolean; virtual;
    // ---------- can be ovverrided ----------
  public
    constructor Create; override;
    // ---------- can be ovverrided ----------
    function CanAuthorizeCredentials: Boolean; virtual;
    // TODO: implementare attributi [ioInvokeBeforePersist, ioInvokeAfterPersist, ioInvokeBeforeDelete, ioInvokeAfterDelete]
    [ioInvokeBeforePersist]
    procedure ConfirmCredentials; virtual;
    function ResetCredentials(const AGenerateOTP: Boolean = True; const AOTPDurationMins: Integer = AUTH_OTP_DURATION_MIN): String;
    // ---------- can be ovverrided ----------
    // login related properties
    property LoginUser: String read GetLoginUser write SetLoginUser;
    property LoginPassword: String read GetLoginPassword write SetLoginPassword;
    // set/reset/change password related properties
    property CredentialMode: TioAuthCredentialsMode read GetCredentialMode write SetCredentialMode;
    property NewPassword1: String read GetNewPassword1 write SetNewPassword1;
    property NewPassword2: String read GetNewPassword2 write SetNewPassword2;
    property PswExp: TDateTime read GetPswExp write SetPswExp;
  end;

  TioAuthApp = class(TioAuthRolesHolder, IioAuthApp, IioAuthAppCredentials)
  strict private
    [ioIndex(ioAscending, True), ioNotNull] // unique & required
    FAppName: String;
    [ioIndex(ioAscending, True), ioNotNull] // unique & required
    FAppID: String;
    FAppSecret: String;
    function GetAppID: String;
    function GetAppName: String;
    function GetAppSecret: String;
    procedure SetAppID(const Value: String);
    procedure SetAppName(const Value: String);
    procedure SetAppSecret(const Value: String);
  strict protected
    // ---------- can be ovverrided ----------
    procedure Clear(const AClearMode: TioAuthCredentialsClearMode);
    function GenerateAppID: String; virtual;
    function GenerateAppSecret: String; virtual;
    function GetExceptionEntityName: String; override;
    function GetExceptionSubjectName: String; override;
    function ValidateSecrets: Boolean; virtual;
    // ---------- can be ovverrided ----------
  public
    constructor Create; override;
    // ---------- can be ovverrided ----------
    function CanAuthorizeCredentials: Boolean; virtual;
    // TODO: implementare attributi [ioInvokeBeforePersist, ioInvokeAfterPersist, ioInvokeBeforeDelete, ioInvokeAfterDelete]
    [ioInvokeBeforePersist]
    procedure ConfirmCredentials; virtual;
    function ResetCredentials(const AGenerateOTP: Boolean = True; const AOTPDurationMins: Integer = AUTH_OTP_DURATION_MIN): String;
    // ---------- can be ovverrided ----------
    property AppName: String read GetAppName write SetAppName;
    property AppID: String read GetAppID write SetAppID;
    property AppSecret: String read GetAppSecret write SetAppSecret;
  end;

  TioAuthAppItem = class(TioAuthExpirable, IioAuthAppItem)
  strict private
    FApp: IioAuthApp;
    function GetApp: IioAuthApp;
  public
    constructor Create(const AApp: IioAuthApp); overload;
    // ---------- to be ovverrided ----------
    function CheckIfActive(const RaiseExceptions: Boolean): Boolean; override;
    function GetExceptionEntityName: String; override;
    function GetExceptionSubjectName: String; override;
    function GetIsExpired: Boolean; override;
    function GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel; virtual;
    // ---------- to be ovverrided ----------
    // properties
    property App: IioAuthApp read GetApp;
  end;

  TioAuthUserWithApps = class(TioAuthUser, IioAuthUserWithApps)
  strict private
    FApps: TioAuthAppList;
    function GetApps: TioAuthAppList;
  strict protected
    // ---------- can be ovverrided ----------
    function GetPermissionLevelFor(AScope: String; const AAppID: String = IO_STRING_NULL_VALUE): TioAuthPermissionLevel; override;
    // ---------- can be ovverrided ----------
  public
    constructor Create; override;
    destructor Destroy; override;
    // properties
    property Apps: TioAuthAppList read GetApps;
  end;

implementation

uses
  iORM.Exceptions, System.SysUtils, System.Hash, System.DateUtils,
  iORM.Utilities, iORM.Auth.Components.AuthServer;

{ TioAuthCredentials }

constructor TioAuthUserCredentials.Create;
begin
  inherited;
  FLoginUser := IO_STRING_NULL_VALUE;
  FLoginPassword := IO_STRING_NULL_VALUE;
end;

function TioAuthUserCredentials.GetLoginPassword: String;
begin
  Result := FLoginPassword;
end;

function TioAuthUserCredentials.GetLoginUser: String;
begin
  Result := FLoginUser;
end;

procedure TioAuthUserCredentials.SetLoginPassword(const Value: String);
begin
  FLoginPassword := Value;
end;

procedure TioAuthUserCredentials.SetLoginUser(const Value: String);
begin
  FLoginUser := Value;
end;

{ TioAuthExpirable }

function TioAuthExpirable.CheckIfActive(const RaiseExceptions: Boolean): Boolean;
begin
  // Check status
  Result := (FStatus = usActive);
  if RaiseExceptions and not Result then
    raise EioAuthInactiveCredentialsException_401.Create(Format('%s "%s" has been deactivated', [GetExceptionEntityName, GetExceptionSubjectName]));
  // Check expiration
  Result := Result and not GetIsExpired;
  if RaiseExceptions and not Result then
    raise EioAuthExpiredCredentialsException_401.Create(Format('%s "%s" has been expired', [GetExceptionEntityName, GetExceptionSubjectName]));
end;

function TioAuthExpirable.ClassName: String;
begin
  Result := inherited ClassName;
end;

constructor TioAuthExpirable.Create;
begin
  inherited;
  FID := IO_INTEGER_NULL_VALUE;
  FExpiration := IO_DATETIME_NULL_VALUE;
  FStatus := usActive;
end;

function TioAuthExpirable.GetExceptionEntityName: String;
begin
  Result := ClassName;
end;

function TioAuthExpirable.GetExceptionSubjectName: String;
begin
  Result := Format('%s.Subject', [ClassName]);
end;

function TioAuthExpirable.GetExpiration: TDateTime;
begin
  Result := FExpiration;
end;

function TioAuthExpirable.GetID: Integer;
begin
  Result := FID;
end;

function TioAuthExpirable.GetIsActive: Boolean;
begin
  Result := CheckIfActive(False);
end;

function TioAuthExpirable.GetIsExpired: Boolean;
begin
  Result := (FExpiration <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FExpiration);
end;

function TioAuthExpirable.GetStatus: TioAuthUserStatus;
begin
  Result := FStatus;
end;

procedure TioAuthExpirable.SetExpiration(const Value: TDateTime);
begin
  FExpiration := Value;
end;

procedure TioAuthExpirable.SetStatus(const Value: TioAuthUserStatus);
begin
  FStatus := Value;
end;

{ TioAuthPermission }

constructor TioAuthPermission.Create;
begin
  inherited;
  FScope := IO_STRING_NULL_VALUE;
  FPermissionLevel := plUnauthorized;
end;

function TioAuthPermission.GetExceptionEntityName: String;
begin
  Result := 'Permission';
end;

function TioAuthPermission.GetExceptionSubjectName: String;
begin
  Result := FScope;
end;

function TioAuthPermission.GetPermissionLevel: TioAuthPermissionLevel;
begin
  Result := FPermissionLevel;
end;

function TioAuthPermission.GetScope: String;
begin
  Result := FScope;
end;

function TioAuthPermission.GetPermissionLevelFor: TioAuthPermissionLevel;
begin
  if IsActive then
    Exit(FPermissionLevel);
  Result := plUnauthorized;
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

function TioAuthRole.GetName: String;
begin
  Result := FName;
end;

function TioAuthRole.GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel;
var
  LPermission: IioAuthPermission;
begin
  AScope := AScope.ToLower;
  if IsActive then
    for LPermission in FPermissions do
      if LPermission.Scope = AScope then
        Exit(LPermission.PermissionLevel);
  Result := plUnauthorized;
end;

function TioAuthRole.GetPermissions: TioPermissionList;
begin
  Result := FPermissions;
end;

procedure TioAuthRole.SetName(const Value: String);
begin
  FName := Value;
end;

{ TioAuthRoleItem }

constructor TioAuthRoleItem.Create(const ARole: IioAuthRole);
begin
  inherited Create;
  FRole := ARole;
end;

function TioAuthRoleItem.GetRole: IioAuthRole;
begin
  Result := FRole;
end;

function TioAuthRoleItem.CheckIfActive(const RaiseExceptions: Boolean): Boolean;
begin
  Result := not (inherited CheckIfActive(RaiseExceptions) and FRole.CheckIfActive(RaiseExceptions));
end;

function TioAuthRoleItem.GetExceptionEntityName: String;
begin
  Result := 'Role item';
end;

function TioAuthRoleItem.GetExceptionSubjectName: String;
begin
  if Assigned(FRole) then
    Result := FRole.Name;
end;

function TioAuthRoleItem.GetIsExpired: Boolean;
begin
  Result := inherited IsExpired or FRole.IsExpired;
end;

function TioAuthRoleItem.GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel;
begin
  if IsActive then
    Exit( FRole.GetPermissionLevelFor(AScope) );
  Result := plUnauthorized;
end;

{ TioAuthRolesHolder }

constructor TioAuthRolesHolder.Create;
begin
  inherited Create;
  FRoles := TioAuthRoleList.Create;
end;

destructor TioAuthRolesHolder.Destroy;
begin
  FRoles.Free;
  inherited;
end;

function TioAuthRolesHolder.GetRoles: TioAuthRoleList;
begin
  Result := FRoles;
end;

function TioAuthRolesHolder.GetPermissionLevelFor(AScope: String; const AAppID: String = IO_STRING_NULL_VALUE): TioAuthPermissionLevel;
var
  LAuthUserRoleItem: IioAuthRoleItem;
  LPermissionLevel: TioAuthPermissionLevel;
begin
  if IsActive then
  begin
    for LAuthUserRoleItem in FRoles do
    begin
      LPermissionLevel := LAuthUserRoleItem.GetPermissionLevelFor(AScope);
      if LPermissionLevel > Result then
        Result := LPermissionLevel;
    end;
  end
  else
    Result := plUnauthorized;
end;

{ TioAuthUser }

function TioAuthUser.CanAuthorizeCredentials: Boolean;
begin
  // check if active
  Result := CheckIfActive(True);
  // Check password
  if not ValidatePassword(FLoginPassword) then
    raise EioAuthInvalidCredentialsException_401.Create(Format('Invalid %s credentials', [GetExceptionEntityName.ToLower]));
end;

procedure TioAuthUser.Clear(const AClearMode: TioAuthCredentialsClearMode);
begin
  inherited;
  // Clear all
//  if AClearMode = cmAll then
//  begin
//    FName := IO_STRING_NULL_VALUE;
//    FSurname := IO_STRING_NULL_VALUE;
//    FLoginUser := IO_STRING_NULL_VALUE;
//  end;
  // clear password
  FLoginPassword := IO_STRING_NULL_VALUE;
  // clear set/reset/change password related properties
  FNewPassword1 := IO_STRING_NULL_VALUE;
  FNewPassword2 := IO_STRING_NULL_VALUE;
  FPswDigest := IO_STRING_NULL_VALUE;
  // Set password expiration & credentials mode
  FPswExp := IncMinute(TioUtilities.NowUTC, TioAuthServer.GetInstance.UserOTP_Expiration_Mins);
  FCredentialMode := cmSetPassword;
end;

procedure TioAuthUser.ConfirmCredentials;
begin
  // check credentials mode
  if FCredentialMode = cmLogin then
    raise EioAuthException.Create('Invalid credentials mode invoking method "ConfirmCredentials"');
  // check old password
  if (FCredentialMode = cmChangePassword) and ( (not IsAValidPassword(FLoginPassword)) or (not ValidatePassword(FLoginPassword)) ) then
    raise EioAuthInvalidCredentialsException_401.Create('Invalid old password');
  // check new passwords
  if (not IsAValidPassword(FNewPassword1)) or (not IsAValidPassword(FNewPassword2)) then
    raise EioAuthInvalidCredentialsException_401.Create('Invalid new passwords');
  if not String.Equals(FNewPassword1, FNewPassword2) then
    raise  EioAuthInvalidCredentialsException_401.Create('New passwords must be identical');
  // if everiting goes well...
  // ...set the new password digest
  FPswDigest := GeneratePasswordDigest(FNewPassword1);
  // ...set the password expiration
  case FCredentialMode of
    cmLogin:
      FPswExp := TioAuthServer.GetInstance.UserPassword_Expiration_Days; // 0 = perpetual
    cmSetPassword, cmChangePassword:
      FPswExp := TioAuthServer.GetInstance.UserOTP_Expiration_Mins; // 0 = perpetual
  end;
  // ...set the credentials mode
  FCredentialMode := cmLogin;
end;

constructor TioAuthUser.Create;
begin
  inherited;
  Clear(cmAll);
end;

function TioAuthUser.GeneratePasswordDigest(const APassword: String): String;
begin
  Result := THashSHA2.GetHashString(APassword);
end;

function TioAuthUser.GenerateOTP: String;
begin
  // TODO: generate OTP, sostituire con una funzione vera
  Result := FormatDateTime('ddmmyyyy', TioUtilities.NowUTC);
end;

function TioAuthUser.GetCredentialMode: TioAuthCredentialsMode;
begin
  Result := FCredentialMode;
end;

function TioAuthUser.GetExceptionEntityName: String;
begin
  Result := 'User';
end;

function TioAuthUser.GetExceptionSubjectName: String;
begin
  Result := FLoginUser;
end;

function TioAuthUser.GetLoginPassword: String;
begin
  Result := FLoginPassword;
end;

function TioAuthUser.GetLoginUser: String;
begin
  Result := FLoginUser;
end;

function TioAuthUser.GetNewPassword1: String;
begin
  Result := FNewPassword1;
end;

function TioAuthUser.GetNewPassword2: String;
begin
  Result := FNewPassword2;
end;

function TioAuthUser.GetPswExp: TDateTime;
begin
  Result := FPswExp;
end;

function TioAuthUser.IsAValidPassword(const APassword: String): Boolean;
begin
  Result := not APassword.Trim.IsEmpty;
end;

function TioAuthUser.ResetCredentials(const AGenerateOTP: Boolean; const AOTPDurationMins: Integer): String;
begin
  Clear(cmSecretsOnly);
  if AGenerateOTP then
  begin
    Result := GenerateOTP;
    FCredentialMode := cmChangePassword;
  end
  else
  begin
    Result := IO_STRING_NULL_VALUE;
    FCredentialMode := cmSetPassword;
  end;
end;

procedure TioAuthUser.SetCredentialMode(const Value: TioAuthCredentialsMode);
begin
  FCredentialMode := Value;
end;

procedure TioAuthUser.SetLoginPassword(const Value: String);
begin
  FLoginPassword := Value;
end;

procedure TioAuthUser.SetLoginUser(const Value: String);
begin
  FLoginUser := Value;
end;

procedure TioAuthUser.SetNewPassword1(const Value: String);
begin
  FNewPassword1 := Value;
end;

procedure TioAuthUser.SetNewPassword2(const Value: String);
begin
  FNewPassword2 := Value;
end;

procedure TioAuthUser.SetPswExp(const Value: TDateTime);
begin
  FPswExp := Value;
end;

function TioAuthUser.ValidatePassword(const APassword: String): Boolean;
begin
  Result := IsAValidPassword(APassword) and (GeneratePasswordDigest(APassword) = FPswDigest);
end;

{ TioAuthApp }

function TioAuthApp.CanAuthorizeCredentials: Boolean;
begin
  // check if active
  Result := CheckIfActive(True);
  // Check password
  if not ValidateSecrets then
    raise EioAuthInvalidCredentialsException_401.Create(Format('Invalid %s credentials', [GetExceptionEntityName.ToLower]));
end;

procedure TioAuthApp.Clear(const AClearMode: TioAuthCredentialsClearMode);
begin
  if AClearMode = cmAll then
    FAppName := IO_STRING_NULL_VALUE;
  FAppID := IO_STRING_NULL_VALUE;
  FAppSecret := IO_STRING_NULL_VALUE;
end;

procedure TioAuthApp.ConfirmCredentials;
begin
  if FAppName.Trim.IsEmpty then
    raise EioAuthInvalidCredentialsException_401.Create(Format('Invalid %s credentials'#13#13'"AppName" property cannot be empty', [GetExceptionEntityName.ToLower]));
  if FAppID.Trim.IsEmpty then
    FAppID := GenerateAppID;
  FAppSecret := GenerateAppSecret;
end;

constructor TioAuthApp.Create;
begin
  inherited;
  Clear(cmAll);
end;

function TioAuthApp.GenerateAppID: String;
begin
  // TODO: generate AppID, sostituire con una funzione vera
  Result := Format('%s-%s', [FAppName.Trim, FormatDateTime('ddmmyyyy', TioUtilities.NowUTC)]);
end;

function TioAuthApp.GenerateAppSecret: String;
begin
  Result := THashSHA2.GetHashString( Format('%s-%s', [FAppName.Trim, FAppID.Trim]) );
end;

function TioAuthApp.GetAppID: String;
begin
  Result := FAppID;
end;

function TioAuthApp.GetAppSecret: String;
begin
  Result := FAppSecret;
end;

function TioAuthApp.GetExceptionEntityName: String;
begin
  Result := 'App';
end;

function TioAuthApp.GetExceptionSubjectName: String;
begin
  Result := FAppName;
end;

function TioAuthApp.ResetCredentials(const AGenerateOTP: Boolean; const AOTPDurationMins: Integer): String;
begin
  Clear(cmSecretsOnly);
end;

function TioAuthApp.GetAppName: String;
begin
  Result := FAppName;
end;

procedure TioAuthApp.SetAppID(const Value: String);
begin
  FAppID := Value;
end;

procedure TioAuthApp.SetAppSecret(const Value: String);
begin
  FAppSecret := Value;
end;

procedure TioAuthApp.SetAppName(const Value: String);
begin
  FAppName := Value;
end;

function TioAuthApp.ValidateSecrets: Boolean;
begin
  Result := (not FAppID.Trim.IsEmpty) and (GenerateAppSecret = FAppSecret);
end;

{ TioAuthUserWithApps }

constructor TioAuthUserWithApps.Create;
begin
  inherited Create;
  FApps := TioAuthAppList.Create;
end;

destructor TioAuthUserWithApps.Destroy;
begin
  FApps.Free;
  inherited;
end;

function TioAuthUserWithApps.GetApps: TioAuthAppList;
begin
  Result := FApps;
end;

function TioAuthUserWithApps.GetPermissionLevelFor(AScope: String; const AAppID: String): TioAuthPermissionLevel;
var
  LAuthUserAppItem: IioAuthAppItem;
  LPermissionLevel: TioAuthPermissionLevel;
begin
  if IsActive then
  begin
    // retrieve user permission
    Result := inherited;
    // app permissions
    // note: if there are no apps or if the apps have no permission or role assigned then use those of the user otherwise use those of the app
    if AAppID <> IO_STRING_NULL_VALUE then
    begin
      LPermissionLevel := plUnauthorized;
      for LAuthUserAppItem in FApps do
        if LAuthUserAppItem.App.AppID = AAppID then
          LPermissionLevel := LAuthUserAppItem.GetPermissionLevelFor(AScope);
      if LPermissionLevel < Result then
        Result := LPermissionLevel;
    end;
  end
  else
    Result := plUnauthorized;
end;

{ TioAuthAppItem }

function TioAuthAppItem.CheckIfActive(const RaiseExceptions: Boolean): Boolean;
begin
  Result := not (inherited CheckIfActive(RaiseExceptions) and FApp.CheckIfActive(RaiseExceptions));
end;

constructor TioAuthAppItem.Create(const AApp: IioAuthApp);
begin
  inherited Create;
  FApp := AApp;
end;

function TioAuthAppItem.GetApp: IioAuthApp;
begin
  Result := FApp;
end;

function TioAuthAppItem.GetExceptionEntityName: String;
begin
  Result := 'App item';
end;

function TioAuthAppItem.GetExceptionSubjectName: String;
begin
  if Assigned(FApp) then
    Result := FApp.AppName;
end;

function TioAuthAppItem.GetIsExpired: Boolean;
begin
  Result := inherited IsExpired or FApp.IsExpired;
end;

function TioAuthAppItem.GetPermissionLevelFor(AScope: String): TioAuthPermissionLevel;
begin
  if IsActive then
    Exit( FApp.GetPermissionLevelFor(AScope) );
  Result := plUnauthorized;
end;

{ TioAuthAppCredentials }

constructor TioAuthAppCredentials.Create;
begin
  inherited;
  FAppName := IO_STRING_NULL_VALUE;
  FAppID := IO_STRING_NULL_VALUE;
  FAppSecret := IO_STRING_NULL_VALUE;
end;

function TioAuthAppCredentials.GetAppID: String;
begin
  Result := FAppID;
end;

function TioAuthAppCredentials.GetAppSecret: String;
begin
  Result := FAppSecret;
end;

function TioAuthAppCredentials.GetAppName: String;
begin
  Result := FAppName;
end;

procedure TioAuthAppCredentials.SetAppID(const Value: String);
begin
  FAppID := Value;
end;

procedure TioAuthAppCredentials.SetAppName(const Value: String);
begin
  FAppName := Value;
end;

procedure TioAuthAppCredentials.SetAppSecret(const Value: String);
begin
  FAppSecret := Value;
end;

end.
