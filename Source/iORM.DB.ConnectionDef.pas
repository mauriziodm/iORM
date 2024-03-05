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
unit iORM.DB.ConnectionDef;

interface

uses
  System.Classes, iORM.DB.Interfaces, iORM.CommonTypes, iORM.DBBuilder.Interfaces,
  iORM.SynchroStrategy.Interfaces;

type

  TioDBStdFolder = (sfUndefined, sfDocuments, sfSharedDocuments, sfHome, sfPublic, sfTemp);
  TioOSAuthent = (oaNo, oaYes);
  TioSQLDialect = (sqlDialect1, sqlDialect2, sqlDialect3);
  TioProtocol = (pLocal, pNetBEUI, pSPX, pTCPIP);

  TioCustomConnectionDef = class;

  TioDBBuilderBeforeCreateOrAlterDBEvent = procedure(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
    const AScript, AWarnings: TStrings; var AAbort: Boolean) of object;
  TioDBBuilderAfterCreateOrAlterDBEvent = procedure(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
    const AScript, AWarnings: TStrings) of object;

  TioDBBuilderProperty = class(TPersistent)
  strict private
    FEnabled: Boolean;
    FForeignKeys: Boolean;
    FIndexes: Boolean;
  published
    constructor Create;
    // Properties
    // NB: DBBuilder related events are on ConnectionDef component, not in this class
    property Enabled: Boolean read FEnabled write FEnabled default False;
    property Indexes: Boolean read FIndexes write FIndexes default True;
    property ForeignKeys: Boolean read FForeignKeys write FForeignKeys default True;
  end;

  // Base class for all ConnectionDef components
  TioCustomConnectionDef = class(TComponent, IioSynchroStrategy_TargetConnectionDef)
  strict private
    // Events
    FOnAfterCreateOrAlterDBEvent: TioDBBuilderAfterCreateOrAlterDBEvent;
    FOnAfterRegister: TNotifyEvent;
    FOnBeforeCreateOrAlterDBEvent: TioDBBuilderBeforeCreateOrAlterDBEvent;
    FOnBeforeRegister: TNotifyEvent;
    // Fields
    FAutoCreateDB: TioDBBuilderProperty;
    FBaseURL: String;
    FCharSet: String;
    FConnectionDef: IIoStanConnectionDef;
    FDatabase: String;
    FDatabaseStdFolder: TioDBStdFolder;
    FAsDefault: Boolean;
    FEncrypt: String;
    FIsRegistered: Boolean;
    FNewPassword: String;
    FOSAuthent: TioOSAuthent;
    FPassword: String;
    FPersistent: Boolean;
    FPooled: Boolean;
    FPort: Integer;
    FProtocol: TioProtocol;
    FServer: String;
    FSQLDialect: TioSQLDialect;
    FUserName: String;
    FSynchroStrategy_Client: IioSynchroStrategy;
    function Get_Version: String;
    procedure SetAsDefault(const Value: Boolean);
    procedure SetSynchroStrategy_Client(const ASynchroStrategy_Client: IioSynchroStrategy);
    // IioSynchroStrategy_TargetConnectionDef
    function GetName: String;
  protected
    function DBBuilder: IioDBBuilderEngine; virtual;
    procedure DoAfterRegister;
    procedure DoBeforeRegister;
    function GetFullPathDatabase: String;
    procedure Loaded; override;
    // Properties
    property AutoCreateDB: TioDBBuilderProperty read FAutoCreateDB write FAutoCreateDB;
    property BaseURL: String read FBaseURL write FBaseURL;
    property CharSet: String read FCharSet write FCharSet;
    property Database: String read FDatabase write FDatabase;
    property DatabaseStdFolder: TioDBStdFolder read FDatabaseStdFolder write FDatabaseStdFolder;
    property Encrypt: String read FEncrypt write FEncrypt;
    property NewPassword: String read FNewPassword write FNewPassword;
    property OSAuthent: TioOSAuthent read FOSAuthent write FOSAuthent;
    property Password: String read FPassword write FPassword;
    property Pooled: Boolean read FPooled write FPooled;
    property Port: Integer read FPort write FPort;
    property Protocol: TioProtocol read FProtocol write FProtocol;
    property Server: String read FServer write FServer;
    property SQLDialect: TioSQLDialect read FSQLDialect write FSQLDialect;
    property UserName: String read FUserName write FUserName;
    property SynchroStrategy_Client: IioSynchroStrategy read FSynchroStrategy_Client write SetSynchroStrategy_Client default nil;
    // Events
    property OnAfterCreateOrAlterDB: TioDBBuilderAfterCreateOrAlterDBEvent read FOnAfterCreateOrAlterDBEvent
      write FOnAfterCreateOrAlterDBEvent;
    property OnBeforeCreateOrAlterDB: TioDBBuilderBeforeCreateOrAlterDBEvent read FOnBeforeCreateOrAlterDBEvent
      write FOnBeforeCreateOrAlterDBEvent;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CreateOrAlterDB(const AForce: Boolean = False); virtual;
    procedure RegisterConnectionDef; virtual;
    // Properties
    property AsDefault: Boolean read FAsDefault write SetAsDefault;
    property ConnectionDef: IIoStanConnectionDef read FConnectionDef write FConnectionDef;
    property IsRegistered: Boolean read FIsRegistered;
    property Persistent: Boolean read FPersistent write FPersistent;
  published
    property _Version: String read Get_Version;
    // Events
    property OnAfterRegister: TNotifyEvent read FOnAfterRegister write FOnAfterRegister;
    property OnBeforeRegister: TNotifyEvent read FOnBeforeRegister write FOnBeforeRegister;
  end;

  // Class for http connection
  TioHttpConnectionDef = class(TioCustomConnectionDef)
  public
    constructor Create(AOwner: TComponent); override;
    procedure RegisterConnectionDef; override;
  published
    property AsDefault;
    property BaseURL;
    property Persistent;
    property SynchroStrategy_Client;
  end;

  // Class for SQLite connection
  TioSQLiteConnectionDef = class(TioCustomConnectionDef)
  public
    procedure RegisterConnectionDef; override;
    function DBBuilder: IioDBBuilderEngine; override;
    // Properties
    property ConnectionDef;
  published
    // Properties
    property AsDefault;
    property AutoCreateDB;
    property Database;
    property DatabaseStdFolder;
    property Encrypt;
    property NewPassword;
    property Password;
    property Persistent;
    property Pooled;
    property SynchroStrategy_Client;
    // Events
    property OnAfterCreateOrAlterDB;
    property OnBeforeCreateOrAlterDB;
  end;

  // Class for Firebird connection
  TioFirebirdConnectionDef = class(TioCustomConnectionDef)
  public
    constructor Create(AOwner: TComponent); override;
    procedure RegisterConnectionDef; override;
    function DBBuilder: IioDBBuilderEngine; override;
    // Properties
    property ConnectionDef;
  published
    // Properties
    property AsDefault;
    property AutoCreateDB;
    property CharSet;
    property Database;
    property DatabaseStdFolder;
    property OSAuthent;
    property Password;
    property Persistent;
    property Pooled;
    property Port;
    property Protocol;
    property Server;
    property SQLDialect;
    property UserName;
    property SynchroStrategy_Client;
    // Events
    property OnAfterCreateOrAlterDB;
    property OnBeforeCreateOrAlterDB;
  end;

  // Class for MySQL connection
  TioMySQLConnectionDef = class(TioCustomConnectionDef)
  public
    constructor Create(AOwner: TComponent); override;
    procedure RegisterConnectionDef; override;
    function DBBuilder: IioDBBuilderEngine; override;
    // Properties
    property ConnectionDef;
  published
    // Properties
    property AsDefault;
    property AutoCreateDB;
    property CharSet;
    property Database;
    property DatabaseStdFolder;
    property Password;
    property Persistent;
    property Pooled;
    property Port;
    property Server;
    property UserName;
    property SynchroStrategy_Client;
    // Events
    property OnAfterCreateOrAlterDB;
    property OnBeforeCreateOrAlterDB;
  end;

  // Class for SQL Monitor functionalities
  TioSQLMonitor = class(TComponent)
  strict private
    FMode: TioMonitorMode;
    function Get_Version: String;
    procedure SetMode(const Value: TioMonitorMode);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Mode: TioMonitorMode read FMode write SetMode;
    property _Version: String read Get_Version;
  end;

implementation

uses
  System.IOUtils, iORM.DB.ConnectionContainer, System.SysUtils,
  iORM, iORM.DBBuilder.Factory;

{ TioCustomConnectionDef }

constructor TioCustomConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  FBaseURL := '';
  FCharSet := '';
  FDatabase := '';
  FDatabaseStdFolder := TioDBStdFolder.sfUndefined;
  FAsDefault := True;
  FEncrypt := '';
  FIsRegistered := False;
  FNewPassword := '';
  FOSAuthent := TioOSAuthent.oaNo;
  FPassword := '';
  FPersistent := False;
  FPooled := False;
  FPort := 0;
  FProtocol := TioProtocol.pTCPIP;
  FServer := '';
  FSQLDialect := TioSQLDialect.sqlDialect3;
  FUserName := '';
  FAutoCreateDB := TioDBBuilderProperty.Create;
  FSynchroStrategy_Client := nil;
end;

function TioCustomConnectionDef.DBBuilder: IioDBBuilderEngine;
begin
  Result := TioDBBuilderFactory.NewEngine(Name, FAutoCreateDB.Indexes, FAutoCreateDB.ForeignKeys);
end;

destructor TioCustomConnectionDef.Destroy;
begin
  if FSynchroStrategy_Client <> nil then
    FSynchroStrategy_Client.RemoveFreeNotification(Self);
  FAutoCreateDB.Free;
  inherited;
end;

procedure TioCustomConnectionDef.DoAfterRegister;
begin
  if Assigned(FOnAfterRegister) then
    FOnAfterRegister(Self);
end;

procedure TioCustomConnectionDef.DoBeforeRegister;
begin
  if Assigned(FOnBeforeRegister) then
    FOnBeforeRegister(Self);
end;

procedure TioCustomConnectionDef.CreateOrAlterDB(const AForce: Boolean = False);
var
  LAbort: Boolean;
  LDBBuilderEngine: IioDBBuilderEngine;
begin
  LAbort := False;
  LDBBuilderEngine := TioDBBuilderFactory.NewEngine(Name, FAutoCreateDB.Indexes, FAutoCreateDB.ForeignKeys);
  if Assigned(FOnBeforeCreateOrAlterDBEvent) then
    FOnBeforeCreateOrAlterDBEvent(Self, LDBBuilderEngine.Status, LDBBuilderEngine.Script, LDBBuilderEngine.Warnings, LAbort);
  if not LAbort then
  begin
    LDBBuilderEngine.CreateOrAlterDB(AForce);
    if Assigned(FOnAfterCreateOrAlterDBEvent) then
      FOnAfterCreateOrAlterDBEvent(Self, LDBBuilderEngine.Status, LDBBuilderEngine.Script, LDBBuilderEngine.Warnings);
  end;
end;

function TioCustomConnectionDef.GetFullPathDatabase: String;
var
  LDBFolder: String;
begin
  case FDatabaseStdFolder of
    TioDBStdFolder.sfDocuments:
      LDBFolder := TPath.GetDocumentsPath;
    TioDBStdFolder.sfSharedDocuments:
      LDBFolder := TPath.GetSharedDocumentsPath;
    TioDBStdFolder.sfHome:
      LDBFolder := TPath.GetHomePath;
    TioDBStdFolder.sfPublic:
      LDBFolder := TPath.GetPublicPath;
    TioDBStdFolder.sfTemp:
      LDBFolder := TPath.GetTempPath;
  else
    LDBFolder := '';
  end;
  if not LDBFolder.IsEmpty then
    Result := TPath.GetFullPath(TPath.Combine(LDBFolder, FDatabase))
  else
    Result := FDatabase;
end;

function TioCustomConnectionDef.GetName: String;
begin
  Result := Self.Name;
end;

function TioCustomConnectionDef.Get_Version: String;
begin
  Result := io.Version;
end;

procedure TioCustomConnectionDef.Loaded;
begin
  inherited;
  // Register itself in the ConnectionManager if not already registered (byTioPrototypeBindSource)
  if (csDesigning in ComponentState) then
    Exit;
  if (not FIsRegistered) then
         RegisterConnectionDef;
end;

procedure TioCustomConnectionDef.RegisterConnectionDef;
begin
  inherited;
  // Mark the connection as registered in the ConnectionManager
  FIsRegistered := True;
  // Fire the OnAfterRegister event if implemented
  DoAfterRegister;
  // Autocreate Database if enabled
  if FAutoCreateDB.Enabled then
    CreateOrAlterDB;
end;

procedure TioCustomConnectionDef.SetAsDefault(const Value: Boolean);
var
  I: Integer;
  LConnectionDef: TioCustomConnectionDef;
begin
  FAsDefault := Value;
  if Value then
  begin
    // Uncheck previous default connection
    for I := 0 to Owner.ComponentCount - 1 do
    begin
      if (Owner.Components[I] is TioCustomConnectionDef) and (Owner.Components[I] <> Self) then
      begin
        LConnectionDef := TioCustomConnectionDef(Owner.Components[I]);
        LConnectionDef.AsDefault := False;
      end;
    end;
    // If not in design or load mode the
    // NB: Messo anche qui perchè venga impostata la connessione di default anche a runtime
    if not((csDesigning in ComponentState) or (csLoading in ComponentState)) then
      TioConnectionManager.UseConnection(Self.Name);
  end;
end;

procedure TioCustomConnectionDef.SetSynchroStrategy_Client(const ASynchroStrategy_Client: IioSynchroStrategy);
begin
  if ASynchroStrategy_Client <> FSynchroStrategy_Client then
  begin
    if FSynchroStrategy_Client <> nil then
      FSynchroStrategy_Client.RemoveFreeNotification(Self);

    FSynchroStrategy_Client := ASynchroStrategy_Client;

    if FSynchroStrategy_Client <> nil then
      FSynchroStrategy_Client.FreeNotification(Self);
  end;
end;

{ TioHttpConnectionDef }

constructor TioHttpConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Persistent := True;
end;

procedure TioHttpConnectionDef.RegisterConnectionDef;
begin
  // Fire the OnBeforeRegister event if implemented
  DoBeforeRegister;
  // Register the ConnectionDef
  TioConnectionManager.NewHttpConnection(BaseURL, AsDefault, SynchroStrategy_Client, Persistent, Name);
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioSQLiteConnectionDef }

function TioSQLiteConnectionDef.DBBuilder: IioDBBuilderEngine;
begin
  inherited
  // Only to elevate the method visibility
end;

procedure TioSQLiteConnectionDef.RegisterConnectionDef;
begin
  // Fire the OnBeforeRegister event if implemented
  DoBeforeRegister;
  // Register the ConnectionDef
  ConnectionDef := TioConnectionManager.NewSQLiteConnectionDef(GetFullPathDatabase, AsDefault, SynchroStrategy_Client, Persistent, Pooled, Name);
  // Encript
  if not Encrypt.IsEmpty then
    ConnectionDef.Params.Values['Encrypt'] := Encrypt;
  // NewPassword
  if not NewPassword.IsEmpty then
    ConnectionDef.Params.NewPassword := NewPassword;
  // Password
  if not Password.IsEmpty then
    ConnectionDef.Params.Password := Password;
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioFirebirdConnectionDef }

constructor TioFirebirdConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Port := 3050;
end;

function TioFirebirdConnectionDef.DBBuilder: IioDBBuilderEngine;
begin
  inherited
  // Only to elevate the method visibility
end;

procedure TioFirebirdConnectionDef.RegisterConnectionDef;
begin
  // Fire the OnBeforeRegister event if implemented
  DoBeforeRegister;
  // Register the ConnectionDef
  ConnectionDef := TioConnectionManager.NewFirebirdConnectionDef(Server, GetFullPathDatabase, UserName, Password, CharSet,
    AsDefault, SynchroStrategy_Client, Persistent, Pooled, Name);
  // OSAuthent
  case OSAuthent of
    TioOSAuthent.oaNo:
      ConnectionDef.Params.Values['OSAuthent'] := 'No';
    TioOSAuthent.oaYes:
      ConnectionDef.Params.Values['OSAuthent'] := 'Yes';
  end;
  // Port
  ConnectionDef.Params.Values['Port'] := Port.ToString;
  // Protocol
  case Protocol of
    TioProtocol.pTCPIP:
      ConnectionDef.Params.Values['Protocol'] := 'TCPIP';
    TioProtocol.pLocal:
      ConnectionDef.Params.Values['Protocol'] := 'Local';
    TioProtocol.pNetBEUI:
      ConnectionDef.Params.Values['Protocol'] := 'NetBEUI';
    TioProtocol.pSPX:
      ConnectionDef.Params.Values['Protocol'] := 'SPX';
  end;
  // SQL dialect
  case SQLDialect of
    TioSQLDialect.sqlDialect3:
      ConnectionDef.Params.Values['SQLDialect'] := '3';
    TioSQLDialect.sqlDialect2:
      ConnectionDef.Params.Values['SQLDialect'] := '2';
    TioSQLDialect.sqlDialect1:
      ConnectionDef.Params.Values['SQLDialect'] := '1';
  end;
  // OpenMode
  if AutoCreateDB.Enabled then
    ConnectionDef.Params.Values['OpenMode'] := 'OpenOrCreate'
  else
    ConnectionDef.Params.Values['OpenMode'] := 'Open';
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioMySQLConnectionDef }

constructor TioMySQLConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Port := 3306;
end;

function TioMySQLConnectionDef.DBBuilder: IioDBBuilderEngine;
begin
  inherited
  // Only to elevate the method visibility
end;

procedure TioMySQLConnectionDef.RegisterConnectionDef;
begin
  // Fire the OnBeforeRegister event if implemented
  DoBeforeRegister;
  // Register the ConnectionDef
  ConnectionDef := TioConnectionManager.NewMySQLConnectionDef(Server, GetFullPathDatabase, UserName, Password, CharSet,
    AsDefault, SynchroStrategy_Client, Persistent, Pooled, Name);
  // Port
  ConnectionDef.Params.Values['Port'] := Port.ToString;
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioSQLMonitor }

constructor TioSQLMonitor.Create(AOwner: TComponent);
begin
  inherited;
  FMode := TioMonitorMode.mmDisabled;
end;

function TioSQLMonitor.Get_Version: String;
begin
  Result := io.Version;
end;

procedure TioSQLMonitor.SetMode(const Value: TioMonitorMode);
begin
  FMode := Value;
{$IFDEF MSWINDOWS}
  // Set the monitor mode
  if not(csDesigning in ComponentState) then
    io.Connections.Monitor.Mode := FMode;
{$ENDIF}
end;

{ TioDBBuilderProperty }

constructor TioDBBuilderProperty.Create;
begin
  inherited;
  FEnabled := False;
  FIndexes := True;
  FForeignKeys := True;
end;

end.
