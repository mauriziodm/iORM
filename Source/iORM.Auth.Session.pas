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

  TioAuthSessionData = class(TInterfacedObject, IioAuthSessionData)
  private
    // app                                  -
    FApp: String;
    FAppOID: Integer;
    // user
    FUser: String;
    FUserOID: Integer;
    // connection
    FConnectionName: String;
    FConnectionNameRemote: String;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetConnectionName: String;
    function GetConnectionNameRemote: String;
    function GetHasApp: Boolean;
    function GetHasAppOID: Boolean;
    function GetHasConnectionName: Boolean;
    function GetHasConnectionNameRemote: Boolean;
    function GetHasUser: Boolean;
    function GetHasUserOID: Boolean;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetConnectionName(const Value: String);
    procedure SetConnectionNameRemote(const Value: String);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
  public
    constructor Create;
    function Clone: IioAuthSessionData;
    procedure Assign(const ASource: IioAuthSessionData);
    function AsString: String;
    procedure FromString(const Value: String);
    procedure Clear;
    function IsEmpty: Boolean;
    // app
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property HasApp: Boolean read GetHasApp;
    property HasAppOID: Boolean read GetHasAppOID;
    // connection
    property ConnectionName: String read GetConnectionName write SetConnectionName;
    property ConnectionNameRemote: String read GetConnectionNameRemote write SetConnectionNameRemote;
    property HasConnectionName: Boolean read GetHasConnectionName;
    property HasConnectionNameRemote: Boolean read GetHasConnectionNameRemote;
    // user
    property HasUser: Boolean read GetHasUser;
    property HasUserOID: Boolean read GetHasUserOID;
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
  end;

  TioAuthSession = class(TInterfacedObject, IioAuthSession)
  private
    // session data (user, app, connection)
    FSessionData: IioAuthSessionData;
    // refresh
    FRefreshToken: String;
    FRefreshTokenExp: TDateTime;
    // access
    FAccessToken: String;
    FAccessTokenExp: TDateTime;
    FRefreshAfter: TDateTime;
    // methods
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenIsExpired: Boolean;
    function GetHasAccessToken: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetNeedRefresh: Boolean;
    function GetRefreshAfter: TDateTime;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetRefreshTokenIsExpired: Boolean;
    function GetSessionData: IioAuthSessionData;
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetRefreshAfter(const Value: TDateTime);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
  public
    constructor Create;
    procedure Clear;
    // subjects (user, app)
    property SessionData: IioAuthSessionData read GetSessionData;
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
  end;

implementation

uses iORM.CommonTypes, iORM.Utilities, iORM.Auth.Factory, DJSON,
  System.SysUtils, System.JSON;

{ TioAuthSession }

procedure TioAuthSession.Clear;
begin
  // subjects (user, app)
  FSessionData.Clear;
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
  FSessionData := TioAuthFactory.NewAuthSessionData;
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

function TioAuthSession.GetSessionData: IioAuthSessionData;
begin
  Result := FSessionData;
end;

procedure TioAuthSession.SetAccessToken(const Value: String);
begin
  FAccessToken := Value;
end;

procedure TioAuthSession.SetAccessTokenExp(const Value: TDateTime);
begin
  FAccessTokenExp := Value;
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

procedure TioAuthSessionData.Assign(const ASource: IioAuthSessionData);
begin
  FApp := ASource.App;
  FAppOID := ASource.AppOID;
  FConnectionName := ASource.ConnectionName;
  FConnectionNameRemote := ASource.ConnectionNameRemote;
  FUser := ASource.User;
  FUserOID := ASource.UserOID;
end;

function TioAuthSessionData.AsString: String;
begin
  if IsEmpty then
   Exit(String.Empty)
  else
    // NB: quando serializza sostituisce il ConnectionName con il ConnectionNameRemote in modo che l'app server usi la connessione
    //      corretta (quella remote) che diventa di fatto la connessione in uso per il server
    Result := Format('{"App": "%s", "AppOID": %d, "ConnectionName": "%s", "ConnectionNameRemote": "%s", "User": "%s", "UserOID": %d}', [FApp, FAppOID, FConnectionNameRemote, IO_STRING_NULL_VALUE, FUser, FUserOID]);
end;

procedure TioAuthSessionData.Clear;
begin
  // app
  FApp := IO_STRING_NULL_VALUE;
  FAppOID := IO_INTEGER_NULL_VALUE;
  // connection
  FConnectionName := IO_STRING_NULL_VALUE;
  FConnectionNameRemote := IO_STRING_NULL_VALUE;
  // user
  FUser := IO_STRING_NULL_VALUE;
  FUserOID := IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionData.Clone: IioAuthSessionData;
begin
  Result := Create;
  Result.User := User;
  Result.UserID := UserID;
  Result.App := App;
  Result.AppID := AppID;
  Result.ConnectionName := ConnectionName;
  Result.ConnectionNameRemote := ConnectionNameRemote;
end;

constructor TioAuthSessionData.Create;
begin
  inherited;
  Clear;
end;

procedure TioAuthSessionData.FromString(const Value: String);
var
  LJSONObject: TJSONObject;
  LJSONValue: TJSONValue;
begin
  LJSONObject := TJSONObject.ParseJSONValue(Value) as TJSONObject;
  try
    FApp := LJSONObject.GetValue('App').Value;
    FAppOID := (LJSONObject.GetValue('AppOID') as TJSONNumber).AsInt;
    FConnectionName := LJSONObject.GetValue('ConnectionName').Value;
    FConnectionNameRemote := LJSONObject.GetValue('ConnectionNameRemote').Value;
    FUser := LJSONObject.GetValue('User').Value;
    FUserOID := (LJSONObject.GetValue('UserOID') as TJSONNumber).AsInt;
  finally
    LJSONObject.Free;
  end;
end;

function TioAuthSessionData.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthSessionData.GetAppOID: Integer;
begin

  Result := FAppOID;
end;

function TioAuthSessionData.GetConnectionName: String;
begin
  Result := FConnectionName;
end;

function TioAuthSessionData.GetUser: String;
begin
  Result := FUser;
end;

function TioAuthSessionData.GetUserOID: Integer;
begin
  Result := FUserOID;
end;

function TioAuthSessionData.GetHasApp: Boolean;
begin
  Result := FApp <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasAppOID: Boolean;
begin
  Result := FAppOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionData.GetHasConnectionName: Boolean;
begin
  Result := FConnectionName <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasConnectionNameRemote: Boolean;
begin
  Result := FConnectionNameRemote <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasUser: Boolean;
begin
  Result := FUser <> IO_STRING_NULL_VALUE;
end;

function TioAuthSessionData.GetHasUserOID: Boolean;
begin
  Result := FUserOID <> IO_INTEGER_NULL_VALUE;
end;

function TioAuthSessionData.GetConnectionNameRemote: String;
begin
  Result := FConnectionNameRemote;
end;

function TioAuthSessionData.IsEmpty: Boolean;
begin
  Result := (FApp = IO_STRING_NULL_VALUE) and (FAppOID = IO_INTEGER_NULL_VALUE) and (FUser = IO_STRING_NULL_VALUE) and (FUserOID = IO_INTEGER_NULL_VALUE)
     and (FConnectionName = IO_STRING_NULL_VALUE) and (FConnectionNameRemote = IO_STRING_NULL_VALUE);
end;

procedure TioAuthSessionData.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioAuthSessionData.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthSessionData.SetConnectionName(const Value: String);
begin
  FConnectionName := Value;
end;

procedure TioAuthSessionData.SetConnectionNameRemote(const Value: String);
begin
  FConnectionNameRemote := Value;
end;

procedure TioAuthSessionData.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TioAuthSessionData.SetUserOID(const Value: Integer);
begin
  FUserOID := Value;
end;

end.
