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
unit iORM.Auth.Session;

interface

uses
  iORM.Auth.Interfaces;

type

  TioAuthSessionThreadSafeWrapper = class(TInterfacedObject, IioAuthSessionThreadSafeWrapper)
  private
    FSession: IioAuthSession;
  public
    constructor Create;
    procedure Clear;
    function Acquire: IioAuthSession;
    procedure Release;
  end;

  TioAuthSessionSubjects = class(TInterfacedObject, IioAuthSessionSubjects)
  private
    FApp: String;
    FAppOID: Integer;
    FUser: String;
    FUserOID: Integer;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetHasApp: Boolean;
    function GetHasAppOID: Boolean;
    function GetHasUser: Boolean;
    function GetHasUserOID: Boolean;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    constructor Create;
    procedure Assign(const ASource: IioAuthSessionSubjects);
    function AsString: String;
    procedure FromString(const Value: String);
    procedure Clear;
    function IsEmpty: Boolean;
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property HasApp: Boolean read GetHasApp;
    property HasAppOID: Boolean read GetHasAppOID;
    property HasUser: Boolean read GetHasUser;
    property HasUserOID: Boolean read GetHasUserOID;
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
  end;

  TioAuthSession = class(TInterfacedObject, IioAuthSession)
  private
    // subjects (user, app)
    FSubjects: IioAuthSessionSubjects;
    // refresh
    FRefreshToken: String;
    FRefreshTokenExp: TDateTime;
    // access
    FAccessToken: String;
    FAccessTokenExp: TDateTime;
    FRefreshAfter: TDateTime;
    // connection
    FConnectionName: String;
    // methods
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenIsExpired: Boolean;
    function GetConnectionName: String;
    function GetHasAccessToken: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetNeedRefresh: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetRefreshTokenIsExpired: Boolean;
    function GetSubjects: IioAuthSessionSubjects;
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetConnectionName(const Value: String);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
  public
    constructor Create;
    procedure Clear;
    // subjects (user, app)
    property Subjects: IioAuthSessionSubjects read GetSubjects;
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

implementation

uses iORM.CommonTypes, iORM.Utilities, iORM.Auth.Factory, DJSON,
  System.SysUtils, System.JSON;

{ TioAuthSession }

procedure TioAuthSession.Clear;
begin
  // subjects (user, app)
  FSubjects.Clear;
  // refresh
  FRefreshToken := IO_STRING_NULL_VALUE;
  FRefreshTokenExp := IO_DATETIME_NULL_VALUE;
  // access
  FAccessToken := IO_STRING_NULL_VALUE;
  FAccessTokenExp := IO_DATETIME_NULL_VALUE;
  FRefreshAfter := IO_DATETIME_NULL_VALUE;
end;

constructor TioAuthSession.Create;
begin
  inherited;
  FSubjects := TioAuthFactory.NewAuthSessionSubjects;
  Clear;
end;

function TioAuthSession.GetAccessToken: String;
begin
  Result := FAccessToken;
end;

function TioAuthSession.GetAccessTokenExp: TDateTime;
begin
  Result := FAccessTokenExp;
end;

function TioAuthSession.GetAccessTokenIsExpired: Boolean;
begin
  Result := ((FAccessTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FAccessTokenExp)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetNeedRefresh: Boolean;
begin
  Result := ((FRefreshAfter <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FRefreshAfter)) or (FAccessToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetConnectionName: String;
begin
  Result := FConnectionName;
end;

function TioAuthSession.GetHasAccessToken: Boolean;
begin
  Result := FAccessToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetHasRefreshToken: Boolean;
begin
  Result := FRefreshToken <> IO_STRING_NULL_VALUE;
end;

function TioAuthSession.GetRefreshAfter: TDateTime;
begin
  Result := FRefreshAfter;
end;

function TioAuthSession.GetRefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TioAuthSession.GetRefreshTokenExp: TDateTime;
begin
  Result := FRefreshTokenExp;
end;

function TioAuthSession.GetRefreshTokenIsExpired: Boolean;
begin
  Result := ((FRefreshTokenExp <> IO_DATETIME_NULL_VALUE) and (TioUtilities.NowUTC > FRefreshTokenExp)) or (FRefreshToken = IO_STRING_NULL_VALUE);
end;

function TioAuthSession.GetSubjects: IioAuthSessionSubjects;
begin
  Result := FSubjects;
end;

procedure TioAuthSession.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioAuthSession.SetAccessTokenExp(const Value: TDateTime);
begin
  FAccessTokenExp := Value;
end;

procedure TioAuthSession.SetConnectionName(const Value: String);
begin
  FConnectionName := Value;
end;

procedure TioAuthSession.SetRefreshAfter(const Value: TDateTime);
begin
  FRefreshAfter := Value;
end;

procedure TioAuthSession.SetRefreshToken(const Value: String);
begin
  FRefreshToken := Value;
end;

procedure TioAuthSession.SetRefreshTokenExp(const Value: TDateTime);
begin
  FRefreshTokenExp := Value;
end;

{ TioAuthSessionThreadSafeWrapper }

function TioAuthSessionThreadSafeWrapper.Acquire: IioAuthSession;
begin
  TMonitor.Enter(Self);
  Result := FSession;
end;

procedure TioAuthSessionThreadSafeWrapper.Clear;
begin
  Acquire;
  try
    FSession := TioAuthFactory.NewAuthSession;
  finally
    Release;
  end;
end;

constructor TioAuthSessionThreadSafeWrapper.Create;
begin
  inherited;
  Clear;
end;

procedure TioAuthSessionThreadSafeWrapper.Release;
begin
  TMonitor.Exit(Self);
end;

{ TioAuthSessionSubjects }

procedure TioAuthSessionSubjects.Assign(const ASource: IioAuthSessionSubjects);
begin
  FApp := ASource.App;
  FAppOID := ASource.AppOID;
  FUser := ASource.User;
  FUserOID := ASource.UserOID;
end;

function TioAuthSessionSubjects.AsString: String;
begin
  if IsEmpty then
   Exit(String.Empty)
  else
    Result := Format('{"App": "%s", "AppOID": %d, "User": "%s", "UserOID": %d}', [FApp, FAppOID, FUser, FUserOID]);
end;

procedure TioAuthSessionSubjects.Clear;
begin
  // user
  FUser := IO_STRING_NULL_VALUE;
  FUserOID := IO_INTEGER_NULL_VALUE;
  // app
  FApp := IO_STRING_NULL_VALUE;
  FAppOID := IO_INTEGER_NULL_VALUE;
end;

constructor TioAuthSessionSubjects.Create;
begin
  inherited;
  Clear;
end;

procedure TioAuthSessionSubjects.FromString(const Value: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  LJSONObject := TJSONObject.ParseJSONValue(Value) as TJSONObject;
  try
    FApp := LJSONObject.GetValue('App').Value;
    FAppOID := (LJSONObject.GetValue('AppOID') as TJSONNumber).AsInt;
    FUser := LJSONObject.GetValue('User').Value;
    FUserOID := (LJSONObject.GetValue('UserOID') as TJSONNumber).AsInt;
  finally
    LJSONObject.Free;
  end;
end;

function TioAuthSessionSubjects.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthSessionSubjects.GetAppOID: Integer;
begin

  Result := FAppOID;
end;

function TioAuthSessionSubjects.GetUser: String;
begin
  Result := FUser;
end;

function TioAuthSessionSubjects.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

function TioAuthSessionSubjects.GetHasApp: Boolean;
begin
  Result := FApp <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionSubjects.GetHasAppOID: Boolean;
begin
  Result := FAppOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionSubjects.GetHasUser: Boolean;
begin
  Result := FUser <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionSubjects.GetHasUserOID: Boolean;
begin
  Result := FUserOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionSubjects.IsEmpty: Boolean;
begin
  Result := (FApp = IO_STRING_NULL_VALUE) and (FAppOID = IO_INTEGER_NULL_VALUE) and (FUser = IO_STRING_NULL_VALUE) and (FUserOID = IO_INTEGER_NULL_VALUE);
end;

procedure TioAuthSessionSubjects.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioAuthSessionSubjects.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthSessionSubjects.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TioAuthSessionSubjects.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

end.
