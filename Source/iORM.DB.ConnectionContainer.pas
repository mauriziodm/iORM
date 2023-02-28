{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.DB.ConnectionContainer;

interface

uses
{$IFDEF MSWINDOWS}
  FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient,
  FireDAC.Moni.FlatFile,
{$ENDIF}
  System.Generics.Collections,
  FireDAC.Comp.Client,
  iORM.DB.Interfaces,
  iORM.CommonTypes, System.SysUtils;

type
{$IFDEF MSWINDOWS}
  // Il TioConnectionMonitor incapsula la funzionalità di tracing e monitoring di quanto avviene sulle connessioni
  TioConnectionMonitorRef = class of TioConnectionMonitor;

  TioConnectionMonitor = class
  private
    class var FMoniRemoteClientLink: TFDMoniRemoteClientLink; // Not to use directly (use function "RemoteClientLink"
    class var FMoniFlatFileClientLink: TFDMoniFlatFileClientLink; // Not to use directly (use function "RemoteFlatFileLink"
    class var FMode: TioMonitorMode;
    class function GetMode: TioMonitorMode; static;
    class procedure SetMode(const Value: TioMonitorMode); static;
  protected
    class procedure FreeFDMoniClientLinks;
  public
    class function RemoteClientLink: TFDMoniRemoteClientLink;
    class function RemoteFlatFileLink: TFDMoniFlatFileClientLink;
    class property Mode: TioMonitorMode read GetMode write SetMode;
  end;
{$ENDIF}

  // IL connection manager ha il compito di mantenere i parametri delle connessioni impostate all'avvio
  // dell'applicazione per una loro successiva istanziazione e di gestione del connection pooling
  // se richiesto.
  // In realtà questa classe utilizza il TFDManager fornito da FireDAC e non fa molto altro
  // se non aggiungere un campo per mantenere un riferimento al nome della ConnectionDef
  // di default. Una gestione di una connessione di default mi serviva perchè volevo fare in modo che
  // fosse necessario specificare esplicitamente una ConnectionDef (con un attribute) per ogni classe/entità
  // e quindi ho deciso di mantenere un riferimento al nome della connectionDef di dafault in modo che per tutte le classi
  // che non indicano una connection esplicitamente utilizzino quella di default e quindi anche che normalmente nelle applicazioni
  // che utilizzano una sola ConnectionDef non è necessario specificare nulla nella dichiarazione delle classi perchè
  // tanto utilizzano automaticamente la ConnectionDef di default (l'unica).
  TioConnectionManagerContainer = TDictionary<String, TioConnectionInfo>;
  TioPerThreadCurrentConnectionName = TDictionary<TThreadID, String>;
  TioConnectionManagerRef = class of TioConnectionManager;

  TioConnectionManager = class // NB: Is thread-safe
  strict private
    class var FCurrentConnectionName: String;
    class var FPerThreadCurrentConnectionName: TioPerThreadCurrentConnectionName;
    class var FConnectionManagerContainer: TioConnectionManagerContainer;
    // NB: Questo container in realtà contiene solo il tipo di DB (cdtFirebird, cdtSQLite ecc.ecc.) in modo da poter fare dei confronti veloci nelle factory e per non dipendere direttamente dal DriverID delle connectionDef di FireDAC
    class var FShowWaitProc: TProc;
    class var FHideWaitProc: TProc;
    class function NewCustomConnectionDef(const AConnectionName: String; const APooled: Boolean; const AAsDefault: Boolean): IIoConnectionDef;
    class function CheckConnectionName(AConnectionName: String): String;
    class procedure _Lock;
    class procedure _Unlock;
  protected
    class procedure CreateInternalContainer;
    class procedure FreeInternalContainer;
  public
    class function NewSQLiteConnectionDef(const ADatabase: String; const AAsDefault: Boolean = True; const APersistent: Boolean = False;
      const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class function NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class function NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword: String; const AAsDefault: Boolean = True;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class function NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True;
      const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class procedure NewRemoteConnection(const ABaseURL: String; const AAsDefault: Boolean = True; const APersistent: Boolean = True;
      const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME);
    class function GetCurrentConnectionDef: IIoConnectionDef;
    class function GetConnectionDefByName(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
    class function IsEmptyConnectionName(const AConnectionName: String): Boolean;
    class function GetCurrentConnectionName: String;
    class function GetCurrentConnectionNameIfEmpty(const AConnectionDefName: String): String;
    class function GetDatabaseFileName(const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): String;
    class function GetConnectionInfo(AConnectionName: String): TioConnectionInfo;
    class procedure Use(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME);
    class procedure SetShowHideWaitProc(const AShowWaitProc: TProc; const AHideWaitProc: TProc);
    class procedure ShowWaitProc;
    class procedure HideWaitProc;
    class procedure ThreadUse(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME);
    class procedure ThreadUseClear;
{$IFDEF MSWINDOWS}
    class function Monitor: TioConnectionMonitorRef;
{$ENDIF}
  end;

  // Il ConnectionContainer contiene le connessioni attive in un dato momento, cioè quelle
  // connections che sono effettivamente in uso al momento; il loro ciclo di vita (delle connessioni)
  // coincide con il ciclo della transazion in essere sulla connessione stessa, quando la transazione
  // termina (con un commit/rollback) anche la connessione viene elimimata.
  // Le connessioni sono separate per thread in modo da predisporeìle fin da subito ad eventuali sviluppi in
  // senso multithreading.
  // NB: Questa classe non gestisce l'eventuale connection pooling e non contiene i parametri della/e connesioni
  // da creare ma è semplicemente un repository delle sole connessioni in uso in modo che chiamate ricorsive
  // all'ORM all'interno di una singola operazione (ad esempio quando carichiamo una classe che ha al suo interno
  // proprietà con relazioni il caricamento degli oggetti dettaglio avviene con una chiamata ricorsiva all'ORM
  // e questa chicìamata deve svolgersi all'interno della stessa transazione del master e quindi con la stessa connection)
  // possano accedere allo stesso oggetto connection (via factory).
  TioInternalContainerType = TDictionary<String, IioConnection>;
  TioConnectionContainerRef = class of TioConnectionContainer;

  TioConnectionContainer = class
  strict private
    class var FContainer: TioInternalContainerType;
    class function ConnectionNameToContainerKey(AConnectionName: String): String;
    class procedure _Lock;
    class procedure _Unlock;
  protected
    class procedure CreateInternalContainer;
    class procedure FreeInternalContainer;
  public
    class procedure AddConnection(const AConnection: IioConnection);
    class procedure FreeConnection(const AConnection: IioConnection);
    class function GetConnection(const AConnectionName: String): IioConnection;
    class function ConnectionExist(const AConnectionName: String): Boolean;
  end;

implementation

uses
  System.Classes, iORM.Exceptions, iORM.Utilities;

{ TioConnectionContainer }

class procedure TioConnectionContainer.AddConnection(const AConnection: IioConnection);
begin
  _Lock;
  try
    FContainer.Add(Self.ConnectionNameToContainerKey(AConnection.GetConnectionInfo.ConnectionName), AConnection);
  finally
    _Unlock;
  end;
end;

class function TioConnectionContainer.ConnectionExist(const AConnectionName: String): Boolean;
begin
  _Lock;
  try
    Result := FContainer.ContainsKey(Self.ConnectionNameToContainerKey(AConnectionName));
  finally
    _Unlock;
  end;
end;

class function TioConnectionContainer.ConnectionNameToContainerKey(AConnectionName: String): String;
begin
  Result := AConnectionName + '-' + TioUtilities.GetThreadID.ToString;
end;

class procedure TioConnectionContainer.CreateInternalContainer;
begin
  Self.FContainer := TioInternalContainerType.Create;
end;

class procedure TioConnectionContainer.FreeConnection(const AConnection: IioConnection);
begin
  _Lock;
  try
    // Remove the reference to the connection
    // NB: Viene richiamato alla distruzione di una connessione perchè altrimenti avrei un riferimento incrociato
    // tra la connessione che, attraverso il proprio QueryContainer, manteine un riferimento a tutte le query
    // che sono state preparate ela query che mantiene un riferimento alla connessione al suo interno; in pratica
    // questo causava molti memory leaks perchè questi oggetti rimanevano in vita perenne in quanto si sostenevano
    // a vicenda e rendevano inefficace il Reference Count
    if AConnection.IsDBConnection then
      AConnection.AsDBConnection.QueryContainer.CleanQueryConnectionsRef;
    // RImuove la connessione causandone anche la distruzione perchè a questo punto non c'è
    // più alcun riferimento ad essa.
    FContainer.Remove(Self.ConnectionNameToContainerKey(AConnection.GetConnectionInfo.ConnectionName));
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionContainer.FreeInternalContainer;
var
  AConnection: IioConnection;
begin
  // Remove the reference to the connection
  // NB: Viene richiamato alla distruzione di una connessione perchè altrimenti avrei un riferimento incrociato
  // tra la connessione che, attraverso il proprio QueryContainer, manteine un riferimento a tutte le query
  // che sono state preparate ela query che mantiene un riferimento alla connessione al suo interno; in pratica
  // questo causava molti memory leaks perchè questi oggetti rimanevano in vita perenne in quanto si sostenevano
  // a vicenda e rendevano inefficace il Reference Count
  for AConnection in Self.FContainer.Values do
    Self.FreeConnection(AConnection);
  // Free the Container
  Self.FContainer.Free;
end;

class function TioConnectionContainer.GetConnection(const AConnectionName: String): IioConnection;
begin
  _Lock;
  try
    Result := FContainer.Items[Self.ConnectionNameToContainerKey(AConnectionName)];
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionContainer._Lock;
begin
  TMonitor.Enter(FContainer);
end;

class procedure TioConnectionContainer._Unlock;
begin
  TMonitor.Exit(FContainer);
end;

{ TioConnectionManager }

class function TioConnectionManager.CheckConnectionName(AConnectionName: String): String;
var
  LConnectionInfo: TioConnectionInfo;
begin
  // NB: Lasciare anche se il parametro è già defaultizzato perchè in alcune circostanze serve
  if IsEmptyConnectionName(AConnectionName) then
    Result := IO_CONNECTIONDEF_DEFAULTNAME
  else
    Result := AConnectionName;
  // Check and get the ConnectionIfo instance relative to the ConnectionName
  if FConnectionManagerContainer.ContainsKey(Result) then
    LConnectionInfo := FConnectionManagerContainer.Items[Result]
  else
    raise EioException.Create(Self.ClassName + ': ConnectionInfo (TioConnectionInfo) for "' + Result + '" not found!');
  // if the connection is of type then also check if it is present in the FireDAC's ConnectionDefs
  if (LConnectionInfo.ConnectionType <> TioConnectionType.cdtRemote) and not Assigned(FDManager.ConnectionDefs.FindConnectionDef(Result)) then
    raise EioException.Create(Self.ClassName + ': Connection params definition "' + Result + '" not found!');
end;

class procedure TioConnectionManager.CreateInternalContainer;
begin
  FConnectionManagerContainer := TioConnectionManagerContainer.Create;
  FPerThreadCurrentConnectionName := TioPerThreadCurrentConnectionName.Create;
end;

class procedure TioConnectionManager.FreeInternalContainer;
begin
  FConnectionManagerContainer.Free;
  FPerThreadCurrentConnectionName.Free;
end;

class function TioConnectionManager.GetConnectionDefByName(AConnectionName: String): IIoConnectionDef;
begin
  _Lock;
  try
    Result := nil;
    // If desired ConnectionName is empty then get then Default one.
    AConnectionName := GetCurrentConnectionNameIfEmpty(AConnectionName);
    // Get the ConnectionDef info's
    Result := FDManager.ConnectionDefs.FindConnectionDef(AConnectionName);
    // Connection not found
    if not Assigned(Result) then
      raise EioException.Create(Self.ClassName + ': ConnectionDef not found.');
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetConnectionInfo(AConnectionName: String): TioConnectionInfo;
begin
  _Lock;
  try
    // If desired ConnectionName is empty then get then Default one.
    AConnectionName := GetCurrentConnectionNameIfEmpty(AConnectionName);
    // Return the desired connection type
    if not FConnectionManagerContainer.TryGetValue(AConnectionName, Result) then
      raise EioException.Create(Self.ClassName, 'GetConnectionInfo',
        Format('Connection named "%s" not found.'#13#13'It could be that It has not been defined or that its registration in the "connection manager" has not yet taken place (sequence problem, you are trying to use the connection before this has registered).',
        [AConnectionName]));
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetDatabaseFileName(const AConnectionName: String): String;
begin
  _Lock;
  try
    Result := Self.GetConnectionDefByName(AConnectionName).Params.Database;
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetCurrentConnectionDef: IIoConnectionDef;
begin
  _Lock;
  try
    Result := GetConnectionDefByName(GetCurrentConnectionName);
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.GetCurrentConnectionName: String;
begin
  _Lock;
  try
    if not FPerThreadCurrentConnectionName.TryGetValue(TioUtilities.GetThreadID, Result) then
      Result := FCurrentConnectionName;
  finally
    _Unlock
  end;
end;

class function TioConnectionManager.GetCurrentConnectionNameIfEmpty(const AConnectionDefName: String): String;
begin
  _Lock;
  try
    // If AConnectionName param is not specified (is empty) then
    // use the default connection def
    if IsEmptyConnectionName(AConnectionDefName) then
      Result := GetCurrentConnectionName
    else
      Result := AConnectionDefName;
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager.HideWaitProc;
begin
  if Assigned(FHideWaitProc) then
    FHideWaitProc;
end;

class procedure TioConnectionManager.ShowWaitProc;
begin
  if Assigned(FShowWaitProc) then
    FShowWaitProc;
end;

class procedure TioConnectionManager.ThreadUse(AConnectionName: String);
begin
  _Lock;
  try
    // Verifica ed eventualmente defaultizza il parametro
    AConnectionName := CheckConnectionName(AConnectionName);
    // Set the current connection fot the currend thread
    FPerThreadCurrentConnectionName.AddOrSetValue(TioUtilities.GetThreadID, AConnectionName);
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager.ThreadUseClear;
begin
  _Lock;
  try
    FPerThreadCurrentConnectionName.Remove(TioUtilities.GetThreadID);
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager._Lock;
begin
  TMonitor.Enter(FConnectionManagerContainer);
end;

class procedure TioConnectionManager._Unlock;
begin
  TMonitor.Exit(FConnectionManagerContainer);
end;

class function TioConnectionManager.IsEmptyConnectionName(const AConnectionName: String): Boolean;
begin
  Result := (AConnectionName.IsEmpty or (AConnectionName = IO_CONNECTIONDEF_DEFAULTNAME));
end;

{$IFDEF MSWINDOWS}

class function TioConnectionManager.Monitor: TioConnectionMonitorRef;
begin
  Result := TioConnectionMonitor;
end;
{$ENDIF}

class function TioConnectionManager.NewCustomConnectionDef(const AConnectionName: String; const APooled: Boolean; const AAsDefault: Boolean): IIoConnectionDef;
begin
  // Create the ConnectionDef object and set his name
  // NB: The name of the connectionDef should never be changed after
  Result := FDManager.ConnectionDefs.FindConnectionDef(AConnectionName);
  if not Assigned(Result) then
    Result := FDManager.ConnectionDefs.AddConnectionDef;
  Result.Name := AConnectionName;
  Result.Params.Pooled := APooled;
  // If the AsDefault param is True or this is the first ConnectionDef of the application
  // then set it as default
  if AAsDefault or (Self.FCurrentConnectionName = '') then
    Self.FCurrentConnectionName := AConnectionName;
end;

class function TioConnectionManager.NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True;
  const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  _Lock;
  try
    Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'FB';
    Result.Params.Values['Server'] := AServer;
    Result.Params.Database := ADatabase;
    Result.Params.UserName := AUserName;
    Result.Params.Password := APassword;
    Result.Params.Values['Protocol'] := 'TCPIP';
    if ACharSet <> '' then
      Result.Params.Values['CharacterSet'] := ACharSet;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtFirebird, APersistent, kgtBeforeInsert));
  finally
    _Unlock
  end;
end;

class function TioConnectionManager.NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String; const AAsDefault: Boolean = True;
  const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  _Lock;
  try
    Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'MySQL';
    Result.Params.Values['Server'] := AServer;
    Result.Params.Database := ADatabase;
    Result.Params.UserName := AUserName;
    Result.Params.Password := APassword;
    if ACharSet <> '' then
      Result.Params.Values['CharacterSet'] := ACharSet;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtMySQL, APersistent, kgtUndefined));
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager.NewRemoteConnection(const ABaseURL: String; const AAsDefault: Boolean = True; const APersistent: Boolean = True;
  const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME);
var
  LConnectionInfo: TioConnectionInfo;
begin
  _Lock;
  try
    // If the AsDefault param is True or this is the first ConnectionDef of the application
    // then set it as default
    if AAsDefault or (Self.FCurrentConnectionName = '') then
      Self.FCurrentConnectionName := AConnectionName;
    // Setup the connection info
    LConnectionInfo := TioConnectionInfo.Create(AConnectionName, cdtRemote, APersistent, kgtUndefined);
    LConnectionInfo.BaseURL := ABaseURL;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, LConnectionInfo);
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.NewSQLiteConnectionDef(const ADatabase: String; const AAsDefault: Boolean = True; const APersistent: Boolean = False;
  const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  _Lock;
  try
    Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'SQLite';
    Result.Params.Database := ADatabase;
    Result.Params.Values['FailIfMissing'] := 'False';
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtSQLite, APersistent, kgtAfterInsert));
  finally
    _Unlock;
  end;
end;

class function TioConnectionManager.NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword: String; const AAsDefault: Boolean = True;
  const APersistent: Boolean = False; const APooled: Boolean = False; const AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  _Lock;
  try
    Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
    Result.Params.DriverID := 'MSSQL';
    Result.Params.Values['Server'] := AServer;
    Result.Params.Database := ADatabase;
    Result.Params.UserName := AUserName;
    Result.Params.Password := APassword;
    // Add the connection type to the internal container
    FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName, cdtSQLServer, APersistent, kgtAfterInsert));
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager.Use(AConnectionName: String);
begin
  _Lock;
  try
    // Verifica ed eventualmente defaultizza il parametro
    AConnectionName := CheckConnectionName(AConnectionName);
    // Set the connection as default
    FCurrentConnectionName := AConnectionName;
  finally
    _Unlock;
  end;
end;

class procedure TioConnectionManager.SetShowHideWaitProc(const AShowWaitProc: TProc; const AHideWaitProc: TProc);
begin
  FShowWaitProc := AShowWaitProc;
  FHideWaitProc := AHideWaitProc;
end;

{ TioConnectionMonitor }

{$IFDEF MSWINDOWS}

class procedure TioConnectionMonitor.FreeFDMoniClientLinks;
begin
  // Destroy existing FDMoniClientLinks
  if Assigned(FMoniRemoteClientLink) then
    FreeAndNil(FMoniRemoteClientLink);
  if Assigned(FMoniFlatFileClientLink) then
    FreeAndNil(FMoniFlatFileClientLink);
end;

class function TioConnectionMonitor.GetMode: TioMonitorMode;
begin
  Result := FMode;
end;

class function TioConnectionMonitor.RemoteClientLink: TFDMoniRemoteClientLink;
begin
  if not Assigned(FMoniRemoteClientLink) then
    FMoniRemoteClientLink := TFDMoniRemoteClientLink.Create(nil);
  Result := FMoniRemoteClientLink;
end;

class function TioConnectionMonitor.RemoteFlatFileLink: TFDMoniFlatFileClientLink;
begin
  if not Assigned(FMoniFlatFileClientLink) then
    FMoniFlatFileClientLink := TFDMoniFlatFileClientLink.Create(nil);
  Result := FMoniFlatFileClientLink;
end;

class procedure TioConnectionMonitor.SetMode(const Value: TioMonitorMode);
begin
  // Only if the new value is different
  if Value = FMode then
    Exit;
  // Set the value
  FMode := Value;
  // Disable tracing for all client link
  if Assigned(FMoniRemoteClientLink) then
    FMoniRemoteClientLink.Tracing := False;
  if Assigned(FMoniFlatFileClientLink) then
    FMoniFlatFileClientLink.Tracing := False;
  // Enable the proper client link depending by Mode
  case FMode of
    mmRemote:
      RemoteClientLink.Tracing := True;
    mmFlatFile:
      RemoteFlatFileLink.Tracing := True;
  end;
end;
{$ENDIF}
{ TioInUseConnectionRegister }

initialization

// NB: Per evitare l'errore di FireDAC sul WaitCursor
FDManager.SilentMode := True;

TioConnectionContainer.CreateInternalContainer;
TioConnectionManager.CreateInternalContainer;

finalization

TioConnectionContainer.FreeInternalContainer;
TioConnectionManager.FreeInternalContainer;
{$IFDEF MSWINDOWS}
TioConnectionMonitor.FreeFDMoniClientLinks;
{$ENDIF}

end.
